Import("\\script\\lib\\globalfunctions.lua");

EXTEND_ROOM_INFO = {
	-- --pos_incuse_bag
	-- [23] = {
	-- 	Name    = "ÎåÐÐÕ½Ó¡²Ö¿â",
	-- 	TaskID  = TASKID_INCUSE_BAG_ROOM,
	-- 	InitNum = 60,
	-- 	MaxNum  = 120,
	-- 	UIItem  = {2,102,206},
	-- 	UIScript= "Open([[IncuseBag]])",
	-- 	Extend  = { -- ¶àÉÙ¸ñÒÔÄÚ¿ªÆô, ¿ªÆôÊ±Ê¹ÓÃµÄµÀ¾ß, µÀ¾ßÃû³Æ, Ò»´Î¿ªÆôÊýÁ¿
	-- 		{90,  {2,100,4,1},   "½ðË¿±³°ü", 10},
	-- 		{120, {2,102,205,1}, "×ÓÄ¸´ü",   10},
	-- 	},
	-- },
	-- --pos_life_material_bag
	-- [24] = {
	-- 	Name    = "Éú»î²ÄÁÏ½õÄÒ",
	-- 	TaskID  = TASKID_LIFE_MATERIAL_BAG_ROOM,
	-- 	InitNum = 60,
	-- 	MaxNum  = 300,
	-- 	UIItem  = {2,102,207},
	-- 	UIScript= "Open([[LifeMaterialBag]])",
	-- 	Extend  = { -- ¶àÉÙ¸ñÒÔÄÚ¿ªÆô, ¿ªÆôÊ±Ê¹ÓÃµÄµÀ¾ß, µÀ¾ßÃû³Æ, Ò»´Î¿ªÆôÊýÁ¿
	-- 		{90,  {2,100,4,1},   "½ðË¿±³°ü", 10},
	-- 		{300, {2,102,205,1}, "×ÓÄ¸´ü",   10},
	-- 	},
	-- },
	[24] = {
		Name    = "Tr¸p",
		TaskID  = TASKID_LEFT_PEARL_BAG_ROOM,
		InitNum = 60,
		MaxNum  = 180,
		UIItem  = {2,102,218},
		UIScript= "Open([[LeftPearlBag]])",
		Extend  = { -- ¶àÉÙ¸ñÒÔÄÚ¿ªÆô, ¿ªÆôÊ±Ê¹ÓÃµÄµÀ¾ß, µÀ¾ßÃû³Æ, Ò»´Î¿ªÆôÊýÁ¿
			-- {90,  {2,100,4,1},   "½ðË¿±³°ü", 10},
			-- {180, {2,102,205,1}, "×ÓÄ¸´ü",   10},
		},
	},
}

function onPlayerLogin()
	local nVersion,bGlbRealm = GetRealmType();
	if bGlbRealm == 1 then
		return
	end

	
	for k, v in EXTEND_ROOM_INFO do
		local nCurNum = GetTask(v.TaskID);
		if nCurNum < v.InitNum then
			SetTask(v.TaskID, v.InitNum);
			WriteLog(format("[Extend %s][role:%s acc:%s][init room][room:%d][before:%d][afeter:%d]",
				v.Name, GetName(), GetAccount(), k, nCurNum, GetTask(v.TaskID)));
		end
		
		if BigGetItemCount(v.UIItem[1], v.UIItem[2], v.UIItem[3]) <= 0 and gf_Judge_Room_Weight(1, 10, "") == 1 then
			AddItem(v.UIItem[1], v.UIItem[2], v.UIItem[3], 1);
		end
	end
end

function onExtendRoom(nRoom, nConfirm)
	SetPlayerScript([[\script\misc\extend_room.lua]])
	local tInfo = EXTEND_ROOM_INFO[nRoom];
	if not tInfo then
		Talk(1, "", "Lçi tham sè!");
		return
	end
	
	local nVersion,bGlbRealm_ = GetRealmType();
	
	if bGlbRealm_ == 1 then
		Talk(1, "", format("Kh«ng thÓ t¨ng %s ë ®©y.", tInfo.Name));
		return
	end
	
	local nCurNum = GetTask(tInfo.TaskID);
	
	if nCurNum >= tInfo.MaxNum then
		Talk(1, "", format("%s ®· t¨ng ®Õn tèi ®a.", tInfo.Name))
		return
	end
	
	local tEx = nil;
	
	for i = 1, getn(tInfo.Extend) do
		if nCurNum < tInfo.Extend[i][1] then
			tEx = tInfo.Extend[i];
			break;
		end
	end
	
	if not tEx then
		Talk(1, "", format("%s kh«ng thÓ t¨ng n÷a.", tInfo.Name))
		return
	end
	
	if not nConfirm then
		local szMsg = format("Dïng <color=yellow>[%s] x %d<color> sÏ t¨ng giíi h¹n <color=yellow>%s<color> ®Õn <color=yellow>%d<color> «, ®ång ý?", tEx[3], tEx[2][4], tInfo.Name, tEx[4]);
		local tSel = {
			format("\n§ång ý/#onExtendRoom(%d, 1)", nRoom),
			"Hñy bá/nothing",
		};
		Say(szMsg, getn(tSel), tSel);
		return
	end
	
	if GetItemCount(tEx[2][1], tEx[2][2], tEx[2][3]) < tEx[2][4] then
		Talk(1, "", format("[%s] kh«ng ®ñ %d, kh«ng thÓ t¨ng thªm.", tEx[3], tEx[2][4]));
		return
	end
	
	if DelItem(tEx[2][1], tEx[2][2], tEx[2][3], tEx[2][4]) ~= 1 then
		Talk(1, "", format("[%s] kh«ng ®ñ %d, kh«ng thÓ t¨ng thªm.", tEx[3], tEx[2][4]));
		return
	end
	
	gf_SetLogCaption("Extend " .. tInfo.Name);
	gf_ModifyTask(tInfo.TaskID, tEx[4]);
	WriteLog(format("[Extend %s][role:%s acc:%s][extend room][room:%d][before:%d][after:%d][cost:%d,%d,%d,%d]",
		tInfo.Name, GetName(), GetAccount(),
		nRoom, nCurNum, GetTask(tInfo.TaskID),
		tEx[2][1], tEx[2][2], tEx[2][3], tEx[2][4]));
	gf_SetLogCaption("");
end

function OnUse(nItemIdx)
	local g, d, p = GetItemInfoByIndex(nItemIdx);
	for k, v in EXTEND_ROOM_INFO do
		if g == v.UIItem[1] and d == v.UIItem[2] and p == v.UIItem[3] then
			SendScript2Client(v.UIScript);
			break;
		end
	end
end