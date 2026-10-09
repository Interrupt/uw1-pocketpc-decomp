// UW1 packed object fields. Match only the proven player-object global;
// ushort pointers elsewhere also refer to tiles, links and unrelated buffers.
@object_id@
@@
- *g_player_object & 0x1ff
+ g_player_object->hdr.object_id

@tile_x@
typedef ushort;
@@
(
- g_player_object[0xb] >> 10
+ g_player_object->npc_xhome
|
- *(ushort *)((char *)g_player_object + 0x16) >> 10
+ g_player_object->npc_xhome
)

@tile_y@
typedef ushort;
@@
(
- (g_player_object[0xb] & 0x3f0) >> 4
+ g_player_object->npc_yhome
|
- (*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4
+ g_player_object->npc_yhome
)

@hp@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)g_player_object + 8)
+ g_player_object->npc_hp
|
- *(undefined1 *)((char *)g_player_object + 8)
+ g_player_object->npc_hp
)

@field_0@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x0) & 0x1ff
+ g_player_object->hdr.object_id
|
- g_player_object[0x0] & 0x1ff
+ g_player_object->hdr.object_id
|
- ((ushort *)g_player_object)[0x0] & 0x1ff
+ g_player_object->hdr.object_id
|
- *g_player_object & 0x1ff
+ g_player_object->hdr.object_id
|
- *(ushort *)g_player_object & 0x1ff
+ g_player_object->hdr.object_id
)

@field_1@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x2) & 0x7f
+ g_player_object->hdr.zpos
|
- g_player_object[0x1] & 0x7f
+ g_player_object->hdr.zpos
|
- ((ushort *)g_player_object)[0x1] & 0x7f
+ g_player_object->hdr.zpos
|
- *(byte *)((char *)g_player_object + 0x2) & 0x7f
+ g_player_object->hdr.zpos
|
- (byte)((ushort *)g_player_object)[0x1] & 0x7f
+ g_player_object->hdr.zpos
)

@field_2@
typedef ushort, byte;
@@
(
- (*(ushort *)((char *)g_player_object + 0x2) >> 7) & 0x7
+ g_player_object->hdr.heading
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0x380) >> 7
+ g_player_object->hdr.heading
|
- (g_player_object[0x1] >> 7) & 0x7
+ g_player_object->hdr.heading
|
- (g_player_object[0x1] & 0x380) >> 7
+ g_player_object->hdr.heading
|
- (((ushort *)g_player_object)[0x1] >> 7) & 0x7
+ g_player_object->hdr.heading
|
- (((ushort *)g_player_object)[0x1] & 0x380) >> 7
+ g_player_object->hdr.heading
)

@field_3@
typedef ushort, byte;
@@
(
- (*(byte *)((char *)g_player_object + 0x3) >> 2) & 0x7
+ g_player_object->hdr.ypos
|
- (*(byte *)((char *)g_player_object + 0x3) & 0x1c) >> 2
+ g_player_object->hdr.ypos
|
- (*(ushort *)((char *)g_player_object + 0x2) >> 10) & 0x7
+ g_player_object->hdr.ypos
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0x1c00) >> 10
+ g_player_object->hdr.ypos
|
- (g_player_object[0x1] >> 10) & 0x7
+ g_player_object->hdr.ypos
|
- (g_player_object[0x1] & 0x1c00) >> 10
+ g_player_object->hdr.ypos
|
- (((ushort *)g_player_object)[0x1] >> 10) & 0x7
+ g_player_object->hdr.ypos
|
- (((ushort *)g_player_object)[0x1] & 0x1c00) >> 10
+ g_player_object->hdr.ypos
)

@field_4@
typedef ushort, byte;
@@
(
- (*(byte *)((char *)g_player_object + 0x3) >> 5) & 0x7
+ g_player_object->hdr.xpos
|
- (*(byte *)((char *)g_player_object + 0x3) & 0xe0) >> 5
+ g_player_object->hdr.xpos
|
- *(byte *)((char *)g_player_object + 0x3) >> 5
+ g_player_object->hdr.xpos
|
- (*(ushort *)((char *)g_player_object + 0x2) >> 13) & 0x7
+ g_player_object->hdr.xpos
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0xe000) >> 13
+ g_player_object->hdr.xpos
|
- *(ushort *)((char *)g_player_object + 0x2) >> 13
+ g_player_object->hdr.xpos
|
- (g_player_object[0x1] >> 13) & 0x7
+ g_player_object->hdr.xpos
|
- (g_player_object[0x1] & 0xe000) >> 13
+ g_player_object->hdr.xpos
|
- g_player_object[0x1] >> 13
+ g_player_object->hdr.xpos
|
- (((ushort *)g_player_object)[0x1] >> 13) & 0x7
+ g_player_object->hdr.xpos
|
- (((ushort *)g_player_object)[0x1] & 0xe000) >> 13
+ g_player_object->hdr.xpos
|
- ((ushort *)g_player_object)[0x1] >> 13
+ g_player_object->hdr.xpos
)

@field_5@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x4) & 0x3f
+ g_player_object->hdr.quality
|
- g_player_object[0x2] & 0x3f
+ g_player_object->hdr.quality
|
- ((ushort *)g_player_object)[0x2] & 0x3f
+ g_player_object->hdr.quality
|
- *(byte *)((char *)g_player_object + 0x4) & 0x3f
+ g_player_object->hdr.quality
|
- (byte)((ushort *)g_player_object)[0x2] & 0x3f
+ g_player_object->hdr.quality
)

@field_6@
typedef ushort, byte;
@@
(
- (*(ushort *)((char *)g_player_object + 0x4) >> 6) & 0x3ff
+ g_player_object->hdr.next
|
- (*(ushort *)((char *)g_player_object + 0x4) & 0xffc0) >> 6
+ g_player_object->hdr.next
|
- *(ushort *)((char *)g_player_object + 0x4) >> 6
+ g_player_object->hdr.next
|
- (g_player_object[0x2] >> 6) & 0x3ff
+ g_player_object->hdr.next
|
- (g_player_object[0x2] & 0xffc0) >> 6
+ g_player_object->hdr.next
|
- g_player_object[0x2] >> 6
+ g_player_object->hdr.next
|
- (((ushort *)g_player_object)[0x2] >> 6) & 0x3ff
+ g_player_object->hdr.next
|
- (((ushort *)g_player_object)[0x2] & 0xffc0) >> 6
+ g_player_object->hdr.next
|
- ((ushort *)g_player_object)[0x2] >> 6
+ g_player_object->hdr.next
)

@field_7@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x6) & 0x3f
+ g_player_object->hdr.owner
|
- g_player_object[0x3] & 0x3f
+ g_player_object->hdr.owner
|
- ((ushort *)g_player_object)[0x3] & 0x3f
+ g_player_object->hdr.owner
|
- *(byte *)((char *)g_player_object + 0x6) & 0x3f
+ g_player_object->hdr.owner
|
- (byte)((ushort *)g_player_object)[0x3] & 0x3f
+ g_player_object->hdr.owner
)

@field_8@
typedef ushort, byte;
@@
(
- (*(ushort *)((char *)g_player_object + 0x6) >> 6) & 0x3ff
+ g_player_object->hdr.link
|
- (*(ushort *)((char *)g_player_object + 0x6) & 0xffc0) >> 6
+ g_player_object->hdr.link
|
- *(ushort *)((char *)g_player_object + 0x6) >> 6
+ g_player_object->hdr.link
|
- (g_player_object[0x3] >> 6) & 0x3ff
+ g_player_object->hdr.link
|
- (g_player_object[0x3] & 0xffc0) >> 6
+ g_player_object->hdr.link
|
- g_player_object[0x3] >> 6
+ g_player_object->hdr.link
|
- (((ushort *)g_player_object)[0x3] >> 6) & 0x3ff
+ g_player_object->hdr.link
|
- (((ushort *)g_player_object)[0x3] & 0xffc0) >> 6
+ g_player_object->hdr.link
|
- ((ushort *)g_player_object)[0x3] >> 6
+ g_player_object->hdr.link
)

@field_9@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0xb) & 0xf
+ g_player_object->npc_goal
|
- *(byte *)((char *)g_player_object + 0xb) & 0xf
+ g_player_object->npc_goal
|
- (byte)((ushort *)g_player_object)[0x5] & 0xf
+ g_player_object->npc_goal
)

@field_10@
typedef ushort, byte;
@@
(
- (*(ushort *)((char *)g_player_object + 0xb) >> 4) & 0xff
+ g_player_object->npc_gtarg
|
- (*(ushort *)((char *)g_player_object + 0xb) & 0xff0) >> 4
+ g_player_object->npc_gtarg
)

@field_11@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0xd) & 0xf
+ g_player_object->npc_level
|
- *(byte *)((char *)g_player_object + 0xd) & 0xf
+ g_player_object->npc_level
|
- (byte)((ushort *)g_player_object)[0x6] & 0xf
+ g_player_object->npc_level
)

@field_12@
typedef ushort, byte;
@@
(
- (*(byte *)((char *)g_player_object + 0xe) >> 5) & 0x1
+ g_player_object->npc_talkedto
|
- (*(byte *)((char *)g_player_object + 0xe) & 0x20) >> 5
+ g_player_object->npc_talkedto
|
- (*(ushort *)((char *)g_player_object + 0xd) >> 13) & 0x1
+ g_player_object->npc_talkedto
|
- (*(ushort *)((char *)g_player_object + 0xd) & 0x2000) >> 13
+ g_player_object->npc_talkedto
)

@field_13@
typedef ushort, byte;
@@
(
- (*(byte *)((char *)g_player_object + 0xe) >> 6) & 0x3
+ g_player_object->npc_attitude
|
- (*(byte *)((char *)g_player_object + 0xe) & 0xc0) >> 6
+ g_player_object->npc_attitude
|
- *(byte *)((char *)g_player_object + 0xe) >> 6
+ g_player_object->npc_attitude
|
- (*(ushort *)((char *)g_player_object + 0xd) >> 14) & 0x3
+ g_player_object->npc_attitude
|
- (*(ushort *)((char *)g_player_object + 0xd) & 0xc000) >> 14
+ g_player_object->npc_attitude
|
- *(ushort *)((char *)g_player_object + 0xd) >> 14
+ g_player_object->npc_attitude
)

@field_14@
typedef ushort, byte;
@@
(
- (*(ushort *)((char *)g_player_object + 0x16) >> 4) & 0x3f
+ g_player_object->npc_yhome
|
- (*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4
+ g_player_object->npc_yhome
|
- (g_player_object[0xb] >> 4) & 0x3f
+ g_player_object->npc_yhome
|
- (g_player_object[0xb] & 0x3f0) >> 4
+ g_player_object->npc_yhome
|
- (((ushort *)g_player_object)[0xb] >> 4) & 0x3f
+ g_player_object->npc_yhome
|
- (((ushort *)g_player_object)[0xb] & 0x3f0) >> 4
+ g_player_object->npc_yhome
)

@field_15@
typedef ushort, byte;
@@
(
- (*(byte *)((char *)g_player_object + 0x17) >> 2) & 0x3f
+ g_player_object->npc_xhome
|
- (*(byte *)((char *)g_player_object + 0x17) & 0xfc) >> 2
+ g_player_object->npc_xhome
|
- *(byte *)((char *)g_player_object + 0x17) >> 2
+ g_player_object->npc_xhome
|
- (*(ushort *)((char *)g_player_object + 0x16) >> 10) & 0x3f
+ g_player_object->npc_xhome
|
- (*(ushort *)((char *)g_player_object + 0x16) & 0xfc00) >> 10
+ g_player_object->npc_xhome
|
- *(ushort *)((char *)g_player_object + 0x16) >> 10
+ g_player_object->npc_xhome
|
- (g_player_object[0xb] >> 10) & 0x3f
+ g_player_object->npc_xhome
|
- (g_player_object[0xb] & 0xfc00) >> 10
+ g_player_object->npc_xhome
|
- g_player_object[0xb] >> 10
+ g_player_object->npc_xhome
|
- (((ushort *)g_player_object)[0xb] >> 10) & 0x3f
+ g_player_object->npc_xhome
|
- (((ushort *)g_player_object)[0xb] & 0xfc00) >> 10
+ g_player_object->npc_xhome
|
- ((ushort *)g_player_object)[0xb] >> 10
+ g_player_object->npc_xhome
)

@field_16@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x18) & 0x1f
+ g_player_object->npc_heading
|
- g_player_object[0xc] & 0x1f
+ g_player_object->npc_heading
|
- ((ushort *)g_player_object)[0xc] & 0x1f
+ g_player_object->npc_heading
|
- *(byte *)((char *)g_player_object + 0x18) & 0x1f
+ g_player_object->npc_heading
|
- (byte)((ushort *)g_player_object)[0xc] & 0x1f
+ g_player_object->npc_heading
)

@byte_store_8@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x8) = value;
+ g_player_object->npc_hp = (byte)value;

@byte_field_8@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x8)
+ g_player_object->npc_hp
|
- *(undefined1 *)((char *)g_player_object + 0x8)
+ g_player_object->npc_hp
|
- ((byte *)g_player_object)[0x8]
+ g_player_object->npc_hp
|
- (byte)((ushort *)g_player_object)[0x4]
+ g_player_object->npc_hp
)

@signed_byte_8@
@@
- *(char *)((char *)g_player_object + 0x8)
+ (char)g_player_object->npc_hp

@byte_store_9@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x9) = value;
+ g_player_object->full_heading = (byte)value;

@byte_field_9@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x9)
+ g_player_object->full_heading
|
- *(undefined1 *)((char *)g_player_object + 0x9)
+ g_player_object->full_heading
|
- ((byte *)g_player_object)[0x9]
+ g_player_object->full_heading
)

@signed_byte_9@
@@
- *(char *)((char *)g_player_object + 0x9)
+ (char)g_player_object->full_heading

@byte_store_10@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0xa) = value;
+ g_player_object->movement_flags = (byte)value;

@byte_field_10@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0xa)
+ g_player_object->movement_flags
|
- *(undefined1 *)((char *)g_player_object + 0xa)
+ g_player_object->movement_flags
|
- ((byte *)g_player_object)[0xa]
+ g_player_object->movement_flags
|
- (byte)((ushort *)g_player_object)[0x5]
+ g_player_object->movement_flags
)

@signed_byte_10@
@@
- *(char *)((char *)g_player_object + 0xa)
+ (char)g_player_object->movement_flags

@byte_store_17@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x11) = value;
+ g_player_object->recent_damage = (byte)value;

@byte_field_17@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x11)
+ g_player_object->recent_damage
|
- *(undefined1 *)((char *)g_player_object + 0x11)
+ g_player_object->recent_damage
|
- ((byte *)g_player_object)[0x11]
+ g_player_object->recent_damage
)

@signed_byte_17@
@@
- *(char *)((char *)g_player_object + 0x11)
+ (char)g_player_object->recent_damage

@byte_store_18@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x12) = value;
+ g_player_object->damage_source = (byte)value;

@byte_field_18@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x12)
+ g_player_object->damage_source
|
- *(undefined1 *)((char *)g_player_object + 0x12)
+ g_player_object->damage_source
|
- ((byte *)g_player_object)[0x12]
+ g_player_object->damage_source
|
- (byte)((ushort *)g_player_object)[0x9]
+ g_player_object->damage_source
)

@signed_byte_18@
@@
- *(char *)((char *)g_player_object + 0x12)
+ (char)g_player_object->damage_source

@byte_store_19@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x13) = value;
+ g_player_object->motion_flags = (byte)value;

@byte_field_19@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x13)
+ g_player_object->motion_flags
|
- *(undefined1 *)((char *)g_player_object + 0x13)
+ g_player_object->motion_flags
|
- ((byte *)g_player_object)[0x13]
+ g_player_object->motion_flags
)

@signed_byte_19@
@@
- *(char *)((char *)g_player_object + 0x13)
+ (char)g_player_object->motion_flags

@byte_store_20@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x14) = value;
+ g_player_object->attack_pitch = (byte)value;

@byte_field_20@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x14)
+ g_player_object->attack_pitch
|
- *(undefined1 *)((char *)g_player_object + 0x14)
+ g_player_object->attack_pitch
|
- ((byte *)g_player_object)[0x14]
+ g_player_object->attack_pitch
|
- (byte)((ushort *)g_player_object)[0xa]
+ g_player_object->attack_pitch
)

@signed_byte_20@
@@
- *(char *)((char *)g_player_object + 0x14)
+ (char)g_player_object->attack_pitch

@byte_store_21@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x15) = value;
+ g_player_object->animation_flags = (byte)value;

@byte_field_21@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x15)
+ g_player_object->animation_flags
|
- *(undefined1 *)((char *)g_player_object + 0x15)
+ g_player_object->animation_flags
|
- ((byte *)g_player_object)[0x15]
+ g_player_object->animation_flags
)

@signed_byte_21@
@@
- *(char *)((char *)g_player_object + 0x15)
+ (char)g_player_object->animation_flags

@byte_store_24@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x18) = value;
+ g_player_object->heading_flags = (byte)value;

@byte_field_24@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x18)
+ g_player_object->heading_flags
|
- *(undefined1 *)((char *)g_player_object + 0x18)
+ g_player_object->heading_flags
|
- ((byte *)g_player_object)[0x18]
+ g_player_object->heading_flags
|
- (byte)((ushort *)g_player_object)[0xc]
+ g_player_object->heading_flags
)

@signed_byte_24@
@@
- *(char *)((char *)g_player_object + 0x18)
+ (char)g_player_object->heading_flags

@byte_store_25@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x19) = value;
+ g_player_object->npc_ai_flags = (byte)value;

@byte_field_25@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x19)
+ g_player_object->npc_ai_flags
|
- *(undefined1 *)((char *)g_player_object + 0x19)
+ g_player_object->npc_ai_flags
|
- ((byte *)g_player_object)[0x19]
+ g_player_object->npc_ai_flags
)

@signed_byte_25@
@@
- *(char *)((char *)g_player_object + 0x19)
+ (char)g_player_object->npc_ai_flags

@byte_store_26@
expression value;
typedef byte;
@@
- *(char *)((char *)g_player_object + 0x1a) = value;
+ g_player_object->npc_whoami = (byte)value;

@byte_field_26@
typedef byte, undefined1, ushort;
@@
(
- *(byte *)((char *)g_player_object + 0x1a)
+ g_player_object->npc_whoami
|
- *(undefined1 *)((char *)g_player_object + 0x1a)
+ g_player_object->npc_whoami
|
- ((byte *)g_player_object)[0x1a]
+ g_player_object->npc_whoami
|
- (byte)((ushort *)g_player_object)[0xd]
+ g_player_object->npc_whoami
)

@signed_byte_26@
@@
- *(char *)((char *)g_player_object + 0x1a)
+ (char)g_player_object->npc_whoami

@word_field_0@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags
|
- *(ushort *)((byte *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags
|
- ((ushort *)g_player_object)[0x0]
+ g_player_object->hdr.type_flags
|
- *(ushort *)g_player_object
+ g_player_object->hdr.type_flags
)

@word_field_2@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x2)
+ g_player_object->hdr.position_word
|
- *(ushort *)((byte *)g_player_object + 0x2)
+ g_player_object->hdr.position_word
|
- ((ushort *)g_player_object)[0x1]
+ g_player_object->hdr.position_word
)

@word_field_4@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word
|
- *(ushort *)((byte *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word
|
- ((ushort *)g_player_object)[0x2]
+ g_player_object->hdr.chain_word
)

@word_field_6@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x6)
+ g_player_object->hdr.link_word
|
- *(ushort *)((byte *)g_player_object + 0x6)
+ g_player_object->hdr.link_word
|
- ((ushort *)g_player_object)[0x3]
+ g_player_object->hdr.link_word
)

@word_field_11@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0xb)
+ g_player_object->goal_word
|
- *(ushort *)((byte *)g_player_object + 0xb)
+ g_player_object->goal_word
)

@word_field_13@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0xd)
+ g_player_object->status_word
|
- *(ushort *)((byte *)g_player_object + 0xd)
+ g_player_object->status_word
)

@word_field_15@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0xf)
+ g_player_object->target_word
|
- *(ushort *)((byte *)g_player_object + 0xf)
+ g_player_object->target_word
)

@word_field_22@
typedef ushort, byte;
@@
(
- *(ushort *)((char *)g_player_object + 0x16)
+ g_player_object->tile_word
|
- *(ushort *)((byte *)g_player_object + 0x16)
+ g_player_object->tile_word
|
- ((ushort *)g_player_object)[0xb]
+ g_player_object->tile_word
)
