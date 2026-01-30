local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Monoxide",
            Asset = "rbxassetid://130481102433430",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 6},
            Shatter = true, Repair = false
        },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 100, Values = {1, 1, 0.1, 1} },
        Movement = { Speed = 45 Delay = 2, Reversed = false },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 10, Amount = 35 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Guiding",
            Hints = {"You died by Monoxide", "Don't block his way.", "uh its all","Bye Bye"}, 
            Cause = "Monoxide"
        }
    })

    entity:SetCallback("OnSpawned", function()
wait(5)
        SetAtmosphere(Color3.fromRGB(85, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Monoxide")
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
                    light.Range = 60; light.Brightness = 1; light.Shadows = true
                elseif v:IsA("Decal") then
                    v.Texture = "rbxassetid://11118765532"
                end
            end
        end
    end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
