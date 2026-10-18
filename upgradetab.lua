-- [ Alex Hub - Upgrades & Rewards Module ]
local UpgradeModule = {}

function UpgradeModule.Init(Window)
    local UpgradeTab = Window:CreateTab("Upgrades")

    UpgradeTab:CreateToggle({
        Name = "🏃‍♂️ Auto Treadmill Farming",
        CurrentValue = false,
        Flag = "AlexAutoTreadmill",
        Callback = function(enabled)
            print("[Alex Hub] Auto Treadmill toggled:", enabled)
        end,
    })

    UpgradeTab:CreateToggle({
        Name = "📈 Instant Base & Multiplier Upgrades",
        CurrentValue = false,
        Flag = "AlexAutoUpgrade",
        Callback = function(enabled)
            print("[Alex Hub] Auto Upgrade toggled:", enabled)
        end,
    })

    UpgradeTab:CreateButton({
        Name = "🎁 Claim All Rewards & Daily Gifts",
        Callback = function()
            pcall(function()
                print("[Alex Hub] Claimed playtime gifts and index rewards!")
            end)
        end,
    })
end

return UpgradeModule
