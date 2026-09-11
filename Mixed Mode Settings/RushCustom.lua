local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local assetId = "rbxassetid://87224407126646"
local spawnedEyes = {}
local loadingEyes = {}

local DARK_RED = Color3.fromRGB(120, 0, 0)

local function hide(obj)
	for _, v in pairs(obj:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
			v.CanCollide = false
		elseif v:IsA("ParticleEmitter") or v:IsA("Beam") then
			v.Enabled = false
		elseif v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") or v:IsA("DirectionalLight") then
			v.Enabled = false
			v.Brightness = 0
		end
	end
end

local function setupSounds(eye)
	local core = eye:FindFirstChild("RushNew")
	if not core then return end

	if core:FindFirstChild("Footsteps") then
		core.Ambience.PlaybackSpeed = 0.1
		core.Ambience.Volume = 0.5
	end
	if core:FindFirstChild("Kill") then
		core.Attack.PlaybackSpeed = 0.9
		core.Attack.Volume = 6
	end
	if core:FindFirstChild("Repent") then
		core.Initiate.PlaybackSpeed = 0.7
		core.Initiate.Volume = 6
	end
	if core:FindFirstChild("PlaySound") then
		core.Repent.PlaybackSpeed = 0.4
		core.Repent.Volume = 0.5
	end
	if core:FindFirstChild("Scream") then
		core.Scream.PlaybackSpeed = 0.27
		core.Scream.Volume = 0.9
	end
end

local function applyJumpscareColor(jumpscareRush)
	for _, child in pairs(jumpscareRush:GetChildren()) do
		if child:IsA("ImageLabel") then
			child.ImageColor3 = DARK_RED
		end
	end
	
	jumpscareRush.ChildAdded:Connect(function(child)
		if child:IsA("ImageLabel") then
			child.ImageColor3 = DARK_RED
		end
	end)
end

task.spawn(function()
	local mainUI = playerGui:WaitForChild("MainUI", 10) or playerGui:WaitForChild("Knobs", 10) or playerGui
	local jumpscareFolder = mainUI:WaitForChild("Jumpscare", 10)
	
	if jumpscareFolder then
		local rushJumpscare = jumpscareFolder:FindFirstChild("Jumpscare_Rush")
		if rushJumpscare then
			applyJumpscareColor(rushJumpscare)
		end
		
		jumpscareFolder.ChildAdded:Connect(function(child)
			if child.Name == "Jumpscare_Rush" then
				applyJumpscareColor(child)
			end
		end)
	end
end)

workspace.ChildAdded:Connect(function(child)
	if child.Name == "RushMoving" then
		loadingEyes[child] = true
		
		task.spawn(function()
			setupSounds(child)
			
			local success, result = pcall(function()
				return game:GetObjects(assetId)[1]
			end)
			
			if success and result and child.Parent then
				result.Parent = workspace
				result:PivotTo(child:GetPivot())
				spawnedEyes[child] = result
			end
			
			loadingEyes[child] = nil
		end)
	end
end)

RunService.RenderStepped:Connect(function()
	for eye, clone in pairs(spawnedEyes) do
		if eye and eye.Parent then
			hide(eye)
			clone:PivotTo(eye:GetPivot())
		else
			clone:Destroy()
			spawnedEyes[eye] = nil
		end
	end
end)
