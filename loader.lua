-- [ Alex Hub - Loader ]
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonxr/Orion/main/source'))()

-- Create the main window UI
local Window = OrionLib:MakeWindow({
	Name = "Alex Hub | Steal an Egg",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "AlexHubConfig"
})

-- Load the features from your maintab.lua file safely
local success, AlexHubModule = pcall(function()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/Alex-thecontentcreator/Alex-hub/refs/heads/main/maintab.lua"))()
end)

if success and AlexHubModule and AlexHubModule.SetupMainTab then
	AlexHubModule.SetupMainTab(Window)
	print("[Alex Hub] Successfully loaded all tabs!")
else
	warn("[Alex Hub] Failed to load maintab.lua module!")
end

-- Initialize the Orion UI Library
OrionLib:Init()
