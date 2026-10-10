@word_0_0@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)object
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[1]
+ ((uw_object_hdr_t *)object)->position_word
|
- object[1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[3]
+ ((uw_object_hdr_t *)object)->link_word
|
- object[3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- ((ushort *)puVar7)[0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(ushort *)puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- puVar7[0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- ((ushort *)puVar7)[1]
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- puVar7[1]
+ ((uw_object_hdr_t *)puVar7)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- ((ushort *)puVar7)[2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- puVar7[2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- ((ushort *)puVar7)[3]
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- puVar7[3]
+ ((uw_object_hdr_t *)puVar7)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- ((ushort *)puVar4)[0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(ushort *)puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- puVar4[0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- ((ushort *)puVar4)[1]
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- puVar4[1]
+ ((uw_object_hdr_t *)puVar4)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- ((ushort *)puVar4)[2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- puVar4[2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- ((ushort *)puVar4)[3]
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- puVar4[3]
+ ((uw_object_hdr_t *)puVar4)->link_word
)
...>
}
