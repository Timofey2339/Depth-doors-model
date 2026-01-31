local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

local entity = Creator.createEntity({
    CustomName = "Feast", -- Custom name of your entity
    Model = "https://github.com/BaneFromDiscord/RobloxTest/blob/main/feast.rbxm?raw=true",
    Speed = 75, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = false,
    FlickerLights = {
        false, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 5,
        Max = 5,
        WaitTime = 3,
    },
    CamShake = {
        false, -- Enabled
        {1, 3, 1, 1}, -- Shake values (don't change if you don't know)
        1, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "http://www.roblox.com/asset/?id=11703907763", -- Image1 url
            Image2 = "http://www.roblox.com/asset/?id=11703907763", -- Image2 url
            Shake = true,
            Sound1 = { 
               117720370899408, -- SoundId
                { Volume = 1 }, -- Sound properties
            },
            Sound2 = {
                117720370899408, -- SoundId
                { Volume = 1 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(70, 25, 0), -- Color
            },
            Tease = {
                true, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 1,
            },
        },
    },
})

------------------------

-- Run the created entity
Creator.runEntity(entity)
