@demomode_pump_pl_tile_x_scaled@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)pl)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)pl)->tile_x << 3)
|
- (((uw_mobile_object_t *)pl)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)pl)->tile_x << 3)
|
- (((uw_mobile_object_t *)pl)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)pl)->tile_x << 3)
|
- ((((uw_mobile_object_t *)pl)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)pl)->tile_x << 3)
)
...>
}

@demomode_pump_pl_tile_y_scaled@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)pl)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)pl)->tile_y << 3)
|
- (((uw_mobile_object_t *)pl)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)pl)->tile_y << 3)
|
- (((uw_mobile_object_t *)pl)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)pl)->tile_y << 3)
|
- ((((uw_mobile_object_t *)pl)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)pl)->tile_y << 3)
)
...>
}
