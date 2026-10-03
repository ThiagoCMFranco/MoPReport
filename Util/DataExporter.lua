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

MoPReportDataExporter = {}

local textoMoPParaCopiar = {}
local mopLinhasContainer = {}

local name, MoPReport = ...
local L = MoPReport.L 

-------------------------------------------------------------------------------
-- CRIAÇÃO DA INTERFACE GRÁFICA (UI)
-------------------------------------------------------------------------------
local frame = nil

local function CreateExportWindow()
    if frame then return frame end

    frame = CreateFrame("Frame", "MoPReportExportFrame", UIParent, "BackdropTemplate")
    frame:SetSize(450, 350)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetClampedToScreen(true)
    frame:SetFrameStrata("TOOLTIP")
    frame:SetFrameLevel(100)

    -- Fundo
    frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    frame:SetBackdropColor(0.05, 0.05, 0.05, 0.8)

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", frame, "TOP", 0, -10)
    title:SetText(L["buttonDataExporter"])

    local closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)

    local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -35)
    scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -35, 15)

    local editBox = CreateFrame("EditBox", nil, scrollFrame)
    editBox:SetMultiLine(true)
    editBox:SetMaxLetters(999999) -- Limite alto para suportar DBs grandes
    editBox:SetFontObject("GameFontHighlightSmall")
    editBox:SetWidth(380)
    
    editBox:SetScript("OnEscapePressed", function() frame:Hide() end)
    
    scrollFrame:SetScrollChild(editBox)
    
    frame.editBox = editBox

    return frame
end

-------------------------------------------------------------------------------
-- FUNÇÃO PÚBLICA PARA EXPORTAR
-------------------------------------------------------------------------------
function MoPReportDataExporter:ShowExportWindow(data)

    local f = CreateExportWindow()
    
    local exportString = data
    
    f.editBox:SetText(exportString)
    f:Show()
    
    f.editBox:HighlightText()
    f.editBox:SetFocus()
end

-- ====================================================================
-- CRIANDO O PAINEL PRINCIPAL (JANELA MOP DATA EXTRACTOR)
-- ====================================================================
local mopFrame = CreateFrame("Frame", "MoPReportExtractorMainFrame", UIParent, "BasicFrameTemplate")
mopFrame:SetSize(550, 500)
mopFrame:SetPoint("CENTER", nil, "CENTER", 0, 0)
mopFrame:SetMovable(true)
mopFrame:EnableMouse(true)
mopFrame:RegisterForDrag("LeftButton")
mopFrame:SetScript("OnDragStart", mopFrame.StartMoving)
mopFrame:SetScript("OnDragStop", mopFrame.StopMovingOrSizing)
mopFrame:Hide()

-- Título da Janela
mopFrame.TitleText:SetText(L["AddonName"] .. " - " .. L["buttonDataExporter"])

--- ====================================================================
--- CONFIGURAÇÃO DOS CAMPOS DE ENTRADA (FILTROS)
--- ====================================================================
local function CreateMopLabel(text, parent, x, y)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    label:SetText(text)
    return label
end

-- Termo de Busca (Filtra por nome de Quests, Facções ou Amigos)
CreateMopLabel(L["lblFilter"], mopFrame, 20, -40)
local editMopBusca = CreateFrame("EditBox", nil, mopFrame, "InputBoxTemplate")
editMopBusca:SetSize(240, 20)
editMopBusca:SetPoint("TOPLEFT", mopFrame, "TOPLEFT", 25, -55)
editMopBusca:SetAutoFocus(false)

--- ====================================================================
--- SCROLLBOX / LISTA DE RESULTADOS
--- ====================================================================
local mopScrollFrame = CreateFrame("ScrollFrame", "MoPReportExtractorScrollFrame", mopFrame, "UIPanelScrollFrameTemplate")
mopScrollFrame:SetSize(490, 390)
mopScrollFrame:SetPoint("TOPLEFT", mopFrame, "TOPLEFT", 20, -90)

local mopScrollBG = mopScrollFrame:CreateTexture(nil, "BACKGROUND")
mopScrollBG:SetAllPoints(mopScrollFrame)
mopScrollBG:SetColorTexture(0, 0, 0, 0.5)

-- ScrollChild com tamanho fixado e atrelado ao ScrollFrame pai
local mopScrollChild = CreateFrame("Frame", nil, mopScrollFrame)
mopScrollChild:SetSize(465, 1)
mopScrollFrame:SetScrollChild(mopScrollChild)

local function LimparResultadosMoP()
    for _, linha in ipairs(mopLinhasContainer) do
        linha:Hide()
    end
    mopLinhasContainer = {}
    mopScrollChild:SetHeight(1)
end

local function AdicionarLinhaMoP(texto)
    local index = #mopLinhasContainer + 1
    local linha = mopScrollChild:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    
    -- Amarração lateral para obrigar o texto a respeitar as bordas da caixa preta
    linha:SetPoint("LEFT", mopScrollChild, "LEFT", 5, 0)
    linha:SetPoint("RIGHT", mopScrollChild, "RIGHT", -5, 0)
    linha:SetJustifyH("LEFT")
    linha:SetText(texto)
    
    -- Posicionamento vertical dinâmico herdando do item anterior
    if index == 1 then
        linha:SetPoint("TOP", mopScrollChild, "TOP", 0, -5)
    else
        linha:SetPoint("TOP", mopLinhasContainer[index - 1], "BOTTOM", 0, -6)
    end
    
    table.insert(mopLinhasContainer, linha)
    
    -- Incrementa o tamanho real do container de scroll baseado na altura da nova linha
    mopScrollChild:SetHeight(mopScrollChild:GetHeight() + linha:GetStringHeight() + 6)
end

--- ====================================================================
--- FUNÇÕES EXTRAÇÃO DE DADOS (LÓGICA ADAPTADA)
--- ====================================================================
function MoPReportDataExporter:ExtractQuestNames(c_mop_daily_quests, extracted_quests, buscaLower)
    local grouped_quests = {}
    local processed, not_found, displayed = 0, 0, 0

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

                local title = currentName
                if realQuestID and (currentName == "" or currentName == "Not_Found" or currentName == nil) then
                    processed = processed + 1
                    local apiTitle = C_QuestLog.GetTitleForQuestID(realQuestID)
                    if apiTitle and apiTitle ~= "" then
                        title = apiTitle
                    else
                        title = "Not_Found"
                        not_found = not_found + 1
                    end
                end
                
                grouped_quests[factionID][questID] = title

                if title then
                    local matchesFilter = not buscaLower or string.find(string.lower(title), buscaLower, 1, true) or string.find(string.lower(tostring(questID)), buscaLower, 1, true)
                    if matchesFilter then
                        displayed = displayed + 1
                        AdicionarLinhaMoP(string.format("|cffffcc00[Quest %s]|r %s |cff808080(Faction: %s)|r", questID, title, factionID))
                        table.insert(textoMoPParaCopiar, string.format("Quest [%s] = \"%s\", -- Faction: %s", questID, title, factionID))
                    end
                end
            end
        end
    end
    return grouped_quests, processed, not_found, displayed
end

function MoPReportDataExporter:ExtractFactionNames(c_mop_factions, extracted_factions, buscaLower)
    local processed, not_found, displayed = 0, 0, 0

    for factionID in pairs(c_mop_factions) do
        local currentName = extracted_factions[factionID]
        local name = currentName

        if factionID and (currentName == "" or currentName == "Not_Found" or currentName == nil) then
            processed = processed + 1
            local factionData = C_Reputation.GetFactionDataByID(factionID)
            if factionData and factionData.name and factionData.name ~= "" then
                name = factionData.name
            else
                name = "Not_Found"
                not_found = not_found + 1
            end
        end
        
        extracted_factions[factionID] = name

        if name then
            local matchesFilter = not buscaLower or string.find(string.lower(name), buscaLower, 1, true) or string.find(string.lower(tostring(factionID)), buscaLower, 1, true)
            if matchesFilter then
                displayed = displayed + 1
                AdicionarLinhaMoP(string.format("|cff00ccff[Faction %s]|r %s", factionID, name))
                table.insert(textoMoPParaCopiar, string.format("Faction [%s] = \"%s\",", factionID, name))
            end
        end
    end
    return extracted_factions, processed, not_found, displayed
end

function MoPReportDataExporter:ExtractFriendsNames(c_mop_friends, extracted_friends, buscaLower)
    local grouped_friends = {}
    local processed, not_found, displayed = 0, 0, 0

    for factionID, friends in pairs(c_mop_friends) do
        if type(friends) == "table" then
            grouped_friends[factionID] = grouped_friends[factionID] or {}
            for friendID in pairs(friends) do
                local currentName = nil
                if extracted_friends and extracted_friends[factionID] then
                    currentName = extracted_friends[factionID][friendID]
                end

                local friendName = currentName
                if friendID and (currentName == "" or currentName == "Not_Found" or currentName == nil) then
                    processed = processed + 1
                    local friendData = C_GossipInfo.GetFriendshipReputation(friendID)
                    if friendData and friendData.name and friendData.name ~= "" then
                        friendName = friendData.name
                    else
                        friendName = "Not_Found"
                        not_found = not_found + 1
                    end
                end
                
                grouped_friends[factionID][friendID] = friendName

                if friendName then
                    local matchesFilter = not buscaLower or string.find(string.lower(friendName), buscaLower, 1, true) or string.find(string.lower(tostring(friendID)), buscaLower, 1, true)
                    if matchesFilter then
                        displayed = displayed + 1
                        AdicionarLinhaMoP(string.format("|cff00ff00[Friend %s]|r %s |cff808080(Faction ID: %s)|r", friendID, friendName, factionID))
                        table.insert(textoMoPParaCopiar, string.format("Friend [%s] = \"%s\", -- Faction: %s", friendID, friendName, factionID))
                    end
                end
            end
        end
    end
    return grouped_friends, processed, not_found, displayed
end

--- ====================================================================
--- EXECUÇÃO PRINCIPAL DA VARREDURA (DISPARADA PELO BOTÃO FILTRAR)
--- ====================================================================
function MoPReportDataExporter:RunExtraction()
    if MoPReport_Game_Flavor == "Classic" then return end
    
    LimparResultadosMoP()
    textoMoPParaCopiar = {}

    local termoBusca = editMopBusca:GetText()
    local buscaLower = (termoBusca and termoBusca ~= "") and string.lower(termoBusca) or nil

    if not MoPReportExtractDataDB then MoPReportExtractDataDB = {} end
    if not MoPReportExtractDataDB.Missions then MoPReportExtractDataDB.Missions = {} end
    if not MoPReportExtractDataDB.Factions then MoPReportExtractDataDB.Factions = {} end
    if not MoPReportExtractDataDB.Friends then MoPReportExtractDataDB.Friends = {} end

    AdicionarLinhaMoP("|cff00ff00[" .. L["AddonName"] .. "] " .. "Starting table extraction and processing..." .. "|r")
    table.insert(textoMoPParaCopiar, "-- === MoP REPORT EXPORT DATA ===")

    -- Executa e renderiza as Quests
    local qTable, qProc, qNF, qDisp = self:ExtractQuestNames(C_MOP_DAILY_QUESTS, MoPReportExtractDataDB.Missions, buscaLower)
    MoPReportExtractDataDB.Missions = qTable

    -- Executa e renderiza as Facções
    local fTable, fProc, fNF, fDisp = self:ExtractFactionNames(C_MOP_FACTIONS, MoPReportExtractDataDB.Factions, buscaLower)
    MoPReportExtractDataDB.Factions = fTable

    -- Executa e renderiza os Amigos NPCs
    local frTable, frProc, frNF, frDisp = self:ExtractFriendsNames(C_MOP_FRIENDS, MoPReportExtractDataDB.Friends, buscaLower)
    MoPReportExtractDataDB.Friends = frTable

    -- Bloco Finalizadores de Sumário na Interface
    AdicionarLinhaMoP("|cff00ff00--------------------------------------------------|r")
    AdicionarLinhaMoP(string.format("|cffffffffQuests Processed:|r %d |cff808080(Not found: %d) | Shown: %d|r", qProc, qNF, qDisp))
    AdicionarLinhaMoP(string.format("|cffffffffFactions Processed:|r %d |cff808080(Not found: %d) | Shown: %d|r", fProc, fNF, fDisp))
    AdicionarLinhaMoP(string.format("|cffffffffFriends Processed:|r %d |cff808080(Not found: %d) | Shown: %d|r", frProc, frNF, frDisp))
    
    table.insert(textoMoPParaCopiar, string.format("-- Extraction Finished. Total shown: Quests (%d), Factions (%d), Friends (%d)", qDisp, fDisp, frDisp))
end

--- ====================================================================
--- BOTÕES E CONTROLES DE CÓPIA
--- ====================================================================

local btnMopFiltrar = CreateFrame("Button", nil, mopFrame, "UIPanelButtonTemplate")
btnMopFiltrar:SetSize(80, 22)
btnMopFiltrar:SetPoint("TOPRIGHT", mopFrame, "TOPRIGHT", -20, -54)
btnMopFiltrar:SetText(L["btnFilter"])
btnMopFiltrar:SetScript("OnClick", function()
    MoPReportDataExporter:RunExtraction()
end)

local btnMopCopiar = CreateFrame("Button", nil, mopFrame, "UIPanelButtonTemplate")
btnMopCopiar:SetSize(80, 22)
btnMopCopiar:SetPoint("TOPRIGHT", mopFrame, "TOPRIGHT", -105, -54)
btnMopCopiar:SetText(L["btnCopy"])
btnMopCopiar:SetScript("OnClick", function()
    if #textoMoPParaCopiar <= 1 then return end
    MoPReportDataExporter:ShowExportWindow(table.concat(textoMoPParaCopiar, "\n"))
end)

function MoPReportDataExporter:OpenExportWindow()
    if mopFrame:IsShown() then
        mopFrame:Hide()
    else
        mopFrame:Show()
        MoPReportDataExporter:RunExtraction()
    end
end

