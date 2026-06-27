Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_BoxScript = {
	"\\script\\missions\\dixuangong\\npc\\box_tong1.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong2.lua",
	nil,
	"\\script\\missions\\dixuangong\\npc\\box_tong4.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong5.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong6.lua",
	nil,
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

function create_box_tong(nNpcIdx, nBoxId)
	if not T_BoxScript[nBoxId] then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	--ÌìÒõÃÜÏä1¸ö
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("tongbaoxiang", "R­¬ng §ång", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc]  = 1
--		SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_BoxScript[nBoxId]);
	else
		print("create tongbaoxiang fail")
	end
end
        
tClause1 = {
	{{"Cæ Linh Ngäc", {2,1,30369,2}}, 10*45},
	{{"Cæ Linh Th¹ch", {2,1,30368,2}}, 10*45},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,2}}, 10 *45},
	{{"M¶nh Thiªn M«n"    ,{2,1,30410,5}},10*25},
	{{"Thiªn M«n Kim LÖnh", {2,1,30370,1}}, 10*5},
}
tClause2 = {
	{{"Cæ Linh Ngäc", {2,1,30369,2}}, 10*45},
	{{"Cæ Linh Th¹ch", {2,1,30368,2}}, 10*45},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,2}}, 10 *45},
	{{"M¶nh Thiªn M«n"    ,{2,1,30410,5}},10*25},
	{{"Thiªn M«n Kim LÖnh", {2,1,30370,1}}, 10*5},

}
tClause4 = {
	{{"Cæ Linh Ngäc", {2,1,30369,2}}, 10*45},
	{{"Cæ Linh Th¹ch", {2,1,30368,2}}, 10*45},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,2}}, 10 *45},
	{{"M¶nh Thiªn M«n"    ,{2,1,30410,5}},10*25},
	{{"Thiªn M«n Kim LÖnh", {2,1,30370,1}}, 10*5},

}
tClause5 = {
	{{"Cæ Linh Ngäc", {2,1,30369,2}}, 10*45},
	{{"Cæ Linh Th¹ch", {2,1,30368,2}}, 10*45},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,2}}, 10 *45},
	{{"M¶nh Thiªn M«n"    ,{2,1,30410,5}},10*25},
	{{"Thiªn M«n Kim LÖnh", {2,1,30370,1}}, 10*5},

}
tClause6 = {
	{{"Cæ Linh Ngäc", {2,1,30369,2}}, 10*45},
	{{"Cæ Linh Th¹ch", {2,1,30368,2}}, 10*45},
	{{"Hu©n ch­¬ng anh hïng", {2,1,30499,2}}, 10 *45},
	{{"M¶nh Thiªn M«n"    ,{2,1,30410,5}},10*25},
	{{"Thiªn M«n Kim LÖnh", {2,1,30370,1}}, 10*5},

}                   

tClause = {
	tClause1,
	tClause2,
	nil,--tClause3,
	tClause4,
	tClause5,
	tClause6,
	nil,--tClause7,
}

function on_open(nStage)
	local tItem = gf_RandRate(tClause[nStage], nil, 2)[1];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tDXGTongBox")
end

