local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.BackgroundTransparency = 0.5
button.TextColor3 = Color3.fromRGB(150, 150, 150)
button.Position = UDim2.new(0.2, 0, 0.8, 0)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Size = UDim2.new(0.3, 0, 0.3, 0)
button.TextSize = 18
button.Text = "Update Log"
button.Parent = gui

local framelog = Instance.new("Frame")
framelog.Parent = gui
framelog.Visible = false
framelog.BackgroundTransparency = 0.5
framelog.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
framelog.Position = UDim2.new(0.5, 0, 0.5, 0)
framelog.AnchorPoint = Vector2.new(0.5, 0.5)
framelog.Size = UDim2.new(0.5, 0, 0.5, 0)

local TextUpdate = Instance.new("TextLabel")
TextUpdate.Parent = framelog 
TextUpdate.BackgroundTransparency = 1
TextUpdate.TextColor3 = Color3.fromRGB(0, 0, 0)
TextUpdate.Position = UDim2.new(0.5, 0, 0.5, 0)
TextUpdate.AnchorPoint = Vector2.new(0.5, 0.5)
TextUpdate.Size = UDim2.new(1, 0, 1, 0)
TextUpdate.TextSize = 8
TextUpdate.RichText = true
TextUpdate.TextWrapped = true
TextUpdate.TextScaled = true
TextUpdate.Text = "Version 1.7, Monoxide has been updated by little, Greg got changed, Depth has been deleted, added new entity called Rambey, Mixed mode changed to Particulate Mode"

local buttonClose = Instance.new("TextButton") 
buttonClose.BackgroundTransparency = 0.5
buttonClose.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonClose.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
buttonClose.Position = UDim2.new(0, 0, -0.3, 0)
buttonClose.AnchorPoint = Vector2.new(0, 0)
buttonClose.Size = UDim2.new(0.3, 0, 0.3, 0)
buttonClose.TextSize = 10
buttonClose.Text = "X"
buttonClose.Parent = framelog

button.MouseButton1Click:Connect(function()
    framelog.Visible = true
    button.Visible = false
end)

buttonClose.MouseButton1Click:Connect(function()
    framelog.Visible = false
end)
