Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\lib\\globalfunctions.lua")
THOIHANNHAPQUOCTICH = 1
TB_NATION_SERVERLIST =
{
	{1, "B¹ch Hæ"},
	{150,"Liªn ®Êu Local"},
	{151,"Liªn ®Êu 1"},
	{152,"Liªn ®Êu 2"},
	{153,"Liªn ®Êu 3"},
	{154,"Liªn ®Êu 4"},
	{155,"Liªn ®Êu 5"},
	{156,"Liªn ®Êu 6"},
	{157,"Liªn ®Êu 7"},
	{158,"Liªn ®Êu 8"},
}

function change_nationality()
	local nDate = tonumber(date("%Y%m%d"))
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanNhapQuocTich[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanNhapQuocTich[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Ch­a ®Õn thêi gian ®¨ng ký nhËp quèc, ng­¬i h·y quay l¹i sau nhÐ.")
			return 0
		end
	end
	
	local tHead = format("%s Ng­¬i muèn gia nhËp <color=yellow>%s quèc<color> ph¶i kh«ng?", g_szInfoHeader, szNation)
	local tSay =
	{
		"V·n bèi ®ång ý gia nhËp b¶n quèc, xin h·y t©u víi Hoµng Th­îng/reg_change_nationality",
		"§· ®ñ "..THOIHANNHAPQUOCTICH.." ngµy, xin cho v·n bèi gia nhËp b¶n quèc/confirm_change_nationality",
		"Ta muèn suy nghÜ l¹i/do_nothing",
	}
	Say(tHead,getn(tSay),tSay);
end

function reg_change_nationality()
	local nCurNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	local nNewNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW)
	local nServerNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local szServerNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	
	if nCurNationality == nServerNation then
		Talk(1,"",format("%s Ng­¬i ®· lµ thÇn d©n cña <color=yellow>%s quèc<color> råi, kh«ng cÇn ph¶i ®¨ng ký n÷a!",g_szInfoHeader, szServerNation))
		return
	end
	if nNewNationality == nServerNation then
		Talk(1,"",format("%s Ng­¬i ®· ®¨ng ký gia nhËp <color=yellow>%s quèc<color> råi, kh«ng cÇn ph¶i ®¨ng ký n÷a!", g_szInfoHeader, szServerNation))
		return
	end
	
	gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, nServerNation)
	SetTask(TSK_SERVER_ID_TIME, GetTime())
	Talk(1,"",format("%s Chóc mõng ng­¬i ®· ®¨ng ký gia nhËp <color=yellow>%s quèc<color>. Sau <color=yellow>"..THOIHANNHAPQUOCTICH.." ngµy<color> h·y ®Õn gÆp ta ®Ó x¸c nhËn gia nhËp.", g_szInfoHeader,szServerNation))
end

function confirm_change_nationality()
	local nRegTime = GetTask(TSK_SERVER_ID_TIME)
	local nCurNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	local nNewNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW)	
	local nServerNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local szServerNation = get_nationality_name(nServerNation)
	local nDay, nHour, nMin = get_waiting_time(GetTask(TSK_SERVER_ID_TIME))
	
	if nCurNationality == nServerNation then
		Talk(1,"",format("%s Ng­¬i ®· lµ thÇn d©n cña <color=yellow>%s quèc<color> råi, kh«ng cÇn ph¶i ®¨ng ký n÷a!", g_szInfoHeader,szServerNation))
		return
	end
	if nNewNationality ~= nServerNation then
		Talk(1,"",g_szInfoHeader.."Ng­¬i ch­a ®¨ng ký gia nhËp nªn kh«ng thÓ x¸c nhËn!")
		return
	end
	if nDay >= 0 and nHour >= 0 and nMin > 0 then
		Talk(1,"",format("%s Thêi gian ®Ó x¸c nhËn gia nhËp cßn <color=yellow>%d ngµy %d giê %d phót<color>. H·y quay trë l¹i ®Ó x¸c nhËn sau.", g_szInfoHeader, nDay, nHour, nMin))
		return
	else
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, nServerNation)
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, 0)
		SetTask(TSK_SERVER_ID_TIME, 0)
		Talk(1,"",format("%s Tõ giê trë ®i ng­¬i lµ thÇn d©n cña <color=yellow>%s quèc<color>, xin chóc mõng!", g_szInfoHeader, szServerNation))
		return
	end
end

function get_nationality_name(nID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if TB_NATION_SERVERLIST[i][1] == nID then
			return TB_NATION_SERVERLIST[i][2]
		end
	end	
	return ""
end

function get_waiting_time(nRegTime)
	nCurTime = GetTime()
	nDif = THOIHANNHAPQUOCTICH*86400 - nCurTime + nRegTime
	nDay = floor(nDif/86400)
	nHour = floor(mod(nDif, 86400) / 3600)
	nMin = floor(mod(mod(nDif, 86400), 3600) / 60)

	return nDay, nHour, nMin
end

function do_nothing()

end