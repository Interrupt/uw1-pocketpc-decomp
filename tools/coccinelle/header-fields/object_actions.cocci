@field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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
|
- *(byte *)((char *)object + 0x1) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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
|
- *(byte *)((char *)object + 0x3) >> 5
+ ((uw_object_hdr_t *)object)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@field_1_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)reference)->item_id
|
- ((ushort *)reference)[0] & 0x1ff
+ ((uw_object_hdr_t *)reference)->item_id
|
- *(ushort *)reference & 0x1ff
+ ((uw_object_hdr_t *)reference)->item_id
|
- reference[0] & 0x1ff
+ ((uw_object_hdr_t *)reference)->item_id
|
- *reference & 0x1ff
+ ((uw_object_hdr_t *)reference)->item_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (*(ushort *)((char *)reference + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (((ushort *)reference)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (((ushort *)reference)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (*(ushort *)reference >> 9) & 0x7
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (*(ushort *)reference & 0xe00) >> 9
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (reference[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (reference[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (*reference >> 9) & 0x7
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (*reference & 0xe00) >> 9
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (*(byte *)((char *)reference + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)reference)->flags_res
|
- (*(byte *)((char *)reference + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)reference)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (*(ushort *)((char *)reference + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (((ushort *)reference)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (((ushort *)reference)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (*(ushort *)reference >> 12) & 0x1
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (*(ushort *)reference & 0x1000) >> 12
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (reference[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (reference[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (*reference >> 12) & 0x1
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (*reference & 0x1000) >> 12
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (*(byte *)((char *)reference + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)reference)->enchanted
|
- (*(byte *)((char *)reference + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)reference)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)reference)->doordir
|
- (*(ushort *)((char *)reference + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)reference)->doordir
|
- (((ushort *)reference)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)reference)->doordir
|
- (((ushort *)reference)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)reference)->doordir
|
- (*(ushort *)reference >> 13) & 0x1
+ ((uw_object_hdr_t *)reference)->doordir
|
- (*(ushort *)reference & 0x2000) >> 13
+ ((uw_object_hdr_t *)reference)->doordir
|
- (reference[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)reference)->doordir
|
- (reference[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)reference)->doordir
|
- (*reference >> 13) & 0x1
+ ((uw_object_hdr_t *)reference)->doordir
|
- (*reference & 0x2000) >> 13
+ ((uw_object_hdr_t *)reference)->doordir
|
- (*(byte *)((char *)reference + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)reference)->doordir
|
- (*(byte *)((char *)reference + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)reference)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)reference)->invisible
|
- (*(ushort *)((char *)reference + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)reference)->invisible
|
- (((ushort *)reference)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)reference)->invisible
|
- (((ushort *)reference)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)reference)->invisible
|
- (*(ushort *)reference >> 14) & 0x1
+ ((uw_object_hdr_t *)reference)->invisible
|
- (*(ushort *)reference & 0x4000) >> 14
+ ((uw_object_hdr_t *)reference)->invisible
|
- (reference[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)reference)->invisible
|
- (reference[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)reference)->invisible
|
- (*reference >> 14) & 0x1
+ ((uw_object_hdr_t *)reference)->invisible
|
- (*reference & 0x4000) >> 14
+ ((uw_object_hdr_t *)reference)->invisible
|
- (*(byte *)((char *)reference + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)reference)->invisible
|
- (*(byte *)((char *)reference + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)reference)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (*(ushort *)((char *)reference + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- *(ushort *)((char *)reference + 0x0) >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (((ushort *)reference)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (((ushort *)reference)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- ((ushort *)reference)[0] >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (*(ushort *)reference >> 15) & 0x1
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (*(ushort *)reference & 0x8000) >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- *(ushort *)reference >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (reference[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (reference[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- reference[0] >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (*reference >> 15) & 0x1
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (*reference & 0x8000) >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- *reference >> 15
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (*(byte *)((char *)reference + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)reference)->is_quant
|
- (*(byte *)((char *)reference + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)reference)->is_quant
|
- *(byte *)((char *)reference + 0x1) >> 7
+ ((uw_object_hdr_t *)reference)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0x2) & 0x7f
+ ((uw_object_hdr_t *)reference)->zpos
|
- ((ushort *)reference)[1] & 0x7f
+ ((uw_object_hdr_t *)reference)->zpos
|
- reference[1] & 0x7f
+ ((uw_object_hdr_t *)reference)->zpos
|
- *(byte *)((char *)reference + 0x2) & 0x7f
+ ((uw_object_hdr_t *)reference)->zpos
|
- (byte)reference[1] & 0x7f
+ ((uw_object_hdr_t *)reference)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)reference)->heading
|
- (*(ushort *)((char *)reference + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)reference)->heading
|
- (((ushort *)reference)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)reference)->heading
|
- (((ushort *)reference)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)reference)->heading
|
- (reference[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)reference)->heading
|
- (reference[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)reference)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)reference)->ypos
|
- (*(ushort *)((char *)reference + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)reference)->ypos
|
- (((ushort *)reference)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)reference)->ypos
|
- (((ushort *)reference)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)reference)->ypos
|
- (reference[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)reference)->ypos
|
- (reference[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)reference)->ypos
|
- (*(byte *)((char *)reference + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)reference)->ypos
|
- (*(byte *)((char *)reference + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)reference)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)reference)->xpos
|
- (*(ushort *)((char *)reference + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)reference)->xpos
|
- *(ushort *)((char *)reference + 0x2) >> 13
+ ((uw_object_hdr_t *)reference)->xpos
|
- (((ushort *)reference)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)reference)->xpos
|
- (((ushort *)reference)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)reference)->xpos
|
- ((ushort *)reference)[1] >> 13
+ ((uw_object_hdr_t *)reference)->xpos
|
- (reference[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)reference)->xpos
|
- (reference[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)reference)->xpos
|
- reference[1] >> 13
+ ((uw_object_hdr_t *)reference)->xpos
|
- (*(byte *)((char *)reference + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)reference)->xpos
|
- (*(byte *)((char *)reference + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)reference)->xpos
|
- *(byte *)((char *)reference + 0x3) >> 5
+ ((uw_object_hdr_t *)reference)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0x4) & 0x3f
+ ((uw_object_hdr_t *)reference)->quality
|
- ((ushort *)reference)[2] & 0x3f
+ ((uw_object_hdr_t *)reference)->quality
|
- reference[2] & 0x3f
+ ((uw_object_hdr_t *)reference)->quality
|
- *(byte *)((char *)reference + 0x4) & 0x3f
+ ((uw_object_hdr_t *)reference)->quality
|
- (byte)reference[2] & 0x3f
+ ((uw_object_hdr_t *)reference)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)reference)->next
|
- (*(ushort *)((char *)reference + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)reference)->next
|
- *(ushort *)((char *)reference + 0x4) >> 6
+ ((uw_object_hdr_t *)reference)->next
|
- (((ushort *)reference)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)reference)->next
|
- (((ushort *)reference)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)reference)->next
|
- ((ushort *)reference)[2] >> 6
+ ((uw_object_hdr_t *)reference)->next
|
- (reference[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)reference)->next
|
- (reference[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)reference)->next
|
- reference[2] >> 6
+ ((uw_object_hdr_t *)reference)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0x6) & 0x3f
+ ((uw_object_hdr_t *)reference)->owner
|
- ((ushort *)reference)[3] & 0x3f
+ ((uw_object_hdr_t *)reference)->owner
|
- reference[3] & 0x3f
+ ((uw_object_hdr_t *)reference)->owner
|
- *(byte *)((char *)reference + 0x6) & 0x3f
+ ((uw_object_hdr_t *)reference)->owner
|
- (byte)reference[3] & 0x3f
+ ((uw_object_hdr_t *)reference)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)reference + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)reference)->link
|
- (*(ushort *)((char *)reference + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)reference)->link
|
- *(ushort *)((char *)reference + 0x6) >> 6
+ ((uw_object_hdr_t *)reference)->link
|
- (((ushort *)reference)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)reference)->link
|
- (((ushort *)reference)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)reference)->link
|
- ((ushort *)reference)[3] >> 6
+ ((uw_object_hdr_t *)reference)->link
|
- (reference[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)reference)->link
|
- (reference[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)reference)->link
|
- reference[3] >> 6
+ ((uw_object_hdr_t *)reference)->link
)
...>
}

@field_2_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@field_3_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- ((ushort *)iVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- *(ushort *)iVar4 & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- *(ushort *)(iVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- CONCAT11(iVar4[1], *iVar4) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- CONCAT11(iVar4[1], iVar4[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
)
...>
}

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (((ushort *)iVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (((ushort *)iVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)iVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)iVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)(iVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)(iVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], *iVar4) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], *iVar4) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)(iVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)(iVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar4)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (((ushort *)iVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (((ushort *)iVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)iVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)iVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)(iVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)(iVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], *iVar4) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], *iVar4) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)(iVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)(iVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar4)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (((ushort *)iVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (((ushort *)iVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)iVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)iVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)(iVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)(iVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], *iVar4) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], *iVar4) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)(iVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)(iVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar4)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (((ushort *)iVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (((ushort *)iVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)iVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)iVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)(iVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)(iVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], *iVar4) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], *iVar4) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)(iVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)(iVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar4)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)(iVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)(iVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], *iVar4) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], *iVar4) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)((char *)iVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *(byte *)((char *)iVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)(iVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)(iVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *(byte *)(iVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
)
...>
}

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- ((ushort *)iVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(ushort *)(iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(byte *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- iVar4[2] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(byte *)(iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (((ushort *)iVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (((ushort *)iVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)(iVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)(iVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
)
...>
}

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (((ushort *)iVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (((ushort *)iVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)(iVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)(iVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)(iVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)(iVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar4)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)(iVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)(iVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- *(byte *)((char *)iVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)(iVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)(iVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- *(byte *)(iVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
)
...>
}

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- ((ushort *)iVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(ushort *)(iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(byte *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- iVar4[4] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(byte *)(iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)((char *)iVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)(iVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)(iVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
)
...>
}

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- ((ushort *)iVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(ushort *)(iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(byte *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- iVar4[6] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(byte *)(iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)((char *)iVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)(iVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)(iVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
)
...>
}

@field_4_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->item_id
|
- ((ushort *)iVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->item_id
|
- *(ushort *)iVar2 & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->item_id
|
- iVar2[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->item_id
|
- *iVar2 & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->item_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- (iVar2[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (iVar2[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*iVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*iVar2 & 0xe00) >> 9
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

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- (iVar2[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (iVar2[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*iVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*iVar2 & 0x1000) >> 12
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

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- (iVar2[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (iVar2[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*iVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*iVar2 & 0x2000) >> 13
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

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- (iVar2[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (iVar2[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*iVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*iVar2 & 0x4000) >> 14
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

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(ushort *)((char *)iVar2 + 0x0) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (((ushort *)iVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (((ushort *)iVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- ((ushort *)iVar2)[0] >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)iVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)iVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- *(ushort *)iVar2 >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (iVar2[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (iVar2[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- iVar2[0] >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*iVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*iVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- *iVar2 >> 15
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

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- iVar2[1] & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- *(byte *)((char *)iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- (byte)iVar2[1] & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- (iVar2[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (iVar2[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- (iVar2[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (iVar2[1] & 0x1c00) >> 10
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

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(ushort *)((char *)iVar2 + 0x2) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (((ushort *)iVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (((ushort *)iVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- ((ushort *)iVar2)[1] >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (iVar2[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (iVar2[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- iVar2[1] >> 13
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

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- iVar2[2] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- *(byte *)((char *)iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- (byte)iVar2[2] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(ushort *)((char *)iVar2 + 0x4) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
|
- (((ushort *)iVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (((ushort *)iVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
|
- ((ushort *)iVar2)[2] >> 6
+ ((uw_object_hdr_t *)iVar2)->next
|
- (iVar2[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (iVar2[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
|
- iVar2[2] >> 6
+ ((uw_object_hdr_t *)iVar2)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- iVar2[3] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- *(byte *)((char *)iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- (byte)iVar2[3] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(ushort *)((char *)iVar2 + 0x6) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
|
- (((ushort *)iVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (((ushort *)iVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
|
- ((ushort *)iVar2)[3] >> 6
+ ((uw_object_hdr_t *)iVar2)->link
|
- (iVar2[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (iVar2[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
|
- iVar2[3] >> 6
+ ((uw_object_hdr_t *)iVar2)->link
)
...>
}

@field_5_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar2)->item_id
|
- ((ushort *)uVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar2)->item_id
|
- *(ushort *)uVar2 & 0x1ff
+ ((uw_object_hdr_t *)uVar2)->item_id
|
- *(ushort *)(uVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar2)->item_id
)
...>
}

@field_5_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(ushort *)((char *)uVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (((ushort *)uVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (((ushort *)uVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(ushort *)uVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(ushort *)uVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(ushort *)(uVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(ushort *)(uVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(byte *)((char *)uVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(byte *)((char *)uVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(byte *)(uVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar2)->flags_res
|
- (*(byte *)(uVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar2)->flags_res
)
...>
}

@field_5_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(ushort *)((char *)uVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (((ushort *)uVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (((ushort *)uVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(ushort *)uVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(ushort *)uVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(ushort *)(uVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(ushort *)(uVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(byte *)((char *)uVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(byte *)((char *)uVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(byte *)(uVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar2)->enchanted
|
- (*(byte *)(uVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar2)->enchanted
)
...>
}

@field_5_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(ushort *)((char *)uVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (((ushort *)uVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (((ushort *)uVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(ushort *)uVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(ushort *)uVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(ushort *)(uVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(ushort *)(uVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(byte *)((char *)uVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(byte *)((char *)uVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(byte *)(uVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar2)->doordir
|
- (*(byte *)(uVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar2)->doordir
)
...>
}

@field_5_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(ushort *)((char *)uVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (((ushort *)uVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (((ushort *)uVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(ushort *)uVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(ushort *)uVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(ushort *)(uVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(ushort *)(uVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(byte *)((char *)uVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(byte *)((char *)uVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(byte *)(uVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar2)->invisible
|
- (*(byte *)(uVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar2)->invisible
)
...>
}

@field_5_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(ushort *)((char *)uVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (((ushort *)uVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (((ushort *)uVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(ushort *)uVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(ushort *)uVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(ushort *)(uVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(ushort *)(uVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(byte *)((char *)uVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(byte *)((char *)uVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- *(byte *)((char *)uVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(byte *)(uVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- (*(byte *)(uVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar2)->is_quant
|
- *(byte *)(uVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar2)->is_quant
)
...>
}

@field_5_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar2)->zpos
|
- ((ushort *)uVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar2)->zpos
|
- *(ushort *)(uVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar2)->zpos
|
- *(byte *)((char *)uVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar2)->zpos
|
- *(byte *)(uVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar2)->zpos
)
...>
}

@field_5_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar2)->heading
|
- (*(ushort *)((char *)uVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar2)->heading
|
- (((ushort *)uVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar2)->heading
|
- (((ushort *)uVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar2)->heading
|
- (*(ushort *)(uVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar2)->heading
|
- (*(ushort *)(uVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar2)->heading
)
...>
}

@field_5_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (*(ushort *)((char *)uVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (((ushort *)uVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (((ushort *)uVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (*(ushort *)(uVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (*(ushort *)(uVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (*(byte *)((char *)uVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (*(byte *)((char *)uVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (*(byte *)(uVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar2)->ypos
|
- (*(byte *)(uVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar2)->ypos
)
...>
}

@field_5_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (*(ushort *)((char *)uVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (((ushort *)uVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (((ushort *)uVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (*(ushort *)(uVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (*(ushort *)(uVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (*(byte *)((char *)uVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (*(byte *)((char *)uVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- *(byte *)((char *)uVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (*(byte *)(uVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- (*(byte *)(uVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar2)->xpos
|
- *(byte *)(uVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar2)->xpos
)
...>
}

@field_5_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar2)->quality
|
- ((ushort *)uVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar2)->quality
|
- *(ushort *)(uVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar2)->quality
|
- *(byte *)((char *)uVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar2)->quality
|
- *(byte *)(uVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar2)->quality
)
...>
}

@field_5_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar2)->next
|
- (*(ushort *)((char *)uVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar2)->next
|
- (((ushort *)uVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar2)->next
|
- (((ushort *)uVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar2)->next
|
- (*(ushort *)(uVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar2)->next
|
- (*(ushort *)(uVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar2)->next
)
...>
}

@field_5_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar2)->owner
|
- ((ushort *)uVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar2)->owner
|
- *(ushort *)(uVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar2)->owner
|
- *(byte *)((char *)uVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar2)->owner
|
- *(byte *)(uVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar2)->owner
)
...>
}

@field_5_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar2)->link
|
- (*(ushort *)((char *)uVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar2)->link
|
- (((ushort *)uVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar2)->link
|
- (((ushort *)uVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar2)->link
|
- (*(ushort *)(uVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar2)->link
|
- (*(ushort *)(uVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar2)->link
)
...>
}

@field_6_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- ((ushort *)puVar6)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- *(ushort *)puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- puVar6[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- *puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
)
...>
}

@field_6_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (((ushort *)puVar6)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (((ushort *)puVar6)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)puVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)puVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (puVar6[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (puVar6[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*puVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*puVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar6)->flags_res
)
...>
}

@field_6_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (((ushort *)puVar6)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (((ushort *)puVar6)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)puVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)puVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (puVar6[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (puVar6[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*puVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*puVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar6)->enchanted
)
...>
}

@field_6_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (((ushort *)puVar6)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (((ushort *)puVar6)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)puVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)puVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (puVar6[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (puVar6[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*puVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*puVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar6)->doordir
)
...>
}

@field_6_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (((ushort *)puVar6)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (((ushort *)puVar6)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)puVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)puVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (puVar6[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (puVar6[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*puVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*puVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar6)->invisible
)
...>
}

@field_6_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *(ushort *)((char *)puVar6 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- ((ushort *)puVar6)[0] >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *(ushort *)puVar6 >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (puVar6[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (puVar6[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- puVar6[0] >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*puVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*puVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *puVar6 >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(byte *)((char *)puVar6 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *(byte *)((char *)puVar6 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar6)->is_quant
)
...>
}

@field_6_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- ((ushort *)puVar6)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- puVar6[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- *(byte *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- (byte)puVar6[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
)
...>
}

@field_6_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (((ushort *)puVar6)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (((ushort *)puVar6)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (puVar6[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (puVar6[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
)
...>
}

@field_6_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (((ushort *)puVar6)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (((ushort *)puVar6)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (puVar6[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (puVar6[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar6)->ypos
)
...>
}

@field_6_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- *(ushort *)((char *)puVar6 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- ((ushort *)puVar6)[1] >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (puVar6[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (puVar6[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- puVar6[1] >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(byte *)((char *)puVar6 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- *(byte *)((char *)puVar6 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar6)->xpos
)
...>
}

@field_6_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- ((ushort *)puVar6)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- puVar6[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- *(byte *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- (byte)puVar6[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
)
...>
}

@field_6_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (*(ushort *)((char *)puVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- *(ushort *)((char *)puVar6 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- ((ushort *)puVar6)[2] >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- (puVar6[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (puVar6[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- puVar6[2] >> 6
+ ((uw_object_hdr_t *)puVar6)->next
)
...>
}

@field_6_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- ((ushort *)puVar6)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- puVar6[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- *(byte *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- (byte)puVar6[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
)
...>
}

@field_6_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (*(ushort *)((char *)puVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- *(ushort *)((char *)puVar6 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- ((ushort *)puVar6)[3] >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- (puVar6[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (puVar6[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- puVar6[3] >> 6
+ ((uw_object_hdr_t *)puVar6)->link
)
...>
}

@field_7_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)caster)->item_id
|
- ((ushort *)caster)[0] & 0x1ff
+ ((uw_object_hdr_t *)caster)->item_id
|
- *(ushort *)caster & 0x1ff
+ ((uw_object_hdr_t *)caster)->item_id
|
- *(ushort *)(caster + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)caster)->item_id
)
...>
}

@field_7_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)((char *)caster + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (((ushort *)caster)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (((ushort *)caster)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)caster >> 9) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)caster & 0xe00) >> 9
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)(caster + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)(caster + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(byte *)((char *)caster + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(byte *)((char *)caster + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(byte *)(caster + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(byte *)(caster + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)caster)->flags_res
)
...>
}

@field_7_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)((char *)caster + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (((ushort *)caster)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (((ushort *)caster)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)caster >> 12) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)caster & 0x1000) >> 12
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)(caster + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)(caster + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(byte *)((char *)caster + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(byte *)((char *)caster + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(byte *)(caster + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(byte *)(caster + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)caster)->enchanted
)
...>
}

@field_7_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)((char *)caster + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)caster)->doordir
|
- (((ushort *)caster)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (((ushort *)caster)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)caster >> 13) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)caster & 0x2000) >> 13
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)(caster + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)(caster + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(byte *)((char *)caster + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(byte *)((char *)caster + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(byte *)(caster + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(byte *)(caster + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)caster)->doordir
)
...>
}

@field_7_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)((char *)caster + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)caster)->invisible
|
- (((ushort *)caster)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (((ushort *)caster)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)caster >> 14) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)caster & 0x4000) >> 14
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)(caster + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)(caster + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(byte *)((char *)caster + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(byte *)((char *)caster + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(byte *)(caster + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(byte *)(caster + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)caster)->invisible
)
...>
}

@field_7_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)((char *)caster + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (((ushort *)caster)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (((ushort *)caster)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)caster >> 15) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)caster & 0x8000) >> 15
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)(caster + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)(caster + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(byte *)((char *)caster + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(byte *)((char *)caster + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)caster)->is_quant
|
- *(byte *)((char *)caster + 0x1) >> 7
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(byte *)(caster + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(byte *)(caster + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)caster)->is_quant
|
- *(byte *)(caster + 0x1) >> 7
+ ((uw_object_hdr_t *)caster)->is_quant
)
...>
}

@field_7_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
|
- ((ushort *)caster)[1] & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
|
- *(ushort *)(caster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
|
- *(byte *)((char *)caster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
|
- *(byte *)(caster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
)
...>
}

@field_7_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)caster)->heading
|
- (*(ushort *)((char *)caster + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)caster)->heading
|
- (((ushort *)caster)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)caster)->heading
|
- (((ushort *)caster)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)caster)->heading
|
- (*(ushort *)(caster + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)caster)->heading
|
- (*(ushort *)(caster + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)caster)->heading
)
...>
}

@field_7_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(ushort *)((char *)caster + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)caster)->ypos
|
- (((ushort *)caster)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (((ushort *)caster)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(ushort *)(caster + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(ushort *)(caster + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(byte *)((char *)caster + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(byte *)((char *)caster + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(byte *)(caster + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(byte *)(caster + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)caster)->ypos
)
...>
}

@field_7_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(ushort *)((char *)caster + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)caster)->xpos
|
- (((ushort *)caster)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (((ushort *)caster)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(ushort *)(caster + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(ushort *)(caster + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(byte *)((char *)caster + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(byte *)((char *)caster + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)caster)->xpos
|
- *(byte *)((char *)caster + 0x3) >> 5
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(byte *)(caster + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(byte *)(caster + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)caster)->xpos
|
- *(byte *)(caster + 0x3) >> 5
+ ((uw_object_hdr_t *)caster)->xpos
)
...>
}

@field_7_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
|
- ((ushort *)caster)[2] & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
|
- *(ushort *)(caster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
|
- *(byte *)((char *)caster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
|
- *(byte *)(caster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
)
...>
}

@field_7_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->next
|
- (*(ushort *)((char *)caster + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->next
|
- (((ushort *)caster)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->next
|
- (((ushort *)caster)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->next
|
- (*(ushort *)(caster + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->next
|
- (*(ushort *)(caster + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->next
)
...>
}

@field_7_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
|
- ((ushort *)caster)[3] & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
|
- *(ushort *)(caster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
|
- *(byte *)((char *)caster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
|
- *(byte *)(caster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
)
...>
}

@field_7_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->link
|
- (*(ushort *)((char *)caster + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->link
|
- (((ushort *)caster)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->link
|
- (((ushort *)caster)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->link
|
- (*(ushort *)(caster + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->link
|
- (*(ushort *)(caster + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->link
)
...>
}

@field_8_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
|
- ((ushort *)pObj)[0] & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
|
- *(ushort *)pObj & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
)
...>
}

@field_8_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (*(byte *)((char *)pObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(byte *)((char *)pObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pObj)->flags_res
)
...>
}

@field_8_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (*(byte *)((char *)pObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(byte *)((char *)pObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pObj)->enchanted
)
...>
}

@field_8_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (*(byte *)((char *)pObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(byte *)((char *)pObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pObj)->doordir
)
...>
}

@field_8_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (*(byte *)((char *)pObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(byte *)((char *)pObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pObj)->invisible
)
...>
}

@field_8_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (((ushort *)pObj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (((ushort *)pObj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)pObj >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)pObj & 0x8000) >> 15
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

@field_8_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(byte *)((char *)pObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
)
...>
}

@field_8_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
)
...>
}

@field_8_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (*(byte *)((char *)pObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(byte *)((char *)pObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pObj)->ypos
)
...>
}

@field_8_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (((ushort *)pObj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (((ushort *)pObj)[1] & 0xe000) >> 13
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

@field_8_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(byte *)((char *)pObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
)
...>
}

@field_8_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (((ushort *)pObj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (((ushort *)pObj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
)
...>
}

@field_8_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(byte *)((char *)pObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
)
...>
}

@field_8_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- (((ushort *)pObj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (((ushort *)pObj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
)
...>
}

@field_9_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)saved_scratch)->item_id
|
- ((ushort *)saved_scratch)[0] & 0x1ff
+ ((uw_object_hdr_t *)saved_scratch)->item_id
|
- *(ushort *)saved_scratch & 0x1ff
+ ((uw_object_hdr_t *)saved_scratch)->item_id
)
...>
}

@field_9_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->flags_res
|
- (*(ushort *)((char *)saved_scratch + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)saved_scratch)->flags_res
|
- (((ushort *)saved_scratch)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->flags_res
|
- (((ushort *)saved_scratch)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)saved_scratch)->flags_res
|
- (*(ushort *)saved_scratch >> 9) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->flags_res
|
- (*(ushort *)saved_scratch & 0xe00) >> 9
+ ((uw_object_hdr_t *)saved_scratch)->flags_res
|
- (*(byte *)((char *)saved_scratch + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->flags_res
|
- (*(byte *)((char *)saved_scratch + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)saved_scratch)->flags_res
)
...>
}

@field_9_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->enchanted
|
- (*(ushort *)((char *)saved_scratch + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)saved_scratch)->enchanted
|
- (((ushort *)saved_scratch)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->enchanted
|
- (((ushort *)saved_scratch)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)saved_scratch)->enchanted
|
- (*(ushort *)saved_scratch >> 12) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->enchanted
|
- (*(ushort *)saved_scratch & 0x1000) >> 12
+ ((uw_object_hdr_t *)saved_scratch)->enchanted
|
- (*(byte *)((char *)saved_scratch + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->enchanted
|
- (*(byte *)((char *)saved_scratch + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)saved_scratch)->enchanted
)
...>
}

@field_9_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->doordir
|
- (*(ushort *)((char *)saved_scratch + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)saved_scratch)->doordir
|
- (((ushort *)saved_scratch)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->doordir
|
- (((ushort *)saved_scratch)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)saved_scratch)->doordir
|
- (*(ushort *)saved_scratch >> 13) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->doordir
|
- (*(ushort *)saved_scratch & 0x2000) >> 13
+ ((uw_object_hdr_t *)saved_scratch)->doordir
|
- (*(byte *)((char *)saved_scratch + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->doordir
|
- (*(byte *)((char *)saved_scratch + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)saved_scratch)->doordir
)
...>
}

@field_9_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->invisible
|
- (*(ushort *)((char *)saved_scratch + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)saved_scratch)->invisible
|
- (((ushort *)saved_scratch)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->invisible
|
- (((ushort *)saved_scratch)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)saved_scratch)->invisible
|
- (*(ushort *)saved_scratch >> 14) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->invisible
|
- (*(ushort *)saved_scratch & 0x4000) >> 14
+ ((uw_object_hdr_t *)saved_scratch)->invisible
|
- (*(byte *)((char *)saved_scratch + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->invisible
|
- (*(byte *)((char *)saved_scratch + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)saved_scratch)->invisible
)
...>
}

@field_9_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
|
- (*(ushort *)((char *)saved_scratch + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
|
- (((ushort *)saved_scratch)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
|
- (((ushort *)saved_scratch)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
|
- (*(ushort *)saved_scratch >> 15) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
|
- (*(ushort *)saved_scratch & 0x8000) >> 15
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
|
- (*(byte *)((char *)saved_scratch + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
|
- (*(byte *)((char *)saved_scratch + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
|
- *(byte *)((char *)saved_scratch + 0x1) >> 7
+ ((uw_object_hdr_t *)saved_scratch)->is_quant
)
...>
}

@field_9_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0x2) & 0x7f
+ ((uw_object_hdr_t *)saved_scratch)->zpos
|
- ((ushort *)saved_scratch)[1] & 0x7f
+ ((uw_object_hdr_t *)saved_scratch)->zpos
|
- *(byte *)((char *)saved_scratch + 0x2) & 0x7f
+ ((uw_object_hdr_t *)saved_scratch)->zpos
)
...>
}

@field_9_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->heading
|
- (*(ushort *)((char *)saved_scratch + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)saved_scratch)->heading
|
- (((ushort *)saved_scratch)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->heading
|
- (((ushort *)saved_scratch)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)saved_scratch)->heading
)
...>
}

@field_9_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->ypos
|
- (*(ushort *)((char *)saved_scratch + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)saved_scratch)->ypos
|
- (((ushort *)saved_scratch)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->ypos
|
- (((ushort *)saved_scratch)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)saved_scratch)->ypos
|
- (*(byte *)((char *)saved_scratch + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->ypos
|
- (*(byte *)((char *)saved_scratch + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)saved_scratch)->ypos
)
...>
}

@field_9_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->xpos
|
- (*(ushort *)((char *)saved_scratch + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)saved_scratch)->xpos
|
- (((ushort *)saved_scratch)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->xpos
|
- (((ushort *)saved_scratch)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)saved_scratch)->xpos
|
- (*(byte *)((char *)saved_scratch + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)saved_scratch)->xpos
|
- (*(byte *)((char *)saved_scratch + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)saved_scratch)->xpos
|
- *(byte *)((char *)saved_scratch + 0x3) >> 5
+ ((uw_object_hdr_t *)saved_scratch)->xpos
)
...>
}

@field_9_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0x4) & 0x3f
+ ((uw_object_hdr_t *)saved_scratch)->quality
|
- ((ushort *)saved_scratch)[2] & 0x3f
+ ((uw_object_hdr_t *)saved_scratch)->quality
|
- *(byte *)((char *)saved_scratch + 0x4) & 0x3f
+ ((uw_object_hdr_t *)saved_scratch)->quality
)
...>
}

@field_9_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)saved_scratch)->next
|
- (*(ushort *)((char *)saved_scratch + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)saved_scratch)->next
|
- (((ushort *)saved_scratch)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)saved_scratch)->next
|
- (((ushort *)saved_scratch)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)saved_scratch)->next
)
...>
}

@field_9_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0x6) & 0x3f
+ ((uw_object_hdr_t *)saved_scratch)->owner
|
- ((ushort *)saved_scratch)[3] & 0x3f
+ ((uw_object_hdr_t *)saved_scratch)->owner
|
- *(byte *)((char *)saved_scratch + 0x6) & 0x3f
+ ((uw_object_hdr_t *)saved_scratch)->owner
)
...>
}

@field_9_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_scratch + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)saved_scratch)->link
|
- (*(ushort *)((char *)saved_scratch + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)saved_scratch)->link
|
- (((ushort *)saved_scratch)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)saved_scratch)->link
|
- (((ushort *)saved_scratch)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)saved_scratch)->link
)
...>
}

@field_10_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)target)->item_id
|
- ((ushort *)target)[0] & 0x1ff
+ ((uw_object_hdr_t *)target)->item_id
|
- *(ushort *)target & 0x1ff
+ ((uw_object_hdr_t *)target)->item_id
|
- target[0] & 0x1ff
+ ((uw_object_hdr_t *)target)->item_id
|
- *target & 0x1ff
+ ((uw_object_hdr_t *)target)->item_id
)
...>
}

@field_10_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(ushort *)((char *)target + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (((ushort *)target)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (((ushort *)target)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(ushort *)target >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(ushort *)target & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (target[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (target[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*target >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*target & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(byte *)((char *)target + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(byte *)((char *)target + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)target)->flags_res
)
...>
}

@field_10_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(ushort *)((char *)target + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (((ushort *)target)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (((ushort *)target)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(ushort *)target >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(ushort *)target & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (target[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (target[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*target >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*target & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(byte *)((char *)target + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(byte *)((char *)target + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)target)->enchanted
)
...>
}

@field_10_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(ushort *)((char *)target + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (((ushort *)target)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (((ushort *)target)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(ushort *)target >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(ushort *)target & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (target[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (target[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (*target >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (*target & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(byte *)((char *)target + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(byte *)((char *)target + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)target)->doordir
)
...>
}

@field_10_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(ushort *)((char *)target + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (((ushort *)target)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (((ushort *)target)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(ushort *)target >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(ushort *)target & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (target[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (target[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (*target >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (*target & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(byte *)((char *)target + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(byte *)((char *)target + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)target)->invisible
)
...>
}

@field_10_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(ushort *)((char *)target + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- *(ushort *)((char *)target + 0x0) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (((ushort *)target)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (((ushort *)target)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- ((ushort *)target)[0] >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(ushort *)target >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(ushort *)target & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- *(ushort *)target >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (target[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (target[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- target[0] >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*target >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*target & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- *target >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(byte *)((char *)target + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(byte *)((char *)target + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)target)->is_quant
|
- *(byte *)((char *)target + 0x1) >> 7
+ ((uw_object_hdr_t *)target)->is_quant
)
...>
}

@field_10_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x2) & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
|
- ((ushort *)target)[1] & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
|
- target[1] & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
|
- *(byte *)((char *)target + 0x2) & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
|
- (byte)target[1] & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
)
...>
}

@field_10_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)target)->heading
|
- (*(ushort *)((char *)target + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)target)->heading
|
- (((ushort *)target)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)target)->heading
|
- (((ushort *)target)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)target)->heading
|
- (target[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)target)->heading
|
- (target[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)target)->heading
)
...>
}

@field_10_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)target)->ypos
|
- (*(ushort *)((char *)target + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target)->ypos
|
- (((ushort *)target)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)target)->ypos
|
- (((ushort *)target)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target)->ypos
|
- (target[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)target)->ypos
|
- (target[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target)->ypos
|
- (*(byte *)((char *)target + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)target)->ypos
|
- (*(byte *)((char *)target + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)target)->ypos
)
...>
}

@field_10_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (*(ushort *)((char *)target + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- *(ushort *)((char *)target + 0x2) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- (((ushort *)target)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (((ushort *)target)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- ((ushort *)target)[1] >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- (target[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (target[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- target[1] >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- (*(byte *)((char *)target + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (*(byte *)((char *)target + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)target)->xpos
|
- *(byte *)((char *)target + 0x3) >> 5
+ ((uw_object_hdr_t *)target)->xpos
)
...>
}

@field_10_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x4) & 0x3f
+ ((uw_object_hdr_t *)target)->quality
|
- ((ushort *)target)[2] & 0x3f
+ ((uw_object_hdr_t *)target)->quality
|
- target[2] & 0x3f
+ ((uw_object_hdr_t *)target)->quality
|
- *(byte *)((char *)target + 0x4) & 0x3f
+ ((uw_object_hdr_t *)target)->quality
|
- (byte)target[2] & 0x3f
+ ((uw_object_hdr_t *)target)->quality
)
...>
}

@field_10_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->next
|
- (*(ushort *)((char *)target + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- *(ushort *)((char *)target + 0x4) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- (((ushort *)target)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->next
|
- (((ushort *)target)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- ((ushort *)target)[2] >> 6
+ ((uw_object_hdr_t *)target)->next
|
- (target[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->next
|
- (target[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- target[2] >> 6
+ ((uw_object_hdr_t *)target)->next
)
...>
}

@field_10_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x6) & 0x3f
+ ((uw_object_hdr_t *)target)->owner
|
- ((ushort *)target)[3] & 0x3f
+ ((uw_object_hdr_t *)target)->owner
|
- target[3] & 0x3f
+ ((uw_object_hdr_t *)target)->owner
|
- *(byte *)((char *)target + 0x6) & 0x3f
+ ((uw_object_hdr_t *)target)->owner
|
- (byte)target[3] & 0x3f
+ ((uw_object_hdr_t *)target)->owner
)
...>
}

@field_10_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->link
|
- (*(ushort *)((char *)target + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- *(ushort *)((char *)target + 0x6) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- (((ushort *)target)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->link
|
- (((ushort *)target)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- ((ushort *)target)[3] >> 6
+ ((uw_object_hdr_t *)target)->link
|
- (target[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->link
|
- (target[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- target[3] >> 6
+ ((uw_object_hdr_t *)target)->link
)
...>
}

@field_11_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- ((ushort *)iVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- *(ushort *)iVar3 & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- *(ushort *)(iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- CONCAT11(iVar3[1], *iVar3) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- CONCAT11(iVar3[1], iVar3[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
)
...>
}

@field_11_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
- (CONCAT11(iVar3[1], *iVar3) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (CONCAT11(iVar3[1], *iVar3) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0xe00) >> 9
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

@field_11_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
- (CONCAT11(iVar3[1], *iVar3) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (CONCAT11(iVar3[1], *iVar3) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0x1000) >> 12
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

@field_11_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
- (CONCAT11(iVar3[1], *iVar3) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (CONCAT11(iVar3[1], *iVar3) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0x2000) >> 13
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

@field_11_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
- (CONCAT11(iVar3[1], *iVar3) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (CONCAT11(iVar3[1], *iVar3) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0x4000) >> 14
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

@field_11_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
- (CONCAT11(iVar3[1], *iVar3) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (CONCAT11(iVar3[1], *iVar3) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0x8000) >> 15
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

@field_11_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
- iVar3[2] & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(byte *)(iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
)
...>
}

@field_11_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@field_11_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@field_11_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@field_11_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
- iVar3[4] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(byte *)(iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
)
...>
}

@field_11_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@field_11_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
- iVar3[6] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(byte *)(iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
)
...>
}

@field_11_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@field_12_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->item_id
|
- ((ushort *)uVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->item_id
|
- *(ushort *)uVar4 & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->item_id
|
- *(ushort *)(uVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->item_id
)
...>
}

@field_12_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (((ushort *)uVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (((ushort *)uVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)uVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)uVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)(uVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)(uVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)((char *)uVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)((char *)uVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)(uVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)(uVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar4)->flags_res
)
...>
}

@field_12_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (((ushort *)uVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (((ushort *)uVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)uVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)uVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)(uVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)(uVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)((char *)uVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)(uVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)(uVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar4)->enchanted
)
...>
}

@field_12_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (((ushort *)uVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (((ushort *)uVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)uVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)uVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)(uVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)(uVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)((char *)uVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)(uVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)(uVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar4)->doordir
)
...>
}

@field_12_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (((ushort *)uVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (((ushort *)uVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)uVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)uVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)(uVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)(uVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)((char *)uVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)(uVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)(uVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar4)->invisible
)
...>
}

@field_12_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (((ushort *)uVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (((ushort *)uVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)uVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)uVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)(uVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)(uVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)((char *)uVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(byte *)((char *)uVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)(uVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)(uVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(byte *)(uVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
)
...>
}

@field_12_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- ((ushort *)uVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(ushort *)(uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(byte *)((char *)uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(byte *)(uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
)
...>
}

@field_12_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (((ushort *)uVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (((ushort *)uVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)(uVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)(uVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
)
...>
}

@field_12_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (((ushort *)uVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (((ushort *)uVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)(uVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)(uVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)((char *)uVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)((char *)uVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)(uVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)(uVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar4)->ypos
)
...>
}

@field_12_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (((ushort *)uVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (((ushort *)uVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)(uVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)(uVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)((char *)uVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)((char *)uVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- *(byte *)((char *)uVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)(uVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)(uVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- *(byte *)(uVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
)
...>
}

@field_12_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- ((ushort *)uVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(ushort *)(uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(byte *)((char *)uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(byte *)(uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
)
...>
}

@field_12_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)((char *)uVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- (((ushort *)uVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (((ushort *)uVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)(uVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)(uVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
)
...>
}

@field_12_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- ((ushort *)uVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(ushort *)(uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(byte *)((char *)uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(byte *)(uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
)
...>
}

@field_12_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)((char *)uVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- (((ushort *)uVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (((ushort *)uVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)(uVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)(uVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
)
...>
}

@field_13_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- ((ushort *)iVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- *(ushort *)iVar3 & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- *(ushort *)(iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
)
...>
}

@field_13_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_13_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@field_14_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
|
- ((ushort *)puVar8)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
|
- *(ushort *)puVar8 & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
|
- puVar8[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
|
- *puVar8 & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
)
...>
}

@field_14_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_14_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@field_15_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc)->item_id
|
- ((ushort *)npc)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc)->item_id
|
- *(ushort *)npc & 0x1ff
+ ((uw_object_hdr_t *)npc)->item_id
)
...>
}

@field_15_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)((char *)npc + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc)->flags_res
)
...>
}

@field_15_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)((char *)npc + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc)->enchanted
)
...>
}

@field_15_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)((char *)npc + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc)->doordir
)
...>
}

@field_15_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)((char *)npc + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc)->invisible
)
...>
}

@field_15_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)((char *)npc + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(byte *)((char *)npc + 0x1) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
)
...>
}

@field_15_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- ((ushort *)npc)[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- *(byte *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
)
...>
}

@field_15_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (*(ushort *)((char *)npc + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
)
...>
}

@field_15_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(ushort *)((char *)npc + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc)->ypos
)
...>
}

@field_15_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(ushort *)((char *)npc + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
|
- *(byte *)((char *)npc + 0x3) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
)
...>
}

@field_15_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- ((ushort *)npc)[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- *(byte *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
)
...>
}

@field_15_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (*(ushort *)((char *)npc + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
)
...>
}

@field_15_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- ((ushort *)npc)[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- *(byte *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
)
...>
}

@field_15_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (*(ushort *)((char *)npc + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
)
...>
}

@field_16_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)chain_item)->item_id
|
- ((ushort *)chain_item)[0] & 0x1ff
+ ((uw_object_hdr_t *)chain_item)->item_id
|
- *(ushort *)chain_item & 0x1ff
+ ((uw_object_hdr_t *)chain_item)->item_id
|
- chain_item[0] & 0x1ff
+ ((uw_object_hdr_t *)chain_item)->item_id
|
- *chain_item & 0x1ff
+ ((uw_object_hdr_t *)chain_item)->item_id
)
...>
}

@field_16_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (*(ushort *)((char *)chain_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (((ushort *)chain_item)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (((ushort *)chain_item)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (*(ushort *)chain_item >> 9) & 0x7
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (*(ushort *)chain_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (chain_item[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (chain_item[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (*chain_item >> 9) & 0x7
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (*chain_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (*(byte *)((char *)chain_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)chain_item)->flags_res
|
- (*(byte *)((char *)chain_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)chain_item)->flags_res
)
...>
}

@field_16_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (*(ushort *)((char *)chain_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (((ushort *)chain_item)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (((ushort *)chain_item)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (*(ushort *)chain_item >> 12) & 0x1
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (*(ushort *)chain_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (chain_item[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (chain_item[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (*chain_item >> 12) & 0x1
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (*chain_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (*(byte *)((char *)chain_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)chain_item)->enchanted
|
- (*(byte *)((char *)chain_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)chain_item)->enchanted
)
...>
}

@field_16_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (*(ushort *)((char *)chain_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (((ushort *)chain_item)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (((ushort *)chain_item)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (*(ushort *)chain_item >> 13) & 0x1
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (*(ushort *)chain_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (chain_item[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (chain_item[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (*chain_item >> 13) & 0x1
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (*chain_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (*(byte *)((char *)chain_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)chain_item)->doordir
|
- (*(byte *)((char *)chain_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)chain_item)->doordir
)
...>
}

@field_16_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (*(ushort *)((char *)chain_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (((ushort *)chain_item)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (((ushort *)chain_item)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (*(ushort *)chain_item >> 14) & 0x1
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (*(ushort *)chain_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (chain_item[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (chain_item[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (*chain_item >> 14) & 0x1
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (*chain_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (*(byte *)((char *)chain_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)chain_item)->invisible
|
- (*(byte *)((char *)chain_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)chain_item)->invisible
)
...>
}

@field_16_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (*(ushort *)((char *)chain_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- *(ushort *)((char *)chain_item + 0x0) >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (((ushort *)chain_item)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (((ushort *)chain_item)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- ((ushort *)chain_item)[0] >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (*(ushort *)chain_item >> 15) & 0x1
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (*(ushort *)chain_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- *(ushort *)chain_item >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (chain_item[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (chain_item[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- chain_item[0] >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (*chain_item >> 15) & 0x1
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (*chain_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- *chain_item >> 15
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (*(byte *)((char *)chain_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- (*(byte *)((char *)chain_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)chain_item)->is_quant
|
- *(byte *)((char *)chain_item + 0x1) >> 7
+ ((uw_object_hdr_t *)chain_item)->is_quant
)
...>
}

@field_16_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)chain_item)->zpos
|
- ((ushort *)chain_item)[1] & 0x7f
+ ((uw_object_hdr_t *)chain_item)->zpos
|
- chain_item[1] & 0x7f
+ ((uw_object_hdr_t *)chain_item)->zpos
|
- *(byte *)((char *)chain_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)chain_item)->zpos
|
- (byte)chain_item[1] & 0x7f
+ ((uw_object_hdr_t *)chain_item)->zpos
)
...>
}

@field_16_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)chain_item)->heading
|
- (*(ushort *)((char *)chain_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)chain_item)->heading
|
- (((ushort *)chain_item)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)chain_item)->heading
|
- (((ushort *)chain_item)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)chain_item)->heading
|
- (chain_item[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)chain_item)->heading
|
- (chain_item[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)chain_item)->heading
)
...>
}

@field_16_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)chain_item)->ypos
|
- (*(ushort *)((char *)chain_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)chain_item)->ypos
|
- (((ushort *)chain_item)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)chain_item)->ypos
|
- (((ushort *)chain_item)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)chain_item)->ypos
|
- (chain_item[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)chain_item)->ypos
|
- (chain_item[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)chain_item)->ypos
|
- (*(byte *)((char *)chain_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)chain_item)->ypos
|
- (*(byte *)((char *)chain_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)chain_item)->ypos
)
...>
}

@field_16_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- (*(ushort *)((char *)chain_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- *(ushort *)((char *)chain_item + 0x2) >> 13
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- (((ushort *)chain_item)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- (((ushort *)chain_item)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- ((ushort *)chain_item)[1] >> 13
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- (chain_item[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- (chain_item[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- chain_item[1] >> 13
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- (*(byte *)((char *)chain_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- (*(byte *)((char *)chain_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)chain_item)->xpos
|
- *(byte *)((char *)chain_item + 0x3) >> 5
+ ((uw_object_hdr_t *)chain_item)->xpos
)
...>
}

@field_16_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)chain_item)->quality
|
- ((ushort *)chain_item)[2] & 0x3f
+ ((uw_object_hdr_t *)chain_item)->quality
|
- chain_item[2] & 0x3f
+ ((uw_object_hdr_t *)chain_item)->quality
|
- *(byte *)((char *)chain_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)chain_item)->quality
|
- (byte)chain_item[2] & 0x3f
+ ((uw_object_hdr_t *)chain_item)->quality
)
...>
}

@field_16_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)chain_item)->next
|
- (*(ushort *)((char *)chain_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)chain_item)->next
|
- *(ushort *)((char *)chain_item + 0x4) >> 6
+ ((uw_object_hdr_t *)chain_item)->next
|
- (((ushort *)chain_item)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)chain_item)->next
|
- (((ushort *)chain_item)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)chain_item)->next
|
- ((ushort *)chain_item)[2] >> 6
+ ((uw_object_hdr_t *)chain_item)->next
|
- (chain_item[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)chain_item)->next
|
- (chain_item[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)chain_item)->next
|
- chain_item[2] >> 6
+ ((uw_object_hdr_t *)chain_item)->next
)
...>
}

@field_16_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)chain_item)->owner
|
- ((ushort *)chain_item)[3] & 0x3f
+ ((uw_object_hdr_t *)chain_item)->owner
|
- chain_item[3] & 0x3f
+ ((uw_object_hdr_t *)chain_item)->owner
|
- *(byte *)((char *)chain_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)chain_item)->owner
|
- (byte)chain_item[3] & 0x3f
+ ((uw_object_hdr_t *)chain_item)->owner
)
...>
}

@field_16_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)chain_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)chain_item)->link
|
- (*(ushort *)((char *)chain_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)chain_item)->link
|
- *(ushort *)((char *)chain_item + 0x6) >> 6
+ ((uw_object_hdr_t *)chain_item)->link
|
- (((ushort *)chain_item)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)chain_item)->link
|
- (((ushort *)chain_item)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)chain_item)->link
|
- ((ushort *)chain_item)[3] >> 6
+ ((uw_object_hdr_t *)chain_item)->link
|
- (chain_item[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)chain_item)->link
|
- (chain_item[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)chain_item)->link
|
- chain_item[3] >> 6
+ ((uw_object_hdr_t *)chain_item)->link
)
...>
}

@field_17_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
|
- ((ushort *)puVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
|
- *(ushort *)puVar1 & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
|
- puVar1[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
|
- *puVar1 & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
)
...>
}

@field_17_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (((ushort *)puVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (((ushort *)puVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)puVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)puVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (puVar1[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (puVar1[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*puVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*puVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(byte *)((char *)puVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(byte *)((char *)puVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar1)->flags_res
)
...>
}

@field_17_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (((ushort *)puVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (((ushort *)puVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)puVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)puVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (puVar1[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (puVar1[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*puVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*puVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(byte *)((char *)puVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar1)->enchanted
)
...>
}

@field_17_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (((ushort *)puVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (((ushort *)puVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)puVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)puVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (puVar1[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (puVar1[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*puVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*puVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(byte *)((char *)puVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar1)->doordir
)
...>
}

@field_17_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (((ushort *)puVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (((ushort *)puVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)puVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)puVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (puVar1[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (puVar1[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*puVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*puVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(byte *)((char *)puVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar1)->invisible
)
...>
}

@field_17_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *(ushort *)((char *)puVar1 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (((ushort *)puVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (((ushort *)puVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- ((ushort *)puVar1)[0] >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *(ushort *)puVar1 >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (puVar1[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (puVar1[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- puVar1[0] >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*puVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*puVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *puVar1 >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(byte *)((char *)puVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *(byte *)((char *)puVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar1)->is_quant
)
...>
}

@field_17_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- ((ushort *)puVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- puVar1[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- *(byte *)((char *)puVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- (byte)puVar1[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
)
...>
}

@field_17_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (((ushort *)puVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (((ushort *)puVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (puVar1[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (puVar1[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
)
...>
}

@field_17_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (((ushort *)puVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (((ushort *)puVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (puVar1[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (puVar1[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(byte *)((char *)puVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar1)->ypos
)
...>
}

@field_17_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- *(ushort *)((char *)puVar1 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (((ushort *)puVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (((ushort *)puVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- ((ushort *)puVar1)[1] >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (puVar1[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (puVar1[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- puVar1[1] >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(byte *)((char *)puVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- *(byte *)((char *)puVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar1)->xpos
)
...>
}

@field_17_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- ((ushort *)puVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- puVar1[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- *(byte *)((char *)puVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- (byte)puVar1[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
)
...>
}

@field_17_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (*(ushort *)((char *)puVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- *(ushort *)((char *)puVar1 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- (((ushort *)puVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (((ushort *)puVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- ((ushort *)puVar1)[2] >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- (puVar1[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (puVar1[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- puVar1[2] >> 6
+ ((uw_object_hdr_t *)puVar1)->next
)
...>
}

@field_17_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- ((ushort *)puVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- puVar1[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- *(byte *)((char *)puVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- (byte)puVar1[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
)
...>
}

@field_17_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (*(ushort *)((char *)puVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- *(ushort *)((char *)puVar1 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- (((ushort *)puVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (((ushort *)puVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- ((ushort *)puVar1)[3] >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- (puVar1[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (puVar1[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- puVar1[3] >> 6
+ ((uw_object_hdr_t *)puVar1)->link
)
...>
}
