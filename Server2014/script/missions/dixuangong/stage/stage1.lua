--------------------------------------------------------------------
-- µØÐþ¹¬ µÚ1¹Ø
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
--Include("\\script\\master_prentice\\master_prentice_point.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phase1_1 = gf_CopyInherit(tPhaseBase, {
--})

phase1_1 = {
	stepInterval = 1,
	stepLimit = 10,
};
phase1_2 = {
	stepInterval = 50,
	stepLimit = 450,
};
phase1_3 = {
	stepInterval = 1,
	stepLimit = 180,
};

--------------------------------------------------------------------
tStage1 = {
	tPhases = {
		phase1_1,
		phase1_2,
		phase1_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1632, 3275},
		{1660, 3241},
		{1653, 3248},
		{1660, 3241},
		{1653, 3248},
		{1648, 3244},
		{1660, 3254},
		{1634, 3271},
		{1629, 3266},
		{1634, 3271},
		{1660, 3240},
		{1661, 3243},
	},
	resetPos = {1644, 3257},
	npcMod = {
		{"Minh Gi¸o Th¸m Tù §Þa", "Minh Gi¸o Th¸m Tö"},
		{"Thiªn ¢m Ph¸p S­ §Þa", "Thiªn ¢m  ThÇy Mo"},
		{"Thiªn ¢m Béi Gi¸o1", "Thiªn ¢m Béi Gi¸o", 10},
		{"yinbaoxiang", "R­¬ng B¹c", 180},
		{"tongbaoxiang", "R­¬ng §ång", 180},

		{"Thiªn Qu©n §Þa", "Thiªn Qu©n", },
		{"V¹n M· §Þa", "V¹n M·", },

		{"Nam Cung V·n V·n §Þa", "Nam Cung V·n V·n"},
		{"Nam Cung Tö Quyªn §Þa", "Nam Cung Tö Quyªn"},

		{"L©m Xung §Þa","B¸o Tö §Çu L©m Xung"},

		{"LiÔu Hiªn §Þa", "Nga My LiÔu Hiªn"},
		{"L­u Nh­ Phong §Þa", "Vâ §ang L­u Nh­ Phong"},
		--{"Ïä×ÓÇ®", "ÌìÒõ¾«Á¦Ïä", 180},
	},
}

--------------------------------------------------------------------
function tStage1:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage1:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npcIdx = CreateNpc(npcMod[1], npcMod[2], self:GetPos(nId));
	SetNpcScript(npcIdx, g_theMS.fileName);
	if npcMod[3] then
		SetNpcLifeTime(npcIdx, npcMod[3]);
	end
	SetCampToNpc(npcIdx, CampEnemy);
	return npcIdx;
end

function tStage1:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage1:onTimerOver()
	g_theMS:Close()
end
tStage1.rule["timerover"] = tStage1.onTimerOver;

function tStage1:giveAward(nNpcIdx, nBossCount)
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	--ÌìÒõÊ¥ÎïÏä3¸ö
	for i = 1, 4 do
		create_box_yin(m,x,y,1)
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[4];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
	end
	create_box_tong(nNpcIdx, 1) --ÌìÒõÃÜÏä±äÍ­±¦Ïä
	--ÌìÒõÃÜÏä1¸ö
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[5];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box1);
--	--ÌìÒõ¾«Á¦Ïä
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[13];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	--¾­Ñé£ºµÈ¼¶µÄÆ½·½*40
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = lv * lv * 40;
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS1) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS1, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--		end
		giveStageExpAward
	)
	--¶îÍâ½±Àø£ºÌìÒõÃÜÏä1¸ö£¬¾­ÑéµÈ¼¶µÄÆ½·½*30
	local nFlag = GetMissionV(MV_L1_SPE_FLAG);
	local nLv = floor(nFlag / 10);
	nFlag = mod(nFlag, 10);
	if nFlag > 0 then
		g_theMS.msCamp[1]:turnPlayer(function ()
			local level = GetLevel();
			local nExp = floor(level * level * 30 / 2 * %nFlag);
			ModifyExp(nExp);
			local msg = {
				"§¸nh b¹i Thiªn Qu©n, V·n M·, sÏ nhËn ®­îc phÇn th­ëng %d ®iÓm kinh nghiÖm v­ît møc.",
				"§¸nh b¹i TuyÖt TrÇn Song HiÖp, sÏ nhËn ®­îc phÇn th­ëng %d ®iÓm kinh nghiÖm v­ît møc.",
				"Hé gi¸ L©m Xung, sÏ nhËn ®­îc phÇn th­ëng %d ®iÓm kinh nghiÖm v­ît møc.",
			}
			msg = msg[%nLv];
			Msg2Player(format(msg, nExp));
		end)
	else
		local msg = {
			"Kh«ng thÓ ®¸nh b¹i Thiªn Qu©n V¹n M· kh«ng cã phÇn th­ëng v­ît møc.",
			"Kh«ng thÓ ®¸nh b¹i TuyÖt TrÇn Song HiÖp kh«ng cã phÇn th­ëng v­ît møc.",
			"Kh«ng thÓ hé gi¸ L©m Xung kh«ng cã phÇn th­ëng v­ît møc.",
		}
		msg = msg[nLv];
		g_theMS:Msg2MSAll(msg);
	end
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 1)
end

function tStage1:event1()
	local npc = findNpc("Thiªn ¢m  ThÇy Mo");
	NpcChat(npc, "NhÊt chi xuyªn v©n tiÔn, Thiªn Qu©n V¹n M· ®Õn nghªnh chiÕn nµo!");
	local npc1 = self:createChar(7);
	NpcChat(npc1, "Ai ®¸nh huynh ®Ö cña ta!");
	local npc2 = self:createChar(6);
	NpcChat(npc2, "Lµ ai h¶, cã ph¶i ng­¬i kh«ng h¶ ?");
	g_theMS:Msg2MSAll("Qu©n ®Þch tiÕp viÖn, tr­íc khi qua ¶i ph¶i tiªu diÖt hÕt Thiªn Qu©n V¹n M· sÏ cã phÇn th­ëng v­ît møc");
	SetMissionV(MV_L1_SPE_FLAG, 10);
end
function tStage1:event2()
	local npc = findNpc("Thiªn ¢m  ThÇy Mo");
	NpcChat(npc, "H¶? ! Th¸m tö nãi qu¶ nhiªn kh«ng sai, hai c« g¸i mÆc b¹ch y bªn kia rÊt tuyÖt víi ta, h©y h©y! ");
	local npc1 = self:createChar(8);
	NpcChat(npc1, "TØ TØ µ, c¸i l·o giµ thói chÕt tiÖt kia nh×n chóng ta nhá d·i ra råi k×a!");
	SetCampToNpc(npc1, CampNeutral);
	local npc2 = self:createChar(9);
	SetCampToNpc(npc2, CampNeutral);
	local players = g_theMS.msCamp[1].players;
	PlayerIndex = randomin(players);
	NpcChat(npc2, format("Tªn nµy %s h×nh nh­ ®· tõng øc hiÕp chóng ta ®Êy! LÇn nµy ta nhÊt ®Þnh b¸o thï!", GetName()));
	g_theMS:Msg2MSAll("TuyÖt TrÇn Song HiÖp ®Õn ®¶o lo¹n, tr­íc khi qua ¶i ®¸nh b¹i TuyÖt TrÇn Song HiÖp sÏ cã phÇn th­ëng v­ît møc");
	SetMissionV(MV_L1_SPE_FLAG, 20);
end
function tStage1:event3()
	local npc = findNpc("Thiªn ¢m  ThÇy Mo");
	NpcChat(npc, "§óng lµ mét nh©n vËt kþ m· anh hïng! C¸c h¹ lµ ai ®ã hö?");
	local npc = self:createChar(10);
	SetCampToNpc(npc, CampPlayer);
	NpcChat(npc, "Nghe nãi n¬i ®©y cÈn mËt v« cïng, Tèng Ca ca ®Æc mÖnh cho ta ®Õn ®©y tham dß, qu¶ nhiªn nh­ lêi ®ån, tiÕp chiªu ®©y!");
	g_theMS:Msg2MSAll("L©m Xung ®Õn t­¬ng trî, hé gi¸ L©m Xung sÏ cã phÇn th­ëng v­ît møc");
	SetMissionV(MV_L1_SPE_FLAG, 32);
end

-------µÈ´ý¿ªÆô½×¶Î------------------------------------------------------
function phase1_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr­ît thêi gian", 460, 0);
--	stageAction("p1");
--	g_theMS:Msg2MSAll("ÄãµÄ¶ÓÎéÒÑ¾­½øÈëµØÐþ¹¬Ç°µî£¬¶Ó³¤Óë±»×¥µÄÌìÒõ½ÌÍ½¶Ô»°¿É¿ªÆô¹Ø¿¨¡£");
end

function phase1_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		local npc = getStage():createChar(2);
		g_NpcAI:setAI(npc, AT_SM_ATTACK);
		g_NpcAI:setWayPoint(npc, {{1644, 3257}});
		NpcChat(npc, "To gan l¸o toÐt, d¸m ®Õn §Þa HuyÒn Cung lµm lo¹n sao!");
	elseif nStep == 6 then
		local tRate = {
			{40, tStage1.event1},
			{40, tStage1.event2},
			{20, tStage1.event3},
		}
		gf_RandRate(tRate)[2](tStage1);
	end

end

function phase1_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
--	SetMissionV(MV_DXG_STAGE_CNT, 1)
	local tSel = {
		"Nhanh nhanh gäi chñ cña c¸c ng­¬i ra ®©y/#onStageAction('p1')",
		"§Þa HuyÒn Cung nµy cã huyÒn c¬ g× ®©y/info1_1",
		"KÕt thóc ®èi tho¹i/nothing"
	}
	Say("Minh Gi¸o Th¸m Tö: Xin ®õng h¹i ta, ta sÏ chiÕu theo lêi cña ng­êi nãi ®Ó lµm theo.", getn(tSel), tSel);
end
function onStageAction(szAct)
	remove_tong_box()
	remove_yin_box()
	stageAction(szAct)
end
function info1_1()
	Talk(1, "", "Thiªn ¢m Gi¸o §å bÞ b¾t: t¹i TiÒn §iÖn do mÊy Thiªm ¢m Ph¸p S­ canh g¸c. §¸nh b¹i Thiªn ¢m Ph¸p S­ sÏ cã c¬ héi nhËn ®­îc R­¬ng Thiªn ¢m Th¸nh VËt hoÆc Thiªn ¢m MËt R­¬ng.");
end
function phase1_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
function phase1_1:onNpcDeath(npcIdx)
	phase1_2:onNpcDeath(npcIdx)
end


--------É±¹Ö½×¶Î-------------------------------------------------
function phase1_2:onInit()
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
end

function phase1_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		self:finish()
		return
	end
end
function phase1_2:finish()
	g_theMS:action('missionfinish');
end

function phase1_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--Ã¿ÈÕÈÎÎñ-É±¹Ö
	local npcName = GetNpcName(npcIdx);
	if npcName == "Thiªn ¢m  ThÇy Mo" then
		ClearMapNpc(g_theMS:getMapId(), nil);
		local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
		g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
		getStage():giveAward(npcIdx, nBossCount);
		stageAction("p2");
	elseif npcName == "Thiªn Qu©n" or npcName == "V¹n M·" or npcName == "Nam Cung V·n V·n" or npcName == "Nam Cung Tö Quyªn" then
		SetMissionV(MV_L1_SPE_FLAG, GetMissionV(MV_L1_SPE_FLAG) + 1);
	elseif npcName == "B¸o Tö §Çu L©m Xung" then
		SetMissionV(MV_L1_SPE_FLAG, GetMissionV(MV_L1_SPE_FLAG) - 2);
	end
end

function phase1_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------±¾¹Ø½áÊø----------------------------------------------------
function phase1_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 1);
	--ds_DXG:AddStatValue(1,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Tr¶i qua mét trËn chiÕn lo¹n, Thiªn ¢m Ph¸p S­ ®· bÞ c¸c ng­¬i ®¸nh b¹i råi.");
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
end

function phase1_3:onTimer(nStep)
	if nStep > self.stepLimit then
--		stageAction('missionfinish');
		return
	end
	if nStep == 1 then
		local npc = getStage():createChar(11);
		SetCampToNpc(npc, CampPlayer);
		local npc2 = getStage():createChar(12);
		SetCampToNpc(npc2, CampPlayer);
		SetNpcLifeTime(npc2, 60);
	elseif nStep == 2 then
		local npc2 = findNpc("Vâ §ang L­u Nh­ Phong");
		NpcCommand(npc2, NPCCOMMAND.do_beatdown, 8, 3 * 18);
		NpcChat(npc2, "Muéi Muéi h·y nhanh trèn ®i, nhanh lªn !");
		AddUnitStates(npc2, 8, -1000);
		local npc = findNpc("Nga My LiÔu Hiªn");
		SetNpcActivator(npc);
		NpcChat(npc, "Muéi kh«ng ®i, c¸c tØ muéi cßn ë bªn trong ®ã! Høt høt.......");
		NpcCommand(npc, NPCCOMMAND.do_beatdown, 8, 3 * 18);
	elseif nStep == 5 then
		local npc2 = findNpc("Vâ §ang L­u Nh­ Phong");
		if random(100) < 5 then
			NpcChat(npc2, "¤i ~~~ta l¹i …(v× sao l¹i nãi ?!)");
		end
		Death(1, npc2);
	elseif nStep == 6 then
		local npc = findNpc("Nga My LiÔu Hiªn");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "C¸c vÞ ®¹i hiÖp, c¸c cao thñ cña c¸c ®¹i m«n ph¸i ®ang bÞ giam cÇm trong §Þa HuyÒn Cung, vÉn ®ang chê giang hå ®¹i hiÖp cøu gióp!");
		SetNpcScript(npc, g_theMS.fileName);
		g_theMS:Msg2MSAll("H·y ®èi tho¹i víi Nga Mi LiÔu Hiªn");
	end
end

function phase1_3:onTalk()
	local npc = GetTargetNpc();
	local tSel = {
		"Ta ®îi ng­¬i ®Õn cøu ng­êi/p13_gogogo",
		"Th¨m dß t×nh h×nh/p13_next_info",
		"KÕt thóc ®èi tho¹i/nothing",
	}
	if not isCaption() then
		tremove(tSel, 1);
	end
	Say("<color=green> Nga Mi LiÔu Hiªn <color>: høc hu hu, tØ muéi téi nghiÖp cña ta~", getn(tSel), tSel);
end

function p13_next_info()
	Talk(1, "", "Trong phßng cã rÊt nhiÒu TuyÒn Cø, rÊt nhiÒu tØ muéi ®ång m«n trong ®ã chÞu khæ. Bªn trong cßn cã tªn cai ngôc gian ¸c, nhanh nhanh gióp chóng t«i! Nªn nhí, khi cai ngôc chÕt ®i th× toµn bé c¬ quan sÏ ph¸t ®éng, tÊt c¶ c¸c nh©n sÜ vâ l©m sÏ bÞ giam cÇm mµ chÕt!");
end

function p13_gogogo()
	g_theMS:action("s2")
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
	setCurStage(2)
	remove_tong_box()
	remove_yin_box()
	remove_box_gold()
end

function phase1_3:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
--------------------------------------------------------------------

tStage1 = gf_CopyInherit(tStageBase, tStage1);
