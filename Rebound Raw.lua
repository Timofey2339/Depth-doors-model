local sound = Instance.new("Sound") sound.Parent = workspace sound.SoundId = "rbxassetid://136836151370178"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1
local pitch = Instance.new("PitchShiftSoundEffect") pitch.Parent = sound pitch.Octave = 1
sound:Play()
local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24) Reboundcolor.Name = "Warn"
Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf) camara.CFrame = camara.CFrame * shakeCf end)
camShake:Start() camShake:ShakeOnce(10,3,0.1,6,2,0.5) wait(4.96)
local sound = Instance.new("Sound")
sound.Parent = workspace sound.SoundId = "rbxassetid://9114221327"
sound.Volume = 5 sound.Looped = false sound.PlaybackSpeed = 1 
local pitch = Instance.new("PitchShiftSoundEffect") 
pitch.Parent = sound 
pitch.Octave = 1
sound:Play()
wait(0.04) 
95181878959735
