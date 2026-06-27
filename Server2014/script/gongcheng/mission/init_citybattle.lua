--date:2007-4-10
--author:yanjun
--describe:¿ªÆô¹¥³ÇÕ½Mission
Include("\\script\\gongcheng\\mission\\mission_head.lua");
function main()
	local nWeek = tonumber(date("%w"));
	if nWeek ~= 6 then 	--ĞÇÆÚ6²Å¿ª·Å
		return 0;
	end;
	if GetGlbValue(GLB_GONGCHENG_FORBIDEN) == 0 then
		for i=2,2 do	--Ö»¿ª³É¶¼
			local nMapID = tCityInfo[i][3];
			local nCityName = tCityInfo[i][1];
			local nCityMapID = tCityInfo[i][2];
			local szGong,szShou = GetCityWarAD(nCityMapID);
			if szGong == "" then	--Èç¹ûÃ»ÓĞ¹¥³Ç·½
				if SubWorldID2Idx(nMapID) >= 0 then	--Ö»ÔÚÄ¿±ê³ÇÊĞµØÍ¼Ëù´¦µÄ·şÎñÆ÷ÉÏ·¢ÏûÏ¢
					if szShou ~= "" then
						Msg2Global("Do "..nCityName.." C«ng thµnh chiÕn kh«ng cã phe c«ng"..nCityName.."Thµnh tiÕp tôc do "..szShou.." bang héi chiÕm lÜnh");
					else
						Msg2Global("Do "..nCityName.." C«ng thµnh chiÕn kh«ng cã phe c«ng vµ phe thñ, v× vËy "..nCityName.." C«ng thµnh chiÕn t¹m dõng 1 trËn");
					end;
				end;
				return 0;
			end;
			if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID) == MS_STATE_IDEL then
				if mf_OpenMission(MISSION_ID,nMapID) == 1 then
					Msg2Global(nCityName.." khu vùc C«ng thµnh chiÕn ®· cã thÓ vµo, tõ 19h ®Õn19h30 lµ giai ®o¹n chuÈn bŞ");
				end;
			end;
		end;
	end;
end;