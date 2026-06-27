Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function main()
	local tSay = {
		"\nSao c„ th” Æ≠Óc, ta sœ chi’n Æ u Æ’n cÔng./nothing",
		"\nRÍi kh·i chi’n tr≠Íng/leave_battle",	
	}
	Say("<color=green>TËng Qu©n Th≠¨ng Binh<color>:".."C∏c hπ muËn rÍi kh·i chi’n tr≠Íng sao? ThÀt Æ∏ng ti’c.", getn(tSay), tSay);
end

function leave_battle()
	local tSay = {
		"\nß” ta suy ngh‹ lπi/nothing",
	}

	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_PEACE and
	GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_READY then
		tinsert(tSay, 1, "\nX∏c nhÀn/sure");
	end
	Say("<color=green>TËng Qu©n Th≠¨ng Binh<color>:".."C∏c hπ x∏c Æﬁnh muËn rÍi kh·i chi’n tr≠Íng?", getn(tSay), tSay);
end

function sure()
	local nCamp = KF_GetCamp();
	DelMSPlayer(KF_MISSION_ID, nCamp);
end