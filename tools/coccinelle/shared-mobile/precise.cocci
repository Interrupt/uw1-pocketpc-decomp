@build_object_placement_snapshot_object_precise_x@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0xb)
+ ((uw_projectile_object_t *)object)->precise_x
)
...>
}

@build_object_placement_snapshot_object_precise_y@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0xd)
+ ((uw_projectile_object_t *)object)->precise_y
)
...>
}

@build_object_placement_snapshot_object_precise_z@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0xf)
+ ((uw_projectile_object_t *)object)->precise_z
)
...>
}

@settle_mobile_to_immobile_object_source_slot@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)object[9]
+ ((uw_projectile_object_t *)object)->source_slot
)
...>
}

@reallocate_object_to_arena_puVar2_debug_precise_z@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0xf)
+ (short)((uw_projectile_object_t *)puVar2)->precise_z
)
...>
}

@emit_tile_features_puVar5_precise_z@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar5 + 0xf)
+ (short)((uw_projectile_object_t *)puVar5)->precise_z
)
...>
}
