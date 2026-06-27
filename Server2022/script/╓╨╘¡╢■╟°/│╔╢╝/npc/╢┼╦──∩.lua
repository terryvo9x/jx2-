--Éú²ú¼¼ÄÜ½ä×Ó²ÄÁÏÖÆ×÷
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>§ç Tø N­¬ng<color>: ";

function main()
	local tSay = {
		format("\nTiÖm Linh §å Giíi ChØ/#show_equip_shop(%d)", 3044),
		--format("\nºÀÏÀ×°±¸ÉÌµê/#show_equip_shop(%d)", 3045),
		--format("\n¸ß¼¶²ÄÁÏÉÌµê/#show_equip_shop(%d)", 3043),
		"\nTiÕn cÊp trang bÞ Hµo HiÖp/NormalHaoxia2Level",
		"\nT«i chØ xem xem th«i/nothing",
	}		
	Say(DSN_NPC..format("%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

tRecipe2Level = {
	[0] = {{"Viªm Linh Bè", {2, 1, 30676, 15}}, {"Linh ThiÕt", {2, 1, 30681, 30}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 300}}},
	[1] = {{"Ma Lang Gi¸p", {2, 1, 30677, 15}}, {"Linh ThiÕt", {2, 1, 30681, 30}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 300}}},
	[2] = {{"HuyÒn Viªm C­¬ng", {2, 1, 30675, 20}}, {"Thiªn M«n Kim LÖnh", {2, 1, 30370, 10}}, {"Thiªn Cang LÖnh", {2, 95, 204, 10}}, {"Linh KhÝ Rùc Rì", {2, 1, 31122, 2}},},
	[3] = {{"§Þa Long Gi¸p", {2, 1, 30678, 15}}, {"Linh ThiÕt", {2, 1, 30681, 30}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 300}}},
}

tWuxiaHaoxia = {
	[0] = {"V« H¹ Hµo HiÖp LÖnh (Nãn)",	{2, 1, 30944, 1, 4}},
	[1] = {"V« H¹ Hµo HiÖp LÖnh (ƒo)",	{2, 1, 30945, 1, 4}},
	[2] = {"V« H¹ Hµo HiÖp LÖnh (Vò KhÝ)",    {2, 1, 30973, 1, 4}},
	[3] = {"V« H¹ Hµo HiÖp LÖnh (QuÇn)",	{2, 1, 30946, 1, 4}},
}

tEnhanceAward = {
	[1] = {{2,2,7,1,4}},
	[2] = {{2,2,7,2,4}},
	[3] = {{2,2,7,4,4}},
	[4] = {{2,2,7,8,4}},
	[5] = {{2,2,7,16,4}},
	[6] = {{2,2,7,16,4},{2,2,8,10,4}},
	[7] = {{2,2,7,16,4},{2,2,8,20,4}},
	[8] = {{2,2,7,16,4},{2,2,8,40,4}},
	[9] = {{2,2,7,16,4},{2,2,8,80,4}},
	[10] = {{2,2,7,16,4},{2,2,8,160,4}},	
	[11] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,4,4}},
	[12] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,8,4}},
	[13] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,16,4}},
	[14] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,32,4}},
	[15] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,64,4}},
}

function NormalHaoxia2Level()
	local tSay = {
		format("§æi V« H¹ Hµo HiÖp LÖnh (Nãn)/#NormalHaoxia2Level_do(%d)", 0),
		format("§æi V« H¹ Hµo HiÖp LÖnh (ƒo)/#NormalHaoxia2Level_do(%d)", 1),
		format("§æi V« H¹ Hµo HiÖp LÖnh (QuÇn)/#NormalHaoxia2Level_do(%d)", 3),
		format("%s/#NormalHaoxia2Level_do(%d)", "§æi V« H¹ Hµo HiÖp LÖnh (Vò khÝ)", 2),
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(DSN_NPC..format("TiÕn cÊp trang bÞ Hµo HiÖp, mêi %s h·y chän lo¹i cÇn ®æi: <color=red> (H·y mÆc trang bÞ Hµo HiÖp trªn ng­êi)<color>", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function NormalHaoxia2Level_do(nPos)
	local msg = "§æi [<color=green>%s<color>] cÇn tiªu hao: %s. <color=red>(Sau khi ®æi trang bÞ Hµo HiÖp ®· c­êng hãa, hoµn tr¶ ®é c­êng hãa theo quy t¾c t¸ch)<color>"
	local tRecipe = tRecipe2Level[nPos];
	local szCost = ""
	for i = 1, getn(tRecipe) do
		szCost = format("%s, %d [%s]", szCost, tRecipe[i][2][4], tRecipe[i][1])
	end
	szCost = strsub(szCost,2)
	msg = format(msg, tWuxiaHaoxia[nPos][1], szCost)
	Say(DSN_NPC..msg, 2, format("§æi ngay/#Exchange2Wuxiaohao(%d)", nPos), "T¹i h¹ chØ xem qua th«i/nothing")
end

function Exchange2Wuxiaohao(nPos)
	local nItemIndex = GetPlayerEquipIndex(nPos);
	local nEnhance = min(GetEquipAttr(nItemIndex, 2), 15);
	local nP = GetItemParticular(nItemIndex);
	if (nPos~= 2 and nP ~= 30568) or (nPos==2 and not(nP >= 30724 and nP <= 30743)) then
		Talk(1,"",DSN_NPC.."Ph¶i mÆc trang bÞ Hµo HiÖp lªn ng­êi míi ®­îc tiÕn cÊp!");
		return 0;
	end
	local tRecipe = tRecipe2Level[nPos];
	for i = 1, getn(tRecipe) do
		if GetItemCount(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3]) < tRecipe[i][2][4] then
			Talk(1,"",DSN_NPC..format("%s kh«ng ®ñ %d c¸i, kh«ng thÓ hoµn thµnh ®æi.", tRecipe[i][1], tRecipe[i][2][4]));
			return 0;
		end
	end
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	for i = 1, getn(tRecipe) do
		if DelItem(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3], tRecipe[i][2][4]) ~= 1 then
			return 0;
		end
	end
	if DelItemByIndex(nItemIndex, -1) ~= 1 then
		return 0;
	end	
	if nEnhance > 0 then
		local t = tEnhanceAward[nEnhance];
		for _, v in t do
			gf_AddItemEx2(v, GetItemName(v[1],v[2],v[3]), "TiÕn cÊp Hµo HiÖp", "Hoµn tr¶ ®é c­êng hãa", 0, 1);
		end
	end
	local tAward = tWuxiaHaoxia[nPos];
	gf_AddItemEx2(tAward[2], tAward[1], "TiÕn cÊp Hµo HiÖp", "V« H¹ Hµo HiÖp LÖnh", 0, 1);
end
