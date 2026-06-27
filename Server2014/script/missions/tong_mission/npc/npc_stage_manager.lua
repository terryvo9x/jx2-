--create date:2007-07-09
--author:yanjun
--describe:°ï»á¹Ø¿¨¹ÜÀíÕß£¨¹Ø¿¨³¡µØÀïÃæµÄNPC£¬ÓÃÀ´±£´æ½ø¶ÈºÍ½øÐÐ´³¹ØµÄ£©
Include("\\script\\missions\\tong_mission\\main_function.lua");
g_THIS_FILE = "\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua";
g_szInfoHeader = "<color=green>Tö Quang C¸c L·o Nh©n<color>: ";
function main()
	load_stage(GetMissionS(MS_TONG_NAME));
end;

function ask_reason()
	AskClientForString("leave","NhÑ nhµng rêi khái...",1,32,"Sao ph¶i rêi khái?");
end;	

function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,ALL_CAMP);
	Msg2MSAll(MISSION_ID,GetName().."Rêi Tö Quang C¸c, ®Ó l¹i lêi nh¾n:"..sLeaveMsg);
end;

function know_rule()
	Talk(1,"main",g_szInfoHeader.."Sinh tån chÝnh lµ quy t¾c c¬ b¶n nhÊt.");
end;

function go_out_room()
	local selTab = {
				"§ång ý/go_out_room_confirm",
				"Hñy bá/nothing",
				}
	Say(g_szInfoHeader.."Ng­¬i cã ch¾c muèn ra ngo¹i ®­êng?",getn(selTab),selTab);
end;

function go_out_room_confirm()
	SetPos(tPos_Out_Room[1],tPos_Out_Room[2]-10);
	SetTaskTemp(TSK_TEMP_STATUS,0);
	TM_StopTimeGuage(-1);
	Msg2MSAll(MISSION_ID,GetName().." ®i ra tõ néi ®­êng.");
end;

function apply_enter_in_room()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	local nNormalPlayerCount = TM_GetNormalPlayerCount();
	if nNormalPlayerCount >= MAX_NORMAL_PLAYER_COUNT then
		Talk(1,"main",g_szInfoHeader.."Trong bang ®· cã <color=yellow>"..MAX_NORMAL_PLAYER_COUNT.."<color> vÞ cao thñ tiÕn vµo néi ®­êng, ng­¬i h·y chê mét chót xÝu n÷a nhÐ.");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	if TM_CheckNormalPlayer(nRoute) == 0 then
		Talk(1,"main",g_szInfoHeader.."Néi ®­êng ®· cã <color=yellow>"..MAX_ROUTE_PLAYER_COUNT.."<color> vÞ cao thñ cïng hÖ ph¸i ®¹i hiÖp, ng­¬i h·y ®îi thªm lóc n÷a nhÐ.");
		return 0;
	end;
	local nCurTime = GetTime();
	local nLastEnterTime = GetMissionV(MV_ENTER_TIME);
	--Èç¹û´¦ÓÚ´³¹Ø½×¶Î²¢ÇÒ¾µÀëÉÏ´Î½øÈëÊ±¼äÉÙÓÚMIN_ENTER_INTERVAL
	if GetMissionV(MV_STAGE_OVER) ~= 1 and nCurTime - nLastEnterTime <= MIN_ENTER_INTERVAL then
		Talk(1,"",g_szInfoHeader.."cßn <color=yellow>"..tf_GetTimeString(MIN_ENTER_INTERVAL-nCurTime+nLastEnterTime).."<color> míi cã thÓ tiÕn vµo néi ®­êng.");
		return 0;
	end;
	local nCurJob = IsTongMember();
	local szTongName = GetTongName();
	if (szTongName == GetMissionS(MS_TONG_NAME) and nCurJob ~= 0 and nCurJob <= 3) or LIMIT_VERSION == 0 then
		enter_in_room();	--°ï»áÁìµ¼Ö±½Ó½øÈë³¡µØ
	else
		sent_apply_to_tong_header();
	end;
end;

function sent_apply_to_tong_header()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	local nCurTime = GetTime();
	local nLastApplyTime = GetTask(TSK_APPLY_TIME);	--»ñµÃ¸öÈËÉÏ´ÎÉêÇëÊ±¼ä
	local nLastMSApplyTime = GetMissionV(MV_APPLY_TIME);	--»ñµÃMission¼Ç¢¼µÄÉÏ´ÎÍæ¼ÒÉêÇëµÄÊ±¼ä
	if nCurTime - nLastMSApplyTime <= MIN_MS_APPLY_INTERVAL then
		Talk(1,"",g_szInfoHeader.."HiÖn t¹i ®· cã ng­êi ch¬i kh¸c b¸o danh vµo néi ®­êng råi, xin mêi ®îi thªm lóc n÷a.");
		return 0;
	end;
	if nCurTime - nLastApplyTime <= MIN_APPLY_INTERVAL then
		Talk(1,"",g_szInfoHeader.."cßn <color=yellow>"..tf_GetTimeString(MIN_APPLY_INTERVAL-nCurTime+nLastApplyTime).."<color> míi cã thÓ ®Ò xuÊt b¸o danh vµo néi ®­êng.");
		return 0;		
	end;
	local _,__,tbTongHeader = TM_GetPlayerTable();
	local nHeaderCount = getn(tbTongHeader);
	local nOldPlayerIdx = PlayerIndex;
	local nMaxJob = 99999;
	if nHeaderCount <= 0 then
		Talk(1,"",g_szInfoHeader.."HiÖn t¹i néi ®­êng kh«ng cã ng­êi thÝch hîp ®Ó xö lý ®Ò nghÞ b¸o danh vµo néi ®­êng nµy.");
		return 0;
	else
		SetMissionV(MV_PROPOSER,PlayerIndex);	--¼Ç¢¼ÉêÇëÕßµÄË÷Òý
		SetTask(TSK_APPLY_TIME,nCurTime);
		SetMissionV(MV_APPLY_TIME,nCurTime);
		Msg2MSAll(GetName().."B¸o danh vµo néi ®­êng");
		Talk(1,"","Th«ng tin b¸o danh ®· ®­îc göi ®i!");
		local nMaxJobPlayerIdx = 0;
		local nCurJob = 0;
		for i=1,nHeaderCount do
			PlayerIndex = tbTongHeader[i];
			nCurJob = IsTongMember();
			if nCurJob ~= 0 and nCurJob < nMaxJob then	
				nMaxJobPlayerIdx = PlayerIndex;
				nMaxJob = nCurJob;
			end;
		end;
		PlayerIndex = nMaxJobPlayerIdx;	--Ö°Î»×î¸ßµÄÄÇÎ»²Å¿ÉÒÔÅú×¼
		Accept1v1(nOldPlayerIdx, GetName(nOldPlayerIdx).."B¸o danh vµo néi ®­êng. Cßn kho¶ng %d gi©y", MIN_MS_APPLY_INTERVAL, g_THIS_FILE)
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function OnAccept(nProposerIdx, nType)
	local nOldPlayerIdx = PlayerIndex;
	clear_apply_info();
	if nProposerIdx <= 0 then
		Talk(1,"","§èi ph­¬ng ®· rêi khái khu vùc.");
		Msg2Player("§èi ph­¬ng ®· rêi khái khu vùc");
		return 0;
	end;
	if nType == 0 then	--Ñ¡ÔñÈ¡Ïû»ò²Ù×÷³¬Ê±
		PlayerIndex = nProposerIdx;
		Talk(1,"","B¸o danh vÉn ch­a ®­îc th«ng qua.");
		Msg2Player("B¸o danh vÉn ch­a ®­îc th«ng qua");
		PlayerIndex = nOldPlayerIdx;
		return 0;
	end;
	PlayerIndex = nProposerIdx;
	SetMissionV(MV_ENTER_TIME,GetTime());
	enter_in_room();
	PlayerIndex = nOldPlayerIdx;
	return 1;
end;

function clear_apply_info()
	SetMissionV(MV_APPLY_TIME,0);
	SetMissionV(MV_PROPOSER,0);
end;

function enter_in_room()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	SetPos(tPos_In_Room[1],tPos_In_Room[2]+10);
	SetTaskTemp(TSK_TEMP_STATUS,1);	
	Msg2MSAll(MISSION_ID,GetName().."§· tiÕn vµo néi ®­êng");
end;

function boss_info()
	local nCurStage = GetMissionV(MV_STAGE);
	if GetMissionV(MV_STAGE_OVER) == 1 then
		nCurStage = nCurStage + 1;
	end;
	Talk(1,"main",g_szInfoHeader..TB_BOSS_INFO[nCurStage]);
end;
--½øÈëÏ¢Ò»¹Ø
function next_stage()
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"",g_szInfoHeader.."Ngo¹i tuyÕn kh«ng thÓ khëi ®éng quan ¶i.");
		return 0;
	end;
	if check_right() ~= 1 then
		return 0;
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--ÉÏÒ»¹Ø
	if nPreStage >= 4 then	--µÚ4¹ØÖ®ºó
		init_stage(nPreStage+1);
	else
		remove_faction1();
	end;
end;

function remove_faction1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"ThiÕu L©m/#remove_faction2(1)",
				"§­êng M«n/#remove_faction2(2)",
				"Nga My/#remove_faction2(3)",
				"C¸i Bang/#remove_faction2(4)",
				"Vâ §ang/#remove_faction2(5)",
				"Trang kÕ/remove_faction1_1",
				"Chän kÕt thóc/remove_faction_confirm",
				"Ta suy nghÜ l¹i!/nothing",
				}
	Say(g_szInfoHeader.."Xin mêi b¹n chän bá lo¹i bãng hé vÖ <color=yellow>1<color>: ",getn(selTab),selTab);
end;

function remove_faction1_1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"D­¬ng M«n/#remove_faction2(6)",
				"Ngò §éc/#remove_faction2(7)",
				"C«n L«n/#remove_faction2(8)",
				"Thóy Yªn/#remove_faction2(10)",
				"Trang tr­íc/remove_faction1",
				"Chän kÕt thóc/remove_faction_confirm",
				"Ta suy nghÜ l¹i!/nothing",
				}
	Say(g_szInfoHeader.."Xin mêi b¹n chän bá lo¹i bãng hé vÖ <color=yellow>1<color>: ",getn(selTab),selTab);
end;

function remove_faction2(nFaction)
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--Èç¹ûÔÚ¹Ø¿¨½øÐÐÖÐ²Ù×÷ÊÇ²»Æð×÷ÓÃµÄ
		return 0;
	end;
	if check_right() ~= 1 then
		return 0;
	end;
	if nFaction ~= nil then
		SetMissionV(MV_VALUE9,nFaction);
	end;
	local selTab = {
				"ThiÕu L©m/#remove_faction_confirm(1)",
				"§­êng M«n/#remove_faction_confirm(2)",
				"Nga My/#remove_faction_confirm(3)",
				"C¸i Bang/#remove_faction_confirm(4)",
				"Vâ §ang/#remove_faction_confirm(5)",
				"Trang kÕ/remove_faction2_1",
				"Chän kÕt thóc/remove_faction_confirm",
				"Ta suy nghÜ l¹i!/nothing",
				}
	Say(g_szInfoHeader.."Xin mêi b¹n chän bá lo¹i bãng hé vÖ <color=yellow>2<color>: ",getn(selTab),selTab);
end;

function remove_faction2_1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"D­¬ng M«n/#remove_faction_confirm(6)",
				"Ngò §éc/#remove_faction_confirm(7)",
				"C«n L«n/#remove_faction_confirm(8)",
				"Thóy Yªn/#remove_faction_confirm(10)",
				"Trang tr­íc/remove_faction2",
				"Chän kÕt thóc/remove_faction_confirm",
				"Ta suy nghÜ l¹i!/nothing",
				}
	Say(g_szInfoHeader.."Xin mêi b¹n chän bá lo¹i bãng hé vÖ <color=yellow>2<color>: ",getn(selTab),selTab);
end;

function remove_faction_confirm(nFaction)
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--Èç¹ûÔÚ¹Ø¿¨½øÐÐÖÐ²Ù×÷ÊÇ²»Æð×÷ÓÃµÄ
		return 0;
	end;
	if nFaction == GetMissionV(MV_VALUE9) then
		Talk(1,"remove_faction2",g_szInfoHeader.."Ng­¬i ®· chän lo¹i bãng hé vÖ nµy, xin mêi chän 1 lo¹i bãng hé vÖ kh¸c.");
		return 0;
	end;
	if nFaction ~= nil then
		SetMissionV(MV_VALUE10,nFaction);
	end;
	local szFactionRemove = "";
	if GetMissionV(MV_VALUE9) ~= 0 then
		szFactionRemove = szFactionRemove..tb_Npc_Info[GetMissionV(MV_VALUE9)][2]
	end;
	if GetMissionV(MV_VALUE10) ~= 0 then
		szFactionRemove = szFactionRemove.." vµ"..tb_Npc_Info[GetMissionV(MV_VALUE10)][2]
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--ÉÏÒ»¹Ø
	if szFactionRemove ~= "" then
		Msg2MSAll(MISSION_ID,"Quan ¶i nµy bá nh÷ng lo¹i bãng hé vÖ sau: "..szFactionRemove);
	end;
	init_stage(nPreStage+1);
end;
--²Ù×÷È¨ÏÞ¼ì²é
function check_right()
	if GetTaskTemp(TSK_TEMP_STATUS) == 0 then
		return 0;
	end;
	local nCurJob = IsTongMember();
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"",g_szInfoHeader.."Ngo¹i tuyÕn kh«ng thÓ khëi ®éng quan ¶i.");
		return 0;
	end;
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Thao t¸c nµy ph¶i ®­îc thùc hiÖn bëi bang chñ, phã bang chñ hoÆc tr­ëng l·o.");
		return 0;
	end;
	if GetMSPlayerCount(MISSION_ID,ALL_CAMP) < MIN_PLAYER_COUNT then
		Talk(1,"",g_szInfoHeader.."HiÖn t¹i tæng sè ng­êi ch¬i Ýt h¬n <color=yellow>"..MIN_PLAYER_COUNT.."<color> ng­êi, kh«ng thÓ b¾t ®Çu v­ît ¶i!	");
		return 0;
	end;
	if GetMissionV(MV_GET_BOX) == 1 then
		Talk(1,"",g_szInfoHeader.."Xin mêi nhÆt b¶o r­¬ng råi míi tiÕp tôc vµo ¶i kÕ tiÕp.");
		return 0;
	end;
	return 1;
end;

--½øÈëÄ³Ò»¹Ø
function init_stage(nStage)
	if GetTaskTemp(TSK_TEMP_STATUS) == 0 then
		return 0;
	end;
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--Èç¹ûÔÚ¹Ø¿¨½øÐÐÖÐ²Ù×÷ÊÇ²»Æð×÷ÓÃµÄ
		return 0;
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--ÉÏÒ»¹Ø
	--Msg2MSAll(MISSION_ID,GetName().."Khëi ®éng ¶i "..(nPreStage+1)..".");
	TM_InitStage(nStage);	--³õÊ¼»¯Ï¢Ò»¹Ø
end;
--ÖØÖÃµ±Ç°¹Ø¿¨
function reset_stage()
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:EndStage(0);
	SetMissionV(MV_STAGE,0);
end;
--¶ÁÈ¡½ø¶È
function load_stage(szTongName)
	ApplyRelayShareData(szTongName,0,0,g_THIS_FILE,"load_stage_callback");
end;

function load_stage_callback(szKey, nKey1, nKey2, nCount)
	local nStage = 0;
	gf_ShowDebugInfor(nCount);
	if nCount == 0 then
		nStage = 0;
	else
		nStage = GetRelayShareDataByKey(szKey,nKey1,nKey2,KEY_STAGE);
	end;
	gf_ShowDebugInfor(nStage);
	if nStage == nil then
		nStage = 0;
	end;
	if GetMissionV(MV_STAGE) == 0 then	--µÚÒ»´Îµã»÷Ê±°ÑÖ®Ç°µÄ½ø¶È¶Á½øÀ´
		SetMissionV(MV_STAGE,nStage);
	end;
	local selTab = {
				"Giíi thiÖu quy t¾c/know_rule",
				}
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	local nMissionState = GetMissionV(MV_MISSION_STATE);
	if nMissionState > MS_STATE_READY then	--×¼±¸Ê±¼ä½áÊøºó
		local nCurStage = GetMissionV(MV_STAGE);
		if bStageOver == 0 then	--Ö»ÓÐÕýÔÚ´òBOSSµÄÊ±ºò²ÅÓÐ´ËÑ¡Ïî
			if DEBUG_VERSION == 0 then
				tinsert(selTab,"Reset ¶i hiÖn t¹i/reset_stage");
			end;
		end;
		if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
			if bStageOver == 1 and nCurStage < MAX_STAGE then
				--tinsert(selTab,"B¾t ®Çu v­ît ¶i (¶i "..(nStage+1)..")/next_stage");
				if DEBUG_VERSION == 0 then
					tinsert(selTab,"Ta muèn v­ît ¶i 1/#init_stage(1)");
					tinsert(selTab,"Ta muèn v­ît ¶i 2/#init_stage(2)");
					tinsert(selTab,"Ta muèn v­ît ¶i 3/#init_stage(3)");
					tinsert(selTab,"Ta muèn v­ît ¶i 4/#init_stage(4)");
					tinsert(selTab,"Ta muèn v­ît ¶i 5/#init_stage(5)");
					tinsert(selTab,"Ta muèn v­ît ¶i 6/#init_stage(6)");
				end;
			end;
			tinsert(selTab,"Trë l¹i ngo¹i ®­êng	/go_out_room");
		else
			tinsert(selTab,"B¸o danh vµo néi ®­êng/apply_enter_in_room");
		end;
	else
		tinsert(selTab,"LËp tøc b¾t ®Çu v­ît ¶i/run_mission");
	end;
	if DEBUG_VERSION == 0 then
		tinsert(selTab,"KÕt thóc ¶i/close_mission");
	end;
	tinsert(selTab,"Giíi thiÖu Èn sÜ Tö Quang C¸c/know_boss_info");
	tinsert(selTab,"Më r­¬ng	/open_box");
	tinsert(selTab,"Ta muèn rêi khái n¬i ®©y/ask_reason");
	tinsert(selTab,"Kh«ng cã viÖc g×/nothing");	
	Say(g_szInfoHeader.."Nghe nãi néi ®­êng cao thñ mu«n vµn, ®Ó mµ sèng sãt tho¸t khái ®­îc n¬i ®©y h×nh nh­ kh«ng nhiÒu ng­êi, bang <color=yellow>"..szKey.."<color> nªn cÈn thËn.",getn(selTab),selTab);
end;

function know_boss_info()
	local selTab = {
				"Bãng hé vÖ/#know_boss_detail_info(0)",
				"¶i 1: Li Yªn/#know_boss_detail_info(1)",
				"¶i 2: B¸ KiÒu/#know_boss_detail_info(2)",
				"¶i 3: Phong D­¬ng, V©n Thïy/#know_boss_detail_info(3)",
				"¶i 4: §Þa HuyÒn/#know_boss_detail_info(4)",
				"¶i 5: TiÕt Hoµnh Thó/#know_boss_detail_info(5)",
				"¶i 6: Th­îng Cæ Háa Kú L©n Háa Vò, Th­îng Cæ Háa Kú L©n L­u Quang/#know_boss_detail_info(6)",
				"Ta chØ tiÖn ®­êng hái ch¬i!/nothing",
				}
	Say(g_szInfoHeader.."",getn(selTab),selTab);
end;

function know_boss_detail_info(nType)
	Talk(1,"know_boss_info",g_szInfoHeader..TB_BOSS_INFO[nType]);
end;

function run_mission()
	local selTab = {
				"§ång ý/run_mission_confirm",
				"§îi mét tÝ	/nothing",
				}
	Say(g_szInfoHeader.."Ng­¬i ch¾c ch¾n lËp tøc khëi ®éng ¶i nµy?",getn(selTab),selTab);
end;

function run_mission_confirm()
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Thao t¸c nµy ph¶i ®­îc thùc hiÖn bëi bang chñ, phã bang chñ hoÆc tr­ëng l·o.");
		return 0;
	end;
	if GetMissionV(MV_STAGE_OVER) == MS_STATE_READY then
		RunMission(MISSION_ID);
		Talk(1,"",g_szInfoHeader.."B©y giê ng­¬i cã thÓ b¾t ®Çu vµo khu vùc ®Ó v­ît ¶i ®­îc råi ®ã.");
	end;
end;

function team_enter_in_room()
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize == 0 then
		enter_in_room();
	else
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			enter_in_room();
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function close_mission()
	local selTab = {
				"§ång ý/close_mission_confirm",
				"Ta bÊm nhÇm råi/nothing",
				}
	Say(g_szInfoHeader.."X¸c ®Þnh muèn kÕt thóc ¶i vµ tho¸t khái khu vùc nµy?",getn(selTab),selTab);
end;

function close_mission_confirm()
	CloseMission(MISSION_ID);
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInfoHeader.."Ng­¬i vÉn ch­a thuéc vÒ r­¬ng cña m×nh.");
		return 0;
	end;
	OpenBox();
end;
