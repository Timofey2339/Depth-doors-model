local rooms = workspace.CurrentRooms

local function changeDoor(room)
	local door = room:FindFirstChild("Door")
	if door then
		local NewDoor = game:GetObjects("rbxassetid://12245371479")[1]

		NewDoor:PivotTo(door:GetPivot()) -- ставимо нову дверь на місце старої
		NewDoor.Parent = room

		door:Destroy()
	end
end

rooms.ChildAdded:Connect(function(room)
	task.wait(0.5)
	changeDoor(room)
end)

for _,room in pairs(rooms:GetChildren()) do
	changeDoor(room)
end
