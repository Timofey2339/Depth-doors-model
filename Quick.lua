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
        local model = workspace:FindFirstChild("Quick")
        if model then model:Destroy() end
    end
end)

local roomConn = currentRooms.ChildAdded:Connect(function(child)
    if child.Name == "50" then
        shouldCancel = true
        local model = workspace:FindFirstChild("Quick")
        if model then model:Destroy() end
    end
end)
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(212, 255, 0)
game.Lighting.MainColorCorrection.Contrast = 0.3
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(0.5), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(0.5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()

local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://9114038441"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 0.5

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 1

sound:Play()
wait(14.6)
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Quick",
            Asset = "rbxassetid://112664477678148",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 6},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 100, Values = {20, 20, 0.1, 1} },
        Movement = { Speed = 150, Delay = 0.2, Reversed = true },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = true, Break = false },
        Death = {
            Type = "Curious",
            Hints = {"You died by Quick", "if you hear a quiet sound", "find a hiding spot","Be careful"}, 
            Cause = "Quick"
        }
    })

    entity:SetCallback("OnSpawned", function()
wait(5)
        SetAtmosphere(Color3.fromRGB(100, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Rage A-60")
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
	SizeValue.Value = -0.15

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
    Face.Image = "rbxassetid://11710167107"

local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://8395937796"
scare.PlaybackSpeed = 1.4
scare.TimePosition = 0
scare.Volume = 2

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.9
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local chorus = Instance.new("ChorusSoundEffect")
chorus.Parent = scare
chorus.Depth = 0.15
chorus.Mix = 0.5
chorus.Rate = 0.5

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background
local v2 = Random.new()
SizeValue.Value = -0.15
local ModelEntity = game.Workspace:FindFirstChild("Quick")
if ModelEntity then
    ModelEntity.RushMoving.Footsteps.Volume = 0
    ModelEntity.RushMoving.PlaySound.Volume = 0
end
scare:Play()
local v4 = math.random(1, 2)
for v5 = 1, 30 do
	local randint = math.random(1, 3)
	if randint == 1 then
		Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(255, 0, 0)
		Face.ImageColor3 = Color3.new(255, 255, 255)
	elseif randint == 2 then
		Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	elseif randint == 3 then
		Background.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		Background.BorderColor3 = Color3.fromRGB(81, 0, 0)
		Face.ImageColor3 = Color3.new(0.4, 0.4, 0.4)
	end
	Face.Position = UDim2.new(v2:NextNumber(0.4, 0.6), 0, v2:NextNumber(0.4, 0.6), 0)
	Face.Size += UDim2.new(0, SizeValue.Value, 0, SizeValue.Value)
	Face.Rotation = math.random(-45, 45)
	SizeValue.Value += 2
	wait(0)
end
Face.ImageColor3 = Color3.new(1, 1, 1)
Background.BackgroundColor3 = Color3.new(0, 0, 0)
JumpscareGui.Enabled = false
		end
	end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
