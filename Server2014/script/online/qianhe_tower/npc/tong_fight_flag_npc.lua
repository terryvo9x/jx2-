--°ïÅÉÕ½Æì¶Ô»°½Å±¾
Include("\\settings\\static_script\\online\\qianhe_tower\\qht_define.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	local npcIndex = GetTargetNpc();
	local szNpcName = gf_GetSafeStr(GetNpcName(npcIndex));
	local szTongName = gf_GetSafeStr(GetTongName());
	if qht_check_condition() ~= 1 then
		return 0;
	end
	if IsTongMember() == 0 or GetTime() - GetJoinTongTime() < 24 * 3600 then
		Talk(1,"","Ng­¬i ch­a gia nhËp m«n ph¸i hoÆc thêi gian giap nhËp m«n ph¸i ch­a ®ñ 1 ngµy th× kh«ng thÓ nhËn th­ëng");
		return 0;
	end
	if szNpcName ~= szTongName then
		Talk(1,"","Ng­¬i kh«ng ph¶i thµnh viªn cña bang héi kh«ng thÓ nhËn th­ëng");
		return 0;
	end
	local npcLevel = GetNpcLevel(npcIndex);
	--ÌúÑª°ïÅÉÕ½Æì
	if 2 == npcLevel then
		qht_DailyTaskReSet();
		if QHT_TASK_GROUP:GetTaskBit(QHT_TASK_GROUP.TongFlag, 2) ~= 0 then
			Talk(1,"","Ng­¬i ®· nhËn th­ëng råi");
			return 0;
		end
		local tSay = {
			"Ta muèn nhËn th­ëng/qht_award_tong_fight_flag_tiexue",
			"Ra khái/nothing",
		}
		Say("<color=green>"..szNpcName..":<color> Bæn bang cÊp 80 trë lªn,häc ®ñ kü n¨ng cÊp 55, nhËp bang qu¸ 1 ngµy, sÏ nhËn ®­îc phÇn th­ëng phong phó t¹i ®©y.",getn(tSay), tSay);
		return 1;
	end
	--°ïÅÉÕ½Æì
	if 1 == npcLevel then
		qht_DailyTaskReSet();
		if QHT_TASK_GROUP:GetTaskBit(QHT_TASK_GROUP.TongFlag, 1) ~= 0 then
			Talk(1,"","Ng­¬i ®· nhËn th­ëng råi");
			return 0;
		end
		local tSay = {
			"Ta muèn nhËn th­ëng/qht_award_tong_fight_flag",
			"Ra khái/nothing",
		}
		Say("<color=green>"..szNpcName..":<color> Bæn bang cÊp 80 trë lªn,häc ®ñ kü n¨ng cÊp 55, nhËp bang qu¸ 1 ngµy, sÏ nhËn ®­îc mét phÇn th­ëng t¹i ®©y.",getn(tSay), tSay);
		return 1;
	end
end

