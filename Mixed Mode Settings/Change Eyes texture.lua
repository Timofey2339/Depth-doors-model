local RunService = game:GetService("RunService")
local assetId = "rbxassetid://81616085996734"

local spawnedEyes = {}

RunService.RenderStepped:Connect(function()
    for _,eye in pairs(workspace:GetChildren()) do
        if eye.Name == "Eyes" then
            
            if eye:FindFirstChild("Core") then
                local core = eye.Core
                
                if core:FindFirstChild("Ambience") then
                    core.Ambience.PlaybackSpeed = 0.4
                    core.Ambience.Volume = 3
                end
                
                if core:FindFirstChild("Attack") then
                    core.Attack.PlaybackSpeed = 0.6
                    core.Attack.Volume = 0.7
                end
                
                if core:FindFirstChild("Initiate") then
                    core.Initiate.PlaybackSpeed = 0.6
                    core.Initiate.Volume = 2
                end
                
                if core:FindFirstChild("Repent") then
                    core.Repent.PlaybackSpeed = 0.7
                    core.Repent.Volume = 1
                end
                
                if core:FindFirstChild("Scream") then
                    core.Scream.PlaybackSpeed = 0.27
                    core.Scream.Volume = 0.9
                end
            end

            if not spawnedEyes[eye] then
                local clone = game:GetObjects(assetId)[1]
                clone.Parent = workspace
                clone:PivotTo(eye:GetPivot())
                spawnedEyes[eye] = clone
            else
                spawnedEyes[eye]:PivotTo(eye:GetPivot())
            end

        end
    end

    for eye,clone in pairs(spawnedEyes) do
        if not eye.Parent then
            clone:Destroy()
            spawnedEyes[eye] = nil
        end
    end
end)
