local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local rooms = workspace:WaitForChild("CurrentRooms")
local gameData = game.ReplicatedStorage:WaitForChild("GameData")

local latestRoomValue = gameData:WaitForChild("LatestRoom")

local entity = game:GetObjects("rbxassetid://80648035882957")[1]
entity.Parent = workspace

local room = rooms:FindFirstChild(tostring(latestRoomValue.Value))

if not room then
	warn("Room not found")
	return
end

entity:PivotTo(room:GetPivot() * CFrame.new(0,0,-40))

local TimerValue = Instance.new("NumberValue")
TimerValue.Name = "TimerValue"
TimerValue.Parent = workspace
TimerValue.Value = 30

local SpawnSound = Instance.new("Sound")
SpawnSound.Parent = workspace
SpawnSound.Name = "Spawn"
SpawnSound.SoundId = "rbxassetid://6305809364"
SpawnSound.PlaybackSpeed = 0.28
SpawnSound.Volume = 2
SpawnSound:Play()

local captiongui = Instance.new("ScreenGui")
captiongui.Parent = player:WaitForChild("PlayerGui")

local TextLabelCaption = Instance.new("TextLabel")
TextLabelCaption.Parent = captiongui
TextLabelCaption.BackgroundTransparency = 1
TextLabelCaption.TextColor3 = Color3.fromRGB(255, 233, 182)
TextLabelCaption.Position = UDim2.new(0.5, 0, 0.8, 0)
TextLabelCaption.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabelCaption.Size = UDim2.new(1, 0, 1, 0)
TextLabelCaption.TextSize = 18

local currentRoomNumber = latestRoomValue.Value

while task.wait(1) do
	
	if latestRoomValue.Value ~= currentRoomNumber then
		entity:Destroy()
		TimerValue:Destroy()
		captiongui:Destroy()
		break
	end
	
	TimerValue.Value -= 1
	
	TextLabelCaption.Text = TimerValue.Value .. " seconds left"
	
	if TimerValue.Value <= 0 then
		hum.Health = 0
		
		local KillSound = Instance.new("Sound")
		KillSound.Parent = workspace
		KillSound.Name = "Kill"
		KillSound.SoundId = "rbxassetid://5867708670"
		KillSound.PlaybackSpeed = 1.05
		KillSound.Volume = 3
		KillSound:Play()
		
		captiongui:Destroy()
		TimerValue:Destroy()
		break
	end
	
end
local currentRoomNumber = latestRoomValue.Value

while task.wait(0.4) do
	
	if latestRoomValue.Value ~= currentRoomNumber then
		entity:Destroy()
		game.Workspace.TimerValue:Destroy()
local TweenService = game:GetService("TweenService")
local tween = TweenService:Create(
    TextLabelCaption,
    TweenInfo.new(4.95, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    {TextTransparency = 1}
)
tween:Play()
wait(5)

captiongui:Destroy()
		break
	end

local TextLabelCaption = Instance.new("TextLabel")
TextLabelCaption.Parent = captiongui
TextLabelCaption.BackgroundTransparency = 1
TextLabelCaption.TextColor3 = Color3.fromRGB(255, 233, 182)
TextLabelCaption.Position = UDim2.new(0.5, 0, 0.8, 0)
TextLabelCaption.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabelCaption.Size = UDim2.new(1, 0, 1, 0)
TextLabelCaption.TextSize = 18
wait(0.1)
TextLabelCaption.Text = "You have 30 seconds"
while true do
wait(0.99)
game.Workspace.TimerValue.Value -= 1
wait(0.01)
TextLabelCaption.Text = ""game.Workspace.TimerValue.Value" seconds left"
wait(0.01)
if game.Workspace.TimerValue.Value = 0 then
	game.Workspace.TimerValue:Destroy()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
    local KillSound = Instance.new("Sound")
	KillSound.Parent = workspace
	KillSound.Name = "Kill"
	KillSound.SoundId = "rbxassetid://5867708670"
    KillSound.PlaybackSpeed = 1.05
	KillSound.Volume = 3
	KillSound:Play()
captiongui:Destroy()
end
end
