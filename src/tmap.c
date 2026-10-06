/* The dungeon tile map: the tile-record lookup accessor, the per-frame
 * visible-tile walk/collection, per-tile wall/floor/object emission,
 * and the final visible-tile-list rasterization pass. Split out of
 * uw.c (the original monolithic decompile) once these functions' real
 * roles were confirmed.
 */
#include "headers/tmap.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* Sizing-audit pass: investigated, NOT shrunk -- per the overflow-
   guard comment a few hundred lines down (0x4814 record region base,
   ~490-record cap, 0x60-byte stride), real worst case is
   0x4814+490*0x60=65492 bytes=16373 elements -- already a near-exact
   match for the current 16384, not oversized. (An initial pass at
   this arithmetic mistakenly computed 47852 bytes; rechecked by hand
   here.) Left as-is. */
 undefined4 DAT_000a85d0_backing[16384];
/* Set (0-359) by emit_tile_objects's class-2 TMOBJ/sign branch right
   before jumping into the shared class-0 mesh-quad code, to make a
   wall-mounted decal extend along the WALL's own fixed facing angle
   instead of the camera's (DAT_000db44c, "yaw... from the player
   object" per its own comment a few thousand lines down) -- see the
   quad-build code's own comment for why. -1 = no override (normal
   camera-facing item billboard, the class-0 default). Self-clearing:
   read and reset back to -1 the moment it's consumed, since
   DAT_000db44c is a real per-FRAME camera value shared by every object
   processed after this one -- an override left set would face every
   later billboard this frame the wrong way. */
static int g_billboard_angle_override_deg = -1;
/* UW_MODEL_TUNER=1's "hide_walls" toggle (debug panel, dbgui_field_toggle)
   -- lets wall/floor tile geometry be filtered out of the render so a
   single object's own faces (a decal, a boulder) can be inspected via
   UW_DEBUG_RASTER/the dump_3d_frame face-dump tool without unrelated
   wall polygons cluttering the trace (several of them coincidentally
   share texture ids with the object being investigated, confirmed
   while chasing the TMAP-decal backface report -- filtering by texture
   id alone doesn't isolate one object's own draws). Checked at the two
   "commit this wall quad" sites in process_visible_tile_cell (each already
   writes the quad's geometry/texptr into the current arena slot, THEN
   advances DAT_0023b83c/DAT_0023b838 to make it visible to the renderer)
   -- when set, the advance is skipped, so the wall's just-written data is
   silently overwritten by whatever gets emitted into that same slot next
   (the next wall, or the tile's own floor/object via emit_tile_features)
   instead of ever reaching render_visible_tile_list. Floor and objects are
   untouched -- only process_visible_tile_cell's own wall-quad commits
   check this flag. */
int g_uw_hide_walls = 0;
/* Recovered from UU.exe .data at 0x8462c: the 3D viewport clip rect
   {x0=0x34, y0=0x13, w=0xe0, h=0x84} == {52, 19, 224, 132}, matching
   render_dungeon_view's `rect_fill(0x34,0x13,0xe0,0x83)`. render_visible_tile_
   list copies these into a local passed to raster_triangle as param_8;
   raster_triangle only calls the span rasterizer raster_textured_span inside
   `while (param_8[0] != 0 && ...)`. All zero -> that loop never ran ->
   no pixel ever drawn even with the geometry projecting into view. */
static undefined4 DAT_0008462c = 0x34;
static undefined4 DAT_00084634 = 0xe0;
static undefined4 DAT_00084630 = 0x13;
static undefined4 DAT_00084638 = 0x84;
/* Recovered from UU.exe .data at 0x84610: the perspective/screen scale,
   integer 100. render_visible_tile_list does ordfloat_int_to_float2(DAT_00084610)
   (int->float) -> 100.0, then multiplies each vertex's 1/z * eye-space
   coord by it to get the screen offset from the viewport centre. Was
   silently zero -> that offset was always 0, so every tile triangle
   projected to the single centre point (x=140, y=80). */
static undefined4 DAT_00084610 = 100u;
/* Sizing-audit pass: wall-texture property table. Loader fills only
   48 entries, but every read site masks the index with `&0x3f`
   (0-63) -- the wider read-side mask governs. HARD: 64 elements
   (128 bytes). Down from 8192. */
 undefined2 DAT_0023add0_backing[64];
/* Sizing-audit pass: floor-texture property table. Loader fills only
   10 entries, but every read site masks the index with `&0xf`
   (0-15) -- the wider read-side mask governs. HARD: 16 elements
   (32 bytes). Down from 8192. */
 undefined2 DAT_0023ae40_backing[16];
/* Was a lone `undefined4` (zero-initialized), but confirmed via a raw
   Ghidra memory read of the real UU.exe's .data section that this
   address's real static initial value is 1, not 0 -- same "silently-
   zero global instead of its real nonzero .data bytes" bug class fixed
   repeatedly this session. process_visible_tile_cell gates its main
   (bit-0x80-SET) automap-reveal write on this flag being nonzero;
   with it wrongly defaulting to 0, a genuinely fresh character (never
   having gone through load_game_from_slot or the death/return-to-menu
   path, the only two real writers-of-1 -- confirmed via a Ghidra xref
   dump, no third caller exists) got NO automap reveal at all through
   that path for its entire first dungeon visit. This had been masked
   until now by process_visible_tile_cell's bit-0x80-CLEAR fallback
   revealing everything unconditionally (the over-reveal bug fixed
   just above in this same function) -- confirmed live via a recorded
   repro (bug-fresh-map.txt): with only the over-reveal fix applied,
   a fresh character's automap came back completely blank instead of
   correctly showing the small area actually explored. */
undefined4 DAT_00086b20 = 1;
byte * DAT_0023b814;
/* SPLIT SYMBOL. In the 32-bit original, DAT_0023b4f4 was the head of a
   memory region: bytes 0..3 a function pointer (a tile-geometry emitter,
   selected in walk_visible_tiles / emit_hud_draw_commands, called at
   process_visible_tile_cell), and from byte 4 on a short[] of per-pick-
   slot tile offsets, indexed `slot*2 + 2` (slot 1 -> byte 4) by the
   object-pick ID assignment (emit_tile_objects) and read back by pick_object_under_cursor.
   On a 64-bit host the pointer is 8 bytes, so those short writes landed
   *inside* the pointer and corrupted it -> wild call in
   process_visible_tile_cell the moment pick IDs were being assigned
   (i.e. as soon as the pick re-render ran). Give the offset table its own
   backing store; keep the exact `v*2 + 2` index math at both use sites. */
code *DAT_0023b4f4;
short g_pick_tile_off_backing[0x200];
/* Sizing pass: indexed by the same DAT_0023b830 cursor as
   g_pick_tile_off_backing right above (interact.c:1032, tmap.c:2393),
   a 2-byte stride -- sized to match that sibling's own real extent
   (0x200 elements * 2 bytes = 1024 bytes), down from 65536. */
undefined1 DAT_0023b676_backing[1024];
int DAT_0023b83c;
/* Were int / undefined4, truncating the real &DAT_002049e0-relative
   pointers this loader (FUN_00042174 area) computes into them:
     ae38 = &DAT_002049e0
     ae34 = ae38 + DAT_0023adb0*0x1000   (10 x 0x400 shade tables at +0x30..)
     ae3c = ae34 + DAT_0023aeb8*0x400
     ae30 = ae3c + n*0x100               (10 x 0x100 colour-light tables at +0x6a..)
   get_texture_page returns *one* of these + index*stride; its callers cast
   the result to (byte*) and dereference it -> wild pointer + crash the
   moment the (now-live) 3D geometry path calls it. */
char *DAT_0023ae38;
char *DAT_0023ae3c;
undefined2 DAT_00202734;
byte DAT_0023b4a0;
char *DAT_0023aecc;
short DAT_0025063c;
short DAT_002506dc;
short DAT_0025064c;
/* Recovered from UU.exe .data at 0x86a00 (0x60 bytes). Was FOUR separate
   silently-zero 64KB Ghidra backing arrays (DAT_00086a00/a02/a18/a20),
   which also broke the relative addressing the code relies on -- e.g.
   `*(short *)(&DAT_00086a00 + dir*6)` and `*(short *)(&DAT_00086a02 +
   dir*6)` are meant to read the same table two bytes apart. Unified into
   one region with the real bytes; the four symbols are offsets into it.

     +0x00  per-facing tile-record stride pairs, indexed [dir*6] (via
            &DAT_00086a00) and [dir*6] (via &DAT_00086a02, = +0x02):
              dir 0..3  a00 = {+1, -64, -1, +64}
                        a02 = {+64, +1, -64, -1}
            i.e. the 90-degree rotation basis (tile index = x + y*64) that
            walk_visible_tiles's automap reveal walk and the 3D tile-neighbour
            sampling (FUN_0005bd9c &c, uw.c ~44695-44982) step tiles by.
            All zero before this -> the reveal walk never advanced
            (teleport+REVEAL only marked the player's own tile) and the
            view geometry kept sampling one tile.
     +0x18  four facing angles {0x0000, 0x4000, 0x8000, 0xc000}, [dir*2].
     +0x20  four 10-entry tile-shape rotation remaps, one row (stride
            0x10) per facing: identity, then the diagonal/slope types
            (2-9) permuted for each 90-degree view rotation.
     +0x60  DAT_00086a60: the tile-shape -> visibility-edge-flags table
            compute_visibility_ray_offset indexes as [shape*7 + sVar9] (shape
            0..9, sVar9 0..~8; 80 bytes). This was a lone silently-zero
            `undefined` scalar, so compute_visibility_ray_offset's bVar6 came
            out 0 for every cell -> it wrote 0 (never the 0x80 "visible"
            bit) into the g_visibility_ring_buffer output grid -> process_reaction_
            queue marked NO tile visible -> empty 3D tile list (black
            viewport) and only the un-gated automap reveal worked. */
 const undefined1 DAT_00086a00_region[0xb0] = {
  0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff, 0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff,
  0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff, 0x00,0x00,0x00,0x40,0x00,0x80,0x00,0xc0,
  0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07, 0x08,0x09,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x04,0x02,0x05,0x03,0x09,0x08, 0x06,0x07,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x05,0x04,0x03,0x02,0x07,0x06, 0x09,0x08,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x03,0x05,0x02,0x04,0x08,0x09, 0x07,0x06,0x00,0x00,0x00,0x00,0x00,0x00,
  /* +0x60  DAT_00086a60 */
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xb8, 0x98,0xb0,0x98,0xb0,0x98,0xb0,0xe4,0xc4,
  0xe4,0xc4,0xe0,0xc4,0xe4,0xcd,0xcd,0xc5, 0xc9,0xc5,0xcd,0xc5,0xd6,0xd2,0x00,0xd6,
  0x00,0xd6,0x00,0xd7,0x00,0xd3,0x00,0xd7, 0x00,0xd7,0xbc,0x9c,0xb4,0x9c,0xb4,0x9c,
  0xb4,0xbd,0x9d,0xb5,0x9d,0xb5,0x9d,0xb5, 0xbe,0x9e,0xb6,0x9e,0xb6,0x9e,0xb6,0xbf,
  0x9f,0xb7,0x9f,0xb7,0x9f,0xb7,0x00,0x00, 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
};
short DAT_0023b810;
undefined4 DAT_0023b804;
undefined2 DAT_00086b30;
code *DAT_0023b80c;
code *DAT_0023b4d4;
ushort DAT_00189580;
/* Recovered from UU.exe .data: 0x86b50 .. 0x86bef (0xa0 bytes). A dense
   cluster of small per-view-orientation / per-tile-shape byte tables
   that process_visible_tile_cell reads while building a tile's vertex
   set for the 3D view. Ghidra had scattered it across ~15 lone
   `undefined`/`undefined1` scalars (DAT_00086b50, b52, b84, b88,
   bb0..bb5, bc8..bcd) PLUS a dozen bare-literal `iVar + 0x86bXX`
   dereferences -- all reading zero / wild. Unified into one region with
   the real bytes; the scalars and literals now index into it.
     +0x00 (b50) view-basis shorts, [facing*4] (walk_visible_tiles)
     +0x10 (b60) 4x4 per-facing something
     +0x20 (b70) vertex/height offset base, indexed via b84/b88 + n*4
     +0x40 (b90) 6x5 per-(facing,slot) offsets
     +0x60 (bb0) 6-entry group used by the billboard-vertex ordfloat_int_to_float2 calls
     +0x78 (bc8) 6-entry group for the diagonal-tile path
     +0x90 (be0) 3x4 cull-plane normal components (be0/be1/be2) */
 const undefined1 DAT_00086b50_region[0xa0] = {
  0x01,0x00,0x40,0x00,0xc0,0xff,0x01,0x00, 0xff,0xff,0xc0,0xff,0x40,0x00,0xff,0xff,
  0x00,0x01,0x03,0x02,0x02,0x00,0x01,0x03, 0x03,0x02,0x00,0x01,0x01,0x03,0x02,0x00,
  0x00,0x00,0x01,0x01,0x01,0x01,0x00,0x00, 0x00,0x01,0x00,0x01,0x01,0x00,0x01,0x00,
  0x00,0x00,0x00,0x00,0x02,0x00,0x01,0x00, 0x00,0x01,0x03,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x01,0x00,0x00,0x01,0x00,0x00, 0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,
  0x01,0x00,0x01,0x00,0x00,0x01,0x01,0x01, 0x00,0x01,0x01,0x01,0x00,0x00,0x00,0x00,
  0x01,0x01,0x03,0x01,0x00,0x01,0x00,0x01, 0x02,0x01,0x01,0x03,0x00,0x00,0x00,0x00,
  0x01,0x02,0x00,0x00,0x00,0x00,0x00,0x00, 0x00,0x00,0x01,0x01,0x01,0xff,0x00,0x01,
  0x01,0x00,0xff,0xff,0x01,0x00,0x00,0x01, 0x01,0x01,0x01,0x01,0x00,0x00,0xff,0x01,
  0x00,0x04,0xff,0x00,0x04,0x01,0xff,0x04, 0x00,0x01,0x04,0x00,0x00,0x00,0x00,0x00,
};
/* Sizing-audit pass: process_visible_tile_cell's own loop is
   `} while (local_54 < 3);` -- max index 2, matching the real
   recovered content (0,1,2; the rest was always just padding).
   HARD. Down from 8. */
static const undefined1 DAT_00086c00_arr[3] = { 0x00,0x01,0x02 };
#define DAT_00086c00 (*(const undefined1 *)DAT_00086c00_arr)
undefined2 DAT_0023bc8c;
undefined2 DAT_0023b8c0;
byte *DAT_0023b4ec;
/* Was a lone `undefined` scalar; walk_visible_tiles/process_visible_tile_cell index it as
   `(&DAT_00086bf0)[tile_type_nibble]`. Real bytes recovered from
   UU.exe's .data at 0x86bf0 (confirmed 3 ways: reference search,
   literal-pool value, disassembly of the `ldrb r2,[r2,r0]` read):
   0a 0b 0c 0d 0e 0f 0b 0b 0b 0b 0a 0b 0c 0d 0e 0f.

   NOTE: this table is now essentially unused. It turned out NOT to be
   the real automap reveal-byte source -- the two ring-walk write sites
   (walk_visible_tiles / process_visible_tile_cell) were changed to compute the reveal byte
   the way process_visible_tile_cell's bit-0x80-SET branch always did:
     `DAT_0023ae40[floor-texture index] low byte  |  tile shape nibble`
   where DAT_0023ae40 is the per-level floor-texture property table
   (loaded from the .ark). Water floors read 0x10 there -> reveal-byte
   bit 4 set -> blue fill; every other floor reads 0 -> grey "explored"
   shading. That's what makes ONLY water render blue (an all-`0x10|type`
   reconstruction of THIS table made every floor blue, which was wrong).

   Kept here as the raw recovered bytes; it's only hit now via a
   `local_84 == 0` fallback in dead (bit-0x80-SET) code. */
 const unsigned char DAT_00086bf0_real_table[16] = {
  0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x0b, 0x0b,
  0x0b, 0x0b, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
};
undefined1 DAT_0023b818;
char *DAT_0023b4f0;
static char *DAT_0023b808;  /* was `undefined4` (4 bytes) -- would truncate the
                        real `void *` tilemap_lookup returns; currently a
                        write-only global (no reader elsewhere in this
                        file), so not a live bug, but fixed for safety */
undefined4 DAT_0023b838;
short DAT_0023b4e8;
short DAT_0023b4e4;
undefined1 *DAT_0023b820;
ushort DAT_0023b828;
undefined2 DAT_0023b824;
/* Was silently zero -- compared against the literal `'d'` at all 4
   call sites in this file. Confirmed via a Ghidra memory dump of the
   real UU.exe that its actual byte value is 0x64 ('d'), not zero; no
   writer anywhere in this decompile, so every `DAT_00087938 != 'd'`
   check was permanently true regardless of real game state. */
char DAT_00087938 = 'd';
short DAT_00086b24;
ushort DAT_0023b81c;
ushort DAT_0023b4d8;
static undefined2 DAT_0023b4d0;
byte DAT_0023b4e0;
char DAT_0023b834;
/* DAT_00086b84/b88/bb0..bb5/bc8..bcd/c00 -> DAT_00086b50_region /
   DAT_00086c00_arr, #define'd above. */
static short DAT_0023b8c4;
ushort DAT_0023b904;
ushort DAT_0023b920;
ushort DAT_0023b91c;
byte DAT_0023bc88;
/* .data 0x86c80: real TMOBJ sign-variant -> frame-index table, 32
   ushort entries, recovered directly from UU.exe (same contiguous
   dump as DAT_00086c08 above -- see its own comment). CORRECTED: an
   earlier investigation this project concluded this table's content
   was "genuinely lost -- not present anywhere in this binary or its
   data files" and hand-picked a single fallback frame (668, TMOBJ.GR's
   own "message/plaque" entry 25) for every sign variant instead. That
   conclusion was wrong the same way g_inventory_hotspot_table's own
   "doesn't map cleanly" conclusion was wrong -- nobody had actually
   dumped these bytes. Real values (index -> raw table value; -1/0xffff
   marks "no sign here", matching the existing `< 0 -> return` bail-out
   this table's own reader already had): 0->3, 1->8, 2->8, 3->7, 4->7,
   5->6, 6->5, 7->11, 8->24, 9->9, 10->23, 11->27, 12->28, 13->25,
   14->26, 15->4, 16->10, 17->16, 18->17, 19->-1, 20->2, 21->19,
   22->18, 23-31->-1. All non-sentinel values fall inside 0-28 -- see
   the fix at this table's own reader (search "DAT_00202734") for why
   these are relative offsets into TMOBJ's own frame range, not
   standalone absolute frame numbers, and the addition that was
   missing to use them correctly. */
static unsigned short DAT_00086c80_backing[32] = {
  3,8,8,7,7,6,5,11,24,9,23,27,28,25,26,4,
  10,16,17,0xffff,2,19,18,0xffff,0xffff,0xffff,0xffff,0xffff,0xffff,0xffff,0xffff,0xffff,
};
#define DAT_00086c80 (*(unsigned char *)&DAT_00086c80_backing[0])
/* .data 0x86cc0: real 32-step -> 8-octant angle-quantization table,
   recovered in the same dump as DAT_00086c08/DAT_00086c80 above.
   CORRECTED: was hand-reconstructed as a uniform "4 consecutive steps
   per octant" identity quantization after an earlier investigation
   concluded (same wrong "lost" framing as the other two tables here)
   that the real content was unrecoverable. The real table is NOT a
   uniform quantization -- bucket sizes are 3,3,5,3,5,3,5,3 (octants
   0-7), not 4 each. */
static const unsigned char DAT_00086cc0_arr[32] = {
  0,0,0,1,1,1,2,2, 2,2,2,3,3,3,4,4,
  4,4,4,5,5,5,6,6, 6,6,6,7,7,7,0,0,
};
#define DAT_00086cc0 (DAT_00086cc0_arr[0])
/* Sizing pass: every access to this array is bounded to 0x12 (18)
   bytes (the ce_memmove/ce_memset sites just below, and the plain
   scalar DAT_0023b908 read/write) -- was oversized at 8192 elements
   (16384 bytes) for an 18-byte need. Its sibling DAT_0023b928_backing
   just below is NOT touched here: unlike this array, it's written at
   a dynamic self-relative offset elsewhere in this file and needs its
   own separate, more careful review before any resize. */
static undefined2 DAT_0023b908_backing[32];
#define DAT_0023b908 DAT_0023b908_backing[0]
/* Sizing-audit pass: the "separate, more careful review" flagged
   above is done. update_wall_partition_phase's dynamic write
   (`ce_memmove(&DAT_0023b928 + uVar2 + 1, &DAT_0023b90a, ...)`) is
   clamped so `uVar2 + uVar1 <= 8` (the function's own "8-entry
   window" cap), so max index touched is 8 (9 elements). This also
   matches the literal `ce_memmove(&DAT_0023b908,&DAT_0023b928,0x12)`
   copy between the two siblings -- same exact 18-byte real bound as
   DAT_0023b908. Sized to 32 elements (64 bytes) to match; down from
   8192. */
static undefined2 DAT_0023b928_backing[32];
#define DAT_0023b928 DAT_0023b928_backing[0]
char DAT_0023bb94;
/* Sizing-audit pass: only read as a memmove source
   (`ce_memmove(&DAT_0023b928+uVar2+1,&DAT_0023b90a,(uVar1&0xffff)<<1)`)
   with uVar1 capped at 8 (same 8-entry window cap as DAT_0023b928) --
   max byte count 8*2=16 bytes. Sized to 32 for headroom; down from
   8192. */
static undefined DAT_0023b90a_backing[32];
#define DAT_0023b90a DAT_0023b90a_backing[0]
/* Sizing pass: `ce_memset(&DAT_0023b940,0,0x252)` -- 594 bytes exact. */
static undefined1 DAT_0023b940_backing[1024];
#define DAT_0023b940 DAT_0023b940_backing[0]
/* Object/feature-draw sort scratch (emit_tile_features and helpers sort_feature_pairs_by_depth/
   ec8/508c/5128/65210/652e8, ~uw.c:49340-49766). Ghidra split each of
   these into a lone scalar, but the code indexes them as arrays:
   - DAT_0023b848[i]            u16, object slot ids,  i in 0..8
   - DAT_0023b8c8[i]/[i+1]      bytes, adjacent-swap sort order (b8c9 == b8c8[1])
   - DAT_0023bb98[i*4 + 0/1/2]  bytes, per-object billboard X/Y/Z offsets
                                (bb99 == bb98[1], bb9a == bb98[2]), i in 0..0x3b
   Recompiled as separate scalars the indexed writes and reads land on
   different memory (NULL slot deref crash). Back them with real arrays;
   all uses are confined to that function span, no external refs. */
/* Sizing-audit pass: DAT_0023b848[i] real extent is i in 0..8 (9
   u16 elements, 18 bytes) per the comment above. Sized to 32 elements
   (64 bytes) for headroom; down from 64. */
 undefined2 DAT_0023b848_backing[32];
/* Sizing-audit pass: DAT_0023b8c8[i]/[i+1] real extent is i in 0..8
   too (same object count, max i+1=9, 10 bytes). Sized to 32 for
   headroom; down from 128. */
 undefined1 DAT_0023b8c8_backing[32];
/* Sizing-audit pass: DAT_0023bb98[i*4+0/1/2] real extent is i in
   0..0x3b (per the comment above), max byte 59*4+2=238. Sized to
   256 for headroom; down from 512. */
 undefined1 DAT_0023bb98_backing[256];
/* Recovered from UU.exe .data at 0x86d68 (64 bytes = 32 int16). Per-view-
   facing corner-index remap for a rotating quad: resolve_billboard_corner_offset reads
   `(&DAT_00086d68)[idx*2]` (low byte) and `(&DAT_00086d69)[idx*2]` (high
   byte) with idx = (corner>>5) + facing*8. Were lone zero scalars. */
static const undefined1 DAT_00086d68_region[64] = {
  0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00, 0x04,0x00,0x05,0x00,0x06,0x00,0x07,0x00,
  0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x03, 0x00,0x04,0x00,0x05,0x00,0x06,0x00,0x07,
  0x07,0x00,0x06,0x00,0x05,0x00,0x04,0x00, 0x03,0x00,0x02,0x00,0x01,0x00,0x00,0x00,
  0x00,0x07,0x00,0x06,0x00,0x05,0x00,0x04, 0x00,0x03,0x00,0x02,0x00,0x01,0x00,0x00,
};
#define DAT_00086d68 (*(const undefined1 *)DAT_00086d68_region)
#define DAT_00086d69 (*(const undefined1 *)(DAT_00086d68_region + 1))
/* Was a lone `undefined` (1-byte) scalar -- but emit_tile_features
   indexes it as a per-tile array of 18-byte (0x12) "feature count +
   up to 8 feature ids" records (`&DAT_0023b92e + DAT_0023b4e4*0x12`,
   DAT_0023b4e4 ranging up to 0x20), same "split symbol" bug class as
   its two siblings DAT_0023b928/DAT_0023b940 a few lines above, which
   already got real backing arrays in an earlier round -- this one was
   simply missed. Confirmed live via an lldb watchpoint: emit_tile_features's
   own record-count overflow guard (`if (8 < *puVar6) skip`) still lets
   a write at index 9 through when count reaches 8, one past this
   record's real 9-ushort span (0x12 bytes = 9 ushorts, valid indices
   0-8) -- with the real original binary's per-tile stride this only
   ever spills into the START of the NEXT tile's own record, harmless,
   but with this variable's own 1-byte declaration EVERY record after
   the first was already out of bounds, so this single-byte overflow
   became a wild write landing squarely on grtile_alloc_registered's
   own DAT_0023c3fc (an unrelated, ordinarily 5440-byte-safe pointer
   table used by capture_framebuffer_rect_to_grtile/restore_captured_grtile_backdrop),
   observed corrupting it one ushort at a time across repeated calls
   until it held the exact non-pointer bit pattern (0x10f010f010f010f0)
   that then crashed restore_captured_grtile_backdrop's own linear scan of that table --
   the intermittent (ASLR-dependent, since it depends on this build's
   own relative global layout) HUD-compositor crash long tracked as a
   separate, pre-existing, unsolved issue. Widened to match its
   siblings' oversized-safety convention. */
static undefined1 g_tile_feature_records_b92e_backing[65536];
#define DAT_0023b92e g_tile_feature_records_b92e_backing[0]






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00020370
void render_visible_tile_list()

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  int *piVar14;
  int iVar15;
  int iVar16;
  int iVar17;
  void **local_98; // was `undefined4 *`, misaligning the DAT_000c4838 pointer-array walk below now that its elements are real 8-byte pointers
  int local_94;
  /* Ghidra named the 4 words of the viewport-clip-rect struct passed to
     raster_triangle (as param_8) as 4 separate locals. The recompiler is
     free to lay them out in any order / non-contiguously, so param_8[1..3]
     read stack garbage and raster_triangle's `*(int*)(puVar3+8) < param_8[3]`
     never let it call the span rasterizer. Real 4-int array. */
  undefined4 local_70_rect[4];
#define local_70 (local_70_rect[0])
#define local_6c (local_70_rect[1])
#define local_68 (local_70_rect[2])
#define local_64 (local_70_rect[3])
  /* Same bug as local_70_rect above: Ghidra named the 15 words of the
     triangle-vertex struct passed to raster_triangle as param_3 (three
     vertices x 5 floats: x, y, w, u, v) as 15 separate locals. The
     recompiler lays them out non-contiguously, so raster_triangle_perspective_setup /
     raster_edge_setup read stack garbage for every field past [0] -- every
     transformed vertex came out (x,0,0) and the triangle setup produced
     -inf/nan, so no texel was ever sampled. Real 15-float array. */
  undefined4 local_60_arr[15];
#define local_60 (local_60_arr[0])
#define local_5c (local_60_arr[1])
#define local_58 (local_60_arr[2])
#define local_54 (local_60_arr[3])
#define local_50 (local_60_arr[4])
#define local_4c (local_60_arr[5])
#define local_48 (local_60_arr[6])
#define local_44 (local_60_arr[7])
#define local_40 (local_60_arr[8])
#define local_3c (local_60_arr[9])
#define local_38 (local_60_arr[10])
#define local_34 (local_60_arr[11])
#define local_30 (local_60_arr[12])
#define local_2c (local_60_arr[13])
#define local_28 (local_60_arr[14])
  
  local_94 = 0;
  local_70 = DAT_0008462c;
  local_68 = DAT_00084634;
  local_6c = DAT_00084630;
  local_64 = DAT_00084638;
  DEBUG(TRACE, "[tmap-diag] render_visible_tile_list: DAT_000c8c98 (visible-tile count) = %d", DAT_000c8c98);
  if (0 < DAT_000c8c98) {
    local_98 = &DAT_000c4838;
    iVar15 = DAT_000c8c98;
    do {
      piVar14 = (int *)*local_98;
      iVar1 = piVar14[1];
      iVar2 = piVar14[2];
      iVar17 = piVar14[3];
      local_54 = ordfloat_int_to_float2(piVar14[0x10]);
      local_50 = ordfloat_int_to_float2(piVar14[0x11]);
      iVar16 = 1;
      DEBUG(TRACE, "[tmap-diag] record %d: *piVar14 (point count) = %d", local_94, *piVar14);
      if (1 < *piVar14 + -1) {
        uVar6 = ordfloat_div(0x3f800000,iVar17);
        uVar7 = ordfloat_mul(iVar17,0x3a2ec33e);
        iVar17 = 0xc;
        do {
          uVar11 = *(undefined4 *)((char *)piVar14 + iVar17 + 4);
          uVar12 = *(undefined4 *)((char *)piVar14 + iVar17 + 8);
          uVar3 = *(undefined4 *)((char *)piVar14 + iVar17 + 0xc);
          local_40 = ordfloat_int_to_float2(piVar14[iVar16 * 2 + 0x10]);
          local_3c = ordfloat_int_to_float2(piVar14[iVar16 * 2 + 0x11]);
          uVar13 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x10);
          uVar4 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x14);
          uVar5 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x18);
          local_2c = ordfloat_int_to_float2(piVar14[iVar16 * 2 + 0x12]);
          local_28 = ordfloat_int_to_float2(piVar14[iVar16 * 2 + 0x13]);
          uVar8 = ordfloat_int_to_float2(DAT_00084610);
          uVar9 = ordfloat_mul(uVar6,uVar8);
          uVar9 = ordfloat_mul(uVar9,iVar1);
          local_60 = ordfloat_add(uVar9,0x430c0000);
          uVar9 = ordfloat_mul(uVar6,uVar8);
          uVar9 = ordfloat_mul(uVar9,iVar2);
          uVar9 = ordfloat_mul(uVar9,0x3f666666);
          local_5c = ordfloat_sub(0x42a00000,uVar9);
          local_58 = uVar7;
          uVar9 = ordfloat_div(0x3f800000,uVar3);
          uVar10 = ordfloat_mul(uVar9,uVar8);
          uVar11 = ordfloat_mul(uVar10,uVar11);
          local_4c = ordfloat_add(uVar11,0x430c0000);
          uVar11 = ordfloat_mul(uVar9,uVar8);
          uVar11 = ordfloat_mul(uVar11,uVar12);
          uVar11 = ordfloat_mul(uVar11,0x3f666666);
          local_48 = ordfloat_sub(0x42a00000,uVar11);
          local_44 = ordfloat_mul(uVar3,0x3a2ec33e);
          uVar11 = ordfloat_div(0x3f800000,uVar5);
          uVar12 = ordfloat_mul(uVar11,uVar8);
          uVar13 = ordfloat_mul(uVar12,uVar13);
          local_38 = ordfloat_add(uVar13,0x430c0000);
          uVar11 = ordfloat_mul(uVar11,uVar8);
          uVar11 = ordfloat_mul(uVar11,uVar4);
          uVar11 = ordfloat_mul(uVar11,0x3f666666);
          local_34 = ordfloat_sub(0x42a00000,uVar11);
          local_30 = ordfloat_mul(uVar5,0x3a2ec33e);
          DAT_000da47c = (undefined2)piVar14[0x1d];
          DEBUG(TRACE, "[tmap-diag] raster_triangle call: tex=0x%x x=%.0f y=%.0f w(0x1c)=%d stride(0x1b)=%d",
                piVar14[0x1e], ((float*)local_60_arr)[0], ((float*)local_60_arr)[1], piVar14[0x1c], piVar14[0x1b]);
          raster_triangle(0x140,g_uw_framebuffer,local_60_arr,piVar14[0x1e],
                       piVar14[0x1b],piVar14[0x1c] * piVar14[0x1b],
                       ((unsigned)local_94 < UW_MAX_VIS_TILES)
                         ? (intptr_t)g_tile_texptr_out[local_94]
                         : (intptr_t)piVar14[0x1a],
                       local_70_rect);
          { char _facetag[32];
            snprintf(_facetag, sizeof(_facetag), "rec%03d_tri%d_tex0x%x", local_94, iVar16, piVar14[0x1e]);
            uw_debug_dump_3d_face(_facetag);
          }
          iVar16 = iVar16 + 1;
          iVar17 = iVar17 + 0xc;
          piVar14 = (int *)*local_98;
          iVar15 = DAT_000c8c98;
        } while (iVar16 < *piVar14 + -1);
      }
      local_94 = local_94 + 1;
      local_98 = local_98 + 1;
    } while (local_94 < iVar15);
  }
  debug_framebuffer_dump("render_visible_tile_list");
  { int _dumped = uw_debug_3d_frame_dump_finish();
    if (_dumped >= 0) {
      char _msg[80];
      snprintf(_msg, sizeof(_msg), "[debug] dumped %d 3D faces to %s\n",
               _dumped, uw_debug_3d_frame_dump_last_dir());
      message_scroll_print_wrapped(_msg);
    }
  }
  return;
}
#undef local_70
#undef local_6c
#undef local_68
#undef local_64
#undef local_60
#undef local_5c
#undef local_58
#undef local_54
#undef local_50
#undef local_4c
#undef local_48
#undef local_44
#undef local_40
#undef local_3c
#undef local_38
#undef local_34
#undef local_30
#undef local_2c
#undef local_28


// was FUN_0005d9cc
void walk_visible_tiles()

{
  short sVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  char *pcVar5;
  uint uVar6;
  int iVar7;
  byte *pbVar8;
  undefined1 *puVar9;
  
  DAT_0023b818 = 0xe0;
  DAT_0023b4f0 = DAT_0023b4a0 * 4 + UW_B50_LIT(0x86b60);
  iVar4 = DAT_0023b4a0 * 6;
  sVar2 = *(short *)(&DAT_00086a00 + iVar4);
  iVar7 = (int)sVar2;
  sVar3 = *(short *)(&DAT_00086a02 + iVar4);
  puVar9 = &g_visibility_ring_buffer + g_visibility_ring_depth * 0x42;
  pbVar8 = (byte *)(DAT_0023aecc + ((int)sVar3 * (int)g_visibility_ring_depth + iVar7 * -0x10) * 4);
  DAT_0023b814 = tilemap_lookup(0,0);
  DAT_0023b808 = tilemap_lookup(0x3f,0x3f);
  DAT_0023b83c = 0;
  uVar6 = (uint)(short)((int)pbVar8 - (int)DAT_0023b814 >> 2);
  DAT_0023b838 = 0;
  /* Also clear the arena's own count fields (offset 0 = vertex count,
     offset 4 = record count). process_visible_tile_cell normally keeps
     them in step with DAT_0023b838 / DAT_0023b83c as it emits, but a
     frame where it emits nothing (all tiles culled, or the overflow
     guard trips for every tile) would otherwise leave last frame's stale
     counts for near_clip_visible_tiles / render_visible_tile_list to
     re-draw -- the "view stuck on the tiles from the overflow frame" bug. */
  *(int *)((char *)DAT_000a85d0_backing + 0) = 0;
  *(int *)((char *)DAT_000a85d0_backing + 4) = 0;
  if (0x2000 < (int)uVar6) {
    uVar6 = uVar6 - 0x4000;
  }
  update_wall_partition_phase(0xfffffff6);
  DAT_0023b4e8 = g_visibility_ring_depth;
  if (-1 < g_visibility_ring_depth) {
    do {
      update_wall_partition_phase(2);
      sVar1 = (short)uVar6;
      DAT_0023b4e4 = 0;
      uVar6 = (uint)sVar1;
      DAT_0023b820 = puVar9;
      DAT_0023b4ec = pbVar8;
      do {
        if ((uVar6 & 0xf000) == 0) {
          process_visible_tile_cell(&DAT_000b99d0 + (short)uVar6);
        }
        DAT_0023b4e4 = DAT_0023b4e4 + 1;
        DAT_0023b4ec = DAT_0023b4ec + iVar7 * 4;
        DAT_0023b820 = DAT_0023b820 + 2;
        uVar6 = ((short)uVar6 + iVar7) * 0x10000 >> 0x10;
      } while (DAT_0023b4e4 < 0x10);
      update_wall_partition_phase(1);
      iVar4 = 0x20;
      DAT_0023b820 = puVar9 + 0x40;
      DAT_0023b4e4 = 0x20;
      DAT_0023b4ec = pbVar8 + iVar7 * 0x80;
      uVar6 = ((int)sVar1 + iVar7 * 0x20) * 0x10000 >> 0x10;
      do {
        if ((uVar6 & 0xf000) == 0) {
          process_visible_tile_cell(&DAT_000b99d0 + (short)uVar6);
          iVar4 = (int)DAT_0023b4e4;
        }
        DAT_0023b4ec = DAT_0023b4ec + iVar7 * -4;
        iVar4 = iVar4 + -1;
        uVar6 = (int)(short)uVar6 - (int)sVar2;
        DAT_0023b4e4 = (short)iVar4;
        DAT_0023b820 = DAT_0023b820 + -2;
      } while (0x10 < iVar4 * 0x10000 >> 0x10);
      update_wall_partition_phase(0);
      if ((uVar6 * 0x10000 & 0xf0000000) == 0) {
        process_visible_tile_cell(&DAT_000b99d0 + ((int)(uVar6 * 0x10000) >> 0x10));
      }
      puVar9 = puVar9 + -0x42;
      *DAT_00110fc0 = 0xb0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      pbVar8 = pbVar8 + sVar3 * -4;
      iVar4 = (int)DAT_0023b4e8;
      uVar6 = (int)sVar1 - (int)sVar3;
      DAT_0023b4e8 = (short)(iVar4 + -1);
    } while (-1 < (iVar4 + -1) * 0x10000 >> 0x10);
  }
  DAT_0023b4ec = pbVar8;
  pcVar5 = &DAT_000b99d0 + (short)uVar6;
  DAT_0023b4e4 = 0;
  do {
    // HACK: this trailing one-row sweep (33 tiles wide, confirmed via a
    // recorded repro to land one row "behind" the player -- e.g.
    // dy=-1 at heading 0 -- outside the range run_visibility_flood's
    // ring-walk ever populates) has no g_visibility_ring_buffer byte
    // of its own to check at all, unlike process_visible_tile_cell's
    // per-cell reveal (see that function's own bVar25!=0 fix). It was
    // revealing every in-bounds, not-yet-revealed cell unconditionally
    // -- with zero flood/line-of-sight justification -- contributing
    // to the same perfect-rectangle over-reveal bug. No ring-buffer
    // data exists here to check instead, so just stop revealing
    // through this path; genuinely visible tiles still get revealed
    // through the main ring-walk / process_visible_tile_cell above.
    if (0) {
      if (((uVar6 & 0xf000) == 0) && (*pcVar5 == '\0')) {
        *pcVar5 = automap_reveal_byte(DAT_0023b4ec);
      }
    }
    DAT_0023b4e4 = DAT_0023b4e4 + 1;
    DAT_0023b4ec = DAT_0023b4ec + iVar7 * 4;
    uVar6 = ((short)uVar6 + iVar7) * 0x10000 >> 0x10;
    pcVar5 = pcVar5 + iVar7;
  } while (DAT_0023b4e4 < 0x21);
  return;
}




// was FUN_0005e604
void process_visible_tile_cell(param_1)
byte * param_1;

{
  uint uVar1;
  char cVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  undefined1 uVar7;
  undefined1 uVar8;
  undefined1 uVar9;
  undefined1 uVar10;
  undefined1 uVar11;
  undefined1 uVar12;
  undefined1 uVar13;
  undefined1 uVar14;
  byte bVar15;
  intptr_t iVar16; /* was int -- also holds the DAT_00086e6c view-record pointer */
  undefined4 uVar17;
  int iVar18;
  int iVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  uint uVar22;
  ushort *puVar23;
  undefined1 uVar24;
  byte bVar25;
  ushort uVar26;
  ushort uVar27;
  uint uVar28;
  short *psVar29;
  int iVar30;
  short sVar31;
  int iVar32;
  int iVar33;
  int iVar34;
  byte *pbVar35;
  int iVar36;
  char *pcVar37;
  int iVar38;
  bool bVar39;
  byte local_84;
  byte local_83;
  byte local_81;
  byte local_80;
  uint local_54;
  undefined1 auStack_50 [4];
  uint local_4c;
  uint local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  int local_34;
  uint local_30;
  
  bVar25 = *DAT_0023b820;
  local_48 = (uint)(short)(ushort)bVar25;
  if (getenv("UW_DEBUG_GEOMETRY_DIST")) {
    intptr_t _dcell = (DAT_0023b4ec - (byte *)DAT_002029cc) / 4;
    ushort *_dpp = (ushort *)g_player_object;
    int _dcx = (int)(_dcell & 0x3f), _dcy = (int)(_dcell >> 6);
    int _dpx = (int)(_dpp[0xb] >> 10), _dpy = (int)((_dpp[0xb] & 0x3f0) >> 4);
    int _ddx = _dcx - _dpx; if (_ddx < 0) _ddx = -_ddx;
    int _ddy = _dcy - _dpy; if (_ddy < 0) _ddy = -_ddy;
    fprintf(stderr, "[geom-dist] bit80=%d rawbyte=0x%02x tile=(%d,%d) player=(%d,%d) dist=%d willreveal=%d\n",
            (local_48 & 0x80) != 0, (unsigned)bVar25, _dcx, _dcy, _dpx, _dpy, _ddx > _ddy ? _ddx : _ddy,
            (int)(*param_1 == 0));
  }
  if ((local_48 & 0x80) == 0) {
    /* Unreached cells stay unknown. For reached cells without geometry,
       use the tile's shade to distinguish discovered floors from the
       original unknown shapes (10..15) used for boundary walls. */
    if ((*param_1 == 0) && (bVar25 != 0)) {
      /* Shade indices below 8 are bright enough to discover the floor. */
      *param_1 = (DAT_0023b820[1] & 0xf) < 8
          ? automap_reveal_byte(DAT_0023b4ec)
          : DAT_00086bf0_real_table[g_current_tile->tile_type];
      DAT_0023b810 = DAT_0023b810 + 1;
    }
    flush_pending_tile_features();
    return;
  }
  /* This branch emits a visible tile's 3D geometry slice for the dungeon
     viewport. It now renders a real textured room end to end -- the
     visibility flood-fill (run_visibility_flood / process_reaction_
     entry / compute_visibility_ray_offset / extend_visibility_ray_row) and the
     software span rasterizer (raster_triangle / raster_textured_span)
     were resurrected across this session's commits (see git tags
     milestone-3d-tiles-render, milestone-3d-room). Enabled by default;
     set UW_DISABLE_3D_GEOMETRY to fall back to the automap-reveal-only
     path (the old behaviour). */
  { static int _disabled = -1;
    if (_disabled < 0) _disabled = (getenv("UW_DISABLE_3D_GEOMETRY") != NULL);
    /* Arena overflow guard. The DAT_000a85d0_backing arena packs the raw,
       camera-space and projected vertex arrays at 0x8 / 0x1808 / 0x3008
       (0xc stride), and near_clip_visible_tiles reads a record's stored
       vertex index as `idx*0xc + base + 0x3010` -- so once the vertex
       count passes ~512 the projected coords run into the 0x4814 record
       region and near_clip then dereferences a garbage vertex index
       (wild-pointer crash / black view when looking down a long open
       hallway). Records likewise cap near 490. One tile emits up to ~28
       verts / ~6 records, so stop emitting geometry for further tiles
       well before that; walk_visible_tiles rings outward from the camera,
       so it's the farthest tiles that drop. Test DAT_0023b838 /
       DAT_0023b83c -- the working counters walk_visible_tiles resets each
       frame -- NOT the arena's offset-0 count (which persists and would
       make the guard latch on forever after one overflow). */
    if (_disabled
        || (int)(uint)DAT_0023b838 >= 512 - 28
        || (int)DAT_0023b83c >= 490 - 6) {
      if (*param_1 == 0) {
        /* Even when geometry storage is full, darkness must not reveal floors. */
        *param_1 = (DAT_0023b820[1] & 0xf) < 8
            ? automap_reveal_byte(DAT_0023b4ec)
            : DAT_00086bf0_real_table[g_current_tile->tile_type];
        DAT_0023b810 = DAT_0023b810 + 1;
      }
      return;
    }
  }
  DAT_0023b4d0 = 200;
  bVar15 = g_current_tile->floor_height;
  uVar1 = (uint)bVar15;
  DAT_0023b4e0 = DAT_0023b820[1] & 0xf;
  if (DAT_0023b4e0 < 8) {
    /* `*DAT_0023b4ec >> 10` decompiled from a 16-bit tile-record read
       but DAT_0023b4ec is a byte* here, so as written it always read
       DAT_0023ae40[0]. floor-tex index is byte 1 bits 2-5. Shared
       helper with walk_visible_tiles's ring-walk. */
    local_84 = automap_reveal_byte(DAT_0023b4ec);
  }
  else {
    local_84 = *param_1;
    if (local_84 == 0) {
      local_84 = (&DAT_00086bf0)[g_current_tile->tile_type];
    }
  }
  local_30 = (int)(short)(ushort)bVar25 & 0x44;
  if (local_30 == 4) {
    local_4c = bVar25 & 3;
  }
  else {
    local_4c = 4;
  }
  iVar33 = local_4c * 4;
  pbVar35 = (byte *)(iVar33 + UW_B50_LIT(0x86b70));
  if (local_4c == 4) {
    if (*(short *)(&DAT_00085d20 + uVar1 * 2) < g_current_view->view_elevation) {
LAB_0005e988:
      bVar39 = true;
      goto LAB_0005e7e0;
    }
  }
  else {
    iVar16 = local_4c * 3;
    if (((int)*(short *)(&DAT_00085d20 + (uVar1 + *pbVar35) * 2) -
        (int)g_current_view->view_elevation) * (int)*(char *)(UW_B50_LIT(0x86be1) + iVar16) +
        (DAT_0023b4e8 * 0x100 - (int)g_current_view->view_y) *
        (int)*(char *)(UW_B50_LIT(0x86be2) + iVar16) +
        ((DAT_0023b4e4 + -0x10) * 0x100 - (int)g_current_view->view_x) *
        (int)*(char *)(UW_B50_LIT(0x86be0) + iVar16) < 0) goto LAB_0005e988;
  }
  bVar39 = false;
LAB_0005e7e0:
  DAT_0023b818 = 0xe0;
  iVar16 = DAT_00086e6c;
  if (bVar39) {
    (*DAT_0023b4f4)(auStack_50,DAT_0023b4e0,g_current_tile->floor_tex);
    uVar28 = g_current_tile->floor_tex;
    if ((short)(ushort)DAT_0023b4e0 < DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((DAT_0023b4e0 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      iVar16 = uVar28 + 0x30;
      DAT_0023b4d8 = 0x400;
      uVar24 = 0x20;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
    }
    else {
      iVar16 = uVar28 + 0x6a;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      uVar24 = 0x10;
      DAT_0023b824 = 0x10;
    }
    iVar32 = DAT_0023b83c * 0x60;
    (&DAT_000ace00)[iVar32] = uVar24;
    (&DAT_000ace01)[iVar32] = 0;
    (&DAT_000ace02)[iVar32] = 0;
    (&DAT_000ace03)[iVar32] = 0;
    (&DAT_000ace04)[iVar32] = uVar24;
    (&DAT_000ace05)[iVar32] = 0;
    (&DAT_000ace06)[iVar32] = 0;
    (&DAT_000ace07)[iVar32] = 0;
    { void *_tp = get_texture_page(iVar16); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
    iVar32 = DAT_0023b83c;
    iVar30 = DAT_0023b83c * 0x60;
    (&DAT_000acdfc)[iVar30] = (char)uVar17;
    iVar18 = (int)DAT_0023b4e4;
    (&DAT_000acdfd)[iVar30] = (char)((uint)uVar17 >> 8);
    (&DAT_000acdfe)[iVar30] = (char)((uint)uVar17 >> 0x10);
    (&DAT_000acdff)[iVar30] = (char)((uint)uVar17 >> 0x18);
    sVar31 = DAT_000da47c;
    (&DAT_000ace30)[iVar30] = (char)DAT_000da47c;
    (&DAT_000ace31)[iVar30] = (char)((ushort)sVar31 >> 8);
    cVar2 = (char)(sVar31 >> 0xf);
    (&DAT_000ace32)[iVar30] = cVar2;
    (&DAT_000ace33)[iVar30] = cVar2;
    uVar17 = ordfloat_int_to_float2(iVar18 << 8);
    iVar16 = DAT_0023b838;
    iVar34 = DAT_0023b838 * 0xc;
    iVar19 = (int)DAT_0023b4e8;
    (&DAT_000a85d8)[iVar34] = (char)uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    (&DAT_000a85d9)[iVar34] = uVar24;
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    (&DAT_000a85da)[iVar34] = uVar3;
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    (&DAT_000a85db)[iVar34] = uVar4;
    uVar20 = ordfloat_int_to_float2((iVar19 + 1) * 0x100);
    (&DAT_000a85e0)[iVar34] = (char)uVar20;
    uVar5 = (undefined1)((uint)uVar20 >> 8);
    (&DAT_000a85e1)[iVar34] = uVar5;
    uVar6 = (undefined1)((uint)uVar20 >> 0x10);
    (&DAT_000a85e2)[iVar34] = uVar6;
    uVar7 = (undefined1)((uint)uVar20 >> 0x18);
    (&DAT_000a85e3)[iVar34] = uVar7;
    uVar21 = ordfloat_int_to_float2((uVar1 + *(byte *)(UW_B50_LIT(0x86b72) + iVar33)) * 0x40);
    (&DAT_000a85dc)[iVar34] = (char)uVar21;
    (&DAT_000a85dd)[iVar34] = (char)((uint)uVar21 >> 8);
    (&DAT_000a85de)[iVar34] = (char)((uint)uVar21 >> 0x10);
    (&DAT_000a85df)[iVar34] = (char)((uint)uVar21 >> 0x18);
    (&DAT_000acde8)[iVar30] = (char)iVar16;
    iVar38 = iVar16 + 1;
    DAT_0023b838 = iVar38;
    (&DAT_000acde9)[iVar30] = (char)((uint)iVar16 >> 8);
    (&DAT_000acdea)[iVar30] = (char)((uint)iVar16 >> 0x10);
    (&DAT_000acdeb)[iVar30] = (char)((uint)iVar16 >> 0x18);
    (&DAT_000ace08)[iVar30] = 0;
    (&DAT_000ace09)[iVar30] = 0;
    (&DAT_000ace0a)[iVar30] = 0;
    (&DAT_000ace0b)[iVar30] = 0;
    (&DAT_000ace0c)[iVar30] = 0;
    (&DAT_000ace0d)[iVar30] = 0;
    (&DAT_000ace0e)[iVar30] = 0;
    (&DAT_000ace0f)[iVar30] = 0;
    iVar34 = iVar38 * 0xc;
    (&DAT_000a85d8)[iVar34] = (char)uVar17;
    (&DAT_000a85d9)[iVar34] = uVar24;
    (&DAT_000a85da)[iVar34] = uVar3;
    (&DAT_000a85db)[iVar34] = uVar4;
    uVar17 = ordfloat_int_to_float2(iVar19 << 8);
    (&DAT_000a85e0)[iVar34] = (char)uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    (&DAT_000a85e1)[iVar34] = uVar24;
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    (&DAT_000a85e2)[iVar34] = uVar3;
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    (&DAT_000a85e3)[iVar34] = uVar4;
    uVar21 = ordfloat_int_to_float2((uVar1 + *pbVar35) * 0x40);
    (&DAT_000a85dc)[iVar34] = (char)uVar21;
    (&DAT_000a85dd)[iVar34] = (char)((uint)uVar21 >> 8);
    (&DAT_000a85de)[iVar34] = (char)((uint)uVar21 >> 0x10);
    (&DAT_000a85df)[iVar34] = (char)((uint)uVar21 >> 0x18);
    (&DAT_000acdec)[iVar30] = (char)iVar38;
    iVar34 = iVar16 + 2;
    DAT_0023b838 = iVar34;
    (&DAT_000acded)[iVar30] = (char)((uint)iVar38 >> 8);
    (&DAT_000acdee)[iVar30] = (char)((uint)iVar38 >> 0x10);
    (&DAT_000acdef)[iVar30] = (char)((uint)iVar38 >> 0x18);
    (&DAT_000ace10)[iVar30] = 0;
    (&DAT_000ace11)[iVar30] = 0;
    (&DAT_000ace12)[iVar30] = 0;
    (&DAT_000ace13)[iVar30] = 0;
    iVar19 = DAT_0023b824 + -1;
    uVar8 = (undefined1)iVar19;
    (&DAT_000ace14)[iVar30] = uVar8;
    uVar9 = (undefined1)((uint)iVar19 >> 8);
    (&DAT_000ace15)[iVar30] = uVar9;
    uVar10 = (undefined1)((uint)iVar19 >> 0x10);
    (&DAT_000ace16)[iVar30] = uVar10;
    uVar11 = (undefined1)((uint)iVar19 >> 0x18);
    (&DAT_000ace17)[iVar30] = uVar11;
    uVar21 = ordfloat_int_to_float2((iVar18 + 1) * 0x100);
    iVar18 = iVar34 * 0xc;
    (&DAT_000a85d8)[iVar18] = (char)uVar21;
    uVar12 = (undefined1)((uint)uVar21 >> 8);
    (&DAT_000a85d9)[iVar18] = uVar12;
    uVar13 = (undefined1)((uint)uVar21 >> 0x10);
    (&DAT_000a85da)[iVar18] = uVar13;
    uVar14 = (undefined1)((uint)uVar21 >> 0x18);
    (&DAT_000a85db)[iVar18] = uVar14;
    (&DAT_000a85e0)[iVar18] = (char)uVar17;
    (&DAT_000a85e1)[iVar18] = uVar24;
    (&DAT_000a85e2)[iVar18] = uVar3;
    (&DAT_000a85e3)[iVar18] = uVar4;
    uVar17 = ordfloat_int_to_float2((uVar1 + *(byte *)(UW_B50_LIT(0x86b71) + iVar33)) * 0x40);
    (&DAT_000a85dc)[iVar18] = (char)uVar17;
    (&DAT_000a85dd)[iVar18] = (char)((uint)uVar17 >> 8);
    (&DAT_000a85de)[iVar18] = (char)((uint)uVar17 >> 0x10);
    (&DAT_000a85df)[iVar18] = (char)((uint)uVar17 >> 0x18);
    (&DAT_000acdf0)[iVar30] = (char)iVar34;
    (&DAT_000acdf1)[iVar30] = (char)((uint)iVar34 >> 8);
    (&DAT_000acdf2)[iVar30] = (char)((uint)iVar34 >> 0x10);
    (&DAT_000acdf3)[iVar30] = (char)((uint)iVar34 >> 0x18);
    (&DAT_000ace18)[iVar30] = uVar8;
    iVar19 = iVar16 + 3;
    DAT_0023b838 = iVar19;
    (&DAT_000ace19)[iVar30] = uVar9;
    (&DAT_000ace1a)[iVar30] = uVar10;
    (&DAT_000ace1b)[iVar30] = uVar11;
    (&DAT_000ace1c)[iVar30] = uVar8;
    (&DAT_000ace1d)[iVar30] = uVar9;
    (&DAT_000ace1e)[iVar30] = uVar10;
    (&DAT_000ace1f)[iVar30] = uVar11;
    iVar18 = iVar19 * 0xc;
    (&DAT_000a85d8)[iVar18] = (char)uVar21;
    (&DAT_000a85d9)[iVar18] = uVar12;
    (&DAT_000a85da)[iVar18] = uVar13;
    (&DAT_000a85db)[iVar18] = uVar14;
    (&DAT_000a85e0)[iVar18] = (char)uVar20;
    (&DAT_000a85e1)[iVar18] = uVar5;
    (&DAT_000a85e2)[iVar18] = uVar6;
    (&DAT_000a85e3)[iVar18] = uVar7;
    uVar17 = ordfloat_int_to_float2((uVar1 + *(byte *)(UW_B50_LIT(0x86b73) + iVar33)) * 0x40);
    (&DAT_000a85dc)[iVar18] = (char)uVar17;
    (&DAT_000a85dd)[iVar18] = (char)((uint)uVar17 >> 8);
    DAT_000a85d0 = iVar16 + 4;
    DAT_0023b838 = DAT_000a85d0;
    (&DAT_000a85de)[iVar18] = (char)((uint)uVar17 >> 0x10);
    (&DAT_000a85df)[iVar18] = (char)((uint)uVar17 >> 0x18);
    (&DAT_000acdf4)[iVar30] = (char)iVar19;
    (&DAT_000acdf5)[iVar30] = (char)((uint)iVar19 >> 8);
    (&DAT_000acdf6)[iVar30] = (char)((uint)iVar19 >> 0x10);
    (&DAT_000acdf7)[iVar30] = (char)((uint)iVar19 >> 0x18);
    (&DAT_000ace20)[iVar30] = uVar8;
    (&DAT_000ace21)[iVar30] = uVar9;
    (&DAT_000ace22)[iVar30] = uVar10;
    (&DAT_000ace23)[iVar30] = uVar11;
    (&DAT_000ace24)[iVar30] = 0;
    (&DAT_000ace25)[iVar30] = 0;
    (&DAT_000ace26)[iVar30] = 0;
    (&DAT_000ace27)[iVar30] = 0;
    (&DAT_000acde4)[iVar30] = 4;
    (&DAT_000acde5)[iVar30] = 0;
    (&DAT_000acde6)[iVar30] = 0;
    iVar16 = DAT_00086e6c;
    (&DAT_000acde7)[iVar30] = 0;
    if (!g_uw_hide_walls) {
      DAT_000a85d4 = iVar32 + 1;
      DAT_0023b83c = DAT_000a85d4;
    }
  }
  if (*(short *)(iVar16 + 0xe) < 0x3f5) {
    (*DAT_0023b80c)(auStack_50,DAT_0023b4e0,9);
    if ((short)(ushort)DAT_0023b4e0 < DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((DAT_0023b4e0 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      DAT_0023b4d8 = 0x400;
      uVar24 = 0x20;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
      uVar17 = 0x39;
    }
    else {
      uVar17 = 0x73;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      uVar24 = 0x10;
      DAT_0023b824 = 0x10;
    }
    iVar33 = DAT_0023b83c * 0x60;
    (&DAT_000ace00)[iVar33] = uVar24;
    (&DAT_000ace01)[iVar33] = 0;
    (&DAT_000ace02)[iVar33] = 0;
    (&DAT_000ace03)[iVar33] = 0;
    (&DAT_000ace04)[iVar33] = uVar24;
    (&DAT_000ace05)[iVar33] = 0;
    (&DAT_000ace06)[iVar33] = 0;
    (&DAT_000ace07)[iVar33] = 0;
    { void *_tp = get_texture_page(uVar17); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
    iVar19 = DAT_0023b83c * 0x60;
    (&DAT_000acdfc)[iVar19] = (char)uVar17;
    (&DAT_000acdfd)[iVar19] = (char)((uint)uVar17 >> 8);
    (&DAT_000acdfe)[iVar19] = (char)((uint)uVar17 >> 0x10);
    (&DAT_000acdff)[iVar19] = (char)((uint)uVar17 >> 0x18);
    sVar31 = DAT_000da47c;
    (&DAT_000ace30)[iVar19] = (char)DAT_000da47c;
    iVar16 = (int)DAT_0023b4e4;
    (&DAT_000ace31)[iVar19] = (char)((ushort)sVar31 >> 8);
    cVar2 = (char)(sVar31 >> 0xf);
    (&DAT_000ace32)[iVar19] = cVar2;
    (&DAT_000ace33)[iVar19] = cVar2;
    uVar17 = ordfloat_int_to_float2(iVar16 << 8);
    iVar18 = DAT_0023b838 * 0xc;
    (&DAT_000a85d8)[iVar18] = (char)uVar17;
    iVar32 = (int)DAT_0023b4e8;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    (&DAT_000a85d9)[iVar18] = uVar24;
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    (&DAT_000a85da)[iVar18] = uVar3;
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    (&DAT_000a85db)[iVar18] = uVar4;
    uVar20 = ordfloat_int_to_float2(iVar32 << 8);
    (&DAT_000a85e0)[iVar18] = (char)uVar20;
    uVar5 = (undefined1)((uint)uVar20 >> 8);
    (&DAT_000a85e1)[iVar18] = uVar5;
    uVar6 = (undefined1)((uint)uVar20 >> 0x10);
    (&DAT_000a85e2)[iVar18] = uVar6;
    uVar7 = (undefined1)((uint)uVar20 >> 0x18);
    (&DAT_000a85e3)[iVar18] = uVar7;
    iVar33 = DAT_0023b838;
    (&DAT_000a85dc)[iVar18] = 0;
    (&DAT_000a85dd)[iVar18] = 0;
    (&DAT_000a85de)[iVar18] = 0x80;
    (&DAT_000a85df)[iVar18] = 0x44;
    (&DAT_000acde8)[iVar19] = (char)iVar33;
    iVar18 = iVar33 + 1;
    iVar30 = iVar18 * 0xc;
    (&DAT_000acde9)[iVar19] = (char)((uint)iVar33 >> 8);
    (&DAT_000acdea)[iVar19] = (char)((uint)iVar33 >> 0x10);
    (&DAT_000acdeb)[iVar19] = (char)((uint)iVar33 >> 0x18);
    (&DAT_000ace08)[iVar19] = 0;
    (&DAT_000ace09)[iVar19] = 0;
    (&DAT_000ace0a)[iVar19] = 0;
    (&DAT_000ace0b)[iVar19] = 0;
    (&DAT_000ace0c)[iVar19] = 0;
    (&DAT_000ace0d)[iVar19] = 0;
    (&DAT_000ace0e)[iVar19] = 0;
    (&DAT_000ace0f)[iVar19] = 0;
    (&DAT_000a85d8)[iVar30] = (char)uVar17;
    (&DAT_000a85d9)[iVar30] = uVar24;
    (&DAT_000a85da)[iVar30] = uVar3;
    (&DAT_000a85db)[iVar30] = uVar4;
    uVar17 = ordfloat_int_to_float2((iVar32 + 1) * 0x100);
    (&DAT_000a85e0)[iVar30] = (char)uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    (&DAT_000a85e1)[iVar30] = uVar24;
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    (&DAT_000a85e2)[iVar30] = uVar3;
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    (&DAT_000a85e3)[iVar30] = uVar4;
    (&DAT_000a85dc)[iVar30] = 0;
    (&DAT_000a85dd)[iVar30] = 0;
    (&DAT_000a85de)[iVar30] = 0x80;
    (&DAT_000a85df)[iVar30] = 0x44;
    (&DAT_000acdec)[iVar19] = (char)iVar18;
    (&DAT_000acded)[iVar19] = (char)((uint)iVar18 >> 8);
    (&DAT_000acdee)[iVar19] = (char)((uint)iVar18 >> 0x10);
    (&DAT_000acdef)[iVar19] = (char)((uint)iVar18 >> 0x18);
    (&DAT_000ace10)[iVar19] = 0;
    (&DAT_000ace11)[iVar19] = 0;
    (&DAT_000ace12)[iVar19] = 0;
    (&DAT_000ace13)[iVar19] = 0;
    iVar32 = DAT_0023b824 + -1;
    uVar8 = (undefined1)iVar32;
    (&DAT_000ace14)[iVar19] = uVar8;
    uVar9 = (undefined1)((uint)iVar32 >> 8);
    (&DAT_000ace15)[iVar19] = uVar9;
    uVar10 = (undefined1)((uint)iVar32 >> 0x10);
    (&DAT_000ace16)[iVar19] = uVar10;
    uVar11 = (undefined1)((uint)iVar32 >> 0x18);
    (&DAT_000ace17)[iVar19] = uVar11;
    iVar18 = iVar33 + 2;
    uVar21 = ordfloat_int_to_float2((iVar16 + 1) * 0x100);
    iVar16 = iVar18 * 0xc;
    (&DAT_000a85d8)[iVar16] = (char)uVar21;
    uVar12 = (undefined1)((uint)uVar21 >> 8);
    (&DAT_000a85d9)[iVar16] = uVar12;
    uVar13 = (undefined1)((uint)uVar21 >> 0x10);
    (&DAT_000a85da)[iVar16] = uVar13;
    uVar14 = (undefined1)((uint)uVar21 >> 0x18);
    (&DAT_000a85db)[iVar16] = uVar14;
    (&DAT_000a85e0)[iVar16] = (char)uVar17;
    (&DAT_000a85e1)[iVar16] = uVar24;
    (&DAT_000a85e2)[iVar16] = uVar3;
    (&DAT_000a85e3)[iVar16] = uVar4;
    (&DAT_000a85dc)[iVar16] = 0;
    (&DAT_000a85dd)[iVar16] = 0;
    (&DAT_000a85de)[iVar16] = 0x80;
    (&DAT_000a85df)[iVar16] = 0x44;
    (&DAT_000acdf0)[iVar19] = (char)iVar18;
    iVar32 = iVar33 + 3;
    (&DAT_000acdf1)[iVar19] = (char)((uint)iVar18 >> 8);
    (&DAT_000acdf2)[iVar19] = (char)((uint)iVar18 >> 0x10);
    (&DAT_000acdf3)[iVar19] = (char)((uint)iVar18 >> 0x18);
    (&DAT_000ace18)[iVar19] = uVar8;
    (&DAT_000ace19)[iVar19] = uVar9;
    (&DAT_000ace1a)[iVar19] = uVar10;
    (&DAT_000ace1b)[iVar19] = uVar11;
    (&DAT_000ace1c)[iVar19] = uVar8;
    (&DAT_000ace1d)[iVar19] = uVar9;
    (&DAT_000ace1e)[iVar19] = uVar10;
    (&DAT_000ace1f)[iVar19] = uVar11;
    iVar16 = iVar32 * 0xc;
    (&DAT_000a85d8)[iVar16] = (char)uVar21;
    (&DAT_000a85d9)[iVar16] = uVar12;
    (&DAT_000a85da)[iVar16] = uVar13;
    (&DAT_000a85db)[iVar16] = uVar14;
    (&DAT_000a85e0)[iVar16] = (char)uVar20;
    DAT_000a85d0 = iVar33 + 4;
    (&DAT_000a85e1)[iVar16] = uVar5;
    DAT_0023b838 = DAT_000a85d0;
    (&DAT_000a85e2)[iVar16] = uVar6;
    (&DAT_000a85e3)[iVar16] = uVar7;
    (&DAT_000a85dc)[iVar16] = 0;
    (&DAT_000a85dd)[iVar16] = 0;
    (&DAT_000a85de)[iVar16] = 0x80;
    (&DAT_000a85df)[iVar16] = 0x44;
    (&DAT_000acdf4)[iVar19] = (char)iVar32;
    (&DAT_000acdf5)[iVar19] = (char)((uint)iVar32 >> 8);
    iVar16 = DAT_00086e6c;
    (&DAT_000acdf6)[iVar19] = (char)((uint)iVar32 >> 0x10);
    (&DAT_000acdf7)[iVar19] = (char)((uint)iVar32 >> 0x18);
    (&DAT_000ace20)[iVar19] = uVar8;
    (&DAT_000ace21)[iVar19] = uVar9;
    (&DAT_000ace22)[iVar19] = uVar10;
    (&DAT_000ace23)[iVar19] = uVar11;
    (&DAT_000ace24)[iVar19] = 0;
    (&DAT_000ace25)[iVar19] = 0;
    (&DAT_000ace26)[iVar19] = 0;
    (&DAT_000ace27)[iVar19] = 0;
    (&DAT_000acde4)[iVar19] = 4;
    (&DAT_000acde5)[iVar19] = 0;
    (&DAT_000acde6)[iVar19] = 0;
    (&DAT_000acde7)[iVar19] = 0;
    if (!g_uw_hide_walls) {
      DAT_000a85d4 = DAT_0023b83c + 1;
      DAT_0023b83c = DAT_000a85d4;
    }
  }
  DAT_0023b818 = 0;
  local_54 = 0;
  puVar23 = DAT_0023b4ec;
  uVar27 = 0x40;
  local_83 = DAT_0023b4e0;
  bVar25 = DAT_0023b4e0;
  do {
    if (((short)uVar27 >> 1 & (ushort)local_48) != 0) {
      iVar33 = local_54 * 6;
      if ((DAT_0023b820[1] & uVar27) == 0) {
        local_81 = 0x10;
        local_80 = 0x10;
        iVar16 = ((-uVar1 & 0xff) - (uint)*(byte *)(UW_B50_LIT(0x86b90) + local_54 * 5 + local_4c)) + 0x10;
      }
      else {
        local_81 = (byte)puVar23[*(short *)(&DAT_00086a00 +
                                           (DAT_0023b4a0 * 3 + (uint)(byte)(&DAT_00086c00)[local_54]
                                           ) * 2) * 2] >> 4;
        uVar28 = (byte)(&DAT_00086a20)
                       [((byte)puVar23[*(short *)(&DAT_00086a00 +
                                                 (DAT_0023b4a0 * 3 +
                                                 (uint)(byte)(&DAT_00086c00)[local_54]) * 2) * 2] &
                        0xf) + DAT_0023b4a0 * 0x10] - 6;
        if (((&DAT_000878d0)
             [(byte)(&DAT_00086a20)
                    [((byte)puVar23[*(short *)(&DAT_00086a00 +
                                              (DAT_0023b4a0 * 3 +
                                              (uint)(byte)(&DAT_00086c00)[local_54]) * 2) * 2] & 0xf
                     ) + DAT_0023b4a0 * 0x10]] & 0x20) != 0x20) {
          uVar28 = 4;
        }
        uVar28 = uVar28 & 0xff;
        iVar16 = (((uint)*(byte *)(UW_B50_LIT(0x86b90) + (local_54 + 3) * 5 + uVar28) -
                  (uint)*(byte *)(UW_B50_LIT(0x86b90) + local_54 * 5 + local_4c)) - uVar1) + (uint)local_81;
        local_80 = *(char *)((uint)(byte)(&DAT_00086b88)[local_54] + uVar28 * 4 + UW_B50_LIT(0x86b70)) +
                   local_81;
        local_81 = *(char *)((uint)(byte)(&DAT_00086b84)[local_54] + uVar28 * 4 + UW_B50_LIT(0x86b70)) +
                   local_81;
        bVar25 = local_83;
      }
      /* UW1 tile word2 (bytes 2-3) bits 0-5 = wall texture index; word1's
         high byte (byte 1) holds the floor texture / height and was almost
         always 0 here, so every wall drew arena slot 0 (plain grey) instead
         of the level's real -- often mossy -- wall texture. Ghidra read the
         wrong byte. (automap_reveal_byte / the floor path correctly take the
         floor index from byte 1 bits 2-5.) */
      (*DAT_0023b4d4)(auStack_50,bVar25,iVar16,(byte)puVar23[2] & 0x3f);
      uVar26 = (ushort)DAT_0023b4e0;
      bVar25 = (byte)g_current_tile->wall_tex;
      if ((short)uVar26 < DAT_00086b24) {
        DAT_0023b81c = 4;
        if ((uVar26 != 0) || (DAT_00087938 != 'd')) {
          DAT_0023b81c = DAT_00086b30 + 4;
        }
        DAT_0023b4d8 = 0x1000;
        DAT_0023b824 = 0x40;
        sVar31 = (ushort)bVar15 << 10;
      }
      else {
        bVar39 = uVar26 != 0;
        psVar29 = (short *)0x0;
        if (bVar39) {
          psVar29 = &DAT_00086b30;
        }
        DAT_0023b81c = 0;
        bVar25 = bVar25 + 0x3a;
        if (bVar39) {
          psVar29 = (short *)(int)*psVar29;
        }
        if (bVar39) {
          DAT_0023b81c = (short)psVar29;
        }
        sVar31 = (ushort)bVar15 << 6;
        DAT_0023b4d8 = 0x100;
        DAT_0023b824 = 0x10;
      }
      DAT_0023b828 = sVar31 + -1;
      iVar16 = DAT_0023b83c * 0x60;
      uVar24 = (undefined1)DAT_0023b824;
      (&DAT_000ace00)[iVar16] = uVar24;
      (&DAT_000ace01)[iVar16] = 0;
      (&DAT_000ace02)[iVar16] = 0;
      (&DAT_000ace03)[iVar16] = 0;
      (&DAT_000ace04)[iVar16] = uVar24;
      (&DAT_000ace05)[iVar16] = 0;
      (&DAT_000ace06)[iVar16] = 0;
      (&DAT_000ace07)[iVar16] = 0;
      { void *_tp = get_texture_page(bVar25); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
      iVar32 = DAT_0023b83c;
      iVar18 = DAT_0023b83c * 0x60;
      (&DAT_000acdfc)[iVar18] = (char)uVar17;
      (&DAT_000acdfd)[iVar18] = (char)((uint)uVar17 >> 8);
      (&DAT_000acdfe)[iVar18] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000acdff)[iVar18] = (char)((uint)uVar17 >> 0x18);
      sVar31 = DAT_000da47c;
      (&DAT_000ace30)[iVar18] = (char)DAT_000da47c;
      iVar19 = (int)DAT_0023b4e4;
      (&DAT_000ace31)[iVar18] = (char)((ushort)sVar31 >> 8);
      cVar2 = (char)(sVar31 >> 0xf);
      (&DAT_000ace32)[iVar18] = cVar2;
      (&DAT_000ace33)[iVar18] = cVar2;
      local_34 = iVar18;
      local_44 = ordfloat_int_to_float2((iVar19 + (uint)(byte)(&DAT_00086bb0)[iVar33]) * 0x100);
      iVar16 = DAT_0023b838;
      iVar34 = DAT_0023b838 * 0xc;
      (&DAT_000a85d8)[iVar34] = (char)local_44;
      (&DAT_000a85d9)[iVar34] = (char)((uint)local_44 >> 8);
      iVar30 = (int)DAT_0023b4e8;
      (&DAT_000a85da)[iVar34] = (char)((uint)local_44 >> 0x10);
      (&DAT_000a85db)[iVar34] = (char)((uint)local_44 >> 0x18);
      local_40 = ordfloat_int_to_float2((iVar30 + (uint)(byte)(&DAT_00086bb1)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar34] = (char)local_40;
      (&DAT_000a85e1)[iVar34] = (char)((uint)local_40 >> 8);
      (&DAT_000a85e2)[iVar34] = (char)((uint)local_40 >> 0x10);
      (&DAT_000a85e3)[iVar34] = (char)((uint)local_40 >> 0x18);
      uVar28 = (uint)local_81 * 0x40;
      uVar22 = 0x400;
      if (local_81 == 0x10 || uVar28 < 0x400) {
        uVar22 = uVar28;
      }
      uVar17 = ordfloat_int_to_float2(uVar22);
      (&DAT_000a85dc)[iVar34] = (char)uVar17;
      (&DAT_000a85dd)[iVar34] = (char)((uint)uVar17 >> 8);
      iVar38 = (int)DAT_0023b824;
      (&DAT_000a85de)[iVar34] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000a85df)[iVar34] = (char)((uint)uVar17 >> 0x18);
      (&DAT_000acde8)[iVar18] = (char)iVar16;
      (&DAT_000acde9)[iVar18] = (char)((uint)iVar16 >> 8);
      (&DAT_000acdea)[iVar18] = (char)((uint)iVar16 >> 0x10);
      (&DAT_000acdeb)[iVar18] = (char)((uint)iVar16 >> 0x18);
      (&DAT_000ace08)[iVar18] = 0;
      (&DAT_000ace09)[iVar18] = 0;
      (&DAT_000ace0a)[iVar18] = 0;
      (&DAT_000ace0b)[iVar18] = 0;
      uVar17 = ordfloat_int_to_float2(iVar38 + -1);
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar34));
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      (&DAT_000ace0c)[iVar18] = (char)uVar20;
      iVar36 = iVar16 + 1;
      DAT_0023b838 = iVar36;
      (&DAT_000ace0d)[iVar18] = (char)((uint)uVar20 >> 8);
      (&DAT_000ace0e)[iVar18] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace0f)[iVar18] = (char)((uint)uVar20 >> 0x18);
      iVar34 = iVar36 * 0xc;
      (&DAT_000a85d8)[iVar34] = (char)local_44;
      (&DAT_000a85d9)[iVar34] = (char)((uint)local_44 >> 8);
      (&DAT_000a85da)[iVar34] = (char)((uint)local_44 >> 0x10);
      (&DAT_000a85db)[iVar34] = (char)((uint)local_44 >> 0x18);
      (&DAT_000a85e0)[iVar34] = (char)local_40;
      (&DAT_000a85e1)[iVar34] = (char)((uint)local_40 >> 8);
      (&DAT_000a85e2)[iVar34] = (char)((uint)local_40 >> 0x10);
      (&DAT_000a85e3)[iVar34] = (char)((uint)local_40 >> 0x18);
      uVar20 = ordfloat_int_to_float2((uVar1 + pbVar35[(byte)(&DAT_00086bb2)[iVar33]]) * 0x40);
      (&DAT_000a85dc)[iVar34] = (char)uVar20;
      (&DAT_000a85dd)[iVar34] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85de)[iVar34] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85df)[iVar34] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000acdec)[iVar18] = (char)iVar36;
      (&DAT_000acded)[iVar18] = (char)((uint)iVar36 >> 8);
      (&DAT_000acdee)[iVar18] = (char)((uint)iVar36 >> 0x10);
      (&DAT_000acdef)[iVar18] = (char)((uint)iVar36 >> 0x18);
      (&DAT_000ace10)[iVar18] = 0;
      (&DAT_000ace11)[iVar18] = 0;
      (&DAT_000ace12)[iVar18] = 0;
      (&DAT_000ace13)[iVar18] = 0;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar34));
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      (&DAT_000ace14)[iVar18] = (char)uVar20;
      iVar34 = iVar16 + 2;
      DAT_0023b838 = iVar34;
      (&DAT_000ace15)[iVar18] = (char)((uint)uVar20 >> 8);
      (&DAT_000ace16)[iVar18] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace17)[iVar18] = (char)((uint)uVar20 >> 0x18);
      local_3c = ordfloat_int_to_float2((iVar19 + (uint)(byte)(&DAT_00086bb3)[iVar33]) * 0x100);
      iVar19 = iVar34 * 0xc;
      (&DAT_000a85d8)[iVar19] = (char)local_3c;
      (&DAT_000a85d9)[iVar19] = (char)((uint)local_3c >> 8);
      (&DAT_000a85da)[iVar19] = (char)((uint)local_3c >> 0x10);
      (&DAT_000a85db)[iVar19] = (char)((uint)local_3c >> 0x18);
      local_38 = ordfloat_int_to_float2((iVar30 + (uint)(byte)(&DAT_00086bb4)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar19] = (char)local_38;
      (&DAT_000a85e1)[iVar19] = (char)((uint)local_38 >> 8);
      (&DAT_000a85e2)[iVar19] = (char)((uint)local_38 >> 0x10);
      (&DAT_000a85e3)[iVar19] = (char)((uint)local_38 >> 0x18);
      uVar20 = ordfloat_int_to_float2((uVar1 + pbVar35[(byte)(&DAT_00086bb5)[iVar33]]) * 0x40);
      (&DAT_000a85dc)[iVar19] = (char)uVar20;
      (&DAT_000a85dd)[iVar19] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85de)[iVar19] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85df)[iVar19] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000acdf0)[iVar18] = (char)iVar34;
      (&DAT_000acdf1)[iVar18] = (char)((uint)iVar34 >> 8);
      (&DAT_000acdf2)[iVar18] = (char)((uint)iVar34 >> 0x10);
      (&DAT_000acdf3)[iVar18] = (char)((uint)iVar34 >> 0x18);
      iVar33 = iVar38 + -1;
      (&DAT_000ace18)[iVar18] = (char)iVar33;
      uVar24 = (undefined1)((uint)iVar33 >> 8);
      (&DAT_000ace19)[iVar18] = uVar24;
      uVar3 = (undefined1)((uint)iVar33 >> 0x10);
      (&DAT_000ace1a)[iVar18] = uVar3;
      uVar4 = (undefined1)((uint)iVar33 >> 0x18);
      (&DAT_000ace1b)[iVar18] = uVar4;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar19));
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      (&DAT_000ace1c)[iVar18] = (char)uVar20;
      iVar30 = iVar16 + 3;
      (&DAT_000ace1d)[iVar18] = (char)((uint)uVar20 >> 8);
      (&DAT_000ace1e)[iVar18] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace1f)[iVar18] = (char)((uint)uVar20 >> 0x18);
      iVar19 = iVar30 * 0xc;
      (&DAT_000a85d8)[iVar19] = (char)local_3c;
      (&DAT_000a85d9)[iVar19] = (char)((uint)local_3c >> 8);
      (&DAT_000a85da)[iVar19] = (char)((uint)local_3c >> 0x10);
      (&DAT_000a85db)[iVar19] = (char)((uint)local_3c >> 0x18);
      (&DAT_000a85e0)[iVar19] = (char)local_38;
      (&DAT_000a85e1)[iVar19] = (char)((uint)local_38 >> 8);
      (&DAT_000a85e2)[iVar19] = (char)((uint)local_38 >> 0x10);
      (&DAT_000a85e3)[iVar19] = (char)((uint)local_38 >> 0x18);
      uVar28 = (uint)local_80 * 0x40;
      if (local_80 != 0x10 && 0x3ff < uVar28) {
        uVar28 = 0x400;
      }
      uVar20 = ordfloat_int_to_float2(uVar28);
      (&DAT_000a85dc)[iVar19] = (char)uVar20;
      (&DAT_000a85dd)[iVar19] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85de)[iVar19] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85df)[iVar19] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000acdf4)[iVar18] = (char)iVar30;
      (&DAT_000acdf5)[iVar18] = (char)((uint)iVar30 >> 8);
      (&DAT_000acdf6)[iVar18] = (char)((uint)iVar30 >> 0x10);
      (&DAT_000acdf7)[iVar18] = (char)((uint)iVar30 >> 0x18);
      (&DAT_000ace20)[iVar18] = (char)iVar33;
      (&DAT_000ace21)[iVar18] = uVar24;
      (&DAT_000ace22)[iVar18] = uVar3;
      (&DAT_000ace23)[iVar18] = uVar4;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar19));
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      (&DAT_000ace24)[iVar18] = (char)uVar17;
      (&DAT_000ace25)[iVar18] = (char)((uint)uVar17 >> 8);
      (&DAT_000ace26)[iVar18] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000ace27)[iVar18] = (char)((uint)uVar17 >> 0x18);
      DAT_000a85d0 = iVar16 + 4;
      DAT_0023b838 = DAT_000a85d0;
      while ((*(int *)(&DAT_000ace14 + local_34) < 0 || (*(int *)(&DAT_000ace1c + local_34) < 0))) {
        iVar33 = *(int *)(&DAT_000ace0c + local_34) + iVar38;
        (&DAT_000ace0c)[iVar18] = (char)iVar33;
        (&DAT_000ace0d)[iVar18] = (char)((uint)iVar33 >> 8);
        (&DAT_000ace0e)[iVar18] = (char)((uint)iVar33 >> 0x10);
        (&DAT_000ace0f)[iVar18] = (char)((uint)iVar33 >> 0x18);
        iVar33 = *(int *)(&DAT_000ace14 + local_34) + iVar38;
        (&DAT_000ace14)[iVar18] = (char)iVar33;
        (&DAT_000ace15)[iVar18] = (char)((uint)iVar33 >> 8);
        (&DAT_000ace16)[iVar18] = (char)((uint)iVar33 >> 0x10);
        (&DAT_000ace17)[iVar18] = (char)((uint)iVar33 >> 0x18);
        iVar33 = *(int *)(&DAT_000ace1c + local_34) + iVar38;
        (&DAT_000ace1c)[iVar18] = (char)iVar33;
        (&DAT_000ace1d)[iVar18] = (char)((uint)iVar33 >> 8);
        (&DAT_000ace1e)[iVar18] = (char)((uint)iVar33 >> 0x10);
        (&DAT_000ace1f)[iVar18] = (char)((uint)iVar33 >> 0x18);
        iVar33 = *(int *)(&DAT_000ace24 + local_34) + iVar38;
        (&DAT_000ace24)[iVar18] = (char)iVar33;
        (&DAT_000ace25)[iVar18] = (char)((uint)iVar33 >> 8);
        (&DAT_000ace26)[iVar18] = (char)((uint)iVar33 >> 0x10);
        (&DAT_000ace27)[iVar18] = (char)((uint)iVar33 >> 0x18);
      }
      (&DAT_000acde4)[iVar18] = 4;
      (&DAT_000acde5)[iVar18] = 0;
      (&DAT_000acde6)[iVar18] = 0;
      (&DAT_000acde7)[iVar18] = 0;
      if (!g_uw_hide_walls) DAT_000a85d4 = iVar32 + 1;
      local_83 = DAT_0023b4e0;
      puVar23 = DAT_0023b4ec;
      iVar16 = DAT_00086e6c;
      bVar25 = DAT_0023b4e0;
      if (!g_uw_hide_walls) DAT_0023b83c = DAT_000a85d4;
    }
    local_54 = local_54 + 1 & 0xff;
    uVar27 = (short)uVar27 >> 1;
  } while (local_54 < 3);
  if (local_30 == 0x44) {
    iVar33 = (local_48 & 3) * 6;
    pcVar37 = &DAT_00086bc8 + iVar33;
    if ((((int)*pcVar37 + (int)DAT_0023b4e4 + -0x10) * 0x100 - (int)*(short *)(iVar16 + 10)) *
        (int)(char)(&DAT_00086bcc)[iVar33] +
        (((int)(char)(&DAT_00086bc9)[iVar33] + (int)DAT_0023b4e8) * 0x100 -
        (int)*(short *)(iVar16 + 0x12)) * (int)(char)(&DAT_00086bcd)[iVar33] < 0) {
      /* diagonal-wall face: same wall-texture-index byte fix as the
         orthogonal branch above (word2 byte 2 bits 0-5, not byte 1). */
      (*DAT_0023b4d4)(auStack_50,bVar25,0x10 - (uint)bVar15,(byte)puVar23[2] & 0x3f);
      uVar27 = (ushort)DAT_0023b4e0;
      bVar25 = (byte)g_current_tile->wall_tex;
      if ((short)uVar27 < DAT_00086b24) {
        DAT_0023b81c = 4;
        if ((uVar27 != 0) || (DAT_00087938 != 'd')) {
          DAT_0023b81c = DAT_00086b30 + 4;
        }
        DAT_0023b4d8 = 0x1000;
        sVar31 = (ushort)bVar15 << 10;
        DAT_0023b824 = 0x40;
      }
      else {
        bVar39 = uVar27 != 0;
        psVar29 = (short *)0x0;
        if (bVar39) {
          psVar29 = &DAT_00086b30;
        }
        DAT_0023b81c = 0;
        if (bVar39) {
          psVar29 = (short *)(int)*psVar29;
        }
        sVar31 = (ushort)bVar15 << 6;
        bVar25 = bVar25 + 0x3a;
        if (bVar39) {
          DAT_0023b81c = (short)psVar29;
        }
        DAT_0023b4d8 = 0x100;
        DAT_0023b824 = 0x10;
      }
      DAT_0023b828 = sVar31 + -1;
      iVar16 = DAT_0023b83c * 0x60;
      uVar24 = (undefined1)DAT_0023b824;
      (&DAT_000ace00)[iVar16] = uVar24;
      (&DAT_000ace01)[iVar16] = 0;
      (&DAT_000ace02)[iVar16] = 0;
      (&DAT_000ace03)[iVar16] = 0;
      (&DAT_000ace04)[iVar16] = uVar24;
      (&DAT_000ace05)[iVar16] = 0;
      (&DAT_000ace06)[iVar16] = 0;
      (&DAT_000ace07)[iVar16] = 0;
      { void *_tp = get_texture_page(bVar25); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
      iVar34 = DAT_0023b83c * 0x60;
      (&DAT_000acdfc)[iVar34] = (char)uVar17;
      (&DAT_000acdfd)[iVar34] = (char)((uint)uVar17 >> 8);
      (&DAT_000acdfe)[iVar34] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000acdff)[iVar34] = (char)((uint)uVar17 >> 0x18);
      sVar31 = DAT_000da47c;
      (&DAT_000ace30)[iVar34] = (char)DAT_000da47c;
      iVar38 = (int)DAT_0023b4e4;
      (&DAT_000ace31)[iVar34] = (char)((ushort)sVar31 >> 8);
      cVar2 = (char)(sVar31 >> 0xf);
      (&DAT_000ace32)[iVar34] = cVar2;
      (&DAT_000ace33)[iVar34] = cVar2;
      iVar32 = DAT_0023b838 * 0xc;
      uVar17 = ordfloat_int_to_float2((iVar38 + *pcVar37) * 0x100);
      (&DAT_000a85d8)[iVar32] = (char)uVar17;
      (&DAT_000a85d9)[iVar32] = (char)((uint)uVar17 >> 8);
      iVar18 = (int)DAT_0023b4e8;
      (&DAT_000a85da)[iVar32] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000a85db)[iVar32] = (char)((uint)uVar17 >> 0x18);
      uVar17 = ordfloat_int_to_float2((iVar18 + (char)(&DAT_00086bc9)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar32] = (char)uVar17;
      (&DAT_000a85e1)[iVar32] = (char)((uint)uVar17 >> 8);
      (&DAT_000a85e2)[iVar32] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000a85e3)[iVar32] = (char)((uint)uVar17 >> 0x18);
      (&DAT_000a85dc)[iVar32] = 0;
      (&DAT_000a85dd)[iVar32] = 0;
      (&DAT_000a85de)[iVar32] = 0x80;
      (&DAT_000a85df)[iVar32] = 0x44;
      iVar16 = DAT_0023b838;
      (&DAT_000acde8)[iVar34] = (char)DAT_0023b838;
      (&DAT_000acde9)[iVar34] = (char)((uint)iVar16 >> 8);
      (&DAT_000acdea)[iVar34] = (char)((uint)iVar16 >> 0x10);
      (&DAT_000acdeb)[iVar34] = (char)((uint)iVar16 >> 0x18);
      (&DAT_000ace08)[iVar34] = 0;
      (&DAT_000ace09)[iVar34] = 0;
      (&DAT_000ace0a)[iVar34] = 0;
      (&DAT_000ace0b)[iVar34] = 0;
      iVar19 = DAT_0023b824 + -1;
      /* Ghidra dropped the argument: this is ordfloat_int_to_float2(iVar19), the
         int->float of (texture_size - 1) used as the V-texcoord scale for
         all four corners of this tile-emit branch -- exactly as the sibling
         branch does at the `ordfloat_int_to_float2(iVar38 + -1)` site above. Left
         no-arg, uVar17 took a stale register (the 512.0f / 1024.0f literal
         bit pattern from the projection scratch), so every V texcoord this
         branch emitted came out as ~1.14e9 -> the back-wall dither and
         part of the ceiling breakup in the 3D view. */
      uVar17 = ordfloat_int_to_float2(iVar19);
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar32));
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      (&DAT_000ace0c)[iVar34] = (char)uVar20;
      (&DAT_000ace0d)[iVar34] = (char)((uint)uVar20 >> 8);
      iVar32 = iVar16 + 1;
      DAT_0023b838 = iVar32;
      (&DAT_000ace0e)[iVar34] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace0f)[iVar34] = (char)((uint)uVar20 >> 0x18);
      iVar30 = iVar32 * 0xc;
      uVar20 = ordfloat_int_to_float2((iVar38 + *pcVar37) * 0x100);
      (&DAT_000a85d8)[iVar30] = (char)uVar20;
      (&DAT_000a85d9)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85da)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85db)[iVar30] = (char)((uint)uVar20 >> 0x18);
      uVar20 = ordfloat_int_to_float2((iVar18 + (char)(&DAT_00086bc9)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar30] = (char)uVar20;
      (&DAT_000a85e1)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85e2)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85e3)[iVar30] = (char)((uint)uVar20 >> 0x18);
      local_30 = ordfloat_int_to_float2(uVar1 << 6);
      (&DAT_000a85dc)[iVar30] = (char)local_30;
      (&DAT_000a85dd)[iVar30] = (char)(local_30 >> 8);
      (&DAT_000a85de)[iVar30] = (char)(local_30 >> 0x10);
      (&DAT_000a85df)[iVar30] = (char)(local_30 >> 0x18);
      (&DAT_000acdec)[iVar34] = (char)iVar32;
      (&DAT_000acded)[iVar34] = (char)((uint)iVar32 >> 8);
      (&DAT_000acdee)[iVar34] = (char)((uint)iVar32 >> 0x10);
      (&DAT_000acdef)[iVar34] = (char)((uint)iVar32 >> 0x18);
      (&DAT_000ace10)[iVar34] = 0;
      (&DAT_000ace11)[iVar34] = 0;
      (&DAT_000ace12)[iVar34] = 0;
      (&DAT_000ace13)[iVar34] = 0;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar30));
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      (&DAT_000ace14)[iVar34] = (char)uVar20;
      (&DAT_000ace15)[iVar34] = (char)((uint)uVar20 >> 8);
      iVar32 = iVar16 + 2;
      DAT_0023b838 = iVar32;
      (&DAT_000ace16)[iVar34] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace17)[iVar34] = (char)((uint)uVar20 >> 0x18);
      iVar30 = iVar32 * 0xc;
      uVar20 = ordfloat_int_to_float2((iVar38 + (char)(&DAT_00086bca)[iVar33]) * 0x100);
      (&DAT_000a85d8)[iVar30] = (char)uVar20;
      (&DAT_000a85d9)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85da)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85db)[iVar30] = (char)((uint)uVar20 >> 0x18);
      uVar20 = ordfloat_int_to_float2((iVar18 + (char)(&DAT_00086bcb)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar30] = (char)uVar20;
      (&DAT_000a85e1)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85e2)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85e3)[iVar30] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000a85dc)[iVar30] = (char)local_30;
      (&DAT_000a85dd)[iVar30] = (char)(local_30 >> 8);
      (&DAT_000a85de)[iVar30] = (char)(local_30 >> 0x10);
      (&DAT_000a85df)[iVar30] = (char)(local_30 >> 0x18);
      (&DAT_000acdf0)[iVar34] = (char)iVar32;
      (&DAT_000acdf1)[iVar34] = (char)((uint)iVar32 >> 8);
      (&DAT_000acdf2)[iVar34] = (char)((uint)iVar32 >> 0x10);
      (&DAT_000acdf3)[iVar34] = (char)((uint)iVar32 >> 0x18);
      (&DAT_000ace18)[iVar34] = (char)iVar19;
      uVar24 = (undefined1)((uint)iVar19 >> 8);
      (&DAT_000ace19)[iVar34] = uVar24;
      uVar3 = (undefined1)((uint)iVar19 >> 0x10);
      (&DAT_000ace1a)[iVar34] = uVar3;
      uVar4 = (undefined1)((uint)iVar19 >> 0x18);
      (&DAT_000ace1b)[iVar34] = uVar4;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar30));
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      (&DAT_000ace1c)[iVar34] = (char)uVar20;
      (&DAT_000ace1d)[iVar34] = (char)((uint)uVar20 >> 8);
      iVar32 = iVar16 + 3;
      DAT_0023b838 = iVar32;
      (&DAT_000ace1e)[iVar34] = (char)((uint)uVar20 >> 0x10);
      iVar30 = iVar32 * 0xc;
      (&DAT_000ace1f)[iVar34] = (char)((uint)uVar20 >> 0x18);
      uVar20 = ordfloat_int_to_float2((iVar38 + (char)(&DAT_00086bca)[iVar33]) * 0x100);
      (&DAT_000a85d8)[iVar30] = (char)uVar20;
      (&DAT_000a85d9)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85da)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85db)[iVar30] = (char)((uint)uVar20 >> 0x18);
      uVar20 = ordfloat_int_to_float2((iVar18 + (char)(&DAT_00086bcb)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar30] = (char)uVar20;
      (&DAT_000a85e1)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85e2)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85e3)[iVar30] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000a85dc)[iVar30] = 0;
      (&DAT_000a85dd)[iVar30] = 0;
      (&DAT_000a85de)[iVar30] = 0x80;
      (&DAT_000a85df)[iVar30] = 0x44;
      (&DAT_000acdf4)[iVar34] = (char)iVar32;
      (&DAT_000acdf5)[iVar34] = (char)((uint)iVar32 >> 8);
      (&DAT_000acdf6)[iVar34] = (char)((uint)iVar32 >> 0x10);
      (&DAT_000acdf7)[iVar34] = (char)((uint)iVar32 >> 0x18);
      (&DAT_000ace20)[iVar34] = (char)iVar19;
      (&DAT_000ace21)[iVar34] = uVar24;
      (&DAT_000ace22)[iVar34] = uVar3;
      (&DAT_000ace23)[iVar34] = uVar4;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar30));
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      (&DAT_000ace24)[iVar34] = (char)uVar17;
      (&DAT_000ace25)[iVar34] = (char)((uint)uVar17 >> 8);
      DAT_000a85d0 = iVar16 + 4;
      DAT_0023b838 = DAT_000a85d0;
      (&DAT_000ace26)[iVar34] = (char)((uint)uVar17 >> 0x10);
      if (!g_uw_hide_walls) {
        DAT_000a85d4 = DAT_0023b83c + 1;
        DAT_0023b83c = DAT_000a85d4;
      }
      (&DAT_000ace27)[iVar34] = (char)((uint)uVar17 >> 0x18);
      (&DAT_000acde4)[iVar34] = 4;
      (&DAT_000acde5)[iVar34] = 0;
      (&DAT_000acde6)[iVar34] = 0;
      (&DAT_000acde7)[iVar34] = 0;
      puVar23 = DAT_0023b4ec;
    }
  }
  /* emit_tile_features renders this tile's animated features and the objects
     sitting on it (doors, switches, bridges, item billboards). It used to
     walk a bogus object count and deref a NULL slot from get_object_record_by_slot_index
     because of dropped-arg bugs in it and its callees; those are fixed, so
     it now runs by default. Set UW_DISABLE_TILE_FEATURES to skip it (the
     wall / floor / diagonal geometry for the tile is already emitted above
     via the DAT_0023b4f4/b80c/b4d4 calls). */
  {
    static int _tile_features = -1;
    if (_tile_features < 0)
      _tile_features = (getenv("UW_DISABLE_TILE_FEATURES") == NULL);
    if (_tile_features) {
      emit_tile_features(puVar23 + 1);
    }
  }
  cVar2 = DAT_0023b834;
  if (((puVar23 + 1 != (ushort *)0x0) && (DAT_0023b834 != '\0')) &&
     (DAT_0023b834 = '\0', DAT_0023b4e0 < 8)) {
    local_84 = cVar2 << 6 | local_84;
  }
  if (DAT_00086b20 != 0) {
    *param_1 = local_84;
  }
  return;
}




// Was `int`, truncating the real DAT_002029cc pointer arithmetic result below
// (same pointer-truncation pattern fixed elsewhere this session).
// was FUN_00068100 -- (tileX,tileY) -> 4-byte tile record ptr in the level map, NULL if either coord is outside 0..63
void *tilemap_lookup(param_1,param_2)
short param_1;
short param_2;

{
  char *iVar1;

  /* DAT_002029cc is set once, early (init_level_object_arena/
     reset_level_object_arena, a real malloc'd pointer via ce_malloc),
     but has been separately observed (init_gameplay_session's own comment) to no
     longer hold that pointer by later points in a session -- some other
     write elsewhere in this file lands on its storage, a real,
     documented, not-yet-root-caused bug. init_gameplay_session already guards
     its own use with this same bounds check; tilemap_lookup is the
     single shared accessor behind 70+ call sites, so guard here too
     rather than just the one caller -- confirmed live crashing via a
     wild dereference several calls downstream (object_list_insert_head)
     the first time NPC AI (sync_object_tile_position, reached only after this
     session's other npc_ai_tick/tick_mobile_objects fixes) called this with
     DAT_002029cc already corrupted. Treat a corrupted base the same as
     an out-of-range coordinate: every caller already has to tolerate
     this function's documented NULL return. */
  if ((((int)param_2 & 0xffffffc0U) + ((int)param_1 & 0xffffffc0U) == 0) &&
      ((uintptr_t)DAT_002029cc >= 0x10000)) {
    iVar1 = DAT_002029cc + ((int)param_1 + param_2 * 0x40) * 4;
  }
  else {
    iVar1 = 0;
  }
  return iVar1;
}




// was FUN_00064d34 -- tracks which phase of the per-ring wall/tile
// scan is current (recorded in DAT_0023bb94, read back by bitmap.c's
// sprite-vs-wall depth-partition dispatch) and maintains a rolling
// window of up to 8 recent wall-edge entries
// (DAT_0023b908/DAT_0023b928) across ring boundaries: mode -10/2 does
// a full reset, mode 1 copies the current window into the "previous"
// slot, mode 0 appends the ring's own edge data (trimmed to the 8-
// entry cap). Called once per ring phase from walk_visible_tiles.
// Exact consumer semantics of the wall-edge data are not fully traced
// -- named for its role in the state machine, not a confirmed meaning
// of the buffer contents themselves.
void update_wall_partition_phase(param_1)
char param_1;

{
  uint uVar1;
  uint uVar2;

  if (param_1 == -10) {
    ce_memset(&DAT_0023b940,0,0x252);
  }
  else {
    if (param_1 == '\0') {
      uVar1 = (uint)DAT_0023b908;
      if (uVar1 == 0) {
        DAT_0023bb94 = param_1;
        return;
      }
      uVar2 = (uint)DAT_0023b928;
      if (8 < uVar2 + uVar1) {
        uVar1 = 8 - uVar2;
        DAT_0023b908 = (ushort)uVar1;
      }
      ce_memmove(&DAT_0023b928 + uVar2 + 1,&DAT_0023b90a,(uVar1 & 0xffff) << 1);
      DAT_0023b928 = DAT_0023b928 + (short)uVar1;
      DAT_0023bb94 = param_1;
      return;
    }
    if (param_1 == '\x01') {
      ce_memmove(&DAT_0023b908,&DAT_0023b928,0x12);
      DAT_0023b928 = 0;
      DAT_0023bb94 = param_1;
      return;
    }
    if (param_1 != '\x02') {
      DAT_0023bb94 = param_1;
      return;
    }
  }
  ce_memset(&DAT_0023b908,0,0x12);
  ce_memset(&DAT_0023b928,0,0x12);
  DAT_0023bb94 = param_1;
  return;
}




// was FUN_00064e3c -- bubble-sorts adjacent-index pairs in
// DAT_0023b8c8/DAT_0023b8c9 (see the array-layout comment on their
// declaration) over [param_1, param_2) by each entry's depth key
// (compute_feature_depth_key's output, cached in DAT_0023bb98). Part
// of emit_tile_features' per-tile object/feature draw-order sort.
void sort_feature_pairs_by_depth(param_1,param_2)
short param_1;
int param_2;

{
  int iVar1;
  int iVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = (param_2 + -1) * 0x10000 >> 0x10;
  iVar1 = (int)param_1;
  if (iVar1 <= iVar5) {
    iVar4 = iVar1;
    if (iVar5 < iVar1) goto LAB_00064ea8;
    do {
      do {
        cVar3 = (&DAT_0023b8c8)[iVar4];
        iVar2 = (iVar4 + 1) * 0x10000 >> 0x10;
        if ((char)(&DAT_0023bb98)[cVar3 * 4] <
            (char)(&DAT_0023bb98)[(char)(&DAT_0023b8c9)[iVar4] * 4]) {
          (&DAT_0023b8c8)[iVar4] = (&DAT_0023b8c9)[iVar4];
          (&DAT_0023b8c9)[iVar4] = cVar3;
        }
        iVar4 = iVar2;
      } while (iVar2 <= iVar5);
LAB_00064ea8:
      iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
      iVar4 = iVar1;
    } while (iVar1 <= iVar5);
  }
  return;
}



// was FUN_00064ec8 -- initializes DAT_0023b8c8[0..param_1) to the
// identity order (0,1,2,...) before sort_feature_pairs_by_depth
// reorders it.
void init_feature_sort_order(param_1)
short param_1;

{
  int iVar1;
  
  iVar1 = 0;
  if (0 < param_1) {
    do {
      (&DAT_0023b8c8)[iVar1] = (char)iVar1;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    } while (iVar1 < param_1);
  }
  return;
}



/* param_1 (out record) and param_2 (src record) were `int`, truncating
   the real pointers emit_tile_features passes. */
// was FUN_00065210 -- computes a rotated-quad corner's screen X/Y
// offset (param_1[1]/[2]) from a source feature record's facing byte
// (param_2[3]) via the DAT_00086d68/DAT_00086d69 per-view-facing
// corner-index remap table, plus copies a masked flag byte
// (param_2[2] & 0x7f) into param_1[3].
void resolve_billboard_corner_offset(param_1,param_2)
byte *param_1;
byte *param_2;

{
  *(undefined *)(param_1 + 1) =
       (&DAT_00086d68)[((uint)(*(byte *)(param_2 + 3) >> 5) + DAT_0023b4a0 * 8) * 2] +
       (&DAT_00086d68)[((*(byte *)(param_2 + 3) >> 2 & 7) + ((int)DAT_0023b4a0 + 1U & 3) * 8) * 2];
  *(undefined *)(param_1 + 2) =
       (&DAT_00086d69)[((uint)(*(byte *)(param_2 + 3) >> 5) + DAT_0023b4a0 * 8) * 2] +
       (&DAT_00086d69)[((*(byte *)(param_2 + 3) >> 2 & 7) + ((int)DAT_0023b4a0 + 1U & 3) * 8) * 2];
  *(byte *)(param_1 + 3) = *(byte *)(param_2 + 2) & 0x7f;
  return;
}



// was FUN_000652e8 -- computes a feature's draw-order depth key
// (written to param_1[0]) from its X/Y offsets (param_1[1]/[2]),
// combined differently depending on which ring-scan phase is current
// (DAT_0023bb94, see update_wall_partition_phase). Feeds
// sort_feature_pairs_by_depth via DAT_0023bb98.
void compute_feature_depth_key(param_1)
char * param_1;

{
  char cVar1;
  
  if (DAT_0023bb94 == '\0') {
    cVar1 = param_1[2] << 1;
  }
  else if (DAT_0023bb94 == '\x01') {
    cVar1 = param_1[2] + param_1[1] + '\x01';
  }
  else {
    if (DAT_0023bb94 != '\x02') {
      return;
    }
    cVar1 = ('\b' - param_1[1]) + param_1[2];
  }
  *param_1 = cVar1;
  return;
}



// was FUN_00065348 -- flushes any still-pending per-tile feature
// records (a nonzero feature count at the current DAT_0023b940 slot,
// or a nonzero DAT_0023b928 wall-partition entry) via
// emit_tile_features, so nothing queued gets silently dropped.
void flush_pending_tile_features()

{
  if (*(short *)(&DAT_0023b940 + DAT_0023b4e4 * 0x12) != 0) {
    emit_tile_features(0);
  }
  if (DAT_0023b928 != 0) {
    emit_tile_features(0);
  }
  return;
}



// was FUN_00065394
void emit_tile_features(param_1)
ushort * param_1;

{
  int iVar1;
  uint uVar2;
  short sVar3;
  char *puVar4;  /* was `undefined4 uVar4` -- truncated get_object_record_by_slot_index's
                    real pointer before forwarding it into
                    resolve_billboard_corner_offset, which dereferences it (offset+2/+3).
                    Confirmed live: the automap full-level sweep
                    (demo_automap.txt) crashed here on tile (23,8), the
                    first tile whose feature-object slot value made
                    get_object_record_by_slot_index actually resolve to a real, non-null
                    pointer. */
  ushort *puVar5;
  ushort *puVar6;
  int iVar7;
  char cVar8;
  ushort uVar9;
  uint uVar10;
  ushort uVar11;
  ushort uVar12;
  int iVar13;
  char *pcVar14;
  int iVar15;
  int iVar16;
  short local_38;
  short local_36;
  undefined4 local_34;
  int local_30;

  local_34 = local_34 & 0xffff0000;
  iVar13 = 0;
  local_36 = -1;
  iVar16 = 0;
  iVar7 = 1;
  local_38 = 0;
  iVar15 = (int)DAT_0023b4e4;
  if (*(short *)(&DAT_0023b940 + iVar15 * 0x12) != 0) {
    do {
      iVar1 = (int)(short)iVar13;
      if (8 < iVar1) break;
      uVar9 = *(ushort *)(&DAT_0023b940 + (iVar15 * 9 + (int)(short)iVar7) * 2);
      (&DAT_0023b848)[iVar1] = uVar9 & 0x3ff;
      /* Ghidra dropped the object-slot arg -- with it defaulting to 0,
         get_object_record_by_slot_index returned NULL and resolve_billboard_corner_offset below dereferenced it,
         which is why the whole tile-features/object pass was disabled.
         Pass the slot id just stored, like the other get_object_record_by_slot_index call
         sites in this function. */
      puVar4 = (char *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[iVar1]);
      iVar15 = iVar1 * 4;
      pcVar14 = &DAT_0023bb98 + iVar15;
      /* get_object_record_by_slot_index legitimately returns NULL for a slot value that
         isn't a currently-populated object (unlike the dropped-arg bug
         fixed just above, this is a real "nothing here" case, not a
         truncation/garbage-argument one) -- resolve_billboard_corner_offset dereferences
         its second argument immediately, so skip it rather than
         crashing. Confirmed live: demo_automap.txt's full-level sweep
         crashed here on tile (30,17), the first tile whose feature
         slot resolved to a genuinely empty object. */
      if (puVar4 != NULL) {
        resolve_billboard_corner_offset(pcVar14,puVar4);
      }
      if ((uVar9 & 0x1000) != 0) {
        if ((uVar9 & 0x2000) == 0) {
          cVar8 = (&DAT_0023bb99)[iVar15] + '\b';
        }
        else {
          cVar8 = (&DAT_0023bb99)[iVar15] + -8;
        }
        (&DAT_0023bb99)[iVar15] = cVar8;
      }
      if ((uVar9 & 0x4000) != 0) {
        (&DAT_0023bb9a)[iVar15] = (&DAT_0023bb9a)[iVar15] + '\b';
      }
      compute_feature_depth_key(pcVar14);
      if ((uVar9 & 0x8000) != 0) {
        *pcVar14 = *pcVar14 + -1;
      }
      local_38 = (short)((uint)((iVar1 + 1) * 0x10000) >> 0x10);
      iVar13 = (int)local_38;
      iVar7 = ((short)iVar7 + 1) * 0x10000 >> 0x10;
      iVar15 = (int)DAT_0023b4e4;
    } while (iVar7 <= (int)(uint)*(ushort *)(&DAT_0023b940 + iVar15 * 0x12));
  }
  if (DAT_0023b928 == 0) {
    *(undefined2 *)(&DAT_0023b940 + DAT_0023b4e4 * 0x12) = 0;
  }
  else {
    /* Ghidra dropped the size argument; the zero-branch above writes the
       same destination as a plain `undefined2`, so this is a 2-byte
       copy. */
    ce_memmove(&DAT_0023b940 + DAT_0023b4e4 * 0x12,&DAT_0023b928,2);
  }
  DAT_0023b928 = 0;
  puVar5 = (ushort *)resolve_object_link(param_1);
  do {
    sVar3 = (short)iVar13;
    if ((puVar5 == (ushort *)0x0) || (local_30 = (int)(short)iVar16, 0x3b < local_30)) {
      uVar10 = local_34;
      if (((ushort)local_34 == 0) || (uVar10 = (uint)sVar3, (int)uVar10 < 2)) {
        local_34 = uVar10;
        init_feature_sort_order(iVar13);
        local_34 = (uint)sVar3;
        uVar10 = local_34;
        if (1 < (int)local_34) {
          sort_feature_pairs_by_depth(0,iVar13 + -1);
          uVar10 = local_34;
        }
      }
      else {
        uVar9 = (ushort)local_34 & 0x3f;
        local_34 = uVar10;
        if (((ushort)local_34 & 0xffc0) == 0x5900) {
          sprite_partition_tmap(uVar9,&local_36,iVar13);  /* args dropped by Ghidra; mirrors the sprite_partition_by_depth call below */
        }
        else {
          sprite_partition_by_depth(uVar9,&local_36,iVar13);
        }
        iVar15 = (int)local_36;
        if (1 < local_36) {
          sort_feature_pairs_by_depth(0,iVar15 + -1);
          iVar15 = (int)local_36;
        }
        if ((int)(short)iVar15 < (int)(uVar10 - 2)) {
          sort_feature_pairs_by_depth(iVar15 + 1,iVar13 + -1);
        }
      }
      if (0 < (int)uVar10) {
        iVar15 = 0;
        do {
          cVar8 = (&DAT_0023b8c8)[iVar15];
          puVar5 = (ushort *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[cVar8]);
          /* Same "get_object_record_by_slot_index can legitimately return NULL for an
             empty slot" case as the fix above -- this loop dereferences
             puVar5 immediately below (and passes it to
             emit_tile_objects), so skip this index instead of crashing. */
          if (puVar5 == (ushort *)0x0) {
            iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
            continue;
          }
          iVar7 = cVar8 * 4;
          if (getenv("UW_DEBUG_OBJPOS") && puVar5 && (*puVar5 & 0x1ff) == 0x166)
            fprintf(stderr, "[objpos] cVar8=%d iVar7=%d bb99=%d bb9a=%d b4e4=%d b4e8=%d\n",
                    (int)cVar8, iVar7, (int)(char)(&DAT_0023bb99)[iVar7], (int)(char)(&DAT_0023bb9a)[iVar7],
                    (int)DAT_0023b4e4, (int)DAT_0023b4e8);
          if (getenv("UW_DEBUG_DOOR_POS") && puVar5 && (*puVar5 & 0x1f0) == 0x140)
            fprintf(stderr, "[doorpos] tile-grid: cVar8=%d slot_x=%d slot_z=%d b4e4(tileX)=%d b4e8(tileZ)=%d tile_origin=(%d,%d)\n",
                    (int)cVar8, (int)(char)(&DAT_0023bb99)[iVar7], (int)(char)(&DAT_0023bb9a)[iVar7],
                    (int)DAT_0023b4e4, (int)DAT_0023b4e8,
                    (int)DAT_0023b4e4 * 256, (int)DAT_0023b4e8 * 256);
          DAT_0023b904 = ((short)(char)(&DAT_0023bb99)[iVar7] +
                         (short)((uint)((int)DAT_0023b4e4 << 0x13) >> 0x10)) * 0x20 + 0x10;
          DAT_0023b920 = ((short)(char)(&DAT_0023bb9a)[iVar7] +
                         (short)((uint)((int)DAT_0023b4e8 << 0x13) >> 0x10)) * 0x20 + 0x10;
          if (((*puVar5 & 0x1c0) == 0x40) || (iVar16 = object_ptr_in_arena(puVar5), iVar16 == 0)) {
            DAT_0023b91c = ((byte)puVar5[1] & 0x7f) << 3;
          }
          else {
            DAT_0023b91c = *(short *)((char *)puVar5 + 0xf);
          }
          if (getenv("UW_DEBUG_THROW") && (*puVar5 & 0x1ff) == 0x80)
            fprintf(stderr, "[throw-scrz] sack DAT_0023b91c=%d cam_ref(DAT_00086e6c+0xe)=%d in_arena=%d\n",
                    (int)(short)DAT_0023b91c, (int)g_current_view->view_elevation,
                    (int)object_ptr_in_arena(puVar5));
          if (DAT_0023b830 == '\0') {
            iVar7 = (int)(short)((int)((int)DAT_0023b904 -
                                      ((int)g_current_view->view_x & 0xffU)) >> 5);
            iVar16 = (int)(short)((int)((int)DAT_0023b920 -
                                       ((int)g_current_view->view_y & 0xffU)) >> 5);
            iVar13 = (int)(short)((int)DAT_0023b91c - (int)g_current_view->view_elevation >> 5);
            if (((iVar7 * iVar7 * 0x10000 >> 0x10) + (iVar16 * iVar16 * 0x10000 >> 0x10) +
                (iVar13 * iVar13 * 0x10000 >> 0x10)) * 0x10000 >> 0x10 < 1) {
              sVar3 = 0;
            }
            else {
              /* HACK: was a bare `integer_sqrt();` -- dropped argument,
                 the same class of bug fixed repeatedly elsewhere in
                 this file. The if-condition just above computes this
                 exact 3D distance-squared expression and only takes
                 this branch when it's nonzero -- obviously the
                 intended argument here, matching every other
                 confirmed integer_sqrt call site's own
                 "distance squared in, distance out" shape. */
              sVar3 = integer_sqrt(((iVar7 * iVar7 * 0x10000 >> 0x10) + (iVar16 * iVar16 * 0x10000 >> 0x10) +
                (iVar13 * iVar13 * 0x10000 >> 0x10)) * 0x10000 >> 0x10);
            }
            iVar7 = (int)DAT_002506dc + (int)(short)((int)DAT_0025063c * (int)sVar3 >> 6);
            sVar3 = (short)iVar7;
            if (iVar7 * 0x10000 >> 0x10 < 0) {
              sVar3 = 0;
            }
            DAT_0023bc88 = (undefined1)((int)DAT_0025064c + (int)sVar3);
            if (0xe < ((int)DAT_0025064c + (int)sVar3 & 0xffU)) {
              DAT_0023bc88 = 0xe;
            }
          }
          else {
            iVar16 = (char)(&DAT_0023bb99)[iVar7] + 0x40;
            if (iVar16 < 0) {
              iVar16 = (char)(&DAT_0023bb99)[iVar7] + 0x47;
            }
            iVar7 = (int)(char)(&DAT_0023bb9a)[iVar7];
            if (iVar7 < 0) {
              iVar7 = iVar7 + 7;
            }
            DAT_0023b8c4 = ((short)(iVar16 >> 3) + -8) * DAT_0023bc8c +
                           (short)(iVar7 >> 3) * DAT_0023b8c0;
          }
          emit_tile_objects(puVar5);
          iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
        } while (iVar15 < (int)local_34);
      }
      return;
    }
    uVar10 = (uint)(short)(*puVar5 & 0x1ff);
    if ((uVar10 == 0x164) || (((*puVar5 & 0x1f0) == 0x140 || (uVar10 == 0x1cf)))) {
      uVar2 = local_34 >> 0x10;
      local_34 = CONCAT22((short)uVar2,sVar3 + (short)((uVar10 << 0x16) >> 0x10));
LAB_0006574c:
      iVar15 = (int)sVar3;
      pcVar14 = &DAT_0023bb98 + iVar15 * 4;
      resolve_billboard_corner_offset(pcVar14,puVar5);
LAB_00065770:
      compute_feature_depth_key(pcVar14);
      if ((uVar10 & 0x1c0) == 0x1c0) {
        cVar8 = *pcVar14 + -1;
LAB_000657b0:
        *pcVar14 = cVar8;
      }
      else if ((uVar10 & 0x1fe) == 0x16e) {
        cVar8 = *pcVar14 + ' ';
        goto LAB_000657b0;
      }
      (&DAT_0023b848)[iVar15] = *param_1 >> 6;
      if (iVar15 < 0x3c) {
        local_38 = (short)((uint)((iVar15 + 1) * 0x10000) >> 0x10);
        goto LAB_000657f4;
      }
    }
    else {
      if (((&DAT_00202c91)[uVar10 * 0xd] & 8) == 0) goto LAB_0006574c;
      iVar15 = (int)local_38;
      uVar11 = 0;
      iVar7 = iVar15 * 4;
      pcVar14 = &DAT_0023bb98 + iVar7;
      resolve_billboard_corner_offset(pcVar14,puVar5);
      uVar9 = (byte)(&DAT_00202c91)[uVar10 * 0xd] & 7;
      if ((int)(char)(&DAT_0023bb9a)[iVar7] - (int)(short)uVar9 < 0) {
        uVar11 = 0x4000;
      }
      if (DAT_0023bb94 == '\x01') {
        uVar9 = (ushort)((uint)((short)uVar9 * -0x10000) >> 0x10);
      }
      uVar12 = uVar11;
      if (((DAT_0023bb94 != '\0') &&
          (((int)(char)(&DAT_0023bb99)[iVar7] + (int)(short)uVar9 & 0xfffffff8U) != 0)) &&
         (uVar12 = uVar11 | 0x1000, DAT_0023bb94 == '\x02')) {
        uVar12 = uVar11 | 0x3000;
      }
      if (uVar12 == 0) {
LAB_0006576c:
        iVar13 = (int)local_38;
        goto LAB_00065770;
      }
      uVar12 = uVar12 | *param_1 >> 6;
      if ((uVar10 & 0x1c0) == 0x1c0) {
        uVar12 = uVar12 | 0x8000;
      }
      if ((uVar12 & 0x5000) == 0x5000) {
        puVar6 = (ushort *)&DAT_0023b928;
      }
      else {
        if ((uVar12 & 0x4000) == 0) {
          if ((uVar12 & 0x2000) == 0) {
            puVar6 = (ushort *)(&DAT_0023b92e + DAT_0023b4e4 * 0x12);
            goto LAB_0006570c;
          }
          iVar7 = DAT_0023b4e4 + 1;
        }
        else {
          iVar7 = (int)DAT_0023b4e4;
        }
        puVar6 = (ushort *)(&DAT_0023b940 + iVar7 * 0x12);
      }
LAB_0006570c:
      if (8 < *puVar6) goto LAB_0006576c;
      uVar9 = *puVar6 + 1;
      *puVar6 = uVar9;
      puVar6[uVar9] = uVar12;
LAB_000657f4:
      iVar13 = (int)local_38;
    }
    param_1 = puVar5 + 2;
    /* Ghidra dropped the arg -- advance to the next object in the tile's
       chain via the link field at puVar5+2 (== param_1), same as the
       resolve_object_link(param_1) call that primes this loop. */
    puVar5 = (ushort *)resolve_object_link(param_1);
    iVar16 = (local_30 + 1) * 0x10000 >> 0x10;
  } while( true );
}







// was FUN_00073b18 -- struct-recovery-plan.md: converts a
// uw_tile_t.no_magic read (was `*(byte*)(tile+1) >> 6 & 1`, bit 6 of
// byte 1 = overall bit 14 = no_magic per uw_tile_t's own field-
// confirmed layout) to the real struct field.
/* was declared with empty parens and called tilemap_lookup() with no
   explicit args, relying on its 2 real args still sitting in the same
   ABI registers/stack slots at the nested call (a K&R "dropped-arg"
   register-forwarding idiom used elsewhere in this file, e.g. the
   DAT_0023aecc fix). Every one of this function's 6 call sites passes
   exactly 2 args -- fragile on this host's calling convention:
   intermittently (~1/18 runs) an intervening op clobbered the forwarded
   registers before reaching tilemap_lookup, corrupting its args and
   crashing tile_is_no_magic + 16 (demo_critter_orbit_cardinal.txt). Given
   real declared parameters and forwarded explicitly instead. */
byte tile_is_no_magic(param_1,param_2)
int param_1;
int param_2;

{
  uw_tile_t *tile = (uw_tile_t *)tilemap_lookup(param_1,param_2);
  return tile->no_magic;
}


/* Return type was `int`, truncating the real 64-bit pointer every
   caller casts back to (byte *) and dereferences. */
// was FUN_00040c5c
void *get_texture_page(param_1)
short param_1;

{
  int iVar1;
  char **ppcVar2;

  iVar1 = (int)param_1;
  if (iVar1 < 0x30) {
    return DAT_0023ae38 + iVar1 * 0x1000;
  }
  if (iVar1 < 0x3a) {
    return DAT_0023ae34 + (iVar1 + -0x30) * 0x400;
  }
  if (iVar1 < 0x6a) {
    iVar1 = iVar1 + -0x3a;
    ppcVar2 = &DAT_0023ae3c;
  }
  else {
    if (0x73 < iVar1) {
      return 0;
    }
    iVar1 = iVar1 + -0x6a;
    ppcVar2 = &DAT_0023ae30;
  }
  return *ppcVar2 + iVar1 * 0x100;
}


// was FUN_00060aa0
void emit_tile_objects(param_1)
ushort * param_1;

{
  byte bVar1;
  char cVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  undefined1 uVar7;
  undefined1 uVar8;
  undefined1 uVar9;
  undefined1 uVar10;
  undefined1 uVar11;
  ushort *puVar12;
  byte bVar13;
  bool bVar14;
  undefined2 uVar15;
  ushort uVar16;
  int iVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  int iVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  int extraout_r1;
  undefined *puVar26;
  uint uVar27;
  int iVar28;
  uint uVar29;
  undefined4 uVar30;
  int iVar31;
  int iVar32;
  int iVar33;
  int iVar34;
  int iVar35;
  ushort local_54;
  
  if (getenv("UW_DEBUG_THROW") && ((*param_1 & 0x1ff) == 0x80 || (*param_1 & 0x1ff) == 0x16e))
    fprintf(stderr, "[throw-emit] ENTER param_1=%p type=0x%x is_player=%d flag4000=%d in_arena=%d DAT_002046c4=%p\n",
            (void *)param_1, (unsigned)(*param_1 & 0x1ff), param_1 == g_player_object,
            (*param_1 & 0x4000) == 0x4000, (int)object_ptr_in_arena((char *)param_1), (void *)DAT_002046c4);
  if (param_1 == g_player_object) {
    return;
  }
  if ((*param_1 & 0x4000) == 0x4000) {
    return;
  }
  if (DAT_0023b830 != 0) {
    *(short *)((intptr_t)g_pick_tile_off_backing + (uint)DAT_0023b830 * 2 + 2) =
         DAT_0023b8c4 + (short)(DAT_0023b4ec - DAT_0023b814 >> 2);
    uVar15 = encode_object_slot_index(param_1);
    puVar12 = DAT_00110fc0;
    *(undefined2 *)(&DAT_0023b676 + (uint)DAT_0023b830 * 2) = uVar15;
    *puVar12 = 0xae;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)DAT_0023b830;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    bVar13 = DAT_0023b830 + 1;
    DAT_000da47c = (ushort)DAT_0023b830;
    DAT_0023b830 = bVar13;
    if (0xbf < bVar13) {
      DAT_0023b830 = 1;
    }
  }
  iVar17 = object_ptr_in_arena(param_1);
  if ((iVar17 != 0) && ((*param_1 & 0x1c0) != 0x40)) {
    bVar13 = *(byte *)((char *)param_1 + 0xb);
    bVar1 = *(byte *)((char *)param_1 + 0xd);
    if (DAT_0023b4a0 == '\0') {
      local_54 = (ushort)bVar13;
      uVar16 = (ushort)bVar1;
    }
    else if (DAT_0023b4a0 == '\x01') {
      local_54 = 0xff - bVar1;
      uVar16 = (ushort)bVar13;
    }
    else if (DAT_0023b4a0 == '\x02') {
      local_54 = 0xff - bVar13;
      uVar16 = 0xff - bVar1;
    }
    else {
      uVar16 = local_54;
      if (DAT_0023b4a0 == '\x03') {
        local_54 = (ushort)bVar1;
        uVar16 = 0xff - bVar13;
      }
    }
    DAT_0023b904 = (DAT_0023b904 & 0xff00) + local_54;
    DAT_0023b920 = (DAT_0023b920 & 0xff00) + uVar16;
  }
  if (getenv("UW_LOOK_SLOT")) {
    static int _done = 0;
    if (!_done) {
      _done = 1;
      int _slot = atoi(getenv("UW_LOOK_SLOT"));
      ushort *_rec = (ushort *)(_slot < 0x100 ? (void *)((intptr_t)_slot * 0x1b + (intptr_t)DAT_002046b8)
                                               : (void *)((intptr_t)DAT_002046c4 + (intptr_t)(_slot - 0x100) * 8));
      ushort _w0 = *_rec;
      int _id = _w0 & 0x1ff;
      int _iv = _id * 0xd;
      int _grp = (byte)(&DAT_00202c9b)[_iv] & 0xf;
      int _qual = (byte)_rec[2] & 0x3f;
      int _off = 0;
      if (_qual != 0) {
        _off = (((&DAT_00202c97)[_iv] & 0xc) == 0xc) ? 5 : (((byte)_rec[2] >> 4 & 3) + 1);
      }
      char *_nm = (char *)get_message_string(_grp * 6 + _off | 0xa00);
      fprintf(stderr, "[lookslot] slot=%d id=0x%03x flags=0x%04x has_lookbit=%d namegrp=%d name='%s'\n",
              _slot, _id, (unsigned)_w0, g_object_type_props[_id].has_look_description, _grp, _nm ? _nm : "(null)");
    }
  }
  if (getenv("UW_DUMP_OBJECTS")) {
    static int _dumped = 0;
    if (!_dumped) {
      _dumped = 1;
      /* Walk every tile's object chain (tile record = 4 bytes at
       * DAT_002029cc[tile_idx*4], chain head = ushort at +2, matching
       * set_player_tile_position's object_list_unlink(DAT_002029cc +
       * tile_idx*4 + 2, ...)) so found objects come with real tile
       * coordinates, rather than scanning the raw slot table blind. Each
       * object record's own "next in this tile's chain" link is a
       * separate ushort at +6 within the record (not the type word at
       * +0 -- confirmed by the `resolve_object_link(param_1 + 6)` call
       * sites fixed earlier this session), both encoding the next slot
       * as (link >> 6). */
      int _tx, _ty;
      for (_ty = 0; _ty < 0x40; _ty++) {
        for (_tx = 0; _tx < 0x40; _tx++) {
          int _tidx = _tx + _ty * 0x40;
          ushort _head = *(ushort *)((intptr_t)DAT_002029cc + _tidx * 4 + 2);
          int _slot = (_head & 0xffc0) != 0 ? _head >> 6 : 0;
          int _guard = 0;
          while (_slot != 0 && _guard++ < 64) {
            void *_rec = _slot < 0x100 ? (void *)((intptr_t)_slot * 0x1b + (intptr_t)DAT_002046b8)
                                        : (void *)((intptr_t)DAT_002046c4 + (intptr_t)(_slot - 0x100) * 8);
            ushort _w = *(ushort *)_rec;
            int _id = _w & 0x1ff;
            if ((_id >= 0x160 && _id <= 0x16f) || _id == 0x140 || _id == 0x141) {
              fprintf(stderr, "[objdump] tile=(%d,%d) slot=%d id=0x%03x flags=0x%04x\n",
                      _tx, _ty, _slot, _id, (unsigned)_w);
            }
            {
              int _rc = (&DAT_00202c9a)[_id * 0xd] & 3;
              if (_rc == 1) {
                unsigned char *_recb = (unsigned char *)_rec;
                fprintf(stderr, "[objdump-critter] tile=(%d,%d) slot=%d id=0x%03x flags=0x%04x b6=0x%02x\n",
                        _tx, _ty, _slot, _id, (unsigned)_w, (unsigned)_recb[6]);
              }
            }
            ushort _nextw = *(ushort *)((char *)_rec + 6);
            _slot = (_nextw & 0xffc0) != 0 ? _nextw >> 6 : 0;
          }
        }
      }
      fprintf(stderr, "[objdump] scan complete\n");
    }
  }
  if (getenv("UW_DUMP_ALL_OBJECTS")) {
    static int _dumped2 = 0;
    if (!_dumped2) {
      _dumped2 = 1;
      int _tx, _ty;
      for (_ty = 0; _ty < 0x40; _ty++) {
        for (_tx = 0; _tx < 0x40; _tx++) {
          int _tidx = _tx + _ty * 0x40;
          ushort _head = *(ushort *)((intptr_t)DAT_002029cc + _tidx * 4 + 2);
          int _slot = (_head & 0xffc0) != 0 ? _head >> 6 : 0;
          int _guard = 0;
          while (_slot != 0 && _guard++ < 64) {
            void *_rec = _slot < 0x100 ? (void *)((intptr_t)_slot * 0x1b + (intptr_t)DAT_002046b8)
                                        : (void *)((intptr_t)DAT_002046c4 + (intptr_t)(_slot - 0x100) * 8);
            ushort _w = *(ushort *)_rec;
            int _id = _w & 0x1ff;
            int _iv = _id * 0xd;
            unsigned char *_prop = (unsigned char *)&DAT_00202c90_backing[_iv];
            fprintf(stderr, "[objdumpall] tile=(%d,%d) slot=%d id=0x%03x flags=0x%04x rc=%d prop=%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
                    _tx, _ty, _slot, _id, (unsigned)_w, _prop[0] & 3,
                    _prop[0], _prop[1], _prop[2], _prop[3], _prop[4], _prop[5], _prop[6],
                    _prop[7], _prop[8], _prop[9], _prop[0xa], _prop[0xb], _prop[0xc]);
            ushort _nextw = *(ushort *)((char *)_rec + 6);
            _slot = (_nextw & 0xffc0) != 0 ? _nextw >> 6 : 0;
          }
        }
      }
      fprintf(stderr, "[objdumpall] scan complete\n");
    }
  }
  // Level-load object census for debugging: every placed object's tile
  // position, id, resolved name, render class, and (if applicable) which
  // DATA3D model it now draws as. Gated the same way every other UW_DEBUG_*/
  // UW_DUMP_* hook in this file is: off by default so a normal run doesn't
  // pay for a 64x64-tile scan + file write on every level entry, and so
  // this file's exact wording is opt-in rather than something a screenshot-
  // diffing regression test would have to account for. Set to a file path
  // to enable; fires once, on the first object walked after level load.
  if (getenv("UW_DUMP_OBJECTS_FILE")) {
    static int _dumped_census = 0;
    if (!_dumped_census) {
      _dumped_census = 1;
      const char *_path = getenv("UW_DUMP_OBJECTS_FILE");
      FILE *_f = fopen(_path, "w");
      if (_f == NULL) {
        fprintf(stderr, "[objcensus] failed to open '%s' for writing\n", _path);
      } else {
        fprintf(_f, "tile_x\ttile_y\tid\tname\trenderclass\theading\tquality\tflags\n");
        int _tx, _ty, _count = 0;
        for (_ty = 0; _ty < 0x40; _ty++) {
          for (_tx = 0; _tx < 0x40; _tx++) {
            int _tidx = _tx + _ty * 0x40;
            ushort _head = *(ushort *)((intptr_t)DAT_002029cc + _tidx * 4 + 2);
            int _slot = (_head & 0xffc0) != 0 ? _head >> 6 : 0;
            int _guard = 0;
            while (_slot != 0 && _guard++ < 64) {
              ushort *_rec = _slot < 0x100 ? (ushort *)((intptr_t)_slot * 0x1b + (intptr_t)DAT_002046b8)
                                            : (ushort *)((intptr_t)DAT_002046c4 + (intptr_t)(_slot - 0x100) * 8);
              ushort _w = _rec[0];
              int _id = _w & 0x1ff;
              // Same field reads emit_tile_objects itself uses (not the
              // objdumpall hook above, which indexed the wrong property
              // byte for render class -- see its own "rc=" column, offset
              // 0 instead of the real 0xa).
              int _rc = (&DAT_00202c9a)[_id * 0xd] & 3;
              int _heading = (_rec[1] >> 6) & 7;
              int _quality = _rec[3] & 0x3f;
              // Page 4 of comobj's string data is the base object-name
              // table, indexed directly by id (see UW_DUMP_NAMES/this
              // session's findings) -- not the quality-adjective group
              // table UW_LOOK_SLOT resolves via namegrp*6+offset.
              char *_name = (char *)get_message_string(0x800 | _id);
              fprintf(_f, "%d\t%d\t0x%03x\t%s\t%d\t%d\t%d\t0x%04x\n",
                      _tx, _ty, _id, (_name && _name[0]) ? _name : "(unnamed)",
                      _rc, _heading, _quality, (unsigned)_w);
              _count++;
              ushort _nextw = *(ushort *)((char *)_rec + 6);
              _slot = (_nextw & 0xffc0) != 0 ? _nextw >> 6 : 0;
            }
          }
        }
        fclose(_f);
        fprintf(stderr, "[objcensus] wrote %d objects to '%s'\n", _count, _path);
      }
    }
  }
  // Debug tool (UW_DUMP_CONTAINERS_FILE): scan every tile's object chain
  // (correctly, via resolve_object_link + the real "next" field at
  // offset+4 -- NOT UW_DUMP_OBJECTS_FILE's own +6, which is actually the
  // "first item inside this container" field, not "next object on this
  // tile"; that census tool's re-use of +6 for both purposes is its own,
  // separate, lower-priority bug, left alone here since it's debug-only)
  // and lists every container's real contents. Written to verify whether
  // level load correctly preserves container contents end to end -- see
  // memory.md's "sack contents" finding.
  if (getenv("UW_DUMP_CONTAINERS_FILE")) {
    static int _dumped_containers = 0;
    if (!_dumped_containers) {
      _dumped_containers = 1;
      const char *_path = getenv("UW_DUMP_CONTAINERS_FILE");
      FILE *_f = fopen(_path, "w");
      if (_f == NULL) {
        fprintf(stderr, "[containercensus] failed to open '%s' for writing\n", _path);
      } else {
        fprintf(_f, "tile_x\ttile_y\tid\tname\tnum_items\titems\n");
        int _tx, _ty, _count = 0;
        for (_ty = 0; _ty < 0x40; _ty++) {
          for (_tx = 0; _tx < 0x40; _tx++) {
            int _tidx = _tx + _ty * 0x40;
            ushort *_headp = (ushort *)((char *)DAT_002029cc + _tidx * 4 + 2);
            ushort *_rec = (ushort *)resolve_object_link(_headp);
            int _guard = 0;
            while (_rec != NULL && _guard++ < 64) {
              ushort _w = *_rec;
              int _id = _w & 0x1ff;
              if ((_w & 0x1c0) == 0x80) {
                ushort *_item = (ushort *)resolve_object_link((ushort *)((char *)_rec + 6));
                char _names[256];
                _names[0] = '\0';
                int _n = 0, _guard2 = 0;
                while (_item != NULL && _guard2++ < 32) {
                  int _iid = *_item & 0x1ff;
                  char *_iname = (char *)get_message_string(0x800 | _iid);
                  strncat(_names, (_iname && _iname[0]) ? _iname : "?", sizeof(_names) - strlen(_names) - 2);
                  strncat(_names, ",", sizeof(_names) - strlen(_names) - 1);
                  _n++;
                  _item = (ushort *)resolve_object_link((ushort *)((char *)_item + 4));
                }
                char *_name = (char *)get_message_string(0x800 | _id);
                fprintf(_f, "%d\t%d\t0x%03x\t%s\t%d\t%s\n", _tx, _ty, _id,
                        (_name && _name[0]) ? _name : "(unnamed)", _n, _names);
                _count++;
              }
              _rec = (ushort *)resolve_object_link((ushort *)((char *)_rec + 4));
            }
          }
        }
        fclose(_f);
        fprintf(stderr, "[containercensus] wrote %d containers to '%s'\n", _count, _path);
      }
    }
  }
  if (getenv("UW_DUMP_NAMES")) {
    static int _dumped3 = 0;
    if (!_dumped3) {
      _dumped3 = 1;
      int _id, _pg;
      for (_pg = 0; _pg < 16; _pg++) {
        for (_id = 0; _id < 0x200; _id++) {
          char *_nm = (char *)get_message_string((_pg << 9) | _id);
          if (_nm && _nm[0]) {
            fprintf(stderr, "[names] page=%d id=0x%03x name='%s'\n", _pg, _id, _nm);
          }
        }
      }
      fprintf(stderr, "[names] scan complete\n");
    }
  }
  uVar27 = (uint)*param_1;
  bVar1 = (&DAT_00202c9a)[(uVar27 & 0x1ff) * 0xd];
  bVar13 = bVar1 & 3;
  if (getenv("UW_DEBUG_OBJCLASS")) {
    int _iv = (uVar27 & 0x1ff) * 0xd;
    int _grp = (byte)(&DAT_00202c9b)[_iv] & 0xf;
    fprintf(stderr, "[objclass] id=0x%03x renderclass=%d prop_byte=0x%02x quality=%d heading=%d namegrp=%d scrx=%d scry=%d scrz=%d names=",
            (int)(uVar27 & 0x1ff), (int)bVar13, (int)bVar1,
            (int)((byte)param_1[3] & 0x3f), (int)(param_1[1] >> 6 & 7), _grp,
            (int)(short)DAT_0023b904, (int)(short)DAT_0023b920, (int)(short)DAT_0023b91c);
    { int _k;
      for (_k = 0; _k < 6; _k++) {
        char *_n = (char *)get_message_string(_grp * 6 + _k | 0xa00);
        fprintf(stderr, "[%d]='%s' ", _k, _n ? _n : "(null)");
      }
    }
    fprintf(stderr, "\n");
  }
  if ((uVar27 & 0x1c0) == 0x1c0) {
    DAT_0023b804 = 1;
    uVar27 = (byte)param_1[3] & 0x3f;
    if ((bVar1 & 3) == 0) {
      if ((short)uVar27 == 0) {
        uVar27 = (int)(short)*param_1 & 0x1ff;
      }
      else {
        uVar27 = uVar27 + 0x1c0;
      }
    }
  }
  else {
    uVar27 = uVar27 & 0x1ff;
  }
  if ((bVar1 & 3) == 0) {
    if ((((ushort)uVar27 & 0x1e0) == 0xe0) && ((uVar27 & 0x18) != 0)) {
      uVar27 = 0xe0;
    }
LAB_emit_mesh_sprite_quad:
    /* Same arena-overflow risk as the tile-geometry guard a few hundred
       lines above this function (see its own comment for the full
       explanation of the ~512-vert/~490-record cap on DAT_000a85d0_backing)
       -- that guard only accounts for wall/floor geometry, not the
       object quad this label builds (4 verts / 1 record). Doors newly
       reaching this path (previously a dead end -- see the door-reroute
       comment above) add more objects than any single room exercised
       before, so guard this shared tail defensively too rather than
       assume the tile-level guard alone always leaves enough headroom.
       (A wild-Y-coordinate crash chased while testing this turned out
       to be an unrelated, pre-existing map-edge bug -- see
       [[map-edge-y-wraparound-crash]] -- not caused by this change; this
       guard is still worth keeping on its own merits.) */
    if (getenv("UW_DEBUG_THROW") && uVar27 == 0x80)
      fprintf(stderr, "[throw-render] sack (id=0x80) reached quad emit: DAT_0023b838(vtx)=%u DAT_0023b83c(rec)=%d cap=(508,489)\n",
              (unsigned)DAT_0023b838, (int)DAT_0023b83c);
    if ((int)(uint)DAT_0023b838 >= 512 - 4 || (int)DAT_0023b83c >= 490 - 1) {
      if (getenv("UW_DEBUG_THROW") && uVar27 == 0x80)
        fprintf(stderr, "[throw-render] sack (id=0x80) -> arena FULL, quad SKIPPED (never emitted)\n");
      return;
    }
    if (g_billboard_angle_override_deg >= 0) {
      /* A wall-mounted decal's anchor (DAT_0023b904/920) came out of
         emit_tile_features' generic per-slot floor-object table
         (DAT_0023bb99/9a[cVar8*4]) -- cVar8 is this object's position in
         a depth-*sorted* list of everything in the tile, so which slot
         (and therefore which sub-tile offset) THIS object lands in
         depends on where the camera is standing, not on the object
         itself. Confirmed live: the exact same object (identical
         param_1[1]=0x1770 raw record) got assigned bb99/bb9a=(0,5) from
         one standing spot (rendered flush) and (5,7) from two others
         (rendered rotated 90 degrees / invisible) -- same sign, jittering
         between different anchors depending on viewpoint. Floor items are
         fine with that (it's how multiple items in one tile avoid fully
         overlapping); a wall decal needs a fixed anchor. Round back down
         to the tile's own center (clear the low 5 bits -- one tile is
         0x20 units -- then re-add the +0x10 half-tile constant
         emit_tile_features' own formula ends with) to undo whatever
         sub-tile jitter this frame's slot happened to contribute, before
         pushing out to the wall surface along the wall's own normal
         (perpendicular to the facing direction g_billboard_angle_
         override_deg's tangent extrusion already uses). Without the push
         the quad is correctly oriented flush-with-the-wall (proven via
         [decalangle]'s 100%-constant angle_idx) but anchored in the open
         floor area of the tile instead of at the wall plane. Tunable via
         UW_DECAL_PUSH (magnitude, default 16 = half a tile) and
         UW_DECAL_PUSH_SIGN (+1/-1, default +1) while calibrating --
         applied here (before the DAT_00110fc0 pick/collision copy just
         below) so picking matches the pushed visual position too. */
      DAT_0023b904 = (DAT_0023b904 & ~0x1f) | 0x10;
      DAT_0023b920 = (DAT_0023b920 & ~0x1f) | 0x10;
      double _rad = (g_billboard_angle_override_deg + 90) * (3.14159265358979 / 180.0);
      int _mag = 16;
      int _sign = 1;
      { const char *_p = getenv("UW_DECAL_PUSH"); if (_p) _mag = atoi(_p); }
      { const char *_p = getenv("UW_DECAL_PUSH_SIGN"); if (_p) _sign = atoi(_p); }
      DAT_0023b904 = DAT_0023b904 + (short)lround(_sign * _mag * sin(_rad));
      DAT_0023b920 = DAT_0023b920 + (short)lround(_sign * _mag * cos(_rad));
    }
    *DAT_00110fc0 = 0x7a;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b904;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b920;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b91c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x7f8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    decode_tile_object_billboard_texture(uVar27,(uint)DAT_0023bc88 * (int)DAT_00086b30);
    /* DAT_000d9ed8/DAT_000d9930[angle] = sin/cos(angle degrees) (see
       build_trig_tables). Normally angle = DAT_000db44c, the CAMERA's yaw,
       which is what makes this quad extend along the camera's own
       right-vector -- i.e. always face the camera, a real billboard.
       A wall-mounted decal (emit_tile_objects's TMOBJ/sign branch)
       sets g_billboard_angle_override_deg to the WALL's own fixed
       facing angle instead, so the quad extends along the wall's
       plane and stays flush against it regardless of camera angle. */
    { int _angle_idx = DAT_000db44c;
      int _overridden = (g_billboard_angle_override_deg >= 0);
      if (_overridden) {
        _angle_idx = g_billboard_angle_override_deg;
        g_billboard_angle_override_deg = -1;
      }
      if (getenv("UW_DEBUG_OBJPOS") && (*param_1 & 0x1ff) == 0x166)
        fprintf(stderr, "[decalangle] overridden=%d angle_idx=%d cam_yaw=%d\n",
                _overridden, _angle_idx, (int)DAT_000db44c);
      uVar30 = (&DAT_000d9ed8)[_angle_idx];
      uVar18 = ordfloat_negate((&DAT_000d9930)[_angle_idx]);
    }
    iVar32 = (int)DAT_00202508;
    uVar19 = ordfloat_int_to_float2(iVar32 * -6);
    uVar19 = ordfloat_mul(uVar19,0x3f000000);
    uVar20 = ordfloat_negate(uVar19);
    uVar16 = DAT_000da47c;
    iVar28 = DAT_0023b83c * 0x60;
    (&DAT_000ace30)[iVar28] = (char)DAT_000da47c;
    iVar17 = (int)(short)DAT_0023b904;
    (&DAT_000ace31)[iVar28] = (char)(uVar16 >> 8);
    cVar2 = (char)((short)uVar16 >> 0xf);
    (&DAT_000ace32)[iVar28] = cVar2;
    (&DAT_000ace33)[iVar28] = cVar2;
    uVar21 = ordfloat_int_to_float2(iVar17);
    uVar22 = ordfloat_mul(uVar19,uVar30);
    uVar22 = ordfloat_add(uVar22,uVar21);
    uVar22 = ordfloat_add(uVar22,0);
    iVar17 = DAT_0023b838;
    iVar31 = DAT_0023b838 * 0xc;
    iVar23 = (int)(short)DAT_0023b920;
    (&DAT_000a85d8)[iVar31] = (char)uVar22;
    uVar3 = (undefined1)((uint)uVar22 >> 8);
    (&DAT_000a85d9)[iVar31] = uVar3;
    uVar4 = (undefined1)((uint)uVar22 >> 0x10);
    (&DAT_000a85da)[iVar31] = uVar4;
    uVar5 = (undefined1)((uint)uVar22 >> 0x18);
    (&DAT_000a85db)[iVar31] = uVar5;
    uVar24 = ordfloat_int_to_float2(iVar23);
    uVar19 = ordfloat_mul(uVar19,uVar18);
    uVar19 = ordfloat_add(uVar19,uVar24);
    uVar19 = ordfloat_add(uVar19,0);
    (&DAT_000a85e0)[iVar31] = (char)uVar19;
    uVar6 = (undefined1)((uint)uVar19 >> 8);
    (&DAT_000a85e1)[iVar31] = uVar6;
    iVar33 = (int)DAT_002022f8;
    uVar7 = (undefined1)((uint)uVar19 >> 0x10);
    (&DAT_000a85e2)[iVar31] = uVar7;
    iVar23 = (int)(short)DAT_0023b91c;
    uVar8 = (undefined1)((uint)uVar19 >> 0x18);
    (&DAT_000a85e3)[iVar31] = uVar8;
    uVar25 = ordfloat_int_to_float2(iVar33 * 6 + iVar23);
    (&DAT_000a85dc)[iVar31] = (char)uVar25;
    (&DAT_000a85dd)[iVar31] = (char)((uint)uVar25 >> 8);
    (&DAT_000a85de)[iVar31] = (char)((uint)uVar25 >> 0x10);
    (&DAT_000a85df)[iVar31] = (char)((uint)uVar25 >> 0x18);
    (&DAT_000acde8)[iVar28] = (char)iVar17;
    iVar34 = iVar17 + 1;
    (&DAT_000acde9)[iVar28] = (char)((uint)iVar17 >> 8);
    (&DAT_000acdea)[iVar28] = (char)((uint)iVar17 >> 0x10);
    (&DAT_000acdeb)[iVar28] = (char)((uint)iVar17 >> 0x18);
    (&DAT_000ace08)[iVar28] = 0;
    (&DAT_000ace09)[iVar28] = 0;
    (&DAT_000ace0a)[iVar28] = 0;
    (&DAT_000ace0b)[iVar28] = 0;
    (&DAT_000ace0c)[iVar28] = 0;
    (&DAT_000ace0d)[iVar28] = 0;
    (&DAT_000ace0e)[iVar28] = 0;
    (&DAT_000ace0f)[iVar28] = 0;
    iVar31 = iVar34 * 0xc;
    (&DAT_000a85d8)[iVar31] = (char)uVar22;
    (&DAT_000a85d9)[iVar31] = uVar3;
    (&DAT_000a85da)[iVar31] = uVar4;
    (&DAT_000a85db)[iVar31] = uVar5;
    (&DAT_000a85e0)[iVar31] = (char)uVar19;
    (&DAT_000a85e1)[iVar31] = uVar6;
    (&DAT_000a85e2)[iVar31] = uVar7;
    (&DAT_000a85e3)[iVar31] = uVar8;
    uVar19 = ordfloat_int_to_float2(iVar23);
    (&DAT_000a85dc)[iVar31] = (char)uVar19;
    uVar3 = (undefined1)((uint)uVar19 >> 8);
    (&DAT_000a85dd)[iVar31] = uVar3;
    uVar4 = (undefined1)((uint)uVar19 >> 0x10);
    (&DAT_000a85de)[iVar31] = uVar4;
    uVar5 = (undefined1)((uint)uVar19 >> 0x18);
    (&DAT_000a85df)[iVar31] = uVar5;
    (&DAT_000acdec)[iVar28] = (char)iVar34;
    (&DAT_000acded)[iVar28] = (char)((uint)iVar34 >> 8);
    (&DAT_000acdee)[iVar28] = (char)((uint)iVar34 >> 0x10);
    (&DAT_000acdef)[iVar28] = (char)((uint)iVar34 >> 0x18);
    (&DAT_000ace10)[iVar28] = 0;
    iVar23 = iVar33 + -1;
    iVar34 = iVar17 + 2;
    (&DAT_000ace11)[iVar28] = 0;
    (&DAT_000ace12)[iVar28] = 0;
    (&DAT_000ace13)[iVar28] = 0;
    (&DAT_000ace14)[iVar28] = (char)iVar23;
    (&DAT_000ace15)[iVar28] = (char)((uint)iVar23 >> 8);
    (&DAT_000ace16)[iVar28] = (char)((uint)iVar23 >> 0x10);
    (&DAT_000ace17)[iVar28] = (char)((uint)iVar23 >> 0x18);
    uVar22 = ordfloat_mul(uVar20,uVar30);
    uVar21 = ordfloat_add(uVar22,uVar21);
    uVar21 = ordfloat_add(uVar21,0);
    iVar23 = iVar34 * 0xc;
    (&DAT_000a85d8)[iVar23] = (char)uVar21;
    uVar6 = (undefined1)((uint)uVar21 >> 8);
    (&DAT_000a85d9)[iVar23] = uVar6;
    uVar7 = (undefined1)((uint)uVar21 >> 0x10);
    (&DAT_000a85da)[iVar23] = uVar7;
    uVar8 = (undefined1)((uint)uVar21 >> 0x18);
    (&DAT_000a85db)[iVar23] = uVar8;
    uVar18 = ordfloat_mul(uVar20,uVar18);
    uVar18 = ordfloat_add(uVar18,uVar24);
    uVar18 = ordfloat_add(uVar18,0);
    (&DAT_000a85e0)[iVar23] = (char)uVar18;
    uVar9 = (undefined1)((uint)uVar18 >> 8);
    (&DAT_000a85e1)[iVar23] = uVar9;
    uVar10 = (undefined1)((uint)uVar18 >> 0x10);
    (&DAT_000a85e2)[iVar23] = uVar10;
    uVar11 = (undefined1)((uint)uVar18 >> 0x18);
    (&DAT_000a85e3)[iVar23] = uVar11;
    (&DAT_000a85dc)[iVar23] = (char)uVar19;
    (&DAT_000a85dd)[iVar23] = uVar3;
    (&DAT_000a85de)[iVar23] = uVar4;
    (&DAT_000a85df)[iVar23] = uVar5;
    (&DAT_000acdf0)[iVar28] = (char)iVar34;
    (&DAT_000acdf1)[iVar28] = (char)((uint)iVar34 >> 8);
    (&DAT_000acdf2)[iVar28] = (char)((uint)iVar34 >> 0x10);
    iVar31 = iVar32 + -1;
    iVar23 = iVar33 + -1;
    (&DAT_000acdf3)[iVar28] = (char)((uint)iVar34 >> 0x18);
    (&DAT_000ace18)[iVar28] = (char)iVar31;
    (&DAT_000ace19)[iVar28] = (char)((uint)iVar31 >> 8);
    (&DAT_000ace1a)[iVar28] = (char)((uint)iVar31 >> 0x10);
    (&DAT_000ace1b)[iVar28] = (char)((uint)iVar31 >> 0x18);
    (&DAT_000ace1c)[iVar28] = (char)iVar23;
    (&DAT_000ace1d)[iVar28] = (char)((uint)iVar23 >> 8);
    (&DAT_000ace1e)[iVar28] = (char)((uint)iVar23 >> 0x10);
    (&DAT_000ace1f)[iVar28] = (char)((uint)iVar23 >> 0x18);
    iVar17 = iVar17 + 3;
    iVar23 = iVar17 * 0xc;
    puVar26 = &DAT_000a85d8 + iVar23;
    *puVar26 = (char)uVar21;
    (&DAT_000a85d9)[iVar23] = uVar6;
    (&DAT_000a85da)[iVar23] = uVar7;
    (&DAT_000a85db)[iVar23] = uVar8;
    (&DAT_000a85e0)[iVar23] = (char)uVar18;
    (&DAT_000a85e1)[iVar23] = uVar9;
    (&DAT_000a85e2)[iVar23] = uVar10;
    (&DAT_000a85e3)[iVar23] = uVar11;
LAB_00061d34:
    puVar26[4] = (char)uVar25;
    puVar26[5] = (char)((uint)uVar25 >> 8);
    puVar26[6] = (char)((uint)uVar25 >> 0x10);
    puVar26[7] = (char)((uint)uVar25 >> 0x18);
    (&DAT_000acdf4)[iVar28] = (char)iVar17;
    (&DAT_000acdf5)[iVar28] = (char)((uint)iVar17 >> 8);
    (&DAT_000acdf6)[iVar28] = (char)((uint)iVar17 >> 0x10);
    (&DAT_000acdf7)[iVar28] = (char)((uint)iVar17 >> 0x18);
    (&DAT_000ace20)[iVar28] = (char)iVar31;
    (&DAT_000ace21)[iVar28] = (char)((uint)iVar31 >> 8);
    (&DAT_000ace22)[iVar28] = (char)((uint)iVar31 >> 0x10);
    DAT_0023b838 = iVar17 + 1;
    (&DAT_000ace23)[iVar28] = (char)((uint)iVar31 >> 0x18);
    (&DAT_000ace24)[iVar28] = 0;
    uVar18 = DAT_002022fc;
    (&DAT_000ace25)[iVar28] = 0;
    (&DAT_000ace26)[iVar28] = 0;
    (&DAT_000ace27)[iVar28] = 0;
    (&DAT_000acde4)[iVar28] = 4;
    (&DAT_000acde5)[iVar28] = 0;
    (&DAT_000acde6)[iVar28] = 0;
    (&DAT_000acde7)[iVar28] = 0;
    (&DAT_000ace00)[iVar28] = (char)iVar32;
    (&DAT_000ace01)[iVar28] = (char)((uint)iVar32 >> 8);
    (&DAT_000ace02)[iVar28] = (char)((uint)iVar32 >> 0x10);
    (&DAT_000ace03)[iVar28] = (char)((uint)iVar32 >> 0x18);
    (&DAT_000ace04)[iVar28] = (char)iVar33;
    (&DAT_000ace05)[iVar28] = (char)((uint)iVar33 >> 8);
    (&DAT_000ace06)[iVar28] = (char)((uint)iVar33 >> 0x10);
    (&DAT_000ace07)[iVar28] = (char)((uint)iVar33 >> 0x18);
    (&DAT_000acdfc)[iVar28] = (char)uVar18;
    (&DAT_000acdfd)[iVar28] = (char)((uint)uVar18 >> 8);
    (&DAT_000acdfe)[iVar28] = (char)((uint)uVar18 >> 0x10);
    (&DAT_000acdff)[iVar28] = (char)((uint)uVar18 >> 0x18);
    DAT_0023b83c = DAT_0023b83c + 1;
    DAT_000a85d4 = DAT_0023b83c;
    DAT_000a85d0 = iVar17 + 1;
    if ((getenv("UW_DEBUG_OBJPOS") && (*param_1 & 0x1ff) == 0x166) ||
        (getenv("UW_DEBUG_DOOR") && (*param_1 & 0x1ff) == 0x140)) {
      float _fx, _fy, _fz;
      unsigned int _bx = (unsigned int)uVar22, _by = (unsigned int)uVar19, _bz = (unsigned int)uVar25;
      memcpy(&_fx, &_bx, 4); memcpy(&_fy, &_by, 4); memcpy(&_fz, &_bz, 4);
      fprintf(stderr, "[objpos-final] id=0x%03x uVar27(sprite_id)=0x%x vtx_x(float)=%f vtx_y(float)=%f vtx_z(float)=%f DAT_00202508(w)=%d DAT_002022f8(h)=%d\n",
              (unsigned)(*param_1 & 0x1ff), uVar27, _fx, _fy, _fz, (int)(short)DAT_00202508, (int)(short)DAT_002022f8);
    }
    return;
  }
  if (bVar13 == 1) {
    *DAT_00110fc0 = 0x7a;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b904;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b920;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b91c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x7f8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar29 = *(byte *)((char *)param_1 + 0x15) & 0x3f;
    { const char *_fs = getenv("UW_FORCE_CRITTER_STATE"); if (_fs) uVar29 = (uint)atoi(_fs); }
    /* Ghidra modelled the divmod's remainder (ARM r1) as `extraout_r1`,
       which was never assigned -> wild index into the 0x20-entry
       DAT_00086cc0 direction table (crash when an object first came into
       view down a long hallway). It is (that dividend) % 0x20. */
    {
      short _col_angle = g_current_view->view_facing;
      short _quad_term = *(short *)(&DAT_00086a18 + DAT_0023b4a0 * 2);
      int _dm = ((param_1[1] >> 5 & 0x1c) -
                 ((int)((int)_col_angle +
                        (uint)*(ushort *)(&DAT_00086a18 + DAT_0023b4a0 * 2)) >> 0xb)) + 0x20;
      bVar13 = (&DAT_00086cc0)[((_dm % 0x20) + 0x20) % 0x20];
      if (getenv("UW_DEBUG_CRITTER"))
        fprintf(stderr, "[critter] dirtable: id=0x%03x own_heading_bits=%d col_angle=%d quad_term=%d sum=%d shifted=%d _dm=%d bVar13=%d\n",
                uVar27 & 0x1ff, (int)(param_1[1] >> 5 & 0x1c),
                (int)_col_angle, (int)_quad_term, (int)_col_angle + (int)(unsigned short)_quad_term,
                (int)((int)((int)_col_angle + (uint)(unsigned short)_quad_term) >> 0xb), _dm, (int)bVar13);
    }
    if ((ushort)uVar29 < 0x20) {
      /* REVERTED (checked against a fresh disassembly of this exact block,
         real addresses 0x611ac-0x611cc): an earlier session added an
         `else { uVar29 = bVar13; }` here, theorizing the missing else was
         a decompiler-dropped branch. It isn't. The real code is a plain
         ARM conditional instruction:
           0x611c4: cmp r3,#0x3
           0x611c8: addge r4,r1,#0x20   ; r4 (uVar29) only touched if r3>=3
         There is no corresponding instruction for the r3<3 case anywhere
         nearby -- r4 simply keeps whatever it already held (the object's
         raw animation-state byte from *(param_1+0x15)&0x3f, set at
         0x61134 and never touched again on this path), exactly like the
         "buggy" pre-fix behavior. That earlier fix was plausible-looking
         (an object's raw state coinciding with another state's real
         direction index can show a wrong frame) but not what the shipped
         binary does. This mirroring scheme is the classic "5 real images
         cover 8 octants via horizontal flip" trick: the mirror test true
         (`2 < (bVar13-3&7)`,
         i.e. bVar13 in {0,1,2,6,7} -- back/side views) reuses a flipped
         image via the +0x20 flag; false (bVar13 in {3,4,5} -- front-ish
         views) leaves uVar29 as-is, matching the real code exactly. The
         uVar29==0xc special case (skips this whole block) is unchanged. */
      if ((ushort)uVar29 != 0xc) {
        if (2 < (bVar13 - 3 & 7)) {
          uVar29 = bVar13 + 0x20;
        }
      }
    }
    else {
      uVar29 = (uint)bVar13 + (uVar29 - 0x1c) * 8;
    }
    if (getenv("UW_DEBUG_CRITTER"))
      fprintf(stderr, "[critter] emit_tile_objects: id=0x%03x type_idx=%d raw_slot=%d own_heading_bits=%d cam_yaw=%d quadrant=%d dir(uVar29)=%d\n",
              uVar27 & 0x1ff, uVar27 & 0x3f, *(byte *)((char *)param_1 + 0x15) & 0x3f,
              (int)(param_1[1] >> 5 & 0x1c), (int)DAT_000db44c, (int)DAT_0023b4a0, (int)uVar29);
    if (getenv("UW_DEBUG_CRITTER_Z"))
      fprintf(stderr, "[critter-z] id=0x%03x world_x(b904)=%d world_z(b920)=%d HEIGHT(b91c)=%d raw_b9=%d raw_b13=%d\n",
              uVar27 & 0x1ff, (int)(short)DAT_0023b904, (int)(short)DAT_0023b920, (int)(short)DAT_0023b91c,
              (int)*(byte *)((char *)param_1 + 9), (int)*(byte *)((char *)param_1 + 0x13));
    if (getenv("UW_DEBUG_CRITTER_NAME")) {
      static int _named = 0;
      if (!_named) {
        _named = 1;
        int _id = uVar27 & 0x1ff;
        int _iv = _id * 0xd;
        int _grp = (byte)(&DAT_00202c9b)[_iv] & 0xf;
        int _qual = (byte)param_1[2] & 0x3f;
        int _off = 0;
        if (_qual != 0) {
          _off = (((&DAT_00202c97)[_iv] & 0xc) == 0xc) ? 5 : (((byte)param_1[2] >> 4 & 3) + 1);
        }
        char *_nm = (char *)get_message_string(_grp * 6 + _off | 0xa00);
        fprintf(stderr, "[critter-name] id=0x%03x namegrp=%d name='%s'\n",
                _id, _grp, _nm ? _nm : "(null)");
      }
    }
    {
      short _frame_arg = (byte)param_1[6] >> 4;
      const char *_ff = getenv("UW_FORCE_CRITTER_FRAME");
      if (_ff) _frame_arg = (short)atoi(_ff);
      resolve_critter_sprite_tier(uVar27 & 0x3f,uVar29,_frame_arg,(uint)DAT_0023bc88 * (int)DAT_00086b30);
    }
    uVar30 = (&DAT_000d9ed8)[DAT_000db44c];
    uVar18 = ordfloat_negate((&DAT_000d9930)[DAT_000db44c]);
    iVar32 = (int)DAT_00202508;
    uVar19 = ordfloat_int_to_float2(iVar32 * -4);
    uVar19 = ordfloat_mul(uVar19,0x3f000000);
    uVar20 = ordfloat_negate(uVar19);
    uVar16 = DAT_000da47c;
    iVar28 = DAT_0023b83c * 0x60;
    iVar17 = (int)(short)DAT_0023b904;
    (&DAT_000ace30)[iVar28] = (char)DAT_000da47c;
    (&DAT_000ace31)[iVar28] = (char)(uVar16 >> 8);
    cVar2 = (char)((short)uVar16 >> 0xf);
    (&DAT_000ace32)[iVar28] = cVar2;
    (&DAT_000ace33)[iVar28] = cVar2;
    uVar21 = ordfloat_int_to_float2(iVar17);
    uVar22 = ordfloat_mul(uVar19,uVar30);
    uVar22 = ordfloat_add(uVar22,uVar21);
    uVar22 = ordfloat_add(uVar22,0);
    iVar17 = DAT_0023b838;
    iVar31 = DAT_0023b838 * 0xc;
    iVar23 = (int)(short)DAT_0023b920;
    (&DAT_000a85d8)[iVar31] = (char)uVar22;
    uVar3 = (undefined1)((uint)uVar22 >> 8);
    (&DAT_000a85d9)[iVar31] = uVar3;
    uVar4 = (undefined1)((uint)uVar22 >> 0x10);
    (&DAT_000a85da)[iVar31] = uVar4;
    uVar5 = (undefined1)((uint)uVar22 >> 0x18);
    (&DAT_000a85db)[iVar31] = uVar5;
    uVar24 = ordfloat_int_to_float2(iVar23);
    uVar19 = ordfloat_mul(uVar19,uVar18);
    uVar19 = ordfloat_add(uVar19,uVar24);
    uVar19 = ordfloat_add(uVar19,0);
    (&DAT_000a85e0)[iVar31] = (char)uVar19;
    uVar6 = (undefined1)((uint)uVar19 >> 8);
    (&DAT_000a85e1)[iVar31] = uVar6;
    iVar33 = (int)DAT_002022f8;
    uVar7 = (undefined1)((uint)uVar19 >> 0x10);
    (&DAT_000a85e2)[iVar31] = uVar7;
    iVar23 = (int)(short)DAT_0023b91c;
    uVar8 = (undefined1)((uint)uVar19 >> 0x18);
    (&DAT_000a85e3)[iVar31] = uVar8;
    uVar25 = ordfloat_int_to_float2(iVar23 + iVar33 * 4);
    (&DAT_000a85dc)[iVar31] = (char)uVar25;
    (&DAT_000a85dd)[iVar31] = (char)((uint)uVar25 >> 8);
    (&DAT_000a85de)[iVar31] = (char)((uint)uVar25 >> 0x10);
    (&DAT_000a85df)[iVar31] = (char)((uint)uVar25 >> 0x18);
    (&DAT_000acde8)[iVar28] = (char)iVar17;
    (&DAT_000acde9)[iVar28] = (char)((uint)iVar17 >> 8);
    (&DAT_000acdea)[iVar28] = (char)((uint)iVar17 >> 0x10);
    (&DAT_000acdeb)[iVar28] = (char)((uint)iVar17 >> 0x18);
    (&DAT_000ace08)[iVar28] = 0;
    iVar34 = iVar17 + 1;
    (&DAT_000ace09)[iVar28] = 0;
    (&DAT_000ace0a)[iVar28] = 0;
    (&DAT_000ace0b)[iVar28] = 0;
    (&DAT_000ace0c)[iVar28] = 0;
    (&DAT_000ace0d)[iVar28] = 0;
    (&DAT_000ace0e)[iVar28] = 0;
    (&DAT_000ace0f)[iVar28] = 0;
    iVar31 = iVar34 * 0xc;
    (&DAT_000a85d8)[iVar31] = (char)uVar22;
    (&DAT_000a85d9)[iVar31] = uVar3;
    (&DAT_000a85da)[iVar31] = uVar4;
    (&DAT_000a85db)[iVar31] = uVar5;
    (&DAT_000a85e0)[iVar31] = (char)uVar19;
    (&DAT_000a85e1)[iVar31] = uVar6;
    (&DAT_000a85e2)[iVar31] = uVar7;
    (&DAT_000a85e3)[iVar31] = uVar8;
    uVar19 = ordfloat_int_to_float2(iVar23);
    (&DAT_000a85dc)[iVar31] = (char)uVar19;
    iVar23 = iVar33 + -1;
    uVar3 = (undefined1)((uint)uVar19 >> 8);
    (&DAT_000a85dd)[iVar31] = uVar3;
    uVar4 = (undefined1)((uint)uVar19 >> 0x10);
    (&DAT_000a85de)[iVar31] = uVar4;
    uVar5 = (undefined1)((uint)uVar19 >> 0x18);
    (&DAT_000a85df)[iVar31] = uVar5;
    (&DAT_000acdec)[iVar28] = (char)iVar34;
    iVar35 = iVar17 + 2;
    (&DAT_000acded)[iVar28] = (char)((uint)iVar34 >> 8);
    (&DAT_000acdee)[iVar28] = (char)((uint)iVar34 >> 0x10);
    (&DAT_000acdef)[iVar28] = (char)((uint)iVar34 >> 0x18);
    (&DAT_000ace10)[iVar28] = 0;
    (&DAT_000ace11)[iVar28] = 0;
    (&DAT_000ace12)[iVar28] = 0;
    (&DAT_000ace13)[iVar28] = 0;
    (&DAT_000ace14)[iVar28] = (char)iVar23;
    (&DAT_000ace15)[iVar28] = (char)((uint)iVar23 >> 8);
    (&DAT_000ace16)[iVar28] = (char)((uint)iVar23 >> 0x10);
    (&DAT_000ace17)[iVar28] = (char)((uint)iVar23 >> 0x18);
    uVar22 = ordfloat_mul(uVar20,uVar30);
    uVar21 = ordfloat_add(uVar22,uVar21);
    uVar21 = ordfloat_add(uVar21,0);
    iVar34 = iVar35 * 0xc;
    (&DAT_000a85d8)[iVar34] = (char)uVar21;
    uVar6 = (undefined1)((uint)uVar21 >> 8);
    (&DAT_000a85d9)[iVar34] = uVar6;
    uVar7 = (undefined1)((uint)uVar21 >> 0x10);
    (&DAT_000a85da)[iVar34] = uVar7;
    uVar8 = (undefined1)((uint)uVar21 >> 0x18);
    (&DAT_000a85db)[iVar34] = uVar8;
    uVar18 = ordfloat_mul(uVar20,uVar18);
    uVar18 = ordfloat_add(uVar18,uVar24);
    uVar18 = ordfloat_add(uVar18,0);
    (&DAT_000a85e0)[iVar34] = (char)uVar18;
    iVar31 = iVar32 + -1;
    iVar23 = iVar33 + -1;
    uVar9 = (undefined1)((uint)uVar18 >> 8);
    (&DAT_000a85e1)[iVar34] = uVar9;
    uVar10 = (undefined1)((uint)uVar18 >> 0x10);
    (&DAT_000a85e2)[iVar34] = uVar10;
    uVar11 = (undefined1)((uint)uVar18 >> 0x18);
    (&DAT_000a85e3)[iVar34] = uVar11;
    (&DAT_000a85dc)[iVar34] = (char)uVar19;
    (&DAT_000a85dd)[iVar34] = uVar3;
    (&DAT_000a85de)[iVar34] = uVar4;
    (&DAT_000a85df)[iVar34] = uVar5;
    (&DAT_000acdf0)[iVar28] = (char)iVar35;
    (&DAT_000acdf1)[iVar28] = (char)((uint)iVar35 >> 8);
    (&DAT_000acdf2)[iVar28] = (char)((uint)iVar35 >> 0x10);
    (&DAT_000acdf3)[iVar28] = (char)((uint)iVar35 >> 0x18);
    (&DAT_000ace18)[iVar28] = (char)iVar31;
    (&DAT_000ace19)[iVar28] = (char)((uint)iVar31 >> 8);
    (&DAT_000ace1a)[iVar28] = (char)((uint)iVar31 >> 0x10);
    (&DAT_000ace1b)[iVar28] = (char)((uint)iVar31 >> 0x18);
    (&DAT_000ace1c)[iVar28] = (char)iVar23;
    (&DAT_000ace1d)[iVar28] = (char)((uint)iVar23 >> 8);
    (&DAT_000ace1e)[iVar28] = (char)((uint)iVar23 >> 0x10);
    (&DAT_000ace1f)[iVar28] = (char)((uint)iVar23 >> 0x18);
    iVar17 = iVar17 + 3;
    iVar23 = iVar17 * 0xc;
    puVar26 = &DAT_000a85d8 + iVar23;
    *puVar26 = (char)uVar21;
    (&DAT_000a85d9)[iVar23] = uVar6;
    (&DAT_000a85da)[iVar23] = uVar7;
    (&DAT_000a85db)[iVar23] = uVar8;
    (&DAT_000a85e0)[iVar23] = (char)uVar18;
    (&DAT_000a85e1)[iVar23] = uVar9;
    (&DAT_000a85e2)[iVar23] = uVar10;
    (&DAT_000a85e3)[iVar23] = uVar11;
    goto LAB_00061d34;
  }
  if (bVar13 == 2) {
    if ((uVar27 & 0x30) == 0) {
      /* Doors. emit_anim_object_frames is the real handler for this
         branch: it draws through emit_catalog_object, whose own
         tick_anim_record helper resolves a "catalog" id to the same 29
         real .E model buffers loaded at startup -- genuine native 3D
         mesh rendering (door frame + leaf), not a flat sprite. Traced
         how DOS's dialog_script_event really calls dialog_action_here
         for door ids (uw1-decomp/docs/decompilation/functions/
         dialog_action_here.c): its body calls dialog_action_object with
         catalog ids 1/0xc/0xe/0xf, the exact constants
         emit_anim_object_frames already uses -- confirming it as the
         real counterpart, not a guess. `uVar27 & 7` is the door's low 3
         id bits (0x140-0x147 -> 7 door skins/types + secret), matching
         emit_anim_object_frames's own `door_type` parameter. */
      if (getenv("UW_DEBUG_DOOR_POS"))
        fprintf(stderr, "[doorpos] anchor=(%d,%d,%d) tile_word0=0x%04x\n",
                (int)(short)DAT_0023b904, (int)(short)DAT_0023b91c, (int)(short)DAT_0023b920,
                (unsigned)*param_1);
      emit_anim_object_frames(uVar27 & 7, param_1);
      return;
    }
    /* DAT_00086c80 (the real per-sign-variant -> billboard-catalog
       index table) has now been recovered from the real binary -- see
       its own declaration comment -- replacing the "fill every entry
       with 668" placeholder that used to live here. */
    iVar17 = (int)(((uVar27 & 0x3f) - 0x10) * 0x10000) >> 0x10;
    if ((short)*(ushort *)(&DAT_00086c80 + iVar17 * 2) < 0) {
      return;
    }
    if (0x1f < iVar17) {
      return;
    }
    /* Confirmed correct: calling emit_catalog_object directly with the
       real table value is right -- matches the exact 4-argument call
       shape the two other real callers use (search
       "emit_catalog_object(0x14," and "0x16,"), because this table can
       resolve to a real loaded .E model catalog (e.g. FBRIDGE.E), not
       just another flat sprite variant, so it has to go through the one
       call that actually knows how to draw both.

       heading=-1 told emit_catalog_object to use ITS OWN camera-
       relative billboard angle instead of the object's real placed
       orientation -- visibly wrong for a wall-mounted decal (e.g. the
       starting room's own entry-door decal rotating with the camera's
       yaw instead of staying fixed). Fixed the same way doors already
       do it: pass the object's own real stored heading (word1 bits
       7-9, doubled -- the exact formula emit_anim_object_frames already
       uses) instead of -1. emit_catalog_object's own internal math
       (the heading>=0 branch) already applies the camera-quadrant
       correction itself, so nothing extra is needed at this call site. */
    /* frame_or_texid=-1, exactly as the real call site (FUN_00060aa0:
       `FUN_00061e60(uVar26 & 0xff, param_1, -1, -1)`): emit_catalog_object's
       own catalog-2 branch resolves a_bridge's TMOBJ 30/31 plank frame (or
       its flags>=2 floor texture) from the object's flags. A caller-side
       `_mesh_tex_row` table used to precompute that frame here, bypassing
       the real branch -- only ever needed because that branch read the
       idivmod remainder from an uninitialised `extraout_r1`. */
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[sign] variant=%d table_val=%d heading=%d -> emit_catalog_object(catalog_idx=%d)\n",
              iVar17, (short)*(ushort *)(&DAT_00086c80 + iVar17 * 2),
              (int)((param_1[1] >> 7 & 7) << 1),
              (unsigned char)*(ushort *)(&DAT_00086c80 + iVar17 * 2));
    emit_catalog_object((uint)(unsigned char)*(ushort *)(&DAT_00086c80 + iVar17 * 2),
                        param_1, (param_1[1] >> 7 & 7) << 1, -1);
    return;
  }
  if (bVar13 != 3) {
    return;
  }
  if ((*param_1 & 0x30) == 0x30) {
    if (DAT_0023b830 == 0 && DAT_00086b2c == 0) {
      *DAT_00110fc0 = 2;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      uVar16 = get_catalog_sprite_width(8);
      *DAT_00110fc0 = uVar16;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = 0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      DAT_00189580 = 0;
    }
    /* Same heading fix as the generic DAT_00086c80 dispatch above (see
       its own comment) -- this call was ALSO passing heading=-1
       (camera-relative billboard angle) unconditionally. This is the
       class-3 (button/switch/pull-chain) TMFLAT dispatch -- same fix,
       same reasoning: these are real placed wall fixtures, not camera-
       facing billboards. */
    emit_catalog_object(0x14,param_1,(param_1[1] >> 7 & 7) << 1,(uVar27 & 0xf) + (uint)DAT_00202734);
    if (DAT_0023b830 != 0 || DAT_00086b2c != 0) {
      return;
    }
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar16 = get_catalog_sprite_width(8);
    *DAT_00110fc0 = uVar16;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 1;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189580 = 1;
    return;
  }
  DAT_0023b818 = 0xe0;
  emit_diagonal_wall_texture_select(0,DAT_0023b4e0,4,(byte)param_1[3] & 0x3f);
  *DAT_00110fc0 = 0xb2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b81c;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  cVar2 = *(char *)(&DAT_0023add0 + ((byte)param_1[3] & 0x3f));
  if ((cVar2 == '\x03') || (cVar2 == '\x04')) {
    DAT_0023b834 = 3;
  }
  else if ((cVar2 != '\b') && (cVar2 != '\v')) {
    bVar14 = false;
    goto LAB_00060f54;
  }
  bVar14 = true;
LAB_00060f54:
  if ((!bVar14) || (bVar14 = true, DAT_0023b830 != 0 || DAT_00086b2c != 0)) {
    bVar14 = false;
  }
  if (bVar14) {
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar16 = get_catalog_sprite_width(8);
    *DAT_00110fc0 = uVar16;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189580 = 0;
  }
  /* Same heading fix as the generic DAT_00086c80 dispatch above (see its
     own comment). Class-3's other sub-branch (force field/special tmap
     obj). */
  emit_catalog_object(0x16,param_1,(param_1[1] >> 7 & 7) << 1,(byte)param_1[3] & 0x3f);
  if (!bVar14) {
    return;
  }
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar16 = get_catalog_sprite_width(8);
  *DAT_00110fc0 = uVar16;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189580 = 1;
  return;
}
