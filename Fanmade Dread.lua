local assetId = "rbxassetid://15439261945"

local clock = game:GetObjects(assetId)[1]
clock.Parent = workspace

local rooms = workspace:WaitForChild("CurrentRooms")

local latest = game.ReplicatedStorage.GameData.LatestRoom.Value
local room = rooms:FindFirstChild(latest)

if room then
    local floor = room:WaitForChild("Parts"):WaitForChild("Floor")

    local offsetX = 0
    local offsetY = 5
    local offsetZ = 0
    local rotateY = 0

    clock:PivotTo(
        floor.CFrame
        * CFrame.new(offsetX, offsetY, offsetZ)
        * CFrame.Angles(0, math.rad(rotateY), 0)
    )
end
