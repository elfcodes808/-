local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local userInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Window = Rayfield:CreateWindow({
   Name = "ShadowZ",
   LoadingTitle = "Enjoy ShadowZ Hub!",
   LoadingSubtitle = "by ShadowZ",
   Theme = "Amethyst",
   KeySystem = false,
   KeySettings = {
      Title = "To use this script you must get a key first!",
      Subtitle = "Key System",
      Note = "https://loot-link.com/s?kMpKe39j",
      FileName = "Lootlink Key",
      SaveKey = true,
      Key = {"ooftechbestscript"}
   }
})

local PlayerTab = Window:CreateTab("Player", 4483362458)

-- HeadSize Slider moved to PlayerTab
local HeadSizeSlider = PlayerTab:CreateSlider({
   Name = "HeadSize",
   Range = {1, 50},
   Increment = 1,
   Suffix = "Size",
   CurrentValue = 10,
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Head") then
         local head = player.Character.Head
         head.Size = Vector3.new(Value, Value, Value)
         head:FindFirstChild("Mesh").Scale = Vector3.new(Value, Value, Value)
      end
   end,
})

-- MagsSlider and Enable Mags moved to PlayerTab
local MagsSlider = PlayerTab:CreateSlider({
   Name = "Mags",
   Range = {1, 30},
   Increment = 1,
   Suffix = "Range",
   CurrentValue = 10,
   Callback = function(Value)
      local player = game.Players.LocalPlayer
   end,
})

local MagsToggle = PlayerTab:CreateToggle({
   Name = "Enable Mags",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         -- Load the Football Fusion 2 mags script when toggle is enabled
         loadstring(game:HttpGet("https://rawscripts.net/raw/Football-Fusion-2-FF-mags-no-gui-26381"))()
      end
   end,
})

-- Misc Tab
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- WalkSpeed Slider moved to MiscTab
local WalkSpeedSlider = MiscTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {10, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

-- Jumppower Slider moved to MiscTab
local JumppowerSlider = MiscTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 70},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
      if humanoid then
         humanoid.JumpPower = Value
      end
   end,
})

-- Refresh all settings at 0.1 second intervals
RunService.Heartbeat:Connect(function()
   -- Update any values you need every 0.1 seconds here
   -- For example, updating sliders or other UI elements:
   local player = game.Players.LocalPlayer
   if player.Character then
      -- Example: Refreshing the WalkSpeed every 0.1 seconds
      if player.Character:FindFirstChild("Humanoid") then
         local humanoid = player.Character.Humanoid
         -- Any logic to keep refreshing properties can be added here
      end
   end
   wait(0.1) -- Refresh every 0.1 seconds
end)
