--奖励
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\class\\clause3.lua");
Include("\\script\\lib\\itemfunctions.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")

CUSTOM_AWARD_GIVE_ALL=1

--圣物奖励(ok)
function yp_aw_giveAward_1()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_relic", 0)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1105)");	
	end);
	
	--任务触发
	--Include("\\script\\global\\events.lua")
	--EventOnTrigger(7, {name="收集五行心魂丹", category=random(5)});
	FireEvent("event_mission_task_award", "pvp", "shengwu", 0)
end

--藏剑秘传心经(ok)
function yp_aw_giveAward_2()
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_HeartSutra99", 1)
	CustomAwardGiveGroup("preach_HeartSutra99_2", 0)
	CustomAwardGiveGroup("preach_HeartSutra99_3", 0)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2208)");	
	end);

	AddRuntimeStat(29, 3, 0, 1);
end

--百晓生秘法(ok)
function yp_aw_giveAward_3()
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_arcane99", 1)
	CustomAwardGiveGroup("preach_arcane99_2", 0)
	CustomAwardGiveGroup("preach_arcane99_3", 0)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2208)");	
	end);

	AddRuntimeStat(29, 4, 0, 1);
end

--Npc军团消失
function yp_aw_giveAward_4()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("npc_legion_disappear", CUSTOM_AWARD_GIVE_ALL)
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1106)");	
	end);
end

--Npc军团包裹
function yp_aw_giveAward_5()
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("npc_legion_package", CUSTOM_AWARD_GIVE_ALL)
end

--偷经书任务(ok)
function yp_aw_giveAward_6()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	local nStep = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1);
	--local nFinish = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2);
	if nStep < 0 or nStep > 6 then
		nStep = 6;
	end
	local tAward = {
		"StealingBooks_a",
    "StealingBooks_b",
    "StealingBooks_c",
    "StealingBooks_d",
    "StealingBooks_e",
    "StealingBooks_f",
    "StealingBooks_g",
	}
	local szAward = tAward[nStep+1]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
	--gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2,nFinish+1);	
	
	--任务触发
	--Include("\\script\\global\\events.lua")
	--EventOnTrigger(7, {name="收集内功心经", category=nStep+1});
	FireEvent("event_mission_task_award", "pvp", "toujingshu", nStep+1)
	TriggerMisEvent("event_yp_taskfinish", "Tr閙 Kinh S竎h", nStep+1);
	AddRuntimeStat(29, 5, 0, 1);
end

--种子浇水奖励(ok)
function yp_aw_giveAward_7(nLevel, nIdx)
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	if not tSeedName[nLevel] or not tSeedName[nLevel][nIdx] then
		return 0
	end
	local szAward = tSeedName[nLevel][nIdx][4]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--玉魄奖励
function yp_aw_giveAward_8(nType)
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	if nType > 4 or nType <= 0 then 
		return 0;
	end	
	local tAward = {
		"JadeSoul0",
		"JadeSoul1",
		"JadeSoul2",
		"JadeSoul3",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
		CustomAwardGiveGroup(szAward.."_0", 0)
	end
end

--完成种植任务
function yp_aw_giveAward_9()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_SUR,0);
	CustomAwardGiveGroup("tree_mission", CUSTOM_AWARD_GIVE_ALL)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2205)");	
	end);
	
	AddRuntimeStat(29, 7, 0, 1);
	--Observer:onEvent(SYSEVENT_YP_HJMG_TASK, 0);
	FireEvent("event_mission_task_award", "pvp", "plant", 0)
end

--完成偷取果实任务(ok)
function yp_aw_giveAward_10()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
	CustomAwardGiveGroup("tree_steal", CUSTOM_AWARD_GIVE_ALL)
	--Observer:onEvent(SYSEVENT_YP_STEALFRUIT_TASK, 0);
	FireEvent("event_mission_task_award", "pvp", "touguoshi", 0)
	TriggerMisEvent("event_yp_taskfinish", "Tr閙 Ng鋍 Ph竎h");
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1104)");	
	end);
end

--种植本人奖励(ok)
function yp_aw_giveAward_11()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("TreePlanting", CUSTOM_AWARD_GIVE_ALL)
	
end

--种植其它人奖励(ok)
function yp_aw_giveAward_12()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("TreePlanting_share", 0)

end

--宝藏任务(ok)
function yp_aw_giveAward_13()
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("treasure_mission1", CUSTOM_AWARD_GIVE_ALL)
	CustomAwardGiveGroup("treasure_mission2a", 1)
	CustomAwardGiveGroup("treasure_mission2b", 0)
	CustomAwardGiveGroup("treasure_mission2c", 0)
	CustomAwardGiveGroup("treasure_mission2d", 0)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1108)");	
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2206)");
	end);
	
	--Observer:onEvent(SYSEVENT_YP_DIG_TASK, 0);
	FireEvent("event_mission_task_award", "pvp", "baozang", 0)
	TriggerMisEvent("event_yp_taskfinish", "Уo Kho B竨");
	return 1
end

--运镖成功(ok)
function yp_aw_giveAward_14(nType,nDouble)
	nDouble = nDouble or 1;
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	local tAward = {
		"ChargeDart_a",
		"ChargeDart_b",
		"ChargeDart_c",
		"ChargeDart_d",
		"ChargeDart_e",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1101)");	
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2203)");	
	end);
	
	--任务触发
	--Include("\\script\\global\\events.lua")
	--EventOnTrigger(7, {name="送礼"});
	FireEvent("event_mission_task_award", "pvp", "yunbiao", nType)
	TriggerMisEvent("event_yp_taskfinish", "V薾 ti猽", nType);
	AddRuntimeStat(29, 1, 0, 1);
end

--抢镖任务(ok)
function yp_aw_giveAward_15(nType)
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end	
	local tAward = {
		"robbery_a",
		"robbery_b",
		"robbery_c",
		"robbery_d",
		"robbery_e",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1102)");	
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2204)");	
	end);
	
	AddRuntimeStat(29, 2, 0, 1);
	--Observer:onEvent(SYSEVENT_YP_DUOBIAO, nType);
	FireEvent("event_mission_task_award", "pvp", "duobiao", nType)
	TriggerMisEvent("event_yp_taskfinish", "Cp Ti猽", nType);
end

--投保返回(ok)
function yp_aw_giveAward_16(nType)
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	local tAward = {
		"Dart_Insurance_a",
		"Dart_Insurance_b",
		"Dart_Insurance_c",
		"Dart_Insurance_d",
		"Dart_Insurance_e",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--赏金奖励(ok)
function yp_aw_giveAward_17(nNum)
	if gf_Judge_Room_Weight(4,40,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {17,9,1,0};
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	local tAward = {
		"hunter_a",
		"hunter_b",
		"hunter_c",
		"hunter_d",
	}
	local level = getn(tAward)-nType+1;
	local szAward = tAward[level]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
		--yp_setValue(5,30)--声望
	end
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1107)");	
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2207)");	
	end);
	
	--任务触发
	--Include("\\script\\global\\events.lua")
	--EventOnTrigger(7, {name="天阴令牌", category=level});
	FireEvent("event_mission_task_award", "pvp", "shangjin", level)
	
	AddRuntimeStat(29, 8, 0, 1);
end

--贡献度奖励
function yp_aw_giveAward_18(nNum)
	if gf_Judge_Room_Weight(4,30,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {5000,2100,1500,1200,900};
	local tAward = {
		"Contribute_Point_5000",
		"Contribute_Point_2100",
		"Contribute_Point_1500",
		"Contribute_Point_1200",
		"Contribute_Point_900",
	}
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local szAward = tAward[nType]
	if CustomAwardCheckCondition(szAward) == 1 then
		SetTask(TASK_FIELD_PVP_GXD_WARD,1);
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--宝藏奖励
function yp_aw_giveAward_19(nType)
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	local tAward = {
		"treasure_a",
		"treasure_b",
		"treasure_c",
		"treasure_g",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end

	AddRuntimeStat(29, 9, 0, 1);
end

--xx宝藏
function yp_aw_giveAward_20(nType)
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	if nType <= 0 or nType > 3 then
		return 0;
	end
	local tAward = {
		"treasure_d",
		"treasure_e",
		"treasure_f",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
	
	AddRuntimeStat(29, 9, 0, 1);
end