@word_0_0@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((ushort *)iVar1)[0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)(iVar1 + 0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((ushort *)iVar1)[1]
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)(iVar1 + 2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((ushort *)iVar1)[2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)(iVar1 + 4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((ushort *)iVar1)[3]
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)(iVar1 + 6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(debug_force_rest_action\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- ((ushort *)puVar1)[0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(ushort *)puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- puVar1[0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(debug_force_rest_action\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- ((ushort *)puVar1)[1]
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- puVar1[1]
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(debug_force_rest_action\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- ((ushort *)puVar1)[2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- puVar1[2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(debug_force_rest_action\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- ((ushort *)puVar1)[3]
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- puVar1[3]
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}
