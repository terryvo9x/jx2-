Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\functions\\gm.lua")
g_szTitle = "<color=green>ThÎ tr¶i nghiÖm: <color>"

function OnUse(nItemIndex)
    local nCurDate = KsgDate:Today()
    local tSay = { g_szTitle .. format("<color=white>Chµo mõng b¹n ®Õn víi <color=fire>Vâ L©m 2 Offline - Phiªn b¶n Shiina 2021<color>!<enter>Chia sÎ miÔn phÝ bëi <color=gold>Th­¬ng Eopi<color>. Facebook: <color=cyan>facebook.com/thuong.eopi<color><enter>Chóc c¸c b¹n ch¬i game vui vÎ!<enter>Vui lßng lùa chän tÝnh n¨ng:", KsgDate:CurrentTestDay(), KsgDate:TestRemainingDays()) }
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        tinsert(tSay, "+ Gia nhËp m«n ph¸i/kgm_ChangeRoute")
    else
        tinsert(tSay, "\n+ NhËn trang bÞ/kgm_ShowMenuEquip")
        tinsert(tSay, "\n+ NhËn mËt tÞch/kgm_ShowMenuBook")
        tinsert(tSay, "\n+ NhËn ngo¹i trang & thó c­ìi/kgm_ShowMenuHorseAndCoat")
        tinsert(tSay, "\n+ ChuyÓn sinh/kgm_ShowMenuReborn")
        tinsert(tSay, "\n+ Hãa c¶nh/kgm_ShowMenuFair")
        tinsert(tSay, "\n+ T¨ng kinh m¹ch/kgm_ShowMenuMeridian")
        tinsert(tSay, "\n+ Th­¬ng h¶i di ch©u/kgm_ShowMenuPear")
        tinsert(tSay, "\n+ Chøc n¨ng Bang héi/kgm_ShowMenuBang")
        tinsert(tSay, "\n+ NhËn thó c­ng/kgm_ShowMenuPet")
        tinsert(tSay, "\n+ NhËn c¸c hç trî kh¸c/kgm_ShowMenuSupport")
    end

    if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tSay, "\n+ NhËn Thiªn PhËt Ch©u vµ Ph¸ Ma Chó/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tSay, "\n+ NhËn ¸m KhÝ vµ C¬ Quan/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tSay, "\n+ NhËn X¸ Lîi Kim §¬n/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tSay, "\n+ NhËn ChiÕn M·/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tSay, "\n+ NhËn ChiÕn M· vµ Tô TiÔn/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tSay, "\n+ NhËn Phong Thi Phï/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tSay, "\n+ NhËn Cæ/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tSay, "\n+ NhËn §iªu/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tSay, "\n+ NhËn Linh KiÕm/factionSupport_CLKT")
        end
    end

    tinsert(tSay, "\n+ Thanh lý tói/kgm_ClearBagItems")
    tinsert(tSay, "\nKÕt thóc ®èi tho¹i/no")
    KsgNpc:SayDialog(tSay)
end
