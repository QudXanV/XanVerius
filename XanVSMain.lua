-- XanVerius Hub | Minimal & Smooth UI
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/shlexware/Rayfield/main/source"
))()

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "XanVerius Hub",
    LoadingTitle = "XanVerius",
    LoadingSubtitle = "Smooth • Minimal • Clean",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "XanVerius",
        FileName = "MainConfig"
    },
    KeySystem = false
})

-- Tab
local PlayerTab = Window:CreateTab("Player", 4483345998)
local PlayerSection = PlayerTab:CreateSection("Movement")

-- Helper
local function getHumanoid()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

-- WalkSpeed Slider
PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(Value)
        getHumanoid().WalkSpeed = Value
    end
})

-- JumpPower Slider
PlayerTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 150},
    Increment = 5,
    Suffix = "Jump",
    CurrentValue = 50,
    Callback = function(Value)
        getHumanoid().JumpPower = Value
    end
})

-- Gravity Toggle
PlayerTab:CreateToggle({
    Name = "Low Gravity",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            workspace.Gravity = 50
        else
            workspace.Gravity = 196.2
        end
    end
})

-- Reset Button
PlayerTab:CreateButton({
    Name = "Reset Player Stats",
    Callback = function()
        local hum = getHumanoid()
        hum.WalkSpeed = 16
        hum.JumpPower = 50
        workspace.Gravity = 196.2
    end
})

-- Notify
Rayfield:Notify({
    Title = "XanVerius Hub",
    Content = "Loaded Successfully",
    Duration = 4
})
