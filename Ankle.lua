local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local rooms = workspace:WaitForChild("CurrentRooms")
local gameData = game.ReplicatedStorage:WaitForChild("GameData")
local latestRoomValue = gameData:WaitForChild("LatestRoom")

local entity = game:GetObjects("rbxassetid://80648035882957")[1]
if entity then
	entity.Parent = workspace
else
	warn("Entity not loaded!")
end

local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))
if not room then
	warn("Room not found")
	return
end

if entity then
	entity:PivotTo(room:GetPivot() * CFrame.new(0,0,-40))
end

local timer = 30

local spawnSound = Instance.new("Sound")
spawnSound.Parent = workspace
spawnSound.SoundId = "rbxassetid://6305809364"
spawnSound.PlaybackSpeed = 0.28
spawnSound.Volume = 2
spawnSound:Play()
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Parent = gui
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 233, 182)
label.Position = UDim2.new(0.5, 0, 0.8, 0)
label.AnchorPoint = Vector2.new(0.5, 0.5)
label.Size = UDim2.new(0.4, 0, 0.1, 0)
label.TextScaled = true

local currentRoomNumber = latestRoomValue.Value

while timer > 0 do
	task.wait(1)

	if latestRoomValue.Value ~= currentRoomNumber then
		if entity then entity:Destroy() end
		gui:Destroy()
		break
	end

	timer -= 1
	label.Text = timer .. " seconds left"
	if timer <= 10 then
		label.TextColor3 = Color3.fromRGB(255, 0, 0)
	end
end

if timer <= 0 then
	hum.Health = 0

	local killSound = Instance.new("Sound")
	killSound.Parent = workspace
	killSound.SoundId = "rbxassetid://5867708670"
	killSound.Volume = 3
	killSound:Play()

	label.Text = "YOU DIED"
	task.wait(2)
	gui:Destroy()
end
