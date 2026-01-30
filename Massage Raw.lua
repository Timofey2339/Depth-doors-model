local captiongui = Instance.new("ScreenGui")
captiongui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local TextLabelCaption = Instance.new("TextLabel")
TextLabelCaption.Parent = captiongui
TextLabelCaption.BackgroundTransparency = 1
TextLabelCaption.TextColor3 = Color3.fromRGB(255, 233, 182)
TextLabelCaption.Position = UDim2.new(0.5, 0, 0.8, 0)
TextLabelCaption.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabelCaption.Size = UDim2.new(1, 0, 1, 0)
TextLabelCaption.TextSize = 18

TextLabelCaption.Text = "Mixed Mode has been loaded!"
wait(3)
TextLabelCaption.Text = "Made by Timofey2339"
wait(3)
TextLabelCaption.Text = "Enjoy"
wait(1)

local TweenService = game:GetService("TweenService")
local tween = TweenService:Create(
    TextLabelCaption,
    TweenInfo.new(4.95, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    {TextTransparency = 1}
)
tween:Play()
wait(5)

captiongui:Destroy()
