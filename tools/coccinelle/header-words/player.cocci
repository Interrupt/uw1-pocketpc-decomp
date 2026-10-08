@word_0_0@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- ((ushort *)puVar5)[0]
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *(ushort *)puVar5
+ ((uw_object_hdr_t *)puVar5)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 2)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- ((ushort *)puVar5)[1]
+ ((uw_object_hdr_t *)puVar5)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 4)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- ((ushort *)puVar5)[2]
+ ((uw_object_hdr_t *)puVar5)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 6)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- ((ushort *)puVar5)[3]
+ ((uw_object_hdr_t *)puVar5)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- ((ushort *)pNewObj)[0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- *(ushort *)pNewObj
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- *(ushort *)(pNewObj + 0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- ((ushort *)pNewObj)[1]
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- *(ushort *)(pNewObj + 2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- ((ushort *)pNewObj)[2]
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- *(ushort *)(pNewObj + 4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- ((ushort *)pNewObj)[3]
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- *(ushort *)(pNewObj + 6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
)
...>
}
