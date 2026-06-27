Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\missions\\dixuangong\\mission.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_DXG_GOLD_BoxScript = {
	"\\script\\missions\\dixuangong\\npc\\box_gold1.lua",
	"\\script\\missions\\dixuangong\\npc\\box_gold2.lua",
}

T_GOLD_BOX_IDX = {}
function remove_box_gold()
	for i,v in T_GOLD_BOX_IDX do
		if GetNpcName(i) == "Kim R­¬ng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_GOLD_BOX_IDX = {}
end

function create_dxg_box_gold(nNpcIdx, nBoxId)
	if not T_DXG_GOLD_BoxScript[nBoxId] then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("jinbaoxiang", "Kim R­¬ng", m, x2, y2);
	if npc and npc > 0 then
		T_GOLD_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_DXG_GOLD_BoxScript[nBoxId]);
	else
		print("create dixuangong jinbaoxiang fail")
	end
end

function box_gold_create_ib_card_require()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2, 97, 236,1});
	end
	return tRequire;
end

function on_open_dxg_box_gold_card_stage1(nId)
	on_open_dxg_gold_box_card(1,nId)
end
function on_open_dxg_box_gold_card_stage2(nId)
	on_open_dxg_gold_box_card(2,nId)
end

function _stat_when_ib_consume(nConsume)
	SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + nConsume, TASK_ACCESS_CODE_DXG_MISSION);
	AddRuntimeStat(1,13,0,nConsume);
end

function on_open_dxg_gold_box_card(nStage, nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	local nRet = MissionAward_RandAward(nStage, nId, t_dxg_card_award, nil);
	
	if nRet == 1 then
		if nId < 8 then
		--_stat_when_open_free_card()
	else
		--_stat_when_ib_consume(1)	
  	end
	end
end

function on_open_dxg_box_gold(nStage)
	local szFunc = format("on_open_dxg_box_gold_card_stage%d", nStage)
	MA_Mission_OpenUI(MISSION_ID,0, T_DXG_GOLD_BoxScript[nStage], szFunc, box_gold_create_ib_card_require());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tDXGJinBox") --2XU»î¶¯
end

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
	},
	--------------------------------------------
	t_equip_group = --ÔÓÎï×é
	{
	},
};

_t_free_award_stage =
{
	[1] =
		{
			n_equip_group_rate = 0,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 0,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_other_group = --×°±¸×é
        	{
        		{ {"Cæ Linh Th¹ch", {2,1,30368,5}, nil,nil,{1, 100} }, 1000},
		{ {"Cæ Linh Th¹ch", {2,1,30368,100}, nil,nil,{1, 100} }, 100},
		{ {"Cæ Linh Ngäc", {2,1,30369,5}, nil,nil,{1, 100} }, 1000},
		{ {"Cæ Linh Ngäc", {2,1,30369,100}, nil,nil,{1, 100} }, 100},
		{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,5}, nil,nil, {1, 100}}, 1000},
		{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,100}, nil,nil, {1, 100}}, 100},
		{ {"M¶nh Thiªn M«n", {2,1,30410,5}, nil,nil,{1, 100} }, 400},
		{ {"Thiªn M«n Kim LÖnh", {2,1,30370,1}, nil,nil,{1, 100} }, 50},
                		{ {"ThiÕt Tinh cÊp 3", {2,1,30535,1,4}, nil,nil, {1, 100}}, 347},
                		{ {"¸o Choµng Du HiÖp", {0,152,26,1}, nil,1, {1, 100}}, 50},
                		{ {"¸o Choµng ThiÕt HuyÕt", {0,152,27,1}, nil,1, {1, 100}}, 50},
                		{ {"¸o Choµng V©n Du", {0,152,28,1}, nil,1, {1, 100}}, 50},

        	},
		},
	[2] =
		{
			n_equip_group_rate = 0,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 0,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_other_group = --×°±¸×é
        	{
                
        		{ {"Cæ Linh Th¹ch", {2,1,30368,5}, nil,nil,{1, 100} }, 1000},
		{ {"Cæ Linh Th¹ch", {2,1,30368,100}, nil,nil,{1, 100} }, 100},
		{ {"Cæ Linh Ngäc", {2,1,30369,5}, nil,nil,{1, 100} }, 1000},
		{ {"Cæ Linh Ngäc", {2,1,30369,100}, nil,nil,{1, 100} }, 100},
		{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,5}, nil,nil, {1, 100}}, 1000},
		{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,100}, nil,nil, {1, 100}}, 100},
		{ {"M¶nh Thiªn M«n", {2,1,30410,5}, nil,nil,{1, 100} }, 400},
		{ {"Thiªn M«n Kim LÖnh", {2,1,30370,1}, nil,nil,{1, 100} }, 50},
		                { {"ThiÕt Tinh cÊp 3", {2,1,30535,1,4}, nil,nil, {1, 100}}, 347},
                              { {"¸o Choµng Du HiÖp", {0,152,26,1}, nil,1, {1, 100}}, 50},
                { {"¸o Choµng ThiÕt HuyÕt", {0,152,27,1}, nil,1, {1, 100}}, 50},
                { {"¸o Choµng V©n Du", {0,152,28,1}, nil,1, {1, 100}}, 50},
        	},
		},
}

_t_fix_award_stage =
{
}

_t_ib_award_no_stage1 =
{
	t_cost = --ÏûºÄ
	{
		--{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}},
		{"Thiªn Kiªu LÖnh",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib½±Àø
	{
		{ {"Cæ Linh Th¹ch", {2,1,30368,5}, nil,nil,{1, 100} }, 1000},
		{ {"Cæ Linh Th¹ch", {2,1,30368,100}, nil,nil,{1, 100} }, 100},
		{ {"Cæ Linh Ngäc", {2,1,30369,5}, nil,nil,{1, 100} }, 1000},
		{ {"Cæ Linh Ngäc", {2,1,30369,100}, nil,nil,{1, 100} }, 100},
		{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,5}, nil,nil, {1, 100}}, 1000},
		{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,100}, nil,nil, {1, 100}}, 100},
		{ {"M¶nh Thiªn M«n", {2,1,30410,5}, nil,nil,{1, 100} }, 400},
		{ {"Thiªn M«n Kim LÖnh", {2,1,30370,1}, nil,nil,{1, 100} }, 50},
		        { {"M¶nh Thiªn M«n", {2,1,30410,2}, nil,nil, {1, 100}}, 1200},
        { {"M¶nh Thiªn M«n", {2,1,30410,4}, nil,nil, {1, 100}}, 391},
        { {"M¶nh Thiªn M«n", {2,1,30410,20}, nil,nil, {1, 100}}, 40},
        { {"Thiªn M«n Kim LÖnh", {2,1,30370,1}, nil,1, {1, 100}}, 10},
              { {"¸o Choµng Du HiÖp", {0,152,26,1}, nil,1, {1, 100}}, 100},
        { {"¸o Choµng ThiÕt HuyÕt", {0,152,27,1}, nil,1, {1, 100}}, 100},
        { {"¸o Choµng V©n Du", {0,152,28,1}, nil,1, {1, 100}}, 100},

	},
}

_t_ib_award_no_stage2 =
{
	t_cost = --ÏûºÄ
	{
		--{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}},
		{"Thiªn Kiªu LÖnh",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib½±Àø
	{
		{ {"Cæ Linh Th¹ch", {2,1,30368,5}, nil,nil,{1, 100} }, 1000},
		{ {"Cæ Linh Th¹ch", {2,1,30368,100}, nil,nil,{1, 100} }, 100},
		{ {"Cæ Linh Ngäc", {2,1,30369,5}, nil,nil,{1, 100} }, 1000},
		{ {"Cæ Linh Ngäc", {2,1,30369,100}, nil,nil,{1, 100} }, 100},
		{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,5}, nil,nil, {1, 100}}, 1000},
		{ {"Hu©n ch­¬ng anh hïng", {2,1,30499,100}, nil,nil, {1, 100}}, 100},
		{ {"M¶nh Thiªn M«n", {2,1,30410,5}, nil,nil,{1, 100} }, 400},
		{ {"Thiªn M«n Kim LÖnh", {2,1,30370,1}, nil,nil,{1, 100} }, 50},
		        { {"M¶nh Thiªn M«n", {2,1,30410,2}, nil,nil, {1, 100}}, 1200},
        { {"M¶nh Thiªn M«n", {2,1,30410,4}, nil,nil, {1, 100}}, 391},
        { {"M¶nh Thiªn M«n", {2,1,30410,20}, nil,nil, {1, 100}}, 40},
        { {"Thiªn M«n Kim LÖnh", {2,1,30370,1}, nil,1, {1, 100}}, 10},
                { {"¸o Choµng Du HiÖp", {0,152,26,1}, nil,1, {1, 100}}, 100},
        { {"¸o Choµng ThiÕt HuyÕt", {0,152,27,1}, nil,1, {1, 100}}, 100},
        { {"¸o Choµng V©n Du", {0,152,28,1}, nil,1, {1, 100}}, 100},

	},
}

t_dxg_card_award = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu lËt th?miÔn ph?§Þa HuyÒn Cung",
		--¼¸´ÎÃ»ÓÐµÃµ½×°±¸Ê±±Ø³ö×°±¸
		t_equip_round = {},
		n_max_daibi_perday = 30,--Ò»Ìì×î¶à»ñµÃ¶àÉÙ´ú±Ò
		t_stage =
		{
			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "PhÇn th­ëng Cæ ®Þnh ¶i §Þa HuyÒn Cung",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu lËt th?thu ph?§Þa HuyÒn Cung",
		t_stage = 
		{
			[1] = _t_ib_award_no_stage1,
			[2] = _t_ib_award_no_stage2,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage1 = nil
_t_ib_award_no_stage2 = nil
