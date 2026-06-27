-----------------------------------------------------------------------
-- ¸øÎïÆ·Ä£°å3
-- by windle
-- 2009-8-7 10:11
-- ËµÃ÷:
--	Clause = { subclauses }
--	subclauses = [Clause, Award]*
--	Award = [Item, {Item, nRate}]		; nRate = ¸ÅÂÊ
--	Item = {name,{g,d,p,n...}, szNotice, {nExpireTime}}
--		  | { nil }
--		  | { {["Exp","Rep","SchoolRep", "Money"], nMin, nMax}, nil, szNotice, {nExpireTime}}
--
--		szNotice	¹«¸æÄÚÈİ, Èç"¹§Ï² $n ¿ªÆô<xx´óÀñ°ü>»ñµÃ $i", $n×Ô¶¯Ìæ»»³ÉÍæ¼ÒÃû×Ö, $iÌæ»»³É"ÎïÆ·Ãû×ÖxÊıÁ¿"
--		nExpireTime	ÎïÆ·¹ıÆÚÉèÖÃ, ÄÚÈİ¼´gf_SetItemExpireTimeµÄ²ÎÊı, ÓĞ2ÖÖĞÎÊ½, 1¸öÖµ»ò6¸öÖµ
--	ÀàÍ¼:
--		Clause3 »ùÀà
--			ClauseAll		È«¸ø
--			ClauseRandom	ÁªºÏ¸ÅÂÊ
--			ClauseRandomAll	¶ÀÁ¢¸ÅÂÊ
--	Clause3µ÷ÓÃÈë¿Ú : Clause3:preprocess()
--	Clause3¸øÎïÆ·º¯Êı Clause3:giveClause()	¿ÉÒÔ×ÔÓÉÖØÔØ
-----------------------------------------------------------------------
Import("\\script\\class\\mem.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\hash_callback.lua");
Include("\\script\\class\\clause2.lua");
-----------------------------------------------------------------------

Clause3 = Clause2

function Clause3:giveItem(Item)
	-- item½á¹¹
	--{ name, {g,d,p,n,...}, p3, p4 }
	-- ËµÃ÷:
	--		Ò»°ãÇé¿ö	{ÎïÆ·Ãû, {g,d,p,n,....}}
	--		¿ÕÎïÆ·		{ nil }
	--		¾­Ñé,ÉùÍûµÈ	{{type, nMin, nMax}}		type = 'Exp', 'Rep', 'Money'
	local nRet, nItemIdx = nil;
	local szNotice = Item[3] or "";
	local nItemIdx = nil;
	local nNum = 0;
	if Item[1] == nil then
		return
	end
	if type(Item[1]) == "table" then
		szType = Item[1][1];
		nNum = Item[1][2];
		if Item[1][3] then
			nNum = random(nNum, Item[1][3]);
		end
		gf_Modify(szType, nNum);
		if szNotice then
			local t = {Exp="Kinh nghiÖm",SchoolRep="Danh väng s­ m«n",Money="Vµng vâ l©m"};
			local szItemName = t[szType];
			szNotice = gsub(szNotice,"%$i",format("[%s] x%d", szItemName,nNum));
		end
		return 0;
	elseif type(Item[2]) == "table" then
		local tExpireTime = Item[4];
		if type(tExpireTime) == "table" then
			for i = 1, Item[2][4] do
				nRet, nItemIdx = gf_AddItemEx(Item[2], Item[1], 1);
				gf_SetItemExpireTime(nItemIdx, gf_UnPack(tExpireTime));
			end
		else
			nRet, nItemIdx = gf_AddItemEx(Item[2], Item[1]);
		end
		szNotice = gsub(szNotice,"%$i",format("[%s] x%d", Item[1], Item[2][4]));
		szNotice = gsub(szNotice,"%$n",GetName());
		if szNotice ~= "" then
			Msg2Global(szNotice);
		end
		return nItemIdx;
	elseif type(Item[2]) == "string" then
		SendScript2VM(Item[3],Item[2]);
		return 0;
	end
end
