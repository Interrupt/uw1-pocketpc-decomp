@word_0_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0)
+ ((uw_object_hdr_t *)c)->type_flags
|
- ((ushort *)c)[0]
+ ((uw_object_hdr_t *)c)->type_flags
|
- *(ushort *)c
+ ((uw_object_hdr_t *)c)->type_flags
|
- c[0]
+ ((uw_object_hdr_t *)c)->type_flags
|
- *c
+ ((uw_object_hdr_t *)c)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 2)
+ ((uw_object_hdr_t *)c)->position_word
|
- ((ushort *)c)[1]
+ ((uw_object_hdr_t *)c)->position_word
|
- c[1]
+ ((uw_object_hdr_t *)c)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 4)
+ ((uw_object_hdr_t *)c)->chain_word
|
- ((ushort *)c)[2]
+ ((uw_object_hdr_t *)c)->chain_word
|
- c[2]
+ ((uw_object_hdr_t *)c)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 6)
+ ((uw_object_hdr_t *)c)->link_word
|
- ((ushort *)c)[3]
+ ((uw_object_hdr_t *)c)->link_word
|
- c[3]
+ ((uw_object_hdr_t *)c)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0)
+ ((uw_object_hdr_t *)nc)->type_flags
|
- ((ushort *)nc)[0]
+ ((uw_object_hdr_t *)nc)->type_flags
|
- *(ushort *)nc
+ ((uw_object_hdr_t *)nc)->type_flags
|
- nc[0]
+ ((uw_object_hdr_t *)nc)->type_flags
|
- *nc
+ ((uw_object_hdr_t *)nc)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 2)
+ ((uw_object_hdr_t *)nc)->position_word
|
- ((ushort *)nc)[1]
+ ((uw_object_hdr_t *)nc)->position_word
|
- nc[1]
+ ((uw_object_hdr_t *)nc)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 4)
+ ((uw_object_hdr_t *)nc)->chain_word
|
- ((ushort *)nc)[2]
+ ((uw_object_hdr_t *)nc)->chain_word
|
- nc[2]
+ ((uw_object_hdr_t *)nc)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 6)
+ ((uw_object_hdr_t *)nc)->link_word
|
- ((ushort *)nc)[3]
+ ((uw_object_hdr_t *)nc)->link_word
|
- nc[3]
+ ((uw_object_hdr_t *)nc)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@word_2_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@word_2_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@word_2_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
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

@word_3_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags
|
- ((ushort *)g_player_object)[0]
+ ((uw_object_hdr_t *)g_player_object)->type_flags
|
- *(ushort *)g_player_object
+ ((uw_object_hdr_t *)g_player_object)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 2)
+ ((uw_object_hdr_t *)g_player_object)->position_word
|
- ((ushort *)g_player_object)[1]
+ ((uw_object_hdr_t *)g_player_object)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word
|
- ((ushort *)g_player_object)[2]
+ ((uw_object_hdr_t *)g_player_object)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 6)
+ ((uw_object_hdr_t *)g_player_object)->link_word
|
- ((ushort *)g_player_object)[3]
+ ((uw_object_hdr_t *)g_player_object)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0)
+ ((uw_object_hdr_t *)pl)->type_flags
|
- ((ushort *)pl)[0]
+ ((uw_object_hdr_t *)pl)->type_flags
|
- *(ushort *)pl
+ ((uw_object_hdr_t *)pl)->type_flags
|
- pl[0]
+ ((uw_object_hdr_t *)pl)->type_flags
|
- *pl
+ ((uw_object_hdr_t *)pl)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 2)
+ ((uw_object_hdr_t *)pl)->position_word
|
- ((ushort *)pl)[1]
+ ((uw_object_hdr_t *)pl)->position_word
|
- pl[1]
+ ((uw_object_hdr_t *)pl)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 4)
+ ((uw_object_hdr_t *)pl)->chain_word
|
- ((ushort *)pl)[2]
+ ((uw_object_hdr_t *)pl)->chain_word
|
- pl[2]
+ ((uw_object_hdr_t *)pl)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 6)
+ ((uw_object_hdr_t *)pl)->link_word
|
- ((ushort *)pl)[3]
+ ((uw_object_hdr_t *)pl)->link_word
|
- pl[3]
+ ((uw_object_hdr_t *)pl)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
)
...>
}

@word_5_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
)
...>
}

@word_5_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
)
...>
}

@word_5_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
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
)
...>
}

@word_6_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- ((ushort *)contents)[0]
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(ushort *)contents
+ ((uw_object_hdr_t *)contents)->type_flags
)
...>
}

@word_6_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 2)
+ ((uw_object_hdr_t *)contents)->position_word
|
- ((ushort *)contents)[1]
+ ((uw_object_hdr_t *)contents)->position_word
)
...>
}

@word_6_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 4)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- ((ushort *)contents)[2]
+ ((uw_object_hdr_t *)contents)->chain_word
)
...>
}

@word_6_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 6)
+ ((uw_object_hdr_t *)contents)->link_word
|
- ((ushort *)contents)[3]
+ ((uw_object_hdr_t *)contents)->link_word
)
...>
}

@word_7_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0)
+ ((uw_object_hdr_t *)nx)->type_flags
|
- ((ushort *)nx)[0]
+ ((uw_object_hdr_t *)nx)->type_flags
|
- *(ushort *)nx
+ ((uw_object_hdr_t *)nx)->type_flags
)
...>
}

@word_7_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 2)
+ ((uw_object_hdr_t *)nx)->position_word
|
- ((ushort *)nx)[1]
+ ((uw_object_hdr_t *)nx)->position_word
)
...>
}

@word_7_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 4)
+ ((uw_object_hdr_t *)nx)->chain_word
|
- ((ushort *)nx)[2]
+ ((uw_object_hdr_t *)nx)->chain_word
)
...>
}

@word_7_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 6)
+ ((uw_object_hdr_t *)nx)->link_word
|
- ((ushort *)nx)[3]
+ ((uw_object_hdr_t *)nx)->link_word
)
...>
}
