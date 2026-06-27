Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\missions\\nvn\\battle\\battle_head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\misc\\globaldatasync.lua")
Include("\\settings\\static_script\\global\\merit.lua")

SCRIPT_3V3_MASTER = "\\script\\missions\\nvn\\3v3.lua";

--======================================================================================
-- ×¼±¸½×¶Î
phaseTeamFight_idle = {
	maxsecond = 1,
--	DEBUG=1,
}
phaseTeamFight_idle = inherit(cycPhase, phaseTeamFight_idle)
phaseTeamFight_idle.onTimeout = phaseTeamFight_idle.onFinish;

phaseTeamFight_waiting = {
	maxsecond = 30,
	guage = {
		msg = "§îi më",
		time = 30,
		cyc = 0,
		id = 1,
	},
--	DEBUG = 1,
}

phaseTeamFight_waiting.triggers = {
	Trap = {{action = function (self, event, id)
			local m = this.msPosition:getMapID();
			local templateMap = this.msPosition:getTemplateMapID()
			local tPos = this.Trap[templateMap][id];
			if not tPos then return end
			NewWorld(m, tPos[1], tPos[2]);
		end
	}}
}
phaseTeamFight_waiting = inherit(cycPhase, phaseTeamFight_waiting)
phaseTeamFight_waiting.onTimeout = phaseTeamFight_waiting.onFinish;

function phaseTeamFight_waiting.Init()
--	this.msCamp:turnPlayer(0, AddGodState, g_tGodState);
	if HasFo(1) ~= 1 then
		this.msCamp:turnPlayer(1, AddGodState, g_tGodState2);
	end
	if HasFo(2) ~= 1 then
		this.msCamp:turnPlayer(2, AddGodState, g_tGodState2);
	end
	this:Msg2MSAll("ChuÈn bÞ chiÕn ®Êu, sau 30 gi©y sÏ b¾t ®Çu");
	this.msCamp:turnPlayer(0, setPlayer2Viewer);
	this.msCamp:turnPlayer(0, openWnd, 0);
	this.msCamp:turnPlayer(0, SetTaskTemp, TEMP_TASKID_3V3_KILLED, 0);
	this.msCamp:turnPlayer(0, SetTaskTemp, TEMP_TASKID_3V3_IS_DEAD, 0);
	this:CreateTrap();
	--½øÈ¥¾ÍÕ½¶·×´Ì¬
	this.msCamp:turnPlayer(1, setPlayer2Fighter);
	this.msCamp:turnPlayer(2, setPlayer2Fighter);
end

function phaseTeamFight_waiting.ShowMsg()
--	this:Msg2MSAll("¶ÔÊÖÐÅÏ¢, @#$$^%#$");
	this.msCamp:turnPlayer(1, setPlayer2Fighter);
	this.msCamp:turnPlayer(2, setPlayer2Fighter);
end
function phaseTeamFight_waiting.ShowStart()
	this.msCamp:turnPlayer(0, SendScript2Client, [[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\ÆäËû\\Õ½¶·¿ªÊ¼_Ô½ÄÏ.3e",1000*2,0.7)]])
	this.msCamp:turnPlayer(0, RestoreAll);
end

phaseTeamFight_waiting.actions = {
	[1] = phaseTeamFight_waiting.Init,
	[5] = phaseTeamFight_waiting.ShowMsg,
	[29] = phaseTeamFight_waiting.ShowStart,
}

---------------------------------------------------------------------
-- Õ½¶·½×¶Î
phaseTeamFight_fighting = phaseBase({
	maxsecond = 4 * 60,
	guage = {
		msg = "TiÕn ®é chiÕn ®Êu",
		time = 4 * 60,
		cyc = 0,
		id = 1,
	},
--	DEBUG = 1,
})

function phaseTeamFight_fighting:onInit(father)
	phaseBase.onInit(self, father)
	this.msCamp:turnPlayer(1, setPlayer2Fighter);
	this.msCamp:turnPlayer(2, setPlayer2Fighter);
end

function phaseTeamFight_fighting:onTimer()
	if 1 == phaseBase.onTimer(self) then return end
--	DebugOutput("FightState--->", GetMissionV(MV_TEAM_ALIVE_1), GetMissionV(MV_TEAM_ALIVE_2));
	if GetMissionV(MV_TEAM_ALIVE_1) < 1 then
		if GetMissionV(MV_TEAM_ALIVE_2) < 1 then
			SetMissionV(MV_BATTLE_RESULT, 3);
			return self:onFinish();
		else
			SetMissionV(MV_BATTLE_RESULT, 2);
			return self:onFinish(2);
		end
	elseif GetMissionV(MV_TEAM_ALIVE_2) < 1 then
		SetMissionV(MV_BATTLE_RESULT, 1);
		return self:onFinish(1);
	end
end
function phaseTeamFight_fighting:onPlayerDeath(event, killId)
	for nCamp = 1, 2 do
		for mv = mi[nCamp], ma[nCamp] do
			if PlayerIndex == GetMissionV(mv) then
				this:Msg2MSAll(format("[%s] ng­êi ch¬i [%s] bÞ [%s] ®¸nh b¹i!", CampName[nCamp],GetName(),GetName(killId)));
				SetMissionV(mv, 0);
				SetMissionV(MV_TEAM_ALIVE[nCamp], GetMissionV(MV_TEAM_ALIVE[nCamp]) - 1);
				RevivePlayer(0);
				setPlayer2Viewer();
				DesaltPlayer(1, 10);
				SetTaskTemp(TEMP_TASKID_3V3_IS_DEAD, 1);
				gf_ModifyTask(TASKID_3V3_DEAD_DAILY, 1);
				gf_ModifyTask(TASKID_3V3_DEAD_MATCH, 1);
				gf_ModifyTask(TASKID_3V3_DEAD_TOTAL, 1);
				local oldPidx = PlayerIndex
				PlayerIndex = killId
				SetTaskTemp(TEMP_TASKID_3V3_KILLED, GetTaskTemp(TEMP_TASKID_3V3_KILLED) + 1);
				gf_ModifyTask(TASKID_3V3_KILL_DAILY, 1);
				gf_ModifyTask(TASKID_3V3_KILL_MATCH, 1);
				gf_ModifyTask(TASKID_3V3_KILL_TOTAL, 1);
				PlayerIndex = oldPidx;
				return 1;
			end
		end
	end
end
function phaseTeamFight_fighting:onTimeout()
	return self:onFinish();
end

function checkTeamBattleResult()
	local damage = {0, 0}
	for i = 1, 2 do
		local tPlayer = this.msCamp:reflash(i);
		for n = 1, getn(tPlayer) do
			PlayerIndex = tPlayer[n]
			damage[i] = damage[i] + GetToPlayerDamage();
		end
	end
	if damage[1] > damage[2] then
		return 1;
	elseif damage[1] < damage[2] then
		return 2;
	else
		return random(1,2);
	end
	StatLog("3v3_TimerOut", 1);
end

function phaseTeamFight_fighting:onFinish(result)
	if not result then
		result = checkTeamBattleResult();
	end
	SetMissionV(MV_MISSION_STATUS, 1);
	phaseBase.onFinish(self)
	if result == 0 then
		this:Msg2MSAll("Hai bªn hßa");
		return
	elseif result == 1 then
		this:Msg2MSAll(CampName[1].."ChiÕn th¾ng!");
	else
		this:Msg2MSAll(CampName[2].."ChiÕn th¾ng!");
	end
	missionAward(result)
	if self.second < 60 then
		StatLog("3v3_halfend", 1);
	end
end

phaseTeamFight_fighting.triggers = {
	PlayerDeath = {
		{action = phaseTeamFight_fighting.onPlayerDeath,},
	},
}

---------------------------------------------------------------------
-- ½áÊø½×¶Î

phaseTeamFight_ending = phaseBase({
	maxsecond = 5,
	guage = {
		msg = "Thêi gian rêi khái",
		time = 5,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
})

function phaseTeamFight_ending:onInit(father)
	phaseBase.onInit(self, father)
	this.msCamp:turnPlayer(0, setPlayer2Viewer);
end

function phaseTeamFight_ending:onTimeout()
	this:Close();
end
---------------------------------------------------------------------
phaseTeamFight = {
	phases = {
		phaseTeamFight_idle,
		phaseTeamFight_waiting,
		phaseTeamFight_fighting,
		phaseTeamFight_ending,
	},
	maxsecond = 4 * 60 + 5 + 30,
	timerID = 95,
}
phaseTeamFight = inherit(phaseBase, phaseTeamFight)

--=====================================================================
BattleMission_TeamFight = inherit(missionBase, BattleMission_TeamFight)

function BattleMission_TeamFight:Close()
	--NvnRoom_EndBattle(GetMissionV(MV_ROOM_ID));
	this.msCamp:turnPlayer(0, openWnd, 1);
	missionBase.Close(self);
end

BattleMission_TeamFight.msOption.OnPlayerJoin = function(self, nCamp)
	if nCamp == 3 then
		DesaltPlayer(1, 10);
		return
	end
	local nCount = GetMissionV(MV_TEAM_ALIVE[nCamp]) + 1;
	SetMissionV(MV_TEAM_ALIVE[nCamp], nCount);
	local mv = MV_TEAM_PIDX + (nCount - 1) + (nCamp - 1) * MAX_TEAM_PLAYER
	SetMissionV(mv, PlayerIndex);
	ResetToPlayerDamage();
	ClearColdDown();	--Çå³ýËùÓÐÒ©CD
	RemvoeTempEffect();	--Çå³ýËùÓÐÁÙÊ±×´Ì¬
	ClearStolenSkill();	--Çå³ýÒÑÍµÈ¡µÄ¼¼ÄÜ£¬Õë¶Ô¹÷×Ó
	CastState("imme_clear_skill_interval",-1,0);	--Ïû³ýËùÓÐ¼¼ÄÜµÄÀäÈ´Ê±¼ä
	SetPlayerRestrictions(2,1);	--ÉèÖÃ³ÆºÅÊôÐÔÎÞÐ§
	SetLockCurTitle(0);	--²»¿É¸ü»»³ÆºÅ
	SetPlayerRestrictions(1,1);	--ÏÞÖÆÄ³Ð©×°±¸ÉÏµÄÊôÐÔ
	--BWT_RemoveNonlicetState();
	KillFollower();
	StatLog("3v3_Enter", GetPlayerRoute(), 1);
end

BattleMission_TeamFight.msOption.OnPlayerLeave = function(self, nCamp)
	DesaltPlayer(0);
	if GetMissionV(MV_MISSION_TYPE) == 2 then
--		P3v3_Enter();
	else
		SendScript2Client("Open('nvnRoom',1)");
	end
	CleanGodState(g_tGodState);
	CleanGodState(g_tGodState2);
	if GetMissionV(MV_BATTLE_RESULT) == 0 then
		for nCamp = 1, 2 do
			for mv = mi[nCamp], ma[nCamp] do
				if GetMissionV(mv) == PlayerIndex then
					this:Msg2MSAll(format("%s rêi khái ®Êu tr­êng!",GetName()));
					SetMissionV(mv, 0);
					SetMissionV(MV_TEAM_ALIVE[nCamp], GetMissionV(MV_TEAM_ALIVE[nCamp]) - 1);
					gf_ModifyTask(TASKID_3V3_ESCAPE_DAILY, 1);
					gf_ModifyTask(TASKID_3V3_ESCAPE_MATCH, 1);
					gf_ModifyTask(TASKID_3V3_ESCAPE_TOTAL, 1);
					SendScript2VM(SCRIPT_3V3_MASTER,"lockEquipment(0)");
					return
				end
			end
		end
	end
end

BattleMission_TeamFight.msPhases = {
	phaseTeamFight,
}

BattleMission_TeamFight.msPosition.entryPos = {
--	[6066] = {{1554,3193},{1641,3196}, {1599,3252}},     --¸ê±Ú»ÄÄ®
	[6067] = {{1538,3250},{1595,3190}, {1561,3217}},     --»ªÉ½Ö®áÛ
	[6068] = {{1537,3302},{1649,3177}, {1594,3243}},     --×Ï½û»Ê³Ç
	[6069] = {{1574,3234},{1625,3244}, {1599,3239}},     --ÍþÎä´óÀÞ
	[6070] = {{1620,3245},{1595,3211}},
	[6071] = {{1592,3214},{1633,3255}},
	[6072] = {{1587,3220},{1663,3130}},
}
BattleMission_TeamFight.msPosition.getEntryPos = function(self, nCamp)
	local pos = self.entryPos[self:getTemplateMapID()];
	if type(pos[1]) == "table" then
		pos = pos[nCamp] or pos[1];
	end
	return self:getMapID(), gf_UnPack(pos);
end

BattleMission_TeamFight.msPosition.exitPos = {
	{8000,1427,2697},
	{8000,1400,2727},
	{8000,1371,2700},
	{8000,1346,2659},
	{8000,1316,2689},
	{8000,1305,2756},
	{8000,1264,2801},
	{8000,1168,2845},
	{8000,1284,2879},
	{8000,1294,2951},
	{8000,1347,3042},
	{8000,1417,3038},
	{8000,1374,2967},
	{8000,1439,2967},
	{8000,1429,2905},
	{8000,1355,2888},
	{8000,1471,2778},
	{8000,1511,2793},
	{8000,1572,2846},
	{8000,1609,2868},
	{8000,1495,2974},
	--{8000,1399,2847},
}
BattleMission_TeamFight.msPosition.getExitPos = function(self, nCamp)
	local pos = self.exitPos[random(getn(self.exitPos))];
	return pos[1], pos[2], pos[3];
end

BattleMission_TeamFight.Trap = {
	[6066] = {
		{1554,3193},
		{1641,3196},
		{{1544,3195},{1553,3204},{1541,3196},{1556,3208}},
		{{1651,3199},{1640,3208},{1653,3202},{1642,3212}},
		"\\script\\missions\\nvn\\trap_red.lua",
		"\\script\\missions\\nvn\\trap_blue.lua",
	},
	[6067] = {
		{1538,3250},
		{1595,3190},
		{{1537,3237},{1552,3253},{1535,3237},{1550,3255}},
		{{1598,3202},{1583,3188},{1600,3203},{1585,3187}},
		"\\script\\missions\\nvn\\trap_red.lua",
		"\\script\\missions\\nvn\\trap_blue.lua",
	},
	[6068] = {
		{1537,3302},
		{1649,3177},
		{{1549,3261},{1575,3281},{1551,3257},{1574,3286}},
		{{1635,3225},{1607,3199},{1635,3222},{1605,3199}},
		"\\script\\missions\\nvn\\trap_red.lua",
		"\\script\\missions\\nvn\\trap_blue.lua",
	},
	[6069] = {
		{1574,3234},
		{1625,3244},
		{{1568,3221},{1581,3232},{1581,3232},{1568,3249},{1571,3216},{1583,3230},{1583,3230},{1569,3250}},
		{{1629,3264},{1618,3248},{1618,3248},{1633,3231},{1627,3264},{1616,3250},{1616,3250},{1630,3230}},
		"\\script\\missions\\nvn\\trap_red.lua",
		"\\script\\missions\\nvn\\trap_blue.lua",
	},
}

function CreateTraps(tTraps)
	for _, t in tTraps do
		local tPoint = Line(t[2][1], t[2][2], t[3][1], t[3][2]);
		if tPoint then
			for i = 1, getn(tPoint) do
				AddMapTrap(t[1], tPoint[i][1] * 32, tPoint[i][2] * 32, t[4]);
			end
		end
	end
end

function BattleMission_TeamFight:CreateTrap()
	local m = this.msPosition:getMapID();
	local templateMap = this.msPosition:getTemplateMapID()
	local tTraps = this.Trap[templateMap];
	if not tTraps then return end
	for i = 1, getn(tTraps[3]), 2 do
		CreateTraps({{m,tTraps[3][i], tTraps[3][i+1], tTraps[5]}});
	end
	for i = 1, getn(tTraps[4]), 2 do
		CreateTraps({{m,tTraps[4][i], tTraps[4][i+1], tTraps[6]}});
	end
end

BattleMission_TeamFight.msOption.nInitFightState = 1;
BattleMission_TeamFight.msOption.szInitDeahScript = thisFile;
BattleMission_TeamFight.msOption.bForbitSuperSkill = 1;
BattleMission_TeamFight.msOption.bRestoreSetPkFlag = 0      --ÉèÖÃÁ·¹¦Ä£Ê½
BattleMission_TeamFight.msOption.bRestoreSetPkCamp = 0      --ÉèÖÃpkÄ£Ê½
BattleMission_TeamFight.msOption.bRestoreForbidChangePK = 0		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹×ª»»PK×´Ì¬
this = BattleMission_TeamFight;

--======================================================================================
function setPlayer2Viewer()
--	DesaltPlayer(1, 10)
	SetFightState(0)
end
function setPlayer2Fighter()
--	DesaltPlayer(0)
	SetFightState(1)
end

function OnDeath(killId)
	local playerId = NpcIdx2PIdx(killId);
	if playerId > 0 then
		killId = playerId;
	end
	DebugOutput("OnDeath", PlayerIndex, killId, GetName(), GetName(killId));
	this:onEvent("PlayerDeath", killId)
end

----ÒÆ³ý·Ç·¨µÄ×´Ì¬
--function BWT_RemoveNonlicetState()
--	local tbNonlicet =
--	{
--		[1] = {9901,9906},
--		[2] = {19801279,19801281},
--	}
--	for i=1,getn(tbNonlicet) do
--		for j=tbNonlicet[i][1],tbNonlicet[i][2] do
--			RemoveState(j);
--		end;
--	end;
--end;

function this.info(n,p)
	if not p then return end
	DebugOutput(format("Nh©n sè ®èi chiÕn hiÖn t¹i: %d vs %d  (%d)", GetMissionV(MV_TEAM_ALIVE_1), GetMissionV(MV_TEAM_ALIVE_2), n));
	local f1, f2 = GetMissionV(MV_TEAM_FIGHTER_1), GetMissionV(MV_TEAM_FIGHTER_2)
	DebugOutput(format("Ng­êi ch¬i ®èi chiÕn hiÖn t¹i: %s(%d) vs %s(%d)", GetName(f1), f1, GetName(f2), f2));

	for nCamp = 1, 2 do
		DebugOutput("§éi"..nCamp)
		for i = mi[nCamp], ma[nCamp] do
			local p = GetMissionV(i)
			DebugOutput(format("  %d : %s(%d)", i, GetName(p), p));
		end
	end

	local msg = function(i)
		DebugOutput(format("  %d : %s(%d)", i, GetName(), PlayerIndex));
	end
	for i = 1, 3 do
		DebugOutput( i .." ------");
		this.msCamp:turnPlayer(i, msg, i);
	end
end


g_tRankScore = {
	[0] = {0		 ,	"NhÊt Vâ Gi¶", 67, 1 },
	[1] = {2000    ,"NhÞ Vâ SÜ", 67, 2 },
	[2] = {6000    ,"Tam Vâ S­", 67, 3 },
	[3] = {10000   ,"Tø Vâ HiÖp", 67, 4 },
	[4] = {14000   ,"Ngò Vâ T«ng", 67, 5 },
	[5] = {18000   ,"Lôc Vâ Linh", 67, 6 },
	[6] = {22000   ,"ThÊt Vâ Hoµng", 67, 7 },
	[7] = {28000   ,"B¸t Vâ Quû", 67, 8 },
	[8] = {35000   ,"Cöu Vâ T«n", 67, 9 },
	[9] = {60000   ,"Vâ Th¸nh"	, 67, 10},
}
function addNvnScore(nScore)
	local newScore = GetTask(TASKID_NVN_SCORE) + nScore;
	SetTask(TASKID_NVN_SCORE, newScore);
	--resetNvnRank();
	GDS_writeTask(4,0,"NVN",{3450,3451,3455})
end

function getNvnScore()
	return GetTask(TASKID_NVN_SCORE);
end
function getNvnRank()
	return GetTask(TASKID_NVN_RANK);
end
g_tStatValueStr_LV = {
	[0] =  "jiaochang_yiduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½1¶Î¡£
	[1] =  "jiaochang_erduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½2¶Î¡£
	[2] = "jiaochang_sanduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½3¶Î¡£
	[3] =  "jiaochang_siduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½4¶Î¡£
	[4] =  "jiaochang_wuduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½5¶Î¡£
	[5] = "jiaochang_liuduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½6¶Î¡£
	[6] =  "jiaochang_qiduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½7¶Î¡£
	[7] =  "jiaochang_baduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½8¶Î¡£
	[8] = "jiaochang_jiuduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½9¶Î¡£
	[9] = "jiaochang_shiduan",		--¼ÇÂ¼Íæ¼ÒµÚÒ»´Î´ïµ½ÎäÊ¥¡£
}
function resetNvnRank()
	local nScore = GetTask(TASKID_NVN_SCORE);
	local oldRank = GetTask(TASKID_NVN_RANK)
	for i = getn(g_tRankScore), 0, -1 do
		if nScore >= g_tRankScore[i][1] then
			if i == oldRank then
				break;
			else
				SetTask(TASKID_NVN_RANK, i);
				local bChange = 0;
				if i > oldRank then
					Msg2Player("Ng­¬i t¨ng bËc råi! HiÖn t¹i lµ"..g_tRankScore[i][2]);
					if GetTask(TASKID_NVN_MOST_RANK) < i then
						SetTask(TASKID_NVN_MOST_RANK, i)
						--AddStatValue(g_tStatValueStr_LV[i], 1);
					end
					bChange = 1;
				else
					Msg2Player("Ng­¬i h¹ bËc råi ! HiÖn t¹i lµ"..g_tRankScore[i][2]);
					bChange = 1;
				end
				if bChange == 1 then
					for n = 1, getn(g_tRankScore) do
						RemoveTitle(g_tRankScore[n][3], g_tRankScore[n][4]);
					end
					AddTitle(g_tRankScore[i][3], g_tRankScore[i][4]);
					SetCurTitle(g_tRankScore[i][3], g_tRankScore[i][4]);
				end
			end
			break;
		end
	end
end
function openWnd(bOpen)
	if GetMissionV(MV_MISSION_TYPE) == 2 then
		SendScript2Client(format("Open('3v3', %d)",bOpen));
	else
		SendScript2Client(format("Open('nvnRoom', %d)",bOpen));
		SendScript2Client(format("Open('nvnHall', %d)",bOpen));
	end
end

function Line(x1, y1, x2, y2)
	local t, dx, dy = 0;
	local tPoint = {};
	if x2 == x1 then
		dx, dy = 0, 1;
	else
		local d = abs((y2 - y1) / (x2 - x1));
		if abs(d) > 1 then
			dx, dy = 1/d, 1;
		else
			dx, dy = 1 , d;
		end
	end
	if x2 < x1 then dx = -dx end
	if y2 < y1 then dy = -dy end

	local oldx, oldy, x, y = x1, y1, x1, y1;
	while 1 do
		oldx, oldy = x, y;
		x = x1 + t * dx;
		y = y1 + t * dy;
		if abs(floor(oldx+0.5) - floor(x+0.5)) >= 1 and floor(oldy+0.5) ~= floor(y+0.5) then
			tinsert(tPoint, {floor(x+0.5), floor(oldy+0.5)});
		end
		t = t + 1;
		tinsert(tPoint, {floor(x+0.5), floor(y+0.5)});
		if t > 1000 or (x == x2 and y == y2) then break end
	end
	if t >= 1000 then
		DebugOutput(format("[ERROR] [autoexec:Line] [(%d, %d) -> (%d, %d)] [t >= 1000]", x1, y1, x2, y2));
		return
	end
	return tPoint;
end


--======================================================================================
g_tGodState	= {
	{
		{9910, "state_life_max_percent_add",	100,  "Giíi h¹n m¸u t¨ng %d%%"},
		{9916, "state_neili_max_percent_add",    100,  "T¨ng néi lùc %d%%"};
		tInfo	= {"Vâ L©m Minh Quang Huy", 15, "Duy tr× %d phót"},
	},
}
g_tGodState2	= {
	{
		{9911, "state_life_max_percent_add",   40,  "T¨ng sinh lùc %d%%"},
		{9912, "state_move_speed_percent_add", 50,  "T¨ng tèc ®é di chuyÓn %d%%"},
		{9913, "state_p_attack_percent_add",   18,  "T¨ng ngo¹i c«ng %d%%"},
		{9914, "state_m_attack_percent_add",   18,  "T¨ng néi c«ng %d%%"},
		{9915, "state_burst_enhance_rate",     40,  "T¨ng tèc ®é xuÊt chiªu %d%%"};
		tInfo	= {"Vâ L©m Minh Quang Huy", 15, "Duy tr× %d phót"},
	},
}
if _JX2WZ == 1 then
g_tGodState2	= {
	{
		{9911, "state_life_max_percent_add",   40,  "T¨ng sinh lùc %d%%"},
		{9912, "state_move_speed_percent_add", 50,  "T¨ng tèc ®é di chuyÓn %d%%"},
		{9913, "state_p_attack_percent_add",   18,  "T¨ng ngo¹i c«ng %d%%"},
		{9914, "state_m_attack_percent_add",   18,  "T¨ng néi c«ng %d%%"},
		{9915, "state_burst_enhance_rate",     25,  "T¨ng tèc ®é xuÊt chiªu %d%%"};
		tInfo	= {"Vâ L©m Minh Quang Huy", 15, "Duy tr× %d phót"},
	},
}
end

function CleanGodState(tAllState)
	for i = 1, getn(tAllState) do
		local tState = tAllState[i];
		for j = 1, getn(tState) do
			RemoveState(tState[j][1]);
		end
	end
end

function AddGodState(tAllState)
	CleanGodState(tAllState);
	for j = 1, getn(tAllState) do
		local tState = tAllState[j];
		for i = 1, getn(tState) do
			CastState(tState[i][2], tState[i][3], tState.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
		end
		SyncCustomState(1, tState[1][1], 1, tState.tInfo[1]);
	end
	RestoreAll();
end
function missionAward(result)
	local nType = 2; --GetMissionV(MV_MISSION_TYPE);
	if nType == 0 then			--nvn
		return missionAward_nvn(result);
	elseif nType == 1 then		--1v1

	elseif nType == 2 then		-- 3v3
		return missionAward_3v3(result);
	end
end

function missionAward_nvn(result)
	local nOldPlayer = PlayerIndex;
	BattleMission_TeamFight.msCamp:reflash(result); --Ê¤Àû·½
	local nWinTb = BattleMission_TeamFight.msCamp.players
	local strWinRoute = "";
	for i = 1,getn(nWinTb) do
		PlayerIndex = nWinTb[i];
		if GetTask(TASKID_NVN_QUICK_JOIN) == 1 then
			gf_ModifyTask(TASKID_NVN_WIN_TIMES, 1);
			gf_ModifyTask(TASKID_NVN_WIN_TIMES_DAILY, 1);
		end
		addNvnScore(100);
		strWinRoute = strWinRoute.."["..tostring(GetPlayerRoute()).."]";
	end
	BattleMission_TeamFight.msCamp:reflash(3-result); --Ê§°Ü·½
	local nLoseTb = BattleMission_TeamFight.msCamp.players
	local strLoseRoute = "";
	for i = 1,getn(nLoseTb) do
		if GetTask(TASKID_NVN_QUICK_JOIN) == 1 then
			gf_ModifyTask(TASKID_NVN_LOSS_TIMES, 1);
			gf_ModifyTask(TASKID_NVN_LOSS_TIMES_DAILY, 1);
		end
		PlayerIndex = nLoseTb[i];
		local nvnRank = getNvnRank();
		if nvnRank <= 3 then
		elseif nvnRank <= 6 then
			addNvnScore(-80);
		else
			addNvnScore(-95);
		end
		strLoseRoute = strLoseRoute.."["..tostring(GetPlayerRoute()).."]";
	end
	PlayerIndex = nOldPlayer;
	WriteLog(format("[NVN][phaseTeamFight][HÖ ph¸i bªn th¾ng:%s][HÖ ph¸i bªn thua:%s]",strWinRoute,strLoseRoute))
end

function missionAward_3v3(result)
	local nOldPlayer = PlayerIndex;

	BattleMission_TeamFight.msCamp:reflash(result); --Ê¤Àû·½
	local nWinTb = BattleMission_TeamFight.msCamp.players
	local winTeamID, loseTeamID = -1, -1
	local winTeamName, loseTeamName = "", ""
	local winPIdx = 0;
	local nWinScore = 0;
	local nWinMerit = 0;
	local nWinLevel = 0;
	for i = 1, getn(nWinTb) do
		PlayerIndex = nWinTb[i];
		winPIdx = PlayerIndex;
		nWinScore = nWinScore + GetTask(TASKID_3V3_BATTLE_SCORE);
		nWinMerit = nWinMerit + _merit_GetMerit();
		nWinLevel = nWinLevel + (GetLevel() + 10 * gf_GetPlayerRebornCount())
		if winTeamID == -1 then 
			winTeamID = GetFightTeamID() or 0;
		elseif GetFightTeamID() ~= winTeamID then
			winTeamID = 0;
		end
		winTeamName = GetFightTeamInfo() or "";
	end
	nWinMerit = nWinMerit / getn(nWinTb);
	nWinLevel = nWinLevel / getn(nWinTb);
	
	BattleMission_TeamFight.msCamp:reflash(3-result); --Ê§°Ü·½
	local nLoseTb = BattleMission_TeamFight.msCamp.players
	local nLoseScore = 0;
	local nLoseMerit = 0;
	local nLoseLevel = 0;
	for i = 1, getn(nLoseTb) do
		PlayerIndex = nLoseTb[i];
		nLoseScore = nLoseScore + GetTask(TASKID_3V3_BATTLE_SCORE);
		nLoseMerit = nLoseMerit + _merit_GetMerit();
		nLoseLevel = nLoseLevel + (GetLevel() + 10 * gf_GetPlayerRebornCount())
		if loseTeamID == -1 then 
			loseTeamID = GetFightTeamID() or 0;
		elseif GetFightTeamID() ~= loseTeamID then
			loseTeamID = 0;
		end
		loseTeamName = GetFightTeamInfo() or "";
	end
	nLoseMerit = nLoseMerit / getn(nLoseTb);
	nLoseLevel = nLoseLevel / getn(nLoseTb);
	
	if winTeamID == -1 then winTeamID = 0 end
	if loseTeamID == -1 then loseTeamID = 0 end
	PlayerIndex = winPIdx;
	SendScript2VM(SCRIPT_3V3_MASTER, format("onFinishBattle(%s, %s, '%s', '%s')", tostring(winTeamID), tostring(loseTeamID), winTeamName, loseTeamName));
	
	BattleMission_TeamFight.msCamp:reflash(result); --Ê¤Àû·½
	local nWinTb = BattleMission_TeamFight.msCamp.players
	-- Ãû×Ö Á÷ÅÉ µÈ¼¶ Õ½¶·Á¦ Õ½Ëð Ê¤ÂÊ
	local strTitle = "Tªn                M«n Ph¸i          CÊp    Lùc ChiÕn    ChiÕn Tæn    Th¾ng";
	local msgFmt = "%-18s  %-16s  %-8d %-8d %3d/%-3d %-3.2f%%";
	local strWinRoute = strTitle;
	for i = 1,getn(nWinTb) do
		PlayerIndex = nWinTb[i];
		gf_ModifyTask(TASKID_3V3_WIN_ROUND_DAILY, 1);
		gf_ModifyTask(TASKID_3V3_WIN_ROUND_MATCH, 1);
		gf_ModifyTask(TASKID_3V3_WIN_ROUND_TOTAL, 1);
		gf_ModifyTask(TASKID_3V3_TOTAL_ROUND_DAILY, 1);
		gf_ModifyTask(TASKID_3V3_TOTAL_ROUND_MATCH, 1);
		gf_ModifyTask(TASKID_3V3_TOTAL_ROUND, 1);
		gf_ModifyTask(TASKID_3V3_WIN_AWARD_COUNT, 1);
		gf_SetMyTaskByte(TASKID_3V3_WEEK_FIGHT_TIMES, 3, 4, gf_GetMyTaskByte(TASKID_3V3_WEEK_FIGHT_TIMES, 3, 4) + 1);
		add3v3Score();
		local myBattleScore = GetTask(TASKID_3V3_BATTLE_SCORE);
		local myBattleScoreAdd = calcELO(myBattleScore, nWinScore, 1);
		SetTask(TASKID_3V3_BATTLE_SCORE, myBattleScore + myBattleScoreAdd);
		calcBattlePower();
		merit_3V3(1, nWinMerit-nLoseMerit, nWinLevel-nLoseLevel, 0); --ÎäÁÖ¹¦Ñ«ºÍ½£ÏÀµãÊý
		strWinRoute = strWinRoute.."<enter/>"..format(msgFmt, GetName(), gf_GetRouteName(), GetLevel(),
			GetTask(TASKID_3V3_BATTLE_POWER),
			GetTaskTemp(TEMP_TASKID_3V3_KILLED), GetTaskTemp(TEMP_TASKID_3V3_IS_DEAD),
			GetTask(TASKID_3V3_VIC_RATE)/100);
		GDS_writeTask(5, 0, "3v3", g_tSyncTaskList);
		GDS_writeOther(2);
		GDS_writeOther(3);
		SendScript2Client([[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\ÆäËû\\Ê¤Àû_Ô½ÄÏ.3e",1000*4,5)]])
		missionAward_3v3_to_player(1);
		AddRuntimeStat(8, 6, GetPlayerRoute(), 1);--°´Á÷ÅÉÍ³¼Æ»ñÊ¤µÄÈËÊý
		StatLog("3v3_Win", GetPlayerRoute(), 1);
		WriteLog(format("[3v3 DTLOG] [Role:%s Acc:%s] [VicRoundDaily=%d, RoundDaily=%d, ScoreDaily=%d, TotalScore=%d, IsVic=1]",
			GetName(), GetAccount(), 
			GetTask(TASKID_3V3_WIN_ROUND_DAILY), GetTask(TASKID_3V3_TOTAL_ROUND_DAILY),
			GetTask(TASKID_3V3_SCORE_DAILY), GetTask(TASKID_3V3_SCORE_TOTAL)))
	end
	BattleMission_TeamFight.msCamp:reflash(3-result); --Ê§°Ü·½
	local nLoseTb = BattleMission_TeamFight.msCamp.players
	local strLoseRoute = strTitle;
	for i = 1,getn(nLoseTb) do
		PlayerIndex = nLoseTb[i];
		gf_ModifyTask(TASKID_3V3_LOSE_ROUND_DAILY, 1);
		gf_ModifyTask(TASKID_3V3_LOSE_ROUND_MATCH, 1);
		gf_ModifyTask(TASKID_3V3_LOSE_ROUND_TOTAL, 1);
		gf_ModifyTask(TASKID_3V3_TOTAL_ROUND_DAILY, 1);
		gf_ModifyTask(TASKID_3V3_TOTAL_ROUND_MATCH, 1);
		gf_ModifyTask(TASKID_3V3_TOTAL_ROUND, 1);
		gf_SetMyTaskByte(TASKID_3V3_WEEK_FIGHT_TIMES, 1, 2, gf_GetMyTaskByte(TASKID_3V3_WEEK_FIGHT_TIMES, 1, 2) + 1);
		local myBattleScore = GetTask(TASKID_3V3_BATTLE_SCORE);
		local myBattleScoreAdd = calcELO(myBattleScore, nLoseScore, 0);
		SetTask(TASKID_3V3_BATTLE_SCORE, myBattleScore + myBattleScoreAdd);
		calcBattlePower();
		merit_3V3(0, nLoseMerit-nWinMerit, nLoseLevel-nWinLevel, 0); --ÎäÁÖ¹¦Ñ«ºÍ½£ÏÀµãÊý
		strLoseRoute = strLoseRoute.."<enter/>"..format(msgFmt, GetName(), gf_GetRouteName(), GetLevel(),
			GetTask(TASKID_3V3_BATTLE_POWER),
			GetTaskTemp(TEMP_TASKID_3V3_KILLED), GetTaskTemp(TEMP_TASKID_3V3_IS_DEAD),
			GetTask(TASKID_3V3_VIC_RATE)/100);
		GDS_writeTask(5, 0, "3v3", g_tSyncTaskList);
		GDS_writeOther(2);
		GDS_writeOther(3);
		SendScript2Client([[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\ÆäËû\\Ê§°ÜÓ¡ÕÂ_Ô½ÄÏ.3e",1000*4,1)]])
		missionAward_3v3_to_player(2);
		WriteLog(format("[3v3 DTLOG] [Role:%s Acc:%s] [VicRoundDaily=%d, RoundDaily=%d, ScoreDaily=%d, TotalScore=%d, IsVic=0]",
			GetName(), GetAccount(), 
			GetTask(TASKID_3V3_WIN_ROUND_DAILY), GetTask(TASKID_3V3_TOTAL_ROUND_DAILY),
			GetTask(TASKID_3V3_SCORE_DAILY), GetTask(TASKID_3V3_SCORE_TOTAL)))
	end
	local msg = "<enter/>Bªn th¾ng <enter/><color=green>"..strWinRoute.."<color><enter/> Bªn b¹i <enter/><color=red>"..strLoseRoute.."<color><enter/>";
	DebugOutput(msg)
	BattleMission_TeamFight.msCamp:reflash(0);
	local tPlayers = BattleMission_TeamFight.msCamp.players;
	for i = 1, getn(tPlayers) do
		P3v3_Msg2Player(msg, tPlayers[i]);
	end
	PlayerIndex = nOldPlayer;
end

g_tSyncTaskList = {
	TASKID_3V3_WIN_ROUND_DAILY		, -- = 3146;		-- Ã¿ÈÕÊ¤³¡, Áì½±Ê±Çå¿Õ
	TASKID_3V3_TOTAL_ROUND_DAILY	, -- = 3147;		-- Ã¿ÈÕ×Ü³¡
	TASKID_3V3_TOTAL_ROUND			, -- = 3148;		-- ×Ü³¡
	TASKID_3V3_BATTLE_SCORE			, -- = 3149;		-- Rank·Ö
	TASKID_3V3_KILL_TOTAL			, -- = 3150;		-- ×ÜÈËÍ·
	TASKID_3V3_DEAD_TOTAL			, -- = 3151;		-- ×ÜËÀÍö´ÎÊý
	TASKID_3V3_VIC_RATE				, -- = 3152;		-- Ê¤ÂÊ = ×ÜÊ¤³¡ / ×Ü³¡
	TASKID_3V3_SCORE_DAILY			, -- = 3153;		-- Ã¿ÈÕ»ý·Ö
	TASKID_3V3_SCORE_TOTAL			, -- = 3154;		-- Èü¼¾»ý·Ö
	TASKID_3V3_WIN_ROUND_MATCH		, -- = 3158;		-- Èü¼¾×ÜÊ¤³¡
	TASKID_3V3_WIN_ROUND_TOTAL		, -- = 3159;		-- ×ÜÊ¤³¡
	TASKID_3V3_TOTAL_ROUND_MATCH	, -- = 3160;		-- Èü¼¾×Ü³¡
	TASKID_3V3_KILL_DAILY			, -- = 3161;		-- Ã¿ÈÕÈËÍ·
	TASKID_3V3_KILL_MATCH           , -- = 3162;		-- Èü¼¾ÈËÍ·
	TASKID_3V3_DEAD_DAILY           , -- = 3163;		-- Ã¿ÈÕËÀÍö
	TASKID_3V3_DEAD_MATCH           , -- = 3164;		-- Èü¼¾ËÀÍö
	TASKID_3V3_BATTLE_POWER			, -- = 3165;		-- Õ½¶·Á¦ = rank·ÖÊý*1.5+Ê¤ÂÊ*3000*(×Ü³¡/(×Ü³¡+10))+min(×ÜÊ¤³¡*1, 3000)
	TASKID_3V3_ESCAPE_DAILY			, -- = 3166;		-- Ã¿ÈÕÌÓÅÜ
	TASKID_3V3_ESCAPE_MATCH			, -- = 3167;		-- Èü¼¾ËûÅ¶ÆÕ
	TASKID_3V3_ESCAPE_TOTAL			, -- = 3168;		-- ×ÜÌÓÅÜ
	TASKID_3V3_LOSE_ROUND_DAILY		, -- = 3174;
	TASKID_3V3_LOSE_ROUND_MATCH		, -- = 3175;
	TASKID_3V3_LOSE_ROUND_TOTAL		, -- = 3176;
	TASKID_3V3_MATCH_FIGHTTEAM_SCORE, -- = 3181;
	TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL, -- = 3179;
	TASKID_3V3_WIN_AWARD_COUNT, -- = 3172;
	TASKID_3V3_WEEK_FIGHT_TIMES, -- = 3182;
	TASKID_3V3_LASTWEEK_FIGHT_TIMES, -- = 3183;
}

g_t3v3Score = {
	[11	] = 1,
	[9	] = 1,
	[7	] = 1,
	[5	] = 1,
}
SDBKEY_RANK_GLOBAL = "XVX_RANK_GLOBAL";
SDBKEY_RANK_LOCAL = "XVX_RANK_LOCAL";
function add3v3Score()
	local addScore = g_t3v3Score[GetTask(TASKID_3V3_WIN_ROUND_DAILY)] or 0;
	local myDailyScore, myTotalScore = GetTask(TASKID_3V3_SCORE_DAILY), GetTask(TASKID_3V3_SCORE_TOTAL);
	DebugOutput("add3v3Score", GetTask(TASKID_3V3_WIN_ROUND_DAILY), g_t3v3Score[GetTask(TASKID_3V3_WIN_ROUND_DAILY)], addScore, myDailyScore, myTotalScore)
	if addScore > 0 then
		myDailyScore = myDailyScore + addScore;
		myTotalScore = myTotalScore + addScore;
		SetTask(TASKID_3V3_SCORE_DAILY, myDailyScore);
		SetTask(TASKID_3V3_SCORE_TOTAL, myTotalScore);
		globalSDB = globalSDB or SDB(SDBKEY_RANK_GLOBAL, 0, 0);
		globalSDB.sortType = 2;
		globalSDB[GetName()] = {"dds", myTotalScore, (GetPlayerRoute() or 0), GetTongName()};
		local localSDB = SDB(SDBKEY_RANK_LOCAL, 0, 0, 3);
		localSDB.sortType = 2;
		local _, name = gf_GetRealmName(GetName());
		localSDB[name] = {"dds", myTotalScore, (GetPlayerRoute() or 0), GetTongName()};
	end
end

g_tW2 = {
	{0		,0.50	,0.50},
	{4		,0.51	,0.49},
	{11		,0.52	,0.48},
	{18		,0.53	,0.47},
	{26		,0.54	,0.46},
	{33		,0.55	,0.45},
	{40		,0.56	,0.44},
	{47		,0.57	,0.43},
	{54		,0.58	,0.42},
	{62		,0.59	,0.41},
	{69		,0.60	,0.40},
	{77		,0.61	,0.39},
	{84		,0.62	,0.38},
	{92		,0.63	,0.37},
	{99		,0.64	,0.36},
	{107	,0.65	,0.35},
	{114	,0.66	,0.34},
	{122	,0.67	,0.33},
	{130	,0.68	,0.32},
	{138	,0.69	,0.31},
	{146	,0.70	,0.30},
	{154	,0.71	,0.29},
	{163	,0.72	,0.28},
	{171	,0.73	,0.27},
	{180	,0.74	,0.26},
	{189	,0.75	,0.25},
	{198	,0.76	,0.24},
	{207	,0.77	,0.23},
	{216	,0.78	,0.22},
	{226	,0.79	,0.21},
	{236	,0.80	,0.20},
	{246	,0.81	,0.19},
	{257	,0.82	,0.18},
	{268	,0.83	,0.17},
	{279	,0.84	,0.16},
	{291	,0.85	,0.15},
	{303	,0.86	,0.14},
	{316	,0.87	,0.13},
	{329	,0.88	,0.12},
	{345	,0.89	,0.11},
	{358	,0.90	,0.10},
	{375	,0.91	,0.09},
	{392	,0.92	,0.08},
	{412	,0.93	,0.07},
	{433	,0.94	,0.06},
	{457	,0.95	,0.05},
	{485	,0.96	,0.04},
	{518	,0.97	,0.03},
	{560	,0.98	,0.02},
	{620	,0.99	,0.01},
	{736	,1		,0   },
	{9999999,1		,0   },
}
function GetW2(nDet)
	local bWeak = 0;
	if nDet < 0 then
		bWeak = 1;
		nDet = -nDet;
	end
	for i = 1, getn(g_tW2) do
		if nDet < g_tW2[i][1] then
			i = i - 1;
			if bWeak == 1 then
				return g_tW2[i][3];
			else
				return g_tW2[i][2];
			end
		end
	end
end
function calcELO(myBattleScore, hisScore, bWin)
	local K = 30;
	if myBattleScore < 2000 then
		K = 30;
	elseif myBattleScore < 2400 then
		K = 15;
	else
		K = 10;
	end
	local W2 = GetW2(myBattleScore - hisScore);
	local myBattleScoreAdd = floor(K * (bWin - W2) + 0.5);
	return myBattleScoreAdd, K, bWin - W2;
end

function calcBattlePower()
	-- Õ½¶·Á¦ = rank·ÖÊý*1.5+Ê¤ÂÊ*3000*(×Ü³¡/(×Ü³¡+10))+min(×ÜÊ¤³¡*1, 3000)
	local rankScore = GetTask(TASKID_3V3_BATTLE_SCORE);
	local winTotal = GetTask(TASKID_3V3_WIN_ROUND_TOTAL);
	local allRoundTotal = GetTask(TASKID_3V3_TOTAL_ROUND);
	local winRate = winTotal * 10000 / allRoundTotal;
	local battlePower = rankScore * 1.5
		+ winTotal * 3000 / (allRoundTotal + 10)
		+ min(winTotal, 3000);
	SetTask(TASKID_3V3_VIC_RATE, winRate);
	SetTask(TASKID_3V3_BATTLE_POWER, battlePower);
end

--´ø·ð¡£¡£¡£
function HasFo(nCamp)
	BattleMission_TeamFight.msCamp:reflash(nCamp);
	local tPlayers = BattleMission_TeamFight.msCamp.players
	for i = 1, getn(tPlayers) do
		PlayerIndex = tPlayers[i];
		if GetPlayerRoute() == 8 then
			return 1;
		end
	end
	return 0;
end

--Ã¿´Î½±Àø
function missionAward_3v3_to_player(nResult)
	--Ê¤
	if 1 == nResult then
		local nLevel = GetLevel();
		--gf_Modify("Exp", nLevel * nLevel * 60);
		gf_ModifyTask(TASKID_3V3_EVERY_MATCH_EXP, nLevel * nLevel * 60);
		--ModifyYinJuan(30,1);
		gf_ModifyTask(TASKID_3V3_EVERY_MATCH_YINJUAN, 0);
		return 0;
	end
	--¸º
	if 2 == nResult then
		local nLevel = GetLevel();
		--gf_Modify("Exp", nLevel * nLevel * 20);
		gf_ModifyTask(TASKID_3V3_EVERY_MATCH_EXP, nLevel * nLevel * 20);
		--ModifyYinJuan(10,1);
		gf_ModifyTask(TASKID_3V3_EVERY_MATCH_YINJUAN, 0);
		return 0;
	end
end