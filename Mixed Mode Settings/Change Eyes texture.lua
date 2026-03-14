workspace.ChildAdded:Connect(function(child)
    if child.Name == "Eyes" then
        
        local core = child:WaitForChild("Core")
        local attachment = core:WaitForChild("Attachment")

        attachment:WaitForChild("Angry").Texture = "rbxassetid://0"
        attachment:WaitForChild("Bite").Texture = "rbxassetid://0"
        attachment:WaitForChild("Spark").Texture = "rbxassetid://0"

        local eyesParticle = attachment:WaitForChild("EyesParticle")
        eyesParticle.Size = NumberSequence.new(10)

        task.spawn(function()
            while child.Parent do
                eyesParticle.Texture = "rbxassetid://94041916253312"
                task.wait(0.01)
            end
        end)

        local ambience = core:WaitForChild("Ambience")
        ambience.Volume = 4
        ambience.PlaybackSpeed = 0.2

        core.Attack.Volume = 4
        core.Attack.PlaybackSpeed = 0.6

        core.Repent.Volume = 4
        core.Repent.PlaybackSpeed = 0.6

        core.Initiate.Volume = 4
        core.Initiate.PlaybackSpeed = 0.6

        core.Teleport.Volume = 4
        core.Teleport.PlaybackSpeed = 0.6

        core.Scream.Volume = 4
        core.Scream.PlaybackSpeed = 0.3
    end
end)
end)
