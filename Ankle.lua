local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local rooms = workspace:WaitForChild("CurrentRooms")
local gameData = game.ReplicatedStorage:WaitForChild("GameData")

local latestRoomValue = gameData:WaitForChild("LatestRoom")

local entity = game:GetObjects("rbxassetid://80648035882957")[1]
entity.Parent = workspace


local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))

if not room then
	warn("Room not found")
	return
end

entity:PivotTo(room:GetPivot() * CFrame.new(0,0,-40))

local camera = workspace.CurrentCamera
local currentRoomNumber = latestRoomValue.Value

while task.wait(0.4) do
	
	if latestRoomValue.Value ~= currentRoomNumber then
		entity:Destroy()
		break
	end
