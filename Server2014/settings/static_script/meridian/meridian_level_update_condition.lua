--经脉系统境界达成条件

t_meridian_level_condition =
{
	[1] = 
		{
			sz_name = "V?Hi襫",
			t_require = 
				{
					trans_count = 0,
					level = 80,
				},
			t_ib_consume =
				{
					exp = 0,
					t_item =
						{
							{2, 1, 270, 1, "B筩h C﹗ Ho祅"},
						},
				},
		},
	[2] = 
		{
			sz_name = "V?Tng",
			t_require = 
				{
					trans_count = 0,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 0,
					t_item =
						{
--							{2, 0, 1083, 1, "太易混元功谱"},
--							{2, 0, 553, 9, "大人参果"},
--							{2, 1, 1008, 9, "白驹仙丹"},
							
							{2, 0, 553, 5, "Чi Nh﹏ s﹎"},
							{2, 1, 1008, 5, "B筩h C﹗ Ti猲 n"},
						},
				},
		},
	[3] = 
		{
			sz_name = "V?Vng",
			t_require = 
				{
					trans_count = 0,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 0, --20*10000*10000,
					t_item =
						{
							--{2, 95,  204, 4, "天罡令"	},
							----{2, 1, 30370, 1, "天门金令"	},
							
							{2, 1, 30730, 10, "Kinh M筩h уng Nh﹏"},
							{2, 1, 270, 10, "B筩h C﹗ Ho祅"},
							{2, 1, 30669, 10, "M秐h M藅 T辌h"},
						},
				},
		},
	[4] = 
		{
			sz_name = "V?T玭",
			t_require = 
				{
					trans_count = 5,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 0,
					t_item =
						{
							{2, 95,  204, 5, "Thi猲 Cang L謓h"	},
							{2, 1, 30370, 5, "Thi猲 M玭 Kim L謓h"	},
						},
				},
			global_msg = 1,
		},
	[5] = 
		{
			sz_name = "V?Ho祅g",
			t_require = 
				{
					trans_count = 6,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 0,
					t_item =
						{
							{2, 95,  204, 10, "Thi猲 Cang L謓h"	},
							{2, 1, 30370, 10, "Thi猲 M玭 Kim L謓h"	},
						},
				},
			global_msg = 1,
		},
	[6] = 
		{
			sz_name = "V?Th竛h",
			t_require = 
				{
					trans_count = 7,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 0,
					t_item =
						{
							{2, 95,  204, 15, "Thi猲 Cang L謓h"	},
							{2, 1, 30370, 15, "Thi猲 M玭 Kim L謓h"	},
						},
				},
			global_msg = 1,
		},
}

function meridianlevel_check_all_ib(nNewLevel, bNotify)
	if meridianlevel_check_require(nNewLevel, bNotify) ~= 1 then
		return 0
	end
	if meridianlevel_check_consume(nNewLevel, 0, bNotify) ~= 1 then
		return 0
	end
	return 1
end

--获取境界名
function meridianlevel_getname(nNewLevel)
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name="[kh玭g]"}
	local szName = tCfg.sz_name or "[kh玭g]"
	return szName
end

--基本修炼条件检查
--0 表示未达成
--1表示已达成
function meridianlevel_check_require(nNewLevel, bNotify)
	if nNewLevel < 0 or nNewLevel > 6 then
		return 0
	end
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name=""}
	local tPreCfg = t_meridian_level_condition[nNewLevel - 1] or {sz_name=""}
	if MeridianGetLevel() ~= (nNewLevel - 1) then
		if 1 == bNotify then
			if nNewLevel > 1 then
    			Talk(1,"",format("Hi謓 ch璦 ph秈 l?c秐h gi韎 %s kh玭g th?k輈h ho箃 c秐h gi韎 %s!", tPreCfg.sz_name, tCfg.sz_name))
			else
				Talk(1,"",format("Х k輈h ho箃 c秐h gi韎 cao h琻, kh玭g th?k輈h ho箃 l筰 c秐h gi韎 %s!", t_meridian_level_condition[nNewLevel].sz_name))
			end
		end
		return 0
	end
	
	local t = _get_require_cfg(nNewLevel)
	if t then
		if t.trans_count and t.trans_count > 0 then
			if gf_GetTransCount() < t.trans_count then
				if 1 == bNotify then
        			Talk(1,"",format("Ch璦 t n chuy觧 sinh %d kh玭g th?k輈h ho箃 c秐h gi韎 %s!", t.trans_count, tCfg.sz_name))
        		end
        		return 0
			end
		end
		if t.level and t.level > 0 then
			if GetLevel() < t.level then
				if 1 == bNotify then
        			Talk(1,"",format("C蕄  ch璦 t %d kh玭g th?k輈h ho箃 c秐h gi韎 %s!", t.level, tCfg.sz_name))
        		end
        		return 0
			end
		end
	else
		return 0
	end
	return 1
end

--IB修炼条件检查或操作
--0 表示未达成
--1表示已达成
function meridianlevel_check_consume(nNewLevel, bDelete, bNotify)
	if nNewLevel < 0 or nNewLevel > 6 then
		return 0
	end
	
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name=""}
	local t = _get_ib_consume_cfg(nNewLevel) 
	if t then
		if t.exp then
			if GetExp() < t.exp then
				if 1 == bNotify then
					Talk(1,"",format("Kinh nghi謒 kh玭g  %d, k輈h ho箃 c秐h gi韎 %s th蕋 b筰!", t.exp, tCfg.sz_name))
				end
				return 0
			end
		end
		if t.t_item then
			for i = 1, getn(t.t_item) do
        		local ti = t.t_item[i]
        		if GetItemCount(ti[1], ti[2], ti[3]) < ti[4] then
        			if 1 == bNotify then
        				Talk(1,"",format("%sx%d kh玭g , k輈h ho箃 c秐h gi韎 %s th蕋 b筰!", ti[5], ti[4], tCfg.sz_name))
        			end
        			return 0
        		end
			end
		end
		
		if 1 == bDelete then --所有都检查通过了，执行删除
    		if t.exp then
            	local nCanModifyExpFlag = CanModifyExp(-1 * t.exp) or 0
            	if nCanModifyExpFlag ~= 1 then
            		return 0
            	end
            	ModifyExp(-1 * t.exp)
    		end
    		if t.t_item then
    			for i = 1, getn(t.t_item) do
                    local ti = t.t_item[i]
            		local nDelResult = DelItem(ti[1], ti[2], ti[3], ti[4])
            		if not nDelResult or nDelResult ~= 1  then
            			return 0
            		end
    			end
    		end
    		--删除完毕说明冲击成功了,判断是否需要广播
    		if tCfg.global_msg then
    			Msg2Global(format("[%s] k輈h ho箃 c秐h gi韎 th祅h c玭g, bc v祇 c秐h gi韎 [%s], c竎 ho箃 qu?th藅 l頸 h筰.", GetName(), meridianlevel_getname(nNewLevel)))
    		end
		end
	end
	return 1
end

--获取IB消耗详细内容描述
--返回szDesc
function meridianlevel_get_ib_consume_desc(nNewLevel)
	local szDesc = ""
	
	local t = _get_ib_consume_cfg(nNewLevel)
	if t then
		if t.exp then
			szDesc = format("Kinh nghi謒 %d", t.exp)
		end
		if t.t_item then
    		for i = 1, getn(t.t_item) do
        		local strTemp = szDesc
        		local strTemp2 = format("%sx%d", t.t_item[i][5], t.t_item[i][4])
        		szDesc = format("%s, %s", strTemp, strTemp2)
        	end
		end
	else
		szDesc = "[kh玭g]"
	end
	return szDesc
end

function meridianlevel_get_require_desc(nNewLevel)
	local szDesc = ""
	
	local t = _get_require_cfg(nNewLevel)
	if t then
		if t.trans_count and t.trans_count > 0 then
			szDesc = format("%s chuy觧 sinh %d", szDesc, t.trans_count)
		end
		if t.level and t.level > 0 then
			szDesc = format("%s c蕄 %d", szDesc, t.level)
		end
	else
		szDesc = "[kh玭g]"
	end
	return szDesc
end

function _get_ib_consume_cfg(nNewLevel)
	local t = t_meridian_level_condition[nNewLevel]
	if t then
		return t.t_ib_consume
	end
end

function _get_require_cfg(nNewLevel)
	local t = t_meridian_level_condition[nNewLevel]
	if t then
		return t.t_require
	end
end

--Include("\\script\\online\\chuyen_sinh\\translife_head.lua")--越南转生脚本
--VNG define begin
--直接把脚本引用过来，不要包含文件了
function vng_get_translife_count()
	local TRANSLIFE_TASK_ID = 1538
	local TRANSLIFE_BYTE_COUNT = 1
	return GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_COUNT)
end
--VNG define end

function gf_GetTransCount()
	local nAddvanceTrans = GetPlayerRebornParam(0)
	if nAddvanceTrans > 0 then
		--越南转生变量最多进行5转，6转以上中方系统记录
		return nAddvanceTrans + 5
	end
	return vng_get_translife_count()
end

