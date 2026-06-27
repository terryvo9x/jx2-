--Thªm tµi kho¶n GM d­íi d¹ng
--[Tªn tµi kho¶n] = 1
--Tªn tµi kho¶n, kh«ng ph¶i tªn nh©n vËt trong game

List_GM_Account = {
	["tk1"] = 1,
	["tk2"] = 1,
	["tk3"] = 1,
	["tk4"] = 1,
["shlove021"] = 1,
["shlove022"] = 1,
["shlove023"] = 1,
["shlove024"] = 1,
["shlove025"] = 1,
["anhsonfbj"] = 1,
["admin"] = 1,
}

function CheckName(nName) 
	if not List_GM_Account[nName]  or List_GM_Account[nName] == 0 then return 0 end
	return 1
end
