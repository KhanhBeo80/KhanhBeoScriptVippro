-- Script By Khanh Beo
local lib, tbl

do
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/Blox-Fruits/refs/heads/main/core.luau"))()
    lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Banana/refs/heads/main/Banana/ui.luau"))()

    -- Force Red Theme + No Icons
    if getgenv().UIColor then
        getgenv().UIColor["Border Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Search Icon Highlight Color"] = Color3.fromRGB(255, 80, 80)
        getgenv().UIColor["Title Text Color"] = Color3.fromRGB(255, 60, 60)
        getgenv().UIColor["Page Selected Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Section Underline Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Toggle Border Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Button Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Dropdown Selected Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Dropdown Selected Check Color"] = Color3.fromRGB(255, 80, 80)
        getgenv().UIColor["Textbox Highlight Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Box Highlight Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Slider Line Color"] = Color3.fromRGB(220, 20, 60)
        getgenv().UIColor["Slider Highlight Color"] = Color3.fromRGB(255, 80, 80)
        getgenv().UIColor["Logo Image"] = ""
    end


    local v = lib:CreateWindow({
        Title = "Khanh Beo Hub",
        Subtitle = "Blox Fruit Script",
        
    })

    tbl = {
        Info = v:AddTab("Info And Status"),
        Main = v:AddTab("Farming"),
        Settings = v:AddTab("Setting"),
        Fish = v:AddTab("Fishing"),
        Quests = v:AddTab("Quest And Item"),
        SeaEvent = v:AddTab("Sea Event"),
        Race = v:AddTab("Mirage And Race"),
        Prehistoric = v:AddTab("Volcano Event"),
        Esp = v:AddTab("Stats And Esp"),
        Raids = v:AddTab("Fruit And Raid"),
        Combat = v:AddTab("Local Player"),
        Travel = v:AddTab("Teleport"),
        Shop = v:AddTab("Shopping"),
        Misc = v:AddTab("Miscellaneous"),
    }

    
    -- Only remove Logo / decorative images (keep functional buttons)
    task.spawn(function()
        task.wait(0.6)
        for _, gui in ipairs(game.CoreGui:GetChildren()) do
            if string.find(tostring(gui.Name), "Nousigi") then
                for _, obj in ipairs(gui:GetDescendants()) do
                    if obj:IsA("ImageLabel") then
                        local name = string.lower(obj.Name or "")
                        -- Only clear logo and pure decorative images
                        if name == "ruafimg" or name == "imghide" or name == "shadow" or name == "lineshadow" or name == "maingui" then
                            obj.Image = ""
                        end
                    end
                end
            end
        end
    end)

    lib.ToggleUI()
    local v2 = tbl.Info:AddLeftGroupbox("Game Time")
    local v3 = v2:AddLabel("")

    UpdateGameTime = function()
        local n = math.floor(workspace.DistributedGameTime + 0.5)
        local n2 = math.floor(n / 3600) % 24
        local n3 = math.floor(n / 60) % 60
        local n4 = math.floor(n / 1) % 60
        v3:SetText(n2 .. " Hour (h) " .. n3 .. " Minute (m) " .. n4 .. " Second (s)")
    end

    spawn(function()
        while true do
            UpdateGameTime()
            wait(1)
        end
    end)

    local v4 = tbl.Info:AddLeftGroupbox("Mirage Island"):AddLabel("Status: ")
    local str = ""

    spawn(function()
        pcall(function()
            while true do
                wait(1)
                local flag = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") ~= nil
                local status = flag and "✅" or "❌"

                if status ~= str then
                    v4:SetText("Status: " .. status)
                    str = status
                end
            end
        end)
    end)

    local v5 = tbl.Info:AddLeftGroupbox("Kitsune Island"):AddLabel("Status: ")
    local str2 = ""

    spawn(function()
        while task.wait(1) do
            local kitsuneIsland = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
            local status = kitsuneIsland and "✅" or "❌"

            if status ~= str2 then
                v5:SetText("Status: " .. status)
                str2 = status
            end
        end
    end)

    local v6 = tbl.Info:AddLeftGroupbox("Prehistoric Island"):AddLabel("Status: ")
    local str3 = ""

    task.spawn(function()
        while task.wait(1) do
            local prehistoricIsland = game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")
            local status = prehistoricIsland and "✅" or "❌"

            if status ~= str3 then
                v6:SetText("Status: " .. status)
                str3 = status
            end
        end
    end)

    local v7 = tbl.Info:AddLeftGroupbox("Frozen Dimension"):AddLabel("Status: ")
    local str4 = ""

    spawn(function()
        while wait(1) do
            local frozenDimension = game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")
            local status = frozenDimension and "✅" or "❌"

            if status ~= str4 then
                v7:SetText("Status: " .. status)
                str4 = status
            end
        end
    end)

    local v8 = tbl.Info:AddLeftGroupbox("Rip Indra"):AddLabel("Status: ")
    local str5 = ""

    spawn(function()
        while wait(1) do
            local ripIndraTrueForm = game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form")
            local status = (ripIndraTrueForm or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")) and "✅" or "❌"

            if status ~= str5 then
                v8:SetText("Status: " .. status)
                str5 = status
            end
        end
    end)

    local v9 = tbl.Info:AddLeftGroupbox("Dough King"):AddLabel("Status: ")
    local str6 = ""

    spawn(function()
        while wait(1) do
            local doughKing = game:GetService("ReplicatedStorage"):FindFirstChild("Dough King")
            local status = (doughKing or game:GetService("Workspace").Enemies:FindFirstChild("Dough King")) and "✅" or "❌"

            if status ~= str6 then
                v9:SetText("Status: " .. status)
                str6 = status
            end
        end
    end)

    local v10 = tbl.Info:AddLeftGroupbox("Full Moon"):AddLabel("")

    task.spawn(function()
        while task.wait(1) do
            local sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
            local sky2 = sky or game:GetService("Lighting"):FindFirstChild("Sky")
            local moonTextureId = sky2 and sky2.MoonTextureId or ""
            local str7 = "Moon: 0/5"

            if moonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
                str7 = "Moon: 5/5 (Full Moon) ✅"
            elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
                str7 = "Moon: 4/5"
            elseif moonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
                str7 = "Moon: 3/5"
            elseif moonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
                str7 = "Moon: 2/5"
            elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
                str7 = "Moon: 1/5"
            end

            v10:SetText(str7)
        end
    end)

    local v11 = tbl.Info:AddLeftGroupbox("Legendary Sword"):AddLabel("Status: ")

    spawn(function()
        while wait(5) do
            pcall(function()
                local tbl2 = {}

                for i, v12 in ipairs({"Shizu", "Saishi", "Oroshi"}) do
                    if GetWP(v12) then
                        table.insert(tbl2, v12 .. " ✅")
                    end
                end

                local setText = v11.SetText
                local str7 = #tbl2 > 0 and table.concat(tbl2, ", ") or "Not Found"
                setText(v11, str7)
            end)
        end
    end)

    local v12 = tbl.Info:AddLeftGroupbox("Cake Prince Status"):AddLabel("")

    spawn(function()
        while wait(1) do
            local ok, result = pcall(function()
                return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            end)

            local str7 = "Cake Prince: ✅"

            if ok and type(result) == "string" and string.len(result) >= 86 then
                str7 = "Killed: " .. string.sub(result, 39, 41)
            end

            v12:SetText(str7)
        end
    end)

    local v13 = tbl.Info:AddLeftGroupbox("Bone"):AddLabel("")

    spawn(function()
        while wait(1) do
            pcall(function()
                local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
                v13:SetText("You Have: " .. tostring(response) .. " Bones")
            end)
        end
    end)

    local rfSubmarineWorkerSpeak = replicated.Modules.Net["RF/SubmarineWorkerSpeak"]
    local v14 = tbl.Main:AddLeftGroupbox("Select Weapon")
    GRP_Main_Select_Weapon = v14

    local Select_Weapon = GRP_Main_Select_Weapon:AddDropdown("Select_Weapon", {
        Text = "Select Weapon",
        Values = {"Melee", "Sword", "Blox Fruit", "Gun"},
        Default = "Melee",
        Callback = function(chooseWP)
            _G.ChooseWP = chooseWP
        end,
    })

    WeaponDropdown = Select_Weapon
    local Farming = tbl.Main:AddLeftGroupbox("Farming")
    GRP_Main_Farming = Farming

    local Auto_Farm_Level = GRP_Main_Farming:AddToggle("Auto_Farm_Level", {
        Text = "Auto Farm Level",
        Default = false,
        Callback = function(level)
            _G.Level = level
        end,
    })

    FarmLevel = Auto_Farm_Level

    local Auto_Farm_Nearest = GRP_Main_Farming:AddToggle("Auto_Farm_Nearest", {
        Text = "Auto Farm Nearest",
        Default = false,
        Callback = function(autoFarmNear)
            _G.AutoFarmNear = autoFarmNear
        end,
    })

    ClosetMons = Auto_Farm_Nearest

    local Auto_Factory_Raid = GRP_Main_Farming:AddToggle("Auto_Factory_Raid", {
        Text = "Auto Factory Raid",
        Default = false,
        Callback = function(autoFactory)
            _G.AutoFactory = autoFactory
        end,
    })

    FactoryRaids = Auto_Factory_Raid

    local Auto_Pirate_Raid = GRP_Main_Farming:AddToggle("Auto_Pirate_Raid", {
        Text = "Auto Pirate Raid",
        Default = false,
        Callback = function(autoRaidCastle)
            _G.AutoRaidCastle = autoRaidCastle
        end,
    })

    CastleRaids = Auto_Pirate_Raid

    local Auto_Farm_Ectoplasm = GRP_Main_Farming:AddToggle("Auto_Farm_Ectoplasm", {
        Text = "Auto Farm Ectoplasm",
        Default = false,
        Callback = function(autoEctoplasm)
            _G.AutoEctoplasm = autoEctoplasm
        end,
    })

    Ecto = Auto_Farm_Ectoplasm
    local Chest = tbl.Main:AddLeftGroupbox("Chest")
    GRP_Main_Chest = Chest

    local Auto_Farm_Chest = GRP_Main_Chest:AddToggle("Auto_Farm_Chest", {
        Text = "Auto Farm Chest",
        Default = false,
        Callback = function(autoFarmChest)
            _G.AutoFarmChest = autoFarmChest
        end,
    })

    ChestTW = Auto_Farm_Chest

    local Auto_Chest_Bypass = GRP_Main_Chest:AddToggle("Auto_Chest_Bypass", {
        Text = "Auto Chest Bypass",
        Default = false,
        Callback = function(autoChestBP)
            _G.AutoChestBP = autoChestBP

            if autoChestBP then
                local localPlayer = game:GetService("Players").LocalPlayer
                local flag = false
                local tbl2 = {}
                local flag2 = true

                local function fn()
                    if not localPlayer.Character then
                        localPlayer.CharacterAdded:Wait()
                    end

                    localPlayer.Character:WaitForChild("HumanoidRootPart")
                    return localPlayer.Character
                end

                local function fn2()
                    if flag2 then
                        flag2 = false

                        for k, descendant in pairs(game:GetDescendants()) do
                            if descendant.Name:find("Chest") and descendant.ClassName == "Part" then
                                table.insert(tbl2, descendant)
                            end
                        end
                    end

                    local tbl3 = {}

                    for k, v15 in pairs(tbl2) do
                        if v15:FindFirstChild("TouchInterest") then
                            table.insert(tbl3, v15)
                        end
                    end

                    local lowerTorso = fn().LowerTorso

                    table.sort(tbl3, function(arg, arg2)
                        local flag3 = (lowerTorso.Position - arg.Position).Magnitude < (lowerTorso.Position - arg2.Position).Magnitude
                        return flag3
                    end)

                    return tbl3
                end

                local function fn3()
                    if flag then
                        return
                    end
                    flag = true

                    task.spawn(function()
                        while _G.AutoChestBP and localPlayer.Character and localPlayer.Character.Parent do
                            local v15 = fn2()

                            if #v15 > 0 then
                                fn().HumanoidRootPart.CFrame = v15[1].CFrame
                            end

                            task.wait(0.1)
                        end

                        flag = false
                    end)
                end

                localPlayer.CharacterAdded:Connect(function()
                    fn()
                    task.wait(0.5)

                    if _G.AutoChestBP then
                        fn3()
                    end
                end)

                fn3()
            end
        end,
    })

    ChestBP = Auto_Chest_Bypass

    local Stop_Items = GRP_Main_Chest:AddToggle("Stop_Items", {
        Text = "Stop Farm for FOD & Chalice",
        Default = true,
        Callback = function(stopWhenChalice)
            _G.StopWhenChalice = stopWhenChalice
        end,
    })

    StopI = Stop_Items
    local Berry_ = tbl.Main:AddLeftGroupbox("Berry")
    GRP_Main_Collect_Berry = Berry_

    local Auto_Farm_Berry = GRP_Main_Collect_Berry:AddToggle("Auto_Farm_Berry", {
        Text = "Auto Farm Berry",
        Default = false,
        Callback = function(autoBerry)
            _G.AutoBerry = autoBerry
        end,
    })

    Berry = Auto_Farm_Berry

    local v15 = GRP_Main_Collect_Berry:AddToggle("Auto_Farm_Berry_+_Hop", {
        Text = "Auto Farm Berry + Hop",
        Default = false,
        Callback = function(autoBerryH)
            _G.AutoBerryH = autoBerryH
        end,
    })

    BerryH = v15
    local v16 = tbl.Main:AddLeftGroupbox("Farm Mob")
    GRP_Main_Farm_Mob = v16

    local v17 = (function()
        if Core and Core.GetMobs then
            return Core.GetMobs()
        end

        if getgenv().GetMobs then
            return getgenv().GetMobs()
        end
        local tbl2 = {}
        local islandData = getgenv().IslandData
        local island = islandData or IslandData

        if not island then
            local v17 = Core
            island = v17 and Core.Island
        end

        if not island then
            local v17 = World1
            local v18 = v17

            if v17 then
                local sea1Islands = getgenv().Sea1_Islands
                v18 = sea1Islands or Sea1_Islands
            end

            if not v18 then
                local v19 = World2
                v18 = v19

                if v19 then
                    local sea2Islands = getgenv().Sea2_Islands
                    v18 = sea2Islands or Sea2_Islands
                end
            end

            if not v18 then
                local v19 = World3
                v18 = v19

                if v19 then
                    local sea3Islands = getgenv().Sea3_Islands
                    v18 = sea3Islands or Sea3_Islands
                end
            end

            island = v18
        end

        if island then
            local v17, v18, v19 = pairs(island)
            local v20 = v19
            local v21 = v17
            local v22 = v18

            while true do
                local v23, v24 = v21(v22, v20)
                if v23 == nil then
                    break
                end
                v20 = v23

                if v24.Mobs then
                    for i, mob in ipairs(v24.Mobs) do
                        if not table.find(tbl2, mob) then
                            table.insert(tbl2, mob)
                        end
                    end

                    v20 = v23
                end
            end

            table.sort(tbl2)
        end

        return tbl2
    end)()

    local tbl2 = v17

    if #v17 == 0 then
        tbl2 = {"Bandit"}
    end

    GRP_Main_Farm_Mob:AddDropdown("Select_Mob", {
        Text = "Select Mob",
        Values = tbl2,
        Default = 1,
        Callback = function(selectMob)
            getgenv().SelectMob = selectMob
        end,
    })

    GRP_Main_Farm_Mob:AddToggle("Auto_Kill_Mob", {
        Text = "Auto Farm Mob",
        Default = false,
        Callback = function(autoKillMob)
            _G.AutoKillMob = autoKillMob
        end,
    })

    local v18 = tbl.Main:AddLeftGroupbox("Farm Island")
    GRP_Main_Farm_All_Island = v18

    local v19 = (function()
        local tbl3 = {}
        local islandData = getgenv().IslandData
        local island = islandData or IslandData

        if not island then
            local v19 = Core
            island = v19 and Core.Island
        end

        if not island then
            local v19 = World1
            local v20 = v19

            if v19 then
                local sea1Islands = getgenv().Sea1_Islands
                v20 = sea1Islands or Sea1_Islands
            end

            if not v20 then
                local v21 = World2
                v20 = v21

                if v21 then
                    local sea2Islands = getgenv().Sea2_Islands
                    v20 = sea2Islands or Sea2_Islands
                end
            end

            if not v20 then
                local v21 = World3
                v20 = v21

                if v21 then
                    local sea3Islands = getgenv().Sea3_Islands
                    v20 = sea3Islands or Sea3_Islands
                end
            end

            island = v20
        end

        if island then
            for k in pairs(island) do
                table.insert(tbl3, k)
            end

            table.sort(tbl3)
        end

        return tbl3
    end)()

    local tbl3 = v19

    if #v19 == 0 then
        tbl3 = {"Pirates"}
    end

    GRP_Main_Farm_All_Island:AddDropdown("Select_Island", {
        Text = "Select Island",
        Values = tbl3,
        Default = 1,
        Callback = function(selectIsland)
            _G.SelectIsland = selectIsland
        end,
    })

    GRP_Main_Farm_All_Island:AddToggle("Auto_Farm_All_Island", {
        Text = "Auto Farm Island",
        Default = false,
        Callback = function(autoFarmIsland)
            _G.AutoFarmIsland = autoFarmIsland
        end,
    })

    local v20 = tbl.Main:AddLeftGroupbox("Elite Hunter")
    GRP_Main_Farm_Elite_Hunter = v20
    local v21 = GRP_Main_Farm_Elite_Hunter:AddLabel("Elite Spawn: Status: ")

    spawn(function()
        local str7 = ""

        while wait(1) do
            local diablo = game:GetService("ReplicatedStorage"):FindFirstChild("Diablo")
            local str8 = (diablo or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) and "✅" or "❌"

            local ok, result = pcall(function()
                return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
            end)

            local n = result

            if not ok or not result then
                n = 0
            end

            if str8 ~= str7 then
                v21:SetText("Elite Spawn: Status: " .. str8 .. " (" .. n .. ")")
                str7 = str8
            end
        end
    end)

    local Auto_Farm_Elite = GRP_Main_Farm_Elite_Hunter:AddToggle("Auto_Farm_Elite", {
        Text = "Auto Farm Elite Hunter",
        Default = false,
        Callback = function(farmEliteHunt)
            _G.FarmEliteHunt = farmEliteHunt
        end,
    })

    EliteQ = Auto_Farm_Elite

    local v22 = GRP_Main_Farm_Elite_Hunter:AddToggle("Auto_Farm_Elite_+_Hop", {
        Text = "Auto Farm Elite Hunter + Hop",
        Default = false,
        Callback = function(farmEliteHuntH)
            _G.FarmEliteHuntH = farmEliteHuntH
        end,
    })

    EliteH = v22
    local v23 = tbl.Main:AddLeftGroupbox("Rip Indra")
    GRP_Main_Farm_Rip_Indra = v23

    GRP_Main_Farm_Rip_Indra:AddToggle("Auto_Attack_Rip_Indra", {
        Text = "Auto Farm Rip Indra",
        Default = false,
        Callback = function(attackRipIndra)
            _G.AttackRipIndra = attackRipIndra
        end,
    })

    GRP_Main_Farm_Rip_Indra:AddToggle("Auto_Unlocked_Haki", {
        Text = "Auto Unlocked Haki",
        Default = false,
        Callback = function(autoUnHaki)
            _G.AutoUnHaki = autoUnHaki
        end,
    })

    local v24 = tbl.Main:AddLeftGroupbox("Cake Prince")
    GRP_Main_Farming_Cake = v24
    local v25 = GRP_Main_Farming_Cake:AddLabel("")

    spawn(function()
        while wait(0.2) do
            pcall(function()
                local v26 = string.match(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"), "%d+")

                if v26 then
                    local setText = v25.SetText
                    local n = 500 - tonumber(v26)
                    local killed = n or 0
                    setText(v25, "Killed : " .. killed)
                end
            end)
        end
    end)

    local Auto_Farm_Cake_Prince = GRP_Main_Farming_Cake:AddToggle("Auto_Farm_Cake_Prince", {
        Text = "Auto Farm Cake Prince",
        Default = false,
        Callback = function(autoCakePrince)
            _G.Auto_Cake_Prince = autoCakePrince
        end,
    })

    Cake = Auto_Farm_Cake_Prince

    local Accept_Quests = GRP_Main_Farming_Cake:AddToggle("Accept_Quests", {
        Text = "Accept Quests",
        Default = false,
        Callback = function(acceptQuestBoss)
            _G.AcceptQuestBoss = acceptQuestBoss
        end,
    })

    CakeQ = Accept_Quests

    local Auto_Summon_Cake_Prince = GRP_Main_Farming_Cake:AddToggle("Auto_Summon_Cake_Prince", {
        Text = "Auto Summon Cake Prince",
        Default = false,
        Callback = function(autoSpawnCP)
            _G.AutoSpawnCP = autoSpawnCP
        end,
    })

    CakeSM = Auto_Summon_Cake_Prince

    GRP_Main_Farming_Cake:AddToggle("Auto_Farm_Dough_King", {
        Text = "Auto Farm Dough King",
        Default = false,
        Callback = function(autoAttackDoughKing)
            _G.AutoAttackDoughKing = autoAttackDoughKing
        end,
    })

    GRP_Main_Farming_Cake:AddToggle("Auto_Dough_King_[Fully]", {
        Text = "Auto Farm Dough King Fully",
        Default = false,
        Callback = function(autoDoughKing)
            _G.AutoDoughKing = autoDoughKing
        end,
    })

    GRP_Main_Farming_Cake:AddToggle("Auto_Farm_Dough_King_+_Hop", {
        Text = "Auto Farm Dough King + Hop",
        Default = false,
        Callback = function(autoHopDough)
            _G.AutoHop_Dough = autoHopDough
        end,
    })

    local Bone = tbl.Main:AddLeftGroupbox("Bone")
    GRP_Main_Farming_Bone = Bone
    local v26 = GRP_Main_Farming_Bone:AddLabel("")

    spawn(function()
        while wait(1) do
            local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
            local n = response or 0
            v26:SetText("You Have: " .. tostring(n) .. " Bones")
            v13:SetText("You Have: " .. tostring(n) .. " Bones")
        end
    end)

    GRP_Main_Farming_Bone:AddToggle("Auto_Farm_Bone", {
        Text = "Auto Farm Bone",
        Default = false,
        Callback = function(autoFarmBone)
            _G.AutoFarm_Bone = autoFarmBone
        end,
    })

    local Accept_Quests2 = GRP_Main_Farming_Bone:AddToggle("Accept_Quests", {
        Text = "Accept Quests",
        Default = false,
        Callback = function(autoQuestBone)
            _G.Auto_Quest_Bone = autoQuestBone
        end,
    })

    BoneQ = Accept_Quests2

    local Auto_Random_Bones = GRP_Main_Farming_Bone:AddToggle("Auto_Random_Bones", {
        Text = "Auto Random Bones",
        Default = false,
        Callback = function(randomBone)
            _G.RandomBone = randomBone
        end,
    })

    RanBone = Auto_Random_Bones

    GRP_Main_Farming_Bone:AddToggle("Auto_Soul_Reaper", {
        Text = "Auto Soul Reaper",
        Default = false,
        Callback = function(soulReaper)
            _G.SoulReaper = soulReaper
        end,
    })

    local Auto_Try_Luck_Gravestone = GRP_Main_Farming_Bone:AddToggle("Auto_Try_Luck_Gravestone", {
        Text = "Auto Try Luck Gravestone",
        Default = false,
        Callback = function(luckBone)
            _G.LuckBone = luckBone
        end,
    })

    Lucky = Auto_Try_Luck_Gravestone

    local Auto_Pray_Gravestone = GRP_Main_Farming_Bone:AddToggle("Auto_Pray_Gravestone", {
        Text = "Auto Pray Gravestone",
        Default = false,
        Callback = function(autoPrayBone)
            _G.AutoPrayBone = autoPrayBone
        end,
    })

    Pray = Auto_Pray_Gravestone
    local v27 = tbl.Main:AddLeftGroupbox("Tyrant of the Skies")
    GRP_Main_Tyrant_of_the_Skies = v27
    local v28 = GRP_Main_Tyrant_of_the_Skies:AddLabel("Status : ")
    local str7 = ""

    spawn(function()
        while wait(1) do
            local tyrantOfTheSkies = game:GetService("ReplicatedStorage"):FindFirstChild("Tyrant of the Skies")
            local status = (tyrantOfTheSkies or game:GetService("Workspace").Enemies:FindFirstChild("Tyrant of the Skies")) and "✅" or "❌"

            if status ~= str7 then
                v28:SetText("Status : " .. status)
                str7 = status
            end
        end
    end)

    local v29 = GRP_Main_Tyrant_of_the_Skies:AddLabel("Destroyed Cannons : 0/3")

    spawn(function()
        while wait(1) do
            pcall(function()
                local n = 0

                if Brazier1 then
                    n = 1
                end

                if Brazier2 then
                    n = n + 1
                end

                if Brazier3 then
                    n = n + 1
                end

                v29:SetText("Destroyed Cannons : " .. n .. "/3")
            end)
        end
    end)

    local Auto_Farm_Boss_TOTS = GRP_Main_Tyrant_of_the_Skies:AddToggle("Auto_Farm_Boss_TOTS", {
        Text = "Auto Farm Tyrant of the Skies",
        Default = false,
        Callback = function(bossTots)
            _G.BossTots = bossTots
        end,
    })

    FarmTyrant = Auto_Farm_Boss_TOTS

    local Auto_Summon_Boss = GRP_Main_Tyrant_of_the_Skies:AddToggle("Auto_Summon_Boss", {
        Text = "Auto Summon Tyrant of the Skies",
        Default = false,
        Callback = function(phaBinh)
            _G.PhaBinh = phaBinh
        end,
    })

    FarmPhaBinh = Auto_Summon_Boss
    local v30 = tbl.Main:AddLeftGroupbox("Farm Material")
    GRP_Main_Farm_Material = v30

    local Select_Material = GRP_Main_Farm_Material:AddDropdown("Select_Material", {
        Text = "Select Material",
        Values = MaterialList,
        Default = 1,
        Callback = function(arg)
            SelectMaterial = arg

            if MaterialMon then
                MaterialMon()
            end
        end,
    })

    SelectMaterialDropdown = Select_Material

    local Auto_Farm_Materials = GRP_Main_Farm_Material:AddToggle("Auto_Farm_Materials", {
        Text = "Auto Farm Materials",
        Default = false,
        Callback = function(autoMaterial)
            _G.AutoMaterial = autoMaterial
        end,
    })

    Toggle = Auto_Farm_Materials
    local v31 = tbl.Main:AddLeftGroupbox("Farm Boss")
    GRP_Main_Farm_Boss = v31

    local Select_Boss = GRP_Main_Farm_Boss:AddDropdown("Select_Boss", {
        Text = "Select Boss",
        Values = BossList,
        Default = 1,
        Callback = function(findBoss)
            _G.FindBoss = findBoss
        end,
    })

    SelectBossDropdown = Select_Boss

    local Auto_Farm_Boss = GRP_Main_Farm_Boss:AddToggle("Auto_Farm_Boss", {
        Text = "Auto Farm Boss",
        Default = false,
        Callback = function(autoFarmBoss)
            _G.AutoFarmBoss = autoFarmBoss
        end,
    })

    FarmBoss = Auto_Farm_Boss

    local Accept_Quests3 = GRP_Main_Farm_Boss:AddToggle("Accept_Quests", {
        Text = "Accept Quests",
        Default = true,
        Callback = function(acceptQuestBoss)
            _G.AcceptQuestBoss = acceptQuestBoss
        end,
    })

    BossQ = Accept_Quests3

    local Auto_Farm_All_Boss = GRP_Main_Farm_Boss:AddToggle("Auto_Farm_All_Boss", {
        Text = "Auto Farm All Boss",
        Default = false,
        Callback = function(autoFarmBossAll)
            _G.AutoFarmBossAll = autoFarmBossAll
        end,
    })

    FarmAllBoss = Auto_Farm_All_Boss
    local Mastery = tbl.Main:AddLeftGroupbox("Mastery")
    _G.SelectIslandMastery = "Cake"
    getgenv().SelectIslandMastery = "Cake"

    Mastery:AddDropdown("Choose_Location_Mastery", {
        Text = "Choose Location",
        Values = {"Cake", "Bone", "Selected Mob"},
        Default = 1,
        Callback = function(selectIslandMastery)
            _G.SelectIslandMastery = selectIslandMastery
            getgenv().SelectIslandMastery = selectIslandMastery
        end,
    })

    local v32 = Mastery:AddSlider({
        Text = "Health Percentage",
        Min = 10,
        Max = 100,
        Default = 70,
        Rounding = 0,
        Callback = function(masteryHealthPct)
            _G.MasteryHealthPct = masteryHealthPct
            HealthM = masteryHealthPct
        end,
    })

    MasterySlider = v32
    local v33 = _G
    local selectedMasterySkills = _G.SelectedMasterySkills
    local v34 = selectedMasterySkills

    if not selectedMasterySkills then
        local tbl4 = {}
        v34 = tbl4
        tbl4.Z = true
        tbl4.X = true
        tbl4.C = true
        tbl4.V = true
        tbl4.F = true
    end

    v33.SelectedMasterySkills = v34

    Mastery:AddDropdown("Select_Skill_Mastery", {
        Text = "Select Skill Mastery",
        Values = {"Z", "X", "C", "V", "F"},
        Multi = true,
        Callback = function(selectedMasterySkills2, arg)
            if type(selectedMasterySkills2) == "string" and type(arg) == "boolean" then
                if type(_G.SelectedMasterySkills) ~= "table" then
                    _G.SelectedMasterySkills = {Z = true, X = true, C = true, V = true, F = true}
                end

                _G.SelectedMasterySkills[selectedMasterySkills2] = arg
            elseif type(selectedMasterySkills2) == "table" then
                _G.SelectedMasterySkills = selectedMasterySkills2
            end
        end,
    })

    Mastery:AddToggle("Auto_Mastery_Fruits", {
        Text = "Auto Mastery Fruits",
        Default = false,
        Callback = function(farmMasteryDev)
            _G.FarmMastery_Dev = farmMasteryDev
            _G.Auto_Fruit_Mastery = farmMasteryDev
        end,
    })

    Mastery:AddToggle("Auto_Mastery_Gun", {
        Text = "Auto Mastery Gun",
        Default = false,
        Callback = function(farmMasteryG)
            _G.FarmMastery_G = farmMasteryG
            _G.Auto_Gun_Mastery = farmMasteryG
        end,
    })

    Mastery:AddToggle("Auto_Mastery_All_Sword", {
        Text = "Auto Mastery All Sword",
        Default = false,
        Callback = function(farmMasteryS)
            _G.FarmMastery_S = farmMasteryS
            _G.Auto_Mastery_All_Sword = farmMasteryS
        end,
    })

    local v35 = tbl.Settings:AddLeftGroupbox("Settings / Configure")
    GRP_Settings_Settings_Configure = v35

    local Fast_Attack = GRP_Settings_Settings_Configure:AddToggle("Fast_Attack", {
        Text = "Fast Attack",
        Default = true,
        Callback = function(seriality)
            _G.Seriality = seriality
        end,
    })

    Initialize = Fast_Attack

    local Bring_Mobs = GRP_Settings_Settings_Configure:AddToggle("Bring_Mobs", {
        Text = "Bring Mobs",
        Default = true,
        Callback = function(arg)
            _B = arg
        end,
    })

    Bringmob = Bring_Mobs

    GRP_Settings_Settings_Configure:AddToggle("Auto_Hop_Server_with_time", {
        Text = "Auto Hop Server with time",
        Default = false,
        Callback = function(autoHopServer)
            _G.AutoHopServer = autoHopServer

            if not autoHopServer then
                _G.HopTimer = nil
            end
        end,
    })

    GRP_Settings_Settings_Configure:AddSlider({
        Text = "Hop Delay (Minutes)",
        Min = 5,
        Max = 120,
        Default = 30,
        Rounding = 0,
        Callback = function(arg)
            _G.HopDelay = arg * 60
        end,
    })

    GRP_Settings_Settings_Configure:AddToggle("Auto_Set_Spawn_Point", {
        Text = "Auto Set Spawn Point",
        Default = false,
        Callback = function(set)
            getgenv().Set = set

            if set then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                end)
            end
        end,
    })

    local Auto_Turn_on_Buso = GRP_Settings_Settings_Configure:AddToggle("Auto_Turn_on_Buso", {
        Text = "Auto Turn on Buso",
        Default = true,
        Callback = function(arg)
            Boud = arg
        end,
    })

    BusuAura = Auto_Turn_on_Buso

    GRP_Settings_Settings_Configure:AddToggle("Auto_Haki_Observation", {
        Text = "Auto Haki Observation",
        Default = false,
        Callback = function(observation)
            getgenv().Observation = observation
        end,
    })

    local AutoTurnonRaceV3 = GRP_Settings_Settings_Configure:AddToggle("AutoTurnonRaceV3", {
        Text = "Auto Turn on Race V3",
        Default = false,
        Callback = function(raceClickAutov3)
            _G.RaceClickAutov3 = raceClickAutov3
        end,
    })

    RaceV3Aura = AutoTurnonRaceV3

    local Auto_Turn_on_Race_V4 = GRP_Settings_Settings_Configure:AddToggle("Auto_Turn_on_Race_V4", {
        Text = "Auto Turn on Race V4",
        Default = false,
        Callback = function(raceClickAutov4)
            _G.RaceClickAutov4 = raceClickAutov4
        end,
    })

    RaceV4Aura = Auto_Turn_on_Race_V4

    local Auto_Turn_on_Spin__xyz = GRP_Settings_Settings_Configure:AddToggle("Auto_Turn_on_Spin__xyz", {
        Text = "Auto Turn on Spin xyz",
        Default = false,
        Callback = function(arg)
            RandomCFrame = arg
        end,
    })

    RandomAround = Auto_Turn_on_Spin__xyz

    local Safe_Mode = GRP_Settings_Settings_Configure:AddToggle("Safe_Mode", {
        Text = "Safe Mode",
        Default = false,
        Callback = function(safemode)
            _G.Safemode = safemode
        end,
    })

    SafeModes = Safe_Mode

    local Remove_Hit_VFX = GRP_Settings_Settings_Configure:AddToggle("Remove_Hit_VFX", {
        Text = "Remove Hit VFX",
        Default = false,
        Callback = function(destroyHit)
            _G.DestroyHit = destroyHit
        end,
    })

    DisableHitVFX = Remove_Hit_VFX

    local v36 = GRP_Settings_Settings_Configure:AddToggle("Remove_Death_&_Respawned_VFX", {
        Text = "Remove Death & Respawned VFX",
        Default = false,
        Callback = function(arg)
            RDeath = arg
        end,
    })

    RmvVFX = v36

    local Disable_Notify = GRP_Settings_Settings_Configure:AddToggle("Disable_Notify", {
        Text = "Disable Notify",
        Default = false,
        Callback = function(arg)
            RemoveDamage = arg
        end,
    })

    DisblesNotify = Disable_Notify

    GRP_Settings_Settings_Configure:AddToggle("Anti_AFK", {
        Text = "Anti AFK",
        Default = true,
        Callback = function(arg)
            if arg then
                local VirtualUser = game:GetService("VirtualUser")

                repeat
                    wait()
                until game:IsLoaded()

                game:GetService("Players").LocalPlayer.Idled:Connect(function()
                    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    wait(1)
                    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end)
            end
        end,
    })

    GRP_Settings_Settings_Configure:AddToggle("Auto_Anti_-_Admin_Join_Server", {
        Text = "Auto Anti - Admin Join Server",
        Default = true,
        Callback = function(hopServerAdmin)
            getgenv().HopServerAdmin = hopServerAdmin
        end,
    })

    GRP_Settings_Settings_Configure:AddToggle("No_Clip", {
        Text = "No Clip",
        Default = false,
        Callback = function(noClip)
            getgenv().NoClip = noClip
        end,
    })

    local Fishing = tbl.Fish:AddLeftGroupbox("Fishing")
    GRP_Fish_Fishing = Fishing

    GRP_Fish_Fishing:AddDropdown("Select_Fishing_Rod", {
        Text = "Select Fishing Rod",
        Values = {
            "Fishing Rod",
            "Gold Rod",
            "Shark Rod",
            "Shell Rod",
            "Treasure Rod",
        },
        Default = "Fishing Rod",
        Callback = function(selectedRod)
            _G.SelectedRod = selectedRod
        end,
    })

    local Select_Bait = GRP_Fish_Fishing:AddDropdown("Select_Bait", {
        Text = "Select Bait",
        Values = {
            "Basic Bait",
            "Kelp Bait",
            "Good Bait",
            "Abyssal Bait",
            "Frozen Bait",
            "Epic Bait",
            "Carnivore Bait",
        },
        Default = "Basic Bait",
        Callback = function(selectedBait)
            _G.SelectedBait = selectedBait

            if _G.AutoBuyBait then
                pcall(function()
                    Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
                end)
            end
        end,
    })

    BaitDropdown = Select_Bait

    local Auto_Buy_Bait = GRP_Fish_Fishing:AddToggle("Auto_Buy_Bait", {
        Text = "Auto Buy Bait",
        Default = false,
        Callback = function(autoBuyBait)
            _G.AutoBuyBait = autoBuyBait

            if autoBuyBait then
                pcall(function()
                    Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
                end)
            end
        end,
    })

    BuyBaitToggle = Auto_Buy_Bait

    local Auto_Fishing = GRP_Fish_Fishing:AddToggle("Auto_Fishing", {
        Text = "Auto Fishing",
        Default = false,
        Callback = function(autoFishing)
            _G.AutoFishing = autoFishing
        end,
    })

    FishingToggle = Auto_Fishing

    local Auto_Sell_Fish = GRP_Fish_Fishing:AddToggle("Auto_Sell_Fish", {
        Text = "Auto Sell Fish",
        Default = false,
        Callback = function(autoSellFish)
            _G.AutoSellFish = autoSellFish

            if autoSellFish then
                pcall(function()
                    Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
                end)
            end
        end,
    })

    SellFishToggle = Auto_Sell_Fish

    local Auto_Quest_Fishing = GRP_Fish_Fishing:AddToggle("Auto_Quest_Fishing", {
        Text = "Auto Quest Fishing",
        Default = false,
        Callback = function(autoFishingQuest)
            _G.AutoFishingQuest = autoFishingQuest
        end,
    })

    FishingQ = Auto_Quest_Fishing

    local Auto_Complete_Quest = GRP_Fish_Fishing:AddToggle("Auto_Complete_Quest", {
        Text = "Auto Complete Quest",
        Default = false,
        Callback = function(autoQuestComplete)
            _G.AutoQuestComplete = autoQuestComplete

            if autoQuestComplete then
                pcall(function()
                    Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
                end)
            end
        end,
    })

    QuestToggle = Auto_Complete_Quest

    local Auto_Spam_Skill_Z = GRP_Fish_Fishing:AddToggle("Auto_Spam_Skill_Z", {
        Text = "Auto Spam Skill Z",
        Default = false,
        Callback = function(autoSkillZ)
            _G.AutoSkillZ = autoSkillZ
        end,
    })

    SpamSkillZ = Auto_Spam_Skill_Z
    local v37 = tbl.Quests:AddLeftGroupbox("Auto Sea")
    GRP_Quests_Auto_Quest_Sea_2 = v37

    local Auto_Quest_Sea_2 = GRP_Quests_Auto_Quest_Sea_2:AddToggle("Auto_Quest_Sea_2", {
        Text = "Auto Quest Sea 2",
        Default = false,
        Callback = function(travelDres)
            _G.TravelDres = travelDres
        end,
    })

    TravelDress = Auto_Quest_Sea_2

    local Auto_Quest_Sea_3 = GRP_Quests_Auto_Quest_Sea_2:AddToggle("Auto_Quest_Sea_3", {
        Text = "Auto Quest Sea 3",
        Default = false,
        Callback = function(autoZou)
            _G.AutoZou = autoZou
        end,
    })

    Zou = Auto_Quest_Sea_3
    local v38 = tbl.Quests:AddLeftGroupbox("Tushita + Yama")
    GRP_Quests_Tushita_Yama = v38

    local Auto_Tushita_Sword = GRP_Quests_Tushita_Yama:AddToggle("Auto_Tushita_Sword", {
        Text = "Auto Tushita Sword",
        Default = false,
        Callback = function(autoTushita)
            _G.Auto_Tushita = autoTushita
        end,
    })

    Q = Auto_Tushita_Sword

    local Auto_Yama_Sword = GRP_Quests_Tushita_Yama:AddToggle("Auto_Yama_Sword", {
        Text = "Auto Yama Sword",
        Default = false,
        Callback = function(autoYama)
            _G.Auto_Yama = autoYama
        end,
    })

    Q = Auto_Yama_Sword
    local v39 = tbl.Quests:AddLeftGroupbox("Skull Guitar")
    GRP_Quests_Skull_Guitars_Misc = v39
    local v40 = GRP_Quests_Skull_Guitars_Misc:AddLabel("Skull Guitar Quests")

    spawn(function()
        while wait(0.2) do
            pcall(function()
                if Quest1 == true then
                    v40:SetText("Quest Number : Quest1")
                elseif Quest2 == true then
                    v40:SetText("Quest Number : Quest2")
                elseif Quest3 == true then
                    v40:SetText("Quest Number : Quest3")
                elseif Quest4 == true then
                    v40:SetText("Quest Number : Quest4")
                elseif GetWP and GetWP("Skull Guitar") then
                    v40:SetText("Quest Number : Collect!!")
                else
                    v40:SetText("Quest Number : No Quest!!")
                end
            end)
        end
    end)

    GRP_Quests_Skull_Guitars_Misc:AddToggle("Auto_Skull_Guitar", {
        Text = "Auto Skull Guitar",
        Default = false,
        Callback = function(autoSoulGuitar)
            _G.Auto_Soul_Guitar = autoSoulGuitar
        end,
    })

    GRP_Quests_Skull_Guitars_Misc:AddToggle("Auto_Farm_Material_Skull_Guitar", {
        Text = "Auto Farm Material Skull Guitar",
        Default = false,
        Callback = function(autoMatSoul)
            _G.AutoMatSoul = autoMatSoul
        end,
    })

    local v41 = tbl.Quests:AddLeftGroupbox("Cursed Dual Katana")
    GRP_Quests_Cursed_Dual_Katana = v41
    local v42 = GRP_Quests_Cursed_Dual_Katana:AddLabel("Number Cursed dual katana quests")

    spawn(function()
        while wait(0.2) do
            if QuestYama_1 == true then
                v42:SetText("Quest Numbers : yama quest 1")
            elseif QuestYama_2 == true then
                v42:SetText("Quest Numbers : yama quest 2")
            elseif QuestYama_3 == true then
                v42:SetText("Quest Numbers : yama quest 3")
            elseif QuestTushita_1 == true then
                v42:SetText("Quest Numbers : tushita quest 1")
            elseif QuestTushita_2 == true then
                v42:SetText("Quest Numbers : tushita quest 2")
            elseif GetWP and GetWP("Cursed Dual Katana") then
                v42:SetText("Quest Numbers : CDK done!!")
            end
        end
    end)

    local v43 = GRP_Quests_Cursed_Dual_Katana:AddToggle("Auto_Get_CDK_[_Last_Quest_]", {
        Text = "Auto Get CDK Last Quest",
        Default = false,
        Callback = function(cdk)
            _G.CDK = cdk
        end,
    })

    Q = v43

    local Auto_Yama_CDK = GRP_Quests_Cursed_Dual_Katana:AddToggle("Auto_Yama_CDK", {
        Text = "Auto Yama CDK",
        Default = false,
        Callback = function(cdkYm)
            _G.CDK_YM = cdkYm
        end,
    })

    Q = Auto_Yama_CDK

    local Auto_Tushita_CDK = GRP_Quests_Cursed_Dual_Katana:AddToggle("Auto_Tushita_CDK", {
        Text = "Auto Tushita CDK",
        Default = false,
        Callback = function(cdkTs)
            _G.CDK_TS = cdkTs
        end,
    })

    Q = Auto_Tushita_CDK
    local v44 = tbl.Quests:AddLeftGroupbox("True Triple Katana")
    GRP_Quests_True_Triple_Katana_Sword = v44

    GRP_Quests_True_Triple_Katana_Sword:AddButton({
        Text = "Buy Legendary Sword",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
            replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
            replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
        end,
    })

    GRP_Quests_True_Triple_Katana_Sword:AddButton({
        Text = "Buy True Triple Katana Sword",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
        end,
    })

    GRP_Quests_True_Triple_Katana_Sword:AddToggle("Tween_to_Legendary_Sword_Dealer", {
        Text = "Tween to Legendary Sword Dealer",
        Default = false,
        Callback = function(tpLgS)
            _G.Tp_LgS = tpLgS
        end,
    })

    local Rengoku = tbl.Quests:AddLeftGroupbox("Rengoku")
    GRP_Quests_Rengoku_Sword = Rengoku

    local Auto_Rengoku_Sword = GRP_Quests_Rengoku_Sword:AddToggle("Auto_Rengoku_Sword", {
        Text = "Auto Rengoku Sword",
        Default = false,
        Callback = function(iceBossRen)
            _G.IceBossRen = iceBossRen
        end,
    })

    Q = Auto_Rengoku_Sword

    local Auto_Key_Rengoku = GRP_Quests_Rengoku_Sword:AddToggle("Auto_Key_Rengoku", {
        Text = "Auto Key Rengoku",
        Default = false,
        Callback = function(keysRen)
            _G.KeysRen = keysRen
        end,
    })

    Q = Auto_Key_Rengoku
    local Sword = tbl.Quests:AddLeftGroupbox("Sword")
    GRP_Quests_Pole_God_Enal_s = Sword

    local Auto_Pole_V1 = GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Pole_V1", {
        Text = "Auto Pole V1",
        Default = false,
        Callback = function(autoPole)
            _G.AutoPole = autoPole
        end,
    })

    Q = Auto_Pole_V1

    local v45 = GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Pole_V2_[Beta]", {
        Text = "Auto Pole V2",
        Default = false,
        Callback = function(autoPoleV2)
            _G.AutoPoleV2 = autoPoleV2
        end,
    })

    Q = v45

    GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Saw_Sword", {
        Text = "Auto Saw Sword",
        Default = false,
        Callback = function(autoSaw)
            _G.AutoSaw = autoSaw
        end,
    })

    local Auto_Saber_Sword = GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Saber_Sword", {
        Text = "Auto Saber Sword",
        Default = false,
        Callback = function(autoSaber)
            _G.AutoSaber = autoSaber
        end,
    })

    Q = Auto_Saber_Sword

    GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Warden_Sword", {
        Text = "Auto Warden Sword",
        Default = false,
        Callback = function(wardenBoss)
            _G.WardenBoss = wardenBoss
        end,
    })

    GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Long_Sword", {
        Text = "Auto Long Sword",
        Default = false,
        Callback = function(longsWord)
            _G.LongsWord = longsWord
        end,
    })

    local Auto_Canvendish_Sword = GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Canvendish_Sword", {
        Text = "Auto Canvendish Sword",
        Default = false,
        Callback = function(autoCavender)
            _G.Auto_Cavender = autoCavender
        end,
    })

    Q = Auto_Canvendish_Sword

    local Auto_Twin_Hooks = GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Twin_Hooks", {
        Text = "Auto Twin Hooks",
        Default = false,
        Callback = function(twinHook)
            _G.TwinHook = twinHook
        end,
    })

    Q = Auto_Twin_Hooks

    local Auto_Bigmom = GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Bigmom", {
        Text = "Auto Bigmom",
        Default = false,
        Callback = function(autoBigmom)
            _G.AutoBigmom = autoBigmom
        end,
    })

    Q = Auto_Bigmom

    GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Midnight_Blade", {
        Text = "Auto Midnight Blade",
        Default = false,
        Callback = function(autoEcBoss)
            _G.AutoEcBoss = autoEcBoss
        end,
    })

    GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Black_Spikey", {
        Text = "Auto Black Spikey",
        Default = false,
        Callback = function(blackSpikey)
            _G.BlackSpikey = blackSpikey
        end,
    })

    GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Dragon_Trident", {
        Text = "Auto Dragon Trident",
        Default = false,
        Callback = function(autoTridentW2)
            _G.AutoTridentW2 = autoTridentW2
        end,
    })

    GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Bisento_V2", {
        Text = "Auto Bisento V2",
        Default = false,
        Callback = function(greybeard)
            _G.Greybeard = greybeard
        end,
    })

    GRP_Quests_Pole_God_Enal_s:AddToggle("Auto_Dark_Blade_V3", {
        Text = "Auto Dark Blade V3",
        Default = false,
        Callback = function(darkBladev3)
            _G.DarkBladev3 = darkBladev3
        end,
    })

    local Accesspories = tbl.Quests:AddLeftGroupbox("Accesspories")
    GRP_Quests_Accesspories = Accesspories

    GRP_Quests_Accesspories:AddToggle("Auto_Usoap_Hat", {
        Text = "Auto Usoap's Hat",
        Default = false,
        Callback = function(autoGetUsoap)
            _G.AutoGetUsoap = autoGetUsoap
        end,
    })

    GRP_Quests_Accesspories:AddToggle("Auto_Marine_Coat", {
        Text = "Auto Marine Coat",
        Default = false,
        Callback = function(marinesCoat)
            _G.MarinesCoat = marinesCoat
        end,
    })

    GRP_Quests_Accesspories:AddToggle("Auto_Swan_Coat", {
        Text = "Auto Swan Coat",
        Default = false,
        Callback = function(swanCoat)
            _G.SwanCoat = swanCoat
        end,
    })

    GRP_Quests_Accesspories:AddToggle("Auto_Swan_Glasses", {
        Text = "Auto Swan Glasses",
        Default = false,
        Callback = function(autoSwanGG)
            _G.Auto_SwanGG = autoSwanGG
        end,
    })

    local Auto_Lei_Accessory = GRP_Quests_Accesspories:AddToggle("Auto_Lei_Accessory", {
        Text = "Auto Lei Accessory",
        Default = false,
        Callback = function(autoKilo)
            _G.AutoKilo = autoKilo
        end,
    })

    Q = Auto_Lei_Accessory
    local Gun = tbl.Quests:AddLeftGroupbox("Gun")
    GRP_Quests_Gun = Gun

    GRP_Quests_Gun:AddToggle("Auto_Serpent_Bow", {
        Text = "Auto Serpent Bow",
        Default = false,
        Callback = function(autoSerpentBow)
            _G.AutoSerpentBow = autoSerpentBow
        end,
    })

    local Other = tbl.Quests:AddLeftGroupbox("Other")
    GRP_Quests_Other = Other

    GRP_Quests_Other:AddToggle("Auto_Cyborg", {
        Text = "Auto Cybrog",
        Default = false,
        Callback = function(autoColShad)
            _G.AutoColShad = autoColShad
        end,
    })

    GRP_Quests_Other:AddToggle("Auto_Darkbeard", {
        Text = "Auto Darkbeard",
        Default = false,
        Callback = function(autoDefDarkCoat)
            _G.Auto_Def_DarkCoat = autoDefDarkCoat
        end,
    })

    GRP_Quests_Other:AddToggle("Auto_Unlocked_Don_Swan", {
        Text = "Auto Unlocked DonSwan",
        Default = false,
        Callback = function(autoDonAcces)
            _G.Auto_DonAcces = autoDonAcces
        end,
    })

    GRP_Quests_Other:AddToggle("Auto_Done_Bartilo_Quest", {
        Text = "Auto Done Bartilo Quest",
        Default = false,
        Callback = function(bartiloQuest)
            _G.Bartilo_Quest = bartiloQuest
        end,
    })

    GRP_Quests_Other:AddToggle("Auto_Done_Citizen_Quest", {
        Text = "Auto Done Citizen Quest",
        Default = false,
        Callback = function(citizenQuest)
            _G.CitizenQuest = citizenQuest
        end,
    })

    GRP_Quests_Other:AddToggle("Auto_Training_Dummy", {
        Text = "Auto Training Dummy",
        Default = false,
        Callback = function(dummyMan)
            _G.DummyMan = dummyMan
        end,
    })

    local v46 = tbl.Quests:AddLeftGroupbox("Haki Color")
    GRP_Quests_Buso_Aura_Colours = v46

    GRP_Quests_Buso_Aura_Colours:AddButton({
        Text = "Buy Buso Colors",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("ColorsDealer", "2")
        end,
    })

    local Auto_Rainbow_Colors = GRP_Quests_Buso_Aura_Colours:AddToggle("Auto_Rainbow_Colors", {
        Text = "Auto Rainbow Haki",
        Default = false,
        Callback = function(autoRainbowHaki)
            _G.Auto_Rainbow_Haki = autoRainbowHaki
        end,
    })

    Q = Auto_Rainbow_Colors

    local Accept_Rainbow_Quest_Faster = GRP_Quests_Buso_Aura_Colours:AddToggle("Accept_Rainbow_Quest_Faster", {
        Text = "Accept Rainbow Haki Quest",
        Default = false,
        Callback = function(getQFast)
            _G.GetQFast = getQFast
        end,
    })

    Q = Accept_Rainbow_Quest_Faster
    local Observation = tbl.Quests:AddLeftGroupbox("Observation")
    GRP_Quests_Instinct_Observation = Observation

    local Auto_Farm_Observation = GRP_Quests_Instinct_Observation:AddToggle("Auto_Farm_Observation", {
        Text = "Auto Farm Observation",
        Default = false,
        Callback = function(obsFarm)
            _G.obsFarm = obsFarm
        end,
    })

    Q = Auto_Farm_Observation

    GRP_Quests_Instinct_Observation:AddToggle("Auto_Observation_V2", {
        Text = "Auto Observation V2",
        Default = false,
        Callback = function(autoKenVTWO)
            _G.AutoKenVTWO = autoKenVTWO
        end,
    })

    local v47 = tbl.Quests:AddLeftGroupbox("Fighting Style")
    GRP_Quests_Fighting_Melee_Styles = v47

    local Auto_Superhuman = GRP_Quests_Fighting_Melee_Styles:AddToggle("Auto_Superhuman", {
        Text = "Auto Superhuman",
        Default = false,
        Callback = function(autoSuperHuman)
            _G.Auto_SuperHuman = autoSuperHuman
        end,
    })

    SuperHuman = Auto_Superhuman

    local Auto_DeathStep = GRP_Quests_Fighting_Melee_Styles:AddToggle("Auto_DeathStep", {
        Text = "Auto DeathStep",
        Default = false,
        Callback = function(autoDeathStep)
            _G.AutoDeathStep = autoDeathStep
        end,
    })

    DeathStep = Auto_DeathStep

    local Auto_Sharkman_Karate = GRP_Quests_Fighting_Melee_Styles:AddToggle("Auto_Sharkman_Karate", {
        Text = "Auto Sharkman Karate",
        Default = false,
        Callback = function(sharkmanV2)
            _G.SharkmanV2 = sharkmanV2
        end,
    })

    SharkManV2 = Auto_Sharkman_Karate

    local Auto_ElectricClaw = GRP_Quests_Fighting_Melee_Styles:AddToggle("Auto_ElectricClaw", {
        Text = "Auto ElectricClaw",
        Default = false,
        Callback = function(electricClaw)
            _G.ElectricClaw = electricClaw
        end,
    })

    ElectricClaw = Auto_ElectricClaw

    local Auto_DragonTalon = GRP_Quests_Fighting_Melee_Styles:AddToggle("Auto_DragonTalon", {
        Text = "Auto DragonTalon",
        Default = false,
        Callback = function(dragonTalon)
            _G.DragonTalon = dragonTalon
        end,
    })

    DragonTalon = Auto_DragonTalon

    local Auto_Godhuman = GRP_Quests_Fighting_Melee_Styles:AddToggle("Auto_Godhuman", {
        Text = "Auto Godhuman",
        Default = false,
        Callback = function(godhuman)
            _G.Godhuman = godhuman
        end,
    })

    Godhuman = Auto_Godhuman

    local Auto_SanguineArt = GRP_Quests_Fighting_Melee_Styles:AddToggle("Auto_SanguineArt", {
        Text = "Auto SanguineArt",
        Default = false,
        Callback = function(sanguineArt)
            _G.SanguineArt = sanguineArt
        end,
    })

    SanguineArt = Auto_SanguineArt
    local v48 = tbl.SeaEvent:AddLeftGroupbox("Sea Event Setting")
    GRP_SeaEvent_Sea_Event_Setting_Sail = v48

    GRP_SeaEvent_Sea_Event_Setting_Sail:AddButton({
        Text = "Remove Lighting Effect",
        Func = function()
            if game.Lighting:FindFirstChild("SeaTerrorCC") then
                game.Lighting.SeaTerrorCC:Destroy()
            end
        end,
    })

    GRP_SeaEvent_Sea_Event_Setting_Sail:AddToggle("Ship_Speed_Modifier", {
        Text = "Ship Speed Modifier",
        Default = false,
        Callback = function(boatSpeedMod)
            _G.BoatSpeedMod = boatSpeedMod
        end,
    })

    GRP_SeaEvent_Sea_Event_Setting_Sail:AddSlider({
        Text = "Ship Speed",
        Min = 0,
        Max = 1000,
        Default = 300,
        Rounding = 0,
        Callback = function(boatSpeed)
            _G.BoatSpeed = boatSpeed
        end,
    })

    GRP_SeaEvent_Sea_Event_Setting_Sail:AddToggle("Auto_Press_W", {
        Text = "Auto Press W",
        Default = false,
        Callback = function(autoPressW)
            _G.AutoPressW = autoPressW
        end,
    })

    GRP_SeaEvent_Sea_Event_Setting_Sail:AddToggle("No_Clip_Ship", {
        Text = "No Clip Ship",
        Default = false,
        Callback = function(noClipBoat)
            _G.NoClipBoat = noClipBoat
        end,
    })

    local v49 = tbl.SeaEvent:AddLeftGroupbox("Sea Event")
    GRP_SeaEvent_Choose_Sea_Event = v49
    local v50 = _G
    local selectedBoat = _G.SelectedBoat
    local selectedBoat2 = selectedBoat

    if not selectedBoat then
        local v51 = ListSeaBoat
        selectedBoat2 = v51 and ListSeaBoat[1]
    end

    if not selectedBoat2 then
        selectedBoat2 = "Guardian"
    end

    v50.SelectedBoat = selectedBoat2
    local v51 = _G
    local dangerSc = _G.DangerSc
    local dangerSc2 = dangerSc

    if not dangerSc then
        local v52 = ListSeaZone
        dangerSc2 = v52 and ListSeaZone[1]
    end

    if not dangerSc2 then
        dangerSc2 = "Lv 1"
    end

    v51.DangerSc = dangerSc2
    local v52 = GRP_SeaEvent_Choose_Sea_Event
    local addDropdown = v52.AddDropdown
    local tbl4 = {Text = "Select Boats"}
    local v53 = ListSeaBoat
    local v54 = v53

    if not v53 then
        local tbl5 = {}
        v54 = tbl5
        tbl5[1] = "Guardian"
        tbl5[2] = "PirateGrandBrigade"
        tbl5[3] = "MarineGrandBrigade"
        tbl5[4] = "PirateBrigade"
        tbl5[5] = "MarineBrigade"
        tbl5[6] = "PirateSloop"
        tbl5[7] = "MarineSloop"
        tbl5[8] = "Beast Hunter"
    end

    tbl4.Values = v54
    tbl4.Default = 1

    tbl4.Callback = function(selectedBoat3)
        _G.SelectedBoat = selectedBoat3
    end

    local selectBoats = addDropdown(v52, "Select_Boats", tbl4)
    Q = selectBoats

    GRP_SeaEvent_Choose_Sea_Event:AddButton({
        Text = "Buy Boats",
        Func = function()
            local selectedBoat3 = _G.SelectedBoat
            local str8 = selectedBoat3

            if not selectedBoat3 then
                local v55 = ListSeaBoat
                str8 = v55 and ListSeaBoat[1]
            end

            if not str8 then
                str8 = "Guardian"
            end

            replicated.Remotes.CommF_:InvokeServer("BuyBoat", str8)
        end,
    })

    local v55 = GRP_SeaEvent_Choose_Sea_Event
    local addDropdown2 = v55.AddDropdown
    local tbl5 = {Text = "Select Sea Level"}
    local v56 = ListSeaZone
    local v57 = v56

    if not v56 then
        local tbl6 = {}
        v57 = tbl6
        tbl6[1] = "Lv 1"
        tbl6[2] = "Lv 2"
        tbl6[3] = "Lv 3"
        tbl6[4] = "Lv 4"
        tbl6[5] = "Lv 5"
        tbl6[6] = "Lv 6"
        tbl6[7] = "Lv Infinite"
    end

    tbl5.Values = v57
    tbl5.Default = 1

    tbl5.Callback = function(dangerSc3)
        _G.DangerSc = dangerSc3
    end

    local selectSeaLevel = addDropdown2(v55, "Select_Sea_Level", tbl5)
    Q = selectSeaLevel

    local Auto_Sail_Boat = GRP_SeaEvent_Choose_Sea_Event:AddToggle("Auto_Sail_Boat", {
        Text = "Auto Sail Boat",
        Default = false,
        Callback = function(sailBoats)
            _G.SailBoats = sailBoats
            _G.AutoSailBoat = sailBoats
        end,
    })

    Q = Auto_Sail_Boat
    local v58 = tbl.SeaEvent:AddLeftGroupbox("Sea Event Entity")
    GRP_SeaEvent_Entity_Sea_Event = v58

    GRP_SeaEvent_Entity_Sea_Event:AddToggle("Auto_Shark", {
        Text = "Auto Shark",
        Default = false,
        Callback = function(shark)
            _G.Shark = shark
            _G.AutoShark = shark
        end,
    })

    GRP_SeaEvent_Entity_Sea_Event:AddToggle("Auto_Piranha", {
        Text = "Auto Piranha",
        Default = false,
        Callback = function(piranha)
            _G.Piranha = piranha
            _G.AutoPiranha = piranha
        end,
    })

    GRP_SeaEvent_Entity_Sea_Event:AddToggle("Auto_Terror_Shark", {
        Text = "Auto Terror Shark",
        Default = false,
        Callback = function(terrorShark)
            _G.TerrorShark = terrorShark
            _G.AutoTerrorShark = terrorShark
        end,
    })

    GRP_SeaEvent_Entity_Sea_Event:AddToggle("Auto_Fish_Crew_Member", {
        Text = "Auto Fish Crew Member",
        Default = false,
        Callback = function(mobCrew)
            _G.MobCrew = mobCrew
            _G.AutoFishCrew = mobCrew
        end,
    })

    GRP_SeaEvent_Entity_Sea_Event:AddToggle("Auto_Haunted_Crew_Member", {
        Text = "Auto Haunted Crew Member",
        Default = false,
        Callback = function(hcm)
            _G.HCM = hcm
            _G.AutoHauntedCrew = hcm
        end,
    })

    GRP_SeaEvent_Entity_Sea_Event:AddToggle("Auto_Attack_PirateGrandBrigade", {
        Text = "Auto Attack PirateGrandBrigade",
        Default = false,
        Callback = function(pgb)
            _G.PGB = pgb
            _G.AutoPirateBrigade = pgb
        end,
    })

    GRP_SeaEvent_Entity_Sea_Event:AddToggle("Auto_Attack_Fish_Boat", {
        Text = "Auto Attack Fish Boat",
        Default = false,
        Callback = function(fishBoat)
            _G.FishBoat = fishBoat
            _G.AutoFishBoat = fishBoat
        end,
    })

    GRP_SeaEvent_Entity_Sea_Event:AddToggle("Auto_Attack_Sea_Beast", {
        Text = "Auto Attack Sea Beast",
        Default = false,
        Callback = function(seaBeast1)
            _G.SeaBeast1 = seaBeast1
            _G.AutoSeaBeast = seaBeast1
        end,
    })

    local v59 = tbl.SeaEvent:AddLeftGroupbox("Sea Event Crafting")
    GRP_SeaEvent_Crafting_Items = v59

    GRP_SeaEvent_Crafting_Items:AddButton({
        Text = "Craft SharkTooth",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "SharkTooth")
        end,
    })

    GRP_SeaEvent_Crafting_Items:AddButton({
        Text = "Craft TerrorJaw",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "TerrorJaw")
        end,
    })

    GRP_SeaEvent_Crafting_Items:AddButton({
        Text = "Craft SharkAnchor",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "SharkAnchor")
        end,
    })

    GRP_SeaEvent_Crafting_Items:AddButton({
        Text = "Craft LeviathanCrown",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "LeviathanCrown")
        end,
    })

    GRP_SeaEvent_Crafting_Items:AddButton({
        Text = "Craft LeviathanShield",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "LeviathanShield")
        end,
    })

    GRP_SeaEvent_Crafting_Items:AddButton({
        Text = "Craft LeviathanBoat",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "LeviathanBoat")
        end,
    })

    GRP_SeaEvent_Crafting_Items:AddButton({
        Text = "Craft LegendaryScroll",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "LegendaryScroll")
        end,
    })

    GRP_SeaEvent_Crafting_Items:AddButton({
        Text = "Craft MythicalScroll",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "MythicalScroll")
        end,
    })

    local v60 = tbl.SeaEvent:AddLeftGroupbox("Kitsune Event")
    GRP_SeaEvent_Kitsune_Island_Event = v60
    local v61 = GRP_SeaEvent_Kitsune_Island_Event:AddLabel("")

    spawn(function()
        while task.wait(1) do
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                v61:SetText("Kitsune Island : ✅")
            else
                v61:SetText("Kitsune Island : ❌")
            end
        end
    end)

    GRP_SeaEvent_Kitsune_Island_Event:AddToggle("Auto_Find_Kitsune_Island", {
        Text = "Auto Find Kitsune Island",
        Default = false,
        Callback = function(autoFindKitsune)
            _G.AutoFindKitsune = autoFindKitsune
        end,
    })

    GRP_SeaEvent_Kitsune_Island_Event:AddToggle("Auto_Teleport_to_Shrine_Actived", {
        Text = "Auto Teleport to Shrine Actived",
        Default = false,
        Callback = function(teleportShrine)
            _G.TeleportShrine = teleportShrine
        end,
    })

    GRP_SeaEvent_Kitsune_Island_Event:AddToggle("Auto_Collect_Azure_Ember", {
        Text = "Auto Collect Azure Ember",
        Default = false,
        Callback = function(collectAzure)
            _G.CollectAzure = collectAzure
        end,
    })

    GRP_SeaEvent_Kitsune_Island_Event:AddToggle("Auto_Trade_Azure_Ember", {
        Text = "Auto Trade Azure Ember",
        Default = false,
        Callback = function(tradeAzure)
            _G.TradeAzure = tradeAzure
        end,
    })

    GRP_SeaEvent_Kitsune_Island_Event:AddButton({
        Text = "Trade Azure Ember",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("KitsuneStatue", "Trade")
        end,
    })

    GRP_SeaEvent_Kitsune_Island_Event:AddButton({
        Text = "Talk with kitsune statue",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("KitsuneStatue", "Talk")
        end,
    })

    local v62 = tbl.SeaEvent:AddLeftGroupbox("Frozen Dimension")
    GRP_SeaEvent_Frozen_Dimension_Event = v62
    local v63 = GRP_SeaEvent_Frozen_Dimension_Event:AddLabel("")
    local v64 = GRP_SeaEvent_Frozen_Dimension_Event:AddLabel("")

    spawn(function()
        while task.wait(1) do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
                v63:SetText("Frozen Dimension : ✅")
            else
                v63:SetText("Frozen Dimension : ❌")
            end
        end
    end)

    spawn(function()
        while task.wait(1) do
            pcall(function()
                local response = replicated.Remotes.CommF_:InvokeServer("LeviathanProgress")
                local setText = v64.SetText
                local v65 = tostring
                local str8 = response or "None"
                setText(v64, "Spy Progress: " .. v65(str8))
            end)
        end
    end)

    GRP_SeaEvent_Frozen_Dimension_Event:AddButton({
        Text = "Buy Spy",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("BuySpy")
        end,
    })

    GRP_SeaEvent_Frozen_Dimension_Event:AddToggle("Auto_Teleport_Frozen_Dimension", {
        Text = "Auto Teleport Frozen Dimension",
        Default = false,
        Callback = function(frozenTP)
            _G.FrozenTP = frozenTP
        end,
    })

    GRP_SeaEvent_Frozen_Dimension_Event:AddToggle("Auto_Drive_To_Hydra_Island", {
        Text = "Auto Drive To Hydra Island",
        Default = false,
        Callback = function(driveHydra)
            _G.DriveHydra = driveHydra
        end,
    })

    GRP_SeaEvent_Frozen_Dimension_Event:AddToggle("Auto_Attack_Leviathan", {
        Text = "Auto Attack Leviathan",
        Default = false,
        Callback = function(attackLeviathan)
            _G.AttackLeviathan = attackLeviathan
        end,
    })

    local Dojo = tbl.Prehistoric:AddLeftGroupbox("Dojo")
    GRP_Prehistoric_Dojo_Quest = Dojo

    GRP_Prehistoric_Dojo_Quest:AddButton({
        Text = "Dojo Quest",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("DojoTrainer", "Talk")
        end,
    })

    local Auto_Dojo_Trainer = GRP_Prehistoric_Dojo_Quest:AddToggle("Auto_Dojo_Trainer", {
        Text = "Auto Dojo Trainer",
        Default = false,
        Callback = function(dojoTrainer)
            _G.DojoTrainer = dojoTrainer
        end,
    })

    DojoQ = Auto_Dojo_Trainer

    local Auto_Dragon_Hunter = GRP_Prehistoric_Dojo_Quest:AddToggle("Auto_Dragon_Hunter", {
        Text = "Auto Dragon Hunter",
        Default = false,
        Callback = function(dragonHunter)
            _G.DragonHunter = dragonHunter
        end,
    })

    BlazeEM = Auto_Dragon_Hunter
    local v65 = tbl.Prehistoric:AddLeftGroupbox("Draco Trial")
    GRP_Prehistoric_Drago_Trial = v65

    local Tween_To_Upgrade_Droco_Trial = GRP_Prehistoric_Drago_Trial:AddToggle("Tween_To_Upgrade_Droco_Trial", {
        Text = "Tween To Upgrade Droco Trial",
        Default = false,
        Callback = function(tweenDrago)
            _G.TweenDrago = tweenDrago
        end,
    })

    Toggle = Tween_To_Upgrade_Droco_Trial

    local v66 = GRP_Prehistoric_Drago_Trial:AddToggle("Auto_Drago_(V1)", {
        Text = "Auto Draco V1",
        Default = false,
        Callback = function(dragoV1)
            _G.DragoV1 = dragoV1
        end,
    })

    Toggle = v66

    local v67 = GRP_Prehistoric_Drago_Trial:AddToggle("Auto_Drago_(V2)", {
        Text = "Auto Draco V2",
        Default = false,
        Callback = function(dragoV2)
            _G.DragoV2 = dragoV2
        end,
    })

    fireflower = v67

    local v68 = GRP_Prehistoric_Drago_Trial:AddToggle("Auto_Drago_(V3)", {
        Text = "Auto Draco V3",
        Default = false,
        Callback = function(dragoV3)
            _G.DragoV3 = dragoV3
        end,
    })

    Toggle = v68

    local v69 = GRP_Prehistoric_Drago_Trial:AddToggle("Auto_Relic_Drago_Trial_[Beta]", {
        Text = "Auto Relic Draco Trial",
        Default = false,
        Callback = function(relicDrago)
            _G.RelicDrago = relicDrago
        end,
    })

    Toggle = v69

    local Auto_Train_Drago_v4 = GRP_Prehistoric_Drago_Trial:AddToggle("Auto_Train_Drago_v4", {
        Text = "Auto Train Draco v4",
        Default = false,
        Callback = function(trainDrago)
            _G.TrainDrago = trainDrago
        end,
    })

    Toggle = Auto_Train_Drago_v4

    local Tween_to_Drago_Trials = GRP_Prehistoric_Drago_Trial:AddToggle("Tween_to_Drago_Trials", {
        Text = "Tween to Draco Trials",
        Default = false,
        Callback = function(tweenVolcanoDrago)
            _G.TweenVolcanoDrago = tweenVolcanoDrago
        end,
    })

    dragoTpVolcano = Tween_to_Drago_Trials

    local Swap_Drago_Race = GRP_Prehistoric_Drago_Trial:AddToggle("Swap_Drago_Race", {
        Text = "Swap Draco Race",
        Default = false,
        Callback = function(swapDrago)
            _G.SwapDrago = swapDrago
        end,
    })

    bdrago = Swap_Drago_Race

    local Upgrade_Dragon_Talon_With_Uzoth = GRP_Prehistoric_Drago_Trial:AddToggle("Upgrade_Dragon_Talon_With_Uzoth", {
        Text = "Upgrade Dragon Talon With Uzoth",
        Default = false,
        Callback = function(uzothTalon)
            _G.UzothTalon = uzothTalon
        end,
    })

    UpTalon = Upgrade_Dragon_Talon_With_Uzoth
    local v70 = tbl.Prehistoric:AddLeftGroupbox("Volcanic Crafting")
    GRP_Prehistoric_Volcanic_Crafting = v70

    GRP_Prehistoric_Volcanic_Crafting:AddButton({
        Text = "Craft Dragonheart",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "Dragonheart")
        end,
    })

    GRP_Prehistoric_Volcanic_Crafting:AddButton({
        Text = "Craft Dragonstorm",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "Dragonstorm")
        end,
    })

    GRP_Prehistoric_Volcanic_Crafting:AddButton({
        Text = "Craft Dino Hood",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "DinoHood")
        end,
    })

    GRP_Prehistoric_Volcanic_Crafting:AddButton({
        Text = "Craft T-Rex Skull",
        Func = function()
            replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "TRexSkull")
        end,
    })
end

local v = tbl.Prehistoric:AddLeftGroupbox("Prehistoric Island")
GRP_Prehistoric_Prehistoric_Island = v
local v2 = GRP_Prehistoric_Prehistoric_Island:AddLabel("")

spawn(function()
    while task.wait(1) do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
            v2:SetText("Prehistoric Island : ✅")
        else
            v2:SetText("Prehistoric Island : ❌")
        end
    end
end)

GRP_Prehistoric_Prehistoric_Island:AddButton({
    Text = "Craft Volcanic Magnet",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "VolcanicMagnet")
    end,
})

GRP_Prehistoric_Prehistoric_Island:AddToggle("Craft_Volcanic_Magnet", {
    Text = "Craft Volcanic Magnet",
    Default = false,
    Callback = function(prehisFind)
        _G.Prehis_Find = prehisFind
    end,
})

GRP_Prehistoric_Prehistoric_Island:AddToggle("Auto_Find_Prehistoric_Island", {
    Text = "Auto Find Prehistoric Island",
    Default = false,
    Callback = function(autoFindPrehistoric)
        _G.AutoFindPrehistoric = autoFindPrehistoric
    end,
})

GRP_Prehistoric_Prehistoric_Island:AddToggle("Auto_Start_Prehistoric_Event", {
    Text = "Auto Start Volcano Event",
    Default = false,
    Callback = function(autoStartPrehistoric)
        _G.AutoStartPrehistoric = autoStartPrehistoric
    end,
})

GRP_Prehistoric_Prehistoric_Island:AddToggle("Auto_Patch_Prehistoric_Event", {
    Text = "Auto Patch Volcano Event",
    Default = false,
    Callback = function(autoPatchPrehistoric)
        _G.AutoPatchPrehistoric = autoPatchPrehistoric
    end,
})

local Kill_Aura = GRP_Prehistoric_Prehistoric_Island:AddToggle("Kill_Aura", {
    Text = "Kill Aura",
    Default = false,
    Callback = function(killAuraPrehistoric)
        _G.KillAuraPrehistoric = killAuraPrehistoric
    end,
})

Kaura = Kill_Aura

local Auto_Collect_Dino_Bones = GRP_Prehistoric_Prehistoric_Island:AddToggle("Auto_Collect_Dino_Bones", {
    Text = "Auto Collect Dino Bones",
    Default = false,
    Callback = function(autoDinoBones)
        _G.AutoDinoBones = autoDinoBones
    end,
})

Vocan = Auto_Collect_Dino_Bones

local Auto_Collect_Dragon_Eggs = GRP_Prehistoric_Prehistoric_Island:AddToggle("Auto_Collect_Dragon_Eggs", {
    Text = "Auto Collect Dragon Eggs",
    Default = false,
    Callback = function(autoDragonEggs)
        _G.AutoDragonEggs = autoDragonEggs
    end,
})

Vocan = Auto_Collect_Dragon_Eggs

local Auto_Reset_When_Complete_Volcano = GRP_Prehistoric_Prehistoric_Island:AddToggle("Auto_Reset_When_Complete_Volcano", {
    Text = "Auto Reset When Complete Volcano",
    Default = false,
    Callback = function(resetCompleteVolcano)
        _G.ResetCompleteVolcano = resetCompleteVolcano
    end,
})

Toggle = Auto_Reset_When_Complete_Volcano
local v3 = tbl.Race:AddLeftGroupbox("Mirage Island")
GRP_Race_Mystic_Island_Full_Moon = v3
local v4 = GRP_Race_Mystic_Island_Full_Moon:AddLabel("")
local v5 = GRP_Race_Mystic_Island_Full_Moon:AddLabel("")

task.spawn(function()
    while task.wait(1) do
        local sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
        local sky2 = sky or game:GetService("Lighting"):FindFirstChild("Sky")
        local moonTextureId = sky2 and sky2.MoonTextureId or ""
        local str = "Moon: 0/5"

        if moonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
            str = "Moon: 5/5 (Full Moon) ✅"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
            str = "Moon: 4/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
            str = "Moon: 3/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
            str = "Moon: 2/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
            str = "Moon: 1/5"
        end

        v4:SetText(str)
    end
end)

spawn(function()
    while task.wait(1) do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
            v5:SetText("Mirage Island : ✅")
        else
            v5:SetText("Mirage Island : ❌")
        end
    end
end)

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Auto_Find_Mirage_Island", {
    Text = "Auto Find Mirage Island",
    Default = false,
    Callback = function(autoFindMirage)
        _G.AutoFindMirage = autoFindMirage
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Esp_Mirage_Island", {
    Text = "Esp Mirage Island",
    Default = false,
    Callback = function(espMirage)
        _G.EspMirage = espMirage

        if not espMirage then
            local partMirage = game.Workspace:FindFirstChild("Part_Mirage")

            if partMirage then
                partMirage:Destroy()
            end
        end
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Auto_Tween_To_Mirage_Island", {
    Text = "Auto Tween To Mirage Island",
    Default = false,
    Callback = function(tweenMirage)
        _G.TweenMirage = tweenMirage
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Auto_Tween_To_Highest_Point", {
    Text = "Auto Tween To Highest Point",
    Default = false,
    Callback = function(tweenHighest)
        _G.TweenHighest = tweenHighest
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Auto_Collect_Gear", {
    Text = "Auto Collect Gear",
    Default = false,
    Callback = function(autoGear)
        _G.AutoGear = autoGear
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Change_Transparency_can_see", {
    Text = "Change Transparency can see",
    Default = false,
    Callback = function(canSee)
        _G.CanSee = canSee

        if not canSee then
            local Lighting_ = game:GetService("Lighting")
            Lighting_.FogEnd = 1000

            if Lighting_:FindFirstChild("Sky") then
                Lighting_.Sky.Parent = nil
            end
        end
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Auto_Tween_Advanced_Fruit_Dealer", {
    Text = "Auto Tween Advanced Fruit Dealer",
    Default = false,
    Callback = function(tweenAdvDealer)
        _G.TweenAdvDealer = tweenAdvDealer
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Auto_Collect_Mirage_Chest", {
    Text = "Auto Collect Mirage Chest",
    Default = false,
    Callback = function(autoMirageChest)
        _G.AutoMirageChest = autoMirageChest
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddButton({
    Text = "Talk With Stone",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("MysticIslandTeleport")
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Auto_Look_At_Moon", {
    Text = "Auto Look At Moon",
    Default = false,
    Callback = function(autoMink)
        _G.Auto_Mink = autoMink
    end,
})

GRP_Race_Mystic_Island_Full_Moon:AddToggle("Look_Moon_+_Auto_V3", {
    Text = "Look Moon + Auto V3",
    Default = false,
    Callback = function(lookMoonV3)
        _G.LookMoonV3 = lookMoonV3
    end,
})

local v6 = tbl.Race:AddLeftGroupbox("Races V2 And V3")
GRP_Race_Upgrade_Races_V2_And_V3 = v6

local Auto_Upgrade_Mink = GRP_Race_Upgrade_Races_V2_And_V3:AddToggle("Auto_Upgrade_Mink", {
    Text = "Auto Upgrade Mink",
    Default = false,
    Callback = function(upMink)
        _G.UpMink = upMink
    end,
})

RaceMink = Auto_Upgrade_Mink

local Auto_Upgrade_Human = GRP_Race_Upgrade_Races_V2_And_V3:AddToggle("Auto_Upgrade_Human", {
    Text = "Auto Upgrade Human",
    Default = false,
    Callback = function(upHuman)
        _G.UpHuman = upHuman
    end,
})

RaceHuman = Auto_Upgrade_Human

local Auto_Upgrade_Angel = GRP_Race_Upgrade_Races_V2_And_V3:AddToggle("Auto_Upgrade_Angel", {
    Text = "Auto Upgrade Angel",
    Default = false,
    Callback = function(upAngel)
        _G.UpAngel = upAngel
    end,
})

RaceSky = Auto_Upgrade_Angel

local Auto_Upgrade_FishMan = GRP_Race_Upgrade_Races_V2_And_V3:AddToggle("Auto_Upgrade_FishMan", {
    Text = "Auto Upgrade FishMan",
    Default = false,
    Callback = function(upFish)
        _G.UpFish = upFish
    end,
})

RaceFish = Auto_Upgrade_FishMan
local v7 = tbl.Race:AddLeftGroupbox("Trial Race V4")
GRP_Race_Trials_Quest_V4 = v7
local v8 = GRP_Race_Trials_Quest_V4:AddLabel("")

spawn(function()
    while task.wait(1) do
        local response = replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")

        if response then
            v8:SetText("Current Tier: " .. tostring(response))
        else
            v8:SetText("Current Tier: None")
        end
    end
end)

local Auto_Pull_Lever = GRP_Race_Trials_Quest_V4:AddToggle("Auto_Pull_Lever", {
    Text = "Auto Pull Lever",
    Default = false,
    Callback = function(pullLever)
        _G.PullLever = pullLever
    end,
})

PullLv = Auto_Pull_Lever

local Auto_Train_V4 = GRP_Race_Trials_Quest_V4:AddToggle("Auto_Train_V4", {
    Text = "Auto Train V4",
    Default = false,
    Callback = function(trainV4)
        _G.TrainV4 = trainV4
    end,
})

Train = Auto_Train_V4

GRP_Race_Trials_Quest_V4:AddButton({
    Text = "Teleport to Temple of Time",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("TempleOfTimeTeleport")
    end,
})

GRP_Race_Trials_Quest_V4:AddButton({
    Text = "Teleport to Ancient One",
    Func = function()
        _tp(CFrame.new(28282, 14890, 105))
    end,
})

GRP_Race_Trials_Quest_V4:AddButton({
    Text = "Teleport to Ancient Clock",
    Func = function()
        _tp(CFrame.new(28500, 14890, 105))
    end,
})

local Auto_Teleport_to_Race_Doors = GRP_Race_Trials_Quest_V4:AddToggle("Auto_Teleport_to_Race_Doors", {
    Text = "Auto Teleport to Race Doors",
    Default = false,
    Callback = function(tpDoor)
        _G.TPDoor = tpDoor
    end,
})

Doors = Auto_Teleport_to_Race_Doors

local Auto_Complete_Trial_Race = GRP_Race_Trials_Quest_V4:AddToggle("Auto_Complete_Trial_Race", {
    Text = "Auto Complete Trial Race",
    Default = false,
    Callback = function(completeTrial)
        _G.CompleteTrial = completeTrial
    end,
})

Trials = Auto_Complete_Trial_Race

local Auto_Kill_Player_After_Trial = GRP_Race_Trials_Quest_V4:AddToggle("Auto_Kill_Player_After_Trial", {
    Text = "Auto Kill Player After Trial",
    Default = false,
    Callback = function(killAfterTrial)
        _G.KillAfterTrial = killAfterTrial
    end,
})

AutoKill = Auto_Kill_Player_After_Trial
local Stats = tbl.Esp:AddLeftGroupbox("Stats")
GRP_Esp_Stats_Upgrade = Stats

local v9 = GRP_Esp_Stats_Upgrade:AddSlider({
    Text = "Stats Value",
    Min = 0,
    Max = 1000,
    Default = 10,
    Rounding = 0,
    Callback = function(arg)
        pSats = arg
    end,
})

StatusSelect = v9

local Auto_Melee = GRP_Esp_Stats_Upgrade:AddToggle("Auto_Melee", {
    Text = "Auto Melee",
    Default = false,
    Callback = function(autoMelee)
        _G.Auto_Melee = autoMelee
    end,
})

StatsUpg = Auto_Melee

local Auto_Swords = GRP_Esp_Stats_Upgrade:AddToggle("Auto_Swords", {
    Text = "Auto Swords",
    Default = false,
    Callback = function(autoSword)
        _G.Auto_Sword = autoSword
    end,
})

StatsUpg = Auto_Swords

local Auto_Gun = GRP_Esp_Stats_Upgrade:AddToggle("Auto_Gun", {
    Text = "Auto Gun",
    Default = false,
    Callback = function(autoGun)
        _G.Auto_Gun = autoGun
    end,
})

StatsUpg = Auto_Gun

local Auto_Blox_Fruit = GRP_Esp_Stats_Upgrade:AddToggle("Auto_Blox_Fruit", {
    Text = "Auto Blox Fruit",
    Default = false,
    Callback = function(autoDevilFruit)
        _G.Auto_DevilFruit = autoDevilFruit
    end,
})

StatsUpg = Auto_Blox_Fruit

local Auto_Defense = GRP_Esp_Stats_Upgrade:AddToggle("Auto_Defense", {
    Text = "Auto Defense",
    Default = false,
    Callback = function(autoDefense)
        _G.Auto_Defense = autoDefense
    end,
})

StatsUpg = Auto_Defense
local Esp = tbl.Esp:AddLeftGroupbox("Esp")
GRP_Esp_Esp = Esp
local v10 = Number
local n = v10 or math.random(1, 1000000)
Number = n

GRP_Esp_Esp:AddToggle("Esp_Berry", {
    Text = "Esp Berry",
    Default = false,
    Callback = function(arg)
        BerryEsp = arg

        if arg then
            task.spawn(function()
                while BerryEsp do
                    if berriesEsp then
                        berriesEsp()
                    end

                    task.wait()
                end
            end)
        else
            for i, child in ipairs(workspace:GetChildren()) do
                if child:IsA("Part") and child.Name:match("BerryEspPart_.*") then
                    child:Destroy()
                end
            end
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Player", {
    Text = "Esp Player",
    Default = false,
    Callback = function(arg)
        PlayerEsp = arg

        if arg then
            task.spawn(function()
                while PlayerEsp do
                    if EspPly then
                        EspPly()
                    end

                    task.wait()
                end
            end)
        else
            local v11 = next
            local children, v12 = game.Players:GetChildren()

            for k, v13 in v11, children, v12 do
                pcall(function()
                    if v13.Character and v13.Character:FindFirstChild("Head") and v13.Character.Head:FindFirstChild("NameEsp" .. Number) then
                        v13.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end)
            end
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Chest", {
    Text = "Esp Chest",
    Default = false,
    Callback = function(arg)
        ChestESP = arg

        if arg then
            task.spawn(function()
                while ChestESP do
                    if ChestEsp then
                        ChestEsp()
                    end

                    task.wait()
                end
            end)
        else
            for i, v11 in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
                local chestEspAttachment = v11:FindFirstChild("ChestEspAttachment")

                if chestEspAttachment then
                    chestEspAttachment:Destroy()
                end
            end
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Fruit", {
    Text = "Esp Fruit",
    Default = false,
    Callback = function(arg)
        DevilFruitESP = arg

        if arg then
            task.spawn(function()
                while DevilFruitESP do
                    if DevEsp then
                        DevEsp()
                    end

                    task.wait()
                end
            end)
        else
            local v11 = next
            local children, v12 = workspace:GetChildren()

            for k, v13 in v11, children, v12 do
                pcall(function()
                    if v13:FindFirstChild("Handle") and v13.Handle:FindFirstChild("NameEsp" .. Number) then
                        v13.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end)
            end
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Island", {
    Text = "Esp Island",
    Default = false,
    Callback = function(arg)
        IslandESP = arg

        if arg then
            task.spawn(function()
                while IslandESP do
                    if LocationEsp then
                        LocationEsp()
                    end

                    task.wait()
                end
            end)
        else
            local v11 = next
            local children, v12 = workspace._WorldOrigin.Locations:GetChildren()

            for k, v13 in v11, children, v12 do
                pcall(function()
                    if v13:FindFirstChild("NameEsp") then
                        v13:FindFirstChild("NameEsp"):Destroy()
                    end
                end)
            end
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Flower", {
    Text = "Esp Flower",
    Default = false,
    Callback = function(arg)
        FlowerESP = arg

        if arg then
            task.spawn(function()
                while FlowerESP do
                    if flowerEsp then
                        flowerEsp()
                    end

                    task.wait()
                end
            end)
        else
            for k, child in pairs(workspace:GetChildren()) do
                pcall(function()
                    if (child.Name == "Flower2" or child.Name == "Flower1") and child:FindFirstChild("NameEsp" .. Number) then
                        child:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end)
            end
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Legendary_Sword", {
    Text = "Esp Legendary Sword",
    Default = false,
    Callback = function(arg)
        LegenS = arg

        if arg then
            task.spawn(function()
                while LegenS do
                    if LegenSword then
                        LegenSword()
                    end

                    task.wait()
                end
            end)
        elseif workspace:FindFirstChild("Lgd") then
            workspace:FindFirstChild("Lgd"):Destroy()
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Haki_Color", {
    Text = "Esp Haki Color",
    Default = false,
    Callback = function(arg)
        ColorEsp = arg

        if arg then
            task.spawn(function()
                while ColorEsp do
                    if HakiClorEsp then
                        HakiClorEsp()
                    end

                    task.wait()
                end
            end)
        elseif workspace:FindFirstChild("Gay") then
            workspace:FindFirstChild("Gay"):Destroy()
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Gear", {
    Text = "Esp Gear",
    Default = false,
    Callback = function(arg)
        ESPGear = arg

        if arg then
            task.spawn(function()
                while ESPGear do
                    if gearEsp then
                        gearEsp()
                    end

                    task.wait()
                end
            end)
        else
            local mysticIsland = workspace.Map:FindFirstChild("MysticIsland")
            local v11 = pairs
            local descendants = mysticIsland and mysticIsland:GetDescendants() or {}

            for k, descendant in v11(descendants) do
                pcall(function()
                    if descendant:FindFirstChild("NameEsp") then
                        descendant:FindFirstChild("NameEsp"):Destroy()
                    end
                end)
            end
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_SeaEvent_Island", {
    Text = "Esp SeaEvent Island",
    Default = false,
    Callback = function(arg)
        EspEventIsland = arg

        if arg then
            task.spawn(function()
                while EspEventIsland do
                    if EventIslandEsp then
                        EventIslandEsp()
                    end

                    task.wait()
                end
            end)
        else
            for k, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
                pcall(function()
                    if child:FindFirstChild("NameEsp") then
                        child:FindFirstChild("NameEsp"):Destroy()
                    end
                end)
            end
        end
    end,
})

GRP_Esp_Esp:AddToggle("Esp_Advanced_Dealer", {
    Text = "Esp Advanced Dealer",
    Default = false,
    Callback = function(arg)
        advanEsp = arg

        if arg then
            task.spawn(function()
                while advanEsp do
                    if AdvanFruitEsp then
                        AdvanFruitEsp()
                    end

                    task.wait()
                end
            end)
        elseif workspace:FindFirstChild("Adv") then
            workspace:FindFirstChild("Adv"):Destroy()
        end
    end,
})

local Fruit = tbl.Raids:AddLeftGroupbox("Fruit")
GRP_Raids_Fruits_Options = Fruit

local function fn(arg)
    local str = tostring(arg)
    local str2, v11

    repeat
        str2, v11 = str:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        str = str2
    until v11 == 0

    return str2
end

local function fn2()
    local str = "Advance Fruit Stock\n"

    local ok, result = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", true)
    end)

    if ok and result then
        local flag = false

        for k, v11 in pairs(result) do
            if v11.OnSale then
                flag = true
                str = str .. v11.Name .. " - $" .. fn(v11.Price) .. "\n"
            end
        end

        if not flag then
            str = str .. "- No fruit.\n"
        end
    else
        str = "Advance Fruit Stock\n- Error while retrieving data.\n"
    end

    local str2 = str .. "\nNormal Fruit Stock\n"
    local str3 = str2

    local ok2, result2 = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
    end)

    if ok2 and result2 then
        local flag = false

        for k, v11 in pairs(result2) do
            if v11.OnSale then
                flag = true
                str3 = str3 .. v11.Name .. " - $" .. fn(v11.Price) .. "\n"
            end
        end

        if not flag then
            str3 = str3 .. "- No fruit.\n"
        end
    else
        str3 = str2 .. "- Error while retrieving data.\n"
    end

    return str3
end

local v11 = GRP_Raids_Fruits_Options:AddLabel("Loading...")

task.spawn(function()
    while task.wait(60) do
        pcall(function()
            v11:SetText(fn2())
        end)
    end
end)

pcall(function()
    v11:SetText(fn2())
end)

local Auto_Random_Fruit = GRP_Raids_Fruits_Options:AddToggle("Auto_Random_Fruit", {
    Text = "Auto Random Fruit",
    Default = false,
    Callback = function(randomAuto)
        _G.Random_Auto = randomAuto
    end,
})

RandomFF = Auto_Random_Fruit

local Auto_Drop_Fruit = GRP_Raids_Fruits_Options:AddToggle("Auto_Drop_Fruit", {
    Text = "Auto Drop Fruit",
    Default = false,
    Callback = function(dropFruit)
        _G.DropFruit = dropFruit
    end,
})

DropF = Auto_Drop_Fruit

local Auto_Store_Fruit = GRP_Raids_Fruits_Options:AddToggle("Auto_Store_Fruit", {
    Text = "Auto Store Fruit",
    Default = false,
    Callback = function(storeF)
        _G.StoreF = storeF
    end,
})

StoredF = Auto_Store_Fruit

local Auto_Tween_to_Fruit = GRP_Raids_Fruits_Options:AddToggle("Auto_Tween_to_Fruit", {
    Text = "Auto Tween to Fruit",
    Default = false,
    Callback = function(twFruits)
        _G.TwFruits = twFruits
    end,
})

TwF = Auto_Tween_to_Fruit

local Auto_Collect_Fruit = GRP_Raids_Fruits_Options:AddToggle("Auto_Collect_Fruit", {
    Text = "Auto Collect Fruit",
    Default = false,
    Callback = function(instanceF)
        _G.InstanceF = instanceF
    end,
})

BringF = Auto_Collect_Fruit

GRP_Raids_Fruits_Options:AddDropdown("Select_Fruit_Shop", {
    Text = "Select Fruit Shop",
    Values = {
        "Rocket-Rocket",
        "Spin-Spin",
        "Blade-Blade",
        "Spring-Spring",
        "Bomb-Bomb",
        "Smoke-Smoke",
        "Spike-Spike",
        "Flame-Flame",
        "Ice-Ice",
        "Sand-Sand",
        "Dark-Dark",
        "Eagle-Eagle",
        "Diamond-Diamond",
        "Light-Light",
        "Rubber-Rubber",
        "Ghost-Ghost",
        "Magma-Magma",
        "Quake-Quake",
        "Buddha-Buddha",
        "Love-Love",
        "Creation-Creation",
        "Spider-Spider",
        "Sound-Sound",
        "Phoenix-Phoenix",
        "Portal-Portal",
        "Lightning-Lightning",
        "Pain-Pain",
        "Blizzard-Blizzard",
        "Gravity-Gravity",
        "T-Rex-T-Rex",
        "Mammoth-Mammoth",
        "Dough-Dough",
        "Shadow-Shadow",
        "Venom-Venom",
        "Gas-Gas",
        "Control-Control",
        "Spirit-Spirit",
        "Leopard-Leopard",
        "Yeti-Yeti",
        "Kitsune-Kitsune",
        "Dragon-Dragon",
    },
    Default = 1,
    Callback = function(selectFruit)
        getgenv().SelectFruit = selectFruit
    end,
})

GRP_Raids_Fruits_Options:AddToggle("Auto_Buy_Fruit_Shop", {
    Text = "Auto Buy Fruit Shop",
    Default = false,
    Callback = function(autoBuyFruitSniper)
        getgenv().AutoBuyFruitSniper = autoBuyFruitSniper
    end,
})

local Raid = tbl.Raids:AddLeftGroupbox("Raid")
GRP_Raids_Dungeon_Event_Raiding = Raid

DungeonTables = {
    "Flame",
    "Ice",
    "Quake",
    "Light",
    "Dark",
    "String",
    "Rumble",
    "Magma",
    "Human: Buddha",
    "Sand",
    "Bird: Phoenix",
    "Dough",
}

local Select_Chip = GRP_Raids_Dungeon_Event_Raiding:AddDropdown("Select_Chip", {
    Text = "Select Chip",
    Values = DungeonTables,
    Default = 1,
    Callback = function(selectChip)
        _G.SelectChip = selectChip
    end,
})

Q = Select_Chip

local Auto_Select_Dungeon_Chip = GRP_Raids_Dungeon_Event_Raiding:AddToggle("Auto_Select_Dungeon_Chip", {
    Text = "Auto Select Raid Chip",
    Default = false,
    Callback = function(autoSelectDungeon)
        _G.AutoSelectDungeon = autoSelectDungeon
    end,
})

Q = Auto_Select_Dungeon_Chip

GRP_Raids_Dungeon_Event_Raiding:AddToggle("Get_Fruit_In_Inventory_Below_1M", {
    Text = "Get Fruit In Inventory Below 1M",
    Default = false,
    Callback = function(autoGetFruit)
        getgenv().AutoGetFruit = autoGetFruit
    end,
})

GRP_Raids_Dungeon_Event_Raiding:AddButton({
    Text = "Buy Dungeon Chips Beli",
    Func = function()
        if not GetBP("Special Microchip") then
            replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
        end
    end,
})

GRP_Raids_Dungeon_Event_Raiding:AddButton({
    Text = "Buy Dungeon Chips Fruit",
    Func = function()
        if GetBP("Special Microchip") then
            return
        end
        local tbl2 = {}
        local v12 = next
        local response, v13 = replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")

        for k, v14 in v12, response, v13 do
            if v14.Price <= 490000 then
                table.insert(tbl2, v14.Name)
            end
        end

        local v14, v15, v16 = pairs(tbl2)
        local v17 = v16
        local v18 = v14
        local v19 = v15

        while true do
            local v20, v21 = v18(v19, v17)
            if v20 == nil then
                break
            end

            for k in pairs(DungeonTables) do
                if not GetBP("Special Microchip") then
                    replicated.Remotes.CommF_:InvokeServer("LoadFruit", tostring(v21))
                    replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                end
            end

            v17 = v20
        end
    end,
})

local v12 = GRP_Raids_Dungeon_Event_Raiding:AddToggle("Auto_Buy_Chip_[Beli]", {
    Text = "Auto Buy Chip Beli",
    Default = false,
    Callback = function(autoChipBeli)
        _G.AutoChipBeli = autoChipBeli
    end,
})

AutoChipBeli = v12

local v13 = GRP_Raids_Dungeon_Event_Raiding:AddToggle("Auto_Buy_Chip_[Devil_Fruit]", {
    Text = "Auto Buy Chip Fruit",
    Default = false,
    Callback = function(autoChipFruit)
        _G.AutoChipFruit = autoChipFruit
    end,
})

AutoChipFruit = v13

local Auto_Start_Raid = GRP_Raids_Dungeon_Event_Raiding:AddToggle("Auto_Start_Raid", {
    Text = "Auto Start Raid",
    Default = false,
    Callback = function(autoStartRaid)
        _G.Auto_StartRaid = autoStartRaid
    end,
})

StartR = Auto_Start_Raid

local v14 = GRP_Raids_Dungeon_Event_Raiding:AddToggle("Auto_Raid_+_Next_Island", {
    Text = "Auto Raid + Next Island",
    Default = false,
    Callback = function(raiding)
        _G.Raiding = raiding
    end,
})

Raiding = v14

local v15 = GRP_Raids_Dungeon_Event_Raiding:AddToggle("Kill_Aura_(Island_4_&_5)", {
    Text = "Kill Aura (Island 4 & 5)",
    Default = false,
    Callback = function(killAuraRaid)
        _G.KillAuraRaid = killAuraRaid
    end,
})

KillAuraRaid = v15

GRP_Raids_Dungeon_Event_Raiding:AddToggle("Auto_Awakening", {
    Text = "Auto Awakening",
    Default = false,
    Callback = function(autoAwakener)
        _G.Auto_Awakener = autoAwakener
    end,
})

GRP_Raids_Dungeon_Event_Raiding:AddToggle("Auto_Teleport_To_Lab", {
    Text = "Auto Teleport To Lab",
    Default = false,
    Callback = function(tpLab)
        _G.TpLab = tpLab

        while _G.TpLab do
            task.wait()

            if _G.TpLab then
                if World2 and _G.TpLab then
                    _tp(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                elseif World3 and _G.TpLab then
                    _tp(CFrame.lookAt(Vector3.new(-5046, 314, -2960), Vector3.new(-5055, 314, -2957)))
                end
            end
        end
    end,
})

local Law = tbl.Raids:AddLeftGroupbox("Law")
GRP_Raids_Items_Law_Order_Sword = Law

GRP_Raids_Items_Law_Order_Sword:AddButton({
    Text = "Buy Microchip Law",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
    end,
})

GRP_Raids_Items_Law_Order_Sword:AddButton({
    Text = "Start Law",
    Func = function()
        fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
    end,
})

GRP_Raids_Items_Law_Order_Sword:AddToggle("Auto_Buy_Microchip_Law", {
    Text = "Auto Buy Microchip Law",
    Default = false,
    Callback = function(autoBuyMicrochipLaw)
        getgenv().AutoBuyMicrochipLaw = autoBuyMicrochipLaw
    end,
})

GRP_Raids_Items_Law_Order_Sword:AddToggle("Auto_Start_Law_Raids", {
    Text = "Auto Start Law",
    Default = false,
    Callback = function(autoStartLawRaids)
        getgenv().AutoStartLawRaids = autoStartLawRaids
    end,
})

GRP_Raids_Items_Law_Order_Sword:AddToggle("Auto_Kill_Law", {
    Text = "Auto Kill Law",
    Default = false,
    Callback = function(autoLawKak)
        _G.AutoLawKak = autoLawKak
    end,
})

local Dungeon = tbl.Raids:AddLeftGroupbox("Dungeon")
GRP_Raids_Raids_Dungeons = Dungeon

GRP_Raids_Raids_Dungeons:AddToggle("Auto_Farm_Dungeon", {
    Text = "Auto Dungeon",
    Default = false,
    Callback = function(autoFarmDungeon)
        _G.AutoFarmDungeon = autoFarmDungeon
    end,
})

GRP_Raids_Raids_Dungeons:AddToggle("TP_Exit_(1)", {
    Text = "TP Exit (1)",
    Default = false,
    Callback = function(tpFloor1)
        _G.TPFloor1 = tpFloor1
    end,
})

GRP_Raids_Raids_Dungeons:AddToggle("TP_Exit_(2)", {
    Text = "TP Exit (2)",
    Default = false,
    Callback = function(tpFloor2)
        _G.TPFloor2 = tpFloor2
    end,
})

GRP_Raids_Raids_Dungeons:AddToggle("TP_Exit_(3)", {
    Text = "TP Exit (3)",
    Default = false,
    Callback = function(tpFloor3)
        _G.TPFloor3 = tpFloor3
    end,
})

GRP_Raids_Raids_Dungeons:AddToggle("TP_Exit_(4)", {
    Text = "TP Exit (4)",
    Default = false,
    Callback = function(tpFloor4)
        _G.TPFloor4 = tpFloor4
    end,
})

local Combat = tbl.Combat:AddLeftGroupbox("Combat")
GRP_Combat_Combat_AimBot = Combat
local v16 = GRP_Combat_Combat_AimBot:AddLabel("")

spawn(function()
    while true do
        local v17 = wait
        local v18 = Sec
        local n2 = v18 or 0.1
        if not v17(n2) then
            break
        end

        pcall(function()
            local n3 = #game:GetService("Players"):GetPlayers()

            if n3 == 12 then
                v16:SetText("All Players : " .. n3 .. " / 12 [Max]")
            else
                v16:SetText("All Players : " .. n3 .. " / 12")
            end
        end)
    end
end)

local v17 = GRP_Combat_Combat_AimBot:AddLabel("")

Checking_AimStatus = function()
    if _G.AimCam then
        return "Aimbot Camera"
    end

    if not _G.AimbotGun then
        return ""
    end
    return "Aimbot Guns"
end

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.AimMethod then
                if not _G.AimCam and not _G.AimbotGun then
                    v17:SetText("Aimbot - Skills : True")
                else
                    v17:SetText("Aimbot - " .. Checking_AimStatus() .. " : True")
                end
            else
                v17:SetText("Aimbot - Skills : False")
            end
        end)
    end
end)

local tbl2 = {}

for k, child in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(tbl2, child.Name)
end

GRP_Combat_Combat_AimBot:AddDropdown("Select_Players", {
    Text = "Select Players",
    Values = tbl2,
    Default = 1,
    Callback = function(playersList)
        _G.PlayersList = playersList
    end,
})

GRP_Combat_Combat_AimBot:AddToggle("Teleport_To_Select_Players", {
    Text = "Teleport To Select Players",
    Default = false,
    Callback = function(tpPly)
        _G.TpPly = tpPly

        spawn(function()
            pcall(function()
                while _G.TpPly do
                    task.wait()
                    local v18 = game:GetService("Players"):FindFirstChild(_G.PlayersList)

                    if v18 and v18.Character and v18.Character:FindFirstChild("HumanoidRootPart") then
                        _tp(v18.Character.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end)
    end,
})

GRP_Combat_Combat_AimBot:AddToggle("Spectate_Select_Players", {
    Text = "Spectate Select Players",
    Default = false,
    Callback = function(arg)
        SpectatePlys = arg

        spawn(function()
            repeat
                task.wait(0.1)

                if _G.PlayersList and game:GetService("Players"):FindFirstChild(_G.PlayersList) then
                    workspace.Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.PlayersList).Character:FindFirstChild("Humanoid")
                end
            until not SpectatePlys

            if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
                workspace.Camera.CameraSubject = plr.Character.Humanoid
            end
        end)
    end,
})

GRP_Combat_Combat_AimBot:AddDropdown("Select_Aim_Method", {
    Text = "Select Aim Method",
    Values = {"Aim Player", "Nearest Aim"},
    Default = 1,
    Callback = function(arg)
        ABmethod = arg
    end,
})

GRP_Combat_Combat_AimBot:AddToggle("Aimbot_Method_Skills", {
    Text = "Aimbot Method Skills",
    Default = false,
    Callback = function(aimMethod)
        _G.AimMethod = aimMethod
    end,
})

GRP_Combat_Combat_AimBot:AddToggle("Aimbot_Camera_Closet_Players", {
    Text = "Aimbot Camera Closet Players",
    Default = false,
    Callback = function(aimCam)
        _G.AimCam = aimCam
    end,
})

local v18 = tbl.Combat:AddLeftGroupbox("Quests Players")
GRP_Combat_Quests_Players = v18

GRP_Combat_Quests_Players:AddButton({
    Text = "Get player quests",
    Func = function()
        pcall(function()
            replicated.Remotes.CommF_:InvokeServer("PlayerHunter")
        end)
    end,
})

GRP_Combat_Quests_Players:AddToggle("Auto_Get_PlayerQuest", {
    Text = "Auto Get PlayerQuest",
    Default = false,
    Callback = function(autoReceivePlayerQuest)
        _G.AutoReceivePlayerQuest = autoReceivePlayerQuest
    end,
})

GRP_Combat_Quests_Players:AddToggle("Auto_Kill_Player_Quest", {
    Text = "Auto Kill Player Quest",
    Default = false,
    Callback = function(autoPlayerHunter)
        _G.AutoPlayerHunter = autoPlayerHunter

        if not autoPlayerHunter then
            Useskill = false
        end
    end,
})

GRP_Combat_Quests_Players:AddToggle("Auto_Enable_PvP", {
    Text = "Auto Enable PvP",
    Default = false,
    Callback = function(autoPvP)
        _G.AutoPvP = autoPvP
    end,
})

GRP_Combat_Quests_Players:AddToggle("Auto_Safe_Mode", {
    Text = "Auto Safe Mode",
    Default = false,
    Callback = function(safeMode)
        _G.SafeMode = safeMode
    end,
})

local v19 = tbl.Combat:AddLeftGroupbox("Local Player Settings")
GRP_Combat_LocalPlayer_Settings = v19
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local flag = false
local n2 = 50
local connection = nil
local tbl3 = {}
tbl3.f = 0
tbl3.b = 0
tbl3.l = 0
tbl3.r = 0
local bodyGyro = nil
local bodyVelocity = nil

local function fn3()
    local function fn4()
        local character = localPlayer.Character
        if not character then
            return
        end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then
            return
        end
        local moveDirection = humanoid.MoveDirection
        tbl3.f = 0
        tbl3.b = 0
        tbl3.l = 0
        tbl3.r = 0

        if moveDirection.Z < -0.1 then
            tbl3.f = 1
        elseif moveDirection.Z > 0.1 then
            tbl3.b = 1
        end

        if moveDirection.X < -0.1 then
            tbl3.l = 1
        elseif moveDirection.X > 0.1 then
            tbl3.r = 1
        end
    end

    local connection2 = nil

    connection2 = RunService.Heartbeat:Connect(function()
        if flag then
            fn4()
        elseif connection2 then
            connection2:Disconnect()
        end
    end)
end

local function fn4(arg)
    flag = arg

    if flag then
        if not localPlayer.Character then
            return
        end
        local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
        local torso

        if localPlayer.Character:FindFirstChild("Torso") then
            torso = localPlayer.Character.Torso
        else
            torso = localPlayer.Character.UpperTorso
        end

        if not humanoid or not torso then
            return
        end

        for i, descendant in ipairs(localPlayer.Character:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.CanCollide = false
                descendant.Massless = true
            end
        end

        bodyGyro = Instance.new("BodyGyro", torso)
        bodyGyro.P = 90000
        local vector = Vector3.new(9000000000, 9000000000, 9000000000)
        bodyGyro.maxTorque = vector
        bodyGyro.cframe = torso.CFrame
        bodyVelocity = Instance.new("BodyVelocity", torso)
        local vector2 = Vector3.new(0, 0, 0)
        bodyVelocity.velocity = vector2
        local vector3 = Vector3.new(9000000000, 9000000000, 9000000000)
        bodyVelocity.maxForce = vector3
        humanoid.PlatformStand = true
        fn3()

        connection = RunService.Heartbeat:Connect(function()
            if not flag or not localPlayer.Character then
                return
            end

            for i, descendant in ipairs(localPlayer.Character:GetDescendants()) do
                if descendant:IsA("BasePart") and descendant.CanCollide then
                    descendant.CanCollide = false
                end
            end

            if tbl3.l + tbl3.r == 0 and tbl3.f + tbl3.b == 0 then
                local vector4 = Vector3.new(0, 0, 0)
                bodyVelocity.velocity = vector4
            else
                local velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (tbl3.f + tbl3.b) + (workspace.CurrentCamera.CoordinateFrame * CFrame.new(tbl3.l + tbl3.r, (tbl3.f + tbl3.b) * 0.2, 0).p - workspace.CurrentCamera.CoordinateFrame.p)) * n2
                bodyVelocity.velocity = velocity
            end

            bodyGyro.cframe = workspace.CurrentCamera.CoordinateFrame
        end)
    else
        if connection then
            connection:Disconnect()
            connection = nil
        end

        if localPlayer.Character then
            local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")

            if humanoid then
                humanoid.PlatformStand = false
            end

            for i, descendant in ipairs(localPlayer.Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.CanCollide = true
                    descendant.Massless = false
                end
            end

            if bodyGyro then
                bodyGyro:Destroy()
            end

            if bodyVelocity then
                bodyVelocity:Destroy()
            end
        end

        tbl3 = {f = 0, b = 0, l = 0, r = 0}
    end
end

local function fn5(arg)
    n2 = arg
end

GRP_Combat_LocalPlayer_Settings:AddToggle("Enable_Fly", {
    Text = "Enable Fly",
    Default = false,
    Callback = function(arg)
        fn4(arg)
    end,
})

GRP_Combat_LocalPlayer_Settings:AddSlider({
    Text = "Speed Fly Mode",
    Min = 10,
    Max = 200,
    Default = 50,
    Rounding = 0,
    Callback = function(arg)
        fn5(arg)
    end,
})

GRP_Combat_LocalPlayer_Settings:AddToggle("Dash_No_Cooldown", {
    Text = "Dash No Cooldown",
    Default = false,
    Callback = function(dodgeNoCD)
        getgenv().DodgeNoCD = dodgeNoCD
    end,
})

GRP_Combat_LocalPlayer_Settings:AddToggle("Instance_Mink_V3_[_INF_]", {
    Text = "Instance Mink V3 [ INF ]",
    Default = false,
    Callback = function(arg)
        InfAblities = arg
    end,
})

GRP_Combat_LocalPlayer_Settings:AddToggle("Instance_Energy_[_INF_]", {
    Text = "Instance Energy [ INF ]",
    Default = false,
    Callback = function(arg)
        infEnergy = arg

        if arg and getInfinity_Ability then
            getInfinity_Ability("Energy", infEnergy)
        end
    end,
})

GRP_Combat_LocalPlayer_Settings:AddToggle("Instance_Soru_[_INF_]", {
    Text = "Instance Soru [ INF ]",
    Default = false,
    Callback = function(infSoru)
        _G.InfSoru = infSoru

        if infSoru and getInfinity_Ability then
            getInfinity_Ability("Soru", _G.InfSoru)
        end
    end,
})

GRP_Combat_LocalPlayer_Settings:AddToggle("Instance_Observation_Range_[_INF_]", {
    Text = "Instance Observation Range [ INF ]",
    Default = false,
    Callback = function(infiniteObRange)
        _G.InfiniteObRange = infiniteObRange

        if infiniteObRange and getInfinity_Ability then
            getInfinity_Ability("Observation", _G.InfiniteObRange)
        end
    end,
})

GRP_Combat_LocalPlayer_Settings:AddToggle("Ignore_Same_Teams", {
    Text = "Ignore Same Teams",
    Default = false,
    Callback = function(noAimTeam)
        _G.NoAimTeam = noAimTeam
    end,
})

GRP_Combat_LocalPlayer_Settings:AddToggle("Accept_Allies", {
    Text = "Accept Allies",
    Default = false,
    Callback = function(acceptAlly)
        _G.AcceptAlly = acceptAlly
    end,
})

local Sea = tbl.Travel:AddLeftGroupbox("Sea")
GRP_Travel_Travel_Worlds = Sea

GRP_Travel_Travel_Worlds:AddButton({
    Text = "Travel Sea 1",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("TravelMain")
    end,
})

GRP_Travel_Travel_Worlds:AddButton({
    Text = "Travel Sea 2",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
    end,
})

GRP_Travel_Travel_Worlds:AddButton({
    Text = "Travel Sea 3",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("TravelZou")
    end,
})

local Island = tbl.Travel:AddLeftGroupbox("Island")
GRP_Travel_Travel_Island = Island
Location = {}

for k, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
    table.insert(Location, child.Name)
end

GRP_Travel_Travel_Island:AddDropdown("Select_Travelling", {
    Text = "Select Island",
    Values = Location,
    Default = 1,
    Callback = function(island)
        _G.Island = island
    end,
})

GRP_Travel_Travel_Island:AddToggle("Auto_Travel", {
    Text = "Auto Teleport",
    Default = false,
    Callback = function(teleport)
        local v20, v21, v22, v23, v24, v25, n3
        n3 = 1

        while true do
            if n3 == 1 then
                _G.Teleport = teleport

                if teleport then
                    n3 = 2
                else
                    n3 = 6
                end
            elseif n3 == 2 then
                v20, v21, v22 = pairs(workspace._WorldOrigin.Locations:GetChildren())
                v23 = v22
                n3 = 3
            elseif n3 == 3 then
                v24, v25 = v20(v21, v23)

                if v24 == nil then
                    n3 = 6
                else
                    n3 = 4
                end
            elseif n3 == 4 then
                v23 = v24

                if v25.Name == _G.Island then
                    n3 = 5
                else
                    n3 = 3
                end
            elseif n3 == 5 then
                wait()
                _tp(v25.CFrame * CFrame.new(0, 30, 0))

                if _G.Teleport and (not Root or Root.CFrame ~= v25.CFrame) then
                    n3 = 5
                else
                    n3 = 3
                end
            elseif n3 == 6 then
                return
            end
        end
    end,
})

local Portal = tbl.Travel:AddLeftGroupbox("Portal")
GRP_Travel_Travel_Portal = Portal

if World1 then
    Location_Portal = {"Sky", "UnderWater"}
elseif World2 then
    Location_Portal = {"SwanRoom", "Cursed Ship"}
elseif World3 then
    Location_Portal = {
        "Castle On The Sea",
        "Mansion Cafe",
        "Hydra Teleport",
        "Canvendish Room",
        "Temple of Time",
    }
end

local v20 = GRP_Travel_Travel_Portal
local addDropdown = v20.AddDropdown
local tbl4 = {Text = "Select Portal"}
local v21 = Location_Portal
local values = v21 or {}
tbl4.Values = values
tbl4.Default = 1

tbl4.Callback = function(islandPt)
    _G.Island_PT = islandPt
end

addDropdown(v20, "Select_Portal", tbl4)

GRP_Travel_Travel_Portal:AddButton({
    Text = "Teleport Portal",
    Func = function()
        if _G.Island_PT then
            pcall(function()
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", _G.Island_PT)
            end)
        end
    end,
})

local npc = tbl.Travel:AddLeftGroupbox("NPC")
GRP_Travel_Travel_NPCs = npc

for k, child in pairs(replicated.NPCs:GetChildren()) do
    table.insert(NPCList, child.Name)
end

GRP_Travel_Travel_NPCs:AddDropdown("Select_NPCs", {
    Text = "Select NPC",
    Values = NPCList,
    Default = 1,
    Callback = function(selectNPC)
        _G.SelectNPC = selectNPC
        NPClist = selectNPC
    end,
})

GRP_Travel_Travel_NPCs:AddToggle("Auto_Tween_to_NPC", {
    Text = "Tween to NPC",
    Default = false,
    Callback = function(tpNpc)
        _G.TPNpc = tpNpc
        _G.TPNpc_Toggle = tpNpc

        if tpNpc then
            spawn(function()
                while _G.TPNpc_Toggle do
                    local v22 = wait
                    local v23 = Sec
                    local n3 = v23 or 0.1
                    v22(n3)

                    pcall(function()
                        for k, child in pairs(replicated.NPCs:GetChildren()) do
                            local name = child.Name
                            local selectNPC = _G.SelectNPC
                            local v24 = selectNPC or NPClist

                            if name == v24 and child:FindFirstChild("HumanoidRootPart") then
                                _tp(child.HumanoidRootPart.CFrame)
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

local Shop = tbl.Shop:AddLeftGroupbox("Shop")
GRP_Shop_Shop_Options = Shop

GRP_Shop_Shop_Options:AddButton({
    Text = "Buy Buso",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    end,
})

GRP_Shop_Shop_Options:AddButton({
    Text = "Buy Geppo",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
    end,
})

GRP_Shop_Shop_Options:AddButton({
    Text = "Buy Soru",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    end,
})

GRP_Shop_Shop_Options:AddButton({
    Text = "Buy Ken",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("KenTalk", "Buy")
    end,
})

local v22 = tbl.Shop:AddLeftGroupbox("Fighting Style")
GRP_Shop_Fighting_Style = v22

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy Black Leg",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy Electro",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyElectro")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy Fishman Karate",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy DragonClaw",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy Superhuman",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy Death Step",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy Sharkman Karate",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy ElectricClaw",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy DragonTalon",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy Godhuman",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
    end,
})

GRP_Shop_Fighting_Style:AddButton({
    Text = "Buy SanguineArt",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
    end,
})

local Accessories = tbl.Shop:AddLeftGroupbox("Accessories")
GRP_Shop_Accessory = Accessories

GRP_Shop_Accessory:AddButton({
    Text = "Buy Tomoe Ring",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
    end,
})

GRP_Shop_Accessory:AddButton({
    Text = "Buy Black Cape",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
    end,
})

GRP_Shop_Accessory:AddButton({
    Text = "Buy Swordsman Hat",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
    end,
})

GRP_Shop_Accessory:AddButton({
    Text = "Buy Bizarre Rifle",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
    end,
})

GRP_Shop_Accessory:AddButton({
    Text = "Buy Ghoul Mask",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 2)
    end,
})

local Weapon = tbl.Shop:AddLeftGroupbox("Weapon")
GRP_Shop_Weapon_World1 = Weapon

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Cutlass",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Katana",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Iron Mace",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Duel Katana",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Triple Katana",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Pipe",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Dual-Headed Blade",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Bisento",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Soul Cane",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Slingshot",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Musket",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Musket")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Dual Flintlock",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Flintlock",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Refined Flintlock",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Cannon",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
    end,
})

GRP_Shop_Weapon_World1:AddButton({
    Text = "Buy Kabucha",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
    end,
})

local Fragment = tbl.Shop:AddLeftGroupbox("Fragment")
GRP_Shop_Fragments_shop = Fragment

GRP_Shop_Fragments_shop:AddButton({
    Text = "Buy Refund Stats",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
    end,
})

GRP_Shop_Fragments_shop:AddButton({
    Text = "Buy Reroll Race",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
    end,
})

GRP_Shop_Fragments_shop:AddButton({
    Text = "Buy Ghoul Race",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("Ectoplasm", " Change", 4)
    end,
})

GRP_Shop_Fragments_shop:AddButton({
    Text = "Buy Cyborg Race (2.5k)",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("CyborgTrainer", " Buy")
    end,
})

GRP_Shop_Fragments_shop:AddButton({
    Text = "Buy Draco Race",
    Func = function()
        task.spawn(function()
            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
            local vector = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)

            repeat
                task.wait()
            until plr.Character and plr.Character.HumanoidRootPart and (plr.Character.HumanoidRootPart.Position - vector).Magnitude < 1

            replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({{NPC = "Dragon Wizard", Command = "DragonRace"}}))
        end)
    end,
})

local Server = tbl.Misc:AddLeftGroupbox("Server")
GRP_Misc_Server_Function = Server

GRP_Misc_Server_Function:AddButton({
    Text = "Redeem All Codes",
    Func = function()
        local tbl5 = {
            "LIGHTNINGABUSE",
            "1LOSTADMIN",
            "ADMINFIGHT",
            "GIFTING_HOURS",
            "NOMOREHACK",
            "BANEXPLOIT",
            "WildDares",
            "BossBuild",
            "GetPranked",
            "EARN_FRUITS",
            "SUB2GAMERROBOT_RESET1",
            "KITT_RESET",
            "Bignews",
            "CHANDLER",
            "Fudd10",
            "fudd10_v2",
            "Sub2UncleKizaru",
            "FIGHT4FRUIT",
            "kittgaming",
            "TRIPLEABUSE",
            "Sub2CaptainMaui",
            "Sub2Fer999",
            "Enyu_is_Pro",
            "Magicbus",
            "JCWK",
            "Starcodeheo",
            "Bluxxy",
            "SUB2GAMERROBOT_EXP1",
            "Sub2NoobMaster123",
            "Sub2Daigrock",
            "Axiore",
            "TantaiGaming",
            "StrawHatMaine",
            "Sub2OfficialNoobie",
            "TheGreatAce",
            "JULYUPDATE_RESET",
            "ADMINHACKED",
            "SEATROLLING",
            "24NOADMIN",
            "ADMIN_TROLL",
            "NEWTROLL",
            "SECRET_ADMIN",
            "staffbattle",
            "NOEXPLOIT",
            "NOOB2ADMIN",
            "CODESLIDE",
            "fruitconcepts",
            "krazydares",
        }

        local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
        local redeem = remotes:FindFirstChild("Redeem")
        if not redeem then
            return
        end

        for i, v23 in ipairs(tbl5) do
            task.wait(0)

            pcall(function()
                if redeem.InvokeServer then
                    redeem:InvokeServer(v23)
                else
                    redeem:FireServer(v23)
                end
            end)
        end
    end,
})

GRP_Misc_Server_Function:AddButton({
    Text = "Rejoin Server",
    Func = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end,
})

GRP_Misc_Server_Function:AddButton({
    Text = "Hop Server",
    Func = function()
        task.spawn(function()
            local HttpService = game:GetService("HttpService")
            local TeleportService = game:GetService("TeleportService")
            local placeId = game.PlaceId
            local Players2 = game:GetService("Players")

            local ok, result = pcall(function()
                local response = game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100")
                return HttpService:JSONDecode(response).data
            end)

            if ok and result then
                local id = nil

                for k, v23 in pairs(result) do
                    if v23.playing < v23.maxPlayers then
                        id = v23.id
                    end
                end

                if id then
                    pcall(function()
                        TeleportService:TeleportToPlaceInstance(placeId, id, Players2.LocalPlayer)
                    end)
                end
            end
        end)
    end,
})

GRP_Misc_Server_Function:AddButton({
    Text = "Hop to Lowest Players",
    Func = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local placeId = game.PlaceId
        local str = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"

        local function fn6(arg)
            local v23 = game
            local httpGet = v23.HttpGet
            local str2 = arg and "&cursor=" .. arg or ""
            local v24 = httpGet(v23, str .. str2)
            return HttpService:JSONDecode(v24)
        end

        local nextPageCursor = nil
        local v23, v24

        repeat
            v23 = fn6(nextPageCursor)
            v24 = v23.data[1]
            nextPageCursor = v23.nextPageCursor
        until v24

        TeleportService:TeleportToPlaceInstance(placeId, v24.id, plr)
    end,
})

GRP_Misc_Server_Function:AddButton({
    Text = "Hop to Lowest Pings Server",
    Func = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local Stats2 = game:GetService("Stats")
        local placeId = game.PlaceId

        local v23 = (function(arg, arg2)
            local str = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", arg, arg2)

            local ok, result = pcall(function()
                return HttpService:JSONDecode(game:HttpGet(str))
            end)

            if ok and result and result.data then
                return result.data
            end
            return nil
        end)(placeId, 100)

        if not v23 then
            return
        end
        local v24 = v23[1]

        for k, v25 in pairs(v23) do
            if v25.ping < v24.ping and v25.playing < v25.maxPlayers then
                v24 = v25
            end
        end

        local valueString = Stats2.Network.ServerStatsItem["Data Ping"]:GetValueString()

        if tonumber(valueString:match("(%d+)")) >= 100 then
            TeleportService:TeleportToPlaceInstance(placeId, v24.id)
        end
    end,
})

GRP_Misc_Server_Function:AddInput("Input_Job_Id", {
    Text = "Input Job Id",
    Default = "",
    Placeholder = "Job ID",
    Callback = function(rechat)
        _G.Rechat = rechat
    end,
})

GRP_Misc_Server_Function:AddButton({
    Text = "Teleport [Job ID]",
    Func = function()
        if _G.Rechat and _G.Rechat ~= "" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, _G.Rechat, plr)
        end
    end,
})

GRP_Misc_Server_Function:AddButton({
    Text = "Copy JobID",
    Func = function()
        setclipboard(tostring(game.JobId))
    end,
})

local gui = tbl.Misc:AddLeftGroupbox("GUI")
GRP_Misc_Player_Gui_Others = gui

GRP_Misc_Player_Gui_Others:AddButton({
    Text = "Open Awakenings Expert",
    Func = function()
        if plr and plr.PlayerGui and plr.PlayerGui.Main and plr.PlayerGui.Main:FindFirstChild("AwakeningToggler") then
            plr.PlayerGui.Main.AwakeningToggler.Visible = true
        end
    end,
})

GRP_Misc_Player_Gui_Others:AddButton({
    Text = "Open Title Selection",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("getTitles", true)

        if plr and plr.PlayerGui and plr.PlayerGui.Main and plr.PlayerGui.Main:FindFirstChild("Titles") then
            plr.PlayerGui.Main.Titles.Visible = true
        end
    end,
})

local Disable_Chat_GUI = GRP_Misc_Player_Gui_Others:AddToggle("Disable_Chat_GUI", {
    Text = "Disable Chat GUI",
    Default = false,
    Callback = function(rechat)
        _G.Rechat = rechat
        local StarterGui = game:GetService("StarterGui")

        if _G.Rechat == true then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
        else
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        end
    end,
})

DisbleChat = Disable_Chat_GUI

local Disable_Leader_Board_GUI = GRP_Misc_Player_Gui_Others:AddToggle("Disable_Leader_Board_GUI", {
    Text = "Disable Leader Board GUI",
    Default = false,
    Callback = function(arg)
        ReLeader = arg
        local StarterGui = game:GetService("StarterGui")

        if ReLeader == true then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
        else
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
        end
    end,
})

DisbleLeaderB = Disable_Leader_Board_GUI
local v23 = tbl.Misc:AddLeftGroupbox("Boost FPS")
GRP_Misc_Graphics_Haki_Stats = v23

local Turn_on_RTX_Mode = GRP_Misc_Graphics_Haki_Stats:AddToggle("Turn_on_RTX_Mode", {
    Text = "Turn on RTX Mode",
    Default = false,
    Callback = function(rtxMode)
        _G.RTXMode = rtxMode
        local lighting = game.Lighting

        for k, child in pairs(lighting:GetChildren()) do
            if child.Name == "RTXColorCorrection" or child.Name == "RTXTint" then
                child:Destroy()
            end
        end

        if _G.RTXMode then
            local colorCorrectionEffect = Instance.new("ColorCorrectionEffect", lighting)
            colorCorrectionEffect.Name = "RTXColorCorrection"
            local colorCorrectionEffect2 = Instance.new("ColorCorrectionEffect", lighting)
            colorCorrectionEffect2.Name = "RTXTint"
            OldAmbient = lighting.Ambient
            OldBrightness = lighting.Brightness
            OldColorShift_Top = lighting.ColorShift_Top
            colorCorrectionEffect.Brightness = 0.176
            colorCorrectionEffect.Contrast = 0.39
            colorCorrectionEffect.TintColor = Color3.fromRGB(217, 145, 57)
            colorCorrectionEffect2.TintColor = Color3.fromRGB(217, 145, 57)
            lighting.FogEnd = 999

            spawn(function()
                while _G.RTXMode do
                    wait()
                    lighting.Ambient = Color3.fromRGB(33, 33, 33)
                    lighting.Brightness = 0.3
                    if not _G.RTXMode then
                        break
                    end

                    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and not plr.Character.HumanoidRootPart:FindFirstChild("RTXPointLight") then
                        local pointLight = Instance.new("PointLight")
                        pointLight.Name = "RTXPointLight"
                        pointLight.Parent = plr.Character.HumanoidRootPart
                        pointLight.Range = 15
                        pointLight.Color = Color3.fromRGB(217, 145, 57)
                    end
                end
            end)
        else
            pcall(function()
                if OldAmbient then
                    lighting.Ambient = OldAmbient
                end

                if OldBrightness then
                    lighting.Brightness = OldBrightness
                end

                if OldColorShift_Top then
                    lighting.ColorShift_Top = OldColorShift_Top
                end

                lighting.FogEnd = 2500
            end)

            for k, child in pairs(lighting:GetChildren()) do
                if child.Name == "RTXColorCorrection" or child.Name == "RTXTint" then
                    child:Destroy()
                end
            end

            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local rtxPointLight = plr.Character.HumanoidRootPart:FindFirstChild("RTXPointLight")

                if rtxPointLight then
                    rtxPointLight:Destroy()
                end
            end
        end
    end,
})

rtxM = Turn_on_RTX_Mode

GRP_Misc_Graphics_Haki_Stats:AddButton({
    Text = "Turn on Fast Mode",
    Func = function()
        local v24 = next
        local descendants, v25 = workspace:GetDescendants()

        for k, v26 in v24, descendants, v25 do
            if table.find(Past, v26.ClassName) then
                v26.Material = "Plastic"
            end
        end
    end,
})

GRP_Misc_Graphics_Haki_Stats:AddButton({
    Text = "Turn on Low CPU",
    Func = function()
        if LowCpu then
            LowCpu()
        end
    end,
})

GRP_Misc_Graphics_Haki_Stats:AddButton({
    Text = "Remove Sky Fog",
    Func = function()
        for k, child in pairs(game.Lighting:GetChildren()) do
            if child.Name == "Sky" or child.Name == "LightingLayers" or child.Name == "SeaTerrorCC" or child.Name == "FantasySky" then
                child:Destroy()
            end
        end
    end,
})

local Other = tbl.Misc:AddLeftGroupbox("Other")
GRP_Misc_Configure_God = Other

GRP_Misc_Configure_God:AddButton({
    Text = "Rain Fruits (Client)",
    Func = function()
        if replicated:FindFirstChild("Assets") and replicated.Assets:FindFirstChild("Models") then
            local children = replicated.Assets.Models:GetChildren()

            for k, child in pairs(children) do
                if child:IsA("Model") and child.Name ~= "IceSpikes4" then
                    local clone = child:Clone()
                    clone.Parent = workspace

                    if clone:FindFirstChild("Float") then
                        clone.Float:Destroy()
                    end

                    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        clone:SetPrimaryPartCFrame(CFrame.new(plr.Character.HumanoidRootPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))))
                    end
                end
            end
        end
    end,
})

local Turn_on_Full_Bright = GRP_Misc_Configure_God:AddToggle("Turn_on_Full_Bright", {
    Text = "Turn on Full Bright",
    Default = false,
    Callback = function(selectDN)
        _G.SelectDN = selectDN

        if selectDN then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
            Lighting.ColorShift_Top = Color3.new(1, 1, 1)
        else
            Lighting.Ambient = Color3.new(0, 0, 0)
            Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
            Lighting.ColorShift_Top = Color3.new(0, 0, 0)
        end
    end,
})

briggt1 = Turn_on_Full_Bright

GRP_Misc_Configure_God:AddButton({
    Text = "Turn on increase Boats",
    Func = function()
        local v24, v25, v26 = pairs(workspace.Boats:GetChildren())
        local v27 = v26
        local v28 = v24
        local v29 = v25

        while true do
            local v30, v31 = v28(v29, v27)
            if v30 == nil then
                break
            end
            v27 = v30

            if tostring(v31.Owner.Value) == tostring(plr.Name) then
                for k, descendant in pairs(v31:GetDescendants()) do
                    if descendant:IsA("VehicleSeat") then
                        descendant.MaxSpeed = 350
                        descendant.Torque = 0.2
                        descendant.TurnSpeed = 5
                        descendant.HeadsUpDisplay = true
                    end
                end

                v27 = v30
            end
        end
    end,
})

GRP_Misc_Configure_God:AddButton({
    Text = "Set Pirate Team",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end,
})

GRP_Misc_Configure_God:AddButton({
    Text = "Set Marine Team",
    Func = function()
        replicated.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    end,
})

local Unlock_All_Portals = GRP_Misc_Configure_God:AddToggle("Unlock_All_Portals", {
    Text = "Unlock All Portals",
    Default = false,
    Callback = function(portalUnLock)
        _G.PortalUnLock = portalUnLock
    end,
})

UnPortal = Unlock_All_Portals

HakiSt = {
    "State 0",
    "State 1",
    "State 2",
    "State 3",
    "State 4",
    "State 5",
}

local Select_Haki_States = GRP_Misc_Configure_God:AddDropdown("Select_Haki_States", {
    Text = "Select Haki States",
    Values = HakiSt,
    Default = 1,
    Callback = function(selectStateHaki)
        _G.SelectStateHaki = selectStateHaki
    end,
})

HakiStat = Select_Haki_States

GRP_Misc_Configure_God:AddButton({
    Text = "ChangeBusoStage",
    Func = function()
        local v24 = ({
            ["State 0"] = 0,
            ["State 1"] = 1,
            ["State 2"] = 2,
            ["State 3"] = 3,
            ["State 4"] = 4,
            ["State 5"] = 5,
        })[_G.SelectStateHaki]

        local n3 = v24 or 0
        replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage", n3)
    end,
})

local Select_Time = GRP_Misc_Configure_God:AddDropdown("Select_Time", {
    Text = "Select Time",
    Values = {"Day", "Night"},
    Default = 1,
    Callback = function(selectDN)
        _G.SelectDN = selectDN
    end,
})

DayN = Select_Time

local Turn_on_Time = GRP_Misc_Configure_God:AddToggle("Turn_on_Time", {
    Text = "Turn on Time",
    Default = false,
    Callback = function(daylightN)
        _G.daylightN = daylightN
    end,
})

dayornight = Turn_on_Time

local Turn_on_Walk_on_Water = GRP_Misc_Configure_God:AddToggle("Turn_on_Walk_on_Water", {
    Text = "Turn on Walk on Water",
    Default = false,
    Callback = function(walkWaterPart)
        _G.WalkWater_Part = walkWaterPart

        pcall(function()
            if _G.WalkWater_Part then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end,
})

walkWater = Turn_on_Walk_on_Water

local Turn_on_Ice_Walk = GRP_Misc_Configure_God:AddToggle("Turn_on_Ice_Walk", {
    Text = "Turn on Ice Walk",
    Default = false,
    Callback = function(walkWater_)
        _G.WalkWater = walkWater_
    end,
})

iceWalk = Turn_on_Ice_Walk

lib:Notify({
    Title = "Khanh Beo Hub",
    Description = "Khanh Beo Hub comeback",
    
    Duration = 5,
})
