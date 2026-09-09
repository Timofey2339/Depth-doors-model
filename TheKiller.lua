local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")

local currentRooms = workspace:WaitForChild("CurrentRooms")
local player = Players.LocalPlayer

local assetId = "rbxassetid://86187623554884"
local canTakeDamage = true

local function tweenModel(model, targetCFrame, duration)
    local cframeValue = Instance.new("CFrameValue")
    cframeValue.Value = model:GetPivot()

    local connection
    connection = cframeValue.Changed:Connect(function(newCFrame)
        if model and model.Parent then
            model:PivotTo(newCFrame)
        end
    end)

    local tween = TweenService:Create(cframeValue, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Value = targetCFrame})
    tween:Play()

    tween.Completed:Connect(function()
        connection:Disconnect()
        cframeValue:Destroy()
    end)

    return tween
end

local function setupDamage(clock)
    for _, part in ipairs(clock:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Touched:Connect(function(hit)
                local char = player.Character
                if char and hit:IsDescendantOf(char) then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 and canTakeDamage then
                        canTakeDamage = false
                        hum.Health -= 45
                        
                        local stats = ReplicatedStorage:FindFirstChild("GameStats")
                        if stats and stats:FindFirstChild("Player_" .. player.Name) then
                            stats["Player_" .. player.Name]["Total"].DeathCause.Value = "The Killer"
                        end

                        task.wait(1.5)
                        canTakeDamage = true
                    end
                end
            end)
        end
    end
end

local function getNearbyNodes(currentPos, nodeList, lastNode)
    local neighbors = {}
    local MAX_DISTANCE = 25

    for _, node in ipairs(nodeList) do
        if node ~= lastNode then
            local dist = (currentPos - node.Position).Magnitude
            if dist <= MAX_DISTANCE then
                table.insert(neighbors, node)
            end
        end
    end

    return neighbors
end

local function checkAndSpawn()
    local room50 = currentRooms:FindFirstChild("50")
    if not room50 or workspace:FindFirstChild("The Killer") then return end

    local clock
    pcall(function()
        clock = game:GetObjects(assetId)[1]
        clock.Name = "The Killer"
        clock.Parent = workspace
    end)

    if not clock then return end

    setupDamage(clock)

    task.spawn(function()
        local figureSetup = room50:WaitForChild("FigureSetup", 5)
        local nodesFolder = figureSetup and figureSetup:WaitForChild("FigureNodes", 5)
        
        if not nodesFolder then return end

        local nodeList = {}
        for _, child in ipairs(nodesFolder:GetChildren()) do
            if child:IsA("BasePart") then
                table.insert(nodeList, child)
            end
        end

        if #nodeList == 0 then return end

        local currentNode = nodeList[1]
        clock:PivotTo(currentNode.CFrame)

        local lastNode = nil

        while clock and clock.Parent do
            local currentPos = clock:GetPivot().Position
            
            local nearby = getNearbyNodes(currentPos, nodeList, lastNode)

            local nextNode = nil
            if #nearby > 0 then
                nextNode = nearby[math.random(1, #nearby)]
            else
                nextNode = lastNode or nodeList[math.random(1, #nodeList)]
            end

            if nextNode then
                lastNode = currentNode
                currentNode = nextNode

                local dist = (clock:GetPivot().Position - nextNode.Position).Magnitude
                local speed = 12
                local moveDuration = math.max(dist / speed, 0.3)

                local tween = tweenModel(clock, nextNode.CFrame, moveDuration)
                tween.Completed:Wait()
                task.wait(0.1)
            else
                task.wait(0.5)
            end
        end
    end)
end

currentRooms.ChildAdded:Connect(function(child)
    if child.Name == "50" then
        checkAndSpawn()
    end
end)

checkAndSpawn()
