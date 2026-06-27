Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

EFN_SZ_NPC_NAME="Ngò Hµnh T«n Gi¶"
function equip_feed_OnServerStart()
	local npcIndex1 = CreateNpc("C«n L«n T©n Ch­ëng M«n", EFN_SZ_NPC_NAME, 300,1921,3576)
	SetNpcScript(npcIndex1, "\\script\\equip_feed\\equip_feed_npc.lua")
end

function main(bTag)
	--return equip_feed_NpcTalkMain(bTag)
end

function equip_feed_NpcTalkMain(bTag)
	
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "Thiªn ®Şa khai, ngò hµnh sinh, tïy theo phong Ên cæ ®¹i më khãa d­ìng thµnh trang bŞ cuèi cïng t¸i xuÊt thÕ gian.")
	local tbSay = {}
	
	--»î¶¯
	local tID = {121}
	for i = 1, getn(tID) do
		if g_akct_ShowDialog(121, bTag) then
			return
		end
	end

	tinsert(tbSay, "Giíi thiÖu d­ìng thµnh trang bŞ/_equip_feed_desc")
	tinsert(tbSay, "Nu«i d­ìng trang bŞ d­ìng thµnh/_equip_feed_weiyang")
	tinsert(tbSay, "Trïng luyÖn trang bŞ d­ìng thµnh/_equip_feed_chongzhu")
	tinsert(tbSay, "Tinh luyÖn trang bŞ d­ìng thµnh/_equip_feed_jinglian")
	tinsert(tbSay, format("%s/_equip_feed_reset_advance", "TÈy luyÖn trang bŞ d­ìng thµnh"))
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_desc()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "HiÖn t¹i d­ìng thµnh trang bŞ xuÊt thÕ cã Huy Ch­¬ng, ¸o Choµng vµ giµy. Khi ng­¬i nhËn ®­îc trang bŞ th× ®¼ng cÊp trang bŞ t­¬ng ®èi thÊp, nh­ng cã thÓ th«ng qua nu«i d­ìng ThiÕt Tinh hoÆc nh÷ng thø kh¸c ®Ó n©ng cÊp trang bŞ.")
	szTitle = format("%s\n%s", szTitle, "Tïy theo n©ng cÊp ®¼ng cÊp d­ìng thµnh trang bŞ, thuéc tİnh d­ìng thµnh cña trang bŞ sÏ dÇn dÇn ph¸t triÓn, më khãa thuéc tİnh sau khi ®¹t ®Õn trŞ sè t­¬ng øng còng sÏ më khãa.")
	local tbSay = {}

	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_chongzhu()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "Thuéc tİnh ph¸t triÓn cña trang bŞ d­ìng thµnh cã thÓ th«ng qua TÈy T©m Th¹ch tiÕn hµnh trïng luyÖn, sau khi trïng luyÖn ®¼ng cÊp cña trang bŞ kh«ng thay ®æi, thuéc tİnh ph¸t triÓn sÏ thay ®æi.")
	szTitle = format("%s\n%s", szTitle, "D­ìng thµnh trang bŞ cÊp sao cµng cao, cÇn cÊp ®é cña TÈy T©m Th¹ch cµng cao.")
	local tbSay = {}

	tinsert(tbSay, "Trïng luyÖn trang bŞ/_equip_feed_do_chongzhu")
	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_jinglian()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "Më khãa thuéc tİnh cña trang bŞ d­ìng thµnh cã thÓ th«ng qua LuyÖn L« ThiÕt tiÕn hµnh tinh luyÖn, sau khi tinh luyÖn ®¼ng cÊp cña trang bŞ kh«ng thay ®æi, thuéc tİnh më khãa sÏ thay ®æi.")
	szTitle = format("%s\n%s", szTitle, "D­ìng thµnh trang bŞ cÊp sao cµng cao, cÇn cÊp ®é cña LuyÖn L« ThiÕt cµng cao.")
	local tbSay = {}

	tinsert(tbSay, "Tinh luyÖn trang bŞ/_equip_feed_do_jinglian")
	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_reset_advance()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "TÈy luyÖn trang bŞ cã thÓ khãa ®Şnh mét dßng tr­ëng thµnh hay gi¶i khãa thuéc tİnh, tÈy luyÖn dßng tr­ëng thµnh vµ thuéc tİnh gi¶i khãa kh¸c")
	local tbSay = {}

	tinsert(tbSay, format("%s/_equip_feed_do_reset_advance", "TÈy luyÖn trang bŞ"))
	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_weiyang()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "D­ìng thµnh trang bŞ cã thÓ th«ng qua viÖc thªm vµo d­ìng thµnh trang bŞ kh«ng dïng ®Õn hoÆc ThiÕt Tinh ®Ó n©ng cÊp.")
	szTitle = format("%s\n%s", szTitle, "D­ìng thµnh trang bŞ cÊp sao cµng cao, th× kinh nghiÖm cÇn ®Ó n©ng cÊp cµng nhiÒu")
	local tbSay = {}

	tinsert(tbSay, "Nu«i d­ìng trang bŞ/_equip_feed_do_weiyang")
	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end


function _equip_feed_do_chongzhu()
	--SendScript2Client("Open([[EquipEvolution]], 2);");
	Talk(1, "", "Tİnh n¨ng t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau nha !!!!")
	do return end
end

function _equip_feed_do_jinglian()
	SendScript2Client("Open([[EquipEvolution]], 3);");
	--Talk(1, "", "Tİnh n¨ng t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau nha !!!!")
	--do return end
end

function _equip_feed_do_reset_advance()
	SendScript2Client("Open([[EquipEvolution]], 4);");
	--Talk(1, "", "Tİnh n¨ng t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau nha !!!!")
	--do return end
end


function _equip_feed_do_weiyang()
	SendScript2Client("Open([[CommonEnhanceItem]], 101);");
	--Talk(1, "", "Tİnh n¨ng t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau nha !!!!")
	--do return end
end

function nothing()
end