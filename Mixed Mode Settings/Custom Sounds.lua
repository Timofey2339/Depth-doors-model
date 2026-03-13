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
