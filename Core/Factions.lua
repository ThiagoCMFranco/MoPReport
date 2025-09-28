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

function CreateFactionFrames(_factionFrames, _FactionsList, _FriendsList)
    -- Limpa frames antigos, se existirem
    if _factionFrames.factionFrames then
        for _, frame in ipairs(_factionFrames.factionFrames) do
            frame:Hide()
            frame:SetParent(nil)
        end
    end
    _factionFrames.factionFrames = {}
                
    local parent = _factionFrames
    local prevFrame = nil
    local offsetY = -10 -- margem inicial do topo
                
    -- Agrupa as facções por tipo de relação (Faction or Friend) (índice 4)
    local groupedFactions = {}
    for _, factionData in pairs(_FactionsList) do
        local factionType = factionData[4] or L["Other"]
        if not groupedFactions[factionType] then
            groupedFactions[factionType] = {}
        end
        table.insert(groupedFactions[factionType], factionData)
    end
                
    -- Ordena as facções por tipo de relação
    local sortedFactions = {}
    for factionType in pairs(groupedFactions) do
        table.insert(sortedFactions, factionType)
    end
    table.sort(sortedFactions)

    for _, factionType in ipairs(sortedFactions) do

        -- Ordena as facções do conjunto pelo índice 8 (sequência numérica)
        table.sort(groupedFactions[factionType], function(a, b)
            return (a[8] or 0) < (b[8] or 0)
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
        headerText:SetText(factionType)
        table.insert(_factionFrames.factionFrames, headerFrame)
        prevFrame = headerFrame

        -- Facções agrupadas por tipo
        for _, factionData in ipairs(groupedFactions[factionType]) do
            local factionID = factionData[1]
            local title = factionData[2]

            local _enabledFaction = {}

            if (MoPReport_Game_Flavor == "Classic") then
                _enabledFaction = ListReputations_classic()
            else
                _enabledFaction = ListReputations()
            end
                        
            if (factionData[5] == faction or factionData[5] == "Both") then
                            
                local _showFaction = true
                
                if (factionData[6] and not _enabledFaction[factionID]) then
                    _showFaction = false
                else
                    _showFaction = true
                end
                        
                if(MoPReportDB.HideLockedContent and _enabledFaction[factionID] == nil) then
                    --Não exibe amigo desconhecido
                else
                            
                    if _showFaction then
                        local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
                        frame:SetSize(320, 52)
                        frame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",  edgeFile="Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
                        frame:SetBackdropColor(0,0,0,0.6)
                    
                        if prevFrame.type == "Friend" then
                            frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", -20, -5)
                        else
                            frame:SetPoint("TOPLEFT", prevFrame, "BOTTOMLEFT", 0, -2)
                        end

                        frame:SetScript("OnMouseDown", function(self, btn)
                            if btn == "RightButton" then
                                local contextMenu = MenuUtil.CreateContextMenu(frame, FactionsGeneratorFunction, factionData[2], factionData[1]);
                            end
                        end)
                        

                        local CheckButton = CreateFrame("CheckButton", nil, frame, "UIButtonTemplate")
                        CheckButton:SetPoint('TOPRIGHT', -8,-8)
    		            CheckButton:SetSize(20, 20)
    		            CheckButton:SetFrameLevel(12)
                        CheckButton:SetNormalTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"])
			            CheckButton:SetHighlightTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"])
			            CheckButton:GetHighlightTexture():SetAlpha(0.5)

                        CheckButton:Hide()

                        if _enabledFaction[factionID] then
                            if factionData[7] then
                                CheckButton:SetScript('OnClick',function(self) MoPReportDetailsFrame_ToggleDetailsWindow(factionID) end)
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
                        
                            local _factionStanding = 0
                            if(_enabledFaction[factionID] ~= nil) then
                                _factionStanding = _enabledFaction[factionID][2]
                            end
                        
                            local standing = ""
                            local current = 0
                            local treshold = 0
                        
                            if factionData[4] == L["Factions"] then
                                standing, current, treshold = ReputationConversion(_factionStanding)
                            else
                                local gossipFriendship = {}
                                gossipFriendship = C_GossipInfo.GetFriendshipReputation(factionID)
                                standing, current, treshold = FriendshipConversion(gossipFriendship.standing)
                            end
                        
                            if standing == "Exalted" or standing == "Best" then
                                current = 1
                                treshold = 1
                            end
                            AddReputationBarToFactionCard(frame, current, treshold, (current/treshold)*100, standing, "Faction")
                        end
                        
                        local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                        text:SetPoint("LEFT", 8, 0)
                    
                        local status = _enabledFaction[factionID] and "\n " or "\n|cFF999999" .. L["Unknown_Faction"] .. "|r"
                        text:SetText(title..status)
                        text:SetJustifyH("LEFT")
                        text:SetJustifyV("TOP")
                    
                        table.insert(_factionFrames.factionFrames, frame)
                        prevFrame = frame
                        prevFrame.type = "Faction"
                        
                        -- Adiciona os amigos (subitens) desta facção, se existirem
                        local friendsForFaction = _FriendsList and _FriendsList[factionID]
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
                                        friendFrame:SetScript("OnMouseDown", function(self, btn)
                                            if btn == "RightButton" then
                                                local contextMenu = MenuUtil.CreateContextMenu(friendFrame, FactionsGeneratorFunction, friendData[2], friendData[1]);
                                            end
                                        end)
                                    end
                                    friendFrame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
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
                                    CheckButton:SetNormalTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["friendDetail"])
			                        CheckButton:SetHighlightTexture(C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["friendDetail"])
			                        CheckButton:GetHighlightTexture():SetAlpha(0.5)
                                
                                    CheckButton:Hide()
                                
                                    if _enabledFaction[friendID] then
                                        if friendData[7] then
                                            CheckButton:SetScript('OnClick',function(self) MoPReportDetailsFrame_ToggleDetailsWindow(friendID) end)
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
                                    
                                        local _factionStanding = 0
                                        if(_enabledFaction[friendID] ~= nil) then
                                            _factionStanding = _enabledFaction[friendID][2]
                                        end
                                    
                                        local standing = ""
                                        local current = 0
                                        local treshold = 0
                                    
                                        if friendData[4] == L["Factions"] then
                                            standing, current, treshold = ReputationConversion(_factionStanding)
                                        else
                                            local gossipFriendship = {}
                                            gossipFriendship = C_GossipInfo.GetFriendshipReputation(friendID)
                                            standing, current, treshold = FriendshipConversion(gossipFriendship.standing)
                                        end
                                    
                                        if standing == "Exalted" or standing == "Best" then
                                            current = 1
                                            treshold = 1
                                        end
                                        AddReputationBarToFactionCard(friendFrame, current, treshold, (current/treshold)*100, standing, "Friend")
                                    end
                                
                                    table.insert(_factionFrames.factionFrames, friendFrame)
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