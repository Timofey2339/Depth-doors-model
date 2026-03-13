local room = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
local oldDoor = room:FindFirstChild("Door")

local NewDoor = game:GetObjects("rbxassetid://12245371479")[1]

if oldDoor then
	NewDoor.CFrame = oldDoor.CFrame
	oldDoor:Destroy()
end

NewDoor.Parent = room
