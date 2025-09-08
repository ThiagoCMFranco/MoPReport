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

function CreateWorldBossFrames(_worldBossesFrames, _WorldBossesList)
    -- Limpa frames antigos, se existirem
    if _worldBossesFrames.worldBossesFrames then
        for _, frame in ipairs(_worldBossesFrames.worldBossesFrames) do
            frame:Hide()
            frame:SetParent(nil)
        end
    end
    _worldBossesFrames.worldBossesFrames = {}

    local parent = _worldBossesFrames
    local prevFrame = nil
    local offsetY = -10 -- margem inicial do topo

    -- Agrupa os chefes de mundo por tipo (índice 4)
    local groupedWorldBosses = {}
    for _, worldBossData in pairs(_WorldBossesList) do
        local worldBossType = worldBossData[4] or L["Other"]
        if not groupedWorldBosses[worldBossType] then
            groupedWorldBosses[worldBossType] = {}
        end
        table.insert(groupedWorldBosses[worldBossType], worldBossData)
    end

    -- Ordena conforme sequencia especificada
    local sortedWorldBossesType = {}
    for worldBossType in pairs(groupedWorldBosses) do
        table.insert(sortedWorldBossesType, worldBossType)
    end
    table.sort(sortedWorldBossesType)

    for _, worldBossType in ipairs(sortedWorldBossesType) do
        -- Ordena as quests da área pelo índice 5 (sequência numérica)
        table.sort(groupedWorldBosses[worldBossType], function(a, b)
            return (a[5] or 0) < (b[5] or 0)
        end)

        -- Cabeçalho da área
        local headerFrame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        headerFrame:SetSize(320, 22)
        if prevFrame then
            headerFrame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)
        else
            headerFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, offsetY)
        end
        local headerText = headerFrame:CreateFontString(nil, "OVERLAY", "QuestTitleFontBlackShadow") --GameFontNormalLarge
        headerText:SetPoint("LEFT", 8, 0)
        headerText:SetText(worldBossType)
        table.insert(_worldBossesFrames.worldBossesFrames, headerFrame)
        prevFrame = headerFrame

        -- Quests de chefes de mundo
        for _, worldBossData in ipairs(groupedWorldBosses[worldBossType]) do
            local worldBossQuestID = worldBossData[1]

            local isQuestCompleted = {}
            local isQuestCompletedBonus = {}

            if (MoPReportDB.HideUnavailableContent and worldBossData[5] > MoPReport_TOCVersion) then
                --Faz Nada
            else

            if (MoPReport_Game_Flavor == "Classic") then
                isQuestCompleted = VerifyQuestCompleted_classic(worldBossQuestID)
                isQuestCompletedBonus = VerifyQuestCompleted_classic(C_MOP_WORLD_BOSSES_BONUS_ROLL[worldBossQuestID][1])
            else
                isQuestCompleted = VerifyQuestCompleted(worldBossQuestID)
                isQuestCompletedBonus = VerifyQuestCompleted(C_MOP_WORLD_BOSSES_BONUS_ROLL[worldBossQuestID][1])
            end

            local title = worldBossData[2]
            local isCompleted = isQuestCompleted[2]
            local isCompletedBonus = isQuestCompletedBonus[2]

            local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
            frame:SetSize(320, 42)

            frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -5)

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
                if (worldBossQuestID == 32518 or worldBossQuestID == 32519) then
                    CheckButton:Hide()
                end
            end
            if(MoPReport_Game_Flavor == "Classic" and MoPReport_TOCVersion < 50504 and MoPReportDB.HideLockedContent == 1) then
                if (worldBossQuestID == 33117 or worldBossQuestID == 33118) then
                    CheckButton:Hide()
                end
            end

            table.insert(_worldBossesFrames.worldBossesFrames, frame)
            prevFrame = frame
        end
    end
    end

end