@word_0_0@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- ((ushort *)_o)[0]
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *(ushort *)_o
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *(ushort *)(_o + 0)
+ ((uw_object_hdr_t *)_o)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 2)
+ ((uw_object_hdr_t *)_o)->position_word
|
- ((ushort *)_o)[1]
+ ((uw_object_hdr_t *)_o)->position_word
|
- *(ushort *)(_o + 2)
+ ((uw_object_hdr_t *)_o)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 4)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- ((ushort *)_o)[2]
+ ((uw_object_hdr_t *)_o)->chain_word
|
- *(ushort *)(_o + 4)
+ ((uw_object_hdr_t *)_o)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(sprite_partition_by_depth\|sprite_partition_step\|sprite_partition_tmap\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 6)
+ ((uw_object_hdr_t *)_o)->link_word
|
- ((ushort *)_o)[3]
+ ((uw_object_hdr_t *)_o)->link_word
|
- *(ushort *)(_o + 6)
+ ((uw_object_hdr_t *)_o)->link_word
)
...>
}
