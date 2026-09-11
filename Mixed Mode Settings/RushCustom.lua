local RunService = game:GetService("RunService")
local assetId = "rbxassetid://87224407126646"
local spawnedEyes = {}

local function hide(obj)
    for _,v in pairs(obj:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency = 1
            v.CanCollide = false
        elseif v:IsA("ParticleEmitter") or v:IsA("Beam") then
            v.Enabled = false
        elseif v:IsA("Sound") then
            v.Volume = 3
        elseif v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") or v:IsA("DirectionalLight") then
            v.Enabled = false
            v.Brightness = 0
        end
    end
end

RunService.RenderStepped:Connect(function()
    for _,eye in pairs(workspace:GetChildren()) do
        if eye.Name == "RushMoving" then
            hide(eye)

            if eye:FindFirstChild("RushNew") then
                local core = eye.RushNew
                if core:FindFirstChild("Footsteps") then
                    core.Ambience.PlaybackSpeed = 0.1
                    core.Ambience.Volume = 0.5
                end
                if core:FindFirstChild("Kill") then
                    core.Attack.PlaybackSpeed = 0.9
                    core.Attack.Volume = 6
                end
                if core:FindFirstChild("Repent") then
                    core.Initiate.PlaybackSpeed = 0.7
                    core.Initiate.Volume = 6
                end
                if core:FindFirstChild("PlaySound") then
                    core.Repent.PlaybackSpeed = 0.4
                    core.Repent.Volume = 0.5
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
