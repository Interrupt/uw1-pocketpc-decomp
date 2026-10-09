@extract_matching_object_from_slot_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, undefined1, undefined4, uw_object_hdr_t;
@@
 ushort *extract_matching_object_from_slot(int category, int subcategory, int quality, short slot, ushort flag)
 {
   ushort uVar1;
   short sVar2;
-   ushort *puVar3;
+   uw_object_hdr_t *puVar3;
   int iVar4;
   char *iVar5;
   uint uVar6;
   ushort uVar7;
   uint uVar8;
   int iVar9;
-   byte *pbVar10;
+   uw_object_hdr_t *pbVar10;
   byte *pbVar11;
   char *local_28;

   iVar4 = (int)slot;
   pbVar11 = &g_equipped_items + iVar4 * 2;
-   pbVar10 = (byte *)0x0;
-   puVar3 = (ushort *)resolve_object_link(pbVar11);
-   if (puVar3 != (ushort *)0x0) {
+   pbVar10 = (uw_object_hdr_t *)0x0;
+   puVar3 = resolve_object_link(pbVar11);
+   if (puVar3 != (uw_object_hdr_t *)0x0) {
     if (iVar4 < 0x13) {
       local_28 = (char *)g_player_object;
     }
     else {
       /* Was `resolve_object_link(g_current_container_record + 8)` -- g_current_container_record is
          a small (12-byte) ce_malloc heap allocation, nowhere near the object arena buffer
          resolve_object_link's own bounds guard checks against (see its own comment)... */
       local_28 = resolve_object_link(&g_current_container_link);
     }
     uVar6 = (uint)(short)category;
     uVar7 = (ushort)subcategory;
     uVar1 = (ushort)quality;
     if ((((((int)uVar6 < 0) && ((short)uVar7 < 0)) && ((short)uVar1 < 0)) ||
-         (((((int)uVar6 < 0 || ((*puVar3 >> 6 & 7) == uVar6)) &&
-           (((short)uVar7 < 0 || (((byte)((byte)*puVar3 >> 4) & 3) == uVar7)))) &&
-          (((short)uVar1 < 0 || (((byte)*puVar3 & 0xf) == uVar1)))))) ||
-        (puVar3 = (ushort *)find_object_in_link_chain(category,subcategory,quality,&local_28), puVar3 != (ushort *)0x0)
+         (((((int)uVar6 < 0 || ((puVar3->object_id >> 6 & 7) == uVar6)) &&
+           (((short)uVar7 < 0 || ((puVar3->object_id >> 4 & 3) == uVar7)))) &&
+          (((short)uVar1 < 0 || ((puVar3->object_id & 0xf) == uVar1)))))) ||
+        (puVar3 = (uw_object_hdr_t *)find_object_in_link_chain(category,subcategory,quality,&local_28), puVar3 != (uw_object_hdr_t *)0x0)
        ) {
-       if (((flag != 0) && ((*puVar3 & 0x8000) != 0)) && ((puVar3[3] & 0x8000) == 0)) {
-         uVar7 = puVar3[3] >> 6;
+       if (((flag != 0) && (puVar3->is_quant != 0)) && ((puVar3->link & 0x200) == 0)) {
+         uVar7 = puVar3->link;
         if ((1 < uVar7) && ((short)flag < (short)uVar7)) {
-           pbVar10 = (byte *)alloc_object_slot(0);
-           ((uw_object_hdr_t *)pbVar10)->type_flags_low = (byte)*puVar3;
-           ((uw_object_hdr_t *)pbVar10)->type_flags_high = *(byte *)((char *)puVar3 + 1);
-           ((uw_object_hdr_t *)pbVar10)->position_word_low = (byte)puVar3[1];
-           ((uw_object_hdr_t *)pbVar10)->position_word_high = *(byte *)((char *)puVar3 + 3);
-           ((uw_object_hdr_t *)pbVar10)->chain_word_low = (byte)puVar3[2];
-           ((uw_object_hdr_t *)pbVar10)->chain_word_high = *(byte *)((char *)puVar3 + 5);
-           ((uw_object_hdr_t *)pbVar10)->link_word_low = (byte)puVar3[3];
-           ((uw_object_hdr_t *)pbVar10)->link_word_high = *(byte *)((char *)puVar3 + 7);
+           pbVar10 = alloc_object_slot(0);
+           pbVar10->type_flags = puVar3->type_flags;
+           pbVar10->position_word = puVar3->position_word;
+           pbVar10->chain_word = puVar3->chain_word;
+           pbVar10->link_word = puVar3->link_word;
           uVar6 = (uint)flag;
           uVar8 = uVar6 * 0x3ff + (uint)uVar7;
-           ((uw_object_hdr_t *)pbVar10)->link_word_low = ((uw_object_hdr_t *)pbVar10)->owner ^ (char)uVar8 * '@';
-           ((uw_object_hdr_t *)pbVar10)->link_word_high = (byte)((uVar8 & 0x3ffffff) >> 2);
-           *(byte *)(puVar3 + 3) = (byte)puVar3[3] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
-           *(byte *)((char *)puVar3 + 7) = (byte)((uVar6 << 0x16) >> 0x18);
-           object_list_insert_head(puVar3 + 2,pbVar10);
+           pbVar10->link = uVar8 & 0x3ff;
+           puVar3->link = uVar6 & 0x3ff;
+           object_list_insert_head(&puVar3->chain_word,pbVar10);
         }
       }
       if ((local_28 == (char *)g_player_object) || (0x13 < iVar4)) {
-         if (pbVar10 == (byte *)0x0) {
+         if (pbVar10 == (uw_object_hdr_t *)0x0) {
           uVar7 = *pbVar11 & 0x3f;
         }
         else {
           sVar2 = encode_object_slot_index(pbVar10);
           uVar7 = *pbVar11 & 0x3f | sVar2 << 6;
         }
         *pbVar11 = (byte)uVar7;
         (&DAT_00202951)[iVar4 * 2] = (char)(uVar7 >> 8);
       }
-       object_list_unlink(local_28 + 6,puVar3);
-       iVar4 = calculate_object_weight((uw_object_hdr_t *)puVar3);
+       object_list_unlink(&((uw_object_hdr_t *)local_28)->link_word,puVar3);
+       iVar4 = calculate_object_weight(puVar3);
       g_player_carry_weight = g_player_carry_weight - (short)iVar4;
       if (g_current_container_record == 0) {
-         return puVar3;
+         return (ushort *)puVar3;
       }
       sVar2 = encode_object_slot_index(local_28);
       if ((uint)(*(ushort *)(g_current_container_record + 8) >> 6) != (int)sVar2) {
-         return puVar3;
+         return (ushort *)puVar3;
       }
       sVar2 = encode_object_slot_index(puVar3);
       iVar9 = 0x14;
       do {
         if ((uint)(*(ushort *)(&g_equipped_items + iVar9 * 2) >> 6) == (int)sVar2) {
-           if (pbVar10 == (byte *)0x0) {
+           if (pbVar10 == (uw_object_hdr_t *)0x0) {
             uVar6 = 0;
           }
           else {
             sVar2 = encode_object_slot_index(pbVar10);
             uVar6 = (uint)sVar2;
           }
           iVar9 = (int)(short)iVar9;
           (&g_equipped_items)[iVar9 * 2] =
                (&g_equipped_items)[iVar9 * 2] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
           iVar5 = g_current_container_record;
           (&DAT_00202951)[iVar9 * 2] = (char)((uVar6 << 0x16) >> 0x18);
           /* Legacy truncated "prev" walk -- same fix as
              place_object_in_backpack_slot's sibling copy above (search
              "still broken for genuine container nesting"). */
           for (; iVar5 != 0; iVar5 = *(char **)(iVar5 + 0x14)) {
             iVar9 = *(short *)(iVar5 + 10) - iVar4;
             *(char *)(iVar5 + 10) = (char)iVar9;
             *(char *)(iVar5 + 0xb) = (char)((uint)iVar9 >> 8);
           }
-           return puVar3;
+           return (ushort *)puVar3;
         }
         iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
       } while (iVar9 < 0x1c);
-       return puVar3;
+       return (ushort *)puVar3;
     }
   }
   return (ushort *)0x0;
 }
@reduce_object_count_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, undefined1, undefined4, uw_object_hdr_t;
@@
 int reduce_object_count(ushort *stack_object, uint amount)
 {
   short sVar1;
   ushort uVar2;
   int iVar3;
   undefined4 uVar4;
-   undefined1 *puVar5;
-   undefined1 *puVar6;
+   uw_object_hdr_t *puVar5;
+   uw_object_hdr_t *puVar6;
   int iVar7;
   int iVar8;
   uint uVar9;
   char *pObj;

   /* Dropped argument: calculate_object_weight dereferences its own declared stack_object immediately --
      called bare here, same idiom as this whole session's other fixes. */
   iVar3 = calculate_object_weight((uw_object_hdr_t *)stack_object);
   uVar4 = encode_object_slot_index(stack_object);
   iVar7 = 0;
   do {
     if ((uint)(*(ushort *)(&g_equipped_items + iVar7 * 2) >> 6) == (int)(short)uVar4) break;
     iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
   } while (iVar7 < 0x1c);
   iVar8 = (int)(short)iVar7;
   sVar1 = (short)amount;
   if (iVar8 < 0x1c) {
     extract_and_refresh_slot_item(0xffffffff,0xffffffff,0xffffffff,iVar7,sVar1);
     if (iVar8 < 0x13) {
       redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar8]);
     }
     else {
       repopulate_container_grid_slots();
       refresh_container_view();
       /* Was `for (iVar7 = g_current_container_record; ...)` -- truncated g_current_container_record
          (a real char* global) into a 32-bit int, then rebuilt a bogus "next" address out of raw
          bytes at iVar7+4..+7 instead of resolving the object's real next-link via... */
       for (pObj = g_current_container_record; pObj != NULL;
           pObj = (*(ushort *)(pObj + 4) & 0xffc0) == 0 ? NULL :
                  (char *)resolve_object_link((ushort *)(pObj + 4))) {
         iVar8 = *(short *)(pObj + 10) - iVar3;
         *(char *)(pObj + 10) = (char)iVar8;
         *(char *)(pObj + 0xb) = (char)((uint)iVar8 >> 8);
       }
     }
   }
   else {
-     puVar5 = (undefined1 *)find_object_by_encoded_slot_in_chain((char *)g_player_object + 6,1,uVar4);
-     if (puVar5 == (undefined1 *)0x0) {
+     puVar5 = find_object_by_encoded_slot_in_chain(&g_player_object->hdr.link_word,1,uVar4);
+     if (puVar5 == (uw_object_hdr_t *)0x0) {
       return 0;
     }
-     if (((0 < sVar1) && (((uw_object_hdr_t *)puVar5)->is_quant != 0)) && ((((uw_object_hdr_t *)puVar5)->link & 0x200) == 0)) {
-       uVar2 = ((uw_object_hdr_t *)puVar5)->link;
+     if (((0 < sVar1) && (puVar5->is_quant != 0)) && ((puVar5->link & 0x200) == 0)) {
+       uVar2 = puVar5->link;
       if ((1 < uVar2) && (sVar1 < (short)uVar2)) {
-         puVar6 = (undefined1 *)alloc_object_slot(0);
-         ((uw_object_hdr_t *)puVar6)->type_flags = ((uw_object_hdr_t *)puVar5)->type_flags;
-         ((uw_object_hdr_t *)puVar6)->position_word = ((uw_object_hdr_t *)puVar5)->position_word;
-         ((uw_object_hdr_t *)puVar6)->chain_word = ((uw_object_hdr_t *)puVar5)->chain_word;
-         ((uw_object_hdr_t *)puVar6)->link_word = ((uw_object_hdr_t *)puVar5)->link_word;
+         puVar6 = alloc_object_slot(0);
+         puVar6->type_flags = puVar5->type_flags;
+         puVar6->position_word = puVar5->position_word;
+         puVar6->chain_word = puVar5->chain_word;
+         puVar6->link_word = puVar5->link_word;
         uVar9 = (amount & 0xffff) * 0x3ff + (uint)uVar2;
-         ((uw_object_hdr_t *)puVar6)->link_word_low = ((uw_object_hdr_t *)puVar6)->owner ^ (char)uVar9 * '@';
-         ((uw_object_hdr_t *)puVar6)->link_word_high = (char)((uVar9 & 0x3ffffff) >> 2);
-         ((uw_object_hdr_t *)puVar5)->link_word_low = ((uw_object_hdr_t *)puVar5)->owner | (byte)((amount & 0x3ff) << 6);
-         ((uw_object_hdr_t *)puVar5)->link_word_high = (char)((amount << 0x16) >> 0x18);
-         object_list_insert_head(puVar5 + 4,puVar6);
+         puVar6->link = uVar9 & 0x3ff;
+         puVar5->link = amount & 0x3ff;
+         object_list_insert_head(&puVar5->chain_word,puVar6);
       }
     }
     object_list_unlink(DAT_002046b4,puVar5);
     g_player_carry_weight = g_player_carry_weight - (short)iVar3;
     /* This else-branch (reached when the object isn't found among the 28
        direct/open-container-borrowed slots at all, e.g. nested two containers deep) unlinked the
        object but... */
     repopulate_container_grid_slots();
     refresh_container_view();
     redraw_inventory_widget(0x13);
     refresh_player_equipment_effects();
   }
   return 1;
 }
