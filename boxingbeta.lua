local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Window = Rayfield:CreateWindow({
   Name = "ShadowZ",
   LoadingTitle = "Loading ShadowZ Boxing Beta Script",
   LoadingSubtitle = "by Fearz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ShadowZ_Config",
      FileName = "ShadowZ_Config"
   },
   Discord = {
      Enabled = true,
      Invite = "V6cpWCYN",
      RememberJoins = true
   },
   KeySystem = false
})

-- Create Tabs
local CombatTab = Window:CreateTab("🥊 Combat", 4483362458)
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)
local CreditTab = Window:CreateTab("📜 Credits", 4483362458)

-- Add Label
CombatTab:CreateLabel("Boxing Beta Script V1.0")

-- Variables for functionality
local AutoPunchEnabled = false
local PunchDelay = 0.2
local WalkSpeed = 16
local PunchRange = 10 -- Define range for detecting nearby players
local FasterStamEnabled = false

-- Functions
local function AutoPunch()
    while AutoPunchEnabled do
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if distance <= PunchRange then
                        local args = {
                            [1] = player.Character,
                            [3] = "back",
                            [4] = true, -- Ensure true for damage application
                            [5] = "Left"
                        }
                        ReplicatedStorage.CombatRemotesRemotes.Damage3Event:FireServer(unpack(args))
                    end
                end
            end
        end
        task.wait(PunchDelay) -- Adjustable delay
    end
end

local function SetWalkSpeed(speed)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end
end

local function FasterStam()
    while FasterStamEnabled do
        -- Fire the stamina remote to keep it at 100 constantly
        ReplicatedStorage.RemoteEvents.PlayerStaminaRemote:FireServer()
        -- Trigger the BlockEvent to simulate blocking behavior (if needed)
        local args = {
            [1] = "unblocking" -- Triggering block (could be a way to simulate unblocking if needed)
        }
        ReplicatedStorage.CombatRemotesRemotes.BlockEvent:FireServer(unpack(args))
        task.wait(0.05) -- Refresh every 0.05 seconds to keep stamina at 100
    end
end

-- Combat Toggles
CombatTab:CreateToggle({
    Name = "Auto Punch",
    CurrentValue = false,
    Callback = function(Value)
        AutoPunchEnabled = Value
        if Value then
            task.spawn(AutoPunch)
        end
    end
})

CombatTab:CreateSlider({
    Name = "Punch Delay",
    Range = {0.1, 1.0},
    Increment = 0.1,
    CurrentValue = 0.2,
    Callback = function(Value)
        PunchDelay = Value
    end
})

-- Misc Tab
MiscTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        WalkSpeed = Value
        SetWalkSpeed(Value)
    end
})

-- Faster Stam Toggle
MiscTab:CreateToggle({
    Name = "Faster Stam",
    CurrentValue = false,
    Callback = function(Value)
        FasterStamEnabled = Value
        if Value then
            task.spawn(FasterStam) -- Keeps stamina at 100 and triggers BlockEvent
        end
    end
})

-- Credits Tab
CreditTab:CreateLabel("Credit to Fearz for making the script!")

CreditTab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/rvXsdjcY")
    end
})

Rayfield:Notify({
    Title = "Script Loaded",
    Content = "ShadowZ Boxing Beta Script V1.0 loaded successfully!",
    Duration = 5,
    Image = 4483362458
})
