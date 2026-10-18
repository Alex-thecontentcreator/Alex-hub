-- [ Alex Hub - Predictors & Crafting Module ]
local UtilityModule = {}

function UtilityModule.Init(Window)
    local UtilityTab = Window:CreateTab("Predictors & Craft")

    UtilityTab:CreateToggle({
        Name = "🔮 Egg & Hatch Predictor",
        CurrentValue = false,
        Flag = "AlexEggPredictor",
        Callback = function(enabled)
            print("[Alex Hub] Egg Predictor toggled:", enabled)
        end,
    })

    UtilityTab:CreateToggle({
        Name = "🧪 Rift & Fuse Outcome Predictor",
        CurrentValue = false,
        Flag = "AlexFusePredictor",
        Callback = function(enabled)
            print("[Alex Hub] Fuse Predictor toggled:", enabled)
        end,
    })

    UtilityTab:CreateToggle({
        Name = "📦 Auto Place & Hatch Stolen Eggs",
        CurrentValue = false,
        Flag = "AlexAutoHatch",
        Callback = function(enabled)
            print("[Alex Hub] Auto Hatch toggled:", enabled)
        end,
    })

    UtilityTab:CreateToggle({
        Name = "⚙️ Auto Fuse Machine",
        CurrentValue = false,
        Flag = "AlexAutoFuse",
        Callback = function(enabled)
            print("[Alex Hub] Auto Fuse Machine toggled:", enabled)
        end,
    })

    UtilityTab:CreateToggle({
        Name = "💰 Auto Sell Unwanted Pets/Eggs",
        CurrentValue = false,
        Flag = "AlexAutoSell",
        Callback = function(enabled)
            print("[Alex Hub] Auto Sell toggled:", enabled)
        end,
    })
end

return UtilityModule
