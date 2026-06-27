--create date:2007-07-16 9:18
--author:yanjun
--describe:°ï»á¹Ø¿¨stageÎÄ¼þ£¬Ö÷ÒªÊÇ¹Ø¿¨µÄÏµ¹Ø²Ù×÷

--MV_VALUE9±íÊ¾ÒªÈ¥µôµÄµÚÒ»ÖÖÖ°Òµ
--MV_VALUE10±íÊ¾ÒªÈ¥µôµÄµÚ¶þÖÖÖ°Òµ
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
Include("\\script\\missions\\tong_mission\\position.lua");
CSTAGE5 = OO_Inherit(CBASE_STAGE);	--¼Ì³Ð»ùÀµ
--=========Ï¢ÃæÊÇ×ÓÀµÄÚÈÝµÄ¶¨ÒåºÍÖØÔØ=========================================================
CSTAGE5.nStage = 5;	
CSTAGE5.tbTimerEven = {};
CSTAGE5.nDistance = 20;
CSTAGE5.tbBossInfo = {"boss5","TiÖt Hoµnh Thó"};
CSTAGE5.tbTrap = gf_MergeTable(tPos_Boss,tPos_Rect);	--»ú¹ØµÄµã£ºÁ½¸öBOSSµãºÍËÄ¸öNPCµã
CSTAGE5.nCurIdx = 1;

--´´½¨BOSS
function CSTAGE5:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
	Msg2MSAll(MISSION_ID,"NhiÖm vô cña ¶i: §¸nh b¹i "..szName);
	self:CreateRandomTrap(1);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("§ãng cöa th¶ chã",960,0,1,tbPlayer);
end;
--Ëæ»úÇøÓòË¢×Ô±¬NPC
function CSTAGE5:CreateOpposedNpc(tbArg)
	local nNpcIdx = 0;
	local nCount = tbArg[1];
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nNpcIdx = CreateNpc("TiÓu qu¸i ¶i 5","¸c KhuyÓn",nMapID,1569,3175,-1,1,1,200);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("§ãng cöa th¶ chã",930,0,1);
end;
--BOSSµÄËÀÍö½Å±¾Ö´ÐÐº¯Êý
function CSTAGE5:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;
--Ð¡¹ÖËÀÍö½Å±¾Ö´ÐÐº¯Êý
function CSTAGE5:OnNpcDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local szNpcName = GetNpcName(nNpcIdx);
	if szNpcName == "C¬ quan" then
		local nMapID,nMapX1,nMapY1 = GetNpcWorldPos(nNpcIdx);
		local nBossIdx = GetMissionV(MV_BOSS1);
		local nMapID,nMapX2,nMapY2 = GetNpcWorldPos(nBossIdx);
		local nDis = gf_GetDistance(nMapX1,nMapY1,nMapX2,nMapY2);
		if nDis <= self.nDistance then
			TM_ModifyNpcLife(nBossIdx,-5);
			Msg2MSAll(MISSION_ID,GetNpcName(nBossIdx).."Sinh Lùc gi¶m 5%");
		end;
		self:CreateRandomTrap(1);
	end;
	SetNpcLifeTime(nNpcIdx,0);
end;
--Ëæ»úµã´´½¨»ú¹Ø
function CSTAGE5:CreateRandomTrap(nCount)
	local nRandom = 0;
	local tNpcModel = {"C¬ quan 1 ¶i 5", "C¬ quan 2 ¶i 5"}
	local nNpcIdx = 0;
	local nRandPosIdx = 0;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nRandPosIdx = gf_GetNextRandomIndex(self.nCurIdx,getn(self.tbTrap));
		self.nCurIdx = nRandPosIdx;
		nRandom = random(1,2)
		nNpcIdx = CreateNpc(tNpcModel[nRandom],"C¬ quan",nMapID,self.tbTrap[nRandPosIdx][1],self.tbTrap[nRandPosIdx][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
end;
--³õÊ¼»¯tbTimerEven
CSTAGE5.tbTimerEven = 
{	--tbTimerEvenµÄ¸÷¸öÔªËØµÄÄÚÈÝ¾ÍÊÇProcessTimeCheckPointº¯ÊýµÄËÄ¸ö²ÎÊý
	--	´¥·¢Ê±¼ä ´¥·¢¼ä¸ô ´¥·¢µÄº¯Êý 			´¥·¢º¯ÊýµÄ²ÎÊýtable
	[1] = {60,		30,		CSTAGE5.CreateOpposedNpc,	{5}},
	[2] = {30*60,	0,		CSTAGE5.AllDeath,			{}},
}
