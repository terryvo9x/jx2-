Include("\\script\\isolate\\functions\\tong_title\\daily_task.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Cã thÓ gióp g× ®­îc b¹n ?")
    local tbSay = {}
    
    tinsert(tbSay, format("%s/desc", "Giíi thiÖu tİnh n¨ng"))
    tinsert(tbSay, format("%s/npc_talk_finish_rand_task", "NhiÖm vô h»ng ngµy"))
    tinsert(tbSay, format("%s/open_equip_shop", "Cöa hµng Bang héi."))
    tinsert(tbSay, format("%s/nothing", "Ra khái"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function desc()
	local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Thiªn ¢m Gi¸o lui gi÷ ë T©y Vùc, trung nguyªn kh¾p n¬i ®­îc nghØ ng¬i ng¾n h¹n. Lóc nµy Vâ L©m Minh hy väng c¸c bang héi lín cã thÓ nhanh chãng lËp bang, båi d­ìng hiÖp sÜ c­êng m¹nh, chuÈn bŞ tèt c«ng viÖc chèng l¹i Thiªn ¢m Gi¸o quay trë l¹i, v× vËy Vâ L©m Minh ñy th¸c t«i ®Õn gióp ®ì mäi ng­êi, t«i sÏ c«ng bè mét sè nhiÖm vô cho c¸c vŞ, sau khi hoµn thµnh cã thÓ nhËn ®­îc ®é cèng hiÕn bang héi, nÕu hiÖp sÜ cã kİch ho¹t thÎ th¸ng th× cßn cã thÓ nhËn ®­îc phÇn th­ëng gÊp béi. §é cèng hiÕn cã thÓ dïng ë trong bang héi ®Ó nhËn ®­îc danh hiÖu bang héi vµ cung cÊp tiªu hao danh hiÖu bang héi, còng cã thÓ ho¸n ®æi mét sè ®å vËt ë ®©y. Hy väng cã thÓ gióp ®­îc mäi ng­êi.")
    local tbSay = {}
    tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
    tinsert(tbSay, format("%s/nothing", "Ra khái"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function open_equip_shop()
	if GetTongName() == "" then
		Talk(1, "", "Mêi gia nhËp bang héi tr­íc")
		return 0
	end
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3068, "Cöa hµng Bang héi."))
end