-- [ Alex Hub - Predictors & Crafting Module ][span_11](start_span)[span_11](end_span)
local UtilityModule = {}

function UtilityModule.Init(Window)
    local UtilityTab = Window:CreateTab("Predictors & Craft")

    UtilityTab:CreateToggle({
        Name = "🔮 Egg & Hatch Predictor",[span_12](start_span)[span_12](end_span)
        CurrentValue = false,
        Flag = "AlexEggPredictor",
        Callback = function(enabled)
            print("[Alex Hub] Egg Predictor toggled:", enabled)
        end,
    })

    UtilityTab:CreateToggle({
        Name = "⚙️ Auto Fuse & Hatch Machine",[span_13](start_span)[span_13](end_span)
        CurrentValue = false,
        Flag = "AlexAutoFuse",
        Callback = function(enabled)
            print("[Alex Hub] Auto Fuse toggled:", enabled)
        end,
    })

    UtilityTab:CreateToggle({
        Name = "💰 Auto Sell Unwanted Pets/Eggs",[span_14](start_span)[span_14](end_span)
        CurrentValue = false,
        Flag = "AlexAutoSell",
        Callback = function(enabled)
            print("[Alex Hub] Auto Sell toggled:", enabled)
        end,
    })
end

return UtilityModule
