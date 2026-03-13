local Watcher = Instance.new("Model")
Watcher.Parent = workspace
Watcher.Name = "WatcherEntity"
local v = game.Players.LocalPlayer
local enableDamage = true
local no = false
local damage1 = Instance.new("Sound")
damage1.SoundId = "rbxassetid://137162043074149"
damage1.Pitch = 1
damage1.Volume = 0.7
local damage2 = Instance.new("Sound")
damage2.SoundId = "rbxassetid://137162043074149"
damage2.Pitch = 1
damage2.Volume = 0.7
local damage3 = Instance.new("Sound")
damage3.SoundId = "rbxassetid://137162043074149"
damage3.Pitch = 1
damage3.Volume = 0.7

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
 
local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local eyes=game:GetObjects("rbxassetid://118562324368932")[1]
 
if eyes then end
game.Workspace.CurrentRooms.ChildAdded:Connect(function()
    Watcher:Destroy()
    enableDamage = false
end)
local num=0

if currentLoadedRoom:FindFirstChild("Nodes") then
   num = math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
end

eyes.CFrame=(
	num==0 and currentLoadedRoom[currentLoadedRoom.Name] or currentLoadedRoom.Nodes[num]
).CFrame+Vector3.new(0,5,0)
 
eyes.Parent=Watcher
damage1.Parent=Watcher
damage2.Parent=Watcher
damage3.Parent=Watcher
local mom = {damage1, damage2, damage3}

if game.Players.LocalPlayer.Character.Humanoid.Health<=0 then
   no = true
end
 
local hum=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
while true and enableDamage do
if not Watcher then break end
	local _,found=workspace.CurrentCamera:WorldToScreenPoint(eyes.Position)
	if not found then
	if v.Character ~= nil and not v.Character:GetAttribute("Hiding") then
if workspace.CurrentRooms:FindFirstChild("51") or workspace:FindFirstChild("SeekMoving")  then
return
end

camShake:Start()
camShake:ShakeOnce(5, 15, 0.1, 1)
		hum.Health-=3
          if no == false then
		mom[math.random(1, #mom)]:Play()
          end
		if hum.Health<=0 then
		if no == false then
			game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Watcher"
			no = true
			wait(1.8)
			
		end
		end
	end
	end
	task.wait(0.5)
end
