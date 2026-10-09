@word_0_0@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0)
+ ((uw_object_hdr_t *)obj)->type_flags
|
- ((ushort *)obj)[0]
+ ((uw_object_hdr_t *)obj)->type_flags
|
- *(ushort *)obj
+ ((uw_object_hdr_t *)obj)->type_flags
|
- obj[0]
+ ((uw_object_hdr_t *)obj)->type_flags
|
- *obj
+ ((uw_object_hdr_t *)obj)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 2)
+ ((uw_object_hdr_t *)obj)->position_word
|
- ((ushort *)obj)[1]
+ ((uw_object_hdr_t *)obj)->position_word
|
- obj[1]
+ ((uw_object_hdr_t *)obj)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 4)
+ ((uw_object_hdr_t *)obj)->chain_word
|
- ((ushort *)obj)[2]
+ ((uw_object_hdr_t *)obj)->chain_word
|
- obj[2]
+ ((uw_object_hdr_t *)obj)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(uw_debug_force_item_id_once\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 6)
+ ((uw_object_hdr_t *)obj)->link_word
|
- ((ushort *)obj)[3]
+ ((uw_object_hdr_t *)obj)->link_word
|
- obj[3]
+ ((uw_object_hdr_t *)obj)->link_word
)
...>
}
