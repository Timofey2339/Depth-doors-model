---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Monoxide",
		Asset = "rbxassetid://91836550237811",
		HeightOffset = -2
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {60, 80, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 380,
		Delay = 6,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Blitz", -- "Blitz"
		Min = 8,
		Max = 8,
		Delay = 0.0001
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 0.125
	},
	Crucifixion = {
		Enabled = false,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"Death", "Hints", "Go", "Here"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
local spawn = Instance.new("Sound")
    spawn.Parent = game.Workspace
    spawn.Name = "Spawn"
    spawn.SoundId = "rbxassetid://7053083974"
    spawn.Volume = 45
    spawn.PlaybackSpeed = 1
    spawn:Play()
	end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

-- Define services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")

		task.spawn(function()
			local player = Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoid = character:WaitForChild("Humanoid", 5)
			local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
			local camera = workspace.CurrentCamera

			local entityModel = workspace:WaitForChild("Monoxide")
			local primaryPart = entityModel:FindFirstChild("Monoxidenew")

			if not (entityModel and humanoid and humanoidRootPart and primaryPart and camera) then return end

			-- 🔒 Khóa di chuyển
			local originalWalkSpeed = humanoid.WalkSpeed
			local originalJumpPower = humanoid.JumpPower
			humanoid.WalkSpeed = 0
			humanoid.JumpPower = 0

			-- 🔒 Khóa điều khiển chuột (camera)
			local controlsModule = require(player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
			controlsModule:Disable()

			local to = true
			task.spawn(function()
				while to and primaryPart.Parent and humanoidRootPart.Parent do
					local targetCFrame = humanoidRootPart.CFrame
					local tween = TweenService:Create(primaryPart, TweenInfo.new(200000000000000000000, Enum.EasingStyle.Quad), {CFrame = targetCFrame})
					tween:Play()
					tween.Completed:Wait()
				end
			end)

			camera.CameraType = Enum.CameraType.Scriptable

			-- 🎇 Điều chỉnh TimeScale của ParticleEmitters
			local function updateParticleTimeScale(model, newTimeScale)
				for _, descendant in pairs(model:GetDescendants()) do
					if descendant:IsA("ParticleEmitter") then
						descendant.TimeScale = newTimeScale
					end
				end
			end

			updateParticleTimeScale(entityModel, 1) -- Bật particle
			task.delay(1, function()
				updateParticleTimeScale(entityModel, 0) -- Đóng băng particle sau 1 giây
			end)

			local lockConnection
			lockConnection = RunService.RenderStepped:Connect(function()
				if not primaryPart or not primaryPart.Parent then
					if lockConnection then lockConnection:Disconnect() end
					return
				end
				camera.CFrame = CFrame.lookAt(camera.CFrame.Position, primaryPart.Position)
			end)

			-- 🔊 Âm thanh Jumpscare
			function GitAud(soundgit, filename)
				local FileName = filename
				writefile(FileName..".mp3", game:HttpGet(soundgit))
				return (getcustomasset or getsynasset)(FileName..".mp3")
			end

			function CustomGitSound(soundlink, vol, filename)
				local sound = Instance.new("Sound")
				sound.SoundId = GitAud(soundlink, filename)
				sound.Parent = workspace
				sound.Name = "Crashgame"
				sound.Volume = 20
				sound:Play()
			end

			CustomGitSound("https://github.com/eoyoustme2/-i-lost-my-account-is-eoyoustme-/blob/main/Record_2025-07-12-09-21-59.mp3?raw=true", 1, "Crashgame")
			task.wait(0.01)

			-- 👁‍🗨 UI Jumpscare
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = "JumpscareOverlay"
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.DisplayOrder = 999999
			screenGui.Parent = player:WaitForChild("PlayerGui")

			local imageLabel = Instance.new("ImageLabel")
			imageLabel.Name = "JumpscareImage"
			imageLabel.BackgroundTransparency = 1
			imageLabel.BorderSizePixel = 0
			imageLabel.Position = UDim2.new(0, 0, 0, 0)
			imageLabel.Size = UDim2.new(1, 0, 1, 0)
			imageLabel.AnchorPoint = Vector2.new(0, 0)
			imageLabel.ScaleType = Enum.ScaleType.Stretch
			imageLabel.Image = ""
			imageLabel.Visible = true
			imageLabel.Parent = screenGui

			local jumpscareImage1 = "rbxassetid://0"
			local jumpscareImage2 = "rbxassetid://0"

			local flashDuration = 8
			local flashStartTime = tick()

			task.spawn(function()
				while tick() - flashStartTime < flashDuration do
					imageLabel.Image = jumpscareImage1
					task.wait(0)
					imageLabel.Image = jumpscareImage2
					task.wait(0)
				end
				imageLabel.Visible = false
			end)

			task.wait(4.8)

			to = false

			-- 💀 Giết người chơi
			game:Shutdown()

			-- 🧹 Cleanup
			if entityModel and entityModel.Parent then
				entityModel:Destroy()
			end

			if lockConnection then
				lockConnection:Disconnect()
			end

			camera.CameraType = Enum.CameraType.Custom

			if screenGui and screenGui.Parent then
				screenGui:Destroy()
			end

			-- 🔓 Khôi phục điều khiển (chỉ nếu nhân vật chưa chết sớm)
			if humanoid and humanoid.Health > 0 then
				humanoid.WalkSpeed = originalWalkSpeed
				humanoid.JumpPower = originalJumpPower
				controlsModule:Enable()
			end
		end)
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
