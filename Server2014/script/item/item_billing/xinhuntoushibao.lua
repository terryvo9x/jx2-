Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	if GetPlayerFaction() == 0 then
		Talk(1,"","Ch­a gia nhËp m«n ph¸i kh«ng thÓ më tói trang søc t©n h«n.");
		return 0;
	end;
	local selTab = {
			format("Më/#open(%d)",nItemIdx),
			"LÇn sau h·y më!/nothing",
			}
	Say("B¹n muèn më tói trang søc t©n h«n? Bªn trong chøa 1 mãn trang søc.",getn(selTab),selTab);
end;
tCloth_Faction = {--×âµÄ£¬ÂòµÄ
		{131,173,	167,213},
		{143,189,	171,217},
		{147,193,	175,221},
		{151,197,	179,225},
		{155,201,	183,229},
		{159,205,	187,233},
		{163,209,	191,237},
		};
function open(nItemIdx)
	if gf_JudgeRoomWeight(1,10) == 0 then
		Talk(1,"","B¹n kh«ng ®ñ kho¶ng trèng hoÆc søc lùc, xin kiÓm tra l¹i!");
		return 0;
	end;
	local nBody = GetBody();
	local nFaction = GetPlayerFaction();
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(0,108,tCloth_Faction[nFaction][3]+nBody-1,1)
		Msg2Player("B¹n nhËn ®­îc 1 mãn trang søc t©n h«n");
		WriteLog("[KÕt h«n]:"..GetName().."®· më 1 tói trang søc t©n h«n");
	end;
end;