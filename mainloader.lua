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

-- Define valid place IDs for each game
local validPlaceIds = {
    [15558033314] = "Hoops Nation 2",
    [15441481660] = "Realistic Basketball",
    [3652625463] = "Lifting Simulator",
    [6804602922] = "Boxing Beta",
    [9598746251] = "Homerun Simulator",
    [13997018456] = "Operations Siege",
    [16732694052] = "Fisch"  -- Fisch's PlaceId added here
}

-- Check if the current PlaceId is valid and matches the correct game
local currentPlaceId = game.PlaceId

-- Create buttons for each game script
ScriptsTab:CreateButton({
    Name = "Siege Script",
    Callback = function()
        if currentPlaceId == 13997018456 then
            local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/OS")
            loadstring(script)()
            Rayfield:Notify({
                Title = "Successfully loaded!",
                Content = "Operations Siege script is ready!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Wrong Game",
                Content = "You're not in Operations Siege.",
                Duration = 5
            })
        end
    end
})

ScriptsTab:CreateButton({
    Name = "Hoops Nation 2",
    Callback = function()
        if currentPlaceId == 15558033314 then
            local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/1.%20H")
            loadstring(script)()
            Rayfield:Notify({
                Title = "Successfully loaded!",
                Content = "Hoops Nation 2 script is ready!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Wrong Game",
                Content = "You're not in Hoops Nation 2.",
                Duration = 5
            })
        end
    end
})

ScriptsTab:CreateButton({
    Name = "Realistic Basketball",
    Callback = function()
        if currentPlaceId == 15441481660 then
            local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/2.%20RB")
            loadstring(script)()
            Rayfield:Notify({
                Title = "Successfully loaded!",
                Content = "Realistic Basketball script is ready!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Wrong Game",
                Content = "You're not in Realistic Basketball.",
                Duration = 5
            })
        end
    end
})

ScriptsTab:CreateButton({
    Name = "Lifting Simulator",
    Callback = function()
        if currentPlaceId == 3652625463 then
            local script = game:HttpGet('https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/LS')
            loadstring(script)()
            Rayfield:Notify({
                Title = "Successfully loaded!",
                Content = "Lifting Simulator script is ready!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Wrong Game",
                Content = "You're not in Lifting Simulator.",
                Duration = 5
            })
        end
    end
})

ScriptsTab:CreateButton({
    Name = "Boxing Beta Script",
    Callback = function()
        if currentPlaceId == 6804602922 then
            local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/BE")
            loadstring(script)()
            Rayfield:Notify({
                Title = "Boxing Beta is Loaded!",
                Content = "Callback error might occur every once and a while.",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Wrong Game",
                Content = "You're not in Boxing Beta.",
                Duration = 5
            })
        end
    end
})

ScriptsTab:CreateButton({
    Name = "Homerun Simulator",
    Callback = function()
        if currentPlaceId == 9598746251 then
            local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/HS")
            loadstring(script)()
            Rayfield:Notify({
                Title = "Successfully loaded!",
                Content = "Homerun Simulator script is ready!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Wrong Game",
                Content = "You're not in Homerun Simulator.",
                Duration = 5
            })
        end
    end
})

-- Add Fisch Script Button
ScriptsTab:CreateButton({
    Name = "Fisch Script",
    Callback = function()
        if currentPlaceId == 16732694052 then
            local script = game:HttpGet("https://raw.githubusercontent.com/elfcodes808/-/refs/heads/main/FC")  -- Correct Fisch script URL
            loadstring(script)()
            Rayfield:Notify({
                Title = "Successfully loaded!",
                Content = "Fisch script is ready!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Wrong Game",
                Content = "You're not in Fisch.",
                Duration = 5
            })
        end
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

-- Game check (after all buttons are loaded)
if not validPlaceIds[currentPlaceId] then
    Rayfield:Notify({
        Title = "Wrong Game",
        Content = "You're in the wrong game to use this script. Please enter the correct game.",
        Duration = 5
    })
end
