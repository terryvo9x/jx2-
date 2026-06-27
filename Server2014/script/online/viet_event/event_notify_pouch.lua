Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua")
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

function SelectSay()	
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "<color=green>CÈm Nang Sù KiÖn:<color> D­íi ®©y lµ c¸c sù kiÖn ®ang diÔn ra trªn m¸y chñ, th«ng tin chi tiÕt vui lßng xem trªn trang chñ."
    szSayHead = szSayHead.." B¹n ®ang lµ thÇn d©n cña <color=yellow>JX2<color>"
	
	local nDate = CheckDate();
	tinsert(tbSayDialog, "\nSù KiÖn Th¸ng "..nDate..": "..Event_List[nDate]["name"].."/EventMain");
	
	if vc_IsVipCardOpen() ~= 0 then
		tinsert(tbSayDialog, "\n"..vc_GetMainTitle()) 
	end
	
	tinsert(tbSayDialog,"\nNhËn th­ëng tÝch lòy online/IpBonus")	
	tinsert(tbSayDialog,"\nKÕt thóc ®èi tho¹i/nothing"	)
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function nothing()

end



 