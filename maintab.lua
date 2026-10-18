-- [ Alex Hub - Main Feature Module ]
local AlexHub = {}

function AlexHub.SetupMainTab(Window)
	if not Window then
		warn("[Alex Hub] SetupMainTab requires a Window.")
		return nil
	end

	-- Create Professional Tabs
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
							-- Add your game remote event logic here
							print("[Alex Hub] Stealing eggs...")
						end)
						task.wait(0.5)
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
							print("[Alex Hub] Selling inventory...")
						end)
						task.wait(2)
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
			print("[Alex Hub] Player ESP toggled:", enabled)
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
					print("[Alex Hub] Teleported to Safe Zone!")
				end
			end)
		end,
	})

	return MainTab
end

return AlexHub
