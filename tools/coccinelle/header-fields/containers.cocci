@field_0_item_id@
type R;
identifier F =~ "^\(release_container_reference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- ((ushort *)puVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- *(ushort *)puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- puVar2[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- *puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_enchanted@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_doordir@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_invisible@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_is_quant@
type R;
identifier F =~ "^\(release_container_reference\)$";
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
)
...>
}

@field_0_zpos@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_heading@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_ypos@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_xpos@
type R;
identifier F =~ "^\(release_container_reference\)$";
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
)
...>
}

@field_0_quality@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_next@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_owner@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_0_link@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@field_1_item_id@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- ((ushort *)iVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- *(ushort *)iVar1 & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- *(ushort *)(iVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- CONCAT11(iVar1[1], *iVar1) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- CONCAT11(iVar1[1], iVar1[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
)
...>
}

@field_1_flags_res@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (((ushort *)iVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (((ushort *)iVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)iVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)iVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)(iVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)(iVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], *iVar1) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], *iVar1) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)((char *)iVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)((char *)iVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar1)->flags_res
)
...>
}

@field_1_enchanted@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (((ushort *)iVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (((ushort *)iVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)iVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)iVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)(iVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)(iVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], *iVar1) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], *iVar1) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)((char *)iVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar1)->enchanted
)
...>
}

@field_1_doordir@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (((ushort *)iVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (((ushort *)iVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)iVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)iVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)(iVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)(iVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], *iVar1) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], *iVar1) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)((char *)iVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar1)->doordir
)
...>
}

@field_1_invisible@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (((ushort *)iVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (((ushort *)iVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)iVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)iVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)(iVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)(iVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], *iVar1) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], *iVar1) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)((char *)iVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar1)->invisible
)
...>
}

@field_1_is_quant@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (((ushort *)iVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (((ushort *)iVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)iVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)iVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)(iVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)(iVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], *iVar1) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], *iVar1) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)((char *)iVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
)
...>
}

@field_1_zpos@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- ((ushort *)iVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- *(ushort *)(iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- *(byte *)((char *)iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- iVar1[2] & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
)
...>
}

@field_1_heading@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (((ushort *)iVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (((ushort *)iVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (*(ushort *)(iVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (*(ushort *)(iVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
)
...>
}

@field_1_ypos@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (((ushort *)iVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (((ushort *)iVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(ushort *)(iVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(ushort *)(iVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)((char *)iVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)((char *)iVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar1)->ypos
)
...>
}

@field_1_xpos@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (((ushort *)iVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (((ushort *)iVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(ushort *)(iVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(ushort *)(iVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)((char *)iVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)((char *)iVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
)
...>
}

@field_1_quality@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- ((ushort *)iVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- *(ushort *)(iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- *(byte *)((char *)iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- iVar1[4] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
)
...>
}

@field_1_next@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (*(ushort *)((char *)iVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
|
- (((ushort *)iVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (((ushort *)iVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
|
- (*(ushort *)(iVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (*(ushort *)(iVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
)
...>
}

@field_1_owner@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- ((ushort *)iVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- *(ushort *)(iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- *(byte *)((char *)iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- iVar1[6] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
)
...>
}

@field_1_link@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (*(ushort *)((char *)iVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
|
- (((ushort *)iVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (((ushort *)iVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
|
- (*(ushort *)(iVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (*(ushort *)(iVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
)
...>
}

@field_2_item_id@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pContents)->item_id
|
- ((ushort *)pContents)[0] & 0x1ff
+ ((uw_object_hdr_t *)pContents)->item_id
|
- *(ushort *)pContents & 0x1ff
+ ((uw_object_hdr_t *)pContents)->item_id
|
- *(ushort *)(pContents + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pContents)->item_id
|
- CONCAT11(pContents[1], *pContents) & 0x1ff
+ ((uw_object_hdr_t *)pContents)->item_id
|
- CONCAT11(pContents[1], pContents[0]) & 0x1ff
+ ((uw_object_hdr_t *)pContents)->item_id
)
...>
}

@field_2_flags_res@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (*(ushort *)((char *)pContents + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (((ushort *)pContents)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (((ushort *)pContents)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (*(ushort *)pContents >> 9) & 0x7
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (*(ushort *)pContents & 0xe00) >> 9
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (*(ushort *)(pContents + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (*(ushort *)(pContents + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (CONCAT11(pContents[1], *pContents) >> 9) & 0x7
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (CONCAT11(pContents[1], *pContents) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (CONCAT11(pContents[1], pContents[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (CONCAT11(pContents[1], pContents[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (*(byte *)((char *)pContents + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pContents)->flags_res
|
- (*(byte *)((char *)pContents + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pContents)->flags_res
)
...>
}

@field_2_enchanted@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (*(ushort *)((char *)pContents + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (((ushort *)pContents)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (((ushort *)pContents)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (*(ushort *)pContents >> 12) & 0x1
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (*(ushort *)pContents & 0x1000) >> 12
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (*(ushort *)(pContents + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (*(ushort *)(pContents + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (CONCAT11(pContents[1], *pContents) >> 12) & 0x1
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (CONCAT11(pContents[1], *pContents) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (CONCAT11(pContents[1], pContents[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (CONCAT11(pContents[1], pContents[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (*(byte *)((char *)pContents + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pContents)->enchanted
|
- (*(byte *)((char *)pContents + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pContents)->enchanted
)
...>
}

@field_2_doordir@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (*(ushort *)((char *)pContents + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (((ushort *)pContents)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (((ushort *)pContents)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (*(ushort *)pContents >> 13) & 0x1
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (*(ushort *)pContents & 0x2000) >> 13
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (*(ushort *)(pContents + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (*(ushort *)(pContents + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (CONCAT11(pContents[1], *pContents) >> 13) & 0x1
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (CONCAT11(pContents[1], *pContents) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (CONCAT11(pContents[1], pContents[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (CONCAT11(pContents[1], pContents[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (*(byte *)((char *)pContents + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pContents)->doordir
|
- (*(byte *)((char *)pContents + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pContents)->doordir
)
...>
}

@field_2_invisible@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (*(ushort *)((char *)pContents + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (((ushort *)pContents)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (((ushort *)pContents)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (*(ushort *)pContents >> 14) & 0x1
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (*(ushort *)pContents & 0x4000) >> 14
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (*(ushort *)(pContents + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (*(ushort *)(pContents + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (CONCAT11(pContents[1], *pContents) >> 14) & 0x1
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (CONCAT11(pContents[1], *pContents) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (CONCAT11(pContents[1], pContents[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (CONCAT11(pContents[1], pContents[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (*(byte *)((char *)pContents + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pContents)->invisible
|
- (*(byte *)((char *)pContents + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pContents)->invisible
)
...>
}

@field_2_is_quant@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (*(ushort *)((char *)pContents + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (((ushort *)pContents)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (((ushort *)pContents)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (*(ushort *)pContents >> 15) & 0x1
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (*(ushort *)pContents & 0x8000) >> 15
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (*(ushort *)(pContents + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (*(ushort *)(pContents + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (CONCAT11(pContents[1], *pContents) >> 15) & 0x1
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (CONCAT11(pContents[1], *pContents) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (CONCAT11(pContents[1], pContents[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (CONCAT11(pContents[1], pContents[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (*(byte *)((char *)pContents + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pContents)->is_quant
|
- (*(byte *)((char *)pContents + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pContents)->is_quant
)
...>
}

@field_2_zpos@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pContents)->zpos
|
- ((ushort *)pContents)[1] & 0x7f
+ ((uw_object_hdr_t *)pContents)->zpos
|
- *(ushort *)(pContents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pContents)->zpos
|
- *(byte *)((char *)pContents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pContents)->zpos
|
- pContents[2] & 0x7f
+ ((uw_object_hdr_t *)pContents)->zpos
)
...>
}

@field_2_heading@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pContents)->heading
|
- (*(ushort *)((char *)pContents + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pContents)->heading
|
- (((ushort *)pContents)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pContents)->heading
|
- (((ushort *)pContents)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pContents)->heading
|
- (*(ushort *)(pContents + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pContents)->heading
|
- (*(ushort *)(pContents + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pContents)->heading
)
...>
}

@field_2_ypos@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pContents)->ypos
|
- (*(ushort *)((char *)pContents + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pContents)->ypos
|
- (((ushort *)pContents)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pContents)->ypos
|
- (((ushort *)pContents)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pContents)->ypos
|
- (*(ushort *)(pContents + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pContents)->ypos
|
- (*(ushort *)(pContents + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pContents)->ypos
|
- (*(byte *)((char *)pContents + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pContents)->ypos
|
- (*(byte *)((char *)pContents + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pContents)->ypos
)
...>
}

@field_2_xpos@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pContents)->xpos
|
- (*(ushort *)((char *)pContents + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pContents)->xpos
|
- (((ushort *)pContents)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pContents)->xpos
|
- (((ushort *)pContents)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pContents)->xpos
|
- (*(ushort *)(pContents + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pContents)->xpos
|
- (*(ushort *)(pContents + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pContents)->xpos
|
- (*(byte *)((char *)pContents + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pContents)->xpos
|
- (*(byte *)((char *)pContents + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pContents)->xpos
)
...>
}

@field_2_quality@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pContents)->quality
|
- ((ushort *)pContents)[2] & 0x3f
+ ((uw_object_hdr_t *)pContents)->quality
|
- *(ushort *)(pContents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pContents)->quality
|
- *(byte *)((char *)pContents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pContents)->quality
|
- pContents[4] & 0x3f
+ ((uw_object_hdr_t *)pContents)->quality
)
...>
}

@field_2_next@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pContents)->next
|
- (*(ushort *)((char *)pContents + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pContents)->next
|
- (((ushort *)pContents)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pContents)->next
|
- (((ushort *)pContents)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pContents)->next
|
- (*(ushort *)(pContents + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pContents)->next
|
- (*(ushort *)(pContents + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pContents)->next
)
...>
}

@field_2_owner@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pContents)->owner
|
- ((ushort *)pContents)[3] & 0x3f
+ ((uw_object_hdr_t *)pContents)->owner
|
- *(ushort *)(pContents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pContents)->owner
|
- *(byte *)((char *)pContents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pContents)->owner
|
- pContents[6] & 0x3f
+ ((uw_object_hdr_t *)pContents)->owner
)
...>
}

@field_2_link@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pContents + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pContents)->link
|
- (*(ushort *)((char *)pContents + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pContents)->link
|
- (((ushort *)pContents)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pContents)->link
|
- (((ushort *)pContents)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pContents)->link
|
- (*(ushort *)(pContents + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pContents)->link
|
- (*(ushort *)(pContents + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pContents)->link
)
...>
}

@field_3_item_id@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_pMatch)->item_id
|
- ((ushort *)_pMatch)[0] & 0x1ff
+ ((uw_object_hdr_t *)_pMatch)->item_id
|
- *(ushort *)_pMatch & 0x1ff
+ ((uw_object_hdr_t *)_pMatch)->item_id
|
- *(ushort *)(_pMatch + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_pMatch)->item_id
|
- CONCAT11(_pMatch[1], *_pMatch) & 0x1ff
+ ((uw_object_hdr_t *)_pMatch)->item_id
|
- CONCAT11(_pMatch[1], _pMatch[0]) & 0x1ff
+ ((uw_object_hdr_t *)_pMatch)->item_id
)
...>
}

@field_3_flags_res@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (*(ushort *)((char *)_pMatch + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (((ushort *)_pMatch)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (((ushort *)_pMatch)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (*(ushort *)_pMatch >> 9) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (*(ushort *)_pMatch & 0xe00) >> 9
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (*(ushort *)(_pMatch + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (*(ushort *)(_pMatch + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (CONCAT11(_pMatch[1], *_pMatch) >> 9) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (CONCAT11(_pMatch[1], *_pMatch) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (CONCAT11(_pMatch[1], _pMatch[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (CONCAT11(_pMatch[1], _pMatch[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (*(byte *)((char *)_pMatch + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->flags_res
|
- (*(byte *)((char *)_pMatch + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_pMatch)->flags_res
)
...>
}

@field_3_enchanted@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (*(ushort *)((char *)_pMatch + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (((ushort *)_pMatch)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (((ushort *)_pMatch)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (*(ushort *)_pMatch >> 12) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (*(ushort *)_pMatch & 0x1000) >> 12
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (*(ushort *)(_pMatch + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (*(ushort *)(_pMatch + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (CONCAT11(_pMatch[1], *_pMatch) >> 12) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (CONCAT11(_pMatch[1], *_pMatch) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (CONCAT11(_pMatch[1], _pMatch[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (CONCAT11(_pMatch[1], _pMatch[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (*(byte *)((char *)_pMatch + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->enchanted
|
- (*(byte *)((char *)_pMatch + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_pMatch)->enchanted
)
...>
}

@field_3_doordir@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (*(ushort *)((char *)_pMatch + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (((ushort *)_pMatch)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (((ushort *)_pMatch)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (*(ushort *)_pMatch >> 13) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (*(ushort *)_pMatch & 0x2000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (*(ushort *)(_pMatch + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (*(ushort *)(_pMatch + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (CONCAT11(_pMatch[1], *_pMatch) >> 13) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (CONCAT11(_pMatch[1], *_pMatch) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (CONCAT11(_pMatch[1], _pMatch[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (CONCAT11(_pMatch[1], _pMatch[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (*(byte *)((char *)_pMatch + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->doordir
|
- (*(byte *)((char *)_pMatch + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_pMatch)->doordir
)
...>
}

@field_3_invisible@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (*(ushort *)((char *)_pMatch + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (((ushort *)_pMatch)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (((ushort *)_pMatch)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (*(ushort *)_pMatch >> 14) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (*(ushort *)_pMatch & 0x4000) >> 14
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (*(ushort *)(_pMatch + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (*(ushort *)(_pMatch + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (CONCAT11(_pMatch[1], *_pMatch) >> 14) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (CONCAT11(_pMatch[1], *_pMatch) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (CONCAT11(_pMatch[1], _pMatch[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (CONCAT11(_pMatch[1], _pMatch[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (*(byte *)((char *)_pMatch + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->invisible
|
- (*(byte *)((char *)_pMatch + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_pMatch)->invisible
)
...>
}

@field_3_is_quant@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (*(ushort *)((char *)_pMatch + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (((ushort *)_pMatch)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (((ushort *)_pMatch)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (*(ushort *)_pMatch >> 15) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (*(ushort *)_pMatch & 0x8000) >> 15
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (*(ushort *)(_pMatch + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (*(ushort *)(_pMatch + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (CONCAT11(_pMatch[1], *_pMatch) >> 15) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (CONCAT11(_pMatch[1], *_pMatch) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (CONCAT11(_pMatch[1], _pMatch[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (CONCAT11(_pMatch[1], _pMatch[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (*(byte *)((char *)_pMatch + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_pMatch)->is_quant
|
- (*(byte *)((char *)_pMatch + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_pMatch)->is_quant
)
...>
}

@field_3_zpos@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_pMatch)->zpos
|
- ((ushort *)_pMatch)[1] & 0x7f
+ ((uw_object_hdr_t *)_pMatch)->zpos
|
- *(ushort *)(_pMatch + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_pMatch)->zpos
|
- *(byte *)((char *)_pMatch + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_pMatch)->zpos
|
- _pMatch[2] & 0x7f
+ ((uw_object_hdr_t *)_pMatch)->zpos
)
...>
}

@field_3_heading@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->heading
|
- (*(ushort *)((char *)_pMatch + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_pMatch)->heading
|
- (((ushort *)_pMatch)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->heading
|
- (((ushort *)_pMatch)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_pMatch)->heading
|
- (*(ushort *)(_pMatch + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->heading
|
- (*(ushort *)(_pMatch + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_pMatch)->heading
)
...>
}

@field_3_ypos@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->ypos
|
- (*(ushort *)((char *)_pMatch + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_pMatch)->ypos
|
- (((ushort *)_pMatch)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->ypos
|
- (((ushort *)_pMatch)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_pMatch)->ypos
|
- (*(ushort *)(_pMatch + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->ypos
|
- (*(ushort *)(_pMatch + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_pMatch)->ypos
|
- (*(byte *)((char *)_pMatch + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->ypos
|
- (*(byte *)((char *)_pMatch + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_pMatch)->ypos
)
...>
}

@field_3_xpos@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->xpos
|
- (*(ushort *)((char *)_pMatch + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->xpos
|
- (((ushort *)_pMatch)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->xpos
|
- (((ushort *)_pMatch)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->xpos
|
- (*(ushort *)(_pMatch + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->xpos
|
- (*(ushort *)(_pMatch + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_pMatch)->xpos
|
- (*(byte *)((char *)_pMatch + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_pMatch)->xpos
|
- (*(byte *)((char *)_pMatch + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_pMatch)->xpos
)
...>
}

@field_3_quality@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->quality
|
- ((ushort *)_pMatch)[2] & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->quality
|
- *(ushort *)(_pMatch + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->quality
|
- *(byte *)((char *)_pMatch + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->quality
|
- _pMatch[4] & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->quality
)
...>
}

@field_3_next@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_pMatch)->next
|
- (*(ushort *)((char *)_pMatch + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_pMatch)->next
|
- (((ushort *)_pMatch)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_pMatch)->next
|
- (((ushort *)_pMatch)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_pMatch)->next
|
- (*(ushort *)(_pMatch + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_pMatch)->next
|
- (*(ushort *)(_pMatch + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_pMatch)->next
)
...>
}

@field_3_owner@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->owner
|
- ((ushort *)_pMatch)[3] & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->owner
|
- *(ushort *)(_pMatch + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->owner
|
- *(byte *)((char *)_pMatch + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->owner
|
- _pMatch[6] & 0x3f
+ ((uw_object_hdr_t *)_pMatch)->owner
)
...>
}

@field_3_link@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_pMatch + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_pMatch)->link
|
- (*(ushort *)((char *)_pMatch + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_pMatch)->link
|
- (((ushort *)_pMatch)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_pMatch)->link
|
- (((ushort *)_pMatch)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_pMatch)->link
|
- (*(ushort *)(_pMatch + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_pMatch)->link
|
- (*(ushort *)(_pMatch + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_pMatch)->link
)
...>
}

@field_4_item_id@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_flags_res@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_enchanted@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_doordir@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_invisible@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_is_quant@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_zpos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_heading@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_ypos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_xpos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_quality@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_next@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_owner@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_4_link@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@field_5_item_id@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar15)->item_id
|
- ((ushort *)puVar15)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar15)->item_id
|
- *(ushort *)puVar15 & 0x1ff
+ ((uw_object_hdr_t *)puVar15)->item_id
|
- puVar15[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar15)->item_id
|
- *puVar15 & 0x1ff
+ ((uw_object_hdr_t *)puVar15)->item_id
)
...>
}

@field_5_flags_res@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (*(ushort *)((char *)puVar15 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (((ushort *)puVar15)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (((ushort *)puVar15)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (*(ushort *)puVar15 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (*(ushort *)puVar15 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (puVar15[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (puVar15[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (*puVar15 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (*puVar15 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (*(byte *)((char *)puVar15 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar15)->flags_res
|
- (*(byte *)((char *)puVar15 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar15)->flags_res
)
...>
}

@field_5_enchanted@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (*(ushort *)((char *)puVar15 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (((ushort *)puVar15)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (((ushort *)puVar15)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (*(ushort *)puVar15 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (*(ushort *)puVar15 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (puVar15[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (puVar15[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (*puVar15 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (*puVar15 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (*(byte *)((char *)puVar15 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar15)->enchanted
|
- (*(byte *)((char *)puVar15 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar15)->enchanted
)
...>
}

@field_5_doordir@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (*(ushort *)((char *)puVar15 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (((ushort *)puVar15)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (((ushort *)puVar15)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (*(ushort *)puVar15 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (*(ushort *)puVar15 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (puVar15[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (puVar15[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (*puVar15 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (*puVar15 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (*(byte *)((char *)puVar15 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar15)->doordir
|
- (*(byte *)((char *)puVar15 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar15)->doordir
)
...>
}

@field_5_invisible@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (*(ushort *)((char *)puVar15 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (((ushort *)puVar15)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (((ushort *)puVar15)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (*(ushort *)puVar15 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (*(ushort *)puVar15 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (puVar15[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (puVar15[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (*puVar15 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (*puVar15 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (*(byte *)((char *)puVar15 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar15)->invisible
|
- (*(byte *)((char *)puVar15 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar15)->invisible
)
...>
}

@field_5_is_quant@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (*(ushort *)((char *)puVar15 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- *(ushort *)((char *)puVar15 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (((ushort *)puVar15)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (((ushort *)puVar15)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- ((ushort *)puVar15)[0] >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (*(ushort *)puVar15 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (*(ushort *)puVar15 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- *(ushort *)puVar15 >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (puVar15[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (puVar15[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- puVar15[0] >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (*puVar15 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (*puVar15 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- *puVar15 >> 15
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (*(byte *)((char *)puVar15 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar15)->is_quant
|
- (*(byte *)((char *)puVar15 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar15)->is_quant
)
...>
}

@field_5_zpos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar15)->zpos
|
- ((ushort *)puVar15)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar15)->zpos
|
- puVar15[1] & 0x7f
+ ((uw_object_hdr_t *)puVar15)->zpos
|
- *(byte *)((char *)puVar15 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar15)->zpos
|
- (byte)puVar15[1] & 0x7f
+ ((uw_object_hdr_t *)puVar15)->zpos
)
...>
}

@field_5_heading@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar15)->heading
|
- (*(ushort *)((char *)puVar15 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar15)->heading
|
- (((ushort *)puVar15)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar15)->heading
|
- (((ushort *)puVar15)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar15)->heading
|
- (puVar15[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar15)->heading
|
- (puVar15[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar15)->heading
)
...>
}

@field_5_ypos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar15)->ypos
|
- (*(ushort *)((char *)puVar15 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar15)->ypos
|
- (((ushort *)puVar15)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar15)->ypos
|
- (((ushort *)puVar15)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar15)->ypos
|
- (puVar15[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar15)->ypos
|
- (puVar15[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar15)->ypos
|
- (*(byte *)((char *)puVar15 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar15)->ypos
|
- (*(byte *)((char *)puVar15 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar15)->ypos
)
...>
}

@field_5_xpos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- (*(ushort *)((char *)puVar15 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- *(ushort *)((char *)puVar15 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- (((ushort *)puVar15)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- (((ushort *)puVar15)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- ((ushort *)puVar15)[1] >> 13
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- (puVar15[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- (puVar15[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- puVar15[1] >> 13
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- (*(byte *)((char *)puVar15 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar15)->xpos
|
- (*(byte *)((char *)puVar15 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar15)->xpos
)
...>
}

@field_5_quality@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar15)->quality
|
- ((ushort *)puVar15)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar15)->quality
|
- puVar15[2] & 0x3f
+ ((uw_object_hdr_t *)puVar15)->quality
|
- *(byte *)((char *)puVar15 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar15)->quality
|
- (byte)puVar15[2] & 0x3f
+ ((uw_object_hdr_t *)puVar15)->quality
)
...>
}

@field_5_next@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar15)->next
|
- (*(ushort *)((char *)puVar15 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar15)->next
|
- *(ushort *)((char *)puVar15 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar15)->next
|
- (((ushort *)puVar15)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar15)->next
|
- (((ushort *)puVar15)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar15)->next
|
- ((ushort *)puVar15)[2] >> 6
+ ((uw_object_hdr_t *)puVar15)->next
|
- (puVar15[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar15)->next
|
- (puVar15[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar15)->next
|
- puVar15[2] >> 6
+ ((uw_object_hdr_t *)puVar15)->next
)
...>
}

@field_5_owner@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar15)->owner
|
- ((ushort *)puVar15)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar15)->owner
|
- puVar15[3] & 0x3f
+ ((uw_object_hdr_t *)puVar15)->owner
|
- *(byte *)((char *)puVar15 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar15)->owner
|
- (byte)puVar15[3] & 0x3f
+ ((uw_object_hdr_t *)puVar15)->owner
)
...>
}

@field_5_link@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar15 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar15)->link
|
- (*(ushort *)((char *)puVar15 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar15)->link
|
- *(ushort *)((char *)puVar15 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar15)->link
|
- (((ushort *)puVar15)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar15)->link
|
- (((ushort *)puVar15)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar15)->link
|
- ((ushort *)puVar15)[3] >> 6
+ ((uw_object_hdr_t *)puVar15)->link
|
- (puVar15[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar15)->link
|
- (puVar15[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar15)->link
|
- puVar15[3] >> 6
+ ((uw_object_hdr_t *)puVar15)->link
)
...>
}

@field_6_item_id@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->item_id
|
- ((ushort *)puVar14)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->item_id
|
- *(ushort *)puVar14 & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->item_id
|
- puVar14[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->item_id
|
- *puVar14 & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->item_id
)
...>
}

@field_6_flags_res@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (((ushort *)puVar14)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (((ushort *)puVar14)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(ushort *)puVar14 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(ushort *)puVar14 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (puVar14[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (puVar14[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*puVar14 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*puVar14 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(byte *)((char *)puVar14 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(byte *)((char *)puVar14 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar14)->flags_res
)
...>
}

@field_6_enchanted@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (((ushort *)puVar14)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (((ushort *)puVar14)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(ushort *)puVar14 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(ushort *)puVar14 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (puVar14[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (puVar14[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*puVar14 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*puVar14 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(byte *)((char *)puVar14 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(byte *)((char *)puVar14 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar14)->enchanted
)
...>
}

@field_6_doordir@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (((ushort *)puVar14)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (((ushort *)puVar14)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(ushort *)puVar14 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(ushort *)puVar14 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (puVar14[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (puVar14[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*puVar14 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*puVar14 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(byte *)((char *)puVar14 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(byte *)((char *)puVar14 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar14)->doordir
)
...>
}

@field_6_invisible@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (((ushort *)puVar14)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (((ushort *)puVar14)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(ushort *)puVar14 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(ushort *)puVar14 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (puVar14[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (puVar14[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*puVar14 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*puVar14 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(byte *)((char *)puVar14 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(byte *)((char *)puVar14 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar14)->invisible
)
...>
}

@field_6_is_quant@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- *(ushort *)((char *)puVar14 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (((ushort *)puVar14)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (((ushort *)puVar14)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- ((ushort *)puVar14)[0] >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(ushort *)puVar14 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(ushort *)puVar14 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- *(ushort *)puVar14 >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (puVar14[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (puVar14[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- puVar14[0] >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*puVar14 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*puVar14 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- *puVar14 >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(byte *)((char *)puVar14 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(byte *)((char *)puVar14 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar14)->is_quant
)
...>
}

@field_6_zpos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
|
- ((ushort *)puVar14)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
|
- puVar14[1] & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
|
- *(byte *)((char *)puVar14 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
|
- (byte)puVar14[1] & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
)
...>
}

@field_6_heading@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (*(ushort *)((char *)puVar14 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (((ushort *)puVar14)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (((ushort *)puVar14)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (puVar14[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (puVar14[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar14)->heading
)
...>
}

@field_6_ypos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (*(ushort *)((char *)puVar14 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (((ushort *)puVar14)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (((ushort *)puVar14)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (puVar14[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (puVar14[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (*(byte *)((char *)puVar14 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (*(byte *)((char *)puVar14 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar14)->ypos
)
...>
}

@field_6_xpos@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (*(ushort *)((char *)puVar14 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- *(ushort *)((char *)puVar14 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (((ushort *)puVar14)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (((ushort *)puVar14)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- ((ushort *)puVar14)[1] >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (puVar14[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (puVar14[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- puVar14[1] >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (*(byte *)((char *)puVar14 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (*(byte *)((char *)puVar14 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar14)->xpos
)
...>
}

@field_6_quality@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
|
- ((ushort *)puVar14)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
|
- puVar14[2] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
|
- *(byte *)((char *)puVar14 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
|
- (byte)puVar14[2] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
)
...>
}

@field_6_next@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->next
|
- (*(ushort *)((char *)puVar14 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- *(ushort *)((char *)puVar14 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- (((ushort *)puVar14)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->next
|
- (((ushort *)puVar14)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- ((ushort *)puVar14)[2] >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- (puVar14[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->next
|
- (puVar14[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- puVar14[2] >> 6
+ ((uw_object_hdr_t *)puVar14)->next
)
...>
}

@field_6_owner@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
|
- ((ushort *)puVar14)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
|
- puVar14[3] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
|
- *(byte *)((char *)puVar14 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
|
- (byte)puVar14[3] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
)
...>
}

@field_6_link@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->link
|
- (*(ushort *)((char *)puVar14 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- *(ushort *)((char *)puVar14 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- (((ushort *)puVar14)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->link
|
- (((ushort *)puVar14)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- ((ushort *)puVar14)[3] >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- (puVar14[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->link
|
- (puVar14[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- puVar14[3] >> 6
+ ((uw_object_hdr_t *)puVar14)->link
)
...>
}

@field_7_item_id@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@field_7_flags_res@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_enchanted@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_doordir@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_invisible@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_is_quant@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_zpos@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_heading@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@field_7_ypos@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_xpos@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_quality@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_next@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@field_7_owner@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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
)
...>
}

@field_7_link@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@field_8_item_id@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_flags_res@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_enchanted@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_doordir@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_invisible@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_is_quant@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_zpos@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_heading@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_ypos@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_xpos@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_quality@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_next@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_owner@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_8_link@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@field_9_item_id@
type R;
identifier F =~ "^\(sum_container_weight\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- ((ushort *)puVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- *(ushort *)puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
)
...>
}

@field_9_flags_res@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (*(byte *)((char *)puVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar2)->flags_res
)
...>
}

@field_9_enchanted@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (*(byte *)((char *)puVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar2)->enchanted
)
...>
}

@field_9_doordir@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (*(byte *)((char *)puVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar2)->doordir
)
...>
}

@field_9_invisible@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (*(byte *)((char *)puVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar2)->invisible
)
...>
}

@field_9_is_quant@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (((ushort *)puVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
)
...>
}

@field_9_zpos@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- *(byte *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
)
...>
}

@field_9_heading@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}

@field_9_ypos@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (*(byte *)((char *)puVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar2)->ypos
)
...>
}

@field_9_xpos@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (((ushort *)puVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
)
...>
}

@field_9_quality@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- *(byte *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
)
...>
}

@field_9_next@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (((ushort *)puVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
)
...>
}

@field_9_owner@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- *(byte *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
)
...>
}

@field_9_link@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
- (((ushort *)puVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
)
...>
}

@field_10_item_id@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pNextLink)->item_id
|
- ((ushort *)pNextLink)[0] & 0x1ff
+ ((uw_object_hdr_t *)pNextLink)->item_id
|
- *(ushort *)pNextLink & 0x1ff
+ ((uw_object_hdr_t *)pNextLink)->item_id
|
- *(ushort *)(pNextLink + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pNextLink)->item_id
|
- CONCAT11(pNextLink[1], *pNextLink) & 0x1ff
+ ((uw_object_hdr_t *)pNextLink)->item_id
|
- CONCAT11(pNextLink[1], pNextLink[0]) & 0x1ff
+ ((uw_object_hdr_t *)pNextLink)->item_id
)
...>
}

@field_10_flags_res@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (*(ushort *)((char *)pNextLink + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (((ushort *)pNextLink)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (((ushort *)pNextLink)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (*(ushort *)pNextLink >> 9) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (*(ushort *)pNextLink & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (*(ushort *)(pNextLink + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (*(ushort *)(pNextLink + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (CONCAT11(pNextLink[1], *pNextLink) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (CONCAT11(pNextLink[1], *pNextLink) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (CONCAT11(pNextLink[1], pNextLink[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (CONCAT11(pNextLink[1], pNextLink[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (*(byte *)((char *)pNextLink + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->flags_res
|
- (*(byte *)((char *)pNextLink + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pNextLink)->flags_res
)
...>
}

@field_10_enchanted@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (*(ushort *)((char *)pNextLink + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (((ushort *)pNextLink)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (((ushort *)pNextLink)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (*(ushort *)pNextLink >> 12) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (*(ushort *)pNextLink & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (*(ushort *)(pNextLink + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (*(ushort *)(pNextLink + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (CONCAT11(pNextLink[1], *pNextLink) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (CONCAT11(pNextLink[1], *pNextLink) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (CONCAT11(pNextLink[1], pNextLink[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (CONCAT11(pNextLink[1], pNextLink[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (*(byte *)((char *)pNextLink + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->enchanted
|
- (*(byte *)((char *)pNextLink + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pNextLink)->enchanted
)
...>
}

@field_10_doordir@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (*(ushort *)((char *)pNextLink + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (((ushort *)pNextLink)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (((ushort *)pNextLink)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (*(ushort *)pNextLink >> 13) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (*(ushort *)pNextLink & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (*(ushort *)(pNextLink + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (*(ushort *)(pNextLink + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (CONCAT11(pNextLink[1], *pNextLink) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (CONCAT11(pNextLink[1], *pNextLink) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (CONCAT11(pNextLink[1], pNextLink[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (CONCAT11(pNextLink[1], pNextLink[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (*(byte *)((char *)pNextLink + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->doordir
|
- (*(byte *)((char *)pNextLink + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pNextLink)->doordir
)
...>
}

@field_10_invisible@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (*(ushort *)((char *)pNextLink + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (((ushort *)pNextLink)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (((ushort *)pNextLink)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (*(ushort *)pNextLink >> 14) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (*(ushort *)pNextLink & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (*(ushort *)(pNextLink + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (*(ushort *)(pNextLink + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (CONCAT11(pNextLink[1], *pNextLink) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (CONCAT11(pNextLink[1], *pNextLink) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (CONCAT11(pNextLink[1], pNextLink[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (CONCAT11(pNextLink[1], pNextLink[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (*(byte *)((char *)pNextLink + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->invisible
|
- (*(byte *)((char *)pNextLink + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pNextLink)->invisible
)
...>
}

@field_10_is_quant@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (*(ushort *)((char *)pNextLink + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (((ushort *)pNextLink)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (((ushort *)pNextLink)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (*(ushort *)pNextLink >> 15) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (*(ushort *)pNextLink & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (*(ushort *)(pNextLink + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (*(ushort *)(pNextLink + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (CONCAT11(pNextLink[1], *pNextLink) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (CONCAT11(pNextLink[1], *pNextLink) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (CONCAT11(pNextLink[1], pNextLink[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (CONCAT11(pNextLink[1], pNextLink[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (*(byte *)((char *)pNextLink + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pNextLink)->is_quant
|
- (*(byte *)((char *)pNextLink + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pNextLink)->is_quant
)
...>
}

@field_10_zpos@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNextLink)->zpos
|
- ((ushort *)pNextLink)[1] & 0x7f
+ ((uw_object_hdr_t *)pNextLink)->zpos
|
- *(ushort *)(pNextLink + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNextLink)->zpos
|
- *(byte *)((char *)pNextLink + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNextLink)->zpos
|
- pNextLink[2] & 0x7f
+ ((uw_object_hdr_t *)pNextLink)->zpos
)
...>
}

@field_10_heading@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->heading
|
- (*(ushort *)((char *)pNextLink + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pNextLink)->heading
|
- (((ushort *)pNextLink)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->heading
|
- (((ushort *)pNextLink)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pNextLink)->heading
|
- (*(ushort *)(pNextLink + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->heading
|
- (*(ushort *)(pNextLink + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pNextLink)->heading
)
...>
}

@field_10_ypos@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->ypos
|
- (*(ushort *)((char *)pNextLink + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNextLink)->ypos
|
- (((ushort *)pNextLink)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->ypos
|
- (((ushort *)pNextLink)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNextLink)->ypos
|
- (*(ushort *)(pNextLink + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->ypos
|
- (*(ushort *)(pNextLink + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNextLink)->ypos
|
- (*(byte *)((char *)pNextLink + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->ypos
|
- (*(byte *)((char *)pNextLink + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pNextLink)->ypos
)
...>
}

@field_10_xpos@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->xpos
|
- (*(ushort *)((char *)pNextLink + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->xpos
|
- (((ushort *)pNextLink)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->xpos
|
- (((ushort *)pNextLink)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->xpos
|
- (*(ushort *)(pNextLink + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->xpos
|
- (*(ushort *)(pNextLink + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNextLink)->xpos
|
- (*(byte *)((char *)pNextLink + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pNextLink)->xpos
|
- (*(byte *)((char *)pNextLink + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pNextLink)->xpos
)
...>
}

@field_10_quality@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->quality
|
- ((ushort *)pNextLink)[2] & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->quality
|
- *(ushort *)(pNextLink + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->quality
|
- *(byte *)((char *)pNextLink + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->quality
|
- pNextLink[4] & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->quality
)
...>
}

@field_10_next@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNextLink)->next
|
- (*(ushort *)((char *)pNextLink + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNextLink)->next
|
- (((ushort *)pNextLink)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNextLink)->next
|
- (((ushort *)pNextLink)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNextLink)->next
|
- (*(ushort *)(pNextLink + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNextLink)->next
|
- (*(ushort *)(pNextLink + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNextLink)->next
)
...>
}

@field_10_owner@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->owner
|
- ((ushort *)pNextLink)[3] & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->owner
|
- *(ushort *)(pNextLink + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->owner
|
- *(byte *)((char *)pNextLink + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->owner
|
- pNextLink[6] & 0x3f
+ ((uw_object_hdr_t *)pNextLink)->owner
)
...>
}

@field_10_link@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNextLink + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNextLink)->link
|
- (*(ushort *)((char *)pNextLink + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNextLink)->link
|
- (((ushort *)pNextLink)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNextLink)->link
|
- (((ushort *)pNextLink)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNextLink)->link
|
- (*(ushort *)(pNextLink + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNextLink)->link
|
- (*(ushort *)(pNextLink + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNextLink)->link
)
...>
}

@field_11_item_id@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)container)->item_id
|
- ((ushort *)container)[0] & 0x1ff
+ ((uw_object_hdr_t *)container)->item_id
|
- *(ushort *)container & 0x1ff
+ ((uw_object_hdr_t *)container)->item_id
)
...>
}

@field_11_flags_res@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)container)->flags_res
|
- (*(ushort *)((char *)container + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)container)->flags_res
|
- (((ushort *)container)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)container)->flags_res
|
- (((ushort *)container)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)container)->flags_res
|
- (*(ushort *)container >> 9) & 0x7
+ ((uw_object_hdr_t *)container)->flags_res
|
- (*(ushort *)container & 0xe00) >> 9
+ ((uw_object_hdr_t *)container)->flags_res
|
- (*(byte *)((char *)container + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)container)->flags_res
|
- (*(byte *)((char *)container + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)container)->flags_res
)
...>
}

@field_11_enchanted@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)container)->enchanted
|
- (*(ushort *)((char *)container + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)container)->enchanted
|
- (((ushort *)container)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)container)->enchanted
|
- (((ushort *)container)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)container)->enchanted
|
- (*(ushort *)container >> 12) & 0x1
+ ((uw_object_hdr_t *)container)->enchanted
|
- (*(ushort *)container & 0x1000) >> 12
+ ((uw_object_hdr_t *)container)->enchanted
|
- (*(byte *)((char *)container + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)container)->enchanted
|
- (*(byte *)((char *)container + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)container)->enchanted
)
...>
}

@field_11_doordir@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)container)->doordir
|
- (*(ushort *)((char *)container + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)container)->doordir
|
- (((ushort *)container)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)container)->doordir
|
- (((ushort *)container)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)container)->doordir
|
- (*(ushort *)container >> 13) & 0x1
+ ((uw_object_hdr_t *)container)->doordir
|
- (*(ushort *)container & 0x2000) >> 13
+ ((uw_object_hdr_t *)container)->doordir
|
- (*(byte *)((char *)container + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)container)->doordir
|
- (*(byte *)((char *)container + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)container)->doordir
)
...>
}

@field_11_invisible@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)container)->invisible
|
- (*(ushort *)((char *)container + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)container)->invisible
|
- (((ushort *)container)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)container)->invisible
|
- (((ushort *)container)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)container)->invisible
|
- (*(ushort *)container >> 14) & 0x1
+ ((uw_object_hdr_t *)container)->invisible
|
- (*(ushort *)container & 0x4000) >> 14
+ ((uw_object_hdr_t *)container)->invisible
|
- (*(byte *)((char *)container + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)container)->invisible
|
- (*(byte *)((char *)container + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)container)->invisible
)
...>
}

@field_11_is_quant@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)container)->is_quant
|
- (*(ushort *)((char *)container + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)container)->is_quant
|
- (((ushort *)container)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)container)->is_quant
|
- (((ushort *)container)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)container)->is_quant
|
- (*(ushort *)container >> 15) & 0x1
+ ((uw_object_hdr_t *)container)->is_quant
|
- (*(ushort *)container & 0x8000) >> 15
+ ((uw_object_hdr_t *)container)->is_quant
|
- (*(byte *)((char *)container + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)container)->is_quant
|
- (*(byte *)((char *)container + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)container)->is_quant
)
...>
}

@field_11_zpos@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0x2) & 0x7f
+ ((uw_object_hdr_t *)container)->zpos
|
- ((ushort *)container)[1] & 0x7f
+ ((uw_object_hdr_t *)container)->zpos
|
- *(byte *)((char *)container + 0x2) & 0x7f
+ ((uw_object_hdr_t *)container)->zpos
)
...>
}

@field_11_heading@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)container)->heading
|
- (*(ushort *)((char *)container + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)container)->heading
|
- (((ushort *)container)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)container)->heading
|
- (((ushort *)container)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)container)->heading
)
...>
}

@field_11_ypos@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)container)->ypos
|
- (*(ushort *)((char *)container + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)container)->ypos
|
- (((ushort *)container)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)container)->ypos
|
- (((ushort *)container)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)container)->ypos
|
- (*(byte *)((char *)container + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)container)->ypos
|
- (*(byte *)((char *)container + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)container)->ypos
)
...>
}

@field_11_xpos@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)container)->xpos
|
- (*(ushort *)((char *)container + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)container)->xpos
|
- (((ushort *)container)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)container)->xpos
|
- (((ushort *)container)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)container)->xpos
|
- (*(byte *)((char *)container + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)container)->xpos
|
- (*(byte *)((char *)container + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)container)->xpos
)
...>
}

@field_11_quality@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0x4) & 0x3f
+ ((uw_object_hdr_t *)container)->quality
|
- ((ushort *)container)[2] & 0x3f
+ ((uw_object_hdr_t *)container)->quality
|
- *(byte *)((char *)container + 0x4) & 0x3f
+ ((uw_object_hdr_t *)container)->quality
)
...>
}

@field_11_next@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)container)->next
|
- (*(ushort *)((char *)container + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)container)->next
|
- (((ushort *)container)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)container)->next
|
- (((ushort *)container)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)container)->next
)
...>
}

@field_11_owner@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0x6) & 0x3f
+ ((uw_object_hdr_t *)container)->owner
|
- ((ushort *)container)[3] & 0x3f
+ ((uw_object_hdr_t *)container)->owner
|
- *(byte *)((char *)container + 0x6) & 0x3f
+ ((uw_object_hdr_t *)container)->owner
)
...>
}

@field_11_link@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)container + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)container)->link
|
- (*(ushort *)((char *)container + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)container)->link
|
- (((ushort *)container)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)container)->link
|
- (((ushort *)container)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)container)->link
)
...>
}

@field_12_item_id@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}

@field_12_flags_res@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (*(byte *)((char *)puVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(byte *)((char *)puVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar1)->flags_res
)
...>
}

@field_12_enchanted@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (*(byte *)((char *)puVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar1)->enchanted
)
...>
}

@field_12_doordir@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (*(byte *)((char *)puVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar1)->doordir
)
...>
}

@field_12_invisible@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (*(byte *)((char *)puVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar1)->invisible
)
...>
}

@field_12_is_quant@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (((ushort *)puVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (((ushort *)puVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(byte *)((char *)puVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar1)->is_quant
)
...>
}

@field_12_zpos@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- *(byte *)((char *)puVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
)
...>
}

@field_12_heading@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}

@field_12_ypos@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (*(byte *)((char *)puVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar1)->ypos
)
...>
}

@field_12_xpos@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (((ushort *)puVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (((ushort *)puVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(byte *)((char *)puVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar1)->xpos
)
...>
}

@field_12_quality@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- *(byte *)((char *)puVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
)
...>
}

@field_12_next@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (((ushort *)puVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (((ushort *)puVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
)
...>
}

@field_12_owner@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- *(byte *)((char *)puVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
)
...>
}

@field_12_link@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
- (((ushort *)puVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (((ushort *)puVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
)
...>
}

@field_13_item_id@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)rune_object)->item_id
|
- ((ushort *)rune_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)rune_object)->item_id
|
- *(ushort *)rune_object & 0x1ff
+ ((uw_object_hdr_t *)rune_object)->item_id
)
...>
}

@field_13_flags_res@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)rune_object)->flags_res
|
- (*(ushort *)((char *)rune_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)rune_object)->flags_res
|
- (((ushort *)rune_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)rune_object)->flags_res
|
- (((ushort *)rune_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)rune_object)->flags_res
|
- (*(ushort *)rune_object >> 9) & 0x7
+ ((uw_object_hdr_t *)rune_object)->flags_res
|
- (*(ushort *)rune_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)rune_object)->flags_res
|
- (*(byte *)((char *)rune_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)rune_object)->flags_res
|
- (*(byte *)((char *)rune_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)rune_object)->flags_res
)
...>
}

@field_13_enchanted@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)rune_object)->enchanted
|
- (*(ushort *)((char *)rune_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)rune_object)->enchanted
|
- (((ushort *)rune_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)rune_object)->enchanted
|
- (((ushort *)rune_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)rune_object)->enchanted
|
- (*(ushort *)rune_object >> 12) & 0x1
+ ((uw_object_hdr_t *)rune_object)->enchanted
|
- (*(ushort *)rune_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)rune_object)->enchanted
|
- (*(byte *)((char *)rune_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)rune_object)->enchanted
|
- (*(byte *)((char *)rune_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)rune_object)->enchanted
)
...>
}

@field_13_doordir@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)rune_object)->doordir
|
- (*(ushort *)((char *)rune_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)rune_object)->doordir
|
- (((ushort *)rune_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)rune_object)->doordir
|
- (((ushort *)rune_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)rune_object)->doordir
|
- (*(ushort *)rune_object >> 13) & 0x1
+ ((uw_object_hdr_t *)rune_object)->doordir
|
- (*(ushort *)rune_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)rune_object)->doordir
|
- (*(byte *)((char *)rune_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)rune_object)->doordir
|
- (*(byte *)((char *)rune_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)rune_object)->doordir
)
...>
}

@field_13_invisible@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)rune_object)->invisible
|
- (*(ushort *)((char *)rune_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)rune_object)->invisible
|
- (((ushort *)rune_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)rune_object)->invisible
|
- (((ushort *)rune_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)rune_object)->invisible
|
- (*(ushort *)rune_object >> 14) & 0x1
+ ((uw_object_hdr_t *)rune_object)->invisible
|
- (*(ushort *)rune_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)rune_object)->invisible
|
- (*(byte *)((char *)rune_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)rune_object)->invisible
|
- (*(byte *)((char *)rune_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)rune_object)->invisible
)
...>
}

@field_13_is_quant@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)rune_object)->is_quant
|
- (*(ushort *)((char *)rune_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)rune_object)->is_quant
|
- (((ushort *)rune_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)rune_object)->is_quant
|
- (((ushort *)rune_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)rune_object)->is_quant
|
- (*(ushort *)rune_object >> 15) & 0x1
+ ((uw_object_hdr_t *)rune_object)->is_quant
|
- (*(ushort *)rune_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)rune_object)->is_quant
|
- (*(byte *)((char *)rune_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)rune_object)->is_quant
|
- (*(byte *)((char *)rune_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)rune_object)->is_quant
)
...>
}

@field_13_zpos@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)rune_object)->zpos
|
- ((ushort *)rune_object)[1] & 0x7f
+ ((uw_object_hdr_t *)rune_object)->zpos
|
- *(byte *)((char *)rune_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)rune_object)->zpos
)
...>
}

@field_13_heading@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)rune_object)->heading
|
- (*(ushort *)((char *)rune_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)rune_object)->heading
|
- (((ushort *)rune_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)rune_object)->heading
|
- (((ushort *)rune_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)rune_object)->heading
)
...>
}

@field_13_ypos@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)rune_object)->ypos
|
- (*(ushort *)((char *)rune_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)rune_object)->ypos
|
- (((ushort *)rune_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)rune_object)->ypos
|
- (((ushort *)rune_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)rune_object)->ypos
|
- (*(byte *)((char *)rune_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)rune_object)->ypos
|
- (*(byte *)((char *)rune_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)rune_object)->ypos
)
...>
}

@field_13_xpos@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)rune_object)->xpos
|
- (*(ushort *)((char *)rune_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)rune_object)->xpos
|
- (((ushort *)rune_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)rune_object)->xpos
|
- (((ushort *)rune_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)rune_object)->xpos
|
- (*(byte *)((char *)rune_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)rune_object)->xpos
|
- (*(byte *)((char *)rune_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)rune_object)->xpos
)
...>
}

@field_13_quality@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)rune_object)->quality
|
- ((ushort *)rune_object)[2] & 0x3f
+ ((uw_object_hdr_t *)rune_object)->quality
|
- *(byte *)((char *)rune_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)rune_object)->quality
)
...>
}

@field_13_next@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)rune_object)->next
|
- (*(ushort *)((char *)rune_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)rune_object)->next
|
- (((ushort *)rune_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)rune_object)->next
|
- (((ushort *)rune_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)rune_object)->next
)
...>
}

@field_13_owner@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)rune_object)->owner
|
- ((ushort *)rune_object)[3] & 0x3f
+ ((uw_object_hdr_t *)rune_object)->owner
|
- *(byte *)((char *)rune_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)rune_object)->owner
)
...>
}

@field_13_link@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)rune_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)rune_object)->link
|
- (*(ushort *)((char *)rune_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)rune_object)->link
|
- (((ushort *)rune_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)rune_object)->link
|
- (((ushort *)rune_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)rune_object)->link
)
...>
}
