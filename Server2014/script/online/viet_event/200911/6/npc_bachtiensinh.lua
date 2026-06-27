-- Event B¹ch Tiªn Sinh VNG
-- Created by TuanNA5
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\online\\viet_event\\200911\\6\\head_bachtiensinh.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\function\\correct_player_greate_skill.lua");
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2.lua")
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

function main()
	local tSay = {	}	
	local nDate = tonumber(date("%y%m%d"));		

	if PhucSinh2_CheckFinishMission() ~= 1 then
		tinsert(tSay, "Thö th¸ch Phôc Sinh 2/NhiemVuPhucSinh2_Menu")
	end
	if PhucSinh2_CheckFinishMission() == 1 then
		tinsert(tSay,"Hoµn thµnh nhiÖm vô Phôc Sinh lÇn 2/PS2_finishTask")
	end
	tinsert(tSay,"NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/translife_task")
	tinsert(tSay,"T×m hiÓu c¸c h­íng tu luyÖn/view_info")
	tinsert(tSay,"NhËn l¹i Ên vµ ngo¹i trang chuyÓn sinh/get_translife_item")
	tinsert(tSay,"NhiÖm vô thu thËp ThÞt N­íng/accept_task_thonuong")	
	tinsert(tSay,"T¹i h¹ chØ ghÐ qua!/nothing")
	
	local szSay = szNpcName.."L·o nghe nãi cã mãn <color=yellow>ThÞt N­íng<color> rÊt ngon. L·o nay ®· giµ, kh«ng tiÖn ®Õn nh÷ng n¬i xa x«i ®Ó t×m thÞt n­íng. Ng­¬i cã thÓ gióp ta t×m <color=yellow>20 phÇn ThÞt N­íng<color> ®­îc hay kh«ng?"
	Say(szSay,getn(tSay),tSay)		
end

function translife_task()
	if GetTaskTrans() == 0 then
		trans_talk_01()
	elseif GetTaskTrans() == 5 then
		trans_talk_06()
	elseif GetTaskTrans() == 6 then
		trans_talk_07()
	elseif GetTaskTrans() == 7 then
		trans_talk_08()
	elseif (GetTaskTrans() >= 8  and GetTaskTrans() <= 13) or (GetTaskTrans() >= 28 and GetTaskTrans() <= 29) or (GetTaskTrans() > 36) then		
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	elseif GetTaskTrans() == 14 then
		trans_talk_14()
	elseif GetTaskTrans() == 25 then
		trans_talk_25()
	elseif GetTaskTrans() == 26 then
		trans_talk_26()
	elseif GetTaskTrans() == 27 then
		trans_talk_27()
	elseif GetTaskTrans() == 30 then
		trans_talk_30()
	elseif GetTaskTrans() == 34 then
		trans_talk_34()
	elseif GetTaskTrans() == 36 then
		trans_talk_36()
	else
		Say(szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?",0)
	end
end

function accept_task_thonuong()
	local tSay = {}
	
	tinsert(tSay,"NhËn nhiÖm vô thu thËp ThÞt N­íng/confirm_task_thonuong")	
	tinsert(tSay,"Hoµn thµnh nhiÖm vô thu thËp ThÞt N­íng/finish_task_thonuong")	
	tinsert(tSay,"T¹i h¹ chØ ghÐ qua!/nothing")		
	
	Say(szNpcName.."H·y gióp l·o thu thËp 20 ThÞt N­íng t¹i YÕn TiÖc ThÞt N­íng. NÕu ng­¬i hoµn thµnh th× l·o sÏ tÆng ng­¬i 1 mãn quµ. §ång ý chø?",getn(tSay),tSay)
end

-- TiÕp nhËn nhiÖm vô thÞt n­íng
function confirm_task_thonuong()
	
	-- ®iÓm danh väng b»ng kh«ng, kh«ng thÓ tiÕp nhËn nhiÖm vô
	if ( GetReputation ( ) == 0 ) then
		Talk ( 1 , "", szNpcName.." §iÓm danh väng cña ngu¬i kh«ng ®ñ" )
		return
	end

	if GetLevel() < 20 then
		Talk(1, "", szNpcName.."§¼ng cÊp 20 míi cã thÓ nhËn nhiÖm vô cña l·o.");
		return	
	end
	if GetTask(TSK_THONUONG_ACCEPT) == 1 then
		Talk(1, "", szNpcName.."Ng­¬i ®· nhËn nhiÖm vô råi. H·y hoµn thµnh nhiÖm vô råi ®Õn gÆp l·o!");
		return
	end
	if GetTask(TSK_THONUONG_ACCEPT) == 2 then
		Talk(1, "", szNpcName.."Ng­¬i ®· hoµn thµnh nhiÖm vô, cßn kh«ng mau nhËn th­ëng?");
		return
	end
	SetTask(TSK_THONUONG_ACCEPT,1)
	
	set_task_thonuong(BYTE_COUNT_COLLECT,0)  -- sè lÇn thu thËp thÞt nuíng trong ngµy
	
	Talk(1, "", szNpcName.."§i sím vÒ sím. Mçi ngµy chØ gióp l·o ®­îc 4 lÇn th«i ®Êy. NÕu cã b¹n ®ång hµnh ®i cïng, c¸c h¹ sÏ cã thÓ gióp l·o tæng céng ®­îc 8 lÇn ®Êy!");
	TaskTip("NhÆt 20 ThÞt N­íng vÒ cho B¹ch Tiªn Sinh")		
	WriteLogEx(VIET_0911_LOG_TITLE,"nhËn nhiÖm vô ThÞt N­íng")
end

-- hoµn thµnh nhiÖm vô thÞt nuíng
function finish_task_thonuong()

	-- ®iÓm danh väng b»ng kh«ng, kh«ng thÓ tiÕp nhËn nhiÖm vô
	if ( GetReputation ( ) < 4 ) then
		Talk ( 1 , "", szNpcName.." §iÓm danh väng cña ngu¬i kh«ng ®ñ" )
		return
	end
	
	if GetLevel() < 20 then
		Talk(1, "", szNpcName.."§¼ng cÊp 20 míi cã thÓ nhËn nhiÖm vô cña l·o.");
		return	
	end
	if GetTask(TSK_THONUONG_ACCEPT) == 0 then
		Talk(1, "", szNpcName.."Ng­¬i hoµn thµnh nhiÖm vô g× sao l·o kh«ng nhí?");
		return
	end	
	if GetTask(TSK_THONUONG_ACCEPT) == 1 or get_task_thonuong(BYTE_COUNT_COLLECT)  < 20 then
		Talk(1, "", szNpcName.."Ng­¬i ®· nhËn nhiÖm vô råi. H·y hoµn thµnh nhiÖm vô råi ®Õn gÆp l·o!");
		return
	end
	
	if GetTask(TSK_THONUONG_ACCEPT) == 2 then  -- hoµn thµnh nhiÖm vô thÞt nuíng
		local nCurDate = tonumber(tonumber(date("%m"))..tonumber(date("%d")))
		local nLevel = floor(GetLevel()/10)
		local nLastDate = tonumber(get_task_thonuong(BYTE_MONTH)..get_task_thonuong(BYTE_DAY))
		if nCurDate ~= nLastDate then			
			set_task_thonuong(BYTE_COUNT_FINISH,0)
			set_task_thonuong(BYTE_DAY,tonumber(date("%d")))
			set_task_thonuong(BYTE_MONTH,tonumber(date("%m")))
		end
		
		-- Pet: b¹n ®ång hµnh cÊp 1 trë lªn thùc hiÖn nhiÖm vô 8 lÇn trong ngµy
		local nTaskTime = 4
		local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)	
		if nPetLevel >= 1 then
			nTaskTime = 8
		end
		
		-- luu so lÇn hoµn thµnh nhiÖm vô thÞt nuíng vµo BYTE_COUNT_FINISH
		if get_task_thonuong(BYTE_COUNT_FINISH) >= nTaskTime then
			Talk(1, "", szNpcName.."Ng­¬i ®· hoµn thµnh "..nTaskTime.." nhiÖm vô råi. Mai quay l¹i nhÐ!");
			return
		end
		
		set_task_thonuong(BYTE_COUNT_COLLECT,0)
		set_task_thonuong(BYTE_COUNT_FINISH, get_task_thonuong(BYTE_COUNT_FINISH) + 1)
		
		SetTask(TSK_THONUONG_ACCEPT, 0)  -- tr¹ng th¸i ch­a tiÕp nhËn + hoµn thµnh nhiÖm vô


		-----------------------Chuçi nhiÖm vô §ång Hµnh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 3 or DongHanh_GetMission() == 4) then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
		---------------------------------------------------
		Reward20101201();
		local nExpChanKhi = 1000
		AwardGenuineQi(nExpChanKhi)
		gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ thá n­íng")		
						
		WriteLogEx(VIET_0911_LOG_TITLE,"hoµn thµnh nhiÖm vô ThÞt N­íng")
	end	
end

-- nhËn th­ëng thÞt nuíng : tb_20101201_ThitNuong		
function Reward20101201( )
		
		local nExp = 0
		local nReputation = 0
		
		if ( GetLevel() >= 20 and GetLevel() <= 29 ) then
				nExp = tb_20101201_ThitNuong[2][1]
				nReputation = tb_20101201_ThitNuong[2][2]
				
		elseif ( GetLevel() >= 30 and GetLevel() <= 39 ) then
				nExp = tb_20101201_ThitNuong[3][1]
				nReputation = tb_20101201_ThitNuong[3][2]				
				
		elseif ( GetLevel() >= 40 and GetLevel() <= 49 ) then
				nExp = tb_20101201_ThitNuong[4][1]
				nReputation = tb_20101201_ThitNuong[4][2]				
				
		elseif ( GetLevel() >= 50 and GetLevel() <= 59 ) then
				nExp = tb_20101201_ThitNuong[5][1]
				nReputation = tb_20101201_ThitNuong[5][2]				
				
		elseif ( GetLevel() >= 60 and GetLevel() <= 69 ) then
				nExp = tb_20101201_ThitNuong[6][1]
				nReputation = tb_20101201_ThitNuong[6][2]						
		
		elseif ( GetLevel() >= 70 and GetLevel() <= 79 ) then
				nExp = tb_20101201_ThitNuong[7][1]
				nReputation = tb_20101201_ThitNuong[7][2]				
				
		elseif ( GetLevel() >= 80 and GetLevel() <= 89 ) then
				nExp = tb_20101201_ThitNuong[8][1]
				nReputation = tb_20101201_ThitNuong[8][2]				
				
		elseif ( GetLevel() >= 90 and GetLevel() <= 99 ) then
				nExp = tb_20101201_ThitNuong[9][1]
				nReputation = tb_20101201_ThitNuong[9][2]										
				
		end

		ModifyExp (nExp)
		ModifyReputation (50,0) 		
		EventAddPhoBan(200)
		if ( GetReputation() < 0 ) then
			ModifyReputation ( 0 ,0 )
		end
		
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm")
		Msg2Player("B¹n nhËn ®­îc 50 ®iÓm danh väng !!!")
end

function nothing()
end

function PS2_finishTask()
	if PhucSinh2_CheckFinishMission() ~= 1 then
		Talk(1,"","Ng­¬i ch­a ®em b¶n lÜnh hoµn thµnh c¸c thö th¸ch, ta kh«ng thÓ liÒu m¹ng gióp ng­¬i Phôc Sinh.")
		return 0
	end
	if PhucSinh2_Award_GetStatus() == 1 then
		Talk(1,"","Ng­¬i ®· tu luyÖn thµnh c«ng mü m·n bÝ kÝp Phôc Sinh 2, ta kh«ng thÓ gióp g× h¬n n÷a.")
		return 0
	end
	local nCheck_KM = MeridianGetLevel()
	--if nCheck_KM < 3 then
	--	Talk(1, "", "B¹n ch­a kÝch ho¹t kinh m¹ch ®Õn c¶nh giíi Vâ V­¬ng, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
	--	return 0
	--end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt vÒ <color=yellow>Phôc Sinh lÇn 2<color> ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	
	tinsert(tbSayDialog,"Ta ®¹t cÊp 99 vµ d­ 60 tû ®iÓm kinh nghiÖm/#confirm_finish_quest(1)")
	tinsert(tbSayDialog,"Ta ®¹t cÊp 99 vµ d­ 40 tû ®iÓm kinh nghiÖm/#confirm_finish_quest(2)")
	tinsert(tbSayDialog,"Ta ®¹t cÊp 99 vµ d­ 20 tû ®iÓm kinh nghiÖm/#confirm_finish_quest(3)")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/nothing"	)
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);	
end
function confirm_finish_quest(nType)
	--local nCheck = check_material(nType)
	--if nCheck == 0 then
	--	return
	--end
	local szNpcName = "<color=green>B¹ch Tiªn Sinh<color>: "
	local tSay = {}
	local tHeader = szNpcName.."§¹i hiÖp qu¶ lµ mét kú nh©n trong Vâ L©m, b¾t ®Çu lÜnh ngé bÝ kÝp <color=yellow>Tø Linh Phôc Sinh<color> ®Ó ®ét ph¸ b×nh c¶nh. LÜnh ngé thµnh c«ng cã thÓ kich thÝch tiÒm lùc cña b¶n th©n ®¹t c¶nh giíi míi trong §¶ Th«ng Kinh M¹ch. !!!"
	
	tinsert(tSay, "Phôc sinh theo h­íng Long Tö/#cs7_finish_confrim(1,"..nType..")")			
	tinsert(tSay, "Phôc sinh theo h­íng Hæ Tö/#cs7_finish_confrim(2,"..nType..")")			
	tinsert(tSay, "Phôc sinh theo h­íng Phông Tö/#cs7_finish_confrim(4,"..nType..")")			
	tinsert(tSay, "Phôc sinh theo h­íng ¦ng Tö/#cs7_finish_confrim(3,"..nType..")")		
	tinsert(tSay, "Ta ch­a muèn Phôc Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end
function cs7_finish_confrim(nType, nCheck)
		local tb_translife_seal_cs7 = {
							{"Long Tö Ên",{2,0,30002,1,1}, "Long Tö"},
							{"Hæ Tö Ên",{2,0,30003,1,1}, "Hæ Tö"},
							{"¦ng Tö Ên",{2,0,30006,1,1}, "¦ng Tö"},
							{"Phông Tö Ên",{2,0,30005,1,1}, "Phông Tö"},							
					}
		local tb_translife_cloth_PS = {
										[1] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
											},
									}
	local nPhucSinh_Count = GetPlayerRebornParam(0) 
	local nRoute = GetPlayerRoute()
	local tbType = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
	local nType_cs6 = GetPlayerRebornParam(1)
	if nType_cs6 < 0 or nType_cs6 > 4 then
		Msg2Player("§· x¶y ra lçi")
		gf_WriteLogEx("LOI API", "ghi nhËn thµnh c«ng", 1, "Lçi API chuyÓn sinh 7")	
		return
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	--------------------
	--local nDelItem = del_material(nCheck)
	--if nDelItem ~= 1 then
	--	Talk(1, "", "§· x¶y ra lçi trõ vËt phÈm")
	--	return
	--end
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	

--	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth_PS[nType_cs6]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS[nType_cs6][i][2])
			P = P + GetBody() - 1
--			lvatt3 = lvatt3 or 0
--			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end

--	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V¨n Sö ngo¹i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs7[nType][2], tb_translife_seal_cs7[nType][1])
	gf_AddItemEx2({0, 105, 10107, 1, 4, -1, -1, -1, -1, -1, -1},"ThÊt tinh kiÕm", "That tinh kiem","mien phi 7 ngay",7*24*3600)
	PlayerReborn(2,nType) -- ChuyÓn Sinh 7 thµnh c«ng (Phôc Sinh 2)
	RemoveTitle(61,05)
	AddTitle(61,06)
	PhucSinh2_Award_SetStatus()
 	gf_WriteLogEx("CHUYEN SINH 7", "chuyÓn sinh thµnh c«ng", 1, "Finish nv chuyÓn Sinh 6 npc 2")	
	Msg2Player("Chóc mõng ®¹i hiÖp ®· Phôc Sinh thµnh c«ng theo h­íng "..tbType[nType])
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Sinh lÇn 2 !!!!! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")
end
	tCheck_PS2 = {	--Level, kinh nghiÖm, Th¸i dÞch Hçn Nguyªn, ChuyÓn Sinh §¬n, B¹ch Kim Hång Bao, Thiªn Th¹ch Tinh Th¹ch, ThÇn Tµi b¶o r­¬ng, ChiÕn thÇn hoµn, Huy ch­¬ng anh hïng
					[1] = {99, 60, 4, 2, 2 , 0, 0, 0, 0},
					[2] = {99, 40, 4, 2, 4, 0, 3, 1, 50},
					[3] = {99, 20, 4, 2, 4, 0, 5, 3, 100},
				}
function del_material(nType)
	local nTime = floor(GetExp()/2000000000)
	for i =1, nTime do
		ModifyExp(-GetExp())	--cét 2
	end
	ModifyExp(-GetExp())
	if DelItem(2,0,1083, tCheck_PS2[nType][3]) ~= 1 then --cét 3
		return 0
	end
	if DelItem(2,1,30345, tCheck_PS2[nType][4]) ~= 1 then	--cét 4
		return 0
	end
	if DelItem(2,1,30229, tCheck_PS2[nType][5]) ~= 1 then	--cét 5
		return 0
	end	
	if DelItem(2,1,1009, tCheck_PS2[nType][6]) ~= 1 then	--cét 6
		return 0
	end
	if DelItem(2,1,30344, tCheck_PS2[nType][7]) ~= 1 then	--cét 7
		return 0
	end	
	if DelItem(2,1,1005, tCheck_PS2[nType][8]) ~= 1 then	--cét 8
		return 0
	end	
	if DelItem(2,1,30499, tCheck_PS2[nType][9]) ~= 1 then	--cét 9
		return 0
	end					
	return 1
end
function check_material(nType)
	
	local nCount_PS = GetPlayerRebornParam(0)
	local nCheck_KM = MeridianGetLevel()
	if nCount_PS < 1 then
		Talk(1, "", "B¹n ch­a Phôc Sinh lÇn 1, nªn kh«ng thÓ thùc hiÖn Phôc Sinh lÇn 2 ®­îc.")
		return 0
	end
	if nCheck_KM < 3 then
		Talk(1, "", "B¹n ch­a kÝch ho¹t kinh m¹ch ®Õn c¶nh giíi Vâ V­¬ng, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end
	if GetLevel() < tCheck_PS2[nType][1] then --Level - cét 1
		Talk(1, "", "B¹n ch­a ®¹t cÊp 99, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end
	if GetExp() < tCheck_PS2[nType][2] * 1000000000 then	--kinh nghiÖm -cét 2
		Talk(1, "", "B¹n ch­a tÝch lòy ®ñ "..tCheck_PS2[nType][2].." tû ®iÓm kinh nghiÖm, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end	
	if GetItemCount(2,0,1083) < tCheck_PS2[nType][3] then	--Th¸i dÞch hçn nguyªn - cét 3
		Talk(1, "", "B¹n kh«ng mang theo ®ñ sè l­îng Th¸i DÞch Hçn Nguyªn C«ng Phæ, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end
	if GetItemCount(2,1,30345) < tCheck_PS2[nType][4] then	--ChuyÓn Sinh §¬n - cét 4
		Talk(1, "", "B¹n kh«ng mang theo ®ñ sè l­îng ChuyÓn Sinh §¬n, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end
	if GetItemCount(2,1,30229) < tCheck_PS2[nType][5] then	--B¹ch Kim Hång Bao - cét 5
		Talk(1, "", "B¹n kh«ng mang theo ®ñ sè l­îng B¹ch Kim Hång Bao, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end	
	if GetItemCount(2,1,1009) < tCheck_PS2[nType][6] then	--Thiªn Th¹ch Tinh Th¹ch - cét 6
		Talk(1, "", "B¹n kh«ng mang theo ®ñ sè l­îng Thiªn Th¹ch Tinh Th¹ch, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end		
	if GetItemCount(2,1,30344) < tCheck_PS2[nType][7] then	--ThÇn tµi b¶o r­¬ng - cét 7
		Talk(1, "", "B¹n kh«ng mang theo ®ñ sè l­îng ThÇn Tµi B¶o R­¬ng, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end
	if GetItemCount(2,1,1005) < tCheck_PS2[nType][8] then	--ChiÕn thÇn hoµn - cét 8
		Talk(1, "", "B¹n kh«ng mang theo ®ñ sè l­îng ChiÕn thÇn hoµn, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end
	if GetItemCount(2,1,30499) < tCheck_PS2[nType][9] then	--Hu©n Ch­¬ng Anh Hïng - cét 9
		Talk(1, "", "B¹n kh«ng mang theo ®ñ sè l­îng Hu©n Ch­¬ng Anh Hïng, nªn kh«ng thÓ thùc hiÖn Phôc Sinh ®­îc.")
		return 0
	end		
	return 1
end