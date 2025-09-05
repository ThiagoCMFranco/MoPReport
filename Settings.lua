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

local C_LanguageContributors = {}

local AceGUI = LibStub("AceGUI-3.0")

-- Create a container frame
local settingsFrame = AceGUI:Create("Frame")
settingsFrame:SetCallback("OnClose",function(widget)  end)
settingsFrame:SetTitle(L["AddonName"] .. " - " .. L["Settings"])
settingsFrame:SetStatusText(L["DevelopmentTeamCredit"])
settingsFrame:SetWidth(880)
settingsFrame:SetHeight(540)
settingsFrame:SetLayout("Flow")
settingsFrame:SetCallback("OnClose",function()
    PlaySound(170887)
end)

_G["MoPReportSettingsFrameName"] = settingsFrame.frame
-- Allows close with ESC
tinsert(UISpecialFrames,"MoPReportSettingsFrameName");

local treeW = AceGUI:Create("TreeGroup")

function MoPReport_LoadAbout()
    treeW:ReleaseChildren()

    local scrollContainerAbout = AceGUI:Create("SimpleGroup")
    scrollContainerAbout:SetFullWidth(true)
    scrollContainerAbout:SetFullHeight(true)
    scrollContainerAbout:SetLayout("Fill")
    
    treeW:AddChild(scrollContainerAbout)
    
    local scrollFrameAbout = AceGUI:Create("ScrollFrame")
    scrollFrameAbout:SetLayout("Flow")
    scrollContainerAbout:AddChild(scrollFrameAbout)

    local LabelAbout_Title = AceGUI:Create("Label")
    LabelAbout_Title:SetText("|cFFFFC90E" .. L["AddonName_Interface"] .. " (" .. L["AddonName"] .. ")" .. "|r")
    --LabelAbout_Title:SetFont(font, 20, style)
    SetACE3WidgetFontSize(LabelAbout_Title, 20)
    LabelAbout_Title:SetWidth(640)
    scrollFrameAbout:AddChild(LabelAbout_Title)

    local LabelAbout = AceGUI:Create("Label")
    LabelAbout:SetText("|cFFFFC90E" .. L["About_Version"] .. "|r\n\n" .. L["About_Title"] .. "\n\n" .. L["About_Line1"] .. "\n\n" .. L["About_Line2"] .. "\n\n" .. L["About_Line3"] .. "\n\n")
    --LabelAbout:SetFont(font, 13, style)
    SetACE3WidgetFontSize(LabelAbout, 13)
    LabelAbout:SetWidth(620)
    scrollFrameAbout:AddChild(LabelAbout)
    
    local headingAbout1 = AceGUI:Create("Heading")
    headingAbout1:SetRelativeWidth(1)
    scrollFrameAbout:AddChild(headingAbout1)

    local LabelAboutLocalizationDisclaimer = AceGUI:Create("Label")
    LabelAboutLocalizationDisclaimer:SetText(L["About_Line4"])
    --LabelAbout:SetFont(font, 13, style)
    SetACE3WidgetFontSize(LabelAboutLocalizationDisclaimer, 13)
    LabelAboutLocalizationDisclaimer:SetWidth(620)
    scrollFrameAbout:AddChild(LabelAboutLocalizationDisclaimer)
end

function MoPReport_LoadSettings()

    treeW:ReleaseChildren()

    local trackerOptions = {}
    if(MoPReport_Game_Flavor == "Retail") then
        trackerOptions = {L["DefaultTrackerAddonOptions_Blizzard"]}
    end

    local TomTomLoaded = MoP_checkAddonLoaded("TomTom", "TOMTOM_WAY")
    local MapPinEnhancedLoaded = MoP_checkAddonLoaded("MapPinEnhanced", "MapPinEnhanced")

    if (TomTomLoaded) then
        table.insert(trackerOptions, L["DefaultTrackerAddonOptions_TomTom"])
    else
        table.insert(trackerOptions, L["DefaultTrackerAddonOptions_TomTom"] .. " (" .. ADDON_DISABLED .. ")")
    end
    if (MapPinEnhancedLoaded) then
        table.insert(trackerOptions, L["DefaultTrackerAddonOptions_MapPinEnhanced"])
    else
        table.insert(trackerOptions, L["DefaultTrackerAddonOptions_MapPinEnhanced"] .. " (" .. ADDON_DISABLED .. ")")
    end

    local scrollContainerMainSettings = AceGUI:Create("SimpleGroup")
    scrollContainerMainSettings:SetFullWidth(true)
    scrollContainerMainSettings:SetFullHeight(true)
    scrollContainerMainSettings:SetLayout("Fill")

    treeW:AddChild(scrollContainerMainSettings)

    local scrollFrameMainSettings = AceGUI:Create("ScrollFrame")
    scrollFrameMainSettings:SetLayout("Flow")
    scrollContainerMainSettings:AddChild(scrollFrameMainSettings)

    --Geral
    local chkHideUnavailableContent = AceGUI:Create("CheckBox")

    chkHideUnavailableContent:SetLabel(L["chkHideUnavailableContent"])
    chkHideUnavailableContent:SetCallback("OnValueChanged", function(widget, event, text) 
        MoPReportDB.HideUnavailableContent = chkHideUnavailableContent:GetValue()
        if(MoPReportFrame:IsShown()) then
            MoPReport_ToggleMainWindow()
            MoPReport_ToggleMainWindow()
        end
    end)
    chkHideUnavailableContent:SetWidth(700)
    scrollFrameMainSettings:AddChild(chkHideUnavailableContent)

    chkHideUnavailableContent:SetValue(MoPReportDB.HideUnavailableContent)

    local LabelHideUnavailableContentDetails = AceGUI:Create("Label")

    if(MoPReport_Game_Flavor == "Classic") then
        LabelHideUnavailableContentDetails:SetText("" .. L["chkHideUnavailableContent_details_classic"] .. "\n")
    else
        LabelHideUnavailableContentDetails:SetText("" .. L["chkHideUnavailableContent_details_retail"] .. "\n")
    end
    LabelHideUnavailableContentDetails:SetWidth(650)
    scrollFrameMainSettings:AddChild(LabelHideUnavailableContentDetails)

    local chkHideLockedContent = AceGUI:Create("CheckBox")

    chkHideLockedContent:SetLabel(L["chkHideLockedContent"])
    chkHideLockedContent:SetCallback("OnValueChanged", function(widget, event, text) 
        MoPReportDB.HideLockedContent = chkHideLockedContent:GetValue()
        if(MoPReportFrame:IsShown()) then
            MoPReport_ToggleMainWindow()
            MoPReport_ToggleMainWindow()
        end
    end)
    chkHideLockedContent:SetWidth(700)
    scrollFrameMainSettings:AddChild(chkHideLockedContent)

    chkHideLockedContent:SetValue(MoPReportDB.HideLockedContent)

    local LabelHideLockedContentDetails = AceGUI:Create("Label")

    LabelHideLockedContentDetails:SetText("" .. L["chkHideLockedContent_details"] .. "\n")
    
    LabelHideLockedContentDetails:SetWidth(650)
    scrollFrameMainSettings:AddChild(LabelHideLockedContentDetails)

    local chkLockDragDrop = AceGUI:Create("CheckBox")

    chkLockDragDrop:SetLabel(L["chkLockDragDrop"])
    chkLockDragDrop:SetCallback("OnValueChanged", function(widget, event, text) 
        MoPReportDB.LockDragDrop = chkLockDragDrop:GetValue()
    end)
    chkLockDragDrop:SetWidth(700)
    scrollFrameMainSettings:AddChild(chkLockDragDrop)

    chkLockDragDrop:SetValue(MoPReportDB.LockDragDrop)

    local chkHideMinimapIcon = AceGUI:Create("CheckBox")

    chkHideMinimapIcon:SetLabel(L["chkHideMinimapIcon"])
    chkHideMinimapIcon:SetCallback("OnValueChanged", function(widget, event, text) 
        MoPReportDB.HideMinimapIcon = chkHideMinimapIcon:GetValue()
        MoP_ToggleMinimapButton(chkHideMinimapIcon:GetValue())
    end)
    chkHideMinimapIcon:SetWidth(700)
    scrollFrameMainSettings:AddChild(chkHideMinimapIcon)

    chkHideMinimapIcon:SetValue(MoPReportDB.HideMinimapIcon)

    local chkHideDeveloperCreditOnTooltips = AceGUI:Create("CheckBox")

    chkHideDeveloperCreditOnTooltips:SetLabel(L["chkHideDeveloperCreditOnTooltips"])
    chkHideDeveloperCreditOnTooltips:SetCallback("OnValueChanged", function(widget, event, text) 
        MoPReportDB.HideDeveloperCreditOnTooltips = chkHideDeveloperCreditOnTooltips:GetValue()
     end)
    chkHideDeveloperCreditOnTooltips:SetWidth(700)
    scrollFrameMainSettings:AddChild(chkHideDeveloperCreditOnTooltips)

    chkHideDeveloperCreditOnTooltips:SetValue(MoPReportDB.HideDeveloperCreditOnTooltips)

    if(MoPReport_Game_Flavor == "Classic") then
        --Não exibe opção de addons de rastreamento no clássico, padrão TomTom.
    else

    local ddlTrackerAddon = AceGUI:Create("Dropdown")

    ddlTrackerAddon:SetList(trackerOptions)
    ddlTrackerAddon:SetLabel(L["ddlTrackerAddon"])
    ddlTrackerAddon:SetWidth(200)
    ddlTrackerAddon:SetCallback("OnValueChanged", function(widget, event, text)
        MoPReportDB.DefaultTrackerAddon = ddlTrackerAddon.value
    end)

    scrollFrameMainSettings:AddChild(ddlTrackerAddon)

    ddlTrackerAddon:SetValue(MoPReportDB.DefaultTrackerAddon)

    end

end

function MoPReport_LoadCredits()

    treeW:ReleaseChildren()

    local scrollContainerCredits = AceGUI:Create("SimpleGroup")
    scrollContainerCredits:SetFullWidth(true)
    scrollContainerCredits:SetFullHeight(true)
    scrollContainerCredits:SetLayout("Fill")
    
    treeW:AddChild(scrollContainerCredits)
    
    local scrollFrameCredits = AceGUI:Create("ScrollFrame")
    scrollFrameCredits:SetLayout("Flow")
    scrollContainerCredits:AddChild(scrollFrameCredits)

    local LabelCredits = AceGUI:Create("Label")
    LabelCredits:SetText(L["lblCreditColabList"])
    --LabelCredits:SetFont(font, 13, style)
    SetACE3WidgetFontSize(LabelCredits, 13)
    LabelCredits:SetWidth(580)
    scrollFrameCredits:AddChild(LabelCredits)

end

local tree = { 
    { 
        value = "S",
        text = L["Settings_Menu_About"],
        icon = "Interface\\Icons\\Inv_misc_questionmark",
    },
    { 
        value = "G",
        text = L["Settings_Menu_General"],
        icon = "Interface\\Icons\\inv_misc_gear_01",
    },
    { 
        value = "C", 
        text = L["Settings_Menu_Credit"],
        icon = "Interface\\Icons\\inv_misc_coin_02",
    },
  }

  
  treeW:SetFullHeight(true)
  treeW:SetLayout("Flow")
  treeW:SetTree(tree)
  settingsFrame:AddChild(treeW)

  treeW:SetCallback("OnGroupSelected", function(container, _, group, ...)
    if group == "G" then
        MoPReport_LoadSettings()
    elseif group == "C" then
        MoPReport_LoadCredits()
    elseif group == "S" then
        MoPReport_LoadAbout()
    else
        print(group)
    end
end)

settingsFrame:Hide()

treeW:SelectByValue("S")

MoPReport_LoadAbout()

function MoPReport:ToggleSettingsFrame()
    if not settingsFrame:IsShown() then
        settingsFrame:Show()
    else
        settingsFrame:Hide()
    end
end