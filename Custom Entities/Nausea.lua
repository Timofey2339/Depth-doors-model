local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

local entity = Creator.createEntity({
    CustomName = "Feast", -- Custom name of your entity
    Model = "https://github.com/BaneFromDiscord/RobloxTest/blob/main/nausea.rbxm?raw=true",
    Speed = 120, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = false,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 5,
        Max = 5,
        WaitTime = 3,
    },
    CamShake = {
        false, -- Enabled
        {10, 10, 0.1, 1}, -- Shake values (don't change if you don't know)
        1, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://11769785498", -- Image1 url
            Image2 = "rbxassetid://11769785498", -- Image2 url
            Shake = true,
            Sound1 = { 
               4903742660, -- SoundId
                { Volume = 1 }, -- Sound properties
            },
            Sound2 = {
                4903742660, -- SoundId
                { Volume = 1 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(102, 170, 83), -- Color
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
