--活动的一些共用奖励函数
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\lib\\globalfunctions.lua")

function Vet_Complete_Revive_OnePartner_FirstStage_check()
	return 1;
end

function Vet_Complete_Revive_OnePartner_FirstStage()
	--complete by veit
	--finish first stage
	--
end

function Vet_Complete_Revive_OnePartner_SecondStage_check()
	--complete by veit
	--
	return 0;
end

function Vet_Complete_Revive_OnePartner_SecondStage(nTaskId, nBitIdx)	--(nActivityID,nTaskGrouId,nTaskIDSeq)
	nTaskId = nTaskId or 0
	nBitIdx = nBitIdx or 0
	
	local nCheck = GetTask(2786)--GetTask(nTaskIdFinalPrize1)
	if nCheck >= 1 then
		Talk(1,"","B筺  nh薾 ph莕 thng cu鑙 khi s?d鬾g t鑙 產 v藅 ph萴 r錳.")
		return 0
	end
	local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10)
	if mod(nIsPS,10) >= 1 then
		Talk(1,"","B筺 ng h祅h  ph鬰 sinh r錳 n猲 kh玭g th?nh薾 ph莕 thng n祔.")
		return 0
	end
--	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	
--	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nCurGodPoint < 999 then
		Talk(1,"","B筺 ng h祅h ch璦  999 甶觤 linh l鵦")
		return 0
	end
--	if GetItemCount(2,1,30603) < 999 then
--		Talk(1,"","Ti猽 Dao Ng鋍 trong t骾 kh玭g  999 c竔")
--		return
--	end
	local checka = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_A,10,5)
	local checkb = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_B,10,3)	
--	if checka < 160160 or checkb < 3303030 then
--		Talk(1, "", "B筺 ch璦 ho祅 th祅h giai 畂筺 1 nhi謒 v?ph鬰 sinh b筺 ng h祅h n猲 kh玭g th?nh薾 ph莕 thng !!!!")
--		return 0
--	end	

--	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", 2500, "Ti猽 hao Ti猽 Dao Ng鋍 ho祅 th祅h giai 畂筺 2 c馻 ph鬰 sinh ng h祅h");		
	--设置已领取标记
--	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	local szNpcName = "<color=green>S?ki謓 Event th竛g 11<color>: "
	local tSay = {}
	local tHeader = szNpcName.." Чi hi謕 h穣 ch鋘 hng Ph鬰 Sinh cho B筺 уng H祅h c馻 m譶h."
	tinsert(tSay, format("H?tr?h?N閕 C玭g/#add_buffEvent2(1,%d,%d)",nTaskId, nBitIdx))		
	tinsert(tSay, format("H?tr?h?Ngo筰 C玭g/#add_buffEvent2(2,%d,%d)",nTaskId, nBitIdx))		
	--tinsert(tSay, "H?tr?h?Ngo筰 C玭g/#add_buffEvent(2,tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")")	

	--tinsert(tSay, "Ta ch?gh?qua th玦/nothing")
	Say(tHeader, getn(tSay), tSay)	
	return 1
end

function add_buffEvent2(nWay,nTaskId, nBitIdx)
	local nCheck =	GetTask(2786)-- GetTask(nTaskIdFinalPrize1)
	if nCheck >= 1 then
		Talk(1,"","B筺  nh薾 ph莕 thng cu鑙 khi s?d鬾g t鑙 產 2 v藅 ph萴 r錳.")
		return 0
	end
	local tNoiNgoai = {
			 [1] = {
						{"N閕 C玭g 6%", "state_m_attack_percent_add", 6},
						{"Sinh L鵦 +6000", "state_life_max_point_add", 8000},
						{"Sinh L鵦 6%", "state_life_max_percent_add", 6},
						{"Kh竛g t蕋 c?+12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo筰 C玭g 12%", "state_p_attack_percent_add", 12},
						{"Sinh L鵦 +6000", "state_life_max_point_add", 10000},
						{"Sinh L鵦 6%", "state_life_max_percent_add", 6},
						{"N閕 ph遪g/Ngo筰 ph遪g +60", "state_i_defence_point_add", 60},
						{"Ngo筰 ph遪g +60", "state_o_defence_point_add", 60},
					},
				}
	local t_pet_type = {
									[1] = {"Th?tr緉g",3333,24},
									[2] = {"Th?x竚",3333,25},
									[3] = {"Th?甧n",3334,26},		
								}	
--	if GetItemCount(2,1,30603) < 999 then
--		Talk(1,"","Ti猽 Dao Ng鋍 trong t骾 kh玭g  999 c竔")
--		return
--	end								
--	if DelItem(2,1,30603,999) ~= 1 then
--		return 0;
--	end								
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);		
	SetTask(2786,1)	--nh薾 ph莕 thng cu鑙 
	
	gf_SetTaskBit(nTaskId, nBitIdx, 1)--Set awawd bit, avoid repeat get award
	
--	Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize,1)
--	self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
	---------------
	SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t╪g bc nhi謒 v?l猲 gi?tr?3 l?ho祅 th祅h xong giai 畂筺 2
	gf_WriteLogEx("PHUC SINH PET", "xong giai 畂筺 2", 1, "Ho祅 th祅h Giai 筺 2")												
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 l?gi?tr?x竎 nh c?Ph鬰 Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi?tr?x竎 nh c?Ph鬰 Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi?tr?x竎 nh s?l莕 Ph鬰 Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set hng Ph鬰 Sinh c馻 PET
		-------------Set c竎 ch?s?buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET m韎
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		
		if nResult >= 0 then
			Msg2Player("Ch骳 m鮪g i hi謕  chi猽 m?PET th祅h c玭g")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add th蕋 b筰", 1, "Add pet th蕋 b筰")			
		end
		-------------
		Msg2Player("Ch骳 m鮪g i hi謕  ho祅 th祅h nhi謒 v?Ph鬰 Sinh cho B筺 уng H祅h !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai 畂筺 2", 1, "Ho祅 th祅h Giai 筺 buff")		
	
end
