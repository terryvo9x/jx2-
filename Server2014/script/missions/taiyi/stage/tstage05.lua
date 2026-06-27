Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--µÚ5¹Ø£ºÒµÈÐ
-----------------------------------------------------------------
tStage05 = {
	name = "NghiÖp NhÉn",
	nStageId = 5,
	maxsecond = 120 * 60,
	actionsType = "second",
};
tStage05 = inherit(cycPhase, tStage05);

function tStage05:onTimeout()
	local self = tStage05;
	this:Msg2MSAll(format("%d phót sau ch­a hoµn thµnh [%s], ¶i sÏ ®ãng l¹i!", tStage05.maxsecond / 60, tStage05.name));
	TY_CloseMission();
end

--ÒµÈÐ-×¼±¸Çø
-----------------------------------------------------------------
tStage05_1 = {
	name = "NghiÖp NhÉn-Khu chuÈn bÞ",
	nStageId = TOTAL_STAGE + tStage05.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "NghiÖp NhÉn-Khu chuÈn bÞ",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage05_1:CreateNpcs()
	local self = tStage05_1;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_2, tNpcPos.mgy[6][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_2, tNpcPos.yzb[6][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage05_1:Init()
	local self = tStage05_1;
	
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_03, 0);
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("§éi tr­ëng vµ Méc QuÕ Anh ®èi tho¹i ®Ó tiÕp tôc ¶i!") end);
end

function tStage05_1:BeginFight()
	local self = tStage05_1;
	SetMissionV(this.mv_22, 1);	--¿ªÆô¹Ø¿¨
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 14, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 26, 0, 1);
	end
end

function tStage05_1:CheatMode()
	local self = tStage05_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>Méc QuÕ Anh<color>: Trªn ng­êi b¹n"..TYT_IB_ITEM[1].."Kh«ng ®ñ.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 34, 0, 1);
	self:BeginFight();
end

function tStage05_1:EndStage06()
	local self = tStage05_1;
	TY_StagePassed(self);
	
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	SetMissionV(self.father.curPhaseLv, 3);
	local tCurPhase = self.father.phases[3];
	tCurPhase:onInit(self.father);
end

function tStage05_1:OnPlayerDeath()
	local self = tStage05_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage05_1:onTimeout()
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage05_1:NpcMain()
	local self = tStage05_1;
	local nNpcIdx = GetTargetNpc();
	if not TY_IsCaptain() or GetNpcName(nNpcIdx) ~= tNpcs.mgy_1[2] then return 0; end
	
	if not tStage05_1.sel_NORMAL then
		tStage05_1.sel_NORMAL = {
			"Më ¶i 2: NghiÖp NhÉn/#tStage05_1.BeginFight()",
			"H×nh thøc sao chÐp (CÇn "..TYT_IB_ITEM[1].."*1)/#tStage05_1.CheatMode()",
--			"½áÊøµÚÎå¹Ø/#tStage05_1.EndStage06()",
			"Ta muèn rêi khái ¶i/TY_ConfirmClose",
			"Hñy bá/nothing",
		};
	end
	
	if not tStage05_1.sel_HARD then
		tStage05_1.sel_HARD = {
			"Më ¶i 2: NghiÖp NhÉn/#tStage05_1.BeginFight()",
--			"½áÊøµÚÎå¹Ø/#tStage05_1.EndStage06()",
			"Ta muèn rêi khái ¶i/TY_ConfirmClose",
			"Hñy bá/nothing",
		};
	end
	
	local strTab = tStage05_1.sel_HARD;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		strTab = tStage05_1.sel_NORMAL;
	end
	Say("<color=green>Méc QuÕ Anh<color>: PhÝa tr­íc cã ¸nh s¸ng lÊp l¸nh, ¸nh s¸ng nµy rÊt gièng béi ®ao cña Gia Gia!", getn(strTab), strTab);
end

tStage05_1 = inherit(cycPhase, tStage05_1);

tStage05_1.actions = {
	[1] = {
		[0] = {tStage05_1.Init, },
	},
};

tStage05_1.triggers = {
	Talk = {
		{action = tStage05_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage05_1.OnPlayerDeath},
	},
};

--ÒµÈÐ-¿ªÆô
-----------------------------------------------------------------
tStage05_2 = {
	name = "NghiÖp NhÉn",
	nStageId = TOTAL_STAGE + tStage05.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "NghiÖp NhÉn",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage05_2:Init()
	local self = tStage05_2;
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_easy_open_2, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_hard_open_2, 1);
	end
	
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 1);	--1:¹Ø¿¨¿ªÆô¶Ô»° 2:Õ½¶·½×¶Î 3:Õ½¶·½áÊø¶Ô»°
	SetMissionV(this.mv_24, 0);	--¼¼ÄÜÑ­»·ÖÜÆÚ
	SetMissionV(this.mv_25, 0);	--¼¼ÄÜÖÜÆÚµÚ20ÃëÊÇ·ñÊÍ·Å¹ý»Ä»ðÖ®Çò
	SetMissionV(this.mv_26, 1);	--¼¼ÄÜÖÜÆÚÑ­»·´ÎÊý
	SetMissionV(this.mv_27, -1);--´ó½ðµ¶µ¹¼ÆÊ±
	SetMissionV(this.mv_28, 0);--¼¼ÄÜÊÍ·ÅµãX×ø±ê
	SetMissionV(this.mv_29, 0);--¼¼ÄÜÊÍ·ÅµãY×ø±ê
	SetMissionV(this.mv_30, 3);--»Ä»ðÁ÷½ðµ¶³öÏÖµ¹¼ÆÊ±
	SetMissionV(this.mv_31, 0);--BossËÀÍö
	this.msCamp:turnPlayer(0, function() SetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN, 0); end);
	this.msCamp:turnPlayer(0, self.AddNBJ);
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	TY_AddAttackState();
	TY_ClearDamagePoint();
	--Observer:onEvent(OE_TAIYI_LEVEL_START, {5, GetMissionV(MV_MAP_ID), GetMissionV(this.mv_02)});	--201212»î¶¯Ìí¼Ó µ·µ°µÄÑ©ÈË

end

function tStage05_2:OnNpcDeath(event, data)
	local self = tStage05_2;
	local szName = GetNpcName(data[1]);
	
	if szName ~= tNpcs.hhlj[2] then
		RemoveNpc(data[1]);
	else
		local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
		local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
		TY_SetNpcType2Talk(nMgyIdx);
		TY_SetNpcType2Talk(nYzbIdx);
		SetMissionV(this.mv_22, 3);	--½áÊøÕ½¶·
		SetMissionV(this.mv_30, 5);
		TY_ClearNpc(tNpcs.ljfb[2]);
		SetMissionV(this.mv_31, 1);
	end
end

function tStage05_2:DropKnife()
	if 3 ~= GetMissionV(this.mv_22) then return 0; end
	local self = tStage05_2;
	local nVal = GetMissionV(this.mv_30);
	if 0 == nVal then
		local nHhljIdx = TY_FindNpc(tNpcs.hhlj[2]);
		local nMapId, x, y = GetNpcWorldPos(nHhljIdx);
		RemoveNpc(nHhljIdx);
		local nNpcIdx = CreateNpc("TYT_HHLJsword", "Hoang Háa L­u Kim §ao", nMapId, x, y);
		SetMissionV(this.mv_20, 2);	--µÚ¶þ¶Î¶Ô»°
		SetMissionV(this.mv_21, 1);
	end
	if nVal >= 0 then
		SetMissionV(this.mv_30, nVal - 1);
	end
end

--Äý±ù¾÷
function tStage05_2:AddNBJ()
	if 1 ~= gf_Judge_Room_Weight(1, 10, "") then
		Talk(1, "", "Tói kh«ng ®ñ chç, kh«ng thÓ nhËn");
		return 0;
	end
	
	gf_AddItemEx({2, 95, 1510, 1}, "Ng­ng B¨ng QuyÕt");
end

function tStage05_2:DelNBJ()
	local nItemCount = BigGetItemCount(2, 95, 1510);
	if nItemCount >= 1 then
		if 1 ~= BigDelItem(2, 95, 1510, nItemCount) then
			WriteLog(format("[tTY:onLeave] [Rêi khái ¶i Th¸i NhÊt Th¸p, xãa Ng­ng B¨ng QuyÕt thÊt b¹i!] [Account:%s Role:%s]", GetAccount(), GetName()));
		end
	end
end

function tStage05_2:CheckPos()
	if GetMissionV(this.mv_22) ~= 2 or GetMissionV(this.mv_24) < 60 then		--¼¼ÄÜÑ­»·µÚ60Ãë¿ªÊ¼×ßÏòÌ¨ÖÐ¼ä
		return 0;
	end
	
	local nHhljIdx = TY_FindNpc(tNpcs.hhlj[2]);
	if 0 == nHhljIdx then return 0; end
	local _, x, y = GetNpcWorldPos(nHhljIdx);
	if abs(x - 1451) > 1 or abs(y - 3494) > 1 then
		if GetMissionV(this.mv_24) < 70 then
			return 0;
		else	--µÚ70Ãë»¹Î´×ßµ½£¬Ö±½ÓÀ­µ½ÖÐ¼ä
			SetNpcPos(nHhljIdx, 1451, 3494);
		end
	end
	g_NpcAI:setAI(nHhljIdx, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nHhljIdx, {{x, y}, });
	CastState2Npc(nHhljIdx, "state_fetter", 1, 10 * 18);
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1675);	--ÊÍ·Å¼¼ÄÜ»Ä»ðöÌ½ð
	else
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1675);	--ÊÍ·Å¼¼ÄÜ»Ä»ðöÌ½ð
	end
	SetMissionV(this.mv_24, -10);
	SetMissionV(this.mv_26, GetMissionV(this.mv_26) + 2);
end

function tStage05_2:DoSkill1(nHhljIdx, x, y)
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1669);	--»Ä»ðÁÒÑæ
	else
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1669);	--»Ä»ðÁÒÑæ
	end
end

function tStage05_2:DoSkill2(nHhljIdx, x, y)
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	if 0 == nMgyIdx then return 0; end
	NpcChat(nMgyIdx, "H·y mau sö dông Ng­ng B¨ng QuyÕt, Hoang Háa Chi CÇu sÏ thiªu chóng ta thµnh tro mÊt!");
	this:Msg2MSAll("H·y mau sö dông Ng­ng B¨ng QuyÕt, Hoang Háa Chi CÇu sÏ thiªu chóng ta thµnh tro mÊt!");
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("Hoang Háa L­u Kim ®ang ph¸t ra Hoang Háa Chi CÇu ") end);
	if  eDifType.NORMAL == GetMissionV(this.mv_02) then
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1671);	--»Ä»ðÖ®Çò
	else
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1671);	--»Ä»ðÖ®Çò
	end
end

function tStage05_2:CreateLjfb(x, y)
	local nMapId = this.msPosition:getMapID();
	local nLjfb = CreateNpc(tNpcs.ljfb[1], tNpcs.ljfb[2], nMapId, x, y);	--öÌ½ð·ç±©
	CastState2Npc(nLjfb, "state_confusion", 100, 18*60);
	SetCurrentNpcSFX(nLjfb, 990, 1, 1);
end

function tStage05_2:DoSkill()
	local self = tStage05_2;
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	local nValue = GetMissionV(this.mv_24);
	local nHhljIdx = TY_FindNpc(tNpcs.hhlj[2]);
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nMapId, x, y = GetNpcWorldPos(nHhljIdx);

	--´ó½ðµ¶´¥·¢Ê±¼ä
	if not self.tTimePoint then self.tTimePoint = {}; end
	if not self.tTimePoint["DJD"] then
		tStage05_2.tTimePoint["DJD"] = {
			[0 ] = 1,
			[6 ] = 1,
			[12] = 1,
			[18] = 1,
			[24] = 1,
			[30] = 1,
			[36] = 1,
			[42] = 1,
			[48] = 1,
			[54] = 1,
			[60] = 1,
		};
	end
	
	if not self.tTimePoint["RANDOM"] then
		tStage05_2.tTimePoint["RANDOM"] = {
			[1] = 1,
			[16] = 1,
			[31] = 1,
			[46] = 1,
			[60] = 1,
		};
	end
	
	if self.tTimePoint["DJD"][nValue] then
		local _, x, y = TY_FindRandomPlayerPos({x, y});
		if x then
			NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1672);
			SetMissionV(this.mv_27, 2);
			SetMissionV(this.mv_28, x);
			SetMissionV(this.mv_29, y);
		end
	end
	
	if 0 == GetMissionV(this.mv_27) then
		local x, y = GetMissionV(this.mv_28), GetMissionV(this.mv_29);
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1673);
		else
			NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1673);
		end
	end
	
	if self.tTimePoint["RANDOM"][nValue] then
		if not self.tSkillList then
			self.tSkillList = {
				{0.5, self.DoSkill1},
				{0.5, self.DoSkill2},
			};
		end
		local nRand = random(1, 100000);
		for i = 1, getn(self.tSkillList) do
			nRand = nRand - self.tSkillList[i][1] * 100000;
			if nRand <= 0 then
				self.tSkillList[i][2](self, nHhljIdx, x, y);
				break;
			end
		end
	elseif nValue >= 60 then	--60ÃëºóµÄ½×¶ÎÔÚCheckPosÖÐ
		g_NpcAI:setAI(nHhljIdx, AT_SM_MOVE);
		g_NpcAI:setWayPoint(nHhljIdx, {{1451, 3495}, });
	end
	
	if GetMissionV(this.mv_27) >= 0 then
		SetMissionV(this.mv_27, GetMissionV(this.mv_27) - 1);
	end
	SetMissionV(this.mv_24, GetMissionV(this.mv_24) + 1);
end

function tStage05_2:CreateLjfb()
	local self = tStage05_2;
	if not self.tRoadPoints then
		self.tRoadPoints = {
			["A"] = {1449, 3455},
			["B"] = {1492, 3499},
			["C"] = {1406, 3498},
			["D"] = {1447, 3545},
			["E"] = {1429, 3475},
			["F"] = {1471, 3477},
			["G"] = {1474, 3519},
			["H"] = {1428, 3521},
		};
	end
	if not self.tList then
		self.tList = {
			{"A", "B", "D", "C", "A"},
			{"D", "C", "A", "B", "D"},
			{"F", "E", "G", "H", "F"},
			{"H", "G", "F", "E", "H"},
		};
	end
	local nMapId = this.msPosition:getMapID();
	local tList = self.tList;
	for i = 1, getn(tList) do
		local nLjfb = CreateNpc(tNpcs.ljfb[1], tNpcs.ljfb[2], nMapId, self.tRoadPoints[tList[i][1]][1], self.tRoadPoints[tList[i][1]][2]);	--öÌ½ð·ç±©
		SetCurrentNpcSFX(nLjfb, 990, 1, 1);
		CastState2Npc(nLjfb, "state_dispear", 100, 60*60*18);
		AddUnitStates(nLjfb, 8, -GetUnitCurStates(nLjfb, 8));	--ÊÓÒ°±ä0
		local tPointList = {};
		g_NpcAI:setAI(nLjfb, AT_SM_PATROL);
		for j = 1, getn(tList[i]) do
			tinsert(tPointList, self.tRoadPoints[tList[i][j]]);
		end
		g_NpcAI:setWayPoint(nLjfb, tPointList);
	end
end

function tStage05_2:StagePassed()
	local self = tStage05_2;
	this.msCamp:turnPlayer(0, function() SetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN, 1); end);
	this.msCamp:turnPlayer(0, self.DelNBJ);
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 15, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 27, 0, 1);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_46, 0); -- Ç§Ñ°Ëþ²ú³ö
	TY_StagePassed(self);
	self:onFinish();
end

function tStage05_2:NpcTalk()
	local self = tStage05_2;
	if GetMissionV(this.mv_22) ~= 1 and GetMissionV(this.mv_22) ~= 3 then
		return 0;
	end
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local tContent = {
		[1] = {
			{nYzbIdx, "Khoan, h·y dõng l¹i! Ta biÕt luång khÝ nãng báng nµy lµ g×!"},
			{nMgyIdx, "C¸i g×?"},
			{nYzbIdx, "¸nh s¸ng hõng hùc, khÝ thÕ b¸ ®¹o, rÊt gièng c¶nh t­îng Gia Gia xuÊt chinh!"},
			{nMgyIdx, "Nh­ng ng­êi ë trªn c¸i ®µi ®ã, sao kh«ng gièng víi l·o lÖnh c«ng cña chóng ta."},
			{nYzbIdx, "……"},
			{-1, ""},
		},
		[2] = {
			{nYzbIdx, "Qu¶ nhiªn lµ… Hoang Háa L­u Kim!"},
			{nYzbIdx, "QuÕ Anh, ng­¬i tõng nghe qua ngo¹i hiÖu Kim §ao D­¬ng NghiÖp ch­a?"},
			{nMgyIdx, "§­¬ng nhiªn lµ biÕt råi, ®ao ph¸p cña Gia Gia cùc cao, chØ cã qu©n nh©n ph­¬ng b¾c KiÒu Së míi cã thÓ s¸nh b»ng."},
			{nYzbIdx, "ChÝnh x¸c, 2 ch÷ Kim §ao chÝnh lµ ¸m chØ thanh ®ao Hoang Háa L­u Kim nµy! Khi «ng néi xuÊt chinh, thanh ®ao nµy ch­a tõng rêi ra tÇm tay, trËn chiÕn Kim Sa Than ®· bÞ ng­êi Liªu h·m h¹i nªn míi thÊt thñ."},
			{nMgyIdx, "VÜ c©u chuyÖn cña TÞch Tµ nªn Th¸i NhÊt Th¸p trë thµnh n¬i cã søc m¹nh tô linh, Hoang Háa L­u Kim do t­ëng niÖm cè chñ nªn hãa thµnh ng­êi ®Ó trÊn thñ. Sau mét håi chiÕn ®Êu ¸c liÖt, nã ®· bÞ dßng m¸u D­¬ng M«n trªn ng­êi cña T«n B¶o hµng phôc!"},
			{nYzbIdx, "H«m nay vËt tr¶ vÒ chñ cò, ta sÏ dïng b¶o ®ao ®Ó hoµn thµnh sù nghiÖp cña Gia Gia!"},
			{-1, ""}
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		else
			if nParagraph == 1 then	--µÚÒ»¶Î·Ï»°ËµÍê
				SetMissionV(this.mv_22, 2);	--¿ª´ò
				self:CreateLjfb();
				local nHhljIdx = 0;
				if eDifType.NORMAL == GetMissionV(this.mv_02) then
					nHhljIdx = TY_CreateNpc(tNpcs.hhlj_1, tNpcPos.hhlj[6][1]);
--					TY_SupplyNpc(self.nStageId);
				else
					nHhljIdx = TY_CreateNpc(tNpcs.hhlj, tNpcPos.hhlj[6][1]);
				end
				SetNpcDeathScript(nHhljIdx, thisFile);
				
				local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
				local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
				TY_SetNpcType2Fight(nMgyIdx);
				TY_SetNpcType2Fight(nYzbIdx);
				NpcChat(nYzbIdx, "Béi ®ao cña Gia Gia rÊt b¸ ®¹o, chóng ta ph¶i tr¸nh nÐ chiªu thøc cña nã.");
				this:Msg2MSAll("Béi ®ao cña Gia Gia rÊt b¸ ®¹o, chóng ta ph¶i tr¸nh nÐ chiªu thøc cña nã.");
			elseif nParagraph == 2 then
				self:StagePassed();
			end
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage05_2:onTimeout()
	local self = tStage05_2;
	if 1 == GetMissionV(this.mv_31) then
		self:StagePassed();
		return 0;
	end
	TY_RecordDamagePoint()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	if GetMissionV(this.mv_22) == 0 then
		TY_CloseMission();
		return 0;
	end
	
	this.msCamp:turnPlayer(0, function() SetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN, 0); end);
	this.msCamp:turnPlayer(0, self.DelNBJ);
--	if eDifType.NORMAL == GetMissionV(this.mv_02) and 1 == GetMissionV(this.mv_03) then
--		TY_GoToStage(self, self.father.father, 1);
--		this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[tStage00.nStageId][1]);
--	else
		TY_GoToStage(self, self.father, 1);
--	end
end

function tStage05_2:OnPlayerDeath(event, data)
	local self = tStage05_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage05_2 = inherit(cycPhase, tStage05_2);

tStage05_2.actions = {
	[1] = tStage05_2.Init,
};

tStage05_2.cycActions = {
	[1] = {
		[0] = {tStage05_2.CheckPos, tStage05_2.DropKnife, tStage05_2.DoSkill, },
	},
	[2] = {
		[0] = {tStage05_2.NpcTalk, },
	},
};

tStage05_2.triggers = {
	NpcDeath = {
		{action = tStage05_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage05_2.OnPlayerDeath},
	},
};

--ÒµÈÐ-½áÊøÇø
-----------------------------------------------------------------
tStage05_3 = {
	name = "NghiÖp NhÉn-Khu kÕt thóc",
	nStageId = TOTAL_STAGE + tStage05.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "NghiÖp NhÉn-Khu kÕt thóc",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage05_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[6][2]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[6][2]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
end

function tStage05_3:Init()
	local self = tStage05_3;
	
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage05_3:GoToStage07()
	local self = tStage05_3;
	TY_ClearMapNpc();
	self:onFinish();
end

function tStage05_3:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		if not tStage05_3.sel then
			tStage05_3.sel = {
				"TruyÒn tèng ®Õn Th¸i NhÊt Th¸p-§Ønh/#tStage05_3.GoToStage07()",
				"Ta muèn rêi khái ¶i/TY_ConfirmClose",
				"Hñy bá/nothing",
			};
		end
		Say("<color=green>Méc QuÕ Anh<color>: §ång ý ®Õn Th¸i NhÊt Th¸p-§Ønh?", getn(tStage05_3.sel), tStage05_3.sel);
	end
end

function tStage05_3:OnPlayerDeath()
	local self = tStage05_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage05_3:onTimeout()
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage05_3 = inherit(cycPhase, tStage05_3);

tStage05_3.actions = {
	[1] = tStage05_3.Init,
};

tStage05_3.cycActions = {
	
};

tStage05_3.triggers = {
	Talk = {
		{action = tStage05_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage05_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage05.phases = {tStage05_1, tStage05_2, tStage05_3};
