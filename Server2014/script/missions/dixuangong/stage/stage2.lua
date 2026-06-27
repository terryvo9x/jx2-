--------------------------------------------------------------------
-- µØÐþ¹¬ µÚ2¹Ø
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
--Include("\\script\\lib\\define.lua");
--Include("\\script\\master_prentice\\master_prentice_point.lua")
----2013Äê3ÔÂ»î¶¯Ìí¼Ó
--Include("\\script\\online\\2013\\camp03\\head.lua");
----2013Äê3ÔÂ»î¶¯Ìí¼Ó½áÊø
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phase2_1 = gf_CopyInherit(tPhaseBase, {
--})
COUNT_RUNNER = 15 - 1;

phase2_1 = {
	stepInterval = 1,
	stepLimit = 2,
};
phase2_2 = {
	stepInterval = 1,
	stepLimit = 10 * 60,
	maxCount = COUNT_RUNNER,
};
phase2_3 = {
	stepInterval = 5,
	stepLimit = 180/5,
};

--------------------------------------------------------------------
tStage2 = {
	tPhases = {
		phase2_1,
		phase2_2,
		phase2_3,
	},
	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1674, 3234},
		{1681, 3214},
	},
	way1 = {
		{1690, 3210, },
		{1682, 3203, },
		{1668, 3217, },
		{1675, 3226, },
		{1660, 3240, }, },
	way2 = {
		{1690, 3210, },
		{1697, 3219, },
		{1683, 3234, },
		{1675, 3226, },
		{1660, 3240, }, },
	npcpos = {1702, 3190, },
	fishpos = {
		{1682, 3209, },
		{1692, 3218, },
		{1674, 3218, },
		{1683, 3228, }, },
	bosspos = {1682, 3218, },

	resetPos = {1674, 3234},
	npcMod = {
		{"Minh Gi¸o Th¸m Tù §Þa", "Minh Gi¸o Th¸m Tö"},

		{"Thiªn ¢m Ngôc Tèt §Þa", "§Çu Sá Ngôc Tèt Thiªn ¢m",},
		{"TuyÒn Cø §Þa", "TuyÒn Cø", },

		{"yinbaoxiang", "R­¬ng B¹c", 180},
		{"tongbaoxiang", "R­¬ng §ång", 180},
		--{"Ïä×ÓÇ®", "ÌìÒõ¾«Á¦Ïä", 180},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStage2:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage2:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], getStage():GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStage2:createRunner()
	local npcMod = {};
	npcName = "Nh©n sÜ vâ l©m bÞ giam cÇm";
	local model = "Giam CÇm §Þa"..random(1,10)
	npc = CreateNpc(model, npcName, self:GetPosEx(self.npcpos));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampPlayer);
	SetNpcLifeTime(npc, 16);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	local way = self.way1;
	if self.bWay == 1 then
		way = self.way2;
		self.bWay = 0;
	else
		self.bWay = 1;
	end
	g_NpcAI:setWayPoint(npc, way);
	SetNpcActivator(npc);
	return npc;
end

function tStage2:createFish()
	local npcMod = self.npcMod[3];
	local tPos = self.fishpos;
	for i = 1, getn(tPos) do
		local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPosEx(tPos[i]));
		if npcMod[3] then
			SetNpcLifeTime(npc, npcMod[3]);
		end
		SetCampToNpc(npc, CampEnemy);
		SetNpcScript(npc, g_theMS.fileName);
	end
end

function tStage2:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end
function tStage2:GetPosEx(pos)
	local m, x, y = g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
	return m, x, y;
end
function tStage2:onTimerOver()
	g_theMS:Close()
end
tStage2.rule["timerover"] = tStage2.onTimerOver;

function tStage2:giveAward(nNpcIdx, nBossCount)
	--ÌìÒõÊ¥ÎïÏä
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	for i = 1, 4 do
		create_box_yin(m,x,y,2)
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[4];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
	end
	create_box_tong(nNpcIdx, 2) --ÌìÒõÃÜÏä±äÍ­±¦Ïä
--	--ÌìÒõÃÜÏä
--	for i = 1, 1 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[5];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
--	--ÌìÒõ¾«Á¦Ïä
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[6];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	
	local nCount = GetMissionV(MV_LIVED_RUNNER);
	local nScore = GetMissionV(MV_L2_SCORE);
	local nExpMulti;
	if nScore < 12 then
		nExpMulti = 1.2;
	elseif nScore < 18 then
		nExpMulti = 1.5;
	elseif nScore < 24 then
		nExpMulti = 2;
	else
		nExpMulti = 2.5;
	end
	g_theMS:Msg2MSAll(format("Tæng céng cøu %d vÞ Nh©n SÜ Vâ L©m, nhËn ®­îc %d ®iÓm",nCount, nScore));
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = floor(lv * lv * 40 * %nExpMulti);
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS2) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS2, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--	end
	giveStageExpAward
	)
--	g_theMS.msCamp[1]:turnPlayer(function ()
--		local lv = GetLevel();
--		local nExp = floor(lv * lv * lv);
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS2) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS2, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--	end)
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 2)
end

-------µÈ´ý¿ªÆô½×¶Î------------------------------------------------------
function phase2_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
--	getStage():createChar(1)
--	g_theMS:Msg2MSAll("ÄãÃÇµÄ¶ÓÎéÒÑ¾­µ½´ïµØÐþ¹¬ÖÐµî£¬¶Ó³¤Óë±»×¥µÄÌìÒõ½ÌÍ½¶Ô»°¿É¿ªÆô¹Ø¿¨¡£");
	g_theMS:SetMissionV(MV_BOSS_COUNT, 0);
end

function phase2_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		local npc = findNpc("Nga My LiÔu Hiªn");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "Høc hu hu, tØ muéi téi nghiÖp cña ta~");
	end
end

function phase2_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())

	local tSel = {
		"Ta ®îi ng­¬i ®Õn cøu ng­êi/#stageAction('p1')",
		"Trung §iÖn cña §Þa HuyÒn Cung nµy cã huyÒn c¬ g×/info2",
		"KÕt thóc ®èi tho¹i/nothing"
	}
	Say("LiÔu Hiªn: høc hu hu, tØ muéi ®¸ng th­¬ng cña ta~", getn(tSel), tSel);
end
function info2()
	Talk(1, "", "Trong phßng cã rÊt nhiÒu TuyÒn Cø, rÊt nhiÒu tØ muéi ®ång m«n trong ®ã chÞu khæ. Bªn trong cßn cã tªn cai ngôc gian ¸c, nhanh nhanh gióp chóng t«i! Nªn nhí, khi cai ngôc chÕt ®i th× toµn bé c¬ quan sÏ ph¸t ®éng, tÊt c¶ c¸c nh©n sÜ vâ l©m sÏ bÞ giam cÇm mµ chÕt!");
end

--------É±¹Ö½×¶Î-------------------------------------------------
function phase2_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr­ît thêi gian", self.stepLimit, 0);
	g_theMS:Msg2MSAll("H·y b¶o vÖ Nh©n SÜ Vâ L©m ch¹y trèn!");
	local pos = getStage().resetPos;
	g_theMS.msCamp[1]:turnPlayer(SetPos, pos[1], pos[2]);
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
	---201212»î¶¯ÐÞ¸Ä
	--Observer:onEvent(OE_DXG_CREATE_NPC,{2, nMapID, 1734, 3160}); --pvpµØÍ¼´«ÈëmapIDºÍÕóÓª£¬pve´«ÈëmapIDºÍ×ø±ê
--	ds_DXG:AddStatValue(2,1,1);
--	ds_DXG:AddStatValue(2,2,g_theMS.msCamp[1]:getCount(0));
end
function phase2_2:onTimer(nStep)
	nStep = nStep - 1;
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
	if nStep == 0 then
		g_theMS:SetMissionV(MV_KILLED_NPC, 0);
		SetMissionV(MV_LIVED_RUNNER, 0);
		local npc = getStage():createChar(2);
		NpcChat(npc, "Qu¶ nhiªn c¸c ng­¬i ®· ®Õn ®©y, ®¸ng tiÕc ®îi c¸c ng­¬i l¹i lµ con ®­êng chÕt!");
		getStage():createFish();
	end
	local runStep = 8
	if mod(nStep, runStep) == 0 then
		if nStep < self.maxCount * runStep then
			local npc = getStage():createRunner();
			tMsg = {
				"Hé gi¸ ta, ë ®©y nguy hiÓm qu¸!",
				"¤i cha mÑ ¬i! cuèi cïng ta còng tho¸t ra ®­îc råi !",
				"Cuèi cïng tªn cÇm ®Çu còng xuÊt hiÖn !",
				"Qu©n tö 10 n¨m b¸o thï còng ch­a muén, ng­¬i ng­¬i ng­¬i cßn c¶ ng­¬i n÷a h·y ®îi ®Êy!",
				"§a t¹ ®¹i hiÖp t­¬ng trî, sau nµy cÇn viÖc g× cø gäi ta mét tiÕng!",
			}
			local msg = randomin(tMsg);
			NpcChat(npc, msg);
		elseif nStep == self.maxCount * runStep then
			local npc = getStage():createRunner();
			NpcChat(npc, "Cuèi cïng ta còng tho¸t ra ®­îc!");
			g_theMS:Msg2MSAll("§¹i ®a sè c¸c nh©n sÜ vâ l©m bÞ giam cÇm ®Òu tho¸t ra ngoµi ®­îc!");
		end
	end
	self:checkRunner();
	if nStep == 25 or nStep == 85 then
		self:castSkill(1);
	elseif nStep == 55 then
		self:castSkill(2);
	end
end
function phase2_2:checkRunner()
	local tNpc = findAllNpc("Nh©n sÜ vâ l©m bÞ giam cÇm");
	for i = 1, getn(tNpc) do
		local npc = tNpc[i];
		local _, x, y = GetNpcWorldPos(npc);
		if abs(x-1660) + abs(y-3240) < 5 then
			local l = GetMissionV(MV_LIVED_RUNNER) + 1;
			SetMissionV(MV_LIVED_RUNNER, l)
			SetNpcLifeTime(npc, 0);
			SetMissionV(MV_L2_SCORE, GetMissionV(MV_L2_SCORE) + 2);
		end
	end
end
function phase2_2:castSkill(n)
	local npc = findNpc("§Çu Sá Ngôc Tèt Thiªn ¢m");
	if not npc then return end

	local tPos = {
		{{1662,3217},{1670,3205},{1693,3232},{1685,3239},{1679,	3213},{1686,3223},},
		{{1670,3205},{1693,3232},{1693,3207},{1671,3231},{1682,3217},},
	}
	tPos = randomin(tPos[n]);
	local tMod = {
		{"Hµn B¨ng TrËn §Þa","Hµn B¨ng TrËn"},
		{"LiÖt Háa TrËn §Þa","LiÖt Háa TrËn"},
	}
	tMod = tMod[n];
	local npcFlag = CreateNpc(tMod[1], tMod[2], GetMissionV(MV_MAP_ID), tPos[1], tPos[2]);
	SetNpcLifeTime(npcFlag, 15);
	SetCampToNpc(npcFlag, CampEnemy);
	NpcChat(npc, "§µo tÈu h¶ n»m m¬ ®i! Ta kh«ng ®Ó cho c¸c ng­¬i tho¸t khái ®©y ®©u!");
end

function phase2_2:finish()
	getStage():action("p2");
end

function phase2_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--Ã¿ÈÕÈÎÎñ-É±¹Ö
	local npcName = GetNpcName(npcIdx);
	if npcName == "§Çu Sá Ngôc Tèt Thiªn ¢m" then
		ClearMapNpc(g_theMS:getMapId(), nil);
		g_theMS.msCamp[1]:turnPlayer(StopTimeGuage,-2);
		stageAction('p2');
		getStage():giveAward(npcIdx, nBossCount);
		local maxCount = GetMissionV(MV_TIMER_STEP) * 5 / 20;
		if maxCount > self.maxCount then
			maxCount = self.maxCount;
		end
	elseif npcName == "Nh©n sÜ vâ l©m bÞ giam cÇm" then
		local nCount = g_theMS:GetMissionV(MV_KILLED_NPC) + 1;
		g_theMS:Msg2MSAll(format("§· cã %d nh©n sÜ vâ l©m bÞ giÕt chÕt!!!", nCount));
		g_theMS:SetMissionV(MV_KILLED_NPC, nCount);
--		ClearMapNpc(g_theMS:getMapId(), nil);
--		StopTimeGuage(-2);
--		stageAction('p2');
	end
	if npcName ~= "TuyÒn Cø" then
		SetNpcLifeTime(npcIdx, 3);
	end
end
function phase2_2:onTrap(nId)
		local pos = getStage().resetPos;
		SetPos(pos[1], pos[2]);
end

--------±¾¹Ø½áÊø----------------------------------------------------
function phase2_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 2);
	--ds_DXG:AddStatValue(2,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Tr¶i qua gian nguy nç lùc, Thiªn ¢m Cai Ngôc §Çu Môc bÞ c¸c ng­¬i ®¸nh b¹i råi.");

	self:createMinion();
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
end

function phase2_3:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('timerover');
		return
	end

	if nStep == 3 then
		local npc = findNpc("Nga My LiÔu Hiªn");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "§a t¹ c¸c vÞ ®¹i hiÖp ®· ra tay t­¬ng trî!");
	end
end

tPos_2_3 = {
	{1649, 3251, { {1660, 3240}, {1678, 3220}}},		-- 03
	{1651, 3253, { {1660, 3240}, {1680, 3222}}},		-- 04
	{1646, 3254, { {1660, 3240}, {1675, 3223}}},		-- 09
	{1648, 3256, { {1660, 3240}, {1677, 3225}}},		-- 10
	{1647, 3249, { {1655, 3235}, {1676, 3218}}},		-- 02
	{1653, 3255, { {1665, 3245}, {1682, 3224}}},		-- 05
	{1644, 3252, { {1655, 3235}, {1673, 3221}}},		-- 08
	{1650, 3258, { {1665, 3245}, {1679, 3227}}},		-- 11
	{1643, 3257, { {1660, 3240}, {1672, 3226}}},		-- 15
	{1645, 3259, { {1660, 3240}, {1674, 3228}}},		-- 16
	{1640, 3260, { {1660, 3240}, {1669, 3229}}},		-- 21
	{1642, 3262, { {1660, 3240}, {1671, 3231}}},		-- 22
	{1645, 3247, { {1655, 3235}, {1674, 3216}}},		-- 01
	{1655, 3257, { {1665, 3245}, {1684, 3226}}},		-- 06
	{1642, 3250, { {1655, 3235}, {1671, 3219}}},		-- 07
	{1652, 3260, { {1665, 3245}, {1681, 3229}}},		-- 12
	{1641, 3255, { {1655, 3235}, {1670, 3224}}},		-- 14
	{1647, 3261, { {1665, 3245}, {1676, 3230}}},		-- 17
	{1639, 3253, { {1655, 3235}, {1668, 3222}}},		-- 13
	{1649, 3263, { {1665, 3245}, {1678, 3232}}},		-- 18
	{1638, 3258, { {1655, 3235}, {1667, 3227}}},		-- 20
	{1644, 3264, { {1665, 3245}, {1673, 3233}}},		-- 23
	{1636, 3256, { {1655, 3235}, {1665, 3225}}},		-- 19
	{1646, 3266, { {1665, 3245}, {1675, 3235}}},		-- 24
}
function phase2_3:createMinion()
	local npc = CreateNpc("LiÔu Hiªn §Þa", "Nga My LiÔu Hiªn", g_theMS:GetMissionV(MV_MAP_ID), 1653, 3248);
	SetCampToNpc(npc, CampPlayer);
	SetNpcActivator(npc);
	ChangeNpc2Talk(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	g_NpcAI:setWayPoint(npc, {{1690, 3209}});
	SetNpcScript(npc, g_theMS.fileName);

	local nCount = g_theMS:GetMissionV(MV_LIVED_RUNNER);
	m = GetMissionV(MV_MAP_ID);
	for i = 1, nCount do
		local pos = tPos_2_3[i];
		npc = self:createMinion2(m, pos[1], pos[2]);
		g_NpcAI:setAI(npc, AT_SM_MOVE);
		g_NpcAI:setWayPoint(npc, pos[3]);
		SetNpcScript(npc, g_theMS.fileName);
	end
end

function phase2_3:createMinion2(m, x, y)
	npcName = "Vâ L©m Tinh Anh";
	local model = "Vâ L©m Nh©n SÜ §Þa"..random(1,10)
	npc = CreateNpc(model, npcName, m, x, y);
	SetCampToNpc(npc, CampPlayer);
--	ChangeNpc2Talk(npc);
	return npc;
end

function phase2_3:onTalk(npcIdx)
	local npcName = GetTargetNpcName();
	if npcName == "Nga My LiÔu Hiªn" and isCaption() then
		Say("TrËn chiÕn nµy nh©n sÜ vâ l©m tæn thÊt nÆng nÒ, mong c¸c ch­ vÞ t­¬ng trî!", 1, "Ta nguyÖn v× vâ l©m mµ gióp søc/phase2_3_gogogo");
	else
		Talk(1, "", format("<color=green>%s<color>: ®a t¹ ®· t­¬ng trî!", npcName));
	end
end

function phase2_3_gogogo()
	local flag = GetMissionV(MV_S2_GGG_FLAG);
	if flag == 1 then return end
	SetMissionV(MV_S2_GGG_FLAG, 1);
	local npc = findNpc("Nga My LiÔu Hiªn");
	NpcChat(npc, "C¸c huynh ®Ö, ®¸nh tan §¹i HuyÒn Cung Cung Chñ chóng ta chia nhau trang bÞ!");
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	g_NpcAI:setWayPoint(npc, {{1717, 3169}});
	setCurStage(3)
	remove_tong_box()
	remove_yin_box()
	remove_box_gold()

	local tMsg = {
		"HÕt tiÒn söa trang bÞ råi T_T",
		"Trêi, c¶ bé!",
		"++++++++++++++",
		"H¾c thñ ®õng më r­¬ng!! ",
	}
	local tnpcs = findAllNpc("Vâ L©m Tinh Anh");
	local t = {{1690, 3197}, {1696, 3201}, {1700, 3208}};
	for _, npc in tnpcs do
--		ChangeNpc2Fight(npc);
		g_NpcAI:setAI(npc, AT_SM_ATTACK);
		local _, x, y = GetNpcWorldPos(npc);
		local p1 = randomin(t);
		g_NpcAI:setWayPoint(npc, {p1, {x+50, y-50}});
		if random(10) <= 3 then
			NpcChat(npc, randomin(tMsg));
			SetNpcActivator(npc);
		end
	end
end

function phase2_3:onTrap(nId)
	if nId == 2 then
		g_theMS:action("s3")
	end
end
--------------------------------------------------------------------

tStage2 = gf_CopyInherit(tStageBase, tStage2);
