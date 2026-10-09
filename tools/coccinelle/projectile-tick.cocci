@projectile_tick_fields@
typedef uw_projectile_object_t, ushort, byte, undefined2;
@@
- int mobile_object_tick()
- {
-   byte bVar1;
-   int iVar2;
-   char *tile_rec;  /* tilemap_lookup / discard_misplaced_object pointer results */
-   if (((char)((ushort *)DAT_0010190c)[4] == '\0') &&
-       ((g_object_type_props[(DAT_0010190c->hdr.object_id)].quality_flags & 0xc) < 0xc)) {
-     tile_rec = (char *)tilemap_lookup(((ushort *)DAT_0010190c)[0xb] >> 10,
-                                       (((ushort *)DAT_0010190c)[0xb] & 0x3f0) >> 4);
-     tile_rec = (char *)discard_misplaced_object(tile_rec + 2,DAT_0010190c,0);
-     if (tile_rec == 0) {
-       return 0;
-     }
-     DAT_0010190c->npc_hp = 1;
-   }
-   DAT_002049a0 = 0x1000;
-   if ((g_object_type_props[(DAT_0010190c->hdr.object_id)].flags & 8) == 0) {
-     DAT_002049a0 = 0;
-   }
-   build_object_placement_snapshot(DAT_0010190c,&DAT_00204920);
-   apply_placement_collision_sweep(&DAT_00204920,&DAT_002049a0);
-   DAT_0010144c = (ushort)(*(byte *)((char *)DAT_0010190c + 0x17) >> 2);
-   DAT_00101454 = (undefined2)((((ushort *)DAT_0010190c)[0xb] & 0x3f0) >> 4);
-   iVar2 = sync_object_tile_position(DAT_0010190c,&DAT_00204920);
-   if (iVar2 != 0) {
-     bVar1 = DAT_0010190c->movement_flags;
-     DAT_0010190c->movement_flags = ((DAT_0010190c->attack_pitch & 7) + bVar1 ^ bVar1) & 0xf ^ bVar1;
-   }
-   return iVar2;
- }
+ int mobile_object_tick()
+ {
+   byte bVar1;
+   int iVar2;
+   char *tile_rec;/* tilemap_lookup / discard_misplaced_object pointer results */
+   if (((char)((uw_projectile_object_t *)DAT_0010190c)->lifetime == '\0') && ((g_object_type_props[(((uw_projectile_object_t *)DAT_0010190c)->hdr.object_id)].quality_flags & 0xc) < 0xc)) {
+     tile_rec = (char *)tilemap_lookup(((uw_projectile_object_t *)DAT_0010190c)->tile_x, ((uw_projectile_object_t *)DAT_0010190c)->tile_y);
+     tile_rec = (char *)discard_misplaced_object(tile_rec + 2, ((uw_projectile_object_t *)DAT_0010190c), 0);
+     if (tile_rec == 0) {
+       return 0;
+     }
+     ((uw_projectile_object_t *)DAT_0010190c)->lifetime = 1;
+   }
+   DAT_002049a0 = 0x1000;
+   if ((g_object_type_props[(((uw_projectile_object_t *)DAT_0010190c)->hdr.object_id)].flags & 8) == 0) {
+     DAT_002049a0 = 0;
+   }
+   build_object_placement_snapshot(((uw_projectile_object_t *)DAT_0010190c), &DAT_00204920);
+   apply_placement_collision_sweep(&DAT_00204920, &DAT_002049a0);
+   DAT_0010144c = (ushort)(((uw_projectile_object_t *)DAT_0010190c)->tile_x);
+   DAT_00101454 = (undefined2)(((uw_projectile_object_t *)DAT_0010190c)->tile_y);
+   iVar2 = sync_object_tile_position(((uw_projectile_object_t *)DAT_0010190c), &DAT_00204920);
+   if (iVar2 != 0) {
+     bVar1 = ((uw_projectile_object_t *)DAT_0010190c)->movement_flags;
+     ((uw_projectile_object_t *)DAT_0010190c)->movement_flags = ((((uw_projectile_object_t *)DAT_0010190c)->pitch_flags & 7) + bVar1 ^ bVar1) & 0xf ^ bVar1;
+   }
+   return iVar2;
+ }
