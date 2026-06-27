Include("\\script\\online\\viet_event\\pet_instance\\head.lua");
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\Ì«Ğé»Ã¾³\\head.lua")
--Ô½ÄÏ09Äê7ÔÂ»î¶¯¿ª¹ØÍ·ÎÄ¼ş
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");
--Ô½ÄÏ09Äê12ÔÂ»î¶¯Í·ÎÄ¼ş
Include("\\script\\online\\viet_event\\200912\\event_head.lua")
--ÈÕ³£ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\richangrenwu\\head.lua");
Include("\\script\\online_activites\\task_values.lua");--ÈÎÎñ±äÁ¿Í·ÎÄ¼ş
Include("\\script\\online_activites\\award.lua");--»î¶¯Ì«ĞéÏà¹Ø½±Àø£¨°üÀ¨É±ËÀÒ»¸ö¹Ö¸ø½±ÀøºÍÍ¨¹ıÌ«Ğé¸ø½±Àø£©
Include("\\script\\online\\award_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

function OnTimer()
	local nMap = GetWorldPos()
	if nMap == 1010 or nMap == 2010 then
		local nSteps = GetTaskTemp(TAIXU_STEPS)
--		local nMapID = GetTaskTemp(TAIXU_MAP_ID)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		local nStage = GetTaskTemp(TAIXU_STEP_CONTROL)
		SetTaskTemp(TAIXU_STEPS, nSteps + 1)
		SetMapTaskTemp(nMap, 1, nZone)
		SetMapTaskTemp(nMap, 2, nStage)
		
		local nRemainCount = CountGroupUnit(GROUP_MOB)
		local nRemainPet = CountPet()
		if GetMapTaskTemp(nMap, 4) >= 1 then
			if (nRemainCount > 0 and nSteps == 41) or nRemainPet == 0 then
				local nRealStage = nStage - 1
				Msg2Team("ThËt ®¸ng tiÕc, tæ ®éi vµ b¹n ®ång hµnh ®· kh«ng v­ît qua ®­îc thö th¸ch, kÕt qu¶ ®· v­ît qua tíi ¶i thø "..nZone.." tÇng "..nRealStage)
			--	L­u l¹i kû lôc sè ¶i ®· v­ît qua
				local OldPlayer = PlayerIndex
				for i=1, GetTeamSize() do
	        			PlayerIndex = GetTeamMember(i)
	        			pet_save_history()
	    			end
	    			PlayerIndex = OldPlayer
				PetGameOver(1)
			end
			
			if nRemainCount == 0 and nSteps > 1 and nSteps < 41 then
				if nStage < 10 then
					SetTaskTemp(TAIXU_STEP_CONTROL, nStage + 1)
				else
					SetTaskTemp(TAIXU_ZONE_INDEX, nZone + 1)
					if mod(nZone + 1, 5) == 0 then
						AddGlobalNews("Chóc mõng tæ ®éi cña "..GetName().." ®· xuÊt s¾c cïng b¹n ®ång hµnh ®· v­ît qua ®­îc ¶i thø "..nZone.." cña Th¸i H­ HuyÔn C¶nh.")
					end
					PetCreateTreasureChest(nZone)
					SetTaskTemp(TAIXU_STEP_CONTROL, 2)
				end
				local OldPlayer = PlayerIndex
				for i=1, GetTeamSize() do
	        			PlayerIndex = GetTeamMember(i)
	        			local nZone1 = GetMapTaskTemp(nMap, 1)
	        			local nStage1 = GetMapTaskTemp(nMap, 2)
	        			local nExp = tMobType[nZone1][3] * nStage1
	    				ModifyExp(nExp)
	    				Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!")
	    				WriteLogEx("Thai Hu Huyen Canh Ban Dong Hanh", "nhËn exp qua ¶i")
	    				if GetTaskTemp(TAIXU_PET_USEFOOD) < tLimitPetFoodUsed[nZone1] then
	    					SetTaskTemp(TAIXU_PET_USEFOOD, GetTaskTemp(TAIXU_PET_USEFOOD) + 1)
	    				end
	    				StopTimeGuage(nMap)
	    			end
	    			PlayerIndex = OldPlayer
				SetTaskTemp(TAIXU_STEPS, 0)
			end
		end

		if nSteps == 1 and nRemainCount == 0 then
			local nRealState = nStage - 1
			Msg2Team("B¾t ®Çu ¶i thø "..nZone.." tÇng "..nRealState)
			PetCreateMonster(nZone, nStage)
			local OldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
        			PlayerIndex = GetTeamMember(i)
        			local nZone1 = GetMapTaskTemp(nMap, 1)
        			local nStage1 = GetMapTaskTemp(nMap, 2) - 1
        			if nZone1 == 1 and nStage1 == 1 then
        				CreatePet(i, nMap)
        				SetMapTaskTemp(nMap, 4, 1)
        			end
        			pet_save_history()		
				WriteLogEx("Thai Hu Huyen Canh Ban Dong Hanh", "V­ît ¶i "..nZone1.." tÇng "..nStage1)
				StartTimeGuage("V­ît ¶i "..nZone1.." tÇng "..nStage1, 600, 0, nMap)
    			end
    			PlayerIndex = OldPlayer
		end
		if GetMapTaskTemp(nMap, 3) == 1 then
			if nZone > 3 then
				Msg2Team("Xin chóc mõng, tæ ®éi cïng b¹n ®ång hµnh ®· v­ît qua thö th¸ch cña Th¸i H­ HuyÔn C¶nh, ®Ó cã thÓ tham gia c¸c thö th¸ch kh¸c khã kh¨n h¬n ph¶i sö dông Th¸i H­ §a MËt Qu¶!")
				PetGameOver(1)
			end
		end
		if nZone > 17 then
			Msg2Team("Xin chóc mõng, tæ ®éi cïng b¹n ®ång hµnh ®· v­ît qua ®­îc toµn bé thö th¸ch cña Th¸i H­ HuyÔn C¶nh, hÑn gÆp l¹i ë nh÷ng thö th¸ch kh¸c khã kh¨n h¬n!")
			AddGlobalNews("Chóc mõng tæ ®éi cña "..GetName().." ®· xuÊt s¾c cïng b¹n ®ång hµnh v­ît qua ®­îc toµn bé thö th¸ch cña Th¸i H­ HuyÔn C¶nh.")
			local OldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
	        		PlayerIndex = GetTeamMember(i)
	        		pet_save_history()
	    		end
	    		PlayerIndex = OldPlayer
			PetGameOver(1)
		end
	else	
		local nSteps = GetTaskTemp(TAIXU_STEPS)
		local nMapid = GetTaskTemp(TAIXU_MAP_ID)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		local nStepControl = GetTaskTemp(TAIXU_STEP_CONTROL)
		-- ¼ÇÂ¼¸ÃZONE½øĞĞµÄÊ±¼ä
		SetMapTaskTemp(nMapid, nZone + 4, nSteps * 14)
		SetTaskTemp(TAIXU_STEPS, nSteps + 1)
		
		BroadCast(nSteps)		-- ¹ã²¥½ø¶È
	
		if nSteps == nStepControl then		--Ë¢¹Ö
			if GetTaskTemp(TAIXU_RINGS) >= 4 then		-- µÚ5¹ØÒÔºó¿ÉÄÜË¢³ö×°±¸¹Ö
				CreateMonster(GetTaskTemp(TAIXU_ZONE_INDEX), 1)
			else
				CreateMonster(GetTaskTemp(TAIXU_ZONE_INDEX), 0)
			end
			SetTaskTemp(TAIXU_RINGS, GetTaskTemp(TAIXU_RINGS) + 1)
			--¶ÓÎéËùÓĞµÄÈË¶¼¿ªÆôOnKill
			gf_TeamOperateEX(function () 
				SetTaskTemp(TMP_TASK_TAIXU_TAG, 0);
			end);
		end
	end
end

function BroadCast(nSteps)
	-- ¹ã²¥Ê±¼ä½ø¶È£¬´óÔ¼1·ÖÖÓÒ»´Î
	if mod(nSteps, 4) == 0 and nSteps < 129 then
		Msg2Team("Trong thêi gian ®· qua---["..nSteps.." / 129]")
	end
	
	if nSteps == 0 then			-- ¸Õ¿ªÊ¼½øÈë
		Msg2Team("§éi ngò ®· vµo Th¸i H­ HuyÔn C¶nh, §a MËt qu¶ b¾t ®Çu ph¸t huy t¸c dông")
	elseif nSteps == 21 or nSteps == 42 or nSteps == 64 then	-- 5, 10, 15·ÖÖÓ
		Msg2Team("T¸c dông §a MËt qu¶ cµng lóc cµng m¹nh")
	elseif nSteps == 86 then
		Msg2Team("H×nh nh­ cã c¬n giã m¸t thæi qua")
	elseif nSteps == 107 then
		Msg2Team("C¬n giã m¹nh thæi qua lµm mäi ng­êi bõng tØnh")
	elseif nSteps == 120 then
		Msg2Team("Th¸i H­ HuyÔn C¶nh ph¸t huy søc m¹nh mäi ng­êi ®Òu tØnh giÊc")
	elseif nSteps == 129 then
		Msg2Team("§a MËt qu¶ mÊt t¸c dông mäi ng­êi bŞ ®­a vÒ thµnh")
		GameOver(1)
	elseif nSteps == 200 + RINGS_INTERVAL then
		GameOver(1)
	end
end

function OnKill()
	if GetTaskTemp(TMP_TASK_TAIXU_TAG) ~= 0 then
		return
	end
	local TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	
	local nMonsterType = 0
	local nRingMax = 0
	local nZone = 0

	--ÊÇ·ñÍê³É¸öÈËÈÕ³£ÈÎÎñ
	if DAILY_TASK_0912_SWITCH == 1 then
		is_he_finish_the_personal_task(TT_TARGET_Name);
	end

	--Ô½ÄÏ09Äê7ÔÂ»î¶¯´òËÀ¹ÖÓĞ£±£°£¥µÄ¸ÅÂÊµô1¸ö³Â¾ÉÃØ±¾
	give_viet20090607_miben();
	--Ô½ÄÏ09Äê8ÔÂ»î¶¯´òËÀ¹ÖÓĞ£±£°£¥µÄ¸ÅÂÊµô1¸öË®¹û´ü
	give_viet200908_shuiguodai();
	--Ô½ÄÏ2009	´º½Ú»î¶¯
	if is_new_year_09_viet_open() == 1 then
		local nRandom = random(1,100)
		if nRandom <= 30 then
			add_bag_new_year_09_viet(1, "Th¸i H­ HuyÔn C¶nh")
		end
	end
	
	local nOldIndex = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nMonsterType = GetTaskTemp(TAIXU_MONSTER_TYPE)
		nRingMax = GetTaskTemp(TAIXU_RINGS_MAX)
		nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
	end
	PlayerIndex = nOldIndex
	
	SetNpcDeathScript(TT_TARGET_Index, "")
	DelGroupUnit(nZone + GROUP_OFFSET, TT_TARGET_Index)
	SetNpcLifeTime(TT_TARGET_Index, 10)
	
	local nRemainCount = CountGroupUnit(nZone + GROUP_OFFSET)
	local nKilledCount = FILE_ROW_COUNT - 2 - nRemainCount
	
	local szType = ""
	local nExp = 0
	
--	if nMonsterType == 1 then	--¾­Ñé
		szType = "Kinh nghiÖm"
		nExp = ONE_MONSTER_EXP
--	elseif nMonsterType == 2 then	--ĞŞÎª
--		szType = "LuyÖn"
--		nExp = ONE_MONSTER_POPUR
--	end
	
	
--	if szType ~= "" and (nKilledCount == 1 or mod(nKilledCount, 8) == 0) then
--		Msg2Team("§éi ngò hiÖn t¹i nhËn ®­îc"..szType.."lµ ("..(nExp * nKilledCount * nRingMax)..")")
--	end
	
	-- ¼ì²éÊÇ·ñÉ±ÍêÁËÒ»ÅúÀïÃæËùÓĞ¹ÖÎï
	-- ÊÇµÄ»°
	nOldIndex = PlayerIndex
	if nRemainCount == 0 then
		PlayerIndex = GetTeamMember(0)

		if PlayerIndex > 0 then
			-- É±ÍêÁËÒ»Åú¹ÖÎï£¬·¢½±Àø
			local nRingCount = GetTaskTemp(TAIXU_RINGS_MAX)
			local nCurRing = GetTaskTemp(TAIXU_RINGS)
			GiveAward(nMonsterType)	

			-- ÊÇ·ñÉ±ÍêËùÓĞµÄÌ«Ğé»ÃÏñ
			--¹ı¹Øºó¸ø½±ÀøÔÚÕâÀïÌí¼Ó
			if nCurRing == nRingCount then
				SetTaskTemp(TAIXU_STEPS, 200)
				--ÉèÖÃÆÁ±Î¹¦ÄÜ£¨ĞŞ¸´Ë¢¹ı¹Ø½±ÀøµÄBUG£©
				--¶ÓÎéËùÓĞµÄÈË¶¼¹Ø±ÕOnKill
				gf_TeamOperateEX(function () 
					SetTaskTemp(TMP_TASK_TAIXU_TAG, 1);
				end)
				Msg2Team("Chóc mõng! §éi ngò ®· tr¶i qua ¶o gi¸c thµnh c«ng!")
				--ÆäËû¹ı¹Ø½±Àø»ã×Ü
				gf_TeamOperateEX(aw_taixu_award, nCurRing);
				Observer:onTeamEvent(SYSEVENT_TAIXU_STAGE_FINISH, nCurRing)
				return
			end
			-- ÉèÖÃÏÂ´ÎË¢¹ÖµÄÊ±¼äÎª30Ãëºó
			SetTaskTemp(TAIXU_STEP_CONTROL, GetTaskTemp(TAIXU_STEPS) + RINGS_INTERVAL)
			--ÉèÖÃÆÁ±Î¹¦ÄÜ£¨ĞŞ¸´Ë¢¹ı¹Ø½±ÀøµÄBUG£©
			--¶ÓÎéËùÓĞµÄÈË¶¼¹Ø±ÕOnKill
			gf_TeamOperateEX(function () 
				SetTaskTemp(TMP_TASK_TAIXU_TAG, 1);
			end)
			Msg2Team("Chóc mõng ®éi ngò ®· qua ®­îc ¶o gi¸c thø"..nCurRing..", ¶o gi¸c thø"..(nCurRing + 1).."H­ ¶nh 30 gi©y sau sÏ xuÊt hiÖn, xin chuÈn bŞ thËt tèt! ¶o gi¸c mµ ®éi ngò nh×n ®­îc tæng céng "..nRingCount)
			--ÆäËû¹ı¹Ø½±Àø»ã×Ü
			gf_TeamOperateEX(aw_taixu_award, nCurRing);
			Observer:onTeamEvent(SYSEVENT_TAIXU_STAGE_FINISH, nCurRing)
		end
	end
	PlayerIndex = nOldIndex
end

function Leave_Map()
	local nMap = GetTaskTemp(TAIXU_MAP_ID)
	if IsCaptain() == 1 then
		if nMap == 1010 or nMap == 2010 then
			PetGameOver(1)
		else
			GameOver(1)
		end
	else
		if nMap == 1010 or nMap == 2010 then
			PetGameOver(0)
		else
			GameOver(0)
		end
	end
end

function OnLogin()
	RemoveTrigger(GetTrigger(TRIGGER_TIMER))
	RemoveTrigger(GetTrigger(TRIGGER_KILL))
	RemoveTrigger(GetTrigger(TRIGGER_RECT))
	RemoveTrigger(GetRunningTrigger())
	
	SetFightState(0)					-- ÉèÖÃÎª¿ÉÕ½¶·
	SetCreateTeam(0)					-- ¹Ø±Õ×é¶Ó¹¦ÄÜ
  InteractiveEnable(1)				-- ½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
  StallEnable(1)		   				-- °ÚÌ¯¿ª¹Ø
	ForbitTrade(0)						-- ½ûÖ¹½»Ò×
	OpenFriendliness(1)					-- ÌáÉıºÃ¸Ğ
end

--¸ø09Äê6ÔÂ7ÔÂ³Â¾ÉÃÜ±¾½±Àø
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		local nRand = random(1, 100);
		if nRand <= 10 then
			gf_SetLogCaption("Truy t×m tr­êng sinh phæ");
			gf_AddItemEx({2, 1, 30088, 1}, "Bİ Phæ Cò N¸t");
			WriteLogEx("Hoat dong thang 6","Th¸i H­",1,"Bİ Phæ Cò N¸t");
			gf_SetLogCaption("");
		end
	end
end


--¸ø09Äê8ÔÂ»î¶¯Ë®¹û´ü½±Àø
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		local nRand = random(1, 100);
		if nRand <= 10 then
			gf_SetLogCaption("[Hoat dong thang 8]");
			nRet = gf_AddItemEx({2, 1, 30097, 1}, "Tói Tr¸i C©y");
			if nRet == 1 then
				WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",1,"Danh quai Thai Hu");
			end;
			gf_SetLogCaption("");
		end
	end
end

--¸ø09Äê12ÔÂ»î¶¯Ê¥µ®ÌÇ¹û
function give_viet200912_shengdantangguo()
    local nDate = tonumber(date("%y%m%d"));
    if nDate >= 091218 and nDate < 100117 then
        local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE.."- V­ît ¶i th¸i h­ thu ®­îc kÑo gi¸ng sinh"
        gf_AddItemEx2({2, 1, 30138, 10}, "C©y KÑo Gi¸ng Sinh", szFullLog, 0, 1, 10, 1);
    end
end

function pet_save_history()
	local nMap = GetWorldPos()
	local nZone1 = GetMapTaskTemp(nMap, 1)
	local nStage1 = GetMapTaskTemp(nMap, 2)
	local nSavedStage = mod(GetTask(TSK_PET_TAIXU_POINT), 10) + 1
	local nSavedZone = floor(mod(GetTask(TSK_PET_TAIXU_POINT), 1000) / 10)
	if nSavedZone < nZone1 then
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) + (nZone1 - nSavedZone) * 10)
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) - nSavedStage + nStage1 - 1)
	elseif nSavedZone == nZone1 and nSavedStage < nStage1 then
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) - nSavedStage + nStage1 - 1)
	end
end