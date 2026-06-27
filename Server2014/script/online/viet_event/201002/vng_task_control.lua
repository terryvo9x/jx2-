-- TaskID for VNG
-- Created by TuanNA5
--Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua");
local nDate = tonumber(date("%y%m%d"))
--**************************************************************************************************************
-- Global Task
--**************************************************************************************************************
GLB_TSK_SERVER_ID = 1023 -- ServerID
GLB_TASK_NEWRES_SONG = 1024 -- Thêi gian Tèng Nguyªn So¸i kİch ho¹t x2 Tµi Nguyªn ChiÕn
GLB_TASK_NEWRES_LIAO = 1025 -- Thêi gian Liªu Nguyªn So¸i kİch ho¹t x2 Tµi Nguyªn ChiÕn
GLB_TASK_SUMMON_SONG = 1034 -- Thêi gian kİch ho¹t gäi boss phe Tèng
GLB_TASK_SUMMON_LIAO = 1035 -- Thêi gian kİch ho¹t gäi boss phe Tèng
GLB_TASK_PROMOTION = 1037 --l­u thêi gian khi mua vËt phÈm khuyÕn m·i h»ng ngµy

--**************************************************************************************************************
-- Temp Task
--**************************************************************************************************************
-- Dù ®o¸n thi ®Êu
--TSK_TMP_SELECT_COUNT = 108 -- Sè ®éi ®· chän
--TSK_TEAM_LIST_1 = 109 -- List team ®· chän 1
--TSK_TEAM_LIST_2 = 110 -- List team ®· chän 2
--TSK_TMP_CHOICE = 117 -- Lo¹i h×nh dù ®o¸n ®· chän

-- Tµi nguyªn chiÕn
TSK_TIME_KICHHOAT_TNC =  2285 --l­u time kİch ho¹t hç trî ®µo nhanh tµi nguyªn chiÕn
TSK_TMP_NEWRES = 108 -- Thu thËp tµi nguyªn
TSK_TEMP_SONGLIAO_BET = 109 -- Dù ®o¸n Tèng Liªu

TSK_TMP_TRANS_NEILI = 110 -- B¾c §Èu truyÒn c«ng thuËt
TSK_TMP_PRACTICE_NEILI = 117 -- B¾c §Èu d­ìng sinh thuËt
TSK_TMP_NEILI_TYPE_SP = 205 -- Ph©n lo¹i D­ìng Sinh & TruyÒn C«ng ®Æc biÖt

TSK_TMP_BHTA6_VOTE = 118 -- Vote BHTA 5

TSK_TMP_PET_INDEX = 119 -- L­u index cña pet
TSK_TMP_PET_ENEMY_INDEX= 129 -- L­u index pet cña ®èi thñ
TSK_TMP_ENEMY_INDEX= 201 -- L­u index cña ®èi thñ
TSK_TMP_FRUIT_INDEX = 208 -- Mua tr¸i c©y NPC §­êng Minh Thµnh
TSK_TMP_CHUYENDOITRANGBI = 209
--**************************************************************************************************************
-- Task ID
--**************************************************************************************************************
-- TASK BAO HIEM: 2665

-- TASK NEW SERVER
if nDate >= 141021 and nDate <= 141202 then
	TSK_HOATDONGNEWSERVER = 1534
	TSK_HOATDONGNEWSERVER_NHANTHUONG = 2157
	TSK_CONGHIENBANG = 2185
	TSK_TOP_LEVEL = 2545
	TSK_TOP_AWARD = 2276
	TSK_BONUS_CONLON = 2185
else
	TSK_HOATDONGNEWSERVER = 2665
	TSK_HOATDONGNEWSERVER_NHANTHUONG = 2665
	TSK_CONGHIENBANG = 2665
	TSK_TOP_LEVEL = 2665
	TSK_TOP_AWARD = 2665
	TSK_BONUS_CONLON = 2665
end

-- Xãa KhuÊt Nguyªn Béi
TSK_XOA_KHUATNGUYENBOI = 2188 -- Bit 1: first login; Bit 2: Nhan lai 1 lan mien phi
-- Kim xµ th¸ng 1
TSK_KIMXATHANG1 = 2188
--================= Phôc Sinh 2
TSK_PHUCSINH2 = 2175	-- ABB
-- A: tr¹ng th¸i nhËn thö th¸ch
-- BB: tæng sè lÇn hoµn thµnh nhiÖm vô
TSK_PHUCSINH2_COUNT = 2176	-- ABBCDDD
-- A: Sè lÇn hoµn thµnh nv trong ngµy
-- BB: ID nhiÖm vô ®ang nhËn
-- C: tr¹ng th¸i hoµn thµnh nhiÖm vô
-- DDD: bé ®Õm b­íc nhiÖm vô
-- Event trang bŞ Kim Xµ
--TSK_EVENTKIMXA = 2540 -- Expired
TSK_EVENTKIMXA_NHANTHUONG = 2545 -- Expired

-- Event trang bŞ Kim Xµ Liªn Server
TSK_KIMXA_ALLSERVER_POINT = 2660
TSK_KIMXA_ALLSERVER_AWARD = 2540

-- Sinh tö v« ng·
TSK_SINHTUVONGA1 = 2700 -- GAABCCDDD
	-- AA: Bé ®Õm phÇn th­ëng 
	-- B: Tr¹ng th¸i nhËn hç trî mçi ngµy
	-- CC: §iÓm nép mçi ngµy
	-- DDD: §iÓm hiÖn cã
	--G: x¸c ®Şnh qua nµy reset ®iÓm nép mçi ngµy
TSK_SINHTUVONGA2 = 2701 -- YYMMDD: ngµy hÕt h¹n
TSK_SINHTUVONGA3 = 2713 -- AxxxxxxxB; A: tr¹ng th¸i nhËn n.vô; B: nhiÖm vô Cóng TÕ
-- NhiÖm vô ®ång hµnh
TSK_DONGHANH = 2189
	-- Byte 1 + Byte2: sè l­îng nhiÖm vô hoµn thµnh; 
	-- Byte 3: Lo¹i nhiÖm vô ®ang nhËn; 
	-- Bit 25: Tr¹ng th¸i hoµn thµnh nhiÖm vô.
	-- Bit 26: Tr¹ng th¸i nhËn th­ëng mçi ngµy
	-- Bit 27: Tr¹ng th¸i nhËn th­ëng cuèi
TSK_DONGHANH_COUNT = 2283
	-- Byte 1: Sè lÇn nhËn nv ®ång hµnh trong ngµy, reset mçi ngµy
	-- Byte 2: Sè lÇn hoµn thµnh cßn l¹i cña nhiÖm vô cã yªu cÇu sè l­îng
-- NhËn hç trî qu©n c«ng
TSK_HOTROQUANCONG = 2284
-- Thu ®æi nguyªn liÖu Qu©n Dông
TSK_THUQUANDUNG = 2187 -- ABCDDE
	 -- A: PhÇn th­ëng cuèi më réng event
	 -- B: Sè lÇn nép kem que mçi ngµy
	 -- C: Sè lÇn nép siro mçi ngµy
	 -- DD: Sè lÇn nép qu©n dông mçi ngµy
	 -- E: PhÇn th­ëng cuèi qu©n dông mçi ngµy
	 
-- §æi th­ëng Th¸i H­ HuyÔn C¶nh (daily resset); Byte1: ®æi trang søc; Byte2: ®æi phÇn th­ëng;
TSK_THAIHU_DOITHUONG = 1794
-- 16/4 den 21/4
TSK_DOINGUYENLIEU = 2743  -- ABBB: A=>0/1: check nhËn th­ëng cuèi; BBB=> sè lÇn ®æi nguyªn liÖu
-- Task nhËn th­ëng CNDSK
TSK_GIVE_AWARD_CNDSK = 2669
BIT_KARAOKE2011 = 1

-- Task ®æi vËt phÈm event hµng th¸ng
--TSK_GIVE_EVENT_ITEM = 2430	--==> dïng cho nhiÖm vô VBonus 7/2014

-- Task ®¨ng kı Long Hæ Tranh Hïng
--TASK_DANGKY_BHTA9 = 2743			
-- TASK_LHTH = 2283 -- Dïng ®Õn hÕt ngµy 2013-07-03
---- Task nhËn th­ëng Bang Chñ Tinh Anh
--TSK_BANGCHUTINHANH = 2743 -- 1: ®· nhËn; 0: ch­a nhËn

-- Task nép tr¸i c©y nhËn ch©n khİ
TSK_GETQIBYFRUIT = 2747 -- Byte 1: reset ngµy; Bit 9: nhËn th­ëng nép nhiÒu tr¸i c©y; Bit 10 ®Õn 30: nép mçi lo¹i tr¸i c©y
--Task nhiÖm vô lµm giµu mçi ngµy (ko giíi h¹n thêi gian)						--Task support chuyÓn sinh miÔn phİ ¦ng Tö vµ Phông Tö							-- Task VBonus: mua vËt phÈm gi¶m gi¸ 
TSK_LAMGIAU = 2693																			--TSK_SUPPORT_CHUYENSINH = 2693													
-- VBonus: §Şnh d¹ng: ABCDmmdd; A, B, C, D: Sè l­îng item ®· mua theo tõng lo¹i; HÕt h¹n 01/8/2013
TSK_VBONUS_SaleOff = 2282
TSK_SUPPORT_CHUYENSINH = 2188
--Bit 1(N÷ oa), 2(Th¸i h­ huyÔn c¶nh), 3(Tµng kiÕm), 4(L­¬ng S¬n), 5(Thñy Lîi), 6(H¹t gièng), 7(B¸t Nh· Nhá), 8(B¸t Nh· Lín), 9(C©y Tø Linh), 10(Nh¹n M«n Rùc Löa), 11(ghĞp Tµng R­¬ng), 12(tr¹ng th¸i nhËn nhiÖm vô), 13(trang th¸i nhËn th­ëng)
-- ChuyÓn sinh
TRANSLIFE_MISSION_ID = 1537
TRANSLIFE_TASK_ID = 1538
TRANSLIFE_BYTE_COUNT = 1
TRANSLIFE_BYTE_FACTION = 2
TRANSLIFE_BYTE_FLAG_LEVEL = 3
TRANSLIFE_BYTE_SAVE_LEVEL = 4
--- ChuyÓn sinh 5
-- 80 TMT , 45 LSB , 69 C©y Tø Linh
TRANSLIFE_TASK_5_1 = 2677
-- N÷ Oa B¶o H¹p , §¸nh dÊu tiªu diÖt L·nh H­¬ng L¨ng
TRANSLIFE_TASK_5_2 = 2678

TRANSLIFE_TASK_34 = 2279 -- NhiÖm vô chuyÓn sinh 3,4
-- §¸nh dÊu sè lÇn hoµn thµnh theo hÖ sè 10
TRANSLIFE_TASK_34_FLAG = 2542
TRANSLIFE_BYTE_TASK1 = 1 -- Tµi nguyªn chiÕn
TRANSLIFE_BYTE_TASK2 = 2 -- H¹t gièng
TRANSLIFE_BYTE_TASK3 = 3 -- B¸t nh· nhá
TRANSLIFE_BYTE_TASK4 = 4 -- B¸t nh· lín

TSK_SETQC_NEWSERVER = 2158

TSK_SERVER_ID = 2280 -- §Şnh danh Server ID cho role
TSK_SERVER_ID_CUR = 1
TSK_SERVER_ID_NEW = 2
TSK_SERVER_ID_JUNGONG = 3
TSK_SERVER_ID_TIME = 2281

-- Bang héi tinh anh 
TSK_BHTA6_6E8 = 2665
TSK_BHTA6_2E8 = 2666
TSK_BHTA6_WEEKLYAWARD = 2667
TASK_BHTA6 = 2668
BYTE_BHTA6_GET_TALK = 1
BYTE_BHTA6_GET_TOP10 = 2
TASKID_JYBHZ_USE_HONGBAO = 2702
TASKID_JYBHZ_GET_HONGBAO = 2703

-- Task nhËn th­ëng trång C©y Tø Linh
TSK_AWARD_4SOUL = 2183
TSK_AWARD_4SOUL_DATE = 2182

-- Task sö dông tr¸i c©y
TSK_USEFRUIT_DATE = 2184
TSK_USEFRUIT_EXP = 2177
TSK_USEFRUIT_FLAG_1 = 2178
TSK_USEFRUIT_FLAG_2 = 2179
TSK_USEFRUIT_FLAG_3 = 2180
TSK_USEFRUIT_FLAG_4 = 2181

-- Task ®Òn bï qu©n c«ng
TSK_JUNGONG_PUNISH = 2152
TSK_JUNGONG_PUNISH_DATE = 2153
TSK_JUNGONG_LIMIT = 2155

-- Ng«i Sao May M¾n
TSK_LUCKY_STAR_201011 = 2661

-- Trøng ngÉu nhiªn
TSK_RANDOMIZE_EGG = 2172

-- Ph¸o hoa CNDSK
FIREWORK_CNDSK_USE = 2493
FIREWORK_CNDSK_TIME = 2494

-- NV STD
KH_QUEST_TSK = 1533
FIREWORK_IDOL_USE = 2495
FIREWORK_IDOL_TIME = 2496

-- §Òn bï qu©n c«ng
TSK_SET_QUANCONG = 2660

-- Valentine 2011
--TSK_VALENTINE_GET_FLAG_2011 = 2662
--TSK_VALENTINE_USE_FLAG_2011 = 2663
TSK_VALENTINE_USED_EXP_2011 = 2664
TRIGGER_USER_DEFINE_VALENTINE_2011 = 2517
TRIGGER_TB_DEFINE_VALENTINE_2011 = 1506

-- B¹n §ång Hµnh
TASK_VNG_PET = 2560 -- 2 sè ®Çu l­u cÊp cña pet, c¸c sè sau l­u ®iÓm n©ng cÊp
TASK_VNG_PET_QUEST = 2561 -- Cã chøa ngµy th¸ng ®Ó reset task cña pet
TASK_VNG_PET_TIME = 2562
TASK_VNG_PET_GODPOINT = 1535 -- 2 sè ®Çu l­u sè lÇn hoµn thµnh nhiÖm vô linh lùc, c¸c sè sau l­u ®iÓm linh lùc
TASK_VNG_PET_INFO = 1536 -- L­u sè lÇn nhiÖm vô train pet,  l­u giíi tİnh pet,  l­u lo¹i pet
BYTE_PET_INFO_TRAIN = 1
BYTE_PET_INFO_SEX = 2
BYTE_PET_INFO_TYPE = 3
TASK_PET_TRAIN_TIME = 1541

TASK_ROSE_WAR = 2157

-- Vâ L©m B¶o H¹p
TSK_VLBH_EXP = 2744		--old: 2674
-- L­u th¸ng reset  th¸ng tuÇn 
TSK_VLBH_MARK = 2745		--old: 2672
-- L­u thêi gian gi·n c¸ch
TSK_VLBH_TIME = 2673
--L­u ®iÓm ch©n khİ
TSK_VLBH_QI = 2729
--L­u ®iÓm c«ng tr¹ng
TSK_VLBH_QUANCONG = 2756
--Sè lÇn nhËn VLBH trong ngµy & tuÇn
TSK_VLBH_Qty = 2730 -- ®Şnh d¹ng: xxxyyy; xxx: sè lÇn nhËn trong tuÇn; yyy: sè lÇn nhËn trong ngµy
-- L­u thêi gian gi·n c¸ch 2
TSK_VLBH_TIME2 = 2732 

-- Niªn thó T12/2010
TSK_NIENTHU20101201_TIME = 2175
TSK_NIENTHU20101201_INFO = 2176

-- B¹n §ång Hµnh chiÕn ®Êu
TASK_PET_FIGHT = 1542 -- Sè ®Çu l­u kÕt qu¶ trËn ®Êu, c¸c sè cßn l¹i l­u index cê thi ®Êu

-- B¹n §ång Hµnh v­ît Th¸i H­
TSK_PET_TAIXU_DATE = 2173  -- Sè ®Çu tiªn chøa tr¹ng th¸i pet trong Th¸i H­, sè thø 2 ghi sè lÇn tham gia miÔn phİ, sè thø 3 ghi sè lÇn tham gia tr¶ phİ, 6 ch÷ sè tiÕp theo ghi ngµy th¸ng n¨m tham gia
TSK_PET_TAIXU_POINT = 2174 -- Sè thø 1 tíi thø 3 chøa tÇng lín nhÊt,®· v­ît qua, c¸c sè cßn l¹i chøa ®iÓm v­ît ¶i
TSK_PET_TAIXU_INFO = 2177
-- §¸nh dÊu 
TSK_THAIHU_DAY = 2706

-- Bo sung event thang 8/2010
--EVENT201009_GIVE_CAKE = 2430
--VET_201009_01_TASK_FLAG = 2429
--VET_201009_01_BIT_LIMIT = 1
--VET_201009_01_BIT_METHOD = 2
--VET_201009_01_BIT_METHOD_CONFIRM = 3
--VET_201009_01_BYTE_TYPE = 2
--VET_1000_THANGLONG_TIME = 2428

-- Tµi Nguyªn ChiÕn
TSK_TRANS_POINT_ALLOW = 2711 --l­u gi¸ trŞ b¶o l­u, ko cho phĞp tham gia chiÕn tr­êng
TSK_NEWRES_CALC_DAILY = 2712 -- l­u gi¸ trŞ ®· ®¸nh gi¸ qu©n hµm ®Ó tham gia TNC hµng ngµy
TSK_GET_THUOC_TIME = 2663 --l­u gi¸ trŞ reset ngµy cña lÊy thuèc vµ kick ho¹t x2
TSK_GET_THUOC = 2662 -- LÊy sè cuèi l­u l¹i viÖc ®· nhËn thuèc
TSK_NEWRES_DATE = 2148 -- Thêi gian nhËn nhiÖm vô
TSK_NEWRES_POINT = 2149 -- Sè ®iÓm tİch lòy ®­îc
TSK_NEWRES_FINISH = 2161 -- Flag hoµn thµnh nhiÖm vô
BYTE_NEWRES_STATE = 1 -- Tr¹ng th¸i cña nhiÖm vô 0: ko cã nhiÖm vô, 1: ®· nhËn nhiÖm vô, 2: ®· hoµn thµnh nhiÖm vô
BYTE_NEWRES_DONE = 2 -- Sè lÇn hoµn thµnh nhiÖm vô trong ngµy
BYTE_NEWRES_DOUBLE_EXP = 3 -- Sè lÇn kİch ho¹t x2 exp trong ngµy, chØ dµnh cho Nguyªn So¸i

TSK_GET_DHTN = 2164	--TSK_SONGLIAO_BET_1 = 2164 -- Dù ®o¸n Tèng Liªu ®ît 1
TSK_GIVE_DHTN = 2165	--TSK_SONGLIAO_BET_2 = 2165 -- Dù ®o¸n Tèng Liªu ®ît 2

TSK_GET_NEILI_EXP = 2166 -- B¾c §Èu TruyÒn C«ng - nhËn
TSK_GIVE_NEILI_EXP = 2167 -- B¾c §Èu TruyÒn C«ng - cho

TSK_GET_NEILI_EXP_SP = 2679 -- B¾c §Èu TruyÒn C«ng §Æc BiÖt - nhËn
TSK_GIVE_NEILI_EXP_SP = 2680 -- B¾c §Èu TruyÒn C«ng §Æc BiÖt - cho

TSK_PRATICE_NEILI_EXP_TYPE_1 = 2168 -- B¾c §Èu D­ìng Sinh - lo¹i 1
TSK_PRATICE_NEILI_EXP_TYPE_2 = 2169 -- B¾c §Èu D­ìng Sinh - lo¹i 2
TSK_PRATICE_NEILI_EXP_TYPE_3 = 2170 -- B¾c §Èu D­ìng Sinh - lo¹i 3
TSK_PRATICE_NEILI_EXP_TYPE_4 = 2171 -- B¾c §Èu D­ìng Sinh - lo¹i 4

TSK_PRATICE_NEILI_EXP_TYPE_1_SP = 2681 -- B¾c §Èu D­ìng Sinh §Æc BiÖt  - lo¹i 1
TSK_PRATICE_NEILI_EXP_TYPE_2_SP = 2682 -- B¾c §Èu D­ìng Sinh §Æc BiÖt  - lo¹i 2
TSK_PRATICE_NEILI_EXP_TYPE_3_SP = 2683 -- B¾c §Èu D­ìng Sinh §Æc BiÖt  - lo¹i 3
TSK_PRATICE_NEILI_EXP_TYPE_4_SP = 2684 -- B¾c §Èu D­ìng Sinh §Æc BiÖt  - lo¹i 4

TSK_GOLDEN_CARD_CREATE_TIME = 2185
TSK_MASTER_SKILL = 2186

TSK_BUY_GOLDEN_CARD = 2435

-- Task sö dông T©n M·o §¹i Hång Bao
TSK_DAHONGBAO_201101 = 2429
TSK_DAHONGBAO_201101_TIME = 2428

-- Task promotion CSM 5.0
TSK_AWARD_CSM5 = 2670
TSK_AWARD_CSM5_ACTIVE_TIME = 2671
-- Task Quay sè may m¾n
TSK_LUCKY_DRAW = 2705

-- §æi qu©n c«ng huy hoµng b»ng TiÒn LÎ
--TASK_LIMIT_JUNGONG = 2276


--TSK_SELECT_TYPE = 2148 -- Check tõng bit xem ®· dù ®o¸n kÕt qu¶ nµo
--TSK_SILVER_WIN = 2149 -- Sè TiÒn LÎ tİch lòy ®­îc
--TSK_LIST_16_1 = 2161 -- List 16 ®éi 1
--TSK_LIST_16_2 = 2162 -- List 16 ®éi 2
--TSK_LIST_8_1 = 2163 -- List 8 ®éi 1
--TSK_LIST_8_2 = 2164 -- List 8 ®éi 1

-- Task ghi l¹i sè tiÒn ®· c­îc cho tõng lo¹i h×nh
--TSK_SILVER_BET_1 = 2165
--TSK_SILVER_BET_2 = 2166
--TSK_SILVER_BET_3 = 2167
--TSK_SILVER_BET_4 = 2168
--TSK_SILVER_BET_5 = 2169
--TSK_SILVER_BET_6 = 2170
--TSK_SILVER_BET_7 = 2171
--TSK_SILVER_BET_8 = 2172

-- Task ghi l¹i ®éi ®· chän
--TSK_BET_01 = 2173
--TSK_BET_02 = 2174
--TSK_BET_03 = 2175
--TSK_BET_04 = 2176
--TSK_BET_05 = 2177
--TSK_BET_06 = 2178
--TSK_BET_07 = 2179
--TSK_BET_08 = 2180
--TSK_BET_09 = 2181
--TSK_BET_10 = 2182
--TSK_BET_11 = 2183
--TSK_BET_12 = 2184
--TSK_BET_13 = 2185
--TSK_BET_14 = 2186
--TSK_BET_15 = 2187

--TSK_SILVER_2_EXP = 2188

-- Vinh danh t­íng sÜ
TSK_GLORY = 2277
BYTE_GLORY_DATE =1 -- Ngµy nhËn th­ëng
BYTE_GLORY_COUNT = 2 -- Sè lÇn nhËn th­ëng

-- Thµnh Chñ ®æi hång bao
--TSK_EXCHANGE_HONGBAO = 2278
--BYTE_EXCHANGE_HONGBAO_DATE = 1
--BYTE_EXCHANGE_HONGBAO_SMALL = 2
--BYTE_EXCHANGE_HONGBAO_BIG = 3

-- §æi §Şnh Hån t¹i D¹ Th¶o
--TSK_EXCHANGE_DING7 = 2430

-------------------------------
-- Sè lÇn sö dông bã hoa chiÕn th¾ng trong ho¹t ®éng karaoke
TSK_KARAOKE = 2665
-- Tasktemp l­u nType ng­êi b×nh ®­îc b×nh chän
-- Task Temp l­u lev cña item khi n©ng cÊp Tö quang Viªm §Õ
TSK_TEMP_TQVD = 202
--TSK_KARAOKETEMP =202 

--Sè lÇn sö dông b¸nh trung thu trong ho¹t ®éng  B×nh chän s¸ng t¸c truyÖn tranh
TSK_TRUYENTRANH = 2665

-- L­u tr¹ng th¸i kİch ho¹t HKLB cña ng­êi ch¬i
TSK_HKLB_FLAG =  2431
BYTE_HKLB_STATUS = 1
BYTE_HKLB_LEVELAWARD = 2

--  Task nhËn th­ëng hµng ngµy
TSK_HKLB_DAILYAWARD =  2434

--  Task nhËn th­ëng ngµy vµng
--TSK_HKLB_GOLDENDAYAWARD = 2538

--  Task ®æi item Cöa hµng Vâ L©m TiÒn Bèi
TSK_HKLB_POINT = 1534
--TSK_HKLB_EXCHANGE = 2539
--TSK_HKLB_REWARD = 2540

-- Task kİch ho¹t Vâ L©m ChiÕn H÷u
TSK_HKLB_VLCH = 2187

-- Task l­u sè lÇn më r­¬ng trong tÇn l¨ng
--TSK_HKLB_OPENPBOX = 2671

--- Task sè lÇn ®æi kem trong ngµy Even th¸ng 7 
TKS_KSOCOLA_TIMES = 2675
--  §¸nh dÊu reset ®iÓm qu©n c«ng khi chuyÓn Server
TSK_CHANGE_SERVER = 2676

-- Task ®Òn bï ngµy 30-9-2011
--TSK_DENBU_20110930 = 2700
-- TSK_BKL_BONUS = 2700
-- Task ®Òn bï ngµy 30-9-2011 lÇn 2
 --TSK_DENBU2_20110930 = 2701
TSK_TRAOGIAI_CS1_20120404 = 2701

-- Task trång hoa
TSK_TRONGHOA = 2704
-- Task l­u ngµy vµ sè lÇn ®æi mËt tŞch trong ngµy
--TSK_MATTICH_HIGHT = 2707
TSK_MATTICH_HIGHT_NEW = 2710
TSK_MATTICH_HIGHT_CHOOSE = 2708
TSK_XOAITEM = 2709

---------------------------------------------------------
-- L­u tr¹ng th¸i kİch ho¹t BKLB cña ng­êi ch¬i
TSK_BKLB_FLAG =  2714
BYTE_BKLB_BOX = 1
BYTE_BKLB_LEVELAWARD = 2

--  Task nhËn th­ëng hµng ngµy
TSK_BKLB_DAILYAWARD =  2715

--  Task nhËn th­ëng ngµy vµng
TSK_BKLB_GOLDENDAYAWARD = 2716

--  Task ®æi item Cöa hµng Vâ L©m TiÒn Bèi
TSK_BKLB_POINT = 2717
TSK_BKLB_EXCHANGE = 2718
TSK_BKLB_REWARD = 2719

-- Task kİch ho¹t Vâ L©m ChiÕn H÷u
TSK_BKLB_VLCH = 2721
-- Task kick ho¹t BKLB + task count
TSK_BKLB_ACTIVE = 2722
TSK_BKLB_COUNT = 2723
TSK_BKLB_START = 2724
--Task xoa trung task HKLB
--TSK_BKLB_HAVETASK = 2725
-- Task ®æi ®iÓm ch©n khİ h»ng ngµy
TSK_CHANGE_CHANKHI = 2726
-- Task ®¸nh dÊu ®· nép N÷ Oa khi lµm nhiÖm vô Th­¬ng Héi
TSK_CHECK_BAOHAP = 2735
--Task l­u gi¸ trŞ reset ngµy cña B×nh Thiªn H¹
TSK_RESET_DATE = 2736
--Task l­u gi¸ trŞ nhËn item cña B×nh Thiªn H¹
TSK_BTH_EXCHANGE = 2737
--Task l­u gi¸ trŞ nhËn th­ëng Tèng Liªu
TSK_TL_AWARD = 2741
TSK_TL_DATE = 2742
--Task reset mçi ngµy
TSK_EVERY_DATE = 2738
--Task l­u gi¸ trŞ kick ho¹t VIP cña Thá N­íng + Ph¸o Hoa
--TSK_LUCKY_DAOHUU_NEW_THANG4 = 2739		--TSK_ACTIVE_VIP_THONUONG = 2739
TSK_NHIEMVUTHANG4 = 2740		 --TSK_ACTIVE_VIP_PHAOHOA = 2740
TSK_COUNT_EVERYDAY = 2746
--Chuçi nhiÖm vô ChuyÓn Sinh §¬n
TSK_CSD_COUNT_A = 2753		--300 nv s­ m«n (x) - 30 lÇn th¸i h­ (y) - 81 tµi nguyªn chiÕn (z) - 30 lÇn L­¬ng S¬n (w)		- wwzzyyxxx
TSK_CSD_COUNT_B = 2749		--300 h¹t gièng (x) - 33 lÇn TrŞ An (y) - 33 lÇn Thñy l¬i (z)			- zzyyxxx
TSK_CSD_COUNT_C = 2750		--181 B¸t nh· nhá (x) - 99 b¸t nh· to (y) - 99 c©y tø linh (z)		- zzyyxxx
TSK_CSD_ALLOW = 2751
TSK_CSD = 2752	--®¸nh dÊu ®· nhËn item csd
--Chuçi nhiÖm vô M¶nh Thiªn Th¹ch
TSK_MTT_COUNT = 2754		--150 h¹t gièng (x) - 10 Cóng TÕ (y)	- 10 lÇn Thñy Lîi (z) - 1 nhËn nhiÖm vô (w)- 1 nhËn th­ëng (b)	- bwzzyyxxx
TSK_EVERY_WEEK = 2755	--2 sè cuèi l­u sè tuÇn
--Chuçi nhiÖm vô ChuyÓn Sinh 6
TSK_CS6_COUNTA = 2757	--30 Cóng tÕ (x) - 30 TrŞ An (y) - 150 B¸t nh· nhá (z) - 150 H¹t gièng (w)		- wwwzzzyyxx
TSK_CS6_COUNTB = 2758	--30 Thñy lîi (x) - 30 LuyÖn §¬n (y) - 150 Tø Linh (z) - 160 Ng«i Sao May M¾n (w)		- wwwzzzyyxx
TSK_CS6_COUNTC = 2759	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)		- zzyyxx
TSK_CS6_GET1TIME = 2685		--nhËn item 1 lÇn duy nhÊt sau khi chuyÓn sinh -- 3sè cuèi, 4 sè tiÕp ghi sè N÷ oa
TSK_CS6_TULINH = 2687		--nhËn vµ lµm tiÕp nhiÖm vô chuyÓn sinh 6
TSK_CS6_DaoQuy_XoaQuy = 2688	--AAAABBBB:  AAAA: sè l­îng TiÓu Lam §ao Quû; BBBB: sè l­îng TiÓu Lam Xoa Quû
TSK_CS6_SaMac_TamBao = 2692	-- AAAABBBB: AAAA: sè l­îng Sa M¹c Hµnh Nh©n; BBBB: sè l­îng TÇm B¶o Nh©n
TSK_CS6_KiemTien_DichTien = 2690	-- AAAABBBB: AAAA: sè l­îng KiÕm Tiªn Tö; BBBB: sè l­îng §Şch Tiªn Tö
TSK_CS6_LiLong_HoaHo = 2691	-- AAAABBBB: AAAA: sè l­îng LiÖt Nhan Li Long; BBBB: sè l­îng Xİch LuyÖn Háa Hå
---------------------------------------------------------
-- L­u tr¹ng th¸i ®iÓm may m¾n cña ng­êi ch¬i
TSK_EVENT_PHU_MOI_THANG =  2698
TSK_LUCKY_DAOHUU_NEW_THANG4 = 2739	
BYTE_POINT_LUCKY = 1
BYTE_ACCEPT_LUCKY = 2
BYTE_TIME_VM =3
-----------------------------------------------------------
TSK_PET_PS_GIAIDOAN_A = 2538	--xxxFFFcddg: x = 160 c©y tø linh, F = 160 c©y b¸t nh· nhá, c = h­íng Phôc Sinh, dd = sè lÇn phôc sinh, g = .....
TSK_PET_PS_GIAIDOAN_B = 2539	--aabbccddeg: g = (1,2,3) chuçi nhiÖm vô), e = x¸c ®Şnh cã PET Phôc Sinh, dd = 30 lÇn Cóng TÕ, cc = 30 lÇn TrŞ An, bb = 30 lÇn Thñy Lîi, aa = 3 lÇn luyÖn ®¬n
---------------------------------------------------------
EXT_POINT_CLTV = 5	--Chİ T«n V­¬ng LÖnh
TSK_CTVL_START = 2664  --khai b¸o Task
TSK_CTVL_ALL = 2665		--khai b¸o task: 0987654321: 1:kİch ho¹t CTVL;	2: ®· x©y dùng bang trong tuÇn	3: ®· nhËn th­ëng BHCT trong tuÇn		4: nhËn th­ëng tæ ®éi trong ngµy		65: check lev nhËn th­ëng PS0 	7: nhËn trang bŞ HN	8: kich ho¹t Bang héi Chİ T«n		9: nhËn th­ëng PS1 90	0: nhËn th­ëng PS2 75
--TSK_CTVL_COUNT = 2666	--0987654321: 		321: bé ®Õm b­íc nhiÖm vô	4: tr¹ng th¸i hoµn thµnh nhiÖm vô		65: l­u ID nhiÖm vô mçi ngµy ®ang thùc hiÖn	7: sè lÇn hoµn thµnh nhiÖm vô trong ngµy		8: tr¹ng th¸i nhËn thö th¸ch		9: nhËn th­ëng mçi ngµy cña old server
--------------------
--TSK_DUNGCHUNG = 2733
TSK_CUOCCHIENHOAHONG = 2733	--Task cuéc chiÕn hoa hång (08/10/2014-12/10/2014)
TSK_DUATOPSERVERCANHAN = 2733 --Task §ua top bang héi liªn server (Byte 1)(21/10/2014 - 19/11/2014)
TSK_DENBU_HOAPHUNG = 2733	-- Task ®Òn bï server Háa Phông (byte 3 vµ 4) (24/10/2014 - 5/12/2014)
TSK_NHIEMVUCDKEY = 2540 --Task nhËn th­ëng mçi ngµy nhiÖm vô PVP CD KEY (Byte 1)
TSK_DUDOAN_BHTA12 = 2540 -- Task dù ®o¸n BHTA12 (05/11/2014 - 08/11/2014) (Byte 2, 3)
-------------------
--TSK_NOEL_DIEUDUONG = 2725	--event Noel ®æi diÖu d­¬ng
------------------
--TSK_GIAPNGO_1 = 2725	--event ®µo r­¬ng gi¸p ngä: H: nhËn th­ëng kİch ho¹t CDPB, gggg: sè lÇn kİch ho¹t ChiÕu D¹ Ph¸p B¶o, Y: nhËn th­ëng kİch ho¹t TABB, xxxx: sè lÇn kİch ho¹t TuyÖt Anh Bİ B¶o
TSK_GIAPNGO_2 = 2666	-- E: nhËn th­ëng cuèi khi ®· nhËn th­ëng 3 lo¹i trªn; H: nhËn th­ëng kİch ho¹t XTCV, gggg: sè lÇn kİch ho¹t xich Thè Cæ VËt
--===========Th¨ng TiÕn Phôc Sinh ======
TSK_THANGTIEN_PHUCSINH = 2725	--0987654321: 1:nhËn nv-hoµn thµnh nv; 32:tæng ®iÓm tİch lòy; 54:®iÓm ®æi trong ngµy; 6:sè lÇn tham gia Th¸i H­; 7: sè lÇn tham gia thá n­íng; 8: sè lÇn tham gia Tèng Liªu; 9: x¸c ®Şnh reset qua ngµy
--=========== Tİch lòy online ==========
IP_ONLINE_TIME = 2536
IP_TIME_START = 2537

--=================================
--========= TAI XUAT GIANG HO =======
if nDate >= 140221 and nDate <= 140320 then
	TSK_TAIXUAT_FLAG = 2162
	TSK_TAIXUAT_MISSION1 = 2163
	TSK_TAIXUAT_MISSION2 = 2666
else
	TSK_TAIXUAT_FLAG = 2665
	TSK_TAIXUAT_MISSION1 = 2665
	TSK_TAIXUAT_MISSION2 = 2665
end
--================ 123 Pay ==========
TSK_123PAY1 = 2664
TSK_123PAY2 = 2675
--================= NhiÖm vô ®æi trang bŞ Thiªn Chi - B¹ch Kim Viªm §Õ ==============
TSK_TC_BK_VD = 2707		--0987654321: 1-nhËn nv vd2tcvd; 2-nhËn nv tcvd2bkvd
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
--================= nhiÖm vô VBonus 7/2014
TSK_nvVBonus = 2430		--==> dïng cho nhiÖm vô VBonus 7/2014
-- funtion reset task t¹i playerloginin.lua
TT_DENBU = 3000 -- Test den bu
Get_YaoYang_10 = 3001 -- NhËn Trang BŞ Dieu D­¬ng
Process_SanJianTao = 3002 -- NhËn Trang BŞ Kim Xµ 6
Get_Book_ZhenJuan=3003 -- NhËn Ch©n QuyÓn
Get_Book_JueYao = 3004 --NhËn QuyÕt YÕu
GiftCodeNhap = 3005 -- NhËn code
an_reborn = 3006   -- NhËn Ên kı chuyÓn sinh
get_vosongchienthan15 = 3007 --NhËn Set V« Song ChiÕn ThÇn
Get_vocucminhtinh = 3008 -- NhËn v« cùc minh tinh 
player_reborn = 3009
MoCayBatNhaLon = 3010 -- Task më c©y b¸t nh· lín
function ResetTask()	
	local tTask ={}
	if tonumber(date("%y%m%d%H")) >= 10070200 then
		if GetTask(2437) <= 11 then
			tTask = {
							2428,2429,2430,2431,2436,2538,2539,2540,2542,2545,1533,1534,1535,1536,1541,1542,
							2157,2158,2159,2160,2276,2279,
						}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,13)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10071400 then
		if GetTask(2437) == 13 then
			tTask = {2164,2165}	
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,14)
		end
	end
	if tonumber(date("%y%m%d%H")) >= 10080100 then
		if GetTask(2437) == 14 then
			tTask = {2166,2167}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,15)
		end
	end
	if tonumber(date("%y%m%d%H")) >= 10080500 then
		if GetTask(2437) == 15 then
			tTask = {2493,2494}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,16)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10080600 then
		if GetTask(2437) == 16 then
			tTask = {2168,2169}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,17)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10081500 then
		if GetTask(2437) == 17 then
			tTask = {2495,2496, 2595, 2596}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,18)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10082700 then
		if GetTask(2437) <= 19 then
			tTask = {2170,2171,2186,2187}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,20)
		end
	end
--	Reset ®iÓm trång c©y	
	if tonumber(date("%y%m%d%H")) >= 10090600 then
		tTask = {2255,2275}
		if GetTask(2437) <= 20 then
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,21)
		end
	end

--	Reset task idol sö dông cho STD
	if tonumber(date("%y%m%d%H")) >= 10090900 then
	if GetTask(2437) <= 21 then
			tTask = {1533}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,22)
		end
	end	
	
	if tonumber(date("%y%m%d%H")) >= 10091700 then		
		if GetTask(2437) <= 22 then
			tTask = {2434}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,23)
		end
	end
--	Reset task tÆng b¸nh
	if tonumber(date("%y%m%d%H")) >= 10092200 then		
		if GetTask(2437) <= 23 then
			tTask = {2430}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,24)
		end
	end
-- Reset task mua code HKLB
	if tonumber(date("%y%m%d%H")) >= 10092800 then		
		if GetTask(2437) <= 24 then
			tTask = {2435}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,25)
		end
	end	
-- Reset task ¨n B¸nh N­íng Vu«ng (event T10/2010)
	if tonumber(date("%y%m%d%H")) >= 10100900 then		
		if GetTask(2437) <= 25 then
			tTask = {2607}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,26)
		end
	end	
	-- Reset pet level 2
	if tonumber(date("%y%m%d%H")) >= 10100900 then		
		if GetTask(2437) <= 26 then
			tTask = {1535,1536,1541,1542}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,27)
		end
	end
	-- Reset cuéc chiÕn hoa hång tuÇn 1
	if tonumber(date("%y%m%d%H")) >= 10101500 then		
		if GetTask(2437) <= 27 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,28)
		end
	end	
	-- Reset task chØnh qu©n c«ng Huy ¦ng
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 28 then
			tTask = {2158}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,29)
		end
	end	
	-- Reset cuéc chiÕn hoa hång tuÇn 2 
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 29 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,30)
		end
	end	
	-- Thêi gian t¹o acc HKLB
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 30 then
			tTask = {2185}
			for k,v in tTask do
				SetTask(v,0)				
			end	
			if GetExtPoint(0) >= 1 then
				if GetCreateTime() < 1287968400 then
					SetTask(2185,GetCreateTime())
				end
			end
			SetTask(2437,31)
		end
	end	
	-- Reset task sö dông cho BHTA4
	if tonumber(date("%y%m%d%H")) >= 10102500 then		
		if GetTask(2437) <= 31 then
			tTask = {2538,2428,2429}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,32)
		end
	end
	-- Reset cuéc chiÕn hoa hång tuÇn 3
	if tonumber(date("%y%m%d%H")) >= 10102900 then		
		if GetTask(2437) <= 32 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,33)
		end
	end	
	-- Thêi gian t¹o acc HKLB
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 33 then
			tTask = {2185}
			for k,v in tTask do
				SetTask(v,0)				
			end	
			if GetExtPoint(0) >= 1 then
				if GetCreateTime() < 12880710000 then
					SetTask(2185,GetCreateTime())
				end
			end
			SetTask(2437,34)
		end
	end
	-- Task sö dông Ng«i Sao May M¾n
	if tonumber(date("%y%m%d%H")) >= 10110900 then		
		if GetTask(2437) <= 34 then
			tTask = {2160, 2172}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,35)
		end
	end
	-- Reset task chuyÓn sinh 3  
	if tonumber(date("%y%m%d%H")) >= 10102900 then		
		if GetTask(2437) <= 35 then
			tTask = {2279}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,36)
		end
	end
	
	-- Reset task BHTA4 ®Ó sö dông cho Vâ L©m B¶o H¹p, lÊy task 2539 dïng cho quay sè mõng sn VL2
	if tonumber(date("%y%m%d%H")) >= 10112900 then		
		if GetTask(2437) <= 36 then
			tTask = {2538, 2539}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,37)
		end
	end
	
	-- Reset task sö dông Niªn Thó con
	if tonumber(date("%y%m%d%H")) >= 10113000 then		
		if GetTask(2437) <= 37 then
			tTask = {2175, 2176}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,38)
		end
	end
	
	-- Reset task sö dông cho B¹n §ång Hµnh v­ît Th¸i H­
	if tonumber(date("%y%m%d%H")) >= 10113000 then		
		if GetTask(2437) <= 38 then
			tTask = {2173, 2174, 2177}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,39)
		end
	end
	
	-- Reset task sö dông cho reset qu©n c«ng
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 39 then
			tTask = {2184}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,40)
		end
	end
	
	-- Reset task sö dông cho nhËn th­ëng C©y Tø Linh
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 40 then
			tTask = {2182, 2183}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,41)
		end
	end
	
	-- Reset task sö dông cho tİnh n¨ng Tr¸i C©y
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 41 then
			tTask = {2184, 2177, 2178, 2179, 2180, 2181}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,42)
		end
	end
	-- Reset task sö dông cho nép Cñi Kh«
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 42 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,43)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011300 then		
		if GetTask(2437) <= 43 then
			tTask = {2428, 2429, 2430, 2158}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,44)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011300 then		
		if GetTask(2437) <= 44 then
			tTask = {2660}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,45)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011500 then		
		if GetTask(2437) <= 45 then
			tTask = {2661}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,46)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11012000 then		
		if GetTask(2437) <= 46 then
			tTask = {2662, 2663, 2664}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,47)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11031700 then		
		if GetTask(2437) <= 47 then
			tTask = {2665, 2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,48)
		end
	end
	
	-- reset task nhËn th­ëng hoa hång BHTA5 tuÇn 1
	if tonumber(date("%y%m%d%H")) >= 11032700 then		
		if GetTask(2437) <= 48 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,49)
		end
	end
	
	-- reset task nhËn th­ëng hoa hång BHTA5 tuÇn  2
	if tonumber(date("%y%m%d%H")) >= 11040400 then		
		if GetTask(2437) <= 49 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,50)
		end
	end

	-- reset task nhËn th­ëng hoa hång BHTA5 tuÇn  3
	if tonumber(date("%y%m%d%H")) >= 11041100 then		
		if GetTask(2437) <= 50 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,51)
		end
	end
	
	-- reset task sö dông nhËn th­ëng BHTA5
	if tonumber(date("%y%m%d%H")) >= 11041400 then		
		if GetTask(2437) <= 51 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,52)
		end
	end
	
	-- reset task sö dông nhËn th­ëng BHTA5
	if tonumber(date("%y%m%d%H")) >= 11041500 then		
		if GetTask(2437) <= 52 then
			tTask = {2669, 2670}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,53)
		end
	end
	
	-- Reset task sö dông cho ChuyÓn Sinh 4
	if tonumber(date("%y%m%d%H")) >= 11041800 then		
		if GetTask(2437) <= 53 then
			tTask = {2542}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,54)
		end
	end

	--Reset Task Karaoke
	if tonumber(date("%y%m%d%H")) >= 11052200 then		
		if GetTask(2437) <= 54 then
			tTask = {2665}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,55)
		end
	end
	
	-- Reset Task sö dông cho HKLB v3
	if tonumber(date("%y%m%d%H")) >= 11053000 then		
		if GetTask(2437) <= 55 then
			tTask = {2538, 2434, 2431, 1534, 2539, 2540, 2187}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,56)
		end
	end	
	
	-- Reset Task sö dông cho sell HKLB v3 in-game
	if tonumber(date("%y%m%d%H")) >= 11053000 then		
		if GetTask(2437) <= 56 then
			tTask = {2435}
			for k,v in tTask do
				SetTask(v,0)
			end
			-- Reset chç l­u string HKLB
			CustomDataSave("code_hklb","s","")
			SetTask(2437,57)
		end
	end
	
	-- Reset Task sö dông cho CSM5.0
	if tonumber(date("%y%m%d%H")) >= 11062800 then		
		if GetTask(2437) <= 57 then
			tTask = {2670, 2671}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,58)
		end
	end
	
	-- Reset task qu©n c«ng new server
	if tonumber(date("%y%m%d%H")) >= 11070100 then		
		if GetTask(2437) <= 58 then
			tTask = {2158}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,59)
		end
	end
	
	-- Task nép Socola thang 7/2011
	if tonumber(date("%y%m%d%H")) >= 11072200 then		
		if GetTask(2437) <= 60 then
			tTask = {2675}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,61)
		end
	end
	
	-- Sö dông l­u server hiÖn hµnh ®Ó ®¸nh dÊu chuyÓn server - Quang ¦ng
	if tonumber(date("%y%m%d%H")) >= 11072200 then
		if GetTask(2437) <= 61 then
			tTask = {2676}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,62)
		end
	end
	
	-- Sö dông l­u server hiÖn hµnh ®Ó ®¸nh dÊu chuyÓn server - Duy Long
	if tonumber(date("%y%m%d%H")) >= 11080500 then
		if GetTask(2437) <= 62 then
			tTask = {2676}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,63)
		end
	end
	
	-- Task Ph¸o Hoa
	if tonumber(date("%y%m%d%H")) >= 11082000 then
		if GetTask(2437) <= 63 then
			tTask = {2429,2428}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,64)
		end
	end
	--Reset Task Vâ L©m B¶o h¹p
	if tonumber(date("%y%m%d%H")) >= 11090600 then
		if GetTask(2437) <= 64 then
			tTask = {2672,2673,2674}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,65)
		end
	end
	-- Reset task B×nh chän s¸ng t¸c truyÖn tranh
	if tonumber(date("%y%m%d%H")) >= 11090600 then
		if GetTask(2437) <= 65 then
			tTask = {2665}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,66)
		end
	end
	-- Reset VLTB cöa hµng
	if tonumber(date("%y%m%d%H")) >= 11091200 then
		if GetTask(2437) <= 66 then
			tTask = {2539}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,67)
		end
	end
	
	--Reset Task Cuéc chiÕn hoa hång
	if tonumber(date("%y%m%d%H")) >= 11093000 then
		if GetTask(2437) <= 67 then
			tTask = {2665,2666,2667,2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,68)
		end
	end
	
	---- Reset task nhËn th­ëng BHTA6 tuÇn
	if tonumber(date("%y%m%d%H")) >= 11101200 then
		if GetTask(2437) <= 68 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,69)
		end
	end
	
	---- Reset task nhËn th­ëng BHTA6 tuÇn 2, reset ®Òn bï Qu©n c«ng 30-9-2011
	if tonumber(date("%y%m%d%H")) >= 11101900 then
		if GetTask(2437) <= 69 then
			tTask = {2667, 2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,70)
		end
	end	
	
	---- Reset task ®Òn bï Qu©n c«ng 30-9-2011 lÇn 2
	if tonumber(date("%y%m%d%H")) >= 11102000 then
		if GetTask(2437) <= 70 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,71)
		end
	end	
	
	---- Reset nhËn th­ëng BHTA6 tuÇn 2,, ®¨ng kı thi ®Êu
	if tonumber(date("%y%m%d%H")) >= 11102700 then
		if GetTask(2437) <= 71 then
			tTask = {2667, 2668, 2702, 2703}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,72)
		end
	end
	
	---- Reset task quay sè may m¾n
	if tonumber(date("%y%m%d%H")) >= 11103000 then
		if GetTask(2437) <= 72 then
			tTask = {2705, 2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,73)
		end
	end
	
	---- Reset task trång hoa nhËn bonus tæ ®éi
	if tonumber(date("%y%m%d%H")) >= 11110900 then
		if GetTask(2437) <= 73 then
			tTask = {2704, 2677, 2678}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,74)
		end
	end
	
	---- Reset task ®Òn bï c«ng tr¹ng
	if tonumber(date("%y%m%d%H")) >= 11111900 then
		if GetTask(2437) <= 74 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,75)
		end
	end
	
	---- Reset task update
	if tonumber(date("%y%m%d%H")) >= 11120200 then
		if GetTask(2437) <= 75 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,76)
		end
	end
	-- Reset ngµy , Sè lÇn ®i Th¸i H­
	if tonumber(date("%y%m%d%H")) >= 11120200 then
		if GetTask(2437) <= 76 then
			tTask = {2706}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,77)
		end
	end
	
	-- Reset task sö dông cho TruyÒn C«ng & D­ìng Sinh §Æc BiÖt
	if tonumber(date("%y%m%d%H")) >= 11122900 then
		if GetTask(2437) <= 77 then
			tTask = {2679, 2680, 2681, 2682, 2683, 2684}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,78)
		end
	end
	
	--- Reset ®iÓm tİch lòy  B¸t Nh· Chøng Th­
	if tonumber(date("%y%m%d%H")) >= 12010600 then
		if GetTask(2437) <= 78 then
			tTask = {2255,2275}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,79)
		end
	end
	
	-- Reset Task nhËn th­ëng server Thµnh Long
	
	if tonumber(date("%y%m%d%H")) >= 12020200 then
		if GetTask(2437) <= 79 then
			tTask = {2276}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,80)
		end
	end
	-- Reset Quay sè Ingame
	if tonumber(date("%y%m%d%H")) >= 12020600 then
		if GetTask(2437) <= 80 then
			tTask = {2705}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,81)
		end
	end
	-- Reset Sè lÇn nhËn mËt tŞch trong ngµy
	if tonumber(date("%y%m%d%H")) >= 12021600 then
		if GetTask(2437) <= 82 then
			tTask = {2707}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,83)
		end
	end
	-- Reset Sè lÇn nhËn mËt tŞch tù chän trong ngµy
	if tonumber(date("%y%m%d%H")) >= 12022000 then
		if GetTask(2437) <= 83 then
			tTask = {2708,2709}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,84)
		end
	end
	-- Reset task ®Òn bï qu©n c«ng ngµy 01/03/2012
	if tonumber(date("%y%m%d%H")) >= 12030100 then
		if GetTask(2437) <= 84 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,85)
		end
	end
	-- Reset task ®æi mËt tŞch
	if tonumber(date("%y%m%d%H")) >= 12030100 then
		if GetTask(2437) <= 85 then
			tTask = {2710}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,86)
		end
	end
		-- Reset nhËn thuèc trong tµi nguyªn chiÕn
	if tonumber(date("%y%m%d%H")) >= 12030400 then
		if GetTask(2437) <= 86 then
			tTask = {2662, 2663}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,87)
		end
	end
		-- Reset nhËn thuèc trong tµi nguyªn chiÕn
	if tonumber(date("%y%m%d%H")) >= 12030800 then
		if GetTask(2437) <= 87 then
			tTask = {2711,2712}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,88)
		end
	end	
	-- Reset task cho tham gia chien truong
	if tonumber(date("%y%m%d%H")) >= 12030800 then
		if GetTask(2437) <= 88 then
			tTask = {2711,2712}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,89)
		end
	end	
	-- Reset task B¹ch Kim lÖnh
	if tonumber(date("%y%m%d%H")) >= 12032100 then
		if GetTask(2437) <= 89 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721, 2722, 2723, 2724, 2665, 2666, 2667, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,90)
		end
	end
	-- Reset task trao gi¶i CS1 cña server Thµnh Long
	if tonumber(date("%y%m%d%H")) >= 12040400 then
		if GetTask(2437) <= 90 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,91)
		end
	end
	-- Reset task BONUS B¹ch kim lÖnh
	if tonumber(date("%y%m%d%H")) >= 12040700 then
		if GetTask(2437) <= 91 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,92)
		end
	end
	-- Reset task nhËn Thanh Phong Bao
	if tonumber(date("%y%m%d%H")) >= 12040900 then
		if GetTask(2437) <= 92 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,93)
		end
	end
	-- Reset task ®æi ®iÓm ch©n khİ h»ng ngµy
	if tonumber(date("%y%m%d%H")) >= 12041600 then
		if GetTask(2437) <= 93 then
			tTask = {2726}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,94)
		end
	end
	-- Reset task ®æi ®iÓm ch©n khİ h»ng ngµy
	if tonumber(date("%y%m%d%H")) >= 12060500 then
		if GetTask(2437) <= 94 then
			tTask = {2741, 2742}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,95)
		end
	end	
	-- Reset task kick hoat VIP Thá n­íng, Ph¸o hoa
	if tonumber(date("%y%m%d%H")) >= 12060600 then
		if GetTask(2437) <= 95 then
			tTask = {2738, 2739, 2740}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,96)
		end
	end	
	
	-- Reset task Trai cay 3 mien
	if tonumber(date("%y%m%d%H")) >= 12061500 then
		if GetTask(2437) <= 96 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,97)
		end
	end	
	
	-- Reset task VLBH ver 3 + më réng event
	if tonumber(date("%y%m%d%H")) >= 12061900 then
		if GetTask(2437) <= 97 then
			tTask = {2674, 2672, 2673, 2729, 2730, 2732, 2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,98)
		end
	end	
	-- Reset task®æi ®iÓm ch©n khİ ë B¾c ®Èu l·o nh©n
	if tonumber(date("%y%m%d%H")) >= 12062700 then
		if GetTask(2437) <= 98 then
			tTask = {2728}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,99)
		end
	end	
	-- Thay ®æi task VLBH míi
	if tonumber(date("%y%m%d%H")) >= 12070500 then
		if GetTask(2437) <= 99 then
			tTask = {2744, 2745}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,100)
		end
	end		
	-- Reset task nhan th­ëng ch©n khİ VLBH
	if tonumber(date("%y%m%d%H")) >= 12071700 then
		if GetTask(2437) <= 100 then
			tTask = {2729}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,101)
		end
	end			
	-- Reset task nhËn th­ëng ch©n khİ, Exp, VLBH
	if tonumber(date("%y%m%d%H")) >= 12072500 then
		if GetTask(2437) <= 101 then
			tTask = {2744, 2745, 2729}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,102)
		end
	end	
	-- Reset task më réng event th¸ng 7 vµ trao gi¶i
	if tonumber(date("%y%m%d%H")) >= 12072700 then
		if GetTask(2437) <= 102 then
			tTask = {2743, 2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,103)
		end
	end	
	-- Reset task nhËn th­ëng mçi ngµy ? bao nhiªu c¸i / lÇn
	if tonumber(date("%y%m%d%H")) >= 12073100 then
		if GetTask(2437) <= 103 then
			tTask = {2746}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,104)
		end
	end	
	-- Reset task dïng ®¨ng kı thi ®Êu Long Hæ Tranh Hïng
	if tonumber(date("%y%m%d%H")) >= 12081000 then
		if GetTask(2437) <= 104 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,105)
		end
	end	
	-- Reset task ®Òn bï 800k c«ng tr¹ng
	if tonumber(date("%y%m%d%H")) >= 12081000 then
		if GetTask(2437) <= 105 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,106)
		end
	end	
		-- Reset task quay sè may m¾n
	if tonumber(date("%y%m%d%H")) >= 12082300 then
		if GetTask(2437) <= 106 then
			tTask = {2705}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,107)
		end
	end	
	-- Reset task nhËn th­ëng LHTH
	if tonumber(date("%y%m%d%H")) >= 12091900 then
		if GetTask(2437) <= 107 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,108)
		end
	end	
	-- Reset task chuçi nhiÖm vô ChuyÓn sinh ®¬n
	if tonumber(date("%y%m%d%H")) >= 12092000 then
		if GetTask(2437) <= 108 then
			tTask = {2753, 2749, 2750, 2751, 2752}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,109)
		end
	end	
	-- Reset task ®æi th­ëng LHTH
	if tonumber(date("%y%m%d%H")) >= 12091900 then
		if GetTask(2437) <= 109 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,110)
		end
	end	
	-- Reset task chuçi nhiÖm vô M¶nh Thiªn Th¹ch
	if tonumber(date("%y%m%d%H")) >= 12100900 then
		if GetTask(2437) <= 110 then
			tTask = {2754, 2755}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,111)
		end
	end	
	-- Reset task Event thang 10
	if tonumber(date("%y%m%d%H")) >= 12101800 then
		if GetTask(2437) <= 111 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,112)
		end
	end	
	-- Reset Task BHTA8 ®ît 1
	if tonumber(date("%y%m%d%H")) >= 12102600 then
		if GetTask(2437) <= 112 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,113)
		end
	end
	-- Reset Task BHTA8 ®ît 2
	if tonumber(date("%y%m%d%H")) >= 12102900 then
		if GetTask(2437) <= 113 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,114)
		end
	end
	-- Reset Task Chuyen sinh 6
	if tonumber(date("%y%m%d%H")) >= 12110900 then
		if GetTask(2437) <= 114 then
			tTask = {2757, 2758, 2759, 2685, 2687}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,115)
		end
	end
		-- Reset Task Chuyen sinh 6 lan 2
	if tonumber(date("%y%m%d%H")) >= 12111600 then
		if GetTask(2437) <= 115 then
			tTask = {2688, 2690, 2691, 2692}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,116)
		end
	end
		-- Reset Task nhËn th­ëng max event mèc 10k th¸ng 11
	if tonumber(date("%y%m%d%H")) >= 12112800 then
		if GetTask(2437) <= 116 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,117)
		end
	end		
		-- Reset Task B¹ch Kim LÖnh version 2
	if tonumber(date("%y%m%d%H")) >= 12113000 then
		if GetTask(2437) <= 117 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,118)
		end
	end
	-- Reset Task VBonus version 2
	if tonumber(date("%y%m%d%H")) >= 12120500 then
		if GetTask(2437) <= 118 then
			tTask = {2255, 2275, 2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,119)
		end
	end
	-- Reset TaskVËn may ®¹o h÷u
	if tonumber(date("%y%m%d%H")) >= 12120600 then
		if GetTask(2437) <= 119 then
			tTask = {2698}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,120)
		end
	end	
	-- Reset Task ®æi th­ëng VLTB
	if tonumber(date("%y%m%d%H")) >= 12121300 then
		if GetTask(2437) <= 120 then
			tTask = {2718}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,121)
		end
	end	
		-- Reset Task nhËn th­ëng max event mèc 5k th¸ng 12
	if tonumber(date("%y%m%d%H")) >= 12123100 then
		if GetTask(2437) <= 121 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,122)
		end
	end		
	-- Reset Task nhËn th­ëng max event mèc 6k, 10k th¸ng 1
	if tonumber(date("%y%m%d%H")) >= 13013100 then
		if GetTask(2437) <= 122 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,123)
		end
	end	
	-- Reset Task nhËn th­ëng max event mèc 4k, 6k, 10k th¸ng 3
	if tonumber(date("%y%m%d%H")) >= 13031500 then
		if GetTask(2437) <= 123 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,124)
		end
	end		
	-- Reset Task nhËn chuyÓn sinh miÔn phİ sang phông tö, ­ng tö
	if tonumber(date("%y%m%d%H")) >= 13031500 then
		if GetTask(2437) <= 124 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,125)
		end
	end		
	-- Reset Task nhËn chuyÓn sinh miÔn phİ sang phông tö, ­ng tö lÇn 2
	if tonumber(date("%y%m%d%H")) >= 13031900 then
		if GetTask(2437) <= 125 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,126)
		end
	end			
	-- Reset Task nhËn chuyÓn sinh miÔn phİ sang phông tö, ­ng tö lÇn 3
	if tonumber(date("%y%m%d%H")) >= 13040200 then
		if GetTask(2437) <= 126 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,127)
		end
	end		
	-- Reset Task nhËn nhiÖm vô thang 4
	if tonumber(date("%y%m%d%H")) >= 13040900 then
		if GetTask(2437) <= 127 then
			tTask = {2740, 2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,128)
		end
	end		
	-- Reset Task di hoa tiep ngoc
	if tonumber(date("%y%m%d%H")) >= 13041000 then
		if GetTask(2437) <= 128 then
			tTask = {2164, 2165}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,129)
		end
	end	
	-- Reset Task ®¨ng kı BHTA9
	if tonumber(date("%y%m%d%H")) >= 13041100 then
		if GetTask(2437) <= 129 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,130)
		end
	end		
	-- Reset Task ®æi nguyªn liÖu th¸ng 4
	if tonumber(date("%y%m%d%H")) >= 13041600 then
		if GetTask(2437) <= 130 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,131)
		end
	end						
-- Reset Task nhËn th­ëng max event th¸ng 4 n¨m 2013
	if tonumber(date("%y%m%d%H")) >= 13041800 then
		if GetTask(2437) <= 131 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,132)
		end
	end			
-- Reset Task cho BHTA9
	if tonumber(date("%y%m%d%H")) >= 13042600 then
		if GetTask(2437) <= 132 then
			tTask = {2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,133)
		end
	end
-- Reset Task event ñng hé biÓn ®¶o, task nhËn Thanh Phong Bao BHTA lÇn 9
	if tonumber(date("%y%m%d%H")) >= 13042700 then
		if GetTask(2437) <= 133 then
			tTask = {2698, 2703}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,134)
		end
	end
-- Reset Task ®æi nguyªn liÖu th¸ng 5
	if tonumber(date("%y%m%d%H")) >= 13051200 then
		if GetTask(2437) <= 134 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,135)
		end
	end	
-- Reset Task thay ®æi h­íng chuyÓn sinh miÔn phİ
	if tonumber(date("%y%m%d%H")) >= 13051200 then
		if GetTask(2437) <= 135 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,136)
		end
	end		
-- Reset Task thu mua qu©n dông, më réng event th¸ng 5
	if tonumber(date("%y%m%d%H")) >= 13052800 then
		if GetTask(2437) <= 136 then
			tTask = {2187}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,137)
		end
	end		
-- Reset Task VBonus
	if tonumber(date("%y%m%d%H")) >= 13052800 then
		if GetTask(2437) <= 137 then
			tTask = {2282}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,138)
		end
	end		
-- Reset Task më réng event th¸ng 5
	if tonumber(date("%y%m%d%H")) >= 13062700 then
		if GetTask(2437) <= 138 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,139)
		end
	end	
-- Reset Task Long Tranh Hæ §Êu
	if tonumber(date("%y%m%d%H")) >= 13070300 then
		if GetTask(2437) <= 139 then
			tTask = {2283}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,140)
		end
	end	
-- Reset Task nhËn hç trî qu©n c«ng, update x2,x3 khi thu thËp tµi nguyªn chiÕn
	if tonumber(date("%y%m%d%H")) >= 13070400 then
		if GetTask(2437) <= 140 then
			tTask = {2284,2285}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,141)
		end
	end		
-- Reset Task nhiÖm vô §ång Hµnh
	if tonumber(date("%y%m%d%H")) >= 13071800 then
		if GetTask(2437) <= 141 then
			tTask = {2283,2189}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,142)
		end
	end	
-- Reset Task sö dông thªm n÷ oa b¶o h¹p
	if tonumber(date("%y%m%d%H")) >= 13072600 then
		if GetTask(2437) <= 142 then
			tTask = {2156}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,143)
		end
	end		
-- Reset Task sö dông c¸c lo¹i c©y trång
	if tonumber(date("%y%m%d%H")) >= 13072700 then
		if GetTask(2437) <= 143 then
			tTask = {2651, 429, 2059}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,144)
		end
	end	
-- Reset Task më réng event
	if tonumber(date("%y%m%d%H")) >= 13080100 then
		if GetTask(2437) <= 144 then
			tTask = {2731, 2713}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,145)
		end
	end
-- Reset task Sinh tö v« ng·
	if tonumber(date("%y%m%d%H")) >= 13080800 then
		if GetTask(2437) <= 145 then
			tTask = {2700, 2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,146)
		end
	end
	-- Reset task Phôc Sinh PET
	if tonumber(date("%y%m%d%H")) >= 13090200 then
		if GetTask(2437) <= 146 then
			tTask = {2538, 2539}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,147)
		end
	end
	-- Reset task më réng event th¸ng 8
	if tonumber(date("%y%m%d%H")) >= 13091000 then
		if GetTask(2437) <= 147 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,148)
		end
	end	
	-- Reset task 2731 (th­êng dïng më réng event) dïng cho nhËn thá miÕn phİ tõ 18/9 - 20/9
	if tonumber(date("%y%m%d%H")) >= 13091700 then
		if GetTask(2437) <= 148 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,149)
		end
	end	
	-- Reset task event ®ua top Kim Xµ, task 2668 BHTA
	if tonumber(date("%y%m%d%H")) >= 13092400 then
		if GetTask(2437) <= 149 then
			tTask = {2540, 2545, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,150)
		end
	end		
	-- Reset task 2731 ®Ó sö dông më réng event
	if tonumber(date("%y%m%d%H")) >= 13092400 then
		if GetTask(2437) <= 150 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,151)
		end
	end
	-- Reset task ®ua top kim xµ liªn server
	if tonumber(date("%y%m%d%H")) >= 13101000 then
		if GetTask(2437) <= 151 then
			tTask = {2660,2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,152)
		end
	end
-- Reset task Chİ T«n V­¬ng LÖnh, Phuc Sinh 2
	if tonumber(date("%y%m%d%H")) >= 13101800 then
		if GetTask(2437) <= 152 then
			tTask = {2664,2665, 2666, 2667,2668,2669,2175,2176}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,153)
		end
	end	
-- Reset task NhËn th­ëng ®ua top kim xµ liªn server
	if tonumber(date("%y%m%d%H")) >= 13101800 then
		if GetTask(2437) <= 153 then
			tTask = {2660}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,154)
		end
	end
-- Reset task NhËn th­ëng ®ua top kim xµ liªn server
	if tonumber(date("%y%m%d%H")) >= 13103000 then
		if GetTask(2437) <= 154 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,155)
		end
	end	
-- Reset task më réng event th¸ng 10
	if tonumber(date("%y%m%d%H")) >= 13103000 then
		if GetTask(2437) <= 155 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,156)
		end
	end	
	-- Reset Task L«i Hæ LÖnh 
	if tonumber(date("%y%m%d%H")) >= 13112200 then
		if GetTask(2437) <= 156 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,157)
		end
	end	
	-- Reset Task Noel ®æi diÖu d­¬ng
	if tonumber(date("%y%m%d%H")) >= 14010200 then
		if GetTask(2437) <= 157 then
			tTask = {2725}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,158)
		end
	end	
	-- Reset Task Noel ®æi diÖu d­¬ng
	if tonumber(date("%y%m%d%H")) >= 14011000 then
		if GetTask(2437) <= 158 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,159)
		end
	end	
	-- Reset Task ®µo r­¬ng gi¸p ngä
	if tonumber(date("%y%m%d%H")) >= 14012000 then
		if GetTask(2437) <= 159 then
			tTask = {2725, 2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,160)
		end
	end	
	-- Reset Task xãa KhuÊt Nguyªn Béi
	if tonumber(date("%y%m%d%H")) >= 14021300 then
		if GetTask(2437) <= 159 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,160)
		end
	end	
	-- Reset Task T¸i xuÊt giang hå
	if tonumber(date("%y%m%d%H")) >= 14022100 then
		if GetTask(2437) <= 160 then
			tTask = {2162,2163,2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,161)
		end
	end
	-- Reset Task 123Pay
	if tonumber(date("%y%m%d%H")) >= 14030100 then
		if GetTask(2437) <= 161 then
			tTask = {2664, 2675}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,162)
		end
	end
		-- Reset Task BHTA 11
	if tonumber(date("%y%m%d%H")) >= 14030100 then
		if GetTask(2437) <= 162 then
			tTask = {2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,163)
		end
	end
	-- Reset Task event thang 3
	if tonumber(date("%y%m%d%H")) >= 14042100 then
		if GetTask(2437) <= 163 then
			tTask = {3059 }
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,164)
		end
	end
	------------------
	-- Reset Task Sinh Tu Vo Nga
	if tonumber(date("%y%m%d%H")) >= 14051900 then
		if GetTask(2437) <= 164 then
			tTask = {2700, 2701, 2713}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,165)
		end
	end
	-- Reset Task nhiÖm vô ®æi trang bŞ Thiªn Chi - B¹ch Kim viªm ®Õ
	if tonumber(date("%y%m%d%H")) >= 14061700 then
		if GetTask(2437) <= 165 then
			tTask = {2707}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,166)
		end
	end	
	-- Reset Task nhiÖm vô VBonus 7/2014
	if tonumber(date("%y%m%d%H")) >= 14071000 then
		if GetTask(2437) <= 166 then
			tTask = {2430}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,167)
		end
	end	
	-- Reset Task nhiÖm vô Th¨ng TiÕn Phôc Sinh
	if tonumber(date("%y%m%d%H")) >= 14090900 then
		if GetTask(2437) <= 167 then
			tTask = {2725}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,168)
		end
	end		
	-- Reset Task cuéc chiÕn hoa hång
	if tonumber(date("%y%m%d%H")) >= 14100700 then
		if GetTask(2437) <= 168 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,169)
		end
	end		
	-- Reset Task BHTA 12
	if tonumber(date("%y%m%d%H")) >= 14102000 then
		if GetTask(2437) <= 169 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,170)
		end
	end		
	-- Reset Task §ua Top bang héi liªn server
	if tonumber(date("%y%m%d%H")) >= 14102100 then
		if GetTask(2437) <= 170 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,171)
		end
	end			
	-- Reset Task NhËn th­ëng nhiÖm vô PVP CDKEY
	if tonumber(date("%y%m%d%H")) >= 14102700 then
		if GetTask(2437) <= 171 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,172)
		end
	end			
	------------------
end

-----------------------------
function DelEventItem()
	local nDate = tonumber(date("%y%m%d%H"))
	if GetTask(2436) == 0 then
		BigDelItem(2,1,30039,BigGetItemCount(2,1,30039))
		SetTask(2436,1)
	end
	if nDate >= 10102500 then
		if GetTask(2436) <= 1 then
			BigDelItem(2,1,30219,BigGetItemCount(2,1,30219))
			SetTask(2436,2)
		end
	end
	if nDate >= 10102500 then
		if GetTask(2436) <= 2 then
			BigDelItem(2,1,2639,BigGetItemCount(2,1,2639))
			SetTask(2436,3)
		end
	end
	if nDate >= 10102900 then
		if GetTask(2436) <= 3 then
			BigDelItem(2,1,30221,BigGetItemCount(2,1,30221))
			SetTask(2436,4)
		end
	end
	if nDate >= 10102900 then
		if GetTask(2436) <= 4 then
			BigDelItem(0,108,514 + GetBody() - 1,BigGetItemCount(0,108,514 + GetBody() - 1))
			BigDelItem(0,109,514 + GetBody() - 1,BigGetItemCount(0,109,514 + GetBody() - 1))
			BigDelItem(0,110,514 + GetBody() - 1,BigGetItemCount(0,110,514 + GetBody() - 1))
			SetTask(2436,5)
		end
	end
	if nDate >= 11021400 then
		if GetTask(2436) <= 5 then
			BigDelItem(2,0,361,BigGetItemCount(2,0,361))
			SetTask(2436,6)
		end
	end
end

--------------------------------------------
--Date : 09/11/2011
-- Add By : PhucBDB
------------------------------------------------------

function GetBitExt(nTask,nBitStart,nBitEnd)
	if (nBitStart > nBitEnd ) or ( nBitStart <1 ) or (nBitEnd > 32) then
		return 0;
	end;

	local Value = 0;
	local iBit = 1 ;
	local iTask = GetTask(nTask);

	for i = nBitStart,nBitEnd do
		Value = SetBit(Value, iBit,GetBit(iTask,i));
		iBit = iBit + 1;
	end;
	return Value;
end;

function SetBitExt(nTask,Value,nBitStart,nBitEnd)
	if (nBitStart > nBitEnd) or (nBitStart < 1 ) or (nBitEnd > 32)then
		return 0;
	end;

	local iBit =1 ;
	for i = nBitStart,nBitEnd do
		SetTask(nTask,SetBit(GetTask(nTask),i,GetBit(Value,iBit)));
		iBit = iBit +1;
	end;

end;

function GetByteExt( nTask,nByteStart,nByteEnd)
	if (nByteStart > nByteEnd)  or ( nByteStart < 1 ) or (nByteEnd > 4) then
		return 0;
	end;
	local iByte =1;
	local iTask_Value = GetTask(nTask);
	local Value = 0;

	for i=nByteStart,nByteEnd do	
		Value = SetByte(Value,iByte,GetByte(iTask_Value,i));
		iByte = iByte + 1;
	end;	
	return Value;
end;

function SetByteExt(nTask,Value,nByteStart,nByteEnd)	
	if (nByteStart > nByteEnd) or ( nByteStart <1) or (nByteEnd > 4) then
		return 0;
	end;
	
	local iByte = 1 ;
	for i = nByteStart,nByteEnd do
		SetTask(nTask,SetByte(GetTask(nTask),i,GetByte(Value,iByte)));
		iByte = iByte + 1 ;
	end;	
end;

-- Khoang thoi gian Event
function VietCheckEventDate()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120113 and nDate <=120205   then
		return 1
	end
	return 0
end

--RESET mçi ngµy
function VietResetDate()
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = GetTask(TSK_EVERY_DATE)
	if nDate ~= nCurdate then
		SetTask(TSK_EVERY_DATE, nDate)
--		SetTask(TSK_ACTIVE_VIP_THONUONG, 0)
--		SetTask(TSK_ACTIVE_VIP_PHAOHOA, 0)
		SetTask(TSK_COUNT_EVERYDAY,0)
--		gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX, 1)
		--SetTask(TSK_LUCKY_DAOHUU,0)	
--		SetTask(TSK_LUCKY_DAOHUU_NEW_THANG4,0)	
		SetTask(TSK_LAMGIAU,0)
		SetTask(TSK_THAIHU_DOITHUONG,0)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/1000) * 1000)
--		KF_Daily_Reset() --reset tham gia chiÕn tr­êng liªn server
		gf_SetTaskByte(TSK_DONGHANH, 3, 0)
		gf_SetTaskBit(TSK_DONGHANH, 25, 0, 0)
		gf_SetTaskBit(TSK_DONGHANH, 26, 0, 0)
		gf_SetTaskByte(TSK_DONGHANH_COUNT, 1, 0)
		SetTask(TSK_THAIHU_DAY,0)
		if nDate <= 141130 then	-- Dua top cong hien bang server Vo Dang Son + Duong Gia Tuong
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)
			gf_SetTaskBit(2669, 8, 0,0)
		end
		SetTask(TSK_PHUCSINH2_COUNT,0)
--		SetTask(TSK_CTVL_COUNT,0)	--task nhiÖm vô mçi ngµy cña Chİ T«n V­¬ng LÖnh
--		VNG_SetTaskPos(TSK_CTVL_ALL, 0, 4, 4) --CTVL 4: nhËn th­ëng tæ ®éi trong ngµy
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 6, 6)	--event noel nhËn diÖu d­¬ng 3/1/2014 - 16/1/2014
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 4, 4)	
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 5, 5)	
		if nDate <= 20140406 then
			gf_SetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG, 1, 0,0)
		end
		-- ========== Sinh tu vo nga 2 =============
		VNG_SetTaskPos(TSK_SINHTUVONGA3, 0, 6, 2) -- Reset nhiem vu hang ngay
		VNG_SetTaskPos(TSK_SINHTUVONGA1, 1, 9, 9)
		-- ========== Th¨ng TiÕn Phôc Sinh =============
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 8, 4) -- Reset ®iÓm hµng ngµy
		
		-- =====================================
		SetTask(TSK_123PAY1,0)
		SetTask(TSK_123PAY2,0)
		
		--==========Reset Cuoc Chien Hoa Hong =======
		if nDate <= 20141012 then
			SetTask(TSK_CUOCCHIENHOAHONG,0)
		end
		
		if nDate <= 20141119 then
			gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,1,0)
		end
		
		--Reset §Òn bï server Háa Phông
		if nDate <= 20141205 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,0)
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,0)
		end
		
		--Reset NhËn th­ëng nhiÖm vô PVP CDKEY
		gf_SetTaskByte(TSK_NHIEMVUCDKEY,1,0)
	end	
	
	local nWeek = tonumber(date("%W"))
	local nCurWeek = mod(GetTask(TSK_EVERY_WEEK),100)
	local nRemain = floor(GetTask(TSK_EVERY_WEEK)/100)
	if nCurWeek ~= nWeek then
		nRemain = nRemain * 100
		SetTask(TSK_EVERY_WEEK,nRemain + nWeek)
		SetTask(TSK_MTT_COUNT,0)
--		VNG_SetTaskPos(TSK_CTVL_ALL, 00, 3, 2) --CTVL 2: ®· x©y dùng bang trong tuÇn	3: ®· nhËn th­ëng BHCT trong tuÇn
--		VNG_SetTaskPos(TSK_CTVL_ALL, 0, 8, 8)	--CTVL 8: kich ho¹t Bang héi Chİ T«n
	end
end