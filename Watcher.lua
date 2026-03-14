local Watcher = Instance.new("Model")
Watcher.Name = "WatcherEntity"
Watcher.Parent = workspace

local player = game.Players.LocalPlayer
local hum = player.Character:WaitForChild("Humanoid")
local enableDamage = true
local no = false

-- звуки
local sounds = {}
for i = 1,3 do
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://137162043074149"
	s.PlaybackSpeed = 1
	s.Volume = 0.7
	s.Parent = Watcher
	table.insert(sounds,s)
end

-- камера
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camera = workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value,function(cf)
	camera.CFrame = camera.CFrame * cf
end)

-- кімната
local room = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
local spawnPart
if room:FindFirstChild("Nodes") then
	local nodes = room.Nodes:GetChildren()
	spawnPart = nodes[math.floor(#nodes/2)]
else
	spawnPart = room:FindFirstChild(room.Name)
end

-- Part очей
local eyes = game:GetObjects("rbxassetid://79312363226377")[1]
eyes.Parent = Watcher
eyes.CFrame = spawnPart.CFrame * CFrame.new(0,5,0)

-- якщо нова кімната
workspace.CurrentRooms.ChildAdded:Connect(function()
	enableDamage = false
	Watcher:Destroy()
end)

-- Damage цикл
while enableDamage do
	if not eyes.Parent then break end

	local _,visible = camera:WorldToScreenPoint(eyes.Position)
	if not visible then
		if player.Character and not player.Character:GetAttribute("Hiding") then
			camShake:Start()
			camShake:ShakeOnce(5,15,0.1,1)

			hum.Health -= 3
			if not no then
				sounds[math.random(1,#sounds)]:Play()
			end

			if hum.Health <= 0 then
				no = true
				game.ReplicatedStorage.GameStats["Player_"..player.Name].Total.DeathCause.Value = "Watcher"
				task.wait(1.8)
			end
		end
	end

	task.wait(0.5)
end
