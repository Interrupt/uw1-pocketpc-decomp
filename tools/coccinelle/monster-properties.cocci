@alias_g_monster_max_stats_table@
expression E;
@@
- (&g_monster_max_stats_table)[E]
+ g_monster_type_props[(E) / 0x30].max_hp

@alias_DAT_001007d5@
expression E;
@@
- (&DAT_001007d5)[E]
+ g_monster_type_props[(E) / 0x30].strength

@alias_DAT_001007d8@
expression E;
@@
- (&DAT_001007d8)[E]
+ g_monster_type_props[(E) / 0x30].effects_flags

@alias_DAT_001007d9@
expression E;
@@
- (&DAT_001007d9)[E]
+ g_monster_type_props[(E) / 0x30].race_flags

@alias_DAT_001007da@
expression E;
@@
- (&DAT_001007da)[E]
+ g_monster_type_props[(E) / 0x30].movement_flags

@alias_DAT_001007dd@
expression E;
@@
- (&DAT_001007dd)[E]
+ g_monster_type_props[(E) / 0x30].trade_level

@alias_DAT_001007de@
expression E;
@@
- (&DAT_001007de)[E]
+ g_monster_type_props[(E) / 0x30].trade_patience

@alias_DAT_001007e0@
expression E;
@@
- (&DAT_001007e0)[E]
+ g_monster_type_props[(E) / 0x30].category

@alias_DAT_001007e1@
expression E;
@@
- (&DAT_001007e1)[E]
+ g_monster_type_props[(E) / 0x30].equipment_damage

@alias_DAT_001007e2@
expression E;
@@
- (&DAT_001007e2)[E]
+ g_monster_type_props[(E) / 0x30].defense

@alias_DAT_001007e3@
expression E;
@@
- (&DAT_001007e3)[E]
+ g_monster_type_props[(E) / 0x30].attacks[0].skill

@alias_DAT_001007ed@
expression E;
@@
- (&DAT_001007ed)[E]
+ g_monster_type_props[(E) / 0x30].detection_ranges

@alias_DAT_001007ee@
expression E;
@@
- (&DAT_001007ee)[E]
+ g_monster_type_props[(E) / 0x30].awareness_ranges

@alias_DAT_001007fd@
expression E;
@@
- (&DAT_001007fd)[E]
+ g_monster_type_props[(E) / 0x30].spell_flags

@experience_word@
expression E;
typedef ushort;
@@
- *(ushort *)(&DAT_001007f8 + E)
+ g_monster_type_props[(E) / 0x30].experience

@byte_0_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[0]
+ g_monster_type_props[0].armor[0]

@byte_0_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 0]
+ g_monster_type_props[E].armor[0]

@byte_0_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[0 + E * 0x30]
+ g_monster_type_props[E].armor[0]

@byte_1_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[1]
+ g_monster_type_props[0].armor[1]

@byte_1_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 1]
+ g_monster_type_props[E].armor[1]

@byte_1_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[1 + E * 0x30]
+ g_monster_type_props[E].armor[1]

@byte_2_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[2]
+ g_monster_type_props[0].armor[2]

@byte_2_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 2]
+ g_monster_type_props[E].armor[2]

@byte_2_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[2 + E * 0x30]
+ g_monster_type_props[E].armor[2]

@byte_3_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[3]
+ g_monster_type_props[0].armor[3]

@byte_3_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 3]
+ g_monster_type_props[E].armor[3]

@byte_3_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[3 + E * 0x30]
+ g_monster_type_props[E].armor[3]

@byte_4_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[4]
+ g_monster_type_props[0].max_hp

@byte_4_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 4]
+ g_monster_type_props[E].max_hp

@byte_4_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[4 + E * 0x30]
+ g_monster_type_props[E].max_hp

@byte_5_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[5]
+ g_monster_type_props[0].strength

@byte_5_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 5]
+ g_monster_type_props[E].strength

@byte_5_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[5 + E * 0x30]
+ g_monster_type_props[E].strength

@byte_6_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[6]
+ g_monster_type_props[0].dexterity

@byte_6_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 6]
+ g_monster_type_props[E].dexterity

@byte_6_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[6 + E * 0x30]
+ g_monster_type_props[E].dexterity

@byte_7_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[7]
+ g_monster_type_props[0].intelligence

@byte_7_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 7]
+ g_monster_type_props[E].intelligence

@byte_7_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[7 + E * 0x30]
+ g_monster_type_props[E].intelligence

@byte_8_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[8]
+ g_monster_type_props[0].effects_flags

@byte_8_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 8]
+ g_monster_type_props[E].effects_flags

@byte_8_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[8 + E * 0x30]
+ g_monster_type_props[E].effects_flags

@byte_9_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[9]
+ g_monster_type_props[0].race_flags

@byte_9_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 9]
+ g_monster_type_props[E].race_flags

@byte_9_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[9 + E * 0x30]
+ g_monster_type_props[E].race_flags

@byte_10_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[10]
+ g_monster_type_props[0].movement_flags

@byte_10_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 10]
+ g_monster_type_props[E].movement_flags

@byte_10_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[10 + E * 0x30]
+ g_monster_type_props[E].movement_flags

@byte_11_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[11]
+ g_monster_type_props[0].magic_power

@byte_11_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 11]
+ g_monster_type_props[E].magic_power

@byte_11_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[11 + E * 0x30]
+ g_monster_type_props[E].magic_power

@byte_12_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[12]
+ g_monster_type_props[0].movement_speed

@byte_12_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 12]
+ g_monster_type_props[E].movement_speed

@byte_12_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[12 + E * 0x30]
+ g_monster_type_props[E].movement_speed

@byte_13_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[13]
+ g_monster_type_props[0].trade_level

@byte_13_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 13]
+ g_monster_type_props[E].trade_level

@byte_13_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[13 + E * 0x30]
+ g_monster_type_props[E].trade_level

@byte_14_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[14]
+ g_monster_type_props[0].trade_patience

@byte_14_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 14]
+ g_monster_type_props[E].trade_patience

@byte_14_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[14 + E * 0x30]
+ g_monster_type_props[E].trade_patience

@byte_15_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[15]
+ g_monster_type_props[0].poison_damage

@byte_15_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 15]
+ g_monster_type_props[E].poison_damage

@byte_15_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[15 + E * 0x30]
+ g_monster_type_props[E].poison_damage

@byte_16_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[16]
+ g_monster_type_props[0].category

@byte_16_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 16]
+ g_monster_type_props[E].category

@byte_16_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[16 + E * 0x30]
+ g_monster_type_props[E].category

@byte_17_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[17]
+ g_monster_type_props[0].equipment_damage

@byte_17_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 17]
+ g_monster_type_props[E].equipment_damage

@byte_17_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[17 + E * 0x30]
+ g_monster_type_props[E].equipment_damage

@byte_18_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[18]
+ g_monster_type_props[0].defense

@byte_18_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 18]
+ g_monster_type_props[E].defense

@byte_18_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[18 + E * 0x30]
+ g_monster_type_props[E].defense

@byte_28_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[28]
+ g_monster_type_props[0].morale_flags

@byte_28_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 28]
+ g_monster_type_props[E].morale_flags

@byte_28_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[28 + E * 0x30]
+ g_monster_type_props[E].morale_flags

@byte_29_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[29]
+ g_monster_type_props[0].detection_ranges

@byte_29_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 29]
+ g_monster_type_props[E].detection_ranges

@byte_29_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[29 + E * 0x30]
+ g_monster_type_props[E].detection_ranges

@byte_30_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[30]
+ g_monster_type_props[0].awareness_ranges

@byte_30_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 30]
+ g_monster_type_props[E].awareness_ranges

@byte_30_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[30 + E * 0x30]
+ g_monster_type_props[E].awareness_ranges

@byte_31_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[31]
+ g_monster_type_props[0].missile_wander_flags

@byte_31_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 31]
+ g_monster_type_props[E].missile_wander_flags

@byte_31_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[31 + E * 0x30]
+ g_monster_type_props[E].missile_wander_flags

@byte_32_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[32]
+ g_monster_type_props[0].weapon_loot[0]

@byte_32_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 32]
+ g_monster_type_props[E].weapon_loot[0]

@byte_32_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[32 + E * 0x30]
+ g_monster_type_props[E].weapon_loot[0]

@byte_33_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[33]
+ g_monster_type_props[0].weapon_loot[1]

@byte_33_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 33]
+ g_monster_type_props[E].weapon_loot[1]

@byte_33_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[33 + E * 0x30]
+ g_monster_type_props[E].weapon_loot[1]

@byte_38_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[38]
+ g_monster_type_props[0].coin_loot

@byte_38_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 38]
+ g_monster_type_props[E].coin_loot

@byte_38_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[38 + E * 0x30]
+ g_monster_type_props[E].coin_loot

@byte_39_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[39]
+ g_monster_type_props[0].food_loot

@byte_39_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 39]
+ g_monster_type_props[E].food_loot

@byte_39_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[39 + E * 0x30]
+ g_monster_type_props[E].food_loot

@byte_42_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[42]
+ g_monster_type_props[0].spells[0]

@byte_42_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 42]
+ g_monster_type_props[E].spells[0]

@byte_42_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[42 + E * 0x30]
+ g_monster_type_props[E].spells[0]

@byte_43_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[43]
+ g_monster_type_props[0].spells[1]

@byte_43_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 43]
+ g_monster_type_props[E].spells[1]

@byte_43_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[43 + E * 0x30]
+ g_monster_type_props[E].spells[1]

@byte_44_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[44]
+ g_monster_type_props[0].spells[2]

@byte_44_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 44]
+ g_monster_type_props[E].spells[2]

@byte_44_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[44 + E * 0x30]
+ g_monster_type_props[E].spells[2]

@byte_45_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[45]
+ g_monster_type_props[0].spell_flags

@byte_45_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 45]
+ g_monster_type_props[E].spell_flags

@byte_45_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[45 + E * 0x30]
+ g_monster_type_props[E].spell_flags

@byte_46_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[46]
+ g_monster_type_props[0].door_skill

@byte_46_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 46]
+ g_monster_type_props[E].door_skill

@byte_46_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[46 + E * 0x30]
+ g_monster_type_props[E].door_skill

@byte_47_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[47]
+ g_monster_type_props[0]._unknown2f

@byte_47_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 47]
+ g_monster_type_props[E]._unknown2f

@byte_47_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[47 + E * 0x30]
+ g_monster_type_props[E]._unknown2f

@byte_19_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[19]
+ g_monster_type_props[0].attacks[0].skill

@byte_19_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 19]
+ g_monster_type_props[E].attacks[0].skill

@byte_19_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[19 + E * 0x30]
+ g_monster_type_props[E].attacks[0].skill

@byte_20_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[20]
+ g_monster_type_props[0].attacks[0].damage

@byte_20_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 20]
+ g_monster_type_props[E].attacks[0].damage

@byte_20_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[20 + E * 0x30]
+ g_monster_type_props[E].attacks[0].damage

@byte_21_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[21]
+ g_monster_type_props[0].attacks[0].probability

@byte_21_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 21]
+ g_monster_type_props[E].attacks[0].probability

@byte_21_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[21 + E * 0x30]
+ g_monster_type_props[E].attacks[0].probability

@byte_22_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[22]
+ g_monster_type_props[0].attacks[1].skill

@byte_22_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 22]
+ g_monster_type_props[E].attacks[1].skill

@byte_22_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[22 + E * 0x30]
+ g_monster_type_props[E].attacks[1].skill

@byte_23_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[23]
+ g_monster_type_props[0].attacks[1].damage

@byte_23_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 23]
+ g_monster_type_props[E].attacks[1].damage

@byte_23_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[23 + E * 0x30]
+ g_monster_type_props[E].attacks[1].damage

@byte_24_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[24]
+ g_monster_type_props[0].attacks[1].probability

@byte_24_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 24]
+ g_monster_type_props[E].attacks[1].probability

@byte_24_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[24 + E * 0x30]
+ g_monster_type_props[E].attacks[1].probability

@byte_25_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[25]
+ g_monster_type_props[0].attacks[2].skill

@byte_25_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 25]
+ g_monster_type_props[E].attacks[2].skill

@byte_25_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[25 + E * 0x30]
+ g_monster_type_props[E].attacks[2].skill

@byte_26_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[26]
+ g_monster_type_props[0].attacks[2].damage

@byte_26_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 26]
+ g_monster_type_props[E].attacks[2].damage

@byte_26_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[26 + E * 0x30]
+ g_monster_type_props[E].attacks[2].damage

@byte_27_constant@

typedef byte;
@@
- ((byte *)g_monster_type_props)[27]
+ g_monster_type_props[0].attacks[2].probability

@byte_27_row_after@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[E * 0x30 + 27]
+ g_monster_type_props[E].attacks[2].probability

@byte_27_row_before@
expression E;
typedef byte;
@@
- ((byte *)g_monster_type_props)[27 + E * 0x30]
+ g_monster_type_props[E].attacks[2].probability
