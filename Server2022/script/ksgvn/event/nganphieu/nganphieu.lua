Import("\\script\\ksgvn\\lib.lua")
Include('\\script\\ksgvn\\event\\nganphieu\\nganphieu_head.lua')

g_szNpcName = g_szNpcName or "<color=yellow>Chñ TiÒn Trang: <color>"

function nganPhieu_ExchangeMenu()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp m«n ph¸i nªn kh«ng thÓ tham gia ho¹t ®éng nµy.")
    end
    local tSay = {
        g_szNpcName .. "C¸c h¹ ®· mang hµng ®Õn råi sao? Cã b¶o vËt g× h·y mau ®­a ta xem! NÕu ®­îc ta sÏ tr¶ cho c¸c h¹ Ng©n PhiÕu t­¬ng xøng!",
    }
    for nIndex, tbExchangeCfg in _g_tbExchangeList do
        if tbExchangeCfg.nNeedNum > 1 then
            tinsert(tSay, format("Ta cã %d %s (gi¸ thu mua %d Ng©n PhiÕu)/#_nganPhieu_ExchangeShowInput(%d)", tbExchangeCfg.nNeedNum, tbExchangeCfg.szName, tbExchangeCfg.nTicket, nIndex))
        else
            tinsert(tSay, format("Ta cã %s (gi¸ thu mua %d Ng©n PhiÕu)/#_nganPhieu_ExchangeShowInput(%d)", tbExchangeCfg.szName, tbExchangeCfg.nTicket, nIndex))
        end
    end
    tinsert(tSay, "\nTa kh«ng muèn ®æi víi «ng/no")
    KsgNpc:SayDialog(tSay)
end

function _nganPhieu_ExchangeShowInput(nIndex)
    if not _g_tbExchangeList[nIndex] then
        return KsgNpc:FormalTalk(g_szNpcName, "d­êng nh­ kh«ng mang theo thø ta cÇn, hay lµ khi kh¸c l¹i tíi!")
    end
    local tbExchangeCfg = _g_tbExchangeList[nIndex]
    local nHaveItemCount = KsgItem:Count(tbExchangeCfg.tbProp)
    if nHaveItemCount < tbExchangeCfg.nNeedNum then
        return KsgNpc:FormalTalk(g_szNpcName, format("thËt cã mang theo <color=yellow>%d %s<color> tíi ­? Ta kh«ng nh×n nhÇm chø?", tbExchangeCfg.nNeedNum, tbExchangeCfg.szName))
    else
        g_tbCurrentExchange[GetName()] = nIndex
        AskClientForNumber("_nganPhieu_DoExchange", 0, floor(nHaveItemCount / tbExchangeCfg.nNeedNum), "NhËp sè l­îng ®æi")
    end

end

function _nganPhieu_DoExchange(nCount, nIndex)
    if nCount > 0 then
        if nIndex then
            local nExchangeIndex = g_tbCurrentExchange[GetName()]
            if not _g_tbExchangeList[nExchangeIndex] then
                return KsgNpc:FormalTalk(g_szNpcName, "d­êng nh­ kh«ng mang theo thø ta cÇn, hay lµ khi kh¸c l¹i tíi!")
            end
            local nLeftCapacity = _nganPhieu_GetNganPhieuLeftCapacity()
            local tbExchangeCfg = _g_tbExchangeList[nExchangeIndex]
            local nGainTicket = nCount * tbExchangeCfg.nTicket
            if nGainTicket > nLeftCapacity then
                return KsgNpc:FormalTalk(g_szNpcName, "®· mang theo qu¸ nhiÒu ng©n phiÕu trªn ng­êi, xin h·y dïng bít ®i!<enter><color=gray>L­u ý: Tèi ®a chØ cã thÓ mang theo<color><color=gold>%d Ng©n PhiÕu<color>")
            end
            if KsgItem:Delete(tbExchangeCfg.tbProp, nCount * tbExchangeCfg.nNeedNum) then
                KsgTask:Modify(TASKID_EVENT_NGANPHIEU_POINT, nCount * tbExchangeCfg.nTicket)
            end
            return
        end
        local nExchangeIndex = g_tbCurrentExchange[GetName()]
        if not _g_tbExchangeList[nExchangeIndex] then
            return KsgNpc:FormalTalk(g_szNpcName, "d­êng nh­ kh«ng mang theo thø ta cÇn, hay lµ khi kh¸c l¹i tíi!")
        end
        local tbExchangeCfg = _g_tbExchangeList[nExchangeIndex]
        local tSay = {
            g_szNpcName .. format("Ng­¬i x¸c nhËn muèn <color=yellow>®æi %d %s lÊy %d Ng©n PhiÕu<color>?", nCount * tbExchangeCfg.nNeedNum, tbExchangeCfg.szName, tbExchangeCfg.nTicket * nCount),
            format("§óng vËy/#_nganPhieu_DoExchange(%d, %d)", nCount, nExchangeIndex),
            "Suy nghÜ l¹i mét chót/no",
        }

        KsgNpc:SayDialog(tSay)
    end
end

function _nganPhieu_GetNganPhieu()
    return KsgTask:Get(TASKID_EVENT_NGANPHIEU_POINT)
end

function _nganPhieu_GetNganPhieuLeftCapacity()
    return MAX_NGAN_PHIEU - KsgTask:Get(TASKID_EVENT_NGANPHIEU_POINT)
end