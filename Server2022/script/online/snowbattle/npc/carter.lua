Include("\\script\\online\\snowbattle\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

CR_Head = "<color=green>Xa Phu Æ u tr≠Íng Tuy’t: <color>Hoπt ÆÈng ß u Tr≠Íng Tuy’t 1 ngµy ti’n hµnh 3 l«n, thÍi gian bao gÂm 11:30, 17:30, 21:30, mÁi trÀn Æ u duy tr◊ 1 giÍ; ßi“u ki÷n tham gia c p 80 trÎ l™n, Æ∑ gia nhÀp m´n ph∏i, Æ∑ k›ch hoπt c∂nh giÌi kinh mπch.";

function main()
	local CR_Menu1 = {
		"Vµo Khu n–m tuy’t (Ti™u hao 10 vµng t∆ng 10 Ti”u Tuy’t C«u)/CR_DoEnter",
		"Mua Æπn tuy’t c«u/CR_DoShowSaleList",
		"Gi∂i th›ch hoπt ÆÈng/CR_Information",
		"RÍi kh·i/gf_DoNothing"
	}
	local CR_Menu2 = {
		"RÍi kh·i Æ u tr≠Íng tuy’t/CR_DoExit",
		"Mua Æπn tuy’t c«u/CR_DoShowSaleList",
		"Gi∂i th›ch hoπt ÆÈng/CR_Information",
		"RÍi kh·i/gf_DoNothing"
	}
	if 0 == SB_IsInSnowMap() then
		Say(CR_Head, getn(CR_Menu1), CR_Menu1);
	else
		Say(CR_Head, getn(CR_Menu2), CR_Menu2);
	end
end

function CR_DoEnter()
	local mapID = GetWorldPos();
  mapID = SB_MapMap[mapID];
	if 1 ~= SB_CheckState(mapID) then
		Talk(1, "", "R t ti’c, ÆÓt hoπt ÆÈng nµy Æ∑ k’t thÛc, h∑y trÎ lπi l«n sau");
		return
	end
	if 1 ~= SB_CheckPlayerCount(mapID) then
		Talk(1, "", "R t ti’c, Æ u tr≠Íng Æ∑ Æ«y, vui lﬂng trÎ lπi l«n sau");
		return
	end
	if gf_CheckBaseCondition(SB_MIN_LEVEL) ~= 1 then
		return 
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"","R t ti’c, c∏c hπ ch≠a khai th´ng c∂nh giÌi kinh mπch");
		return
	end
	if 1 ~= SB_CheckEquipment() then
		Talk(1, "", "Xin lÁi, h∑y th∏o vÚ kh› xuËng");
		return
	end
	if GetCash() < SB_COST then
		Talk(1,"","R t ti’c, ng©n l≠Óng c∏c hπ mang theo kh´ng ÆÒ!");
		return
	end	
	local itemID = {2, 3, 219, 10};
	local itemName = "Ti”u tuy’t c«u";
	gf_AddItemEx2(itemID, itemName, "ß∏nh trÀn tuy’t", "application gift");
	mf_JoinMission(SB_MISSION_ID, SB_CAMP_ID, mapID);
end

function CR_DoExit()
	DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
end

function CR_DoShowSaleList()
	local CR_Menu3_1 = {
		"10 ßπi Tuy’t C«u (30 vµng)/#CR_DoBuy(1)",
		"10 Trung Tuy’t C«u (20 vµng)/#CR_DoBuy(2)",
		"10 Ti”u Tuy’t C«u (10 vµng)/#CR_DoBuy(3)",
		"Ta chÿ gh– ch¨i/gf_DoNothing",
	}
	Say(CR_Head, getn(CR_Menu3_1), CR_Menu3_1);
end

function CR_DoBuy(index)
	local CR_SaleList = {
		{{2, 3, 221}, "ßπi tuy’t c«u", 10, 300000},
		{{2, 3, 220}, "Trung tuy’t c«u", 10, 200000},
		{{2, 3, 219}, "Ti”u tuy’t c«u", 10, 100000},
	}
	local itemID = CR_SaleList[index][1];
	local itemName = CR_SaleList[index][2];
	local itemCount = CR_SaleList[index][3];
	local cost = CR_SaleList[index][4];
	if GetCash() < cost then
		Talk(1,"","Hµnh trang kh´ng ÆÒ ti“n!");
		return
	end
	if 1 == gf_Judge_Room_Weight(1, itemCount, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], itemCount};
			gf_AddItemEx2(tmpItemID, itemName, "ß∏nh trÀn tuy’t", "Mua Æπn tuy’t c«u");
		end
	end
	CR_DoShowSaleList();	
end

function CR_Information()
	Talk(1,"","Sau khi Æπi hi÷p vµo khu n–m tuy’t, ÆËi thoπi vÌi Thi™n S¨n Tuy’t Y™u Î ch›nh gi˜a, c„ th” tri÷u hÂi Tuy’t Qu∏i. Sau khi Æ∏nh bπi t t c∂ Tuy’t Qu∏i sœ xu t hi÷n l≠Ót ti’p theo, tÊng cÈng c„ 10 l≠Ót. Sau khi Æ∏nh xong 10 l≠Ót th◊ ÆËi thoπi vÌi Thi™n S¨n Tuy’t Y™u, Æ∏nh bπi BOSS sœ nhÀn Æ≠Óc ph«n th≠Îng phong phÛ. Trong khu n–m tuy’t, chÿ c„ th” dÔng k¸ n®ng tuy’t c«u, kh´ng th” trang bﬁ vÚ kh›.")
end
