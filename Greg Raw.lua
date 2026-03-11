local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Greg",
            Asset = "rbxassetid://134768877241052",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 6},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 100, Values = {5, 5, 0.1, 1} },
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
        Movement = { Speed = 300, Delay = 2, Reversed = false },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Curious",
            Hints = {"You died by Greg", "If the light starts to flicker", "hide","Bye Bye"}, 
            Cause = "Greg"
        }
    })

    entity:SetCallback("OnSpawned", function()
wait(5)
        SetAtmosphere(Color3.fromRGB(85, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Greg")
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
    Face.Image = "rbxassetid://10914800940"

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background
local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://135750666095391"
scare.PlaybackSpeed = 2
scare.Volume = 3

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 1
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local v2 = Random.new()
SizeValue.Value = -0.15
local v4 = math.random(1, 2)
scare:Play()
for v5 = 1, 30 do
	local v6 = math.random(1, 3)
	if v6 == 1 then
		Background.BackgroundColor3 = Color3.new(0, 0, 0)
		Face.ImageColor3 = Color3.new(1, 1, 1)
	end
	if v6 == 2 then
		Background.BackgroundColor3 = Color3.new(0.596078, 0.596078, 0.596078)
		Face.ImageColor3 = Color3.new(0.858824, 1, 0.796078)
	end
	if v6 == 3 then
		Background.BackgroundColor3 = Color3.new(1, 1, 1)
		Face.ImageColor3 = Color3.new(0.647059, 0.647059, 0.647059)
	end
	Face.Position = UDim2.new(v2:NextNumber(0.4, 0.6), 0,v2:NextNumber(0.4, 0.6), 0)
	Face.Size = ImageLabel.Size + UDim2.new(SizeValue.Value, 0, SizeValue.Value, 0)
	Face.Rotation = math.random(-50, 50)
	SizeValue.Value = SizeValue.Value + 0.02
	wait(0)
end
ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
Background.BackgroundColor3 = Color3.new(0, 0, 0)
JumpscareGui.Enabled = false

	end
	end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
