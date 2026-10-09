@update_xpos disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_object_hdr_t *)pObj)->position_word_low = (byte)(char)uVar6;
- ((uw_object_hdr_t *)pObj)->position_word_high = (byte)(uVar6 >> 8) | bVar1;
+ ((uw_object_hdr_t *)pObj)->xpos = local_34 & 7;
...>
}

@update_ypos disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_object_hdr_t *)pObj)->position_word_low = (byte)(char)uVar6;
- ((uw_object_hdr_t *)pObj)->position_word_high = (byte)(uVar6 >> 8) | bVar1 | (byte)(((local_32 & 7) << 10) >> 8);
+ ((uw_object_hdr_t *)pObj)->ypos = local_32 & 7;
...>
}

@update_tile disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_mobile_object_t *)pObj)->tile_position_low = ((uw_mobile_object_t *)pObj)->tile_position_low & 0xf | (byte)(uVar6 << 4);
- ((uw_mobile_object_t *)pObj)->tile_position_high = (byte)(char)(uVar6 >> 4);
+ ((uw_mobile_object_t *)pObj)->tile_y = local_2e & 0x3f;
+ ((uw_mobile_object_t *)pObj)->tile_x = local_2c & 0x3f;
...>
}

@update_attitude disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- uVar10 = ((uw_mobile_object_t *)pObj)->status_word & 0x3fff;
- ((uw_mobile_object_t *)pObj)->status_word = (ushort)uVar10;
+ uVar10 = ((uw_mobile_object_t *)pObj)->status_word & 0x3fff;
+ ((uw_mobile_object_t *)pObj)->npc_attitude = 0;
...>
}

@update_target_x disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_mobile_object_t *)pObj)->target_word_low = (byte)uVar10 | bVar1;
- ((uw_mobile_object_t *)pObj)->target_word_high = (byte)(char)(uVar10 >> 8);
+ ((uw_mobile_object_t *)pObj)->npc_target_tile_x = bVar1;
...>
}

@update_target_y disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- uVar10 = uVar2 & 0xf000 | (uint)bVar1 | (g_player_object->npc_yhome << 4) << 2;
- ((uw_mobile_object_t *)pObj)->target_word = (ushort)uVar10;
+ uVar10 = uVar2 & 0xf000 | (uint)bVar1 | (g_player_object->npc_yhome << 4) << 2;
+ ((uw_mobile_object_t *)pObj)->npc_target_tile_y = g_player_object->npc_yhome;
...>
}

@update_quality disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_object_hdr_t *)pObj)->chain_word_low = (byte)uVar7 | 0x3f;
- ((uw_object_hdr_t *)pObj)->chain_word_high = (byte)(char)((ushort)uVar7 >> 8);
+ ((uw_object_hdr_t *)pObj)->quality = 0x3f;
...>
}

@update_zpos disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_object_hdr_t *)pObj)->position_word_low = (bVar1 ^ (byte)local_30) & 0x7f ^ bVar1;
- ((uw_object_hdr_t *)pObj)->position_word_high = (byte)(char)((ushort)uVar7 >> 8);
+ ((uw_object_hdr_t *)pObj)->zpos = (byte)local_30 & 0x7f;
...>
}

@update_local_type disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- char *pObj;
+ uw_object_hdr_t *pObj;
...>
}

@update_spawn_type disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- pObj = (char *)spawn_new_object(uVar10,variant == '\x04');
+ pObj = spawn_new_object(uVar10,variant == '\x04');
...>
}

@update_header_fields disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;
identifier M;
@@
R F(...) {
<...
- ((uw_object_hdr_t *)pObj)->M
+ pObj->M
...>
}
