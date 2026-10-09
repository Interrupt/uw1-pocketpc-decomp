@field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)door_texture + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)door_texture)->item_id
|
- ((ushort *)door_texture)[0] & 0x1ff
+ ((uw_object_hdr_t *)door_texture)->item_id
|
- *(ushort *)door_texture & 0x1ff
+ ((uw_object_hdr_t *)door_texture)->item_id
|
- *(ushort *)(door_texture + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)door_texture)->item_id
|
- CONCAT11(door_texture[1], *door_texture) & 0x1ff
+ ((uw_object_hdr_t *)door_texture)->item_id
|
- CONCAT11(door_texture[1], door_texture[0]) & 0x1ff
+ ((uw_object_hdr_t *)door_texture)->item_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(ushort *)((char *)door_texture + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (((ushort *)door_texture)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (((ushort *)door_texture)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(ushort *)door_texture >> 9) & 0x7
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(ushort *)door_texture & 0xe00) >> 9
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(ushort *)(door_texture + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(ushort *)(door_texture + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (CONCAT11(door_texture[1], *door_texture) >> 9) & 0x7
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (CONCAT11(door_texture[1], *door_texture) & 0xe00) >> 9
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (CONCAT11(door_texture[1], door_texture[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (CONCAT11(door_texture[1], door_texture[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(byte *)((char *)door_texture + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(byte *)((char *)door_texture + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(byte *)(door_texture + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)door_texture)->flags_res
|
- (*(byte *)(door_texture + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)door_texture)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(ushort *)((char *)door_texture + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (((ushort *)door_texture)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (((ushort *)door_texture)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(ushort *)door_texture >> 12) & 0x1
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(ushort *)door_texture & 0x1000) >> 12
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(ushort *)(door_texture + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(ushort *)(door_texture + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (CONCAT11(door_texture[1], *door_texture) >> 12) & 0x1
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (CONCAT11(door_texture[1], *door_texture) & 0x1000) >> 12
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (CONCAT11(door_texture[1], door_texture[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (CONCAT11(door_texture[1], door_texture[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(byte *)((char *)door_texture + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(byte *)((char *)door_texture + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(byte *)(door_texture + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)door_texture)->enchanted
|
- (*(byte *)(door_texture + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)door_texture)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(ushort *)((char *)door_texture + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (((ushort *)door_texture)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (((ushort *)door_texture)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(ushort *)door_texture >> 13) & 0x1
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(ushort *)door_texture & 0x2000) >> 13
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(ushort *)(door_texture + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(ushort *)(door_texture + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (CONCAT11(door_texture[1], *door_texture) >> 13) & 0x1
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (CONCAT11(door_texture[1], *door_texture) & 0x2000) >> 13
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (CONCAT11(door_texture[1], door_texture[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (CONCAT11(door_texture[1], door_texture[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(byte *)((char *)door_texture + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(byte *)((char *)door_texture + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(byte *)(door_texture + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)door_texture)->doordir
|
- (*(byte *)(door_texture + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)door_texture)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(ushort *)((char *)door_texture + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (((ushort *)door_texture)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (((ushort *)door_texture)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(ushort *)door_texture >> 14) & 0x1
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(ushort *)door_texture & 0x4000) >> 14
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(ushort *)(door_texture + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(ushort *)(door_texture + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (CONCAT11(door_texture[1], *door_texture) >> 14) & 0x1
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (CONCAT11(door_texture[1], *door_texture) & 0x4000) >> 14
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (CONCAT11(door_texture[1], door_texture[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (CONCAT11(door_texture[1], door_texture[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(byte *)((char *)door_texture + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(byte *)((char *)door_texture + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(byte *)(door_texture + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)door_texture)->invisible
|
- (*(byte *)(door_texture + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)door_texture)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(ushort *)((char *)door_texture + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (((ushort *)door_texture)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (((ushort *)door_texture)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(ushort *)door_texture >> 15) & 0x1
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(ushort *)door_texture & 0x8000) >> 15
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(ushort *)(door_texture + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(ushort *)(door_texture + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (CONCAT11(door_texture[1], *door_texture) >> 15) & 0x1
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (CONCAT11(door_texture[1], *door_texture) & 0x8000) >> 15
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (CONCAT11(door_texture[1], door_texture[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (CONCAT11(door_texture[1], door_texture[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(byte *)((char *)door_texture + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(byte *)((char *)door_texture + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- *(byte *)((char *)door_texture + 0x1) >> 7
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(byte *)(door_texture + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- (*(byte *)(door_texture + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)door_texture)->is_quant
|
- *(byte *)(door_texture + 0x1) >> 7
+ ((uw_object_hdr_t *)door_texture)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)door_texture + 0x2) & 0x7f
+ ((uw_object_hdr_t *)door_texture)->zpos
|
- ((ushort *)door_texture)[1] & 0x7f
+ ((uw_object_hdr_t *)door_texture)->zpos
|
- *(ushort *)(door_texture + 0x2) & 0x7f
+ ((uw_object_hdr_t *)door_texture)->zpos
|
- *(byte *)((char *)door_texture + 0x2) & 0x7f
+ ((uw_object_hdr_t *)door_texture)->zpos
|
- door_texture[2] & 0x7f
+ ((uw_object_hdr_t *)door_texture)->zpos
|
- *(byte *)(door_texture + 0x2) & 0x7f
+ ((uw_object_hdr_t *)door_texture)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)door_texture)->heading
|
- (*(ushort *)((char *)door_texture + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)door_texture)->heading
|
- (((ushort *)door_texture)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)door_texture)->heading
|
- (((ushort *)door_texture)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)door_texture)->heading
|
- (*(ushort *)(door_texture + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)door_texture)->heading
|
- (*(ushort *)(door_texture + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)door_texture)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (*(ushort *)((char *)door_texture + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (((ushort *)door_texture)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (((ushort *)door_texture)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (*(ushort *)(door_texture + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (*(ushort *)(door_texture + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (*(byte *)((char *)door_texture + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (*(byte *)((char *)door_texture + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (*(byte *)(door_texture + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)door_texture)->ypos
|
- (*(byte *)(door_texture + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)door_texture)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (*(ushort *)((char *)door_texture + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (((ushort *)door_texture)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (((ushort *)door_texture)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (*(ushort *)(door_texture + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (*(ushort *)(door_texture + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (*(byte *)((char *)door_texture + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (*(byte *)((char *)door_texture + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- *(byte *)((char *)door_texture + 0x3) >> 5
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (*(byte *)(door_texture + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- (*(byte *)(door_texture + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)door_texture)->xpos
|
- *(byte *)(door_texture + 0x3) >> 5
+ ((uw_object_hdr_t *)door_texture)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)door_texture + 0x4) & 0x3f
+ ((uw_object_hdr_t *)door_texture)->quality
|
- ((ushort *)door_texture)[2] & 0x3f
+ ((uw_object_hdr_t *)door_texture)->quality
|
- *(ushort *)(door_texture + 0x4) & 0x3f
+ ((uw_object_hdr_t *)door_texture)->quality
|
- *(byte *)((char *)door_texture + 0x4) & 0x3f
+ ((uw_object_hdr_t *)door_texture)->quality
|
- door_texture[4] & 0x3f
+ ((uw_object_hdr_t *)door_texture)->quality
|
- *(byte *)(door_texture + 0x4) & 0x3f
+ ((uw_object_hdr_t *)door_texture)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)door_texture)->next
|
- (*(ushort *)((char *)door_texture + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)door_texture)->next
|
- (((ushort *)door_texture)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)door_texture)->next
|
- (((ushort *)door_texture)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)door_texture)->next
|
- (*(ushort *)(door_texture + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)door_texture)->next
|
- (*(ushort *)(door_texture + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)door_texture)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)door_texture + 0x6) & 0x3f
+ ((uw_object_hdr_t *)door_texture)->owner
|
- ((ushort *)door_texture)[3] & 0x3f
+ ((uw_object_hdr_t *)door_texture)->owner
|
- *(ushort *)(door_texture + 0x6) & 0x3f
+ ((uw_object_hdr_t *)door_texture)->owner
|
- *(byte *)((char *)door_texture + 0x6) & 0x3f
+ ((uw_object_hdr_t *)door_texture)->owner
|
- door_texture[6] & 0x3f
+ ((uw_object_hdr_t *)door_texture)->owner
|
- *(byte *)(door_texture + 0x6) & 0x3f
+ ((uw_object_hdr_t *)door_texture)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)door_texture + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)door_texture)->link
|
- (*(ushort *)((char *)door_texture + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)door_texture)->link
|
- (((ushort *)door_texture)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)door_texture)->link
|
- (((ushort *)door_texture)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)door_texture)->link
|
- (*(ushort *)(door_texture + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)door_texture)->link
|
- (*(ushort *)(door_texture + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)door_texture)->link
)
...>
}
