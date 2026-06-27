--Ö÷Òª¹¦ÄÜ¶¼ÔÚÕâÀïÊµÏÖ

Include("\\script\\isolate\\online_activites\\every_month\\head.lua")

function add_material(nType, nNum)
	local t = tConfig.tMaterials[nType]
	local g,d,p = unpack(t[2])
	AddItem(g,d,p, nNum)
	Msg2Player(format("Chóc mõng ®¹t ®­î %sx%d", t[1], nNum))
end

function get_product_use_count(nType)
	if nType >= 1 and nType <= getn(tConfig.tProducts) then
		return get_task(format("task_use_item%d_count", nType))
	end
	return -1
end