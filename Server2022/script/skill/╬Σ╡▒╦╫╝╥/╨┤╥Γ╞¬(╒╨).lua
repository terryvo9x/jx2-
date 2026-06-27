--¼¼ÄÜ: T¶ ı Thiªn (Chiªu)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--¼¼ÄÜÊôĞÔ

	SKILL_LEVEL_BASE_ATTRIB	  =	--¼¼ÄÜµÈ¼¶Ïà¹Ø»ù±¾ÊôĞÔ
	{
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--¼¼ÄÜµÈ¼¶Ïà¹ØÏûºÄÊôĞÔ
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--¼¼ÄÜµÈ¼¶Ïà¹Ø×Óµ¯ÊôĞÔ
	{
	{"skill_param1",{{1,3},{1,3}}},
	{"skill_param2",{{1,0},{1,0}}},
	{"missle_vanish_after_collide",{{1,1},{1,1}}},
	{"missle_damage_interval",{{1,-1},{1,-1}}},
	{"missle_collide_npc_missle",{{1,0},{1,0}}},
	},

	--Ä§·¨ÊôĞÔ

	--ÊôĞÔÖµ:	ÆÕÍ¨¹¥»÷Á¦ * X + (1 + ¼¼ÄÜµÈ¼¶ * Y) * (Á¦Á¿ * A + ¸ù¹Ç * B + Éí·¨ * C + ÄÚ¹¦ * D + ¶´²ì * E)
	--			+ ÎäÆ÷Íâ¹¦¹¥»÷µã * F + Z
	--			(ÆäÖĞ,A,B,C,D,E,F,X,Y,ZÎªÉËº¦ÒòËØ.³ıZÍâ,ÆäÓà¸÷ÉËº¦ÒòËØÎª°Ù·Ö±ÈÊı.)

	--³É¹¦¼¸ÂÊ:	(ÊôĞÔÖµ * A + (×ÔÉíµÈ¼¶ - ¶Ô·½µÈ¼¶) * B + ¼¼ÄÜµÈ¼¶ * C) * D + X
	--			(ÆäÖĞ,A,B,C,D,XÎª¼¸ÂÊÒòËØ.³ıXÍâ,ÆäÓà¸÷¼¸ÂÊÒòËØÎª°Ù·Ö±ÈÊı.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--¼¼ÄÜµÈ¼¶Ïà¹ØÉËº¦Ä§·¨ÊôĞÔ
	{
	{magic="damage_life_monster",
	damage_factor_a={{1,202},{1,202}},
	damage_factor_b={{1,202},{1,202}},
	damage_factor_c={{1,202},{1,202}},
	damage_factor_d={{1,202},{1,202}},
	damage_factor_e={{1,202},{1,202}},
	probability_factor_b={{1,20},{1,20}},
	probability_factor_x={{1,100},{1,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--¼¼ÄÜµÈ¼¶Ïà¹Ø×´Ì¬Ä§·¨ÊôĞÔ
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--¼¼ÄÜµÈ¼¶Ïà¹ØÁ¢¼´Ä§·¨ÊôĞÔ
	{
	},
}
