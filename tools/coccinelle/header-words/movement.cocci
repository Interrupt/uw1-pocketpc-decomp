@word_0_0@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((ushort *)puVar2)[0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- puVar2[0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((ushort *)puVar2)[1]
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- puVar2[1]
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((ushort *)puVar2)[2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- puVar2[2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((ushort *)puVar2)[3]
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- puVar2[3]
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0)
+ ((uw_object_hdr_t *)psVar3)->type_flags
|
- ((ushort *)psVar3)[0]
+ ((uw_object_hdr_t *)psVar3)->type_flags
|
- *(ushort *)psVar3
+ ((uw_object_hdr_t *)psVar3)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 2)
+ ((uw_object_hdr_t *)psVar3)->position_word
|
- ((ushort *)psVar3)[1]
+ ((uw_object_hdr_t *)psVar3)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 4)
+ ((uw_object_hdr_t *)psVar3)->chain_word
|
- ((ushort *)psVar3)[2]
+ ((uw_object_hdr_t *)psVar3)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 6)
+ ((uw_object_hdr_t *)psVar3)->link_word
|
- ((ushort *)psVar3)[3]
+ ((uw_object_hdr_t *)psVar3)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@word_2_1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@word_2_2@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@word_2_3@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@word_3_0@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- ((ushort *)uVar4)[0]
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(ushort *)uVar4
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(ushort *)(uVar4 + 0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 2)
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- ((ushort *)uVar4)[1]
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- *(ushort *)(uVar4 + 2)
+ ((uw_object_hdr_t *)uVar4)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- ((ushort *)uVar4)[2]
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- *(ushort *)(uVar4 + 4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 6)
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- ((ushort *)uVar4)[3]
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- *(ushort *)(uVar4 + 6)
+ ((uw_object_hdr_t *)uVar4)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- ((ushort *)uVar1)[0]
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(ushort *)uVar1
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(ushort *)(uVar1 + 0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 2)
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- ((ushort *)uVar1)[1]
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- *(ushort *)(uVar1 + 2)
+ ((uw_object_hdr_t *)uVar1)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- ((ushort *)uVar1)[2]
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- *(ushort *)(uVar1 + 4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 6)
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- ((ushort *)uVar1)[3]
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- *(ushort *)(uVar1 + 6)
+ ((uw_object_hdr_t *)uVar1)->link_word
)
...>
}
