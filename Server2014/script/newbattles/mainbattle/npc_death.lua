Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
Include("\\script\\newbattles\\box_effect_head.lua");
TBOX_FILE = new(KTabFile, "\\settings\\newbattles\\mainbattle\\kill_npc_effect.txt")
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local sNpcName = GetNpcName(npcIndex);
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	if PlayerIndex == 0 then
		process_npc_kill_npc(npcIndex)
	else
		process_player_kill_npc(npcIndex)
	end;
end;

function get_emplacement_pos_index(nMapX,nMapY)
	for i=0,getn(tEmplacementPos) do
		if nMapX == tEmplacementPos[i][1] and nMapY == tEmplacementPos[i][2] then
			return i;
		end;
	end;
	BT_ShowDebugInfor("[ChiÕn tr­êng b¸o lçi]: Hµm sè get_emplacement_pos_index t×m kh«ng ®­îc vÞ trÝ ph¸o ®µi");
	WriteLog("[ChiÕn tr­êng b¸o lçi]: Hµm sè get_emplacement_pos_index t×m kh«ng ®­îc vÞ trÝ ph¸o ®µi");
end;
--´¦ÀíNPCÉ±ËÀNPCÊÂ¼þ
function process_npc_kill_npc(npcIndex)	
	local nVillageCamp = GetGlbValue(GLB_VILLAGE);
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName == "Thæ d©n" then	--¸ù¾Ý´åÂäÕ½½á¹ûÀ´È·¶¨¸øÄÄÒ»·½¼Ó·Ö
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
		if nVillageCamp ~= ALL_ID then
			BT_AddMissionPoint(SONGLIAO_ID-nVillageCamp,1);
		end;
		return 0;
	elseif sNpcName == "Thñ lÜnh thæ d©n" then	--¸ù¾Ý´åÂäÕ½½á¹ûÀ´È·¶¨¸øÄÄÒ»·½¼Ó·Ö
		SetMissionV(MV_HEADER_DEATH,1);
		if nVillageCamp ~= ALL_ID then
			BT_AddMissionPoint(SONGLIAO_ID-nVillageCamp,2);
		end;
		return 0;
	elseif sNpcName == "Kú nh©n dÞ sÜ" then	--Õâ¸öÊÇÖÐÁ¢NPC
		SetMissionV(MV_HERO_DEATH,1);
		return 0;
	elseif sNpcName == "TiÔn th¸p-Tèng" or sNpcName == "TiÔn th¸p-Liªu" then	--Õâ¸öNPCÊÇÓÃÀ´°ÚÉèµÄ
		return 0;
	elseif sNpcName == "Tèng B¸ch Th¾ng ChiÕn ThÇn" or sNpcName == "Liªu B¸ch Th¾ng ChiÕn ThÇn" then
		return 0;
	end	
	local nNpcCamp = get_npc_camp(sNpcName);
	process_camp_fight_camp(nNpcCamp,sNpcName,npcIndex,1)
end;
--´¦ÀíÍæ¼ÒÉ±ËÀNPCÊÂ¼þ
function process_player_kill_npc(npcIndex)
	local sNpcName = GetNpcName(npcIndex);
	local nNpcType = 0;
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local nEmplacementPosIndex = 0;
	local BoxEffectFunc = function(tArg)
		Do_Box_Effect(TBOX_FILE);
	end;
	if sNpcName == "Thæ d©n" then
		nNpcType = TYPE_REFUGEE;
		BT_AddBattleActivity(BA_MAIN_KILL_NATIVE);
	elseif sNpcName == "Thñ lÜnh thæ d©n" then
		nNpcType = TYPE_HEADER;
		SetMissionV(MV_HEADER_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"Ng­êi ch¬i:"..GetName().."  ®· giÕt "..sNpcName..", binh sÜ phÊn chÊn h¼n lªn",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	elseif sNpcName == "Kú nh©n dÞ sÜ" then
		nNpcType = TYPE_HERO;
		SetMissionV(MV_HERO_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"Ng­êi ch¬i:"..GetName().."  ®· giÕt "..sNpcName..", binh sÜ phÊn chÊn h¼n lªn",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	elseif sNpcName == "Tèng B¸ch Th¾ng ChiÕn ThÇn" or sNpcName == "Liªu B¸ch Th¾ng ChiÕn ThÇn" then
		return 0;
	else
		nNpcType = process_camp_fight_camp(nPlayerCamp,sNpcName,npcIndex,2)
		if nNpcType == TYPE_EMPLACEMENT then
			BT_AddBattleActivity(BA_MAIN_KILL_EMPL);
		elseif nNpcType <= TYPE_CAPTAIN then
			BT_AddBattleActivity(BA_MAIN_KILL_ENEMY);	--É±ËÀÒ»¸ö¶Ô·½Ê¿±ø£¬Ð£Î¾£¬¶¼Í³
		else 
			BT_AddBattleActivity(BA_MAIN_KILL_BOSS);	--É±ËÀ¶Ô·½ÕóÓªµÄÏÈ·æ¡¢½«¾ü¡¢ÔªË§
		end;
	end;
	BT_EmperorAward(tKillNpcEAP[nNpcType]);
	local nPoint = tKillNpcPoint[nNpcType]
	local nKillVillagerPoint = BT_GetData(PTNC_KILL_VILLAGER_POINT);
	local nKillSoldierPoint = BT_GetData(PTNC_KILL_SOLDIER_POINT);
	if nNpcType == TYPE_REFUGEE then	--Èç¹ûÉ±µÄÊÇÍÁÃñ£¬¾Í¼ÇÒ»ÏÂ
		if nKillVillagerPoint < KILL_VILLAGER_POINT_LIMITED then	
			BT_AddPersonalPoint(nPoint);	--¸øÓèÍæ¼ÒÒ»¶¨µÄ¸öÈË»ý·Ö
			BT_SetData(PTNC_KILL_VILLAGER_POINT,nKillVillagerPoint+nPoint);
		end;
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
	elseif nNpcType == TYPE_SOLDIER then	--Èç¹ûÉ±µÄÊÇÊ¿±ø£¬Ò²¼ÇÒ»ÏÂ
		if nKillSoldierPoint < KILL_SOLDIER_POINT_LIMITED then	
			BT_AddPersonalPoint(nPoint);	--¸øÓèÍæ¼ÒÒ»¶¨µÄ¸öÈË»ý·Ö
			BT_SetData(PTNC_KILL_SOLDIER_POINT,nKillSoldierPoint+nPoint);
		end;
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp)+1);
	else
		BT_AddPersonalPoint(nPoint);	--¸øÓèÍæ¼ÒÒ»¶¨µÄ¸öÈË»ý·Ö
	end;
	BT_AddMissionPoint(nPlayerCamp,nPoint);		--¸øÓèÒ»¶¨µÄ¹«¹²»ý·Ö
	Judge_State_By_Point(nPlayerCamp);
end;
--´¦ÀíÒ»¸öÕóÓªµÄÍæ¼Ò»òNPC´òËÀÁíÒ»¸öÕóÓªµÄNPCÊÂ¼þ
--ÒòÎªÊÇ·º»¯ÎªNPC´òNPC£¬Òò´ËÕâ¸öº¯ÊýÀïÃæ²»»á¶ÔÍæ¼Ò×´Ì¬½øÐÐ²Ù×÷£¬¼´¿ÉÒÔºöÂÔPlayerIndex
function process_camp_fight_camp(nPlayerCamp,sNpcName,nNpcIndex,nKillType)
	local nEnemyCamp = 3 - nPlayerCamp
	if nEnemyCamp >= 3 then
		nEnemyCamp = random(1,2)
	end
	local sNpcTypeName = get_npc_type(sNpcName);
	local _,nNpcPos_X,nNpcPos_Y = GetNpcWorldPos(nNpcIndex);
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	if sNpcTypeName == "Ph¸o ®µi" then		
		local nEmplacementPosIndex = get_emplacement_pos_index(nNpcPos_X,nNpcPos_Y);		
		local nEmplacementCamp = nPlayerCamp
		if nKillType == 1 then
			nEmplacementCamp = nEnemyCamp
		end
		Create_Emplacement(nEmplacementPosIndex,nEmplacementCamp)		
		if GetMissionV(MV_EMPLACEMENT0_POSSESSION) == GetMissionV(MV_EMPLACEMENT1_POSSESSION) and GetMissionV(MV_EMPLACEMENT0_POSSESSION) == GetMissionV(MV_EMPLACEMENT2_POSSESSION) then
			--Try_To_Create_FightNPC("ÔªË§",nEnemyCamp);	--±¾·½Õ¼¾ÝÈýÃÅ»ðÅÚ£¬¶Ô·½ÔªË§³ö
		end;
		SetNpcLifeTime(nNpcIndex,0);	--ÅÚÌ¨ÊÇÁ¢¼´ÏûÊ§µÄ
		nNpcType = TYPE_EMPLACEMENT;
	elseif sNpcTypeName == "Binh tinh nhuÖ" or sNpcTypeName == "C­êng nâ binh" or sNpcTypeName == "Dòng sÜ" or sNpcTypeName == "Ng¹nh tiÔn binh" then
		nNpcType = TYPE_SOLDIER;
	elseif sNpcTypeName == "TiÔn th¸p" then
		nNpcType = TYPE_ARROWBUILDING;
	elseif sNpcTypeName == "HiÖu óy" then
		nNpcType = TYPE_LOOEY;
		SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1) == LOOEY_COUNT then
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 0 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"HiÖu óy vµ ®« thèng cña phe Tèng bÞ ®¸nh b¹i, Tèng tiªn phong ®· xuÊt hiÖn.");
					else
						Msg2MSAll(MISSION_ID,"HiÖu óy vµ ®« thèng cña phe Liªu bÞ ®¸nh b¹i, Liªu tiªn phong ®· xuÊt hiÖn.");
					end;
				end;
				Try_To_Create_FightNPC("Tiªn phong",nEnemyCamp);	--¶Ô·½Ð£Î¾¶¼Í³±»ÍÀÂ¾´ù¾¡£¬¶Ô·½ÏÈ·æ³ö
			end;
		end;
	elseif sNpcTypeName == "§« thèng" then
		nNpcType = TYPE_CAPTAIN;
		SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
			if GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1) == LOOEY_COUNT then
				if nEnemyNpcType == 0 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"HiÖu óy vµ ®« thèng cña phe Tèng bÞ ®¸nh b¹i, Tèng tiªn phong ®· xuÊt hiÖn.");
					else
						Msg2MSAll(MISSION_ID,"HiÖu óy vµ ®« thèng cña phe Liªu bÞ ®¸nh b¹i, Liªu tiªn phong ®· xuÊt hiÖn.");
					end;
				end;
				Try_To_Create_FightNPC("Tiªn phong",nEnemyCamp);	--¶Ô·½Ð£Î¾¶¼Í³±»ÍÀÂ¾´ù¾¡£¬¶Ô·½ÏÈ·æ³ö
			end;
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 1 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"§« thèng tiªn phong cña phe Tèng bÞ ®¸nh b¹i, Tèng ®¹i t­íng ®· xuÊt hiÖn.");
					else
						Msg2MSAll(MISSION_ID,"§« thèng tiªn phong cña phe Liªu bÞ ®¸nh b¹i, Liªu ®¹i t­íng ®· xuÊt hiÖn.");
					end;	
				end;
				Try_To_Create_FightNPC("T­íng qu©n",nEnemyCamp);	--¶Ô·½¶¼Í³ÏÈ·æ±»ÍÀÂ¾´ù¾¡£¬¶Ô·½´ó½«³ö
			end;
		end;
	elseif sNpcTypeName == "Tiªn phong" then
		nNpcType = TYPE_PIONEER;
		SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
			if GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1) == GENERAL_COUNT then
				if nEnemyNpcType == 2 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"§¹i t­íng vµ tiªn phong cña phe Tèng bÞ ®¸nh b¹i, Tèng nguyªn so¸i ®· xuÊt hiÖn.");
					else
						Msg2MSAll(MISSION_ID,"§¹i t­íng vµ tiªn phong cña phe Liªu bÞ ®¸nh b¹i, Liªu nguyªn so¸i ®· xuÊt hiÖn.");
					end;
				end;
				Try_To_Create_FightNPC("Nguyªn So¸i",nEnemyCamp);	--¶Ô·½´ó½«ºÍÏÈ·æ¶¼±»Ãð£¬Ôò¶Ô·½ÔªË§³ö
			end;
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 1 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"§« thèng tiªn phong cña phe Tèng bÞ ®¸nh b¹i, Tèng ®¹i t­íng ®· xuÊt hiÖn.");
					else
						Msg2MSAll(MISSION_ID,"§« thèng tiªn phong cña phe Liªu bÞ ®¸nh b¹i, Liªu ®¹i t­íng ®· xuÊt hiÖn.");
					end;
				end;
				Try_To_Create_FightNPC("T­íng qu©n",nEnemyCamp);	--¶Ô·½¶¼Í³ÏÈ·æ±»ÍÀÂ¾´ù¾¡£¬¶Ô·½ÏÈ´ó½«³ö
			end;
		end;
	elseif sNpcTypeName == "T­íng qu©n" then
		nNpcType = TYPE_GENERAL;
		SetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1) == GENERAL_COUNT then
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 2 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"§¹i t­íng tiªn phong cña phe Tèng bÞ ®¸nh b¹i, Tèng nguyªn so¸i ®· xuÊt hiÖn.");
					else
						Msg2MSAll(MISSION_ID,"§¹i t­íng tiªn phong cña phe Liªu bÞ ®¸nh b¹i, Liªu nguyªn so¸i ®· xuÊt hiÖn.");
					end;
				end;
				Try_To_Create_FightNPC("Nguyªn So¸i",nEnemyCamp);	--¶Ô·½´ó½«ÏÈ·æ±»ÍÀÂ¾´ù¾¡£¬¶Ô·½ÔªË§³ö
			end;
		end;
	elseif sNpcTypeName == "Nguyªn So¸i" then
		nNpcType = TYPE_MARSHAL;
		if nEnemyCamp == SONG_ID then
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,GetName().." ®· ®¸nh b¹i nguyªn so¸i phe Tèng, phe Liªu giµnh th¾ng lîi chung cuéc.");
			else
				Msg2MSAll(MISSION_ID,GetNpcName(npcIndex).." ®· ®¸nh b¹i nguyªn so¸i phe Tèng, phe Liªu giµnh th¾ng lîi chung cuéc.");
			end;
		else
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,GetName().." ®· ®¸nh b¹i nguyªn so¸i phe Liªu, phe Tèng giµnh th¾ng lîi chung cuéc.");
			else
				Msg2MSAll(MISSION_ID,GetNpcName(npcIndex).." ®· ®¸nh b¹i nguyªn so¸i phe Liªu, phe Tèng giµnh th¾ng lîi chung cuéc.");
			end;		
		end;
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_WINNER,nPlayerCamp);
		ClearMapNpc(MAPID);	
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	end;
	SetNpcDeathScript(npcIndex,"");
	return nNpcType;
end;

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].."®· kÕt thóc, sù næ lùc cña c¸c vÞ sÏ ®­îc ban th­ëng xøng ®¸ng.",0);
	SetFightState(0);
end;
--¸ù¾ÝNPCÃû×Ö»ñÈ¡NPCµÄÕóÓª
function get_npc_camp(szNpcName)
	local nNpcCamp = 0;
	if szNpcName == "Tèng B¸ch Th¾ng ChiÕn ThÇn" or szNpcName == "Tèng qu©n tinh binh" or szNpcName == "Tèng qu©n c­êng nâ binh" or szNpcName == "Tèng hiÖu óy" 
		or szNpcName == "Tèng §« thèng" or szNpcName == "Tèng tiªn phong" or szNpcName == "T­íng qu©n (Tèng)" 
		or szNpcName == "Tèng nguyªn so¸i" or szNpcName == "Ph¸o ®µi Tèng" then
		nNpcCamp = SONG_ID;
	elseif  szNpcName == "Liªu B¸ch Th¾ng ChiÕn ThÇn" or szNpcName == "Liªu qu©n dòng sÜ" or szNpcName == "Liªu qu©n ng¹nh tiÔn binh" or szNpcName == "Liªu hiÖu óy" 
		or szNpcName == "Liªu §« thèng" or szNpcName == "Liªu tiªn phong" or szNpcName == "T­íng qu©n (Liªu) " 
		or szNpcName == "Liªu nguyªn so¸i" or szNpcName == "Ph¸o ®µi Liªu" then
		nNpcCamp = LIAO_ID;
	else
		nNpcCamp = ALL_ID;
	end;
	return nNpcCamp;
end;
--¸ù¾ÝNPCµÄÃû×Ö»ñÈ¡NPCµÄÀàÐÍ
function get_npc_type(szNpcName)
	local sNpcTypeName = "";
	if szNpcName == "Tèng qu©n tinh binh" or szNpcName == "Tèng qu©n c­êng nâ binh" or szNpcName == "Liªu qu©n dòng sÜ" or szNpcName == "Liªu qu©n ng¹nh tiÔn binh" then
		sNpcTypeName = "Binh tinh nhuÖ";
	elseif szNpcName == "Tèng hiÖu óy" or szNpcName == "Liªu hiÖu óy" then
		sNpcTypeName = "HiÖu óy";
	elseif szNpcName == "Tèng §« thèng" or szNpcName == "Liªu §« thèng" then
		sNpcTypeName = "§« thèng";
	elseif szNpcName == "Tèng tiªn phong" or szNpcName == "Liªu tiªn phong" then
		sNpcTypeName = "Tiªn phong";
	elseif szNpcName == "T­íng qu©n (Tèng)" or szNpcName == "T­íng qu©n (Liªu) " then
		sNpcTypeName = "T­íng qu©n";
	elseif szNpcName == "Tèng nguyªn so¸i" or szNpcName == "Liªu nguyªn so¸i" then
		sNpcTypeName = "Nguyªn So¸i";
	elseif szNpcName == "Ph¸o ®µi trung lËp" or szNpcName == "Ph¸o ®µi Liªu" or szNpcName == "Ph¸o ®µi Tèng" then
		sNpcTypeName = "Ph¸o ®µi";
	elseif szNpcName == "TiÔn th¸p-Tèng" or szNpcName == "TiÔn th¸p-Liªu" then
		sNpcTypeName = "TiÔn th¸p";
	end;
	return sNpcTypeName;
end;
