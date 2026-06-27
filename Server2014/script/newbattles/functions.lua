--º¯Êı¼¯ºÏ
Include("\\script\\newbattles\\head.lua")
Include("\\script\\lib\\time.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")
Include("\\script\\online\\award_head.lua")

THIS_FILE_NAME = "\\script\\newbattles\\functions.lua";

function BT_SetData(nTaskID, nValue)
	SetTask(nTaskID + BATTLE_OFFSET, nValue)
end

function BT_GetData(nTaskID)
	return GetTask(nTaskID + BATTLE_OFFSET)
end
--µÃµ½Íæ¼ÒÔÚÕ½³¡ÖĞµÄÕóÓª
function BT_GetCamp()
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);
	if nSignUpInfo == 0 then
		return 0;
	end;
	if mod(nSignUpInfo,10) == 1 then
		return SONG_ID;
	else
		return LIAO_ID;
	end;
end;
--µÃµ½Íæ¼Ò²Î¼ÓµÄÕ½³¡ID
function BT_GetBattleType()
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);
	if nSignUpInfo == 0 then
		return 0;
	end;
	return floor(nSignUpInfo/10);
end;
--¸ù¾İÍæ¼ÒË÷Òı»ñµÃÍæ¼ÒÃû×Ö£¬Ä¬ÈÏÎªµ±Ç°Íæ¼ÒË÷Òı
function BT_GetName(nIndex)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	PlayerIndex = nOldPlayer
	return sName
end
--ÉèÖÃÁÙÊ±±äÁ¿
function BT_SetTempData(nTaskID, nValue)
	SetTaskTemp(nTaskID, nValue)
end
--»ñÈ¡ÁÙÊ±±äÁ¿
function BT_GetTempData(nTaskID)
	return GetTaskTemp(nTaskID)
end
--Ôö¼Ó¸öÈËµÄÕ½³¡×Ü»ı·Ö
function BT_AddTotalPoint(nPoint)
	if nPoint == 0 then
		return
	end
	local nValue = BT_GetData(PT_TOTALPOINT)
	if nValue+nPoint < 0 then
		BT_SetData(PT_TOTALPOINT, 0);
	else
		BT_SetData(PT_TOTALPOINT, nValue + nPoint);
	end;
	SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);
end
--Ôö¼Ó¸öÈËÔÚÄ³³¡Õ½ÒÛÖĞµÄ¸öÈËµÃ·Ö£¨Õ½ÒÛ½áÊøºóÇå0£©
function BT_AddBattlePoint(nPoint)
	if nPoint == 0 then
		return
	end
	local nValue = BT_GetData(PTNC_BATTLEPOINT)
	if nValue+nPoint < 0 then
		BT_SetData(PTNC_BATTLEPOINT, 0);
		return nValue;	--·µ»Ø¿ÛÁË¶àÉÙ·Ö£¬±íÊ¾ÓÉÓÚ·ÖÊı²»¹»¿ÛÁË£¬Òª¿ÛÍêÊ£ÏÂµÄ»ı·Ö
	else
		BT_SetData(PTNC_BATTLEPOINT, nValue + nPoint);
		return nil;	--·µ»Ønil£¬±íÊ¾³É¹¦¿Û³ıÁË»ı·Ö
	end;
end
--Ôö¼ÓÍæ¼ÒÄ³Õ½ÒÛµÄµÃ·Ö
function BT_AddPlayerCampPoint(nPoint)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nCamp = BT_GetCamp();
	local nValue = 0;
	local tMapping = {
				[1] = {PT_VILL_POINT,RANK_VILLAGE},
				[2] = {PT_RESO_POINT,RANK_RESOURCE},
				[3] = {PT_EMPL_POINT,RANK_EMPLACEMENT},
				[4] = {PT_MAIN_POINT,RANK_MAIN},
				}
	local nTaskID = tMapping[nBattleType][1];
	nValue = BT_GetData(nTaskID) + nPoint;
	if nValue < 0 then
		nValue = 0;
	end;
	BT_SetData(nTaskID,nValue);
	SetRankPoint(tMapping[nBattleType][2],BATTLE_OFFSET+nTaskID,1);
end;
--Ôö¼Ó¸öÈË»ı·Ö£¬µÚ¶ş¸ö²ÎÊı±íÊ¾ÊÇ·ñ²»ÏÔÊ¾ĞÅÏ¢£¬£°ÎªÏÔÊ¾£¬·Ç£°Îª²»ÏÔÊ¾¡£Ä¬ÈÏÊÇÏÔÊ¾¡£
--µÚÈı¸ö²ÎÊı±íÊ¾ÊÇ·ñ¿ÉÎª¶ÓÎé³ÉÔ±Ôö¼Ó»ı·Ö¡££°Îª²»Ôö¼Ó£¬·Ç£°ÎªÔö¼Ó¡£Ä¬ÈÏ²»Ôö¼Ó
function BT_AddPersonalPoint(nPoint,bNotShowMsg,bTeamPoint)
	if nPoint == 0 then	--Èç¹ûÊÇ0·Ö¾Í²»¹ÜÁË
		return 0;
	end;
	local nTeamMemberCount = GetTeamSize();
	if nTeamMemberCount == 0 or FORBIDENT_CREATE_TEAM == 1 or bTeamPoint == 0 or bTeamPoint == nil then
		if BT_GetData(PTNC_BATTLEPOINT) + nPoint >= POINT_LIMITED then
			nPoint = POINT_LIMITED - BT_GetData(PTNC_BATTLEPOINT);
			Msg2Player("TrËn chiÕn nµy b¹n nhËn ®­îc ®iÓm tİch lòy tèi ®a:"..POINT_LIMITED);
		end;
		if bNotShowMsg == nil or bNotShowMsg == 0 then
			Msg2Player("B¹n nhËn ®­îc ®iÓm tİch lòy:"..nPoint);
		end;
		BT_AddContribution(nPoint);
		BT_AddTotalPoint(nPoint);
		BT_AddBattlePoint(nPoint);
		BT_AddPlayerCampPoint(nPoint);
	else
		BT_AddTeamPoint(nPoint,bNotShowMsg);
	end;
end
--»ñÈ¡Ä³¸öÕ½³¡ÊÂ¼şËù¶ÔÓ¦µÄ·ÖÊı£¬µÚÒ»¸ö²ÎÊıÎªÊÂ¼şID£¬µÚ¶ş¸ö²ÎÊı±íÊ¾ÊÇ·ñÊÇ»ù´¡·ÖÊı£¬0Îª²»ÊÇ£¬·Ç0ÎªÊÇ£¬Ä¬ÈÏ²»ÊÇ
function BT_GetBattleEvenPoint(nEvenID,bBasePoint)
	local nRoute = GetPlayerRoute();
	local nBasePoint = tBPEven[nEvenID];
	local nPoint = ceil(nBasePoint*tBPFactionAdjustment[nEvenID][nRoute]);
	if bBasePoint == 0 or bBasePoint == nil then
		return nPoint;
	else
		return nBasePoint;
	end;
end;
--¸ù¾İÕ½³¡ÊÂ¼şÀ´¸ø»ı·Ö¡£µÚÒ»¸ö²ÎÊıÎªÊÂ¼şID£¬µÚ¶ş¸ö²ÎÊı±íÊ¾ÊÇ·ñÏÔÊ¾ÌáÊ¾ĞÅÏ¢£¬£°ÎªÏÔÊ¾£¬·Ç£°Îª²»ÏÔÊ¾¡£Ä¬ÈÏÊÇÏÔÊ¾¡£
--µÚÈı¸ö²ÎÊı±íÊ¾ÊÇ·ñ¿ÉÎª¶ÓÎé³ÉÔ±Ôö¼Ó»ı·Ö¡££°Îª²»Ôö¼Ó£¬·Ç£°ÎªÔö¼Ó¡£Ä¬ÈÏ²»Ôö¼Ó
function BT_AddBattleEvenPoint(nEvenID,bNotShowMsg,bTeamPoint)
	local nPoint = BT_GetBattleEvenPoint(nEvenID);
	BT_AddPersonalPoint(nPoint,bNotShowMsg,bTeamPoint);
end;
--Ôö¼Ó¶ÓÎé»ı·Ö
function BT_AddTeamPoint(nPoint,bNotShowMsg)
	local nTeamMemberCount = GetTeamSize();
	if nTeamMemberCount == 0 then
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local _,nPosX,nPosY = GetWorldPos();	--»ñµÃ´¥·¢ÊÂ¼şµÄÍæ¼ÒµÄ×ø±ê
	local nTeamPoint = ceil(nPoint*TEAM_POINT_ATTENUATION);
	for i=1,nTeamMemberCount do
		PlayerIndex = GetTeamMember(i)
		if BT_GetDistance(nPosX,nPosY) <= TEAM_MEMBER_DISTANCE then
			if bNotShowMsg == nil or bNotShowMsg == 0 then
				Msg2Player("B¹n nhËn ®­îc ®iÓm tİch lòy ®éi ngò chiÕn tr­êng:"..nTeamPoint);
			end;
			BT_AddContribution(nTeamPoint);
			BT_AddTotalPoint(nTeamPoint);
			BT_AddBattlePoint(nTeamPoint);
			BT_AddPlayerCampPoint(nTeamPoint);			
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--¼õÉÙ¸öÈËÕ½³¡»ı·Ö£¬ÊÇ·ñÒª¼ÓÈë×é¶ÓµÄÇé¿öÄØ£¿
function BT_DecPersonalPoint(nPoint)
	if nPoint == 0 then	--Èç¹ûÊÇ0·Ö¾Í²»¹ÜÁË
		return 0;
	end;
	local nRetValue = BT_AddBattlePoint(-nPoint);
	if nRetValue ~= nil then	--Èç¹û¸öÈË»ı·Ö¿ÛÍêÁË
		nPoint = nRetValue;
		BT_ShowDebugInfor("HiÖn ®ang trõ ®i ®iÓm tİch lòy c¸ nh©n tõ tæng ®iÓm tİch lòy"..nRetValue.." ®iÓm");
	end;

	BT_AddPlayerCampPoint(-nPoint);
	BT_AddTotalPoint(-nPoint);
	Msg2Player(" §iÓm tİch lòy c¸ nh©n bŞ trõ ®i"..nPoint.." ®iÓm");
	BT_AddContribution(-ceil(nPoint/3));	--Èç¹û±»µĞ·½É±ËÀ£¬ÔòÔö¼Ó×Ô¼ºÔÚµĞ·½µÄÕ½¹¦£¨×öÄÚ¼é£¿£©
end;
--Ôö¼Ó¾ü¹¦£ºËÎ·½µÄ¾ü¹¦ÎªÕıÊı£¬ÁÉ·½µÄ¾ü¹¦Îª¸ºÊı
function BT_AddContribution(nPoint)
	--´¦Àí¼äµı×°ÊøĞ§¹û
	if GetTime() - BT_GetData(PT_SPYCLOTH_TIME) < ITEM_SPYCLOTH_TIME then	--ÔÚ¼äµı×°ÊøÓĞĞ§Ê±¼äÄÚ
		return 0;
	end;
	if BT_GetCamp() == LIAO_ID then
		nPoint = -nPoint;
	end;
	BT_SetData(PT_RANKPOINT,BT_GetData(PT_RANKPOINT)+nPoint);
	local nContribution = BT_GetData(PT_RANKPOINT);
	local nMaxSongCon = BT_GetData(PT_MAX_RANKPOINT_SONG);
	local nMaxLiaoCon = BT_GetData(PT_MAX_RANKPOINT_LIAO);
	if nContribution > nMaxSongCon then	
		BT_SetData(PT_MAX_RANKPOINT_SONG,nContribution);
	elseif nContribution < nMaxLiaoCon then
		BT_SetData(PT_MAX_RANKPOINT_LIAO,nContribution);
	end;
	SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
	return nPoint;
end;
--Ôö¼ÓÄ³ÕóÓªµÄ¹«¹²»ı·Ö
function BT_AddMissionPoint(nCamp,nPoint)
	if nPoint == 0 then
		return
	end
	if GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1)+nPoint < 0 then
		SetMissionV(MV_BATTLE_POINT_SONG+nCamp-1,0);
	else
		SetMissionV(MV_BATTLE_POINT_SONG+nCamp-1, GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1) + nPoint)
	end;
end
--¼õÉÙÄ³ÕóÓªµÄ¹«¹²»ı·Ö
function BT_DecMissionPoint(nCamp,nPoint)
	BT_AddMissionPoint(nCamp,-nPoint);
end;
--µÃµ½Ä³Ò»ÕóÓªµÄ¹«¹²»ı·Ö
function BT_GetMissionPoint(nCamp)
	return GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1);
end;
--»ÊµÛ½±Àø;ÊäÈë²ÎÊıÊÇ»ñµÃ½±ÀøµÄ»úÂÊ£¬¿ÉÒÔÊÇ¸¡µãÊı£¬Èç1.45%ÔòÊäÈë1.45¼´¿É
function BT_EmperorAward(nProbability)
	local StringFind = function(sString,nTag)
		for i=1,strlen(sString) do
			if strsub(sString,i,i) == nTag then
				return i;
			end;
		end;
		return 0;
	end;
	if nProbability > 100 or nProbability < 0 then
		return 0;
	end;
	local nDotPos = StringFind(tostring(nProbability),".")
	local nStrLen = strlen(tostring(nProbability));
	local nRandomNum = random(1,100*(10^(nStrLen-nDotPos)));
	if nRandomNum < nProbability*(10^(nStrLen-nDotPos)) then
		Talk(1,"","<color=yellow>Gi¸ th­ëng lÖnh: <color><enter>Do b¹n lËp ®­îc c«ng lín nªn nhËn ®­îc <color=yellow>"..EMPEROR_AWARD_POINT.." ®iÓm, kinh nghiÖm"..EMPEROR_AWARD_EXP.."<color>.");
		ModifyExp(EMPEROR_AWARD_EXP);
		BT_AddPersonalPoint(EMPEROR_AWARD_POINT);
		BT_SetData(PT_EMPEROR_AWARD_COUNT,BT_GetData(PT_EMPEROR_AWARD_COUNT)+1);
		Msg2MSGroup(MISSION_ID,"Ng­êi ch¬i "..GetName().."  lËp ®­îc c«ng lín nªn ®­îc ban th­ëng ®iÓm tİch lòy"..EMPEROR_AWARD_POINT.." ®iÓm, kinh nghiÖm"..EMPEROR_AWARD_EXP.." ®iÓm.",BT_GetCamp());
	end;
end
--Õ½µØÖ®ĞÇ
function BT_BattleStarAward()
	local IDTab = BT_SortMSPlayerByTaskValue(PTNC_BATTLEPOINT,0);
	local nPlayerCount = getn(IDTab);
	local strName = "";
	local nOldPlayerIndex = PlayerIndex;
	local nStarCount = 0;
	local sMul = "Tha";
	if nPlayerCount > 0 then
		PlayerIndex = IDTab[1];
		local nFirstPoint = BT_GetData(PTNC_BATTLEPOINT);
		for i=1,nPlayerCount do	--ÒòÎªÓĞ¿ÉÄÜÓĞ¶à¸ö×î¸ß·Ö£¬ËùÒÔ»¹ÊÇÒª±éÀúËùÓĞµÄÍæ¼ÒÒ»´Î
			PlayerIndex = IDTab[i];
			if BT_GetData(PTNC_BATTLEPOINT) == nFirstPoint then
				if IsPlayerDeath() == 0 then
					ModifyExp(BATTLE_STAR_AWARD_EXP)
					Msg2Player("B¹n nhËn ®­îc phÇn th­ëng Ng«i sao chiÕn ®Şa:"..BATTLE_STAR_AWARD_EXP.." ®iÓm kinh nghiÖm");
				end;
				BT_AddPersonalPoint(BATTLE_STAR_AWARD_POINT);
				BT_SetData(PT_BATTLE_STAR_COUNT,BT_GetData(PT_BATTLE_STAR_COUNT)+1);
				SetRankPoint(RANK_BATTLE_STAR,BATTLE_OFFSET+PT_BATTLE_STAR_COUNT,0);
				strName = strName..GetName()..",";
				nStarCount = nStarCount + 1;
			else
				break;
			end;
		end;
		strName = strsub(strName,1,strlen(strName)-2);
	end;
	if nStarCount > 1 then
		sMul = "hä";
	end;
	if nPlayerCount > 0 then
		Msg2MSAll(MISSION_ID,tBattleName[BT_GetData(PT_BATTLE_TYPE)].." sau khi kÕt thóc, vinh dù ng«i sao chiÕn tr­êng trao cho: "..strName..", xem nh­ biÓu d­¬ng!"..sMul.."Trong chiÕn dŞch nµy ng­êi cã biÓu hiÖn kiÖt xuÊt lµ");
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--½øÈëÕ½³¡Ê±¶ÔÍæ¼Ò½øĞĞµÄ²Ù×÷
function BT_SetPlayerState(nCamp)
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--»ñÈ¡Íæ¼Ò±¨ÃûµÄÇé¿ö£ºÄÄ¸öÕ½³¡£¬ÄÄ·½
	local nBattleType = floor(nSignUpInfo/10);
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--¸ù¾İnSignUpInfoÒ²¿ÉÒÔµÃµ½nBattleType£¬ÕâÀïÔÙ±£´æÒ»´Î»á²»»á¶àÓàÄØ£¿
	BT_ClearTempData();
	CreateTrigger(3,LOG_ID,LOG_TRIGGER_ID);
	LeaveTeam();	--Àë¿ª¶ÓÎé
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
	SetDeathPunish(0);	--ÎŞËÀÍö³Í·£
	if FORBIDENT_CREATE_TEAM == 1 then
		SetCreateTeam(1);	--¹Ø±Õ×é½¨¶ÓÎé(ÏÂÏßºó»á±»Çåµô)
	end;
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	InteractiveEnable(0);	--¹Ø±Õ½»»¥	±ØĞëÔÚNewWorldÖ®ºóÖ´ĞĞ²ÅÓĞĞ§
	StallEnable(0);	--½ûÖ¹°ÚÌ¯(ÏÂÏßºó»á±»Çåµô)
	UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--½ûÖ¹¸Ä±äPK×´Ì¬
	SetFightState(0);
	KillFollower();	--É¾³ı¸ú°à
	if nBattleType ~= RESOURCE_ID then
		SetCampToPlayer(tCampNameP[nCamp]);
	else
		SetCampToPlayer(tCampNameP[ALL_ID]);	--Èç¹ûÊÇ×ÊÔ´Õ½³¡ÔòËÎÁÉ¶¼ÊÇÖĞÁ¢ÕóÓª
	end;
	EnterChannel(tBattleChannel[nBattleType][1]);
	EnterChannel(tCampChannel[(nBattleType-1)*2+nCamp][1]);
	SetTempRevPos(ENTRANCE_POINT[nCamp][1],ENTRANCE_POINT[nCamp][2]*32,ENTRANCE_POINT[nCamp][3]*32);	--ÉèÖÃÖØÉúµã
	BT_ShowDebugInfor("Tö vong:"..DEATH_SCRIPT);
	SetDeathScript(DEATH_SCRIPT);
	BT_ClearCustomData();
end;
--Õ½³¡½áÊøÊ±Ëù×÷µÄ´¦Àí
function BT_ProcessBattleOver()
	--=============================¹«¹²Êı¾İ
	BT_SetData(PTNC_BATTLEPOINT,0);	--µ¥³¡»ı·ÖÇå¿Õ
	BT_ClearBattleActivity();	--»îÔ¾ÏµÊıÇå¿Õ
	BT_SetData(PT_BATTLE_DATE,0);
	--=============================´åÂäÕ½Êı¾İ
	--=============================×ÊÔ´Õ½Êı¾İ
	--=============================ÅÚÌ¨Õ½Êı¾İ
	--=============================Ö÷Õ½³¡Êı¾İ
	BT_SetData(PTNC_SERIES_KILL,0);	--µ¥³¡Á¬Õ¶Çå¿Õ
	BT_SetData(PTNC_KILL,0);			--µ¥³¡É±ÈËÊıÇå¿Õ
	BT_SetData(PTNC_DEATH,0);			--µ¥³¡ËÀÍöÊıÇå¿Õ
	local tMapping = {
			[VILLAGE_ID] = {PT_ATTEND_VILLAGE,PT_VILLAGE_WIN},
			[RESOURCE_ID] = {PT_ATTEND_RESOURCE,PT_RESOURCE_WIN},
			[EMPLACEMENT_ID] = {PT_ATTEND_EMPLACEMENT,PT_EMPLACEMENT_WIN},
			[MAINBATTLE_ID] = {PT_ATTEND_MAIN,PT_MAIN_WIN},
			}
	local nTaskIDAttend = tMapping[BATTLE_TYPE][1];
	local nTaskIDWin = tMapping[BATTLE_TYPE][2];
	local nCamp = BT_GetCamp();
	BT_SetData(nTaskIDAttend,BT_GetData(nTaskIDAttend)+1);	--²Î¼Ó
	if GetMissionV(MV_WINNER) == nCamp then
		BT_SetData(nTaskIDWin,BT_GetData(nTaskIDWin)+1);	--»ñÊ¤
	end;
end;
--Àë¿ªÕ½³¡Ê±Ëù×÷µÄ´¦Àí
function BT_RestorePlayerState()
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nCamp = BT_GetCamp();
	if nBattleType > 0 and nBattleType <= 4 then
		if nCamp > 0 and nCamp < 3 then
			LeaveChannel(tBattleChannel[nBattleType][1]);
			LeaveChannel(tCampChannel[(nBattleType-1)*2+nCamp][1]);
		else
			WriteLog("[ChiÕn tr­êng b¸o lçi]: TrŞ nCamp trong BT_RestorePlayerState b¸o lçi, trŞ b¸o lçi:"..nCamp);
		end;
	end;
	--==========================================================================
	RemoveTrigger(GetTrigger(LOG_TRIGGER_ID));
	if nBattleType == MAINBATTLE_ID then
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
	end;
	--==========================================================================
	SetLogoutRV(0);	
	SetDeathPunish(1);	
	SetCreateTeam(0);	
	ForbitTrade(0);
	InteractiveEnable(1);	
	StallEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);	--ÔÊĞí¸Ä±äPK×´Ì¬
	SetPKFlag(0,0);
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	--É¾³ı¸ú°à
	
	BT_ClearTempData();
	BT_ClearCustomData();
	BT_DeleteAllBattleItem();
	BT_SetData(PT_BATTLE_TYPE,0);
end;
--Çå³ıËùÓĞMission±äÁ¿
function BT_ClearMissionData()
	for i=1,10 do
		SetMissionS(i,"");
	end;
	for i=1,100 do
		SetMissionV(i,0);
	end;
end;
--Õ½³¡½áÊøÊ±¹«²¼Õ½Õù½á¹û¼°¸öÈËµÃ·ÖÇé¿ö
function BT_ReportFinalResult()
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nWhoWin = GetMissionV(MV_WINNER);
	local sStrResult = "";
	if nWhoWin == ALL_ID then
		sStrResult = "T¹i <color=yellow>"..tBattleName[nBattleType].."<color> Tèng-Liªu hai bªn bÊt ph©n th¾ng b¹i.";
	else
		if nWhoWin == SONG_ID then
			sStrResult = "<color=yellow>Phe Tèng<color> giµnh ®­îc <color=yellow>"..tBattleName[nBattleType].."<color>.";
		else
			sStrResult = "<color=yellow>Phe Liªu<color> giµnh ®­îc <color=yellow>"..tBattleName[nBattleType].."<color>.";
		end;
	end;
	local selTab = {
				--"²é¿´±¾³¡Õ½³¡Í³¼ÆĞÅÏ¢/#BTS_ViewBattleStatistic(1)",
				"§ãng/nothing",
				}
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nBattlePoint = BT_GetData(PTNC_BATTLEPOINT);
	local sPersonalPoint = "";
	if IB_VERSION == 1 then	--Èç¹ûÊÇIB°æ±¾
		sPersonalPoint = sStrResult.."<enter>ChiÕn dŞch lÇn nµy b¹n nhËn ®­îc <color=yellow>"..nBattlePoint.."<color> ®iÓm tİch lòy c¸ nh©n vµ <color=yellow>"..nPointAward.."<color> ®iÓm tİch lòy, <color=yellow>"..nJunGongAward.."<color> ®iÓm qu©n c«ng, <color=yellow>"..nExpAward.."<color> ®iÓm kinh nghiÖm.";
	else
		sPersonalPoint = sStrResult.."<enter>ChiÕn dŞch lÇn nµy b¹n nhËn ®­îc <color=yellow>"..nBattlePoint.."<color> ®iÓm tİch lòy c¸ nh©n vµ <color=yellow>"..nPointAward.."<color> ®iÓm tİch lòy, <color=yellow>"..nJunGongAward.."<color> ®iÓm qu©n c«ng, <color=yellow>"..nExpAward.."<color> ®iÓm kinh nghiÖm vµ <color=yellow>"..nGoldenExpAward.."<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. Mêi ®Õn ®iÓm b¸o danh l·nh th­ëng!";
	end;
	Say(sPersonalPoint,getn(selTab),selTab);
end;
--¶ÔMissionÖĞÄ³Ò»ÕóÓªÍæ¼Ò½øĞĞÍ³Ò»²Ù×÷
--Ê¹ÓÃ·½·¨£ºÏÈ¶¨ÒåÒ»¸öÖ´ĞĞº¯Êı£¬Õâ¸öº¯ÊıµÄÊäÈë²ÎÊıÎªÒ»table¡£
--È»ºó°ÑÕâ¸öº¯Êı×÷ÎªµÚÒ»¸öÊäÈë²ÎÊı¸øOP_AllMSPlayerº¯Êı¡£
--Í¨¹ı´«tableµÄ·½Ê½¿ÉÒÔ´«¶à¸ö²ÎÊı¸øÖ´ĞĞº¯Êı¡£
function BT_OperateAllPlayer(func,tArg,nCamp)
	local OldPlayerIndex = PlayerIndex;
	local IDTab = BT_GetMSPlayerIndex(nCamp);	
	local nPlayerCount = getn(IDTab);
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				func(tArg);
			else
				Write_Log("ChiÕn tr­êng b¸o lçi","BT_OperateAllPlayer(), h­íng dÉn ng­êi ch¬i trong IDTab nhá h¬n hoÆc b»ng 0");
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--Ôö¼ÓÕ½³¡»îÔ¾ÏµÊı¡£Õ½³¡»îÔ¾ÏµÊı=ÊÂ¼ş»ù´¡»îÔ¾ÏµÊı*ÃÅÅÉ»îÔ¾ÏµÊı
function BT_AddBattleActivity(nEvenID)
	local nRoute = GetPlayerRoute();
	BT_SetData(PTNC_ACTIVITY,BT_GetData(PTNC_ACTIVITY)+floor(tBAEven[nEvenID]*tBAFactionAdjustment[nEvenID][nRoute]));
	if BT_GetData(PTNC_ACTIVITY) > 100 then	--×î´óÖµ¾ÍÊÇ£±£°£°
		BT_SetData(PTNC_ACTIVITY,100);
	end;
end;
--Çå³ıÕ½³¡»îÔ¾ÏµÊı
function BT_ClearBattleActivity()
	BT_SetData(PTNC_ACTIVITY,0);
end;

--Ã¿µ±Íæ¼Ò½øÈëĞÂµÄÕ½³¡Ê±ÒªÇåµôµÄÊı¾İ
function BT_NewBattleClear2()
	local nDate = tonumber(date("%y%m%d"));
	if BT_GetData(PT_BATTLE_DATE) ~= nDate then	--Èç¹ûÉÏ´Î±¨ÃûÈÕÆÚÓëµ±Ç°ÈÕÆÚ²»Í¬£¨¼´ĞÂµÄÒ»Ìì£©
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		BT_ClearPTNC();
	end;
end;
function BT_NewBattleClear()	
	local nDate = tonumber(date("%y%m%d"));
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--»ñÈ¡Íæ¼Ò±¨ÃûµÄÊÇÄÄÒ»³¡´ÎµÄÕ½³¡
	if nDate*1000+nGlobalState - nSignUpTime > 1 then	--Çø·ÖÍ¬³¡´ÎµÄ²»Í¬Õ½³¡µÄ±¨Ãû½×¶ÎÓë¿ªÕ½½×¶Î£¬×îºÃÏÈÁË½â±¨ÃûµÄÊµÏÖÔ­Àí
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		BT_ClearPTNC();
	end;
end;
--Çå³ıËùÓĞµÄPTNC±äÁ¿
function BT_ClearPTNC()
		BT_SetData(PTNC_BATTLEPOINT,0);	--µ¥³¡»ı·ÖÇå¿Õ
		BT_SetData(PTNC_ACTIVITY,ACTIVITY_ADJUSTOR);
		BT_SetData(PTNC_USE_HOE_TIMES,0);
		BT_SetData(PTNC_SERIES_KILL,0);
		BT_SetData(PTNC_KILL,0);
		BT_SetData(PTNC_DEATH,0);
		BT_SetData(PTNC_KILL_VILLAGER_POINT,0);
		BT_SetData(PTNC_KILL_SOLDIER_POINT,0);
		BT_SetData(PTNC_GOT_MEDICINE,0);
		BT_SetData(PTNC_HELP_REFUGEE,0);
end;
--µÃµ½Íæ¼ÒÓëÄ³Ò»×ø±êµÄ¾àÀë
function BT_GetDistance(nX,nY)
	local _,nPosX,nPosY = GetWorldPos();
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--Çå³ıËùÓĞÁÙÊ±±äÁ¿
function BT_ClearTempData()
	for i=PTT_BEGIN,PTT_END do
		BT_SetTempData(i,0);
	end;
end;
--µÃµ½Õ½³¡ÀïÃæµÄÈËÊıĞÅÏ¢
function BT_GetPlayerCount(nBattleType,nCamp)
	if nBattleType == 0 then
		return 0;
	end;
	local nOldSubWorld = SubWorld;
	local nPlayerCount = 0;
	local nMapID = tBTMSInfo[nBattleType][2];
	local nMissionID = tBTMSInfo[nBattleType][1];
	SubWorld = SubWorldID2Idx(nMapID);
	nPlayerCount = GetMSPlayerCount(nMissionID,nCamp)
	SubWorld = nOldSubWorld;
	return nPlayerCount;
end;
--Çå¿ÕËùÓĞĞÂÕ½³¡Ïà¹ØµÄ·şÎñÆ÷È«¾Ö±äÁ¿
function BT_ClearGlbValue()
	for i=32, 36 do
		SetGlbValue(i,0);
	end;	
end;
--µÃµ½Ä³MissionÄ³ÕóÓªµÄËùÓĞÍæ¼ÒµÄË÷Òı£¬´æÓÚÒ»¸öÊı×é×÷º¯ÊıµÄ·µ»ØÖµ
function BT_GetMSPlayerIndex(nCamp)
	local tIndex = {};
	local nTotalPlayerNum = GetMSPlayerCount(MISSION_ID,nCamp);
	local msidx,sidx = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(MISSION_ID,msidx,nCamp);
			if sidx > 0 then
				tIndex[i] = sidx;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: Trong hµm sè ms_GetMSPlayerIndex nhËn ®­îc sè ng­êi cña phe nµo ®ã so víi getn(tIndex) kh«ng ®ång nhÊt. Sè ng­êi:"..nTotalPlayerNum..", getn(tIndex) chªnh lÖch lµ:"..getn(tIndex));
	end;
	return tIndex;
end;
--¸Ä±äÄ³ÕóÓªÀïÃæËùÓĞÍæ¼ÒµÄÄ³Ò»¸öÁÙÊ±±äÁ¿µÄÖµ
function BT_SetCampTempValue(nCamp,nTaskID,nValue)
	local IDTab = BT_GetMSPlayerIndex(nCamp);
	local nPlayerCount = getn(IDTab);
	local nOldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				BT_SetTempData(nTaskID,nValue);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--»ñµÃÄ³³¡Õ½ÒÛÖĞÄ³Ò»ÕóÓªµÄ±¨ÃûÈËÊı
function BT_GetSignUpPlayerCount(nBattleType,nCamp)
	return GetGlbValue(GLB_SIGN_UP_VILL_SONG+(nBattleType-1)*2+nCamp-1);
end;
--±¨ÃûÈËÊı¼Ó1
function BT_AddSignUpPlayerCount(nBattleType,nCamp)
	local nCurPlayer = BT_GetSignUpPlayerCount(nBattleType,nCamp)
	SetGlbValue(GLB_SIGN_UP_VILL_SONG+(nBattleType-1)*2+nCamp-1,nCurPlayer+1);
end;
--Íæ¼Ò¼ÓÈëÕ½³¡
function BT_JoinBattle(nCamp)
	CleanInteractive();	--ÔÚNewWorldÇ°½âÉ¢Ë«ÈË»¥¶¯¶¯×÷
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if NewWorld(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]) == 1 then
		if nCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,GetName().." ®· gia nhËp phe Tèng");
		else
			Msg2MSAll(MISSION_ID,GetName().." ®· gia nhËp phe Liªu");
		end;
		BT_SetPlayerState(nCamp);
		local nFaction = GetPlayerFaction();	--Í³¼Æ¸÷ÃÅÅÉÈËÊı
		local nFactionPlayerCount = BT_GetFactionPlayerCount(nFaction);
		BT_SetFactionPlayerCount(nFaction,nFactionPlayerCount+1);	--ÃÅÅÉÈËÊı¼Ó£±
		AddMSPlayer(MISSION_ID,nCamp);
		if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then	--Èç¹ûÊÇÔÚÕ½³¡¿ªÊ¼ºó¼ÓÈëµÄ
			BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
		end;
		return 1;
	else
		return 0;
	end;
end;
--Íæ¼ÒÀë¿ªÕ½³¡
function BT_LeaveBattle()
	local nCamp = BT_GetCamp();
	if DEBUG_VERSION == 1 then
		nCamp = 0;	--Èç¹ûÊÇµ÷ÊÔ°æ±¾£¬Ôò´«µ½ÈªÖİÄÇÀï¡£Èç¹ûÏë²âÊÔ±¨ÃûÄ£¿éµÄ»°£¬ÄÇ»¹ÊÇ´«ËÍµ½ãê¾©ÄÇ°É
	end;
	BT_RestorePlayerState();
	if NewWorld(EXIT_POINT[nCamp][1],EXIT_POINT[nCamp][2],EXIT_POINT[nCamp][3]) == 1 then
		local nBattleState = GetMissionV(MV_BATTLE_STATE);
		if nBattleState == MS_STATE_READY or nBattleState == MS_STATE_FIGHT then
			if nCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"Tèng"..GetName().." ®· rêi khái chiÕn tr­êng");
			else	
				Msg2MSAll(MISSION_ID,"Liªu"..GetName().." ®· rêi khái chiÕn tr­êng");
			end;
		end;
		--²Î¼ÓÁËÒ»´ÎÕ½³¡£¬ÆäËû½±Àø»ã×Ü
		if nBattleState == MS_STATE_COMPLETE then
			aw_bsBattle_award();
		end
		local nFaction = GetPlayerFaction();	--Í³¼Æ¸÷ÃÅÅÉÈËÊı
		local nFactionPlayerCount = BT_GetFactionPlayerCount(nFaction);
		BT_SetFactionPlayerCount(nFaction,nFactionPlayerCount-1);	--ÃÅÅÉÈËÊı¼õ£±		
		return 1;
	else
		return 0;
	end;
end;
--Õë¶ÔÄ³¸öÈÎÎñ±äÁ¿µÄÖµÀ´½øĞĞÅÅĞò¡£µÚÒ»¸ö²ÎÊıÊÇÕ½³¡µÄÈÎÎñ±äÁ¿ID£¬µÚ¶ş¸ö²ÎÊıÎª1±íÊ¾ÉıĞò£¬0±íÊ¾½µĞò
--µÚÈı¸ö²ÎÊıÖ¸¶¨ÕóÓª£¬Ä¬ÈÏÖµÎª0¡£·µ»ØÖµÎªÒ»¸ö±£´æÅÅÍêĞòºóµÄÍæ¼ÒË÷Òıtable
function BT_SortMSPlayerByTaskValue(nTaskID,bAscend,nCamp)
	if nCamp == nil then
		nCamp = ALL_ID;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local tIDTab = BT_GetMSPlayerIndex(nCamp);
	local fCompare = function(nPIndex1,nPIndex2)
		local nValue1,nValue2 = 0,0;
		PlayerIndex = nPIndex1;
		nValue1 = BT_GetData(%nTaskID);
		PlayerIndex = nPIndex2;
		nValue2 = BT_GetData(%nTaskID);
		if %bAscend == 1 then	--ÉıĞòÅÅÁĞ
			nValue1 = -nValue1;
			nValue2 = -nValue2;
		end;
		if nValue1 > nValue2 then
			return 1;
		else
			return nil;
		end;
	end;
	sort(tIDTab,fCompare);
	PlayerIndex = nOldPlayerIndex;
	return tIDTab;
end;
--°ÑÔÚºóÓªÍ£ÁôµÃÌ«¾ÃµÄÍæ¼ÒÇ¿ÖÆ´«ËÍµ½Õ½³¡
function BT_DrivePlayerOutOfShelter()
	if DRIVE_PLAYER_OUTOF_SHELTER == 0 then
		return 0;
	end;
	local Func = function(tArg)
		if GetFightState() == 0 then
			local nLeftLoop = BT_GetTempData(PTT_DIE_LOOP) - GetMissionV(MV_TIMER_LOOP);
			if nLeftLoop >= 5 then
				local nBattleType = BT_GetData(PT_BATTLE_TYPE);
				SetFightState(1);
				if nBattleType == VILLAGE_ID then
					DoScriptByName(GetName(),"\\script\\newbattles\\villagebattle\\trap.lua","main");
				elseif nBattleType == RESOURCE_ID then
					DoScriptByName(GetName(),"\\script\\newbattles\\resourcebattle\\trap.lua","main");
				elseif nBattletype == EMPLACEMENT_ID then
					DoScriptByName(GetName(),"\\script\\newbattles\\emplacementbattle\\trap.lua","main");
				else
					DoScriptByName(GetName(),"\\script\\newbattles\\mainbattle\\trap_back.lua","main");
				end;
				Msg2Player("B¹n kh«ng thÓ l­u l¹i trong hËu doanh");
			else
				Msg2Player("Thêi gian l­u l¹i trong hËu doanh cßn:"..Get_Time_String((5-nLeftLoop)*20))
			end;
		end;
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--Õ½³¡ÕıÊ½¿ª´òÊ±ÒªÉèÖÃµÄÒ»Ğ©×´Ì¬
function BT_RunBattle()
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	SetMissionV(MV_TIMER_LOOP,FIGHT_TIMER_LOOP);
	SetMissionV(MV_BATTLE_STATE,MS_STATE_FIGHT);
	local Func = function(tArg)
		BT_SetTempData(PTT_DIE_LOOP,FIGHT_TIMER_LOOP);
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--Õ½³¡³õÊ¼»¯Ê±ÒªÉèÖÃµÄÒ»Ğ©×´Ì¬
function BT_InitBattle()	
	SetGlbValue(1022,0)
	local BattleID = tonumber(date("%y%m%d%H"));	
	SetMissionV(MV_BATTLE_ID,BattleID*10+BATTLE_TYPE);
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_LOOP);
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIME);
	SetMissionV(MV_BATTLE_STATE,MS_STATE_READY);
	WriteLog("[NewBattle]:"..tBattleName[BATTLE_TYPE].."("..GetMissionV(MV_BATTLE_ID)..")start now,battle type:"..BATTLE_TYPE);
end;
--Õ½³¡½áÊøºóÒªÉèÖÃµÄÒ»Ğ©×´Ì¬£¬ÒªÔÚEndMissionµÄ×îºóÖ´ĞĞ
function BT_EndBattle()
	local IDTab = BT_SortMSPlayerByTaskValue(PTNC_BATTLEPOINT,0,ALL_ID);
	local nPlayerCount = getn(IDTab);
	local nSongPlayerCount = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nLiaoPlayerCount = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nSongPublicPoint = floor(BT_GetMissionPoint(SONG_ID)/nSongPlayerCount);
	local nLiaoPublicPoint = floor(BT_GetMissionPoint(LIAO_ID)/nLiaoPlayerCount);
	local nCamp = 0;
	local nWhoWin = GetMissionV(MV_WINNER);
	BT_BattleStarAward();	--ÆÀÑ¡Õ½µØÖ®ĞÇ£¬ÔÚ¼ÆËã¹«¹²»ı·ÖºÍÊ¤¸º»ı·ÖÖ®Ç°
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,2);
		if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then	--¼ÓÉÏÅĞ¶Ï£¬±ÜÃâÒ»Ğ©²»±ØÒªµÄÇå¿Õ²Ù×÷
			DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,3);
			DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,4);
		end;
		local nSongWin,nLiaoWin,nDraw;
		nSongWin,nLiaoWin,nDraw = GetRelayShareDataByKey(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"history_record");
		if nSongWin == nil then
			nSongWin = 0;
		end;
		if nLiaoWin == nil then
			nLiaoWin = 0;
		end;
		if nDraw == nil then
			nDraw = 0;
		end;
		local tGLB = {GLB_VILLAGE,GLB_RESOURCE,GLB_EMPLACEMENT,GLB_MAINBATTLE};
		if nWhoWin == SONG_ID then
			nSongWin = nSongWin + 1;
		elseif nWhoWin == LIAO_ID then
			nLiaoWin = nLiaoWin + 1;
		else
			nDraw = nDraw + 1;
		end;
		BT_ShowDebugInfor("nSongWin:"..nSongWin..", nLiaoWin:"..nLiaoWin..", nDraw:"..nDraw..", BATTLE_TYPE:"..BATTLE_TYPE);
		AddRelayShareData(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"","",0,"history_record","ddd",nSongWin,nLiaoWin,nDraw)
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,5,BATTLE_TYPE);
		ApplyRelayShareData(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"","");
	end;
	for i=1,nPlayerCount do	--´¦ÀíÃ¿¸öÈËµÄ¹«¹²»ı·ÖºÍÊ¤¸º»ı·Ö
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			nCamp = BT_GetCamp();
			if STATISTIC_OPEN == 1 then
				AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,2,"","",0,GetName(),"dddd",BT_GetData(PTNC_BATTLEPOINT),GetPlayerRoute(),GetLevel(),nCamp);
				if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then
					AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,3,"","",0,GetName(),"dddd",BT_GetData(PTNC_KILL),GetPlayerRoute(),GetLevel(),nCamp);
					AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,4,"","",0,GetName(),"dddd",BT_GetData(PTNC_DEATH),GetPlayerRoute(),GetLevel(),nCamp);
				end;
			end;
			local nActivity = BT_GetData(PTNC_ACTIVITY)/100;
			local nPublicPoint = 0;
			local nX = 0;	--Æ½ºâÏµÍ³
			if nCamp == SONG_ID then
				nPublicPoint = floor(nSongPublicPoint*nActivity);
				nX = (nSongPlayerCount+nLiaoPlayerCount)/(2*nSongPlayerCount);	--×ÜÈËÊı³ıÒÔ±¾·½2±¶ÈËÊı
			else
				nPublicPoint = floor(nLiaoPublicPoint*nActivity);
				nX = (nSongPlayerCount+nLiaoPlayerCount)/(2*nLiaoPlayerCount);
			end;
			if nX > 3 then
				nX = 3;
			end;
			nPublicPoint = floor(nPublicPoint*nX);
			BT_SetTempData(PTT_PUBLIC_POINT,nPublicPoint);
			
			local nResultPoint = 0;
			local nLevel = GetLevel();
			local nExpAward = 0;
			local nGoldenExpAward = 0;
			local nExpX = nActivity*nX;	--»îÔ¾ÏµÊı¡ÁÆ½ºâÏµÊı
			local nU = 0;
			if IB_VERSION == 1 then
				nU = 80;
			else
				nU = 75;
			end;
			if nWhoWin == ALL_ID then	--Ê¤¸º»ı·Ö
				nResultPoint = floor(DRAW_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_DRAW*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_DRAW*nExpX);
			elseif nCamp == nWhoWin then
				nResultPoint = floor(WINNER_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_WIN*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_WIN*nExpX);
			else
				nResultPoint = floor(LOSER_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_LOSE*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_LOSE*nExpX);
			end;
			local tExpX = {1,1,1.5,2,2,3};	--Óë¾üÏÎ¶ÔÓ¦µÄ¾­ÑéÏµÊı
			local nCurRank = abs(BT_GetData(PT_CURRANK));
			if nCurRank == 0 or nCurRank > getn(tExpX) then	--Èç¹ûÃ»ÓĞ¾üÏÎ»ò¾üÏÎ³ö´í
				nCurRank = 1;	--ÖÃÎª1
			end;
			nResultPoint = floor(nResultPoint*nX)
			local nPointAward = nResultPoint + nPublicPoint;
			if nPointAward + BT_GetData(PTNC_BATTLEPOINT) > POINT_LIMITED then
				nPointAward = POINT_LIMITED - BT_GetData(PTNC_BATTLEPOINT);
			end;
			local nJunGongAward = nResultPoint + nPublicPoint;
			nJunGongAward = min(POINT_LIMITED,nJunGongAward);
			--¼Ó³ÉÏµÊı
			nJunGongAward = 3* nJunGongAward * (1+BATTLE_JUNGONG_EXT_RATE)
			nExpAward = 9* nExpAward * (1+BATTLE_EXP_EXT_RATE)*(1+GetVipCardParam())
			BT_SetTempData(PTT_RESULT_POINT,nResultPoint);
			BT_SetData(PT_EXP_AWARD,floor(nExpAward*tExpX[nCurRank]));	--¼ÇÂ¼¾­Ñé½±ÀøÊıÖµ
			BT_SetData(PT_GOLDENEXP_AWARD,floor(nGoldenExpAward*tExpX[nCurRank]));
			BT_SetData(PT_POINT_AWARD,nPointAward);
			BT_SetData(PT_JUNGONG_AWARD,nJunGongAward);
			BT_SetData(PT_LAST_CAMP,nCamp);
			BT_SetData(PT_LAST_BATTLE,BATTLE_TYPE);
			BT_SetData(PT_LAST_RESULT,nWhoWin);
			--BT_SetData(PT_SPYCLOTH_TIME,0);	--¼äµı×°ÊøĞ§¹ûÇå³ı
		end;
	end
	if BATTLE_TYPE == MAINBATTLE_ID then
		BT_ShowBattleRank(10,1);
	else
		BT_ShowBattleRank(10);
	end;	
	for i=1,nPlayerCount do	--ÉÆºó´¦Àí
		PlayerIndex = IDTab[i];
		BT_ReportFinalResult();
		BT_ProcessBattleOver();
		BT_ShowDebugInfor("Trong BT_EndBattle, xãa nh©n vËt:"..GetName()..", trŞ BT_GetData(PT_SIGN_UP):"..BT_GetData(PT_SIGN_UP));
		DelMSPlayer(MISSION_ID,ALL_ID);
		BT_SetData(PT_SIGN_UP,0);		--±¨ÃûĞÅÏ¢Çå¿Õ£¨µ¥³¡Õ½³¡²âÊÔ½×¶ÎÓÃ£©
	end;
	WriteLog("[ChiÕn tr­êng Nh¹n M«n Quan]:"..tBattleName[BATTLE_TYPE].."("..GetMissionV(MV_BATTLE_ID)..") ®· kÕt thóc, kÕt qu¶:"..GetGlbValue(GLB_VILLAGE-1+BATTLE_TYPE));
	SetMissionV(MV_BATTLE_STATE,MS_STATE_PEACE);	--ÆäÊµÕâ¸öÔÚClear_MissionDataÖĞÒ²»á±»Çå£¬ÕâÀïÖ»ÊÇĞÎÊ½¶øÒÑ
	BT_ClearMissionData();
	ClearMapNpc(MAPID);
	ClearMapTrap(MAPID);
end;
--ÖÎÁÆËùÓĞºÍÆ½×´Ì¬µÄÍæ¼Ò
function BT_CureAllPlayer()
	if CURE_ALL_PLAYER == 0 then
		return 0;
	end;
	local Func = function(tArg)
		if GetFightState() == 0 then
			BT_RestoreAll();
		end;
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--»Ö¸´ËùÓĞÉúÃüºÍÄÚÁ¦
function BT_RestoreAll()
	Restore();
	RestoreNeili();
end;
--Ö÷Õ½³¡½áÊøºóËùÒª×öµÄ²Ù×÷
function BT_BattleAllOver()
	SetGlbValue(GLB_NEW_BATTLESTATE,0);	--±ê¼Ç±¾³¡´ÎµÄÕ½³¡ÒÑ¾­È«²¿½áÊø
	for i=GLB_VILLAGE,GLB_MAINBATTLE do
		SetGlbValue(i,0);
	end;
	for i=GLB_SIGN_UP_VILL_SONG,GLB_SIGN_UP_MAIN_LIAO do	--±¨ÃûÈËÊıÇå¿Õ
		SetGlbValue(i,0);
	end;
end;
--»ñµÃMissionÀïÃæËùÓĞ·ûºÏÄ³Ò»Ìõ¼şµÄÍæ¼ÒµÄÄ³Ò»ÏîĞÅÏ¢£¬ÒÔtableµÄĞÎÊ½·µ»Ø
--Ìõ¼şÓÉFuncº¯Êı¶¨ÖÆ
--·µ»ØµÄtableµÄÔªËØ½á¹¹ÓÉFunc·µ»ØµÄ½á¹û¾ö¶¨¡£
function BT_GetMSPlayerInfo(Func,tArg,nCamp)
	local IDTab = BT_GetMSPlayerIndex(nCamp);
	local tInfo = {};
	local nOldPlayerIndex = PlayerIndex;
	local nCounter = 1;
	local nRetInfo;
	for i=1,getn(IDTab) do
		PlayerIndex = IDTab[i];
		nRetInfo = Func(tArg);
		if nRetInfo ~= nil then
			tInfo[nCounter] = nRetInfo;
			nCounter = nCounter + 1;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	return tInfo;
end;
--Çå³ıËùÓĞĞèÒªÇå³ıµÄCustomData
function BT_ClearCustomData()
	for i=1,getn(tCustomDataString) do
		if tCustomDataString[i][1] == 0 then
			CustomDataRemove(tCustomDataString[i][2]);
		end;
	end;
end;
--»ñµÃÕ½³¡ÀïÃæÄ³¸öÃÅÅÉµÄÈËÊıÊıÁ¿
function BT_GetFactionPlayerCount(nFaction)
	local nDWOffset = floor(nFaction/4);
	local nByteOffset = mod(nFaction,4)+1;
	local nMVID = MV_FACTION_PLAYER_COUNT1+nDWOffset;
	local nMissionV = GetMissionV(nMVID);
	return GetByte(nMissionV,nByteOffset);
end;
--ÉèÖÃÕ½³¡ÀïÃæµÄÄ³¸öÃÅÅÉµÄÈËÊıÊıÁ¿
function BT_SetFactionPlayerCount(nFaction,nValue)
	if nValue < 0 then
		BT_ShowDebugInfor("Sè ng­êi m«n ph¸i b¸o lçi nValue"..nValue);
		nValue = 0;
	end;
	local nDWOffset = floor(nFaction/4);
	local nByteOffset = mod(nFaction,4)+1;
	local nMVID = MV_FACTION_PLAYER_COUNT1+nDWOffset;
	local nMissionV = GetMissionV(nMVID);
	SetMissionV(nMVID,SetByte(nMissionV,nByteOffset,nValue));
end;
--É¾³ıËùÓĞÕ½³¡Ïà¹ØµÄÎïÆ·£¨²»ÄÜ´ø³öÕ½³¡ÍâµÄ£©
function BT_DeleteAllBattleItem()
	local nItemCount = 0;
	for i=1,getn(tBattleItem) do
		if tBattleItem[i][5] == 1 then
			nItemCount = BigGetItemCount(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4]);
			if nItemCount > 0 then
				BigDelItem(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4],nItemCount)	
			end;
		end;
	end;
	for i=1,getn(tBattleMed) do	--É¾³ıÕ½³¡PKÒ©
		nItemCount = BigGetItemCount(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4]);
		if nItemCount > 0 then
			BigDelItem(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4],nItemCount)	
		end;
	end;
end;
--µ÷ÊÔÊ±ÓÃÖ¸Áî£¬nType²ÎÊıÈç¹û²»Ğ´»òÎª£°±íÊ¾ÊÇprintÊä³ö£¬·ñÔòÊÇMsg2SubWorldÊä³ö
function BT_ShowDebugInfor(Arg,nType)
	if DEBUG_VERSION == 1 then
		if nType == nil or nType == 0 then
			print("\n §iÒu chØnh tin tøc:"..Arg.."\n")
		elseif nType == 1 then
			Msg2SubWorld("ChØnh tin tøc:"..Arg);
		end;
	end;
end;
--Çå³ıRelay¹²ÏíÊı¾İ¿âµÄÒ»Ğ©ĞÅÏ¢£¬Ö÷ÒªÊÇÅÅĞĞ°ñĞÅÏ¢
function BT_ClearRelayData()
	ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,2,"","");	--Çå³ı·şÎñÆ÷¶ËÉÏÒ»³¡µÄ¸öÈË»ı·ÖÅÅÃû
	--DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,2);
	if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then	--¼ÓÉÏÅĞ¶Ï£¬±ÜÃâÒ»Ğ©²»±ØÒªµÄÇå¿Õ²Ù×÷
		ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,3,"","");	--Çå³ı·şÎñÆ÷¶ËÉÏÒ»³¡µÄ¸öÈË»ı·ÖÅÅÃû
	--	DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,3);
		ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,4,"","");	--Çå³ı·şÎñÆ÷¶ËÉÏÒ»³¡µÄ¸öÈË»ı·ÖÅÅÃû
	--	DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,4);
	end;
end;
--ÏÔÊ¾ÅÅÃû£¬µÚ¶ş¸ö²ÎÊıÎª1Ê±±íÊ¾ÏòÈ«ÊÀ½çÍæ¼ÒÏÔÊ¾ÅÅÃû£¬·ñÔòÖ»ÊÇÏòÕ½³¡ÀïÃæµÄÍæ¼ÒÏÔÊ¾
function BT_ShowBattleRank(nPlayerCount,bShowWorld)
	local tbPlayer = mf_SortMSPlayerByTaskValue(MISSION_ID,PTNC_BATTLEPOINT+BATTLE_OFFSET,0);
	local nOldPlayerIdx = PlayerIndex;
	if bShowWorld == 1 then
		Msg2Global(tostring(tBattleName[BATTLE_TYPE]).."Tİch lòy c¸ nh©n: "..nPlayerCount..":");
	else
		Msg2MSAll(MISSION_ID,tostring(tBattleName[BATTLE_TYPE]).."Tİch lòy c¸ nh©n: "..nPlayerCount..":");
	end;
	for i=1,min(getn(tbPlayer),nPlayerCount) do
		PlayerIndex = tbPlayer[i];
		if bShowWorld == 1 then
			Msg2Global("thø"..i..": ("..tCampNameZ[BT_GetCamp()]..")"..GetName().." "..BT_GetData(PTNC_BATTLEPOINT).." Phót ");
		else
			Msg2MSAll(MISSION_ID,"thø"..i..": ("..tCampNameZ[BT_GetCamp()]..")"..GetName().." "..BT_GetData(PTNC_BATTLEPOINT).." Phót ");
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--°ÑÔÚºóÓªË¯¾õµÄÍæ¼ÒÌß³öÈ¥
function BT_KickSleeper()
	if IsSleeping() == 1 and GetFightState() == 0 then	--ºóÓªË¯ÃßÕßÌß³öÕ½³¡
		Talk(1,"","<color=yellow>Nguyªn so¸i:<color> Qu©n ®Şch tr­íc mÆt, cßn d¸m ngñ n÷a sao! Ng­êi ®©u! L«i h¾n ®i!");
		DelMSPlayer(MISSION_ID,BT_GetCamp());
		return 1;
	end;
	return 0;
end;
--¸ù¾İÍæ¼Òµ±Ç°µÄ¾ü¹¦Õı¸º»ñÈ¡Íæ¼ÒµÄÕóÓª£¬¾ü¹¦Îª0Õßµ±ËÎ·½´¦Àí
function BT_GetCurCamp()
	if BT_GetData(PT_RANKPOINT) >= 0 then
		return SONG_ID;
	else
		return LIAO_ID;
	end;
end;

function BT_GetCurRank()
	local nCurRank = abs(BT_GetData(PT_CURRANK))
	return nCurRank;
end;

function summon_god_of_war()
	local sNpcName = "";
	local nCurCamp = BT_GetCamp()	
	if nCurCamp == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end
	local tSay = 
	{
		"Mau truyÒn lÖnh cña bæn Nguyªn So¸i!/confirm_god_of_war",
		"§Ó ta suy nghÜ l¹i/nothing",	
	}
	Say("<color=green>"..sNpcName.."<color>: ChiÕn ThÇn sÏ xuÊt hiÖn gióp phe ta ®ét ph¸ vßng v©y qu©n ®Şch trong vßng 2 phót. Mçi trËn chiÕn chØ ®­îc phĞp gäi ChiÕn ThÇn trî gióp tèi ®a 2 lÇn. <color=yellow>Nguyªn So¸i<color> ®ång ı chø?",getn(tSay),tSay)
end

function confirm_god_of_war()
	local sNpcName = "";
	local nBattleType = BT_GetBattleType();
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local nCurCamp = BT_GetCamp()
	local nStartTime = GetGlbValue(1034)
	local nBit1 = 9
	local nBit2 = 10
	local szCamp = "Tèng"
	if nCurCamp == SONG_ID then
		sNpcName = sSongGeneral;
		if GetTask(704) < 0 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Gian tÕ phe Liªu d¸m m¹o danh Nguyªn So¸i µ? Ng­êi ®©u! B¾t h¾n!")
			return 0
		end	
	else
		sNpcName = sLiaoGeneral;
		local szCamp = "Liªu"
		nBit1 = 11
		nBit2 = 12
		nStartTime = GetGlbValue(1035)
		if GetTask(704) >= 0 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Gian tÕ phe Tèng d¸m m¹o danh Nguyªn So¸i µ? Ng­êi ®©u! B¾t h¾n!")
			return 0
		end	
	end;
	if BT_GetCurRank() ~= 6 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: TiÓu tèt nh­ ng­¬i mµ còng ®ßi ban lÖnh cho ta µ? Ng­êi ®©u! B¾t h¾n!")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ph¶i cã danh hiÖu Nguyªn So¸i míi cã thÓ ph¸t lÖnh tÊn c«ng! Mêi Nguyªn So¸i kiÓm tra l¹i.")
		return 0
	end
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>"..sNpcName.."<color>: §¹i qu©n ch­a xuÊt ph¸t! Mêi Nguyªn So¸i quay l¹i sau!")
		return 0
	end
	if (GetTime() - nStartTime < (5*60 + 15)) or (GetTrigger(2509) == 1) then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Thêi gian triÖu gäi 2 lÇn liªn tiÕp lµ 5 phót. Mêi Nguyªn So¸i quay l¹i sau.")
		return 0
	end	
	if GetBit(GetGlbValue(1022),nBit1) == 1 and GetBit(GetGlbValue(1022),nBit2) ==1 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: H«m nay Nguyªn So¸i ®· sö dông hÕt 2 lÇn triÖu gäi. Mêi Nguyªn So¸i quay l¹i sau.")
		return 0
	end
	for i=nBit1,nBit2 do
		if GetBit(GetGlbValue(1022),i) == 0 then
			SetGlbValue(1022,SetBit(GetGlbValue(1022),i,1))
			break
		end
	end
	SetTaskTemp(117,99)
	CreateTrigger(1, 1107, 2509);
    	ContinueTimer(GetTrigger(2509));
    	Msg2MSAll(MISSION_ID,szCamp.." Nguyªn So¸i ban lÖnh triÖu gäi ChiÕn ThÇn trî gióp. Sau 15 gi©y ChiÕn ThÇn sÏ xuÊt hiÖn ë doanh tr¹i phe "..szCamp.."!");	
    	local fTaskTip = function(tArg)
		TaskTip("ChiÕn ThÇn phe ®Şch sÏ xuÊt hiÖn sau 15 gi©y.");
	end;
	local nEnemyCamp = 3 - nCurCamp
	BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
	Say("<color=green>"..sNpcName.."<color>: ChiÕn ThÇn sÏ xuÊt hiÖn sau 15 gi©y!",0)
	WriteLogEx("Tong Lieu","Nguyªn So¸i triÖu gäi")		
end

function battle_charge()
	local nDate = tonumber(date("%y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if nNation == 66 and nDate <= 110709 then
		Talk(1,"","HiÖn t¹i chøc n¨ng nµy ®ang ®ãng, kh«ng thÓ kİch ho¹t!")
		return 0
	end
	
	local nBattleType = BT_GetBattleType();
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local nCurCamp = BT_GetCamp()
	local nBattleState = mf_GetMissionV(tBTMSInfo[nBattleType][1],MV_BATTLE_STATE,nBattleMapID);
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	if nBattleState ~= MS_STATE_READY then
		Talk(1,"","<color=green>"..sNpcName.."<color>: §¹i qu©n ®· xuÊt ph¸t, kh«ng thÓ ban lÖnh tæng tÊn c«ng!")
		return 0
	end
	if BT_GetCurRank() ~= 6 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: TiÓu tèt nh­ ng­¬i mµ còng ®ßi ban lÖnh cho ta µ? Ng­êi ®©u! B¾t h¾n!")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ph¶i cã danh hiÖu Nguyªn So¸i míi cã thÓ ph¸t lÖnh tÊn c«ng! Mêi Nguyªn So¸i kiÓm tra l¹i.")
		return 0
	end
	local tSay = 
	{
		"Mau truyÒn lÖnh cña bæn Nguyªn So¸i!/BT_Charge",
		"§Ó ta suy nghÜ l¹i/nothing",	
	}
	Say("<color=green>"..sNpcName.."<color>: T­íng sÜ tham gia tæng tÊn c«ng theo lÖnh cña <color=yellow>Nguyªn So¸i<color> sÏ ®­îc <color=red>nh©n ®«i ®iÓm kinh nghiÖm<color>. <color=yellow>Nguyªn So¸i<color> ®ång ı chø?",getn(tSay),tSay)
end

function BT_Charge()
	-- Sö dông biÕn global ®Ó l­u tr¹ng th¸i cã ph¸t ®éng tæng tÊn c«ng hay ch­a. 1 - 4 Tèng,  5 - 8 lµ Liªu. Th«n trang bit 1,5 Th¶o cèc bit 2,6 Ph¸o ®µi bit 3,7
	local nBattleVal =  GetGlbValue(1022)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nCurCamp = BT_GetCamp()
	local nCurRank = BT_GetCurRank()
	local nCheckCharge = BT_CheckCharge(nCurCamp)
	if nCheckCharge > 4 then
		nCheckCharge = nCheckCharge - 4 -- Trõ 4 ®Ó show tªn cña chiÕn tr­êng
	end
	if nCurCamp == SONG_ID then
		if GetTask(704) < 0 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Gian tÕ phe Liªu d¸m m¹o danh Nguyªn So¸i µ? Ng­êi ®©u! B¾t h¾n!")
			return 0
		end
		sNpcName = sSongGeneral;
		nChargeBit = SONG_BIT
	else
		if GetTask(704) >= 0 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Gian tÕ phe Tèng d¸m m¹o danh Nguyªn So¸i µ? Ng­êi ®©u! B¾t h¾n!")
			return 0
		end
		sNpcName = sLiaoGeneral;
		nChargeBit = LIAO_BIT
	end;
	if nCurRank ~= 6 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: TiÓu tèt nh­ ng­¬i mµ còng ®ßi ban lÖnh cho ta µ? Ng­êi ®©u! B¾t h¾n!")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ph¶i cã danh hiÖu Nguyªn So¸i míi cã thÓ ph¸t lÖnh tÊn c«ng! Mêi Nguyªn So¸i kiÓm tra l¹i.")
		return 0
	end
	if nCheckCharge > 0 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Nguyªn So¸i ®· ban lÖnh tæng tÊn c«ng <color=yellow>"..tBattleName[nCheckCharge].."<color>. Mçi ®ît chØ cã thÓ ban lÖnh 1 lÇn!")
		return 0
	end
	SetGlbValue(1022,SetBit(GetGlbValue(1022),nChargeBit,1)) -- nChargeBit quy ®Şnh riªng trong tõng file Chñ So¸i
	nCheckCharge = BT_CheckCharge(nCurCamp)
	if nCheckCharge > 4 then
		nCheckCharge = nCheckCharge - 4 -- Trõ 4 ®Ó show tªn cña chiÕn tr­êng
	end
	AddGlobalNews(format("<color=yellow>%s Nguyªn So¸i<color><color=green> %s<color> ban lÖnh tæng tÊn c«ng <color=red>%s<color>. T­íng sÜ tham gia chiÕn tr­êng cïng phe sÏ ®­îc nh©n ®«i kinh nghiÖm!",tCampNameZ[nCurCamp],GetName(),tBattleName[nCheckCharge]))
	Msg2Global(format("%s Nguyªn So¸i %s ban lÖnh tæng tÊn c«ng %s. T­íng sÜ tham gia chiÕn tr­êng cïng phe sÏ ®­îc nh©n ®«i kinh nghiÖm!",tCampNameZ[nCurCamp],GetName(),tBattleName[nCheckCharge]))
end

function BT_CheckCharge(nCamp)
	local n,m = 1,4
	if nCamp == LIAO_ID then
		n,m = 5,8
	end
	for i=n,m do
		if GetBit(GetGlbValue(1022),i) == 1 then
			return i
		end
	end
	return 0
end

--¿Õº¯Êı
function nothing()

end;

