@build_object_placement_snapshot_object_tile_x_scaled@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- (((uw_mobile_object_t *)object)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- (((uw_mobile_object_t *)object)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- ((((uw_mobile_object_t *)object)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
)
...>
}

@build_object_placement_snapshot_object_tile_y_scaled@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- (((uw_mobile_object_t *)object)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- (((uw_mobile_object_t *)object)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- ((((uw_mobile_object_t *)object)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
)
...>
}

@settle_mobile_to_immobile_object_tile_x_scaled@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- (((uw_mobile_object_t *)object)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- (((uw_mobile_object_t *)object)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- ((((uw_mobile_object_t *)object)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
)
...>
}

@settle_mobile_to_immobile_object_tile_y_scaled@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- (((uw_mobile_object_t *)object)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- (((uw_mobile_object_t *)object)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- ((((uw_mobile_object_t *)object)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
)
...>
}

@npc_ai_tick_player_rec_tile_x_scaled@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)player_rec)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)player_rec)->tile_x << 3)
|
- (((uw_mobile_object_t *)player_rec)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)player_rec)->tile_x << 3)
|
- (((uw_mobile_object_t *)player_rec)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)player_rec)->tile_x << 3)
|
- ((((uw_mobile_object_t *)player_rec)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)player_rec)->tile_x << 3)
)
...>
}

@npc_ai_tick_player_rec_tile_y_scaled@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)player_rec)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)player_rec)->tile_y << 3)
|
- (((uw_mobile_object_t *)player_rec)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)player_rec)->tile_y << 3)
|
- (((uw_mobile_object_t *)player_rec)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)player_rec)->tile_y << 3)
|
- ((((uw_mobile_object_t *)player_rec)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)player_rec)->tile_y << 3)
)
...>
}

@npc_ai_default_tick_npc_rec_tile_x_scaled@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)npc_rec)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)npc_rec)->tile_x << 3)
|
- (((uw_mobile_object_t *)npc_rec)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)npc_rec)->tile_x << 3)
|
- (((uw_mobile_object_t *)npc_rec)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)npc_rec)->tile_x << 3)
|
- ((((uw_mobile_object_t *)npc_rec)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)npc_rec)->tile_x << 3)
)
...>
}

@npc_ai_default_tick_npc_rec_tile_y_scaled@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)npc_rec)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)npc_rec)->tile_y << 3)
|
- (((uw_mobile_object_t *)npc_rec)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)npc_rec)->tile_y << 3)
|
- (((uw_mobile_object_t *)npc_rec)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)npc_rec)->tile_y << 3)
|
- ((((uw_mobile_object_t *)npc_rec)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)npc_rec)->tile_y << 3)
)
...>
}

@reset_npc_path_cache_iVar1_tile_x_scaled@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)iVar1)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)iVar1)->tile_x << 3)
|
- (((uw_mobile_object_t *)iVar1)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)iVar1)->tile_x << 3)
|
- (((uw_mobile_object_t *)iVar1)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)iVar1)->tile_x << 3)
|
- ((((uw_mobile_object_t *)iVar1)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)iVar1)->tile_x << 3)
)
...>
}

@reset_npc_path_cache_iVar1_tile_y_scaled@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)iVar1)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)iVar1)->tile_y << 3)
|
- (((uw_mobile_object_t *)iVar1)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)iVar1)->tile_y << 3)
|
- (((uw_mobile_object_t *)iVar1)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)iVar1)->tile_y << 3)
|
- ((((uw_mobile_object_t *)iVar1)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)iVar1)->tile_y << 3)
)
...>
}
