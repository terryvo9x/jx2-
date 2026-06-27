Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--²âÊÔ
DebugOutput = nothing

--ÊÇ·ñÎªÐÂ·þ·þÎñÆ÷
--Experience server Switch
CK_ES_SWITCH = 0;
EXT_CDKEY = 3	

function _ck_check_tong()
	if IsTongMember() <= 0 then
		--Say(CK_NPC_NAME.."²»Âú×ãÌõ¼þ£¬²»ÄÜÍê³ÉÈÎÎñ£¡", 0);
		return 0;
	end
	return 1
end
function _ck_check_shili()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp > 0 and nCamp <= 3 then
		return 1
	end
	return 0
end
function _ck_check_yueka()
	if IsActivatedVipCard() ~= 1 then
		--Say(CK_NPC_NAME.."Äú»¹Ã»ÓÐ¼¤»îÈÎºÎÔÂ¿¨£¬²»ÄÜÍê³ÉÈÎÎñ£¡", 0);
		return 0;
	end
	return 1
end
function _ck_del_300_ziguangjifen()
	--¿Û×Ï¹â»ý·Ö
	local TSK_POINT = 652;			--¼ÇÂ¼Íæ¼Ò¸öÈË¹Ø¿¨»ý·Ö
	if GetTask(TSK_POINT) < 300 then
		Say(CK_NPC_NAME..format("§iÓm tÝch lòy tö quang kh«ng ®ñ <color=red>%d<color> ®iÓm", 300), 0);
		return 0;
	end
	SetTask(TSK_POINT, GetTask(TSK_POINT) - 300);
	return 1
end
function _ck_check_300_ziguangjifen()
	local TSK_POINT = 652;			--¼ÇÂ¼Íæ¼Ò¸öÈË¹Ø¿¨»ý·Ö
	if GetTask(TSK_POINT) < 300 then
		return 0;
	end
	return 1
end

--ÓÃÒ»ÕÅ±íÀ´¼ÇÂ¼ËùÓÐÈÎÎñ ÒÔÇ°´¿ÊÖ¹¤ÖÆ×÷ÊÜ²»ÁË
CK_EXT_AWARD = 0
T_CK_TASK_LIST = {
	--{enable, name,{condition,desc},{exp,score,exaward_func,ext_rate},{task_index,task_bit_get,task_bit_finish|func_check_finish,task_bit_award}}
	--°ÙÕ½²»´ù Èý·½ÊÆÁ¦ÈÎÎñ
	[1101] = {0, "VËn tiªu", {"Hoµn thµnh 1 lÇn nhiÖm vô vËn tiªu", "§Õn b¶n ®å thÕ lùc chç NPC Tiªu §Çu TrÊn ViÔn Tiªu Côc ®Ó nhËn nhiÖm vô vËn tiªu"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 1, 2, 3}},
	[1102] = {0, "C­íp tiªu", {"Hoµn thµnh 1 lÇn nhiÖm vô c­íp tiªu", "§Õn b¶n ®å thÕ lùc chç NPC Tiªu §Çu TrÊn ViÔn Tiªu Côc ®Ó nhËn nhiÖm vô ®o¹t tiªu"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 4, 5, 6}},
	[1103] = {0, "Thu thËp Ngäc Ph¸ch", {"Thu thËp 1 Ngäc Ph¸ch", "§Õn Th¸i H­ Cæ Thô cña thÕ lùc trång 1 h¹t gièng, thu thËp 1 Ngäc Ph¸ch"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 7, 8, 9}},
	[1104] = {0, "Trém Ngäc Ph¸ch", {"§Õn thÕ lùc kh¸c trém 1 Ngäc Ph¸ch", "Vµo b¶n ®å thÕ lùc kh¸c ®Ó trém 1 Ngäc Ph¸ch"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 10, 11, 12}},
	[1105] = {0, "T©y Vùc TruyÒn §¹o", {"Tham gia tÝnh n¨ng T©y Vùc TruyÒn §¹o, nhÊp vµo 3 th¸nh vËt ®Ó nhËn th­ëng", "Vµo b¶n ®å thÕ lùc tham gia tÝnh n¨ng T©y Vùc TruyÒn §¹o, nhÊp vµo 3 th¸nh vËt ®Ó nhËn th­ëng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 13, 14, 15}},
	[1106] = {0, "BOSS ThÕ Lùc", {"NhËn b¶o vÖ BOSS cña thÕ lùc vµ tiªu diÖt BOSS cña thÕ lùc phe ®Þch ®Ó nhËn ®­îc phÇn th­ëng", "Buæi tèi sÏ xuÊt hiÖn BOSS cña thÕ lùc phe ta hoÆc phe ®Þch, b¶o vÖ BOSS cña phe ta vµ tiªu diÖt BOSS cña phe ®Þch sÏ nhËn ®­îc phÇn th­ëng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 16, 17, 18}},
	[1107] = {0, "Thî S¨n TiÒn Th­ëng", {"Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng", "Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 19, 20, 21}},
	[1108] = {0, "NhiÖm vô §µo Kho B¸u", {"Hoµn thµnh 1 lÇn nhiÖm vô §µo Kho B¸u", "Vµo thÕ lùc nhËn 1 Tµng B¶o §å, hoµn thµnh 1 lÇn nhiÖm vô §µo Kho B¸u"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 22, 23, 24}},
	
	--°ÙÕ½²»´ù ¸±±¾ÈÎÎñ
--	[1201] = {},
--	[1202] = {},
--	[1203] = {},
--	[1204] = {},
--	
--	--°ÙÕ½²»´ù PvPÈÎÎñ
--	[1301] = {},
--	[1302] = {},
--	[1303] =  {0, "Èý·½ÊÆÁ¦pk", {"´ò°ÜÆäËûÊÆÁ¦µÄ1Î»µÐ¶ÔÍæ¼Ò", "É±ËÀµÐ¶ÔÊÆÁ¦µÄ1ÃûÍæ¼Ò£¬Ö¤Ã÷ÄãµÄÄÜÁ¦£¡"}, {8000000, 24}, {8, 25, 26, 27}},
--	[1304] = {},
--	[1305] = {},
--	[1306] = {},
--	[1307] = {},
	
	--ËÙÕ½ËÙ¾ö °ï»áÈÎÎñ
	[2101] = {0, "Gia nhËp bang héi", {"Gia nhËp mét bang héi bÊt kú, trë thµnh mét thµnh viªn trong bang", "Gia nhËp bang héi, cïng víi thµnh viªn kh¸c cè g¾ng ®Ó gióp bang héi ngµy cµng lín m¹nh"}, {3000000, 100}, {9, 0, _ck_check_tong, 1}},
	[2102] = {0, "T¸i chiÕn ThÇn Thó", {"Nép 300 ®iÓm tÝch lòy tö quang (Sau khi giao nhiÖm vô th× hai bªn sÏ bÞ trõ 300 ®iÓm tÝch lòy tö quang)", "ChØ cã ng­¬i míi cã thÓ thuÇn phôc Tö Quang ThÇn Thó!"}, {5000000, 100, _ck_del_300_ziguangjifen}, {9, 0, _ck_check_300_ziguangjifen, 2}},
	[2103] = {0, "Nép ®iÓm cèng hiÕn bang héi", {"Tham gia tÝnh n¨ng Bang Héi Vinh Danh, giao nép 10 ®iÓm cèng hiÕn bang héi", "Tham gia tÝnh n¨ng Bang Héi Vinh Danh, giao nép 10 ®iÓm cèng hiÕn bang héi"}, {8000000, 100}, {9, 0, 3, 4}},
	[2104] = {0, "NhËn phÇn th­ëng Bang Héi Vinh Danh", {"NhËn phÇn th­ëng Bang Héi Vinh Danh", "Tham gia tÝnh n¨ng Bang Héi Vinh Danh vµ nhËn phÇn th­ëng"}, {10000000, 300}, {9, 0, 5, 6}},
	
	[2201] = {0, "ThÎ Th¸ng", {"KÝch ho¹t 1 thÎ th¸ng", "KÝch ho¹t thÎ th¸ng, ch¬i trß ch¬i nhÑ nhµng h¬n"}, {5000000, 1200}, {10, 0, _ck_check_yueka, 1}},
	[2202] = {0, "Gia nhËp thÕ lùc", {"Gia nhËp 1 thÕ lùc trong ba phe", "Gia nhËp 1 thÕ lùc trong ba phe"}, {5000000, 300}, {10, 0, _ck_check_shili, 2}},
	[2203] = {0, "VËn tiªu", {"Hoµn thµnh 1 lÇn vËn tiªu", "Vµo thÕ lùc nhËn nhiÖm vô vËn tiªu, hoµn thµnh 1 lÇn vËn tiªu"}, {5000000, 600}, {10, 0, 3, 4}},
	[2204] = {0, "C­íp tiªu", {"Hoµn thµnh 1 lÇn c­íp tiªu", "Vµo thÕ lùc nhËn nhiÖm vô c­íp tiªu, hoµn thµnh 1 lÇn c­íp tiªu"}, {5000000, 600}, {10, 0, 5, 6}},
	[2205] = {0, "Trång c©y", {"Hoµn thµnh 1 lÇn nhiÖm vô trång c©y", "Vµo thÕ lùc chç C©y Th¸i H­ hoµn thµnh 1 lÇn nhiÖm vô trång c©y"}, {5000000, 600}, {10, 0, 7, 8}},
	[2206] = {0, "§µo r­¬ng", {"Hoµn thµnh 1 lÇn nhiÖm vô ®µo r­¬ng", "Hoµn thµnh 1 lÇn nhiÖm vô ®µo r­¬ng"}, {5000000, 600}, {10, 0, 9, 10}},
	[2207] = {0, "Thî S¨n TiÒn Th­ëng", {"Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng", "Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng"}, {5000000, 600}, {10, 0, 11, 12}},
	[2208] = {0, "T©y Vùc TruyÒn §¹o", {"Dïng 1 ®¹o cô bÊt kú sau ®©y: Kim L¨ng Töu, Tµng KiÕm BÝ TruyÒn T©m Kinh, B¸ch HiÓu Sinh BÝ Ph¸p", "Tham gia tÝnh n¨ng T©y Vùc TruyÒn §¹o, sö dông 1 ®¹o cô bÊt kú sau ®©y: Kim L¨ng Töu, Tµng KiÕm BÝ TruyÒn T©m Kinh, B¸ch HiÓu Sinh BÝ Ph¸p"}, {5000000, 600}, {10, 0, 13, 14}},
}

--ÈÎÎñ×éÁÐ±í,ÓÃÓÚÉú³ÉÈÎÎñ¶Ô»°
T_CK_TASK_GROUP_LIST = {
	--name, {type,desc}, {sub_list_group}
	[1] = {
		"Tr¨m TrËn Tr¨m Th¾ng", {1, "H»ng ngµy nhËn ngÉu nhiªn, nhËn ®­îc nhiÒu EXP vµ ®é n¨ng ®éng!"},
		{
			--name, random_count, {task_index_list}
			[1] = {"NhiÖm vô ThÕ Lùc Ba Phe", 4, {1101,1102,1103,1104,1105,1106,1107,1108}}, --°ÙÕ½²»´ù-Èý·½ÊÆÁ¦ÈÎÎñ
		},
	},
	[2] = {
		"Tèc ChiÕn Tèc Th¾ng", {2, "Trong thêi gian ho¹t ®éng chØ hoµn thµnh 1 lÇn, nhËn ®­îc nhiÒu EXP vµ ®é n¨ng ®éng!"},
		{
			[1] = {"NhiÖm vô bang héi", 0, {2101,2102,2103,2104}}, --ËÙÕ½ËÙ¾ö-°ï»áÈÎÎñ
			[2] = {"NhiÖm vô h­íng dÉn", 0, {2201,2202,2203,2204,2205,2206,2207,2208}}, --ËÙÕ½ËÙ¾ö-Ö¸ÒýÈÎÎñ
		},
	},
}

function ck_task_daily_clear()--Ã¿ÈÕÇåÀí
	--°ÙÕ½²»´ùÈÎÎñ±äÁ¿ÇåÀí
	local t = T_CK_TASK_GROUP_LIST[1][3]
	for _,t1 in t do
		for _,task_index in t1[3] do
			local tBitSet = _ck_get_task_bitset(task_index)
			local nGroupTaskIndex = tBitSet[1]
			local nBitGet = tBitSet[2]
			local nBitFinish = tBitSet[3]
			local nBitAward = tBitSet[4]
			if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
				print("ck_task_daily_clear", task_index, nGroupTaskIndex, nBitGet, nBitFinish, nBitAward)
			end
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitGet, 0)
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 0)
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 0)
		end
	end
end

--Íâ²¿µ÷ÓÃ ÉèÖÃÄ³Ò»¸öÈÎÎñÎªÍê³É×´Ì¬
function ck_global_set_task_finish(nTaskIndex)
	--gf_TeamOperateEX(function()
		local t = _ck_get_task_cfg(nTaskIndex)
		if ck_IsOpen() ~= 1 then
			if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
				print("ck_global_set_task_finish not open", nTaskIndex)
			end
			return 0;
		end
		if ck_GetTitleType() == 0 then
			if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
				print("ck_global_set_task_finish title error", nTaskIndex)
			end
			return 0;
		end
		if _ck_check_task_enable(nTaskIndex)==0 then
			if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
				print("ck_global_set_task_finish not enable", nTaskIndex)
			end
			return 0
		end
		if _ck_check_task_getflag(nTaskIndex)~=1 then
			if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
				print("ck_global_set_task_finish not get", nTaskIndex)
			end
			return 0
		end
		local tBitSet = _ck_get_task_bitset(nTaskIndex)
		local nGroupTaskIndex = tBitSet[1]
		local nBitFinish = tBitSet[3]
		local szTaskName = t[2]
		if type(nBitFinish)=="number" and nBitFinish > 0 then
			if CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBitFinish) ~= 1 then
    		--ck_BZBD_SetType(14, 15, 16);
    		CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 1);
    		Msg2Player(format("B¹n ®· hoµn thµnh CD Key nhiÖm vô [%s]", szTaskName));
    	end
    else
    	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
				print("ck_global_set_task_finish bit error", nTaskIndex, nGroupTaskIndex, nBitFinish, szTaskName)
			end
    	--error(format("CDKey: no need to set finish of task %d", %nTaskIndex))
		end
	--end);
end

function ck_task_group_talk1(nMainIndex)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	
	local t = T_CK_TASK_GROUP_LIST[nMainIndex]
	local tSay = {}
	local szTitle = format("<color=gold>%s<color>%s, %s", t[1], "NhiÖm vô", t[2][2])
	for i, tTaskGroup in T_CK_TASK_GROUP_LIST[nMainIndex][3] do
		tinsert(tSay, format("%s/#ck_task_group_talk2(%d, %d)", tTaskGroup[1], nMainIndex, i))
	end
	tinsert(tSay, format("%s/nothing", "T¹i h¹ chØ xem qua th«i"))
	Say(CK_NPC_NAME..szTitle, getn(tSay), tSay)
end

function ck_task_group_talk2(nMainIndex, nSubIndex)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	
	local t = T_CK_TASK_GROUP_LIST[nMainIndex]
	local tt = t[3][nSubIndex]
	local nRandCnt = tt[2]
	local tTaskList = tt[3]
	if nRandCnt > 0 then --Ã»ÓÐÁìÈ¡ÈÎÎñµÄ»°Ëæ»úÉú³É
		_ck_rand_task_list(tTaskList, nRandCnt)
	end
	
	local tSay = {}
	local szTitle = format("<color=gold>%s<color>%s", t[1], tt[1])
	for _, nTaskIndex in tTaskList do
		local szStatus = _ck_get_task_status(nTaskIndex)
		if _ck_check_task_getflag(nTaskIndex)==1 then
			local t = _ck_get_task_cfg(nTaskIndex)
			tinsert(tSay, format("%s(%s)/#ck_task_talk(%d)", t[2] , szStatus, nTaskIndex))
		end
	end
	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
		tinsert(tSay, format("%s/ck_DailyReset", "dailyclear"))
	end
	tinsert(tSay, format("%s/nothing", "T¹i h¹ chØ xem qua th«i"))
	Say(CK_NPC_NAME..szTitle, getn(tSay), tSay)
end

--ÈÎÎñ¶Ô»°
function ck_task_talk(nTaskIndex)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	if _ck_check_task_enable(nTaskIndex)==0 then
		return 0
	end
	local t = _ck_get_task_cfg(nTaskIndex)
	local tSay = {}
	tinsert(tSay, format("\n%s/#_ck_task_award(%d)", "Hoµn thµnh nhiÖm vô", nTaskIndex))
	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
		tinsert(tSay, format("\n%s/#ck_global_set_task_finish(%d)", "debugfinish", nTaskIndex))
	end
	tinsert(tSay, format("\n%s/nothing", "T¹i h¹ chØ xem qua th«i"))
	local szStatus = _ck_get_task_status(nTaskIndex)
	local Msg = format("Tªn nhiÖm vô: <color=gold>%s(%s)<color>\n§iÒu kiÖn:\n  %s\nH­íng dÉn:\n  %s\nPhÇn th­ëng:\n  EXP: %d, ®é n¨ng ®éng: %d",
		t[2], szStatus, t[3][1], t[3][2], t[4][1], t[4][2])
	Say(CK_NPC_NAME..Msg, getn(tSay), tSay)
end

function _ck_get_task_bitset(nTaskIndex)
	local t = _ck_get_task_cfg(nTaskIndex)
	return t[5]
end

--»ñÈ¡Ëæ»úÈÎÎñ
function _ck_rand_task_list(tTaskList, nCount)
	if nCount <= 0 then
		return
	end
	local nPass = 0
	local nMaxPass = 0
	local nGet = 0
	if ck_GetTitleType()==3 then--»îÔ¾ÕßÉÙÒ»¸öÈÎÎñ
		nMaxPass = 1
	end
	
	for i = 1,getn(tTaskList) do --ÏÈ¼ì²éÓÐÃ»ÓÐÈÎÎñ
		local nTaskIndex = tTaskList[i]
		if _ck_check_task_getflag(nTaskIndex) == 1 then --ÒÑ¾­ÓÐÈÎÎñ¾Í²»ÓÃËæ»úÁË
			return
		end
		if _ck_check_task_enable(nTaskIndex)==2 then
			if nPass<nMaxPass then
				nPass = nPass + 1
			else
				_ck_set_task_getflag(nTaskIndex)
				nGet = nGet + 1
			end
		end
	end
	
	if nGet>0 then
		return
	end
	
	local tGet = {}
	local nRand = min(nCount,getn(tTaskList))
	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
		print("_ck_rand_task_list", nCount, nRand)
	end
	for i=1,nRand do
		for j=1,5 do --×î¶à³åÍ»5´Î
			local nR = random(1,getn(tTaskList))
			if not tGet[nR] then
				local nTaskIndex = tTaskList[nR]
				tGet[nR] = 1
				if nPass<nMaxPass then
  				nPass = nPass + 1
  			else
  				_ck_set_task_getflag(nTaskIndex)
  				nGet = nGet + 1
  			end
				_ck_set_task_enable(nTaskIndex, 2)
				break
			end
		end
	end
end

function _ck_task_award(nTaskIndex)
	if ck_CheckCondition() ~= 1 then
		if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
			print("condition false")
		end
		return 0;
	end
	if _ck_check_task_enable(nTaskIndex)==0 then
		if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
			print(format("disable task %d", nTaskIndex))
		end
		return 0
	end
	if _ck_check_task_getflag(nTaskIndex)~=1 then
		Talk(1, "", "Kh«ng cã nhiÖm vô nµy")
		return 0
	end
	if _ck_check_task_awardflag(nTaskIndex)==1 then
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nhiÖm vô nµy råi!")
		return 0
	end
	if _ck_check_task_finishflag(nTaskIndex)~=1 then
		Talk(1, "", "NhiÖm vô nµy vÉn ch­a hoµn thµnh!")
		return 0
	end
	
	local t = _ck_get_task_cfg(nTaskIndex)
	if t[4][3] and (t[4][3]() ~= 1) then--¶îÍâµÄ½±Àøº¯Êý
		return 0
	end
	
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBitAward = tBitSet[4]
	CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 1)
	local ext = t[4][4] or 0
	gf_ModifyExp(floor(t[4][1]*(1+ext)))
	ck_AddCkScore(floor(t[4][2]*(1+ext)))
	Msg2Player(format("Chóc mõng hoµn thµnh nhiÖm vô [%s]", t[2]))
end

function _ck_get_task_cfg(nTaskIndex)
	local t = T_CK_TASK_LIST[nTaskIndex]
	if not t then
		error(format("CDKey: not find task %d", nTaskIndex))
	end
	return t
end

function _ck_get_task_status(nTaskIndex)
	local nType = 0
	local tType = {"Ch­a hoµn thµnh", "Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	if _ck_check_task_enable(nTaskIndex)==0 then
		nType = 1
	elseif _ck_check_task_getflag(nTaskIndex)~=1 then
		nType = 2
	elseif _ck_check_task_finishflag(nTaskIndex)~=1 then
		nType = 3
	elseif _ck_check_task_awardflag(nTaskIndex)~=1 then
		nType = 4
	else
		nType = 5
	end
	return tType[nType] or ""
end

function _ck_set_task_getflag(nTaskIndex)--ÉèÖÃÒÑ½ÓÊÜ±êÖ¾
	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
		print("_ck_set_task_getflag", nTaskIndex)
	end
	if _ck_check_task_enable(nTaskIndex)==0 then--Î´¿ªÆôÈÎÎñ²»ÄÜ½Ó
		return 0
	end
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBit = tBitSet[2]
	if nBit and nBit > 0 then
		return CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBit, 1)
	end
	return 1 --²»ÐèÒª½ÓÊÜ
end

function _ck_check_task_getflag(nTaskIndex)--¼ì²éÊÇ·ñÒÑ½ÓÊÜÈÎÎñ
	if _ck_check_task_enable(nTaskIndex)==0 then--Î´¿ªÆôÈÎÎñ²»ÄÜ½Ó
		return 0
	end
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBit = tBitSet[2]
	if nBit and nBit > 0 then
		local nRet = CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
		if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
			print("task_getflag", nTaskIndex, nGroupTaskIndex, nBit, nRet)
		end
		return nRet
	end
	return 1 --²»ÐèÒª½ÓÊÜ
end
function _ck_check_task_enable(nTaskIndex)--¼ì²éÊÇ·ñ¿ªÆô
	if not nTaskIndex or not T_CK_TASK_LIST[nTaskIndex] then--ÈÎÎñÎ´¶¨Òå
		return 0
	end
	local t = _ck_get_task_cfg(nTaskIndex)
	return t[1]
end
function _ck_check_task_finishflag(nTaskIndex)--¼ì²éÊÇ·ñÒÑÍê³É
	if _ck_check_task_enable(nTaskIndex)==0 then--Î´¿ªÆôÈÎÎñ²»ÄÜ½Ó
		return 0
	end
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBit = tBitSet[3]
	if nBit then
		if type(nBit) == "function" then
			return nBit()
    	elseif nBit and nBit > 0 then
    		return CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
    	else
    		return 1
    	end
	end
	return 0
end
function _ck_check_task_awardflag(nTaskIndex)--¼ì²éÊÇ·ñÒÑÁìÈ¡½±Àø
	if _ck_check_task_enable(nTaskIndex)==0 then--Î´¿ªÆôÈÎÎñ²»ÄÜ½Ó
		return 1
	end
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBit = tBitSet[4]
	if nBit and nBit > 0 then
		return CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
	end
	error(format("CDKey: award bit error %d", nTaskIndex))
	return 1 --½±Àøbit±ØÐë´æÔÚ
end

function _ck_set_task_enable(nTaskIndex, nFlag)
	local t = _ck_get_task_cfg(nTaskIndex)
	t[1] = nFlag or 1
--	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
--		print("set_task_enable", nTaskIndex)
--	end
end
function _ck_auto_set_task_enable()
	for _,t1 in T_CK_TASK_GROUP_LIST do
		for _,t2 in t1[3] do
			for _,task_index in t2[3] do
				_ck_set_task_enable(task_index)
			end
		end
	end
	--_ck_set_task_enable(1303)
end
_ck_auto_set_task_enable();--auto execute to reset tasks enabled flags

--ÓÂÍùÖ±Ç°ÏµÁÐÈÎÎñ
CK_TASK_FORWARD = {
	[1] = {"Tiªu diÖt ¸c Lang", 226},
	[2] = {"Tiªu diÖt Hå Ly", 227},
	[3] = {"Tiªu diÖt Xi Háa XÝch Gi¸o §å", 228},
	[4] = {"Tiªu diÖt Th­¬ng Viªn", 229},
	[5] = {"Tiªu diÖt Miªu LÜnh Thæ Ty", 230},
	[6] = {"Tiªu diÖt Ba T­ Yªu C¬", 231},
	[7] = {"Tiªu diÖt Oa Quèc §ao Kh¸ch", 232},
	[8] = {"Tiªu diÖt Tú Bµ Tiªn Tö", 233},
}

--°ÙÕ½²»´ùÉ±¹ÖÈÎÎñ
CK_TASK_BZ_KILL = {
	[1] = {"Quay VÒ Chèn Cò", 234},
	[2] = {"Quay VÒ Chèn Cò", 235},
	[3] = {"Quay VÒ Chèn Cò", 236},
	[4] = {"Quay VÒ Chèn Cò", 237},
	[5] = {"Quay VÒ Chèn Cò", 238},
}

--°ÙÕ½²»´ù¸±±¾ÈÎÎñ(×î¶à5¸ö)
CK_TASK_BZ_RAID = {
	[1] = "Tham gia 1 lÇn ¶i Th¸i H­",
	[2] = "Tham gia 1 lÇn ¶i L­¬ng S¬n ",
	[3] = "Tham gia 1 lÇn ¶i V¹n KiÕm Tròng",
	[4] = "Tham gia 1 lÇn ¶i §Þa HuyÒn Cung",
	[5] = "Tham gia 1 lÇn ¶i Th¸i NhÊt Th¸p",
}

--°ÙÕ½²»´ùPVPÈÎÎñ
CK_TASK_BZ_PVP = {
	[1] = "Tham gia 3 lÇn thi ®Êu 1v1",
	[2] = "Tham gia 3 lÇn thi ®Êu 3v3",
	[3] = "§¸nh b¹i 1 ng­êi ch¬i phe ®Þch cña thÕ lùc kh¸c",	--"²ÎÓëÒ»´ÎÌìÃÅÕóÕ½³¡",
	[4] = "Tham gia 1 lÇn Th«n lµng chiÕn",
	[5] = "Tham gia 1 lÇn Th¶o cèc chiÕn",
	[6] = "Tham gia 1 lÇn Ph¸o ®µi chiÕn",
	[7] = "Tham gia 1 lÇn ChiÕn dÞch chÝnh Nh¹n M«n",	
	[8] = "§¸nh b¹i 1 ng­êi ch¬i phe ®Þch cña thÕ lùc kh¸c",	
}

--ÊýÖµÀÛ¼ÆÈÎÎñ
CK_TASK_ZILON_ATRR = {
	[1] = {"Gia nhËp giang hå", {0, 90, 2000, 2000, 10000}, {5000000, 100}},
	[2] = {"TiÓu H÷u Së Thµnh", {0, 99, 3000, 3000, 20000}, {8000000, 200}},
	[3] = {"S¬ xuÊt mao l­", {1, 90, 6000, 6000, 40000}, {11000000, 300}},
	[4] = {"S¬ XuÊt Mao L«", {2, 90, 8000, 8000, 80000}, {14000000, 400}},
	[5] = {"§¹i Lang §µo Sa", {3, 90, 10000, 10000, 120000}, {17000000, 500}},
	[6] = {"TiÓu H÷u Danh KhÝ", {4, 90, 12000, 12000, 180000}, {20000000, 600}},
	[7] = {"Tr¸ng ChÝ L¨ng V©n", {5, 90, 15000, 15000, 250000}, {23000000, 1200}},
	[8] = {"KhÝ tr¸ng hµ s¬n", {6, 90, 16000, 16000, 280000}, {32000000, 1600}},
}
CK_TASK_ZILON_ATRR_BEGIN = 1

--Ìì½¾ÁîÏû·ÑÈÎÎñ
CK_TASK_IB_COST = {
	--[1] = {"²ÆÔ´¹ö¹ö", 5,   {12500000, 150}},
	--[2] = {"½ðÓñÂúÌÃ", 25,   {25000000, 300}},
	[1] = {"Phong Y Tóc Thùc", 5,   {12500000, 150}},
	[2] = {"Uy Phong B¸t DiÖn", 25,  {25000000, 300}},
	[3] = {"Kinh tÕ gia ®×nh", 50,  {37500000, 450}},	
	[4] = {"§¹i Phó §¹i Quý", 100, {50000000, 900}},
	[5] = {"Tµi §¹i KhÝ Th«", 200, {62500000, 1100}},
	[6] = {"Gia Tµi V¹n Qu¸n", 300, {75000000, 1300}},
	[7] = {"Giµu cã thiªn h¹", 400, {100000000, 1500}},
	[8] = {"Phó Kh¶ §Þch Quèc", 500, {125000000, 1800}},
}
CK_TASK_IB_COST_BEGIN = getn(CK_TASK_ZILON_ATRR)+1


CK_JS_GUAIYI = {
	{"¸o Choµng Ngò Hµnh Kim ChÕ", {0, 152, 4, 1, 4}},
	{"¸o Choµng Ngò Hµnh Méc ChÕ", {0, 152, 5, 1, 4}},
	{"¸o Choµng Ngò Hµnh Thñy ChÕ", {0, 152, 6, 1, 4}},
	{"¸o Choµng Ngò Hµnh Háa ChÕ", {0, 152, 7, 1, 4}},
	{"¸o Choµng Ngò Hµnh Thæ ChÕ", {0, 152, 8, 1, 4}},
	{"¸o Choµng Ngò Hµnh ¢m ChÕ", {0, 152, 9, 1, 4}},
}
CK_JS_HUIZHANG = { 
	{"Huy Ch­¬ng Kim ChÕ ngò hµnh", {0, 153, 4, 1, 4}},
	{"Huy Ch­¬ng Méc ChÕ ngò hµnh", {0, 153, 5, 1, 4}},
	{"Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0, 153, 6, 1, 4}},
	{"Huy Ch­¬ng Háa ChÕ ngò hµnh", {0, 153, 7, 1, 4}},
	{"Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0, 153, 8, 1, 4}},
	{"Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0, 153, 9, 1, 4}},
}
CK_JS_SHOE = {
	{"ChiÕn Hµi Kim ChÕ ngò hµnh", {0, 154, 4, 1, 4}},
	{"ChiÕn Hµi Méc ChÕ ngò hµnh", {0, 154, 5, 1, 4}},
	{"ChiÕn Hµi Thñy ChÕ ngò hµnh", {0, 154, 6, 1, 4}},
	{"ChiÕn Hµi Háa ChÕ ngò hµnh", {0, 154, 7, 1, 4}},
	{"ChiÕn Hµi Thæ ChÕ ngò hµnh", {0, 154, 8, 1, 4}},
	{"ChiÕn Hµi ¢m ChÕ ngò hµnh", {0, 154, 9, 1, 4}},
}

CK_YAOYANG_JIEZI_1 = {
	{"DiÖu D­¬ng-¤ L©n B¶o Giíi", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-Tö Giao Ngäc Béi", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-V©n Hæ LÖnh", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-XÝch T­íc Hoµn", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-BÝch Quy Liªn", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_YAOYANG_JIEZI_2 = {
	{"DiÖu D­¬ng-¤ L©n B¶o Giíi", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-Tö Giao Ngäc Béi", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-V©n Hæ LÖnh", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-XÝch T­íc Hoµn", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-BÝch Quy Liªn", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_4_LEVEL_YUNLING = {
	{"H-LiÖt Nham-Lv4", {0, 148, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ph¸ Kh«ng-Lv4", {0, 148, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Tóy KiÕm-Lv4", {0, 148, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-TËt Phong-Lv4", {0, 148, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-TÊn Vò-Lv4", {0, 148, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-¦ng TËp-Lv4", {0, 148, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh T©m-Lv4", {0, 148, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-ThÇn Lùc-Lv4", {0, 148, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ng­ng ThÇn-Lv4", {0, 148, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V« Gian-Lv4", {0, 148, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V« Cùc-Lv4", {0, 148, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Cuång NhÉn-Lv4", {0, 148, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-L¨ng NhuÖ-Lv4", {0, 148, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh Viªn-Lv4", {0, 148, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H¶i VËn-Lv4", {0, 148, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H¶i T©m-Lv4", {0, 148, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-LiÖt Nham-Lv4", {0, 149, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ph¸ Kh«ng-Lv4", {0, 149, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Tóy KiÕm-Lv4", {0, 149, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-TËt Phong-Lv4", {0, 149, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-TÊn Vò-Lv4", {0, 149, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Qu¸n Th¹ch-Lv4", {0, 149, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Né Ng©m-Lv4", {0, 149, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Xuyªn V©n-Lv4", {0, 149, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-ThÇn Lùc-Lv4", {0, 149, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ng­ng ThÇn-Lv4", {0, 149, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V« Gian-Lv4", {0, 149, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V« Cùc-Lv4", {0, 149, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Cuång NhÉn-Lv4", {0, 149, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-L¨ng NhuÖ-Lv4", {0, 149, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Linh Viªn-Lv4", {0, 149, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H¶i VËn-Lv4", {0, 149, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H¶i T©m-Lv4", {0, 149, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-LiÖt Nham-Lv4", {0, 150, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ph¸ Kh«ng-Lv4", {0, 150, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Tóy KiÕm-Lv4", {0, 150, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-TËt Phong-Lv4", {0, 150, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-TÊn Vò-Lv4", {0, 150, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« L­îng-Lv4", {0, 150, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Môc Minh-Lv4", {0, 150, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-ThÇn Lùc-Lv4", {0, 150, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ng­ng ThÇn-Lv4", {0, 150, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« Gian-Lv4", {0, 150, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« Cùc-Lv4", {0, 150, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Cuång NhÉn-Lv4", {0, 150, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-L¨ng NhuÖ-Lv4", {0, 150, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Linh Viªn-Lv4", {0, 150, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H¶i VËn-Lv4", {0, 150, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H¶i T©m-Lv4", {0, 150, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_5_LEVEL_YUNLING = {
	{"H-LiÖt Nham-Lv5", {0, 148, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ph¸ Kh«ng-Lv5", {0, 148, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Tóy KiÕm-Lv5", {0, 148, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-TËt Phong-Lv5", {0, 148, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-TÊn Vò-Lv5", {0, 148, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-¦ng TËp-Lv5", {0, 148, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh T©m-Lv5", {0, 148, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-ThÇn Lùc-Lv5", {0, 148, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ng­ng ThÇn-Lv5", {0, 148, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V« Gian-Lv5", {0, 148, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V« Cùc-Lv5", {0, 148, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Cuång NhÉn-Lv5", {0, 148, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-L¨ng NhuÖ-Lv5", {0, 148, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh Viªn-Lv5", {0, 148, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H¶i VËn-Lv5", {0, 148, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H¶i T©m-Lv5", {0, 148, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-LiÖt Nham-Lv5", {0, 149, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ph¸ Kh«ng-Lv5", {0, 149, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Tóy KiÕm-Lv5", {0, 149, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-TËt Phong-Lv5", {0, 149, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-TÊn Vò-Lv5", {0, 149, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Qu¸n Th¹ch-Lv5", {0, 149, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Né Ng©m-Lv5", {0, 149, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Xuyªn V©n-Lv5", {0, 149, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-ThÇn Lùc-Lv5", {0, 149, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ng­ng ThÇn-Lv5", {0, 149, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V« Gian-Lv5", {0, 149, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V« Cùc-Lv5", {0, 149, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Cuång NhÉn-Lv5", {0, 149, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-L¨ng NhuÖ-Lv5", {0, 149, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Linh Viªn-Lv5", {0, 149, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H¶i VËn-Lv5", {0, 149, 85, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H¶i T©m-Lv5", {0, 149, 86, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-LiÖt Nham-Lv5", {0, 150, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ph¸ Kh«ng-Lv5", {0, 150, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Tóy KiÕm-Lv5", {0, 150, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-TËt Phong-Lv5", {0, 150, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-TÊn Vò-Lv5", {0, 150, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« L­îng-Lv5", {0, 150, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Môc Minh-Lv5", {0, 150, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-ThÇn Lùc-Lv5", {0, 150, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ng­ng ThÇn-Lv5", {0, 150, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« Gian-Lv5", {0, 150, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« Cùc-Lv5", {0, 150, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Cuång NhÉn-Lv5", {0, 150, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-L¨ng NhuÖ-Lv5", {0, 150, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Linh Viªn-Lv5", {0, 150, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H¶i VËn-Lv5", {0, 150, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H¶i T©m-Lv5", {0, 150, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_6_LEVEL_YUNLING = {
	{"T-LiÖt Nham-Lv6", {0, 150,	85, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ph¸ Kh«ng-Lv6", {0, 150,	86, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Tóy KiÕm-Lv6", {0, 150,	87, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-TËt Phong-Lv6", {0, 150,	88, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-TÊn Vò-Lv6", {0, 150,	89, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« L­îng-Lv6", {0, 150,	90, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Môc Minh-Lv6", {0, 150,	91, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-ThÇn Lùc-Lv6", {0, 150,	92, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ng­ng ThÇn-Lv6", {0, 150,	93, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« Gian-Lv6", {0, 150,	94, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V« Cùc-Lv6", {0, 150,	95, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Cuång NhÉn-Lv6", {0, 150,	96, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-L¨ng NhuÖ-Lv6", {0, 150,	97, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Linh Viªn-Lv6", {0, 150,	98, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H¶i VËn-Lv6", {0, 150,	99, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H¶i T©m-Lv6", {0, 150,100, 1, 4, -1, -1, -1, -1, -1, -1}},
}

function ck_GiveRandGem456()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,20, "HuyÕtTrÝchTh¹ch Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,20, "NguyÖtB¹chTh¹ch Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,20, "Hæ Ph¸ch Th¹ch CÊp 4", {2,22,304,1},nil,nil,nil,nil},
        {1,20, "H¾c DiÖu Th¹ch CÊp 4", {2,22,404,1},nil,nil,nil,nil},
        {1,4, "HuyÕtTrÝchTh¹ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,4, "NguyÖtB¹chTh¹ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,4, "Hæ Ph¸ch Th¹ch CÊp 5", {2,22,305,1},nil,nil,nil,1},
        {1,4, "H¾c DiÖu Th¹ch CÊp 5", {2,22,405,1},nil,nil,nil,1},
        {1,1, "HuyÕtTrÝchTh¹ch Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,1, "NguyÖtB¹chTh¹ch Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,1, "Hæ Ph¸ch Th¹ch CÊp 6", {2,22,306,1},nil,nil,nil,1},
        {1,1, "H¾c DiÖu Th¹ch CÊp 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

function _award_jingjie(_nLevel, nExp)
	local nLevel = MeridianGetLevel()
	if nLevel < _nLevel then
		for i = nLevel + 1, _nLevel do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", nExp);
	end
end

function award_wuzhe()
	return _award_jingjie(1, 10000000)
end
function award_wujiang()
	return _award_jingjie(2, 30000000)
end
function award_wuwang()
	return _award_jingjie(3, 40000000)
end
function award_wuzun()
	return _award_jingjie(4, 200000000)
end
function award_5zhuan90()
	if gf_GetPlayerRebornCount() < 5 then
		gf_SetTaskByte(1538, 1, 5); 			--5×ª
		gf_SetTaskByte(1538, 2, random(1,4)); 			--huong cs
		SetLevel(90, 1);								  --90¼¶
		Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	else
		gf_Modify("Exp", 20000000);
	end
end
function award_6zhuan90()
	if gf_GetPlayerRebornCount() < 6 then
		gf_SetTaskByte(1538, 1, 5); 			--1×ª
		PlayerReborn(1,random(1,4))
		SetLevel(90, 1);								  --90¼¶
		Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
		AddTitle(61,05)
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	else
		gf_Modify("Exp", 50000000);
	end
end
	
function award_7zhuan73()
	if gf_GetTransLevel() >= 698 then
		if gf_GetPlayerRebornCount() < 7 then
			gf_SetTaskByte(1538, 1, 5); 			--1×ª
			PlayerReborn(2,random(1,4))
			SetLevel(73, 1);						--73¼¶
			Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
			RemoveTitle(61,05)
			AddTitle(61,06)
			PlaySound("\\sound\\sound_i016.wav");
			SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		else
			gf_Modify("Exp", 500000000);
		end
	end
end

function award_yunling4()
	local nRandIndex = random(getn(CK_4_LEVEL_YUNLING));
	gf_AddItemEx2(CK_4_LEVEL_YUNLING[nRandIndex][2], CK_4_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
end
function award_yunling5()
	local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
	gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
end
T_ZHANKUANG = {
	tHead = {
        { "ChiÕn Cuång Thiªn §Þa M¹o", {0, 103, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 2},
        { "ChiÕn Cuång Thiªn §Þa M¹o", {0, 103, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 2},
        { "ChiÕn Cuång Thiªn T«n M¹o", {0, 103, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 4},
        { "ChiÕn Cuång Thiªn T«n M¹o", {0, 103, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 4},
        { "ChiÕn Cuång Phæ TÕ M¹o", {0, 103, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 3},
        { "ChiÕn Cuång Phæ TÕ M¹o", {0, 103, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 3},
        { "ChiÕn Cuång TuyÖt MÖnh Qu¸n", {0, 103, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Qu¸n", {0, 103, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Qu¸n", {0, 103, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Qu¸n", {0, 103, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 6},
        { "ChiÕn Cuång Bå T¸t Tr©m", {0, 103, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 8},
        { "ChiÕn Cuång Bå T¸t Tr©m", {0, 103, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 8},
        { "ChiÕn Cuång L­u Thñy Tr©m", {0, 103, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 9},
        { "ChiÕn Cuång L­u Thñy Tr©m", {0, 103, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 9},
        { "ChiÕn Cuång ThÇn Du C©n", {0, 103, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 11},
        { "ChiÕn Cuång ThÇn Du C©n", {0, 103, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 11},
        { "ChiÕn Cuång ThÇn Du C©n", {0, 103, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 11},
        { "ChiÕn Cuång ThÇn Du C©n", {0, 103, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 11},
        { "ChiÕn Cuång Tiªu Dao C©n", {0, 103, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 12},
        { "ChiÕn Cuång Tiªu Dao C©n", {0, 103, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 12},
        { "ChiÕn Cuång Tiªu Dao C©n", {0, 103, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 12},
        { "ChiÕn Cuång Tiªu Dao C©n", {0, 103, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 12},
        { "ChiÕn Cuång V« Vi Qu¸n", {0, 103, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 14},
        { "ChiÕn Cuång V« Vi Qu¸n", {0, 103, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 14},
        { "ChiÕn Cuång V« Vi Qu¸n", {0, 103, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 14},
        { "ChiÕn Cuång V« Vi Qu¸n", {0, 103, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 14},
        { "ChiÕn Cuång Cµn Kh«n Qu¸n", {0, 103, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 15},
        { "ChiÕn Cuång Cµn Kh«n Qu¸n", {0, 103, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 15},
        { "ChiÕn Cuång Cµn Kh«n Qu¸n", {0, 103, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 15},
        { "ChiÕn Cuång Cµn Kh«n Qu¸n", {0, 103, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 15},
        { "ChiÕn Cuång Thiªn Tinh  Kh«i", {0, 103, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 17},
        { "ChiÕn Cuång Thiªn Tinh  Kh«i", {0, 103, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 17},
        { "ChiÕn Cuång Thiªn Tinh  Kh«i", {0, 103, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 17},
        { "ChiÕn Cuång Thiªn Tinh  Kh«i", {0, 103, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 17},
        { "ChiÕn Cuång Xuyªn V©n Kh«i", {0, 103, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 18},
        { "ChiÕn Cuång Xuyªn V©n Kh«i", {0, 103, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 18},
        { "ChiÕn Cuång Xuyªn V©n Kh«i", {0, 103, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 18},
        { "ChiÕn Cuång Xuyªn V©n Kh«i", {0, 103, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 18},
        { "ChiÕn Cuång Minh T«n C©n", {0, 103, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 20},
        { "ChiÕn Cuång Minh T«n C©n", {0, 103, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 20},
        { "ChiÕn Cuång Minh T«n C©n", {0, 103, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 20},
        { "ChiÕn Cuång Minh T«n C©n", {0, 103, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 20},
        { "ChiÕn Cuång Cæ T©m C©n", {0, 103, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 21},
        { "ChiÕn Cuång Cæ T©m C©n", {0, 103, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 21},
        { "ChiÕn Cuång Cæ T©m C©n", {0, 103, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 21},
        { "ChiÕn Cuång Cæ T©m C©n", {0, 103, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 21},
        { "ChiÕn Cuång Phong L«i Qu¸n", {0, 103, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 23},
        { "ChiÕn Cuång Phong L«i Qu¸n", {0, 103, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 23},
        { "ChiÕn Cuång §¹i §Þa C©n", {0, 103, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 25},
        { "ChiÕn Cuång §¹i §Þa C©n", {0, 103, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 25},
        { "ChiÕn Cuång §¹i §Þa C©n", {0, 103, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 25},
        { "ChiÕn Cuång §¹i §Þa C©n", {0, 103, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 25},
        { "ChiÕn Cuång Tóy Méng Qu¸n", {0, 103, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 26},
        { "ChiÕn Cuång Tóy Méng Qu¸n", {0, 103, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 26},
        { "ChiÕn Cuång Tóy Méng Qu¸n", {0, 103, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 26},
        { "ChiÕn Cuång Tóy Méng Qu¸n", {0, 103, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 26},
        { "ChiÕn Cuång Ma Vùc  Qu¸n", {0, 103, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 27},
        { "ChiÕn Cuång Ma Vùc  Qu¸n", {0, 103, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 27},
        { "ChiÕn Cuång Ma Vùc  Qu¸n", {0, 103, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 27},
        { "ChiÕn Cuång Ma Vùc  Qu¸n", {0, 103, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 27},
        { "ChiÕn Cuång Th¸nh N÷  Tr©m", {0, 103, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 29},
        { "ChiÕn Cuång Th¸nh N÷  Tr©m", {0, 103, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 29},
        { "ChiÕn Cuång Th¸nh Linh Tr©m", {0, 103, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 30},
        { "ChiÕn Cuång Th¸nh Linh Tr©m", {0, 103, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 30},
	},
	tCloth = {
        { "ChiÕn Cuång Thiªn §Þa Bµo", {0, 100, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 2},
        { "ChiÕn Cuång Thiªn §Þa Bµo", {0, 100, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 2},
        { "ChiÕn Cuång Thiªn T«n Bµo", {0, 100, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 4},
        { "ChiÕn Cuång Thiªn T«n Bµo", {0, 100, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 4},
        { "ChiÕn Cuång Phæ TÕ Bµo", {0, 100, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 3},
        { "ChiÕn Cuång Phæ TÕ Bµo", {0, 100, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 3},
        { "ChiÕn Cuång TuyÖt MÖnh Y", {0, 100, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Y", {0, 100, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Y", {0, 100, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Y", {0, 100, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 6},
        { "ChiÕn Cuång Bå T¸t Y", {0, 100, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 8},
        { "ChiÕn Cuång Bå T¸t Y", {0, 100, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 8},
        { "ChiÕn Cuång L­u ThñyY", {0, 100, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 9},
        { "ChiÕn Cuång L­u ThñyY", {0, 100, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 9},
        { "ChiÕn Cuång ThÇn Du Y", {0, 100, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 11},
        { "ChiÕn Cuång ThÇn Du Y", {0, 100, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 11},
        { "ChiÕn Cuång ThÇn Du Y", {0, 100, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 11},
        { "ChiÕn Cuång ThÇn Du Y", {0, 100, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 11},
        { "ChiÕn Cuång Tiªu Dao Y", {0, 100, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 12},
        { "ChiÕn Cuång Tiªu Dao Y", {0, 100, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 12},
        { "ChiÕn Cuång Tiªu Dao Y", {0, 100, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 12},
        { "ChiÕn Cuång Tiªu Dao Y", {0, 100, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 12},
        { "ChiÕn Cuång V« Vi Bµo", {0, 100, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 14},
        { "ChiÕn Cuång V« Vi Bµo", {0, 100, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 14},
        { "ChiÕn Cuång V« Vi Bµo", {0, 100, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 14},
        { "ChiÕn Cuång V« Vi Bµo", {0, 100, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 14},
        { "ChiÕn Cuång Cµn Kh«n Bµo", {0, 100, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 15},
        { "ChiÕn Cuång Cµn Kh«n Bµo", {0, 100, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 15},
        { "ChiÕn Cuång Cµn Kh«n Bµo", {0, 100, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 15},
        { "ChiÕn Cuång Cµn Kh«n Bµo", {0, 100, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 15},
        { "ChiÕn Cuång Thiªn Tinh  Gi¸p", {0, 100, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 17},
        { "ChiÕn Cuång Thiªn Tinh  Gi¸p", {0, 100, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 17},
        { "ChiÕn Cuång Thiªn Tinh  Gi¸p", {0, 100, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 17},
        { "ChiÕn Cuång Thiªn Tinh  Gi¸p", {0, 100, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 17},
        { "ChiÕn Cuång Xuyªn V©n Gi¸p", {0, 100, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 18},
        { "ChiÕn Cuång Xuyªn V©n Gi¸p", {0, 100, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 18},
        { "ChiÕn Cuång Xuyªn V©n Gi¸p", {0, 100, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 18},
        { "ChiÕn Cuång Xuyªn V©n Gi¸p", {0, 100, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 18},
        { "ChiÕn Cuång Minh T«n Y", {0, 100, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 20},
        { "ChiÕn Cuång Minh T«n Y", {0, 100, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 20},
        { "ChiÕn Cuång Minh T«n Y", {0, 100, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 20},
        { "ChiÕn Cuång Minh T«n Y", {0, 100, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 20},
        { "ChiÕn Cuång Cæ T©m Y", {0, 100, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 21},
        { "ChiÕn Cuång Cæ T©m Y", {0, 100, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 21},
        { "ChiÕn Cuång Cæ T©m Y", {0, 100, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 21},
        { "ChiÕn Cuång Cæ T©m Y", {0, 100, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 21},
        { "ChiÕn Cuång Phong L«i Bµo", {0, 100, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 23},
        { "ChiÕn Cuång Phong L«i Bµo", {0, 100, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 23},
        { "ChiÕn Cuång §¹i §Þa Y", {0, 100, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 25},
        { "ChiÕn Cuång §¹i §Þa Y", {0, 100, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 25},
        { "ChiÕn Cuång §¹i §Þa Y", {0, 100, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 25},
        { "ChiÕn Cuång §¹i §Þa Y", {0, 100, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 25},
        { "ChiÕn Cuång Tóy Méng Bµo", {0, 100, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 26},
        { "ChiÕn Cuång Tóy Méng Bµo", {0, 100, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 26},
        { "ChiÕn Cuång Tóy Méng Bµo", {0, 100, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 26},
        { "ChiÕn Cuång Tóy Méng Bµo", {0, 100, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 26},
        { "ChiÕn Cuång Ma Vùc  Bµo", {0, 100, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 27},
        { "ChiÕn Cuång Ma Vùc  Bµo", {0, 100, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 27},
        { "ChiÕn Cuång Ma Vùc  Bµo", {0, 100, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 27},
        { "ChiÕn Cuång Ma Vùc  Bµo", {0, 100, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 27},
        { "ChiÕn Cuång Th¸nh N÷  Y", {0, 100, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 29},
        { "ChiÕn Cuång Th¸nh N÷  Y", {0, 100, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 29},
        { "ChiÕn Cuång Th¸nh Linh Y", {0, 100, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 30},
        { "ChiÕn Cuång Th¸nh Linh Y", {0, 100, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 30},
	},
	tShoe = {
        { "ChiÕn Cuång Thiªn §Þa Trang", {0, 101, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 2},
        { "ChiÕn Cuång Thiªn §Þa Trang", {0, 101, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 2},
        { "ChiÕn Cuång Thiªn T«n Trang", {0, 101, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 4},
        { "ChiÕn Cuång Thiªn T«n Trang", {0, 101, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 4},
        { "ChiÕn Cuång Phæ TÕ Trang", {0, 101, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 3},
        { "ChiÕn Cuång Phæ TÕ Trang", {0, 101, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 3},
        { "ChiÕn Cuång TuyÖt MÖnh Trang", {0, 101, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Trang", {0, 101, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Trang", {0, 101, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 6},
        { "ChiÕn Cuång TuyÖt MÖnh Trang", {0, 101, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 6},
        { "ChiÕn Cuång Bå T¸t Khè", {0, 101, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 8},
        { "ChiÕn Cuång Bå T¸t Khè", {0, 101, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 8},
        { "ChiÕn Cuång L­u ThñyKhè", {0, 101, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 9},
        { "ChiÕn Cuång L­u ThñyKhè", {0, 101, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 9},
        { "ChiÕn Cuång ThÇn Du Trang", {0, 101, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 11},
        { "ChiÕn Cuång ThÇn Du Trang", {0, 101, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 11},
        { "ChiÕn Cuång ThÇn Du Trang", {0, 101, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 11},
        { "ChiÕn Cuång ThÇn Du Trang", {0, 101, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 11},
        { "ChiÕn Cuång Tiªu Dao Trang", {0, 101, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 12},
        { "ChiÕn Cuång Tiªu Dao Trang", {0, 101, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 12},
        { "ChiÕn Cuång Tiªu Dao Trang", {0, 101, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 12},
        { "ChiÕn Cuång Tiªu Dao Trang", {0, 101, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 12},
        { "ChiÕn Cuång V« Vi Trang", {0, 101, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 14},
        { "ChiÕn Cuång V« Vi Trang", {0, 101, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 14},
        { "ChiÕn Cuång V« Vi Trang", {0, 101, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 14},
        { "ChiÕn Cuång V« Vi Trang", {0, 101, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 14},
        { "ChiÕn Cuång Cµn Kh«n Trang", {0, 101, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 15},
        { "ChiÕn Cuång Cµn Kh«n Trang", {0, 101, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 15},
        { "ChiÕn Cuång Cµn Kh«n Trang", {0, 101, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 15},
        { "ChiÕn Cuång Cµn Kh«n Trang", {0, 101, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 15},
        { "ChiÕn Cuång Thiªn Tinh  Trang", {0, 101, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 17},
        { "ChiÕn Cuång Thiªn Tinh  Trang", {0, 101, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 17},
        { "ChiÕn Cuång Thiªn Tinh  Trang", {0, 101, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 17},
        { "ChiÕn Cuång Thiªn Tinh  Trang", {0, 101, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 17},
        { "ChiÕn Cuång Xuyªn V©n Trang", {0, 101, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 18},
        { "ChiÕn Cuång Xuyªn V©n Trang", {0, 101, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 18},
        { "ChiÕn Cuång Xuyªn V©n Trang", {0, 101, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 18},
        { "ChiÕn Cuång Xuyªn V©n Trang", {0, 101, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 18},
        { "ChiÕn Cuång Minh T«n Trang", {0, 101, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 20},
        { "ChiÕn Cuång Minh T«n Trang", {0, 101, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 20},
        { "ChiÕn Cuång Minh T«n Trang", {0, 101, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 20},
        { "ChiÕn Cuång Minh T«n Trang", {0, 101, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 20},
        { "ChiÕn Cuång Cæ T©m Trang", {0, 101, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 21},
        { "ChiÕn Cuång Cæ T©m Trang", {0, 101, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 21},
        { "ChiÕn Cuång Cæ T©m Trang", {0, 101, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 21},
        { "ChiÕn Cuång Cæ T©m Trang", {0, 101, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 21},
        { "ChiÕn Cuång Phong L«i Trang", {0, 101, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 23},
        { "ChiÕn Cuång Phong L«i Trang", {0, 101, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 23},
        { "ChiÕn Cuång §¹i §Þa Trang", {0, 101, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 25},
        { "ChiÕn Cuång §¹i §Þa Trang", {0, 101, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 25},
        { "ChiÕn Cuång §¹i §Þa Trang", {0, 101, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 25},
        { "ChiÕn Cuång §¹i §Þa Trang", {0, 101, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 25},
        { "ChiÕn Cuång Tóy Méng Trang", {0, 101, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 26},
        { "ChiÕn Cuång Tóy Méng Trang", {0, 101, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 26},
        { "ChiÕn Cuång Tóy Méng Trang", {0, 101, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 26},
        { "ChiÕn Cuång Tóy Méng Trang", {0, 101, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 26},
        { "ChiÕn Cuång Ma Vùc  Trang", {0, 101, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 27},
        { "ChiÕn Cuång Ma Vùc  Trang", {0, 101, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 27},
        { "ChiÕn Cuång Ma Vùc  Trang", {0, 101, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 27},
        { "ChiÕn Cuång Ma Vùc  Trang", {0, 101, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 27},
        { "ChiÕn Cuång Th¸nh N÷  Khè", {0, 101, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 29},
        { "ChiÕn Cuång Th¸nh N÷  Khè", {0, 101, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 29},
        { "ChiÕn Cuång Th¸nh Linh Khè", {0, 101, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 30},
        { "ChiÕn Cuång Th¸nh Linh Khè", {0, 101, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 30},
	},
	tWeapon = {
        { "ChiÕn Cuång B¨ng Thiªn §ao", {0, 3, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 2},
        { "ChiÕn Cuång B¨ng Thiªn §ao", {0, 3, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 2},
        { "ChiÕn Cuång ThiÒn §Þnh Tr­îng", {0, 8, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 3},
        { "ChiÕn Cuång ThiÒn §Þnh Tr­îng", {0, 8, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 3},
        { "ChiÕn Cuång Th¸nh ChiÕn Thñ", {0, 0, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 4},
        { "ChiÕn Cuång Th¸nh ChiÕn Thñ", {0, 0, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 4},
        { "ChiÕn Cuång §o¹t Hån Ch©m", {0, 1, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 6},
        { "ChiÕn Cuång §o¹t Hån Ch©m", {0, 1, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 6},
        { "ChiÕn Cuång §o¹t Hån Ch©m", {0, 1, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 6},
        { "ChiÕn Cuång §o¹t Hån Ch©m", {0, 1, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 6},
        { "ChiÕn Cuång PhËt Quang KiÕm", {0, 2, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 8},
        { "ChiÕn Cuång PhËt Quang KiÕm", {0, 2, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 8},
        { "ChiÕn Cuång Hé Bang CÇm", {0, 10, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 9},
        { "ChiÕn Cuång Hé Bang CÇm", {0, 10, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 9},
        { "ChiÕn Cuång Trõng ¸c Thñ", {0, 0, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 11},
        { "ChiÕn Cuång Trõng ¸c Thñ", {0, 0, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 11},
        { "ChiÕn Cuång Trõng ¸c Thñ", {0, 0, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 11},
        { "ChiÕn Cuång Trõng ¸c Thñ", {0, 0, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 11},
        { "ChiÕn Cuång V« Cùc C«n", {0, 5, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 12},
        { "ChiÕn Cuång V« Cùc C«n", {0, 5, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 12},
        { "ChiÕn Cuång V« Cùc C«n", {0, 5, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 12},
        { "ChiÕn Cuång V« Cùc C«n", {0, 5, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 12},
        { "ChiÕn Cuång Khu Ma KiÕm", {0, 2, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 14},
        { "ChiÕn Cuång Khu Ma KiÕm", {0, 2, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 14},
        { "ChiÕn Cuång Khu Ma KiÕm", {0, 2, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 14},
        { "ChiÕn Cuång Khu Ma KiÕm", {0, 2, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 14},
        { "ChiÕn Cuång Th­¬ng Khung Bót", {0, 9, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 15},
        { "ChiÕn Cuång Th­¬ng Khung Bót", {0, 9, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 15},
        { "ChiÕn Cuång Th­¬ng Khung Bót", {0, 9, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 15},
        { "ChiÕn Cuång Th­¬ng Khung Bót", {0, 9, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 15},
        { "ChiÕn Cuång ThÇn KÝch Th­¬ng", {0, 6, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 17},
        { "ChiÕn Cuång ThÇn KÝch Th­¬ng", {0, 6, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 17},
        { "ChiÕn Cuång ThÇn KÝch Th­¬ng", {0, 6, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 17},
        { "ChiÕn Cuång ThÇn KÝch Th­¬ng", {0, 6, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 17},
        { "ChiÕn Cuång Xung Thiªn Cung", {0, 4, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 18},
        { "ChiÕn Cuång Xung Thiªn Cung", {0, 4, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 18},
        { "ChiÕn Cuång Xung Thiªn Cung", {0, 4, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 18},
        { "ChiÕn Cuång Xung Thiªn Cung", {0, 4, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 18},
        { "ChiÕn Cuång LuyÖn Ngôc §ao", {0, 7, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 20},
        { "ChiÕn Cuång LuyÖn Ngôc §ao", {0, 7, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 20},
        { "ChiÕn Cuång LuyÖn Ngôc §ao", {0, 7, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 20},
        { "ChiÕn Cuång LuyÖn Ngôc §ao", {0, 7, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 20},
        { "ChiÕn Cuång NhiÕp Hån Tr¶o", {0, 11, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 21},
        { "ChiÕn Cuång NhiÕp Hån Tr¶o", {0, 11, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 21},
        { "ChiÕn Cuång NhiÕp Hån Tr¶o", {0, 11, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 21},
        { "ChiÕn Cuång NhiÕp Hån Tr¶o", {0, 11, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 21},
        { "ChiÕn Cuång Thiªn Ph¹t KiÕm", {0, 2, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 23},
        { "ChiÕn Cuång Thiªn Ph¹t KiÕm", {0, 2, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 23},
        { "ChiÕn Cuång Chóc Dung §ao", {0, 3, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 25},
        { "ChiÕn Cuång Chóc Dung §ao", {0, 3, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 25},
        { "ChiÕn Cuång Chóc Dung §ao", {0, 3, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 25},
        { "ChiÕn Cuång Chóc Dung §ao", {0, 3, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 25},
        { "ChiÕn Cuång Tö MÖnh Bót", {0, 9, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 26},
        { "ChiÕn Cuång Tö MÖnh Bót", {0, 9, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 26},
        { "ChiÕn Cuång Tö MÖnh Bót", {0, 9, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 26},
        { "ChiÕn Cuång Tö MÖnh Bót", {0, 9, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 26},
        { "ChiÕn Cuång Truy Hån Tr¶o", {0, 11, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 27},
        { "ChiÕn Cuång Truy Hån Tr¶o", {0, 11, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 27},
        { "ChiÕn Cuång Truy Hån Tr¶o", {0, 11, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 27},
        { "ChiÕn Cuång Truy Hån Tr¶o", {0, 11, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 27},
        { "ChiÕn Cuång Phong Linh PhiÕn", {0, 13, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 29},
        { "ChiÕn Cuång Phong Linh PhiÕn", {0, 13, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 29},
        { "ChiÕn Cuång Kh«ng Minh §Þch", {0, 12, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 30},
        { "ChiÕn Cuång Kh«ng Minh §Þch", {0, 12, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 30},
	},
}
function _award_equip(tEquip)
	local nBodyType = GetBody()
	local nRoute = GetPlayerRoute()
	for i=1,getn(tEquip) do
		local t = tEquip[i]
		if nBodyType == t[3] and nRoute == t[4] then
			gf_AddItemEx2(t[2], t[1], "CDKEY", "CDKEY", 0, 1);
			return
		end
	end
end
function award_zhankuangku()
	return _award_equip(T_ZHANKUANG.tShoe)
end
function award_zhankuangyi()
	return _award_equip(T_ZHANKUANG.tCloth)
end
function award_zhankuangtou()
	return _award_equip(T_ZHANKUANG.tHead)
end
function award_zhankuangwuqi()
	return _award_equip(T_ZHANKUANG.tWeapon)
end
function award_fusheng2renwu() --Íê³É³èÎï¸´Éú2ÈÎÎñ£¬VNG¹¦ÄÜ£¿
	Event_PhucSinhPET(); --Vet_Complete_Revive_OnePartner_FirstStage();
	Vet_Complete_Revive_OnePartner_SecondStage();
end
function award_guayi()
	_award_3jiantao(152)
end
function award_huizhang()
	_award_3jiantao(153)
end
function award_xie()
	_award_3jiantao(154)
end
function _award_3jiantao(nD)
	local nRandP = random(26,28)
	gf_AddItemEx2({0,nD,nRandP,1,4, -1, -1, -1, -1, -1, -1}, GetItemName(0, nD, nRandP), "CDKEY", "CDKEY", 0, 1);
end

function award_gem345()
	--Faction Cloth 9
	local VET_RandGem345 = {
		{1,25, "HuyÕtTrÝchTh¹ch Lv3", {2,22,103,1},nil,nil,nil,nil},
		{1,25, "NguyÖtB¹chTh¹ch Lv3", {2,22,203,1},nil,nil,nil,nil},
		{1,25, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303,1},nil,nil,nil,nil},
		{1,25, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403,1},nil,nil,nil,nil},
		{1,24, "HuyÕtTrÝchTh¹ch Lv4", {2,22,104,1},nil,nil,nil,nil},
		{1,24, "NguyÖtB¹chTh¹ch Lv4", {2,22,204,1},nil,nil,nil,nil},
		{1,24, "Hæ Ph¸ch Th¹ch CÊp 4", {2,22,304,1},nil,nil,nil,nil},
		{1,24, "H¾c DiÖu Th¹ch CÊp 4", {2,22,404,1},nil,nil,nil,nil},
		{1,1, "HuyÕtTrÝchTh¹ch Lv5", {2,22,105,1},nil,nil,nil,1},
		{1,1, "NguyÖtB¹chTh¹ch Lv5", {2,22,205,1},nil,nil,nil,1},
		{1,1, "Hæ Ph¸ch Th¹ch CÊp 5", {2,22,305,1},nil,nil,nil,1},
		{1,1, "H¾c DiÖu Th¹ch CÊp 5", {2,22,405,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem345,200,1, "CDKEY", "CDKEY")
end
function award_gem345_2()
	award_gem345()
	award_gem345()
end
function award_gem345_3()
	award_gem345()
	award_gem345()
	award_gem345()
end
function award_gem345_5()
	award_gem345()
	award_gem345()
	award_gem345()
	award_gem345()
	award_gem345()
end
function award_title()
	AddTitle(68, 4);
	SetTitleTime(68, 4, GetTime() + 60 * 24 * 3600);
	Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "NhiÖm Vô §¹t Nh©n"))
end

function award_tong_title3()
	SendScript2VM("\\script\\isolate\\functions\\tong_title\\tong_title.lua", format("force_give_max_lv(%d)", 3))
	Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Kim Lan"))
end

function award_random_gem1_1()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv1", {2,22,101,10,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv1", {2,22,201,10,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 1", {2,22,301,10,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 1", {2,22,401,10,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem1_2()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv1", {2,22,101,20,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv1", {2,22,201,20,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 1", {2,22,301,20,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 1", {2,22,401,20,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem2_1()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv2", {2,22,102,8,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv2", {2,22,202,8,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 2", {2,22,302,8,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 2", {2,22,402,8,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem2_2()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv2", {2,22,102,12,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv2", {2,22,202,12,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 2", {2,22,302,12,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 2", {2,22,402,12,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem3_4()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv3", {2,22,103,4,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv3", {2,22,203,4,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303,4,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403,4,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem3_5()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv3", {2,22,103,5,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv3", {2,22,203,5,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303,5,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403,5,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem3_7()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv3", {2,22,103,7,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv3", {2,22,203,7,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303,7,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403,7,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem3_9()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv3", {2,22,103,9,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv3", {2,22,203,9,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303,9,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403,9,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem4_3()
	local VET_RandGem = {
    {1,25, "HuyÕtTrÝchTh¹ch Lv4", {2,22,104,3,4},nil,nil,nil,nil},
    {1,25, "NguyÖtB¹chTh¹ch Lv4", {2,22,204,3,4},nil,nil,nil,nil},
    {1,25, "Hæ Ph¸ch Th¹ch CÊp 4", {2,22,304,3,4},nil,nil,nil,nil},
    {1,25, "H¾c DiÖu Th¹ch CÊp 4", {2,22,404,3,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_4pet()
	local tPet = {
		{16, 4500},
		{17, 4500},
		{18, 990},
		{19, 3},
		{20, 3},
		{21, 2},
		{22, 1},
		{23, 2},
	}
	local nID = gf_GetRandItemByTable(tPet, 10000, 1)
	AddPet(tPet[nID][1]);
	Msg2Player(GetPetName(tPet[nID][1]));
end

function award_tongscore(nScore)
	SendScript2VM("\\script\\isolate\\functions\\tong_title\\head.lua", format("add_tong_gxd(%d)", nScore))
end

CK_SCROE_AWARD_TABLE = {
	[1] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{900, 5000000, 100, 100, 1000, 10000},
		--{"select","Ó¢ÐÛÑ«ÕÂ", {2,1,30499,4}},
		--{"item", "Ó¢ÐÛÑ«ÕÂ", {2,1,30499,4}},
		{"func", "§¶ th«ng c¶nh giíi Vâ HiÒn", award_wuzhe},
	},
	[2] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{1000, 8000000, 160, 160, 1400, 0},
		{"item", "Ma Tinh", {2,1,30497,500,4}},
		{"func", "ChuyÓn sinh 5 cÊp 90", award_5zhuan90},
	},
	[3] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{1300, 12000000, 220, 220, 1800, 20000},
		{"func", "§¶ th«ng c¶nh giíi Vâ T­íng", award_wujiang},
	},
	[4] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{1700, 15000000, 280, 280, 2200, 0},
		{"item", "Ma Tinh", {2,1,30497,500,4}},
		{"item", "L¨ng Ba Vi Bé", {0,112,78,1}},
	},
	[5] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{2000, 20000000, 340, 340, 2600, 30000},
		{"func", "§¶ th«ng c¶nh giíi Vâ V­¬ng", award_wuwang},
	},
	[6] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{2400, 25000000, 400, 400, 3000, 0},
		{"item", "Ma Tinh", {2,1,30497,500,4}},
	},
	[7] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{2800, 28000000, 460, 460, 3400, 30000},
		{"func", "B¶o Th¹ch cÊp 1*10", award_random_gem1_1},
	},
	[8] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{3100, 30000000, 520, 520, 3800, 0},
		{"func", "§¸ quý cÊp 1*20", award_random_gem1_2},
		{"func", "UÈn Linh CÊp 4", award_yunling4},
	},
	[9] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{3500, 32000000, 580, 580, 4200, 0},
		{"func", "§¸ quý cÊp 2*8", award_random_gem2_1},
	},
	[10] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{4000, 34000000, 580, 580, 4200, 0},
		{"func", "Non chiÕn cuång+9", award_zhankuangtou},
		{"func", "§iÓm cèng hiÕn bang", award_tongscore,{100}},
	},
	[11] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{5000, 36000000, 580, 580, 4200, 0},
		{"func", "¸o chiÕn cuång+9", award_zhankuangyi},
		{"func", "§¸ quý cÊp 2 *12", award_random_gem2_2},
		{"func", "§iÓm cèng hiÕn bang", award_tongscore,{200}},
	},
	[12] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{6000, 38000000, 580, 580, 4200, 0},
		{"func", "QuÇn chiÕn cuång+9", award_zhankuangku},
		{"func", "§iÓm cèng hiÕn bang", award_tongscore,{300}},
	},
	[13] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{7000, 40000000, 580, 580, 4200, 0},
		{"item", "HiÖp NghÜa Chi Chøng", {2, 1, 30912, 400, 4}},
		{"item", "Linh §å Giíi (tr¸i)", {0, 102, 30221, 1, 4}},
		{"item", "Linh §å Giíi (ph¶i)", {0, 102, 30222, 1, 4}},
		{"func", "UÈn Linh CÊp 5", award_yunling5},
--		{"select", "ºÏ³É²ÄÁÏ£¨3Ñ¡1£©",
--			{
--				{"item", "Ä§ÀÇÆ¤", {2, 1, 30672, 50, 4}},
--				{"item", "µØÁúÆ¤", {2, 1, 30673, 50, 4}},
--				{"item", "Ñ×ÁéË¿", {2, 1, 30671, 50, 4}},
--			},
--		},
	},
	[14] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{8500, 42000000, 580, 580, 4200, 0},
		{"func", "Vò khÝ chiÕn cuång+9", award_zhankuangwuqi},
--		{"item", "1¼¶°ï»áÐÅÎï", {0, 155, 1, 1}},
		{"select", "Thó c­ìi B¶o B¶o(3 chän 1)",
			{
				{"item", "B¸o §en B¶o B¶o", {0, 105, 30029, 1, 4,-1,-1,-1,-1,-1,-1,-1},15*24*3600},
				{"item", "B¸o Vµng B¶o B¶o", {0, 105, 30030, 1, 4,-1,-1,-1,-1,-1,-1,-1},15*24*3600},
				{"item", "Kim Mao Ng­u B¶o B¶o", {0, 105, 30022, 1, 4,-1,-1,-1,-1,-1,-1,-1},15*24*3600},
			},
		},
		--{"func", "Danh hiÖu bang héi cÊp 3", award_tong_title3},
		{"item", "§ång TÕ Chi NguyÖn", {2,1,30913,21,4}},
	},
	[15] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{9500, 44000000, 580, 580, 4200, 0},
		{"func", "6 chuyÓn 90 cÊp", award_6zhuan90},
		{"item", "Tinh Hoa UÈn Linh CÊp 6", {2,1,30668,4, 4}},
		{"item", "HiÖp NghÜa Chi Chøng", {2, 1, 30912, 400, 4}},
--		{"select", "ºÏ³É²ÄÁÏ£¨3Ñ¡1£©",
--			{
--				{"item", "Ä§ÀÇÆ¤", {2, 1, 30672, 100, 4}},
--				{"item", "µØÁúÆ¤", {2, 1, 30673, 100, 4}},
--				{"item", "Ñ×ÁéË¿", {2, 1, 30671, 100, 4}},
--			},
--		},
	},
	[16] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{11000, 46000000, 580, 580, 4200, 0},
		{"func", "§¸ quý cÊp 3*5", award_random_gem3_5},
		{"item", "Tinh Hoa UÈn Linh CÊp 6", {2,1,30668,6,4}},
		{"item", "Trøng Linh Thó-Cao", {2,1,30728,1,4}},
		{"func", "§iÓm cèng hiÕn bang", award_tongscore,{300}},
		{"item", "TÝn VËt cÊp 3", {0,155,3,1,4}},
		{"select", "Trang bÞ Hµo hiÖp(3 chän 1)",
			{
				{"item", "Hµo HiÖp §Çu", {0, 103, 30568, 1, 4}},
				{"item", "Hµo HiÖp y", {0, 100, 30568, 1, 4}},
				{"item", "Hµo HiÖp Trang", {0, 101, 30568, 1, 4}},
			},
		},
	},
	[17] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{15000, 48000000, 580, 580, 4200, 0},
		{"func", "§¸ quý cÊp 3*7", award_random_gem3_7},
		{"item", "Tinh Hoa UÈn Linh CÊp 6", {2,1,30668,8,4}},
		{"item", "§ång TÕ Chi NguyÖn", {2,1,30913,42,4}},
--		{"select", "ºÏ³É²ÄÁÏ£¨3Ñ¡1£©",
--			{
--				{"item", "Ä§ÀÇÆ¤", {2, 1, 30672, 150, 4}},
--				{"item", "µØÁúÆ¤", {2, 1, 30673, 150, 4}},
--				{"item", "Ñ×ÁéË¿", {2, 1, 30671, 150, 4}},
--			},
--		},
	},
	[18] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{16000, 50000000, 580, 580, 4200, 0},
		{"func", "§¸ quý cÊp 3*9", award_random_gem3_9},
		--{"func", "Ëæ»ú¹ÒÒÂ", award_guayi},
		{"item", "ThiÕt tinh cÊp 4", {2, 1, 30612, 10, 4}},
		{"func", "§iÓm cèng hiÕn bang", award_tongscore,{400}},
		{"select", "V©n Du, ThiÕt Huyªt, ¸o kho¸c Du HiÖp(chän 1 trong 3)",
			{
				{"item", "¸o Choµng V©n Du", {0, 152, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "¸o Choµng ThiÕt HuyÕt", {0, 152, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "¸o Choµng Du HiÖp", {0, 152, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
			},
		},
--		{"select", "ºÏ³É²ÄÁÏ£¨3Ñ¡1£©",
--			{
--				{"item", "Ä§ÀÇÆ¤", {2, 1, 30672, 170, 4}},
--				{"item", "µØÁúÆ¤", {2, 1, 30673, 170, 4}},
--				{"item", "Ñ×ÁéË¿", {2, 1, 30671, 170, 4}},
--			},
--		},
	},
	[19] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{17000, 60000000, 580, 580, 4200, 0},
		{"func", "§¸ quý cÊp 4*3", award_random_gem4_3},
		--{"func", "Ëæ»ú»ÕÕÂ", award_huizhang},
		{"item", "ThiÕt tinh cÊp 4", {2, 1, 30612, 20, 4}},
		{"func", "§iÓm cèng hiÕn bang", award_tongscore,{500}},
		{"select", "V©n Du, ThiÕt HuyÕt, Huy ch­¬ng Du HiÖp(chän 1 trong 3)",
			{
				{"item", "Huy Ch­¬ng V©n Du", {0, 153, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "Huy Ch­¬ng ThiÕt HuyÕt", {0, 153, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "Huy Ch­¬ng Du HiÖp", {0, 153, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
			},
		},
--		{"select", "ºÏ³É²ÄÁÏ£¨3Ñ¡1£©",
--			{
--				{"item", "Ä§ÀÇÆ¤", {2, 1, 30672, 180, 4}},
--				{"item", "µØÁúÆ¤", {2, 1, 30673, 180, 4}},
--				{"item", "Ñ×ÁéË¿", {2, 1, 30671, 180, 4}},
--			},
--		},
	},
	[20] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{20000, 80000000, 580, 580, 4200, 0},
		{"func", "§¸ Quý CÊp 3-5 (NgÉu nhiªn)", award_gem345_2},
		--{"func", "Ëæ»ú»ÕÕÂ", award_xie},
		{"item", "ThiÕt tinh cÊp 4", {2, 1, 30612, 30, 4}},
		{"func", "§iÓm cèng hiÕn bang", award_tongscore,{600}},
		{"select", "V©n Du, ThiÕt HuyÕt, GiÇy Du HiÖp(chän 1 trong 3)",
			{
				{"item", "§¹o Hµi V©n Du", {0, 154, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "ChiÕn Hµi ThiÕt HuyÕt", {0, 154, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "ChiÕn Hµi Du HiÖp", {0, 154, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
			},
		},
--		{"select", "ºÏ³É²ÄÁÏ£¨3Ñ¡1£©",
--			{
--				{"item", "Ä§ÀÇÆ¤", {2, 1, 30672, 200, 4}},
--				{"item", "µØÁúÆ¤", {2, 1, 30673, 200, 4}},
--				{"item", "Ñ×ÁéË¿", {2, 1, 30671, 200, 4}},
--			},
--		},
	},
	[21] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{22000, 150000000, 580, 580, 4200, 0},
		{"func", "ChuyÓn sinh 7 cÊp 73", award_7zhuan73},
		{"func", "§¸ Quý CÊp 3-5 (NgÉu nhiªn)", award_gem345_3},
		{"item", "Phôc Sinh §¬n", {2, 1, 30814, 1, 4}},
		{"select", "Trang bÞ Hµo hiÖp(3 chän 1)",
			{
				{"item", "Hµo HiÖp §Çu", {0, 103, 30568, 1, 4}},
				{"item", "Hµo HiÖp y", {0, 100, 30568, 1, 4}},
				{"item", "Hµo HiÖp Trang", {0, 101, 30568, 1, 4}},
			},
		},
	},
	[22] = {
		--score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
		{24000, 250000000, 580, 580, 4200, 0},
		{"item", "HiÖp NghÜa Chi Chøng", {2, 1, 30912, 400, 4}},
		{"func", "§¶ th«ng c¶nh giíi Vâ T«n", award_wuzun},
		{"func", "§¸ Quý CÊp 3-5 (NgÉu nhiªn)", award_gem345_5},
--		{"item", "4¼¶Ìú¾§", {2, 1, 30612, 30, 4}},
		{"item", "Tinh Hoa UÈn Linh CÊp 6", {2,1,30668,12,4}},
		{"func", "§iÓm cèng hiÕn bang", award_tongscore,{600}},
--		{"item", "ºÍÊÏèµ", {2, 1, 1001, 1, 4}},
		{"func", "Danh hiÖu NhiÖm Vô §¹t Nh©n", award_title},
		{"select", "Trang bÞ Hµo hiÖp(3 chän 1)",
			{
				{"item", "Hµo HiÖp §Çu", {0, 103, 30568, 1, 4}},
				{"item", "Hµo HiÖp y", {0, 100, 30568, 1, 4}},
				{"item", "Hµo HiÖp Trang", {0, 101, 30568, 1, 4}},
			},
		},
	},
}
function ck_view_score_award(nType)
	local tSay = {
		format("\n NhËn phÇn th­ëng/#ck_get_score_award(%d)", nType),
		"\nT«i chØ xem xem th«i/nothing",
	}
	local tAward = CK_SCROE_AWARD_TABLE[nType]
	local tBase = tAward[1]
	local szMsg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", tBase[2], tBase[3], tBase[4], tBase[5], tBase[6])
	for i = 2,getn(tAward) do
		if tAward[i][1] == "item" then
			szMsg = format("%s,%s*%d", szMsg, tAward[i][2], tAward[i][3][4]);
		else
			szMsg = format("%s,%s", szMsg, tAward[i][2])
		end
	end
	Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", szMsg), getn(tSay), tSay);
	return 0;
end
function ck_get_score_award(nType)
	tSelect = tSelect or {}
	local tAward = CK_SCROE_AWARD_TABLE[nType]
	if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	local nCurScore = ck_GetCkScore()
	local nNeedScore = tAward[1][1]
	if nCurScore < nNeedScore then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", nNeedScore), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, nType) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if gf_CheckBaseCondition(73) ~= 1 then
		return 0;
	end
	for i = 1, getn(tAward) do
		local t = tAward[i];
		if "select" == t[1] then
			ck_get_score_award_select(nType, i);
			return
		end
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, nType, 1)
	for i= 1,getn(tAward) do
		local t = tAward[i]
		if type(t[1]) == "number" then
			gf_Modify("Exp", t[2])
			gf_Modify("Rep", t[3])
			gf_Modify("ShiMen", t[4])
			gf_Modify("JunGong", t[5])
			if t[6] > 0 then
				gf_Modify("ZhenQi", t[6])
			end
		elseif "func" == t[1] then
			t[3](unpack(t[4] or {}))
			if t[3] == award_tongscore then
				Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm ®é cèng hiÕn bang héi", t[4][1]))
			end
		elseif "item" == t[1] then
			gf_AddItemEx2(t[3], t[2], "CDKEY", "PhÇn th­ëng ®iÓm tÝch lòy", (t[4] or 0), 1);
		end		
	end
end

function ck_get_score_award_select(nType, i, j)
	local tAward = CK_SCROE_AWARD_TABLE[nType][i];
	if tAward[1] == "select" then
		if not j then
			local tDialog = {}
		  local szTitle = format("%s: H·y chän %s", CK_NPC_NAME, tAward[2])
		  local tSel = tAward[3]
		  for k = 1, getn(tSel) do
		  	if tSel[k][1] == "item" then
		  		tinsert(tDialog, format("%s*%d/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], tSel[k][3][4], nType, i, k));
		  	else
		  		tinsert(tDialog, format("%s/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], nType, i, k));
		  	end
		  end
		  tinsert(tDialog, "\nT«i chØ xem xem th«i/ck_get_score_award_select_cancle")
		  Say(szTitle, getn(tDialog), tDialog)
			return 0;
		end
		if not g_RecordIndex then g_RecordIndex = {} end
		if not g_RecordIndex[PlayerIndex] then g_RecordIndex[PlayerIndex] = {} end
		g_RecordIndex[PlayerIndex][i] = j;
	end
	local tNext = CK_SCROE_AWARD_TABLE[nType][i+1];
	if tNext then
		ck_get_score_award_select(nType, i+1);
	else
		ck_get_score_award_select_final(nType);
	end
end

function ck_get_score_award_select_cancle()
	if g_RecordIndex then
		g_RecordIndex[PlayerIndex] = nil
	end
end

function ck_get_score_award_select_final(nType)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, nType, 1)
	local tAward = CK_SCROE_AWARD_TABLE[nType]
	for i= 1,getn(tAward) do
		local t = tAward[i]
		if type(t[1]) == "number" then
			gf_Modify("Exp", t[2])
			gf_Modify("Rep", t[3])
			gf_Modify("ShiMen", t[4])
			gf_Modify("JunGong", t[5])
			if t[6] > 0 then
				gf_Modify("ZhenQi", t[6])
			end
		elseif "func" == t[1] then
			t[3](unpack(t[4] or {}))
		elseif "item" == t[1] then
			gf_AddItemEx2(t[3], t[2], "CDKEY", "PhÇn th­ëng ®iÓm tÝch lòy", (t[4] or 0), 1);
		elseif "select" == t[1] then
			local Index = g_RecordIndex[PlayerIndex][i];
			local tItem = t[3][Index];
			if "item" == tItem[1] then
				gf_AddItemEx2(tItem[3], tItem[2], "CDKEY", "PhÇn th­ëng ®iÓm tÝch lòy", (tItem[4] or 0), 1);
			elseif "func" == tItem[1] then
				tItem[3]()
			end	
		end
	end
	g_RecordIndex[PlayerIndex] = nil;
end