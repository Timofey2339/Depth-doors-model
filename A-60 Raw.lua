local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://933230732"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 0.75

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 0.935

sound:Play()

coroutine.wrap(function()
    while true do
        task.wait(0.1)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        
        if workspace:FindFirstChild("SeekMovingNewClone") or workspace.CurrentRooms:FindFirstChild("50") then
            return
        end
    end
end)()
	
wait(23)
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Rage A-60",
            Asset = "rbxassetid://132439862574228",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 6},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 100, Values = {20, 20, 0.1, 1} },
        Movement = { Speed = 300, Delay = 2, Reversed = false },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Curious",
            Hints = {"You died by Rage A-60", "if you hear scream hide", "now","Bye Bye"}, 
            Cause = "Rage A-60"
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
scare.SoundId = "rbxassetid://132942725846535"
scare.PlaybackSpeed = 1
scare.Volume = 0.5

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 1
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 0.1

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background

local v2 = Random.new()
SizeValue.Value = -0.15
scare:Play()
local v4 = math.random(1, 2)
for v5 = 1, 20 do
	local randint = math.random(1, 3)
	if randint == 1 then
		Background.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(255, 0, 0)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	elseif randint == 2 then
		Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Face.ImageColor3 = Color3.new(1, 0, 0)
	elseif randint == 3 then
		Background.BackgroundColor3 = Color3.fromRGB(81, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(81, 0, 0)
		Face.ImageColor3 = Color3.new(0.67451, 0.376471, 0.376471)
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
