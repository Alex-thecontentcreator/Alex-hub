-- [ Alex Hub - Loader Script ]
local AlexHub = {}

-- Load UI Library (Orion Library)
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

if not OrionLib then
    warn("[Alex Hub]: Failed to load UI Library.")
    return
end

-- Create the Window
local Window = OrionLib:MakeWindow({
    Name = "Alex Hub | Steal an Egg",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "AlexHubConfig"
})

-- Notification on startup
OrionLib:MakeNotification({
    Title = "Alex Hub Loaded!",
    Content = "Successfully initialized Steal an Egg script.",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Load your Main Tab code module from GitHub
-- REPLACE THE LINK BELOW WITH YOUR EXACT maintab.lua RAW LINK!
local success, MainModule = pcall(function()
    return loadstring(game:HttpGet("YOUR_GITHUB_RAW_LINK_FOR_MAINTAB.lua"))()
end)

if success and MainModule and type(MainModule.SetupMainTab) == "function" then
    -- Pass the window into your module function
    MainModule.SetupMainTab(Window)
else
    warn("[Alex Hub]: Failed to load MainTab module: " .. tostring(MainModule))
end

-- Initialize the UI
OrionLib:Init()

return AlexHub
