   -- UI Construction

    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")

    JumpscareGui.Name = "JumpscareGui"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Background.Name = "Background"
    Background.BackgroundColor3 = Color3.fromRGB(3, 25, 99)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 999

    Face.Name = "Face"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0, 150, 0, 150)
    Face.Image = "rbxassetid://10914800940"

    Background.Parent = JumpscareGui
    Face.Parent = Background
local scare = Instance.new("Sound")
scare.Parent = JumpscareGui
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://109582246349306"
scare.PlaybackSpeed = 1
scare.Volume = 6

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 1
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 0.55
    
        task.spawn(function()
            while JumpscareGui.Parent do
                Background.BackgroundColor3 = Color3.fromRGB(3, 25, 99)
                task.wait(math.random(25, 100) / 1000)
                Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                task.wait(math.random(25, 100) / 1000)
            end
        end)

    game.TweenService:Create(Face, TweenInfo.new(0.6), {Size = UDim2.new(0, 1850, 0, 1050), ImageTransparency = 0}):Play()
    scare:Play()
    task.wait(0.7)
    JumpscareGui:Destroy()
