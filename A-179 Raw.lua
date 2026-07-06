	
coroutine.wrap(function()
    while true do
        task.wait(0.1)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        
        if workspace:FindFirstChild("SeekMovingNewClone") or workspace.CurrentRooms:FindFirstChild("50") then
			game.Workspace:FindFirstChild("A-179"):Destroy()
            return
        end
    end
end)()

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf) camara.CFrame = camara.CFrame * shakeCf end)
camShake:Start() 
camShake:ShakeOnce(10,3,0.1,6,2,0.5) 
	
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "A-179",
            Asset = "rbxassetid://13617812431",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 12},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 100, Values = {5, 5, 0.1, 1} },
        Movement = { Speed = 200, Delay = 12, Reversed = true },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 3, Max = 12, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = false },
        Death = {
            Type = "Curious",
            Hints = {"You died by A-179", "He spawns quit", "if your, camera starts shaking hide","be careful"}, 
            Cause = "A-179"
        }
    })

    entity:SetCallback("OnSpawned", function()
        SetAtmosphere(Color3.fromRGB(100, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("A-179")
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
	SizeValue.Value = 0.3

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
scare.SoundId = "rbxassetid://130586258888902"
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
		Face.ImageColor3 = Color3.new(1,1, 1)
	end
	if v4 == 2 then
		Background.BackgroundColor3 = Color3.new(1, 1, 1)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	end
	if v4 == 3 then
		Background.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	end
	Face.Position = UDim2.new(u2:NextNumber(0.35, 0.65), 0, u2:NextNumber(0.35, 0.65), 0)
	Face.Size = Face.Size + UDim2.new(SizeValue.Value, 0, SizeValue.Value / 2, 0)
	Face.Rotation = math.random(-50, 50)
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
