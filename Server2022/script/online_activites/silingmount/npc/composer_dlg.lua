Include("\\script\\online_activites\\silingmount\\string.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\silingmount\\silingmount.lua")
Include("\\script\\pet\\forget_pet_skill.lua")
function main()
	if (gf_CheckEventDateEx(VET_SILING_MOUNT_ACTIVITY_ID) ~= 1) then
		return
	end
	local strTitle = VET_TB_SILING_NPC_DLG[6];
	local tbOpt = 
	{
		format("%s/%s",VET_TB_SILING_NPC_DLG[7],"ComposeSilingMount"),
		format("%s/%s",VET_TB_SILING_NPC_DLG[8],"VET_SilingMountEvolution_Dlg"),
		format("%s/%s",VET_TB_SILING_NPC_DLG[9],"VET_SilingMountRestore_Dlg"),
		"Quªn mÊt kü n¨ng t¨ng Ých cña b¹n ®ång hµnh/ForgetPetSkillMain",
		format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end