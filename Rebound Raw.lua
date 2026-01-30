local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://136836151370178"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 1

sound:Play()

local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.IgnoreGuiInset = true

local frame = Instance.new("Frame")
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(0, 90, 175)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Size = UDim2.new(3, 0, 3, 0)
frame.BackgroundTransparency = 0.5
game:GetService("TweenService"):Create(frame,TweenInfo.new(4.95,Enum.EasingStyle.Sine),{BackgroundTransparency=1}):Play()
wait(4.96)
frame:Destroy()
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://9114221327"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 1

sound:Play()
wait(0.04)
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Rebound",
            Asset = "rbxassetid://95181878959735",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 6},
            Shatter = true, Repair = false
        },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 100, Values = {20, 20, 0.1, 1} },
        Movement = { Speed = 30, Delay = 2, Reversed = true },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = false, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Guiding",
            Hints = {"You died by Rebound", "if you your Screen blue hide", "and now","Bye Bye"}, 
            Cause = "Rebound"
        }
    })

    entity:SetCallback("OnSpawned", function()
        SetAtmosphere(Color3.fromRGB(100, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Rebound")
        if model then
            for _, v in pairs(model:GetDescendants()) do
                if v:IsA("Sound") then
                    v.SoundId = "rbxassetid://111930358743197"
                    v.Volume = 2
                    v.PlaybackSpeed = 1
                elseif v:IsA("BasePart") then
                    v.Color = Color3.fromRGB(0, 0, 80)
                    v.Material = Enum.Material.Neon
                    local light = Instance.new("PointLight", v)
                    light.Color = Color3.fromRGB(0, 255, 255)
                    light.Range = 60; light.Brightness = 6; light.Shadows = true
                elseif v:IsA("Decal") then
                    v.Texture = "rbxassetid://11118765532"
                end
            end
        end
    end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
wait(25)
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://71840455801134"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 1

sound:Play()
wait(4.205)
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://9114221327"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 1

sound:Play()

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Rebound",
            Asset = "rbxassetid://95181878959735",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 6},
            Shatter = true, Repair = false
        },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 100, Values = {20, 20, 0.1, 1} },
        Movement = { Speed = 30, Delay = 2, Reversed = true },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = false, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Guiding",
            Hints = {"You died by Rebound", "if you your Screen Blue hide", "and now","Bye Bye"}, 
            Cause = "Rebound"
        }
    })

    entity:SetCallback("OnSpawned", function()
        SetAtmosphere(Color3.fromRGB(100, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Rebound")
        if model then
            for _, v in pairs(model:GetDescendants()) do
                if v:IsA("Sound") then
                    v.SoundId = "rbxassetid://111930358743197"
                    v.Volume = 2
                    v.PlaybackSpeed = 1
                elseif v:IsA("BasePart") then
                    v.Color = Color3.fromRGB(0, 0, 80)
                    v.Material = Enum.Material.Neon
                    local light = Instance.new("PointLight", v)
                    light.Color = Color3.fromRGB(0, 255, 255)
                    light.Range = 60; light.Brightness = 6; light.Shadows = true
                elseif v:IsA("Decal") then
                    v.Texture = "rbxassetid://11118765532"
                end
            end
        end
    end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
