-- ====================== ÎÄ¼şĞÅÏ¢ ======================
-- ======================================================
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); 

TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018}
NPC_NAME = "<color=green>Ph­¬ng L¹p<color>: "
function main()
	local t_dia_sel = {
		"Nguån gèc Minh Gi¸o/say1_1",
		"Vâ c«ng Minh Gi¸o/say1_2",
		"§iÒu kiÖn nhËp m«n/say1_3",
		"Ta muèn gia nhËp Minh Gi¸o/say1_4",
		"Ta muèn lµm nhiÖm vô S­ M«n/#ftask_repeat_main(9)",
		"Ta s¾p thµnh th©n nªn ph¶i xuÊt s­",
		"Chµo hái ch­ëng m«n/end_dialog"
	}
	Say(NPC_NAME.."Minh Gi¸o hµo kiÖt, phong c¶nh tr¸ng lÖ",
		getn(t_dia_sel),
		t_dia_sel
		)
end;	
function say1_1()
	Talk(1,"main", NPC_NAME.."Minh Gi¸o nguån gèc Ba T­ Ma Ni Gi¸o, ®­îc du nhËp vµo thêi trung thæ §¹i §­êng råi tõ tõ ph¸t triÓn lªn, ®Õn thêi Tèng ®Æt tªn lµ Minh Gi¸o. Minh Gi¸o Gi¸o Hoµng Th­îng Quang Minh vµ Th¸nh Háa cho r»ng trong thÕ giíi th× quang minh vµ h¾c ¸m t­¬ng hå ®èi lËp nhau, quang minh cuèi cïng còng th¾ng h¾c ¸m. §Õn nay gi¸o nghÜa ®­îc quy vÒ 8 ch÷: Thanh, TŞnh, Quang Minh, §¹i Lùc, Trİ, TuÖ")
end
function say1_2()
	Talk(1,"main", NPC_NAME.."Vâ c«ng bæn m«n gåm 3 ph¸i: <color=yellow>Th¸nh ChiÕn<color>,  <color=yellow>TrËn Binh<color> vµ <color=yellow>HuyÕt Nh©n<color>.")
end
function say1_3()
	Talk(1,"main","<color=green>Ph­¬ng L¹p<color>: ChØ cÇn cÇn cã trİ th× kh«ng kÓ c¶ Nam hay N÷, ®Òu cã thÓ tham gia")
end 
function say1_4()
	local s_dia_no_pass = ""
	if GetLevel() < 10 then
		s_dia_no_pass = "Ng­¬i kh«ng ®ñ cÊp, ®¹t cÊp <color=red>10<color> h·y ®Õn t×m ta."
		Talk(1,"",NPC_NAME..s_dia_no_pass)
		return
	elseif GetPlayerRoute() ~= 0 then
		s_dia_no_pass =  "ThiÕu hiÖp ®· cã <color=red>m«n ph¸i<color>, ta kh«ng thÓ nhËn."
		Talk(1,"",NPC_NAME..s_dia_no_pass)
		return
	elseif GetPlayerFaction() == 9 then
		s_dia_no_pass =  "Ng­¬i ®· lµ ng­êi cña Minh Gi¸o M«n, mau ®i luyÖn c«ng."
		Talk(1,"",NPC_NAME..s_dia_no_pass)
		return
	else
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			if GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
				s_dia_no_pass = "ThiÕu hiÖp ®· nhËn nhiÖm vô nhËp m«n cña m«n ph¸i kh¸c, kh«ng thÓ gia nhËp bæn m«n."
				Talk(1,"",NPC_NAME..s_dia_no_pass)
				return
			end
		end
	end
	
	SetPlayerFaction(9)
	SetPlayerRoute(24)
	TaskTip("Ng­¬i ®· gia nhËp Minh Gi¸o M«n thµnh c«ng")
end


