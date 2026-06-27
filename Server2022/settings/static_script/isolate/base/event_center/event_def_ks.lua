--Include by \settings\static_script\isolate\event_center\event_impl.lua

--EventImpl:define_event(szEventId, szHelpInfo, nFilterKeyNum=0, data_convert_func=data_convert_func_no_convert, player_event_switch_type=PLAYER_EVENT_SWITCH_NONE)
--TeamEvent("event_mission_stage_finish")表示event_mission_stage_finish这个事件会自动向Team触发 所以去掉FireEventTeam接口


--define all events here
function EventImpl:define_all_events_ks()
	local NONE = self.player_event_switch_none
	local EVENT_LV = self.player_event_switch_event_level
	
	--system event
	self:define_event("event_server_start", "data={}")
    self:define_event("event_gdata_change", "data={szGdataName}", 1) --跨vm的全局脚本数据有变更
    self:define_event("event_server_time", "data={nHour, nMin}", 2) --可取代systemtimetask
    self:define_event("event_server_new_day", "data={nNewDate}", 1) --eg:20150831可用于激活一些未到期功能或让一些过期功能失效
    self:define_event("event_server_new_week", "data={nNewWeek}", 1)--eg:201521 表示2015第21个星期1 0点
    self:define_event("event_server_new_month", "data={nNewMonth}", 1) --eg:201508
    self:define_event("event_server_new_year", "data={nNewYear}", 1) --eg:2015
    
    --self:define_event("event_server_tick", "data={nTick}, para={nFreq}", 1)--可用作timer//201509dzj:一秒钟一次频率略高 目前没有用到暂时屏蔽，以后用到再打开
    self:define_event("event_server_tick_minute", "data={nTick}, para={nFreq}", 1)--可用作timer
    self:define_event("event_server_tick_hour", "data={nTick}, para={nFreq}", 1)--可用作timer
    
    --self:define_event("event_npc_remove", "data={npcIndex}->{szName,nMap,nIndex}", 2, data_convert_func_npc)
	
	--player action event
	self:define_event("event_player_login", "data={bExchangeComing}")
	self:define_event("event_player_logout", "data={bExchangeServer}")
	self:define_event("event_daily_clear", "data={nCurDate, nLastDate}")
	self:define_event("event_weekly_clear", "data={nCurWeek, nLastWeek}")
	self:define_event("event_monthly_clear", "data={nCurMonth, nLastMonth}")
	self:define_event("event_player_new_day_check", "data={nNewDate, nPlayerDate}")--跨天了，检查一下是否需要清理什么的
	
	--这些超高频率player_event,设置C++-Level player_event_switch
	--self:define_event("event_player_tick", "data={nTick}, para={nFreq}", 1, nil, EVENT_LV)--可用作timer//201509dzj:一秒钟一次频率略高 目前没有用到暂时屏蔽，以后用到再打开
	self:define_event("event_player_taskvalue_change", "data={nTaskId, nOldVal, nNewVal}",3, nil, EVENT_LV)
	self:define_event("event_kill_npc", "data={npcIndex}->{szName,nMap,nIndex}", 2, data_convert_func_npc, EVENT_LV)
	--self:define_event("event_gain_item", "data={g,d,p,n}->{nItemPackId,n}",1, data_convert_func_item_gdp, EVENT_LV)
	--self:define_event("event_cost_item", "data={g,d,p,n}->{nItemPackId,n}",1, data_convert_func_item_gdp, EVENT_LV)
	--self:define_event("event_ib_buy", "data={g,d,p,n,cost}->{nItemPackId,n,cost}",1, data_convert_func_item_gdp, EVENT_LV)

	self:define_event("event_player_tick_minute", "data={nTick}, para={nFreq}", 1)--可用作timer
	self:define_event("event_player_tick_hour", "data={nTick}, para={nFreq}", 1)--可用作timer
	self:define_event("event_player_daily_online_minute", "data={nTick}, para={nFreq}", 1)--可用作timer
	
	self:define_event("event_player_start_offline_live", "data={nBaiju, nShennong, nZhenQi}") --开始离线托管
	self:define_event("event_player_change_group_world", "data={nSourceSubWorldID, nTargetSubWorldID}", 2) --跨大区服
	self:define_event("event_player_taskvalue_recycle", "data={nTaskId, nTaskNewVersion, nOldVersion}",3)
	
	self:define_event("event_npc_talk", "data={nIndex}->{szName,nMap,nIndex}",2, data_convert_func_npc)
	self:define_event("event_item_talk", "data={nItemIndex}->{nItemPackId,nItemIndex}",1,data_convert_func_item_index)
	self:define_event("event_ib_cost", "data={g,d,p,n}->{nItemPackId,n}",1, data_convert_func_item_gdp)
	
	self:define_event("event_player_enter_map", "data={mapid, bExchangeComing}",1)
	self:define_event("event_player_leave_map", "data={mapid, bLogout}",1)
	self:define_event("event_player_death", "data={nKillerIndex,DeathPunish, Enmity}->{mapid,nKillerIndex,DeathPunish, Enmity}", 1, data_convert_func_addmap)
	
	self:define_event("event_player_tong_operation", "data={szOperation, szTongName, nTongLv}", 1)
			--create	szTongName tongLv
			--join		szTongName tongLv
			--leave		szTongName tongLv
			--kick		szTongName tongLv
			--uplevel	szTongName newLevel
	
	--mission event
	self:define_event(TeamEvent("event_mission_stage_finish"), "TeamEvent, data={szMissionName, nStage}", 2)
    		--liangshan 	1~8
    		--wanjianzhong 	1~4
    		--dixuangong 	1~7
    		--taixu			1~8
    		--taiyi			1~6
    		--taiyihero		1~6
    		--cangjian		1~4
    		--jiandangyanyun 1~6
    		--jiandangyanyunhero 1~6
    		
	self:define_event("event_mission_task_award", "data={szMissionName, szTaskName, nPara}", 3)
    		--wanjianzhong 	{"1daily_pass","2daily_fanpai","3weekly_pass","4weekly_fanpai"} index{1~4}
    		--dixuangong 	{"1chutan", "2dapo", "3zhuixiong"} index{1~3}
    		--liangshan 	{"1chuyan", "2zhongyong", "3duojun"}  index{1~3}
    		--planttree		{"smalltreeprize","bigtreeprize","plantseedtree", "openseedbag"} 0 --小般若树, 大般若树, 种子树, 四灵树, 打开种子袋
    		--planttree		{"plant4lingtree", "plantbigtree"} nPlantCount
    		
    		--pvp 		toujingshu 	nStep{1~7}
    		--pvp 		yunbiao 	nType{1~5}
    		--pvp 		duobiao		nType{1~5}
    		--pvp 		shangjin 	nType{1~4}
    		--pvp 		yupo 		nType{1~4}
    		--pvp 		shiliwabao 	nType{1~3}
    		--pvp 		shengwu 	0
    		--pvp 		killboss 	0
    		--pvp 		plant		0
    		--pvp 		touguoshi	0
    		--pvp 		baozang		0

    		
    self:define_event("event_mission_affairs", "data={szMissionName, szAfairName, nPara}", 3)
    		--newbattle 		mainpoint200		4			--参加雁门关战场积分达到200分
    		--newbattle			protectcitypoint100	3			--保护城池战场到达100分
    		--newbattle 		killplayer 			nBattleType{1village,2resource,3protectcity,4main}--杀人
    		--liangshan			killboss			npcIdx		--梁山击杀boss
    		--tianmenzhen		killflag			0
    		--honortong			buildtong			nNum
    		--worldboss			killboss			npcIndex
    		
	self:define_event("event_mission_box_award", "data={szMissionName, szBoxType, nIndex}", 2)
            --worldboss 	gold|small
            --wanjianzhong 	gold|silver|copper
            --dixuangong 	gold|silver|copper
            --liangshan 	gold|silver|copper
            --siling 		gold|silver|copper
            --taiyi			gold|silver|copper
            --taiyihero		gold|silver|copper
            
	self:define_event("event_mission_award", "data={szMissionName, nType, nPara1, nPara2}", 4)
    		--newbattle		nType{0~4}  is_winner	nBattleType{1village,2resource,3protectcity,4main}  --战场5种领奖方式
    		--tianmenzhen	nType{0~3}  is_winner	0
    		--honortong		nType{0~1 is_master}	0	0
    		--kfbattle		nType{1~5}  nResult{2:win, 3:lose, 4:draw平局}	0

	self:define_event("event_task_award", "data={szTaskName, nId, nPara}", 2)
    		--contributecountry 1~4 --对应治国平天下4个选项 --from VNG
    
    --交互动作
    self:define_event("event_player_interactive", "data={szInteractive}", 1)
--    "share_ride",--0		-- 双人共骑
--    "share_hand",-- 1		-- 双人携手
--    "share_back",-- 2		-- GG背MM
--    "share_chest",-- 3	-- GG抱MM
--    "kiss",-- 4			-- 亲吻
--    "comfort",-- 5		-- 安慰
--    "kotow",-- 6			-- 拜
--    "help",-- 7			-- 帮忙
--    "sorrow",-- 8			-- 悲伤
--    "ready_go",-- 9		-- 出发
--    "act_up",-- 10		-- 调皮
--    "crazy",-- 11			-- 发狂
--    "knee_down",-- 12		-- 跪下
--    "shy",-- 13			-- 害羞
--    "bow",--14			-- 鞠躬
--    "claps",-- 15			-- 拍手
--    "marriage",-- 16		-- 求婚
--    "angry",-- 17			-- 生气
--    "victory",-- 18		-- 胜利
--    "cool",-- 19			-- 耍酷
--    "lay_down",-- 20		-- 躺下
--    "defy",-- 21			-- 挑衅
--    "puzzled",-- 22		-- 疑惑
--    "faint",-- 23			-- 晕倒
--    "byebye",-- 24 		-- 招手
--    "confidence",-- 25	-- 自信
--    "gentle",-- 26		-- 作揖
--    "sit",-- 27			-- 坐下
end

function data_convert_func_no_convert(data)
	return data
end

function data_convert_func_item_gdp(data)
	local g,d,p = data[1],data[2],data[3]
	local nItemPackId = PackItemId(g,d,p)
	local d = {nItemPackId}
	for i=4,getn(data) do
		tinsert(d, data[i])
	end
	return d
end

function data_convert_func_item_index(data)
	local nItemIndex = data[1]
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nItemPackId = PackItemId(g,d,p)
	local d = {nItemPackId}
	for i=1,getn(data) do
		tinsert(d, data[i])
	end
	return d
end

function data_convert_func_npc(data)
	local nNpcIndex = data[1]
	local szNpcName = GetNpcName(nNpcIndex)
	local nMapId = GetNpcWorldPos(nNpcIndex)
	if nMapId >= 65536 then--副本，取模板ID
		local nMapIndex = SubWorldID2Idx(nMapId)
		nMapId = GetMapTemplate(nMapIndex)
	end
	local d = {szNpcName, nMapId}
	for i=1,getn(data) do
		tinsert(d, data[i])
	end
	return d
end

function data_convert_func_addmap(data)
	local nMap = GetWorldPos()
	local d = {nMap}
	for i=1,getn(data) do
		tinsert(d, data[i])
	end
	return d
end
