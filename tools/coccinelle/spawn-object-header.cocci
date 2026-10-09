@spawn_header@
typedef uw_object_hdr_t, uint, undefined1, byte;
@@
- uw_object_hdr_t *spawn_new_object(uint object_type, int region)
- {
-   undefined1 uVar1;
-   byte bVar2;
-   undefined1 *puVar3;
-   uint uVar4;
-   uint uVar5;
-
-   puVar3 = (undefined1 *)alloc_object_slot(region);
-   if (puVar3 != (undefined1 *)0x0) {
-     puVar3[2] = 0;
-     puVar3[3] = 0x6c;
-     uVar4 = ((byte)puVar3[1] & 0x80) << 8 ^ object_type & 0x1ff;
-     uVar1 = (undefined1)(object_type & 0x1ff);
-     *puVar3 = uVar1;
-     bVar2 = (byte)(uVar4 >> 8);
-     puVar3[1] = bVar2;
-     puVar3[4] = 0x28;
-     puVar3[5] = 0;
-     uVar5 = CONCAT11(puVar3[7],puVar3[6]) & 0xffc0;
-     puVar3[6] = (char)uVar5;
-     puVar3[7] = (char)(uVar5 >> 8);
-     if (((g_object_type_props[(short)object_type].flags & 0xc0) == 0) ||
-         ((g_object_type_props[(short)object_type].flags & 0xc0) == 0x80)) {
-       puVar3[6] = 0x40;
-       puVar3[7] = 0;
-       *puVar3 = uVar1;
-       puVar3[1] = bVar2 | 0x80;
-     }
-     else {
-       uVar4 = uVar4 & 0x7fff;
-       *puVar3 = (char)uVar4;
-       puVar3[1] = (char)(uVar4 >> 8);
-       puVar3[6] = 0;
-       puVar3[7] = 0;
-     }
-   }
-   return puVar3;
- }
+ uw_object_hdr_t *spawn_new_object(uint object_type, int region)
+ {
+   uw_object_hdr_t *puVar3;
+
+   puVar3 = alloc_object_slot(region);
+   if (puVar3 != NULL) {
+     puVar3->position_word = 0x6c00;
+     puVar3->type_flags = (puVar3->type_flags & 0x8000) ^ (object_type & 0x1ff);
+     puVar3->chain_word = 0x28;
+     puVar3->owner = 0;
+     if (((g_object_type_props[(short)object_type].flags & 0xc0) == 0) ||
+         ((g_object_type_props[(short)object_type].flags & 0xc0) == 0x80)) {
+       puVar3->link_word = 0x40;
+       puVar3->is_quant = 1;
+     }
+     else {
+       puVar3->is_quant = 0;
+       puVar3->link_word = 0;
+     }
+   }
+   return puVar3;
+ }
