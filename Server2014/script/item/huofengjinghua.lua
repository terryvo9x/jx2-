Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

g_szTitle = "<color=green>Lùa chän: <color>"

List = {
	[1008] = {1008, "TiÖm Tèng Háa Phông T­íng Qu©n"},
	[1009] = {1009, "TiÖm Liªu Háa Phông T­íng Qu©n"},
	[1010] = {1010, "TiÖm Tèng Háa Phông Nguyªn So¸i"},
	[1011] = {1011, "TiÖm Liªu Háa Phông Nguyªn So¸i "},
}

function OnUse(nItemIndex)
	local nItem = GetItemParticular(nItemIndex)

	local tSay = {
	};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[2].."/#show_equip_shop("..v[1]..")");
	end
	
	tinsert(tSay, "\nRa khái/nothing");
	Say(g_szTitle.."Cöa Hµng", getn(tSay), tSay);	
end