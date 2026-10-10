@item_scatter_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, undefined1, undefined4, uw_object_hdr_t;
@@
 void complete_use_item_scatter_spawn(short *target, int clicked, int confirmed)
 {
   int uw_ord2005_rem_168 = 0;
   undefined1 uVar1;
   byte bVar2;
   ushort uVar3;
   short sVar4;
   undefined4 uVar5;
   int iVar6;
   ushort *found_item;
   char *iVar7;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
-   ushort *puVar8;
+   uw_object_hdr_t *puVar8;
   uint uVar9;
   uint uVar10;
   uint extraout_r1;
   uint uVar11;

   pop_cursor_icon(3);
   g_selected_object = 0;
   g_cursor_holding_state = 0;
   if ((clicked != 0) && (confirmed == 0)) {
     uVar5 = encode_object_slot_index(target);
     found_item = find_object_by_encoded_slot_in_chain((char *)g_player_object + 6,1,uVar5);
     if (found_item == 0) {
-       uVar11 = (int)*target & 0x1ff;
+       uVar11 = ((uw_object_hdr_t *)target)->object_id;
       if (((ushort)uVar11 < 0x153) || (0x156 < (ushort)uVar11)) {
         print_scroll_message_by_id(0x84);
       }
       else {
         print_scroll_message_by_id(0x87);
         iVar7 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
         sVar4 = rand_below(2);
         iVar6 = ((int)sVar4 - uVar11) + 0x156;
         while( true ) {
           iVar6 = iVar6 * 0x10000 >> 0x10;
-           if ((iVar6 < 1) || (puVar8 = (ushort *)spawn_new_object(1,0), puVar8 == (ushort *)0x0)) break;
-           ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)(char)*target;
-           ((uw_object_hdr_t *)puVar8)->type_flags_high = *(undefined1 *)((char *)target + 1);
-           ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)(char)target[1];
-           ((uw_object_hdr_t *)puVar8)->position_word_high = *(undefined1 *)((char *)target + 3);
-           ((uw_object_hdr_t *)puVar8)->chain_word_low = (byte)(char)target[2];
-           ((uw_object_hdr_t *)puVar8)->chain_word_high = *(undefined1 *)((char *)target + 5);
-           ((uw_object_hdr_t *)puVar8)->link_word_low = (byte)(char)target[3];
-           ((uw_object_hdr_t *)puVar8)->link_word_high = *(undefined1 *)((char *)target + 7);
+           if ((iVar6 < 1) || (puVar8 = spawn_new_object(1,0), puVar8 == (uw_object_hdr_t *)0x0)) break;
+           puVar8->type_flags = ((uw_object_hdr_t *)target)->type_flags;
+           puVar8->position_word = ((uw_object_hdr_t *)target)->position_word;
+           puVar8->chain_word = ((uw_object_hdr_t *)target)->chain_word;
+           puVar8->link_word = ((uw_object_hdr_t *)target)->link_word;
           sVar4 = rand_below(2);
           uVar9 = uVar11 + (int)sVar4 + 1;
           if (0x156 < (int)(uVar9 * 0x10000) >> 0x10) {
             uVar9 = 0x10;
           }
-           uVar10 = (((uw_object_hdr_t *)puVar8)->type_flags ^ uVar9) & 0x1ff ^ (uint)((uw_object_hdr_t *)puVar8)->type_flags;
+           uVar10 = (puVar8->type_flags ^ uVar9) & 0x1ff ^ (uint)puVar8->type_flags;
           uVar1 = (undefined1)uVar10;
-           ((uw_object_hdr_t *)puVar8)->type_flags_low = uVar1;
           bVar2 = (byte)(uVar10 >> 8);
-           ((uw_object_hdr_t *)puVar8)->type_flags_high = bVar2;
+           puVar8->object_id = uVar10 & 0x1ff;
           if ((short)uVar9 == 0x10) {
-             ((uw_object_hdr_t *)puVar8)->type_flags_low = uVar1;
-             ((uw_object_hdr_t *)puVar8)->type_flags_high = bVar2 | 0x80;
+             puVar8->is_quant = 1;
             uVar5 = ce_rand();
             uw_ord2005_rem_168 = ((int)(uVar5)) % (6);
             uVar9 = (uw_ord2005_rem_168 & 0xffff) + 3;
-             ((uw_object_hdr_t *)puVar8)->link_word_low = ((uw_object_hdr_t *)puVar8)->owner ^ (char)uVar9 * '@';
-             ((uw_object_hdr_t *)puVar8)->link_word_high = (byte)(char)(uVar9 >> 2);
+             puVar8->link = uVar9 & 0x3ff;
           }
-           uVar3 = target[1];
-           place_object_in_world((uint)(uVar3 >> 0xd) + DAT_002020a0 * 8,
-                        ((uVar3 & 0x1c00) >> 10) + DAT_002020a4 * 8,uVar3 & 0x7f,puVar8,6,0);
+           uVar3 = ((uw_object_hdr_t *)target)->position_word;
+           place_object_in_world(((uw_object_hdr_t *)target)->xpos + DAT_002020a0 * 8,
+           ((uw_object_hdr_t *)target)->ypos + DAT_002020a4 * 8,((uw_object_hdr_t *)target)->zpos,puVar8,6,0);
           iVar6 = iVar6 + -1;
         }
         discard_misplaced_object(iVar7 + 2,target,1);
         set_pending_update_flags(2);
       }
     }
   }
 }
