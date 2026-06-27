
--begin-------------------------------------------------------------------------°Ñcdkey±ä³ÉÒ»¸öisolate
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "cdkey",
    szViewName 			= "Ho¹t ®éng Minh Gi¸o LÖnh V2",
    nTalkBeginDate		= 20161209,
    nBeginDate 			= 20170109,
    nEndDate 			= 20170209,
    nTaskGroup 			= 9,
    nTaskGroupVersion	= 18,
}
function _handler_event_cost_ib(data, para)
	local nItemPackId, nNum = unpack(data)
	_ck_SetCostIB(nNum)
end
--t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}
--	{"event_ib_cost", {PackItemId(2,97,236)}, 	_handler_event_cost_ib  }, 	--Ìì½¾ÁîÏû·Ñ¼ÆÊı
--}
function on_add_watches()
	isolate_watch_npc_talk("§¹i Sø ho¹t ®éng", 100, "handle_npc_talk_huodongdashi")
	isolate_watch_npc_talk("§¹i Sø ho¹t ®éng", 200, "handle_npc_talk_huodongdashi")
	isolate_watch_npc_talk("§¹i Sø ho¹t ®éng", 300, "handle_npc_talk_huodongdashi")
	isolate_watch_event("event_ib_cost", "_handler_event_cost_ib", PackItemId(2, 97, 236))--Ìì½¾ÁîÏû·Ñ¼ÆÊı
end

function on_init_ok()
	CK_TASK_GROUP = AcivityBase.TaskGroup
	CK_TASK_GROUP.Task1 = 1 --1,2,3Î»·Ö±ğ±íÊ¾ÎäÁÖĞÂĞã£¬ÀÏÕ½ÓÑ£¬»îÔ¾×Å,4-11Î»ÓÂÍùÖ±Ç°ÈÎÎñ£¬°ÙÕ½É±¹ÖÈÎÎñ12-16¼ÇÂ¼,17-21Íê³É,°ÙÕ½¸±±¾ÈÎÎñ22-26¼ÇÂ¼£¬27-31½ÓÈ¡
	CK_TASK_GROUP.Task2 = 2 --°ÙÕ½¸±±¾ÈÎÎñ1-5¿É½»£¬6-10Íê³É£¬--°ÙÕ½PVPÈÎÎñ11-17¼ÇÂ¼£¬18-24½ÓÈ¡£¬25-31¿É½»
	CK_TASK_GROUP.Task3 = 3 --°ÙÕ½PVPÈÎÎñ1-7Íê³É,8-10É±¹Ö¼Ó³É£¬11-13¸±±¾¼Ó³É£¬14-16pvp¼Ó³É, 17+ÊÇËÙÕ½ËÙ¾öÈÎÎñ
	CK_TASK_GROUP.Task4 = 4 --ÈÎÎñ±ê¼Ç
	CK_TASK_GROUP.Task5 = 5 --´ó¸»ÎÌÏû·ÑÈÎÎñ¼ÆÊı
	CK_TASK_GROUP.Score = 6 --»îÔ¾¶È
	CK_TASK_GROUP.Award = 7 --°´Î»±ê¼Ç½±Àø
	isolate_enable_event_dispatch(-1) --´ò¿ªtalk-dateµÄevent dispatch¿ª¹Ø
end
--»î¶¯ÊÇ·ñ¿ªÆô
function ck_IsOpen()
	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
		return 1
	end
	return isolate_in_talk_date(nil, 0);
	--return gf_CheckDuration(CK_START_TIME, CK_END_TIME);
end
function ck_CanAct()
	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
		return 1
	end
	return isolate_in_talk_date(nil, 1)
	--return gf_CheckDuration(CK_START_TIME, CK_START_ACT);
end

--¼¤»î³ÆºÅ
function ck_ActTilte()
	local tSay = {}
	--local nCheckServer = GetGlbValue(GLB_TSK_SERVER_ID)
	--if nCheckServer == 99 then	-- or nCheckServer == 91
	--	tinsert(tSay,"Vâ L©m T©n Tó/ck_ActTilte_1");
	--else
		--tinsert(tSay,"L·o ChiÕn H÷u/ck_ActTilte_2");
		tinsert(tSay,"Ng­êi N¨ng §éng/ck_ActTilte_3");
	--end
	tinsert(tSay,"T«i chØ xem xem th«i/nothing");
	local _start,_end_act,_end = isolate_get_dates()
	local msg = format("Thêi gian ng­ng kİch ho¹t %s", isolate_get_str_date(_end_act));
	Say(CK_NPC_NAME..format("%s muèn kİch ho¹t danh hiÖu nµo?<color=red>%s<color>", gf_GetPlayerSexName(), msg), getn(tSay), tSay);
end
--»î¶¯´óÊ¹npc»á»°
function handle_npc_talk_huodongdashi(nNpcIndex)
	local szTitle = format("%s %s", CK_NPC_NAME, "H·y nhanh chãng mêi b¹n bÌ ®Õn cïng ch¬i trß ch¬i nµo! B¹n bÌ cµng nhiÒu th× sÏ cã thªm nhiÒu niÒm vui!")

    local tSay = {
    	"Giíi thiÖu ho¹t ®éng/ck_ActInfo",
    	"Kİch ho¹t danh hiÖu/ck_ActTilte",
    	"NhiÖm vô Dòng C¶m TiÕn Tíi/ck_TaskForward",
    	"NhiÖm vô Tr¨m TrËn Tr¨m Th¾ng/ck_BaiZhanBuDai",
    	format("%s/#ck_task_group_talk1(2)", "NhiÖm vô Tèc ChiÕn Tèc Th¾ng"), --"ËÙÕ½ËÙ¾öÈÎÎñ/ck_FastTask",
    	"NhiÖm vô §¹i Phó ¤ng/ck_ZiloTask",
    	"Xem ®iÓm n¨ng ®éng/ck_QueryScore",
    	"KiÓm tra thiªn kiªu lÖnh/cdk_QueryUseTianJiaoLingNum",
    	"§iÓm n¨ng ®éng ®æi phÇn th­ëng/ck_ScoreAward",
    	format("%s/nothing", "Ra khái"),
    }
    Say(szTitle, getn(tSay), tSay)
end

function on_event_daily_clear(nCurDate, nLastDate)
	ck_DailyReset()
end

function on_event_player_login(nExchangeComing)
	if ck_GetTitleType() == 0 then
		isolate_disable_event_dispatch(PlayerIndex) --¹ØµôÃ»ÓĞ¼¤»îCDKeyÍæ¼ÒµÄËùÓĞevent dispatch
	end
end
--end-------------------------------------------------------------------------°Ñcdkey±ä³ÉÒ»¸öisolate


Include("\\script\\function\\cdkey\\ck_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\activity_head.lua")

CK_NPC_NAME = "<color=green> §¹i Sø ho¹t ®éng: <color>";

function cdk_QueryUseTianJiaoLingNum()
	Say(CK_NPC_NAME..format("%s tæng sè thiªn kiªu lÖnh ®· sö dông<color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCostIB()), 0);
end

--Ã¿ÈÕÇåÀí
function ck_DailyReset()
	if gDebug:is_debug() ~= 1 then--µ÷ÊÔÄ£Ê½
		if ck_IsOpen() ~= 1 then
    		return 0;
    	end
    	if ck_GetTitleType() == 0 then
    		return 0;
    	end
	end

	--ÖØÖÃ°ÙÕ½²»´ùÈÎÎñ
	for i = 12, 31 do
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
	end
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task2, 0);
	for i = 1, 16 do
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
	end
	--É¾³ı°ÙÕ½²»´ùµÄÈÎÎñ
	for i = 234, 238 do
		DirectDeleteTask(i)
	end
	ck_task_daily_clear()
end

--»ñµÃµ±ÌìË÷Òı
function ck_GetRandIndex(nMax)
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then wDay = 7 end
	return mod(wDay, nMax) + 1;
end

--»ñÈ¡ÀàĞÍ
function ck_GetTitleType()
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) == 1 then
		return 1;
	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) == 1 then
--		return 2;
--	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) == 1 then
		return 3;
	end
	return 0;
end

--»ñµÃ¹±Ï×¶È
function ck_GetCkScore()
	return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score);
end

--Ôö¼Ó»ı·Ö
function ck_AddCkScore(nAdd)
	if not nAdd or nAdd < 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Score, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) + nAdd);
	Msg2Player(format("§iÓm n¨ng ®éng t¨ng %d, tæng ®iÓm lµ %d", nAdd, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score)));
end

--»î¶¯½éÉÜ
function ck_ActInfo(nIndex)
	local strTitle = 	{
		"Trong thêi gian ho¹t ®éng, ng­êi ch¬i sÏ nhËn ®­îc danh hiÖu phï hîp víi ®iÒu kiÖn cña b¶n th©n. TÊt c¶ danh hiÖu ®Òu cã hiÖu lùc lµ 2 th¸ng, vµ khi nh©n vËt th¾p s¸ng danh hiÖu th× kh¸ng tÊt c¶ sÏ t¨ng 10 ®iÓm. Ng­êi ch¬i ph¶i kİch ho¹t danh hiÖu míi cã thÓ nhËn nhiÖm vô. NhiÖm vô Tr¨m TrËn Tr¨m Th¾ng, mçi ngµy chØ ®­îc lµm 1 lÇn. NhiÖm vô Tèc ChiÕn Tèc Th¾ng vµ §¹i Phó ¤ng th× trong thêi gian ho¹t ®éng chØ ®­îc hoµn thµnh 1 lÇn. NhiÖm vô Tr¨m TrËn Tr¨m Th¾ng cã thÓ hoµn thµnh theo c¸ nh©n vµ tæ ®éi, nÕu tæ ®éi th× phÇn th­ëng sÏ cao h¬n. Hoµn thµnh c¸c môc nhiÖm vô sÏ nhËn ®­îc ®iÓm kinh nghiÖm vµ ®é n¨ng ®éng. Tİch lòy ®é n¨ng ®éng cã thÓ ®æi phÇn th­ëng phong phó.",
		"Ng­êi n¨ng ®éng tæ ®éi tham gia nhiÖm vô Tr¨m TrËn Tr¨m Th¾ng cã x¸c suÊt cao nhÊt nhËn ®­îc phÇn th­ëng cao.", --ºÍÀÏÕ½ÓÑ
		"NhiÖm vô Dòng C¶m TiÕn Tíi chØ xuÊt hiÖn t¹i server míi,trong server míi gamer cÊp 10 vµ ®· kİch ho¹t danh hiÖu Vâ L©m T©n Tó míi ®­îc nhËn nhiÖm vô.Hoµn thµnh xong nhiÖm vô nµy vµ ®¹t ®Õn cÊp 90, gamer Vâ L©m T©n Tó míi ®­îc tiÕp nhËn nhiÖm vô Tr¨m TrËn Tr¨m Th¾ng,Tèc ChiÕn Tèc Th¾ng vµ §¹i Phó ¤ng.",
	}
	local tbSay = {};
	nIndex = nIndex or 1;
	local Msg = strTitle[nIndex];
	if Msg then
		tbSay.msg = CK_NPC_NAME..Msg;
		tbSay.sel = {
			{"\n rót lui", "nothing"},
		};
		if strTitle[nIndex + 1] then
			tinsert(tbSay.sel, 1, {"Trang kÕ", format("#ck_ActInfo(%d)", nIndex + 1)})
		end
		temp_Talk(tbSay);
	end
end


function ck_ActTilte_1()
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Thêi gian kİch ho¹t ®· kÕt thóc,kh«ng thÓ kİch ho¹t danh hiÖu n÷a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
		return 0;
	end
	--if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
	--	Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "L·o ChiÕn H÷u"), 0)
	--	return 0;
	--end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(1), GetExtPoint(2))
	if GetExtPoint(1) == 1 and GetExtPoint(2) ~= 1 then
		if CK_ES_SWITCH == 0 then
			Say(CK_NPC_NAME.."M¸y chñ nµy t¹m thêi kh«ng më nhËn danh hiÖu <color=gold>Vâ L©m T©n Tó<color>!", 0);
			return 0;
		end
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 1, 1);
		PayExtPoint(1, 1);
		AddTitle(68, 1);
		SetTitleTime(68, 1, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Vâ L©m T©n Tó"))
		Say(CK_NPC_NAME..format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "Vâ L©m T©n Tó"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 1)");
		isolate_enable_event_dispatch(PlayerIndex) --´ò¿ª¸ÃÍæ¼ÒµÄËùÓĞevent dispatch
		return 1;
	end
	Say(CK_NPC_NAME.."Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

function ck_ActTilte_2()
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Thêi gian kİch ho¹t ®· kÕt thóc,kh«ng thÓ kİch ho¹t danh hiÖu n÷a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "L·o ChiÕn H÷u"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(3), GetExtPoint(4))
	if GetExtPoint(3) == 1 and GetExtPoint(4) ~= 1 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 2, 1);
		PayExtPoint(3, 1);
		AddTitle(68, 2);
		SetTitleTime(68, 2, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "L·o ChiÕn H÷u"))
		Say(CK_NPC_NAME..format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "L·o ChiÕn H÷u"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 2)");
		isolate_enable_event_dispatch(PlayerIndex) --´ò¿ª¸ÃÍæ¼ÒµÄËùÓĞevent dispatch
		return 1;
	end
	Say(CK_NPC_NAME.."Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

function ck_ActTilte_3()
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Thêi gian kİch ho¹t ®· kÕt thóc,kh«ng thÓ kİch ho¹t danh hiÖu n÷a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
		return 0;
	end
	--if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
	--	Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "L·o ChiÕn H÷u"), 0)
	--	return 0;
	--end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(5), GetExtPoint(6))
	if GetExtPoint(5) == 1 and GetExtPoint(6) ~= 1 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 3, 1);
		PayExtPoint(5, 1);
		AddTitle(68, 3);
		SetTitleTime(68, 3, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Ng­êi N¨ng §éng"))
		Say(CK_NPC_NAME..format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "Ng­êi N¨ng §éng"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 3)");
		isolate_enable_event_dispatch(PlayerIndex) --´ò¿ª¸ÃÍæ¼ÒµÄËùÓĞevent dispatch
		return 1;
	end
	Say(CK_NPC_NAME.."Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

--Task1:4-11Î»ÓÂÍùÖ±Ç°ÈÎÎñ
function ck_TaskForward()
	if CK_ES_SWITCH == 0 then
		Say(CK_NPC_NAME.."M¸y chñ nµy t¹m thêi kh«ng më chuçi nhiÖm vô <color=red>Dòng C¶m TiÕn Tíi<color>", 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 1 then
		Say(CK_NPC_NAME..format("ChØ cã <color=gold>[%s]<color> míi ®­îc nhËn nhiÖm vô nµy", "Vâ L©m T©n Tó"), 0)
		return 0;
	end
	if GetLevel() >= 90 or gf_GetPlayerRebornCount() > 0 then
		Say(CK_NPC_NAME.."Gamer 90 cÊp trë lªn hoÆc ®· chuyÓn sinh kh«ng thÓ tham gia nhiÖm vô nµy!",0);
		return 0;
	end
	local tSay = {}
	local tMsg = {"Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	for i = 1, getn(CK_TASK_FORWARD) do
		local nType = 0;
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i + 3) == 1 then
			nType = 4;
		else
			if tGtTask:check_cur_task(CK_TASK_FORWARD[i][2]) == 0 then
				nType = 1;
			else
				if DirectIsTaskFinish(CK_TASK_FORWARD[i][2]) then
					nType = 3;
				else
					nType = 2;
				end
			end
		end
		if tMsg[nType] then
			tinsert(tSay, CK_TASK_FORWARD[i][1]..format("(%s)/#ck_TaskFoward_do(%d, %d)", tMsg[nType], CK_TASK_FORWARD[i][2], i + 3));
		end
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."NhiÖm vô Dòng C¶m TiÕn Tíi cã thÓ gióp ng­êi nhanh chãng t¨ng cÊp!",getn(tSay), tSay);
end

function ck_TaskFoward_do(nTaskID, nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
		Say(CK_NPC_NAME.."NhiÖm vô nµy ®· hoµn thµnh!", 0);
		return 0;
	end
	if nTaskIndex > 4 and CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex - 1) ~= 1 then
		Say(CK_NPC_NAME.."Ch­a hoµn thµnh nhiÖm vô tr­íc ®ã", 0);
		return 0;
	end
	if tGtTask:check_cur_task(nTaskID) == 0 then
		DirectGetGTask(nTaskID, 1)
	else
		if DirectIsTaskFinish(nTaskID) then
			if 1 == DirectFinishGTask(nTaskID, 2) then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
				Msg2Player("§· hoµn thµnh nhiÖm vô!")
			else
				Msg2Player("NhiÖm vô kh¸c th­êng, kh«ng thÓ hoµn thµnh!");
			end
		else
			Say(CK_NPC_NAME.."NhiÖm vô vÉn ch­a hoµn thµnh!", 0);
		end
	end
end

--ÓÂÍùÖ±Ç°½±Àø(¶ÔÍâ)
function ck_TaskForward_Award()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
		local nExp = GetExp()
		ModifyExp(-nExp)
		SetLevel(90, 1);
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		Say(CK_NPC_NAME..format("§¼ng cÊp nh©n vËt ®· n©ng cao ®Õn %d cÊp, xin ®¨ng nhËp l¹i!", 90), 1, "§¨ng nhËp l¹i/ExitGame");
	end
end

function ck_CheckCondition()
	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
		return 1
	end
	local nKind = ck_GetTitleType();
	if nKind == 0 then
		Say(CK_NPC_NAME.."VÉn ch­a nhËn vµ kİch ho¹t danh hiÖu nµo, kh«ng thÓ tham gia nhiÖm vô!", 0);
		return 0;
	end
	if GetLevel() < 73 and gf_GetPlayerRebornCount() <= 0 then
		Say(CK_NPC_NAME..format("§»ng cÊp nh©n vËt kh«ng ®ñ %d cÊp, kh«ng thÓ tham gia nhiÖm vô !", 73), 0);
		return 0;
	end
	return 1;
end

function ck_BaiZhanBuDai()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		--"\nNhiÖm vô ®¸nh qu¸i/ck_BZBD_Kill",
		format("\n%s/#ck_task_group_talk2(1,1)", "NhiÖm vô ThÕ Lùc Ba Phe"),
		"\nNhiÖm vô phã b¶n/ck_BZBD_Raid",
		"\nNhiÖm vô PVP/ck_BZBD_PVP",
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."NhiÖm vô <color=gold>Tr¨m TrËn Tr¨m Th¾ng<color>, nhËn ngÉu nhiªn h»ng ngµy, nhËn ®­îc nhiÒu kinh nghiÖm vµ ®é n¨ng ®éng!", getn(tSay), tSay);
end

--Task3£º¼Ó³É
function ck_BZBD_GetType(nIndex1, nIndex2, nIndex3)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3) == 1 then
		return 0.8;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2) == 1 then
		return 0.8;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1) == 1 then
		return 0.8;
	end
	return 0;
end

function ck_BZBD_SetType(nIndex1, nIndex2, nIndex3)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 0)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 0)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 0)
	local nSize = gf_GetTeamSize();
	if nSize <= 1 then
		return 0;
	end
	--print("nSize =", nSize)
	local oldPlayerIndex = PlayerIndex;
	local nSelfType = ck_GetTitleType();
	if nSelfType == 0 then
		return 0;
	end
	--print("nSelfType =", nSelfType)
	if nSelfType == 1 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 1 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 1)
					return 1;
				end
			end
		end
	end
	if nSelfType == 2 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 3 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
					return 1;
				end
			end
		end
	end
	if nSelfType == 3 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 3 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 1)
				end
				if ck_GetTitleType() == 2 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
				end
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
	--print("nIndex1 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1))
	--print("nIndex2 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2))
	--print("nIndex3 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3))
end

--°ÙÕ½²»´ùÉ±¹ÖÈÎÎñ
--Task1:12-16¼ÇÂ¼,17-21Íê³É
function ck_BZBD_Kill()
	--Ã»ÓĞÈÎÎñ¾ÍËæ»ú·ÖÅäÁ½¸öÈÎÎñ
	local nCount = 0;
	local nTaskIndex1 = 0;
	local nTaskIndex2 = 0;
	for i = 12, 16 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) == 1 then
			if nTaskIndex1 == 0 then
				nTaskIndex1 = i - 11;
			elseif nTaskIndex2 == 0 then
				nTaskIndex2 = i - 11;
			end
			nCount = nCount + 1;
		end
	end
	if nCount ~= 2 then
		for i = 12, 21 do
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0)
		end
		nCount = ck_GetRandIndex(getn(CK_TASK_BZ_KILL));
		nTaskIndex1 = nCount;
		if 0 ~= mod(nCount + 3, 5) then
			nTaskIndex2 = mod(nCount + 3, 5);
		else
			nTaskIndex2 = 5;
		end
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 11 + nTaskIndex1, 1);
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 11 + nTaskIndex2, 1);
	end
	DebugOutput("nTaskIndex1, nTaskIndex2 =", nTaskIndex1, nTaskIndex2);
	--¸ø¶Ô»°
	local tSay = {}
	local tMsg = {"Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	local tTask = {nTaskIndex1, nTaskIndex2};
	for i = 1, getn(tTask) do
		local nType = 0;
		DebugOutput("tTask[i] =", tTask[i])
		local nType = 0;
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 16 + tTask[i]) == 1 then
			nType = 4;
		else
			if tGtTask:check_cur_task(CK_TASK_BZ_KILL[tTask[i]][2]) == 0 then
				nType = 1;
			else
				if DirectIsTaskFinish(CK_TASK_BZ_KILL[tTask[i]][2]) then
					nType = 3;
				else
					nType = 2;
				end
			end
		end
		if tMsg[nType] then
			tinsert(tSay, format("\n%s(%s)/#ck_BZBD_Kill_do(%d, %d)", CK_TASK_BZ_KILL[tTask[i]][1], tMsg[nType], CK_TASK_BZ_KILL[tTask[i]][2], 16 + tTask[i]));
		end
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."Tr¨m TrËn Tr¨m Th¾ng-NhiÖm vô ®¸nh qu¸i!",getn(tSay), tSay);
end

function ck_BZBD_Kill_do(nTaskID, nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
		Say(CK_NPC_NAME.."NhiÖm vô nµy ®· hoµn thµnh!", 0);
		return 0;
	end
	if tGtTask:check_cur_task(nTaskID) == 0 then
		DirectGetGTask(nTaskID, 1)
	else
		DebugOutput(nTaskID, DirectIsTaskFinish(nTaskID))
		if DirectIsTaskFinish(nTaskID) then
			if 1 == DirectFinishGTask(nTaskID, 2) then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
				Msg2Player("§· hoµn thµnh nhiÖm vô!")
			else
				Msg2Player("NhiÖm vô kh¸c th­êng, kh«ng thÓ hoµn thµnh!");
			end
		else
			Say(CK_NPC_NAME.."NhiÖm vô vÉn ch­a hoµn thµnh!", 0);
		end
	end
end

--É±¹ÖÈÎÎñ½±Àø(¶ÔÍâ)
function ck_BZBD_Kill_Award()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	local nParam = ck_BZBD_GetType(8, 9, 10);
	gf_ModifyExp(floor(3000000*(1 + nParam)));
	ck_AddCkScore(floor(10 * (1 + nParam)));
end

--É±¹ÖÈÎÎñ¶ÔÍâ½Ó¿Ú
--½öÉèÖÃ¼Ó³ÉÏµÊı
function _ck_BZBD_Kill_Set()
	--print("_ck_BZBD_Kill_Set()")
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 12, 16 do
			--print(i, CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i))
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 11;
			end
		end
		--print("nCount =", nCount)
		if nCount ~= 2 then
			return 0;
		end
		ck_BZBD_SetType(8, 9, 10);
	end);
end

--°ÙÕ½²»´ù¸±±¾ÈÎÎñ
--Task1:22-26¼ÇÂ¼£¬27-31½ÓÈ¡
--Task2:1-5¿É½»£¬6-10Íê³É
function ck_BZBD_Raid()
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 22, 26 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 21;
		end
	end
	if nCount ~= 1 then
		for i = 22, 31 do
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
		end
		for i = 1, 10 do
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, i, 0);
		end
		nTaskIndex = ck_GetRandIndex(getn(CK_TASK_BZ_RAID));
		--ÆÁ±ÎµÚÒ»¸öÈÎÎñ
		if nTaskIndex == 1 then
			nTaskIndex = random(2, getn(CK_TASK_BZ_RAID));
		end
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 21 + nTaskIndex, 1);
	end
	local tMsg = {"Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	local nType = 0;
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex) == 0 then
		nType = 1;
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) == 0 then
			nType = 2;
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex) == 0 then
				nType = 3;
			else
				nType = 4;
			end
		end
	end
	DebugOutput(CK_TASK_BZ_RAID[nTaskIndex], tMsg[nType], nTaskIndex)
	local tSay = {
		format("%s(%s)/#ck_BZBD_Raid_do(%d)",	CK_TASK_BZ_RAID[nTaskIndex], tMsg[nType], nTaskIndex),
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."Tr¨m TrËn Tr¨m Th¾ng-NhiÖm vô phã b¶n!", getn(tSay), tSay);
end

function ck_BZBD_Raid_do(nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex) == 0 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex, 1);
		Say(CK_NPC_NAME..format("§· nhËn nhiÖm vô <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) == 0 then
			Say(CK_NPC_NAME..format("Ch­a hoµn thµnh nhiÖm vô <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex) == 0 then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex, 1);
				--¸ø½±Àø
				ck_BZBD_Raid_Award();
			else
				Say(CK_NPC_NAME..format("§· hoµn thµnh nhiÖm vô <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
			end
		end
	end
end

--°ÙÕ½²»´ù¸±±¾ÈÎÎñ½±Àø
function ck_BZBD_Raid_Award()
	local nParam = ck_BZBD_GetType(11, 12, 13);
	gf_ModifyExp(floor(5000000*(1 + nParam)));
	ck_AddCkScore(floor(15 * (1 + nParam)));
end

--¸±±¾ÈÎÎñ¶ÔÍâ½Ó¿Ú
function _ck_BZBD_Raid_Set(nCurIndex)
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 22, 26 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 21;
		end
	end
	if nCount ~= 1 then
		return 0;
	end
	if tonumber(nCurIndex) ~= nTaskIndex then
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) ~= 1 then
		ck_BZBD_SetType(11, 12, 13);
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex, 1);
		Msg2Player(format("§· hoµn thµnh nhiÖm vô %s", CK_TASK_BZ_RAID[nTaskIndex]));
	end
end

--°ÙÕ½²»´ùPVPÈÎÎñ
--Task2:11-17¼ÇÂ¼£¬18-24½ÓÈ¡£¬25-31¿É½»
--Task3:1-7Íê³É
function ck_BZBD_PVP()
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 11, 17 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 10;
		end
	end
	if nCount ~= 1 then
		for i = 18, 31 do
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, i, 0);
		end
		for i = 1, 7 do
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
		end
		nTaskIndex = random(7);
		--ÆÁ±Î3v3-------------
		if nTaskIndex == 2 then
			nTaskIndex = nTaskIndex + 1;
		end
		----------------------
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 10 + nTaskIndex, 1);
	end
	local tMsg = {"Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	local nType = 0;
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex) == 0 then
		nType = 1;
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) == 0 then
			nType = 2;
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex) == 0 then
				nType = 3;
			else
				nType = 4;
			end
		end
	end
	local tSay = {
		format("%s(%s)/#ck_BZBD_PVP_do(%d)",	CK_TASK_BZ_PVP[nTaskIndex], tMsg[nType], nTaskIndex),
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."Tr¨m TrËn Tr¨m Th¾ng-NhiÖm vô PVP!", getn(tSay), tSay);
end

function ck_BZBD_PVP_do(nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex) == 0 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex, 1);
		Say(CK_NPC_NAME..format("§· nhËn <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) == 0 then
			Say(CK_NPC_NAME..format("Ch­a hoµn thµnh <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex) == 0 then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex, 1);
				--¸ø½±Àø
				ck_BZBD_PVP_Award();
			else
				Say(CK_NPC_NAME..format("§· hoµn thµnh <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
			end
		end
	end
end

function ck_BZBD_PVP_Award()
	local nParam = 0.8; --ck_BZBD_GetType(14, 15, 16);
	gf_ModifyExp(floor(8000000*(1 + nParam)));
	ck_AddCkScore(floor(24 * (1 + nParam)));
end

--PVPÈÎÎñ¶ÔÍâ½Ó¿Ú
function _ck_BZBD_PVP_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 11, 17 do
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 10;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) ~= 1 then
			--ck_BZBD_SetType(14, 15, 16);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex, 1);
			Msg2Player(format("§· hoµn thµnh nhiÖm vô %s", CK_TASK_BZ_PVP[nTaskIndex]));
		end
	end);
end

function ck_FastTask()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhiÖm vô bang héi/ck_FastTask_Tong",
		"\nNhiÖm vô h­íng dÉn/ck_FastTask_Guide",
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."NhiÖm vô <color=gold>Tèc ChiÕn Tèc Th¾ng<color>, trong thêi gian ho¹t ®éng chØ ®­îc hoµn thµnh 1 lÇn, nhËn ®­îc nhiÒu kinh nghiÖm vµ ®é n¨ng ®éng!", getn(tSay), tSay);
end

function ck_FastTask_Tong()
	local tSay = {
		"\nGia nhËp bang héi/ck_FastTask_Tong_1",
		"\nT¸i chiÕn ThÇn Thó/ck_FastTask_Tong_2",
		"\nN­íng thŞt bang ph¸i/ck_FastTask_Tong_3",
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."<color=gold>Tèc ChiÕn Tèc Th¾ng<color>-NhiÖm vô bang héi!", getn(tSay), tSay);
end

--Task3£º17Î»ÊÇ·ñÍê³É
function ck_FastTask_Tong_1(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Tong_1(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"Gia nhËp bang héi", "Gia nhËp mét bang héi bÊt kú, trë thµnh mét thµnh viªn trong bang", "Gia nhËp bang héi, cïng víi thµnh viªn kh¸c cè g¾ng ®Ó gióp bang héi ngµy cµng lín m¹nh", 3000000, 100);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 17) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if IsTongMember() <= 0 then
		Say(CK_NPC_NAME.."Kh«ng tháa ®iÒu kiÖn, kh«ng thÓ hoµn thµnh nhiÖm vô!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 17, 1);
	--½±Àø
	gf_ModifyExp(3000000);
	ck_AddCkScore(100);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Task3£º18Î»ÊÇ·ñÍê³É
function ck_FastTask_Tong_2(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Tong_2(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"T¸i chiÕn ThÇn Thó", "Nép 300 ®iÓm tİch lòy tö quang", "Tham gia Tö Quang C¸c ®¸nh b¹i Tö Quang ThÇn Thó sÏ nhËn ®­îc ®iÓm tİch lòy tö quang", 5000000, 200);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 18) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	--¿Û×Ï¹â»ı·Ö
	local TSK_POINT = 652;			--¼ÇÂ¼Íæ¼Ò¸öÈË¹Ø¿¨»ı·Ö
	if GetTask(TSK_POINT) < 300 then
		Say(CK_NPC_NAME..format("§iÓm tİch lòy tö quang kh«ng ®ñ <color=red>%d<color> ®iÓm", 300), 0);
		return 0;
	end
	SetTask(TSK_POINT, GetTask(TSK_POINT) - 300);
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 18, 1);
	--½±Àø
	gf_ModifyExp(5000000);
	ck_AddCkScore(200);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Task3£º19Î»ÊÇ·ñÍê³É
function ck_FastTask_Tong_3(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Tong_3(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"N­íng thŞt bang ph¸i", "Tham dù tİnh n¨ng N­íng thŞt bang ph¸i nép 10 M¶nh LÖnh Bµi Bang Ph¸i", "Ho¹t ®éng N­íng thŞt bang ph¸i v« cïng thó vŞ, mau ®i thu thËp M¶nh LÖnh Bµi Bang Ph¸i nµo!", 8000000, 300);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 19) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	--¿ÛËéÆ¬
	if DelItem(2, 1, 30588, 10) ~= 1 then
		Say(CK_NPC_NAME..format("<color=red>%s<color> trong tói kh«ng ®ñ <color=red>%d<color> c¸i", "M¶nh LÖnh Bµi Bang Héi", 10), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 19, 1);
	--½±Àø
	gf_ModifyExp(8000000);
	ck_AddCkScore(300);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

function ck_FastTask_Guide()
	local tSay = {
		"\nThÎ th¸ng/ck_FastTask_Guide_1",
		"\nThuèc viªn/ck_FastTask_Guide_2",
		"\nC©y B¸t Nh· Nhá/ck_FastTask_Guide_3",
		"\nN÷ Oa B¶o H¹p vµ Ng«i Sao May M¾n/ck_FastTask_Guide_4",
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."<color=gold>Tèc ChiÕn Tèc Th¾ng<color>-NhiÖm vô h­íng dÉn!", getn(tSay), tSay);
end

--Task3£º20Î»ÊÇ·ñÍê³É
function ck_FastTask_Guide_1(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Guide_1(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"ThÎ Th¸ng", "Kİch ho¹t thÎ th¸ng VIP vâ l©m", "Kİch ho¹t thÎ th¸ng, ch¬i trß ch¬i nhÑ nhµng h¬n", 8000000, 1200);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 20) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if IsActivatedVipCard() ~= 1 then
		Say(CK_NPC_NAME.."VÉn ch­a kİch ho¹t thÎ th¸ng, kh«ng thÓ hoµn thµnh nhiÖm vô!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 20, 1);
	--½±Àø
	gf_ModifyExp(8000000);
	ck_AddCkScore(1200);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Task3£º21,22,23,24Î»
function ck_FastTask_Guide_2(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Guide_2(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"Thuèc viªn", "Ph©n biÖt sö dông 1 lÇn B¹ch CÇu Hoµn, Tam Thanh Hoµn vµ Lôc ThÇn Hoµn", "Sö dông c¸c lo¹i thuèc sÏ gióp b¹n mét tay", 5000000, 300);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 24) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 21) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "B¹ch C©u Hoµn"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 22) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "Tam Thanh hoµn"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 23) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "Lôc ThÇn hoµn"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 24, 1);
	--½±Àø
	gf_ModifyExp(5000000);
	ck_AddCkScore(300);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Ê¹ÓÃ°×¾ÔÍè
function _ck_UseItemBaiJu()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 21, 1);
end

--Ê¹ÓÃÈıÇåÍè
function _ck_UseItemSanQing()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 22, 1);
end

--Ê¹ÓÃÁùÉñÍè
function _ck_UseItemLiuShen()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 23, 1);
end

--Task3£º25,26Î»
function ck_FastTask_Guide_3(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Guide_3(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"C©y B¸t Nh· nhá", "Trång 1 C©y B¸t Nh· Nhá", "Trång C©y B¸t Nh· Nhá, nhËn ®­îc phÇn th­ëng kinh nghiÖm", 5000000, 600);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 26) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 25) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a trång <color=red>%s<color>", "C©y B¸t Nh· nhá"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 26, 1);
	--½±Àø
	gf_ModifyExp(5000000);
	ck_AddCkScore(600);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--ÖÖÖ²Ğ¡°ãÈôÊ÷ÖÖ
function _ck_PlantSmallBanRuo()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 25, 1);
end

--Task3£º27,28,29Î»
function ck_FastTask_Guide_4(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Guide_4(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"N÷ Oa B¶o H¹p vµ Ng«i Sao May M¾n", "Sö dông 1 lÇn N÷ Oa B¶o H¹p vµ Ng«i Sao May M¾n", "N÷ Oa B¶o H¹p vµ Ng«i Sao May M¾n lµ b¶o vËt, më ra xem thö bªn trong cã phÇn th­ëng kh«ng", 5000000, 900);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 29) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 27) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "N÷ Oa B¶o H¹p"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 28) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "Ng«i sao may m¾n"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 29, 1);
	--½±Àø
	gf_ModifyExp(5000000);
	ck_AddCkScore(900);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Ê¹ÓÃÅ®æ´±¦ºĞ
function _ck_UseItemNvWa()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 27, 1);
end

--Ê¹ÓÃĞÒÔËĞÇ
function _ck_UseItemLuckyStart()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 28, 1);
end

function ck_ZiloTask()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhiÖm vô tİch lòy thuéc tİnh/ck_ZiloTask_1",
		"\nNhiÖm vô tiªu phİ ¶i/ck_ZiloTask_2",
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."NhiÖm vô <color=gold>§¹i Phó ¤ng<color>, trong thêi gian ho¹t ®éng chØ ®­îc hoµn thµnh 1 lÇn, cã thÓ nhËn ®­îc nhiÒu kinh nghiÖm vµ ®é n¨ng ®éng!", getn(tSay), tSay);
end

--Task4£º1-7Íê³ÉÇé¿ö
function ck_ZiloTask_1(bTalk)
	local nTaskIndex = 0;
	for i = CK_TASK_ZILON_ATRR_BEGIN, getn(CK_TASK_ZILON_ATRR) do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
			nTaskIndex = i;
			break;
		end
	end
	if nTaskIndex == 0 then
		Say(CK_NPC_NAME..format("Chóc mõng %s ®· hoµn thµnh toµn bé <color=gold>nhiÖm vô tİch lòy thuéc tİnh<color>!", gf_GetPlayerSexName()), 0)
		return 0;
	end
	local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
	if not tCell then  return 0; end
	if not bTalk then
		local tSay = {
			"\nTa muèn hoµn thµnh/#ck_ZiloTask_1(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Str = format("Nh©n vËt ®· ®¹t chuyÓn sinh %d cÊp %d, tİch lòy %d ®iÓm danh väng, %d ®iÓm s­ m«n, %d ®iÓm c«ng tr¹ng", tCell[2][1], tCell[2][2], tCell[2][3], tCell[2][4], tCell[2][5]);
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",	tCell[1], Str, "Nç lùc tİch lòy sÏ gióp b¶n th©n ngµy cµng lín m¹nh", tCell[3][1], tCell[3][2]);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if gf_GetPlayerRebornCount() < tCell[2][1] then
		Say(CK_NPC_NAME..format("CÊp chuyÓn sinh cña %s kh«ng ®ñ <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][1]), 0);
		return 0;
	end
	if GetLevel() < tCell[2][2] and gf_GetPlayerRebornCount() <= tCell[2][1] then
		Say(CK_NPC_NAME..format("§¼ng cÊp cña %s kh«ng ®ñ <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][2]), 0);
		return 0;
	end
	if GetReputation() < tCell[2][3] then
		Say(CK_NPC_NAME..format("§iÓm tİch lòy danh väng cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][3]), 0);
		return 0;
	end
	if GetTask(336) < tCell[2][4] then
		Say(CK_NPC_NAME..format("§iÓm tİch lòy s­ m«n cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][4]), 0);
		return 0;
	end
	if abs(GetTask(701)) < tCell[2][5] then
		Say(CK_NPC_NAME..format("§iÓm tİch lòy c«ng tr¹ng cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][5]), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex, 1);
	--½±Àø
	gf_ModifyExp(tCell[3][1]);
	ck_AddCkScore(tCell[3][2]);
	Msg2Player("NhiÖm vô hoµn thµnh!")
	ck_ZiloTask_1();
end

--Task4£º8-12Íê³ÉÇé¿ö
function ck_ZiloTask_2(bTalk)
	local nTaskIndex = 0;
	for i = CK_TASK_IB_COST_BEGIN, CK_TASK_IB_COST_BEGIN+getn(CK_TASK_IB_COST)-1 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
			nTaskIndex = i - CK_TASK_IB_COST_BEGIN + 1;
			break;
		end
	end
	if nTaskIndex == 0 then
		Say(CK_NPC_NAME..format("Chóc mõng %s ®· hoµn thµnh toµn bé <color=gold>nhiÖm vô tiªu phİ<color>!", gf_GetPlayerSexName()), 0)
		return 0;
	end
	local tCell = CK_TASK_IB_COST[nTaskIndex];
	if not tCell then  return 0; end
	if not bTalk then
		local tSay = {
			"\nTa muèn hoµn thµnh/#ck_ZiloTask_2(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Str = format("Trong ¶i bÊt kú cña §Şa HuyÒn Cung, V¹n KiÕm Tròng, L­¬ng S¬n vµ Th¸i NhÊt Th¸p tİch lòy sö dông %d Thiªn Kiªu LÖnh ®Ó më r­¬ng", tCell[2]);
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d", tCell[1], Str, "Dïng Thiªn Kiªu LÖnh ®Ó më r­¬ng sÏ nhËn ®­îc phÇn th­ëng phong phó", tCell[3][1], tCell[3][2]);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if ck_GetCostIB() < tCell[2] then
		Say(CK_NPC_NAME..format("ë ¶i hiÖn t¹i, sè l­îng Thiªn Kiªu LÖnh do %s tiªu phİ kh«ng ®ñ <color=red>%d<color> c¸i", gf_GetPlayerSexName(), tCell[2]), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1, 1);
	--½±Àø
	gf_ModifyExp(tCell[3][1]);
	ck_AddCkScore(tCell[3][2]);
	Msg2Player("NhiÖm vô hoµn thµnh!")
	ck_ZiloTask_2();
end

--¹Ø¿¨Ïû·ÑÌì½¾ÁîTask5
function ck_GetCostIB()
	return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Task5);
end

--¹Ø¿¨Ïû·Ñ¶ÔÍâ½Ó¿ÚTask5
function _ck_SetCostIB(nNum)
	if ck_IsOpen() ~= 1 then
		--print("SetCostIB",nNum,"not open")
		return 0;
	end
	if ck_GetTitleType() == 0 then
		--print("SetCostIB",nNum,"no titile")
		return 0;
	end
	nNum = nNum or 1;
	--print("GetCostIB",ck_GetCostIB(),CK_TASK_GROUP.Task5)
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task5, ck_GetCostIB() + tonumber(nNum));
end

function ck_QueryScore()
	Say(CK_NPC_NAME..format("%s b©y giê ®iÓm n¨ng ®éng lµ <color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCkScore()), 0);
end

function ck_ScoreAward()
	cd_tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [25] = 1, [26] = 1, [27] = 1, [29] = 1,[30] = 1,}
	local nRoute = GetPlayerRoute()
	if cd_tbRoute [nRoute] ~= 1 then
		Talk(1, "", CK_NPC_NAME.." Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return 0
	end

	local nScore = ck_GetCkScore();
	local tMsg = {
		[0] = "Ch­a hoµn thµnh",
		[1] = "§· hoµn thµnh",
	}
	local tSay = {};
	for i = 1, getn(CK_SCROE_AWARD_TABLE) do
		local nType = CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, i);
		tinsert(tSay, format("%d gi¶i th­ëng ®iÓm n¨ng ®éng (%s)/#ck_view_score_award(%d)", CK_SCROE_AWARD_TABLE[i][1][1], tMsg[nType], i));
	end
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say(CK_NPC_NAME..format("%s b©y giê ®iÓm n¨ng ®éng lµ <color=gold>%d<color>,h·y nhËn gi¶i th­ëng!", gf_GetPlayerSexName(), nScore), getn(tSay), tSay);
end

--function ck_ScoreAward_func_1(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_1(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 1000000, 100, 100, 1000, 10000)..",".."´òÍ¨ÎäÕß¾³½ç"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 1) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if GetLevel() < 90 then
--		Say(CK_NPC_NAME..format("ÄãµÄµÈ¼¶²»×ã%d¼¶,²»ÄÜÁì½±£¡", 90), 0);
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 1, 1);
--	gf_Modify("Exp", 1000000);
--	gf_Modify("Rep", 100);
--	gf_Modify("ShiMen", 100);
--	gf_Modify("JunGong", 1000);
--	local nLevel = MeridianGetLevel()
--	if nLevel < 1 then
--		for i = nLevel + 1, 1 do
--			MeridianUpdateLevel()
--		end
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
--	else
--		gf_Modify("Exp", 1000000);
--	end
--	gf_Modify("ZhenQi", 10000);
--end
--
--function ck_ScoreAward_func_2(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_2(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 2000000, 160, 160, 1400, 0)..",".."5×ª90¼¶"..",".."Ä§¾§200"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 2) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 2, 1);
--	gf_Modify("Exp", 2000000);
--	gf_Modify("Rep", 160);
--	gf_Modify("ShiMen", 160);
--	gf_Modify("JunGong", 1400);
--	AddItem(2,1,30497,200, 4)
--	if gf_GetPlayerRebornCount() < 1 then
--		gf_SetTaskByte(1538, 1, 5); 			--5×ª
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("×ªÉúµÈ¼¶Éı¼¶³É¹¦£¡");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 2000000);
--	end
----	ahf_GetYaoYangByRouteBody(VET_YAOYANG_SHOE);
--end
--
--function ck_ScoreAward_func_3(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_3(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 3000000, 220, 220, 1800, 15000)..",".."´òÍ¨Îä½«¾³½ç"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 3) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if GetLevel() < 90 then
--		Say(CK_NPC_NAME..format("ÄãµÄµÈ¼¶²»×ã%d¼¶,²»ÄÜÁì½±£¡", 90), 0);
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 3, 1);
--	gf_Modify("Exp", 3000000);
--	gf_Modify("Rep", 220);
--	gf_Modify("ShiMen", 220);
--	gf_Modify("JunGong", 1800);
--	local nLevel = MeridianGetLevel()
--	if nLevel < 2 then
--		for i = nLevel + 1, 2 do
--			MeridianUpdateLevel()
--		end
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
--	else
--		gf_Modify("Exp", 1000000);
--	end
--	gf_Modify("ZhenQi", 15000);
--end
--
--function ck_ScoreAward_func_4(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_4(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 4000000, 280, 280, 2200, 0)..",".."Ä§¾§200"..",".."Áè²¨Î¢²½"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 4) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 4, 1);
--	gf_Modify("Exp", 4000000);
--	gf_Modify("Rep", 280);
--	gf_Modify("ShiMen", 280);
--	gf_Modify("JunGong", 2200);
--	AddItem(2,1,30497,200, 4)
--	AddItem(0,112,78,1)
----	if gf_GetPlayerRebornCount() < 2 then
----		gf_SetTaskByte(1538, 1, 2); 			--1×ª
----		SetLevel(90, 1);								  --90¼¶
----		Msg2Player("×ªÉúµÈ¼¶Éı¼¶³É¹¦£¡");
----		PlaySound("\\sound\\sound_i016.wav");
----		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
----	else
----		gf_Modify("Exp", 4000000);
----	end
----	ahf_GetYaoYangByRouteBody(VET_YAOYANG_CLOTH);
--end
--
--function ck_ScoreAward_func_5(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_5(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 5000000, 340, 340, 2600, 25000)..",".."´òÍ¨ÎäÍõ¾³½ç"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 5) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	if GetLevel() < 90 then
--		Say(CK_NPC_NAME..format("ÄãµÄµÈ¼¶²»×ã%d¼¶,²»ÄÜÁì½±£¡", 90), 0);
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 5, 1);
--	gf_Modify("Exp", 5000000);
--	gf_Modify("Rep", 340);
--	gf_Modify("ShiMen", 340);
--	gf_Modify("JunGong", 2600);
--	local nLevel = MeridianGetLevel()
--	if nLevel < 3 then
--		for i = nLevel + 1, 3 do
--			MeridianUpdateLevel()
--		end
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
--	else
--		gf_Modify("Exp", 5000000);
--	end
--	gf_Modify("ZhenQi", 25000);
--end
--
--function ck_ScoreAward_func_6(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_6(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 6000000, 400, 400, 3000, 0)..",".."Ä§¾§200"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 6) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 6, 1);
--	gf_Modify("Exp", 6000000);
--	gf_Modify("Rep", 400);
--	gf_Modify("ShiMen", 400);
--	gf_Modify("JunGong", 3000);
--	AddItem(2,1,30497,200, 4)
----	if gf_GetPlayerRebornCount() < 3 then
----		gf_SetTaskByte(1538, 1, 3); 			--1×ª
----		SetLevel(90, 1);								  --90¼¶
----		Msg2Player("×ªÉúµÈ¼¶Éı¼¶³É¹¦£¡");
----		PlaySound("\\sound\\sound_i016.wav");
----		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
----	else
----		gf_Modify("Exp", 6000000);
----	end
----	ahf_GetYaoYangByRouteBody(VET_YAOYANG_CAP);
--end
--
--function ck_ScoreAward_func_7(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_7(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 7000000, 460, 460, 3400, 30000)
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 7) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	ck_ScoreAward_func_7_Do(1)
----	local tDialog = {}
----	for i = 1, getn(CK_JS_HUIZHANG) do
----		DebugOutput(CK_JS_HUIZHANG[i][1], i)
----		tinsert(tDialog, format("%s/#ck_ScoreAward_func_7_Do(%d)", CK_JS_HUIZHANG[i][1], i));
----	end
----	tinsert(tDialog, "\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing");
----	Say(CK_NPC_NAME.."ÇëÑ¡ÔñÄãĞèÒªµÄÀàĞÍ£º", getn(tDialog), tDialog);
--end
--
--function  ck_ScoreAward_func_7_Do(nIndex)
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 7, 1);
--	gf_Modify("Exp", 7000000);
--	gf_Modify("Rep", 460);
--	gf_Modify("ShiMen", 460);
--	gf_Modify("JunGong", 3400);
--	gf_Modify("ZhenQi", 30000);
--	AddItem(2,1,504,1)
--	--gf_AddItemEx2(CK_JS_HUIZHANG[nIndex][2], CK_JS_HUIZHANG[nIndex][1], "CDKEY", "CDKEY", 0, 1);
--end
--
--function ck_ScoreAward_func_8(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_8(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 8000000, 520, 520, 3800, 0)..",".."4×ª90¼¶"..",".."À×»¢¾«ÆÇ*1"..",".."×ÔÑ¡ÎåĞĞ¹ÒÒÂ"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 8) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	local tDialog = {}
--	for i = 1, getn(CK_JS_GUAIYI) do
--		tinsert(tDialog, format("%s/#ck_ScoreAward_func_8_Do(%d)", CK_JS_GUAIYI[i][1], i));
--	end
--	tinsert(tDialog, "\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing");
--	Say(CK_NPC_NAME.."ÇëÑ¡ÔñÄãĞèÒªµÄÀàĞÍ£º", getn(tDialog), tDialog);
--end
--
--function ck_ScoreAward_func_8_Do(nIndex)
--	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 8, 1);
--	gf_Modify("Exp", 8000000);
--	gf_Modify("Rep", 520);
--	gf_Modify("ShiMen", 520);
--	gf_Modify("JunGong", 3800);
--	if gf_GetPlayerRebornCount() < 4 then
--		gf_SetTaskByte(1538, 1, 4); 			--1×ª
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("×ªÉúµÈ¼¶Éı¼¶³É¹¦£¡");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 10000000);
--	end
--	gf_AddItemEx2({2, 1, 30614, 1, 4}, "À×»¢¾«ÆÇ", "CDKEY", "CDKEY", 0, 1);
--	gf_AddItemEx2(CK_JS_GUAIYI[nIndex][2], CK_JS_GUAIYI[nIndex][1], "CDKEY", "CDKEY", 0, 1);
--end
--
--function ck_ScoreAward_func_9(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_9(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 9000000, 580, 580, 4200, 0)..",".."5×ª90¼¶"..",".."×ÔÑ¡ÎåĞĞĞ¬×Ó"..",".."À×»¢¾«ÆÇ*1"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 9) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	local tDialog = {}
--	for i = 1, getn(CK_JS_SHOE) do
--		tinsert(tDialog, format("%s/#ck_ScoreAward_func_9_Do(%d)", CK_JS_SHOE[i][1], i));
--	end
--	tinsert(tDialog, "\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing");
--	Say(CK_NPC_NAME.."ÇëÑ¡ÔñÄãĞèÒªµÄÀàĞÍ£º", getn(tDialog), tDialog);
--end
--
--function ck_ScoreAward_func_9_Do(nIndex)
--	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 9, 1);
--	gf_Modify("Exp", 9000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	if gf_GetPlayerRebornCount() < 5 then
--		gf_SetTaskByte(1538, 1, 5); 			--1×ª
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("×ªÉúµÈ¼¶Éı¼¶³É¹¦£¡");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 13000000);
--	end
--	gf_AddItemEx2({2, 1, 30614, 1, 4}, "À×»¢¾«ÆÇ", "CDKEY", "CDKEY", 0, 1);
--	gf_AddItemEx2(CK_JS_SHOE[nIndex][2], CK_JS_SHOE[nIndex][1], "CDKEY", "CDKEY", 0, 1);
--end
--
--function ck_ScoreAward_func_10(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_10(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 10000000, 580, 580, 4200, 0)..",".."Ò«ÑîÎäÆ÷£¨°´ÌåĞÍÁ÷ÅÉ£©"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 10) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 10, 1);
--	gf_Modify("Exp", 10000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	ahf_GetYaoYangWeaponRand(1);
--end
--
--function ck_ScoreAward_func_11(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_11(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 11000000, 580, 580, 4200, 0)..",".."Õ½¿ñÍ·²¿"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 11) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	ck_ScoreAward_func_11_Do();
--end
--
--function ck_ScoreAward_func_11_Do()
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 11, 1);
--	gf_Modify("Exp", 11000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	ahf_GetEquipByRouteBody(VET_ZHANKUANG_CAP);
--end
--
--function ck_ScoreAward_func_12(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_12(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 12000000, 580, 580, 4200, 0)..",".."×ÔÑ¡Ò«Ñô2¼¶Ê×ÊÎ"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 12) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	local tDialog = {}
--	for i = 1, getn(CK_YAOYANG_JIEZI_1) do
--		tinsert(tDialog, format("%s/#ck_ScoreAward_func_12_Do(%d)", CK_YAOYANG_JIEZI_1[i][1], i));
--	end
--	tinsert(tDialog, "\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing");
--	Say(CK_NPC_NAME.."ÇëÑ¡ÔñÄãĞèÒªµÄÀàĞÍ£º", getn(tDialog), tDialog);
--end
--
--function ck_ScoreAward_func_12_Do(nIndex)
--	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 12, 1);
--	gf_Modify("Exp", 12000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	gf_AddItemEx2(CK_YAOYANG_JIEZI_1[nIndex][2], CK_YAOYANG_JIEZI_1[nIndex][1], "CDKEY", "CDKEY", 0, 1)
--end
--
--function ck_ScoreAward_func_13(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_13(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 18000000, 580, 580, 4200, 0)..",".."5¼¶ÔÌÁé"..",".."×ÔÑ¡Ò«Ñô2¼¶Ê×ÊÎ"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 13) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	local tDialog = {}
--	for i = 1, getn(CK_YAOYANG_JIEZI_2) do
--		tinsert(tDialog, format("%s/#ck_ScoreAward_func_13_Do(%d)", CK_YAOYANG_JIEZI_2[i][1], i));
--	end
--	tinsert(tDialog, "\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing");
--	Say(CK_NPC_NAME.."ÇëÑ¡ÔñÄãĞèÒªµÄÀàĞÍ£º", getn(tDialog), tDialog);
--end
--
--function ck_ScoreAward_func_13_Do(nIndex)
--    if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 13, 1);
--	gf_Modify("Exp", 18000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	--5¼¶ÔÌÁé
--	local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
--	gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
--	gf_AddItemEx2(CK_YAOYANG_JIEZI_2[nIndex][2], CK_YAOYANG_JIEZI_2[nIndex][1], "CDKEY", "CDKEY", 0, 1)
--end
--
--function ck_ScoreAward_func_14(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_14(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 28000000, 580, 580, 4200, 0)..",".."Õ½¿ñÒÂ·ş£¨°´ÌåĞÍÁ÷ÅÉ£©"..",".."Îå¼¶ÔÌÁé"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 14) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 14, 1);
--	gf_Modify("Exp", 28000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	--Õ½¿ñÒÂ·ş
--	ahf_GetEquipByRouteBody(VET_ZHANKUANG_CLOTH);
--	--5¼¶ÔÌÁé
--	local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
--	gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
--end
--
--function ck_ScoreAward_func_15(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_15(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 32000000, 580, 580, 4200, 0)..",".."Õ½¿ñ¿ã×Ó£¨°´ÌåĞÍÁ÷ÅÉ£©"..",".."Îå¼¶ÔÌÁé"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 15) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 15, 1);
--	gf_Modify("Exp", 32000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	--Õ½¿ñ¿ã×Ó
--	ahf_GetEquipByRouteBody(VET_ZHANKUANG_SHOE);
--	--5¼¶ÔÌÁé
--	local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
--	gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
--end
--
--function ck_ScoreAward_func_16(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_16(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 36000000, 580, 580, 4200, 0)..",".."6×ª90¼¶"..",".."Îå¼¶ÔÌÁé"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 16) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 16, 1);
--	gf_Modify("Exp", 36000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	if gf_GetPlayerRebornCount() < 6 then
--		gf_SetTaskByte(1538, 1, 5); 			--1×ª
--		PlayerReborn(1,random(1,4))
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("×ªÉúµÈ¼¶Éı¼¶³É¹¦£¡");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 30000000);
--	end
--	--5¼¶ÔÌÁé
--	local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
--	gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
--end
--
--function ck_ScoreAward_func_17(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_17(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 40000000, 580, 580, 4200, 0)..",".."Õ½¿ñÎäÆ÷£¨°´ÌåĞÍÁ÷ÅÉ£©"..",".."ÖĞ¼¶ÁéÊŞµ°"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 17) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 17, 1);
--	gf_Modify("Exp", 40000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	gf_AddItemEx2({2, 1, 30727, 1, 4}, "ÖĞ¼¶ÁéÊŞµ°", "CDKEY", "CDKEY", 0, 1)
--	ahf_GetEquipByRouteBody(VET_ZHANKUANG_WEAPON)
--end
--
--function ck_ScoreAward_func_18(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_18(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 44000000, 580, 580, 4200, 0)..",".."Ëæ»ú4~6¼¶±¦Ê¯"..",".."¸ß¼¶ÁéÊŞµ°"..",".."6¼¶ÔÌÁé"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 18) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	if gf_Judge_Room_Weight(2, 200, " ") ~= 1 then
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 18, 1);
--	gf_Modify("Exp", 44000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	gf_AddItemEx2({2, 1, 30728, 1, 4}, "¸ß¼¶ÁéÊŞµ°", "CDKEY", "CDKEY", 0, 1)
--	ck_GiveRandGem456()
--	--6¼¶ÔÌÁé
--	local nRandIndex = random(getn(CK_6_LEVEL_YUNLING));
--	gf_AddItemEx2(CK_6_LEVEL_YUNLING[nRandIndex][2], CK_6_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
--end
--
--function ck_ScoreAward_func_19(nCurScore, nNeedScore, bTalk)
--	if not bTalk then
--		local tSay = {
--			format("\nÁìÈ¡½±Àø/#ck_ScoreAward_func_19(%d,%d,1)", nCurScore, nNeedScore),
--			"\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--		}
--		local Msg = format("¾­Ñé%s£¬ÉùÍû%d£¬Ê¦ÃÅ¹±Ï×¶È%d£¬¾ü¹¦Öµ%d£¬ÕæÆøÖµ%d", 48000000, 580, 580, 4200, 0)..",".."[ÈÎÎñ´ïÈË]³ÆºÅ"..",".."6¼¶ÔÌÁé"
--		Say(CK_NPC_NAME..format("µ±Ç°¿ÉÁìÈ¡½±Àø£º\n   <color=green>%s<color>\n<color=red>²»ÄÜÔÙ¸øÓëµÄ½±Àø½«ÓÃÒ»¶¨ÊıÁ¿µÄ¾­ÑéÌæ´ú<color>", Msg), getn(tSay), tSay);
--		return 0;
--	end
--	if tonumber(nCurScore) < tonumber(nNeedScore) then
--		Say(CK_NPC_NAME..format("»îÔ¾¶È»ı·ÖÃ»ÓĞ´ïµ½<color=red>%d<color>,²»ÄÜÁìÈ¡½±Àø£¡", tonumber(nNeedScore)), 0);
--		return 0;
--	end
--	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 19) ~= 0 then
--		Say(CK_NPC_NAME.."ÄãÒÑ¾­ÁìÈ¡¹ı¸Ã½±ÀøÁË£¡", 0);
--		return 0;
--	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 19, 1);
--	gf_Modify("Exp", 48000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
--	--6¼¶ÔÌÁé
--	local nRandIndex = random(getn(CK_6_LEVEL_YUNLING));
--	gf_AddItemEx2(CK_6_LEVEL_YUNLING[nRandIndex][2], CK_6_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
--	AddTitle(68, 4);
--	SetTitleTime(68, 4, GetTime() + 60 * 24 * 3600);
--	Msg2Player(format("Äã»ñµÃ[%s]³ÆºÅ", "ÈÎÎñ´ïÈË"))
--end

