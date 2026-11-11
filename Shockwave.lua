local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local success, result = pcall(function()
    local assets = game:GetObjects("rbxassetid://120067832776182")
    return assets[1]
end)

if not success or not result then
    return
end

local monsterPart
if result:IsA("Model") then
    result.Parent = workspace
    result.Name = "Shockwave"
    monsterPart = result:FindFirstChild("monster") or result.PrimaryPart or result:FindFirstChildWhichIsA("BasePart")
    if result.PrimaryPart == nil and monsterPart then
        result.PrimaryPart = monsterPart
    end
elseif result:IsA("BasePart") then
    local model = Instance.new("Model")
    model.Name = "Shockwave"
    model.Parent = workspace
    result.Parent = model
    monsterPart = result
    model.PrimaryPart = monsterPart
    result = model
end

if not monsterPart then
    result:Destroy()
    return
end

monsterPart.Size = Vector3.new(6, 6, 6)
if monsterPart:IsA("Part") then
    monsterPart.Shape = Enum.PartType.Ball
end
monsterPart.CanCollide = false
monsterPart.Anchored = true

local rooms = workspace:FindFirstChild("CurrentRooms")
local gameData = game.ReplicatedStorage:FindFirstChild("GameData")

if rooms and gameData then
    local latestRoomValue = gameData:FindFirstChild("LatestRoom")
    if latestRoomValue then
        local targetRoomNumber = latestRoomValue.Value + 1
        local room = rooms:WaitForChild(tostring(targetRoomNumber), 1)
        
        if room then
            local parts = room:FindFirstChild("Parts")
            if parts then
                local floor = parts:FindFirstChild("Floor")
                if floor then
                    result:PivotTo(floor.CFrame * CFrame.new(0, 10, 0))
                end
            end
        end
        
        local roomChanges = 0
        local connection
        connection = latestRoomValue.Changed:Connect(function()
            roomChanges = roomChanges + 1
            if roomChanges >= 2 then
                if result and result.Parent then
                    result:Destroy()
                end
                if connection then
                    connection:Disconnect()
                end
            end
        end)
    end
end

local touchSound = Instance.new("Sound")
touchSound.SoundId = "rbxassetid://92090867642655"
touchSound.Volume = 5
touchSound.TimePosition = 0.4
touchSound.Parent = monsterPart

local debounces = {}
monsterPart.Touched:Connect(function(hit)
    local hitChar = hit.Parent
    local humanoid = hitChar and hitChar:FindFirstChildOfClass("Humanoid")
    
    if humanoid and hitChar:FindFirstChild("HumanoidRootPart") then
        local hitPlayer = Players:GetPlayerFromCharacter(hitChar)
        if hitPlayer == player then
            if not debounces[player] then
                debounces[player] = true
                
                humanoid.Health = humanoid.Health - 50
                touchSound:Play()
                
                task.delay(1, function()
                    debounces[player] = false
                end)
            end
        end
    end
end)

local moveConnection
moveConnection = RunService.RenderStepped:Connect(function(dt)
    if not result or not result.Parent then
        if moveConnection then moveConnection:Disconnect() end
        return
    end

    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local targetPos = char.HumanoidRootPart.Position + Vector3.new(0, 0, 0)
        local currentPos = result:GetPivot().Position
        
        local speed = 0.15
        
        local newPos = currentPos:Lerp(targetPos, math.clamp(dt * speed, 0, 1))
        result:PivotTo(CFrame.new(newPos))
    end
end)
