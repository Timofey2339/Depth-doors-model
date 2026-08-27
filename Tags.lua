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
local function spawnMonoxide()
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
            
            -- Запускаємо спавнер в окремому потоці, щоб wait(2) не блокував чат
            if text == "/greg" then
                task.spawn(spawnGreg)
            elseif text == "/drave" then
                task.spawn(spawnDrave)
            elseif text == "/rebound" then
                task.spawn(spawnRebound)
            elseif text == "/spark" then
                task.spawn(spawnSpark)
            elseif text == "/nightmareapex" then
                task.spawn(spawnApex)
            elseif text == "/monoxide" then
                task.spawn(spawnMonoxide)
            elseif text == "/dread" then
                task.spawn(spawnDread)
            elseif text == "/ankle" then
                task.spawn(spawnAnkle)
            elseif text == "/watcher" then
                task.spawn(spawnWatcher)
            elseif text == "/a179" then
                task.spawn(spawnA179)
            elseif text == "/a60" then
                task.spawn(spawnA60)
            elseif text == "/anxiety" then
                task.spawn(spawnAnxiety)
            elseif text == "/a35admin" then
                task.spawn(spawnA35)
            elseif text == "/rambey" then
                task.spawn(spawnRambey)
            elseif text == "/glacher" then
                task.spawn(spawnGlacher)
            elseif text == "/wide" then
                task.spawn(spawnWide)
            end
        end
    end
    
    return properties
end
