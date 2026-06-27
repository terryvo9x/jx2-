Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\functions\\phutu_functions.lua")

MAX_EXP_IN_TU_LUYEN_CHAU = 100e9
MAX_LINHKHI_EXCHANGE = 50000
MAX_LUYENDON_PER_TIME = 20

EXCHANGE_CHANKHI_RATE = 2
EXCHANGE_CHANKHI_RATE_VIP = 3

EXCHANGE_TINHHON_RATE = 1 -- 1 Tinh HÂn ÆÊi 1 HÂi Ti™n ß¨n
EXCHANGE_NGUYETPHACH_RATE = 1 -- 1 Nguy÷t Ph∏ch ÆÊi 1 Linh Ph∏ch ß¨n


g_szTitle = "<color=green>Tu Luy÷n Ch©u: <color>"

_g_tbLuyenDon = {
    [1] = {
        szName = "Tinh HÂn",
        nLinhKhi = 2000,
        nPopur = 1000,
        nBigLevel = 1099,
        tbProp = { 2, 95, 3855 },
    },
    [2] = {
        szName = "Nguy÷t Ph∏ch",
        nLinhKhi = 5000,
        nPopur = 5000,
        nBigLevel = 1099,
        tbProp = { 2, 102, 232 },
    },
}

function OnUse(nItemIndex)
    local tSay = {
        g_szTitle .. "Linh kh› t¯ ph≠¨ng Æ∑ quy tÙ vµo vi™n Linh Ch©u nµy.",

    }
    for nRouteNum, tbCfg in g_tbPhuTuCfg do
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        if KsgPlayer:GetRoute() ~= nRoute and nRoute > 0 then
            tinsert(tSay, format("Thay ÆÊi Æ’n %s /#phutu_ChangeFactionRoute(%d)", KsgPlayer:GetRouteName(nRoute), nRouteNum))
        end
    end
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and KsgPlayer:GetRoute() ~= nOriginRoute then
        tinsert(tSay, format("\nThay ÆÊi Æ’n %s (Ph∏i chÒ tu)/phutu_ChangeFactionRoute", KsgPlayer:GetRouteName(nOriginRoute)))
    end
    --tinsert(tSay, "\nLuy÷n Linh ß¨n/tuluyenchau_LuyenDon")
    --if KsgPlayer:GetBigLevel() == 1099 then
        --tinsert(tSay, format("ßÊi %d Tinh HÂn l y 1 HÂi Ti™n ß¨n/tuluyenchau_Exchange1", EXCHANGE_TINHHON_RATE))
        --tinsert(tSay, format("ßÊi %d Nguy÷t Ph∏ch l y 1 Linh Ph∏ch ß¨n/tuluyenchau_Exchange2", EXCHANGE_NGUYETPHACH_RATE))
    --end
    tinsert(tSay, "Chuy”n h„a Linh kh›/tuluyenchau_ChuyenHoaLinhKhi")
    tinsert(tSay, "\nLi™n quan tÌi Tu Luy÷n Ch©u/tuluyenchau_Intro")
    tinsert(tSay, "\nK’t thÛc ÆËi thoπi/no")
    KsgNpc:SayDialog(tSay)
end

function tuluyenchau_Exchange1()
    local nHTDCount = KsgItem:Count(2, 95, 3855)
    local nMax = floor(nHTDCount / EXCHANGE_TINHHON_RATE)
    AskClientForNumber("tuluyenchau_ExchangeHTD", 0, nMax, "NhÀp sË l≠Óng HÂi Ti™n ß¨n:")
end

function tuluyenchau_Exchange2()
    local nLPDCount = KsgItem:Count(2, 102, 232)
    local nMax = floor(nLPDCount / EXCHANGE_NGUYETPHACH_RATE)
    AskClientForNumber("tuluyenchau_ExchangeLPD", 0, nMax, "NhÀp sË l≠Óng Linh Ph∏ch ß¨n:")
end

function tuluyenchau_ExchangeHTD(nCount, nConfirm)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "ßπi hi÷p Î trπng th∏i b t th≠Íng, kh´ng th” ti’n hµnh thao t∏c nµy!")
    end
    if not nCount or nCount <= 0 then
        return
    end
    if not nConfirm then
        local tSay = {
            g_szTitle .. format("ßπi hi÷p x∏c nhÀn muËn ÆÊi <color=green>%d HÂi Ti™n ß¨n<color> l y <color=gold>%d Tinh HÂn<colo> sao?", nCount * EXCHANGE_TINHHON_RATE, nCount),
            format("ßÛng vÀy/#tuluyenchau_ExchangeHTD(%d,1)", nCount, 1),
            "Ta suy ngh‹ lπi mÈt l∏t/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    local tbCondition = {
        tbItems = {
            { tbProp = { 2, 95, 3855 }, nCount = nCount * EXCHANGE_TINHHON_RATE }
        },
        nBigLevel = 1099
    }
    if KsgLib:PayMaterial(tbCondition) then
        KsgAward:Give({ tbProp = { 2, 1, 30847 }, nStack = nCount, nStatus = 4 }, "ßÊi Tinh HÂn l y HÂi Ti™n ß¨n")
    end
end

function tuluyenchau_ExchangeLPD(nCount, nConfirm)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "ßπi hi÷p Î trπng th∏i b t th≠Íng, kh´ng th” ti’n hµnh thao t∏c nµy!")
    end
    if not nCount or nCount <= 0 then
        return
    end
    if not nConfirm then
        local tSay = {
            g_szTitle .. format("ßπi hi÷p x∏c nhÀn muËn ÆÊi <color=green>%d Linh Ph∏ch ß¨n<color> l y <color=gold>%d Nguy÷t Ph∏ch<colo> sao?", nCount * EXCHANGE_NGUYETPHACH_RATE, nCount),
            format("ßÛng vÀy/#tuluyenchau_ExchangeHTD(%d,1)", nCount, 1),
            "Ta suy ngh‹ lπi mÈt l∏t/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    local tbCondition = {
        tbItems = {
            { tbProp = { 2, 102, 232 }, nCount = nCount * EXCHANGE_NGUYETPHACH_RATE }
        },
        nBigLevel = 1099
    }
    if KsgLib:PayMaterial(tbCondition) then
        KsgAward:Give({ tbProp = { 2, 1, 31239 }, nStack = nCount, nStatus = 4 }, "ßÊi Nguy÷t Ph∏ch l y Linh Ph∏ch ß¨n")
    end
end

function tuluyenchau_Intro()
    local talk1 = g_szTitle .. "Sˆ dÙng Tu Luy÷n Ch©u, ng≠Íi ch¨i c„ th” ti’n hµnh Æ≠a linh kh› vµo Linh Ch©u <color=yellow> MÁi 1 tri÷u Æi”m kinh nghi÷m sœ ÆÊi Æ≠Óc 1 Æi”m linh kh›<color>"
    talk1 = talk1 .. "<enter>Linh kh› cÚng c„ th” rÛt ra vµ ÆÊi thµnh Æi”m kinh nghi÷m t≠¨ng ¯ng (1 linh kh› = 1 tri÷u kinh nghi÷m, mÁi l«n rÛt ra m t 1 vµng/1 Æi”m linh kh› )"
    talk1 = talk1 .. "<enter>SË linh kh› tËi Æa Linh Ch©u c„ th” ch¯a lµ <color=green>100.000 Æi”m (200.000 Æi”m ÆËi vÌi danh phÀn ßπi Hi÷p)<color> Khi linh kh› Æ«y sœ kh´ng th” ch¯a th™m."
    local talk2 = g_szTitle .. "Ngoµi ra Sˆ DÙng Tu Luy÷n Ch©u cﬂn c„ th” luy÷n ch’ c∏c loπi ßan D≠Óc dÔng cho kinh nghi÷m H„a C∂nh."
    talk2 = talk2 .. "<enter>Luy÷n <color=red>Tinh HÂn<color> c«n <color=yellow>2.000 Æi”m linh kh› vµ 1000 Æi”m tu luy÷n<color> <color=gray>(Chuy”n sinh 10 c p 99 mÌi c„ th” luy÷n loπi Æan d≠Óc nµy)<color>"
    talk2 = talk2 .. "<enter>Luy÷n <color=red>Nguy÷t Ph∏ch<color> c«n <color=yellow>5.000 Æi”m linh kh› vµ 5000 Æi”m tu luy÷n<color> <color=gray>(Chuy”n sinh 10 c p 99 mÌi c„ th” luy÷n Æan d≠Óc nµy)<color>"
    talk2 = talk2 .. "<enter><color=yellow>ßan D≠Óc luy÷n tı Tu Luy÷n Ch©u sœ kh„a vµ kh´ng c„ hπn sˆ dÙng."
    local talk3 = g_szTitle .. "Linh Kh› cﬂn c„ th” chuy”n h„a thµnh Ch©n Kh› tπi ßan ßi“n, <color=yellow>MÁi Æi”m Linh Kh› c„ th” chuy”n h„a tËi Æa Æ≠Óc 2 Æi”m Ch©n Kh› (3 Æi”m ÆËi vÌi danh phÀn ßπi Hi÷p)"
    Talk(3, "", talk1, talk2, talk3)
end

function tuluyenchau_LuyenDon(nLinhDonIndex)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "ßπi hi÷p Î trπng th∏i b t th≠Íng, kh´ng th” ti’n hµnh thao t∏c nµy!")
    end
    if nLinhDonIndex and _g_tbLuyenDon[nLinhDonIndex] then
        local tbLuyenDon = _g_tbLuyenDon[nLinhDonIndex]
        local tSay = {
            g_szTitle .. format("Luy÷n 1 <color=gold>%s<color> c«n c„ ÆÒ <color=red>%d Linh Kh›, %d Æi”m Tu Luy÷n vµ Æπt %s<color> Æπi hi÷p x∏c Æﬁnh muËn luy÷n ch¯?", tbLuyenDon.szName, tbLuyenDon.nLinhKhi, tbLuyenDon.nPopur, KsgLib:Level2String(tbLuyenDon.nBigLevel)),
            format("ßÛng vÀy/#tuluyenchau_LuyenDon_Submit(%d)", nLinhDonIndex),
            format("\nTa suy ngh‹ lπi mÈt l∏t/no"),
        }
        return KsgNpc:SayDialog(tSay)
    end
    local tSay = {
        g_szTitle .. "ßπi Hi÷p muËn luy÷n loπi linh Æ¨n nµo.",
    }
    for nIndex, tbCfg in _g_tbLuyenDon do
        tinsert(tSay, format("Ta muËn luy÷n %s/#tuluyenchau_LuyenDon(%d)", tbCfg.szName, nIndex))
    end
    tinsert(tSay, "\nTπm thÍi ch≠a muËn luy÷n/no")
    KsgNpc:SayDialog(tSay)
end

function tuluyenchau_LuyenDon_Submit(nIndex, nNumber)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "ßπi hi÷p Î trπng th∏i b t th≠Íng, kh´ng th” ti’n hµnh thao t∏c nµy!")
    end
    if not _g_tbLuyenDon[nIndex] then
        return
    end
    local tbLuyenDon = _g_tbLuyenDon[nIndex]
    if nNumber and nNumber > 0 then
        local tbCondition = {
            nLinhKhi = tbLuyenDon.nLinhKhi * nNumber,
            nPopur = tbLuyenDon.nPopur * nNumber,
            nBigLevel = tbLuyenDon.nBigLevel
        }
        if KsgLib:PayMaterial(tbCondition) then
            KsgAward:Give({
                tbProp = tbLuyenDon.tbProp, nStack = nNumber, nStatus = 4,
            }, "Luy÷n " .. tbLuyenDon.szName)
        end
        return
    end
    local nLinhKhiCounter = floor(KsgPlayer:GetLinhKhiPoint() / tbLuyenDon.nLinhKhi)
    local nPopurCounter = floor(KsgPlayer:GetPopur() / tbLuyenDon.nPopur)
    local nMax = min(nLinhKhiCounter, nPopurCounter)
    if nMax > MAX_LUYENDON_PER_TIME then
        nMax = MAX_LUYENDON_PER_TIME
    end
    if nMax == 0 then
        local szNotice = "\n"
        if nLinhKhiCounter == 0 then
            szNotice = szNotice .. "<color=red>Kh´ng ÆÒ Æi”m linh kh›<color>\n"
        end
        if nPopurCounter == 0 then
            szNotice = szNotice .. "<color=red>Kh´ng ÆÒ Æi”m tu luy÷n<color>\n"
        end
        return KsgNpc:Talk(g_szTitle .. "ßπi hi÷p ch≠a chu»n bﬁ ÆÒ Æi“u ki÷n luy÷n Æ¨n, kh´ng th” ti’n hµnh luy÷n." .. szNotice)
    end
    AskClientForNumber(format("tuluyenchau_LuyenDon%d", nIndex), 0, nMax, "NhÀp sË l≠Óng muËn luy÷n:");
end

function tuluyenchau_LuyenDon1(nNumber)
    if nNumber <= 0 then
        return
    end
    tuluyenchau_LuyenDon_Submit(1, nNumber)
end

function tuluyenchau_LuyenDon2(nNumber)
    if nNumber <= 0 then
        return
    end
    tuluyenchau_LuyenDon_Submit(2, nNumber)
end

function tuluyenchau_ChuyenHoaLinhKhi()
    local nCurrentLinhKhi = KsgPlayer:GetLinhKhiPoint()
    local talkHead = format("Trong Linh Ch©u ch≠a c„ chÛt linh kh› nµo, ng≠¨i Æang muËn Æ≠a linh kh› vµo Linh Ch©u sao?")
    local nMaxLinhKhi = tuluyenchau_GetMaxLinhKhi()
    if nCurrentLinhKhi > 0 then
        talkHead = format("Trong Linh Ch©u Æang ch¯a <color=yellow>%d/%d<color> Æi”m Linh Kh›, c„ th” rÛt ra..", nCurrentLinhKhi, nMaxLinhKhi)
    end
    talkHead = talkHead .. format("<enter><color=yellow>(MÁi Æi”m linh kh› t≠¨ng ¯ng vÌi 1 tri÷u Æi”m kinh nghi÷m, tËi Æa c„ th” Æ≠a vµo %d Æi”m Linh Kh›)<color><enter><color=green>ßπi Hi÷p V‚ L©m c„ th” tr˜ Æ≠Óc nhi“u h¨n<color>", nMaxLinhKhi)
    local tSay = {
        g_szTitle .. talkHead,
        "Ta muËn Æ≠a linh kh› vµo Linh Ch©u/tuluyenchau_PutLinhKhi",
    }
    if nCurrentLinhKhi > 0 then
        tinsert(tSay, "Ta muËn hÛt linh kh› tı Linh Ch©u/tuluyenchau_HutLinhKhi")
        tinsert(tSay, "Ta muËn chuy”n h„a Linh Kh› thµnh Ch©n Kh›/tuluyenchau_ExchangeChanKhi")
    end
    tinsert(tSay, "\nRÍi kh·i/no")
    KsgNpc:SayDialog(tSay)
end

function tuluyenchau_GetLinhKhiRemaining()
    return tuluyenchau_GetMaxLinhKhi() - KsgPlayer:GetLinhKhiPoint()
end

function tuluyenchau_GetMaxLinhKhi()
    local nMaxExp = MAX_EXP_IN_TU_LUYEN_CHAU
    if KsgPlayer:IsVipAccount() then
        nMaxExp = nMaxExp * 2
    end
    return floor(nMaxExp / 1e6)
end

function tuluyenchau_ExchangeChanKhi(nNumber)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk("ßπi hi÷p Î trπng th∏i b t th≠Íng, kh´ng th” ti’n hµnh thao t∏c nµy!")
    end
    if nNumber and nNumber <= 0 then
        return
    end
    if nNumber then
        return tuluyenchau_ConvertLinhKhi2ChanKhi(nNumber)
    end
    return AskClientForNumber("tuluyenchau_ExchangeChanKhi", 0, tonumber(KsgPlayer:GetLinhKhiPoint()), "NhÀp sË Linh kh›:")
end

function tuluyenchau_AddLinhKhi(nLinhKhi)
    if nLinhKhi <= 0 then
        return
    end
    local nExpRequire = nLinhKhi * 1e6
    if GetExp() < nExpRequire then
        return KsgNpc:Talk(format("Hi÷n ng≠¨i kh´ng c„ ÆÒ <color=red>%s<color>, kh´ng th” chuy”n h„a thµnh linh kh›!", KsgLib:Exp2String(nExpRequire)))
    end
    local nCurrentLinhKhi = KsgPlayer:GetLinhKhiPoint()
    local nMaxLinhKhi = tuluyenchau_GetMaxLinhKhi()
    if (nCurrentLinhKhi + nLinhKhi) <= nMaxLinhKhi then
        KsgPlayer:BigDelExp(nExpRequire)
        KsgPlayer:ModifyLinhKhiPoint(nLinhKhi)
        KsgPlayer:Msg(format("ß∑ chuy”n h„a %s vµo Tu Luy÷n Ch©u", KsgLib:Exp2String(nExpRequire)))
        KsgNpc:Talk(format("ßi”m linh kh› Tu Luy÷n Ch©u <color=green>t®ng %d Æi”m<color><enter>Linh kh› hi÷n tπi: <color=yellow>%d/%d<color>", nLinhKhi, KsgPlayer:GetLinhKhiPoint(), tuluyenchau_GetMaxLinhKhi()))
    else
        local nRemaining = nMaxLinhKhi - nCurrentLinhKhi
        KsgNpc:Talk(g_szTitle .. format("Linh kh› cÒa Tu Luy÷n Ch©u Æ∑ Æ«y, kh´ng th” ch¯a th™m, tËi Æa chÿ c„ th” ch¯a th™m %d Æi”m linh kh›!", nRemaining))
    end
end

function tuluyenchau_PutLinhKhi(nNumber)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "ßπi hi÷p Î trπng th∏i b t th≠Íng, kh´ng th” ti’n hµnh thao t∏c nµy!")
    end
    if nNumber and nNumber > 0 then
        return tuluyenchau_AddLinhKhi(nNumber)
    end
    if tuluyenchau_GetLinhKhiRemaining() == 0 then
        return KsgNpc:Talk("Linh kh› trong Linh Ch©u Æ∑ Æ«y, kh´ng th” nhÀn th™m")
    end
    if not nNumber then
        local nMax = floor(GetExp() / 1e6)
        if nMax > tuluyenchau_GetLinhKhiRemaining() then
            nMax = tuluyenchau_GetLinhKhiRemaining()
        end
        if nMax > MAX_LINHKHI_EXCHANGE then
            nMax = MAX_LINHKHI_EXCHANGE
        end
        AskClientForNumber("tuluyenchau_PutLinhKhi", 0, tonumber(nMax), "NhÀp sË Linh kh›?")
    end
end

function tuluyenchau_HutLinhKhi(nNumber)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk("ßπi hi÷p Î trπng th∏i b t th≠Íng, kh´ng th” ti’n hµnh thao t∏c nµy!")
    end
    if nNumber and nNumber > 0 then
        return tuluyenchau_Convert2LinhKhi(nNumber)
    end
    if not nNumber then
        local nMax = KsgPlayer:GetLinhKhiPoint()
        if nMax > MAX_LINHKHI_EXCHANGE then
            nMax = MAX_LINHKHI_EXCHANGE
        end
        AskClientForNumber("tuluyenchau_HutLinhKhi", 0, tonumber(nMax), "NhÀp sË Linh kh›?");
    end
end

function tuluyenchau_Convert2LinhKhi(nLinhKhi)
    if GetCash() < nLinhKhi * 10000 then
        return KsgNpc:Talk(format("RÛt <color=yellow>%d linh kh›<color> c«n ti™u hao <color=green>%d vµng<color>, n’u kh´ng c„ ÆÒ kh´ng th” rÛt ra!", nLinhKhi, nLinhKhi))
    end
    if nLinhKhi > KsgPlayer:GetLinhKhiPoint() then
        return KsgNpc:Talk(format("Linh kh› trong Tu Luy÷n Ch©u kh´ng ÆÒ %d Æi”m, kh´ng th” chuy”n h„a thµnh kinh nghi÷m!", nLinhKhi))
    end
    local nGainExp = nLinhKhi * 1e6
    Pay(nLinhKhi * 10000)
    KsgPlayer:BigAddExp(nGainExp)
    KsgPlayer:ModifyLinhKhiPoint(-nLinhKhi)

    KsgNpc:Talk(format("Chuy”n h„a thµnh c´ng <color=green>%d Æi”m linh kh› thu Æ≠Óc %s<color><enter>SË linh kh› cﬂn lπi lµ:<color=yellow> %d/%d<color> Æi”m", nLinhKhi, KsgLib:Exp2String(nGainExp), KsgPlayer:GetLinhKhiPoint(), tuluyenchau_GetMaxLinhKhi()))
end

function tuluyenchau_ConvertLinhKhi2ChanKhi(nLinhKhi)
    if KsgPlayer:GetMeridianLevel() < 1 then
        return KsgNpc:Talk("ßπi hi÷p ch≠a khai th´ng kinh mπch, kh´ng th” chuy”n h„a Ch©n Kh›.")
    end
    if MeridianGetLeftGenuineQiCapcity() <= 0 then
        return KsgNpc:Talk("ßi”m ch©n kh› cÒa ßπi hi÷p Æ∑ Æπt giÌi hπn, kh´ng th” chuy”n h„a th™m.")
    end
    if nLinhKhi > KsgPlayer:GetLinhKhiPoint() then
        return KsgNpc:Talk(format("Linh kh› trong Tu Luy÷n Ch©u kh´ng ÆÒ %d Æi”m, kh´ng th” chuy”n h„a thµnh Ch©n Kh› !", nLinhKhi))
    end
    KsgPlayer:ModifyLinhKhiPoint(-nLinhKhi)
    local nRate = EXCHANGE_CHANKHI_RATE
    if KsgPlayer:IsVipAccount() then
        nRate = EXCHANGE_CHANKHI_RATE_VIP
    end
    AwardGenuineQi(nLinhKhi * nRate)
    KsgPlayer:Msg(format("Chuy”n h„a thµnh c´ng, ti™u hao %d Æi”m linh kh›", nLinhKhi))
    KsgNpc:Talk(format("Chuy”n h„a thµnh c´ng <color=green>%d Æi”m linh kh› thu Æ≠Óc %d Æi”m Ch©n kh›<color><enter>SË linh kh› cﬂn lπi lµ:<color=yellow> %d/%d<color> Æi”m", nLinhKhi, nLinhKhi * nRate, KsgPlayer:GetLinhKhiPoint(), tuluyenchau_GetMaxLinhKhi()))
end