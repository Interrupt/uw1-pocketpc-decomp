/* Context-limited patch: use apply_npc_combat_byte_offsets.py. */
@member_0@
@@
- DAT_0010190c->hdr.chain_word_low
+ DAT_0010190c->hdr.position_word_low

@member_1@
@@
- DAT_0010190c->hdr.chain_word
+ DAT_0010190c->hdr.position_word

@member_2@
@@
- DAT_0010190c->hdr.link_word_low
+ DAT_0010190c->hdr.position_word_high

@member_3@
@@
- DAT_0010190c->tile_word_low
+ DAT_0010190c->goal_word_low

@member_4@
@@
- DAT_0010190c->tile_word
+ DAT_0010190c->goal_word

@member_5@
@@
- DAT_0010190c->damage_source
+ DAT_0010190c->full_heading

@member_6@
@@
- DAT_0010190c->heading_flags
+ DAT_0010190c->goal_word_high

@member_7@
@@
- DAT_0010190c->npc_path_slot
+ DAT_0010190c->npc_goal

@byte_boundary@
typedef ushort;
expression E;
@@
- (ushort *)DAT_0010190c + E
+ (char *)DAT_0010190c + E

@iVar7_rec_type@
typedef uw_mobile_object_t;
@@
- char *iVar7_rec;
+ uw_mobile_object_t *iVar7_rec;

@iVar7_rec_assignment@
@@
- iVar7_rec = (char *)DAT_0010190c;
+ iVar7_rec = DAT_0010190c;

@iVar7_rec_goal_store@
@@
- *(char *)(iVar7_rec + 0xb)
+ iVar7_rec->goal_word_low

@iVar7_rec_heading@
typedef byte;
@@
- *(byte *)(iVar7_rec + 9)
+ iVar7_rec->full_heading

@iVar2_type@
typedef uw_mobile_object_t;
@@
- char *iVar2;
+ uw_mobile_object_t *iVar2;

@iVar2_assignment@
@@
- iVar2 = (char *)DAT_0010190c;
+ iVar2 = DAT_0010190c;

@iVar2_goal_store@
@@
- *(char *)(iVar2 + 0xb)
+ iVar2->goal_word_low

@iVar2_heading@
typedef byte;
@@
- *(byte *)(iVar2 + 9)
+ iVar2->full_heading
