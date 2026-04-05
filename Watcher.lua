І у цьому скрипті local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local rooms = workspace:WaitForChild("CurrentRooms")
local gameData = game.ReplicatedStorage:WaitForChild("GameData")

local latestRoomValue = gameData:WaitForChild("LatestRoom")

local entity = game:GetObjects("rbxassetid://79312363226377")[1]
entity.Parent = workspace

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://137162043074149"
sound.Volume = 1
sound.Parent = workspace

local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))

if not room then
	warn("Room not found")
	return
end

entity:PivotTo(room:GetPivot() * CFrame.new(0,0,-25))

local camera = workspace.CurrentCamera
local currentRoomNumber = latestRoomValue.Value

while task.wait(0.4) do
	
	if latestRoomValue.Value ~= currentRoomNumber then
		entity:Destroy()
		break
	end
	
	if not entity.Parent then break end
	
	local pos = entity:GetPivot().Position
	
	local _, visible = camera:WorldToScreenPoint(pos)
	
	local origin = camera.CFrame.Position
	local direction = pos - origin
	
	local rayParams = RaycastParams.new()
	rayParams.FilterDescendantsInstances = {char, entity}
	rayParams.FilterType = Enum.RaycastFilterType.Blacklist
	
	local result = workspace:Raycast(origin, direction, rayParams)
	
	local canSee = false
	
	if visible then
		if result then
			if result.Instance:IsDescendantOf(entity) then
				canSee = true
			end
		else
			canSee = true
		end
	end
	
	if not canSee then
		if hum.Hea lth > 0 then
			hum.Health -= 5
			sound:Play()
		end
	end
	
end	break
	end
	
	if not entity.Parent then break end
	
	local pos = entity:GetPivot().Position
	
	local _, visible = camera:WorldToScreenPoint(pos)
	
	local origin = camera.CFrame.Position
	local direction = pos - origin
	
	local rayParams = RaycastParams.new()
	rayParams.FilterDescendantsInstances = {char, entity}
	rayParams.FilterType = Enum.RaycastFilterType.Blacklist
	
	local result = workspace:Raycast(origin, direction, rayParams)
	
	local blocked = false
	
	if result then
		if not result.Instance:IsDescendantOf(entity) then
			blocked = true
		end
	end
	
	if (not visible) and (not blocked) then
		if hum.Health > 0 then
			hum.Health -= 5
			sound:Play()
		end
	end
	
end
	if not entity.Parent then break end
	
	local pos = entity:GetPivot().Position
	
	local _, visible = camera:WorldToScreenPoint(pos)
	
	local origin = camera.CFrame.Position
	local direction = pos - origin
	
	local rayParams = RaycastParams.new()
	rayParams.FilterDescendantsInstances = {char, entity}
	rayParams.FilterType = Enum.RaycastFilterType.Blacklist
	
	local result = workspace:Raycast(origin, direction, rayParams)
	
	local canSee = false
	
	if visible then
		if result then
			if result.Instance:IsDescendantOf(entity) then
				canSee = true
			end
		else
			canSee = true
		end
	end
	
	if not canSee then
		if hum.Health > 0 then
			hum.Health -= 5
			sound:Play()
		end
	end
	
end
