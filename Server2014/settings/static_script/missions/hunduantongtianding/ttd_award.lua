Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\task_access_code_def.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")
 
_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg}
        --{{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
        { {"Cæ Linh Th¹ch", {2,1,30368,1}, nil,nil,{1, 100} }, 1000},
        { {"Cæ Linh Th¹ch", {2,1,30368,2}, nil,nil,{1, 100} }, 1000},
        { {"Cæ Linh Th¹ch", {2,1,30368,3}, nil,nil,{1, 100} }, 1000},
        { {"Cæ Linh Th¹ch", {2,1,30368,4}, nil,nil,{1, 100} }, 1000},
        { {"Cæ Linh Th¹ch", {2,1,30368,5}, nil,nil,{1, 100} }, 1000},
        { {"Cæ Linh Th¹ch", {2,1,30368,6}, nil,nil,{1, 100} }, 1000},
        { {"Cæ Linh Th¹ch", {2,1,30368,7}, nil,nil,{1, 100} }, 1000},
        { {"Cæ Linh Th¹ch", {2,1,30368,8}, nil,nil,{1, 100} }, 1000},
        { {"Cæ Linh Th¹ch", {2,1,30368,9}, nil,nil,{1, 100} }, 800},
        { {"Cæ Linh Th¹ch", {2,1,30368,10}, nil,nil,{1, 100} }, 500},
        { {"Cæ Linh Th¹ch", {2,1,30368,15}, nil,nil,{1, 100} }, 300},
        { {"Cæ Linh Th¹ch", {2,1,30368,20}, nil,nil,{1, 100} }, 200},
        { {"Cæ Linh Th¹ch", {2,1,30368,30}, nil,nil,{1, 100} }, 100},
        { {"Cæ Linh Th¹ch", {2,1,30368,40}, nil,nil,{1, 100} }, 100},
	},
	--------------------------------------------
	t_other_group = --ÔÓÎï×é
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg}
        --{{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        { {"Ngò Hµnh HuyÒn Th¹ch", {2,1,30302,1}, nil,nil,{1, 100} }, 1500},
        { {"Kh¾c b¶n", {2,1,30373,1}, nil,nil,{1, 100} }, 1500},
        { {"Thiªn M«n Lam D­îc", {1,0,30004,9}, nil,nil,{1, 100} }, 2000},
        { {"Thiªn M«n Hång D­îc", {1,0,30003,9}, nil,nil,{1, 100} }, 1500},
        { {"Vâ l©m b¸o míi", {2,1,30314,1}, nil,nil,{1, 100} }, 400},
        { {"Th¸nh VËt S­ M«n", {2,1,30311,1}, nil,nil,{1, 100} }, 400},
        { {"TiÓu truyÒn c«ng ®¬n", {2,1,30312,1}, nil,nil,{1, 100} }, 400},
        { {"M¶nh Tu Ch©n YÕu QuyÕt", {2,1,30315,1}, nil,nil,{1, 100} }, 400},
        { {"TiÓu B¹ch C©u hoµn", {2,1,30307,1}, nil,nil,{1, 100} }, 400},
        { {"TiÓu Tam Thanh Hoµn", {2,1,30308,1}, nil,nil,{1, 100} }, 400},
        { {"TiÓu Lôc ThÇn Hoµn", {2,1,30309,1}, nil,nil,{1, 100} }, 300},
        { {"TruyÒn C«ng §¬n", {2,1,30313,1}, nil,nil,{1, 100} }, 400},
        { {"Båi Nguyªn §¬n", {2,1,30351,1}, nil,nil,{1, 100} }, 400},
	},
};

_t_free_award_stage =
{
	[1] =
		{
			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 3000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_equip_group = --×°±¸×é
        	{
        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 10000},
        	},
		},
	[2] =
		{
			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_equip_group = --×°±¸×é
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 10000},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        	},
		},
	[3] =
		{
			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_equip_group = --×°±¸×é
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[4] =
		{
			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_equip_group = --×°±¸×é
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[5] =
		{
			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_equip_group = --×°±¸×é
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5000},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[6] =
		{
			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_equip_group = --×°±¸×é
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[7] =
		{
			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_equip_group = --×°±¸×é
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 3500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        		{{MA_GiveHaoYueEquip, {1, nil, nil, 0}}, 2000},
        	},
		},
	[8] =
		{
			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_equip_group = --×°±¸×é
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 2450},
        		--{{MA_GiveLevel3WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 3500},
        		{{MA_GiveHaoYueEquip, {1, nil, nil, 0}}, 4000},
        		{{MA_GiveJiuZhouEquip, {1, nil, nil, 0}}, 50},
        	},
		},
}

_t_fix_award_stage =
{
	[1] =
		{
      {MA_GiveExp, {500000}},
		},
	[2] =
		{
			{MA_GiveExp, {600000}},
		},
	[3] =
		{
			{MA_GiveExp, {700000}},
		},
	[4] =
		{
			{MA_GiveExp, {800000}},
		},
	[5] =
		{
			{MA_GiveExp, {900000}},
		},
	[6] =
		{
			{MA_GiveExp, {1000000}},
		},
	[7] =
		{
			{MA_GiveExp, {1100000}},
		},
	[8] =
		{
			{MA_GiveExp, {1200000}},
		},
}

_t_special_award = --Èç¹ûÓÐ±Ø³öÔÚÕâ¸ö±íÅäÖÃ
{
	nSaveTaskId = 3080,
	nSaveTaskAccessCode = TASK_ACCESS_CODE_GUTIANMENBAOXIANG,
	nSaveTaskWordIdx = 2,
	nSureAwardCount = 600,
	nAddcounterPerUpdate=2, --Ã¿Ö´ÐÐÒ»´ÎUpdate¼ÆÊýÆ÷Ôö¼ÓÖµ
	t_award =
	{
		{{MA_TianMenJinLing, {}}, 10000},
	},
}

_t_ib_award_no_stage =
{
	t_cost = --ÏûºÄ
	{
		--{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}},
		{"Th«ng Thiªn LÖnh",{2,1,30409,2}, _stat_when_ib_consume},	
	},
	t_ib_award =--ib½±Àø
	{
		{{"H¾c Ngäc §o¹n Tôc Cao",{1,0,6,1},nil,nil,{1, 100} },300},
		{{"V¹n VËt Quy Nguyªn §¬n",{1,0,11,1},nil,nil,{1, 100} },300},
		{{"Sinh Sinh Hãa T¸n",{1,0,16,1},nil,nil,{1, 100} },300},
		{{"Tói tiÒn",{2,1,30367,1},nil,nil,{1, 100} },600},
		{{"Cöu chuyÓn håi hån ®¬n",{1,0,32,1},nil,nil,{1, 100} },200},
		{{"C©y B¸t Nh· nhá",{2,0,504,1},30,nil,{1, 100} },100},
		{{"M¶nh Thiªn th¹ch",{2,2,7,1},nil,nil,{1, 100} },300},
		{{"Tói tiÒn",{2,1,30367,2},nil,nil,{1, 100} },500},
		{{"Tu Ch©n YÕu QuyÕt",{2,0,554,1},30,nil,{1, 100} },200},
		{{"Lôc ThÇn hoµn",{2,1,1064,1},30,nil,{1, 100} },300},
		{{"B¹ch C©u Hoµn",{2,1,270,1},30,nil,{1, 100} },250},
		{{"Tam Thanh hoµn",{2,1,1097,1},30,nil,{1, 100} },300},
		{{"M¶nh Thiªn M«n",{2,1,30410,1},nil,nil,{1, 100} },400},
		{{"Tói tiÒn",{2,1,30367,4},nil,nil,{1, 100} },600},
		{{"C­êng Lôc ThÇn hoµn",{2,1,1065,1},30,nil,{1, 100} },200},
		{{"ThÇn N«ng §¬n",{2,1,343,1},30,nil,{1, 100} },100},
		{{"C©y B¸t Nh·",{2,0,398,1},30,nil,{1, 100} },100},
		{{"C­êng Tam Thanh hoµn",{2,1,1098,1},30,nil,{1, 100} },200},
		{{"§¹i B¹ch C©u hoµn",{2,1,1007,1},30,nil,{1, 100} },100},
		{{"M¶nh Thiªn M«n",{2,1,30410,2},nil,nil,{1, 100} },400},
		{{"Tói tiÒn",{2,1,30367,8},nil,nil,{1, 100} },400},
		{{"Lôc ThÇn Tiªn ®¬n",{2,1,1066,1},30,nil,{1, 100} },100},
		{{"Qu©n C«ng Ch­¬ng",{2,1,9999,1},30,nil,{1, 100} },200},
		{{"M¶nh Thiªn M«n",{2,1,30410,3},nil,nil,{1, 100} },400},
		{{"§¹i Nh©n s©m",{2,0,553,1},30,nil,{1, 100} },200},
		{{"B¹ch C©u Tiªn ®¬n",{2,1,1008,1},30,nil,{1, 100} },50},
		{{"Tam Thanh Tiªn ®¬n",{2,1,1099,1},30,nil,{1, 100} },100},
		{{"M¶nh Thiªn M«n",{2,1,30410,4},nil,nil,{1, 100} },400},
		{{"Qu©n C«ng bµi",{2,1,9997,1},30,nil,{1, 100} },100},
		{{"Tói h¹t gièng",{2,1,30087,1},30,nil,{1, 100} },100},
		{{"Tói tiÒn",{2,1,30367,16},nil,nil,{1, 100} },300},
		{{"M¶nh Thiªn M«n",{2,1,30410,5},nil,nil,{1, 100} },200},
		{{"S­ m«n lÖnh kú",{2,1,1017,1},30,nil,{1, 100} },100},
		{{"Tói tiÒn",{2,1,30367,32},nil,nil,{1, 100} },100},
		{{"Tø Linh Quy Nguyªn §¬n",{2,1,30352,1},30,nil,{1, 100} },100},
		{{"M¶nh Thiªn M«n",{2,1,30410,10},nil,nil,{1, 100} },100},
		{{"Hoµng Kim §¹i Hång Bao (trèng)",{2,1,538,1},30,nil,{1, 100} },100},
		{{"Tö Kim Hång Bao (trèng)",{2,1,536,1},30,nil,{1, 100} },100},
		{{"Tói tiÒn",{2,1,30367,40},nil,nil,{1, 100} },100},
		{{"Qu©n C«ng §¹i",{2,1,9998,1},30,nil,{1, 100} },100},
		{{"Thiªn Th¹ch Tinh Th¹ch",{2,1,1009,1},nil,nil,{1, 100} },100},
		{{"B¹ch Kim §¹i Hång Bao (kh«ng)",{2,1,30228,1},30,nil,{1, 100} },100},
		{{"M¶nh Thiªn M«n",{2,1,30410,50},nil,1,{1, 100} },33},
		{{"Qu©n C«ng Huy Hoµng",{2,1,9977,1},30,1,{1, 100} },100},
		{{"Thiªn Th¹ch linh th¹ch",{2,1,1068,1},nil,1,{1, 100} },10},
		{{"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch",{2,1,1067,1},nil,1,{1, 100} },5},
		--{{"´ó¶¨»êÔÉÌúÉñÊ¯",{2,1,1113,1},nil,1,{1, 100} },0},
		{{"Ma §ao Th¹ch cÊp 1",{2,1,30428,1},nil,nil,{1, 100} },350},
		{{"Ma §¹o Th¹ch cÊp 2",{2,1,30429,1},nil,nil,{1, 100} },150},
		{{"Ma §ao Th¹ch cÊp 3",{2,1,30430,1},nil,nil,{1, 100} },50},
		{{MA_SpecialAward, _t_special_award}, 2},
	},
}

ttd_all_award_tb = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu lËt bµi miÔn phÝ Th«ng Thiªn HuyÔn C¶nh",
		--¼¸´ÎÃ»ÓÐµÃµ½×°±¸Ê±±Ø³ö×°±¸
		t_equip_round = {[3] = 1,[5] = 1,},
		n_max_daibi_perday = 30,--Ò»Ìì×î¶à»ñµÃ¶àÉÙ´ú±Ò
		t_stage =
		{
			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
			[3] = inherit(_t_free_award_no_stage, _t_free_award_stage[3]),
			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
			[5] = inherit(_t_free_award_no_stage, _t_free_award_stage[5]),
			[6] = inherit(_t_free_award_no_stage, _t_free_award_stage[6]),
			[7] = inherit(_t_free_award_no_stage, _t_free_award_stage[7]),
			[8] = inherit(_t_free_award_no_stage, _t_free_award_stage[8]),
		},
	},
	---------------------------------------------
	t_fix_award = 
	{
		sz_award_title = "PhÇn th­ëng cè ®Þnh ¶i Th«ng Thiªn HuyÔn C¶nh",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu lËt bµi thu phÝ Th«ng Thiªn HuyÔn C¶nh",
		t_special = _t_special_award,  --±Ø³öÌìî¸½±Àø
		t_stage = 
		{
			[1] = _t_ib_award_no_stage,
			[2] = _t_ib_award_no_stage,
			[3] = _t_ib_award_no_stage,
			[4] = _t_ib_award_no_stage,
			[5] = _t_ib_award_no_stage,
			[6] = _t_ib_award_no_stage,
			[7] = _t_ib_award_no_stage,
			[8] = _t_ib_award_no_stage,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage = nil
_t_special_award = nil

