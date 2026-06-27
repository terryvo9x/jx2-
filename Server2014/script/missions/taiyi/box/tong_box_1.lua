--Õ≠±¶œ‰1
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\taiyi\\tyfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function main()
	local tAward = {
		{45, {"CÊ Linh Thπch", {2,1,30368,5}}},
		{45, {"CÊ Linh Ng‰c", {2,1,30369,5}}},
		{45, {"Hu©n ch≠¨ng anh hÔng", {2,1,30499,5}}},
		{45, {"Th∏i Nh t L÷nh"    ,{2,1,30687,10}}},
		{30, {"Th∏i Nh t L÷nh"    ,{2,1,30687,20}}},
		{10, {"Th∏i Nh t L÷nh", {2,1,30687,100}}},
			}
	local tItem = gf_RandRate(tAward)[2];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");	
	gf_TeamOperateEX(vaf_award_api, "tTYTTongBox")
end