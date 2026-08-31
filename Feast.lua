local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Feast",
            Asset = "https://github.com/BaneFromDiscord/RobloxTest/blob/main/feast.rbxm?raw=true",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 0},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 45, Values = {5, 5, 0.1, 1} },
        Movement = { Speed = 50, Delay = 2, Reversed = false },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 45, Amount = 0.1 },
        Crucifixion = { Enabled = true, Range = 15, Resist = false, Break = false },
        Death = {
            Type = "Guiding",
            Hints = {"death", "hints", "go","here"}, 
            Cause = "Feast"
        }
    })

    entity:SetCallback("OnSpawned", function()
        wait(0.2)
    game.Workspace:FindFirstChild("Feast").monster.Static:Play()
    game.Workspace:FindFirstChild("Feast").monster.Static.DistortionSoundEffect.Level = 0.98
    game.Workspace:FindFirstChild("Feast").monster.Static.PitchShiftSoundEffect.Octave = 1
    game.Workspace:FindFirstChild("Feast").monster.Static.SoundId = "rbxassetid://5813077875"
    game.Workspace:FindFirstChild("Feast").monster.Static.RollOffMaxDistance = 125
    game.Workspace:FindFirstChild("Feast").monster.Static.PlaybackSpeed = 0.5
    game.Workspace:FindFirstChild("Feast").monster.Static.RollOffMinDistance = 15
    game.Workspace:FindFirstChild("Feast").monster.Static.TimePosition = 0
    game.Workspace:FindFirstChild("Feast").monster.Static.RollOffMode = Enum.RollOffMode.LinearSquare
    end)

entity:SetCallback("OnDamagePlayer", function()
game.Workspace:FindFirstChild("Feast").monster:FindFirstChild("Static").Volume = 0
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpscareGui"
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Parent = screenGui

local image = Instance.new("ImageLabel")
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.Position = UDim2.new(0.5, 0, 0.5, 0)
image.Size = UDim2.new(0.2, 0, 0.4, 0)
image.BackgroundTransparency = 1
image.Image = "http://www.roblox.com/asset/?id=11703907763"

image.Parent = background

local randomsize = math.random(1, 7)

if randomsize == 1 then
    image.Size = UDim2.new(0.1, 0, 0.2, 0)
    wait(2)
    image.Size = UDim2.new(0.3, 0, 0.5, 0)
    wait(4)
end
if randomsize == 2 then
    image.Size = UDim2.new(0.1, 0, 0.2, 0)
    wait(1)
    image.Size = UDim2.new(0.2, 0, 0.4, 0)
    wait(2)
end
if randomsize == 3 then
    image.Size = UDim2.new(0.1, 0, 0.2, 0)
    wait(1)
    image.Size = UDim2.new(0.2, 0, 0.4, 0)
    wait(2)
    image.Size = UDim2.new(0.3, 0, 0.5, 0)
    wait(4)
end
if randomsize == 4 then
    image.Size = UDim2.new(0.1, 0, 0.2, 0)
    wait(2)
end
if randomsize == 5 then
    image.Size = UDim2.new(0.2, 0, 0.4, 0)
    wait(1)
    image.Size = UDim2.new(0.25, 0, 0.45, 0)
    wait(2)
    image.Size = UDim2.new(0.3, 0, 0.5, 0)
    wait(4)
end
if randomsize == 6 then
    image.Size = UDim2.new(0.15, 0, 0.25, 0)
    wait(1)
    image.Size = UDim2.new(0.2, 0, 0.4, 0)
    wait(2)
end
if randomsize == 7 then
    image.Size = UDim2.new(0.2, 0, 0.4, 0)
    wait(2)
    image.Size = UDim2.new(0.25, 0, 0.35, 0)
    wait(2)
end

local tweenInfo = TweenInfo.new(
    0.7,


    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)

local targetSize = {
    Size = UDim2.new(2, 0, 4, 0)
}

local zoomTween = TweenService:Create(image, tweenInfo, targetSize)

local function playJumpscare()
image.ImageTransparency = 0.5
    local jumpscaresound = Instance.new("Sound")
    jumpscaresound.Volume = 5
    jumpscaresound.TimePosition = 0
    jumpscaresound.Parent = background
    jumpscaresound.SoundId = "rbxassetid://103873246536659"
    jumpscaresound:Play()
    zoomTween:Play()
    
    local startTime = tick()
    local duration = 0.7
    local random = Random.new()
    
    local rotateSpeed = 35
    local maxAngle = 7
    local dropAmount = 0
    local shakeIntensity = 20 

    local connection
    connection = RunService.RenderStepped:Connect(function()
        local elapsedTime = tick() - startTime
        
        if elapsedTime < duration then
            local progress = elapsedTime / duration
            
            image.Rotation = math.sin(elapsedTime * rotateSpeed) * maxAngle
            
            local currentY = 0.5 + (progress * dropAmount)
            
            local offsetX = random:NextInteger(-shakeIntensity, shakeIntensity)
            local offsetY = random:NextInteger(-shakeIntensity, shakeIntensity)
            image.Position = UDim2.new(0.5, offsetX, currentY, offsetY)
            
            local redAmount = random:NextInteger(50, 180)
            background.BackgroundColor3 = Color3.fromRGB(redAmount, 0, 0)
        else
            connection:Disconnect()
            screenGui:Destroy()
        end
    end)
end

playJumpscare()
game.ReplicatedStorage.GameStats["Player_" .. game.Players.LocalPlayer.Name]["Total"].DeathCause.Value = "Feast"
wait(0.7)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
