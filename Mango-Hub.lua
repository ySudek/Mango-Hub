-- Mango Hub (fixed / unified)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Mango Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "Mango hub"})
local tween

--// Services
local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local Enemies = workspace:WaitForChild("Enemies")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer

--// Tabs (Main must exist)
local Main = Window:MakeTab({ Name = "Main", Icon = "", PremiumOnly = false })
local Farm = Main:AddSection({ Name = "Farm" })
local Setting = Window:MakeTab({ Name = "Setting", Icon = "", PremiumOnly = false })

-- =========================
-- Flags (use Enabled suffix to avoid name clash with functions)
-- =========================
getgenv().AutoFarmEnabled   = false
getgenv().AutoHakiEnabled   = false
getgenv().FastAttackEnabled = false
getgenv().SelectWeapon      = "Melee"
getgenv().InstantRange      = 300
getgenv().TweenRange        = 5000
getgenv().Speed             = 1000
getgenv().NotAutoEquip      = false
getgenv().StartMagnet       = false

--// Dropdown chọn weapon
Main:AddDropdown({
	Name = "Selected Weapon",
	Default = "Melee",
	Options = {"Melee", "Sword", "Gun", "Fruit"},
	Callback = function(Value)
		getgenv().SelectWeapon = Value
	end    
})

-- NOTE: replace old Main:AddToggle that used getgenv().AutoFarm (collision). Use Enabled flags below.

--// Toggles (use Enabled flags)
Main:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		getgenv().AutoFarmEnabled = Value
		if Value then
			task.spawn(function()
				if type(AutoFarmLoop) == "function" then AutoFarmLoop() end
			end)
		end
	end    
})

Main:AddToggle({
	Name = "Auto Haki",
	Default = false,
	Callback = function(Value)
		getgenv().AutoHakiEnabled = Value
	end
})

--// Settings sliders
Setting:AddSlider({
	Name = "Instant Range",
	Min = 50, Max = 1000, Default = 300,
	Color = Color3.fromRGB(255,100,100), Increment = 10, ValueName = "studs",
	Callback = function(Value) getgenv().InstantRange = Value end    
})

Setting:AddSlider({
	Name = "Tween Range",
	Min = 500, Max = 10000, Default = 5000,
	Color = Color3.fromRGB(100, 255, 100), Increment = 50, ValueName = "studs",
	Callback = function(Value) getgenv().TweenRange = Value end    
})

Setting:AddSlider({
	Name = "Tween Speed",
	Min = 200, Max = 3000, Default = 1000,
	Color = Color3.fromRGB(100, 100, 255), Increment = 50, ValueName = "studs/s",
	Callback = function(Value) getgenv().Speed = Value end    
})

--// World check
local Sea1, Sea2, Sea3
if game.PlaceId == 2753915549 then 
	Sea1 = true
elseif game.PlaceId == 4442272183 then 
	Sea2 = true
elseif game.PlaceId == 7449423635 then
	Sea3 = true
end

--// Quest (keeps your mapping)
function CheckQuest()
	local ok, level = pcall(function() return Player.Data.Level.Value end)
	if not ok or not level then return end
	local MyLevel = level
	if Sea1 then
		if MyLevel >= 1 and MyLevel <= 10 then
			Mon = "Bandit"
			LevelQuest = 1
			NameQuest = "BanditQuest1"
			NameMon = "Bandit"
			CFrameQuest = CFrame.new(1059, 15, 1550)
			CFrameMon = CFrame.new(1046, 27, 1561)
		  elseif MyLevel >= 10 and MyLevel <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel >= 15 and MyLevel <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif MyLevel >= 30 and MyLevel <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel >= 40 and MyLevel <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel >= 60 and MyLevel <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif MyLevel >= 75 and MyLevel <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif MyLevel >= 90 and MyLevel <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif MyLevel >= 100 and MyLevel <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif MyLevel >= 120 and MyLevel <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif MyLevel >= 150 and MyLevel <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif MyLevel >= 175 and MyLevel <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif MyLevel >= 190 and MyLevel <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif MyLevel >= 210 and MyLevel <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
		end
	end
end

--// Auto Haki (safe)
function AutoHaki()
	local char = Player.Character
	if not char then return end
	if not char:FindFirstChild("HasBuso") and getgenv().AutoHakiEnabled then
		pcall(function() Rep.Remotes.CommF_:InvokeServer("Buso") end)
	end
end
task.spawn(function()
	while task.wait(3) do
		if getgenv().AutoHakiEnabled then pcall(AutoHaki) end
	end
end)

--// HRP shortcut
local function HRP() 
	return Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") 
end

--// Equip / Unequip
local lastUnEquipTime, lastEquipTime = 0, 0
function UnEquipWeapon(Weapon)
	local now = tick()
	if now - lastUnEquipTime >= 1 then
		local char = Player.Character
		if char and char:FindFirstChild(Weapon) then
			getgenv().NotAutoEquip = true
			char[Weapon].Parent = Player.Backpack
			getgenv().NotAutoEquip = false
		end
		lastUnEquipTime = now
	end
end

function EquipWeapon(ToolSe)
	local now = tick()
	if now - lastEquipTime >= 0.5 then        
		if not getgenv().NotAutoEquip then
			local char = Player.Character
			local backpack = Player.Backpack
			if char and backpack then
				local tool = char:FindFirstChild(ToolSe) or backpack:FindFirstChild(ToolSe)
				if tool and char:FindFirstChildOfClass("Humanoid") then
					char.Humanoid:EquipTool(tool)
				end
			end
		end
		lastEquipTime = now
	end
end

--SmartTopos

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function HRP()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end

local function ResetCharacter()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid.Health = 0
	end
end

-- Teleporter Finder
local function CheckNearestTeleporter(targetCFrame)
    local pos = targetCFrame.Position
    local world = game.PlaceId
    local Teleporters = {}

    if world == 2753915549 then -- World1
        Teleporters = {
            ["Sky Island 1"] = Vector3.new(-4652, 873, -1754),
            ["Sky Island 2"] = Vector3.new(-7895, 5547, -380),
            ["Under Water Island"] = Vector3.new(61164, 5, 1820),
            ["Under Water Island Entrance"] = Vector3.new(3865, 5, -1926),
        }
    elseif world == 4442272183 then -- World2
        Teleporters = {
            ["Flamingo Mansion"] = Vector3.new(-317, 331, 597),
            ["Flamingo Room"] = Vector3.new(2283, 15, 867),
            ["Cursed Ship"] = Vector3.new(923, 125, 32853),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133),
        }
    elseif world == 7449423635 then -- World3
        Teleporters = {
            ["Mansion"] = Vector3.new(-12471, 374, -7551),
            ["Hydra"] = Vector3.new(5659, 1013, -341),
            ["Castle On The Sea"] = Vector3.new(-5092, 315, -3130),
            ["Floating Turtle"] = Vector3.new(-12001, 332, -8861),
            ["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
            ["Temple Of Time"] = Vector3.new(28286, 14897, 103),
        }
    end

    local closest, minDist = nil, math.huge
    for _, v in pairs(Teleporters) do
        local dist = (v - pos).Magnitude
        if dist < minDist then
            minDist = dist
            closest = v
        end
    end

    -- Chỉ dùng nếu teleporter gần hơn khoảng cách hiện tại
    if closest then
        local hrp = HRP()
        if hrp then
            local directDist = (hrp.Position - pos).Magnitude
            if minDist <= directDist then
                return closest
            end
        end
    end
end

-- Dùng teleporter
local function requestEntrance(pos)
    local args = {"requestEntrance", pos}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    local hrp = HRP()
    if hrp then
        hrp.CFrame = hrp.CFrame + Vector3.new(0, 50, 0) -- tránh kẹt
    end
    task.wait(0.5)
end

-- Main Function
function SmartTopos(targetCFrame)
    local hrp = HRP()
    if not hrp then return "NoHRP" end

    local distance = (targetCFrame.Position - hrp.Position).Magnitude

    -- Instant TP nếu gần
    if distance <= (getgenv().InstantRange or 300) then
        hrp.CFrame = targetCFrame
        return "Instant"
    end

    -- Check Teleporter nếu xa
    local teleporter = CheckNearestTeleporter(targetCFrame)
    if teleporter then
        requestEntrance(teleporter)
        return "Teleporter"
    end

    -- Tween nếu trong tầm
    if distance <= (getgenv().TweenRange or 5000) then
        local tween = TweenService:Create(hrp, TweenInfo.new(
            distance / (getgenv().Speed or 1000),
            Enum.EasingStyle.Linear
        ), {CFrame = targetCFrame})
        tween:Play()
        tween.Completed:Wait()
        return "Tween"
    end

    -- Nếu quá xa + không có teleporter
    ResetCharacter()
    return "Reset"
end

--Fly
local flying = false
local BodyGyro, BodyVelocity

function Fly(speed)
    if flying then return end -- tránh gọi nhiều lần gây lỗi
    flying = true

    local hrp = HRP()
    if not hrp then return end

    BodyGyro = Instance.new("BodyGyro")
    BodyGyro.P = 9e4
    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BodyGyro.CFrame = hrp.CFrame
    BodyGyro.Parent = hrp

    BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.Velocity = Vector3.new(0,0,0)
    BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    BodyVelocity.Parent = hrp

    task.spawn(function()
        while flying and task.wait() do
            if not hrp then break end
            BodyGyro.CFrame = workspace.CurrentCamera.CFrame
            BodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * (speed or 50)
        end
    end)
end

-- Tắt bay khi stop tween
function StopFly()
    flying = false
    if BodyGyro then BodyGyro:Destroy() BodyGyro = nil end
    if BodyVelocity then BodyVelocity:Destroy() BodyVelocity = nil end
end

-- Tích hợp vào StopTween
function StopTween()
	pcall(function()
		getgenv().StopTween = true
		if tween then tween:Cancel(); tween = nil end
		local hrp = HRP()
		if hrp then
			local cf = hrp.CFrame
			hrp.Anchored = true
			task.wait(0.1)
			hrp.CFrame = cf
			hrp.Anchored = false
		end
		StopFly() -- tắt fly khi dừng tween
		getgenv().StopTween, getgenv().Clip = false, false
	end)
end

-- Attack helper (safe)
local function GetEnemiesInRange(character, range)
	local enemies = {}
	local hrp = character and character:FindFirstChild("HumanoidRootPart")
	if not hrp then return enemies end
	for _, mob in ipairs(Enemies:GetChildren()) do
		local mobHRP = mob:FindFirstChild("HumanoidRootPart")
		local hum = mob:FindFirstChildOfClass("Humanoid")
		if mobHRP and hum and (mobHRP.Position - hrp.Position).Magnitude <= range then
			table.insert(enemies, mob)
		end
	end
	return enemies
end

function AttackNoCoolDown()
	pcall(function()
		local character = Player.Character
		if not character then return end
		local equippedWeapon
		for _, item in ipairs(character:GetChildren()) do
			if item:IsA("Tool") then equippedWeapon = item; break end
		end
		if not equippedWeapon then return end

		local enemiesInRange = GetEnemiesInRange(character, 120)
		if equippedWeapon:FindFirstChild("LeftClickRemote") then
			local attackCount = 1
			for _, enemy in ipairs(enemiesInRange) do
				local rootPart = enemy:FindFirstChild("HumanoidRootPart")
				if rootPart then
					local dir = (rootPart.Position - character:GetPivot().Position).Unit
					pcall(function() equippedWeapon.LeftClickRemote:FireServer(dir, attackCount) end)
					attackCount = attackCount + 1
					task.wait(0.03)
				end
			end
		else
			local targets, mainTarget = {}, nil
			for _, enemy in ipairs(enemiesInRange) do
				if not enemy:GetAttribute("IsBoat") then
					local head = enemy:FindFirstChild("Head")
					if head then table.insert(targets, {enemy, head}); mainTarget = head end
				end
			end
			if mainTarget then
				local ok, Net = pcall(function() return Rep.Modules and Rep.Modules.Net end)
				if ok and Net and Net["RE/RegisterAttack"] and Net["RE/RegisterHit"] then
					pcall(function()
						Net["RE/RegisterAttack"]:FireServer(0.1)
						Net["RE/RegisterHit"]:FireServer(mainTarget, targets)
					end)
				end
			end
		end
	end)
end

-- =========================
-- Loops: AutoFarmLoop and FastAttackLoop (use Enabled flags)
-- =========================
local FastAttackThread
local function FastAttackLoop()
	while getgenv().FastAttackEnabled do
		pcall(function()
			-- auto equip selected weapon
			if getgenv().SelectWeapon then EquipWeapon(getgenv().SelectWeapon) end
			if type(AttackNoCoolDown) == "function" then AttackNoCoolDown() end
		end)
		task.wait(0.08)
	end
	FastAttackThread = nil
end

-- Giả sử bạn đã có SmartTopos ở trên
local Rep = game.ReplicatedStorage
local Enemies = workspace.Enemies
local Player = game.Players.LocalPlayer

-- Hàm lấy quest hiện tại (bạn đã viết rất chuẩn)
local function GetQuestTitle()
    local gui = Player:FindFirstChild("PlayerGui")
    if not gui then return nil end
    local main = gui:FindFirstChild("Main")
    if not main then return nil end
    local quest = main:FindFirstChild("Quest")
    if not quest or not quest:FindFirstChild("Container") then return nil end
    local titleFrame = quest.Container:FindFirstChild("QuestTitle")
    if not titleFrame or not titleFrame:FindFirstChild("Title") then return nil end
    if quest.Visible then
        return titleFrame.Title.Text
    end
    return nil
end

-- Hàm nhận quest
local function TakeQuest()
    if not HRP() then return end
    SmartTopos(CFrameQuest) -- dùng SmartTopos thay vì SmartTP
    repeat task.wait() until (HRP().Position - CFrameQuest.Position).Magnitude <= 20
    pcall(function() Rep.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest) end)
end

-- AutoFarm Loop
function AutoFarmLoop()
    while getgenv().AutoFarmEnabled do
        task.wait(0.2)
        pcall(function()
            CheckQuest()
            local questTitle = GetQuestTitle()

            if not questTitle or not string.find(questTitle, NameMon or "") then
                pcall(function() Rep.Remotes.CommF_:InvokeServer("AbandonQuest") end)
                TakeQuest()
                task.wait(0.8)
            else
                for _, mob in ipairs(Enemies:GetChildren()) do
                    if mob and mob.Name == Mon then
                        local humanoid = mob:FindFirstChildOfClass("Humanoid")
                        local hrp = mob:FindFirstChild("HumanoidRootPart")

                        if humanoid and hrp and humanoid.Health > 0 then
                            -- Move tới mob (nhưng giữ trên đầu)
                            SmartTopos(hrp.CFrame * CFrame.new(0, 30, 0))

                            -- bật fly (nếu chưa có)
                            if not flying then Fly(60) end

                            repeat
                                task.wait(0.08)

                                -- luôn bay trên đầu mob
                                local myHRP = HRP()
                                if myHRP then
                                    myHRP.CFrame = hrp.CFrame * CFrame.new(0, 30, 0)
                                end

                                if getgenv().AutoHakiEnabled then AutoHaki() end
      EquipWeapon(getgenv().SelectWeapon)

                                if getgenv().FastAttackEnabled then
                                    if not FastAttackThread then
                                        FastAttackThread = task.spawn(FastAttackLoop)
                                    end
                                else
                                    AttackNoCoolDown()
                                end

                                -- mob đứng im
                                pcall(function()
                                    hrp.CanCollide = false
                                    if mob:FindFirstChild("Head") then
                                        mob.Head.CanCollide = false
                                    end
                                    humanoid.WalkSpeed = 0
                                    humanoid.JumpPower = 0
                                end)
                            until not getgenv().AutoFarmEnabled or humanoid.Health <= 0 or not mob.Parent
                            task.wait(0.2)
                        end
                    end
                end
            end
        end)
    end
    StopFly() -- khi thoát loop thì tắt bay
end

--// Button StopTween
Setting:AddButton({
	Name = "Stop Tween",
	Callback = function()
		StopTween()
		pcall(function()
			OrionLib:MakeNotification({
				Name = "Tween Stopped",
				Content = "Đã dừng Tween và reset vị trí.",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		end)
	end    
})


Main:AddToggle({
	Name = "Fast Attack",
	Default = false,
	Callback = function(Value)
		getgenv().FastAttackEnabled = Value
		if Value then
			if not FastAttackThread then FastAttackThread = task.spawn(FastAttackLoop) end
		end
	end
})
