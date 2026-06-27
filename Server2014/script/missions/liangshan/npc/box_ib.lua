Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\lingshi_head.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")

msg = format("Chóc mõng $n ®· nhËn ®­îc $i tõ L­¬ng S¬n QuÇn Anh Héi", itemName);
--ºÃººÏä×Ó
function giveItem(self)
	ItemCreate:create(self[1])
	local notice = gsub(msg, "\$n", GetName());
	notice = gsub(notice, "\$i", self[1]);
	Msg2Global(notice);
end
tClause1 = {
    {{"Thiªn Cang LÖnh"          ,{2,95,204,1},msg},     80000},
    {{"Thiªn Cang LÖnh"          ,{2,95,204,2},msg},     10000},
    {{"Thiªn Cang LÖnh"          ,{2,95,204,3},msg},     5000},
 {{"Huy Ch­¬ng Du HiÖp"          ,{0,153,26,1},msg},     2000},
    {{"Huy Ch­¬ng ThiÕt HuyÕt"          ,{0,153,27,1},msg},     2000},
    {{"Huy Ch­¬ng V©n Du"          ,{0,153,28,1},msg},     1000},

}
tClause2 = {
	{{"Cæ Linh Ngäc", {2,1,30369,15}}, 6000},
	{{"Cæ Linh Th¹ch", {2,1,30368,15}}, 6000},
    {{"Hu©n ch­¬ng anh hïng" ,{2,1,30499,15}}, 6000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,20}},     12000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,50}},     4000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,100}},     400},
    {{"Thiªn Cang LÖnh" ,{2,95,204,1},msg},     100},
	    {{"M¶nh Thiªn Cang"          ,{2,1,30390,10}},     12000},
    {{"M¶nh Thiªn Cang"          ,{2,1,30390,20}},     3910},
    {{"M¶nh Thiªn Cang"          ,{2,1,30390,100}},     400},
    {{"Thiªn Cang LÖnh"          ,{2,95,204,1},msg},     100},
       {{"Huy Ch­¬ng Du HiÖp"          ,{0,153,26,1},msg},     100},
    {{"Huy Ch­¬ng ThiÕt HuyÕt"          ,{0,153,27,1},msg},     100},
    {{"Huy Ch­¬ng V©n Du"          ,{0,153,28,1},msg},     100},

}
tClause3 = {
   {{"Cæ Linh Ngäc", {2,1,30369,15}}, 6000},
	{{"Cæ Linh Th¹ch", {2,1,30368,15}}, 6000},
    {{"Hu©n ch­¬ng anh hïng" ,{2,1,30499,15}}, 6000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,20}},     12000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,50}},     4000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,100}},     400},
    {{"Thiªn Cang LÖnh" ,{2,95,204,1},msg},     100},
 
}
tClause4 = {
   {{"Cæ Linh Ngäc", {2,1,30369,15}}, 6000},
	{{"Cæ Linh Th¹ch", {2,1,30368,15}}, 6000},
    {{"Hu©n ch­¬ng anh hïng" ,{2,1,30499,15}}, 6000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,20}},     12000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,50}},     4000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,100}},     400},
    {{"Thiªn Cang LÖnh" ,{2,95,204,1},msg},     100},
 
}
tClause5 = {
	{{"Cæ Linh Ngäc", {2,1,30369,15}}, 6000},
	{{"Cæ Linh Th¹ch", {2,1,30368,15}}, 6000},
    {{"Hu©n ch­¬ng anh hïng" ,{2,1,30499,15}}, 6000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,20}},     12000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,50}},     4000},
    {{"M¶nh Thiªn Cang" ,{2,1,30390,100}},     400},
    {{"Thiªn Cang LÖnh" ,{2,95,204,1},msg},     100},
 
}
function getLootSeting(bossLv)
	local t = {tClause1,tClause2,tClause3,tClause4,tClause5}
	tClause = t[bossLv];
	if not tClause then
		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
		assert()
	end
	return tClause;
end

function getLootItem(bossLv)
	local tClause = getLootSeting(bossLv);

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

function main()
	speLoot();
end

function speLoot()
	local nNpcIdx = GetTargetNpc();
    local bossId = GetMissionV(MV_CUR_BOSS_ID);
	local bossLv = tMission:getBossLv(bossId);
	local daye = GetMissionV(MV_DAYE);
	if daye == -1 or daye == 0 then
		return
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
				tinsert(tSel, 1, "Ta cÇn mang phÇn th­ëng ph©n cho "..player_name.."/#lootAwardOther("..PlayerIndex..","..nNpcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "Ta muèn nhËn phÇn th­ëng/#lootAward("..PlayerIndex..","..nNpcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem(bossLv);
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting(bossLv);
	if not tClause or not tClause[nLootItemId] or not tClause[nLootItemId][1] then
		WriteLog(format("[ERROR] [liangshan:lootError] [Role:%s Acc:%s][bossLv=%s, nLootItemId=%s]",
			GetName(), GetAccount(), tostring(bossLv), tostring(nLootItemId)));
		nLootItemId = getLootItem(bossLv);
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end
	local tLootItem = tClause[nLootItemId][1];
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B¶o r­¬ng<color>: ë ®©y cã"..msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)

	if 1 ~= tMission:CheckTargetNpc(box_index) then return end

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
	if GetFreeItemRoom()  < 3 then
		Talk(1,"","<color=green>Th«ng b¸o<color>: <color=yellow>Hµnh trang<color> c¸c h¹ kh«ng ®ñ!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>Th«ng b¸o<color>: : <color=green>"..s_palyer_name.."<color><color=yellow>Hµnh trang<color> ®· ®Çy, kh«ng thÓ ph©n phèi!")
		return
	end

	PlayerIndex = player_index_save

	lootAward(player_index, box_index)

end

function lootAward(player_index, box_index)

	if 1 ~= tMission:CheckTargetNpc(box_index) then return end

	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(3, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local bossId = GetMissionV(MV_CUR_BOSS_ID);
	local bossLv = tMission:getBossLv(bossId);

	local daye = GetMissionV(MV_DAYE);
	if daye == -1 then
		daye = GetTeamMember(0);
	end
	if daye ~= PlayerIndex then
		return
	end

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem(bossLv);
	end
	local tLoot = getLootSeting(bossLv)[nLootItemId];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_DAYE, 0);
	SetMissionV(MV_LAO_ER, 0);

	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption("liangshan:ib_box");
	local nItemIndex = Clause3.giveClause(tLoot[1]);
	if tLoot[3] then
		SetItemExpireTime(nItemIndex,tLoot[3]*DAY_SECOND_NUM)
	end
	gf_SetLogCaption("");
	PlayerIndex = player_index_save;
	
		--Ììî¸Áî
	if tLoot[1][1] == TTGLInfo[4] then
		_stat_when_ib_produce(tLoot[1][2][4])--IBµÀ¾ß²ú³öÍ³¼Æ
	end
end
