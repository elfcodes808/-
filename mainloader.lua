-- Load Rayfield UI Library
getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "ShadowZ Script Loader",
    LoadingTitle = "Loading UI...",
    LoadingSubtitle = "Powered by XyPhron Softworks",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
        Title = "STOP! Loading process paused.",
        Subtitle = "Insert a key to continue!",
        Note = "Join our support server for the key! .gg/C9nFAdEq4n",
        FileName = "KeySystem", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = {"KEY_1234Z1x0y2", "Admin_KEY124x0y2b6"} -- List of accepted keys, can be RAW file links (pastebin, github etc) or simple strings
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
    return  -- Stop the script if the key has expired
end

-- Scripts Tab
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)
local CreditsTab = Window:CreateTab("Credits", 4483362458)
local FixesTab = Window:CreateTab("Fixes", 4483362458)
local InfoTab = Window:CreateTab("Information", 4483362458)

ScriptsTab:CreateButton({
    Name = "Arsenal Menu",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/aresnalscript.lua"))()
        Rayfield:Notify({
            Title = "Successfully loaded!",
            Content = "Arsenal menu is ready!",
            Duration = 5
        })
    end
})

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

ScriptsTab:CreateLabel("Boxing Beta script is working at the moment might break!")

ScriptsTab:CreateButton({
    Name = "boxing beta Script",
    Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/shadowzscript/refs/heads/main/boxingbeta.lua"))()
        Rayfield:Notify({
            Title = "Boxing Beta is Loaded!",
            Content = "Callback error might occur every once and a while.",
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
