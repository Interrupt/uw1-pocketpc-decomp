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
)
...>
}
