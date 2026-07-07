local function getGitSoundId(GithubSoundPath: string, AssetName: string): Sound
    local Url = GithubSoundPath

    if not isfile(AssetName..".mp3") then 
        writefile(AssetName..".mp3", game:HttpGet(Url)) 
    end

    local Sound = Instance.new("Sound")
    Sound.SoundId = getcustomasset(AssetName..".mp3", true)
    return Sound 
end

local CustomMusic = getGitSoundId("", "NightmareModeAmbient")
CustomMusic.Parent = game.Workspace
CustomMusic.Looped = true
CustomMusic.Volume = 2
CustomMusic:Play()
	

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
