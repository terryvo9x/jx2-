Include("\\script\\missions\\kuafu_battle\\kf_define.lua")

function main()
	Msg2Global("ChiÕn Tr­êng Liªn Server s¾p më, c¸c ®¹i hiÖp h·y nhanh chãng ®Õn Thµnh §« gÆp NPC Liªn §Êu TiÕp DÉn Quan (231, 221) ®Ó b¸o danh tham gia");
	AddLocalCountNews("ChiÕn Tr­êng Liªn Server s¾p më, c¸c ®¹i hiÖp h·y nhanh chãng ®Õn Thµnh §« gÆp NPC Liªn §Êu TiÕp DÉn Quan (231, 221) ®Ó b¸o danh tham gia", 2);
	if SubWorldID2Idx(KF_MAP_TASK_TEMP_ID) ~= -1 then
		SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT, 0);
		SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID, 0);
	end
end;