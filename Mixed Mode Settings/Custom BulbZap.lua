local Workspace = game:GetService("Workspace")
local CurrentRooms = Workspace:WaitForChild("CurrentRooms")


local SOUND_CONFIG = {
    ["BulbZap"] = { 
        Id = "rbxassetid://4288784832", 
        Volume = 2 
    },
    ["BulbBreak"] = { 
        Id = "rbxassetid://7140152893",
        Volume = 2 
    }
}

local function handleNewDescendant(descendant)
    if descendant:IsA("Sound") then
        local config = SOUND_CONFIG[descendant.Name]
        
        if config then
            
            
            descendant.SoundId = config.Id
            descendant.Volume = config.Volume
            
            
            descendant:GetPropertyChangedSignal("SoundId"):Connect(function()
                if descendant.SoundId ~= config.Id then
                    descendant.SoundId = config.Id
                end
            end)

          
            descendant:GetPropertyChangedSignal("Volume"):Connect(function()
                if descendant.Volume ~= config.Volume then
                    print("sound changed " .. descendant.Name .. ", turning back: " .. config.Volume)
                    descendant.Volume = config.Volume
                end
            end)
        end
    end
end

for _, descendant in ipairs(CurrentRooms:GetDescendants()) do
    handleNewDescendant(descendant)
end

CurrentRooms.DescendantAdded:Connect(handleNewDescendant)
