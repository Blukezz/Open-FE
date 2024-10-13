print("Open FE: A free and open source FE hub.")

local rolibwaita = loadstring(game:HttpGet("https://codeberg.org/Blukez/rolibwaita/raw/branch/master/Source.lua"))()
local HttpService = game:GetService("HttpService")
local Global = getgenv()
local ConfigFolder = "OpenFE"

local Configs = {
	["Reanimation"] = {
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
		OverlayFakeCharacter = false,
		HatPreset = "Default",
		UseCustomHats = false
	},
	["General"] = {
		Music = true,
		HidePart1 = true,
	},
}

-- Functions and Init --
local function WaitUntilIsFile(File: string, Destination: boolean)
	repeat
		wait(0.1)
	until isfile(File) == Destination
end

local function GetConfigData(Type: string)
	return { File = ConfigFolder .. "/" .. Type, Config = Configs[Type], Type = Type }
end

local function CreateConfigurationFile(Data: table)
	writefile(Data.File, HttpService:JSONEncode(Data.Config))
	WaitUntilIsFile(Data.File, true)
end

local function DeleteConfigurationFile(Data: table)
	delfile(Data.File)
	WaitUntilIsFile(Data.File, false)
end

local function LoadConfigurationFile(Data: table)
	Data.Config = HttpService:JSONDecode(readfile(Data.File))
end

local function ConfigurationFileToGlobals(Data: table)
	if Data.Type == "Reanimation" then
		Global.Configuration = HttpService:JSONDecode(readfile(Data.File))
	elseif Data.Type == "General" then
		Global.OpenFE = HttpService:JSONDecode(readfile(Data.File))
	end
end

local function SyncConfiguration(Type: string)
	local Data = GetConfigData(Type)
	DeleteConfigurationFile(Data)
	CreateConfigurationFile(Data)
	ConfigurationFileToGlobals(Data)
end

local function ForEveryConfigDo(Callback)
	for i, v in pairs(Configs) do
		local Data = GetConfigData(i)
		Callback(Data)
	end
end

local function AllConfigurationFilesToGlobals()
	ForEveryConfigDo(function(Data)
		ConfigurationFileToGlobals(Data)
	end)
end

local function LoadAllConfigurationFiles()
	ForEveryConfigDo(function(Data)
		LoadConfigurationFile(Data)
	end)
end

local function CreateAllConfigurationFiles()
	ForEveryConfigDo(function(Data)
		CreateConfigurationFile(Data)
	end)
end

local function Reanimate()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Blukezz/MessageToSelf-DontDeleteMe/refs/heads/main/Module.luau"))()
end

if Hats then -- Check for custom hat presets
	Configs["Reanimation"].UseCustomHats = true
	Global.CustomHats = Hats
else
	Configs["Reanimation"].UseCustomHats = false
end

if isfile(ConfigFolder) then
	LoadAllConfigurationFiles()
else
	makefolder(ConfigFolder)
	CreateAllConfigurationFiles()
end

AllConfigurationFilesToGlobals()

local Window = rolibwaita:NewWindow({
	Name = "Open FE",
	Keybind = "P",
	UseCoreGui = true,
	PrintCredits = true,
})

do -- Reanimation Settings --
	local ReanimationTab = Window:NewTab({
		Name = "Reanimation",
		Icon = "rbxassetid://101572999709694",
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

	ReanimationOptions:NewDropdown({
		Name = "Hat Preset",
		Description = "Join Discord for more information on this.",
		Choices = {"Default", "Free"},
		CurrentState = "Default",
		Callback = function(Value)
			Configs["Reanimation"].HatPreset = Value
			SyncConfiguration("Reanimation")
		end,
	})

	if Hats then
		ReanimationOptions:NewToggle({
			Name = "Use Custom Hat Preset",
			Description = "Whether to use you custom hat preset.",
			CurrentState = Configs["Reanimation"].UseCustomHats,
			Callback = function(Value)
				Configs["Reanimation"].UseCustomHats = Value
				SyncConfiguration("Reanimation")
			end,
		})
	end

	ReanimationOptions:NewToggle({
		Name = "Return On Death",
		Description = "Returns to previous location upon stopping the reanimate.",
		CurrentState = Configs["Reanimation"].ReturnOnDeath,
		Callback = function(Value)
			Configs["Reanimation"].ReturnOnDeath = Value
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewToggle({
		Name = "Fling",
		Description = "Enables all fling.",
		CurrentState = Configs["Reanimation"].Flinging,
		Callback = function(Value)
			Configs["Reanimation"].Flinging = Value
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewToggle({
		Name = "Click Fling",
		Description = "When holding M1 before a respawn, your real rig will fling where your mouse is.",
		CurrentState = Configs["Reanimation"].PresetFling,
		Callback = function(Value)
			Configs["Reanimation"].PresetFling = Value
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewToggle({
		Name = "Default Animations",
		Description = "Default animations, not needed when using a scirpt.",
		CurrentState = Configs["Reanimation"].Animations,
		Callback = function(Value)
			Configs["Reanimation"].Animations = Value
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewTextBox({
		Name = "Wait Time",
		Description = "Yeilds during each respawn to ensure stability.",
		PlaceholderText = "Number of seconds..",
		Text = Configs["Reanimation"].WaitTime,
		Trigger = "FocusLost",
		Callback = function(Value)
			Configs["Reanimation"].WaitTime = tonumber(Value)
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewTextBox({
		Name = "Teleport Offset Radius",
		Description = "Range of where your real rig will be teleported to your fake rig.",
		PlaceholderText = "Number of studs..",
		Text = Configs["Reanimation"].TeleportOffsetRadius,
		Trigger = "FocusLost",
		Callback = function(Value)
			Configs["Reanimation"].TeleportOffsetRadius = tonumber(Value)
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewToggle({
		Name = "No Collisions",
		Description = "Noclip for the fake rig.",
		CurrentState = Configs["Reanimation"].NoCollisions,
		Callback = function(Value)
			Configs["Reanimation"].NoCollisions = Value
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewToggle({
		Name = "AntiVoiding",
		Description = "Stops you from falling in the void.",
		CurrentState = Configs["Reanimation"].AntiVoiding,
		Callback = function(Value)
			Configs["Reanimation"].AntiVoiding = Value
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewToggle({
		Name = "Disable Character Scripts",
		Description = "Disables any local scripts from the server rig.",
		CurrentState = Configs["Reanimation"].DisableCharacterScripts,
		Callback = function(Value)
			Configs["Reanimation"].DisableCharacterScripts = Value
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewToggle({
		Name = "Accessory Fallback Defaults",
		Description = "Creates client sidded accessories in case you dont have them.",
		CurrentState = Configs["Reanimation"].AccessoryFallbackDefaults,
		Callback = function(Value)
			Configs["Reanimation"].AccessoryFallbackDefaults = Value
			SyncConfiguration("Reanimation")
		end,
	})

	ReanimationOptions:NewToggle({
		Name = "Overlay Fake Character",
		Description = "Be able to see your fake rig when respawning.",
		CurrentState = Configs["Reanimation"].OverlayFakeCharacter,
		Callback = function(Value)
			Configs["Reanimation"].OverlayFakeCharacter = Value
			SyncConfiguration("Reanimation")
		end,
	})
end

do -- Converted Scripts --
	local ScriptsTab = Window:NewTab({
		Name = "Scripts",
		Icon = "rbxassetid://93166595134738",
	})

	local ScriptsSection = ScriptsTab:NewSection({
		Name = "Converted Scripts",
		Description = "Scripts made to work with a reanimate.",
	})

	ScriptsSection:NewButton({
		Name = "Neptunion V",
		Description = "The very popular sword script.",
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Blukezz/Open-FE/refs/heads/main/Converted-Scripts/NeptunionV.lua"))()
		end,
	})
end

do -- General Settings --
	local ScriptsTab = Window:NewTab({
		Name = "Settings",
		Icon = "rbxassetid://137847815815367",
	})

	local ScriptsSection = ScriptsTab:NewSection({
		Name = "General Settings",
		Description = "Settings that are not reanimation settings. If you don't know what a setting means, don't change it.",
	})

	ScriptsSection:NewToggle({
		Name = "Music",
		Description = "Wether music should be played in a script.",
		CurrentState = Configs["General"].Music,
		Callback = function(Value)
			Configs["General"].Music = Value
			SyncConfiguration("General")
		end,
	})

	ScriptsSection:NewToggle({
		Name = "Hide Part1",
		Description = "Hides the part that the hat is algined to.",
		CurrentState = Configs["General"].HidePart1,
		Callback = function(Value)
			Configs["General"].HidePart1 = Value
			SyncConfiguration("General")
		end,
	})
end
