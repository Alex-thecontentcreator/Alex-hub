-- [ Alex Hub - Loader ]
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonxr/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
	Name = "Alex Hub | Steal an Egg",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "AlexHubConfig",
	IntroText = "Welcome to Alex Hub",
	IntroEnabled = true,
	-- Orion supports built-in themes like "Default", "Amber", "Amethyst", "Blue", "Green", "Dark", etc.
	-- "Amethyst" or custom color setups give you that awesome purple look!
})
