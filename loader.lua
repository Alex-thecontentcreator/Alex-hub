-- [ Alex Hub V5 - Modular Loader with Custom Loading Screen ]
local Success, OrionLib = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonxr/Orion/main/source'))()
end)

if not Success or not OrionLib then
    warn("[Alex Hub] Failed to load Orion Library!")
    return
end

-- Create Window with Built-in Intro Enabled
local Window = OrionLib:MakeWindow({
    Name = "Alex Hub V5 | Steal an Egg",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "AlexHubConfig",
    IntroText = "Alex Hub is Loading...", -- The loading text you wanted!
    IntroIcon = "rbxassetid://6023426915", -- Clean icon for the loading badge
    IntroEnabled = true
})

-- Show a startup notification badge like Chilli Hub
OrionLib:MakeNotification({
    Name = "Alex Hub V5",
    Content = "Loading modules and bypasses...",
    Image = "rbxassetid://4483345998",
    Time = 5
})

print("[Alex Hub] Initializing modular loading...")

local function LoadModule(fileName)
    local url = "https://raw.githubusercontent.com/Alex-thecontentcreator/Alex-hub/refs/heads/main/" .. fileName
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success and result then
        local loadSuccess, module = pcall(function()
            return loadstring(result)()
        end)
        if loadSuccess and type(module) == "table" then
            print("[Alex Hub] Successfully loaded: " .. fileName)
            return module
        else
            warn("[Alex Hub] Failed to compile module code: " .. fileName)
        end
    else
        warn("[Alex Hub] HTTP request failed for: " .. fileName)
    end
    return nil
end

-- Load all your separate files safely
local MainModule = LoadModule("maintab.lua")
local UtilityModule = LoadModule("utilitytab.lua")
local UpgradeModule = LoadModule("upgradetab.lua")
local VisualModule = LoadModule("visualstab.lua")
local SafetyModule = LoadModule("safetytab.lua")

if MainModule and MainModule.Init then MainModule.Init(Window) end
if UtilityModule and UtilityModule.Init then UtilityModule.Init(Window) end
if UpgradeModule and UpgradeModule.Init then UpgradeModule.Init(Window) end
if VisualModule and VisualModule.Init then VisualModule.Init(Window) end
if SafetyModule and SafetyModule.Init then SafetyModule.Init(Window) end

-- Final Success Notification
OrionLib:MakeNotification({
    Name = "Alex Hub V5",
    Content = "Successfully Loaded! Enjoy farming.",
    Image = "rbxassetid://4483345998",
    Time = 3
})

OrionLib:Init()
print("[Alex Hub] Modular UI fully loaded!")
