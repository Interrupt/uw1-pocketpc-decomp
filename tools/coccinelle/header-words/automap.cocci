@word_0_0@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0)
+ ((uw_object_hdr_t *)pp)->type_flags
|
- ((ushort *)pp)[0]
+ ((uw_object_hdr_t *)pp)->type_flags
|
- *(ushort *)pp
+ ((uw_object_hdr_t *)pp)->type_flags
|
- pp[0]
+ ((uw_object_hdr_t *)pp)->type_flags
|
- *pp
+ ((uw_object_hdr_t *)pp)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 2)
+ ((uw_object_hdr_t *)pp)->position_word
|
- ((ushort *)pp)[1]
+ ((uw_object_hdr_t *)pp)->position_word
|
- pp[1]
+ ((uw_object_hdr_t *)pp)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 4)
+ ((uw_object_hdr_t *)pp)->chain_word
|
- ((ushort *)pp)[2]
+ ((uw_object_hdr_t *)pp)->chain_word
|
- pp[2]
+ ((uw_object_hdr_t *)pp)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 6)
+ ((uw_object_hdr_t *)pp)->link_word
|
- ((ushort *)pp)[3]
+ ((uw_object_hdr_t *)pp)->link_word
|
- pp[3]
+ ((uw_object_hdr_t *)pp)->link_word
)
...>
}
