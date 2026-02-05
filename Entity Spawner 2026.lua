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

-- MAIN SPAWNING
local Main = Window:NewTab("Custom Entity Spawner")
local MainSection = Main:NewSection("Custom")
local Main2 = Window:NewTab("Entity Spawner")
local Main2Section = Main2:NewSection("Basic")
local Main3 = Window:NewTab("Items")
local Main3Section = Main3:NewSection("Giver")
local Main4 = Window:NewTab("Modes Entities Spawner")
local Main4Section = Main4:NewSection("Hardcore")
local Main5Section = Main4:NewSection("Impossible")

MainSection:NewButton("Greg", "Spawning", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Greg%20Raw.lua"))()
  end)
MainSection:NewButton("A-25 From Rooms but Doors", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/A-25%20Rooms%20but%20doors.lua"))()
  end)
MainSection:NewButton("A-35 From IR", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/A-35.lua"))()
  end)
MainSection:NewButton("Trollace", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/TrollFace.lua"))()
  end)
MainSection:NewButton("Depth", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Depth%20Raw.lua"))()
  end)
MainSection:NewButton("Monoxide", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Monoxide.lua"))()
  end)
MainSection:NewButton("A-60", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/A-60%20Raw.lua"))()
  end)
Main2Section:NewButton("Rush", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Rush.lua"))()
  end)
Main2Section:NewButton("Ambush", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Ambush.lua"))()
  end)
Main2Section:NewButton("Blitz", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Blitz.lua"))()
  end)
Main4Section:NewButton("Ripper", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/Ripper.lua"))()
  end)
Main4Section:NewButton("Rebound", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Rebound%20Raw.lua"))()
  end)
Main5Section:NewButton("Smiller", "Spawning", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/Smiler.lua"))()
  end)
Main3Section:NewButton("Crucfix", "Giving", function()
   	loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Doors/Entity%20Spawner/Crucifix.lua"))()
  end)

Rayfield:LoadConfiguration()
