@projectile_spawn_precise_x disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 11) = (char)V;
- *(char *)(puVar6 + 6) = (char)((uint)V >> 8);
+ puVar6->precise_x = (ushort)V;
)
...>
}

@projectile_spawn_precise_y disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 13) = (char)V;
- *(char *)(puVar6 + 7) = (char)((uint)V >> 8);
+ puVar6->precise_y = (ushort)V;
)
...>
}

@projectile_spawn_precise_z disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier V;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 15) = (char)V;
- *(char *)(puVar6 + 8) = (char)((uint)V >> 8);
+ puVar6->precise_z = (ushort)V;
)
...>
}

@projectile_spawn_tile_x disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar6[11] >> 10
+ puVar6->tile_x
)
...>
}

@projectile_spawn_tile_y disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (puVar6[11] & 0x3f0) >> 4
+ puVar6->tile_y
)
...>
}

@projectile_spawn_tile_y_precise disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (puVar6[11] & 0x3f0) * 0x10
+ (puVar6->tile_y << 8)
|
- (puVar6->tile_position & 0x3f0) * 0x10
+ (puVar6->tile_y << 8)
)
...>
}

@projectile_spawn_tile_x_precise disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (puVar6[11] & 0xfc00) >> 2
+ (puVar6->tile_x << 8)
)
...>
}

@projectile_spawn_tile_debug_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar6[11]
+ puVar6->tile_position
)
...>
}

@projectile_spawn_fine_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(puVar6 + 12) = ((byte)DAT_00202a54 ^ (byte)puVar6[12]) & 0x1f ^ (byte)puVar6[12];
+ puVar6->fine_heading = (byte)DAT_00202a54 & 0x1f;
)
...>
}

@projectile_spawn_speed disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 19) = ((byte)DAT_00202a48 ^ *(byte *)((char *)puVar6 + 19)) & 0x7f ^ *(byte *)((char *)puVar6 + 19);
+ puVar6->speed = (byte)DAT_00202a48 & 0x7f;
)
...>
}

@projectile_spawn_pitch disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(puVar6 + 10) = (char)DAT_00202a3c * '\b' + 0x87U & 0xf9 | 1;
+ puVar6->pitch_flags = 1;
+ puVar6->pitch = ((char)DAT_00202a3c + 16) & 0x1f;
)
...>
}

@projectile_spawn_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 9) = E;
+ puVar6->heading = (byte)E;
)
...>
}

@projectile_spawn_source_slot disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(puVar6 + 9) = E;
+ puVar6->source_slot = (byte)E;
)
...>
}

@projectile_spawn_animation_flags disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 21)
+ puVar6->animation_flags
)
...>
}

@projectile_spawn_template_fine_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)DAT_00202a44[12] & 0x1f
+ ((uw_projectile_object_t *)DAT_00202a44)->fine_heading
)
...>
}

@projectile_spawn_template_header_type disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *DAT_00202a44
+ ((uw_object_hdr_t *)DAT_00202a44)->type_flags
)
...>
}

@projectile_spawn_template_header_position disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- DAT_00202a44[1]
+ ((uw_object_hdr_t *)DAT_00202a44)->position_word
)
...>
}

@projectile_spawn_template_header_high disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_00202a44 + 3)
+ ((uw_object_hdr_t *)DAT_00202a44)->position_word_high
)
...>
}

@projectile_spawn_template_item_id disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)DAT_00202a44)->type_flags & 0x1ff
+ ((uw_object_hdr_t *)DAT_00202a44)->object_id
)
...>
}

@projectile_spawn_template_class disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)DAT_00202a44)->type_flags & 0x1c0
+ ((uw_object_hdr_t *)DAT_00202a44)->object_id & 0x1c0
)
...>
}

@projectile_spawn_launch_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- DAT_00202a54 = (((uw_object_hdr_t *)DAT_00202a44)->position_word >> 2 & 0xffe0) + DAT_00202a40 + uVar9 & 0xff;
+ DAT_00202a54 = (((uw_object_hdr_t *)DAT_00202a44)->heading << 5) + DAT_00202a40 + uVar9 & 0xff;
)
...>
}

@projectile_spawn_header_receiver disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
identifier M;
@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar6)->M
+ puVar6->hdr.M
)
...>
}

@projectile_spawn_next_clear disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar6->hdr.chain_word_low = puVar6->hdr.quality;
- puVar6->hdr.chain_word_high = 0;
+ puVar6->hdr.next = 0;
)
...>
}

@projectile_spawn_link_one disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar6->hdr.link_word_low = puVar6->hdr.owner | 0x40;
- puVar6->hdr.link_word_high = 0;
+ puVar6->hdr.link = 1;
)
...>
}

@projectile_spawn_quantity disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar7 = puVar6->hdr.type_flags | 0x8000;
- puVar6->hdr.type_flags_low = (byte)(char)puVar6->hdr.type_flags;
- puVar6->hdr.type_flags_high = (byte)(char)(uVar7 >> 8);
+ uVar7 = puVar6->hdr.type_flags | 0x8000;
+ puVar6->hdr.is_quant = 1;
)
...>
}

@projectile_spawn_object_id disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar7 = (uVar7 ^ (int)DAT_00202a38) & 0x1ff ^ uVar7;
- puVar6->hdr.type_flags = (ushort)uVar7;
+ puVar6->hdr.object_id = (int)DAT_00202a38 & 0x1ff;
+ uVar7 = puVar6->hdr.type_flags;
)
...>
}

@projectile_spawn_coarse_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar7 = puVar6->hdr.position_word & 0xfc7f | ((int)(short)(DAT_00202a54 & 0xe0) >> 5) << 7;
- puVar6->hdr.position_word = (ushort)uVar7;
+ puVar6->hdr.heading = (DAT_00202a54 >> 5) & 7;
+ uVar7 = puVar6->hdr.position_word;
)
...>
}

@projectile_spawn_doordir disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar9 = puVar6->hdr.type_flags;
- puVar6->hdr.type_flags_low = (byte)(char)(uVar9 & 0xdfff);
- puVar6->hdr.type_flags_high = (byte)(char)((uVar9 & 0xdfff) >> 8);
+ uVar9 = puVar6->hdr.type_flags;
+ puVar6->hdr.doordir = 0;
)
...>
}

@projectile_spawn_owner disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar9 = puVar6->hdr.link_word;
- puVar6->hdr.link_word_low = (byte)(char)(uVar9 & 0xffc0);
- puVar6->hdr.link_word_high = (byte)(char)((uVar9 & 0xffc0) >> 8);
+ uVar9 = puVar6->hdr.link_word;
+ puVar6->hdr.owner = 0;
)
...>
}

@projectile_spawn_zpos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar7 = (uint)puVar6->hdr.position_word;
- uVar7 = ((byte)((uw_object_hdr_t *)DAT_00202a44)->position_word ^ uVar7) & 0x7f ^ uVar7;
- puVar6->hdr.position_word_low = (byte)(char)uVar7;
- puVar6->hdr.position_word_high = puVar6->hdr.position_word_high;
+ puVar6->hdr.zpos = ((uw_object_hdr_t *)DAT_00202a44)->zpos;
+ uVar7 = puVar6->hdr.position_word;
)
...>
}

@projectile_spawn_position_copy disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar7 = (uVar7 ^ ((uw_object_hdr_t *)DAT_00202a44)->position_word) & 0x1fff ^ (uint)((uw_object_hdr_t *)DAT_00202a44)->position_word;
- bVar1 = (byte)uVar7;
- puVar6->hdr.position_word_low = bVar1;
- bVar2 = (byte)(uVar7 >> 8);
- puVar6->hdr.position_word_high = bVar2;
- bVar2 = (((uw_object_hdr_t *)DAT_00202a44)->position_word_high ^ bVar2) & 0x1c ^ bVar2;
- puVar6->hdr.position_word_low = bVar1;
- puVar6->hdr.position_word_high = bVar2;
+ puVar6->hdr.xpos = ((uw_object_hdr_t *)DAT_00202a44)->xpos;
+ uVar7 = puVar6->hdr.position_word;
+ bVar1 = (byte)uVar7;
+ bVar2 = (byte)(uVar7 >> 8);
+ puVar6->hdr.ypos = ((uw_object_hdr_t *)DAT_00202a44)->ypos;
+ bVar2 = puVar6->hdr.position_word_high;
)
...>
}

@projectile_spawn_height_adjust disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- bVar3 = (cVar4 + (char)DAT_00202a3c * '\x02' + (bVar1 & 0x7f) ^ bVar1) & 0x7f ^ bVar1;
- puVar6->hdr.position_word_low = bVar3;
- puVar6->hdr.position_word_high = bVar2;
+ puVar6->hdr.zpos = cVar4 + (char)DAT_00202a3c * '\x02' + (bVar1 & 0x7f);
+ bVar3 = puVar6->hdr.position_word_low;
)
...>
}

@projectile_spawn_crouch_height disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar6->hdr.position_word_low = (((char)DAT_00202a3c * '\x02' - (*(byte *)(DAT_00086df8 + 0xb9) >> 3)) + g_object_type_props[(((uw_object_hdr_t *)DAT_00202a44)->object_id)].height + (bVar1 & 0x7f) ^ bVar3) & 0x7f ^ bVar3;
- puVar6->hdr.position_word_high = bVar2;
+ puVar6->hdr.zpos = ((char)DAT_00202a3c * '\x02' - (*(byte *)(DAT_00086df8 + 0xb9) >> 3)) + g_object_type_props[(((uw_object_hdr_t *)DAT_00202a44)->object_id)].height + (bVar1 & 0x7f);
)
...>
}

@projectile_spawn_pointer disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ushort *puVar6;
+ uw_projectile_object_t *puVar6;
)
...>
}

@projectile_spawn_allocate disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar6 = (ushort *)alloc_object_slot(1);
+ puVar6 = (uw_projectile_object_t *)alloc_object_slot(1);
)
...>
}

@projectile_spawn_null_assignment disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar6 = (ushort *)0x0;
+ puVar6 = NULL;
)
...>
}

@projectile_spawn_null_check disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar6 == (ushort *)0x0
+ puVar6 == NULL
)
...>
}

@projectile_spawn_drop_boundary disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- check_object_drop_height(puVar6,DAT_00202a44)
+ check_object_drop_height((ushort *)puVar6,DAT_00202a44)
)
...>
}

@projectile_spawn_free_boundary disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- free_object_slot(puVar6)
+ free_object_slot(&puVar6->hdr)
)
...>
}

@projectile_spawn_sound_boundary disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- play_sound_effect_at_object(10,puVar6,0)
+ play_sound_effect_at_object(10,(ushort *)puVar6,0)
)
...>
}

@projectile_spawn_list_boundary disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- object_list_insert_head(pbTile + 2,puVar6)
+ object_list_insert_head(pbTile + 2,&puVar6->hdr)
)
...>
}

@projectile_spawn_return_boundary disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^spawn_object_near_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- return puVar6;
+ return (uw_object_hdr_t *)puVar6;
)
...>
}
