-- ✅ Kick Bypass (ShadowZ Protected)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function ProtectKick()
    local mt = getrawmetatable(game)
    if setreadonly then setreadonly(mt, false) end

    local oldNamecall = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if tostring(self) == "Kick" or method == "Kick" then
            warn("[ShadowZ Hub] Kick attempt blocked (__namecall).")
            return
        end
        return oldNamecall(self, ...)
    end)

    if hookfunction then
        local oldKick = LocalPlayer.Kick
        hookfunction(oldKick, function(...)
            warn("[ShadowZ Hub] Kick attempt blocked (hookfunction).")
        end)
    end

    pcall(function()
        LocalPlayer.Kick = function()
            warn("[ShadowZ Hub] Kick attempt blocked (direct override).")
        end
    end)

    if setreadonly then setreadonly(mt, true) end
end

ProtectKick()

-- UI Library Load
local uilibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiet1308/tvkhub/main/rac"))()
local windowz = uilibrary:CreateWindow("ShadowZ", "Baseball Universe", true)

-- Tabs and Sections
local BattingPage = windowz:CreatePage("Batting")
local BattingSection = BattingPage:CreateSection("Batting Features")
local FieldingPage = windowz:CreatePage("Fielding")
local FieldingSection = FieldingPage:CreateSection("Fielding Features")
local MiscPage = windowz:CreatePage("Misc")
local MiscSection = MiscPage:CreateSection("Misc Features")
local CreditsPage = windowz:CreatePage("Credits")
local CreditsSection = CreditsPage:CreateSection("Credits")

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local mouse = LocalPlayer:GetMouse()

-- Settings
local Settings = {
    AutoAim = false,
    ShowDot = false,
    AutoHitDelay = 0.25,
    FlyEnabled = false,
    ShowStrikezone = false
}

-- Ball ESP
local ballESP = Instance.new("Part")
ballESP.Shape = Enum.PartType.Ball
ballESP.Size = Vector3.new(0.7, 0.7, 0.7)
ballESP.Anchored = true
ballESP.CanCollide = false
ballESP.Material = Enum.Material.SmoothPlastic
ballESP.Color = Color3.fromRGB(0, 170, 255)
ballESP.Transparency = 0.25
ballESP.Position = Vector3.new(9999, 9999, 9999)
ballESP.Name = "BallESP"
ballESP.Parent = workspace

-- Strikezone ESP
local strikezoneESP = nil
local function createStrikezoneESP()
    if strikezoneESP then strikezoneESP:Destroy() end
    local sz = workspace:FindFirstChild("Repository")
    if sz then sz = sz:FindFirstChild("Strikezone") end
    if sz then sz = sz:FindFirstChild("Strikezone") end
    if sz and sz:IsA("BasePart") then
        strikezoneESP = Instance.new("SelectionBox")
        strikezoneESP.Name = "StrikezoneESP"
        strikezoneESP.Adornee = sz
        strikezoneESP.LineThickness = 0.05
        strikezoneESP.Color3 = Color3.fromRGB(0, 170, 255)
        strikezoneESP.SurfaceTransparency = 1
        strikezoneESP.Visible = false
        strikezoneESP.Parent = workspace
    end
end

createStrikezoneESP()

local function updateStrikezoneESPVisible(state)
    if strikezoneESP then strikezoneESP.Visible = state end
end

-- Batting UI
BattingSection:CreateToggle("Ball ESP", {Toggled = false, Description = "Show ball ESP"}, function(value)
    Settings.ShowDot = value
    if not value then
        ballESP.Position = Vector3.new(9999, 9999, 9999)
    end
end)

BattingSection:CreateToggle("Auto Aim", {Toggled = false, Description = "Automatically aim at ball"}, function(value)
    Settings.AutoAim = value
end)

BattingSection:CreateToggle("Auto Hit (Coming Soon)", {Toggled = false, Description = "Auto Hit is coming soon!"}, function(value)
    if value then
        windowz:Notify("Coming Soon", "Auto Hit feature is still in development!", 4)
    end
end)

BattingSection:CreateSlider("Auto Hit Delay", {Min = 0, Max = 1, Def = Settings.AutoHitDelay, Float = 0.01}, function(value)
    Settings.AutoHitDelay = value
end)

BattingSection:CreateToggle("Strikezone ESP", {Toggled = false, Description = "Outline of Strikezone"}, function(value)
    Settings.ShowStrikezone = value
    updateStrikezoneESPVisible(value)
end)

-- Fielding UI
FieldingSection:CreateToggle("Perfect Accuracy (Coming Soon)", {Toggled = false, Description = "Feature in development"}, function(value)
    if value then
        windowz:Notify("Coming Soon", "Perfect Accuracy feature is still being developed!", 4)
    end
end)

-- Misc UI
MiscSection:CreateSlider("WalkSpeed", {Min = 16, Max = 50, Def = 16}, function(value)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = value
    end
end)

MiscSection:CreateToggle("Fly", {Toggled = false, Description = "Fly around freely"}, function(value)
    Settings.FlyEnabled = value
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart

    if value then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        local bg = Instance.new("BodyGyro", hrp)
        bg.Name = "FlyGyro"
        bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)

        local conn
        conn = RunService.RenderStepped:Connect(function()
            if not Settings.FlyEnabled then
                if bv then bv:Destroy() end
                if bg then bg:Destroy() end
                conn:Disconnect()
                return
            end
            local dir = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0, 1, 0) end

            bv.Velocity = dir * 50
            bg.CFrame = camera.CFrame
        end)
    else
        if hrp:FindFirstChild("FlyVelocity") then hrp.FlyVelocity:Destroy() end
        if hrp:FindFirstChild("FlyGyro") then hrp.FlyGyro:Destroy() end
    end
end)

MiscSection:CreateButton("TP to Mound", function()
    local mound = workspace:FindFirstChild("Repository") and workspace.Repository:FindFirstChild("Infield") and workspace.Repository.Infield:FindFirstChild("Mound")
    if mound then
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = mound.CFrame + Vector3.new(0, 5, 0)
            windowz:Notify("Teleported", "You have been teleported to the mound.", 3)
        end
    end
end)

-- Credits
CreditsSection:CreateButton("Blaze - Owner and Lead Script Developer", function() end)

-- Prediction + ESP logic
local pitchEvent = ReplicatedStorage.Packages.Knit.Services.PitchingService.RE.Pitch
pitchEvent.OnClientEvent:Connect(function(...)
    for _, v in pairs({...}) do
        if typeof(v) == "table" and v[4] then
            local final = v[4]
            local predicted = final + Vector3.new(0, 0, -Settings.AutoHitDelay * 60)
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local inBat = hrp and (hrp.Position - final).Magnitude <= 10

            if Settings.ShowDot and inBat then
                ballESP.Position = Vector3.new(final.X - 0.33, final.Y + 0.47, 112.6)
            else
                ballESP.Position = Vector3.new(9999, 9999, 9999)
            end

            if Settings.AutoAim and inBat then
                local screen, onScreen = camera:WorldToViewportPoint(predicted)
                if onScreen then
                    local dx = screen.X - (camera.ViewportSize.X / 2)
                    local dy = screen.Y - (camera.ViewportSize.Y / 2)
                    mousemoverel(dx, dy)
                end
            end

            updateStrikezoneESPVisible(Settings.ShowStrikezone)
        end
    end
end)

print("ShadowZ Hub UI Loaded Successfully")
