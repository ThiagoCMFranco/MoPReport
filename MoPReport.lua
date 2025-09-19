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

-- Criação do banco de dados.

if not MoPReportDB then
    MoPReportDB = {}
end

local name, qcc = ...
local L = qcc.L 
    
MoPReport = MoPReport or {}

if not MoPReportSharedDB then
    MoPReportSharedDB = {minimap = {hide = false}}
end


function MoPReport_OnLoad(self)
	-- Allows close with ESC
	tinsert(UISpecialFrames,"MoPReportFrame");

	local version, build, date, tocversion = GetBuildInfo()

	MoPReport_TOCVersion = 0

	if (tocversion >= 50500 and tocversion < 60000) then
		MoPReport_Game_Flavor = "Classic"
		MoPReport_TOCVersion = tocversion
    elseif (tocversion >= 110000) then
        MoPReport_Game_Flavor = "Retail"
		MoPReport_TOCVersion = tocversion
	else
		MoPReport_Game_Flavor = "Other"
		MoPReport_TOCVersion = tocversion
    end

    --LoadCompletedQuestsIcon(self)
end

function MoPReportMainFrame_OnLoad(self)
	LoadCompletedQuestsIcon(self)
end

function MoPReportWorkOrders_OnLoad(self)
	LoadWorkOrderIcon(self)
end

function CreateInlineIcon(atlasNameOrTexID, sizeX, sizeY, xOffset, yOffset)
	sizeX = sizeX or 16;
	sizeY = sizeY or sizeX;
	xOffset = xOffset or 0;
	yOffset = yOffset or 0;

	if (type(atlasNameOrTexID) == "number") then
		-- REF.: CreateTextureMarkup(file, fileWidth, fileHeight, width, height, left, right, top, bottom, xOffset, yOffset)
		return CreateTextureMarkup(atlasNameOrTexID, 0, 0, sizeX, sizeY, 0, 0, 0, 0, xOffset, yOffset);  --> keep original color
		-- return string.format("|T%d:%d:%d:%d:%d|t", atlasNameOrTexID, size, size, xOffset, yOffset);
	end
	-- if ( type(atlasNameOrTexID) == "string" or tonumber(atlasNameOrTexID) ~= nil ) then
	if (type(atlasNameOrTexID) == "string") then
		-- REF.: CreateAtlasMarkup(atlasName, width, height, offsetX, offsetY, rVertexColor, gVertexColor, bVertexColor)
		return CreateAtlasMarkup(atlasNameOrTexID, sizeX, sizeY, xOffset, yOffset);  --> keep original color
	end

	return ''
end

function CreateInlineIconWithTooltip(atlasNameOrTexID, tooltipText, parent, sizeX, sizeY, xOffset, yOffset)
    sizeX = sizeX or 16
    sizeY = sizeY or sizeX
    xOffset = xOffset or 0
    yOffset = yOffset or 0
    parent = parent or UIParent

    -- Cria um botão para o ícone
    local iconBtn = CreateFrame("Button", nil, parent)
    iconBtn:SetSize(sizeX, sizeY)

    -- Cria a textura do ícone
    local iconTexture = iconBtn:CreateTexture(nil, "ARTWORK")
    iconTexture:SetAllPoints()
    if type(atlasNameOrTexID) == "number" then
        iconTexture:SetTexture(atlasNameOrTexID)
    elseif type(atlasNameOrTexID) == "string" then
        if iconTexture.SetAtlas then
            iconTexture:SetAtlas(atlasNameOrTexID)
        else
            iconTexture:SetTexture(atlasNameOrTexID)
        end
    end

    -- Tooltip
    if tooltipText then
        iconBtn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            MOP_ShowIconTooltip(GameTooltip, tooltipText)
            GameTooltip:Show()
        end)
        iconBtn:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)
    end

    -- Offset (opcional)
    iconBtn:SetPoint("TOPLEFT", parent, "TOPLEFT", xOffset, yOffset)

    return iconBtn
end

-- Adição do ícone de minimapa.
--local addon = LibStub("AceAddon-3.0"):NewAddon("MoPReport")
MoPReportMinimapButton = LibStub("LibDBIcon-1.0", true)

local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("MoPReport", {
	type = "data source",
	text = L["AddonName"],
	icon = "Interface\\AddOns\\MopReport\\MopIcon.png",
	OnClick = function(self, btn)
        if btn == "LeftButton" then
            MoPReport_ToggleMainWindow()
        elseif btn == "RightButton" then
            PlaySound(808)
            MoPReport:ToggleSettingsFrame()
        end
	end,

	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then
			return
		end
		if (MoPReportDB.HideDeveloperCreditOnTooltips) then
        	tooltip:AddLine(L["AddonName_Interface"] .. "\n\n" .. L["LClickAction"] .. "\n" .. L["RClickAction"] .."", nil, nil, nil, nil)
    	else
			tooltip:AddLine(L["AddonName_Interface"] .. "\n\n" .. L["LClickAction"] .. "\n" .. L["RClickAction"] .. "\n\n" .. L["DevelopmentTeamCredit"], nil, nil, nil, nil)
	    end
        
	end,
})

MoPReportMinimapButton:Show(L["AddonName"])

local eventListenerFrame = CreateFrame("Frame", "MoPReportEventListenerFrame", UIParent)

eventListenerFrame:RegisterEvent("ADDON_LOADED")
eventListenerFrame:RegisterEvent("QUEST_COMPLETE")
eventListenerFrame:RegisterEvent("QUEST_LOG_UPDATE")
eventListenerFrame:RegisterEvent("UPDATE_FACTION")

eventListenerFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local name = ...
        local addonName = L["AddonName"]
        if name == addonName then
            MoPReportMinimapButton:Register(L["AddonName"], miniButton, MoPReportSharedDB.minimap)
        end
	end

    if event == "QUEST_COMPLETE" then
        allCC = UpdateCompletedQuestsList()
    end

    if event == "QUEST_LOG_UPDATE" then
        allCC = UpdateCompletedQuestsList()
        if MoPReportDetailsFrame:IsShown() then
            if _openDetail == "WORK_ORDERS" then
                CreateMissionFrames(MoPReportDetailsFrameScrollScrollChild, C_MOP_DAILY_QUESTS["WORK_ORDERS"])
            elseif _openDetail == "None" then
                local status = TableHasData(allCC)
                CreateMissionFrames(MoPReportDetailsFrameScrollScrollChild, GetDailyQuestDataByIDs(allCC), status)
            else
                CreateMissionFrames(MoPReportDetailsFrameScrollScrollChild, C_MOP_DAILY_QUESTS[_openDetail])
            end
        end

    end

    if event == "UPDATE_FACTION" then
        if(MoPReportFrame:IsShown()) then
            CreateFactionFrames(MoPReportFrameScrollScrollChild, C_MOP_FACTIONS, C_MOP_FRIENDS)
        end
    end
end)

function MoP_ToggleMinimapButton(_param)
    if _param then
        MoPReportMinimapButton:Hide("MoPReport")
    else
        MoPReportMinimapButton:Show("MoPReport")
    end
end

function SetupSlashCommands()

    SLASH_MoPReport1 = "/MoPReport"
    SLASH_MoPReport2 = "/MR"
    SlashCmdList["MoPReport"] = function(arg)
        if (arg == "config") then
            MoPReport:ToggleSettingsFrame()
        elseif (arg == "ui") then
            MoPReport_ToggleMainWindow()
        elseif (arg == "ExportData") then
            MoPReportDataExtractor:RunExtraction()
        else
			MoPReport_ToggleMainWindow()
        end
    end
end

function MOP_ShowIconTooltip(tooltip, text)
    tooltip:AddLine("|cFFFFFFFF" .. text .. "|r", nil, nil, nil, nil)
end

SetupSlashCommands()
