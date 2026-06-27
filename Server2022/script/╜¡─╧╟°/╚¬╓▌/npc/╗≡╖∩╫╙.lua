Include("\\script\\equip_shop\\equip_shop_head.lua")

function main()
	local tShop = {
		[1] = {
			"TiÖm Vò KhÝ Háa Phông-S¬ CÊp/#show_equip_shop(3055)",
			"TiÖm Trang BÞ T­íng Qu©n Háa Phông /#show_equip_shop(3056)",
			"TiÖm Háa Phông Nguyªn So¸i/#show_equip_shop(3058)",
			"TiÖm Trang Søc T­íng Qu©n Háa Phông/#show_equip_shop(3060)",
			"TiÖm Trang Søc Háa Phông Nguyªn So¸i/#show_equip_shop(3062)",
			"Ta chØ ghÐ ch¬i/nothing",
		},
		[2] = {
			"TiÖm Vò KhÝ Háa Phông-S¬ CÊp/#show_equip_shop(3055)",
			"TiÖm Trang BÞ T­íng Qu©n Háa Phông /#show_equip_shop(3057)",
			"TiÖm Háa Phông Nguyªn So¸i/#show_equip_shop(3059)",
			"TiÖm Trang Søc T­íng Qu©n Háa Phông/#show_equip_shop(3061)",
			"TiÖm Trang Søc Háa Phông Nguyªn So¸i/#show_equip_shop(3063)",
			"Ta chØ ghÐ ch¬i/nothing",
		},
	}
	local nSex = GetSex();
	Say("<color=green>Háa Phông Tö: <color> Ta cã thÓ gióp ®­îc g× cho ng­¬i kh«ng?",getn(tShop[nSex]),tShop[nSex])
end