local name, qcc = ...
local L = qcc.L 

MoPReportIntegration.MoPReport_hasIntegrationSuport = true

function MoPReportIntegration:MoPReport_LoadSettings(tree)
    MoPReport_LoadSettings(tree)
end

function MoPReportIntegration:ShowMainWindow()
    MoPReport_ToggleMainWindow()
end

function MoPReportIntegration:getMainWindow()
    return MoPReportFrame
end

function MoPReportIntegration:getAnchorFrame()
    return AnchorFrame
end

local myFrame = CreateFrame("Frame", "AnchorFrame", UIParent)
myFrame:SetSize(1, 1)

local tex = myFrame:CreateTexture(nil, "BACKGROUND")
tex:SetAllPoints()
tex:SetColorTexture(1, 0, 0, 0)

local function UpdateFramePosition()
    if MoPReportDetailsFrame and MoPReportDetailsFrame:IsVisible() then       
        myFrame:SetParent(MoPReportDetailsFrame)
        myFrame:ClearAllPoints()
        myFrame:SetPoint("TOPRIGHT", MoPReportDetailsFrame, "TOPRIGHT", 0, 0)
    elseif MoPReportFrame and MoPReportFrame:IsVisible() then
        myFrame:SetParent(MoPReportFrame)
        myFrame:ClearAllPoints()
        myFrame:SetPoint("TOPRIGHT", MoPReportFrame, "TOPRIGHT", 0, 0)
    else
        myFrame:Hide()
        return
    end
    myFrame:Show()
end

if MoPReportFrame then
    MoPReportFrame:HookScript("OnShow", UpdateFramePosition)
    MoPReportFrame:HookScript("OnHide", UpdateFramePosition)
end

if MoPReportDetailsFrame then
    MoPReportDetailsFrame:HookScript("OnShow", UpdateFramePosition)
    MoPReportDetailsFrame:HookScript("OnHide", UpdateFramePosition)
end

UpdateFramePosition()