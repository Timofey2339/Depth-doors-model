local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://136848722764245"
sound.Volume = 5
sound.Looped = false
sound.PlaybackSpeed = 1
sound:Play()
wait(0.01)
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(0.01), {FogEnd = 0}):Play()
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(0.01), {FogStart = 0}):Play()
wait(0.01)
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(2), {FogEnd = 50}):Play()
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(2), {FogStart = 10}):Play()
