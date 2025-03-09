local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui")
local backpack = player.Backpack


local hammer = Instance.new("HopperBin")
hammer.Name = "Hammer"
hammer.BinType = 4
hammer.Parent = backpack

local cloneTool = Instance.new("HopperBin")
cloneTool.Name = "Clone"
cloneTool.BinType = 3
cloneTool.Parent = backpack

local grabTool = Instance.new("HopperBin")
grabTool.Name = "Grab"
grabTool.BinType = 2
grabTool.Parent = backpack


local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui


local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui


local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 180, 0, 50)
startButton.Position = UDim2.new(0.5, -90, 0.5, -60)
startButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
startButton.Text = "Start"
startButton.TextScaled = true
startButton.Parent = frame


local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(0, 180, 0, 50)
noclipButton.Position = UDim2.new(0.5, -90, 0.5, 10)
noclipButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
noclipButton.Text = "Noclip"
noclipButton.TextScaled = true
noclipButton.Parent = frame

startButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
        wait(1)
        character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 1)
    end
end)


local noclip = false
local runService = game:GetService("RunService")

noclipButton.MouseButton1Click:Connect(function()
    noclip = not noclip
    if noclip then
        noclipButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Green when enabled
    else
        noclipButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red when disabled
    end
end)

runService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)
