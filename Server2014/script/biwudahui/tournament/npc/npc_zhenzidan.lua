Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")
--Include("\\script\\misc\\soul\\soul.lua")--Îä»ê
--Include("\\script\\misc\\hello_gm.lua")
Include("\\script\\missions\\nvn\\3v3npc.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")

g_szInfoHead = "<color=green> §Æc Sø §¹i Héi TØ Vâ <color>:";
g_szThisFile = "\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua";
g_bInit = 0;		--±ê¼ÇÊÇ·ñ¾­¹ý³õÊ¼»¯
g_tbZiGeRank = {};

tbJUNGONGZHANG =
{
	[1] = {"Qu©n C«ng Ch­¬ng",2,1,9999,2},
	[2] = {"Qu©n C«ng §¹i",2,1,9998,5},
	[3] = {"Qu©n C«ng Huy Hoµng",2,1,9977,10},
}

function main()
	local tSel = {
		"§¹i Héi Tû Vâ-§¬n ®Êu\n/main_bwdh",
		"§¹i Héi Tû Vâ-Liªn ®Êu\n/main_3v3",
		--"¿ç·þ»õ±Ò¶Ò»»/exchangeMoney",
		--"ÖÐÔ½¶Ô¿¹ÈüÏßÉÏÑ¡°ÎÈüÏà¹Ø/gotoUrl",
		"Kh«ng cã g×!/nothing",
	}
	Say(g_szInfoHead.."Nh÷ng n¨m gÇn ®©y biªn c­¬ng liªn tiÕp x¶y ra chiÕn tranh, triÒu ®×nh h¹ chØ, s¾p xÕp §¹i Héi Tû Vâ ®¬n ®Êu vµ ®¹i héi tû thÝ liªn ®Êu. Hµo kiÖt c¸c m«n ph¸i ®Òu cã thÓ tham gia ®¨ng ký. Ng­êi giµnh th¾ng lîi cµng cã thÓ ®­îc n­íc nhµ träng dông, x«ng pha trËn m¹c. Hìi hiÖp sÜ, b¹n cã muèn tham gia kh«ng?",
		getn(tSel), tSel);
	local today = gf_TodayDate()
end

function exchangeMoney()
	local tSel = {
		"§æi Xu Tiªu Dao (Mua vËt phÈm tû vâ liªn server)/GLB_BW_Change_Xoyo_Gold",
		"§æi Tiªu Dao Ngäc (DÞch vô trÞ gia t¨ng liªn server) /GLB_BW_Change_Xoyo_Yu",
		"trë l¹i/main",
		"Kh«ng cã g×!/nothing",
	}
	Say(g_szInfoHead.."Sau khi vµo khu vùc liªn server, mét sè vËt phÈm sÏ kh«ng ®­îc sö dông, vµ t¹m thêi biÕn mÊt (quay vÒ sÏ ®­îc nhËn l¹i). TiÒn tÖ duy nhÊt ®­îc sö dông lµ <color=yellow>Xu Tiªu Dao<color>.", getn(tSel), tSel);
end

function main_bwdh_award()
	local tbSay = {}
	local szTitle = format("")
	szTitle = format("Cã thÓ nhËn th­ëng liªn server ë ®©y, ng­¬i muèn nhËn phÇn th­ëng g×?")
	tinsert(tbSay, format("\n%s/BWT_GetAward", "NhËn phÇn th­ëng ®¹i héi tû vç tuÇn tr­íc "))
	tinsert(tbSay, format("\n%s/season_award", "thi quý §¹i Héi Tû Vâ liªn quan "))
	tinsert(tbSay, format("\n%s/nothing", "Ra khái"))
	Say(szTitle, getn(tbSay), tbSay)
end

function nothing()
end

function main_bwdh()
	init_zige_rank();
	BWT_WeeklyClear();
	local nDate = tonumber(date("%Y%m%d%H"));
	local selTab = {
				"Ta muèn vµo khu vùc ®¬n ®Êu /GLB_BW_Goto_Field",
				--"ÁìÈ¡ÉÏÖÜ±ÈÎä´ó»á½±Àø/BWT_GetAward",
				--"ÓÃ±ÈÎä´ó»áÁîÅÆ»»È¡½±Àø/xunzhang_award",
				--"µ¥ÈË±ÈÎäÔöÖµ·þÎñÉèÖÃ/GLB_BW_Services_Set",
				"PhÇn th­ëng §¹i Héi Tû Vâ/main_bwdh_award",
				"Phæ biÕn §¹i héi tû vâ/know_detail",
				"Kh«ng cã g×!/nothing",
--				"ÖØÖÃÕ½¼¨/clear_biwu_result",
				}
	local nYear,nMonth,nDay,nHour = gf_GetDateData(g_nBWAwardDate);
	if nDate >= g_nBWAwardBeginDate and nDate <= g_nBWAwardDate then
		tinsert(selTab,2,"NhËn ["..g_szGloryAwardName.."] (Thêi gian dõng nhËn th­ëng:"..nYear.."niªn"..nMonth.."NguyÖt"..nDay.."NhËt"..nHour.." giê)/get_glory_bag");
	end;
	if GLB_BW_BiWuCheck() ~= 1 then --ÊÇ·ñ¿ªÆôÁË¿ç·þ±ÈÎä
		tremove(selTab,1)
	end
--	if nDate > g_nBWAwardDate then
--		tinsert(selTab,5,"±ÈÎä´ó»áÈü¼¾Ïà¹Ø/season_award")
--	end
--	if nDate >= 2010082616 and nDate < 2010090123 then
--		tinsert(selTab,6,"±ÈÎä´ó»áÉÙÒ»ÖÜ×Ê¸ñ·Ö²¹³¥£¨ÁìÈ¡½ØÖ¹ÈÕÆÚ£º2010Äê9ÔÂ1ÈÕ23Ê±£©/bw_buchang")
--	end
--	if BWDH_DEBUG_VERSION == 1 then
--		tinsert(selTab,"²âÊÔÈë¿Ú/test_entry");
--	end;
	Say(g_szInfoHead.."TriÒu ®×nh h¹ chØ, chuÈn bÞ §¹i Héi Tû Vâ ®¬n ®Êu, hµo kiÖt c¸c m«n ph¸i ®Òu cã thÓ ®¨ng ký tham gia. HiÖn t¹i ë vµo giai ®o¹n vßng chän, so tµi vâ nghÖ nh©n sÜ vâ l©m, chän ra danh s¸ch ng­êi vµo chung kÕt. VÞ thiÕu hiÖp nµy, b¹n muèn tham gia §¹i Héi Tû Vâ ®¬n ®Êu kh«ng.",getn(selTab),selTab);
end;

function clear_biwu_result()
	local selTab = {
				"Xãa sè lÇn tham gia so tµi cña ta thµnh 0/clear_biwu_times",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	Say(g_szInfoHead.."NÕu ng­¬i kh«ng hµi lßng víi thµnh tÝch hiÖn giê cña m×nh, th× cã thÓ tÈy mét sè chiÕn tÝch. VÝ dô ng­¬i cã thÓ xãa sè lÇn so tµi cña ng­¬i, bao gåm c¶ trËn th¾ng lÉn trËn thua thµnh 0. Ng­¬i muèn tÈy chiÕn tÝch kh«ng? ",getn(selTab),selTab);
end;

function clear_biwu_times()
	local selTab = {
			"§ång ý/clear_biwu_times_confirm",
			"Hñy bá/nothing",
			}
	local szItemName = "";
	if IB_VERSION == 1 then
		szItemName = "1 quyÓn S­ m«n ®¹i sù hµm";
	else
		szItemName = "3 c¸i Tiªu KiÕp t¸n";
	end;
	Say(g_szInfoHead.."Xãa sè lÇn so tµi sÏ nhËn ®­îc <color=yellow>"..szItemName.."<color>, vµ <color=yellow>bao gåm sè lÇn trong tuÇn vµ tæng sè lÇn cïng víi tÊt c¶ sè trËn th¾ng v¶ thua, l­u ý: Sau khi xãa sè lÇn thi ®Êu th× cÇn ph¶i ®¸nh ®ñ 10 trËn míi cã thÓ ®¨ng ký ®iÓm.<color> Ng­¬i x¸c ®Þnh muèn xãa chø?",getn(selTab),selTab);
end;

function clear_biwu_times_confirm()
	local szItemName = "";
	local nNeedItemNum = 0;
	local nID1,nID2,nID3 = 0,0,0;
	if IB_VERSION == 1 then
		szItemName = "1 quyÓn S­ m«n ®¹i sù hµm";
		nNeedItemNum = 1;
		nID1,nID2,nID3 = 2,1,1021;
	else
		szItemName = "3 c¸i Tiªu KiÕp t¸n";
		nNeedItemNum = 3;
		nID1,nID2,nID3 = 2,0,141;
	end;
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 then
		BWDH_SetTask(TSK_CURWEEKMATCH,0);
		BWDH_SetTask(TSK_CURWEEKWIN,0);
		BWDH_SetTask(TSK_CURWEEKLOSE,0);
		BWDH_SetTask(TSK_TOTALMATCH,0);
		BWDH_SetTask(TSK_TOTALLOSE,0);
		BWDH_SetTask(TSK_TOTALWIN,0);
		Say(g_szInfoHead.."Sè lÇn so tµi cña ng­¬i ®· ®­îc xãa.",0);
		WriteLog("["..LOG_HEAD.."]"..GetName().."§· xãa sè lÇn so tµi cña m×nh. ");
	else
		Talk(1,"",g_szInfoHead.."Ng­¬i cÇn <color=yellow>"..szItemName.."<color> míi cã thÓ xãa sè lÇn so tµi.");
	end;
end;

function get_award()
	get_biwu_award();
end;

function resetBiwuTV()
	BWDH_SetTask(TSK_CURLADDERVALUE,0);	--×Ê¸ñ·ÖÊýÇå0
	BWDH_SetTask(TSK_CURSIGNEDRESULT,0);	--µÇ¼Ç»ý·ÖÇå0
	BWDH_SetTask(TSK_LASTWEEKLADDER,0);	--ÉÏÖÜÅÅÃû
	BWDH_SetTask(TSK_HIGHESTWEEKLADDER,0);	--×î¸ßÖÜÅÅÃû
	BWDH_SetTask(TSK_CURREALRESULT,200);	--ÖÃ³É200
	BWT_QuitGestConvention();	--±¨ÃûÊ±ÒªÍË³öÅä¶ÔÁÐ±í
	BWDH_SetTask(TSK_SIGN_UP,2);	--ÒòÎªºÏ²¢ÁË£¬ÉèÎª1ÒÑ¾­Ã»ÓÐÒâÒå¡£ÕâÀïÒ»¶¨ÒªÉèÎª2²ÅÄÜ±íÊ¾Íæ¼Ò±¨¹ýÃû
end;

--ÒÔÏÂÎª²âÊÔ×¨ÓÃ=================================================================================
function test_entry()
	local selTab = {
				"Ta muèn gia nhËp vµo danh s¸ch ®Êu ®«i/join_peidui",
				"Ta muèn rêi khái danh s¸ch ®Êu ®«i/quit_peidui",
				"Chän ra mét cÆp tuyÓn thñ/get_random_pair",
				"B¾t ®Çu trËn tû vâ/init_one_round",
				"LËp nhãm më tû vâ/test_enter_field",
				"Ta muèn xem tû vâ/go_to_watch",
				"KiÓm tra trang bÞ cña ta/check_equip",
				"KiÓm tra xÕp h¹ng ®iÓm t­ c¸ch tr­íc khi hîp nhÊt/see_rank_before",
				"Kh«ng cã g×/nothing",
				}
	Say(g_szInfoHead.."Ng­¬i muèn g×?",getn(selTab),selTab);
end;

function test_enter_field()
	----------------------------------------
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_szInfoHead.."CÇn lËp nhãm hai ng­êi!");
		return 0;
	end
	----------------------------------------

	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		Talk(1,"",g_szInfoHead.."CÇn lËp nhãm hai ng­êi!");
		return 0;
	end;
	BWT_OpenMatch(GetTeamMember(1),GetTeamMember(2));
end;

function init_one_round()
	local nCount = BWT_InitOneRound();
	Talk(1,"",g_szInfoHead.."Chän ra tuyÓn thñ tû vâ"..nCount.."§óng.");
end;

function join_peidui()
	BWT_JoinGestConvention();
	Talk(1,"",g_szInfoHead.."B©y giê b¹n ®· tham gia tû vâ, mêi ®Õn <color=yellow>TuyÒn Ch©u hoÆc gÇn ®ã<color> ®îi th«ng b¸o tû vâ cña hÖ thèng.");
	Msg2Player("Ng­¬i ®· tham gia so tµi, h·y ®îi th«ng b¸o tõ hÖ thèng");
end;

function quit_peidui()
	BWT_QuitGestConvention();
	Talk(1,"",g_szInfoHead.."Ng­¬i ®· rêi khái danh s¸ch ®Êu ®«i.");
end;

function get_random_pair()
	if BWT_SentInviteToPlayer() == 1 then
		Talk(1,"",g_szInfoHead.."CÆp ®«i thµnh c«ng!");
		return 1;
	else
		Talk(1,"",g_szInfoHead.."CÆp ®«i thÊt b¹i!");
		return 0;
	end;
end;

function go_to_watch()
	local selTab = {
				"TuyÒn Ch©u/#go_to_watch_confirm(100)",
				"BiÖn Kinh/#go_to_watch_confirm(200)",
				"Thµnh §«/#go_to_watch_confirm(300)",
				"Kh«ng cã g×/nothing",
				}
	Say(g_szInfoHead.."Ng­¬i muèn xem tû vâ ë thµnh nµo?",getn(selTab),selTab);
end;

function go_to_watch_confirm(nMapID)
	NewWorld(TB_MAPID[nMapID][1],1620,3180);
end;

function check_equip()
	local nRetCode,tbEquip = BWT_CheckEquipment();
	local szHint = "";
	if nRetCode == 1 then
		Talk(1,"",g_szInfoHead.."Trang bÞ cña b¹n phï hîp quy ®Þnh tû vâ");
	else
		for i=1,getn(tbEquip) do
			if tbEquip[i] ~= 1 then
				szHint = szHint.."<color=yellow>"..TB_EquipPosName[i].."<color> vµo,";
			end;
		end;
		Talk(1,"",g_szInfoHead.."Trang bÞ kh«ng phï hîp quy ®Þnh tû vâ lµ"..szHint.."H·y kiÓm tra trang bÞ cña b¹n.");
	end;
end;

function xunzhang_award()
	local selTab = {
				"§æi phÇn th­ëng s­ m«n/xz_award_shimen",
				"§æi phÇn th­ëng Linh th¹ch/xz_award_lingshi",
				"§æi phÇn th­ëng kinh nghiÖm/xz_award_jingyan",
				"\nT¹m thêi kh«ng ®æi/nothing",
				}
if _JX2WZ ~= 1 then
	tinsert(selTab, "§æi phÇn th­ëng chiÕn trËn/xz_award_battle");
end

	Say(g_szInfoHead.."Ng­¬i muèn ®æi phÇn th­ëng g×?",getn(selTab),selTab);
end;

function xz_award_shimen()
	local nWeekNum = GetTask(TSK_XZ_AWARD_SHIMEN);
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",g_szInfoHead.."Ng­¬i ph¶i gia nhËp m«n ph¸i míi cã thÓ ®æi phÇn th­ëng nµy.");
		return 0;
	end;
	local szItemName = TB_TOTEM_INFO[nFaction][2][4];
	local selTab = {
				"§ång ý/xz_award_shimen_confirm",
				"\nT¹m thêi kh«ng ®æi/xunzhang_award",
				}
	Say(g_szInfoHead.."1 Tû vâ ®¹i héi bµi cã thÓ ®æi <color=yellow>1 "..szItemName.."vµ 10 ®iÓm cèng hiÕn S­ M«n<color>, mçi tuÇn nhiÒu nhÊt <color=red>cã thÓ ®æi 20 lÇn<color>PhÇn th­ëng nµy, tuÇn nµy ng­¬i cßn cã thÓ ®æi <color=yellow>"..(20-nWeekNum).."<color> lÇn.",getn(selTab),selTab);
end;

function xz_award_shimen_confirm()
	local nItemNum = GetItemCount(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3]);
	if nItemNum <= 0 then
		Talk(1,"main",g_szInfoHead.."Trªn ng­êi ng­¬i kh«ng cßn Tû vâ ®¹i héi bµi.");
		return 0;
	end;
	AskClientForNumber("xz_award_shimen_confirm_1",1,min(nItemNum,20),"Ng­¬i muèn ®æi mÊy lÇn?");
end;

function xz_award_shimen_confirm_1(nNum)
	local nWeekNum = GetTask(TSK_XZ_AWARD_SHIMEN);
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",g_szInfoHead.."Ng­¬i ph¶i gia nhËp m«n ph¸i míi cã thÓ ®æi phÇn th­ëng nµy.");
		return 0;
	end;
	if nWeekNum >= 20 then
		Talk(1,"",g_szInfoHead.."TuÇn nµy ng­¬i ®· ®æi <color=yellow>20<color> lÇn phÇn th­ëng S­ M«n, tuÇn sau l¹i ®Õn.");
		return 0;
	end;
	if nWeekNum + nNum > 20 then
		Talk(1,"xz_award_shimen",g_szInfoHead.."TuÇn nµy ng­¬i cã thÓ ®æi nhiÒu nhÊt <color=yellow>"..(20-nWeekNum).."<color> lÇn phÇn th­ëng nµy.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,10,g_szInfoHead) == 0 then
		return 0;
	end;
	local nID1 = TB_TOTEM_INFO[nFaction][2][1];
	local nID2 = TB_TOTEM_INFO[nFaction][2][2];
	local nID3 = TB_TOTEM_INFO[nFaction][2][3];
	local szItemName = TB_TOTEM_INFO[nFaction][2][4];
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nNum) == 1 then
		AddItem(nID1,nID2,nID3,nNum);
		BWDH_SetTask(336,GetTask(336)+nNum*10);
		BWDH_SetTask(TSK_XZ_AWARD_SHIMEN,nWeekNum+nNum);
		Msg2Player("B¹n nhËn ®­îc "..nNum.."c¸i"..szItemName.." vµ"..(nNum*10).." ®iÓm cèng hiÕn S­ M«n, tuÇn nµy ng­¬i cßn cã thÓ ®æi "..(20-nWeekNum-nNum).." lÇn phÇn th­ëng nµy.");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."Ph¶i cã <color=yellow>"..nNum.." Tû vâ ®¹i héi bµi<color> míi cã thÓ ®æi phÇn th­êng nµy.");
	end;
end;

function xz_award_lingshi()
	local nWeekNum = GetTask(TSK_XZ_AWARD_LINGSHI);
	local szIntro = "";
	if IB_VERSION == 1 then
		local selTab = {
					"Ta muèn sö dông 1 MËt hµm s­ m«n (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_lingshi_confirm(1)",
					"Ta muèn sö dông 3 MËt hµm s­ m«n (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_lingshi_confirm(2)",
					"Ta muèn sö dông 1 S­ m«n ®¹i sù hµm (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_lingshi_confirm(3)",
					"\nT¹m thêi kh«ng ®æi/xunzhang_award",
					}
		szIntro = "Dïng <color=yellow>1<color> MËt hµm s­ m«n ng­¬i sÏ ®æi ®­îc 3 viªn Linh th¹ch; dïng <color=yellow>3<color> MËt hµm s­ m«n ng­¬i sÏ ®æi ®­îc 10 viªn Linh th¹ch; dïng <color=yellow>1<color> S­ m«n ®¹i sù hµm ng­¬i sÏ ®æi ®­îc 36 viªn Linh th¹ch, Linh th¹ch ®æi ®­îc sÏ ®Ó trong Tô Linh ®Ønh.\nTû lÖ ®¼ng cÊp cña mçi viªn Linh th¹ch lµ: cÊp 7 lµ 0.1%, cÊp 6 lµ 1%, cÊp 5 lµ 5%, tõ cÊp 1 ®Õn cÊp 4 lµ 93.9%.\nTuÇn nµy ng­¬i ®· ®æi <color=yellow>"..(nWeekNum+1).."<color> lÇn phÇn th­ëng nµy, mçi tuÇn nhiÒu nhÊt <color=red>cã thÓ ®æi 100 lÇn<color>.";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	else
		local selTab = {
					"Ta muèn sö dông 1 Tinh LuyÖn B¨ng Th¹ch (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_lingshi_confirm(1)",
					"Ta muèn sö dông 3 Tinh LuyÖn B¨ng Th¹ch (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_lingshi_confirm(2)",
					"Ta muèn sö dông 10 Tinh LuyÖn B¨ng Th¹ch (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_lingshi_confirm(3)",
					"\nT¹m thêi kh«ng ®æi/xunzhang_award",
					}
		szIntro = "Dïng <color=yellow>1<color> Tinh LuyÖn B¨ng Th¹ch ng­¬i sÏ ®æi ®­îc 3 viªn Linh th¹ch; dïng <color=yellow>3<color> Tinh LuyÖn B¨ng Th¹ch ng­¬i sÏ ®æi ®­îc 10 viªn Linh th¹ch; dïng <color=yellow>10<color> Tinh LuyÖn B¨ng Th¹chng­¬i sÏ ®æi ®­îc 36 viªn Linh th¹ch, Linh th¹ch ®æi ®­îc sÏ ®Ó trong Tô Linh ®Ønh.\nTû lÖ ®¼ng cÊp cña mçi viªn Linh th¹ch lµ: cÊp 7 lµ 0.1%, cÊp 6 lµ 1%, cÊp 5 lµ 5%, tõ cÊp 1 ®Õn cÊp 4 lµ 93.9%.\nTuÇn nµy ng­¬i ®· ®æi <color=yellow>"..(nWeekNum+1).."<color> lÇn phÇn th­ëng nµy, mçi tuÇn nhiÒu nhÊt <color=red>cã thÓ ®æi 100 lÇn<color>.";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	end;
end;

function xz_award_lingshi_confirm(nUseType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_LINGSHI);
	if nWeekNum >= 100 then
		Talk(1,"",g_szInfoHead.."TuÇn nµy ng­¬i ®· ®æi <color=yellow>100<color> lÇn phÇn th­ëng Linh th¹ch, tuÇn sau l¹i ®Õn.");
		return 0;
	end;
	local tbNeedItemInfo = {};
	local tbLingShiNum = {3,10,36};
	if IB_VERSION == 1 then
		tbNeedItemInfo =
		{
			[1] = {2,1,1020,1,"MËt hµm s­ m«n"},
			[2] = {2,1,1020,3,"MËt hµm s­ m«n"},
			[3] = {2,1,1021,1,"S­ m«n ®¹i sù hµm"},
		}
	else
		tbNeedItemInfo =
		{
			[1] = {2,1,533,1,"Tinh luyÖn B¨ng Th¹ch"},
			[2] = {2,1,533,3,"Tinh luyÖn B¨ng Th¹ch"},
			[3] = {2,1,533,10,"Tinh luyÖn B¨ng Th¹ch"},
		}
	end;
	local nNeedNum = tbNeedItemInfo[nUseType][4];
	if GetItemCount(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3]) < nNeedNum then
		Talk(1,"xunzhang_award",g_szInfoHead.."<color=yellow>"..tbNeedItemInfo[nUseType][5].."<color> sè l­îng kh«ng ®ñ, ng­¬i cÇn <color=yellow>"..nNeedNum.."<color> c¸i"..tbNeedItemInfo[nUseType][5]..".");
		return 0;
	end;
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],1) == 1 then
		DelItem(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3],nNeedNum);
		BWDH_SetTask(TSK_XZ_AWARD_LINGSHI,nWeekNum+1);
		give_lingshi(tbLingShiNum[nUseType]);
		Msg2Player("Trong tuÇn nµy ®¹i hiÖp ®©y lµ lÇn thø "..(nWeekNum+1).." lÇn phÇn th­ëng Linh th¹ch");
		WriteLog("[PhÇn th­ëng §¹i héi tû vâ]"..GetName().."§æi phÇn th­ëng Linh th¹ch");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."Ng­¬i cÇn <color=yellow>1 Tû vâ ®¹i héi bµi<color> míi cã thÓ ®æi phÇn th­ëng nµy.");
	end;
end;

function give_lingshi(nCount)
	local tbNum = {0,0,0,0,0,0,0};
	local nRand = 0;
	for i=1,nCount do
		nRand = random(1,1000);
		if nRand <= 1 then
			tbNum[7] = tbNum[7]+1;
		elseif nRand <= 11 then
			tbNum[6] = tbNum[6]+1;
		elseif nRand <= 61 then
			tbNum[5] = tbNum[5]+1;
		else
			nRand = random(1,4);
			tbNum[nRand] = tbNum[nRand]+1;
		end;
	end;
	local szString = "";
	for i=1,getn(tbNum) do
		if tbNum[i] ~= 0 then
			szString = szString.."B¹n nhËn ®­îc "..i.." (cÊp) Linh Th¹ch"..tbNum[i].." viªn,";
			lspf_AddLingShiInBottle(i,tbNum[i]);
		end;
	end;
	Msg2Player(szString.." ®· cho vµo Tô Linh ®Ønh");
	WriteLog("[PhÇn th­ëng §¹i héi tû vâ]:"..GetName().."NhËn ®­îc"..nCount.." viªn Linh th¹ch: "..szString);
end;
--¾­Ñé½±Àø================================================================================
function xz_award_jingyan()
	local nWeekNum = GetTask(TSK_XZ_AWARD_JINGYAN);
	local nLevel = GetLevel();
	local szIntro = "";
	if IB_VERSION == 1 then
		local nExp = floor(nLevel^4/200);--µÈ¼¶µÄËÄ´Î·½/200
		local selTab = {
					"Ta muèn sö dông 1 MËt hµm s­ m«n (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_jingyan_confirm(1)",
					"Ta muèn sö dông 3 MËt hµm s­ m«n (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_jingyan_confirm(2)",
					"Ta muèn sö dông 1 S­ m«n ®¹i sù hµm (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_jingyan_confirm(3)",
					"\nT¹m thêi kh«ng ®æi/xunzhang_award",
					}
		szIntro = "Kinh nghiÖm ng­¬i cã thÓ nhËn ®­îc lµ <color=yellow>"..nExp.."<color>.\nDïng 1 MËt hµm s­ m«n ®æi kinh nghiÖm x2, cã 10% cã ®­îc kinh nghiÖm x4\nDïng 3 MËt hµm s­ m«n ®æi kinh nghiÖm x3, cã 10% cã ®­îc kinh nghiÖm x6\nDïng 1 S­ m«n ®¹i sù hµm ®æi kinh nghiÖm x4, cã 10% cã ®­îc kinh nghiÖm x8.\nTuÇn nµy ng­¬i ®· ®æi <color=yellow>"..(nWeekNum+1).."<color> lÇn phÇn th­ëng nµy, mçi tuÇn nhiÒu nhÊt <color=red>cã thÓ ®æi 100 lÇn<color>.";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor((nLevel^4)*300000/(80^4));	--Íæ¼ÒµÈ¼¶µÄËÄ´Î·½*30w/80µÄ
		local selTab = {
					"Ta muèn sö dông 1 Tinh LuyÖn B¨ng Th¹ch (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_jingyan_confirm(1)",
					"Ta muèn sö dông 3 Tinh LuyÖn B¨ng Th¹ch (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_jingyan_confirm(2)",
					"Ta muèn sö dông 10 Tinh LuyÖn B¨ng Th¹ch (cÇn 1 Tû vâ ®¹i héi bµi)/#xz_award_jingyan_confirm(3)",
					"\nT¹m thêi kh«ng ®æi/xunzhang_award",
					}
		szIntro = "§iÓm søc kháe hiÖn giê cña ng­¬i lµ <color=yellow>"..nCurGoldenExp.."<color>. §iÓm søc kháe ng­¬i cã thÓ chuyÓn lµ <color=yellow>"..nGoldenExp.."<color> ®iÓm.\nDïng 1 Tinh LuyÖn B¨ng Th¹ch cã thÓ ®æi ®iÓm søc kháe x2, cã 10% cã ®iÓm søc kháe x4\nDïng 3 Tinh LuyÖn B¨ng Th¹ch cã thÓ ®æi ®iÓm søc kháe x2, cã 10% cã ®iÓm søc kháe x6\nDïng 10 Tinh LuyÖn B¨ng Th¹ch ®æi ®iÓm søc kháe x4, cã 10% cã ®iÓm søc kháe x8.\nTuÇn nµy ng­¬i ®· ®æi <color=yellow>"..(nWeekNum+1).."<color> lÇn phÇn th­ëng nµy, mçi tuÇn nhiÒu nhÊt <color=red>cã thÓ ®æi 100 lÇn<color>.";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	end;
end;

function xz_award_jingyan_confirm(nUseType)
	local nLevel = GetLevel();
	if IB_VERSION == 1 then	--Ãâ·ÑÇøÖ±½Óµ÷ÓÃxz_award_jingyan_confirm_final
		xz_award_jingyan_confirm_final(nUseType);
	else	--ÊÕ·ÑÇøÅÐ¶Ïµ±Ç°½¡¿µ¾­Ñé¹»²»¹»
		local nCurGoldenExp = GetGoldenExp();
		local tbMutiple = {2,3,4};
		local nMutiple = tbMutiple[nUseType];
		local nGoldenExp = floor((nLevel^4)*300000/(80^4))*nMutiple;
		if nGoldenExp > nCurGoldenExp then	--Èç¹û½¡¿µ¾­Ñé²»¹»£¬¸ø¸öÌáÊ¾
			local selTab = {
					"§ång ý/#xz_award_jingyan_confirm_final("..nUseType..")",
					"T¹m thêi kh«ng ®æi/nothing",
					}
			Say(g_szInfoHead.."Søc kháe hiÖn giê cña ng­¬i lµ <color=yellow>"..nCurGoldenExp.."<color> ®iÓm, kh«ng ®ñ <color=yellow>"..nGoldenExp.."<color> ®iÓm, ng­¬i x¸c nhËn muèn ®æi chø?",getn(selTab),selTab);
		else
			xz_award_jingyan_confirm_final(nUseType);
		end;
	end;
end;

function xz_award_jingyan_confirm_final(nUseType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_JINGYAN);
	if nWeekNum >= 100 then
		Talk(1,"",g_szInfoHead.."TuÇn nµy ng­¬i ®· ®æi <color=yellow>100<color> lÇn phÇn th­ëng kinh nghiÖm, tuÇn sau l¹i ®Õn.");
		return 0;
	end;
	local nLevel = GetLevel();
	local tbNeedItemInfo = {};
	local tbExpMultiple = {2,3,4};
	local nExp = 0;
	local nGoldenExp = 0;
	if IB_VERSION == 1 then
		nExp = floor(nLevel^4/200);--µÈ¼¶µÄËÄ´Î·½/200
		tbNeedItemInfo =
		{
			[1] = {2,1,1020,1,"MËt hµm s­ m«n"},
			[2] = {2,1,1020,3,"MËt hµm s­ m«n"},
			[3] = {2,1,1021,1,"S­ m«n ®¹i sù hµm"},
		}
	else
		nGoldenExp = floor((nLevel^4)*300000/(80^4));	--Íæ¼ÒµÈ¼¶µÄËÄ´Î·½*30w/80µÄËÄ´Î·½
		tbNeedItemInfo =
		{
			[1] = {2,1,533,1,"Tinh luyÖn B¨ng Th¹ch"},
			[2] = {2,1,533,3,"Tinh luyÖn B¨ng Th¹ch"},
			[3] = {2,1,533,10,"Tinh luyÖn B¨ng Th¹ch"},
		}
	end;
	local nRand = 0;
	local nNeedNum = tbNeedItemInfo[nUseType][4];
	if GetItemCount(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3]) < nNeedNum then
		Talk(1,"xunzhang_award",g_szInfoHead.."<color=yellow>"..tbNeedItemInfo[nUseType][5].."<color> sè l­îng kh«ng ®ñ, ng­¬i cÇn <color=yellow>"..nNeedNum.."<color> c¸i"..tbNeedItemInfo[nUseType][5]..".");
		return 0;
	end;
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],1) == 1 then
		DelItem(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3],nNeedNum);
		nRand = random(1,100);
		BWDH_SetTask(TSK_XZ_AWARD_JINGYAN,nWeekNum+1);
		if IB_VERSION == 1 then
			if nRand <= 10 then
				nExp = floor(2*nExp*tbExpMultiple[nUseType]);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..(2*tbExpMultiple[nUseType]).." lÇn kinh nghiÖm");
			else
				nExp = floor(nExp*tbExpMultiple[nUseType]);
			end;
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		else
			if nRand <= 10 then
				nGoldenExp = floor(2*nGoldenExp*tbExpMultiple[nUseType]);
				Msg2Player("Chóc mõng ng­¬i ®· ®æi"..(2*tbExpMultiple[nUseType]).." lÇn ®iÓm søc kháe");
			else
				nGoldenExp = floor(nGoldenExp*tbExpMultiple[nUseType]);
			end;
			gf_GoldenExp2Exp(nGoldenExp);
		end;
		Msg2Player("Trong tuÇn nµy ®¹i hiÖp ®©y lµ lÇn thø "..(nWeekNum+1).." lÇn phÇn th­ëng kinh nghiÖm");
		WriteLog("[PhÇn th­ëng §¹i héi tû vâ]"..GetName().."§æi phÇn th­ëng kinh nghiÖm");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."Ng­¬i cÇn <color=yellow>1 Tû vâ ®¹i héi bµi<color> míi cã thÓ ®æi phÇn th­ëng nµy.");
	end;
end;
--========Õ½³¡½±Àø========================================================================
function xz_award_battle()
	local nWeekNum = GetTask(TSK_XZ_AWARD_JUNGONG);
	local nLevel = GetLevel();
	local nRoute = GetPlayerRoute();
	local nCurDate = tonumber(date("%Y%m%d%H"));
	if nRoute == 0 then
		Talk(1,"",g_szInfoHead.."Ng­¬i ph¶i gia nhËp m«n ph¸i míi cã thÓ ®æi phÇn th­ëng chiÕn tr­êng.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"",g_szInfoHead.."§¼ng cÊp cña ng­¬i qu¸ thÊp, ph¶i ®¹t ®Õn cÊp 60 míi cã thÓ ®æi phÇn th­ëng nµy.");
		return 0;
	end;
	local selTab = {
				"Ta muèn dïng Qu©n C«ng Ch­¬ng (qu©n c«ng x2, kinh nghiÖm x1.5)/#give_battle_award_confirm(1)",
				"Ta muèn dïng §¹i Qu©n C«ng Ch­¬ng (qu©n c«ng x5, kinh nghiÖm x2)/#give_battle_award_confirm(2)",
				"Ta muèn dïng Huy hoµng ch­¬ng (qu©n c«ng x10, kinh nghiÖm x2.5)/#give_battle_award_confirm(3)",
				"Kh«ng dïng/#give_battle_award_confirm(0)",
				"HiÖn giê ta ch­a muèn ®æi phÇn th­ëng/xunzhang_award",
				}
	local tbExpX = {1,1,1,2,2,3};	--Óë¾üÏÎ¶ÔÓ¦µÄ¾­ÑéÏµÊý
	local nCurRank = abs(GetTask(704));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--Èç¹ûÃ»ÓÐ¾üÏÎ»ò¾üÏÎ³ö´í
		nCurRank = 1;	--ÖÃÎª1
	end;
	local nExpMultiple = 0;
	local nExpMultiple = tbExpX[nCurRank];
	if nCurRank == 3 and GetTask(764) <= 100 then
		nExpMultiple = 1.5;	--¸ß¼¶¶¼Í³ÊÇ1.5±¶
	end;
	local nLevelX = 0;
	local nCurGoldenExp = 0;
	local szAddedCompensation = "";
	if IB_VERSION == 0 then
		nLevelX = 75;
		nCurGoldenExp = GetGoldenExp();
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*nExpMultiple);	--40000*£¨Íæ¼ÒµÈ¼¶Æ½·½/75£©*¾üÏÎµ÷½ÚÏµÊý
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	local szGoldenExp = "";
	if IB_VERSION == 0 then
		szGoldenExp = "Søc kháe ®æi kinh nghiÖm <color=yellow>"..nGoldenExpAward.."<color> ®iÓm (®iÓm søc kháe cña ng­¬i hiÖn giê lµ: <color=yellow>"..nCurGoldenExp.."<color>),";
	end;
	Say(g_szInfoHead.."§æi phÇn th­ëng chiÕn tr­êng cÇn cã <color=yellow>30 Tû vâ ®¹i héi bµi<color>. PhÇn th­ëng chiÕn tr­êng ng­¬i cã thÓ ®æi hiÖn giê lµ ®iÓm qu©n c«ng <color=yellow>"..nJunGong.."<color> ®iÓm, ®iÓm kinh nghiÖm <color=yellow>"..nExpAward.." ®iÓm<color>,"..szGoldenExp.."TuÇn nµy ng­¬i ®· ®æi <color=yellow>"..(nWeekNum+1).."<color> lÇn phÇn th­ëng nµy, mçi ng­êi mçi tuÇn cã thÓ ®æi <color=yellow>1<color> lÇn. Ng­¬i muèn nhËn trùc tiÕp, hay lµ sö dông Qu©n C«ng Ch­¬ng ®Ó nhËn?",getn(selTab),selTab);
end;

function give_battle_award_confirm(nType)
	if nType == 0 then
		local selTab = {
					"Sö dông qu©n c«ng ch­¬ng/xz_award_battle",
					"Kh«ng muèn dïng qu©n c«ng nµo hÕt/#give_battle_award(0)",
					}
		Say(g_szInfoHead.."Ng­¬i x¸c nhËn kh«ng sö dông Qu©n C«ng Ch­¬ng chø?",getn(selTab),selTab);
	else
		local selTab = {
					format("§ång ý/#give_battle_award(%d)",nType),
					"§Ó ta suy nghÜ/nothing",
					}
		Say(g_szInfoHead.."Ng­¬i x¸c nhËn muèn sö dông <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> chø?",getn(selTab),selTab);
	end;
end;

function give_battle_award(nType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_JUNGONG);
	if nWeekNum >= 1 then
		Talk(1,"",g_szInfoHead.."TuÇn nµy ng­¬i ®· ®æi 1 lÇn phÈn th­ëng chiÕn tr­êng.");
		return 0;
	end;
	if GetItemCount(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3]) < 30 then
		Talk(1,"",g_szInfoHead.."Ng­¬i ph¶i cã <color=yellow>30 Tû vâ ®¹i héi bµi<color> míi cã thÓ ®æi phÇn th­ëng.");
		return 0;
	end;
	local nLevel = GetLevel();
	local tbExpX = {1,1,1,2,2,3};	--Óë¾üÏÎ¶ÔÓ¦µÄ¾­ÑéÏµÊý
	local nCurRank = abs(GetTask(704));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--Èç¹ûÃ»ÓÐ¾üÏÎ»ò¾üÏÎ³ö´í
		nCurRank = 1;	--ÖÃÎª1
	end;
	local nExpMultiple = 0;
	local nExpMultiple = tbExpX[nCurRank];
	if nCurRank == 3 and GetTask(764) <= 100 then
		nExpMultiple = 1.5;	--¸ß¼¶¶¼Í³ÊÇ1.5±¶
	end;
	local tbJZGJunGong = {2,5,10};
	local tbJGZExp = {1.5,2,2.5};
	local nLevelX = 0;
	if IB_VERSION == 0 then
		nLevelX = 75;
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*nExpMultiple);	--40000*£¨Íæ¼ÒµÈ¼¶Æ½·½/75£©*¾üÏÎµ÷½ÚÏµÊý
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) ~= 1 then
			Talk(1,"",g_szInfoHead.."Ng­¬i kh«ng cã <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>!");
			return 0;
		end;
		nExpAward = nExpAward*tbJGZExp[nType];
		nJunGong = nJunGong*tbJZGJunGong[nType];
		Msg2Player("Ng­¬i dïng 1 "..tbJUNGONGZHANG[nType][1]);
	end;
	DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],30);
	BWDH_SetTask(TSK_XZ_AWARD_JUNGONG,nWeekNum+1);
	SetRankPoint(5,701,1);	--ÏÈË¥¼õ
	local nCurJunGong = GetTask(701);
	if nCurJunGong >= 0 then
		SetTask(701,nCurJunGong+nJunGong);
		Msg2Player("Phe Tèng, b¹n nhËn ®­îc "..nJunGong.." ®iÓm c«ng tr¹ng");
	else
		SetTask(701,nCurJunGong-nJunGong);
		Msg2Player("Phe Liªu, b¹n nhËn ®­îc "..nJunGong.." ®iÓm c«ng tr¹ng");
	end;
	SetRankPoint(5,701,1);	--¼ÓÈë¾ü¹¦ÅÅÐÐ°ñ
	ModifyExp(nExpAward);
	Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm chiÕn tr­êng ");
	if IB_VERSION == 0 then
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	WriteLog("[PhÇn th­ëng §¹i héi tû vâ]"..GetName().." ®æi phÇn th­ëng chiÕn tr­êng. §¼ng cÊp:"..nLevel..", lo¹i Qu©n C«ng Ch­¬ng:"..nType..", qu©n hµm:"..nCurRank..", qu©n c«ng: "..nJunGong);
end;

function get_glory_bag()
	local szName = GetName();
	local nRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."B¹n vÉn ch­a ra nhËp m«n ph¸i, kh«ng cã t­ c¸ch nhËn th­ëng "..g_szGloryAwardName..".");
		return 0;
	end;
	local tbRankInfo = {};
	local nBagNum = 0;
	local szMsg = "Kh«ng vµo ®­îc danh s¸ch Top 10, vµ ®iÓm t­ c¸ch lµ 0";
	local szMsg1 = "Kh«ng vµo top 10 m«n ph¸i, nh­ng ®iÓm t­ c¸ch lín h¬n 0";
	local tbBagInfo = {100,40,40,20,20,20,20,20,20,20};
--	local tbRoute = gf_GetRouteTable();
--	for i=0,1 do
--		for j=1,getn(tbRoute) do
--			for k,v in g_tbZiGeRank[i][tbRoute[j]] do
--				print(i,k,v[1],v[2]);
--			end;
--		end;
--	end;
	local nBWLevel,nBWRank = get_rank_before();
	if nBWRank > 0 then
		nBagNum = tbBagInfo[nBWRank];
		if nBWLevel == 0 then
			nBagNum = floor(nBagNum/2);
		end;
		szMsg = TB_BIWU_NAME[nBWLevel+1].."("..gf_GetRouteName(nRoute)..") "..nBWRank.."Danh";
	elseif GetTask(TSK_OLD_ZIGE_POINT) > 0 then	--Èç¹ûÃ»½øÅÅÐÐ°ñ£¬µ«Ö»Òª´óÓÚ0·Ö¾Í¿É»ñ10¸ö°ü
		szMsg = szMsg1;
		nBagNum = 10;
	end;
	local selTab = {
				"Ta muèn nhËn!/#get_glory_bag_1("..nBagNum..")",
				"KiÓm tra xÕp h¹ng tÝch ®iÓm t­ c¸ch /see_rank_before",
				g_szGloryAwardName.."ThuyÕt minh/know_glory_bag",
				"T¹m thêi kh«ng nhËn/nothing",
				}
	Say(g_szInfoHead.."Ng­êi ch¬i ®­îc <color=green>vµo b¶ng xÕp h¹ng ®iÓm t­ c¸ch m«n ph¸i <color>, sÏ nhËn ®­îc mét phÇn quµ hÊp dÉn, cã thÓ nhËn ®­îc mét sè l­îng nhÊt ®Þnh<color=green>"..g_szGloryAwardName.."<color>. §ång thêi ®iÓm t­ c¸ch sÏ bÞ xãa s¹ch.\n  ng­êi ch¬i cã tÝch ®iÓm tû vâ d­íi 200 ®iÓm, tÝch ®iÓm t¨ng thªm 100 ®iÓm, tÝch ®iÓm sau khi t¨ng xong nhiÒu nhÊt kh«ng qu¸ 200.\n  Sau nµy còng sÏ c¨n cø theo sè ®iÓm t­ c¸ch kh«ng ®Þnh kú ph¸t phÇn th­ëng.\n  C¨n cø vµo chiÕn tÝch tr­íc kia cña b¹n:<color=yellow>"..szMsg.."<color>, cã thÓ nhËn ®­îc <color=yellow>"..nBagNum.."<color> c¸i"..g_szGloryAwardName..". B¹n muèn nhËn th­ëng ngay kh«ng?",getn(selTab),selTab);
end;

function know_glory_bag()
if _JX2WZ == 1 then
	Talk(2,"get_glory_bag",g_szInfoHead.."Trong b¶ng xÕp h¹ng tû vâ ®¬n ®Êu tr­íc kia, cã thÓ nhËn phÇn th­ëng <color=yellow>"..g_szGloryAwardName.."<color>.\n    <color=yellow> ®iÓm t­ c¸ch ®øng top 10 b¶ng xÕp h¹ng m«n ph¸i <color>: ®øng thø nhÊt cã thÓ nhËn ®­îc <color=yellow>100<color> tói, ®øng thø 2, ®øng thø ba cã thÓ nhËn ®­îc <color=yellow>40<color> tói, ®øng thø 4 ®Õn thø 10 cã thÓ nhËn ®­îc <color=yellow>20<color> tói#\n    <color=yellow> ®iÓm t­ c¸ch kh«ng ®øng trong b¶ng xÕp h¹ng <color>: chØ cÇn ®iÓm t­ c¸ch lín h¬n 0, sÏ tÆng <color=yellow>10<color> tói.",g_szInfoHead.."Mçi c¸i <color=yellow>"..g_szGloryAwardName.."<color> cã thÓ më ra vËt phÈm sau:\n    4 quyÓn thùc chiÕn t©m ®¾c, 20 ®iÓm cèng hiÕn s­ m«n, 1 tói ngò hµnh nguyªn th¹ch \n    1 tiªu kiÕp t¸n (x¸c suÊt nhÊt ®Þnh nhËn ®­îc, cø më 5 tói nhÊt ®Þnh sÏ ®­îc)\n    1 bµn long bÝch (x¸c suÊt nhÊt ®Þnh nhËn ®­îc, cø më 10 tói nhÊt ®Þnh nhËn ®­îc)\n    1 b¶o r­¬ng ngò hµnh th¹ch cao cÊp (x¸c suÊt nhÊt ®Þnh nhËn ®­îc, cø më 5 tói nhÊt ®Þnh sÏ ®­îc)\n    Ngoµi ra, mçi lÇn më 40 tói sÏ nhËn ®­îc 3 MËt TÞch S­ M«n-Cao, më 100 tói nhËn ®­îc 1 Cöu Ch©u Long Phông T­êng Bao.");
else
	Talk(2,"get_glory_bag",g_szInfoHead.."Trong b¶ng xÕp h¹ng tû vâ ®¬n ®Êu tr­íc kia, cã thÓ nhËn phÇn th­ëng <color=yellow>"..g_szGloryAwardName.."<color>.\n    <color=yellow> ®iÓm t­ c¸ch ®øng top 10 b¶ng xÕp h¹ng m«n ph¸i <color>: ®øng thø nhÊt cã thÓ nhËn ®­îc <color=yellow>100<color> tói, ®øng thø 2, ®øng thø ba cã thÓ nhËn ®­îc <color=yellow>40<color> tói, ®øng thø 4 ®Õn thø 10 cã thÓ nhËn ®­îc <color=yellow>20<color> tói#\n    <color=yellow> ®iÓm t­ c¸ch kh«ng ®øng trong b¶ng xÕp h¹ng <color>: chØ cÇn ®iÓm t­ c¸ch lín h¬n 0, sÏ tÆng <color=yellow>10<color> tói.",g_szInfoHead.."Mçi c¸i "..g_szGloryAwardName.." Cã thÓ më ra vËt phÈm sau:\n4 quyÓn thùc chiÕn t©m ®¾c, 20 ®iÓm cèng hiÕn s­ m«n, 1 tói b¶o th¹ch \n1 tiªu kiÕp t¸n (x¸c suÊt nhÊt ®Þnh nhËn ®­îc, cø më 5 tói nhÊt ®Þnh sÏ ®­îc)\n1 bµn long bÝch (x¸c suÊt nhÊt ®Þnh nhËn ®­îc, cø më 10 tói nhÊt ®Þnh nhËn ®­îc)\n 1 viªn linh th¹ch cÊp 6 (x¸c suÊt nhÊt ®Þnh nhËn ®­îc, cø më 10 tói nhÊt ®Þnh nhËn ®­îc)\n 1 kü n¨ng phèi chÕ linh th¹ch cÊp 7 (x¸c suÊt nhÊt ®Þnh nhËn ®­îc, cø më 10 tói nhÊt ®Þnh nhËn ®­îc)\nNgoµi ra, mçi lÇn më 40 tói sÏ nhËn ®­îc 3 MËt TÞch S­ M«n-Cao, më 100 tói nhËn ®­îc 1 Viªm Hoµng ThiÕt Hån. Ng­êi ch¬i cÊp 99 mçi lÇn më 20 tói sÏ nhËn ®­îc 50 Th¸i DÞch Hçn Nguyªn C«ng §å Gi¸m.");
end
end;

function get_glory_bag_1(nBagNum)
	local nBWLevel,nBWRank = get_rank_before();
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	if nBagNum == 0 then
		Talk(1,"",g_szInfoHead.."§iÓm t­ c¸ch tr­íc ®©y cña b¹n lµ <color=yellow>"..nPoint.."<color>, kh«ng vµo top 10 m«n ph¸i tÝch ®iÓm t­ c¸ch, kh«ng thÓ nhËn th­ëng , kh«ng thÓ nhËn ®­îc "..g_szGloryAwardName..".");
		return 0;
	end;
	if GetTask(TSK_GET_GLORY) == g_nBWAwardDate then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn qua råi "..g_szGloryAwardName.."1 lÇn råi.");
		return 0;
	end;
	local nNum = 0;
	if gf_JudgeRoomWeight(2,nNum,g_szInfoHead) == 0 then
		return 0;
	end;
	if GetTask(TSK_GET_GLORY) ~= g_nBWAwardDate then
		BWDH_SetTask(TSK_GET_GLORY,g_nBWAwardDate);
		AddItem(g_tbGloryAwardItem[1],g_tbGloryAwardItem[2],g_tbGloryAwardItem[3],nBagNum);
		Msg2Player("B¹n nhËn ®­îc "..nBagNum.."c¸i"..g_szGloryAwardName);
		if nBWRank > 0 then
			Msg2Global(GetName().."trong §¹i Héi Tû Vâ thi quý ®­îc ®øng thø "..nBWRank..", nhËn ®­îc råi "..nBagNum.."c¸i"..g_szGloryAwardName..",, ®¸ng mõng ®¸ng mõng !");
		end
		WriteLog("[§¹i héi tû vâ]:"..GetName().."§· nhËn "..nBagNum.." (H¹ng "..nBWRank..", thø)"..g_szGloryAwardName);
	end;
end;

function init_zige_rank()
	if GetTime() - g_bInit < 3600 then
		return 0;
	end;
	local tbRoute = gf_GetRouteTable();
	local nRoute = 0;
	for nLevel=0,1 do
		g_tbZiGeRank[nLevel] = {};
		for i=1,getn(tbRoute) do
			nRoute = tbRoute[i];
			g_tbZiGeRank[nLevel][nRoute] = {};
			DelRelayShareDataCopy("GestConvention_Zige_Last", nLevel, nRoute);
			ApplyRelayShareData("GestConvention_Zige_Last", nLevel, nRoute, g_szThisFile, "init_zige_rank_callback");
		end;
	end;
end;

function init_zige_rank_callback(szKey,nLevel,nRoute,nRecordCount)
	if nRecordCount == 0 then
		return 0;
	end;
	nRecordCount = min(nRecordCount,10);
	local szName,nPoint = "",0;
	for i=1,nRecordCount do
		--·µ»ØÖµ£ºÍæ¼ÒÃû£¬×Ê¸ñ»ý·Ö£¬Á÷ÅÉ£¬µÈ¼¶£¬×ÜÊ¤£¬×Ü¸º£¬ÖÜÊ¤£¬ÖÜ¸º
		szName,nPoint = GetRelayShareDataByIndex(szKey,nLevel,nRoute,i-1);
		g_tbZiGeRank[nLevel][nRoute][szName] = {i,nPoint};
	end;
	g_bInit = GetTime();
end;

function see_rank_before()
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	local _,_,nRankPoint = get_rank_before();	--Èç¹ûÃ»½øÅÅÐÐ°ñ£¬nRankPoint¾ÍÊÇ0
	if nPoint < nRankPoint then
		nPoint = nRankPoint;	--ÒòÎªnPointÓënRankPoint»á²»Ò»ÖÂ£¬ÕâÀï±£Ö¤ÊÇÒÔÅÅÐÐ°ñÀïÃæµÄ·ÖÊýÎª×¼
	end;
	local selTab = {
				--"ÐÂÐãÎäÁÖ´ó»á/#see_rank_before_1(0)",
				" §¹i Héi Tû Vâ ®¬n ®Êu /#see_rank_before_1(1)",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	Say(g_szInfoHead.."§iÓm t­ c¸ch tr­íc ®©y cña b¹n lµ <color=yellow>"..nPoint.."<color>. B¹n muèn xem th«ng tin b¶n xÕp h¹ng t­ c¸ch cña ®¹i héi tû vâ nµo?",getn(selTab),selTab);
end;

function see_rank_before_1(nLevel)
	local tbRoute = gf_GetRouteTable();
	list_route_page(1,getn(tbRoute),nLevel);
end;

MAX_SEL_PER_PAGE = 5;

function list_route_page(nPageNum,nRecordCount,nLevel)
	local tbAllSelTab = get_route_list(nLevel);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbAllSelTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n Trang tr­íc/#list_route_page(%d,%d,%d)",nPageNum-1,nRecordCount,nLevel));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n Trang sau/#list_route_page(%d,%d,%d)",nPageNum+1,nRecordCount,nLevel));
	end;
	tinsert(selTab,"\nQuay l¹i/see_rank_before");
	Say(g_szInfoHead.."<color=yellow>"..TB_BIWU_NAME[nLevel+1].."<color>XÕp h¹ng tÝch lòy t­ c¸ch. H·y chän l­u ph¸i:",getn(selTab),selTab);
end

function get_route_list(nLevel)
	local tSelTab = {};
	local tbRoute = gf_GetRouteTable();
	for i=1,getn(tbRoute) do
		tinsert(tSelTab,gf_GetRouteName(tbRoute[i]).."/#view_route_rank_info("..nLevel..","..tbRoute[i]..")");
	end;
	return tSelTab;
end;

function view_route_rank_info(nLevel,nRoute)
	local tbRankInfo = g_tbZiGeRank[nLevel][nRoute];
	local tbSorted = {};
	local szMsgHead = "<color=yellow>"..TB_BIWU_NAME[nLevel+1].."<color>:<color=green>"..gf_GetRouteName(nRoute).."<color>10 h¹ng ®Çu b¶ng xÕp h¹ng tÝch lòy t­ c¸ch<color>: \n"..gf_FormatStringLength("H¹ng",10)..gf_FormatStringLength("Tªn",20)..gf_FormatStringLength("§iÓm tÝch lòy t­ c¸ch",8).."\n";
	local szMsgBody = "";
	for i,v in tbRankInfo do
		tbSorted[v[1]] = {i,v[2]};
	end;
	local nPlayerNum = getn(tbSorted);
	if nPlayerNum == 0 then
		Talk(1,"#list_route_page(1,"..getn(gf_GetRouteTable())..","..nLevel..")",g_szInfoHead.."L­u ph¸i nµy kh«ng cã th«ng tin xÕp h¹ng.");
		return 0;
	end;
	if nPlayerNum <= 5 then
		for i=1,nPlayerNum do
			szMsgBody = szMsgBody..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		Talk(1,"#list_route_page(1,"..getn(gf_GetRouteTable())..","..nLevel..")",szMsgHead..szMsgBody);
	else
		local szMsgBody2 = "";
		for i=1,5 do
			szMsgBody = szMsgBody..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		for i=6,nPlayerNum do
			szMsgBody2 = szMsgBody2..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		Talk(2,"#list_route_page(1,"..getn(gf_GetRouteTable())..","..nLevel..")",szMsgHead..szMsgBody,szMsgHead..szMsgBody2);
	end;
end;
--·µ»ØÈý²ÎÊý£º¸ßµÍ¼¶£¬ÅÅÃû£¬×Ê¸ñ·Ö
function get_rank_before()
	local nRoute = GetPlayerRoute();
	local szName = GetName();
	local nOldSignUpInfo = GetTask(TSK_OLD_SIGN_UP);
	for i=0,1 do
		local tbRankInfo = nil
		if g_tbZiGeRank[i] and g_tbZiGeRank[i][nRoute] then
			tbRankInfo = g_tbZiGeRank[i][nRoute][szName];
		end
		if tbRankInfo then
			return i,tbRankInfo[1],tbRankInfo[2];
		end;
	end;
	return -1,0,0;
end;

function season_modify_exp(nExp,nCount)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --µÚ¼¸Èü¼¾
	for i=1,nCount do
		ModifyExp(nExp);
		Msg2Player("B¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
	end
	WriteLog(format("[§¹i Héi Tû Vâ thø "..(nCurSeason-1).."thi quý ] [Sucess] [ModifyExp] [role:%s(acc:%s)] [NhËn ®­îc kinh nghiÖm %d]", GetName(), GetAccount(), nExp*nCount));
end

function season_award_title(nRank)
	local szTitleName = {
		[1] = "§¹i S­ Tû",
        [2] = "NhÞ S­ Tû",
        [3] = "Tam S­ Tû",
        [11] = "§¹i S­ Huynh",
        [12] = "NhÞ S­ Huynh",
        [13] = "Tam S­ Huynh",
	}
	local nSex = mod(GetSex(),2)
	local nG = 67
	local nDetal = 10*nSex + nRank
	local szName = szTitleName[nDetal] or ""
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --µÚ¼¸Èü¼¾
	for i=1,13 do
		RemoveTitle(nG,i);
	end
	if IsTitleExist(nG,nDetal) <= 0 then
		if AddTitle(nG,nDetal) > 0 then
			SetTitleTime(nG,nDetal, GetTime() + g_nBWWeeks*7*24*3600);
			SetCurTitle(nG,nDetal)
			Msg2Player("B¹n nhËn ®­îc ["..szName.."] danh hiÖu");
			WriteLog("[§¹i Héi Tû Vâ thø "..(nCurSeason-1).."thi quý ]:"..GetName().." nhËn ®­îc ["..szName.."] danh hiÖu");
		end
	end
end

function season_add_title(nID1,nID2,sName)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --µÚ¼¸Èü¼¾
	for i=2,5 do
		RemoveTitle(5,i);
	end
	if IsTitleExist(nID1,nID2) <= 0 then
		if AddTitle(nID1,nID2) > 0 then
			SetTitleTime(nID1,nID2, GetTime() + g_nBWWeeks*7*24*3600);
			SetCurTitle(nID1,nID2)
			Msg2Player("B¹n nhËn ®­îc ["..sName.."] danh hiÖu");
			WriteLog("[§¹i Héi Tû Vâ thø "..(nCurSeason-1).."thi quý ]:"..GetName().." nhËn ®­îc ["..sName.."] danh hiÖu");
		end
	end
end

tGJJingQi = {
	{{"ThiÕu L©m Tinh Kú (Kh«i Thñ)",{0,120,42,1}},{"ThiÕu L©m Tinh Kú (KiÒu Së)",{0,120,43,1}},{"ThiÕu L©m Tinh Kú (Anh KiÖt)",{0,120,44,1}},},
	{{"Vâ §ang Tinh Kú (Kh«i Thñ)",{0,120,54,1}},{"Vâ §ang Tinh Kú (KiÒu Së)",{0,120,55,1}},{"Vâ §ang Tinh Kú (Anh KiÖt)",{0,120,56,1}},},
	{{"Nga My Tinh Kú (Kh«i Thñ)",{0,120,48,1}},{"Nga My Tinh Kú (KiÒu Së)",{0,120,49,1}},{"Nga My Tinh Kú (Anh KiÖt)",{0,120,50,1}},},
	{{"C¸i Bang Tinh Kú (Kh«i Thñ)",{0,120,51,1}},{"C¸i Bang Tinh Kú (KiÒu Së)",{0,120,52,1}},{"C¸i Bang Tinh Kú (Anh KiÖt)",{0,120,53,1}},},
	{{"§­êng M«n Tinh Kú (Kh«i Thñ)",{0,120,45,1}},{"§­êng M«n Tinh Kú (KiÒu Së)",{0,120,46,1}},{"§­êng M«n Tinh Kú (Anh KiÖt)",{0,120,47,1}},},
	{{"D­¬ng M«n Tinh Kú (Kh«i Thñ)",{0,120,57,1}},{"D­¬ng M«n Tinh Kú (KiÒu Së)",{0,120,58,1}},{"D­¬ng M«n Tinh Kú (Anh KiÖt)",{0,120,59,1}},},
	{{"Ngò §éc Tinh Kú (Kh«i Thñ)",{0,120,60,1}},{"Ngò §éc Tinh Kú (KiÒu Së)",{0,120,61,1}},{"Ngò §éc Tinh Kú (Anh KiÖt)",{0,120,62,1}},},
	{{"C«n L«n Tinh Kú (Kh«i Thñ)",{0,120,63,1}},{"C«n L«n Tinh Kú (KiÒu Së)",{0,120,64,1}},{"C«n L«n Tinh Kú (Anh KiÖt)",{0,120,65,1}},},
	{{"Minh gi¸o Tinh Kú (Kh«i Thñ)",{0,120,66,1}},{"Minh gi¸o Tinh Kú (KiÒu Së)",{0,120,67,1}},{"Minh gi¸o Tinh Kú (Anh KiÖt)",{0,120,68,1}},},
	{{"Thóy Yªn Tinh Kú (Kh«i Thñ)",{0,120,69,1}},{"Thóy Yªn Tinh Kú (KiÒu Së)",{0,120,70,1}},{"Thóy Yªn Tinh Kú (Anh KiÖt)",{0,120,71,1}},},
}

function season_add_guajian(nType)
	local nFaction = GetPlayerFaction();
	gf_SetLogCaption("PhÇn th­ëng §¹i Héi Tû Vâ ®¬n ®Êu thi quý ");
	local nRet,nIndex = gf_AddItemEx(tGJJingQi[nFaction][nType][2],tGJJingQi[nFaction][nType][1]);
	if nRet == 1 then
		SetItemExpireTime(nIndex,g_nBWWeeks*7*24*3600);
	end
	gf_SetLogCaption("");
end

tSeasonAward = {
	{
		{"1 tû ®iÓm kinh nghiÖm","season_modify_exp(10*10000*10000,1)"},
		{"10 R­¬ng Phong Th­ëng S­ M«n","gf_AddItemEx({2,1,30693,10},'R­¬ng Phong Th­ëng S­ M«n')"},
		{"Danh hiÖu xÕp h¹ng tû vâ","season_award_title(1)"},
		
--		{"Ç§Àï×··ç(ºì)","gf_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ç§Àï×··ç(ºì)')"},
--		{"±³²¿¹Ò¼þ£ºìºÆì(¿ýÊ×)£¨³ÖÐø3¸öÔÂ£©","season_add_guajian(1)"},
--		{"ÐÂ±ÈÎä´ó»áÈü¼¾°ü40¸ö","gf_AddItemEx({2,95,820,40,1},'ÐÂ±ÈÎä´ó»áÈü¼¾°ü')"},
--		{"³ÆºÅ£º¾ÅÖÝÎäÉñ£¨Òþ²ØÓÐÐ§£©","season_add_title(5,2,'¾ÅÖÝÎäÉñ')"},
	},
	{
		{"500 triÖu ®iÓm kinh nghiÖm","season_modify_exp(5*10000*10000,1)"},
		{"5 R­¬ng Phong Th­ëng S­ M«n","gf_AddItemEx({2,1,30693,5},'R­¬ng Phong Th­ëng S­ M«n')"},
		{"Danh hiÖu xÕp h¹ng tû vâ","season_award_title(2)"},
--		{"Ç§Àï×··ç(ºì)","gf_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ç§Àï×··ç(ºì)')"},
--		{"±³²¿¹Ò¼þ£ºìºÆì(ÇÌ³þ)£¨³ÖÐø3¸öÔÂ£©","season_add_guajian(2)"},
--		{"ÐÂ±ÈÎä´ó»áÈü¼¾°ü40¸ö","gf_AddItemEx({2,95,820,40,1},'ÐÂ±ÈÎä´ó»áÈü¼¾°ü')"},
--		{"³ÆºÅ£º¾ÅÖÝÎäÊ¥£¨Òþ²ØÓÐÐ§£©","season_add_title(5,3,'¾ÅÖÝÎäÊ¥')"},
	},
	{
		{"300 triÖu ®iÓm kinh nghiÖm","season_modify_exp(3*10000*10000,1)"},
		{"3 R­¬ng Phong Th­ëng S­ M«n","gf_AddItemEx({2,1,30693,3},'R­¬ng Phong Th­ëng S­ M«n')"},
		{"Danh hiÖu xÕp h¹ng tû vâ","season_award_title(3)"},
--		{"±³²¿¹Ò¼þ£ºìºÆì(Ó¢½Ü)£¨³ÖÐø3¸öÔÂ£©","season_add_guajian(3)"},
--		{"ÐÂ±ÈÎä´ó»áÈü¼¾°ü40¸ö","gf_AddItemEx({2,95,820,40,1},'ÐÂ±ÈÎä´ó»áÈü¼¾°ü')"},
--		{"³ÆºÅ£º¾ÅÖÝÎä¿ñ£¨Òþ²ØÓÐÐ§£©","season_add_title(5,4,'¾ÅÖÝÎä¿ñ')"},
	},
	{
		{"200 triÖu ®iÓm kinh nghiÖm","season_modify_exp(2*10000*10000,1)"},
		{"2 R­¬ng Phong Th­ëng S­ M«n","gf_AddItemEx({2,1,30693,2},'R­¬ng Phong Th­ëng S­ M«n')"},
--		{"ÐÂ±ÈÎä´ó»áÈü¼¾°ü40¸ö","gf_AddItemEx({2,95,820,40,1},'ÐÂ±ÈÎä´ó»áÈü¼¾°ü')"},
--		{"³ÆºÅ£º¾ÅÖÝÎäÏÀ£¨Òþ²ØÓÐÐ§£©","season_add_title(5,5,'¾ÅÖÝÎäÏÀ')"},
	},
	{
		{"100 triÖu ®iÓm kinh nghiÖm","season_modify_exp(1*10000*10000,1)"},
		{"1 R­¬ng Phong Th­ëng S­ M«n","gf_AddItemEx({2,1,30693,1},'R­¬ng Phong Th­ëng S­ M«n')"},
--		{"ÐÂ±ÈÎä´ó»áÈü¼¾°ü20¸ö","gf_AddItemEx({2,95,820,20,1},'ÐÂ±ÈÎä´ó»áÈü¼¾°ü')"},
	},
};

function season_award()
	local strtab = {
		"H­íng dÉn thi quý /season_detail",
		"KiÓm tra phÇn th­ëng thi quý /season_see_award",
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing"
	};
--if _JX2WZ == 2 then
--	tinsert(strtab, 2, "¸ü»»½±ÀøÖÐµÄ·Ç·¨ÎïÆ·/repairItem");
--end
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --µÚ¼¸Èü¼¾
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --µ±Ç°Èü¼¾µÄµÚ¼¸ÖÜ
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	if nCurSeason > 1 then
		tinsert(strtab,3,"NhËn phÇn th­ëng thi quý tr­íc (Ngµy kÕt thóc: tr­íc khi thi quý nµy kÕt thóc)/season_get_award");
	end
	Say(g_szInfoHead.."B¹n muèn t×m hiÓu th«ng tin nµo ? ",
	getn(strtab),
	strtab);
end

function season_detail()
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --µÚ¼¸Èü¼¾
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --µ±Ç°Èü¼¾µÄµÚ¼¸ÖÜ
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	Talk(1,"season_award",g_szInfoHead.."Tõ ngµy 12 th¸ng 5 n¨m 2014 b¾t ®Çu §¹i Héi Tû Vâ <color=yellow> mçi"..g_nBWWeeks.." tuÇn lµ mét thi quý<color>, tr­íc khi kÕt thóc cuéc thi quý tiÕp theo dùa vµo sè ®iÓm t­ c¸ch kú thi quý lÇn tr­íc nhËn ®­îc phÇn th­ëng thi quý tr­íc, ®iÓm t­ c¸ch cø mçi tuÇn dùa vµo tÝch ®iÓm hÖ ph¸i xÕp h¹ng, tõ 1-10 cã thÓ nhËn ®­îc 100, 90, 85, 80, 75, 70, 65, 60, 55, 50 ®iÓm. HiÖn t¹i ®ang tiÕn hµnh <color=yellow>kú"..nCurSeason.."Thi quý tuÇn thø "..nSeasonWeek.."<color> tû vâ, phÇn th­ëng thi quý tr­íc vµo sau 10h mçi ngµy tr­íc khi thi quý nµy kÕt thóc ®Òu cã thÓ nhËn th­ëng, qu¸ h¹n kh«ng ph¸t bï!");
end

function season_see_award()
	local strtab = {
		"Gi¶i 1 (®iÓm t­ c¸ch kú thi quý tr­íc 370-400)/#season_see_award_detail(1)",
		"Gi¶i 2  (®iÓm t­ c¸ch kú thi quý tr­íc 330-369)/#season_see_award_detail(2)",
		"Gi¶i 3  (®iÓm t­ c¸ch kú thi quý tr­íc 270-329)/#season_see_award_detail(3)",
		"Gi¶i 4  (®iÓm t­ c¸ch kú thi quý tr­íc 200-269)/#season_see_award_detail(4)",
		"Gi¶i khuyÕn khÝch (®iÓm t­ c¸ch kú thi quý tr­íc 100-199)/#season_see_award_detail(5)",
		"trë l¹i/season_award",
		"KÕt thóc ®èi tho¹i/nothing",
	}
	Say(g_szInfoHead.."Mçi role mçi kú thi quý chØ nhËn ®­îc mét lÇn th­ëng.",
	getn(strtab),
	strtab);
end

function season_see_award_detail(nType)
	local stalk = "";
	for i = 1,getn(tSeasonAward[nType]) do
		stalk = stalk.."\n    "..tSeasonAward[nType][i][1];
	end
	Talk(1,"season_see_award",g_szInfoHead..stalk);
end

function season_get_award()
	local nDate = tonumber(date("%Y%m%d"))
--	if nDate >= 20110131 and nDate <= 20110213 then
--		Talk(1,"",g_szInfoHead.."´º½ÚÆÚ¼äÔÝÍ£±ÈÎä´ó»áÈü¼¾·¢½±£¬ÉÏÈü¼¾±ÈÎä´ó»á·¢½±ÑÓÆÚµ½2ÔÂ14ÈÕ·¢·Å£¬±¾Èü¼¾±ÈÎä´ó»áÕÕ³£½øÐÐ¡£¸øÄú´øÀ´µÄ²»±ãÇëÄúÁÂ½â¡£");
--		return 0;
--	end
	local nHour = tonumber(date("%H"));
	if nHour < 10 then
		Talk(1,"",g_szInfoHead.."Mêi c¸c b¹n ®Õn nhËn th­ëng vµo sau 10h s¸ng.");
		return 0;
	end
	local szName = GetName();
	local nRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."B¹n vÉn ch­a nhËp m«n ph¸i, kh«ng cã t­ c¸ch nhËn phÇn th­ëng thi quý tr­íc.");
		return 0;
	end;
	local tbRankInfo = {{370/4*g_nBWWeeks,"Gi¶i 1"},{330/4*g_nBWWeeks,"Gi¶i 2"},{270/4*g_nBWWeeks,"Gi¶i 3"},{200/4*g_nBWWeeks,"Gi¶i 4"},{100/4*g_nBWWeeks,"Gi¶i khuyÕn khÝch"}};
	local nType = 0;
	local szMsg = "";
	local nBWLevel,nBWRank,nRankPoint = get_rank_before();--Èç¹ûÃ»½øÅÅÐÐ°ñ£¬nRankPoint¾ÍÊÇ0
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	if nPoint < nRankPoint then
		nPoint = nRankPoint;	--ÒòÎªnPointÓënRankPoint»á²»Ò»ÖÂ£¬ÕâÀï±£Ö¤ÊÇÒÔÅÅÐÐ°ñÀïÃæµÄ·ÖÊýÎª×¼
	end;
	for i=1,getn(tbRankInfo) do
		if nPoint >= tbRankInfo[i][1] then
			nType = i;
			break;
		end
	end;
	if nPoint > 400 or nPoint < 100/4*g_nBWWeeks then
		Talk(1,"",g_szInfoHead.."§iÓm t­ c¸ch cña ng­¬i trong §¹i Héi Tû Vâ quý tr­íc kh«ng ®ñ 100 ®iÓm, kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.Kú thi quý nµy tiÕp tôc cè g¾ng.");
		return 0;
	end
	BWDH_SetTask(TSK_SEASON_ZIGE_LAST,nPoint);
	local selTab = {
				"Ta muèn nhËn!/#season_confirm_award("..nType..")",
--				"±ÈÎä´ó»áÈü¼¾°üËµÃ÷/season_bag_detail",
				"T¹m thêi kh«ng nhËn/nothing",
				}
	Say(g_szInfoHead.."Trong §¹i Héi Tû Vâ kú thi quý tr­íc ®iÓm t­ c¸ch lµ:<color=yellow>"..nPoint.."<color>, nhËn ®­îc <color=yellow>"..tbRankInfo[nType][2].."<color>, b¹n cã nhËn th­ëng b©y giê kh«ng ? Mçi kú thi quý mçi nh©n vËt chØ ®­îc nhËn th­ëng mét lÇn. ",
	getn(selTab),
	selTab);
end

function season_confirm_award(nType)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --µÚ¼¸Èü¼¾
	if GetTask(TSK_SEASON_GET_AWARD) >= nCurSeason then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn phÇn th­ëng kú thi quý tr­íc.");
		return 0;
	end
	if gf_Judge_Room_Weight(3,200,g_szInfoHead) ~= 1 then
		return 0;
	end
	BWDH_SetTask(TSK_SEASON_GET_AWARD,nCurSeason);
	gf_SetLogCaption("§¹i Héi Tû Vâ thi quý thø "..(nCurSeason-1)..".");
	for i=1,getn(tSeasonAward[nType]) do
		dostring(tSeasonAward[nType][i][2]);
	end
	AddRuntimeStat(20, 3, nType - 1, 1) --Í³¼Æ
	local tStat = {10, 5, 3, 2, 1}
	AddRuntimeStat(20, 6, 0, tStat[nType]) --Ê¦ÃÅ·âÉÍ±¦Ïä²ú³öÊýÁ¿
	gf_SetLogCaption("");
	local tbRankInfo = {"Gi¶i 1","Gi¶i 2","Gi¶i 3","Gi¶i 4","Gi¶i khuyÕn khÝch"};
	Msg2Global("§¹i hiÖp"..GetName().."NhËn ®¹i héi tû thÝ kú thi quý tr­íc "..tbRankInfo[nType].."!");
	WriteLog(format("[§¹i Héi Tû Vâ thø %d thi quý ] [Sucess][role:%s(acc:%s)] [ NhËn ®¹i héi tû thÝ kú thi quý tr­íc %s!]",(nCurSeason-1), GetName(), GetAccount(), tbRankInfo[nType]));
end

function repairItem(bSure)
	if not bSure then
		local tSel = {
			"§ång ý/#repairItem(1)",
			"trë l¹i/season_award",
		}
		Say(g_szInfoHead.."Trong phÇn th­ëng §¹i Héi Tû Vâ lÇn nµy më tói thi quý §¹i Héi Tû Vâ nhËn ®­îc vËt phÈm phi ph¸p, h·y ®Ó vËt phÈm phi ph¸p nµy vµo trong tói, click x¸c nhËn, ®æi nã thµnh tô nghÜa lÖnh tói lín (chØ cã hiÖu qu¶ khi më vËt phÈm phi ph¸p trong tói kú thi quý §¹i Héi Tû Vâ lÇn nµy)",
			getn(tSel), tSel);
		return
	end

	local nCount = GetItemCount(2,1,3356);
	if nCount <= 0 then
		Talk(1, "", "Trªn ng­êi b¹n kh«ng cã ®¹o cô phi ph¸p ");
		return
	end
	DelItem(2,1,3356, nCount);
	AddItem(2,95,211, nCount);
end

--´«ËÍÖÁ¿ç·þ±ÈÎä³¡µØ
function GLB_BW_Goto_Field(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		local tBlockRoute	= GLB_BW_Get_Block_Route();
		local szInfo		= "B¹n sÏ vµo tû vâ liªn server ,";

		if getn(tBlockRoute) > MAXNUM_BLOCK_ROUTE then
			BWDH_SetTask(TASKID_BIWU_BLOCK_ROUTE, 0);
			tBlockRoute = {};
		end

		if 0 < getn(tBlockRoute) then
			if 1 == getn(tBlockRoute) then
				szInfo = szInfo .."DÞch vô trÞ gia t¨ng lÇn nµy chän ®ãng 1 m«n ph¸i, lµ:";
			else
				szInfo = szInfo .. format("DÞch vô trÞ gia t¨ng lÇn nµy chän ®ãng %d m«n ph¸i, lµ:", getn(tBlockRoute));
			end

			for _, nRoute in tBlockRoute do
				szInfo = szInfo .. gf_GetRouteName(nRoute) .. ", ";
			end

			szInfo = strsub(szInfo, 1, strlen(szInfo) - 2) .. ".";
			szInfo = szInfo .. format("Cø vµo 1 trËn §¹i Héi Tû Vâ liªn server sÏ bÞ trõ %d <color=yellow>Tiªu Dao Ngäc <color>.", TB_BW_BLOCK_ROUTE_COST[getn(tBlockRoute)]);
		else
			szInfo = szInfo .."DÞch vô trÞ gia t¨ng lÇn nµy chän ®ãng 0 m«n ph¸i.";
		end

		--szInfo = szInfo .. format("ÉÙÏÀÏÖÔÚÓµÓÐåÐÒ£±Ò%dÃ¶£¬åÐÒ£Óñ%dÃ¶¡£È·ÈÏÒªÇ°Íù¿ç·þ±ÈÎäÃ´£¿", GetXYB(), GetXYY());

		local strtab = {
			"Ta ®· chuÈn bÞ xong!			/#GLB_BW_Goto_Field(1)",
			--"ÎÒÒªÐÞ¸ÄÎÒµÄÔöÖµ·þÎñÏî	/GLB_BW_Services_Set",
			"trë l¹i/main",
			"KÕt thóc ®èi tho¹i/nothing",
		};
		Say(g_szInfoHead.."Cã thÓ gióp g× ®­îc b¹n ?",
		getn(strtab),
		strtab)

		return
	end

	if GetTask(TSK_SIGN_UP) ~= 2 then
		resetBiwuTV();
	end
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."Xin lçi, ng­¬i ph¶i gia nhËp m«n ph¸i míi cã thÓ ®¨ng ký tham gia.");
		return 0;
	end;
--	if GetLevel() < 80 then
--		Talk(1,"",g_szInfoHead.."ÄúµÄµÈ¼¶²»×ã80¼¶£¬»¹ÊÇÔÚ½­ºþÖÐ¶àÀúÁ·Ð©°É¡£");
--		return 0;
--	end
	if BWT_CheckBiWuTime() ~= 1 then
		Talk(1,"",g_szInfoHead..format("HiÖn nay kh«ng ph¶i thêi gian cuéc dù tuyÓn cña ®¹i héi tû vâ toµn quèc, xin ®¹i hiÖp mçi ngµy trong %s ®Õn ®©y.", "20:00-22:00"));
		return 0;
	end
--	if GetXYB() <= 0 then
--		Talk(1,"",g_szInfoHead.."ÉÙÏÀÄ¿Ç°Ã»ÓÐåÐÒ£±Ò£¬¿ÉÄÜÔÚ³¡µØÖÐÎÞ·¨¹ºÂòÒ©Æ·Ê¹ÓÃ¡£");
--		return 0;
--	end
	if gf_JudgeRoomWeight(15,100,"") == 0 then
		return 0;
	end;
	if GetPKValue() >= 10 then
		Talk(1,"",g_szInfoHead.."S¸t ý cña ng­¬i qu¸ cao ( PK>=10), kh«ng thÓ ®i vµo §¹i Héi TØ Vâ.");
		return 0;		
	end
	
	if 1 == _check_to_kuafu_condition() then
		SetTask(TASKID_EXCHG_SVR_TAG, 1, TASK_ACCESS_CODE_EXGSVR);
		BWT_WeeklyClear();
		--BWDH_SetTask(TASKID_BIWU_IS_REALM,1);
		local nDirection = random(1,getn(TB_EXIT));
		BWDH_Change_Map(7100,TB_EXIT[nDirection][2],TB_EXIT[nDirection][3]) --1399,2847
	else
		return 0;
	end
	
	--cdkey»î¶¯
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(1)");	
end

function GLB_BW_Change_Xoyo_Gold()
	local strtab = {
		"Dïng vµng ®æi Xu Tiªu Dao (1 vµng ®æi 100 Xu Tiªu Dao)/GLB_BW_Use_JXB",
--		"Ê¹ÓÃÒ©Æ·¶Ò»»åÐÒ£±Ò/GLB_BW_Use_Medicine",
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing",
	};
	Say(g_szInfoHead.."Sau khi v­ît server ngoµi <color=yellow>Xu Tiªu Dao<color> ra nh÷ng tiÒn tÖ kh¸c ®Òu kh«ng thÓ sö dông, ta cã thÓ gióp chuyÓn <color=yellow>vµng<color> thµnh Xu Tiªu Dao. ThiÕu hiÖp hiÖn ®ang së h÷u "..GetXYB().." Xu Tiªu Dao, vÒ sau cã thÓ kiÓm trang th«ng qua giao diÖn F2 (cã thÓ lµ sè ©m)",
		getn(strtab),
		strtab)
end

function GLB_BW_Change_Xoyo_Yu()
	local strtab = {
		"Sö dông Hßa ThÞ BÝch ®æi Tiªu Dao Ngäc (1 Hßa ThÞ BÝch ®æi 100 Tiªu Dao Ngäc)/GLB_BW_Use_HSB",
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing",
	};
	Say(g_szInfoHead.."Tû vâ liªn server ®­a ra dÞch vô trÞ gia t¨ng míi nhÊt, thiÕt kÕ nh÷ng h¹ng môc dÞch vô trÞ gia t¨ng mµ b¹n cÇn, khi tû vâ liªn server sÏ tËn h­ëng ®­îc cµng nhiÒu c¸i míi. Cø vµo mét trËn thi ®Êu cã ®em theo phôc vô n¹p thªm tiÒn sÏ bÞ trõ mét sè l­îng nhÊt ®Þnh <color=yellow>Tiªu Dao Ngäc<color> (Sè l­îng tiªu hao tïy theo lo¹i dÞch vô mµ quyÕt ®Þnh), t¹i ®©y cã thÓ dïng <color=yellow>Hßa ThÞ BÝch<color> ®æi thµnh <color=yellow>Tiªu Dao Ngäc<color>. ThiÕu hiÖp hiÖn cã "..GetXYB().." Xu Tiªu Dao, <color=yellow>Tiªu Dao Ngäc<color> "..GetXYY().." xu, cã thÓ sö dông phÝm F2 ®Ó kiÓm tra. (cã thÓ cã gi¸ trÞ ©m)",
	getn(strtab),
	strtab)
end

function GLB_BW_Use_JXB()
	local nJxb = floor(GetCash()/10000);
	AskClientForNumber("GLB_BW_Use_JXB_Confirm",1,nJxb*100,"§«i bao nhiªu Xu Tiªu Dao?");
end

function GLB_BW_Use_HSB()
	local nHsb = GetItemCount(2,1,1001);
	AskClientForNumber("GLB_BW_Use_HSB_Confirm",1,nHsb,"§æi bao nhiªu Hßa ThÞ BÝch ?");
end

function GLB_BW_Use_JXB_Confirm(nCount)
	local nJxb = floor(GetCash()/10000);
	if nJxb < nCount/100 then
		Talk(1,"",g_szInfoHead.."TiÒn vµng c¸c h¹ mang theo kh«ng ®ñ"..nCount.."Xu Tiªu Dao.");
		return 0;
	end
	if Pay(nCount/100*10000) == 1 then
		EarnXYB(nCount);
--		Msg2Player("Äã»ñµÃ"..nCount.."åÐÒ£±Ò¡£");
	end
end

function GLB_BW_Use_HSB_Confirm(nCount)
	local nHsb = GetItemCount(2,1,1001);
	if nHsb < nCount then
		Talk(1,"",g_szInfoHead.."Trªn ng­êi b¹n cã ®ñ <color=yellow> Hßa ThÞ BÝch kh«ng<color>.");
		return 0;
	end
	if DelItem(2,1,1001,nCount) == 1 then
		EarnXYY(nCount*100);
--		Msg2Player("Äã»ñµÃ"..nCount.."<color=yellow>åÐÒ£Óñ<color>¡£");
	end
end

tMedicineInfo = {
	{{"B¹ch V©n t¸n",1,0,4},7},
	{{"§¹i Hoµn ®¬n",1,0,9},7},
	{{"Ngäc Linh t¸n",1,0,14},10},
	{{"Thiªn H­¬ng CÈm Tôc",1,0,5},9},
	{{"NhÊt Nguyªn Phôc Thñy §¬n",1,0,10},9},
	{{"H¾c Ngäc §o¹n Tôc Cao",1,0,6},10},
	{{"V¹n VËt Quy Nguyªn §¬n",1,0,11},10},
	{{"Ngò Hoa Ngäc Lé Hoµn",1,0,15},10},
	{{"Sinh Sinh Hãa T¸n",1,0,16},15},
};
g_MaxChangeXYB = 7000000;

function GLB_BW_Use_Medicine()
	local strtab = {};
	for i = 1,getn(tMedicineInfo) do
		tinsert(strtab,format("Sö dông %s ®æi Xu Tiªu Dao (tû lÖ ®æi:1:%d)/#GLB_BW_Use_Medicine_Ask(%d)",tMedicineInfo[1][1][1],tMedicineInfo[1][2],i))
	end
	tinsert(strtab,"KÕt thóc ®èi tho¹i/nothing")
	Say(g_szInfoHead.."B¹n cÇn dïng vËt phÈm g× ®Ó ®æi Tiªu Dao Xu?",
		getn(strtab),
		strtab)
end

function GLB_BW_Use_Medicine_Ask(nIdx)
	local nCount = GetItemCount(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4]);
	if nCount < 1 then
		Talk(1,"",g_szInfoHead.."Trªn ng­êi b¹n kh«ng cã "..tMedicineInfo[nIdx][1][1]);
		return 0;
	end
	SetTaskTemp(206,nIdx);
	local nCurXyb = GetXYB();
	nCount = min(nCount,floor((g_MaxChangeXYB-nCurXyb)/tMedicineInfo[nIdx][2]));
	if nCount <= 0 then
		Talk(1,"",g_szInfoHead.."Cã Tiªu Dao xu lín nhÊt lµ:"..g_MaxChangeXYB..", b¹n ®· ®¹n ®Õn møc giíi h¹n, kh«ng thÓ ®æi thªm n÷a.");
		return 0;
	end
	AskClientForNumber("GLB_BW_Use_Medicine_Confirm",1,nCount,"§æi bao nhiªu c¸i "..tMedicineInfo[nIdx][1][1]);
end

function GLB_BW_Use_Medicine_Confirm(nCount)
	local nIdx = GetTaskTemp(206);
	if GetItemCount(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4]) < nCount then
		Talk(1,"",g_szInfoHead.."Trªn ng­êi b¹n "..tMedicineInfo[nIdx][1][1].."Kh«ng ®ñ"..nCount..".");
		return 0;
	end
	if DelItem(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4],nCount) == 1 then
		EarnXYB(nCount*tMedicineInfo[nIdx][2]);
	end
end

function GLB_BW_Services_Set()
	local strtab = {
		"T«i muèn chÆn ®èi thñ m«n ph¸i (nhiÒu nhÊt cã thÓ chÆn 5 m«n ph¸i)	/GLB_BW_Block_Route_Set",
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing",
	};
	Say(g_szInfoHead.."Tû vâ liªn server ®­a ra phôc vô n¹p thªm tiÒn phong phó ®a d¹ng míi nhÊt, trong server cã thiÕt kÕ c¸c môc phôc vô cÇn n¹p thªm tiÒn mµ b¹n cÇn , khi tû vâ liªn server sÏ h­ëng thñ ®­îc nhiÒu tr¸i nghiÖm míi. Cø vµo mét trËn  tû vâ cã ®em theo phôc vô n¹p thªm tiÒn ®Òu bÞ trõ mét sè l­îng nhÊt ®Þnh <color=yellow>Tiªu Dao Ngäc<color> (L­îng tiªu hao c¨n cø vµo lo¹i h×nh phôc vô ®Þnh ra mµ cã sù kh¸c nhau). Khi <color=yellow>Tiªu Dao Ngäc<color> lµ 0 hoÆc Ýt h¬n, hÖ thèng sÏ dõng viÖc b¾t cÆp tû vâ cho ng­êi ch¬i, ®ång thêi nh¾c nhë ng­êi ch¬i quay vÒ server ®Ó söa h¹ng môc dÞch vô trÞ gia t¨ng. §Ó ®¶m b¶o b¹n cã thÓ tr¶i nghiÖm tèt h¬n th× tr­íc khi vµo tû vâ liªn server, b¹n h·y ®æi ®ñ sè l­îng <color=yellow>Tiªu Dao Ngäc<color>.",
	getn(strtab),
	strtab)
end

function GLB_BW_Block_Route_Set()
	local tBlockRoute	= GLB_BW_Get_Block_Route();
	local szBlockInfo	= "";

	if getn(tBlockRoute) > MAXNUM_BLOCK_ROUTE then
		BWDH_SetTask(TASKID_BIWU_BLOCK_ROUTE, 0);
		tBlockRoute = {};
	end

	if 0 < getn(tBlockRoute) then
		if 1 == getn(tBlockRoute) then
			szBlockInfo = szBlockInfo .."B¹n ®· chÆn 1 mét m«n ph¸i, lµ:";
		else
			szBlockInfo = szBlockInfo .. format("B¹n ®· chÆn %d m«n ph¸i, lµ:", getn(tBlockRoute));
		end

		for _, nRoute in tBlockRoute do
			szBlockInfo = szBlockInfo .. gf_GetRouteName(nRoute) .. ", ";
		end

		szBlockInfo = strsub(szBlockInfo, 1, strlen(szBlockInfo) - 2) .. ".";
		szBlockInfo = szBlockInfo .. format("B¹n cø vµo 1 trËn §¹i Héi Tû Vâ liªn server sÏ bÞ trõ %d <color=yellow>Tiªu Dao Ngäc<color>. Khi <color=yellow>Tiªu Dao Ngäc<color> lµ 0 hoÆc Ýt h¬n, hÖ thèng sÏ ngõng tiÕn hµnh phèi ®éi tû vâ liªn server cho ng­êi ch¬i, vµ nh¾c ng­êi ch¬i quay vÒ server cña m×nh ®Ó söa h¹ng môc dÞch vô trÞ gia t¨ng.", TB_BW_BLOCK_ROUTE_COST[getn(tBlockRoute)]);
	end

	local strtab = {
		"§· xãa m«n ph¸i ®­îc chän lùa 	/#BWDH_SetTask(TASKID_BIWU_BLOCK_ROUTE, 0);",
		"T¨ng thªm m«n ph¸i chÆn míi 	/GLB_BW_Block_Route_Add_Set",
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing",
	};
	Say(g_szInfoHead.."ChÆn m«n ph¸i nhÊt ®Þnh cã thÓ tr¸nh tr­êng hîp b¹n trong §¹i Héi Tû Vâ gÆp ph¶i m«n ph¸i nµy. NhiÒu nhÊt b¹n cã thÓ chÆn <color=yellow>"..MAXNUM_BLOCK_ROUTE.."<color> kh«ng cïng m«n ph¸i."..szBlockInfo,
	getn(strtab),
	strtab)
end

function GLB_BW_Block_Route_Add_Set()
	local tSay = {};
	tSay.sel = {
		{"trë l¹i",	"main"},
		{"KÕt thóc ®èi tho¹i",	"nothing"},
	};

	local tBlockRoute	= GLB_BW_Get_Block_Route();

	if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
		tSay.msg = g_szInfoHead.."B¹n ®· chÆn "..getn(tBlockRoute).." mét m«n ph¸i, kh«ng thÓ chÆn n÷a.";
		temp_Talk(tSay);
		return
	end
	
--	tinsert(tBlockRoute, GetPlayerRoute());

--	tBlockRoute.n = nil;
--	for _, nRoute in tBlockRoute do
--		if tRouteName[nRoute] then
--			tRouteName[nRoute] = nil;
--		end
--	end

	local tbRoute = gf_GetRouteTable();
	for k, v in tbRoute do
		if GetPlayerRoute() ~= v then
			tinsert(tSay.sel, 1, {tRouteName[v], format("#GLB_BW_Block_Route_Add(%d)", k)});
		end
	end

	tSay.msg = g_szInfoHead.."Chän m«n ph¸i b¹n muèn chÆn, b¹n kh«ng thÓ chÆn m«n ph¸i cña chÝnh m×nh.";
	temp_Talk(tSay);
end

function GLB_BW_Block_Route_Add(nRouteIdx)
	local strtab = {
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing",
	};

	local tbRoute = gf_GetRouteTable();
	local tBlockRoute	= GLB_BW_Get_Block_Route();

	if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
		Say(g_szInfoHead.."B¹n ®· chÆn "..getn(tBlockRoute).." mét m«n ph¸i, kh«ng thÓ chÆn n÷a.",
		getn(strtab),
		strtab)
		return
	end

	if tbRoute[nRouteIdx] == GetPlayerRoute() then
		Say(g_szInfoHead.."B¹n kh«ng thÓ chÆn m«n ph¸i cña chÝnh m×nh.",
		getn(strtab),
		strtab)
		return
	end
	
	gf_SetTaskBit(TASKID_BIWU_BLOCK_ROUTE, nRouteIdx, 1);

	tinsert(strtab, 1, "TiÕp tôc chÆn  /GLB_BW_Block_Route_Add_Set");
	Say(g_szInfoHead.."B¹n ®· chÆn thµnh c«ng "..gf_GetRouteName(tbRoute[nRouteIdx])..".",
	getn(strtab),
	strtab)
end

function bw_buchang()
	Say(g_szInfoHead.."C¨n cø vµo th«ng b¸o cña quèc vô viÖn ngµy 15 th¸ng 8 n¨m 2010 lµ ngµy c¶ n­íc t­ëng nhí. Trong thêi gian nµy, ®Ó t­ëng nhí ®Õn nh÷ng ®ång bµo gÆp n¹n nói në ë Ch©u Khóc Cam Tóc, server nghØ mét ngµy 15 th¸ng 8 n¨m 2010.\n  ViÖc ngõng server sÏ lµm gi¶m ®iÓm t­ c¸ch cña c¸c ng­êi ch¬i §¹i Héi Tû Vâ trong tuÇn nµy, vµ sÏ cã mét sè ng­êi ch¬i nhËn tói ®¹i héi tû thÝ kú thi quý tr­íc, v× thÕ ph¸t bï cho c¸c hiÖp sÜ tói §¹i Héi Tû Vâ thi quý.",
		3,
		"\nNhËn båi th­êng /bw_buchang_1",
		"\nPh­¬ng ¸n båi th­êng /bw_buchang_2",
		"\nKÕt thóc ®èi tho¹i/nothing")
end

function bw_buchang_1()
	if GetTask(TASKID_BIWU_BUCHANG) ~= 0 then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn qua båi th­êng råi.");
		return 0;
	end
	local szName = GetName();
	local nRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."B¹n vÉn ch­a gia nhËp m«n ph¸i, kh«ng cã t­ c¸ch nhËn bï phÇn th­ëng thi quý tr­íc.");
		return 0;
	end;
	if gf_Judge_Room_Weight(2,100,g_szInfoHead) ~= 1 then
		return 0;
	end
	local tBuChangAward = {
		{
			{"1000 v¹n kinh nghiÖm ","season_modify_exp(10000000,1)"},
			{"Tói §¹i Héi Tû Vâ thi quý 20 c¸i","gf_AddItemEx({2,95,171,20,1}, 'Tói thi quý §¹i Héi Tû Vâ thi quý')"},
			{"Danh hiÖu: Cöu Ch©u Vâ ThÇn (Èn vÉn cã hiÖu lùc)","season_add_title(5,2,'cöu ch©u vâ thÇn')"},
		},
		{
			{"500 v¹n kinh nghiÖm ","season_modify_exp(5000000,1)"},
			{"Thó c­ìi chuyªn dïng cho §¹i Héi Tû Vâ ","gf_AddItemEx({0,105,106,1,1,-1,-1,-1,-1,-1,-1}, 'ViÖt ¶nh')"},
			{"Tói §¹i Héi Tû Vâ thi quý 20 c¸i","gf_AddItemEx({2,95,171,20,1}, 'Tói thi quý §¹i Héi Tû Vâ thi quý')"},
			{"Danh hiÖu: Cöu Ch©u Vâ Th¸nh (Èn vÉn cã hiÖu lùc)","season_add_title(5,3,'cöu ch©u vâ th¸nh')"},
		},
		{
			{"500 v¹n kinh nghiÖm ","season_modify_exp(5000000,1)"},
			{"Tói §¹i Héi Tû Vâ thi quý 20 c¸i","gf_AddItemEx({2,95,171,20,1}, 'Tói thi quý §¹i Héi Tû Vâ thi quý')"},
			{"Danh hiÖu: Cöu Ch©u Vâ Cuång (Èn vÉn cã hiÖu lùc)","season_add_title(5,4,' cöu ch©u vâ cuång')"},
		},
		{
			{"500 v¹n kinh nghiÖm ","season_modify_exp(5000000,1)"},
			{"Tói §¹i Héi Tû Vâ thi quý 20 c¸i","gf_AddItemEx({2,95,171,20,1}, 'Tói thi quý §¹i Héi Tû Vâ thi quý')"},
			{"Danh hiÖu: Cöu Ch©u Vâ HiÖp (Èn vÉn cã hiÖu lùc)","season_add_title(5,5,'cöu ch©u vâ hiÖp')"},
		},
		{
			{"Tói §¹i Héi Tû Vâ thi quý 20 c¸i","gf_AddItemEx({2,95,171,20,1}, 'Tói thi quý §¹i Héi Tû Vâ thi quý')"},
			{"2500 v¹n kinh nghiÖm ","season_modify_exp(25000000,1)"},
		},
	};

	local tbRankInfo = {{1000,1100},{800,880},{680,750},{450,500},{180,200}};
	local nType = 0;
	local szMsg = "";
	local nBWLevel,nBWRank,nRankPoint = get_rank_before();--Èç¹ûÃ»½øÅÅÐÐ°ñ£¬nRankPoint¾ÍÊÇ0
	for i=1,getn(tbRankInfo) do
		if nRankPoint >= tbRankInfo[i][1] and nRankPoint < tbRankInfo[i][2] then
			nType = i;
			break;
		end
	end;
	if nType == 0 then
		Talk(1,"bw_buchang",g_szInfoHead.."§iÓm t­ c¸ch kú thi quý tr­íc cña b¹n lµ:"..nRankPoint..", kh«ng tháa m·n ®iÒu kiÖn nhËn th­ëng bï, chi tiÕt cã thÓ xem ph­¬ng ¸n båi th­êng.");
		return 0;
	end

	BWDH_SetTask(TASKID_BIWU_BUCHANG,1);
	gf_SetLogCaption("Båi th­êng §¹i Héi Tû Vâ ");
	for i=1,getn(tBuChangAward[nType]) do
		dostring(tBuChangAward[nType][i][2]);
	end
	gf_SetLogCaption("");
end

function bw_buchang_2()
	local strMsg = [[
		²¹³¥¹æÔò£º°´Íæ¼ÒÉÏÈü¼¾×Ê¸ñ·ÖÔö¼Ó1/11£¬Èç¹ûµ¼ÖÂÍæ¼ÒÁìÈ¡µÄ½±Àøµµ´ÎÌá¸ß£¬½«²¹³¥½±Àø²î¶î£¬Èç¹ûÃ»ÓÐµ¼ÖÂ½±Àøµµ´Î¸Ä±ä£¬Íæ¼ÒÕý³£ÁìÈ¡±ÈÎä´ó»áÈü¼¾½±Àø¼´¿É£¬ÎÞÐè½øÐÐ²¹³¥¡£
		ÏêÏ¸²¹³¥ÈçÏÂ£º
		1000<=ÉÏÈü¼¾×Ê¸ñ·Ö<1100£º±ÈÎä´ó»áÈü¼¾°ü20¸ö £¬¾­Ñé£º10000000£¬³ÆºÅ£º¾ÅÖÝÎäÉñ¡£
		880<=ÉÏÈü¼¾×Ê¸ñ·Ö<1000£ºÎÞÓ°Ïì£¬²»²¹³¥¡£
		\p800<=ÉÏÈü¼¾×Ê¸ñ·Ö<880£º±ÈÎä´ó»áÈü¼¾°ü20¸ö£¬¾­Ñé£º5000000£¬³ÆºÅ£º¾ÅÖÝÎäÊ¥£¬±ÈÎä´ó»á×¨ÓÃÂí¡£
		750<=ÉÏÈü¼¾×Ê¸ñ·Ö<800£ºÎÞÓ°Ïì£¬²»²¹³¥¡£
		680<=ÉÏÈü¼¾×Ê¸ñ·Ö<750£º±ÈÎä´ó»áÈü¼¾°ü20¸ö£¬¾­Ñé£º5000000£¬³ÆºÅ£º¾ÅÖÝÎä¿ñ¡£
		500<=ÉÏÈü¼¾×Ê¸ñ·Ö<680£ºÎÞÓ°Ïì£¬²»²¹³¥¡£
		450<=ÉÏÈü¼¾×Ê¸ñ·Ö<500£º±ÈÎä´ó»áÈü¼¾°ü20¸ö£¬¾­Ñé£º5000000£¬³ÆºÅ£º¾ÅÖÝÎäÏÀ¡£
		200<=ÉÏÈü¼¾×Ê¸ñ·Ö<450£ºÎÞÓ°Ïì£¬²»²¹³¥¡£
		180<=ÉÏÈü¼¾×Ê¸ñ·Ö<200£º±ÈÎä´ó»áÈü¼¾°ü20¸ö£¬¾­Ñé£º25000000¡£
	]]
	suTalk("bw_buchang",g_szInfoHead..strMsg);
end

function gotoUrl()
	local URL = "http://jx2.xoyo.com/zt/2013/08/26/zy2ndpk/";
	SendScript2Client(format("URL([[%s]], '');", URL));
end