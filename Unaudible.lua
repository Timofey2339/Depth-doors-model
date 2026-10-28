local assetUrl = "https://github.com/BaneFromDiscord/RobloxTest/blob/main/unaudible.rbxm?raw=true"

local success, fileContent = pcall(function()
    return game:HttpGet(assetUrl)
end)

if not success or not fileContent then
    print("")
    return
end

local fileName = "unaudible.rbxm"
local writeSuccess = pcall(function()
    writefile(fileName, fileContent)
end)

if not writeSuccess then
	print("")
    return
end

local loadSuccess, result = pcall(function()
    local assetPath = getcustomasset(fileName)
    return game:GetObjects(assetPath)[1]
end)

if loadSuccess and result then
result.Parent = workspace
result.Name = "unaudibleBall"
result.monster.Size = Vector3.new(6, 6, 6)
result.monster.Shape = Enum.PartType.Ball
result.monster.CanCollide = true
result.monster.Anchored = false
	
    local rooms = workspace:WaitForChild("CurrentRooms")
    local gameData = game.ReplicatedStorage:WaitForChild("GameData")
    local latestRoomValue = gameData:WaitForChild("LatestRoom")
    
    local targetRoomNumber = latestRoomValue.Value + 1
    
    local room = rooms:WaitForChild(tostring(targetRoomNumber), 1)
    
    if room then
        local parts = room:WaitForChild("Parts", 1)
        if parts then
            local floor = parts:WaitForChild("Floor", 1)
            if floor then
                local offsetX = 0
                local offsetY = 10
                local offsetZ = 0
                local rotateY = 0

                result:PivotTo(
                    floor.CFrame
                    * CFrame.new(offsetX, offsetY, offsetZ)
                    * CFrame.Angles(0, math.rad(rotateY), 0)
                )
            end
        end
    else
	print("")
    end
else
	print("")
end
wait(27)
result:Destroy()
local workspace = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local currentRooms = workspace:WaitForChild("CurrentRooms")

if workspace:FindFirstChild("SeekMovingNewClone") or currentRooms:FindFirstChild("50") then
    return
end

local shouldCancel = false

local seekConn = workspace.ChildAdded:Connect(function(child)
    if child.Name == "SeekMovingNewClone" then
        shouldCancel = true
        local model = workspace:FindFirstChild("Unaudible")
        if model then model:Destroy() end
    end
end)

local roomConn = currentRooms.ChildAdded:Connect(function(child)
    if child.Name == "50" then
        shouldCancel = true
        local model = workspace:FindFirstChild("Unaudible")
        if model then model:Destroy() end
    end
end)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()	
local entity = spawner.Create({
        Entity = {
            Name = "Unaudible",
            Asset = "https://github.com/BaneFromDiscord/RobloxTest/blob/main/unaudible.rbxm?raw=true",
            HeightOffset = 0
        },
        Lights = {
            Flicker = { Enabled = false, Duration = 0},
            Shatter = true, Repair = false
        },
        Earthquake = { Enabled = false },
        CameraShake = { Enabled = true, Range = 45, Values = {5, 5, 0.1, 1} },
        Movement = { Speed = 200, Delay = 3, Reversed = false },
        Rebounding = { Enabled = false, Type = "Ambush", Min = 1, Max = 1, Delay = 1.0 },
        Damage = { Enabled = true, Range = 45, Amount = 0.1 },
        Crucifixion = { Enabled = true, Range = 15, Resist = false, Break = false },
        Death = {
            Type = "Guiding",
            Hints = {"death", "hints", "go","here"}, 
            Cause = "INAUDIBLE"
        }
    })

    entity:SetCallback("OnSpawned", function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Grab The Lighter or Flashlight!",true)
    wait(1)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Grab The Lighter or Flashlight!",true)
    wait(1)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Grab The Lighter or Flashlight!",true)
    wait(1)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Grab The Lighter or Flashlight!",true)
    end)

entity:SetCallback("OnDamagePlayer", function()

end)



    entity:SetCallback("OnDespawning", function()
		local item = game.Players.LocalPlayer.Character:FindFirstChild("Lighter") or game.Players.LocalPlayer.Character:FindFirstChild("Flashlight")
if not item then
game.Workspace:FindFirstChild("Unaudible").monster:FindFirstChild("Static").Volume = 0
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpscareGui"
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Parent = screenGui

local image = Instance.new("ImageLabel")
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.Position = UDim2.new(0.5, 0, 0.5, 0)
image.Size = UDim2.new(0.2, 0, 0.4, 0)
image.BackgroundTransparency = 1
image.Image = "http://www.roblox.com/asset/?id=11762983246"

image.Parent = background

local randomsize = math.random(1, 7)

if randomsize == 1 then
    image.Size = UDim2.new(0.1, 0, 0.2, 0)
    wait(2)
    image.Size = UDim2.new(0.2, 0, 0.3, 0)
    wait(4)
end
if randomsize == 2 then
    image.Size = UDim2.new(0.1, 0, 0.2, 0)
    wait(1)
    image.Size = UDim2.new(0.3, 0, 0.4, 0)
    wait(2)
end
if randomsize == 3 then
    image.Size = UDim2.new(0.1, 0, 0.2, 0)
    wait(1)
    image.Size = UDim2.new(0.2, 0, 0.3, 0)
    wait(2)
    image.Size = UDim2.new(0.3, 0, 0.4, 0)
    wait(4)
end
if randomsize == 4 then
    image.Size = UDim2.new(0.1, 0, 0.2, 0)
    wait(2)
end
if randomsize == 5 then
    image.Size = UDim2.new(0.3, 0, 0.4, 0)
    wait(1)
    image.Size = UDim2.new(0.35, 0, 0.45, 0)
    wait(2)
    image.Size = UDim2.new(0.45, 0, 0.55, 0)
    wait(4)
end
if randomsize == 6 then
    image.Size = UDim2.new(0.15, 0, 0.25, 0)
    wait(1)
    image.Size = UDim2.new(0.3, 0, 0.4, 0)
    wait(2)
end
if randomsize == 7 then
    image.Size = UDim2.new(0.3, 0, 0.4, 0)
    wait(2)
    image.Size = UDim2.new(0.25, 0, 0.35, 0)
    wait(2)
end

local tweenInfo = TweenInfo.new(
    0.7,


    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)

local targetSize = {
    Size = UDim2.new(3, 0, 4, 0)
}

local zoomTween = TweenService:Create(image, tweenInfo, targetSize)

local function playJumpscare()
image.ImageTransparency = 0.5
    local jumpscaresound = Instance.new("Sound")
    jumpscaresound.Volume = 5
    jumpscaresound.TimePosition = 0
    jumpscaresound.Parent = background
    jumpscaresound.SoundId = "rbxassetid://133651202885353"
    jumpscaresound:Play()
    zoomTween:Play()
    
    local startTime = tick()
    local duration = 0.7
    local random = Random.new()
    
    local rotateSpeed = 35
    local maxAngle = 7
    local dropAmount = 0
    local shakeIntensity = 20 

    local connection
    connection = RunService.RenderStepped:Connect(function()
        local elapsedTime = tick() - startTime
        
        if elapsedTime < duration then
            local progress = elapsedTime / duration
            
            image.Rotation = math.sin(elapsedTime * rotateSpeed) * maxAngle
            
            local currentY = 0.5 + (progress * dropAmount)
            
            local offsetX = random:NextInteger(-shakeIntensity, shakeIntensity)
            local offsetY = random:NextInteger(-shakeIntensity, shakeIntensity)
            image.Position = UDim2.new(0.5, offsetX, currentY, offsetY)
            
            local redAmount = random:NextInteger(50, 180)
            background.BackgroundColor3 = Color3.fromRGB(redAmount, 0, 0)
        else
            connection:Disconnect()
			screenGui.Enabled = false
			wait(5)
            screenGui:Destroy()
        end
    end)
end

playJumpscare()
game.ReplicatedStorage.GameStats["Player_" .. game.Players.LocalPlayer.Name]["Total"].DeathCause.Value = "INAUDIBLE"
wait(0.7)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end
if item then

end
	end)
    entity:Run()
