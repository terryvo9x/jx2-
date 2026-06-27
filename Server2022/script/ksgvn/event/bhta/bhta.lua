Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\bhta\\bhta_head.lua")

LIB_txtData.szPattern = "[A-Za-z0-9¸µ¶·¹¡¾»¼½Æ¢ÊÇÈÉËEÐÌÎÏÑ£ÕÒÓÔÖãßáâä¤èåæçé¥íêëìîóïñòô¦øõö÷ùÝ×ØÜÞýúûüþ§¸µ¶·¹¨¾»¼½Æ©ÊÇÈÉËÐÌÎÏÑªÕÒÓÔÖãßáâä«èåæçé¬íêëìîóïñòô­øõö÷ùÝ×ØÜÞýúûüþ®_]"

function bhta_Register()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp m«n ph¸i, kh«ng thÓ b¸o danh!")
    end

    if KsgPlayer:GetBigLevel() < BHTA_REGISTER_REQUIRE_LEADER_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("C¸c h¹ ch­a ®¹t %s, kh«ng thÓ b¸o danh!", KsgLib:Level2String(BHTA_REGISTER_REQUIRE_LEADER_LEVEL)))
    end

    if LIB_txtData:CheckString(GetTongName()) > 0 then
        return KsgNpc:Talk(g_szNpcName .. "Tªn bang héi c¸c h¹ cã nhiÒu ch÷ l¹ qu¸, ta kh«ng biÕt ghi l¹i nh­ thÕ nµo n÷a. Hay lµ ®æi bang kh¸c ®i nhÐ.")
    end

    if not KsgPlayer:IsBangChu() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn ®¨ng ký tham gia, h·y mêi bang chñ ®Õn gÆp ta.")
    end

    if GetTongLevel() < BHTA_REGISTER_REQUIRE_TONG_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("Bang héi c¸c h¹ ch­a ®¹t ®Õn cÊp %d, kh«ng thÓ ®¨ng ký.", BHTA_REGISTER_REQUIRE_TONG_LEVEL))
    end

    local nLastAssignTime = GetLastAssignTime()
    local nNow = GetTime()
    if (nNow - nLastAssignTime) < (BHTA_REGISTER_REQUIRE_LEADER_ASSIGN_TIME * 24 * 3600) then
        return KsgNpc:Talk(g_szNpcName .. format("Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n %d ngµy, kh«ng thÓ ®¨ng ký.", BHTA_REGISTER_REQUIRE_LEADER_ASSIGN_TIME))
    end

    if _bhta_IsRegistered() then
        return KsgNpc:Talk(g_szNpcName .. "Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng cÇn ®¨ng ký thªm lÇn n÷a.")
    end

    local tbSay = {
        g_szNpcName .. format("Gi¶i ®Êu Bang Héi Tinh Anh %d s¾p b¾t ®Çu khëi tranh, ®¹i hiÖp h·y nhanh chãng ®Õn b¸o danh cho bang héi cña m×nh!!!", BHTA_SEASON)
    }
    tinsert(tbSay, "Ta muèn b¸o danh tham gia/bhta_RegisterConfirm")
    tinsert(tbSay, "\nTa muèn suy nghÜ thªm/no")
    KsgNpc:SayDialog(tbSay)

end

function bhta_RegisterConfirm()
    if _bhta_IsRegistered() then
        return KsgNpc:Talk(g_szNpcName .. "Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng cÇn ®¨ng ký thªm lÇn n÷a.")
    end

    local nPhe = "Tong"
    if GetTask(701) < 0 then
        nPhe = "Lieu"
    end
    local szTong = GetTongName()
    local szLogTong = szTong .. "	" .. GetAccount() .. "	" .. GetName() .. "	" .. GetLevel() .. "	" .. KsgPlayer:GetBigLevel() .. "	" .. nPhe .. "	" .. date("%Y-%m-%d %H:%M:%S")
    LIB_txtData:AddLine(szLogTong)
    KsgNpc:Talk(g_szNpcName .. format("Bang héi c¸c h¹ b¸o danh Bang Héi Tinh Anh %d thµnh c«ng, xin chóc mõng.", BHTA_SEASON))
    AddGlobalNews(format("Chóc mõng bang héi %s b¸o danh thµnh c«ng Bang Héi Tinh Anh %d.", szTong, BHTA_SEASON))
    Msg2Global(format("Chóc mõng bang héi %s b¸o danh thµnh c«ng Bang Héi Tinh Anh %d.", szTong, BHTA_SEASON))
end

function _bhta_IsRegistered()
    LIB_txtData:Init(BHTA_REGISTER_FILE)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if GetTongName() == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            break
        end
    end
    if nCheckTongName > 0 then
        return 1
    end
    return nil
end

function bhta_ViewRegister()
    local nTongLevel = IsTongMember() or 0
    if nTongLevel < 0 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp bang héi, kh«ng thÓ xem t×nh h×nh ®¨ng ký.")
    end

    LIB_txtData:Init(BHTA_REGISTER_FILE)
    LIB_txtData:LoadMultiColumn()
    local nTongRegister = getn(LIB_txtData.tbTextData) or 0
    if (nTongRegister == nil or nTongRegister == 0) then
        return KsgNpc:Talk("HiÖn t¹i ch­a cã bang héi nµo ®¨ng ký tham gia.")
    end
    local tbSayDialog = {
        g_szNpcName .. format("HiÖn t¹i cã <color=green>%d<color> bang héi ®¨ng ký tham gia Bang Héi Tinh Anh %d", nTongRegister, BHTA_SEASON)
    }
    for i = 1, nTongRegister do
        tinsert(tbSayDialog, format("%d. %s", i, LIB_txtData.tbTextData[i][1]))
    end
    KsgNpc:PageSay(tbSayDialog, 2, 10)
end

function bhta_GetFlags()
    local nTongLevel = IsTongMember() or 0
    if nTongLevel < 0 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp bang héi, kh«ng thÓ xem t×nh h×nh ®¨ng ký.")
    end
    if nTongLevel ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "ChØ cã bang chñ cña bang héi ®¹i diÖn cho bang, míi cã thÓ nhËn <color=red>Tinh Anh LÖnh Kú<color>")
    end

    if not _bhta_IsRegistered() then
        return KsgNpc:Talk(g_szNpcName .. format("Bang héi c¸c h¹ ch­a ®¨ng ký tham gia Bang Héi Tinh Anh %d.", BHTA_SEASON))
    end

    if not KsgLib:HasEnoughBagRoom(2, 300) then
        return
    end
    local nFlagCount = gf_GetTaskByte(TASKID_BHTA, TASKID_BHTA_BYTE_GET_FLAG)
    if nFlagCount >= BHTA_MAX_FLAG_NUM then
        return KsgNpc:Talk(g_szNpcName .. format("Quý bang ®· nhËn ®ñ %d Tinh Anh LÖnh Kú!", BHTA_MAX_FLAG_NUM))
    end

    KsgAward:Give({ tbProp = { 2, 0, 30000 }, nStatus = 1, nCount = 1, nExpiredTime = 3 * 24 * 3600 }, format('Hoµn thµnh nhËn Tinh Anh LÖnh Kú BHTA %d', BHTA_SEASON))
    KsgTask:SetByte(TASKID_BHTA, TASKID_BHTA_BYTE_GET_FLAG, nFlagCount + 1)
    main()
end

function bhta_RegisterFight(nFlagType)

    local szTong = GetTongName() or ""
    if szTong == "" then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp bÊt kú bang nµo. Kh«ng thÓ ®¨ng ký thi ®Êu.")
    end

    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp m«n ph¸i, kh«ng thÓ ®¨ng ký thi ®Êu!")
    end

    if KsgPlayer:GetBigLevel() < BHTA_REGISTER_REQUIRE_MEMBER_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("C¸c h¹ ch­a ®¹t %s, kh«ng thÓ ®¨ng ký thi ®Êu!", KsgLib:Level2String(BHTA_REGISTER_REQUIRE_MEMBER_LEVEL)))
    end

    local nJoinTime = GetJoinTongTime()
    local nDayCount = floor((GetTime() - nJoinTime) / (BHTA_REGISTER_REQUIRE_MEMBER_ASSIGN_TIME * 24 * 3600))
    if nDayCount <= 1 then
        return KsgNpc:Talk(g_szNpcName .. format("Thêi gian gia nhËp bang cña c¸c h¹ Ýt h¬n %d ngµy, kh«ng thÓ ®¨ng ký thi ®Êu!", BHTA_REGISTER_REQUIRE_MEMBER_ASSIGN_TIME))
    end

    if not _bhta_IsRegistered() then
        return KsgNpc:Talk(g_szNpcName .. "Bang héi cña c¸c h¹ kh«ng cã trong danh s¸ch thi ®Êu.")
    end

    if KsgTask:GetByte(TASKID_BHTA, TASKID_BHTA_BYTE_REGISTER_FIGHT) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· ®¨ng ký tham gia thi ®Êu råi!")
    end

    if KsgItem:Count(2, 0, 30000) == 0 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ lµ ai? Trong tay kh«ng cã Tinh Anh LÖnh Kú, chØ ®Õn xem n¸o nhiÖt ­?")
    end

    --- Check ®¨ng ký vµ sè l­îng ®a ®¨ng ký ---
    local szAccount = GetAccount()
    local szPlayerName = GetName()
    local nMember = 0
    local nRegisterCheck = 0
    LIB_txtData:Init(BHTA_REGISTER_FIGHT_FILE)
    LIB_txtData:LoadMultiColumn()
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] and szAccount == LIB_txtData.tbTextData[i][2] then
            nRegisterCheck = 1
            break
        end
        if szTong == LIB_txtData.tbTextData[i][1] then
            nMember = nMember + 1
        end
    end
    if nRegisterCheck == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· cã tªn trong danh s¸ch thi ®Êu, kh«ng cÇn ®¨ng ký n÷a.")
    end

    if nMember >= BHTA_MAX_FLAG_NUM then
        return KsgNpc:Talk(g_szNpcName .. format("Ta ®· cã trong tay danh s¸ch %d ng­êi tham dù cña quý Bang, rÊt tiÕc c¸c h¹ ®· ®Õn trÔ...", BHTA_MAX_FLAG_NUM))
    end

    --- Check sè l­îng hÖ ph¸i ---
    local nRoute = GetPlayerRoute()
    local nRouteCount = 0
    LIB_txtData:Init(BHTA_CHECKROUTE_FILE)
    LIB_txtData:LoadMultiColumn()

    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] and tonumber(nRoute) == tonumber(LIB_txtData.tbTextData[i][2]) then
            nRouteCount = nRouteCount + 1
        end
    end

    if nRouteCount >= BHTA_MAX_ROUTER_MEMBER then
        return KsgNpc:Talk(g_szNpcName .. format("§· ®ñ %d cao thñ thuéc hÖ ph¸i nh­ c¸c h¹, kh«ng thÓ ®¨ng ký thªm.", BHTA_MAX_ROUTER_MEMBER))
    end

    --- Check sè l­îng nguyªn so¸i ---
    local nTeamSize = GetTeamSize()
    local nNguyenSoaiCount = 0
    LIB_txtData:Init(BHTA_REGISTER_FIGHT_FILE)
    LIB_txtData:LoadMultiColumn()

    if nFlagType == BHTA_FLAG_TYPE_NGUYEN_SOAI then
        for i = 1, getn(LIB_txtData.tbTextData) do
            if LIB_txtData.tbTextData[i][7] == "NguyenSoai" then
                nNguyenSoaiCount = nNguyenSoaiCount + 1
            end
        end

        if nNguyenSoaiCount >= BHTA_MAX_NGUYENSOAI_NUMBER then
            return KsgNpc:Talk(g_szNpcName .. format("Bang héi c¸c h¹ ®· ®¨ng ký ®ñ %d Nguyªn So¸i.", BHTA_MAX_NGUYENSOAI_NUMBER))
        end

        ----Check tæ ®éi víi bang chñ khi ®¨ng ký
        if nTeamSize > BHTA_MAX_NGUYENSOAI_NUMBER + 1 then
            return KsgNpc:Talk(g_szNpcName .. format("Tèi ®a chØ ®­îc tæ ®éi %d ng­êi, vµ chØ ®­îc cã %d ng­êi së h÷u trang bÞ Nguyªn So¸i.", BHTA_MAX_NGUYENSOAI_NUMBER + 1, BHTA_MAX_NGUYENSOAI_NUMBER))
        end
        if IsTongMaster() == 0 then
            local nOldIndex = PlayerIndex
            local nTongMaster = 0
            for i = 1, nTeamSize do
                PlayerIndex = GetTeamMember(i)
                if IsTongMaster() == 1 then
                    nTongMaster = 1
                    break
                end
            end
            PlayerIndex = nOldIndex

            if nTongMaster == 0 then
                return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ cÇn tæ ®éi víi Bang chñ")
            end
        end
    end

    if DelItem(2, 0, 30000, 1) == 1 then
        LIB_txtData:Init(BHTA_CHECKROUTE_FILE)
        LIB_txtData:LoadMultiColumn()
        LIB_txtData:AddLine(szTong .. "	" .. nRoute)

        LIB_txtData:Init(BHTA_REGISTER_FIGHT_FILE)
        LIB_txtData:LoadMultiColumn()
        local szPhe = "Tong"
        if GetTask(701) < 0 then
            szPhe = "Lieu"
        end
        local szData = ""
        if nFlagType == BHTA_FLAG_TYPE_NGUYEN_SOAI then
            szData = szTong .. "	" .. szAccount .. "	" .. szPlayerName .. "	" .. nRoute .. "	" .. KsgPlayer:GetBigLevel() .. "	" .. szPhe .. "	" .. "NguyenSoai"
        elseif nFlagType == BHTA_FLAG_TYPE_NORMAL then
            szData = szTong .. "	" .. szAccount .. "	" .. szPlayerName .. "	" .. nRoute .. "	" .. KsgPlayer:GetBigLevel() .. "	" .. szPhe .. "	" .. "Thuong"
        end
        LIB_txtData:AddLine(szData)

        KsgTask:SetByte(TASKID_BHTA, TASKID_BHTA_BYTE_REGISTER_FIGHT, 1) -- Set ®· ®¨ng ký
        KsgAward:Give({ tbProp = { 2, 0, 30001 }, nStatus = 1, nCount = 1, nExpiredTime = 30 * 24 * 3600 }, 1, 'NhËn Vâ l©m thËp nhÞ sø')
        KsgNpc:Talk(g_szNpcName .. format("Chóc mõng ®¹i hiÖp ®¨ng ký thi ®Êu Bang Héi Tinh Anh %d thµnh c«ng. H·y cè g¾ng lªn nhÐ!", BHTA_SEASON))
        AddGlobalNews(format("Chóc mõng ®¹i hiÖp <color=yellow>%s<color> ®· b¸o danh <color=yellow>Bang Héi Tinh Anh %d<color> thµnh c«ng.", szPlayerName, BHTA_SEASON))
        Msg2Global(format("Chóc mõng ®¹i hiÖp %s ®· b¸o danh Bang Héi Tinh Anh %d thµnh c«ng.", szPlayerName, BHTA_SEASON))
    end
end

function bhta_ViewRegisterFightList(nViewId)
    LIB_txtData:Init(BHTA_REGISTER_FIGHT_FILE)
    LIB_txtData:LoadMultiColumn()
    local tbListBaoDanh = {}
    for i = 1, getn(LIB_txtData.tbTextData) do
        if tbListBaoDanh[LIB_txtData.tbTextData[i][1]] then
            tinsert(tbListBaoDanh[LIB_txtData.tbTextData[i][1]], LIB_txtData.tbTextData[i][3])
        else
            tbListBaoDanh[LIB_txtData.tbTextData[i][1]] = { LIB_txtData.tbTextData[i][3] }
        end
    end
    local tbSay = {
        format(g_szNpcName .. "Danh s¸ch bang héi vµ thµnh viªn ®¨ng ký tham gia Bang Héi Tinh Anh %d", BHTA_SEASON)
    }
    local nIdx = 0
    for k, v in pairs(tbListBaoDanh) do
        nIdx = nIdx + 1
        local nMember = 0
        local szListName = ""
        for i = 1, getn(v) do
            local szJoin = ", "
            if i == getn(v) then
                szJoin = ""
            end
            nMember = nMember + 1
            szListName = szListName .. v[i] .. szJoin
        end
        if nViewId == nIdx then
            return KsgNpc:Talk(format(g_szNpcName .. "Danh s¸ch <color=red>%d/%d<color> thµnh viªn ®¨ng ký tham gia thi ®Êu Bang Héi Tinh Anh %d cña bang <color=gold>%s<color> bao gåm:<enter><color=yellow>%s<color>", nMember, BHTA_MAX_FLAG_NUM, BHTA_SEASON, k, szListName), nil, "bhta_ViewRegisterFightList")
        end
        tinsert(tbSay, format("Bang héi %s ®· ®¨ng ký %d thµnh viªn (nhÊn xem chi tiÕt)/#bhta_ViewRegisterFightList(%d)", k, nMember, nIdx))
    end

    KsgNpc:PageSay(tbSay, 2, 10)

end

function bhta_About(page)
    local msgs = {
        {
            format("<color=green>Long Hæ Sø<color>: Tõ <color=yellow> %s ®Õn hÕt %s<color>, c¸c bang chñ cña bang héi ®¹i diÖn cho mçi bang cã thÓ ®Õn gÆp Long Hæ Sø ®Ó nhËn <color=green>%d Tinh Anh LÖnh Kú<color>.\n", KsgDate:ToString(BHTA_GIVE_FLAG_START_DATE), KsgDate:ToString(BHTA_GIVE_FLAG_END_DATE), BHTA_MAX_FLAG_NUM),
            "Bang chñ cã tr¸ch nhiÖm ph©n ph¸t Tinh Anh LÖnh Kú cho c¸c thµnh viªn tham gia gi¶i ®Êu Bang Héi Tinh Anh. C¸c thµnh viªn cña bang héi khi ®¨ng ký ph¶i cã Ýt nhÊt <color=red>1 Tinh Anh LÖnh Kú<color> trong hµnh trang cña m×nh, vµ ph¶i gia nhËp Bang Ýt nhÊt <color=red>3 ngµy<color>\n",
        },
        {
            "Chó ý: \n",
            " - ChØ cã bang chñ cña bang héi ®¹i diÖn cho mçi bang míi cã thÓ nhËn Tinh Anh LÖnh Kú.\n",
            format(" - Mçi bang héi chØ cã thÓ nhËn tèi ®a <color=red>%d Tinh Anh LÖnh Kú<color> tõ Long Hæ Sø.\n", BHTA_MAX_FLAG_NUM),
            format(" - Mçi bang héi chØ ®­îc ®¨ng ký tèi ®a <color=red>%d<color> nh©n vËt cã qu©n hµm <color=red>Nguyªn So¸i.<color>\n", BHTA_MAX_NGUYENSOAI_NUMBER)
        },
        {
            " - Mçi Tinh Anh LÖnh Kú lµ 1 tÊm vÐ ®Ó ®¨ng ký tham gia gi¶i ®Êu Bang Héi Tinh Anh. V× vËy, bang chñ ph¶i cã tr¸ch nhiÖm khi ph©n ph¸t Tinh Anh LÖnh Kú cho c¸c thµnh viªn tham gia thi ®Êu gi¶i.\n",
            " - Khi nép thµnh c«ng <color=green>1 Tinh Anh LÖnh Kú<color> cho Long Hæ Sø, hÖ thèng sÏ tù ®éng ghi nhËn c¸c th«ng tin cña nh©n vËt.\n",
            format(" - Nép <color=green>Tinh Anh LÖnh Kú Nguyªn So¸i<color> th× cÇn ph¶i tæ ®éi víi bang chñ, tæ ®éi chØ ®­îc tèi ®a %d ng­êi víi tèi ®a %d ng­êi së h÷u trang bÞ Nguyªn So¸i.\n", BHTA_MAX_NGUYENSOAI_NUMBER + 1, BHTA_MAX_NGUYENSOAI_NUMBER),
            " - Mçi nh©n vËt chØ cã thÓ nép tèi ®a 1 Tinh Anh LÖnh Kú cho Long Hæ Sø.\n",
        },
    }
    local tCallback = { "#bhta_About(2)", "#bhta_About(3)", "main" };
    local msg = "";
    for k, v in msgs[page] do
        msg = msg .. v;
    end
    Talk(1, tCallback[page], msg)
end