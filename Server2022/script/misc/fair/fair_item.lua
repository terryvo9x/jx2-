Include("\\script\\misc\\fair\\fair.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
function OnUse(nItemIdx)
    local nPlayerLevel = GetLevel()
    local nTrans = gf_GetTransCount();
    local nTotallevel = nTrans * 100 + nPlayerLevel;
    if nTotallevel < 1099 then
        Talk(1, "", "C«n Æπt CS 10 Lv99 mÌi mÎ H„a C∂nh")
        return
    end
    SetTask(TASKID_FAIR_UP_FLAG, 1)
    DelItemByIndex(nItemIdx, 1)
    Msg2Global(format("ChÛc mıng [%s] v≠Ót qua thˆ th∏ch, mÎ c p H„a C∂nh!", GetName()))
    Talk(1, "", "ChÛc mıng mÎ c p <color=yellow>H„a C∂nh<color>! C„ th” vµo <color=green>giao di÷n nh©n vÀt<color>, trang <color=yellow>H„a C∂nh<color> Æ” xem vµ t®ng sao H„a C∂nh!")
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end