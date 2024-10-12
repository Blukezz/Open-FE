print("Open FE: A free and open source FE hub.")

local rolibwaita = loadstring(game:HttpGet("https://codeberg.org/Blukez/rolibwaita/raw/branch/master/Source.lua"))()
local HttpService = game:GetService("HttpService")
local Global = getgenv()
local ConfigFile = "OpenFE"

local Config = {
	ReturnOnDeath = true,
	Flinging = false,
	PresetFling = false,
	Animations = true,
	WaitTime = 0.3,
	TeleportOffsetRadius = 20,
	NoCollisions = true,
	AntiVoiding = true,
	SetSimulationRadius = true,
	DisableCharacterScripts = true,
	AccessoryFallbackDefaults = true,
	OverlayFakeCharacter = true,
	HatPreset = 1,
}

local function WaitUntilIsFile(File: string, Destination: boolean)
	repeat
		wait(0.1)
	until isfile(File) == Destination
end

local function CreateConfigurationFile()
	writefile(ConfigFile, HttpService:JSONEncode(Config))
	WaitUntilIsFile(ConfigFile, true)
end

local function DeleteConfigurationFile()
	delfile(ConfigFile)
	WaitUntilIsFile(ConfigFile, false)
end

local function LoadConfigurationFile()
	Config = HttpService:JSONDecode(readfile(ConfigFile))
end

local function ConfigurationFileToGlobals()
	Global.Configuration = HttpService:JSONDecode(readfile(ConfigFile))
end

local function SyncConfiguration()
	DeleteConfigurationFile()
	CreateConfigurationFile()
	ConfigurationFileToGlobals()
end

local function Reanimate()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Blukezz/MessageToSelf-DontDeleteMe/refs/heads/main/Module.luau"))()
end

if isfile(ConfigFile) then
	LoadConfigurationFile()
else
	CreateConfigurationFile()
end

ConfigurationFileToGlobals()

local Window = rolibwaita:NewWindow({
	Name = "Open FE",
	Keybind = "P",
	UseCoreGui = true,
	PrintCredits = true,
})

local ReanimationTab = Window:NewTab({
	Name = "Reanimation",
	Icon = "rbxassetid://13300920666",
})

local ScriptsTab = Window:NewTab({
	Name = "Reanimation",
	Icon = "rbxassetid://13300920666",
})

local ReanimateSection = ReanimationTab:NewSection({
	Name = "Start Reanimation",
	Description = "Krypton Reanimation by xyzkade.",
})

ReanimateSection:NewButton({
	Name = "Reanimate",
	Callback = Reanimate,
})

local ReanimationOptions = ReanimationTab:NewSection({
	Name = "Krypton Reanimation Configuration",
	Description = "If you don't know what a setting means, don't change it.",
})

ReanimationOptions:NewToggle({
	Name = "Return On Death",
	Description = "Returns to previous location upon stopping the reanimate.",
	CurrentState = Global.Configuration.ReturnOnDeath,
	Callback = function(Value)
		Config.ReturnOnDeath = Value
		SyncConfiguration()
	end,
})

ReanimationOptions:NewToggle({
	Name = "Fling",
	Description = "Enables all fling.",
	CurrentState = Global.Configuration.Flinging,
	Callback = function(Value)
		Config.Flinging = Value
		SyncConfiguration()
	end,
})

ReanimationOptions:NewToggle({
	Name = "Click Fling",
	Description = "When holding M1 before a respawn, your real rig will fling where your mouse is.",
	CurrentState = Global.Configuration.PresetFling,
	Callback = function(Value)
		Config.PresetFling = Value
		SyncConfiguration()
	end,
})

ReanimationOptions:NewToggle({
	Name = "Default Animations",
	Description = "Default animations, not needed when using a scirpt.",
	CurrentState = Global.Configuration.Animations,
	Callback = function(Value)
		Config.Animations = Value
		SyncConfiguration()
	end,
})

ReanimationOptions:NewTextBox({
	Name = "Wait Time",
	Description = "Yeilds during each respawn to ensure stability.",
	PlaceholderText = "Number of seconds..",
	Text = Global.Configuration.WaitTime,
	Trigger = "FocusLost",
	Callback = function(Value)
		Config.WaitTime = tonumber(Value)
		SyncConfiguration()
	end,
})

ReanimationOptions:NewTextBox({
	Name = "Teleport Offset Radius",
	Description = "Range of where your real rig will be teleported to your fake rig.",
	PlaceholderText = "Number of studs..",
	Text = Global.Configuration.TeleportOffsetRadius,
	Trigger = "FocusLost",
	Callback = function(Value)
		Config.TeleportOffsetRadius = tonumber(Value)
		SyncConfiguration()
	end,
})

ReanimationOptions:NewToggle({
	Name = "No Collisions",
	Description = "Noclip for the fake rig.",
	CurrentState = Global.Configuration.NoCollisions,
	Callback = function(Value)
		Config.NoCollisions = Value
		SyncConfiguration()
	end,
})

ReanimationOptions:NewToggle({
	Name = "AntiVoiding",
	Description = "Stops you from falling in the void.",
	CurrentState = Global.Configuration.AntiVoiding,
	Callback = function(Value)
		Config.AntiVoiding = Value
		SyncConfiguration()
	end,
})

ReanimationOptions:NewToggle({
	Name = "Disable Character Scripts",
	Description = "Disables any local scripts from the server rig.",
	CurrentState = Global.Configuration.DisableCharacterScripts,
	Callback = function(Value)
		Config.DisableCharacterScripts = Value
		SyncConfiguration()
	end,
})

ReanimationOptions:NewToggle({
	Name = "Accessory Fallback Defaults",
	Description = "Creates client sidded accessories in case you dont have them.",
	CurrentState = Global.Configuration.AccessoryFallbackDefaults,
	Callback = function(Value)
		Config.AccessoryFallbackDefaults = Value
		SyncConfiguration()
	end,
})

ReanimationOptions:NewToggle({
	Name = "Overlay Fake Character",
	Description = "Be able to see your fake rig when respawning.",
	CurrentState = Global.Configuration.OverlayFakeCharacter,
	Callback = function(Value)
		Config.OverlayFakeCharacter = Value
		SyncConfiguration()
	end,
})
