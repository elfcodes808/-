-- Load Rayfield UI Library
getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

if not Rayfield then
    return print("Your executor does not support Rayfield UI.")
end

local Window = Rayfield:CreateWindow({
    Name = "ShadowZ Script Loader",
    LoadingTitle = "Loading UI...",
    LoadingSubtitle = "Powered by ShadowZ",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false, 
    KeySettings = {
        Title = "STOP! Loading process paused.",
        Subtitle = "Insert a key to continue!",
        Note = "Join our support server for the key! .gg/C9nFAdEq4n",
        FileName = "KeySystem",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"KEY_1234Z1x0y2", "Admin_KEY124x0y2b6"}
    }
})

-- Key expiration functionality
local keyExpirationTime = 5  -- 5 seconds until the key expires
local keyStartTime = tick()  -- Record the start time when the script starts

-- Function to check if the key has expired
local function isKeyExpired()
    return tick() - keyStartTime >= keyExpirationTime
end

-- Wait for the key input and check if it has expired
if isKeyExpired() then
    Rayfield:Notify({
        Title = "Key Expired",
        Content = "Your key has expired. Please enter a new one.",
        Duration = 5
    })
    return
end

-- Define valid place IDs for each game
local validPlaceIds = {
    [15558033314] = "Hoops Nation 2",
    [15441481660] = "Realistic Basketball",
    [3652625463] = "Lifting Simulator",
    [6804602922] = "Boxing Beta",
    [9598746251] = "Homerun Simulator",
    [13997018456] = "Operations Siege",
    [7606564092] = "Shrimp Game"
}

-- Check if the current PlaceId is valid and matches the correct game
local currentPlaceId = game.PlaceId

if not validPlaceIds[currentPlaceId] then
    Rayfield:Notify({
        Title = "Wrong Game",
        Content = "You're in the wrong game to use this script. Please enter the correct game.",
        Duration = 5
    })
    return
end

-- Scripts Tab
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)
local CreditsTab = Window:CreateTab("Credits", 4483362458)
local FixesTab = Window:CreateTab("Fixes", 4483362458)
local InfoTab = Window:CreateTab("Information", 4483362458)

ScriptsTab:CreateButton({
    Name = "Siege Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/seigescript.lua"))()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Siege Script is ready!",
            Duration = 5
        })
    end
})

ScriptsTab:CreateButton({
    Name = "Hoops Nation 2",
    Callback = function()
        if currentPlaceId == 15558033314 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/Hoop%20Nation%202"))()
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
            loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/Realistic%20Basketball"))()
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
            loadstring(game:HttpGet('https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/lifting%20Simulator'))()
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
            loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/boxingbeta.lua"))()
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
            loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/homerun%20Simulator"))()
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

-- Add Shrimp Game Button
ScriptsTab:CreateButton({
    Name = "Shrimp Game",
    Callback = function()
        if currentPlaceId == 7606564092 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/Shrimp%20game"))()
            Rayfield:Notify({
                Title = "Successfully loaded!",
                Content = "Shrimp Game script is ready!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Wrong Game",
                Content = "You're not in Shrimp Game.",
                Duration = 5
            })
        end
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/informationview.lua"))()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Information is ready to read!",
            Duration = 5
        })
    end
})

Rayfield:Notify({
    Title = "Successfully loaded!",
    Content = "Script loader is ready!",
    Duration = 3
})
