Include("\\script\\lib\\globalfunctions.lua");
g_szTitle = "<color=green>Sát Tinh Lệnh: <color>"

nVK = 20022;
ListItem = {
	[50003] = {
		[2] = 	{3, nVK},
		[3] = 	{8,nVK + 2},
		[4] = 	{0,nVK + 1},
		[6] = 	{1,nVK + 3},
		[8]= 	{2,nVK + 4},
		[9]= 	{10,nVK + 5},
		[11]=	{0,nVK + 6},
		[12]=	{5,nVK + 7},
		[14]=	{2,nVK + 8},
		[15]=	{9,nVK + 9},
		[17]=	{6,nVK + 10},
		[18]=	{4,nVK + 11},
		[20]=	{7,nVK + 12},
		[21]=	{11,nVK + 13},
		[23]=	{2,nVK + 14},
		[25]=	{3,nVK + 15},
		[26]=	{9,nVK + 16},
		[27]=	{11,nVK + 17},
		[29]=	{13,nVK + 18},
		[30]=	{12,nVK + 19},
		[31]=	{14,nVK + 20},
		[32]=	{2,nVK + 21},
	},
	[50004] = 102,
	[50000] = 103,
	[50001] = 100,
	[50002] = 101,
};

ListType = {
	[50000] = 1,
	[50001] = 1,
	[50002] = 1,
	[50004] = 2,
	[50003] = 3
};

ListID = {
	[1] = { --Quan Ao
		[1] = {
			[2831] = {"Độc cổ (500)"},
			[2832] = {"Sát thương (400)"},
			[2834] = {"Nội công (30%)"},
			[2833] = {"Ngoại công (30%)"},
			[2835] = {"Sức mạnh (90)"},
			[2836] = {"Nội công (90)"},
			[2837] = {"Gân cốt (90)"},
			[2838] = {"Thân pháp (90)"},
			[2839] = {"Linh hoạt (90)"}
		},
		[2] = {
			[2841] = {"Sinh mệnh (45%)"},
			[2842] = {"Nội lực (45%)"},
			[2843] = {"Tỷ lệ phòng ngự Ngoại công (6%)"},
			[2844] = {"Tỷ lệ phòng ngự Nội công (6%)"},
			[2845] = {"Tỷ lệ phòng ngự Nội Ngoại công (5%)"},
			[2846] = {"Điểm hộ giáp ngoại phòng (100)"},
			[2847] = {"Điểm hộ giáp nội phòng (100)"},
			[2848] = {"Điểm hộ giáp nội ngoại phòng (80)"},
		},
		[3] = {
			[2850] = {"Né tránh mọi trạng thái phụ (4%)"},
			[2851] = {"Khi bí tấn công có xác suất tăng tốc độ di chuyển (40%)"},
			[2852] = {"Điểm sinh lực (16000)"},
			[2853] = {"Phòng thủ bạo kích (35)"},
		},
	},
	[2] = { --Ngoc Boi
		[1] = {
			[2857] = {"Độc cổ (200)"},
			[2858] = {"Sát thương (100)"},
			[2859] = {"Công kích (8%)"},
			[2860] = {"Sức mạnh (70)"},
			[2861] = {"Nội công (70)"},
			[2862] = {"Gân cốt (70)"},
			[2863] = {"Thân pháp (70)"},
			[2864] = {"Linh hoạt (70)"}
		},
		[2] = {
			[2866] = {"Sinh mệnh (35%)"},
			[2867] = {"Nội lực (35%)"},
			[2868] = {"Tỷ lệ phòng ngự Ngoại công (6%)"},
			[2869] = {"Tỷ lệ phòng ngự Nội công (6%)"},
			[2870] = {"Tỷ lệ phòng ngự Nội Ngoại công (5%)"},
			[2871] = {"Điểm hộ giáp ngoại phòng (80)"},
			[2872] = {"Điểm hộ giáp nội phòng (80)"},
			[2873] = {"Điểm hộ giáp nội ngoại phòng (60)"},
		},
		[3] = {
			[2875] = {"Dùng kỹ năng không tính tỷ lệ giãn cách (10%)"},
			[2878] = {"Sát thương thành nội lực (10%)"},
			[2876] = {"Tỷ lệ xuất chiêu tăng (6%)"},
			[2877] = {"Hỗ trợ mật tích (8%)"},
			[2880] = {"Tăng hiệu quả thương dược (38%)"},
			[2879] = {"Giảm thời gian thọ thương (18%)"},
			[2881] = {"Nội lực tiêu hao (40%)"},
			[2882] = {"Điểm bạo kích tăng (30)"},
		},
	},
	[3] = { --Vu Khi
		[1] = {
			[2903] = {"Độc cổ (800)"},
			[2904] = {"Sát thương (400)"},
			[2905] = {"Điểm bạo kích (45)"},
		},
		[2] = {
			[2896] = {"Sức mạnh (90)"},
			[2897] = {"Nội công (90)"},
			[2898] = {"Gân cốt (90)"},
			[2899] = {"Thân pháp (90)"},
			[2900] = {"Linh hoạt (90)"},
			[2901] = {"Kháng tất cả (90)"},
		},
		[3] = {
			[2907] = {"Giảm tỷ lệ Ngoại phòng đối phương (20%)"},
			[2908] = {"Giảm tỷ lệ Nội phòng đối phương (20%)"},
			[2909] = {"Giảm tỷ lệ Nội Ngoại đối phương (18%)"},
			[2910] = {"Giảm điểm hộ giáp Ngoại phòng đối phương (300)"},
			[2911] = {"Giảm điểm hộ giáp Nội phòng đối phương (300)"},
			[2912] = {"Giảm điểm hộ giáp Nội Ngoại đối phương (200)"},
		},
	}
};

--ThamSo
nItem = 0;
ID1 = 0;
ID2 = 0;
ID3 = 0;
IDNB = 0;
IDVK = 0;

--Start
function OnUse(nItemIndex)
	nItem = GetItemParticular(nItemIndex)

	SetHHVH_1();
end

function SetID(nIDindex, nID)
	if nIDindex == 1 then 
		ID1 = nID;
		SetHHVH_2();
	elseif nIDindex == 2 then 
		ID2 = nID;
		SetHHVH_3();
	elseif nIDindex == 3 then 
		ID3 = nID;
		CheckItemType();
	elseif nIDindex == 102 then
		IDNB = nID;
		SetHHVH_End();
	elseif nIDindex == 0 then
		IDVK = nID;
		SetHHVH_End();
	end
end

function CheckItemType()
	if ListType[nItem] == 1 then 
		SetHHVH_End();
	end;
	if ListType[nItem] == 2 then 
		SetHHVH_NB();
	end;
	if ListType[nItem] == 3 then 
		SetHHVH_VK();
	end;
end

function SetHHVH_1()
	local tSay = {
	};
	
	for k, v in pairs(ListID[ListType[nItem]][1]) do
		tinsert(tSay,""..v[1].."/#SetID(1, "..k..")");
	end
	
	tinsert(tSay,"Hủy/nothing");
	Say(g_szTitle.."Lựa chọn thuộc tính 1", getn(tSay), tSay);
end

function SetHHVH_2()
	local tSay = {
	};
	
	for k, v in pairs(ListID[ListType[nItem]][2]) do
		tinsert(tSay,""..v[1].."/#SetID(2, "..k..")");
	end
	
	tinsert(tSay,"Hủy/nothing");
	Say(g_szTitle.."Lựa chọn thuộc tính 2", getn(tSay), tSay);
end

function SetHHVH_3()
	local tSay = {
	};
	
	for k, v in pairs(ListID[ListType[nItem]][3]) do
		tinsert(tSay,""..v[1].."/#SetID(3, "..k..")");
	end
	
	tinsert(tSay,"Hủy/nothing");
	Say(g_szTitle.."Lựa chọn thuộc tính 3", getn(tSay), tSay);
end

function SetHHVH_NB()
	local tSay = {
		"Sát Tinh - Cửu Linh Hỏa Giới /#SetID(102, 20004)",
		"Sát Tinh - Ngưng Ngọc Thổ Hoàn /#SetID(102, 20005)"
	};
	
	Say(g_szTitle.."Lựa chọn loại ngọc bội", getn(tSay), tSay);
end

function SetHHVH_VK()
	local tSay = {
		"Hệ phái nội công/#SetID(0, 1)",
		"Hệ phái ngoại công/#SetID(0, 2)",
		"Hệ phái sát thương (Thân Pháp)/#SetID(0, 3)",
		"Hệ phái sát thương (Linh Hoạt)/#SetID(0, 4)"
	};
	
	Say(g_szTitle.."Lựa chọn hệ phái", getn(tSay), tSay);
end

function SetHHVH_End()
	if ListType[nItem] == 1 then
		local nTB = 20024 + GetBody() - 1;
		local pifeng,pIndex	=AddItem(0, ListItem[nItem], nTB ,1,1,-1,-1,-1,-1,-1,-1,0,0);
		SetItemFeedUpAttrs(pIndex,-1,-1,-1,ID1,ID2,ID3);
	elseif ListType[nItem] == 2 then 
		local pifeng,pIndex	=AddItem(0, 102, IDNB ,1,1,-1,-1,-1,-1,-1,-1,0,0);
		SetItemFeedUpAttrs(pIndex,-1,-1, -1,ID1,ID2,ID3);
	elseif ListType[nItem] ==  3 then
		for k, v in pairs(ListItem[nItem]) do
			if GetPlayerRoute() == k then
				local nA = v[1];
				local nB = v[2];
				
				if IDVK == 1 then
					local pifeng,pIndex	=AddItem(0,nA,nB,1,1,-1,-1,-1,-1,-1,-1,0,0);
					SetItemFeedUpAttrs(pIndex,2884,2894,-1,ID1,ID2,ID3);
				elseif IDVK == 2 then
					local lpifeng,pIndex	=AddItem(0,nA,nB,1,1,-1,-1,-1,-1,-1,-1,0,0);
					SetItemFeedUpAttrs(pIndex,2889,2894,-1,ID1,ID2,ID3);
				elseif IDVK == 3 then
					local pifeng,pIndex	=AddItem(0,nA,nB,1,1,-1,-1,-1,-1,-1,-1,0,0);
					SetItemFeedUpAttrs(pIndex,2891,2894,-1,ID1,ID2,ID3);
				elseif IDVK == 34then
					local ifeng,pIndex	=AddItem(0,nA,nB,1,1,-1,-1,-1,-1,-1,-1,0,0);
					SetItemFeedUpAttrs(pIndex,2892,2894,-1,ID1,ID2,ID3);
				end
			end
		end
	end

	DelItem(2,1,nItem,1);
end