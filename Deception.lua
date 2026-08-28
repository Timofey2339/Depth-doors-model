   local Spawn = Instance.new("Sound")
  local Effect1 = Instance.new("FlangeSoundEffect")
  local Effect2 = Instance.new("PitchShiftSoundEffect")
    Spawn.PlaybackSpeed = 2
    Spawn.Parent = workspace
    Effect1.Depth = 1
    Effect1.Mix = 1
    Effect1.Priority = 0
    Effect1.Rate = 1.3
    Effect1.Parent = Spawn
    Effect2.Priority = 0
    Effect2.Octave = 0.5
    Effect.Parent = Spawn
    Spawn:Play()
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Deception",
            Asset = "rbxassetid://112664477678148",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 0},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 100, Values = {5, 5, 0.1, 1} },
        Movement = { Speed = 45, Delay = 0, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 15, Amount = 25 },
        Crucifixion = { Enabled = true, Range = 15, Resist = false, Break = false },
        Death = {
            Type = "Guiding",
            Hints = {"You died by Deception", "dont stay close to him", "or he gonna damage you","be careful next time"}, 
            Cause = "Deception"
        }
    })

    entity:SetCallback("OnSpawned", function()
wait(5)
        SetAtmosphere(Color3.fromRGB(85, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("A-35")
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

entity:SetCallback("OnDamagePlayer", function()

end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
