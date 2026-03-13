coroutine.wrap(function()
    while true do
        wait()
            workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.Volume = 3
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId = "rbxassetid://112999617701939"
      end
end)()
