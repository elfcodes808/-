local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Window = Rayfield:CreateWindow({
   Name = "ShadowZ",
   LoadingTitle = "Loading ShadowZ Operations: Siege Script",
   LoadingSubtitle = "by Fearz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ShadowZ_Config",
      FileName = "OperationsSiege_Config"
   },
   Discord = {
      Enabled = true,
      Invite = "V6cpWCYN",
      RememberJoins = true
   },
   KeySystem = false
})

-- Create Tabs
local CombatTab = Window:CreateTab("🔫 Combat", 4483362458)
local MiscTab = Window:CreateTab("📚 Misc", 4483362458)
local GunModsTab = Window:CreateTab("🔧 Gun Mods", 4483362458)

-- Add Label
CombatTab:CreateLabel("Operations: Siege Script V1.0")

-- Variables for functionality
local AimbotEnabled = false
local SilentAimEnabled = false
local LockToEnemies = false 
local TargetPart = "Head"
local AimbotRange = 50 
local NoRecoilEnabled = false

-- Helper Functions
local function IsEnemy(player)
    return player.Team ~= LocalPlayer.Team
end

local function GetClosestOpponent()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local isValidTarget = true

            if LockToEnemies then
                isValidTarget = IsEnemy(player)
            end

            if isValidTarget then
                local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance and distance <= AimbotRange then 
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end

local function AimbotLock(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild(TargetPart) then
        local camera = Workspace.CurrentCamera
        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPlayer.Character[TargetPart].Position)
    end
end

local function EnableNoRecoil()
    if NoRecoilEnabled then
        for _, v in pairs(ReplicatedStorage:GetDescendants()) do
            if v:IsA("RemoteEvent") and v.Name:lower():find("recoil") then
                v:Destroy()
            end
        end
    end
end

-- Combat Toggles
CombatTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Callback = function(Value)
        AimbotEnabled = Value
        RunService.RenderStepped:Connect(function()
            if AimbotEnabled then
                local ClosestPlayer = GetClosestOpponent()
                if ClosestPlayer then
                    AimbotLock(ClosestPlayer)
                end
            end
        end)
    end
})

CombatTab:CreateToggle({
    Name = "Lock to Enemies Only",
    CurrentValue = false,
    Callback = function(Value)
        LockToEnemies = Value
    end
})

CombatTab:CreateSlider({
    Name = "Aimbot Range",
    Range = {10, 500},
    Increment = 10,
    CurrentValue = 50,
    Callback = function(Value)
        AimbotRange = Value
    end
})

CombatTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Callback = function(Value)
        SilentAimEnabled = Value
    end
})

CombatTab:CreateDropdown({
    Name = "Target Part",
    Options = {"Head", "Torso", "LeftLeg", "RightLeg"},
    CurrentOption = "Head",
    Callback = function(Option)
        TargetPart = Option
    end
})

-- Gun Mods
GunModsTab:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Callback = function(Value)
        NoRecoilEnabled = Value
        EnableNoRecoil()
    end
})

-- Misc Toggles
MiscTab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/V6cpWCYN")
    end
})

Rayfield:Notify({
    Title = "Script Loaded",
    Content = "ShadowZ Operations: Siege Script V1.0 loaded successfully!",
    Duration = 5,
    Image = 4483362458 
})
