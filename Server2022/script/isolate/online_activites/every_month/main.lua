--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\every_month\\handler.lua")
Include("\\script\\isolate\\online_activites\\every_month\\sub.lua")--杀怪子活动,注释掉本行，子活动就可以不起作用

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "evenyMonthMain",
    szViewName 			= "Vui T誸 祅 Vi猲",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20170210,
    nEndDate 			= 20170301,
    nTaskGroup 			= 1,
    nTaskGroupVersion	= 35,
}

t_isolate_task_list = {--用到的任务变量都在这配置
	--main
	{ id={"task_use_item1_count", 1} },
	{ id={"task_use_item2_count", 2} },
	{ id={"task_use_item3_count", 3} },
	{ id={"task_get_final_award", 4}, bit_award1=1, bit_award2=2, bit_award3=3, },
	--sub 6~10
}

--需要Watch的事件列表，会自动注册这些事件，最终事件回调函数是pfn_elem_handler(tEvent, data, para)
t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
	{"event_mission_task_award", {"wanjianzhong", "", -1}, 			handle_add_material,	{1, 200}  }, 	--万剑冢任务 200 材料1
	{TeamEvent("event_mission_box_award"), {"wanjianzhong", "gold"}, 		handle_add_material,	{1, 50}  }, 	--万剑冢金宝箱 100 材料1
	{"event_mission_box_award", {"wanjianzhong", "silver"},		handle_add_material,	{1, 100}  }, 	--万剑冢银宝箱 50 材料1
	{TeamEvent("event_mission_box_award"), {"wanjianzhong", "copper"}, 	handle_add_material,	{1, 20}  },		--万剑冢铜宝箱 20 材料1
	{"event_mission_task_award", {"dixuangong", "", -1}, 			handle_add_material,	{1, 200}  }, 	--地玄宫任务 200 材料1
	{TeamEvent("event_mission_box_award"), {"dixuangong", "gold"}, 		handle_add_material,	{1, 50}  }, 	--地玄宫金宝箱 100 材料1
	{"event_mission_box_award", {"dixuangong", "silver"}, 		handle_add_material,	{1, 100}  }, 	--地玄宫银宝箱 50 材料1
	{TeamEvent("event_mission_box_award"), {"dixuangong", "copper"}, 		handle_add_material,	{1, 20}  },		--地玄宫铜宝箱 20 材料1
	{"event_task_award", 		{"contributecountry", -1}, 		handle_add_material,	{1, 200}  },	--治国平天下 200 材料1
	{"event_mission_task_award",{"planttree", "smalltreeprize", -1},handle_add_material,	{1, 75}  },		--种小般若树 25材料1
	{"event_mission_task_award",{"planttree", "plantseedtree", -1},	handle_add_material,	{1, 75}  },		--种种子树 50材料1
	{"event_mission_task_award",{"planttree", "bigtreeprize", -1},	handle_add_material,	{3, 50}  },	--种大般若树 100材料1
--	{"event_mission_task_award",{"planttree", "plant4lingtree", -1},handle_add_material,	{1, 100}  },	--种四灵树 100材料1
	{"event_mission_task_award",{"liangshan", "", -1}, 				handle_add_material,	{2, 200}  }, 	--梁山任务 200 材料2
--	{"event_mission_affairs", {"newbattle", "mainpoint200", -1}, 			handle_add_material,	{2, 50}  },		---战场领奖-使用军功章 50 材料2
--	{"event_mission_affairs", {"newbattle", "protectcitypoint100", -1}, 			handle_add_material,	{2, 25}  },		---战场领奖-使用军功章 50 材料2
--	{"event_mission_affairs", {"newbattle", "killplayer", -1}, 			handle_add_material,	{2, 5}  },		---战场领奖-使用军功章 50 材料2
	{TeamEvent("event_mission_box_award"), {"liangshan", "gold"}, 			handle_add_material,	{2, 50}  }, 	---梁山金宝箱 100 材料2
	{"event_mission_box_award", {"liangshan", "silver"},		handle_add_material,	{2, 100}  }, 	---梁山银宝箱 50 材料2
	{TeamEvent("event_mission_box_award"), {"liangshan", "copper"}, 		handle_add_material,	{2, 20}  },		---梁山铜宝箱 20 材料2
	{"event_mission_stage_finish", {"taixu", -1}, 				handle_add_material,	{2, 50}  },		---完成1关太虚幻境 10 材料2
--	{"event_mission_task_award",{"taiyi", "", -1}, 					handle_add_material,	{2, 200}  }, 	--普通太一任务 200 材料2
	{TeamEvent("event_mission_box_award"), {"taiyi", "gold"}, 				handle_add_material,	{2, 50}  }, 	---普通太一金宝箱 100 材料2
	{"event_mission_box_award", {"taiyi", "silver"},			handle_add_material,	{2, 100}  }, 	---普通太一银宝箱 50 材料2
	{TeamEvent("event_mission_box_award"), {"taiyi", "copper"}, 			handle_add_material,	{2, 20}  },		---普通太一铜宝箱 20 材料2
	{"event_mission_award", {"newbattle", 0, -1, -1},  			handle_add_material,	{2, 20}  },		---战场领奖-不使用军功 20 材料2
	{"event_mission_award", {"newbattle", 1, -1, -1}, 			handle_add_material,	{2, 50}  },		---战场领奖-使用军功章 50 材料2
	{"event_mission_award", {"newbattle", 2, -1, -1}, 			handle_add_material,	{2, 100}  },	---战场领奖-使用大军功章 100 材料2
	{"event_mission_award", {"newbattle", 3, -1, -1}, 			handle_add_material,	{2, 250}  },	---战场领奖-使用军功辉煌 250 材料2
	{"event_mission_award", {"newbattle", 4, -1, -1}, 			handle_add_material,	{2, 500}  },	---战场领奖-VIP 500 材料2
	{TeamEvent("event_mission_box_award"), {"taiyihero", "gold"}, 			handle_add_material,	{3, 50}  }, 	---英雄太一金宝箱 100 材料3
	{"event_mission_box_award", {"taiyihero", "silver"},		handle_add_material,	{3, 50}  }, 	---英雄太一银宝箱 100 材料3
	--{TeamEvent("event_mission_box_award"), {"siling", "gold"}, 			handle_add_material,	{3, 50}  }, 	---四灵试练金宝箱 100 材料3
	--{"event_mission_box_award", {"siling", "silver"},			handle_add_material,	{3, 50}  }, 	---四灵试练银宝箱 100 材料3
	{"event_mission_box_award", {"worldboss", "gold"}, 			handle_add_material,	{3, 100}  }, 	---世界BOSS金宝箱 100 材料3
	{"event_mission_box_award", {"worldboss", "small"},			handle_add_material,	{3, 100}  }, 	---世界BOSS宝盒 100 材料3
	{"event_mission_task_award",{"planttree", "plant4lingtree", 16},handle_add_material,	{3, 500}  },	--种第16棵四灵树 50材料3
	{"event_mission_task_award",{"planttree", "plantbigtree", -1},handle_add_material,	{3, 50}  },	--	成功激活大般若树种获得10 材料3
	{"event_mission_stage_finish", {"liangshan", 8}, 			handle_add_material,	{3, 100}  },	---梁山通过最后一关 100 材料3
	{"event_mission_stage_finish", {"wanjianzhong", 4}, 		handle_add_material,	{3, 50}  },	---万剑冢通过最后一关 100 材料3
	{"event_mission_stage_finish", {"dixuangong", 7}, 			handle_add_material,	{3, 100}  },	---地玄宫通过最后一关 100 材料3
	{"event_mission_stage_finish", {"taixu", 8}, 				handle_add_material,	{3, 100}  },	---太虚玄境通过最后一关 100 材料3
	{"event_mission_stage_finish", {"taiyi", 6}, 				handle_add_material,	{3, 100}  },	---太一塔通过最后一关 100 材料3
	{"event_mission_stage_finish", {"taiyihero", 6}, 			handle_add_material,	{3, 100}  },	---英雄太一塔通过最后一关 200 材料3
}

--子活动的一些函数调用
function call_if_exists(fn, ...)
	if fn then
		return fn(unpack(arg))
	end
end

function on_init()
	call_if_exists(on_sub_init)
end
function on_new_day(nToday)
	call_if_exists(on_sub_new_day, nToday)
end
function on_event_player_login(nExchangeComing)
	call_if_exists(sub_on_event_player_login, nExchangeComing)
end

--模块加载时的初始化函数
function on_add_watches()
	isolate_watch_item_talk(2, 1, 30045, "handle_on_item_talk_jingnangdashijian")--锦囊大事件对话
	local _Products = tConfig.tProducts
	for i = 1,getn(_Products) do
		isolate_watch_item_talk(_Products[i][2][1], _Products[i][2][2], _Products[i][2][3], format("handle_on_prduct%d_talk",i))
	end
	call_if_exists(on_sub_add_watches)
end

--第一次上线，删除所有可能已经存在的旧活动材料
function on_first_login_clear()
	local t = {
		tMainActivityMaterials,
		tMainActivityProducts,
	}
	for i,v in t do
		for j,v2 in v do
			local g,d,p = unpack(v2[2])
			local n = BigGetItemCount(g,d,p)
        	if n > 0 then
        		BigDelItem(g,d,p,n)
        	end
		end
	end
end
