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

local _thisFrame = {}
local _openDetail = 0

function DetailsFrame_OnLoad(self)
	self:RegisterForDrag("LeftButton");
    _thisFrame = self
end

function DetailsClose(self)
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE);
    self:GetParent():Hide();
end

function DetailsShow(self)
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN);
    self:Show();
end

function DetailsHide(self)
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE);
    self:Hide();
end

function DetailsFrame_ToggleDetailsWindow(_factionID, _isWorkOrder, _isComplete)
	if(_thisFrame:IsShown() and _openDetail == _factionID) then
        DetailsHide(_thisFrame)
        _openDetail = 0
	else
		DetailsShow(_thisFrame)
        if _isWorkOrder then
            CreateMissionFrames(DetailsFrameScrollScrollChild, C_MOP_DAILY_QUESTS["WORK_ORDERS"])
        elseif _isComplete then
            
        else
            CreateMissionFrames(DetailsFrameScrollScrollChild, C_MOP_DAILY_QUESTS[_factionID])
        end
        _openDetail = _factionID
	end
end

