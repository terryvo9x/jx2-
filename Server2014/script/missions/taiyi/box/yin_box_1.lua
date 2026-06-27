--Òø±¦Ïä1
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\class\\clause3.lua")

Include("\\script\\missions\\taiyi\\head.lua")
Include("\\script\\missions\\taiyi\\tyfunctions.lua")

Include("\\script\\online_activites\\head\\activity_normal_head.lua")

--Sù KiÖn
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");


MV_WHO_IS_DAYE = tTY.mv_35;
MV_LOOT_ID = tTY.mv_36;
LOG_TITLE = "PhÇn Thiªn L©m-Th¸i NhÊt Th¸p";
NEED_ROOM = 2;
OPEN_BOX_NEED = {"Thiªn Kiªu LÖnh", 2, 97, 236, 1};
msg = "Chóc mõng $n trong PhÇn Thiªn L©m-Th¸i NhÊt Th¸p më b¶o r­¬ng nhËn ®­îc $i";

thisFilePath = "\\script\\missions\\taiyi\\box\\yin_box_1.lua"

tAward = {
	randMulti = 1,
	subclauses = {
		{ {"Cæ Linh Th¹ch", {2,1,30368,2}}, 7000},
		{ {"Cæ Linh Ngäc", {2,1,30369,2}}, 6000},
		{ {"Cæ Linh Th¹ch", {2,1,30368,100}}, 500},
		{ {"Cæ Linh Ngäc", {2,1,30369,100}}, 500},
        {{"Hu©n ch­¬ng anh hïng"    ,{2,1,30499,2,4}},8000},
        {{"Hu©n ch­¬ng anh hïng"    ,{2,1,30499,100,4}},500},
        {{"Th¸i NhÊt LÖnh"    	,{2,1,30687,5},msg},7000},
        {{"Th¸i NhÊt LÖnh"    	,{2,1,30687,20},msg},2000},
        {{"Th¸i NhÊt LÖnh"    	,{2,1,30687,100},msg},300},
	        {{"Th¸i NhÊt LÖnh"    	,{2,1,30687,1,4},msg},0},
        {{"Th¸i NhÊt LÖnh"    	,{2,1,30687,2,4},msg},0},
        {{"Th¸i NhÊt LÖnh"    	,{2,1,30687,4,4},msg},0},
				{{"Viªm Linh Ti"			,{2,1,30671,1}},10000},
				{{"Da Ma Lang"			,{2,1,30672,1}},10000},
				{{"Da §Þa Long"			,{2,1,30673,1}},10000},
				{{"Linh §å §Çu (KiÓu chØ ®Þnh)" , "gf_RandLingTu(1, 1)", thisFilePath},1000},
				{{"Linh §å Y (KiÓu chØ ®Þnh)" , "gf_RandLingTu(2, 1)", thisFilePath},1000},
				{{"Linh §å Khè (KiÓu chØ ®Þnh)" , "gf_RandLingTu(3, 1)", thisFilePath},1000},

	},
	giveClause = ClauseRandom.giveClause,
	give = ClauseRandom.giveClause,
}

function main()
	local npcIdx = GetTargetNpc();
	if GetMissionV(MV_WHO_IS_DAYE) == 0 then
		Say("Më [R­¬ng B¹c] cÇn 1 [Thiªn Kiªu LÖnh] (Ngù C¸c cã b¸n).",
			2,
			"\n x¸c nhËn më/#IamDaye("..npcIdx..")",
			"\n hñy më/nothing");
		return
	else
		speLoot(npcIdx);
	end
end

function IamDaye(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);

	if 0 ~= daye then
		Talk(1, "", "§· cã ng­êi më r­¬ng nµy råi");
		return 0;
	end

	if DelItem(OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]) == 1 then
		SetMissionV(MV_WHO_IS_DAYE, PlayerIndex);
		speLoot(npcIdx);
		AddRuntimeStat(18, 5, GetMissionV(2)-1, (OPEN_BOX_NEED[5] or 1));
		
		local tClause = getLootSeting();
		local nLootItemId = GetMissionV(MV_LOOT_ID);
		if nLootItemId > 0 and nLootItemId <= getn(tClause) then
			local tItem = tClause[nLootItemId][1];
			if tItem and type(tItem) == "table" then
				if tItem[1] == "Viªm Linh Ti" then
					AddRuntimeStat(18, 44, 0, 1);
				elseif tItem[1] == "Da Ma Lang" then
					AddRuntimeStat(18, 45, 0, 1);
				elseif tItem[1] == "Da §Þa Long" then
					AddRuntimeStat(18, 46, 0, 1);
				elseif tItem[1] == "Th¸i NhÊt LÖnh" then
					AddRuntimeStat(18, 47, 0, 1);
				end
			end
		end
		
		--cdkey
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_SetCostIB(%d)", OPEN_BOX_NEED[5]));	
		vaf_award_api("tTYTYinBox")
	else
		Talk(1, "", "Trªn ng­êi kh«ng cã [Thiªn Kiªu LÖnh], kh«ng thÓ më <color=green>R­¬ng B¹c<color>. [Thiªn Kiªu LÖnh] cã thÓ mua trong <color=yellow>Ngù C¸c<color>");
	end
end

function getLootSeting()
	return tAward.subclauses;
end

function getLootItem()
	local tClause = getLootSeting();

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i, tClause[i][1];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function speLoot(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);
	if daye == 0 then
		return 0;
	end
	local tSel = {
			"KÕt thóc ®èi tho¹i/nothing",
		}
	local OldPlayerIndex = PlayerIndex;
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = zgc_pub_name_replace(player_name,"/","-");
				player_name = zgc_pub_name_replace(player_name,"|","-");
				player_name = zgc_pub_name_replace(player_name,":","-");
				tinsert(tSel, 1, "Ta cÇn mang phÇn th­ëng ph©n cho "..player_name.."/#lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "Ta muèn nhËn phÇn th­ëng/#lootAward("..PlayerIndex..","..npcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting();
	local tLootItem = tClause[nLootItemId][1];
	local nCount = 1;
	if tLootItem[2] and type(tLootItem[2]) == "table" then
		nCount = tLootItem[2][4];
	end
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B¶o r­¬ng<color>: ë ®©y cã"..msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)
	local player_index_save = PlayerIndex
	--ÅÐ¶Ï¸ÃË÷ÒýÊÇ·ñ»¹ÊÇÔÚ¸Ã¶ÓÎéÖÐ
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Chó ý<color>: Xin mêi h·y kiÓm tra l¹i nh÷ng ng­êi mµ b¹n ph©n chia cã ph¶i cã cïng <color=yellow>tæ ®éi<color> víi b¹n!")
		return
	end
	--·ÖÅä¶ÔÏóµÄ¿Õ¼ä¸ºÖØ¼ì²â
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom()  < NEED_ROOM then
		Talk(1,"","<color=green>Th«ng b¸o<color>: <color=yellow>Hµnh trang<color> c¸c h¹ kh«ng ®ñ!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>Th«ng b¸o<color>: : <color=green>"..s_palyer_name.."<color><color=yellow>Hµnh trang<color> ®· ®Çy, kh«ng thÓ ph©n phèi!")
		return
	end

	PlayerIndex = player_index_save
	lootAward(player_index, box_index)
end

function lootAward(player_index, box_index)
	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(NEED_ROOM, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
	end
	local tLoot = getLootSeting()[nLootItemId][1];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_WHO_IS_DAYE, 0);
	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption(LOG_TITLE);
	Clause3.giveClause(tLoot);
	gf_SetLogCaption("");
	
	EventAddPhoBan(20);
	
	PlayerIndex = player_index_save;
end