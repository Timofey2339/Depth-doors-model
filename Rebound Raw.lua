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

local Reboundcolor = Instance.new("ColorCorrectionEffect", game.Lighting) 
game.Debris:AddItem(Reboundcolor, 24) 
Reboundcolor.Name = "Warn"
Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) 
Reboundcolor.Saturation = -0.7 
Reboundcolor.Contrast = 0.2

game.TweenService:Create(Reboundcolor, TweenInfo.new(15), {TintColor = Color3.fromRGB(255, 255, 255), Saturation = 0, Contrast = 0}):Play()

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf) camara.CFrame = camara.CFrame * shakeCf end)
camShake:Start() 
camShake:ShakeOnce(10, 3, 0.1, 6, 2, 0.5) 

task.wait(4.9)

local sound2 = Instance.new("Sound")
sound2.Parent = workspace
sound2.SoundId = "rbxassetid://9114221327"
sound2.Volume = 5 
sound2.Looped = false 
sound2.PlaybackSpeed = 1 

local pitch2 = Instance.new("PitchShiftSoundEffect") 
pitch2.Parent = sound2 
pitch2.Octave = 1
sound2:Play()

task.wait(0.04) 

local workspace = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local currentRooms = workspace:WaitForChild("CurrentRooms")

if workspace:FindFirstChild("SeekMovingNewClone") or currentRooms:FindFirstChild("50") then
    return
end

local shouldCancel = false

local seekConn = workspace.ChildAdded:Connect(function(child)
    if child.Name == "SeekMovingNewClone" then
        shouldCancel = true
        local model = workspace:FindFirstChild("Rebound")
        if model then model:Destroy() end
    end
end)

local roomConn = currentRooms.ChildAdded:Connect(function(child)
    if child.Name == "50" then
        shouldCancel = true
        local model = workspace:FindFirstChild("Rebound")
        if model then model:Destroy() end
    end
end)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	

local function spawnRebound()
    if shouldCancel then return end

    local entity = spawner.Create({
        Entity = {
            Name = "Rebound",
            Asset = "rbxassetid://95181878959735",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 6 },
            Shatter = true, Repair = true
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 100, Values = {5, 5, 0.1, 1} },
        Jumpscare = {
            false,
            {
                Image1 = "rbxassetid://10483855823",
                Image2 = "rbxassetid://11360803115",
                Shake = true,
                Sound1 = {18459521002, 1},
                Sound2 = {18459521002, 1},
                Flashing = {true, Color3.fromRGB(255, 0, 0)},
                Tease = {true, Min = 1, Max = 3},
            },
        },
        Movement = { Speed = 135, Delay = 0.2, Reversed = true },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Curious",
            Hints = {"You died by Rebound", "If your screen become blue", "then find a hide spot", "Bye Bye"}, 
            Cause = "Rebound"
        }
    })

    entity:SetCallback("OnSpawned", function()
        if shouldCancel then
            local model = workspace:FindFirstChild("Rebound")
            if model then model:Destroy() end
            return
        end

        task.wait(0.1)
        local Url = "https://github.com/Timofey2339/Depth-doors-model/raw/refs/heads/main/ReboundIdleAmbience.mp3.mpeg"
        local AssetName = "Footsteps_Rebound"

        if not isfile(AssetName..".mp3") then 
            writefile(AssetName..".mp3", game:HttpGet(Url)) 
        end

        local reboundModel = workspace:FindFirstChild("Rebound")
        if reboundModel then
            local Sound = reboundModel:FindFirstChild(AssetName) or Instance.new("Sound")
            Sound.Name = AssetName
            Sound.Parent = reboundModel:FindFirstChild("PrimaryPart") or reboundModel
            Sound.SoundId = getcustomasset(AssetName..".mp3", true)
            Sound.Looped = true
            Sound.Volume = 5
            Sound.TimePosition = 0.8
            Sound:Play()
        end
    end)

    entity:SetCallback("OnDamagePlayer", function(newHealth)
        if newHealth == 0 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Jumpscare/Rebound%20Jumpscare.lua"))()
        end
    end)

    entity:Run()
end

spawnRebound()

task.spawn(function()
    local changeCount = 0
    local latestRoom = game.ReplicatedStorage:WaitForChild("GameData"):WaitForChild("LatestRoom")

    while changeCount < 3 do
        latestRoom:GetPropertyChangedSignal("Value"):Wait()
        
        if shouldCancel then break end

        changeCount = changeCount + 1

        local sound1 = Instance.new("Sound")
        sound1.Parent = workspace
        sound1.SoundId = "rbxassetid://5246103002"
        sound1.Volume = 5
        sound1.Looped = false
        
        local pitch1 = Instance.new("PitchShiftSoundEffect")
        pitch1.Parent = sound1
        pitch1.Octave = 0.5
        sound1:Play()

        task.wait(4)

        if shouldCancel then break end

        local sound2 = Instance.new("Sound")
        sound2.Parent = workspace
        sound2.SoundId = "rbxassetid://9114221327"
        sound2.Volume = 5
        sound2.Looped = false

        local pitch2 = Instance.new("PitchShiftSoundEffect")
        pitch2.Parent = sound2
        pitch2.Octave = 1

        sound2:Play()

        task.wait(0.04)

        if not shouldCancel then
            spawnRebound()
        end
    end
end)
