
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")
Include("\\script\\global\\battlefield_callback.lua")

TSK_JUNGONG_PUNISH = 2152
TSK_JUNGONG_PUNISH_DATE = 2153
TSK_JUNGONG_LIMIT = 2155

tBattleRank = {
	{"Binh SÜ",1},
	{"HiÖu Uı",2},
	{"§« Thèng",3},
	{"Tiªn Phong",4},
	{"T­íng Qu©n",5},
	{"Nguyªn So¸i",6},
}

function OnDeath(HitMeNpcIndex, DeathPunish, Enmity)
	if Enmity > 0 then
		DoEnmityDeath(HitMeNpcIndex, DeathPunish)
	else
		DoNormalDeath(HitMeNpcIndex, DeathPunish)
	end
end

function DoEnmityDeath(HitMeNpcIndex, DeathPunish)
	
	--»ñÈ¡Ê¤·½°Ü·½route
	local nOldPIdx = PlayerIndex;
	local nLoseRoute = GetPlayerRoute()--¸º·½Á÷ÅÉ
	PlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)--Ê¹ÓÃPlayerIndex
	local nWinRoute = GetPlayerRoute() --Ê¤·½Á÷ÅÉ
	PlayerIndex = nOldPIdx
	
	--PKÊ¤ÂÊÍ³¼Æ
	local nPKStatWinKey = nWinRoute*100+nLoseRoute
	local nPKStatLoseKey = nLoseRoute * 100 + nWinRoute
	AddRuntimeStat(15,3,nPKStatWinKey,1)
	AddRuntimeStat(15,4,nPKStatWinKey,1)
	AddRuntimeStat(15,4,nPKStatLoseKey,1)
end

function DoNormalDeath(HitMeNpcIndex, DeathPunish)
	if DeathPunish > 0 then		-- ÓĞËÀÍö³Í·£
		first_tong_event();
		DoExtraPunish();
		DoHonorPunish();
		local tTitle = 
			{
				[100] = {5},
				[300] = {1},
				[350] = {9},
			}
		local strDeathName = GetName()
		local nRank = GetTask(704)
		local nTitle =0
		for k,v in tTitle do
		 	if IsTitleExist(51, tTitle[k][1] + GetSex() - 1) == 1 then
		 		nTitle = 1
		 		break
		 	end
		 end
		HitMePlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)
		if HitMePlayerIndex > 0 then
			if nRank == 6 or nRank == -6 or nTitle == 1 then
				local nOldIndex = PlayerIndex;
				PlayerIndex = HitMePlayerIndex;
				local strKillName = GetName()
				local nKillRank = GetTask(704)
				local strDeathSongLiao = ""
				local strKillSongLiao = ""
				if nRank > 0 then
					strDeathSongLiao = "Tèng "..tBattleRank[abs(nRank)][1]
				else
					strDeathSongLiao = "Liªu "..tBattleRank[abs(nRank)][1]
				end				
				if nTitle == 1 then
					strDeathSongLiao = "Thµnh Chñ"
				end				
				if nKillRank > 0 then
					strKillSongLiao = "Tèng "..tBattleRank[abs(nKillRank)][1]
				else
					strKillSongLiao = "Liªu "..tBattleRank[abs(nKillRank)][1]
				end
				
				local tMsg = {
					format("ThËt lîi h¹i! <color=yellow>%s %s<color> ®· ®¸nh b¹i <color=yellow>%s %s<color> träng th­¬ng, ph¶i vÒ thµnh d­ìng søc.",strKillSongLiao,strKillName,strDeathSongLiao,strDeathName),
					format("ThËt lîi h¹i! <color=yellow>%s %s<color> nhÊt thøc ®o¹t mÖnh <color=yellow>%s %s<color>, qu¶ lµ cao thñ tuyÖt ®Ønh vâ l©m.",strKillSongLiao,strKillName,strDeathSongLiao,strDeathName),
					format("ThËt lîi h¹i! <color=yellow>%s %s<color> ra tay xuÊt quû nhËp thÇn h¹ gôc <color=yellow>%s %s<color>, chØ kŞp nãi KiÕp sau ta sÏ tr¶ thï!",strKillSongLiao,strKillName,strDeathSongLiao,strDeathName),
					format("ThËt lîi h¹i! <color=yellow>%s %s<color> ®· ®¸nh b¹i <color=yellow>%s %s<color>, oai dòng v« song.",strKillSongLiao,strKillName,strDeathSongLiao,strDeathName),
				}
				
				local nRand = random(1,getn(tMsg))
				AddGlobalNews(tMsg[nRand])
				PlayerIndex = nOldIndex
			end
	
			if Zgc_pub_week_day() == 0 then --ÖÜÈÕ		
				local nlv = GetLevel();
				if nlv < 60 then  --60¼¶ÒÔÏÂ²»Í³¼Æ
					return
				end 			
				local nWeek = GetWeekSequence(7,0);
				local nOldIndex = PlayerIndex;
				local nFactionOne = GetPlayerFaction();
				PlayerIndex = HitMePlayerIndex;
				local nFactionTwo = GetPlayerFaction();
				PlayerIndex = nOldIndex;
				if nFactionOne ~= nFactionTwo then
					if GetTask(921) ~= nWeek then --ĞÂµÄÒ»ÂÖÕù°ÔÕ½¿ªÊ¼£¬³õÊ¼»¯Ë«·½±äÁ¿
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);
						PlayerIndex = HitMePlayerIndex;
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);	
						PlayerIndex = nOldIndex;				
					end
					SetTask(918,GetTask(918)+1);
					PlayerIndex = HitMePlayerIndex;
					SetTask(917,GetTask(917)+1);	
					PlayerIndex = nOldIndex;
				end
			end
		end		
	else
		HitMePlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)
		if HitMePlayerIndex > 0 then
			if Zgc_pub_week_day() == 0 then	--ÖÜÈÕ
				local nlv = GetLevel();
				if nlv < 60 then  --60¼¶ÒÔÏÂ²»Í³¼Æ
					return
				end 				
				local nWeek = GetWeekSequence(7,0);
				local nOldIndex = PlayerIndex;
				local nFactionOne = GetPlayerFaction();
				PlayerIndex = HitMePlayerIndex;
				local nFactionTwo = GetPlayerFaction();
				PlayerIndex = nOldIndex;
				if nFactionOne ~= nFactionTwo then				
					if GetTask(921) ~= nWeek then --ĞÂµÄÒ»ÂÖÕù°ÔÕ½¿ªÊ¼£¬³õÊ¼»¯Ë«·½±äÁ¿
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);
						PlayerIndex = HitMePlayerIndex;
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);	
						PlayerIndex = nOldIndex;				
					end
					SetTask(918,GetTask(918)+1);
					PlayerIndex = HitMePlayerIndex;
					SetTask(917,GetTask(917)+1);	
					PlayerIndex = nOldIndex;
				end
			end
		end
	end
end

function first_tong_event()
	if is_first_tong_jpz_open() == 0 then
		return
	end
	if check_time() == 1 and check_place() == 1 then
		SetDeathPunish(0);
	end;
end


function DoHonorPunish()
	SetRankPoint(5, 701, 1)	-- Ë¥¼õ²Ù×÷ÔÚSetRankPointµÄÊ±ºò²Å½øĞĞ,ËùÒÔÒªÏÈË¥¼õ,ÔÙ¿Û
	CalcBattleRank()
	
	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	local nCurRank = abs(GetTask(704))
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end

	if nCurRank <= 3 then
		return
	end
	
	local song_or_liao = 1
	local nHonor = GetTask(701)
	if nHonor < 0 then
		nHonor = -nHonor
		song_or_liao = -1
	end	
	
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TSK_JUNGONG_PUNISH_DATE) ~= nDate then
		SetTask(TSK_JUNGONG_PUNISH_DATE,nDate)
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT,0)
		Msg2Player("Qu©n c«ng cã thÓ chuéc ngµy h«m qua ®· hñy bá.")
	end
	
	if nHonor > 80000 then
		if nCurRank == 4 then
			nHonor = nHonor - 40	--ÏÈ·æ
			SetTask(771,GetTask(771)+40);
			SetTask(TSK_JUNGONG_PUNISH,GetTask(TSK_JUNGONG_PUNISH)+40*song_or_liao);			
			Msg2Player("B¹n tö vong tæn thÊt 40 ®iÓm c«ng tr¹ng")
		elseif nCurRank == 5 then
			nHonor = nHonor - 80	--´ó½«
			SetTask(771,GetTask(771)+80);
			SetTask(TSK_JUNGONG_PUNISH,GetTask(TSK_JUNGONG_PUNISH)+80*song_or_liao);
			Msg2Player("B¹n tö vong tæn thÊt 80 ®iÓm c«ng tr¹ng")
		elseif nCurRank == 6 then
			nHonor = nHonor - 150	--ÔªË§
			SetTask(771,GetTask(771)+150);
			SetTask(TSK_JUNGONG_PUNISH,GetTask(TSK_JUNGONG_PUNISH)+150*song_or_liao);			
			Msg2Player("B¹n tö vong tæn thÊt 150 ®iÓm c«ng tr¹ng")
		end
		if abs(GetTask(TSK_JUNGONG_PUNISH)) > 50000 then
			Msg2Player("Qu©n c«ng cã thÓ chuéc l¹i ®· ®ñ 50000, ®¹t tèi ®a.");
			SetTask(771,50000);	--×î¶àÀÛ»ıµ½50000µã¾ü¹¦
			SetTask(TSK_JUNGONG_PUNISH,50000*song_or_liao);
		end;
		nHonor = nHonor * song_or_liao
		SetTask(701, nHonor)
	end
end

--º¯ÊıÃû³Æ£ºÖÜ¼¸¼ÆËãº¯Êı
--¹¦        ÄÜ£º·µ»Ø½ñÌìÊÇĞÇÆÚ¼¸
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--¼ÆËãÖÜµÄĞòÊı
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--´¦ÀíÊ±²î
	nCurTime = nCurTime - 4*24*3600;	--¶ÔÆëµ½1970Äê1ÔÂ1ÈÕ£¨ĞÇÆÚËÄ£©ºóµÄµÚÒ»¸öÖÜÒ»Áè³¿¡£
	local nWeekSecond = 7*24*3600;	--Ò»ÖÜ¶àÉÙÃë
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--¼ÆËãÆ«ÒÆÊ±¼ä
	local nTotalTime = nCurTime - nOffset;	--¼ÆËãºóµÄ×ÜÊ±¼ä
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--¼ÆËãÖÜµÄĞòÊı
	return nWeekSeq;
end;

function DoExtraPunish()
	if GetLevel() >= 73 then
		ModifyReputation(-4, 0)
	end
	return
end