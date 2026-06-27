
-- Creator : lizhi
-- ¹¥³ÇÕ½ÀÞÌ¨ 2007-3-29 10:43
-- ×¢Òâ: ËùÓÐÀÞÌ¨ºÍ±¨ÃûµØµã¶¼±ØÐëÔÚÍ¬Ò»Ì¨·þÎñÆ÷,·ñÔò¾ÍÍêµ°

Include("\\script\\lib\\writelog.lua");

-- ³ÇÊÐ
CITY_ID_CD = 300		-- ³É¶¼
CITY_ID_QZ = 100		-- ÈªÖÝ
CITY_ID_XY = 350		-- ÏåÑô

--·þÎñÆ÷È«¾Ö±äÁ¿£¬¼ÇÂ¼´Ë´Î²ÎÓë¹¥³ÇÕ½×Ê¸ñ¾ºÕùµÄÀàÐÍ£º1£¬¹¥³ÇÀÞÌ¨ 2£¬¾ºÍ¶ÌôÕ½Áî
CITY_GLB_VALUE_TYPE = 1019;

--Ëæ»úÒ»ÖÖ»ñµÃ¹¥³ÇÕ½È¨ÏÞµÄ·½·¨
tSignMethod = {
	"L«i ®µi C«ng thµnh chiÕn",
	"§Êu gi¸ khiªu chiÕn lÖnh",
};

tSignUpCityName =
{
	[100] = "TuyÒn Ch©u",
	[300] = "Thµnh §«",
	[200] = "BiÖn Kinh",
}

tFightCityName =
{
	[CITY_ID_CD] = "Thµnh §«",
	[CITY_ID_QZ] = "TuyÒn Ch©u",
	[CITY_ID_XY] = "T­¬ng D­¬ng",
}

-- ±¨ÃûµÄµØÍ¼ID
CITY_SIGNUP_MAP_ID = 300

-- ¶ÔÓ¦³ÇÊÐÀÞÌ¨µØÍ¼ID
tArenaMapID =
{
	[CITY_ID_CD] = {839, 840, 841, 842},
	[CITY_ID_QZ] = {839, 840, 841, 842},
	[CITY_ID_XY] = {839, 840, 841, 842},
}

-- ´«ËÍ½øÀÞÌ¨µÄ×ø±ê
tArenaMapPos =
{
	[839] = {1600, 3238},
	[840] = {1600, 3238},
	[841] = {1600, 3238},
	[842] = {1600, 3238},
}

-- ³ö³¡µÄ×ø±ê
tLeavePos = {CITY_SIGNUP_MAP_ID, 1857, 3555}

-- ¶ÔÓ¦Ê±¼ä¿ªÆôÀÞÌ¨±í
tHourCity = 
{
	[19] = CITY_ID_CD,
--	[20] = CITY_ID_QZ,
--	[21] = CITY_ID_XY,
}

-- mission ID
RECORD_MISSION_ID = 37
ARENA_MISSION_ID = 38

-- timer
TIMER_ID = 66
TIME_SEC = 10
ARENA_TIME_SEC = 5
TIMER_INTERVAL = TIME_SEC * 18
ARENA_TIME_INTERVAL = ARENA_TIME_SEC * 18

RECORD_SIGNUP_TIME = 10 * 60 * 18			-- 10·ÖÖÓ±¨ÃûÊ±¼ä
RECORD_RAND_TIME = 	TIMER_INTERVAL			-- 1 tickËæ»ú·ÖÅä¶ÓÎéÊ±¼ä(·¢´ôÊ±¼ä)
ARENA_PREPARE_TIME = 3 * 60 * 18			-- 3·ÖÖÓ×¼±¸Ê±¼ä
ARENA_FIGHT_TIME = 7 * 60 * 18				-- 7·ÖÖÓ¿ª´òÊ±¼ä

RECORD_SIGNUP_TIME_INTERVAL = floor(RECORD_SIGNUP_TIME / TIMER_INTERVAL)	-- ±¨ÃûÊ±¼ä½áÊø
RECORD_RAND_TIME_INTERVAL = floor(RECORD_RAND_TIME / TIMER_INTERVAL)			-- Ëæ»ú·ÖÅä¶ÓÎéÊ±¼ä½áÊø
ARENA_PREPARE_TIME_INTERVAL = floor(ARENA_PREPARE_TIME / TIMER_INTERVAL)		-- ¿ª´ò×¼±¸Ê±¼ä
ARENA_FIGHT_TIME_INTERVAL = floor(ARENA_FIGHT_TIME / TIMER_INTERVAL)			-- ¿ª´òÊ±¼ä

SUB_ARENA_PREPARE_TIME_END = floor(ARENA_PREPARE_TIME / ARENA_TIME_INTERVAL)		-- ¿ª´ò×¼±¸µÄ½áÊøÊ±¼ä
SUB_ARENA_FIGHT_TIME_END = floor(ARENA_FIGHT_TIME / ARENA_TIME_INTERVAL)			-- ¿ª´òµÄ½áÊøÊ±¼ä

MAX_TEAM_COUNT = 8							-- ×î¶àÒ»´ÎÄÜ±¨ÃûµÄ¶ÓÎéÊý

-- RECORD MISSION STATE
NO_START = 0
SIGNUP_TIME = 1
VIEW_TIME = 2
PREPARE_TIME = 3
FIGHT_TIME = 4

-- CAMP ID
CAMP_FIGHT1 = 1
CAMP_FIGHT2 = 2
CAMP_VIEWER = 3

MAX_VIEWER = 20

SKILLENABLE = 1906		--ÊÇ·ñÄÜ¹»Ê¹ÓÃÎä¹¦

-- LOG
LOG_SIEGE_ERROR = 1

function LOG_SIEGE(nLogGenre, szMsg)
	if nLogGenre == LOG_SIEGE_ERROR then
		local szErrorMsg = "C«ng thµnh chiÕn-L«i ®µi-Lçi : "..szMsg
		print(szErrorMsg)
		WriteLog(szErrorMsg)
	end
end
