@field_0_item_id@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar11)->item_id
|
- ((ushort *)uVar11)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar11)->item_id
|
- *(ushort *)uVar11 & 0x1ff
+ ((uw_object_hdr_t *)uVar11)->item_id
|
- uVar11[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar11)->item_id
|
- *uVar11 & 0x1ff
+ ((uw_object_hdr_t *)uVar11)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (*(ushort *)((char *)uVar11 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (((ushort *)uVar11)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (((ushort *)uVar11)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (*(ushort *)uVar11 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (*(ushort *)uVar11 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (uVar11[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (uVar11[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (*uVar11 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (*uVar11 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (*(byte *)((char *)uVar11 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar11)->flags_res
|
- (*(byte *)((char *)uVar11 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar11)->flags_res
)
...>
}

@field_0_enchanted@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (*(ushort *)((char *)uVar11 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (((ushort *)uVar11)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (((ushort *)uVar11)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (*(ushort *)uVar11 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (*(ushort *)uVar11 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (uVar11[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (uVar11[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (*uVar11 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (*uVar11 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (*(byte *)((char *)uVar11 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar11)->enchanted
|
- (*(byte *)((char *)uVar11 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar11)->enchanted
)
...>
}

@field_0_doordir@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (*(ushort *)((char *)uVar11 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (((ushort *)uVar11)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (((ushort *)uVar11)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (*(ushort *)uVar11 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (*(ushort *)uVar11 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (uVar11[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (uVar11[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (*uVar11 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (*uVar11 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (*(byte *)((char *)uVar11 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar11)->doordir
|
- (*(byte *)((char *)uVar11 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar11)->doordir
)
...>
}

@field_0_invisible@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (*(ushort *)((char *)uVar11 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (((ushort *)uVar11)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (((ushort *)uVar11)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (*(ushort *)uVar11 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (*(ushort *)uVar11 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (uVar11[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (uVar11[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (*uVar11 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (*uVar11 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (*(byte *)((char *)uVar11 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar11)->invisible
|
- (*(byte *)((char *)uVar11 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar11)->invisible
)
...>
}

@field_0_is_quant@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (*(ushort *)((char *)uVar11 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- *(ushort *)((char *)uVar11 + 0x0) >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (((ushort *)uVar11)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (((ushort *)uVar11)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- ((ushort *)uVar11)[0] >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (*(ushort *)uVar11 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (*(ushort *)uVar11 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- *(ushort *)uVar11 >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (uVar11[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (uVar11[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- uVar11[0] >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (*uVar11 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (*uVar11 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- *uVar11 >> 15
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (*(byte *)((char *)uVar11 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar11)->is_quant
|
- (*(byte *)((char *)uVar11 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar11)->is_quant
)
...>
}

@field_0_zpos@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar11)->zpos
|
- ((ushort *)uVar11)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar11)->zpos
|
- uVar11[1] & 0x7f
+ ((uw_object_hdr_t *)uVar11)->zpos
|
- *(byte *)((char *)uVar11 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar11)->zpos
|
- (byte)uVar11[1] & 0x7f
+ ((uw_object_hdr_t *)uVar11)->zpos
)
...>
}

@field_0_heading@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar11)->heading
|
- (*(ushort *)((char *)uVar11 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar11)->heading
|
- (((ushort *)uVar11)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar11)->heading
|
- (((ushort *)uVar11)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar11)->heading
|
- (uVar11[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar11)->heading
|
- (uVar11[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar11)->heading
)
...>
}

@field_0_ypos@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar11)->ypos
|
- (*(ushort *)((char *)uVar11 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar11)->ypos
|
- (((ushort *)uVar11)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar11)->ypos
|
- (((ushort *)uVar11)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar11)->ypos
|
- (uVar11[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar11)->ypos
|
- (uVar11[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar11)->ypos
|
- (*(byte *)((char *)uVar11 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar11)->ypos
|
- (*(byte *)((char *)uVar11 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar11)->ypos
)
...>
}

@field_0_xpos@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- (*(ushort *)((char *)uVar11 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- *(ushort *)((char *)uVar11 + 0x2) >> 13
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- (((ushort *)uVar11)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- (((ushort *)uVar11)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- ((ushort *)uVar11)[1] >> 13
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- (uVar11[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- (uVar11[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- uVar11[1] >> 13
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- (*(byte *)((char *)uVar11 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar11)->xpos
|
- (*(byte *)((char *)uVar11 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar11)->xpos
)
...>
}

@field_0_quality@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar11)->quality
|
- ((ushort *)uVar11)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar11)->quality
|
- uVar11[2] & 0x3f
+ ((uw_object_hdr_t *)uVar11)->quality
|
- *(byte *)((char *)uVar11 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar11)->quality
|
- (byte)uVar11[2] & 0x3f
+ ((uw_object_hdr_t *)uVar11)->quality
)
...>
}

@field_0_next@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar11)->next
|
- (*(ushort *)((char *)uVar11 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar11)->next
|
- *(ushort *)((char *)uVar11 + 0x4) >> 6
+ ((uw_object_hdr_t *)uVar11)->next
|
- (((ushort *)uVar11)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar11)->next
|
- (((ushort *)uVar11)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar11)->next
|
- ((ushort *)uVar11)[2] >> 6
+ ((uw_object_hdr_t *)uVar11)->next
|
- (uVar11[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar11)->next
|
- (uVar11[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar11)->next
|
- uVar11[2] >> 6
+ ((uw_object_hdr_t *)uVar11)->next
)
...>
}

@field_0_owner@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar11)->owner
|
- ((ushort *)uVar11)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar11)->owner
|
- uVar11[3] & 0x3f
+ ((uw_object_hdr_t *)uVar11)->owner
|
- *(byte *)((char *)uVar11 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar11)->owner
|
- (byte)uVar11[3] & 0x3f
+ ((uw_object_hdr_t *)uVar11)->owner
)
...>
}

@field_0_link@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar11 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar11)->link
|
- (*(ushort *)((char *)uVar11 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar11)->link
|
- *(ushort *)((char *)uVar11 + 0x6) >> 6
+ ((uw_object_hdr_t *)uVar11)->link
|
- (((ushort *)uVar11)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar11)->link
|
- (((ushort *)uVar11)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar11)->link
|
- ((ushort *)uVar11)[3] >> 6
+ ((uw_object_hdr_t *)uVar11)->link
|
- (uVar11[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar11)->link
|
- (uVar11[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar11)->link
|
- uVar11[3] >> 6
+ ((uw_object_hdr_t *)uVar11)->link
)
...>
}
