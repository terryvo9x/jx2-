-- ÕæÎäÊÖ¼Ç
-- Ba & Bia
-- 2,114,120; 2,114,121
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\book_appendix\\head.lua")

function OnUse(nItemIdx)
	local bookIdx = GetPlayerEquipIndex(itempart_book);
	if bookIdx == 0 then
		Talk(1, "", "H·y trang bÞ bÝ kÝp tr­íc")
		return
	end

	if nil == GetSubData(1, nItemIdx, enumCCDT_Item_Book_Appendix, -1) then
		Ba(nItemIdx, bookIdx, exchange); -- Ba
	else
		Bia(bookIdx, nItemIdx); -- Bia
	end
end

function Ba(toItem, fromItem, bSure)
	local g,d,p = GetItemInfoByIndex(fromItem);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
		return Talk(1, "", "BÝ kÝp b¹n ®ang trang bÞ kh«ng thÓ tiÕn hµnh thao t¸c!");
	end
	if IsBookLocked() == 1 then
		return Talk(1, "", "BÝ kÝp b¹n ®ang trang bÞ kh«ng thÓ tiÕn hµnh thao t¸c!");
	end
	if IsReading() == 1 then
		return Talk(1, "", "D­íi tr¹ng th¸i tu luyÖn s¸ch kh«ng thÓ tiÕn hµnh thao t¸c!");
	end
	if GetSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1) then
		return Talk(1, "", format("[%s] ®· cã thuéc tÝnh, kh«ng thÓ tiÕn hµnh thao t¸c", GetItemName(toItem)));
	end
	if GetSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] kh«ng cã thuéc tÝnh, kh«ng thÓ tiÕn hµnh thao t¸c", GetItemName(fromItem)));
	end
	if not bSure then
		local tSel = {
			format("§ång ý/#Ba(%d, %d, 1)", toItem, fromItem),
			"Hñy bá/nothing",
		}
		Say("Ch©n Vâ Thñ Ký: QuyÕt ®Þnh viÕt l¹i néi dung cña Ch©n Vâ MËt TÞch hiÖn ®ang trang bÞ kh«ng? Sau khi chÊp hµnh sÏ tiªu hao 1 Ch©n Vâ Thñ Ký, ®ång thêi tÊt c¶ néi dung Ch©n Vâ B¶o §iÓn cña bÝ kÝp ®ang trang bÞ còng sÏ biÕn mÊt.", 
			getn(tSel), tSel);
		return
	end
	if DelItemByIndex(toItem, 1) ~= 1 then return end
	local ret, newItem = gf_AddItemEx2(exchange[2][2],exchange[2][1]);
	if ret ~= 1 then
		return Talk(1, "", "[Ch©n Vâ Thñ Ký] Lçi ch­a x¸c ®Þnh! H·y liªn hÖ bé phËn ch¨m sãc kh¸ch hµng!");
	end
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [Item=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(fromItem), GetSubDataLog(1, fromItem, enumCCDT_Item_Book_Appendix, -1)))
	CloneSubData(1, fromItem, 1, newItem, enumCCDT_Item_Book_Appendix, -1);
	while (1 == DelSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1)) do end
	AddSubData(1, fromItem, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()]);
	SyncItem2Client(fromItem);
	SyncItem2Client(newItem);
	--AddStatValue("bookapp_ba", 1);
end

function Bia(toItem, fromItem, bSure)
	if GetEquipLevel(toItem) < 99 then
		return Talk(1, "", "BÝ kÝp b¹n ®ang trang bÞ ch­a tu luyÖn ®Õn ®Çy cÊp, kh«ng thÓ th¨ng cÊp!");
	end
	local g,d,p = GetItemInfoByIndex(toItem);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
		return Talk(1, "", "BÝ kÝp b¹n ®ang trang bÞ kh«ng thÓ tiÕn hµnh thao t¸c!");
	end
	local g,d,p = GetItemInfoByIndex(fromItem);
	if exchange[2][2][3] ~= p then
		return Talk(1, "", "L­u ph¸i kh«ng phï hîp, kh«ng thÓ tiÕn hµnh thao t¸c!");
	end
	if GetSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] kh«ng cã thuéc tÝnh, kh«ng thÓ tiÕn hµnh thao t¸c", GetItemName(fromItem)));
	end
	if GetSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] ch­a th¨ng hoa, kh«ng thÓ tiÕn hµnh thao t¸c", GetItemName(toItem)));
	end
	if not bSure then
		local tSel = {
			format("§ång ý/#Bia(%d, %d, 1)", toItem, fromItem),
			"Hñy bá/nothing",
		}
		Say("QuyÕt ®Þnh ®em néi dung ®ang ghi chÐp viÕt lªn trªn bÝ kÝp ®ang trang bÞ kh«ng? Sau khi chÊp hµnh th× vËt phÈm nµy sÏ biÕn mÊt, ®ång thêi chÐp ®Ì lªn tÊt c¶ néi dung trªn bÝ kÝp hiÖn ®ang trang bÞ.", 
			getn(tSel), tSel);
		return
	end
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [fromItem=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(fromItem), GetSubDataLog(1, fromItem, enumCCDT_Item_Book_Appendix, -1)))
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [toItem=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(toItem), GetSubDataLog(1, toItem, enumCCDT_Item_Book_Appendix, -1)))
	while (1 == DelSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1)) do end
	CloneSubData(1, fromItem, 1, toItem, enumCCDT_Item_Book_Appendix, -1);
	while (1 == DelSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1)) do end
	SyncItem2Client(toItem);
	if 1 ~= DelItemByIndex(fromItem, 1) then
		WriteLog(format("[BookApp] [Del Fail] [Acc=%s, Role=%s] [from=%s, to=%s]", 
			GetAccount(), GetName(), GetItemName(fromItem), GetItemName(toItem)));
		return
	end
	AddStatValue("bookapp_bia", 1);
end
