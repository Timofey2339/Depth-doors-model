local rooms = workspace.CurrentRooms

local function changeDoor(room)
	local door = room:FindFirstChild("Door")
	if door then
		
		local NewDoor = game:GetObjects("rbxassetid://81616085996734")[1]
		NewDoor.Parent = room
		
		-- робимо стару дверь невидимою
		for _,v in pairs(door:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
				v.CanCollide = false
			end
			
			if v:IsA("Decal") or v:IsA("Texture") then
				v.Transparency = 1
			end
			
			if v:IsA("SurfaceGui") or v:IsA("BillboardGui") then
				v.Enabled = false
			end
		end
		
		-- нова дверь повторює позицію старої
		task.spawn(function()
			while door.Parent do
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

