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

function CreateMoPCurrencyFrame(parent)
    -- Cria o frame principal
    local frame = CreateFrame("Frame", "MoPCurrencyFrame", parent, "BackdropTemplate")
    frame:SetSize(707, 30)
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -22)
    frame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
    frame:SetBackdropColor(0,0,0,0.6)

    local xOffset = 10
    local yOffset = -2
    local idx = 1

    -- Ordena as moedas pelo atributo sequence
    local sortedCurrencies = {}
    for currencyID, data in pairs(C_Currencies) do
        if(MoPReportDB.HideUnavailableContent) then
            if(data.version <= MoPReport_TOCVersion) then
                table.insert(sortedCurrencies, {currencyID = currencyID, data = data})
            end
        else
            table.insert(sortedCurrencies, {currencyID = currencyID, data = data})
        end
    end
    table.sort(sortedCurrencies, function(a, b)
        return (a.data.sequence or 0) < (b.data.sequence or 0)
    end)

    for _, entry in pairs(sortedCurrencies) do
    --for currencyID, data in pairs(sortedCurrencies) do

        local currencyID = entry.currencyID
        local data = entry.data

        if idx == 1 then xOffset = xOffset + 50 end

        -- Obtém a quantidade da moeda
        local amount = GetCurrencyInfo and select(2, GetCurrencyInfo(currencyID)) or (C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo and (C_CurrencyInfo.GetCurrencyInfo(currencyID).quantity or 0)) or 0

        local _currency = C_CurrencyInfo.GetCurrencyInfo(currencyID)

        -- Cria o botão do ícone
        local iconBtn = CreateFrame("Button", nil, frame)
        iconBtn:SetSize(18, 18)
        iconBtn:SetPoint("LEFT", frame, "LEFT", xOffset, yOffset)

        -- Define o ícone usando CreateInlineIcon
        local iconTexture = iconBtn:CreateTexture(nil, "ARTWORK")
        iconTexture:SetAllPoints()
        iconTexture:SetTexture(data.icon)
        iconBtn.iconTexture = iconTexture

        -- Tooltip ao passar o mouse
        iconBtn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
            MOP_ShowIconTooltip(GameTooltip, _currency.name)
            GameTooltip:Show()
        end)
        iconBtn:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)

        -- Quantidade da moeda
        local amountText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        amountText:SetPoint("LEFT", iconBtn, "RIGHT", 4, 0)
        amountText:SetText(amount)

        xOffset = xOffset + 32 + amountText:GetStringWidth() + 18
        idx = idx + 1
    end

    return frame
end