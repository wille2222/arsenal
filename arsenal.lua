local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("nah arsenal script", "DarkTheme")
local main = Window:NewTab("main")
local main = main:NewSection("main")
main:NewButton("silent aim", "silent cheatos", function()
-- Configuration
local ESP_COLOR = Color3.fromRGB(255, 0, 0)  -- Color of the ESP boxes (RGB)
local ESP_TRANSPARENCY = 0.7  -- Transparency of the ESP boxes (0 to 1)
local ESP_THICKNESS = 2  -- Thickness of the ESP boxes' outline

-- Function to create ESP for a given player
local function createESP(player)
    local playerCharacter = player.Character
    if not playerCharacter then return end
    
    local humanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Create BillboardGui for ESP
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = humanoidRootPart
    billboardGui.AlwaysOnTop = true
    billboardGui.Size = UDim2.new(2, 0, 2, 0)  -- Size of the billboard (can adjust as needed)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)  -- Offset from the part
    billboardGui.Parent = humanoidRootPart
    
    -- Create frame inside BillboardGui to draw the ESP box
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1  -- Make frame transparent
    frame.Parent = billboardGui
    
    -- Create outline for ESP box
    local outline = Instance.new("Frame")
    outline.Size = UDim2.new(1, 0, 1, 0)
    outline.BackgroundColor3 = ESP_COLOR
    outline.BorderSizePixel = 2
    outline.BorderColor3 = ESP_COLOR
    outline.BackgroundTransparency = 1 - ESP_TRANSPARENCY  -- Adjust transparency
    outline.Parent = frame
    
    -- Function to update ESP
    local function updateESP()
        if playerCharacter and playerCharacter.Parent then
            billboardGui.Enabled = true
        else
            billboardGui.Enabled = false
        end
    end
    
    -- Call updateESP initially and connect it to CharacterAdded event
    updateESP()
    playerCharacter.ChildAdded:Connect(updateESP)
end

-- Function to handle when players are added
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        createESP(player)
    end)
end

-- Loop through existing players and connect the function
for _, player in ipairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Listen for new players joining the game
game.Players.PlayerAdded:Connect(onPlayerAdded)
end)
main:NewButton("silent aim", "silent cheatos", function()
   -- Configuration
local ESP_COLOR = Color3.fromRGB(255, 0, 0)  -- Color of the ESP boxes (RGB)
local ESP_TRANSPARENCY = 0.7  -- Transparency of the ESP boxes (0 to 1)
local ESP_THICKNESS = 2  -- Thickness of the ESP boxes' outline

-- Function to create ESP for a given player
local function createESP(player)
    local playerCharacter = player.Character
    if not playerCharacter then return end
    
    local humanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Create BillboardGui for ESP
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = humanoidRootPart
    billboardGui.AlwaysOnTop = true
    billboardGui.Size = UDim2.new(2, 0, 2, 0)  -- Size of the billboard (can adjust as needed)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)  -- Offset from the part
    billboardGui.Parent = humanoidRootPart
    
    -- Create frame inside BillboardGui to draw the ESP box
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1  -- Make frame transparent
    frame.Parent = billboardGui
    
    -- Create outline for ESP box
    local outline = Instance.new("Frame")
    outline.Size = UDim2.new(1, 0, 1, 0)
    outline.BackgroundColor3 = ESP_COLOR
    outline.BorderSizePixel = 2
    outline.BorderColor3 = ESP_COLOR
    outline.BackgroundTransparency = 1 - ESP_TRANSPARENCY  -- Adjust transparency
    outline.Parent = frame
    
    -- Function to update ESP
    local function updateESP()
        if playerCharacter and playerCharacter.Parent then
            billboardGui.Enabled = true
        else
            billboardGui.Enabled = false
        end
    end
    
    -- Call updateESP initially and connect it to CharacterAdded event
    updateESP()
    playerCharacter.ChildAdded:Connect(updateESP)
end

-- Function to handle when players are added
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        createESP(player)
    end)
end

-- Loop through existing players and connect the function
for _, player in ipairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Listen for new players joining the game
game.Players.PlayerAdded:Connect(onPlayerAdded) 
end)
main:NewButton("silent aim", "silent cheatos", function()
    -- Configuration
local highlightColor = Color3.fromRGB(0, 0, 255) -- Blue color
local highlightTransparency = 0.3 -- Transparency of the highlight
local highlightSize = Vector3.new(1, 2, 1) -- Size of the highlight box

-- Function to create a highlight for a specific player
local function highlightPlayer(player)
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            -- Create BillboardGui for the highlight
            local billboardGui = Instance.new("BillboardGui")
            billboardGui.Name = "PlayerHighlight"
            billboardGui.Size = UDim2.new(1, 0, 1, 0)
            billboardGui.AlwaysOnTop = true
            billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Offset to lift the highlight slightly above the player
            billboardGui.Adornee = humanoidRootPart

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundColor3 = highlightColor
            frame.BackgroundTransparency = highlightTransparency
            frame.BorderSizePixel = 0
            frame.Position = UDim2.new(-0.5, 0, -0.5, 0)
            frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
            frame.Parent = billboardGui

            billboardGui.Parent = humanoidRootPart
        end
    end
end

-- Function to remove highlights from all players
local function removeAllHighlights()
    for _, player in ipairs(game.Players:GetPlayers()) do
        local character = player.Character
        if character then
            local highlight = character:FindFirstChild("PlayerHighlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

-- Highlight all existing players when the script runs
for _, player in ipairs(game.Players:GetPlayers()) do
    highlightPlayer(player)
end

-- Connect a function to handle when a new player joins
game.Players.PlayerAdded:Connect(function(player)
    highlightPlayer(player)
end)

-- Connect a function to handle when a player leaves
game.Players.PlayerRemoving:Connect(function(player)
    removeAllHighlights()
end)
end)

-- Function to set ammo counts to 999
local function setAmmoCounts()
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player.PlayerGui

    if playerGui and playerGui.GUI and playerGui.GUI.Client and playerGui.GUI.Client.Variables then
        playerGui.GUI.Client.Variables.ammocount.Value = 999
        playerGui.GUI.Client.Variables.ammocount2.Value = 999
    end
end

-- Function to continuously check and set ammo counts
local function checkAndSetAmmoCounts()
    while true do
        setAmmoCounts(999)
        wait(1)  -- Adjust the interval as needed, e.g., every second
    end
end

-- Call the function initially
setAmmoCounts(999)

-- Run the checking function in a coroutine to keep it running
coroutine.wrap(checkAndSetAmmoCounts)(999)
end)

main:NewKeybind("menu", "menu", Enum.KeyCode.K, function()
	Library:ToggleUI()
end)
