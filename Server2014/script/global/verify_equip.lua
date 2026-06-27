--Include("\\script\\newbattles\\functions.lua");
Include("\\script\\newbattles\\battle_equipment_item.lua")
Include("\\script\\newbattles\\battle_equipment_jungong.lua")
Include("\\script\\newbattles\\battle_equipment_jungong_or_junxian.lua")
-- µÇÂ¼ÊÇÅÐ¶Ï×°±¸ÊÇ·ñÓÐÐ§(×°±¸Ä§·¨ÊôÐÔÊÇ·ñ¼Óµ½PlayerÉíÉÏ)

-- ÈÎÎñ±äÁ¿ËµÃ÷
-- 764 ¼ÇÂ¼Íæ¼Ò±¾ÖÜµÄÅÅÃû,Èç¹ûÎ´½ø100Ãû,ÔòÉèÖÃÎª999
-- 765 ¼ÇÂ¼Íæ¼Ò»ñµÃÔªË§µÄ´ÎÊý(²»·ÖËÎÁÉ,Ö»ÒªÊÇÔªË§¾ÍËã)
-- 766 ¼ÇÂ¼Íæ¼Ò»ñµÃ½«¾üµÄ´ÎÊý(²»·ÖËÎÁÉ)
-- 767 ¼ÇÂ¼Íæ¼Ò»ñµÃÏÈ·æµÄ´ÎÊý


function VerifyEquip(nGenre, nDetail, nParticular)
	if nGenre ~= 0 then
		return 1
	end
	-- ÅÐ¶Ï¹¥³ÇÕ½×°±¸
	if in_taishou_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 1) > 0 or IsTitleExist(51, 2) > 0 or IsTitleExist(51, 5) > 0 or IsTitleExist(51, 6) > 0 or IsTitleExist(51, 9) > 0 or IsTitleExist(51, 10) > 0 then
			return 1
		end
		return 0
	elseif in_shiye_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 3) > 0 or IsTitleExist(51, 7) > 0 or IsTitleExist(51, 11) > 0 then
			return 1
		end
		return 0
	elseif in_tixia_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 4) > 0 or IsTitleExist(51, 8) > 0 or IsTitleExist(51, 12) > 0 then
			return 1
		end
		return 0
	end
	
	-- ÅÐ¶Ï¾üÏÎ×°±¸
	local nJXEquipCamp, nJXEquipIdx = in_battle_equip(nGenre, nDetail, nParticular)
	local nJGEquipCamp, nJGEquipIdx = get_jungong_equip_index_in_table_by_gdp(nGenre, nDetail, nParticular)
	if nJXEquipCamp > 0 and nJGEquipCamp > 0 then
		return check_palyer_jungong_or_junxian_equip_state_by_index(nJGEquipCamp,nJGEquipIdx,nJXEquipCamp, nJXEquipIdx)
	elseif nJGEquipCamp > 0 then
		return check_palyer_jungong_equip_state_by_index(nJGEquipCamp,nJGEquipIdx)
	elseif nJXEquipCamp > 0 then
		return ChkBattleEquip(nJXEquipCamp, nJXEquipIdx)
	end
	
	return 1
end

function in_taishou_item(nDetail, nParticular)
	if nDetail == 100 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 101 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 103 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 102 and nParticular >= 8013 and nParticular <= 8020 then
		return 1
	end
	return 0
end

function in_shiye_item(nDetail, nParticular)
	if nDetail == 102 and nParticular >= 8021 and nParticular <= 8022 then
		return 1
	end
	return 0
end

function in_tixia_item(nDetail, nParticular)
	if nDetail == 100 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 101 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 103 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 102 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 102 and nParticular >= 8023 and nParticular <= 8026 then
		return 1
	end
	return 0
end



--»ñµÃ×°±¸µÄÕóÓª¼°ÔÚtableÖÐµÄË÷Òý
function in_battle_equip(nGenre, nDetail, nParticular)
	local nBody = GetBody()
	for i=1,getn(tBattleEquip) do 
		for j=1,getn(tBattleEquip[i]) do
			local tEquipInfo = tBattleEquip[i][j][1]
			if tEquipInfo[2] == nGenre and tEquipInfo[3] == nDetail and tEquipInfo[4]+nBody-1 == nParticular then
				return i,j	--ÕóÓª£¬ÔÚtableÖÐµÄË÷Òý
			end
		end
	end
	return 0,0
end

function ChkBattleEquip(nEquipCamp, nEquipIdx)
	local nCurRank = BT_GetData(PT_CURRANK)
	local nPlayerCamp = 0
	local sEquipName = tBattleEquip[nEquipCamp][nEquipIdx][1][1]
	if nCurRank < 0 then
		nPlayerCamp = LIAO_ID
	elseif nCurRank > 0 then
		nPlayerCamp = SONG_ID
	end
	if (nEquipCamp ~= nPlayerCamp) then
		Msg2Player("B¹n lµ ng­êi cña phe "..tCampNameZ[nPlayerCamp]..", kh«ng thÓ sö dông trang bÞ cña phe "..tCampNameZ[nEquipCamp]..".")
		return 0
	end
	
	local nYSChanceCount = GetTask(765)
	local nJJChanceCount = GetTask(766)
	local nXFChanceCount = GetTask(767)
	
	nCurRank = abs(nCurRank)
	local nType = tBattleEquip[nEquipCamp][nEquipIdx][2]
	if nType == 3 then		-- ¶¼Í³
		if nCurRank >= 3 or					-- ±¾ÖÜÊÇ¶¼Í³»òÒÔÉÏ¾üÏÎ
			nYSChanceCount >= 15 or			-- ÓÀ¾ÃÔªË§
			nJJChanceCount + nYSChanceCount >= 10 or			-- ÓÀ¾Ã½«¾ü
			nXFChanceCount + nJJChanceCount + nYSChanceCount >= 10 then		-- ÓÀ¾ÃÏÈ·æ
			return 1
		end
	elseif nType == 4 then	-- ÏÈ·æ
		if nCurRank >= 4 or					-- ±¾ÖÜÊÇÏÈ·æ»òÒÔÉÏ¾üÏÎ
			nYSChanceCount >= 15 or			-- ÓÀ¾ÃÔªË§
			nJJChanceCount + nYSChanceCount >= 10 or			-- ÓÀ¾Ã½«¾ü
			nXFChanceCount + nJJChanceCount + nYSChanceCount >= 10 then		-- ÓÀ¾ÃÏÈ·æ
			return 1
		end
	elseif nType == 5 then	-- ½«¾ü
		if nCurRank >= 5 or					-- ±¾ÖÜÊÇ´ó½«»òÒÔÉÏ¾üÏÎ
			nYSChanceCount >= 15 or			-- ÓÀ¾ÃÔªË§
			nJJChanceCount + nYSChanceCount >= 10 then			-- ÓÀ¾Ã½«¾ü
			return 1
		end
	elseif nType == 6 then	-- ÔªË§
		if nCurRank == 6 then					-- ±¾ÖÜÊÇÔªË§
			return 1
		end
	elseif nType == 7 then	-- ÓÀ¾ÃÔªË§
		if nCurRank == 6 or					-- ±¾ÖÜÊÇÔªË§
			nYSChanceCount >= 15 then		-- ÓÀ¾ÃÔªË§
			return 1
		end
	end
	Msg2Player("Qu©n hµm cña b¹n qu¸ thÊp, kh«ng thÓ trang bÞ"..sEquipName)
	return 0
end
