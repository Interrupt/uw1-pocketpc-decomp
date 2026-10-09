@projectile_spawn_drop_held_object_near_player_lifetime disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^drop_held_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(puVar5 + 4) = (byte)held_object[2] & 0x3f;
+ ((uw_projectile_object_t *)puVar5)->lifetime = ((uw_object_hdr_t *)held_object)->quality;
)
...>
}

@projectile_spawn_drop_held_object_near_player_saved_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^drop_held_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(puVar5 + 0xd) = (byte)(held_object[1] >> 7) & 7;
+ ((uw_projectile_object_t *)puVar5)->original_heading = ((uw_object_hdr_t *)held_object)->heading;
)
...>
}

@projectile_spawn_fire_ranged_weapon_lifetime disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^fire_ranged_weapon$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(puVar6 + 4) = (byte)puVar7[2] & 0x3f;
+ ((uw_projectile_object_t *)puVar6)->lifetime = ((uw_object_hdr_t *)puVar7)->quality;
)
...>
}

@projectile_spawn_fire_ranged_weapon_saved_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^fire_ranged_weapon$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(puVar6 + 0xd) = (byte)(puVar7[1] >> 7) & 7;
+ ((uw_projectile_object_t *)puVar6)->original_heading = ((uw_object_hdr_t *)puVar7)->heading;
)
...>
}

@projectile_spawn_reallocate_saved_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^reallocate_object_to_arena$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(puVar2 + 0xd) = ((uw_object_hdr_t *)object)->heading;
+ ((uw_projectile_object_t *)puVar2)->original_heading = ((uw_object_hdr_t *)object)->heading;
)
...>
}

@projectile_spawn_settle_saved_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^settle_mobile_to_immobile$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar11 = ((uw_object_hdr_t *)puVar9)->position_word & 0xfc7f | ((byte)object[0xd] & 7) << 7;
- ((uw_object_hdr_t *)puVar9)->position_word = (ushort)uVar11;
+ ((uw_object_hdr_t *)puVar9)->heading = ((uw_projectile_object_t *)object)->original_heading & 7;
+ uVar11 = ((uw_object_hdr_t *)puVar9)->position_word;
)
...>
}
