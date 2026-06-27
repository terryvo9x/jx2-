-- π·Õ®»Ø 2,114,118
-- …˝ª™√ÿºÆ
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\book_appendix\\head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

function OnUse(nItemIdx)
	onUse(nItemIdx);
end

function onUse(nItemIdx, bSure)
	local bookIdx = GetPlayerEquipIndex(itempart_book);
	if bookIdx == 0 then
		Talk(1, "", "H∑y trang bﬁ b› k›p tr≠Ìc")
		return
	end
	if IsReading() == 1 then
		return Talk(1, "", "D≠Ìi trπng th∏i tu luy÷n s∏ch kh´ng th” ti’n hµnh thao t∏c!");
	end
	local g,d,p = GetItemInfoByIndex(bookIdx);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
		return Talk(1, "", "Bﬁ k›p bπn Æang trang bﬁ kh´ng th” th®ng c p!");
	end
	if GetEquipLevel(bookIdx) < 99 then
		return Talk(1, "", "B› k›p bπn Æang trang bﬁ ch≠a tu luy÷n Æ’n Æ«y c p, kh´ng th” th®ng c p!");
	end
	--print(GetSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, -1))
	if GetSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, -1) then
		return Talk(1, "", format("[%s] mµ bπn trang bﬁ Æ∑ th®ng hoa, kh´ng th” ti’n hµnh thao t∏c", GetItemName(bookIdx)));
	end
	if not bSure then
		local tSel = {
			format("ßÂng ˝/#onUse(%d, 1)", nItemIdx),
			"HÒy b·/nothing",
		}
		Say("Qu∏n Th´ng Quy”n: Quy’t Æﬁnh th®ng hoa ch©n quy”n hi÷n Æang trang bﬁ? Sau khi ch p hµnh sœ ti™u hao 1 Qu∏n Th´ng Quy”n.", 
			getn(tSel), tSel);
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) ~= 1 then return end

	local bRet = AddSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()]);
	SyncItem2Client(bookIdx);
	if bRet >= 0 then
		Talk(1,"","Th®ng hoa b› k›p thµnh c´ng")
		AddRuntimeStat(39, 5, 0, 1)
	else
		AddItem(2,114,118,1)
		Talk(1,"","Th®ng hoa b› k›p th t bπi")
	end
	--Observer:onEvent(OE_BOOKAPP_UPGRADE, {book=bookIdx});
	--print("AddSubData result ", bRet, bookIdx, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()])
	WriteLog(format("[BookApp] [ShenHua] [Acc=%s, Role=%s] [Book=%s]", GetAccount(), GetName(), GetItemName(bookIdx)));
	--AddStatValue("bookapp_upgrade", 1);
end
