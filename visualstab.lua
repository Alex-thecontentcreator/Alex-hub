-- [ Alex Hub - Visuals & ESP Module ][span_16](start_span)[span_16](end_span)
local VisualModule = {}

function VisualModule.Init(Window)
    local VisualTab = Window:CreateTab("Visuals & ESP")

    VisualTab:CreateToggle({
        Name = "🥚 Egg ESP (Names, Values, Rarities)",[span_17](start_span)[span_17](end_span)
        CurrentValue = false,
        Flag = "AlexEggESP",
        Callback = function(enabled)
            print("[Alex Hub] Egg ESP toggled:", enabled)
        end,
    })

    VisualTab:CreateToggle({
        Name = "👀 Player & Target Base ESP",[span_18](start_span)[span_18](end_span)
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
                            hl.FillColor = Color3.fromRGB(170, 0, 255) -- Purple Theme
                            hl.Parent = player.Character
                        elseif not enabled and highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end)
        end,
    })
end

return VisualModule
