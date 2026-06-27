--=============================================
--create by baiyun 2009.11.25
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯ Ê¥µ®ÀñºÐNPC½Å±¾ÎÄ¼þ
--============================================

Include("\\script\\online\\viet_event\\200912\\event_head.lua")

function main()
    local nNpcIndex = GetTargetNpc();
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_DATE) < nDate then
        SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT, 0);
    end
    if GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT) >= VIET_0912_SHENGDANLIHE_MAX_COUNT then
        Talk(1, "", "H«m nay ®¹i hiÖp sö dông phÇn th­ëng thu ®­îc giíi h¹n cao nhÊt, xin ®îi ngµy mai sö dông tiÕp.");
        return 0;
    end
    if GetTime() - GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME) < 60 then
        Talk(1, "", format("§¹i hiÖp cÇn ph¶i ®îi thªm  %d gi©y míi cã thÓ tiÕp tôc nhËn th­ëng", (60 - GetTime() + GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME))));
        return 0;
    end
    SetNpcLifeTime(nNpcIndex, 0);    
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_DATE, nDate);
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT, GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT) + 1);
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME, GetTime());
    ModifyExp(100000)
    WriteLogEx("Hoat dong thang 12","nhËn th­ëng hép quµ",100000,"®iÓm kinh nghiÖm")
end
