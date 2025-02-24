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
CombatTab:CreateLabel("Boxing Beta Script V1.5")

-- Variables for functionality
local AutoPunchEnabled = false
local PunchDelay = 0.2  -- Default Punch Delay
local WalkSpeed = 16
local PunchRange = 10 -- Define range for detecting nearby players
local AutoBlockEnabled = false
local FPSBoostEnabled = false
local IsDodging = false -- Track if player is dodging

-- Function to check for nearby players
local function GetNearestPlayer()
    local nearestPlayer = nil
    local shortestDistance = PunchRange

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myPosition = LocalPlayer.Character.HumanoidRootPart.Position

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = player.Character.HumanoidRootPart.Position
                local distance = (myPosition - targetPosition).Magnitude

                if distance <= shortestDistance then
                    shortestDistance = distance
                    nearestPlayer = player
                end
            end
        end
    end

    return nearestPlayer
end

-- Auto Punch Function
local function AutoPunch()
    while AutoPunchEnabled do
        local target = GetNearestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Humanoid") and target.Character.Humanoid.Health > 0 then
            local args = {
                [1] = target.Character,
                [3] = "back",
                [4] = true,
                [5] = "Left"
            }
            ReplicatedStorage:WaitForChild("CombatRemotesRemotes"):WaitForChild("Damage3Event"):FireServer(unpack(args))

            -- Keep stamina full when auto block is on
            if AutoBlockEnabled then
                ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("PlayerStaminaRemote"):FireServer(math.huge)
            end
        end
        task.wait(PunchDelay)
    end
end

-- Auto Block Function (Now allows dodging)
local function AutoBlock()
    while AutoBlockEnabled do
        if not IsDodging then -- Only block if not dodging
            local args = {"blockStart"}
            ReplicatedStorage:WaitForChild("CombatRemotesRemotes"):WaitForChild("BlockEvent"):FireServer(unpack(args))
        end
        task.wait(0.1)
    end
end

-- Detect when player dodges & temporarily disable auto block
LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Physics then
            IsDodging = true
            task.wait(0.5) -- Wait for dodge to finish
            IsDodging = false
        end
    end)
end)

-- FPS Boost Function
local function FPSBoost()
    if FPSBoostEnabled then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
        end
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

CombatTab:CreateToggle({
    Name = "Auto Block",
    CurrentValue = false,
    Callback = function(Value)
        AutoBlockEnabled = Value
        if Value then
            task.spawn(AutoBlock)
        end
    end
})

-- Punch Delay Slider in Combat Tab
CombatTab:CreateSlider({
    Name = "Punch Delay",
    Range = {0.1, 1},  -- Minimum and maximum delay range
    Increment = 0.1,
    CurrentValue = 0.2,  -- Default value
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
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

MiscTab:CreateToggle({
    Name = "FPS Boost",
    CurrentValue = false,
    Callback = function(Value)
        FPSBoostEnabled = Value
        if Value then
            task.spawn(FPSBoost)
        end
    end
})

-- Add Teleport Button in Misc Tab
MiscTab:CreateButton({
    Name = "Teleport to Ranked Area",
    Callback = function()
        -- Fire the remote to teleport to ranked area
        ReplicatedStorage.RemoteEvents.TeleportToRankedArea:FireServer()
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
    Content = "ShadowZ Boxing Beta Script V1.5 loaded successfully!",
    Duration = 5,
    Image = 4483362458
})
