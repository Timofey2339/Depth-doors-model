local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local rooms = workspace:WaitForChild("CurrentRooms")
local gameData = game.ReplicatedStorage:WaitForChild("GameData")

local latestRoomValue = gameData:WaitForChild("LatestRoom")

-- завантажуємо модель
local entity = game:GetObjects("rbxassetid://79312363226377")[1]
entity.Parent = workspace

-- звук
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://137162043074149"
sound.Volume = 1
sound.Parent = workspace

-- знайти кімнату
local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))

if not room then
	warn("Room not found")
	return
end

-- позиція
entity:PivotTo(room:GetPivot() * CFrame.new(0,5,0))

-- камера
local camera = workspace.CurrentCamera

-- запам’ятовуємо кімнату
local currentRoomNumber = latestRoomValue.Value

while task.wait(0.4) do
	
	-- якщо змінилась кімната → видаляємо ентіті
	if latestRoomValue.Value ~= currentRoomNumber then
		entity:Destroy()
		break
	end
	
	if not entity.Parent then break end
	
	local pos = entity:GetPivot().Position
	
	local _,visible = camera:WorldToScreenPoint(pos)
	
	if not visible then
		if hum.Health > 0 then
			hum.Health -= 4
			sound:Play()
		end
	end
	
end
