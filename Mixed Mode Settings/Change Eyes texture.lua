workspace.ChildAdded:Connect(function(child)
    if child.Name == "Eyes" then
        
        local core = child:FindFirstChild("Core")
        if not core then return end
        
        local attachment = core:FindFirstChild("Attachment")
        if not attachment then return end

        local angry = attachment:FindFirstChild("Angry")
        local bite = attachment:FindFirstChild("Bite")
        local spark = attachment:FindFirstChild("Spark")
        local eyesParticle = attachment:FindFirstChild("EyesParticle")

        if angry then angry.Texture = "rbxassetid://0" end
        if bite then bite.Texture = "rbxassetid://0" end
        if spark then spark.Texture = "rbxassetid://0" end

        if eyesParticle then
            eyesParticle.Size = NumberSequence.new(10)

            task.spawn(function()
                while child.Parent do
                    eyesParticle.Texture = "rbxassetid://94041916253312"
                    task.wait(0.1)
                end
            end)
        end

        if core:FindFirstChild("Ambience") then
            core.Ambience.Volume = 4
            core.Ambience.PlaybackSpeed = 0.2
        end

        if core:FindFirstChild("Attack") then
            core.Attack.Volume = 4
            core.Attack.PlaybackSpeed = 0.6
        end

        if core:FindFirstChild("Repent") then
            core.Repent.Volume = 4
            core.Repent.PlaybackSpeed = 0.6
        end

        if core:FindFirstChild("Initiate") then
            core.Initiate.Volume = 4
            core.Initiate.PlaybackSpeed = 0.6
        end

        if core:FindFirstChild("Teleport") then
            core.Teleport.Volume = 4
            core.Teleport.PlaybackSpeed = 0.6
        end

        if core:FindFirstChild("Scream") then
            core.Scream.Volume = 4
            core.Scream.PlaybackSpeed = 0.3
        end
        
    end
end)
        core.Scream.Volume = 4
        core.Scream.PlaybackSpeed = 0.3
    end
end)
end)
