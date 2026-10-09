@build_collision_height_field_for_object_object_tile_x_scaled@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@build_collision_height_field_for_object_object_tile_y_scaled@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
