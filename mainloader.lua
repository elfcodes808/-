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

-- Tabs
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

ScriptsTab:CreateButton({
    Name = "Fisch Script",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/FC")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Fisch script is ready!",
            Duration = 5
        })
    end
})

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

ScriptsTab:CreateButton({
    Name = "Rivals Script",
    Callback = function()
        local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/R")
        loadstring(script)()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Rivals script is ready!",
            Duration = 5
        })
    end
})

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

ScriptsTab:CreateButton({
    Name = "Catch A Fade",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/CAF"))()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Catch A Fade script is ready!",
            Duration = 5
        })
    end
})

ScriptsTab:CreateButton({
    Name = "Track and Field",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/TF"))()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Track and Field script is ready!",
            Duration = 5
        })
    end
})

-- Fixes Tab content
FixesTab:CreateParagraph({
    Title = "FIXES",
    Content = "Fixed callback error"
})

-- Credits Tab content
CreditsTab:CreateParagraph({
    Title = "Special Thanks",
    Content = "Developed by kadencodes"
})

-- Info Tab Button
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
