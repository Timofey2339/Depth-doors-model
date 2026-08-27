coroutine.wrap(function()
    while true do
        task.wait(0.1)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        
        if workspace:FindFirstChild("SeekMovingNewClone") or workspace.CurrentRooms:FindFirstChild("50") then
            game.Workspace:FindFirstChild("Wide", 5):Destroy()
			return
        end
    end
end)()
	
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Wide",
            Asset = "rbxassetid://121564428243228",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 12},
            Shatter = true, Repair = true
        },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 100, Values = {10, 10, 3, 1} },
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
        Movement = { Speed = 400, Delay = 14, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Curious",
            Hints = {"You died by Wide", "If the light starts to flicker very long time its means he comes", "be careful he is fast and rebounds 3 times","be careful"}, 
            Cause = "Wide"
        }
    })

    entity:SetCallback("OnSpawned", function()
wait(5)
        SetAtmosphere(Color3.fromRGB(85, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Wide")
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
		    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")
	local SizeValue = Instance.new("NumberValue")

	SizeValue.Name = "SizeValue"
	SizeValue.Value = -0.025

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
    Face.Size = UDim2.new(0.15, 0, 0.4, 0)
    Face.Image = "http://www.roblox.com/asset/?id=11226296371"

local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://113366757765870"
scare.PlaybackSpeed = 1.3
scare.Volume = 5

local shift = Instance.new("ChorusSoundEffect")
shift.Depth = 1
shift.Mix = 0.75
shift.Priority = 0
shift.Rate = 0.4
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background
wait(0.1)
local v2 = Random.new()
SizeValue.Value = 0
local ModelEntity = game.Workspace:FindFirstChild("Wide")
if ModelEntity then
    ModelEntity.RushMoving.Footsteps.Volume = 0
    ModelEntity.RushMoving.PlaySound.Volume = 0
end
scare:Play()
local v4 = math.random(1, 2)
for v5 = 1, 35 do
	local v6 = math.random(1, 3)
	if v6 == 1 then
		Background.BackgroundColor3 = Color3.new(0, 0, 0)
		Face.ImageColor3 = Color3.new(1, 1, 1)
	end
	if v6 == 2 then
		Background.BackgroundColor3 = Color3.new(1, 0, 1)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	end
	if v6 == 3 then
		Background.BackgroundColor3 = Color3.new(0.52549, 0, 0.52549)
		Face.ImageColor3 = Color3.new(1, 0, 1)
	end
	Face.Position = UDim2.new(v2:NextNumber(0.4, 0.6), 0, v2:NextNumber(0.45, 0.55), 0)
	Face.Size = Face.Size + UDim2.new(SizeValue.Value, 0, SizeValue.Value, 0)
	Face.Rotation = math.random(-25, 25)
	SizeValue.Value = SizeValue.Value + 0.004
	wait(0)
		end
	Jumpscare.Enabled = false
	end
end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
