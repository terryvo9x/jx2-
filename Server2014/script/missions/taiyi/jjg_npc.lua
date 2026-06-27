Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\misc\\observer\\observer_head.lua")

g_NpcName = "<color=green>Thanh Thanh C« N­¬ng:<color>";

tNonsense = {
	"Hi hi, cuèi cïng còng ®· ®uæi ®­îc huynh ®Ö nhµ hä Ng« ®i råi, tõ nay ®©y sÏ lµ ®Þa bµn cña ta!",
	"Thó c­ìi cña ta ®©y, ®Ñp kh«ng? Nã lµ TÞch Tµ ThÇn Thó ®ã.",
	"Nãi nhá cho ng­¬i biÕt: Th¸i NhÊt Th¸p vµ ta cã quan hÖ rÊt lín ®Êy.",
	"§Õn Th¸i NhÊt Th¸p nhÊt ®Þnh ph¶i mang theo PhËt Muéi Muéi.",
	"Ph¶i nghe kü cuéc ®èi tho¹i cña Méc QuÕ Anh vµ D­¬ng T«n B¶o!",
	"V­ît ¶i thÊt b¹i cã thÓ khiªu chiÕn l¹i, kh«ng cÇn tho¸t ra ®¨ng nhËp l¹i.",
};

function main()
	local strTab = {
		"\n rêi ¶i/JJG_ConfirmLeave",
		"\nTa muèn quay l¹i chiÕn tr­êng (CÇn ["..TYT_IB_ITEM[1].."]x1)/JJG_Back2Fight",
		"\nKÕt thóc ®èi tho¹i/nothing",
	};
	local nIdx = random(1, getn(tNonsense));
	Say(g_NpcName..tNonsense[nIdx], getn(strTab), strTab);
end

function JJG_ConfirmLeave()
	local strtab = {
			"\n ®õng nãi nhiÒu lêi, t¹i h¹ ph¶i ®i/JJG_Leave",
			"\n ngåi quan s¸t chê th«ng quan/nothing",
		};
	Say(g_NpcName.."ThiÕu hiÖp kh«ng nªn dÔ dµng bá cuéc.",
		getn(strtab),
		strtab)
end

function JJG_Leave()
	LeaveTeam(1);
	local nMapId = GetMissionV(MV_RETURN_MAP_ID);
	TY_ClearAllGodState();
	NewWorld(nMapId, tExitPos[nMapId][1], tExitPos[nMapId][2]);
	if GetMSPlayerCount(tTY.missionID) == 0 then
		CloseMission(tTY.missionID);
	end
end

function JJG_AddGodState()
	if 1 == GetMissionV(tTY.mv_03) then	--×÷±×Ä£Ê½
		TY_AddGodState();
	end
	local nType = 1;
	if 1 ~= _JX2WZ then nType = 2; end
	local nRoute = GetPlayerRoute();
	if tRouteList[nRoute] and tRouteList[nRoute][2][nType] > 0 then
		RemoveState(10010);
		Msg2Player(format("TÊn c«ng +%d%%, duy tr× 5 phót", tRouteList[nRoute][2][nType]));
		CastState("state_attack_npc_add_spec", tRouteList[nRoute][2][nType], 5*60*18, 1, 10010);
	end
end

function JJG_Back2Fight()
	local nCurStageId = GetMissionV(MV_STAGE);
	if not tPlayerPos[nCurStageId] then
		WriteLog(format("[Th¸i NhÊt Th¸p] [StageId = %d, Quay vÒ täa ®é ban ®Çu cña chiÕn tr­êng bÞ lçi]\n", nCurStageId));
		return 0;
	end
	
	if 1 ~= DelItem(TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 1) then
		Talk(1, "", g_NpcName.."Mang theo trªn ng­êi"..TYT_IB_ITEM[1].."Kh«ng ®ñ!");
		return 0;
	end
	SetFightState(1);
	JJG_AddGodState();
	RestoreAll();
	TY_SetPlayerPos(tPlayerPos[nCurStageId][1]);
	local nMSType = GetMissionV(1);
	local nTaskID = tTaskID.ConsumeTaskID[nMSType];
	SetTask(nTaskID, GetTask(nTaskID) + 2);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 1})
end