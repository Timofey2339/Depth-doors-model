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
sound2:Play()

local Warneffect = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Warneffect,24) 
    Warneffect.Name = "Warn" 
    Warneffect.TintColor = Color3.fromRGB(72, 72, 72) Warneffect.Saturation = -1 Warneffect.Contrast = 10 

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
local sound3 = Instance.new("Sound")
sound3.Parent = workspace
sound3.SoundId = "rbxassetid://18858846695"
sound3.Volume = 4
sound3.Looped = false
sound3.PlaybackSpeed = 1
sound2:Destroy()
sound:Destroy()
sound3:Play()
game.TweenService:Create(Warneffect,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
wait(9)
sound3:Destroy()
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Fanmade Dread",
            Asset = "rbxassetid://17056719213",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 6},
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

	end
	end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
