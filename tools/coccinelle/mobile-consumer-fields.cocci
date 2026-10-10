@projectile_spawn_wander_saved_ai_byte disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^detect_npc_wander_proximity$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x19)
+ ((uw_mobile_object_t *)puVar7)->npc_ai_flags
)
...>
}

@projectile_spawn_npc_animation_snapshot_low disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_ai_default_tick$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- npc_rec = (char *)DAT_0010190c;
- uVar2 = DAT_0010190c->goal_word;
- uw_ord2005_rem_96 = ((int)((uVar2 >> 0xc) + 1)) % (4);
- uVar11 = uVar2 & 0xfff;
- *(char *)(npc_rec + 0xb) = (char)uVar11;
+ npc_rec = (char *)DAT_0010190c;
+ uVar2 = DAT_0010190c->goal_word;
+ uw_ord2005_rem_96 = ((int)((uVar2 >> 0xc) + 1)) % (4);
+ uVar11 = uVar2 & 0xfff;
+ ((uw_mobile_object_t *)npc_rec)->goal_word_low = (byte)(char)uVar11;
)
...>
}

@projectile_spawn_npc_armor_status_bit disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^apply_melee_damage$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (puVar6[7] & 4)
+ (((uw_mobile_object_t *)puVar6)->status_word_high & 4)
)
...>
}
