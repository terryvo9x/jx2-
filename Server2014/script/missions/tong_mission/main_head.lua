--create date:2007-07-04
--author:yanjun
--describe:°ï»á¹Ø¿¨Í·ÎÄ¼þ
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tong_mission\\fields.lua");
Include("\\script\\missions\\tong_mission\\position.lua");
Include("\\script\\missions\\tong_mission\\stage\\npc_info.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage1.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage2.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage3.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage4.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage5.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage6.lua");
DEBUG_VERSION = 0;		--µ÷ÊÔ°æ±¾£¿
LIMIT_VERSION = 1;		--ÏÞÖÆ°æ±¾£¿
--==========ÒÔÏ¢ÊÇMissionÏµ¹ØµÄ³£Á¿¶¨Òå====================================================
MISSION_ID = 36;									--MissionµÄID
ALL_CAMP = 0;
TIMER_ID = 64;										--¼ÆÊ±Æ÷µÄID
ASSI_TIMER_ID = 65;									--¸¨Öú¼ÆÊ±Æ÷ID
LOG_ID = 206;										--µÇ¢½´¥·¢Æ÷ID
LOG_CUSTOM_ID = 262;								--µÇ¢½´¥·¢Æ÷×Ô¶¨Òå±µºÅ
--=========================================================================================
FRAME_PER_SECOND = 18;								--ÓÎÏ·ÔËÐÐËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--Ã¿·ÖÖÓÓÎÏ·Ö¡Êý
--¶¨Òå¸÷¸ö½×¶ÎµÄ³ÖÐøÊ±¼ä£¬Ö»ÄÜÌîÕûÊý£¬µ¥Î»ÎªÃë=============================================
READY_TIME = 2*60;									--×¼±¸Ê±¼ä
STARTED_TIME = 0;									--½øÐÐÊ±¼äÊ±¼ä£¬Ìî£°±íÊ¾ÎÞÏÞÊ±
ENDING_TIME = 1*60;									--µÈ´ý½áÊøÊ±¼ä
--¶¨Òå¸÷¸ö½×¶Î¼ÆÊ±Æ÷µÄ´¥·¢¼ä¸ô=============================================================
READY_TIMER_INTERVAL = 1*60;							--¼ÆÊ±Æ÷´¥·¢µÄÊ±¼ä¼ä¸ô£¬µ¥Î»Ãë
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1*60;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS±äÁ¿=============================================================================
MS_TONG_NAME = 1;									--¼Ç¢¼°ï»áµÄÃû×Ö
--MissionV±äÁ¿=============================================================================
MV_MISSION_STATE = 1;								--¼Ç¢¼Mission×´Ì¬
MV_TIMER_LOOP = 2;									--¼Ç¢¼¼ÆÊ±Æ÷µÄ¼ÆÊý
MV_MISSION_UID = 3;									--¼Ç¢¼MissionµÄÎ¨Ò»ID
MV_WEEK = 4											--¼Ç¢¼¿ªÊ¼¹Ø¿¨Ê±Ëù´¦µÄweek
MV_KILL_SUB_NPC = 5;								--¼Ç¢¼É±ËÀÌæ²¹ÇøNPCµÄÊýÁ¿
MV_TIMER_TRIGGER_STATE = 6;							--¼Ç¢¼¹Ø¿¨×Ô¶¨ÒåµÄÊ±¼ä´¥·¢Æ÷µÄ×´Ì¬£¬1±íÊ¾ÔËÐÐÖÐ£¬0±íÊ¾Í£Ö¹
MV_GET_BOX = 7;										--¼Ç¢¼ÊÇ·ñÊ°È¡ÁË±¦Ïä
MV_APPLY_TIME = 8;									--¼Ç¢¼ÉÏ´ÎÍæ¼ÒÌá³öÉêÇëµÄÊ±¼ä
MV_ENTER_TIME = 9;									--¼Ç¢¼ÉÏ´ÎÍæ¼Ò½øÈëÄÚÌÃµÄÊ±¼ä
MV_CHECK_POINT = 10;								--¼ì²éµã
MV_STAGE = 11;										--¼Ç¢¼µ±Ç°´¦ÓÚµÚ¼¸¹Ø
MV_STAGE_OVER = 12;									--±ê¼Çµ±Ç°ÊÇ·ñ¹ý¹Ø
MV_STAGE_START_TIME = 13;							--¼Ç¢¼¹Ø¿¨¿ªÊ¼Ê±¼ä
MV_BOSS1 = 14;										--BOSS1µÄË÷Òý
MV_BOSS2 = 15;										--BOSS2µÄË÷Òý
MV_NPC_COUNT = 16;									--¼Ç¢¼NPCµÄÊýÁ¿
MV_FAC_NPC_COUNT = 17;								--¼Ç¢¼ÃÅÅÉÀµNPCµÄÊýÁ¿
MV_BOSS_COUNT = 18;									--¼Ç¢¼BOSSµÄÊýÁ¿
MV_STAGE_STARTED = 19;								--±ê¼ÇÊÇ·ñÒÑÕýÊ½¿ªÊ¼¹Ø¿¨(Õâ¸ö±äÁ¿ÓÐµã¶µÓµ£¬ÔÝÊ±Ã»Æð×÷ÓÃ)
MV_CITY_MAP_ID = 20;								--¼Ç¢¼Õâ¸ö¹Ø¿¨ÊÇÔÚÄÄ¸ö³ÇÊÐµÄ

MV_VALUE1 	= 21;									--STAGEµÄ¹²ÓÃ±äÁ¿
MV_VALUE2 	= 22;									--²»Í¬¹Ø¿¨ÓÐ²»Í¬µÄÒâÒå
MV_VALUE3 	= 23;									--Ê¹ÓÃÊ±ÇëÔÚ½Å±¾ÖÐ±êÃ÷¸ÃÖµµÄº¬Òå
MV_VALUE4 	= 24;
MV_VALUE5 	= 25;
MV_VALUE6 	= 26;
MV_VALUE7 	= 27;
MV_VALUE8 	= 28;
MV_VALUE9 	= 29;
MV_VALUE10 	= 30;

--Mission×´Ì¬¼¯============================================================================
MS_STATE_IDEL = 0;									--³¡µØ¿ÕÏÐ
MS_STATE_READY = 1;									--×¼±¸½×¶Î
MS_STATE_STARTED = 2;								--¿ªÊ¼½×¶Î
MS_STATE_ENDING = 3;								--µÈ´ý½áÊø½×¶Î
--=========================================================================================
--===========ÒÔÏ¢ÊÇ¹Ø¿¨ÉèÖÃ³£Á¿============================================================
MAX_STAGE = 6;					--×î´ó¹Ø¿¨Êý
MAX_AREA = 2;					--Ã¿Ì¨·þÎñÆ÷µÄÇøÊýÁ¿
MAX_FIELD = 3;					--Ã¿¸öÇøµÄ³¡µØÊýÁ¿
MAX_NORMAL_PLAYER_COUNT = 16;	--×î´óÕýÑ¡Íæ¼ÒÊý
MAX_PLAYER_COUNT = 60;			--×î´óÍæ¼ÒÊý£¬Õâ¸öÊý¼õÈ¥ÕýÑ¡Íæ¼ÒÊý¾ÍÊÇÌæ²¹Íæ¼ÒÊý
MAX_ROUTE_PLAYER_COUNT = 3;		--ÄÚÌÃ×î´óÏµÍ¬Ö°ÒµÍæ¼ÒÊýÁ¿
MIN_ENTER_INTERVAL = 2*60;		--×îÐ¡½øÈëÊ±¼ä¼ä¸ô
MIN_APPLY_INTERVAL = 60;		--¸öÈË×îÐ¡ÉêÇëÊ±¼ä¼ä¸ô
MIN_MS_APPLY_INTERVAL = 30;		--MissionµÄ×îÐ¡ÉêÇëÊ±¼ä¼ä¸ô
MIN_TEAM_MEMBER = 0;			--×îÐ¡¶ÓÎéÈËÊý
MIN_LEVEL = 75;					--×îÐ¡ÒªÇóµÈ¼¶
MIN_JOIN_TONG_DAY = 0;			--×îÐ¡Èë°ïÊ±¼ä
MIN_PLAYER_COUNT = 0;			--×îÉÙÍæ¼ÒÊý
MIN_KILL_SUB_NPC_COUNT = 300;	--»ñµÃÍâÌÃ½±ÀøÒªÉ±µÄ×îÉÙÍâÌÃÐ¡¹ÖÊýÁ¿
KILL_SUB_NPC_POINT = 100;		--É±ÍâÌÃÐ¡¹ÖËù»ñµÄ¶îÍâ»ý·Ö
SUB_NPC_COUNT = 20;				--ÍâÌÃÐ¡¹ÖË¢Ð¢ÊýÁ¿
--=========================================================================================

--Relay¹²ÏíÊý¾Ýkey=========================================================================
KEY_WEEK = "tong_mission_key_week";	--±£´æ°ï»áÔÚÄÄÒ»ÖÜÍ¨¹ØÁË£¨Äê·ÝÓëÖÜÊý×é³ÉµÄÊý¾Ý£©
KEY_STAGE = "tong_mission_key_stage";	--±£´æ°ï»áµ±Ç°¹Ø¿¨
KEY_ATTEND = "tong_mission_key_attend"	--²ÎÓë´³¹ØµÄÄê·ÝÓëÖÜÊý
--===================ÒÔÏ¢ÊÇÈÎÎñ±äÁ¿(650-660)========================================================
TSK_BEGIN = 650;
TSK_WEEK = 650;				--¼Ç¢¼ÉÏ´Î´³¹ØÊÇ½ñÄêµÄµÚ¼¸ÖÜ
TSK_APPLY_TIME = 651;		--¼Ç¢¼ÉÏ´ÎÉêÇë½øÈëÄÚÌÃµÄÊ±¼ä
TSK_POINT = 652;			--¼Ç¢¼Íæ¼Ò¸öÈË¹Ø¿¨»ý·Ö
TSK_ATTEND_STAGE_1 = 653;	--¼Ç¢¼Ã¿ÖÜÍ¨¹ýµÚ1¹ØµÄ´ÎÊý
TSK_ATTEND_STAGE_2 = 654;	--¼Ç¢¼Ã¿ÖÜÍ¨¹ýµÚ2¹ØµÄ´ÎÊý
TSK_ATTEND_STAGE_3 = 655;	--¼Ç¢¼Ã¿ÖÜÍ¨¹ýµÚ3¹ØµÄ´ÎÊý
TSK_ATTEND_STAGE_4 = 656;	--¼Ç¢¼Ã¿ÖÜÍ¨¹ýµÚ4¹ØµÄ´ÎÊý
TSK_ATTEND_STAGE_5 = 657;	--¼Ç¢¼Ã¿ÖÜÍ¨¹ýµÚ5¹ØµÄ´ÎÊý
TSK_ATTEND_STAGE_6 = 658;	--¼Ç¢¼Ã¿ÖÜÍ¨¹ýµÚ6¹ØµÄ´ÎÊý
TSK_END = 660;
--===================ÒÔÏ¢ÊÇÁÙÊ±ÈÎÎñ±äÁ¿(61-69)====================================================
TEMP_BEGIN = 61;
TSK_TEMP_STATUS = 61;								--±ê¼ÇÍæ¼ÒÉí·Ý£¬0ÎªÌæ²¹£¬1ÎªÕýÑ¡
TSK_TEMP_AREA_IDX = 62;								--¼Ç¢¼ÇøÓòË÷Òý
TSK_TEMP_FIELD_IDX = 63;							--¼Ç¢¼³¡µØË÷Òý
TSK_TEMP_MAP_ID = 64;								--¼Ç¢¼½øÈëÊ±µÄµØÍ¼ID
TSK_TEMP_HELPER = 65;								--±ê¼ÇÊÇ·ñÎªÍâÔ®
TEMP_END = 69;
--=========================================================================================
TONG_MISSIONEX = "tong_mission";	--missionExµÄÃû×Ö
--=========================================================================================
GLB_CLEAR_FIELD = 81;				--·þÎñÆ÷±äÁ¿£¬¼Ç¢¼ÊÇ·ñÇë¹ý³¡µØ
--=========================================================================================
TB_BOSS_INFO = 
{
	[0] = "Ch­íng khÝ cña Th­îng Cæ ThÇn Thó tô l¹i thµnh bãng ng­êi, muèn tiªu diÖt ph¶i dïng m«n ph¶i ®èi øng, nÕu kh«ng sÏ håi sinh. NÕu nh­ ®Ó bãng hé vÖ tô tËp qu¸ nhiÒu sÏ dÉn ®Õn v­ît ¶i thÊt b¹i.",
	[1] = "\nThuéc tÝnh vµ kü n¨ng ®Æc thï cña Boss: lµm mÊt m¸u ph¹m vi lín\nTiÓu qu¸i ®Æc thï: Li Phñ N÷ T­íng (Sö dông kü n¨ng ®éc s¸t ë ph¹m vi nhá), mçi mét giai ®o¹n sÏ hiÖn thªm Li Yªn hç trî. \nBãng hé vÖ cã: ",
	[2] = "\nThuéc tÝnh vµ kü n¨ng ®Æc thï cña Boss: Håi sinh (Trong suèt thêi gian ë ¶i nµy Boss sÏ sö dông Gia y ThÇn C«ng ®Ó håi sinh b¶n th©n, tæng thêi gian håi sinh lµ 3 lÇn, nÕu nh­ trong thêi gian nhÊt ®Þnh mµ ®¸nh chÕt Boss 4 lÇn sÏ kh«ng håi sinh thªm n÷a, nÕu kh«ng v­ît ¶i sÏ thÊt b¹i).\nTiÓu qu¸i ®Æc thï: CÊm VÖ Binh (SÏ sö dông kü n¨ng c­êng lùc ®Ó c«ng kÝch v× vËy cÇn ph¶i nhanh chãng tiªu diÖt) \nBãng hé vÖ cã: ",
	[3] = "\nThuéc tÝnh vµ kü n¨ng ®Æc thï cña Boss: \nHai tay nh­ mét (Mçi giai ®o¹n sÏ lµm ng­êi ch¬i mÊt 50% sinh lùc, kho¶ng c¸ch hai boss h¬n 30 sÏ hñy bá)\nVËt ®æi sao dêi (Mçi giai ®o¹n thêi gian sÏ lµm ng­êi ch¬i mÊt 5% sinh lùc vµ duy tr× trong vßng 20 gi©y,  khi hai boss cã kho¶ng c¸ch lín h¬n 10 th× sÏ hñy bá béc ph¸t) \nTiÓu qu¸i ®Æc thï: Tø §¹i  TiÖn Nh©n (NÕu mét trong bèn con chÕt th× ph¶i giÕt hÕt cßn l¹i nÕu kh«ng sÏ håi sinh nh­ cò) \nBãng hé vÖ cã: ",
	[4] = "\nThuéc tÝnh vµ kü n¨ng ®Æc thï cña Boss: L«i §×nh NhÊt KÝch (Mçi lÇn phãng ra sÏ g©y mÊt 10% sinh lùc, vµ sÏ lµm tÊt c¶ mäi ng­êi ®Þnh thÇn 1 ®o¹n thêi gian \nC¬ quan thuËt:  Kh¾p néi ®­êng sÏ cã ®Çy rÉy nh÷ng c¬ quan, theo tuÇn tù tõ tr¸i sang ph¶i ho¹t ®«ng \nBãng hé vÖ cã:",
	[5] = "\nThuéc tÝnh vµ kü n¨ng ®Æc thï cña Boss: Kh«ng cã\nTiÓu qu¸i ®Æc thï: C¬ quan (Khi c¬ quan ph¸ hñy sÏ t¹o thµnh 5% tæn th­¬ng c¸c c¬ quan xung quanh), ¸c khuyÓn \nBãng hé vÖ: kh«ng",
	[6] = "\nThuéc tÝnh vµ kü n¨ng ®Æc thï cña Boss: \nHáa Vò: mçi 20 gi©y sinh lùc håi phôc 1%\nL­u Quang: Mçi 20 gi©y sinh lùc gi¶m 1%\nDi Hoa TiÕp Méc: Mçi mét ®o¹n thêi gian Háa Vò sÏ chuyÓn cho L­u Quang 6% sinh lùc\nPhèi hîp sai vÒ ©m d­¬ng: Khi phÇn tr¨m sinh lùc cña Háa Vò vµ L­u Quang kh«ng b»ng nhau sÏ t¹o cho ng­êi ch¬i chÞu mét lùc s¸t th­¬ng liªn tiÕp, chªnh lÖch cµng cao th× s¸t th­¬ng cµng m¹nh.\nBãng hé vÖ cã: ",
}

TB_STAGE = 			--¸÷¸ö¹Ø¿¨Ëù¶ÔÓ¦µÄÀµ£¨¼´table£©
{
	[1] = CSTAGE1,
	[2] = CSTAGE2,
	[3] = CSTAGE3,
	[4] = CSTAGE4,
	[5] = CSTAGE5,
	[6] = CSTAGE6,
}
