local rooms = workspace.CurrentRooms

local function changeDoor(room)
	local door = room:FindFirstChild("Door")
	if door then
		
		local NewDoor = game:GetObjects("rbxassetid://12245371479")[1]
		NewDoor.Parent = room
		
		-- робимо стару дверь невидимою
		for _,v in pairs(door:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		
		-- слідкуємо за позицією
		task.spawn(function()
			while door.Parent do
				NewDoor:PivotTo(door:GetPivot())
				task.wait()
			end
		end)
		
	end
end

-- для нових кімнат
rooms.ChildAdded:Connect(function(room)
	task.wait(0.5)
	changeDoor(room)
end)

-- для існуючих
for _,room in pairs(rooms:GetChildren()) do
	changeDoor(room)
end
