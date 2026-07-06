local soundLight = Instance.new("Sound")
soundLight.Parent = game.Workspace
soundLight.SoundId = "rbxassetid://136848722764245
soundLight.Volume = 3
soundLight:Play()
wait(0.01)
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(0.01), {FogEnd = 0}):Play()
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(0.01), {FogStart = 0}):Play()
wait(0.01)
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(2), {FogEnd = 50}):Play()
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(2), {FogStart = 10}):Play()
