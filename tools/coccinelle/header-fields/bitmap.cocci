@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_o)->object_id
|
- ((ushort *)_o)[0] & 0x1ff
+ ((uw_object_hdr_t *)_o)->object_id
|
- *(ushort *)_o & 0x1ff
+ ((uw_object_hdr_t *)_o)->object_id
|
- *(ushort *)(_o + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_o)->object_id
|
- CONCAT11(_o[1], *_o) & 0x1ff
+ ((uw_object_hdr_t *)_o)->object_id
|
- CONCAT11(_o[1], _o[0]) & 0x1ff
+ ((uw_object_hdr_t *)_o)->object_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(ushort *)((char *)_o + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (((ushort *)_o)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (((ushort *)_o)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(ushort *)_o >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(ushort *)_o & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(ushort *)(_o + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(ushort *)(_o + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (CONCAT11(_o[1], *_o) >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (CONCAT11(_o[1], *_o) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (CONCAT11(_o[1], _o[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (CONCAT11(_o[1], _o[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(byte *)((char *)_o + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(byte *)((char *)_o + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(byte *)(_o + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(byte *)(_o + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_o)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(ushort *)((char *)_o + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (((ushort *)_o)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (((ushort *)_o)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(ushort *)_o >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(ushort *)_o & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(ushort *)(_o + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(ushort *)(_o + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (CONCAT11(_o[1], *_o) >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (CONCAT11(_o[1], *_o) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (CONCAT11(_o[1], _o[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (CONCAT11(_o[1], _o[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(byte *)((char *)_o + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(byte *)((char *)_o + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(byte *)(_o + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(byte *)(_o + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_o)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(ushort *)((char *)_o + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (((ushort *)_o)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (((ushort *)_o)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(ushort *)_o >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(ushort *)_o & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(ushort *)(_o + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(ushort *)(_o + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (CONCAT11(_o[1], *_o) >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (CONCAT11(_o[1], *_o) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (CONCAT11(_o[1], _o[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (CONCAT11(_o[1], _o[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(byte *)((char *)_o + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(byte *)((char *)_o + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(byte *)(_o + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(byte *)(_o + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_o)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(ushort *)((char *)_o + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (((ushort *)_o)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (((ushort *)_o)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(ushort *)_o >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(ushort *)_o & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(ushort *)(_o + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(ushort *)(_o + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (CONCAT11(_o[1], *_o) >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (CONCAT11(_o[1], *_o) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (CONCAT11(_o[1], _o[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (CONCAT11(_o[1], _o[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(byte *)((char *)_o + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(byte *)((char *)_o + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(byte *)(_o + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(byte *)(_o + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_o)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(ushort *)((char *)_o + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (((ushort *)_o)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (((ushort *)_o)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(ushort *)_o >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(ushort *)_o & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(ushort *)(_o + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(ushort *)(_o + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (CONCAT11(_o[1], *_o) >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (CONCAT11(_o[1], *_o) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (CONCAT11(_o[1], _o[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (CONCAT11(_o[1], _o[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(byte *)((char *)_o + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(byte *)((char *)_o + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_o)->is_quant
|
- *(byte *)((char *)_o + 0x1) >> 7
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(byte *)(_o + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(byte *)(_o + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_o)->is_quant
|
- *(byte *)(_o + 0x1) >> 7
+ ((uw_object_hdr_t *)_o)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- ((ushort *)_o)[1] & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- *(ushort *)(_o + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- *(byte *)((char *)_o + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- _o[2] & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- *(byte *)(_o + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_o)->heading
|
- (*(ushort *)((char *)_o + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_o)->heading
|
- (((ushort *)_o)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_o)->heading
|
- (((ushort *)_o)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_o)->heading
|
- (*(ushort *)(_o + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_o)->heading
|
- (*(ushort *)(_o + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_o)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(ushort *)((char *)_o + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_o)->ypos
|
- (((ushort *)_o)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (((ushort *)_o)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(ushort *)(_o + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(ushort *)(_o + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(byte *)((char *)_o + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(byte *)((char *)_o + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(byte *)(_o + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(byte *)(_o + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_o)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(ushort *)((char *)_o + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- (((ushort *)_o)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (((ushort *)_o)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(ushort *)(_o + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(ushort *)(_o + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(byte *)((char *)_o + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(byte *)((char *)_o + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_o)->xpos
|
- *(byte *)((char *)_o + 0x3) >> 5
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(byte *)(_o + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(byte *)(_o + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_o)->xpos
|
- *(byte *)(_o + 0x3) >> 5
+ ((uw_object_hdr_t *)_o)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- ((ushort *)_o)[2] & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- *(ushort *)(_o + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- *(byte *)((char *)_o + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- _o[4] & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- *(byte *)(_o + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->next
|
- (*(ushort *)((char *)_o + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->next
|
- (((ushort *)_o)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->next
|
- (((ushort *)_o)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->next
|
- (*(ushort *)(_o + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->next
|
- (*(ushort *)(_o + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- ((ushort *)_o)[3] & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- *(ushort *)(_o + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- *(byte *)((char *)_o + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- _o[6] & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- *(byte *)(_o + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->link
|
- (*(ushort *)((char *)_o + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->link
|
- (((ushort *)_o)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->link
|
- (((ushort *)_o)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->link
|
- (*(ushort *)(_o + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->link
|
- (*(ushort *)(_o + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->link
)
...>
}
