function CanEquip()
	if GetTask(336) < 200 then
		--Msg2Player("B¹n cÇn 200 ®iÓm danh väng s­ m«n míi cã thÓ cã trang bÞ nµy");
		return 0;	--²»ÄÜ´©
	end;
	return 0;
end;

function OnUse()
	return 0;
end;

function OnEquip()
	return 0
end

function OnUnEquip()
	return 0;
end
