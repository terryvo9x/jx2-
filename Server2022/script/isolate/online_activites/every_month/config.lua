--»á¾­³£ÐÞ¸ÄµÄÅäÖÃÏîÐ´ÕâÀï

szMaterialItem  = "mooncake"  --which MaterialItem group of tActivityItems to use
tFinalPrizeSelection = {--×îÖÕ½±ÀøµÄÑ¡Ôñ
		[1] = {"exp2g_shengwang10k_shimen10k", "finish_pet_task", "exp1g_yuntielinshi",},
		[2] = {"exp2g_shengwang10k_shimen10k", "exp1g_zhenqi", "exp1g_dinghunyuntieshenshi",},
		[3] = {"ib_final1",},
}




--never modify below
-------------------------------------------------------------------------
_tActivityItems = { --all history used items define here, recycle used
	["firecracker"] = { --201604½ÚÈÕ±¬Öñ
		{"Ngßi Ph¸o",  {2, 200, 1} },
		{"èng Phãng", {2, 200, 2} },
		{"Thuèc Næ", {2, 200, 3} },
		{"Ph¸o Hoa Huy Hoµng", {2, 200, 4} },
		{"Ph¸o Hoa Rùc Rì", {2, 200, 5} },
		{"Ph¸o Hoa §¹i LÔ", {2, 200, 6} },
	},
	["soups"] = { --201605
		{"C¸c lo¹i ®Ëu",  {2, 200, 7} },
		{"§­êng PhÌn", {2, 200, 8} },
		{"H¹t Sen", {2, 200, 9} },
		{"ChÌ ba mµu", {2, 200, 10} },
		{"ChÌ ThËp CÈm", {2, 200, 11} },
		{"ChÌ Sen", {2, 200, 12} },
	},
	["toys"] = { --201606
		{"DiÒu GiÊy",  {2, 200, 13} },
		{"Con Quay", {2, 200, 14} },
		{"Robot", {2, 200, 15} },
		{"Hép §å Ch¬i Nhá", {2, 200, 16} },
		{"Hép §å Ch¬i Lín", {2, 200, 17} },
		{"Thïng §å Ch¬i", {2, 200, 18} },
	},
	["phoenix_flower"] = { --201607
		{"Bót Mùc",  {2, 200, 19} },
		{"TËp Vë", {2, 200, 20} },
		{"Hoa Phông Hoµng", {2, 200, 21} },
		{"Kû YÕu", {2, 200, 22} },
		{"L­u Bót", {2, 200, 23} },
		{"Sæ Tay Kû NiÖm", {2, 200, 24} },
	},
	["tanabata"] = {--201608
		{"N­íc M¾t Chøc N÷",  {2, 200, 25} },
		{"§ãa Hoa Ng­u Lang", {2, 200, 26} },
		{"CÇu ¤ Th­íc", {2, 200, 27} },
		{"Hép Quµ Ng­u Lang", {2, 200, 28} },
		{"Hép Quµ Chøc N÷", {2, 200, 29} },
		{"Hép Quµ Uyªn ¦¬ng", {2, 200, 30} },
	},
	["mooncake"] = {--201609
		{"Bét m×",  {2, 200, 31} },
		{"Nh©n B¸nh", {2, 200, 32} },
		{"Nh©n B¸nh ThËp CÈm", {2, 200, 33} },
		{"B¸nh trung thu", {2, 200, 34} },
		{"B¸nh ®Æc biÖt", {2, 200, 35} },
		{"B¸nh thËp cÈm", {2, 200, 36} },
	},
}
--tConfig»á¸ú±ðµÄ»î¶¯³åÍ»£¬ËùÒÔ¸±»î¶¯»áÓÃµ½µÄÒ»Ð©ÅäÖÃÏîÐ´ÔÚÍâÃæ
--Èý¸ö²ÄÁÏµÀ¾ß
tMainActivityMaterials ={
	_tActivityItems[szMaterialItem][1],
	_tActivityItems[szMaterialItem][2],
	_tActivityItems[szMaterialItem][3],
}
--Èý¸ö×îÖÕ²úÆ·µÀ¾ß
tMainActivityProducts ={
	_tActivityItems[szMaterialItem][4],
	_tActivityItems[szMaterialItem][5],
	_tActivityItems[szMaterialItem][6],
}
_tActivityItems = nil--Õâ¸ö±íÃ»ÓÃÁË

tConfig = { 
	tMaterials = tMainActivityMaterials,
	tProducts = tMainActivityProducts,
	tFinalPrizeSel = tFinalPrizeSelection,
}
