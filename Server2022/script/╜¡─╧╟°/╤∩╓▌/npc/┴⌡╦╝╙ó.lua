Include("\\script\\item\\item_yunling_box.lua")
function main()
	local tDialog = 
	{
		"\nTñ Thiªn BiÕn TiÕu Y/NpcTalkMain",
		"\n Nguån gèc UÈn Linh /cixiu_laiyuan",
		"\n ph­¬ng ph¸p thªu/cixiu_fangfa",
		"\n rót lui/nothing",
	};
	Say("<color=green>L­u T­ Anh:<color>thªu lµ tuyÖt nghÖ cña t¹i h¹, UÈn Linh ®­îc t¹i h¹ thªu kh«ng nh÷ng ®Ñp mµ cßn bÒn n÷a. ",getn(tDialog),tDialog);
end

function cixiu_laiyuan()
	local tDialog = 
	{
		"\n Ph¶n håi/main",
		"\n rót lui/nothing",
	};
	Say("<color=green>L­u T­ Anh:<color> Tham gia c¸c tÝnh n¨ng thu thËp UÈn Linh Tinh Hoa ®æi UÈn Linh cÊp t­¬ng øng. Còng cã thÓ tham gia ThÊt L¹c Nhai nhËn danh väng Phong V©n TÕ Héi vµ t¨ng cÊp danh väng ®Ó mua UÈn Linh, hoÆc dïng Än ChuyÓn Sinh nhËn UÈn Linh M«n Héi.",getn(tDialog),tDialog);
end

function cixiu_fangfa()
	local tDialog = 
	{
		"\n Ph¶n håi/main",
		"\n rót lui/nothing",
	};
	Say("<color=green>L­u T­ Anh: <color>nhÊp chuét ph¶i vµo UÈn Linh trong hµnh trang ®Ó më giao diÖn thªu, cho ngo¹i trang vµ UÈn Linh t­¬ng øng vµo ®Ó thªu.",getn(tDialog),tDialog);
end

function nothing()
end