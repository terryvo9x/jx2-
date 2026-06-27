Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua")

Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

g_NpcName = "<color=green>TrËn Linh<color>:"

function main()
	local strtab = {
			"\n rêi ¶i/wrx_leave_1",
			"\nTa muèn quay l¹i chiÕn tr­êng (CÇn [Thiªn Kiªu LÖnh]x1)/wrx_goto",
			"\n c¸c h¹ lµ ai? Sao l¹i cøu t¹i h¹./wrx_who_are_u",
			"\nKÕt thóc ®èi tho¹i/nothing",
		}
	Say(g_NpcName.."§©y lµ mËt thÊt V¹n KiÕm Tròng, c¸c h¹ bÞ träng th­¬ng, t¹i h¹ cøu c¸c h¹ ®Õn ®©y.",
		getn(strtab),
		strtab)
end

function wrx_leave_1()
	local strtab = {
			"\n ®õng nãi nhiÒu lêi, t¹i h¹ ph¶i ®i/wrx_leave_2",
			"\n ngåi quan s¸t chê th«ng quan/nothing",
		};
	Say(g_NpcName.."ThiÕu hiÖp ®õng tõ bá, ®ång ®¹o vâ l©m kh«ng ng¹i x­¬ng r¬i m¸u ®æ chiÕn ®Êu v× chÝnh nghÜa, ThiÕu hiÖp nhÉn t©m rêi khái sao?",
		getn(strtab),
		strtab)
end

function wrx_who_are_u()
	local strtab = {
			"\n Th«ng Thiªn L·o Tæ lµ ai?/wrx_tongtianlaozu",
			"\n lai lÞch V¹n KiÕm Tròng ra sao?/wrx_wanjianzhong",
			"\n rót lui/nothing",
		};
	Say(g_NpcName.."T¹i h¹ lµ TrËn Linh V¹n KiÕm Tròng Phong Ên. T¹i h¹ kh«ng thÓ tiÕp tôc hé vÖ Phong Ên n÷a råi, h·y ng¨n chÆn Th«ng Thiªn L·o Tæ t¸i xuÊt giang hå.",
		getn(strtab),
		strtab)
end

function wrx_tongtianlaozu()
	local strtab = {
			"\n trë vÒ tÇng tr­íc/wrx_who_are_u",
			"\n rót lui/nothing",
		};
	Say(g_NpcName.."Th«ng Thiªn L·o Tæ vèn lµ vâ t«n trong Cæ Thiªn M«n TrËn, xøng danh Th«ng Thiªn vâ t«n, cïng 10 §Ö Tö KiÕm Tu, n¨m x­a bÞ  ¢n Th¸i S­ ¸m h¹i, Ma KhÝ nhËp thÓ, tæn h¹i khÝ huyÕt hãa thµnh Nh©n Ma, tù xøng Th«ng Thiªn L·o Tæ.",
		getn(strtab),
		strtab)
end

function wrx_wanjianzhong()
	local strtab = {
			"\n trë vÒ tÇng tr­íc/wrx_who_are_u",
			"\n rót lui/nothing",
		};
	Say(g_NpcName.."Hé vÖ vâ t«n biÕn thµnh Nh©n Ma ¨n thÞt uèng m¸u, tÝnh khÝ kú qu¸i. Kh­¬ng Tö Nha ®µnh Phong Ên Cæ Thiªn M«n TrËn.<enter>Th«ng Thiªn HuyÔn C¶nh trong V¹n KiÕm Tròng lµ mét trong Cæ Thiªn M«n TrËn bÞ Phong Ên. V¹n KiÕm Tròng kh«ng bÞ ph¸ hñy, Th«ng Thiªn L·o Tæ kh«ng thÓ tho¸t khái Th«ng Thiªn HuyÔn C¶nh s¸t h¹i sinh linh.",
		getn(strtab),
		strtab)
end

function wrx_leave_2()
	SetCreateTeam(0);
	LeaveTeam();
	
--	local nGoMapID = GetMissionV(tbJZMY.mv19);
--	local t = {
--			[100] = {1505,3111},
--			[200] = {1241,2772},
--			[300] = {1769,3710},
--		};
--	if t[nGoMapID] then
--		NewWorld(nGoMapID,t[nGoMapID][1],t[nGoMapID][2]);
--	else
--		NewWorld(100,t[100][1],t[100][2]);
--	end
	NewWorld(500,1707,3061);
end

function wrx_goto()
	local nCurStage = GetMissionV(MV_STAGE);
	if tFildPos[nCurStage] then
		if DelItem(2, 97, 236,1) == 1 then
			Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
			_stat_when_ib_consume(1)
			gf_WriteLogEx("wanjianzhong mission", "death back to mission IB cost", "", "Thiªn Kiªu LÖnh", "2, 97, 236,1");
			RestoreAll();
			ttd_setPos(tFildPos[nCurStage][1],tFildPos[nCurStage][2],1);
		else
			Talk(1,"",g_NpcName.."Thiªn Kiªu LÖnh trªn ng­êi kh«ng ®ñ!")
		end
	end
end