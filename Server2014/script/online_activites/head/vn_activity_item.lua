Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

ListGif_1 = {
	{"Thiªn M«n Kim LÖnh", 2, {2,1,30370,1},0},
	{"Thiªn Cang LÖnh", 2, {2,95,204,1},0},
	{"Hu©n Ch­¬ng Anh Hïng", 60, {2,1,30499,5},0},
	{"Cæ Linh Ngäc", 60, {2,1,30369,1},0},
	{"Cæ Linh Th¹ch", 60, {2,1,30368,1},0},
	{"§Ünh Hån Thiªn Th¹ch ThÇn Th¹ch", 50, {2,1,1067,1},0},
	{"§¹i §Ünh Hån", 49, {2,1,1113,1},0},
	{"Thiªn Th¹ch Linh Th¹ch", 48, {2,1,1068,1},0},
	{"Thiªn Th¹ch Tinh Th¹ch", 47, {2,1,1009,5},0},
	{"Kinh M¹ch §ång Nh©n", 60, {2,1,30730,1},0},
	{"C­êng Hãa QuyÓn 12", 59, {2, 1, 30424, 1},0},
	{"C­êng Hãa QuyÓn 13", 49, {2, 1, 30425, 1},0},
	{"C­êng Hãa QuyÓn 14", 39, {2, 1, 30426, 1},0},
	{"C­êng Hãa QuyÓn 15", 30, {2, 1, 30427, 1},0},
	{"Th¸i NhÊt LÖnh", 5, {2,1,30687,10},0},
	{"ThiÕt Tinh CÊp 4", 40, {2, 1, 30612, 1},0},
};

ListGif_2 = {
	{"Thiªn Th¹ch Tinh Th¹ch", 50, {2,1,1009,5},0},
	{"Hu©n Ch­¬ng Anh Hïng", 60, {2,1,30499,2},0},
	{"Cæ Linh Ngäc", 60, {2, 1, 30369, 2},0},
	{"Cæ Linh Th¹ch", 60, {2, 1, 30368, 2},0},
	{"Trøng Linh Thó", 20, {2,1,30728,1},0},
	{"Qu©n C«ng Vinh Dù", 70, {2,1,30642,1},0},
	{"Kinh M¹ch Ng©n Nh©n", 10, {2,1,30731,1},0},
	{"Kinh M¹ch Kim Nh©n", 5, {2,1,30732,1},0},
	{"Háa Phông Tinh Hoa", 5, {2,1,30770,1},0},
	{"Th¸i NhÊt LÖnh", 5, {2,1,30687,10},0},
	{"Háa Phông Tinh Hoa", 1, {2,1,30770,2},0},
	{"Thiªn M«n Kim LÖnh", 2, {2,1,30370,1},0},
	{"Thiªn Cang LÖnh", 2, {2,95,204,20},0},
	{"M¶nh Thiªn M«n", 10, {2, 1, 30410, 10},0},
	{"M¶nh Thiªn Cang", 10, {2, 1, 30390, 50},0},
	{"ThiÕt Tinh CÊp 4", 40, {2, 1, 30612, 1},0},
}

nItem = 0;
nDate = CheckDate();

function OnUse(nItemIndex)
	nItem = GetItemParticular(nItemIndex);
	nFinalItem = Event_List[nDate]["final_item"];
	
	if nFinalItem[1][3][3] == nItem then
		local TaskItem = TASK_MOD:GetTask(nFinalItem[1][5]);
		
		if TaskItem >= 2000 then
			Talk(1,"","Trong sù kiÖn lÇn nµy, b¹n ®· dïng tèi ®a "..Max_Event.." vËt phÈm")
			return
		end
	
		DelItem(nFinalItem[1][3][1], nFinalItem[1][3][2], nFinalItem[1][3][3], 1);
		
		local nRand, nName = GetRandByID(ListGif_1);
		local nRet, nItemIdx = gf_AddItemEx2(ListGif_1[nRand][3],ListGif_1[nRand][1]);
		Msg2Player("B¹n nhËn ®­îc "..ListGif_1[nRand][3][4].." "..nName);
		
		ModifyExp(2000000);
		Msg2Player("B¹n nhËn ®­îc 2.000.000 Kinh NghiÖp");
		
		local Random = random(1,100);
		if Random <= 10 then 
			ModifyExp(5000000);
			Msg2Player("B¹n nhËn ®­îc 5.000.000 Kinh NghiÖp");
		end
		
		TASK_MOD:SetTask(nFinalItem[1][5], TaskItem + 1);
		return
	end
	
	if nFinalItem[2][3][3] == nItem then
		local TaskItem = TASK_MOD:GetTask(nFinalItem[2][5]);
		
		if TaskItem >= 2000 then
			Talk(1,"","Trong sù kiÖn lÇn nµy, b¹n ®· dïng tèi ®a "..Max_Event.." vËt phÈm")
			return
		end
	
		DelItem(nFinalItem[2][3][1], nFinalItem[2][3][2], nFinalItem[2][3][3], 1);
		
		local nRand, nName = GetRandByID(ListGif_2);
		local nRet, nItemIdx = gf_AddItemEx2(ListGif_2[nRand][3],ListGif_2[nRand][1]);
		Msg2Player("B¹n nhËn ®­îc "..ListGif_2[nRand][3][4].." "..nName);
		
		ModifyExp(5000000);
		Msg2Player("B¹n nhËn ®­îc 2.000.000 Kinh NghiÖp");
		
		local Random = random(1,100);
		if Random <= 10 then 
			ModifyExp(10000000);
			Msg2Player("B¹n nhËn ®­îc 10.000.000 Kinh NghiÖp");
		end
		
		TASK_MOD:SetTask(nFinalItem[2][5], TaskItem + 1);
		
		return
	end
	
	Talk(1,"","Event ®· kÕt thóc nªn ®¹i hiÖp kh«ng thÓ sö dông vËt phÈm nµy ®­îc n÷a !")
end