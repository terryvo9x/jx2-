Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\lib\\globalfunctions.lua")

--»ñµÃnLvµÈ¼¶µÄ³èÎï¼¼ÄÜÊé
function ahf_GetPetBook(nLv)
	if not nLv then return 0; end
	local nLevel = tonumber(nLv)
	if nLevel < 1 or nLevel > 4 then return 0; end
	local T_Pet_Book = {
			{1, 6, format("CÊp %d Ch©n KhÝ Hé ThÓ", nLevel), {2, 150,	1 +nLevel-1, 1}, 0},
			{1, 6, format("CÊp %d Ých Thä Diªn D­¬ng", nLevel), {2, 150,	5 +nLevel-1, 1}, 0},
			{1, 6, format("CÊp %d C­êng Th©n B¸ ThÓ", nLevel), {2, 150,	9 +nLevel-1, 1}, 0},
			{1, 6, format("CÊp %d ¢m Phong Thùc Cèt", nLevel), {2, 150,	13+nLevel-1, 1}, 0},
			{1, 6, format("CÊp %d HuyÒn Vò V« Song", nLevel), {2, 150,	17+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d Ngò Hµnh V« T­íng", nLevel), {2, 150,	21+nLevel-1, 1}, 0},
			{1, 7, format(" CÊp %d Kim Linh Phô ThÓ", nLevel), {2, 150,	25+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d Méc Linh Phô ThÓ", nLevel), {2, 150,	29+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d Thñy Linh Phô ThÓ", nLevel), {2, 150,	33+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d Háa Linh Phô ThÓ", nLevel), {2, 150,	37+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d Thæ Linh Phô ThÓ", nLevel), {2, 150,	41+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d Ph¸ Kh«ng Tr¶m ¶nh", nLevel), {2, 150,	45+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d S¸t Th­¬ng Gia Th©m", nLevel), {2, 150,	49+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d Khinh Linh TÊn TËt", nLevel), {2, 150,	53+nLevel-1, 1}, 0},
			{1, 7, format("CÊp %d V« H×nh Chi Cæ", nLevel), {2, 150,	57+nLevel-1, 1}, 0}, 
	}
	gf_EventGiveRandAward(T_Pet_Book, gf_SumRandBase(T_Pet_Book), 1, "ACTIVITY_HEAD", format("CÊp %d S¸ch Kü N¨ng B¹n §ång Hµnh",nLevel));
end

--¸ø1ÀàËæ»úË®¹û(ÊýÁ¿nNum)
function ahf_GetAFruits(nNum)
	local tAward = {
		{"Nh·n", 2,	1,	30164},
		{"Ch«m Ch«m", 2,	1,	30165},
		{"Cam", 2,	1,	30166},
		{"Dõa", 2,	1,	30167},
		{"M¨ng côt", 2,	1,	30168},
		{"B­ëi", 2,	1,	30169},
		{"D©u", 2,	1,	30170},
		{"Chuèi", 2,	1,	30171},
		{"Xoµi", 2,	1,	30172},
		{"§µo", 2,	1,	30173},
		{"MËn", 2,	1,	30174},
		{"V¶i", 2,	1,	30175},
		{"T¸o", 2,	1,	30176},
		{"B¬", 2,	1,	30177},
		{"§u §ñ", 2,	1,	30178},
		{"M·ng CÇu", 2,	1,	30179},
		{"Khãm", 2,	1,	30180},
		{"Lª", 2,	1,	30181},
		{"Bßn Bon", 2,	1,	30182},
		{"KhÕ", 2,	1,	30183},		
	}
	local nRand = random(getn(tAward));
	if GetFreeItemRoom() > 0 then
		gf_AddItemEx({tAward[nRand][2], tAward[nRand][3], tAward[nRand][4], nNum or 1}, tAward[nRand][1]);
	end
end

--»ñµÃnÀàÃ¿Àà1¸öË®¹û
function ahf_GetNFruits(nNum)
	if not nNum then return 0; end
	for i = 1, nNum do
		ahf_GetAFruits()
	end
end

--70¼¶¸ß¼¶ÃØ¼®
function ahf_Get70GaojiMiji(bIsByRoute, nNum, bIsBand)
	if not nNum or nNum <= 0 then
		return
	end
	bIsBand = bIsBand or 4
	local tBook = {
		[2] =  {0, 107, 166, "Kim Cang B¸t Nh· Kinh"},
		[4] =  {0, 107, 167, "TiÒm Long TÞch DiÖt Kinh"},
		[3] =  {0, 107, 168, "V« TrÇn Bå §Ò Kinh"},
		[6] =  {0, 107, 169, "Thiªn La Liªn Ch©u Lôc"},
		[8] =  {0, 107, 170, "Nh­ ý Kim §Ønh MËt TÞch"},
		[9] =  {0, 107, 171, "BÝch H¶i TuyÖt ¢m Phæ"},
		[11] = {0, 107, 172, "Hçn §én TrÊn Nh¹c MËt TÞch"},
		[12] = {0, 107, 173, "Quü Thiªn Du Long MËt TÞch"},
		[14] = {0, 107, 174, "HuyÔn ¶nh Mª Tung MËt TÞch"},
		[15] = {0, 107, 175, "Qu©n Tö TiÖt Phong MËt TÞch"},
		[17] = {0, 107, 176, "TrÊn Qu©n Phi Long Th­¬ng Phæ"},
		[18] = {0, 107, 177, "Xuyªn V©n L¹c Hång MËt TÞch"},
		[20] = {0, 107, 178, "U Minh Phong Ma Lôc"},
		[21] = {0, 107, 179, "Linh Cæ HuyÔn Tµ Lôc"},
		[23] = {0, 107, 198, "Cöu Thiªn Phong L«i QuyÕt"},
		[29] = {0, 107, 202, "Hång TrÇn Tóy Méng Phæ"},
		[30] = {0, 107, 203, "Phong Hoa Thiªn DiÖp Phæ"},
	}
	local nIndex = 0
	if bIsByRoute and bIsByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0; end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, bIsBand}, tBook[nIndex][4], "ACTIVITY_HEAD", "MËt Tich 70 Cao CÊp", 0, 1);
end

function ahf_GetFyWeapon()
	local VET_FY_WEAPON = {
		{1, 675, "Ph¸ Yªn ®ao", {0, 3, 6001, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Ph¸ Yªn c«n", {0, 5, 6002, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Phï Yªn tr­îng", {0, 8, 6003, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Hµm Yªn thñ", {0, 0, 6004, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Tµng Yªn ch©m", {0, 1, 6005, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Phi Yªn kiÕm", {0, 2, 6006, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "VËn Yªn cÇm", {0, 10, 6007, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "V©n Yªn thñ", {0, 0, 6008, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "L­u Yªn c«n", {0, 5, 6009, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "HuyÒn Yªn kiÕm", {0, 2, 6010, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Vò Yªn bót", {0, 9, 6011, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Hµ Tiªm Th­¬ng", {0, 6, 6012, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Hµnh Yªn Cung", {0, 4, 6013, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 625, "Träc Yªn nhÉn", {0, 7, 6014, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 600, "Yªu Yªn tr¶o", {0, 11, 6015, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FY_WEAPON,10000,1, "ACTIVITY_HEAD")
end

function ahf_GiveShimenCloth9()
	--Faction Cloth 9
	local VET_FACTION_CLOTH_9 = {
		{1, 20, "V« §æng La S¸t TrÊm HuyÕt Y", {0, 100, 2131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« §æng La S¸t TrÊm HuyÕt Y", {0, 100, 2132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« §æng La S¸t TrÊm HuyÕt Y", {0, 100, 2133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« §æng La S¸t TrÊm HuyÕt Y", {0, 100, 2134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn Long B¸t Bé Kh¶i Gi¸p", {0, 100, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn Long B¸t Bé Kh¶i Gi¸p", {0, 100, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« L­îng Ph¸p T«n ThiÒn §Þnh Bµo", {0, 100, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« L­îng Ph¸p T«n ThiÒn §Þnh Bµo", {0, 100, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¸t B¶o La H¸n §¹i Thõa Kh¶i Gi¸p ", {0, 100, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¸t B¶o La H¸n §¹i Thõa Kh¶i Gi¸p ", {0, 100, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu C©n", {0, 100, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu C©n", {0, 100, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu C©n", {0, 100, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu C©n", {0, 100, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¹ch Liªn Tiªn Tö B¶o Èn Y", {0, 100, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¹ch Liªn Tiªn Tö B¶o Èn Y", {0, 100, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ngäc VËn Tiªn Tö HuyÒn Hån Y", {0, 100, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ngäc VËn Tiªn Tö HuyÒn Hån Y", {0, 100, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Y", {0, 100, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Y", {0, 100, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Y", {0, 100, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Y", {0, 100, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du Y", {0, 100, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du Y", {0, 100, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du Y", {0, 100, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du Y", {0, 100, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch­ëng Kinh Thanh Quang Bµo", {0, 100, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch­ëng Kinh Thanh Quang Bµo", {0, 100, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch­ëng Kinh Thanh Quang Bµo", {0, 100, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch­ëng Kinh Thanh Quang Bµo", {0, 100, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Phôc", {0, 100, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Phôc", {0, 100, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Phôc", {0, 100, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Phôc", {0, 100, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T­¬ng Ngao KhÝ ChiÕn kh¶i", {0, 100, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T­¬ng Ngao KhÝ ChiÕn kh¶i", {0, 100, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T­¬ng Ngao KhÝ ChiÕn kh¶i", {0, 100, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T­¬ng Ngao KhÝ ChiÕn kh¶i", {0, 100, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "Hæ Dùc M·nh Sü ChiÕn kh¶i", {0, 100, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "Hæ Dùc M·nh Sü ChiÕn kh¶i", {0, 100, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "Hæ Dùc M·nh Sü ChiÕn kh¶i", {0, 100, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "Hæ Dùc M·nh Sü ChiÕn kh¶i", {0, 100, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Quû S¸t Tu La HuyÕt Y", {0, 100, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Quû S¸t Tu La HuyÕt Y", {0, 100, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Quû S¸t Tu La HuyÕt Y", {0, 100, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Quû S¸t Tu La HuyÕt Y", {0, 100, 2034, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FACTION_CLOTH_9,10000,1, "ACTIVITY_HEAD")
end
function ahf_GiveShimenWeapon9()
	--Faction Weapon 9
	local VET_FACTION_WEAPON_9 = {
		{1, 20, "V« §éng La S¸t TrÈm HuyÕt Tr¶o", {0, 11, 2131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« §éng La S¸t TrÈm HuyÕt Tr¶o", {0, 11, 2132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« §éng La S¸t TrÈm HuyÕt Tr¶o", {0, 11, 2133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« §éng La S¸t TrÈm HuyÕt Tr¶o", {0, 11, 2134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¸t Bé Thiªn Long Thiªn Chóng §ao", {0, 3, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¸t Bé Thiªn Long Thiªn Chóng §ao", {0, 3, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¸t Bé Thiªn Long Thiªn Chóng C«n", {0, 5, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¸t Bé Thiªn Long Thiªn Chóng C«n", {0, 5, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« L­îng Ph¸p T«n ThiÒn Tr­îng", {0, 8, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V« L­îng Ph¸p T«n ThiÒn Tr­îng", {0, 8, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¸t B¶o La H¸n §¹i Thõa Thñ", {0, 0, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¸t B¶o La H¸n §¹i Thõa Thñ", {0, 0, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m", {0, 1, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m", {0, 1, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m", {0, 1, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m", {0, 1, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¹ch Liªn Tiªn Tö B¶o UÈn KiÕm", {0, 2, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B¹ch Liªn Tiªn Tö B¶o UÈn KiÕm", {0, 2, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ngäc VËn Tiªn Tö HuyÒn Hån CÇm", {0, 10, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ngäc VËn Tiªn Tö HuyÒn Hån CÇm", {0, 10, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Thñ", {0, 0, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Thñ", {0, 0, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Thñ", {0, 0, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Thñ", {0, 0, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du C«n", {0, 5, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du C«n", {0, 5, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du C«n", {0, 5, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du C«n", {0, 5, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch­ëng Kinh Thanh Quang KiÕm", {0, 2, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch­ëng Kinh Thanh Quang KiÕm", {0, 2, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch­ëng Kinh Thanh Quang KiÕm", {0, 2, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch­ëng Kinh Thanh Quang KiÕm", {0, 2, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót", {0, 9, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót", {0, 9, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót", {0, 9, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót", {0, 9, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T­¬ng T­íng Qu©n Th­¬ng", {0, 6, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T­¬ng T­íng Qu©n Th­¬ng", {0, 6, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T­¬ng T­íng Qu©n Th­¬ng", {0, 6, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T­¬ng T­íng Qu©n Th­¬ng", {0, 6, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Hæ Dùc T­íng Qu©n Cung", {0, 4, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Hæ Dùc T­íng Qu©n Cung", {0, 4, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Hæ Dùc T­íng Qu©n Cung", {0, 4, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Hæ Dùc T­íng Qu©n Cung", {0, 4, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Quû S¸t Tu La NhÉn", {0, 7, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Quû S¸t Tu La NhÉn", {0, 7, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Quû S¸t Tu La NhÉn", {0, 7, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Quû S¸t Tu La NhÉn", {0, 7, 2034, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FACTION_WEAPON_9,10000,1, "ACTIVITY_HEAD")
end

--¸ß¼¶Õæ¾í
function ahf_GetGaojiZhenjuan(bIsByRoute, nNum, bIsBand)
	if not nNum or nNum <= 0 then
		return
	end
	bIsBand = bIsBand or 4
	local tBook = {
		[2] = {0, 107, 204, "Kim Cang B¸t Nh· Ch©n QuyÓn "},
		[3] = {0, 107, 206, "V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[4] = {0, 107, 205, "TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[6] = {0, 107, 207, "Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0, 107, 208, "Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0, 107, 209, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0, 107, 210, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0, 107, 211, "Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0, 107, 212, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0, 107, 213, "Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0, 107, 214, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0, 107, 215, "Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0, 107, 216, "HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0, 107, 217, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0, 107, 218, "Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[29] = {0, 107, 222, "Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0, 107, 223, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},	
	}
	local nIndex = 0
	if bIsByRoute and bIsByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0; end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, bIsBand}, tBook[nIndex][4], "ACTIVITY_HEAD", "Ch©n khuyÓn cao cÊp cÊp 70", 0, 1);
end

--Ò«ÑîÒÂ
VET_YAOYANG_CLOTH = {
	[2] = {
		[1] = {{0, 100, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo"},
	  [2] = {{0, 100, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo"},
	},
	[3] = {
		[1] = {{0, 100, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo"},
	  [2] = {{0, 100, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo"},
	},
	[4] = {
		[1] = {{0, 100, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo"},
	  [2] = {{0, 100, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo"},
	},
	[6] = {
		[1] = {{0, 100, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"},
		[2] = {{0, 100, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"},
		[3] = {{0, 100, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"},
		[4] = {{0, 100, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"},
	},
	[8] = {
		[3] = {{0, 100, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« Y"},
		[4] = {{0, 100, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« Y"},
	},
	[9] = {
		[3] = {{0, 100, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y"},
		[4] = {{0, 100, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y"},
	},
	[11] = {
		[1] = {{0, 100, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
		[2] = {{0, 100, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
		[3] = {{0, 100, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
		[4] = {{0, 100, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
	},
	[12] = {
		[1] = {{0, 100, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Y"},
		[2] = {{0, 100, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Y"},
		[3] = {{0, 100, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Y"},
		[4] = {{0, 100, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Y"},
	},
	[14] = {
		[1] = {{0, 100, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"},
		[2] = {{0, 100, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"},
		[3] = {{0, 100, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"},
		[4] = {{0, 100, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"},
	},
	[15] = {
		[1] = {{0, 100, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"},
		[2] = {{0, 100, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"},
		[3] = {{0, 100, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"},
		[4] = {{0, 100, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"},
	},
	[17] = {
		[1] = {{0, 100, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"},
		[2] = {{0, 100, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"},
		[3] = {{0, 100, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"},
		[4] = {{0, 100, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"},
	},
	[18] = {
		[1] = {{0, 100, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
		[2] = {{0, 100, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
		[3] = {{0, 100, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
		[4] = {{0, 100, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
	},
	[20] = {
		[1] = {{0, 100, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"},
		[2] = {{0, 100, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"},
		[3] = {{0, 100, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"},
		[4] = {{0, 100, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"},
	},
	[21] = {
		[1] = {{0, 100, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y"},
		[2] = {{0, 100, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y"},
		[3] = {{0, 100, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y"},
		[4] = {{0, 100, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y"},
	},
	[23] = {
		[1] = {{0, 100, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bµo"},
		[2] = {{0, 100, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bµo"},
	},
	[25] = {
		[1] = {{0, 100, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y"},
		[2] = {{0, 100, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y"},
		[3] = {{0, 100, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y"},
		[4] = {{0, 100, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y"},
	},
	[26] = {
		[1] = {{0, 100, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo"},
		[2] = {{0, 100, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo"},
		[3] = {{0, 100, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo"},
		[4] = {{0, 100, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo"},
	},
	[27] = {
		[1] = {{0, 100, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo"},
		[2] = {{0, 100, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo"},
		[3] = {{0, 100, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo"},
		[4] = {{0, 100, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo"},
	},
	[29] = {
		[3] = {{0, 100, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö Y"},
		[4] = {{0, 100, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö Y"},
	},
	[30] = {
		[3] = {{0, 100, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö Y"},
		[4] = {{0, 100, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö Y"},
	},
}

--Ò«ÑîÍ·
VET_YAOYANG_CAP = {
	[2]  = {
		[1] = {{0, 103, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o"},
		[2] = {{0, 103, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o"},
	},
	[3]  = {                                                                            
		[1] = {{0, 103, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o"},         
		[2] = {{0, 103, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o"},
	}, 
	[4]  = {
		[1] = {{0, 103, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o"},
		[2] = {{0, 103, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o"},
	},	
	[6]  = {
		[1] = {{0, 103, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"},
		[2] = {{0, 103, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"},
		[3] = {{0, 103, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"},
		[4] = {{0, 103, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"},
	},
	[8]  = {
		[3] = {{0, 103, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m"},
		[4] = {{0, 103, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m"},
	},
	[9]  = {
		[3] = {{0, 103, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m"},
		[4] = {{0, 103, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m"},
	},
	[11] = {
		[1] = {{0, 103, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"},
		[2] = {{0, 103, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"},
		[3] = {{0, 103, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"},
		[4] = {{0, 103, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"},
	},
	[12] = {
		[1] = {{0, 103, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt C©n"},
		[2] = {{0, 103, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt C©n"},
		[3] = {{0, 103, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt C©n"},
		[4] = {{0, 103, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt C©n"},
	},
	[14] = {
		[1] = {{0, 103, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"},
		[2] = {{0, 103, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"},
		[3] = {{0, 103, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"},
		[4] = {{0, 103, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"},
	},
	[15] = {
		[1] = {{0, 103, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"},
		[2] = {{0, 103, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"},
		[3] = {{0, 103, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"},
		[4] = {{0, 103, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"},
	},
	[17] = {
		[1] = {{0, 103, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"},
		[2] = {{0, 103, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"},
		[3] = {{0, 103, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"},
		[4] = {{0, 103, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"},
	},
	[18] = {
		[1] = {{0, 103, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"},
		[2] = {{0, 103, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"},
		[3] = {{0, 103, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"},
		[4] = {{0, 103, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"},
	},
	[20] = {
		[1] = {{0, 103, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"},
		[2] = {{0, 103, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"},
		[3] = {{0, 103, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"},
		[4] = {{0, 103, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"},
	},
	[21] = {
		[1] = {{0, 103, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n"},
		[2] = {{0, 103, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n"},
		[3] = {{0, 103, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n"},
		[4] = {{0, 103, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n"},
	},
	[23] = {
		[1] = {{0, 103, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n"},
		[2] = {{0, 103, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n"},
	},
	[25] = {
		[1] = {{0, 103, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n"},
		[2] = {{0, 103, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n"},
		[3] = {{0, 103, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n"},
		[4] = {{0, 103, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n"},
	},
	[26] = {
		[1] = {{0, 103, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n"},
		[2] = {{0, 103, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n"},
		[3] = {{0, 103, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n"},
		[4] = {{0, 103, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n"},
	},
	[27] = {
		[1] = {{0, 103, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n"},
		[2] = {{0, 103, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n"},
		[3] = {{0, 103, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n"},
		[4] = {{0, 103, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n"},
	},
	[29] = {
		[3] = {{0, 103, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m"},
		[4] = {{0, 103, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m"},
	},
	[30] = {
		[3] = {{0, 103, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m"},
		[4] = {{0, 103, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m"},
	},
}  

--Ò«Ñî¿ã
VET_YAOYANG_SHOE = {
	[2] = {
	  [1] = {{0, 101, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 101, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 101, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 101, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 101, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 101, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 101, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 101, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 101, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 101, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 101, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 101, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 101, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 101, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 101, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 101, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 101, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 101, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 101, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 101, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 101, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 101, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 101, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 101, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 101, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 101, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 101, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 101, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 101, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 101, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 101, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 101, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 101, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 101, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 101, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 101, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 101, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 101, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 101, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 101, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 101, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 101, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 101, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 101, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 101, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 101, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 101, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 101, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 101, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 101, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 101, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 101, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 101, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 101, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 101, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 101, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 101, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 101, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 101, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 101, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 101, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 101, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 101, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 101, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
}
--Ò«ÑîÎäÆ÷
VET_YAOYANG_WEAPON = {
		[2] = {{0, 3,	8992, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ PhËt §ao"},														
		[3] = {{0, 8,	8994, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ PhËt Tr­îng"},	
		[4] = {{0, 0,	8993, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ PhËt Thñ"},																
		[6] = {{0, 1,	8995, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Tr©m"},																	
		[8] = {{0, 2,	8996, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« Liªn KiÕm"},																	
		[9] = {{0, 10,	8997, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« CÇm"},																	
		[11] = {{0, 0,	8998, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Thñ"},																	
		[12] = {{0, 5,	8999, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt C«n"},																	
		[14] = {{0, 2,	9000, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Tóc KiÕm"},																	
		[15] = {{0, 9,	9001, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bót"},																	
		[17] = {{0, 6,	9002, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Th­¬ng"},																	
		[18] = {{0, 4,	9003, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Cung"},																	
		[20] = {{0, 7,	9004, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn §ao"},																	
		[21] = {{0, 11,	9005, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Tr¶o"},																	
		[23] = {{0, 2,	9006, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn KiÕm"},																	
		[25] = {{0, 3,	9007, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn §ao"},																	
		[26] = {{0, 9,	9008, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Bót"},																	
		[27] = {{0, 11,	9009, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Tr¶o"},																	
		[29] = {{0, 13,	9010, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö PhiÕn"},
		[30] = {{0, 12,	9011, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö ¦u Lan Tiªu"},
}

--Ëæ»ú¸øÒ«Ñî
function ahf_GetYaoYangRand(nIndex)
	local tAward = {
		VET_YAOYANG_CLOTH,
		VET_YAOYANG_CAP,
		VET_YAOYANG_SHOE,
	}
	nIndex = nIndex or random(getn(tAward))
	if nIndex < 1 or nIndex > getn(tAward) then
		print("UDERROR:ahf_GetYaoYangRand nIndex < 1 or nIndex > getn(tAward)")
		return
	end
	local tSubAward = tAward[nIndex];
	if not tSubAward then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tSubAward")
		return 
	end	
	local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30}
	local tSub2Award = tSubAward[tRoute[random(getn(tRoute))]];
	if not tSub2Award then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tSub2Award")
		return 
	end
	local tBody = {}
	for k, _ in tSub2Award do
		tinsert(tBody, k)
	end
	if getn(tBody) <= 0 then
		WriteLog("[exec] ahf_GetYaoYangRand() failed! getn(tBody) <= 0")
		return 
	end
	local tRet = tSub2Award[tBody[random(getn(tBody))]];
	if not tRet or getn(tRet) ~= 2 then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tRet or getn(tRet) ~= 2")
		return 
	end
	gf_AddItemEx2(tRet[1], tRet[2], "ACTIVITY_HEAD", "trang bÞ DiÖu D­¬ng ngÉu nhiªn", 0, 1);
end

--¸øÒ«ÑîÎäÆ÷
function ahf_GetYaoYangWeaponRand(IsByRoute)
	local nIndex = 1
	local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30}
	if IsByRoute and IsByRoute == 1 then
		nIndex = GetPlayerRoute()
	else
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not VET_YAOYANG_WEAPON[nIndex] then
		return
	end
	gf_AddItemEx2(VET_YAOYANG_WEAPON[nIndex][1], VET_YAOYANG_WEAPON[nIndex][2], "ACTIVITY_HEAD", "Vò khÝ DiÖu D­¬ng ngÉu nhiªn", 0, 1)
end

--°´Á÷ÅÉÌåÐÍ¸øÒ«Ñô
function ahf_GetYaoYangByRouteBody(tAward)
	if not tAward then return 0; end
	local nRoute = GetPlayerRoute();
	local tRouteList = tAward[nRoute];
	if not tRouteList then
		Talk(1,"","M«n ph¸i nh©n vËt bÊt th­êng, kh«ng thÓ nhËn th­ëng!")
		return 0;
	end
	local nBody = GetBody();
	local tBodyList = tRouteList[nBody];
	if not tBodyList or getn(tBodyList) < 2 then
		Talk(1,"","H×nh thÓ nh©n vËt bÊt th­ëng, kh«ng thÓ nhËn th­ëng!")
		return 0;
	end
	gf_AddItemEx2(tBodyList[1], tBodyList[2], "ACTIVITY_HEAD", "Theo hÖ ph¸i tÆng trang bÞ DiÖu D­¬ng", 0, 1);
end

--Ëæ»ú3ÐÇ½ðÉß×°±¸
function ahf_GetLevel3JSEquip()
	local tAward = {
		{1, 7, "¸o Choµng Háa V©n", {0, 152, 3, 1}, 0},
		{1, 5, "¸o Choµng Ngò Hµnh Kim ChÕ", {0, 152, 4, 1}, 0},
		{1, 5, "¸o Choµng Ngò Hµnh Méc ChÕ", {0, 152, 5, 1}, 0},
		{1, 5, "¸o Choµng Ngò Hµnh Thñy ChÕ", {0, 152, 6, 1}, 0},
		{1, 5, "¸o Choµng Ngò Hµnh Háa ChÕ", {0, 152, 7, 1}, 0},
		{1, 5, "¸o Choµng Ngò Hµnh Thæ ChÕ", {0, 152, 8, 1}, 0},
		{1, 1, "¸o Choµng Ngò Hµnh ¢m ChÕ", {0, 152, 9, 1}, 0},
		{1, 7, "Huy Ch­¬ng Ngäc ChÕ", {0, 153, 3, 1}, 0},
		{1, 5, "Huy Ch­¬ng Kim ChÕ ngò hµnh", {0, 153, 4, 1}, 0},
		{1, 5, "Huy Ch­¬ng Méc ChÕ ngò hµnh", {0, 153, 5, 1}, 0},
		{1, 5, "Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0, 153, 6, 1}, 0},
		{1, 5, "Huy Ch­¬ng Háa ChÕ ngò hµnh", {0, 153, 7, 1}, 0},
		{1, 5, "Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0, 153, 8, 1}, 0},
		{1, 1, "Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0, 153, 9, 1}, 0},
		{1, 7, "Bè ChÕ Cao §ång Ngoa", {0, 154, 3, 1}, 0},
		{1, 5, "ChiÕn Hµi Kim ChÕ ngò hµnh", {0, 154, 4, 1}, 0},
		{1, 5, "ChiÕn Hµi Méc ChÕ ngò hµnh", {0, 154, 5, 1}, 0},
		{1, 5, "ChiÕn Hµi Thñy ChÕ ngò hµnh", {0, 154, 6, 1}, 0},
		{1, 5, "ChiÕn Hµi Háa ChÕ ngò hµnh", {0, 154, 7, 1}, 0},
		{1, 5, "ChiÕn Hµi Thæ ChÕ ngò hµnh", {0, 154, 8, 1}, 0},
		{1, 1, "ChiÕn Hµi ¢m ChÕ ngò hµnh", {0, 154, 9, 1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ACTIVITY_HEAD", "Trang bÞ Kim Xµ 3 sao")
end

function ahf_GetPet(nLevel)
	local VNG_TASKID = 2539
	local nTaskvalue = floor(mod(GetTask(VNG_TASKID), 10^(2))/(10^(2-1)))
	if nTaskvalue < 1 then
		Msg2Player(1,"","Ch­a hoµn thµnh nhiÖm vô Phôc sinh thó c­ng kh«ng thÓ nhËn phÇn th­ëng");
		return
	end
	local nL = tonumber(nLevel);
	local tPet = {
		[1] = {24, 25, 26},
		[2] = {1, 2, 3},
		[3] = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
		[4] = {16, 17, 18, 19, 12, 21, 22, 23},
	}
	if not tPet[nL] then
		return
	end
	local nIndex = random(getn(tPet[nL]));
	local bRet = AddPet(tPet[nL][nIndex]);
	if bRet and bRet ~= -1 then
		Msg2Player(format("NhËn ®­îc 1 thó c­ng cÊp %d", nL));
	end
end

--Õ½¿ñÒÂ
VET_ZHANKUANG_CLOTH = {
	[2] = {
		[1] = {{0, 100, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn §Þa Bµo"},
	  [2] = {{0, 100, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn §Þa Bµo"},
	},
	[3] = {
		[1] = {{0, 100, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phæ TÕ Bµo"},
	  [2] = {{0, 100, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phæ TÕ Bµo"},
	},
	[4] = {
		[1] = {{0, 100, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn T«n Bµo"},
	  [2] = {{0, 100, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn T«n Bµo"},
	},
	[6] = {
		[1] = {{0, 100, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Y"},
		[2] = {{0, 100, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Y"},
		[3] = {{0, 100, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Y"},
		[4] = {{0, 100, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Y"},
	},
	[8] = {
		[3] = {{0, 100, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Bå T¸t Y"},
		[4] = {{0, 100, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Bå T¸t Y"},
	},
	[9] = {
		[3] = {{0, 100, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång L­u ThñyY"},
		[4] = {{0, 100, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång L­u ThñyY"},
	},
	[11] = {
		[1] = {{0, 100, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du Y"},
		[2] = {{0, 100, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du Y"},
		[3] = {{0, 100, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du Y"},
		[4] = {{0, 100, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du Y"},
	},
	[12] = {
		[1] = {{0, 100, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao Y"},
		[2] = {{0, 100, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao Y"},
		[3] = {{0, 100, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao Y"},
		[4] = {{0, 100, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao Y"},
	},
	[14] = {
		[1] = {{0, 100, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Bµo"},
		[2] = {{0, 100, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Bµo"},
		[3] = {{0, 100, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Bµo"},
		[4] = {{0, 100, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Bµo"},
	},
	[15] = {
		[1] = {{0, 100, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Bµo"},
		[2] = {{0, 100, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Bµo"},
		[3] = {{0, 100, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Bµo"},
		[4] = {{0, 100, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Bµo"},
	},
	[17] = {
		[1] = {{0, 100, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Gi¸p"},
		[2] = {{0, 100, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Gi¸p"},
		[3] = {{0, 100, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Gi¸p"},
		[4] = {{0, 100, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Gi¸p"},
	},
	[18] = {
		[1] = {{0, 100, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Gi¸p"},
		[2] = {{0, 100, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Gi¸p"},
		[3] = {{0, 100, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Gi¸p"},
		[4] = {{0, 100, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Gi¸p"},
	},
	[20] = {
		[1] = {{0, 100, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n Y"},
		[2] = {{0, 100, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n Y"},
		[3] = {{0, 100, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n Y"},
		[4] = {{0, 100, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n Y"},
	},
	[21] = {
		[1] = {{0, 100, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m Y"},
		[2] = {{0, 100, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m Y"},
		[3] = {{0, 100, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m Y"},
		[4] = {{0, 100, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m Y"},
	},
	[23] = {
		[1] = {{0, 100, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phong L«i Bµo"},
		[2] = {{0, 100, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phong L«i Bµo"},
	},
	[25] = {
		[1] = {{0, 100, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa Y"},
		[2] = {{0, 100, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa Y"},
		[3] = {{0, 100, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa Y"},
		[4] = {{0, 100, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa Y"},
	},
	[26] = {
		[1] = {{0, 100, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Bµo"},
		[2] = {{0, 100, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Bµo"},
		[3] = {{0, 100, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Bµo"},
		[4] = {{0, 100, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Bµo"},
	},
	[27] = {
		[1] = {{0, 100, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Bµo"},
		[2] = {{0, 100, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Bµo"},
		[3] = {{0, 100, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Bµo"},
		[4] = {{0, 100, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Bµo"},
	},
	[29] = {
		[3] = {{0, 100, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh N÷  Y"},
		[4] = {{0, 100, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh N÷  Y"},
	},
	[30] = {
		[3] = {{0, 100, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh Linh Y"},
		[4] = {{0, 100, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh Linh Y"},
	},
}

--Õ½¿ñÍ·
VET_ZHANKUANG_CAP = {
	[2]  = {
		[1] = {{0, 103, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn §Þa M¹o"},
		[2] = {{0, 103, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn §Þa M¹o"},
	},
	[3]  = {                                                                            
		[1] = {{0, 103, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phæ TÕ M¹o"},         
		[2] = {{0, 103, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phæ TÕ M¹o"},
	}, 
	[4]  = {
		[1] = {{0, 103, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn T«n M¹o"},
		[2] = {{0, 103, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn T«n M¹o"},
	},	
	[6]  = {
		[1] = {{0, 103, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Qu¸n"},
		[2] = {{0, 103, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Qu¸n"},
		[3] = {{0, 103, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Qu¸n"},
		[4] = {{0, 103, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Qu¸n"},
	},
	[8]  = {
		[3] = {{0, 103, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Bå T¸t Tr©m"},
		[4] = {{0, 103, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Bå T¸t Tr©m"},
	},
	[9]  = {
		[3] = {{0, 103, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång L­u Thñy Tr©m"},
		[4] = {{0, 103, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång L­u Thñy Tr©m"},
	},
	[11] = {
		[1] = {{0, 103, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du C©n"},
		[2] = {{0, 103, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du C©n"},
		[3] = {{0, 103, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du C©n"},
		[4] = {{0, 103, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du C©n"},
	},
	[12] = {
		[1] = {{0, 103, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao C©n"},
		[2] = {{0, 103, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao C©n"},
		[3] = {{0, 103, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao C©n"},
		[4] = {{0, 103, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao C©n"},
	},
	[14] = {
		[1] = {{0, 103, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Qu¸n"},
		[2] = {{0, 103, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Qu¸n"},
		[3] = {{0, 103, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Qu¸n"},
		[4] = {{0, 103, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Qu¸n"},
	},
	[15] = {
		[1] = {{0, 103, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Qu¸n"},
		[2] = {{0, 103, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Qu¸n"},
		[3] = {{0, 103, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Qu¸n"},
		[4] = {{0, 103, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Qu¸n"},
	},
	[17] = {
		[1] = {{0, 103, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Kh«i"},
		[2] = {{0, 103, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Kh«i"},
		[3] = {{0, 103, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Kh«i"},
		[4] = {{0, 103, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Kh«i"},
	},
	[18] = {
		[1] = {{0, 103, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Kh«i"},
		[2] = {{0, 103, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Kh«i"},
		[3] = {{0, 103, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Kh«i"},
		[4] = {{0, 103, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Kh«i"},
	},
	[20] = {
		[1] = {{0, 103, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n C©n"},
		[2] = {{0, 103, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n C©n"},
		[3] = {{0, 103, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n C©n"},
		[4] = {{0, 103, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n C©n"},
	},
	[21] = {
		[1] = {{0, 103, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m C©n"},
		[2] = {{0, 103, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m C©n"},
		[3] = {{0, 103, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m C©n"},
		[4] = {{0, 103, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m C©n"},
	},
	[23] = {
		[1] = {{0, 103, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phong L«i Qu¸n"},
		[2] = {{0, 103, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phong L«i Qu¸n"},
	},
	[25] = {
		[1] = {{0, 103, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa C©n"},
		[2] = {{0, 103, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa C©n"},
		[3] = {{0, 103, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa C©n"},
		[4] = {{0, 103, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa C©n"},
	},
	[26] = {
		[1] = {{0, 103, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Qu¸n"},
		[2] = {{0, 103, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Qu¸n"},
		[3] = {{0, 103, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Qu¸n"},
		[4] = {{0, 103, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Qu¸n"},
	},
	[27] = {
		[1] = {{0, 103, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Qu¸n"},
		[2] = {{0, 103, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Qu¸n"},
		[3] = {{0, 103, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Qu¸n"},
		[4] = {{0, 103, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Qu¸n"},
	},
	[29] = {
		[3] = {{0, 103, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh N÷  Tr©m"},
		[4] = {{0, 103, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh N÷  Tr©m"},
	},
	[30] = {
		[3] = {{0, 103, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh Linh Tr©m"},
		[4] = {{0, 103, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh Linh Tr©m"},
	},
}  

--Õ½¿ñ¿ã
VET_ZHANKUANG_SHOE = {
	[2] = {
	  [1] = {{0, 101, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn §Þa Trang"},
		[2] = {{0, 101, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn §Þa Trang"},
	},
	[3] = {
		[1] = {{0, 101, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phæ TÕ Trang"},
		[2] = {{0, 101, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phæ TÕ Trang"},
	},
	[4] = {
		[1] = {{0, 101, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn T«n Trang"},
		[2] = {{0, 101, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn T«n Trang"},
	},
	[6] = {
		[1] = {{0, 101, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Trang"},
		[2] = {{0, 101, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Trang"},
		[3] = {{0, 101, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Trang"},
		[4] = {{0, 101, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång TuyÖt MÖnh Trang"},
	},
	[8] = {
		[3] = {{0, 101, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Bå T¸t Khè"},
		[4] = {{0, 101, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Bå T¸t Khè"},
	},
	[9] = {
		[3] = {{0, 101, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång L­u ThñyKhè"},
		[4] = {{0, 101, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång L­u ThñyKhè"},
	},
	[11] = {
		[1] = {{0, 101, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du Trang"},
		[2] = {{0, 101, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du Trang"},
		[3] = {{0, 101, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du Trang"},
		[4] = {{0, 101, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång ThÇn Du Trang"},
	},
	[12] = {
		[1] = {{0, 101, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao Trang"},
		[2] = {{0, 101, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao Trang"},
		[3] = {{0, 101, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao Trang"},
		[4] = {{0, 101, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tiªu Dao Trang"},
	},
	[14] = {
		[1] = {{0, 101, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Trang"},
		[2] = {{0, 101, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Trang"},
		[3] = {{0, 101, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Trang"},
		[4] = {{0, 101, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång V« Vi Trang"},
	},
	[15] = {
		[1] = {{0, 101, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Trang"},
		[2] = {{0, 101, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Trang"},
		[3] = {{0, 101, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Trang"},
		[4] = {{0, 101, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cµn Kh«n Trang"},
	},
	[17] = {
		[1] = {{0, 101, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Trang"},
		[2] = {{0, 101, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Trang"},
		[3] = {{0, 101, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Trang"},
		[4] = {{0, 101, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Thiªn Tinh  Trang"},
	},
	[18] = {
		[1] = {{0, 101, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Trang"},
		[2] = {{0, 101, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Trang"},
		[3] = {{0, 101, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Trang"},
		[4] = {{0, 101, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Xuyªn V©n Trang"},
	},
	[20] = {
		[1] = {{0, 101, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n Trang"},
		[2] = {{0, 101, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n Trang"},
		[3] = {{0, 101, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n Trang"},
		[4] = {{0, 101, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Minh T«n Trang"},
	},
	[21] = {
		[1] = {{0, 101, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m Trang"},
		[2] = {{0, 101, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m Trang"},
		[3] = {{0, 101, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m Trang"},
		[4] = {{0, 101, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Cæ T©m Trang"},
	},
	[23] = {
		[1] = {{0, 101, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phong L«i Trang"},
		[2] = {{0, 101, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Phong L«i Trang"},
	},
	[25] = {
		[1] = {{0, 101, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa Trang"},
		[2] = {{0, 101, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa Trang"},
		[3] = {{0, 101, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa Trang"},
		[4] = {{0, 101, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång §¹i §Þa Trang"},
	},
	[26] = {
		[1] = {{0, 101, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Trang"},
		[2] = {{0, 101, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Trang"},
		[3] = {{0, 101, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Trang"},
		[4] = {{0, 101, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Tóy Méng Trang"},
	},
	[27] = {
		[1] = {{0, 101, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Trang"},
		[2] = {{0, 101, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Trang"},
		[3] = {{0, 101, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Trang"},
		[4] = {{0, 101, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Ma Vùc  Trang"},
	},
	[29] = {
		[3] = {{0, 101, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh N÷  Khè"},
		[4] = {{0, 101, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh N÷  Khè"},
	},
	[30] = {
		[3] = {{0, 101, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh Linh Khè"},
		[4] = {{0, 101, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn Cuång Th¸nh Linh Khè"},
	},
}

--Õ½¿ñ¿ã
VET_ZHANKUANG_WEAPON = {
	[2] = {
        [1]={{0,3,30143,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång B¨ng Thiªn §ao",1,2},
        [2]={{0,3,30144,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång B¨ng Thiªn §ao",2,2},
    },
	[3] = {
        [1]={{0,8,30147,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång ThiÒn §Þnh Tr­îng",1,3},
        [2]={{0,8,30148,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång ThiÒn §Þnh Tr­îng",2,3},
    },
	[4] = {
        [1]={{0,0,30145,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Th¸nh ChiÕn Thñ",1,4},
        [2]={{0,0,30146,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Th¸nh ChiÕn Thñ",2,4},
     },
	[6] = {
        [1]={{0,1,30149,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång §o¹t Hån Ch©m",1,6},
        [2]={{0,1,30150,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång §o¹t Hån Ch©m",2,6},
        [3]={{0,1,30151,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång §o¹t Hån Ch©m",3,6},
        [4]={{0,1,30152,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång §o¹t Hån Ch©m",4,6},
    },
	[8] = {
        [3]={{0,2,30153,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång PhËt Quang KiÕm",3,8},
        [4]={{0,2,30154,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång PhËt Quang KiÕm",4,8},
    },
	[9] = {
        [3]={{0,10,30155,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Hé Bang CÇm",3,9},
        [4]={{0,10,30156,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Hé Bang CÇm",4,9},
    },
	[11] = {
        [1]={{0,0,30157,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Trõng ¸c Thñ",1,11},
        [2]={{0,0,30158,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Trõng ¸c Thñ",2,11},
        [3]={{0,0,30159,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Trõng ¸c Thñ",3,11},
        [4]={{0,0,30160,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Trõng ¸c Thñ",4,11},
    },
	[12] = {
        [1]={{0,5,30161,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång V« Cùc C«n",1,12},
        [2]={{0,5,30162,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång V« Cùc C«n",2,12},
        [3]={{0,5,30163,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång V« Cùc C«n",3,12},
        [4]={{0,5,30164,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång V« Cùc C«n",4,12},
    },
	[14] = {
        [1]={{0,2,30165,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Khu Ma KiÕm",1,14},
        [2]={{0,2,30166,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Khu Ma KiÕm",2,14},
        [3]={{0,2,30167,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Khu Ma KiÕm",3,14},
        [4]={{0,2,30168,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Khu Ma KiÕm",4,14},
    },
	[15] = {
        [1]={{0,9,30169,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Th­¬ng Khung Bót",1,15},
        [2]={{0,9,30170,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Th­¬ng Khung Bót",2,15},
        [3]={{0,9,30171,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Th­¬ng Khung Bót",3,15},
        [4]={{0,9,30172,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Th­¬ng Khung Bót",4,15},
    },
	[17] = {
        [1]={{0,6,30173,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång ThÇn KÝch Th­¬ng",1,17},
        [2]={{0,6,30174,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång ThÇn KÝch Th­¬ng",2,17},
        [3]={{0,6,30175,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång ThÇn KÝch Th­¬ng",3,17},
        [4]={{0,6,30176,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång ThÇn KÝch Th­¬ng",4,17},
    },
	[18] = {
        [1]={{0,4,30177,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Xung Thiªn Cung",1,18},
        [2]={{0,4,30178,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Xung Thiªn Cung",2,18},
        [3]={{0,4,30179,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Xung Thiªn Cung",3,18},
        [4]={{0,4,30180,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Xung Thiªn Cung",4,18},
    },
	[20] = {
        [1]={{0,7,30181,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång LuyÖn Ngôc §ao",1,20},
        [2]={{0,7,30182,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång LuyÖn Ngôc §ao",2,20},
        [3]={{0,7,30183,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång LuyÖn Ngôc §ao",3,20},
        [4]={{0,7,30184,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång LuyÖn Ngôc §ao",4,20},
    },
	[21] = {
        [1]={{0,11,30185,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång NhiÕp Hån Tr¶o",1,21},
        [2]={{0,11,30186,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång NhiÕp Hån Tr¶o",2,21},
        [3]={{0,11,30187,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång NhiÕp Hån Tr¶o",3,21},
        [4]={{0,11,30188,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång NhiÕp Hån Tr¶o",4,21},
    },
	[23] = {
        [1]={{0,2,30189,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Thiªn Ph¹t KiÕm",1,23},
        [2]={{0,2,30190,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Thiªn Ph¹t KiÕm",2,23},
    },
	[25] = {
        [1]={{0,3,30191,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Chóc Dung §ao",1,25},
        [2]={{0,3,30192,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Chóc Dung §ao",2,25},
        [3]={{0,3,30193,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Chóc Dung §ao",3,25},
        [4]={{0,3,30194,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Chóc Dung §ao",4,25},
    },
	[26] = {
        [1]={{0,9,30195,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Tö MÖnh Bót",1,26},
        [2]={{0,9,30196,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Tö MÖnh Bót",2,26},
        [3]={{0,9,30197,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Tö MÖnh Bót",3,26},
        [4]={{0,9,30198,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Tö MÖnh Bót",4,26},
    },
	[27] = {
        [1]={{0,11,30199,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Truy Hån Tr¶o",1,27},
        [2]={{0,11,30200,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Truy Hån Tr¶o",2,27},
        [3]={{0,11,30201,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Truy Hån Tr¶o",3,27},
        [4]={{0,11,30202,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Truy Hån Tr¶o",4,27},
    },
	[29] = {
        [3]={{0,13,30203,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Phong Linh PhiÕn",3,29},
        [4]={{0,13,30204,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Phong Linh PhiÕn",4,29},
    },
	[30] = {
        [3]={{0,12,30205,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Kh«ng Minh §Þch",3,30},
        [4]={{0,12,30206,1,4,-1,-1,-1,-1,-1,-1}, "ChiÕn Cuång Kh«ng Minh §Þch",4,30},
    },
}

--°´Á÷ÅÉÌåÐÍ¸ø×°±¸
function ahf_GetEquipByRouteBody(tAward)
	if not tAward then return 0; end
	local nRoute = GetPlayerRoute();
	local tRouteList = tAward[nRoute];
	if not tRouteList then
		Talk(1,"","M«n ph¸i nh©n vËt bÊt th­êng, kh«ng thÓ nhËn th­ëng!")
		return 0;
	end
	local nBody = GetBody();
	local tBodyList = tRouteList[nBody];
	if not tBodyList or getn(tBodyList) < 2 then
		Talk(1,"","H×nh thÓ nh©n vËt bÊt th­ëng, kh«ng thÓ nhËn th­ëng!")
		return 0;
	end
	gf_AddItemEx2(tBodyList[1], tBodyList[2], "ACTIVITY_HEAD", "ACTIVITY_HEAD", 0, 1);
end
