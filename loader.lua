-- [ Alex Hub V5 - Standardized Modular Loader ]
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
    IntroText = "Alex Hub is Loading...",
    IntroIcon = "rbxassetid://6023426915",
    IntroEnabled = true
})

-- Standardized raw URL base matching your repository
local baseUrl = "https://raw.githubusercontent.com/Alex-thecontentcreator/Alex-hub/main/"

local function LoadModule(fileName)
    local success, result = pcall(function()
        return game:HttpGet(baseUrl .. fileName)
    end)
    
    if success and result and result ~= "404: Not Found" then
        local loadSuccess, module = pcall(function()
            return loadstring(result)()
        end)
        if loadSuccess and type(module) == "table" then
            return module
        end
    end
    return nil
end

-- Load all separate files
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
