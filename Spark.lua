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
        local model = game.Workspace:FindFirstChild("Rebound")
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
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Jumpscare/Spark%20Jumpscare.lua"))()
	end
	end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()
