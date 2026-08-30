---====== Load spawner ======---
coroutine.wrap(function()
    while true do
        task.wait(0.1)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        
        if workspace:FindFirstChild("SeekMovingNewClone") or workspace.CurrentRooms:FindFirstChild("50") then
		    game.Workspace:FindFirstChild("Monoxide", 5):Destroy()
            return
        end
    end
end)()
	
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local function setCharacterInvisible(invisible)
    local char = game.Players.LocalPlayer.Character
    if not char then return end

    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            if invisible then
                if not part:GetAttribute("SavedTransparency") then
                    part:SetAttribute("SavedTransparency", part.Transparency)
                end
                part.Transparency = 1
            else
                local saved = part:GetAttribute("SavedTransparency")
                if saved then
                    part.Transparency = saved
                else
                    part.Transparency = 0
                end
            end
        end
    end
end

local entity = spawner.Create({
    Entity = {
        Name = "Monoxide",
        Asset = "rbxassetid://130481102433430",
        HeightOffset = -2
    },
    Lights = {
        Flicker = { Enabled = false },
        Shatter = false,
        Repair = false
    },
    Earthquake = { Enabled = false },
    CameraShake = { Enabled = false },
    Movement = {
        Speed = 100,
        Delay = 3,
        Reversed = false
    },
    Rebounding = {
        Enabled = false
    },
    Damage = {
        Enabled = true,
        Range = 40,
        Amount = 0.1
    },
    Crucifixion = { Enabled = false },
    Death = { Type = "None" }
})

entity:SetCallback("OnDamagePlayer", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
local camera = game.Workspace.CurrentCamera

game:GetService("TweenService"):Create(game.Workspace:FindFirstChild("Monoxide").Monoxidenew, TweenInfo.new(999999999), {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame}):Play()

local TweenService = game:GetService("TweenService")
local monsterPart = workspace:FindFirstChild("Monoxide") and workspace.Monoxide:FindFirstChild("Monoxidenew")


if monsterPart then

    local targetCFrame = CFrame.lookAt(camera.CFrame.Position, monsterPart.Position)
    local tween = TweenService:Create(camera, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = targetCFrame})
    tween:Play()
    
    tween.Completed:Wait()
end
local camera = workspace.CurrentCamera
local fixedCamPos = camera.CFrame.Position
local startTime = tick()

local cameraConnection
cameraConnection = game:GetService("RunService").RenderStepped:Connect(function()
    if tick() - startTime < 1.5 then
        if monsterPart and monsterPart.Parent then
            camera.CameraType = Enum.CameraType.Scriptable
            camera.CFrame = CFrame.lookAt(fixedCamPos, monsterPart.Position)
        end
    else
        cameraConnection:Disconnect()
    end
end)
game:GetService("TweenService"):Create(game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Playsound, TweenInfo.new(0.5), {PlaybackSpeed = 0}):Play()
game:GetService("TweenService"):Create(game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Attachment.ParticleEmitter, TweenInfo.new(0.5), {TimeScale = 0}):Play()
game:GetService("TweenService"):Create(game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Attachment.Spark, TweenInfo.new(0.5), {TimeScale = 0}):Play()
game:GetService("TweenService"):Create(game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Attachment.BlackTrail, TweenInfo.new(0.5), {TimeScale = 0}):Play()
game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Playsound.Volume = 0
wait(0.7)
local ElecSound = Instance.new("Sound")
ElecSound.SoundId = "rbxassetid://120363749915904"
ElecSound.Volume = 10
ElecSound.Looped = false
ElecSound.Parent = game.Workspace
ElecSound:Play()
wait(0.8)
ElecSound:Stop()
setCharacterInvisible(true)
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local random = Random.new()

local X, Y, Z = 0.03, 0.03, 0.03
local startTime = tick()
local fixedCamPos = camera.CFrame.Position

camera.CameraType = Enum.CameraType.Scriptable

local shakeConnection
shakeConnection = RunService.RenderStepped:Connect(function()
    if monsterPart and monsterPart.Parent and (tick() - startTime < 6) then
        camera.CameraType = Enum.CameraType.Scriptable
        local baseLook = CFrame.lookAt(fixedCamPos, monsterPart.Position)
        local shakeOffset = CFrame.new(random:NextNumber(-X, X), random:NextNumber(-Y, Y), random:NextNumber(-Z, Z)) 
                          * CFrame.Angles(random:NextNumber(-X, X), random:NextNumber(-Y, Y), random:NextNumber(-Z, Z))
        
        camera.CFrame = baseLook * shakeOffset
    else
        shakeConnection:Disconnect()
    end
    wait(6)
    local lockStartTime = tick()
local lockConnection
lockConnection = RunService.RenderStepped:Connect(function()
    if monsterPart and monsterPart.Parent and (tick() - lockStartTime < 3.2) then
        camera.CameraType = Enum.CameraType.Scriptable
        camera.CFrame = CFrame.lookAt(fixedCamPos, monsterPart.Position)
        game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(0), {FieldOfView = 120}):Play()
    else
        lockConnection:Disconnect()
    end
end)
end)
camera.CameraType = Enum.CameraType.Custom
game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(6.5), {FieldOfView = 120}):Play()
game:GetService("TweenService"):Create(game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Playsound, TweenInfo.new(0.01), {PlaybackSpeed = 6}):Play()
game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Playsound.Volume = 3
wait(0.01)
game:GetService("TweenService"):Create(game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Playsound, TweenInfo.new(6.5), {PlaybackSpeed = 20}):Play()
wait(6)
local camera = workspace.CurrentCamera
local fixedCamPos = camera.CFrame.Position
local startTime = tick()
game.Workspace:FindFirstChild("Monoxide").Monoxidenew.Playsound.Volume = 0
local blur = Instance.new("BlurEffect")
blur.Size = 24
blur.Parent = game.Lighting
local JumpSound = Instance.new("Sound")
JumpSound.SoundId = "rbxassetid://109901368934060"
JumpSound.Volume = 5
JumpSound.Looped = true
JumpSound.Parent = game.Workspace
JumpSound:Play()
wait(0.3)
camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = CFrame.lookAt(camera.CFrame.Position, monsterPart.Position)
game.Workspace.CurrentCamera.FieldOfView = 120
wait(2.9)
setCharacterInvisible(false)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(0.01), {FieldOfView = 70}):Play()
game.Players.LocalPlayer.Character.Humanoid.Health = 0
camera.CameraType = Enum.CameraType.Custom
game.ReplicatedStorage.GameStats["Player_" .. game.Players.LocalPlayer.Name]["Total"].DeathCause.Value = "Monoxide"
wait(0.8)
blur:Destroy()
JumpSound:Destroy()
game.Workspace.Monoxide:Destroy()
end)

entity:Run()
