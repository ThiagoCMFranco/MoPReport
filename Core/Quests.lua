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

allCC = {}

function CreateMissionFrames(_missionFrames, _MissionList)
    -- Limpa frames antigos, se existirem
    if _missionFrames.missionFrames then
        for _, frame in ipairs(_missionFrames.missionFrames) do
            frame:Hide()
            frame:SetParent(nil)
        end
    end
    _missionFrames.missionFrames = {}

    allCC = UpdateCompletedQuestsList()

    local parent = _missionFrames
    local prevFrame = nil
    local offsetY = -10 -- margem inicial do topo

    -- Agrupa as quests por questGiver (índice 6), depois por Categoria (índice 7)
    local groupedQuests = {}

    if (_MissionList == nil) then
        return
    end

    for _, questData in pairs(_MissionList) do
        local questID = questData[1]
        -- Filtro de facção: limita a exibição de missões de facções específicas por NPCs de facções neeutras
        if(faction == C_RESTRICTED_FACTION_QUESTS[questID] or C_RESTRICTED_FACTION_QUESTS[questID] == nil) then
            local questGiver = questData[6] or L["Other"]
            local category = questData[7] or L["Other"]
            if not groupedQuests[questGiver] then
                groupedQuests[questGiver] = {}
            end
            if not groupedQuests[questGiver][category] then
                groupedQuests[questGiver][category] = {}
            end
        
            table.insert(groupedQuests[questGiver][category], questData)
        end
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
        if questGiver ~= L["Other"] and C_NPC_COORDINATES[questGiver] ~= nil then
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

                local title = (questData[2] or "Missão desconhecida")
                title = title

                local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
                frame:SetSize(320, 36)
                frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)

                local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                text:SetPoint("LEFT", 23, 0)
                local status = allCC[questID] and "|cFF00FF00" .. L["Completed"] .. "|r" or "|cFF999999" .. L["Not_Completed"] .. "|r"

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

