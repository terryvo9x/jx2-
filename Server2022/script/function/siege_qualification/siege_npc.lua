Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\honor_tong\\ht_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\function\\siege_qualification\\tm_head.lua")

SIEGE_NPC_NAME = "<color=green>Chñ L«i §µi<color>:";

function siege_qualification()
	local tSay = {
		"Giíi thiÖu T­ C¸ch C«ng Thµnh ChiÕn/siege_info",
		"\n rót lui/nothing",
	}
	local wDay = tonumber(date("%w"));
	if wDay == 5 then		
		tinsert(tSay, 1, "Ta muèn tham gia/siege_register");
	end
	Say(SIEGE_NPC_NAME.."21:00 - 21:19 thø 6 h»ng tuÇn, bang héi kh«ng thuéc bang thñ thµnh n»m trong TOP 10 Bang Héi Vinh Danh cña tuÇn tr­íc cã thÓ b¸o danh tham gia khiªu chiÕn t­ c¸ch c«ng thµnh.", getn(tSay), tSay);
end

function siege_register()
	local tbBody = "§¨ng ký tham gia khiªu chiÕn t­ c¸ch c«ng thµnh cÇn ph¶i tháa m·n nh÷ng ®iÒu kiÖn d­íi ®©y:\n    1. Thêi gian tham chiÕn: 21:00 - 21:19 thø 6 h»ng tuÇn\n    2. CÇn bang chñ (t¹i vÞ 07 ngµy trë lªn) mang theo Th­ TiÕn Cö ®Õn chç cña ta ®Ó ®¨ng ký\n    3. Bang héi ph¶i n»m trong TOP 10 cña Bang Héi Vinh Danh tuÇn tr­íc.\n    4. Bang héi kh«ng ph¶i lµ bang thñ thµnh.\n    5. Thµnh viªn tæ ®éi ph¶i lµ thµnh viªn trong bang.";
	local tbSay = {};
	tbSay.msg = SIEGE_NPC_NAME..tbBody;
	tbSay.sel = {
		{"§ång ý tham gia", "siege_join_match"},
		{"\n Ph¶n håi", "siege_qualification"},
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function siege_info()
	local tbBody = "T­ C¸ch C«ng Thµnh ChiÕn tæ chøc vµo thø 6 h»ng tuÇn, thi ®Êu ®Ó chän ra bang héi së h÷u t­ c¸ch c«ng thµnh trong tuÇn. §¨ng ký vµ thi ®Êu lµ 2 giai ®o¹n. Giai ®o¹n ®¨ng ký: TiÕn hµnh vµo 21:00 - 21:19 thø 6 h»ng tuÇn, bang héi cÇn ph¶i n»m trong TOP 10 cña Bang Héi Vinh Danh tuÇn tr­íc míi ®­îc ®¨ng ký. Do bang chñ ®¶m nhiÖm chøc ®éi tr­ëng (§ång ®éi ph¶i lµ thµnh viªn bang héi), mang theo 1 Th­ TiÕn Cö míi ®­îc b¸o danh. Khi thi ®Êu kÕt thóc th× bang héi h¹ng 1 sÏ nhËn ®­îc t­ c¸ch khiªu chiÕn c«ng thµnh.";
	local tbSay = {};
	tbSay.msg = SIEGE_NPC_NAME..tbBody;
	tbSay.sel = {
		{"\n Ph¶n håi", "siege_qualification"},
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

g_JoinMatchTong = {}

function siege_join_match()
	local time = tonumber(date("%H%M"));
	if time < 2100 or time >= 2120 then
		Say(SIEGE_NPC_NAME.."HiÖn t¹i kh«ng ph¶i thêi gian tham chiÕn!", 0);
		return 0;
	end
	if GetCaptainName() ~= GetName() then
		Say(SIEGE_NPC_NAME.."ChØ cã ®éi tr­ëng míi cß t­ c¸ch nãi chuyÖn víi ta!", 0);
		return 0;
	end
	local nDuty = GetTongDuty();
	if nDuty < 1 or nDuty > 3 then
		Say(SIEGE_NPC_NAME.."ChØ cã bang chñ, phã bang chñ, tr­ëng l·o míi cã thÓ b¸o danh tham gia T­ C¸ch C«ng Thµnh ChiÕn!", 0);
		return 0;
	end
	if GetTeamSize() == 0 then
		Say(SIEGE_NPC_NAME.."Ph¶i tæ ®éi míi ®­îc tham gia T­ C¸ch C«ng Thµnh ChiÕn!", 0);
		return 0;
	end
	local nRank = ht_GetSiegeTask()
	if nRank < 1 or nRank > 10 then
		Say(SIEGE_NPC_NAME.."ChØ cã bang héi nhËn phÇn th­ëng xÕp h¹ng tuÇn tr­íc cña Bang Héi Vinh Danh míi cã thÓ tham gia!", 0);
		return 0;
	end
	if GetItemCount(2, 1, 1200) < 1 then
		Say(SIEGE_NPC_NAME.."Trong tói kh«ng cã Th­ TiÕn Cö, kh«ng thÓ tham gia tranh ®o¹t t­ c¸ch c«ng thµnh!", 0);
		return 0;
	end
	local szTongName = GetTongName();
	local szGong,szShou = GetCityWarAD(SIEGE_MAP_ID);
	if szShou == szTongName then
		Say(SIEGE_NPC_NAME.."B¹n lµ thµnh viªn cña bang thñ thµnh, kh«ng thÓ tham gia tranh ®o¹t t­ c¸ch c«ng thµnh!", 0);
		return 0;
	end
	if gf_CheckTeam(function ()
			if %szTongName ~= GetTongName() then
				return 0;
			end
			return 1;
		end, SIEGE_NPC_NAME.."Thµnh viªn d­íi ®©y kh«ng ph¶i lµ thµnh viªn bang héi:") ~= 1 then
			return 0;
	end
--	local tbMapID = gf_GetDataTable(GetSameMaps(TM_REAL_MAPID));
--	local nMapIndex = nil
--	for i =1, getn(tbMapID) do
--		if tbMapID[i] ~= TM_REAL_MAPID then
--			nMapIndex = tbMapID[i]
--			break
--		end
--	end
--	if not nMapIndex then
--		Say(SIEGE_NPC_NAME.."Èü³¡ÉÐÎ´¿ªÆô£¬ÇëÏÂ´ÎÔÙÀ´£¡", 0);
--		return 0;
--	end
	if g_JoinMatchTong[szTongName] then
		Say(SIEGE_NPC_NAME..format("[%s] ®· dÉn d¾t thµnh viªn bang héi tham gia tranh ®o¹t t­ c¸ch c«ng thµnh!", g_JoinMatchTong[szTongName]), 0);
		return 0;
	end
	if DelItem(2, 1, 1200, 1) ~= 1 then
		return 0;
	end
	g_JoinMatchTong[szTongName] = GetName();
	ht_SetSiegeTask(0);	
	local nMapID = mf_GetMissionV(tbTONGMELEE.missionID, MV_MAP_ID, tbTONGMELEE.realMapID);
	if nMapID ~= 0 then
		tbTONGMELEE:TeamEnter(nMapID, 0);
	else
		nMapID = tbTONGMELEE:Create();
		tbTONGMELEE:TeamEnter(nMapID, 0);
	end
end

