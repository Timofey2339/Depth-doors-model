local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")

local player = players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local rooms = workspace:WaitForChild("CurrentRooms")
local gameData = replicatedStorage:WaitForChild("GameData")
local latestRoomValue = gameData:WaitForChild("LatestRoom")

local isDestroyed = false
local entity = nil

local function cleanup()
    if isDestroyed then return end
    isDestroyed = true

    if entity and entity.Parent then
        entity:Destroy()
    end

    local watcher = workspace:FindFirstChild("Watcher")
    if watcher then
        watcher:Destroy()
    end
end

if workspace:FindFirstChild("SeekMovingNewClone") or rooms:FindFirstChild("50") then
    return
end

local seekConn
seekConn = workspace.ChildAdded:Connect(function(child)
    if child.Name == "SeekMovingNewClone" then
        seekConn:Disconnect()
        cleanup()
    end
end)

local roomConn
roomConn = rooms.ChildAdded:Connect(function(child)
    if child.Name == "50" then
        roomConn:Disconnect()
        cleanup()
    end
end)

pcall(function()
    entity = game:GetObjects("rbxassetid://79312363226377")[1]
    entity.Name = "Watcher"
    entity.Parent = workspace
end)

if not entity then
    warn("Entity model didn't load!")
    entity = Instance.new("Part")
    entity.Name = "Watcher"
    entity.Parent = workspace
end

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://137162043074149"
sound.Volume = 1
sound.Parent = workspace

local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))
if not room then
    warn("didn't find room")
    cleanup()
    return
end

entity:PivotTo(room:GetPivot() * CFrame.new(0, 0, -25))

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
rayParams.FilterDescendantsInstances = {char, entity}

local camera = workspace.CurrentCamera
local currentRoomNumber = latestRoomValue.Value

while task.wait(0.4) do
    if isDestroyed then break end

    if latestRoomValue.Value ~= currentRoomNumber then
        cleanup()
        break
    end
    
    if not entity or not entity.Parent then break end
    
    local pos = entity:GetPivot().Position
    local _, visible = camera:WorldToScreenPoint(pos)
    
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
            
            local playerStats = replicatedStorage:FindFirstChild("GameStats")
            if playerStats and playerStats:FindFirstChild("Player_" .. player.Name) then
                playerStats["Player_" .. player.Name]["Total"].DeathCause.Value = "Watcher"
            end
            
            sound:Play()
        end
    end
end

if seekConn then seekConn:Disconnect() end
if roomConn then roomConn:Disconnect() end
