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

function DetailsFrame_ToggleDetailsWindow(_factionID, _isWorkOrder)
	if(_thisFrame:IsShown() and _openDetail == _factionID) then
        DetailsHide(_thisFrame)
        _openDetail = 0
	else
		DetailsShow(_thisFrame)
        if _isWorkOrder then
            CreateMissionFrames(DetailsFrameScrollScrollChild, C_MOP_DAILY_QUESTS["WORK_ORDERS"])
        else
            CreateMissionFrames(DetailsFrameScrollScrollChild, C_MOP_DAILY_QUESTS[_factionID])
        end
        _openDetail = _factionID
	end
end

