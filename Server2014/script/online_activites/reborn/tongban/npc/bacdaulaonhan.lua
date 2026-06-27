Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\abluemoon\\item\\moon_furnace.lua")
Include("\\script\\online_activites\\2010_11\\activity_02\\head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua")
Include("\\script\\vng\\taixuatgiangho.lua")
Include("\\script\\missions\\siling_trial\\slt_npc.lua")

szLogTitle = "Ban Dong Hanh"

function main()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Trªn thÕ gian cã v« sè ®iÒu kú bÝ, ta ®· tõng ®i qua rÊt nhiÒu n¬i nªn cã am hiÓu vÒ mét sè kú thuËt, c¸c h¹ cã muèn thä gi¸o kh«ng?"
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	local nDate = tonumber(date("%Y%m%d"))
	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	tinsert(tSay, "ThÝ LuyÖn B¹n §ång Hµnh/main_slt")
	tinsert(tSay, "Phôc Sinh B¹n §ång Hµnh/pet_phucsinh")
	if nIsPS >= 1 then
		tinsert(tSay, "NhËn nu«i thªm B¹n §ång Hµnh (tiªu hao 150 xu vËt phÈm)/#get_more_pet(1)")
		tinsert(tSay, "NhËn nu«i thªm B¹n §ång Hµnh (tiªu hao 490 vµng)/#get_more_pet(2)")
	end
	tinsert(tSay, "Ta muèn thay ®æi h­íng chuyÓn sinh/change_chuyensinh")
	if GetTask(TSK_CS6_TULINH) < 1 then
		tinsert(tSay, "Ta muèn cã bÝ kÝp Phôc Sinh ®Ó ®¹t c¶nh giíi cao h¬n trong §¶ Th«ng Kinh M¹ch/cs6_infor")		
	elseif GetTask(TSK_CS6_TULINH) >= 1 then
		tinsert(tSay, "Ta muèn häc bÝ kÝp Phôc Sinh ®Ó ®¹t c¶nh giíi cao h¬n trong §¶ Th«ng Kinh M¹ch/cs6_npc1_infor2")			
	end
	tinsert(tSay, "Ta muèn ®æi ®iÓm ch©n khÝ (1 ®iÓm ch©n khÝ tiªu hao 2.000.000 ®iÓm kinh nghiÖm)/exchange_chankhi")
	tinsert(tSay, "Ta muèn ®æi 1 ®iÓm ch©n khÝ (tiªu hao 10 vµng)/#exchange_chankhi_bygold(1)")	
	tinsert(tSay, "Ta muèn ®æi 10 ®iÓm ch©n khÝ (tiªu hao 100 vµng)/#exchange_chankhi_bygold(2)")	
	tinsert(tSay, "NhËn hç trî hoµn thµnh nhiÖm vô §¶ Th«ng Kinh M¹ch (tiªu hao 10 Xu vËt phÈm)/get_item_kinhmach")	
	tinsert(tSay, "NhËn vËt phÈm hç trî lµm nhiÖm vô Tø Linh DiÖt Ph¸p TrËn (tiªu hao 10 Xu vËt phÈm)/get_item_tulinh")	
	tinsert(tSay, "Ta cã Ýt ®Æc s¶n, nhê tiÒn bèi gióp luyÖn ch©n khÝ/GetQiByFruit")
	tinsert(tSay, "Ta cã Ýt cña c¶i, nhê tiÒn bèi gióp luyÖn ch©n khÝ/GetQiByGold")
	tinsert(tSay, "Sö dông ChuyÓn Sinh §¬n/use_chuyensinhdon")	
	tinsert(tSay, "Ta muèn luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt (B¹n §ång Hµnh)/learn_subskill_1")
	tinsert(tSay, "Ta muèn luyÖn B¾c §Èu Gi¶ Kim ThuËt/learn_subskill_2")
	tinsert(tSay, "Ta muèn luyÖn B¾c §Èu Phôc Nguyªn ThuËt/learn_subskill_3")
	tinsert(tSay, "Ta muèn luyÖn B¾c §Èu TruyÒn C«ng ThuËt/transfer_neili")
	tinsert(tSay, "Ta muèn luyÖn B¾c §Èu D­ìng Sinh ThuËt/pratice_neili")
	tinsert(tSay, "T¹m thêi ta ch­a muèn luyÖn/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function pet_phucsinh()
	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	if nIsPS >= 1 then
		Talk(1,"", "B¹n §ång Hµnh cña ®¹i hiÖp ®· thùc hiÖn Phôc Sinh råi !!!!")
		return 0
	end
	local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."B¹n ®ång hµnh sau khi ®­îc Phôc Sinh rÊt m¹nh mÏ, c¸c h¹ cã muèn thùc hiÖn Phôc Sinh cho B¹n ®ång hµnh kh«ng?"

	if nGetQuest == 0 then
		tinsert(tSay, "NhËn nhiÖm vô Phôc Sinh cho B¹n §ång Hµnh/get_quest_PhucSinh_BDH")
	end
	if nGetQuest == 1 then
		tHeader = szNpcName.." <color=red>Hoµn thµnh Giai §o¹n 1 cÇn : <color>kÝch ho¹t 160 c©y tø linh, 160 b¸t nh· nhá, 30 lÇn Cóng TÕ, 30 lÇn TrÞ An, 30 lÇn Thñy Lîi, 30 lÇn LuyÖn §¬n"
		tinsert(tSay, "Hoµn thµnh giai ®o¹n 1 Phôc Sinh cho B¹n §ång Hµnh/finish_quest1_PhucSinh_BDH")
		tinsert(tSay, "Xem sè l­îng nhiÖm vô ®· hoµn thµnh/show_quest1_PhucSinh_BDH")
		tinsert(tSay, "Hç trî hoµn thµnh nhanh 2 giai ®o¹n nhiÖm vô Phôc Sinh/support_finish_quest_PhucSinh_BDH")
	end
	if nGetQuest == 2 then
		tHeader = szNpcName.." <color=red>Hoµn thµnh Giai §o¹n 2 cÇn : <color>B§H cÊp 4 (999 ®iÓm linh lùc), 500 thiªn th¹ch, 500 m¶nh thiªn th¹ch, 20 thiªn th¹ch tinh th¹ch, 20 b¨ng th¹ch, 2 hoµng kim ®¹i ng©n phiÕu, 2 hßa thÞ bÝch"
		tinsert(tSay, "Hoµn thµnh giai ®o¹n 2 Phôc Sinh cho B¹n §ång Hµnh/finish_quest2_PhucSinh_BDH")
		tinsert(tSay, "Hç trî hoµn thµnh nhanh 2 giai ®o¹n nhiÖm vô Phôc Sinh/support_finish_quest_PhucSinh_BDH")
	end	
	
	
	tinsert(tSay, "Ta chØ ghÐ qua th«i/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function change_chuyensinh()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."T¹i h¹ cã thÓ gióp ®¹i hiÖp thay ®æi h­íng chuyÓn sinh hiÖn t¹i thµnh h­íng chuyÓn sinh kh¸c."
	local nDate = tonumber(date("%Y%m%d"))
	
	tinsert(tSay, "Thay ®æi h­íng ChuyÓn Sinh (¸p dông cho chuyÓn sinh tõ 1 ®Õn 5)/#way_change_chuyensinh(1)")
	tinsert(tSay, "Thay ®æi h­íng Phôc Sinh (¸p dông cho Tø Linh Phôc Sinh)/#way_change_chuyensinh(2)")
	if nDate >= 20130521 and nDate <= 20130607 then
		tinsert(tSay, "MiÔn phÝ 1 lÇn chuyÓn sinh theo h­íng ¦ng Tö (¸p dông chuyÓn sinh 1,2,3,4,5)/#way_change_chuyensinh(3)")
		tinsert(tSay, "MiÔn phÝ 1 lÇn chuyÓn sinh theo h­íng Phông Tö (¸p dông cho chuyÓn sinh 1,2,3,4,5)/#way_change_chuyensinh(4)")		
	end
	tinsert(tSay, "T¹m thêi ta ch­a muèn thay ®æi/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function way_change_chuyensinh(nType)
	local nNum_cs6 = GetPlayerRebornParam(0)
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."§¹i hiÖp muèn thay ®æi ChuyÓn Sinh theo h­íng nµo ????."
	if nType == 1 then
		tinsert(tSay, "H­íng Long Tö/#confirm_change_chuyensinh("..nType..", 1)")
		tinsert(tSay, "H­íng Hæ Tö/#confirm_change_chuyensinh("..nType..", 2)")
		tinsert(tSay, "H­íng ¦ng Tö/#confirm_change_chuyensinh("..nType..", 3)")
		tinsert(tSay, "H­íng Phông Tö/#confirm_change_chuyensinh("..nType..", 4)")
		tinsert(tSay, "T¹m thêi ta ch­a muèn thay ®æi/do_nothing")
		Say(tHeader, getn(tSay), tSay)		
	elseif nType == 2 then
		tHeader = szNpcName.."§¹i hiÖp muèn thay ®æi theo h­íng nµo. §èi víi Phôc Sinh, sau khi thay ®æi sÏ bÞ vÒ level 10, h·y ®Õn g¾p B¹ch Tiªn Sinh (TuyÒn Ch©u) ®Ó nhËn l¹i level !!!!."		
		tinsert(tSay, "H­íng Long Tö/#confirm_change_chuyensinh("..nType..", 1)")
		tinsert(tSay, "H­íng Hæ Tö/#confirm_change_chuyensinh("..nType..", 2)")
		tinsert(tSay, "H­íng ¦ng Tö/#confirm_change_chuyensinh("..nType..", 3)")		
		tinsert(tSay, "H­íng Phông Tö/#confirm_change_chuyensinh("..nType..", 4)")
		tinsert(tSay, "T¹m thêi ta ch­a muèn thay ®æi/do_nothing")
		Say(tHeader, getn(tSay), tSay)			
	elseif nType == 3 then
		if GetTask(TSK_SUPPORT_CHUYENSINH) == 1 then
			Talk(1,"", "Ta ®· gióp ®¹i hiÖp chuyÓn sinh miÔn phÝ 1 lÇn råi!!!!")		
			return 0
		end
		if nNum_cs6 >= 1 then
			Talk(1,"", "§¹i hiÖp ®· hoµn thµnh Phôc Sinh råi nªn kh«ng thÓ thùc hiÖn ChuyÓn Sinh ®­îc n÷a!!!!")		
			return 0
		end
		if GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION) ~= 3 and GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION) ~= 4 then
			Talk(1,"", "Ta chØ cã thÓ gióp cho nh©n vËt chuyÓn sinh theo h­íng Phông Tö vµ ¦ng Tö!!!!")		
			return 0		
		end
		SetTask(TSK_SUPPORT_CHUYENSINH,1)
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, 3)	
		 ModifyReputation(3000,0)
		 SetTask(336,GetTask(336) + 4000)
		Talk(1,"", "Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng ChuyÓn Sinh thµnh c«ng, h·y ®Õn gÆp B¹ch Tiªn Sinh ®Ó nhËn l¹i trang bÞ ChuyÓn Sinh míi !!!!")		
		Msg2Player("Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng ChuyÓn Sinh thµnh c«ng, h·y ®Õn gÆp B¹ch Tiªn Sinh ®Ó nhËn l¹i trang bÞ ChuyÓn Sinh míi !!!!")
		gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ®æi thµnh c«ng", 1, "ChuyÓn Sinh miÔn phÝ thµnh ¦ng Tö")	
	elseif nType == 4 then
		if GetTask(TSK_SUPPORT_CHUYENSINH) == 1 then
			Talk(1,"", "Ta ®· gióp ®¹i hiÖp chuyÓn sinh miÔn phÝ 1 lÇn råi!!!!")		
			return 0
		end
		if nNum_cs6 >= 1 then
			Talk(1,"", "§¹i hiÖp ®· hoµn thµnh Phôc Sinh råi nªn kh«ng thÓ thùc hiÖn ChuyÓn Sinh ®­îc n÷a!!!!")		
			return 0
		end	
		if GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION) ~= 3 and GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION) ~= 4 then
			Talk(1,"", "Ta chØ cã thÓ gióp cho nh©n vËt chuyÓn sinh theo h­íng Phông Tö vµ ¦ng Tö!!!!")		
			return 0		
		end	
		SetTask(TSK_SUPPORT_CHUYENSINH,1)
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, 4)	
		ModifyReputation(3000,0)
		SetTask(336,GetTask(336) + 4000)
		Talk(1,"", "Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng ChuyÓn Sinh thµnh c«ng, h·y ®Õn gÆp B¹ch Tiªn Sinh ®Ó nhËn l¹i trang bÞ ChuyÓn Sinh míi !!!!")		
		Msg2Player("Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng ChuyÓn Sinh thµnh c«ng, h·y ®Õn gÆp B¹ch Tiªn Sinh ®Ó nhËn l¹i trang bÞ ChuyÓn Sinh míi !!!!")
		gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ®æi thµnh c«ng", 1, "ChuyÓn Sinh miÔn phÝ thµnh Phông Tö")	
	end

end
function confirm_change_chuyensinh(nType, nWay)
	local nNum_cs6 = GetPlayerRebornParam(0)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc chuyÓn sinh")
		return
	end	
	if nType <= 0 or nWay <= 0 then
		Talk(1,"","§¹i hiÖp kh«ng ®ñ ®iÒu kiÖn ®Ó thay ®æi h­íng ChuyÓn Sinh")
		return
	end
	local nCheck = check_change_chuyensinh(nType)
	if nCheck ~= 1 then
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn")
		return 0
	end
	if nType == 1 then
		if GetTranslifeCount() < 1 then
			Talk(1,"", "§¹i hiÖp ch­a hoµn thµnh xong nhiÖm vô ChuyÓn Sinh !!!!")		
			return 0
		end	
		if nNum_cs6 >= 1 then
			Talk(1,"", "§¹i hiÖp ®· hoµn thµnh Phôc Sinh råi nªn kh«ng thÓ thùc hiÖn ChuyÓn Sinh ®­îc n÷a!!!!")		
			return 0
		end
	end
	if nType == 2 then
		if GetPlayerRebornParam(0) < 1 then --GetTranslifeCount() < 6 
			Talk(1,"", "§¹i hiÖp ch­a hoµn thµnh xong nhiÖm vô Phôc Sinh !!!!")		
			return 0
		end
	end
	------------------------
	local tChange = {--Xu vËt phÈm, Thiªn Cang LÖnh, Thiªn M«n Kim LÖnh,  Vµng
					[1] = {777, 1, 0, 0},
					[2] = {777, 1, 1, 777},	
				}
	DelItem(2,1,30230,tChange[nType][1])
	DelItem(2,95,204,tChange[nType][2])
	if nType == 2 then
		DelItem(2,1,30370,tChange[nType][3])
		Pay(tChange[nType][4]*10000)	
	end
	gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ®æi thµnh c«ng", 1, "Xãa thµnh c«ng vËt phÈm")			
	------------------------
	if nType == 1 then
		-- Set h­íng chuyÓn sinh
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nWay)	
		Talk(1,"", "Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng ChuyÓn Sinh thµnh c«ng, h·y ®Õn gÆp B¹ch Tiªn Sinh ®Ó nhËn l¹i trang bÞ ChuyÓn Sinh míi !!!!")		
		Msg2Player("Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng ChuyÓn Sinh thµnh c«ng, h·y ®Õn gÆp B¹ch Tiªn Sinh ®Ó nhËn l¹i trang bÞ ChuyÓn Sinh míi !!!!")
		gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ®æi thµnh c«ng", 1, "ChuyÓn Sinh ®æi h­íng "..nWay)
	end	
	if nType == 2 then
--		local nNum_cs6 = GetPlayerRebornParam(0)	--¸p dông thay ®æi h­íng Phôc sinh lu«n cho c¸c Phôc sinh 2, 3, 4...
		local nLevel_CS6 = GetLevel()
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FLAG_LEVEL, 0)	
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_SAVE_LEVEL, 0)	
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FLAG_LEVEL, 1)	
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_SAVE_LEVEL, nLevel_CS6)	
		PlayerReborn(nNum_cs6,nWay) -- Thay ®æi h­íng chuyÓn Sinh 6 thµnh c«ng		
		Talk(1,"", "Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng Phôc Sinh thµnh c«ng, h·y ®Õn gÆp B¹ch Tiªn Sinh ®Ó nhËn l¹i trang bÞ Phôc Sinh míi !!!!")		
		Msg2Player("Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng Phôc Sinh thµnh c«ng, h·y ®Õn gÆp B¹ch Tiªn Sinh ®Ó nhËn l¹i trang bÞ Phôc Sinh míi !!!!")
		gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ®æi thµnh c«ng", 1, "Phôc Sinh ®æi h­íng "..nWay)
		NewWorld(200,1353, 2876)
	end
end
-- Doi chan khi bang trai cay
function GetQiByFruit()
	if tonumber(gf_GetTaskByte(TSK_GETQIBYFRUIT, 1)) ~= tonumber(date("%w")) then
		SetTask(TSK_GETQIBYFRUIT, 0)
		gf_SetTaskByte(TSK_GETQIBYFRUIT, 1, tonumber(date("%w")))
	end
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Trªn thÕ gian cã v« sè ®iÒu kú bÝ, ta ®· tõng ®i qua rÊt nhiÒu n¬i nªn cã am hiÓu vÒ mét sè kú thuËt, c¸c h¹ cã muèn thä gi¸o kh«ng?"
	tinsert(tSay,"Ta muèn nép mét Ýt tr¸i c©y/NopTraiCayNhanChanKhi_Form")
	local nFruitCount = 0
	for i = 1, 20 do
		nFruitCount = nFruitCount + gf_GetTaskBit(TSK_GETQIBYFRUIT, i + 9)
	end
	if nFruitCount > 1 then
		tinsert(tSay,"Ta muèn nhËn th­ëng nép nhiÒu tr¸i c©y/NhanThuongNopNhieuTraiCay")
	end
	tinsert(tSay, "T¹m thêi ta ch­a muèn luyÖn/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end


function NopTraiCayNhanChanKhi_Form()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	if MeridianGetLevel() < 1 then
		Talk(1,"", szNpcName .. "C¸c h¹ ch­a ®¶ th«ng kinh m¹ch, ta kh«ng thÓ h­íng dÉn tu luyÖn ch©n khÝ.")
		return 0
	end
	local tbFruitList = {
		[1] = "Nh·n", [2] = "Ch«m Ch«m", [3] = "Cam", [4] = "Dõa", [5] = "M¨ng côt", [6] = "B­ëi", [7] = "D©u", [8] = "Chuèi", [9] = "Xoµi", [10] = "§µo", 
		[11] = "MËn", [12] = "V¶i", [13] = "T¸o", [14] = "B¬", [15] = "§u ®ñ", [16] = "M·ng cÇu", [17] = "Khãm", [18] = "Lª", [19] = "Bßn bon", [20] = "KhÕ",
	}
	local tSay = {}
	tSay[0] =  szNpcName.."C¸c h¹ muèn ®­a ta lo¹i tr¸i c©y nµo?"
	for i = 1, 20 do
		if gf_GetTaskBit(TSK_GETQIBYFRUIT, i + 9) == 0 then
			tinsert(tSay ,format("Ta muèn nép 30 %s/#NopTraiCayNhanChanKhi_Done(%d)", tbFruitList[i], i))
		end
	end
	gf_PageSay(tSay, 1, 6)
end


function NopTraiCayNhanChanKhi_Done(nFruit)
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tbFruitListID = {
		[1] = 30164, [2] = 30165, [3] = 30166, [4] = 30167, [5] = 30168, [6] = 30169, [7] = 30170, [8] = 30171, [9] = 30172, [10] = 30173,
		[11] = 30174, [12] = 30175, [13] = 30176, [14] = 30177, [15] = 30178, [16] = 30179, [17] = 30180, [18] = 30181, [19] = 30182, [20] = 30183,
	}
	if GetItemCount(2,1,tbFruitListID[nFruit]) < 30 then
		Talk(1,"", szNpcName .. "Ng­¬i tay kh«ng d©ng n¹p, ®Þnh ®ïa víi ta sao?")
		return 0
	end
	if DelItem(2,1,tbFruitListID[nFruit],30) == 1 then
		gf_SetTaskBit(TSK_GETQIBYFRUIT, nFruit + 9, 1)
		AwardGenuineQi(6)
		gf_WriteLogEx("NOP TRAI CAY DOI CHAN KHI", "nhËn", 6, "Ch©n khÝ")
	end
end


function NhanThuongNopNhieuTraiCay()
	if gf_GetTaskBit(TSK_GETQIBYFRUIT, 9) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng h«m nay råi.");
		return 0
	end
	local nFruitCount = 0
	for i = 1, 20 do
		nFruitCount = nFruitCount + gf_GetTaskBit(TSK_GETQIBYFRUIT, i + 9)
	end
	if nFruitCount > 1 then
		gf_SetTaskBit(TSK_GETQIBYFRUIT, 9, 1)
		AwardGenuineQi(nFruitCount * 10)
		gf_WriteLogEx("NOP NHIEU TRAI CAY THUONG CHAN KHI", "nhËn", (nFruitCount * 10), "Ch©n khÝ")
	end
end


-- Doi chan khi bang tien + kinh nghiem
function GetQiByGold()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Trªn thÕ gian cã v« sè ®iÒu kú bÝ, ta ®· tõng ®i qua rÊt nhiÒu n¬i nªn cã am hiÓu vÒ mét sè kú thuËt, c¸c h¹ cã muèn thä gi¸o kh«ng?"
	tinsert(tSay, "Tu luyÖn 100 ®iÓm ch©n khÝ (tiªu hao 1000 vµng)/#exchange_chankhi_bygold(5)")	
	tinsert(tSay, "Tu luyÖn 100 ®iÓm ch©n khÝ (tiªu hao 250 vµng + 30 triÖu ®iÓm kinh nghiÖm)/#exchange_chankhi_bygold(1)")	
	tinsert(tSay, "Tu luyÖn 1000 ®iÓm ch©n khÝ (tiªu hao 2500 vµng + 300 triÖu ®iÓm kinh nghiÖm)/#exchange_chankhi_bygold(2)")	
	tinsert(tSay, "Tu luyÖn 100 ®iÓm ch©n khÝ (tiªu hao 69 vËt phÈm Xu + 30 triÖu ®iÓm kinh nghiÖm)/#exchange_chankhi_bygold(3)")	
	tinsert(tSay, "Tu luyÖn 1000 ®iÓm ch©n khÝ (tiªu hao 690 vËt phÈm Xu + 300 triÖu ®iÓm kinh nghiÖm)/#exchange_chankhi_bygold(4)")	
	tinsert(tSay, "T¹m thêi ta ch­a muèn luyÖn/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end


function use_chuyensinhdon()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Trªn thÕ gian cã v« sè ®iÒu kú bÝ, ta ®· tõng ®i qua rÊt nhiÒu n¬i nªn cã am hiÓu vÒ mét sè kú thuËt, c¸c h¹ cã muèn thä gi¸o kh«ng?"
	tinsert(tSay, "Ta muèn ®¹t c¶nh giíi ChuyÓn Sinh 2/#confirm_use_chuyensinhdon(1)")		
	tinsert(tSay, "Ta muèn ®¹t c¶nh giíi ChuyÓn Sinh 3/#confirm_use_chuyensinhdon(2)")		
	tinsert(tSay, "Ta muèn ®¹t c¶nh giíi ChuyÓn Sinh 4/#confirm_use_chuyensinhdon(3)")		
	tinsert(tSay, "Ta muèn ®¹t c¶nh giíi ChuyÓn Sinh 5/#confirm_use_chuyensinhdon(4)")		
	tinsert(tSay, "Ta chØ muèn t×m hiÓu th«i/do_nothing")
	Say(tHeader, getn(tSay), tSay)	
end

function learn_subskill_1()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."C¸c h¹ h·y lùa chän kú thuËt muèn luyÖn:"
	
	tinsert(tSay, "LuyÖn ThuÇn Thó ThuËt cÊp 1/learn_subskill_1_active")
	tinsert(tSay, "LuyÖn ThuÇn Thó ThuËt cÊp 2/#levelup_subskill_1(2)")
	tinsert(tSay, "LuyÖn ThuÇn Thó ThuËt cÊp 3/#levelup_subskill_1(3)")
	tinsert(tSay, "LuyÖn Phôc Nh©n ThuËt cÊp 4/#levelup_subskill_1(4)")
	--tinsert(tSay, "LuyÖn Phôc Nh©n ThuËt cÊp 5/#levelup_subskill_1(5)")
	--tinsert(tSay, "LuyÖn Phôc Nh©n ThuËt cÊp 6/#levelup_subskill_1(6)")
	--tinsert(tSay, "LuyÖn Ngù Linh ThÇn ThuËt cÊp 7/#levelup_subskill_1(7)")
	--tinsert(tSay, "LuyÖn Ngù Linh ThÇn ThuËt cÊp 8/#levelup_subskill_1(8)")
	--tinsert(tSay, "LuyÖn Ngù Linh ThÇn ThuËt cÊp 9/#levelup_subskill_1(9)")
	--tinsert(tSay, "LuyÖn Ngù Linh ThÇn ThuËt cÊp 10/#levelup_subskill_1(10)")
	tinsert(tSay, "Ta chØ muèn t×m hiÓu th«i/do_nothing")
	
	Say(tHeader, getn(tSay), tSay)
end

function learn_subskill_1_active()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	
	if nCurLevel >= 1 then
		Talk(1, "", szNpcName..": C¸c h¹ ®· luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt råi, kh«ng cÇn ph¶i kÝch ho¹t l¹i n÷a!")
		return
	end
	
	local tSay = {}
	tinsert(tSay, "§ång ý luyÖn/confirm_learn_subskill_1_active")
	tinsert(tSay, "§Ó ta suy nghÜ l¹i/do_nothing")
	
	local nGold = tRequireElement[1][3] / 10000
	Say(szNpcName..": LuyÖn B¾c §Èu Ngù Linh ThÇn ThuËt cÇn cã <color=yellow>"..tRequireElement[1][2].." ®iÓm tu luyÖn, "..nGold.." vµng vµ "..tRequireElement[1][4].." m¶nh Th¸i DÞch Hçn Nguyªn C«ng §å<color>, c¸c h¹ cã ®ång ý luyÖn kh«ng?", 2, tSay)
end

function confirm_learn_subskill_1_active()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"		
--	if GetLevel() < 75 then
--		Talk(1, "", szNpcName..": §¼ng cÊp 75 trë lªn míi cã thÓ luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt!")
--		return
--	end
--	if check_skill_55() == 0 then
--		Talk(1, "", szNpcName..": §Ó luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt tr­íc hÕt ph¶i häc ®Çy ®ñ kü n¨ng cÊp 55 cña m«n ph¸i!")
--		return
--	end	
	if GetPopur() < tRequireElement[1][2] then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ ®iÓm tu luyÖn ®Ó luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	if GetCash() < tRequireElement[1][3] then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ tiÒn ®Ó luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	if GetItemCount(2, 0, 1082) < tRequireElement[1][4] then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a mang ®ñ Th¸i DÞch Hçn Nguyªn C«ng §å ®Ó luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	
	if DelItem(2, 0, 1082, tRequireElement[1][4]) == 1 then		
		ModifyPopur(-tRequireElement[1][2])
		Pay(tRequireElement[1][3])
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 1)
		gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_SEX,  random(1,2))
		gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE,  1)
		Msg2Player("B¹n ®· kÝch ho¹t thµnh c«ng B¾c §Èu Ngù Linh ThÇn ThuËt!")
		WriteLogEx(szLogTitle, "kÝch ho¹t thµnh c«ng")
		Talk(1, "", szNpcName..": Chóc mõng c¸c h¹ ®· luyÖn thµnh c«ng B¾c §Èu Ngù Linh ThÇn ThuËt!")
	end
end

function levelup_subskill_1(nSkillLevel)
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)	
	if nCurLevel == nSkillLevel then
		Talk(1, "", szNpcName..": C¸c h¹ ®· luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt ®Õn cÊp "..nSkillLevel.." råi!")
		return
	end
	if nCurLevel < nSkillLevel - 1 then
		Talk(1, "", szNpcName..": C¸c h¹ cÇn luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt cÊp d­íi råi h·y ®Õn gÆp ta ®Ó n©ng lªn cÊp "..nSkillLevel)
		return
	end
	if nCurLevel > 4 then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ ®iÒu kiÖn ®Ó n©ng lªn cÊp "..nSkillLevel)
		return
	end
	if nSkillLevel == nCurLevel + 1 then
		local tSay = {}
		tinsert(tSay, format("§ång ý n©ng cÊp/#confirm_levelup_subskill_1(%d)",nSkillLevel))
		tinsert(tSay, "§Ó ta suy nghÜ l¹i/do_nothing")
		
		local nGold = tRequireElement[nSkillLevel][3] / 10000
		Say("§Ó n©ng cÊp B¾c §Èu Ngù Linh ThÇn ThuËt lªn cÊp "..nSkillLevel.."cÇn cã <color=yellow>"..tRequireElement[nSkillLevel][1].." ®iÓm N©ng CÊp, "..tRequireElement[nSkillLevel][5].." ®iÓm Linh Lùc, "..tRequireElement[nSkillLevel][2].." ®iÓm tu luyÖn, "..nGold.." vµng vµ "..tRequireElement[nSkillLevel][4].." m¶nh Th¸i DÞch Hçn Nguyªn C«ng §å<color>, c¸c h¹ cã ®ång ý n©ng cÊp kh«ng?", 2, tSay)
	end
end

function confirm_levelup_subskill_1(nSkillLevel)
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"
	local nCurPoint = floor(GetTask(TASK_VNG_PET) / 100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	
--	if GetLevel() < 75 then
--		Talk(1, "", szNpcName..": §¼ng cÊp 75 trë lªn míi cã thÓ luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt!")
--		return
--	end
--	if check_skill_55() == 0 then
--		Talk(1, "", szNpcName..": §Ó luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt tr­íc hÕt ph¶i häc ®Çy ®ñ kü n¨ng cÊp 55 cña m«n ph¸i!")
--		return
--	end
	if nCurLevel == 0 then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt ®Õn cÊp 1!")
		return
	end
	if nCurLevel == nSkillLevel then
		Talk(1, "", szNpcName..": C¸c h¹ ®· luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt ®Õn cÊp "..nSkillLevel.." råi!")
		return
	end
	if nCurLevel < nSkillLevel - 1 then
		Talk(1, "", szNpcName..": C¸c h¹ cÇn luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt cÊp d­íi råi h·y ®Õn gÆp ta ®Ó n©ng lªn cÊp "..nSkillLevel)
		return
	end
	if nCurLevel > nSkillLevel or nSkillLevel > 4 then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ ®iÒu kiÖn ®Ó n©ng lªn cÊp "..nSkillLevel.." cña B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	if GetPopur() < tRequireElement[nSkillLevel][2] then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ ®iÓm N©ng cÊp ®Ó n©ng cÊp B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	if nCurPoint < tRequireElement[nSkillLevel][1] then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ ®iÓm ®Ó n©ng cÊp B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	if nCurGodPoint < tRequireElement[nSkillLevel][5] then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ ®iÓm Linh Lùc  ®Ó n©ng cÊp B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	if GetCash() < tRequireElement[nSkillLevel][3] then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ tiÒn ®Ó n©ng cÊp B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	if GetItemCount(2, 0, 1082) < tRequireElement[nSkillLevel][4] then
		Talk(1, "", szNpcName..": C¸c h¹ ch­a mang ®ñ Th¸i DÞch Hçn Nguyªn C«ng §å ®Ó n©ng cÊp B¾c §Èu Ngù Linh ThÇn ThuËt!")
		return
	end
	
	if DelItem(2, 0, 1082, tRequireElement[nSkillLevel][4]) == 1 then
		ModifyPopur(-tRequireElement[nSkillLevel][2])
		Pay(tRequireElement[nSkillLevel][3])
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 1)
		if nSkillLevel < 4 then
			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE,  random(1,2))
		end
		Msg2Player("B¹n ®· n©ng thµnh c«ng B¾c §Èu Ngù Linh ThÇn ThuËt lªn cÊp "..nSkillLevel)
		WriteLogEx(szLogTitle, "n©ng lªn cÊp "..nSkillLevel)
		Talk(1, "", szNpcName..": Chóc mõng c¸c h¹ ®· n©ng thµnh c«ng B¾c §Èu Ngù Linh ThÇn ThuËt lªn cÊp "..nSkillLevel)
	end
end

function learn_subskill_2()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"
	Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ ®iÒu kiÖn ®Ó luyÖn B¾c §Èu Gi¶ Kim ThuËt!")
	return
end

function learn_subskill_3()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"
	Talk(1, "", szNpcName..": C¸c h¹ ch­a ®ñ ®iÒu kiÖn ®Ó luyÖn B¾c §Èu Phôc Nguyªn ThuËt!")
	return
end

function learn_subskill_4()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"
	Talk(1, "", szNpcName..": Kú thuËt nµy cã thÓ ®­îc kÝch ho¹t sö dông trong NguyÖt L­îng Thè LuyÖn §¬n L­!")
	return
end

function check_skill_55()
	local nRoute = GetPlayerRoute()
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end
	end
end

function exchange_chankhi()
	AskClientForNumber("Confirm_Exchange_chankhi", 1, 100, "§iÓm tÝch lòy")
end

function Confirm_Exchange_chankhi(nCount)
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = floor(GetTask(2726)/10000)
	local CHANGE_EXP = 2000000
	if nDate ~= nCurdate then
		SetTask(2726 , nDate*10000)
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ ®æi ®iÓm ch©n khÝ !!!")
		return
	end
	if MeridianGetLevel() <= 0 then
		Talk ( 1, "", "§¹i hiÖp ch­a kÝch ho¹t xong kinh m¹ch nªn kh«ng thÓ ®æi ®iÓm ch©n khÝ !!!" )
		return
	end
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "ThiÕu hiÖp ch­a v« m«n ph¸i nªn kh«ng thÓ kÝch ho¹t Kinh M¹ch" )
		return
	end
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph¶i cã kü n¨ng cÊp 55 míi cã thÓ kÝch ho¹t Kinh M¹ch!")
		return
	end
	if mod(GetTask(2726),10000) >= 1000 then
		Talk(1,"","H«m nay ®¹i hiÖp ®· ®æi hÕt ®iÓm råi, vui lßng quay l¹i vµo ngµy mai")
		return	
	end
	if (mod(GetTask(2726),10000) + nCount) > 1000 then
		Talk(1,"","Tæng ®iÓm ch©n khÝ ®æi trong ngµy kh«ng thÓ qu¸ 1000 ®iÓm. ")
		return	
	end
	if GetExp() < CHANGE_EXP * nCount then
		Talk(1,"","§¹i hiÖp ch­a ®ñ ®iÓm kinh nghiÖm ®Ó ®æi "..nCount.." ®iÓm ch©n khÝ")
		return
	end	
	--add ®iÓm ch©n khÝ
	SetTask(2726, GetTask(2726) + nCount)
	ModifyExp(-2000000 * nCount)
	AwardGenuineQi(nCount)
	--IBAwardGenuineQiDaily(nCount)
	Msg2Player("Chóc mõng ®¹i hiÖp ®· ®æi ®­îc "..nCount.." ®iÓm ch©n khÝ")
	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nCount, "ch©n khÝ = exp")
end

function exchange_chankhi_bygold(nTypeCK)
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = floor(GetTask(2728)/10000)
	local tb_check_CK_gold = {
		[1] = {100, 2500000, 30000000, "250 vang + exp"},
		[2] = {1000, 25000000, 300000000, "2500 vµng + exp"},
		[3] = {100, 69, 30000000, "69 xu + exp"},
		[4] = {1000, 690, 300000000, "690 xu + exp"},
		[5] = {100, 10000000, 0, "1000 vµng"},
	}
	if nDate ~= nCurdate then
		SetTask(2728 , nDate*10000)
	end	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ ®æi ®iÓm ch©n khÝ !!!")
		return
	end
	if MeridianGetLevel() <= 0 then
		Talk ( 1, "", "§¹i hiÖp ch­a kÝch ho¹t xong kinh m¹ch nªn kh«ng thÓ ®æi ®iÓm ch©n khÝ !!!" )
		return
	end
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "ThiÕu hiÖp ch­a v« m«n ph¸i nªn kh«ng thÓ kÝch ho¹t Kinh M¹ch" )
		return
	end
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph¶i cã kü n¨ng cÊp 55 míi cã thÓ kÝch ho¹t Kinh M¹ch!")
		return
	end	
	if nTypeCK == 1 or nTypeCK == 2 or nTypeCK == 5 then
		if GetCash() < tb_check_CK_gold[nTypeCK][2] then
			Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ tiÒn ®Ó tr¶ c«ng cho l·o phu !!!")
			return
		end
	end
	if nTypeCK == 3 or nTypeCK == 4 then
		if GetItemCount(2,1,30230) < tb_check_CK_gold[nTypeCK][2] then
			Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ Xu vËt phÈm ®Ó tr¶ c«ng cho l·o phu !!!")
			return
		end
	end
	if GetExp() < tb_check_CK_gold[nTypeCK][3] then
		Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ kinh nghiÖm ®Ó tu luyÖn !!!")
		return
	end
	if mod(GetTask(2728),10000) >= 2000 then
		Talk(1,"","H«m nay ®¹i hiÖp ®· ®æi hÕt ®iÓm råi, vui lßng quay l¹i vµo ngµy mai")
		return	
	end
	if (mod(GetTask(2728),10000) + tb_check_CK_gold[nTypeCK][1]) > 2000 then
		Talk(1,"","Tæng ®iÓm ch©n khÝ ®æi trong ngµy kh«ng thÓ qu¸ 2000 ®iÓm. ")
		return	
	end
	SetTask(2728, GetTask(2728) + tb_check_CK_gold[nTypeCK][1])
	if nTypeCK == 1 or nTypeCK == 2 or nTypeCK == 5 then
		Pay(tb_check_CK_gold[nTypeCK][2])
	else
		DelItem(2,1,30230, tb_check_CK_gold[nTypeCK][2])
	end
	ModifyExp(-tb_check_CK_gold[nTypeCK][3])
	AwardGenuineQi(tb_check_CK_gold[nTypeCK][1])
	Msg2Player("Chóc mõng ®¹i hiÖp ®· tu luyÖn ®­îc "..tb_check_CK_gold[nTypeCK][1].." ®iÓm ch©n khÝ")	
	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", tb_check_CK_gold[nTypeCK][1], "27/6 ch©n khÝ lo¹i ".. tb_check_CK_gold[nTypeCK][4])	
end

tb_checkdk = {
		[1] = {1, 2, 6000, 6000, 1, 6, 2},
		[2] = {1, 3, 8000, 8000, 2, 12, 3},
		[3] = {1, 4, 10000, 10000, 3, 22, 4},
		[4] = {1, 4, 12000, 12000, 4, 30, 5},
}
function confirm_use_chuyensinhdon(nCSLoai)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	
	--if GetItemCount(2,1,30345) < tb_checkdk[nCSLoai][1] then
	--	Talk(1, "", szNpcName..": C¸c h¹ kh«ng cã ChuyÓn Sinh §¬n nªn ta kh«ng thÓ gióp c¸c h¹ ®­îc !!!")
	--	return
	--end
	--if GetItemCount(2,1,539) < tb_checkdk[nCSLoai][2] then
	--	Talk(1, "", szNpcName..": C¸c h¹ kh«ng cã ®ñ Hoµng Kim §¹i Hång Bao (chøa 999 vµng) nªn ta kh«ng thÓ gióp c¸c h¹ ®­îc !!!")
	--	return
	--end
	--if nRep < tb_checkdk[nCSLoai][3] then
	--	Talk(1, "", szNpcName..": C¸c h¹ kh«ng cã ®ñ ®iÓm Danh Väng nªn ta kh«ng thÓ gióp c¸c h¹ ®­îc !!!")
	--	return
	--end	
	--if nFaction < tb_checkdk[nCSLoai][4] then
	--	Talk(1, "", szNpcName..": C¸c h¹ kh«ng cã ®ñ ®iÓm S­ M«n nªn ta kh«ng thÓ gióp c¸c h¹ ®­îc !!!")
	--	return
	--end	
	if GetTranslifeCount() < tb_checkdk[nCSLoai][5] or GetTaskTrans() <tb_checkdk[nCSLoai][6] then
		Talk(1,"","B¹n ch­a hoµn thµnh chuyÓn sinh "..tb_checkdk[nCSLoai][5].." nªn ta kh«ng thÓ gióp c¸c h¹ ®­îc")
		return
	end
	if GetTranslifeCount() >= tb_checkdk[nCSLoai][7] then
		Talk(1,"","B¹n ®· hoµn thµnh chuyÓn sinh "..tb_checkdk[nCSLoai][7].." råi, nªn ta kh«ng thÓ gióp c¸c h¹ ®­îc")
		return
	end
	select_trend(nCSLoai)
end

function select_trend(nCSLoai)
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>"
	local nLoai = nCSLoai
	local tSay = 	{
							"V·n bèi muèn tu luyÖn theo h­íng Long Tö!/#select_translife(1, "..nLoai..")",
							"V·n bèi muèn tu luyÖn theo h­íng Hæ Tö!/#select_translife(2, "..nLoai..")",
							"V·n bèi muèn tu luyÖn theo h­íng ¦ng Tö!/#select_translife(3, "..nLoai..")",
							"V·n bèi muèn tu luyÖn theo h­íng Phông Tö!/#select_translife(4, "..nLoai..")",
						--	"Giíi thiÖu c¸c h­íng tu luyÖn/view_info",
							"V·n bèi suy nghÜ l¹i ®·./nothing",
						}
	Say(szNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end
function select_translife(nType, nLoai)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	DelItem(2,1,30345,1)
	DelItem(2,1,539, tb_checkdk[nLoai][2])
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	local nRoute = GetPlayerRoute()
	-- Set sè lÇn chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, gf_GetTaskByte(TRANSLIFE_TASK_ID,TRANSLIFE_BYTE_COUNT) +1)
	-- Set h­íng chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	if nLoai == 1 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nhËn ngo¹i trang",0,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 13)
		ResetProperty()
		SetLevel(88,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø hai...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 4 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	elseif nLoai == 2 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, Pnew, nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"V¨n Sö Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 23)
		ResetProperty()
		SetLevel(86,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø ba...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 6 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)		
	elseif nLoai == 3 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (561 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Thiªn ¢m Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 31)
		ResetProperty()
		SetLevel(84,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø t­...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 8 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	elseif nLoai == 4 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 561 + GetBody()
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 37)
		ResetProperty()
		SetLevel(79,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø t­...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 8 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	end

end
function get_item_kinhmach()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Ta cã thÓ gióp c¸c h¹ kÝch ho¹t thµnh c«ng c¶nh giíi Vâ HiÒn cña Kinh M¹ch. C¸c h¹ cã muèn kh«ng ?"
	
	tinsert(tSay, "§ång ý/confirm_get_item_kinhmach")
	tinsert(tSay, "T¹m thêi ta ch­a muèn lµm/do_nothing")
	
	Say(tHeader, getn(tSay), tSay)
end
function get_item_tulinh()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Ta cho c¸c h¹ vËt phÈm Tø Linh DiÖt Ph¸p TrËn Bµn ®Ó lµm tiÕp nhiÖm vô Tø Linh DiÖt Ph¸p TrËn. C¸c h¹ cã muèn nhËn kh«ng ?"
	
	tinsert(tSay, "§ång ý/confirm_get_item_tulinh")
	tinsert(tSay, "T¹m thêi ta ch­a muèn lµm/do_nothing")
	
	Say(tHeader, getn(tSay), tSay)
end
function confirm_get_item_kinhmach()
	if GetLevel() < 90 then
		Talk(1,"","§¹i hiÖp kh«ng ®ñ cÊp ®Ó kÝch ho¹t Kinh M¹ch !!!!")
		return 0
	end
	if gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","§¹i hiÖp ch­a cã skill 55 nªn kh«ng thÓ kÝch ho¹t Kinh M¹ch !!!!")
		return 0
	end
	if MeridianGetLevel() ~= 0 then
		Talk(1,"","§¹i hiÖp ®· kÝch ho¹t Kinh M¹ch råi !!!!")
		return 0
	end
	if GetItemCount(2,1,30230) < 10 then
		Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ Xu vËt phÈm !!!!")
		return 0
	end
	DelItem(2,1,30230,10)
	if MeridianGetLevel() == 0 then
	--print("MeridianGetLevel")
		local tSex = gf_GetPlayerSexName();
		if MeridianUpdateLevel() == 1 then
			Msg2Player("Chóc mõng "..tSex.."Nghiªn cøu <Quú Hoa B¶o §iÓn> thµnh c«ng vµ ®¹t ®Õn c¶nh giíi Vâ Gi¶.");
			if MeridianGetLevel() == 1 then
				gf_WriteLogEx("KICK HOAT KINH MACH", "thµnh c«ng", 1, "Vâ HiÒn 27/7")
		  		Msg2Player("Chóc mõng "..tSex.."So bé l·nh ngé <Quú Hoa B¶o §iÓn>");
		  		Talk(2,"",format("Chóc mõng <color=green>%s<color>®· ®äc'Quú Hoa B¶o §iÓn'thµnh c«ng vµ ®Æt  ®Õn c¹nh giíi vâ gi¶",tSex),format("Chóc mõng %s s¬ bé lÜnh ngé ®­îc'Quú Hoa B¶o §iÓn',(bÊm nót J®Ó xem kinh m¹ch)",tSex));
			end
		end
	end
end
function confirm_get_item_tulinh()
	if GetItemCount(2,1,30230) < 10 then
		Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ Xu vËt phÈm !!!!")
		return 0	
	end
	if BigGetItemCount(2,0,30049) == 0 then
		Talk(1,"","ChØ cã nh÷ng ®¹i hiÖp bÞ kÑt nhiÖm vô tr­íc ®©y míi nhËn ®­îc vËt phÈm hç trî !!!!")
		return 0	
	end
	if BigGetItemCount(2,0,30050) >= 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn vËt phÈm hç trî råi hoÆc ®· hoµn thµnh nhiÖm vô råi !!!!")
		return 0	
	end	
	DelItem(2,1,30230,10)
	BigDelItem(2,0,30052,GetItemCount(2,0,30052))
	--if BigDelItem(2,0,30049,GetItemCount(2,0,30049)) == 1 then
		if BigGetItemCount(2,0,30050) == 0 then
			AddItem(2,0,30050,1);
			Msg2Player("GhÐp thµnh c«ng Tø Linh DiÖt Ph¸p TrËn Bµn");
		end
	--end
end
function exchange_to_exp()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Trªn thÕ gian cã v« sè ®iÒu kú bÝ, ta ®· tõng ®i qua rÊt nhiÒu n¬i nªn cã am hiÓu vÒ mét sè kú thuËt, c¸c h¹ cã muèn thä gi¸o kh«ng?"

	tinsert(tSay, "NhËn 390000 kinh nghiÖm (1 m¶nh thiªn th¹ch + 1 xu vËt phÈm)/#confirm_exchange_to_exp(1)")
	tinsert(tSay, "NhËn 390000 kinh nghiÖm (2 thiªn th¹ch + 1 xu vËt phÈm)/#confirm_exchange_to_exp(2)")
	tinsert(tSay, "NhËn 390000 kinh nghiÖm (20 m¶nh tinh ngÊn + 1 xu vËt phÈm)/#confirm_exchange_to_exp(3)")
	tinsert(tSay, "NhËn 390000 kinh nghiÖm (20 ngò hµnh huyÒn th¹ch + 1 xu vËt phÈm)/#confirm_exchange_to_exp(4)")
	tinsert(tSay, "NhËn 390000 kinh nghiÖm (8 thiªn nghÜa tinh thiÕt + 1 xu vËt phÈm)/#confirm_exchange_to_exp(5)")
	tinsert(tSay, "NhËn 390000 kinh nghiÖm (8 ngò hµnh huyÒn thiÕt + 1 xu vËt phÈm)/#confirm_exchange_to_exp(6)")
	tinsert(tSay, "NhËn 100000 kinh nghiÖm (1 tiÓu Nh­ ý + 1 vµng)/#confirm_exchange_to_exp(7)")
	tinsert(tSay, "T¹m thêi ta ch­a muèn ®æi/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function confirm_exchange_to_exp(nType)
	if nType == 1 then
		AskClientForNumber("NguyenLieu1", 1, 999, "Sè lÇn ®æi (1-999)")
	elseif nType == 2 then
		AskClientForNumber("NguyenLieu2", 1, 999, "Sè lÇn ®æi (1-999)")
	elseif nType == 3 then
		AskClientForNumber("NguyenLieu3", 1, 999, "Sè lÇn ®æi (1-999)")
	elseif nType == 4 then
		AskClientForNumber("NguyenLieu4", 1, 999, "Sè lÇn ®æi (1-999)")
	elseif nType == 5 then
		AskClientForNumber("NguyenLieu5", 1, 999, "Sè lÇn ®æi (1-999)")
	elseif nType == 6 then
		AskClientForNumber("NguyenLieu6", 1, 999, "Sè lÇn ®æi (1-999)")
	elseif nType == 7 then
		AskClientForNumber("NguyenLieu7", 1, 999, "Sè lÇn ®æi (1-999)")
	end
end
function NguyenLieu1(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,2,7) < 1 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ "..1 * nCount.." M¶nh thiªn th¹ch ®Ó ®æi !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,2,7,1 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B¹n nhËn ®­îc "..390000 * nCount.." ®iªm kinh nghiÖm")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "®æi thµnh c«ng", nCount, "§æi nguyªn liÖu lo¹i 1")
	end
end
function NguyenLieu2(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,2,8) < 2 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ "..2 * nCount.." Thiªn th¹ch ®Ó ®æi !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,2,8,2 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B¹n nhËn ®­îc "..390000 * nCount.." ®iªm kinh nghiÖm")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "®æi thµnh c«ng", nCount, "§æi nguyªn liÖu lo¹i 2")
	end
end
function NguyenLieu3(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,1,30299) < 20 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ "..20 * nCount.." M¶nh tinh ngÊn ®Ó ®æi !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,1,30299,20 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B¹n nhËn ®­îc "..390000 * nCount.." ®iªm kinh nghiÖm")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "®æi thµnh c«ng", nCount, "§æi nguyªn liÖu lo¹i 3")
	end
end
function NguyenLieu4(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,1,30302) < 20 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ "..20 * nCount.." Ngò hµnh huyÒn th¹ch ®Ó ®æi !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,1,30302,20 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B¹n nhËn ®­îc "..390000 * nCount.." ®iªm kinh nghiÖm")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "®æi thµnh c«ng", nCount, "§æi nguyªn liÖu lo¹i 4")
	end
end
function NguyenLieu5(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,1,30300) < 8 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ "..8 * nCount.." Thiªn nghÜa tinh thiÕt ®Ó ®æi !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,1,30300,8 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B¹n nhËn ®­îc "..390000 * nCount.." ®iªm kinh nghiÖm")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "®æi thµnh c«ng", nCount, "§æi nguyªn liÖu lo¹i 5")
	end
end
function NguyenLieu6(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,1,30303) < 8 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ "..8 * nCount.." Ngò hµnh huyÒn thiÕt ®Ó ®æi !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,1,30303,8 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B¹n nhËn ®­îc "..390000 * nCount.." ®iªm kinh nghiÖm")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "®æi thµnh c«ng", nCount, "§æi nguyªn liÖu lo¹i 6")
	end
end
function NguyenLieu7(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ ®æi ®iÓm kinh nghiÖm !!!")
		return
	end
	if GetTranslifeCount() < 6 and GetTask(TSK_CS6_TULINH) < 5 then
		if GetExp() + 100000 > 2000000000 then
			Talk(1,"",format("§iÓm kinh nghiÖm cã ®­îc sau khi ®æi qu¸ lín, ®¹i hiÖp h·y sö dông bít råi quay l¹i gÆp ta !!!!!"))
			return 0
		end
	end
	if GetCash() < 10000 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ vµng ®Ó ®æi !!!!")
		return 0		
	end
	--check_exchange_to_exp(nCount)
	if GetItemCount(2,1,30030) < 1 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ "..1 * nCount.." TiÓu Nh­ ý ®Ó ®æi !")
		return 0		
	end	
	Pay(10000 * nCount)
	if DelItem(2,1,30030,1 * nCount) == 1 then
		ModifyExp(100000 * nCount)
		Msg2Player("B¹n nhËn ®­îc "..100000 * nCount.." ®iÓm kinh nghiÖm")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "®æi thµnh c«ng", nCount, "§æi nguyªn liÖu lo¹i 7")
	end
end
function check_exchange_to_exp(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ ®æi ®iÓm kinh nghiÖm !!!")
		return
	end
	if GetTranslifeCount() < 6 and GetTask(TSK_CS6_TULINH) < 5 then
		if GetExp() + 390000 > 2000000000 then
			Talk(1,"",format("§iÓm kinh nghiÖm cã ®­îc sau khi ®æi qu¸ lín, ®¹i hiÖp h·y sö dông bít råi quay l¹i gÆp ta !!!!!"))
			return 0
		end
	end
	if GetItemCount(2,1,30230) < 1 * nCount then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ Xu vËt phÈm ®Ó ®æi !!!!")
		return 0		
	end
end

function confirm_exchange_to_exp_BK(nType)
	local tCheck = {
					[1] = {2,2,7,390000, 1, " M¶nh thiªn th¹ch"},
					[2] = {2,2,8,390000, 2, " Thiªn th¹ch"},
					[3] = {2,1,30299,390000, 20, " M¶nh tinh ngÊn"},	
					[4] = {2,1,30302,390000, 20, " Ngò hµnh huyÒn th¹ch"},
					[5] = {2,1,30300,390000, 8, " Thiªn nghÜa tinh thiÕt"},
					[6] = {2,1,30303,390000, 8, " Ngò hµnh huyÒn thiÕt"},
					[7] = {2,1,30030,100000, 1, " TiÓu Nh­ ý"},
			}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ ®æi ®iÓm kinh nghiÖm !!!")
		return
	end
	if GetTranslifeCount() < 6 and GetTask(TSK_CS6_TULINH) < 5 then
		if GetExp() + tCheck[nType][4] > 2000000000 then
			Talk(1,"",format("§iÓm kinh nghiÖm cã ®­îc sau khi ®æi qu¸ lín, ®¹i hiÖp h·y sö dông bít råi quay l¹i gÆp ta !!!!!"))
			return 0
		end
	end
	local nG = tCheck[nType][1]
	local nD = tCheck[nType][2]
	local nP = tCheck[nType][3]
	if GetItemCount(nG,nD,nP) < tCheck[nType][5] then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ "..tCheck[nType][5]..tCheck[nType][6].." vËt phÈm ®Ó ®æi !!!!")
		return 0	
	end
	if nType == 7 then
		if GetCash() < 10000 then
			Talk(1,"","§¹i hiÖp kh«ng mang ®ñ vµng ®Ó ®æi !!!!")
			return 0		
		end
	else
		if GetItemCount(2,1,30230) < 1 then
			Talk(1,"","§¹i hiÖp kh«ng mang ®ñ Xu vËt phÈm ®Ó ®æi !!!!")
			return 0		
		end
	end
	if nType == 7 then
		Pay(10000)
	else
		DelItem(2,1,30230,1)
	end
	if DelItem(nG,nD,nP,tCheck[nType][5]) == 1 then
		ModifyExp(tCheck[nType][4])
		Msg2Player("B¹n nhËn ®­îc "..tCheck[nType][4].." ®iªm kinh nghiÖm")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "®æi thµnh c«ng", 1, "§æi nguyªn liÖu lo¹i "..nType)
	end

end
function check_change_chuyensinh(nType)
	local tChange = {--Xu vËt phÈm, Thiªn Cang LÖnh, Thiªn M«n Kim LÖnh,  Vµng
					[1] = {777, 1, 0, 0},
					[2] = {777, 1, 1, 777},
			}
	if GetItemCount(2,1,30230) < tChange[nType][1] then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ 777 Xu vËt phÈm !!!!")
		return 0		
	end	
	if GetItemCount(2,95,204) < tChange[nType][2] then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ  1 Thiªn Cang LÖnh !!!!")
		return 0		
	end	
	if GetItemCount(2,1,30370) < tChange[nType][3] then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ 1 Thiªn m«n kim lÖnh !!!!")
		return 0		
	end	
	if GetCash() < tChange[nType][4]*10000 then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ 7770 vµng !!!!")
		return 0		
	end					
	return 1
end
function vng_restore_Meridian()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi thùc hiÖn ®­îc")
		return
	end	
	if MeridianGetLevel() < 1 then
		Talk(1,"", "§¹i hiÖp ch­a kÝch ho¹t kinh m¹ch nªn kh«ng thÓ thùc hiÖn tÈy ®iÓm ch©n khÝ !!!!")		
		return 0
	end
	if GetExp() < 200000000 then
		Talk(1,"", "§¹i hiÖp kh«ng ®ñ ®iÓm kinh nghiÖm ®Ó thùc hiÖn tÈy ®iÓm ch©n khÝ !!!!")		
		return 0
	end
	if GetItemCount(2,1,30230) < 2000 then
		Talk(1,"", "§¹i hiÖp kh«ng ®ñ 2000 Xu vËt phÈm ®Ó thùc hiÖn tÈy ®iÓm ch©n khÝ !!!!")		
		return 0	
	end
	if GetItemCount(2,1,30410) < 200 then
		Talk(1,"", "§¹i hiÖp kh«ng ®ñ 200 M¶nh Thiªn M«n ®Ó thùc hiÖn tÈy ®iÓm ch©n khÝ !!!!")		
		return 0	
	end
	if GetItemCount(2,1,30344) < 2 then
		Talk(1,"", "§¹i hiÖp kh«ng ®ñ 2 ThÇn Tµi B¶o R­¬ng ®Ó thùc hiÖn tÈy ®iÓm ch©n khÝ !!!!")		
		return 0	
	end		
	if DelItem(2,1,30230, 2000) == 1 and DelItem(2,1,30410, 200) == 1 and DelItem(2,1,30344, 2) == 1 then
		ModifyExp(-200000000)
		MeridianRestore()
		Talk(1,"", "§¹i hiÖp ®· ®­îc tÈy toµn bé ®iÓm ch©n khÝ vµ kinh m¹ch cã ®­îc. B©y giê ®¹i hiÖp cã thÓ t¨ng ®iÓm l¹i theo h­íng míi !!!!")		
		gf_WriteLogEx("TAY DIEM CHAN KHI", "tÈy ch©n khÝ thµnh c«ng", 1, "TÈy ®iÓm ch©n khÝ thµnh c«ng")
	else
		gf_WriteLogEx("TAY DIEM CHAN KHI", "tÈy ch©n khÝ thÊt b¹i", 1, "TÈy ®iÓm ch©n khÝ thÊt b¹i")	
		Talk(1,"", "§¹i hiÖp kh«ng ®ñ ®iÒu kiÖn ®Ó thùc hiÖn tÈy ®iÓm ch©n khÝ !!!!")		
		return 0			
	end
end
function get_quest_PhucSinh_BDH()
	local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
	if nGetQuest == 0 then
		SetTask(TSK_PET_PS_GIAIDOAN_B,1) --t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 1 lµ nhËn nhiÖm vô
		gf_WriteLogEx("PHUC SINH PET", "nhËn giai ®o¹n 1", 1, "NhËn Giai §o¹n 1")
		Msg2Player("§¹i hiÖp ®· nhËn nhiÖm vô Phôc Sinh Giai ®o¹n 1 cho B¹n §ång Hµnh !!!!")
	end
	nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.." <color=red>Hoµn thµnh Giai §o¹n 1 cÇn : <color>kÝch ho¹t 160 c©y tø linh, 160 b¸t nh· nhá, 30 lÇn Cóng TÕ, 30 lÇn TrÞ An, 30 lÇn Thñy Lîi, 30 lÇn LuyÖn §¬n"
	if nGetQuest == 1 then
		tinsert(tSay, "Hoµn thµnh giai ®o¹n 1 Phôc Sinh cho B¹n §ång Hµnh/finish_quest1_PhucSinh_BDH")
		tinsert(tSay, "Xem sè l­îng nhiÖm vô ®· hoµn thµnh/show_quest1_PhucSinh_BDH")
		tinsert(tSay, "Hç trî hoµn thµnh nhanh 2 giai ®o¹n nhiÖm vô Phôc Sinh/support_finish_quest_PhucSinh_BDH")
	end
	tinsert(tSay, "Ta chØ ghÐ qua th«i/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function finish_quest1_PhucSinh_BDH()
	local nActive_CT_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100),100)
	local nActive_TA_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10000),100)
	local nActive_TL_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/1000000),100)
	local nActive_LD_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100000000),100)
	local nActive_BNN_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000),1000)
	local nActive_CTL_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000000),1000)
	if nActive_CT_PET_PS < 30 or nActive_TA_PET_PS < 30 or nActive_TL_PET_PS < 30 or nActive_LD_PET_PS < 3 then
		Talk(1,"","§¹i hiÖp ch­a hoµn thµnh xong c¸c nhiÖm vô TrÞ Quèc B×nh Thiªn H¹ !!!!")
		return 0
	end
	if nActive_BNN_PET_PS < 160 or nActive_CTL_PET_PS < 160 then
		Talk(1,"","§¹i hiÖp ch­a hoµn thµnh kÝch ho¹t C©y Tø Linh hoÆc B¸t Nh· Nhá !!!!")
		return 0
	end
	---------------------
	local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
	if nGetQuest == 1 then 
		SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 2 lµ hoµn thµnh xong giai ®o¹n 1
		gf_WriteLogEx("PHUC SINH PET", "xong giai ®o¹n 1", 1, "Hoµn thµnh Giai §o¹n 1")
		Msg2Player("§¹i hiÖp ®· nhËn nhiÖm vô Phôc Sinh Giai ®o¹n 2 cho B¹n §ång Hµnh !!!!")
	end
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.." Chóc mõng ®¹i hiÖp <color=yellow>®· hoµn thµnh xong Giai §o¹n 1<color> Phôc Sinh cho B¹n §ång Hµnh. <color=red>Hoµn thµnh Giai §o¹n 2 cÇn : <color>B§H cÊp 4 (999 ®iÓm linh lùc), 500 thiªn th¹ch, 500 m¶nh thiªn th¹ch, 20 thiªn th¹ch tinh th¹ch, 20 b¨ng th¹ch, 2 hoµng kim ®¹i ng©n phiÕu, 2 hßa thÞ bÝch"

	tinsert(tSay, "Hoµn thµnh giai ®o¹n 2 Phôc Sinh cho B¹n §ång Hµnh/finish_quest2_PhucSinh_BDH")
	tinsert(tSay, "Hç trî hoµn thµnh nhanh 2 giai ®o¹n nhiÖm vô Phôc Sinh/support_finish_quest_PhucSinh_BDH")
	tinsert(tSay, "Ta chØ ghÐ qua th«i/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function finish_quest2_PhucSinh_BDH()
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nLinhLuc = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nPetLevel < 4 or nLinhLuc < 999 then
		Talk(1,"","B¹n ®ång hµnh ch­a ®¹t cÊp 4 hoÆc ®iÓm linh lùc kh«ng ®ñ 999 ®iÓm")
		return 
	end
--	local tbDieuKien = {nPetLinhluc = 999}
--	local nCheck = LIB_Award:CheckMaterial(tbDieuKien)
--	if nCheck == 0 then
--		return 0
--	end
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.." §¹i hiÖp h·y chän h­íng Phôc Sinh cho B¹n §ång Hµnh cña m×nh."
	tinsert(tSay, "Hç trî hÖ Néi C«ng/#way_change_PET(1,1)")
	tinsert(tSay, "Hç trî hÖ Ngo¹i C«ng/#way_change_PET(1,2)")
	tinsert(tSay, "Ta chØ ghÐ qua th«i/do_nothing")
	Say(tHeader, getn(tSay), tSay)	
end	
function way_change_PET(nType, nWay)
	local tCheck_item = {
									[1]	= {"Thiªn Th¹ch", 500,  2,2,8},
									[2]	= {"M¶nh Thiªn Th¹ch", 500 ,2,2,7},
									[3]	= {"Thiªn Th¹ch TInh Th¹ch", 20 ,2,1,1009},
									[4]	= {"B¨ng Th¹ch", 20, 2,1,149},
									[5]	= {"Hoµng Kim §¹i Ng©n PhiÕu", 2, 2,1,30490},
									[6]	= {"Hßa ThÞ BÝch", 2, 2,1,1001},
								}

	for i = 1, getn(tCheck_item) do
		if GetItemCount(tCheck_item[i][3], tCheck_item[i][4], tCheck_item[i][5]) < tCheck_item[i][2] then
			Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCheck_item[i][2].." "..tCheck_item[i][1])
			return 0
		end
	end	
	add_buff(nType,nWay) --Set c¸c chØ sè buff
end

function add_buff(nType, nWay)
	local tNoiNgoai = {
			 [1] = {
						{"Néi C«ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh Lùc +6000", "state_life_max_point_add", 8000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Kh¸ng tÊt c¶ +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo¹i C«ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh Lùc +6000", "state_life_max_point_add", 10000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Néi phßng/Ngo¹i phßng +60", "state_i_defence_point_add", 60},
						{"Ngo¹i phßng +60", "state_o_defence_point_add", 60},
					},
				}
	local tCheck_item = {
									[1]	= {"Thiªn Th¹ch", 500,  2,2,8},
									[2]	= {"M¶nh Thiªn Th¹ch", 500 ,2,2,7},
									[3]	= {"Thiªn Th¹ch TInh Th¹ch", 20 ,2,1,1009},
									[4]	= {"B¨ng Th¹ch", 20, 2,1,149},
									[5]	= {"Hoµng Kim §¹i Ng©n PhiÕu", 2, 2,1,30490},
									[6]	= {"Hßa ThÞ BÝch", 2, 2,1,1001},
								}

	local t_pet_type = {
									[1] = {"Thá tr¾ng",3333,24},
									[2] = {"Thá x¸m",3333,25},
									[3] = {"Thá ®en",3334,26},		
								}		
		-----------------xãa vËt phÈm: lo¹i 1 lµ lµm nv b×nh thuêng, lo¹i 2 lµ hç trî nhanh
		if nType == 1 then
				for i = 1, getn(tCheck_item) do
					if GetItemCount(tCheck_item[i][3], tCheck_item[i][4], tCheck_item[i][5]) < tCheck_item[i][2] then
						Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCheck_item[i][2].." "..tCheck_item[i][1])
						return 0
					end
				end	
				for i = 1, getn(tCheck_item) do
					if DelItem(tCheck_item[i][3], tCheck_item[i][4], tCheck_item[i][5], tCheck_item[i][2]) ~= 1 then
						gf_WriteLogEx("PHUC SINH PET", "Xãa thÊt b¹i", 1, "Xãa thÊt b¹i"..tCheck_item[i][1])
						return 0
					end
				end	
				local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) --task nhiÖm vô giai ®o¹n 1
				if nGetQuest == 2 then 
					SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 3 lµ hoµn thµnh xong giai ®o¹n 2
					gf_WriteLogEx("PHUC SINH PET", "xong giai ®o¹n 2", 1, "Hoµn thµnh Giai §o¹n 2")
				end
		end
		if nType == 2 then
				if GetItemCount(2,1,30490) < 39 then
					Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ 39 Hoµng Kim §¹i Ng©n PhiÕu.")
					return 0	
				end
				if GetCash() < 39000000 then
					Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ 3900 vµng.")
					return 0	
				end
				if DelItem(2,1,30490,39) ~= 1 then
						gf_WriteLogEx("PHUC SINH PET", "Xãa thÊt b¹i", 1, "Xãa thÊt b¹i khi hç trî nhanh")
						return 0
				end
				gf_WriteLogEx("PHUC SINH PET", "hoµn thµnh nhanh", 1, "Hç trî nhanh")	
				Pay(39000000)		
			SetTask(TSK_PET_PS_GIAIDOAN_A, 1601600000)
			SetTask(TSK_PET_PS_GIAIDOAN_B, 330303013)
		end	
		------------------------------
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 lµ gi¸ trÞ x¸c ®Þnh cã Phôc Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi¸ trÞ x¸c ®Þnh cã Phôc Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi¸ trÞ x¸c ®Þnh sè lÇn Phôc Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set h­íng Phôc Sinh cña PET
		-------------Set c¸c chØ sè buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET míi
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Chóc mõng ®¹i hiÖp ®· chiªu mé PET thµnh c«ng")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add thÊt b¹i", 1, "Add pet thÊt b¹i")			
		end
		-------------
		Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô Phôc Sinh cho B¹n §ång Hµnh !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai ®o¹n 2", 1, "Hoµn thµnh Giai §o¹n buff")			
end
function support_finish_quest_PhucSinh_BDH()
	if GetItemCount(2,1,30490) < 39 then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ 39 Hoµng Kim §¹i Ng©n PhiÕu.")
		return 0	
	end
	if GetCash() < 39000000 then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ 3900 vµng.")
		return 0	
	end
	support_finish_quest2_PhucSinh_BDH()
end
function support_finish_quest2_PhucSinh_BDH()
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nLinhLuc = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nPetLevel < 4 or nLinhLuc < 999 then
		Talk(1,"","B¹n ®ång hµnh ch­a ®¹t cÊp 4 hoÆc ®iÓm linh lùc kh«ng ®ñ 999 ®iÓm")
		return 
	end
--	local tbDieuKien = {nPetLinhluc = 999}
--	local nCheck = LIB_Award:CheckMaterial(tbDieuKien)
--	if nCheck == 0 then
--		return 0
--	end
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.." §¹i hiÖp h·y chän h­íng Phôc Sinh cho B¹n §ång Hµnh cña m×nh."
	tinsert(tSay, "Hç trî hÖ Néi C«ng/#add_buff(2,1)")
	tinsert(tSay, "Hç trî hÖ Ngo¹i C«ng/#add_buff(2,2)")
	tinsert(tSay, "Ta chØ ghÐ qua th«i/do_nothing")
	Say(tHeader, getn(tSay), tSay)	
end	
function get_more_pet(nType)
	local t_pet_type = {
									[1] = {"Thá tr¾ng",3333,24},
									[2] = {"Thá x¸m",3333,25},
									[3] = {"Thá ®en",3334,26},		
								}		
	local tCheck = {
							[1] = {150, 0},
							[2] = {0, 490}						
						}
	if GetItemCount(2,1,30230) < tCheck[nType][1] then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ 150 xu vËt phÈm.")
		return
	end	
	if GetCash() < tCheck[nType][2]*10000 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ 490 vµng.")
		return
	end	
	
	local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
	local nNewType = t_pet_type[nRand][3]
	local nResult = AddPet(nNewType)
	if nResult >= 0 then
		DelItem(2,1,30230,tCheck[nType][1])
		Pay(tCheck[nType][2]*10000)
		Msg2Player("Chóc mõng ®¹i hiÖp ®· chiªu mé PET thµnh c«ng")
		gf_WriteLogEx("PHUC SINH PET", "mua thµnh c«ng", 1, "Mua PET thµnh c«ng")
		if nType == 1 then
			WriteLogEx("LOG XU VAT PHAM","PET - Mua b»ng 150 xu")	
			gf_WriteLogEx("PHUC SINH PET", "mua thµnh c«ng", 1, "Mua b»ng 150 xu")		
		else
			WriteLogEx("PHUC SINH PET","PET - Mua b»ng 490 vµng")			
		end
	else
		Talk(1, "", "§¹i hiÖp ®ang cã qu¸ nhiÒu B¹n ®ång hµnh, nªn kh«ng thÓ chiªu mé thªm ®­îc n÷a")
		gf_WriteLogEx("PHUC SINH PET BK", "mua thÊt b¹i", 1, "Mua pet thÊt b¹i")			
	end
end
function show_quest1_PhucSinh_BDH()
	local nActive_CT_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100),100)
	local nActive_TA_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10000),100)
	local nActive_TL_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/1000000),100)
	local nActive_LD_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100000000),100)
	local nActive_BNN_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000),1000)
	local nActive_CTL_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000000),1000)
	Talk(1,"","TiÕn ®é thùc hiÖn nhiÖm vô !!!! \nC©y Tø Linh: <color=red>"..nActive_CTL_PET_PS.."/160<color> \nB¸t Nh· Nhá: <color=red>"..nActive_BNN_PET_PS.."/160<color> \nCóng TÕ: <color=red>"..nActive_CT_PET_PS.."/30<color> \nTrÞ An: <color=red>"..nActive_TA_PET_PS.."/30<color> \nThñy Lîi: <color=red>"..nActive_TL_PET_PS.."/30<color> \nLuyÖn §¬n: <color=red>"..nActive_LD_PET_PS.."/3<color>")
end


function NhanKhuatNguyenBoi_Free()
	if  gf_GetTaskBit(TSK_XOA_KHUATNGUYENBOI,1) ~= 1 then
		return 0
	end
	if gf_GetTaskBit(TSK_XOA_KHUATNGUYENBOI,2) ~= 0 then
		return 0
	end
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return 0
	end
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	if nChuyenSinh < 5 then
		return 0
	end
	
	gf_SetTaskBit(TSK_XOA_KHUATNGUYENBOI, 2, 1, 0)
	gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","NHAN LAI KHUAT NGUYEN BOI","nhËn",30*24*3600,1)
end


function do_nothing()

end