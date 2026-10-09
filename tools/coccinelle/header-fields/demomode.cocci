@field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)c)->item_id
|
- ((ushort *)c)[0] & 0x1ff
+ ((uw_object_hdr_t *)c)->item_id
|
- *(ushort *)c & 0x1ff
+ ((uw_object_hdr_t *)c)->item_id
|
- c[0] & 0x1ff
+ ((uw_object_hdr_t *)c)->item_id
|
- *c & 0x1ff
+ ((uw_object_hdr_t *)c)->item_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)c)->flags_res
|
- (*(ushort *)((char *)c + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)c)->flags_res
|
- (((ushort *)c)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)c)->flags_res
|
- (((ushort *)c)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)c)->flags_res
|
- (*(ushort *)c >> 9) & 0x7
+ ((uw_object_hdr_t *)c)->flags_res
|
- (*(ushort *)c & 0xe00) >> 9
+ ((uw_object_hdr_t *)c)->flags_res
|
- (c[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)c)->flags_res
|
- (c[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)c)->flags_res
|
- (*c >> 9) & 0x7
+ ((uw_object_hdr_t *)c)->flags_res
|
- (*c & 0xe00) >> 9
+ ((uw_object_hdr_t *)c)->flags_res
|
- (*(byte *)((char *)c + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)c)->flags_res
|
- (*(byte *)((char *)c + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)c)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)c)->enchanted
|
- (*(ushort *)((char *)c + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)c)->enchanted
|
- (((ushort *)c)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)c)->enchanted
|
- (((ushort *)c)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)c)->enchanted
|
- (*(ushort *)c >> 12) & 0x1
+ ((uw_object_hdr_t *)c)->enchanted
|
- (*(ushort *)c & 0x1000) >> 12
+ ((uw_object_hdr_t *)c)->enchanted
|
- (c[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)c)->enchanted
|
- (c[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)c)->enchanted
|
- (*c >> 12) & 0x1
+ ((uw_object_hdr_t *)c)->enchanted
|
- (*c & 0x1000) >> 12
+ ((uw_object_hdr_t *)c)->enchanted
|
- (*(byte *)((char *)c + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)c)->enchanted
|
- (*(byte *)((char *)c + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)c)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)c)->doordir
|
- (*(ushort *)((char *)c + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)c)->doordir
|
- (((ushort *)c)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)c)->doordir
|
- (((ushort *)c)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)c)->doordir
|
- (*(ushort *)c >> 13) & 0x1
+ ((uw_object_hdr_t *)c)->doordir
|
- (*(ushort *)c & 0x2000) >> 13
+ ((uw_object_hdr_t *)c)->doordir
|
- (c[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)c)->doordir
|
- (c[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)c)->doordir
|
- (*c >> 13) & 0x1
+ ((uw_object_hdr_t *)c)->doordir
|
- (*c & 0x2000) >> 13
+ ((uw_object_hdr_t *)c)->doordir
|
- (*(byte *)((char *)c + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)c)->doordir
|
- (*(byte *)((char *)c + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)c)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)c)->invisible
|
- (*(ushort *)((char *)c + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)c)->invisible
|
- (((ushort *)c)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)c)->invisible
|
- (((ushort *)c)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)c)->invisible
|
- (*(ushort *)c >> 14) & 0x1
+ ((uw_object_hdr_t *)c)->invisible
|
- (*(ushort *)c & 0x4000) >> 14
+ ((uw_object_hdr_t *)c)->invisible
|
- (c[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)c)->invisible
|
- (c[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)c)->invisible
|
- (*c >> 14) & 0x1
+ ((uw_object_hdr_t *)c)->invisible
|
- (*c & 0x4000) >> 14
+ ((uw_object_hdr_t *)c)->invisible
|
- (*(byte *)((char *)c + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)c)->invisible
|
- (*(byte *)((char *)c + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)c)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)c)->is_quant
|
- (*(ushort *)((char *)c + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- *(ushort *)((char *)c + 0x0) >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- (((ushort *)c)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)c)->is_quant
|
- (((ushort *)c)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- ((ushort *)c)[0] >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- (*(ushort *)c >> 15) & 0x1
+ ((uw_object_hdr_t *)c)->is_quant
|
- (*(ushort *)c & 0x8000) >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- *(ushort *)c >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- (c[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)c)->is_quant
|
- (c[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- c[0] >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- (*c >> 15) & 0x1
+ ((uw_object_hdr_t *)c)->is_quant
|
- (*c & 0x8000) >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- *c >> 15
+ ((uw_object_hdr_t *)c)->is_quant
|
- (*(byte *)((char *)c + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)c)->is_quant
|
- (*(byte *)((char *)c + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)c)->is_quant
|
- *(byte *)((char *)c + 0x1) >> 7
+ ((uw_object_hdr_t *)c)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)c)->zpos
|
- ((ushort *)c)[1] & 0x7f
+ ((uw_object_hdr_t *)c)->zpos
|
- c[1] & 0x7f
+ ((uw_object_hdr_t *)c)->zpos
|
- *(byte *)((char *)c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)c)->zpos
|
- (byte)c[1] & 0x7f
+ ((uw_object_hdr_t *)c)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)c)->heading
|
- (*(ushort *)((char *)c + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)c)->heading
|
- (((ushort *)c)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)c)->heading
|
- (((ushort *)c)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)c)->heading
|
- (c[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)c)->heading
|
- (c[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)c)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)c)->ypos
|
- (*(ushort *)((char *)c + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)c)->ypos
|
- (((ushort *)c)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)c)->ypos
|
- (((ushort *)c)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)c)->ypos
|
- (c[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)c)->ypos
|
- (c[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)c)->ypos
|
- (*(byte *)((char *)c + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)c)->ypos
|
- (*(byte *)((char *)c + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)c)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)c)->xpos
|
- (*(ushort *)((char *)c + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)c)->xpos
|
- *(ushort *)((char *)c + 0x2) >> 13
+ ((uw_object_hdr_t *)c)->xpos
|
- (((ushort *)c)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)c)->xpos
|
- (((ushort *)c)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)c)->xpos
|
- ((ushort *)c)[1] >> 13
+ ((uw_object_hdr_t *)c)->xpos
|
- (c[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)c)->xpos
|
- (c[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)c)->xpos
|
- c[1] >> 13
+ ((uw_object_hdr_t *)c)->xpos
|
- (*(byte *)((char *)c + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)c)->xpos
|
- (*(byte *)((char *)c + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)c)->xpos
|
- *(byte *)((char *)c + 0x3) >> 5
+ ((uw_object_hdr_t *)c)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)c)->quality
|
- ((ushort *)c)[2] & 0x3f
+ ((uw_object_hdr_t *)c)->quality
|
- c[2] & 0x3f
+ ((uw_object_hdr_t *)c)->quality
|
- *(byte *)((char *)c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)c)->quality
|
- (byte)c[2] & 0x3f
+ ((uw_object_hdr_t *)c)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)c)->next
|
- (*(ushort *)((char *)c + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)c)->next
|
- *(ushort *)((char *)c + 0x4) >> 6
+ ((uw_object_hdr_t *)c)->next
|
- (((ushort *)c)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)c)->next
|
- (((ushort *)c)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)c)->next
|
- ((ushort *)c)[2] >> 6
+ ((uw_object_hdr_t *)c)->next
|
- (c[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)c)->next
|
- (c[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)c)->next
|
- c[2] >> 6
+ ((uw_object_hdr_t *)c)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)c)->owner
|
- ((ushort *)c)[3] & 0x3f
+ ((uw_object_hdr_t *)c)->owner
|
- c[3] & 0x3f
+ ((uw_object_hdr_t *)c)->owner
|
- *(byte *)((char *)c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)c)->owner
|
- (byte)c[3] & 0x3f
+ ((uw_object_hdr_t *)c)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)c + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)c)->link
|
- (*(ushort *)((char *)c + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)c)->link
|
- *(ushort *)((char *)c + 0x6) >> 6
+ ((uw_object_hdr_t *)c)->link
|
- (((ushort *)c)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)c)->link
|
- (((ushort *)c)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)c)->link
|
- ((ushort *)c)[3] >> 6
+ ((uw_object_hdr_t *)c)->link
|
- (c[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)c)->link
|
- (c[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)c)->link
|
- c[3] >> 6
+ ((uw_object_hdr_t *)c)->link
)
...>
}

@field_1_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)nc)->item_id
|
- ((ushort *)nc)[0] & 0x1ff
+ ((uw_object_hdr_t *)nc)->item_id
|
- *(ushort *)nc & 0x1ff
+ ((uw_object_hdr_t *)nc)->item_id
|
- nc[0] & 0x1ff
+ ((uw_object_hdr_t *)nc)->item_id
|
- *nc & 0x1ff
+ ((uw_object_hdr_t *)nc)->item_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (*(ushort *)((char *)nc + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (((ushort *)nc)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (((ushort *)nc)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (*(ushort *)nc >> 9) & 0x7
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (*(ushort *)nc & 0xe00) >> 9
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (nc[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (nc[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (*nc >> 9) & 0x7
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (*nc & 0xe00) >> 9
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (*(byte *)((char *)nc + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)nc)->flags_res
|
- (*(byte *)((char *)nc + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)nc)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (*(ushort *)((char *)nc + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (((ushort *)nc)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (((ushort *)nc)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (*(ushort *)nc >> 12) & 0x1
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (*(ushort *)nc & 0x1000) >> 12
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (nc[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (nc[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (*nc >> 12) & 0x1
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (*nc & 0x1000) >> 12
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (*(byte *)((char *)nc + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)nc)->enchanted
|
- (*(byte *)((char *)nc + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)nc)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)nc)->doordir
|
- (*(ushort *)((char *)nc + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)nc)->doordir
|
- (((ushort *)nc)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)nc)->doordir
|
- (((ushort *)nc)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)nc)->doordir
|
- (*(ushort *)nc >> 13) & 0x1
+ ((uw_object_hdr_t *)nc)->doordir
|
- (*(ushort *)nc & 0x2000) >> 13
+ ((uw_object_hdr_t *)nc)->doordir
|
- (nc[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)nc)->doordir
|
- (nc[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)nc)->doordir
|
- (*nc >> 13) & 0x1
+ ((uw_object_hdr_t *)nc)->doordir
|
- (*nc & 0x2000) >> 13
+ ((uw_object_hdr_t *)nc)->doordir
|
- (*(byte *)((char *)nc + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)nc)->doordir
|
- (*(byte *)((char *)nc + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)nc)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)nc)->invisible
|
- (*(ushort *)((char *)nc + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)nc)->invisible
|
- (((ushort *)nc)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)nc)->invisible
|
- (((ushort *)nc)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)nc)->invisible
|
- (*(ushort *)nc >> 14) & 0x1
+ ((uw_object_hdr_t *)nc)->invisible
|
- (*(ushort *)nc & 0x4000) >> 14
+ ((uw_object_hdr_t *)nc)->invisible
|
- (nc[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)nc)->invisible
|
- (nc[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)nc)->invisible
|
- (*nc >> 14) & 0x1
+ ((uw_object_hdr_t *)nc)->invisible
|
- (*nc & 0x4000) >> 14
+ ((uw_object_hdr_t *)nc)->invisible
|
- (*(byte *)((char *)nc + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)nc)->invisible
|
- (*(byte *)((char *)nc + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)nc)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (*(ushort *)((char *)nc + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- *(ushort *)((char *)nc + 0x0) >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (((ushort *)nc)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (((ushort *)nc)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- ((ushort *)nc)[0] >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (*(ushort *)nc >> 15) & 0x1
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (*(ushort *)nc & 0x8000) >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- *(ushort *)nc >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (nc[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (nc[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- nc[0] >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (*nc >> 15) & 0x1
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (*nc & 0x8000) >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- *nc >> 15
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (*(byte *)((char *)nc + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)nc)->is_quant
|
- (*(byte *)((char *)nc + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)nc)->is_quant
|
- *(byte *)((char *)nc + 0x1) >> 7
+ ((uw_object_hdr_t *)nc)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)nc)->zpos
|
- ((ushort *)nc)[1] & 0x7f
+ ((uw_object_hdr_t *)nc)->zpos
|
- nc[1] & 0x7f
+ ((uw_object_hdr_t *)nc)->zpos
|
- *(byte *)((char *)nc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)nc)->zpos
|
- (byte)nc[1] & 0x7f
+ ((uw_object_hdr_t *)nc)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)nc)->heading
|
- (*(ushort *)((char *)nc + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)nc)->heading
|
- (((ushort *)nc)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)nc)->heading
|
- (((ushort *)nc)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)nc)->heading
|
- (nc[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)nc)->heading
|
- (nc[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)nc)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)nc)->ypos
|
- (*(ushort *)((char *)nc + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)nc)->ypos
|
- (((ushort *)nc)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)nc)->ypos
|
- (((ushort *)nc)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)nc)->ypos
|
- (nc[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)nc)->ypos
|
- (nc[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)nc)->ypos
|
- (*(byte *)((char *)nc + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)nc)->ypos
|
- (*(byte *)((char *)nc + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)nc)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)nc)->xpos
|
- (*(ushort *)((char *)nc + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)nc)->xpos
|
- *(ushort *)((char *)nc + 0x2) >> 13
+ ((uw_object_hdr_t *)nc)->xpos
|
- (((ushort *)nc)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)nc)->xpos
|
- (((ushort *)nc)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)nc)->xpos
|
- ((ushort *)nc)[1] >> 13
+ ((uw_object_hdr_t *)nc)->xpos
|
- (nc[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)nc)->xpos
|
- (nc[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)nc)->xpos
|
- nc[1] >> 13
+ ((uw_object_hdr_t *)nc)->xpos
|
- (*(byte *)((char *)nc + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)nc)->xpos
|
- (*(byte *)((char *)nc + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)nc)->xpos
|
- *(byte *)((char *)nc + 0x3) >> 5
+ ((uw_object_hdr_t *)nc)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)nc)->quality
|
- ((ushort *)nc)[2] & 0x3f
+ ((uw_object_hdr_t *)nc)->quality
|
- nc[2] & 0x3f
+ ((uw_object_hdr_t *)nc)->quality
|
- *(byte *)((char *)nc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)nc)->quality
|
- (byte)nc[2] & 0x3f
+ ((uw_object_hdr_t *)nc)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nc)->next
|
- (*(ushort *)((char *)nc + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nc)->next
|
- *(ushort *)((char *)nc + 0x4) >> 6
+ ((uw_object_hdr_t *)nc)->next
|
- (((ushort *)nc)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nc)->next
|
- (((ushort *)nc)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nc)->next
|
- ((ushort *)nc)[2] >> 6
+ ((uw_object_hdr_t *)nc)->next
|
- (nc[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nc)->next
|
- (nc[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nc)->next
|
- nc[2] >> 6
+ ((uw_object_hdr_t *)nc)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)nc)->owner
|
- ((ushort *)nc)[3] & 0x3f
+ ((uw_object_hdr_t *)nc)->owner
|
- nc[3] & 0x3f
+ ((uw_object_hdr_t *)nc)->owner
|
- *(byte *)((char *)nc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)nc)->owner
|
- (byte)nc[3] & 0x3f
+ ((uw_object_hdr_t *)nc)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nc + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nc)->link
|
- (*(ushort *)((char *)nc + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nc)->link
|
- *(ushort *)((char *)nc + 0x6) >> 6
+ ((uw_object_hdr_t *)nc)->link
|
- (((ushort *)nc)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nc)->link
|
- (((ushort *)nc)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nc)->link
|
- ((ushort *)nc)[3] >> 6
+ ((uw_object_hdr_t *)nc)->link
|
- (nc[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nc)->link
|
- (nc[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nc)->link
|
- nc[3] >> 6
+ ((uw_object_hdr_t *)nc)->link
)
...>
}

@field_2_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
|
- *(byte *)((char *)obj + 0x1) >> 7
+ ((uw_object_hdr_t *)obj)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
|
- *(byte *)((char *)obj + 0x3) >> 5
+ ((uw_object_hdr_t *)obj)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@field_3_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)g_player_object)->item_id
|
- ((ushort *)g_player_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)g_player_object)->item_id
|
- *(ushort *)g_player_object & 0x1ff
+ ((uw_object_hdr_t *)g_player_object)->item_id
)
...>
}

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (((ushort *)g_player_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (((ushort *)g_player_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(ushort *)g_player_object >> 9) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(ushort *)g_player_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(byte *)((char *)g_player_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(byte *)((char *)g_player_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)g_player_object)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (((ushort *)g_player_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (((ushort *)g_player_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(ushort *)g_player_object >> 12) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(ushort *)g_player_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(byte *)((char *)g_player_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(byte *)((char *)g_player_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)g_player_object)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (((ushort *)g_player_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (((ushort *)g_player_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(ushort *)g_player_object >> 13) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(ushort *)g_player_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(byte *)((char *)g_player_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(byte *)((char *)g_player_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)g_player_object)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (((ushort *)g_player_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (((ushort *)g_player_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(ushort *)g_player_object >> 14) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(ushort *)g_player_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(byte *)((char *)g_player_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(byte *)((char *)g_player_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)g_player_object)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (((ushort *)g_player_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (((ushort *)g_player_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(ushort *)g_player_object >> 15) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(ushort *)g_player_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(byte *)((char *)g_player_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(byte *)((char *)g_player_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- *(byte *)((char *)g_player_object + 0x1) >> 7
+ ((uw_object_hdr_t *)g_player_object)->is_quant
)
...>
}

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)g_player_object)->zpos
|
- ((ushort *)g_player_object)[1] & 0x7f
+ ((uw_object_hdr_t *)g_player_object)->zpos
|
- *(byte *)((char *)g_player_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)g_player_object)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->heading
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)g_player_object)->heading
|
- (((ushort *)g_player_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->heading
|
- (((ushort *)g_player_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)g_player_object)->heading
)
...>
}

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (((ushort *)g_player_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (((ushort *)g_player_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (*(byte *)((char *)g_player_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (*(byte *)((char *)g_player_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)g_player_object)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (((ushort *)g_player_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (((ushort *)g_player_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (*(byte *)((char *)g_player_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (*(byte *)((char *)g_player_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- *(byte *)((char *)g_player_object + 0x3) >> 5
+ ((uw_object_hdr_t *)g_player_object)->xpos
)
...>
}

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->quality
|
- ((ushort *)g_player_object)[2] & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->quality
|
- *(byte *)((char *)g_player_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)g_player_object)->next
|
- (*(ushort *)((char *)g_player_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)g_player_object)->next
|
- (((ushort *)g_player_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)g_player_object)->next
|
- (((ushort *)g_player_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)g_player_object)->next
)
...>
}

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->owner
|
- ((ushort *)g_player_object)[3] & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->owner
|
- *(byte *)((char *)g_player_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)g_player_object)->link
|
- (*(ushort *)((char *)g_player_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)g_player_object)->link
|
- (((ushort *)g_player_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)g_player_object)->link
|
- (((ushort *)g_player_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)g_player_object)->link
)
...>
}

@field_4_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pl)->item_id
|
- ((ushort *)pl)[0] & 0x1ff
+ ((uw_object_hdr_t *)pl)->item_id
|
- *(ushort *)pl & 0x1ff
+ ((uw_object_hdr_t *)pl)->item_id
|
- pl[0] & 0x1ff
+ ((uw_object_hdr_t *)pl)->item_id
|
- *pl & 0x1ff
+ ((uw_object_hdr_t *)pl)->item_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (*(ushort *)((char *)pl + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (((ushort *)pl)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (((ushort *)pl)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (*(ushort *)pl >> 9) & 0x7
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (*(ushort *)pl & 0xe00) >> 9
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (pl[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (pl[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (*pl >> 9) & 0x7
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (*pl & 0xe00) >> 9
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (*(byte *)((char *)pl + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pl)->flags_res
|
- (*(byte *)((char *)pl + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pl)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (*(ushort *)((char *)pl + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (((ushort *)pl)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (((ushort *)pl)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (*(ushort *)pl >> 12) & 0x1
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (*(ushort *)pl & 0x1000) >> 12
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (pl[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (pl[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (*pl >> 12) & 0x1
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (*pl & 0x1000) >> 12
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (*(byte *)((char *)pl + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pl)->enchanted
|
- (*(byte *)((char *)pl + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pl)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pl)->doordir
|
- (*(ushort *)((char *)pl + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pl)->doordir
|
- (((ushort *)pl)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pl)->doordir
|
- (((ushort *)pl)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pl)->doordir
|
- (*(ushort *)pl >> 13) & 0x1
+ ((uw_object_hdr_t *)pl)->doordir
|
- (*(ushort *)pl & 0x2000) >> 13
+ ((uw_object_hdr_t *)pl)->doordir
|
- (pl[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pl)->doordir
|
- (pl[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pl)->doordir
|
- (*pl >> 13) & 0x1
+ ((uw_object_hdr_t *)pl)->doordir
|
- (*pl & 0x2000) >> 13
+ ((uw_object_hdr_t *)pl)->doordir
|
- (*(byte *)((char *)pl + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pl)->doordir
|
- (*(byte *)((char *)pl + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pl)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pl)->invisible
|
- (*(ushort *)((char *)pl + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pl)->invisible
|
- (((ushort *)pl)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pl)->invisible
|
- (((ushort *)pl)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pl)->invisible
|
- (*(ushort *)pl >> 14) & 0x1
+ ((uw_object_hdr_t *)pl)->invisible
|
- (*(ushort *)pl & 0x4000) >> 14
+ ((uw_object_hdr_t *)pl)->invisible
|
- (pl[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pl)->invisible
|
- (pl[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pl)->invisible
|
- (*pl >> 14) & 0x1
+ ((uw_object_hdr_t *)pl)->invisible
|
- (*pl & 0x4000) >> 14
+ ((uw_object_hdr_t *)pl)->invisible
|
- (*(byte *)((char *)pl + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pl)->invisible
|
- (*(byte *)((char *)pl + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pl)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (*(ushort *)((char *)pl + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- *(ushort *)((char *)pl + 0x0) >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (((ushort *)pl)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (((ushort *)pl)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- ((ushort *)pl)[0] >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (*(ushort *)pl >> 15) & 0x1
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (*(ushort *)pl & 0x8000) >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- *(ushort *)pl >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (pl[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (pl[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- pl[0] >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (*pl >> 15) & 0x1
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (*pl & 0x8000) >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- *pl >> 15
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (*(byte *)((char *)pl + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pl)->is_quant
|
- (*(byte *)((char *)pl + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pl)->is_quant
|
- *(byte *)((char *)pl + 0x1) >> 7
+ ((uw_object_hdr_t *)pl)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pl)->zpos
|
- ((ushort *)pl)[1] & 0x7f
+ ((uw_object_hdr_t *)pl)->zpos
|
- pl[1] & 0x7f
+ ((uw_object_hdr_t *)pl)->zpos
|
- *(byte *)((char *)pl + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pl)->zpos
|
- (byte)pl[1] & 0x7f
+ ((uw_object_hdr_t *)pl)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pl)->heading
|
- (*(ushort *)((char *)pl + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pl)->heading
|
- (((ushort *)pl)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pl)->heading
|
- (((ushort *)pl)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pl)->heading
|
- (pl[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pl)->heading
|
- (pl[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pl)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pl)->ypos
|
- (*(ushort *)((char *)pl + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pl)->ypos
|
- (((ushort *)pl)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pl)->ypos
|
- (((ushort *)pl)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pl)->ypos
|
- (pl[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pl)->ypos
|
- (pl[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pl)->ypos
|
- (*(byte *)((char *)pl + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pl)->ypos
|
- (*(byte *)((char *)pl + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pl)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pl)->xpos
|
- (*(ushort *)((char *)pl + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pl)->xpos
|
- *(ushort *)((char *)pl + 0x2) >> 13
+ ((uw_object_hdr_t *)pl)->xpos
|
- (((ushort *)pl)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pl)->xpos
|
- (((ushort *)pl)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pl)->xpos
|
- ((ushort *)pl)[1] >> 13
+ ((uw_object_hdr_t *)pl)->xpos
|
- (pl[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pl)->xpos
|
- (pl[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pl)->xpos
|
- pl[1] >> 13
+ ((uw_object_hdr_t *)pl)->xpos
|
- (*(byte *)((char *)pl + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pl)->xpos
|
- (*(byte *)((char *)pl + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pl)->xpos
|
- *(byte *)((char *)pl + 0x3) >> 5
+ ((uw_object_hdr_t *)pl)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pl)->quality
|
- ((ushort *)pl)[2] & 0x3f
+ ((uw_object_hdr_t *)pl)->quality
|
- pl[2] & 0x3f
+ ((uw_object_hdr_t *)pl)->quality
|
- *(byte *)((char *)pl + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pl)->quality
|
- (byte)pl[2] & 0x3f
+ ((uw_object_hdr_t *)pl)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pl)->next
|
- (*(ushort *)((char *)pl + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pl)->next
|
- *(ushort *)((char *)pl + 0x4) >> 6
+ ((uw_object_hdr_t *)pl)->next
|
- (((ushort *)pl)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pl)->next
|
- (((ushort *)pl)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pl)->next
|
- ((ushort *)pl)[2] >> 6
+ ((uw_object_hdr_t *)pl)->next
|
- (pl[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pl)->next
|
- (pl[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pl)->next
|
- pl[2] >> 6
+ ((uw_object_hdr_t *)pl)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pl)->owner
|
- ((ushort *)pl)[3] & 0x3f
+ ((uw_object_hdr_t *)pl)->owner
|
- pl[3] & 0x3f
+ ((uw_object_hdr_t *)pl)->owner
|
- *(byte *)((char *)pl + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pl)->owner
|
- (byte)pl[3] & 0x3f
+ ((uw_object_hdr_t *)pl)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pl + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pl)->link
|
- (*(ushort *)((char *)pl + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pl)->link
|
- *(ushort *)((char *)pl + 0x6) >> 6
+ ((uw_object_hdr_t *)pl)->link
|
- (((ushort *)pl)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pl)->link
|
- (((ushort *)pl)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pl)->link
|
- ((ushort *)pl)[3] >> 6
+ ((uw_object_hdr_t *)pl)->link
|
- (pl[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pl)->link
|
- (pl[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pl)->link
|
- pl[3] >> 6
+ ((uw_object_hdr_t *)pl)->link
)
...>
}

@field_5_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- *(ushort *)(obj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)obj)->item_id
)
...>
}

@field_5_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (*(ushort *)(obj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(ushort *)(obj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(byte *)((char *)obj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(byte *)((char *)obj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(byte *)(obj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)obj)->flags_res
|
- (*(byte *)(obj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)obj)->flags_res
)
...>
}

@field_5_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (*(ushort *)(obj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(ushort *)(obj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(byte *)((char *)obj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(byte *)((char *)obj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(byte *)(obj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)obj)->enchanted
|
- (*(byte *)(obj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)obj)->enchanted
)
...>
}

@field_5_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (*(ushort *)(obj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(ushort *)(obj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(byte *)((char *)obj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(byte *)((char *)obj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(byte *)(obj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)obj)->doordir
|
- (*(byte *)(obj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)obj)->doordir
)
...>
}

@field_5_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (*(ushort *)(obj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(ushort *)(obj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(byte *)((char *)obj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(byte *)((char *)obj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(byte *)(obj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)obj)->invisible
|
- (*(byte *)(obj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)obj)->invisible
)
...>
}

@field_5_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (((ushort *)obj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (((ushort *)obj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(ushort *)obj >> 15) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(ushort *)obj & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(ushort *)(obj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(ushort *)(obj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(byte *)((char *)obj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(byte *)((char *)obj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)obj)->is_quant
|
- *(byte *)((char *)obj + 0x1) >> 7
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(byte *)(obj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)obj)->is_quant
|
- (*(byte *)(obj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)obj)->is_quant
|
- *(byte *)(obj + 0x1) >> 7
+ ((uw_object_hdr_t *)obj)->is_quant
)
...>
}

@field_5_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- *(ushort *)(obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj)->zpos
|
- *(byte *)((char *)obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj)->zpos
|
- *(byte *)(obj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj)->zpos
)
...>
}

@field_5_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (*(ushort *)(obj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)obj)->heading
|
- (*(ushort *)(obj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)obj)->heading
)
...>
}

@field_5_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (*(ushort *)(obj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)obj)->ypos
|
- (*(ushort *)(obj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)obj)->ypos
|
- (*(byte *)((char *)obj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)obj)->ypos
|
- (*(byte *)((char *)obj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)obj)->ypos
|
- (*(byte *)(obj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)obj)->ypos
|
- (*(byte *)(obj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)obj)->ypos
)
...>
}

@field_5_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (((ushort *)obj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)obj)->xpos
|
- (((ushort *)obj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(ushort *)(obj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(ushort *)(obj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(byte *)((char *)obj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(byte *)((char *)obj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)obj)->xpos
|
- *(byte *)((char *)obj + 0x3) >> 5
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(byte *)(obj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)obj)->xpos
|
- (*(byte *)(obj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)obj)->xpos
|
- *(byte *)(obj + 0x3) >> 5
+ ((uw_object_hdr_t *)obj)->xpos
)
...>
}

@field_5_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- *(ushort *)(obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj)->quality
|
- *(byte *)((char *)obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj)->quality
|
- *(byte *)(obj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj)->quality
)
...>
}

@field_5_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (((ushort *)obj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->next
|
- (((ushort *)obj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->next
|
- (*(ushort *)(obj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->next
|
- (*(ushort *)(obj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->next
)
...>
}

@field_5_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- *(ushort *)(obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj)->owner
|
- *(byte *)((char *)obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj)->owner
|
- *(byte *)(obj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj)->owner
)
...>
}

@field_5_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
- (((ushort *)obj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->link
|
- (((ushort *)obj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->link
|
- (*(ushort *)(obj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj)->link
|
- (*(ushort *)(obj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj)->link
)
...>
}

@field_6_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)contents)->item_id
|
- ((ushort *)contents)[0] & 0x1ff
+ ((uw_object_hdr_t *)contents)->item_id
|
- *(ushort *)contents & 0x1ff
+ ((uw_object_hdr_t *)contents)->item_id
|
- *(ushort *)(contents + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)contents)->item_id
)
...>
}

@field_6_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)((char *)contents + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (((ushort *)contents)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (((ushort *)contents)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)contents >> 9) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)contents & 0xe00) >> 9
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)(contents + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)(contents + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(byte *)((char *)contents + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(byte *)((char *)contents + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(byte *)(contents + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(byte *)(contents + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)contents)->flags_res
)
...>
}

@field_6_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)((char *)contents + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (((ushort *)contents)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (((ushort *)contents)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)contents >> 12) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)contents & 0x1000) >> 12
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)(contents + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)(contents + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(byte *)((char *)contents + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(byte *)((char *)contents + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(byte *)(contents + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(byte *)(contents + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)contents)->enchanted
)
...>
}

@field_6_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)((char *)contents + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)contents)->doordir
|
- (((ushort *)contents)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (((ushort *)contents)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)contents >> 13) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)contents & 0x2000) >> 13
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)(contents + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)(contents + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(byte *)((char *)contents + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(byte *)((char *)contents + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(byte *)(contents + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(byte *)(contents + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)contents)->doordir
)
...>
}

@field_6_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)((char *)contents + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)contents)->invisible
|
- (((ushort *)contents)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (((ushort *)contents)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)contents >> 14) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)contents & 0x4000) >> 14
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)(contents + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)(contents + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(byte *)((char *)contents + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(byte *)((char *)contents + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(byte *)(contents + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(byte *)(contents + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)contents)->invisible
)
...>
}

@field_6_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)((char *)contents + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (((ushort *)contents)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (((ushort *)contents)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)contents >> 15) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)contents & 0x8000) >> 15
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)(contents + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)(contents + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(byte *)((char *)contents + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(byte *)((char *)contents + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)contents)->is_quant
|
- *(byte *)((char *)contents + 0x1) >> 7
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(byte *)(contents + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(byte *)(contents + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)contents)->is_quant
|
- *(byte *)(contents + 0x1) >> 7
+ ((uw_object_hdr_t *)contents)->is_quant
)
...>
}

@field_6_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
|
- ((ushort *)contents)[1] & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
|
- *(ushort *)(contents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
|
- *(byte *)((char *)contents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
|
- *(byte *)(contents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
)
...>
}

@field_6_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)contents)->heading
|
- (*(ushort *)((char *)contents + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)contents)->heading
|
- (((ushort *)contents)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)contents)->heading
|
- (((ushort *)contents)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)contents)->heading
|
- (*(ushort *)(contents + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)contents)->heading
|
- (*(ushort *)(contents + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)contents)->heading
)
...>
}

@field_6_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(ushort *)((char *)contents + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)contents)->ypos
|
- (((ushort *)contents)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (((ushort *)contents)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(ushort *)(contents + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(ushort *)(contents + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(byte *)((char *)contents + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(byte *)((char *)contents + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(byte *)(contents + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(byte *)(contents + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)contents)->ypos
)
...>
}

@field_6_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(ushort *)((char *)contents + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)contents)->xpos
|
- (((ushort *)contents)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (((ushort *)contents)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(ushort *)(contents + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(ushort *)(contents + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(byte *)((char *)contents + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(byte *)((char *)contents + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)contents)->xpos
|
- *(byte *)((char *)contents + 0x3) >> 5
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(byte *)(contents + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(byte *)(contents + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)contents)->xpos
|
- *(byte *)(contents + 0x3) >> 5
+ ((uw_object_hdr_t *)contents)->xpos
)
...>
}

@field_6_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
|
- ((ushort *)contents)[2] & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
|
- *(ushort *)(contents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
|
- *(byte *)((char *)contents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
|
- *(byte *)(contents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
)
...>
}

@field_6_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->next
|
- (*(ushort *)((char *)contents + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->next
|
- (((ushort *)contents)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->next
|
- (((ushort *)contents)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->next
|
- (*(ushort *)(contents + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->next
|
- (*(ushort *)(contents + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->next
)
...>
}

@field_6_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
|
- ((ushort *)contents)[3] & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
|
- *(ushort *)(contents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
|
- *(byte *)((char *)contents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
|
- *(byte *)(contents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
)
...>
}

@field_6_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->link
|
- (*(ushort *)((char *)contents + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->link
|
- (((ushort *)contents)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->link
|
- (((ushort *)contents)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->link
|
- (*(ushort *)(contents + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->link
|
- (*(ushort *)(contents + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->link
)
...>
}

@field_7_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)nx)->item_id
|
- ((ushort *)nx)[0] & 0x1ff
+ ((uw_object_hdr_t *)nx)->item_id
|
- *(ushort *)nx & 0x1ff
+ ((uw_object_hdr_t *)nx)->item_id
|
- *(ushort *)(nx + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)nx)->item_id
)
...>
}

@field_7_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(ushort *)((char *)nx + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (((ushort *)nx)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (((ushort *)nx)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(ushort *)nx >> 9) & 0x7
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(ushort *)nx & 0xe00) >> 9
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(ushort *)(nx + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(ushort *)(nx + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(byte *)((char *)nx + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(byte *)((char *)nx + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(byte *)(nx + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)nx)->flags_res
|
- (*(byte *)(nx + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)nx)->flags_res
)
...>
}

@field_7_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(ushort *)((char *)nx + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (((ushort *)nx)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (((ushort *)nx)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(ushort *)nx >> 12) & 0x1
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(ushort *)nx & 0x1000) >> 12
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(ushort *)(nx + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(ushort *)(nx + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(byte *)((char *)nx + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(byte *)((char *)nx + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(byte *)(nx + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)nx)->enchanted
|
- (*(byte *)(nx + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)nx)->enchanted
)
...>
}

@field_7_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(ushort *)((char *)nx + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)nx)->doordir
|
- (((ushort *)nx)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)nx)->doordir
|
- (((ushort *)nx)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(ushort *)nx >> 13) & 0x1
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(ushort *)nx & 0x2000) >> 13
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(ushort *)(nx + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(ushort *)(nx + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(byte *)((char *)nx + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(byte *)((char *)nx + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(byte *)(nx + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)nx)->doordir
|
- (*(byte *)(nx + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)nx)->doordir
)
...>
}

@field_7_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(ushort *)((char *)nx + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)nx)->invisible
|
- (((ushort *)nx)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)nx)->invisible
|
- (((ushort *)nx)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(ushort *)nx >> 14) & 0x1
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(ushort *)nx & 0x4000) >> 14
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(ushort *)(nx + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(ushort *)(nx + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(byte *)((char *)nx + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(byte *)((char *)nx + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(byte *)(nx + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)nx)->invisible
|
- (*(byte *)(nx + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)nx)->invisible
)
...>
}

@field_7_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(ushort *)((char *)nx + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (((ushort *)nx)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (((ushort *)nx)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(ushort *)nx >> 15) & 0x1
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(ushort *)nx & 0x8000) >> 15
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(ushort *)(nx + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(ushort *)(nx + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(byte *)((char *)nx + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(byte *)((char *)nx + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)nx)->is_quant
|
- *(byte *)((char *)nx + 0x1) >> 7
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(byte *)(nx + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)nx)->is_quant
|
- (*(byte *)(nx + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)nx)->is_quant
|
- *(byte *)(nx + 0x1) >> 7
+ ((uw_object_hdr_t *)nx)->is_quant
)
...>
}

@field_7_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0x2) & 0x7f
+ ((uw_object_hdr_t *)nx)->zpos
|
- ((ushort *)nx)[1] & 0x7f
+ ((uw_object_hdr_t *)nx)->zpos
|
- *(ushort *)(nx + 0x2) & 0x7f
+ ((uw_object_hdr_t *)nx)->zpos
|
- *(byte *)((char *)nx + 0x2) & 0x7f
+ ((uw_object_hdr_t *)nx)->zpos
|
- *(byte *)(nx + 0x2) & 0x7f
+ ((uw_object_hdr_t *)nx)->zpos
)
...>
}

@field_7_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)nx)->heading
|
- (*(ushort *)((char *)nx + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)nx)->heading
|
- (((ushort *)nx)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)nx)->heading
|
- (((ushort *)nx)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)nx)->heading
|
- (*(ushort *)(nx + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)nx)->heading
|
- (*(ushort *)(nx + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)nx)->heading
)
...>
}

@field_7_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)nx)->ypos
|
- (*(ushort *)((char *)nx + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)nx)->ypos
|
- (((ushort *)nx)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)nx)->ypos
|
- (((ushort *)nx)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)nx)->ypos
|
- (*(ushort *)(nx + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)nx)->ypos
|
- (*(ushort *)(nx + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)nx)->ypos
|
- (*(byte *)((char *)nx + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)nx)->ypos
|
- (*(byte *)((char *)nx + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)nx)->ypos
|
- (*(byte *)(nx + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)nx)->ypos
|
- (*(byte *)(nx + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)nx)->ypos
)
...>
}

@field_7_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)nx)->xpos
|
- (*(ushort *)((char *)nx + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)nx)->xpos
|
- (((ushort *)nx)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)nx)->xpos
|
- (((ushort *)nx)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)nx)->xpos
|
- (*(ushort *)(nx + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)nx)->xpos
|
- (*(ushort *)(nx + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)nx)->xpos
|
- (*(byte *)((char *)nx + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)nx)->xpos
|
- (*(byte *)((char *)nx + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)nx)->xpos
|
- *(byte *)((char *)nx + 0x3) >> 5
+ ((uw_object_hdr_t *)nx)->xpos
|
- (*(byte *)(nx + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)nx)->xpos
|
- (*(byte *)(nx + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)nx)->xpos
|
- *(byte *)(nx + 0x3) >> 5
+ ((uw_object_hdr_t *)nx)->xpos
)
...>
}

@field_7_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0x4) & 0x3f
+ ((uw_object_hdr_t *)nx)->quality
|
- ((ushort *)nx)[2] & 0x3f
+ ((uw_object_hdr_t *)nx)->quality
|
- *(ushort *)(nx + 0x4) & 0x3f
+ ((uw_object_hdr_t *)nx)->quality
|
- *(byte *)((char *)nx + 0x4) & 0x3f
+ ((uw_object_hdr_t *)nx)->quality
|
- *(byte *)(nx + 0x4) & 0x3f
+ ((uw_object_hdr_t *)nx)->quality
)
...>
}

@field_7_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nx)->next
|
- (*(ushort *)((char *)nx + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nx)->next
|
- (((ushort *)nx)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nx)->next
|
- (((ushort *)nx)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nx)->next
|
- (*(ushort *)(nx + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nx)->next
|
- (*(ushort *)(nx + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nx)->next
)
...>
}

@field_7_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0x6) & 0x3f
+ ((uw_object_hdr_t *)nx)->owner
|
- ((ushort *)nx)[3] & 0x3f
+ ((uw_object_hdr_t *)nx)->owner
|
- *(ushort *)(nx + 0x6) & 0x3f
+ ((uw_object_hdr_t *)nx)->owner
|
- *(byte *)((char *)nx + 0x6) & 0x3f
+ ((uw_object_hdr_t *)nx)->owner
|
- *(byte *)(nx + 0x6) & 0x3f
+ ((uw_object_hdr_t *)nx)->owner
)
...>
}

@field_7_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)nx + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nx)->link
|
- (*(ushort *)((char *)nx + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nx)->link
|
- (((ushort *)nx)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nx)->link
|
- (((ushort *)nx)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nx)->link
|
- (*(ushort *)(nx + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)nx)->link
|
- (*(ushort *)(nx + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)nx)->link
)
...>
}
