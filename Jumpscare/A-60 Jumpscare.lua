		-- UI Construction
    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")
	local SizeValue = Instance.new("NumberValue")

	SizeValue.Name = "SizeValue"
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
    Face.Image = "rbxassetid://11710167107"

local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://6459610652"
scare.PlaybackSpeed = 1
scare.Volume = 3

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 1
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 0.4

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background

local v2 = Random.new()
SizeValue.Value = -0.15
scare:Play()
local v4 = math.random(1, 2)
for v5 = 1, 20 do
	local randint = math.random(1, 3)
	if randint == 1 then
		Background.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(255, 0, 0)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	elseif randint == 2 then
		Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Face.ImageColor3 = Color3.new(1, 0, 0)
	elseif randint == 3 then
		Background.BackgroundColor3 = Color3.fromRGB(81, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(81, 0, 0)
		Face.ImageColor3 = Color3.new(0.67451, 0.376471, 0.376471)
	end
	Face.Position = UDim2.new(v2:NextNumber(0.4, 0.6), 0, v2:NextNumber(0.4, 0.6), 0)
	Face.Size += UDim2.new(0, SizeValue.Value, 0, SizeValue.Value)
	Face.Rotation = math.random(-45, 45)
	SizeValue.Value += 2
	wait(0)
end
Face.ImageColor3 = Color3.new(1, 1, 1)
Background.BackgroundColor3 = Color3.new(0, 0, 0)
JumpscareGui.Enabled = false
