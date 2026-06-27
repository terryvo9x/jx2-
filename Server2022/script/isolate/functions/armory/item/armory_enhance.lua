--½Å±¾Ãû³Æ£º
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£ºÁõÁÁ
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2010-03-29
--´úÂëÐÞ¸Ä¼ÇÂ¼

Import("\\script\\lib\\globalfunctions.lua");


g_tItem = { -- °ü°ü
	[14] = {"Cæ Kim Th¹ch",	2,	201,	14},
	[15] = {"§iÓm Tinh Ngäc",	2,	201,	15},
	[16] = {"§iÓm Tinh Ngäc-Nhá",	2,	201,	16},
};

function OnUse(idx)
	local nItemIndex	= tonumber(idx);
	local nG, nD, nP	= GetItemInfoByIndex(nItemIndex);
	local tItem		= g_tItem[nP];

	if not tItem then
		return 0;
	end

	if tItem[2] ~= nG or tItem[3] ~= nD or tItem[4] ~= nP then
		return 0;
	end

	SendScript2Client('Open([[CommonEnhanceItem]],203);');

	return 1;
end
