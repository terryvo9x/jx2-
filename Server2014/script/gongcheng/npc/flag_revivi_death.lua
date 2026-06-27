--create date:07-04-13
--author:yanjun
--describe:¿ÉÖØÉúÆì×ÓËÀÍö½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_ENDING then	--½áÊø½×¶Î²»´¦Àí
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[2][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[2][2]);
	SetNpcLifeTime(nNpcIdx,0);
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	local nFlagIdx = GCZ_GetReviviFlagIndex(nNpcIdx)
	if nFlagIdx == 0 then
		WriteLog("[C«ng thµnh C«ng thµnh chiÕn bÞ lçi]: flag_revivi_death.lua trong script GCZ_GetReviviFlagIndex hµm sè tr¶ gi¸ trÞ vÒ bÞ lçi");
		return 0;
	end;
	SetMissionV(MV_REVIVI_FLAG1_OWNER+nFlagIdx-1,nPlayerCamp);
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	if nPlayerCamp == GONG_ID then
		SetMissionV(MV_FLAG_OWN_COUNT,nFlagCount+1);
		if GCZ_CheckWinCondition() == 1 then
			return 1;	--Èç¹û¹¥·½Ó®ÁË¾ÍÖ±½Ó·µ»Ø
		end;
		nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		GCZ_Msg2Camp("Phe ta ®· chiÕm lÜnh "..tReviviFlagPos[nFlagIdx][3]..", chó ý phßng ®Þch nh©n ph¶n kÝch! HiÖn t¹i tiÕn ®é c«ng thµnh phe ta lµ "..nFlagCount.."Thµnh",nPlayerCamp);
		GCZ_Msg2Camp("Phe ®Þch ®· chiÕm lÜnh "..tReviviFlagPos[nFlagIdx][3]..", nÕu kh«ng lËp tøc hµnh ®éng tæn thÊt sÏ ngµy mét lín. HiÖn t¹i tiÕn ®é c«ng thµnh phe ®Þch lµ "..nFlagCount.."Thµnh",nEnemyCamp)
	else
		SetMissionV(MV_FLAG_OWN_COUNT,nFlagCount-1);
		nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		GCZ_Msg2Camp("Phe ta ®· chiÕm lÜnh "..tReviviFlagPos[nFlagIdx][3]..", chó ý phßng ®Þch nh©n ph¶n kÝch! HiÖn t¹i tiÕn ®é c«ng thµnh phe ®Þch lµ "..nFlagCount.."Thµnh",nPlayerCamp);
		GCZ_Msg2Camp("Phe ®Þch ®· chiÕm lÜnh "..tReviviFlagPos[nFlagIdx][3]..", nÕu kh«ng lËp tøc hµnh ®éng tæn thÊt sÏ ngµy mét lín. HiÖn t¹i tiÕn ®é c«ng thµnh phe ta lµ "..nFlagCount.."Thµnh",nEnemyCamp)
	end;
	local nMusicState = GCZ_SetMusicState();
	GCZ_PlayBackGroundMusic(nMusicState);
	local nFlagNpcIdx = CreateNpc(tReviviFlagPos[nFlagIdx][3+nPlayerCamp],tReviviFlagPos[nFlagIdx][3].."("..tCampNameZ[nPlayerCamp]..")",nMapID,tReviviFlagPos[nFlagIdx][1],tReviviFlagPos[nFlagIdx][2]);
	SetNpcDeathScript(nFlagNpcIdx,"\\script\\gongcheng\\npc\\flag_revivi_death.lua");
	gf_SetUnitCurState(nFlagNpcIdx,0,nFlagIdx);	--ÓÃNPCµÄµÈ¼¶Êý¾ÝÀ´¼ÇNPCµÄÎ»ÖÃË÷Òý
	SetCampToNpc(nFlagNpcIdx,tCampNameP[nPlayerCamp]);
end;