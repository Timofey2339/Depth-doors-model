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
    Face.Image = "rbxassetid://89966657975652"

local scare = Instance.new("Sound")
scare.Parent = Background
scare.Name = "Jumpscare"
scare.SoundId = "rbxassetid://5567155845"
scare.PlaybackSpeed = 3
scare.Volume = 7

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.5
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 0.98

    Background.Parent = JumpscareGui
    Face.Parent = Background
	SizeValue.Parent = Background

SizeValue.Value = -0.05
scare:Play()
local u2 = Random.new()
local function v3()
	local v4 = math.random(1, 3)
	if v4 == 1 then
		Background.BackgroundColor3 = Color3.new(0, 0, 0)
		Face.ImageColor3 = Color3.new(1, 0, 0)
	end
	if v4 == 2 then
		Background.BackgroundColor3 = Color3.new(1, 1, 1)
		Face.ImageColor3 = Color3.new(0, 0, 0)
	end
	if v4 == 3 then
		Background.BackgroundColor3 = Color3.new(1, 0, 0)
		Face.ImageColor3 = Color3.new(0.729412, 0, 0)
	end
	Face.Position = UDim2.new(u2:NextNumber(0.35, 0.65), 0, u2:NextNumber(0.35, 0.65), 0)
	Face.Size = Face.Size + UDim2.new(SizeValue.Value, 0, SizeValue.Value / 2, 0)
	Face.Rotation = math.random(-360, 360)
end
for v5 = 1, 30 do
	v3()
	SizeValue.Value = SizeValue.Value + 0.01
	wait(0)
end
Background.Visible = false
