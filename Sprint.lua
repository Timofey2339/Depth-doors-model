-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

-- PLAYER
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--------------------------------------------------
-- GUI ROOT
--------------------------------------------------
local Gui = Instance.new("ScreenGui")
Gui.Name = "SprintGui"
Gui.Parent = PlayerGui
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--------------------------------------------------
-- INFO TEXT
--------------------------------------------------
local InfoText = Instance.new("TextLabel")
InfoText.Parent = Gui
InfoText.Text = "Hold Q to sprint or press the sprint button"
InfoText.Size = UDim2.new(0.8,0,0.08,0)
InfoText.Position = UDim2.new(0.1,0,0.2,0)
InfoText.BackgroundTransparency = 1
InfoText.TextColor3 = Color3.new(1,1,1)
InfoText.TextStrokeColor3 = Color3.new(0,0,0)
InfoText.TextStrokeTransparency = 0
InfoText.TextScaled = true
InfoText.Font = Enum.Font.SourceSansBold

task.delay(4,function()
	InfoText.Visible = false
end)

--------------------------------------------------
-- EXHAUSTED TEXT
--------------------------------------------------
local ExhaustText = Instance.new("TextLabel")
ExhaustText.Parent = Gui
ExhaustText.Text = "You're Exhausted"
ExhaustText.Size = UDim2.new(0.6,0,0.08,0)
ExhaustText.Position = UDim2.new(0.2,0,0.45,0)
ExhaustText.BackgroundTransparency = 1
ExhaustText.TextColor3 = Color3.new(1,1,1)
ExhaustText.TextStrokeColor3 = Color3.new(0,0,0)
ExhaustText.TextStrokeTransparency = 0
ExhaustText.TextScaled = true
ExhaustText.Font = Enum.Font.SourceSansBold
ExhaustText.Visible = false

--------------------------------------------------
-- FATIGUE OVERLAY
--------------------------------------------------
local Fatigue = Instance.new("Frame")
Fatigue.Parent = Gui
Fatigue.Size = UDim2.new(1,0,1,0)
Fatigue.BackgroundColor3 = Color3.new(0,0,0)
Fatigue.BackgroundTransparency = 1
Fatigue.ZIndex = 30

--------------------------------------------------
-- BLUR
--------------------------------------------------
local Blur = Instance.new("BlurEffect")
Blur.Parent = Lighting
Blur.Size = 0

--------------------------------------------------
-- SPRINT BUTTON (⬆ LEBIH KE ATAS LAGI)
--------------------------------------------------
local SprintButton = Instance.new("TextButton")
SprintButton.Parent = Gui
SprintButton.Text = "SPRINT"
SprintButton.Size = UDim2.new(0,90,0,90)
SprintButton.AnchorPoint = Vector2.new(1,0.5)
SprintButton.Position = UDim2.new(1,-20,0.24,0) -- 🔥 NAIK LAGI
SprintButton.BackgroundColor3 = Color3.fromRGB(200,200,200)
SprintButton.TextColor3 = Color3.new(1,1,1)
SprintButton.TextStrokeColor3 = Color3.new(0,0,0)
SprintButton.TextStrokeTransparency = 0
SprintButton.TextScaled = true
SprintButton.Font = Enum.Font.SourceSansBold

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Parent = SprintButton
BtnStroke.Color = Color3.new(0,0,0)
BtnStroke.Thickness = 3

--------------------------------------------------
-- STAMINA BAR
--------------------------------------------------
local Bar = Instance.new("Frame")
Bar.Parent = Gui
Bar.AnchorPoint = Vector2.new(0.5,1)
Bar.Position = UDim2.new(0.5,0,0.94,0)
Bar.Size = UDim2.new(0.26,0,0.022,0)
Bar.BackgroundColor3 = Color3.new(0,0,0)

local BarStroke = Instance.new("UIStroke")
BarStroke.Parent = Bar
BarStroke.Color = Color3.new(0,0,0)
BarStroke.Thickness = 2

local Fill = Instance.new("Frame")
Fill.Parent = Bar
Fill.Size = UDim2.new(1,0,1,0)
Fill.BackgroundColor3 = Color3.fromRGB(220,220,220)

--------------------------------------------------
-- CHARACTER
--------------------------------------------------
local Char = Player.Character or Player.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")

--------------------------------------------------
-- SETTINGS
--------------------------------------------------
local NORMAL_SPEED = 16
local SPRINT_SPEED = 22
local EXHAUST_SPEED = 10

local stamina = 100
local maxStamina = 100
local sprinting = false
local canSprint = true

Hum.WalkSpeed = NORMAL_SPEED

--------------------------------------------------
-- FUNCTIONS
--------------------------------------------------
local function startSprint()
	if stamina <= 0 or not canSprint then return end
	sprinting = true
	Hum.WalkSpeed = SPRINT_SPEED
end

local function stopSprint()
	sprinting = false
	Hum.WalkSpeed = NORMAL_SPEED
end

local function exhaust()
	sprinting = false
	canSprint = false
	stamina = 0

	Hum.WalkSpeed = EXHAUST_SPEED
	ExhaustText.Visible = true

	TweenService:Create(Blur, TweenInfo.new(0.3), {Size = 18}):Play()
	TweenService:Create(Fatigue, TweenInfo.new(0.3), {BackgroundTransparency = 0.4}):Play()

	task.delay(4,function()
		TweenService:Create(Blur, TweenInfo.new(0.4), {Size = 0}):Play()
		TweenService:Create(Fatigue, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
		ExhaustText.Visible = false
		Hum.WalkSpeed = NORMAL_SPEED
		canSprint = true
	end)
end

--------------------------------------------------
-- INPUT
--------------------------------------------------
SprintButton.MouseButton1Click:Connect(function()
	if sprinting then stopSprint() else startSprint() end
end)

UserInputService.InputBegan:Connect(function(input,gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.Q then
		SprintButton.Visible = false
		startSprint()
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Q then
		stopSprint()
	end
end)

--------------------------------------------------
-- STAMINA LOOP
--------------------------------------------------
task.spawn(function()
	while true do
		if sprinting then
			stamina -= 1.11
			if stamina <= 0 then
				exhaust()
			end
		elseif stamina < maxStamina then
			stamina += maxStamina / 110
		end

		stamina = math.clamp(stamina,0,maxStamina)
		Fill.Size = UDim2.new(stamina/maxStamina,0,1,0)
		task.wait(0.05)
	end
end)
