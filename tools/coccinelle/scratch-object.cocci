@definition@
typedef ushort, uw_object_hdr_t;
@@
- ushort *g_scratch_object_ptr;
+ uw_object_hdr_t *g_scratch_object_ptr;

@global_declaration@
typedef ushort, uw_object_hdr_t;
@@
- extern ushort *g_scratch_object_ptr;
+ extern uw_object_hdr_t *g_scratch_object_ptr;

@first_word_cast@
typedef ushort;
@@
- *(ushort *)g_scratch_object_ptr
+ g_scratch_object_ptr->type_flags

@first_byte_cast@
typedef byte;
@@
- *(byte *)g_scratch_object_ptr
+ (byte)g_scratch_object_ptr->type_flags

@first_word@
@@
- *g_scratch_object_ptr
+ g_scratch_object_ptr->type_flags

@assignment_cast@
typedef ushort, uw_object_hdr_t;
expression E;
@@
- g_scratch_object_ptr = (ushort *)E
+ g_scratch_object_ptr = (uw_object_hdr_t *)E

@equipped_assignment@
typedef uw_object_hdr_t;
expression E;
@@
- g_scratch_object_ptr = (uw_object_hdr_t *)get_equipped_item_at_slot(E)
+ g_scratch_object_ptr = get_equipped_item_at_slot(E)

@equipment_local_assignment@
typedef uw_object_hdr_t;
@@
refresh_player_equipment_effects(...) {
<...
- g_scratch_object_ptr = puVar6;
+ g_scratch_object_ptr = (uw_object_hdr_t *)puVar6;
...>
}

@null_comparison@
typedef ushort;
@@
- g_scratch_object_ptr != (ushort *)0x0
+ g_scratch_object_ptr != NULL

@saved_scratch_type@
typedef ushort, uw_object_hdr_t;
@@
- ushort *saved_scratch;
+ uw_object_hdr_t *saved_scratch;

@item_id@
@@
- (g_scratch_object_ptr->type_flags & 0x1ff)
+ g_scratch_object_ptr->item_id

@monster_lookup_local@
typedef byte, uw_object_hdr_t;
@@
class1_variant_effect_table_lookup(...) {
<...
- byte *pbVar3;
+ uw_object_hdr_t *pbVar3;
...>
}

@monster_lookup_assignment@
typedef byte;
@@
class1_variant_effect_table_lookup(...) {
<...
- pbVar3 = (byte *)g_scratch_object_ptr;
+ pbVar3 = g_scratch_object_ptr;
...>
}

@monster_lookup_header@
@@
class1_variant_effect_table_lookup(...) {
<...
- *pbVar3
+ pbVar3->type_flags
...>
}

@monster_lookup_row@
expression E;
@@
class1_variant_effect_table_lookup(...) {
<...
- &DAT_001007d0 + E * 0x30
+ &g_monster_type_props[E]
...>
}
