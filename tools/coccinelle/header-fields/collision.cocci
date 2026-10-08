@field_0_item_id@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
|
- ((ushort *)object)[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
|
- *(ushort *)object & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
|
- object[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
|
- *object & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)((char *)object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (((ushort *)object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (((ushort *)object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)object >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)object & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*object >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*object & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object)->flags_res
)
...>
}

@field_0_enchanted@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)((char *)object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (((ushort *)object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (((ushort *)object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)object >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)object & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*object >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*object & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object)->enchanted
)
...>
}

@field_0_doordir@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)((char *)object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (((ushort *)object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (((ushort *)object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)object >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)object & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*object >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*object & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object)->doordir
)
...>
}

@field_0_invisible@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)((char *)object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (((ushort *)object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (((ushort *)object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)object >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)object & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*object >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*object & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object)->invisible
)
...>
}

@field_0_is_quant@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)((char *)object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(ushort *)((char *)object + 0x0) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- ((ushort *)object)[0] >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(ushort *)object >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- object[0] >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *object >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)((char *)object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)((char *)object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
)
...>
}

@field_0_zpos@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- ((ushort *)object)[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- object[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- *(byte *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- (byte)object[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
)
...>
}

@field_0_heading@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (*(ushort *)((char *)object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
|
- (((ushort *)object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (((ushort *)object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
|
- (object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
)
...>
}

@field_0_ypos@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(ushort *)((char *)object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (((ushort *)object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (((ushort *)object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object)->ypos
)
...>
}

@field_0_xpos@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(ushort *)((char *)object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- *(ushort *)((char *)object + 0x2) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- ((ushort *)object)[1] >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- object[1] >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)((char *)object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)((char *)object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object)->xpos
)
...>
}

@field_0_quality@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- ((ushort *)object)[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- object[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- *(byte *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- (byte)object[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
)
...>
}

@field_0_next@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (*(ushort *)((char *)object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- *(ushort *)((char *)object + 0x4) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- ((ushort *)object)[2] >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- object[2] >> 6
+ ((uw_object_hdr_t *)object)->next
)
...>
}

@field_0_owner@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- ((ushort *)object)[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- object[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- *(byte *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- (byte)object[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
)
...>
}

@field_0_link@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (*(ushort *)((char *)object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- *(ushort *)((char *)object + 0x6) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- ((ushort *)object)[3] >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- object[3] >> 6
+ ((uw_object_hdr_t *)object)->link
)
...>
}

@field_1_item_id@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
|
- ((ushort *)puVar7)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
|
- *(ushort *)puVar7 & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
|
- puVar7[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
|
- *puVar7 & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
)
...>
}

@field_1_flags_res@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (((ushort *)puVar7)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (((ushort *)puVar7)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)puVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)puVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (puVar7[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (puVar7[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*puVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*puVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(byte *)((char *)puVar7 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(byte *)((char *)puVar7 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar7)->flags_res
)
...>
}

@field_1_enchanted@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (((ushort *)puVar7)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (((ushort *)puVar7)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)puVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)puVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (puVar7[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (puVar7[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*puVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*puVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(byte *)((char *)puVar7 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar7)->enchanted
)
...>
}

@field_1_doordir@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (((ushort *)puVar7)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (((ushort *)puVar7)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)puVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)puVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (puVar7[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (puVar7[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*puVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*puVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(byte *)((char *)puVar7 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar7)->doordir
)
...>
}

@field_1_invisible@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (((ushort *)puVar7)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (((ushort *)puVar7)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)puVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)puVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (puVar7[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (puVar7[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*puVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*puVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(byte *)((char *)puVar7 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar7)->invisible
)
...>
}

@field_1_is_quant@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *(ushort *)((char *)puVar7 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (((ushort *)puVar7)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (((ushort *)puVar7)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- ((ushort *)puVar7)[0] >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)puVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)puVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *(ushort *)puVar7 >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (puVar7[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (puVar7[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- puVar7[0] >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*puVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*puVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *puVar7 >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(byte *)((char *)puVar7 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar7)->is_quant
)
...>
}

@field_1_zpos@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- ((ushort *)puVar7)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- puVar7[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- *(byte *)((char *)puVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- (byte)puVar7[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
)
...>
}

@field_1_heading@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (((ushort *)puVar7)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (((ushort *)puVar7)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (puVar7[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (puVar7[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
)
...>
}

@field_1_ypos@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (((ushort *)puVar7)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (((ushort *)puVar7)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (puVar7[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (puVar7[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(byte *)((char *)puVar7 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(byte *)((char *)puVar7 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar7)->ypos
)
...>
}

@field_1_xpos@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- *(ushort *)((char *)puVar7 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (((ushort *)puVar7)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (((ushort *)puVar7)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- ((ushort *)puVar7)[1] >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (puVar7[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (puVar7[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- puVar7[1] >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(byte *)((char *)puVar7 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(byte *)((char *)puVar7 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar7)->xpos
)
...>
}

@field_1_quality@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- ((ushort *)puVar7)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- puVar7[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- *(byte *)((char *)puVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- (byte)puVar7[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
)
...>
}

@field_1_next@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (*(ushort *)((char *)puVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- *(ushort *)((char *)puVar7 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- (((ushort *)puVar7)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (((ushort *)puVar7)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- ((ushort *)puVar7)[2] >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- (puVar7[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (puVar7[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- puVar7[2] >> 6
+ ((uw_object_hdr_t *)puVar7)->next
)
...>
}

@field_1_owner@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- ((ushort *)puVar7)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- puVar7[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- *(byte *)((char *)puVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- (byte)puVar7[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
)
...>
}

@field_1_link@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (*(ushort *)((char *)puVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- *(ushort *)((char *)puVar7 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- (((ushort *)puVar7)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (((ushort *)puVar7)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- ((ushort *)puVar7)[3] >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- (puVar7[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (puVar7[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- puVar7[3] >> 6
+ ((uw_object_hdr_t *)puVar7)->link
)
...>
}

@field_2_item_id@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->item_id
|
- ((ushort *)puVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->item_id
|
- *(ushort *)puVar4 & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->item_id
|
- puVar4[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->item_id
|
- *puVar4 & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->item_id
)
...>
}

@field_2_flags_res@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (((ushort *)puVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (((ushort *)puVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)puVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)puVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (puVar4[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (puVar4[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*puVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*puVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar4)->flags_res
)
...>
}

@field_2_enchanted@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (((ushort *)puVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (((ushort *)puVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)puVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)puVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (puVar4[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (puVar4[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*puVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*puVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar4)->enchanted
)
...>
}

@field_2_doordir@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (((ushort *)puVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (((ushort *)puVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)puVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)puVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (puVar4[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (puVar4[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*puVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*puVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar4)->doordir
)
...>
}

@field_2_invisible@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (((ushort *)puVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (((ushort *)puVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)puVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)puVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (puVar4[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (puVar4[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*puVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*puVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar4)->invisible
)
...>
}

@field_2_is_quant@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(ushort *)((char *)puVar4 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (((ushort *)puVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (((ushort *)puVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- ((ushort *)puVar4)[0] >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)puVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)puVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(ushort *)puVar4 >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (puVar4[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (puVar4[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- puVar4[0] >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*puVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*puVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *puVar4 >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)((char *)puVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
)
...>
}

@field_2_zpos@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- ((ushort *)puVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- puVar4[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- *(byte *)((char *)puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- (byte)puVar4[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
)
...>
}

@field_2_heading@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (((ushort *)puVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (((ushort *)puVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (puVar4[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (puVar4[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
)
...>
}

@field_2_ypos@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (((ushort *)puVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (((ushort *)puVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (puVar4[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (puVar4[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar4)->ypos
)
...>
}

@field_2_xpos@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- *(ushort *)((char *)puVar4 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (((ushort *)puVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (((ushort *)puVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- ((ushort *)puVar4)[1] >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (puVar4[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (puVar4[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- puVar4[1] >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)((char *)puVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
)
...>
}

@field_2_quality@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- ((ushort *)puVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- puVar4[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- *(byte *)((char *)puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- (byte)puVar4[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
)
...>
}

@field_2_next@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (*(ushort *)((char *)puVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- *(ushort *)((char *)puVar4 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- (((ushort *)puVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (((ushort *)puVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- ((ushort *)puVar4)[2] >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- (puVar4[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (puVar4[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- puVar4[2] >> 6
+ ((uw_object_hdr_t *)puVar4)->next
)
...>
}

@field_2_owner@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- ((ushort *)puVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- puVar4[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- *(byte *)((char *)puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- (byte)puVar4[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
)
...>
}

@field_2_link@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (*(ushort *)((char *)puVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- *(ushort *)((char *)puVar4 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- (((ushort *)puVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (((ushort *)puVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- ((ushort *)puVar4)[3] >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- (puVar4[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (puVar4[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- puVar4[3] >> 6
+ ((uw_object_hdr_t *)puVar4)->link
)
...>
}
