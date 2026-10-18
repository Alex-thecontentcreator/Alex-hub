-- [ Alex Hub - Main Farming Module ][span_3](start_span)[span_3](end_span)
local MainModule = {}

function MainModule.Init(Window)
    local FarmTab = Window:CreateTab("Auto Farm")

    local autoStealActive = false
    local tweenStealActive = false

    FarmTab:CreateToggle({
        Name = "⚡ Instant / Tween Steal Eggs",[span_4](start_span)[span_4](end_span)
        CurrentValue = false,
        Flag = "AlexTweenSteal",
        Callback = function(enabled)
            tweenStealActive = enabled
            if enabled then
                task.spawn(function()
                    while tweenStealActive do
                        pcall(function()
                            -- Tween character to target base eggs smoothly[span_5](start_span)[span_5](end_span)
                        end)
                        task.wait(0.5)
                    end
                end)
            end
        end,
    })

    FarmTab:CreateToggle({
        Name = "🔄 Continuous Auto Steal Routes",[span_6](start_span)[span_6](end_span)
        CurrentValue = false,
        Flag = "AlexAutoStealRoute",
        Callback = function(enabled)
            autoStealActive = enabled
            if enabled then
                task.spawn(function()
                    while autoStealActive do
                        pcall(function()
                            -- Runs automated collection routes[span_7](start_span)[span_7](end_span)
                        end)
                        task.wait(1)
                    end
                end)
            end
        end,
    })

    FarmTab:CreateDropdown({
        Name = "🎯 Rarity Filter",[span_8](start_span)[span_8](end_span)
        Options = {"All", "Mythic", "Brainrot God", "Legendary"},[span_9](start_span)[span_9](end_span)
        CurrentOption = "All",
        Flag = "AlexRarityFilter",
        Callback = function(Value)
            print("[Alex Hub] Target Rarity set to:", Value)
        end,
    })
end

return MainModule
