@load_rows@
expression H;
@@
- read_file_handle(H, &DAT_001007d0, 0xc00)
+ read_file_handle(H, g_monster_type_props, sizeof g_monster_type_props)

@armor_zone@
@@
void apply_melee_damage(...) {
<...
- (&DAT_001007d0)[iVar11 + uw_ord2005_rem_8]
+ g_monster_type_props[iVar11 / 0x30].armor[uw_ord2005_rem_8]
...>
}

@armor_chest@
@@
void apply_melee_damage(...) {
<...
- (&DAT_001007d0)[iVar11]
+ g_monster_type_props[iVar11 / 0x30].armor[0]
...>
}

@attack_damage@
type R;
@@
R resolve_npc_melee_attack(...) {
<...
- (&DAT_001007d0)[iVar5 + 0x14]
+ g_monster_type_props[iVar6 / 0x30].attacks[offset_x].damage
...>
}

@attack_skill@
type R;
@@
R resolve_npc_melee_attack(...) {
<...
- (&DAT_001007d0)[iVar5 + 0x13]
+ g_monster_type_props[iVar6 / 0x30].attacks[offset_x].skill
...>
}

@signed_experience@
expression E;
@@
void award_monster_kill_experience(...) {
<...
- *(short *)(&DAT_001007f8 + E)
+ (short)g_monster_type_props[(E) / 0x30].experience
...>
}

/* The enclosing path rejects zero in these spell selection bits before
 * indexing. Spell slots 1..3 map to OBJECTS.DAT offsets 0x2a..0x2c. */
@selected_npc_spell@
type R;
@@
R npc_ai_tick(...) {
<...
- ((char *)DAT_00101404)[(DAT_0010190c->npc_ai_flags >> 2 & 3) + 0x29]
+ *(char *)&DAT_00101404->spells[(DAT_0010190c->npc_ai_flags >> 2 & 3) - 1]
...>
}

@row_index_units@
expression E;
@@
- g_monster_type_props[(E * 0x30) / 0x30]
+ g_monster_type_props[E]

/* This legacy word spans two separate UW1 trading bytes. */
@trade_patience_nibble@
expression E;
typedef ushort;
@@
- *(ushort *)(&DAT_001007dd + E) >> 0xc
+ g_monster_type_props[(E) / 0x30].trade_patience >> 4

@trade_level_nibble@
expression E;
typedef ushort;
@@
- *(ushort *)(&DAT_001007dd + E) & 0xf
+ g_monster_type_props[(E) / 0x30].trade_level & 0xf
