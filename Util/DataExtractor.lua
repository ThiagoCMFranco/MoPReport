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

MoPReportDataExtractor = {}

function MoPReportDataExtractor:ExtractQuestNames(c_mop_daily_quests, extracted_quests)
    local grouped_quests = {}

    local processed = 0
    local not_found = 0

    for factionID, quests in pairs(c_mop_daily_quests) do
        if type(quests) == "table" then
            grouped_quests[factionID] = grouped_quests[factionID] or {}
            for questID, questData in pairs(quests) do
                local realQuestID = questID
                if type(questID) == "string" then
                    realQuestID = tonumber(questID:match("^(%d+)"))
                end

                local currentName = nil
                if extracted_quests and extracted_quests[factionID] then
                    currentName = extracted_quests[factionID][questID]
                end

                if realQuestID and (currentName == "" or currentName == "Not_Found" or currentName == nil) then
                    processed = processed + 1
                    local title = C_QuestLog.GetTitleForQuestID(realQuestID)
                    if title and title ~= "" then
                        grouped_quests[factionID][questID] = title
                    else
                        grouped_quests[factionID][questID] = "Not_Found"
                        not_found = not_found + 1
                    end
                else
                    grouped_quests[factionID][questID] = currentName
                end
            end
        end
    end
    print("------------------------------")
    print("MoPReport: Extracting Quests")
    print("Processed: " .. processed)
    print("Not found: " .. not_found)
    print("------------------------------")

    return grouped_quests
end


function MoPReportDataExtractor:ExtractFactionNames(c_mop_factions, extracted_factions)

    local processed = 0
    local not_found = 0

     for factionID in pairs(c_mop_factions) do
        if factionID and (extracted_factions[factionID] == "" or extracted_factions[factionID] == "Not_Found" or extracted_factions[factionID] == nil) then
            processed = processed + 1
            local factionData = C_Reputation.GetFactionDataByID(factionID)
            if factionData ~= nil then
                if factionData.name and factionData.name ~= "" then
                    extracted_factions[factionID] = factionData.name
                else
                    extracted_factions[factionID] = "Not_Found"
                    not_found = not_found + 1
                end
            end
        end
    end

    print("------------------------------")
    print("MoPReport: Extracting Factions")
    print("Processed: " .. processed)
    print("Not found: " .. not_found)
    print("------------------------------")

    return extracted_factions
end



function MoPReportDataExtractor:ExtractFriendsNames(c_mop_friends, extracted_friends)
local grouped_friends = {}

    local processed = 0
    local not_found = 0

    for factionID, friends in pairs(c_mop_friends) do
        if type(friends) == "table" then
            grouped_friends[factionID] = grouped_friends[factionID] or {}
            for friendID in pairs(friends) do
                local currentName = nil
                if extracted_friends and extracted_friends[factionID] then
                    currentName = extracted_friends[factionID][friendID]
                end

                if friendID and (currentName == "" or currentName == "Not_Found" or currentName == nil) then
                    processed = processed + 1
                    local friendData = C_GossipInfo.GetFriendshipReputation(friendID)
                    local friendName = friendData.name
                    if friendName and friendName ~= "" then
                        grouped_friends[factionID][friendID] = friendName
                    else
                        grouped_friends[factionID][friendID] = "Not_Found"
                        not_found = not_found + 1
                    end
                else
                    grouped_friends[factionID][friendID] = currentName
                end
            end
        end
    end

    print("------------------------------")
    print("MoPReport: Extracting Friends")
    print("Processed: " .. processed)
    print("Not found: " .. not_found)
    print("------------------------------")

    return grouped_friends
end



function MoPReportDataExtractor:RunExtraction()

    if MoPReport_Game_Flavor == "Classic" then
        --Prevent command to run on classic
        return
    end
    
    if not MoPReportExtractDataDB then
        MoPReportExtractDataDB = {}
    end
    
    if not MoPReportExtractDataDB.Missions then
         MoPReportExtractDataDB.Missions = {}
    end
    
    if not MoPReportExtractDataDB.Factions then
         MoPReportExtractDataDB.Factions = {}
    end
    
    if not MoPReportExtractDataDB.Friends then
         MoPReportExtractDataDB.Friends = {}
    end

    local extractedQuestNames = MoPReportDataExtractor:ExtractQuestNames(C_MOP_DAILY_QUESTS, MoPReportExtractDataDB.Missions)
    MoPReportExtractDataDB.Missions = extractedQuestNames    

    local extractedFactionNames = MoPReportDataExtractor:ExtractFactionNames(C_MOP_FACTIONS, MoPReportExtractDataDB.Factions)
    MoPReportExtractDataDB.Factions = extractedFactionNames    

    local extractedFriendNames = MoPReportDataExtractor:ExtractFriendsNames(C_MOP_FRIENDS, MoPReportExtractDataDB.Friends)
    MoPReportExtractDataDB.Friends = extractedFriendNames    
end


