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

            frame:SetScript("OnEnter", function (self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:ClearLines()
                
                local text = GetBossCompletionTooltip(worldBossQuestID, C_MOP_WORLD_BOSSES_BONUS_ROLL[worldBossQuestID][1])
                GameTooltip:AddLine(text, 1, 1, 1, true) -- O 'true' ativa o wrap de texto se necessário
                
                GameTooltip:Show()
            end)

            frame:SetScript("OnLeave", function (self)
                GameTooltip:Hide()
            end)

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

local addonName = L["AddonName"]
local frame = CreateFrame("Frame")

-- Registra os eventos necessários
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

local function UpdateCharacterData()
    local realm = GetRealmName()
    local charName = UnitName("player")
    
    -- Inicializa a estrutura se não existir
    MoPReportSharedDB = MoPReportSharedDB or {}
    MoPReportSharedDB[realm] = MoPReportSharedDB[realm] or {}
    MoPReportSharedDB[realm][charName] = MoPReportSharedDB[realm][charName] or { quests = {}, lastReset = 0 }
    
    local charData = MoPReportSharedDB[realm][charName]
    local currentTime = GetServerTime()
    local secondsToReset = GetQuestResetTime()
    local nextReset = currentTime + secondsToReset

    -- Lógica de Reset: Se o log atual for mais antigo que o reset esperado
    -- Ou se o reset registrado no DB já passou, limpamos os dados antigos
    --if not charData.lastReset or currentTime > charData.lastReset then
    --    charData.quests = {}
    --    charData.lastReset = nextReset
    --end

    -- Supondo que você já definiu currentTime e nextReset anteriormente
    local newChar = false
    if (charData.lastReset or 0) == 0 then
        newChar = true
        charData.quests = {}       -- Reseta a lista de missões/bosses
        charData.lastReset = nextReset -- Atualiza o timestamp para o novo ciclo
    end

    if currentTime > (charData.lastReset) and not newChar then
        -- Varre todos os Reinos dentro do Banco de Dados Compartilhado
        for realmName, realmTable in pairs(MoPReportSharedDB) do
            -- Verifica se o que encontramos é de fato uma tabela de Reino (evita metadados)
            if type(realmTable) == "table" then
                -- Varre todos os Personagens dentro deste Reino
                for charName, charTable in pairs(realmTable) do
                    -- Verifica se os dados do personagem são uma tabela
                    if type(charTable) == "table" then
                        -- REPLICAÇÃO DA LIMPEZA EM TODA A CONTA:
                        charTable.quests = {}       -- Reseta a lista de missões/bosses
                        charTable.lastReset = nextReset -- Atualiza o timestamp para o novo ciclo
                    end
                end
            end
        end
    end

    -- Varredura dos Bosses (Quest Principal)

    if (MoPReport_Game_Flavor == "Classic") then
        for questID, _ in pairs(C_MOP_WORLD_BOSSES) do
            --charData.quests[questID] = C_QuestLog.IsQuestFlaggedCompleted(questID)
            if VerifyQuestCompleted_classic(questID)[2] then
                charData.quests[questID] = true
            else
                charData.quests[questID] = false
            end
        end
    else
        for questID, _ in pairs(C_MOP_WORLD_BOSSES) do
            --charData.quests[questID] = C_QuestLog.IsQuestFlaggedCompleted(questID)
            if VerifyQuestCompleted(questID)[2] then
                charData.quests[questID] = true
            else
                charData.quests[questID] = false
            end
        end
    end

    -- Varredura dos Bonus Rolls
    if (MoPReport_Game_Flavor == "Classic") then
        local bonusQuestID = data[1] -- O ID da quest de bonus roll está no primeiro índice
            --charData.quests[bonusQuestID] = C_QuestLog.IsQuestFlaggedCompleted(bonusQuestID)
            if VerifyQuestCompleted_classic(bonusQuestID)[2] then
                charData.quests[bonusQuestID] = true
            else
                charData.quests[bonusQuestID] = false
            end
    else
        for _, data in pairs(C_MOP_WORLD_BOSSES_BONUS_ROLL) do
            local bonusQuestID = data[1] -- O ID da quest de bonus roll está no primeiro índice
            --charData.quests[bonusQuestID] = C_QuestLog.IsQuestFlaggedCompleted(bonusQuestID)
            if VerifyQuestCompleted(bonusQuestID)[2] then
                charData.quests[bonusQuestID] = true
            else
                charData.quests[bonusQuestID] = false
            end
        end
    end
end

frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        if (MoPReport_Game_Flavor == "Classic") then
                --Classic logic
        else
            UpdateCharacterData()
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Atualiza sempre que entrar no mundo ou completar uma missão
        if (MoPReport_Game_Flavor == "Classic") then
                --Classic logic
        else
            UpdateCharacterData()
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        -- Atualiza sempre que entrar no mundo ou completar uma missão
        if (MoPReport_Game_Flavor == "Classic") then
                --Classic logic
        else
            UpdateCharacterData()
        end
    end
end)

function ShowMoPReportBosses()
    if not MoPReportSharedDB then
        print("|cffff0000[MoPReport]: Banco de dados não encontrado.|r")
        return
    end

    print("|cffffff00=== Relatório Ordenado MoP (Alfabético) ===|r")

    -- 1. Coletar e ordenar Personagens
    local sortedChars = {}
    for realm, characters in pairs(MoPReportSharedDB) do
        if type(characters) == "table" then
            for charName, charData in pairs(characters) do
                if type(charData) == "table" and charData.quests then
                    table.insert(sortedChars, {
                        name = charName,
                        realm = realm,
                        data = charData
                    })
                end
            end
        end
    end

    -- Ordena personagens por nome (A-Z)
    table.sort(sortedChars, function(a, b) return a.name < b.name end)

    -- 2. Processar cada personagem na ordem
    for _, charInfo in ipairs(sortedChars) do
        print("|cff00ccff" .. charInfo.name .. " [" .. charInfo.realm .. "]:|r")
        
        local charQuests = charInfo.data.quests
        local bossList = {}

        -- 3. Identificar os nomes dos bosses para este personagem
        for questID, status in pairs(charQuests) do
            if status then
                local displayName = "ID: " .. questID
                
                -- Busca nome na constante de Bosses ou Bonus Roll
                if C_MOP_WORLD_BOSSES[questID] then
                    displayName = C_MOP_WORLD_BOSSES[questID][2]
                elseif C_MOP_WORLD_BOSSES_BONUS_ROLL[questID] then
                    displayName = (C_MOP_WORLD_BOSSES_BONUS_ROLL[questID][2] or "Bônus") .. " |cff00ff00(Bônus)|r"
                end
                
                table.insert(bossList, displayName)
            end
        end

        -- Ordena a lista de bosses deste personagem (A-Z)
        table.sort(bossList)

        -- 4. Imprimir lista de bosses ordenada
        if #bossList > 0 then
            for _, bossStr in ipairs(bossList) do
                print("  - " .. bossStr)
            end
        else
            print("  |cff999999(Nenhum boss derrotado)|r")
        end
    end
    print("|cffffff00==========================================|r")
end

function GetBossCompletionTooltip(questID, bonusID)
    if not MoPReportSharedDB then
        return "|cffff0000[MoPReport]: Sem dados.|r"
    end

    local report = ""
    local sortedChars = {}
    local currentRealm = GetRealmName() -- Obtém o reino do personagem atual

    -- 1. Filtrar e Coletar personagens que mataram este boss
    for realm, characters in pairs(MoPReportSharedDB) do
        if type(characters) == "table" then
            for charName, charData in pairs(characters) do
                if type(charData) == "table" and charData.quests and charData.quests[questID] then
                    table.insert(sortedChars, {
                        name = charName,
                        realm = realm,
                        hasBonus = charData.quests[bonusID]
                    })
                end
            end
        end
    end

    -- 2. Ordenar Alfabeticamente
    table.sort(sortedChars, function(a, b) return a.name < b.name end)

    -- 3. Construir a String de retorno
    if #sortedChars > 0 then
        for _, charInfo in ipairs(sortedChars) do
            local bonusStatus = charInfo.hasBonus and CreateInlineIcon("lootroll-icon-need",16,16) .. "/" .. CreateInlineIcon("lootroll-icon-need",16,16) or CreateInlineIcon("lootroll-icon-need",16,16) .. "/" .. CreateInlineIcon("lootroll-icon-pass",16,16)
            
            -- Lógica do Reino: Só exibe se for diferente do atual
            local displayName = charInfo.name .. " "
            if charInfo.realm ~= currentRealm then
                displayName = charInfo.name .. " - " .. charInfo.realm .. " "
            end
            
            report = report .. bonusStatus .. displayName .. "\n"
        end
    else
        report = L["BossNotDefeatedYet"]
    end

    return report:gsub("\n$", "")
end