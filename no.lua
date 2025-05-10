local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "God Of Destroyer (Neuron)",
   Icon = 0,
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})


local Tab = Window:CreateTab("Main", 4483362458)

local Section = Tab:CreateSection("Xp Farming")

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
   Name = "Prestige",
   Callback = function()
   game:GetService("ReplicatedStorage").Prestiging.Prestige:FireServer()
   end,
})

local Section = Tab:CreateSection("Boss Farm")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

_G.SelectedBoss = nil
_G.IsFarming = false

local function getStaticBossList()
	local list = {}
	for _, obj in pairs(Workspace.BossScrolls:GetChildren()) do
		if obj:IsA("Model") and string.lower(obj.Name):find("boss") then
			local cleanName = string.gsub(obj.Name, "[Bb][Oo][Ss][Ss]", "")
			table.insert(list, cleanName)
		end
	end
	return list
end

local BossDropdown = Tab:CreateDropdown({
	Name = "Select Boss to Farm",
	Options = getStaticBossList(),
	CurrentOption = {},
	MultipleOptions = false,
	Flag = "BossDropdown",
	Callback = function(Option)
		_G.SelectedBoss = Option[1]
	end,
})

Tab:CreateToggle({
	Name = "Toggle AutoFarm (Spin Around Boss)",
	toggleState = false,
	Callback = function(Value)
		_G.IsFarming = Value
		if Value and _G.SelectedBoss then
			task.spawn(function()
				while _G.IsFarming do
					task.wait(0.05)
					local targetBoss = nil
					-- Loop through all bosses in the "Bosses" folder
					for _, boss in pairs(Workspace.BossScrolls.Bosses:GetChildren()) do
						if boss:IsA("Model") and boss:FindFirstChild("HumanoidRootPart") then
							-- Check if the dropdown selected value is a substring of the boss's name
							if string.lower(boss.Name):find(string.lower(_G.SelectedBoss)) then
								targetBoss = boss
								break
							end
						end
					end
					-- If a matching boss is found, teleport and spin around it
					if targetBoss then
						local center = targetBoss.HumanoidRootPart.Position
						local angle = tick() * 4
						local offset = Vector3.new(math.cos(angle) * 5, 0, math.sin(angle) * 5)
						hrp.CFrame = CFrame.new(center + offset)
					end
				end
			end)
		end
	end,
})



local Tab2 = Window:CreateTab("Broken stuff", 4483362458)

local Section1 = Tab2:CreateSection("Points Giver")

local Slider = Tab2:CreateSlider({
   Name = "Slider Example",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Points",
   CurrentValue = 250,
   Flag = "Slider1",
   Callback = function(Value)
        _G.Points = Value
   end,
})

local Button = Tab2:CreateButton({
   Name = "Give Points",
   Callback = function()
    game:GetService("Players").LocalPlayer.Data.PointsS.Value = _G.Points
    game:GetService("Players").LocalPlayer.Data.Points.Value = _G.Points
    end,
})

local Section = Tab2:CreateSection("Equip Spec")

    local Dropdown = Tab2:CreateDropdown({
    Name = "Select Desired Spec To Equip",
    Options = {"ExecutionerBlade", "Gunbai", "Hiramekarei", "Katana", "Kiba Blade", "Kubowari", "Nuibari", "PaperBomb", "Samehada", "Shibuki"},
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "Dropdown2",
    Callback = function(options)
        _G.DesiredSpec = options
    end,
})


local Button = Tab2:CreateButton({
   Name = "Equip Spec",
   Callback = function()
    local EquipingSpec = tostring(unpack(_G.DesiredSpec))
    game:GetService("ReplicatedStorage").SkillRemotes.Weapons[EquipingSpec].RemoteEvent:FireServer()
   end,
})

local Section2 = Tab2:CreateSection("Holy Circle")

local Slider = Tab2:CreateSlider({
   Name = "Slider Example",
   Range = {1, 250},
   Increment = 1,
   Suffix = "Points",
   CurrentValue = 25,
   Flag = "Slider2",
   Callback = function(Value)
        _G.TimesOfCircle = Value
   end,
})

local Button2 = Tab2:CreateButton({
    Name = "Holy Circle",
    Callback = function()

    for i = 1, _G.TimesOfCircle do
            game:GetService("ReplicatedStorage").SkillRemotes.Jutsu.ClanJutsu.Oribe.ScorchBalls.RemoteEvent:FireServer()
        end
    end,
})

local Section3 = Tab2:CreateSection("All Moves")

local AllMoves = Tab2:CreateButton({
    Name = "Use All Moves ONCE",
    Callback = function()
        for i,v in pairs(game:GetService("ReplicatedStorage").SkillRemotes.Jutsu.ClanJutsu:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                v:FireServer()
            end
        end
    end,
})


local Tab3 = Window:CreateTab("Auto Spin", 4483362458)


_G.AutoSpin = false
_G.DesiredClans = {}


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


local toggle = Tab3:CreateToggle({
	Name = "Auto Spin",
	toggleState = false,
	Callback = function(Value)
		_G.AutoSpin = Value
		print("AutoSpin is now: " .. tostring(Value))
	end
})


local CurrentClan


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

local PlayerTab = Window:CreateTab("Player", 4483362458)


local toggle = PlayerTab:CreateToggle({
	Name = "InfiniteChakra",
	toggleState = false,
	Callback = function(Value)
		_G.InfiniteChakra = Value

        while _G.InfiniteChakra do task.wait(.3)
		    game:GetService("ReplicatedStorage").RemoteEvents.GainChi:FireServer()
        end
	end
})


local toggle = PlayerTab:CreateToggle({
	Name = "God Mode",
	toggleState = false,
	Callback = function(Value)
		_G.GodMode = Value

        while _G.GodMode do task.wait(.3)
		    game:GetService("Players").LocalPlayer.Character.Jutsu.Ninjutsu.SubstitutionJutsu.RemoteEvent:FireServer()
        end
	end
})




local ReplicatedStorage = game:GetService("ReplicatedStorage")
local enterCombat = ReplicatedStorage:WaitForChild("EnterCombat")
local leaveCombat = ReplicatedStorage:FindFirstChild("LeaveCombat")

_G.BlockEnterCombat = false


local mt = getrawmetatable(game)
setreadonly(mt, false)

local oldNamecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if method == "FireServer" and self == enterCombat then
        if _G.BlockEnterCombat then
            if leaveCombat then
                leaveCombat:FireServer()
            end
            return nil
        end
    end

    return oldNamecall(self, ...)
end)

setreadonly(mt, true)

local Toggle = PlayerTab:CreateToggle({
    Name = "Block EnterCombat",
    toggleState = true,
    Callback = function(Value)
        _G.BlockEnterCombat = Value
        print("🔁 EnterCombat block toggled:", Value)
    end
})



local plrAndSpawns = Window:CreateTab("Teleports and Spawns", 4483362458)

local Section1 = plrAndSpawns:CreateSection("Boss Teleports")

local Players = game:GetService("Players")
local BossFolder = workspace:WaitForChild("BossScrolls")

_G.SelectedBoss = nil


local BossNames = {}

for _, obj in pairs(BossFolder:GetChildren()) do
    if obj:IsA("Model") then
        table.insert(BossNames, obj.Name)
    end
end

local Dropdown = plrAndSpawns:CreateDropdown({
    Name = "Select Boss to Teleport",
    Options = BossNames,
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "Dropdown2",
    Callback = function(options)
        _G.SelectedBoss = tostring(unpack(options))
    end,
})


local Button = plrAndSpawns:CreateButton({
   Name = "Teleport to Selected Boss",
   Callback = function()
       if _G.SelectedBoss then
           local bossModel = BossFolder:FindFirstChild(_G.SelectedBoss)
           if bossModel and bossModel:IsA("Model") then
               local root = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
               if root then
                   root.CFrame = bossModel:GetPivot() + Vector3.new(0, 5, 0)
                end
            end
       end
   end,
})

local Section2 = plrAndSpawns:CreateSection("Boss Summons")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

_G.SelectedBoss = nil
_G.IsSummoning = false

local function getStaticBossList()
	local list = {}
	for _, obj in pairs(Workspace.BossScrolls:GetChildren()) do
		if obj:IsA("Model") and string.lower(obj.Name):find("boss") then
			local cleanName = string.gsub(obj.Name, "[Bb][Oo][Ss][Ss]", "")
			table.insert(list, cleanName)
		end
	end
	return list
end

local BossDropdown = plrAndSpawns:CreateDropdown({
	Name = "Select Boss to Summon",
	Options = getStaticBossList(),
	CurrentOption = {},
	MultipleOptions = false,
	Flag = "BossDropdown",
	Callback = function(Option)
		_G.SelectedBoss = Option[1]
	end,
})

plrAndSpawns:CreateToggle({
	Name = "Boss Summon In Loop",
	toggleState = false,
	Callback = function(Value)
		_G.IsSummoning = Value
		if Value and _G.SelectedBoss then
			task.spawn(function()
				while _G.IsSummoning do task.wait(1)
					local bossName = _G.SelectedBoss
					local remotePath = ReplicatedStorage.Missions.BossScrolls:FindFirstChild(bossName)
					if remotePath and remotePath:FindFirstChild("Summon") then
						remotePath.Summon:FireServer()
					end
				end
			end)
		end
	end,
})

plrAndSpawns:CreateButton({
	Name = "Summon Boss ONCE",
	Callback = function()
		if _G.SelectedBoss then
			local bossName = _G.SelectedBoss
			local remotePath = ReplicatedStorage.Missions.BossScrolls:FindFirstChild(bossName)
			if remotePath and remotePath:FindFirstChild("Summon") then
				remotePath.Summon:FireServer()
			end
		end
	end,
})

plrAndSpawns:CreateButton({
	Name = "Fight Merz Boss",
	Callback = function()
        game:GetService("ReplicatedStorage").MerzBoss.Fight:FireServer()
	end,
})
