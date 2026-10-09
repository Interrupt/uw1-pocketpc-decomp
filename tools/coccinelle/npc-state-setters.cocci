@npc_set_walk_target_fields@
typedef ushort, byte, uint, undefined2;
@@
- void npc_set_walk_target(byte goal, uint goal_target, byte attitude)
- {
-   ushort uVar1;
-   uint uVar2;
-
-   uVar1 = DAT_0010190c->target_word;
-   if ((((uint)goal != (uVar1 & 0x3f)) || ((goal_target & 0xff) != (uVar1 & 0xfc0) >> 6)) ||
-      (attitude != *(byte *)((char *)DAT_0010190c + 0xd) >> 4)) {
-     *(byte *)((char *)DAT_0010190c + 0xf) = ((byte)uVar1 ^ goal) & 0x3f ^ (byte)uVar1;
-     *(char *)((char *)DAT_0010190c + 0x10) = (char)(uVar1 >> 8);
-     uVar2 = DAT_0010190c->target_word & 0xf03f | (goal_target & 0x3f) << 6;
-     *(char *)((char *)DAT_0010190c + 0xf) = (char)uVar2;
-     *(char *)((char *)DAT_0010190c + 0x10) = (char)(uVar2 >> 8);
-     uVar2 = DAT_0010190c->status_word & 0xff0f;
-     *(byte *)((char *)DAT_0010190c + 0xd) = (byte)uVar2 | attitude << 4;
-     *(char *)((char *)DAT_0010190c + 0xe) = (char)(uVar2 >> 8);
-     DAT_0010190c->heading_flags = DAT_0010190c->heading_flags | 0x20;
-     DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0xbf;
-   }
- }
+ void npc_set_walk_target(byte goal, uint goal_target, byte attitude)
+ {
+   if ((((uint)goal != DAT_0010190c->npc_target_tile_x) ||
+        ((goal_target & 0xff) != DAT_0010190c->npc_target_tile_y)) ||
+       (attitude != ((DAT_0010190c->status_word >> 4) & 0xf))) {
+     DAT_0010190c->npc_target_tile_x = goal;
+     DAT_0010190c->npc_target_tile_y = goal_target;
+     DAT_0010190c->status_word = (DAT_0010190c->status_word & 0xff0f) |
+                                ((attitude & 0xf) << 4);
+     DAT_0010190c->heading_flags = DAT_0010190c->heading_flags | 0x20;
+     DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0xbf;
+   }
+ }

@npc_set_goal_fields@
typedef ushort, byte, uint, undefined2;
@@
- void npc_set_goal(byte goal, uint goal_target)
- {
-   undefined2 uVar1;
-   byte bVar2;
-   uint uVar3;
-
-   if ((DAT_0010190c->npc_goal) == 4) {
-     uVar1 = DAT_0010190c->status_word;
-     bVar2 = (byte)uVar1;
-     *(byte *)((char *)DAT_0010190c + 0xd) = (bVar2 ^ *(byte *)((char *)DAT_0010190c + 0xb)) & 0xf ^ bVar2;
-     *(char *)((char *)DAT_0010190c + 0xe) = (char)((ushort)uVar1 >> 8);
-   }
-   uVar3 = DAT_0010190c->goal_word & 0xfff0;
-   *(byte *)((char *)DAT_0010190c + 0xb) = goal & 0xf | (byte)uVar3;
-   *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar3 >> 8);
-   uVar3 = DAT_0010190c->goal_word & 0xf00f | (goal_target & 0xff) << 4;
-   *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar3;
-   *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar3 >> 8);
- }
+ void npc_set_goal(byte goal, uint goal_target)
+ {
+   if (DAT_0010190c->npc_goal == 4) {
+     DAT_0010190c->npc_level = DAT_0010190c->npc_goal;
+   }
+   DAT_0010190c->npc_goal = goal;
+   DAT_0010190c->npc_gtarg = goal_target;
+ }
