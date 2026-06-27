-- Event ®ua top
-- Created by TuanNA5
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\vng\\newserver\\hoatdong.lua");

strNpcName = "<color=green>Háa Phông<color>: "
szLogTitle = "Top B¹ch Hæ"
szStartDate = "01-01-2020"
szEndDate = "01-06-2020"
szServerName = "B¹ch Hæ"

function main()
	local nDate = tonumber(date("%Y%m%d"))
	
--	if GetCreateTime() <= TOP_CREATED_ROLE then
--		Talk(1,"",strNpcName.."Thêi gian t¹o tµi kho¶n kh«ng hîp lÖ nªn kh«ng thÓ nhËn th­ëng!")
--		return
--	end

	--if GetGlbValue(GLB_TSK_SERVER_ID) ~= TOP_SERVER_ID or GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR) ~= TOP_SERVER_ID then
		--Talk(1,"",strNpcName.."Ng­¬i kh«ng ph¶i thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		--return
	--end
	local tSay = {}
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		tinsert(tSay,"NhËn phÇn th­ëng 3 nh©n sÜ ®Çu tiªn mçi phe ®¹t 860.000 c«ng tr¹ng (Set L«i Hæ T­íng Qu©n + 1 B¹ch Khuª)/confirm_get_top_Hornor_award");
		tinsert(tSay,"NhËn th­ëng cao thñ ®Çu tiªn ®¹t 1.400.000 ®iÓm c«ng tr¹ng  (Set L«i Hæ Nguyªn So¸i + 1 ChiÕn T­îng)/confirm_get_1mil_Hornor_award");
		tinsert(tSay,"NhËn phÇn th­ëng cao thñ TOP 1 mçi HÖ Ph¸i (Set Thiªn H¹ V« Song + CÆp Huy Hoµng Vinh Dù + H¾c ChiÕn Nghª)/get_top_faction_award");
		tinsert(tSay,"\n§ua TOP Bang Héi/TopBangHoi_Menu")
	end
	tinsert(tSay,"\nXem t×nh h×nh nhËn th­ëng TOP 1 HÖ Ph¸i/get_top_faction_info")
	tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng TOP 3 C«ng Tr¹ng/get_top_nation_info")
	--tinsert(tSay,"Ph¸t th­ëng bang héi/PhatThuongBangHoi")
	tinsert(tSay,"Ta biÕt råi/dlgover")	
	
	if nDate >= TOP_START_DATE then
		local strSay = strNpcName.."Ho¹t ®éng <color=yellow>§ua TOP<color> ®ang diÔn ra ®Õn <color=red> 24:00 "..szEndDate.."<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn."
		Say(strSay,getn(tSay),tSay)
	end
end

---- NhËn th­ëng top chuyÓn sinh theo m«n ph¸i  ----------
function get_top_faction_award()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then	
		Say(strNpcName.."NhËn phÇn th­ëng cao thñ hoµn thµnh <color=red>ChuyÓn sinh 7 cÊp 96<color> ®Çu tiªn trong HÖ Ph¸i",
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
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	local tbRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[25]=1,[26]=1,[27]=1,[29]=1,[30]=1}
	
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local nFactionRank = LIB_txtData.tbTextData[tonumber(nMonPhai)]
	if nFactionRank >= 1 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy ®· cã chñ nh©n");
		return	
	end

	if nNationality ~= nNation then
		Talk(1, "", strNpcName .. "C¸c h¹ kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if tbRoute[nMonPhai] ~= 1 then
		Talk(1,"",strNpcName .. "C¸c h¹ ch­a chän hÖ ph¸i nªn kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_TRANSLIFE1) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng TOP 1 theo hÖ ph¸i råi.");
		return 0
	end
	
	if nChuyenSinh < 7 then
		Talk(1,"",strNpcName .. "HiÖn t¹i C¸c h¹ ch­a hoµn Phôc sinh 2")
		return 0
	end
	
	if GetLevel() < 96 then
		Talk(1, "", strNpcName .. "C¸c h¹ h·y phÊn ®Êu lªn cÊp ®é 96 råi quay l¹i nhÐ.");
		return 0
	end
	
	if nRep < 20000 or nFaction < 20000 or nHor < 500000  then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn 20.000 danh väng, 20.000 s­ m«n, 500.000 c«ng tr¹ng.");
		return 0
	end

	if GetItemCount(2,1,30230) < 5000 then
		Talk(1,"",strNpcName .. "C¸c h¹ kh«ng ®em ®ñ 5000 xu vËt phÈm.")
		return 0
	end

	if gf_Judge_Room_Weight(8, 300, strNpcName) == 0 then
		Talk(1,"",strNpcName .. "Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end
	
	
	if LIB_txtData:AddValue(tonumber(nMonPhai),1,5) == 1 then
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		-- Bit 1 nhËn phÇn th­ëng chuyÓn sinh 1
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_TRANSLIFE1,1)
		local nItemLevel = 0
		DelItem(2,1,30230,5000)
--		if nFactionRank == 0 then
			local tbAward = {
				item = {
						{gdp={0,102,30037,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Huy Hoµng"}, 
						{gdp={0,102,30038,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Vinh Dù"}, 
						{gdp={0,105,203,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Kim Gi¸c ChiÕn Nghª"}}
			}
			
			local nBodyVSCT 	= 30207 + GetBody() - 1;
			AddItem(0, 103, nBodyVSCT, 1,1, -1,-1,-1,-1,-1,-1,1,0);
			AddItem(0, 101, nBodyVSCT, 1,1, -1,-1,-1,-1,-1,-1,1,0);
			AddItem(0, 100, nBodyVSCT, 1,1, -1,-1,-1,-1,-1,-1,1,0);
			
			TraoMatTichCaoCap20(3, nMonPhai);
			
			LIB_Award:Award(tbAward)
--		end
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng h¹ng "..(nFactionRank+1).." m«n ph¸i "..tb_Route_Name[tonumber(nMonPhai)] .. ".")
	end
end


-- NhËn th­ëng top c«ng tr¹ng
function confirm_get_top_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	
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
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng TOP 3 c«ng tr¹ng chiÕn tr­êng råi.");
		return	
	end
	
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	local nNationRank = LIB_txtData.tbTextData[tonumber(nTongLieu)]
	if nNationRank >= 3 then
		Talk(1, "", strNpcName.."PhÇn th­ëng 3 cao thñ ®Çu tiªn c«ng tr¹ng ®¹t 860.000 ®· cã chñ nh©n");
		return	
	end
	
	if nPhucSinh < 1 or GetLevel() < 96 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn  <color=red>ChuyÓn sinh 6 cÊp 96<color>")
		return 0
	end
	
	if nRep < 15000 or nFaction < 15000 or abs(nHor) < 860000  then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn 15.000 danh väng, 15.000 s­ m«n, 860.000 c«ng tr¹ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 5 then
		Talk(1,"",strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn thuëng. Qu©n Hµm cÇn <color=red>T­íng Qu©n<color>");
		return
	end
	
	if GetItemCount(2,1,30230) < 5000 then
		Talk(1,"", strNpcName.."C¸c h¹ kh«ng ®em ®ñ <color=red>5000<color> xu vËt phÈm")
		return
	end
	
	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end
	
	if LIB_txtData:AddValue(tonumber(nTongLieu),1,3) == 1 then
		DelItem(2,1,30230,5000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		--Bit 1 nhËn phÇn th­ëng top c«ng tr¹ng
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_HORNOR,1)
		TraoLoiHoTuongQuan(0);
		AddItem(0,105,191,1,1,-1,-1,-1,-1,-1,-1,1,0);
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng h¹ng "..(nNationRank+1).." c«ng tr¹ng phe "..tb_Nation_Name[tonumber(nTongLieu)]..".")
	end
end


-- NhËn th­ëng top 1.400.000 c«ng tr¹ng
function confirm_get_1mil_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	
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
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng 1.400.000  c«ng tr¹ng chiÕn tr­êng råi.");
		return	
	end
	
	LIB_txtData:Init("top_1milhornor.txt")
	LIB_txtData:LoadData()
	
	local nNationRank = 0
	for i = 1, 2 do
		nNationRank = LIB_txtData.tbTextData[tonumber(i)]
		if nNationRank == 1 then
			break
		end
	end
	
	if nNationRank >= 1 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy ®· cã chñ nh©n!");
		return	
	end
	
	if nPhucSinh < 1 or GetLevel() < 99 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®¹t ChuyÓn sinh 6 cÊp 99, h·y cè g¾ng thªm.");
		return 0
	end
	
	if nRep < 20000 or nFaction < 20000 or abs(nHor) < 1400000  then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn 20.000 danh väng, 20.000 s­ m«n, 1.400.000 c«ng tr¹ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 6 then
		Talk(1,"",strNpcName.."C¸c h¹, phÇn th­ëng nµy chØ ®­îc trao tÆng cho Nguyªn So¸i, C¸c h¹ h·y cè g¾ng thªm nhÐ...");
		return 0
	end
	
	if GetItemCount(2,1,30230) < 10000 then
		Talk(1,"", strNpcName.."C¸c h¹ kh«ng ®em ®ñ 10.000 xu vËt phÈm, hay lµ ®· ®Ó quªn trong r­¬ng?")
		return 0
	end
	
	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end
	
	if LIB_txtData:AddValue(tonumber(nTongLieu),1,1) == 1 then
		DelItem(2,1,30230,10000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		-- Bit 1 nhËn phÇn th­ëng top c«ng tr¹ng
		local tbChienTuong = {item = {{gdp={0,105,30033,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "ChiÕn T­îng Nguyªn So¸i"}}}
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_1MIL_HORNOR,1)
		TraoLoiHoNguyenSoai(0)
		LIB_Award:Award(tbChienTuong)
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng 1.400.000 c«ng tr¹ng")
	end
end

-- Xem th«ng tin top m«n ph¸i
function get_top_faction_info()
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local tSay = {}
	local szList = "Th«ng tin phÇn th­ëng TOP <color=green>1<color> hÖ ph¸i ®· nhËn:"	
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		if tb_Route_Name[i] ~= "" then
			tinsert(tSay, "Cao thñ - "..tb_Route_Name[i]..": "..LIB_txtData.tbTextData[i])
		end
	end
	Say(szList,getn(tSay),tSay)
end

-- Xem th«ng tin top qu©n c«ng
function get_top_nation_info()
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	--for i=1,getn(LIB_txtData.tbTextData) do
		--print(LIB_txtData.tbTextData[i])
	--end
	local szList = "Th«ng tin phÇn th­ëng top 3 Vinh Dù chiÕn tr­êng: \n"	
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do		
		szList = szList.."Cao thñ phe <color=green>"..tb_Nation_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
	end
	Talk(1,"",szList)	
end

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

--§¨ng Ký NhËn 100 CS
function CS_TopAward(nOption)
	local tbOps = {
		[1] = {nCS = 1, nBit = 22},
		[2] = {nCS = 2, nBit = 23},
		[3] = {nCS = 3, nBit = 24},
	}
	local nTongLieu = 0
	if GetTask(701) > 0 then
		nTongLieu = 1
	elseif  GetTask(701) < 0 then
		nTongLieu = 2
	end
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	if nChuyenSinh ~= tbOps[nOption]["nCS"] or GetLevel() < 99 then
		Talk(1,"",strNpcName.."§iÒu kiÖn chuyÓn sinh hoÆc ®¼ng cÊp ch­a ®óng, kh«ng thÓ ®¨ng ký nhËn mËt tÞch.")
		return 0
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"]) == 1 then
		Talk(1,"","C¸c h¹ ®· ®¨ng ký nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local nAward = LIB_txtData.tbTextData[tonumber(nOption)]
	if nAward >= 100 then
		Talk(1, "", strNpcName.."§· cã ®ñ 100 cao thñ ®¨ng ký nhËn phÇn th­ëng nµy, c¸c h¹ h·y cè g¾ng chiÕm phÇn th­ëng kh¸c nhÐ!");
		return 0
	end
	
	if LIB_txtData:AddValue(tonumber(nOption),1,100) == 1 then
		gf_SetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"], 1)
		LIB_txtData:Init("danhsachnhanthuong.txt")
		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOPCS"..nOption.."	"..date("%Y-%m-%d %H:%M:%S")
		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","C¸c h¹ lµ ng­êi thø "..(nAward+1).." ®¨ng ký nhËn mËt tÞch thµnh c«ng.")
	end
end

