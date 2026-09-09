local workspace = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local currentRooms = workspace:WaitForChild("CurrentRooms")

if workspace:FindFirstChild("SeekMovingNewClone") or currentRooms:FindFirstChild("50") then
    return
end

local shouldCancel = false

local seekConn = workspace.ChildAdded:Connect(function(child)
    if child.Name == "SeekMovingNewClone" then
        shouldCancel = true
        local model = workspace:FindFirstChild("Ripper Prime")
        if model then model:Destroy() end
    end
end)

local roomConn = currentRooms.ChildAdded:Connect(function(child)
    if child.Name == "50" then
        shouldCancel = true
        local model = workspace:FindFirstChild("Ripper Prime")
        if model then model:Destroy() end
    end
end)
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Ripper Prime",
            Asset = "rbxassetid://71268148202486",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 4},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = false, Range = 100, Values = {4, 3, 2, 1} },
                Jumpscare = {
            false, -- Enabled
            {
                Image1 = "rbxassetid://10483855823",
                Image2 = "rbxassetid://11360803115",
                Shake = true,
                Sound1 = {18459521002, 1}, -- Jumpscare sound
                Sound2 = {18459521002, 1},
                Flashing = {true, Color3.fromRGB(255, 0, 0)},
                Tease = {true, Min = 3, Max = 3},
            },
        },
        Movement = { Speed = 150, Delay = 10, Reversed = false },
        Rebounding = { Enabled = true, Type = "Blitz", Min = 3, Max = 3, Delay = 0.1 },
        Damage = { Enabled = true, Range = 40, Amount = 1 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Curious",
            Hints = {"You died by Nightmare Apex", "If the light starts to flicker", "hide","Bye Bye"}, 
            Cause = "NA"
        }
    })

entity:SetCallback("OnSpawned", function()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf) camara.CFrame = camara.CFrame * shakeCf end)
camShake:Start() 
camShake:ShakeOnce(5,2,3,2,1,0.5) 
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")

local sound = Instance.new("Sound")
sound.Name = "MonsterWarnSound"
sound.SoundId = "rbxassetid://9125713501"
sound.Volume = 5
sound.PlaybackSpeed = 0.5
sound.TimePosition = 0.2
sound.Parent = workspace

local pitchShift = Instance.new("PitchShiftSoundEffect")
pitchShift.Octave = 0.875
pitchShift.Parent = sound

sound:Play()

Debris:AddItem(sound, 10)

local reboundColor = Instance.new("ColorCorrectionEffect")
reboundColor.Name = "Warn"
reboundColor.TintColor = Color3.fromRGB(102, 255, 0)
reboundColor.Saturation = -0.2
reboundColor.Contrast = 0.2
reboundColor.Parent = Lighting

Debris:AddItem(reboundColor, 24)

task.wait(2)

local tweenInfo = TweenInfo.new(15, Enum.EasingStyle.Linear)
local targetProperties = {
    TintColor = Color3.fromRGB(255, 255, 255),
    Saturation = 0,
    Contrast = 0
}

TweenService:Create(reboundColor, tweenInfo, targetProperties):Play()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local camera = workspace.CurrentCamera
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")

    local JumpscareGui = Instance.new("ScreenGui")
    JumpscareGui.Name = "Jumpscare"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    JumpscareGui.Parent = player:WaitForChild("PlayerGui")

    local Background = Instance.new("Frame")
    Background.Name = "Frame"
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.BackgroundTransparency = 1
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 50
    Background.Parent = JumpscareGui

    local Face = Instance.new("ImageLabel")
    Face.Name = "ImageLabel"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(2, 0, 1, 0)
    Face.Image = "rbxassetid://236777652"
    Face.ImageTransparency = 1
    Face.ZIndex = 51
    Face.Parent = Background

    local monster = workspace:FindFirstChild("Ripper Prime")
    if monster and monster:FindFirstChild("RushMoving") then
        local rush = monster.RushMoving
local face = rush.Attachment.Face
local blackTrail = rush.Attachment.BlackTrail

face.Texture = "rbxassetid://98647869064987"
face.Size = NumberSequence.new(4.5)
face.Squash = NumberSequence.new(0.5)
face.TimeScale = 0

blackTrail.TimeScale = 0
        if rush:FindFirstChild("PlaySound") then rush.PlaySound.Volume = 0 end
        if rush:FindFirstChild("Footsteps") then rush.Footsteps.Volume = 0 end
        if rush:FindFirstChild("Static") then rush.Static.Volume = 0 end
        if rush:FindFirstChild("Static") then rush.Static:Play() end
        if rush:FindFirstChild("Lag") then rush.Lag:Play() end

        if char:FindFirstChild("HumanoidRootPart") then
            TweenService:Create(rush, TweenInfo.new(99999999999), {CFrame = char.HumanoidRootPart.CFrame}):Play()
        end

        local stats = game.ReplicatedStorage:FindFirstChild("GameStats")
        if stats and stats:FindFirstChild("Player_" .. player.Name) then
            stats["Player_" .. player.Name]["Total"].DeathCause.Value = "Ripper Prime"
        end

        local fixedCamPos = camera.CFrame.Position
        local startTime = tick()

        local cameraConnection
        cameraConnection = RunService.RenderStepped:Connect(function()
            if tick() - startTime < 4 then
                if rush and rush.Parent then
                    camera.CameraType = Enum.CameraType.Scriptable
                    camera.CFrame = CFrame.lookAt(fixedCamPos, rush.Position)
                end
            else
                cameraConnection:Disconnect()
                camera.CameraType = Enum.CameraType.Custom
            end
        end)

        task.wait(1.5)

        TweenService:Create(Face, TweenInfo.new(0.2), {ImageTransparency = 0}):Play()
        
        if rush:FindFirstChild("Static") then
            TweenService:Create(rush.Static, TweenInfo.new(0.5), {Volume = 6}):Play()
        end
        if rush:FindFirstChild("Lag") then
            TweenService:Create(rush.Lag, TweenInfo.new(0.5), {Volume = 1}):Play()
        end

        for i = 1, 165 do
            local offsetX = (i % 2 == 0) and 0.55 or 0.45
            TweenService:Create(Face, TweenInfo.new(0.01), {Position = UDim2.new(offsetX, 0, 0.5, 0)}):Play()
            task.wait(0.01)
        end
        if rush then rush:Destroy() end
        Face.ImageTransparency = 1
        hum.Health = 0

        JumpscareGui:Destroy()
        
    end
end)

entity:SetCallback("OnDespawning", function()
wait(1.3)
local sound2 = Instance.new("Sound")
sound2.Name = "DespawnSound"
sound2.SoundId = "rbxassetid://126631007956569"
sound2.Volume = 7
sound2.Parent = workspace

sound2:Play()
end)

entity:SetCallback("OnDespawned", function()

end)
entity:Run()
