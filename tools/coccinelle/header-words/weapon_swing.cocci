@word_0_0@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((ushort *)puVar6)[0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- puVar6[0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((ushort *)puVar6)[1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- puVar6[1]
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((ushort *)puVar6)[2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- puVar6[2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((ushort *)puVar6)[3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- puVar6[3]
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}
