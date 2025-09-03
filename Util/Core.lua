--------------------------------------------------------------------------------
--[[ Mists of Pandaria Report ]]--
--
-- by ThiagoCMFranco <https://github.com/ThiagoCMFranco>
--
--Copyright (C) 2025  Thiago de C. M. Franco
--
--This program is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.
--
--You should have received a copy of the GNU General Public License
--along with this program.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------

local name, qcc = ...
local L = qcc.L 

local faction = UnitFactionGroup("player")

function AddReputationBarToFactionCard(parentFrame, current, treshold, percent, standingLabel, reputationType)
    -- Cria a barra de reputação
    local bar = CreateFrame("StatusBar", nil, parentFrame)
    if(reputationType == "Faction") then
        bar:SetSize(300, 12)
    else
        bar:SetSize(280, 12)
    end

    bar:SetPoint("BOTTOMLEFT", parentFrame, "BOTTOMLEFT", 10, 6)
    bar:SetMinMaxValues(0, 100)
    bar:SetValue(percent or 0)
    bar:SetStatusBarTexture("Interface/TargetingFrame/UI-StatusBar")

    -- Define a cor da barra conforme o grau de reputação
    local friendlyStandings = {
        ["Friendly"] = true, ["Honored"] = true, ["Revered"] = true, ["Exalted"] = true,
        ["Amigável"] = true, ["Honrado"] = true, ["Reverenciado"] = true, ["Exaltado"] = true,
        ["Paragon"] = true, ["Paragão"] = true,
    }
    local hostileStandings = {
        ["Hated"] = true, ["Hostile"] = true, ["Unfriendly"] = true,
        ["Odiado"] = true, ["Hostil"] = true, ["Inamistoso"] = true,
    }

    if friendlyStandings[standingLabel] then
        bar:SetStatusBarColor(0, 0.8, 0) -- Verde
    elseif hostileStandings[standingLabel] then
        bar:SetStatusBarColor(0.8, 0, 0) -- Vermelho
    else
        bar:SetStatusBarColor(0.8, 0.8, 0) -- Amarelo para neutro ou desconhecido
    end

    -- Fundo da barra
    if not bar.bg then
        bar.bg = bar:CreateTexture(nil, "BACKGROUND")
        bar.bg:SetAllPoints(true)
        bar.bg:SetColorTexture(0.2, 0.2, 0.2, 0.5)
    end

    -- Texto do grau de reputação
    if not bar.label then
        bar.label = bar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        bar.label:SetPoint("CENTER", bar, "CENTER", 0, 0)
    end
    if treshold == 1 then repLabel = "" else repLabel = " (" .. current .. "/" .. treshold .. ")" end
    bar.label:SetText(L[standingLabel] .. repLabel or "")

    return bar
end

function reputationConversion(_currentStanding)
        local _currentValue = 0
        local _currentTreshold = 0
    if _currentStanding >= 0 then
        if _currentStanding >= 42000 then
            return "Exalted", _currentValue, _currentTreshold
        elseif _currentStanding >= 21000 then
            _currentValue = _currentStanding - 21000
            _currentTreshold = 21000
            return "Revered", _currentValue, _currentTreshold
        elseif _currentStanding >= 9000 then
            _currentValue = _currentStanding - 9000
            _currentTreshold = 12000
            return "Honored", _currentValue, _currentTreshold
        elseif _currentStanding >= 3000 then
            _currentValue = _currentStanding - 3000
            _currentTreshold = 6000
            return "Friendly", _currentValue, _currentTreshold
        else
            _currentValue = _currentStanding
            _currentTreshold = 3000
            return "Neutral", _currentValue, _currentTreshold
        end
    else
        if _currentStanding > -3000 and _currentStanding < 0 then
            _currentValue = _currentStanding * (-1)
            _currentTreshold = 3000
            return "Unfriendly", _currentValue, _currentTreshold
        elseif _currentStanding > -6000 and _currentStanding < 0 then
            _currentValue = (_currentStanding + 3000) * (-1)
            _currentTreshold = 3000
            return "Hostile", _currentValue, _currentTreshold
        else
            _currentValue = _currentStanding * (-1)
            _currentTreshold = 36000
            return "Hated", _currentValue, _currentTreshold
        end
    end
end

function friendshipConversion(_currentStanding)
        local _currentValue = 0
        local _currentTreshold = 0
    if _currentStanding >= 0 then
        if _currentStanding >= 42000 then
            return "Best", _currentValue, _currentTreshold
        elseif _currentStanding >= 33600 then
            _currentValue = _currentStanding - 33600
            _currentTreshold = 8400
            return "Good", _currentValue, _currentTreshold
        elseif _currentStanding >= 25200 then
            _currentValue = _currentStanding - 25200
            _currentTreshold = 8400
            return "Friend", _currentValue, _currentTreshold
        elseif _currentStanding >= 16800 then
            _currentValue = _currentStanding - 16800
            _currentTreshold = 8400
            return "Buddy", _currentValue, _currentTreshold
        elseif _currentStanding >= 8400 then
            _currentValue = _currentStanding - 8400
            _currentTreshold = 8400
            return "Acquaintance", _currentValue, _currentTreshold
        else
            _currentValue = _currentStanding
            _currentTreshold = 8400
            return "Stranger", _currentValue, _currentTreshold
        end
    end
end

function CreateMoPCurrencyFrame(parent)
    -- Cria o frame principal
    local frame = CreateFrame("Frame", "MoPCurrencyFrame", parent, "BackdropTemplate")
    frame:SetSize(707, 30)
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -22)
    frame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
    frame:SetBackdropColor(0,0,0,0.6)

    local xOffset = 10
    local yOffset = -2
    local idx = 1

    -- Ordena as moedas pelo atributo sequence
    local sortedCurrencies = {}
    for currencyID, data in pairs(C_Currencies) do
        if(MoPReportDB.HideUnavailableContent) then
            if(data.version <= MoPReport_TOCVersion) then
                table.insert(sortedCurrencies, {currencyID = currencyID, data = data})
            end
        else
            table.insert(sortedCurrencies, {currencyID = currencyID, data = data})
        end
    end
    table.sort(sortedCurrencies, function(a, b)
        return (a.data.sequence or 0) < (b.data.sequence or 0)
    end)

    for _, entry in pairs(sortedCurrencies) do
    --for currencyID, data in pairs(sortedCurrencies) do

        local currencyID = entry.currencyID
        local data = entry.data

        if idx == 1 then xOffset = xOffset + 50 end

        -- Obtém a quantidade da moeda
        local amount = GetCurrencyInfo and select(2, GetCurrencyInfo(currencyID)) or (C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo and (C_CurrencyInfo.GetCurrencyInfo(currencyID).quantity or 0)) or 0

        local _currency = C_CurrencyInfo.GetCurrencyInfo(currencyID)

        -- Cria o botão do ícone
        local iconBtn = CreateFrame("Button", nil, frame)
        iconBtn:SetSize(18, 18)
        iconBtn:SetPoint("LEFT", frame, "LEFT", xOffset, yOffset)

        -- Define o ícone usando CreateInlineIcon
        local iconTexture = iconBtn:CreateTexture(nil, "ARTWORK")
        iconTexture:SetAllPoints()
        iconTexture:SetTexture(data.icon)
        iconBtn.iconTexture = iconTexture

        -- Tooltip ao passar o mouse
        iconBtn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
            MOP_ShowIconTooltip(GameTooltip, _currency.name)
            GameTooltip:Show()
        end)
        iconBtn:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)

        -- Quantidade da moeda
        local amountText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        amountText:SetPoint("LEFT", iconBtn, "RIGHT", 4, 0)
        amountText:SetText(amount)

        xOffset = xOffset + 32 + amountText:GetStringWidth() + 18
        idx = idx + 1
    end

    return frame
end

allCC = {}

function CreateMissionFrames_old(_missionFrames, _MissionList)
    -- Limpa frames antigos, se existirem
    if _missionFrames.missionFrames then
        for _, frame in ipairs(_missionFrames.missionFrames) do
            frame:Hide()
            frame:SetParent(nil)
        end
    end
    _missionFrames.missionFrames = {}

    local parent = _missionFrames
    local prevFrame = nil
    local offsetY = -10 -- margem inicial do topo

    -- Agrupa as quests por questGiver (índice 6)
    local groupedQuests = {}

    if (_MissionList == nil) then
        return
    end

    for _, questData in pairs(_MissionList) do
        local questGiver = questData[6] or L["Other"]
        if not groupedQuests[questGiver] then
            groupedQuests[questGiver] = {}
        end
        table.insert(groupedQuests[questGiver], questData)
    end

    -- Ordena os NPC alfabeticamente
    local sortedAreas = {}
    for questGiver in pairs(groupedQuests) do
        table.insert(sortedAreas, questGiver)
    end
    table.sort(sortedAreas)

    for _, questGiver in ipairs(sortedAreas) do
        -- Cabeçalho da área
        local headerFrame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        headerFrame:SetSize(320, 22)
        --headerFrame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
        --headerFrame:SetBackdropColor(0.1,0.1,0.1,0.8)
        if prevFrame then
            headerFrame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)
        else
            headerFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, offsetY)
        end
        local headerText = headerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        headerText:SetPoint("LEFT", 8, 0)
        headerText:SetText(questGiver)
        table.insert(_missionFrames.missionFrames, headerFrame)
        prevFrame = headerFrame

        -- Quests da área
        for _, questData in ipairs(groupedQuests[area]) do
            local questID = questData[1]
            local factionID = questData[4]
            local result = VerifyQuestCompleted(questID)
            local title = result[1] or "|cFFFF0000" .. (questData[2] or "Missão desconhecida") .. "|r" 
            title = title .. " (" .. questData[7] .. " - " .. questData[8] ..")"
            --local title = questData[2]
            local isCompleted = result[2]

            local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
            frame:SetSize(320, 36)
            --frame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",  edgeFile="Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
            --frame:SetBackdropColor(0,0,0,0.6)

            frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)

            local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            text:SetPoint("LEFT", 8, 0)
            local status = isCompleted and "|cFF00FF00Completado|r" or "|cFF999999Não Completado|r"
            --local status = allCC[questID] and "|cFF00FF00Completado|r" or "|cFF999999Não Completado|r"
            text:SetText(CreateInlineIcon(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"]).." "..title.."\n"..status) -- QuestDaily
            text:SetJustifyH("LEFT")
            text:SetJustifyV("TOP")

            table.insert(_missionFrames.missionFrames, frame)
            prevFrame = frame
        end
    end
end

function CreateMissionFrames(_missionFrames, _MissionList)
    -- Limpa frames antigos, se existirem
    if _missionFrames.missionFrames then
        for _, frame in ipairs(_missionFrames.missionFrames) do
            frame:Hide()
            frame:SetParent(nil)
        end
    end
    _missionFrames.missionFrames = {}

    allCC = {}

    if (MoPReport_Game_Flavor == "Classic") then
        allCC = CheckCompletedQuests_classic()
    else
        allCC = CheckCompletedQuests()
    end

    local parent = _missionFrames
    local prevFrame = nil
    local offsetY = -10 -- margem inicial do topo

    -- Agrupa as quests por questGiver (índice 6), depois por Categoria (índice 7)
    local groupedQuests = {}

    if (_MissionList == nil) then
        return
    end

    for _, questData in pairs(_MissionList) do
        local questGiver = questData[6] or L["Other"]
        local category = questData[7] or "Geral"
        if not groupedQuests[questGiver] then
            groupedQuests[questGiver] = {}
        end
        if not groupedQuests[questGiver][category] then
            groupedQuests[questGiver][category] = {}
        end
        table.insert(groupedQuests[questGiver][category], questData)
    end

    -- Ordena os NPCs alfabeticamente
    local sortedQuestGivers = {}
    for questGiver in pairs(groupedQuests) do
        table.insert(sortedQuestGivers, questGiver)
    end
    table.sort(sortedQuestGivers)

    for _, questGiver in ipairs(sortedQuestGivers) do
        -- Cabeçalho do questGiver
        local headerFrame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        headerFrame:SetSize(320, 22)
        if prevFrame then
            headerFrame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -15)
        else
            headerFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, offsetY)
        end
        local headerText = headerFrame:CreateFontString(nil, "OVERLAY", "QuestTitleFontBlackShadow") --GameFontNormalLarge
        headerText:SetPoint("LEFT", 8, 0)
        headerText:SetText(questGiver)
        
        -- Adicionar botão de rastreamento
        if questGiver ~= L["Other"] then
            local CheckButton = CreateFrame("CheckButton", nil, headerFrame, "UIButtonTemplate")
            CheckButton:SetPoint('TOPRIGHT', 0,0)
    	    CheckButton:SetSize(32, 32)
    	    CheckButton:SetFrameLevel(12)
            CheckButton:SetNormalTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["trackIcon"])
		    CheckButton:SetHighlightTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["trackIcon"])
		    CheckButton:GetHighlightTexture():SetAlpha(0.5)
            
            CheckButton:SetScript('OnClick',function(self)
                PlaySound(62538);
                MoP_addPin(C_NPC_COORDINATES[questGiver],MoPReportDB.DefaultTrackerAddon);
            end)
            CheckButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
                MOP_ShowIconTooltip(GameTooltip, L["Track"] .. questGiver)
                GameTooltip:Show()
            end)
    	    CheckButton:SetScript("OnLeave", function(self)
    	        GameTooltip:Hide()
    	    end)
        end

        table.insert(_missionFrames.missionFrames, headerFrame)
        prevFrame = headerFrame

        -- Ordena as categorias alfabeticamente
        local sortedCategories = {}
        for category in pairs(groupedQuests[questGiver]) do
            table.insert(sortedCategories, category)
        end
        table.sort(sortedCategories)

        for _, category in ipairs(sortedCategories) do
            -- Cabeçalho da categoria
            if (category ~= "") then
            local catHeaderFrame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
            catHeaderFrame:SetSize(300, 18)
            catHeaderFrame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -2)
            local catHeaderText = catHeaderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            catHeaderText:SetPoint("LEFT", 13, 0)
            catHeaderText:SetText(category)
            table.insert(_missionFrames.missionFrames, catHeaderFrame)
            prevFrame = catHeaderFrame
            end

            -- Ordena as quests por ordem de exibição (índice 9, se existir)
            table.sort(groupedQuests[questGiver][category], function(a, b)
                return (a[9] or 0) < (b[9] or 0)
            end)

            -- Quests da categoria
            for _, questData in ipairs(groupedQuests[questGiver][category]) do
                local questID = questData[1]
                local factionID = questData[4]

                local result = {}
                local resultBonus = {}
                local title = ""

                if (MoPReport_Game_Flavor == "Classic") then
                    result = VerifyQuestCompleted_classic(questID)
                else
                    result = VerifyQuestCompleted(questID)  
                end

                --local result = VerifyQuestCompleted(questID)
                --local title = result[1] or ("|cFFFF0000" .. (questData[2] or "Missão desconhecida") .. "|r")
                local title = (questData[2] or "Missão desconhecida")
                title = title
                local isCompleted = result[2]

                local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
                frame:SetSize(320, 36)
                frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)

                local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                text:SetPoint("LEFT", 23, 0)
                local status = allCC[questID] and "|cFF00FF00" .. L["Completed"] .. "|r" or "|cFF999999" .. L["Not_Completed"] .. "|r"
                --local status = isCompleted and "|cFF00FF00" .. L["Completed"] .. "|r" or "|cFF999999" .. L["Not_Completed"] .. "|r"

                if(C_CATEGORY_ICONS[questData[8]] == nil) then
                    text:SetText(CreateInlineIcon(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"]).." " ..title.."\n"..status)
                else
                    text:SetText(CreateInlineIcon(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"]).." ".. CreateInlineIcon(C_CATEGORY_ICONS[questData[8]]["icon"]) .. " " ..title.."\n"..status)
                    if(C_CATEGORY_ICONS[questData[8]]["tooltip"] ~= nil and C_CATEGORY_ICONS[questData[8]]["tooltip"] ~= "") then
                        CreateInlineIconWithTooltip(C_CATEGORY_ICONS[questData[8]]["icon"],C_CATEGORY_ICONS[questData[8]]["tooltip"],frame,16,16,41,-4)
                    end
                end
                text:SetJustifyH("LEFT")
                text:SetJustifyV("TOP")

                table.insert(_missionFrames.missionFrames, frame)
                prevFrame = frame
            end
        end
    end
end

    function listReputations()
        local l_factionIndex = 1
        l_numFactions = C_Reputation.GetNumFactions()    

        _factionList = {}

        while l_factionIndex <= l_numFactions do
            local factionData = {}
            factionData = C_Reputation.GetFactionDataByIndex(l_factionIndex)
            if factionData.isHeader and factionData.isCollapsed then
                C_Reputation.ExpandFactionHeader(l_factionIndex)
                l_numFactions = C_Reputation.GetNumFactions()
            end

                if(factionData.isHeader) then
                    table.insert(_factionList, factionData.factionID, {true,factionData.currentStanding})
                end
                if(not factionData.isHeader) then
                    table.insert(_factionList, factionData.factionID, {true,factionData.currentStanding})
                end

            l_factionIndex = l_factionIndex + 1
        end
    
        return _factionList
    end

    function CreateFactionFrames(_factionFrames, _FactionsList, _FriendsList)
    -- Limpa frames antigos, se existirem
    if _factionFrames.missionFrames then
        for _, frame in ipairs(_factionFrames.missionFrames) do
            frame:Hide()
            frame:SetParent(nil)
        end
    end
    _factionFrames.missionFrames = {}

    local parent = _factionFrames
    prevFrame = nil
    local offsetY = -10 -- margem inicial do topo

    -- Agrupa as quests por área (índice 4)
    local groupedQuests = {}
    for _, questData in pairs(_FactionsList) do
        local area = questData[4] or L["Other"]
        if not groupedQuests[area] then
            groupedQuests[area] = {}
        end
        table.insert(groupedQuests[area], questData)
    end

    -- Ordena as áreas alfabeticamente
    local sortedAreas = {}
    for area in pairs(groupedQuests) do
        table.insert(sortedAreas, area)
    end
    table.sort(sortedAreas)

    for _, area in ipairs(sortedAreas) do

        -- Ordena as quests da área pelo índice 5 (sequência numérica)
        table.sort(groupedQuests[area], function(a, b)
            return (a[8] or 0) < (b[8] or 0)
        end)

        -- Cabeçalho da área
        local headerFrame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        headerFrame:SetSize(320, 22)
        --headerFrame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
        --headerFrame:SetBackdropColor(0.1,0.1,0.1,0.8)
        if prevFrame then
            headerFrame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)
        else
            headerFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, offsetY)
        end
        local headerText = headerFrame:CreateFontString(nil, "OVERLAY", "QuestTitleFontBlackShadow") --GameFontNormalLarge
        headerText:SetPoint("LEFT", 8, 0)
        headerText:SetText(area)
        table.insert(_factionFrames.missionFrames, headerFrame)
        prevFrame = headerFrame

        -- Quests da área
        for _, questData in ipairs(groupedQuests[area]) do
            local questID = questData[1]
            --local result = VerifyQuestCompleted(questID)
            --local title = result[1] or "Missão desconhecida"
            local title = questData[2]
            --local isCompleted = result[2]

            local _enabledFaction = {}

            if (MoPReport_Game_Flavor == "Classic") then
                _enabledFaction = listReputations_classic()
            else
                _enabledFaction = listReputations()
            end

            if (questData[5] == faction or questData[5] == "Both") then

            _aux = true

            if (questData[6] and not _enabledFaction[questID]) then
                _aux = false
            else
                _aux = true
            end

            if(MoPReportDB.HideLockedContent and _enabledFaction[questID] == nil) then
                --Não exibe amigo desconhecido
            else

            if _aux then
            local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
            frame:SetSize(320, 52)
            frame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",  edgeFile="Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
            frame:SetBackdropColor(0,0,0,0.6)

            if prevFrame.type == "Friend" then
                frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", -20, -5)
            else
                frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -2)
            end

            

            local CheckButton = CreateFrame("CheckButton", nil, frame, "UIButtonTemplate")
            CheckButton:SetPoint('TOPRIGHT', -8,-8)
    		CheckButton:SetSize(20, 20)
    		CheckButton:SetFrameLevel(12)
            CheckButton:SetNormalTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"]) --Recurringavailablequesticon
			CheckButton:SetHighlightTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"])
			CheckButton:GetHighlightTexture():SetAlpha(0.5)
            
            CheckButton:Hide()
            
            if _enabledFaction[questID] then
                if questData[7] then
                    CheckButton:SetScript('OnClick',function(self) DetailsFrame_ToggleDetailsWindow(questID) end)
                    CheckButton:SetScript("OnEnter", function(self)
                        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
                        MOP_ShowIconTooltip(GameTooltip, L["CheckDailyQuests"])
                        GameTooltip:Show()
                    end)
    	            CheckButton:SetScript("OnLeave", function(self)
    	                GameTooltip:Hide()
    	            end)
                        CheckButton:Show()
                end

                local _factionStandig = 0
                if(_enabledFaction[questID] ~= nil) then
                    _factionStandig = _enabledFaction[questID][2]
                end

                local standing = 0
                local current = 0
                local treshold = 0

                if questData[4] == L["Factions"] then
                    standing, current, treshold = reputationConversion(_factionStandig)
                else
                    local gossipFriendship = {}
                    gossipFriendship = C_GossipInfo.GetFriendshipReputation(questID)
                    standing, current, treshold = friendshipConversion(gossipFriendship.standing)
                end
                
                if standing == "Exalted" or standing == "Best" then
                    current = 1
                    treshold = 1
                end
                AddReputationBarToFactionCard(frame, current, treshold, (current/treshold)*100, standing, "Faction")
            end

            local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            text:SetPoint("LEFT", 8, 0)
            
            local status = _enabledFaction[questID] and "\n " or "\n|cFF999999" .. L["Unknown_Faction"] .. "|r"
            text:SetText(title..status)
            text:SetJustifyH("LEFT")
            text:SetJustifyV("TOP")

                table.insert(_factionFrames.missionFrames, frame)
                prevFrame = frame
                prevFrame.type = "Faction"

                -- Adiciona os amigos (subitens) desta facção, se existirem
            local friendsForFaction = _FriendsList and _FriendsList[questID]
            if friendsForFaction then
                -- Ordena os amigos pela sequência (índice 8)
                local sortedFriends = {}
                for _, friendData in pairs(friendsForFaction) do
                    table.insert(sortedFriends, friendData)
                end
                table.sort(sortedFriends, function(a, b)
                    return (a[8] or 0) < (b[8] or 0)
                end)

                for _, friendData in ipairs(sortedFriends) do
                    local friendFrame = CreateFrame("Frame", nil, parent, "BackdropTemplate")

                    local friendID = friendData[1]
                    local status = ""

                    if(MoPReportDB.HideLockedContent and _enabledFaction[friendID] == nil) then
                        --Não exibe amigo desconhecido
                    else

                    if(_enabledFaction[friendID] == nil) then
                        friendFrame:SetSize(300, 26)
                        status = "|cff999999(" .. L["Unknown_Friend"] .. ")|r"
                    else
                        friendFrame:SetSize(300, 42)
                    end
                    --friendFrame:SetSize(300, 42)
                    friendFrame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
                    --friendFrame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",  edgeFile="Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
                    friendFrame:SetBackdropColor(0.1,0.1,0.1,0.5)
                    if prevFrame.type == "Friend" then
                        friendFrame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, 0)
                    else
                        friendFrame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 20, -2)
                    end

                    local friendText = friendFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                    friendText:SetPoint("TOPLEFT", 8, -7)
                    friendText:SetText(friendData[2] .. " " .. status) -- Nome do amigo

                    local CheckButton = CreateFrame("CheckButton", nil, friendFrame, "UIButtonTemplate")
                    CheckButton:SetPoint('TOPRIGHT', -6,-6)
    		        CheckButton:SetSize(14, 14)
    		        CheckButton:SetFrameLevel(12)
                    CheckButton:SetNormalTexture("minortalents-icon-book") --C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"]
			        CheckButton:SetHighlightTexture("minortalents-icon-book")
			        CheckButton:GetHighlightTexture():SetAlpha(0.5)

                    CheckButton:Hide()

                    if _enabledFaction[friendID] then
                        if friendData[7] then
                            CheckButton:SetScript('OnClick',function(self) DetailsFrame_ToggleDetailsWindow(friendID) end)
                            CheckButton:SetScript("OnEnter", function(self)
                                GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
                                MOP_ShowIconTooltip(GameTooltip, "Detalhes")
                                GameTooltip:Show()
                            end)
    	                    CheckButton:SetScript("OnLeave", function(self)
    	                        GameTooltip:Hide()
    	                    end)
                                CheckButton:Show()
                        end
                    
                        local _factionStandig = 0
                        if(_enabledFaction[friendID] ~= nil) then
                            _factionStandig = _enabledFaction[friendID][2]
                        end
                    
                        local standing = 0
                        local current = 0
                        local treshold = 0
                    
                        if friendData[4] == L["Factions"] then
                            standing, current, treshold = reputationConversion(_factionStandig)
                        else
                            local gossipFriendship = {}
                            gossipFriendship = C_GossipInfo.GetFriendshipReputation(friendID)
                            standing, current, treshold = friendshipConversion(gossipFriendship.standing)
                        end

                        if standing == "Exalted" or standing == "Best" then
                            current = 1
                            treshold = 1
                        end
                        AddReputationBarToFactionCard(friendFrame, current, treshold, (current/treshold)*100, standing, "Friend")
                    end

                    table.insert(_factionFrames.missionFrames, friendFrame)
                    prevFrame = friendFrame
                    prevFrame.type = "Friend"
                end
                end
            end

                end
            end
        end
    end
    end
end

function CreateWorldBossFrames(_worldBossesFrames, _MissionList)
    -- Limpa frames antigos, se existirem
    if _worldBossesFrames.missionFrames then
        for _, frame in ipairs(_worldBossesFrames.missionFrames) do
            frame:Hide()
            frame:SetParent(nil)
        end
    end
    _worldBossesFrames.missionFrames = {}

    local parent = _worldBossesFrames
    local prevFrame = nil
    local offsetY = -10 -- margem inicial do topo

    -- Agrupa as quests por categoria (índice 4)
    local groupedQuests = {}
    for _, questData in pairs(_MissionList) do
        local area = questData[4] or L["Other"]
        if not groupedQuests[area] then
            groupedQuests[area] = {}
        end
        table.insert(groupedQuests[area], questData)
    end

    -- Ordena conforme sequencia especificada
    local sortedAreas = {}
    for area in pairs(groupedQuests) do
        table.insert(sortedAreas, area)
    end
    table.sort(sortedAreas)

    for _, area in ipairs(sortedAreas) do
        -- Ordena as quests da área pelo índice 5 (sequência numérica)
        table.sort(groupedQuests[area], function(a, b)
            return (a[5] or 0) < (b[5] or 0)
        end)

        -- Cabeçalho da área
        local headerFrame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        headerFrame:SetSize(320, 22)
        --headerFrame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
        --headerFrame:SetBackdropColor(0.1,0.1,0.1,0.8)
        if prevFrame then
            headerFrame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)
        else
            headerFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, offsetY)
        end
        local headerText = headerFrame:CreateFontString(nil, "OVERLAY", "QuestTitleFontBlackShadow") --GameFontNormalLarge
        headerText:SetPoint("LEFT", 8, 0)
        headerText:SetText(area)
        table.insert(_worldBossesFrames.missionFrames, headerFrame)
        prevFrame = headerFrame

        -- Quests de chefes de mundo
        for _, questData in ipairs(groupedQuests[area]) do
            local questID = questData[1]

            local result = {}
            local resultBonus = {}

            if (MoPReportDB.HideUnavailableContent and questData[5] > MoPReport_TOCVersion) then
                --Faz Nada
            else

            if (MoPReport_Game_Flavor == "Classic") then
                result = VerifyQuestCompleted_classic(questID)
                resultBonus = VerifyQuestCompleted_classic(C_MOP_WORLD_BOSSES_BONUS_ROLL[questID][1])
            else
                result = VerifyQuestCompleted(questID)
                resultBonus = VerifyQuestCompleted(C_MOP_WORLD_BOSSES_BONUS_ROLL[questID][1])
            end

            --local result = VerifyQuestCompleted(questID)
            --local resultBonus = VerifyQuestCompleted(C_MOP_WORLD_BOSSES_BONUS_ROLL[questID][1])
            local title = questData[2]
            local isCompleted = result[2]
            local isCompletedBonus = resultBonus[2]

            local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
            frame:SetSize(320, 42)
            --frame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",  edgeFile="Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
            --frame:SetBackdropColor(0,0,0,0.6)

            frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)

            --AddAdventureGuideButton(frame)

            local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            text:SetPoint("LEFT", 8, 0)
            local status = isCompleted and "|cFF00FF00" .. L["Looted"] .. "|r" or "|cFF999999" .. L["NotLooted"] .. "|r"
            local statusBonus = isCompletedBonus and "|cFF00FF00" .. L["ExtraRollLooted"] .. "|r" or "|cFF999999" .. L["ExtraRollNotLooted"] .. "|r"
            text:SetText(CreateInlineIcon("DungeonSkull").." "..title.."\n"..status.." - "..statusBonus)
            text:SetJustifyH("LEFT")
            text:SetJustifyV("TOP")

            -- Adicionar botão de rastreamento
            local CheckButton = CreateFrame("CheckButton", nil, frame, "UIButtonTemplate")
            CheckButton:SetPoint('TOPRIGHT', -15,0)
    	    CheckButton:SetSize(24, 24)
    	    CheckButton:SetFrameLevel(12)
            CheckButton:SetNormalTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["trackIcon"])
		    CheckButton:SetHighlightTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["trackIcon"])
		    CheckButton:GetHighlightTexture():SetAlpha(0.5)
            CheckButton:SetScript('OnClick',function(self)
                PlaySound(62538);
                MoP_addPin(C_NPC_COORDINATES[title],MoPReportDB.DefaultTrackerAddon);
            end)
            CheckButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
                MOP_ShowIconTooltip(GameTooltip, L["Track"] .. title)
                GameTooltip:Show()
            end)
    	    CheckButton:SetScript("OnLeave", function(self)
    	        GameTooltip:Hide()
    	    end)

            if(MoPReport_Game_Flavor == "Classic" and MoPReport_TOCVersion < 50502 and MoPReportDB.HideLockedContent == 1) then
                if (questID == 32518 or questID == 32519) then
                    CheckButton:Hide()
                end
            end
            if(MoPReport_Game_Flavor == "Classic" and MoPReport_TOCVersion < 50504 and MoPReportDB.HideLockedContent == 1) then
                if (questID == 33117 or questID == 33118) then
                    CheckButton:Hide()
                end
            end

            table.insert(_worldBossesFrames.missionFrames, frame)
            prevFrame = frame
        end
    end
    end

end

function CheckCompletedQuests()
    local _allCompletedQuests = C_QuestLog.GetAllCompletedQuestIDs()
    local _tableAllCompletedQuests = {}
    for _, quest in ipairs(_allCompletedQuests) do
        table.insert(_tableAllCompletedQuests, quest, true)
    end
    return _tableAllCompletedQuests
end

function MoP_checkAddonLoaded(_addonName, _addonSlashCommand)
    name, title, notes, loadable, reason, security, newVersion = C_AddOns.GetAddOnInfo(_addonName)
    if(title ~= nil) then
        if(loadable)then
            if(SlashCmdList[_addonSlashCommand] == nil)then
                --print(_addonName .. " not loaded!")
                return false;
            else
                --print(_addonName .. " loaded!")
                return true;
            end
        else
            --print(_addonName .. " indisponível!")
            return false;
        end 
    end
end

function MoP_addPin(pin, scope)
    if(MoPReport_Game_Flavor == "Classic") then

        TomTomLoaded = MoP_checkAddonLoaded("TomTom", "TOMTOM_WAY")

        if(TomTomLoaded) then --"TomTom"
            local zone = C_Map.GetMapInfo(pin.uiMapID)
            local TTPIN = SlashCmdList["TOMTOM_WAY"]
            TTPIN(zone.name .. " " .. 100 * pin.position.x .. " " .. 100 * pin.position.y .. " " .. pin.name)
        else
            print(L["TrackerDisabledClassic"])
        end
    else

        TomTomLoaded = MoP_checkAddonLoaded("TomTom", "TOMTOM_WAY")
        MapPinEnhancedLoaded = MoP_checkAddonLoaded("MapPinEnhanced", "MapPinEnhanced")

        if(scope == 2 and TomTomLoaded) then --"TomTom"
        	local zone = C_Map.GetMapInfo(pin.uiMapID)
        	local TTPIN = SlashCmdList["TOMTOM_WAY"]
                TTPIN(zone.name .. " " .. 100 * pin.position.x .. " " .. 100 * pin.position.y .. " " .. pin.name)
        elseif(scope == 3 and MapPinEnhancedLoaded) then --"MapPinEnhanced"
        	local zone = C_Map.GetMapInfo(pin.uiMapID)
        	local MPEPIN = SlashCmdList["MapPinEnhanced"]
                MPEPIN(zone.name .. " " .. 100 * pin.position.x .. " " .. 100 * pin.position.y .. " " .. pin.name)
        else -- 1 or nil -> "Blizzard"
        	C_Map.SetUserWaypoint(pin);
        	C_SuperTrack.SetSuperTrackedUserWaypoint(true)
        end
    end
end

function loadWorkOrderIcon(frame)
    local CheckButton = CreateFrame("CheckButton", nil, frame, "UIButtonTemplate")
    CheckButton:SetPoint('CENTER', 0, -10)
    CheckButton:SetSize(28, 28)
    CheckButton:SetFrameLevel(2)
    CheckButton:SetNormalTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"]) --Recurringavailablequesticon
	CheckButton:SetHighlightTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"])
	CheckButton:GetHighlightTexture():SetAlpha(0.5)
    
    CheckButton:Hide()
    
    CheckButton:SetScript('OnClick',function(self) DetailsFrame_ToggleDetailsWindow(questID, true) end)
    CheckButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
        MOP_ShowIconTooltip(GameTooltip, L["CheckWorkOrders"])
        GameTooltip:Show()
    end)
    CheckButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    CheckButton:Show()

    MoPReportFrameWorkOrdersTitle:SetText(L["WorkOrders"])
end

-- Função compatível com WoW 5.x (Mists of Pandaria)
function VerifyQuestCompleted_classic(questID)
    local isCompleted = false
    local title = ""

    -- Verifica se a quest foi completada usando IsQuestFlaggedCompleted (API antiga)
    if type(tonumber(questID)) == "number" then
        isCompleted = C_QuestLog.IsQuestFlaggedCompleted(questID) == true

        -- Procura o título da quest no QuestLog
        for i = 1, GetNumQuestLogEntries() do
            local qTitle, _, _, _, _, _, qID = GetQuestLogTitle(i)
            if qID == questID then
                title = qTitle
                break
            end
        end

        -- Se não encontrou no log, tenta buscar no banco de dados local (caso exista)
        if title == "" and C_MOP_DAILY_QUESTS then
            for _, factionQuests in pairs(C_MOP_DAILY_QUESTS) do
                if factionQuests[questID] and factionQuests[questID][2] then
                    title = factionQuests[questID][2]
                    break
                end
            end
        end
    end

    return {title, isCompleted}
end



    function listReputations_classic()
        local l_factionIndex = 1
        l_numFactions = GetNumFactions()    

        _factionList = {}

        while l_factionIndex <= l_numFactions do
            name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfo(l_factionIndex)
            
            if isHeader and isCollapsed then
                ExpandFactionHeader(l_factionIndex)
                l_numFactions = GetNumFactions()
            end

                if(isHeader) then
                    table.insert(_factionList, factionID, {true,barValue})
                end
                if(not isHeader) then
                    table.insert(_factionList, factionID, {true,barValue})
                end

            l_factionIndex = l_factionIndex + 1
        end
    
        return _factionList
    end



function CheckCompletedQuests_classic()
    local _allCompletedQuests = GetQuestsCompleted()
    local _tableAllCompletedQuests = {}
    for _, quest in ipairs(_allCompletedQuests) do
        table.insert(_tableAllCompletedQuests, quest, true)
    end
    return _tableAllCompletedQuests
end