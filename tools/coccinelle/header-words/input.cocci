@word_0_0@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- ((ushort *)uVar11)[0]
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *(ushort *)uVar11
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- uVar11[0]
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *uVar11
+ ((uw_object_hdr_t *)uVar11)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 2)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- ((ushort *)uVar11)[1]
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- uVar11[1]
+ ((uw_object_hdr_t *)uVar11)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 4)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- ((ushort *)uVar11)[2]
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- uVar11[2]
+ ((uw_object_hdr_t *)uVar11)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 6)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- ((ushort *)uVar11)[3]
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- uVar11[3]
+ ((uw_object_hdr_t *)uVar11)->link_word
)
...>
}
