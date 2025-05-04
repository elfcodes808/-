-- Load Rayfield UI Library
getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

if not Rayfield then
    return print("Your executor does not support Rayfield UI.")
end

local Window = Rayfield:CreateWindow({
    Name = "ShadowZ Script Loader",
    LoadingTitle = "Loading ShadowZ Main Loader...",
    LoadingSubtitle = "Powered by ShadowZ",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false,  -- Set KeySystem to false
})

-- Scripts Tab
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)
local CreditsTab = Window:CreateTab("Credits", 4483362458)
local FixesTab = Window:CreateTab("Fixes", 4483362458)
local InfoTab = Window:CreateTab("Information", 4483362458)

-- Main loader notification
Rayfield:Notify({
    Title = "Successfully loaded!",
    Content = "Script loader is ready!",
    Duration = 3
})

-- Create buttons for each game script
ScriptsTab:CreateButton({
    Name = "Siege Script",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/OS")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Operations Siege script is ready!",
            Duration = 5
        })
    end
})

ScriptsTab:CreateButton({
    Name = "Hoops Nation 2",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/1.%20H")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Hoops Nation 2 script is ready!",
            Duration = 5
        })
    end
})

ScriptsTab:CreateButton({
    Name = "Realistic Basketball",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/2.%20RB")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Realistic Basketball script is ready!",
            Duration = 5
        })
    end
})

ScriptsTab:CreateButton({
    Name = "Lifting Simulator",
    Callback = function()
        local script = game:HttpGet('https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/LS')
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Lifting Simulator script is ready!",
            Duration = 5
        })
    end
})

ScriptsTab:CreateButton({
    Name = "Boxing Beta Script",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/BE")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Boxing Beta is Loaded!",
            Content = "Callback error might occur every once and a while.",
            Duration = 5
        })
    end
})

ScriptsTab:CreateButton({
    Name = "Homerun Simulator",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/HS")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Homerun Simulator script is ready!",
            Duration = 5
        })
    end
})

-- Add Fisch Script Button
ScriptsTab:CreateButton({
    Name = "Fisch Script",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/FC")  -- Correct Fisch script URL
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Fisch script is ready!",
            Duration = 5
        })
    end
})

-- Shrimp Game Button (no place ID required)
ScriptsTab:CreateButton({
    Name = "Shrimp Game",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/SG")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Shrimp Game script is ready!",
            Duration = 5
        })
    end
})

-- Rivals Script Button
ScriptsTab:CreateButton({
    Name = "Rivals Script",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/R")  -- Rivals script URL
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Rivals script is ready!",
            Duration = 5
        })
    end
})

-- Add Basketball Legends Button
ScriptsTab:CreateButton({
    Name = "Basketball Legends 🏀",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/BL")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Basketball Legends script is ready!",
            Duration = 5
        })
    end
})

-- Add HCBB Script Button as loadstring
ScriptsTab:CreateButton({
    Name = "HCBB Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/HCBB"))()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "HCBB script is ready!",
            Duration = 5
        })
    end
})

FixesTab:CreateParagraph({
    Title = "FIXES",
    Content = "Fixed callback error"
})

CreditsTab:CreateParagraph({
    Title = "Special Thanks",
    Content = "Developed by kadencodes"
})

InfoTab:CreateButton({
    Name = "Info window",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/informationview.lua")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Information is ready to read!",
            Duration = 5
        })
    end
})
