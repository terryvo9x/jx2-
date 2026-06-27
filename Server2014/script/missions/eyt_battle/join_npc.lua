Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\eyt_battle\\mission.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")

EYT_NPC = "<color=green>Nh¹c BÊt QuÇn:<color>";

function main()
	if ISEytSystemOpen(2) ~= 1 then
		return 0;
	end
	local tSay = {};
	tSay.msg = EYT_NPC..format("¢n O¸n §µi ®­îc ®Æt ë Hång Liªn S¬n, lµ n¬i ®Ó cho nh©n sÜ giang hå tranh ®o¹t ch©n khÝ vµ gi¶i quyÕt ©n o¸n. Sau khi c¸c ®¹i hiÖp vµo Tû Vâ ¢n O¸n §µi sÏ chia thµnh hai ®éi, mçi ®éi %d ng­êi. §¸nh b¹i ng­êi ch¬i phe ®Þch hoÆc ®o¹t ®­îc chiÕn kú trªn ¢n O¸n §µi sÏ nhËn ®­îc ®iÓm tÝch lòy, ®éi ®¹t ®­îc %d ®iÓm tÝch lòy tr­íc tiªn sÏ giµnh chiÕn th¾ng. §¹i hiÖp muèn tham gia chiÕn ®Êu kh«ng?", 8, 150);
	tSay.sel = {
		{"§iÒu kiÖn tham gia ", "eyt_npc_condition"},
		{"B¸o danh ®¬n", "eyt_npc_join"},
		{"B¸o danh nhãm (Tèi ®a 3 ng­êi)", "eyt_npc_join_team"},
		{"\nKÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);	
end

function eyt_npc_condition()
	local tSay = {};
	tSay.msg = EYT_NPC..format("\nThêi gian më: %s", "H»ng ngµy tõ 12:00-14:00, 18:00-20:00");
	tSay.msg = tSay.msg.."\nGiíi h¹n cÊp: Ng­êi ch¬i ®¹t chuyÓn sinh 5 cÊp 96 cã thÓ b¸o danh tham gia";
	tSay.msg = tSay.msg.."\nC¸ch thøc b¸o danh: Cã thÓ b¸o danh ®¬n hoÆc b¸o danh nhãm kh«ng qu¸ 3 ng­êi, mçi ng­êi tham gia tèi ®a 4 lÇn/ngµy.";
	tSay.sel = {
		{"\n Ph¶n håi", "main"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function eyt_npc_join()
	if eyt_npc_check() ~= 1 then
		return 0;
	end
	local nUsableMap = eyt_GetSuitMap(1);
	DebugOutput("nUsableMap =", nUsableMap);
	if nUsableMap ~= 0 then
		local nRed = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_RED, nUsableMap);
		local nBlue = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_BLUE, nUsableMap);
		if nRed <= nBlue then
			EYT_MISSION:Enter(nUsableMap, EYT_CAMP_RED);
		else
			EYT_MISSION:Enter(nUsableMap, EYT_CAMP_BLUE);
		end
	else
		if GetMapLoadCount(EYT_MAP_ID) >= EYT_MISSION_MAX then
			Say("HiÖn t¹i Tû Vâ ¢n O¸n §µi ®· ®Çy, t¹m thêi kh«ng thÓ vµo, h·y quay l¹i sau!", 0);
			return 0;
		end
		local mapID, mapIdx = EYT_MISSION:Create()
		DebugOutput("EYT_MISSION:Create()", mapID, mapIdx);
		EYT_MISSION:Enter(mapID, EYT_CAMP_RED);
	end
end

function eyt_npc_join_team()
	if eyt_npc_check(1) ~= 1 then
		return 0;
	end
	local nUsableMap = eyt_GetSuitMap(GetTeamSize());
	DebugOutput("nUsableMap =", nUsableMap);
	if nUsableMap ~= 0 then
		local nRed = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_RED, nUsableMap);
		local nBlue = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_BLUE, nUsableMap);
		if nRed <= nBlue then
			EYT_MISSION:TeamEnter(nUsableMap, EYT_CAMP_RED);
		else
			EYT_MISSION:TeamEnter(nUsableMap, EYT_CAMP_BLUE);
		end
	else
		if GetMapLoadCount(EYT_MAP_ID) >= EYT_MISSION_MAX then
			Say("HiÖn t¹i Tû Vâ ¢n O¸n §µi ®· ®Çy, t¹m thêi kh«ng thÓ vµo, h·y quay l¹i sau!", 0);
			return 0;
		end
		local mapID, mapIdx = EYT_MISSION:Create()
		DebugOutput("EYT_MISSION:Create()", mapID, mapIdx);
		EYT_MISSION:TeamEnter(mapID, EYT_CAMP_RED);
	end
end

function eyt_npc_check(bTeam)
	--Ê±¼äÏÞÖÆ
	local nTime = tonumber(date("%H%M"));
	if (not ((1200 <= nTime and nTime < 1400) or (1800 <= nTime and nTime < 2000))) then
		Say(EYT_NPC..format("Tû Vâ ¢n O¸n §µi vÉn ch­a më, mêi %s vµo lóc %s hoÆc %s h·y ®Õn b¸o danh tham gia.", gf_GetPlayerSexName(), "12:00", "18:00"), 0);
		return 0;
	end
	--ÒÑ¾­ÓÐ¶ÓÎéÁË
	local nTeamSize = GetTeamSize();
	if not bTeam or bTeam ~= 1 then
		if nTeamSize ~= 0 then
			Say(EYT_NPC..format("%s ®· cã tæ ®éi, kh«ng thÓ b¸o danh ®¬n ®Ó tham gia Tû Vâ ¢n O¸n §µi", gf_GetPlayerSexName()), 0);
			return 0;
		end
		if gf_CheckLevel(5, 96) ~= 1 then
			Say(EYT_NPC..format("%s ch­a ®¹t chuyÓn sinh %d cÊp %d, kh«ng thÓ vµo Tû Vâ ¢n O¸n §µi", gf_GetPlayerSexName(), 5, 96), 0)
			return 0;
		end
		if eyt_GetJoinTimes() >= EYT_JOIN_TIME_LIMIT then
			Say(EYT_NPC..format("%s h«m nay ®· tham gia %d lÇn, kh«ng thÓ vµo Tû Vâ ¢n O¸n §µi", gf_GetPlayerSexName(), EYT_JOIN_TIME_LIMIT), 0)
			return 0;
		end
		local nJoinTime = eyt_GetJoinTime();
		local needTime = EYT_PUNISH_TIME + nJoinTime - GetTime();
		local nMin = floor(needTime/60);
		if needTime > 0 and (nMin <= EYT_PUNISH_TIME/60 and nMin >= 0) then
			Say(EYT_NPC..format("%s tho¸t ra gi÷a chõng trong Tû Vâ ¢n O¸n §µi, %dmin%s sau míi cã thÓ tiÕp tôc tham gia", gf_GetPlayerSexName(), nMin, mod(needTime,60)), 0);
			return 0;
		end
	else
		if GetName() ~= GetCaptainName() then
			Say(EYT_NPC.."ChØ cã ®éi tr­ëng míi ®­îc bao danh tham gia!", 0)
			return 0;
		end
		if nTeamSize > 3 then
			Say(EYT_NPC..format("%s tæ ®éi v­ît qu¸ %d ng­êi, kh«ng thÓ b¸o danh tæ ®éi tham gia Tû Vâ ¢n O¸n §µi", gf_GetPlayerSexName(), 3), 0);
			return 0;
		end
		if gf_CheckTeam(
			function ()
				if gf_CheckLevel(5, 96) ~= 1 then
					return 0;
				end
				return 1;
			end, EYT_NPC..format("Thµnh viªn d­íi ®©y ch­a ®¹t chuyÓn sinh %d cÊp %d, kh«ng thÓ tham gia Tû Vâ ¢n O¸n §µi:\n", 5, 96)) ~= 1 then
				return 0;
		end
		if gf_CheckTeam(
			function ()
				if eyt_GetJoinTimes() >= EYT_JOIN_TIME_LIMIT then
					return 0;
				end
				return 1;
			end, EYT_NPC..format("Thµnh viªn d­íi ®©y h«m nay ®· tham gia %d lÇn, kh«ng thÓ tham gia Tû Vâ ¢n O¸n §µi:\n", EYT_JOIN_TIME_LIMIT)) ~= 1 then
				return 0;
		end
		if gf_CheckTeam(
			function ()
				local nJoinTime = eyt_GetJoinTime();
				local needTime = EYT_PUNISH_TIME + nJoinTime - GetTime();
				local nMin = floor(needTime/60);
				if needTime > 0 and (nMin <= EYT_PUNISH_TIME/60 and nMin >= 0) then
					return 0;
				end
				return 1;
			end, EYT_NPC..format("Thµnh viªn d­íi ®©y tho¸t ra gi÷a chõng trong trËn ®Êu, t¹m thêi kh«ng thÓ tham gia Tû Vâ ¢n O¸n §µi:\n")) ~= 1 then
				return 0;
		end
	end
	return 1;
end

function main_eyt_award()
	local nSucc = eyt_GetSucc()
	local nFail = eyt_GetFail()
	local tSay = {};
	tSay.msg = EYT_NPC..format("%s tham gia Tû Vâ ¢n O¸n §µi tæng céng %d lÇn, th¾ng %d lÇn, thÊt b¹i %d lÇn, hiÖn t¹i muèn nhËn th­ëng ngay kh«ng? <color=red>(Thµnh tÝch tû vâ chØ cã hiÖu lùc trong ngµy)<color>", gf_GetPlayerSexName(), nSucc+nFail, nSucc, nFail);
	tSay.sel = {};
	if nSucc + nFail <= 0 then
		tinsert(tSay.sel, {"HiÖn t¹i ch­a thÓ nhËn th­ëng", "nothing"});
	else
		if nSucc > 0 then
			tinsert(tSay.sel, {"NhËn phÇn th­ëng th¾ng trËn", "eyt_npc_get_succ_award"});
		end
		if nFail > 0 then
			tinsert(tSay.sel, {"NhËn phÇn th­ëng b¹i trËn", "eyt_npc_get_fail_award"});
		end
	end
	tinsert(tSay.sel, {"KÕt thóc ®èi tho¹i", "nothing"});
	temp_Talk(tSay);
end

function eyt_npc_get_succ_award()
	local nSucc = eyt_GetSucc()
	if nSucc <= 0 then
		Say("HiÖn t¹i ch­a thÓ nhËn th­ëng", 0);
		return 0;
	end
	local tSay = {};
	tSay.msg = EYT_NPC..format("%s hiÖn t¹i ë Tû Vâ ¢n O¸n §µi cßn ®­îc nhËn phÇn th­ëng th¾ng trËn %d lÇn, hiÖn t¹i muèn nhËn th­ëng ngay kh«ng? (<color=red>Mçi lÇn chØ ®­îc nhËn th­ëng cña 1 trËn<color>)", gf_GetPlayerSexName(), nSucc);
	tSay.sel = {
		{"LËp tøc nhËn th­ëng", "eyt_npc_get_succ_award_do"},
		{"Thiªn Kiªu LÖnh nhËn th­ëng", "#eyt_npc_get_succ_award_do(1)"},
		{"trë l¹i", "main_eyt_award"},
		{"KÕt thóc ®èi tho¹i", "nothing"},	
	};
	temp_Talk(tSay);
end

function eyt_npc_get_succ_award_do(bUseIb)
	local nSucc = eyt_GetSucc()
	if nSucc <= 0 then
		Say("HiÖn t¹i ch­a thÓ nhËn th­ëng", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
		return 0;
	end
	if bUseIb and GetItemCount(2, 97, 236) < 1 then
		Say(format("Trong hµnh trang vËt phÈm %s sè l­îng kh«ng ®ñ %d", "Thiªn Kiªu LÖnh", 1), 0);
		return 0;
	end
	if not bUseIb then --Ö±½ÓÁì½±
		local nExp = 10000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		gf_AddItemEx2({2,1,30499,1}, "Hu©n ch­¬ng anh hïng", "Tû Vâ ¢n O¸n §µi", "PhÇn th­ëng th¾ng trËn ¢n O¸n §µi", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_jinbaoxiang_2_free"));
	else --Ìì½¾ÁîÁì½±
		if DelItem(2, 97, 236, 1) ~= 1 then
			return 0;
		end
		local nExp = 20000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		gf_AddItemEx2({2,1,30499,2}, "Hu©n ch­¬ng anh hïng", "Tû Vâ ¢n O¸n §µi", "PhÇn th­ëng th¾ng trËn ¢n O¸n §µi (Thiªn Kiªu LÖnh)", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_jinbaoxiang_2_IB"));
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
	end
	_vc_JoinEytBattle_Win(); --²Î¼Ó¶÷Ô¹Ì¨È¡Ê¤²¢ÁìÈ¡½±Àø
	eyt_ReduceSucc();
	eyt_npc_get_succ_award();
end

function eyt_npc_get_fail_award()
	local nFail = eyt_GetFail()
	if nFail <= 0 then
		Say("HiÖn t¹i ch­a thÓ nhËn th­ëng", 0);
		return 0;
	end
	local tSay = {};
	tSay.msg = EYT_NPC..format("%s hiÖn t¹i ë Tû Vâ ¢n O¸n §µi cßn ®­îc nhËn phÇn th­ëng b¹n trËn %d lÇn, hiÖn t¹i muèn nhËn th­ëng ngay kh«ng? (<color=red>Mçi lÇn chØ ®­îc nhËn th­ëng cña 1 trËn<color>)", gf_GetPlayerSexName(), nFail);
	tSay.sel = {
		{"LËp tøc nhËn th­ëng", "eyt_npc_get_fail_award_do"},
		{"Thiªn Kiªu LÖnh nhËn th­ëng", "#eyt_npc_get_fail_award_do(1)"},
		{"trë l¹i", "main_eyt_award"},
		{"KÕt thóc ®èi tho¹i", "nothing"},	
	};
	temp_Talk(tSay);
end

function eyt_npc_get_fail_award_do(bUseIb)
	local nFail = eyt_GetFail()
	if nFail <= 0 then
		Say("HiÖn t¹i ch­a thÓ nhËn th­ëng", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
		return 0;
	end
	if bUseIb and GetItemCount(2, 97, 236) < 1 then
		Say(format("Trong hµnh trang vËt phÈm %s sè l­îng kh«ng ®ñ %d", "Thiªn Kiªu LÖnh", 1), 0);
		return 0;
	end
	if not bUseIb then --Ö±½ÓÁì½±
		local nExp = 5000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		--gf_AddItemEx2({2,1,30499,0}, "Ó¢ÐÛÑ«ÕÂ", "¶÷Ô¹Ì¨±ÈÎä", "¶÷Ô¹Ì¨°Ü³¡½±Àø", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_baoxiang_2"));
	else --Ìì½¾ÁîÁì½±
		if DelItem(2, 97, 236, 1) ~= 1 then
			return 0;
		end
		local nExp = 10000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		gf_AddItemEx2({2,1,30499,1}, "Hu©n ch­¬ng anh hïng", "Tû Vâ ¢n O¸n §µi", "PhÇn th­ëng b¹i trËn ¢n O¸n §µi (Thiªn Kiªu LÖnh)", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_baoxiang_2_IB"));
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
	end
	eyt_ReduceFail();
	eyt_npc_get_fail_award();
end
