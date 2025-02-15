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
    KeySystem = false, -- Set this to true to use our key system
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

-- Tabs
local InfoTab = Window:CreateTab("Information", 4483362458)

-- Labels
InfoTab:CreateLabel("Who made the script loader?")

InfoTab:CreateParagraph({
    Title = "Answer",
    Content = "kadencodes made the script loader"
})

InfoTab:CreateLabel("Who made the scripts provided in this loader?")

InfoTab:CreateParagraph({
    Title = "Answer",
    Content = "Tearz/Fearz Made the scripts provided in this loader"
})

InfoTab:CreateLabel("Who made the bot in the discord server?")

InfoTab:CreateParagraph({
    Title = "Answer",
    Content = "Tyler made the script management bot"
})

Rayfield:Notify({
    Title = "Successfully loaded!",
    Content = "Information is ready to be read!",
    Duration = 3
})
