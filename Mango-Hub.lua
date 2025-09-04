--== Mango Hub — One File (All-in-One) =====================================--
-- GUI + AutoFarm + FastAttack + AutoHaki + SmartTopos + Fly + SafeInvoke  --
--=========================================================================--

-- Orion UI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Window    = OrionLib:MakeWindow({Name="Mango Hub", HidePremium=false, SaveConfig=true, ConfigFolder="Mango hub"})

--// Services
local Players      = game:GetService("Players")
local Rep          = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Workspace    = game:GetService("Workspace")

local Player  = Players.LocalPlayer
local Enemies = Workspace:FindFirstChild("Enemies") or Workspace:WaitForChild("Enemies")

--========================
-- Global flags / settings
--========================
getgenv().AutoFarmEnabled   = false
getgenv().AutoHakiEnabled   = false
getgenv().FastAttackEnabled = false
getgenv().SelectWeapon      = "Melee"

getgenv().InstantRange      = 300
getgenv().TweenRange        = 5000
getgenv().Speed             = 1000

getgenv().NotAutoEquip      = false

--========================
-- GUI
--========================
local Main    = Window:MakeTab({Name="Main",    Icon="", PremiumOnly=false})
local Setting = Window:MakeTab({Name="Setting", Icon="", PremiumOnly=false})

Main:AddDropdown({
    Name="Selected Weapon",
    Default="Melee",
    Options={"Melee","Sword","Gun","Fruit"},
    Callback=function(v) getgenv().SelectWeapon = v end
})

Main:AddToggle({
    Name="Auto Farm",
    Default=false,
    Callback=function(v)
        getgenv().AutoFarmEnabled = v
        print("[AutoFarm] ->", v)
        if v then task.spawn(AutoFarmLoop) end
    end
})

Main:AddToggle({
    Name="Auto Haki",
    Default=false,
    Callback=function(v)
        getgenv().AutoHakiEnabled = v
        print("[AutoHaki] ->", v)
    end
})

Main:AddToggle({
    Name="Fast Attack",
    Default=false,
    Callback=function(v)
        getgenv().FastAttackEnabled = v
        print("[FastAttack] ->", v)
        if v then task.spawn(FastAttackLoop) end
    end
})

Setting:AddSlider({
    Name="Instant Range",
    Min=50, Max=1000, Default=300, Increment=10,
    Callback=function(v) getgenv().InstantRange = v end
})

Setting:AddSlider({
    Name="Tween Range",
    Min=500, Max=10000, Default=5000, Increment=50,
    Callback=function(v) getgenv().TweenRange = v end
})

Setting:AddSlider({
    Name="Tween Speed (stud/s)",
    Min=200, Max=3000, Default=1000, Increment=50,
    Callback=function(v) getgenv().Speed = v end
})

Setting:AddButton({
    Name="Stop Tween",
    Callback=function() StopTween() end
})

Setting:AddButton({
    Name="Stop All (Farm/Fast/Fly/Tween)",
    Callback=function()
        getgenv().AutoFarmEnabled   = false
        getgenv().FastAttackEnabled = false
        StopTween(); StopFly()
        OrionLib:MakeNotification({Name="Mango Hub", Content="Đã dừng toàn bộ.", Time=2})
    end
})

--========================
-- Helpers / Safe wrappers
--========================
local function HRP()
    local c = Player.Character
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function Hum()
    local c = Player.Character
    return c and c:FindFirstChildOfClass("Humanoid")
end

local function SafeInvokeCommF(...)
    local args = {...}
    local ok, res = pcall(function()
        return Rep.Remotes.CommF_:InvokeServer(unpack(args))
    end)
    if not ok then warn("[CommF Invoke] error:", res) end
    return ok, res
end

--========================
-- World/Quest mapping
--========================
local Sea1, Sea2, Sea3 = false,false,false
if game.PlaceId == 2753915549 then Sea1 = true
elseif game.PlaceId == 4442272183 then Sea2 = true
elseif game.PlaceId == 7449423635 then Sea3 = true end

-- current quest target data
local Mon, NameQuest, LevelQuest, NameMon, CFrameQuest, CFrameMon

function CheckQuest()
    Mon, NameQuest, LevelQuest, NameMon, CFrameQuest, CFrameMon = nil,nil,nil,nil,nil,nil
    local ok, lvl = pcall(function() return Player.Data.Level.Value end)
    if not ok or not lvl then return false end
    local MyLevel = lvl

    if Sea1 then
        if MyLevel >= 1 and MyLevel <= 10 then
            Mon="Bandit"; LevelQuest=1; NameQuest="BanditQuest1"; NameMon="Bandit"
            CFrameQuest=CFrame.new(1059,15,1550); CFrameMon=CFrame.new(1046,27,1561)
        elseif MyLevel >= 10 and MyLevel <= 14 then
            Mon="Monkey"; LevelQuest=1; NameQuest="JungleQuest"; NameMon="Monkey"
            CFrameQuest=CFrame.new(-1598.089,35.55,153.378); CFrameMon=CFrame.new(-1448.518,67.853,11.466)
        elseif MyLevel >= 15 and MyLevel <= 29 then
            Mon="Gorilla"; LevelQuest=2; NameQuest="JungleQuest"; NameMon="Gorilla"
            CFrameQuest=CFrame.new(-1598.089,35.55,153.378); CFrameMon=CFrame.new(-1129.884,40.464,-525.424)
        elseif MyLevel >= 30 and MyLevel <= 39 then
            Mon="Pirate"; LevelQuest=1; NameQuest="BuggyQuest1"; NameMon="Pirate"
            CFrameQuest=CFrame.new(-1141.075,4.1,3831.55); CFrameMon=CFrame.new(-1103.513,13.752,3896.091)
        elseif MyLevel >= 40 and MyLevel <= 59 then
            Mon="Brute"; LevelQuest=2; NameQuest="BuggyQuest1"; NameMon="Brute"
            CFrameQuest=CFrame.new(-1141.075,4.1,3831.55); CFrameMon=CFrame.new(-1140.084,14.81,4322.921)
        elseif MyLevel >= 60 and MyLevel <= 74 then
            Mon="Desert Bandit"; LevelQuest=1; NameQuest="DesertQuest"; NameMon="Desert Bandit"
            CFrameQuest=CFrame.new(894.489,5.14,4392.434); CFrameMon=CFrame.new(924.8,6.449,4481.586)
        elseif MyLevel >= 75 and MyLevel <= 89 then
            Mon="Desert Officer"; LevelQuest=2; NameQuest="DesertQuest"; NameMon="Desert Officer"
            CFrameQuest=CFrame.new(894.489,5.14,4392.434); CFrameMon=CFrame.new(1608.282,8.614,4371.007)
        elseif MyLevel >= 90 and MyLevel <= 99 then
            Mon="Snow Bandit"; LevelQuest=1; NameQuest="SnowQuest"; NameMon="Snow Bandit"
            CFrameQuest=CFrame.new(1389.745,88.152,-1298.908); CFrameMon=CFrame.new(1354.348,87.273,-1393.947)
        elseif MyLevel >= 100 and MyLevel <= 119 then
            Mon="Snowman"; LevelQuest=2; NameQuest="SnowQuest"; NameMon="Snowman"
            CFrameQuest=CFrame.new(1389.745,88.152,-1298.908); CFrameMon=CFrame.new(1201.641,144.58,-1550.067)
        elseif MyLevel >= 120 and MyLevel <= 149 then
            Mon="Chief Petty Officer"; LevelQuest=1; NameQuest="MarineQuest2"; NameMon="Chief Petty Officer"
            CFrameQuest=CFrame.new(-5039.586,27.35,4324.68); CFrameMon=CFrame.new(-4881.231,22.652,4273.752)
        elseif MyLevel >= 150 and MyLevel <= 174 then
            Mon="Sky Bandit"; LevelQuest=1; NameQuest="SkyQuest"; NameMon="Sky Bandit"
            CFrameQuest=CFrame.new(-4839.53,716.369,-2619.442); CFrameMon=CFrame.new(-4953.207,295.744,-2899.229)
        elseif MyLevel >= 175 and MyLevel <= 189 then
            Mon="Dark Master"; LevelQuest=2; NameQuest="SkyQuest"; NameMon="Dark Master"
            CFrameQuest=CFrame.new(-4839.53,716.369,-2619.442); CFrameMon=CFrame.new(-5259.845,391.398,-2229.035)
        elseif MyLevel >= 190 and MyLevel <= 209 then
            Mon="Prisoner"; LevelQuest=1; NameQuest="PrisonerQuest"; NameMon="Prisoner"
            CFrameQuest=CFrame.new(5308.931,1.655,475.121); CFrameMon=CFrame.new(5098.974,-0.32,474.237)
        elseif MyLevel >= 210 and MyLevel <= 249 then
            Mon="Dangerous Prisoner"; LevelQuest=2; NameQuest="PrisonerQuest"; NameMon="Dangerous Prisoner"
            CFrameQuest=CFrame.new(5308.931,1.655,475.121); CFrameMon=CFrame.new(5654.563,15.633,866.299)
        end
    end

    return Mon ~= nil
end

--========================
-- Quest / UI helpers
--========================
local function GetQuestTitle()
    local gui  = Player:FindFirstChild("PlayerGui")
    local main = gui and gui:FindFirstChild("Main")
    local quest= main and main:FindFirstChild("Quest")
    local cont = quest and quest:FindFirstChild("Container")
    local titf = cont and cont:FindFirstChild("QuestTitle")
    local lab  = titf and titf:FindFirstChild("Title")
    if quest and quest.Visible and lab then return lab.Text end
    return nil
end

local function TakeQuest()
    if not CFrameQuest then return false end
    SmartTopos(CFrameQuest)
    local t0 = tick()
    repeat task.wait(0.15) until not HRP() or (HRP().Position - CFrameQuest.Position).Magnitude <= 20 or tick()-t0>6
    SafeInvokeCommF("StartQuest", NameQuest, LevelQuest)
    -- chờ UI lên xác nhận
    local t1 = tick()
    repeat
        task.wait(0.2)
        local title = GetQuestTitle()
        if title and (not NameMon or string.find(title, NameMon)) then
            return true
        end
    until tick()-t1>6
    return false
end

--========================
-- SmartTopos (Instant/Tween/Teleporter/Reset)
--========================
local currentTween

local function StopCurrentTween()
    if currentTween then pcall(function() currentTween:Cancel() end) ; currentTween = nil end
end

local function ResetCharacter()
    local h = Hum()
    if h then h.Health = 0 end
end

local function CheckNearestTeleporter(targetCFrame)
    local pos = targetCFrame.Position
    local world = game.PlaceId
    local Teleporters = {}

    if world == 2753915549 then
        Teleporters = {
            Vector3.new(-4652,873,-1754),   -- Sky Island 1
            Vector3.new(-7895,5547,-380),   -- Sky Island 2
            Vector3.new(61164,5,1820),      -- Under Water Island
            Vector3.new(3865,5,-1926),      -- Under Water Entrance
        }
    elseif world == 4442272183 then
        Teleporters = {
            Vector3.new(-317,331,597),      -- Flamingo Mansion
            Vector3.new(2283,15,867),       -- Flamingo Room
            Vector3.new(923,125,32853),     -- Cursed Ship
            Vector3.new(-6509,83,-133),     -- Zombie Island
        }
    elseif world == 7449423635 then
        Teleporters = {
            Vector3.new(-12471,374,-7551),  -- Mansion
            Vector3.new(5659,1013,-341),    -- Hydra
            Vector3.new(-5092,315,-3130),   -- Castle On The Sea
            Vector3.new(-12001,332,-8861),  -- Floating Turtle
            Vector3.new(5319,23,-93),       -- Beautiful Pirate
            Vector3.new(28286,14897,103),   -- Temple Of Time
        }
    end

    local closest, minDist = nil, math.huge
    for _,v in ipairs(Teleporters) do
        local d = (v - pos).Magnitude
        if d < minDist then minDist = d; closest = v end
    end

    if closest and HRP() then
        local direct = (HRP().Position - pos).Magnitude
        if minDist <= direct then return closest end
    end
end

local function requestEntrance(pos)
    SafeInvokeCommF("requestEntrance", pos)
    if HRP() then HRP().CFrame = HRP().CFrame + Vector3.new(0,50,0) end -- tránh kẹt
    task.wait(0.4)
end

function SmartTopos(targetCFrame)
    local hrp = HRP(); if not hrp or not targetCFrame then return "no_hrp" end
    local distance = (targetCFrame.Position - hrp.Position).Magnitude

    if distance <= (getgenv().InstantRange or 300) then
        hrp.CFrame = targetCFrame
        return "instant"
    end

    local tele = CheckNearestTeleporter(targetCFrame)
    if tele then requestEntrance(tele); return "teleporter" end

    if distance <= (getgenv().TweenRange or 5000) then
        StopCurrentTween()
        local info = TweenInfo.new(distance / (getgenv().Speed or 1000), Enum.EasingStyle.Linear)
        currentTween = TweenService:Create(hrp, info, {CFrame = targetCFrame})
        currentTween:Play()
        currentTween.Completed:Wait()
        currentTween = nil
        return "tween"
    end

    ResetCharacter()
    return "reset"
end

function StopTween()
    StopCurrentTween()
    local hrp = HRP()
    if hrp then
        local cf = hrp.CFrame
        hrp.Anchored = true
        task.wait(0.1)
        hrp.CFrame = cf
        hrp.Anchored = false
    end
end

--========================
-- Equip / AutoHaki
--========================
local lastEquip = 0
function EquipWeapon(toolName)
    local now = tick()
    if now - lastEquip < 0.4 then return end
    local char, bp = Player.Character, Player.Backpack
    if char and bp and toolName then
        local tool = char:FindFirstChild(toolName) or bp:FindFirstChild(toolName)
        local h = char:FindFirstChildOfClass("Humanoid")
        if tool and h and not getgenv().NotAutoEquip then
            h:EquipTool(tool)
        end
    end
    lastEquip = now
end

local function AutoHakiOnce()
    if not getgenv().AutoHakiEnabled then return end
    local c = Player.Character
    if c and not c:FindFirstChild("HasBuso") then
        SafeInvokeCommF("Buso")
    end
end

task.spawn(function()
    while true do
        task.wait(3)
        pcall(AutoHakiOnce)
    end
end)

--========================
-- Combat (FastAttack)
--========================
local function GetEnemiesInRange(character, range)
    local list = {}
    if not character then return list end
    local hrp = character:FindFirstChild("HumanoidRootPart"); if not hrp then return list end
    for _,mob in ipairs(Enemies:GetChildren()) do
        local mhrp = mob:FindFirstChild("HumanoidRootPart")
        local mhum = mob:FindFirstChildOfClass("Humanoid")
        if mhrp and mhum and mhum.Health > 0 then
            if (mhrp.Position - hrp.Position).Magnitude <= range then
                table.insert(list, mob)
            end
        end
    end
    return list
end

function AttackNoCoolDown()
    local char = Player.Character; if not char then return end
    local weapon
    for _,it in ipairs(char:GetChildren()) do
        if it:IsA("Tool") then weapon = it break end
    end
    if not weapon then return end

    local targets = GetEnemiesInRange(char, 120)
    if #targets == 0 then return end

    if weapon:FindFirstChild("LeftClickRemote") then
        local n = 1
        for _,mob in ipairs(targets) do
            local root = mob:FindFirstChild("HumanoidRootPart")
            if root then
                local dir = (root.Position - char:GetPivot().Position).Unit
                pcall(function() weapon.LeftClickRemote:FireServer(dir, n) end)
                n += 1
                task.wait(0.03)
            end
        end
    else
        local mainHead, hitTable
        hitTable = {}
        for _,mob in ipairs(targets) do
            if not mob:GetAttribute("IsBoat") then
                local head = mob:FindFirstChild("Head")
                if head then table.insert(hitTable, {mob, head}); mainHead = mainHead or head end
            end
        end
        if mainHead then
            local ok, Net = pcall(function() return Rep.Modules and Rep.Modules.Net end)
            if ok and Net and Net["RE/RegisterAttack"] and Net["RE/RegisterHit"] then
                pcall(function()
                    Net["RE/RegisterAttack"]:FireServer(0.1)
                    Net["RE/RegisterHit"]:FireServer(mainHead, hitTable)
                end)
            end
        end
    end
end

function FastAttackLoop()
    while getgenv().FastAttackEnabled do
        pcall(function()
            if getgenv().SelectWeapon then EquipWeapon(getgenv().SelectWeapon) end
            AttackNoCoolDown()
        end)
        task.wait(0.08)
    end
end

--========================
-- Fly support (anti-knock, đứng trên đầu mob)
--========================
local flying, bp, bg = false, nil, nil
function Fly()
    if flying or not HRP() then return end
    flying = true
    local hrp = HRP()
    bp = Instance.new("BodyPosition")
    bp.MaxForce = Vector3.new(1e6,1e6,1e6)
    bp.Position = hrp.Position
    bp.Parent = hrp

    bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(1e6,1e6,1e6)
    bg.CFrame = hrp.CFrame
    bg.Parent = hrp
end

function StopFly()
    flying = false
    if bp then bp:Destroy(); bp = nil end
    if bg then bg:Destroy(); bg = nil end
end

--========================
-- AutoFarm main
--========================
local function EnsureQuestReady()
    if not CheckQuest() then
        warn("[AutoFarm] No quest mapping for this level.")
        return false
    end
    local title = GetQuestTitle()
    if not title or (NameMon and not string.find(title, NameMon)) then
        SafeInvokeCommF("AbandonQuest")
        if not TakeQuest() then
            warn("[AutoFarm] TakeQuest failed.")
            return false
        end
    end
    return true
end

function AutoFarmLoop()
    while getgenv().AutoFarmEnabled do
        task.wait(0.05)

        -- refresh Enemies folder in case map reloads
        if not Enemies or not Enemies.Parent then
            Enemies = Workspace:FindFirstChild("Enemies") or Workspace:WaitForChild("Enemies", 5)
            if not Enemies then task.wait(1) goto continue end
        end

        if not EnsureQuestReady() then task.wait(0.6) goto continue end

        local foundTarget = false
        for _, mob in ipairs(Enemies:GetChildren()) do
            if not getgenv().AutoFarmEnabled then break end
            if mob and mob.Name == Mon then
                local mhum = mob:FindFirstChildOfClass("Humanoid")
                local mhrp = mob:FindFirstChild("HumanoidRootPart")
                if mhum and mhrp and mhum.Health > 0 then
                    foundTarget = true

                    -- TP tới trên đầu mob  (đứng lệch 20 stud)
                    SmartTopos(mhrp.CFrame * CFrame.new(0, 20, 5))

                    -- Fly neo vị trí + khóa mob
                    if not flying then Fly() end
                    pcall(function()
                        mhrp.CanCollide = false
                        mhrp.AssemblyLinearVelocity = Vector3.new(0,0,0)
                        if mhum then
                            mhum.WalkSpeed = 0
                            mhum.JumpPower = 0
                            mhum.AutoRotate = false
                        end
                        if bp then bp.Position = mhrp.Position + Vector3.new(0, 10, 0) end
                        if bg and HRP() then bg.CFrame = CFrame.new(HRP().Position, mhrp.Position) end
                    end)

                    -- AutoHaki & Attack
                    AutoHakiOnce()
                    if getgenv().SelectWeapon then EquipWeapon(getgenv().SelectWeapon) end
                    -- Nếu bạn muốn luôn đánh kể cả không bật FastAttack:
                    AttackNoCoolDown()

                    -- chờ mob chết hoặc quest đổi
                    repeat
                        task.wait(0.05)
                        local t = GetQuestTitle()
                        if not t or (NameMon and not string.find(t, NameMon)) then break end
                    until not getgenv().AutoFarmEnabled or not mhum or mhum.Health <= 0 or not mob.Parent
                end
            end
        end

        if not foundTarget then
            -- không tìm thấy mob -> tới khu mob spawn
            if CFrameMon then SmartTopos(CFrameMon) end
            task.wait(0.2)
        end

        ::continue::
    end
    StopFly(); StopTween()
end

--========================
-- Final
--========================
OrionLib:MakeNotification({Name="Mango Hub", Content="Loaded. Mở Dev Console (F9) để xem log.", Time=3})
print("[MangoHub] Loaded. Bật các toggle để chạy. Chúc bạn farm vui vẻ!")
