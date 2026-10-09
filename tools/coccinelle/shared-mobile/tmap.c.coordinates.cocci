@process_visible_tile_cell__dpp_tile_x_scaled@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)_dpp)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)_dpp)->tile_x << 3)
|
- (((uw_mobile_object_t *)_dpp)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)_dpp)->tile_x << 3)
|
- (((uw_mobile_object_t *)_dpp)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)_dpp)->tile_x << 3)
|
- ((((uw_mobile_object_t *)_dpp)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)_dpp)->tile_x << 3)
)
...>
}

@process_visible_tile_cell__dpp_tile_y_scaled@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)_dpp)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)_dpp)->tile_y << 3)
|
- (((uw_mobile_object_t *)_dpp)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)_dpp)->tile_y << 3)
|
- (((uw_mobile_object_t *)_dpp)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)_dpp)->tile_y << 3)
|
- ((((uw_mobile_object_t *)_dpp)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)_dpp)->tile_y << 3)
)
...>
}

@emit_tile_features_puVar5_tile_x_scaled@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar5)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)puVar5)->tile_x << 3)
|
- (((uw_mobile_object_t *)puVar5)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)puVar5)->tile_x << 3)
|
- (((uw_mobile_object_t *)puVar5)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)puVar5)->tile_x << 3)
|
- ((((uw_mobile_object_t *)puVar5)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)puVar5)->tile_x << 3)
)
...>
}

@emit_tile_features_puVar5_tile_y_scaled@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar5)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)puVar5)->tile_y << 3)
|
- (((uw_mobile_object_t *)puVar5)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)puVar5)->tile_y << 3)
|
- (((uw_mobile_object_t *)puVar5)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)puVar5)->tile_y << 3)
|
- ((((uw_mobile_object_t *)puVar5)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)puVar5)->tile_y << 3)
)
...>
}
