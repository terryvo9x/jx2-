--Í­±¦Ïä3
Include("\\script\\missions\\taiyi\\tyfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function main()
	local tAward = {
		{45, {"Cæ Linh Th¹ch", {2,1,30368,5}}},
		{45, {"Cæ Linh Ngäc", {2,1,30369,5}}},
		{45, {"Hu©n ch­¬ng anh hïng", {2,1,30499,5}}},
		{45, {"Th¸i NhÊt LÖnh"    ,{2,1,30687,10}}},
		{30, {"Th¸i NhÊt LÖnh"    ,{2,1,30687,20}}},
		{10, {"Th¸i NhÊt LÖnh", {2,1,30687,100}}},
				{5, {"Viªm Linh Ti",{2,	1,	30671, 1}}},
		{5, {"Da Ma Lang",{2,	1,	30672, 1}}},
		{5, {"Da §Þa Long",{2,	1,	30673, 1}}},
		{5, {"Vá G­¬m Cò", {2,	1,	30694, 1}}},

	}
	local tItem = gf_RandRate(tAward)[2];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");	
	
	if tItem[1] == "Viªm Linh Ti" then
		AddRuntimeStat(18, 44, 0, 1);
	elseif tItem[1] == "Da Ma Lang" then
		AddRuntimeStat(18, 45, 0, 1);
	elseif tItem[1] == "Da §Þa Long" then
		AddRuntimeStat(18, 46, 0, 1);
	end


	gf_TeamOperateEX(vaf_award_api, "tTYTTongBox")
end