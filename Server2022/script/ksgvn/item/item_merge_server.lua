Import("\\script\\ksgvn\\lib.lua")

SOURCE_SERVER_ID = 5 -- from Phi Long
TARGET_SERVER_ID = 6 -- to Ngäa Hæ
NEW_SERVER_ID = 7 -- Phi Long + Ngäa Hæ  = Long Hæ M«n

function OnUse(nItemIdx)
    if not KsgLib:HasEnoughBagRoom(10, 100) then
        return
    end
    if KsgPlayer:GetBigLevel() < 991 then
        return KsgNpc:Talk("Nh©n vËt cÇn ®¹t chuyÓn sinh 9 cÊp 91 trë lªn míi cã thÓ më tói quµ nµy.")
    end

    local nLastServerId = KsgTask:GetByte(TASKID_SERVER, TASK_SERVER_BYTE_LAST_SERVER_ID)
    local nExpPill = 10
    if nLastServerId == TARGET_SERVER_ID then
        nExpPill = 20
    end

    local tbAward = {
        { tbProp = { 2, 1, 50016 }, nStatus = 4, nStack = 200 }, -- Tói Quµ Vâ L©m
        { tbProp = { 2, 95, 204 }, nStatus = 4, nStack = 10 }, -- Thiªn Cang LÖnh
        { tbProp = { 2, 1, 30370 }, nStatus = 4, nStack = 10 }, -- Thiªn M«n Kim LÖnh
        { tbProp = { 2, 102, 214, }, nStatus = 4, nStack = 1 }, -- Th­¬ng H¶i Ch©u cÊp 7 - khãa
        { tbProp = { 2, 1, 50265 }, nStatus = 4, nStack = 1 }, -- ThÎ täa kþ TruyÒn ThuyÕt
        { tbProp = { 2, 1, 50253 }, nStatus = 4, nStack = nExpPill },
    }

    if KsgLib:GetServerId() ~= NEW_SERVER_ID then
        return KsgNpc:Talk("C¸c h¹ kh«ng ®ñ ®iÒu kiÖn më tói quµ nµy.")
    end

    if DelItemByIndex(nItemIdx, 1) == 1 then
        KsgAward:Give(tbAward, "Quµ Gép M¸y Chñ")
    end
end
