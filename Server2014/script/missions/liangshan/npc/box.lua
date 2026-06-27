Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

SF_FILE = "\\script\\missions\\liangshan\\npc\\box.lua"
--ÁºÉ½±¦Ïä½±Àø
tClause4 = {
	{{"Cæ Linh Ngäc", {2,1,30369,5}}, 5.00*100},
	{{"Cæ Linh Th¹ch", {2,1,30368,5}}, 5.00*100},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,5}}, 5.00*100},
	{{"M¶nh Thiªn Cang"    ,{2,1,30390,20}},1.00*100},
	{{"Thiªn Cang LÖnh", {2,95,204,1}}, 0.50*100},
	{{"Tói mËt tÞch s­ m«n cao cÊp"      ,{2,1,30627,1}},        2.80*100 ,7},
		{{"Hu©n ch­¬ng dòng sÜ"       	,{2,1,30498,1}},    	10*100},
	
}
tClause5 = {
	{{"Cæ Linh Ngäc", {2,1,30369,5}}, 5.00*100},
	{{"Cæ Linh Th¹ch", {2,1,30368,5}}, 5.00*100},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,5}}, 5.00*100},
	{{"M¶nh Thiªn Cang"    ,{2,1,30390,20}},1.00*100},
	{{"Thiªn Cang LÖnh", {2,95,204,1}}, 0.50*100},
	{{"Hu©n ch­¬ng dòng sÜ"       	,{2,1,30498,1}},    	4.80*100},
	
}
function getLootSeting(bossLv, bIB)
	if bossLv == 5 then
		tClause = tClause5;
	elseif bossLv == 4 then
		tClause	= tClause4;
	end
	local t = {nil, nil, nil, tClause4,tClause5}
	tClause = t[bossLv];

	if not tClause then
		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
		assert()
	end
	return tClause;
end

function getLootItem(bossLv, bIB)
	local tClause = getLootSeting(bossLv, bIB);

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i,tClause[i][1],tClause[i][3];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function main()
	local nNpcIdx = GetTargetNpc();
    local nStage = GetMissionV(MV_STAGE_LEVEL);
    local bossId = GetUnitCurStates(nNpcIdx, 5)
    if bossId == 0 then
    	bossId = GetMissionV(MV_CUR_BOSS_ID);
    end
	local bossLv = tMission:getBossLv(bossId);

	normalLoot(nNpcIdx, bossLv);
end

function normalLoot(nNpcIdx, bossLv)
	local dwId = GetUnitCurStates(nNpcIdx, 3)
	if dwId == 0 then
		local nRet = ApplyItemDice(1, 100, 30, SF_FILE, "GD_Time_Over", GetTeamSize())
		dwId = nRet;
		local _, tLootItem,nExpireDay = getLootItem(bossLv);
		WriteLog(format("[liangshan:box] [CreateItem:%s]", tLootItem[1]));
		local nItemIndex = AddDiceItemInfo(dwId, gf_UnPack(tLootItem[2]))
		if nExpireDay then
			SetItemExpireTime(nItemIndex,nExpireDay*DAY_SECOND_NUM)
		end
		AddUnitStates(nNpcIdx, 3, dwId);
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if IsPlayerDeath() == 0 then
				RollItem(dwId)
				--Observer:onEvent(OE_LIANGSHAN_BOX);
			end
		end
		PlayerIndex = nPlayerOld
		return
	end

	local nState = GetItemDiceState(dwId)
	if nState == 0 then
		Msg2Player(LSMsgToPlayer[2])
	elseif nState == 1 then
		local n, szItem = DiceLootItem(dwId)
		if n == 0 then
			local szMsg = GetName()..LSMsgToPlayer[4]..szItem
			MU_Msg2Team(szMsg)
		elseif n == 1 then
			Msg2Player(LSMsgToPlayer[3])
		end
	elseif nState == 2 then
		Msg2Player(LSMsgToPlayer[5])
	end
end

function GD_Time_Over(dwId)
	local t, nSize, szItem = GetItemDiceRollInfo(dwId)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1]..format(LSMsgToPlayer[8],value[2])
		if value[3] == 0 then
			str = value[1]..LSMsgToPlayer[9]
		elseif value[3] == 1 then
			str = str.."("..LSMsgToPlayer[10]..")"
			if value[4] == 1 then
				str = str.." -- "..LSMsgToPlayer[11]..szItem
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.."("..LSMsgToPlayer[12]..")"
			if value[4] == 1 then
				str = str.." -- "..LSMsgToPlayer[11]..szItem
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player(LSMsgToPlayer[6])
	elseif nSize ~= getn(t) then
		Msg2Player(LSMsgToPlayer[7])
	end
end
