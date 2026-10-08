@field_0_item_id@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)obj)->item_id
|
- ((ushort *)obj)[0] & 0x1ff
+ ((uw_object_hdr_t *)obj)->item_id
|
- *(ushort *)obj & 0x1ff
+ ((uw_object_hdr_t *)obj)->item_id
|
- obj[0] & 0x1ff
+ ((uw_object_hdr_t *)obj)->item_id
|
- *obj & 0x1ff
+ ((uw_object_hdr_t *)obj)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(ushort *)((char *)obj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (((ushort *)obj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (((ushort *)obj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(ushort *)obj >> 9) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(ushort *)obj & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (obj[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (obj[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*obj >> 9) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*obj & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(byte *)((char *)obj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(byte *)((char *)obj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)obj)->flags_res
)
...>
}

@field_0_enchanted@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(ushort *)((char *)obj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (((ushort *)obj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (((ushort *)obj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(ushort *)obj >> 12) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(ushort *)obj & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (obj[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (obj[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*obj >> 12) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*obj & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(byte *)((char *)obj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(byte *)((char *)obj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)obj)->enchanted
)
...>
}

@field_0_doordir@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(ushort *)((char *)obj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj)->doordir
|
- (((ushort *)obj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (((ushort *)obj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(ushort *)obj >> 13) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(ushort *)obj & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj)->doordir
|
- (obj[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (obj[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*obj >> 13) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*obj & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(byte *)((char *)obj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(byte *)((char *)obj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)obj)->doordir
)
...>
}

@field_0_invisible@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(ushort *)((char *)obj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj)->invisible
|
- (((ushort *)obj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (((ushort *)obj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(ushort *)obj >> 14) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(ushort *)obj & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj)->invisible
|
- (obj[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (obj[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*obj >> 14) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*obj & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(byte *)((char *)obj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(byte *)((char *)obj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)obj)->invisible
)
...>
}

@field_0_is_quant@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(ushort *)((char *)obj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- *(ushort *)((char *)obj + 0x0) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (((ushort *)obj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (((ushort *)obj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- ((ushort *)obj)[0] >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(ushort *)obj >> 15) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(ushort *)obj & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- *(ushort *)obj >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (obj[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (obj[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- obj[0] >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*obj >> 15) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*obj & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- *obj >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(byte *)((char *)obj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(byte *)((char *)obj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)obj)->is_quant
)
...>
}

@field_0_zpos@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj)->zpos
|
- ((ushort *)obj)[1] & 0x7f
+ ((uw_object_hdr_t *)obj)->zpos
|
- obj[1] & 0x7f
+ ((uw_object_hdr_t *)obj)->zpos
|
- *(byte *)((char *)obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj)->zpos
|
- (byte)obj[1] & 0x7f
+ ((uw_object_hdr_t *)obj)->zpos
)
...>
}

@field_0_heading@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)obj)->heading
|
- (*(ushort *)((char *)obj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)obj)->heading
|
- (((ushort *)obj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)obj)->heading
|
- (((ushort *)obj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)obj)->heading
|
- (obj[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)obj)->heading
|
- (obj[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)obj)->heading
)
...>
}

@field_0_ypos@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)obj)->ypos
|
- (*(ushort *)((char *)obj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)obj)->ypos
|
- (((ushort *)obj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)obj)->ypos
|
- (((ushort *)obj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)obj)->ypos
|
- (obj[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)obj)->ypos
|
- (obj[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)obj)->ypos
|
- (*(byte *)((char *)obj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)obj)->ypos
|
- (*(byte *)((char *)obj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)obj)->ypos
)
...>
}

@field_0_xpos@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(ushort *)((char *)obj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj)->xpos
|
- *(ushort *)((char *)obj + 0x2) >> 13
+ ((uw_object_hdr_t *)obj)->xpos
|
- (((ushort *)obj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)obj)->xpos
|
- (((ushort *)obj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj)->xpos
|
- ((ushort *)obj)[1] >> 13
+ ((uw_object_hdr_t *)obj)->xpos
|
- (obj[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)obj)->xpos
|
- (obj[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj)->xpos
|
- obj[1] >> 13
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(byte *)((char *)obj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(byte *)((char *)obj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)obj)->xpos
)
...>
}

@field_0_quality@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj)->quality
|
- ((ushort *)obj)[2] & 0x3f
+ ((uw_object_hdr_t *)obj)->quality
|
- obj[2] & 0x3f
+ ((uw_object_hdr_t *)obj)->quality
|
- *(byte *)((char *)obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj)->quality
|
- (byte)obj[2] & 0x3f
+ ((uw_object_hdr_t *)obj)->quality
)
...>
}

@field_0_next@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->next
|
- (*(ushort *)((char *)obj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->next
|
- *(ushort *)((char *)obj + 0x4) >> 6
+ ((uw_object_hdr_t *)obj)->next
|
- (((ushort *)obj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->next
|
- (((ushort *)obj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->next
|
- ((ushort *)obj)[2] >> 6
+ ((uw_object_hdr_t *)obj)->next
|
- (obj[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->next
|
- (obj[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->next
|
- obj[2] >> 6
+ ((uw_object_hdr_t *)obj)->next
)
...>
}

@field_0_owner@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj)->owner
|
- ((ushort *)obj)[3] & 0x3f
+ ((uw_object_hdr_t *)obj)->owner
|
- obj[3] & 0x3f
+ ((uw_object_hdr_t *)obj)->owner
|
- *(byte *)((char *)obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj)->owner
|
- (byte)obj[3] & 0x3f
+ ((uw_object_hdr_t *)obj)->owner
)
...>
}

@field_0_link@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->link
|
- (*(ushort *)((char *)obj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->link
|
- *(ushort *)((char *)obj + 0x6) >> 6
+ ((uw_object_hdr_t *)obj)->link
|
- (((ushort *)obj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->link
|
- (((ushort *)obj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->link
|
- ((ushort *)obj)[3] >> 6
+ ((uw_object_hdr_t *)obj)->link
|
- (obj[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->link
|
- (obj[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->link
|
- obj[3] >> 6
+ ((uw_object_hdr_t *)obj)->link
)
...>
}
