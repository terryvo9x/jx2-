--------------------------------------------------------------------
-- µØÐþ¹¬ µÚ3¹Ø
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
--Include("\\script\\master_prentice\\master_prentice_point.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phasexx_1 = gf_CopyInherit(tPhaseBase, {
--})

phasexx_1 = {
	stepInterval = 1,
	stepLimit = 180,
};
phasexx_2 = {
	stepInterval = 30,
	stepLimit = 600,
};
phasexx_3 = {
	stepInterval = 60,
	stepLimit = 1,
};

--------------------------------------------------------------------
tStageXX = {
	tPhases = {
		phasexx_1,
		phasexx_2,
		phasexx_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1715, 3188},

		{1721, 3168},
	},
	resetPos = {1721, 3168},
	npcMod = {
		{"Minh Gi¸o Th¸m Tù §Þa", "Th¸m Tö TuÇn Tra"},

		{"yinbaoxiang", "R­¬ng B¹c", 180},
		{"yinbaoxiang", "R­¬ng §ång", 180},
		{"IBbaoxiang", "Thiªn ¢m MËt R­¬ng", 180},
		--{"Ïä×ÓÇ®", "ÌìÒõ¾«Á¦Ïä", 180},
	},
	bossMod = {
		{1430, "Hång Kú Tinh §Þa", "Thiªn ¢m S¸t Thñ Tinh Anh", 1},
		{1430, "H¾c Kú Tinh §Þa", "Thiªn ¢m §¹i Tinh Anh", 1},
		{1430, "Lam Kú Tinh §Þa", "Thiªn ¢m TÝn Sø Tinh Anh", 1},
		{1430, "Hoµng Kú Tinh §Þa", "Thiªn ¢m MËt Th¸m Tinh Anh", 1},
		{1430, "B¹ch Kú Tinh §Þa",     "B¹ch Kú Tinh Anh", 1},
		{510 , "Hång Kú Chñ §Þa", "Hång Kú Chñ Hång Tinh", 2},
		{510 , "H¾c Kú Chñ §Þa", "H¾c Kú Chñ ¤ Mai Vò", 2},
		{510 , "Lam Kú Chñ §Þa", "Lam Kú Chñ Lam Èn H¹c", 2},
		{510 , "Hoµng Kú Chñ §Þa",   "Hoµng Kú Chñ Hoµng Siªu", 2},
		{510 , "B¹ch Kú Chñ §Þa", "B¹ch Kú Chñ B¹ch L¨ng Tiªu", 2},
		{100 , "L«i Th­êng Chñ §Þa", "L«i §­êng Chñ Ph­¬ng Ch©u", 3},
		{100 , "Háa §­êng Chñ §Þa",   "Háa §­êng Chñ TiÒn ChÝch", 3},
		{100 , "Phong §­êng Chñ §Þa", "Phong §­êng Chñ Phong TrÇn", 3},
	},
	bossMod2 = {
		{1440, "Hång Kú Tinh §Þa", "Thiªn ¢m S¸t Thñ Tinh Anh", 1},
		{1440, "H¾c Kú Tinh §Þa", "Thiªn ¢m §¹i Tinh Anh", 1},
		{1430, "Lam Kú Tinh §Þa", "Thiªn ¢m TÝn Sø Tinh Anh", 1},
		{1430, "Hoµng Kú Tinh §Þa", "Thiªn ¢m MËt Th¸m Tinh Anh", 1},
		{1430, "B¹ch Kú Tinh §Þa",     "B¹ch Kú Tinh Anh", 1},
		{500 , "Hång Kú Chñ §Þa", "Hång Kú Chñ Hång Tinh", 2},
		{500 , "H¾c Kú Chñ §Þa", "H¾c Kú Chñ ¤ Mai Vò", 2},
		{500 , "Lam Kú Chñ §Þa", "Lam Kú Chñ Lam Èn H¹c", 2},
		{500 , "Hoµng Kú Chñ §Þa",   "Hoµng Kú Chñ Hoµng Siªu", 2},
		{500 , "B¹ch Kú Chñ §Þa", "B¹ch Kú Chñ B¹ch L¨ng Tiªu", 2},
		{100 , "L«i Th­êng Chñ §Þa", "L«i §­êng Chñ Ph­¬ng Ch©u", 3},
		{100 , "Háa §­êng Chñ §Þa",   "Háa §­êng Chñ TiÒn ChÝch", 3},
		{100 , "Phong §­êng Chñ §Þa", "Phong §­êng Chñ Phong TrÇn", 3},
		{15 ,  "UyÓn Nhu V©n §Þa",       "UyÓn Nhu V©n", 4},
		{15 ,  "UyÓn Thanh Nhi §Þa",       "UyÓn Thanh Nhi", 4},
	},
	bossMod3 = {
		{25 ,  "UyÓn Nhu V©n §Þa",       "UyÓn Nhu V©n", 4},
		{25 ,  "UyÓn Thanh Nhi §Þa",       "UyÓn Thanh Nhi", 4},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStageXX:onInit()
	g_theMS.msCamp[1]:turnPlayer(SetPos,self.resetPos[1], self.resetPos[2]);
	tStageBase:onInit();
	g_theMS:SetMissionV(MV_BOSS_COUNT, 0);
	stageAction("p0");
end

function tStageXX:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	if npcMod[3] then
		SetNpcLifeTime(npc, npcMod[3]);
	end
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStageXX:createBoss()
	bossMod = self.bossMod;
--	if GetTask(TASKID_DXG_SCORE) >= 400 then
--		bossMod = self.bossMod3;
	if GetTask(TASKID_DXG_SCORE) >= 50 then
		bossMod = self.bossMod2;
	end
	local npcMod = gf_RandRate(bossMod);
	local npc = CreateNpc(npcMod[2], npcMod[3], self:GetPos(2));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampEnemy);
	SetMissionV(MV_SP_BOSS_LV, npcMod[4]);
	if npcMod[4] == 4 then
		SetTask(TASKID_DXG_SCORE, 0, TASK_ACCESS_CODE_DXG_MISSION);
	end
	return npc;
end

function tStageXX:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStageXX:onTimerOver()
	g_theMS:Close()
end
tStageXX.rule["timerover"] = tStageXX.onTimerOver;

function tStageXX:giveAward(nNpcIdx, nBossCount)
	local bossLv = GetMissionV(MV_SP_BOSS_LV);
	local m, x, y = GetNpcWorldPos(nNpcIdx);

	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT);
	if nBossCount == 4 then --µÚ°Ë¹Ø
		create_dxg_box_gold(nNpcIdx, 2)
	else
    	for i = 1, 4 do
    		create_box_yin(m,x,y,3+nBossCount)
--    		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--    		local npcMod = self.npcMod[2];
--    		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--    		if npcMod[3] then
--    			SetNpcLifeTime(npc, npcMod[3]);
--    		end
--    		SetNpcScript(npc, g_theMS.Box2);
--    		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
    	end
	end
	create_box_tong(nNpcIdx, 3+nBossCount) --ÌìÒõÃÜÏä±äÍ­±¦Ïä
--	for i = 1, 1 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[3];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
	for i = 1, 1 do
		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
		local npcMod = self.npcMod[4];
		local npcName = {
			"Tinh Anh B¶o R­¬ng",
			"Ngò Kú B¶o R­¬ng",
			"Tam §­êng B¶o R­¬ng",
			"Ng­ng NguyÖt B¶o R­¬ng",
		};
		npcName = npcName[bossLv];
		local npc = CreateNpc(npcMod[1], npcName, m, x2, y2);
		if npcMod[3] then
			SetNpcLifeTime(npc, npcMod[3]);
		end
		SetNpcScript(npc, g_theMS.Box3);
	end
--	--ÌìÒõ¾«Á¦Ïä
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[5];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = floor(lv * lv * 70 * 1.3);
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS3) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS3, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--	end
		giveStageExpAward
	)
	
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_47);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 1);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 3+nBossCount)
end

-------µÈ´ý¿ªÆô½×¶Î------------------------------------------------------
function phasexx_1:onInit()
	reviveAll();
	g_theMS.msTimer:setInterval(self.stepInterval);
	getStage():createChar(1)
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage, "H¹n chÕ më cöa ¶i", 180, 0)
	g_theMS:Msg2MSAll("Minh Gi¸o Th¸m Tö d­êng nh­ n¾m b¾t mäi th«ng tin, cã thÓ th¨m dß!");
end

function phasexx_1:onTimer(nStep)
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

function phasexx_1:onTalk(npcIdx)
	local tSel = {
		"Truy t×m KÎ Chñ M­u (Tiªu hao 1 Thiªn Kiªu LÖnh)/perStart",
		"KiÓm tra danh s¸ch Mé HËu Chñ Sø/info_xx",
		"H«m nay ®Õn ®©y, h«m sau ph­¬ng tr­ëng/perEnd",
		"KÕt thóc ®èi tho¹i/nothing",
	}
	if not isCaption() then
		tremove(tSel,3);
	end
	Say("§¸m Minh Gi¸o Th¸m Tö: §¹i ©n bÊt ng«n t¹, sù tÝch c¸c vÞ ®¸nh tan §Þa HuyÒn Cung sÏ ®­îc d©n gian truyÒn tông! Sö dông Th«ng Thiªn LÖnh ®Ó dÉn ra cµng nhiÒu Chñ Sø!", getn(tSel), tSel);
end
function info_xx()
	Talk(1, "", "Minh Gi¸o Th¸m Tö: Danh s¸ch Mé Hëu Chñ Sø §Þa HuyÒn Cung d­íi ®©y: \n UyÓn Nhu V©n, UyÓn Thanh Nhi, L«i §­êng Chñ Ph­¬ng §øc Ch©u, Háa §­êng Chñ TiÒn ChÝch, Phong §­êng Chñ Phong M·n TrÇn \n Hång Kú Chñ Hång Tr­êng Tinh, H¾c Kú Chñ ¤ Mai Vò, Lam Kú Chñ Lam ¢n H¹c, Hoµng Kú Chñ Hoµng Siªu, b¹ch Kú Chñ B¹ch L¨ng Tiªu \n Thiªn ¢m S¸t Thñ Tinh Anh, Thiªn ¢m ThÝch Kh¸ch Tinh Anh, Thiªn ¢m TÝn Sø Tinh Anh, Thiªn ¢m MËt Th¸m Tinh Anh, B¹ch Kú Tinh Anh")
end

function perStart()
	if GetMissionV(MV_SP_DAYE) ~= 0 then
		g_theMS:Msg2MSAll("Kh«ng thÓ më ¶i tiÕp theo, h·y lÊy b¶o r­¬ng tr­íc");
		return
	end
	
	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT);
	if nBossCount >= 4 then
		Talk(1,"","C¸c h¹ ®· khiªu chiÕn hoµn thµnh 4 §Þa HuyÒn Cung Mé HËu Chñ Sø, kÕt thóc ¶i!");
		return 0;
	end
	
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(5 + nBossCount)

	if GetMissionV(MV_PHASE) == 1 then
		if GetItemCount(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3]) < N_CALL_BOSS_TIANJIAOLING_NEED then
			Msg2Player(format("Trªn ng­êi kh«ng cã %d c¸i %s",N_CALL_BOSS_TIANJIAOLING_NEED, T_TIANJIAOLING[4]));
			return
		end
		if DelItem(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED) ~= 1 then return end
		SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + N_CALL_BOSS_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);
		SetMissionV(MV_SP_DAYE, PlayerIndex);
		stageAction('p1');
		for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
			SetMissionV(i, 0);
		end
		
		remove_tong_box()
    	remove_yin_box()
    	remove_box_gold()
		
		--ËÑË÷µØÐþ¹¬Ä»ºóºÚÊÖ´ÎÊýÍ³¼Æ
		AddRuntimeStat(1,12,0,1);
		--µØÐþ¹¬ÏûºÄÍ¨ÌìÁîÅÆÊýÁ¿Í³¼Æ
		AddRuntimeStat(1,13,0,N_CALL_BOSS_TIANJIAOLING_NEED);
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED})
	end
end
function perEnd()
	if not isCaption() then
		Msg2Player("ChØ cã ®éi tr­ëng dÉn d¾t tæ ®éi rêi khái cöa ¶i");
	end
	
	if GetMissionV(MV_SP_DAYE) ~= 0 then
		perEnd_Talk();
		return
	end

	if GetMissionV(MV_PHASE) == 1 then
		g_theMS:action("missionfinish")
	end
end

function perEnd_Talk()
	Say("Cßn cã b¶o r­¬ng ch­a nhËn, c¸c h¹ x¸c nhËn kÕt thóc v­ît ¶i kh«ng?", 2, "§ång ý/perEnd2", "T¹i h¹ chØ xem qua th«i/do_nothing")
end

function perEnd2()
	if not isCaption() then
		Msg2Player("ChØ cã ®éi tr­ëng dÉn d¾t tæ ®éi rêi khái cöa ¶i");
	end
	
	if GetMissionV(MV_PHASE) == 1 then
		g_theMS:action("missionfinish")
	end
end

function phasexx_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------É±¹Ö½×¶Î-------------------------------------------------
function phasexx_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage,-2);
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr­ît thêi gian", self.stepLimit, 0);
	getStage():createBoss();

end

function phasexx_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		self:finish()
		return
	end
end

function phasexx_2:finish()
	getStage():action("p2");
end

function phasexx_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--Ã¿ÈÕÈÎÎñ-É±¹Ö
	local npcName = GetNpcName(npcIdx);

	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
	g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -2);
	getStage():giveAward(npcIdx, nBossCount);

	stageAction('p0');
	
	if 4 == nBossCount then
		g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 2, npcIdx);--Ã¿ÈÕÈÎÎñ-È«²¿Í¨¹Ø
		--È«Í¨×ÜÈËÊýÍ³¼Æ
		AddRuntimeStat(1,3,0,gf_GetTeamSize());
		--È«Í¨´ÎÊýÍ³¼Æ
		AddRuntimeStat(1,9,0,1);
		
		--µØÐþ¹¬Í¨7¹Ø
		g_theMS.msCamp[1]:turnPlayer(_vc_DXG_Pass_7, 0);
	end
end
function phasexx_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------±¾¹Ø½áÊø----------------------------------------------------
function phasexx_3:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Qua næ lùc hÕt m×nh, c¸c ng­¬i ®· v­ît qua ®­îc §Þa HuyÒn Cung, ")
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage, "Rêi cöa ¶i", 60, 0);

	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
end

function phasexx_3:onTimer(nStep)
	g_theMS:action("missionfinish")
end

--------------------------------------------------------------------

tStageXX = gf_CopyInherit(tStageBase, tStageXX);
