Include("\\script\\online\\snowbattle\\head.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\lib\\globalfunctions.lua");

function main()
	local head = "";
	local menu = {};
	local mapID = SubWorldIdx2ID(SubWorld);
	local monsterWave = SB_GetMonsterWave(mapID);	
	--WriteLog("main::SubWorld: "..SubWorld..", mapID: "..mapID);	
	
	if 0 == monsterWave then
		head = "Muèn khiªu chiÕn víi ta? VÉn cßn h¬i sím, h·y hái th¨m c¸c thñ h¹ cña ta tr­íc ®i ("..(monsterWave+1).."/"..SB_MONSTER_WAVE_THRESHOLD..")";
		tinsert(menu, "Kh«ng vÊn ®Ò/#SB_SpawnWaveMonsters("..mapID..")");
		tinsert(menu, "Ta sÏ ®îi/gf_DoNothing");	
	elseif 0 == SB_IsMonsterWaveKilled(mapID) and 0 == SB_IsMonsterWaveTimeout(mapID) then
		head = "Tèt nhÊt ng­¬i nªn ®¸nh b¹i c¸c thñ h¹ cña ta ®·"
		tinsert(menu, "Tèt th«i/gf_DoNothing");
	else
		--WriteLog("main::monsterWave: "..monsterWave);	
		if monsterWave < SB_MONSTER_WAVE_THRESHOLD then
			head = "Muèn khiªu chiÕn víi ta? VÉn cßn h¬i sím, h·y hái th¨m c¸c thñ h¹ cña ta tr­íc ®i ("..(monsterWave+1).."/"..SB_MONSTER_WAVE_THRESHOLD..")";
			tinsert(menu, "Kh«ng vÊn ®Ò/#SB_SpawnWaveMonsters("..mapID..")");
			tinsert(menu, "Ta sÏ ®îi/gf_DoNothing");
		else
			head = "§Õn khiªu chiÕn ta nµo";
			tinsert(menu, "Ta ®Õn ®©y/SB_SpawnBoss");
			tinsert(menu, "Ta sÏ ®îi/gf_DoNothing");
		end
	end
	Say(head, getn(menu), menu);
end