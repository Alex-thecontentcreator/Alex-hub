-- [ Alex Hub - Safety & Misc Module ]
local SafetyModule = {}

function SafetyModule.Init(Window)
    local SafetyTab = Window:CreateTab("Safety & Misc")

    SafetyTab:CreateToggle({
        Name = "👻 Invisibility & Noclip Mode",
        CurrentValue = false,
        Flag = "AlexNoclip",
        Callback = function(enabled)
            print("[Alex Hub] Noclip toggled:", enabled)
        end,
    })

    SafetyTab:CreateToggle({
        Name = "🛡️ Anti-Trap & Anti-Ragdoll",
        CurrentValue = true,
        Flag = "AlexAntiTrap",
        Callback = function(enabled)
            print("[Alex Hub] Anti-Trap active:", enabled)
        end,
    })

    SafetyTab:CreateSlider({
        Name = "⚡ WalkSpeed Boost",
        Range = {16, 150},
        Increment = 1,
        CurrentValue = 16,
        Flag = "AlexWalkSpeed",
        Callback = function(Value)
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            end)
        end,
    })

    SafetyTab:CreateToggle({
        Name = "🚀 Infinite Jump",
        CurrentValue = false,
        Flag = "AlexInfJump",
        Callback = function(enabled)
            print("[Alex Hub] Infinite Jump toggled:", enabled)
        end,
    })

    SafetyTab:CreateToggle({
        Name = "🚨 Auto Server Hop on Moderator Join",
        CurrentValue = false,
        Flag = "AlexModHop",
        Callback = function(enabled)
            print("[Alex Hub] Mod detector toggled:", enabled)
        end,
    })

    SafetyTab:CreateToggle({
        Name = "⚡ FPS Booster / Lower 3D Render",
        CurrentValue = false,
        Flag = "AlexFPSBoost",
        Callback = function(enabled)
            local rs = game:GetService("RunService")
            if enabled then
                rs:Set3dRenderingEnabled(false)
            else
                rs:Set3dRenderingEnabled(true)
            end
        end,
    })
end

return SafetyModule
