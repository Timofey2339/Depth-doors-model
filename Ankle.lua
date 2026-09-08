local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local rooms = workspace:WaitForChild("CurrentRooms")
local gameData = game.ReplicatedStorage:WaitForChild("GameData")
local latestRoomValue = gameData:WaitForChild("LatestRoom")

local isDestroyed = false
local entity = nil
local gui = nil

local function cleanup()
    if isDestroyed then return end
    isDestroyed = true

    if entity and entity.Parent then
        entity:Destroy()
    end
    
    local foundAnkle = workspace:FindFirstChild("Ankle")
    if foundAnkle then
        foundAnkle:Destroy()
    end

    if gui and gui.Parent then
        gui:Destroy()
    end
end
coroutine.wrap(function()
    if workspace:FindFirstChild("SeekMovingNewClone") or rooms:FindFirstChild("50") then
        cleanup()
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
        if child.Name == "3" then
            roomConn:Disconnect()
            cleanup()
        end
    end)
end)()

if isDestroyed then return end
entity = game:GetObjects("rbxassetid://80648035882957")[1]
if entity then
    entity.Parent = workspace
    entity.Name = "Ankle"
else
    warn("Entity not loaded!")
    return
end

local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))
if not room then
    warn("Room not found")
    cleanup()
    return
end

entity:PivotTo(room:GetPivot() * CFrame.new(0, 0, -40))

local timer = 30

local spawnSound = Instance.new("Sound")
spawnSound.Parent = workspace
spawnSound.SoundId = "rbxassetid://6305809364"
spawnSound.PlaybackSpeed = 0.28
spawnSound.Volume = 2
spawnSound:Play()

gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Parent = gui
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 233, 182)
label.Position = UDim2.new(0.5, 0, 0.8, 0)
label.AnchorPoint = Vector2.new(0.5, 0.5)
label.Size = UDim2.new(0.4, 0, 0.1, 0)
label.TextScaled = true

local currentRoomNumber = latestRoomValue.Value

while timer > 0 do
    task.wait(1)

    if isDestroyed then
        break
    end

    if latestRoomValue.Value ~= currentRoomNumber then
        cleanup()
        break
    end

    timer -= 1
    label.Text = timer .. " seconds left"
    
    if timer <= 10 then
        label.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end

if timer <= 0 and not isDestroyed then
    local playerStats = game.ReplicatedStorage:FindFirstChild("GameStats")
    if playerStats and playerStats:FindFirstChild("Player_" .. player.Name) then
        playerStats["Player_" .. player.Name]["Total"].DeathCause.Value = "Ankle"
    end
    
    hum.Health = 0

    local killSound = Instance.new("Sound")
    killSound.Parent = workspace
    killSound.SoundId = "rbxassetid://5867708670"
    killSound.Volume = 3
    killSound:Play()

    label.Text = "YOU DIED"
    task.wait(2)
    cleanup()
end
