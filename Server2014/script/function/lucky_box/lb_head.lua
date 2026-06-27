Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\function\\lucky_box\\lb_define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\class\\ktabfile.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--½±ÀøÅäÖÃ±í-----------------------------------------------
g_LuckyBoxAwardTab = ff_GetTabFileTable(LB_AWARD_CONFIG, 3);
if not g_LuckyBoxAwardTab then
	print("ERROR:can not read \\script\\function\\lucky_box\\lucky_box.txt!!!");
end

g_LuckyBoxFreeAward = {};
for i = 1, getn(g_LuckyBoxAwardTab) do
	g_LuckyBoxFreeAward[i] = {i, g_LuckyBoxAwardTab[i][6]};
end

g_LuckyBoxIBAward = {};
for i = 1, getn(g_LuckyBoxAwardTab) do
	g_LuckyBoxIBAward[i] = {i, g_LuckyBoxAwardTab[i][10]};
end
------------------------------------------------------------
--Ëæ»ú½±Àø£¬·µ»Ø1-28
--Ê§°Ü·µ»Ø0
--"Free"Ãâ·Ñ¸ÅÂÊ
--"IB"ÊÕ·Ñ¸ÅÂÊ
function lb_RandomOneAward(nType)
	if not g_LuckyBoxAwardTab then
		DebugOutput("g_LuckyBoxAwardTab is nil")
		return 0;
	end
	if "string" ~= type(nType) then
		DebugOutput("'string' ~= type(nType)")
		return 0;
	end
	if "Free" == nType then
		return gf_GetRandItemByTable(g_LuckyBoxFreeAward, gf_SumRandBase(g_LuckyBoxFreeAward), 0);
	elseif "IB" == nType then
		return gf_GetRandItemByTable(g_LuckyBoxIBAward, gf_SumRandBase(g_LuckyBoxIBAward), 0);
	end
	return 0;
end

--¸ø½±Àø
function _lb_DoAward(nLotteryType)
	if not g_LuckyBoxAwardTab then
		g_LuckyBoxAwardTab = ff_GetTabFileTable(LB_AWARD_CONFIG, 3);
	end
	if not g_LuckyBoxAwardTab or getn(g_LuckyBoxAwardTab) ~= 28 then
		WriteLog(format("[luckybox][Error][Name:%s] _lb_DoAward(%d) can not read lucky_box.txt TaskValue = %d", GetName(), nLotteryType, GetTask(TASKID_LUCKYBOX_LOTTERY)));
		gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
		return 0;
	end
	local nIndex = gf_GetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13);
	local nIBOrFreeType = gf_GetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16);
	local tCell = g_LuckyBoxAwardTab[nIndex]
	if not tCell or getn(tCell) < 13 then
		WriteLog(format("[luckybox][Error][Name:%s] _lb_DoAward(%d) not tCell or getn(tCell) ~= 13 TaskValue = %d", GetName(), nLotteryType, GetTask(TASKID_LUCKYBOX_LOTTERY)));
		gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
		return 0;
	end
	--ÖØÖÃ³é½±½á¹û
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	if nIBOrFreeType == 0 then
		DebugOutput(tCell[1],tCell[2],tCell[3],tCell[4],tCell[5],tCell[6],tCell[7],tCell[8],tCell[9],tCell[10],tCell[11],tCell[12],tCell[13])
		if GetFreeItemRoom() > 0 then
			gf_AddItemEx2({tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]), tonumber(tCell[5]), tonumber(tCell[8])},
				 tCell[1], "B¸ch B¶o R­¬ng May M¾n", "FREE", tonumber(tCell[7]) * 24 *3600, 1);
			if tonumber(tCell[9]) == 1 then
				Msg2Global(format("Chóc mõng [%s] ë R­¬ng B¸ch B¶o May M¾n rót ®­îc phÇn th­ëng [%s]*%d, thËt lµ may m¾n!", GetName(), tCell[1], tonumber(tCell[5])));
			end
		else
			Msg2Player("Hµnh trang hoÆc søc lùc kh«ng ®ñ, xin s¾p xÕp l¹i!");
			gf_WriteLogEx("luckybox", "lack of free room");
		end
	elseif nIBOrFreeType == 1 then
		DebugOutput(tCell[1],tCell[2],tCell[3],tCell[4],tCell[5],tCell[6],tCell[7],tCell[8],tCell[9],tCell[10],tCell[11],tCell[12],tCell[13])
		if GetFreeItemRoom() > 0 then
			gf_AddItemEx2({tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]), tonumber(tCell[5]), tonumber(tCell[12])},
				 tCell[1], "B¸ch B¶o R­¬ng May M¾n", "IB", tonumber(tCell[11]) * 24 *3600, 1);
			if tonumber(tCell[13]) == 1 then
				Msg2Global(format("Chóc mõng [%s] ë R­¬ng B¸ch B¶o May M¾n rót ®­îc phÇn th­ëng [%s]*%d, thËt lµ may m¾n!", GetName(), tCell[1], tonumber(tCell[5])));
			end
			local szItemName = GetItemName(tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]));
			DebugOutput("szItemName =", szItemName);
--			--Í³¼Æ²ú³ö
--			if "Ììî¸Áî" == szItemName then
--				AddRuntimeStat(17, 10, 0, 1);
--			elseif "ÌìÃÅ½ðÁî" == szItemName then
--				AddRuntimeStat(17, 11, 0, 1);
--			elseif "À×»¢¾«ÆÇ" == szItemName then
--				AddRuntimeStat(17, 12, 0, 1);
--			end
		else
			Msg2Player("Hµnh trang hoÆc søc lùc kh«ng ®ñ, xin s¾p xÕp l¹i!");
			gf_WriteLogEx("luckybox", "lack of free room");
		end
		--¼ÌÐøÏÂÒ»ÂÖ
		local nLotteryCount = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3);
		if nLotteryCount - 1 > 0 then --ÊÇ·ñÎª10´ÎÁ¬¿ª
			lb_CostMoreIBItem(nLotteryType, nLotteryCount - 1);
		end
	end
end

--»î¶¯ÊÇ¹»¿ªÆô
function lb_IsOpen()
	--²»×öÎª»î¶¯·ÅÁË-----
	--if 1 then
	--	return 0
	--end
	---------------------
	--local nCurrTime = GetTime();
	--local nStartTime = MkTime(LB_START_TIME[1],LB_START_TIME[2],LB_START_TIME[3],LB_START_TIME[4],LB_START_TIME[5],LB_START_TIME[6]);
	--local nEndTime = MkTime(LB_STOP_TIME[1],LB_STOP_TIME[2],LB_STOP_TIME[3],LB_STOP_TIME[4],LB_STOP_TIME[5],LB_STOP_TIME[6]);
	--if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
	--	return 1;
	--end
	--return 0;
	
	return 1;
end

--¼ì²é»î¶¯²ÎÓëÌõ¼þ
function lb_CheckCondition()
	if GetLevel() < 90 then
		Talk(1,"",format("Nh©n vËt ch­a ®¹t cÊp <color=red>%d<color>", 90));
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10," ") ~= 1 then
		return 0;
	end
	return 1;
end

--Ã¿ÈÕÇåÀí
function lb_DailyClear()
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1, LB_FREE_USE_MAX, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, LB_IB_ITEM_USE_MAX, TASK_ACCESS_CODE_LUCKY_BOX);
end

--´ò¿ª¹Ø±Õ½çÃæÊ±ÇåÀí
function _lb_UIChange_Clean()
	DebugOutput("_lb_UIChange_Clean()")
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, 0, TASK_ACCESS_CODE_LUCKY_BOX);
end

--½øÐÐÒ»´ÎÃâ·Ñ³é½±
function lb_CostOneLuckyCoin(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	if GetItemCount(LB_FREE_COST_ITEM[1], LB_FREE_COST_ITEM[2], LB_FREE_COST_ITEM[3]) < LB_FREE_COST_ITEM[4] then
		Talk(1,"",format("Sè l­îng <color=red>%s<color> trong tói kh«ng ®ñ <color=red>%d<color> c¸i", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
		return 0;
	end
	local nRet = lb_RandomOneAward("Free");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostOneLuckyCoin(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		return 0;
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","H·y nghØ ng¬i råi thö l¹i!");
		return 0;
	end
	if DelItem(gf_UnPack(LB_FREE_COST_ITEM)) ~= 1 then
		Talk(1,"",format("Tiªu hao <color=yellow>%s*%d<color> xuÊt hiÖn bÊt th­êng, h·y thö l¹i!", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
		return 0;
	end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_FREE_COST_ITEM)
	Msg2Player(format("Tiªu hao [%s]*%d", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
	local nCount = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1);
	--Í³¼ÆÃâ·Ñ¿ªÆôÈËÊý
	if LB_FREE_USE_MAX == nCount then
		AddRuntimeStat(17, 14, 0, 1);
	end
	AddRuntimeStat(17, 13, 0, 1);
	--Ãâ·Ñ´ÎÊý×Ô¼õ 
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1, nCount - 1, TASK_ACCESS_CODE_LUCKY_BOX);
	--¼ÇÂ¼³é½±½á¹û
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--¼ÇÂ¼Á¬Ðø³é½±Ê£Óà´ÎÊý
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	
	StartLuckyBox(nLotteryType, nLotteryCount);
end

--½øÐÐÒ»´ÎIB³é½±
function lb_CostOneIBItem(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	local nIBTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4);
	if nIBTimes <= 0 then
		Talk(1,"",format("H«m nay cã thÓ dïng %s víi sè lÇn lµ %d, hiÖn t¹i cßn %d", "Rót th­ëng H¹nh VËn", LB_IB_ITEM_USE_MAX, nIBTimes));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	if GetItemCount(LB_IB_COST_ITEM[1], LB_IB_COST_ITEM[2], LB_IB_COST_ITEM[3]) < LB_IB_COST_ITEM[4] then
		Talk(1,"",format("Sè l­îng <color=red>%s<color> trong tói kh«ng ®ñ <color=red>%d<color> c¸i", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		return 0;
	end
	local nRet = lb_RandomOneAward("IB");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostOneIBItem(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		return 0;
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","H·y nghØ ng¬i råi thö l¹i!");
		return 0;
	end
	if DelItem(gf_UnPack(LB_IB_COST_ITEM)) ~= 1 then
		Talk(1,"",format("Tiªu hao <color=yellow>%s*%d<color> xuÊt hiÖn bÊt th­êng, h·y thö l¹i!", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		return 0;
	end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_IB_COST_ITEM)
	Msg2Player(format("Tiªu hao [%s]*%d", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		
	--¼ÇÂ¼³é½±½á¹û
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 1, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--¼ÇÂ¼Á¬Ðø³é½±Ê£Óà´ÎÊý
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, nLotteryCount, TASK_ACCESS_CODE_LUCKY_BOX);
	--Ê¹ÓÃÒ»´ÎÐÒÔËÒ¡½±
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, nIBTimes - 1, TASK_ACCESS_CODE_LUCKY_BOX);
		
	StartLuckyBox(nLotteryType, nLotteryCount);
	
	--×ÜÈËÊý
	if LB_IB_ITEM_USE_MAX == nIBTimes then
		AddRuntimeStat(17, 16, 0, 1);
	end
	--×Ü´ÎÊý
	AddRuntimeStat(17, 15, 0, 1);
end

--½øÐÐ¶à´ÎIB³é½±
function lb_CostMoreIBItem(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if 10 == nLotteryCount then
		--¿ªÊ¼Á¬³éÇ°ÅÐ¶ÏÊÇ·ñ¹»10¸ö¸ñ×Ó
		if gf_Judge_Room_Weight(10, 100, " ") ~= 1 then
			return 0;
		end
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","H·y nghØ ng¬i råi thö l¹i!");
		StartLuckyBox(0, 0);
		return 0;
	end
	local nRet = lb_RandomOneAward("IB");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostMoreIBItem(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		StartLuckyBox(0, 0);
		return 0;
	end
	--¿Û³ý´ú±Ò
	local nIBTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4);
	if nIBTimes <= 0 then
		Talk(1,"",format("H«m nay cã thÓ dïng %s víi sè lÇn lµ %d, hiÖn t¹i cßn %d", "Rót th­ëng H¹nh VËn", LB_IB_ITEM_USE_MAX, nIBTimes));
		StartLuckyBox(0, 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		StartLuckyBox(0, 0);
		return 0;
	end
	if GetItemCount(LB_IB_COST_ITEM[1], LB_IB_COST_ITEM[2], LB_IB_COST_ITEM[3]) < LB_IB_COST_ITEM[4] then
		Talk(1,"",format("Sè l­îng <color=red>%s<color> trong tói kh«ng ®ñ <color=red>%d<color> c¸i", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		StartLuckyBox(0, 0);
		return 0;
	end
	if DelItem(gf_UnPack(LB_IB_COST_ITEM)) ~= 1 then
		Talk(1,"",format("Tiªu hao <color=yellow>%s*%d<color> xuÊt hiÖn bÊt th­êng, h·y thö l¹i!", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		StartLuckyBox(0, 0);
		return 0;
	end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_IB_COST_ITEM)
	Msg2Player(format("Tiªu hao [%s]*%d", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
	
	--Ê¹ÓÃ1´ÎÌì½¾Áî
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, nIBTimes - 1, TASK_ACCESS_CODE_LUCKY_BOX);
	--¼ÇÂ¼³é½±½á¹û
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 1, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--¼ÇÂ¼Á¬Ðø³é½±Ê£Óà´ÎÊý
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, nLotteryCount, TASK_ACCESS_CODE_LUCKY_BOX);
	
	StartLuckyBox(nLotteryType, nLotteryCount);
	
	--×ÜÈËÊý
	if LB_IB_ITEM_USE_MAX == nIBTimes then
		AddRuntimeStat(17, 16, 0, 1);
	end
	--×Ü´ÎÊý
	AddRuntimeStat(17, 15, 0, 1);
end
			
--gsµ÷ÓÃ½Ó¿ÚLuckyBox.cpp----------------------
function _lb_OnLottery(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if lb_CheckCondition() ~= 1 then
		return 0;
	end
	--³éÒ»´Î
	if 1 == nLotteryType then
		local nFreeTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1);
		if nFreeTimes > 0 then
			lb_CostOneLuckyCoin(nLotteryType, nLotteryCount); --Ãâ·ÑÒ»´Î
			return 1;
		else	
			--½ñÈÕÃ»ÓÐÃâ·Ñ´ÎÊý
			lb_CostOneIBItem(nLotteryType, nLotteryCount); --IBÒ»´Î
			return 1;
		end
	--³é10´Î
	elseif 2 == nLotteryType then
		Say(format("<color=green>R­¬ng b¸ch b¶o may m¾n: <color>%s muèn më 10 lÇn kh«ng?", gf_GetPlayerSexName()), 2,
					format("\nX¸c nhËn/#lb_CostMoreIBItem(%d, %d)", nLotteryType, nLotteryCount),  --IB Ò»´Î
					"\n§Ó ta suy nghÜ l¹i/nothing");
		return 1;
	end
	return 0;
end

--»î¶¯NPC²¿·Ö------------------------------------
LB_NPC_TITLE = "§Ó chµo mõng phiªn b¶n míi, §¹i Sø ®· chuÈn bÞ cho mäi ng­êi 1 R­¬ng B¸ch B¶o May M¾n, h·y nhanh chãng tham gia ®Ó nhËn phÇn th­ëng phong phó nµo!"

LB_NPC_DIALOG = {
	"Tham gia ho¹t ®éng R­¬ng B¸ch B¶o May M¾n/lb_JoinActivity",
	"H­íng dÉn ho¹t ®éng/lb_ActivityInfo",
	"Nguån vËt phÈm ho¹t ®éng/lb_ItemDorp",
}

function lb_JoinActivity()
	if lb_IsOpen() ~= 1 then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc");
		return 0;
	end		
	SendScript2Client("Open[[luckybox]]");	
end

function lb_ActivityInfo()
	local strTitle = "Trong thêi gian ho¹t ®éng, gamer cã thÓ ®Õn chç §¹i Sø Ho¹t §éng tham gia R­¬ng B¸ch B¶o May M¾n. Ng­êi ch¬i cã thÓ dïng TiÒn May M¾n ®Ó më r­¬ng 8 lÇn. B¾t ®Çu tõ lÇn thø 9 sÏ ph¶i tiªu hao1Thiªn Kiªu LÖnh, ng­êi ch¬i chØ cÇn nhÊp b¾t ®Çu ®Ó më r­¬ng, phÇn th­ëng sÏ tù ®éng ®­a vµo tói. \n####Dïng TiÒn May M¾n nhËn ®­îc phÇn th­ëng ®a sè ®Òu bÞ khãa, dïng Thiªn Kiªu LÖnh nhËn ®­îc phÇn th­ëng ®a sè ®Òu kh«ng khãa\n    Ngo¹i trõ më r­¬ng ®¬n lÎ, ng­êi ch¬i cßn cã thÓ më r­¬ng liªn tôc 10 lÇn, sau khi nhÊp më 10 lÇn, hÖ thèng sÏ tù ®éng tiÕn hµnh më r­¬ng. NÕu dïng Thiªn Kiªu LÖnh më 10 lÇn , sÏ tiªu hao 10 Thiªn Kiªu LÖnh. NÕu tói cña ng­êi kh«ng ®ñ chç trèng hoÆc tiªu hao hÕt Thiªn Kiªu LÖnh, th× sÏ tù ®éng ngõng rót th­ëng. \n    Tiªu diÖt Sa M¹c Hµnh Nh©n, TÇm B¶o Nh©n ë Mª Cung Sa M¹c vµ T©y H¹ Vâ SÜ, T©y H¹ Dòng SÜ ë D­îc V­¬ng Cèc sÏ nhËn ®­îc TiÒn May M¾n. \n    <color=red>11:00-13:00 vµ 20:00-22:00 h»ng ngµy, ®¸nh qu¸i sÏ cã x¸c suÊt r¬i ra TiÒn May M¾n cao h¬n gÊp ®«i<color>";
	local tbSay = {};
	tbSay.msg = "<color=green> §¹i Sø ho¹t ®éng: <color>"..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function lb_ItemDorp()
	local strTitle = "Nguån gèc cña TiÒn May M¾n: Tiªu diÖt Sa M¹c Hµnh Nh©n, TÇm B¶o Nh©n ë Mª Cung Sa M¹c vµ T©y H¹ Vâ SÜ, T©y H¹ Dòng SÜ ë D­îc V­¬ng Cèc sÏ nhËn ®­îc TiÒn May M¾n.<color=red>11:00-13:00 vµ 20:00-22:00 h»ng ngµy, ®¸nh qu¸i sÏ cã x¸c suÊt r¬i ra TiÒn May M¾n cao h¬n gÊp ®«i<color>";
	local tbSay = {};
	tbSay.msg = "<color=green> §¹i Sø ho¹t ®éng: <color>".."§©y lµ vËt phÈm míi cña ho¹t ®éng lÇn nµy, h·y xem thö lµm sao cã ®­îc!".."\n"..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

--ÐÒÔË±ÒµôÂä²¿·Ö-------------------------------------
--ÏµÍ³¹«¸æµ÷ÓÃ
function main()
	if lb_IsOpen() ~= 1 then
		return 0;
	end
	local nHour = tonumber(date("%H"))
	local msg = ""
	if nHour >= 11 and nHour <= 12 then
		msg = "11:00-13:00 ®Õn Mª Cung Sa M¹c vµ D­îc V­¬ng Cèc tiªu diÖt qu¸i sÏ cã x¸c suÊt r¬i ra TiÒn May M¾n cao h¬n gÊp ®«i!"
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
	elseif nHour >= 20 and nHour <= 21 then
		msg = "20:00-22:00 ®Õn Mª Cung Sa M¹c vµ D­îc V­¬ng Cèc tiªu diÖt qu¸i sÏ cã x¸c suÊt r¬i ra TiÒn May M¾n cao h¬n gÊp ®«i!"
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
	end
end

--ÐÒÔË±ÒµôÂä
function lb_OnKiller(szNpcName)
	if lb_IsOpen() ~= 1 then
		return 0;
	end
	if szNpcName ~= "Sa M¹c Hµnh Nh©n" and szNpcName ~= "TÇm B¶o Nh©n" 
		and szNpcName ~= "T©y H¹ Vâ SÜ" and szNpcName ~= "T©y H¹ Dòng SÜ" then
		return 0;
	end
	local nRand = 3;
	local nHour = tonumber(date("%H"))
	if (nHour >= 11 and nHour <= 12) or (nHour >= 20 and nHour <= 21) then
		nRand = 8
	end
	if random(100) > nRand then
		return 0;
	end
	local nMapID, nX, nY = GetWorldPos()
	gf_TeamOperateEX(function ()
		if %nMapID ~= GetWorldPos() then
			return
		end
		if GetFreeItemRoom() > 0 then
			AddItem(2, 1, 30664, 1);
		end
	end)
end