local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://136848722764245"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1
sound:Play()
local sound2 = Instance.new("Sound")
sound2.Parent = workspace
sound2.SoundId = "rbxassetid://9125351901"
sound2.Volume = 0.5
sound2.Looped = true
sound2.PlaybackSpeed = 1
sound2:Play()
game.Workspace.Ambience_Dark.PlaybackSpeed = 1.2
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Death.PlaybackSpeed = 0.98
wait(0.01)
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(0.01), {FogEnd = 0}):Play()
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(0.01), {FogStart = 0}):Play()
wait(0.6)
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(2), {FogEnd = 80}):Play()
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(2), {FogStart = 10}):Play()
