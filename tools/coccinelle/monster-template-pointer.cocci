@definition@
typedef uw_monster_type_props_t;
@@
- char *DAT_00101404;
+ uw_monster_type_props_t *DAT_00101404;

@prototype@
typedef uw_monster_type_props_t;
@@
- extern char *DAT_00101404;
+ extern uw_monster_type_props_t *DAT_00101404;

@unsigned_0@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 0)
+ DAT_00101404->armor[0]
|
- *(undefined1 *)(DAT_00101404 + 0)
+ DAT_00101404->armor[0]
)

@signed_0@
@@
(
- *(char *)(DAT_00101404 + 0)
+ *(char *)&DAT_00101404->armor[0]
|
- DAT_00101404[0]
+ *(char *)&DAT_00101404->armor[0]
)

@unsigned_1@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 1)
+ DAT_00101404->armor[1]
|
- *(undefined1 *)(DAT_00101404 + 1)
+ DAT_00101404->armor[1]
)

@signed_1@
@@
(
- *(char *)(DAT_00101404 + 1)
+ *(char *)&DAT_00101404->armor[1]
|
- DAT_00101404[1]
+ *(char *)&DAT_00101404->armor[1]
)

@unsigned_2@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 2)
+ DAT_00101404->armor[2]
|
- *(undefined1 *)(DAT_00101404 + 2)
+ DAT_00101404->armor[2]
)

@signed_2@
@@
(
- *(char *)(DAT_00101404 + 2)
+ *(char *)&DAT_00101404->armor[2]
|
- DAT_00101404[2]
+ *(char *)&DAT_00101404->armor[2]
)

@unsigned_3@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 3)
+ DAT_00101404->armor[3]
|
- *(undefined1 *)(DAT_00101404 + 3)
+ DAT_00101404->armor[3]
)

@signed_3@
@@
(
- *(char *)(DAT_00101404 + 3)
+ *(char *)&DAT_00101404->armor[3]
|
- DAT_00101404[3]
+ *(char *)&DAT_00101404->armor[3]
)

@unsigned_4@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 4)
+ DAT_00101404->max_hp
|
- *(undefined1 *)(DAT_00101404 + 4)
+ DAT_00101404->max_hp
)

@signed_4@
@@
(
- *(char *)(DAT_00101404 + 4)
+ *(char *)&DAT_00101404->max_hp
|
- DAT_00101404[4]
+ *(char *)&DAT_00101404->max_hp
)

@unsigned_5@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 5)
+ DAT_00101404->strength
|
- *(undefined1 *)(DAT_00101404 + 5)
+ DAT_00101404->strength
)

@signed_5@
@@
(
- *(char *)(DAT_00101404 + 5)
+ *(char *)&DAT_00101404->strength
|
- DAT_00101404[5]
+ *(char *)&DAT_00101404->strength
)

@unsigned_6@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 6)
+ DAT_00101404->dexterity
|
- *(undefined1 *)(DAT_00101404 + 6)
+ DAT_00101404->dexterity
)

@signed_6@
@@
(
- *(char *)(DAT_00101404 + 6)
+ *(char *)&DAT_00101404->dexterity
|
- DAT_00101404[6]
+ *(char *)&DAT_00101404->dexterity
)

@unsigned_7@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 7)
+ DAT_00101404->intelligence
|
- *(undefined1 *)(DAT_00101404 + 7)
+ DAT_00101404->intelligence
)

@signed_7@
@@
(
- *(char *)(DAT_00101404 + 7)
+ *(char *)&DAT_00101404->intelligence
|
- DAT_00101404[7]
+ *(char *)&DAT_00101404->intelligence
)

@unsigned_8@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 8)
+ DAT_00101404->effects_flags
|
- *(undefined1 *)(DAT_00101404 + 8)
+ DAT_00101404->effects_flags
)

@signed_8@
@@
(
- *(char *)(DAT_00101404 + 8)
+ *(char *)&DAT_00101404->effects_flags
|
- DAT_00101404[8]
+ *(char *)&DAT_00101404->effects_flags
)

@unsigned_9@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 9)
+ DAT_00101404->race_flags
|
- *(undefined1 *)(DAT_00101404 + 9)
+ DAT_00101404->race_flags
)

@signed_9@
@@
(
- *(char *)(DAT_00101404 + 9)
+ *(char *)&DAT_00101404->race_flags
|
- DAT_00101404[9]
+ *(char *)&DAT_00101404->race_flags
)

@unsigned_10@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 10)
+ DAT_00101404->movement_flags
|
- *(undefined1 *)(DAT_00101404 + 10)
+ DAT_00101404->movement_flags
)

@signed_10@
@@
(
- *(char *)(DAT_00101404 + 10)
+ *(char *)&DAT_00101404->movement_flags
|
- DAT_00101404[10]
+ *(char *)&DAT_00101404->movement_flags
)

@unsigned_11@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 11)
+ DAT_00101404->magic_power
|
- *(undefined1 *)(DAT_00101404 + 11)
+ DAT_00101404->magic_power
)

@signed_11@
@@
(
- *(char *)(DAT_00101404 + 11)
+ *(char *)&DAT_00101404->magic_power
|
- DAT_00101404[11]
+ *(char *)&DAT_00101404->magic_power
)

@unsigned_12@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 12)
+ DAT_00101404->movement_speed
|
- *(undefined1 *)(DAT_00101404 + 12)
+ DAT_00101404->movement_speed
)

@signed_12@
@@
(
- *(char *)(DAT_00101404 + 12)
+ *(char *)&DAT_00101404->movement_speed
|
- DAT_00101404[12]
+ *(char *)&DAT_00101404->movement_speed
)

@unsigned_13@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 13)
+ DAT_00101404->trade_level
|
- *(undefined1 *)(DAT_00101404 + 13)
+ DAT_00101404->trade_level
)

@signed_13@
@@
(
- *(char *)(DAT_00101404 + 13)
+ *(char *)&DAT_00101404->trade_level
|
- DAT_00101404[13]
+ *(char *)&DAT_00101404->trade_level
)

@unsigned_14@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 14)
+ DAT_00101404->trade_patience
|
- *(undefined1 *)(DAT_00101404 + 14)
+ DAT_00101404->trade_patience
)

@signed_14@
@@
(
- *(char *)(DAT_00101404 + 14)
+ *(char *)&DAT_00101404->trade_patience
|
- DAT_00101404[14]
+ *(char *)&DAT_00101404->trade_patience
)

@unsigned_15@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 15)
+ DAT_00101404->poison_damage
|
- *(undefined1 *)(DAT_00101404 + 15)
+ DAT_00101404->poison_damage
)

@signed_15@
@@
(
- *(char *)(DAT_00101404 + 15)
+ *(char *)&DAT_00101404->poison_damage
|
- DAT_00101404[15]
+ *(char *)&DAT_00101404->poison_damage
)

@unsigned_16@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 16)
+ DAT_00101404->category
|
- *(undefined1 *)(DAT_00101404 + 16)
+ DAT_00101404->category
)

@signed_16@
@@
(
- *(char *)(DAT_00101404 + 16)
+ *(char *)&DAT_00101404->category
|
- DAT_00101404[16]
+ *(char *)&DAT_00101404->category
)

@unsigned_17@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 17)
+ DAT_00101404->equipment_damage
|
- *(undefined1 *)(DAT_00101404 + 17)
+ DAT_00101404->equipment_damage
)

@signed_17@
@@
(
- *(char *)(DAT_00101404 + 17)
+ *(char *)&DAT_00101404->equipment_damage
|
- DAT_00101404[17]
+ *(char *)&DAT_00101404->equipment_damage
)

@unsigned_18@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 18)
+ DAT_00101404->defense
|
- *(undefined1 *)(DAT_00101404 + 18)
+ DAT_00101404->defense
)

@signed_18@
@@
(
- *(char *)(DAT_00101404 + 18)
+ *(char *)&DAT_00101404->defense
|
- DAT_00101404[18]
+ *(char *)&DAT_00101404->defense
)

@unsigned_28@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 28)
+ DAT_00101404->morale_flags
|
- *(undefined1 *)(DAT_00101404 + 28)
+ DAT_00101404->morale_flags
)

@signed_28@
@@
(
- *(char *)(DAT_00101404 + 28)
+ *(char *)&DAT_00101404->morale_flags
|
- DAT_00101404[28]
+ *(char *)&DAT_00101404->morale_flags
)

@unsigned_29@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 29)
+ DAT_00101404->detection_ranges
|
- *(undefined1 *)(DAT_00101404 + 29)
+ DAT_00101404->detection_ranges
)

@signed_29@
@@
(
- *(char *)(DAT_00101404 + 29)
+ *(char *)&DAT_00101404->detection_ranges
|
- DAT_00101404[29]
+ *(char *)&DAT_00101404->detection_ranges
)

@unsigned_30@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 30)
+ DAT_00101404->awareness_ranges
|
- *(undefined1 *)(DAT_00101404 + 30)
+ DAT_00101404->awareness_ranges
)

@signed_30@
@@
(
- *(char *)(DAT_00101404 + 30)
+ *(char *)&DAT_00101404->awareness_ranges
|
- DAT_00101404[30]
+ *(char *)&DAT_00101404->awareness_ranges
)

@unsigned_31@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 31)
+ DAT_00101404->missile_wander_flags
|
- *(undefined1 *)(DAT_00101404 + 31)
+ DAT_00101404->missile_wander_flags
)

@signed_31@
@@
(
- *(char *)(DAT_00101404 + 31)
+ *(char *)&DAT_00101404->missile_wander_flags
|
- DAT_00101404[31]
+ *(char *)&DAT_00101404->missile_wander_flags
)

@unsigned_32@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 32)
+ DAT_00101404->weapon_loot[0]
|
- *(undefined1 *)(DAT_00101404 + 32)
+ DAT_00101404->weapon_loot[0]
)

@signed_32@
@@
(
- *(char *)(DAT_00101404 + 32)
+ *(char *)&DAT_00101404->weapon_loot[0]
|
- DAT_00101404[32]
+ *(char *)&DAT_00101404->weapon_loot[0]
)

@unsigned_33@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 33)
+ DAT_00101404->weapon_loot[1]
|
- *(undefined1 *)(DAT_00101404 + 33)
+ DAT_00101404->weapon_loot[1]
)

@signed_33@
@@
(
- *(char *)(DAT_00101404 + 33)
+ *(char *)&DAT_00101404->weapon_loot[1]
|
- DAT_00101404[33]
+ *(char *)&DAT_00101404->weapon_loot[1]
)

@unsigned_38@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 38)
+ DAT_00101404->coin_loot
|
- *(undefined1 *)(DAT_00101404 + 38)
+ DAT_00101404->coin_loot
)

@signed_38@
@@
(
- *(char *)(DAT_00101404 + 38)
+ *(char *)&DAT_00101404->coin_loot
|
- DAT_00101404[38]
+ *(char *)&DAT_00101404->coin_loot
)

@unsigned_39@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 39)
+ DAT_00101404->food_loot
|
- *(undefined1 *)(DAT_00101404 + 39)
+ DAT_00101404->food_loot
)

@signed_39@
@@
(
- *(char *)(DAT_00101404 + 39)
+ *(char *)&DAT_00101404->food_loot
|
- DAT_00101404[39]
+ *(char *)&DAT_00101404->food_loot
)

@unsigned_42@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 42)
+ DAT_00101404->spells[0]
|
- *(undefined1 *)(DAT_00101404 + 42)
+ DAT_00101404->spells[0]
)

@signed_42@
@@
(
- *(char *)(DAT_00101404 + 42)
+ *(char *)&DAT_00101404->spells[0]
|
- DAT_00101404[42]
+ *(char *)&DAT_00101404->spells[0]
)

@unsigned_43@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 43)
+ DAT_00101404->spells[1]
|
- *(undefined1 *)(DAT_00101404 + 43)
+ DAT_00101404->spells[1]
)

@signed_43@
@@
(
- *(char *)(DAT_00101404 + 43)
+ *(char *)&DAT_00101404->spells[1]
|
- DAT_00101404[43]
+ *(char *)&DAT_00101404->spells[1]
)

@unsigned_44@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 44)
+ DAT_00101404->spells[2]
|
- *(undefined1 *)(DAT_00101404 + 44)
+ DAT_00101404->spells[2]
)

@signed_44@
@@
(
- *(char *)(DAT_00101404 + 44)
+ *(char *)&DAT_00101404->spells[2]
|
- DAT_00101404[44]
+ *(char *)&DAT_00101404->spells[2]
)

@unsigned_45@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 45)
+ DAT_00101404->spell_flags
|
- *(undefined1 *)(DAT_00101404 + 45)
+ DAT_00101404->spell_flags
)

@signed_45@
@@
(
- *(char *)(DAT_00101404 + 45)
+ *(char *)&DAT_00101404->spell_flags
|
- DAT_00101404[45]
+ *(char *)&DAT_00101404->spell_flags
)

@unsigned_46@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 46)
+ DAT_00101404->door_skill
|
- *(undefined1 *)(DAT_00101404 + 46)
+ DAT_00101404->door_skill
)

@signed_46@
@@
(
- *(char *)(DAT_00101404 + 46)
+ *(char *)&DAT_00101404->door_skill
|
- DAT_00101404[46]
+ *(char *)&DAT_00101404->door_skill
)

@unsigned_47@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 47)
+ DAT_00101404->_unknown2f
|
- *(undefined1 *)(DAT_00101404 + 47)
+ DAT_00101404->_unknown2f
)

@signed_47@
@@
(
- *(char *)(DAT_00101404 + 47)
+ *(char *)&DAT_00101404->_unknown2f
|
- DAT_00101404[47]
+ *(char *)&DAT_00101404->_unknown2f
)

@unsigned_19@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 19)
+ DAT_00101404->attacks[0].skill
|
- *(undefined1 *)(DAT_00101404 + 19)
+ DAT_00101404->attacks[0].skill
)

@signed_19@
@@
(
- *(char *)(DAT_00101404 + 19)
+ *(char *)&DAT_00101404->attacks[0].skill
|
- DAT_00101404[19]
+ *(char *)&DAT_00101404->attacks[0].skill
)

@unsigned_20@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 20)
+ DAT_00101404->attacks[0].damage
|
- *(undefined1 *)(DAT_00101404 + 20)
+ DAT_00101404->attacks[0].damage
)

@signed_20@
@@
(
- *(char *)(DAT_00101404 + 20)
+ *(char *)&DAT_00101404->attacks[0].damage
|
- DAT_00101404[20]
+ *(char *)&DAT_00101404->attacks[0].damage
)

@unsigned_21@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 21)
+ DAT_00101404->attacks[0].probability
|
- *(undefined1 *)(DAT_00101404 + 21)
+ DAT_00101404->attacks[0].probability
)

@signed_21@
@@
(
- *(char *)(DAT_00101404 + 21)
+ *(char *)&DAT_00101404->attacks[0].probability
|
- DAT_00101404[21]
+ *(char *)&DAT_00101404->attacks[0].probability
)

@unsigned_22@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 22)
+ DAT_00101404->attacks[1].skill
|
- *(undefined1 *)(DAT_00101404 + 22)
+ DAT_00101404->attacks[1].skill
)

@signed_22@
@@
(
- *(char *)(DAT_00101404 + 22)
+ *(char *)&DAT_00101404->attacks[1].skill
|
- DAT_00101404[22]
+ *(char *)&DAT_00101404->attacks[1].skill
)

@unsigned_23@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 23)
+ DAT_00101404->attacks[1].damage
|
- *(undefined1 *)(DAT_00101404 + 23)
+ DAT_00101404->attacks[1].damage
)

@signed_23@
@@
(
- *(char *)(DAT_00101404 + 23)
+ *(char *)&DAT_00101404->attacks[1].damage
|
- DAT_00101404[23]
+ *(char *)&DAT_00101404->attacks[1].damage
)

@unsigned_24@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 24)
+ DAT_00101404->attacks[1].probability
|
- *(undefined1 *)(DAT_00101404 + 24)
+ DAT_00101404->attacks[1].probability
)

@signed_24@
@@
(
- *(char *)(DAT_00101404 + 24)
+ *(char *)&DAT_00101404->attacks[1].probability
|
- DAT_00101404[24]
+ *(char *)&DAT_00101404->attacks[1].probability
)

@unsigned_25@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 25)
+ DAT_00101404->attacks[2].skill
|
- *(undefined1 *)(DAT_00101404 + 25)
+ DAT_00101404->attacks[2].skill
)

@signed_25@
@@
(
- *(char *)(DAT_00101404 + 25)
+ *(char *)&DAT_00101404->attacks[2].skill
|
- DAT_00101404[25]
+ *(char *)&DAT_00101404->attacks[2].skill
)

@unsigned_26@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 26)
+ DAT_00101404->attacks[2].damage
|
- *(undefined1 *)(DAT_00101404 + 26)
+ DAT_00101404->attacks[2].damage
)

@signed_26@
@@
(
- *(char *)(DAT_00101404 + 26)
+ *(char *)&DAT_00101404->attacks[2].damage
|
- DAT_00101404[26]
+ *(char *)&DAT_00101404->attacks[2].damage
)

@unsigned_27@
typedef byte, undefined1;
@@
(
- *(byte *)(DAT_00101404 + 27)
+ DAT_00101404->attacks[2].probability
|
- *(undefined1 *)(DAT_00101404 + 27)
+ DAT_00101404->attacks[2].probability
)

@signed_27@
@@
(
- *(char *)(DAT_00101404 + 27)
+ *(char *)&DAT_00101404->attacks[2].probability
|
- DAT_00101404[27]
+ *(char *)&DAT_00101404->attacks[2].probability
)

@word_34@
typedef ushort, undefined2;
@@
(
- *(ushort *)(DAT_00101404 + 34)
+ DAT_00101404->item_loot[0]
|
- *(undefined2 *)(DAT_00101404 + 34)
+ DAT_00101404->item_loot[0]
)

@word_36@
typedef ushort, undefined2;
@@
(
- *(ushort *)(DAT_00101404 + 36)
+ DAT_00101404->item_loot[1]
|
- *(undefined2 *)(DAT_00101404 + 36)
+ DAT_00101404->item_loot[1]
)

@word_40@
typedef ushort, undefined2;
@@
(
- *(ushort *)(DAT_00101404 + 40)
+ DAT_00101404->experience
|
- *(undefined2 *)(DAT_00101404 + 40)
+ DAT_00101404->experience
)

@attack_19@
expression E;
typedef byte;
@@
(
- *(byte *)(E * 3 + DAT_00101404 + 19)
+ DAT_00101404->attacks[E].skill
|
- *(byte *)(DAT_00101404 + E * 3 + 19)
+ DAT_00101404->attacks[E].skill
)

@attack_20@
expression E;
typedef byte;
@@
(
- *(byte *)(E * 3 + DAT_00101404 + 20)
+ DAT_00101404->attacks[E].damage
|
- *(byte *)(DAT_00101404 + E * 3 + 20)
+ DAT_00101404->attacks[E].damage
)

@attack_21@
expression E;
typedef byte;
@@
(
- *(byte *)(E * 3 + DAT_00101404 + 21)
+ DAT_00101404->attacks[E].probability
|
- *(byte *)(DAT_00101404 + E * 3 + 21)
+ DAT_00101404->attacks[E].probability
)

@row_address_assignment@
expression E;
@@
- DAT_00101404 = &DAT_001007d0 + E
+ DAT_00101404 = &g_monster_type_props[(E) / 0x30]

@byte_row_assignment@
expression E;
typedef byte;
@@
- DAT_00101404 = (char *)((byte *)g_monster_type_props) + E
+ DAT_00101404 = &g_monster_type_props[(E) / 0x30]

@remaining_index@
expression E;
@@
- DAT_00101404[E]
+ ((char *)DAT_00101404)[E]

@remaining_offset@
expression E;
@@
- DAT_00101404 + E
+ (char *)DAT_00101404 + E
