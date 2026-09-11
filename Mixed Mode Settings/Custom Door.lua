local rooms = workspace.CurrentRooms

local function changeDoor(room)
	if room.Name == "50" then
		return
	end

	local door = room:FindFirstChild("Door")
	if door then
		local NewDoor = game:GetObjects("rbxassetid://81616085996734")[1]
		NewDoor.Parent = room
		
		for _,v in pairs(door:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		
		task.spawn(function()
			while door and door.Parent do
				NewDoor:PivotTo(door:GetPivot())
				task.wait()
			end
		end)
	end
end

rooms.ChildAdded:Connect(function(room)
	task.wait(0.5)
	changeDoor(room)
end)

for _,room in pairs(rooms:GetChildren()) do
	changeDoor(room)
end
