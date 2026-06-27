Import("\\script\\ksgvn\\constants.lua")

GLB_VALUE_SERVER_ID = 1023

g_tbServerCfg = {
    [1] = {
        szName = "Eopi",
        tbTimeOpen = { nHour = 10, nDay = 25, nMonth = 5, nYear = 2027, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20270515 },
        tbTimeTop = { nStartDate = 20200525, nEndDate = 20270725, nGetTongAwardDate = 20270727 },
        bOpenTestCard = 1,
        bOpenNewPlayerCard = 0,
        bOpenAdminCard = 1,
        bOpenGMCard = 1,
        bOpenTop = 1,
    },
    [2] = {
        szName = "Noriko",
        tbTimeOpen = { nHour = 10, nDay = 12, nMonth = 7, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20200712, nEndDate = 20200912, nGetTongAwardDate = 20200914 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 0,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [3] = {
        szName = "Shiina",
        tbTimeOpen = { nHour = 10, nDay = 20, nMonth = 8, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20200820, nEndDate = 20201020, nGetTongAwardDate = 20201022 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 0,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [4] = {
        szName = "Supper",
        tbTimeOpen = { nHour = 10, nDay = 8, nMonth = 11, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20201108, nEndDate = 20210108, nGetTongAwardDate = 20210110 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 0,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [5] = {
        szName = "TuyÕt PhÊn", -- Tµng Long gép víi Phi ¦ng
        tbTimeOpen = { nHour = 10, nDay = 8, nMonth = 11, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20201108, nEndDate = 20210108, nGetTongAwardDate = 20210110 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 0,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [6] = {
        szName = "NhËt Vy",
        tbTimeOpen = { nHour = 10, nDay = 14, nMonth = 1, nYear = 2021, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20210114, nEndDate = 20210226, nGetTongAwardDate = 20210228 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 0,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [7] = {
        szName = "Minh Nguyªn",-- Phi Long gép víi Ngäa Hæ
        tbTimeOpen = { nHour = 10, nDay = 14, nMonth = 1, nYear = 2021, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20210114, nEndDate = 20210226, nGetTongAwardDate = 20210228 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [100] = {
        szName = "Tr¶i NghiÖm",
        tbTimeOpen = { nHour = 10, nDay = 17, nMonth = 12, nYear = 2020, },
        tbTimeTest = { nStartDate = 20201217, nEndDate = 20231211 },
        tbTimeTop = { nStartDate = 20200525, nEndDate = 20230725, nGetTongAwardDate = 20230727 },

        bOpenTestCard = 1,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [150] = {
        szName = "Liªn §Êu",
        tbTimeOpen = { nHour = 10, nDay = 10, nMonth = 5, nYear = 2020, },
        tbTimeTest = { nStartDate = 20080808, nEndDate = 20080808 },
        tbTimeTop = { nStartDate = 20080808, nEndDate = 20080808, nGetTongAwardDate = 20080808 },

        bOpenTestCard = 1,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 1,

        bOpenTop = 1,
    },
}

g_tbServerDefaultCfg = {
    szName = "Vâ L©m 2 Shiina",
    tbTimeOpen = { nHour = 10, nDay = 10, nMonth = 5, nYear = 2020, },
    tbTimeTest = { nStartDate = 20080808, nEndDate = 20080808 },
    tbTimeTop = { nStartDate = 20080808, nEndDate = 20080808, nGetTongAwardDate = 20080808 },

    bOpenTestCard = 0,
    bOpenNewPlayerCard = 0,
    bOpenAdminCard = 0,
    bOpenGMCard = 0,

    bOpenTop = 0,
}

g_tbLoginCfg = {
    [1] = {
        bCondition = 'bOpenTestCard',
        tbProp = { 2, 1, 50001 },
        szRequireRule = 'player',
        szMsg = "C¸c h¹ nhËn ®­îc <color=yellow>1 ThÎ Tr¶i NghiÖm Offline<color>, dïng ®Ó tr¶i nghiÖm tÝnh n¨ng cña <color=cyan>Vâ L©m 2 Shiina phiªn b¶ offline ®­îc cung cÊp bëi loliteam.net<color>, xin kiÓm tra t¹i hµnh trang!<enter>Chóc b¹n ch¬i game vui vÎ!"
    },
}