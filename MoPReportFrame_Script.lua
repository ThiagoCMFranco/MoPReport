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

    