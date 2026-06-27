--Ç§±äºĞÎïÆ·½Å±¾
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\global\\bit_task_support.lua")
Include("\\script\\lib\\globalfunctions.lua")

t_item_para = 
{
	2,1,30494,"Tñ ¸o Thiªn BiÕn TiÕu",
}

function OnUse(nItemIndex)
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
		SendScript2Client('Open([[Collection]]);')
	else
		Say("Tñ ¸o Thiªn BiÕn Tiªu t¹m ch­a më", 1, "\nTa biÕt råi/no")
	end
end

function no()
end

function NpcTalkMain()
	local tbSay = {}
	local szTitle = ""

	szTitle = format("Ta cã Tñ ¸o Thiªn BiÕn TiÕu dÔ dµng mua vµ l­u tr÷ ngo¹i trang.")
	tinsert(tbSay, "NhËn Tñ ¸o Thiªn BiÕn TiÕu/_npc_get_box")
	tinsert(tbSay, "T×m hiÓu vÒ Tñ ¸o/_about")
	tinsert(tbSay, "Ra khi/no")

	Say(szTitle, getn(tbSay), tbSay)
end

function _about()
	local tbSay = {}
	local szTitle = "Thiªn BiÕn TiÕu lµ Tñ ¸o sö dông <color=yellow>§iÓm Th­ëng Tiªu Y Ph­¬ng<color> ®Ó nhËn ngo¹i trang, ®ång thêi <color=yellow>UÈn Linh<color>."
	szTitle = format("%s\n%s", szTitle, "Ngo¹i trang: c¸c h¹ cã thÓ th«ng qua tñ ¸o nµy mua ngo¹i trang míi, ®ång thêi cã thÓ l­u tr÷ <color=yellow>3 mãn ngo¹i trang vÜnh viÔn<color> vµo trong (bao gåm hiÖu øng uÈn linh)")
	szTitle = format("%s\n%s", szTitle, "UÈn linh: khi c¸c h¹ <color=yellow>mua hoÆc lÊy<color> ngo¹i trang tõ tñ ¸o, cã thÓ tiÕn hµnh <color=yellow>UÈn Linh<color> lªn ngo¹i trang. C¸c dßng chän uÈn linh ®­îc l­u tr÷ tõ <color=yellow>UÈn Linh kh¾c b¶n<color>.")
	szTitle = format("%s\n%s", szTitle, "<color=red>Nh÷ng ngo¹i trang vËt phÈm tõ Tñ ¸o Thiªn BiÕn TiÕu rót ra ®Òu 30 ngµy kh«ng thÓ giao dŞch<color>")

	tinsert(tbSay, "trë l¹i/NpcTalkMain")
	tinsert(tbSay, "Ra khi/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _npc_get_box()
	get_qianbian_box(1)
end

function get_qianbian_box(bNotify)
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
    	--Talk(1,"",format("±³°ü¿Õ¼ä²»×ã"))
    	return
    end
	if GetItemCount(t_item_para[1],t_item_para[2],t_item_para[3]) <= 0 then
		AddItem(t_item_para[1],t_item_para[2],t_item_para[3],1,4)
		bt_SetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG, 1)
		--×Ô¶¯Ñ§»á3¸ö³õÊ¼ÔÌÁé
		if GetPlayerCollectionData(2,1) == 0 then
			SetPlayerCollectionData(2, 1, 1)
			SetPlayerCollectionData(2, 2, 1)
			SetPlayerCollectionData(2, 3, 1)
		end
		if bNotify==1 then
			Talk(1,"",format("C¸c h¹ ®· nhËn ®­îc %s.", t_item_para[4]))
		end
	else
		if bNotify==1 then
			Talk(1,"",format("C¸c h¹ ®· cã %s råi.", t_item_para[4]))
		end
	end
end

function show_yunling_box_login_message()
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
    	if bt_GetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG) == 0 then
        	local tbSay = {}
        	local szTitle = ""
    
        	szTitle = format("C¸c h¹ sÏ nhËn ®­îc <color=yellow>[Tñ ¸o Thiªn BiÕn TiÕu]<color>, trong ®ã cã thÓ thö vµ mua c¸c lo¹i ngo¹i trang xinh ®Ñp. §iÓm th­ëng dïng ®Ó mua ngo¹i trang cã thÓ ®æi tõ Ngù C¸c. \nNÕu c¸c h¹ bÊt cÈn lµm mÊt Tñ ¸o, vÉn cã thÓ ®Õn t×m <color=yellow>L­u T­ Anh t¹i D­¬ng Ch©u<color> nhËn l¹i.")
        	tinsert(tbSay, "BiÕt råi!/_never_show_login_message")
    
        	Say(szTitle, getn(tbSay), tbSay)
    	end
	end
end

function _never_show_login_message()
	get_qianbian_box(0)
end