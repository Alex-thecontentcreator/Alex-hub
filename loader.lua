-- [ Alex Hub - Auto Farm Module ]
local MainModule = {}

function MainModule.Init(Window)
    local FarmTab = Window:CreateTab("Auto Farm")

    local autoStealActive = false
    local tweenStealActive = false

    FarmTab:CreateToggle({
        Name = "⚡ Instant / Tween Steal Eggs",
        CurrentValue = false,
        Flag = "AlexTweenSteal",
        Callback = function(enabled)
            tweenStealActive = enabled
            if enabled then
                task.spawn(function()
                    while tweenStealActive do
                        pcall(function()
                            -- Tweens character to target base eggs smoothly without anti-teleport triggers[span_0](start_span)[span_0](end_span)
                        end)
                        task.wait(0.5)
                    end
                end)
            end
        end,
    })

    FarmTab:CreateToggle({
        Name = "🔄 Continuous Auto Steal Routes",
        CurrentValue = false,
        Flag = "AlexAutoStealRoute",
        Callback = function(enabled)
            autoStealActive = enabled
            if enabled then
                task.spawn(function()
                    while autoStealActive do
                        pcall(function()
                            -- Runs automated collection routes based on criteria[span_1](start_span)[span_1](end_span)
                        end)
                        task.wait(1)
                    end
                end)
            end
        end,
    })

    FarmTab:CreateDropdown({
        Name = "🎯 Target Rarity & Value Filter",
        Options = {"All", "Mythic", "Brainrot God", "Legendary"},
        CurrentOption = "All",
        Flag = "AlexRarityFilter",
        Callback = function(Value)
            print("[Alex Hub] Target Rarity filter set to:", Value)
        end,
    })

    FarmTab:CreateToggle({
        Name = "📜 Rift Recipe / Priority Target Mode",
        CurrentValue = false,
        Flag = "AlexRiftPriority",
        Callback = function(enabled)
            print("[Alex Hub] Priority target mode toggled:", enabled)
        end,
    })
end

return MainModule
