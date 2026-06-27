ID_ITEMBOX = 805;

function main()
	local nLevel = GetLevel()
	if nLevel >= 10 then
		if GetTask(ID_ITEMBOX)==0 then
			Say("<color=yellow>R­¬ng chøa ®å<color> lµ vËt kh«ng thÓ thiÕu khi hµnh tÈu giang hå. H·y ra ngoµi thµnh b¾t <color=yellow>Thá x¸m<color> lÊy vÒ <color=yellow>10 c¸i ®u«i<color>! Ta sÏ gióp ng­¬i lµm r­¬ng!",
				3,
				"Ta muèn lµm r­¬ng./yes_box",
				"Kh«ng cÇn ®©u./no_box",
				"T×m hiÓu lîi Ých r­¬ng chøa ®å./intro_box");
			return
		elseif GetTask(ID_ITEMBOX)==1 then
			check_box();
			return
		else
			OpenBox()
			EnableBoxLock(1)
		end
	else
		Say("<color=yellow>R­¬ng chøa ®å<color> lµ vËt kh«ng thÓ thiÕu khi gia nhËp giang hå. Ng­¬i ch­a ®¹t ®Õn cÊp 10, t¹m thêi ch­a dïng ®­îc! §Õn <color=yellow>cÊp 10<color> h·y ®Õn t×m ta!",0)
	end

end;


function yes_box()
	if GetTask(1) < 25 then	
		Talk(1,"","<color=green>Thñ khè<color>: Hoµn thµnh <color=yellow>nhiÖm vô t©n thñ<color> råi h½n ®Õn t×m ta.");
		return 0;
	end;

	SetTask(ID_ITEMBOX,1);
	Say("H·y t×m <color=yellow>10 ®u«i Thá x¸m<color> vÒ cho ta!",1,"Ta ®i ngay ®©y!/box_no");
	TaskTip("Ra ngoµi thµnh thu thËp 10 ®u«i Thá x¸m ®Ó lµm r­¬ng chøa ®å!")
end;

function check_box()
	if GetItemCount(2,1,2)<10 then 
		Say("Ng­¬i ch­a t×m ®­îc <color=yellow>10 ®u«i Thá x¸m<color> ta cÇn, ta kh«ng thÓ gióp ng­¬i lµm r­¬ng chøa ®å!",1,"Ta ®i t×m ngay ®©y!/box_no")
	else
		DelItem(2,1,2,10)
		SetTask(ID_ITEMBOX,2) --¿ª·Å´¢ÎïÏä±ê¼Ç
		Say("R­¬ng chøa ®å ®· lµm xong! Yªn t©m sö dông nhÐ!",1,"Tèt l¾m! Xin ®a t¹!/box_no")
		Msg2Player("R­¬ng chøa ®å ®· lµm xong! Yªn t©m sö dông nhÐ!");
	end;
end;

function no_box()
end;

function intro_box()

	Say("Cã thÓ më réng kho¶ng trèng trong r­¬ng chøa ®å ®Ó cÊt gi÷ ®å vËt kh«ng th­êng dïng vµ c¸c vËt phÈm quý. Khi më r­¬ng ë mét thµnh thÞ nµo ®ã, cã nghÜa lµ ng­¬i ®· cµi ®Æt ®iÓm vÒ thµnh t¹i thµnh thÞ ®ã. Ngoµi ra, ng­¬i cÇn bá ra <color=yellow>20 l­îng<color> sö dông <color=yellow>chøc n¨ng khãa r­¬ng<color> ®Ó ®¶m b¶o an toµn cho r­¬ng chøa ®å. R­¬ng chøa ®å sÏ ®­îc hÖ thèng <color=yellow>tù ®éng khãa chÆt<color> mçi khi ng­¬i rêi m¹ng. NÕu muèn <color=yellow>cµi ®Æt l¹i mËt m·<color>, cÇn tr¶ <color=yellow>thªm<color> <color=yellow>2 l­îng<color> n÷a!",1,"§a t¹!/no_box");
end;


