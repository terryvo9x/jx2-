-- Event ®ua top
-- Created by TuanNA5
--Edited By PhucNG
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\vng\\newserver\\hoatdong.lua");

strNpcName = "<color=green>Hoµng Hæ <color>: "
szLogTitle = "Top Hoang Ho"
szStartDate = "28-08-2016"
szEndDate = "10-10 -2016"
szServerName = "Hoµng Hæ"

function main()
	local nDate = tonumber(date("%Y%m%d"))
	local nPlayerRoute = GetPlayerRoute()
--	if GetCreateTime() <= TOP_CREATED_ROLE then
--		Talk(1,"",strNpcName.."Thêi gian t¹o tµi kho¶n kh«ng hîp lÖ nªn kh«ng thÓ nhËn th­ëng!")
--		return
--	end

	if GetGlbValue(GLB_TSK_SERVER_ID) ~= TOP_SERVER_ID or GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR) ~= TOP_SERVER_ID then
		Talk(1,"",strNpcName.."Ng­¬i kh«ng ph¶i thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return
	end
	local tSay = {}
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		if nPlayerRoute == 25 or nPlayerRoute == 26 or nPlayerRoute == 27 then
			tinsert(tSay,"NhËn phÇn th­ëng dµnh riªng Minh Gi¸o Ph¸i/get_award_minhgiao")
			tinsert(tSay,"NhËn th­ëng Top 3 cao thñ Minh Gi¸o Ph¸i ®¹t ChuyÓn Sinh 7 CÊp 97/get_award_top3_minhgiaocs7")
		end
		tinsert(tSay,"NhËn phÇn th­ëng theo ®¼ng cÊp/get_award_by_level")
--		tinsert(tSay,"NhËn th­ëng l­u ph¸i Thóy Yªn Linh N÷ cÊp 92-99/get_route_award_by_level_menu")
		tinsert(tSay,"NhËn th­ëng 1 cao thñ ®Çu tiªn ®¹t 3.500.000 ®iÓm c«ng tr¹ng/confirm_get_top_mil_Hornor_award")
--		tinsert(tSay,"NhËn phÇn th­ëng ¦u ®·i server " .. szServerName .. "/Say_NhanUuDai")
		tinsert(tSay,"NhËn phÇn th­ëng cao thñ Top 1 mçi hÖ ph¸i/get_top_faction_award")
		tinsert(tSay,"NhËn phÇn th­ëng 2 nh©n sÜ ®Çu tiªn mçi phe ®¹t 2.800.000 c«ng tr¹ng/confirm_get_top_Hornor_award")
		--tinsert(tSay,"§¨ng ký nhËn th­ëng top 10 chuyÓn sinh 6 cÊp 99/#CS_TopAward(6)")
		tinsert(tSay,"§¨ng ký nhËn th­ëng top 3 chuyÓn sinh 7 cÊp 90/#CS_TopAward(7)")
--		tinsert(tSay,"§¨ng ký nhËn th­ëng top 100 chuyÓn sinh 3 cÊp 99/#CS_TopAward(3)")
--		tinsert(tSay,"Ho¹t ®éng "..szServerName.."/NewServer_HoatDong_Menu")
	end
	tinsert(tSay,"Bang héi danh gi¸/TopBangHoi_Menu")
	tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng top hÖ ph¸i/get_top_faction_info")
	tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng top 3 chiÕn tr­êng/get_top_nation_info")
--	tinsert(tSay,"Xem t×nh h×nh ®¨ng ký nhËn th­ëng mËt tÞch/get_top100_award_info")
--	tinsert(tSay,"Ph¸t th­ëng bang héi/PhatThuongBangHoi")
	tinsert(tSay,"Ta biÕt råi/dlgover")	
	
	if nDate >= TOP_START_DATE then
		local strSay = strNpcName.."Ho¹t ®éng <color=yellow>Truy C«ng L·nh Th­ëng<color> diÔn ra tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt quý ®ång ®¹o vui lßng xem t¹i <color=blue>http://volam2.zing.vn<color>"
		Say(strSay,getn(tSay),tSay)
	end
end

function confirm_get_top_mil_Hornor_award()
	local tSay = {
			"NhËn th­ëng ®¹t 3.500.000 ®iÓm Qu©n Hµm Nguyªn So¸i/confirm_get_1mil_Hornor_award",
			--"NhËn th­ëng ®¹t 3.500.000 ®iÓm Qu©n Hµm T­íng Qu©n/confirm_get_2mil_Hornor_award",
			"Ta chØ ghÐ qua/dlgover",
	}
	Say(szNpcName.."Ta chuyªn phô tr¸ch c¸c ho¹t ®éng nhËn th­ëng. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end

function get_award_top3_minhgiaocs7()
	local nRoute = GetPlayerRoute()
	if nRoute == 0 or nRoute < 25 and nRoute >= 28 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i hoÆc kh«ng ph¶i HÖ ph¸i Minh Gi¸o kh«ng thÓ nhËn th­ëng.");
		return
	end

	if gf_GetTransLevel() < 797 then
		Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ chuyÓn sinh 7 cÊp 97, kh«ng thÓ nhËn th­ëng.");
		return
	end
--	if CheckMaxSkill55() == 0 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a häc ®Çy ®ñ vâ c«ng cÊp 55, kh«ng thÓ nhËn th­ëng.");
--		return
--	end
--	if gf_GetTaskByte(TSK_TOP_AWARD,100) > 1 then
--		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
--		return
--	end	
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MGCS7) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng top 3 Minh Gi¸o ChuyÓn sinh 7 cÊp 97 råi.");
		return 
	end
	
	
	LIB_txtData:Init("top_cs7_minhgiao.txt")
	LIB_txtData:LoadData()
	local nFactionRank = LIB_txtData.tbTextData[tonumber(1)]
	if nFactionRank >= 3 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy ®· cã chñ nh©n!");
		return		
	end
	local nRoute = GetPlayerRoute()
	if LIB_txtData:AddValue(tonumber(1),1,3) == 1 then
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		-- Bit 1 nhËn phÇn th­ëng chuyÓn sinh 1
		--local nAwardOrder = tonumber(gf_GetTaskByte(TSK_TOP_AWARD,100))+1
		--gf_SetTaskByte(TSK_TOP_AWARD,100,nAwardOrder)
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_MGCS7,1)
		local nItemLevel = 0
		
		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2, 1, 30814, 1, 4},"Phôc Sinh §¬n","Top nv cs7 cap 97 Minh Giao","nhËn")
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30970,1,1},"Trøng B¸ Ng¹c","Top nv cs7 cap 97 Minh Giao","nhËn")
	end
end


function get_award_minhgiao()
	local tSay = {}
	tSay[0] = strNpcName.."Trong thêi gian tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng."
	--for i=1,getn(tb_topserver_award_limit_minhgiao) do
	--	if tb_topserver_award_limit_minhgiao[i] ~= nil then
			if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP595) < 1  then
				tinsert(tSay, "Ta muèn nhËn phÇn th­ëng cÊp ®é CS5 Lv95/#conf_get_award_by_level_minhgiao(1)")
			end
			if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP695) < 1  then
				tinsert(tSay, "Ta muèn nhËn phÇn th­ëng cÊp ®é CS6 Lv95/#conf_get_award_by_level_minhgiao(2)")
			end
			if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP699) < 1  then
				tinsert(tSay, "Ta muèn nhËn phÇn th­ëng cÊp ®é CS6 Lv99/#conf_get_award_by_level_minhgiao(3)")
			end
			if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP795) < 1  then
				tinsert(tSay, "Ta muèn nhËn phÇn th­ëng cÊp ®é CS7 Lv95/#conf_get_award_by_level_minhgiao(4)")
			end
	--	end
	--end
	local nDate = tonumber(date("%Y%m%d"));	
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		gf_PageSay(tSay, 1, 6)
	else
		Talk(1,"",strNpcName.."Ho¹t ®éng ®· kÕt thóc!")
	end			
end

function conf_get_award_by_level_minhgiao(nType)
	local nRoute = GetPlayerRoute()
	local nLevel = gf_GetTransLevel();
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if nType == 1 then
		if nLevel < 595 then
			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ CS5 Lv 95, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP595) >= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
			return
		end	
	elseif nType == 2 then
		if nLevel < 695 then
			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ CS6 Lv 95, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP695) >= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
			return
		end	
	elseif nType == 3 then
		if nLevel < 699 then
			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ CS6 Lv 99, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP699) >= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
			return
		end	
	elseif nType == 4 then
		if nLevel < 795 then
			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ CS7 Lv 95, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP795) >= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
			return
		end	
	else
		Talk(1, "", strNpcName.."Error!.");
			return
	end
	
	--if gf_GetTransLevel() < nLevel then
	--	Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ "..nLevel..", kh«ng thÓ nhËn th­ëng.");
	--	return
	--end
--	if CheckMaxSkill55() == 0 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a häc ®Çy ®ñ vâ c«ng cÊp 55, kh«ng thÓ nhËn th­ëng.");
--		return
--	end
	
--	local nAwardLevel = TopCheckLevelMinhGiao()
--	if nAwardLevel == 0 or nAwardLevel < nLevel then
--		Talk(1, "", strNpcName.."Kh«ng ®ñ ®iÒu kiÖn nhËn phÇn th­ëng nµy. Vui lßng kiÓm tra l¹i c¸c ®iÒu kiÖn ®¼ng cÊp, danh väng, s­ m«n, c«ng tr¹ng hoÆc c¸c h¹ ch­a nhËn c¸c phÇn th­ëng tr­íc.");
--		return 0
--	end
	warning_get_award_by_level_minhgiao(nType); --, nAwardLevel);
end

-- Truy c«ng l·nh th­ëng theo ®¼ng cÊp
function warning_get_award_by_level_minhgiao(nType) --, nLevel)
	Say("X¸c nhËn muèn nhËn phÇn th­ëng nµy",
		2,
		"Ta muèn nhËn /#confirm_conf_get_award_by_level_minhgiao("..nType..")",
		"§Ó ta suy nghÜ l¹i./dlgover");
end


-- Truy c«ng l·nh th­ëng theo ®¼ng cÊp
function confirm_conf_get_award_by_level_minhgiao(nType)
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	-- Check quèc tÞch
	if nNationality ~= nNation then
		Talk(1, "", "Ng­¬i kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return
	end
	
	-- Check hµnh trang
	if gf_Judge_Room_Weight(10,500)~=1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return
	end
	
	if gf_GetTransLevel() < 595 then
		Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ chuyÓn sinh 5 cÊp 95, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if nType == 1 then
		if gf_GetTransLevel() < 595 then
			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ CS5 Lv 95, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP595) >= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
			return
		end	
	elseif nType == 2 then
		if gf_GetTransLevel() < 695 then
			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ CS6 Lv 95, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP695) >= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
			return
		end	
	elseif nType == 3 then
		if gf_GetTransLevel() < 699 then
			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ CS6 Lv 99, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP699) >= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
			return
		end	
	elseif nType == 4 then
		if gf_GetTransLevel() < 795 then
			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ CS7 Lv 95, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP795) >= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
			return
		end	
	else
		Talk(1, "", strNpcName.."Error!.");
			return
	end
	
	local nRoute = GetPlayerRoute()
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if nRoute < 25 and nRoute > 27 then
		Talk(1, "", strNpcName.."HÖ ph¸i cña c¸c h¹ kh«ng ph¶i lµ Minh Gi¸o Ph¸i.");
		return
	end
	
--	if GetReputation() < 100 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ 100 ®iÓm Danh väng.");
--		return
--	end
--
--	if GetTask(336) < 50 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ 50 ®iÓm S­ m«n.");
--		return
--	end
	
	local nRet, nItemIdx = 0,0	
	-- if nLevel == 83 then
		-- if GetCash() < 9990000 then
			-- Talk(1, "", strNpcName.."C¸c h¹ kh«ng cã ®ñ 999 vµng.");
			-- return 0
		-- end
	-- end
	
	
	-- Trao thuong
	--local nAwardOrder = tonumber(gf_GetTaskByte(TSK_TOP_AWARD,99))+1
	--gf_SetTaskByte(TSK_TOP_AWARD,99,nAwardOrder)
	--local nAwardOrder = GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_MG_CAP595) + 1
	
	--SetTask(TSK_TOP_LEVEL,GetTask(TSK_TOP_LEVEL) + 1)
	--if nLevel == 83 then
	--	Pay(9990000)
	--end
	local nLv = 0
	if nType == 1 then
		nLv = 595
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_MG_CAP595,1)
	elseif nType == 2 then
		nLv = 695
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_MG_CAP695,1)
	elseif nType == 3 then
		nLv = 699
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_MG_CAP699,1)
	elseif nType == 4 then
		nLv = 795
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_MG_CAP795,1)
	else
		Talk(1, "", strNpcName.."Error!!!.");
		return
	end
	
	 for i=1,getn(tb_topserver_award_item_minhgiao[nLv]) do
		 local tb_item = {}
		 tb_item = tb_topserver_award_item_minhgiao[nLv][i]
		 if tb_item[1] == 1 then -- item
			 if tb_item[4] == 0 then
				 gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nhËn th­ëng cÊp "..nLv)
			 elseif tb_item[4] > 0 then
		 		 gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nhËn th­ëng cÊp "..nLv, tb_item[4])
		 	 end
		 elseif tb_item[1] == 2 then -- command
			 dostring(format(tb_item[2],tb_item[3]))
			 WriteLogEx(szLogTitle,"nhËn th­ëng cÊp "..nLv,tb_item[3],tb_item[2])
		 elseif tb_item[1] == 3 then -- table
			 local tb_Award = tb_item[2]
			 if tb_item[4] == 0 then
				 gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nhËn th­ëng cÊp "..nLv)			
			 elseif tb_item[4] > 0 then
		 		 gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nhËn th­ëng cÊp "..nLv, tb_item[4])
		 	 end
		 	 -- Chän vò khÝ ViÖt Yªn cho TL tôc gia
		 	 --if nRoute == 2 and nLevel == 292 then
		 	--	 Say("Ta cã 2 mãn vò khÝ dµnh cho c¸c h¹, h·y chän vò khÝ phï hîp:", 2, "ViÖt Yªn Phi Tinh §ao/#ChonVuKhiThieuLam(1)", "ViÖt Yªn Phi Tinh C«n/#ChonVuKhiThieuLam(2)")
		 	-- end
		 else
			 Talk(1, "", strNpcName.."§¼ng cÊp kh«ng ®óng!");
			 WriteLogEx(szLogTitle,"®¼ng cÊp kh«ng ®óng???");
			 return
		 end
	 end
	--gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"Hßa ThÞ BÝch (7 Ngµy)","Top nv cs6 cap 96","nhËn",7*24*3600,1)
	-- if nLevel >= 696 and nLevel < 796 then
		-- gf_AddItemEx2({2,1,1001,2},"Hßa ThÞ BÝch (7 Ngµy)","Top nv cs6 cap 96","nhËn",7*24*3600,1)
		-- gf_AddItemEx2({2,1,30368,200},"Cæ Linh Th¹ch","Top nv cs6 cap 96","nhËn")
		-- gf_AddItemEx2({2,1,30369,200},"Cæ Linh Ngäc","Top nv cs6 cap 96","nhËn")
		-- AwardGenuineQi(80000)
	-- elseif  nLevel >= 796 then
		-- gf_AddItemEx2({2,1,1001,2},"Hßa ThÞ BÝch (7 Ngµy)","Top nv cs7 cap 96","nhËn",7*24*3600,1)
		-- gf_AddItemEx2({2,1,30368,300},"Cæ Linh Th¹ch","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({2,1,30369,300},"Cæ Linh Ngäc","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({2,95,204,1},"Thiªn Cang LÖnh","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({2,1,30370,1},"Thiªn M«n Kim LÖnh","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({2,1,30668,16},"Tinh Hoa UÈn Linh CÊp 6","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({0,112,158,1},"L¨ng Ba Vi Bé toµn tËp","Top nv cs7 cap 96","nhËn")
		-- AwardGenuineQi(100000)
	-- end
	
	--local szChuyensinh = " "
	--if floor(nLv/100)>0 then
	--	local szChuyensinh = " (chuyÓn sinh "..floor(nLv/100)..")"
	--end
	Say(strNpcName.."Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng "..nLv ,0)
end


function get_award_by_level()
	local tSay = {}
	tSay[0] = strNpcName.."Trong thêi gian tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng."
	for i=1,getn(tb_topserver_award_limit) do
		if tb_topserver_award_limit[i] ~= nil then
			if tb_topserver_award_limit[i][4] >= gf_GetTaskByte(TSK_TOP_LEVEL,1)  then
				tinsert(tSay, "Ta muèn nhËn phÇn th­ëng cÊp ®é "..i.."/#conf_get_award_by_level("..i..")")
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"));	
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		gf_PageSay(tSay, 1, 6)
	else
		Talk(1,"",strNpcName.."Ho¹t ®éng ®· kÕt thóc!")
	end			
end


-- Truy c«ng l·nh th­ëng theo ®¼ng cÊp
function conf_get_award_by_level(nLevel)
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if gf_GetTransLevel() < nLevel then
		Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ "..nLevel..", kh«ng thÓ nhËn th­ëng.");
		return
	end
--	if CheckMaxSkill55() == 0 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a häc ®Çy ®ñ vâ c«ng cÊp 55, kh«ng thÓ nhËn th­ëng.");
--		return
--	end
	if gf_GetTaskByte(TSK_TOP_LEVEL,1) > tb_topserver_award_limit[nLevel][4] then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
		return
	end	
	local nAwardLevel = TopCheckLevel()
	if nAwardLevel == 0 or nAwardLevel < nLevel then
		Talk(1, "", strNpcName.."Kh«ng ®ñ ®iÒu kiÖn nhËn phÇn th­ëng nµy. Vui lßng kiÓm tra l¹i c¸c ®iÒu kiÖn ®¼ng cÊp, danh väng, s­ m«n, c«ng tr¹ng hoÆc c¸c h¹ ch­a nhËn c¸c phÇn th­ëng tr­íc.");
		return 0
	end
	warning_get_award_by_level(nLevel); --, nAwardLevel);
end


-- Truy c«ng l·nh th­ëng theo ®¼ng cÊp
function warning_get_award_by_level(nWantLevel) --, nLevel)
	Say("X¸c nhËn muèn nhËn phÇn th­ëng nµy",
		2,
		"Ta muèn nhËn /#confirm_conf_get_award_by_level("..nWantLevel..")",
		"§Ó ta suy nghÜ l¹i./dlgover");
end


-- Truy c«ng l·nh th­ëng theo ®¼ng cÊp
function confirm_conf_get_award_by_level(nLevel)
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	-- Check quèc tÞch
	if nNationality ~= nNation then
		Talk(1, "", "Ng­¬i kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return
	end
	
	-- Check hµnh trang
	if gf_Judge_Room_Weight(10,500)~=1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return
	end
	
	if gf_GetTransLevel() < 696 then
		Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ chuyÓn sinh 6 cÊp 96, kh«ng thÓ nhËn th­ëng.");
		return
	end
	if gf_GetTaskByte(TSK_TOP_LEVEL,1) ~= tb_topserver_award_limit[nLevel][4] then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
		return
	end
	local nRoute = GetPlayerRoute()
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
--	if GetReputation() < 100 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ 100 ®iÓm Danh väng.");
--		return
--	end
--
--	if GetTask(336) < 50 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ 50 ®iÓm S­ m«n.");
--		return
--	end
	
	local nRet, nItemIdx = 0,0	
	-- if nLevel == 83 then
		-- if GetCash() < 9990000 then
			-- Talk(1, "", strNpcName.."C¸c h¹ kh«ng cã ®ñ 999 vµng.");
			-- return 0
		-- end
	-- end
	
	-- Bæ sung ®iÒu kiÖn cho c¸c Level sau
	if nLevel >= 696 and nLevel < 796 then
		--if GetReputation() < 3000 then
		--	Talk(1,"","C¸c h¹ kh«ng ®ñ 3000 ®iÓm danh väng")
		--	return
		--end
		--if GetTask(336) < 3000 then
		--	Talk(1,"","C¸c h¹ kh«ng ®ñ 3000 ®iÓm danh väng s­ m«n.")
		--	return
		--end
		-- if GetItemCount(2,1,30230) < 500 then
			-- Talk(1,"","C¸c h¹ kh«ng ®ñ 500 xu vËt phÈm nhËn th­ëng.")
			-- return
		-- end
		--if GetExp() < 300000000 then
		--	Talk(1,"","C¸c h¹ kh«ng ®ñ ®iÓm kinh nghiÖm nhËn th­ëng.")
		--	return
		--end
	 elseif nLevel >= 796 then
		-- if TopCheckSkill(tFactionSkillInfo,20) == 0 then
			-- Talk(1, "", strNpcName.."C¸c h¹ ch­a luyÖn thµnh vâ c«ng trÊn ph¸i 20 cÊp.");
			-- return 0
		-- end
		-- if GetReputation() < 3000 then
		--	 Talk(1,"","C¸c h¹ kh«ng ®ñ 3000 ®iÓm danh väng")
		--	 return
		-- end
		-- if GetTask(336) < 3000 then
		--	 Talk(1,"","C¸c h¹ kh«ng ®ñ 3000 ®iÓm danh väng s­ m«n.")
		--	 return 0
		 --end
		 if GetItemCount(2,1,30230) < 500 then
		 Talk(1,"","C¸c h¹ kh«ng ®ñ 500 xu vËt phÈm nhËn th­ëng.")
			return
		 end
		-- if GetCash() < 500000 then
			-- Talk(1, "", strNpcName.."C¸c h¹ kh«ng cã ®ñ 50 vµng.");
			-- return 0
		-- end
	end
	
	-- Trao thuong
	local nAwardOrder = tonumber(gf_GetTaskByte(TSK_TOP_LEVEL,1))+1
	gf_SetTaskByte(TSK_TOP_LEVEL,1,nAwardOrder)
	--SetTask(TSK_TOP_LEVEL,GetTask(TSK_TOP_LEVEL) + 1)
	--if nLevel == 83 then
	--	Pay(9990000)
	--end
	
	if nLevel >= 696 and nLevel < 796 then
		--ModifyReputation(-3000,0)
		--SetTask(336, GetTask(336) - 3000)
		--Msg2Player("B¹n bÞ trõ 3000 ®iÓm s­ m«n!")
		--ModifyExp(-300000000)
		--Msg2Player("B¹n bÞ trõ 300.000.000 ®iÓm kinh nghiÖm!")
	elseif  nLevel >= 796 then
		DelItem(2,1,30230,500)
		Msg2Player("B¹n bÞ trõ 500 xu vËt phÈm!")
		--ModifyReputation(-3000,0)
		--SetTask(336, GetTask(336) - 3000)
		--Msg2Player("B¹n bÞ trõ 3000 ®iÓm s­ m«n!")
		--Pay(500000)
	end
	
	 for i=1,getn(tb_topserver_award_item[nLevel]) do
		 local tb_item = {}
		 tb_item = tb_topserver_award_item[nLevel][i]
		 if tb_item[1] == 1 then -- item
			 if tb_item[4] == 0 then
				 gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nhËn th­ëng cÊp "..nLevel)
			 elseif tb_item[4] > 0 then
		 		 gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nhËn th­ëng cÊp "..nLevel, tb_item[4])
		 	 end
		 elseif tb_item[1] == 2 then -- command
			 dostring(format(tb_item[2],tb_item[3]))
			 WriteLogEx(szLogTitle,"nhËn th­ëng cÊp "..nLevel,tb_item[3],tb_item[2])
		 elseif tb_item[1] == 3 then -- table
			 local tb_Award = tb_item[2]
			 if tb_item[4] == 0 then
				 gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nhËn th­ëng cÊp "..nLevel)			
			 elseif tb_item[4] > 0 then
		 		 gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nhËn th­ëng cÊp "..nLevel, tb_item[4])
		 	 end
		 	-- -- Chän vò khÝ ViÖt Yªn cho TL tôc gia
		 	-- if nRoute == 2 and nLevel == 292 then
		 		-- Say("Ta cã 2 mãn vò khÝ dµnh cho c¸c h¹, h·y chän vò khÝ phï hîp:", 2, "ViÖt Yªn Phi Tinh §ao/#ChonVuKhiThieuLam(1)", "ViÖt Yªn Phi Tinh C«n/#ChonVuKhiThieuLam(2)")
		 	-- end
		 else
			 Talk(1, "", strNpcName.."§¼ng cÊp kh«ng ®óng!");
			 WriteLogEx(szLogTitle,"®¼ng cÊp kh«ng ®óng???");
			 return
		 end
	 end
	--gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"Hßa ThÞ BÝch (7 Ngµy)","Top nv cs6 cap 96","nhËn",7*24*3600,1)
	-- if nLevel >= 696 and nLevel < 796 then
		-- gf_AddItemEx2({2,1,1001,2},"Hßa ThÞ BÝch (7 Ngµy)","Top nv cs6 cap 96","nhËn",7*24*3600,1)
		-- gf_AddItemEx2({2,1,30368,200},"Cæ Linh Th¹ch","Top nv cs6 cap 96","nhËn")
		-- gf_AddItemEx2({2,1,30369,200},"Cæ Linh Ngäc","Top nv cs6 cap 96","nhËn")
		-- AwardGenuineQi(80000)
	-- elseif  nLevel >= 796 then
		-- gf_AddItemEx2({2,1,1001,2},"Hßa ThÞ BÝch (7 Ngµy)","Top nv cs7 cap 96","nhËn",7*24*3600,1)
		-- gf_AddItemEx2({2,1,30368,300},"Cæ Linh Th¹ch","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({2,1,30369,300},"Cæ Linh Ngäc","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({2,95,204,1},"Thiªn Cang LÖnh","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({2,1,30370,1},"Thiªn M«n Kim LÖnh","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({2,1,30668,16},"Tinh Hoa UÈn Linh CÊp 6","Top nv cs7 cap 96","nhËn")
		-- gf_AddItemEx2({0,112,158,1},"L¨ng Ba Vi Bé toµn tËp","Top nv cs7 cap 96","nhËn")
		-- AwardGenuineQi(100000)
	-- end
	
	local szChuyensinh = " "
	if floor(nLevel/100)>0 then
		local szChuyensinh = " (chuyÓn sinh "..floor(nLevel/100)..")"
	end
	Say(strNpcName.."Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng "..mod(nLevel,100).." "..szChuyensinh,0)
end

--Chän Vò khÝ ThiÕu L©m
function ChonVuKhiThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2({0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,13},"ViÖt Yªn Phi Tinh §ao",1)
	else
		gf_AddItemEx2({0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,13},"ViÖt Yªn Phi Tinh C«n",1)
	end
end


---- NhËn th­ëng top chuyÓn sinh theo m«n ph¸i  ----------
function get_top_faction_award()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then	
		Say(strNpcName.."NhËn phÇn th­ëng cao thñ hoµn thµnh <color=red>ChuyÓn sinh 6 cÊp 99<color> ®Çu tiªn (theo hÖ ph¸i)",
			2,
			"Ta muèn nhËn/confirm_get_top_faction_award",
			"§Ó ta suy nghÜ l¹i./dlgover");
	else
		Talk(1,"",strNpcName.."Ho¹t ®éng ®· kÕt thóc!")
	end
end

--- NhËn th­ëng top 1 hÖ ph¸i ----
function confirm_get_top_faction_award()
	-- Dieu kien nhan thuong
	local nMonPhai = GetPlayerRoute()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	local nPhucSinh = GetPlayerRebornParam(0)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + nPhucSinh
	local tbRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[25]=1,[26]=1,[27]=1,[29]=1,[30]=1}
	if nNationality ~= nNation then
		Talk(1, "", strNpcName .. "C¸c h¹ kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if tbRoute[nMonPhai] ~= 1 then
		Talk(1,"",strNpcName .. "C¸c h¹ ch­a chän hÖ ph¸i nªn kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_TRANSLIFE1) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng top 1 theo hÖ ph¸i råi.");
		return 0
	end
	
	if nChuyenSinh < 6 then
		Talk(1,"",strNpcName .. "HiÖn t¹i c¸c h¹ ch­a phôc sinh ®ñ 6 lÇn. Xin c¸c h¹ quay l¹i sau!")
		return 0
	end
	
	if GetLevel() < 99 then
		Talk(1, "", strNpcName .. "C¸c h¹ h·y phÊn ®Êu lªn cÊp ®é 99 råi quay l¹i nhÐ!");
		return 0
	end
	
	if nRep < 50000 or nFaction < 50000 or nHor < 1800000  then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn danh väng, s­ m«n, c«ng tr¹ng.");
		return 0
	end

	if GetItemCount(2,1,30230) < 10000 then
		Talk(1,"",strNpcName .. "C¸c h¹ kh«ng ®em ®ñ 10.000 xu vËt phÈm.")
		return 0
	end
		
--	if TopCheckSkill(tFactionSkillInfo,20) == 0 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a luyÖn thµnh vâ c«ng trÊn ph¸i 20 cÊp.");
--		return	
--	end

	if gf_Judge_Room_Weight(25, 300, strNpcName) == 0 then
		Talk(1,"",strNpcName .. "Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end	

	
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local nFactionRank = LIB_txtData.tbTextData[tonumber(nMonPhai)]
	if nFactionRank >= 1 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy ®· cã chñ nh©n!");
		return		
	end
	local nRoute = GetPlayerRoute()
	if LIB_txtData:AddValue(tonumber(nMonPhai),1,5) == 1 then
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		-- Bit 1 nhËn phÇn th­ëng chuyÓn sinh 1
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_TRANSLIFE1,1)
		local nItemLevel = 0
		DelItem(2,1,30230,10000)
		
		--MËt tÞch cÊp 70
		TraoMatTichCaoCap20(2,nRoute)
		-- Phuc sinh ®¬n (100/100)
		AddItem(2,1,30814,1)
		--Kim ng­u b¶o b¶o
		local tbBachHo = {
			item = {
				{gdp = {0,105,30025,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name = "B¹ch Hæ B¶o B¶o"},
			}	
		}
		LIB_Award:Award(tbBachHo)			
		
		award_new_gem2_32()
		award_new_gem3_32()
		award_new_gem4_32()
		award_lenh_bai_haohiep_voha()
		
		local tbSay = {}		
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ V©n Du/#receive_KimXa_top1_faction(1)")
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ ThiÕt HuyÕt/#receive_KimXa_top1_faction(2)")
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ Du HiÖp/#receive_KimXa_top1_faction(3)")
		Say(strNpcName.."C¸c h¹ h·y lùa chän 1 trong 3 bé trang bÞ Kim Xµ: ",getn(tbSay),tbSay)
		--Talk(1,"","NhËn thµnh c«ng phÇn th­ëng h¹ng "..(nFactionRank+1).." m«n ph¸i "..tb_Route_Name[tonumber(nMonPhai)] .. ".")
	end
end

function receive_KimXa_top1_faction(nChoice)
	
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaVanDu)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ V©n Du")
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaThietHuyet)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ ThiÕt HuyÕt")
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDuHiep)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ Du HiÖp")
	end	
	
	receive_DieuDuong_Top1_faction_01(0,1)
end

function receive_DieuDuong_Top1_faction_01(nType,nReceive)
	local nType = nType or 0
	local nReceive = nReceive or 1
	tbSay = {}
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(Søc M¹nh)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",1,nType,nReceive))
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(Th©n Ph¸p)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",2,nType,nReceive))
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(Néi C«ng)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",3,nType,nReceive))
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(Linh Ho¹t)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",4,nType,nReceive))
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(G©n Cèt)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",5,nType,nReceive))
	Say("C¸c h¹ h·y lùa chän 2 trong 5 mãn sau: ",getn(tbSay),tbSay)
end

function receive_DieuDuong_Top1_faction_02(nChoice,nType,nReceive)
	
	tbDieuDuong = {
		item = {
			[1] = {gdp={0,102,3190,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
			[2] = {gdp={0,102,3191,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
			[3] = {gdp={0,102,3192,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
			[4] = {gdp={0,102,3193,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
			[5] = {gdp={0,102,3194,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
		}
	}	
	
	if nChoice == 1 then
		if nReceive == 2 then
			if nType == 1 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(1,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3190,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				Msg2Player("C¸c h¹ nhËn th­ëng thµnh c«ng phÇn th­ëng Top 1 m«n ph¸i!")
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3190,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(1,2)
		end
	end
	
	if nChoice  == 2 then
		if nReceive == 2 then
			if nType == 2 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(2,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3191,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3191,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(2,2)
		end
	end
	
	if nChoice  == 3 then
		if nReceive == 2 then
			if nType == 3 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(3,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3192,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3192,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(3,2)
		end
	end
	
	if nChoice  == 4 then
		if nReceive == 2 then
			if nType == 4 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(4,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3193,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3193,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(4,2)
		end
	end
	
	if nChoice  == 5 then
		if nReceive == 2 then
			if nType == 5 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(5,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3194,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3194,1,4,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(5,2)
		end
	end
	
end

-- NhËn th­ëng top c«ng tr¹ng
function confirm_get_top_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevelNew = gf_GetTransLevel() or 0
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C¸c h¹ kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if nLevelNew < 699 then --if nPhucSinh < 1 or GetLevel() < 99 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn phôc sinh cÊp ®é 99 tro len!")
		return 0
	end
	
	if abs(nHor) < 2800000  then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn c«ng tr¹ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 5 then
		Talk(1,"",strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn thuëng. Vui lßng kiÓm tra ®iÒu kiÖn Qu©n hµm.");
		return
	end
	
	if GetItemCount(2,1,30230) < 9000 then
		Talk(1,"", strNpcName.."C¸c h¹ kh«ng ®em ®ñ 9000 xu vËt phÈm, hay lµ ®· ®Ó quªn trong r­¬ng?")
		return
	end
	
	if gf_Judge_Room_Weight(20, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng 3.500.000  c«ng tr¹ng chiÕn tr­êng råi.ChØ ®­îc chän 1 trong 2 lo¹i phÇn th­ëng.");
		return	
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng top 2 c«ng tr¹ng chiÕn tr­êng råi.");
		return	
	end
	
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	local nNationRank = LIB_txtData.tbTextData[tonumber(nTongLieu)]
	if nNationRank >= 2 then
		Talk(1, "", strNpcName.."PhÇn th­ëng 2 cao thñ ®Çu tiªn c«ng tr¹ng ®¹t 2.800.000 ®· cã chñ nh©n!");
		return	
	end
	
	if LIB_txtData:AddValue(tonumber(nTongLieu),1,2) == 1 then
		DelItem(2,1,30230,9000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		--local tbAward = {item = {{gdp={2,1,30821,1,1}, name = "Trøng ThÇn BÝ T©y Vùc", nExpired = 0}}}
--		Bit 1 nhËn phÇn th­ëng top c«ng tr¹ng
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_HORNOR,1)
		--TraoLoiHoTuongQuan(13)
		TraoHoaPhungTuongQuan(0)
--		if nNationRank == 0 then
			--TraoThuongUngTuongQuan(0);
			--TraoTrangBiKimXaTuongQuan()
--		end
--		for i=1,19 do
		--	LIB_Award:Award(tbAward)
--		end
		award_random_gem3_32()
		award_random_gem4_32()
		award_random_gem5_8()
		gf_AddItemEx2({2,1,30821,1,1},"Trøng ThÇn BÝ T©y Vùc","Top 2.800.000 QC","nhËn")
--		LIB_txtData:Init("danhsachnhanthuong.txt")
--		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOP790790	"..date("%Y-%m-%d %H:%M:%S")
--		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng h¹ng "..(nNationRank+1).." c«ng tr¹ng phe "..tb_Nation_Name[tonumber(nTongLieu)]..".")
	end
end

-- NhËn th­ëng top 3.500.000 c«ng tr¹ng
function confirm_get_1mil_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nChuyenSinhLevel = gf_GetTransLevel() or 0
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C¸c h¹ kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if GetItemCount(2,1,30230) < 13000 then
		Talk(1,"", strNpcName.."C¸c h¹ kh«ng ®em ®ñ 13000 xu vËt phÈm, hay lµ ®· ®Ó quªn trong r­¬ng?")
		return
	end
	
	if nChuyenSinhLevel < 699 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a chuyÓn sinh 6 cÊp ®é 99, h·y cè g¾ng thªm..");
		return 0
	end
	
	if abs(nHor) < 3500000  then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn danh väng, s­ m«n, c«ng tr¹ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 6 then
		Talk(1,"",strNpcName.."C¸c h¹, phÇn th­ëng nµy chØ ®­îc trao tÆng cho nguyªn so¸i, C¸c h¹ h·y cè g¾ng thªm nhÐ...");
		return 0
	end
	
	if gf_Judge_Room_Weight(25, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng top 2 c«ng tr¹ng chiÕn tr­êng råi.ChØ ®­îc chän 1 trong 2 lo¹i phÇn th­ëng.");
		return	
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng 3.500.000  c«ng tr¹ng chiÕn tr­êng råi.");
		return	
	end
	
	LIB_txtData:Init("top_1milhornor.txt")
	LIB_txtData:LoadData()
	
	--local nNationRank = 0
	--for i = 1, 2 do
	--	nNationRank = LIB_txtData.tbTextData[tonumber(i)]
	--	if nNationRank == 1 then
	--		break
	--	end
	--end
	
	local nNationRank = LIB_txtData.tbTextData[tonumber(1)]
	if nNationRank >= 1 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy ®· cã chñ nh©n!");
		return	
	end
	
	if LIB_txtData:AddValue(1,1,1) == 1 then
		DelItem(2,1,30230,13000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		-- Bit 1 nhËn phÇn th­ëng top c«ng tr¹ng
		--local tbAward = {item = {{gdp={2,1,30787,1,1}, name = "Trøng Bæn §iÓu", nExpired = 0}}}
		--local tbChienTuong = {item = {{gdp={0,105,30033,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "ChiÕn T­îng Nguyªn So¸i"}}}
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_1MIL_HORNOR,1)
		--TraoLoiHoNguyenSoai(13) -- set 13
		TraoHoaPhungNguyenSoai(0)
		--LIB_Award:Award(tbChienTuong)
--		TraoTrangBiKimXaNguyenSoai()
--		for i=1,39 do
		--	LIB_Award:Award(tbAward)
--		end
		gf_AddItemEx2({2,1,30787,1,1},"Trøng Bæn §iÓu","Top 3.500.000 QC","nhËn")
		award_random_gem3_32()
		award_random_gem4_32()
		award_random_gem5_16()
--		LIB_txtData:Init("danhsachnhanthuong.txt")
--		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOP1500000	"..date("%Y-%m-%d %H:%M:%S")
--		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng 3.500.000 c«ng tr¹ng")
	end
end


-- Xem th«ng tin top 100 nhËn mËt tÞch
function get_top100_award_info()
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local szList = "Sè l­îng nhËn th­ëng mËt tÞch ®· ®¨ng ký: \n"	
	local szList2 = szList
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		szList = szList.."ChuyÓn sinh "..i..": "..LIB_txtData.tbTextData[i].."/100\n"
	end
	Talk(1,"",szList)	
end


-- Xem th«ng tin top m«n ph¸i
function get_top_faction_info()
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local szList = "Th«ng tin phÇn th­ëng top 1 hÖ ph¸i ®· nhËn: \n"	
	local szList2 = szList
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		if tb_Route_Name[i] ~= "" then
			if i < 14 then
				szList = szList.."Cao thñ <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			else
				szList2 = szList2.."Cao thñ <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			end
		end
	end
	Talk(2,"",szList, szList2)	
end

-- Xem th«ng tin top qu©n c«ng
function get_top_nation_info()
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	for i=1,getn(LIB_txtData.tbTextData) do
		print(LIB_txtData.tbTextData[i])
	end
	local szList = "Th«ng tin phÇn th­ëng top 3 vinh dù chiÕn tr­êng: \n"	
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do		
		szList = szList.."Cao thñ phe <color=green>"..tb_Nation_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
	end
	Talk(1,"",szList)	
end

-- NhËn ­u ®·i server míi
function Say_NhanUuDai()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if nNation~=TOP_SERVER_ID then
		Talk(1,"","ChØ cã server " .. szServerName .. " míi nhËn ®­îc phÇn th­ëng")
		return
	end
	tbSay = {"Ta chØ ghÐ ngang/dlgover"}
	for i=getn(tbDieuKienUuDai),1,-1 do
		tinsert(tbSay,1,"CÊp "..tbDieuKienUuDai[i]["nLevel"]..": "..tbDieuKienUuDai[i]["name"].." cÇn "..tbDieuKienUuDai[i]["tbitem"][4].." "..tbDieuKienUuDai[i]["tbitem"][5].."/#UuDaiServerMoi("..i..")")
	end
	Say("Mêi c¸c h¹ nhËn phÇn t­ëng t­¬ng xøng",getn(tbSay), unpack(tbSay))
end

function UuDaiServerMoi(nOrder)
	if type(tbDieuKienUuDai[nOrder]) ~= "table" then
		Talk(1,"","Kh«ng cã phÇn th­ëng cho cÊp ®é nµy")
		return
	end
	
	local tbAward = tbDieuKienUuDai[nOrder]
	local nLevel = GetLevel()
	local nRoute = GetPlayerRoute()
	
	if tbAward["nLevel"] > nLevel then
		Talk(1,"","C¸c h¹ ch­a ®ñ cÊp ®é nhËn th­ëng")
		return
	end
	
	if gf_Judge_Room_Weight(tbAward["nSlot"] ,tbAward["nWeight"] ) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"]) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng ­u ®·i nµy råi.")
		return 1
	end
	
	if nRoute == 0 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i nªn kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if GetItemCount(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3]) < tbAward["tbitem"][4] then
		Talk(1,"","C¸c h¹ kh«ng ®em ®ñ "..tbAward["tbitem"][5]..", h·y kiÓm tra l¹i hµnh trang.")
		return
	end
	
	-- Trao th­ëng ¦u ®·i
--	if nOrder == 10 then
--		Say_NhanVuKhiVietYen()
--		return
--	end
	
--	if nOrder < 10 then
		if DelItem(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3], tbAward["tbitem"][4])==1 then
			LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
			LIB_Award.szLogAction = "nhËn"
			gf_SetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"], 1)
			if nOrder == 1 then
				GiveAwardTCTK(7)
			elseif nOrder == 2 then
				GiveAwardTCTK(8)
			elseif nOrder == 3 then
				GiveAwardTCTK(9)
			elseif nOrder == 4 then
				local tbUuDai = {item = {{gdp = {0,102,24,1,1,-1,-1,-1,-1,-1,-1,-1},  name = "§«ng Ph­¬ng Long Ch©u"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 5 then
				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr¸i c©y"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 6 then
				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr¸i c©y"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 7 then
				local tbUuDai = {item = {{gdp={2,1,30368,500}, name = "Cæ Linh Th¹ch"}, {gdp={2,1,30369,1000}, name = "Cæ Linh Ngäc"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 8 then
				local tbUuDai = {item = {{gdp={2,1,30368,1200}, name = "Cæ Linh Th¹ch"}, {gdp={2,1,30369,2000}, name = "Cæ Linh Ngäc"}}}
				LIB_Award:Award(tbUuDai)
			end
--			elseif nOrder == 9 then
--				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr¸i c©y"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 10 then
--				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr¸i c©y"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 11 then
--				local tbUuDai = {item = {{gdp={0,107,tbMatTich70caocap[nRoute][2][3],9}, name = "MËt tÞch 70 cao cÊp"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 12 then
--				local tbUuDai = {item = {{gdp={2,1,30368,500}, name = "Cæ Linh Th¹ch"}, {gdp={2,1,30369,1000}, name = "Cæ Linh Ngäc"}}}
--				LIB_Award:Award(tbUuDai)
--			end
		end
--	end
end

--
--function Say_NhanVuKhiVietYen()
--	local tbListAllVietYen = {
--		[1] = {"ViÖt Yªn Phi Tinh §ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
--		[2] = {"ViÖt Yªn Phi Tinh C«n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[3] =  {"ViÖt Yªn Phi Tinh Tr­îng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[4] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[5] =  {"ViÖt Yªn Tr¶m NguyÖt KiÕm", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[6] =  {"ViÖt Yªn Tr¶m NguyÖt Bót", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[7] =  {"ViÖt Yªn Phi Tinh KiÕm", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[8] =  {"ViÖt Yªn Phi Tinh CÇm", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[9] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[10] =  {"ViÖt Yªn Tr¶m NguyÖt C«n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[11] =  {"ViÖt Yªn Phi Tinh Ch©m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[12] =  {"ViÖt Yªn Tr¶m NguyÖt Th­¬ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[13] =  {"ViÖt Yªn Tr¶m NguyÖt Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[14] = {"ViÖt Yªn Tr¶m NguyÖt NhÉn", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[15] = {"ViÖt Yªn Tr¶m NguyÖt Tr¶o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--	}
--	tbSay = {"Ta cÇn suy nghÜ l¹i/dlgover"}
--	for i=getn(tbListAllVietYen), 1, -1 do
--		tinsert(tbSay,1,tbListAllVietYen[i][1].."/#NhanVuKhiVietYen("..i..")")
--	end
--	Say("C¸c h¹ h·y chän  vò khÝ tïy thÝch:", getn(tbSay), unpack(tbSay))
--end
--
--function NhanVuKhiVietYen(nOption)
--	local tbAward = tbDieuKienUuDai[10]
--	local tbListAllVietYen = {
--		[1] = {"ViÖt Yªn Phi Tinh §ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
--		[2] = {"ViÖt Yªn Phi Tinh C«n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[3] =  {"ViÖt Yªn Phi Tinh Tr­îng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[4] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[5] =  {"ViÖt Yªn Tr¶m NguyÖt KiÕm", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[6] =  {"ViÖt Yªn Tr¶m NguyÖt Bót", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[7] =  {"ViÖt Yªn Phi Tinh KiÕm", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[8] =  {"ViÖt Yªn Phi Tinh CÇm", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[9] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[10] =  {"ViÖt Yªn Tr¶m NguyÖt C«n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[11] =  {"ViÖt Yªn Phi Tinh Ch©m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[12] =  {"ViÖt Yªn Tr¶m NguyÖt Th­¬ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[13] =  {"ViÖt Yªn Tr¶m NguyÖt Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[14] = {"ViÖt Yªn Tr¶m NguyÖt NhÉn", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[15] = {"ViÖt Yªn Tr¶m NguyÖt Tr¶o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--	}
--	if DelItem(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3], tbAward["tbitem"][4]) == 1 then
--		gf_SetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"], 1)
--		gf_AddItemEx2(tbListAllVietYen[nOption][2], tbListAllVietYen[nOption][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
--	end
--end

function dlgover()
end


function PhatThuongBangHoi()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20130519 then
		Talk(1,"","Ch­a ®Õn ngµy trao th­ëng, phiÒn C¸c h¹ ®îi ®Õn 19-05-2013 nhÐ.")
		return 0
	end
	
	local nTongMember = IsTongMember();
	if nTongMember == 0 then
		Talk(1,"","PhÇn th­ëng nµy chØ dµnh cho bang héi, C¸c h¹ h·y gia nhËp bang héi tr­íc ®· nhÐ.")
		return 0
	end
		
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  15 then
		Talk(1,"","Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n 15 ngµy, kh«ng thÓ nhËn th­ëng nµy!")
		return 0
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, 21) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	
	if gf_Judge_Room_Weight(25,2100) ~=1 then
		Talk(1,"","C¸c h¹ cÇn chuÈn bÞ 25 « hµnh trang vµ 2100 søc lùc ®Ó nhËn th­ëng.")
		return 0
	end
	
	local szTongName = GetTongName()
	LIB_txtData:Init("banghoinhanthuong.txt")
	LIB_txtData:LoadMultiColumn();
	tbTenBang = LIB_txtData.tbTextData
	if tbTenBang[1] ~= nil and tbTenBang[1][1] ~= nil then
		if tbTenBang[1][1] ~= szTongName then
			Talk(1,"","PhÇn th­ëng nµy ®· trao cho bang ".. tbTenBang[1][1])
			return 0
		end
	else
		if GetTongPopuLadder() ~= 1 then
			Talk(1,"","PhÇn th­ëng nµy chØ trao cho bang héi xÕp h¹ng 1 nh©n khÝ.")
			return 0
		end
		LIB_txtData:AddLine(szTongName)
	end
	
	LIB_Award.szLogTitle = "TOP BANG HOI "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	gf_SetTaskBit(TSK_TOP_LEVEL, 21, 1)
	local tbThuongBangHoi = {item = {
		{gdp={2,0,189,2003,1}, name = "QuÕ Hoa Töu"},
		{gdp={2,1,1208,2,1}, name = "P_th­ëng C«ng Thµnh (th¾ng)"},
		{gdp={2,1,1210,20,1}, name = "B¶o r­¬ng Tµi nguyªn"},
		{gdp={0,105,33,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "Niªn Thó", nExpired = 90*24*60*60}
	}}
	LIB_Award:Award(tbThuongBangHoi)
end


function CS_TopAward(nOption)
	local tbOps = {
		[1] = {nCS = 1, nBit = 22},
		[2] = {nCS = 2, nBit = 23},
		[3] = {nCS = 3, nBit = 24},
		[4] = {nCS = 4, nBit = 25},
		[5] = {nCS = 5, nBit = 26},
		[6] = {nCS = 6, nBit = 27},
		[7] = {nCS = 7, nBit = 28},
	}
	local nTongLieu = 0
	if GetTask(701) > 0 then
		nTongLieu = 1
	elseif  GetTask(701) < 0 then
		nTongLieu = 2
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"]) == 1 then
		Talk(1,"","C¸c h¹ ®· ®¨ng ký nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	
	local nPhucSinh = GetPlayerRebornParam(0)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + nPhucSinh
	
	if nOption == 6 then
		if nChuyenSinh < 6 or GetLevel() < 99 then
			Talk(1,"",strNpcName.."C¸c h¹ ch­a ®Æt ®iÒu kiÖn chuyÓn sinh 6 hoÆc ®¼ng cÊp ch­a ®óng, kh«ng thÓ ®¨ng ký nhËn mËt tÞch.")
			return 0
		end
	end
	
	if nOption == 7 then
		if nChuyenSinh < 7 or GetLevel() < 90 then
			Talk(1,"",strNpcName.."C¸c h¹ ch­a ®Æt ®iÒu kiÖn chuyÓn sinh 7 hoÆc ®¼ng cÊp ch­a ®óng, kh«ng thÓ ®¨ng ký nhËn mËt tÞch.")
			return 0
		end
	end
	
	
	if gf_Judge_Room_Weight(6,500) ~=1 then
		Talk(1,"","C¸c h¹ cÇn chuÈn bÞ 6 « hµnh trang vµ 500 søc lùc ®Ó nhËn th­ëng.")
		return 0
	end
	
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local nAward = LIB_txtData.tbTextData[tonumber(nOption)]
	
	if nOption == 6 then
		if nAward >= 10 then
			Talk(1, "", strNpcName.."§· cã ®ñ 10 cao thñ ®¨ng ký nhËn phÇn th­ëng nµy, c¸c h¹ h·y cè g¾ng chiÕm phÇn th­ëng kh¸c nhÐ!");
			return 0
		end
	end
	
	if nOption == 7 then
		if nAward >= 3 then
			Talk(1, "", strNpcName.."§· cã ®ñ 3 cao thñ ®¨ng ký nhËn phÇn th­ëng nµy, c¸c h¹ h·y cè g¾ng chiÕm phÇn th­ëng kh¸c nhÐ!");
			return 0
		end
	end
	
	local nRoute = GetPlayerRoute()
	if LIB_txtData:AddValue(tonumber(nOption),1,3) == 1 then
		gf_SetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"], 1)
		LIB_txtData:Init("danhsachnhanthuong.txt")
		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOPCS"..nOption.."	"..date("%Y-%m-%d %H:%M:%S")
		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","C¸c h¹ lµ ng­êi thø "..(nAward+1).." ®¨ng ký nhËn mËt tÞch thµnh c«ng.")
		
		if nOption == 6 then			
			AddItem(2,1,30344,3)
			TraoMatTichCaoCap20(1,nRoute)
		end
		
		if nOption == 7 then
			AddItem(2,1,3356,5)
			AddItem(2,1,30913,100,4)
			AddItem(2, 1, 30912, 600, 4)
			TraoMatTichCaoCap20(2,nRoute)
		end
	end
end


function get_route_award_by_level_menu()
	local tbSay = {}
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 92/#get_route_award_by_level_done(92)")
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 93/#get_route_award_by_level_done(93)")
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 94/#get_route_award_by_level_done(94)")
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 96/#get_route_award_by_level_done(96)")
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 99/#get_route_award_by_level_done(99)")
	tinsert(tbSay, "Ta ch­a muèn nhËn ngay/gf_DoNothing")
	Say("§Ö tö ph¸i C«n L«n nÕu ®¹t ®Õn ®¼ng cÊp nhÊt ®Þnh sÏ ®­îc ta tÆng th­ëng ®Æc biÖt, dÜ nhiªn còng ph¶i cÇn chót thï lao.", getn(tbSay), tbSay)
end


function get_route_award_by_level_done(nOption)
	local tbAward = {
			[92] = {fn="TraoNguLongTuongQuan_TrangBi(7)"},
			[93] = {fn="TraoMatTich70CaoCap(20)"},
			[94] = {fn="TraoNguLongTuongQuan_TrangSuc()"},
			[96] = {fn="ThuongVuKhi_ThuyYenLinhNu()"},
			[99] = {item={
						{gdp={2,1,30345,1,1}, name = "ChuyÓn Sinh §¬n"}, 
						{gdp={2,0,1083,3,1}, name = "Th¸i DÞch Hçn Nguyªn C«ng Phæ"}, 
						{gdp={2,95,204,4,1}, name = "Thiªn Cang LÖnh"}},
					nChankhi = 150000,
			},
	}
	if GetPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."Ng­¬i ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng..")
		return
	end
	if GetLevel() < nOption then
		Talk(1,"",strNpcName.."§¼ng cÊp ch­a ®ñ, kh«ng thÓ nhËn th­ëng..")	
		return
	end
	if IsPlayerDeath() == 1 then
		Talk(1,"",strNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng.")	
		return
	end
	if IsStalling() == 1 then
		Talk(1,"",strNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng.")	
		return
	end
	if TopCheckSkill(tFactionSkillInfo,20) == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a luyÖn thµnh 20 cÊp vâ c«ng trÊn ph¸i.");
		return	
	end
	local tbDieuKien = {
		[92] = {Bit = 1, Route = 30, Quanham = 3, Quancong = 200000, Danhvong = 20000, Sumon = 20000, Slot = 3},
		[93] = {Bit = 2, Route = 30, Quanham = 3, Quancong = 200000, Danhvong = 20000, Sumon = 20000, Slot = 20},
		[94] = {Bit = 3, Route = 30, Quanham = 4, Quancong = 230000, Danhvong = 23000, Sumon = 23000, Slot = 3},
		[96] = {Bit = 4, Route = 30, Quanham = 5, Quancong = 300000, Danhvong = 26000, Sumon = 26000, Slot = 1},
		[99] = {Bit = 5, Route = 30, Quanham = 5, Quancong = 330000, Danhvong = 30000, Sumon = 30000, Slot = 2},
	}
	local tbMaterial = {
		[92] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[93] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[94] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[96] = {Danhvong = 3000, Sumon = 3000, Gold = 3000, Xu = 3000, Exp = 600000000},
		[99] = {Danhvong = 3000, Sumon = 3000, Gold = 3000, Xu = 3000, Exp = 1000000000},
	}
	if tbDieuKien[nOption] == nil then
		return 0
	end
	
	if gf_Judge_Room_Weight(tbDieuKien[nOption]["Slot"],500) ~= 1 then
		Talk(1,"",strNpcName.."CÇn ".. tbDieuKien[nOption]["Slot"] .." hµnh trang , 500 søc lùc. Vui lßng s¾p xÕp l¹i.")
		return
	end
	
	local nRoute = GetPlayerRoute()
	local nQuanham = GetTask(704)
	local nQuancong = GetTask(701)
	local nDanhvong = GetReputation()
	local nSumon = GetTask(336)
	
	if gf_GetTaskBit(TSK_BONUS_CONLON, tbDieuKien[nOption]["Bit"]) ~= 0 then
		Talk(1,"", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	
	if nRoute ~= tbDieuKien[nOption]["Route"] then
		Talk(1,"", strNpcName.."HÖ ph¸i kh«ng phï hîp, kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	
	if nDanhvong < tbDieuKien[nOption]["Danhvong"] then
		Talk(1,"", strNpcName.."Danh väng ch­a ®¹t møc "..tbDieuKien[nOption]["Danhvong"]..", ta ch­a thÓ trao th­ëng cho c¸c h¹.")
		return 0
	end
	
	if nSumon < tbDieuKien[nOption]["Sumon"] then
		Talk(1,"", strNpcName.."§iÓm cèng hiÕn s­ m«n ch­a ®¹t møc "..tbDieuKien[nOption]["Sumon"]..", ta ch­a thÓ trao th­ëng cho c¸c h¹.")
		return 0
	end
	
	if abs(nQuanham) < abs(tbDieuKien[nOption]["Quanham"]) then
		Talk(1,"", strNpcName.."Qu©n hµm ch­a ®ñ ®iÒu kiÖn, ng­¬i h·y cè g¾ng thªm.")
		return 0
	end
	
	if abs(nQuancong) < abs(tbDieuKien[nOption]["Quancong"]) then
		Talk(1,"", strNpcName.."Qu©n c«ng ch­a ®ñ "..abs(tbDieuKien[nOption]["Quancong"])..", ng­¬i h·y cè g¾ng thªm.")
		return 0
	end
	
	if GetCash() < tbMaterial[nOption]["Gold"]*10000 then
		Talk(1,"", strNpcName.."Ng­¬i ch­a ®em ®ñ "..tbMaterial[nOption]["Gold"].." vµng, h·y kiÓm tra l¹i nhÐ.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < tbMaterial[nOption]["Xu"] then
		Talk(1,"", strNpcName.."Ng­¬i ch­a ®em ®ñ "..tbMaterial[nOption]["Xu"].." xu vËt phÈm, h·y kiÓm tra l¹i nhÐ.")
		return 0
	end
	
	if GetExp() < tbMaterial[nOption]["Exp"] then
		Talk(1,"", strNpcName.."Ng­¬i ch­a tÝch lòy ®ñ "..tbMaterial[nOption]["Exp"].." ®iÓm kinh nghiÖm, h·y cè g¾ng thªm.")
		return 0
	end

--	****************** Trao th­ëng *************************
	ModifyReputation(-tbMaterial[nOption]["Danhvong"],0)
	SetTask(336, GetTask(336) - tbMaterial[nOption]["Sumon"])
	Msg2Player("B¹n bÞ trõ "..tbMaterial[nOption]["Sumon"].." ®iÓm s­ m«n")
	Pay(tbMaterial[nOption]["Gold"]*10000)
	DelItem(2,1,30230,tbMaterial[nOption]["Xu"])
	Msg2Player("B¹n bÞ trõ "..tbMaterial[nOption]["Xu"].." xu vËt phÈm")
	ModifyExp(-tbMaterial[nOption]["Exp"])
	Msg2Player("B¹n bÞ trõ "..tbMaterial[nOption]["Exp"].." ®iÓm kinh nghiÖm")
	gf_SetTaskBit(TSK_BONUS_CONLON, tbDieuKien[nOption]["Bit"], 1, 0)
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward[nOption])
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "PhÇn th­ëng Thóy Yªn Linh N÷ cÊp "..nOption)
end
