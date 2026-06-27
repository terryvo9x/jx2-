-- Created by TuanNA5

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

TOKEN_TASK_ID = 2428

tAward ={
	[5] = {"MËt TŞch Tø Linh V« Song",{0,107,165,1},1,1},
	[6] = {"Kú L©n Thó",{0,105,30000,1,1,-1,-1,-1,-1,-1,-1},1,100},
	[7] = {"Trang bŞ Viªm §Õ",{0,100,8000,1,1,-1,-1,-1,-1,-1,-1,0,7},3,300},
	[8] = {"§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch",{2,1,1067,1},1,1},
	[9] = {"§¹i hång bao hoµng kim",{2,1,539,30},1,1},
}

-- tªn ngo¹i trang, G, D, P, sè lÇn chuyÓn sinh + lv mua ®­îc (do chuyÓn sinh tiÕp theo ko bŞ giíi h¹n lv mua nªn ghĞp 2 sè thµnh 1)
t_translife_cloth = 
{
	[1] = {"V¨n Sö ngo¹i trang",0,108,570,290},
	[2] = {"Thiªn ¢m ngo¹i trang",0,108,562,390},
	[3] = {"ThiÕu D­¬ng ngo¹i trang",0,108,566,488},
	[4] = {"Tø Linh ViÖt  ngo¹i trang",0,108,30001,588},
}
-- tªn ngo¹i trang, G, D, P, sè lÇn chuyÓn sinh + lv mua ®­îc (do chuyÓn sinh tiÕp theo ko bŞ giíi h¹n lv mua nªn ghĞp 2 sè thµnh 1)
t_translife_cloth_cs6 = 
{
	[1] = {"V¨n Sö ngo¹i trang",0,108,570,188, 288,388,489},
	[2] = {"Thiªn ¢m ngo¹i trang",0,108,562,188, 288,388,489},
	[3] = {"ThiÕu D­¬ng ngo¹i trang",0,108,566,188, 288,388,489},
	[4] = {"Tø Linh Phôc Sinh ngo¹i trang",0,108,30005,188, 288,388,489},	
	[5] = { --phôc sinh 1
			[1] = {
					[1] = {{0,108,30005,1,4,5,639,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,6,306,6,102}},
					[2] = {{0,108,30006,1,4,5,639,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,6,306,6,102}},
					[3] = {{0,108,30007,1,4,5,639,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,6,306,6,102}},
					[4] = {{0,108,30008,1,4,5,639,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,6,306,6,102}},
				},
			[2] = {
					[1] = {{0,108,30005,1,4,6,302,6,102}, {0,109,30005,1,4,5,409,6,102}, {0,110,30005,1,4,5,79,5,80,6,102}},
					[2] = {{0,108,30006,1,4,6,302,6,102}, {0,109,30006,1,4,5,409,6,102}, {0,110,30006,1,4,5,79,5,80,6,102}},
					[3] = {{0,108,30007,1,4,6,302,6,102}, {0,109,30007,1,4,5,409,6,102}, {0,110,30007,1,4,5,79,5,80,6,102}},
					[4] = {{0,108,30008,1,4,6,302,6,102}, {0,109,30008,1,4,5,409,6,102}, {0,110,30008,1,4,5,79,5,80,6,102}},
				},
			[3] = {
					[1] = {{0,108,30005,1,4,2,13075,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,6,306,6,102}},
					[2] = {{0,108,30006,1,4,2,13075,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,6,306,6,102}},
					[3] = {{0,108,30007,1,4,2,13075,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,6,306,6,102}},
					[4] = {{0,108,30008,1,4,2,13075,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,6,306,6,102}},
				},
			[4] = {
					[1] = {{0,108,30005,1,4,5,27,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,4,292,4,293,6,102}},
					[2] = {{0,108,30006,1,4,5,27,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,4,292,4,293,6,102}},
					[3] = {{0,108,30007,1,4,5,27,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,4,292,4,293,6,102}},
					[4] = {{0,108,30008,1,4,5,27,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,4,292,4,293,6,102}},
				},
		},
	[6] = { --phôc sinh 2
				[1] = {
					[1] = {{0,108,30029,1,4,7,639,3,371,7,102}, {0,109,30029,1,4,5,342,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,7,639,3,371,7,102}, {0,109,30030,1,4,5,342,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,7,639,3,371,7,102}, {0,109,30031,1,4,5,342,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,7,639,3,371,7,102}, {0,109,30032,1,4,5,342,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
				},
			[4] = {
					[1] = {{0,108,30029,1,4,7,27,7,102}, {0,109,30029,1,4,5,342,4,409,7,102}, {0,110,30029,1,4,5,292,5,293,7,102}},
					[2] = {{0,108,30030,1,4,7,27,7,102}, {0,109,30030,1,4,5,342,4,409,7,102}, {0,110,30030,1,4,5,292,5,293,7,102}},
					[3] = {{0,108,30031,1,4,7,27,7,102}, {0,109,30031,1,4,5,342,4,409,7,102}, {0,110,30031,1,4,5,292,5,293,7,102}},
					[4] = {{0,108,30032,1,4,7,27,7,102}, {0,109,30032,1,4,5,342,4,409,7,102}, {0,110,30032,1,4,5,292,5,293,7,102}},
				},
			[3] = {
					[1] = {{0,108,30029,1,4,3,13075,7,102}, {0,109,30029,1,4,5,342,2,346,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,3,13075,7,102}, {0,109,30030,1,4,5,342,2,346,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,3,13075,7,102}, {0,109,30031,1,4,5,342,2,346,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,3,13075,7,102}, {0,109,30032,1,4,5,342,2,346,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
				},											
			[2] = {
					[1] = {{0,108,30029,1,4,6,302,7,409,7,102}, {0,109,30029,1,4,5,13219,5,13220,7,102}, {0,110,30029,1,4,4,290,7,250,7,102}},
					[2] = {{0,108,30030,1,4,6,302,7,409,7,102}, {0,109,30030,1,4,5,13219,5,13220,7,102}, {0,110,30030,1,4,4,290,7,250,7,102}},
					[3] = {{0,108,30031,1,4,6,302,7,409,7,102}, {0,109,30031,1,4,5,13219,5,13220,7,102}, {0,110,30031,1,4,4,290,7,250,7,102}},
					[4] = {{0,108,30032,1,4,6,302,7,409,7,102}, {0,109,30032,1,4,5,13219,5,13220,7,102}, {0,110,30032,1,4,4,290,7,250,7,102}},
				},	
		},
	[7] = { --phôc sinh 3
			[1] = {
					[1] = {{0,108,680,1,4,7,639,5,329}, {0,109,680,1,4,1,563,5,13658,5,329}, {0,110,680,1,4,6,13702,1,13716,5,329}},
					[2] = {{0,108,681,1,4,7,639,5,329}, {0,109,681,1,4,1,563,5,13658,5,329}, {0,110,681,1,4,6,13702,1,13716,5,329}},
					[3] = {{0,108,682,1,4,7,639,5,329}, {0,109,682,1,4,1,563,5,13658,5,329}, {0,110,682,1,4,6,13702,1,13716,5,329}},
					[4] = {{0,108,683,1,4,7,639,5,329}, {0,109,683,1,4,1,563,5,13658,5,329}, {0,110,683,1,4,6,13702,1,13716,5,329}},
				},
			[4] = {
					[1] = {{0,108,680,1,4,7,27,4,13488,5,329}, {0,109,680,1,4,1,13711,5,13658,5,329}, {0,110,680,1,4,5,13705,1,13716,5,329}},
					[2] = {{0,108,681,1,4,7,27,4,13488,5,329}, {0,109,681,1,4,1,13711,5,13658,5,329}, {0,110,681,1,4,5,13705,1,13716,5,329}},
					[3] = {{0,108,682,1,4,7,27,4,13488,5,329}, {0,109,682,1,4,1,13711,5,13658,5,329}, {0,110,682,1,4,5,13705,1,13716,5,329}},
					[4] = {{0,108,683,1,4,7,27,4,13488,5,329}, {0,109,683,1,4,1,13711,5,13658,5,329}, {0,110,683,1,4,5,13705,1,13716,5,329}},
				},
			[2] = {
					[1] = {{0,108,680,1,4,4,13243,1,13344,5,329}, {0,109,680,1,4,1,13205,5,13658,5,329}, {0,110,680,1,4,3,476,1,13716,5,329}},
					[2] = {{0,108,681,1,4,4,13243,1,13344,5,329}, {0,109,681,1,4,1,13205,5,13658,5,329}, {0,110,681,1,4,3,476,1,13716,5,329}},
					[3] = {{0,108,682,1,4,4,13243,1,13344,5,329}, {0,109,682,1,4,1,13205,5,13658,5,329}, {0,110,682,1,4,3,476,1,13716,5,329}},
					[4] = {{0,108,683,1,4,4,13243,1,13344,5,329}, {0,109,683,1,4,1,13205,5,13658,5,329}, {0,110,683,1,4,3,476,1,13716,5,329}},
				},											
			[3] = {
					[1] = {{0,108,680,1,4,3,13075,5,329}, {0,109,680,1,4,1,13707,5,13658,5,329}, {0,110,680,1,4,1,476,1,13716,5,329}},
					[2] = {{0,108,681,1,4,3,13075,5,329}, {0,109,681,1,4,1,13707,5,13658,5,329}, {0,110,681,1,4,1,476,1,13716,5,329}},
					[3] = {{0,108,682,1,4,3,13075,5,329}, {0,109,682,1,4,1,13707,5,13658,5,329}, {0,110,682,1,4,1,476,1,13716,5,329}},
					[4] = {{0,108,683,1,4,3,13075,5,329}, {0,109,683,1,4,1,13707,5,13658,5,329}, {0,110,683,1,4,1,476,1,13716,5,329}},
				},	
		},
	[8] = { --phôc sinh 4
			[1] = {
					[1] = {{0,108,901,1,4,3,13714,1,14146}, {0,109,901,1,4,4,13708,1,14136}, {0,110,901,1,4,1,13718,1,14150}},
					[2] = {{0,108,902,1,4,3,13714,1,14146}, {0,109,902,1,4,4,13708,1,14136}, {0,110,902,1,4,1,13718,1,14150}},
					[3] = {{0,108,903,1,4,3,13714,1,14146}, {0,109,903,1,4,4,13708,1,14136}, {0,110,903,1,4,1,13718,1,14150}},
					[4] = {{0,108,904,1,4,3,13714,1,14146}, {0,109,904,1,4,4,13708,1,14136}, {0,110,904,1,4,1,13718,1,14150}},
				},
			[4] = {
					[1] = {{0,108,901,1,4,13,14131,2,14145}, {0,109,901,1,4,1,14132,2,14143}, {0,110,901,1,4,5,13705,2,14144}},
					[2] = {{0,108,902,1,4,13,14131,2,14145}, {0,109,902,1,4,1,14132,2,14143}, {0,110,902,1,4,5,13705,2,14144}},
					[3] = {{0,108,903,1,4,13,14131,2,14145}, {0,109,903,1,4,1,14132,2,14143}, {0,110,903,1,4,5,13705,2,14144}},
					[4] = {{0,108,904,1,4,13,14131,2,14145}, {0,109,904,1,4,1,14132,2,14143}, {0,110,904,1,4,5,13705,2,14144}},
				},
			[2] = {
					[1] = {{0,108,901,1,4,5,13243,2,14147}, {0,109,901,1,4,6,13717,2,14143}, {0,110,901,1,4,2,13718,2,14144}},
					[2] = {{0,108,902,1,4,5,13243,2,14147}, {0,109,902,1,4,6,13717,2,14143}, {0,110,902,1,4,2,13718,2,14144}},
					[3] = {{0,108,903,1,4,5,13243,2,14147}, {0,109,903,1,4,6,13717,2,14143}, {0,110,903,1,4,2,13718,2,14144}},
					[4] = {{0,108,904,1,4,5,13243,2,14147}, {0,109,904,1,4,6,13717,2,14143}, {0,110,904,1,4,2,13718,2,14144}},
				},											
			[3] = {
					[1] = {{0,108,901,1,4,1,14148}, {0,109,901,1,4,6,13708,1,14136}, {0,110,901,1,4,1,13718,1,14150}},
					[2] = {{0,108,902,1,4,1,14148}, {0,109,902,1,4,6,13708,1,14136}, {0,110,902,1,4,1,13718,1,14150}},
					[3] = {{0,108,903,1,4,1,14148}, {0,109,903,1,4,6,13708,1,14136}, {0,110,903,1,4,1,13718,1,14150}},
					[4] = {{0,108,904,1,4,1,14148}, {0,109,904,1,4,6,13708,1,14136}, {0,110,904,1,4,1,13718,1,14150}},
				},	
		},
}
t_translife_horse = 
{
	[1] = {"Niªn Thó",{0, 105, 33, 1, 1, 3, 403}, 292, 1000000},
	[2] = {"B¹ch Hæ", {0, 105, 30009, 1, 4, -1, -1, -1, -1, -1, -1}, 490, 10000000},
}
t_translife_horse_cs6 = 
{
	[1] = {"B¹ch Hæ", {0, 105, 30009, 1, 4, -1, -1, -1, -1, -1, -1}, 190, 10000000},
	[2] = {"H¾c Hæ", {0, 105, 30011, 1, 4, -1, -1, -1, -1, -1, -1}, 191, 10000000},	
	[3] = {"Ngù KiÕm Phôc Sinh 2", {0, 105, 10107, 1, 4, -1, -1, -1, -1, -1, -1}, 290, 8},	--Phôc Sinh 2 (cs7)
	[4] = {"Ngù KiÕm Phôc Sinh 3", {0, 105, 10108, 1, 4, -1, -1, -1, -1, -1, -1}, 392, 10000000},	--Phôc Sinh 3 (cs8)
	[5] = {"Long M·", {0, 105, 30056, 1, 4, -1, -1, -1, -1, -1, -1}, 491, 10000000},	--Phôc Sinh 4 (cs9)
}

tSFX ={
	{957,931},
	{955,922},
	{959,927},
	{956,928},
}

tLife = {"Long","Hæ","¦ng","Phông"}
tLife_cs6 = {"Long","Hæ","¦ng","Phông"}

tb_translife_weapon_effect = {			
			"Hµo m«n",
			"PhÇn V©n",
			"§o¹n Giao",			
			"Ph¸ Qu©n",
}

function UseDragonToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "BËt Long Tö Quang/#GetSFX(1)")
	tinsert(tSay, "T¾t Long Tö Quang/CloseSFX")
	tinsert(tSay, "Kİch ho¹t hiÖu øng Vò Khİ/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then
 		tinsert(tSay, "Long Tö Héi lÖnh/#TransferLife(1)")
 	else
 		tinsert(tSay, "Tø Linh Long Tö lÖnh/#TranferTuLinh(1)")
 	end
 	tinsert(tSay, "§ãng/closedialog")
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Long Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Long Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)
end

function UseTigerToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "BËt Hæ Tö Quang/#GetSFX(2)")
	tinsert(tSay, "T¾t Hæ Tö Quang/CloseSFX")
	tinsert(tSay, "Kİch ho¹t hiÖu øng Vò Khİ/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then	
		tinsert(tSay, "Hæ Tö Héi lÖnh/#TransferLife(2)")
	else
		tinsert(tSay, "Tø Linh Hæ Tö lÖnh/#TranferTuLinh(2)")
	end	 	
	tinsert(tSay, "§ãng/closedialog")	
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Hæ Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Hæ Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)
end


function UseFengToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "BËt Phông Tö Quang/#GetSFX(3)")
	tinsert(tSay, "T¾t Phông Tö Quang/CloseSFX")
	tinsert(tSay, "Kİch ho¹t hiÖu øng Vò Khİ/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then			
		tinsert(tSay, "Phông Tö Héi lÖnh/#TransferLife(4)")
 	else
 		tinsert(tSay, "Tø Linh Phông Tö lÖnh/#TranferTuLinh(4)")
 	end	 	
 	tinsert(tSay, "§ãng/closedialog")	
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Phông Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Phông Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)
end


function UseYingToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "BËt ¦ng Tö Quang/#GetSFX(4)")
	tinsert(tSay, "T¾t ¦ng Tö Quang/CloseSFX")
	tinsert(tSay, "Kİch ho¹t hiÖu øng Vò Khİ/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then			
 		tinsert(tSay, "¦ng Tö Héi lÖnh/#TransferLife(3)")
 	else
 		tinsert(tSay, "Tø Linh ¦ng Tö lÖnh/#TranferTuLinh(3)")
 	end	 		 		
	tinsert(tSay, "§ãng/closedialog")	
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! ¦ng Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ ¦ng Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)
end

function WeaponEffect(nIndex)
	BindWeaponEffect(tb_translife_weapon_effect[nIndex],1)	
end

function GetItem(nIndex)
	local nTaskVal = GetTask(TOKEN_TASK_ID)
	local nDate = tonumber(date("%Y%m%d"))
	
	if nDate >= 20091007 then
		Say("H¹n nhËn th­ëng ®· kÕt thóc!",0)
		return
	end	
	
	if GetBit(nTaskVal,nIndex) == 1 then
		Say("§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi!",0)
		return
	end
	
	if GetExtPoint(4) ~= 2 then
		Say("§¹i hiÖp ch­a ®ñ ®iÒu kiÖn nhËn th­ëng!",0)
		return
	end
	
	if gf_JudgeRoomWeight(tAward[nIndex][3],tAward[nIndex][4],"") == 0 then
		return
	end		
	
	SetTask(TOKEN_TASK_ID,SetBit(nTaskVal,nIndex,1))
	
	if nIndex == 5 or nIndex == 9 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			WriteLogEx("Phan thuong bang chu","nhËn",1,tAward[nIndex][1])		
		end	
	elseif nIndex == 6 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			gf_SetItemExpireTime(nItemIdx,2010,03,31,24,0,0)
			WriteLogEx("Phan thuong bang chu","nhËn",1,tAward[nIndex][1])		
		end		
	elseif nIndex == 7 then
		for i=100,103 do
			if i ~= 102 then
				local nRet, nItemIdx = gf_AddItemEx({0,i,8000+ GetBody(),1,1,-1,-1,-1,-1,-1,-1,0,7},tAward[nIndex][1])
				if Ret == 1 then
					WriteLogEx("Phan thuong bang chu","nhËn",1,tAward[nIndex][1])
				end
			end
		end	
	elseif nIndex == 8 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			SetItemExpireTime(nItemIdx,30*24*60*60)
			WriteLogEx("Phan thuong bang chu","nhËn",1,tAward[nIndex][1])		
		end
	else
		return
	end
end

function GetSFX(nIndex)
	if PlayerIndex > 0 then
		SetCurrentNpcSFX(PIdx2NpcIdx(),tSFX[nIndex][1],1,1)
		SetCurrentNpcSFX(PIdx2NpcIdx(),tSFX[nIndex][2],5,1)	
	end
end

function CloseSFX()
	if PlayerIndex > 0 then
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,5,1)
	end
end

function GetAward()
	local tSay={
		"NhËn phÇn th­ëng MËt TŞch Tø Linh V« Song/#GetItem(5)",
	 	"NhËn phÇn th­ëng Kú L©n/#GetItem(6)",
	 	"NhËn phÇn th­ëng Viªm §Õ/#GetItem(7)", 
	 	"NhËn phÇn th­ëng §Şnh Hån Thiªn Th¹ch ThÇn Th¹ch/#GetItem(8)",
	 	"NhËn phÇn th­ëng 30 §¹i hång bao hoµng kim/#GetItem(9)", 
	 	"§ãng/closedialog",	
	}
	Say("PhÇn th­ëng dµnh cho Bang chñ cña Bang héi h¹ng nhÊt nh©n khİ. Thêi gian nhËn th­ëng <color=red>01/10/2009 - 24:00 07/10/2009<color>.",getn(tSay),tSay)
end

function TransferLife(szLife)
	local tSay={	 	
	 	"Mua ngo¹i trang chuyÓn sinh (cÇn 200 vËt phÈm Xu, h¹n sö dông 30 ngµy)/buy_translife_cloth",
	 	format("Mua trang bŞ dßng %s Tö/buy_translife_equip",tLife[szLife]),
	 	format("Kİch ho¹t thó c­ìi dßng %s Tö/buy_translife_horse",tLife[szLife]),
	 	format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh dßng %s Tö/translife_cloth",tLife[szLife]),
	 	"Kİch ho¹t chÕ t¹o Vò Khİ Linh Ph¸ch/nothing",
	 	"Kİch ho¹t Kü N¨ng Sèng sau chuyÓn sinh/nothing",
	 	"§ãng/closedialog",	
	}
	Say(format("C¸c chøc n¨ng cña %s Tö Héi:",tLife[szLife]),getn(tSay),tSay)
end

function buy_translife_equip()
	local tSay={
		"NhËn HËu NghÖ L¹c NhËt Hoµn 1 lÇn (yªu cÇu ®¼ng cÊp 86 + h¹n sö dông 30 ngµy + tu luyÖn theo h­íng Long/Hæ/¦ng Tö)/#get_translife_equip(1)",
		"NhËn H»ng Nga HuyÔn ThÇn §¸i 1 lÇn (yªu cÇu ®¼ng cÊp 86 + h¹n sö dông 30 ngµy + tu luyÖn theo h­íng Phông Tö)/#get_translife_equip(2)",
		"NhËn KhuÊt Nguyªn Béi 1 lÇn (yªu cÇu ®¼ng cÊp 92 + h¹n sö dông 30 ngµy)/#get_translife_equip(3)",
		"Mua HËu NghÖ L¹c NhËt Hoµn (cÇn 700 ®iÓm s­ m«n + 700 ®iÓm danh väng + h¹n sö dông 7 ngµy)/#confirm_buy_translife_equip(1)",		
		"Mua H»ng Nga HuyÔn ThÇn §¸i (cÇn 700 ®iÓm s­ m«n + 700 ®iÓm danh väng + h¹n sö dông 7 ngµy)/#confirm_buy_translife_equip(2)",
		"Mua KhuÊt Nguyªn Bé (cÇn 1500 ®iÓm s­ m«n + 1500 ®iÓm danh väng + h¹n sö dông 7 ngµy)/#confirm_buy_translife_equip(3)",		
		"§ãng/closedialog",
	}
	Say("C¸c lo¹i trang søc: ",getn(tSay),tSay)
end

function get_translife_equip(nType)
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if (nType == 3) and (nTransCount < 592) then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if nTransCount < 388 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if GetTaskTrans() == 23 or GetTaskTrans() == 31 or GetTaskTrans() == 37 or GetTaskTrans() == 38  then
		if nType == 1 then
			if BigGetItemCount(0,102,43) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
				return
			end
			if GetTranslifeFaction() == 4 then
				Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Long/Hæ/¦ng Tö míi cã thÓ nhËn trang søc nµy!!")
				return
			end
			gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh","nhËn",30*24*3600,1)	
		elseif nType == 2 then
			if BigGetItemCount(0,102,42) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
				return
			end
			if GetTranslifeFaction() ~= 4 then
				Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Phông Tö míi cã thÓ mua trang søc nµy!!")
				return
			end
			gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh","nhËn",30*24*3600,1)
		elseif nType == 3 then
			if BigGetItemCount(0,102,27) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
				return
			end
			gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh","nhËn",30*24*3600,1)
		end
		SetTaskTrans()
	else
		Talk(1,"","B¹n ®· nhËn trang søc nµy råi hoÆc b¹n ch­a ®ñ ®iÒu kiÖn nhËn!")
		return
	end
end
function confirm_buy_translife_equip(nType)
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nType == 3 and nTransCount < 592 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if nTransCount < 388 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if GetReputation() < 10000 or GetTask(336) < 10000 then
		Talk(1,"","B¹n kh«ng ®ñ 10000 ®iÓm S­ M«n hoÆc 10000 Danh Väng ®Ó mua trang søc nµy!")
		return
	end
	if nType == 1 then
		if GetTranslifeFaction() == 4 then
			Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Long/Hæ/¦ng Tö míi cã thÓ mua trang søc nµy!!")
			return
		end
		if BigGetItemCount(0,102,43) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ mua thªm!")
			return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh","nhËn",7*24*3600,1)		
	elseif nType == 2 then
		if GetTranslifeFaction() ~= 4 then
			Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Phông Tö míi cã thÓ mua trang søc nµy!!")
			return
		end
		if BigGetItemCount(0,102,42) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ mua thªm!")
				return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh","nhËn",7*24*3600,1)
	elseif nType == 3 then
		if BigGetItemCount(0,102,27) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
				return
		end
		ModifyReputation(-1500,1)
		SetTask(336,GetTask(336) - 1500)
		Msg2Player("B¹n bŞ trõ 1500 ®iÓm s­ m«n!")
		gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh","nhËn",7*24*3600,1)
	end
end

function buy_translife_horse()
	local tSay={	 	
		"Kú L©n Niªn Thó (cÇn 1 Phiªu Vò + 100 vµng)/#confirm_buy_translife_horse(1)",
		"B¹ch Hæ ThÇn Thó (cÇn 1 Phiªu Vò + 1000 vµng)/#confirm_buy_translife_horse(2)",
		"§ãng/closedialog",
	}
	Say("C¸c thó c­ìi:",getn(tSay),tSay)
end

function confirm_buy_translife_horse(nType)
	
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nTransCount < t_translife_horse[nType][3] then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if GetCash() <  t_translife_horse[nType][4] then
		Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
		return
	end
	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng hoÆc ®é nÆng, vui lßng s¾p xÕp l¹i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B¹n ph¶i trang bŞ ngùa míi cã thÓ ®æi ®­îc!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Talk(1,"","B¹n ph¶i trang bŞ Phiªu Vò míi cã thÓ ®æi ®­îc!")
		return
	end
	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx, -1) == 1 and Pay(t_translife_horse[nType][4]) == 1 then	
		local nOk, nItemIndex = gf_AddItemEx2(t_translife_horse[nType][2],t_translife_horse[nType][1],"Thu cuoi chuyen sinh","mua",nExpireTime,0)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)			
		end
		Msg2Player("B¹n nhËn ®­îc 1 "..t_translife_horse[nType][1]..".")		
	end
end

function buy_translife_cloth()
	local tSay={	 	
		"V¨n Sö ngo¹i trang/#confirm_buy_translife_cloth(1)",
		"Thiªn ¢m ngo¹i trang/#confirm_buy_translife_cloth(2)",
		"ThiÕu D­¬ng ngo¹i trang/#confirm_buy_translife_cloth(3)",
		"Tø Linh ViÖt  ngo¹i trang/#confirm_buy_translife_cloth(4)",
		"Tø Linh ngo¹i trang/nothing",
		"§ãng/closedialog",
	}
	Say("C¸c ngo¹i trang:",getn(tSay),tSay)
end


function confirm_buy_translife_cloth(nType)

	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nTransCount < t_translife_cloth[nType][5] then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if GetItemCount(2,1,30230) < 200 then
		Say("B¹n kh«ng mang theo ®ñ 200 vËt phÈm Xu!",0)
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if DelItem(2,1,30230,200) == 1 then
		for i = 0, 2 do
			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth[nType][4]  + GetBody() - 1, 1, 1)
			if nOk == 1 then
				SetItemStatus(nItemIndex, 0, 1)
				SetItemExpireTime(nItemIndex, 30*24*3600)
			end
		end
		Msg2Player("B¹n nhËn ®­îc "..t_translife_cloth[nType][1])
		WriteLogEx("Ngoai trang chuyen sinh","mua",	1, t_translife_cloth[nType][1])
	end
end

function translife_cloth()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local tSay = {
		"Kİch ho¹t M·o ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 100 vµng)/#translife_cloth_confirm(6)",
		"Kİch ho¹t Th­îng y  ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 100 vµng)/#translife_cloth_confirm(7)",
		"Kİch ho¹t H¹ y ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 100 vµng)/#translife_cloth_confirm(8)",
		"§ãng/closedialog",
	}
	Say("Chän lo¹i ngo¹i trang muèn kİch ho¹t:",getn(tSay),tSay)
end

function translife_cloth_cs6()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local tSay = {
		"Kİch ho¹t M·o ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(6)",
		"Kİch ho¹t Th­îng y  ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(7)",
		"Kİch ho¹t H¹ y ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(8)",
		"§ãng/closedialog",
	}
	Say("Chän lo¹i ngo¹i trang muèn kİch ho¹t:",getn(tSay),tSay)
end

function translife_cloth_cs7()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local tSay = {
		"Kİch ho¹t M·o ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(6)",
		"Kİch ho¹t Th­îng y  ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(7)",
		"Kİch ho¹t H¹ y ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(8)",
		"§ãng/closedialog",
	}
	Say("Chän lo¹i ngo¹i trang muèn kİch ho¹t:",getn(tSay),tSay)
end

function translife_cloth_cs8()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local tSay = {
		"Kİch ho¹t M·o ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(6)",
		"Kİch ho¹t Th­îng y  ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(7)",
		"Kİch ho¹t H¹ y ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(8)",
		"§ãng/closedialog",
	}
	Say("Chän lo¹i ngo¹i trang muèn kİch ho¹t:",getn(tSay),tSay)
end

function translife_cloth_cs9()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local tSay = {
		"Kİch ho¹t M·o ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(6)",
		"Kİch ho¹t Th­îng y  ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(7)",
		"Kİch ho¹t H¹ y ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(8)",
		"§ãng/closedialog",
	}
	Say("Chän lo¹i ngo¹i trang muèn kİch ho¹t:",getn(tSay),tSay)
end

function translife_cloth_confirm(nType)
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = GetTranslifeCount()
	local nFaction = GetTranslifeFaction()
	if nPhucSinh < 1 then
		if nTransCount < 1 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	end
	if GetLevel() < 79 then
		Say("B¹n ch­a ®ñ ®¼ng cÊp sö dông chøc n¨ng nµy!",0)
		return
	end
	if GetPlayerRebornParam(0) >= 1 then
		if GetCash()  < 8000000 then
			Talk(1,"","B¹n kh«ng cã ®ñ ng©n l­îng.")
			return
		end		
	else
		if GetCash()  < 1000000 then
			Talk(1,"","B¹n kh«ng cã ®ñ ng©n l­îng.")
			return
		end		
	end	
	if gf_Judge_Room_Weight(1, 100, " ") == 0 then				
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(nType)
	local nItemIdx = GetPlayerEquipIndex(nType)
	local nCanAdd = 0
	local nIdex = 0
	if nG == 0 and nD ==0 and nP ==0 then
		Talk(1,"","Ph¶i mÆc ngo¹i trang trªn ng­êi míi cã thÓ kİch ho¹t thuéc tİnh.")
		return
	end
	for i=1, getn(tb_option_cloth) do 
		if tb_option_cloth[i][1] == nG and tb_option_cloth[i][2] == nD and tb_option_cloth[i][3] == nP then
			nCanAdd = 1			
			break
		end
	end	
	if nCanAdd == 0 then
		Talk(1,"","Ngo¹i trang kh«ng phï hîp. ChØ cã thÓ kİch ho¹t B¸t B¸t ngo¹i trang, Linh Lung ngo¹i trang, T­íng Qu©n ngo¹i trang.")
		return
	end
	local nExpireTime = GetItemExpireTime(nItemIdx) or 30*24*3600
	if nExpireTime <= 0 then
	 	nExpireTime =  30*24*3600
	 end
	UnEquipAtPosition(nType)
		--------------------------------------
	if GetPlayerRebornParam(0) == 1 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs6 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,1, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end
	elseif GetPlayerRebornParam(0) == 2 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs7 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,1, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end	
	elseif GetPlayerRebornParam(0) == 3 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs8 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs8_nhanlai[nType_cs8][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,1, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end	
	elseif GetPlayerRebornParam(0) == 4 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs9 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs9_nhanlai[nType_cs9][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,1, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemIncreaseLevel(nItemIdx2,6);
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end	
	else
		--------------------------------------	
		if DelItemByIndex(nItemIdx,-1) and Pay(1000000) == 1 then
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,1, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end
		end
	end
end
function TranferTuLinh(nLife)
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","§¹i hiÖp khæng ph¶i lµ ng­êi h÷u duyªn víi bİ kİp Tø Linh Phôc Sinh.")
		return
	end
	local tSay = {}

	tinsert(tSay, 	"Ta muèn nhËn trang bŞ miÔn phİ/get_TranferTuLinh")
	tinsert(tSay, 	"Ta muèn mua trang bŞ/buy_TranferTuLinh")
	if nPhucSinh == 1 then
		tinsert(tSay, format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh Phôc Sinh 1 dßng %s Tö/translife_cloth_cs6",tLife_cs6[nLife]))
	elseif nPhucSinh == 2 then
		tinsert(tSay, format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh Phôc Sinh 2 dßng %s Tö/translife_cloth_cs7",tLife_cs6[nLife]))
	elseif nPhucSinh == 3 then
		tinsert(tSay, format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh Phôc Sinh 3 dßng %s Tö/translife_cloth_cs8",tLife_cs6[nLife]))
	elseif nPhucSinh == 4 then
		tinsert(tSay, format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh Phôc Sinh 4 dßng %s Tö/translife_cloth_cs9",tLife_cs6[nLife]))
	end
	tinsert(tSay, "§ãng/closedialog")
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Long Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Long Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)	
end

function get_TranferTuLinh()
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","§¹i hiÖp khæng ph¶i lµ ng­êi h÷u duyªn víi bİ kİp Tø Linh Phôc Sinh.")
		return
	end
	local tSay = {}
	if nPhucSinh == 1 then
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang Tø Linh miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs6_get_translife_cloth")
	end
	if nPhucSinh == 2 then
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang ThÊt TŞch miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs7_get_translife_cloth") --new
	end
	if nPhucSinh == 3 then
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang ¢m Hån miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs8_get_translife_cloth") --new ps3
	end
	if nPhucSinh == 4 then
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang Song §¸ng miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs9_get_translife_cloth") --new ps4
	end
	--tinsert(tSay, "Ta muèn nhËn Ngäc Béi Kü N¨ng 30 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 86)/cs6_get_HNHN")		
	tinsert(tSay, "Ta muèn nhËn KhuÊt Nguyªn Béi 30 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 89)/cs6_get_KNB")	
	tinsert(tSay, "§ãng/closedialog")
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Long Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Long Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)		
end

function buy_TranferTuLinh()
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","§¹i hiÖp khæng ph¶i lµ ng­êi h÷u duyªn víi bİ kİp Tø Linh Phôc Sinh.")
		return
	end
	local tSay = {}
	--tinsert(tSay, 	"Ta muèn mua HËu NghÖ L¹c NhËt Hoµn 1 lÇn (cÇn ®¼ng cÊp 86 + h¹n sö dông 7 ngµy + tu luyÖn theo h­íng Long/Hæ/¦ng Tö)/#cs6_buy_HNHN(1)")
	--tinsert(tSay, 	"Ta muèn mua H»ng Nga HuyÔn ThÇn §¸i 1 lÇn (cÇn ®¼ng cÊp 86 + h¹n sö dông 7 ngµy + tu luyÖn theo h­íng Phông Tö)/#cs6_buy_HNHN(2)")	
	tinsert(tSay, "Ta muèn mua ngo¹i trang V¨n Sö 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(1)")
	tinsert(tSay, "Ta muèn mua ngo¹i trang Thiªn ¢m 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(2)")
	tinsert(tSay, "Ta muèn mua ngo¹i trang ThiÕu D­¬ng 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(3)")
	tinsert(tSay, "Ta muèn mua ngo¹i trang Tø Linh 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(4)")	
	tinsert(tSay, "Ta muèn mua KhuÊt Nguyªn Béi 30 ngµy (1500 danh väng + 1500 s­ m«n + cÇn ®¼ng cÊp 89)/cs6_buy_KNB")
	tinsert(tSay, "N©ng cÊp Thó C­ìi ThÇn Thó B¹ch Hæ (cÇn Phiªu Vò + 1000 vµng)/#buy_horse(1)")
	tinsert(tSay, "N©ng cÊp Thó C­ìi ThÇn Thó H¾c Hæ (cÇn Phiªu Vò + 1000 vµng)/#buy_horse(2)")	
	if nPhucSinh == 2 then
		tinsert(tSay, "N©ng cÊp Ngù KiÕm (cÇn Phiªu Vò + 8 ®¹i ng©n phiÕu)/#buy_horse(3)")
	end
	if nPhucSinh == 3 then
		tinsert(tSay, "N©ng cÊp Ngù KiÕm Phôc Sinh 2 (cÇn Phiªu Vò + 8 ®¹i ng©n phiÕu)/#buy_horse(3)")
		tinsert(tSay, "N©ng cÊp Ngù KiÕm Phôc Sinh 3 (cÇn ThiÕu D­¬ng ThÊt Tinh KiÕm + 1000 vµng)/#upgrade_buy_horse(4)")
	end
	if nPhucSinh == 4 then
		tinsert(tSay, "N©ng cÊp Long M· (cÇn V©n Sö ThÊt Qu©n KiÕm + 1000 vµng)/#upgrade_buy_horse_cs9(5)")
	end
	tinsert(tSay, "§ãng/closedialog")
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Long Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Long Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)	
end
function cs6_get_translife_cloth()
	local nType = 5
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if nTransCount < 179 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(2685),10)
	if nNhan >= 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 6","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
		
	end
--	if DelItem(2,1,30230,200) == 1 then
--		for i = 0, 2 do
--			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth_cs6[nType][4]  + GetBody() - 1, 1, 1)
--			if nOk == 1 then
--				SetItemStatus(nItemIndex, 0, 1)
--				SetItemExpireTime(nItemIndex, 120*24*3600)
--			end
--		end
--		Msg2Player("B¹n nhËn ®­îc "..t_translife_cloth[nType][1])
--		WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "Bé ngo¹i trang miÔn phİ")
--	end
	SetTask(TSK_CS6_GET1TIME, GetTask(2685) + 1)
end
function cs7_get_translife_cloth()
	local nType = 6
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	
	if nTransCount < 279 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(2685),10)
	if nNhan >= 2 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 7","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
	end

	SetTask(TSK_CS6_GET1TIME, GetTask(2685) + 1)
end

function cs8_get_translife_cloth()
	local nType = 7
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	
	if nTransCount < 379 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(2685),10)
	if nNhan >= 4 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 8","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
	end

	SetTask(TSK_CS6_GET1TIME, GetTask(2685) + 1)
end

function gf_PSAddNewItem(tbItemIds, strName, szLogTitle, szLogAction, nExpireTime, nMsg2Player)
	nExpireTime = nExpireTime or 0;
	szLogTitle = szLogTitle or "";
	nMsg2Player = nMsg2Player or 0;
	
	if type(tbItemIds) ~= "table" or getn(tbItemIds) < 4 then
		WriteLog("["..szLogTitle.."]\tgf_AddItemEx2:\t tham sè lçi!");
		return 0;
	end
	
	local nCount = tbItemIds[4];
	if nCount == 0 then
		return
	end
	local nRet = 0;
	local nItemIdx = 0;
	local nFailedCount = 0;
	local nOkCount = 0;
	local nDropCount = 0;
	
	--Ä¬ÈÏÖµÓ¦¸ÃÎª1(ÒÑ¼ø¶¨)
	local nStatus = tbItemIds[5] or 1
	if nStatus < 0 then
		nStatus = 99
	end
	nStatus = nExpireTime * 100 + nStatus
	
	if tbItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus,tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
	else
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus);
	end
	--local _,nItemIndex = AddItem(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i]);
	--SetItemExpireTime(nItemIdx, 60*24*3600);
	SetItemIncreaseLevel(nItemIdx,6);
	if nRet == 0 then
		nFailedCount = nFailedCount + nCount;
	elseif nRet == 2 then
		nDropCount = nDropCount + nCount;
	else
		nOkCount = nOkCount + nCount;
	end
	
	local szMsg1 = format("Thªm thµnh c«ng %d c¸i, thªm thÊt b¹i %d c¸i, r¬i ®Êt %d c¸i", nOkCount, nFailedCount, nDropCount);--±¸×¢Ò»
	local szMsg2 = "Thêi gian tån t¹i vËt phÈm ®­îc ®Æt thµnh %d gi©y";--±¸×¢¶ş
	if nExpireTime <= 0 then
		szMsg2 = "";
	else
		szMsg2 = format(szMsg2, nExpireTime);
	end
	local szMsg3 = "";--±¸×¢Èı
	local szTongName = GetTongName() or "";
	
	if nMsg2Player ~= 0 then
		Msg2Player("B¹n nhËn ®­îc "..strName.."x"..nOkCount);
	end
	
	--²ÉÓÃĞÂÈÕÖ¾¼ÇÂ¼¸ñÊ½
	gf_WriteLogEx(szLogTitle, szLogAction, nCount, strName, nil, szTongName, nil, szMsg1, szMsg2, szMsg3);
	if nCount > 1 then
		return 1;
	else
		return nRet, nItemIdx
	end
end

function cs9_get_translife_cloth()
	local nType = 8
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	
	if nTransCount < 479 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(2685),10)
	if nNhan >= 5 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_PSAddNewItem(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 9","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
	end

	SetTask(TSK_CS6_GET1TIME, GetTask(2685) + 1)
end

function upgrade_buy_horse(nType)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if nTransCount < 392 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	
	if GetCash() <  t_translife_horse_cs6[nType][4] then
		Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
		return
	end

	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng hoÆc ®é nÆng, vui lßng s¾p xÕp l¹i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B¹n ph¶i trang bŞ ngùa míi cã thÓ ®æi ®­îc!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 10107 then
		Talk(1,"","B¹n ph¶i trang bŞ ThÊt TŞch KiÕm míi cã thÓ ®æi ®­îc!")
		return
	end

	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx, -1) == 1 then	
		Pay(t_translife_horse_cs6[nType][4])
		local nOk, nItemIndex = gf_AddItemEx2(t_translife_horse_cs6[nType][2],t_translife_horse_cs6[nType][1],"Thu cuoi chuyen sinh","mua",nExpireTime,0)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
		end
		Msg2Player("B¹n nhËn ®­îc 1 "..t_translife_horse_cs6[nType][1]..".")	
		WriteLogEx("Ngoai trang chuyen sinh 8","mua",1, t_translife_horse_cs6[nType][1])		
	end
end

function upgrade_buy_horse_cs9(nType)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if nTransCount < 491 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	
	if GetCash() <  t_translife_horse_cs6[nType][4] then
		Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
		return
	end

	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng hoÆc ®é nÆng, vui lßng s¾p xÕp l¹i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B¹n ph¶i trang bŞ ngùa míi cã thÓ ®æi ®­îc!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 10108 then
		Talk(1,"","B¹n ph¶i trang bŞ  V¨n Sö ThÊt Qu©n KiÕm míi cã thÓ ®æi ®­îc!")
		return
	end

	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx, -1) == 1 then	
		Pay(t_translife_horse_cs6[nType][4])
		local nOk, nItemIndex = gf_AddItemEx2(t_translife_horse_cs6[nType][2],t_translife_horse_cs6[nType][1],"Thu cuoi chuyen sinh","mua",nExpireTime,0)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
		end
		Msg2Player("B¹n nhËn ®­îc 1 "..t_translife_horse_cs6[nType][1]..".")	
		WriteLogEx("Ngoai trang chuyen sinh 9","mua",1, t_translife_horse_cs6[nType][1])		
	end
end

function buy_horse(nType)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh == 1 then
		if nType == 1 then
			if nTransCount < 190 then
				Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
				return
			end
		elseif nType == 2 then
			if nTransCount < 191 then
				Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
				return
			end
		end
		if GetCash() <  t_translife_horse_cs6[nType][4] then
			Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
			return
		end		
	elseif nPhucSinh == 2 then
		if nType == 1 or nType == 2 or nType == 3 then
			if nTransCount < 290 then
				Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
				return
			end
		end
		if nType == 1 or nType == 2 then
			if GetCash() <  t_translife_horse_cs6[nType][4] then
				Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
				return
			end				
		elseif nType == 3 then
			if GetItemCount(2,1,199) < 8 then
				Talk(1,"","B¹n kh«ng mang ®ñ 8 §¹i ng©n phiÕu")
				return
			end
		end
	elseif nPhucSinh == 3 then
		if nType == 1 then
			if nTransCount < 390 then
				Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
				return
			end
		elseif nType == 2 then
			if nTransCount < 391 then
				Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
				return
			end
		elseif nType == 3 then
			if nTransCount < 392 then
				Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
				return
			end
		end
		if nType == 1 or nType == 2 then
			if GetCash() <  t_translife_horse_cs6[nType][4] then
				Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
				return
			end				
		elseif nType == 3 then
			if GetItemCount(2,1,199) < 8 then
				Talk(1,"","B¹n kh«ng mang ®ñ 8 §¹i ng©n phiÕu")
				return
			end
		end
	elseif nPhucSinh == 4 then
		if nType == 1 then
			if nTransCount < 490 then
				Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
				return
			end
		elseif nType == 2 then
			if nTransCount < 491 then
				Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
				return
			end
		end
		if nType == 1 or nType == 2 then
			if GetCash() <  t_translife_horse_cs6[nType][4] then
				Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
				return
			end				
		end
	end


	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng hoÆc ®é nÆng, vui lßng s¾p xÕp l¹i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B¹n ph¶i trang bŞ ngùa míi cã thÓ ®æi ®­îc!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Talk(1,"","B¹n ph¶i trang bŞ Phiªu Vò míi cã thÓ ®æi ®­îc!")
		return
	end

	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx, -1) == 1 then	
		if nType == 1 or nType == 2 then
			Pay(t_translife_horse_cs6[nType][4])
		else
			DelItem(2,1,199,8)
		end
		local nOk, nItemIndex = gf_AddItemEx2(t_translife_horse_cs6[nType][2],t_translife_horse_cs6[nType][1],"Thu cuoi chuyen sinh","mua",nExpireTime,0)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
		end
		Msg2Player("B¹n nhËn ®­îc 1 "..t_translife_horse_cs6[nType][1]..".")	
		if nType < 3 then
			WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, t_translife_horse_cs6[nType][1])		
		else
			WriteLogEx("Ngoai trang chuyen sinh 7","mua",1, t_translife_horse_cs6[nType][1])		
		end
	end
end
function cs6_get_HNHN()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if nPhucSinh == 1 then
		if nTransCount < 186 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/10)
		local nCon = mod(GetTask(2685), 10)
		local nTotal = (nNhan + 1) * 10 + nCon
		if mod(nNhan, 10) >= 1 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end
		if BigGetItemCount(0,102,43) > 0 or  BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end	
		if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
			return
		end	
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		if GetPlayerRebornParam(1) == 4 then	
			gf_AddItemEx2({0,102,42,1,4,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh 6","nhËn",30*24*3600,1)
			WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "H»ng Nga NguyÖt Vò §¸i")		
		else
			gf_AddItemEx2({0,102,43,1,4,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh 6","nhËn",30*24*3600,1)	
			WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "HËu NghÖ L¹c NhËt Hoµn")	
		end
	elseif nPhucSinh == 2 then
		if nTransCount < 286 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/10)
		local nCon = mod(GetTask(2685), 10)
		local nTotal = (nNhan + 1) * 10 + nCon
		if mod(nNhan, 10) >= 2 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end
		if BigGetItemCount(0,102,43) > 0 or  BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end	
		if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
			return
		end	
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		if GetPlayerRebornParam(1) == 4 then	
			gf_AddItemEx2({0,102,42,1,4,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh 7","nhËn",30*24*3600,1)
			WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "H»ng Nga NguyÖt Vò §¸i")		
		else
			gf_AddItemEx2({0,102,43,1,4,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh 7","nhËn",30*24*3600,1)	
			WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "HËu NghÖ L¹c NhËt Hoµn")	
		end
	elseif nPhucSinh == 3 then
		if nTransCount < 386 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/10)
		local nCon = mod(GetTask(2685), 10)
		local nTotal = (nNhan + 1) * 10 + nCon
		if nNhan >= 3 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end
		if BigGetItemCount(0,102,43) > 0 or  BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end	
		if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
			return
		end	
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		if GetPlayerRebornParam(1) == 4 then	
			gf_AddItemEx2({0,102,42,1,4,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh 8","nhËn",30*24*3600,1)
			WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "H»ng Nga NguyÖt Vò §¸i")		
		else
			gf_AddItemEx2({0,102,43,1,4,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh 8","nhËn",30*24*3600,1)	
			WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "HËu NghÖ L¹c NhËt Hoµn")	
		end
	elseif nPhucSinh == 4 then
		if nTransCount < 486 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/10)
		local nCon = mod(GetTask(2685), 10)
		local nTotal = (nNhan + 1) * 10 + nCon
		if nNhan >= 4 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end
		if BigGetItemCount(0,102,43) > 0 or  BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end	
		if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
			return
		end	
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		if GetPlayerRebornParam(1) == 4 then	
			gf_AddItemEx2({0,102,42,1,4,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh 8","nhËn",30*24*3600,1)
			WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "H»ng Nga NguyÖt Vò §¸i")		
		else
			gf_AddItemEx2({0,102,43,1,4,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh 8","nhËn",30*24*3600,1)	
			WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "HËu NghÖ L¹c NhËt Hoµn")	
		end
	end
end

function cs6_buy_HNHN(nType)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh == 1 then
		if nTransCount < 186 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	elseif nPhucSinh == 2 then
		if nTransCount < 286 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	elseif nPhucSinh == 3 then
		if nTransCount < 386 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	end
	if GetReputation() < 10000 or GetTask(336) < 10000 then
		Talk(1,"","B¹n kh«ng ®ñ 10000 ®iÓm S­ M«n hoÆc 10000 Danh Väng ®Ó mua trang søc nµy!")
		return
	end	
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if nType == 1 then
		if BigGetItemCount(0,102,43) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end
		if GetPlayerRebornParam(1) == 4 then
			Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Long/Hæ/¦ng Tö míi cã thÓ mua trang søc nµy!")
			return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		Msg2Player("B¹n bŞ trõ 700 ®iÓm s­ m«n!")		
		gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh 6","mua",7*24*3600,1)	
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "HËu NghÖ L¹c NhËt Hoµn")	
	elseif nType == 2 then
		if BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end
		if GetPlayerRebornParam(1) ~= 4 then
			Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Phông Tö míi cã thÓ mua trang søc nµy!")
			return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		Msg2Player("B¹n bŞ trõ 700 ®iÓm s­ m«n!")	
		gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh 6","mua",7*24*3600,1)
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "H»ng Nga NguyÖt Vò §¸i")		
	end
end

function cs6_get_KNB()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if nPhucSinh == 1 then
		if nTransCount < 189 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/100)
		local nCon = mod(GetTask(2685), 100)
		local nTotal = (nNhan + 1) * 100 + nCon
		if mod(nNhan, 10) >= 1 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end	
		if BigGetItemCount(0,102,27) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh 6","nhËn",30*24*3600,1)
		Msg2Player("B¹n nhËn ®­îc KhuÊt Nguyªn Béi h¹n sö dông 30 ngµy")
		WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "KhuÊt Nguyªn Béi")		
	elseif nPhucSinh == 2 then
		if nTransCount < 289 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/100)
		local nCon = mod(GetTask(2685), 100)
		local nTotal = (nNhan + 1) * 100 + nCon
		if mod(nNhan, 10) >= 2 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end	
		if BigGetItemCount(0,102,27) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh 7","nhËn",30*24*3600,1)
		Msg2Player("B¹n nhËn ®­îc KhuÊt Nguyªn Béi h¹n sö dông 30 ngµy")
		WriteLogEx("Ngoai trang chuyen sinh 7","nhËn",1, "KhuÊt Nguyªn Béi")		
	elseif nPhucSinh == 3 then
		if nTransCount < 389 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
		local nNhan = gf_GetTaskByte(2188,3)
		--local nCon = mod(GetTask(2685), 100)
		--local nTotal = (nNhan + 1) * 100 + nCon
		if nNhan >= 2 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end	
		if BigGetItemCount(0,102,27) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end
		gf_SetTaskByte(2188,3,2)
		gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh 8","nhËn",30*24*3600,1)
		Msg2Player("B¹n nhËn ®­îc KhuÊt Nguyªn Béi h¹n sö dông 30 ngµy")
		WriteLogEx("Ngoai trang chuyen sinh 8","nhËn",1, "KhuÊt Nguyªn Béi")		
	end
end

function cs6_buy_KNB()
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if nPhucSinh == 1 then
		if nTransCount < 189 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	elseif nPhucSinh == 2 then
		if nTransCount < 289 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	elseif nPhucSinh == 3 then
		if nTransCount < 389 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	end
	if GetReputation() < 1500 or GetTask(336) < 1500 then
		Talk(1,"","B¹n kh«ng ®ñ 1500 ®iÓm S­ M«n hoÆc 1500 Danh Väng ®Ó mua trang søc nµy!")
		return
	end	
	if BigGetItemCount(0,102,27) > 0 then
		Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
		return
	end
	ModifyReputation(-1500,1)
	SetTask(336,GetTask(336) - 1500)
	Msg2Player("B¹n bŞ trõ 1500 ®iÓm s­ m«n!")
	gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh 6","nhËn",30*24*3600,1)	
	Msg2Player("B¹n nhËn ®­îc KhuÊt Nguyªn Béi h¹n sö dông 30 ngµy")
	WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "KhuÊt Nguyªn Béi")		
end

function cs6_buy_translife_cloth(nType)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh == 1 then
		if nTransCount < t_translife_cloth_cs6[nType][5] then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	elseif nPhucSinh == 2 then
		if nTransCount < t_translife_cloth_cs6[nType][6] then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	elseif nPhucSinh == 3 then
		if nTransCount < t_translife_cloth_cs6[nType][7] then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	elseif nPhucSinh == 4 then
		if nTransCount < t_translife_cloth_cs6[nType][8] then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	end
	if GetItemCount(2,1,30230) < 200 then
		Say("B¹n kh«ng mang theo ®ñ 200 vËt phÈm Xu!",0)
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if DelItem(2,1,30230,200) == 1 then
		for i = 0, 2 do
			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth_cs6[nType][4]  + GetBody() - 1, 1, 1)
			if nOk == 1 then
				SetItemStatus(nItemIndex, 0, 1)
				SetItemExpireTime(nItemIndex, 30*24*3600)
			end
		end
		Msg2Player("B¹n nhËn ®­îc "..t_translife_cloth_cs6[nType][1])
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, t_translife_cloth_cs6[nType][1])
	end
end

function nothing()
	Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
end

function closedialog()
end