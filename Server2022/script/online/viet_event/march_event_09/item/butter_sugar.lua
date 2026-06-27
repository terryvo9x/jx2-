--File name:	butter_sugar.lua
--Describe:		ƒÃÃ«Ω≈±æ
--Item ID:		2,1,30066
--Create Date:	2009-02-17
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

TYPE_NULL 	= 0;	--√ª”–Ω±¿¯
TYPE_ITEM 	= 1;	--∆’Õ®ŒÔ∆∑
TYPE_EQUIP 	= 2;	--¥¯ Ù–‘◊∞±∏¿‡ŒÔ∆∑
TYPE_CMD 	= 3;	--√¸¡Ó

--=========================================================================================
g_szLogTitle = "Event th∏ng 3"			--¥À¥¶∑÷Œ™2∂Œ÷ª «Œ™¡À≤ª‘ˆº”–¬µƒ∑≠“Î
g_nVietUseBoxEnd = 2009041300					-- π”√Ωÿ÷π»’∆⁄
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 1000000						--∑÷ƒ∏£¨±Ì æ∏≈¬ µƒµ•Œª «x∑÷÷Æ1
g_nExpNum = 125000								-- π”√“ª∏ˆƒÃÃ«ªÒµ√µƒæ≠—È÷µ

g_szFileName = "butter_sugar.lua"				--Œƒº˛√˚

g_tbItem = 
{
	--		¿‡–Õ	   ∏≈¬ 		 ˝¡ø √˚◊÷			ID1,ID2,ID3		∆⁄œﬁ(-1Œ™√ª”– ±º‰œﬁ÷∆)
	[1] = {TYPE_ITEM,	30000,		1,	"M∂nh Thi™n thπch",		2,	2,		7,		-1,	},
	[2] = {TYPE_ITEM,	20000,		1,	"Thi™n thπch",			2,	2,		8,		-1,	},
	[3] = {TYPE_ITEM,	30000,		1,	"M∂nh B®ng thπch",		2,	1,		148,	-1,	},
	[4] = {TYPE_ITEM,	20000,		1,	"B®ng thπch",			2,	1,		149,	-1,	},
	[5] = {TYPE_ITEM,	50000,		1,	"BÂng Lai Ti™n ThÒy",		2,	1,		1012,	-1,	},
	[6] = {TYPE_ITEM,	80000,		1,	"BÂng Lai LÈ ThÒy",		2,	1,		1052,	-1,	},
	[7] = {TYPE_ITEM,	20000,		1,	"Th’ Th©n phÔ",		2,	0,		556,	7,	},
	[8] = {TYPE_ITEM,	30000,		1,	"Ti™u Ki’p t∏n",		2,	0,		141,	7,	},
	[9] = {TYPE_ITEM,	10,			1,	"B∏t B∂o T»y TÒy Ti™n ß¨n",	2,	0,		138,	7,	},
	[10] = {TYPE_ITEM,	40,			1,	"T»y TÒy linh Æ¨n",		2,	0,		137,	7,	},
	[11] = {TYPE_ITEM,	5000,		1,	"Thi™n Hµ MÀt tﬁch",		0,	107,	64,		-1,	},
	[12] = {TYPE_ITEM,	3000,		1,	"Tˆ Hµ MÀt tﬁch",		0,	107,	65,		-1,	},
	[13] = {TYPE_ITEM,	2000,		1,	"Chi™m Y PhÊ",		0,	107,	66,		-1,	},
	[14] = {TYPE_ITEM,	10,			1,	"Kim Cang PhÙc Ma kinh",	0,	107,	1,		-1,	},
	[15] = {TYPE_ITEM,	5,			1,	"Ti“m Long MÀt tﬁch",		0,	107,	3,		-1,	},
	[16] = {TYPE_ITEM,	10,			1,	"V´ Tr«n MÀt tﬁch",		0,	107,	5,		-1,	},
	[17] = {TYPE_ITEM,	10,			1,	"Thi™n La MÀt Tﬁch",		0,	107,	7,		-1,	},
	[18] = {TYPE_ITEM,	5,			1,	"Nh≠ ˝ MÀt Tﬁch",		0,	107,	9,		-1,	},
	[19] = {TYPE_ITEM,	10,			1,	"B›ch H∂i PhÊ",		0,	107,	11,		-1,	},
	[20] = {TYPE_ITEM,	10,			1,	"HÁn ßÈn MÀt tﬁch",		0,	107,	13,		-1,	},
	[21] = {TYPE_ITEM,	5,			1,	"Qu˝ Thi™n MÀt tﬁch",		0,	107,	15,		-1,	},
	[22] = {TYPE_ITEM,	10,			1,	"Huy“n ∂nh MÀt tﬁch",		0,	107,	17,		-1,	},
	[23] = {TYPE_ITEM,	5,			1,	"Qu©n Tˆ MÀt tﬁch",		0,	107,	19,		-1,	},
	[24] = {TYPE_ITEM,	5,			1,	"Tr n Qu©n MÀt tﬁch",		0,	107,	21,		-1,	},
	[25] = {TYPE_ITEM,	10,			1,	"Xuy™n V©n MÀt tﬁch",		0,	107,	23,		-1,	},
	[26] = {TYPE_ITEM,	20,			1,	"U Minh Qu˚ LÙc",		0,	107,	25,		-1,	},
	[27] = {TYPE_ITEM,	10,			1,	"Linh CÊ MÀt tﬁch",		0,	107,	27,		-1,	},
	[28] = {TYPE_ITEM,	20000,		1,	"Ch◊a Kh„a Vµng",		2,	1,		30069,	30,	},

	--		¿‡–Õ	   ∏≈¬   ˝÷µ	Ã· æ◊÷∑˚¥Æ 		√¸¡Ó◊÷∑˚¥Æ
	[29] = {TYPE_CMD,	249825,	3,	{" Æi”m danh v‰ng"},		"ModifyReputation(%d,0)"},
	[30] = {TYPE_CMD,	170000,	5,	{" Æi”m danh v‰ng"},		"ModifyReputation(%d,0)"},
	[31] = {TYPE_CMD,	100000,	10,	{" Æi”m danh v‰ng"},		"ModifyReputation(%d,0)"},
	[32] = {TYPE_CMD,	20000,	50,	{" Æi”m danh v‰ng"},		"ModifyReputation(%d,0)"},
	[33] = {TYPE_CMD,	100000,	20,	" Æi”m tu luy÷n",		"ModifyPopur(%d)"},
	[34] = {TYPE_CMD,	50000,	100,"ßi”m Tµng ki’m",	"SetTask(1801, GetTask(1801)+%d)"},
}


--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("VÀt ph»m nµy Æ∑ qu∏ hπn, kh´ng th” sˆ dÙng th™m n˜a.")
		return
	end
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho∂ng trËng hµnh trang ho∆c s¯c l˘c kh´ng ÆÒ, xin ki”m tra lπi!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--æ≠—ÈΩ±¿¯≤ø∑÷
	local nExp = g_nExpNum
	local nExpTotal = GetTask(SUGAR_TOTALEXP_09_MARCH_VIET)
	if nExpTotal >= SUGAR_EXP_LIMIT_09_MARCH_VIET then
		Msg2Player("C∏c hπ Æ∑ thu Æ≠Óc kinh nghi÷m cao nh t tı vÀt ph»m K—o S˜a "..SUGAR_EXP_LIMIT_09_MARCH_VIET.." , Hi÷n tπi kh´ng th” nhÀn th™m kinh nghi÷m tı hoπt ÆÈng nµy, nh≠ng c„ th” sœ c„ c¨ hÈi nhÀn ph«n th≠Îng kh∏c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > SUGAR_EXP_LIMIT_09_MARCH_VIET then
		nExp = SUGAR_EXP_LIMIT_09_MARCH_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( SUGAR_TOTALEXP_09_MARCH_VIET, (nExpTotal+nExp) )
		Msg2Player("Bπn nhÀn Æ≠Óc  "..nExp.."  Æi”m kinh nghi÷m");

		local szItemName = "Æi”m kinh nghi÷m"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "K—o s˜a", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
	--ŒÔ∆∑Ω±¿¯≤ø∑÷
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode, nItemIdx = 0, 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode,nItemIdx = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode,nItemIdx = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--ƒ¨»œ√¸¡Ó≥…π¶÷¥––
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("Bπn nhÀn Æ≠Óc  "..nItemNum.." "..szItemName)
		end
		if (nType == TYPE_ITEM or nType == TYPE_EQUIP) and g_tbItem[nRandIdx][8] > 0 then
			SetItemExpireTime(nItemIdx, g_tbItem[nRandIdx][8]*24*3600)
		end
		WriteLogEx(g_szLogTitle, "K—o s˜a", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, szInfoDescribe, GetTongName(), "Thu Æ≠Óc th t bπi, ".."AddItem return value = "..nRetCode)
	end
end

--∞¥’’∏≈¬ ªÒµ√g_tbItem¿Ô√Êµƒ“ªœÓƒ⁄»›
function get_random_item(nTab)
	local nRandom = random(1,g_nDenominator)
	local nBase = 0
	if check_item_tab(nTab) == 1 then
		for i=1,getn(nTab) do
			if nRandom <= nTab[i][2]+nBase then
				return i
			else
				nBase = nBase + nTab[i][2]
			end
		end
	else
		return 0
	end
end

--ºÏ≤È ‰»Îµƒtable «∑Ò’˝»∑
function check_item_tab(tTab)
	local nTotalProbability= 0
	for i=1,getn(tTab) do
		nTotalProbability = nTotalProbability + tTab[i][2]
	end
	if nTotalProbability == g_nDenominator then
		return 1
	else
		print("\n error item table in "..g_szFileName.." \n")
		return 0
	end
end

