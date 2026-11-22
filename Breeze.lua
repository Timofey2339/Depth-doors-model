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
        local model = workspace:FindFirstChild("Breeze")
        if model then model:Destroy() end
    end
end)

local roomConn = currentRooms.ChildAdded:Connect(function(child)
    if child.Name == "50" then
        shouldCancel = true
        local model = workspace:FindFirstChild("Breeze")
        if model then model:Destroy() end
    end
end)
	
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Breeze",
            Asset = "rbxassetid://83824315896465",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = true, Duration = 6},
            Shatter = true, Repair = true
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
        Movement = { Speed = 300, Delay = 3.4, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 2, Max = 2, Delay = 2.0 },
        Damage = { Enabled = true, Range = 40, Amount = 100 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = false },
        Death = {
            Type = "Curious",
            Hints = {"Its looks like you've having trouble with Breeze", "And this time it's the same like Ambush", "When you see him come through hide","Be careful"}, 
            Cause = "Breeze"
        }
    })

entity:SetCallback("OnSpawned", function()
    if shouldCancel then
        local model = workspace:FindFirstChild("Breeze")
        if model then model:Destroy() end
        return
    end

    task.wait(0.1)

    local spawnUrl = "https://github.com/Timofey2339/Depth-doors-model/raw/refs/heads/main/BreezeSpawn.mp3"
    local spawnFileName = "BreezeSpawn.mp3"

    if not isfile(spawnFileName) then 
        writefile(spawnFileName, game:HttpGet(spawnUrl)) 
    end

    local entityModel = workspace:FindFirstChild("Breeze")
    if entityModel then
        local sound1 = Instance.new("Sound")
        sound1.Name = "BreezeSpawnSound"
        sound1.Parent = entityModel
        sound1.SoundId = getcustomasset(spawnFileName)
        sound1.Looped = false
        sound1.Volume = 3
        sound1.TimePosition = 0
        sound1:Play()
    end

    local playUrl = "https://github.com/Timofey2339/Depth-doors-model/raw/refs/heads/main/BreezePlaySound.mp3"
    local playFileName = "BreezePlaySound.mp3"

    if not isfile(playFileName) then 
        writefile(playFileName, game:HttpGet(playUrl)) 
    end

    if entityModel then
        local rushPart = entityModel:FindFirstChild("RushNew") or entityModel
        local sound2 = Instance.new("Sound")
        sound2.Name = "BreezePlaySound"
        sound2.Parent = rushPart
        sound2.SoundId = getcustomasset(playFileName)
        sound2.Looped = true
        sound2.Volume = 5
        sound2.TimePosition = 0
        sound2:Play()
    end
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
end)

entity:SetCallback("OnDespawned", function()
end)

entity:Run()
