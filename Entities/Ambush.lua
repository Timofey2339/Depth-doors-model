local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://97712107114692"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 1

sound:Play()

wait(6.5)
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Ambush",
            Asset = "rbxassetid://14055782288",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 6},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 100, Values = {5, 5, 0.1, 1} },
        Movement = { Speed = 125, Delay = 2, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 2, Max = 3, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 100 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Guiding",
            Hints = {}, 
            Cause = "Ambush"
        }
    })

    entity:SetCallback("OnSpawned", function()
wait(5)
        SetAtmosphere(Color3.fromRGB(85, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Ambush")
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
