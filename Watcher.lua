coroutine.wrap(function()
    while true do
        wait(0.1)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        if workspace:FindFirstChild("SeekMovingNewClone") or workspace.CurrentRooms:FindFirstChild("50") then
            return
        end
    end
end)
	
local player = game.Players.LocalPlayer
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
		hum.Health -= 3
		sound:Play()
	elseif hum.Health < 0
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Jumpscare/Watcher%20Jumpscare.lua"))()
	end
end


