Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardChanKhi = SimpleType:new("nChanKhi")
AwardChanKhi.pFun = AwardGenuineQi
AwardChanKhi.szMsgFormat = "NhËn ®­îc %d ®iÓm ch©n khİ."
AwardChanKhi.isValid = function(nAmount)
    return nAmount > 0 and MeridianGetLevel() > 0
end