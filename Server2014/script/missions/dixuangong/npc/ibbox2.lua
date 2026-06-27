Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\online_activites\\award.lua")

msg = "Chóc mõng $n më B¶o R­¬ng §Þa HuyÒn Cung  nhËn ®­îc $i";

--¾«Ó¢±¦Ïä
tClause1 = {
	{{"Cæ Linh Ngäc", {2,1,30369,2}}, 1000},
	{{"Cæ Linh Th¹ch", {2,1,30368,2}}, 1000},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,2}}, 1000},
	{{"M¶nh Thiªn M«n"    ,{2,1,30410,5}},600},
	{{"Thiªn M«n Kim LÖnh", {2,1,30370,1}}, 10},
	
}

--ÎåÆì±¦Ïä
tClause2 = {
	{{"Cæ Linh Ngäc", {2,1,30369,2}}, 1000},
	{{"Cæ Linh Th¹ch", {2,1,30368,2}}, 1000},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,2}}, 1000},
	{{"M¶nh Thiªn M«n"    ,{2,1,30410,5}},600},
	{{"Thiªn M«n Kim LÖnh", {2,1,30370,1}}, 10},
	
}

--ÈýÌÃ±¦Ïä
tClause3 = {
    { {"Cæ Linh Th¹ch", {2,1,30368,5}, nil,nil,{1, 100} }, 1000},
	{ {"Cæ Linh Ngäc", {2,1,30369,5}, nil,nil,{1, 100} }, 1000},
	{ {"Cæ Linh Th¹ch", {2,1,30368,100}, nil,nil,{1, 100} }, 100},
	{ {"Cæ Linh Ngäc", {2,1,30369,100}, nil,nil,{1, 100} }, 100},
	{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,5}, nil,nil, {1, 100}}, 1000},
	{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,100}, nil,nil, {1, 100}}, 100},
	{ {"M¶nh Thiªn M«n", {2,1,30410,5}, nil,nil,{1, 100} }, 400},
	{ {"Thiªn M«n Kim LÖnh", {2,1,30370,1}, nil,nil,{1, 100} }, 10},
	    {{"M¶nh Thiªn M«n"     , {2,1,30410,2}}, 1200},
    {{"M¶nh Thiªn M«n"     , {2,1,30410,4}}, 391},
    {{"M¶nh Thiªn M«n"     , {2,1,30410,20}}, 40},
    {{"Thiªn M«n Kim LÖnh"     , {2,1,30370,1},msg}, 10},
      {{"¸o Choµng Du HiÖp"     , {0,152,26,1},msg}, 100},
    {{"¸o Choµng ThiÕt HuyÕt"     , {0,152,27,1},msg}, 100},
    {{"¸o Choµng V©n Du"     , {0,152,28,1},msg}, 100},

}

--ÄýÔÂ±¦Ïä
tClause4 = {
    {{"Thiªn M«n Kim LÖnh"     , {2,1,30370,1},msg}, 2000},
	{{"Thiªn M«n Kim LÖnh"     , {2,1,30370,2},msg}, 1000},
    {{"Thiªn M«n Kim LÖnh"     , {2,1,30370,3},msg}, 500},
    {{"¸o Choµng Du HiÖp"     , {0,152,26,1},msg}, 200},
    {{"¸o Choµng ThiÕt HuyÕt"     , {0,152,27,1},msg}, 200},
    {{"¸o Choµng V©n Du"     , {0,152,28,1},msg}, 100},

}

tClause = {
	tClause1,
	tClause2,
	tClause3,
	tClause4,
}

function main()
	local tItem = getLootItem();
	if not tItem then return end

	local Daye = GetMissionV(MV_SP_DAYE)
	local tSel = {"KÕt thóc ®èi tho¹i/nothing"}
	if PlayerIndex == Daye then
		tSel = {
			format("Thu thËp vËt phÈm/#lootAwardOther(%d, %d)",PlayerIndex, GetTargetNpc()),
			format("Ph©n chia cho tæ ®éi/#giveOther(%d)",GetTargetNpc()),
			"KÕt thóc ®èi tho¹i/nothing",
		}
	end
	local msg = format("Trong b¶o r­¬ng cã [%s *%d]",tItem[1], tItem[2][4]);
	Say(msg, getn(tSel), tSel);
end

function getRandItem(tClause)
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

function getLootItem()
	local lv = GetMissionV(MV_SP_BOSS_LV);
	local clause = tClause[lv];
	if not clause then return end;

	local sp = GetMissionV(MV_SP_LOOT_ID);
	if sp == 0 then
		sp = getRandItem(clause)
		SetMissionV(MV_SP_LOOT_ID, sp);
		local tItem = clause[sp][1];
		WriteLog(format("[dixuangong:lootItem2] [Role:%s Acc:%s] [bossLv=%d, lootId=%d, itemName=%sx%d]",
			GetName(), GetAccount(), lv, sp, tItem[1], tItem[2][4]));
		--²ú³öÍ³¼Æ
		if tItem[1] == "Thiªn M«n Kim LÖnh" then
			AddRuntimeStat(1,14,0,tItem[2][4]);
		elseif tItem[1] == "CÊp 3 LuyÖn L« ThiÕt" then
			AddRuntimeStat(1,16,0,tItem[2][4]);
		elseif tItem[1] == "CÊp 3 TÈy T©m Th¹ch" then
			AddRuntimeStat(1,17,0,tItem[2][4]);
		elseif tItem[1] == "BÝ Ng©n To¶n" then
			AddRuntimeStat(1,18,0,tItem[2][4]);
		elseif tItem[1] == "BÝ Ng©n Chïy" then
			AddRuntimeStat(1,19,0,tItem[2][4]);
		end
		--2Xu
		--open_dxg_tyjyx_award();
	end
	local tItem = clause[sp][1];
	return tItem;
end

function giveOther(npcId)
	local oldPidx = PlayerIndex;
	local tSel = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if oldPidx ~= PlayerIndex then
			local player_name = GetName();
			player_name = gsub(player_name,"/","-");
			player_name = gsub(player_name,"|","-");
			player_name = gsub(player_name,":","-");
			tinsert(tSel, 1, "Ta cÇn mang phÇn th­ëng ph©n cho   "..player_name.."/#lootAwardOther("..PlayerIndex..","..npcId..")");
		end
	end
	tinsert(tSel, "KÕt thóc ®èi tho¹i/nothing");
	PlayerIndex = oldPidx;
	local tLootItem = getLootItem();
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B¶o r­¬ng<color>: ë ®©y cã"..msg, getn(tSel), tSel);
end

function lootAwardOther(pidx, npcId)
	local oldPidx = PlayerIndex;
	PlayerIndex = pidx;
	local name = GetName();
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Msg2Player("Kh«ng gian hoÆc søc nÆng cña ng­¬i kh«ng ®ñ, kh«ng thÓ nhËn vËt phÈm");
		if pidx ~= oldPidx then
			PlayerIndex = oldPidx;
			Msg2Player(format("%s kh«ng gian hoÆc søc nÆng kh«ng ®ñ, kh«ng thÓ nhËn vËt phÈm", name));
		end
		return
	end
	giveAward(npcId);
	PlayerIndex = oldPidx;
end

function giveAward(npcId)
	local tItem = getLootItem();
	if not tItem then return end

	SetMissionV(MV_SP_LOOT_ID, 0);
	SetMissionV(MV_SP_DAYE, 0);
	SetNpcScript(npcId, "");
	SetNpcLifeTime(npcId, 0);

	gf_SetLogCaption("dixuangong:ibbox2");
	Clause3.giveClause(tItem);
	gf_SetLogCaption("");
end
