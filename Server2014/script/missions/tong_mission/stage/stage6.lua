--create date:2007-07-16 15:55
--author:yanjun
--describe:°ï»á¹Ø¿¨stageÎÄ¼þ£¬Ö÷ÒªÊÇ¹Ø¿¨µÄÏµ¹Ø²Ù×÷

--MV_VALUE9±íÊ¾ÒªÈ¥µôµÄµÚÒ»ÖÖÖ°Òµ
--MV_VALUE10±íÊ¾ÒªÈ¥µôµÄµÚ¶þÖÖÖ°Òµ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE6 = OO_Inherit(CBASE_STAGE);	--¼Ì³Ð»ùÀµ
--=========Ï¢ÃæÊÇ×ÓÀµÄÚÈÝµÄ¶¨ÒåºÍÖØÔØ=========================================================
CSTAGE6.nStage = 6;	
CSTAGE6.tbTimerEven = {};
CSTAGE6.nMaxNpcCount = 100;
CSTAGE6.tbBossInfo = 
{
	[1] = {"boss61","Háa Vò"},
	[2] = {"boss62","L­u Quang"},
}
--´´½¨BOSS
function CSTAGE6:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = 0;
	for i=1,getn(self.tbBossInfo) do
		nNpcIdx = CreateNpc(self.tbBossInfo[i][1],self.tbBossInfo[i][2],nMapID,tPos_Boss[i][1],tPos_Boss[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
		SetMissionV(MV_BOSS1+i-1,nNpcIdx);
		SetMissionV(MV_BOSS_COUNT,GetMissionV(MV_BOSS_COUNT)+1);
		--NpcChat(nNpcIdx,self.tbBossInfo[i][2].."»ªÀöµÇ³¡");
	end;
	Msg2MSAll(MISSION_ID,"NhiÖm vô ¶i: §¸nh b¹i hai ®¹i thÇn thó Háa Vò vµ L­u Quang");
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("Di Hoa TiÕp Méc",20*60,0,1,tbPlayer);
	TM_StartTimeGuage("Bãng hé vÖ",990,0,2,tbPlayer);
end;
--Ë¢Ð¡¹Ö
function CSTAGE6:CreateOpposedNpc(tbArg)
	local nNpcCount = 0;
	local nCurStage = self.nStage;
	local tbNpc = {1,2,3,4,5,6,7};
	local nNpcIdx = 0;
	local nRand = 0;
	local nRandNpcIdx = 0;
	local szModel,szName = "","";
	local nMapX,nMapY = 0,0;
	for i=1,getn(tbNpc) do
		if GetMissionV(MV_VALUE9) == tbNpc[i] then
			tremove(tbNpc,i);
		end;
	end;
	for i=1,getn(tbNpc) do
		if GetMissionV(MV_VALUE10) == tbNpc[i] then
			tremove(tbNpc,i);
		end;
	end;
	for i=1,4 do	--ËÄ¸öµãË¢
		nRand = random(1,getn(tbNpc));
		nRandNpcIdx = tbNpc[nRand];
		nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--´³¹ØÊ§°Ü
		return 0;
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(2);
	TM_StartTimeGuage("Bãng hé vÖ",990,0,2,tbPlayer);
end;
--ÐÞ¸ÄBOSSÑªÁ¿
function CSTAGE6:ModifyBossLife(tbArg)
	local nBossIdx1 = GetMissionV(MV_BOSS1);
	local nBossIdx2 = GetMissionV(MV_BOSS2);
	if tbArg[1] == 1 then
		if nBossIdx1 ~= 0 then
			if GetNpcName(nBossIdx1) == self.tbBossInfo[1][2] then
				TM_ModifyNpcLife(nBossIdx1,1);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."Sinh lùc håi phôc 1%");
			else
				WriteLog("[Tö Quang C¸c gÆp lçi]: BOSS1 ¶i 6 gÆp lçi, tªn lµ"..GetNpcName(nBossIdx1));
			end;
		end;
		if nBossIdx2 ~= 0 then
			if GetNpcName(nBossIdx2) == self.tbBossInfo[2][2] then
				TM_ModifyNpcLife(nBossIdx2,-1);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."Sinh lùc gi¶m 1%");	
			else
				WriteLog("[Tö Quang C¸c gÆp lçi]: BOSS2 cña ¶i 6 gÆp lçi, tªn thµnh"..GetNpcName(nBossIdx1));
			end;
		end;
	else
		if nBossIdx1 ~= 0 then
			if GetNpcName(nBossIdx1) == self.tbBossInfo[1][2] then
				TM_ModifyNpcLife(nBossIdx1,-6);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."Sinh lùc gi¶m 6%");
			else
				WriteLog("[Tö Quang C¸c gÆp lçi]: BOSS1 ¶i 6 gÆp lçi, tªn lµ"..GetNpcName(nBossIdx1));
			end;
		end;
		if nBossIdx2 ~= 0 then
			if GetNpcName(nBossIdx2) == self.tbBossInfo[2][2] then
				TM_ModifyNpcLife(nBossIdx2,6);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."Sinh lùc håi phôc 6%");	
			else
				WriteLog("[Tö Quang C¸c gÆp lçi]: BOSS2 cña ¶i 6 gÆp lçi, tªn thµnh"..GetNpcName(nBossIdx1));
			end;
		end;
		local tbPlayer = TM_GetPlayerTable();
		TM_StopTimeGuage(1);
		TM_StartTimeGuage("Di Hoa TiÕp Méc",2*60,0,1,tbPlayer);
	end;
end;
--¼ì²éBOSSÑªÁ¿
function CSTAGE6:CheckBoss(tbArg)
	local nLifePercent1,nLifePercent2 = 0,0;
	local nBossIdx1,nBossIdx2 = GetMissionV(MV_BOSS1),GetMissionV(MV_BOSS2);
	gf_ShowDebugInfor("nBossIdx1:"..nBossIdx1);
	gf_ShowDebugInfor("nBossIdx2:"..nBossIdx2);
	_,nLifePercent1 = TM_GetNpcLife(nBossIdx1);
	_,nLifePercent2 = TM_GetNpcLife(nBossIdx2);
	local nPercent = abs(nLifePercent1-nLifePercent2);	--°Ù·Ö±ÈÖ®²î
	local tbPlayer = TM_GetPlayerTable();
	local tbPercent = {1,1,2,2,3,5,10,30,30,30};
	local funLostLifePercent = function(tArg)
		local nMaxLife = GetMaxLife();
		local nLostLife = floor(nMaxLife*tArg[1]/100);
		CastState("state_lost_life_per18",nLostLife,tArg[2]*18);
	end;
	Msg2MSAll(MISSION_ID,"Chªnh lÖch l­îng m¸u cña Boss: (phÇn tr¨m)"..nPercent);
	if nPercent == 0 then
		return 0;
	end;
	if nPercent > 10 then
		nPercent = 10;
	end;
	gf_OperatePlayers(tbPlayer,funLostLifePercent,{tbPercent[nPercent],5});
end;
--BOSSµÄËÀÍö½Å±¾Ö´ÐÐº¯Êý
function CSTAGE6:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local nBossCount = GetMissionV(MV_BOSS_COUNT);
	if nNpcIdx == GetMissionV(MV_BOSS1) then
		SetMissionV(MV_BOSS1,0);
		Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."®· bÞ ®¸nh b¹i");
	else
		SetMissionV(MV_BOSS2,0);
		Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."®· bÞ ®¸nh b¹i");
	end;
	SetNpcLifeTime(nNpcIdx,0);
	SetMissionV(MV_BOSS_COUNT,nBossCount-1);
	if nBossCount == 1 then	--Èç¹ûÊÇ×îºóÒ»¸öBOSS
		self:EndStage();
		self:CheckAllStagePass();
	end;
end;
--³õÊ¼»¯tbTimerEven
CSTAGE6.tbTimerEven = 
{	--tbTimerEvenµÄ¸÷¸öÔªËØµÄÄÚÈÝ¾ÍÊÇProcessTimeCheckPointº¯ÊýµÄËÄ¸ö²ÎÊý
	--	´¥·¢Ê±¼ä ´¥·¢¼ä¸ô ´¥·¢µÄº¯Êý 				´¥·¢º¯ÊýµÄ²ÎÊýtable
	[1] = {115,		20,		CSTAGE6.ModifyBossLife,		{1}},
	[2] = {120,		120,	CSTAGE6.ModifyBossLife,		{2}},
	[3] = {0,		10,		CSTAGE6.CheckBoss,			{}},	--¼ì²éÁ½BOSSÑªÁ¿
	[4] = {90,		90,		CSTAGE6.CreateOpposedNpc,	{}},
	[5] = {30*60,	0,		CSTAGE6.AllDeath,			{}},
}
