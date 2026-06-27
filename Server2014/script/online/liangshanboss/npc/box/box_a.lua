--±¶œ‰aΩ≈±æ
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function main()
	if GetTime() - GetTask(Pre_Click_Time1) < Click_Space_time then
		--Msg2Player(format("ThÍi gian CD nh p vµo B∂o R≠¨ng lµ %d gi©y",Click_Space_time));
		return 0;
	end
	if LSB_Check_LR() == 0 then
			return 0;
	end
	local nNpcIndex = GetTargetNpc();
	--À˘ Ù≈–∂œ
--	local nNpcIndex = GetTargetNpc();
--	if nNpcIndex ~= GetTaskTemp(Gld_Boss_Index) then
--		return 0;
--	end
	--±≥∞¸ø’º‰≈–∂œ
	if gf_Judge_Room_Weight(2,2) ~= 1 then
		Talk(1,"","Kh´ng gian hµnh trang kh´ng ÆÒ");
    return 0;
	end
	StartTimeGuage("B∂o R≠¨ng",60,0,1)
	SetTask(Pre_Click_Time1,GetTime());
	--∏¯Ω±¿¯c
	LSB_Get_Award_A();
	SetNpcLifeTime(nNpcIndex,0);
end