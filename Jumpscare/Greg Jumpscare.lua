		-- UI Construction

    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")
	local SizeValue = Instance.new("NumberValue")

	SizeValue.Value = -0.15

    JumpscareGui.Name = "Jumpscare"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Background.Name = "Frame"
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 50

    Face.Name = "ImageLabel"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0.25, 0, 0.3, 0)
    Face.Image = "rbxassetid://11360803115"

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background
local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://135750666095391"
scare.PlaybackSpeed = 2
scare.Volume = 3

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 1
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local v2 = Random.new()
SizeValue.Value = -0.15
local v4 = math.random(1, 2)
scare:Play()
while true do
	local v6 = math.random(1, 3)
	if v6 == 1 then
		Background.BackgroundColor3 = Color3.new(0, 0, 0)
		Face.ImageColor3 = Color3.new(1, 1, 1)
	end
	if v6 == 2 then
		Background.BackgroundColor3 = Color3.new(0.596078, 0.596078, 0.596078)
		Face.ImageColor3 = Color3.new(0.858824, 1, 0.796078)
	end
	if v6 == 3 then
		Background.BackgroundColor3 = Color3.new(1, 1, 1)
		Face.ImageColor3 = Color3.new(0.647059, 0.647059, 0.647059)
	end
	Face.Position = UDim2.new(v2:NextNumber(0.4, 0.6), 0,v2:NextNumber(0.4, 0.6), 0)
	Face.Size = ImageLabel.Size + UDim2.new(SizeValue.Value, 0, SizeValue.Value, 0)
	Face.Rotation = math.random(-50, 50)
	SizeValue.Value = SizeValue.Value + 0.02
	wait(0)
end
wait(5)
ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
Background.BackgroundColor3 = Color3.new(0, 0, 0)
JumpscareGui.Enabled = false
