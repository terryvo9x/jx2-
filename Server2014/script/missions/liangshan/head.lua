Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\missions\\liangshan\\string_liangshan.lua")
Include("\\script\\lib\\globalfunctions.lua");
--2011008ÖÐÇï»î¶¯
Include("\\script\\online_activites\\award.lua")

--201207°ÂÔË»î¶¯
Include("\\script\\online\\olympic\\oly_head.lua")

--×·»Ø×ÖÌû´ó×÷Õ½
Include("\\script\\online\\dazitie\\dzt_head.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\missions\\liangshan\\npc\\box_jingli.lua")

Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

--=================

LS_EXP_ADD_RATE = min(VNG_CFG_LS_EXP_EXT_ADD_RATE or 0, 2) --¾­Ñé¼Ó³ÉÏµÊý
T_ROUTE_CNT_EXP_ADD_RATE = {
	0,0,0,0,0.2,0.4,0.6,1
}
function getRouteCount()
	local tRoute = {}
	local nRouteCnt = 0
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			local nRoute = GetPlayerRoute();
			if not tRoute[nRoute] then
				tRoute[nRoute] = 1
				nRouteCnt = nRouteCnt + 1
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	return nRouteCnt
end
--Ã¿¹Ø¾­Ñé½±Àø
T_LS_AWARD_EXP_STAGE = {
	[1] = 2000000,
	[2] = 2500000,
	[3] = 3000000,
	[4] = 3500000,
	[5] = 4000000,
	[6] = 4000000,
	[7] = 4000000,
	[8] = 4500000,
}

--===´å³¤£º2011-2-18Ôö¼ÓÅäÖÃÎÄ¼þÏà¹Ø²Ù×÷
Include("\\script\\class\\ktabfile.lua")
LUONGSON_LOG_TITLE = "Vuot ai Luong Son Bac"
--ÅäÖÃÎÄ¼þÐÅÏ¢
SZ_INI_FILE_WAY = "\\settings\\missions\\liangshan\\liangshan.ini"
g_objLSRule = ff_GetIniFileObj(SZ_INI_FILE_WAY)
if g_objLSRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SZ_INI_FILE_WAY)
end
--¹Ø¼ü×ÖÐÅÏ¢
IniPosKey="pos_info"				--È¡×ø±êÅäÖÃµÄ¹Ø¼ü×Ö
IniLoginQuanliKey="login_quanli"	--´³¹ØÌõ¼þ¹Ø¼ü×Ö
IniItemKey="item_info"				--ÎïÆ·ÐÅÏ¢
IniMissionKey="mission_info"		--¹Ø¿¨¹Ø¼ü×ÖÐÅÏ¢
IniStage1Key="stage1_rule"			--¹Ø¿¨¹æÔò¹Ø¼ü×Ö
IniPrizeChgKey="prize_change"		--½±Àø¶Ò»»¹æÔò
--Êý¾ÝÕûÀíÐÅÏ¢
NTeamMemberMin = g_objLSRule:GetNum(IniLoginQuanliKey,"TeamMemberMin")
NPlayerLevelMin = g_objLSRule:GetNum(IniLoginQuanliKey,"PlayerLevelMin")
TTGLInfo = g_objLSRule:GetMixTable(IniItemKey,"TianGangLing")
TJYLInfo = g_objLSRule:GetMixTable(IniItemKey,"JuYiLing")
LSTaskBag1 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag1")
LSTaskBag2 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag2")
LSTaskBag3 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag3")
TStageBaseInfo =g_objLSRule:GetNumTable(IniPosKey,"StageBasePos")
	--ÎåÐÐÐþÊ¯ÎïÆ·ÐÅÏ¢
LsPrizeWXXS = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeWXXS")
	--ÎïÆ·¶Ò»»ÐÅÏ¢
TJiuzhouChgInfo = g_objLSRule:GetMixTable(IniPrizeChgKey,"JiuzhouSets")
TXuanyuanChgInfo = g_objLSRule:GetMixTable(IniPrizeChgKey,"XuanyuanSets")
TOthersChgInfo = {
	g_objLSRule:GetMixTable(IniPrizeChgKey,"OtherItems1"),
	g_objLSRule:GetMixTable(IniPrizeChgKey,"OtherItems2"),
}
nWXXSGetEveryDayMax = g_objLSRule:GetNum(IniPrizeChgKey,"WXXSGetEveryDayMax")
--===end
g_RealMapId = 6007;		--Ô­µØÍ¼id
MISSION_ID	= 55;		--MISSION_IDÐèÒª¸ü¸Ä
TIMER_ID	= 85;		--´¥·¢Æ÷ID
ALL_CAMP	= 0;
DAY_SECOND_NUM = 24*3600

--µÇÂ½¹Ø¿¨×ø±ê
entryPos = g_objLSRule:GetNumTable(IniPosKey,"EnterMsPos")
--Àë¿ª¹Ø¿¨×ø±ê
local LeavePos = g_objLSRule:GetNumTable(IniPosKey,"LeaveMsPos")
returnPos = {
	[LeavePos[1][1]] = {LeavePos[1][2], LeavePos[1][3]},
	[LeavePos[2][1]] = {LeavePos[2][2], LeavePos[2][3]},
	[LeavePos[3][1]] = {LeavePos[3][2], LeavePos[3][3]},
}
--¾ÅÖÝ×°±¸
TJiuzhouHead = {
	{
		{"Long §»ng Tø H¶i Qu¸n",0,103,3056,0},{"Long §»ng Tø H¶i Qu¸n",0,103,3057,0},{"Long §»ng Tø H¶i Qu¸n",0,103,3058,0},{"Long §»ng Tø H¶i Qu¸n",0,103,3059,0}
	},{
		{"Phông Vò Cöu Thiªn Qu¸n",0,103,3060,0},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3061,0},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3062,0},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3063,0}
	}
}
TJiuzhouCloth = {
	{
		{"Long §»ng Tø H¶i Y",0,100,3056,0},{"Long §»ng Tø H¶i Y",0,100,3057,0},{"Long §»ng Tø H¶i Y",0,100,3058,0},{"Long §»ng Tø H¶i Y",0,100,3059,0}
	},{
		{"Phông Vò Cöu Thiªn Y",0,100,3060,0},{"Phông Vò Cöu Thiªn Y",0,100,3061,0},{"Phông Vò Cöu Thiªn Y",0,100,3062,0},{"Phông Vò Cöu Thiªn Y",0,100,3063,0}
	}
}
TJiuzhouShoes = {
	{
		{"Long §»ng Tø H¶i Trang",0,101,3056,0},{"Long §»ng Tø H¶i Trang",0,101,3057,0},{"Long §»ng Tø H¶i Trang",0,101,3058,0},{"Long §»ng Tø H¶i Trang",0,101,3059,0}
	},{
		{"Phông Vò Cöu Thiªn Trang",0,101,3060,0},{"Phông Vò Cöu Thiªn Trang",0,101,3061,0},{"Phông Vò Cöu Thiªn Trang",0,101,3062,0},{"Phông Vò Cöu Thiªn Trang",0,101,3063,0}
	}
}

THaoNguyet_need = 
{
	[1] = {2, "1 Nãn Tinh Kh¾c, 1 Nãn Thiªn NghÜa", {{0,103,3033,1},{0,103,3039,1},{0,103,3045,1},{0,103,3051,1},{0,103,3036,1},{0,103,3042,1},{0,103,3048,1},{0,103,3054,1}},{{0,103,3034,1},{0,103,3040,1},{0,103,3046,1},{0,103,3052,1},{0,103,3037,1},{0,103,3043,1},{0,103,3049,1},{0,103,3055,1}}},
	[2] = {2, "1 ¸o Tinh Kh¾c, 1 ¸o Thiªn NghÜa", {{0,100,3033,1},{0,100,3039,1},{0,100,3045,1},{0,100,3051,1},{0,100,3036,1},{0,100,3042,1},{0,100,3048,1},{0,100,3054,1}},{{0,100,3034,1},{0,100,3040,1},{0,100,3046,1},{0,100,3052,1},{0,100,3037,1},{0,100,3043,1},{0,100,3049,1},{0,100,3055,1}}},
	[3] = {2, "1 QuÇn Tinh Kh¾c, 1 QuÇn Thiªn NghÜa", {{0,101,3033,1},{0,101,3039,1},{0,101,3045,1},{0,101,3051,1},{0,101,3036,1},{0,101,3042,1},{0,101,3048,1},{0,101,3054,1}},{{0,101,3034,1},{0,101,3040,1},{0,101,3046,1},{0,101,3052,1},{0,101,3037,1},{0,101,3043,1},{0,101,3049,1},{0,101,3055,1}}},
	[4] = {2, "1Trang Søc Tinh Kh¾c, 1 Trang Søc Thiªn NghÜa", {{0,102,3121,1},{0,102,3124,1},{0,102,3127,1},{0,102,3130,1},{0,102,3133,1},{0,102,3122,1},{0,102,3125,1},{0,102,3128,1},{0,102,3131,1},{0,102,3134,1}}, {}},
	[5] = {2, "1 Vò KhÝ Tinh Kh¾c, 1 Vò KhÝ Thiªn NghÜa", {{0,0,8874,1},{0,0,8875,1},{0,1,8879,1},{0,2,8884,1},{0,2,8885,1},{0,3,8892,1},{0,4,8897,1},{0,5,8900,1},{0,6,8903,1},{0,7,8906,1},{0,8,8909,1},{0,9,8913,1},{0,10,8918,1},{0,11,8922,1},{0,0,8876,1},{0,0,8877,1},{0,1,8880,1},{0,2,8887,1},{0,2,8888,1},{0,3,8894,1},{0,4,8898,1},{0,5,8901,1},{0,6,8904,1},{0,7,8907,1},{0,8,8910,1},{0,9,8915,1},{0,10,8919,1},{0,11,8924,1},{0,2,8886,1},{0,13,8930,1},{0,12,8927,1},{0,2,8889,1},{0,13,8931,1},{0,12,8928,1}}, {}},
}

THaoNguyet_suc = 
{
	[1] = 
			{	
				[2] = {"H¹o NguyÖt - Nãn ThiÕu L©m Tôc", {{0,103,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H¹o NguyÖt - Nãn ThiÕu L©m ThiÒn", {{0,103,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H¹o NguyÖt - Nãn ThiÕu L©m Vâ", {{0,103,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H¹o NguyÖt - Nãn §­êng M«n", {{0,103,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H¹o NguyÖt - Nãn Nga My PhËt", {" ", " ", {0,103,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H¹o NguyÖt - Nãn Nga My Tôc", {" ", " ", {0,103,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H¹o NguyÖt - Nãn C¸i Bang TÞnh", {{0,103,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H¹o NguyÖt - Nãn C¸i Bang ¤", {{0,103,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H¹o NguyÖt - Nãn Vâ §ang §¹o", {{0,103,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H¹o NguyÖt - Nãn Vâ §ang Tôc", {{0,103,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H¹o NguyÖt - Nãn D­¬ng M«n Th­¬ng", {{0,103,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H¹o NguyÖt - Nãn D­¬ng M«n Cung", {{0,103,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H¹o NguyÖt - Nãn HiÖp §éc", {{0,103,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H¹o NguyÖt - Nãn Tµ §éc", {{0,103,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[23] = {"H¹o NguyÖt - Nãn C«n L«n", {{0,103,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H¹o NguyÖt - Nãn Thóy Yªn Vò Tiªn", {" ", " ", {0,103,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H¹o NguyÖt - Nãn Thóy Yªn Linh N÷", {" ", " ", {0,103,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[2] = 
			{	
				[2] = {"H¹o NguyÖt - ThiÕu L©m Tôc", {{0,100,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H¹o NguyÖt - ThiÕu L©m ThiÒn", {{0,100,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H¹o NguyÖt - ThiÕu L©m Vâ", {{0,100,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H¹o NguyÖt - §­êng M«n", {{0,100,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H¹o NguyÖt - Nga My PhËt", {" ", " ", {0,100,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H¹o NguyÖt - Nga My Tôc", {" ", " ", {0,100,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H¹o NguyÖt - C¸i Bang TÞnh", {{0,100,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H¹o NguyÖt - C¸i Bang ¤", {{0,100,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H¹o NguyÖt - Vâ §ang §¹o", {{0,100,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H¹o NguyÖt - Vâ §ang Tôc", {{0,100,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H¹o NguyÖt - D­¬ng M«n Th­¬ng", {{0,100,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H¹o NguyÖt - D­¬ng M«n Cung", {{0,100,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H¹o NguyÖt - HiÖp §éc", {{0,100,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H¹o NguyÖt - Tµ §éc", {{0,100,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[23] = {"H¹o NguyÖt - C«n L«n", {{0,100,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H¹o NguyÖt - Thóy Yªn Vò Tiªn", {" ", " ", {0,100,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H¹o NguyÖt - Thóy Yªn Linh N÷", {" ", " ", {0,100,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[3] = 
			{	
				[2] = {"H¹o NguyÖt - Trang ThiÕu L©m Tôc", {{0,101,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H¹o NguyÖt - Trang ThiÕu L©m ThiÒn", {{0,101,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H¹o NguyÖt - Trang ThiÕu L©m Vâ", {{0,101,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H¹o NguyÖt - Trang §­êng M«n", {{0,101,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H¹o NguyÖt - Trang Nga My PhËt", {" ", " ", {0,101,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H¹o NguyÖt - Trang Nga My Tôc", {" ", " ", {0,101,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H¹o NguyÖt - Trang C¸i Bang TÞnh", {{0,101,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H¹o NguyÖt - Trang C¸i Bang ¤", {{0,101,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H¹o NguyÖt - Trang Vâ §ang §¹o", {{0,101,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H¹o NguyÖt - Trang Vâ §ang Tôc", {{0,101,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H¹o NguyÖt - Trang D­¬ng M«n Th­¬ng", {{0,101,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H¹o NguyÖt - Trang D­¬ng M«n Cung", {{0,101,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H¹o NguyÖt - Trang HiÖp §éc", {{0,101,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H¹o NguyÖt - Trang Tµ §éc", {{0,101,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},	
				[23] = {"H¹o NguyÖt - Trang C«n L«n", {{0,101,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H¹o NguyÖt - Trang Thóy Yªn Vò Tiªn", {" ", " ", {0,101,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H¹o NguyÖt - Trang Thóy Yªn Linh N÷", {" ", " ", {0,101,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[4] = 
	     		{
				[1] = {"TS H¹o NguyÖt - XÝch T­íc", {0, 102, 3181, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[2] = {"TS H¹o NguyÖt - Tö Giao", {0, 102, 3177, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[3] = {"TS H¹o NguyÖt - V©n Hæ", {0, 102, 3179, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[4] = {"TS H¹o NguyÖt - ¤ L©n", {0, 102, 3175, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[5] = {"TS H¹o NguyÖt - BÝch Quy", {0, 102, 3183, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			},
	[5] = 
			{	
				[2] = {"H¹o NguyÖt - VK ThiÕu L©m Tôc", {0, 3, 8972, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[3] = {"H¹o NguyÖt - VK ThiÕu L©m ThiÒn", {0, 8, 8974, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[4] = {"H¹o NguyÖt - VK ThiÕu L©m Vâ", {0, 0, 8973, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[6] = {"H¹o NguyÖt - VK §­êng M«n", {0, 1, 8975, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[8] = {"H¹o NguyÖt - VK Nga My PhËt", {0, 2, 8976, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[9] = {"H¹o NguyÖt - VK  Nga My Tôc", {0, 10, 8977, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[11] = {"H¹o NguyÖt - VK C¸i Bang TÞnh", {0, 0, 8978, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[12] = {"H¹o NguyÖt - VK C¸i Bang ¤", {0, 5, 8979, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[14] = {"H¹o NguyÖt - VK Vâ §ang §¹o", {0, 2, 8980, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[15] = {"H¹o NguyÖt - VK Vâ §ang Tôc", {0, 9, 8981, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[17] = {"H¹o NguyÖt - VK D­¬ng M«n Th­¬ng", {0, 6, 8982, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[18] = {"H¹o NguyÖt - VK D­¬ng M«n Cung", {0, 4, 8983, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[20] = {"H¹o NguyÖt - VK HiÖp §éc", {0, 7, 8984, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[21] = {"H¹o NguyÖt - VKTµ §éc", {0, 11, 8985, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[23] = {"H¹o NguyÖt - VKC«n L«n", {0, 2, 8986, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[29] = {"H¹o NguyÖt - VKVò Tiªn", {0, 13, 8990, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[30] = {"H¹o NguyÖt - VKLinh N÷", {0, 12, 8991, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			},
}


tItem_need = 
{
	[1] = {30000000, 500, 250},
	[2] = {30000000, 500, 250},
	[3] = {30000000, 500, 250},
	[4] = {50000000, 700, 350},
	[5] = {40000000, 600, 300},
}

TJiuzhouWeapon = {
	[2]={"Cöu Ch©u-L­u Ly Giíi §ao",0,3,8932,0,670,1},
	[3]={"Cöu Ch©u-Kinh L«i ThiÒn Tr­îng",0,8,8934,0,672,1},
	[4]={"Cöu Ch©u-L«i ¢m Nang Thñ",0,0,8933,0,672,1},
	[6]={"Cöu Ch©u-¢m D­¬ng Xuyªn ¶nh",0,1,8935,0,671,1},
	[8]={"Cöu Ch©u-Tõ Hµn ¢m KiÕm",0,2,8936,0,672,1},
	[9]={"Cöu Ch©u-Cöu Hoµn Bèi CÇm",0,10,8937,0,672,1},
	[11]={"Cöu Ch©u-Quy L©n Hé Thñ",0,0,8938,0,670,1},
	[12]={"Cöu Ch©u-TrÊn Ng¹o C«n",0,5,8939,0,671,1},
	[14]={"Cöu Ch©u-ThuÇn Phong KiÕm",0,2,8940,0,672,1},
	[15]={"Cöu Ch©u-Tinh §Èu ChuyÓn Bót",0,9,8941,0,673,1},
	[17]={"Cöu Ch©u-Ph¸ Qu©n TrËn Th­¬ng",0,6,8942,0,670,1},
	[18]={"Cöu Ch©u-Truy MÖnh Cung",0,4,8943,0,671,1},
	[20]={"Cöu Ch©u-ThiÖp Cèt HuyÕt §ao",0,7,8944,0,671,1},
	[21]={"Cöu Ch©u-LuyÖn Hån HuyÕt Tr¶o",0,11,8945,0,673,1},
	[23]={"Cöu Ch©u-Ngù Thiªn Phong KiÕm",0,2,8946,0,672,1},
	[25]={"Cöu Ch©u-ThÇn DiÖm Thiªn §ao",0,3,8947,0,670,1,1},
	[26]={"Cöu Ch©u-ThÇn Phong Ph¸n Bót",0,9,8948,0,673,1},
	[27]={"Cöu Ch©u-ThÇn Linh Chó Tr¶o",0,11,8949,0,671,1},
	[29]={"Cöu Ch©u-Linh Lung Chi",0,13,8950,0,671,1},
	[30]={"Cöu Ch©u-Cöu Tiªu S¸o",0,12,8951,0,673,1},
}
TJiuzhouRing = {
	{
		[2] = {"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3135,},
		[3] = {"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3137,},
		[4] = {"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3139,},
		[6] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3141,},
		[8] = {"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3143,},
		[9] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3145,},
		[11] = {"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3147,},
		[12] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3149,},
		[14] = {"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3151,},
		[15] = {"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3153,},
		[17] = {"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3155,},
		[18] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3157,},
		[20] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3159,},
		[21] = {"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3161,},
		[23] = {"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3163,},
		[25] = {"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3165,},
		[26] = {"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3167,},
		[27] = {"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3169,},
		[29] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3171,},
		[30] = {"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3173,},
	},
	{
		[2] = {"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3136,},
		[3] = {"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3138,},
		[4] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3140,},
		[6] = {"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3142,},
		[8] = {"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3144,},
		[9] = {"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3146,},
		[11] = {"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3148,},
		[12] = {"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3150,},
		[14] = {"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3152,},
		[15] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3154,},
		[17] = {"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3156,},
		[18] = {"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3158,},
		[20] = {"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3160,},
		[21] = {"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3162,},
		[23] = {"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3164,},
		[25] = {"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3166,},
		[26] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3168,},
		[27] = {"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3170,},
		[29] = {"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3172,},
		[30] = {"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3174,},
	}
}
TJiuzhouEquip = {
	TJiuzhouHead,TJiuzhouCloth,TJiuzhouShoes,TJiuzhouRing,TJiuzhouWeapon
}
--ÐùÔ¯×°±¸
	--ÐùÔ¯ÎäÆ÷
TXuanyuanWeapon = {
	[2] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802}},
	[3] = {"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803},
	[4] = {"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804},
	[6] = {"Hiªn Viªn Giíi Tö Kim",0,1,8805},
	[8] = {"Hiªn Viªn Tö Tinh KiÕm",0,2,8806},
	[9] = {"Hiªn Viªn Phông Hoµng CÇm",0,10,8807},
	[11] = {"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808},
	[12] = {"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809},
	[14] = {"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810},
	[15] = {"Hiªn Viªn Sinh Tö Bót",0,9,8811},
	[17] = {"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812},
	[18] = {"Hiªn Viªn Khai Thiªn Cung",0,4,8813},
	[20] = {"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814},
	[21] = {"Hiªn Viªn U Minh Tr¶o",0,11,8815},
	[23] = {"Hiªn Viªn L«i Minh KiÕm",0,2,8816,},
	[25] = {"Hiªn Viªn Tr¶m Viªm §ao",0,3,8817,},
	[26] = {"Hiªn Viªn Quang Minh Bót",0,9,8818,},
	[27] = {"Hiªn Viªn Chó  Ên Tr¶o",0,11,8819,},
	[29] = {"Hiªn Viªn L¨ng Tiªu PhiÕn",0,13,8820,},
	[30] = {"Hiªn Viªn Phån Hoa §Þch",0,12,8821,},
}
	--ÐùÔ¯Õ½
TXuanyuanZhan = {
	[2] = {"Hiªn Viªn ChiÕn",0,102,8801},
	[3] = {"Hiªn Viªn ChiÕn",0,102,8803},
	[4] = {"Hiªn Viªn ChiÕn",0,102,8805},
	[6] = {"Hiªn Viªn ChiÕn",0,102,8807},
	[8] = {"Hiªn Viªn ChiÕn",0,102,8809},
	[9] = {"Hiªn Viªn ChiÕn",0,102,8811},
	[11] = {"Hiªn Viªn ChiÕn",0,102,8813},
	[12] = {"Hiªn Viªn ChiÕn",0,102,8815},
	[14] = {"Hiªn Viªn ChiÕn",0,102,8817},
	[15] = {"Hiªn Viªn ChiÕn",0,102,8819},
	[17] = {"Hiªn Viªn ChiÕn",0,102,8821},
	[18] = {"Hiªn Viªn ChiÕn",0,102,8823},
	[20] = {"Hiªn Viªn ChiÕn",0,102,8825},
	[21] = {"Hiªn Viªn ChiÕn",0,102,8827},
	[23] = {"Hiªn Viªn ChiÕn",0,102,8829},
	[25] = {"Hiªn Viªn ChiÕn",0,102,8831},
	[26] = {"Hiªn Viªn ChiÕn",0,102,8833},
	[27] = {"Hiªn Viªn ChiÕn",0,102,8835},
	[29] = {"Hiªn Viªn ChiÕn",0,102,8837},
	[30] = {"Hiªn Viªn ChiÕn",0,102,8839},
}
	--ÐùÔ¯¶·
TXuanyuangDou = {
	[2] = {"Hiªn Viªn §Êu",0,102,8802},
	[3] = {"Hiªn Viªn §Êu",0,102,8804},
	[4] = {"Hiªn Viªn §Êu",0,102,8806},
	[6] = {"Hiªn Viªn §Êu",0,102,8808},
	[8] = {"Hiªn Viªn §Êu",0,102,8810},
	[9] = {"Hiªn Viªn §Êu",0,102,8812},
	[11] = {"Hiªn Viªn §Êu",0,102,8814},
	[12] = {"Hiªn Viªn §Êu",0,102,8816},
	[14] = {"Hiªn Viªn §Êu",0,102,8818},
	[15] = {"Hiªn Viªn §Êu",0,102,8820},
	[17] = {"Hiªn Viªn §Êu",0,102,8822},
	[18] = {"Hiªn Viªn §Êu",0,102,8824},
	[20] = {"Hiªn Viªn §Êu",0,102,8826},
	[21] = {"Hiªn Viªn §Êu",0,102,8828},
	[23] = {"Hiªn Viªn §Êu",0,102,8830},
	[25] = {"Hiªn Viªn §Êu",0,102,8832},
	[26] = {"Hiªn Viªn §Êu",0,102,8834},
	[27] = {"Hiªn Viªn §Êu",0,102,8836},
	[29] = {"Hiªn Viªn §Êu",0,102,8838},
	[30] = {"Hiªn Viªn §Êu",0,102,8848},
}
TXuanyuanEquip = {
	TXuanyuanZhan,TXuanyuangDou,TXuanyuanWeapon
}


SS_WAITING		= 0;
SS_FIGHTING 	= 1;
SS_PASSING		= 2;
SS_FISH			= 3;
SS_WAITING_2	= 4;

frame_per_second 	= 18;
WAITING_TIME		= 15 * frame_per_second;
FIGHT_TIME			= 30 * frame_per_second;
FIGHT_TIME_2		= 15 * frame_per_second;
PASS_TIME			= 15 * frame_per_second;

MV_TIME_LOOP		= 1;
MV_MAPID			= 2;
MV_STAGE_STATE		= 3;	-- ¹Ø¿¨×´Ì¬
MV_STAGE_LEVEL		= 4;	-- µÚn¹Ø
MV_MAP_INDEX		= 5;	-- µØÍ¼idx
MV_STAGE_LEVEL_OLD	= 6;	-- ÕæÕýµÄ¹Ø¿¨
MV_BOSSDEATH_FLAG	= 7;	-- BOSSËÀÍö±êÖ¾
MV_CUR_BOSS_ID		= 8;
MV_BOSS_COUNT		= 9;	-- boss¹ØÉ±bossÊý
MV_FISH_COUNT		= 10;	-- Íæ¼ÒfishÊý
MV_FISH_COUNT_2		= 11;	-- ÕÅÇå»¨ÈÙfishÊý
MV_FISH_TIME		= 12;	-- Íæ¼ÒfishµÄÊ±¼ä
MV_ROBOT_TYPE		= 13;	-- µ±Ç°¿ªÆôµÄ»ú¹ØÀàÐÍ
MV_LOOP				= 14;	-- µ±Ç°timerÑ­»·´ÎÊý
MV_CREATE_MYFISH_TIME	= 15;	-- ÉÏ´ÎÔ®ÖúÊ±¼ä
MV_RETURN_MAP_ID	= 16;	-- ·µ»ØµØÍ¼id
MV_STAGE_START_TIME	= 17;
MV_BOSS_CREATE_TIME	= 18;
MV_SHOW_WELCOME		= 19;	-- »¶Ó­´Ê 1 ÒÑshow 0 Î´show
MV_MATCH_COUNT		= 20;	-- Òþ²Ø2
MV_MATCH_WIN		= 21;	-- Òþ²Ø2
MV_MATCH_AWARD		= 22;	-- Òþ²Ø2
MV_DAYE				= 23;	-- ib¹Ø»¨Ç®ÈËplayerindex
MV_LAO_ER			= 24;	-- Ïä×ÓÊ°È¡ÈËplayerindex
MV_LOOT_ID			= 25;	--
MV_DAYE_2			= 26;	-- »¨Ç®¿ªÏä×ÓÈËplayerindex
MV_LAO_ER_2			= 27;	-- Ïä×ÓÊ°È¡ÈËplayerindex
MV_LOOT_ID_2		= 28;	--
MV_CUR_BOSS_ID_2	= 29;	-- Ïä×ÓµÄBOSS
MV_LS_OPEN_JINGLI_BOX_FLAG = 30 --¿ª¹ý¾«Á¦±¦Ïä±êÖ¾
MV_LS_ROUTE_COUNT = 31 --Á÷ÅÉ¸öÊý
MV_END				= 31;	-- ±äÁ¿½áÊø

CampPlaye = "camp_player"; --ÎäÁÖÁªÃËÕóÓªÀàÐÍ£¬°üÀ¨npc
CampEnemy = "camp_enemy";  --ÎäÁÖÅÑÍ½ÕóÓªÀàÐÍ£¬°üÀ¨npc
CampNeutral = "camp_evil";		--ÖÐÁ¢npcÕóÓªÀàÐÍ

POS_1				= 1;
POS_2				= 2;
POS_3				= 3;
POS_4				= 4;
POS_5				= 5;
POS_6				= 6;
POS_7				= 7;
POS_8				= 8;
POS_9				= 9;
POS_BOSS			= 10;
POS_WAIT_1			= 11;
POS_WAIT_2			= 12;
POS_PASS			= 13;

-----------------------------------------------------------------------
HIDEMISSION_BEGIN = 20;
HIDEMISSION_END = 21;
OPEN_HIDE_STAGE = 1;

_nextstage = {
	[1] = 2,
	[2] = 3,
	[3] = 4,
	[4] = 6,
	[5] = 6,
	[6] = 0,
	[7] = 5,
	[8] = 9,
	[9] = 0,
}

resetPos = {
	[3]		= {
		[SS_WAITING_2]	= POS_BOSS,
	},
	[5]		= {
		[SS_WAITING]	= {1650, 3130},
	},
}

function getStage()
	local lv = GetMissionV(MV_STAGE_LEVEL);
	local s = _stage[lv];
	assert(s, format("lv=%d, s=%s", lv, tostring(s)));
	return s;
end

function nextStage()
	if GetMissionV(MV_DAYE) ~= 0 or GetMissionV(MV_DAYE_2) ~= 0 then
		Talk(1,"",LSSysTalk[1]);
		return
	end
	
	remove_jingli_box()--ÒÆ³ý¾«Á¦±¦Ïä
	remove_tong_box()
	remove_yin_box()
	remove_gold_box()

	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	local lv = GetMissionV(MV_STAGE_LEVEL);
	if lv >= HIDEMISSION_BEGIN then	-- Òþ²Ø¹Ø¿¨µÄÏÂÒ»¹Ø
		lv = GetMissionV(MV_STAGE_LEVEL_OLD);
	end
	
	if lv == 4 then
		_stat_when_first_4_stage_pass()
	end
	
	local n = _nextstage[lv];
	if n == 0 then
		Msg2MSAll(MISSION_ID, LSMsgToTeam[1]);
		CloseMission(MISSION_ID);
		return
	end
	SetMissionV(MV_STAGE_LEVEL_OLD, n);
	if (n >= 1 and n <= 4) and random(100) < 10 and OPEN_HIDE_STAGE == 1 then
		n = random(HIDEMISSION_BEGIN,HIDEMISSION_END);
	end
	SetMissionV(MV_STAGE_LEVEL, n);
	Msg2MSAll(MISSION_ID,LSMsgToTeam[2]);
	getStage():init();
end

function resetMissionV()
	for i = 1, MV_END do
		SetMissionV(i, 0);
	end
end

function getResetPosition()
	local m, x, y = nil, nil, nil;
	local nState		= GetMissionV(MV_STAGE_STATE);
	local nOldStage	= GetMissionV(MV_STAGE_LEVEL_OLD);
	if resetPos and resetPos[nOldStage] and resetPos[nOldStage][nState] then
		local tPos = resetPos[nOldStage][nState];
		if type(tPos) == 'table' then
			m = gf_GetCurMapID();
			x = tPos[1];
			y = tPos[2];
		else
			m, x, y = tStageBase:getMapPos(tPos);
		end
	elseif nState ~= SS_PASSING and nState ~= SS_WAITING and nState ~= SS_WAITING_2 then
		m, x, y = tStageBase:getMapPos(POS_BOSS);
	end

	return m, x, y;
end

function resetPosition()
	local m, x, y = getResetPosition();

	if m and x and y then
		local f_resetPos = function()
			NewWorld(%m, %x, %y);
		end;
		mf_OperateAllPlayer(MISSION_ID, f_resetPos, nil, 1);
	end
end
-----------------------------------------------------------------------
function gf_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;

function LM_StartTimeGuage(szInfo, nDuration, bRepeat, nCustomID, tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID, ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end

function LM_StopTimeGuage(nCustomID, tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StopTimeGuage(%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end;

function LM_Talk(SentenceNum, CallBack_Fun, SentenceTab, tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTalk = function(tbArg)
		Talk(%SentenceNum, %CallBack_Fun, %SentenceTab);
	end;
	gf_OperatePlayers(tbPlayer,funTalk,{});
end;

function LM_Say(szCaption, nArg, tArg, tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funSay = function(tbArg)
		Say(%szCaption, %nArg, %tArg);
	end;
	gf_OperatePlayers(tbPlayer,funSay,{});
end;

------------------------------------------------------
-- MU_Msg2Team from cangjian
function MU_Msg2Team(msg, msgtype)
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
    OldPlayer = PlayerIndex
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
--============talk¹«¹²´¦Àí
function temp_Talk(self, nPage)
	if type(self) == "string" then
		self = GetTable(self);
	end
	if not self then return end
	if self.check and self.check(self) == nil then return end

	nPage = nPage or 0;
	local commonSel = self.commonSel or 0;
	local nLinePerPage = self.nLinePerPage or gLinePerPage or 10;
	local tSel = {}
	local nMin = 1 + nPage * nLinePerPage;
	local nMax = min( nMin + nLinePerPage - 1, getn(self.sel) - commonSel);
	for i=nMin, nMax do
		local callback = getcallback(self.sel[i][2], self);
		if callback then
			if self.makeSure
				and ((commonSel == 0 and i < getn(self.sel) - commonSel)
					or (commonSel > 0 and i <= getn(self.sel) - commonSel)) then
				callback = format('#makeSure("%s", %d, "%s")', HashTable(self), i, callback);
			end
			tinsert(tSel, format("%s/%s", self.sel[i][1], callback));
		end
	end
	local bReturn = 0;
	if nPage > 0 then
		tinsert(tSel, format("Trang tr­íc".."/#temp_Talk('%s', %d)", HashTable(self), nPage - 1));
	end
	if nMax < getn(self.sel) - commonSel then
		tinsert(tSel, format("Trang kÕ".."/#temp_Talk('%s', %d)", HashTable(self), nPage + 1));
	end
	for i = getn(self.sel) - commonSel + 1,  getn(self.sel) do
		tinsert(tSel, format("%s/%s", self.sel[i][1], getcallback(self.sel[i][2], self)));
	end
	suSay( self.msg, getn(tSel), tSel);
end
function getcallback(cb, t)
	local tp = type(cb);
	if tp == "string" then return cb end
	if tp == "table" then return format("#temp_Talk('%s')",HashTable(cb)) end
	if tp == "function" then return cb(t) end
end
function HashTable(t)
	g_TableHash = g_TableHash or {};
	local s = strsub(tostring(t), 8);
	g_TableHash[s] = t;
	return s;
end
function GetTable(s)
	return g_TableHash and g_TableHash[s];
end
-- suSay: ×Ô¶¯·ÖÒ³say, Ç°ÃæÒ³Ö»ÓÐÉÏ/ÏÂÑ¡Ïî,×îºóÒ³ÓÐ×Ô¶¨Ñ¡Ïî
--	²ÎÊýÓëSayÒ»Ñù
PAGE_SIZE = 450;
function suSay(szMsg, n, ...)
	if strlen(szMsg) < PAGE_SIZE then
		Say(szMsg, n, gf_UnPack(arg))
		return
	end
	tTalkMsg = {}
	nTalkMsg = 1;

	szMsg = gsub(szMsg, "\\p", "\n\\p");
	gsub(szMsg, "(%C+)", procTalk);

	if type(arg[1]) == "table" then
		arg = arg[1];
	end
	g_PlayerTalkTmp[GetName()] = {
		msg = tTalkMsg,
		sel = arg,
	}
	suSayCB();
end

function suSayCB(nPage)
	nPage = nPage or 1;
	tMsg = g_PlayerTalkTmp[GetName()];
	if not tMsg then
		gf_warning("[WARNING] [suSayCB] [date error] [role:"..GetName().."]");
		return
	end
	local tArg = new(tMsg.sel);
	if getn(tMsg.msg) > nPage then
		tArg = { format("Trang kÕ/#suSayCB(%d)", nPage+1)};
	end
	if nPage > 1 then
		tinsert(tArg, 1, format("Trang tr­íc/#suSayCB(%d)", nPage-1));
	end

	Say(tMsg.msg[nPage], getn(tArg), tArg);
end

function nothing()
end
--==========================================================