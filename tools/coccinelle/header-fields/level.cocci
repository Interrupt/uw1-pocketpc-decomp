@field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_obj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_obj)->item_id
|
- ((ushort *)_obj)[0] & 0x1ff
+ ((uw_object_hdr_t *)_obj)->item_id
|
- *(ushort *)_obj & 0x1ff
+ ((uw_object_hdr_t *)_obj)->item_id
|
- *(ushort *)(_obj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_obj)->item_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(ushort *)((char *)_obj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (((ushort *)_obj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (((ushort *)_obj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(ushort *)_obj >> 9) & 0x7
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(ushort *)_obj & 0xe00) >> 9
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(ushort *)(_obj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(ushort *)(_obj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(byte *)((char *)_obj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(byte *)((char *)_obj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(byte *)(_obj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_obj)->flags_res
|
- (*(byte *)(_obj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_obj)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(ushort *)((char *)_obj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (((ushort *)_obj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (((ushort *)_obj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(ushort *)_obj >> 12) & 0x1
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(ushort *)_obj & 0x1000) >> 12
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(ushort *)(_obj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(ushort *)(_obj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(byte *)((char *)_obj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(byte *)((char *)_obj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(byte *)(_obj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_obj)->enchanted
|
- (*(byte *)(_obj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_obj)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(ushort *)((char *)_obj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (((ushort *)_obj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (((ushort *)_obj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(ushort *)_obj >> 13) & 0x1
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(ushort *)_obj & 0x2000) >> 13
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(ushort *)(_obj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(ushort *)(_obj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(byte *)((char *)_obj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(byte *)((char *)_obj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(byte *)(_obj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_obj)->doordir
|
- (*(byte *)(_obj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_obj)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(ushort *)((char *)_obj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (((ushort *)_obj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (((ushort *)_obj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(ushort *)_obj >> 14) & 0x1
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(ushort *)_obj & 0x4000) >> 14
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(ushort *)(_obj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(ushort *)(_obj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(byte *)((char *)_obj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(byte *)((char *)_obj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(byte *)(_obj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_obj)->invisible
|
- (*(byte *)(_obj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_obj)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(ushort *)((char *)_obj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (((ushort *)_obj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (((ushort *)_obj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(ushort *)_obj >> 15) & 0x1
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(ushort *)_obj & 0x8000) >> 15
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(ushort *)(_obj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(ushort *)(_obj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(byte *)((char *)_obj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(byte *)((char *)_obj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- *(byte *)((char *)_obj + 0x1) >> 7
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(byte *)(_obj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- (*(byte *)(_obj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_obj)->is_quant
|
- *(byte *)(_obj + 0x1) >> 7
+ ((uw_object_hdr_t *)_obj)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_obj)->zpos
|
- ((ushort *)_obj)[1] & 0x7f
+ ((uw_object_hdr_t *)_obj)->zpos
|
- *(ushort *)(_obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_obj)->zpos
|
- *(byte *)((char *)_obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_obj)->zpos
|
- *(byte *)(_obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_obj)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_obj)->heading
|
- (*(ushort *)((char *)_obj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_obj)->heading
|
- (((ushort *)_obj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_obj)->heading
|
- (((ushort *)_obj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_obj)->heading
|
- (*(ushort *)(_obj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_obj)->heading
|
- (*(ushort *)(_obj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_obj)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (*(ushort *)((char *)_obj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (((ushort *)_obj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (((ushort *)_obj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (*(ushort *)(_obj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (*(ushort *)(_obj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (*(byte *)((char *)_obj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (*(byte *)((char *)_obj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (*(byte *)(_obj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_obj)->ypos
|
- (*(byte *)(_obj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_obj)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (*(ushort *)((char *)_obj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (((ushort *)_obj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (((ushort *)_obj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (*(ushort *)(_obj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (*(ushort *)(_obj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (*(byte *)((char *)_obj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (*(byte *)((char *)_obj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_obj)->xpos
|
- *(byte *)((char *)_obj + 0x3) >> 5
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (*(byte *)(_obj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_obj)->xpos
|
- (*(byte *)(_obj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_obj)->xpos
|
- *(byte *)(_obj + 0x3) >> 5
+ ((uw_object_hdr_t *)_obj)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_obj)->quality
|
- ((ushort *)_obj)[2] & 0x3f
+ ((uw_object_hdr_t *)_obj)->quality
|
- *(ushort *)(_obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_obj)->quality
|
- *(byte *)((char *)_obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_obj)->quality
|
- *(byte *)(_obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_obj)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_obj)->next
|
- (*(ushort *)((char *)_obj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_obj)->next
|
- (((ushort *)_obj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_obj)->next
|
- (((ushort *)_obj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_obj)->next
|
- (*(ushort *)(_obj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_obj)->next
|
- (*(ushort *)(_obj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_obj)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_obj)->owner
|
- ((ushort *)_obj)[3] & 0x3f
+ ((uw_object_hdr_t *)_obj)->owner
|
- *(ushort *)(_obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_obj)->owner
|
- *(byte *)((char *)_obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_obj)->owner
|
- *(byte *)(_obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_obj)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_obj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_obj)->link
|
- (*(ushort *)((char *)_obj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_obj)->link
|
- (((ushort *)_obj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_obj)->link
|
- (((ushort *)_obj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_obj)->link
|
- (*(ushort *)(_obj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_obj)->link
|
- (*(ushort *)(_obj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_obj)->link
)
...>
}
