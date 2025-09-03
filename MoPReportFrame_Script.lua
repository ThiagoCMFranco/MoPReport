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

function QCCFrame_OnLoad(self)
	self:SetTitle(L["AddonName_Interface"]);
	self.PortraitContainer.portrait:SetTexture("Interface\\AddOns\\MoPReport\\MopIcon.png");
	self:RegisterForDrag("LeftButton");

    local version, build, date, tocversion = GetBuildInfo()

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

 local currencyFrame = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")

function MoPReport_ToggleMainWindow()
	if(MoPReportFrame:IsShown()) then
		MoPReportFrame:Hide()
	else
		MoPReportFrame:Show()
        CreateWorldBossFrames(MoPReportFrameWorldBosses, C_MOP_WORLD_BOSSES)
        CreateFactionFrames(MoPReportFrameScrollScrollChild, C_MOP_FACTIONS, C_MOP_FRIENDS)
        currencyFrame:Hide()
        currencyFrame = CreateMoPCurrencyFrame(MoPReportFrame)
        if (MoPReportDB.HideUnavailableContent and MoPReport_TOCVersion < 50502) then
            MoPReportFrameWorkOrders:Hide()
        else
            MoPReportFrameWorkOrders:Show()
        end
	end
end

    