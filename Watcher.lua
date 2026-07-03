
local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

rayParams.FilterDescendantsInstances = {char}

local rooms = workspace:WaitForChild("CurrentRooms")
local gameData = game.ReplicatedStorage:WaitForChild("GameData")
local latestRoomValue = gameData:WaitForChild("LatestRoom")

task.spawn(function()
    while true do
        task.wait(0.1)
        latestRoomValue.Changed:Wait()
        if workspace:FindFirstChild("SeekMovingNewClone") or rooms:FindFirstChild("50") then
            return
        end
    end
end)

local entity
pcall(function()
    entity = game:GetObjects("rbxassetid://79312363226377")[1]
    entity.Parent = workspace
end)

if not entity then
    warn("Entity didn't load because of client limit!")
    entity = Instance.new("Part")
    entity.Parent = workspace
end

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://137162043074149"
sound.Volume = 1
sound.Parent = workspace

local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))
if not room then
	warn("Кімнату не знайдено!")
	return
end

entity:PivotTo(room:GetPivot() * CFrame.new(0, 0, -25))

local camera = workspace.CurrentCamera
local currentRoomNumber = latestRoomValue.Value

local dead = false
hum.Died:Connect(function()
	if dead then return end
	dead = true
	warn("Player Died")
	pcall(function()
						-- UI Construction
    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")
	local SizeValue = Instance.new("NumberValue")

	SizeValue.Name = "SizeValue"
	SizeValue.Value = -0.07

    JumpscareGui.Name = "Jumpscare"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Background.Name = "Frame"
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 50

    Face.Name = "ImageLabel"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0.25, 0, 0.3, 0)
    Face.Image = "rbxassetid://13335477221"

local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://130344085927615"
scare.PlaybackSpeed = 0.8
scare.Volume = 10

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 0.65

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background

local v2 = Random.new()
SizeValue.Value = -0.07
scare:Play()
local v4 = math.random(1, 2)
for v5 = 1, 7 do
	local randint = math.random(1, 3)
	if randint == 1 then
		Background.BackgroundColor3 = Color3.fromRGB(245, 205, 48)
		Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	elseif randint == 2 then
		Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Face.ImageColor3 = Color3.new(1, 0, 0)
	elseif randint == 3 then
		Background.BackgroundColor3 = Color3.fromRGB(218, 133, 65)
		Background.BorderColor3 = Color3.fromRGB(218, 133, 65)
		Face.ImageColor3 = Color3.new(0.67451, 0.376471, 0.376471)
	end
	Face.Position = UDim2.new(v2:NextNumber(0.2, 0.3), 0, v2:NextNumber(0.7, 0.9), 0)
	Face.Size += UDim2.new(0, SizeValue.Value, 0, SizeValue.Value)
	Face.Rotation = math.random(-25, 25)
	SizeValue.Value += 0.4
	wait(0)
end
Face.ImageColor3 = Color3.new(1, 1, 1)
Background.BackgroundColor3 = Color3.new(0, 0, 0)
JumpscareGui.Enabled = false
	end)
end)

while task.wait(0.4) do
	if latestRoomValue.Value ~= currentRoomNumber then
		entity:Destroy()
		break
	end
	
	if not entity.Parent then break end
	
	local pos = entity:GetPivot().Position
	local _, visible = camera:WorldToScreenPoint(pos)
	
	local origin = camera.CFrame.Position
	local direction = (pos - origin).Unit * (pos - origin).Magnitude
	
	local result = workspace:Raycast(origin, direction, rayParams)
	
	local isLooking = false
	local isBlocked = false

	if visible then
		local lookVector = camera.CFrame.LookVector
		local directionToMonster = (pos - camera.CFrame.Position).Unit
		local dot = lookVector:Dot(directionToMonster)
		
		if dot > 0.7 then
			isLooking = true
		end
	end

	local obscuringParts = camera:GetPartsObscuringTarget(
		{pos},
		{char, entity}
	)

	if #obscuringParts > 0 then
		isBlocked = true
	end

	if not isLooking and not isBlocked then
		if hum.Health > 0 then
			hum.Health -= 2
			sound:Play()
		end
	end
end
