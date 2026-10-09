// Temporary byte/word boundaries for accesses not yet converted to fields.
// Keep arithmetic in its original units while the global gains a real type.
@word_index@
expression index;
typedef ushort;
@@
- g_player_object[index]
+ ((ushort *)g_player_object)[index]

@whole_word@
typedef ushort;
@@
- *g_player_object
+ *(ushort *)g_player_object

@word_offset@
expression offset;
typedef ushort;
@@
- g_player_object + offset
+ ((ushort *)g_player_object) + offset
