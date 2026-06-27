--function main()
--Say ("<color=green>¿Ü×¼<color>£º¿ÜÄ³ÊÜÃüÕÆ¹ÜÀí·ªÔº£¬Ò»ÇĞÓĞ¹Ø½±Æ·¡¢ÀñÎïÊÂÒË¾ùÓĞÎÒ¸ºÔğ£¬ÓĞÊ²Ã´¿ÉÒÔ°ïµ½ÄãµÄ£¿",2,"Çë°ïÎÒ¶Ò»»½±Æ·/jiangpin","ÔİÊ±Ã»ÓĞ/no")
--end

--function jiangpin()
--Say ("<color=green>¿Ü×¼<color>£º¶Ô²»Æğ£¬ÄãÃ»ÓĞÊ²Ã´½±Æ·ºÃÁì¡£",0)  --µ÷ÓÃ½çÃæ
--end;


--function no()
--Say ("<color=green>¿Ü×¼<color>£º±ÉÈË×îĞÀÉÍÏóÄãÕâÑùµÄ³ÏÊµ¾ı×Ó¡£",0)  
--end;

--ÈÎÎñ£º»­ÖĞ»­¹¦ÄÜÑİÊ¾
--µØµã£º ÈÎÎñ£º
--²ß»®£º·®ÍòËÉ  2004.03.
--append by lizhi
--2005-8-8 11:20

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ãê¾©\\task_main.lua");
Include("\\script\\online_activites\\201203\\kuizheng\\kuizeng.lua")

function main()
    local nLevel;
    local nStep;
    nLevel = GetLevel();
    nStep = GetTask(TASK_BJ_ID);
        --2012Äê4ÔÂ¹²Á¦»î¶¯
    if gf_CheckEventDateEx(60) == 1 then
		gf_Say(VET_201203_KuiZeng_tbTalkDialog);
		--return 0;
	end
    
    if GetTask(1) >= 25 and GetTask(1) < 100 then
    
        if (nStep == 0) then
            task_000_00();
            SetTask(131,2);
            if GetTask(130) == 2 and GetTask(132) == 2 then
                SetTask(1, 26); --Èç¹ûÍê³ÉĞÂÊÖÈÎÎñµÄËÍĞÅÈÎÎñ(×îºóÒ»²½)£¬Ôò¹Ø±ÕÈÎÎñÃæ°å
            end;
            return
        elseif (nStep == 13) then
            task_013_00();
            return
        elseif (nStep == 14) then
            task_014_00();
            return
        else
            Talk(1,"","L·o phu ®©y tuy kh«ng ra khái BiÖn Kinh nh­ng chuyÖn trong thiªn h¹ ta ®Òu biÕt c¶.")
            return
        end;
        
    end;
    Talk(1,"","L·o phu ®©y tuy kh«ng ra khái BiÖn Kinh nh­ng chuyÖn trong thiªn h¹ ta ®Òu biÕt c¶.");

end;

function  pipcap()
--	ClosePiP()
	Pn2 = GetCaptainName()
	if( Pn2 == 0) then
			Talk(1,"","TiÕc cho ng­¬i kh«ng cã ®éi tr­ëng!")
	else	
			Talk(1,"","§iÒu ng­¬i muèn biÕt ®©y, hi hi!")
			SetPiPView(Pn2,1)
	end;
end;

function  pipwhere()
--	ClosePiP()
	Talk(1,"","§iÒu ng­¬i muèn biÕt ®©y, hi hi!")
	SetPiPView(314,1582,2903)
end;

function  pipkz()
--	ClosePiP()
	Talk(1,"","§iÒu ng­¬i muèn biÕt ®©y!")
	SetPiPView(200,1426,2741)
end;

function  closepip()
		ClosePiP()
		Talk(1,"","Mai mèt ®õng xem th­êng ta n÷a nhĞ!")
end;