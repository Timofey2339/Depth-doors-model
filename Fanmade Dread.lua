local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://8558107873"
sound.Volume = 4
sound.Looped = false
sound.PlaybackSpeed = 1

local sound2 = Instance.new("Sound")
sound2.Parent = workspace
sound2.SoundId = "rbxassetid://4940109913"
sound2.Volume = 1.5
sound2.Looped = true
sound2.PlaybackSpeed = 1

local pitch = Instance.new("ReverbSoundEffect")
pitch.Parent = sound2

sound:Play()
coroutine.wrap(function()
    while true do
        task.wait(0.1)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        
        if workspace:FindFirstChild("SeekMovingNewClone") or workspace.CurrentRooms:FindFirstChild("50") then
            game.Workspace:FindFirstChild("Fanmade Dread"):Destroy()
            return
        end
    end
end)()
sound2:Play()

local Warneffect = Instance.new("ColorCorrectionEffect",game.Lighting)
    Warneffect.Name = "Warn" 
    Warneffect.TintColor = Color3.fromRGB(72, 72, 72) Warneffect.Saturation = -0.2 Warneffect.Contrast = 1 

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
wait(36)
local sound4 = Instance.new("Sound")
sound4.Parent = workspace
sound4.SoundId = "rbxassetid://139099793195974"
sound4.Volume = 3.5
sound4.Looped = false
sound4.PlaybackSpeed = 0.85
sound4:Play()
sound2:Destroy()
sound:Destroy()
wait(2.5)
sound4:Play()
wait(2.5)
sound4:Play()
wait(2.5)
local sound3 = Instance.new("Sound")
sound3.Parent = workspace
sound3.SoundId = "rbxassetid://18858846695"
sound3.Volume = 4
sound3.Looped = false
sound3.PlaybackSpeed = 1
sound3:Play()
game.TweenService:Create(Warneffect,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
wait(9)
sound4:Destroy()
sound3:Destroy()
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()    
local entity = spawner.Create({
        Entity = {
            Name = "Fanmade Dread",
            Asset = "rbxassetid://103999601943476",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 6},
            Shatter = true, Repair = true
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 100, Values = {15, 15, 0.1, 1} },
                Jumpscare = {
            false, -- Enabled
            {
                Image1 = "rbxassetid://10483855823", -- A-60 Jumpscare Image
                Image2 = "rbxassetid://11360803115",
                Shake = true,
                Sound1 = {18459521002, 1}, -- Jumpscare sound
                Sound2 = {18459521002, 1},
                Flashing = {true, Color3.fromRGB(255, 0, 0)},
                Tease = {true, Min = 1, Max = 3},
            },
        },
        Movement = { Speed = 900, Delay = 2, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 999, Amount = 999 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Curious",
            Hints = {"You died by Fanmade Dread", "If clock stop ticking", "all what you needs its hide","Bye Bye"}, 
            Cause = "Fanmade Dread"
        }
    })

    entity:SetCallback("OnSpawned", function()
wait(5)
        SetAtmosphere(Color3.fromRGB(85, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Fanmade Dread")
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

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
                    -- UI Construction
    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")
    local SizeValue = Instance.new("NumberValue")

    SizeValue.Name = "SizeValue"
    SizeValue.Value =  -0.2

    JumpscareGui.Name = "Jumpscare"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Background.Name = "Frame"
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 50

    Face.Name = "ImageLabel"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0.25, 0, 0.3, 0)
    Face.Image = "rbxassetid://12654203749"

local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://103078219556352"
scare.PlaybackSpeed = 4
scare.Volume = 10

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.6
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 0.5

    Background.Parent = JumpscareGui
    Face.Parent = Background
    SizeValue.Parent = Background
wait(0.01)
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0.125, 0, 0.15, 0)
wait(2.5)
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0.25, 0, 0.3, 0)
wait(2)
Face.Image = "rbxassetid://100734201255797"
wait(0.01)
local v2 = Random.new()
SizeValue.Value = -0.2
scare:Play()
local v4 = math.random(1, 2)
for v4 = 1, 20 do
    local v5 = math.random(1, 3)
    if v5 == 1 then
        Background.BackgroundColor3 = Color3.new(242, 243, 243)
        Face.ImageColor3 = Color3.new(27, 42, 53)
    end
    if v5 == 2 then
        Background.BackgroundColor3 = Color3.new(27, 42, 53)
        Face.ImageColor3 = Color3.new(242, 243, 243)
    end
    if v5 == 3 then
        Background.BackgroundColor3 = Color3.new(161, 165, 162)
        Face.ImageColor3 = Color3.new(161, 165, 162)
    end
    Face.Position = UDim2.new(v2:NextNumber(0.4, 0.6), 0, v2:NextNumber(0.55, 0.75), 0)
    Face.Size = Face.Size + UDim2.new(SizeValue.Value, 0, SizeValue.Value, 0)
    Face.Rotation = math.random(-20, 20)
    SizeValue.Value = SizeValue.Value - 0.1
    wait(0)
end
Face.ImageColor3 = Color3.new(1, 1, 1)
Background.BackgroundColor3 = Color3.new(0, 0, 0)
JumpscareGui.Enabled = false
        end
    end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
