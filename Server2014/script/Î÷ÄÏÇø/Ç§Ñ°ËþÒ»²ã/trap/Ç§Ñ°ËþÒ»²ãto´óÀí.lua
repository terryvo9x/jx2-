--汴京府东to汴京
--GGH




function main(sel)
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 409 then
		return
	end
	if (GetPKValue() <= 3 ) then
		NewWorld(400, 1426 ,2857)
		SetFightState(0);
	else
		Msg2Player("Ngi l祄 vi謈 竎 c蕀 ra v祇 th玭 tr蕁.")
	end	
end;