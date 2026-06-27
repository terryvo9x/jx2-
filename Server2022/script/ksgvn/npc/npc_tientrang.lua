Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\event\\nganphieu\\nganphieu.lua")

g_szNpcName = "<color=yellow>Chñ tiÒn trang: <color>"

function main()
    local szHead = g_szNpcName .. format("%s t×m ta cã viÖc g× kh«ng?", KsgPlayer:GetSexName())

    if KsgDate:Today() <= EVENT_NGANPHIEU_END_DATE then
        g_tbCurrentExchange[GetName()] = 0
        local szNganPhieuInfo = format("HiÖn ®¹i hiÖp ®ang cã <color=yellow>%d Ng©n PhiÕu<color>", _nganPhieu_GetNganPhieu())
        szHead = g_szNpcName .. "GÇn ®©y ta cã kh¸ch cÇn ®Æt mét l­îng lín Tói Quµ Vâ L©m vµ c¸c b¶o vËt trªn giang hå, nÕu ®¹i hiÖp cã thÓ gióp, ta sÏ tÆng ®¹i hiÖp mét l­îng <color=gold>Ng©n PhiÕu<color> lµm quµ!!<enter>" .. szNganPhieuInfo
    end

    local tSay = {
        szHead,
    }

    if KsgDate:Today() >= EVENT_NGANPHIEU_START_DATE and KsgDate:Today() <= EVENT_NGANPHIEU_END_DATE then
        tinsert(tSay, "Ta ®Õn ®æi b¶o vËt lÊy Ng©n PhiÕu/nganPhieu_ExchangeMenu")
        tinsert(tSay, "Ta muèn dïng Ng©n PhiÕu ®æi b¶o vËt/_tienTrang_ShowExchangeNganPhieuShop")
    end

    tinsert(tSay, "\nT¹i h¹ chØ tiÖn ghÐ qua!/no")

    return KsgNpc:SayDialog(tSay)
end

function _tienTrang_ShowExchangeNganPhieuShop()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp m«n ph¸i nªn kh«ng thÓ tham gia ho¹t ®éng nµy.")
    end

    return KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_NGANPHIEU)
end