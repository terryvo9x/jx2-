--Ìì¹¤ÇÉÊÖÁõÊ«Ó¢
Include("\\script\\isolate\\functions\\armory\\item\\armory_box4_nb.lua")

g_NpcName = "<color=green>Thiªn c«ng x¶o thñ L­u Thi Anh<color>:";

function main()
	local strtab = {
		format("%s/#lsy_enhance(201)", "Muèn c­êng hãa thuéc tİnh c¬ b¶n cña V¨n Søc"),
		format("%s/#lsy_enhance(202)", "Muèn t¨ng phÈm chÊt V¨n Søc"),
--		format("%s/#lsy_enhance(203)", "ÎÒÒª¸ß¼¶Ç¿»¯ÎÆÊÎµÈ¼¶"),
--		format("%s/#lsy_enhance(204)", "ÎÒÒª¾«Á¶ÖØÖıÎÆÊÎ"),
		--format("%s/change_lv4_armory", "×ª»»4¼¶Á÷ÅÉ×¨ÊôÎÆÊÎËæ»úÊôĞÔ(Ã¿´Î10000½ğ)"),
		format("%s/lsy_intro_main", "Giíi thiÖu V¨n Søc"),
		format("%s/nothing", "Ra khái"),
	};
	Say(g_NpcName.."",
		getn(strtab),
		strtab)
end

function lsy_enhance(nType)
	nType = nType or 201;
	SendScript2Client(format("Open([[CommonEnhanceItem]],%d);", nType));
end

function lsy_intro_main()
	local strtab = {
		format("%s/#lsy_intro(1)", "V¨n Søc lµ g×"),
		format("%s/#lsy_intro(2)", "C­êng hãa cÊp V¨n Søc cã t¸c dông g×"),
		format("%s/#lsy_intro(3)", "T¨ng phÈm chÊt V¨n Søc cã t¸c dông g×"),
		-- format("%s/#lsy_intro(4)", "ÈçºÎ¾«Á¶ÖØÖıÎÆÊÎ"),
		format("%s/#lsy_intro(5)", "C¸ch nhËn V¨n Søc"),
		format("%s/#lsy_intro(6)", "C¸ch nhËn nguyªn liÖu c­êng hãa V¨n Søc"),
		format("%s/#lsy_intro(7)", "C­êng hãa V¨n Søc Nh­ ThÕ Nµo"),
		format("%s/#lsy_intro(8)", "N©ng cÊp phÈm chÊt V¨n Søc nh­ thÕ nµo"),
		format("%s/nothing", "Ra khái"),
	};
	Say(g_NpcName.."",
		getn(strtab),
		strtab)
end


lsy_tIntro = {
	[1] = "Nguyªn liÖu V¨n Søc gåm ChØ Vµng, Ng©n Ti, Ngäc Th¹ch, M· N·o, sö dông kü thuËt cò §«ng Ph­¬ng ®Ó rËp h×nh vµo trang bŞ, \n     cã søc m¹nh ngò hµnh, kh«ng chØ t¨ng thuéc tİnh chiÕn ®Êu cña ng­êi mang, mµ cßn t¨ng phßng ngù ngò hµnh. ",
	[2] = "C­êng hãa cÊp V¨n Søc sÏ t¨ng kh¸ng tİnh ngò hµnh t­¬ng øng, gi¶m s¸t th­îng cña thuéc tİnh ngò hµnh t­¬ng øng.",
	[3] = "V¨n Søc gåm 4 phÈm chÊt: Vì, Th­êng, V« H¹, Hoµn mü.\n    T¨ng phÈm chÊt V¨n Søc sÏ t¨ng gi¸ trŞ cña bé phËn V¨n Søc ®ang ®eo hoÆc tÊt c¶ thuéc tİnh chiÕn ®Êu.",
	[4] = "Tinh luyÖn/trïng luyÖn V¨n Søc cã thÓ trïng luyÖn V¨n Søc V« H¹ vµ Hoµn Mü thµnh V¨n Søc Kh¾c B¶n cïng vŞ trİ cÊp cao h¬n, c¨n cø ®é c­êng hãa cña V¨n Søc ban ®Çu hoµn tr¶ nguyªn liÖu c­êng hãa víi sè l­îng nhÊt ®Şnh. Quy t¾c hoµn tr¶ nh­ sau:\n",
	[5] = "Th¸i ®é cña ChiÕt Xung X· ®èi víi b¹n sÏ quyÕt ®Şnh lo¹i v¨n søc mµ b¹n cã thÓ nhËn ®­îc, cho nªn n©ng cÊp danh väng ChiÕt Xung X· cã thÓ nhËn ®­îc tÊt c¶ c¸c lo¹i trang sóc. \n tiªu hao kh¾c b¶n v¨n søc cã thÓ nhËn ®­îc v¨n søc t­¬ng øng vŞ trİ víi thuéc tİnh ngÉu nhiªn vµ ngò hµnh.",
	[6] = "Trong phã b¶n anh hïng KiÕm §·ng YÕn V©n cã thÓ nhËn ®­îc nguyªn liÖu c­êng hãa v¨n søc.",
	[7] = "C­êng hãa v¨n søc cÇn tiªu hao L­u Kim, trong qu¸ tr×nh c­êng hãa cã thÓ thªm vµo Thiªn V¨n Th¹ch ®Ó gi¶m tæn thÊt khi c­êng hãa thÊt b¹i.\n    Sau khi ®é c­êng hã V¨n Søc ®¹t ®Õn 10, tiÕp tôc c­êng hãa ph¶i thªm vµo Thiªn V¨n Th¹ch míi cã thÓ tiÕn hµnh c­êng hãa.",
	[8] = "N©ng cÊp phÈm chÊt cÇn tiªu hao V¨n Søc cã ®»ng cÊp, vŞ trİ, phÈm chÊt ®Òu gièng nhau.\n    Nguyªn liÖu thªm vµo cµng nhiÒu, x¸c suÊt thµnh c«ng th× cµng cao. <color=red>(nÕu V¨n Søc cÇn n©ng cÊp phÈm chÊt hoÆc nguyªn liÖu ®Ó n©ng cÊp cã vËt phÈm khãa, th× V¨n Søc sau khi n©ng cÊp còng sÏ bŞ khãa. )<color>",
};

function lsy_intro(nType)
	if not lsy_tIntro[nType] then return end
	Talk(1,"lsy_intro_main",g_NpcName..lsy_tIntro[nType]);
end

g_tPosName = {
	[17] = "V¨n Søc §Çu",
	[18] = "V¨n Søc ƒo",
	[19] = "V¨n Søc QuÇn",
	[20] = "V¨n Søc Trang Søc 1",
	[21] = "V¨n Søc Trang Søc 2",
};

g_tPosDetail = {
	[17] = 116,
	[18] = 113,
	[19] = 114,
	[20] = 115,
	[21] = 115,
}

g_nLiuIndex = 20131018
g_tItem_NB[g_nLiuIndex] = {g_NpcName,2,1,10032,4, 0,0,{{1,2,3,4,5,6,7,8,9}, {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, {1}}};
	

function change_lv4_armory()
	local szMsg = g_NpcName .. "Cã thÓ dïng 10000 Vµng chän l¹i thuéc tİnh trang bŞ cña V¨n Søc l­u ph¸i cÊp 4, kh«ng ¶nh h­ëng ®Õn ®é c­êng hãa, phÈm chÊt vµ thuéc tİnh bé trang.";
	local tSel = {
		format("%s/#want_to_exchange(17)", "Muèn chuyÓn ®æi V¨n Søc §Çu hiÖn cã"),
		format("%s/#want_to_exchange(18)", "Muèn chuyÓn ®æi V¨n Søc ƒo hiÖn cã"),
		format("%s/#want_to_exchange(19)", "Muèn chuyÓn ®æi V¨n Søc QuÇn hiÖn cã"),
		format("%s/#want_to_exchange(20)", "Muèn chuyÓn ®æi V¨n Søc Trang Søc 1 hiÖn cã"),
		format("%s/#want_to_exchange(21)", "Muèn chuyÓn ®æi V¨n Søc Trang Søc 2 hiÖn cã"),
		format("%s/main", "trë l¹i"),
		format("%s/nothing", "KÕt thóc ®èi tho¹i"),
	}
	Say(szMsg, getn(tSel), tSel);
end

function want_to_exchange(nPos)
	local nEquipIndex = GetPlayerEquipIndex(nPos)
	
	if nEquipIndex <= 0 then
		Talk(1, "", g_NpcName .. "Kh«ng cã trang bŞ" .. g_tPosName[nPos] .. " .");
		return 0;
	end
	
	local g, d, p = GetItemInfoByIndex(nEquipIndex);
	if g ~= 0 or g_tPosDetail[nPos] ~= d then
		Talk(1, "", "VŞ trİ chØ ®Şnh ch­a trang bŞ V¨n Søc l­u ph¸i cÊp 4, sau khi ®ång ı h·y thö l¹i.");
		return 0;
	end
	
	p = p - tonumber(GetPlayerRoute()) * 10;
	
	if p ~= 4000 and p ~= 4001 then
		Talk(1, "", "VŞ trİ chØ ®Şnh ch­a trang bŞ V¨n Søc l­u ph¸i cÊp 4, sau khi ®ång ı h·y thö l¹i.");
		return 0;
	end
	
	if GetItemSpecialAttr(nEquipIndex,"LOCK") == 1 or GetItemSpecialAttr(nEquipIndex,"UNLOCKING") == 1 then
		Talk(1, "", "V¨n Søc chØ ®Şnh ®ang trong tr¹ng th¸i khãa hoÆc ®ang më khãa, kh«ng thÓ chuyÓn ®æi thuéc tİnh.");
		return 0;
	end
	
	if GetItemOwner(nEquipIndex) ~= "" then
		Talk(1, "", "V¨n Søc chØ ®Şnh ®ang trong tr¹ng th¸i Táa Hån, kh«ng thÓ chuyÓn ®æi thuéc tİnh.");
		return 0;
	end
	
	if GetCash() < 100000000 then
		Talk(1, "", "Trªn ng­êi b¹n Kh«ng ®ñ 10000 Vµng.");
		return 0;
	end

	local nValue = nPos - 16;
	if nPos == 20 or nPos == 21 then 
		if p == 4001 then
			nValue = 5;
		else
			nValue = 4;
		end
	end
	g_tPlayerData[GetName()] = {};
	g_tPlayerData[GetName()].nEquipIndex = nEquipIndex;
	g_tPlayerData[GetName()].nArmory = nValue;
	g_tPlayerData[GetName()].nSeries = 1;
	g_tPlayerData[GetName()].bRoute = 1;
	g_tPlayerData[GetName()].nPos = nPos;
	
	MakeArmory(g_nLiuIndex, 3);
end

function MakeArmory_Confirm(nSel, nStep, nValue)
	local tItem = g_tItem_NB[nSel];
	if not tItem then
		return 0;
	end

	local tData = g_tPlayerData[GetName()];
	if not tData then
		return 0;
	end
	if not nValue then
		local szMsg = format("<color=green>[%s]<color>: §· chän\n", tItem[1]);

		if not tData.nArmory or not g_tRouteArmory[tData.nArmory] then
			return 0;
		end
		local tArmory = g_tRouteArmory[tData.nArmory][2];
		local szItemName = GetItemName(tArmory[2], tArmory[3], tArmory[4] + tonumber(GetPlayerRoute()) * 10);
		szMsg = szMsg .. format("\t\t%s <color=yellow>(B¶o l­u ®é c­êng hãa vµ phÈm chÊt cña V¨n Søc ban ®Çu)<color>\n", szItemName);
		
		for k, v in g_tMagicAttribute.tMagicInfo do
			if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
				return 0;
			end
			szMsg = szMsg..format("\t\tThuéc tİnh - %s\n", v[tData.tMagicAttribute[k]][5][1]);
		end

		local tMenu = {
			format("\n%s	/#MakeArmory_Confirm(%d,%d,%d)", "§ång ı", nSel, nStep, 1),
			format("\n%s	/#MakeArmory(%d, %d)", "trë l¹i", nSel, nStep - 1),
			format("%s/nothing", "Ra khái"),
		};

		Say(szMsg, getn(tMenu), tMenu);

		return 1;
	end

	if 1 == nValue then
		g_tPlayerData[GetName()].bConfirm = 1;
		MakeArmory(nSel, nStep + 1);
	end

	return 1;
end

function Award(nSel, bRoute)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	if 1 ~= gf_JudgeRoomWeight(1, 1, tItem[1]) then
		return 0;
	end

	g_tPlayerData[GetName()] = g_tPlayerData[GetName()] or {};
	if not g_tPlayerData[GetName()].bConfirm or 1 ~= g_tPlayerData[GetName()].bConfirm then
		change_lv4_armory();
		return 0;
	end

	local tData = g_tPlayerData[GetName()];
	local tArmory = {};
	local tMagicAttribute	= {};

	if not tData.nArmory or not tData.nSeries then
		return 0;
	end
	
	if not g_tRouteArmory[tData.nArmory] then
		return 0;
	end

	local tTempArmory = g_tRouteArmory[tData.nArmory][2];
	tArmory = {tTempArmory[1], tTempArmory[2], tTempArmory[3], tTempArmory[4] + tonumber(GetPlayerRoute()) * 10}

	for k, v in g_tMagicAttribute.tMagicInfo do
		if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
			return 0;
		end
		tMagicAttribute[k] = v[tData.tMagicAttribute[k]][5][1 + tItem[5]];
	end

	local nPos = tData.nPos;
	local nEquipIndex = GetPlayerEquipIndex(nPos);
	
	if nEquipIndex ~= tData.nEquipIndex then
		Talk(1, "", "Trang bŞ trªn ng­êi b¹n lçi, h·y thö l¹i.");
		return 0;
	end
	
	if nEquipIndex <= 0 then
		Talk(1, "", g_NpcName .. "Kh«ng cã trang bŞ" .. g_tPosName[nPos] .. " .");
		return 0;
	end
	
	local g, d, p = GetItemInfoByIndex(nEquipIndex);
	
	if g ~= 0 or g_tPosDetail[nPos] ~= d then
		Talk(1, "", "VŞ trİ chØ ®Şnh ch­a trang bŞ V¨n Søc l­u ph¸i cÊp 4, sau khi ®ång ı h·y thö l¹i.");
		return 0;
	end
	
	p = p - tonumber(GetPlayerRoute()) * 10;
	
	if p ~= 4000 and p ~= 4001 then
		Talk(1, "", "VŞ trİ chØ ®Şnh ch­a trang bŞ V¨n Søc l­u ph¸i cÊp 4, sau khi ®ång ı h·y thö l¹i.");
		return 0;
	end
	
	if GetItemSpecialAttr(nEquipIndex,"LOCK") == 1 or GetItemSpecialAttr(nEquipIndex,"UNLOCKING") == 1 then
		Talk(1, "", "V¨n Søc chØ ®Şnh ®ang trong tr¹ng th¸i khãa hoÆc ®ang më khãa, kh«ng thÓ chuyÓn ®æi thuéc tİnh.");
		return 0;
	end
	
	if GetItemOwner(nEquipIndex) ~= "" then
		Talk(1, "", "V¨n Søc chØ ®Şnh ®ang trong tr¹ng th¸i Táa Hån, kh«ng thÓ chuyÓn ®æi thuéc tİnh.");
		return 0;
	end
	
	if GetCash() < 100000000 then
		Talk(1, "", "Trªn ng­êi b¹n Kh«ng ®ñ 10000 Vµng.");
		return 0;
	end
	
	if Pay(100000000) ~= 1 then
		Talk(1, "", "Trªn ng­êi b¹n Kh«ng ®ñ 10000 Vµng.");
		return 0;
	end

	local nExhance = GetEquipAttr(nEquipIndex,2);
	local nQuality = GetArmoryQuality(nEquipIndex);

	ItemLog(nEquipIndex, "L­u Thi Anh chuyÓn ®æi thuéc tİnh V¨n Søc cÊp 4. VËt phÈm ban ®Çu");
	if 1 ~= DelItemByIndex(tData.nEquipIndex, -1) then
		return 0;
	end
	local szItemName = GetItemName(tArmory[2], tArmory[3], tArmory[4]);
	gf_SetLogCaption("L­u Thi Anh chuyÓn ®æi thuéc tİnh V¨n Søc cÊp 4.");
	local _, nIdx = gf_AddItemEx({tArmory[2], tArmory[3], tArmory[4], 1, 1, tMagicAttribute[1][2], tMagicAttribute[1][1], tMagicAttribute[2][2], tMagicAttribute[2][1], tMagicAttribute[3][2], tMagicAttribute[3][1], -1, nExhance}, szItemName);
	SetArmoryQuality(nIdx, nQuality);
	
	gf_SetLogCaption("");
	
	g_tPlayerData[GetName()] = nil;
	
	nothing();

	return 1;
end

function MakeArmory_Route()
	change_lv4_armory();
end