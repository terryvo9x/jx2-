Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\sdb.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\lib\\date.lua")
-- Include("\\script\\misc\\data_state\\state.lua"); --Êý¾ÝÂñµã
-- Include("\\script\\misc\\observer\\observer_head.lua");
--?gm ds SendScript2Client("Open([[Fair]], 2);");

--×¢Òâ£ºsettings\Â·¾¶ÏÂµÄ½Å±¾»á´ò°üÏÞÖÆÐÞ¸Ä£¬¿ª¹ØÐëÉèµ½script\Â·¾¶ÏÂµÄ½Å±¾ÖÐ
FAIR_RELEASE_WORK = 1 --·¢²¼¿ØÖÆ 0:close 1:open

if FAIR_RELEASE_WORK == 0 then
    FAIR_LV_MAX = 3 --VN:»¯¾³µÈ¼¶ÉÏÏÞ
else
    FAIR_LV_MAX = 6 --VN:»¯¾³µÈ¼¶ÉÏÏÞ
end

_FAIR_DEBUG = 0

FAIR_LV_ROUND = 3 --VN:Éý¼¶»¯¾³ÐèÒª¼¤»îËùÓÐÐÇËÞµÄÂ×´Î
FAIR_STAR_NUM = 10 --VN:Ã¿ÂÖÓÐ¶àÉÙ¿ÅÐÇÐÇ
FAIR_STAR_LV_MAX = (FAIR_STAR_NUM * FAIR_LV_ROUND * FAIR_LV_MAX) --VN:»¯¾³ÐÇÐÇµÈ¼¶ÉÏÏÞ
g_tFairBaseNeedLingpo = { -- ÁéÆÇµ¤ÏûºÄ»ù×¼
    4, 8, 12--10,20,30
}
g_tFairBaseNeedHuixian = { -- »ØÏÉµ¤ÏûºÄ»ù×¼
    10, 20, 30
}

g_tFairLvUpCDStartDate = { 2020, 09, 15 }    --¼ÆËã¶¯Ì¬»¯¾³µÈ¼¶ÉÏÏÞµÄÈÕÆÚÆðµã
g_nFairCurMaxStarLvBase = FAIR_STAR_NUM * FAIR_LV_ROUND * 3 + 1    --3¼¶ÒÔÉÏÎª¶¯Ì¬µÈ¼¶ÉÏÏÞ
g_nFairLvUpCDDays = 4    --Ã¿7ÌìÔö¼ÓÒ»´Î»¯¾³µÈ¼¶ÉÏÏÞ

g_tFairLvUpCD = { --»¯¾³Éý¼¶CD 
    --[nFairLv] = nCD, --Ìì
    [0] = 0,
    [1] = 0,
    [2] = 0,
    [3] = 1,
    [4] = 2,
    [5] = 3,
}

FAIRRANK_SDBKEY = "fair_rank_20180604"
FAIR_MAX_RANK_PLAYER = 10
g_tFairRankBuffer = {
    -- {name, route, value}
}

g_tFairConfig = { { 10, 1, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 5, 10000000 },
                  { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 5, 20000000 },
                  { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 5, 30000000 },
                  { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 5, 40000000 },
                  { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 5, 50000000 }, };

g_nMaxExp = 26600000000
TASKID_FAIR_UP_FLAG = 3511
TASKID_FAIR_VALUE = 3510
TASKID_FAIR_UP_TIMESTAMP = 3599

function _get_fair_lv(nStarLv)
    if not nStarLv then
        return
    end
    return floor(nStarLv / (FAIR_STAR_NUM * FAIR_LV_ROUND))
end

function _get_fair_up_lv_day_pass()
    local nDaySecond = 24 * 60 * 60
    local nDay = floor(GetTime() / nDaySecond) - floor(GetTask(TASKID_FAIR_UP_TIMESTAMP) / nDaySecond)
    if not nDay or nDay < 0 then
        nDay = 0
    end
    return nDay
end

function _get_cur_max_star_lv()
    local nDays = Date() - Date(g_tFairLvUpCDStartDate[1], g_tFairLvUpCDStartDate[2], g_tFairLvUpCDStartDate[3])
    local nMaxStarLv = g_nFairCurMaxStarLvBase + floor(nDays / g_nFairLvUpCDDays)
    local nDayCanUpLv = floor(nDays / g_nFairLvUpCDDays + 1) * g_nFairLvUpCDDays - nDays

    return nMaxStarLv, nDayCanUpLv
end

function Fair_OnSvrStart()
    -- ËùÓÐ·þÎñÆ÷¶¼»áÔÚÆô¶¯Ê±ÏÂÔØÒ»·Ý¿½±´
    local sdb = SDB(FAIRRANK_SDBKEY, 0, 0);
    sdb:apply("\\script\\misc\\fair\\fair.lua", "Fair_LoadRankData")
end

function FairGet(szName)
    for i = 1, getn(g_tFairRankBuffer) do
        if szName == g_tFairRankBuffer[i][1] then
            return i
        end
    end
    return nil
end

function FairCmp(lhs, rhs)
    return lhs[3] > rhs[3]
end

function Fair_LoadRankData(szkey, nkey1, nkey2, nCount)
    local data = SDB(szkey, nkey1, nkey2, nCount);
    for i = 1, nCount do
        local tTmp = data["head" .. i]
        local szName = tTmp[1];
        local route = tTmp[2];
        local value = tTmp[3];
        if g_tFairRankBuffer[i] == nil then
            g_tFairRankBuffer[i] = { szName, route, value }
        end
    end
    if getn(g_tFairRankBuffer) > 1 then
        sort(g_tFairRankBuffer, FairCmp)
    end
    ------------------debug------------------
    if _FAIR_DEBUG == 1 then
        FairDebugShow()
    end
    ------------------debug------------------
    UpdateFairRank(g_tFairRankBuffer)
end
function FairDebugShow()
    ------------------debug------------------
    print("\n------------------debug g_tFairRankBuffer------------------")
    if getn(g_tFairRankBuffer) == 0 then
        print("g_tFairRankBuffer is empty")
    end
    for i = 1, getn(g_tFairRankBuffer) do
        local tmp = g_tFairRankBuffer[i]
        print(format("[%d]: [Name:%s] [route:%d] [value:%d]", i, tmp[1], tmp[2], tmp[3]))
    end
    ------------------debug------------------
end

function Fair_SaveFairDataPer10min()
    -- Ö»ÓÐÒ»¸ö·þÎñÆ÷»á´æ´¢Êý¾Ý£¨ÔÝ¶¨150µØÍ¼ËùÔÚµÄsvr£©
    if SubWorldID2Idx(150) < 0 then
        return
    end

    ------------------debug------------------
    if _FAIR_DEBUG == 1 then
        FairDebugShow()
    end
    ------------------debug------------------
    if getn(g_tFairRankBuffer) == 0 then
        Fair_OnSvrStart();
        return
    end
    local sdb = SDB(FAIRRANK_SDBKEY, 0, 0);
    local maxn = min(getn(g_tFairRankBuffer), FAIR_MAX_RANK_PLAYER)
    for i = 1, maxn do
        local tTmp = g_tFairRankBuffer[i]
        local szName = tTmp[1];
        local route = tTmp[2];
        local value = tTmp[3];
        sdb["head" .. i] = { "sdd", szName, route, value };
    end
    sdb:apply("\\script\\misc\\fair\\fair.lua", "Fair_SaveRankData")
end

function Fair_SaveRankData(szkey, nkey1, nkey2, nCount)
end

function OnFairLevelChange(szParam)
    -- Ã¿¸ö·þÎñÆ÷¶¼»áÊÕµ½ÅÅÐÐ°ñ¸üÐÂµÄÊý¾Ý
    local lpos1, rpos1 = strfind(szParam, "|", 1)
    local lpos2, rpos2 = strfind(szParam, "|", rpos1 + 1)
    local szName = strsub(szParam, 1, lpos1 - 1)
    local route = tonumber(strsub(szParam, rpos1 + 1, lpos2 - 1))
    local value = tonumber(strsub(szParam, rpos2 + 1, strlen(szParam)))
    local idx = FairGet(szName)
    local lastIdx = min(getn(g_tFairRankBuffer), FAIR_MAX_RANK_PLAYER)
    local rankUpdate = false
    if idx ~= nil then
        g_tFairRankBuffer[idx] = { szName, route, value }
        rankUpdate = true
    else
        if lastIdx < FAIR_MAX_RANK_PLAYER then
            -- »¹ÓÐÎ»ÖÃ
            g_tFairRankBuffer[lastIdx + 1] = { szName, route, value }
            rankUpdate = true

        else
            -- ÎÞÎ»ÖÃ
            if value > g_tFairRankBuffer[lastIdx][3] then
                -- ÐÂµÄÖµ¸ü´ó£¬¶¥µôÇ°ÃæµÄ
                g_tFairRankBuffer[lastIdx] = { szName, route, value }
                rankUpdate = true
            end
        end
    end
    if rankUpdate == true then
        sort(g_tFairRankBuffer, FairCmp)
        UpdateFairRank(g_tFairRankBuffer)
    end
end

function FairNeedDesc(nFairLv, nLingpo, nHuixian, bConfirm)
    local szTitle = format("KÝch ho¹t cÇn: Linh Ph¸ch §¬n x<color=red>%d<color>  Håi Tiªn §¬n x<color=red>%d<color>", nLingpo, nHuixian)
    local tbSay = {}
    if bConfirm == 1 then
        szTitle = format("%s\nMë ngay?", szTitle)
        tinsert(tbSay, format("§ång ý/#SetFairLevelConfirm(%d,%d)", nLingpo, nHuixian))
    end
    tinsert(tbSay, "Hñy bá/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function SetFairLevel()
    local nFairLv = GetTask(TASKID_FAIR_VALUE);
    if GetTask(TASKID_FAIR_UP_FLAG) == 0 then
        Msg2Player("Hãa C¶nh ch­a më");
        return -3
    end
    if nFairLv >= FAIR_STAR_LV_MAX then
        Msg2Player("Sao nµy ®· kÝch ho¹t hoµn toµn, kh«ng thÓ t¨ng tiÕp.");
        return -3
    end

    local nDayPass = _get_fair_up_lv_day_pass()
    local nNextDayCanUpLv = g_tFairLvUpCD[_get_fair_lv(nFairLv)] - nDayPass
    if nNextDayCanUpLv > 0 then
        Talk(1, "", format("CÇn ®îi %d ngµy sau míi cã thÓ kÝch ho¹t sao nµy.", nNextDayCanUpLv))
        return
    end

    --local nCurMaxStarLv, nDayCanUpLv = _get_cur_max_star_lv()
    --if nFairLv >= nCurMaxStarLv then
    --	Talk(1, "", format("%d ngµy sau míi ®­îc kÝch ho¹t sao nµy", nDayCanUpLv))
    --	return
    --end

    local nPlayerLevel = GetLevel()
    local nTrans = gf_GetTransCount();
    local nTotallevel = nTrans * 100 + nPlayerLevel;
    if nTotallevel < 1099 then
        Talk(1, "", "CÇn ®¹t chuyÓn sinh 10 cÊp 99 míi më Hãa C¶nh")
        return
    end

    local nNextFairLv = nFairLv + 1;
    local nFair = floor(nFairLv / (FAIR_LV_ROUND * FAIR_STAR_NUM))
    local nRound = mod(floor(nFairLv / FAIR_STAR_NUM), FAIR_LV_ROUND) + 1
    local nNeedLingpo = g_tFairBaseNeedLingpo[nRound] + nFair
    local nNeedHuixian = g_tFairBaseNeedHuixian[nRound] + nFair
    if GetItemCount(2, 1, 31239) < nNeedLingpo or GetItemCount(2, 1, 30847) < nNeedHuixian then
        -- ÁéÆÇµ¤
        FairNeedDesc(nNextFairLv, nNeedLingpo, nNeedHuixian, 0)
        return
    end
    FairNeedDesc(nNextFairLv, nNeedLingpo, nNeedHuixian, 1)
end

function SetFairLevelConfirm(nNeedLingpo, nNeedHuixian)
    local nFairLv = GetTask(TASKID_FAIR_VALUE);
    if nFairLv >= FAIR_STAR_LV_MAX then
        Msg2Player("Sao nµy ®· kÝch ho¹t hoµn toµn, kh«ng thÓ t¨ng tiÕp.");
        return -3
    end

    local nNextFairLv = nFairLv + 1;

    if DelItem(2, 1, 31239, nNeedLingpo) == 1 and DelItem(2, 1, 30847, nNeedHuixian) == 1 then
        UpPlayerFairStar(nNextFairLv);
        SetTask(TASKID_FAIR_UP_TIMESTAMP, GetTime())
        WriteLog(format("Hãa C¶nh Tinh Hån kÝch ho¹t Name=%s PreLevel=%d CurLevel=%d", GetName(), nFairLv, nNextFairLv));
        local szParam = format("%s|%d|%d", GetName(), GetPlayerRoute(), nNextFairLv)
        SendScript2Global("fair_level_changed", szParam) -- ÓÃÀ´¸üÐÂ»¯¾³ÅÅÐÐ°ñ
        SendScript2VM("\\script\\global\\attr_point_addon.lua", "Update_Player_Attr_Point_Addon()")
    end
    return -1
end

function onlogin_fair_attr_point_addon()
    local nCurS = GetStrengthMaxAddOn()
    local nCurD = GetDexterityMaxAddOn()
    local nCurV = GetVitalityMaxAddOn()
    local nCurE = GetEnergyMaxAddOn()
    local nCurO = GetObserveMaxAddOn()

    local nFairLv = GetTask(TASKID_FAIR_VALUE);
    local round = floor(nFairLv / 10)
    local star = floor(mod(nFairLv, 10))
    local nAdd = 0
    if star >= 2 then
        -- ±¾ÂÖíýíöÐÇËÞÒÑ¾­¼¤»î£¬¼Ó50Ç±ÄÜÉÏÏÞ
        nAdd = nAdd + 50
    end
    nAdd = nAdd + round * 50 -- Ã¿ÂÖ£¨10¿ÅÐÇ£©»á¼Ó50Ç±ÄÜÉÏÏÞ
    SetStrengthMaxAddOn(nCurS + nAdd)
    SetDexterityMaxAddOn(nCurD + nAdd)
    SetVitalityMaxAddOn(nCurV + nAdd)
    SetEnergyMaxAddOn(nCurE + nAdd)
    SetObserveMaxAddOn(nCurO + nAdd)
end

t_FairGGStask = {  -- »¯¾³¿ç·þÈÎÎñ
    ["tianmenzhen_battle"] = 3524,
    ["one_road_battle"] = 3525,
    ["3v3_battle"] = 3526,
    ["1v1_battle"] = 3527,
}



-- SendScript2VM("\\script\\misc\\fair\\fair.lua", format("ggs_do_fair_task([[%s]])", "tianmenzhen_battle"));	
function ggs_do_fair_task(szTask)
    if tGtTask:check_cur_task(580) == 1 then
        local nTaskId = t_FairGGStask[szTask]
        SetTask(nTaskId, GetTask(nTaskId) + 1)
    end
end