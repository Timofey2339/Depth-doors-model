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
    warn("Entity model didn't load!")
    entity = Instance.new("Part")
    entity.Parent = workspace
end

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://137162043074149"
sound.Volume = 1
sound.Parent = workspace

local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))
if not room then
	warn("didn't find room")
	return
end

entity:PivotTo(room:GetPivot() * CFrame.new(0, 0, -25))

local camera = workspace.CurrentCamera
local currentRoomNumber = latestRoomValue.Value

local dead = false
hum.Died:Connect(function()
	if dead then return end
	dead = true
	warn("player died")
	pcall(function()
	
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
