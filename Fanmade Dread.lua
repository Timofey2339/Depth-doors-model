local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://8558107873"
sound.Volume = 4
sound.Looped = false
sound.PlaybackSpeed = 1

local sound2 = Instance.new("Sound")
sound2.Parent = workspace
sound2.SoundId = "rbxassetid://4940109913"
sound2.Volume = 1.5
sound2.Looped = true
sound2.PlaybackSpeed = 1

local pitch = Instance.new("ReverbSoundEffect")
pitch.Parent = sound2

sound:Play()
sound2:Play()

local Warneffect = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Warneffect,24) 
    Warneffect.Name = "Warn" 
    Warneffect.TintColor = Color3.fromRGB(72, 72, 72) Warneffect.Saturation = 10 Warneffect.Contrast = -1 

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
 camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(4,2,0.1,5,2,0.5)

local assetId = "rbxassetid://15439261945"

local clock = game:GetObjects(assetId)[1]
clock.Parent = workspace

local rooms = workspace:WaitForChild("CurrentRooms")

local latest = game.ReplicatedStorage.GameData.LatestRoom.Value
local room = rooms:FindFirstChild(latest)

if room then
    local floor = room:WaitForChild("Parts"):WaitForChild("Floor")

    local offsetX = 0
    local offsetY = 5
    local offsetZ = 0
    local rotateY = 0

    clock:PivotTo(
        floor.CFrame
        * CFrame.new(offsetX, offsetY, offsetZ)
        * CFrame.Angles(0, math.rad(rotateY), 0)
    )
end


wait(36)
local sound3 = Instance.new("Sound")
sound3.Parent = workspace
sound3.SoundId = "rbxassetid://18858846695"
sound3.Volume = 4
sound3.Looped = false
sound3.PlaybackSpeed = 1
sound2:Destroy()
sound:Destroy()
sound3:Play()
game.TweenService:Create(Warneffect,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
wait(9)
sound3:Destroy()
