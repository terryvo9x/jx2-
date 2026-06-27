--file function :Vn activity base class info
--function design:cunzhang
--develop date 5-17-2011
--modify list: liubo
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\head\\activity_normal_head_string.lua")
Include("\\script\\online_activites\\activity_head.lua")
Include("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")

TB_VN_ACTIVITY_MAIN = {}

EVENT_LOG_TITLE = "Hoat dong thang 11 nam 2014"
SVN_ACTIVITY_INI_FILE = "\\script\\online_activites\\ini\\VnOnlineMain.ini"
g_objVNAcitivityInfo = ff_GetIniFileObj(SVN_ACTIVITY_INI_FILE)
if g_objVNAcitivityInfo:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SVN_ACTIVITY_INI_FILE)
end

--½õÄÒ´óÊÂ¼þ´¦Àí
function CLASS_ACTIVITY:JinNangOpen()
	local nTag = 0;
	local tbSayDialog = {};
	local szSayHead = "";
	if self:OnlineTimeChk() == 1 then
		nTag = 1;
		szSayHead = self:CreateActivityHead()
		--¶Ò»»Ñ¡Ïî
		for i = 1,self.nItemChgNum do
--			tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#gf_VnItemChgDeal(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
			--tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#gf_VnItemChgDeal("..tonumber(self.sActivityChgKey)..","..tonumber(i)..")");
			
			if i == 1 then
				tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#VNG_DoiEvent_Form1(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
			elseif i == 2 then
				--tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#VNG_DoiEvent_Form2(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
				--tinsert(tbSayDialog,"§æi 1hoa 3/8(cÇn 5 giÊy bãng kiÕng + 5 b× cøng + 2 xu vËt phÈm)/VNG_DoiEvent_Form2")
			end
		end
		for i = 1,getn(self.tbPrizeItemInfo) do
			if getn(self.tbPrizeItemInfo[i].tbExpPrizeNum) == 2 and self.nPrizeMode ~= 1 then
				tinsert(tbSayDialog,format(self.tbHintString[2].."/#gf_VnSetActivityPrizeModel("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
			end
			if self.tbPrizeItemInfo[i].nItemUseTimesMax then
				if self.tbPrizeItemInfo[i].nTaskIdGetFinalPrize ~= 0 then
					tinsert(tbSayDialog,format(self.tbHintString[3][1].."/#Vet_Activity_GetLastPrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
				end
				if self.nPrizeMode == 1 then
					tinsert(tbSayDialog,format(self.tbHintString[3][2].."/#Vet_Activity_GetCapsValuePrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
				end	
				--²é¿´Ê¹ÓÃÊýÁ¿
				tinsert(tbSayDialog,format(self.tbHintString[13].."/#Vet_ShowUsedCount("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
			end
		end
		for nIep = 1, self.nItemExcgPrizeCount do
			if getn(self.tbItemExchangePrize[nIep]) == 4 then
				tinsert(tbSayDialog,format(self.tbHintString[16].."/#Vet_ItemExchangePrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..nIep..")",self.tbItemExchangePrize[nIep][4]))
			end
		end
		if self.nFlag == 1 then
			tinsert(tbSayDialog,self.tbHintString[15].."/#Vet_Activity_GetLastPrizeBoth("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..")");
		end
	end
	return tbSayDialog,szSayHead,nTag;
end

function CLASS_ACTIVITY:CreateActivityHead()
	local sStartTime = GetEventStartDate(self.nActivityID)
	local nEndTime = GetEventEndDate(self.nActivityID)
	local sTimString = "ngµy "..tostring(tonumber(strsub(sStartTime,7,8))).." th¸ng "..tostring(tonumber(strsub(sStartTime,5,6))).." n¨m "..tostring(strsub(sStartTime,1,4))
	sTimString = sTimString.." ®Õn 24:00".." ngµy "..tostring(tonumber(strsub(nEndTime,7,8)) - 1).." th¸ng "..tostring(tonumber(strsub(nEndTime,5,6))).." n¨m "..tostring(strsub(nEndTime,1,4))
--	if strsub(sStartTime,1,4) ~= strsub(nEndTime,1,4) then
--		sTimString = sTimString.." n¨m "..tostring(strsub(sStartTime,1,4))
--	end
	return  format(self.tbHintString[1],self.sActivityName,sTimString)
end

--»î¶¯¿ª·ÅÊ±¼äÅÐ¶Ï
function CLASS_ACTIVITY:OnlineTimeChk()
	return gf_CheckEventDateEx(self.nActivityID)
end

--¿ªÆô»ñÈ¡½±Àø
function CLASS_ACTIVITY:ItemPrizeOnUse(nItemIndex,nItemSeq)
	--Ê±¼ä¼ì²â
	if self:OnlineTimeChk() ~= 1 then
		Talk(1,"",self.tbHintString[8])
		return
	end
	local tbPrizeItemInfo = self.tbPrizeItemInfo[nItemSeq]
	local nUseTimes = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes)
	local nPrizeType = 1
	--Ê¹ÓÃÉÏÏÞÅÐ¶Ï
	if tbPrizeItemInfo.nItemUseTimesMax and tbPrizeItemInfo.nItemUseTimesMax ~= 0 then
		if nUseTimes >= tbPrizeItemInfo.nItemUseTimesMax then
			Talk(1,"",format(self.tbHintString[5],tbPrizeItemInfo.tbItemInfo[4],tbPrizeItemInfo.nItemUseTimesMax))
			return
		end
	end
	if self.nPrizeMode ~= 1 then
		--¶Ò»»¹æÔò¼ì²â
		if getn(tbPrizeItemInfo.tbExpPrizeNum) == 2 then
			nPrizeType = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdPrizeType)
			if nPrizeType == 0 then
				self:PrizeTypeSel(nItemSeq)
				return
			end
		end
	end
	--±³°ü¿Õ¼äÅÐ¶Ï
	if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
		if gf_Judge_Room_Weight(tbPrizeItemInfo.tbAdditionalPrize.tbItemRoomWeight[1],tbPrizeItemInfo.tbAdditionalPrize.tbItemRoomWeight[2],"") ~= 1 then
			return
		end
	else
		if gf_Judge_Room_Weight(tbPrizeItemInfo.tbNormalPrize.tbItemRoomWeight[1],tbPrizeItemInfo.tbNormalPrize.tbItemRoomWeight[2],"") ~= 1 then
			return
		end
	end
	--ÆÕÍ¨½±Àø´¦Àí
	if DelItemByIndex(nItemIndex,1) ~= 1 then
		return
	else
		if self.nPrizeMode ~= 1 then
			if nPrizeType == 1 then		--Ä£Ê½1
				if tbPrizeItemInfo.tbExpPrizeNum[1] > 0 then
					ModifyExp(tbPrizeItemInfo.tbExpPrizeNum[1]);
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[1] > 0 then
						gf_EventGiveCustomAward(3, tbPrizeItemInfo.bHaveThings[1], 1);
					end
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[2] > 0 then
						gf_EventGiveCustomAward(4, tbPrizeItemInfo.bHaveThings[2], 1);
					end
				end
				if getn(tbPrizeItemInfo.tbPrizeCondition) == 2 and tbPrizeItemInfo.tbPrizeCondition[1] ~= 0 then
					self:GiveItemPrize(tbPrizeItemInfo.tbNormalPrize.tbPrizeInfo1,tbPrizeItemInfo.tbNormalPrize.nRandomBase1,format(self.tbHintString[10][1],tbPrizeItemInfo.tbItemInfo[4]))
				end
				--ÊÇ·ñÓÐÌØÊâ´ÎÊýµÄ´¦Àí£¨Ä£Ê½1ºÍÄ£Ê½2¶¼ÓÐÌØÊâ´ÎÊý½±Àø£©
				if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
					self:GiveItemAdditionPrize(tbPrizeItemInfo.tbAdditionalPrize,format(self.tbHintString[10][2],tbPrizeItemInfo.tbItemInfo[4]))
					--self:OnGetItemAddionalPrize(nUseTimes + 1)
				end
			else		--Ä£Ê½2
				if tbPrizeItemInfo.tbExpPrizeNum[2] > 0 then
					ModifyExp(tbPrizeItemInfo.tbExpPrizeNum[2]);
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[1] > 0 then
						gf_EventGiveCustomAward(3, tbPrizeItemInfo.bHaveThings[1], 1);
					end
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[2] > 0 then
						gf_EventGiveCustomAward(4, tbPrizeItemInfo.bHaveThings[2], 1);
					end
				end
				if getn(tbPrizeItemInfo.tbPrizeCondition) == 2 and tbPrizeItemInfo.tbPrizeCondition[2] ~= 0 then
					self:GiveItemPrize(tbPrizeItemInfo.tbNormalPrize.tbPrizeInfo2,tbPrizeItemInfo.tbNormalPrize.nRandomBase2,format(self.tbHintString[10][1],tbPrizeItemInfo.tbItemInfo[4]))
				end
				--ÊÇ·ñÓÐÌØÊâ´ÎÊýµÄ´¦Àí£¨Ä£Ê½1ºÍÄ£Ê½2¶¼ÓÐÌØÊâ´ÎÊý½±Àø£©
				if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
					self:GiveItemAdditionPrize(tbPrizeItemInfo.tbAdditionalPrize,format(self.tbHintString[10][2],tbPrizeItemInfo.tbItemInfo[4]))
					--self:OnGetItemAddionalPrize(nUseTimes + 1)
				end
			end
		elseif self.nPrizeMode == 1 then
			self:GivePmModePrize(nItemSeq)
		end
		--Ê¹ÓÃ´ÎÊý´¦Àí
		if tbPrizeItemInfo.nItemUseTimesMax then
			Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes,(nUseTimes + 1))
			local msg = ""
			if tbPrizeItemInfo.nItemUseTimesMax ~= 0 then
				msg = msg..format(self.tbHintString[11][1],tbPrizeItemInfo.tbItemInfo[4],(nUseTimes + 1),tbPrizeItemInfo.nItemUseTimesMax)
			end
			if self.nPrizeMode == 1 then
				msg = msg..","..format("§iÓm tÝch lòy lµ <color=green>%d<color>", Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], tbPrizeItemInfo.nPmAccPoint))
			end
--			Talk(1,"",msg)
		end
	end
end
--½±ÀøÄ£Ê½Ñ¡È¡
function CLASS_ACTIVITY:PrizeTypeSel(nItemSeq)
	local tbItemPrizeInfo = self.tbPrizeItemInfo[nItemSeq]
	if not tbItemPrizeInfo.tbExpPrizeName or getn(tbItemPrizeInfo.tbExpPrizeName) ~= 2 then
		Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2], tbItemPrizeInfo.nTaskIdPrizeType, 1)
		return
	end
	if getn(tbItemPrizeInfo.tbExpPrizeNum) == 2 then
		Say(format(self.tbHintString[9][1],tbItemPrizeInfo.tbItemInfo[4]),
			3,
			format(self.tbHintString[9][2][1],format(tbItemPrizeInfo.tbExpPrizeName[1],tbItemPrizeInfo.tbExpPrizeNum[1]),self.tbTaskGroup[1],self.tbTaskGroup[2],tbItemPrizeInfo.nTaskIdPrizeType, 1),
			format(self.tbHintString[9][2][2],format(tbItemPrizeInfo.tbExpPrizeName[2],tbItemPrizeInfo.tbExpPrizeNum[2]),self.tbTaskGroup[1],self.tbTaskGroup[2],tbItemPrizeInfo.nTaskIdPrizeType, 1),
			self.tbHintString[9][2][3]
		)
	end
end
--»ñÈ¡×îÖÕ½±Àø
function CLASS_ACTIVITY:GetFinalPrize(nItemSeq,nPrizeDiff,nOrder,nIndex)
	--Ê±¼ä¼ì²â
	if self:OnlineTimeChk() ~= 1 then
		Talk(1,"",self.tbHintString[8])
		return
	end
	--¾­ÂöÊÇ·ñ´òÍ¨
	if nPrizeDiff == 9 or nPrizeDiff == 40 then
		if MeridianGetLevel() < 1 then
			Msg2Player("C¸c h¹ ch­a kÝch ho¹t Kinh M¹ch, kh«ng thÓ nhËn ®­îc Ch©n KhÝ.")
			return 0;
		end
		--¾­ÂöÊ£ÓàÆøº£²»×ã
		if MeridianGetLeftGenuineQiCapcity() < 1500 then
			Msg2Player("KhÝ h¶i cña thiÕu hiÖp kh«ng ®ñ kh«ng thÓ nhËn ch©n khÝ");
			return 0;
		end
	end
	--½ÓÁË×ªÉú1µÄÈÎÎñ²ÅÄÜÁì´Ë½±Àø
	if nPrizeDiff == 26 then
		if VetInterface_ConditionCheck1() ~= 1 then
			Msg2Player("ChØ cã nh©n vËt nhËn nhiÖm vô phôc sinh 1 míi cã thÓ nhËn phÇn th­ëng nµy");
			return 0;
		end
	end
	if nPrizeDiff == 27 or nPrizeDiff == 37 then	--or nPrizeDiff == 49
		if VetInterface_ConditionCheck1_6() ~= 1 then
			Msg2Player("ChØ cã nh©n vËt nhËn nhiÖm vô phôc sinh 1 ( trïng sinh 6) míi cã thÓ nhËn phÇn th­ëng nµy");
			return 0;
		end
	end
	if nPrizeDiff == 49 or nPrizeDiff == 57 then
		local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		if nGetQuest < 1 then
			Talk(1, "", "C¸c h¹ ch­a nhËn nhiÖm vô phôc sinh b¹n ®ång hµnh.")
			return 0
		end
		if nGetQuest >= 2 then
			Talk(1, "", "C¸c h¹ ®· hoµn thµnh nhiÖm vô phôc sinh b¹n ®ång hµnh.")
			return 0
		end
	end
	if nPrizeDiff == 55 then
		local nLevel = mod(TASK_VNG_PET,100)
		if nLevel < 2 then
				Msg2Player("B¹n ch­a cã PET cÊp 1 nªn kh«ng thÓ nhËn phÇn th­ëng nµy")
				return 0
		end
	end
--	if nPrizeDiff == 37 then	--and VetInterface_Reborn_ConditionCheck() ~= 1
--		return 0;
--	end
	--»¹ÒªÅÐ¶ÏÒ»´Î
	if self.tbPrizeItemInfo[nItemSeq] == nil then
		return
	end
	local tbPrizeInfo = self.tbPrizeItemInfo[nItemSeq]
	--ÅÐ¶ÏÊÇ·ñÓÐ×îÖÕ½±Àø
	if tbPrizeInfo.nItemUseTimesMax == nil then
		return
	end
	--ÅÐ¶ÏÓÎÏ·Ê±¼ä
	if self:OnlineTimeChk() ~= 1 then
		return
	end
	--ÅÐ¶Ï´ÎÊý
	local nUseTimes = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdUseItemTimes)
	if nUseTimes < tbPrizeInfo.nItemUseTimesMax then
		Talk(1,"",format(self.tbHintString[6],tbPrizeInfo.tbItemInfo[4],tbPrizeInfo.nItemUseTimesMax))
		return
	end
	if self.nFinalPrizeMode == 0 then 
		--ÊÇ·ñÁìÈ¡ÅÐ¶Ï
		if Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize) == 1 then
			Talk(1,"",self.tbHintString[7])
			return
		else
			--¿Õ¼ä¸ºÖØÅÐ¶Ï
			if tbPrizeInfo.tbFinalPrize and tbPrizeInfo.tbFinalPrize.tbItemRoomWeight and gf_Judge_Room_Weight(tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[1],tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[2],"") ~= 1 then
				return 0
			end
			--½±Àø´¦Àí
			if tbPrizeInfo.tbFinalPrize.tbPrizeInfo then
				--ÏûºÄ´¦Àí
				if nPrizeDiff == 37 and VetInterface_Reborn_ConditionCheck() ~= 1 then
					return 0;
				end
--				if nPrizeDiff == 57 and Vet_Complete_Revive_OnePartner_FirstStage_check() ~= 1 then
--					return 0;
--				end
--				if nPrizeDiff == 58 and Vet_Complete_Revive_OnePartner_SecondStage_check() ~= 1 then
--					return 0;
--				end
				if nPrizeDiff ~= 58 then
					Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize,1)
					self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
				end
			end
			self:OnGetFinalPrize(nPrizeDiff,nOrder)
		end
	elseif self.nFinalPrizeMode == 1 then
		--ÊÇ·ñÁìÈ¡ÅÐ¶Ï
		if nIndex - 1 > 0 then
			if Vet_Activity_GetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex - 1) ~= 1 then
				Talk(1,"",self.tbHintString[17])
				return
			end
		end
		if Vet_Activity_GetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex) == 1 then
			Talk(1,"",self.tbHintString[7])
			return
		else
			--¿Õ¼ä¸ºÖØÅÐ¶Ï
			if tbPrizeInfo.tbFinalPrize and tbPrizeInfo.tbFinalPrize.tbItemRoomWeight and gf_Judge_Room_Weight(tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[1],tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[2],"") ~= 1 then
				return 0
			end
			--½±Àø´¦Àí
			if tbPrizeInfo.tbFinalPrize.tbPrizeInfo then
				Vet_Activity_SetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex, 1)
				self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
			end
			self:OnGetFinalPrize(nPrizeDiff,nOrder)
		end
	end
end

--¸øÓè½±Àø
function CLASS_ACTIVITY:GiveItemAdditionPrize(tbItemPrizeInfo,szLog)
	gf_EventGiveRandAward(tbItemPrizeInfo.tbPrizeInfo,tbItemPrizeInfo.nRandomBase,1,self.sActivityName,szLog)
end

function CLASS_ACTIVITY:GiveItemPrize(tbItemPrizeTable,nRandomBase,szLog)
	gf_EventGiveRandAward(tbItemPrizeTable,nRandomBase,1,self.sActivityName,szLog)
end

--Ã¿´ÎÊ¹ÓÃµÀ¾ß½±Àø
function CLASS_ACTIVITY:GivePmModePrize(nItemSeq)
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], self.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	local tPoint = {
  	{1, 60},
  	{2, 24},
  	{3, 10},
  	{4, 5},
  	{5, 1},
  }
  local nRand = gf_GetRandItemByTable(tPoint, gf_SumRandBase(tPoint), 1)
	Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], self.tbPrizeItemInfo[nItemSeq].nPmAccPoint, nPmAccPoint + tPoint[nRand][1])
	Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm tÝch lòy ", tPoint[nRand][1]))
	if type(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize) == "string" then
		dostring(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize)
	else
		print("ERROR:dostring(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize)")	
	end
end

--ipairs Ìí¼Ó
ipairs = ipairs or function(t)
	for i,v in t do
		if i == "n" then
			t[i]= nil
		end
	end
 return t
end

--·þÎñÆ÷Æô¶¯µ÷ÓÃ
function ServerStartUp(nStartTime,nEndTime)
end

--Íæ¼ÒµÇÂ½µ÷ÓÃ
function PlayerLogin(bExchangeComing,nStartTime,nEndTime)
end

--»î¶¯±äÁ¿´¦Àí
function Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:GetTask(nTaskIDSeq)
end

function Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq,nTaskValue,bSetType)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	if bSetType and bSetType == 1 then
		if nTaskValue == 1 then
			Msg2Player("Chän h×nh thøc phÇn th­ëng 1");
		elseif nTaskValue == 2 then
			Msg2Player("Chän h×nh thøc phÇn th­ëng 2");
		end
	end
	return g_objVetAcitivityTaskGroupTemp:SetTask(nTaskIDSeq,nTaskValue)
end

function Vet_Activity_GetItemUseInfoBit(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq, nBit)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:GetTaskBit(nTaskIDSeq, nBit)
end

function Vet_Activity_SetItemUseInfoBit(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq, nBit, nTaskValue)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:SetTaskBit(nTaskIDSeq, nBit, nTaskValue)
end

--½±ÀøÄ£Ê½Ñ¡È¡
function gf_VnSetActivityPrizeModel(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if tbActivity then tbActivity:PrizeTypeSel(nItemSeq) end
end

--Ñ¡Ôñ×îÖÕ½±Àø
function Vet_Activity_SelLastPrize(nTaskGrouId,nTaskIDSeq,nItemSeq,nPrizeDiff,nOrder,nIndex)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if tbActivity then tbActivity:GetFinalPrize(nItemSeq,nPrizeDiff,nOrder,nIndex) end
end

--Ê¹ÓÃ´ÎÊý²é¿´
function Vet_ShowUsedCount(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local PrizeItemInfo = tbActivity.tbPrizeItemInfo[nItemSeq]
	local nUseTimes = Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskIDSeq,PrizeItemInfo.nTaskIdUseItemTimes)
	Talk(1,"",format(tbActivity.tbHintString[11][1],PrizeItemInfo.tbItemInfo[4],nUseTimes,PrizeItemInfo.nItemUseTimesMax))
end

function Vet_Activity_GetLastPrize(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tTempSel = tbActivity.tbPrizeItemInfo[nItemSeq].tbFinalPrize.sel
	local tTempPriKind = tbActivity.tbPrizeItemInfo[nItemSeq].tbFinalPrize.tbFinalPrizeKind
	local tTempDiaSel = {}
	if  tTempSel ~= nil and tTempPriKind ~= nil and getn(tTempSel) == getn(tTempPriKind) then
		for j = 1,getn(tTempSel) do
			if tTempSel[j] ~= nil and tTempSel[j] ~= 0 and tTempPriKind[j] ~= nil and tTempPriKind[j] ~= 0 then
				if tTempSel[j] == -1 then
					tinsert(tTempDiaSel,format(tbActivity.tbHintString[12][tTempPriKind[j]],nTaskGrouId,nTaskIDSeq,nItemSeq,tTempSel[j],j))
				else
					tinsert(tTempDiaSel,format(tbActivity.tbHintString[12][tTempPriKind[j]],tTempSel[j],nTaskGrouId,nTaskIDSeq,nItemSeq,tTempSel[j],j))
				end
			end
		end
		tinsert(tTempDiaSel,tbActivity.tbHintString[14])
		Say(tbActivity.tbHintString[12][1],	getn(tTempDiaSel), tTempDiaSel);
	else
		print("ERROR:Vet_Activity_GetLastPrize()")
	end
	return
end

--»ñÈ¡»ý·Ö½±Àø
function Vet_Activity_GetCapsValuePrize(nTaskGrouId, nTaskIDSeq, nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tbPrizeInfo = tbActivity.tbPrizeItemInfo[nItemSeq].tbPmPrizeInfo
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	local nSize = getn(tbPrizeInfo)
	if nSize > 31 then
		print("UDERROR: Vet_Activity_GetCapsValuePrize nSize > 31")
		return
	end
	local tbSay = {}
	for i = 1, nSize do
		local k = tbPrizeInfo[i];
		if k then
			local nIsAward = Vet_Activity_GetItemUseInfoBit(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmUsePrizeTag, i)
			local nCount = 0
			if k[2] == "item" then
				nCount = k[3][4]
			elseif k[2] == "function" then
				nCount = k[5]
			end
			if nCount > 0 then
				if nIsAward == 1 then
					tinsert(tbSay, {format("§iÓm tÝch lòy %d nhËn ®­îc [%s]*%d", k[1], k[4], nCount).."( ®· nhËn th­ëng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
				else
					if nPmAccPoint >= k[1] then
						tinsert(tbSay, {format("§iÓm tÝch lòy %d nhËn ®­îc [%s]*%d", k[1], k[4], nCount).."( cã thÓ nhËn th­ëng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					else
						tinsert(tbSay, {format("§iÓm tÝch lòy %d nhËn ®­îc [%s]*%d", k[1], k[4], nCount), format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					end
				end
			else
				if nIsAward == 1 then
					tinsert(tbSay, {format("§iÓm tÝch lòy %d nhËn ®­îc [%s]",k[1], k[4]).."( ®· nhËn th­ëng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
				else
					if nPmAccPoint >= k[1] then
						tinsert(tbSay, {format("§iÓm tÝch lòy %d nhËn ®­îc [%s]", tonumber(k[1]), k[4]).."( cã thÓ nhËn th­ëng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					else
						tinsert(tbSay, {format("§iÓm tÝch lòy %d nhËn ®­îc [%s]", tonumber(k[1]), k[4]), format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					end
				end
			end
		end
	end
	tinsert(tbSay, {"\nKÕt thóc ®èi tho¹i", "nothing"})
	local tempSay = {};
	tempSay.msg = format("VËt dông hiÖn t¹i <color=gold>%s<color> ®iÓm tÝch lòy lµ <color=green>%d<color> , %s b¹n muèn nhËn phÇn th­ëng nµo ?", tbActivity.tbPrizeItemInfo[nItemSeq].tbItemInfo[4], nPmAccPoint, gf_GetPlayerSexName())
	tempSay.sel = tbSay
	temp_Talk(tempSay);
end

function Vet_Activity_GetCapsValuePrize_Deal(nTG, nTS, nIS, nIdx, nIA)
	local nTaskGrouId = tonumber(nTG)
	local nTaskIDSeq  = tonumber(nTS)
	local nItemSeq    = tonumber(nIS)
	local nIndex      = tonumber(nIdx)
	local nIsAward    = tonumber(nIA)
	if nIsAward == 1 then
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng nµy råi ")
		return
	end
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tbPrizeInfo = tbActivity.tbPrizeItemInfo[nItemSeq].tbPmPrizeInfo
	local tK = tbPrizeInfo[nIndex]
	if not tK then return end
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	if nPmAccPoint < tK[1] then
		Talk(1,"","§iÓm tÝch lòy kh«ng ®ñ , kh«ng thÓ nhËn th­ëng ")
		return
	end
	if "item" == tK[2] or "function" == tK[2] then
		if gf_Judge_Room_Weight(tK[6], tK[6]) ~= 1 then
			Talk(1,"",format("Tói thiÕu  <color=red>%d « <color>", tK[6]))
			return 0
		end
	end
	Vet_Activity_SetItemUseInfoBit(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmUsePrizeTag, nIndex, 1)
	if tK[2] == "item" then
		gf_AddItemEx2(tK[3], tK[4], "2XU vËt phÈm", "nhËn phÇn th­ëng tÝch lòy ®iÓm ", tK[5] or 0, 1)
	elseif tK[2] == "exp" then
		gf_ModifyExp(tK[3])
	elseif tK[2] == "function" then
		dostring(tK[3])
	end
end

--Ê¹ÓÃµÀ¾ß¶Ò»»½±Àø
function Vet_ItemExchangePrize(nTaskGrouId,nTaskIDSeq,nSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tItem = tbActivity.tbItemExchangePrize[nSeq]
	if not tItem or getn(tItem) ~= 4 then
		return
	end
	local tAward = tbActivity.tbIEPAward[nSeq]
	if not tAward or getn(tAward) < 1 then
		return
	end
	local tSay = {}
	for i = 1, getn(tAward) do
		local v = tAward[i];
		local msg = ""
		if v[2] == "exp" or v[2] == "rep" or v[2] == "shimen" then
			msg = v[4]..format("(tiªu hao %d c¸i%s)", v[1], tItem[4])
		elseif  v[2] == "item" then
			msg = v[4]..format("*%d(tiªu hao %d c¸i%s)", v[3][4], v[1], tItem[4])
		elseif v[2] == "function" then
			msg = v[4]..format("*%d(tiªu hao %d c¸i%s)", v[5] or 1, v[1], tItem[4])
		end
		tinsert(tSay, {msg, "#Vet_ItemExchangePrize_Deal("..nTaskGrouId..","..nTaskIDSeq..","..i..","..nSeq..")"});
	end
	tinsert(tSay, {"\n T¹i h¹ chØ xem qua th«i", "nothing"});
	local tempSay = {};
	tempSay.msg = format("b¹n muèn sö dông <color=green>%s<color> ®æi c¸i g× ?", tItem[4])
	tempSay.sel = tSay
	temp_Talk(tempSay);
	return
end

function Vet_ItemExchangePrize_Deal(nTaskGrouId, nTaskIDSeq, i, nSeq)
	local tbActivity = gf_VnGetActivityByGroupId(tonumber(nTaskGrouId), tonumber(nTaskIDSeq))
	if not(tbActivity) then return end
	local tItem = tbActivity.tbItemExchangePrize[tonumber(nSeq)]
	if not tItem or getn(tItem) ~= 4 then
		return
	end
	local tAward = tbActivity.tbIEPAward[tonumber(nSeq)]
	if not tAward or getn(tAward) < 1 then
		return
	end
	local v = tAward[tonumber(i)]
	if v[2] == "item" or v[2] == "function" then
		if gf_Judge_Room_Weight(v[6], v[6]) ~= 1 then
			Talk(1,"",format("tói ®· ®Çy %d", v[6]))
			return
		end
	end
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < v[1] then
		Talk(1,"",format("vËt phÈm %s# sè l­îng kh«ng ®ñ <color=red>%d<color> c¸i", tItem[4], v[1]))
		return
	end
	if DelItem(tItem[1], tItem[2], tItem[3], v[1]) ~= 1 then
		return
	end
	if v[2] == "exp" then
		gf_Modify("Exp", v[3])
	elseif v[2] == "rep" then
		gf_Modify("Rep", v[3])
	elseif v[2] == "shimen" then
		gf_EventGiveCustomAward(4, v[3], 1, "2XU vËt phÈm", "vËt phÈm  ®æi phÇn th­ëng ")
	elseif v[2] == "item" then
		gf_AddItemEx2(v[3], v[4], "2XU vËt phÈm", "vËt phÈm  ®æi phÇn th­ëng ", v[5], 1)
	elseif v[2] == "function" then
		dostring(v[3])
	end
end

--»ñÈ¡»î¶¯Ñ¡Ïî
function get_tbJNDialog_info(tbActivityID)
	local tbSayDialog = {};
	local szSayHead = "";
	local nTag = 0;
	if not tbActivityID then
		return tbSayDialog, szSayHead, "";
	end
	--·µ»ØµÚÒ»¸öÖ¸¶¨IDµÄ»î¶¯
	for i = 1, getn(tbActivityID) do
		local nActivityID = tbActivityID[i];
		if nActivityID > 0 and nActivityID <= GetEventCount() then
			if TB_VN_ACTIVITY_MAIN[nActivityID] then
				tbSayDialog, szSayHead, nTag = TB_VN_ACTIVITY_MAIN[nActivityID]:JinNangOpen();
				if nTag == 1 then
					return tbSayDialog, szSayHead, TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName;
				end
			end
		end
	end
	return tbSayDialog, szSayHead, "";
end

--ÓÉTaskGroupidµÈÐÅÏ¢¶¨Î»
function gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
		if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 and TB_VN_ACTIVITY_MAIN[i].tbTaskGroup[1] == nTaskGrouId and TB_VN_ACTIVITY_MAIN[i].tbTaskGroup[2] == nTaskIDSeq then
			return TB_VN_ACTIVITY_MAIN[i]
		end
	end
	return nil;
end
--ÓÉ»î¶¯ID¶¨Î»»î¶¯
function gf_VnGetActivityByID(nID)
	return TB_VN_ACTIVITY_MAIN[nID],1
end
--ÓÉÎïÆ·ÐÅÏ¢¶¨Î»»î¶¯
function gf_VnGetActivityByItemIndex(nItemIndex)
	local nItemId,nDetaiId,nParticularId = GetItemInfoByIndex(nItemIndex)
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
			if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 then
				for nItemSeq = 1,getn(TB_VN_ACTIVITY_MAIN[i].tbPrizeItemInfo) do
					local tbItemInfo = TB_VN_ACTIVITY_MAIN[i].tbPrizeItemInfo[nItemSeq].tbItemInfo
					if tbItemInfo and tbItemInfo[1] == nItemId and tbItemInfo[2] == nDetaiId and tbItemInfo[3] == nParticularId then
						return TB_VN_ACTIVITY_MAIN[i],nItemSeq
					end
				end
			end
	end
	return nil, nil;
end
--ÓÉÊ±¼ä¶¨Î»»î¶¯ÐÅÏ¢
function gf_VnGetActivityByTime()
	local tActivityId = {}
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
		if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 then
			tinsert(tActivityId,i)
		end
	end
	return tActivityId
end

--normal task-prize api functions

--ÌìÃÅÕó»ñµÃ»î¶¯µÀ¾ß
function vaf_TianMenZhen_Award_Api(nType)
	local tActivityId = gf_VnGetActivityByTime()
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID),"tJoinTianMenZhen")
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					if nType == 1 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][5]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thiªn M«n trËn")
					elseif nType == 2 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][6]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thiªn M«n trËn")
					elseif nType == 3 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][7]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thiªn M«n trËn")
					else
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thiªn M«n trËn")
					end
				end
			else
				if nType == 1 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[5]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thiªn M«n trËn")
				elseif nType == 2 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[6]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thiªn M«n trËn")
				elseif nType == 3 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[7]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thiªn M«n trËn")
				else
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thiªn M«n trËn")
				end
			end
		end
	end
end

VAF_AWARD_API_TABLE = {
	["tPlantSmallTreePrize"] = "Trång C©y B¸t Nh· Nhá",   
	["tPlantBigTreePrize"] = "Trång C©y B¸t Nh· Lín", 
	["tOpenSeedBagPrize"] = "Më Tói H¹t Gièng", 
	["tLiangShanKillBoss"] = "L­¬ng S¬n tiªu diÖt BOSS", 
	["tLiangShanDailyTask"] = "L­¬ng S¬n v­ît ¶i nhiÖm vô h»ng ngµy", 
	["tWanJianZhong"] = "Qua ¶i V¹n KiÕm Tròng", 
	["tTongTianHuanJing"] = "Qua ¶i Th«ng Thiªn", 
	["tPlant4LingTree"] = "Trång C©y Tø Linh", 
	["tPlantSeedTree"] = "Trång C©y H¹t Gièng",
	["tLiangShanJinBox"] = "L­¬ng S¬n-R­¬ng Vµng",
	["tLiangShanYinBox"] = "L­¬ng S¬n-R­¬ng B¹c",
	["tLiangShanTongBox"] = "L­¬ng S¬n-R­¬ng §ång",
	["tWjzDailyTask"] = "NhiÖm vô V¹n KiÕm Tròng",
	["tWjzJinBox"] = "V¹n KiÕm Tròng-R­¬ng Vµng",
	["tWjzYinBox"] = "V¹n KiÕm Tròng-R­¬ng B¹c",
	["tWjzTongBox"] = "V¹n KiÕm Tròng-R­¬ng §ång",
	["tDXGDailyTask"] = "NhiÖm vô §Þa HuyÒn Cung",
	["tDXGJinBox"] = "§Þa HuyÒn Cung-R­¬ng Vµng",
	["tDXGYinBox"] = "§Þa HuyÒn Cung-R­¬ng B¹c",
	["tDXGTongBox"] = "§Þa HuyÒn Cung-R­¬ng §ång",
	["tTYTJinBox"] = "R­¬ng Vµng Th¸i NhÊt Th¸p-Th­êng",
	["tTYTYinBox"] = "R­¬ng B¹c Th¸i NhÊt Th¸p-Th­êng",
	["tTYTTongBox"] = "R­¬ng §ång Th¸i NhÊt Th¸p-Th­êng",
	["tTYTJinBox_H"] = "Th¸i NhÊt Th¸p Anh Hïng_R­¬ng Vµng",
	["tTYTYinBox_H"] = "Th¸i NhÊt Th¸p Anh Hïng_R­¬ng B¹c",
	["tTYTTongBox_H"] = "Th¸i NhÊt Th¸p Anh Hïng_R­¬ng §ång",
}

function vaf_award_api(szKey)
	local tActivityId = gf_VnGetActivityByTime()
	if not VAF_AWARD_API_TABLE[szKey] then return end
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID), szKey)
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, VAF_AWARD_API_TABLE[szKey])
				end
			else
				gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, VAF_AWARD_API_TABLE[szKey])
			end
		end
	end
end


--kill npcÉ±Ò°¹ÖµôÂä
function vaf_kill_npc_drop()
	local tActivityId = gf_VnGetActivityByTime()
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID),"tKillNpc")
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					if random(100) <= (tPrizeInfo[i][6] or 10) then 
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "§¸nh qu¸i ngoµi thµnh nhËn ®­îc phÇn th­ëng ho¹t ®éng")
					end
				end
			else
				if random(100) <= (tPrizeInfo[6] or 10) then 
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "§¸nh qu¸i ngoµi thµnh nhËn ®­îc phÇn th­ëng ho¹t ®éng")
				end
			end
		end
	end
end

--»ñµÃ¾ü¹¦
function vaf_201203_GiveJunGong()
	gf_EventGiveCustomAward(31,1000,1,"Më tiÖc khao qu©n","100 lÇn gi¶i th­ëng")
end
function vaf_201204_GiveJunGong()
	gf_EventGiveCustomAward(31,100,1,"Mïa HÌ M¸t L¹nh","100 lÇn gi¶i th­ëng")
end

function gf_VnGetPrizeRandomSeed(tbPrize)
	local nRandomSeed = 0
	if not tbPrize then return end
	for i = 1,getn(tbPrize) do
		nRandomSeed = nRandomSeed + tbPrize[i][2]
	end
	return nRandomSeed
end
--attention:all the pet-award-api are here
--add pet grow award:the param is the number of award
function gf_VnGiveActivityPetGrowAward(nPetGrowAward)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (nPetGrowAward * 100)) --®iÓm n©ng cÊp
		WriteLogEx(EVENT_LOG_TITLE, "nhËn th­ëng sö dông vËt phÈm event ", 1, nPetGrowAward.." ®iÓm n©ng cÊp")
		Msg2Player("B¹n nhËn ®­îc "..nPetGrowAward.." §iÓm N©ng CÊp B¹n §ång Hµnh")
end
--add pet mp award api: the param is the number of award
function gf_VnGiveActivityPetMpAward(nPetMpAward)
	Pet_AddGP(nPetMpAward)
	WriteLogEx(EVENT_LOG_TITLE, "nhËn th­ëng sö dông vËt phÈm event ", 1, nPetMpAward.." ®iÓm linh lùc")
	Msg2Player("B¹n nhËn ®­îc "..nPetMpAward.." §iÓm Linh Lùc B¹n §ång Hµnh")
end

function Vet_Create_Activity_By_Id(nActivityID)
	TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID = nActivityID
	TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName = g_objVNAcitivityInfo:GetString(tostring(nActivityID),"sActivityName")
	TB_VN_ACTIVITY_MAIN[nActivityID].sActivityChgKey = tostring(nActivityID)
	TB_VN_ACTIVITY_MAIN[nActivityID].tbTaskGroup = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tTaskGroup")
	TB_VN_ACTIVITY_MAIN[nActivityID].nItemChgNum = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemChgNum")
	TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeItemCount") or 1
	TB_VN_ACTIVITY_MAIN[nActivityID].nFlag = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nFlag") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nGetBothFinalPrize = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nGetBothFinalPrize") or 7;
	TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeMode = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeMode") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nFinalPrizeMode = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nFinalPrizeMode") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nItemExcgPrizeCount = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemExcgPrizeCount") or 0;
	--µÀ¾ß¶Ò»»½±Àø
	TB_VN_ACTIVITY_MAIN[nActivityID].tbItemExchangePrize = {}
	for nIep = 1, TB_VN_ACTIVITY_MAIN[nActivityID].nItemExcgPrizeCount do
		TB_VN_ACTIVITY_MAIN[nActivityID].tbItemExchangePrize[nIep] = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbItemExchangePrize"..nIep)
	end
	--½±ÀøÎïÆ·Ïà¹Ø
	for nItemPrizeNum = 1,TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount do
		TB_VN_ACTIVITY_MAIN[nActivityID].tbPrizeItemInfo[nItemPrizeNum] = {
			tbItemInfo = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbPrizeItemInfo"..nItemPrizeNum),
			nTaskIdPrizeType = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdPrizeType"..nItemPrizeNum),
			nTaskIdGetFinalPrize = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdGetFinalPrize"..nItemPrizeNum),
			nTaskIdUseItemTimes = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdUseItemTimes"..nItemPrizeNum),
			tbExpPrizeNum = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbExpPrizeNum"..nItemPrizeNum),
			tbPrizeCondition = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbPrizeCondition"..nItemPrizeNum),
			tbExpPrizeName = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbExpPrizeName"..nItemPrizeNum),
			tbNormalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbNormalPrizeRoomWeight"..nItemPrizeNum),
			},
			nPrizeAdditionalTimes = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeAdditionalTimes"..nItemPrizeNum),
			tbAdditionalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbAdditionalPrizeRoomWeight"..nItemPrizeNum),
			},
			nItemUseTimesMax = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemUseTimesMax"..nItemPrizeNum),
			tbFinalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbFinalPrizeRoomWeight"..nItemPrizeNum),
				tbFinalPrizeKind = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbFinalPrizeKind"..nItemPrizeNum),
			},
			--ÀÛ¼ÆµãºÍÁì½±±ê¼Ç
			nPmAccPoint = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPmAccPoint"..nItemPrizeNum),
			nPmUsePrizeTag = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPmUsePrizeTag"..nItemPrizeNum),
			bHaveThings = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"bHaveThings"..nItemPrizeNum),
		}
	end
	return TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount;
end


--============================================================================
local ActivityMaxCount = GetEventCount();
for nGlbId = 1, ActivityMaxCount do
	if gf_CheckEventDateEx(nGlbId) == 1 then
		TB_VN_ACTIVITY_MAIN[nGlbId] = gf_Inherit(CLASS_ACTIVITY);
		local nCount = Vet_Create_Activity_By_Id(nGlbId) or 1;
		if VET_ACTIVITY_AWARD_TABLE[nGlbId] ~= nil then
			for j = 1 , nCount do			
				--¹²ÓÃ¶îÍâ½±Àø±í1
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbAdditionalPrize.tbPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][1]
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbAdditionalPrize.nRandomBase = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][1])
				--¹²ÓÃµÄ×îÖÕ½±Àø±í2,3
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.tbPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][2]
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.nRandomBase = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][2])
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.sel = VET_ACTIVITY_AWARD_TABLE[nGlbId][3][j];
				if TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition and getn(TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition) == 2 then
					--Ä£Ê½1 4
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.tbPrizeInfo1 = VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[1]]
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.nRandomBase1 = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[1]])
					--Ä£Ê½2 5
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.tbPrizeInfo2 = VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[2]]
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.nRandomBase2 = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[2]])
				end
				--ÀÛ¼ÆÁìÈ¡µÄ½±Àø(6,7ºÅË÷Òý)
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPmPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][5 + j]
				--Ê¹ÓÃµÀ¾ßµÄ½±Àø(8,9ºÅË÷Òý)
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPmFuncPrize = VET_ACTIVITY_AWARD_TABLE[nGlbId][7 + j]
			end
			--µÀ¾ß¶Ò»»½±Àø 10 - 10+Count
			TB_VN_ACTIVITY_MAIN[nGlbId].tbIEPAward = {}
			for nIep = 1, TB_VN_ACTIVITY_MAIN[nGlbId].nItemExcgPrizeCount do
				TB_VN_ACTIVITY_MAIN[nGlbId].tbIEPAward[nIep] = VET_ACTIVITY_AWARD_TABLE[nGlbId][9 + nIep]
			end
		end
		TB_VN_ACTIVITY_MAIN[nGlbId].OnGetFinalPrize = function(_,nPrizeDiff,nOrder)
				if nPrizeDiff == 1 then
					ModifyExp(25000000);
				gf_WriteLogEx(EVENT_LOG_TITLE, "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi 25000000 kinh nghiÖm")
				elseif nPrizeDiff == 2 then
					--TODO:Check match condition to add pet grow prize add here
					gf_VnGiveActivityPetGrowAward(20);
				elseif nPrizeDiff == 3 then
					--TODO:Check match condition to add pet mp prize add here
					gf_VnGiveActivityPetMpAward(1);
				elseif nPrizeDiff == 4 then
					--70¼¶¸ß¼¶ÃØ¼®	
					--vaf_Give70GaojiMiji();
					local nRoute = GetPlayerRoute()
					gf_AddItemEx2(VET_70_GAOJIMIJI_NEW[nRoute][2], tb_golden_faction_tree[nRoute][1], "Event thang 11", "nhËn phÇn th­ëng cuèi")
					Msg2Player("B¹n nhËn ®­îc 1 cuèn mËt tÞch cao cÊp 70")
					gf_WriteLogEx(EVENT_LOG_TITLE, "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi MËt TÞch")
				elseif nPrizeDiff == 5 then
					ModifyExp(nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi "..nOrder.." kinh nghiÖm")
				elseif nPrizeDiff == 6 then
					--¸ø¾ü¹¦Öµ
					gf_EventGiveCustomAward(31,nOrder,"Event thang 12","§æi phÇn th­ëng cuèi cïng");
					gf_WriteLogEx(EVENT_LOG_TITLE, "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi "..nOrder.." c«ng tr¹ng")
				elseif nPrizeDiff == 7 then
					gf_AddItemEx({2,1,9977,1},"Qu©n C«ng Huy Hoµng",1);
					gf_AddItemEx({2,1,9998,1},"Qu©n C«ng §¹i",1);
					gf_AddItemEx({2,1,9999,1},"Qu©n C«ng Ch­¬ng",1);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi  3 lo¹i qu©n c«ng")
				elseif nPrizeDiff == 8 then
					gf_AddItemEx({2,1,1009,nOrder},"Thiªn Th¹ch Tinh Th¹ch");
					gf_WriteLogEx(EVENT_LOG_TITLE, "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi Thiªn Th¹ch")
				elseif nPrizeDiff == 9 then
					--¸øÕæÆø
					AwardGenuineQi(nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi "..nOrder.." ch©n khÝ")
				elseif nPrizeDiff == 10 then
					--¸øÌìÃÅËéÆ¬
					AddItem(2,1,30410,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "M¶nh Thiªn M«n");
				elseif nPrizeDiff == 11 then
					--¸øÌìÃÅ½ðÁî
					AddItem(2,1,30370,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "Thiªn M«n Kim LÖnh");
				elseif nPrizeDiff == 12 then
					--¸øÌìî¸ËéÆ¬
					AddItem(2,1,30390,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "M¶nh Thiªn Cang");
				elseif nPrizeDiff == 13 then
					--¸ø²Ø±¦Ïä
					AddItem(2,1,30341,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "Tµng R­¬ng");
				elseif nPrizeDiff == 14 then
					--¸ø½ð×Ó
					Earn(nOrder*10000);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "Vµng");
				elseif nPrizeDiff == 15 then
					--¸øÄ¾Ïä+XU
					AddItem(2,1,30340,nOrder);
					AddItem(2,1,30230,66);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "Méc R­¬ng + XU");
				elseif nPrizeDiff == 16 then
					--²ÆÉñ±¦Ïä
					AddItem(2,1,30344,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "ThÇn Tµi B¶o R­¬ng");
				elseif nPrizeDiff == 17 then
					--²ÆÉñ±¦Ïä
					AddItem(2,1,30230,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "Xu vËt phÈm");
				elseif nPrizeDiff == 18 then
					--°´Ö°ÒµÃÅÅÉ¸ø¸ß¼¶70¼¶ÃØ¼®
					ahf_GetGaojiZhenjuan(1, nOrder, 1)
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "MËt Tich 70 Cao CÊp");
				elseif nPrizeDiff == 19 then
					--È«²¿¸ø
					gf_ModifyExp(2000000000);
					gf_EventGiveCustomAward(31,690000,EVENT_LOG_TITLE,"§æi phÇn th­ëng cuèi cïng");
					AwardGenuineQi(690000);
					--¸øÒ»Ö»ÓñÍÃ
					local nRet, nIndex = AddItem(0,105,30038,1,4,-1,-1,-1,-1,-1,-1);
					if 1 == nRet then
						SetItemExpireTime(nIndex, 3600*24 * 60);
						gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", 1, "Thá Ngäc");
					end
				elseif nPrizeDiff == 20 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_CLOTH);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "DiÖu D­¬ng Y");
				elseif nPrizeDiff == 21 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_CAP);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "DiÖu D­¬ng M¹o");
				elseif nPrizeDiff == 22 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_SHOE);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "DiÖu D­¬ng Khè");
				elseif nPrizeDiff == 23 then
					local nRet, nIndex = AddItem(2,1,1068,nOrder);
					SetItemExpireTime(nIndex, 15 * 24 * 3600);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "Thiªn Th¹ch linh th¹ch");
				elseif nPrizeDiff == 24 then
					local nRet, nIndex = AddItem(2,1,1067,nOrder);
					SetItemExpireTime(nIndex, 15 * 24 * 3600);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch");
				elseif nPrizeDiff == 25 then
					AddItem(2,0,1082,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "Th¸i DÞch Hçn Nguyªn");
				elseif nPrizeDiff == 26 then
					VetInterface_FinishReborn1();
				elseif nPrizeDiff == 27 then
					VetInterface_FinishReborn1_6();
				elseif nPrizeDiff == 28 then
					gf_ModifyExp(2000000000);
					ModifyReputation(4700,0);
					SetTask(336, GetTask(336) + 4700);
       			 		Msg2Player(format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", 4700));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "2000000000 Kinh NghiÖm + 4700 Danh Väng + 4700 S­ M«n");
				elseif nPrizeDiff == 29 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
	    	  				SetTask(701, GetTask(701) + 74000);
	    	  			else
	    	  				SetTask(701, GetTask(701) - 74000);
	    	  			end
	    	  			Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 74000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "74000 Qu©n C«ng + 1000000000 Kinh NghiÖm");
				elseif nPrizeDiff == 30 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(74000);
       	 			gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "74000 Ch©n KhÝ + 1000000000 Kinh NghiÖm");
				elseif nPrizeDiff == 31 then
					gf_ModifyExp(2000000000);
					ModifyReputation(3900,0);
					SetTask(336, GetTask(336) + 3900);
       	 				Msg2Player(format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", 3900));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "2000000000 ®iÓm kinh nghiÖm + 3900 ®iÓm danh väng + 3900 ®iÓm s­ m«n");
				elseif nPrizeDiff == 32 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
	    	  				SetTask(701, GetTask(701) + 79000);
	    	  			else
	    	  				SetTask(701, GetTask(701) - 79000);
	    				end
	    	 			 Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 79000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "79000 ®iÓm qu©n c«ng + 1000000000 ®iÓm kinh nghiÖm");
				elseif nPrizeDiff == 33 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(79000);
       	 				gf_WriteLogEx("Ho¹t ®éng ViÖt Nam", "§æi phÇn th­ëng cuèi cïng", nOrder, "79000 ®iÓm ch©n khÝ + 1000000000 ®iÓm kinh nghiÖm");
			       	elseif nPrizeDiff == 34 then
			       		gf_ModifyExp(2000000000);
					ModifyReputation(4444,0);
					SetTask(336, GetTask(336) + 4444);
			       	 	Msg2Player(format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", 4444));
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "2000000000 ®iÓm kinh nghiÖm+4444 ®iÓm danh väng +4444 ®iÓm s­ m«n ");
			       	elseif nPrizeDiff == 35 then
			       		gf_ModifyExp(1500000000);
					if GetTask(701) >= 0 then
				    		SetTask(701, GetTask(701) + 77777);
				    	  else
				    	  	SetTask(701, GetTask(701) - 77777);
				    	  end
				    	  Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 77777));
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "77777 ®iÓm c«ng tr¹ng +1500000000 ®iÓm kinh nghiÖm");
			       	elseif nPrizeDiff == 36 then
			       		AwardGenuineQi(77777);
			       		gf_ModifyExp(1500000000);
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "77777 ®iÓm c«ng tr¹ng +1500000000 ®iÓm kinh nghiÖm");
				elseif nPrizeDiff == 37 then
					VetInterface_Reborn()
				elseif nPrizeDiff == 38 then
					gf_ModifyExp(1500000000);
					ModifyReputation(5000,0);
					SetTask(336, GetTask(336) + 5000);
       	 				Msg2Player(format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", 5000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "1500000000 ®iÓm kinh nghiÖm +5000 ®iÓm danh väng +5000 ®iÓm s­ m«n ");								
				elseif nPrizeDiff == 39 then
					gf_ModifyExp(1500000000);
					if GetTask(701) >= 0 then
			    	  		SetTask(701, GetTask(701) + 39000);
			    		else
			    	  		SetTask(701, GetTask(701) - 39000);
			    		end
			    	 	Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 39000));
		       	 	  	gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "1500000000 ®iÓm kinh nghiÖm +39000 ®iÓm qu©n c«ng ");
				elseif nPrizeDiff == 40 then
					gf_ModifyExp(1500000000);
					AwardGenuineQi(39000);
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "1500000000 ®iÓm kinh nghiÖm +39000 ®iÓm ch©n khÝ ");		
				elseif nPrizeDiff == 41 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thiªn Th¹ch linh th¹ch", "Ho¹t ®éng ViÖt Nam", "1000000000EXP+01 Thiªn th¹ch linh th¹ch (30 ngµy)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 42 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", "Ho¹t ®éng ViÖt Nam", "1000000000 EXP + 01 §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch (30 ngµy)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 43 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 30345, 1}, "ChuyÓn Sinh §¬n ", "Ho¹t ®éng ViÖt Nam", "1000000000 EXP + 01 ChuyÓn Sinh §¬n", 0, 1);
				elseif nPrizeDiff == 44 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
						SetTask(701, GetTask(701) + 39000);
					else
						SetTask(701, GetTask(701) - 39000);
					end
					Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 39000));
					gf_WriteLogEx("Ho¹t ®éng ViÖt Nam", "§æi phÇn th­ëng cuèi cïng", nOrder, "1000000000 EXP + 39000 ®iÓm qu©n c«ng");
				elseif nPrizeDiff == 45 then
					gf_ModifyExp(1500000000);
					gf_AddItemEx2({2, 1, 1113, 1}, "§¹i §Þnh Hån ", "Ho¹t ®éng ViÖt Nam", "1500000000 EXP + 01 §¹i §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch (30 ngµy)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 46 then
					gf_ModifyExp(2000000000);
				elseif nPrizeDiff == 47 then
					gf_ModifyExp(1000000000);
					ModifyReputation(5000,0);
					SetTask(336, GetTask(336) + 5000);
					Msg2Player(format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", 5000));
					gf_WriteLogEx("Ho¹t ®éng ViÖt Nam", "§æi phÇn th­ëng cuèi cïng", nOrder, "1000000000 EXP + 5000 ®iÓm danh väng + 5000 ®iÓm s­ m«n");
				elseif nPrizeDiff == 48 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 30345, 1}, "ChuyÓn Sinh §¬n ", "Ho¹t ®éng ViÖt Nam", "1000000000 EXP + 01 ChuyÓn Sinh §¬n (60 ngµy, cã thÓ giao dÞch)", 60 * 24 * 3600, 1);
				elseif nPrizeDiff == 49 then
					Event_PhucSinhPET()
				elseif nPrizeDiff == 50 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thiªn Th¹ch linh th¹ch", "Ho¹t ®éng ViÖt Nam", "1000000000 EXP + 01 Thiªn Th¹ch Linh Th¹ch (15 ngµy)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 51 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", "Ho¹t ®éng ViÖt Nam", "1000000000 EXP + 01 §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch (15 ngµy)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 52 then
					gf_ModifyExp(2000000000);
					if GetTask(701) >= 0 then
						SetTask(701, GetTask(701) + 9999);
					else
						SetTask(701, GetTask(701) - 9999);
					end
					Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 9999));
					gf_AddItemEx2({2, 1, 30344, 2}, "ThÇn Tµi B¶o R­¬ng", "Ho¹t ®éng ViÖt Nam", "2000000000 EXP + 9999 ®iÓm c«ng tr¹ng + 02 ThÇn Tµi B¶o R­¬ng + 01 §¹i §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch (15 ngµy)", 0, 1);
					gf_AddItemEx2({2, 1, 1113, 1}, "§¹i §Þnh Hån ", EVENT_LOG_TITLE, "2000000000 EXP + 9999 ®iÓm c«ng tr¹ng + 02 ThÇn Tµi B¶o R­¬ng + 01 §¹i §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch (15 ngµy)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 53 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thiªn Th¹ch linh th¹ch", EVENT_LOG_TITLE, "1000000000 EXP + 01 Thiªn Th¹ch Linh Th¹ch (07 ngµy)", 7 * 24 * 3600, 1);
				elseif nPrizeDiff == 54 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", "Ho¹t ®éng ViÖt Nam", "1000000000 EXP + 01 §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch (07 ngµy)", 7 * 24 * 3600, 1);
				elseif nPrizeDiff == 55 then
					gf_VnGiveActivityPetGrowAward(300);
					gf_VnGiveActivityPetMpAward(200);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "300 ®iÓm n©ng cÊp + 200 ®iÓm linh lùc");		
				elseif nPrizeDiff == 56 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(39000);
					gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", nOrder, "1000000000 EXP + 39000 ®iÓm ch©n khÝ");		
				elseif nPrizeDiff == 57 then
					Event_PhucSinhPET()	--Vet_Complete_Revive_OnePartner_FirstStage();
				elseif nPrizeDiff == 58 then
					Vet_Complete_Revive_OnePartner_SecondStage();
				end
			end
	end
end

--============================================================================

function Vet_Activity_GetLastPrizeBoth(nTaskGrouId,nTaskIDSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	if Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize) == 1 then
		Talk(1,"",tbActivity.tbHintString[7]);
		return
	end
	for i = 1, tbActivity.nPrizeItemCount do
		if Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbActivity.tbPrizeItemInfo[i].nTaskIdUseItemTimes) < tbActivity.tbPrizeItemInfo[i].nItemUseTimesMax then
			Talk(1,"",format(tbActivity.tbHintString[6],tbActivity.tbPrizeItemInfo[i].tbItemInfo[4],tbActivity.tbPrizeItemInfo[i].nItemUseTimesMax));
			return
		end
	end
	if tbActivity.nFlag == 1 then
		--70Îª9ÔÂ»î¶¯
		if tbActivity.nActivityID == 70 then
			Say("Tiªu hao <color=red>500<color> Xu vËt phÈm nhËn ®­îc mét thó c­ìi míi \n <color=green> Thá Ngäc  \n Tèc ®é di chuyÓn 120%\n §é bÒn 888/888\n h¹n sö dông 60 ngµy cã thÓ giao dÞch b»ng Cµn Kh«n Phï <color>\n",2,"§ång ý/#Vet_Activity_GetAdditionPrize("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")","T¹i h¹ chØ xem qua th«i/nothing");
			return
		end
		--76ÎªÊ¥µ®»î¶¯
		if tbActivity.nActivityID == 76 then
			Say(format("Tiªu hao <color=red>%dXU<color> nhËn ®­îc 1 <color=green>Xe TuÇn Léc<color> (h¹n sö dông 45 ngµy) vµ <color=green>Bé ngo¹i trang Noel<color> (cã thÓ giao dÞch)", 888), 2, "§ång ý/#Vet_Activity_GetAdditionPrize_76("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T¹i h¹ chØ xem qua th«i/nothing");
			return
		end
		--103,11ÔÂ»î¶¯
		if tbActivity.nActivityID == 103 then
			Say("NhËn tÊt c¶ phÇn th­ëng 2.000.000.000 kinh nghiÖm vµ 2 Trïng Sinh §¬n ( 30 ngµy)", 2, "§ång ý/#Vet_Activity_GetAdditionPrize_103("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T¹i h¹ chØ xem qua th«i/nothing")
			return
		end
		--107,1ÔÂ»î¶¯
		if tbActivity.nActivityID == 107 then
			Say("PhÇn th­ëng sö dông B¸nh Ch­ng vµ B¸nh TÐt ®¹t ®Õn giíi h¹n", 2, "§ång ý/#Vet_Activity_GetAdditionPrize_107("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T¹i h¹ chØ xem qua th«i/nothing")
			return
		end
		--112,2ÔÂ»î¶¯
		if tbActivity.nActivityID == 112 then
			Say("PhÇn th­ëng sö dông Chocolare Chips Muffin vµ  Dark Chocolate tèi ®a ", 2, "§ång ý/#Vet_Activity_GetAdditionPrize_112("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T¹i h¹ chØ xem qua th«i/nothing")
			return
		end
		--123,5ÔÂ»î¶¯
		if tbActivity.nActivityID == 123 then
			Say("2000000000 ®iÓm kinh nghiÖm +01 chuyÓn sinh ®¬n (30 ngµy )+200®iÓm linh lùc pet ", 2, "§ång ý/#Vet_Activity_GetAdditionPrize_123("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T¹i h¹ chØ xem qua th«i/nothing")
			return
		end
		--135,10ÔÂ»î¶¯
		if tbActivity.nActivityID == 135 then
			Say("Chän phÇn th­ëng sö dông tèi ®a c¶ 2 lo¹i", 3, "Hoµn thµnh giai ®o¹n 2 nhiÖm vô Phôc sinh B¹n §ång Hµnh (tiªu hao 2500 tiªu dao ngäc)/#Vet_Activity_GetAdditionPrize_135("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "Chän phÇn th­ëng 2 tû ®iÓm kinh nghiÖm/#Vet_Activity_GetAdditionPrize_135a("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T¹i h¹ chØ xem qua th«i/nothing")
--			Say("Hoµn thµnh giai ®o¹n 2 cña phôc sinh ®ång hµnh (Tiªu hao 2500 Tiªu Dao Ngäc) (Nh©n vËt cÇn hoµn thµnh giai ®o¹n 1 cña phôc sinh ®ång hµnh míi cã thÓ nhËn th­ëng)", 2, "§ång ý/#Vet_Activity_GetAdditionPrize_135("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T¹i h¹ chØ xem qua th«i/nothing")
			return
		end
	end
end

function Vet_Activity_GetAdditionPrize(nActivityID,nTaskGrouId,nTaskIDSeq)
	tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if GetItemCount(2,1,30230) < 500 then
		Talk(1,"",format("Xu vËt phÈm kh«ng ®ñ <color=red>%d<color> c¸i",500));
		return
	end
	if gf_Judge_Room_Weight(1,0," ") ~= 1 then
	 return
	end
	if DelItem(2,1,30230,500) == 1 then
		--ÉèÖÃÒÑÁìÈ¡±ê¼Ç
		Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
		local nRet,nItemIndex = AddItem(0,105,30038,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(nItemIndex, 60 * 24 * 60 * 60);
	end
end

-- Mo rong doi event
function VNG_DoiEvent_Form1()
	AskClientForNumber("VNG_DoiEvent_Kieu1", 1, 999, "Sè l­îng (1-999)")
end

function VNG_DoiEvent_Kieu1(nCount)
	local tbCheckCase = {
		[1] = {6500},
		[2] = {3500},
		[3] = {0},
	}
	if gf_Judge_Room_Weight(3, 100, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30741) < (6 * nCount ) or GetItemCount(2,1,30742) < (6 * nCount ) or GetItemCount(2,1,30603) < (2 * nCount)  then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi.");
		return 0;
	end
	local nTem = 0
	local tbAwardRate = {[1] = 0, [2] = 0, [3] = 0,}
	for i=1,nCount do
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
--		local nIndex = mod(random(1,1000),2) + 1
		tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
	end
	
	if DelItem(2,1,30741 , 6 * nCount) == 1 and DelItem(2,1,30742 , 6 * nCount) == 1 and DelItem(2,1,30603, 2 * nCount) == 1 then
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2,1,30743, tbAwardRate[1]}, "Tranh Th­ Ph¸p", EVENT_LOG_TITLE , "nhËn")
		end
		if tbAwardRate[2] > 0 then
			gf_AddItemEx2({2,1,30744, tbAwardRate[2]}, "Tranh Th­ Ph¸p §Æc BiÖt", EVENT_LOG_TITLE , "nhËn")
		end
--		if tbAwardRate[3] > 0 then
--			gf_AddItemEx2({2, 1, 30709, tbAwardRate[3]}, "ChÌ H¹t Sen", EVENT_LOG_TITLE , "nhËn")
--		end		
	end
end
function VNG_DoiEvent_Form2()
	AskClientForNumber("VNG_DoiEvent_Kieu2", 1, 999, "Sè l­îng (1-999)")
end

function VNG_DoiEvent_Kieu2(nCount)
	local tbCheckCase = {
		[1] = {10000},
		[2] = {0},
		[3] = {0},
	}
	if gf_Judge_Room_Weight(3, 100, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30632 ) < (5 * nCount ) or GetItemCount(2,1,30633 ) < (5 * nCount ) or GetItemCount(2,1,30230 ) < (2 * nCount ) then	--GetCash() < (100000 * nCount) 
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi.");
		return 0;
	end
	local nTem = 0
	local tbAwardRate = {[1] = 0, [2] = 0, [3] = 0}
	for i=1,nCount do
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
--		local nIndex = mod(random(1,1000),2) + 1	
		tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
	end
	
	if DelItem(2,1,30632, 5 * nCount) == 1 and DelItem(2,1,30633, 5 * nCount) == 1 and DelItem(2,1,30230, 2 * nCount) == 1 then	--Pay(100000*nCount)
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2, 1, 30635, tbAwardRate[1]}, "Hoa 8/3", EVENT_LOG_TITLE , "nhËn")
		end
--		if tbAwardRate[2] > 0 then
--			gf_AddItemEx2({2, 1, 30607, tbAwardRate[2]}, "Hoa §iÓm 10", EVENT_LOG_TITLE , "nhËn")
--		end
--		if tbAwardRate[3] > 0 then
--			gf_AddItemEx2({2, 1, 30608, tbAwardRate[3]}, "B»ng Khen", EVENT_LOG_TITLE , "nhËn")
--		end		
	end
end

function VNG_DoiEvent_Form3()
	AskClientForNumber("VNG_DoiEvent_Kieu3", 1, 999, "Sè l­îng (1-999)")
end

function VNG_DoiEvent_Kieu3(nCount)
	if gf_Judge_Room_Weight(4, 100, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30512) < (5 * nCount ) or GetItemCount(2,1,30603) < (2 * nCount)  then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi.");
		return 0;
	end

	if DelItem(2,1,30512, 5 * nCount) == 1 and DelItem(2,1,30603, 2 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30514, nCount}, "MÇm C©y", EVENT_LOG_TITLE , "nhËn")
	end
end

function VNG_DoiEvent_Form4()
	AskClientForNumber("VNG_DoiEvent_Kieu4", 1, 999, "Sè l­îng (1-999)")
end

function VNG_DoiEvent_Kieu4(nCount)
	if gf_Judge_Room_Weight(4, 100, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30512) < (5 * nCount ) or GetItemCount(2,1,30513) < (1 * nCount)  then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi.");
		return 0;
	end

	if DelItem(2,1,30512, 5 * nCount) == 1 and DelItem(2,1,30513, 1 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30514, nCount}, "MÇm C©y", EVENT_LOG_TITLE , "nhËn")
	end
end

function Vet_Activity_GetAdditionPrize_76(nActivityID,nTaskGrouId,nTaskIDSeq)
	tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	local nCount = 888;
	if GetItemCount(2,1,30230) < nCount then
		Talk(1,"",format("Xu vËt phÈm kh«ng ®ñ <color=red>%d<color> c¸i",nCount));
		return
	end
	if gf_Judge_Room_Weight(4,100," ") ~= 1 then
	 return
	end
	if DelItem(2,1,30230,nCount) == 1 then
		--ÉèÖÃÒÑÁìÈ¡±ê¼Ç
		Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
		--¸øÑ±Â¹³µ
		local nRet,nItemIndex = AddItem(0,105,30041,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(nItemIndex, 45 * 24 * 3600);
		--¸øÊ¥µ®Ì××°
		local tChrismas = {
			{{"Nãn gi¸ng sinh chuÈn", {0,108,109,1}}, {"Nãn gi¸ng sinh kh«i ng«", {0,108,110,1}}, {"Nãn gi¸ng sinh gîi c¶m", {0,108,112,1}}, {"Nãn gi¸ng sinh nhá", {0,108,111,1}}},
			{{"Th­îng y gi¸ng sinh chuÈn", {0,109,109,1}}, {"Gi¸ng sinh kh«i ng«", {0,109,110,1}}, {"Th­¬ng y gi¸ng sinh gîi c¶m", {0,109,112,1}}, {"Th­¬ng y gi¸ng sinh KiÒu n÷", {0,109,111,1}}},
			{{"H¹ y Gi¸ng sinh chuÈn", {0,110,73,1}}, {"Trang phôc gi¸ng sinh kh«i ng«", {0,110,74,1}}, {"H¹ y gi¸ng sinh n÷ gîi c¶m", {0,110,76,1}}, {"Gi¸ng sinh KiÒu n÷", {0,110,75,1}}},
		};
		local nBody = GetBody();
		local nSize = getn(tChrismas);
		for i = 1, nSize do
			gf_AddItemEx2(tChrismas[i][nBody][2], tChrismas[i][nBody][1], "Ho¹t ®éng Gi¸ng sinh", "PhÇn th­ëng cuèi", 45 * 24 * 3600, 1)
		end
	end
end

function get_random_event_ittem(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i			
		end
	end	
end

function Vet_Update_Pet(nPoint)
	if not nPoint or nPoint <= 0 then
		return 0;
	end
	--Interface, complete by vet!
	--do something
	if nPoint == 50 then
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (50 * 100)) --®iÓm n©ng cÊp
		WriteLogEx(EVENT_LOG_TITLE, "nhËn th­ëng sö dông vËt phÈm event ", 1, "50 ®iÓm n©ng cÊp")
		Msg2Player("B¹n nhËn ®­îc 50 §iÓm N©ng CÊp B¹n §ång Hµnh")
	end
	if nPoint == 10 then
		Pet_AddGP(10)
		WriteLogEx(EVENT_LOG_TITLE, "nhËn th­ëng sö dông vËt phÈm event ", 1, "10 ®iÓm linh lùc")
		Msg2Player("B¹n nhËn ®­îc 10 §iÓm Linh Lùc B¹n §ång Hµnh")
	end
end

function Vet_Activity_GetAdditionPrize_103(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
		return
	end
	--ÉèÖÃÒÑÁìÈ¡±ê¼Ç
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({2,1,30345,2}, "ChuyÓn Sinh §¬n ", EVENT_LOG_TITLE, "§æi phÇn phÇn th­ëng cuèi", 30*24*3600, 1);
end

--need to complete by VET-----------------------------------
function VetInterface_ConditionCheck1()
	if GetTask(TSK_CS6_TULINH) > 1 then
		Talk(1, "", "§¹i hiÖp ®· hoµn thµnh nhiÖm vô giai ®o¹n nµy råi, nªn kh«ng cÇn l·o phu gióp ®ì n÷a.")
		return 0
	end
	if GetTask(TSK_CS6_TULINH) ~= 1 or GetItemCount(2,1,30490) <2 then
		Talk(1, "", "§¹i hiÖp ch­a  nhËn nhiÖm vô chuyÓn sinh 6 hoÆc kh«ng cã ®ñ 2 Hoµng Kim §¹i Ng©n PhiÕu")
		return 0
	else
		return 1
	end
end

function VetInterface_FinishReborn1()
	if GetTask(TSK_CS6_TULINH) == 1 then
		if DelItem(2,1,30490,2) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			Talk(1, "", "Ta ®· truyÒn thô phÇn ®Çu cña bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp råi, b©y giê ®¹i hiÖp h·y ®i t×m Viªn Quan Tho¸i NhiÖm ®Ó l·nh gi¸o phÇn cßn l¹i !!!!")
			TaskTip("Ta ®· truyÒn thô phÇn ®Çu cña bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp råi, b©y giê ®¹i hiÖp h·y ®i t×m Viªn Quan Tho¸i NhiÖm ®Ó l·nh gi¸o phÇn cßn l¹i !!!!")
			return 1
		else
			return 0
		end
	else
		return 0
	end
end

function VetInterface_ConditionCheck1_6()
	if GetTask(TSK_CS6_TULINH) ~= 1 then
		return 0
	else
		return 1
	end
end

function VetInterface_FinishReborn1_6()
	if GetTask(TSK_CS6_TULINH) == 1 then
		if DelItem(2,1,30490,2) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			TaskTip("Ta ®· truyÒn thô phÇn ®Çu cña bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp råi, b©y giê ®¹i hiÖp h·y ®i t×m Viªn Quan Tho¸i NhiÖm ®Ó l·nh gi¸o phÇn cßn l¹i !!!!")
			return 1
		else
			return 0
		end
	else
		return 0
	end
end

function VetInterface_Reborn_ConditionCheck()
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"",format("sè ngäc tiªu dao trong tói kh«ng ®ñ %d c¸i ", 999))
		return 0
	end
	if DelItem(2,1,30603,999) == 1 then
		return 1
	end
	return 0
end

function VetInterface_Reborn()
	--finish Reborn 7
	--do something
--	if VetInterface_Reborn_ConditionCheck() ~= 1 then
--		return 0
--	end

	if GetTask(TSK_CS6_TULINH) == 1 then
--		if DelItem(2,1,30603,999) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			TaskTip("Ta ®· truyÒn thô phÇn ®Çu cña bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp råi, b©y giê ®¹i hiÖp h·y ®i t×m Viªn Quan Tho¸i NhiÖm ®Ó l·nh gi¸o phÇn cßn l¹i !!!!")
			return 1
--		else
--			return 0
--		end
	else
		Talk(1,"", "Ta kh«ng thÓ truyÒn thô bÝ kÝp nµy cho ®¹i hiÖp !!!!")
		return 0
	end
end

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

function Vet_Complete_Revive_OnePartner_SecondStage()	--(nActivityID,nTaskGrouId,nTaskIDSeq)
--	local nCheck = GetTask(2788)
--	if nCheck >= 1 then
--		Talk("B¹n ®· nhËn phÇn th­ëng cuèi khi sö dông tèi ®a 2 vËt phÈm råi.")
--		return 0
--	end
	local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10)
	if mod(nIsPS,10) >= 1 then
		Talk(1,"","B¹n ®ång hµnh ®· phôc sinh råi nªn kh«ng thÓ nhËn phÇn th­ëng nµy.")
		return 0
	end
--	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	
--	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nCurGodPoint < 999 then
		Talk(1,"","B¹n ®ång hµnh ch­a ®ñ 999 ®iÓm linh lùc")
		return
	end
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"","Tiªu Dao Ngäc trong tói kh«ng ®ñ 999 c¸i")
		return
	end
	local checka = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_A,10,5)
	local checkb = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_B,10,3)	
	if checka < 160160 or checkb < 3303030 then
		Talk(1, "", "B¹n ch­a hoµn thµnh giai ®o¹n 1 nhiÖm vô phôc sinh b¹n ®ång hµnh nªn kh«ng thÓ nhËn phÇn th­ëng !!!!")
		return 0
	end	

--	gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", 2500, "Tiªu hao Tiªu Dao Ngäc hoµn thµnh giai ®o¹n 2 cña phôc sinh ®ång hµnh");		
	--ÉèÖÃÒÑÁìÈ¡±ê¼Ç
--	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	local szNpcName = "<color=green>Sù kiÖn Event th¸ng 11<color>: "
	local tSay = {}
	local tHeader = szNpcName.." §¹i hiÖp h·y chän h­íng Phôc Sinh cho B¹n §ång Hµnh cña m×nh."
	tinsert(tSay, format("Hç trî hÖ Néi C«ng/#add_buffEvent2(1)"))		
	tinsert(tSay, format("Hç trî hÖ Ngo¹i C«ng/#add_buffEvent2(2)"))		
	--tinsert(tSay, "Hç trî hÖ Ngo¹i C«ng/#add_buffEvent(2,tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")")	

	tinsert(tSay, "Ta chØ ghÐ qua th«i/nothing")
	Say(tHeader, getn(tSay), tSay)	
end

------------------------------------------------------------


function Vet_Activity_GetAdditionPrize_107(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	--ÉèÖÃÒÑÁìÈ¡±ê¼Ç
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	if GetTask(701) >= 0 then
		SetTask(701, GetTask(701) + 20000);
	else
		SetTask(701, GetTask(701) - 20000);
	end
	Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 20000));
	AwardGenuineQi(20000);
 	gf_WriteLogEx("Ho¹t ®éng ViÖt Nam", "PhÇn th­ëng sö dông B¸nh Ch­ng vµ B¸nh TÐt ®¹t ®Õn giíi h¹n", "2000000000 ®iÓm kinh nghiÖm + 20000 ®iÓm ch©n khÝ + 20000 ®iÓm qu©n c«ng");
end

function Vet_Activity_GetAdditionPrize_112(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	--ÉèÖÃÒÑÁìÈ¡±ê¼Ç
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	if GetTask(701) >= 0 then
		SetTask(701, GetTask(701) + 20000);
    else
		SetTask(701, GetTask(701) - 20000);
	end
	Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 20000));
	AwardGenuineQi(20000);
	AddItem(2,1,30497,200,4);
 	gf_WriteLogEx("Ho¹t ®éng ViÖt Nam", "PhÇn th­ëng sö dông Chocolare Chips Muffin vµ  Dark Chocolate tèi ®a ", "2000000000 ®iÓm kinh nghiÖm + 20000 ®iÓm ch©n khÝ +20000 ®iÓm c«ng tr¹ng +200 Ma Tinh");
end

function Vet_Activity_GetAdditionPrize_123(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	local nLevel = mod(TASK_VNG_PET,100)
	if nLevel < 2 then
			Msg2Player("B¹n ch­a cã PET cÊp 1 nªn kh«ng thÓ nhËn phÇn th­ëng nµy")
			return
	end
	--ÉèÖÃÒÑÁìÈ¡±ê¼Ç
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({2, 1, 30345, 1}, "ChuyÓn Sinh §¬n ", "Ho¹t ®éng ViÖt Nam", "Sö dông  sero d©u t­¬i vµ sero b¹c hµ  ®¹t ®­îc phÇn th­ëng cao nhÊt", 30 * 24 * 3600, 1)
	Pet_AddGP(200)
	Msg2Player("B¹n nhËn ®­îc 200 §iÓm Linh Lùc B¹n §ång Hµnh")
	gf_WriteLogEx(EVENT_LOG_TITLE, "PhÇn th­ëng sö dông tèi ®a", "PhÇn th­ëng sö dông tèi ®a 2 lo¹i");
	--complete by vet
	--pet value
	--do something
end

function Vet_201403_UseItemAward()
	--¸ø½±Àø
	gf_Modify("Exp",600000)
	gf_Modify("Rep",1);
	SetTask(336, GetTask(336) + 1);
	Msg2Player(format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", 1));
	local tItem = {
		{1, 95},
		{2, 4},
		{3, 1},
	}
	local nIndex = gf_GetRandItemByTable(tItem, gf_SumRandBase(tItem), 1)
	gf_AddItemEx2({2,1,30636, tItem[nIndex][1]}, "8/3 tÝn vËt", "2XU", "Sö dông item nhËn th­ëng ", 0, 1)
end

function Vet_201404_UseItemAward()
	--¸ø½±Àø
	local tExp = {
		[0] = 500000,
		[1] = 650000,
		[2] = 650000,
		[3] = 650000,
		[4] = 650000,
		[5] = 650000,
		[6] = 1500000,
		[7] = 2000000,
	}
	local nReb = gf_GetPlayerRebornCount()
	if tExp[nReb] then
		gf_Modify("Exp",tExp[nReb])
	end
	gf_Modify("Rep",1);
	SetTask(336, GetTask(336) + 1);
  Msg2Player(format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", 1));
  local tItem = {
  	{1, 85},
  	{2, 8},
  	{3, 4},
  	{4, 2},
  	{5, 1},
  }
  local nIndex = gf_GetRandItemByTable(tItem, gf_SumRandBase(tItem), 1)
  gf_AddItemEx2({2,1,30641, tItem[nIndex][1]}, "tö s¾c b¶o th¹ch ", "2XU", "Sö dông item nhËn th­ëng ", 0, 1)
end

function Pet_AddGP(nPoint)
	if IsPlayerDeath() == 1 then
		return
	end
	tRequireElement =
	{
				[1] = {0},
				[2] = {200},
				[3] = {600},
				[4] = {30000},
	}
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurGodPoint + nPoint <= tRequireElement[nCurLevel][1] then
		nCurGodPoint = nCurGodPoint +nPoint
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
	else
		nCurGodPoint = tRequireElement[nCurLevel][1]
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
		Msg2Player("B¹n §ång Hµnh ®· ®¹t ®­îc ®iÓm Linh Lùc tèi ®a cña cÊp, kh«ng thÓ t¨ng thªm.")
	end
end
function Event_PhucSinhPET()
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_A,160160,10,5)
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_B,3303030,10,3)
	Msg2Player("B¹n ®· hoµn thµnh giai ®o¹n 1 nhiÖm vô phôc sinh b¹n ®ång hµnh")
end

function Vet_Activity_GetAdditionPrize_135(nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B¹n ®· nhËn phÇn th­ëng cuèi khi sö dông tèi ®a 2 vËt phÈm råi.")
		return 0
	end
	local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10)
	if mod(nIsPS,10) >= 1 then
		Talk(1,"","B¹n ®ång hµnh ®· phôc sinh råi nªn kh«ng thÓ nhËn phÇn th­ëng nµy.")
		return 0
	end
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	if GetItemCount(2,1,30603) < 999 then
		Say(format("Tiªu Dao Ngäc trong tói kh«ng ®ñ %d", 999), 0);
		return
	end
	local checka = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_A,10,5)
	local checkb = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_B,10,3)	
	if checka < 160160 or checkb < 3303030 then
		Talk(1, "", "B¹n ch­a hoµn thµnh giai ®o¹n 1 nhiÖm vô phôc sinh b¹n ®ång hµnh nªn kh«ng thÓ nhËn phÇn th­ëng !!!!")
		return 0
	end	
	if DelItem(2,1,30603,999) ~= 1 then
		return 0;
	end

--	gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", 2500, "Tiªu hao Tiªu Dao Ngäc hoµn thµnh giai ®o¹n 2 cña phôc sinh ®ång hµnh");		
	--ÉèÖÃÒÑÁìÈ¡±ê¼Ç
--	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	local szNpcName = "<color=green>Sù kiÖn Event th¸ng 11<color>: "
	local tSay = {}
	local tHeader = szNpcName.." §¹i hiÖp h·y chän h­íng Phôc Sinh cho B¹n §ång Hµnh cña m×nh."
	tinsert(tSay, format("Hç trî hÖ Néi C«ng/#add_buffEvent(1,%s%s%s)",tbActivity.nActivityID,nTaskGrouId,nTaskIDSeq))		
	tinsert(tSay, format("Hç trî hÖ Ngo¹i C«ng/#add_buffEvent(2,%s%s%s)",tbActivity.nActivityID,nTaskGrouId,nTaskIDSeq))		
	--tinsert(tSay, "Hç trî hÖ Ngo¹i C«ng/#add_buffEvent(2,tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")")	

	tinsert(tSay, "Ta chØ ghÐ qua th«i/nothing")
	Say(tHeader, getn(tSay), tSay)	
end

function add_buffEvent(nWay,nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B¹n ®· nhËn phÇn th­ëng cuèi khi sö dông tèi ®a 2 vËt phÈm råi.")
		return 0
	end
	local tNoiNgoai = {
			 [1] = {
						{"Néi C«ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh Lùc +6000", "state_life_max_point_add", 8000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Kh¸ng tÊt c¶ +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo¹i C«ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh Lùc +6000", "state_life_max_point_add", 10000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Néi phßng/Ngo¹i phßng +60", "state_i_defence_point_add", 60},
						{"Ngo¹i phßng +60", "state_o_defence_point_add", 60},
					},
				}
	local t_pet_type = {
									[1] = {"Thá tr¾ng",3333,24},
									[2] = {"Thá x¸m",3333,25},
									[3] = {"Thá ®en",3334,26},		
								}	
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);		
	SetTask(2788,1)	--nhËn phÇn th­ëng cuèi khi sö dông tèi ®a 2 vËt phÈm
	SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 3 lµ hoµn thµnh xong giai ®o¹n 2
	gf_WriteLogEx("PHUC SINH PET", "xong giai ®o¹n 2", 1, "Hoµn thµnh Giai §o¹n 2")												
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 lµ gi¸ trÞ x¸c ®Þnh cã Phôc Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi¸ trÞ x¸c ®Þnh cã Phôc Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi¸ trÞ x¸c ®Þnh sè lÇn Phôc Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set h­íng Phôc Sinh cña PET
		-------------Set c¸c chØ sè buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET míi
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Chóc mõng ®¹i hiÖp ®· chiªu mé PET thµnh c«ng")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add thÊt b¹i", 1, "Add pet thÊt b¹i")			
		end
		-------------
		Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô Phôc Sinh cho B¹n §ång Hµnh !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai ®o¹n 2", 1, "Hoµn thµnh Giai §o¹n buff")			
	
end

function add_buffEvent2(nWay)
	local nCheck = GetTask(2812)
	if nCheck >= 1 then
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng cuèi khi sö dông tèi ®a 2 vËt phÈm råi.")
		return 0
	end
	local tNoiNgoai = {
			 [1] = {
						{"Néi C«ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh Lùc +6000", "state_life_max_point_add", 8000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Kh¸ng tÊt c¶ +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo¹i C«ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh Lùc +6000", "state_life_max_point_add", 10000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Néi phßng/Ngo¹i phßng +60", "state_i_defence_point_add", 60},
						{"Ngo¹i phßng +60", "state_o_defence_point_add", 60},
					},
				}
	local t_pet_type = {
									[1] = {"Thá tr¾ng",3333,24},
									[2] = {"Thá x¸m",3333,25},
									[3] = {"Thá ®en",3334,26},		
								}	
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"","Tiªu Dao Ngäc trong tói kh«ng ®ñ 999 c¸i")
		return
	end								
	if DelItem(2,1,30603,999) ~= 1 then
		return 0;
	end								
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);		
	SetTask(2812,1)	--nhËn phÇn th­ëng cuèi 
--	Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize,1)
--	self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
	---------------
	SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 3 lµ hoµn thµnh xong giai ®o¹n 2
	gf_WriteLogEx("PHUC SINH PET", "xong giai ®o¹n 2", 1, "Hoµn thµnh Giai §o¹n 2")												
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 lµ gi¸ trÞ x¸c ®Þnh cã Phôc Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi¸ trÞ x¸c ®Þnh cã Phôc Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi¸ trÞ x¸c ®Þnh sè lÇn Phôc Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set h­íng Phôc Sinh cña PET
		-------------Set c¸c chØ sè buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET míi
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Chóc mõng ®¹i hiÖp ®· chiªu mé PET thµnh c«ng")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add thÊt b¹i", 1, "Add pet thÊt b¹i")			
		end
		-------------
		Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô Phôc Sinh cho B¹n §ång Hµnh !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai ®o¹n 2", 1, "Hoµn thµnh Giai §o¹n buff")			
	
end

function Vet_Activity_GetAdditionPrize_135a(nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B¹n ®· nhËn phÇn th­ëng cuèi khi sö dông tèi ®a 2 vËt phÈm råi.")
		return 0
	end
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	ModifyExp(2000000000)
	SetTask(2788,1)	--nhËn phÇn th­ëng cuèi khi sö dông tèi ®a 2 vËt phÈm
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);			--task nhËn th­ëng khi sö dông max c¶ 2
	gf_WriteLogEx(EVENT_LOG_TITLE, "§æi phÇn th­ëng cuèi cïng", 0, "2 tû kinh nghiÖm");		

end