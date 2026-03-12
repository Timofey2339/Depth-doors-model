local u2 = Random.new()
local function v3()
	local v4 = math.random(1, 3)
	if v4 == 1 then
		script.Parent.BackgroundColor3 = Color3.new(0, 0, 0)
		ImageLabel.ImageColor3 = Color3.new(1, 0, 0)
	end
	if v4 == 2 then
		script.Parent.BackgroundColor3 = Color3.new(1, 1, 1)
		ImageLabel.ImageColor3 = Color3.new(0, 0, 0)
	end
	if v4 == 3 then
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
		ImageLabel.ImageColor3 = Color3.new(0.729412, 0, 0)
	end
	ImageLabel.Position = UDim2.new(u2:NextNumber(0.35, 0.65), 0, u2:NextNumber(0.35, 0.65), 0)
	ImageLabel.Size = ImageLabel.Size + UDim2.new(SizeValue.Value, 0, SizeValue.Value / 2, 0)
	ImageLabel.Rotation = math.random(-360, 360)
end
Jumpscare:Play()
for v5 = 1, 30 do
	v3()
	SizeValue.Value = SizeValue.Value + 0.01
	wait(0)
end
Jumpscare:Stop()
