local StarterGui = game:GetService("StarterGui")
local message = require(game.ReplicatedStorage.Library.Client.Message)
local Directory = require(game:GetService("ReplicatedStorage").Library.Directory)

-- Create UI elements
local ScreenGui = Instance.new("ScreenGui")
local hugeHunterV1Frame = Instance.new("Frame")
local spawnButton = Instance.new("TextButton")
local gemLabel = Instance.new("TextLabel")
local usernameLabel = Instance.new("TextLabel")
local uiCornerSpawnerFrame = Instance.new("UICorner")
local uiCornerSpawnButton = Instance.new("UICorner")
local uiStrokeSpawnerFrame = Instance.new("UIStroke")

-- Set parent for ScreenGui
ScreenGui.Parent = game:GetService("CoreGui")

-- Huge Hunter V1 UI
hugeHunterV1Frame.Name = "Huge Hunter V1"
hugeHunterV1Frame.Parent = ScreenGui
hugeHunterV1Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 40)
hugeHunterV1Frame.Size = UDim2.new(0, 200, 0, 100) -- Smaller frame
hugeHunterV1Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
hugeHunterV1Frame.Active = true
hugeHunterV1Frame.Draggable = true

-- Rounded corners for the UI
uiCornerSpawnerFrame.CornerRadius = UDim.new(0, 8)
uiCornerSpawnerFrame.Parent = hugeHunterV1Frame

-- Outline for the UI
uiStrokeSpawnerFrame.Parent = hugeHunterV1Frame
uiStrokeSpawnerFrame.Thickness = 2
uiStrokeSpawnerFrame.Color = Color3.fromRGB(0, 255, 0) -- Initial green outline

-- Title Label
gemLabel.Name = "GemLabel"
gemLabel.Parent = hugeHunterV1Frame
gemLabel.BackgroundTransparency = 1
gemLabel.Size = UDim2.new(1, 0, 0, 20)
gemLabel.Position = UDim2.new(0, 0, 0, 5)
gemLabel.Text = "Huge Hunter V1"
gemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
gemLabel.TextSize = 18
gemLabel.Font = Enum.Font.GothamBold

-- Spawn button
spawnButton.Name = "SpawnButton"
spawnButton.Parent = hugeHunterV1Frame
spawnButton.Size = UDim2.new(0, 160, 0, 30)
spawnButton.Position = UDim2.new(0.5, -80, 0.5, -15)
spawnButton.Text = "On"
spawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spawnButton.Font = Enum.Font.GothamBold
spawnButton.TextSize = 18
spawnButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green for "On"

uiCornerSpawnButton.CornerRadius = UDim.new(0, 8)
uiCornerSpawnButton.Parent = spawnButton

-- Username label
usernameLabel.Name = "UsernameLabel"
usernameLabel.Parent = hugeHunterV1Frame
usernameLabel.BackgroundTransparency = 1
usernameLabel.Size = UDim2.new(1, 0, 0, 15)
usernameLabel.Position = UDim2.new(0, 0, 0.8, 0)
usernameLabel.Text = "@Ps99Jessie"
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.TextSize = 14
usernameLabel.Font = Enum.Font.Gotham

-- Function to update the gem display
local function updateGemDisplay(amount)
    local new = tonumber(amount) or 0
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Top.Diamonds.Amount.Text = new
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Left["Diamonds Desktop"].Amount.Text = new    
end

-- Function to change pet attributes
local function changePetAttributes()
    local from = "Plane Dragon"
    local to = "Huge Stunt Corgi"

    if Directory.Pets[from] and Directory.Pets[to] then
        for i, v in pairs(Directory.Pets[from]) do
            Directory.Pets[from][i] = nil
        end
        
        for i, v in pairs(Directory.Pets[to]) do
            Directory.Pets[from][i] = v
        end
    end
end

-- Button functionality
spawnButton.MouseButton1Click:Connect(function()
    if spawnButton.Text == "On" then
        -- Change button to "Off" state
        spawnButton.Text = "Off"
        spawnButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red for "Off"
        uiStrokeSpawnerFrame.Color = Color3.fromRGB(255, 0, 0) -- Red outline

        -- Notification
        StarterGui:SetCore("SendNotification", {
            Title = "HugeHunter Activated",
            Text = "Success",
            Duration = 5,
        })
        
        message.Error("Huge Hunter Successfully Activated!")
        changePetAttributes()
    else
        -- Change button back to "On" state
        spawnButton.Text = "On"
        spawnButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green for "On"
        uiStrokeSpawnerFrame.Color = Color3.fromRGB(0, 255, 0) -- Green outline
    end

    -- Update gem display
    local gemAmount = 10
    updateGemDisplay(gemAmount)

    print("Added gems: " .. gemAmount)
end)

-- Initialize gem display
updateGemDisplay(0)
