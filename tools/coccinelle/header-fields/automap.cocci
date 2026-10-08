@field_0_item_id@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pp)->item_id
|
- ((ushort *)pp)[0] & 0x1ff
+ ((uw_object_hdr_t *)pp)->item_id
|
- *(ushort *)pp & 0x1ff
+ ((uw_object_hdr_t *)pp)->item_id
|
- pp[0] & 0x1ff
+ ((uw_object_hdr_t *)pp)->item_id
|
- *pp & 0x1ff
+ ((uw_object_hdr_t *)pp)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (*(ushort *)((char *)pp + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (((ushort *)pp)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (((ushort *)pp)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (*(ushort *)pp >> 9) & 0x7
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (*(ushort *)pp & 0xe00) >> 9
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (pp[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (pp[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (*pp >> 9) & 0x7
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (*pp & 0xe00) >> 9
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (*(byte *)((char *)pp + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pp)->flags_res
|
- (*(byte *)((char *)pp + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pp)->flags_res
)
...>
}

@field_0_enchanted@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (*(ushort *)((char *)pp + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (((ushort *)pp)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (((ushort *)pp)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (*(ushort *)pp >> 12) & 0x1
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (*(ushort *)pp & 0x1000) >> 12
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (pp[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (pp[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (*pp >> 12) & 0x1
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (*pp & 0x1000) >> 12
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (*(byte *)((char *)pp + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pp)->enchanted
|
- (*(byte *)((char *)pp + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pp)->enchanted
)
...>
}

@field_0_doordir@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pp)->doordir
|
- (*(ushort *)((char *)pp + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pp)->doordir
|
- (((ushort *)pp)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pp)->doordir
|
- (((ushort *)pp)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pp)->doordir
|
- (*(ushort *)pp >> 13) & 0x1
+ ((uw_object_hdr_t *)pp)->doordir
|
- (*(ushort *)pp & 0x2000) >> 13
+ ((uw_object_hdr_t *)pp)->doordir
|
- (pp[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pp)->doordir
|
- (pp[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pp)->doordir
|
- (*pp >> 13) & 0x1
+ ((uw_object_hdr_t *)pp)->doordir
|
- (*pp & 0x2000) >> 13
+ ((uw_object_hdr_t *)pp)->doordir
|
- (*(byte *)((char *)pp + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pp)->doordir
|
- (*(byte *)((char *)pp + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pp)->doordir
)
...>
}

@field_0_invisible@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pp)->invisible
|
- (*(ushort *)((char *)pp + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pp)->invisible
|
- (((ushort *)pp)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pp)->invisible
|
- (((ushort *)pp)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pp)->invisible
|
- (*(ushort *)pp >> 14) & 0x1
+ ((uw_object_hdr_t *)pp)->invisible
|
- (*(ushort *)pp & 0x4000) >> 14
+ ((uw_object_hdr_t *)pp)->invisible
|
- (pp[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pp)->invisible
|
- (pp[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pp)->invisible
|
- (*pp >> 14) & 0x1
+ ((uw_object_hdr_t *)pp)->invisible
|
- (*pp & 0x4000) >> 14
+ ((uw_object_hdr_t *)pp)->invisible
|
- (*(byte *)((char *)pp + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pp)->invisible
|
- (*(byte *)((char *)pp + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pp)->invisible
)
...>
}

@field_0_is_quant@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (*(ushort *)((char *)pp + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- *(ushort *)((char *)pp + 0x0) >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (((ushort *)pp)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (((ushort *)pp)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- ((ushort *)pp)[0] >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (*(ushort *)pp >> 15) & 0x1
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (*(ushort *)pp & 0x8000) >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- *(ushort *)pp >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (pp[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (pp[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- pp[0] >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (*pp >> 15) & 0x1
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (*pp & 0x8000) >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- *pp >> 15
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (*(byte *)((char *)pp + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pp)->is_quant
|
- (*(byte *)((char *)pp + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pp)->is_quant
)
...>
}

@field_0_zpos@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pp)->zpos
|
- ((ushort *)pp)[1] & 0x7f
+ ((uw_object_hdr_t *)pp)->zpos
|
- pp[1] & 0x7f
+ ((uw_object_hdr_t *)pp)->zpos
|
- *(byte *)((char *)pp + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pp)->zpos
|
- (byte)pp[1] & 0x7f
+ ((uw_object_hdr_t *)pp)->zpos
)
...>
}

@field_0_heading@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pp)->heading
|
- (*(ushort *)((char *)pp + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pp)->heading
|
- (((ushort *)pp)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pp)->heading
|
- (((ushort *)pp)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pp)->heading
|
- (pp[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pp)->heading
|
- (pp[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pp)->heading
)
...>
}

@field_0_ypos@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pp)->ypos
|
- (*(ushort *)((char *)pp + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pp)->ypos
|
- (((ushort *)pp)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pp)->ypos
|
- (((ushort *)pp)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pp)->ypos
|
- (pp[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pp)->ypos
|
- (pp[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pp)->ypos
|
- (*(byte *)((char *)pp + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pp)->ypos
|
- (*(byte *)((char *)pp + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pp)->ypos
)
...>
}

@field_0_xpos@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pp)->xpos
|
- (*(ushort *)((char *)pp + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pp)->xpos
|
- *(ushort *)((char *)pp + 0x2) >> 13
+ ((uw_object_hdr_t *)pp)->xpos
|
- (((ushort *)pp)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pp)->xpos
|
- (((ushort *)pp)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pp)->xpos
|
- ((ushort *)pp)[1] >> 13
+ ((uw_object_hdr_t *)pp)->xpos
|
- (pp[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pp)->xpos
|
- (pp[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pp)->xpos
|
- pp[1] >> 13
+ ((uw_object_hdr_t *)pp)->xpos
|
- (*(byte *)((char *)pp + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pp)->xpos
|
- (*(byte *)((char *)pp + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pp)->xpos
)
...>
}

@field_0_quality@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pp)->quality
|
- ((ushort *)pp)[2] & 0x3f
+ ((uw_object_hdr_t *)pp)->quality
|
- pp[2] & 0x3f
+ ((uw_object_hdr_t *)pp)->quality
|
- *(byte *)((char *)pp + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pp)->quality
|
- (byte)pp[2] & 0x3f
+ ((uw_object_hdr_t *)pp)->quality
)
...>
}

@field_0_next@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pp)->next
|
- (*(ushort *)((char *)pp + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pp)->next
|
- *(ushort *)((char *)pp + 0x4) >> 6
+ ((uw_object_hdr_t *)pp)->next
|
- (((ushort *)pp)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pp)->next
|
- (((ushort *)pp)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pp)->next
|
- ((ushort *)pp)[2] >> 6
+ ((uw_object_hdr_t *)pp)->next
|
- (pp[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pp)->next
|
- (pp[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pp)->next
|
- pp[2] >> 6
+ ((uw_object_hdr_t *)pp)->next
)
...>
}

@field_0_owner@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pp)->owner
|
- ((ushort *)pp)[3] & 0x3f
+ ((uw_object_hdr_t *)pp)->owner
|
- pp[3] & 0x3f
+ ((uw_object_hdr_t *)pp)->owner
|
- *(byte *)((char *)pp + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pp)->owner
|
- (byte)pp[3] & 0x3f
+ ((uw_object_hdr_t *)pp)->owner
)
...>
}

@field_0_link@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pp + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pp)->link
|
- (*(ushort *)((char *)pp + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pp)->link
|
- *(ushort *)((char *)pp + 0x6) >> 6
+ ((uw_object_hdr_t *)pp)->link
|
- (((ushort *)pp)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pp)->link
|
- (((ushort *)pp)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pp)->link
|
- ((ushort *)pp)[3] >> 6
+ ((uw_object_hdr_t *)pp)->link
|
- (pp[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pp)->link
|
- (pp[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pp)->link
|
- pp[3] >> 6
+ ((uw_object_hdr_t *)pp)->link
)
...>
}
