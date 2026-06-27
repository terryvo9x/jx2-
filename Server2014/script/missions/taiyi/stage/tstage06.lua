Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--µÚ6¹Ø£º¿ºÁúÓÐ»Ú
-----------------------------------------------------------------
tStage06 = {
	name = "Kh¸ng Long H÷u Hèi",
	nStageId = 6,
	maxsecond = 120 * 60,
	actionsType = "second",
};
tStage06 = inherit(cycPhase, tStage06);

function tStage06:onTimeout()
	local self = tStage06;
	this:Msg2MSAll(format("%d phót sau ch­a hoµn thµnh [%s], ¶i sÏ ®ãng l¹i!", tStage06.maxsecond / 60, tStage06.name));
	TY_CloseMission();
end

-----------------------------------------------------------------
tStage06_1 = {
	name = "Hµng Long H÷u Hèi-Khu chuÈn bÞ",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Hµng Long H÷u Hèi-Khu chuÈn bÞ",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_1:CreateNpcs()
	local self = tStage06_1;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_2, tNpcPos.mgy[7][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_2, tNpcPos.yzb[7][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage06_1:BeginFight()
	local self = tStage06_1;
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 16, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 28, 0, 1);
	end
end

function tStage06_1:CheatMode()
	local self = tStage06_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>Méc QuÕ Anh<color>: Trªn ng­êi b¹n"..TYT_IB_ITEM[1].."Kh«ng ®ñ.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 35, 0, 1);
	self:BeginFight();
end

function tStage06_1:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if not TY_IsCaptain() or GetNpcName(nNpcIdx) ~= tNpcs.mgy_2[2] then return 0; end
	
	if not tStage06_1.sel_NORMAL then
		tStage06_1.sel_NORMAL = {
			"Më ¶i 3: Hµng Long H÷u Hèi/#tStage06_1.BeginFight()",
			"H×nh thøc sao chÐp (CÇn "..TYT_IB_ITEM[1].."*1)/#tStage06_1.CheatMode()",
			"Ta muèn rêi khái ¶i/TY_ConfirmClose",
			"Hñy bá/nothing",
		};
	end
	
	if not tStage06_1.sel_HARD then
		tStage06_1.sel_HARD = {
			"Më ¶i 3: Hµng Long H÷u Hèi/#tStage06_1.BeginFight()",
			"Ta muèn rêi khái ¶i/TY_ConfirmClose",
			"Hñy bá/nothing",
		};
	end
	
	local strTab = tStage06_1.sel_HARD;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		strTab = tStage06_1.sel_NORMAL;
	end
	Say("<color=green>Méc QuÕ Anh<color>: §¹i hiÖp ®· s½n sµng ch­a?", getn(strTab), strTab);
end

function tStage06_1:onTimeout()
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage06_1:Init()
	local self = tStage06_1;
	
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_22, 0);
	SetMissionV(this.mv_03, 0);
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("§éi tr­ëng vµ Méc QuÕ Anh ®èi tho¹i ®Ó tiÕp tôc ¶i!") end);
end

function tStage06_1:OnPlayerDeath()
	local self = tStage06_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage06_1 = inherit(cycPhase, tStage06_1);

tStage06_1.actions = {
	[1] = {
		[0] = {tStage06_1.Init, },
	},
};

tStage06_1.triggers = {
	Talk = {
		{action = tStage06_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage06_1.OnPlayerDeath},
	},
};

--¿ºÁúÓÐ»Ú-¿ªÆô
-------------------------------------------------------------------
tStage06_2 = {
	name = "Kh¸ng Long H÷u Hèi",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Kh¸ng Long H÷u Hèi",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_2:OnTrap(nTrapId)
	local self = tStage06_2;
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	if 1 == nTrapId then
		local nMapId, x, y = GetWorldPos();
		local nLastTime = GetTask(TASKID_TAIYITA_TIME);
		local nNowTime = GetTime();
		if nNowTime - nLastTime > 5 then
			local tDsyh = tNpcs.dsyh;
			if eDifType.NORMAL == GetMissionV(this.mv_02) then
				tDsyh = tNpcs.dsyh_1;
			end
			for i = 1, 3 do
				nNpcIdx = CreateNpc(tDsyh[1], tDsyh[2], nMapId, x, y, -1, 1, 1, 10);
				SetNpcScript(nNpcIdx, thisFile);
			end
			SetTask(TASKID_TAIYITA_TIME, nNowTime);
		end
	end
end

function tStage06_2:CreateNpcs()
	local self = tStage06_2;
	local nYlfhIdx = 0;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nYlfhIdx = TY_CreateNpc(tNpcs.ylfh_1, tNpcPos.ylfh[7][1]);
	else
		nYlfhIdx = TY_CreateNpc(tNpcs.ylfh, tNpcPos.ylfh[7][1]);
	end
	CastState2Npc(nYlfhIdx, "state_attack_trans", 50, 5*60*18);
	TY_SetNpcType2Talk(nYlfhIdx);
end

function tStage06_2:Init()
	local self = tStage06_2;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_easy_open_3, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_hard_open_3, 1);
	end
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 1);	--0:Î´¿ªÆô¹Ø¿¨ 1:¿ªÆôÇ°Ï·¶Ô»° 2:¿ªÊ¼Õ½¶· 3:½áÊø¶Ô»°
	SetMissionV(this.mv_23, 0);
	SetMissionV(this.mv_24, 5);	--¼¼ÄÜ1µ¹¼ÆÊ±
	SetMissionV(this.mv_25, 0);	--¼¼ÄÜ2µ¹¼ÆÊ±
	SetMissionV(this.mv_26, 0);
	SetMissionV(this.mv_30, 0);	--ÊÇ·ñ½øÈëµÚ¶þ½×¶Î
	SetMissionV(this.mv_31, 1);	--»ðÑæË¢ÐÂµ¹¼ÆÊ±
	SetMissionV(this.mv_32, 1);	--»ðÑæË¢ÐÂË³Ðòidx
	SetMissionV(this.mv_33, 0);	--ÊÇ·ñ½øÈëµÚÈý½×¶Î
	self:CreateNpcs();
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	if not self.tFirePoints then
		self.tFirePoints = {{1648,3477},{1657,3485},{1670,3495},{1679,3502},{1672,3516},{1660,3526},{1640,3537},{1633,3529},{1622,3519},{1610,3511},{1622,3492},{1636,3477},{1640,3492},{1632,3504},{1634,3516},{1650,3523},{1622,3500},{1623,3507},{1630,3485},{1645,3514},{1628,3498},{1673,3474},{1674,3497},};
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
	if 0 ~= nMgyIdx and 0 ~= nYzbIdx then
		SetNpcDir(nMgyIdx, 36);
		SetNpcDir(nYzbIdx, 34);
	end
	TY_AddAttackState();
	TY_ClearDamagePoint();
end

function tStage06_2:OnNpcDeath(event, data)
	local self = tStage06_2;
	local szName = GetNpcName(data[1]);
	RemoveNpc(data[1]);
	if szName == tNpcs.ylfh[2] then
		self:StagePassed();
	end
end

function tStage06_2:OnBossStage1()	--BOSS ½×¶ÎÒ»[0.65]
	local self = tStage06_2;
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	if 0 == GetMissionV(this.mv_24) then	--20ÃëÊÍ·ÅÒ»´Î
		SetMissionV(this.mv_24, 10);
		local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
		NpcChat(nMgyIdx, "H·y chó ý tr¸nh nÐ Hoµnh T¶o Thiªn Qu©n cña Gia LuËt Phi Hång!");
		this:Msg2MSAll("H·y chó ý tr¸nh nÐ Hoµnh T¶o Thiªn Qu©n cña Gia LuËt Phi Hång!");
		
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nPlayerIndex = TY_FindRandomPlayer({x, y});
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 4*18);
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		nMapId, x, y = GetWorldPos();
		if eDifType.NORMAL == GetMissionV(this.mv_02) then		--ºáÉ¨Ç§¾ü
			DoSkill2Target(nYlfhIdx, 1680, 2, PIdx2NpcIdx(nPlayerIndex));
		else
			DoSkill2Target(nYlfhIdx, 1680, 1, PIdx2NpcIdx(nPlayerIndex));
		end
		PlayerIndex = nOldPlayerIndex;
		NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536+1756);	--»ØÁýÇ¹
		
		this.msCamp:turnPlayer(0, function() HeadMsg2Player("Gia LuËt Phi Hång ®ang thi triÓn Hoµnh T¶o Thiªn Qu©n") end);
	end
	
	if GetMissionV(this.mv_24) >= 0 then
		SetMissionV(this.mv_24, GetMissionV(this.mv_24) - 1);
	end
	if GetMissionV(this.mv_25) >= 0 then
		SetMissionV(this.mv_25, GetMissionV(this.mv_25) - 1);
	end
end

function tStage06_2:OnBossStage2()	--BOSS ½×¶ÎÒ»[0.35]
	local self = tStage06_2;
	
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	if 0 == GetMissionV(this.mv_30) then
		SetMissionV(this.mv_30, 1);
		SetMissionV(this.mv_32, 1);
		SetNpcPos(nYlfhIdx, 1648, 3502);
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 10 * 60 * 18, 0, 10013);
		local nMapId = this.msPosition:getMapID();
		local nNpcIdx = CreateNpc("TYT_HYLFHshadow", "Gia LuËt Phi Hång (¶nh)", nMapId, 1659, 3508);
		SetNpcScript(nNpcIdx, thisFile);
		CastState2Npc(nNpcIdx, "state_fetter", 1, 10 * 60 * 18, 0, 10013);
		
		local nMaxLife1, _  = GetUnitBaseStates(nYlfhIdx, 1);
		local _, nCurLife1	= GetUnitCurStates(nYlfhIdx, 1);
		local nMaxLife2, _  = GetUnitBaseStates(nNpcIdx, 1);
		local fPercent = nCurLife1 / nMaxLife1;
		ModifyNpcData(nNpcIdx, 0, floor(nMaxLife2*fPercent), 0);
		
		local nMapId = this.msPosition:getMapID();
		if not self.tRandList then self.tRandList = {}; end
		if not self.tRandList[nMapId] then
			self.tRandList[nMapId] = floyd_rm4n(getn(self.tFirePoints), getn(self.tFirePoints));
		end
	end
	local nYlfhsyIdx = TY_FindNpc("Gia LuËt Phi Hång (¶nh)");
	if 0 ~= nYlfhsyIdx then
		local nMaxLife1, _  = GetUnitBaseStates(nYlfhIdx, 1);
		local _, nCurLife1	= GetUnitCurStates(nYlfhIdx, 1);
		local nMaxLife2, _  = GetUnitBaseStates(nYlfhsyIdx, 1);
		local _, nCurLife2	= GetUnitCurStates(nYlfhsyIdx, 1);
		
		local fAvg = (nCurLife1 / nMaxLife1 + nCurLife2 / nMaxLife2) / 2.0;
		
		ModifyNpcData(nYlfhIdx, 0, floor(nMaxLife1*fAvg), 0);
		ModifyNpcData(nYlfhsyIdx, 0, floor(nMaxLife2*fAvg), 0);
	end
	
	if 0 == GetMissionV(this.mv_26) then	--Á÷¹â¾øÓ°10sÒ»´Î
		SetMissionV(this.mv_26, 3);
		--Á¬Ïß¼¼ÄÜÐÞ¸ÄÎªËæ»úÊ©·Å¼¼ÄÜ7£¨20%£©ºÍ¼¼ÄÜ8
		if not self.tSkillList_NORMAL then
			self.tSkillList_NORMAL = {
				{0.2, 1777, 2}, {0.2, 1771, 2}, {0.3, 1772, 2}, {0.3, 1773, 2},
			};
		end
		if not self.tSkillList_HARD then
			self.tSkillList_HARD = {
				{0.2, 1777, 1}, {0.2, 1771, 1}, {0.3, 1772, 1},{0.3, 1773, 2},
			};
		end
		
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nRand = random(1, 100000);
		local tSkillList = self.tSkillList_HARD;
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			tSkillList = self.tSkillList_NORMAL;
		end
		
		for i = 1, getn(tSkillList) do
			nRand = nRand - tSkillList[i][1] * 100000;
			if nRand <= 0 then
				NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*tSkillList[i][3]+tSkillList[i][2]);
				break;
			end
		end
	end
	if 0 == GetMissionV(this.mv_31) then	--»ìÂÒ»ð¶Ñ15sÒ»¸ö
		SetMissionV(this.mv_31, 6);
		
		local nIdx = GetMissionV(this.mv_32);
		local nMapId = this.msPosition:getMapID();
		if self.tRandList and self.tRandList[nMapId] and nIdx <= getn(self.tRandList[nMapId]) then
			nIdx = self.tRandList[nMapId][nIdx];
			local x, y = self.tFirePoints[nIdx][1], self.tFirePoints[nIdx][2];
			SetMissionV(this.mv_32, nIdx + 1);
			local nNpcIdx = CreateNpc("TYT_YLfire", "LiÖt Háa", nMapId, x, y);
			if 0 ~= nNpcIdx then
				CastState2Npc(nNpcIdx, "state_dispear", 100, 60*60*18);
				SetCurrentNpcSFX(nNpcIdx, 991, 1, 1);
			end
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
			NpcChat(nMgyIdx, "H·y mau tr¸nh nh÷ng ngän löa ë d­íi ®Êt!");
			this:Msg2MSAll("H·y mau tr¸nh nh÷ng ngän löa ë d­íi ®Êt!");
		end
	end
	if GetMissionV(this.mv_31) >= 0 then
		SetMissionV(this.mv_31, GetMissionV(this.mv_31) - 1);
	end
	if GetMissionV(this.mv_26) >= 0 then
		SetMissionV(this.mv_26, GetMissionV(this.mv_26) - 1);
	end
end

function tStage06_2:OnBossStage3()	--BOSS ½×¶ÎÒ»[0]
	local self = tStage06_2;
	if 0 == GetMissionV(this.mv_33) then
		local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
		SetMissionV(this.mv_33, 1);
		SetMissionV(this.mv_32, 1);
		SetMissionV(this.mv_24, 10);
		SetMissionV(this.mv_25, 13);
		RemoveStateFromNpc(nYlfhIdx, 10013);
		local nYlfhsyIdx = TY_FindNpc("Gia LuËt Phi Hång (¶nh)");
		if 0 ~= nYlfhsyIdx then RemoveNpc(nYlfhsyIdx); end
		TY_ClearNpc("LiÖt Háa");
		
		if not self.tFirePoints_1 then
			self.tFirePoints_1 = {{1648,3477},{1657,3485},{1670,3495},{1679,3502},{1672,3516},{1660,3526},{1640,3537},{1633,3529},{1622,3519},{1610,3511},{1622,3492},{1636,3477},{1640,3492},{1632,3504},{1634,3516},{1650,3523},{1622,3500},{1623,3507},{1630,3485},{1645,3514},{1628,3498},{1673,3474},{1674,3497},};
		end
		local nMapId = this.msPosition:getMapID();
		if not self.tRandList then self.tRandList = {}; end
		if not self.tRandList[nMapId] then
			self.tRandList[nMapId] = floyd_rm4n(getn(self.tFirePoints_1), getn(self.tFirePoints_1));
		end
	end
	if 0 == GetMissionV(this.mv_24) then			--20ÃëÊÍ·ÅºáÉ¨Ç§¾ü£¬»ØÁýÇ¹
		SetMissionV(this.mv_24, 10);
		local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nPlayerIndex = TY_FindRandomPlayer({x, y});
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 4*18);
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		nMapId, x, y = GetWorldPos();
		if eDifType.NORMAL == GetMissionV(this.mv_02) then		--ºáÉ¨Ç§¾ü
			DoSkill2Target(nYlfhIdx, 1680, 2, PIdx2NpcIdx(nPlayerIndex));
		else
			DoSkill2Target(nYlfhIdx, 1680, 1, PIdx2NpcIdx(nPlayerIndex));
		end
		NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536+1756);	--»ØÁýÇ¹
		PlayerIndex = nOldPlayerIndex;
	end
	
	if 0 == GetMissionV(this.mv_25) then
		SetMissionV(this.mv_25, 6);
		local nIdx = GetMissionV(this.mv_32);
		local nMapId = this.msPosition:getMapID();
		if self.tRandList and self.tRandList[nMapId] and nIdx <= getn(self.tRandList[nMapId]) then
			SetMissionV(this.mv_32, nIdx + 1);
			nIdx = self.tRandList[nMapId][nIdx];
			local x, y = self.tFirePoints_1[nIdx][1], self.tFirePoints_1[nIdx][2];
			local nNpcIdx = CreateNpc("TYT_YLfire", "LiÖt Háa", nMapId, x, y);
			if 0 ~= nNpcIdx then
				CastState2Npc(nNpcIdx, "state_dispear", 100, 60*60*18);
				SetCurrentNpcSFX(nNpcIdx, 991, 1, 1);
			end
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
			NpcChat(nMgyIdx, "H·y mau tr¸nh nh÷ng ngän löa ë d­íi ®Êt!");
			this:Msg2MSAll("H·y mau tr¸nh nh÷ng ngän löa ë d­íi ®Êt!");
		end
	end
	
	if GetMissionV(this.mv_24) >= 0 then
		SetMissionV(this.mv_24, GetMissionV(this.mv_24) - 1);
	end
	
	if GetMissionV(this.mv_25) >= 0 then
		SetMissionV(this.mv_25, GetMissionV(this.mv_25) - 1);
	end
end

function tStage06_2:DoSkill()
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	local self = tStage06_2;
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	local nMaxLife, nCurLife = GetUnitCurStates(nYlfhIdx, 1);
	local fPercent = nCurLife / nMaxLife;
	if not self.tEventList then
		self.tEventList = {
			{0.65, self.OnBossStage1}, {0.35, self.OnBossStage2}, {0, self.OnBossStage3},
		};
	end
	
	for i = 1, getn(self.tEventList) do
		if fPercent > self.tEventList[i][1] then
			self.tEventList[i][2]();
			break;
		end
	end
end

function tStage06_2:StagePassed()
	local self = tStage06_2;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 17, 0, 1);
		gf_TeamOperateEX(function ()
			AddRuntimeStat(18, 41, GetPlayerRoute(), 1);		
		end);
		--ÆÕÍ¨Ì«Ò»ËþÈ«Í¨ vipcard
		this.msCamp:turnPlayer(0, _vc_TYT_AllPass, 0);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 29, 0, 1);
		gf_TeamOperateEX(function ()
			AddRuntimeStat(18, 43, GetPlayerRoute(), 1);		
		end);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_46, 0); -- Ç§Ñ°Ëþ²ú³ö
	TY_StagePassed(self);
	self:onFinish();
end

function tStage06_2:NpcTalk()
	if not (1 == GetMissionV(this.mv_22) or 3 == GetMissionV(this.mv_22)) then
		return 0;
	end
	local self = tStage06_2;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
	local nYlfhIdx	= TY_FindNpc(tNpcs.ylfh[2]);
	local tContent = {
		[1] = {
			{nYzbIdx, "Ng­¬i chÝnh lµ Gia LuËt Phi Hång sao?"},
			{nYlfhIdx, "H¹ng tiÓu nh©n ë ®©u ®Õn mµ d¸m hái hä tªn cña bæn v­¬ng!"},
			{nYzbIdx, "Hø! Ta lµ D­¬ng T«n B¶o, ch¸u cña Kim §ao §¹i Tèng-D­¬ng LÖnh C«ng, con cña D­¬ng Diªn Chiªu! H«m nay ®Õn ®©u ®Ó lÊy ®Çu cña ng­¬i ®Ó tÕ tæ tiªn cña nhµ hä D­¬ng ta!"},
			{nYlfhIdx, "Ng­¬i d¸m nãi x»ng nãi bËy tr­íc mÆt ta µ!"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		else
			if nParagraph == 1 then	--µÚÒ»¶Î·Ï»°ËµÍê
				SetMissionV(this.mv_22, 2);	--¿ª´ò
				local nYlfhIdx	= TY_FindNpc(tNpcs.ylfh[2]);
				local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
				local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
				TY_SetNpcType2Fight(nYzbIdx);
				TY_SetNpcType2Fight(nMgyIdx);
				TY_SetNpcType2Fight(nYlfhIdx);
				NpcChat(nMgyIdx, "Chó ý: PhÝa tr­íc vµ phÝa sau cña Gia LuËt Phi Hång lµ khu vùc v« cïng nguy hiÓm, ngoµi ra ®õng nªn ch¹y ®Õn khu vùc hµi cèt ë vïng ven.");
				this:Msg2MSAll("Chó ý: PhÝa tr­íc vµ phÝa sau cña Gia LuËt Phi Hång lµ khu vùc v« cïng nguy hiÓm, ngoµi ra ®õng nªn ch¹y ®Õn khu vùc hµi cèt ë vïng ven.");
--				if eDifType.NORMAL == GetMissionV(this.mv_02) then
--					TY_SupplyNpc(self.nStageId);
--				end
			end
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage06_2:onTimeout()
	local self = tStage06_2;
	TY_RecordDamagePoint()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	TY_GoToStage(self, self.father, 1);
end

function tStage06_2:OnPlayerDeath(event, data)
	local self = tStage06_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage06_2 = inherit(cycPhase, tStage06_2);

tStage06_2.actions = {
	[1] = tStage06_2.Init,
};

tStage06_2.cycActions = {
	[1] = {
		[0] = {tStage06_2.DoSkill},
	},
	[2] = {
		[0] = {tStage06_2.NpcTalk, },
	},
};

tStage06_2.triggers = {
	NpcDeath = {
		{action = tStage06_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage06_2.OnPlayerDeath},
	},
};

--½áÊø
-----------------------------------------------------------------
tStage06_3 = {
	name = "KÕt thóc",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Khu kÕt thóc",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[7][2]);
	SetNpcDir(nMgyIdx, 55);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[7][2]);
	SetNpcDir(nYzbIdx, 8);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	local nYlfhIdx = TY_CreateNpc(tNpcs.ylfh, tNpcPos.ylfh[7][2]);
	TY_SetNpcType2Talk(nYlfhIdx);
	SetNpcDir(nYlfhIdx, 35);
end

function tStage06_3:Init()
	local self = tStage06_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage06_3:NpcTalk()
	local self = tStage06_3;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	
	local tContent = {
		[1] = {
			{nYlfhIdx, "B¹ch lang hµm tè ph¸ch, û kiÕm môc th­¬ng khung."},
			{nYlfhIdx, "H¬n 30 n¨m sau trËn chiÕn ë Nh¹n M«n, D­¬ng huynh trÞ qu©n nghiªm minh, v¨n thao vâ l­îc, thËt khiÕn Phi Hång kh©m phôc, rÊt muèn ®­îc kÕt lµm tri kû, nh­ng Phi Hång mang träng tr¸ch cña n­íc nhµ nªn ®µnh ph¶i ra tay th«i."},
			{nYlfhIdx, "D­¬ng huynh, ng­êi lµ trô cét cña nam triÒu nh­ng l¹i bÞ gian thÇn h·m h¹i, nguyÖn dïng c¸i chÕt ®Ó chøng tá. NÕu nh­ tr­íc ®©y ng­êi quy thuËn §¹i Liªu ta th× sÏ kh«ng ra n«ng nçi nµy!"},
			{nYzbIdx, "Gia LuËt Phi Hång! Kh«ng cÇn ng­¬i nãi nh÷ng lêi gi¶ dèi ®ã! H·y mau giao nép hµi cèt cña Gia Gia ra ®©y!"},
			{nYlfhIdx, "C¸i g×? C¸c ng­¬i ®õng hßng c­íp hµi cèt cña D­¬ng huynh ®i! Tªn ranh con, ng­¬i t­ëng r»ng ta sî c¸c ng­¬i µ?"},
			{tNpcs.yy[2], "Dõng... tay"},
			{nYlfhIdx, "Ch¼ng lÏ lµ D­¬ng huynh?"},
			{tNpcs.yy[2], "ChÝnh x¸c, ®ã lµ cè nh©n."},
			{{nYzbIdx, nMgyIdx}, "Gia Gia!"},
			{tNpcs.yy[2], "Gia LuËt hiÒn ®Ö, lóc D­¬ng mç cßn sèng ®· tõng giao ®Êu vµi lÇn, tµn dông binh cña hiÖn ®Ö thËt khiÕn ta th¸n phôc. Sai khi ta mÊt, ®Ö ®· xin Liªu Chóa c¸o l·o, ®Õn canh gi÷ Th¸i NhÊt Th¸p ®Ó b¶o vÖ thi thÓ cña ta. Ta thËt vinh h¹nh khi ®­îc ®¹i v­¬ng xem trong! Ta vµ ®Ö tuy thuéc hai n­íc H¸n Liªu, nh­ng tõ l©u ta ®· xem ®Ö nh­ ng­êi tri kû råi!"},
			{nYlfhIdx, "D­¬ng huynh! Cã c©u nãi nµy cña huynh, Gia LuËt Phi Hång sèng kh«ng uæng cuéc ®êi nµy råi!"},
			{tNpcs.yy[2], "Thanh Hoang Háa L­u Kim nµy ®· theo ta chinh chiÕn nhiÒu n¨m, hiÖn nay trªn thÕ gian nµy chØ duy nhÊt hiÒn ®Ö xøng ®¸ng víi nã! H«m nay ta sÏ tÆng nã cho ®Ö, mong ®Ö h·y nhËn lÊy!"},
			{nYlfhIdx, "§a t¹ D­¬ng huynh!"},
			{tNpcs.yy[2], "T«n B¶o, QuÕ Anh, c¸c con ph¶i sèng cho thËt tèt, t­¬ng lai cña D­¬ng gia sÏ tr«ng cËy vµo c¸c con."},
			{nYlfhIdx, "Mé v©n th©m táa thanh thu méng, tè nguyÖt hµn tinh chiÕu cè nh©n. Hµi cèt cña D­¬ng huynh ë ®©y, c¸c ng­¬i h·y cÇm lÊy!"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		local v = tContent[nParagraph][nSentence][1];
		if "number" ~= type(v) or (tContent[nParagraph][nSentence][1] > 0) then
			if "number" == type(v) then
				NpcChat(v, tContent[nParagraph][nSentence][2]);
			elseif "string" == type(v) then
				local nNpcIdx = TY_FindNpc(v);
				if 0 == nNpcIdx then
					nNpcIdx = TY_CreateNpc(tNpcs.yy, tNpcPos.yy[7][1]);
					SetNpcDir(nMgyIdx, 38);
					SetNpcDir(nYzbIdx, 32);
				end
				NpcChat(nNpcIdx, tContent[nParagraph][nSentence][2]);
			elseif "table" == type(v) then
				for i = 1, getn(v) do
					NpcChat(v[i], tContent[nParagraph][nSentence][2]);
				end
			end
		else
			local nNpcIdx = TY_FindNpc(tNpcs.yy[2]);
			RemoveNpc(nNpcIdx);
			RemoveNpc(nYlfhIdx);
			SetNpcDir(nMgyIdx, 55);
			SetNpcDir(nYzbIdx, 15);
			SetMissionV(this.mv_22, 1);
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage06_3:NpcMain()
	if 0 == GetMissionV(this.mv_22) then return 0; end
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		local strTab = {
			"Ta muèn rêi khái ¶i/TY_CloseMission",
			"Hñy bá/nothing",
		};
		Say("<color=green>Méc QuÕ Anh<color>: KÕt thóc ¶i.", getn(strTab), strTab);
	end
end

function tStage06_3:OnPlayerDeath()
	local self = tStage06_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage06_3:onTimeout()
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage06_3 = inherit(cycPhase, tStage06_3);

tStage06_3.actions = {
	[1] = tStage06_3.Init,
};

tStage06_3.cycActions = {
	[2] = {
		[0] = {tStage06_3.NpcTalk, },
	},
};

tStage06_3.triggers = {
	Talk = {
		{action = tStage06_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage06_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage06.phases = {tStage06_1, tStage06_2, tStage06_3};
