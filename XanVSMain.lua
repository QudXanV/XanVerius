-- XanVerius Hub (Fixed Version)

-- safety: tunggu game siap
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- load OrionLib dengan proteksi
local success, OrionLib = pcall(function()
    return loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/OrionLibrary/Orion/main/source.lua"
    ))()
end)

if not success or not OrionLib then
    warn("❌ OrionLib gagal load")
    return
end

-- buat window
local Window = OrionLib:MakeWindow({
    Name = "XanVerius Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "XanTest",
    IntroEnabled = false
})

-- tab
local Tab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddSection({
    Name = "LocalPlayer"
})

-- notification
OrionLib:MakeNotification({
    Name = "XanVerius",
    Content = "Hub Loaded Successfully",
    Time = 4
})

-- helper ambil humanoid (ANTI ERROR)
local function getHumanoid()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

-- tombol speed
Tab:AddButton({
    Name = "High Speed",
    Callback = function()
        getHumanoid().WalkSpeed = 50
    end
})

-- tombol jump
Tab:AddButton({
    Name = "High Jump",
    Callback = function()
        getHumanoid().JumpPower = 75
    end
})

-- tombol gravity
Tab:AddButton({
    Name = "Low Gravity",
    Callback = function()
        workspace.Gravity = 50
    end
})
