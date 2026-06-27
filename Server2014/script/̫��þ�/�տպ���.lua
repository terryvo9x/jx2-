Include("\\script\\Ì«Ğé»Ã¾³\\head.lua")
Include("\\script\\Ì«Ğé»Ã¾³\\award.lua")
Include("\\script\\online\\zgc_public_fun.lua")
taixu_jwl_taskID = 998

tBaguaNum = {
	[1]={"Kh¶m",2,1,471,10,10},
	[2]={"Kh«n",2,1,470,10,10},
	[3]={"ChÊn",2,1,474,9,2},
	[4]={"Tèn",2,1,476,9,2},
	[6]={"Cµn",2,1,469,10,10},
	[7]={"§oµi",2,1,472,10,10},
	[8]={"CÊn",2,1,475,9,3},
	[9]={"Ly",2,1,473,9,3}
	}
tWood = {
	{0,0,0,0,0,0,0,5,5},	--100ÁéÆøÉñÄ¾°ËØÔ
	{0,0,5,5,0,0,0,0,0},	--100ÁéÆø×Ï½ğ°ËØÔ
	{0,0,0,0,0,0,0,0,0},	--80ÁéÆøÉñÄ¾°ËØÔ
	{0,0,0,0,0,0,0,0,0},	--80ÁéÆø×Ï½ğ°ËØÔ
}

function main()
	local tbSay = {}
	local nCount =	mod(GetTask(TSK_THAIHU_DAY),100)
	
	--tinsert(tbSay, "Th¸i H­ HuyÔn C¶nh lµ sao?/Hewei");
	--tinsert(tbSay, "Lµm sao vµo ®­îc Th¸i H­ HuyÔn C¶nh?/Ruhe");
	tinsert(tbSay, "Xin ch©n nh©n ®­a vµo Th¸i H­ HuyÔn C¶nh/EnterTx");		
	tinsert(tbSay, "Sö dông Th¸i H­ B¸t Qu¸i bµi ®æi phÇn th­ëng/GetAwardPai");
	tinsert(tbSay, "Ta muèn t¨ng cÊp Trang søc Th¸i H­/taixu_jwl_up_inf");		
	if nCount >= 6 and floor(GetTask(TSK_THAIHU_DAY)/100) < 1 then
		tinsert(tbSay, "NhËn th­ëng hoµn thµnh 6 lÇn Th¸i H­ HuyÔn C¶nh/Award_Max");
	end
	
	if GetLevel() >= 70 then
		tinsert(tbSay, "Ta muèn kİch ho¹t lùc b¸t qu¸i cña trang bŞ/choose_lingqi");
	end
	tinsert(tbSay,"KÕt thóc ®èi tho¹i/do_nothing");
	Say("BÇn ®¹o phông mÖnh Cöu Thiªn HuyÒn N÷ ®Õn nh©n gian ®é hãa mäi ng­êi ®Õn Th¸i H­ HuyÔn C¶nh. Thİ chñ xem ra ng­êi h÷u duyªn ®Õn ®©y cã chuyÖn g× kh«ng?",
		getn(tbSay),tbSay)
end


function taixu_jwl_up_inf()
	local jwl_chk_flag = 0
	for i = 29,35 do
		if GetItemCount(0,102,i) ~= 0 then
			jwl_chk_flag = 1 
			break
		end
	end
	if jwl_chk_flag == 0 then
		Talk(1,"","T¨ng cÊp <color=yellow>Trang søc Th¸i H­<color> hiÖu qu¶, ng­¬i"..Zgc_pub_sex_name()..", ng­¬i kh«ng mang theo <color=yellow>Trang søc Th¸i H­<color>µ?")
	else
		if GetTask(taixu_jwl_taskID) ~= nil and GetTask(taixu_jwl_taskID) ~= 0 then
			Talk(1,"","VÒ <color=yellow>Trang søc Th¸i H­<color>,"..Zgc_pub_sex_name().."nªn ®Õn <color=yellow>T­¬ng D­¬ng <color> t×m <color=yellow>M¹c Tam<color> hái nhĞ, «ng Êy cã thÓ gióp ®­îc ng­¬i!")
		else
		Talk(4,"taixu_jwl_up_inf_2",
			"VŞ "..Zgc_pub_sex_name().."còng ®Ó ı ®Õn ­?",
			"Kú thùc nh÷ng lo¹i <color=yellow>Trang søc Th¸i H­<color> mµ ng­¬i mang ®Õn c«ng hiÖu cña chóng kh«ng cao.",
			"<color=yellow>Trang søc Th¸i H­<color> kh«ng ph¸t huy c«ng lùc.",
			"Ch¼ng lÏ kh«ng cßn c¸ch nµo ®Ó ph¸t huy hiÖu qu¶ cña chóng sao? Nh÷ng trang søc nµy ta ph¶i vÊt v¶ l¾m míi cã ®­îc chóng.")
		end
	end
end
function taixu_jwl_up_inf_2()
	Talk(	4,"taixu_jwl_dia_set",
			"<color=green>ThÇn Du Ch©n Nh©n<color>:"..Zgc_pub_sex_name().."§õng nãng, kh«ng ph¶i lµ kh«ng cã c¸ch, nh­ng cã ®iÒu ta ch­a nghÜ ra",
			"Ng­êi mau nghÜ ra ®i.",
			"Ng­¬i ®Õn <color=yellow>T­¬ng D­¬ng <color> t×m <color=yellow>M¹c Tam<color>. Ng­êi  nµy tinh th«ng chÕ thuËt cã thÓ gióp <color=yellow>Trang søc Th¸i H­<color> cña ng­¬i ph¸t huy hiÖu lùc.",
			"§a t¹ ®· chØ gi¸o, ta lËp tøc ®Õn chç <color=yellow>M¹c Tam<color> ®©y.")
end
function taixu_jwl_dia_set()
	TaskTip("B¹n ®· nhËn nhiÖm vô Trang søc Th¸i H­ ®Õn T­¬ng D­¬ng t×m M¹c Tam.")
	SetTask(taixu_jwl_taskID,1)
end
--===================================================================½áÊø==========================================================
function do_nothing()
	--do nothing
end

function choose_lingqi()
	local strtab = {
		"Ta muèn kİch ho¹t trang bŞ b¸t qu¸i cã ®iÓm linh khİ d­íi 60/mianfei_jihuo",
		"Ta muèn kİch ho¹t trang bŞ b¸t qu¸ ®iÓm linh khİ 61-79/#jihuo_bagua(2)",
		"Ta muèn kİch ho¹t trang bŞ b¸t qu¸ ®iÓm linh khİ 80-120/#jihuo_bagua(1)",
		"§îi chót, ®Ó ta xem ®iÓm linh khİ trang bŞ cña ng­¬i/do_nothing"
		}
	Say("Muèn kİch ho¹t b¸t qu¸i trªn trang bŞ, cÇn Th¸i H­ B¸t Qu¸i Bµi t­¬ng øng, nÕu ®­a ®ñ sè l­îng ta sÏ khİch ho¹t cho ng­¬i. H·y chän trŞ linh khİ muèn kİch ho¹t, trŞ linh khİ <color=yellow>d­íi 60<color>, ngoµi trang bŞ quÎ <color=yellow>ChÊn vµ Tèn<color>, ta cã thÓ kİch ho¹t <color=yellow>miÔn phİ<color> nh÷ng c¸i kh¸c cho ng­¬i. Kho¶ng trŞ linh khİ lín h¬n 60 kh¸c nhau sÏ cÇn sè l­îng Th¸i H­ B¸t Qu¸i kh¸c nhau.",
		getn(strtab),
		strtab)
end

function mianfei_jihuo()
	local strtab = {
		"§Çu/#mianfei_jihuo_weizhi(0)",
		"Y phôc/#mianfei_jihuo_weizhi(1)",
		"H¹ y/#mianfei_jihuo_weizhi(3)",
		"Vò khİ/#mianfei_jihuo_weizhi(2)",
		"§îi ta mÆc trang bŞ cÇn kİch ho¹t vµo./do_nothing"
		}
	Say("NÕu trŞ linh khİ cña trang bŞ tõ <color=yellow>60 trë xuèng<color>, kİch ho¹t <color=yellow>ChÊn vµ Tèn<color> qu¸i trang bŞ cÇn <color=yellow>1<color> Th¸i H­ B¸t Qu¸i bµi t­¬ng øng, cßn l¹i ta cã thÓ kİch ho¹t miÔn phİ cho ng­¬i. Chó ı, ta kh«ng r¶nh kiÓm tra hµnh trang cña ng­¬i, h·y ®em trang bŞ cÇn kİch ho¹t ®Õn gÆp ta. Ng­¬i muèn kİch ho¹t trang bŞ ë bé phËn nµo?",
		getn(strtab),
		strtab)
end

function jihuo_bagua(nType)
	local strtab = {};

	if nType == 2 then
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[3][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-ChÊn, ®Ó kİch ho¹t ChÊn qu¸i trang bŞ/#check_bagua(3,2)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[4][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Tèn, ®Ó kİch ho¹t Tèn qu¸i trang bŞ/#check_bagua(4,2)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[1][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Kh¶m, ®Ó kİch ho¹t Kh¶m qu¸i trang bŞ/#check_bagua(1,2)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[2][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Kh«n, ®Ó kİch ho¹t Kh«n qu¸i trang bŞ/#check_bagua(2,2)");
	elseif nType == 1 then
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[3][5].."c¸i Th¸i H­ B¸t Qu¸i Bµi - ChÊn + 5 c¸i Tö Kim B¸t Qu¸i ®Ó kİch ho¹t mét chiÕc trang bŞ TrËn Qu¸i/#check_bagua(3,1)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[4][5].."c¸i Th¸i H­ B¸t Qu¸i Bµi - Tèn + 5 c¸i Tö Kim B¸t Qu¸i ®Ó kİch ho¹t mét chiÕc trang bŞ Tèn Qu¸i/#check_bagua(4,1)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[1][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Kh¶m, ®Ó kİch ho¹t Kh¶m qu¸i trang bŞ/#check_bagua(1,1)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[2][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Kh«n, ®Ó kİch ho¹t Kh«n qu¸i trang bŞ/#check_bagua(2,1)");
	end
	tinsert(strtab,"Trang kÕ/#jihuo_bagua2("..nType..")");
	tinsert(strtab,"Ta kh«ng cã trang bŞ b¸t qu¸i ch­a kİch ho¹t./do_nothing");
	Say("Ng­¬i muèn kİch ho¹t trang bŞ thuéc tİnh b¸t qu¸i nµo? Chó ı, ta kh«ng r¶nh kiÓm tra hµnh trang cña ng­¬i, h·y ®em trang bŞ cÇn kİch ho¹t ®Õn gÆp ta.",
		getn(strtab),
		strtab);
end

function mianfei_jihuo_weizhi(nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if nIndex == 0 then
		Talk(1,"","Ng­¬i kh«ng mÆc nã trªn ng­êi!");
		return
	end
	if GetEquipBaGua(nIndex) == 0 then
		Talk(1,"","Trang bŞ ng­¬i ®ang mÆc kh«ng ph¶i trang bŞ b¸t qu¸i ch­a kİch ho¹t.");
		return
	end
	local nLingqi = GetItemMaxLingQi(nIndex);
	if GetEquipBaGuaJiHuo(nIndex) ~= 0 then
		Talk(1,"","Trang bŞ trªn ng­êi ng­¬i ®· kİch ho¹t råi.")
		return
	end
	if nLingqi > 60 then
		Talk(1,"","TrŞ linh khİ tõ <color=yellow>60 trë xuèng<color>, ta cã thÓ miÔn phİ kİch ho¹t n¨ng lùc trang bŞ b¸t qu¸i cho ng­¬i. Nh­ng trang bŞ b¸t qu¸i ng­¬i ®ang mÆc cÇn Th¸i H­ B¸t Qu¸i bµi ®Ó kİch ho¹t.");
		return
	elseif nLingqi == 0 then
		Talk(1,"","Trang bŞ ng­¬i ®ang mÆc kh«ng ph¶i trang bŞ b¸t qu¸i.")
		return
	end
	if GetEquipBaGua(nIndex) == 3 then
		if GetItemCount(tBaguaNum[3][2],tBaguaNum[3][3],tBaguaNum[3][4]) < 1 then
			Talk(1,"","Muèn kİch ho¹t ChÊn qu¸i trang bŞ, cÇn 1 ChÊn Bµn, ng­¬i kh«ng cã ChÊn Bµn.");
			return
		else
			Say("Ng­¬i quyÕt ®Şnh kİch ho¹t <color=yellow>ChÊn<color> qu¸i trang bŞ? Tiªu hao 1 ChÊn Bµn.",
				2,
				"§óng, ta muèn kİch ho¹t/#jihuo_zhengua(3,"..nWz..")",
				"§Ó ta suy nghÜ l¹i/do_nothing")
			return
		end
	end
	if GetEquipBaGua(nIndex) == 4 then
		if GetItemCount(tBaguaNum[4][2],tBaguaNum[4][3],tBaguaNum[4][4]) < 1 then
			Talk(1,"","Muèn kİch ho¹t Tèn qu¸i trang bŞ, cÇn 1 Tèn Bµn, ng­¬i kh«ng cã Tèn Bµn.");
			return
		else
			Say("Ng­¬i quyÕt ®Şnh kİch ho¹t <color=yellow>Tèn<color> qu¸i trang bŞ? Tiªu hao 1 Tèn Bµn.",
				2,
				"§óng, ta muèn kİch ho¹t/#jihuo_zhengua(4,"..nWz..")",
				"§Ó ta suy nghÜ l¹i/do_nothing")
			return
		end
	end
	if nLingqi > 0 and nLingqi <= 60 and GetEquipBaGuaJiHuo(nIndex) == 0 then
		local tZhuangBei = {"§Çu","Y phôc","Vò khİ","H¹ y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Chóc mõng b¹n ®· kİch ho¹t."..tZhuangBei[nWz+1].."Trang bŞ thuéc tİnh b¸t qu¸i");
	end
end

function check_bagua(nType,nLqType)
	if nLqType == 1 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][5] then
			Talk(1,"","thu thËp ®ñ Th¸i H­ B¸t Qu¸i bµi råi quay l¹i t×m ta, bÊy nhiªu ®ã sao cã thÓ kİch ho¹t.");
			return
		end
	elseif nLqType == 2 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][6] then
			Talk(1,"","thu thËp ®ñ Th¸i H­ B¸t Qu¸i bµi råi quay l¹i t×m ta, bÊy nhiªu ®ã sao cã thÓ kİch ho¹t.");
			return
		end
	end
	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if GetItemCount(2,95,550) < nCount1 then
		Talk(1, "", "<color=green>ThÇn Du Tr©n Nh©n<color>: cã ®ñ ThÇn Méc B¸t Qu¸i  råi ®Õn gÆp t«i, chØ cã mÊy c¸i nµy lµm sao kİch ho¹t ®­îc.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if GetItemCount(2,95,551) < nCount2 then
		Talk(1, "", "<color=green>ThÇn Du Tr©n Nh©n<color>: cã ®ñ Tö Kim B¸t Qu¸i  råi ®Õn gÆp t«i, chØ cã mÊy c¸i nµy lµm sao kİch ho¹t ®­îc.");
		return
	end
		local nMaoziIndex = GetPlayerEquipIndex(0);
		local nYifuIndex = GetPlayerEquipIndex(1);
		local nKuziIndex = GetPlayerEquipIndex(3);
		local nWuqiIndex = GetPlayerEquipIndex(2);
		local strtab = {} ;
		if GetEquipBaGua(nMaoziIndex) == nType and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
			tinsert(strtab,"§Çu/#item_jihuo("..nMaoziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nYifuIndex) == nType and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
			tinsert(strtab,"Y phôc/#item_jihuo("..nYifuIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nKuziIndex) == nType and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
			tinsert(strtab,"H¹ y/#item_jihuo("..nKuziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nWuqiIndex) == nType and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			tinsert(strtab,"Vò khİ/#item_jihuo("..nWuqiIndex..","..nLqType..","..nType..")");
		end
		if getn(strtab) == 0 then
			Talk(1,"","Ng­¬i kh«ng cã trang bŞ ch­a kİch ho¹t t­¬ng øng víi thuéc tİnh b¸t qu¸i nµy.");
		else
			tinsert(strtab,"Th«i ta kh«ng kİch ho¹t n÷a./do_nothing");
			Say("Ng­¬i quyÕt ®Şnh kİch ho¹t thuéc tİnh b¸t qu¸i nµo? H·y chän trang bŞ cÇn kİch ho¹t trªn ng­êi ng­¬i.",getn(strtab),strtab) --..tBaguaNum[nType][1].."
		end
end

function jihuo_bagua2(nType)
	if nType == 1 then
		local strtab = {
			"Ta muèn dïng "..tBaguaNum[6][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Cµn, ®Ó kİch ho¹t Cµn qu¸i trang bŞ/#check_bagua(6,1)",
			"Ta muèn dïng "..tBaguaNum[7][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-§oµi, ®Ó kİch ho¹t §oµi qu¸i trang bŞ/#check_bagua(7,1)",
			"Ta muèn dïng "..tBaguaNum[8][5].."c¸i Th¸i H­ B¸t Qu¸i Bµi - CÊn + 5 c¸i ThÇn Méc B¸t Qu¸i ®Ó kİch ho¹t mét chiÕc trang bŞ CÊn Qu¸i/#check_bagua(8,1)",
			"Ta muèn dïng "..tBaguaNum[9][5].."c¸i Th¸i H­ B¸t Qu¸i Bµi - Ly + 5 c¸i ThÇn Méc B¸t Qu¸i ®Ó kİch ho¹t mét chiÕc trang bŞ Ly Qu¸i/#check_bagua(9,1)",
			"Trang tr­íc/#jihuo_bagua("..nType..")",
			"Ta kh«ng cã trang bŞ b¸t qu¸i ch­a kİch ho¹t./do_nothing"
			}
		Say("Ng­¬i muèn kİch ho¹t trang bŞ thuéc tİnh b¸t qu¸i nµo? Chó ı, ta kh«ng r¶nh kiÓm tra hµnh trang cña ng­¬i, h·y ®em trang bŞ cÇn kİch ho¹t ®Õn gÆp ta.",
			getn(strtab),
			strtab);
	elseif nType == 2 then
		local strtab = {
			"Ta muèn dïng "..tBaguaNum[6][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Cµn, ®Ó kİch ho¹t Cµn qu¸i trang bŞ/#check_bagua(6,2)",
			"Ta muèn dïng "..tBaguaNum[7][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-§oµi, ®Ó kİch ho¹t §oµi qu¸i trang bŞ/#check_bagua(7,2)",
			"Ta muèn dïng "..tBaguaNum[8][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-CÊn, ®Ó kİch ho¹t CÊn qu¸i trang bŞ/#check_bagua(8,2)",
			"Ta muèn dïng "..tBaguaNum[9][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Ly, ®Ó kİch ho¹t Ly qu¸i trang bŞ/#check_bagua(9,2)",
			"Trang tr­íc/#jihuo_bagua("..nType..")",
			"Ta kh«ng cã trang bŞ b¸t qu¸i ch­a kİch ho¹t./do_nothing"
			}
		Say("Ng­¬i muèn kİch ho¹t trang bŞ thuéc tİnh b¸t qu¸i nµo? Chó ı, ta kh«ng r¶nh kiÓm tra hµnh trang cña ng­¬i, h·y ®em trang bŞ cÇn kİch ho¹t ®Õn gÆp ta.",
			getn(strtab),
			strtab);
	end
end

function item_jihuo(nIndex,nLqType,nType)
	local tZhuangBei = {"§Çu","Y phôc","Vò khİ","H¹ y"};
	local nLingqi = GetItemMaxLingQi(nIndex);
	if nLqType == 1 then
		if nLingqi < 80 or nLingqi > 120 then
			Talk(1,"","Sai råi, linh khİ trang bŞ cña ng­¬i kh«ng ph¶i tõ 80-120.");
			return
		end
	end
	if nLqType == 2 then
		if nLingqi <= 60 or nLingqi >= 80 then
			Talk(1,"","Sai råi, linh khİ trang bŞ cña ng­¬i kh«ng ph¶i tõ 60-80.");
			return
		end
	end

	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if nCount1 > 0 and DelItem(2,95,550, nCount1) ~= 1 then
		Talk(1, "", "<color=green>ThÇn Du Tr©n Nh©n<color>: cã ®ñ ThÇn Méc B¸t Qu¸i  råi ®Õn gÆp t«i, chØ cã mÊy c¸i nµy lµm sao kİch ho¹t ®­îc.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if nCount2 > 0 and DelItem(2,95,551, nCount2) ~= 1 then
		Talk(1, "", "<color=green>ThÇn Du Tr©n Nh©n<color>: cã ®ñ Tö Kim B¸t Qu¸i  råi ®Õn gÆp t«i, chØ cã mÊy c¸i nµy lµm sao kİch ho¹t ®­îc.");
		return
	end

	if nLqType == 1 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][5]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
				  SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Chóc mõng b¹n ®· kİch ho¹t."..tZhuangBei[i].."Trang bŞ thuéc tİnh b¸t qu¸i");
					break;
				end
			end
		end
	elseif nLqType == 2 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][6]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
					SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Chóc mõng b¹n ®· kİch ho¹t."..tZhuangBei[i].."Trang bŞ thuéc tİnh b¸t qu¸i");
					break;
				end
			end
		end
	end
end

function jihuo_zhengua(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if DelItem(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4],1) == 1 then
		local tZhuangBei = {"§Çu","Y phôc","Vò khİ","H¹ y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Chóc mõng b¹n ®· kİch ho¹t."..tZhuangBei[nWz+1].."Trang bŞ thuéc tİnh b¸t qu¸i");
	end
end