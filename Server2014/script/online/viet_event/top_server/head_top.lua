-- VNG event ®ua top server
-- Created by TuanNA5
-- Modify by PhucBDB 14/12/2011
-- Modify by DoanDVP 10/07/2014

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");

TOP_START_DATE = 20200101
TOP_END_DATE  = 20990601
TOP_TONG_END_DATE = 20990615
TSK_TOP_TRANSLIFE1 = 1
TSK_TOP_HORNOR = 2
TSK_TOP_1MIL_HORNOR = 3
TSK_TOP_TRANSLIFE3 = 3
TOP_CREATED_ROLE = 1324490626
TOP_SERVER_ID = 1
szLOGSERVERNAME = "B¹ch Hæ"

-- Qui ®Þnh gia trÞ ®iÓm danh väng , s­ m«n , qu©n c«ng , top Level nhËn th­ëng theo ®¼ng cÊp
tb_topserver_award_limit = {				
				[76] = {  3000,   4000,   50000,     0},
				[77] = {  3000,   4000,   50000,     1},
				[78] = {  4000,   5000,   55000,     2},
				[79] = {  5000,   5000,   55000,     3},
				[80] = {  6000,   5000,   55000,     4},
				[81] = {  7000,   6000,   55000,     5},
				[82] = {  8000,   7000,   60000,     6},
				[83] = {  9000,   8000,   60000,     7},
--				[84] = {10000,   9000,   70000,   	 8},
--				[85] = {10000, 10000,   80000,    9},				
				[86] = {10000, 10000,   80000,    8},
				[87] = {10000, 10000,   80000,    9},
				[88] = {10000, 10000,   80000,    10},
				[89] = {10000, 10000,   80000,    11},
--				[90] = {10000, 10000,   80000,    14},
				[91] = {11000, 11000,   85000,    12},
				[92] = {11000, 11000,   90000,    13},
				[93] = {11000, 11000,   95000,    14},
				[94] = {12000, 12000,   120000,    15},
--				[98] = {16000, 16000,   160000,    19},
				[99] = {14000, 14000,   140000,    16},
--				[192] = {22000, 22000, 220000, 21},
--				[292] = {25000, 25000, 250000, 22},
--				[396] = {25000, 25000, 250000, 23},
};
-- Danh s¸ch ID Skill 55
tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[22] = 0,
				[23] = 1030,
				[28] = 0,
				[29] = 1176,
				[30] = 1229,
}
-- Danh s¸ch ID Skill trÊn ph¸i
tFactionSkillInfo =
{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	
		[3] = 57,	
		[4] = 44,	
		[5] = 0,	
		[6] = 74,	
		[7] = 0,	
		[8] = 89,	
		[9] = 102,
		[10] = 0,			
		[11] = 113,
		[12] = 124,
		[13] = 0,		
		[14] = 146,
		[15] = 159,
		[16] = 0,		
		[17] = 732,
		[18] = 745,
		[19] = 0,		
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[28] = 0,
		[29] = 1196,
		[30] = 1230,
}

tb_topserver_book45_1 = {
			[2] =  {"Kim Cang Phôc Ma T©m Ph¸p", {0,107,2,1}},
			[3] =  {"V« TrÇn T©m Ph¸p", {0,107,6,1}},
			[4] =  {"TiÒm Long T©m Ph¸p", {0,107,4,1}},
			[14] =  {"HuyÒn ¶nh T©m Ph¸p", {0,107,18,1}},
			[15] =  {"Qu©n Tö T©m Ph¸p", {0,107,20,1}},
			[8] =  {"Nh­ ý T©m Ph¸p", {0,107,10,1}},
			[9] =  {"BÝch H¶i T©m Ph¸p", {0,107,12,1}},
			[11] =  {"Hçn §én T©m Ph¸p", {0,107,14,1}},
			[12] =  {"Quý Thiªn T©m Ph¸p", {0,107,16,1}},
			[6] =  {"Thiªn La T©m Ph¸p", {0,107,8,1}},
			[17] =  {"TrÊn Qu©n T©m Ph¸p", {0,107,22,1}},
			[18] =  {"Xuyªn V©n T©m Ph¸p", {0,107,24,1}},
			[20] = {"U Minh T©m Ph¸p", {0,107,26,1}},
			[21] = {"Linh Cæ T©m Ph¸p", {0,107,28,1}},
			[23] = {"Kinh Phong T©m Ph¸p", {0,107,181,1}},
			[29] = {"Tóy Méng T©m Ph¸p", {0,107,189,1}},
			[30] = {"Phån Hoa T©m Ph¸p", {0,107,194,1}},
}

tb_topserver_book45_2 = {
			[2] =  {"Kim Cang Phôc Ma kinh", {0,107,1,1}}, 
			[3] =  {"V« TrÇn MËt tÞch", {0,107,5,1}}, 
			[4] =  {"TiÒm Long MËt tÞch", {0,107,3,1}}, 
			[14] =  {"HuyÒn ¶nh MËt tÞch", {0,107,17,1}}, 
			[15] =  {"Qu©n Tö MËt tÞch", {0,107,19,1}}, 
			[8] =  {"Nh­ ý MËt TÞch", {0,107,9,1}}, 
			[9] =  {"BÝch H¶i Phæ", {0,107,11,1}}, 
			[11] =  {"Hçn §én MËt tÞch", {0,107,13,1}}, 
			[12] =  {"Quý Thiªn MËt tÞch", {0,107,15,1}}, 
			[6] =  {"Thiªn La MËt TÞch", {0,107,7,1}}, 
			[17] =  {"TrÊn Qu©n MËt tÞch", {0,107,21,1}}, 
			[18] =  {"Xuyªn V©n MËt tÞch", {0,107,23,1}}, 
			[20] = {"U Minh Quû Lôc", {0,107,25,1}}, 
			[21] = {"Linh Cæ MËt tÞch", {0,107,27,1}}, 
			[23] = {"Kinh Phong MËt tÞch", {0,107,180,1}}, 
			[29] = {"Tóy Méng  MËt tÞch", {0,107,188,1}}, 
			[30] = {"Phån Hoa MËt tÞch", {0,107,190,1}}, 
}
tb_topserver_book70_1 ={
			[2] = {"Kim Cang B¸t Nh· Kinh", {0,107,166,1}},
			[3] = {"V« TrÇn Bå §Ò Kinh",{0,107,168,1}},
			[4] = {"TiÒm Long TÞch DiÖt Kinh",{0,107,167,1}},
			[6] = {"Thiªn La Liªn Ch©u Lôc",{0,107,169,1}},
			[8] = {"Nh­ ý Kim §Ønh MËt TÞch",{0,107,170,1}},
			[9] = {"BÝch H¶i TuyÖt ¢m Phæ",{0,107,171,1}},
			[11] = {"Hçn §én TrÊn Nh¹c MËt TÞch"	,{0,107,172,1}},
			[12] = {"Quü Thiªn Du Long MËt TÞch",{0,107,173,1}},
			[14] = {"HuyÔn ¶nh Mª Tung MËt TÞch",{0,107,174,1}},
			[15] = {"Qu©n Tö TiÖt Phong MËt TÞch",{0,107,175,1}},
			[17] = {"TrÊn Qu©n Phi Long Th­¬ng Phæ"	,{0,107,176,1}},
			[18] = {"Xuyªn V©n L¹c Hång MËt TÞch",{0,107,177,1}},
			[20] = {"U Minh Phong Ma Lôc",{0,107,178,1}},
			[21] = {"Linh Cæ HuyÔn Tµ Lôc",{0,107,179,1}},
			[23] = {"Cöu Thiªn Phong L«i QuyÓn",{0,107,198,1}},
			[29] = {"Hång TrÇn Tóy Méng Phæ",{0,107,202,1}},
			[30] = {"Phong Hoa Thiªn DiÖp QuyÓn",{0,107,203,1}},
}

tb_topserver_yue = {
				[2] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[3] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[4] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[6] = {"Tói bÝ kiÕp §­êng M«n", {2, 0, 608, 1, 4}},
				[8] = {"Tói bÝ kiÕp Nga My", {2, 0, 609, 1, 4}},
				[9] = {"Tói bÝ kiÕp Nga My", {2, 0, 609, 1, 4}},
				[11] = {"Tói bÝ kiÕp C¸i Bang", {2, 0, 610, 1, 4}},
				[12] = {"Tói bÝ kiÕp C¸i Bang", {2, 0, 610, 1, 4}},
				[14] = {"Tói bÝ kiÕp Vâ §ang", {2, 0, 611, 1, 4}},
				[15] = {"Tói bÝ kiÕp Vâ §ang", {2, 0, 611, 1, 4}},
				[17] = {"Tói bÝ kiÕp D­¬ng M«n", {2, 0, 612, 1, 4}},
				[18] = {"Tói bÝ kiÕp D­¬ng M«n", {2, 0, 612, 1, 4}},
				[20] = {"Tói bÝ kiÕp Ngò §éc", {2, 0, 613, 1, 4}},
				[21] = {"Tói bÝ kiÕp Ngò §éc", {2, 0, 613, 1, 4}}
};

tb_topserver_jew = {
				[1] = {"Tµng KiÕm Kim Ên", 10, {0, 102, 40,1,1,-1,-1,-1,-1,-1,-1}},
				[2] = {"Tµng KiÕm Kú Th¹ch", 10, {0, 102, 39,1,1,-1,-1,-1,-1,-1,-1}},				
				[3] = {"Tµng KiÕm B¶o Ch©u", 80, {0, 102, 38,1,1,-1,-1,-1,-1,-1,-1}},				
};

tb_topserver_book_high = {
				[2] = {"DÞch C©n Kinh-th­îng", {2, 1, 916, 1}},
				[4] = {"Nh­ Lai ThÇn Ch­ëng-th­îng", {2, 1, 919, 1}},
				[3] = {"TÈy Tñy Kinh-th­îng", {2, 1, 922, 1}},
				[6] = {"HÊp Tinh TrËn-th­îng", {2, 1, 925, 1}},
				[8] = {"V¹n T­íng ThÇn C«ng-th­îng", {2, 1, 928, 1}},
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-th­îng", {2, 1, 931, 1}},
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-th­îng", {2, 1, 934, 1}},
				[12] = {"§¶ CÈu C«n TrËn-th­îng", {2, 1, 937, 1}},
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-th­îng", {2, 1, 940, 1}},
				[15] = {"Th¸i Cùc ThÇn C«ng-th­îng", {2, 1, 943, 1}},
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-th­îng", {2, 1, 946, 1}},
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-th­îng", {2, 1, 949, 1}},
				[20] = {"V« Thiªn Ma C«ng-th­îng", {2, 1, 955, 1}},
				[21] = {"V« ¶nh Ma Cæ-th­îng", {2, 1, 952, 1}},
};

tb_topserver_book_med = {
				[2] = {"DÞch C©n Kinh-trung", {2, 1, 917, 1}},			
				[4] = {"Nh­ Lai ThÇn Ch­ëng-trung", {2, 1, 920, 1}},			
				[3] = {"TÈy Tñy Kinh-trung", {2, 1, 923, 1}},			
				[6] = {"HÊp Tinh TrËn-trung", {2, 1, 926, 1}},			
				[8] = {"V¹n T­íng ThÇn C«ng-trung", {2, 1, 929, 1}},			
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-trung", {2, 1, 932, 1}},			
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-trung", {2, 1, 935, 1}},			
				[12] = {"§¶ CÈu C«n TrËn-trung", {2, 1, 938, 1}},			
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-trung", {2, 1, 941, 1}},			
				[15] = {"Th¸i Cùc ThÇn C«ng-trung", {2, 1, 944, 1}},			
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-trung", {2, 1, 947, 1}},			
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-trung", {2, 1, 950, 1}},			
				[20] = {"V« Thiªn Ma C«ng-trung", {2, 1, 956, 1}}, 
				[21] = {"V« ¶nh Ma Cæ-trung", {2, 1, 953, 1}},
};

tb_topserver_book_low = {
				[2] = {"DÞch C©n Kinh-h¹ ", {2, 1, 918, 1}},		
				[4] = {"Nh­ Lai ThÇn Ch­ëng-h¹ ", {2, 1, 921, 1}},		
				[3] = {"TÈy Tñy Kinh-h¹ ", {2, 1, 924, 1}},		
				[6] = {"HÊp Tinh TrËn-h¹ ", {2, 1, 927, 1}},		
				[8] = {"V¹n T­íng ThÇn C«ng-h¹ ", {2, 1, 930, 1}},		
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-h¹ ", {2, 1, 933, 1}},		
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-h¹ ", {2, 1, 936, 1}},		
				[12] = {"§¶ CÈu C«n TrËn-h¹ ", {2, 1, 939, 1}},		
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-h¹ ", {2, 1, 942, 1}},		
				[15] = {"Th¸i Cùc ThÇn C«ng-h¹ ", {2, 1, 945, 1}},		
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-h¹ ", {2, 1, 948, 1}},		
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-h¹ ", {2, 1, 951, 1}},		
				[20] = {"V« Thiªn Ma C«ng-h¹ ", {2, 1, 957, 1}},
				[21] = {"V« ¶nh Ma Cæ-h¹ ", {2, 1, 954, 1}},
};

tb_golden_book_all = {
				[2] = {"DÞch C©n Kinh", {0, 112, 101, 1}},		
				[4] = {"Nh­ Lai ThÇn Ch­ëng", {0, 112, 102, 1}},		
				[3] = {"TÈy Tñy Kinh", {0, 112, 103, 1}},		
				[6] = {"HÊp Tinh TrËn", {0, 112, 104, 1}},		
				[8] = {"V¹n T­íng ThÇn C«ng", {0, 112, 105, 1}},		
				[9] = {"Thiªn ¢m TrÊn Hån Khóc", {0, 112, 106, 1}},		
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng", {0, 112, 107, 1}},		
				[12] = {"§¶ CÈu C«n TrËn", {0, 112, 108, 1}},		
				[14] = {"V« Th­îng Th¸i Cùc KiÕm", {0, 112, 109, 1}},		
				[15] = {"Th¸i Cùc ThÇn C«ng", {0, 112, 110, 1}},		
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng", {0, 112, 111, 1}},		
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn", {0, 112, 112, 1}},		
				[20] = {"V« Thiªn Ma C«ng", {0, 112, 113, 1}},		
				[21] = {"V« ¶nh Ma Cæ", {0, 112, 114, 1}},
				[23] = {"Phong L«i Ch©u", {0,112,192,1}},
				[29] = {"Phông Minh Phæ", {0,112,196,1}},
				[30] = {"Hoa Tiªn T©m Kinh", {0,112,197,1}},	
}

tbMatTich70caocap  =
{
		[2] =  {"Kim Cang B¸t Nh· Ch©n QuyÓn", {0, 107, 204, 1}}, 
		[3] =  {"V« TrÇn Bå §Ò Ch©n QuyÓn", {0, 107, 206, 1}}, 
		[4] =  {"TiÒm Long Tóc DiÖt Ch©n QuyÓn", {0, 107, 205, 1}}, 
		[14] =  {"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn", {0, 107, 212, 1}}, 
		[15] =  {"Qu©n Tö §íi Phong Ch©n QuyÓn", {0, 107, 213, 1}}, 
		[8] =  {"Nh­ ý Kim §Ønh Ch©n QuyÓn", {0, 107, 208, 1}}, 
		[9] =  {"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn", {0, 107, 209, 1}}, 
		[11] =  {"Hçn §én TrÊn Nh¹c Ch©n QuyÓn", {0, 107, 210, 1}}, 
		[12] =  {"Quú Thiªn Du Long Ch©n QuyÓn", {0, 107, 211, 1}}, 
		[6] =  {"Thiªn La Liªn Ch©u Ch©n QuyÓn", {0, 107, 207, 1}}, 
		[17] =  {"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn", {0, 107, 214, 1}}, 
		[18] =  {"Xuyªn V©n L¹c Hång Ch©n QuyÓn", {0, 107, 215, 1}}, 
		[20] = {"HuyÒn Minh Phong Ma Ch©n QuyÓn", {0, 107, 216, 1}}, 
		[21] = {"Linh Cæ HuyÒn Tµ Ch©n QuyÓn", {0, 107, 217, 1}},
		[23] = {"Cöu Thiªn Phong L«i Ch©n QuyÓn", {0,107,218, 1}},
		[29] = {"Hång TrÇn Tóy Méng Ch©n QuyÓn", {0,107,222, 1}},
		[30] = {"Phong Hoa Thiªn DiÖp Ch©n QuyÓn", {0,107,223, 1}},
}

local tbVukhiVietYen = {
		--[2] = {"ViÖt Yªn Phi Tinh §ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
		--[2] = {"ViÖt Yªn Phi Tinh C«n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		[3] =  {"ViÖt Yªn Phi Tinh Tr­îng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[4] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[14] =  {"ViÖt Yªn Tr¶m NguyÖt KiÕm", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[15] =  {"ViÖt Yªn Tr¶m NguyÖt Bót", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[8] =  {"ViÖt Yªn Phi Tinh KiÕm", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[9] =  {"ViÖt Yªn Phi Tinh CÇm", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[11] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[12] =  {"ViÖt Yªn Tr¶m NguyÖt C«n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[6] =  {"ViÖt Yªn Phi Tinh Ch©m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[17] =  {"ViÖt Yªn Tr¶m NguyÖt Th­¬ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[18] =  {"ViÖt Yªn Tr¶m NguyÖt Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[20] = {"ViÖt Yªn Tr¶m NguyÖt NhÉn", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[21] = {"ViÖt Yªn Tr¶m NguyÖt Tr¶o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
}

-- 1 item, 2 command, 3 table
-- must identify this table below the sub table
tb_topserver_award_item = {				
				[76] = {{3, tb_topserver_book70_1, 0, 0}, {2, "Earn(%d)", 1000000, 0}},
				[77] = {{3, tb_topserver_book70_1, 0, 0}, {2, "Earn(%d)", 2000000, 0}},
				[78] = {{3, tbMatTich70caocap, 0, 0},{3, tbMatTich70caocap, 0, 0},{3, tbMatTich70caocap, 0, 0}, {2, "Earn(%d)", 3000000, 0}},
				[79] = {{1, "Vâ L©m Cao Thñ", {2,1,1040,1,4}, 60*24*60*60}, {2, "Earn(%d)", 4000000, 0}},
				[80] = {{2, "AddItem(2,1,30164+mod(random(0,1000),%d),100)",20, 0}, {2, "Earn(%d)", 10000000, 0}},
				[81] = {{2,"NhanRuongYeuQuyet(%d)", 30*24*60*60,0}, {1, "Méc R­¬ng", {2,1,30340,999,4}, 0}},
				[82] = {{2, "NhanRuongYeuQuyet(%d)", 30*24*60*60,0},{2, "NhanRuongYeuQuyet(%d)", 30*24*60*60,0}, {1, "N÷ Oa Tinh Th¹ch", {2,1,504,2,4}, 30*24*60*60}},
				[83] = {{3, tb_golden_book_all, 0, 0}, {2, "Earn(%d)", 10000000, 0}},
--				[84] = {{3, tb_topserver_book_med, 0, 0}, {1, "Thiªn Th¹ch Linh Th¹ch", {2,1,1068,1,4}, 30*24*60*60}},
--				[85] = {{3, tb_topserver_book_low, 0, 0}, {1, "M¶nh B¹ch Kim", {2,1,30346,1,1}, 0}},
				[86] = {{1, "Qu©n C«ng Ch­¬ng", {2,1,9999,5,1}, 30*24*60*60}, {1, "Tñ ¸o", {2,1,1070,1,4}, 30*24*60*60}},
				[87] = {{1, "Nh©n S©m V¹n N¨m", {2,1,30071,5,1}, 30*24*60*60},{1, "Qu©n C«ng Ch­¬ng", {2,1,9999,5,1}, 0}},
				[88] = {{1, "Qu©n C«ng Ch­¬ng", {2,1,9999,5,1}, 30*24*60*60}, {1, "Qu©n C«ng §¹i", {2,1,9998,1,1}, 30*24*60*60}},
				[89] = {{1, "Qu©n C«ng §¹i", {2,1,9998,5,1}, 30*24*60*60}},
--				[90] = {{1, "N÷ Oa Tinh Th¹ch", {2,1,504,4,4}, 30*24*60*60}},
				[91] = {{1, "Qu©n C«ng Huy Hoµng", {2,1,9977,3,1}, 30*24*60*60}},
				[92] = {{1, "Qu©n C«ng Huy Hoµng", {2,1,9977,6,1}, 30*24*60*60}},
				[93] = {{1, "Thiªn Th¹ch Linh Th¹ch", {2,1,1068,2,4}, 30*24*60*60}},
				[94] = {{1, "Qu©n C«ng Huy Hoµng", {2,1,9977,8,1}, 30*24*60*60}},
--				[98] = {{3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}},
				[99] = {{1, "§¹i §Þnh Hån", {2,1,1113,1}, 30*24*60*60},{1, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2,1,1067,1}, 30*24*60*60}},
--				[192] = {{3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {1, "Th¸i DÞch Hçn Nguyªn C«ng §å", {2,0,1082,100,1}, 0}, {1, "L¨ng Ba Vi Bé", {0,112,78,1,1}, 0}},
--				[292] = {{3, tbMatTich70caocap, 0, 0}, {1, "Th¸i DÞch Hçn Nguyªn C«ng §å", {2,0,1082,100,1}, 0}, {3, tbVukhiVietYen, 0, 0}},
--				[396] = {{1, "§¹i §Þnh Hån", {2,1,1113,1}, 30*24*60*60}, {1, "ChuyÓn Sinh §¬n", {2,1,30345,1,4}, 60*24*60*60}},
};

tbTuVienChien = {
	[2] = {"Tö Viªn ChiÕn",{0,102,8851,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Tö Viªn ChiÕn",{0,102,8853,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Tö Viªn ChiÕn",{0,102,8855,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Tö Viªn ChiÕn",{0,102,8857,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Tö Viªn ChiÕn",{0,102,8859,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Tö Viªn ChiÕn",{0,102,8861,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Tö Viªn ChiÕn",{0,102,8863,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Tö Viªn ChiÕn",{0,102,8865,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Tö Viªn ChiÕn",{0,102,8867,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Tö Viªn ChiÕn",{0,102,8869,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Tö Viªn ChiÕn",{0,102,8871,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Tö Viªn ChiÕn",{0,102,8873,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Tö Viªn ChiÕn",{0,102,8875,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Tö Viªn ChiÕn",{0,102,8877,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbTuVienDau = {
	[2] = {"Tö Viªn §Êu",{0,102,8852,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Tö Viªn §Êu",{0,102,8854,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Tö Viªn §Êu",{0,102,8856,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Tö Viªn §Êu",{0,102,8858,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Tö Viªn §Êu",{0,102,8860,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Tö Viªn §Êu",{0,102,8862,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Tö Viªn §Êu",{0,102,8864,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Tö Viªn §Êu",{0,102,8866,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Tö Viªn §Êu",{0,102,8868,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Tö Viªn §Êu",{0,102,8870,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Tö Viªn §Êu",{0,102,8872,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Tö Viªn §Êu",{0,102,8874,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Tö Viªn §Êu",{0,102,8876,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Tö Viªn §Êu",{0,102,8878,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbTuVienVuKhi = {
	[2] = {{"Tö Quang To¸i Vò §ao",{0,3,8851,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, {"Tö Quang To¸i Vò C«n",{0,5,8852,1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
	[3] = {"Tö Quang Cöu Nh­ Tr­îng",{0,8,8853,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Tö Quang H¹o Nhiªn Thñ",{0,0,8854,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Tö Quang V« H×nh Ch©m",{0,1,8855,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Tö Quang Tö Tinh KiÕm",{0,2,8856,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Tö Quang Phông Hoµng CÇm",{0,10,8857,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Tö Quang Ngò Nh¹c Thñ",{0,0,8858,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Tö Quang Ph¸ Thiªn C«n",{0,5,8859,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Tö Quang Hång Qu©n KiÕm",{0,2,8860,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Tö Quang Sinh Tö Bót",{0,9,8861,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Tö Quang Ph¸ Qu©n Th­¬ng",{0,6,8862,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Tö Quang Khai Thiªn Cung",{0,4,8863,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Tö Quang ¢m D­¬ng NhÉn",{0,7,8864,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Tö Quang U Minh Tr¶o",{0,11,8865,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienChien = {
	[2] = {"Hiªn Viªn ChiÕn",{0,102,8801,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Hiªn Viªn ChiÕn",{0,102,8803,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Hiªn Viªn ChiÕn",{0,102,8805,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Hiªn Viªn ChiÕn",{0,102,8807,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Hiªn Viªn ChiÕn",{0,102,8809,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Hiªn Viªn ChiÕn",{0,102,8811,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Hiªn Viªn ChiÕn",{0,102,8813,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Hiªn Viªn ChiÕn",{0,102,8815,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Hiªn Viªn ChiÕn",{0,102,8817,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Hiªn Viªn ChiÕn",{0,102,8819,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Hiªn Viªn ChiÕn",{0,102,8821,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Hiªn Viªn ChiÕn",{0,102,8823,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Hiªn Viªn ChiÕn",{0,102,8825,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Hiªn Viªn ChiÕn",{0,102,8827,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienDau = {
	[2] = {"Hiªn Viªn §Êu",{0,102,8802,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Hiªn Viªn §Êu",{0,102,8804,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Hiªn Viªn §Êu",{0,102,8806,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Hiªn Viªn §Êu",{0,102,8808,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Hiªn Viªn §Êu",{0,102,8810,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Hiªn Viªn §Êu",{0,102,8812,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Hiªn Viªn §Êu",{0,102,8814,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Hiªn Viªn §Êu",{0,102,8816,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Hiªn Viªn §Êu",{0,102,8818,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Hiªn Viªn §Êu",{0,102,8820,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Hiªn Viªn §Êu",{0,102,8822,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Hiªn Viªn §Êu",{0,102,8824,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Hiªn Viªn §Êu",{0,102,8826,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Hiªn Viªn §Êu",{0,102,8828,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienVuKhi = {
	[2] = {{"Hiªn Viªn To¸i Vò §ao",{0,3,8801,1,1,-1,-1,-1,-1,-1,-1,-1,14}}, {"Hiªn Viªn To¸i Vò C«n",{0,5,8802,1,1,-1,-1,-1,-1,-1,-1,-1,14}}},
	[3] = {"Hiªn Viªn Cöu Nh­ Tr­îng",{0,8,8803,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[4] = {"Hiªn Viªn H¹o Nhiªn Thñ",{0,0,8804,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[6] = {"Hiªn Viªn V« H×nh Ch©m",{0,1,8805,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[8] = {"Hiªn Viªn Tö Tinh KiÕm",{0,2,8806,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[9] = {"Hiªn Viªn Phông Hoµng CÇm",{0,10,8807,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[11] = {"Hiªn Viªn Ngò Nh¹c Thñ",{0,0,8808,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[12] = {"Hiªn Viªn Ph¸ Thiªn C«n",{0,5,8809,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[14] = {"Hiªn Viªn Hång Qu©n KiÕm",{0,2,8810,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[15] = {"Hiªn Viªn Sinh Tö Bót",{0,9,8811,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[17] = {"Hiªn Viªn Ph¸ Qu©n Th­¬ng",{0,6,8812,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[18] = {"Hiªn Viªn Khai Thiªn Cung",{0,4,8813,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[20] = {"Hiªn Viªn ¢m D­¬ng NhÉn",{0,7,8814,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[21] = {"Hiªn Viªn U Minh Tr¶o",{0,11,8815,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
}

tbVuKhiHaoNguyet = {
	[2] = {"H¹o NguyÖt-§é N¹n T«n Gi¶ PhËt §ao",{0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"H¹o NguyÖt-§é KiÕp T«n Gi¶ PhËt Thñ",{0,8,8973,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"H¹o NguyÖt-§é ¸ch T«n Gi¶ PhËt Tr­îng",{0,0,8974,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Ch©m",{0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"H¹o NguyÖt-PhËt V©n Th¸nh C« Liªn KiÕm",{0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"H¹o NguyÖt-PhËt TrÇn Th¸nh C« CÇm",{0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"H¹o NguyÖt-Trôc Phông Thiªn C¸i Thñ",{0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"H¹o NguyÖt-Du Long §Þa KhÊt C«n",{0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"H¹o NguyÖt-V« Cùc Thiªn T«n Tóc KiÕm",{0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"H¹o NguyÖt-BÝch L¹c Thiªn T«n Bót",{0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"H¹o NguyÖt-C¶m Thiªn §Êu Hån Th­¬ng",{0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Cung",{0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"H¹o NguyÖt-Quû Xóc Tµ ThÇn §ao",{0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"H¹o NguyÖt-Vu Cèt §éc V­¬ng Tr¶o",{0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}
-- Qu©n C«ng §¹i	2	1	9998
-- Qu©n C«ng Huy Hoµng	2	1	9977
tbDieuKienUuDai = {
	[1] = {nLevel = 88, tbitem = {2,1,504,1, "N÷ Oa Tinh Th¹ch"}, nBit = 9, name= "Thiªn Chi Tµng KiÕm B¶o Ch©u", nSlot = 7, nWeight = 100},
	[2] = {nLevel = 89, tbitem = {2,1,504,2, "N÷ Oa Tinh Th¹ch"}, nBit = 10, name= "Thiªn Chi Tµng KiÕm Kú Th¹ch", nSlot = 7, nWeight = 100},
	[3] = {nLevel = 90, tbitem = {2,1,504,3, "N÷ Oa Tinh Th¹ch"}, nBit = 11, name= "Thiªn Chi Tµng KiÕm Kim Ên", nSlot  = 7, nWeight  = 100},
	[4] = {nLevel = 91, tbitem = {2,1,504,5, "N÷ Oa Tinh Th¹ch"}, nBit = 12, name= "§«ng Ph­¬ng Long Ch©u", nSlot  = 7, nWeight  = 100},
	[5] = {nLevel = 92, tbitem = {2,1,504,1, "N÷ Oa Tinh Th¹ch"}, nBit = 13, name= "1000 Tr¸i c©y ngÉu nhiªn", nSlot  = 7, nWeight  = 100},
	[6] = {nLevel = 93, tbitem = {2,1,504,1, "N÷ Oa Tinh Th¹ch"}, nBit = 14, name= "1000 Tr¸i c©y ngÉu nhiªn", nSlot  = 7, nWeight  = 100},
	[7] = {nLevel = 94, tbitem = {2,1,504,4, "N÷ Oa Tinh Th¹ch"}, nBit = 15, name= "500 Cæ Linh Th¹ch , 1000 Cæ Linh Ngäc", nSlot  = 7, nWeight  = 100},
	[8] = {nLevel = 96, tbitem = {2,1,504,9, "N÷ Oa Tinh Th¹ch"}, nBit = 16, name= "1200 Cæ Linh Th¹ch , 2000 Cæ Linh Ngäc", nSlot  = 7, nWeight  = 100},
}

tbTrangBiKimXa_NguyenSoai = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,153,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,153,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,153,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng Nguyªn So¸i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,152,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,152,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,152,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng Nguyªn So¸i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,154,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,154,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,154,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng Nguyªn So¸i"}}},
			},
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,153,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,153,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,153,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu Nguyªn So¸i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,152,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,152,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,152,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu Nguyªn So¸i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,154,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,154,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,154,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu Nguyªn So¸i"}}},
			},
	},
}

tbTrangBiKimXa_TuongQuan = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng T­íng Qu©n"}}},
				[2] = {item={{gdp={0,153,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng T­íng Qu©n"}}},
				[3] = {item={{gdp={0,153,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng T­íng Qu©n"}}},
				[4] = {item={{gdp={0,153,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng T­íng Qu©n"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Tèng T­íng Qu©n"}}},
				[2] = {item={{gdp={0,152,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Tèng T­íng Qu©n"}}},
				[3] = {item={{gdp={0,152,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Tèng T­íng Qu©n"}}},
				[4] = {item={{gdp={0,152,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Tèng T­íng Qu©n"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Tèng T­íng Qu©n"}}},
				[2] = {item={{gdp={0,154,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Tèng T­íng Qu©n"}}},
				[3] = {item={{gdp={0,154,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Tèng T­íng Qu©n"}}},
				[4] = {item={{gdp={0,154,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Tèng T­íng Qu©n"}}},
			}
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu T­íng Qu©n"}}},
				[2] = {item={{gdp={0,153,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu T­íng Qu©n"}}},
				[3] = {item={{gdp={0,153,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu T­íng Qu©n"}}},
				[4] = {item={{gdp={0,153,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu T­íng Qu©n"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu T­íng Qu©n"}}},
				[2] = {item={{gdp={0,152,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu T­íng Qu©n"}}},
				[3] = {item={{gdp={0,152,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu T­íng Qu©n"}}},
				[4] = {item={{gdp={0,152,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu T­íng Qu©n"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu T­íng Qu©n"}}},
				[2] = {item={{gdp={0,154,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu T­íng Qu©n"}}},
				[3] = {item={{gdp={0,154,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu T­íng Qu©n"}}},
				[4] = {item={{gdp={0,154,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu T­íng Qu©n"}}},
			}
	},
}

-- Check ®iÒu kiÖn nhËn th­ëng theo Level
function TopCheckLevel()
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nAwardLevel = 0;
	local nLevel = GetLevel() + nChuyenSinh*100;
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nTaskVal = gf_GetTaskByte(TSK_TOP_LEVEL,1)
	for i = 396, 76, -1 do
		if type(tb_topserver_award_limit[i])=="table" and nLevel >= i and nRep >= tb_topserver_award_limit[i][1] and nFaction >= tb_topserver_award_limit[i][2] and nHor >= tb_topserver_award_limit[i][3] and nTaskVal >=  tb_topserver_award_limit[i][4] then
			nAwardLevel = i;
			break;
		end
	end
	return nAwardLevel;
end

-- Check level skill trÊn ph¸i
function TopCheckSkill(tb_Skill_ID, nSkillLevel)
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end;

tb_Faction_Name = {	
	[1] = {"shaolin","ThiÕu L©m"},
	[2] = {"wudang","Vâ §ang"},
	[3] = {"emei","Nga My"},
	[4] = {"gaibang","C¸i Bang"},
	[5] = {"tangmen","§­êng M«n"},
	[6] = {"yangmen","D­¬ng M«n"},
	[7] = {"wudu","Ngò §éc"},
}

tb_Route_Name = {	
	[1] = "",
	[2] = "ThiÕu L©m Tôc Gia",
	[3] = "ThiÕu L©m ThiÒn T«ng",
	[4] = "ThiÕu L©m Vâ T«ng",
	[5] = "",
	[6] = "§­êng M«n",
	[7] = "",
	[8] = "Nga My PhËt Gia",
	[9] = "Nga My Tôc Gia",
	[10] = "",
	[11] = "C¸i Bang TÜnh Y",
	[12] = "C¸i Bang ¤ Y",
	[13] = "",
	[14] = "Vâ §ang §¹o Gia",
	[15] = "Vâ §ang Tôc Gia",
	[16] = "",
	[17] = "D­¬ng M«n Th­¬ng Kþ",
	[18] = "D­¬ng M«n Cung Kþ",
	[19] = "",
	[20] = "Ngò §éc Tµ HiÖp",
	[21] = "Ngò §éc Cæ S­",
	[22] = "",
	[23] = "C«n L«n Thiªn S­",
	[24] = "",
	[25] = "Minh Gi¸o Thµnh ChiÕn",
	[26] = "Minh Gi¸o TrËn Binh",
	[27] = "Minh Gi¸o HuyÕt Nh©n",
	[28] = "",
	[29] = "Thóy Yªn Vò Tiªn",
	[30] = "Thóy Yªn Linh N÷",
	
	
}

tb_Nation_Name = {	
	[1] = "Tèng",
	[2] = "Liªu",
}

-- Check Max Skill 55
function CheckMaxSkill55()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end;
	end;
end;


-- NhËn th­ëng Viªm §Õ
function GiveAwardVD(nLv)
	local VD =
	{
		{0,103,8000,"Viªm §Õ Kh«i"},
		{0,100,8000,"Viªm §Õ Gi¸p"},
		{0,101,8000,"Viªm §Õ Trang"},
	}
	local nBody = GetBody()
	for i = 1 , getn(VD) do
		gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"Nhan Thuong Server moi","nhËn")
	end
end

-- Nh©n th­ëng Nguyªn So¸i theo kiÓu h×nh
function GiveAwardNguyenSoai(nLv)
	local nBody = GetBody()
	if GetTask(701)>0 then
		for i = 1 , getn(tbNguyenSoaiTong) do
			local nItemLevel = nLv
			if tbNguyenSoaiTong[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbNguyenSoaiTong[i][1],tbNguyenSoaiTong[i][2],tbNguyenSoaiTong[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbNguyenSoaiTong[i][4],"Nhan Thuong Server moi","nhËn")
		end
	elseif GetTask(701)<0 then
		for i = 1 , getn(tbNguyenSoaiLieu) do
			local nItemLevel = nLv
			if tbNguyenSoaiLieu[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbNguyenSoaiLieu[i][1],tbNguyenSoaiLieu[i][2],tbNguyenSoaiLieu[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbNguyenSoaiLieu[i][4],"Nhan Thuong Server moi","nhËn")
		end
	end
end

-- Nh©n th­ëng Thiªn Chi T­íng Qu©n  theo kiÓu h×nh
function GiveAwardTCTQ(nLv)
	local tbTCTQTong = {
		{0,100,3015,"Tèng T­íng Qu©n ChiÕn Bµo"},
		{0,101,3015,"Tèng T­íng Qu©n ChiÕn Bµo"},
		{0,103,3015,"Tèng T­íng Qu©n ChiÕn Bµo"},
		{0,102,3031,"Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
		{0,102,3035,"Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
		{0,102,3039,"Thiªn Chi Tèng T­íng Qu©n LÖnh Phï"},
	}
	local tbTCTQLieu = {
		{0,100,3019,"Liªu T­íng Qu©n ChiÕn Bµo"},
		{0,101,3019,"Liªu T­íng Qu©n ChiÕn Bµo"},
		{0,103,3019,"Liªu T­íng Qu©n ChiÕn Bµo"},
		{0,102,3043,"Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
		{0,102,3047,"Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
		{0,102,3051,"Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
	}
	local nBody = GetBody()
	if GetTask(701)>0 then
		for i = 1 , getn(tbTCTQTong) do
			local nItemLevel = nLv
			if tbTCTQTong[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbTCTQTong[i][1],tbTCTQTong[i][2],tbTCTQTong[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbTCTQTong[i][4],"Nhan Thuong Server moi","nhËn")
		end
	elseif GetTask(701)<0 then
		for i = 1 , getn(tbTCTQLieu) do
			local nItemLevel = nLv
			if tbTCTQLieu[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbTCTQLieu[i][1],tbTCTQLieu[i][2],tbTCTQLieu[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbTCTQLieu[i][4],"Nhan Thuong Server moi","nhËn")
		end
	end
end


-- Nh©n th­ëng Thiªn Chi Tµng KiÕm theo kiÓu h×nh
function GiveAwardTCTK(nAwardOrder)
	local tbBodyRatio = {1, 4, 7, 10}
	local tbTCTK = {
		[4] = {0,103,30000,"Thiªn Chi Tµng KiÕm Tö Kim M·o"},
		[5] = {0,100,30000,"Thiªn Chi Tµng KiÕm Kim Lò Th­êng"},
		[6] = {0,101,30000,"Thiªn Chi Tµng KiÕm ¤ Kim Phôc"},
		[7] = {0,102,30000,"Thiªn Chi Tµng KiÕm B¶o Ch©u"},
		[8] = {0,102,30001,"Thiªn Chi Tµng KiÕm Kú Th¹ch"},
		[9] = {0,102,30002,"Thiªn Chi Tµng KiÕm Kim Ên"},
	}
	local nBody = GetBody()
	if tbTCTK[nAwardOrder][2] ~= 102 then
		gf_AddItemEx2({tbTCTK[nAwardOrder][1], tbTCTK[nAwardOrder][2], tbTCTK[nAwardOrder][3]+nBody, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0}, tbTCTK[nAwardOrder][4], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	else
		gf_AddItemEx2({tbTCTK[nAwardOrder][1], tbTCTK[nAwardOrder][2], tbTCTK[nAwardOrder][3]+tbBodyRatio[nBody], 1, 1, -1, -1, -1, -1, -1, -1, -1, 0}, tbTCTK[nAwardOrder][4], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	end
end


function NhanVKTuVienThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2(tbTuVienVuKhi[2][1][2], tbTuVienVuKhi[2][1][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	else
		gf_AddItemEx2(tbTuVienVuKhi[2][2][2], tbTuVienVuKhi[2][2][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	end
end

function NhanVKHienVienThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2(tbHienVienVuKhi[2][1][2], tbHienVienVuKhi[2][1][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	else
		gf_AddItemEx2(tbHienVienVuKhi[2][2][2], tbHienVienVuKhi[2][2][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	end
end

function TraoThienChiViemDe(nItemLevel)
	local tbTCVD_Body1 = {
			item = {
				{gdp = {0,103,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Kh«i"},
				{gdp = {0,100,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Gi¸p"},
				{gdp = {0,101,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbTCVD_Body2 = {
			item = {
				{gdp = {0,103,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Kh«i"},
				{gdp = {0,100,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Gi¸p"},
				{gdp = {0,101,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbTCVD_Body3 = {
			item = {
				{gdp = {0,103,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Kh«i"},
				{gdp = {0,100,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Gi¸p"},
				{gdp = {0,101,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbTCVD_Body4 = {
			item = {
				{gdp = {0,103,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Kh«i"},
				{gdp = {0,100,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Gi¸p"},
				{gdp = {0,101,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbAwardSet = {
		[1] = tbTCVD_Body1,
		[2] = tbTCVD_Body2,
		[3] = tbTCVD_Body3,
		[4] = tbTCVD_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByBody(tbAwardSet)
end


function TraoThienChiTuongQuan(nItemLevel)
	local tbTongTCTQ_Body1 = {
			item = {
				{gdp = {0,103,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3040,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTCTQ_Body2 = {
			item = {
				{gdp = {0,103,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3037,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3041,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbTongTCTQ_Body3 = {
			item = {
				{gdp = {0,103,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3038,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3042,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTCTQ_Body4 = {
			item = {
				{gdp = {0,103,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3039,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3043,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Phï"},
			}}
	
	local tbLieuTCTQ_Body1 = {
			item = {
				{gdp = {0,103,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3044,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3048,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3052,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTCTQ_Body2 = {
			item = {
				{gdp = {0,103,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3045,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3049,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3053,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTCTQ_Body3 = {
			item = {
				{gdp = {0,103,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3046,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3050,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3054,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTCTQ_Body4 = {
			item = {
				{gdp = {0,103,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3047,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3051,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3055,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongTCTQ_Body1,
		[2] = tbTongTCTQ_Body2,
		[3] = tbTongTCTQ_Body3,
		[4] = tbTongTCTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTCTQ_Body1,
		[2] = tbLieuTCTQ_Body2,
		[3] = tbLieuTCTQ_Body3,
		[4] = tbLieuTCTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoBachKimViemDe(nItemLevel)
	local tbBachKimViemDe_Body1 = {
			item = {
				{gdp = {0,103,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Kh«i"},
				{gdp = {0,100,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Gi¸p"},
				{gdp = {0,101,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Trang"},
			}}
	local tbBachKimViemDe_Body2 = {
			item = {
				{gdp = {0,103,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Kh«i"},
				{gdp = {0,100,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Gi¸p"},
				{gdp = {0,101,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Trang"},
			}}
	local tbBachKimViemDe_Body3 = {
			item = {
				{gdp = {0,103,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Kh«i"},
				{gdp = {0,100,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Gi¸p"},
				{gdp = {0,101,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Trang"},
			}}
	local tbBachKimViemDe_Body4 = {
			item = {
				{gdp = {0,103,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Kh«i"},
				{gdp = {0,100,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Gi¸p"},
				{gdp = {0,101,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Trang"},
			}}
	local tbAwardSet = {
		[1] = tbBachKimViemDe_Body1,
		[2] = tbBachKimViemDe_Body2,
		[3] = tbBachKimViemDe_Body3,
		[4] = tbBachKimViemDe_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByBody(tbAwardSet)
end

function TraoNguyenSoai(nItemLevel)
	local tbTongNguyenSoai_Body1 = {
			item = {
				{gdp = {0,103,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2301,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2305,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2501,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Phï"},
				{gdp = {0,102,2505,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Kú"},
			}}
	local tbTongNguyenSoai_Body2 = {
			item = {
				{gdp = {0,103,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2302,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2306,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2502,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Phï"},
				{gdp = {0,102,2506,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Kú"},
			}}
	local tbTongNguyenSoai_Body3 = {
			item = {
				{gdp = {0,103,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2303,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2307,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2503,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Phï"},
				{gdp = {0,102,2507,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Kú"},
			}}
	local tbTongNguyenSoai_Body4 = {
			item = {
				{gdp = {0,103,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2304,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2308,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2504,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Phï"},
				{gdp = {0,102,2508,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Kú"},
			}}		
	
	local tbLieuNguyenSoai_Body1 = {
			item = {
				{gdp = {0,103,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu  Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2311,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2315,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2511,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Phï"},
				{gdp = {0,102,2515,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Kú"},
			}}
	local tbLieuNguyenSoai_Body2 = {
			item = {
				{gdp = {0,103,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu  Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2312,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2316,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2512,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Phï"},
				{gdp = {0,102,2516,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Kú"},
			}}
	local tbLieuNguyenSoai_Body3 = {
			item = {
				{gdp = {0,103,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu  Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2313,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2317,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2513,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Phï"},
				{gdp = {0,102,2517,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Kú"},
			}}
	local tbLieuNguyenSoai_Body4 = {
			item = {
				{gdp = {0,103,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu  Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2314,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2318,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2514,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Phï"},
				{gdp = {0,102,2518,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Kú"},
			}}
					
	local tbTongAwardSet = {
		[1] = tbTongNguyenSoai_Body1,
		[2] = tbTongNguyenSoai_Body2,
		[3] = tbTongNguyenSoai_Body3,
		[4] = tbTongNguyenSoai_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNguyenSoai_Body1,
		[2] = tbLieuNguyenSoai_Body2,
		[3] = tbLieuNguyenSoai_Body3,
		[4] = tbLieuNguyenSoai_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngNguyenSoai(nItemLevel)
	local tbTongTUNS_Body1 = {
			item = {
				{gdp = {0,103,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbTongTUNS_Body2 = {
			item = {
				{gdp = {0,103,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbTongTUNS_Body3 = {
			item = {
				{gdp = {0,103,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbTongTUNS_Body4 = {
			item = {
				{gdp = {0,103,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Kú"},
			}}
			
	local tbLieuTUNS_Body1 = {
			item = {
				{gdp = {0,103,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30112,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbLieuTUNS_Body2 = {
			item = {
				{gdp = {0,103,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30113,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbLieuTUNS_Body3 = {
			item = {
				{gdp = {0,103,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30114,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbLieuTUNS_Body4 = {
			item = {
				{gdp = {0,103,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30115,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongTUNS_Body1,
		[2] = tbTongTUNS_Body2,
		[3] = tbTongTUNS_Body3,
		[4] = tbTongTUNS_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTUNS_Body1,
		[2] = tbLieuTUNS_Body2,
		[3] = tbLieuTUNS_Body3,
		[4] = tbLieuTUNS_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngTuongQuan(nItemLevel)
	local tbTongTUTQ_Body1 = {
			item = {
				{gdp = {0,103,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30052,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30056,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30060,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTUTQ_Body2 = {
			item = {
				{gdp = {0,103,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30053,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30057,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30061,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTUTQ_Body3 = {
			item = {
				{gdp = {0,103,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30054,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30058,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30062,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTUTQ_Body4 = {
			item = {
				{gdp = {0,103,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30055,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30059,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30063,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Phï"},
			}}	
			
	local tbLieuTUTQ_Body1 = {
			item = {
				{gdp = {0,103,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTUTQ_Body2 = {
			item = {
				{gdp = {0,103,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTUTQ_Body3 = {
			item = {
				{gdp = {0,103,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTUTQ_Body4 = {
			item = {
				{gdp = {0,103,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Phï"},
			}}		
	local tbTongAwardSet = {
		[1] = tbTongTUTQ_Body1,
		[2] = tbTongTUTQ_Body2,
		[3] = tbTongTUTQ_Body3,
		[4] = tbTongTUTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTUTQ_Body1,
		[2] = tbLieuTUTQ_Body2,
		[3] = tbLieuTUTQ_Body3,
		[4] = tbLieuTUTQ_Body4,
	}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngDoThong(nGenre)
	local szItemName = "Th­¬ng ¦ng §« Thèng "
	local nID = 30028
	local szPhe = "Tèng "
	if GetTask(701) < 0 then
		nID = 30040
		szPhe = "Liªu "
	end
	if nGenre == 100 then
		szItemName = szPhe .. szItemName .. "Gi¸p"
	elseif nGenre == 101 then
		szItemName = szPhe .. szItemName .. "Trang"
	elseif nGenre == 103 then
		szItemName = szPhe .. szItemName .. "Kh«i"
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,nGenre,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward)
end


function TraoThuongUngTienPhong(nType)
	local szItemName = "Th­¬ng ¦ng Tiªn Phong "
	local nID = 30043
	local szPhe = "Tèng "
	if GetTask(701) < 0 then
		nID = 30079
		szPhe = "Liªu "
	end
	
	if nType == 1 then
		szItemName = szPhe .. szItemName .. "Kú"
	else
		szItemName = szPhe .. szItemName .. "Phï"
		nID = nID + 4
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,102,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward)
end


function TraoNguLongTuongQuan_TrangBi(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan_TrangSuc()
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoMatTich70CaoCap(nQty)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,204, nQty}, name ="Kim Cang B¸t Nh· Ch©n QuyÓn"}}},
		[3] = {item={{gdp={0,107,205, nQty}, name ="TiÒm Long Tóc DiÖt Ch©n QuyÓn"}}},
		[4] = {item={{gdp={0,107,206, nQty}, name ="V« TrÇn Bå §Ò Ch©n QuyÓn"}}},
		[6] = {item={{gdp={0,107,207, nQty}, name ="Thiªn La Liªn Ch©u Ch©n QuyÓn"}}},
		[8] = {item={{gdp={0,107,208, nQty}, name ="Nh­ ý Kim §Ønh Ch©n QuyÓn"}}},
		[9] = {item={{gdp={0,107,209, nQty}, name ="BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"}}},
		[11] = {item={{gdp={0,107,210, nQty}, name ="Hçn §én TrÊn Nh¹c Ch©n QuyÓn"}}},
		[12] = {item={{gdp={0,107,211, nQty}, name ="Quú Thiªn Du Long Ch©n QuyÓn"}}},
		[14] = {item={{gdp={0,107,212, nQty}, name ="HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"}}},
		[15] = {item={{gdp={0,107,213, nQty}, name ="Qu©n Tö §íi Phong Ch©n QuyÓn"}}},
		[17] = {item={{gdp={0,107,214, nQty}, name ="TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"}}},
		[18] = {item={{gdp={0,107,215, nQty}, name ="Xuyªn V©n L¹c Hång Ch©n QuyÓn"}}},
		[20] = {item={{gdp={0,107,216, nQty}, name ="HuyÒn Minh Phong Ma Ch©n QuyÓn"}}},
		[21] = {item={{gdp={0,107,217, nQty}, name ="Linh Cæ HuyÒn Tµ Ch©n QuyÓn"}}},
		[23] = {item={{gdp={0,107,218,nQty}, name ="Cöu Thiªn Phong L«i Ch©n QuyÓn"}}},
		[29] = {item={{gdp={0,107,222,nQty}, name ="Hång TrÇn Tóy Méng Ch©n QuyÓn"}}},
		[30] = {item={{gdp={0,107,223,nQty}, name ="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"}}},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByRoute(tbMatTich)
end


function ThuongVuKhi_ThuyYenLinhNu()
	local nOpLevel1, nOpID1 = IDOption_Random()
	local nOpLevel2, nOpID2 = IDOption_Random()
	if nOpID1 == nOpID2 then
		local tbRate = {[1]={[1] = 6, nRate=80}, [2]={[1] = 7, nRate=20},}
		nOpID2 = 50
		nOpLevel2 = LIB_Award:GetValueByRate(tbRate)
	end

	local tbAward = {item={{gdp={0,12,12,1,1,3,252,nOpLevel1,nOpID1,nOpLevel2,nOpID2,-1, 0}, name = "Minh B¨ng"}}}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward)
end

			
function IDOption_Random()
	local tbOptionIDList = {
		[1] = {[1] = {49, {
						[1] = {[1] = 6, nRate=50}, 
						[2] = {[1] = 7, nRate=50},
				}}, nRate = 10.12},
		
		[2] = {[1] = {268, {
					[1]={[1] = 3, nRate=60}, 
					[2]={[1] = 4, nRate=34},
					[3]={[1] = 5, nRate=5},
					[4]={[1] = 6, nRate=1},
				}}, nRate = 1.62},
		[3] = {[1] = {53, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 6.11},
		[4] = {[1] = {54, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 6.11},
		[5] = {[1] = {63, {
					[1]={[1] = 5, nRate=50}, 
					[2]={[1] = 6, nRate=50},
				}}, nRate = 10.12},
		[6] = {[1] = {390, {
					[1]={[1] = 2, nRate=70}, 
					[2]={[1] = 3, nRate=25},
					[3]={[1] = 4,nRate=5},
				}}, nRate = 1.11},
		[7] = {[1] = {85, {
					[1]={[1] = 4, nRate=60}, 
					[2]={[1] = 5, nRate=30},
					[3]={[1] = 6,nRate=10},
				}}, nRate = 4.11},
		[8] = {[1] = {94, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},	
		[9] = {[1] = {96, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[10] = {[1] = {97, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[11] = {[1] = {95, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[12] = {[1] = {102, {
					[1]={[1] = 6, nRate=80}, 
					[2]={[1] = 7, nRate=20},
				}}, nRate = 8.11},
		[13] = {[1] = {111, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 8.11},
	}
	local tbOptionTemp = LIB_Award:GetValueByRate(tbOptionIDList)
	local nOptionID = tbOptionTemp[1]
	local nOptionLevel = LIB_Award:GetValueByRate(tbOptionTemp[2])
	return nOptionLevel, nOptionID
end


function NhanRuongYeuQuyet(nThoihan)
	local tbRuongYeuQuyet = {
		[2] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m", nExpired = nThoihan}}},
		[4] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m", nExpired = nThoihan}}},
		[3] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m", nExpired = nThoihan}}},
		[6] = {item={{gdp={2,0,608,1}, name="Tói bÝ kiÕp §­êng M«n", nExpired = nThoihan}}},
		[8] = {item={{gdp={2,0,609,1}, name="Tói bÝ kiÕp Nga My", nExpired = nThoihan}}},
		[9] = {item={{gdp={2,0,609,1}, name="Tói bÝ kiÕp Nga My", nExpired = nThoihan}}},
		[11] = {item={{gdp={2,0,610,1}, name="Tói bÝ kiÕp C¸i Bang", nExpired = nThoihan}}},
		[12] = {item={{gdp={2,0,610,1}, name="Tói bÝ kiÕp C¸i Bang", nExpired = nThoihan}}},
		[14] = {item={{gdp={2,0,611,1}, name="Tói bÝ kiÕp Vâ §ang", nExpired = nThoihan}}},
		[15] = {item={{gdp={2,0,611,1}, name="Tói bÝ kiÕp Vâ §ang", nExpired = nThoihan}}},
		[17] = {item={{gdp={2,0,612,1}, name="Tói bÝ kiÕp D­¬ng M«n", nExpired = nThoihan}}},
		[18] = {item={{gdp={2,0,612,1}, name="Tói bÝ kiÕp D­¬ng M«n", nExpired = nThoihan}}},
		[20] = {item={{gdp={2,0,613,1}, name="Tói bÝ kiÕp Ngò §éc", nExpired = nThoihan}}},
		[21] = {item={{gdp={2,0,613,1}, name="Tói bÝ kiÕp Ngò §éc", nExpired = nThoihan}}},
		[23] = {fn="NhanBiKipConLon()"},
		[29] = {fn="NhanBiKipThuyYen()"},
		[30] = {fn="NhanBiKipThuyYen()"},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
--	for i=1,5 do
		LIB_Award:AwardByRoute(tbRuongYeuQuyet)
--	end
end


function NhanBiKipConLon()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0
	end
	local tbBiKipConLon = {
		[1] = {[1] = {item={{gdp={2,6,169,1}, name = "BÝ kiÕp L«i TÕ"}}}, nRate = 7.15},
		[2] = {[1] = {item={{gdp={2,6,170,1}, name = "BÝ kiÕp Phong TÕ"}}}, nRate = 7.15},
		[3] = {[1] = {item={{gdp={2,6,171,1}, name = "BÝ kiÕp Thiªn l«i phï"}}}, nRate = 7.15},
		[4] = {[1] = {item={{gdp={2,6,172,1}, name = "BÝ kiÕp B¨ng Phong QuyÕt"}}}, nRate = 7.15},
		[5] = {[1] = {item={{gdp={2,6,173,1}, name = "BÝ kiÕp Ngù Phong QuyÕt"}}}, nRate = 7.14},
		[6] = {[1] = {item={{gdp={2,6,174,1}, name = "BÝ KiÕp Cuång L«i Phï"}}}, nRate = 7.14},
		[7] = {[1] = {item={{gdp={2,6,175,1}, name = "BÝ KiÕp D­¬ng Sa QuyÕt"}}}, nRate = 7.14},
		[8] = {[1] = {item={{gdp={2,6,176,1}, name = "BÝ KiÕp Oanh L«i Phï"}}}, nRate = 7.14},
		[9] = {[1] = {item={{gdp={2,6,177,1}, name = "BÝ KiÕp Cang phong quyÕt"}}}, nRate = 7.14},
		[10] = {[1] = {item={{gdp={2,6,178,1}, name = "BÝ KiÕp B¹o L«i Phï"}}}, nRate = 7.14},
		[11] = {[1] = {item={{gdp={2,6,179,1}, name = "BÝ KiÕp Tiªu phong t¸n quyÕt"}}}, nRate = 7.14},
		[12] = {[1] = {item={{gdp={2,6,180,1}, name = "BÝ KiÕp Ngò L«i chÝnh ph¸p phï"}}}, nRate = 7.14},
		[13] = {[1] = {item={{gdp={2,6,181,1}, name = "BÝ KiÕp V¹n L«i To¸i Tinh phï"}}}, nRate = 7.14},
		[14] = {[1] = {item={{gdp={2,6,182,1}, name = "BÝ KiÕp HuyÒn Phong triÒn quyÕt"}}}, nRate = 7.14},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipConLon)
	end
end


function NhanBiKipThuyYen()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0
	end
	local tbBiKipThuyYen = {
		[1] = {[1] = {item={{gdp={2,6,219,1}, name = "YÕu quyÕt Khëi Vò"}}}, nRate = 4.55},
		[2] = {[1] = {item={{gdp={2,6,220,1}, name = "YÕu quyÕt Linh Miªu VËn"}}}, nRate = 4.55},
		[3] = {[1] = {item={{gdp={2,6,221,1}, name = "YÕu quyÕt Vò V©n T©m Ph¸p"}}}, nRate = 4.55},
		[4] = {[1] = {item={{gdp={2,6,222,1}, name = "YÕu quyÕt MÞ Hoa"}}}, nRate = 4.55},
		[5] = {[1] = {item={{gdp={2,6,223,1}, name = "YÕu quyÕt §o¹n V©n"}}}, nRate = 4.55},
		[6] = {[1] = {item={{gdp={2,6,224,1}, name = "YÕu quyÕt Thu NguyÖt Vò"}}}, nRate = 4.55},
		[7] = {[1] = {item={{gdp={2,6,225,1}, name = "YÕu quyÕt Thiªn L¹i T©m Kinh"}}}, nRate = 4.54},
		[8] = {[1] = {item={{gdp={2,6,226,1}, name = "YÕu quyÕt §iÖp Uyªn"}}}, nRate = 4.54},
		[9] = {[1] = {item={{gdp={2,6,227,1}, name = "YÕu quyÕt Thiªn Háa DiÖm D­¬ng"}}}, nRate = 4.54},
		[10] = {[1] = {item={{gdp={2,6,228,1}, name = "§¹p V©n X¶o Bé QuyÕt YÕu"}}}, nRate = 4.54},
		[11] = {[1] = {item={{gdp={2,6,229,1}, name = "YÕu quyÕt Méng Xµ"}}}, nRate = 4.54},
		[12] = {[1] = {item={{gdp={2,6,230,1}, name = "YÕu quyÕt L¹c Hoa QuyÕt"}}}, nRate = 4.55},
		[13] = {[1] = {item={{gdp={2,6,231,1}, name = "YÕu quyÕt §µo Hoa Ch­¬ng"}}}, nRate = 4.55},
		[14] = {[1] = {item={{gdp={2,6,232,1}, name = "YÕu quyÕt B¸ch Hoa T©m Kinh"}}}, nRate = 4.55},
		[15] = {[1] = {item={{gdp={2,6,233,1}, name = "YÕu quyÕt Táa T©m QuyÕt"}}}, nRate = 4.55},
		[16] = {[1] = {item={{gdp={2,6,234,1}, name = "YÕu quyÕt Hoµn ThÇn ThuËt"}}}, nRate = 4.55},
		[17] = {[1] = {item={{gdp={2,6,235,1}, name = "YÕu quyÕt Linh §éng QuyÕt"}}}, nRate = 4.55},
		[18] = {[1] = {item={{gdp={2,6,236,1}, name = "YÕu quyÕt Mª X¶o QuyÕt"}}}, nRate = 4.54},
		[19] = {[1] = {item={{gdp={2,6,237,1}, name = "YÕu quyÕt Tiªn L­ H­¬ng"}}}, nRate = 4.54},
		[20] = {[1] = {item={{gdp={2,6,238,1}, name = "YÕu quyÕt B¸ch §iÖp Nghªnh H­¬ng QuyÕt"}}}, nRate = 4.54},
		[21] = {[1] = {item={{gdp={2,6,239,1}, name = "YÕu quyÕt §iÖp LuyÕn Hoa"}}}, nRate = 4.54},
		[22] = {[1] = {item={{gdp={2,6,240,1}, name = "YÕu quyÕt Ngäc Long Xuyªn NguyÖt"}}}, nRate = 4.54},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipThuyYen)
	end
end


function TraoMatTichCaoCap20(nQty, nRoute)
	local tbMatTich = {
		[2] = {0,107,30018, 2,"Kim Cang B¸t Nh· Ch©n QuyÓn"},
		[4] = {0,107,30019, 1,"TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[3] = {0,107,30020, 1,"V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[6] = {0,107,30021, 2,"Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0,107,30022, 1,"Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0,107,30023, 1,"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0,107,30024, 2,"Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0,107,30025, 2,"Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0,107,30026, 1,"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0,107,30027, 2,"Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0,107,30028, 2,"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0,107,30029, 2,"Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0,107,30030, 2,"HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0,107,30031, 1,"Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0,107,30032,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[25] = {0,107,30038, 2,"Håi Phong Tr¶m NhËt Ch©n QuyÓn"},
		[26] = {0,107,30039, 1,"Phô Kú Hµnh TrËn Ch©n QuyÓn"},
		[27] = {0,107,30040,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[29] = {0,107,30033,2,"Ng­ng HuyÕt Phong Hån Ch©n QuyÓn"},
		[30] = {0,107,30034,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5.88},
		[2] = {[1] = 4, nRate = 5.88},
		[3] = {[1] = 3, nRate = 5.88},
		[4] = {[1] = 6, nRate = 5.88},
		[5] = {[1] = 8, nRate = 5.88},
		[6] = {[1] = 9, nRate = 5.88},
		[7] = {[1] = 11, nRate = 5.88},
		[8] = {[1] = 12, nRate = 5.88},
		[9] = {[1] = 14, nRate = 5.88},
		[10] = {[1] = 15, nRate = 5.88},
		[11] = {[1] = 17, nRate = 5.88},
		[12] = {[1] = 18, nRate = 5.88},
		[13] = {[1] = 20, nRate = 5.88},
		[14] = {[1] = 21, nRate = 5.88},
		[15] = {[1] = 23, nRate = 5.88},
		[16] = {[1] = 29, nRate = 5.88},
		[17] = {[1] = 30, nRate = 5.92},
	}
	for i=1, nQty do
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
		local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
		if tbMatTich[nIndex][4] == 1 then
			SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		else
			SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		end
	end
end


function TraoTrangBiKimXaNguyenSoai()
	local nBody = GetBody()
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
end

function TraoTrangBiKimXaTuongQuan()
	local nBody = GetBody()
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][1][nBody])
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][2][nBody])
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][3][nBody])
end


function TraoLoiHoNguyenSoai(nItemLevel)
	local tbTongLHNS_Body1 = {
			item = {
				{gdp = {0,103,30219,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30219,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30219,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30169,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30173,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30177,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30181,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body2 = {
			item = {
				{gdp = {0,103,30220,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30220,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30220,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30170,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30174,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30178,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30182,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body3 = {
			item = {
				{gdp = {0,103,30221,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30221,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30221,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30171,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30175,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30179,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30183,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body4 = {
			item = {
				{gdp = {0,103,30222,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30222,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30222,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30172,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30176,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30180,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30184,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
			
	local tbLieuLHNS_Body1 = {
			item = {
				{gdp = {0,103,30231,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30231,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30231,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30205,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30209,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30213,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30217,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body2 = {
			item = {
				{gdp = {0,103,30232,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30232,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30232,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30206,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30210,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30214,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30218,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body3 = {
			item = {
				{gdp = {0,103,30233,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30233,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30233,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30207,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30211,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30215,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30219,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body4 = {
			item = {
				{gdp = {0,103,30234,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30234,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30234,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30208,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30212,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30216,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30220,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongAwardSet = {
		[1] = tbTongLHNS_Body1,
		[2] = tbTongLHNS_Body2,
		[3] = tbTongLHNS_Body3,
		[4] = tbTongLHNS_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuLHNS_Body1,
		[2] = tbLieuLHNS_Body2,
		[3] = tbLieuLHNS_Body3,
		[4] = tbLieuLHNS_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoLoiHoTuongQuan(nItemLevel)
	local tbTongLHTQ_Body1 = {
			item = {
				{gdp = {0,103,30215,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30215,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30215,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30157,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30161,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30165,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHTQ_Body2 = {
			item = {
				{gdp = {0,103,30216,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30216,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30216,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30158,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30162,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30166,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				
			}}
	local tbTongLHTQ_Body3 = {
			item = {
				{gdp = {0,103,30217,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30217,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30217,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30159,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30163,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30167,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
	local tbTongLHTQ_Body4 = {
			item = {
				{gdp = {0,103,30218,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30218,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30218,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30160,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30164,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30168,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
			
	local tbLieuLHTQ_Body1 = {
			item = {
				{gdp = {0,103,30227,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30227,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30227,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30193,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30197,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30201,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	
			}}
	local tbLieuLHTQ_Body2 = {
			item = {
				{gdp = {0,103,30228,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30228,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30228,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30194,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30198,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30202,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	
			}}
	local tbLieuLHTQ_Body3 = {
			item = {
				{gdp = {0,103,30229,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30229,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30229,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30195,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30199,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30203,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
	local tbLieuLHTQ_Body4 = {
			item = {
				{gdp = {0,103,30230,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30230,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30230,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30196,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30200,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30204,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			
			}}
	local tbTongAwardSet = {
		[1] = tbTongLHTQ_Body1,
		[2] = tbTongLHTQ_Body2,
		[3] = tbTongLHTQ_Body3,
		[4] = tbTongLHTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuLHTQ_Body1,
		[2] = tbLieuLHTQ_Body2,
		[3] = tbLieuLHTQ_Body3,
		[4] = tbLieuLHTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end