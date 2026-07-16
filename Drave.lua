local assetId = "75282420388597"
local Shocker

local success, objects = pcall(function()
    return game:GetObjects("rbxassetid://" .. assetId)
end)

if not success or not objects then
    success, objects = pcall(function()
        return getobjects(assetId)
    end)
end

if success and objects and objects[1] then
    Shocker = objects[1]
else
    warn("DIDN'T FIND getobjects.")
    return
end

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local humRoot = char:WaitForChild("HumanoidRootPart")
local camera = game.Workspace.CurrentCamera
local TweenService = game:GetService("TweenService")

local shockerPart = Shocker:FindFirstChild("Part") 
    or Shocker:FindFirstChildWhichIsA("BasePart") 
    or Shocker:FindFirstChildWhichIsA("MeshPart")

if not shockerPart and Shocker:IsA("Model") then
    shockerPart = Shocker.PrimaryPart or Shocker:FindFirstChildWhichIsA("BasePart", true)
end

if not shockerPart then
    warn("!")
    return
end


Shocker.Parent = workspace
shockerPart.Anchored = true
shockerPart.CanCollide = false
shockerPart.CFrame = humRoot.CFrame * CFrame.new(0, 0, -13) * CFrame.Angles(0, math.pi, 0)

local isActive = true
local playerLookedAway = false

local function isLookingAtShocker()
    local cameraLook = (camera.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
    local toShocker = ((shockerPart.Position - camera.CFrame.Position) * Vector3.new(1, 0, 1)).Unit
    local dot = cameraLook:Dot(toShocker)
    return dot > 0.70
end

task.delay(0.1, function()
    while isActive do
        task.wait(0.05)
        if not isLookingAtShocker() then
            playerLookedAway = true
            isActive = false
            break
        end
    end
end)

task.wait(1.5)
isActive = false

if playerLookedAway then
   
    print(".")
    
    local dropCFrame = shockerPart.CFrame + Vector3.new(0, -35, 0)
    local dropTweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local dropTween = TweenService:Create(shockerPart, dropTweenInfo, {CFrame = dropCFrame})
    
    dropTween:Play()
    dropTween.Completed:Wait()
    
    if Shocker then Shocker:Destroy() end
    
    -- Видача ачівки
    local playerGui = plr:FindFirstChild("PlayerGui")
    local GUI = playerGui and playerGui:FindFirstChild("MainUI")
    if GUI and GUI:FindFirstChild("AchievementsHolder") then
        local template = GUI.AchievementsHolder:FindFirstChild("Achievement")
        if template then
            local AchievementsHolder = template:Clone()
            local Details = {
                Description = "Look at me.",
                Title = "Shocking Experience",
                Reason =  "Encounter Shocker.",
                Icon = "http://www.roblox.com/asset/?id=114741023833269"
            }   
            AchievementsHolder.Size = UDim2.new(0, 0, 0, 0)
            AchievementsHolder.Frame.Position = UDim2.new(1.1, 0, 0, 0)
            AchievementsHolder.Name = "LiveAchievement"
            AchievementsHolder.Visible = true
            AchievementsHolder.Parent = GUI.AchievementsHolder
            AchievementsHolder.Frame.Details.Desc.Text = Details.Description
            AchievementsHolder.Frame.Details.Title.Text = Details.Title
            AchievementsHolder.Frame.Details.Reason.Text = Details.Reason
            AchievementsHolder.Frame.ImageLabel.Image = Details.Icon
            AchievementsHolder.Sound:Play()
            
            AchievementsHolder:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true)
            task.wait(0.8)
            AchievementsHolder.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
            task.wait(4)
            AchievementsHolder.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true)
            task.wait(0.5)
            AchievementsHolder:Destroy()
        end
    end
else
    print("ATTACK!")
    
    local scream = shockerPart:FindFirstChild("HORROR SCREAM 15")
    if scream and scream:IsA("Sound") then 
        scream:Play() 
    end
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:TakeDamage(30)
    end
    
    
    local targetCFrame = humRoot.CFrame * CFrame.new(0, 0, -3) 
    local flightTweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local flightTween = TweenService:Create(shockerPart, flightTweenInfo, {CFrame = targetCFrame})
    
    flightTween:Play()
    flightTween.Completed:Wait()
    
    local dropCFrame = shockerPart.CFrame + Vector3.new(0, -35, 0)
    local dropTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local dropTween = TweenService:Create(shockerPart, dropTweenInfo, {CFrame = dropCFrame})
    
    dropTween:Play()
    dropTween.Completed:Wait()
    
    if Shocker then Shocker:Destroy() end
end
