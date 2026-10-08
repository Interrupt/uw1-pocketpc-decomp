@type_flags_item_id_ptr@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x1ff) >> 0
+ B->item_id
|
- (B->type_flags >> 0) & 0x1ff
+ B->item_id
|
- B->type_flags & 0x1ff
+ B->item_id
|
- (B->type_flags_signed & 0x1ff) >> 0
+ B->item_id
|
- (B->type_flags_signed >> 0) & 0x1ff
+ B->item_id
|
- B->type_flags_signed & 0x1ff
+ B->item_id
)

@type_flags_flags_res_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->type_flags >> 9) & 0x7
+ B->flags_res
|
- (B->type_flags >> 9) & 0x7
+ B->flags_res
|
- (B->type_flags & 0xe00) >> 9
+ B->flags_res
|
- B->type_flags & 0xe00
+ B->flags_res << 9
|
- (byte)(B->type_flags_signed >> 9) & 0x7
+ B->flags_res
|
- (B->type_flags_signed >> 9) & 0x7
+ B->flags_res
|
- (B->type_flags_signed & 0xe00) >> 9
+ B->flags_res
|
- B->type_flags_signed & 0xe00
+ B->flags_res << 9
|
- (byte)(B->type_flags_high >> 1) & 0x7
+ B->flags_res
|
- (B->type_flags_high >> 1) & 0x7
+ B->flags_res
|
- (B->type_flags_high & 0xe) >> 1
+ B->flags_res
|
- B->type_flags_high & 0xe
+ B->flags_res << 1
|
- (byte)((char)B->type_flags_high >> 1) & 0x7
+ B->flags_res
|
- ((char)B->type_flags_high >> 1) & 0x7
+ B->flags_res
|
- ((char)B->type_flags_high & 0xe) >> 1
+ B->flags_res
|
- (char)B->type_flags_high & 0xe
+ B->flags_res << 1
)

@type_flags_enchanted_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->type_flags >> 12) & 0x1
+ B->enchanted
|
- (B->type_flags >> 12) & 0x1
+ B->enchanted
|
- (B->type_flags & 0x1000) >> 12
+ B->enchanted
|
- B->type_flags & 0x1000
+ B->enchanted << 12
|
- (byte)(B->type_flags_signed >> 12) & 0x1
+ B->enchanted
|
- (B->type_flags_signed >> 12) & 0x1
+ B->enchanted
|
- (B->type_flags_signed & 0x1000) >> 12
+ B->enchanted
|
- B->type_flags_signed & 0x1000
+ B->enchanted << 12
|
- (byte)(B->type_flags_high >> 4) & 0x1
+ B->enchanted
|
- (B->type_flags_high >> 4) & 0x1
+ B->enchanted
|
- (B->type_flags_high & 0x10) >> 4
+ B->enchanted
|
- B->type_flags_high & 0x10
+ B->enchanted << 4
|
- (byte)((char)B->type_flags_high >> 4) & 0x1
+ B->enchanted
|
- ((char)B->type_flags_high >> 4) & 0x1
+ B->enchanted
|
- ((char)B->type_flags_high & 0x10) >> 4
+ B->enchanted
|
- (char)B->type_flags_high & 0x10
+ B->enchanted << 4
)

@type_flags_doordir_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->type_flags >> 13) & 0x1
+ B->doordir
|
- (B->type_flags >> 13) & 0x1
+ B->doordir
|
- (B->type_flags & 0x2000) >> 13
+ B->doordir
|
- B->type_flags & 0x2000
+ B->doordir << 13
|
- (byte)(B->type_flags_signed >> 13) & 0x1
+ B->doordir
|
- (B->type_flags_signed >> 13) & 0x1
+ B->doordir
|
- (B->type_flags_signed & 0x2000) >> 13
+ B->doordir
|
- B->type_flags_signed & 0x2000
+ B->doordir << 13
|
- (byte)(B->type_flags_high >> 5) & 0x1
+ B->doordir
|
- (B->type_flags_high >> 5) & 0x1
+ B->doordir
|
- (B->type_flags_high & 0x20) >> 5
+ B->doordir
|
- B->type_flags_high & 0x20
+ B->doordir << 5
|
- (byte)((char)B->type_flags_high >> 5) & 0x1
+ B->doordir
|
- ((char)B->type_flags_high >> 5) & 0x1
+ B->doordir
|
- ((char)B->type_flags_high & 0x20) >> 5
+ B->doordir
|
- (char)B->type_flags_high & 0x20
+ B->doordir << 5
)

@type_flags_invisible_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->type_flags >> 14) & 0x1
+ B->invisible
|
- (B->type_flags >> 14) & 0x1
+ B->invisible
|
- (B->type_flags & 0x4000) >> 14
+ B->invisible
|
- B->type_flags & 0x4000
+ B->invisible << 14
|
- (byte)(B->type_flags_signed >> 14) & 0x1
+ B->invisible
|
- (B->type_flags_signed >> 14) & 0x1
+ B->invisible
|
- (B->type_flags_signed & 0x4000) >> 14
+ B->invisible
|
- B->type_flags_signed & 0x4000
+ B->invisible << 14
|
- (byte)(B->type_flags_high >> 6) & 0x1
+ B->invisible
|
- (B->type_flags_high >> 6) & 0x1
+ B->invisible
|
- (B->type_flags_high & 0x40) >> 6
+ B->invisible
|
- B->type_flags_high & 0x40
+ B->invisible << 6
|
- (byte)((char)B->type_flags_high >> 6) & 0x1
+ B->invisible
|
- ((char)B->type_flags_high >> 6) & 0x1
+ B->invisible
|
- ((char)B->type_flags_high & 0x40) >> 6
+ B->invisible
|
- (char)B->type_flags_high & 0x40
+ B->invisible << 6
)

@type_flags_is_quant_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->type_flags >> 15) & 0x1
+ B->is_quant
|
- (B->type_flags >> 15) & 0x1
+ B->is_quant
|
- (B->type_flags & 0x8000) >> 15
+ B->is_quant
|
- B->type_flags >> 15
+ B->is_quant
|
- B->type_flags & 0x8000
+ B->is_quant << 15
|
- (byte)(B->type_flags_signed >> 15) & 0x1
+ B->is_quant
|
- (B->type_flags_signed >> 15) & 0x1
+ B->is_quant
|
- (B->type_flags_signed & 0x8000) >> 15
+ B->is_quant
|
- B->type_flags_signed & 0x8000
+ B->is_quant << 15
|
- (byte)(B->type_flags_high >> 7) & 0x1
+ B->is_quant
|
- (B->type_flags_high >> 7) & 0x1
+ B->is_quant
|
- (B->type_flags_high & 0x80) >> 7
+ B->is_quant
|
- B->type_flags_high >> 7
+ B->is_quant
|
- B->type_flags_high & 0x80
+ B->is_quant << 7
|
- (byte)((char)B->type_flags_high >> 7) & 0x1
+ B->is_quant
|
- ((char)B->type_flags_high >> 7) & 0x1
+ B->is_quant
|
- ((char)B->type_flags_high & 0x80) >> 7
+ B->is_quant
|
- (char)B->type_flags_high & 0x80
+ B->is_quant << 7
)

@position_word_zpos_ptr@
expression B;
typedef byte;
@@
(
- (B->position_word & 0x7f) >> 0
+ B->zpos
|
- (B->position_word >> 0) & 0x7f
+ B->zpos
|
- B->position_word & 0x7f
+ B->zpos
|
- (B->position_word_signed & 0x7f) >> 0
+ B->zpos
|
- (B->position_word_signed >> 0) & 0x7f
+ B->zpos
|
- B->position_word_signed & 0x7f
+ B->zpos
|
- (B->position_word_low & 0x7f) >> 0
+ B->zpos
|
- (B->position_word_low >> 0) & 0x7f
+ B->zpos
|
- B->position_word_low & 0x7f
+ B->zpos
|
- ((char)B->position_word_low & 0x7f) >> 0
+ B->zpos
|
- ((char)B->position_word_low >> 0) & 0x7f
+ B->zpos
|
- (char)B->position_word_low & 0x7f
+ B->zpos
|
- ((byte)B->position_word & 0x7f) >> 0
+ B->zpos
|
- ((byte)B->position_word >> 0) & 0x7f
+ B->zpos
|
- (byte)B->position_word & 0x7f
+ B->zpos
|
- ((char)B->position_word & 0x7f) >> 0
+ B->zpos
|
- ((char)B->position_word >> 0) & 0x7f
+ B->zpos
|
- (char)B->position_word & 0x7f
+ B->zpos
)

@position_word_heading_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->position_word >> 7) & 0x7
+ B->heading
|
- (B->position_word >> 7) & 0x7
+ B->heading
|
- (B->position_word & 0x380) >> 7
+ B->heading
|
- B->position_word & 0x380
+ B->heading << 7
|
- (byte)(B->position_word_signed >> 7) & 0x7
+ B->heading
|
- (B->position_word_signed >> 7) & 0x7
+ B->heading
|
- (B->position_word_signed & 0x380) >> 7
+ B->heading
|
- B->position_word_signed & 0x380
+ B->heading << 7
)

@position_word_ypos_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->position_word >> 10) & 0x7
+ B->ypos
|
- (B->position_word >> 10) & 0x7
+ B->ypos
|
- (B->position_word & 0x1c00) >> 10
+ B->ypos
|
- B->position_word & 0x1c00
+ B->ypos << 10
|
- (byte)(B->position_word_signed >> 10) & 0x7
+ B->ypos
|
- (B->position_word_signed >> 10) & 0x7
+ B->ypos
|
- (B->position_word_signed & 0x1c00) >> 10
+ B->ypos
|
- B->position_word_signed & 0x1c00
+ B->ypos << 10
|
- (byte)(B->position_word_high >> 2) & 0x7
+ B->ypos
|
- (B->position_word_high >> 2) & 0x7
+ B->ypos
|
- (B->position_word_high & 0x1c) >> 2
+ B->ypos
|
- B->position_word_high & 0x1c
+ B->ypos << 2
|
- (byte)((char)B->position_word_high >> 2) & 0x7
+ B->ypos
|
- ((char)B->position_word_high >> 2) & 0x7
+ B->ypos
|
- ((char)B->position_word_high & 0x1c) >> 2
+ B->ypos
|
- (char)B->position_word_high & 0x1c
+ B->ypos << 2
)

@position_word_xpos_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->position_word >> 13) & 0x7
+ B->xpos
|
- (B->position_word >> 13) & 0x7
+ B->xpos
|
- (B->position_word & 0xe000) >> 13
+ B->xpos
|
- B->position_word >> 13
+ B->xpos
|
- B->position_word & 0xe000
+ B->xpos << 13
|
- (byte)(B->position_word_signed >> 13) & 0x7
+ B->xpos
|
- (B->position_word_signed >> 13) & 0x7
+ B->xpos
|
- (B->position_word_signed & 0xe000) >> 13
+ B->xpos
|
- B->position_word_signed & 0xe000
+ B->xpos << 13
|
- (byte)(B->position_word_high >> 5) & 0x7
+ B->xpos
|
- (B->position_word_high >> 5) & 0x7
+ B->xpos
|
- (B->position_word_high & 0xe0) >> 5
+ B->xpos
|
- B->position_word_high >> 5
+ B->xpos
|
- B->position_word_high & 0xe0
+ B->xpos << 5
|
- (byte)((char)B->position_word_high >> 5) & 0x7
+ B->xpos
|
- ((char)B->position_word_high >> 5) & 0x7
+ B->xpos
|
- ((char)B->position_word_high & 0xe0) >> 5
+ B->xpos
|
- (char)B->position_word_high & 0xe0
+ B->xpos << 5
)

@chain_word_quality_ptr@
expression B;
typedef byte;
@@
(
- (B->chain_word & 0x3f) >> 0
+ B->quality
|
- (B->chain_word >> 0) & 0x3f
+ B->quality
|
- B->chain_word & 0x3f
+ B->quality
|
- (B->chain_word_signed & 0x3f) >> 0
+ B->quality
|
- (B->chain_word_signed >> 0) & 0x3f
+ B->quality
|
- B->chain_word_signed & 0x3f
+ B->quality
|
- (B->chain_word_low & 0x3f) >> 0
+ B->quality
|
- (B->chain_word_low >> 0) & 0x3f
+ B->quality
|
- B->chain_word_low & 0x3f
+ B->quality
|
- ((char)B->chain_word_low & 0x3f) >> 0
+ B->quality
|
- ((char)B->chain_word_low >> 0) & 0x3f
+ B->quality
|
- (char)B->chain_word_low & 0x3f
+ B->quality
|
- ((byte)B->chain_word & 0x3f) >> 0
+ B->quality
|
- ((byte)B->chain_word >> 0) & 0x3f
+ B->quality
|
- (byte)B->chain_word & 0x3f
+ B->quality
|
- ((char)B->chain_word & 0x3f) >> 0
+ B->quality
|
- ((char)B->chain_word >> 0) & 0x3f
+ B->quality
|
- (char)B->chain_word & 0x3f
+ B->quality
)

@chain_word_next_ptr@
expression B;
typedef byte;
@@
(
- (B->chain_word >> 6) & 0x3ff
+ B->next
|
- (B->chain_word & 0xffc0) >> 6
+ B->next
|
- B->chain_word >> 6
+ B->next
|
- B->chain_word & 0xffc0
+ B->next << 6
|
- (B->chain_word_signed >> 6) & 0x3ff
+ B->next
|
- (B->chain_word_signed & 0xffc0) >> 6
+ B->next
|
- B->chain_word_signed & 0xffc0
+ B->next << 6
)

@link_word_owner_ptr@
expression B;
typedef byte;
@@
(
- (B->link_word & 0x3f) >> 0
+ B->owner
|
- (B->link_word >> 0) & 0x3f
+ B->owner
|
- B->link_word & 0x3f
+ B->owner
|
- (B->link_word_signed & 0x3f) >> 0
+ B->owner
|
- (B->link_word_signed >> 0) & 0x3f
+ B->owner
|
- B->link_word_signed & 0x3f
+ B->owner
|
- (B->link_word_low & 0x3f) >> 0
+ B->owner
|
- (B->link_word_low >> 0) & 0x3f
+ B->owner
|
- B->link_word_low & 0x3f
+ B->owner
|
- ((char)B->link_word_low & 0x3f) >> 0
+ B->owner
|
- ((char)B->link_word_low >> 0) & 0x3f
+ B->owner
|
- (char)B->link_word_low & 0x3f
+ B->owner
|
- ((byte)B->link_word & 0x3f) >> 0
+ B->owner
|
- ((byte)B->link_word >> 0) & 0x3f
+ B->owner
|
- (byte)B->link_word & 0x3f
+ B->owner
|
- ((char)B->link_word & 0x3f) >> 0
+ B->owner
|
- ((char)B->link_word >> 0) & 0x3f
+ B->owner
|
- (char)B->link_word & 0x3f
+ B->owner
)

@link_word_link_ptr@
expression B;
typedef byte;
@@
(
- (B->link_word >> 6) & 0x3ff
+ B->link
|
- (B->link_word & 0xffc0) >> 6
+ B->link
|
- B->link_word >> 6
+ B->link
|
- B->link_word & 0xffc0
+ B->link << 6
|
- (B->link_word_signed >> 6) & 0x3ff
+ B->link
|
- (B->link_word_signed & 0xffc0) >> 6
+ B->link
|
- B->link_word_signed & 0xffc0
+ B->link << 6
)

@goal_word_npc_goal_ptr@
expression B;
typedef byte;
@@
(
- (B->goal_word & 0xf) >> 0
+ B->npc_goal
|
- (B->goal_word >> 0) & 0xf
+ B->npc_goal
|
- B->goal_word & 0xf
+ B->npc_goal
|
- (B->goal_word_signed & 0xf) >> 0
+ B->npc_goal
|
- (B->goal_word_signed >> 0) & 0xf
+ B->npc_goal
|
- B->goal_word_signed & 0xf
+ B->npc_goal
|
- (B->goal_word_low & 0xf) >> 0
+ B->npc_goal
|
- (B->goal_word_low >> 0) & 0xf
+ B->npc_goal
|
- B->goal_word_low & 0xf
+ B->npc_goal
|
- ((char)B->goal_word_low & 0xf) >> 0
+ B->npc_goal
|
- ((char)B->goal_word_low >> 0) & 0xf
+ B->npc_goal
|
- (char)B->goal_word_low & 0xf
+ B->npc_goal
|
- ((byte)B->goal_word & 0xf) >> 0
+ B->npc_goal
|
- ((byte)B->goal_word >> 0) & 0xf
+ B->npc_goal
|
- (byte)B->goal_word & 0xf
+ B->npc_goal
|
- ((char)B->goal_word & 0xf) >> 0
+ B->npc_goal
|
- ((char)B->goal_word >> 0) & 0xf
+ B->npc_goal
|
- (char)B->goal_word & 0xf
+ B->npc_goal
)

@goal_word_npc_gtarg_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->goal_word >> 4) & 0xff
+ B->npc_gtarg
|
- (B->goal_word >> 4) & 0xff
+ B->npc_gtarg
|
- (B->goal_word & 0xff0) >> 4
+ B->npc_gtarg
|
- B->goal_word & 0xff0
+ B->npc_gtarg << 4
|
- (byte)(B->goal_word_signed >> 4) & 0xff
+ B->npc_gtarg
|
- (B->goal_word_signed >> 4) & 0xff
+ B->npc_gtarg
|
- (B->goal_word_signed & 0xff0) >> 4
+ B->npc_gtarg
|
- B->goal_word_signed & 0xff0
+ B->npc_gtarg << 4
)

@goal_word_npc_animation_frame_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->goal_word >> 12) & 0xf
+ B->npc_animation_frame
|
- (B->goal_word >> 12) & 0xf
+ B->npc_animation_frame
|
- (B->goal_word & 0xf000) >> 12
+ B->npc_animation_frame
|
- B->goal_word >> 12
+ B->npc_animation_frame
|
- B->goal_word & 0xf000
+ B->npc_animation_frame << 12
|
- (byte)(B->goal_word_signed >> 12) & 0xf
+ B->npc_animation_frame
|
- (B->goal_word_signed >> 12) & 0xf
+ B->npc_animation_frame
|
- (B->goal_word_signed & 0xf000) >> 12
+ B->npc_animation_frame
|
- B->goal_word_signed & 0xf000
+ B->npc_animation_frame << 12
|
- (byte)(B->goal_word_high >> 4) & 0xf
+ B->npc_animation_frame
|
- (B->goal_word_high >> 4) & 0xf
+ B->npc_animation_frame
|
- (B->goal_word_high & 0xf0) >> 4
+ B->npc_animation_frame
|
- B->goal_word_high >> 4
+ B->npc_animation_frame
|
- B->goal_word_high & 0xf0
+ B->npc_animation_frame << 4
|
- (byte)((char)B->goal_word_high >> 4) & 0xf
+ B->npc_animation_frame
|
- ((char)B->goal_word_high >> 4) & 0xf
+ B->npc_animation_frame
|
- ((char)B->goal_word_high & 0xf0) >> 4
+ B->npc_animation_frame
|
- (char)B->goal_word_high & 0xf0
+ B->npc_animation_frame << 4
)

@status_word_npc_level_ptr@
expression B;
typedef byte;
@@
(
- (B->status_word & 0xf) >> 0
+ B->npc_level
|
- (B->status_word >> 0) & 0xf
+ B->npc_level
|
- B->status_word & 0xf
+ B->npc_level
|
- (B->status_word_signed & 0xf) >> 0
+ B->npc_level
|
- (B->status_word_signed >> 0) & 0xf
+ B->npc_level
|
- B->status_word_signed & 0xf
+ B->npc_level
|
- (B->status_word_low & 0xf) >> 0
+ B->npc_level
|
- (B->status_word_low >> 0) & 0xf
+ B->npc_level
|
- B->status_word_low & 0xf
+ B->npc_level
|
- ((char)B->status_word_low & 0xf) >> 0
+ B->npc_level
|
- ((char)B->status_word_low >> 0) & 0xf
+ B->npc_level
|
- (char)B->status_word_low & 0xf
+ B->npc_level
|
- ((byte)B->status_word & 0xf) >> 0
+ B->npc_level
|
- ((byte)B->status_word >> 0) & 0xf
+ B->npc_level
|
- (byte)B->status_word & 0xf
+ B->npc_level
|
- ((char)B->status_word & 0xf) >> 0
+ B->npc_level
|
- ((char)B->status_word >> 0) & 0xf
+ B->npc_level
|
- (char)B->status_word & 0xf
+ B->npc_level
)

@status_word_npc_talkedto_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->status_word >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word & 0x2000) >> 13
+ B->npc_talkedto
|
- B->status_word & 0x2000
+ B->npc_talkedto << 13
|
- (byte)(B->status_word_signed >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word_signed >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word_signed & 0x2000) >> 13
+ B->npc_talkedto
|
- B->status_word_signed & 0x2000
+ B->npc_talkedto << 13
|
- (byte)(B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- (B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- (B->status_word_high & 0x20) >> 5
+ B->npc_talkedto
|
- B->status_word_high & 0x20
+ B->npc_talkedto << 5
|
- (byte)((char)B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- ((char)B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- ((char)B->status_word_high & 0x20) >> 5
+ B->npc_talkedto
|
- (char)B->status_word_high & 0x20
+ B->npc_talkedto << 5
)

@status_word_npc_attitude_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->status_word >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word & 0xc000) >> 14
+ B->npc_attitude
|
- B->status_word >> 14
+ B->npc_attitude
|
- B->status_word & 0xc000
+ B->npc_attitude << 14
|
- (byte)(B->status_word_signed >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word_signed >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word_signed & 0xc000) >> 14
+ B->npc_attitude
|
- B->status_word_signed & 0xc000
+ B->npc_attitude << 14
|
- (byte)(B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- (B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- (B->status_word_high & 0xc0) >> 6
+ B->npc_attitude
|
- B->status_word_high >> 6
+ B->npc_attitude
|
- B->status_word_high & 0xc0
+ B->npc_attitude << 6
|
- (byte)((char)B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- ((char)B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- ((char)B->status_word_high & 0xc0) >> 6
+ B->npc_attitude
|
- (char)B->status_word_high & 0xc0
+ B->npc_attitude << 6
)

@target_word_npc_target_tile_x_ptr@
expression B;
typedef byte;
@@
(
- (B->target_word & 0x3f) >> 0
+ B->npc_target_tile_x
|
- (B->target_word >> 0) & 0x3f
+ B->npc_target_tile_x
|
- B->target_word & 0x3f
+ B->npc_target_tile_x
|
- (B->target_word_signed & 0x3f) >> 0
+ B->npc_target_tile_x
|
- (B->target_word_signed >> 0) & 0x3f
+ B->npc_target_tile_x
|
- B->target_word_signed & 0x3f
+ B->npc_target_tile_x
|
- (B->target_word_low & 0x3f) >> 0
+ B->npc_target_tile_x
|
- (B->target_word_low >> 0) & 0x3f
+ B->npc_target_tile_x
|
- B->target_word_low & 0x3f
+ B->npc_target_tile_x
|
- ((char)B->target_word_low & 0x3f) >> 0
+ B->npc_target_tile_x
|
- ((char)B->target_word_low >> 0) & 0x3f
+ B->npc_target_tile_x
|
- (char)B->target_word_low & 0x3f
+ B->npc_target_tile_x
|
- ((byte)B->target_word & 0x3f) >> 0
+ B->npc_target_tile_x
|
- ((byte)B->target_word >> 0) & 0x3f
+ B->npc_target_tile_x
|
- (byte)B->target_word & 0x3f
+ B->npc_target_tile_x
|
- ((char)B->target_word & 0x3f) >> 0
+ B->npc_target_tile_x
|
- ((char)B->target_word >> 0) & 0x3f
+ B->npc_target_tile_x
|
- (char)B->target_word & 0x3f
+ B->npc_target_tile_x
)

@target_word_npc_target_tile_y_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->target_word >> 6) & 0x3f
+ B->npc_target_tile_y
|
- (B->target_word >> 6) & 0x3f
+ B->npc_target_tile_y
|
- (B->target_word & 0xfc0) >> 6
+ B->npc_target_tile_y
|
- B->target_word & 0xfc0
+ B->npc_target_tile_y << 6
|
- (byte)(B->target_word_signed >> 6) & 0x3f
+ B->npc_target_tile_y
|
- (B->target_word_signed >> 6) & 0x3f
+ B->npc_target_tile_y
|
- (B->target_word_signed & 0xfc0) >> 6
+ B->npc_target_tile_y
|
- B->target_word_signed & 0xfc0
+ B->npc_target_tile_y << 6
)

@target_word_npc_swing_charge_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->target_word >> 12) & 0xf
+ B->npc_swing_charge
|
- (B->target_word >> 12) & 0xf
+ B->npc_swing_charge
|
- (B->target_word & 0xf000) >> 12
+ B->npc_swing_charge
|
- B->target_word >> 12
+ B->npc_swing_charge
|
- B->target_word & 0xf000
+ B->npc_swing_charge << 12
|
- (byte)(B->target_word_signed >> 12) & 0xf
+ B->npc_swing_charge
|
- (B->target_word_signed >> 12) & 0xf
+ B->npc_swing_charge
|
- (B->target_word_signed & 0xf000) >> 12
+ B->npc_swing_charge
|
- B->target_word_signed & 0xf000
+ B->npc_swing_charge << 12
|
- (byte)(B->target_word_high >> 4) & 0xf
+ B->npc_swing_charge
|
- (B->target_word_high >> 4) & 0xf
+ B->npc_swing_charge
|
- (B->target_word_high & 0xf0) >> 4
+ B->npc_swing_charge
|
- B->target_word_high >> 4
+ B->npc_swing_charge
|
- B->target_word_high & 0xf0
+ B->npc_swing_charge << 4
|
- (byte)((char)B->target_word_high >> 4) & 0xf
+ B->npc_swing_charge
|
- ((char)B->target_word_high >> 4) & 0xf
+ B->npc_swing_charge
|
- ((char)B->target_word_high & 0xf0) >> 4
+ B->npc_swing_charge
|
- (char)B->target_word_high & 0xf0
+ B->npc_swing_charge << 4
)

@tile_word_npc_path_slot_ptr@
expression B;
typedef byte;
@@
(
- (B->tile_word & 0xf) >> 0
+ B->npc_path_slot
|
- (B->tile_word >> 0) & 0xf
+ B->npc_path_slot
|
- B->tile_word & 0xf
+ B->npc_path_slot
|
- (B->tile_word_signed & 0xf) >> 0
+ B->npc_path_slot
|
- (B->tile_word_signed >> 0) & 0xf
+ B->npc_path_slot
|
- B->tile_word_signed & 0xf
+ B->npc_path_slot
|
- (B->tile_word_low & 0xf) >> 0
+ B->npc_path_slot
|
- (B->tile_word_low >> 0) & 0xf
+ B->npc_path_slot
|
- B->tile_word_low & 0xf
+ B->npc_path_slot
|
- ((char)B->tile_word_low & 0xf) >> 0
+ B->npc_path_slot
|
- ((char)B->tile_word_low >> 0) & 0xf
+ B->npc_path_slot
|
- (char)B->tile_word_low & 0xf
+ B->npc_path_slot
|
- ((byte)B->tile_word & 0xf) >> 0
+ B->npc_path_slot
|
- ((byte)B->tile_word >> 0) & 0xf
+ B->npc_path_slot
|
- (byte)B->tile_word & 0xf
+ B->npc_path_slot
|
- ((char)B->tile_word & 0xf) >> 0
+ B->npc_path_slot
|
- ((char)B->tile_word >> 0) & 0xf
+ B->npc_path_slot
|
- (char)B->tile_word & 0xf
+ B->npc_path_slot
)

@tile_word_npc_yhome_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->tile_word >> 4) & 0x3f
+ B->npc_yhome
|
- (B->tile_word >> 4) & 0x3f
+ B->npc_yhome
|
- (B->tile_word & 0x3f0) >> 4
+ B->npc_yhome
|
- B->tile_word & 0x3f0
+ B->npc_yhome << 4
|
- (byte)(B->tile_word_signed >> 4) & 0x3f
+ B->npc_yhome
|
- (B->tile_word_signed >> 4) & 0x3f
+ B->npc_yhome
|
- (B->tile_word_signed & 0x3f0) >> 4
+ B->npc_yhome
|
- B->tile_word_signed & 0x3f0
+ B->npc_yhome << 4
)

@tile_word_npc_xhome_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->tile_word >> 10) & 0x3f
+ B->npc_xhome
|
- (B->tile_word >> 10) & 0x3f
+ B->npc_xhome
|
- (B->tile_word & 0xfc00) >> 10
+ B->npc_xhome
|
- B->tile_word >> 10
+ B->npc_xhome
|
- B->tile_word & 0xfc00
+ B->npc_xhome << 10
|
- (byte)(B->tile_word_signed >> 10) & 0x3f
+ B->npc_xhome
|
- (B->tile_word_signed >> 10) & 0x3f
+ B->npc_xhome
|
- (B->tile_word_signed & 0xfc00) >> 10
+ B->npc_xhome
|
- B->tile_word_signed & 0xfc00
+ B->npc_xhome << 10
|
- (byte)(B->tile_word_high >> 2) & 0x3f
+ B->npc_xhome
|
- (B->tile_word_high >> 2) & 0x3f
+ B->npc_xhome
|
- (B->tile_word_high & 0xfc) >> 2
+ B->npc_xhome
|
- B->tile_word_high >> 2
+ B->npc_xhome
|
- B->tile_word_high & 0xfc
+ B->npc_xhome << 2
|
- (byte)((char)B->tile_word_high >> 2) & 0x3f
+ B->npc_xhome
|
- ((char)B->tile_word_high >> 2) & 0x3f
+ B->npc_xhome
|
- ((char)B->tile_word_high & 0xfc) >> 2
+ B->npc_xhome
|
- (char)B->tile_word_high & 0xfc
+ B->npc_xhome << 2
)

@size_weight_collision_radius_ptr@
expression B;
typedef byte;
@@
(
- (B->size_weight & 0x7) >> 0
+ B->collision_radius
|
- (B->size_weight >> 0) & 0x7
+ B->collision_radius
|
- B->size_weight & 0x7
+ B->collision_radius
|
- (B->size_weight_signed & 0x7) >> 0
+ B->collision_radius
|
- (B->size_weight_signed >> 0) & 0x7
+ B->collision_radius
|
- B->size_weight_signed & 0x7
+ B->collision_radius
|
- (B->size_weight_low & 0x7) >> 0
+ B->collision_radius
|
- (B->size_weight_low >> 0) & 0x7
+ B->collision_radius
|
- B->size_weight_low & 0x7
+ B->collision_radius
|
- ((char)B->size_weight_low & 0x7) >> 0
+ B->collision_radius
|
- ((char)B->size_weight_low >> 0) & 0x7
+ B->collision_radius
|
- (char)B->size_weight_low & 0x7
+ B->collision_radius
|
- ((byte)B->size_weight & 0x7) >> 0
+ B->collision_radius
|
- ((byte)B->size_weight >> 0) & 0x7
+ B->collision_radius
|
- (byte)B->size_weight & 0x7
+ B->collision_radius
|
- ((char)B->size_weight & 0x7) >> 0
+ B->collision_radius
|
- ((char)B->size_weight >> 0) & 0x7
+ B->collision_radius
|
- (char)B->size_weight & 0x7
+ B->collision_radius
)

@size_weight_animated_ptr@
expression B;
typedef byte;
@@
(
- (byte)(B->size_weight >> 3) & 0x1
+ B->animated
|
- (B->size_weight >> 3) & 0x1
+ B->animated
|
- (B->size_weight & 0x8) >> 3
+ B->animated
|
- B->size_weight & 0x8
+ B->animated << 3
|
- (byte)(B->size_weight_signed >> 3) & 0x1
+ B->animated
|
- (B->size_weight_signed >> 3) & 0x1
+ B->animated
|
- (B->size_weight_signed & 0x8) >> 3
+ B->animated
|
- B->size_weight_signed & 0x8
+ B->animated << 3
|
- (byte)(B->size_weight_low >> 3) & 0x1
+ B->animated
|
- (B->size_weight_low >> 3) & 0x1
+ B->animated
|
- (B->size_weight_low & 0x8) >> 3
+ B->animated
|
- B->size_weight_low & 0x8
+ B->animated << 3
|
- (byte)((char)B->size_weight_low >> 3) & 0x1
+ B->animated
|
- ((char)B->size_weight_low >> 3) & 0x1
+ B->animated
|
- ((char)B->size_weight_low & 0x8) >> 3
+ B->animated
|
- (char)B->size_weight_low & 0x8
+ B->animated << 3
|
- (byte)((byte)B->size_weight >> 3) & 0x1
+ B->animated
|
- ((byte)B->size_weight >> 3) & 0x1
+ B->animated
|
- ((byte)B->size_weight & 0x8) >> 3
+ B->animated
|
- (byte)B->size_weight & 0x8
+ B->animated << 3
|
- (byte)((char)B->size_weight >> 3) & 0x1
+ B->animated
|
- ((char)B->size_weight >> 3) & 0x1
+ B->animated
|
- ((char)B->size_weight & 0x8) >> 3
+ B->animated
|
- (char)B->size_weight & 0x8
+ B->animated << 3
)

@size_weight_unit_weight_ptr@
expression B;
typedef byte;
@@
(
- (B->size_weight >> 4) & 0xfff
+ B->unit_weight
|
- (B->size_weight & 0xfff0) >> 4
+ B->unit_weight
|
- B->size_weight >> 4
+ B->unit_weight
|
- B->size_weight & 0xfff0
+ B->unit_weight << 4
|
- (B->size_weight_signed >> 4) & 0xfff
+ B->unit_weight
|
- (B->size_weight_signed & 0xfff0) >> 4
+ B->unit_weight
|
- B->size_weight_signed & 0xfff0
+ B->unit_weight << 4
)

@owner_flags_can_have_owner_ptr@
expression B;
@@
(
- (byte)(B->owner_flags >> 7) & 0x1
+ B->can_have_owner
|
- (B->owner_flags >> 7) & 0x1
+ B->can_have_owner
|
- (B->owner_flags & 0x80) >> 7
+ B->can_have_owner
|
- B->owner_flags >> 7
+ B->can_have_owner
|
- B->owner_flags & 0x80
+ B->can_have_owner << 7
)

@description_flags_quality_type_ptr@
expression B;
@@
(
- (B->description_flags & 0xf) >> 0
+ B->quality_type
|
- (B->description_flags >> 0) & 0xf
+ B->quality_type
|
- B->description_flags & 0xf
+ B->quality_type
)

@description_flags_has_look_description_ptr@
expression B;
@@
(
- (byte)(B->description_flags >> 4) & 0x1
+ B->has_look_description
|
- (B->description_flags >> 4) & 0x1
+ B->has_look_description
|
- (B->description_flags & 0x10) >> 4
+ B->has_look_description
|
- B->description_flags & 0x10
+ B->has_look_description << 4
)

@heading_flags_npc_heading_ptr@
expression B;
@@
(
- (B->heading_flags & 0x1f) >> 0
+ B->npc_heading
|
- (B->heading_flags >> 0) & 0x1f
+ B->npc_heading
|
- B->heading_flags & 0x1f
+ B->npc_heading
)

@pitch_flags_pitch_ptr@
expression B;
@@
(
- (byte)(B->pitch_flags >> 3) & 0x1f
+ B->pitch
|
- (B->pitch_flags >> 3) & 0x1f
+ B->pitch
|
- (B->pitch_flags & 0xf8) >> 3
+ B->pitch
|
- B->pitch_flags >> 3
+ B->pitch
|
- B->pitch_flags & 0xf8
+ B->pitch << 3
)

@type_flags_item_id_value@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x1ff) >> 0
+ B.item_id
|
- (B.type_flags >> 0) & 0x1ff
+ B.item_id
|
- B.type_flags & 0x1ff
+ B.item_id
|
- (B.type_flags_signed & 0x1ff) >> 0
+ B.item_id
|
- (B.type_flags_signed >> 0) & 0x1ff
+ B.item_id
|
- B.type_flags_signed & 0x1ff
+ B.item_id
)

@type_flags_flags_res_value@
expression B;
typedef byte;
@@
(
- (byte)(B.type_flags >> 9) & 0x7
+ B.flags_res
|
- (B.type_flags >> 9) & 0x7
+ B.flags_res
|
- (B.type_flags & 0xe00) >> 9
+ B.flags_res
|
- B.type_flags & 0xe00
+ B.flags_res << 9
|
- (byte)(B.type_flags_signed >> 9) & 0x7
+ B.flags_res
|
- (B.type_flags_signed >> 9) & 0x7
+ B.flags_res
|
- (B.type_flags_signed & 0xe00) >> 9
+ B.flags_res
|
- B.type_flags_signed & 0xe00
+ B.flags_res << 9
|
- (byte)(B.type_flags_high >> 1) & 0x7
+ B.flags_res
|
- (B.type_flags_high >> 1) & 0x7
+ B.flags_res
|
- (B.type_flags_high & 0xe) >> 1
+ B.flags_res
|
- B.type_flags_high & 0xe
+ B.flags_res << 1
|
- (byte)((char)B.type_flags_high >> 1) & 0x7
+ B.flags_res
|
- ((char)B.type_flags_high >> 1) & 0x7
+ B.flags_res
|
- ((char)B.type_flags_high & 0xe) >> 1
+ B.flags_res
|
- (char)B.type_flags_high & 0xe
+ B.flags_res << 1
)

@type_flags_enchanted_value@
expression B;
typedef byte;
@@
(
- (byte)(B.type_flags >> 12) & 0x1
+ B.enchanted
|
- (B.type_flags >> 12) & 0x1
+ B.enchanted
|
- (B.type_flags & 0x1000) >> 12
+ B.enchanted
|
- B.type_flags & 0x1000
+ B.enchanted << 12
|
- (byte)(B.type_flags_signed >> 12) & 0x1
+ B.enchanted
|
- (B.type_flags_signed >> 12) & 0x1
+ B.enchanted
|
- (B.type_flags_signed & 0x1000) >> 12
+ B.enchanted
|
- B.type_flags_signed & 0x1000
+ B.enchanted << 12
|
- (byte)(B.type_flags_high >> 4) & 0x1
+ B.enchanted
|
- (B.type_flags_high >> 4) & 0x1
+ B.enchanted
|
- (B.type_flags_high & 0x10) >> 4
+ B.enchanted
|
- B.type_flags_high & 0x10
+ B.enchanted << 4
|
- (byte)((char)B.type_flags_high >> 4) & 0x1
+ B.enchanted
|
- ((char)B.type_flags_high >> 4) & 0x1
+ B.enchanted
|
- ((char)B.type_flags_high & 0x10) >> 4
+ B.enchanted
|
- (char)B.type_flags_high & 0x10
+ B.enchanted << 4
)

@type_flags_doordir_value@
expression B;
typedef byte;
@@
(
- (byte)(B.type_flags >> 13) & 0x1
+ B.doordir
|
- (B.type_flags >> 13) & 0x1
+ B.doordir
|
- (B.type_flags & 0x2000) >> 13
+ B.doordir
|
- B.type_flags & 0x2000
+ B.doordir << 13
|
- (byte)(B.type_flags_signed >> 13) & 0x1
+ B.doordir
|
- (B.type_flags_signed >> 13) & 0x1
+ B.doordir
|
- (B.type_flags_signed & 0x2000) >> 13
+ B.doordir
|
- B.type_flags_signed & 0x2000
+ B.doordir << 13
|
- (byte)(B.type_flags_high >> 5) & 0x1
+ B.doordir
|
- (B.type_flags_high >> 5) & 0x1
+ B.doordir
|
- (B.type_flags_high & 0x20) >> 5
+ B.doordir
|
- B.type_flags_high & 0x20
+ B.doordir << 5
|
- (byte)((char)B.type_flags_high >> 5) & 0x1
+ B.doordir
|
- ((char)B.type_flags_high >> 5) & 0x1
+ B.doordir
|
- ((char)B.type_flags_high & 0x20) >> 5
+ B.doordir
|
- (char)B.type_flags_high & 0x20
+ B.doordir << 5
)

@type_flags_invisible_value@
expression B;
typedef byte;
@@
(
- (byte)(B.type_flags >> 14) & 0x1
+ B.invisible
|
- (B.type_flags >> 14) & 0x1
+ B.invisible
|
- (B.type_flags & 0x4000) >> 14
+ B.invisible
|
- B.type_flags & 0x4000
+ B.invisible << 14
|
- (byte)(B.type_flags_signed >> 14) & 0x1
+ B.invisible
|
- (B.type_flags_signed >> 14) & 0x1
+ B.invisible
|
- (B.type_flags_signed & 0x4000) >> 14
+ B.invisible
|
- B.type_flags_signed & 0x4000
+ B.invisible << 14
|
- (byte)(B.type_flags_high >> 6) & 0x1
+ B.invisible
|
- (B.type_flags_high >> 6) & 0x1
+ B.invisible
|
- (B.type_flags_high & 0x40) >> 6
+ B.invisible
|
- B.type_flags_high & 0x40
+ B.invisible << 6
|
- (byte)((char)B.type_flags_high >> 6) & 0x1
+ B.invisible
|
- ((char)B.type_flags_high >> 6) & 0x1
+ B.invisible
|
- ((char)B.type_flags_high & 0x40) >> 6
+ B.invisible
|
- (char)B.type_flags_high & 0x40
+ B.invisible << 6
)

@type_flags_is_quant_value@
expression B;
typedef byte;
@@
(
- (byte)(B.type_flags >> 15) & 0x1
+ B.is_quant
|
- (B.type_flags >> 15) & 0x1
+ B.is_quant
|
- (B.type_flags & 0x8000) >> 15
+ B.is_quant
|
- B.type_flags >> 15
+ B.is_quant
|
- B.type_flags & 0x8000
+ B.is_quant << 15
|
- (byte)(B.type_flags_signed >> 15) & 0x1
+ B.is_quant
|
- (B.type_flags_signed >> 15) & 0x1
+ B.is_quant
|
- (B.type_flags_signed & 0x8000) >> 15
+ B.is_quant
|
- B.type_flags_signed & 0x8000
+ B.is_quant << 15
|
- (byte)(B.type_flags_high >> 7) & 0x1
+ B.is_quant
|
- (B.type_flags_high >> 7) & 0x1
+ B.is_quant
|
- (B.type_flags_high & 0x80) >> 7
+ B.is_quant
|
- B.type_flags_high >> 7
+ B.is_quant
|
- B.type_flags_high & 0x80
+ B.is_quant << 7
|
- (byte)((char)B.type_flags_high >> 7) & 0x1
+ B.is_quant
|
- ((char)B.type_flags_high >> 7) & 0x1
+ B.is_quant
|
- ((char)B.type_flags_high & 0x80) >> 7
+ B.is_quant
|
- (char)B.type_flags_high & 0x80
+ B.is_quant << 7
)

@position_word_zpos_value@
expression B;
typedef byte;
@@
(
- (B.position_word & 0x7f) >> 0
+ B.zpos
|
- (B.position_word >> 0) & 0x7f
+ B.zpos
|
- B.position_word & 0x7f
+ B.zpos
|
- (B.position_word_signed & 0x7f) >> 0
+ B.zpos
|
- (B.position_word_signed >> 0) & 0x7f
+ B.zpos
|
- B.position_word_signed & 0x7f
+ B.zpos
|
- (B.position_word_low & 0x7f) >> 0
+ B.zpos
|
- (B.position_word_low >> 0) & 0x7f
+ B.zpos
|
- B.position_word_low & 0x7f
+ B.zpos
|
- ((char)B.position_word_low & 0x7f) >> 0
+ B.zpos
|
- ((char)B.position_word_low >> 0) & 0x7f
+ B.zpos
|
- (char)B.position_word_low & 0x7f
+ B.zpos
|
- ((byte)B.position_word & 0x7f) >> 0
+ B.zpos
|
- ((byte)B.position_word >> 0) & 0x7f
+ B.zpos
|
- (byte)B.position_word & 0x7f
+ B.zpos
|
- ((char)B.position_word & 0x7f) >> 0
+ B.zpos
|
- ((char)B.position_word >> 0) & 0x7f
+ B.zpos
|
- (char)B.position_word & 0x7f
+ B.zpos
)

@position_word_heading_value@
expression B;
typedef byte;
@@
(
- (byte)(B.position_word >> 7) & 0x7
+ B.heading
|
- (B.position_word >> 7) & 0x7
+ B.heading
|
- (B.position_word & 0x380) >> 7
+ B.heading
|
- B.position_word & 0x380
+ B.heading << 7
|
- (byte)(B.position_word_signed >> 7) & 0x7
+ B.heading
|
- (B.position_word_signed >> 7) & 0x7
+ B.heading
|
- (B.position_word_signed & 0x380) >> 7
+ B.heading
|
- B.position_word_signed & 0x380
+ B.heading << 7
)

@position_word_ypos_value@
expression B;
typedef byte;
@@
(
- (byte)(B.position_word >> 10) & 0x7
+ B.ypos
|
- (B.position_word >> 10) & 0x7
+ B.ypos
|
- (B.position_word & 0x1c00) >> 10
+ B.ypos
|
- B.position_word & 0x1c00
+ B.ypos << 10
|
- (byte)(B.position_word_signed >> 10) & 0x7
+ B.ypos
|
- (B.position_word_signed >> 10) & 0x7
+ B.ypos
|
- (B.position_word_signed & 0x1c00) >> 10
+ B.ypos
|
- B.position_word_signed & 0x1c00
+ B.ypos << 10
|
- (byte)(B.position_word_high >> 2) & 0x7
+ B.ypos
|
- (B.position_word_high >> 2) & 0x7
+ B.ypos
|
- (B.position_word_high & 0x1c) >> 2
+ B.ypos
|
- B.position_word_high & 0x1c
+ B.ypos << 2
|
- (byte)((char)B.position_word_high >> 2) & 0x7
+ B.ypos
|
- ((char)B.position_word_high >> 2) & 0x7
+ B.ypos
|
- ((char)B.position_word_high & 0x1c) >> 2
+ B.ypos
|
- (char)B.position_word_high & 0x1c
+ B.ypos << 2
)

@position_word_xpos_value@
expression B;
typedef byte;
@@
(
- (byte)(B.position_word >> 13) & 0x7
+ B.xpos
|
- (B.position_word >> 13) & 0x7
+ B.xpos
|
- (B.position_word & 0xe000) >> 13
+ B.xpos
|
- B.position_word >> 13
+ B.xpos
|
- B.position_word & 0xe000
+ B.xpos << 13
|
- (byte)(B.position_word_signed >> 13) & 0x7
+ B.xpos
|
- (B.position_word_signed >> 13) & 0x7
+ B.xpos
|
- (B.position_word_signed & 0xe000) >> 13
+ B.xpos
|
- B.position_word_signed & 0xe000
+ B.xpos << 13
|
- (byte)(B.position_word_high >> 5) & 0x7
+ B.xpos
|
- (B.position_word_high >> 5) & 0x7
+ B.xpos
|
- (B.position_word_high & 0xe0) >> 5
+ B.xpos
|
- B.position_word_high >> 5
+ B.xpos
|
- B.position_word_high & 0xe0
+ B.xpos << 5
|
- (byte)((char)B.position_word_high >> 5) & 0x7
+ B.xpos
|
- ((char)B.position_word_high >> 5) & 0x7
+ B.xpos
|
- ((char)B.position_word_high & 0xe0) >> 5
+ B.xpos
|
- (char)B.position_word_high & 0xe0
+ B.xpos << 5
)

@chain_word_quality_value@
expression B;
typedef byte;
@@
(
- (B.chain_word & 0x3f) >> 0
+ B.quality
|
- (B.chain_word >> 0) & 0x3f
+ B.quality
|
- B.chain_word & 0x3f
+ B.quality
|
- (B.chain_word_signed & 0x3f) >> 0
+ B.quality
|
- (B.chain_word_signed >> 0) & 0x3f
+ B.quality
|
- B.chain_word_signed & 0x3f
+ B.quality
|
- (B.chain_word_low & 0x3f) >> 0
+ B.quality
|
- (B.chain_word_low >> 0) & 0x3f
+ B.quality
|
- B.chain_word_low & 0x3f
+ B.quality
|
- ((char)B.chain_word_low & 0x3f) >> 0
+ B.quality
|
- ((char)B.chain_word_low >> 0) & 0x3f
+ B.quality
|
- (char)B.chain_word_low & 0x3f
+ B.quality
|
- ((byte)B.chain_word & 0x3f) >> 0
+ B.quality
|
- ((byte)B.chain_word >> 0) & 0x3f
+ B.quality
|
- (byte)B.chain_word & 0x3f
+ B.quality
|
- ((char)B.chain_word & 0x3f) >> 0
+ B.quality
|
- ((char)B.chain_word >> 0) & 0x3f
+ B.quality
|
- (char)B.chain_word & 0x3f
+ B.quality
)

@chain_word_next_value@
expression B;
typedef byte;
@@
(
- (B.chain_word >> 6) & 0x3ff
+ B.next
|
- (B.chain_word & 0xffc0) >> 6
+ B.next
|
- B.chain_word >> 6
+ B.next
|
- B.chain_word & 0xffc0
+ B.next << 6
|
- (B.chain_word_signed >> 6) & 0x3ff
+ B.next
|
- (B.chain_word_signed & 0xffc0) >> 6
+ B.next
|
- B.chain_word_signed & 0xffc0
+ B.next << 6
)

@link_word_owner_value@
expression B;
typedef byte;
@@
(
- (B.link_word & 0x3f) >> 0
+ B.owner
|
- (B.link_word >> 0) & 0x3f
+ B.owner
|
- B.link_word & 0x3f
+ B.owner
|
- (B.link_word_signed & 0x3f) >> 0
+ B.owner
|
- (B.link_word_signed >> 0) & 0x3f
+ B.owner
|
- B.link_word_signed & 0x3f
+ B.owner
|
- (B.link_word_low & 0x3f) >> 0
+ B.owner
|
- (B.link_word_low >> 0) & 0x3f
+ B.owner
|
- B.link_word_low & 0x3f
+ B.owner
|
- ((char)B.link_word_low & 0x3f) >> 0
+ B.owner
|
- ((char)B.link_word_low >> 0) & 0x3f
+ B.owner
|
- (char)B.link_word_low & 0x3f
+ B.owner
|
- ((byte)B.link_word & 0x3f) >> 0
+ B.owner
|
- ((byte)B.link_word >> 0) & 0x3f
+ B.owner
|
- (byte)B.link_word & 0x3f
+ B.owner
|
- ((char)B.link_word & 0x3f) >> 0
+ B.owner
|
- ((char)B.link_word >> 0) & 0x3f
+ B.owner
|
- (char)B.link_word & 0x3f
+ B.owner
)

@link_word_link_value@
expression B;
typedef byte;
@@
(
- (B.link_word >> 6) & 0x3ff
+ B.link
|
- (B.link_word & 0xffc0) >> 6
+ B.link
|
- B.link_word >> 6
+ B.link
|
- B.link_word & 0xffc0
+ B.link << 6
|
- (B.link_word_signed >> 6) & 0x3ff
+ B.link
|
- (B.link_word_signed & 0xffc0) >> 6
+ B.link
|
- B.link_word_signed & 0xffc0
+ B.link << 6
)

@goal_word_npc_goal_value@
expression B;
typedef byte;
@@
(
- (B.goal_word & 0xf) >> 0
+ B.npc_goal
|
- (B.goal_word >> 0) & 0xf
+ B.npc_goal
|
- B.goal_word & 0xf
+ B.npc_goal
|
- (B.goal_word_signed & 0xf) >> 0
+ B.npc_goal
|
- (B.goal_word_signed >> 0) & 0xf
+ B.npc_goal
|
- B.goal_word_signed & 0xf
+ B.npc_goal
|
- (B.goal_word_low & 0xf) >> 0
+ B.npc_goal
|
- (B.goal_word_low >> 0) & 0xf
+ B.npc_goal
|
- B.goal_word_low & 0xf
+ B.npc_goal
|
- ((char)B.goal_word_low & 0xf) >> 0
+ B.npc_goal
|
- ((char)B.goal_word_low >> 0) & 0xf
+ B.npc_goal
|
- (char)B.goal_word_low & 0xf
+ B.npc_goal
|
- ((byte)B.goal_word & 0xf) >> 0
+ B.npc_goal
|
- ((byte)B.goal_word >> 0) & 0xf
+ B.npc_goal
|
- (byte)B.goal_word & 0xf
+ B.npc_goal
|
- ((char)B.goal_word & 0xf) >> 0
+ B.npc_goal
|
- ((char)B.goal_word >> 0) & 0xf
+ B.npc_goal
|
- (char)B.goal_word & 0xf
+ B.npc_goal
)

@goal_word_npc_gtarg_value@
expression B;
typedef byte;
@@
(
- (byte)(B.goal_word >> 4) & 0xff
+ B.npc_gtarg
|
- (B.goal_word >> 4) & 0xff
+ B.npc_gtarg
|
- (B.goal_word & 0xff0) >> 4
+ B.npc_gtarg
|
- B.goal_word & 0xff0
+ B.npc_gtarg << 4
|
- (byte)(B.goal_word_signed >> 4) & 0xff
+ B.npc_gtarg
|
- (B.goal_word_signed >> 4) & 0xff
+ B.npc_gtarg
|
- (B.goal_word_signed & 0xff0) >> 4
+ B.npc_gtarg
|
- B.goal_word_signed & 0xff0
+ B.npc_gtarg << 4
)

@goal_word_npc_animation_frame_value@
expression B;
typedef byte;
@@
(
- (byte)(B.goal_word >> 12) & 0xf
+ B.npc_animation_frame
|
- (B.goal_word >> 12) & 0xf
+ B.npc_animation_frame
|
- (B.goal_word & 0xf000) >> 12
+ B.npc_animation_frame
|
- B.goal_word >> 12
+ B.npc_animation_frame
|
- B.goal_word & 0xf000
+ B.npc_animation_frame << 12
|
- (byte)(B.goal_word_signed >> 12) & 0xf
+ B.npc_animation_frame
|
- (B.goal_word_signed >> 12) & 0xf
+ B.npc_animation_frame
|
- (B.goal_word_signed & 0xf000) >> 12
+ B.npc_animation_frame
|
- B.goal_word_signed & 0xf000
+ B.npc_animation_frame << 12
|
- (byte)(B.goal_word_high >> 4) & 0xf
+ B.npc_animation_frame
|
- (B.goal_word_high >> 4) & 0xf
+ B.npc_animation_frame
|
- (B.goal_word_high & 0xf0) >> 4
+ B.npc_animation_frame
|
- B.goal_word_high >> 4
+ B.npc_animation_frame
|
- B.goal_word_high & 0xf0
+ B.npc_animation_frame << 4
|
- (byte)((char)B.goal_word_high >> 4) & 0xf
+ B.npc_animation_frame
|
- ((char)B.goal_word_high >> 4) & 0xf
+ B.npc_animation_frame
|
- ((char)B.goal_word_high & 0xf0) >> 4
+ B.npc_animation_frame
|
- (char)B.goal_word_high & 0xf0
+ B.npc_animation_frame << 4
)

@status_word_npc_level_value@
expression B;
typedef byte;
@@
(
- (B.status_word & 0xf) >> 0
+ B.npc_level
|
- (B.status_word >> 0) & 0xf
+ B.npc_level
|
- B.status_word & 0xf
+ B.npc_level
|
- (B.status_word_signed & 0xf) >> 0
+ B.npc_level
|
- (B.status_word_signed >> 0) & 0xf
+ B.npc_level
|
- B.status_word_signed & 0xf
+ B.npc_level
|
- (B.status_word_low & 0xf) >> 0
+ B.npc_level
|
- (B.status_word_low >> 0) & 0xf
+ B.npc_level
|
- B.status_word_low & 0xf
+ B.npc_level
|
- ((char)B.status_word_low & 0xf) >> 0
+ B.npc_level
|
- ((char)B.status_word_low >> 0) & 0xf
+ B.npc_level
|
- (char)B.status_word_low & 0xf
+ B.npc_level
|
- ((byte)B.status_word & 0xf) >> 0
+ B.npc_level
|
- ((byte)B.status_word >> 0) & 0xf
+ B.npc_level
|
- (byte)B.status_word & 0xf
+ B.npc_level
|
- ((char)B.status_word & 0xf) >> 0
+ B.npc_level
|
- ((char)B.status_word >> 0) & 0xf
+ B.npc_level
|
- (char)B.status_word & 0xf
+ B.npc_level
)

@status_word_npc_talkedto_value@
expression B;
typedef byte;
@@
(
- (byte)(B.status_word >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word & 0x2000) >> 13
+ B.npc_talkedto
|
- B.status_word & 0x2000
+ B.npc_talkedto << 13
|
- (byte)(B.status_word_signed >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word_signed >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word_signed & 0x2000) >> 13
+ B.npc_talkedto
|
- B.status_word_signed & 0x2000
+ B.npc_talkedto << 13
|
- (byte)(B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- (B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- (B.status_word_high & 0x20) >> 5
+ B.npc_talkedto
|
- B.status_word_high & 0x20
+ B.npc_talkedto << 5
|
- (byte)((char)B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- ((char)B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- ((char)B.status_word_high & 0x20) >> 5
+ B.npc_talkedto
|
- (char)B.status_word_high & 0x20
+ B.npc_talkedto << 5
)

@status_word_npc_attitude_value@
expression B;
typedef byte;
@@
(
- (byte)(B.status_word >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word & 0xc000) >> 14
+ B.npc_attitude
|
- B.status_word >> 14
+ B.npc_attitude
|
- B.status_word & 0xc000
+ B.npc_attitude << 14
|
- (byte)(B.status_word_signed >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word_signed >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word_signed & 0xc000) >> 14
+ B.npc_attitude
|
- B.status_word_signed & 0xc000
+ B.npc_attitude << 14
|
- (byte)(B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- (B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- (B.status_word_high & 0xc0) >> 6
+ B.npc_attitude
|
- B.status_word_high >> 6
+ B.npc_attitude
|
- B.status_word_high & 0xc0
+ B.npc_attitude << 6
|
- (byte)((char)B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- ((char)B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- ((char)B.status_word_high & 0xc0) >> 6
+ B.npc_attitude
|
- (char)B.status_word_high & 0xc0
+ B.npc_attitude << 6
)

@target_word_npc_target_tile_x_value@
expression B;
typedef byte;
@@
(
- (B.target_word & 0x3f) >> 0
+ B.npc_target_tile_x
|
- (B.target_word >> 0) & 0x3f
+ B.npc_target_tile_x
|
- B.target_word & 0x3f
+ B.npc_target_tile_x
|
- (B.target_word_signed & 0x3f) >> 0
+ B.npc_target_tile_x
|
- (B.target_word_signed >> 0) & 0x3f
+ B.npc_target_tile_x
|
- B.target_word_signed & 0x3f
+ B.npc_target_tile_x
|
- (B.target_word_low & 0x3f) >> 0
+ B.npc_target_tile_x
|
- (B.target_word_low >> 0) & 0x3f
+ B.npc_target_tile_x
|
- B.target_word_low & 0x3f
+ B.npc_target_tile_x
|
- ((char)B.target_word_low & 0x3f) >> 0
+ B.npc_target_tile_x
|
- ((char)B.target_word_low >> 0) & 0x3f
+ B.npc_target_tile_x
|
- (char)B.target_word_low & 0x3f
+ B.npc_target_tile_x
|
- ((byte)B.target_word & 0x3f) >> 0
+ B.npc_target_tile_x
|
- ((byte)B.target_word >> 0) & 0x3f
+ B.npc_target_tile_x
|
- (byte)B.target_word & 0x3f
+ B.npc_target_tile_x
|
- ((char)B.target_word & 0x3f) >> 0
+ B.npc_target_tile_x
|
- ((char)B.target_word >> 0) & 0x3f
+ B.npc_target_tile_x
|
- (char)B.target_word & 0x3f
+ B.npc_target_tile_x
)

@target_word_npc_target_tile_y_value@
expression B;
typedef byte;
@@
(
- (byte)(B.target_word >> 6) & 0x3f
+ B.npc_target_tile_y
|
- (B.target_word >> 6) & 0x3f
+ B.npc_target_tile_y
|
- (B.target_word & 0xfc0) >> 6
+ B.npc_target_tile_y
|
- B.target_word & 0xfc0
+ B.npc_target_tile_y << 6
|
- (byte)(B.target_word_signed >> 6) & 0x3f
+ B.npc_target_tile_y
|
- (B.target_word_signed >> 6) & 0x3f
+ B.npc_target_tile_y
|
- (B.target_word_signed & 0xfc0) >> 6
+ B.npc_target_tile_y
|
- B.target_word_signed & 0xfc0
+ B.npc_target_tile_y << 6
)

@target_word_npc_swing_charge_value@
expression B;
typedef byte;
@@
(
- (byte)(B.target_word >> 12) & 0xf
+ B.npc_swing_charge
|
- (B.target_word >> 12) & 0xf
+ B.npc_swing_charge
|
- (B.target_word & 0xf000) >> 12
+ B.npc_swing_charge
|
- B.target_word >> 12
+ B.npc_swing_charge
|
- B.target_word & 0xf000
+ B.npc_swing_charge << 12
|
- (byte)(B.target_word_signed >> 12) & 0xf
+ B.npc_swing_charge
|
- (B.target_word_signed >> 12) & 0xf
+ B.npc_swing_charge
|
- (B.target_word_signed & 0xf000) >> 12
+ B.npc_swing_charge
|
- B.target_word_signed & 0xf000
+ B.npc_swing_charge << 12
|
- (byte)(B.target_word_high >> 4) & 0xf
+ B.npc_swing_charge
|
- (B.target_word_high >> 4) & 0xf
+ B.npc_swing_charge
|
- (B.target_word_high & 0xf0) >> 4
+ B.npc_swing_charge
|
- B.target_word_high >> 4
+ B.npc_swing_charge
|
- B.target_word_high & 0xf0
+ B.npc_swing_charge << 4
|
- (byte)((char)B.target_word_high >> 4) & 0xf
+ B.npc_swing_charge
|
- ((char)B.target_word_high >> 4) & 0xf
+ B.npc_swing_charge
|
- ((char)B.target_word_high & 0xf0) >> 4
+ B.npc_swing_charge
|
- (char)B.target_word_high & 0xf0
+ B.npc_swing_charge << 4
)

@tile_word_npc_path_slot_value@
expression B;
typedef byte;
@@
(
- (B.tile_word & 0xf) >> 0
+ B.npc_path_slot
|
- (B.tile_word >> 0) & 0xf
+ B.npc_path_slot
|
- B.tile_word & 0xf
+ B.npc_path_slot
|
- (B.tile_word_signed & 0xf) >> 0
+ B.npc_path_slot
|
- (B.tile_word_signed >> 0) & 0xf
+ B.npc_path_slot
|
- B.tile_word_signed & 0xf
+ B.npc_path_slot
|
- (B.tile_word_low & 0xf) >> 0
+ B.npc_path_slot
|
- (B.tile_word_low >> 0) & 0xf
+ B.npc_path_slot
|
- B.tile_word_low & 0xf
+ B.npc_path_slot
|
- ((char)B.tile_word_low & 0xf) >> 0
+ B.npc_path_slot
|
- ((char)B.tile_word_low >> 0) & 0xf
+ B.npc_path_slot
|
- (char)B.tile_word_low & 0xf
+ B.npc_path_slot
|
- ((byte)B.tile_word & 0xf) >> 0
+ B.npc_path_slot
|
- ((byte)B.tile_word >> 0) & 0xf
+ B.npc_path_slot
|
- (byte)B.tile_word & 0xf
+ B.npc_path_slot
|
- ((char)B.tile_word & 0xf) >> 0
+ B.npc_path_slot
|
- ((char)B.tile_word >> 0) & 0xf
+ B.npc_path_slot
|
- (char)B.tile_word & 0xf
+ B.npc_path_slot
)

@tile_word_npc_yhome_value@
expression B;
typedef byte;
@@
(
- (byte)(B.tile_word >> 4) & 0x3f
+ B.npc_yhome
|
- (B.tile_word >> 4) & 0x3f
+ B.npc_yhome
|
- (B.tile_word & 0x3f0) >> 4
+ B.npc_yhome
|
- B.tile_word & 0x3f0
+ B.npc_yhome << 4
|
- (byte)(B.tile_word_signed >> 4) & 0x3f
+ B.npc_yhome
|
- (B.tile_word_signed >> 4) & 0x3f
+ B.npc_yhome
|
- (B.tile_word_signed & 0x3f0) >> 4
+ B.npc_yhome
|
- B.tile_word_signed & 0x3f0
+ B.npc_yhome << 4
)

@tile_word_npc_xhome_value@
expression B;
typedef byte;
@@
(
- (byte)(B.tile_word >> 10) & 0x3f
+ B.npc_xhome
|
- (B.tile_word >> 10) & 0x3f
+ B.npc_xhome
|
- (B.tile_word & 0xfc00) >> 10
+ B.npc_xhome
|
- B.tile_word >> 10
+ B.npc_xhome
|
- B.tile_word & 0xfc00
+ B.npc_xhome << 10
|
- (byte)(B.tile_word_signed >> 10) & 0x3f
+ B.npc_xhome
|
- (B.tile_word_signed >> 10) & 0x3f
+ B.npc_xhome
|
- (B.tile_word_signed & 0xfc00) >> 10
+ B.npc_xhome
|
- B.tile_word_signed & 0xfc00
+ B.npc_xhome << 10
|
- (byte)(B.tile_word_high >> 2) & 0x3f
+ B.npc_xhome
|
- (B.tile_word_high >> 2) & 0x3f
+ B.npc_xhome
|
- (B.tile_word_high & 0xfc) >> 2
+ B.npc_xhome
|
- B.tile_word_high >> 2
+ B.npc_xhome
|
- B.tile_word_high & 0xfc
+ B.npc_xhome << 2
|
- (byte)((char)B.tile_word_high >> 2) & 0x3f
+ B.npc_xhome
|
- ((char)B.tile_word_high >> 2) & 0x3f
+ B.npc_xhome
|
- ((char)B.tile_word_high & 0xfc) >> 2
+ B.npc_xhome
|
- (char)B.tile_word_high & 0xfc
+ B.npc_xhome << 2
)

@size_weight_collision_radius_value@
expression B;
typedef byte;
@@
(
- (B.size_weight & 0x7) >> 0
+ B.collision_radius
|
- (B.size_weight >> 0) & 0x7
+ B.collision_radius
|
- B.size_weight & 0x7
+ B.collision_radius
|
- (B.size_weight_signed & 0x7) >> 0
+ B.collision_radius
|
- (B.size_weight_signed >> 0) & 0x7
+ B.collision_radius
|
- B.size_weight_signed & 0x7
+ B.collision_radius
|
- (B.size_weight_low & 0x7) >> 0
+ B.collision_radius
|
- (B.size_weight_low >> 0) & 0x7
+ B.collision_radius
|
- B.size_weight_low & 0x7
+ B.collision_radius
|
- ((char)B.size_weight_low & 0x7) >> 0
+ B.collision_radius
|
- ((char)B.size_weight_low >> 0) & 0x7
+ B.collision_radius
|
- (char)B.size_weight_low & 0x7
+ B.collision_radius
|
- ((byte)B.size_weight & 0x7) >> 0
+ B.collision_radius
|
- ((byte)B.size_weight >> 0) & 0x7
+ B.collision_radius
|
- (byte)B.size_weight & 0x7
+ B.collision_radius
|
- ((char)B.size_weight & 0x7) >> 0
+ B.collision_radius
|
- ((char)B.size_weight >> 0) & 0x7
+ B.collision_radius
|
- (char)B.size_weight & 0x7
+ B.collision_radius
)

@size_weight_animated_value@
expression B;
typedef byte;
@@
(
- (byte)(B.size_weight >> 3) & 0x1
+ B.animated
|
- (B.size_weight >> 3) & 0x1
+ B.animated
|
- (B.size_weight & 0x8) >> 3
+ B.animated
|
- B.size_weight & 0x8
+ B.animated << 3
|
- (byte)(B.size_weight_signed >> 3) & 0x1
+ B.animated
|
- (B.size_weight_signed >> 3) & 0x1
+ B.animated
|
- (B.size_weight_signed & 0x8) >> 3
+ B.animated
|
- B.size_weight_signed & 0x8
+ B.animated << 3
|
- (byte)(B.size_weight_low >> 3) & 0x1
+ B.animated
|
- (B.size_weight_low >> 3) & 0x1
+ B.animated
|
- (B.size_weight_low & 0x8) >> 3
+ B.animated
|
- B.size_weight_low & 0x8
+ B.animated << 3
|
- (byte)((char)B.size_weight_low >> 3) & 0x1
+ B.animated
|
- ((char)B.size_weight_low >> 3) & 0x1
+ B.animated
|
- ((char)B.size_weight_low & 0x8) >> 3
+ B.animated
|
- (char)B.size_weight_low & 0x8
+ B.animated << 3
|
- (byte)((byte)B.size_weight >> 3) & 0x1
+ B.animated
|
- ((byte)B.size_weight >> 3) & 0x1
+ B.animated
|
- ((byte)B.size_weight & 0x8) >> 3
+ B.animated
|
- (byte)B.size_weight & 0x8
+ B.animated << 3
|
- (byte)((char)B.size_weight >> 3) & 0x1
+ B.animated
|
- ((char)B.size_weight >> 3) & 0x1
+ B.animated
|
- ((char)B.size_weight & 0x8) >> 3
+ B.animated
|
- (char)B.size_weight & 0x8
+ B.animated << 3
)

@size_weight_unit_weight_value@
expression B;
typedef byte;
@@
(
- (B.size_weight >> 4) & 0xfff
+ B.unit_weight
|
- (B.size_weight & 0xfff0) >> 4
+ B.unit_weight
|
- B.size_weight >> 4
+ B.unit_weight
|
- B.size_weight & 0xfff0
+ B.unit_weight << 4
|
- (B.size_weight_signed >> 4) & 0xfff
+ B.unit_weight
|
- (B.size_weight_signed & 0xfff0) >> 4
+ B.unit_weight
|
- B.size_weight_signed & 0xfff0
+ B.unit_weight << 4
)

@owner_flags_can_have_owner_value@
expression B;
@@
(
- (byte)(B.owner_flags >> 7) & 0x1
+ B.can_have_owner
|
- (B.owner_flags >> 7) & 0x1
+ B.can_have_owner
|
- (B.owner_flags & 0x80) >> 7
+ B.can_have_owner
|
- B.owner_flags >> 7
+ B.can_have_owner
|
- B.owner_flags & 0x80
+ B.can_have_owner << 7
)

@description_flags_quality_type_value@
expression B;
@@
(
- (B.description_flags & 0xf) >> 0
+ B.quality_type
|
- (B.description_flags >> 0) & 0xf
+ B.quality_type
|
- B.description_flags & 0xf
+ B.quality_type
)

@description_flags_has_look_description_value@
expression B;
@@
(
- (byte)(B.description_flags >> 4) & 0x1
+ B.has_look_description
|
- (B.description_flags >> 4) & 0x1
+ B.has_look_description
|
- (B.description_flags & 0x10) >> 4
+ B.has_look_description
|
- B.description_flags & 0x10
+ B.has_look_description << 4
)

@heading_flags_npc_heading_value@
expression B;
@@
(
- (B.heading_flags & 0x1f) >> 0
+ B.npc_heading
|
- (B.heading_flags >> 0) & 0x1f
+ B.npc_heading
|
- B.heading_flags & 0x1f
+ B.npc_heading
)

@pitch_flags_pitch_value@
expression B;
@@
(
- (byte)(B.pitch_flags >> 3) & 0x1f
+ B.pitch
|
- (B.pitch_flags >> 3) & 0x1f
+ B.pitch
|
- (B.pitch_flags & 0xf8) >> 3
+ B.pitch
|
- B.pitch_flags >> 3
+ B.pitch
|
- B.pitch_flags & 0xf8
+ B.pitch << 3
)

@compare_type_flags_flags_res_1_ptr@
expression B;
@@
(
- (B->flags_res << 1) == 0x0
+ B->flags_res == 0
|
- (B->flags_res << 1) != 0x0
+ B->flags_res != 0
|
- (B->flags_res << 1) == 0x2
+ B->flags_res == 1
|
- (B->flags_res << 1) != 0x2
+ B->flags_res != 1
|
- (B->flags_res << 1) == 0x4
+ B->flags_res == 2
|
- (B->flags_res << 1) != 0x4
+ B->flags_res != 2
|
- (B->flags_res << 1) == 0x6
+ B->flags_res == 3
|
- (B->flags_res << 1) != 0x6
+ B->flags_res != 3
|
- (B->flags_res << 1) == 0x8
+ B->flags_res == 4
|
- (B->flags_res << 1) != 0x8
+ B->flags_res != 4
|
- (B->flags_res << 1) == 0xa
+ B->flags_res == 5
|
- (B->flags_res << 1) != 0xa
+ B->flags_res != 5
|
- (B->flags_res << 1) == 0xc
+ B->flags_res == 6
|
- (B->flags_res << 1) != 0xc
+ B->flags_res != 6
|
- (B->flags_res << 1) == 0xe
+ B->flags_res == 7
|
- (B->flags_res << 1) != 0xe
+ B->flags_res != 7
)

@compare_type_flags_flags_res_9_ptr@
expression B;
@@
(
- (B->flags_res << 9) == 0x0
+ B->flags_res == 0
|
- (B->flags_res << 9) != 0x0
+ B->flags_res != 0
|
- (B->flags_res << 9) == 0x200
+ B->flags_res == 1
|
- (B->flags_res << 9) != 0x200
+ B->flags_res != 1
|
- (B->flags_res << 9) == 0x400
+ B->flags_res == 2
|
- (B->flags_res << 9) != 0x400
+ B->flags_res != 2
|
- (B->flags_res << 9) == 0x600
+ B->flags_res == 3
|
- (B->flags_res << 9) != 0x600
+ B->flags_res != 3
|
- (B->flags_res << 9) == 0x800
+ B->flags_res == 4
|
- (B->flags_res << 9) != 0x800
+ B->flags_res != 4
|
- (B->flags_res << 9) == 0xa00
+ B->flags_res == 5
|
- (B->flags_res << 9) != 0xa00
+ B->flags_res != 5
|
- (B->flags_res << 9) == 0xc00
+ B->flags_res == 6
|
- (B->flags_res << 9) != 0xc00
+ B->flags_res != 6
|
- (B->flags_res << 9) == 0xe00
+ B->flags_res == 7
|
- (B->flags_res << 9) != 0xe00
+ B->flags_res != 7
)

@compare_type_flags_enchanted_4_ptr@
expression B;
@@
(
- (B->enchanted << 4) == 0x0
+ B->enchanted == 0
|
- (B->enchanted << 4) != 0x0
+ B->enchanted != 0
|
- (B->enchanted << 4) == 0x10
+ B->enchanted == 1
|
- (B->enchanted << 4) != 0x10
+ B->enchanted != 1
)

@compare_type_flags_enchanted_12_ptr@
expression B;
@@
(
- (B->enchanted << 12) == 0x0
+ B->enchanted == 0
|
- (B->enchanted << 12) != 0x0
+ B->enchanted != 0
|
- (B->enchanted << 12) == 0x1000
+ B->enchanted == 1
|
- (B->enchanted << 12) != 0x1000
+ B->enchanted != 1
)

@compare_type_flags_doordir_5_ptr@
expression B;
@@
(
- (B->doordir << 5) == 0x0
+ B->doordir == 0
|
- (B->doordir << 5) != 0x0
+ B->doordir != 0
|
- (B->doordir << 5) == 0x20
+ B->doordir == 1
|
- (B->doordir << 5) != 0x20
+ B->doordir != 1
)

@compare_type_flags_doordir_13_ptr@
expression B;
@@
(
- (B->doordir << 13) == 0x0
+ B->doordir == 0
|
- (B->doordir << 13) != 0x0
+ B->doordir != 0
|
- (B->doordir << 13) == 0x2000
+ B->doordir == 1
|
- (B->doordir << 13) != 0x2000
+ B->doordir != 1
)

@compare_type_flags_invisible_6_ptr@
expression B;
@@
(
- (B->invisible << 6) == 0x0
+ B->invisible == 0
|
- (B->invisible << 6) != 0x0
+ B->invisible != 0
|
- (B->invisible << 6) == 0x40
+ B->invisible == 1
|
- (B->invisible << 6) != 0x40
+ B->invisible != 1
)

@compare_type_flags_invisible_14_ptr@
expression B;
@@
(
- (B->invisible << 14) == 0x0
+ B->invisible == 0
|
- (B->invisible << 14) != 0x0
+ B->invisible != 0
|
- (B->invisible << 14) == 0x4000
+ B->invisible == 1
|
- (B->invisible << 14) != 0x4000
+ B->invisible != 1
)

@compare_type_flags_is_quant_7_ptr@
expression B;
@@
(
- (B->is_quant << 7) == 0x0
+ B->is_quant == 0
|
- (B->is_quant << 7) != 0x0
+ B->is_quant != 0
|
- (B->is_quant << 7) == 0x80
+ B->is_quant == 1
|
- (B->is_quant << 7) != 0x80
+ B->is_quant != 1
)

@compare_type_flags_is_quant_15_ptr@
expression B;
@@
(
- (B->is_quant << 15) == 0x0
+ B->is_quant == 0
|
- (B->is_quant << 15) != 0x0
+ B->is_quant != 0
|
- (B->is_quant << 15) == 0x8000
+ B->is_quant == 1
|
- (B->is_quant << 15) != 0x8000
+ B->is_quant != 1
)

@compare_position_word_heading_7_ptr@
expression B;
@@
(
- (B->heading << 7) == 0x0
+ B->heading == 0
|
- (B->heading << 7) != 0x0
+ B->heading != 0
|
- (B->heading << 7) == 0x80
+ B->heading == 1
|
- (B->heading << 7) != 0x80
+ B->heading != 1
|
- (B->heading << 7) == 0x100
+ B->heading == 2
|
- (B->heading << 7) != 0x100
+ B->heading != 2
|
- (B->heading << 7) == 0x180
+ B->heading == 3
|
- (B->heading << 7) != 0x180
+ B->heading != 3
|
- (B->heading << 7) == 0x200
+ B->heading == 4
|
- (B->heading << 7) != 0x200
+ B->heading != 4
|
- (B->heading << 7) == 0x280
+ B->heading == 5
|
- (B->heading << 7) != 0x280
+ B->heading != 5
|
- (B->heading << 7) == 0x300
+ B->heading == 6
|
- (B->heading << 7) != 0x300
+ B->heading != 6
|
- (B->heading << 7) == 0x380
+ B->heading == 7
|
- (B->heading << 7) != 0x380
+ B->heading != 7
)

@compare_position_word_ypos_2_ptr@
expression B;
@@
(
- (B->ypos << 2) == 0x0
+ B->ypos == 0
|
- (B->ypos << 2) != 0x0
+ B->ypos != 0
|
- (B->ypos << 2) == 0x4
+ B->ypos == 1
|
- (B->ypos << 2) != 0x4
+ B->ypos != 1
|
- (B->ypos << 2) == 0x8
+ B->ypos == 2
|
- (B->ypos << 2) != 0x8
+ B->ypos != 2
|
- (B->ypos << 2) == 0xc
+ B->ypos == 3
|
- (B->ypos << 2) != 0xc
+ B->ypos != 3
|
- (B->ypos << 2) == 0x10
+ B->ypos == 4
|
- (B->ypos << 2) != 0x10
+ B->ypos != 4
|
- (B->ypos << 2) == 0x14
+ B->ypos == 5
|
- (B->ypos << 2) != 0x14
+ B->ypos != 5
|
- (B->ypos << 2) == 0x18
+ B->ypos == 6
|
- (B->ypos << 2) != 0x18
+ B->ypos != 6
|
- (B->ypos << 2) == 0x1c
+ B->ypos == 7
|
- (B->ypos << 2) != 0x1c
+ B->ypos != 7
)

@compare_position_word_ypos_10_ptr@
expression B;
@@
(
- (B->ypos << 10) == 0x0
+ B->ypos == 0
|
- (B->ypos << 10) != 0x0
+ B->ypos != 0
|
- (B->ypos << 10) == 0x400
+ B->ypos == 1
|
- (B->ypos << 10) != 0x400
+ B->ypos != 1
|
- (B->ypos << 10) == 0x800
+ B->ypos == 2
|
- (B->ypos << 10) != 0x800
+ B->ypos != 2
|
- (B->ypos << 10) == 0xc00
+ B->ypos == 3
|
- (B->ypos << 10) != 0xc00
+ B->ypos != 3
|
- (B->ypos << 10) == 0x1000
+ B->ypos == 4
|
- (B->ypos << 10) != 0x1000
+ B->ypos != 4
|
- (B->ypos << 10) == 0x1400
+ B->ypos == 5
|
- (B->ypos << 10) != 0x1400
+ B->ypos != 5
|
- (B->ypos << 10) == 0x1800
+ B->ypos == 6
|
- (B->ypos << 10) != 0x1800
+ B->ypos != 6
|
- (B->ypos << 10) == 0x1c00
+ B->ypos == 7
|
- (B->ypos << 10) != 0x1c00
+ B->ypos != 7
)

@compare_position_word_xpos_5_ptr@
expression B;
@@
(
- (B->xpos << 5) == 0x0
+ B->xpos == 0
|
- (B->xpos << 5) != 0x0
+ B->xpos != 0
|
- (B->xpos << 5) == 0x20
+ B->xpos == 1
|
- (B->xpos << 5) != 0x20
+ B->xpos != 1
|
- (B->xpos << 5) == 0x40
+ B->xpos == 2
|
- (B->xpos << 5) != 0x40
+ B->xpos != 2
|
- (B->xpos << 5) == 0x60
+ B->xpos == 3
|
- (B->xpos << 5) != 0x60
+ B->xpos != 3
|
- (B->xpos << 5) == 0x80
+ B->xpos == 4
|
- (B->xpos << 5) != 0x80
+ B->xpos != 4
|
- (B->xpos << 5) == 0xa0
+ B->xpos == 5
|
- (B->xpos << 5) != 0xa0
+ B->xpos != 5
|
- (B->xpos << 5) == 0xc0
+ B->xpos == 6
|
- (B->xpos << 5) != 0xc0
+ B->xpos != 6
|
- (B->xpos << 5) == 0xe0
+ B->xpos == 7
|
- (B->xpos << 5) != 0xe0
+ B->xpos != 7
)

@compare_position_word_xpos_13_ptr@
expression B;
@@
(
- (B->xpos << 13) == 0x0
+ B->xpos == 0
|
- (B->xpos << 13) != 0x0
+ B->xpos != 0
|
- (B->xpos << 13) == 0x2000
+ B->xpos == 1
|
- (B->xpos << 13) != 0x2000
+ B->xpos != 1
|
- (B->xpos << 13) == 0x4000
+ B->xpos == 2
|
- (B->xpos << 13) != 0x4000
+ B->xpos != 2
|
- (B->xpos << 13) == 0x6000
+ B->xpos == 3
|
- (B->xpos << 13) != 0x6000
+ B->xpos != 3
|
- (B->xpos << 13) == 0x8000
+ B->xpos == 4
|
- (B->xpos << 13) != 0x8000
+ B->xpos != 4
|
- (B->xpos << 13) == 0xa000
+ B->xpos == 5
|
- (B->xpos << 13) != 0xa000
+ B->xpos != 5
|
- (B->xpos << 13) == 0xc000
+ B->xpos == 6
|
- (B->xpos << 13) != 0xc000
+ B->xpos != 6
|
- (B->xpos << 13) == 0xe000
+ B->xpos == 7
|
- (B->xpos << 13) != 0xe000
+ B->xpos != 7
)

@compare_chain_word_next_6_ptr@
expression B;
@@
(
- (B->next << 6) == 0x0
+ B->next == 0
|
- (B->next << 6) != 0x0
+ B->next != 0
|
- (B->next << 6) == 0x40
+ B->next == 1
|
- (B->next << 6) != 0x40
+ B->next != 1
|
- (B->next << 6) == 0x80
+ B->next == 2
|
- (B->next << 6) != 0x80
+ B->next != 2
|
- (B->next << 6) == 0xc0
+ B->next == 3
|
- (B->next << 6) != 0xc0
+ B->next != 3
|
- (B->next << 6) == 0x100
+ B->next == 4
|
- (B->next << 6) != 0x100
+ B->next != 4
|
- (B->next << 6) == 0x140
+ B->next == 5
|
- (B->next << 6) != 0x140
+ B->next != 5
|
- (B->next << 6) == 0x180
+ B->next == 6
|
- (B->next << 6) != 0x180
+ B->next != 6
|
- (B->next << 6) == 0x1c0
+ B->next == 7
|
- (B->next << 6) != 0x1c0
+ B->next != 7
|
- (B->next << 6) == 0x200
+ B->next == 8
|
- (B->next << 6) != 0x200
+ B->next != 8
|
- (B->next << 6) == 0x240
+ B->next == 9
|
- (B->next << 6) != 0x240
+ B->next != 9
|
- (B->next << 6) == 0x280
+ B->next == 10
|
- (B->next << 6) != 0x280
+ B->next != 10
|
- (B->next << 6) == 0x2c0
+ B->next == 11
|
- (B->next << 6) != 0x2c0
+ B->next != 11
|
- (B->next << 6) == 0x300
+ B->next == 12
|
- (B->next << 6) != 0x300
+ B->next != 12
|
- (B->next << 6) == 0x340
+ B->next == 13
|
- (B->next << 6) != 0x340
+ B->next != 13
|
- (B->next << 6) == 0x380
+ B->next == 14
|
- (B->next << 6) != 0x380
+ B->next != 14
|
- (B->next << 6) == 0x3c0
+ B->next == 15
|
- (B->next << 6) != 0x3c0
+ B->next != 15
)

@compare_link_word_link_6_ptr@
expression B;
@@
(
- (B->link << 6) == 0x0
+ B->link == 0
|
- (B->link << 6) != 0x0
+ B->link != 0
|
- (B->link << 6) == 0x40
+ B->link == 1
|
- (B->link << 6) != 0x40
+ B->link != 1
|
- (B->link << 6) == 0x80
+ B->link == 2
|
- (B->link << 6) != 0x80
+ B->link != 2
|
- (B->link << 6) == 0xc0
+ B->link == 3
|
- (B->link << 6) != 0xc0
+ B->link != 3
|
- (B->link << 6) == 0x100
+ B->link == 4
|
- (B->link << 6) != 0x100
+ B->link != 4
|
- (B->link << 6) == 0x140
+ B->link == 5
|
- (B->link << 6) != 0x140
+ B->link != 5
|
- (B->link << 6) == 0x180
+ B->link == 6
|
- (B->link << 6) != 0x180
+ B->link != 6
|
- (B->link << 6) == 0x1c0
+ B->link == 7
|
- (B->link << 6) != 0x1c0
+ B->link != 7
|
- (B->link << 6) == 0x200
+ B->link == 8
|
- (B->link << 6) != 0x200
+ B->link != 8
|
- (B->link << 6) == 0x240
+ B->link == 9
|
- (B->link << 6) != 0x240
+ B->link != 9
|
- (B->link << 6) == 0x280
+ B->link == 10
|
- (B->link << 6) != 0x280
+ B->link != 10
|
- (B->link << 6) == 0x2c0
+ B->link == 11
|
- (B->link << 6) != 0x2c0
+ B->link != 11
|
- (B->link << 6) == 0x300
+ B->link == 12
|
- (B->link << 6) != 0x300
+ B->link != 12
|
- (B->link << 6) == 0x340
+ B->link == 13
|
- (B->link << 6) != 0x340
+ B->link != 13
|
- (B->link << 6) == 0x380
+ B->link == 14
|
- (B->link << 6) != 0x380
+ B->link != 14
|
- (B->link << 6) == 0x3c0
+ B->link == 15
|
- (B->link << 6) != 0x3c0
+ B->link != 15
)

@compare_goal_word_npc_gtarg_4_ptr@
expression B;
@@
(
- (B->npc_gtarg << 4) == 0x0
+ B->npc_gtarg == 0
|
- (B->npc_gtarg << 4) != 0x0
+ B->npc_gtarg != 0
|
- (B->npc_gtarg << 4) == 0x10
+ B->npc_gtarg == 1
|
- (B->npc_gtarg << 4) != 0x10
+ B->npc_gtarg != 1
|
- (B->npc_gtarg << 4) == 0x20
+ B->npc_gtarg == 2
|
- (B->npc_gtarg << 4) != 0x20
+ B->npc_gtarg != 2
|
- (B->npc_gtarg << 4) == 0x30
+ B->npc_gtarg == 3
|
- (B->npc_gtarg << 4) != 0x30
+ B->npc_gtarg != 3
|
- (B->npc_gtarg << 4) == 0x40
+ B->npc_gtarg == 4
|
- (B->npc_gtarg << 4) != 0x40
+ B->npc_gtarg != 4
|
- (B->npc_gtarg << 4) == 0x50
+ B->npc_gtarg == 5
|
- (B->npc_gtarg << 4) != 0x50
+ B->npc_gtarg != 5
|
- (B->npc_gtarg << 4) == 0x60
+ B->npc_gtarg == 6
|
- (B->npc_gtarg << 4) != 0x60
+ B->npc_gtarg != 6
|
- (B->npc_gtarg << 4) == 0x70
+ B->npc_gtarg == 7
|
- (B->npc_gtarg << 4) != 0x70
+ B->npc_gtarg != 7
|
- (B->npc_gtarg << 4) == 0x80
+ B->npc_gtarg == 8
|
- (B->npc_gtarg << 4) != 0x80
+ B->npc_gtarg != 8
|
- (B->npc_gtarg << 4) == 0x90
+ B->npc_gtarg == 9
|
- (B->npc_gtarg << 4) != 0x90
+ B->npc_gtarg != 9
|
- (B->npc_gtarg << 4) == 0xa0
+ B->npc_gtarg == 10
|
- (B->npc_gtarg << 4) != 0xa0
+ B->npc_gtarg != 10
|
- (B->npc_gtarg << 4) == 0xb0
+ B->npc_gtarg == 11
|
- (B->npc_gtarg << 4) != 0xb0
+ B->npc_gtarg != 11
|
- (B->npc_gtarg << 4) == 0xc0
+ B->npc_gtarg == 12
|
- (B->npc_gtarg << 4) != 0xc0
+ B->npc_gtarg != 12
|
- (B->npc_gtarg << 4) == 0xd0
+ B->npc_gtarg == 13
|
- (B->npc_gtarg << 4) != 0xd0
+ B->npc_gtarg != 13
|
- (B->npc_gtarg << 4) == 0xe0
+ B->npc_gtarg == 14
|
- (B->npc_gtarg << 4) != 0xe0
+ B->npc_gtarg != 14
|
- (B->npc_gtarg << 4) == 0xf0
+ B->npc_gtarg == 15
|
- (B->npc_gtarg << 4) != 0xf0
+ B->npc_gtarg != 15
)

@compare_goal_word_npc_animation_frame_4_ptr@
expression B;
@@
(
- (B->npc_animation_frame << 4) == 0x0
+ B->npc_animation_frame == 0
|
- (B->npc_animation_frame << 4) != 0x0
+ B->npc_animation_frame != 0
|
- (B->npc_animation_frame << 4) == 0x10
+ B->npc_animation_frame == 1
|
- (B->npc_animation_frame << 4) != 0x10
+ B->npc_animation_frame != 1
|
- (B->npc_animation_frame << 4) == 0x20
+ B->npc_animation_frame == 2
|
- (B->npc_animation_frame << 4) != 0x20
+ B->npc_animation_frame != 2
|
- (B->npc_animation_frame << 4) == 0x30
+ B->npc_animation_frame == 3
|
- (B->npc_animation_frame << 4) != 0x30
+ B->npc_animation_frame != 3
|
- (B->npc_animation_frame << 4) == 0x40
+ B->npc_animation_frame == 4
|
- (B->npc_animation_frame << 4) != 0x40
+ B->npc_animation_frame != 4
|
- (B->npc_animation_frame << 4) == 0x50
+ B->npc_animation_frame == 5
|
- (B->npc_animation_frame << 4) != 0x50
+ B->npc_animation_frame != 5
|
- (B->npc_animation_frame << 4) == 0x60
+ B->npc_animation_frame == 6
|
- (B->npc_animation_frame << 4) != 0x60
+ B->npc_animation_frame != 6
|
- (B->npc_animation_frame << 4) == 0x70
+ B->npc_animation_frame == 7
|
- (B->npc_animation_frame << 4) != 0x70
+ B->npc_animation_frame != 7
|
- (B->npc_animation_frame << 4) == 0x80
+ B->npc_animation_frame == 8
|
- (B->npc_animation_frame << 4) != 0x80
+ B->npc_animation_frame != 8
|
- (B->npc_animation_frame << 4) == 0x90
+ B->npc_animation_frame == 9
|
- (B->npc_animation_frame << 4) != 0x90
+ B->npc_animation_frame != 9
|
- (B->npc_animation_frame << 4) == 0xa0
+ B->npc_animation_frame == 10
|
- (B->npc_animation_frame << 4) != 0xa0
+ B->npc_animation_frame != 10
|
- (B->npc_animation_frame << 4) == 0xb0
+ B->npc_animation_frame == 11
|
- (B->npc_animation_frame << 4) != 0xb0
+ B->npc_animation_frame != 11
|
- (B->npc_animation_frame << 4) == 0xc0
+ B->npc_animation_frame == 12
|
- (B->npc_animation_frame << 4) != 0xc0
+ B->npc_animation_frame != 12
|
- (B->npc_animation_frame << 4) == 0xd0
+ B->npc_animation_frame == 13
|
- (B->npc_animation_frame << 4) != 0xd0
+ B->npc_animation_frame != 13
|
- (B->npc_animation_frame << 4) == 0xe0
+ B->npc_animation_frame == 14
|
- (B->npc_animation_frame << 4) != 0xe0
+ B->npc_animation_frame != 14
|
- (B->npc_animation_frame << 4) == 0xf0
+ B->npc_animation_frame == 15
|
- (B->npc_animation_frame << 4) != 0xf0
+ B->npc_animation_frame != 15
)

@compare_goal_word_npc_animation_frame_12_ptr@
expression B;
@@
(
- (B->npc_animation_frame << 12) == 0x0
+ B->npc_animation_frame == 0
|
- (B->npc_animation_frame << 12) != 0x0
+ B->npc_animation_frame != 0
|
- (B->npc_animation_frame << 12) == 0x1000
+ B->npc_animation_frame == 1
|
- (B->npc_animation_frame << 12) != 0x1000
+ B->npc_animation_frame != 1
|
- (B->npc_animation_frame << 12) == 0x2000
+ B->npc_animation_frame == 2
|
- (B->npc_animation_frame << 12) != 0x2000
+ B->npc_animation_frame != 2
|
- (B->npc_animation_frame << 12) == 0x3000
+ B->npc_animation_frame == 3
|
- (B->npc_animation_frame << 12) != 0x3000
+ B->npc_animation_frame != 3
|
- (B->npc_animation_frame << 12) == 0x4000
+ B->npc_animation_frame == 4
|
- (B->npc_animation_frame << 12) != 0x4000
+ B->npc_animation_frame != 4
|
- (B->npc_animation_frame << 12) == 0x5000
+ B->npc_animation_frame == 5
|
- (B->npc_animation_frame << 12) != 0x5000
+ B->npc_animation_frame != 5
|
- (B->npc_animation_frame << 12) == 0x6000
+ B->npc_animation_frame == 6
|
- (B->npc_animation_frame << 12) != 0x6000
+ B->npc_animation_frame != 6
|
- (B->npc_animation_frame << 12) == 0x7000
+ B->npc_animation_frame == 7
|
- (B->npc_animation_frame << 12) != 0x7000
+ B->npc_animation_frame != 7
|
- (B->npc_animation_frame << 12) == 0x8000
+ B->npc_animation_frame == 8
|
- (B->npc_animation_frame << 12) != 0x8000
+ B->npc_animation_frame != 8
|
- (B->npc_animation_frame << 12) == 0x9000
+ B->npc_animation_frame == 9
|
- (B->npc_animation_frame << 12) != 0x9000
+ B->npc_animation_frame != 9
|
- (B->npc_animation_frame << 12) == 0xa000
+ B->npc_animation_frame == 10
|
- (B->npc_animation_frame << 12) != 0xa000
+ B->npc_animation_frame != 10
|
- (B->npc_animation_frame << 12) == 0xb000
+ B->npc_animation_frame == 11
|
- (B->npc_animation_frame << 12) != 0xb000
+ B->npc_animation_frame != 11
|
- (B->npc_animation_frame << 12) == 0xc000
+ B->npc_animation_frame == 12
|
- (B->npc_animation_frame << 12) != 0xc000
+ B->npc_animation_frame != 12
|
- (B->npc_animation_frame << 12) == 0xd000
+ B->npc_animation_frame == 13
|
- (B->npc_animation_frame << 12) != 0xd000
+ B->npc_animation_frame != 13
|
- (B->npc_animation_frame << 12) == 0xe000
+ B->npc_animation_frame == 14
|
- (B->npc_animation_frame << 12) != 0xe000
+ B->npc_animation_frame != 14
|
- (B->npc_animation_frame << 12) == 0xf000
+ B->npc_animation_frame == 15
|
- (B->npc_animation_frame << 12) != 0xf000
+ B->npc_animation_frame != 15
)

@compare_status_word_npc_talkedto_5_ptr@
expression B;
@@
(
- (B->npc_talkedto << 5) == 0x0
+ B->npc_talkedto == 0
|
- (B->npc_talkedto << 5) != 0x0
+ B->npc_talkedto != 0
|
- (B->npc_talkedto << 5) == 0x20
+ B->npc_talkedto == 1
|
- (B->npc_talkedto << 5) != 0x20
+ B->npc_talkedto != 1
)

@compare_status_word_npc_talkedto_13_ptr@
expression B;
@@
(
- (B->npc_talkedto << 13) == 0x0
+ B->npc_talkedto == 0
|
- (B->npc_talkedto << 13) != 0x0
+ B->npc_talkedto != 0
|
- (B->npc_talkedto << 13) == 0x2000
+ B->npc_talkedto == 1
|
- (B->npc_talkedto << 13) != 0x2000
+ B->npc_talkedto != 1
)

@compare_status_word_npc_attitude_6_ptr@
expression B;
@@
(
- (B->npc_attitude << 6) == 0x0
+ B->npc_attitude == 0
|
- (B->npc_attitude << 6) != 0x0
+ B->npc_attitude != 0
|
- (B->npc_attitude << 6) == 0x40
+ B->npc_attitude == 1
|
- (B->npc_attitude << 6) != 0x40
+ B->npc_attitude != 1
|
- (B->npc_attitude << 6) == 0x80
+ B->npc_attitude == 2
|
- (B->npc_attitude << 6) != 0x80
+ B->npc_attitude != 2
|
- (B->npc_attitude << 6) == 0xc0
+ B->npc_attitude == 3
|
- (B->npc_attitude << 6) != 0xc0
+ B->npc_attitude != 3
)

@compare_status_word_npc_attitude_14_ptr@
expression B;
@@
(
- (B->npc_attitude << 14) == 0x0
+ B->npc_attitude == 0
|
- (B->npc_attitude << 14) != 0x0
+ B->npc_attitude != 0
|
- (B->npc_attitude << 14) == 0x4000
+ B->npc_attitude == 1
|
- (B->npc_attitude << 14) != 0x4000
+ B->npc_attitude != 1
|
- (B->npc_attitude << 14) == 0x8000
+ B->npc_attitude == 2
|
- (B->npc_attitude << 14) != 0x8000
+ B->npc_attitude != 2
|
- (B->npc_attitude << 14) == 0xc000
+ B->npc_attitude == 3
|
- (B->npc_attitude << 14) != 0xc000
+ B->npc_attitude != 3
)

@compare_target_word_npc_target_tile_y_6_ptr@
expression B;
@@
(
- (B->npc_target_tile_y << 6) == 0x0
+ B->npc_target_tile_y == 0
|
- (B->npc_target_tile_y << 6) != 0x0
+ B->npc_target_tile_y != 0
|
- (B->npc_target_tile_y << 6) == 0x40
+ B->npc_target_tile_y == 1
|
- (B->npc_target_tile_y << 6) != 0x40
+ B->npc_target_tile_y != 1
|
- (B->npc_target_tile_y << 6) == 0x80
+ B->npc_target_tile_y == 2
|
- (B->npc_target_tile_y << 6) != 0x80
+ B->npc_target_tile_y != 2
|
- (B->npc_target_tile_y << 6) == 0xc0
+ B->npc_target_tile_y == 3
|
- (B->npc_target_tile_y << 6) != 0xc0
+ B->npc_target_tile_y != 3
|
- (B->npc_target_tile_y << 6) == 0x100
+ B->npc_target_tile_y == 4
|
- (B->npc_target_tile_y << 6) != 0x100
+ B->npc_target_tile_y != 4
|
- (B->npc_target_tile_y << 6) == 0x140
+ B->npc_target_tile_y == 5
|
- (B->npc_target_tile_y << 6) != 0x140
+ B->npc_target_tile_y != 5
|
- (B->npc_target_tile_y << 6) == 0x180
+ B->npc_target_tile_y == 6
|
- (B->npc_target_tile_y << 6) != 0x180
+ B->npc_target_tile_y != 6
|
- (B->npc_target_tile_y << 6) == 0x1c0
+ B->npc_target_tile_y == 7
|
- (B->npc_target_tile_y << 6) != 0x1c0
+ B->npc_target_tile_y != 7
|
- (B->npc_target_tile_y << 6) == 0x200
+ B->npc_target_tile_y == 8
|
- (B->npc_target_tile_y << 6) != 0x200
+ B->npc_target_tile_y != 8
|
- (B->npc_target_tile_y << 6) == 0x240
+ B->npc_target_tile_y == 9
|
- (B->npc_target_tile_y << 6) != 0x240
+ B->npc_target_tile_y != 9
|
- (B->npc_target_tile_y << 6) == 0x280
+ B->npc_target_tile_y == 10
|
- (B->npc_target_tile_y << 6) != 0x280
+ B->npc_target_tile_y != 10
|
- (B->npc_target_tile_y << 6) == 0x2c0
+ B->npc_target_tile_y == 11
|
- (B->npc_target_tile_y << 6) != 0x2c0
+ B->npc_target_tile_y != 11
|
- (B->npc_target_tile_y << 6) == 0x300
+ B->npc_target_tile_y == 12
|
- (B->npc_target_tile_y << 6) != 0x300
+ B->npc_target_tile_y != 12
|
- (B->npc_target_tile_y << 6) == 0x340
+ B->npc_target_tile_y == 13
|
- (B->npc_target_tile_y << 6) != 0x340
+ B->npc_target_tile_y != 13
|
- (B->npc_target_tile_y << 6) == 0x380
+ B->npc_target_tile_y == 14
|
- (B->npc_target_tile_y << 6) != 0x380
+ B->npc_target_tile_y != 14
|
- (B->npc_target_tile_y << 6) == 0x3c0
+ B->npc_target_tile_y == 15
|
- (B->npc_target_tile_y << 6) != 0x3c0
+ B->npc_target_tile_y != 15
)

@compare_target_word_npc_swing_charge_4_ptr@
expression B;
@@
(
- (B->npc_swing_charge << 4) == 0x0
+ B->npc_swing_charge == 0
|
- (B->npc_swing_charge << 4) != 0x0
+ B->npc_swing_charge != 0
|
- (B->npc_swing_charge << 4) == 0x10
+ B->npc_swing_charge == 1
|
- (B->npc_swing_charge << 4) != 0x10
+ B->npc_swing_charge != 1
|
- (B->npc_swing_charge << 4) == 0x20
+ B->npc_swing_charge == 2
|
- (B->npc_swing_charge << 4) != 0x20
+ B->npc_swing_charge != 2
|
- (B->npc_swing_charge << 4) == 0x30
+ B->npc_swing_charge == 3
|
- (B->npc_swing_charge << 4) != 0x30
+ B->npc_swing_charge != 3
|
- (B->npc_swing_charge << 4) == 0x40
+ B->npc_swing_charge == 4
|
- (B->npc_swing_charge << 4) != 0x40
+ B->npc_swing_charge != 4
|
- (B->npc_swing_charge << 4) == 0x50
+ B->npc_swing_charge == 5
|
- (B->npc_swing_charge << 4) != 0x50
+ B->npc_swing_charge != 5
|
- (B->npc_swing_charge << 4) == 0x60
+ B->npc_swing_charge == 6
|
- (B->npc_swing_charge << 4) != 0x60
+ B->npc_swing_charge != 6
|
- (B->npc_swing_charge << 4) == 0x70
+ B->npc_swing_charge == 7
|
- (B->npc_swing_charge << 4) != 0x70
+ B->npc_swing_charge != 7
|
- (B->npc_swing_charge << 4) == 0x80
+ B->npc_swing_charge == 8
|
- (B->npc_swing_charge << 4) != 0x80
+ B->npc_swing_charge != 8
|
- (B->npc_swing_charge << 4) == 0x90
+ B->npc_swing_charge == 9
|
- (B->npc_swing_charge << 4) != 0x90
+ B->npc_swing_charge != 9
|
- (B->npc_swing_charge << 4) == 0xa0
+ B->npc_swing_charge == 10
|
- (B->npc_swing_charge << 4) != 0xa0
+ B->npc_swing_charge != 10
|
- (B->npc_swing_charge << 4) == 0xb0
+ B->npc_swing_charge == 11
|
- (B->npc_swing_charge << 4) != 0xb0
+ B->npc_swing_charge != 11
|
- (B->npc_swing_charge << 4) == 0xc0
+ B->npc_swing_charge == 12
|
- (B->npc_swing_charge << 4) != 0xc0
+ B->npc_swing_charge != 12
|
- (B->npc_swing_charge << 4) == 0xd0
+ B->npc_swing_charge == 13
|
- (B->npc_swing_charge << 4) != 0xd0
+ B->npc_swing_charge != 13
|
- (B->npc_swing_charge << 4) == 0xe0
+ B->npc_swing_charge == 14
|
- (B->npc_swing_charge << 4) != 0xe0
+ B->npc_swing_charge != 14
|
- (B->npc_swing_charge << 4) == 0xf0
+ B->npc_swing_charge == 15
|
- (B->npc_swing_charge << 4) != 0xf0
+ B->npc_swing_charge != 15
)

@compare_target_word_npc_swing_charge_12_ptr@
expression B;
@@
(
- (B->npc_swing_charge << 12) == 0x0
+ B->npc_swing_charge == 0
|
- (B->npc_swing_charge << 12) != 0x0
+ B->npc_swing_charge != 0
|
- (B->npc_swing_charge << 12) == 0x1000
+ B->npc_swing_charge == 1
|
- (B->npc_swing_charge << 12) != 0x1000
+ B->npc_swing_charge != 1
|
- (B->npc_swing_charge << 12) == 0x2000
+ B->npc_swing_charge == 2
|
- (B->npc_swing_charge << 12) != 0x2000
+ B->npc_swing_charge != 2
|
- (B->npc_swing_charge << 12) == 0x3000
+ B->npc_swing_charge == 3
|
- (B->npc_swing_charge << 12) != 0x3000
+ B->npc_swing_charge != 3
|
- (B->npc_swing_charge << 12) == 0x4000
+ B->npc_swing_charge == 4
|
- (B->npc_swing_charge << 12) != 0x4000
+ B->npc_swing_charge != 4
|
- (B->npc_swing_charge << 12) == 0x5000
+ B->npc_swing_charge == 5
|
- (B->npc_swing_charge << 12) != 0x5000
+ B->npc_swing_charge != 5
|
- (B->npc_swing_charge << 12) == 0x6000
+ B->npc_swing_charge == 6
|
- (B->npc_swing_charge << 12) != 0x6000
+ B->npc_swing_charge != 6
|
- (B->npc_swing_charge << 12) == 0x7000
+ B->npc_swing_charge == 7
|
- (B->npc_swing_charge << 12) != 0x7000
+ B->npc_swing_charge != 7
|
- (B->npc_swing_charge << 12) == 0x8000
+ B->npc_swing_charge == 8
|
- (B->npc_swing_charge << 12) != 0x8000
+ B->npc_swing_charge != 8
|
- (B->npc_swing_charge << 12) == 0x9000
+ B->npc_swing_charge == 9
|
- (B->npc_swing_charge << 12) != 0x9000
+ B->npc_swing_charge != 9
|
- (B->npc_swing_charge << 12) == 0xa000
+ B->npc_swing_charge == 10
|
- (B->npc_swing_charge << 12) != 0xa000
+ B->npc_swing_charge != 10
|
- (B->npc_swing_charge << 12) == 0xb000
+ B->npc_swing_charge == 11
|
- (B->npc_swing_charge << 12) != 0xb000
+ B->npc_swing_charge != 11
|
- (B->npc_swing_charge << 12) == 0xc000
+ B->npc_swing_charge == 12
|
- (B->npc_swing_charge << 12) != 0xc000
+ B->npc_swing_charge != 12
|
- (B->npc_swing_charge << 12) == 0xd000
+ B->npc_swing_charge == 13
|
- (B->npc_swing_charge << 12) != 0xd000
+ B->npc_swing_charge != 13
|
- (B->npc_swing_charge << 12) == 0xe000
+ B->npc_swing_charge == 14
|
- (B->npc_swing_charge << 12) != 0xe000
+ B->npc_swing_charge != 14
|
- (B->npc_swing_charge << 12) == 0xf000
+ B->npc_swing_charge == 15
|
- (B->npc_swing_charge << 12) != 0xf000
+ B->npc_swing_charge != 15
)

@compare_tile_word_npc_yhome_4_ptr@
expression B;
@@
(
- (B->npc_yhome << 4) == 0x0
+ B->npc_yhome == 0
|
- (B->npc_yhome << 4) != 0x0
+ B->npc_yhome != 0
|
- (B->npc_yhome << 4) == 0x10
+ B->npc_yhome == 1
|
- (B->npc_yhome << 4) != 0x10
+ B->npc_yhome != 1
|
- (B->npc_yhome << 4) == 0x20
+ B->npc_yhome == 2
|
- (B->npc_yhome << 4) != 0x20
+ B->npc_yhome != 2
|
- (B->npc_yhome << 4) == 0x30
+ B->npc_yhome == 3
|
- (B->npc_yhome << 4) != 0x30
+ B->npc_yhome != 3
|
- (B->npc_yhome << 4) == 0x40
+ B->npc_yhome == 4
|
- (B->npc_yhome << 4) != 0x40
+ B->npc_yhome != 4
|
- (B->npc_yhome << 4) == 0x50
+ B->npc_yhome == 5
|
- (B->npc_yhome << 4) != 0x50
+ B->npc_yhome != 5
|
- (B->npc_yhome << 4) == 0x60
+ B->npc_yhome == 6
|
- (B->npc_yhome << 4) != 0x60
+ B->npc_yhome != 6
|
- (B->npc_yhome << 4) == 0x70
+ B->npc_yhome == 7
|
- (B->npc_yhome << 4) != 0x70
+ B->npc_yhome != 7
|
- (B->npc_yhome << 4) == 0x80
+ B->npc_yhome == 8
|
- (B->npc_yhome << 4) != 0x80
+ B->npc_yhome != 8
|
- (B->npc_yhome << 4) == 0x90
+ B->npc_yhome == 9
|
- (B->npc_yhome << 4) != 0x90
+ B->npc_yhome != 9
|
- (B->npc_yhome << 4) == 0xa0
+ B->npc_yhome == 10
|
- (B->npc_yhome << 4) != 0xa0
+ B->npc_yhome != 10
|
- (B->npc_yhome << 4) == 0xb0
+ B->npc_yhome == 11
|
- (B->npc_yhome << 4) != 0xb0
+ B->npc_yhome != 11
|
- (B->npc_yhome << 4) == 0xc0
+ B->npc_yhome == 12
|
- (B->npc_yhome << 4) != 0xc0
+ B->npc_yhome != 12
|
- (B->npc_yhome << 4) == 0xd0
+ B->npc_yhome == 13
|
- (B->npc_yhome << 4) != 0xd0
+ B->npc_yhome != 13
|
- (B->npc_yhome << 4) == 0xe0
+ B->npc_yhome == 14
|
- (B->npc_yhome << 4) != 0xe0
+ B->npc_yhome != 14
|
- (B->npc_yhome << 4) == 0xf0
+ B->npc_yhome == 15
|
- (B->npc_yhome << 4) != 0xf0
+ B->npc_yhome != 15
)

@compare_tile_word_npc_xhome_2_ptr@
expression B;
@@
(
- (B->npc_xhome << 2) == 0x0
+ B->npc_xhome == 0
|
- (B->npc_xhome << 2) != 0x0
+ B->npc_xhome != 0
|
- (B->npc_xhome << 2) == 0x4
+ B->npc_xhome == 1
|
- (B->npc_xhome << 2) != 0x4
+ B->npc_xhome != 1
|
- (B->npc_xhome << 2) == 0x8
+ B->npc_xhome == 2
|
- (B->npc_xhome << 2) != 0x8
+ B->npc_xhome != 2
|
- (B->npc_xhome << 2) == 0xc
+ B->npc_xhome == 3
|
- (B->npc_xhome << 2) != 0xc
+ B->npc_xhome != 3
|
- (B->npc_xhome << 2) == 0x10
+ B->npc_xhome == 4
|
- (B->npc_xhome << 2) != 0x10
+ B->npc_xhome != 4
|
- (B->npc_xhome << 2) == 0x14
+ B->npc_xhome == 5
|
- (B->npc_xhome << 2) != 0x14
+ B->npc_xhome != 5
|
- (B->npc_xhome << 2) == 0x18
+ B->npc_xhome == 6
|
- (B->npc_xhome << 2) != 0x18
+ B->npc_xhome != 6
|
- (B->npc_xhome << 2) == 0x1c
+ B->npc_xhome == 7
|
- (B->npc_xhome << 2) != 0x1c
+ B->npc_xhome != 7
|
- (B->npc_xhome << 2) == 0x20
+ B->npc_xhome == 8
|
- (B->npc_xhome << 2) != 0x20
+ B->npc_xhome != 8
|
- (B->npc_xhome << 2) == 0x24
+ B->npc_xhome == 9
|
- (B->npc_xhome << 2) != 0x24
+ B->npc_xhome != 9
|
- (B->npc_xhome << 2) == 0x28
+ B->npc_xhome == 10
|
- (B->npc_xhome << 2) != 0x28
+ B->npc_xhome != 10
|
- (B->npc_xhome << 2) == 0x2c
+ B->npc_xhome == 11
|
- (B->npc_xhome << 2) != 0x2c
+ B->npc_xhome != 11
|
- (B->npc_xhome << 2) == 0x30
+ B->npc_xhome == 12
|
- (B->npc_xhome << 2) != 0x30
+ B->npc_xhome != 12
|
- (B->npc_xhome << 2) == 0x34
+ B->npc_xhome == 13
|
- (B->npc_xhome << 2) != 0x34
+ B->npc_xhome != 13
|
- (B->npc_xhome << 2) == 0x38
+ B->npc_xhome == 14
|
- (B->npc_xhome << 2) != 0x38
+ B->npc_xhome != 14
|
- (B->npc_xhome << 2) == 0x3c
+ B->npc_xhome == 15
|
- (B->npc_xhome << 2) != 0x3c
+ B->npc_xhome != 15
)

@compare_tile_word_npc_xhome_10_ptr@
expression B;
@@
(
- (B->npc_xhome << 10) == 0x0
+ B->npc_xhome == 0
|
- (B->npc_xhome << 10) != 0x0
+ B->npc_xhome != 0
|
- (B->npc_xhome << 10) == 0x400
+ B->npc_xhome == 1
|
- (B->npc_xhome << 10) != 0x400
+ B->npc_xhome != 1
|
- (B->npc_xhome << 10) == 0x800
+ B->npc_xhome == 2
|
- (B->npc_xhome << 10) != 0x800
+ B->npc_xhome != 2
|
- (B->npc_xhome << 10) == 0xc00
+ B->npc_xhome == 3
|
- (B->npc_xhome << 10) != 0xc00
+ B->npc_xhome != 3
|
- (B->npc_xhome << 10) == 0x1000
+ B->npc_xhome == 4
|
- (B->npc_xhome << 10) != 0x1000
+ B->npc_xhome != 4
|
- (B->npc_xhome << 10) == 0x1400
+ B->npc_xhome == 5
|
- (B->npc_xhome << 10) != 0x1400
+ B->npc_xhome != 5
|
- (B->npc_xhome << 10) == 0x1800
+ B->npc_xhome == 6
|
- (B->npc_xhome << 10) != 0x1800
+ B->npc_xhome != 6
|
- (B->npc_xhome << 10) == 0x1c00
+ B->npc_xhome == 7
|
- (B->npc_xhome << 10) != 0x1c00
+ B->npc_xhome != 7
|
- (B->npc_xhome << 10) == 0x2000
+ B->npc_xhome == 8
|
- (B->npc_xhome << 10) != 0x2000
+ B->npc_xhome != 8
|
- (B->npc_xhome << 10) == 0x2400
+ B->npc_xhome == 9
|
- (B->npc_xhome << 10) != 0x2400
+ B->npc_xhome != 9
|
- (B->npc_xhome << 10) == 0x2800
+ B->npc_xhome == 10
|
- (B->npc_xhome << 10) != 0x2800
+ B->npc_xhome != 10
|
- (B->npc_xhome << 10) == 0x2c00
+ B->npc_xhome == 11
|
- (B->npc_xhome << 10) != 0x2c00
+ B->npc_xhome != 11
|
- (B->npc_xhome << 10) == 0x3000
+ B->npc_xhome == 12
|
- (B->npc_xhome << 10) != 0x3000
+ B->npc_xhome != 12
|
- (B->npc_xhome << 10) == 0x3400
+ B->npc_xhome == 13
|
- (B->npc_xhome << 10) != 0x3400
+ B->npc_xhome != 13
|
- (B->npc_xhome << 10) == 0x3800
+ B->npc_xhome == 14
|
- (B->npc_xhome << 10) != 0x3800
+ B->npc_xhome != 14
|
- (B->npc_xhome << 10) == 0x3c00
+ B->npc_xhome == 15
|
- (B->npc_xhome << 10) != 0x3c00
+ B->npc_xhome != 15
)

@compare_size_weight_animated_3_ptr@
expression B;
@@
(
- (B->animated << 3) == 0x0
+ B->animated == 0
|
- (B->animated << 3) != 0x0
+ B->animated != 0
|
- (B->animated << 3) == 0x8
+ B->animated == 1
|
- (B->animated << 3) != 0x8
+ B->animated != 1
)

@compare_size_weight_unit_weight_4_ptr@
expression B;
@@
(
- (B->unit_weight << 4) == 0x0
+ B->unit_weight == 0
|
- (B->unit_weight << 4) != 0x0
+ B->unit_weight != 0
|
- (B->unit_weight << 4) == 0x10
+ B->unit_weight == 1
|
- (B->unit_weight << 4) != 0x10
+ B->unit_weight != 1
|
- (B->unit_weight << 4) == 0x20
+ B->unit_weight == 2
|
- (B->unit_weight << 4) != 0x20
+ B->unit_weight != 2
|
- (B->unit_weight << 4) == 0x30
+ B->unit_weight == 3
|
- (B->unit_weight << 4) != 0x30
+ B->unit_weight != 3
|
- (B->unit_weight << 4) == 0x40
+ B->unit_weight == 4
|
- (B->unit_weight << 4) != 0x40
+ B->unit_weight != 4
|
- (B->unit_weight << 4) == 0x50
+ B->unit_weight == 5
|
- (B->unit_weight << 4) != 0x50
+ B->unit_weight != 5
|
- (B->unit_weight << 4) == 0x60
+ B->unit_weight == 6
|
- (B->unit_weight << 4) != 0x60
+ B->unit_weight != 6
|
- (B->unit_weight << 4) == 0x70
+ B->unit_weight == 7
|
- (B->unit_weight << 4) != 0x70
+ B->unit_weight != 7
|
- (B->unit_weight << 4) == 0x80
+ B->unit_weight == 8
|
- (B->unit_weight << 4) != 0x80
+ B->unit_weight != 8
|
- (B->unit_weight << 4) == 0x90
+ B->unit_weight == 9
|
- (B->unit_weight << 4) != 0x90
+ B->unit_weight != 9
|
- (B->unit_weight << 4) == 0xa0
+ B->unit_weight == 10
|
- (B->unit_weight << 4) != 0xa0
+ B->unit_weight != 10
|
- (B->unit_weight << 4) == 0xb0
+ B->unit_weight == 11
|
- (B->unit_weight << 4) != 0xb0
+ B->unit_weight != 11
|
- (B->unit_weight << 4) == 0xc0
+ B->unit_weight == 12
|
- (B->unit_weight << 4) != 0xc0
+ B->unit_weight != 12
|
- (B->unit_weight << 4) == 0xd0
+ B->unit_weight == 13
|
- (B->unit_weight << 4) != 0xd0
+ B->unit_weight != 13
|
- (B->unit_weight << 4) == 0xe0
+ B->unit_weight == 14
|
- (B->unit_weight << 4) != 0xe0
+ B->unit_weight != 14
|
- (B->unit_weight << 4) == 0xf0
+ B->unit_weight == 15
|
- (B->unit_weight << 4) != 0xf0
+ B->unit_weight != 15
)

@compare_type_flags_flags_res_1_value@
expression B;
@@
(
- (B.flags_res << 1) == 0x0
+ B.flags_res == 0
|
- (B.flags_res << 1) != 0x0
+ B.flags_res != 0
|
- (B.flags_res << 1) == 0x2
+ B.flags_res == 1
|
- (B.flags_res << 1) != 0x2
+ B.flags_res != 1
|
- (B.flags_res << 1) == 0x4
+ B.flags_res == 2
|
- (B.flags_res << 1) != 0x4
+ B.flags_res != 2
|
- (B.flags_res << 1) == 0x6
+ B.flags_res == 3
|
- (B.flags_res << 1) != 0x6
+ B.flags_res != 3
|
- (B.flags_res << 1) == 0x8
+ B.flags_res == 4
|
- (B.flags_res << 1) != 0x8
+ B.flags_res != 4
|
- (B.flags_res << 1) == 0xa
+ B.flags_res == 5
|
- (B.flags_res << 1) != 0xa
+ B.flags_res != 5
|
- (B.flags_res << 1) == 0xc
+ B.flags_res == 6
|
- (B.flags_res << 1) != 0xc
+ B.flags_res != 6
|
- (B.flags_res << 1) == 0xe
+ B.flags_res == 7
|
- (B.flags_res << 1) != 0xe
+ B.flags_res != 7
)

@compare_type_flags_flags_res_9_value@
expression B;
@@
(
- (B.flags_res << 9) == 0x0
+ B.flags_res == 0
|
- (B.flags_res << 9) != 0x0
+ B.flags_res != 0
|
- (B.flags_res << 9) == 0x200
+ B.flags_res == 1
|
- (B.flags_res << 9) != 0x200
+ B.flags_res != 1
|
- (B.flags_res << 9) == 0x400
+ B.flags_res == 2
|
- (B.flags_res << 9) != 0x400
+ B.flags_res != 2
|
- (B.flags_res << 9) == 0x600
+ B.flags_res == 3
|
- (B.flags_res << 9) != 0x600
+ B.flags_res != 3
|
- (B.flags_res << 9) == 0x800
+ B.flags_res == 4
|
- (B.flags_res << 9) != 0x800
+ B.flags_res != 4
|
- (B.flags_res << 9) == 0xa00
+ B.flags_res == 5
|
- (B.flags_res << 9) != 0xa00
+ B.flags_res != 5
|
- (B.flags_res << 9) == 0xc00
+ B.flags_res == 6
|
- (B.flags_res << 9) != 0xc00
+ B.flags_res != 6
|
- (B.flags_res << 9) == 0xe00
+ B.flags_res == 7
|
- (B.flags_res << 9) != 0xe00
+ B.flags_res != 7
)

@compare_type_flags_enchanted_4_value@
expression B;
@@
(
- (B.enchanted << 4) == 0x0
+ B.enchanted == 0
|
- (B.enchanted << 4) != 0x0
+ B.enchanted != 0
|
- (B.enchanted << 4) == 0x10
+ B.enchanted == 1
|
- (B.enchanted << 4) != 0x10
+ B.enchanted != 1
)

@compare_type_flags_enchanted_12_value@
expression B;
@@
(
- (B.enchanted << 12) == 0x0
+ B.enchanted == 0
|
- (B.enchanted << 12) != 0x0
+ B.enchanted != 0
|
- (B.enchanted << 12) == 0x1000
+ B.enchanted == 1
|
- (B.enchanted << 12) != 0x1000
+ B.enchanted != 1
)

@compare_type_flags_doordir_5_value@
expression B;
@@
(
- (B.doordir << 5) == 0x0
+ B.doordir == 0
|
- (B.doordir << 5) != 0x0
+ B.doordir != 0
|
- (B.doordir << 5) == 0x20
+ B.doordir == 1
|
- (B.doordir << 5) != 0x20
+ B.doordir != 1
)

@compare_type_flags_doordir_13_value@
expression B;
@@
(
- (B.doordir << 13) == 0x0
+ B.doordir == 0
|
- (B.doordir << 13) != 0x0
+ B.doordir != 0
|
- (B.doordir << 13) == 0x2000
+ B.doordir == 1
|
- (B.doordir << 13) != 0x2000
+ B.doordir != 1
)

@compare_type_flags_invisible_6_value@
expression B;
@@
(
- (B.invisible << 6) == 0x0
+ B.invisible == 0
|
- (B.invisible << 6) != 0x0
+ B.invisible != 0
|
- (B.invisible << 6) == 0x40
+ B.invisible == 1
|
- (B.invisible << 6) != 0x40
+ B.invisible != 1
)

@compare_type_flags_invisible_14_value@
expression B;
@@
(
- (B.invisible << 14) == 0x0
+ B.invisible == 0
|
- (B.invisible << 14) != 0x0
+ B.invisible != 0
|
- (B.invisible << 14) == 0x4000
+ B.invisible == 1
|
- (B.invisible << 14) != 0x4000
+ B.invisible != 1
)

@compare_type_flags_is_quant_7_value@
expression B;
@@
(
- (B.is_quant << 7) == 0x0
+ B.is_quant == 0
|
- (B.is_quant << 7) != 0x0
+ B.is_quant != 0
|
- (B.is_quant << 7) == 0x80
+ B.is_quant == 1
|
- (B.is_quant << 7) != 0x80
+ B.is_quant != 1
)

@compare_type_flags_is_quant_15_value@
expression B;
@@
(
- (B.is_quant << 15) == 0x0
+ B.is_quant == 0
|
- (B.is_quant << 15) != 0x0
+ B.is_quant != 0
|
- (B.is_quant << 15) == 0x8000
+ B.is_quant == 1
|
- (B.is_quant << 15) != 0x8000
+ B.is_quant != 1
)

@compare_position_word_heading_7_value@
expression B;
@@
(
- (B.heading << 7) == 0x0
+ B.heading == 0
|
- (B.heading << 7) != 0x0
+ B.heading != 0
|
- (B.heading << 7) == 0x80
+ B.heading == 1
|
- (B.heading << 7) != 0x80
+ B.heading != 1
|
- (B.heading << 7) == 0x100
+ B.heading == 2
|
- (B.heading << 7) != 0x100
+ B.heading != 2
|
- (B.heading << 7) == 0x180
+ B.heading == 3
|
- (B.heading << 7) != 0x180
+ B.heading != 3
|
- (B.heading << 7) == 0x200
+ B.heading == 4
|
- (B.heading << 7) != 0x200
+ B.heading != 4
|
- (B.heading << 7) == 0x280
+ B.heading == 5
|
- (B.heading << 7) != 0x280
+ B.heading != 5
|
- (B.heading << 7) == 0x300
+ B.heading == 6
|
- (B.heading << 7) != 0x300
+ B.heading != 6
|
- (B.heading << 7) == 0x380
+ B.heading == 7
|
- (B.heading << 7) != 0x380
+ B.heading != 7
)

@compare_position_word_ypos_2_value@
expression B;
@@
(
- (B.ypos << 2) == 0x0
+ B.ypos == 0
|
- (B.ypos << 2) != 0x0
+ B.ypos != 0
|
- (B.ypos << 2) == 0x4
+ B.ypos == 1
|
- (B.ypos << 2) != 0x4
+ B.ypos != 1
|
- (B.ypos << 2) == 0x8
+ B.ypos == 2
|
- (B.ypos << 2) != 0x8
+ B.ypos != 2
|
- (B.ypos << 2) == 0xc
+ B.ypos == 3
|
- (B.ypos << 2) != 0xc
+ B.ypos != 3
|
- (B.ypos << 2) == 0x10
+ B.ypos == 4
|
- (B.ypos << 2) != 0x10
+ B.ypos != 4
|
- (B.ypos << 2) == 0x14
+ B.ypos == 5
|
- (B.ypos << 2) != 0x14
+ B.ypos != 5
|
- (B.ypos << 2) == 0x18
+ B.ypos == 6
|
- (B.ypos << 2) != 0x18
+ B.ypos != 6
|
- (B.ypos << 2) == 0x1c
+ B.ypos == 7
|
- (B.ypos << 2) != 0x1c
+ B.ypos != 7
)

@compare_position_word_ypos_10_value@
expression B;
@@
(
- (B.ypos << 10) == 0x0
+ B.ypos == 0
|
- (B.ypos << 10) != 0x0
+ B.ypos != 0
|
- (B.ypos << 10) == 0x400
+ B.ypos == 1
|
- (B.ypos << 10) != 0x400
+ B.ypos != 1
|
- (B.ypos << 10) == 0x800
+ B.ypos == 2
|
- (B.ypos << 10) != 0x800
+ B.ypos != 2
|
- (B.ypos << 10) == 0xc00
+ B.ypos == 3
|
- (B.ypos << 10) != 0xc00
+ B.ypos != 3
|
- (B.ypos << 10) == 0x1000
+ B.ypos == 4
|
- (B.ypos << 10) != 0x1000
+ B.ypos != 4
|
- (B.ypos << 10) == 0x1400
+ B.ypos == 5
|
- (B.ypos << 10) != 0x1400
+ B.ypos != 5
|
- (B.ypos << 10) == 0x1800
+ B.ypos == 6
|
- (B.ypos << 10) != 0x1800
+ B.ypos != 6
|
- (B.ypos << 10) == 0x1c00
+ B.ypos == 7
|
- (B.ypos << 10) != 0x1c00
+ B.ypos != 7
)

@compare_position_word_xpos_5_value@
expression B;
@@
(
- (B.xpos << 5) == 0x0
+ B.xpos == 0
|
- (B.xpos << 5) != 0x0
+ B.xpos != 0
|
- (B.xpos << 5) == 0x20
+ B.xpos == 1
|
- (B.xpos << 5) != 0x20
+ B.xpos != 1
|
- (B.xpos << 5) == 0x40
+ B.xpos == 2
|
- (B.xpos << 5) != 0x40
+ B.xpos != 2
|
- (B.xpos << 5) == 0x60
+ B.xpos == 3
|
- (B.xpos << 5) != 0x60
+ B.xpos != 3
|
- (B.xpos << 5) == 0x80
+ B.xpos == 4
|
- (B.xpos << 5) != 0x80
+ B.xpos != 4
|
- (B.xpos << 5) == 0xa0
+ B.xpos == 5
|
- (B.xpos << 5) != 0xa0
+ B.xpos != 5
|
- (B.xpos << 5) == 0xc0
+ B.xpos == 6
|
- (B.xpos << 5) != 0xc0
+ B.xpos != 6
|
- (B.xpos << 5) == 0xe0
+ B.xpos == 7
|
- (B.xpos << 5) != 0xe0
+ B.xpos != 7
)

@compare_position_word_xpos_13_value@
expression B;
@@
(
- (B.xpos << 13) == 0x0
+ B.xpos == 0
|
- (B.xpos << 13) != 0x0
+ B.xpos != 0
|
- (B.xpos << 13) == 0x2000
+ B.xpos == 1
|
- (B.xpos << 13) != 0x2000
+ B.xpos != 1
|
- (B.xpos << 13) == 0x4000
+ B.xpos == 2
|
- (B.xpos << 13) != 0x4000
+ B.xpos != 2
|
- (B.xpos << 13) == 0x6000
+ B.xpos == 3
|
- (B.xpos << 13) != 0x6000
+ B.xpos != 3
|
- (B.xpos << 13) == 0x8000
+ B.xpos == 4
|
- (B.xpos << 13) != 0x8000
+ B.xpos != 4
|
- (B.xpos << 13) == 0xa000
+ B.xpos == 5
|
- (B.xpos << 13) != 0xa000
+ B.xpos != 5
|
- (B.xpos << 13) == 0xc000
+ B.xpos == 6
|
- (B.xpos << 13) != 0xc000
+ B.xpos != 6
|
- (B.xpos << 13) == 0xe000
+ B.xpos == 7
|
- (B.xpos << 13) != 0xe000
+ B.xpos != 7
)

@compare_chain_word_next_6_value@
expression B;
@@
(
- (B.next << 6) == 0x0
+ B.next == 0
|
- (B.next << 6) != 0x0
+ B.next != 0
|
- (B.next << 6) == 0x40
+ B.next == 1
|
- (B.next << 6) != 0x40
+ B.next != 1
|
- (B.next << 6) == 0x80
+ B.next == 2
|
- (B.next << 6) != 0x80
+ B.next != 2
|
- (B.next << 6) == 0xc0
+ B.next == 3
|
- (B.next << 6) != 0xc0
+ B.next != 3
|
- (B.next << 6) == 0x100
+ B.next == 4
|
- (B.next << 6) != 0x100
+ B.next != 4
|
- (B.next << 6) == 0x140
+ B.next == 5
|
- (B.next << 6) != 0x140
+ B.next != 5
|
- (B.next << 6) == 0x180
+ B.next == 6
|
- (B.next << 6) != 0x180
+ B.next != 6
|
- (B.next << 6) == 0x1c0
+ B.next == 7
|
- (B.next << 6) != 0x1c0
+ B.next != 7
|
- (B.next << 6) == 0x200
+ B.next == 8
|
- (B.next << 6) != 0x200
+ B.next != 8
|
- (B.next << 6) == 0x240
+ B.next == 9
|
- (B.next << 6) != 0x240
+ B.next != 9
|
- (B.next << 6) == 0x280
+ B.next == 10
|
- (B.next << 6) != 0x280
+ B.next != 10
|
- (B.next << 6) == 0x2c0
+ B.next == 11
|
- (B.next << 6) != 0x2c0
+ B.next != 11
|
- (B.next << 6) == 0x300
+ B.next == 12
|
- (B.next << 6) != 0x300
+ B.next != 12
|
- (B.next << 6) == 0x340
+ B.next == 13
|
- (B.next << 6) != 0x340
+ B.next != 13
|
- (B.next << 6) == 0x380
+ B.next == 14
|
- (B.next << 6) != 0x380
+ B.next != 14
|
- (B.next << 6) == 0x3c0
+ B.next == 15
|
- (B.next << 6) != 0x3c0
+ B.next != 15
)

@compare_link_word_link_6_value@
expression B;
@@
(
- (B.link << 6) == 0x0
+ B.link == 0
|
- (B.link << 6) != 0x0
+ B.link != 0
|
- (B.link << 6) == 0x40
+ B.link == 1
|
- (B.link << 6) != 0x40
+ B.link != 1
|
- (B.link << 6) == 0x80
+ B.link == 2
|
- (B.link << 6) != 0x80
+ B.link != 2
|
- (B.link << 6) == 0xc0
+ B.link == 3
|
- (B.link << 6) != 0xc0
+ B.link != 3
|
- (B.link << 6) == 0x100
+ B.link == 4
|
- (B.link << 6) != 0x100
+ B.link != 4
|
- (B.link << 6) == 0x140
+ B.link == 5
|
- (B.link << 6) != 0x140
+ B.link != 5
|
- (B.link << 6) == 0x180
+ B.link == 6
|
- (B.link << 6) != 0x180
+ B.link != 6
|
- (B.link << 6) == 0x1c0
+ B.link == 7
|
- (B.link << 6) != 0x1c0
+ B.link != 7
|
- (B.link << 6) == 0x200
+ B.link == 8
|
- (B.link << 6) != 0x200
+ B.link != 8
|
- (B.link << 6) == 0x240
+ B.link == 9
|
- (B.link << 6) != 0x240
+ B.link != 9
|
- (B.link << 6) == 0x280
+ B.link == 10
|
- (B.link << 6) != 0x280
+ B.link != 10
|
- (B.link << 6) == 0x2c0
+ B.link == 11
|
- (B.link << 6) != 0x2c0
+ B.link != 11
|
- (B.link << 6) == 0x300
+ B.link == 12
|
- (B.link << 6) != 0x300
+ B.link != 12
|
- (B.link << 6) == 0x340
+ B.link == 13
|
- (B.link << 6) != 0x340
+ B.link != 13
|
- (B.link << 6) == 0x380
+ B.link == 14
|
- (B.link << 6) != 0x380
+ B.link != 14
|
- (B.link << 6) == 0x3c0
+ B.link == 15
|
- (B.link << 6) != 0x3c0
+ B.link != 15
)

@compare_goal_word_npc_gtarg_4_value@
expression B;
@@
(
- (B.npc_gtarg << 4) == 0x0
+ B.npc_gtarg == 0
|
- (B.npc_gtarg << 4) != 0x0
+ B.npc_gtarg != 0
|
- (B.npc_gtarg << 4) == 0x10
+ B.npc_gtarg == 1
|
- (B.npc_gtarg << 4) != 0x10
+ B.npc_gtarg != 1
|
- (B.npc_gtarg << 4) == 0x20
+ B.npc_gtarg == 2
|
- (B.npc_gtarg << 4) != 0x20
+ B.npc_gtarg != 2
|
- (B.npc_gtarg << 4) == 0x30
+ B.npc_gtarg == 3
|
- (B.npc_gtarg << 4) != 0x30
+ B.npc_gtarg != 3
|
- (B.npc_gtarg << 4) == 0x40
+ B.npc_gtarg == 4
|
- (B.npc_gtarg << 4) != 0x40
+ B.npc_gtarg != 4
|
- (B.npc_gtarg << 4) == 0x50
+ B.npc_gtarg == 5
|
- (B.npc_gtarg << 4) != 0x50
+ B.npc_gtarg != 5
|
- (B.npc_gtarg << 4) == 0x60
+ B.npc_gtarg == 6
|
- (B.npc_gtarg << 4) != 0x60
+ B.npc_gtarg != 6
|
- (B.npc_gtarg << 4) == 0x70
+ B.npc_gtarg == 7
|
- (B.npc_gtarg << 4) != 0x70
+ B.npc_gtarg != 7
|
- (B.npc_gtarg << 4) == 0x80
+ B.npc_gtarg == 8
|
- (B.npc_gtarg << 4) != 0x80
+ B.npc_gtarg != 8
|
- (B.npc_gtarg << 4) == 0x90
+ B.npc_gtarg == 9
|
- (B.npc_gtarg << 4) != 0x90
+ B.npc_gtarg != 9
|
- (B.npc_gtarg << 4) == 0xa0
+ B.npc_gtarg == 10
|
- (B.npc_gtarg << 4) != 0xa0
+ B.npc_gtarg != 10
|
- (B.npc_gtarg << 4) == 0xb0
+ B.npc_gtarg == 11
|
- (B.npc_gtarg << 4) != 0xb0
+ B.npc_gtarg != 11
|
- (B.npc_gtarg << 4) == 0xc0
+ B.npc_gtarg == 12
|
- (B.npc_gtarg << 4) != 0xc0
+ B.npc_gtarg != 12
|
- (B.npc_gtarg << 4) == 0xd0
+ B.npc_gtarg == 13
|
- (B.npc_gtarg << 4) != 0xd0
+ B.npc_gtarg != 13
|
- (B.npc_gtarg << 4) == 0xe0
+ B.npc_gtarg == 14
|
- (B.npc_gtarg << 4) != 0xe0
+ B.npc_gtarg != 14
|
- (B.npc_gtarg << 4) == 0xf0
+ B.npc_gtarg == 15
|
- (B.npc_gtarg << 4) != 0xf0
+ B.npc_gtarg != 15
)

@compare_goal_word_npc_animation_frame_4_value@
expression B;
@@
(
- (B.npc_animation_frame << 4) == 0x0
+ B.npc_animation_frame == 0
|
- (B.npc_animation_frame << 4) != 0x0
+ B.npc_animation_frame != 0
|
- (B.npc_animation_frame << 4) == 0x10
+ B.npc_animation_frame == 1
|
- (B.npc_animation_frame << 4) != 0x10
+ B.npc_animation_frame != 1
|
- (B.npc_animation_frame << 4) == 0x20
+ B.npc_animation_frame == 2
|
- (B.npc_animation_frame << 4) != 0x20
+ B.npc_animation_frame != 2
|
- (B.npc_animation_frame << 4) == 0x30
+ B.npc_animation_frame == 3
|
- (B.npc_animation_frame << 4) != 0x30
+ B.npc_animation_frame != 3
|
- (B.npc_animation_frame << 4) == 0x40
+ B.npc_animation_frame == 4
|
- (B.npc_animation_frame << 4) != 0x40
+ B.npc_animation_frame != 4
|
- (B.npc_animation_frame << 4) == 0x50
+ B.npc_animation_frame == 5
|
- (B.npc_animation_frame << 4) != 0x50
+ B.npc_animation_frame != 5
|
- (B.npc_animation_frame << 4) == 0x60
+ B.npc_animation_frame == 6
|
- (B.npc_animation_frame << 4) != 0x60
+ B.npc_animation_frame != 6
|
- (B.npc_animation_frame << 4) == 0x70
+ B.npc_animation_frame == 7
|
- (B.npc_animation_frame << 4) != 0x70
+ B.npc_animation_frame != 7
|
- (B.npc_animation_frame << 4) == 0x80
+ B.npc_animation_frame == 8
|
- (B.npc_animation_frame << 4) != 0x80
+ B.npc_animation_frame != 8
|
- (B.npc_animation_frame << 4) == 0x90
+ B.npc_animation_frame == 9
|
- (B.npc_animation_frame << 4) != 0x90
+ B.npc_animation_frame != 9
|
- (B.npc_animation_frame << 4) == 0xa0
+ B.npc_animation_frame == 10
|
- (B.npc_animation_frame << 4) != 0xa0
+ B.npc_animation_frame != 10
|
- (B.npc_animation_frame << 4) == 0xb0
+ B.npc_animation_frame == 11
|
- (B.npc_animation_frame << 4) != 0xb0
+ B.npc_animation_frame != 11
|
- (B.npc_animation_frame << 4) == 0xc0
+ B.npc_animation_frame == 12
|
- (B.npc_animation_frame << 4) != 0xc0
+ B.npc_animation_frame != 12
|
- (B.npc_animation_frame << 4) == 0xd0
+ B.npc_animation_frame == 13
|
- (B.npc_animation_frame << 4) != 0xd0
+ B.npc_animation_frame != 13
|
- (B.npc_animation_frame << 4) == 0xe0
+ B.npc_animation_frame == 14
|
- (B.npc_animation_frame << 4) != 0xe0
+ B.npc_animation_frame != 14
|
- (B.npc_animation_frame << 4) == 0xf0
+ B.npc_animation_frame == 15
|
- (B.npc_animation_frame << 4) != 0xf0
+ B.npc_animation_frame != 15
)

@compare_goal_word_npc_animation_frame_12_value@
expression B;
@@
(
- (B.npc_animation_frame << 12) == 0x0
+ B.npc_animation_frame == 0
|
- (B.npc_animation_frame << 12) != 0x0
+ B.npc_animation_frame != 0
|
- (B.npc_animation_frame << 12) == 0x1000
+ B.npc_animation_frame == 1
|
- (B.npc_animation_frame << 12) != 0x1000
+ B.npc_animation_frame != 1
|
- (B.npc_animation_frame << 12) == 0x2000
+ B.npc_animation_frame == 2
|
- (B.npc_animation_frame << 12) != 0x2000
+ B.npc_animation_frame != 2
|
- (B.npc_animation_frame << 12) == 0x3000
+ B.npc_animation_frame == 3
|
- (B.npc_animation_frame << 12) != 0x3000
+ B.npc_animation_frame != 3
|
- (B.npc_animation_frame << 12) == 0x4000
+ B.npc_animation_frame == 4
|
- (B.npc_animation_frame << 12) != 0x4000
+ B.npc_animation_frame != 4
|
- (B.npc_animation_frame << 12) == 0x5000
+ B.npc_animation_frame == 5
|
- (B.npc_animation_frame << 12) != 0x5000
+ B.npc_animation_frame != 5
|
- (B.npc_animation_frame << 12) == 0x6000
+ B.npc_animation_frame == 6
|
- (B.npc_animation_frame << 12) != 0x6000
+ B.npc_animation_frame != 6
|
- (B.npc_animation_frame << 12) == 0x7000
+ B.npc_animation_frame == 7
|
- (B.npc_animation_frame << 12) != 0x7000
+ B.npc_animation_frame != 7
|
- (B.npc_animation_frame << 12) == 0x8000
+ B.npc_animation_frame == 8
|
- (B.npc_animation_frame << 12) != 0x8000
+ B.npc_animation_frame != 8
|
- (B.npc_animation_frame << 12) == 0x9000
+ B.npc_animation_frame == 9
|
- (B.npc_animation_frame << 12) != 0x9000
+ B.npc_animation_frame != 9
|
- (B.npc_animation_frame << 12) == 0xa000
+ B.npc_animation_frame == 10
|
- (B.npc_animation_frame << 12) != 0xa000
+ B.npc_animation_frame != 10
|
- (B.npc_animation_frame << 12) == 0xb000
+ B.npc_animation_frame == 11
|
- (B.npc_animation_frame << 12) != 0xb000
+ B.npc_animation_frame != 11
|
- (B.npc_animation_frame << 12) == 0xc000
+ B.npc_animation_frame == 12
|
- (B.npc_animation_frame << 12) != 0xc000
+ B.npc_animation_frame != 12
|
- (B.npc_animation_frame << 12) == 0xd000
+ B.npc_animation_frame == 13
|
- (B.npc_animation_frame << 12) != 0xd000
+ B.npc_animation_frame != 13
|
- (B.npc_animation_frame << 12) == 0xe000
+ B.npc_animation_frame == 14
|
- (B.npc_animation_frame << 12) != 0xe000
+ B.npc_animation_frame != 14
|
- (B.npc_animation_frame << 12) == 0xf000
+ B.npc_animation_frame == 15
|
- (B.npc_animation_frame << 12) != 0xf000
+ B.npc_animation_frame != 15
)

@compare_status_word_npc_talkedto_5_value@
expression B;
@@
(
- (B.npc_talkedto << 5) == 0x0
+ B.npc_talkedto == 0
|
- (B.npc_talkedto << 5) != 0x0
+ B.npc_talkedto != 0
|
- (B.npc_talkedto << 5) == 0x20
+ B.npc_talkedto == 1
|
- (B.npc_talkedto << 5) != 0x20
+ B.npc_talkedto != 1
)

@compare_status_word_npc_talkedto_13_value@
expression B;
@@
(
- (B.npc_talkedto << 13) == 0x0
+ B.npc_talkedto == 0
|
- (B.npc_talkedto << 13) != 0x0
+ B.npc_talkedto != 0
|
- (B.npc_talkedto << 13) == 0x2000
+ B.npc_talkedto == 1
|
- (B.npc_talkedto << 13) != 0x2000
+ B.npc_talkedto != 1
)

@compare_status_word_npc_attitude_6_value@
expression B;
@@
(
- (B.npc_attitude << 6) == 0x0
+ B.npc_attitude == 0
|
- (B.npc_attitude << 6) != 0x0
+ B.npc_attitude != 0
|
- (B.npc_attitude << 6) == 0x40
+ B.npc_attitude == 1
|
- (B.npc_attitude << 6) != 0x40
+ B.npc_attitude != 1
|
- (B.npc_attitude << 6) == 0x80
+ B.npc_attitude == 2
|
- (B.npc_attitude << 6) != 0x80
+ B.npc_attitude != 2
|
- (B.npc_attitude << 6) == 0xc0
+ B.npc_attitude == 3
|
- (B.npc_attitude << 6) != 0xc0
+ B.npc_attitude != 3
)

@compare_status_word_npc_attitude_14_value@
expression B;
@@
(
- (B.npc_attitude << 14) == 0x0
+ B.npc_attitude == 0
|
- (B.npc_attitude << 14) != 0x0
+ B.npc_attitude != 0
|
- (B.npc_attitude << 14) == 0x4000
+ B.npc_attitude == 1
|
- (B.npc_attitude << 14) != 0x4000
+ B.npc_attitude != 1
|
- (B.npc_attitude << 14) == 0x8000
+ B.npc_attitude == 2
|
- (B.npc_attitude << 14) != 0x8000
+ B.npc_attitude != 2
|
- (B.npc_attitude << 14) == 0xc000
+ B.npc_attitude == 3
|
- (B.npc_attitude << 14) != 0xc000
+ B.npc_attitude != 3
)

@compare_target_word_npc_target_tile_y_6_value@
expression B;
@@
(
- (B.npc_target_tile_y << 6) == 0x0
+ B.npc_target_tile_y == 0
|
- (B.npc_target_tile_y << 6) != 0x0
+ B.npc_target_tile_y != 0
|
- (B.npc_target_tile_y << 6) == 0x40
+ B.npc_target_tile_y == 1
|
- (B.npc_target_tile_y << 6) != 0x40
+ B.npc_target_tile_y != 1
|
- (B.npc_target_tile_y << 6) == 0x80
+ B.npc_target_tile_y == 2
|
- (B.npc_target_tile_y << 6) != 0x80
+ B.npc_target_tile_y != 2
|
- (B.npc_target_tile_y << 6) == 0xc0
+ B.npc_target_tile_y == 3
|
- (B.npc_target_tile_y << 6) != 0xc0
+ B.npc_target_tile_y != 3
|
- (B.npc_target_tile_y << 6) == 0x100
+ B.npc_target_tile_y == 4
|
- (B.npc_target_tile_y << 6) != 0x100
+ B.npc_target_tile_y != 4
|
- (B.npc_target_tile_y << 6) == 0x140
+ B.npc_target_tile_y == 5
|
- (B.npc_target_tile_y << 6) != 0x140
+ B.npc_target_tile_y != 5
|
- (B.npc_target_tile_y << 6) == 0x180
+ B.npc_target_tile_y == 6
|
- (B.npc_target_tile_y << 6) != 0x180
+ B.npc_target_tile_y != 6
|
- (B.npc_target_tile_y << 6) == 0x1c0
+ B.npc_target_tile_y == 7
|
- (B.npc_target_tile_y << 6) != 0x1c0
+ B.npc_target_tile_y != 7
|
- (B.npc_target_tile_y << 6) == 0x200
+ B.npc_target_tile_y == 8
|
- (B.npc_target_tile_y << 6) != 0x200
+ B.npc_target_tile_y != 8
|
- (B.npc_target_tile_y << 6) == 0x240
+ B.npc_target_tile_y == 9
|
- (B.npc_target_tile_y << 6) != 0x240
+ B.npc_target_tile_y != 9
|
- (B.npc_target_tile_y << 6) == 0x280
+ B.npc_target_tile_y == 10
|
- (B.npc_target_tile_y << 6) != 0x280
+ B.npc_target_tile_y != 10
|
- (B.npc_target_tile_y << 6) == 0x2c0
+ B.npc_target_tile_y == 11
|
- (B.npc_target_tile_y << 6) != 0x2c0
+ B.npc_target_tile_y != 11
|
- (B.npc_target_tile_y << 6) == 0x300
+ B.npc_target_tile_y == 12
|
- (B.npc_target_tile_y << 6) != 0x300
+ B.npc_target_tile_y != 12
|
- (B.npc_target_tile_y << 6) == 0x340
+ B.npc_target_tile_y == 13
|
- (B.npc_target_tile_y << 6) != 0x340
+ B.npc_target_tile_y != 13
|
- (B.npc_target_tile_y << 6) == 0x380
+ B.npc_target_tile_y == 14
|
- (B.npc_target_tile_y << 6) != 0x380
+ B.npc_target_tile_y != 14
|
- (B.npc_target_tile_y << 6) == 0x3c0
+ B.npc_target_tile_y == 15
|
- (B.npc_target_tile_y << 6) != 0x3c0
+ B.npc_target_tile_y != 15
)

@compare_target_word_npc_swing_charge_4_value@
expression B;
@@
(
- (B.npc_swing_charge << 4) == 0x0
+ B.npc_swing_charge == 0
|
- (B.npc_swing_charge << 4) != 0x0
+ B.npc_swing_charge != 0
|
- (B.npc_swing_charge << 4) == 0x10
+ B.npc_swing_charge == 1
|
- (B.npc_swing_charge << 4) != 0x10
+ B.npc_swing_charge != 1
|
- (B.npc_swing_charge << 4) == 0x20
+ B.npc_swing_charge == 2
|
- (B.npc_swing_charge << 4) != 0x20
+ B.npc_swing_charge != 2
|
- (B.npc_swing_charge << 4) == 0x30
+ B.npc_swing_charge == 3
|
- (B.npc_swing_charge << 4) != 0x30
+ B.npc_swing_charge != 3
|
- (B.npc_swing_charge << 4) == 0x40
+ B.npc_swing_charge == 4
|
- (B.npc_swing_charge << 4) != 0x40
+ B.npc_swing_charge != 4
|
- (B.npc_swing_charge << 4) == 0x50
+ B.npc_swing_charge == 5
|
- (B.npc_swing_charge << 4) != 0x50
+ B.npc_swing_charge != 5
|
- (B.npc_swing_charge << 4) == 0x60
+ B.npc_swing_charge == 6
|
- (B.npc_swing_charge << 4) != 0x60
+ B.npc_swing_charge != 6
|
- (B.npc_swing_charge << 4) == 0x70
+ B.npc_swing_charge == 7
|
- (B.npc_swing_charge << 4) != 0x70
+ B.npc_swing_charge != 7
|
- (B.npc_swing_charge << 4) == 0x80
+ B.npc_swing_charge == 8
|
- (B.npc_swing_charge << 4) != 0x80
+ B.npc_swing_charge != 8
|
- (B.npc_swing_charge << 4) == 0x90
+ B.npc_swing_charge == 9
|
- (B.npc_swing_charge << 4) != 0x90
+ B.npc_swing_charge != 9
|
- (B.npc_swing_charge << 4) == 0xa0
+ B.npc_swing_charge == 10
|
- (B.npc_swing_charge << 4) != 0xa0
+ B.npc_swing_charge != 10
|
- (B.npc_swing_charge << 4) == 0xb0
+ B.npc_swing_charge == 11
|
- (B.npc_swing_charge << 4) != 0xb0
+ B.npc_swing_charge != 11
|
- (B.npc_swing_charge << 4) == 0xc0
+ B.npc_swing_charge == 12
|
- (B.npc_swing_charge << 4) != 0xc0
+ B.npc_swing_charge != 12
|
- (B.npc_swing_charge << 4) == 0xd0
+ B.npc_swing_charge == 13
|
- (B.npc_swing_charge << 4) != 0xd0
+ B.npc_swing_charge != 13
|
- (B.npc_swing_charge << 4) == 0xe0
+ B.npc_swing_charge == 14
|
- (B.npc_swing_charge << 4) != 0xe0
+ B.npc_swing_charge != 14
|
- (B.npc_swing_charge << 4) == 0xf0
+ B.npc_swing_charge == 15
|
- (B.npc_swing_charge << 4) != 0xf0
+ B.npc_swing_charge != 15
)

@compare_target_word_npc_swing_charge_12_value@
expression B;
@@
(
- (B.npc_swing_charge << 12) == 0x0
+ B.npc_swing_charge == 0
|
- (B.npc_swing_charge << 12) != 0x0
+ B.npc_swing_charge != 0
|
- (B.npc_swing_charge << 12) == 0x1000
+ B.npc_swing_charge == 1
|
- (B.npc_swing_charge << 12) != 0x1000
+ B.npc_swing_charge != 1
|
- (B.npc_swing_charge << 12) == 0x2000
+ B.npc_swing_charge == 2
|
- (B.npc_swing_charge << 12) != 0x2000
+ B.npc_swing_charge != 2
|
- (B.npc_swing_charge << 12) == 0x3000
+ B.npc_swing_charge == 3
|
- (B.npc_swing_charge << 12) != 0x3000
+ B.npc_swing_charge != 3
|
- (B.npc_swing_charge << 12) == 0x4000
+ B.npc_swing_charge == 4
|
- (B.npc_swing_charge << 12) != 0x4000
+ B.npc_swing_charge != 4
|
- (B.npc_swing_charge << 12) == 0x5000
+ B.npc_swing_charge == 5
|
- (B.npc_swing_charge << 12) != 0x5000
+ B.npc_swing_charge != 5
|
- (B.npc_swing_charge << 12) == 0x6000
+ B.npc_swing_charge == 6
|
- (B.npc_swing_charge << 12) != 0x6000
+ B.npc_swing_charge != 6
|
- (B.npc_swing_charge << 12) == 0x7000
+ B.npc_swing_charge == 7
|
- (B.npc_swing_charge << 12) != 0x7000
+ B.npc_swing_charge != 7
|
- (B.npc_swing_charge << 12) == 0x8000
+ B.npc_swing_charge == 8
|
- (B.npc_swing_charge << 12) != 0x8000
+ B.npc_swing_charge != 8
|
- (B.npc_swing_charge << 12) == 0x9000
+ B.npc_swing_charge == 9
|
- (B.npc_swing_charge << 12) != 0x9000
+ B.npc_swing_charge != 9
|
- (B.npc_swing_charge << 12) == 0xa000
+ B.npc_swing_charge == 10
|
- (B.npc_swing_charge << 12) != 0xa000
+ B.npc_swing_charge != 10
|
- (B.npc_swing_charge << 12) == 0xb000
+ B.npc_swing_charge == 11
|
- (B.npc_swing_charge << 12) != 0xb000
+ B.npc_swing_charge != 11
|
- (B.npc_swing_charge << 12) == 0xc000
+ B.npc_swing_charge == 12
|
- (B.npc_swing_charge << 12) != 0xc000
+ B.npc_swing_charge != 12
|
- (B.npc_swing_charge << 12) == 0xd000
+ B.npc_swing_charge == 13
|
- (B.npc_swing_charge << 12) != 0xd000
+ B.npc_swing_charge != 13
|
- (B.npc_swing_charge << 12) == 0xe000
+ B.npc_swing_charge == 14
|
- (B.npc_swing_charge << 12) != 0xe000
+ B.npc_swing_charge != 14
|
- (B.npc_swing_charge << 12) == 0xf000
+ B.npc_swing_charge == 15
|
- (B.npc_swing_charge << 12) != 0xf000
+ B.npc_swing_charge != 15
)

@compare_tile_word_npc_yhome_4_value@
expression B;
@@
(
- (B.npc_yhome << 4) == 0x0
+ B.npc_yhome == 0
|
- (B.npc_yhome << 4) != 0x0
+ B.npc_yhome != 0
|
- (B.npc_yhome << 4) == 0x10
+ B.npc_yhome == 1
|
- (B.npc_yhome << 4) != 0x10
+ B.npc_yhome != 1
|
- (B.npc_yhome << 4) == 0x20
+ B.npc_yhome == 2
|
- (B.npc_yhome << 4) != 0x20
+ B.npc_yhome != 2
|
- (B.npc_yhome << 4) == 0x30
+ B.npc_yhome == 3
|
- (B.npc_yhome << 4) != 0x30
+ B.npc_yhome != 3
|
- (B.npc_yhome << 4) == 0x40
+ B.npc_yhome == 4
|
- (B.npc_yhome << 4) != 0x40
+ B.npc_yhome != 4
|
- (B.npc_yhome << 4) == 0x50
+ B.npc_yhome == 5
|
- (B.npc_yhome << 4) != 0x50
+ B.npc_yhome != 5
|
- (B.npc_yhome << 4) == 0x60
+ B.npc_yhome == 6
|
- (B.npc_yhome << 4) != 0x60
+ B.npc_yhome != 6
|
- (B.npc_yhome << 4) == 0x70
+ B.npc_yhome == 7
|
- (B.npc_yhome << 4) != 0x70
+ B.npc_yhome != 7
|
- (B.npc_yhome << 4) == 0x80
+ B.npc_yhome == 8
|
- (B.npc_yhome << 4) != 0x80
+ B.npc_yhome != 8
|
- (B.npc_yhome << 4) == 0x90
+ B.npc_yhome == 9
|
- (B.npc_yhome << 4) != 0x90
+ B.npc_yhome != 9
|
- (B.npc_yhome << 4) == 0xa0
+ B.npc_yhome == 10
|
- (B.npc_yhome << 4) != 0xa0
+ B.npc_yhome != 10
|
- (B.npc_yhome << 4) == 0xb0
+ B.npc_yhome == 11
|
- (B.npc_yhome << 4) != 0xb0
+ B.npc_yhome != 11
|
- (B.npc_yhome << 4) == 0xc0
+ B.npc_yhome == 12
|
- (B.npc_yhome << 4) != 0xc0
+ B.npc_yhome != 12
|
- (B.npc_yhome << 4) == 0xd0
+ B.npc_yhome == 13
|
- (B.npc_yhome << 4) != 0xd0
+ B.npc_yhome != 13
|
- (B.npc_yhome << 4) == 0xe0
+ B.npc_yhome == 14
|
- (B.npc_yhome << 4) != 0xe0
+ B.npc_yhome != 14
|
- (B.npc_yhome << 4) == 0xf0
+ B.npc_yhome == 15
|
- (B.npc_yhome << 4) != 0xf0
+ B.npc_yhome != 15
)

@compare_tile_word_npc_xhome_2_value@
expression B;
@@
(
- (B.npc_xhome << 2) == 0x0
+ B.npc_xhome == 0
|
- (B.npc_xhome << 2) != 0x0
+ B.npc_xhome != 0
|
- (B.npc_xhome << 2) == 0x4
+ B.npc_xhome == 1
|
- (B.npc_xhome << 2) != 0x4
+ B.npc_xhome != 1
|
- (B.npc_xhome << 2) == 0x8
+ B.npc_xhome == 2
|
- (B.npc_xhome << 2) != 0x8
+ B.npc_xhome != 2
|
- (B.npc_xhome << 2) == 0xc
+ B.npc_xhome == 3
|
- (B.npc_xhome << 2) != 0xc
+ B.npc_xhome != 3
|
- (B.npc_xhome << 2) == 0x10
+ B.npc_xhome == 4
|
- (B.npc_xhome << 2) != 0x10
+ B.npc_xhome != 4
|
- (B.npc_xhome << 2) == 0x14
+ B.npc_xhome == 5
|
- (B.npc_xhome << 2) != 0x14
+ B.npc_xhome != 5
|
- (B.npc_xhome << 2) == 0x18
+ B.npc_xhome == 6
|
- (B.npc_xhome << 2) != 0x18
+ B.npc_xhome != 6
|
- (B.npc_xhome << 2) == 0x1c
+ B.npc_xhome == 7
|
- (B.npc_xhome << 2) != 0x1c
+ B.npc_xhome != 7
|
- (B.npc_xhome << 2) == 0x20
+ B.npc_xhome == 8
|
- (B.npc_xhome << 2) != 0x20
+ B.npc_xhome != 8
|
- (B.npc_xhome << 2) == 0x24
+ B.npc_xhome == 9
|
- (B.npc_xhome << 2) != 0x24
+ B.npc_xhome != 9
|
- (B.npc_xhome << 2) == 0x28
+ B.npc_xhome == 10
|
- (B.npc_xhome << 2) != 0x28
+ B.npc_xhome != 10
|
- (B.npc_xhome << 2) == 0x2c
+ B.npc_xhome == 11
|
- (B.npc_xhome << 2) != 0x2c
+ B.npc_xhome != 11
|
- (B.npc_xhome << 2) == 0x30
+ B.npc_xhome == 12
|
- (B.npc_xhome << 2) != 0x30
+ B.npc_xhome != 12
|
- (B.npc_xhome << 2) == 0x34
+ B.npc_xhome == 13
|
- (B.npc_xhome << 2) != 0x34
+ B.npc_xhome != 13
|
- (B.npc_xhome << 2) == 0x38
+ B.npc_xhome == 14
|
- (B.npc_xhome << 2) != 0x38
+ B.npc_xhome != 14
|
- (B.npc_xhome << 2) == 0x3c
+ B.npc_xhome == 15
|
- (B.npc_xhome << 2) != 0x3c
+ B.npc_xhome != 15
)

@compare_tile_word_npc_xhome_10_value@
expression B;
@@
(
- (B.npc_xhome << 10) == 0x0
+ B.npc_xhome == 0
|
- (B.npc_xhome << 10) != 0x0
+ B.npc_xhome != 0
|
- (B.npc_xhome << 10) == 0x400
+ B.npc_xhome == 1
|
- (B.npc_xhome << 10) != 0x400
+ B.npc_xhome != 1
|
- (B.npc_xhome << 10) == 0x800
+ B.npc_xhome == 2
|
- (B.npc_xhome << 10) != 0x800
+ B.npc_xhome != 2
|
- (B.npc_xhome << 10) == 0xc00
+ B.npc_xhome == 3
|
- (B.npc_xhome << 10) != 0xc00
+ B.npc_xhome != 3
|
- (B.npc_xhome << 10) == 0x1000
+ B.npc_xhome == 4
|
- (B.npc_xhome << 10) != 0x1000
+ B.npc_xhome != 4
|
- (B.npc_xhome << 10) == 0x1400
+ B.npc_xhome == 5
|
- (B.npc_xhome << 10) != 0x1400
+ B.npc_xhome != 5
|
- (B.npc_xhome << 10) == 0x1800
+ B.npc_xhome == 6
|
- (B.npc_xhome << 10) != 0x1800
+ B.npc_xhome != 6
|
- (B.npc_xhome << 10) == 0x1c00
+ B.npc_xhome == 7
|
- (B.npc_xhome << 10) != 0x1c00
+ B.npc_xhome != 7
|
- (B.npc_xhome << 10) == 0x2000
+ B.npc_xhome == 8
|
- (B.npc_xhome << 10) != 0x2000
+ B.npc_xhome != 8
|
- (B.npc_xhome << 10) == 0x2400
+ B.npc_xhome == 9
|
- (B.npc_xhome << 10) != 0x2400
+ B.npc_xhome != 9
|
- (B.npc_xhome << 10) == 0x2800
+ B.npc_xhome == 10
|
- (B.npc_xhome << 10) != 0x2800
+ B.npc_xhome != 10
|
- (B.npc_xhome << 10) == 0x2c00
+ B.npc_xhome == 11
|
- (B.npc_xhome << 10) != 0x2c00
+ B.npc_xhome != 11
|
- (B.npc_xhome << 10) == 0x3000
+ B.npc_xhome == 12
|
- (B.npc_xhome << 10) != 0x3000
+ B.npc_xhome != 12
|
- (B.npc_xhome << 10) == 0x3400
+ B.npc_xhome == 13
|
- (B.npc_xhome << 10) != 0x3400
+ B.npc_xhome != 13
|
- (B.npc_xhome << 10) == 0x3800
+ B.npc_xhome == 14
|
- (B.npc_xhome << 10) != 0x3800
+ B.npc_xhome != 14
|
- (B.npc_xhome << 10) == 0x3c00
+ B.npc_xhome == 15
|
- (B.npc_xhome << 10) != 0x3c00
+ B.npc_xhome != 15
)

@compare_size_weight_animated_3_value@
expression B;
@@
(
- (B.animated << 3) == 0x0
+ B.animated == 0
|
- (B.animated << 3) != 0x0
+ B.animated != 0
|
- (B.animated << 3) == 0x8
+ B.animated == 1
|
- (B.animated << 3) != 0x8
+ B.animated != 1
)

@compare_size_weight_unit_weight_4_value@
expression B;
@@
(
- (B.unit_weight << 4) == 0x0
+ B.unit_weight == 0
|
- (B.unit_weight << 4) != 0x0
+ B.unit_weight != 0
|
- (B.unit_weight << 4) == 0x10
+ B.unit_weight == 1
|
- (B.unit_weight << 4) != 0x10
+ B.unit_weight != 1
|
- (B.unit_weight << 4) == 0x20
+ B.unit_weight == 2
|
- (B.unit_weight << 4) != 0x20
+ B.unit_weight != 2
|
- (B.unit_weight << 4) == 0x30
+ B.unit_weight == 3
|
- (B.unit_weight << 4) != 0x30
+ B.unit_weight != 3
|
- (B.unit_weight << 4) == 0x40
+ B.unit_weight == 4
|
- (B.unit_weight << 4) != 0x40
+ B.unit_weight != 4
|
- (B.unit_weight << 4) == 0x50
+ B.unit_weight == 5
|
- (B.unit_weight << 4) != 0x50
+ B.unit_weight != 5
|
- (B.unit_weight << 4) == 0x60
+ B.unit_weight == 6
|
- (B.unit_weight << 4) != 0x60
+ B.unit_weight != 6
|
- (B.unit_weight << 4) == 0x70
+ B.unit_weight == 7
|
- (B.unit_weight << 4) != 0x70
+ B.unit_weight != 7
|
- (B.unit_weight << 4) == 0x80
+ B.unit_weight == 8
|
- (B.unit_weight << 4) != 0x80
+ B.unit_weight != 8
|
- (B.unit_weight << 4) == 0x90
+ B.unit_weight == 9
|
- (B.unit_weight << 4) != 0x90
+ B.unit_weight != 9
|
- (B.unit_weight << 4) == 0xa0
+ B.unit_weight == 10
|
- (B.unit_weight << 4) != 0xa0
+ B.unit_weight != 10
|
- (B.unit_weight << 4) == 0xb0
+ B.unit_weight == 11
|
- (B.unit_weight << 4) != 0xb0
+ B.unit_weight != 11
|
- (B.unit_weight << 4) == 0xc0
+ B.unit_weight == 12
|
- (B.unit_weight << 4) != 0xc0
+ B.unit_weight != 12
|
- (B.unit_weight << 4) == 0xd0
+ B.unit_weight == 13
|
- (B.unit_weight << 4) != 0xd0
+ B.unit_weight != 13
|
- (B.unit_weight << 4) == 0xe0
+ B.unit_weight == 14
|
- (B.unit_weight << 4) != 0xe0
+ B.unit_weight != 14
|
- (B.unit_weight << 4) == 0xf0
+ B.unit_weight == 15
|
- (B.unit_weight << 4) != 0xf0
+ B.unit_weight != 15
)
