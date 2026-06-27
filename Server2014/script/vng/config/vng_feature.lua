CFG_NhiemVuLamGiau = 0		-- 0/1: BËt t¾t nhiÖm vô lµm giµu
CFG_NhiemVuThuongHoi = 1	-- 0/1: BËt t¾t nhiÖm vô th­¬ng héi
CFG_NhiemVuDongHanh = 1		-- 0/1: BËt t¾t nhiÖm vô ®ång hµnh
CFG_VipCare = 1						-- 0/1: BËt t¾t ch­¬ng tr×nh VipCare
EXT_VIPCARE = 0						-- EXT point dïng cho VipCare
--EXT_QUAYSOINGAME = 1		-- EXT point dïng cho quay sè ingame
EXT_PLUS123PAY = 1
EXT_VBONUS = 2						-- EXT point dïng cho VBonus
EXT_CDKEY = 3							-- EXT	point dïng cho CD Key

function CheckVbonus()	-- Check tr¹ng th¸i ch­¬ng tr×nh VBonus
	local nVBONUS_STARTDATE = 14071010
	local nVBONUS_ENDDATE = 14090300
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate >= nVBONUS_STARTDATE and nDate < nVBONUS_ENDDATE then
		local nVB = GetExtPoint(EXT_VBONUS)
		if GetBit(nVB,1) == 1 and GetBit(nVB,2) == 0 then
			return 1
		else
			return 0
		end
	else
		return 0
	end
end