-- mail_carrier.lua
-- ” µ›‘±

Import("\\script\\lib\\globalfunctions.lua");

THE_FILE = "\\script\\misc\\mail_carrier.lua"
NPC_NAME = "<color=green>ChÒ B≠u cÙc<color>";

function main()
	Say( NPC_NAME.."Qu˝ kh∏ch Æ’n nhÀn th≠ ph∂i kh´ng?",
		3,
		"NhÀn th≠/query_mail_list",
		"H≠Ìng d…n giao dﬁch ti“n xu/trade_gold_coin_help",
		"Quay lπi sau!/nothing"
	);
end

function trade_gold_coin_help()
	Say( NPC_NAME.."C∏c thao t∏c giao dﬁch c„ li™n quan Æ’n ti“n Xu Æ“u ph∂i th´ng qua B≠u cÙc Æ” gˆi ho∆c nhÀn. Sau khi song ph≠¨ng x∏c Æﬁnh hoµn t t giao dﬁch, h÷ thËng sœ th´ng b∏o d≠Ìi h◊nh th¯c th≠ cho hai b™n. ChÛ ˝: n’u r≠¨ng trong trπng th∏i kh„a th◊ sœ kh´ng th” th˘c hi÷n giao dﬁch!",
		1,
		"Bi’t rÂi!/main" );
end

-- nMailCount µ±«∞»°œ¬¿¥µƒ” º˛¡–±Ì÷–”–∂‡…Ÿ∑‚” º˛
-- nMaxMailCount “ªπ≤”–∂‡…Ÿ∑‚” º˛
-- nNewMailCount –¬” º˛£®Œ¥∂¡” º˛£©µƒ ˝¡ø
function query_mail_list(nMailCount, nMaxMailCount, nNewMailCount)
	if nMailCount == 0 then
		Say("Kh∏ch quan hi÷n ch≠a c„ th≠ nµo!", 0);
		return
	end

	local tMailList = QueryMailList(THE_FILE, "query_mail_list");
	if tMailList == nil then
		return
	end
	if tMailList == 0 then
		Say("Kh∏ch quan hi÷n ch≠a c„ th≠ nµo!", 0);
		return
	end

	local nCount = getn(tMailList)
	if nCount == 0 then
		Say("Kh∏ch quan hi÷n ch≠a c„ th≠ nµo!", 0);
		return
	end

	nMailCount = nCount;
	if nCount > 6 then
		nCount = 6;
	end
	local tSayNote = {};
	for i = 1, nCount do
		local y,m,d,h,n,s = GmTime(tMailList[i].time + 8 * 3600);
		local sz_time = format("%d:%d:%d %d-%d-%d", h,n,s,y,m,d);
		tSayNote[i] = format("%17s%17s%20s/#receive_mail(%d,%d)",
			tMailList[i].subject,
			tMailList[i].sender,
			sz_time,
			tMailList[i].lowid,
			tMailList[i].highid);
	end
	tSayNote[nCount+1] = "K’t thÛc ÆËi thoπi/nothing";
	local msg = "";
	if nMailCount > 6 then
		msg = format("Bπn c„ %d th≠ mÌi, hi÷n tπi chÿ c„ th” hi”n thﬁ 6 th≠ mÌi nh t, h∑y nhanh ch„ng d‰n d—p chÁ trËng. \n 6 th≠ mÌi nh t: ", nMailCount);
	else
		msg = "Danh s∏ch th≠ cÒa bπn: "
	end
	Say(msg, nCount + 1, tSayNote);
end

function nothing()
end

function receive_mail(lowid, highid)
	if lowid == 0 and highid == 0 then
		Say(NPC_NAME.."Kh∏ch quan hi÷n ch≠a c„ th≠ nµo!", 0)
		return
	end

	local tMail = ReceiveMail(lowid, highid, THE_FILE, "receive_mail");
	if tMail == nil or tMail == 0 then
		return
	end

	local uId = tMail.ID;

--	if tMail.Attachments.count <= 0 then
--		Say("empty content",0);
--		return
--	end

	local szMsg = "";
	local tSelNode = {};

	if tMail.Attachments._zw_ then
		szMsg = szMsg .."NÈi dung: "..tMail.Attachments._zw_.."\n";
	end
	if tMail.Attachments._wj_ then
		local nCount = tMail.Attachments.obj_count;
		if nCount == nil then
			nCount = 0;
		end
		szMsg = szMsg.."Th´ng tin vÀt ph»m: "..tMail.Attachments._wj_.."\n";
		tSelNode[1] = format("NhÀn vÀt ph»m/#pickup(%d,%d)", uId, nCount);
	end
	if tMail.Attachments._gbi then
		szMsg = szMsg .."Tin t¯c Ti“n xu: "..tMail.Attachments._gbi.."\n";
	end
	if getn(tSelNode) == 0 then
		--tSelNode[1] = format("…æ≥˝” º˛/#DelMail(%d, %s, %s)", uId, THE_FILE, "nothing");
		tSelNode[1] = format("X„a th≠/#pickup(%d, %d)", uId, 0);
	end
	tSelNode[getn(tSelNode)+1] = "K’t thÛc ÆËi thoπi/nothing";

	Say( szMsg, getn(tSelNode), tSelNode );
end

function pickup(uId, nObjCount)
	if gf_Judge_Room_Weight(nObjCount, 0) == 0 then
		Say(STR_OVERWEIGHT, 0);
		return
	end
	local bDelResult = DelMail(uId, THE_FILE, "pickup_2");
end

function pickup_2(nRetCode, uID)
	if nRetCode > 0 then
		GetAttachments(uID);
		RemoveGSMailCache(uID)
		WriteLog("[CoinTrading]\t"..GetAccount().."\t"..GetName().."\t nhÀn vÀt ph»m tı B≠u cÙc.")		
	end
end

