local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Rayfield Example Window",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Section Example")

local Toggle = Tab:CreateToggle({
   Name = "Xp Farm",
   CurrentValue = false,
   Flag = "XpFarm",
   Callback = function(Value)
    _G.AutoXp = Value

while _G.AutoXp do task.wait(.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(12896.3525, 722.539001, -6020.03662, -0.246943817, 5.89826712e-08, -0.969029784, -1.93245349e-08, 1, 6.57923493e-08, 0.969029784, 3.49730627e-08, -0.246943817)
    game:GetService("ReplicatedStorage").Missions.Stone.CRANK.CCompleted:FireServer()
end
   end,
})

local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
   game:GetService("ReplicatedStorage").Prestiging.Prestige:FireServer()
   end,
})


local Tab2 = Window:CreateTab("Broken stuff", 4483362458) -- Title, Image

local Slider = Tab2:CreateSlider({
   Name = "Slider Example",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Points",
   CurrentValue = 250,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        _G.Points = Value
   end,
})

local Button = Tab2:CreateButton({
   Name = "Give Points",
   Callback = function()
    game:GetService("Players").LocalPlayer.Data.PointsS.Value = _G.Points
    game:GetService("Players").LocalPlayer.Data.Points.Value = _G.Points
    end,lace
})


local Tab3 = Window:CreateTab("Auto Spin", 4483362458) -- Title, Image

-- Global state
_G.AutoSpin = false
_G.DesiredClans = {}

-- Dropdown to select desired clans
local Dropdown = Tab3:CreateDropdown({
    Name = "Select Desired Clans",
    Options = {
        "Aburame", "Akafura", "Akimichi", "Chinoike", "Hatake", "Hoshigaki", "Hozuki",
        "Iburi", "Inuzuka", "Kaguya", "Kamizuru", "Kazesuna", "Lee", "Miyajima", "Nara",
        "Oribe", "Rai", "Sarutobi", "Uzumaki", "Yotsuki", "Yuki", "Senju", "Uchiha",
        "Namikaze", "Karatachi", "Jashin", "Hyuga", "Mu"
    },
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "Dropdown1",
    Callback = function(options)
        _G.DesiredClans = options
    end,
})

-- Toggle to control AutoSpin
local toggle = Tab3:CreateToggle({
	Name = "Auto Spin",
	toggleState = false,
	Callback = function(Value)
		_G.AutoSpin = Value
		print("AutoSpin is now: " .. tostring(Value))
	end
})

-- Store current clan
local CurrentClan

-- Monitor the player's backpack to detect current clan
task.spawn(function()
    while true do
        task.wait(0.1)
        for _, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
            if v.Name == "Clan" then
                CurrentClan = v.Parent.Name
                break
            end
        end
    end
end)

-- AutoSpin loop
task.spawn(function()
    while true do
        task.wait(0.1)
        if _G.AutoSpin and CurrentClan and #_G.DesiredClans > 0 then
            if not table.find(_G.DesiredClans, CurrentClan) then
                game:GetService("ReplicatedStorage").TraitEvent:FireServer()
            end
        end
    end
end)

local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image


local toggle = Tab3:CreateToggle({
	Name = "InfiniteChakra",
	toggleState = false,
	Callback = function(Value)
		_G.InfiniteChakra = Value

    while _G.InfiniteChakra do
		game:GetService("ReplicatedStorage").RemoteEvents.GainChi:FireServer()
	end
})
game:GetService("ReplicatedStorage").RemoteEvents.GainChi:FireServer()


