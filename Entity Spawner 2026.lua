--e
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Entity Spawner",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading",
   LoadingSubtitle = "by Timofey2339",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

-- MAIN SPAWNING
local Main = Window:CreateTab("Custom Entity Spawner")
local MainSection = Main:CreateSection("Custom")
local Main2 = Window:CreateTab("Entity Spawner")
local Main2Section = Main2:CreateSection("Basic")
local Main3 = Window:CreateTab("Items")
local Main3Section = Main3:CreateSection("Giver")
local Main4 = Window:CreateTab("Modes Entities Spawner")
local Main4Section = Main4:CreateSection("Hardcore")
local Main5Section = Main4:CreateSection("Impossible")

local Button = MainSection:CreateButton({
   Name = "Spawn Greg",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Greg%20Raw.lua"))()
   end,
})
local Button = MainSection:CreateButton({
   Name = "Spawn A-25 From Rooms But Doors",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/A-25%20Rooms%20but%20doors.lua"))()
   end,
})
local Button = MainSection:CreateButton({
   Name = "Spawn A-35 From IR",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/A-35.lua"))()
   end,
})
local Button = MainSection:CreateButton({
   Name = "Spawn TrollFace",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/TrollFace.lua"))()
   end,
})
local Button = MainSection:CreateButton({
   Name = "Spawn Monoxide",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Monoxide.lua"))()
   end,
})
local Button = MainSection:CreateButton({
   Name = "Spawn Depth",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Depth%20Raw.lua"))()
   end,
})
local Button = MainSection:CreateButton({
   Name = "Spawn A-60",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/A-60%20Raw.lua"))()
   end,
})
local Button = Main2Section:CreateButton({
   Name = "Spawn Rush",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Rush.lua"))()
   end,
})
local Button = Main2Section:CreateButton({
   Name = "Spawn Ambush",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Ambush.lua"))()
   end,
})
local Button = Main2Section:CreateButton({
   Name = "Spawn Blitz",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Blitz.lua"))()
   end,
})
local Button = Main4Section:CreateButton({
   Name = "Spawn Ripper",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/Ripper.lua"))()
   end,
})
local Button = Main4Section:CreateButton({
   Name = "Spawn Rebound",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Rebound%20Raw.lua"))()
   end,
})
local Button = Main5Section:CreateButton({
   Name = "Spawn Smiller",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/Smiler.lua"))()
   end,
})
local Button = Main3Section:CreateButton({
   Name = "Give Crucfix",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Doors/Entity%20Spawner/Crucifix.lua"))()
   end,
})

Rayfield:LoadConfiguration()
