
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Entity Spawner By Timofey2339",
   Icon = 0,
   LoadingTitle = "Loading Assets",
   LoadingSubtitle = "by Sirius",
   ShowText = "Rayfield",
   Theme = "Default",
   ToggleUIKeybind = "K",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "EntitySpawner"
   },

   KeySystem = false
})

-- TABS
local Main = Window:CreateTab("Custom Entity Spawner", 11689830019)
local Basic = Window:CreateTab("Basic Entity Spawner", 11430772889)
local Items = Window:CreateTab("Items", 125688651497611)
local Modes = Window:CreateTab("Modes Entity Spawner", 14168652314)

-- =======================
-- CUSTOM ENTITIES
-- =======================
Main:CreateSection("Custom")

Main:CreateButton({
   Name = "Spawn Greg",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Greg%20Raw.lua"
      ))()
   end
})

Main:CreateButton({
   Name = "Spawn A-25 (Rooms But Doors)",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/A-25%20Rooms%20but%20doors.lua"
      ))()
   end
})

Main:CreateButton({
   Name = "Spawn A-35 (IR)",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/A-35.lua"
      ))()
   end
})

Main:CreateButton({
   Name = "Spawn TrollFace",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/TrollFace.lua"
      ))()
   end
})

Main:CreateButton({
   Name = "Spawn Monoxide",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Monoxide.lua"
      ))()
   end
})

Main:CreateButton({
   Name = "Spawn Depth",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Depth%20Raw.lua"
      ))()
   end
})

Main:CreateButton({
   Name = "Spawn A-60",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/A-60%20Raw.lua"
      ))()
   end
})

-- =======================
-- BASIC ENTITIES
-- =======================
Basic:CreateSection("Doors Entities")

Basic:CreateButton({
   Name = "Spawn Rush",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Rush.lua"
      ))()
   end
})

Basic:CreateButton({
   Name = "Spawn Ambush",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Ambush.lua"
      ))()
   end
})

Basic:CreateButton({
   Name = "Spawn Blitz",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Entities/Blitz.lua"
      ))()
   end
})

-- =======================
-- MODES
-- =======================
Modes:CreateSection("Hardcore")

Modes:CreateButton({
   Name = "Spawn Ripper",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/Ripper.lua"
      ))()
   end
})

Modes:CreateButton({
   Name = "Spawn Rebound",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Rebound%20Raw.lua"
      ))()
   end
})

Modes:CreateSection("Impossible")

Modes:CreateButton({
   Name = "Spawn Smiler",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/Smiler.lua"
      ))()
   end
})

-- =======================
-- ITEMS
-- =======================
Items:CreateSection("Giver")

Items:CreateButton({
   Name = "Give Crucifix",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Doors/Entity%20Spawner/Crucifix.lua"
      ))()
   end
})

-- LOAD CONFIG
Rayfield:LoadConfiguration()
