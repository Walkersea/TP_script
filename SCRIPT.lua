local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true

frame.Parent = screenGui
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 180, 0, 50)
button.Position = UDim2.new(0.5, -90, 0.5, -25)
button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
button.Text = "Start"
button.TextScaled = true
button.Parent = frame

button.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
        wait(1)
        character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 1)
    end
end)
