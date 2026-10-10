@word_0_0@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_obj + 0)
+ ((uw_object_hdr_t *)_obj)->type_flags
|
- ((ushort *)_obj)[0]
+ ((uw_object_hdr_t *)_obj)->type_flags
|
- *(ushort *)_obj
+ ((uw_object_hdr_t *)_obj)->type_flags
|
- *(ushort *)(_obj + 0)
+ ((uw_object_hdr_t *)_obj)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_obj + 2)
+ ((uw_object_hdr_t *)_obj)->position_word
|
- ((ushort *)_obj)[1]
+ ((uw_object_hdr_t *)_obj)->position_word
|
- *(ushort *)(_obj + 2)
+ ((uw_object_hdr_t *)_obj)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_obj + 4)
+ ((uw_object_hdr_t *)_obj)->chain_word
|
- ((ushort *)_obj)[2]
+ ((uw_object_hdr_t *)_obj)->chain_word
|
- *(ushort *)(_obj + 4)
+ ((uw_object_hdr_t *)_obj)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(load_level_object_table\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_obj + 6)
+ ((uw_object_hdr_t *)_obj)->link_word
|
- ((ushort *)_obj)[3]
+ ((uw_object_hdr_t *)_obj)->link_word
|
- *(ushort *)(_obj + 6)
+ ((uw_object_hdr_t *)_obj)->link_word
)
...>
}
