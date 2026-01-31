local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://166047422"
sound.Volume = 7
sound.Looped = false
sound.PlaybackSpeed = 0.8

local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 1.25

sound:Play()

local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.IgnoreGuiInset = true

local frame = Instance.new("Frame")
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(0, 90, 175)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Size = UDim2.new(3, 0, 3, 0)
frame.BackgroundTransparency = 0.5
game:GetService("TweenService"):Create(frame,TweenInfo.new(1.2,Enum.EasingStyle.Sine),{BackgroundTransparency=1}):Play()
wait(0.3)
frame:Destroy()
