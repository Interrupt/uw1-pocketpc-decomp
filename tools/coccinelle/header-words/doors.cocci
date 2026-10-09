@word_0_0@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)door_texture + 0)
+ ((uw_object_hdr_t *)door_texture)->type_flags
|
- ((ushort *)door_texture)[0]
+ ((uw_object_hdr_t *)door_texture)->type_flags
|
- *(ushort *)door_texture
+ ((uw_object_hdr_t *)door_texture)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)door_texture + 2)
+ ((uw_object_hdr_t *)door_texture)->position_word
|
- ((ushort *)door_texture)[1]
+ ((uw_object_hdr_t *)door_texture)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)door_texture + 4)
+ ((uw_object_hdr_t *)door_texture)->chain_word
|
- ((ushort *)door_texture)[2]
+ ((uw_object_hdr_t *)door_texture)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(spawn_scheduled_door_texture_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)door_texture + 6)
+ ((uw_object_hdr_t *)door_texture)->link_word
|
- ((ushort *)door_texture)[3]
+ ((uw_object_hdr_t *)door_texture)->link_word
)
...>
}
