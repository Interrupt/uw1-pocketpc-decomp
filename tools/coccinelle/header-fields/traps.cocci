@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
|
- ((ushort *)puVar8)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
|
- *(ushort *)puVar8 & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
|
- puVar8[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
|
- *puVar8 & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (((ushort *)puVar8)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (((ushort *)puVar8)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)puVar8 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)puVar8 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (puVar8[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (puVar8[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*puVar8 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*puVar8 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(byte *)((char *)puVar8 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(byte *)((char *)puVar8 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar8)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (((ushort *)puVar8)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (((ushort *)puVar8)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)puVar8 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)puVar8 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (puVar8[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (puVar8[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*puVar8 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*puVar8 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(byte *)((char *)puVar8 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar8)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (((ushort *)puVar8)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (((ushort *)puVar8)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)puVar8 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)puVar8 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (puVar8[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (puVar8[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*puVar8 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*puVar8 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(byte *)((char *)puVar8 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar8)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (((ushort *)puVar8)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (((ushort *)puVar8)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)puVar8 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)puVar8 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (puVar8[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (puVar8[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*puVar8 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*puVar8 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(byte *)((char *)puVar8 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar8)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *(ushort *)((char *)puVar8 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (((ushort *)puVar8)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (((ushort *)puVar8)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- ((ushort *)puVar8)[0] >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)puVar8 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)puVar8 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *(ushort *)puVar8 >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (puVar8[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (puVar8[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- puVar8[0] >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*puVar8 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*puVar8 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *puVar8 >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(byte *)((char *)puVar8 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *(byte *)((char *)puVar8 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar8)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- ((ushort *)puVar8)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- puVar8[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- *(byte *)((char *)puVar8 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- (byte)puVar8[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (((ushort *)puVar8)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (((ushort *)puVar8)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (puVar8[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (puVar8[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (((ushort *)puVar8)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (((ushort *)puVar8)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (puVar8[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (puVar8[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(byte *)((char *)puVar8 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(byte *)((char *)puVar8 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar8)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- *(ushort *)((char *)puVar8 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (((ushort *)puVar8)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (((ushort *)puVar8)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- ((ushort *)puVar8)[1] >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (puVar8[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (puVar8[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- puVar8[1] >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(byte *)((char *)puVar8 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(byte *)((char *)puVar8 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- *(byte *)((char *)puVar8 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar8)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- ((ushort *)puVar8)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- puVar8[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- *(byte *)((char *)puVar8 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- (byte)puVar8[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (*(ushort *)((char *)puVar8 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- *(ushort *)((char *)puVar8 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- (((ushort *)puVar8)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (((ushort *)puVar8)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- ((ushort *)puVar8)[2] >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- (puVar8[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (puVar8[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- puVar8[2] >> 6
+ ((uw_object_hdr_t *)puVar8)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- ((ushort *)puVar8)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- puVar8[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- *(byte *)((char *)puVar8 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- (byte)puVar8[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (*(ushort *)((char *)puVar8 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- *(ushort *)((char *)puVar8 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- (((ushort *)puVar8)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (((ushort *)puVar8)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- ((ushort *)puVar8)[3] >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- (puVar8[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (puVar8[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- puVar8[3] >> 6
+ ((uw_object_hdr_t *)puVar8)->link
)
...>
}

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- ((ushort *)puVar9)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- *(ushort *)puVar9 & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- *(ushort *)(puVar9 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- CONCAT11(puVar9[1], *puVar9) & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- CONCAT11(puVar9[1], puVar9[0]) & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (((ushort *)puVar9)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (((ushort *)puVar9)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(ushort *)puVar9 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(ushort *)puVar9 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(ushort *)(puVar9 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(ushort *)(puVar9 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (CONCAT11(puVar9[1], *puVar9) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (CONCAT11(puVar9[1], *puVar9) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (CONCAT11(puVar9[1], puVar9[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (CONCAT11(puVar9[1], puVar9[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(byte *)((char *)puVar9 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(byte *)((char *)puVar9 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(byte *)(puVar9 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(byte *)(puVar9 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar9)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (((ushort *)puVar9)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (((ushort *)puVar9)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(ushort *)puVar9 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(ushort *)puVar9 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(ushort *)(puVar9 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(ushort *)(puVar9 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (CONCAT11(puVar9[1], *puVar9) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (CONCAT11(puVar9[1], *puVar9) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (CONCAT11(puVar9[1], puVar9[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (CONCAT11(puVar9[1], puVar9[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(byte *)((char *)puVar9 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(byte *)(puVar9 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(byte *)(puVar9 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar9)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (((ushort *)puVar9)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (((ushort *)puVar9)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(ushort *)puVar9 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(ushort *)puVar9 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(ushort *)(puVar9 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(ushort *)(puVar9 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (CONCAT11(puVar9[1], *puVar9) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (CONCAT11(puVar9[1], *puVar9) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (CONCAT11(puVar9[1], puVar9[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (CONCAT11(puVar9[1], puVar9[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(byte *)((char *)puVar9 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(byte *)(puVar9 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(byte *)(puVar9 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar9)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (((ushort *)puVar9)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (((ushort *)puVar9)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(ushort *)puVar9 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(ushort *)puVar9 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(ushort *)(puVar9 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(ushort *)(puVar9 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (CONCAT11(puVar9[1], *puVar9) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (CONCAT11(puVar9[1], *puVar9) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (CONCAT11(puVar9[1], puVar9[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (CONCAT11(puVar9[1], puVar9[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(byte *)((char *)puVar9 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(byte *)(puVar9 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(byte *)(puVar9 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar9)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (((ushort *)puVar9)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (((ushort *)puVar9)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)puVar9 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)puVar9 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)(puVar9 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)(puVar9 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (CONCAT11(puVar9[1], *puVar9) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (CONCAT11(puVar9[1], *puVar9) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (CONCAT11(puVar9[1], puVar9[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (CONCAT11(puVar9[1], puVar9[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(byte *)((char *)puVar9 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- *(byte *)((char *)puVar9 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(byte *)(puVar9 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(byte *)(puVar9 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- *(byte *)(puVar9 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar9)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- ((ushort *)puVar9)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- *(ushort *)(puVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- *(byte *)((char *)puVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- puVar9[2] & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- *(byte *)(puVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (*(ushort *)((char *)puVar9 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (((ushort *)puVar9)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (((ushort *)puVar9)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (*(ushort *)(puVar9 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (*(ushort *)(puVar9 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar9)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(ushort *)((char *)puVar9 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (((ushort *)puVar9)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (((ushort *)puVar9)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(ushort *)(puVar9 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(ushort *)(puVar9 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(byte *)((char *)puVar9 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(byte *)((char *)puVar9 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(byte *)(puVar9 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(byte *)(puVar9 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar9)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(ushort *)((char *)puVar9 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (((ushort *)puVar9)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (((ushort *)puVar9)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(ushort *)(puVar9 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(ushort *)(puVar9 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(byte *)((char *)puVar9 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(byte *)((char *)puVar9 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- *(byte *)((char *)puVar9 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(byte *)(puVar9 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(byte *)(puVar9 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- *(byte *)(puVar9 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar9)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- ((ushort *)puVar9)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- *(ushort *)(puVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- *(byte *)((char *)puVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- puVar9[4] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- *(byte *)(puVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->next
|
- (*(ushort *)((char *)puVar9 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->next
|
- (((ushort *)puVar9)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->next
|
- (((ushort *)puVar9)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->next
|
- (*(ushort *)(puVar9 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->next
|
- (*(ushort *)(puVar9 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- ((ushort *)puVar9)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- *(ushort *)(puVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- *(byte *)((char *)puVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- puVar9[6] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- *(byte *)(puVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->link
|
- (*(ushort *)((char *)puVar9 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->link
|
- (((ushort *)puVar9)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->link
|
- (((ushort *)puVar9)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->link
|
- (*(ushort *)(puVar9 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->link
|
- (*(ushort *)(puVar9 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->link
)
...>
}

@field_2_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar10)->object_id
|
- ((ushort *)puVar10)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar10)->object_id
|
- *(ushort *)puVar10 & 0x1ff
+ ((uw_object_hdr_t *)puVar10)->object_id
|
- *(ushort *)(puVar10 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar10)->object_id
|
- CONCAT11(puVar10[1], *puVar10) & 0x1ff
+ ((uw_object_hdr_t *)puVar10)->object_id
|
- CONCAT11(puVar10[1], puVar10[0]) & 0x1ff
+ ((uw_object_hdr_t *)puVar10)->object_id
)
...>
}

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(ushort *)((char *)puVar10 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (((ushort *)puVar10)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (((ushort *)puVar10)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(ushort *)puVar10 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(ushort *)puVar10 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(ushort *)(puVar10 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(ushort *)(puVar10 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (CONCAT11(puVar10[1], *puVar10) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (CONCAT11(puVar10[1], *puVar10) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (CONCAT11(puVar10[1], puVar10[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (CONCAT11(puVar10[1], puVar10[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(byte *)((char *)puVar10 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(byte *)((char *)puVar10 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(byte *)(puVar10 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar10)->flags_res
|
- (*(byte *)(puVar10 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar10)->flags_res
)
...>
}

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(ushort *)((char *)puVar10 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (((ushort *)puVar10)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (((ushort *)puVar10)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(ushort *)puVar10 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(ushort *)puVar10 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(ushort *)(puVar10 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(ushort *)(puVar10 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (CONCAT11(puVar10[1], *puVar10) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (CONCAT11(puVar10[1], *puVar10) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (CONCAT11(puVar10[1], puVar10[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (CONCAT11(puVar10[1], puVar10[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(byte *)((char *)puVar10 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(byte *)((char *)puVar10 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(byte *)(puVar10 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar10)->enchanted
|
- (*(byte *)(puVar10 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar10)->enchanted
)
...>
}

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(ushort *)((char *)puVar10 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (((ushort *)puVar10)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (((ushort *)puVar10)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(ushort *)puVar10 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(ushort *)puVar10 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(ushort *)(puVar10 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(ushort *)(puVar10 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (CONCAT11(puVar10[1], *puVar10) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (CONCAT11(puVar10[1], *puVar10) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (CONCAT11(puVar10[1], puVar10[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (CONCAT11(puVar10[1], puVar10[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(byte *)((char *)puVar10 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(byte *)((char *)puVar10 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(byte *)(puVar10 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar10)->doordir
|
- (*(byte *)(puVar10 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar10)->doordir
)
...>
}

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(ushort *)((char *)puVar10 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (((ushort *)puVar10)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (((ushort *)puVar10)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(ushort *)puVar10 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(ushort *)puVar10 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(ushort *)(puVar10 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(ushort *)(puVar10 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (CONCAT11(puVar10[1], *puVar10) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (CONCAT11(puVar10[1], *puVar10) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (CONCAT11(puVar10[1], puVar10[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (CONCAT11(puVar10[1], puVar10[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(byte *)((char *)puVar10 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(byte *)((char *)puVar10 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(byte *)(puVar10 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar10)->invisible
|
- (*(byte *)(puVar10 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar10)->invisible
)
...>
}

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(ushort *)((char *)puVar10 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (((ushort *)puVar10)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (((ushort *)puVar10)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(ushort *)puVar10 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(ushort *)puVar10 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(ushort *)(puVar10 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(ushort *)(puVar10 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (CONCAT11(puVar10[1], *puVar10) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (CONCAT11(puVar10[1], *puVar10) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (CONCAT11(puVar10[1], puVar10[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (CONCAT11(puVar10[1], puVar10[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(byte *)((char *)puVar10 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(byte *)((char *)puVar10 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- *(byte *)((char *)puVar10 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(byte *)(puVar10 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- (*(byte *)(puVar10 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar10)->is_quant
|
- *(byte *)(puVar10 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar10)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar10)->zpos
|
- ((ushort *)puVar10)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar10)->zpos
|
- *(ushort *)(puVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar10)->zpos
|
- *(byte *)((char *)puVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar10)->zpos
|
- puVar10[2] & 0x7f
+ ((uw_object_hdr_t *)puVar10)->zpos
|
- *(byte *)(puVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar10)->zpos
)
...>
}

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar10)->heading
|
- (*(ushort *)((char *)puVar10 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar10)->heading
|
- (((ushort *)puVar10)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar10)->heading
|
- (((ushort *)puVar10)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar10)->heading
|
- (*(ushort *)(puVar10 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar10)->heading
|
- (*(ushort *)(puVar10 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar10)->heading
)
...>
}

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (*(ushort *)((char *)puVar10 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (((ushort *)puVar10)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (((ushort *)puVar10)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (*(ushort *)(puVar10 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (*(ushort *)(puVar10 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (*(byte *)((char *)puVar10 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (*(byte *)((char *)puVar10 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (*(byte *)(puVar10 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar10)->ypos
|
- (*(byte *)(puVar10 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar10)->ypos
)
...>
}

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (*(ushort *)((char *)puVar10 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (((ushort *)puVar10)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (((ushort *)puVar10)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (*(ushort *)(puVar10 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (*(ushort *)(puVar10 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (*(byte *)((char *)puVar10 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (*(byte *)((char *)puVar10 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- *(byte *)((char *)puVar10 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (*(byte *)(puVar10 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- (*(byte *)(puVar10 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar10)->xpos
|
- *(byte *)(puVar10 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar10)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar10)->quality
|
- ((ushort *)puVar10)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar10)->quality
|
- *(ushort *)(puVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar10)->quality
|
- *(byte *)((char *)puVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar10)->quality
|
- puVar10[4] & 0x3f
+ ((uw_object_hdr_t *)puVar10)->quality
|
- *(byte *)(puVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar10)->quality
)
...>
}

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar10)->next
|
- (*(ushort *)((char *)puVar10 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar10)->next
|
- (((ushort *)puVar10)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar10)->next
|
- (((ushort *)puVar10)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar10)->next
|
- (*(ushort *)(puVar10 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar10)->next
|
- (*(ushort *)(puVar10 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar10)->next
)
...>
}

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar10)->owner
|
- ((ushort *)puVar10)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar10)->owner
|
- *(ushort *)(puVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar10)->owner
|
- *(byte *)((char *)puVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar10)->owner
|
- puVar10[6] & 0x3f
+ ((uw_object_hdr_t *)puVar10)->owner
|
- *(byte *)(puVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar10)->owner
)
...>
}

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar10 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar10)->link
|
- (*(ushort *)((char *)puVar10 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar10)->link
|
- (((ushort *)puVar10)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar10)->link
|
- (((ushort *)puVar10)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar10)->link
|
- (*(ushort *)(puVar10 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar10)->link
|
- (*(ushort *)(puVar10 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar10)->link
)
...>
}

@field_3_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_case8_p1)->object_id
|
- ((ushort *)_case8_p1)[0] & 0x1ff
+ ((uw_object_hdr_t *)_case8_p1)->object_id
|
- *(ushort *)_case8_p1 & 0x1ff
+ ((uw_object_hdr_t *)_case8_p1)->object_id
|
- _case8_p1[0] & 0x1ff
+ ((uw_object_hdr_t *)_case8_p1)->object_id
|
- *_case8_p1 & 0x1ff
+ ((uw_object_hdr_t *)_case8_p1)->object_id
)
...>
}

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (*(ushort *)((char *)_case8_p1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (((ushort *)_case8_p1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (((ushort *)_case8_p1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (*(ushort *)_case8_p1 >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (*(ushort *)_case8_p1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (_case8_p1[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (_case8_p1[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (*_case8_p1 >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (*_case8_p1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (*(byte *)((char *)_case8_p1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
|
- (*(byte *)((char *)_case8_p1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_case8_p1)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (*(ushort *)((char *)_case8_p1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (((ushort *)_case8_p1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (((ushort *)_case8_p1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (*(ushort *)_case8_p1 >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (*(ushort *)_case8_p1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (_case8_p1[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (_case8_p1[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (*_case8_p1 >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (*_case8_p1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (*(byte *)((char *)_case8_p1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
|
- (*(byte *)((char *)_case8_p1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_case8_p1)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (*(ushort *)((char *)_case8_p1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (((ushort *)_case8_p1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (((ushort *)_case8_p1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (*(ushort *)_case8_p1 >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (*(ushort *)_case8_p1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (_case8_p1[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (_case8_p1[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (*_case8_p1 >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (*_case8_p1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (*(byte *)((char *)_case8_p1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->doordir
|
- (*(byte *)((char *)_case8_p1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_case8_p1)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (*(ushort *)((char *)_case8_p1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (((ushort *)_case8_p1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (((ushort *)_case8_p1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (*(ushort *)_case8_p1 >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (*(ushort *)_case8_p1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (_case8_p1[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (_case8_p1[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (*_case8_p1 >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (*_case8_p1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (*(byte *)((char *)_case8_p1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->invisible
|
- (*(byte *)((char *)_case8_p1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (*(ushort *)((char *)_case8_p1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- *(ushort *)((char *)_case8_p1 + 0x0) >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (((ushort *)_case8_p1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (((ushort *)_case8_p1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- ((ushort *)_case8_p1)[0] >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (*(ushort *)_case8_p1 >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (*(ushort *)_case8_p1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- *(ushort *)_case8_p1 >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (_case8_p1[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (_case8_p1[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- _case8_p1[0] >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (*_case8_p1 >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (*_case8_p1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- *_case8_p1 >> 15
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (*(byte *)((char *)_case8_p1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- (*(byte *)((char *)_case8_p1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
|
- *(byte *)((char *)_case8_p1 + 0x1) >> 7
+ ((uw_object_hdr_t *)_case8_p1)->is_quant
)
...>
}

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_case8_p1)->zpos
|
- ((ushort *)_case8_p1)[1] & 0x7f
+ ((uw_object_hdr_t *)_case8_p1)->zpos
|
- _case8_p1[1] & 0x7f
+ ((uw_object_hdr_t *)_case8_p1)->zpos
|
- *(byte *)((char *)_case8_p1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_case8_p1)->zpos
|
- (byte)_case8_p1[1] & 0x7f
+ ((uw_object_hdr_t *)_case8_p1)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->heading
|
- (*(ushort *)((char *)_case8_p1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_case8_p1)->heading
|
- (((ushort *)_case8_p1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->heading
|
- (((ushort *)_case8_p1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_case8_p1)->heading
|
- (_case8_p1[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->heading
|
- (_case8_p1[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_case8_p1)->heading
)
...>
}

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->ypos
|
- (*(ushort *)((char *)_case8_p1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_case8_p1)->ypos
|
- (((ushort *)_case8_p1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->ypos
|
- (((ushort *)_case8_p1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_case8_p1)->ypos
|
- (_case8_p1[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->ypos
|
- (_case8_p1[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_case8_p1)->ypos
|
- (*(byte *)((char *)_case8_p1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->ypos
|
- (*(byte *)((char *)_case8_p1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_case8_p1)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- (*(ushort *)((char *)_case8_p1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- *(ushort *)((char *)_case8_p1 + 0x2) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- (((ushort *)_case8_p1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- (((ushort *)_case8_p1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- ((ushort *)_case8_p1)[1] >> 13
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- (_case8_p1[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- (_case8_p1[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- _case8_p1[1] >> 13
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- (*(byte *)((char *)_case8_p1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- (*(byte *)((char *)_case8_p1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_case8_p1)->xpos
|
- *(byte *)((char *)_case8_p1 + 0x3) >> 5
+ ((uw_object_hdr_t *)_case8_p1)->xpos
)
...>
}

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->quality
|
- ((ushort *)_case8_p1)[2] & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->quality
|
- _case8_p1[2] & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->quality
|
- *(byte *)((char *)_case8_p1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->quality
|
- (byte)_case8_p1[2] & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p1)->next
|
- (*(ushort *)((char *)_case8_p1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->next
|
- *(ushort *)((char *)_case8_p1 + 0x4) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->next
|
- (((ushort *)_case8_p1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p1)->next
|
- (((ushort *)_case8_p1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->next
|
- ((ushort *)_case8_p1)[2] >> 6
+ ((uw_object_hdr_t *)_case8_p1)->next
|
- (_case8_p1[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p1)->next
|
- (_case8_p1[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->next
|
- _case8_p1[2] >> 6
+ ((uw_object_hdr_t *)_case8_p1)->next
)
...>
}

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->owner
|
- ((ushort *)_case8_p1)[3] & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->owner
|
- _case8_p1[3] & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->owner
|
- *(byte *)((char *)_case8_p1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->owner
|
- (byte)_case8_p1[3] & 0x3f
+ ((uw_object_hdr_t *)_case8_p1)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p1)->link
|
- (*(ushort *)((char *)_case8_p1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->link
|
- *(ushort *)((char *)_case8_p1 + 0x6) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->link
|
- (((ushort *)_case8_p1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p1)->link
|
- (((ushort *)_case8_p1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->link
|
- ((ushort *)_case8_p1)[3] >> 6
+ ((uw_object_hdr_t *)_case8_p1)->link
|
- (_case8_p1[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p1)->link
|
- (_case8_p1[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p1)->link
|
- _case8_p1[3] >> 6
+ ((uw_object_hdr_t *)_case8_p1)->link
)
...>
}

@field_4_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)equipped_item)->object_id
|
- ((ushort *)equipped_item)[0] & 0x1ff
+ ((uw_object_hdr_t *)equipped_item)->object_id
|
- *(ushort *)equipped_item & 0x1ff
+ ((uw_object_hdr_t *)equipped_item)->object_id
|
- *(ushort *)(equipped_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)equipped_item)->object_id
|
- CONCAT11(equipped_item[1], *equipped_item) & 0x1ff
+ ((uw_object_hdr_t *)equipped_item)->object_id
|
- CONCAT11(equipped_item[1], equipped_item[0]) & 0x1ff
+ ((uw_object_hdr_t *)equipped_item)->object_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(ushort *)((char *)equipped_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (((ushort *)equipped_item)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (((ushort *)equipped_item)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(ushort *)equipped_item >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(ushort *)equipped_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(ushort *)(equipped_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(ushort *)(equipped_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (CONCAT11(equipped_item[1], *equipped_item) >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (CONCAT11(equipped_item[1], *equipped_item) & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (CONCAT11(equipped_item[1], equipped_item[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (CONCAT11(equipped_item[1], equipped_item[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(byte *)((char *)equipped_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(byte *)((char *)equipped_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(byte *)(equipped_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->flags_res
|
- (*(byte *)(equipped_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)equipped_item)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(ushort *)((char *)equipped_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (((ushort *)equipped_item)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (((ushort *)equipped_item)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(ushort *)equipped_item >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(ushort *)equipped_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(ushort *)(equipped_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(ushort *)(equipped_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (CONCAT11(equipped_item[1], *equipped_item) >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (CONCAT11(equipped_item[1], *equipped_item) & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (CONCAT11(equipped_item[1], equipped_item[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (CONCAT11(equipped_item[1], equipped_item[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(byte *)((char *)equipped_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(byte *)((char *)equipped_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(byte *)(equipped_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->enchanted
|
- (*(byte *)(equipped_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)equipped_item)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(ushort *)((char *)equipped_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (((ushort *)equipped_item)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (((ushort *)equipped_item)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(ushort *)equipped_item >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(ushort *)equipped_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(ushort *)(equipped_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(ushort *)(equipped_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (CONCAT11(equipped_item[1], *equipped_item) >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (CONCAT11(equipped_item[1], *equipped_item) & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (CONCAT11(equipped_item[1], equipped_item[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (CONCAT11(equipped_item[1], equipped_item[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(byte *)((char *)equipped_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(byte *)((char *)equipped_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(byte *)(equipped_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->doordir
|
- (*(byte *)(equipped_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)equipped_item)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(ushort *)((char *)equipped_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (((ushort *)equipped_item)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (((ushort *)equipped_item)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(ushort *)equipped_item >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(ushort *)equipped_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(ushort *)(equipped_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(ushort *)(equipped_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (CONCAT11(equipped_item[1], *equipped_item) >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (CONCAT11(equipped_item[1], *equipped_item) & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (CONCAT11(equipped_item[1], equipped_item[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (CONCAT11(equipped_item[1], equipped_item[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(byte *)((char *)equipped_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(byte *)((char *)equipped_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(byte *)(equipped_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->invisible
|
- (*(byte *)(equipped_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)equipped_item)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(ushort *)((char *)equipped_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (((ushort *)equipped_item)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (((ushort *)equipped_item)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(ushort *)equipped_item >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(ushort *)equipped_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(ushort *)(equipped_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(ushort *)(equipped_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (CONCAT11(equipped_item[1], *equipped_item) >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (CONCAT11(equipped_item[1], *equipped_item) & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (CONCAT11(equipped_item[1], equipped_item[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (CONCAT11(equipped_item[1], equipped_item[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(byte *)((char *)equipped_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(byte *)((char *)equipped_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- *(byte *)((char *)equipped_item + 0x1) >> 7
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(byte *)(equipped_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- (*(byte *)(equipped_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)equipped_item)->is_quant
|
- *(byte *)(equipped_item + 0x1) >> 7
+ ((uw_object_hdr_t *)equipped_item)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equipped_item)->zpos
|
- ((ushort *)equipped_item)[1] & 0x7f
+ ((uw_object_hdr_t *)equipped_item)->zpos
|
- *(ushort *)(equipped_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equipped_item)->zpos
|
- *(byte *)((char *)equipped_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equipped_item)->zpos
|
- equipped_item[2] & 0x7f
+ ((uw_object_hdr_t *)equipped_item)->zpos
|
- *(byte *)(equipped_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equipped_item)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->heading
|
- (*(ushort *)((char *)equipped_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)equipped_item)->heading
|
- (((ushort *)equipped_item)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->heading
|
- (((ushort *)equipped_item)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)equipped_item)->heading
|
- (*(ushort *)(equipped_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->heading
|
- (*(ushort *)(equipped_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)equipped_item)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (*(ushort *)((char *)equipped_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (((ushort *)equipped_item)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (((ushort *)equipped_item)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (*(ushort *)(equipped_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (*(ushort *)(equipped_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (*(byte *)((char *)equipped_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (*(byte *)((char *)equipped_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (*(byte *)(equipped_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->ypos
|
- (*(byte *)(equipped_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)equipped_item)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (*(ushort *)((char *)equipped_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (((ushort *)equipped_item)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (((ushort *)equipped_item)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (*(ushort *)(equipped_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (*(ushort *)(equipped_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (*(byte *)((char *)equipped_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (*(byte *)((char *)equipped_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- *(byte *)((char *)equipped_item + 0x3) >> 5
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (*(byte *)(equipped_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- (*(byte *)(equipped_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)equipped_item)->xpos
|
- *(byte *)(equipped_item + 0x3) >> 5
+ ((uw_object_hdr_t *)equipped_item)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->quality
|
- ((ushort *)equipped_item)[2] & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->quality
|
- *(ushort *)(equipped_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->quality
|
- *(byte *)((char *)equipped_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->quality
|
- equipped_item[4] & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->quality
|
- *(byte *)(equipped_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped_item)->next
|
- (*(ushort *)((char *)equipped_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped_item)->next
|
- (((ushort *)equipped_item)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped_item)->next
|
- (((ushort *)equipped_item)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped_item)->next
|
- (*(ushort *)(equipped_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped_item)->next
|
- (*(ushort *)(equipped_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped_item)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->owner
|
- ((ushort *)equipped_item)[3] & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->owner
|
- *(ushort *)(equipped_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->owner
|
- *(byte *)((char *)equipped_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->owner
|
- equipped_item[6] & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->owner
|
- *(byte *)(equipped_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equipped_item)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped_item)->link
|
- (*(ushort *)((char *)equipped_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped_item)->link
|
- (((ushort *)equipped_item)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped_item)->link
|
- (((ushort *)equipped_item)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped_item)->link
|
- (*(ushort *)(equipped_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped_item)->link
|
- (*(ushort *)(equipped_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped_item)->link
)
...>
}

@field_5_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)linked_obj)->object_id
|
- ((ushort *)linked_obj)[0] & 0x1ff
+ ((uw_object_hdr_t *)linked_obj)->object_id
|
- *(ushort *)linked_obj & 0x1ff
+ ((uw_object_hdr_t *)linked_obj)->object_id
|
- *(ushort *)(linked_obj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)linked_obj)->object_id
)
...>
}

@field_5_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(ushort *)((char *)linked_obj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (((ushort *)linked_obj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (((ushort *)linked_obj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(ushort *)linked_obj >> 9) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(ushort *)linked_obj & 0xe00) >> 9
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(ushort *)(linked_obj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(ushort *)(linked_obj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(byte *)((char *)linked_obj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(byte *)((char *)linked_obj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(byte *)(linked_obj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->flags_res
|
- (*(byte *)(linked_obj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)linked_obj)->flags_res
)
...>
}

@field_5_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(ushort *)((char *)linked_obj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (((ushort *)linked_obj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (((ushort *)linked_obj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(ushort *)linked_obj >> 12) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(ushort *)linked_obj & 0x1000) >> 12
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(ushort *)(linked_obj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(ushort *)(linked_obj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(byte *)((char *)linked_obj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(byte *)((char *)linked_obj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(byte *)(linked_obj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->enchanted
|
- (*(byte *)(linked_obj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)linked_obj)->enchanted
)
...>
}

@field_5_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(ushort *)((char *)linked_obj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (((ushort *)linked_obj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (((ushort *)linked_obj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(ushort *)linked_obj >> 13) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(ushort *)linked_obj & 0x2000) >> 13
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(ushort *)(linked_obj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(ushort *)(linked_obj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(byte *)((char *)linked_obj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(byte *)((char *)linked_obj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(byte *)(linked_obj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->doordir
|
- (*(byte *)(linked_obj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)linked_obj)->doordir
)
...>
}

@field_5_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(ushort *)((char *)linked_obj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (((ushort *)linked_obj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (((ushort *)linked_obj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(ushort *)linked_obj >> 14) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(ushort *)linked_obj & 0x4000) >> 14
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(ushort *)(linked_obj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(ushort *)(linked_obj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(byte *)((char *)linked_obj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(byte *)((char *)linked_obj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(byte *)(linked_obj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->invisible
|
- (*(byte *)(linked_obj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)linked_obj)->invisible
)
...>
}

@field_5_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(ushort *)((char *)linked_obj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (((ushort *)linked_obj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (((ushort *)linked_obj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(ushort *)linked_obj >> 15) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(ushort *)linked_obj & 0x8000) >> 15
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(ushort *)(linked_obj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(ushort *)(linked_obj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(byte *)((char *)linked_obj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(byte *)((char *)linked_obj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- *(byte *)((char *)linked_obj + 0x1) >> 7
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(byte *)(linked_obj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- (*(byte *)(linked_obj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)linked_obj)->is_quant
|
- *(byte *)(linked_obj + 0x1) >> 7
+ ((uw_object_hdr_t *)linked_obj)->is_quant
)
...>
}

@field_5_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)linked_obj)->zpos
|
- ((ushort *)linked_obj)[1] & 0x7f
+ ((uw_object_hdr_t *)linked_obj)->zpos
|
- *(ushort *)(linked_obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)linked_obj)->zpos
|
- *(byte *)((char *)linked_obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)linked_obj)->zpos
|
- *(byte *)(linked_obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)linked_obj)->zpos
)
...>
}

@field_5_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->heading
|
- (*(ushort *)((char *)linked_obj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)linked_obj)->heading
|
- (((ushort *)linked_obj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->heading
|
- (((ushort *)linked_obj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)linked_obj)->heading
|
- (*(ushort *)(linked_obj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->heading
|
- (*(ushort *)(linked_obj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)linked_obj)->heading
)
...>
}

@field_5_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (*(ushort *)((char *)linked_obj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (((ushort *)linked_obj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (((ushort *)linked_obj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (*(ushort *)(linked_obj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (*(ushort *)(linked_obj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (*(byte *)((char *)linked_obj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (*(byte *)((char *)linked_obj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (*(byte *)(linked_obj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->ypos
|
- (*(byte *)(linked_obj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)linked_obj)->ypos
)
...>
}

@field_5_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (*(ushort *)((char *)linked_obj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (((ushort *)linked_obj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (((ushort *)linked_obj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (*(ushort *)(linked_obj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (*(ushort *)(linked_obj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (*(byte *)((char *)linked_obj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (*(byte *)((char *)linked_obj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- *(byte *)((char *)linked_obj + 0x3) >> 5
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (*(byte *)(linked_obj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- (*(byte *)(linked_obj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)linked_obj)->xpos
|
- *(byte *)(linked_obj + 0x3) >> 5
+ ((uw_object_hdr_t *)linked_obj)->xpos
)
...>
}

@field_5_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->quality
|
- ((ushort *)linked_obj)[2] & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->quality
|
- *(ushort *)(linked_obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->quality
|
- *(byte *)((char *)linked_obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->quality
|
- *(byte *)(linked_obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->quality
)
...>
}

@field_5_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)linked_obj)->next
|
- (*(ushort *)((char *)linked_obj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)linked_obj)->next
|
- (((ushort *)linked_obj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)linked_obj)->next
|
- (((ushort *)linked_obj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)linked_obj)->next
|
- (*(ushort *)(linked_obj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)linked_obj)->next
|
- (*(ushort *)(linked_obj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)linked_obj)->next
)
...>
}

@field_5_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->owner
|
- ((ushort *)linked_obj)[3] & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->owner
|
- *(ushort *)(linked_obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->owner
|
- *(byte *)((char *)linked_obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->owner
|
- *(byte *)(linked_obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)linked_obj)->owner
)
...>
}

@field_5_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)linked_obj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)linked_obj)->link
|
- (*(ushort *)((char *)linked_obj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)linked_obj)->link
|
- (((ushort *)linked_obj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)linked_obj)->link
|
- (((ushort *)linked_obj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)linked_obj)->link
|
- (*(ushort *)(linked_obj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)linked_obj)->link
|
- (*(ushort *)(linked_obj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)linked_obj)->link
)
...>
}

@field_6_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_case8_p2)->object_id
|
- ((ushort *)_case8_p2)[0] & 0x1ff
+ ((uw_object_hdr_t *)_case8_p2)->object_id
|
- *(ushort *)_case8_p2 & 0x1ff
+ ((uw_object_hdr_t *)_case8_p2)->object_id
|
- _case8_p2[0] & 0x1ff
+ ((uw_object_hdr_t *)_case8_p2)->object_id
|
- *_case8_p2 & 0x1ff
+ ((uw_object_hdr_t *)_case8_p2)->object_id
)
...>
}

@field_6_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (*(ushort *)((char *)_case8_p2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (((ushort *)_case8_p2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (((ushort *)_case8_p2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (*(ushort *)_case8_p2 >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (*(ushort *)_case8_p2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (_case8_p2[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (_case8_p2[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (*_case8_p2 >> 9) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (*_case8_p2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (*(byte *)((char *)_case8_p2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
|
- (*(byte *)((char *)_case8_p2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_case8_p2)->flags_res
)
...>
}

@field_6_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (*(ushort *)((char *)_case8_p2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (((ushort *)_case8_p2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (((ushort *)_case8_p2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (*(ushort *)_case8_p2 >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (*(ushort *)_case8_p2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (_case8_p2[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (_case8_p2[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (*_case8_p2 >> 12) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (*_case8_p2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (*(byte *)((char *)_case8_p2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
|
- (*(byte *)((char *)_case8_p2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_case8_p2)->enchanted
)
...>
}

@field_6_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (*(ushort *)((char *)_case8_p2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (((ushort *)_case8_p2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (((ushort *)_case8_p2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (*(ushort *)_case8_p2 >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (*(ushort *)_case8_p2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (_case8_p2[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (_case8_p2[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (*_case8_p2 >> 13) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (*_case8_p2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (*(byte *)((char *)_case8_p2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->doordir
|
- (*(byte *)((char *)_case8_p2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_case8_p2)->doordir
)
...>
}

@field_6_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (*(ushort *)((char *)_case8_p2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (((ushort *)_case8_p2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (((ushort *)_case8_p2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (*(ushort *)_case8_p2 >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (*(ushort *)_case8_p2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (_case8_p2[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (_case8_p2[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (*_case8_p2 >> 14) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (*_case8_p2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (*(byte *)((char *)_case8_p2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->invisible
|
- (*(byte *)((char *)_case8_p2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->invisible
)
...>
}

@field_6_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (*(ushort *)((char *)_case8_p2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- *(ushort *)((char *)_case8_p2 + 0x0) >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (((ushort *)_case8_p2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (((ushort *)_case8_p2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- ((ushort *)_case8_p2)[0] >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (*(ushort *)_case8_p2 >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (*(ushort *)_case8_p2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- *(ushort *)_case8_p2 >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (_case8_p2[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (_case8_p2[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- _case8_p2[0] >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (*_case8_p2 >> 15) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (*_case8_p2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- *_case8_p2 >> 15
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (*(byte *)((char *)_case8_p2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- (*(byte *)((char *)_case8_p2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
|
- *(byte *)((char *)_case8_p2 + 0x1) >> 7
+ ((uw_object_hdr_t *)_case8_p2)->is_quant
)
...>
}

@field_6_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_case8_p2)->zpos
|
- ((ushort *)_case8_p2)[1] & 0x7f
+ ((uw_object_hdr_t *)_case8_p2)->zpos
|
- _case8_p2[1] & 0x7f
+ ((uw_object_hdr_t *)_case8_p2)->zpos
|
- *(byte *)((char *)_case8_p2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_case8_p2)->zpos
|
- (byte)_case8_p2[1] & 0x7f
+ ((uw_object_hdr_t *)_case8_p2)->zpos
)
...>
}

@field_6_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->heading
|
- (*(ushort *)((char *)_case8_p2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_case8_p2)->heading
|
- (((ushort *)_case8_p2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->heading
|
- (((ushort *)_case8_p2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_case8_p2)->heading
|
- (_case8_p2[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->heading
|
- (_case8_p2[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_case8_p2)->heading
)
...>
}

@field_6_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->ypos
|
- (*(ushort *)((char *)_case8_p2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_case8_p2)->ypos
|
- (((ushort *)_case8_p2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->ypos
|
- (((ushort *)_case8_p2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_case8_p2)->ypos
|
- (_case8_p2[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->ypos
|
- (_case8_p2[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_case8_p2)->ypos
|
- (*(byte *)((char *)_case8_p2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->ypos
|
- (*(byte *)((char *)_case8_p2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_case8_p2)->ypos
)
...>
}

@field_6_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- (*(ushort *)((char *)_case8_p2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- *(ushort *)((char *)_case8_p2 + 0x2) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- (((ushort *)_case8_p2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- (((ushort *)_case8_p2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- ((ushort *)_case8_p2)[1] >> 13
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- (_case8_p2[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- (_case8_p2[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- _case8_p2[1] >> 13
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- (*(byte *)((char *)_case8_p2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- (*(byte *)((char *)_case8_p2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_case8_p2)->xpos
|
- *(byte *)((char *)_case8_p2 + 0x3) >> 5
+ ((uw_object_hdr_t *)_case8_p2)->xpos
)
...>
}

@field_6_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->quality
|
- ((ushort *)_case8_p2)[2] & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->quality
|
- _case8_p2[2] & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->quality
|
- *(byte *)((char *)_case8_p2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->quality
|
- (byte)_case8_p2[2] & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->quality
)
...>
}

@field_6_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p2)->next
|
- (*(ushort *)((char *)_case8_p2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->next
|
- *(ushort *)((char *)_case8_p2 + 0x4) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->next
|
- (((ushort *)_case8_p2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p2)->next
|
- (((ushort *)_case8_p2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->next
|
- ((ushort *)_case8_p2)[2] >> 6
+ ((uw_object_hdr_t *)_case8_p2)->next
|
- (_case8_p2[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p2)->next
|
- (_case8_p2[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->next
|
- _case8_p2[2] >> 6
+ ((uw_object_hdr_t *)_case8_p2)->next
)
...>
}

@field_6_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->owner
|
- ((ushort *)_case8_p2)[3] & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->owner
|
- _case8_p2[3] & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->owner
|
- *(byte *)((char *)_case8_p2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->owner
|
- (byte)_case8_p2[3] & 0x3f
+ ((uw_object_hdr_t *)_case8_p2)->owner
)
...>
}

@field_6_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_case8_p2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p2)->link
|
- (*(ushort *)((char *)_case8_p2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->link
|
- *(ushort *)((char *)_case8_p2 + 0x6) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->link
|
- (((ushort *)_case8_p2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p2)->link
|
- (((ushort *)_case8_p2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->link
|
- ((ushort *)_case8_p2)[3] >> 6
+ ((uw_object_hdr_t *)_case8_p2)->link
|
- (_case8_p2[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_case8_p2)->link
|
- (_case8_p2[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_case8_p2)->link
|
- _case8_p2[3] >> 6
+ ((uw_object_hdr_t *)_case8_p2)->link
)
...>
}

@field_7_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- ((ushort *)puVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- *(ushort *)puVar4 & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- puVar4[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- *puVar4 & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
)
...>
}

@field_7_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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
|
- *(byte *)((char *)puVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
)
...>
}

@field_7_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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
|
- *(byte *)((char *)puVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
)
...>
}

@field_7_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_7_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@field_8_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
|
- ((ushort *)puVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
|
- *(ushort *)puVar5 & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
|
- puVar5[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
|
- *puVar5 & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
)
...>
}

@field_8_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (((ushort *)puVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (((ushort *)puVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)puVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)puVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (puVar5[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (puVar5[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*puVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*puVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(byte *)((char *)puVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(byte *)((char *)puVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar5)->flags_res
)
...>
}

@field_8_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (((ushort *)puVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (((ushort *)puVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)puVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)puVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (puVar5[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (puVar5[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*puVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*puVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(byte *)((char *)puVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar5)->enchanted
)
...>
}

@field_8_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (((ushort *)puVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (((ushort *)puVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)puVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)puVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (puVar5[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (puVar5[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*puVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*puVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(byte *)((char *)puVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar5)->doordir
)
...>
}

@field_8_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (((ushort *)puVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (((ushort *)puVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)puVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)puVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (puVar5[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (puVar5[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*puVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*puVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(byte *)((char *)puVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar5)->invisible
)
...>
}

@field_8_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *(ushort *)((char *)puVar5 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- ((ushort *)puVar5)[0] >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *(ushort *)puVar5 >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (puVar5[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (puVar5[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- puVar5[0] >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*puVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*puVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *puVar5 >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(byte *)((char *)puVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *(byte *)((char *)puVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar5)->is_quant
)
...>
}

@field_8_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- ((ushort *)puVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- puVar5[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- *(byte *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- (byte)puVar5[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
)
...>
}

@field_8_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (((ushort *)puVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (((ushort *)puVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (puVar5[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (puVar5[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
)
...>
}

@field_8_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (((ushort *)puVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (((ushort *)puVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (puVar5[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (puVar5[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(byte *)((char *)puVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(byte *)((char *)puVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar5)->ypos
)
...>
}

@field_8_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- *(ushort *)((char *)puVar5 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- ((ushort *)puVar5)[1] >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (puVar5[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (puVar5[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- puVar5[1] >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(byte *)((char *)puVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(byte *)((char *)puVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- *(byte *)((char *)puVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar5)->xpos
)
...>
}

@field_8_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- ((ushort *)puVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- puVar5[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- *(byte *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- (byte)puVar5[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
)
...>
}

@field_8_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (*(ushort *)((char *)puVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- *(ushort *)((char *)puVar5 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- ((ushort *)puVar5)[2] >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- (puVar5[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (puVar5[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- puVar5[2] >> 6
+ ((uw_object_hdr_t *)puVar5)->next
)
...>
}

@field_8_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- ((ushort *)puVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- puVar5[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- *(byte *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- (byte)puVar5[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
)
...>
}

@field_8_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (*(ushort *)((char *)puVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- *(ushort *)((char *)puVar5 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- ((ushort *)puVar5)[3] >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- (puVar5[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (puVar5[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- puVar5[3] >> 6
+ ((uw_object_hdr_t *)puVar5)->link
)
...>
}

@field_9_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pObj)->object_id
|
- ((ushort *)pObj)[0] & 0x1ff
+ ((uw_object_hdr_t *)pObj)->object_id
|
- *(ushort *)pObj & 0x1ff
+ ((uw_object_hdr_t *)pObj)->object_id
|
- pObj[0] & 0x1ff
+ ((uw_object_hdr_t *)pObj)->object_id
|
- *pObj & 0x1ff
+ ((uw_object_hdr_t *)pObj)->object_id
)
...>
}

@field_9_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)((char *)pObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (((ushort *)pObj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (((ushort *)pObj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)pObj >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)pObj & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (pObj[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (pObj[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*pObj >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*pObj & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(byte *)((char *)pObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(byte *)((char *)pObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pObj)->flags_res
)
...>
}

@field_9_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)((char *)pObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (((ushort *)pObj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (((ushort *)pObj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)pObj >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)pObj & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (pObj[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (pObj[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*pObj >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*pObj & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(byte *)((char *)pObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(byte *)((char *)pObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pObj)->enchanted
)
...>
}

@field_9_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)((char *)pObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (((ushort *)pObj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (((ushort *)pObj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)pObj >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)pObj & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (pObj[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (pObj[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*pObj >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*pObj & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(byte *)((char *)pObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(byte *)((char *)pObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pObj)->doordir
)
...>
}

@field_9_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)((char *)pObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (((ushort *)pObj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (((ushort *)pObj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)pObj >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)pObj & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (pObj[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (pObj[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*pObj >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*pObj & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(byte *)((char *)pObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(byte *)((char *)pObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pObj)->invisible
)
...>
}

@field_9_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)((char *)pObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- *(ushort *)((char *)pObj + 0x0) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (((ushort *)pObj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (((ushort *)pObj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- ((ushort *)pObj)[0] >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)pObj >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)pObj & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- *(ushort *)pObj >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (pObj[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (pObj[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- pObj[0] >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*pObj >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*pObj & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- *pObj >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(byte *)((char *)pObj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(byte *)((char *)pObj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- *(byte *)((char *)pObj + 0x1) >> 7
+ ((uw_object_hdr_t *)pObj)->is_quant
)
...>
}

@field_9_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- ((ushort *)pObj)[1] & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- pObj[1] & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- *(byte *)((char *)pObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- (byte)pObj[1] & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
)
...>
}

@field_9_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (*(ushort *)((char *)pObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (((ushort *)pObj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (((ushort *)pObj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (pObj[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (pObj[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pObj)->heading
)
...>
}

@field_9_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(ushort *)((char *)pObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (((ushort *)pObj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (((ushort *)pObj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (pObj[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (pObj[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(byte *)((char *)pObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(byte *)((char *)pObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pObj)->ypos
)
...>
}

@field_9_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(ushort *)((char *)pObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- *(ushort *)((char *)pObj + 0x2) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (((ushort *)pObj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (((ushort *)pObj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- ((ushort *)pObj)[1] >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (pObj[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (pObj[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- pObj[1] >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(byte *)((char *)pObj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(byte *)((char *)pObj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pObj)->xpos
|
- *(byte *)((char *)pObj + 0x3) >> 5
+ ((uw_object_hdr_t *)pObj)->xpos
)
...>
}

@field_9_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- ((ushort *)pObj)[2] & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- pObj[2] & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- *(byte *)((char *)pObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- (byte)pObj[2] & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
)
...>
}

@field_9_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (*(ushort *)((char *)pObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
|
- *(ushort *)((char *)pObj + 0x4) >> 6
+ ((uw_object_hdr_t *)pObj)->next
|
- (((ushort *)pObj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (((ushort *)pObj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
|
- ((ushort *)pObj)[2] >> 6
+ ((uw_object_hdr_t *)pObj)->next
|
- (pObj[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (pObj[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
|
- pObj[2] >> 6
+ ((uw_object_hdr_t *)pObj)->next
)
...>
}

@field_9_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- ((ushort *)pObj)[3] & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- pObj[3] & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- *(byte *)((char *)pObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- (byte)pObj[3] & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
)
...>
}

@field_9_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (*(ushort *)((char *)pObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
|
- *(ushort *)((char *)pObj + 0x6) >> 6
+ ((uw_object_hdr_t *)pObj)->link
|
- (((ushort *)pObj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (((ushort *)pObj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
|
- ((ushort *)pObj)[3] >> 6
+ ((uw_object_hdr_t *)pObj)->link
|
- (pObj[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (pObj[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
|
- pObj[3] >> 6
+ ((uw_object_hdr_t *)pObj)->link
)
...>
}

@field_10_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- ((ushort *)pbVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- *(ushort *)pbVar5 & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- *(ushort *)(pbVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- CONCAT11(pbVar5[1], *pbVar5) & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- CONCAT11(pbVar5[1], pbVar5[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
)
...>
}

@field_10_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (((ushort *)pbVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (((ushort *)pbVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)pbVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)pbVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)(pbVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)(pbVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(byte *)(pbVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(byte *)(pbVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar5)->flags_res
)
...>
}

@field_10_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (((ushort *)pbVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (((ushort *)pbVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)pbVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)pbVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)(pbVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)(pbVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(byte *)(pbVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(byte *)(pbVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar5)->enchanted
)
...>
}

@field_10_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (((ushort *)pbVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (((ushort *)pbVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)pbVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)pbVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)(pbVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)(pbVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(byte *)(pbVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(byte *)(pbVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar5)->doordir
)
...>
}

@field_10_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (((ushort *)pbVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (((ushort *)pbVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)pbVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)pbVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)(pbVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)(pbVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(byte *)(pbVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(byte *)(pbVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar5)->invisible
)
...>
}

@field_10_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (((ushort *)pbVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (((ushort *)pbVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)pbVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)pbVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)(pbVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)(pbVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- *(byte *)((char *)pbVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(byte *)(pbVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(byte *)(pbVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- *(byte *)(pbVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar5)->is_quant
)
...>
}

@field_10_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- ((ushort *)pbVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- *(ushort *)(pbVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- *(byte *)((char *)pbVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- pbVar5[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- *(byte *)(pbVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
)
...>
}

@field_10_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (*(ushort *)((char *)pbVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (((ushort *)pbVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (((ushort *)pbVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (*(ushort *)(pbVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (*(ushort *)(pbVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar5)->heading
)
...>
}

@field_10_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(ushort *)((char *)pbVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (((ushort *)pbVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (((ushort *)pbVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(ushort *)(pbVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(ushort *)(pbVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(byte *)((char *)pbVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(byte *)((char *)pbVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(byte *)(pbVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(byte *)(pbVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar5)->ypos
)
...>
}

@field_10_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(ushort *)((char *)pbVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (((ushort *)pbVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (((ushort *)pbVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(ushort *)(pbVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(ushort *)(pbVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(byte *)((char *)pbVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(byte *)((char *)pbVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- *(byte *)((char *)pbVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(byte *)(pbVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(byte *)(pbVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- *(byte *)(pbVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar5)->xpos
)
...>
}

@field_10_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- ((ushort *)pbVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- *(ushort *)(pbVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- *(byte *)((char *)pbVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- pbVar5[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- *(byte *)(pbVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
)
...>
}

@field_10_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (*(ushort *)((char *)pbVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (((ushort *)pbVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (((ushort *)pbVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (*(ushort *)(pbVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (*(ushort *)(pbVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->next
)
...>
}

@field_10_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- ((ushort *)pbVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- *(ushort *)(pbVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- *(byte *)((char *)pbVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- pbVar5[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- *(byte *)(pbVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
)
...>
}

@field_10_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (*(ushort *)((char *)pbVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (((ushort *)pbVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (((ushort *)pbVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (*(ushort *)(pbVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (*(ushort *)(pbVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->link
)
...>
}

@field_11_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- ((ushort *)pbVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- *(ushort *)pbVar1 & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- *(ushort *)(pbVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- CONCAT11(pbVar1[1], *pbVar1) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- CONCAT11(pbVar1[1], pbVar1[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
)
...>
}

@field_11_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (((ushort *)pbVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (((ushort *)pbVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)pbVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)pbVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)(pbVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)(pbVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)(pbVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)(pbVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar1)->flags_res
)
...>
}

@field_11_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (((ushort *)pbVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (((ushort *)pbVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)pbVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)pbVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)(pbVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)(pbVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)(pbVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)(pbVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar1)->enchanted
)
...>
}

@field_11_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (((ushort *)pbVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (((ushort *)pbVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)pbVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)pbVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)(pbVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)(pbVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)(pbVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)(pbVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar1)->doordir
)
...>
}

@field_11_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (((ushort *)pbVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (((ushort *)pbVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)pbVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)pbVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)(pbVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)(pbVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)(pbVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)(pbVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar1)->invisible
)
...>
}

@field_11_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (((ushort *)pbVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (((ushort *)pbVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)pbVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)pbVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)(pbVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)(pbVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- *(byte *)((char *)pbVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)(pbVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)(pbVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- *(byte *)(pbVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
)
...>
}

@field_11_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- ((ushort *)pbVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- *(ushort *)(pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- *(byte *)((char *)pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- pbVar1[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- *(byte *)(pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
)
...>
}

@field_11_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (((ushort *)pbVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (((ushort *)pbVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)(pbVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)(pbVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
)
...>
}

@field_11_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (((ushort *)pbVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (((ushort *)pbVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)(pbVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)(pbVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)((char *)pbVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)((char *)pbVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)(pbVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)(pbVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar1)->ypos
)
...>
}

@field_11_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (((ushort *)pbVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (((ushort *)pbVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)(pbVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)(pbVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)((char *)pbVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)((char *)pbVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- *(byte *)((char *)pbVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)(pbVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)(pbVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- *(byte *)(pbVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
)
...>
}

@field_11_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- ((ushort *)pbVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- *(ushort *)(pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- *(byte *)((char *)pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- pbVar1[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- *(byte *)(pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
)
...>
}

@field_11_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)((char *)pbVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (((ushort *)pbVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (((ushort *)pbVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)(pbVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)(pbVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
)
...>
}

@field_11_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- ((ushort *)pbVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- *(ushort *)(pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- *(byte *)((char *)pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- pbVar1[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- *(byte *)(pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
)
...>
}

@field_11_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)((char *)pbVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (((ushort *)pbVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (((ushort *)pbVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)(pbVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)(pbVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
)
...>
}

@field_12_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- ((ushort *)iVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- *(ushort *)iVar2 & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- *(ushort *)(iVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
)
...>
}

@field_12_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (((ushort *)iVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (((ushort *)iVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)iVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)iVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)(iVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)(iVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)((char *)iVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)((char *)iVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)(iVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)(iVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar2)->flags_res
)
...>
}

@field_12_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (((ushort *)iVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (((ushort *)iVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)iVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)iVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)(iVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)(iVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)((char *)iVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)(iVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)(iVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar2)->enchanted
)
...>
}

@field_12_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (((ushort *)iVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (((ushort *)iVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)iVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)iVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)(iVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)(iVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)((char *)iVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)(iVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)(iVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar2)->doordir
)
...>
}

@field_12_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (((ushort *)iVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (((ushort *)iVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)iVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)iVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)(iVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)(iVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)((char *)iVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)(iVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)(iVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar2)->invisible
)
...>
}

@field_12_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (((ushort *)iVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (((ushort *)iVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)iVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)iVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)(iVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)(iVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)((char *)iVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- *(byte *)((char *)iVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)(iVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)(iVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- *(byte *)(iVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
)
...>
}

@field_12_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- ((ushort *)iVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- *(ushort *)(iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- *(byte *)((char *)iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- *(byte *)(iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
)
...>
}

@field_12_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (((ushort *)iVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (((ushort *)iVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (*(ushort *)(iVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (*(ushort *)(iVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
)
...>
}

@field_12_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (((ushort *)iVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (((ushort *)iVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(ushort *)(iVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(ushort *)(iVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)((char *)iVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)((char *)iVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)(iVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)(iVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar2)->ypos
)
...>
}

@field_12_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (((ushort *)iVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (((ushort *)iVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(ushort *)(iVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(ushort *)(iVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)((char *)iVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)((char *)iVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- *(byte *)((char *)iVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)(iVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)(iVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- *(byte *)(iVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
)
...>
}

@field_12_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- ((ushort *)iVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- *(ushort *)(iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- *(byte *)((char *)iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- *(byte *)(iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
)
...>
}

@field_12_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (*(ushort *)((char *)iVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
|
- (((ushort *)iVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (((ushort *)iVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
|
- (*(ushort *)(iVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (*(ushort *)(iVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
)
...>
}

@field_12_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- ((ushort *)iVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- *(ushort *)(iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- *(byte *)((char *)iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- *(byte *)(iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
)
...>
}

@field_12_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (*(ushort *)((char *)iVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
|
- (((ushort *)iVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (((ushort *)iVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
|
- (*(ushort *)(iVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (*(ushort *)(iVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
)
...>
}

@field_13_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pNew)->object_id
|
- ((ushort *)pNew)[0] & 0x1ff
+ ((uw_object_hdr_t *)pNew)->object_id
|
- *(ushort *)pNew & 0x1ff
+ ((uw_object_hdr_t *)pNew)->object_id
|
- *(ushort *)(pNew + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pNew)->object_id
|
- CONCAT11(pNew[1], *pNew) & 0x1ff
+ ((uw_object_hdr_t *)pNew)->object_id
|
- CONCAT11(pNew[1], pNew[0]) & 0x1ff
+ ((uw_object_hdr_t *)pNew)->object_id
)
...>
}

@field_13_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(ushort *)((char *)pNew + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (((ushort *)pNew)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (((ushort *)pNew)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(ushort *)pNew >> 9) & 0x7
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(ushort *)pNew & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(ushort *)(pNew + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(ushort *)(pNew + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (CONCAT11(pNew[1], *pNew) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (CONCAT11(pNew[1], *pNew) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (CONCAT11(pNew[1], pNew[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (CONCAT11(pNew[1], pNew[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(byte *)((char *)pNew + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(byte *)((char *)pNew + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(byte *)(pNew + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pNew)->flags_res
|
- (*(byte *)(pNew + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pNew)->flags_res
)
...>
}

@field_13_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(ushort *)((char *)pNew + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (((ushort *)pNew)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (((ushort *)pNew)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(ushort *)pNew >> 12) & 0x1
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(ushort *)pNew & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(ushort *)(pNew + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(ushort *)(pNew + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (CONCAT11(pNew[1], *pNew) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (CONCAT11(pNew[1], *pNew) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (CONCAT11(pNew[1], pNew[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (CONCAT11(pNew[1], pNew[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(byte *)((char *)pNew + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(byte *)((char *)pNew + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(byte *)(pNew + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pNew)->enchanted
|
- (*(byte *)(pNew + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pNew)->enchanted
)
...>
}

@field_13_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(ushort *)((char *)pNew + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (((ushort *)pNew)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (((ushort *)pNew)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(ushort *)pNew >> 13) & 0x1
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(ushort *)pNew & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(ushort *)(pNew + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(ushort *)(pNew + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (CONCAT11(pNew[1], *pNew) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (CONCAT11(pNew[1], *pNew) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (CONCAT11(pNew[1], pNew[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (CONCAT11(pNew[1], pNew[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(byte *)((char *)pNew + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(byte *)((char *)pNew + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(byte *)(pNew + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pNew)->doordir
|
- (*(byte *)(pNew + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pNew)->doordir
)
...>
}

@field_13_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(ushort *)((char *)pNew + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (((ushort *)pNew)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (((ushort *)pNew)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(ushort *)pNew >> 14) & 0x1
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(ushort *)pNew & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(ushort *)(pNew + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(ushort *)(pNew + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (CONCAT11(pNew[1], *pNew) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (CONCAT11(pNew[1], *pNew) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (CONCAT11(pNew[1], pNew[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (CONCAT11(pNew[1], pNew[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(byte *)((char *)pNew + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(byte *)((char *)pNew + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(byte *)(pNew + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pNew)->invisible
|
- (*(byte *)(pNew + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pNew)->invisible
)
...>
}

@field_13_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(ushort *)((char *)pNew + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (((ushort *)pNew)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (((ushort *)pNew)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(ushort *)pNew >> 15) & 0x1
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(ushort *)pNew & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(ushort *)(pNew + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(ushort *)(pNew + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (CONCAT11(pNew[1], *pNew) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (CONCAT11(pNew[1], *pNew) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (CONCAT11(pNew[1], pNew[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (CONCAT11(pNew[1], pNew[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(byte *)((char *)pNew + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(byte *)((char *)pNew + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- *(byte *)((char *)pNew + 0x1) >> 7
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(byte *)(pNew + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- (*(byte *)(pNew + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pNew)->is_quant
|
- *(byte *)(pNew + 0x1) >> 7
+ ((uw_object_hdr_t *)pNew)->is_quant
)
...>
}

@field_13_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNew)->zpos
|
- ((ushort *)pNew)[1] & 0x7f
+ ((uw_object_hdr_t *)pNew)->zpos
|
- *(ushort *)(pNew + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNew)->zpos
|
- *(byte *)((char *)pNew + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNew)->zpos
|
- pNew[2] & 0x7f
+ ((uw_object_hdr_t *)pNew)->zpos
|
- *(byte *)(pNew + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNew)->zpos
)
...>
}

@field_13_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pNew)->heading
|
- (*(ushort *)((char *)pNew + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pNew)->heading
|
- (((ushort *)pNew)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pNew)->heading
|
- (((ushort *)pNew)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pNew)->heading
|
- (*(ushort *)(pNew + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pNew)->heading
|
- (*(ushort *)(pNew + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pNew)->heading
)
...>
}

@field_13_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (*(ushort *)((char *)pNew + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (((ushort *)pNew)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (((ushort *)pNew)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (*(ushort *)(pNew + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (*(ushort *)(pNew + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (*(byte *)((char *)pNew + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (*(byte *)((char *)pNew + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (*(byte *)(pNew + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pNew)->ypos
|
- (*(byte *)(pNew + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pNew)->ypos
)
...>
}

@field_13_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (*(ushort *)((char *)pNew + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (((ushort *)pNew)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (((ushort *)pNew)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (*(ushort *)(pNew + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (*(ushort *)(pNew + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (*(byte *)((char *)pNew + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (*(byte *)((char *)pNew + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pNew)->xpos
|
- *(byte *)((char *)pNew + 0x3) >> 5
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (*(byte *)(pNew + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pNew)->xpos
|
- (*(byte *)(pNew + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pNew)->xpos
|
- *(byte *)(pNew + 0x3) >> 5
+ ((uw_object_hdr_t *)pNew)->xpos
)
...>
}

@field_13_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNew)->quality
|
- ((ushort *)pNew)[2] & 0x3f
+ ((uw_object_hdr_t *)pNew)->quality
|
- *(ushort *)(pNew + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNew)->quality
|
- *(byte *)((char *)pNew + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNew)->quality
|
- pNew[4] & 0x3f
+ ((uw_object_hdr_t *)pNew)->quality
|
- *(byte *)(pNew + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNew)->quality
)
...>
}

@field_13_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNew)->next
|
- (*(ushort *)((char *)pNew + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNew)->next
|
- (((ushort *)pNew)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNew)->next
|
- (((ushort *)pNew)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNew)->next
|
- (*(ushort *)(pNew + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNew)->next
|
- (*(ushort *)(pNew + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNew)->next
)
...>
}

@field_13_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNew)->owner
|
- ((ushort *)pNew)[3] & 0x3f
+ ((uw_object_hdr_t *)pNew)->owner
|
- *(ushort *)(pNew + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNew)->owner
|
- *(byte *)((char *)pNew + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNew)->owner
|
- pNew[6] & 0x3f
+ ((uw_object_hdr_t *)pNew)->owner
|
- *(byte *)(pNew + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNew)->owner
)
...>
}

@field_13_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNew + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNew)->link
|
- (*(ushort *)((char *)pNew + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNew)->link
|
- (((ushort *)pNew)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNew)->link
|
- (((ushort *)pNew)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNew)->link
|
- (*(ushort *)(pNew + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNew)->link
|
- (*(ushort *)(pNew + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNew)->link
)
...>
}

@field_14_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
|
- ((ushort *)iVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
|
- *(ushort *)iVar3 & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
|
- *(ushort *)(iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
)
...>
}

@field_14_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (((ushort *)iVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (((ushort *)iVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)iVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)iVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)(iVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)(iVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)(iVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)(iVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar3)->flags_res
)
...>
}

@field_14_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (((ushort *)iVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (((ushort *)iVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)iVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)iVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)(iVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)(iVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)(iVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)(iVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar3)->enchanted
)
...>
}

@field_14_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (((ushort *)iVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (((ushort *)iVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)iVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)iVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)(iVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)(iVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)(iVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)(iVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar3)->doordir
)
...>
}

@field_14_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (((ushort *)iVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (((ushort *)iVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)iVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)iVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)(iVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)(iVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)(iVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)(iVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar3)->invisible
)
...>
}

@field_14_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (((ushort *)iVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (((ushort *)iVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)iVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)iVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)(iVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)(iVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- *(byte *)((char *)iVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)(iVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)(iVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- *(byte *)(iVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
)
...>
}

@field_14_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- ((ushort *)iVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(ushort *)(iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(byte *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(byte *)(iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
)
...>
}

@field_14_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (((ushort *)iVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (((ushort *)iVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)(iVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)(iVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
)
...>
}

@field_14_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (((ushort *)iVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (((ushort *)iVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)(iVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)(iVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)(iVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)(iVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar3)->ypos
)
...>
}

@field_14_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (((ushort *)iVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (((ushort *)iVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)(iVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)(iVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- *(byte *)((char *)iVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)(iVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)(iVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- *(byte *)(iVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
)
...>
}

@field_14_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- ((ushort *)iVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(ushort *)(iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(byte *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(byte *)(iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
)
...>
}

@field_14_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)((char *)iVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
|
- (((ushort *)iVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (((ushort *)iVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)(iVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)(iVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
)
...>
}

@field_14_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- ((ushort *)iVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(ushort *)(iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(byte *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(byte *)(iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
)
...>
}

@field_14_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)((char *)iVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
|
- (((ushort *)iVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (((ushort *)iVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)(iVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)(iVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
)
...>
}

@field_15_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- ((ushort *)iVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- *(ushort *)iVar2 & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
)
...>
}

@field_15_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (((ushort *)iVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (((ushort *)iVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)iVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)iVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)((char *)iVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)((char *)iVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar2)->flags_res
)
...>
}

@field_15_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (((ushort *)iVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (((ushort *)iVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)iVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)iVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)((char *)iVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar2)->enchanted
)
...>
}

@field_15_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (((ushort *)iVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (((ushort *)iVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)iVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)iVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)((char *)iVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar2)->doordir
)
...>
}

@field_15_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (((ushort *)iVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (((ushort *)iVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)iVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)iVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)((char *)iVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar2)->invisible
)
...>
}

@field_15_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (((ushort *)iVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (((ushort *)iVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)iVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)iVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)((char *)iVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- *(byte *)((char *)iVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
)
...>
}

@field_15_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- ((ushort *)iVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- *(byte *)((char *)iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
)
...>
}

@field_15_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (((ushort *)iVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (((ushort *)iVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
)
...>
}

@field_15_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (((ushort *)iVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (((ushort *)iVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)((char *)iVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)((char *)iVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar2)->ypos
)
...>
}

@field_15_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (((ushort *)iVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (((ushort *)iVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)((char *)iVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)((char *)iVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- *(byte *)((char *)iVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
)
...>
}

@field_15_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- ((ushort *)iVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- *(byte *)((char *)iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
)
...>
}

@field_15_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (*(ushort *)((char *)iVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
|
- (((ushort *)iVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (((ushort *)iVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
)
...>
}

@field_15_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- ((ushort *)iVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- *(byte *)((char *)iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
)
...>
}

@field_15_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (*(ushort *)((char *)iVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
|
- (((ushort *)iVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (((ushort *)iVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
)
...>
}

@field_16_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- ((ushort *)puVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- *(ushort *)puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- puVar2[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- *puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
)
...>
}

@field_16_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (((ushort *)puVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (((ushort *)puVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)puVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)puVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (puVar2[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (puVar2[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*puVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*puVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar2)->flags_res
)
...>
}

@field_16_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (((ushort *)puVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (((ushort *)puVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)puVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)puVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (puVar2[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (puVar2[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*puVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*puVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar2)->enchanted
)
...>
}

@field_16_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (((ushort *)puVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (((ushort *)puVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)puVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)puVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (puVar2[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (puVar2[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*puVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*puVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar2)->doordir
)
...>
}

@field_16_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (((ushort *)puVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (((ushort *)puVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)puVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)puVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (puVar2[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (puVar2[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*puVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*puVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar2)->invisible
)
...>
}

@field_16_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(ushort *)((char *)puVar2 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- ((ushort *)puVar2)[0] >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(ushort *)puVar2 >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (puVar2[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (puVar2[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- puVar2[0] >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*puVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*puVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *puVar2 >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(byte *)((char *)puVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
)
...>
}

@field_16_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- ((ushort *)puVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- puVar2[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- *(byte *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- (byte)puVar2[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
)
...>
}

@field_16_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (((ushort *)puVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (((ushort *)puVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (puVar2[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (puVar2[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
)
...>
}

@field_16_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (((ushort *)puVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (((ushort *)puVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (puVar2[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (puVar2[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar2)->ypos
)
...>
}

@field_16_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- *(ushort *)((char *)puVar2 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- ((ushort *)puVar2)[1] >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (puVar2[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (puVar2[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- puVar2[1] >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- *(byte *)((char *)puVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
)
...>
}

@field_16_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- ((ushort *)puVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- puVar2[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- *(byte *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- (byte)puVar2[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
)
...>
}

@field_16_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (*(ushort *)((char *)puVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- *(ushort *)((char *)puVar2 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- ((ushort *)puVar2)[2] >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- (puVar2[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (puVar2[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- puVar2[2] >> 6
+ ((uw_object_hdr_t *)puVar2)->next
)
...>
}

@field_16_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- ((ushort *)puVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- puVar2[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- *(byte *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- (byte)puVar2[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
)
...>
}

@field_16_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (*(ushort *)((char *)puVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- *(ushort *)((char *)puVar2 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- ((ushort *)puVar2)[3] >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- (puVar2[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (puVar2[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- puVar2[3] >> 6
+ ((uw_object_hdr_t *)puVar2)->link
)
...>
}

@field_17_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
|
- ((ushort *)puVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
|
- *(ushort *)puVar3 & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
|
- puVar3[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
|
- *puVar3 & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
)
...>
}

@field_17_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (((ushort *)puVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (((ushort *)puVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)puVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)puVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (puVar3[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (puVar3[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*puVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*puVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(byte *)((char *)puVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(byte *)((char *)puVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar3)->flags_res
)
...>
}

@field_17_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (((ushort *)puVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (((ushort *)puVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)puVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)puVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (puVar3[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (puVar3[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*puVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*puVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(byte *)((char *)puVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar3)->enchanted
)
...>
}

@field_17_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (((ushort *)puVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (((ushort *)puVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)puVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)puVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (puVar3[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (puVar3[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*puVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*puVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(byte *)((char *)puVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar3)->doordir
)
...>
}

@field_17_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (((ushort *)puVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (((ushort *)puVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)puVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)puVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (puVar3[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (puVar3[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*puVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*puVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(byte *)((char *)puVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar3)->invisible
)
...>
}

@field_17_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *(ushort *)((char *)puVar3 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (((ushort *)puVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (((ushort *)puVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- ((ushort *)puVar3)[0] >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)puVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)puVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *(ushort *)puVar3 >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (puVar3[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (puVar3[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- puVar3[0] >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*puVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*puVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *puVar3 >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(byte *)((char *)puVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *(byte *)((char *)puVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar3)->is_quant
)
...>
}

@field_17_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- ((ushort *)puVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- puVar3[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- *(byte *)((char *)puVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- (byte)puVar3[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
)
...>
}

@field_17_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (((ushort *)puVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (((ushort *)puVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (puVar3[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (puVar3[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
)
...>
}

@field_17_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (((ushort *)puVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (((ushort *)puVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (puVar3[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (puVar3[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(byte *)((char *)puVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(byte *)((char *)puVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar3)->ypos
)
...>
}

@field_17_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- *(ushort *)((char *)puVar3 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (((ushort *)puVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (((ushort *)puVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- ((ushort *)puVar3)[1] >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (puVar3[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (puVar3[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- puVar3[1] >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(byte *)((char *)puVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(byte *)((char *)puVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- *(byte *)((char *)puVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar3)->xpos
)
...>
}

@field_17_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- ((ushort *)puVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- puVar3[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- *(byte *)((char *)puVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- (byte)puVar3[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
)
...>
}

@field_17_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (*(ushort *)((char *)puVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- *(ushort *)((char *)puVar3 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- (((ushort *)puVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (((ushort *)puVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- ((ushort *)puVar3)[2] >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- (puVar3[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (puVar3[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- puVar3[2] >> 6
+ ((uw_object_hdr_t *)puVar3)->next
)
...>
}

@field_17_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- ((ushort *)puVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- puVar3[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- *(byte *)((char *)puVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- (byte)puVar3[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
)
...>
}

@field_17_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (*(ushort *)((char *)puVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- *(ushort *)((char *)puVar3 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- (((ushort *)puVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (((ushort *)puVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- ((ushort *)puVar3)[3] >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- (puVar3[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (puVar3[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- puVar3[3] >> 6
+ ((uw_object_hdr_t *)puVar3)->link
)
...>
}
