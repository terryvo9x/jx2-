--¥Û’ΩΩ±¶œ‰
Include("\\script\\function\\world_boss\\wb_head.lua")

function main()
	if wb_GetBigBoxFlag() > 1000 then
		Talk(1,"",format("MÁi ngµy chÿ Æ≠Óc nhÀn 1000 l«n ph«n th≠Îng %s", GetNpcName(GetTargetNpc())));
		return
	end
	local boss = wb_GetBossName()
	if not boss then
		Talk(1,"","Chÿ c„ ng≠Íi ch¨i tham gia ti™u di÷t BOSS mÌi c„ th” mÎ b∂o r≠¨ng");
		return
	end
	wb_SetBigBoxIndex(GetTargetNpc())
	UseScrollEnable(0);
	SetDeathScript("\\script\\function\\world_boss\\wb_player_death.lua")
	CastState("state_fetter", 100, 18*16, 1, 9999);
	ProgressSlot(15 * 18, "wb_BigBoxAward")
end