--=============================================
-- NhiÖm vô ChuyÓn sinh lÇn 1
-- Created by TuanNA5
--=============================================
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

function trans_talk_01()
	local str1, str2
	str1 = szNpcName.."Tù cæ chÝ kim cho dï lµ TuyÖt §Ønh Cao Thñ hay Hoµng §Õ Trung Nguyªn còng kh«ng mét ai tho¸t khái quy luËt <color=yellow>Sinh – L·o – BÖnh – Tö<color>. Còng chÝnh v× ®iÒu nµy mµ ®· x¶y ra biÕt bao cuéc chiÕn ®Ó tranh ®o¹t bÝ quyÕt <color=green>C¶i L·o Hoµn §ång<color>."
	str2 = szNpcName.."300 n¨m tr­íc, do c¬ duyªn h·o hîp l·o phu ®· ®­îc mét thÇn tiªn truyÒn thô <color=green>Hçn Nguyªn C«ng<color> - vâ c«ng t©m ph¸p gióp con ng­êi tr­êng sinh bÊt l·o. Nh­ng do c¨n c¬ vâ häc ch­a ®ñ nªn l·o phu chØ lÜnh héi ®­îc 2 thµnh cña Hçn Nguyªn C«ng. Tuy chØ cã 2 thµnh c«ng lùc nh­ng ®· lµm cho l·o phu cã th©n thÓ tr¸ng kiÖn vµ tinh thÇn minh mÉn nh­ hiÖn t¹i."	
	Talk(2, "trans_talk_01_01", str1, str2)
end

function trans_talk_01_01()
	local tSay = 	{
							"V·n bèi muèn häc Hçn Nguyªn C«ng/learn_translife_skill",
							"N¨ng lùc v·n bèi cßn h¹n chÕ!/nothing",	
						}
	local strSay = szNpcName.."<color=green>Hçn Nguyªn C«ng<color> bao gåm 5  thøc, 10 thµnh <color=yellow>Hîp T­íng Quy Nguyªn - ThÇn H×nh Thñ ChÝnh - Hçn Tôc Hßa Quang - §én Nhiªn V« CÊu - Sinh Tö V« Ng·<color>. LÜnh héi c¸c chiªu thøc kh«ng ph¶i dÔ, ph¶i lµ <color=yellow>Cao Thñ Vâ L©m ®¼ng cÊp 99, cã 2 tû ®iÓm kinh nghiÖm tÝch lòy vµ bÝ kiÕp Th¸i DÞch Hçn Nguyªn Phæ<color> míi lÜnh héi ®­îc vâ c«ng tuyÖt ®Ønh nµy."
	Say(strSay,getn(tSay),tSay)
end

function learn_translife_skill()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 0 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	
	--if GetLevel() < TRANSLIFE_LEVEL then
	--	Talk(1,"",szNpcName.."N¨ng lùc cña ng­¬i cßn h¹n chÕ!")
	--	return
	--end
	
	--if GetExp() < TRANSLIFE_EXP then
	--	Talk(1,"",szNpcName.."N¨ng lùc cña ng­¬i cßn h¹n chÕ!")
	--	return
	--end
	
	if GetItemCount(2,0,1083) < 1 then
		Talk(1,"",szNpcName.."Ph¶i cã Th¸i DÞch Hçn Nguyªn Phæ míi chØ dÉn ng­¬i tu luyÖn ®­îc!")
		return
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Ph¶i gia nhËp hÖ ph¸i míi cã thÓ tu luyÖn!")
		return
	end
	
	--if get_task_thonuong(BYTE_COUNT_FINISH) < 4 then
	--	Talk(1,"",szNpcName.."H·y t×m gióp l·o phu 4 nhiÖm vô ThÞt N­íng råi l·o phu sÏ truyÒn thô!")
	--	return
	--end
	
	trans_talk_02()
end

function trans_talk_02()
	local tSay = 	{
							"§­îc, v·n bèi sÏ ®i t×m cho tiÒn bèi/trans_talk_02_01",
							"§Ó khi kh¸c nhÐ!/nothing",	
						}						
	local strSay = "L·o phu nghe nãi töu lÇu ë BiÖn Kinh cã b¸n lo¹i r­îu <color=red>N÷ Nhi Hång th­îng h¹ng<color>, ng­¬i cã thÓ mang vÒ cho ta 1 b×nh ®Ó th­ëng thøc cïng víi ThÞt N­íng kh«ng ? NÕu cã r­îu ë ®©y kh«ng chõng l·o phu sÏ suy nghÜ ®Õn viÖc truyÒn thô Hçn Nguyªn C«ng cho ng­¬i."
	Say(strSay,getn(tSay),tSay)
end

function trans_talk_02_01()
	if GetItemCount(2,0,1083) < 1 then
		Talk(1,"",szNpcName.."Ph¶i cã Th¸i DÞch Hçn Nguyªn Phæ míi chØ dÉn ng­¬i tu luyÖn ®­îc!")
		return
	end	
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 0 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end	
	if DelItem(2,0,1083,1) == 1 then
		SetTaskTrans()
		Talk(1,"",szNpcName.."§a t¹, l·o phu chê tin cña ng­¬i!")
		TaskTip("§Õn TiÓu NhÞ ë BiÖn Kinh t×m mua N÷ Nhi Hång th­îng h¹ng cho B¹ch Tiªn Sinh.")
	end
end

function trans_talk_03()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 1 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	Talk(3,"trans_talk_03_01","Ta muèn mua 1 b×nh N÷ Nhi Hång th­îng h¹ng.",szNpcName.."Lo¹i r­îu ®ã lµ b¶o bèi cña Töu LÇu, gi¸ kh«ng rÎ. Kh¸ch quan thö hái «ng chñ xem!", "Xin ®a t¹!")
end

function trans_talk_03_01()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() ~= 1 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	SetTaskTrans()
	TaskTip("§Õn Chñ Töu LÇu ë BiÖn Kinh mua N÷ Nhi Hång th­îng h¹ng cho B¹ch Tiªn Sinh.")
end

function trans_talk_04()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 2 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	Talk(4,"trans_talk_04_01","Ta muèn mua 1 b×nh N÷ Nhi Hång th­îng h¹ng.", szNpcName.."Kh¸ch quan muèn mua N÷ Nhi Hång Th­îng H¹ng ­? ThËt ®¸ng tiÕc! VÞ tr¸ng sÜ kia võa mua b×nh r­îu cuèi cïng råi.","Hõ! §Õn 1 b×nh r­îu còng kh«ng cßn cho ta sao?","(§µnh ph¶i lµm phiÒn vÞ huynh ®µi kia vËy...)")
end

function trans_talk_04_01()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 2 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	SetTaskTrans()
	TaskTip("§Õn Nh©n SÜ Giang Hå ë BiÖn Kinh th­¬ng l­îng.")
end

function trans_talk_05()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 3 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	Talk(1,"trans_talk_05_01","VÞ huynh ®µi nµy cã thÓ nh­êng cho t¹i h¹ b×nh r­îu N÷ Nhi Hång th­îng h¹ng kia kh«ng? T¹i h¹ ®ang rÊt cÇn!")
end

function trans_talk_05_01()
	local tSay = {
							"Qu¶ thËt t¹i h¹ cÇn b×nh r­îu nµy!/trans_talk_05_02",
							"Tªn nµy qu¶ thËt hèng h¸ch, cho h¾n 1 bµi häc!/reject",
							"T¹i h¹ chØ ®ïa th«i./nothing",
					   }
	SetTaskTrans()
	Say(szNpcName.."Ng­¬i muèn ta nh­êng l¹i b×nh N÷ Nhi Hång th­îng h¹ng nµy ­? N»m m¬ ®i!",getn(tSay),tSay)
end

function reject()
	if GetCash()  <= 1000000 then
		Pay(GetCash())
	else
		Pay(1000000)
	end
	Talk(1,"","B¹n võa xuÊt chiªu th× h¾n ®· nhanh ch©n tÈu tho¸t ®ång thêi lÊy cña b¹n 1 sè vµng.")	
end

function trans_talk_05_02()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 4 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	local strSay = szNpcName.."Ng­¬i ®· tõng nghe qua ®¹i tiÖc t¹i Long M«n TrÊn ch­a? Nghe nãi quÇn hïng sÏ héi tô t¹i ®ã, ta rÊt muèn ®i xem chØ tiÕc lµ kh«ng cã ThiÖp mêi. NÕu ng­¬i cã <color=yellow>ThiÖp dù tiÖc Long M«n<color> ta sÏ ®æi víi ng­¬i."
	local tSay = {
							"(H¾n qu¶ thËt hiÕp ng­êi qu¸ ®¸ng. ThiÖp dù tiÖc Long m«n quý gi¸ nh­ vËy mµ muèn ta ®æi víi b×nh r­îu N÷ Nhi Hång ®ã sao? Hõ, ®æi xong ta sÏ cõu s¸t ng­¬i!) §­îc, ta ®æi víi ng­¬i!/trans_talk_05_03",							
							"§Ó ta suy nghÜ l¹i./nothing",
					  }
	Say(strSay,getn(tSay),tSay)
end

function trans_talk_05_03()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 4 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	if GetItemCount(2,0,1037) < 1 then
		Talk(1,"",szNpcName.."ThiÖp dù tiÖc Long M«n ®©u?")
		return
	end	
	if DelItem(2,0,1037,1) == 1 then
		SetTaskTrans()
		Talk(1,"",szNpcName.."B×nh r­îu cña ng­¬i ®©y!")
		Msg2Player("B¹n nhËn ®­îc 1 b×nh r­îu N÷ Nhi Hång.")
		TaskTip("§em b×nh r­îu N÷ Nhi Hång th­îng h¹ng vÒ cho B¹ch Tiªn Sinh.")
	end
end

function trans_talk_06()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 5 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	local str1 = "B×nh r­îu tiÒn bèi cÇn ®©y!"
	local str2 = szNpcName.."Ha ha ha! Ng­¬i ®· tróng kÕ cña tiÓu tö kia råi, b×nh r­îu nµy chØ lµ lo¹i r­îu th«ng th­êng th«i. Xem ng­¬i vâ c«ng cao c­êng nh­ng kinh nghiÖm giang hå ng­¬i cßn non kÐm qu¸!"
	local str3 = "(...ThËt kh«ng ngê ta b«n tÈu giang hå bÊy l©u nay chØ v× mét chót s¬ suÊt ®· bÞ tªn tiÓu tö kia qua mÆt, lÇn sau nÕu ®Ó ta gÆp l¹i ta sÏ sÏ lÊy m¹ng h¾n...)"
	local str4 = "Xin tiÒn bèi thø lçi, v·n bèi sÏ ®i t×m b×nh r­îu kh¸c vÒ ®©y!"
	local str5 = szNpcName.."Kh«ng sao! C¨n c¬ vâ häc cña ng­êi còng kh«ng tÖ nh­ng kinh nghiÖm giang hå vÉn cßn non kÐm, kh«ng tr¸ch ®­îc ng­¬i. Dï sao th× b×nh r­îu nµy ®èi víi ta còng rÊt cã ý nghÜa, ta sÏ truyÒn thô cho ng­¬i 2 thµnh c¬ b¶n cña Hçn Nguyªn C«ng."
	SetTaskTrans()
	Talk(5,"trans_talk_07",str1,str2,str3,str4,str5)
end

function trans_talk_07()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 6 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ ®· lÜnh héi vâ c«ng nµy råi!")
		return
	end
	local tSay = 	{
							"V·n bèi muèn tu luyÖn theo h­íng Long Tö!/#select_translife(1)",
							"V·n bèi muèn tu luyÖn theo h­íng Hæ Tö!/#select_translife(2)",
							"V·n bèi muèn tu luyÖn theo h­íng Phông Tö!/#select_translife(4)",
							"V·n bèi muèn tu luyÖn theo h­íng ¦ng Tö!/#select_translife(3)",
							"Giíi thiÖu c¸c h­íng tu luyÖn/view_info",
							"V·n bèi suy nghÜ l¹i ®·./nothing",
						}
	Say(szNpcName.."Hçn Nguyªn C«ng thùc chÊt cã 4 h­íng tu luyÖn, ng­¬i muèn theo h­íng nµo?",getn(tSay),tSay)
end

function trans_talk_08()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 7  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	if GetLevel() < TRANSLIFE_LEVEL then
		Talk(1,"",szNpcName.."Ng­¬i vÉn ch­a luyÖn thµnh th¹o Hîp T­íng Quy Nguyªn µ?")
		return
	end	
	if GetExp() < TRANSLIFE_EXP then
		Talk(1,"",szNpcName.."Ng­¬i vÉn ch­a luyÖn thµnh th¹o Hîp T­íng Quy Nguyªn µ?")
		return
	end	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Ph¶i gia nhËp hÖ ph¸i míi cã thÓ tu luyÖn!")
		return
	end	
	local tSay = 	{
							"§a t¹ l·o tiÒn bèi!/trans_talk_08_01",
							"V·n bèi suy nghÜ l¹i ®·./nothing",
						}
	Say(szNpcName.."Ng­¬i ®· luyÖn <color=yellow>Hîp T­íng Quy Nguyªn<color> thµnh th¹o råi sao? Qu¶ lµ kú tµi hiÕm thÊy! Ta kh«ng cßn g× ®Ó truyÒn d¹y ng­¬i n÷a. Ta nghe §¶o chñ §µo Hoa §¶o nãi <color=yellow>Minh Chñ Kim S¬n<color> ®· luyÖn thµnh c«ng thøc thø 2 cña Hçn Nguyªn C«ng <color=yellow>ThÇn H×nh Thñ ChÝnh<color>, h·y ®Õn b¸i kiÕn ®¹i nh©n Êy xem sao!",getn(tSay),tSay)
end

function trans_talk_08_01()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 7  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	SetTaskTrans()
	Talk(1,"",szNpcName.."Chóc ng­¬i sím luyÖn thµnh c«ng!")	
	TaskTip("§Õn T­¬ng D­¬ng t×m gÆp Minh Chñ Kim S¬n.")
end

function trans_talk_09()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 8  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local str1 = szNpcName.."Hmmm..."
	local str2 = szNpcName.."Kh«ng ngê giang hå hiÖn nay vÉn cßn cã ng­êi biÕt chuyÖn nµy. Cã ph¶i l·o giµ §µo Hoa §¶o nãi cho ng­¬i biÕt kh«ng? Ta víi l·o giµ Êy 400 n¨m tr­íc cïng b¸i s­ ë <color=yellow>Tø Linh §éng<color>, nh­ng Hçn Nguyªn C«ng qu¸ huyÒn c¬, ta chØ lÜnh héi ®­îc ®Õn thøc thø 2 <color=yellow>ThÇn H×nh Thñ ChÝnh<color>.  Kh«ng biÕt l·o Êy hiÖn giê cã kháe kh«ng?"
	local str3 = "TiÓu bèi nghe B¹ch L·o tiªn sinh kÓ l¹i chø kh«ng ph¶i §¶o chñ §µo Hoa §¶o. Xin ®õng tr¸ch B¹ch L·o v× tiÓu bèi rÊt t©m huyÕt víi lo¹i vâ c«ng nµy. Minh Chñ, xin ngµi h·y nhËn tiÓu bèi lµm ®Ö tö!"
	local str4 = "Hõ! Nhê vâ c«ng nµy mµ ta míi cã thÓ x­ng b¸ vâ l©m, lªn ng«i vÞ Minh Chñ. H¸ cã thÓ truyÒn thô dÔ dµng cho ng­¬i sao? §Êt n­íc ®ang chinh chiÕn, h·y ®Õn <color=yellow>Thiªn M«n TrËn - Tµi nguyªn chiÕn hoµn thµnh 2 nhiÖm vô trong ngµy<color> råi ®Õn gÆp ta! §Ó xem ng­¬i cã xøng ®¸ng hay kh«ng!"
	Talk(4,"trans_talk_09_01",str1,str2,str3,str4)
end

function trans_talk_09_01()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 8  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	SetTaskTrans()
	Talk(1,"","TiÓu bèi sÏ ®i ngay!")	
	TaskTip("Hoµn thµnh 2 nhiÖm vô Tèng Liªu Tµi Nguyªn ChiÕn råi quay l¹i gÆp Minh Chñ Kim S¬n.")
end

function trans_talk_10()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 10  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local str = "Xem ra ng­¬i còng lµ mét nam tö h¸n cã lßng trung hiÕu víi ®Êt n­íc. §­îc, h·y lµm thªm cho ta 1 nhiÖm vô n÷a! Vâ l©m hiÖn ®ang lo¹n l¹c, c­êng hµo ¸c b¸ hoµnh hµnh kh¾p n¬i. H·y ®i tiªu diÖt <color=yellow>Th­¬ng ThÇn Doanh Thiªn, B¾c Lôc L©m Minh Chñ vµ L·nh H­¬ng L¨ng<color>, mang tÝn vËt cña chóng vÒ ®©y cho ta!"
	Say(str,2,"TiÓu bèi tu©n lÖnh!/trans_talk_10_01","TiÓu bèi suy nghÜ l¹i ®·./nothing")	
end

function trans_talk_10_01()
	SetTask(2126, 0)
	SetTask(345, 0)
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 10  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	if BigDelItem(2, 0, 399, BigGetItemCount(2,0,399)) == 1 and BigDelItem(2, 0, 400, BigGetItemCount(2,0,400)) == 1 and BigDelItem(2, 0, 401, BigGetItemCount(2,0,401)) == 1 then
		SetTaskTrans()
		Talk(1,"","Tèt l¾m, qu¶ cã khÝ kh¸i nam nhi!")	
		TaskTip("Mang B¾c Lôc L©m lÖnh, Trôc ¶nh th­¬ng vµ TuyÖt t×nh th¹ch giao cho Minh Chñ Kim S¬n.")
	end
end

function trans_talk_11()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 11  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end	
	if GetItemCount(2,0,399) > 0 and GetItemCount(2,0,400) > 0 and GetItemCount(2,0,401) > 0 then
		if DelItem(2,0,399,1) == 1 and DelItem(2,0,400,1) ==1 and DelItem(2,0,401,1) == 1 then
			SetTaskTrans()
			Talk(1,"trans_talk_12",szNpcName.."Ha ha ta qu¶ kh«ng nh×n lÇm ng­¬i. Ng­¬i qu¶ thËt cã t­ chÊt lÜnh héi thøc thø 2 cña Hçn Nguyªn C«ng <color=yellow>ThÇn H×nh Thñ ChÝnh<color>.")
		end
	else
		Talk(1,"",szNpcName.."Th­¬ng ThÇn Doanh Thiªn, B¾c Lôc L©m Minh Chñ vµ L·nh H­¬ng L¨ng kh«ng dÔ ®èi phã! Ng­¬i h·y cÈn thËn.")
		return
	end
end

function trans_talk_12()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 12  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
						"§Ö tö muèn tu luyÖn theo h­íng Long Tö!/#select_translife(1)",
						"§Ö tö muèn tu luyÖn theo h­íng Hæ Tö!/#select_translife(2)",
						"§Ö tö muèn tu luyÖn theo h­íng Phông Tö!/#select_translife(4)",
						"§Ö tö muèn tu luyÖn theo h­íng ¦ng Tö!/#select_translife(3)",
						"Giíi thiÖu c¸c h­íng tu luyÖn/view_info",
						"V·n bèi suy nghÜ l¹i ®·./nothing",
					}
	Say(szNpcName.."<color=yellow>ThÇn H×nh Thñ ChÝnh<color> tËp trung khÝ ©m d­¬ng trong c¬ thÓ, h×nh thµnh hé khÝ. Ng­êi luyÖn ®­îc 2 thµnh nµy ®ao th­¬ng bÊt nhËp. Ng­¬i muèn tu luyÖn theo h­íng nµo? <color=red>Chó ý: ThÇn H×nh Thñ ChÝnh nÕu tu luyÖn theo h­íng ¦ng Tö sÏ luyÖn thµnh Bá Qua Phßng Ngù §èi Ph­¬ng<color>",getn(tSay),tSay)	
end

function trans_talk_13()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 13  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end	
	if GetLevel() < TRANSLIFE_LEVEL then
		Talk(1,"",szNpcName.."Ng­¬i vÉn ch­a luyÖn thµnh th¹o ThÇn Hinh Thñ ChÝnh µ?")
		return
	end	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Ph¶i gia nhËp hÖ ph¸i míi cã thÓ tu luyÖn!")
		return
	end	
	local tSay = 	{
							"Xin Minh Chñ chØ ®Ö tö n¬i ë cña §¶o Chñ §¶o §µo Hoa?/trans_talk_13_01",
							"V·n bèi suy nghÜ l¹i ®·./nothing",
						}
	Say(szNpcName.."Ng­¬i ®· luyÖn <color=yellow>ThÇn H×nh Thñ ChÝnh<color> thµnh th¹o råi sao? Qu¶ lµ kú tµi hiÕm thÊy! Ta kh«ng cßn g× ®Ó truyÒn d¹y ng­¬i n÷a. H·y ®i t×m <color=yellow>§¶o Chñ §¶o §µo Hoa<color> thØnh gi¸o tiÕp <color=yellow>Hçn Tôc Hßa Quang<color> ®i.",getn(tSay),tSay)
end

function trans_talk_13_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 13  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end	
	SetTaskTrans()
	Talk(1,"",szNpcName.."HiÖn t¹i ta còng kh«ng biÕt tung tÝch cña l·o Êy. Ng­¬i thö hái B¹ch Tiªn Sinh xem sao!")
	TaskTip("T×m B¹ch Tiªn Sinh hái n¬i ë cña §¶o Chñ §¶o §µo Hoa")
end

function trans_talk_14()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 14  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end	
	SetTaskTrans()
	Talk(2,"",szNpcName.."§¶o Chñ §¶o §µo Hoa? Ta nghe nãi l·o Êy kh«ng cßn ë §¶o §µo Hoa n÷a. Ng­¬i t×m <color=yellow>ThuyÒn phu §«ng H¶i<color> hái th¨m chç ë cña l·o Êy xem. H¾n th­êng xuyªn ®i biÓn ch¾c biÕt n¬i ë cña l·o Êy!", "§a t¹ l·o tiÒn bèi, v·n bèi lªn ®­êng ngay!")
	TaskTip("T×m ThuyÒn phu §«ng H¶i hái n¬i ë cña §¶o Chñ §¶o §µo Hoa")
end

function trans_talk_15()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 15  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end	
	local tSay = 	{
							"Ta ®ång ý!/trans_talk_15_01",
							"§Ó ta suy nghÜ l¹i/nothing",
						}
	Say(szNpcName.."§¶o Chñ §µo Hoa §¶o? Ta cã biÕt vÞ cao nh©n nµy. NÕu ng­¬i cho ta <color=yellow>500 vµng<color> ta sÏ chØ n¬i ë cña «ng Êy cho ng­¬i!",getn(tSay),tSay)
end

function trans_talk_15_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 15  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end	
	if GetCash() < 5000000 then
		Talk(1,"",szNpcName.."500 vµng cña ta ®©u?")
		return
	end
	if Pay(5000000) == 1 then
		Talk(1,"",szNpcName.."Ha ha xin ®a t¹! Ng­¬i qu¶ lµ hµo phãng! §­îc, cao nh©n Êy hiÖn ®ang Èn c­ t¹i <color=yellow>C« §¶o<color>. Ng­¬i thö ®Õn ®ã hái th¨m tin tøc xem.")
		SetTaskTrans()
		TaskTip("§i thuyÒn ®Õn C« §¶o t×m gÆp §¶o Chñ §¶o §µo Hoa")	
	end
end

function trans_talk_16()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 16  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end	
	Talk(4,"trans_talk_16_01","V·n bèi m¹n phÐp hái l·o cao nh©n ®©y cã ph¶i §¶o Chñ §¶o §µo Hoa?",szNpcName.."Ng­¬i t×m ta cã viÖc g×?","V·n bèi nghe danh cao nh©n ®· l©u, nay muèn gÆp cao nh©n ®Ó thØnh gi¸o chiªu thøc thø 3 cña Hçn Nguyªn C«ng <color=yellow>Hçn Tôc Hßa Quang<color>. Xin cao nh©n truyÒn thô!",szNpcName.."...")	
end

function trans_talk_16_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 16  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"V·n bèi ®ång ý/trans_talk_16_02",
							"V·n bèi suy nghÜ l¹i/nothing",
						}
	Say(szNpcName.."Th«i ®­îc råi, thÊy ng­¬i còng thµnh t©m ®Õn gÆp ta. Ta ®ång ý truyÒn thô thøc thø 3 cña Hçn Nguyªn C«ng cho ng­¬i. Nh­ng ng­¬i ph¶i hoµn thµnh c¸c yªu cÇu cña ta! Tr­íc hÕt h·y mang <color=yellow>B¾c Lôc L©m lÖnh, Trôc ¶nh th­¬ng vµ TuyÖt t×nh th¹ch<color> vÒ ®©y gÆp ta. NÕu ng­¬i ®ñ søc ®¸nh b¹i chóng th× ta sÏ truyÒn d¹y.",getn(tSay),tSay)
end

function trans_talk_16_02()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 16  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	if BigDelItem(2, 0, 399, BigGetItemCount(2,0,399)) == 1 and BigDelItem(2, 0, 400, BigGetItemCount(2,0,400)) == 1 and BigDelItem(2, 0, 401, BigGetItemCount(2,0,401)) == 1 then
		SetTaskTrans()
		SetTask(2126, 0)
		SetTask(345, 0)
		Talk(1,"",szNpcName.."Tèt l¾m, ta ë ®©y ®îi tin ng­¬i!")	
		TaskTip("Mang B¾c Lôc L©m lÖnh, Trôc ¶nh th­¬ng vµ TuyÖt t×nh th¹ch giao cho §¶o Chñ §¶o §µo Hoa")
	end
end

function trans_talk_17()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 17 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	if GetItemCount(2,0,399) > 0 and GetItemCount(2,0,400) > 0 and GetItemCount(2,0,401) > 0 then
		if DelItem(2,0,399,1) == 1 and DelItem(2,0,400,1) ==1 and DelItem(2,0,401,1) == 1 then
			SetTaskTrans()
			Talk(1,"trans_talk_18",szNpcName.."Ng­¬i qu¶ thËt cã t­ chÊt lÜnh héi thøc thø 3 cña Hçn Nguyªn C«ng <color=yellow>Hçn Tôc Hßa Quang<color>.")
		end
	else
		Talk(1,"",szNpcName.."Th­¬ng ThÇn Doanh Thiªn, B¾c Lôc L©m Minh Chñ vµ L·nh H­¬ng L¨ng kh«ng dÔ ®èi phã! Ng­¬i h·y cÈn thËn.")
		return
	end
end

function trans_talk_18()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 18 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"V·n bèi ®ång ý!/trans_talk_18_01",
							"V·n bèi suy nghÜ l¹i/nothing",
						}
	Say(szNpcName.."H·y tiÕp tôc lµm cho ta c¸c nhiÖm vô sau ®©y:\nHoµn thµnh Tèng Liªu Tµi Nguyªn ChiÕn: <color=yellow>48 lÇn<color>\nTrång thµnh c«ng H¹t Gièng: <color=yellow>192 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Nhá: <color=yellow>128 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Lín: <color=yellow>64 lÇn<color>\n\nSau khi hoµn thµnh nhiÖm vô quay vÒ gÆp ta!",getn(tSay),tSay)
end


function trans_talk_18_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 18 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	SetTaskTrans()
	Talk(1,"",szNpcName.."Thö th¸ch lÇn nµy cÇn nhiÒu thêi gian ®Ó rÌn luyÖn tÝnh kiªn tr× cña ng­¬i!")
	TaskTip("Hoµn thµnh c¸c yªu cÇu cña §¶o Chñ §¶o §µo Hoa")
end

function trans_talk_19()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 19 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local nResWar = gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1)
	local nSeed = gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2)
	local nSmallSeed = gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3)
	local nBigSeed = gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4)
	
	if nResWar == 48 and nSeed == 192 and nSmallSeed == 128 and nBigSeed == 64 then
		SetTask(TRANSLIFE_TASK_34,0)
		SetTaskTrans()
		Talk(3,"trans_talk_20",szNpcName.."Thö th¸ch khã vËy ng­¬i còng cã thÓ hoµn thµnh sao?",szNpcName.."...",szNpcName.."§­îc, h·y thùc hiÖn thö th¸ch cuèi cïng cña ta!")
	else
		Talk(1,"",format(szNpcName.."Sè lÇn hoµn thµnh nhiÖm vô:\nHoµn thµnh Tèng Liªu Tµi Nguyªn ChiÕn: <color=yellow>%s/48 lÇn<color>\nTrång thµnh c«ng H¹t Gièng: <color=yellow>%s/192 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Nhá: <color=yellow>%s/128 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Lín: <color=yellow>%s/64 lÇn<color>",nResWar,nSeed,nSmallSeed,nBigSeed))
	end
end

function trans_talk_20()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 20 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"V·n bèi ®ång ý!/trans_talk_20_01",
							"V·n bèi suy nghÜ l¹i/nothing",
						}
	Say(szNpcName.."Trªn C« §¶o nµy ta cã tæ chøc so tµi B¹n §ång Hµnh. Ng­¬i còng cã B¹n §ång Hµnh ph¶i kh«ng? H·y hç trî B¹n §ång Hµnh cña ng­¬i <color=yellow>chiÕn th¾ng 4 trËn so tµi<color> vµ rÌn luyÖn B¹n §ång Hµnh <color=yellow> 200 ®iÓm Linh Lùc<color> råi ®Õn gÆp ta.",getn(tSay),tSay)
end

function trans_talk_20_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 20 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	SetTaskTrans()
	Talk(1,"","B¹n §ång Hµnh rÊt quan träng trªn ®­êng hµnh tÈu giang hå. H·y ch¨m sãc tèt B¹n §ång Hµnh!")
	TaskTip("ChiÕn th¾ng 4 trËn so tµi B¹n §ång Hµnh ®Ó hoµn thµnh yªu cÇu cña §¶o Chñ §¶o §µo Hoa")
end

function trans_talk_21()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 21 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	if GetTask(TRANSLIFE_TASK_34) ~= 4 then
		Talk(1,"",szNpcName.."Mau ®i so tµi B¹n §ång Hµnh!")
		return
	end
	if floor(GetTask(TASK_VNG_PET_GODPOINT)/100) < 200 then
		Talk(1,"",szNpcName.."B¹n §ång Hµnh cña ng­¬i ch­a tu luyÖn ®ñ 200 ®iÓm Linh Lùc!")
		return
	end	
	SetTaskTrans()
	SetTask(TRANSLIFE_TASK_34,0)
	Talk(1,"",szNpcName.."Ha ha ng­¬i qu¶ xøng ®¸ng ®­îc truyÒn thô thøc thø 3 cña Hçn Nguyªn C«ng <color=yellow>Hçn Tôc Hßa Quang<color>. H·y ®em <color>1 Th¸i DÞch Hçn Nguyªn Phæ<color> ®Õn ®Ó b¾t ®Çu tu luyÖn!")
	TaskTip("Mang 1 Th¸i DÞch Hçn Nguyªn Phæ ®Õn cho §¶o Chñ §¶o §µo Hoa")
end

function trans_talk_22()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 22 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"V·n bèi muèn tu luyÖn theo h­íng Long Tö!/#select_translife(1)",
							"V·n bèi muèn tu luyÖn theo h­íng Hæ Tö!/#select_translife(2)",
							"V·n bèi muèn tu luyÖn theo h­íng Phông Tö!/#select_translife(4)",
							"V·n bèi muèn tu luyÖn theo h­íng ¦ng Tö!/#select_translife(3)",
							"Giíi thiÖu c¸c h­íng tu luyÖn/view_info",
							"V·n bèi suy nghÜ l¹i ®·./nothing",
						}
	Say(szNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end

function select_translife(nType)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc chuyÓn sinh")
		return
	end	
	if nType <= 0 then
		return
	end
	--if GetExp() < TRANSLIFE_EXP then
	--	Talk(1,"",szNpcName.."Ng­¬i ch­a ®ñ 2 tû ®iÓm kinh nghiÖm, lµm sao ta truyÒn d¹y ®­îc?")
	--	return
	--end	
	if gf_JudgeRoomWeight(5,300,szNpcName) == 0 then
		return
	end
	if GetTranslifeCount() == 3 and GetTaskTrans() == 30 then
		local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
		if nCurPetLevel < 4 then
			Talk(1,"",szNpcName.."Ng­¬i ph¶i cã kü n¨ng B¹n §ång Hµnh cÊp 4 trë lªn míi cã thÓ tu luyÖn Hçn Nguyªn C«ng thµnh thø 8!")
		return
		end
	end
	if GetCash() < 10000000 and GetTranslifeCount() == 4 and GetTaskTrans() == 36 then
			Talk(1,"","TiÒn trong hµnh trang cña b¹n kh«ng ®ñ !!")
			return
	end
--	if GetTranslifeCount() == 4 and GetTaskTrans() == 35 then
--		local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--		if nCurPetLevel < 4  or GetCash() <10000000 then
--			Talk(1,"",szNpcName.."Ng­¬i ph¶i cã kü n¨ng B¹n §ång Hµnh cÊp 4 vµ trong hµnh trang ph¶i cã 1000 vµng  trë lªn míi cã thÓ tu luyÖn Hçn Nguyªn C«ng thµnh thø 10!")
--		return
--		end
--	end
	if GetTranslifeCount() > 0 then
		if GetItemCount(2,0,1083) < 1 then
			Talk(1,"",szNpcName.."Ph¶i cã Th¸i DÞch Hçn Nguyªn Phæ míi chØ dÉn ng­¬i tu luyÖn ®­îc!")
			return
		end
		DelItem(2,0,1083,1)
	end
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	
	--ModifyExp(-2000000000)
	-- Trõ vµng cho nhiÖm vô chuyÓn sinh 5
	if GetTranslifeCount() == 4 and GetTaskTrans() == 36 then
		Pay(10000000)
	end
	
	local nRoute = GetPlayerRoute()
	-- Set sè lÇn chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, gf_GetTaskByte(TRANSLIFE_TASK_ID,TRANSLIFE_BYTE_COUNT) +1)
	-- Set h­íng chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	
	if GetTranslifeCount() == 1 and GetTaskTrans() == 6 then			
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nhËn ngo¹i trang",0,1)
		end
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		if GetStoreBoxPageCount() < 4 then
			SetStoreBoxPageCount(GetStoreBoxPageCount()+1);
		end
		SetTaskTrans()
		ResetProperty()
		SetLevel(90,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø nhÊt...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 2 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
	elseif GetTranslifeCount() == 2 and GetTaskTrans() == 12  then		
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nhËn ngo¹i trang",0,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		SetTaskTrans()
		ResetProperty()
		SetLevel(88,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø hai...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 4 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	elseif GetTranslifeCount() ==3 and GetTaskTrans() == 22 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, Pnew, nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"V¨n Sö Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		SetTaskTrans()
		ResetProperty()
		SetLevel(86,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø ba...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 6 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	elseif GetTranslifeCount() == 4 and GetTaskTrans() == 30 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (561 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Thiªn ¢m Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		SetTaskTrans()
		ResetProperty()
		SetLevel(84,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø t­...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 8 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
	elseif  GetTranslifeCount() == 5 and GetTaskTrans() == 36 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 561 + GetBody()
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		SetTaskTrans()
		ResetProperty()
		SetLevel(79,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø t­...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 8 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
	else
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng qu¶ lµ tuyÖt thÕ vâ c«ng cña trung nguyªn!")
		return
	end	
end

function get_translife_item()
	if GetTranslifeCount() <= 0 or GetTaskTrans() <= 0 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return	
	end	
	Say(szNpcName.."Ng­¬i muèn lÊy l¹i Ên tÝn vµ ngo¹i trang ph¶i kh«ng?",2,"V·n bèi ®· lµm mÊt, xin tiÒn bèi giao l¹i!/confirm_get_translife_item","Kh«ng cã g×/nothing")	
end

function confirm_get_translife_item()
	if GetTranslifeCount() <= 0 or GetTaskTrans() <= 0 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return	
	end
	--if GetTask(336) < 100 then
	--	Talk(1,"",szNpcName.."CÇn 100 ®iÓm S­ M«n ®Ó nhËn l¹i vËt phÈm.")
	--	return	
	--end
	if gf_JudgeRoomWeight(5,300,szNpcName) == 0 then
		return
	end	

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	local nTransCount = GetTranslifeCount()	
	local nType = GetTranslifeFaction()	
	---------chuyÓn sinh 6
	if GetPlayerRebornParam(0) == 1 then
		local nType_cs6 = GetPlayerRebornParam(1)
		local nBody = GetBody()	
		gf_AddItemEx(tb_translife_seal_cs6[nType_cs6][2], tb_translife_seal_cs6[nType_cs6][1])		
		--if GetLevel() < 79 then
		--	Talk(1,"","§¹i hiÖp ch­a ®ñ yªu cÇu ®Ó nhËn l¹i trang bÞ")	
		--	return
		--end
		--SetTask(336,GetTask(336) - 100)
		Msg2Player("B¹n bÞ trõ 100 ®iÓm s­ m«n.")
	--	local nType_cs6 = GetPlayerRebornParam(1) -- xãa trang bi CS6
	--	local nBody_cs6 = GetBody()
		for i=1, getn(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][i])
			--P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end					
		for i = 1, 3 do
			gf_AddItemEx(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][i], "NhËn l¹i trang bÞ")
		end
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		--	gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
		end				
		Talk(1,"","§©y lµ nh÷ng vËy quý gi¸, lÇn sau cÈn thËn ko ®Ó mÊt n÷a ®Êy!")	
		WriteLogEx("Chuyen Sinh","nhËn l¹i Ên vµ ngo¹i trang chuyÓn sinh theo h­íng "..tb_translife_seal[nType_cs6][3])		
		return
	end
	---------chuyÓn sinh 7
	if GetPlayerRebornParam(0) == 2 then
		local nType_cs7 = GetPlayerRebornParam(1)
		local nBody = GetBody()	
		gf_AddItemEx(tb_translife_seal_cs6[nType_cs7][2], tb_translife_seal_cs6[nType_cs7][1])		
		--if GetLevel() < 79 then
		--	Talk(1,"","§¹i hiÖp ch­a ®ñ yªu cÇu ®Ó nhËn l¹i trang bÞ")	
		--	return
		--end
		--SetTask(336,GetTask(336) - 100)
		Msg2Player("B¹n bÞ trõ 100 ®iÓm s­ m«n.")
	--	local nType_cs6 = GetPlayerRebornParam(1) -- xãa trang bi CS6
	--	local nBody_cs6 = GetBody()
		for i=1, getn(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i])
			--P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end					
		for i = 1, 3 do
			gf_AddItemEx(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i], "NhËn l¹i trang bÞ")
		end
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		--	gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
		end				
		Talk(1,"","§©y lµ nh÷ng vËy quý gi¸, lÇn sau cÈn thËn ko ®Ó mÊt n÷a ®Êy!")	
		WriteLogEx("Chuyen Sinh","nhËn l¹i Ên vµ ngo¹i trang chuyÓn sinh 7 theo h­íng "..tb_translife_seal[nType_cs6][3])		
		return
	end	
	---------------
	gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
	for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
		local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
		P = P + GetBody() - 1
		lvatt3 = lvatt3 or 0
		att3 = att3 or 0
		BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
	end	
	--SetTask(336,GetTask(336) - 100)	
	Msg2Player("B¹n bÞ trõ 100 ®iÓm s­ m«n.")	
	Talk(1,"",szNpcName.."§©y lµ nh÷ng vËy quý gi¸, lÇn sau cÈn thËn ko ®Ó mÊt n÷a ®Êy!")	
	WriteLogEx("Chuyen Sinh","nhËn l¹i Ên vµ ngo¹i trang chuyÓn sinh lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
end


function trans_talk_24()
	SetTaskTrans()
	Talk(1,"",szNpcName.."Ta sÏ chê tin cña c¸c h¹!")
	TaskTip("§Õn t×m B¹ch Tiªn Sinh ®Ó hái th¨m tin tøc.")
end


function trans_talk_25()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 25 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"V·n bèi ®ång ý!/trans_talk_25_01",
							"§Ó v·n bèi suy nghÜ l¹i/nothing",
						}
	Say(szNpcName.."H·y lµm cho ta c¸c nhiÖm vô sau ®©y:\nHoµn thµnh Tèng Liªu Tµi Nguyªn ChiÕn: <color=yellow>80 lÇn<color>\nTrång thµnh c«ng H¹t Gièng: <color=yellow>480 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Nhá: <color=yellow>320 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Lín: <color=yellow>160 lÇn<color>\n\nSau khi hoµn thµnh nhiÖm vô quay vÒ gÆp ta!", getn(tSay), tSay)
end


function trans_talk_25_01()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 25 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	SetTaskTrans()
	Talk(1,"",szNpcName.."Thö th¸ch lÇn nµy cÇn nhiÒu thêi gian ®Ó rÌn luyÖn tÝnh kiªn tr× cña ng­¬i!")
	TaskTip("Hoµn thµnh c¸c yªu cÇu cña B¹ch Tiªn Sinh")
end


function trans_talk_26()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 26 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local nResWar = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK1) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1)
	local nSeed = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2)
	local nSmallSeed = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) 
	local nBigSeed = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) 
	
	if nResWar == 80 and nSeed == 480 and nSmallSeed == 320 and nBigSeed == 160 then
		SetTask(TRANSLIFE_TASK_34, 0)
		SetTask(TRANSLIFE_TASK_34_FLAG, 0)
		SetTaskTrans()
		Talk(3,"trans_talk_27",szNpcName.."Thö th¸ch khã vËy ng­¬i còng cã thÓ hoµn thµnh sao?",szNpcName.."...",szNpcName.."§­îc, h·y thùc hiÖn thö th¸ch cuèi cïng cña ta!")
	else
		Talk(1,"",format(szNpcName.."Sè lÇn hoµn thµnh nhiÖm vô:\nHoµn thµnh Tèng Liªu Tµi Nguyªn ChiÕn: <color=yellow>%s/80 lÇn<color>\nTrång thµnh c«ng H¹t Gièng: <color=yellow>%s/480 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Nhá: <color=yellow>%s/320 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Lín: <color=yellow>%s/160 lÇn<color>",nResWar,nSeed,nSmallSeed,nBigSeed))
	end
end


function trans_talk_27()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 27 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	SetTaskTrans()
	Talk(1,"",szNpcName.."Nghe ®ån ThÇn Thó t¹i TuyÒn Ch©u ®ang cÇn mét sè b¶o vËt, ng­¬i h·y ®i t×m ®Ó thö søc!")
	TaskTip("T×m ThÇn Thó t¹i TuyÒn Ch©u ®Ó nhËn nhiÖm vô")
end


function trans_talk_28()
	local szName = ""
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	local szNpcName = "<color=green>"..szName.." :<color>"
	
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 28 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	
	local szHeader = "§¹i hiÖp h·y khiªu chiÕn B¾c Lôc L©m Minh Chñ, Th­¬ng ThÇn Doanh Thiªn, L·nh H­¬ng L¨ng vµ mang vÒ cho ta 3 tÝn vËt B¾c Lôc L©m lÖnh, Trôc ¶nh th­¬ng vµ TuyÖt t×nh th¹ch."
	local tSay = 	{
							"Ta sÏ ®i ngay!/trans_talk_28_01",
							"§Ó ta suy nghÜ l¹i/nothing",
						}
	Say(szNpcName..szHeader, getn(tSay), tSay)
end


function trans_talk_28_01()
	local szName = ""
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	local szNpcName = "<color=green>"..szName.." :<color>"
	
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 28 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	if BigDelItem(2, 0, 399, BigGetItemCount(2,0,399)) == 1 and BigDelItem(2, 0, 400, BigGetItemCount(2,0,400)) == 1 and BigDelItem(2, 0, 401, BigGetItemCount(2,0,401)) == 1 then
		SetTaskTrans()
		Talk(1,"",szNpcName.."H·y gi÷ m×nh cÈn thËn, tèt nhÊt h·y t×m tæ ®éi ®Ó cïng lµm nhiÖm vô nµy!")
		TaskTip("Mang B¾c Lôc L©m lÖnh, Trôc ¶nh th­¬ng vµ TuyÖt t×nh th¹ch giao cho ThÇn Thó.")
	end
end


function trans_talk_29()
	local szName = ""
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	local szNpcName = "<color=green>"..szName.." :<color>"
	
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 29  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	
	if GetItemCount(2,0,399) > 0 and GetItemCount(2,0,400) > 0 and GetItemCount(2,0,401) > 0 then
		if DelItem(2,0,399,1) == 1 and DelItem(2,0,400,1) ==1 and DelItem(2,0,401,1) == 1 then
			SetTaskTrans()
			Talk(1,"", szNpcName.."Ha ha ta qu¶ kh«ng nh×n lÇm ng­¬i. Ng­¬i qu¶ thËt cã t­ chÊt lÜnh héi thøc thø 8 cña Hçn Nguyªn C«ng <color=yellow>§én Nhiªn V« CÊu<color>, h·y ®i t×m B¹ch Tiªn Sinh ®Ó hoµn thµnh tu luyÖn.")
			TaskTip("Quay vÒ t×m B¹ch Tiªn Sinh ®Ó hoµn thµnh tu luyÖn vâ c«ng.")
		end
	else
		Talk(1,"",szNpcName.."Th­¬ng ThÇn Doanh Thiªn, B¾c Lôc L©m Minh Chñ vµ L·nh H­¬ng L¨ng kh«ng dÔ ®èi phã! Ng­¬i h·y cÈn thËn, khi nµo cã tÝn vËt h·y mang vÒ ngay cho ta.")
		return
	end
end


function trans_talk_30()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 30 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"V·n bèi muèn tu luyÖn theo h­íng Long Tö!/#select_translife(1)",
							"V·n bèi muèn tu luyÖn theo h­íng Hæ Tö!/#select_translife(2)",
							"V·n bèi muèn tu luyÖn theo h­íng Phông Tö!/#select_translife(4)",
							"V·n bèi muèn tu luyÖn theo h­íng ¦ng Tö!/#select_translife(3)",
							"Giíi thiÖu c¸c h­íng tu luyÖn/view_info",
							"V·n bèi suy nghÜ l¹i ®·./nothing",
						}
	Say(szNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end


function trans_talk_32()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 32 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	if GetLevel() < TRANSLIFE_LEVEL then
		Talk(1,"",szNpcName.."Ng­¬i vÉn ch­a luyÖn thµnh th¹o §én Nhiªn V« CÊu µ?")
		return
	end	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Ph¶i gia nhËp hÖ ph¸i míi cã thÓ tu luyÖn!")
		return
	end	
	str1 = szNpcName.."§¹i hiÖp muèn C¶i l·o hoµn ®ång? Tr­íc tiªn ph¶i ®¸nh b¹i ®­îc Ng« ViÖt L·o Tæ. Nghe nãi Ng« ViÖt L·o Tæ lang thang ®©u ®ã trong Thiªn S­ ®éng t©ng 2. H·y mau t×m vµ tiªu diÖt."
	Talk(1, "trans_talk_32_01", str1)
end


function trans_talk_32_01()
	local tSay = 	{
							"V·n bèi muèn häc Hçn Nguyªn C«ng/trans_talk_32_01_01",
							"N¨ng lùc v·n bèi cßn h¹n chÕ!/nothing",	
						}
	local strSay = szNpcName.."<color=green>Ch­ëng m«n nh¾c ®Õn Ng« ViÖt L·o Tæ vµ h­íng dÉn ng­êi ch¬i ®Õn gÆp §Ö tö C«n L«n thÇn bÝ t¹i (Thiªn s­ ®éng tÇng 2-(197,178)) ®Ó t×m c¸ch ®¸nh b¹i Ng«ViÖtL·oTæ."
	Say(strSay,getn(tSay),tSay)
end


function trans_talk_32_01_01()
	SetTaskTrans()
	TaskTip("§Õn gÆp §Ö tö C«n L«n thÇn bÝ t¹i (Thiªn s­ ®éng tÇng 2-(197,178)) ®Ó t×m c¸ch ®¸nh b¹i Ng« ViÖt L·oTæ")
end


function trans_talk_33()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 33 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"Häc c¸ch ®¸nh b¹i Ng« ViÖt L·o Tæ/trans_talk_33_01",
							"N¨ng lùc ta cßn h¹n chÕ!/nothing",	
						}
	local strSay = szNpcName.."C¸ch ®¸nh b¹i Ng« ViÖt L·oTæ."
	Say(strSay,getn(tSay),tSay)
end


function trans_talk_33_01()
	SetTaskTrans()
	TaskTip("§Õn gÆp B¹ch Tiªn Sinh häc c¸ch ®¸nh b¹i Ng« ViÖt L·oTæ!")
end


function trans_talk_34()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 34 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"NhiÖm vô l·nh héi ch©n khÝ/trans_talk_34_01",
							"Tr¶ nhiÖm vô l·nh héi ch©n khÝ/trans_talk_34_02",
							"N¨ng lùc ta cßn h¹n chÕ!/nothing",	
						}
	
	local strSay = szNpcName.."H·y mau hoµn thµnh nhiÖm vô : \nHoµn thµnh ®i Thiªn M«n TrËn <color=yellow>80<color> lÇn \nHoµn thµnh ®i L­¬ng S¬n B¹c <color=yellow>60<color> lÇn\nSö dông <color=yellow>2000<color> n÷ oa b¶o h¹p \nTrång thµnh c«ng <color=yellow>320<color> c©y b¸t nh· nhá\nTrång thµnh c«ng <color=yellow>500<color> h¹t gièng \nTrång thµnh c«ng <color=yellow>69<color> c©y tø linh"
	Say(strSay,getn(tSay),tSay)
end


function trans_talk_34_01()
	Talk(1,"",szNpcName.."Thö th¸ch lÇn nµy cÇn nhiÒu thêi gian ®Ó rÌn luyÖn tÝnh kiªn tr× cña ng­¬i!H·y mau hoµn thµnh nhiÖm vô : \nHoµn thµnh ®i Thiªn M«n TrËn <color=yellow>80<color> lÇn \nHoµn thµnh ®i L­¬ng S¬n B¹c <color=yellow>60<color> lÇn\nSö dông <color=yellow>2000<color> N÷ Oa B¶o H¹p \nTrång thµnh c«ng <color=yellow>320<color> c©y b¸t nh· nhá\nTrång thµnh c«ng <color=yellow>500<color> h¹t gièng \nTrång thµnh c«ng <color=yellow>69<color> c©y tø linh")
	TaskTip("H·y mau hoµn thµnh nhiÖm vô :Hoµn thµnh ®i Thiªn M«n TrËn 80 lÇn, Hoµn thµnh ®i L­¬ng S¬n B¹c 60,Sö dông 2000, N÷ Oa B¶o H¹p ,Trång thµnh c«ng 320c©y b¸t nh· nhá, Trång thµnh c«ng 500 h¹t gièng ,Trång thµnh c«ng 69 c©y tø linh")
end


function trans_talk_34_02()
	local nSeed = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2)
	local nSmallTree = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) 
	local nTMT_Times = gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1)
	local nLSB_Times = gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK2)
	local n4Soul_Times = gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3)
	local nUseBaoHe = GetTask(TRANSLIFE_TASK_5_2)
	if nSeed == 500 and nSmallTree == 320 and nTMT_Times == 80 and nLSB_Times == 60 and n4Soul_Times == 69 and nUseBaoHe == 2000  then
		SetTask(TRANSLIFE_TASK_34, 0)
		SetTask(TRANSLIFE_TASK_34_FLAG, 0)
		SetTask(TRANSLIFE_TASK_5_1,0)
		SetTask(TRANSLIFE_TASK_5_2,0)
		SetTaskTrans()
		TaskTip("H·y mau ®Õn gióp Hoµng Tö §oµn Tè ThuËn")
	else
		Talk(1,"",format(szNpcName.."Sè lÇn hoµn thµnh nhiÖm vô:\nTrång thµnh c«ng H¹t Gièng: <color=yellow>%s/500 lÇn<color>\nTrång thµnh c«ng B¸t Nh· Nhá: <color=yellow>%s/320 lÇn<color>\nHoµn thµnh ®i Thiªn m«n trËn : <color=yellow>%s/80 lÇn<color>\nHoµn thµnh ®i L­¬ng S¬n B¹c : <color=yellow>%s/60 lÇn<color>\nTrång thµnh c«ng C©y Tø Linh: <color=yellow>%s/69 lÇn<color>\n Sö dông N÷ Oa B¶o H¹p: <color=yellow>%s/2000 lÇn<color>",nSeed,nSmallTree,nTMT_Times,nLSB_Times,n4Soul_Times,nUseBaoHe))
	end
end


function trans_talk_35()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 35 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"NhiÖm vô tiªu diÖt hån ma L·nh H­¬ng L¨ng/trans_talk_35_01",
							"Tr¶ nhiÖm vô tiªu diÖt hån ma L·nh H­¬ng L¨ng/trans_talk_35_02",
							"N¨ng lùc ta cßn h¹n chÕ!/nothing",	
						}
	local strSay = szNpcName.."Hõmm ... nhanh vËy, Bæn Hoµng Tö ch­a tin ng­¬i cã thÓ lµm nhanh nh­ vËy, L·nh H­¬ng L¨ng rÊt tµn b¹o vµ hung ¸c , h·y thö søc lÇn n÷a xem sao"
	Say(strSay,getn(tSay),tSay)
end


function trans_talk_35_01()
	Talk(1,"",szNpcName.."L·nh H­¬ng L¨ng rÊt tµn b¹o vµ hung ¸c , h·y thö søc lÇn n÷a xem sao!")
	TaskTip("H·y mau hoµn thµnh nhiÖm vô tiªu diÖt L·nh H­¬ng L¨ng rÊt tµn b¹o vµ hung ¸c , h·y thö søc lÇn n÷a xem sao")
end


function trans_talk_35_02()
	if GetTask(TRANSLIFE_TASK_5_2) == 1 then
		SetTask(TRANSLIFE_TASK_5_2,0)
		SetTaskTrans()
		TaskTip("H·y mau ®Õn gÆp B¹ch Tiªn Sinh chän h­íng tu luyÖn")
	else
		Talk(1,"","Ng­¬i ch­a hoµn thµnh nhiÖm vô!")
	end
end


function trans_talk_36()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 36 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
	local tSay = 	{
							"V·n bèi muèn tu luyÖn theo h­íng Long Tö!/#select_translife(1)",
							"V·n bèi muèn tu luyÖn theo h­íng Hæ Tö!/#select_translife(2)",
							"V·n bèi muèn tu luyÖn theo h­íng Phông Tö!/#select_translife(4)",
							"V·n bèi muèn tu luyÖn theo h­íng ¦ng Tö!/#select_translife(3)",
							"Giíi thiÖu c¸c h­íng tu luyÖn/view_info",
							"V·n bèi suy nghÜ l¹i ®·./nothing",
						}
	Say(szNpcName.."<color=yellow>Sinh Tö V« Ng·<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end


function view_info()
	local str1 = szNpcName.."<color=green>Hçn Nguyªn C«ng<color> bao gåm 5 thøc, 10 thµnh. C¸c chiªu thøc gåm  <color=yellow>Hîp T­íng Quy Nguyªn - ThÇn H×nh Thñ ChÝnh - Hçn Tôc Hßa Quang - §én Nhiªn V« CÊu - Sinh Tö V« Ng·<color>. <color=green>Hçn Nguyªn C«ng<color> cã 4 h­íng tu luyÖn gåm <color=yellow>Long Tö, Hæ Tö, ¦ng Tö, Phông Tö<color>. Mçi h­íng tu luyÖn sÏ ®em l¹i hiÖu qu¶ kh¸c nhau."
	local str2 = szNpcName.."<color=yellow>Long Tö<color> dïng ch©n khÝ Long Tö Quang t¹o ra søc c«ng kÝch cùc lín, tÊn c«ng ®Þch thñ. Ng­êi tu luyÖn theo h­íng <color=yelow>Long Tö<color> cã thÓ gia t¨ng <color=yellow>C«ng KÝch, §é TËp Trung, ChÝnh X¸c<color>.\n<color=yellow>Hæ Tö<color> dïng ch©n khÝ Hæ Tö Quang t¹o ra bøc t­êng phßng ngù v÷ng ch¾c, gi¶m søc tÊn c«ng cña ®Þch thñ. Ng­êi tu luyÖn theo h­íng <color=yelow>Hæ Tö<color> cã thÓ gia t¨ng <color=yellow>Gi¶m Thä Th­¬ng, Néi Ngo¹i Phßng, Sinh Lùc, Néi Lùc<color>."
	local str3 = szNpcName.."<color=yellow>Phông Tö<color> dïng ch©n khÝ Phông Tö Quang ®em l¹i hiÖu qu¶ hç trî v« biªn, kÐo dµi hiÖu qu¶ c¸c chiªu thøc vâ c«ng. Ng­êi tu luyÖn theo h­íng <color=yelow>Phông Tö<color> cã thÓ gia t¨ng <color=yellow>X¸c SuÊt XuÊt Chiªu, §é TËp Trung, Thêi Gian Hç Trî TÊn C«ng, Thêi Gian Hç Trî Phßng Thñ<color>.\n<color=yellow>¦ng Tö<color> dïng ch©n khÝ ¦ng Tö Quang khiÕn cho th©n ph¸p nhÑ nhµng nh­ phong v©n, xuÊt chiªu ®Þch thñ kh«ng kÞp ph¶n øng. Ng­êi tu luyÖn theo h­íng <color=yelow>¦ng Tö<color> cã thÓ gia t¨ng <color=yellow>Bá Qua Phßng Ngù §èi Ph­¬ng, §é TËp Trung, ChÝnh X¸c<color>."
	Talk(3,"",str1,str2,str3)
end


function cs6_infor()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Ta ®ang n¾m gi÷ phÇn ®Çu cña bÝ kÝp <color=yellow>Tø Linh Phôc Sinh<color>, lÜnh ngé thµnh c«ng bé bÝ kÝp nµy cã thÓ gióp c¸c h¹ ®¹t ®Õn mét c¶nh giíi míi trong §¶ Th«ng Kinh M¹ch !!!"
		
	tinsert(tSay, "T¹i h¹ ®ñ c«ng lùc ®Ó lÜnh ngé bÝ kÝp/cs6_npc1_infor1")		
	tinsert(tSay, "C«ng lùc cña t¹i h¹ cßn yÕu/nothing")
	Say(tHeader, getn(tSay), tSay)
end


function cs6_npc1_infor1()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."§Ó lÜnh ngé bÝ kÝp <color=yellow>Tø Linh Phôc Sinh<color>, ®¹i hiÖp chØ cÇn cã ®ñ 4000 vµng, ®· tõng chuyÓn sinh Ýt nhÊt 1 lÇn vµ ph¶i gióp l·o phu lµm vµi nhiÖm vô th× l·o phu míi truyÒn thô phÇn ®Çu cña bÝ kÝp <color=yellow>Tø Linh Phôc Sinh<color> !!!"
		
	tinsert(tSay, "LÜnh ngé bÝ kÝp Tø Linh Phôc Sinh (tiªu hao 4000 vµng)/cs6_npc1_infor2")		
	tinsert(tSay, "C«ng lùc cña t¹i h¹ cßn yÕu/nothing")
	Say(tHeader, getn(tSay), tSay)
end


function cs6_npc1_infor2()
	--if GetTranslifeCount() < 6 and GetTaskTrans() == 36 then		--b¾t ®k and ®Ó kh«ng cho v« settask lªn 37 lÇn n÷a
	if GetTask(TSK_CS6_TULINH) < 1 then
		if GetTranslifeCount() < 1 then
			Talk(1,"","Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp kh«ng ®ñ ®Ó nhËn nhiÖm vô !!!!")
			return 0		
		end
--		if GetLevel() < 99 then
--			Talk(1,"","Kinh nghiÖm hµnh hiÖp trªn giang hå cña ®¹i hiÖp ch­a ®ñ ®Ó nhËn nhiÖm vô !!!!")
--			return 0		
--		end
--		if GetExp() < 2000000000 then
--			Talk(1,"","Kinh nghiÖm b«n tÈu trªn giang hå cña ®¹i hiÖp ch­a ®ñ ®Ó nhËn nhiÖm vô !!!!")
--			return 0		
--		end
		if GetCash() < 40000000 then
			Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ vµng ®Ó gióp ®ì l·o phu !!!!")
			return 0		
		end	
--		if MeridianGetLevel() < 2 then	
--			Talk(1,"","Kinh m¹ch cña ®¹i hiÖp ch­a ®¹t cÊp ®é Vâ T­íng !!!!")
--			return 0			
--		end
		Pay(40000000)
		SetTask(TSK_CS6_TULINH,1)	--b¾t ®Çu lµm nv chuyÓn sinh 6
		--SetTaskTrans() --®¹t møc 37, b¾t ®Çu lµm nv chuyÓn sinh 6
		local nSolanCS = GetTranslifeCount()
 		gf_WriteLogEx("CHUYEN SINH 6", "nhËn nhiÖm vô chuyÓn sinh 6", 1, "NhËn nv chuyÓn Sinh 6 npc 1: chuyÓn sinh lÇn "..nSolanCS)			
	end
	if GetTask(TSK_CS6_TULINH) > 1 then
		Talk(1,"","Ta ®· truyÒn thô phÇn ®Çu cña bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp råi, b©y giê ®¹i hiÖp h·y ®i t×m Viªn Quan Tho¸i NhiÖm ®Ó l·nh gi¸o phÇn cßn l¹i nha !!!!")
		return 0			
	end	
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."§¹i hiÖp qu¶ lµ mét kú nh©n trong Vâ L©m, b¾t ®Çu lÜnh ngé bÝ kÝp <color=yellow>Tø Linh Phôc Sinh<color> ®Ó ®ét ph¸ b×nh c¶nh. LÜnh ngé thµnh c«ng cã thÓ kich thÝch tiÒm lùc cña b¶n th©n ®¹t c¶nh giíi míi trong §¶ Th«ng Kinh M¹ch. Tr­íc tiªn ®¹i hiÖp h·y gióp l·o phu hoµn thµnh c¸c nhiÖm vô cøu gióp thiªn h¹, t¹o søc sèng cho quèc gia !!!"
		
	tinsert(tSay, "Hoµn thµnh nhiÖm vô /cs6_finish_npc1")			
	tinsert(tSay, "TiÕn ®é nhiÖm vô TrÞ Quèc - B×nh Thiªn H¹ /cs6_infor_nv_1")		
	tinsert(tSay, "TiÕn ®é nhiÖm vô ¦¬m MÇm Søc Sèng /cs6_infor_nv_2")		
	tinsert(tSay, "Ta chØ ghÐ th¨m/nothing")			
	Say(tHeader, getn(tSay), tSay)
end


function cs6_finish_npc1()
	local nCS6_CT = mod(GetTask(TSK_CS6_COUNTA),100)
	local nCS6_TA = mod(floor(GetTask(TSK_CS6_COUNTA)/100),100)
	local nCS6_TL = mod(GetTask(TSK_CS6_COUNTB),100)
	local nCS6_LD = mod(floor(GetTask(TSK_CS6_COUNTB)/100),100)
	local nMax = 30
	local nCS6_BNN =  mod(floor(GetTask(TSK_CS6_COUNTA)/10000),1000)	--B¸t nh· nhá
	local nCS6_HG =  mod(floor(GetTask(TSK_CS6_COUNTA)/10000000),1000)	--H¹t gièng
	local cCS6_TL =  mod(floor(GetTask(TSK_CS6_COUNTB)/10000),1000)		--Tø linh
	local nCS6_NS =  mod(floor(GetTask(TSK_CS6_COUNTB)/10000000),1000)		--Ng«i sao
	local nCS6_BH =  mod(floor(GetTask(TSK_CS6_GET1TIME)/1000),10000)		--N÷ oa b¶o h¹p
	if GetTask(TSK_CS6_TULINH) < 1 then
--	if GetTaskTrans() < 37 then
		Talk(1,"","§¹i hiÖp ch­a nhËn nhiÖm vô Tø Linh Phôc Sinh !!!!")
		return 0			
	end
	if GetTask(TSK_CS6_TULINH) > 1 then
		Talk(1,"","§¹i hiÖp ®· hoµn thµnh nhiÖm vô Tø Linh Phôc Sinh !!!!")
		return 0			
	end	
	--if nCS6_CT < nMax or nCS6_TA < nMax or nCS6_TL < nMax or nCS6_LD < nMax then
	--	Talk(1,"","§¹i hiÖp ch­a hoµn thµnh xong nhiÖm vô TrÞ Quèc - B×nh Thiªn H¹ !!!!")
	--	return 0	
	--end
	--if nCS6_BNN < 150 or nCS6_HG < 150 or cCS6_TL < 150 or nCS6_NS < 160 or nCS6_BH < 1000 then
	--	Talk(1,"","§¹i hiÖp ch­a hoµn thµnh xong nhiÖm vô ¦¬m MÇm Søc Sèng !!!!")
	--	return 0	
	--end	
	if GetTask(TSK_CS6_TULINH) == 1 then
		SetTask(TSK_CS6_TULINH,2)		--hoµn thµnh xong nhiÖm vô B¹ch Tiªn Sinh, ®i t×m Quan Viªn Tho¸i nhiÖm nhËn nv
		Talk(1,"","Ta ®· truyÒn thô phÇn ®Çu cña bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp råi, b©y giê ®¹i hiÖp h·y ®i t×m Viªn Quan Tho¸i NhiÖm ®Ó l·nh gi¸o phÇn cßn l¹i !!!!")
	 	gf_WriteLogEx("CHUYEN SINH 6", "finish nhiÖm vô chuyÓn sinh 6 lÇn 1", 1, "Finish nv chuyÓn Sinh 6 npc 1")					
	end
end


function cs6_infor_nv_1()
	local nCS6_CT = mod(GetTask(TSK_CS6_COUNTA),100)
	local nCS6_TA = mod(floor(GetTask(TSK_CS6_COUNTA)/100),100)
	local cCS6_TL = mod(GetTask(TSK_CS6_COUNTB),100)
	local nCS6_LD = mod(floor(GetTask(TSK_CS6_COUNTB)/100),100)
	
	Talk(1,"","TiÕn ®é thùc hiÖn nhiÖm vô !!!! \nCóng TÕ: <color=red>"..nCS6_CT.."/30<color> \nTrÞ An: <color=red>"..nCS6_TA.."/30<color> \nThñy Lîi: <color=red>"..cCS6_TL.."/30<color> \nLuyÖn §¬n: <color=red>"..nCS6_LD.."/30<color>")
end


function cs6_infor_nv_2()
	local nCS6_BNN =  mod(floor(GetTask(TSK_CS6_COUNTA)/10000),1000)	--B¸t nh· nhá
	local nCS6_HG =  mod(floor(GetTask(TSK_CS6_COUNTA)/10000000),1000)	--H¹t gièng
	local cCS6_TL =  mod(floor(GetTask(TSK_CS6_COUNTB)/10000),1000)		--Tø linh
	local nCS6_NS =  mod(floor(GetTask(TSK_CS6_COUNTB)/10000000),1000)		--Ng«i sao
	local nCS6_BH =  mod(floor(GetTask(TSK_CS6_GET1TIME)/1000),10000)		--N÷ oa b¶o h¹p
	Talk(1,"","TiÕn ®é thùc hiÖn nhiÖm vô !!!! \nC©y B¸t Nh· nhá: <color=red>"..nCS6_BNN.."/150<color> \nH¹t Gièng: <color=red>"..nCS6_HG.."/150<color> \nTø Linh: <color=red>"..cCS6_TL.."/150<color> \nNg«i Sao: <color=red>"..nCS6_NS.."/160<color> \nN÷ Oa B¶o H¹p: <color=red>"..nCS6_BH.."/1000<color>")
end


function cs6_infor_nv_3()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	
	Talk(1,"","TiÕn ®é thùc hiÖn nhiÖm vô !!!! \nTµi Nguyªn ChiÕn: <color=red>"..nCS6_TNN.."/20<color> \nThiªn M«n TrËn: <color=red>"..nCS6_TMT.."/20<color> \nL­¬ng S¬n: <color=red>"..nCS6_LS.."/15<color>")
end


function cs6_infor_nv_4()
	local nCS6_DaoQuy = mod(floor(GetTask(TSK_CS6_DaoQuy_XoaQuy)/10000),10000)
	local nCS6_XoaQuy = mod(GetTask(TSK_CS6_DaoQuy_XoaQuy),10000)
	local nCS6_SaMac = mod(floor(GetTask(TSK_CS6_SaMac_TamBao)/10000),10000)
	local nCS6_TamBao = mod(GetTask(TSK_CS6_SaMac_TamBao),10000)
	local nCS6_KiemTien = mod(floor(GetTask(TSK_CS6_KiemTien_DichTien)/10000),10000)
	local nCS6_DichTien = mod(GetTask(TSK_CS6_KiemTien_DichTien),10000)
	local nCS6_LiLong = mod(floor(GetTask(TSK_CS6_LiLong_HoaHo)/10000),10000)
	local nCS6_HoaHo = mod(GetTask(TSK_CS6_LiLong_HoaHo),10000)
	Talk(1,"","TiÕn ®é thùc hiÖn nhiÖm vô !!!! \nTiÓu Lam §ao Quû: <color=red>"..nCS6_DaoQuy.."/9999<color> \nTiÓu Lam Xoa Quû: <color=red>"..nCS6_XoaQuy.."/9999<color> \nSa M¹c Hµnh Nh©n: <color=red>"..nCS6_SaMac.."/9999<color>\nTÇm B¶o Nh©n: <color=red>"..nCS6_TamBao.."/9999<color>\nKiÕm Tiªn Tö: <color=red>"..nCS6_KiemTien.."/9999<color>\n§Þch Tiªn Tö: <color=red>"..nCS6_DichTien.."/9999<color>\nLiÖt Nhan Li Long: <color=red>"..nCS6_LiLong.."/9999<color>\nXÝch LuyÖn Háa Hå: <color=red>"..nCS6_HoaHo.."/9999<color>")
end


function cs6_npc2_infor1()
	--if GetTranslifeCount() < 6 and GetTaskTrans() == 38 then		--b¾t ®k and ®Ó kh«ng cho v« settask lªn 39 lÇn n÷a
--	if GetTask(TSK_CS6_TULINH) >= 2 then 
--		Talk(1,"","Khi thêi c¬ chÝn mïi, ta sÏ tiÕt lé th«ng tin vÒ bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp biÕt !!!!")		
--		return
--	end
	if GetTask(TSK_CS6_TULINH) == 2 then 
		--SetTaskTrans() --®¹t møc 39, b¾t ®Çu lµm nv chuyÓn sinh 6 ë NPC Viªn Quan Tho¸i NhiÖm
		SetTask(TSK_CS6_TULINH,3)
 		gf_WriteLogEx("CHUYEN SINH 6", "nhËn nhiÖm vô chuyÓn sinh 6", 1, "NhËn nv chuyÓn Sinh 6 npc 2a")		
	end
	
	local szNpcName = "<color=green>Viªn Quan Tho¸i NhiÖm<color>: "
	local tSay = {}
	local tHeader = szNpcName.."§¹i hiÖp qu¶ lµ mét kú nh©n trong Vâ L©m vµ cã lßng nh©n ®øc, cøu gióp ®Êt n­íc"
	if GetTask(TSK_CS6_TULINH) == 3 then
		tinsert(tSay, "Hoµn thµnh nhiÖm vô Cèng hiÕn cho quèc gia/cs6_finish_phoban")	
		tinsert(tSay, "Gióp ®ì hoµn thµnh cèng hiÕn quèc gia/cs6_help_conghienquocgia_menu")
		tinsert(tSay, "TiÕn ®é nhiÖm vô/cs6_infor_nv_3")	
	end
	if GetTask(TSK_CS6_TULINH) == 4 then 	
		tinsert(tSay, "Hoµn thµnh nhiÖm vô §¸nh qu¸i/cs6_finish_danhquai")	
		tinsert(tSay, "Gióp ®ì giÕt qu¸i/cs6_help_danhquai_infor")
		tinsert(tSay, "TiÕn ®é nhiÖm vô/cs6_infor_nv_4")		
	end
	tinsert(tSay, "Ta chØ ghÐ th¨m/nothing")
	Say(tHeader, getn(tSay), tSay)
end

function cs6_finish_phoban()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if GetTask(TSK_CS6_TULINH) < 3 then
		Talk(1,"","§¹i hiÖp cã g× cÇn nãi víi ta µ!!!!")	
		return
	end	
	--if nCS6_TNN < 20 or nCS6_TMT < 20 or nCS6_LS < 15 then
	--	Talk(1,"","§¹i hiÖp cßn cã nhiÖm vô nµo ch­a hoµn thµnh µ!!!!")	
	--	return	
	--end
--	if GetTask(TSK_CS6_TULINH) == 3 then 
--		SetTask(TSK_CS6_TULINH,4) -- hoµn thµnh xong chuçi nhiÖm vô phã b¹n
-- 		gf_WriteLogEx("CHUYEN SINH 6", "nhËn nhiÖm vô chuyÓn sinh 6", 1, "NhËn nv chuyÓn Sinh 6 npc 2")		
--	end
	local szNpcName = "<color=green>Viªn Quan Tho¸i NhiÖm<color>: "
	local tSay = {}
	local tHeader = szNpcName.."§¹i hiÖp lµ mét ng­êi rÊt dòng c¶m vµ yªu quª h­¬ng, l·o phu rÊt kh©m phôc. Tuy nhiªn thö th¸ch nh­ vËy vÉn ch­a ®ñ ®Ó l·o phu cã thÓ giao cho ®¹i hiÖp b¶o vËt gia truyÒn. NÕu ®¹i hiÖp thËt sù cã høng thó víi b¶o vËt gia truyÒn cña ta th× ®¹i hiÖp h·y chÊp nhËn thö th¸ch cña ta thªm mét lÇn n÷a !!!"
		
	tinsert(tSay, "ChÊp nhËn thö th¸ch tiÕp theo/cs6_infor_danhquai")
	tinsert(tSay, "Ta chØ ghÐ th¨m/nothing")
	Say(tHeader, getn(tSay), tSay)	
end
function cs6_infor_danhquai()
	if GetTask(TSK_CS6_TULINH) == 3 then 
		SetTask(TSK_CS6_TULINH,4)
 		gf_WriteLogEx("CHUYEN SINH 6", "nhËn nhiÖm vô chuyÓn sinh 6", 1, "NhËn nv chuyÓn Sinh 6 npc 2b")		
	end
	
	local szNpcName = "<color=green>Viªn Quan Tho¸i NhiÖm<color>: "
	local tSay = {}
	local tHeader = szNpcName.."§¹i hiÖp qu¶ lµ mét kú nh©n trong Vâ L©m vµ cã lßng nh©n ®øc, cøu gióp ®Êt n­íc"
		
	tinsert(tSay, "Hoµn thµnh nhiÖm vô §¸nh qu¸i/cs6_finish_danhquai")	
	tinsert(tSay, "Gióp ®ì giÕt qu¸i/cs6_help_danhquai_infor")		
	tinsert(tSay, "TiÕn ®é nhiÖm vô/cs6_infor_nv_4")	
	tinsert(tSay, "Ta chØ ghÐ th¨m/nothing")
	Say(tHeader, getn(tSay), tSay)
end
function cs6_help_danhquai_infor()
	local szNpcName = "<color=green>Viªn Quan Tho¸i NhiÖm<color>: "
	local tSay = {}
	local tHeader = szNpcName.."NÕu ®¹i hiÖp bËn luyÖn c«ng, kh«ng cã thêi gian ®Ó giÕt qu¸i th× ta cã thÓ gióp ®¹i hiÖp. §éi qu©n tinh nhuÖ bÝ Èn cña ta hiÖn ®ang r¶nh, cã thÓ gióp ®­îc ®¹i hiÖp nh­ng ph¶i tèn phÝ !!!"
		
	for i = 1, getn(tbMobsList_cs6) do
		tinsert(tSay,"Gióp ®ì giÕt qu¸i "..tbMobsList_cs6[i][1].."/#cs6_help_danhquai_kill("..i..")");
	end
	tinsert(tSay, "Gióp tiªu diÖt toµn bé qu¸i nhiÖm vô/#cs6_help_danhquai_kill(9)")	
	tinsert(tSay, "Ta chØ ghÐ th¨m/nothing")
	Say(tHeader, getn(tSay), tSay)
end
function cs6_help_danhquai_kill(nType)
	if nType ~= 9 then
		if GetItemCount(2,1,30230) < 1000 then
			Talk(1, "","§¹i hiÖp kh«ng cã ®ñ 1000 xu vËt phÈm ®Ó tr¶ phÝ cho ®éi qu©n cña ta")
			return	
		end
	else
		if GetItemCount(2,1,30230) < 6000 then
			Talk(1, "","§¹i hiÖp kh«ng cã ®ñ 6000 xu vËt phÈm ®Ó tr¶ phÝ cho ®éi qu©n cña ta")
			return			
		end	
	end
	if nType ~= 9 then
		local nTaskValue = GetTask(tbMobsList_cs6[nType][2])
		local nMobCount = floor(nTaskValue/10000)
		local nPosition = tbMobsList_cs6[nType][3]
		local szMobName = tbMobsList_cs6[nType][1]
		if nPosition ~= 1 then
			nMobCount = mod(nTaskValue,10000)
		end
		if nMobCount >= 9999 then
			Talk(1, "","§¹i hiÖp ®· giÕt ®ñ lo¹i qu¸i nµy råi !!!")
			return		
		end
		DelItem(2,1,30230, 1000)	
		gf_WriteLogEx("GIET QUAI NHANH", "thµnh c«ng", 1, "Qu¸i "..tbMobsList_cs6[nType][1])	
		if GetTask(TSK_CS6_TULINH) == 4 and nMobCount < 9999 then
			if nPosition == 1 then
				SetTask(tbMobsList_cs6[nType][2], 99990000 + mod(GetTask(tbMobsList_cs6[nType][2]),10000))
			else
				SetTask(tbMobsList_cs6[nType][2], floor(GetTask(tbMobsList_cs6[nType][2])/10000)*10000 + 9999)		
			end
			Msg2Player("NhiÖm vô Tø Linh Phôc Sinh: §· giÕt ®­îc 9999 "..szMobName)
		end			
	else
		local nCheck = 0
		for i = 1, getn(tbMobsList_cs6) do
			local nTaskValue_d = GetTask(tbMobsList_cs6[i][2])
			local nMobCount_d = floor(nTaskValue_d/10000)
			local nPosition_d = tbMobsList_cs6[i][3]
			local szMobName_d = tbMobsList_cs6[i][1]
			if nPosition_d ~= 1 then
				nMobCount_d = mod(nTaskValue_d,10000)
			end
			if nMobCount_d < 9999 then
				nCheck = 1
				break
			end	
		end
		if nCheck == 0 then
			Talk(1, "","§¹i hiÖp ®· giÕt hÕt qu¸i råi, cÇn ta gióp ®ì g× n÷a ???")
			return			
		end
		DelItem(2,1,30230, 6000)
	 	gf_WriteLogEx("GIET QUAI NHANH", "thµnh c«ng", 1, "TÊt c¶ Qu¸i")		
		SetTask(TSK_CS6_DaoQuy_XoaQuy, 99999999)
		SetTask(TSK_CS6_SaMac_TamBao, 99999999)
		SetTask(TSK_CS6_KiemTien_DichTien, 99999999)
		SetTask(TSK_CS6_LiLong_HoaHo, 99999999) 			
	end
end
function cs6_finish_danhquai()
	--- b¾t ®iÒu kiÖn ®¸nh qu¸i
	local nCS6_DaoQuy = mod(floor(GetTask(TSK_CS6_DaoQuy_XoaQuy)/10000),10000)
	local nCS6_XoaQuy = mod(GetTask(TSK_CS6_DaoQuy_XoaQuy),10000)
	local nCS6_SaMac = mod(floor(GetTask(TSK_CS6_SaMac_TamBao)/10000),10000)
	local nCS6_TamBao = mod(GetTask(TSK_CS6_SaMac_TamBao),10000)
	local nCS6_KiemTien = mod(floor(GetTask(TSK_CS6_KiemTien_DichTien)/10000),10000)
	local nCS6_DichTien = mod(GetTask(TSK_CS6_KiemTien_DichTien),10000)
	local nCS6_LiLong = mod(floor(GetTask(TSK_CS6_LiLong_HoaHo)/10000),10000)
	local nCS6_HoaHo = mod(GetTask(TSK_CS6_LiLong_HoaHo),10000)
	local nMax = 9999
	--if nCS6_DaoQuy < nMax or nCS6_XoaQuy < nMax or nCS6_SaMac < nMax or nCS6_TamBao < nMax or nCS6_KiemTien < nMax or nCS6_DichTien < nMax or nCS6_LiLong < nMax or nCS6_HoaHo < nMax then
	--	Talk(1, "","§¹i hiÖp ch­a hoµn thµnh xong thö th¸ch cña ta")
	--	return
	--end
	if GetTask(TSK_CS6_TULINH) < 4 then
		Talk(1,"","§¹i hiÖp ch­a ®¸p øng yªu cÇu cña ta !!!!!")	
		return
	end	
	local szNpcName = "<color=green>Viªn Quan Tho¸i NhiÖm<color>: "
	local tSay = {}
	local tHeader = szNpcName.."§¹i hiÖp qu¶ lµ mét kú nh©n trong Vâ L©m, b¾t ®Çu lÜnh ngé bÝ kÝp <color=yellow>Tø Linh Phôc Sinh<color> ®Ó ®ét ph¸ b×nh c¶nh. LÜnh ngé thµnh c«ng cã thÓ kich thÝch tiÒm lùc cña b¶n th©n ®¹t c¶nh giíi míi trong §¶ Th«ng Kinh M¹ch. !!!"
	--- b¾t ®iÒu kiÖn ë ®©y		
	tinsert(tSay, "Phôc sinh theo h­íng Long Tö/#cs6_finish_confrim(1)")			
	tinsert(tSay, "Phôc sinh theo h­íng Hæ Tö/#cs6_finish_confrim(2)")			
	tinsert(tSay, "Phôc sinh theo h­íng Phông Tö/#cs6_finish_confrim(4)")			
	tinsert(tSay, "Phôc sinh theo h­íng ¦ng Tö/#cs6_finish_confrim(3)")		
	tinsert(tSay, "Ta ch­a muèn Phôc Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end
function cs6_finish_confrim(nType)
	local nTransCount = GetTranslifeCount()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	if nTransCount < 5 then
		Talk(1,"","§¹i hiÖp ch­a hoµn thµnh xong nhiÖm vô chuyÓn sinh 5!!!")	
		return		
	end
	if GetTask(TSK_CS6_TULINH) < 4 then
		Talk(1,"","§¹i hiÖp ch­a ®¸p øng yªu cÇu cña ta!!!")	
		return
	end
	if GetTask(TSK_CS6_TULINH) >= 5 then
		Talk(1,"","§¹i hiÖp qu¶ lµ ng­êi h÷u duyªn víi bÝ kÝp Tø Linh Phôc Sinh!!!")	
		return
	end
	--- b¾t ®iÒu kiÖn ë ®©y
	--if GetItemCount(2,0,1083) < 3 then
	--	Talk(1,"","§¹i hiÖp kh«ng mang theo 3 cuèn Th¸i DÞch Hçn Nguyªn C«ng Phæ !!!!")	
	--	return
	--end
	--if GetItemCount(2,1,30345) < 1 then
	--	Talk(1,"","§¹i hiÖp kh«ng mang theo 1 ChuyÓn Sinh §¬n !!!!")	
	--	return
	--end
	--if GetItemCount(2,1,30229) < 2 then
	--	Talk(1,"","§¹i hiÖp kh«ng mang theo 2 B¹ch Kim Hång Bao !!!!")	
	--	return
	--end	
	--if GetLevel() < 99 then
	--	Talk(1,"","Kinh nghiÖm hµnh hiÖp trªn giang hå cña ®¹i hiÖp ch­a ®ñ ®Ó nhËn nhiÖm vô !!!!")
	--	return 0		
	--end
	--if GetExp() < 2000000000 then
	--	Talk(1,"","Kinh nghiÖm b«n tÈu trªn giang hå cña ®¹i hiÖp ch­a ®ñ ®Ó nhËn nhiÖm vô !!!!")
	--	return 0		
	--end
	--if MeridianGetLevel() < 2 then	
	--	Talk(1,"","Kinh m¹ch cña ®¹i hiÖp ch­a ®¹t cÊp ®é Vâ T­íng !!!!")
	--	return 0			
	--end
	--DelItem(2,0,1083,3)
	--DelItem(2,1,30345,1)
	--DelItem(2,1,30229,2)
	--ModifyExp(-2000000000)
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs5 = GetTranslifeFaction()	
	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 30000 + GetBody()
			Pnew1 = 561 + GetBody()			
			Pnew2 = 565 + GetBody()		
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
			BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end

	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	
--
--	for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
--			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
--			P = P + GetBody() - 1
--			Pnew = 561 + GetBody()
--			lvatt3 = lvatt3 or 0
--			att3 = att3 or 0
--			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
--			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
--	end	
	local tbVanSu = {"V¨n Sö ngo¹i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- ChuyÓn Sinh 6 thµnh c«ng		
--	SetLevel(1,0)
	AddTitle(61,05)
	SetTask(TSK_CS6_TULINH,5)		--hoµn thµnh nhÖm vô chuyÓn sinh
 	gf_WriteLogEx("CHUYEN SINH 6", "chuyÓn sinh thµnh c«ng", 1, "Finish nv chuyÓn Sinh 6 npc 2")	
	Msg2Player("Chóc mõng ®¹i hiÖp ®· Phôc Sinh thµnh c«ng theo h­íng "..tbType[nType])
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Tinh! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")
end


function cs6_help_conghienquocgia_menu()
	tbSay = {}
	tinsert(tbSay, "Tiªu hao 1200 xu vËt phÈm hoµn thµnh 20 lÇn tµi nguyªn chiÕn/cs6_help_conghienquocgia_tnc")
	tinsert(tbSay, "Tiªu hao 1200 xu vËt phÈm hoµn thµnh 20 lÇn Thiªn M«n TrËn/cs6_help_conghienquocgia_tmt")
	tinsert(tbSay, "Tiªu hao 1200 xu vËt phÈm hoµn thµnh 15 lÇn nhiÖm vô L­¬ng S¬n B¹c/cs6_help_conghienquocgia_lsb")
	tinsert(tbSay, "Tiªu hao 3000 xu vËt phÈm hoµn thµnh nhiÖm vô cèng hiÕn quèc gia/cs6_help_conghienquocgia_all")
	tinsert(tbSay, "Ta muèn tù m×nh hoµn thµnh nhiÖm vô/gf_DoNothing")
	local szSay = "Ta lµ ng­êi ghi nhËn thµnh tÝch cèng hiÕn quèc gia. NÕu ng­¬i kh«ng muèn cèng hiÕn søc lùc th× cã thÓ cèng hiÕn tµi lùc, ta còng ghi nhËn..."
	Say(szSay,getn(tbSay), tbSay)
end


function cs6_help_conghienquocgia_tnc()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if nCS6_TNN >= 20 then
		Talk(1,"","C¸c h¹ ®· hoµn thµnh phÇn nhiÖm vô nµy, kh«ng cÇn ph¶i tiªu tèn thªm nhiÒu tµi lùc.")
		return 0
	end
	if GetItemCount(2,1,30230) < 1200 then
		Talk(1,"","C¸c h¹ kh«ng ®ñ 1200 xu vËt phÈm. Ta cÇn sè tiÒn nµy ®Ó chiªu mé binh sÜ lµm nhiÖm vô thay c¸c h¹.")
		return 0
	end
	-- zzyyxx
	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)
	if DelItem(2,1,30230,1200) == 1 then
		local nTaskValue = nCS6_LS *10000 + nCS6_TMT*100 + 20
		SetTask(TSK_CS6_COUNTC, nTaskValue)
		TaskTip("Hoµn thµnh 20 lÇn nhiÖm vô Tµi nguyªn chiÕn")
	end
end


function cs6_help_conghienquocgia_tmt()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if nCS6_TMT >= 20 then
		Talk(1,"","C¸c h¹ ®· hoµn thµnh phÇn nhiÖm vô nµy, kh«ng cÇn ph¶i tiªu tèn thªm nhiÒu tµi lùc.")
		return 0
	end
	if GetItemCount(2,1,30230) < 1200 then
		Talk(1,"","C¸c h¹ kh«ng ®ñ 1200 xu vËt phÈm. Ta cÇn sè tiÒn nµy ®Ó chiªu mé binh sÜ lµm nhiÖm vô thay c¸c h¹.")
		return 0
	end
	-- zzyyxx
	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)
	if DelItem(2,1,30230,1200) == 1 then
		local nTaskValue = nCS6_LS *10000 + 20*100 + nCS6_TNN
		SetTask(TSK_CS6_COUNTC, nTaskValue)
		TaskTip("Hoµn thµnh 20 lÇn nhiÖm vô Thiªn M«n TrËn")
	end
end


function cs6_help_conghienquocgia_lsb()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if nCS6_LS >= 15 then
		Talk(1,"","C¸c h¹ ®· hoµn thµnh phÇn nhiÖm vô nµy, kh«ng cÇn ph¶i tiªu tèn thªm nhiÒu tµi lùc.")
		return 0
	end
	if GetItemCount(2,1,30230) < 1200 then
		Talk(1,"","C¸c h¹ kh«ng ®ñ 1200 xu vËt phÈm. Ta cÇn sè tiÒn nµy ®Ó chiªu mé binh sÜ lµm nhiÖm vô thay c¸c h¹.")
		return 0
	end
	-- zzyyxx
	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)
	if DelItem(2,1,30230,1200) == 1 then
		local nTaskValue = 15 *10000 + nCS6_TMT*100 + nCS6_TNN
		SetTask(TSK_CS6_COUNTC, nTaskValue)
		TaskTip("Hoµn thµnh 15 lÇn nhiÖm vô L­¬ng S¬n B¹c")
	end
end


function cs6_help_conghienquocgia_all()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if nCS6_LS >= 15 and nCS6_TNN >= 20 and nCS6_TMT >= 20 then
		Talk(1,"","C¸c h¹ ®· hoµn thµnh nhiÖm vô nµy, kh«ng cÇn ph¶i tiªu tèn thªm nhiÒu tµi lùc.")
		return 0
	end
	if GetItemCount(2,1,30230) < 3000 then
		Talk(1,"","C¸c h¹ kh«ng ®ñ 3000 xu vËt phÈm. Ta cÇn sè tiÒn nµy ®Ó chiªu mé binh sÜ lµm nhiÖm vô thay c¸c h¹.")
		return 0
	end
	if DelItem(2,1,30230,3000) == 1 then
		SetTask(TSK_CS6_COUNTC, 152020)
		TaskTip("Hoµn thµnh nhiÖm vô cèng hiÕn quèc gia.")
	end
end



function go_exit()
	ExitGame()
end


function nothing()
end