title = "\n//    E N D E R \228\185\157    //\n\nMade by @Kyutatsuki#9221\n\n[CTRL] Walk\n[H] Open/Close Help GUI\n\nEnder but Kyu's version AKA \"Ender v4\"\nWas \"requested\" by Creterisk\n\nBuild 0001\n"
-- kyu's ender? more like kys ender
backgroundcolortitle = Color3.fromRGB(27, 42, 53)
bordercolortitle = Color3.fromHSV(0, 0, 0)
local name = script:WaitForChild("Value").Value
local p = game:GetService("Players"):WaitForChild(name)
local char = p.Character
local larm = char:WaitForChild("Left Arm")
local rarm = char:WaitForChild("Right Arm")
local lleg = char:WaitForChild("Left Leg")
local rleg = char:WaitForChild("Right Leg")
local hed = char:WaitForChild("Head")
local torso = char:WaitForChild("Torso")
local root = char:WaitForChild("HumanoidRootPart")
local hum = char:FindFirstChildOfClass("Humanoid")
local debris = game:GetService("Debris")
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local rs = run.RenderStepped
local wingpose = "Idle"
local DebrisModel = Instance.new("Model", char)
local lplr = game:GetService("Players").LocalPlayer
local remote = game:GetService("ReplicatedStorage"):WaitForChild(script.Name .. "_remote_" .. p.Name)
local mouse = lplr:GetMouse()
local pose = "Idle"
local musicplay = true
local musictrack = 1
local blinktime = 0
local blinking = false
local walking = false
local currentmusic
DebrisModel.Name = "Debris"
repeat
	rs:wait()
until p.CharacterAppearanceLoaded
function rad(var)
	return math.rad(var)
end
animsync = false
noidle = false
shift = false
control = false
function animation(token)
	if plr == lplr then
		pose = token
	end
	if -root.Velocity.Y / 1.5 > -5 and -root.Velocity.Y / 1.5 < 150 then
		velocityYFall = root.Velocity.Y / 1.5
	elseif -root.Velocity.Y / 1.5 < -5 then
		velocityYFall = 5
	elseif -root.Velocity.Y / 1.5 > 150 then
		velocityYFall = -150
	end
	if -root.Velocity.Y / 180 > 0 and -root.Velocity.Y / 180 < 1.2 then
		velocityYFall2 = root.Velocity.Y / 180
	elseif -root.Velocity.Y / 180 < 0 then
		velocityYFall2 = 0
	elseif -root.Velocity.Y / 180 > 1.2 then
		velocityYFall2 = -1.2
	end
	if -root.Velocity.Y / 1.5 > -5 and -root.Velocity.Y / 1.5 < 50 then
		velocityYFall3 = root.Velocity.Y / 1.5
	elseif -root.Velocity.Y / 1.5 < -5 then
		velocityYFall3 = 5
	elseif -root.Velocity.Y / 1.5 > 50 then
		velocityYFall3 = -50
	end
	if -root.Velocity.Y / 1.5 > -50 and -root.Velocity.Y / 1.5 < 20 then
		velocityYFall4 = root.Velocity.Y / 1.5
	elseif -5 > -root.Velocity.Y / 180 then
		velocityYFall4 = 5
	elseif -root.Velocity.Y / 180 > 50 then
		velocityYFall4 = -50
	end
	if root.RotVelocity.Y / 6 < 1 and root.RotVelocity.Y / 6 > -1 then
		neckrotY = root.RotVelocity.Y / 6
	elseif root.RotVelocity.Y / 6 < -1 then
		neckrotY = -1
	elseif root.RotVelocity.Y / 6 > 1 then
		neckrotY = 1
	end
	if root.RotVelocity.Y / 8 < 0.6 and root.RotVelocity.Y / 8 > -0.6 then
		neckrotY2 = root.RotVelocity.Y / 8
	elseif root.RotVelocity.Y / 8 < -0.6 then
		neckrotY2 = -0.6
	elseif root.RotVelocity.Y / 8 > 0.6 then
		neckrotY2 = 0.6
	end
	if root.RotVelocity.Y / 6 < 0.2 and root.RotVelocity.Y / 6 > -0.2 then
		torsorotY = root.RotVelocity.Y / 6
	elseif root.RotVelocity.Y / 6 < -0.2 then
		torsorotY = -0.2
	elseif root.RotVelocity.Y / 6 > 0.2 then
		torsorotY = 0.2
	end
	if root.RotVelocity.Y / 8 < 0.2 and root.RotVelocity.Y / 8 > -0.2 then
		torsorotY2 = root.RotVelocity.Y / 8
	elseif root.RotVelocity.Y / 8 < -0.2 then
		torsorotY2 = -0.2
	elseif root.RotVelocity.Y / 8 > 0.2 then
		torsorotY2 = 0.2
	end
	torsoY = -(torso.Velocity * Vector3.new(1, 0, 1)).magnitude / 20
	torsoY2 = -(torso.Velocity * Vector3.new(1, 0, 1)).magnitude / 36
	local rlegray = Ray.new(rleg.Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -1.75, 0))
	local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
	local llegray = Ray.new(lleg.Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -1.75, 0))
	local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
	local rightvector = (root.Velocity * torso.CFrame.rightVector).X + (root.Velocity * torso.CFrame.rightVector).Z
	local lookvector = (root.Velocity * torso.CFrame.lookVector).X + (root.Velocity * torso.CFrame.lookVector).Z
	if lookvector > hum.WalkSpeed then
		lookvector = hum.WalkSpeed
	end
	if lookvector < -hum.WalkSpeed then
		lookvector = -hum.WalkSpeed
	end
	if rightvector > hum.WalkSpeed then
		rightvector = hum.WalkSpeed
	end
	if rightvector < -hum.WalkSpeed then
		rightvector = -hum.WalkSpeed
	end
	local lookvel = lookvector / hum.WalkSpeed
	local rightvel = rightvector / hum.WalkSpeed
	if token == "Idle" then
		change = 2
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1), 0.4)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(math.rad(5 + 5 * math.sin(sine / 10) - 5 * math.cos(sine / 10)), math.rad(40 + 5 * math.sin(sine / 10)), math.rad(0)), 0.1)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.4 - 0.2 * math.cos(sine / 10) - 0.1 * math.cos(sine / 10), 0) * CFrame.Angles(math.rad(-30 + 20 * math.sin(sine / 10)), math.rad(-50 - 5 * math.sin(sine / 10)), math.rad(-50 - 10 * math.cos(sine / 10))), 0.2)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.4 - 0.2 * math.cos(sine / 10) - 0.1 * math.cos(sine / 10), 0) * CFrame.Angles(math.rad(80 - 20 * math.cos(sine / 10)), math.rad(50 + 5 * math.sin(sine / 10)), math.rad(10 + 10 * math.cos(sine / 10))), 0.2)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.2 + 0.7 * math.cos(sine / 10) + 0.4 * math.cos(sine / 5), 0) * CFrame.Angles(math.rad(-4 - 5 * math.cos(sine / 10)), math.rad(40 + 5 * math.sin(sine / 10)), math.rad(0 - 5 * math.sin(sine / 10))), 0.1)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.7250000000000001 - 0.2 * math.sin(sine / 10) + 0.1 * math.cos(sine / 5), -0.2 + 0.2 * math.sin(sine / 10)) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine / 10)), math.rad(0), math.rad(-6 + 5 * math.cos(sine / 10) + 2 + 2 * math.cos(sine / 5))), 0.2)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.7, -0.675 - 0.2 * math.sin(sine / 10), -0.1 + 0.2 * math.sin(sine / 10)) * CFrame.Angles(math.rad(0 + 10 * math.sin(sine / 10)), math.rad(-40), math.rad(5 - 2 * math.cos(sine / 10) - 2 - 2 * math.sin(sine / 5))), 0.2)
	elseif token == "Run" then
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1 - 0.1 * lookvel) * CFrame.Angles(0, torsorotY, rad(0) + torsorotY), 0.4)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles((change / 10 * math.cos(sine / 2) + 0.1) * lookvel ^ 2, -(change / 10) * math.cos(sine / 4) - torsorotY / 5, change / 5 * math.cos(sine / 4)), 0.1)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5 + 0.12 * lookvel ^ 2 - movement / 40 * math.cos(sine / 4) / 3, movement / 150 + movement / 40 * math.cos(sine / 4)) * CFrame.Angles((rad(-5 - movement * 2 * math.cos(sine / 4)) + -(movement / 10) * math.sin(sine / 4)) * lookvel, rad(0 - movement * 2 * math.cos(sine / 4)), -rad(movement * 1 * 0.2 - movement * 1 * math.cos(sine / 2) * lookvel) + rad(-5 * rightvel)), 0.2)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5 + 0.12 * lookvel ^ 2 + movement / 40 * math.cos(sine / 4) / 3, movement / 150 - movement / 40 * math.cos(sine / 4)) * CFrame.Angles((rad(-5 + movement * 2 * math.cos(sine / 4)) + movement / 10 * math.sin(sine / 4)) * lookvel, rad(0 - movement * 2 * math.cos(sine / 4)), -rad(-(movement * 1) * 0.2 + movement * 1 * math.cos(sine / 2) * lookvel) + rad(-5 * rightvel)), 0.2)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.05 + change / 2 * math.cos(sine / 2), 0) * CFrame.Angles(rad(-(change * 20) - movement / 20 * math.cos(sine / 2)) * lookvel, torsorotY2 + rad(0 - 4 * math.sin(sine / 4)), rad(-(change * 20) - movement / 20 * math.cos(sine / 2)) * rightvel + torsorotY2 + rad(0 - 1 * math.cos(sine / 4))), 0.1)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.85 - movement / 15 * math.cos(sine / 4) / 2, (-0.1 + movement / 15 * math.cos(sine / 4)) * (0.5 + 0.5 * lookvel)) * CFrame.Angles((rad(-10 * lookvel + change * 5 - movement * math.cos(sine / 4)) + -(movement / 10) * math.sin(sine / 4)) * lookvel, rad(0 + movement * 2 * math.cos(sine / 4)), (rad(change * 5 - movement * math.cos(sine / 4)) + -(movement / 10) * math.sin(sine / 4)) * (rightvector / (hum.WalkSpeed * 2))), 0.2)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.85 + movement / 15 * math.cos(sine / 4) / 2, (-0.1 - movement / 15 * math.cos(sine / 4)) * (0.5 + 0.5 * lookvel)) * CFrame.Angles((rad(-10 * lookvel + change * 5 + movement * math.cos(sine / 4)) + movement / 10 * math.sin(sine / 4)) * lookvel, rad(0 + movement * 2 * math.cos(sine / 4)), (rad(change * 5 + movement * math.cos(sine / 4)) + movement / 10 * math.sin(sine / 4)) * (rightvector / (hum.WalkSpeed * 2))), 0.2)
	elseif token == "Jump" then
		change = 1
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(0, 0, 0), 0.4)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(rad(-velocityYFall3 / 5), 0, 0), 0.1)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55 - velocityYFall3 / 70, 0) * CFrame.Angles(rad(-velocityYFall3 / 10), rad(0), rad(velocityYFall)), 0.2)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55 - velocityYFall3 / 70, 0) * CFrame.Angles(rad(-velocityYFall3 / 10), rad(0), rad(-velocityYFall)), 0.2)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(rad(-(change * 20) - movement / 20 * math.cos(sine / 2)) * (lookvector / (hum.WalkSpeed * 2)) + rad(velocityYFall3 / 10), rad(0), rad(-(change * 20) - movement / 20 * math.cos(sine / 2)) * (rightvector / (hum.WalkSpeed * 2))), 0.1)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.925, 0) * CFrame.Angles(rad(-35), rad(0), rad(-2)), 0.2)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, 0, -0.8) * CFrame.Angles(rad(-25), rad(0), rad(2)), 0.2)
	elseif token == "Sit" then
		change = 1
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1), 0.4)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55 - 0.1 * math.cos(sine / 16) / 3, -0.05 - 0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(-2 + 4 * math.sin(sine / 16)), rad(-5 - 5 * math.sin(sine / 16)), rad(-6 + 2 * math.cos(sine / 16))), 0.2)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55 - 0.1 * math.cos(sine / 16) / 3, -0.05 - 0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(-2 + 4 * math.sin(sine / 16)), rad(5 + 5 * math.sin(sine / 16)), rad(6 - 2 * math.cos(sine / 16))), 0.2)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.4 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(0), rad(0 - 1 * math.cos(sine / 32))), 0.1)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.55 + 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(80 + 2 * math.cos(sine / 16)), rad(4), rad(-2 + 1 * math.cos(sine / 32))), 0.2)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.55 + 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(80 + 2 * math.cos(sine / 16)), rad(-4), rad(2 + 1 * math.cos(sine / 32))), 0.2)
	end
end
function rswait(value)
	if value ~= nil and value ~= 0 then
		for i = 1, value do
			rs:wait()
		end
	else
		rs:wait()
	end
end
if char:FindFirstChild("MusicRuin") then
	char:FindFirstChild("MusicRuin"):Destroy()
end
function musik(id)
	if id == "Stop" then
		if not char:FindFirstChild("MusicRuin") then
			soundz = Instance.new("Sound", char)
		end
		if char:FindFirstChild("MusicRuin") then
			soundz = char:FindFirstChild("MusicRuin")
			soundz:Stop()
		end
	else
		if not char:FindFirstChild("MusicRuin") then
			soundz = Instance.new("Sound", char)
			for i = 1, 1 do
				local equalizer = Instance.new("EqualizerSoundEffect", soundz)
				equalizer.HighGain = 2
				equalizer.MidGain = 0
				equalizer.LowGain = 4
			end
		end
		if char:FindFirstChild("MusicRuin") then
			soundz = char:FindFirstChild("MusicRuin")
		end
		soundz.Volume = 10
		soundz.Name = "MusicRuin"
		soundz.Looped = true
		soundz.PlaybackSpeed = 1
		soundz.SoundId = "rbxassetid://" .. id
		soundz:Stop()
		soundz:Play()
	end
end
remote.OnClientEvent:connect(function(a, id)
	if plr ~= lplr and a == "musik" then
		musik(id)
	end
end)
function music(id)
	currentmusic = id
	musik(id)
	remote:FireServer("musik", id)
end
function lerp(a, b, t)
	return a + (b - a) * t
end
function Lerp(c1, c2, al)
	local com1 = {
		c1.X,
		c1.Y,
		c1.Z,
		c1:toEulerAnglesXYZ()
	}
	local com2 = {
		c2.X,
		c2.Y,
		c2.Z,
		c2:toEulerAnglesXYZ()
	}
	for i, v in pairs(com1) do
		com1[i] = v + (com2[i] - v) * al
	end
	return CFrame.new(com1[1], com1[2], com1[3]) * CFrame.Angles(select(4, unpack(com1)))
end
function slerp(a, b, t)
	dot = a:Dot(b)
	if dot > 0.99999 or dot < -0.99999 then
		return t <= 0.5 and a or b
	else
		r = math.acos(dot)
		return (a * math.sin((1 - t) * r) + b * math.sin(t * r)) / math.sin(r)
	end
end
function clerp(c1, c2, al)
	local com1 = {
		c1.X,
		c1.Y,
		c1.Z,
		c1:toEulerAnglesXYZ()
	}
	local com2 = {
		c2.X,
		c2.Y,
		c2.Z,
		c2:toEulerAnglesXYZ()
	}
	for i, v in pairs(com1) do
		com1[i] = lerp(v, com2[i], al)
	end
	return CFrame.new(com1[1], com1[2], com1[3]) * CFrame.Angles(select(4, unpack(com1)))
end
function findAllNearestTorso(pos, dist)
	local list = workspace:GetChildren()
	local torso = {}
	local temp, human, temp2
	for x = 1, #list do
		temp2 = list[x]
		if temp2.className == "Model" and temp2 ~= char then
			temp = temp2:findFirstChild("Head")
			human = temp2:findFirstChildOfClass("Humanoid")
			if temp ~= nil and human ~= nil and human.Health > 0 and dist >= (temp.Position - pos).magnitude then
				table.insert(torso, temp)
			end
		end
	end
	return torso
end
function findAllNearestTorso(pos, dist)
	local list = workspace:GetChildren()
	local torso = {}
	local temp, human, temp2
	for x = 1, #list do
		temp2 = list[x]
		if temp2.className == "Model" and temp2 ~= char then
			temp = temp2:findFirstChild("Head")
			human = temp2:findFirstChildOfClass("Humanoid")
			if temp ~= nil and human ~= nil and human.Health > 0 and dist >= (temp.Position - pos).magnitude then
				table.insert(torso, temp)
				dist = (temp.Position - pos).magnitude
			end
		end
	end
	return torso
end
function checkIfNotPlayer(model)
	if model.CanCollide == true and model ~= char and model.Parent ~= char and model.Parent.Parent ~= char and model.Parent.Parent ~= char and model.Parent ~= DebrisModel and model.Parent.Parent ~= DebrisModel and model.Parent.Parent.Parent ~= DebrisModel and model ~= wings and model.Parent ~= wings and model.Parent.Parent ~= wings then
		return true
	else
		return false
	end
end
function newWeld(wp0, wp1, wc0x, wc0y, wc0z)
	local wld = Instance.new("Weld", wp1)
	wld.Part0 = wp0
	wld.Part1 = wp1
	wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
	return wld
end
function weld(model)
	local parts, last = {}, nil
	local function scan(parent)
		for _, v in pairs(parent:GetChildren()) do
			if v:IsA("BasePart") then
				if last then
					local w = Instance.new("Weld")
					w.Name = ("%s_Weld"):format(v.Name)
					w.Part0, w.Part1 = last, v
					w.C0 = last.CFrame:inverse()
					w.C1 = v.CFrame:inverse()
					w.Parent = last
				end
				last = v
				table.insert(parts, v)
			end
			scan(v)
		end
	end
	scan(model)
	for _, v in pairs(parts) do
		v.Anchored = false
		v.Locked = true
		v.Anchored = false
		v.BackSurface = Enum.SurfaceType.SmoothNoOutlines
		v.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
		v.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
		v.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
		v.RightSurface = Enum.SurfaceType.SmoothNoOutlines
		v.TopSurface = Enum.SurfaceType.SmoothNoOutlines
		v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
		v.Massless = true
	end
end
function calculate(part, asd)
	local Head = hed
	local RightShoulder = asd
	local RightArm = part
	local MousePosition = mouse.Hit.p
	local ToMouse = (MousePosition - Head.Position).unit
	local Angle = math.acos(ToMouse:Dot(Vector3.new(0, 1, 0)))
	local FromRightArmPos = Head.Position + Head.CFrame:vectorToWorldSpace(Vector3.new(Head.Size.X / 2 + RightArm.Size.X / 2, Head.Size.Y / 2 - RightArm.Size.Z / 2, 0))
	local ToMouseRightArm = (MousePosition - FromRightArmPos) * Vector3.new(1, 0, 1).unit
	local Look = (Head.CFrame.lookVector * Vector3.new(1, 0, 1)).unit
	local LateralAngle = math.acos(ToMouseRightArm:Dot(Look))
	if tostring(LateralAngle) == "-1.#IND" then
		LateralAngle = 0
	end
	local Cross = Head.CFrame.lookVector:Cross(ToMouseRightArm)
	if LateralAngle > math.pi / 2 then
		LateralAngle = math.pi / 2
		local Torso = root
		local Point = Torso.CFrame:vectorToObjectSpace(mouse.Hit.p - Torso.CFrame.p)
		if 0 < Point.Z then
			if 0 < Point.X and RightArm == rarm then
				Torso.CFrame = CFrame.new(Torso.Position, Vector3.new(mouse.Hit.X, Torso.Position.Y, mouse.Hit.Z)) * CFrame.Angles(0, rad(110), 0)
			elseif 0 > Point.X and RightArm == rarm then
				Torso.CFrame = CFrame.new(Torso.Position, Vector3.new(mouse.Hit.X, Torso.Position.Y, mouse.Hit.Z)) * CFrame.Angles(0, rad(-110), 0)
			end
		end
	end
	if 0 > Cross.Y then
		LateralAngle = -LateralAngle
	end
	return (CFrame.Angles(math.pi / 2 - Angle, math.pi / 2 + LateralAngle, math.pi / 2))
end
function sond(id, position, vol, pitch, distance, start, finish)
	local sound
	coroutine.resume(coroutine.create(function()
		local part = Instance.new("Part", workspace)
		part.Position = position
		part.Size = Vector3.new(0, 0, 0)
		part.CanCollide = false
		part.Transparency = 1
		part.Anchored = true
		sound = Instance.new("Sound", part)
		sound.SoundId = "rbxassetid://" .. id
		repeat
			rs:wait()
		until sound.IsLoaded
		if vol ~= nil then
			sound.Volume = vol
		end
		if pitch ~= nil then
			sound.PlaybackSpeed = pitch
		end
		if distance ~= nil then
			sound.EmitterSize = distance
		end
		if start ~= nil then
			sound.TimePosition = start
		end
		if finish ~= nil then
			debris:AddItem(part, finish - start)
		else
			debris:AddItem(part, sound.TimeLength)
		end
		sound:Play()
	end))
	return sound
end
remote.OnClientEvent:connect(function(a, id, position, vol, pitch, distance, start, finish)
	if plr ~= lplr and a == "sond" then
		sond(id, position, vol, pitch, distance, start, finish)
	end
end)
function sound(id, position, vol, pitch, distance, start, finish)
	local part = sond(id, position, vol, pitch, distance, start, finish)
	remote:FireServer("sond", id, position, vol, pitch, distance, start, finish)
	return part
end
remote.OnClientEvent:connect(function(a, b)
	if a == "dead" then
		b.Parent:FindFirstChild("HumanoidRootPart")
		for i, v in pairs(b.Parent:GetChildren()) do
			if v:IsA("BasePart") then
				v:ClearAllChildren()
				do
					local part = v:Clone()
					part.Parent = workspace
					part.Size = Vector3.new(1, 1, 1)
					part.Transparency = 1
					part.CanCollide = false
					v:Destroy()
					local a = script.ParticleEmitter:Clone()
					a.Parent = part
					a.Color = ColorSequence.new(getrandomcolor())
					if part.Name ~= "HumanoidRootPart" then
						delay(1, function()
							a.Enabled = false
							debris:AddItem(part, 1)
						end)
						local bp = Instance.new("BodyPosition", part)
						bp.Position = part.Position + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))
						bp.P = 3000
						bp.D = 1000
					else
						do
							local bp = Instance.new("BodyPosition", part)
							bp.Position = part.Position + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))
							bp.P = 3000
							bp.D = 1000
							delay(1, function()
								local asd
								asd = rs:connect(function()
									if (part.Position - root.Position).magnitude > 2 then
										bp.Position = root.Position
									else
										delay(0.2, function()
											a.Speed = NumberRange.new(10)
											delay(1, function()
												a.Enabled = false
												debris:AddItem(part, 1)
											end)
										end)
										asd:disconnect()
									end
								end)
							end)
						end
					end
				end
			end
		end
	end
end)
function computeDirection(vec)
	local lenSquared = vec.magnitude * vec.magnitude
	local invSqrt = 1 / math.sqrt(lenSquared)
	return Vector3.new(vec.x * invSqrt, vec.y * invSqrt, vec.z * invSqrt)
end
local shaking = 0
function shake(num)
	if num > shaking then
		shaking = num
	end
end
game:GetService("RunService").RenderStepped:connect(function()
	--hum.CameraOffset = Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1)) * (shaking / 100)
	if shaking > 0 then
		shaking = shaking - 1
	else
		shaking = 0
	end
end)
plr = p
DebrisModel = Instance.new("Model", plr.Character)
DebrisModel.Name = "DebrisModel"
function Effekt(mesh, size, transparency, material, color, position, rotation, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	local part = Instance.new("Part", DebrisModel)
	part.Anchored = true
	part.CanCollide = false
	part.Size = Vector3.new(1, 1, 1)
	part.Transparency = transparency
	part.Material = material
	part.Color = color
	part.CFrame = CFrame.new(position) * CFrame.Angles(rad(rotation.X), rad(rotation.Y), rad(rotation.Z))
	local partmesh = Instance.new("SpecialMesh", part)
	if tonumber(mesh) == nil then
		partmesh.MeshType = mesh
	else
		partmesh.MeshId = "rbxassetid://" .. mesh
	end
	partmesh.Scale = size
	local pvalue = Instance.new("Vector3Value", part)
	pvalue.Name = "Position"
	pvalue.Value = positionchange
	local svalue = Instance.new("Vector3Value", part)
	svalue.Name = "Size"
	svalue.Value = sizechange
	local rvalue = Instance.new("Vector3Value", part)
	rvalue.Name = "Rotation"
	rvalue.Value = rotationchange
	local tvalue = Instance.new("NumberValue", part)
	tvalue.Name = "Transparency"
	tvalue.Value = transparencychange
	local avalue = Instance.new("NumberValue", part)
	avalue.Name = "Acceleration"
	avalue.Value = acceleration
	part.Name = "EFFECT"
	return part
end
remote.OnClientEvent:connect(function(a, mesh, size, transparency, material, color, position, rotation, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	if plr ~= lplr and a == "effekt" then
		Effekt(mesh, size, transparency, material, color, position, rotation, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	end
end)
function Effect(mesh, size, transparency, material, color, position, rotation, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	local part = Effekt(mesh, size, transparency, material, color, position, rotation, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	remote:FireServer("effekt", mesh, size, transparency, material, color, position, rotation, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	return part
end
rs:connect(function()
	coroutine.resume(coroutine.create(function()
		for i, v in pairs(DebrisModel:GetChildren()) do
			if v:isA("BasePart") then
				v.LocalTransparencyModifier = 0
			end
		end
		if not plr.Character:FindFirstChild("DebrisModel") then
			DebrisModel = Instance.new("Model", plr.Character)
			DebrisModel.Name = "DebrisModel"
		end
		for i, v in pairs(DebrisModel:GetChildren()) do
			if v:IsA("BasePart") and v.Name == "EFFECT" then
				local pvalue = v:FindFirstChild("Position").Value
				local svalue = v:FindFirstChild("Size").Value
				local rvalue = v:FindFirstChild("Rotation").Value
				local tvalue = v:FindFirstChild("Transparency").Value
				local avalue = v:FindFirstChild("Acceleration").Value
				local mesh = v:FindFirstChild("Mesh")
				mesh.Scale = mesh.Scale + svalue
				v:FindFirstChild("Size").Value = v:FindFirstChild("Size").Value + Vector3.new(1, 1, 1) * avalue
				v.Transparency = v.Transparency + tvalue
				v.CFrame = CFrame.new(pvalue) * v.CFrame * CFrame.Angles(rad(rvalue.X), rad(rvalue.Y), rad(rvalue.Z))
				if v.Transparency >= 1 or 0 > mesh.Scale.X or 0 > mesh.Scale.Y or 0 > mesh.Scale.Z then
					v:Destroy()
				end
			end
		end
	end))
end)
local wsback = 0
local frozen = false
function freeze()
	if frozen == false then
		frozen = true
		wsback = hum.WalkSpeed
		hum.WalkSpeed = 1
	else
		frozen = false
		hum.WalkSpeed = wsback
	end
end
function litnin(Part0, Part1, Times, Offset, Color, Thickness, Trans)
	local magz = (Part0 - Part1).magnitude
	local curpos = Part0
	local trz = {
		-Offset,
		Offset
	}
	for i = 1, Times do
		local li = Instance.new("Part", DebrisModel)
		li.TopSurface = 0
		li.Material = Enum.Material.Neon
		li.BottomSurface = 0
		li.Anchored = true
		li.Locked = true
		li.Transparency = Trans or 0.4
		li.Color = Color
		li.formFactor = "Custom"
		li.CanCollide = false
		li.Size = Vector3.new(Thickness, Thickness, magz / Times)
		local lim = Instance.new("BlockMesh", li)
		local Offzet = Vector3.new(trz[math.random(1, 2)], trz[math.random(1, 2)], trz[math.random(1, 2)])
		local trolpos = CFrame.new(curpos, Part1) * CFrame.new(0, 0, magz / Times).p + Offzet
		if Times == i then
			local magz2 = (curpos - Part1).magnitude
			li.Size = Vector3.new(Thickness, Thickness, magz2)
			li.CFrame = CFrame.new(curpos, Part1) * CFrame.new(0, 0, -magz2 / 2)
		else
			li.CFrame = CFrame.new(curpos, trolpos) * CFrame.new(0, 0, magz / Times / 2)
		end
		curpos = li.CFrame * CFrame.new(0, 0, magz / Times / 2).p
		li.Name = "LIGHTNING"
	end
end
remote.OnClientEvent:connect(function(a, Part0, Part1, Times, Offset, Color, Thickness, Trans)
	if plr ~= lplr and a == "litnin" then
		litnin(Part0, Part1, Times, Offset, Color, Thickness, Trans)
	end
end)
function Lightning(Part0, Part1, Times, Offset, Color, Thickness, Trans)
	local part = litnin(Part0, Part1, Times, Offset, Color, Thickness, Trans)
	remote:FireServer("litnin", Part0, Part1, Times, Offset, Color, Thickness, Trans)
end
function createimpakt(a, b, c, d, endPoint, ori)
	coroutine.resume(coroutine.create(function()
		local temppart = Instance.new("Part", DebrisModel)
		for i = 1, 8 do
			local bullet = Instance.new("Part", workspace)
			bullet.Material = a
			bullet.Color = b
			bullet.TopSurface = c
			bullet.BottomSurface = d
			bullet.Size = Vector3.new(10, 10, 10)
			bullet.CFrame = root.CFrame
			bullet.CanCollide = false
			bullet.Velocity = Vector3.new(math.random(-80, 80), 120, math.random(-80, 80))
			bullet.RotVelocity = Vector3.new(math.random(-80, 80), math.random(-80, 80), math.random(-80, 80)) / 10
			bullet:BreakJoints()
			debris:AddItem(bullet, 5)
		end
		for z = 1, 2 do
			for i = 1, 40 do
				temppart.CFrame = CFrame.new(endPoint, endPoint + Vector3.new(1, 0, 0)) * CFrame.Angles(rad(ori.X), rad(ori.Y), rad(ori.Z)) * CFrame.Angles(0, rad(i / 40 * 360), 0) * CFrame.new(0, math.random(-10, -5) + z * 5, math.random(-5, 5) - (10 + z * 10))
				local bullet = Instance.new("Part", workspace)
				bullet.Material = a
				bullet.Anchored = true
				bullet.CanCollide = false
				bullet.Color = b
				bullet.TopSurface = c
				bullet.BottomSurface = d
				bullet.Size = Vector3.new(10, 15, 20)
				bullet.CFrame = CFrame.new(temppart.Position + Vector3.new(0, -10, 0), endPoint + Vector3.new(0, -1, 0))
				debris:AddItem(bullet, 5)
			end
		end
		temppart:Destroy()
	end))
end
remote.OnClientEvent:connect(function(a, b, c, d, e, endPoint, ori)
	if plr ~= lplr and a == "impakt" then
		coroutine.resume(coroutine.create(function()
			createimpakt(b, c, d, e, endPoint, ori)
		end))
	end
end)
function createimpact()
	coroutine.resume(coroutine.create(function()
		local ray = Ray.new(root.Position, Vector3.new(0, -1000, 0))
		local part, endPoint = workspace:FindPartOnRay(ray, char)
		createimpakt(part.Material, part.Color, part.TopSurface, part.BottomSurface, endPoint, part.Orientation)
		remote:FireServer("impakt", part.Material, part.Color, part.TopSurface, part.BottomSurface, endPoint, part.Orientation)
	end))
end
function projectile(pos, target, size, speed, color, doing, onexplosion)
	local Part0 = Instance.new("Part", DebrisModel)
	local SpecialMesh1 = Instance.new("SpecialMesh")
	Part0.Material = Enum.Material.Neon
	Part0.Anchored = false
	Part0.Size = Vector3.new(1, 1, 1)
	Part0.CFrame = CFrame.new(-57, 5, 28, 0.99999994, 0, 0, 0, 1, -5.56362707E-8, 0, 5.56362707E-8, 1)
	Part0.BottomSurface = Enum.SurfaceType.Smooth
	Part0.TopSurface = Enum.SurfaceType.Smooth
	Part0.Position = Vector3.new(-57, 5, 28)
	Part0.Color = Color3.new(1, 1, 1)
	Part0.CanCollide = false
	Part0.Transparency = 1
	local bforce = Instance.new("BodyForce", Part0)
	bforce.force = Vector3.new(0, bforce.Parent:getMass() * workspace.Gravity, 0)
	SpecialMesh1.Parent = Part0
	SpecialMesh1.MeshType = Enum.MeshType.Sphere
	SpecialMesh1.Scale = Vector3.new(1, 1, 1) * size
	local Position = pos
	local Target = target
	local direction = Target - Position
	local direction = computeDirection(direction)
	local pos = Position + direction * 2
	Part0.CFrame = CFrame.new(pos, pos + direction) * CFrame.Angles(math.pi / 2 + rad(90), 0, 0)
	Part0.Velocity = direction * speed
	root.Velocity = root.Velocity + -direction * 5
	local color2 = color
	local loop = rs:connect(function()
		if plr == lplr then
			doing(Part0.Position, color, speed, size)
		end
	end)
	local function stop()
		loop:disconnect()
		Part0:Destroy()
	end
	delay(10, function()
		stop()
	end)
	local asd
	asd = Part0.Touched:Connect(function(ht)
		if checkIfNotPlayer(ht) == true and ht.CanCollide == true then
			if plr == lplr then
				onexplosion(Part0.Position, color, speed, size)
				for i, v in pairs(findAllNearestTorso(Part0.Position, 10 * size)) do
					local hit = v.Parent
					if hit:FindFirstChildOfClass("Humanoid") then
						local hum = hit:FindFirstChildOfClass("Humanoid")
						if hum.MaxHealth > 1.0E100 then
							remote:FireServer("breakjoints", v.Parent)
						else
							remote:FireServer("damage", hum, hum.MaxHealth / math.random(5, 6))
						end
					end
				end
			end
			stop()
			asd:disconnect()
		end
	end)
end
function getrandomcolor()
	return Color3.fromHSV(math.random(0, 100000) / 100000, math.random(50000, 100000) / 100000, math.random(50000, 100000) / 100000)
end
function partchange(target, material, color)
	for i, v in pairs(target:children()) do
		if v:IsA("BasePart") then
			v.Color = color
			v.Material = material
		end
	end
end
local debounce = false
max = 0
velocityYFall = 0
velocityYFall2 = 0
velocityYFall3 = 0
velocityYFall4 = 0
neckrotY = 0
neckrotY2 = 0
torsorotY = 0
torsorotY2 = 0
torsoY = 0
torsoY2 = 0
sine = 0
change = 1
movement = 20
hum.WalkSpeed = 50
timeranim = 0
running = false
jumped = false
icolor = 1
imode = false
didjump = false
jumppower = 0
debounceimpact = false
noidlew = false
drew = false
sidestep = 0
local size = 1
local ranonce = true
if not larm:FindFirstChild("Weld") then
	newWeld(torso, larm, -1.5, 0.5, 0)
	ranonce = false
end
if not rarm:FindFirstChild("Weld") then
	newWeld(torso, rarm, 1.5, 0.5, 0)
	ranonce = false
end
if not lleg:FindFirstChild("Weld") then
	newWeld(torso, lleg, -0.5, -1, 0)
	ranonce = false
end
if not rleg:FindFirstChild("Weld") then
	newWeld(torso, rleg, 0.5, -1, 0)
	ranonce = false
end
if not torso:FindFirstChild("Weld") then
	newWeld(root, torso, 0, -1, 0)
	ranonce = false
end
if not hed:FindFirstChild("Weld") then
	newWeld(torso, hed, 0, 1.5, 0)
	ranonce = false
end
larm.Weld.C1 = CFrame.new(0, 0.5, 0)
rarm.Weld.C1 = CFrame.new(0, 0.5, 0)
lleg.Weld.C1 = CFrame.new(0, 1, 0)
rleg.Weld.C1 = CFrame.new(0, 1, 0)
torso.Weld.C1 = CFrame.new(0, -1, 0)
if ranonce then
	for i, v in pairs(char:GetChildren()) do
		if v ~= DebrisModel and v:IsA("Model") then
			v:Destroy()
		end
	end
end
local gauntletr = script.Ender4
gauntletr.Parent = char
weld(gauntletr)
local gauntletl = gauntletr:Clone()
gauntletl.Parent = char
newWeld(rarm, gauntletr.asd, 0, 0, 0)
newWeld(larm, gauntletl.asd, 0, 0, 0).C0 = CFrame.Angles(0, math.rad(180), 0)
emitters = {}
for i, v in pairs(char:GetChildren()) do
	if v:IsA("Part") and v.Name ~= "HumanoidRootPart" then
		local emitter = script.ParticleEmitter2:Clone()
		emitter.Parent = v
		table.insert(emitters, emitter)
	end
end
skin_custom = false
skin_color = BrickColor.new("Light orange")
custom_outfits = false
hum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
music("Stop")
drew = true
if plr == lplr then
	GUI = Instance.new("ScreenGui", p.PlayerGui)
	GUI.Name = "BlackHoleKyu"
	textlabel = Instance.new("TextLabel", GUI)
	textlabel.AnchorPoint = Vector2.new(1, 1)
	textlabel.Position = UDim2.new(1, 505, 1, -5)
	textlabel.Size = UDim2.new(0, 500, 0, 400)
	textlabel.BorderSizePixel = 5
	textlabel.BorderColor3 = bordercolortitle
	textlabel.BackgroundColor3 = backgroundcolortitle
	textlabel.BackgroundTransparency = 0.1
	textlabel.TextTransparency = 0.1
	textlabel.TextColor3 = Color3.fromHSV(0, 0, 1)
	textlabel.TextScaled = true
	textlabel.TextYAlignment = Enum.TextYAlignment.Center
	textlabel.Font = Enum.Font.SciFi
	textlabel.Text = title
end
guiopen = false
debouncebutton = false
function openhelp()
	if debouncebutton == false then
		if guiopen == false then
			debouncebutton = true
			textlabel:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.2)
			guiopen = true
			wait(0.2)
		else
			debouncebutton = true
			textlabel:TweenPosition(UDim2.new(1, 505, 1, -5), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.2)
			guiopen = false
			wait(0.2)
		end
	end
	debouncebutton = false
end
if plr == lplr then
	openhelp()
end
mouse.KeyDown:connect(function(key)
	if plr == lplr and key == "h" then
		openhelp()
	end
end)
mouse.Button1Down:connect(function()
	if plr == lplr and debounce == false then
		debounce = true
		debounce = false
	end
end)
mouse.KeyDown:connect(function(key)
end)
local woosh = false
local debounce = false
mouse.KeyDown:connect(function(key)
	if plr == lplr and key == "g" then
		if musicplay then
			musicplay = false
			music("Stop")
		else
			musicplay = true
			music("Stop")
		end
	end
end)
local debounceimpact = false
function jumpimpact()
	if debounceimpact == false then
		debounceimpact = true
		if jumppower < -150 then
			jumppower = -150
		end
		shake(-jumppower / 5)
		sound(131436155, lleg.Position, 5, math.random(7, 8) / 10)
		for i = 1, -jumppower / 20 do
			rs:wait()
			hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0, 0, 0), 0.05)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, jumppower / 20 - hum.HipHeight, 0) * CFrame.Angles(rad(0), rad(0), rad(0)), 0.05)
		end
		debounceimpact = false
	end
end
max = 0
hitsoft = 260430079
hitmedium = 260430117
hithard = 260430060
function clickattack()
	animsync = true
	noidle = true
	larm.Weld.C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
	rarm.Weld.C0 = CFrame.new(1.5, 0.5, 0.7) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
	root.Velocity = root.Velocity + root.CFrame.lookVector * 50
	freeze()
	sound(138097048, rarm.Position, 2, 1.1, nil, 0.08)
	local alreadytouched = {}
	for i = 1, 10 do
		rs:wait()
		for i, ht in pairs(findAllNearestTorso(rarm.Position, 4)) do
			local hit = ht.Parent
			if checkIfNotPlayer(ht) and hit:FindFirstChildOfClass("Humanoid") and 0 < hit:FindFirstChildOfClass("Humanoid").Health then
				local hurt = true
				for i, v in pairs(alreadytouched) do
					if v == hit then
						hurt = false
					end
				end
				if hurt == true then
					table.insert(alreadytouched, hit)
					if hit:FindFirstChildOfClass("Humanoid") then
						local hum = hit:FindFirstChildOfClass("Humanoid")
						if hum.MaxHealth > 1.0E100 then
							remote:FireServer("breakjoints", hit)
						else
							remote:FireServer("damage", hum, hum.MaxHealth / math.random(10, 17.5))
						end
						if hit:FindFirstChild("Torso") then
							sound(hitsoft, hit:FindFirstChild("Torso").Position, 5, math.random(9, 11) / 10)
							Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), hit:FindFirstChild("Torso").Position, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 0.5, Vector3.new(), 0.1, 0)
						elseif hit:FindFirstChild("UpperTorso") then
							sound(hitsoft, hit:FindFirstChild("UpperTorso").Position, 5, math.random(9, 11) / 10)
							Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), hit:FindFirstChild("UpperTorso").Position, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 0.5, Vector3.new(), 0.1, 0)
						end
					end
				end
			end
		end
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0), 0.5)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(math.rad(-10), math.rad(40), math.rad(0)), 0.5)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.5)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 1, -1) * CFrame.Angles(math.rad(100), math.rad(50), math.rad(30)), 0.5)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-30), math.rad(50), math.rad(0)), 0.5)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.925, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.5)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.925, 0) * CFrame.Angles(math.rad(30), math.rad(-50), math.rad(10)), 0.5)
		local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
		Effect(Enum.MeshType.Brick, Vector3.new(1, 1, 1) * 1, 0.9, Enum.Material.Neon, getrandomcolor(), rarm.RightGripAttachment.WorldPosition, asd * 360, asd * 0.001, Vector3.new(1, 1, 1) * -0.05, asd, 0, 0)
	end
	freeze()
	sine = 45
	noidle = false
	animsync = false
end
function clickattack2()
	animsync = true
	noidle = true
	larm.Weld.C0 = CFrame.new(-1.5, 0.5, 0.7) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
	rarm.Weld.C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
	root.Velocity = root.Velocity + root.CFrame.lookVector * 50
	freeze()
	sound(138097048, larm.Position, 2, 0.9, nil, 0.08)
	local alreadytouched = {}
	for i = 1, 10 do
		rs:wait()
		for i, ht in pairs(findAllNearestTorso(larm.Position, 4)) do
			local hit = ht.Parent
			if checkIfNotPlayer(ht) and hit:FindFirstChildOfClass("Humanoid") and 0 < hit:FindFirstChildOfClass("Humanoid").Health then
				local hurt = true
				for i, v in pairs(alreadytouched) do
					if v == hit then
						hurt = false
					end
				end
				if hurt == true then
					table.insert(alreadytouched, hit)
					if hit:FindFirstChildOfClass("Humanoid") then
						local hum = hit:FindFirstChildOfClass("Humanoid")
						if hum.MaxHealth > 1.0E100 then
							remote:FireServer("breakjoints", hit)
						else
							remote:FireServer("damage", hum, hum.MaxHealth / math.random(10, 17.5))
						end
						if hit:FindFirstChild("Torso") then
							sound(hitsoft, hit:FindFirstChild("Torso").Position, 5, math.random(9, 11) / 10)
							Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), hit:FindFirstChild("Torso").Position, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 0.5, Vector3.new(), 0.1, 0)
						elseif hit:FindFirstChild("UpperTorso") then
							sound(hitsoft, hit:FindFirstChild("UpperTorso").Position, 5, math.random(9, 11) / 10)
							Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), hit:FindFirstChild("UpperTorso").Position, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 0.5, Vector3.new(), 0.1, 0)
						end
					end
				end
			end
		end
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0), 0.5)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(math.rad(-10), math.rad(-50), math.rad(0)), 0.5)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 1, -1) * CFrame.Angles(math.rad(100), math.rad(50), math.rad(20)), 0.5)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.5)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-30), math.rad(-60), math.rad(0)), 0.5)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.925, 0) * CFrame.Angles(math.rad(30), math.rad(-50), math.rad(10)), 0.5)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.925, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.5)
		local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
		Effect(Enum.MeshType.Brick, Vector3.new(1, 1, 1) * 1, 0.9, Enum.Material.Neon, getrandomcolor(), larm.LeftGripAttachment.WorldPosition, asd * 360, asd * 0.001, Vector3.new(1, 1, 1) * -0.05, asd, 0, 0)
	end
	freeze()
	sine = 45
	noidle = false
	animsync = false
end
function clickattack3()
	animsync = true
	noidle = true
	for i = 1, 2 do
		rs:wait()
		larm.Weld.C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
		rarm.Weld.C0 = CFrame.new(1.5, 0.5, 0.7) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
	end
	root.Velocity = root.Velocity + root.CFrame.lookVector * 100
	freeze()
	sound(138097048, rarm.Position, 2, 1, nil, 0.08)
	sound(1388740053, root.Position, 5, math.random(100, 130) / 100)
	shake(10)
	Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), root.Position + root.CFrame.lookVector * 5, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1), Vector3.new(), 0.05, -0.05)
	Effect(559831844, Vector3.new(0.2, 0.2, 0), 0, Enum.Material.Neon, getrandomcolor(), root.Position + root.CFrame.lookVector * 5, root.Orientation, root.CFrame.lookVector * -0.5, Vector3.new(0.1, 0.1, 0.1), Vector3.new(), 0.05, 0)
	local alreadytouched = {}
	for i = 1, 20 do
		rs:wait()
		for i, ht in pairs(findAllNearestTorso(rarm.Position, 4)) do
			local hit = ht.Parent
			if checkIfNotPlayer(ht) and hit:FindFirstChildOfClass("Humanoid") and 0 < hit:FindFirstChildOfClass("Humanoid").Health then
				local hurt = true
				for i, v in pairs(alreadytouched) do
					if v == hit then
						hurt = false
					end
				end
				if hurt == true then
					table.insert(alreadytouched, hit)
					if hit:FindFirstChildOfClass("Humanoid") then
						local hum = hit:FindFirstChildOfClass("Humanoid")
						if hum.MaxHealth > 1.0E100 then
							remote:FireServer("breakjoints", hit)
						else
							remote:FireServer("damage", hum, hum.MaxHealth / math.random(7.5, 9))
						end
						if hit:FindFirstChild("Torso") then
							sound(hitsoft, hit:FindFirstChild("Torso").Position, 5, math.random(9, 11) / 10)
							Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), hit:FindFirstChild("Torso").Position, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 0.5, Vector3.new(), 0.1, 0)
						elseif hit:FindFirstChild("UpperTorso") then
							sound(hitsoft, hit:FindFirstChild("UpperTorso").Position, 5, math.random(9, 11) / 10)
							Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), hit:FindFirstChild("UpperTorso").Position, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 0.5, Vector3.new(), 0.1, 0)
						end
					end
				end
			end
		end
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0), 0.5)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(math.rad(-10), math.rad(40), math.rad(0)), 0.5)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.5)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 1, -1) * CFrame.Angles(math.rad(100), math.rad(50), math.rad(30)), 0.5)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-30), math.rad(50), math.rad(0)), 0.5)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.925, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.5)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.925, 0) * CFrame.Angles(math.rad(30), math.rad(-50), math.rad(10)), 0.5)
		local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
		Effect(Enum.MeshType.Brick, Vector3.new(1, 1, 1) * 1, 0.9, Enum.Material.Neon, getrandomcolor(), rarm.RightGripAttachment.WorldPosition, asd * 360, asd * 0.001, Vector3.new(1, 1, 1) * -0.05, asd, 0, 0)
	end
	freeze()
	sine = 45
	noidle = false
	animsync = false
end
mouse.KeyDown:connect(function(key)
	if plr == lplr and key == "e" and debounce == false then
		debounce = true
		animsync = true
		local alreadytouched = {}
		sound(1202656211, root.Position, 5, math.random(100, 150) / 100)
		sound(206083252, root.Position, 5, math.random(80, 100) / 100)
		Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), root.Position + root.CFrame.lookVector * 5, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1), Vector3.new(), 0.05, -0.05)
		Effect(559831844, Vector3.new(0.2, 0.2, 0), 0, Enum.Material.Neon, getrandomcolor(), root.Position + root.CFrame.lookVector * 5, root.Orientation, root.CFrame.lookVector * -0.5, Vector3.new(0.1, 0.1, 0.1), Vector3.new(), 0.05, 0)
		for i = 1, 5 do
			rs:wait()
			hed.Weld.C0 = CFrame.new(0, 1.5, -0.1) * CFrame.Angles(0, 0, 0)
			hed.Weld.C1 = CFrame.Angles(math.rad(-20), 0, 0)
			larm.Weld.C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(-40), math.rad(0), math.rad(-5))
			rarm.Weld.C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(-40), math.rad(0), math.rad(5))
			torso.Weld.C0 = CFrame.new(0, -0.5, 0) * CFrame.Angles(math.rad(-40), math.rad(0), math.rad(0))
			lleg.Weld.C0 = CFrame.new(-0.5, -0.6, -1) * CFrame.Angles(math.rad(-70), math.rad(0), math.rad(-1))
			rleg.Weld.C0 = CFrame.new(0.5, -0.95, 0) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(1))
			local temppos = root.Position
			root.Velocity = root.CFrame.lookVector * 300
			Effect(Enum.MeshType.Brick, Vector3.new(1, 1, 1) * 3, 0, Enum.Material.Neon, getrandomcolor(), root.Position, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20)) / 40, Vector3.new(1, 1, 1) * -0.4, Vector3.new(), 0, 0)
			for i, ht in pairs(findAllNearestTorso(root.Position, 8)) do
				local hit = ht.Parent
				if checkIfNotPlayer(ht) and hit:FindFirstChildOfClass("Humanoid") and 0 < hit:FindFirstChildOfClass("Humanoid").Health then
					local hurt = true
					for i, v in pairs(alreadytouched) do
						if v == hit then
							hurt = false
						end
					end
					if hurt == true then
						table.insert(alreadytouched, hit)
						if hit:FindFirstChildOfClass("Humanoid") then
							local hum = hit:FindFirstChildOfClass("Humanoid")
							if hum.MaxHealth > 1.0E100 then
								remote:FireServer("breakjoints", hit)
							else
								remote:FireServer("damage", hum, hum.MaxHealth / math.random(7.5, 9))
							end
							if hit:FindFirstChild("Torso") then
								sound(hithard, hit:FindFirstChild("Torso").Position, 5, math.random(9, 11) / 10, nil, 0.05)
							elseif hit:FindFirstChild("UpperTorso") then
								sound(hithard, hit:FindFirstChild("UpperTorso").Position, 5, math.random(9, 11) / 10, nil, 0.05)
							end
							remote:FireServer("stand", hum, 0.5)
						end
					end
				end
			end
		end
		root.Velocity = Vector3.new()
		for i = 1, 10 do
			Effect(Enum.MeshType.Brick, Vector3.new(1, 1, 1) * 4, 0, Enum.Material.Neon, getrandomcolor(), root.Position, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20)) / 25, Vector3.new(1, 1, 1) * -0.2, Vector3.new(), 0, 0)
		end
		sine = 45
		root.Velocity = root.CFrame.lookVector * 150
		debounce = false
		animsync = false
	end
end)
function typeattack()
	animsync = true
	noidle = true
	freeze()
	for i = 1, 5 do
		rs:wait()
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1), 0.5)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(math.rad(40), math.rad(0), math.rad(0)), 0.5)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(90), math.rad(20), math.rad(40)), 0.5)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(90), math.rad(-20), math.rad(-40)), 0.5)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(0)), 0.5)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.2, -0.5) * CFrame.Angles(math.rad(-50), math.rad(0), math.rad(0)), 0.5)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.2, -0.5) * CFrame.Angles(math.rad(-50), math.rad(0), math.rad(0)), 0.5)
	end
	sound(331666100, root.Position, 6, 1)
	sound(274118116, root.Position, 6, 0.1)
	sound(1388740053, root.Position, 5, math.random(100, 130) / 100)
	shake(30)
	local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
	Effect(559831844, Vector3.new(0.2, 0.2, 0), 0, Enum.Material.Neon, getrandomcolor(), root.Position, asd * 360, Vector3.new(), Vector3.new(0.1, 0.1, 0.1) * 1.5, Vector3.new(), 0.025, 0)
	Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, getrandomcolor(), root.Position, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 1.5, Vector3.new(), 0.025, 0)
	for i = 1, 10 do
		Effect(Enum.MeshType.Brick, Vector3.new(1, 1, 1) * 4, 0, Enum.Material.Neon, getrandomcolor(), root.Position, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20)) / 10, Vector3.new(1, 1, 1) * -0.05, Vector3.new(), 0, 0)
	end
	local alreadytouched = {}
	for i, ht in pairs(findAllNearestTorso(root.Position, 20)) do
		local hit = ht.Parent
		if checkIfNotPlayer(ht) and hit:FindFirstChildOfClass("Humanoid") and 0 < hit:FindFirstChildOfClass("Humanoid").Health then
			local hurt = true
			for i, v in pairs(alreadytouched) do
				if v == hit then
					hurt = false
				end
			end
			if hurt == true then
				table.insert(alreadytouched, hit)
				if hit:FindFirstChildOfClass("Humanoid") then
					local hum = hit:FindFirstChildOfClass("Humanoid")
					if hum.MaxHealth > 1.0E100 then
						remote:FireServer("breakjoints", hit)
					else
						remote:FireServer("damage", hum, hum.MaxHealth / math.random(1, 1))
					end
					if hit:FindFirstChild("Torso") then
						sound(hithard, hit:FindFirstChild("Torso").Position, 5, math.random(9, 11) / 10, nil, 0.05)
					elseif hit:FindFirstChild("UpperTorso") then
						sound(hithard, hit:FindFirstChild("UpperTorso").Position, 5, math.random(9, 11) / 10, nil, 0.05)
					end
					remote:FireServer("stand", hum, 1)
				end
			end
		end
	end
	for i = 1, 30 do
		rs:wait()
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1), 0.2)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.2)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(-20)), 0.2)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(20)), 0.2)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(0)), 0.1)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.925, 0) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(-20)), 0.2)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.925, 0) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(20)), 0.2)
	end
	freeze()
	noidle = false
	animsync = false
end
mouse.KeyDown:connect(function(key)
	if plr == lplr and debounce == false and key == "r" then
		debounce = true
		typeattack()
		debounce = false
	end
end)
local comboattack = 1
local timer = 0
mouse.Button1Down:connect(function()
	if plr == lplr and debounce == false then
		debounce = true
		timer = 20
		if comboattack == 1 then
			comboattack = 2
			clickattack()
		elseif comboattack == 2 then
			comboattack = 3
			clickattack2()
		else
			comboattack = 1
			clickattack3()
		end
		debounce = false
	end
end)
remote.OnClientEvent:Connect(function(k, a, e, f, g, h, i, m, t)
	if plr ~= lplr and k == "coords" then
		if animsync == true then
			hed.Weld.C0 = a[1]
			hed.Weld.C1 = a[2]
			larm.Weld.C0 = a[3]
			rarm.Weld.C0 = a[4]
			torso.Weld.C0 = a[5]
			lleg.Weld.C0 = a[6]
			rleg.Weld.C0 = a[7]
		end
		if skin_custom then
			hed.BrickColor = skin_color
			torso.BrickColor = skin_color
			rarm.BrickColor = skin_color
			larm.BrickColor = skin_color
			rleg.BrickColor = skin_color
			lleg.BrickColor = skin_color
		end
		currentmusic = m
		pose = f
		wingpose = g
		animsync = h
		walking = i
		if soundz and t and (soundz.TimePosition - t > 0.8 or soundz.TimePosition - t < -0.8) then
			soundz.TimePosition = t
		end
		if 0.8 < sine - e or -0.8 > sine - e then
			sine = e
		end
	end
end)
if plr ~= lplr then
	repeat
		rs:wait()
	until currentmusic ~= nil
	musik(currentmusic)
end
mouse.KeyDown:connect(function(key)
	key = string.lower(key)
	if string.byte(key) == 50 then
		do
			local walkinglocal = true
			local keyConnection = mouse.KeyUp:connect(function(key)
				if string.byte(key) == 50 then
					walkinglocal = false
				end
			end)
			walking = true
			repeat
				rs:wait()
			until walkinglocal == false
			keyConnection:disconnect()
			walking = false
		end
	end
end)
rs:connect(function()
	hum.MaxHealth = 200
	if p.Character.Parent == nil then
		local model = Instance.new("Model")
		model.Name = p.Name
		p.Character = model
		for i, v in pairs(char:GetChildren()) do
			v.Parent = p.Character
		end
	end
	char = p.Character
	if p.Character.Parent ~= workspace then
		p.Character.Parent = workspace
	end
	for i, v in pairs(char:GetChildren()) do
		if v:IsA("Accoutrement") then
			if v.Handle:FindFirstChild("Mesh") then
				v.Handle:FindFirstChild("Mesh").Offset = Vector3.new()
				v.Handle.Transparency = 0
			end
		elseif v:IsA("BasePart") then
			v.Anchored = false
			if v:FindFirstChildOfClass("BodyPosition") then
				v:FindFirstChildOfClass("BodyPosition"):Destroy()
			end
			if v:FindFirstChildOfClass("BodyVelocity") then
				v:FindFirstChildOfClass("BodyVelocity"):Destroy()
			end
			if v:FindFirstChildOfClass("BodyGyro") and v:FindFirstChildOfClass("BodyGyro").Name ~= "lolnochara" then
				v:FindFirstChildOfClass("BodyGyro"):Destroy()
			end
			if v:FindFirstChild("Mesh") then
				v:FindFirstChild("Mesh").Offset = Vector3.new()
			end
			if not DebrisModel:FindFirstChild(v.Name .. "FORCEFIELD") then
				local force = Instance.new("Part", DebrisModel)
				force.Name = v.Name .. "FORCEFIELD"
				if v ~= hed then
					force.Size = v.Size + Vector3.new(1, 1, 1) * 0.2
				else
					force.Size = Vector3.new(1, 1, 1) * v.Size.Y + Vector3.new(1, 1, 1) * 0.2
				end
				force.CanCollide = false
				force.Transparency = 1
				force.Color = Color3.new(0, 1, 1)
				force.Material = Enum.Material.Neon
				newWeld(v, force, 0, 0, 0)
			elseif not DebrisModel:FindFirstChild(v.Name .. "FORCEFIELD"):FindFirstChildOfClass("Weld") then
				newWeld(v, DebrisModel:FindFirstChild(v.Name .. "FORCEFIELD"), 0, 0, 0)
			end
			if v.Name ~= "HumanoidRootPart" then
				v.Transparency = 0
			else
				v.Transparency = 1
			end
		end
	end
	if frozen == false then
		if walking == false then
			change = 1
			movement = 20
			hum.WalkSpeed = 50
		else
			change = 0.5
			movement = 8
			hum.WalkSpeed = 20
		end
	end
	for i, v in pairs(DebrisModel:GetChildren()) do
		if v.Name == "LIGHTNING" then
			local vm = v:FindFirstChildOfClass("BlockMesh")
			vm.Scale = vm.Scale - Vector3.new(0.05, 0.05, 0)
			if 0 >= vm.Scale.X then
				v:Destroy()
			end
		end
	end
	local ray1 = Ray.new(root.Position + Vector3.new(size, 0, 0), Vector3.new(0, -4, 0))
	local part1, endPoint = workspace:FindPartOnRay(ray1, char)
	local ray2 = Ray.new(root.Position - Vector3.new(size, 0, 0), Vector3.new(0, -4, 0))
	local part2, endPoint = workspace:FindPartOnRay(ray2, char)
	local ray3 = Ray.new(root.Position + Vector3.new(0, 0, size / 2), Vector3.new(0, -4, 0))
	local part3, endPoint = workspace:FindPartOnRay(ray3, char)
	local ray4 = Ray.new(root.Position - Vector3.new(0, 0, size / 2), Vector3.new(0, -4, 0))
	local part4, endPoint = workspace:FindPartOnRay(ray4, char)
	local ray5 = Ray.new(root.Position + Vector3.new(size, 0, size / 2), Vector3.new(0, -4, 0))
	local part5, endPoint = workspace:FindPartOnRay(ray5, char)
	local ray6 = Ray.new(root.Position - Vector3.new(size, 0, size / 2), Vector3.new(0, -4, 0))
	local part6, endPoint = workspace:FindPartOnRay(ray6, char)
	local ray7 = Ray.new(root.Position + Vector3.new(size, 0, -size / 2), Vector3.new(0, -4, 0))
	local part7, endPoint = workspace:FindPartOnRay(ray7, char)
	local ray8 = Ray.new(root.Position - Vector3.new(size, 0, -size / 2), Vector3.new(0, -4, 0))
	local part8, endPoint = workspace:FindPartOnRay(ray8, char)
	local ray = Ray.new(root.Position, Vector3.new(0, -6, 0))
	local part, endPoint = workspace:FindPartOnRay(ray, char)
	if part1 or part2 or part3 or part4 or part5 or part6 or part7 or part8 then
		jumped = false
	else
		endPoint = 0
		jumped = true
	end
	if plr == lplr and drew == true then
		if timer > 0 then
			timer = timer - 1
		else
			comboattack = 1
		end
		if custom_outfits == true then
			p:ClearCharacterAppearance()
			if hed:FindFirstChild("face") then
				hed:FindFirstChild("face"):Destroy()
			end
		end
		if root.Position.Y < workspace.FallenPartsDestroyHeight + 200 then
			char:MoveTo(Vector3.new(0, 0, 0))
		end
		if 0 < hum.Health and noidle == false then
			if hum.Sit == false then
				if (root.Velocity * Vector3.new(1, 0, 1)).magnitude >= 5 and jumped == false then
					animation("Run")
				elseif jumped == true then
					didjump = true
					jumppower = root.Velocity.Y
					animation("Jump")
				elseif (torso.Velocity * Vector3.new(1, 0, 1)).magnitude < 5 then
					animation("Idle")
				end
			else
				animation("Sit")
			end
		end
		if didjump and jumped == false then
			jumpimpact(jumppower)
			didjump = false
		end
		if (torso.Velocity * Vector3.new(1, 0, 1)).magnitude >= 5 and jumped == false and noidle == false then
			if hed:FindFirstChild("Running") then
				hed.Running:Destroy()
			end
			if math.cos(sine / 4) / 2 <= -0.2 and sidestep == 0 then
				local a = sound(131436155, rleg.Position, 2, math.random(7, 8) / 10)
				a.Parent = rleg
				sidestep = 1
			end
			if 0.2 <= math.cos(sine / 4) / 2 and sidestep == 1 then
				local a = sound(131436155, lleg.Position, 2, math.random(7, 8) / 10)
				a.Parent = lleg
				sidestep = 0
			end
		end
		local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
		local asd2 = Vector3.new(math.random(-10000, 10000) / 10000, 0, math.random(-10000, 10000) / 10000)
		if skin_custom then
			hed.BrickColor = skin_color
			torso.BrickColor = skin_color
			rarm.BrickColor = skin_color
			larm.BrickColor = skin_color
			rleg.BrickColor = skin_color
			lleg.BrickColor = skin_color
		end
		local timepos
		if soundz then
			timepos = soundz.TimePosition
		end
		local stuffs = {
			hed.Weld.C0,
			hed.Weld.C1,
			larm.Weld.C0,
			rarm.Weld.C0,
			torso.Weld.C0,
			lleg.Weld.C0,
			rleg.Weld.C0
		}
		remote:FireServer("coords", stuffs, sine, pose, wingpose, animsync, walking, currentmusic, timepos)
	end
	if plr ~= lplr and drew then
		noidle = false
		if animsync == false then
			animation(pose)
		end
	end
	if char:FindFirstChild("MusicRuin") then
		local e = -0.5 + (root.Position - workspace.CurrentCamera.CFrame.Position).magnitude / 8
		if e < 0 then
			e = 0
		end
		if e > 10 then
			e = 10
		end
		char:FindFirstChild("MusicRuin").Volume = 10 - e + 0.1
	end
	for i, v in pairs(emitters) do
		v.Color = ColorSequence.new(getrandomcolor())
	end
	for i, v in pairs(gauntletr.Neon:GetChildren()) do
		v.Color = getrandomcolor()
	end
	for i, v in pairs(gauntletl.Neon:GetChildren()) do
		v.Color = getrandomcolor()
	end
	for i = 1, 3 do
		local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
		local asd2 = Vector3.new(math.random(-10000, 10000) / 10000, 0, math.random(-10000, 10000) / 10000)
		Effekt(Enum.MeshType.Brick, Vector3.new(1, 1, 1), 0.9, Enum.Material.Neon, getrandomcolor(), root.Position + asd * 1, asd * 360, root.Velocity / 110 + asd / 40, Vector3.new(1, 1, 1) * -0.1, asd * 5, 0, 0)
	end
	sine = sine + change
end)
remote.OnClientEvent:Connect(function(k)
	if k == "stop" then
		script:Destroy()
		if plr == lplr then
			GUI:Destroy()
		end
	end
end)
