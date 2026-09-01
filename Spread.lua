local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Spread",
            Asset = "rbxassetid://129165456650153",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 5},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 30, Values = {5, 5, 0.1, 1} },
        Movement = { Speed = 120, Delay = 9, Reversed = true },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 45, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 15, Resist = false, Break = false },
        Death = {
            Type = "Guiding",
            Hints = {"You died by Spread", "if you see electric ball", "wait 5 sec and then hide","be careful"}, 
            Cause = "Spread"
        }
    })

entity:SetCallback("OnSpawned", function()
 local rush = workspace:WaitForChild("Spread"):WaitForChild("RushMoving")
local TweenService = game:GetService("TweenService")
local attachment = rush.Attachment

task.wait(0.05)


rush.CFrame = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts:FindFirstChild("Floor").CFrame+Vector3.new(0, 3, -2)

rush.Footsteps:Stop()
rush.Playsound:Stop()
rush.Footsteps.PlaybackSpeed = 0
rush.Playsound.PlaybackSpeed = 0

rush.Electric.PlaybackSpeed = 1.3
rush.Electric:Play()

attachment.ParticleEmitter.Enabled = false
attachment.ParticleEmitter.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
attachment.Smoke.Enabled = false
attachment.Smoke.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
attachment.StartSmoke.Enabled = true
attachment.PointLight.Enabled = false
attachment.PointLight2.Enabled = true

task.wait(3)

TweenService:Create(attachment.PointLight2, TweenInfo.new(2), {Range = 0}):Play()

local fadeVal = Instance.new("NumberValue")
fadeVal.Value = 1

local fadeConnection = fadeVal.Changed:Connect(function(val)
	attachment.StartSmoke.Size = NumberSequence.new(val * 5)
    attachment.ParticleEmitter.Size = NumberSequence.new(0)
    attachment.Smoke.Size = NumberSequence.new(0)
	rush.Electric.PlaybackSpeed = val
end)

local fadeTween = TweenService:Create(fadeVal, TweenInfo.new(2), {Value = 0})
fadeTween:Play()

fadeTween.Completed:Connect(function()
	fadeConnection:Disconnect()
	fadeVal:Destroy()
	rush.Electric:Stop()
end)

task.wait(3)

rush.Footsteps:Play()
rush.Playsound:Play()
attachment.PointLight.Range = 0
attachment.StartSmoke.Enabled = false
attachment.PointLight.Enabled = true
attachment.PointLight2.Enabled = false
attachment.ParticleEmitter.Enabled = true
attachment.Smoke.Enabled = true
TweenService:Create(attachment.PointLight, TweenInfo.new(2), {Range = 20}):Play()
local TweenService = game:GetService("TweenService")
local attachment = game.Workspace.Spread.RushMoving.Attachment

local sizeVal = Instance.new("NumberValue")
sizeVal.Value = 0

local TweenService = game:GetService("TweenService")
local attachment = game.Workspace.Spread.RushMoving.Attachment

attachment.ParticleEmitter.Enabled = true
attachment.Smoke.Enabled = true

local sizeVal = Instance.new("NumberValue")
sizeVal.Value = 0

local connection = sizeVal.Changed:Connect(function(newValue)
	attachment.ParticleEmitter.Size = NumberSequence.new(newValue)
	attachment.Smoke.Size = NumberSequence.new(newValue)
end)

local tween = TweenService:Create(sizeVal, TweenInfo.new(2), {Value = 5})
tween:Play()

tween.Completed:Connect(function()
	connection:Disconnect()
	sizeVal:Destroy()
end)

attachment.Smoke.Color = ColorSequence.new(Color3.fromRGB(0, 195, 255))
attachment.ParticleEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))

local soundVal = Instance.new("NumberValue")
soundVal.Value = 0

local soundConnection = soundVal.Changed:Connect(function(val)
	rush.Playsound.PlaybackSpeed = val * 0.8
	rush.Footsteps.PlaybackSpeed = val * 1.3
end)


local soundTween = TweenService:Create(soundVal, TweenInfo.new(3), {Value = 1})
soundTween:Play()

soundTween.Completed:Connect(function()
	soundConnection:Disconnect()
	soundVal:Destroy()
end)
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
if newHealth == 0 then
game.Workspace:FindFirstChild("Spread").RushMoving:FindFirstChild("Footsteps").Volume = 0
game.Workspace:FindFirstChild("Spread").RushMoving:FindFirstChild("Playsound").Volume = 0
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
image.Size = UDim2.new(0, 0, 0, 0)
image.BackgroundTransparency = 1
image.Image = "http://www.roblox.com/asset/?id=11309821285"

image.Parent = background

local tweenInfo = TweenInfo.new(
    1,


    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)

local targetSize = {
    Size = UDim2.new(1, 0, 1.5, 0)
}

local zoomTween = TweenService:Create(image, tweenInfo, targetSize)

local function playJumpscare()
    local jumpscaresound = Instance.new("Sound")
    jumpscaresound.Volume = 5
    jumpscaresound.TimePosition = 0.8
    jumpscaresound.Parent = background
    jumpscaresound.SoundId = "rbxassetid://6754147732"

    local shift = Instance.new("ReverbSoundEffect")
    shift.DecayTime = 1.5
    shift.Density = 1
    shift.Diffusion = 1
    shift.DryLevel = -6
    shift.Parent = jumpscaresound

    local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.98
    distort.Parent = jumpscaresound

    jumpscaresound:Play()
    zoomTween:Play()
    
    local startTime = tick()
    local duration = 0.7
    local random = Random.new()
    
    local rotateSpeed = 35
    local maxAngle = 15
    local dropAmount = 0
    local shakeIntensity = 125 

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
            
            local redAmount = random:NextInteger(0, 255)
            background.BackgroundColor3 = Color3.fromRGB(0, redAmount, redAmount)
        else
            connection:Disconnect()
            screenGui.Enabled = false
            wait(4)
            screenGui:Destroy()
        end
    end)
end

playJumpscare()
end
end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
