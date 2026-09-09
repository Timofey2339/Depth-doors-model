local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local rooms = workspace:WaitForChild("CurrentRooms")
local latestValue = ReplicatedStorage:WaitForChild("GameData"):WaitForChild("LatestRoom")

if workspace:FindFirstChild("SeekMovingNewClone") or rooms:FindFirstChild("50") then
    return
end

local isDestroyed = false

local seekConn = workspace.ChildAdded:Connect(function(child)
    if child.Name == "SeekMovingNewClone" then
        isDestroyed = true
    end
end)

local roomConn = rooms.ChildAdded:Connect(function(child)
    if child.Name == "50" then
        isDestroyed = true
    end
end)

local assetId = "rbxassetid://71675269899560"
local clock

pcall(function()
    clock = game:GetObjects(assetId)[1]
    clock.Parent = workspace
    clock.Name = "Ω"
end)

if not clock or isDestroyed then
    if clock then clock:Destroy() end
    return
end

local room = rooms:FindFirstChild(tostring(latestValue.Value))

if room then
    local parts = room:FindFirstChild("Parts")
    local floor = parts and parts:FindFirstChild("Floor")

    if floor then
        local offsetX = 0
        local offsetY = 9
        local offsetZ = 0
        local rotateY = 0

        clock:PivotTo(
            floor.CFrame
            * CFrame.new(offsetX, offsetY, offsetZ)
            * CFrame.Angles(0, math.rad(rotateY), 0)
        )
    end
end

task.wait(0.01)

local Reboundcolor = Instance.new("ColorCorrectionEffect", Lighting)
Debris:AddItem(Reboundcolor, 24)
Reboundcolor.Name = "Warn"
Reboundcolor.TintColor = Color3.fromRGB(102, 255, 0)
Reboundcolor.Saturation = 0
Reboundcolor.Contrast = 0

local CameraShaker = require(ReplicatedStorage:WaitForChild("CameraShaker"))
local camera = workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
    camera.CFrame = camera.CFrame * shakeCf
end)

camShake:Start()
camShake:ShakeOnce(10, 3, 0.1, 6, 2, 0.5)

local attachment = clock:FindFirstChild("Attachment")
if attachment then
    if attachment:FindFirstChild("face") then attachment.face.Enabled = false end
    if attachment:FindFirstChild("Smoke") then attachment.Smoke.Enabled = false end
    if attachment:FindFirstChild("Smoke2") then attachment.Smoke2.Enabled = false end
    if attachment:FindFirstChild("Noice") then attachment.Noice.Enabled = false end
    if attachment:FindFirstChild("PointLight") then attachment.PointLight.Enabled = false end
    if attachment:FindFirstChild("SmokeStart") then attachment.SmokeStart.Enabled = true end
end

if clock:FindFirstChild("Sound") then clock.Sound:Play() end
if clock:FindFirstChild("Ambience") then clock.Ambience:Stop() end
if clock:FindFirstChild("Static") then clock.Static:Play() end

task.wait(3.8)

if isDestroyed then
    if clock then clock:Destroy() end
    return
end

if clock:FindFirstChild("Static") then
    TweenService:Create(clock.Static, TweenInfo.new(2), {PlaybackSpeed = 0}):Play()
end

task.wait(3)

if isDestroyed then
    if clock then clock:Destroy() end
    return
end

if attachment then
    if attachment:FindFirstChild("face") then attachment.face.Enabled = true end
    if attachment:FindFirstChild("Smoke") then attachment.Smoke.Enabled = true end
    if attachment:FindFirstChild("Smoke2") then attachment.Smoke2.Enabled = true end
    if attachment:FindFirstChild("Noice") then attachment.Noice.Enabled = true end
    if attachment:FindFirstChild("PointLight") then attachment.PointLight.Enabled = true end
    if attachment:FindFirstChild("SmokeStart") then attachment.SmokeStart.Enabled = false end
end

if clock:FindFirstChild("Sound") then clock.Sound:Stop() end
if clock:FindFirstChild("Ambience") then clock.Ambience:Play() end
if clock:FindFirstChild("Static") then clock.Static:Stop() end

local isDamaging = true

task.spawn(function()
    while isDamaging and not isDestroyed do
        task.wait(1)
        local char = Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health > 0 then
            hum.Health -= 3
        end
        if hum and hum.Health < 0.1 then
            hum.Health -= 3
        end
        
        local stats = ReplicatedStorage:FindFirstChild("GameStats")
        if stats and stats:FindFirstChild("Player_" .. Players.LocalPlayer.Name) then
            stats["Player_" .. Players.LocalPlayer.Name]["Total"].DeathCause.Value = "Ω"
        end
    end
end)

repeat
    task.wait(0.1)
until isDestroyed or latestValue.Value ~= tonumber(room and room.Name)

seekConn:Disconnect()
roomConn:Disconnect()

isDamaging = false

if clock and clock.Parent then
    clock:Destroy()
end

TweenService:Create(Reboundcolor, TweenInfo.new(15), {
    TintColor = Color3.fromRGB(255, 255, 255),
    Saturation = 0,
    Contrast = 0
}):Play()
