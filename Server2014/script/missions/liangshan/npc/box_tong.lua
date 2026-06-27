Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_TongBoxScript = {
	"\\script\\missions\\liangshan\\npc\\box_tong1.lua",
	"\\script\\missions\\liangshan\\npc\\box_tong2.lua",
	"\\script\\missions\\liangshan\\npc\\box_tong3.lua",
	nil,
	"\\script\\missions\\liangshan\\npc\\box_tong5.lua",
	"\\script\\missions\\liangshan\\npc\\box_tong6.lua",
	"\\script\\missions\\liangshan\\npc\\box_tong7.lua",
}

T_TONG_BOX_IDX = {}
function remove_tong_box()
	for i,v in T_TONG_BOX_IDX do
		if GetNpcName(i) == "R­¬ng §ång" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_TONG_BOX_IDX = {}
end

function create_box_tong(m,x,y, nBoxId)
	if not T_TongBoxScript[nBoxId] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	--ÌìÒõÃÜÏä1¸ö
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("tongbaoxiang", "R­¬ng §ång", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_TongBoxScript[nBoxId]);
	else
		print("create ls tongbaoxiang fail")
	end
end
        
tClause1 = {
    {{"Cæ Linh Ngäc", {2,1,30369,5}}, 10000},
	{{"Cæ Linh Th¹ch", {2,1,30368,5}}, 10000},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,10}}, 10000},
	{{"M¶nh Thiªn Cang"    ,{2,1,30390,10}},5000},
	{{"Thiªn Cang LÖnh", {2,95,204,1}}, 1000},
	
}
tClause2 = {
     {{"Cæ Linh Ngäc", {2,1,30369,5}}, 10000},
	{{"Cæ Linh Th¹ch", {2,1,30368,5}}, 10000},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,10}}, 10000},
	{{"M¶nh Thiªn Cang"    ,{2,1,30390,10}},5000},
	{{"Thiªn Cang LÖnh", {2,95,204,1}}, 1000},
	
}
tClause3 = {
     {{"Cæ Linh Ngäc", {2,1,30369,5}}, 10000},
	{{"Cæ Linh Th¹ch", {2,1,30368,5}}, 10000},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,10}}, 10000},
	{{"M¶nh Thiªn Cang"    ,{2,1,30390,10}},5000},
	{{"Thiªn Cang LÖnh", {2,95,204,1}}, 1000},
	
} 
tClause5 = {
     {{"Cæ Linh Ngäc", {2,1,30369,5}}, 10000},
	{{"Cæ Linh Th¹ch", {2,1,30368,5}}, 10000},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,10}}, 10000},
	{{"M¶nh Thiªn Cang"    ,{2,1,30390,10}},5000},
	{{"Thiªn Cang LÖnh", {2,95,204,1}}, 1000},
	
} 
tClause6 = {
	 {{"Cæ Linh Ngäc", {2,1,30369,5}}, 10000},
	{{"Cæ Linh Th¹ch", {2,1,30368,5}}, 10000},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,10}}, 10000},
	{{"M¶nh Thiªn Cang"    ,{2,1,30390,10}},5000},
	{{"Thiªn Cang LÖnh", {2,95,204,1}}, 1000},
	
} 
tClause7 = {
     {{"Cæ Linh Ngäc", {2,1,30369,5}}, 10000},
	{{"Cæ Linh Th¹ch", {2,1,30368,5}}, 10000},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,10}}, 10000},
	{{"M¶nh Thiªn Cang"    ,{2,1,30390,10}},5000},
	{{"Thiªn Cang LÖnh", {2,95,204,1}}, 1000},
  
}

tClause = {
	tClause1,
	tClause2,
	tClause3,
	nil,
	tClause5,
	tClause6,
	tClause7,
}

function on_open(nStage)
	local tItem = gf_RandRate(tClause[nStage], nil, 2)[1];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tLiangShanTongBox")
end

