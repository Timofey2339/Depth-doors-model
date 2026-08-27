local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local ownerUserId = 840771269

local function spawnA35()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/A-35.lua"))()
end
local function spawnGreg()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Greg%20Raw.lua"))()
end
local function spawnApex()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Nightmare%20Apex"))()
end
local function spawnMonoxide() -- Виправлено назву з spawnMoxoxide на spawnMonoxide
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Monoxide.lua"))()
end
local function spawnRambey()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Rambey%20Raw.lua"))()
end
local function spawnGlacher()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Glacher.lua"))()
end
local function spawnDread()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Fanmade%20Dread.lua"))()
end
local function spawnDrave()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Drave.lua"))()
end
local function spawnAnxiety()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Anxiety.lua"))()
end
local function spawnAnkle()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Ankle.lua"))()
end
local function spawnWatcher()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Watcher.lua"))()
end
local function spawnA60()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/A-60%20Raw.lua"))()
end
local function spawnA179()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/A-179%20Raw.lua"))()
end
local function spawnRebound()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Rebound%20Raw.lua"))()
end
local function spawnSpark()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Spark.lua"))()
end
local function spawnWide()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Wide.lua"))()
end

TextChatService.OnIncomingMessage = function(message)
    local properties = Instance.new("TextChatMessageProperties")
    
    if message.TextSource then
        local sender = Players:GetPlayerByUserId(message.TextSource.UserId)
        
        if sender and sender.UserId == ownerUserId then
            properties.PrefixText = "<font color='#FF0000'>[OWNER Of the mode]</font> " .. message.PrefixText
            
            local text = string.lower(message.Text)
            
            -- Усі команди переведено в нижній регістр
            if text == "/greg" then
                spawnGreg()
            elseif text == "/drave" then
                spawnDrave()
            elseif text == "/rebound" then
                spawnRebound()
            elseif text == "/spark" then
                spawnSpark()
            elseif text == "/nightmareapex" then
                spawnApex()
            elseif text == "/monoxide" then
                spawnMonoxide()
            elseif text == "/dread" then
                spawnDread()
            elseif text == "/ankle" then
                spawnAnkle()
            elseif text == "/watcher" then
                spawnWatcher()
            elseif text == "/a179" then
                spawnA179()
            elseif text == "/a60" then
                spawnA60()
            elseif text == "/anxiety" then
                spawnAnxiety()
            elseif text == "/a35admin" then
                spawnA35()
            elseif text == "/rambey" then
                spawnRambey()
            elseif text == "/glacher" then
                spawnGlacher()
            elseif text == "/wide" then
                spawnWide()
            end
        end
    end
    
    return properties
end
