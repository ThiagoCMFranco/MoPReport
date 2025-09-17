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

function MoP_checkAddonLoaded(_addonName, _addonSlashCommand)
    local name, title, notes, loadable, reason, security, newVersion = C_AddOns.GetAddOnInfo(_addonName)
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

function LoadWorkOrderIcon(frame)
    local CheckButton = CreateFrame("CheckButton", nil, frame, "UIButtonTemplate")
    CheckButton:SetPoint('CENTER', 0, -10)
    CheckButton:SetSize(28, 28)
    CheckButton:SetFrameLevel(2)
    CheckButton:SetNormalTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["workOrders"]) --Recurringavailablequesticon
	CheckButton:SetHighlightTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["workOrders"])
	CheckButton:GetHighlightTexture():SetAlpha(0.5)
    
    CheckButton:Hide()
    
    CheckButton:SetScript('OnClick',function(self) MoPReportDetailsFrame_ToggleDetailsWindow(nil, true) end)
    
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

function TableHasData(_table)
        local status = "empty"
        local count = 0

        for k, v in pairs(_table) do
            count = count + 1
            if(count > 0) then
                status = "filled"
                break
            end
        end
        return status
end

function LoadCompletedQuestsIcon(frame)
    local CheckButton = CreateFrame("CheckButton", nil, frame, "UIButtonTemplate")
    CheckButton:SetPoint('TOPRIGHT', 20, 34)
    CheckButton:SetSize(22, 22)
    CheckButton:SetFrameLevel(2)
    CheckButton:SetNormalTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"]) --Recurringavailablequesticon
	CheckButton:SetHighlightTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"])
	CheckButton:GetHighlightTexture():SetAlpha(0.5)
    
    CheckButton:Hide()
    
    CheckButton:SetScript('OnClick',function(self) MoPReportDetailsFrame_ToggleDetailsWindow("None", false, true) 

        local allCC = CheckCompletedQuests()
    
        local status = TableHasData(allCC)

        CreateMissionFrames(MoPReportDetailsFrameScrollScrollChild, GetDailyQuestDataByIDs(allCC), status)
    
    end)
    
    CheckButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
        MOP_ShowIconTooltip(GameTooltip, L["CheckCompletedQuests"])
        GameTooltip:Show()
    end)
    CheckButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    CheckButton:Show()

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

function ListReputations()
        local l_factionIndex = 1
        local l_numFactions = C_Reputation.GetNumFactions()    

        local _factionList = {}

        while l_factionIndex <= l_numFactions do
            --local factionData = {}
            local factionData = C_Reputation.GetFactionDataByIndex(l_factionIndex)
            if(factionData) then
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
        end
    
        return _factionList
end

function ListReputations_classic()
        local l_factionIndex = 1
        local l_numFactions = GetNumFactions()

        local _factionList = {}

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

function CheckCompletedQuests_old()
    local _allCompletedQuests = C_QuestLog.GetAllCompletedQuestIDs()
    local _tableAllCompletedQuests = {}
    for _, quest in ipairs(_allCompletedQuests) do
        table.insert(_tableAllCompletedQuests, quest, true)
    end
    return _tableAllCompletedQuests
end

-- Retorna apenas os IDs de quests que estão em C_MOP_DAILY_QUESTS
function CheckCompletedQuests()

    local _allCompletedQuests = {}

    if(MoPReport_Game_Flavor == "Classic") then    
        _allCompletedQuests = GetQuestsCompleted()
    else
        _allCompletedQuests = C_QuestLog.GetAllCompletedQuestIDs()
    end


    local _filteredCompletedQuests = {}

    --_allCompletedQuests = {32567, 30149,30148}

    -- Cria um set de todos os IDs válidos de C_MOP_DAILY_QUESTS
    local validQuestIDs = {}
    for factionID, quests in pairs(C_MOP_DAILY_QUESTS) do
        if type(quests) == "table" then
            for questID, _ in pairs(quests) do
                validQuestIDs[questID] = true
            end
        end
    end

    -- Filtra apenas os quests que estão em C_MOP_DAILY_QUESTS
    for _, questID in ipairs(_allCompletedQuests) do
        if(C_SHARED_QUEST[questID]) then
            if validQuestIDs[questID] then
                _filteredCompletedQuests[tostring(questID) .. "_1"] = true
                _filteredCompletedQuests[tostring(questID) .. "_2"] = true
                _filteredCompletedQuests[tostring(questID) .. "_3"] = true
                _filteredCompletedQuests[tostring(questID) .. "_4"] = true
                _filteredCompletedQuests[questID] = true
                end
            else
                if validQuestIDs[questID] then
                    _filteredCompletedQuests[questID] = true
                end
        end
    end

    return _filteredCompletedQuests
end

-- Retorna uma tabela com os dados de C_MOP_DAILY_QUESTS para os códigos fornecidos em questIDList
function GetDailyQuestDataByIDs(questIDList)
    local result = {}
    -- Cria um índice rápido para busca
    local questIndex = {}
    for factionID, quests in pairs(C_MOP_DAILY_QUESTS) do
        if type(quests) == "table" then
            for questID, questData in pairs(quests) do
                if(questData[2] == nil) then
                    --Oculta shared dummy quest
                else
                    questIndex[questID] = questData
                end
                
            end
        end
    end
 
    for questID, _  in pairs(questIDList) do
        if questIndex[questID] then
            result[questID] = questIndex[questID]
        end
    end

    return result
end

--function CheckCompletedQuests_classic()
--    local _allCompletedQuests = GetQuestsCompleted()
--    local _tableAllCompletedQuests = {}
--    for _, quest in ipairs(_allCompletedQuests) do
--        table.insert(_tableAllCompletedQuests, quest, true)
--    end
--    return _tableAllCompletedQuests
--end

function UpdateCompletedQuestsList()
    local allCC = {}
    --if (MoPReport_Game_Flavor == "Classic") then
    --    allCC = CheckCompletedQuests_classic()
    --else
        allCC = CheckCompletedQuests()
    --end   

    return allCC
end

function ReputationConversion(_currentStanding)
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

function FriendshipConversion(_currentStanding)
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

function AddReputationBarToFactionCard(parentFrame, current, treshold, percent, standingLabel, reputationType)

    local repLabel = ""

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
        ["Paragon"] = true,
        ["Best"] = true, ["Good"] = true, ["Friend"] = true, ["Buddy"] = true,
    }
    local hostileStandings = {
        ["Hated"] = true, ["Hostile"] = true, ["Unfriendly"] = true,
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
    bar.label:SetText((L[standingLabel] .. repLabel) or "")

    return bar
end

function VerifyQuestCompleted(p_questID)

    local isCompleted = false
    local title = nil
    if type(tonumber(p_questID)) == "number" then
        isCompleted = C_QuestLog.IsQuestFlaggedCompleted(p_questID)
	    title = C_QuestLog.GetTitleForQuestID(p_questID)
    else
        isCompleted = false
        title = ""
    end

    return {title,isCompleted}

end

function IsQuestInProgress(questID)
    -- Percorre o quest log do jogador e verifica se a missão está ativa
    if(MoPReport_Game_Flavor == "Classic") then    
        for i = 1, GetNumQuestLogEntries() do
            local info = C_QuestLog.GetQuestInfo(i)
            if info and info.questID == questID then
                return true
            end
        end
    else
        for i = 1, C_QuestLog.GetNumQuestLogEntries() do
            local info = C_QuestLog.GetInfo(i)
            if info and info.questID == questID then
                return true
            end
        end
    end
    
    return false
end

function AddHelpIcon(_LabelHelp, _TooltipText)

    _LabelHelp:SetText("  " .. CreateInlineIcon("glueannouncementpopup-icon-info"))
    _LabelHelp:SetWidth(22)
    _LabelHelp:SetCallback("OnEnter", function(widget, event, text)
        GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR");
		GameTooltip:SetText(
            _TooltipText
            , 1, 1, 1, nil, true);
            GameTooltip:ClearAllPoints()
        local mX, mY = GetCursorPosition()
        local uiScale = UIParent:GetEffectiveScale()
        local tooltipWidth = GameTooltip:GetWidth()
        local tooltipHeight = GameTooltip:GetHeight()
        GameTooltip:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", mX / uiScale + 10 / uiScale, mY / uiScale - tooltipHeight)
		GameTooltip:Show();
    end)
    _LabelHelp:SetCallback("OnLeave", function(widget, event, text)
        GameTooltip:Hide();
    end)

end