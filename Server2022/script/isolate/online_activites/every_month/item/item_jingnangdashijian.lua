----------------------------------------------------------------------------------
tExchange = {
	gtNormalExchange:new(), --¶Ò»»1³É¹¦
	gtNormalExchange:new(), --¶Ò»»1Ê§°Ü
	gtNormalExchange:new(), --¶Ò»»2³É¹¦
	gtNormalExchange:new(), --¶Ò»»2Ê§°Ü
	gtNormalExchange:new(), --¶Ò»»3³É¹¦
	gtNormalExchange:new(), --¶Ò»»3Ê§°Ü
	--gtNormalExchange:new(), --¶Ò»»100µÀ¾ßXu
}
_tMaterials = tConfig.tMaterials
_Products = tConfig.tProducts
tExchange[1].tConsume = {
	{_tMaterials[1][1], _tMaterials[1][2][1],  _tMaterials[1][2][2],  _tMaterials[1][2][3], 10}, --10²ÄÁÏ1
	{_tMaterials[2][1], _tMaterials[2][2][1],  _tMaterials[2][2][2],  _tMaterials[2][2][3], 10}, --10²ÄÁÏ2
	{"Tiªu Dao Ngäc", 2, 1, 30603, 2},
}
tExchange[1].tAward = {
	{_Products[1][1], _Products[1][2][1],  _Products[1][2][2],  _Products[1][2][3], 1}, --1²úÆ·1
}
tExchange[2].tConsume = tExchange[1].tConsume
tExchange[2].tAward = {
	{_Products[2][1], _Products[2][2][1],  _Products[2][2][2],  _Products[2][2][3], 1}, --1²úÆ·2
}
tExchange[3].tConsume = {
	{_Products[1][1], _Products[1][2][1],  _Products[1][2][2],  _Products[1][2][3], 1}, --1²úÆ·1
	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 20}, --20²ÄÁÏ3
}
tExchange[3].tAward = {
	{_Products[3][1], _Products[3][2][1],  _Products[3][2][2],  _Products[3][2][3], 1}, --1²úÆ·3
}
tExchange[4].tConsume = tExchange[3].tConsume
tExchange[4].tAward = {
	{_Products[1][1], _Products[1][2][1],  _Products[1][2][2],  _Products[1][2][3], 1}, --1²úÆ·1
}
tExchange[5].tConsume = {
	{_Products[2][1], _Products[2][2][1],  _Products[2][2][2],  _Products[2][2][3], 1}, --1²úÆ·2
	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 20}, --20²ÄÁÏ3
}
tExchange[5].tAward = {
	{_Products[3][1], _Products[3][2][1],  _Products[3][2][2],  _Products[3][2][3], 1}, --1²úÆ·3
}
tExchange[6].tConsume = tExchange[5].tConsume
tExchange[6].tAward = {
	{_Products[2][1], _Products[2][2][1],  _Products[2][2][2],  _Products[2][2][3], 1}, --1²úÆ·2
}
--tExchange[7].tConsume = {
--	{"´óÒøÆ±", 2, 1, 199, 1},
--}
--tExchange[7].tAward = {
--	{"½ð±Ò", 2, 1, 30230, 100},
--}
_tMaterials=nil
_Products=nil

--½õÄÒ´óÊÂ¼þ
SZ_TITLE_HEAD = ""
function handle_on_item_talk_jingnangdashijian(nIndex)
	local _,nStartDate, nEndDate = isolate_get_dates()
	
	local szTalk = format("%s thêi gian më %s - %s. Chi tiÕt h·y xem trªn trang chñ %s.",
		isolate_view_name(), isolate_get_str_date(nStartDate), isolate_get_str_date(nEndDate), "volam2.zing.vn")
	SZ_TITLE_HEAD = format("<color=gold>%s:<color>", GetItemName(nIndex))
	local szTitle = format("%s%s", SZ_TITLE_HEAD, szTalk)
    local tbSay = {}
    
    if isolate_in_date() == 1 then
    	_add_exchange_talk(tbSay, 1)
        _add_exchange_talk(tbSay, 2)
        _add_exchange_talk(tbSay, 3)
        tinsert(tbSay, format("%s/#_final_award_talk(1)", format("NhËn phÇn th­ëng cuèi %s ", tConfig.tProducts[1][1])))
        tinsert(tbSay, format("%s/#_final_award_talk(2)", format("NhËn phÇn th­ëng cuèi %s ", tConfig.tProducts[2][1])))
        tinsert(tbSay, format("%s/#_final_award_talk(3)", format("NhËn phÇn th­ëng cuèi %s ", tConfig.tProducts[3][1])))
	end
    
    tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function _add_exchange_talk(tSay, nIndex)
	local szWord = format("§æi %s hoÆc %s", tExchange[2*nIndex-1]:get_award_desc(),  tExchange[2*nIndex]:get_award_desc())
	tinsert(tSay, format("%s/#_exchange_talk(%d)", szWord, nIndex))
end
function _exchange_talk(nIndex, bConfirm)
	if not bConfirm then
		local tbSay = {}
		local szTitle = format("§æi %s hoÆc %s", tExchange[2*nIndex-1]:get_award_desc(),  tExchange[2*nIndex]:get_award_desc())
		szTitle = format("%s%s,%s<color=yellow>%s<color>,%s", SZ_TITLE_HEAD, szTitle, "CÇn tiªu hao", tExchange[2*nIndex-1]:get_consume_desc(), "x¸c nhËn kh«ng?")
		tinsert(tbSay, format("%s/#_exchange_talk(%d,1)", "X¸c ®Þnh ®æi", nIndex))
		--tinsert(tbSay, format("%s/#handle_on_item_talk_jingnangdashijian(%d)", "·µ»Ø", 0))
		tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
		Say(szTitle, getn(tbSay), tbSay)
		return
	end
	
	local t = tExchange[2*nIndex-1]
	local nMax = t:get_max_exchange_cnt()
	if nMax > 0 then
		local szFunc = format("_exchange_confirm_%d", nIndex)
		AskClientForNumber(szFunc, 1, nMax, "§æi bao nhiªu lÇn")
	else
		Talk(1, "", "H×nh nh­ kh«ng ®ñ nguyªn liÖu")
	end
end
function _exchange_confirm(nIndex, nNum)
	local nSucCnt = 0
	for i=1,nNum do
		local t = nil
		if random(100)<=50 then--50%³É¹¦ÂÊ
			t = tExchange[2*nIndex-1]
		else
			t = tExchange[2*nIndex]
		end
		if 1 ~= t:do_exchange(1,1) then
			break
		end
		nSucCnt = nSucCnt + 1
	end
	if nSucCnt > 0 then AddRuntimeStat(33, 1, nIndex, nSucCnt) end
end
function _exchange_confirm_1(nNum) return _exchange_confirm(1,nNum) end
function _exchange_confirm_2(nNum) return _exchange_confirm(2,nNum) end
function _exchange_confirm_3(nNum) return _exchange_confirm(3,nNum) end

function _final_award_talk(nIndex)
	local t = tConfig.tProducts[nIndex]
	if get_task_bit("task_get_final_award", format("bit_award%d", nIndex)) == 1 then
		Talk(1, "", "§· nhËn phÇn th­ëng nµy råi")
		return
	end
	local nUseCount = get_product_use_count(nIndex)
	local nMaxUseCount = tStaticConfig.tProductsMaxUse[nIndex]
	local szTitle = format("%s hiÖn t¹i dïng <color=yellow>%s<color> cã sè l­îng lµ <color=yellow>[%d/%d]<color>", SZ_TITLE_HEAD, t[1], nUseCount, nMaxUseCount
		)
	local tbSay = {}
	if _check_use_cnt(nIndex, 1) == 1 then
		szTitle = format("%s,%s", szTitle, "Cã thÓ chän 1 phÇn th­ëng bªn d­íi")
		local tAward = tConfig.tFinalPrizeSel[nIndex]
		for i=1,getn(tAward) do
			local szAward = tAward[i]
			tinsert(tbSay, format("%s/#_final_award(%d, %d)", get_award_name(szAward), nIndex, i))
		end
	else
		szTitle = format("%s,%s", szTitle, "T¹m thêi kh«ng thÓ nhËn phÇn th­ëng cuèi")
	end
	--tinsert(tbSay, format("%s/#handle_on_item_talk_jingnangdashijian(%d)", "·µ»Ø", 0))
	tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
	Say(szTitle, getn(tbSay), tbSay)
	return
end

function _final_award(nIndex, nAward, bConfirm)
	if get_task_bit("task_get_final_award", format("bit_award%d", nIndex)) == 1 then
		return
	end
	local tAward = tConfig.tFinalPrizeSel[nIndex]
	local szAward = tAward[nAward]
	local r,msg = check_get_award(szAward, 0)
	if not bConfirm then
		local szTitle = format("%s sÏ nhËn phÇn th­ëng[<color=yellow>%s<color><color=red>%s<color>], x¸c ®Þnh nhËn kh«ng? ", SZ_TITLE_HEAD,get_award_desc(szAward), msg)
		local tbSay = {}
		tinsert(tbSay, format("%s/#_final_award(%d, %d, 1)", "NhËn ", nIndex, nAward))
		tinsert(tbSay, format("%s/#_final_award_talk(%d)", "trë l¹i", nIndex))
		tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
		Say(szTitle, getn(tbSay), tbSay)
		return
	end
	if _check_use_cnt(nIndex, 1) == 1 then
		local szTask,szTaskBit = "task_get_final_award", format("bit_award%d", nIndex)
		local nTask = get_task_id(szTask)
		local nTaskBit = get_task_sub_id(szTask,szTaskBit)
		local r = get_award(szAward, nTask, nTaskBit)
		local is_vng_award = check_is_vng_award(szAward)
		if is_vng_award == 0 then--vngµÄ½±ÀøÁì½±±êÖ¾ËûÃÇ×Ô¼ºÔÚº¯ÊýÀïÃæÈ¥ÉèÖÃ
        	if r ==  1 then
        		set_task_bit(szTask,szTaskBit, 1)
        		Talk(1, "", "NhËn phÇn th­ëng cuèi thµnh c«ng")
        		AddRuntimeStat(33, 3, nIndex, 1)
        		AddRuntimeStat(33, 4, nIndex*10+nAward, 1)
        	else
        		Talk(1, "", "NhËn phÇn th­ëng cuèi thÊt b¹i")
        	end
		end
		
    end
end
function _check_use_cnt(nIndex, bRelate)
	local nUseCount = get_product_use_count(nIndex)
	local nMaxUseCount = tStaticConfig.tProductsMaxUse[nIndex]
	if nUseCount < nMaxUseCount then
		return 0
	end
	if bRelate and bRelate == 1 and nIndex == 3 and (_check_use_cnt(1)~=1 or _check_use_cnt(2)~=1) then
		return 0
	end
	return 1
end
