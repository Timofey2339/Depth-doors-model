local function loadGitSound(GithubSoundPath: string, AssetName: string): string
    local fileName = AssetName .. ".mp3"

    if not isfile(fileName) then 
        writefile(fileName, game:HttpGet(GithubSoundPath)) 
    end

    return getcustomasset(fileName, true)
end

local yellowCustomId = loadGitSound("https://github.com/Timofey2339/Depth-doors-model/raw/refs/heads/main/CuriousLightRemake.mp3", "Curios")
local yellowSound = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Yellow

if yellowSound then
    yellowSound.SoundId = yellowCustomId
    yellowSound.Looped = true
    yellowSound.Volume = 2
end

local blueCustomId = loadGitSound("https://github.com/Timofey2339/Depth-doors-model/raw/refs/heads/main/GuidingLightRemake.mp3", "Guiding")
local blueSound = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue

if blueSound then
    blueSound.SoundId = blueCustomId
    blueSound.Looped = true
    blueSound.Volume = 2
end
	
coroutine.wrap(function()
	while true do
		task.wait()

		local room = workspace.CurrentRooms:FindFirstChild(game.ReplicatedStorage.GameData.LatestRoom.Value)
		if room then
			local door = room:FindFirstChild("Door")
			if door then
				local door2 = door:FindFirstChild("Door")
				if door2 then
					local open = door2:FindFirstChild("Open")
					if open then
						open.SoundId = "rbxassetid://82104982606471"
						open.Volume = 2
					end
				end
			end
		end
	end
end)()
