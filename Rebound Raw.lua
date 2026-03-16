local sound = Instance.new("Sound") 
sound.Parent = workspace 
sound.SoundId = "rbxassetid://136836151370178"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound 
pitch.Octave = 1
sound:Play()
local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24) Reboundcolor.Name = "Warn"
Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf) camara.CFrame = camara.CFrame * shakeCf end)
camShake:Start() 
camShake:ShakeOnce(10,3,0.1,6,2,0.5) 
wait(4.96)
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://9114221327"
sound.Volume = 5 
sound.Looped = false 
sound.PlaybackSpeed = 1 
local pitch = Instance.new("PitchShiftSoundEffect") 
pitch.Parent = sound 
pitch.Octave = 1
sound:Play()
wait(0.04) 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Rebound",
            Asset = "rbxassetid://95181878959735",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 3},
            Shatter = false, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 100, Values = {5, 5, 0.1, 1} },
        Movement = { Speed = 135, Delay = 0, Reversed = true },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 3, Max = 12, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = true, Break = true },
        Death = {
            Type = "Curious",
            Hints = {"You died by rebound", "he can rebound 3 times", "if your screen turning blue all whats you need its hide","Bye Bye"}, 
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
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Jumpscare/Rebound%20Jumpscare.lua"))()
	end
	end)

    entity:SetCallback("OnDespawned", function() ClearAtmosphere() end)
    entity:Run()

wait(2)
local changeCount = 0

coroutine.wrap(function()
    while changeCount < 3 do
        game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Wait()
        
        changeCount = changeCount + 1

        local sound1 = Instance.new("Sound")
        sound1.Parent = workspace
        sound1.SoundId = "rbxassetid://71840455801134"
        sound1.Volume = 5
        sound1.Looped = false
        local pitch1 = Instance.new("PitchShiftSoundEffect")
        pitch1.Parent = sound1
        pitch1.Octave = 1
        sound1:Play()

        wait(4)

        local sound2 = Instance.new("Sound")
        sound2.Parent = workspace
        sound2.SoundId = "rbxassetid://9114221327"
        sound2.Volume = 5
        sound2.Looped = false
        local pitch2 = Instance.new("PitchShiftSoundEffect")
        pitch2.Parent = sound2
        pitch2.Octave = 1
        sound2:Play()

        wait(0.04)

        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = spawner.Create({
            Entity = {
                Name = "Rebound",
                Asset = "rbxassetid://95181878959735",
                HeightOffset = 0
            },
            Lights = {
                Flicker = { Enabled = false, Duration = 3},
                Shatter = false, Repair = false
            },
            Earthquake = { Enabled = false },
            CameraShake = { Enabled = true, Range = 100, Values = {5, 5, 0.1, 1} },
            Movement = { Speed = 135, Delay = 0, Reversed = true },
            Rebounding = { Enabled = false, Type = "Ambush", Min = 3, Max = 12, Delay = 1.0 },
            Damage = { Enabled = true, Range = 40, Amount = 125 },
            Crucifixion = { Enabled = true, Range = 40, Resist = true, Break = true },
            Death = {
                Type = "Curious",
                Hints = {"You died by rebound", "he can rebound 3 times", "if your screen turning blue all whats you need its hide","Bye Bye"}, 
                Cause = "Spark"
            }
        })

        entity:SetCallback("OnSpawned", function()
            SetAtmosphere(Color3.fromRGB(100, 150, 255), 0.5)
            local model = workspace:FindFirstChild("Rebound")
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
                        light.Range = 60
                        light.Brightness = 6
                        light.Shadows = true
                    elseif v:IsA("Decal") then
                        v.Texture = "rbxassetid://11118765532"
                    end
                end
            end
        end)

        entity:SetCallback("OnDamagePlayer", function(newHealth)
            if newHealth == 0 then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Jumpscare/Rebound%20Jumpscare.lua"))()
            end
        end)

        entity:SetCallback("OnDespawned", function()
            ClearAtmosphere()
        end)

        entity:Run()
    end
end)()
