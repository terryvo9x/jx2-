Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\mission_award_hard.lua")

Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")

tbNormalAward = 
{
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,2000000,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,2500000,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3000000,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3500000,1},
		},
	},
}

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
	n_equip_group_rate = 0,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
	n_daibi_group_rate = 0,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,1}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,2}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,3}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,4}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,5}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,6}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,7}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,8}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,9}, nil,nil, {1, 100}}, 800},
--        { {"¹ÅÁéÊ¯", {2,1,30368,10}, nil,nil, {1, 100}}, 500},
--        { {"¹ÅÁéÊ¯", {2,1,30368,15}, nil,nil, {1, 100}}, 300},
--        { {"¹ÅÁéÊ¯", {2,1,30368,20}, nil,nil, {1, 100}}, 200},
--        { {"¹ÅÁéÊ¯", {2,1,30368,30}, nil,nil, {1, 100}}, 100},
--        { {"¹ÅÁéÊ¯", {2,1,30368,40}, nil,nil, {1, 100}}, 100},
	},
	--------------------------------------------
	t_other_group = --ÔÓÎï×é
	{
        { {"C©y B¸t Nh· nhá", {2,0,504,1,4}, 7,nil, {1, 100}}, 600},
        { {"C©y B¸t Nh·", {2,0,398,1,4}, 7,nil, {1, 100}}, 600},
        { {"C©y Tø Linh", {2,1,30269,1,4}, 7,nil, {1, 100}}, 600},
        --{ {"´«¹¦µ¤", {2,1,30313,1,4}, 7,nil, {1, 100}}, 600},
        { {"Tu Ch©n YÕu QuyÕt", {2,0,554,1,4}, 7,nil, {1, 100}}, 600},
        { {"Thiªn Lý TruyÒn ¢m Phï ChØ", {2,1,3508,1,4}, nil,nil, {1, 100}}, 300},
        { {"Tø Linh Quy Nguyªn §¬n", {2,1,30352,1,4}, 7,nil, {1, 100}}, 500},
        { {"Båi Nguyªn §¬n", {2,1,30351,1,4}, 7,nil, {1, 100}}, 600},
        { {"B¨ng Tinh Th¹ch", {2,1,30554,1,4}, nil,nil, {1, 100}}, 500},
        { {"B¹ch C©u Hoµn", {2,1,270,1,4}, 7,nil, {1, 100}}, 500},
        { {"TÈy T©m Th¹ch Kho¸ng", {2,1,30536,1}, nil,nil, {1, 100}}, 300},
        { {"LuyÖn L« ThiÕt Kho¸ng", {2,1,30537,1}, nil,nil, {1, 100}}, 300},
        { {"Tói tiÒn", {2,1,30367,1,4}, nil,nil, {1, 100}}, 500},
        { {"ThiÕt Tinh cÊp 1", {2,1,30533,1,4}, nil,nil, {1, 100}}, 500},
        { {"ThiÕt Tinh cÊp 2", {2,1,30534,1,4}, nil,nil, {1, 100}}, 550},
        { {"ThiÕt Tinh cÊp 3", {2,1,30535,1,4}, nil,nil, {1, 100}}, 947},
        { {"Giµy V¶i Th«", {0,154,1,1}, nil,nil, {1, 100}}, 600},
        { {"Tinh TrÝ Bè Hµi", {0,154,2,1}, nil,nil, {1, 100}}, 600},
        { {"Bè ChÕ Cao §ång Ngoa", {0,154,3,1}, nil,nil, {1, 100}}, 600},
        { {"ChiÕn Hµi Kim ChÕ ngò hµnh", {0,154,4,1}, nil,nil, {1, 100}}, 50},
        { {"ChiÕn Hµi Méc ChÕ ngò hµnh", {0,154,5,1}, nil,nil, {1, 100}}, 50},
        { {"ChiÕn Hµi Thñy ChÕ ngò hµnh", {0,154,6,1}, nil,nil, {1, 100}}, 50},
        { {"ChiÕn Hµi Háa ChÕ ngò hµnh", {0,154,7,1}, nil,nil, {1, 100}}, 50},
        { {"ChiÕn Hµi Thæ ChÕ ngò hµnh", {0,154,8,1}, nil,nil, {1, 100}}, 50},
        { {"ChiÕn Hµi ¢m ChÕ ngò hµnh", {0,154,9,1}, nil,nil, {1, 100}}, 50},
        { {"Tr­êng Hµi Du HiÖp", {0,154,26,1}, nil,1, {1, 100}}, 1},
        { {"ChiÕn Hµi ThiÕt HuyÕt", {0,154,27,1}, nil,1, {1, 100}}, 1},
        { {"§¹o Hµi V©n Du", {0,154,28,1}, nil,1, {1, 100}}, 1},
	},
};
_t_free_award_stage =
{
--	[1] =
--		{
--			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
--			n_daibi_group_rate = 3000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
--        	t_equip_group = --×°±¸×é
--        	{
--        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        	},
--		},
--	[2] =
--		{
--			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
--			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
--        	t_equip_group = --×°±¸×é
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 9000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        	},
--		},
--	[3] =
--		{
--			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
--			n_daibi_group_rate = 5000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
--        	t_equip_group = --×°±¸×é
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 3000},
--        	},
--		},
--	[4] =
--		{
--			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
--			n_daibi_group_rate = 5000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
--        	t_equip_group = --×°±¸×é
--        	{
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 2000},
--        		{{MA_GiveLevel2WenShi, {1, nil, nil, 0, {1, 100}}}, 500},
--        		{{MA_GiveTongTianEquip, {1, nil, nil, 0, {1, 300}}}, 1500},
--        	},
--		},
	[4] = {},
}

_t_fix_award_stage =
{
	[1] =
		{
        	{MA_GiveExp, {600000}},
		},
	[2] =
		{
			{MA_GiveExp, {700000}},
		},
	[3] =
		{
			{MA_GiveExp, {800000}},
		},
	[4] =
		{
			{MA_GiveExp, {900000}},
		},
}

_t_ib_award_no_stage =
{
	t_cost = --ÏûºÄ
	{
		--{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}},
		{"Thiªn Kiªu LÖnh",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib½±Àø
	{
        { {"C©y B¸t Nh· nhá", {2,0,504,1}, 7,nil, {1, 100}}, 600},
        { {"C©y B¸t Nh·", {2,0,398,1}, 7,nil, {1, 100}}, 600},
        { {"C©y Tø Linh", {2,1,30269,1}, 7,nil, {1, 100}}, 600},
        { {"B¹ch C©u Hoµn", {2,1,270,1}, 7,nil, {1, 100}}, 600},
        { {"§¹i B¹ch C©u hoµn", {2,1,1007,1}, 7,nil, {1, 100}}, 600},
        { {"B¹ch C©u Tiªn ®¬n", {2,1,1008,1}, 7,nil, {1, 100}}, 600},
        { {"§¹i Nh©n s©m", {2,0,553,1}, 7,nil, {1, 100}}, 500},
        { {"Hu©n ch­¬ng anh hïng", {2,1,30499,1,4}, nil,nil, {1, 100}}, 1506},
        { {"Hu©n ch­¬ng anh hïng", {2,1,30499,2,4}, nil,nil, {1, 100}}, 500},
        { {"Hu©n ch­¬ng anh hïng", {2,1,30499,4,4}, nil,nil, {1, 100}}, 100},
        { {"Hu©n ch­¬ng anh hïng", {2,1,30499,10,4}, nil,nil, {1, 100}}, 123},
        { {"L«i Hæ Tinh Ph¸ch", {2,1,30614,1}, nil,1, {1, 100}}, 300},
        { {"L«i Hæ Tinh Ph¸ch", {2,1,30614,2}, nil,1, {1, 100}}, 200},
        { {"L«i Hæ Tinh Ph¸ch", {2,1,30614,4}, nil,1, {1, 100}}, 50},
        { {"Giµy V¶i Th«", {0,154,1,1}, nil,nil, {1, 100}}, 400},
        { {"Tinh TrÝ Bè Hµi", {0,154,2,1}, nil,nil, {1, 100}}, 400},
        { {"Bè ChÕ Cao §ång Ngoa", {0,154,3,1}, nil,nil, {1, 100}}, 306},
        { {"ChiÕn Hµi Kim ChÕ ngò hµnh", {0,154,4,1}, nil,nil, {1, 100}}, 100},
        { {"ChiÕn Hµi Méc ChÕ ngò hµnh", {0,154,5,1}, nil,nil, {1, 100}}, 100},
        { {"ChiÕn Hµi Thñy ChÕ ngò hµnh", {0,154,6,1}, nil,nil, {1, 100}}, 100},
        { {"ChiÕn Hµi Háa ChÕ ngò hµnh", {0,154,7,1}, nil,nil, {1, 100}}, 100},
        { {"ChiÕn Hµi Thæ ChÕ ngò hµnh", {0,154,8,1}, nil,nil, {1, 100}}, 100},
        { {"ChiÕn Hµi ¢m ChÕ ngò hµnh", {0,154,9,1}, nil,nil, {1, 100}}, 100},
        { {"M¶nh Thiªn M«n", {2,1,30410,2}}, 500},
				{ {"M¶nh Thiªn M«n", {2,1,30410,4}}, 200},
				{ {"M¶nh Thiªn M«n", {2,1,30410,20}}, 50},
				{ {"Thiªn M«n Kim LÖnh", {2,1,30370,1},msg}, 10},
        { {"Tr­êng Hµi Du HiÖp", {0,154,26,1}, nil,1, {1, 100}}, 30},
        { {"ChiÕn Hµi ThiÕt HuyÕt", {0,154,27,1}, nil,1, {1, 100}}, 30},
        { {"§¹o Hµi V©n Du", {0,154,28,1}, nil,1, {1, 100}}, 30},
        { {"Hoµng Kim §¹i Hång Bao (trèng)", {2,1,538,1},nil,{15*24*3600}}, 500},
				{ {"B¹ch Kim §¹i Hång Bao (kh«ng)", {2,1,30228,1},nil,{15*24*3600}}, 65},
	},
}

t_award = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu lËt bµi miÔn phÝ V¹n KiÕm Tròng",
		--¼¸´ÎÃ»ÓÐµÃµ½×°±¸Ê±±Ø³ö×°±¸
		t_equip_round = {},
		n_max_daibi_perday = 30,--Ò»Ìì×î¶à»ñµÃ¶àÉÙ´ú±Ò
		t_stage =
		{
--			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
--			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
--			[3] = inherit(_t_free_award_no_stage, _t_free_award_stage[3]),
			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "PhÇn th­ëng cè ®Þnh ¶i V¹n KiÕm Tròng",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu lËt bµi thu phÝ V¹n KiÕm Tròng",
		t_stage = 
		{
--			[1] = _t_ib_award_no_stage,
--			[2] = _t_ib_award_no_stage,
--			[3] = _t_ib_award_no_stage,
			[4] = _t_ib_award_no_stage,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage = nil
