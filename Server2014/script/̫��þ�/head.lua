-- 
-- 
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
Include("\\script\\tmp_task_id_def.lua")

MONSTER_FILE = new(KTabFile, "\\settings\\Ì«Ðé»Ã¾³\\monster.txt")
FILE_ROW_COUNT = tonumber(MONSTER_FILE:getRow())
Include("\\script\\lib\\writelog.lua")

TAIXU_TASK_TEMP_BEGIN = 100
TAIXU_MONSTER_TYPE = 100	-- ¼ÇÂ¼µ±Ç°Ë¢¹ÖµÄÀàÐÍ
TAIXU_ZONE_INDEX = 101		-- ¼ÇÂ¼±»´«ËÍµ½ÄÄ¸ö¿Õ¼äÀïÃæ
TAIXU_MAP_ID = 102			-- ¼ÇÂ¼Ì«Ðé»Ã¾³µÄµØÍ¼ID
TAIXU_TEAM_SIZE = 107		-- ¼ÇÂ¼½øÈëÊ±¶ÓÎéµÄÈËÊý
TAIXU_RINGS_MAX = 103		-- Ë¢¹Ö¶àÉÙÂÖ´Î
TAIXU_TEAM_INDEX = 108		-- ¼ÇÂ¼¶ÓÔ±½øÈëÊ±ÊÇ¶ÓÎéµÄÄÄ¸öÎ»ÖÃ
TAIXU_RINGS = 104			-- É±¹ÖµÄÂÖÊý
TAIXU_STEPS = 105			-- Ê±¼ä´¥·¢Æ÷µÄ¼Æ²½Æ÷
TAIXU_STEP_CONTROL = 106	-- ¿ØÖÆË¢¹ÖµÄÊ±¼ä

TAIXU_TASK_TEMP_END = 108

TRIGGER_TIMER = 1011
TRIGGER_KILL = 1012
TRIGGER_RECT = 1013
TRIGGER_LOG = 1014

GROUP_OFFSET = 10

ONE_MONSTER_EXP = 2500
ONE_MONSTER_POPUR = 10

MAX_MONSTER_COUNT = 80		--×î¶àË¢¶àÉÙ¹ÖÎï

RINGS_INTERVAL = 2		-- Ë¢¹Ö¼ä¸ô

TAIXU_TIME = 1782		--¼ÇÂ¼×î½üÒ»´Î½øÈëÌ«Ðé»Ã¾³µÄÊ±¼ä

tMAP_ID =
{
	[200] = 2010,
	[300] = 1010,
	[100] = 3010,
}

-- ´ÓÌ«Ðé»Ã¾³´«ËÍ»ØÀ´µÄ×ø±ê
tPos = 
{
	[3010] = {100, 1379, 2858},
	[2010] = {200, 1151, 2850},
	[1010] = {300, 1975, 3552},
	[4010] = {300, 1111, 1111},
	[5010] = {300, 1111, 1111},
}

tName =
{
	"B¨ng Thiªn TuyÕt §Þa",
	"Giang Nam Xu©n S¾c",
	"Dung Nham §Þa Ngôc",
	"H¹n H¶i Hoµng Sa",
}

tNEW_WORLD =
{
	{1543, 3297},
	{1625, 3300},
	{1542, 3458},
	{1625, 3470},
}

tMonsterType = 
{
	[1] = {"Kinh nghiÖm Thá", "Kinh nghiÖm Phông hoµng", "Kinh nghiÖm Háa Kú L©n", "Kinh nghiÖm Thùc nh©n th¶o", "Kinh nghiÖm Bß T©y T¹ng", "Kinh nghiÖm CÇm Tiªn Tö","Phi Thiªn3","§µ La Ni T¨ng","§äat B¶o Nh©n"},
	[2] = {"Kinh nghiÖm Thá", "Kinh nghiÖm Phông hoµng", "Kinh nghiÖm Háa Kú L©n", "Kinh nghiÖm Thùc nh©n th¶o", "Kinh nghiÖm Bß T©y T¹ng", "Kinh nghiÖm CÇm Tiªn Tö","Phi Thiªn3","§µ La Ni T¨ng","§äat B¶o Nh©n"},
	[3] = {"Kinh nghiÖm Thá", "Kinh nghiÖm Phông hoµng", "Kinh nghiÖm Háa Kú L©n", "Kinh nghiÖm Thùc nh©n th¶o", "Kinh nghiÖm Bß T©y T¹ng", "Kinh nghiÖm CÇm Tiªn Tö","Phi Thiªn3","§µ La Ni T¨ng","§äat B¶o Nh©n"},
	[4] = {"Kinh nghiÖm Thá", "Kinh nghiÖm Phông hoµng", "Kinh nghiÖm Háa Kú L©n", "Kinh nghiÖm Thùc nh©n th¶o", "Kinh nghiÖm Bß T©y T¹ng", "Kinh nghiÖm CÇm Tiªn Tö","Phi Thiªn3","§µ La Ni T¨ng","§äat B¶o Nh©n"},
	
--	[2] = {"LuyÖn Thè tö", "LuyÖn Phông Hoµng", "LuyÖn Háa Kú L©n", "LuyÖn Thùc Nh©n Hoa", "LuyÖn Mao Ng­u", "LuyÖn CÇm Tiªn Tö"},
--	[3] = {"B¶o Th¹ch Thè", "B¶o Th¹ch Phông hoµng", "B¶o Th¹ch Háa Kú L©n", "B¶o Th¹ch Thùc Nh©n hoa", "B¶o Th¹ch Bß T©y T¹ng", "B¶o Th¹ch CÇm Tiªn Tö"},
--	[4] = {"Trang bÞ Thá", "Trang bÞ Phông hoµng", "Trang bÞ Háa Kú L©n", "Trang bÞ Thùc nh©n th¶o", "Trang bÞ Bß T©y T¹ng", "Trang bÞ CÇm Tiªn Tö"},
}
-- §æi tªn hiÓn thÞ c¸c lo¹i qu¸i
t1 =  {"Thá", "Phông hoµng", "Háa Kú L©n", "Thùc nh©n th¶o", "Bß T©y T¹ng", "CÇm Tiªn Tö", "LiÖt Nhan Li Long", "§µ La Ni T¨ng", "TÇm B¶o Nh©n"}

tbMobsRate = {
	[1] = {[1] = 1, nRate = 5.00},
	[2] = {[1] = 2, nRate = 15.00},
	[3] = {[1] = 3, nRate = 15.00},
	[4] = {[1] = 4, nRate = 10.00},
	[5] = {[1] = 5, nRate = 5.00},
	[6] = {[1] = 6, nRate = 10.00},
	[7] = {[1] = 7, nRate = 15.00},
	[8] = {[1] = 8, nRate = 15.00},
	[9] = {[1] = 9, nRate = 10.00},
}
-- Table vßng Th¸i H­
tThaiHuRing = 
{
	{"Vßng Th¸i H­ B¸t Qu¸i - Cµn",2,1,469},
	{"Vßng Th¸i H­ B¸t Qu¸i - Kh«n",2,1,470},	
	{"Vßng Th¸i H­ B¸t Qu¸i - Kh¶m",2,1,471},	
	{"Vßng Th¸i H­ B¸t Qu¸i - §oµi",2,1,472},
	{"Vßng Th¸i H­ B¸t Qu¸i - Ly",2,1,473},	
	{"Vßng Th¸i H­ B¸t Qu¸i - ChÊn",2,1,474},	
	{"Vßng Th¸i H­ B¸t Qu¸i - CÊn",2,1,475},
	{"Vßng Th¸i H­ B¸t Qu¸i - Tèn",2,1,476},
}
function GetTabData(nRow, nCell)
	local tempdata = MONSTER_FILE:getCell(nRow, nCell)
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- ÅÐ¶Ï¶ÓÎéÊÇ·ñÄÜ¹»½øÈë
function Chk_Enter()
	local szSex = {"ThiÕu hiÖp", "N÷ hiÖp "}
	local szNoTeam ={"Th¸i H­ HuyÔn C¶nh nguy hiÓm trïng trïng,", " nªn tæ ®éi hay h¬n!"}
	local nSex = GetSex()
	local szLevel = "<color=green>Lín h¬n hoÆc b»ng cÊp 70<color>"
	local szItemCount = "<color=green>1 Th¸i H­ §a MËt qu¶<color>"
	local szTimes = "<color=green>1 lÇn<color>"
	local szLeader = "<color=green>§éi tr­ëng<color>"
	local szTown = "<color=green>§éi viªn cïng mét thµnh thÞ<color>"
	local szExMsg = ""				-- ¶îÍâµÄÐÅÏ¢
	local nRetCode = 1
	
	if IsinTeam() == 0 then
		nRetCode = 0
		return nRetCode, szNoTeam[1]..szSex[nSex]..szNoTeam[2]
	end
	
	if IsCaptain() == 0 then
		nRetCode = 0
		szLeader = "<color=red>§éi tr­ëng<color>" 
	end
	
	local nSize = GetTeamSize()
	local nCount = 1
	local OldPlayer = PlayerIndex
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < 70 then
			nRetCode = 0
			szLevel = "<color=red>Lín h¬n hoÆc b»ng cÊp 70<color>"
			break
		end
	end
    
--    --¶Ó³¤Ð¯´ø1¸öÌ«Ðé¹û
--    PlayerIndex = GetTeamMember(0)
--    if PlayerIndex <= 0 then
--    	print("###Ì«Ðé»Ã¾³ Chk_Enter ¼ì²â¶Ó³¤Ð¯´øÌ«Ðé¹û³ö´í")
--    	return
--    end
--   	if GetItemCount(2,1,387) < 1 then
--   		nRetCode = 0
--   		szItemCount = "<color=red>1¸öÌ«Ðé¶àÃÛ»¨¹û<color>"
--    end
    -- KiÓm tra ngµy ®i Th¸i H­ mét lÇn
--    for i = 1, nSize do
--    	PlayerIndex = GetTeamMember(i)
--    	-- §iÒu kiÖn chÆn ngµy
----    	if TodayCanEnter() <= 0 then
----    		nRetCode = 0
----    		szTimes = "<color=red>1 lÇn<color>"
----    		szExMsg = szExMsg..GetName()..", "
----    	end
--    end
--    PlayerIndex = OldPlayer
--    if szExMsg ~= "" then
--	    local nLen = strlen(szExMsg)
--	    szExMsg = strsub(szExMsg, 1, nLen - 2)
--	    szExMsg = szExMsg.."Kh«ng vµo ®­îc Th¸i H­ HuyÔn C¶nh (H«m nay ®· vµo 1 lÇn)"
--	end
	
    
    if AreaCheck() == 0 then
    	nRetCode = 0
    	szTown = "<color=red>§éi viªn cïng mét thµnh thÞ<color>"
    end
    
    local nSleepCheckRet = 0
    local szSleepCheck = ""
    nSleepCheckRet, szSleepCheck = SleepCheck()
    if nSleepCheckRet == 0 then
    	nRetCode = 0
    end

	if szExMsg ~= "" then
		Msg2Team(szExMsg)
	end
	if szSleepCheck ~= "" then
		Msg2Team(szSleepCheck)
	end

    local szMsg = "Do "..szLeader.."dÉn ®Çu"..szLevel..szTown..", 1 ngµy vµo"..szTimes.."Th¸i H­ HuyÔn C¶nh. \n\n(<color=white>Mµu xanh t­îng tr­ng ®ñ ®iÒu kiÖn, mµu ®á kh«ng ®ñ nguyªn nh©n<color>)"
    return nRetCode, szMsg
end

-- ÊÇ·ñÔÚ¶ÓÎéÖÐ
function IsinTeam()
	if GetTeamSize() < 1 then
		return 0
	else
		return 1
	end
end

-- ÊÇ·ñÎª¶Ó³¤
function IsCaptain()
	if IsinTeam() == 0 then
		return 0
	end
	
	local nCaptain = GetTeamMember(0)
	if nCaptain == PlayerIndex then
		return 1
	else
		return 0
	end
end

function TodayCanEnter()
	local nNow = date("%y%m%d")
	local nLastTime = GetTask(TAIXU_TIME)
	local nDuration = nNow - nLastTime
	return nDuration
end

function GetRouteCount()
	local RouteTable = {}
	local nCount = 1
	local nRoute = 0
	local flagInTable = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nRoute = GetPlayerRoute()
		for index, value in RouteTable do
			if value == nRoute then
				flagInTable = 1
				break
			end
		end
		if flagInTable == 1 then
			flagInTable = 0
		else
			RouteTable[nCount] = nRoute;
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldIndex
	return nCount - 1
end

-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
	local nRestMin = floor(nSec / 60)
	local nRestSec = mod(nSec, 60)
	return nRestMin, nRestSec
end;


function InitPlayerStatus(nMapid, nIndex)
	--Msg2Player("Trong quy t¾c bè trÝ ¶i……")
	-- Èç¹ûÊÇ¶Ó³¤
	if IsCaptain() == 1 then
		SetDeathScript("\\script\\Ì«Ðé»Ã¾³\\death.lua")
		SetTaskTemp(TAIXU_STEPS, 0)
		SetTaskTemp(TAIXU_STEP_CONTROL, 2)
		SetTaskTemp(TAIXU_RINGS, 0)
		SetTaskTemp(TAIXU_ZONE_INDEX, nIndex)
		SetTaskTemp(TAIXU_MAP_ID, nMapid)
		SetTaskTemp(TAIXU_TEAM_SIZE, GetTeamSize())
		local nRouteCount = GetRouteCount()
		if nRouteCount > 8 then
			nRouteCount = 8
		end
		SetTaskTemp(TAIXU_RINGS_MAX, nRouteCount)

		local nTrigger = CreateTrigger(1, 1106, TRIGGER_TIMER)
		
		ContinueTimer(nTrigger)
	end

	-- ¶Ó³¤ºÍ³ÉÔ±¶¼ÓÐµÄ³õÊ¼»¯
	local nNow = date("%y%m%d")
	SetTask(TAIXU_TIME, nNow)
	
	SetLogoutRV(1)						-- ÖÐÍ¾ÖÐ¶Ïºó»Ø³Ç
	SetFightState(1)					-- ÉèÖÃÎª¿ÉÕ½¶·
	SetCreateTeam(1)					-- ¹Ø±Õ×é¶Ó¹¦ÄÜ
	--UseScrollEnable(0)					-- ½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	InteractiveEnable(0)					-- ½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
	StallEnable(0)						-- °ÚÌ¯¿ª¹Ø
	ForbitTrade(1)						-- ½ûÖ¹½»Ò×
	OpenFriendliness(0)					-- ²»ÌáÉýºÃ¸Ð
	SetDeathPunish(0)					-- ÎÞËÀÍö³Í·£
	
	CreateTrigger(0, 1106, TRIGGER_KILL)
	CreateTrigger(2, 1106, TRIGGER_RECT)
	CreateTrigger(3, 1106, TRIGGER_LOG)
	--OnKill¿ª¹Ø
	SetTaskTemp(TMP_TASK_TAIXU_TAG, 0);
	--cdkey»î¶¯
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(1)");	
end

function ClearMonster(nIndex)
	nIndex = nIndex + GROUP_OFFSET					-- ±ÜÃâºÍ²Ø½£³åÍ»
	SetGroupLifeTime(nIndex, nLifeTime)
	SetGroupDeathScript(nIndex, "")
	return ClearGroup(nIndex)
end

function Move2Stage(nIndex)
	local szMsg = ""
	local nMapid = GetWorldPos()
	
	-- 8¸ö¶ÓÔ±µÄÏà¶ÔÆ«ÒÆ£¬±£Ö¤trapºó²»»á´«ËÍµ½Í¬Ò»µã
	local tOffset =
	{
		{-2, 0},
		{-1, 0},
		{0, 0},
		{1, 0},
		{-2, 1},
		{-1, 1},
		{0, 1},
		{1, 1},
	}

	local pos = {}
	pos[1] = tMAP_ID[nMapid]

	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		CleanInteractive()
		SCCheckOfflineExp(3)
		local nPlayerTeamIndex = GetTaskTemp(TAIXU_TEAM_INDEX)
		
		if nPlayerTeamIndex > 0 and nPlayerTeamIndex <= 8 then
			pos[2] = tNEW_WORLD[nIndex + 1][1] + tOffset[nPlayerTeamIndex][1]
			pos[3] = tNEW_WORLD[nIndex + 1][2] + tOffset[nPlayerTeamIndex][2]
		else
			pos[2] = tNEW_WORLD[nIndex + 1][1]
			pos[3] = tNEW_WORLD[nIndex + 1][2]
		end
		
		if NewWorld(pos[1], pos[2], pos[3]) ~= 1 then
			Msg2Player("chuyÓn tiÕp thÊt b¹i, kh«ng thÓ vµo Th¸i H­ HuyÔn C¶nh")
			LeaveTeam()
			WriteLog("**Th¸i H­ HuyÔn C¶nh "..GetName().."ChuyÓn tiÕp thÊt b¹i, thêi gian : "..date("%H%M"))
		end
	end
	
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		InitPlayerStatus(pos[1], nIndex)
	end
	PlayerIndex = nOldPlayer
	
	-- ¼ÇÂ¼¸ÃZONEÒÑ¾­ÓÐ¶ÓÎé½øÈë
	SetMapTaskTemp(pos[1], nIndex, 1)
end

function EnterTx()
--	Talk(1, "", "Th¸i H­ ®· hÕt linh khÝ, ®¹i hiÖp h·y quay l¹i sau nha !!!!")
--	do return end
	-- ¼òµ¥¼ì²é¹ÖÎï±íµÄÕýÈ·ÐÔ
	local nMap = GetWorldPos()
	if nMap ~= 100 then
		Talk(1,"","C¸c h¹ chØ cã thÓ vµo Th¸i H­ HuyÔn C¶nh tõ TuyÒn Ch©u!")
		return
	end
--	ReSetDateTH()
	if CheckMaxJoinCount() ~= 1 then
		return
	end
	if (FILE_ROW_COUNT - 2) > MAX_MONSTER_COUNT then
		Msg2Team("Th¸i H­ HuyÔn C¶nh ®ang hçn lo¹n, mäi ng­êi kh«ng nªn vµo!", 2)
		WriteLog("**Th¸i H­ HuyÔn C¶nh monster.txt vµ MAX_MONSTER_COUNT kh«ng phèi hîp ®­îc")
		return
	end

	local nRetCode, szMsg = Chk_Enter()
	if nRetCode == 0 then
		Talk(1, "", szMsg)
		return
	end

	local t = {}
	local nCount = 0
	local nMapid = GetWorldPos()
	-- µØÍ¼±äÁ¿µÄ0£¬1£¬2£¬3µÄÖµ±íÊ¾ÊÇ·ñ±»Õ¼ÓÃ£¬0ÎªÃ»Õ¼ÓÃ£¬1Îª±»Õ¼ÓÃ
	for i = 0, 3 do
		local nValue = GetMapTaskTemp(tMAP_ID[nMapid], i)
		--local nLastTime = GetMapTaskTemp(tMAP_ID[nMapid], i + 4)
		if nValue == 0 then
			nCount = nCount + 1
			t[nCount] = i
		end
	end

	if nCount == 0 then
		Msg2Team("Th¸i H­ HuyÔn C¶nh ®· ®Çy, khi kh¸c h·y quay l¹i!", 2)
		return
	end

	local n = random(1, getn(t))
	local nIndex = t[n]

	Msg2Team("Phï sinh nhÊt tr­êng, uyÓn nh­ xu©n méng; thÕ gian v¹n t­îng, huyÔn hãa th¸i h­.", 2)
	-- Trõ vµng vµ vËt phÈm xu tr­íc khi vµo Th¸i H­
	local nOldIndex = PlayerIndex
		----------------------- Chuçi nhiÖm vô ChuyÓn Sinh §¬n, l­u sè thø 4 vµ 5 ®Çu bªn ph¶i
--	local nCSD_TH = floor(GetTask(TSK_CSD_COUNT_A) / 1000)  -- CSD
--	local nNumBK = mod(GetTask(TSK_CSD_COUNT_A),1000)		--CSD
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if mod(GetTask(TSK_THAIHU_DAY), 100) < 1 then
			Pay(290000)
			SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 1)
			--=================== Chuçi nhiÖm vô Phôc Sinh 2 ==================
			if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 20 and PhucSinh2_GetMissionPart() > 0 then
				PhucSinh2_SetMissionPart()
			end
			--=============================================================
			if mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000), 100) < 30 and GetTask(TSK_CSD) == 1 then
				local nCSD_TH = (floor(GetTask(TSK_CSD_COUNT_A) / 1000) + 1) * 1000 + mod(GetTask(TSK_CSD_COUNT_A),1000)
				SetTask(TSK_CSD_COUNT_A, nCSD_TH)
			--	Msg2Player("Gia tri 4: "..nCSD_TH)
			--	Msg2Player("Gia tri 5: "..GetTask(TSK_CSD_COUNT_A))
			end
			 gf_WriteLogEx("Thai Hu Huyen Canh","tham gia thµnh c«ng",1,"Tham gia lÇn 1")
		else
			DelItem(2, 1, 30230, 20)
			SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 1)
			--=================== Chuçi nhiÖm vô Phôc Sinh 2 ==================
			if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 21 and PhucSinh2_GetMissionPart() > 0 then
				PhucSinh2_SetMissionPart()
			end
			--=============================================================
			if mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000), 100) < 30 and GetTask(TSK_CSD) == 1 then
				local nCSD_THa = (floor(GetTask(TSK_CSD_COUNT_A) / 1000) + 1) * 1000 + mod(GetTask(TSK_CSD_COUNT_A),1000)
				SetTask(TSK_CSD_COUNT_A, nCSD_THa)
			--	Msg2Player("Gia tri 4: "..nCSD_THa)
			--	Msg2Player("Gia tri 5: "..GetTask(TSK_CSD_COUNT_A))
			end
			gf_WriteLogEx("Thai Hu Huyen Canh","tham gia thµnh c«ng",1,"Tham gia lÇn 2 trë lªn")
			WriteLogEx("LOG XU VAT PHAM","Tham gia Th¸i H­ lÇn 2 trë lªn (20 xu)")
		end
		--nhiÖm vô lµm giµu
		if CFG_NhiemVuLamGiau == 1 then
			if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and  gf_GetTaskBit(TSK_LAMGIAU, 2) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 2, 1, 0)
		     		TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Hoµn thµnh 01 lÇn Th¸i H­ HuyÔn C¶nh.")
	     		end
	     end
		-----------------------Chuçi nhiÖm vô §ång Hµnh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 11 then
				DongHanh_SetStatus()
			end
		end
		-----------------------	     
	end

	PlayerIndex = nOldIndex
	SetPlayerTeamIndex()	-- ±£´æ¶ÓÔ±ÔÚ¶ÓÎéÖÐµÄÎ»ÖÃ
	ClearMonster(nIndex)
	Move2Stage(nIndex)
end

function Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    local OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

function CreateMonster(nZone, nType)
	local nMapid = GetWorldPos()
	if not (nMapid == 2010 or nMapid == 1010 or nMapid == 3010) then
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		RemoveTrigger(GetTrigger(TRIGGER_KILL))
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		return
	end
	
	local n = mod(random(4315511), 100)
	local nMonsterType = 0
	if nType == 0 then
		if n < 75 then
			nMonsterType = 1
		else
			nMonsterType = 2
		end
	elseif nType == 1 then
		if n < 25 then
			nMonsterType = 4
		elseif n < 75 then
			nMonsterType = 1
		else
			nMonsterType = 2
		end
	end

	local t = tMonsterType[nMonsterType];
	n = random(1, getn(t));
	local szMonsterName = t[n];
	local szMonsterMode = "";
	if nMonsterType == 2 then		-- ÐÞÎª¹ÖÒ²ÓÃ¾­Ñé¹ÖÄ£°å
		szMonsterMode = tMonsterType[1][n];
	else
		szMonsterMode = t[n];
	end

	local x, y
	for i = 3, FILE_ROW_COUNT do
		x = GetTabData(i, nZone * 2 + 1)
		y = GetTabData(i, nZone * 2 + 2)
		local npcIndex = CreateNpc(szMonsterMode, szMonsterName, nMapid, x, y)
		AddGroupUnit(nZone + GROUP_OFFSET, npcIndex)
	end
	
	-- ¼ÇÂ¼µ±Ç°Ë¢¹ÖÀàÐÍ
	SetTaskTemp(TAIXU_MONSTER_TYPE, nMonsterType)
end

function GiveAward(nType)
	local nMonsterCount = FILE_ROW_COUNT - 2		-- ¹ÖÎï×ÜÊý
	local nTeamSize = 0
	local nRouteCount = 0
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nTeamSize = GetTaskTemp(TAIXU_TEAM_SIZE)
		nRouteCount = GetTaskTemp(TAIXU_RINGS_MAX)
	end
	--============= Th­ëng v­ît ¶i
	ThaiHu_ThuongVuotAi()
	--===========================
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if nType == 1 then	--¾­Ñé
			local nExpAll = nMonsterCount * ONE_MONSTER_EXP * nRouteCount
			local nExp = floor(nExpAll / nTeamSize)
			-- ¾­ÑéÉÏÏß
			if nExp > MAX_MONSTER_COUNT * ONE_MONSTER_EXP then
				nExp = MAX_MONSTER_COUNT * ONE_MONSTER_EXP
				WriteLog("** Th¸i H­ HuyÔn C¶nh, trÞ kinh nghiÖm ®· v­ît møc, FILE_ROW_COUNT = "..FILE_ROW_COUNT..", sè lÇn ®¸nh qu¸i nhiÒu nhÊt= "..nRouteCount..", sè ng­êi ®éi ngò tr­íc= "..nTeamSize)
			end
--			ModifyExp(nExp)
--			Msg2Player("§éi ngò tæng céng nhËn ®­îc"..nExpAll.." ®iÓm kinh nghiÖm, b×nh qu©n mçi ng­êi ®­îc"..nExp)
		elseif nType == 2 then	--ÐÞÎª
			local nPopurAll = nMonsterCount * ONE_MONSTER_POPUR * nRouteCount
			local nPopur = floor(nPopurAll / nTeamSize)
			if nPopur > MAX_MONSTER_COUNT * ONE_MONSTER_POPUR then
				nPopur = MAX_MONSTER_COUNT * ONE_MONSTER_POPUR
				WriteLog("**Th¸i H­ HuyÔn C¶nh: trÞ ®· v­ît møc, FILE_ROW_COUNT = "..FILE_ROW_COUNT..", sè lÇn ®¸nh qu¸i nhiÒu nhÊt= "..nRouteCount..", sè ng­êi ®éi ngò tr­íc= "..nTeamSize)
			end
--			ModifyPopur(nPopur)
--			Msg2Player("§éi ngò tæng céng nhËn ®­îc"..nPopurAll.." ®iÓm tu luyÖn, b×nh qu©n mçi ng­êi ®­îc "..nPopur)
		elseif nType == 3 then	--±¦Ê¯
			--AddItem(1, 0, 32, 1, 1)		--¾Å×ªÒ»¸ö£¨ÔÝÊ±£©
		end
	end
	PlayerIndex = nOldPlayer
end

function ResetPlayerStatus()
	SetLogoutRV(0)						-- ÖÐÍ¾ÖÐ¶Ïºó»Ø³Ç
	SetFightState(0)					-- ÉèÖÃÎª¿ÉÕ½¶·
	SetCreateTeam(0)					-- ¹Ø±Õ×é¶Ó¹¦ÄÜ
	--UseScrollEnable(0)					-- ½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	InteractiveEnable(1)					-- ½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
	StallEnable(1)		   				-- °ÚÌ¯¿ª¹Ø
	ForbitTrade(0)						-- ½ûÖ¹½»Ò×
	OpenFriendliness(1)					-- »Ö¸´ÌáÉýºÃ¸Ð
	SetDeathPunish(1)					-- »Ö¸´ËÀÍö³Í·£
end

function GameOver(nType)
	local nMapid = 0
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nMapid = GetTaskTemp(TAIXU_MAP_ID)
	end
	PlayerIndex = nOldPlayer
	
	if nType == 0 then		--µ¥ÈËGameOver
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_KILL))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		NewWorld(tPos[nMapid][1], tPos[nMapid][2], tPos[nMapid][3])
		ResetPlayerStatus()
		LeaveTeam()
	elseif nType == 1 then
		-- ÏÈ´¦Àí¶Ó³¤
		nOldPlayer = PlayerIndex
		PlayerIndex = GetTeamMember(0)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		SetDeathScript("")
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		for i = TAIXU_TASK_TEMP_BEGIN, TAIXU_TASK_TEMP_END do
			SetTaskTemp(i, 0)
		end
		-- È»ºó¶ÓÔ±
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if PlayerIndex > 0 then
				SetTaskTemp(TAIXU_TEAM_INDEX, 0)
				RemoveTrigger(GetTrigger(TRIGGER_RECT))
				RemoveTrigger(GetTrigger(TRIGGER_KILL))
				RemoveTrigger(GetTrigger(TRIGGER_LOG))
				NewWorld(tPos[nMapid][1], tPos[nMapid][2], tPos[nMapid][3])
				ResetPlayerStatus()
			end
		end
		PlayerIndex = nOldPlayer
		-- °ÑµØÍ¼±ê¼ÇÎªÎÞ¶Ó½øÈë
		SetMapTaskTemp(nMapid, nZone, 0)
		SetMapTaskTemp(nMapid, nZone + 4, 0)
		SetGroupLifeTime(nZone + GROUP_OFFSET, 1)
		ClearGroup(nZone + GROUP_OFFSET)
	end
end

function no()

end


function Hewei()
	Say("Cöu Thiªn HuyÒn N÷ lÊy tam thu thanh lé vµ b¸ch hoa qu¶ mËt lµm ra nhiÒu lo¹i linh thó; ngoµi ra cßn lÊy m©y mï luyÖn ngò s¾c kú th¹ch ®Æt chóng t¹i mét thÕ giíi huyÒn ¶o cã tªn Th¸i H­. Phµm ai vµo ®­îc trong ®Òu to¹i nguyÖn.",
		1, "Ta chØ hái th«i!/no")
end

function Ruhe()
	Say("ChØ cÇn <color=yellow>tæ ®éi<color> mang theo <color=yellow>1 Th¸i H­ §a MËt qu¶<color> ®Õn t×m bÇn ®¹o lµ ®­îc. Th¸i H­ HuyÔn C¶nh lµ chèn thÇn tiªn mçi ngµy chØ vµo ®­îc tèi ®a <color=yellow>1 lÇn<color>.",
		1, "Ta chØ hái th«i!/no")
end

-- ÔÚ½øÈëÇ°ÅÐ¶ÏËùÓÐ¶ÓÔ±ÊÇ·ñÔÚÍ¬Ò»¸ö³ÇÀï
function AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--Ëæ±ãÈ¡Ò»¸ö¶ÓÔ±µÄworldpos
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function SleepCheck()
	local nTeamSize = 0
	local szExMsg = ""
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsSleeping() == 1 then
			szExMsg = szExMsg..GetName()..", "
		else
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if szExMsg ~= "" then
	    local nLen = strlen(szExMsg)
	    szExMsg = strsub(szExMsg, 1, nLen - 2)
	    szExMsg = szExMsg.."Kh«ng thÓ vµo Th¸i H­ HuyÔn C¶nh (®ang ®ãng)"
	end
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1, szExMsg
	else
		return 0, szExMsg
	end
end

function SetPlayerTeamIndex()
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetTaskTemp(TAIXU_TEAM_INDEX, i)
		WriteLogEx("Thai Hu Huyen Canh", "Tham gia");
	end
	PlayerIndex = nOldIndex
end
-- ReSet qua ngµy
--function ReSetDateTH()
--	local nDate = tonumber(date("%y%m%d"))
--	local nOldIndex = PlayerIndex
--	for i=1, GetTeamSize() do
--		PlayerIndex = GetTeamMember(i)
--		if floor( GetTask(TSK_THAIHU_DAY)/100) ~= nDate then
--			SetTask(TSK_THAIHU_DAY,nDate*100)
--		end
--	end
--	PlayerIndex = nOldIndex
--end
-- Check xem thµnh viªn trong tæ ®éi ®· tham gia 6 lÇn trong ngµy ch­a
function CheckMaxJoinCount()
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCount =	mod(GetTask(TSK_THAIHU_DAY),100)
		if nCount >= 6 then
			gf_Msg2Team("Tæ ®éi cña b¹n cã thµnh viªn "..GetName().." ®· tham gia 6 lÇn",2)
			return 0
		elseif nCount < 1 then
			if GetCash()<290000 then
				gf_Msg2Team("Tæ ®éi cña b¹n cã thµnh viªn "..GetName().." kh«ng cã 29 vµng",2)
				return 0
			end
		elseif nCount >= 1 and nCount <= 6 then
			if GetItemCount(2,1,30230) < 20 then
				gf_Msg2Team("Tæ ®éi cña b¹n cã thµnh viªn "..GetName().." kh«ng cã 20 xu vËt phÈm",2)
				return 0
			end
		end
	end
	PlayerIndex = nOldIndex
	return 1
end


function Award_Max()
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	local nCheck =	floor(GetTask(TSK_THAIHU_DAY)/100)
	if nCheck > 0 then
		Talk(1,"","PhÇn th­ëng h«m nay ®· nhËn råi, mai tiÕp tôc cè g¾ng nhÐ!");
		return 0
	end
	local tbAward = {fn="RandomAward()",	nDanhvong = 60, nSumon = 60, nExp = 24000000
	}	--nGold = 100000, item={{gdp={2,1,2652	,20}, name = "XÝch ThiÕt Tinh"}, {gdp={2,1,3219,1}, name="NguyÖt Hoa Chi Tinh"}},	
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward)
	SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 100)
	gf_WriteLogEx("Thai Hu Huyen Canh","nhËn",1,"PhÇn th­ëng cuèi")
end

function RandomAward()
	local tbAward_ThaiHu = {
								{1, 2500, "L¹c Mai", {1, 1, 16, 5}},
								{1, 2500, "Méc Lan Xu©n", {1, 1, 18, 5}},
								{1, 2000, "B¸nh Bét Vµng", {1, 1, 15, 5}},
								{1, 2000, "T©y B¾c Väng", {1, 1, 19, 5}},
								{1, 999, "Minh D¹ NguyÖt", {1, 1, 17, 5}},
								{1, 1, "Tµng R­¬ng", {2, 1, 30341, 2}},
							}
	gf_EventGiveRandAward(tbAward_ThaiHu, 10000,1,"Thai Hu Huyen Canh","phÇn th­ëng ngÉu nhiªn")							
end