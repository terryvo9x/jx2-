Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

g_szTitle = "<color=green>Lùa chän:  <color>"

List = {
	[31324] = {
		[1000] = {1000, "TiÖm Tèng Uy Hæ T­íng Qu©n"},
		[1001] = {1001, "TiÖm Liªu Uy Hæ T­íng Qu©n"},
		[1002] = {1002, "TiÖm Tèng Uy Hæ Nguyªn So¸i"},
		[1003] = {1003, "TiÖm Liªu Uy Hæ Nguyªn So¸i "},
	},
	[31325] = {
		[1000] = {1000, "TiÖm Tèng Uy Hæ T­íng Qu©n"},
		[1001] = {1001, "TiÖm Liªu Uy Hæ T­íng Qu©n"},
		[1002] = {1002, "TiÖm Tèng Uy Hæ Nguyªn So¸i"},
		[1003] = {1003, "TiÖm Liªu Uy Hæ Nguyªn So¸i "},
	},
	[31223] = {
		[1004] = {1004, "TiÖm Tèng Thanh Long T­íng Qu©n"},
		[1005] = {1005, "TiÖm Liªu Thanh Long T­íng Qu©n"},
		[1006] = {1006, "TiÖm Tèng Thanh Long Nguyªn So¸i"},
		[1007] = {1007, "TiÖm Liªu Thanh Long Nguyªn So¸i "},
	},
	[31224] = {
		[1004] = {1004, "TiÖm Tèng Thanh Long T­íng Qu©n"},
		[1005] = {1005, "TiÖm Liªu Thanh Long T­íng Qu©n"},
		[1006] = {1006, "TiÖm Tèng Thanh Long Nguyªn So¸i"},
		[1007] = {1007, "TiÖm Liªu Thanh Long Nguyªn So¸i "},
	}
}

function OnUse(nItemIndex)
	local nItem = GetItemParticular(nItemIndex)

	local tSay = {
	};
	
	for k, v in pairs(List[nItem]) do
		tinsert(tSay,""..v[2].."/#show_equip_shop("..v[1]..")");
	end
	
	tinsert(tSay, "\nRa Khái/nothing");
	Say(g_szTitle.."Cöa Hµng", getn(tSay), tSay);	
end