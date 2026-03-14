task.wait(0.5)

local sounds = game.ReplicatedStorage:FindFirstChild("Sounds")

if sounds then
    if sounds:FindFirstChild("BulbZap") then
        sounds.BulbZap.SoundId = "rbxassetid://4288784832"
    end
    
    if sounds:FindFirstChild("BulbBreak") then
        sounds.BulbBreak.SoundId = "rbxassetid://7140152893"
    end
end
