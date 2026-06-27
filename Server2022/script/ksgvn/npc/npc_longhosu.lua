Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\bhta\\bhta.lua")

g_szNpcName = "<color=green>Long Hæ Sø<color>: "

function main()
    local tSay = {
        format(g_szNpcName .. "<color=gold>Bang Héi Tinh Anh mïa %d<color> ®· khai më, c¸c h¹ hái ta cã viÖc g×?", BHTA_SEASON),
    }

    local szCurrentDate = tonumber(date("%Y%m%d"));

    if szCurrentDate >= BHTA_REGISTER_START_DATE and szCurrentDate <= BHTA_REGISTER_END_DATE then
        tinsert(tSay, "§¨ng ký tham gia Bang Héi Tinh Anh/bhta_Register")
        tinsert(tSay, "Ta muèn xem t×nh h×nh b¸o danh Bang Héi Tinh Anh/bhta_ViewRegister")
    end

    if szCurrentDate >= BHTA_GIVE_FLAG_START_DATE and szCurrentDate <= BHTA_GIVE_FLAG_END_DATE then
        tinsert(tSay, "NhËn Tinh Anh LÖnh Kú/bhta_GetFlags")
        tinsert(tSay, format("Nép Tinh Anh LÖnh Kú/#bhta_RegisterFight(%d)", BHTA_FLAG_TYPE_NORMAL))
        tinsert(tSay, format("Nép Tinh Anh LÖnh Kú (Nguyªn So¸i)/#bhta_RegisterFight(%d)", BHTA_FLAG_TYPE_NGUYEN_SOAI))
        tinsert(tSay, "Xem danh s¸ch ®¨ng ký thi ®Êu/bhta_ViewRegisterFightList")
    end

    tinsert(tSay, "Ta muèn t×m hiÓu vÒ gi¶i ®Êu/#bhta_About(1)")
    tinsert(tSay, "\nTa chØ tiÖn ghÐ qua!/no")

    KsgNpc:SayDialog(tSay)
end
