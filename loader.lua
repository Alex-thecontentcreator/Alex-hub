-- [ Alex Hub - Ultra Fast & Smooth All-In-One Script ]
local Success, OrionLib = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonxr/Orion/main/source'))()
end)

if not Success or not OrionLib then
    warn("[Alex Hub] Failed to load Orion Library!")
    return
end

local Window = OrionLib:MakeWindow({
    Name = "Alex Hub | Steal an Egg",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "AlexHubConfig",
    IntroText = "Alex Hub Loading...",
    IntroEnabled = true
})

-- ==================== TABS ====================
local MainTab = Window:CreateTab("Main Farm")
local VisualsTab = Window:CreateTab("Visuals / ESP")
local MiscTab = Window:CreateTab("Teleports")

-- ==================== MAIN FARM TAB ====================
local autoStealEnabled = false
local autoSellEnabled = false

MainTab:CreateToggle({
    Name = "⚡ Instant / Fast Auto Steal",
    CurrentValue = false,
    Flag = "AlexAutoSteal",
    Callback = function(enabled)
        autoStealEnabled = enabled
        if enabled then
            task.spawn(function()
                while autoStealEnabled do
                    pcall(function()
                        -- Add your game remote/farming function here
                    end)
                    task.wait(0.3) -- Fast and optimized delay to prevent mobile crashes
                end
            end)
        end
    end,
})

MainTab:CreateToggle({
    Name = "💰 Auto Sell Eggs",
    CurrentValue = false,
    Flag = "AlexAutoSell",
    Callback = function(enabled)
        autoSellEnabled = enabled
        if enabled then
            task.spawn(function()
                while autoSellEnabled do
                    pcall(function()
                        -- Add your sell logic here
                    end)
                    task.wait(1.5)
                end
            end)
        end
    end,
})

-- ==================== VISUALS / ESP TAB ====================
VisualsTab:CreateToggle({
    Name = "👀 Player ESP (Highlight)",
    CurrentValue = false,
    Flag = "AlexPlayerESP",
    Callback = function(enabled)
        pcall(function()
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    local highlight = player.Character:FindFirstChild("AlexESP")
                    if enabled and not highlight then
                        local hl = Instance.new("Highlight")
                        hl.Name = "AlexESP"
                        hl.FillColor = Color3.fromRGB(170, 0, 255) -- Purple ESP
                        hl.Parent = player.Character
                    elseif not enabled and highlight then
                        highlight:Destroy()
                    end
                end
            end
        end)
    end,
})

-- ==================== TELEPORTS TAB ====================
MiscTab:CreateButton({
    Name = "🏠 Teleport to Safe Zone",
    Callback = function()
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
            end
        end)
    end,
})

-- Initialize UI cleanly
OrionLib:Init()
