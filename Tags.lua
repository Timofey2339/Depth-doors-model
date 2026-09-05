local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local ownerUserId = 840771269

local entityUrls = {
	["/greg"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Greg%20Raw.lua",
	["/drave"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Drave.lua",
	["/rebound"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Rebound%20Raw.lua",
	["/spark"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Spark.lua",
	["/nightmareapex"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Nightmare%20Apex",
	["/monoxide"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Monoxide.lua",
	["/dread"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Fanmade%20Dread.lua",
	["/ankle"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Ankle.lua",
	["/watcher"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Watcher.lua",
	["/a179"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/A-179%20Raw.lua",
	["/a60"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/A-60%20Raw.lua",
	["/anxiety"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Anxiety.lua",
	["/a35admin"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Custom%20Entities/A-35.lua",
	["/rambey"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Rambey%20Raw.lua",
	["/glacher"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Glacher.lua",
	["/feast"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Feast.lua",
	["/wide"] = "https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Wide.lua"
}

TextChatService.OnIncomingMessage = function(message)
	local properties = Instance.new("TextChatMessageProperties")
	
	if message.TextSource then
		local sender = Players:GetPlayerByUserId(message.TextSource.UserId)
		if sender and sender.UserId == ownerUserId then
			properties.PrefixText = "<font color='#FF0000'>[OWNER Of the mode]</font> " .. message.PrefixText
		end
	end
	
	return properties
end

local function onPlayerAdded(player)
	player.Chatted:Connect(function(message)
		if player.UserId ~= ownerUserId then return end
		
		local command = string.lower(message)
		local url = entityUrls[command]
		
		if url then
			task.spawn(function()
				local success, err = pcall(function()
					loadstring(game:HttpGet(url))()
				end)
				if not success then
					warn("unknown error " .. tostring(err))
				end
			end)
		end
	end)
end

Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in ipairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
