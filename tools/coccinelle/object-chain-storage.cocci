@object_list_insert_head_fields@
typedef uw_object_hdr_t, ushort, byte, undefined2, undefined1;
@@
- void object_list_insert_head(void *link_field_ptr, void *object_ptr)
- {
-   byte *link_field = (byte *)link_field_ptr;
-   char *object = (char *)object_ptr;
-   undefined2 uVar1;
-   byte bVar2;
-   short sVar3;
-   ushort uVar4;
-
-   uVar1 = *(undefined2 *)link_field;
-   bVar2 = (byte)uVar1;
-   *(byte *)(object + 4) = (*(byte *)(object + 4) ^ bVar2) & 0x3f ^ bVar2;
-   *(char *)(object + 5) = (char)((ushort)uVar1 >> 8);
-   if (object < DAT_002046c4) {
-     sVar3 = ordint_divmod(0x1b,object - DAT_002046b8).quot;
-     uVar4 = *link_field & 0x3f | sVar3 << 6;
-   }
-   else {
-     uVar4 = *link_field & 0x3f ^ ((short)((int)(object - DAT_002046c4) >> 3) + 0x100) * 0x40;
-   }
-   *link_field = (byte)uVar4;
-   link_field[1] = (byte)(uVar4 >> 8);
- }
+ void object_list_insert_head(ushort *link_field_ptr, uw_object_hdr_t *object_ptr)
+ {
+   ushort *link_field = link_field_ptr;
+   uw_object_hdr_t *object = object_ptr;
+   undefined2 uVar1;
+   short sVar3;
+   ushort uVar4;
+
+   uVar1 = *link_field;
+   object->next = uVar1 >> 6;
+   if ((char *)object < DAT_002046c4) {
+     sVar3 = ordint_divmod(0x1b,(char *)object - DAT_002046b8).quot;
+     uVar4 = *link_field & 0x3f | sVar3 << 6;
+   }
+   else {
+     uVar4 = *link_field & 0x3f ^ ((short)((int)((char *)object - DAT_002046c4) >> 3) + 0x100) * 0x40;
+   }
+   *link_field = uVar4;
+ }

@object_list_append_tail_fields@
typedef uw_object_hdr_t, ushort, byte, undefined2, undefined1;
@@
- void object_list_append_tail(void *link_field_ptr, void *object_ptr)
- {
-   byte *link_field = (byte *)link_field_ptr;
-   char *object = (char *)object_ptr;
-   short sVar1;
-   byte *pbVar2;
-   ushort uVar3;
-
-   /* iVar2 was `int`, truncating resolve_object_link's real pointer return -- same
-      tile/object-chain-walk bug as object_list_unlink (see there), just never exercised yet (this
-      walks a different list, e.g. a container's contents, to append object at its tail). */
-   while (pbVar2 = (byte *)resolve_object_link(link_field), pbVar2 != 0) {
-     link_field = pbVar2 + 4;
-   }
-   *(byte *)(object + 4) = *(byte *)(object + 4) & 0x3f;
-   *(undefined1 *)(object + 5) = 0;
-   if (object < DAT_002046c4) {
-     sVar1 = ordint_divmod(0x1b,object - DAT_002046b8).quot;
-     uVar3 = *link_field & 0x3f | sVar1 << 6;
-   }
-   else {
-     uVar3 = *link_field & 0x3f ^ ((short)((int)(object - DAT_002046c4) >> 3) + 0x100) * 0x40;
-   }
-   *link_field = (byte)uVar3;
-   link_field[1] = (byte)(uVar3 >> 8);
- }
+ void object_list_append_tail(ushort *link_field_ptr, uw_object_hdr_t *object_ptr)
+ {
+   ushort *link_field = link_field_ptr;
+   uw_object_hdr_t *object = object_ptr;
+   short sVar1;
+   uw_object_hdr_t *pbVar2;
+   ushort uVar3;
+
+   /* iVar2 was `int`, truncating resolve_object_link's real pointer return -- same
+      tile/object-chain-walk bug as object_list_unlink (see there), just never exercised yet (this
+      walks a different list, e.g. a container's contents, to append object at its tail). */
+   while (pbVar2 = resolve_object_link(link_field), pbVar2 != 0) {
+     link_field = &pbVar2->chain_word;
+   }
+   object->next = 0;
+   if ((char *)object < DAT_002046c4) {
+     sVar1 = ordint_divmod(0x1b,(char *)object - DAT_002046b8).quot;
+     uVar3 = *link_field & 0x3f | sVar1 << 6;
+   }
+   else {
+     uVar3 = *link_field & 0x3f ^ ((short)((int)((char *)object - DAT_002046c4) >> 3) + 0x100) * 0x40;
+   }
+   *link_field = uVar3;
+ }

@object_list_unlink_fields@
typedef uw_object_hdr_t, ushort, byte, undefined2, undefined1;
@@
- void object_list_unlink(void *link_field_ptr, void *object_ptr)
- {
-   byte *link_field = (byte *)link_field_ptr;
-   byte *object = (byte *)object_ptr;
-   short sVar1;
-   undefined2 uVar2;
-   byte bVar3;
-   byte *pbVar4;
-   int iVar5;
-
-   iVar5 = 0;
-   if (object != 0) {
-     while( true ) {
-       pbVar4 = (byte *)resolve_object_link(link_field);
-       if (pbVar4 == 0) {
-         return;
-       }
-       sVar1 = (short)iVar5;
-       iVar5 = (sVar1 + 1) * 0x10000 >> 0x10;
-       if (0x400 < sVar1) {
-         return;
-       }
-       if (pbVar4 == object) break;
-       link_field = pbVar4 + 4;
-     }
-     uVar2 = *(undefined2 *)(object + 4);
-     bVar3 = (byte)uVar2;
-     *link_field = (*link_field ^ bVar3) & 0x3f ^ bVar3;
-     link_field[1] = (byte)((ushort)uVar2 >> 8);
-     *(byte *)(object + 4) = *(byte *)(object + 4) & 0x3f;
-     *(undefined1 *)(object + 5) = 0;
-   }
- }
+ void object_list_unlink(ushort *link_field_ptr, uw_object_hdr_t *object_ptr)
+ {
+   ushort *link_field = link_field_ptr;
+   uw_object_hdr_t *object = object_ptr;
+   short sVar1;
+   undefined2 uVar2;
+   uw_object_hdr_t *pbVar4;
+   int iVar5;
+
+   iVar5 = 0;
+   if (object != 0) {
+     while( true ) {
+       pbVar4 = resolve_object_link(link_field);
+       if (pbVar4 == 0) {
+         return;
+       }
+       sVar1 = (short)iVar5;
+       iVar5 = (sVar1 + 1) * 0x10000 >> 0x10;
+       if (0x400 < sVar1) {
+         return;
+       }
+       if (pbVar4 == object) break;
+       link_field = &pbVar4->chain_word;
+     }
+     uVar2 = object->chain_word;
+     *link_field = (*link_field & 0x3f) | (uVar2 & 0xffc0);
+     object->next = 0;
+   }
+ }

@free_linked_object_recursive_fields@
typedef uw_object_hdr_t, ushort, byte, undefined2, undefined1;
@@
- void free_linked_object_recursive(void *link_field_ptr)
- {
-   char *link_field = (char *)link_field_ptr;
-   ushort *puVar1;
-
-   puVar1 = (ushort *)resolve_object_link(link_field); /* confirmed via ARM disassembly, 0x533e4 */
-   if (puVar1 != (ushort *)0x0) {
-     if ((*puVar1 & 0x1c0) == 0x180) {
-       free_trap_class_object(link_field,puVar1);
-     }
-     else {
-       if ((puVar1[2] & 0xffc0) != 0) {
-         free_linked_object_recursive((char *)(puVar1 + 2));  /* ARM 0x5342c: add r0,r4,#4 */
-       }
-       if ((*puVar1 & 0x8000) == 0) {
-         if ((puVar1[3] & 0xffc0) != 0) {
-           free_linked_object_recursive((char *)(puVar1 + 3));  /* ARM 0x53470: add r0,r4,#6 */
-         }
-       }
-       object_list_unlink(link_field,puVar1);
-       free_object_slot(puVar1);
-     }
-   }
- }
+ void free_linked_object_recursive(ushort *link_field_ptr)
+ {
+   ushort *link_field = link_field_ptr;
+   uw_object_hdr_t *puVar1;
+
+   puVar1 = resolve_object_link(link_field); /* confirmed via ARM disassembly, 0x533e4 */
+   if (puVar1 != NULL) {
+     if ((puVar1->item_id & 0x1c0) == 0x180) {
+       free_trap_class_object(link_field,puVar1);
+     }
+     else {
+       if (puVar1->next != 0) {
+         free_linked_object_recursive(&puVar1->chain_word);  /* ARM 0x5342c: add r0,r4,#4 */
+       }
+       if (puVar1->is_quant == 0) {
+         if (puVar1->link != 0) {
+           free_linked_object_recursive(&puVar1->link_word);  /* ARM 0x53470: add r0,r4,#6 */
+         }
+       }
+       object_list_unlink(link_field,puVar1);
+       free_object_slot(puVar1);
+     }
+   }
+ }

@unlink_and_free_object_fields@
typedef uw_object_hdr_t, ushort, byte, undefined2, undefined1;
@@
- void unlink_and_free_object(void *link_field_ptr, void *object_ptr)
- {
-   char *link_field = (char *)link_field_ptr;
-   char *object = (char *)object_ptr;
-   /* Dropped argument: free_linked_object_recursive takes the address of a link field to recursively
-      free (its own declared link_field) -- here that's object's own "contains" field (+6, this file's
-      standard container-contents offset) -- but it was called bare... */
-   if (((*(byte *)(object + 1) & 0x80) == 0) && ((*(ushort *)(object + 6) & 0xffc0) != 0)) {
-     free_linked_object_recursive(object + 6);
-   }
-   if (link_field != 0) {
-     object_list_unlink((byte *)link_field,(byte *)object);
-   }
-   free_object_slot(object);
- }
+ void unlink_and_free_object(ushort *link_field_ptr, uw_object_hdr_t *object_ptr)
+ {
+   ushort *link_field = link_field_ptr;
+   uw_object_hdr_t *object = object_ptr;
+   /* Dropped argument: free_linked_object_recursive takes the address of a link field to recursively
+      free (its own declared link_field) -- here that's object's own "contains" field (+6, this file's
+      standard container-contents offset) -- but it was called bare... */
+   if ((object->is_quant == 0) && (object->link != 0)) {
+     free_linked_object_recursive(&object->link_word);
+   }
+   if (link_field != 0) {
+     object_list_unlink(link_field,object);
+   }
+   free_object_slot(object);
+ }
