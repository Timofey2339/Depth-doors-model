workspace.ChildAdded:Connect(function(child)
    if child.Name == "Eyes" then
        
        local core = child:WaitForChild("Core")
        local attachment = core:WaitForChild("Attachment")

        attachment:WaitForChild("Angry").Texture = "rbxassetid://0"
        attachment:WaitForChild("Bite").Texture = "rbxassetid://0"
        attachment:WaitForChild("Spark").Texture = "rbxassetid://0"

        local eyesParticle = attachment:WaitForChild("EyesParticle")
        eyesParticle.Texture = "rbxassetid://94041916253312"
        eyesParticle.Size = NumberSequence.new(10)

        local ambience = core:WaitForChild("Ambience")
        ambience.Volume = 4
        ambience.PlaybackSpeed = 0.2

        child.Core.Attack.Volume = 4
        child.Core.Attack.PlaybackSpeed = 0.6

        child.Core.Attack.Volume = 4
        child.Core.Attack.PlaybackSpeed = 0.6

        child.Core.Repent.Volume = 4
        child.Core.Repent.PlaybackSpeed = 0.6

        child.Core.Initiate.Volume = 4
        child.Core.Initiate.PlaybackSpeed = 0.6

        child.Core.Teleport.Volume = 4
        child.Core.Teleport.PlaybackSpeed = 0.6

        child.Core.Scream.Volume = 4
        child.Core.Scream.PlaybackSpeed = 0.3
    end
end)
