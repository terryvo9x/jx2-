Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.BoxIndex,GetTargetNpc());
	DoWait(105,106,QHT_DIJI_BOX_TIME);
end

function diji_suc_call_back()
	local npcIndex = QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.BoxIndex);
	--print("GetNpcName(npcIndex)",GetNpcName(npcIndex))
	if GetNpcName(npcIndex) ~= "Thiªn TÇm B¶o R­¬ng cÊp thÊp" then
		return 0;
	end
	--
	if GetItemCount(2, 1, 30435) < 3 then
		Talk(1,"",format("Më b¶o r­¬ng cÇn tiªu hao %d M¶nh Hæ Phï vµ %d tiÒn vµng,tiÒn vµng trªn ng­êi kh«ng ®ñ th× kh«ng thÓ më", 3, 0));
		return 0;
	end
	if DelItem(2, 1, 30435, 3) ~= 1 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	qht_award_one(npcIndex);
	AddRuntimeStat(22, 2, 0, 1);
end