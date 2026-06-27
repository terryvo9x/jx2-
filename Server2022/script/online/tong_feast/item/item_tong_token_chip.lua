Include("\\script\\online\\tong_feast\\tf_define.lua")

function OnUse(nItem)
	--local tSay = {
	--	"ºÏ³É°ïÅÉÁîÅÆ/ComposeTongToken",
	--	"ÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing"	
	--}
	--Say("Ê¹ÓÃ100¸ö°ïÅÉÁîÅÆËéÆ¬¿ÉºÏ³ÉÒ»¸ö°ïÅÉÁîÅÆ£¬ÄúÒªºÏ³É°ïÅÉÁîÅÆÂğ£¿", getn(tSay), tSay);
end

function ComposeTongToken()
	local nCount = floor(GetItemCount(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3]) / 100);
	AskClientForNumber("ComposeTongToken_CB", 0, nCount,"NhËp vµo sè l­îng:","")
end

function ComposeTongToken_CB(nNum)
	if nNum <= 0 then
		return 0; 
	end
	if GetFreeItemRoom() * 999 < nNum then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if DelItem(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], nNum * 100) == 1 then
		AddItem(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3], nNum);
		Msg2Player(format("Ng­¬i hîp thµnh %d LÖnh Bµi Bang Héi", nNum));
	end
end
