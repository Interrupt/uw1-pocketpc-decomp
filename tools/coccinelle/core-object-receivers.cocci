@find_object_in_chain_puVar1_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
- ushort *puVar1;
+ uw_object_hdr_t *puVar1;
...>
}

@find_object_in_chain_puVar1_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
- puVar1 = (ushort *)E
+ puVar1 = E
...>
}

@find_object_in_chain_puVar1_word_0@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
(
- puVar1[0]
+ puVar1->type_flags
|
- *puVar1
+ puVar1->type_flags
)
...>
}

@find_object_in_chain_puVar1_word_1@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
(
- puVar1[1]
+ puVar1->position_word
)
...>
}

@find_object_in_chain_puVar1_word_2@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
(
- puVar1[2]
+ puVar1->chain_word
)
...>
}

@find_object_in_chain_puVar1_word_3@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
(
- puVar1[3]
+ puVar1->link_word
)
...>
}

@find_object_in_chain_puVar1_link_2@
type R;
@@
R find_object_in_chain(...) {
<...
- puVar1 + 2
+ &puVar1->chain_word
...>
}

@find_object_in_chain_puVar1_link_3@
type R;
@@
R find_object_in_chain(...) {
<...
- puVar1 + 3
+ &puVar1->link_word
...>
}

@find_object_in_chain_puVar1_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
- (uw_object_hdr_t *)puVar1
+ puVar1
...>
}

@find_object_in_chain_puVar1_parenthesized_type_flags@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->type_flags
+ puVar1->type_flags
...>
}

@find_object_in_chain_puVar1_parenthesized_position_word@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->position_word
+ puVar1->position_word
...>
}

@find_object_in_chain_puVar1_parenthesized_chain_word@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->chain_word
+ puVar1->chain_word
...>
}

@find_object_in_chain_puVar1_parenthesized_link_word@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->link_word
+ puVar1->link_word
...>
}

@find_object_in_chain_puVar1_parenthesized_item_id@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->item_id
+ puVar1->item_id
...>
}

@find_object_in_chain_puVar1_parenthesized_owner@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->owner
+ puVar1->owner
...>
}

@find_object_in_chain_puVar1_parenthesized_link@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->link
+ puVar1->link
...>
}

@find_object_in_chain_puVar1_parenthesized_quality@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->quality
+ puVar1->quality
...>
}

@find_object_in_chain_puVar1_parenthesized_next@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->next
+ puVar1->next
...>
}

@find_object_in_chain_puVar1_parenthesized_is_quant@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1)->is_quant
+ puVar1->is_quant
...>
}

@find_object_in_chain_puVar1_null@
type R;
typedef ushort;
@@
R find_object_in_chain(...) {
<...
- puVar1 != (ushort *)0x0
+ puVar1 != NULL
...>
}

@find_object_in_chain_puVar1_null_equal@
type R;
typedef ushort;
@@
R find_object_in_chain(...) {
<...
- puVar1 == (ushort *)0x0
+ puVar1 == NULL
...>
}

@find_object_in_chain_puVar1_quantity_zero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1->type_flags & 0x8000) == 0
+ puVar1->is_quant == 0
...>
}

@find_object_in_chain_puVar1_quantity_nonzero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1->type_flags & 0x8000) != 0
+ puVar1->is_quant != 0
...>
}

@find_object_in_chain_puVar1_next_zero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1->chain_word & 0xffc0) == 0
+ puVar1->next == 0
...>
}

@find_object_in_chain_puVar1_next_nonzero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1->chain_word & 0xffc0) != 0
+ puVar1->next != 0
...>
}

@find_object_in_chain_puVar1_link_zero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1->link_word & 0xffc0) == 0
+ puVar1->link == 0
...>
}

@find_object_in_chain_puVar1_link_nonzero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar1->link_word & 0xffc0) != 0
+ puVar1->link != 0
...>
}

@find_object_in_chain_puVar1_class_6@
type R;
@@
R find_object_in_chain(...) {
<...
- puVar1->type_flags >> 6 & 7
+ puVar1->item_id >> 6 & 7
...>
}

@find_object_in_chain_puVar1_class_4@
type R;
@@
R find_object_in_chain(...) {
<...
- puVar1->type_flags >> 4 & 3
+ puVar1->item_id >> 4 & 3
...>
}

@find_object_in_chain_puVar1_mask_item_id@
type R;
typedef byte;
@@
R find_object_in_chain(...) {
<...
(
- puVar1->type_flags & 0x1ff
+ puVar1->item_id
|
- (byte)puVar1->type_flags & 0x1ff
+ puVar1->item_id
)
...>
}

@find_object_in_chain_puVar1_mask_quality@
type R;
typedef byte;
@@
R find_object_in_chain(...) {
<...
(
- puVar1->chain_word & 0x3f
+ puVar1->quality
|
- (byte)puVar1->chain_word & 0x3f
+ puVar1->quality
)
...>
}

@find_object_in_chain_puVar1_mask_owner@
type R;
typedef byte;
@@
R find_object_in_chain(...) {
<...
(
- puVar1->link_word & 0x3f
+ puVar1->owner
|
- (byte)puVar1->link_word & 0x3f
+ puVar1->owner
)
...>
}

@find_object_in_chain_puVar2_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
- ushort *puVar2;
+ uw_object_hdr_t *puVar2;
...>
}

@find_object_in_chain_puVar2_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
- puVar2 = (ushort *)E
+ puVar2 = E
...>
}

@find_object_in_chain_puVar2_word_0@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
(
- puVar2[0]
+ puVar2->type_flags
|
- *puVar2
+ puVar2->type_flags
)
...>
}

@find_object_in_chain_puVar2_word_1@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
(
- puVar2[1]
+ puVar2->position_word
)
...>
}

@find_object_in_chain_puVar2_word_2@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
(
- puVar2[2]
+ puVar2->chain_word
)
...>
}

@find_object_in_chain_puVar2_word_3@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
(
- puVar2[3]
+ puVar2->link_word
)
...>
}

@find_object_in_chain_puVar2_link_2@
type R;
@@
R find_object_in_chain(...) {
<...
- puVar2 + 2
+ &puVar2->chain_word
...>
}

@find_object_in_chain_puVar2_link_3@
type R;
@@
R find_object_in_chain(...) {
<...
- puVar2 + 3
+ &puVar2->link_word
...>
}

@find_object_in_chain_puVar2_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_chain(...) {
<...
- (uw_object_hdr_t *)puVar2
+ puVar2
...>
}

@find_object_in_chain_puVar2_parenthesized_type_flags@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->type_flags
+ puVar2->type_flags
...>
}

@find_object_in_chain_puVar2_parenthesized_position_word@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->position_word
+ puVar2->position_word
...>
}

@find_object_in_chain_puVar2_parenthesized_chain_word@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->chain_word
+ puVar2->chain_word
...>
}

@find_object_in_chain_puVar2_parenthesized_link_word@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->link_word
+ puVar2->link_word
...>
}

@find_object_in_chain_puVar2_parenthesized_item_id@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->item_id
+ puVar2->item_id
...>
}

@find_object_in_chain_puVar2_parenthesized_owner@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->owner
+ puVar2->owner
...>
}

@find_object_in_chain_puVar2_parenthesized_link@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->link
+ puVar2->link
...>
}

@find_object_in_chain_puVar2_parenthesized_quality@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->quality
+ puVar2->quality
...>
}

@find_object_in_chain_puVar2_parenthesized_next@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->next
+ puVar2->next
...>
}

@find_object_in_chain_puVar2_parenthesized_is_quant@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2)->is_quant
+ puVar2->is_quant
...>
}

@find_object_in_chain_puVar2_null@
type R;
typedef ushort;
@@
R find_object_in_chain(...) {
<...
- puVar2 != (ushort *)0x0
+ puVar2 != NULL
...>
}

@find_object_in_chain_puVar2_null_equal@
type R;
typedef ushort;
@@
R find_object_in_chain(...) {
<...
- puVar2 == (ushort *)0x0
+ puVar2 == NULL
...>
}

@find_object_in_chain_puVar2_quantity_zero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2->type_flags & 0x8000) == 0
+ puVar2->is_quant == 0
...>
}

@find_object_in_chain_puVar2_quantity_nonzero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2->type_flags & 0x8000) != 0
+ puVar2->is_quant != 0
...>
}

@find_object_in_chain_puVar2_next_zero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2->chain_word & 0xffc0) == 0
+ puVar2->next == 0
...>
}

@find_object_in_chain_puVar2_next_nonzero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2->chain_word & 0xffc0) != 0
+ puVar2->next != 0
...>
}

@find_object_in_chain_puVar2_link_zero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2->link_word & 0xffc0) == 0
+ puVar2->link == 0
...>
}

@find_object_in_chain_puVar2_link_nonzero@
type R;
@@
R find_object_in_chain(...) {
<...
- (puVar2->link_word & 0xffc0) != 0
+ puVar2->link != 0
...>
}

@find_object_in_chain_puVar2_class_6@
type R;
@@
R find_object_in_chain(...) {
<...
- puVar2->type_flags >> 6 & 7
+ puVar2->item_id >> 6 & 7
...>
}

@find_object_in_chain_puVar2_class_4@
type R;
@@
R find_object_in_chain(...) {
<...
- puVar2->type_flags >> 4 & 3
+ puVar2->item_id >> 4 & 3
...>
}

@find_object_in_chain_puVar2_mask_item_id@
type R;
typedef byte;
@@
R find_object_in_chain(...) {
<...
(
- puVar2->type_flags & 0x1ff
+ puVar2->item_id
|
- (byte)puVar2->type_flags & 0x1ff
+ puVar2->item_id
)
...>
}

@find_object_in_chain_puVar2_mask_quality@
type R;
typedef byte;
@@
R find_object_in_chain(...) {
<...
(
- puVar2->chain_word & 0x3f
+ puVar2->quality
|
- (byte)puVar2->chain_word & 0x3f
+ puVar2->quality
)
...>
}

@find_object_in_chain_puVar2_mask_owner@
type R;
typedef byte;
@@
R find_object_in_chain(...) {
<...
(
- puVar2->link_word & 0x3f
+ puVar2->owner
|
- (byte)puVar2->link_word & 0x3f
+ puVar2->owner
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_declaration@
type R;
typedef byte, uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- byte *iVar3;
+ uw_object_hdr_t *iVar3;
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_casts@
type R;
expression E;
typedef byte, uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar3 = (byte *)E
+ iVar3 = E
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_byteword_4@
type R;
typedef ushort;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- *(ushort *)(iVar3 + 4)
+ iVar3->chain_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_bytelink_4@
type R;
typedef ushort;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (ushort *)(iVar3 + 4)
+ &iVar3->chain_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_byteword_6@
type R;
typedef ushort;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- *(ushort *)(iVar3 + 6)
+ iVar3->link_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_bytelink_6@
type R;
typedef ushort;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (ushort *)(iVar3 + 6)
+ &iVar3->link_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_quantity@
type R;
typedef byte;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- *(byte *)(iVar3 + 1) & 0x80
+ (iVar3->is_quant << 7)
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (uw_object_hdr_t *)iVar3
+ iVar3
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_type_flags@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->type_flags
+ iVar3->type_flags
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_position_word@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->position_word
+ iVar3->position_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_chain_word@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->chain_word
+ iVar3->chain_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_link_word@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->link_word
+ iVar3->link_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_item_id@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->item_id
+ iVar3->item_id
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_owner@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->owner
+ iVar3->owner
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_link@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->link
+ iVar3->link
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_quality@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->quality
+ iVar3->quality
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_next@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->next
+ iVar3->next
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_parenthesized_is_quant@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3)->is_quant
+ iVar3->is_quant
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_null@
type R;
typedef ushort;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar3 != (ushort *)0x0
+ iVar3 != NULL
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_null_equal@
type R;
typedef ushort;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar3 == (ushort *)0x0
+ iVar3 == NULL
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_quantity_zero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3->type_flags & 0x8000) == 0
+ iVar3->is_quant == 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_quantity_nonzero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3->type_flags & 0x8000) != 0
+ iVar3->is_quant != 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_next_zero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3->chain_word & 0xffc0) == 0
+ iVar3->next == 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_next_nonzero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3->chain_word & 0xffc0) != 0
+ iVar3->next != 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_link_zero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3->link_word & 0xffc0) == 0
+ iVar3->link == 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_link_nonzero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar3->link_word & 0xffc0) != 0
+ iVar3->link != 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_class_6@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar3->type_flags >> 6 & 7
+ iVar3->item_id >> 6 & 7
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_class_4@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar3->type_flags >> 4 & 3
+ iVar3->item_id >> 4 & 3
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_mask_item_id@
type R;
typedef byte;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar3->type_flags & 0x1ff
+ iVar3->item_id
|
- (byte)iVar3->type_flags & 0x1ff
+ iVar3->item_id
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_mask_quality@
type R;
typedef byte;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar3->chain_word & 0x3f
+ iVar3->quality
|
- (byte)iVar3->chain_word & 0x3f
+ iVar3->quality
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar3_mask_owner@
type R;
typedef byte;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar3->link_word & 0x3f
+ iVar3->owner
|
- (byte)iVar3->link_word & 0x3f
+ iVar3->owner
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- ushort *iVar4;
+ uw_object_hdr_t *iVar4;
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar4 = (ushort *)E
+ iVar4 = E
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_word_0@
type R;
typedef uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar4[0]
+ iVar4->type_flags
|
- *iVar4
+ iVar4->type_flags
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_word_1@
type R;
typedef uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar4[1]
+ iVar4->position_word
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_word_2@
type R;
typedef uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar4[2]
+ iVar4->chain_word
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_word_3@
type R;
typedef uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar4[3]
+ iVar4->link_word
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_link_2@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar4 + 2
+ &iVar4->chain_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_link_3@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar4 + 3
+ &iVar4->link_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (uw_object_hdr_t *)iVar4
+ iVar4
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_type_flags@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->type_flags
+ iVar4->type_flags
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_position_word@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->position_word
+ iVar4->position_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_chain_word@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->chain_word
+ iVar4->chain_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_link_word@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->link_word
+ iVar4->link_word
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_item_id@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->item_id
+ iVar4->item_id
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_owner@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->owner
+ iVar4->owner
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_link@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->link
+ iVar4->link
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_quality@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->quality
+ iVar4->quality
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_next@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->next
+ iVar4->next
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_parenthesized_is_quant@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4)->is_quant
+ iVar4->is_quant
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_null@
type R;
typedef ushort;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar4 != (ushort *)0x0
+ iVar4 != NULL
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_null_equal@
type R;
typedef ushort;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar4 == (ushort *)0x0
+ iVar4 == NULL
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_quantity_zero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4->type_flags & 0x8000) == 0
+ iVar4->is_quant == 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_quantity_nonzero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4->type_flags & 0x8000) != 0
+ iVar4->is_quant != 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_next_zero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4->chain_word & 0xffc0) == 0
+ iVar4->next == 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_next_nonzero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4->chain_word & 0xffc0) != 0
+ iVar4->next != 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_link_zero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4->link_word & 0xffc0) == 0
+ iVar4->link == 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_link_nonzero@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- (iVar4->link_word & 0xffc0) != 0
+ iVar4->link != 0
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_class_6@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar4->type_flags >> 6 & 7
+ iVar4->item_id >> 6 & 7
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_class_4@
type R;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
- iVar4->type_flags >> 4 & 3
+ iVar4->item_id >> 4 & 3
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_mask_item_id@
type R;
typedef byte;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar4->type_flags & 0x1ff
+ iVar4->item_id
|
- (byte)iVar4->type_flags & 0x1ff
+ iVar4->item_id
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_mask_quality@
type R;
typedef byte;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar4->chain_word & 0x3f
+ iVar4->quality
|
- (byte)iVar4->chain_word & 0x3f
+ iVar4->quality
)
...>
}

@find_object_by_encoded_slot_in_chain_iVar4_mask_owner@
type R;
typedef byte;
@@
R find_object_by_encoded_slot_in_chain(...) {
<...
(
- iVar4->link_word & 0x3f
+ iVar4->owner
|
- (byte)iVar4->link_word & 0x3f
+ iVar4->owner
)
...>
}

@find_object_in_world_puVar6_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R find_object_in_world(...) {
<...
- ushort *puVar6;
+ uw_object_hdr_t *puVar6;
...>
}

@find_object_in_world_puVar6_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R find_object_in_world(...) {
<...
- puVar6 = (ushort *)E
+ puVar6 = E
...>
}

@find_object_in_world_puVar6_word_0@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_world(...) {
<...
(
- puVar6[0]
+ puVar6->type_flags
|
- *puVar6
+ puVar6->type_flags
)
...>
}

@find_object_in_world_puVar6_word_1@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_world(...) {
<...
(
- puVar6[1]
+ puVar6->position_word
)
...>
}

@find_object_in_world_puVar6_word_2@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_world(...) {
<...
(
- puVar6[2]
+ puVar6->chain_word
)
...>
}

@find_object_in_world_puVar6_word_3@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_world(...) {
<...
(
- puVar6[3]
+ puVar6->link_word
)
...>
}

@find_object_in_world_puVar6_link_2@
type R;
@@
R find_object_in_world(...) {
<...
- puVar6 + 2
+ &puVar6->chain_word
...>
}

@find_object_in_world_puVar6_link_3@
type R;
@@
R find_object_in_world(...) {
<...
- puVar6 + 3
+ &puVar6->link_word
...>
}

@find_object_in_world_puVar6_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R find_object_in_world(...) {
<...
- (uw_object_hdr_t *)puVar6
+ puVar6
...>
}

@find_object_in_world_puVar6_parenthesized_type_flags@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->type_flags
+ puVar6->type_flags
...>
}

@find_object_in_world_puVar6_parenthesized_position_word@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->position_word
+ puVar6->position_word
...>
}

@find_object_in_world_puVar6_parenthesized_chain_word@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->chain_word
+ puVar6->chain_word
...>
}

@find_object_in_world_puVar6_parenthesized_link_word@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->link_word
+ puVar6->link_word
...>
}

@find_object_in_world_puVar6_parenthesized_item_id@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->item_id
+ puVar6->item_id
...>
}

@find_object_in_world_puVar6_parenthesized_owner@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->owner
+ puVar6->owner
...>
}

@find_object_in_world_puVar6_parenthesized_link@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->link
+ puVar6->link
...>
}

@find_object_in_world_puVar6_parenthesized_quality@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->quality
+ puVar6->quality
...>
}

@find_object_in_world_puVar6_parenthesized_next@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->next
+ puVar6->next
...>
}

@find_object_in_world_puVar6_parenthesized_is_quant@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6)->is_quant
+ puVar6->is_quant
...>
}

@find_object_in_world_puVar6_null@
type R;
typedef ushort;
@@
R find_object_in_world(...) {
<...
- puVar6 != (ushort *)0x0
+ puVar6 != NULL
...>
}

@find_object_in_world_puVar6_null_equal@
type R;
typedef ushort;
@@
R find_object_in_world(...) {
<...
- puVar6 == (ushort *)0x0
+ puVar6 == NULL
...>
}

@find_object_in_world_puVar6_quantity_zero@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6->type_flags & 0x8000) == 0
+ puVar6->is_quant == 0
...>
}

@find_object_in_world_puVar6_quantity_nonzero@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6->type_flags & 0x8000) != 0
+ puVar6->is_quant != 0
...>
}

@find_object_in_world_puVar6_next_zero@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6->chain_word & 0xffc0) == 0
+ puVar6->next == 0
...>
}

@find_object_in_world_puVar6_next_nonzero@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6->chain_word & 0xffc0) != 0
+ puVar6->next != 0
...>
}

@find_object_in_world_puVar6_link_zero@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6->link_word & 0xffc0) == 0
+ puVar6->link == 0
...>
}

@find_object_in_world_puVar6_link_nonzero@
type R;
@@
R find_object_in_world(...) {
<...
- (puVar6->link_word & 0xffc0) != 0
+ puVar6->link != 0
...>
}

@find_object_in_world_puVar6_class_6@
type R;
@@
R find_object_in_world(...) {
<...
- puVar6->type_flags >> 6 & 7
+ puVar6->item_id >> 6 & 7
...>
}

@find_object_in_world_puVar6_class_4@
type R;
@@
R find_object_in_world(...) {
<...
- puVar6->type_flags >> 4 & 3
+ puVar6->item_id >> 4 & 3
...>
}

@find_object_in_world_puVar6_mask_item_id@
type R;
typedef byte;
@@
R find_object_in_world(...) {
<...
(
- puVar6->type_flags & 0x1ff
+ puVar6->item_id
|
- (byte)puVar6->type_flags & 0x1ff
+ puVar6->item_id
)
...>
}

@find_object_in_world_puVar6_mask_quality@
type R;
typedef byte;
@@
R find_object_in_world(...) {
<...
(
- puVar6->chain_word & 0x3f
+ puVar6->quality
|
- (byte)puVar6->chain_word & 0x3f
+ puVar6->quality
)
...>
}

@find_object_in_world_puVar6_mask_owner@
type R;
typedef byte;
@@
R find_object_in_world(...) {
<...
(
- puVar6->link_word & 0x3f
+ puVar6->owner
|
- (byte)puVar6->link_word & 0x3f
+ puVar6->owner
)
...>
}

@sum_container_weight_puVar2_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R sum_container_weight(...) {
<...
- ushort *puVar2;
+ uw_object_hdr_t *puVar2;
...>
}

@sum_container_weight_puVar2_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R sum_container_weight(...) {
<...
- puVar2 = (ushort *)E
+ puVar2 = E
...>
}

@sum_container_weight_puVar2_word_0@
type R;
typedef uw_object_hdr_t;
@@
R sum_container_weight(...) {
<...
(
- puVar2[0]
+ puVar2->type_flags
|
- *puVar2
+ puVar2->type_flags
)
...>
}

@sum_container_weight_puVar2_word_1@
type R;
typedef uw_object_hdr_t;
@@
R sum_container_weight(...) {
<...
(
- puVar2[1]
+ puVar2->position_word
)
...>
}

@sum_container_weight_puVar2_word_2@
type R;
typedef uw_object_hdr_t;
@@
R sum_container_weight(...) {
<...
(
- puVar2[2]
+ puVar2->chain_word
)
...>
}

@sum_container_weight_puVar2_word_3@
type R;
typedef uw_object_hdr_t;
@@
R sum_container_weight(...) {
<...
(
- puVar2[3]
+ puVar2->link_word
)
...>
}

@sum_container_weight_puVar2_link_2@
type R;
@@
R sum_container_weight(...) {
<...
- puVar2 + 2
+ &puVar2->chain_word
...>
}

@sum_container_weight_puVar2_link_3@
type R;
@@
R sum_container_weight(...) {
<...
- puVar2 + 3
+ &puVar2->link_word
...>
}

@sum_container_weight_puVar2_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R sum_container_weight(...) {
<...
- (uw_object_hdr_t *)puVar2
+ puVar2
...>
}

@sum_container_weight_puVar2_parenthesized_type_flags@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->type_flags
+ puVar2->type_flags
...>
}

@sum_container_weight_puVar2_parenthesized_position_word@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->position_word
+ puVar2->position_word
...>
}

@sum_container_weight_puVar2_parenthesized_chain_word@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->chain_word
+ puVar2->chain_word
...>
}

@sum_container_weight_puVar2_parenthesized_link_word@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->link_word
+ puVar2->link_word
...>
}

@sum_container_weight_puVar2_parenthesized_item_id@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->item_id
+ puVar2->item_id
...>
}

@sum_container_weight_puVar2_parenthesized_owner@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->owner
+ puVar2->owner
...>
}

@sum_container_weight_puVar2_parenthesized_link@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->link
+ puVar2->link
...>
}

@sum_container_weight_puVar2_parenthesized_quality@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->quality
+ puVar2->quality
...>
}

@sum_container_weight_puVar2_parenthesized_next@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->next
+ puVar2->next
...>
}

@sum_container_weight_puVar2_parenthesized_is_quant@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2)->is_quant
+ puVar2->is_quant
...>
}

@sum_container_weight_puVar2_null@
type R;
typedef ushort;
@@
R sum_container_weight(...) {
<...
- puVar2 != (ushort *)0x0
+ puVar2 != NULL
...>
}

@sum_container_weight_puVar2_null_equal@
type R;
typedef ushort;
@@
R sum_container_weight(...) {
<...
- puVar2 == (ushort *)0x0
+ puVar2 == NULL
...>
}

@sum_container_weight_puVar2_quantity_zero@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2->type_flags & 0x8000) == 0
+ puVar2->is_quant == 0
...>
}

@sum_container_weight_puVar2_quantity_nonzero@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2->type_flags & 0x8000) != 0
+ puVar2->is_quant != 0
...>
}

@sum_container_weight_puVar2_next_zero@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2->chain_word & 0xffc0) == 0
+ puVar2->next == 0
...>
}

@sum_container_weight_puVar2_next_nonzero@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2->chain_word & 0xffc0) != 0
+ puVar2->next != 0
...>
}

@sum_container_weight_puVar2_link_zero@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2->link_word & 0xffc0) == 0
+ puVar2->link == 0
...>
}

@sum_container_weight_puVar2_link_nonzero@
type R;
@@
R sum_container_weight(...) {
<...
- (puVar2->link_word & 0xffc0) != 0
+ puVar2->link != 0
...>
}

@sum_container_weight_puVar2_class_6@
type R;
@@
R sum_container_weight(...) {
<...
- puVar2->type_flags >> 6 & 7
+ puVar2->item_id >> 6 & 7
...>
}

@sum_container_weight_puVar2_class_4@
type R;
@@
R sum_container_weight(...) {
<...
- puVar2->type_flags >> 4 & 3
+ puVar2->item_id >> 4 & 3
...>
}

@sum_container_weight_puVar2_mask_item_id@
type R;
typedef byte;
@@
R sum_container_weight(...) {
<...
(
- puVar2->type_flags & 0x1ff
+ puVar2->item_id
|
- (byte)puVar2->type_flags & 0x1ff
+ puVar2->item_id
)
...>
}

@sum_container_weight_puVar2_mask_quality@
type R;
typedef byte;
@@
R sum_container_weight(...) {
<...
(
- puVar2->chain_word & 0x3f
+ puVar2->quality
|
- (byte)puVar2->chain_word & 0x3f
+ puVar2->quality
)
...>
}

@sum_container_weight_puVar2_mask_owner@
type R;
typedef byte;
@@
R sum_container_weight(...) {
<...
(
- puVar2->link_word & 0x3f
+ puVar2->owner
|
- (byte)puVar2->link_word & 0x3f
+ puVar2->owner
)
...>
}

@discard_container_contents_puVar1_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
- ushort *puVar1;
+ uw_object_hdr_t *puVar1;
...>
}

@discard_container_contents_puVar1_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
- puVar1 = (ushort *)E
+ puVar1 = E
...>
}

@discard_container_contents_puVar1_word_0@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
(
- puVar1[0]
+ puVar1->type_flags
|
- *puVar1
+ puVar1->type_flags
)
...>
}

@discard_container_contents_puVar1_word_1@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
(
- puVar1[1]
+ puVar1->position_word
)
...>
}

@discard_container_contents_puVar1_word_2@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
(
- puVar1[2]
+ puVar1->chain_word
)
...>
}

@discard_container_contents_puVar1_word_3@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
(
- puVar1[3]
+ puVar1->link_word
)
...>
}

@discard_container_contents_puVar1_link_2@
type R;
@@
R discard_container_contents(...) {
<...
- puVar1 + 2
+ &puVar1->chain_word
...>
}

@discard_container_contents_puVar1_link_3@
type R;
@@
R discard_container_contents(...) {
<...
- puVar1 + 3
+ &puVar1->link_word
...>
}

@discard_container_contents_puVar1_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
- (uw_object_hdr_t *)puVar1
+ puVar1
...>
}

@discard_container_contents_puVar1_parenthesized_type_flags@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->type_flags
+ puVar1->type_flags
...>
}

@discard_container_contents_puVar1_parenthesized_position_word@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->position_word
+ puVar1->position_word
...>
}

@discard_container_contents_puVar1_parenthesized_chain_word@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->chain_word
+ puVar1->chain_word
...>
}

@discard_container_contents_puVar1_parenthesized_link_word@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->link_word
+ puVar1->link_word
...>
}

@discard_container_contents_puVar1_parenthesized_item_id@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->item_id
+ puVar1->item_id
...>
}

@discard_container_contents_puVar1_parenthesized_owner@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->owner
+ puVar1->owner
...>
}

@discard_container_contents_puVar1_parenthesized_link@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->link
+ puVar1->link
...>
}

@discard_container_contents_puVar1_parenthesized_quality@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->quality
+ puVar1->quality
...>
}

@discard_container_contents_puVar1_parenthesized_next@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->next
+ puVar1->next
...>
}

@discard_container_contents_puVar1_parenthesized_is_quant@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1)->is_quant
+ puVar1->is_quant
...>
}

@discard_container_contents_puVar1_null@
type R;
typedef ushort;
@@
R discard_container_contents(...) {
<...
- puVar1 != (ushort *)0x0
+ puVar1 != NULL
...>
}

@discard_container_contents_puVar1_null_equal@
type R;
typedef ushort;
@@
R discard_container_contents(...) {
<...
- puVar1 == (ushort *)0x0
+ puVar1 == NULL
...>
}

@discard_container_contents_puVar1_quantity_zero@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1->type_flags & 0x8000) == 0
+ puVar1->is_quant == 0
...>
}

@discard_container_contents_puVar1_quantity_nonzero@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1->type_flags & 0x8000) != 0
+ puVar1->is_quant != 0
...>
}

@discard_container_contents_puVar1_next_zero@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1->chain_word & 0xffc0) == 0
+ puVar1->next == 0
...>
}

@discard_container_contents_puVar1_next_nonzero@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1->chain_word & 0xffc0) != 0
+ puVar1->next != 0
...>
}

@discard_container_contents_puVar1_link_zero@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1->link_word & 0xffc0) == 0
+ puVar1->link == 0
...>
}

@discard_container_contents_puVar1_link_nonzero@
type R;
@@
R discard_container_contents(...) {
<...
- (puVar1->link_word & 0xffc0) != 0
+ puVar1->link != 0
...>
}

@discard_container_contents_puVar1_class_6@
type R;
@@
R discard_container_contents(...) {
<...
- puVar1->type_flags >> 6 & 7
+ puVar1->item_id >> 6 & 7
...>
}

@discard_container_contents_puVar1_class_4@
type R;
@@
R discard_container_contents(...) {
<...
- puVar1->type_flags >> 4 & 3
+ puVar1->item_id >> 4 & 3
...>
}

@discard_container_contents_puVar1_mask_item_id@
type R;
typedef byte;
@@
R discard_container_contents(...) {
<...
(
- puVar1->type_flags & 0x1ff
+ puVar1->item_id
|
- (byte)puVar1->type_flags & 0x1ff
+ puVar1->item_id
)
...>
}

@discard_container_contents_puVar1_mask_quality@
type R;
typedef byte;
@@
R discard_container_contents(...) {
<...
(
- puVar1->chain_word & 0x3f
+ puVar1->quality
|
- (byte)puVar1->chain_word & 0x3f
+ puVar1->quality
)
...>
}

@discard_container_contents_puVar1_mask_owner@
type R;
typedef byte;
@@
R discard_container_contents(...) {
<...
(
- puVar1->link_word & 0x3f
+ puVar1->owner
|
- (byte)puVar1->link_word & 0x3f
+ puVar1->owner
)
...>
}

@discard_container_contents_container_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
- ushort *container;
+ uw_object_hdr_t *container;
...>
}

@discard_container_contents_container_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
- container = (ushort *)E
+ container = E
...>
}

@discard_container_contents_container_word_0@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
(
- container[0]
+ container->type_flags
|
- *container
+ container->type_flags
)
...>
}

@discard_container_contents_container_word_1@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
(
- container[1]
+ container->position_word
)
...>
}

@discard_container_contents_container_word_2@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
(
- container[2]
+ container->chain_word
)
...>
}

@discard_container_contents_container_word_3@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
(
- container[3]
+ container->link_word
)
...>
}

@discard_container_contents_container_link_2@
type R;
@@
R discard_container_contents(...) {
<...
- container + 2
+ &container->chain_word
...>
}

@discard_container_contents_container_link_3@
type R;
@@
R discard_container_contents(...) {
<...
- container + 3
+ &container->link_word
...>
}

@discard_container_contents_container_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R discard_container_contents(...) {
<...
- (uw_object_hdr_t *)container
+ container
...>
}

@discard_container_contents_container_parenthesized_type_flags@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->type_flags
+ container->type_flags
...>
}

@discard_container_contents_container_parenthesized_position_word@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->position_word
+ container->position_word
...>
}

@discard_container_contents_container_parenthesized_chain_word@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->chain_word
+ container->chain_word
...>
}

@discard_container_contents_container_parenthesized_link_word@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->link_word
+ container->link_word
...>
}

@discard_container_contents_container_parenthesized_item_id@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->item_id
+ container->item_id
...>
}

@discard_container_contents_container_parenthesized_owner@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->owner
+ container->owner
...>
}

@discard_container_contents_container_parenthesized_link@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->link
+ container->link
...>
}

@discard_container_contents_container_parenthesized_quality@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->quality
+ container->quality
...>
}

@discard_container_contents_container_parenthesized_next@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->next
+ container->next
...>
}

@discard_container_contents_container_parenthesized_is_quant@
type R;
@@
R discard_container_contents(...) {
<...
- (container)->is_quant
+ container->is_quant
...>
}

@discard_container_contents_container_null@
type R;
typedef ushort;
@@
R discard_container_contents(...) {
<...
- container != (ushort *)0x0
+ container != NULL
...>
}

@discard_container_contents_container_null_equal@
type R;
typedef ushort;
@@
R discard_container_contents(...) {
<...
- container == (ushort *)0x0
+ container == NULL
...>
}

@discard_container_contents_container_quantity_zero@
type R;
@@
R discard_container_contents(...) {
<...
- (container->type_flags & 0x8000) == 0
+ container->is_quant == 0
...>
}

@discard_container_contents_container_quantity_nonzero@
type R;
@@
R discard_container_contents(...) {
<...
- (container->type_flags & 0x8000) != 0
+ container->is_quant != 0
...>
}

@discard_container_contents_container_next_zero@
type R;
@@
R discard_container_contents(...) {
<...
- (container->chain_word & 0xffc0) == 0
+ container->next == 0
...>
}

@discard_container_contents_container_next_nonzero@
type R;
@@
R discard_container_contents(...) {
<...
- (container->chain_word & 0xffc0) != 0
+ container->next != 0
...>
}

@discard_container_contents_container_link_zero@
type R;
@@
R discard_container_contents(...) {
<...
- (container->link_word & 0xffc0) == 0
+ container->link == 0
...>
}

@discard_container_contents_container_link_nonzero@
type R;
@@
R discard_container_contents(...) {
<...
- (container->link_word & 0xffc0) != 0
+ container->link != 0
...>
}

@discard_container_contents_container_class_6@
type R;
@@
R discard_container_contents(...) {
<...
- container->type_flags >> 6 & 7
+ container->item_id >> 6 & 7
...>
}

@discard_container_contents_container_class_4@
type R;
@@
R discard_container_contents(...) {
<...
- container->type_flags >> 4 & 3
+ container->item_id >> 4 & 3
...>
}

@discard_container_contents_container_mask_item_id@
type R;
typedef byte;
@@
R discard_container_contents(...) {
<...
(
- container->type_flags & 0x1ff
+ container->item_id
|
- (byte)container->type_flags & 0x1ff
+ container->item_id
)
...>
}

@discard_container_contents_container_mask_quality@
type R;
typedef byte;
@@
R discard_container_contents(...) {
<...
(
- container->chain_word & 0x3f
+ container->quality
|
- (byte)container->chain_word & 0x3f
+ container->quality
)
...>
}

@discard_container_contents_container_mask_owner@
type R;
typedef byte;
@@
R discard_container_contents(...) {
<...
(
- container->link_word & 0x3f
+ container->owner
|
- (byte)container->link_word & 0x3f
+ container->owner
)
...>
}

@try_empty_container_container_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R try_empty_container(...) {
<...
- ushort *container;
+ uw_object_hdr_t *container;
...>
}

@try_empty_container_container_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R try_empty_container(...) {
<...
- container = (ushort *)E
+ container = E
...>
}

@try_empty_container_container_word_0@
type R;
typedef uw_object_hdr_t;
@@
R try_empty_container(...) {
<...
(
- container[0]
+ container->type_flags
|
- *container
+ container->type_flags
)
...>
}

@try_empty_container_container_word_1@
type R;
typedef uw_object_hdr_t;
@@
R try_empty_container(...) {
<...
(
- container[1]
+ container->position_word
)
...>
}

@try_empty_container_container_word_2@
type R;
typedef uw_object_hdr_t;
@@
R try_empty_container(...) {
<...
(
- container[2]
+ container->chain_word
)
...>
}

@try_empty_container_container_word_3@
type R;
typedef uw_object_hdr_t;
@@
R try_empty_container(...) {
<...
(
- container[3]
+ container->link_word
)
...>
}

@try_empty_container_container_link_2@
type R;
@@
R try_empty_container(...) {
<...
- container + 2
+ &container->chain_word
...>
}

@try_empty_container_container_link_3@
type R;
@@
R try_empty_container(...) {
<...
- container + 3
+ &container->link_word
...>
}

@try_empty_container_container_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R try_empty_container(...) {
<...
- (uw_object_hdr_t *)container
+ container
...>
}

@try_empty_container_container_parenthesized_type_flags@
type R;
@@
R try_empty_container(...) {
<...
- (container)->type_flags
+ container->type_flags
...>
}

@try_empty_container_container_parenthesized_position_word@
type R;
@@
R try_empty_container(...) {
<...
- (container)->position_word
+ container->position_word
...>
}

@try_empty_container_container_parenthesized_chain_word@
type R;
@@
R try_empty_container(...) {
<...
- (container)->chain_word
+ container->chain_word
...>
}

@try_empty_container_container_parenthesized_link_word@
type R;
@@
R try_empty_container(...) {
<...
- (container)->link_word
+ container->link_word
...>
}

@try_empty_container_container_parenthesized_item_id@
type R;
@@
R try_empty_container(...) {
<...
- (container)->item_id
+ container->item_id
...>
}

@try_empty_container_container_parenthesized_owner@
type R;
@@
R try_empty_container(...) {
<...
- (container)->owner
+ container->owner
...>
}

@try_empty_container_container_parenthesized_link@
type R;
@@
R try_empty_container(...) {
<...
- (container)->link
+ container->link
...>
}

@try_empty_container_container_parenthesized_quality@
type R;
@@
R try_empty_container(...) {
<...
- (container)->quality
+ container->quality
...>
}

@try_empty_container_container_parenthesized_next@
type R;
@@
R try_empty_container(...) {
<...
- (container)->next
+ container->next
...>
}

@try_empty_container_container_parenthesized_is_quant@
type R;
@@
R try_empty_container(...) {
<...
- (container)->is_quant
+ container->is_quant
...>
}

@try_empty_container_container_null@
type R;
typedef ushort;
@@
R try_empty_container(...) {
<...
- container != (ushort *)0x0
+ container != NULL
...>
}

@try_empty_container_container_null_equal@
type R;
typedef ushort;
@@
R try_empty_container(...) {
<...
- container == (ushort *)0x0
+ container == NULL
...>
}

@try_empty_container_container_quantity_zero@
type R;
@@
R try_empty_container(...) {
<...
- (container->type_flags & 0x8000) == 0
+ container->is_quant == 0
...>
}

@try_empty_container_container_quantity_nonzero@
type R;
@@
R try_empty_container(...) {
<...
- (container->type_flags & 0x8000) != 0
+ container->is_quant != 0
...>
}

@try_empty_container_container_next_zero@
type R;
@@
R try_empty_container(...) {
<...
- (container->chain_word & 0xffc0) == 0
+ container->next == 0
...>
}

@try_empty_container_container_next_nonzero@
type R;
@@
R try_empty_container(...) {
<...
- (container->chain_word & 0xffc0) != 0
+ container->next != 0
...>
}

@try_empty_container_container_link_zero@
type R;
@@
R try_empty_container(...) {
<...
- (container->link_word & 0xffc0) == 0
+ container->link == 0
...>
}

@try_empty_container_container_link_nonzero@
type R;
@@
R try_empty_container(...) {
<...
- (container->link_word & 0xffc0) != 0
+ container->link != 0
...>
}

@try_empty_container_container_class_6@
type R;
@@
R try_empty_container(...) {
<...
- container->type_flags >> 6 & 7
+ container->item_id >> 6 & 7
...>
}

@try_empty_container_container_class_4@
type R;
@@
R try_empty_container(...) {
<...
- container->type_flags >> 4 & 3
+ container->item_id >> 4 & 3
...>
}

@try_empty_container_container_mask_item_id@
type R;
typedef byte;
@@
R try_empty_container(...) {
<...
(
- container->type_flags & 0x1ff
+ container->item_id
|
- (byte)container->type_flags & 0x1ff
+ container->item_id
)
...>
}

@try_empty_container_container_mask_quality@
type R;
typedef byte;
@@
R try_empty_container(...) {
<...
(
- container->chain_word & 0x3f
+ container->quality
|
- (byte)container->chain_word & 0x3f
+ container->quality
)
...>
}

@try_empty_container_container_mask_owner@
type R;
typedef byte;
@@
R try_empty_container(...) {
<...
(
- container->link_word & 0x3f
+ container->owner
|
- (byte)container->link_word & 0x3f
+ container->owner
)
...>
}

@objects_can_stack_object_a_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
- ushort *object_a;
+ uw_object_hdr_t *object_a;
...>
}

@objects_can_stack_object_a_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
- object_a = (ushort *)E
+ object_a = E
...>
}

@objects_can_stack_object_a_word_0@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
(
- object_a[0]
+ object_a->type_flags
|
- *object_a
+ object_a->type_flags
)
...>
}

@objects_can_stack_object_a_word_1@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
(
- object_a[1]
+ object_a->position_word
)
...>
}

@objects_can_stack_object_a_word_2@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
(
- object_a[2]
+ object_a->chain_word
)
...>
}

@objects_can_stack_object_a_word_3@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
(
- object_a[3]
+ object_a->link_word
)
...>
}

@objects_can_stack_object_a_link_2@
type R;
@@
R objects_can_stack(...) {
<...
- object_a + 2
+ &object_a->chain_word
...>
}

@objects_can_stack_object_a_link_3@
type R;
@@
R objects_can_stack(...) {
<...
- object_a + 3
+ &object_a->link_word
...>
}

@objects_can_stack_object_a_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
- (uw_object_hdr_t *)object_a
+ object_a
...>
}

@objects_can_stack_object_a_parenthesized_type_flags@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->type_flags
+ object_a->type_flags
...>
}

@objects_can_stack_object_a_parenthesized_position_word@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->position_word
+ object_a->position_word
...>
}

@objects_can_stack_object_a_parenthesized_chain_word@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->chain_word
+ object_a->chain_word
...>
}

@objects_can_stack_object_a_parenthesized_link_word@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->link_word
+ object_a->link_word
...>
}

@objects_can_stack_object_a_parenthesized_item_id@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->item_id
+ object_a->item_id
...>
}

@objects_can_stack_object_a_parenthesized_owner@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->owner
+ object_a->owner
...>
}

@objects_can_stack_object_a_parenthesized_link@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->link
+ object_a->link
...>
}

@objects_can_stack_object_a_parenthesized_quality@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->quality
+ object_a->quality
...>
}

@objects_can_stack_object_a_parenthesized_next@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->next
+ object_a->next
...>
}

@objects_can_stack_object_a_parenthesized_is_quant@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a)->is_quant
+ object_a->is_quant
...>
}

@objects_can_stack_object_a_null@
type R;
typedef ushort;
@@
R objects_can_stack(...) {
<...
- object_a != (ushort *)0x0
+ object_a != NULL
...>
}

@objects_can_stack_object_a_null_equal@
type R;
typedef ushort;
@@
R objects_can_stack(...) {
<...
- object_a == (ushort *)0x0
+ object_a == NULL
...>
}

@objects_can_stack_object_a_quantity_zero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a->type_flags & 0x8000) == 0
+ object_a->is_quant == 0
...>
}

@objects_can_stack_object_a_quantity_nonzero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a->type_flags & 0x8000) != 0
+ object_a->is_quant != 0
...>
}

@objects_can_stack_object_a_next_zero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a->chain_word & 0xffc0) == 0
+ object_a->next == 0
...>
}

@objects_can_stack_object_a_next_nonzero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a->chain_word & 0xffc0) != 0
+ object_a->next != 0
...>
}

@objects_can_stack_object_a_link_zero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a->link_word & 0xffc0) == 0
+ object_a->link == 0
...>
}

@objects_can_stack_object_a_link_nonzero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_a->link_word & 0xffc0) != 0
+ object_a->link != 0
...>
}

@objects_can_stack_object_a_class_6@
type R;
@@
R objects_can_stack(...) {
<...
- object_a->type_flags >> 6 & 7
+ object_a->item_id >> 6 & 7
...>
}

@objects_can_stack_object_a_class_4@
type R;
@@
R objects_can_stack(...) {
<...
- object_a->type_flags >> 4 & 3
+ object_a->item_id >> 4 & 3
...>
}

@objects_can_stack_object_a_mask_item_id@
type R;
typedef byte;
@@
R objects_can_stack(...) {
<...
(
- object_a->type_flags & 0x1ff
+ object_a->item_id
|
- (byte)object_a->type_flags & 0x1ff
+ object_a->item_id
)
...>
}

@objects_can_stack_object_a_mask_quality@
type R;
typedef byte;
@@
R objects_can_stack(...) {
<...
(
- object_a->chain_word & 0x3f
+ object_a->quality
|
- (byte)object_a->chain_word & 0x3f
+ object_a->quality
)
...>
}

@objects_can_stack_object_a_mask_owner@
type R;
typedef byte;
@@
R objects_can_stack(...) {
<...
(
- object_a->link_word & 0x3f
+ object_a->owner
|
- (byte)object_a->link_word & 0x3f
+ object_a->owner
)
...>
}

@objects_can_stack_object_b_declaration@
type R;
typedef ushort, uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
- ushort *object_b;
+ uw_object_hdr_t *object_b;
...>
}

@objects_can_stack_object_b_casts@
type R;
expression E;
typedef ushort, uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
- object_b = (ushort *)E
+ object_b = E
...>
}

@objects_can_stack_object_b_word_0@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
(
- object_b[0]
+ object_b->type_flags
|
- *object_b
+ object_b->type_flags
)
...>
}

@objects_can_stack_object_b_word_1@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
(
- object_b[1]
+ object_b->position_word
)
...>
}

@objects_can_stack_object_b_word_2@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
(
- object_b[2]
+ object_b->chain_word
)
...>
}

@objects_can_stack_object_b_word_3@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
(
- object_b[3]
+ object_b->link_word
)
...>
}

@objects_can_stack_object_b_link_2@
type R;
@@
R objects_can_stack(...) {
<...
- object_b + 2
+ &object_b->chain_word
...>
}

@objects_can_stack_object_b_link_3@
type R;
@@
R objects_can_stack(...) {
<...
- object_b + 3
+ &object_b->link_word
...>
}

@objects_can_stack_object_b_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R objects_can_stack(...) {
<...
- (uw_object_hdr_t *)object_b
+ object_b
...>
}

@objects_can_stack_object_b_parenthesized_type_flags@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->type_flags
+ object_b->type_flags
...>
}

@objects_can_stack_object_b_parenthesized_position_word@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->position_word
+ object_b->position_word
...>
}

@objects_can_stack_object_b_parenthesized_chain_word@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->chain_word
+ object_b->chain_word
...>
}

@objects_can_stack_object_b_parenthesized_link_word@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->link_word
+ object_b->link_word
...>
}

@objects_can_stack_object_b_parenthesized_item_id@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->item_id
+ object_b->item_id
...>
}

@objects_can_stack_object_b_parenthesized_owner@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->owner
+ object_b->owner
...>
}

@objects_can_stack_object_b_parenthesized_link@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->link
+ object_b->link
...>
}

@objects_can_stack_object_b_parenthesized_quality@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->quality
+ object_b->quality
...>
}

@objects_can_stack_object_b_parenthesized_next@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->next
+ object_b->next
...>
}

@objects_can_stack_object_b_parenthesized_is_quant@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b)->is_quant
+ object_b->is_quant
...>
}

@objects_can_stack_object_b_null@
type R;
typedef ushort;
@@
R objects_can_stack(...) {
<...
- object_b != (ushort *)0x0
+ object_b != NULL
...>
}

@objects_can_stack_object_b_null_equal@
type R;
typedef ushort;
@@
R objects_can_stack(...) {
<...
- object_b == (ushort *)0x0
+ object_b == NULL
...>
}

@objects_can_stack_object_b_quantity_zero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b->type_flags & 0x8000) == 0
+ object_b->is_quant == 0
...>
}

@objects_can_stack_object_b_quantity_nonzero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b->type_flags & 0x8000) != 0
+ object_b->is_quant != 0
...>
}

@objects_can_stack_object_b_next_zero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b->chain_word & 0xffc0) == 0
+ object_b->next == 0
...>
}

@objects_can_stack_object_b_next_nonzero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b->chain_word & 0xffc0) != 0
+ object_b->next != 0
...>
}

@objects_can_stack_object_b_link_zero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b->link_word & 0xffc0) == 0
+ object_b->link == 0
...>
}

@objects_can_stack_object_b_link_nonzero@
type R;
@@
R objects_can_stack(...) {
<...
- (object_b->link_word & 0xffc0) != 0
+ object_b->link != 0
...>
}

@objects_can_stack_object_b_class_6@
type R;
@@
R objects_can_stack(...) {
<...
- object_b->type_flags >> 6 & 7
+ object_b->item_id >> 6 & 7
...>
}

@objects_can_stack_object_b_class_4@
type R;
@@
R objects_can_stack(...) {
<...
- object_b->type_flags >> 4 & 3
+ object_b->item_id >> 4 & 3
...>
}

@objects_can_stack_object_b_mask_item_id@
type R;
typedef byte;
@@
R objects_can_stack(...) {
<...
(
- object_b->type_flags & 0x1ff
+ object_b->item_id
|
- (byte)object_b->type_flags & 0x1ff
+ object_b->item_id
)
...>
}

@objects_can_stack_object_b_mask_quality@
type R;
typedef byte;
@@
R objects_can_stack(...) {
<...
(
- object_b->chain_word & 0x3f
+ object_b->quality
|
- (byte)object_b->chain_word & 0x3f
+ object_b->quality
)
...>
}

@objects_can_stack_object_b_mask_owner@
type R;
typedef byte;
@@
R objects_can_stack(...) {
<...
(
- object_b->link_word & 0x3f
+ object_b->owner
|
- (byte)object_b->link_word & 0x3f
+ object_b->owner
)
...>
}

@null_chain_return@
typedef ushort;
@@
uw_object_hdr_t *find_object_in_chain(...) {
<...
- return (ushort *)0x0;
+ return NULL;
...>
}
