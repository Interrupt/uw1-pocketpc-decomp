// UW1 packed object fields. Match only the proven player-object global;
// ushort pointers elsewhere also refer to tiles, links and unrelated buffers.
@item_id@
@@
- *g_player_object & 0x1ff
+ g_player_object->hdr.item_id

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
