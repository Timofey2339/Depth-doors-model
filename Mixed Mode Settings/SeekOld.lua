coroutine.wrap(function()
    while true do
        wait(2)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        
        local seekClone = workspace:FindFirstChild("SeekMovingNewClone")
      
        if seekClone and seekClone:FindFirstChild("SeekRig") then
            local seekRig = seekClone.SeekRig
      seekClone.Figure.Transparency = 0
      seekClone.Figure.Scream.FlangeSoundEffect.Enabled = false
      seekClone.Figure.Attachment.ParticleEmitter.Enabled = true
      seekClone.Figure.CamAttach.SpotLight.Enabled = true

           
            for _, object in ipairs(seekRig:GetDescendants()) do
                if object:IsA("BasePart") then
                    object.Transparency = 1
                elseif object:IsA("Decal") or object:IsA("Texture") then
                    object.Transparency = 1
                end
            end
        end
    end
end)()
