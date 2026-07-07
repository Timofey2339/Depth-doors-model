local function getGitSoundId(GithubSoundPath: string, AssetName: string): Sound
   local Url = GithubSoundPath

    if not isfile(AssetName..".mp3") then 
        writefile(AssetName..".mp3", game:HttpGet(Url)) 
    end

    local Sound = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music:FindFirstChild(AssetName)
    if Sound then
        Sound.SoundId = getcustomasset(AssetName..".mp3", true)
    end
    return Sound 
end

local CustomMusicYellow = getGitSoundId("https://github.com/Timofey2339/Depth-doors-model/raw/refs/heads/main/CustomDedMusic.mp3", "Yellow")
if CustomMusicYellow then
    CustomMusicYellow.Looped = true
    CustomMusicYellow.Volume = 2
end

local CustomMusicBlue = getGitSoundId("https://github.com/Timofey2339/Depth-doors-model/raw/refs/heads/main/CustomDedMusic.mp3", "Blue")
if CustomMusicBlue then
    CustomMusicBlue.Looped = true
    CustomMusicBlue.Volume = 2
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
						open.SoundId = "rbxassetid://140444636093892"
						open.Volume = 0.7
					end
				end
			end
		end
	end
end)()
