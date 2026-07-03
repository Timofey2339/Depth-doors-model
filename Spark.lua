	
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://9125712444"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 1
coroutine.wrap(function()
    while true do
        task.wait(0.1)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        
        if workspace:FindFirstChild("SeekMovingNewClone") or workspace.CurrentRooms:FindFirstChild("50") then
			game.Workspace:FindFirstChild("Spark"):Destroy()
            return
        end
    end
end)()
sound:Play()

local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24) 
    Reboundcolor.Name = "Warn" 
    Reboundcolor.TintColor = Color3.fromRGB(255, 0, 0) Reboundcolor.Saturation = 4 Reboundcolor.Contrast = 1 
    game.TweenService:Create(Reboundcolor,TweenInfo.new(4),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
 camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(5,3,0.1,3,2,0.5)
	
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Spark",
            Asset = "rbxassetid://93009507856882",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 12},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 100, Values = {5, 5, 0.1, 1} },
        Movement = { Speed = 200, Delay = 12, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 3, Max = 12, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Curious",
            Hints = {"You died by Spark", "he can rebound from 3 to 12 times", "if you hear scream all whats you need its hide","Bye Bye"}, 
            Cause = "Spark"
        }
    })

    entity:SetCallback("OnSpawned", function()
        SetAtmosphere(Color3.fromRGB(100, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Spark")
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
    Face.Image = "rbxassetid://89966657975652"

local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://5567155845"
scare.PlaybackSpeed = 3
scare.Volume = 7

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.5
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 0.98

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background

SizeValue.Value = -0.05
scare:Play()
local u2 = Random.new()
local function v3()
	local v4 = math.random(1, 3)
	if v4 == 1 then
		Background.BackgroundColor3 = Color3.new(0, 0, 0)
		Face.ImageColor3 = Color3.new(1, 0, 0)
	end
	if v4 == 2 then
		Background.BackgroundColor3 = Color3.new(1, 1, 1)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	end
	if v4 == 3 then
		Background.BackgroundColor3 = Color3.new(1, 0, 0)
		Face.ImageColor3 = Color3.new(0.729412, 0, 0)
	end
	Face.Position = UDim2.new(u2:NextNumber(0.35, 0.65), 0, u2:NextNumber(0.35, 0.65), 0)
	Face.Size = Face.Size + UDim2.new(SizeValue.Value, 0, SizeValue.Value / 2, 0)
	Face.Rotation = math.random(-360, 360)
end
for v5 = 1, 30 do
	v3()
	SizeValue.Value = SizeValue.Value + 0.01
	wait(0)
end
Background.Visible = false
		end
	end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
