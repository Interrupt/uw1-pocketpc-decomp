@projectile_spawn_commit_player_move_xpos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^commit_player_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V, W;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0x1fff;
- g_player_object->hdr.position_word_low = (byte)(char)V;
- g_player_object->hdr.position_word_high = (byte)(V >> 8) | (byte)((uint)(((int)(short)W >> 5) << 0xd) >> 8);
+ V = g_player_object->hdr.position_word & 0x1fff;
+ g_player_object->hdr.xpos = (W >> 5) & 7;
)
...>
}

@projectile_spawn_commit_player_move_ypos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^commit_player_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V, W;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0xe3ff;
- g_player_object->hdr.position_word_low = (byte)(char)V;
- g_player_object->hdr.position_word_high = (byte)(V >> 8) | (byte)((uint)(((int)(short)W >> 5) << 0xa) >> 8);
+ V = g_player_object->hdr.position_word & 0xe3ff;
+ g_player_object->hdr.ypos = (W >> 5) & 7;
)
...>
}

@projectile_spawn_commit_player_move_tile_x disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^commit_player_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V, W;
@@
R F(...) {
<...
(
- V = g_player_object->tile_word & 0x3ff;
- g_player_object->tile_word_low = (byte)(char)V;
- g_player_object->tile_word_high = (byte)(V >> 8) | (byte)((uint)(((int)(short)W >> 8) << 10) >> 8);
+ V = g_player_object->tile_word & 0x3ff;
+ g_player_object->tile_x = (W >> 8) & 0x3f;
)
...>
}

@projectile_spawn_commit_player_move_tile_y disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^commit_player_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->tile_word & 0xfc0f | ((int)(short)(DAT_00204882 & 0x3f00) >> 8) << 4;
- g_player_object->tile_word = (ushort)V;
+ g_player_object->tile_y = ((ushort)DAT_00204882 >> 8) & 0x3f;
+ V = g_player_object->tile_word;
)
...>
}

@projectile_spawn_commit_player_move_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^commit_player_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0xfc7f | ((int)(short)DAT_00201c70 >> 0xd & 7U) << 7;
- g_player_object->hdr.position_word = (ushort)V;
+ g_player_object->hdr.heading = ((ushort)DAT_00201c70 >> 13) & 7;
+ V = g_player_object->hdr.position_word;
)
...>
}

@projectile_spawn_commit_player_move_fine_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^commit_player_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- g_player_object->heading_flags = ((byte)(DAT_00201c70 >> 8) ^ g_player_object->heading_flags) & 0x1f ^ g_player_object->heading_flags;
+ g_player_object->fine_heading = ((ushort)DAT_00201c70 >> 8) & 0x1f;
)
...>
}

@projectile_spawn_commit_player_move_frame disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^commit_player_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier H, V;
@@
R F(...) {
<...
(
- H = g_player_object->goal_word & 0xfff;
- g_player_object->goal_word_low = (byte)(char)H;
- g_player_object->goal_word_high = (byte)(H >> 8) | (byte)(((V & 0xc0) << 6) >> 8);
+ H = g_player_object->goal_word & 0xfff;
+ g_player_object->npc_animation_frame = (V >> 6) & 3;
)
...>
}

@projectile_spawn_begin_directional_move_xpos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^begin_directional_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V, W;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0x1fff;
- g_player_object->hdr.position_word_low = (byte)(char)V;
- g_player_object->hdr.position_word_high = (byte)(V >> 8) | (byte)((uint)(((int)(short)W >> 5) << 0xd) >> 8);
+ V = g_player_object->hdr.position_word & 0x1fff;
+ g_player_object->hdr.xpos = (W >> 5) & 7;
)
...>
}

@projectile_spawn_begin_directional_move_ypos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^begin_directional_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V, W;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0xe3ff;
- g_player_object->hdr.position_word_low = (byte)(char)V;
- g_player_object->hdr.position_word_high = (byte)(V >> 8) | (byte)((uint)(((int)(short)W >> 5) << 0xa) >> 8);
+ V = g_player_object->hdr.position_word & 0xe3ff;
+ g_player_object->hdr.ypos = (W >> 5) & 7;
)
...>
}

@projectile_spawn_begin_directional_move_tile_x disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^begin_directional_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V, W;
@@
R F(...) {
<...
(
- V = g_player_object->tile_word & 0x3ff;
- g_player_object->tile_word_low = (byte)(char)V;
- g_player_object->tile_word_high = (byte)(V >> 8) | (byte)((uint)(((int)(short)W >> 8) << 10) >> 8);
+ V = g_player_object->tile_word & 0x3ff;
+ g_player_object->tile_x = (W >> 8) & 0x3f;
)
...>
}

@projectile_spawn_begin_directional_move_tile_y disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^begin_directional_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->tile_word & 0xfc0f | ((int)(short)(DAT_00204882 & 0x3f00) >> 8) << 4;
- g_player_object->tile_word = (ushort)V;
+ g_player_object->tile_y = ((ushort)DAT_00204882 >> 8) & 0x3f;
+ V = g_player_object->tile_word;
)
...>
}

@projectile_spawn_begin_directional_move_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^begin_directional_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0xfc7f | ((int)(short)DAT_00201c70 >> 0xd & 7U) << 7;
- g_player_object->hdr.position_word = (ushort)V;
+ g_player_object->hdr.heading = ((ushort)DAT_00201c70 >> 13) & 7;
+ V = g_player_object->hdr.position_word;
)
...>
}

@projectile_spawn_begin_directional_move_fine_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^begin_directional_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- g_player_object->heading_flags = ((byte)(DAT_00201c70 >> 8) ^ g_player_object->heading_flags) & 0x1f ^ g_player_object->heading_flags;
+ g_player_object->fine_heading = ((ushort)DAT_00201c70 >> 8) & 0x1f;
)
...>
}

@projectile_spawn_begin_directional_move_frame disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^begin_directional_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier H, V;
@@
R F(...) {
<...
(
- H = g_player_object->goal_word & 0xfff;
- g_player_object->goal_word_low = (byte)(char)H;
- g_player_object->goal_word_high = (byte)(H >> 8) | (byte)(((V & 0xc0) << 6) >> 8);
+ H = g_player_object->goal_word & 0xfff;
+ g_player_object->npc_animation_frame = (V >> 6) & 3;
)
...>
}

@projectile_spawn_commit_player_move_zpos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^commit_player_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0xff80;
- g_player_object->hdr.position_word_low = (byte)V | (byte)((int)(((int)DAT_00204884 & 0x3f8U) << 0x10) >> 0x13);
- g_player_object->hdr.position_word_high = (byte)(char)(V >> 8);
+ V = g_player_object->hdr.position_word & 0xff80;
+ g_player_object->hdr.zpos = ((ushort)DAT_00204884 >> 3) & 0x7f;
)
...>
}

@projectile_spawn_set_player_tile_position_zpos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^set_player_tile_position$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0xff80;
- g_player_object->hdr.position_word_low = (byte)V | (byte)((int)(((int)DAT_00204884 & 0x3f8U) << 0x10) >> 0x13);
- g_player_object->hdr.position_word_high = (byte)(char)(V >> 8);
+ V = g_player_object->hdr.position_word & 0xff80;
+ g_player_object->hdr.zpos = ((ushort)DAT_00204884 >> 3) & 0x7f;
)
...>
}

@projectile_spawn_begin_directional_move_step_z disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^begin_directional_move$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar1 = g_player_object->hdr.position_word;
- bVar2 = (byte)uVar1;
- g_player_object->hdr.position_word_low = (bVar2 ^ (byte)DAT_00202c30) & 0x7f ^ bVar2;
- g_player_object->hdr.position_word_high = (byte)(char)((ushort)uVar1 >> 8);
+ uVar1 = g_player_object->hdr.position_word;
+ bVar2 = (byte)uVar1;
+ g_player_object->hdr.zpos = (byte)DAT_00202c30 & 0x7f;
)
...>
}

@projectile_spawn_set_player_tile_position_tile_x disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^set_player_tile_position$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->tile_word & 0x3ff;
- g_player_object->tile_word_low = (byte)(char)V;
- g_player_object->tile_word_high = (byte)(V >> 8) | (byte)(((tile_x & 0x3f) << 10) >> 8);
+ V = g_player_object->tile_word & 0x3ff;
+ g_player_object->tile_x = tile_x & 0x3f;
)
...>
}

@projectile_spawn_set_player_tile_position_tile_y_alias disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^set_player_tile_position$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- g_player_object->npc_yhome = tile_y & 0x3f;
+ g_player_object->tile_y = tile_y & 0x3f;
)
...>
}

@projectile_spawn_set_player_tile_position_xpos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^set_player_tile_position$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0x1fff;
- g_player_object->hdr.position_word_low = (byte)(char)V;
- g_player_object->hdr.position_word_high = (byte)(V >> 8) | 0x60;
+ V = g_player_object->hdr.position_word & 0x1fff;
+ g_player_object->hdr.xpos = 3;
)
...>
}

@projectile_spawn_set_player_tile_position_ypos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^set_player_tile_position$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.position_word & 0xefff;
- g_player_object->hdr.position_word_low = (byte)(char)V;
- g_player_object->hdr.position_word_high = (byte)(V >> 8) | 0xc;
+ V = g_player_object->hdr.position_word & 0xefff;
+ g_player_object->hdr.ypos = 3;
)
...>
}

@projectile_spawn_set_player_tile_position_chain_clear disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^set_player_tile_position$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = g_player_object->hdr.next << 6;
- g_player_object->hdr.chain_word = (ushort)V;
- g_player_object->hdr.chain_word_low = g_player_object->hdr.quality;
- g_player_object->hdr.chain_word_high = 0;
+ V = g_player_object->hdr.next << 6;
+ g_player_object->hdr.chain_word = 0;
)
...>
}
