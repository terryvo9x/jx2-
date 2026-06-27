Include("\\script\\missions\\jiandangyanyun\\head.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua");

g_szNpcName = "<color=green>Hoa Th¸nh L¹c Phi: <color>";

function main()
	local strTab = {
		--"Tham gia KiÕm §·ng YÕn V©n-Th­êng						/Talk_1",
		--"Tham gia KiÕm §·ng YÕn V©n-Anh hïng						/Talk_2",
		"§æi phÇn th­ëng										/Talk_3",
		"§iÒu kiÖn tham gia KiÕm §·ng YÕn V©n								/Talk_4",
		"Xem danh väng ChiÕt Xung X·									/Talk_5",
		"Hñy bá												/nothing"
	};
	
	Say(g_szNpcName.."§Õn Trôy Long S¬n cïng Thiªn ¢m Gi¸o quyÕt chiÕn sinh tö, mong c¸c vÞ chiÕn ®Êu hÕt m×nh!", getn(strTab), strTab);
end

function Talk_1()
	if 1 ~= JDYY_EnterCondCheck(g_szNpcName, eDifType.NORMAL) then return 0; end      -- OK
	if 0 == JDYY_CheckMapCountLimit(g_szNpcName, eDifType.NORMAL) then return 0; end    -- OK
	local nMapId = this:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."KiÕm §·ng YÕn V©n qu¸ ®«ng, xin ®îi trong gi©y l¸t!");
		return 0;
	end
	mf_SetMissionV(this.missionID, this.mv_02, eDifType.NORMAL, nMapId);
	-- if eDifType.HARD == mf_GetMissionV(this.missionID, this.mv_02, nMapId) then
	-- 	SendScript2VM("\\script\\missions\\jiandangyanyun\\mission.lua", format("JDYY_SetPKFlag(%d, %d)", 1, 1));
	-- end
	local oldPlayer = PlayerIndex
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		ModifyEnergy(-20,1);
		SetTask(JDYY_TSK_DC_ENTER,GetTask(JDYY_TSK_DC_ENTER)+1);
	end
	PlayerIndex = oldPlayer;
	this:TeamEnter(nMapId, 1);
end

function Talk_2()
	if 1 ~= JDYY_EnterCondCheck(g_szNpcName, eDifType.HARD) then return 0; end
	if 0 == JDYY_CheckMapCountLimit(g_szNpcName, eDifType.HARD) then return 0; end
	
	local nMapId = this:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."KiÕm §·ng YÕn V©n qu¸ ®«ng, xin ®îi trong gi©y l¸t!");
		return 0;
	end
	mf_SetMissionV(this.missionID, this.mv_02, eDifType.HARD, nMapId);

	local oldPlayer = PlayerIndex
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		ModifyEnergy(-20,1);
	end
	PlayerIndex = oldPlayer;
	this:TeamEnter(nMapId, 1);
end

function Talk_3()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3079, "TiÖm danh väng ChiÕt Xung X·"))
end

function Talk_4()
	local strTab = "Ph¶i tæ ®éi vµo, thµnh viªn ph¶i cã 4-8 ng­êi, trong ®éi ph¶i cã 4 l­u ph¸i trë lªn, thµnh viªn trong ®éi ®Òu ph¶i ®¹t chuyªn sinh 7 cÊp 90 vµ ®Òu ra nhËp l­u ph¸i míi cã thÓ vµo. Mçi lÇn vµo sÏ tiªu hao 20 ®iÓm tinh lùc cña tõng mäi ng­êi. Khi sè l­u ph¸i nhiÒu h¬n 5, 6, 7 ph¸i, th× sÏ cho phÇn th­ëng kinh nghiÖm 1.2, 1.4, 1.6 lÇn, khi cã 8 l­u ph¸i trong ®éi, kinh nghiÖm sÏ ®­îc gÊp ®«i. Mçi ng­êi mçi ngµy chØ cã thÓ vµo phã b¶n KiÕm §Éng YÕn V©n 5 lÇn(tÝnh gåm phæ th«ng, anh hïng vµ h×nh thøc sao chÐp) ";
	Talk(1, "main", g_szNpcName.."Trôy Long S¬n ®Þa thÕ hiÓm trë, ®¹i qu©n Thiªn ¢m Gi¸o ®ang gi¸p s¸t, ®¹i hiÖp ®· s½n sµng? §iÒu kiÖn tham gia ¶i:"..strTab);
end

function Talk_5( )
	local nPop = GetPop(6)
	local nLim = 0
	local strPop=""
	if nPop < 0 then 
		nPop=0;
	end

	if nPop < 2000 then strPop="S¬ xuÊt mao l­" nLim=2000;
	elseif nPop < 6000 then strPop="Béc lé tµi n¨ng" nLim=6000;
	elseif nPop < 12000 then strPop="Danh tiÕng th­íc khëi" nLim=12000;
	elseif nPop < 20000 then strPop="C«ng danh hiÓn h¸ch" nLim=20000;
	elseif nPop < 40000 then strPop="Cùu phô thÞnh danh" nLim=40000;
	else strPop="V¹n ng­êi ng­ìng mé" nLim=40000; end 

	local strTalk = g_szNpcName.."Trong cuéc chiÕn Trôy Long S¬n, hiÖp sÜ anh dòng h¬n ng­êi.\n"
	strTalk=strTalk..format("Danh väng ChiÕt Xung X· hiÖn cã: %s\n",strPop)
	strTalk=strTalk..format("Danh väng ChiÕt Xung X· tÝch lòy: %d/%d\n",nPop,nLim)
	local tbSay = {}
	tinsert(tbSay,"trë l¹i/main")
	tinsert(tbSay,"Ra khái/nothing")
	Say(strTalk,getn(tbSay),tbSay)
end