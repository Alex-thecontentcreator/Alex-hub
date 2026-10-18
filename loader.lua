-- [ Alex Hub V5 - Master Modular Loader ]
local Success, OrionLib = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonxr/Orion/main/source'))()
end)

if not Success or not OrionLib then
    warn("[Alex Hub] Failed to load Orion Library!")
    return
end

local Window = OrionLib:MakeWindow({
    Name = "Alex Hub V5 | Steal an Egg",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "AlexHubConfig",
    IntroText = "Loading Alex Hub V5...",
    IntroEnabled = true
})

local function LoadModule(fileName)
    local success, module = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Alex-thecontentcreator/Alex-hub/refs/heads/main/" .. fileName))()
    end)
    if success and type(module) == "table" then
        return module
    else
        warn("[Alex Hub] Failed to load module: " .. fileName)
        return nil
    end
end

-- Load all separate feature files
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

OrionLib:Init()
print("[Alex Hub] All features and modules loaded successfully!")
