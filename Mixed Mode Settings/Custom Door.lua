local rooms = workspace.CurrentRooms

local hasFoundEver = false

local function changeDoor(room)
	local room0 = rooms:FindFirstChild("0")
	if room0 then
		local parts = room0:FindFirstChild("Parts")
		if parts and parts:FindFirstChild("ArchivesWallPlant") then
			hasFoundEver = true
		end
	end

	if room.Name == "50" or room.Name == "49" then
		return
	end

	local door = room:FindFirstChild("Door")
	if door then
		local doorNum = door:FindFirstChild("Sign") or door:FindFirstChild("DoorNumber")
		if doorNum and doorNum:FindFirstChild("TextLabel") then
			if doorNum.TextLabel.Text == "0050" or doorNum.TextLabel.Text == "50" then
				return
			end
		end

		if hasFoundEver then
			for _, v in pairs(door:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Color = Color3.fromRGB(218, 133, 65)
					v.Material = Enum.Material.Wood
				end
			end
		else
			local NewDoor = game:GetObjects("rbxassetid://81616085996734")[1]
			NewDoor.Parent = room
			
			for _, v in pairs(door:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
			
			task.spawn(function()
				while door and door.Parent do
					NewDoor:PivotTo(door:GetPivot())
					task.wait()
				end
				if NewDoor then
					NewDoor:Destroy()
				end
			end)
		end
	end
end

rooms.ChildAdded:Connect(function(room)
	task.wait(0.5)
	changeDoor(room)
end)

for _, room in pairs(rooms:GetChildren()) do
	changeDoor(room)
end
