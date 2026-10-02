#include "uw.h"
#include "src/headers/debug.h"
#include "src/headers/gx_stub.h"
#include "src/headers/debug_ui.h"
#include <dlfcn.h>
#include <math.h>
#include <stdarg.h>


int DAT_00088954;
int DAT_0008895c;
int DAT_00088950;
int DAT_00088958;
undefined DAT_0023c5ac;
/* Ghidra modeled a single 32-bit pointer, stored straddling the byte
   ranges of two separately-declared globals (_DAT_0023c5ac's upper 16
   bits + DAT_0023c5b0's lower 16 bits -- see the CONCAT22 write site in
   app_main_loop and every read site's "_DAT_0023c5ac >> 0x10 |
   DAT_0023c5b0 << 0x10" reconstruction), because that's how the packed
   bytes landed in the original 32-bit binary's fixed memory layout.
   Neither underlying global has any other independent use in this
   decompile, so replace the whole packed-halves dance with one real
   pointer: it was truncating the buffer's address to its low 32 bits on
   this 64-bit host and segfaulting the first time Ordinal_1044 actually
   did real memmove work. */
void *g_uw_framebuffer;
// was DAT_0024ae20. Flat RGB565 ink color draw_text_string uses when
// g_text_use_palette_color is 0 -- never written anywhere, silently 0
// (black). Fine as the default on message-scroll's light parchment
// background; menu screens with a dark backdrop need the palette-
// indexed path instead (force g_text_use_palette_color there).
undefined2 g_text_flat_color;
 undefined2 DAT_000890b0_backing[32768];
#define DAT_000890b0 DAT_000890b0_backing[0]
/* Not `static` -- referenced from graphics.c (bitmap_blit_to_framebuffer,
   rect_fill_or_save_restore) as well as here; the extern declaration and
   g_palette_rgb565 macro alias both live in uw.h now so both files see the
   same thing. */
undefined2 g_palette_rgb565_backing[32768];
// was DAT_0008909c. Line height (pixels) of the currently-active font,
// read from its header by load_font_metrics; 0 would make
// draw_text_string allocate/draw nothing.
ushort g_font_line_height;
// was DAT_0008894c. Per-glyph row stride (bytes) of the currently-active
// font, also from load_font_metrics; selects unpack_glyph_bitmap's 8- vs
// 16-bit-per-row decode.
short g_font_row_stride;
short DAT_000a85b8;
/* Was `int`, truncating the real char* pointer (DAT_000890a4) assigned
   into it -- used as a glyph-bitmap-data base address in byte-pointer
   arithmetic passed to unpack_glyph_bitmap. */
char *g_font_glyph_data_base;
// was DAT_0024af74. Nonzero: draw_text_string colors glyph pixels via
// the palette index *g_draw_color_index; zero (the default -- nothing
// else in this decompile ever sets it) uses the flat g_text_flat_color
// instead. A reentrancy/mode flag set only around one unrelated dialog-
// box drawing routine (display_book_or_scroll_page), so callers elsewhere that want
// palette-indexed text (e.g. draw_menu_item_list's highlighted save-slot
// labels) must force it themselves for the duration of the draw.
int g_text_use_palette_color;
int DAT_0023c5b0;
// was DAT_0008429c_backing/DAT_0008429c. Current draw-color palette
// index, written before nearly every text/UI draw call across the file
// and read back by draw_text_string (when g_text_use_palette_color is
// set) and various fill/blit routines.
byte g_draw_color_index_backing[128];
byte *g_draw_color_index = g_draw_color_index_backing;
/* DAT_000879b0/DAT_000890a4 (the active font's 12-byte header and its
   glyph-bitmap data, both filled in by select_active_font's file reads)
   were plain uninitialized pointers -- no allocation anywhere in this
   file, and confirmed via Ghidra xref search that the real ARM binary's
   own source slots (0x40dd8/0x40ddc) are READ-ONLY across the whole
   binary too, never written by any real code -- so these were never
   runtime-malloc'd pointers at all; they're link-time-constant
   addresses of fixed static buffers that Ghidra's static analysis
   couldn't recover (same class as several other "silently zero"
   globals already fixed this session). Confirmed live: DAT_000890a4
   was NULL, and unpack_glyph_bitmap's pointer arithmetic off NULL
   landed in essentially-random process memory that happened to overlap
   a heap block libSystem/Foundation legitimately allocated-then-freed
   during app startup -- an ASan-caught heap-buffer-overflow (uw.c:7007)
   on the first automap-note text draw of any session, not a "sometimes"
   bug: font rendering was silently using this same wild pointer on
   every single draw all along, just usually landing in mapped-but-
   irrelevant memory instead of a freed block that trips ASan. Given
   real backing storage instead, sized to what select_active_font's own
   reads need (12-byte header; 0x1080 bytes of glyph data -- see that
   function's own comment on why 0x1080). */
static char DAT_000879b0_backing[12];
char *DAT_000879b0 = DAT_000879b0_backing;
undefined2 DAT_000a85b0;
static char DAT_000890a4_backing[0x1080];
char *DAT_000890a4 = DAT_000890a4_backing;
/* Ghidra split this out as a standalone, never-written `short` -- but its
   address (0x0024ad94) is exactly 0x34 bytes into the RGB565 palette LUT
   at g_palette_rgb565 (0x34/2 = entry 26 = palette color 0x1a), and nothing
   ever assigns it because every LUT write goes through the array base
   (&g_palette_rgb565 / puVar20 loops in build_rgb565_palette), not this symbol. Left
   as its own zero global it means "framebuffer pixel value 0x0000 (pure
   black)", which the transient-panel compositor (screen_backup_save then
   screen_backup_restore / screen_backup_restore_rect) then treats as "not
   drawn, paint the saved background over it" -- eating every legitimately-
   black pixel, e.g. CHRBTNS.GR's palette-index-0 button outlines. Aliased onto LUT
   entry 26 so it tracks the real RGB565 of the chargen "backing/erase"
   color 0x1a (the one chargen fills its panels with via set_draw_color
   (0x1a) right before drawing the UI overlay on top). */
#define g_transparent_screen_color (*(short *)&g_palette_rgb565_backing[26])
/* Was a lone `undefined2` scalar, but used as a full-screen shadow/
   backup buffer the same size as g_uw_framebuffer (screen_backup_save saves
   aside every non-transparent pixel across the whole 320x200 framebuffer
   into it; screen_backup_restore/screen_backup_restore_rect restore from it
   later) -- classic
   "undersized global used as a large table" bug. Widened to match
   g_uw_framebuffer's exact size (0x25800 bytes = 76800 shorts). */
undefined2 DAT_000891b0_backing[76800];
#define DAT_000891b0 DAT_000891b0_backing[0]
undefined2 DAT_000a85c0;
undefined2 DAT_000a85c4;
undefined2 DAT_000a85c8;
undefined2 DAT_000842a4;
undefined2 DAT_000842a8;
int DAT_00204848;
// was DAT_00088960 -- global toggle every sprite/bitmap-blit primitive in
// this file (bitmap_blit_to_framebuffer in graphics.c, and this file's
// own sibling blit routines, e.g. ~uw.c:5244/5591/62096) reads instead of
// taking a real "transparent mode" parameter: 0 draws every source pixel
// opaquely through the palette (so a transparent-keyed pixel, byte value
// 0, paints as palette index 0 -- typically black), nonzero skips
// byte==0 pixels for real transparency. Callers that want a transparent
// blit set this to 1 immediately before the call and reset it to 0
// right after (draw_sprite_by_id, mode_icon_highlight_on/mode_icon_highlight_off, etc). Named
// after root-causing the inventory-panel "black box" bug: redraw_hud_panels's
// panels.GR background blit had a trailing literal `1` argument that
// clearly intended transparency but never actually set this global,
// so it silently ran opaque -- see that fix's own comment for the full
// story (uw.c, redraw_hud_panels, search "DAT_00088960" in git history/
// memory.md for the writeup predating this rename).
int g_blit_transparent_mode;
undefined *PTR_Ordinal_2032_00084010;
undefined *PTR_Ordinal_2026_00084014;
undefined *PTR_Ordinal_2020_00084018;
/* Was a lone `undefined4` scalar, but translate_verts_to_camera_space/project_verts_through_view_matrix/
   near_clip_visible_tiles (the vertex/geometry-transform pipeline feeding tile/sprite
   rendering) all take `&DAT_000a85d0` as a base pointer into a large
   per-record transform-cache struct, reading/writing offsets up to
   ~0x4874 (~18.5KB) from it -- confirmed crashing (EXC_BAD_ACCESS) inside
   near_clip_visible_tiles dereferencing that far out. Elsewhere in this file
   DAT_000a85d0 is also used as a plain scalar counter/index -- that's not
   a conflict, just the same address doing double duty at different times,
   same as other reused-scratch-memory globals already documented this
   session (e.g. s_scroll_newline_0008522c); the `[0]` alias below preserves that use
   unchanged. Widened to a generous backing size well past every offset
   observed, same pattern as the other undersized-record-table fixes this
   session. */
/* --- Unified 3D-view record arena (recovered structure at 0xa85d0) ---
   Ghidra fragmented one contiguous ~0x4900-byte structure into a
   64KB backing array plus ~80 lone scalars and a second 32KB array,
   each independently addressed -- so process_visible_tile_cell wrote
   the geometry records into the scalars while translate_verts_to_camera_space /
   project_verts_through_view_matrix / near_clip_visible_tiles read them as `&DAT_000a85d0 + off`,
   and the two never met (DAT_000c8c98 stayed 0). All the pieces are
   now byte offsets into the one DAT_000a85d0_backing array.
     +0x00      first-list (raw vertex) record count / cursor
     +0x04      DAT_000a85d4  second-list (visible-tile) record count
     +0x08..13  DAT_000a85d8.. first-list vertex record 0 fields (0xc stride)
     +0x4814..  DAT_000acde4.. second-list record 0 fields (0x60 stride)
   translate_verts_to_camera_space seeds each second-list record's +0x486c flag = 1. */
/* Real-pointer side channel for the per-visible-tile texture pointer.
   process_visible_tile_cell packs get_texture_page()'s result into a
   4-byte record field (DAT_000acdfc) -> truncated on 64-bit. We stash
   the full pointer here keyed by the emit record index, near_clip_visible_tiles
   carries it across to the render index, and render_visible_tile_list
   reads it instead of the truncated piVar14[0x1a]. */
#define UW_MAX_VIS_TILES 2048
 void *g_tile_texptr_emit[UW_MAX_VIS_TILES];
 void *g_tile_texptr_out[UW_MAX_VIS_TILES];

 undefined4 DAT_000a85d0_backing[16384];
#define DAT_000a85d0 DAT_000a85d0_backing[0]
#define UW_A85B(o) (*(undefined1 *)((char *)DAT_000a85d0_backing + (o)))
#define DAT_000a85d4 (*(int *)((char *)DAT_000a85d0_backing + 0x4))
#define DAT_000a85d8 UW_A85B(0x8)
#define DAT_000a85d9 UW_A85B(0x9)
#define DAT_000a85da UW_A85B(0xa)
#define DAT_000a85db UW_A85B(0xb)
#define DAT_000a85dc UW_A85B(0xc)
#define DAT_000a85dd UW_A85B(0xd)
#define DAT_000a85de UW_A85B(0xe)
#define DAT_000a85df UW_A85B(0xf)
#define DAT_000a85e0 UW_A85B(0x10)
#define DAT_000a85e1 UW_A85B(0x11)
#define DAT_000a85e2 UW_A85B(0x12)
#define DAT_000a85e3 UW_A85B(0x13)
#define DAT_000acde4 UW_A85B(0x4814)
#define DAT_000acde5 UW_A85B(0x4815)
#define DAT_000acde6 UW_A85B(0x4816)
#define DAT_000acde7 UW_A85B(0x4817)
#define DAT_000acde8 UW_A85B(0x4818)
#define DAT_000acde9 UW_A85B(0x4819)
#define DAT_000acdea UW_A85B(0x481a)
#define DAT_000acdeb UW_A85B(0x481b)
#define DAT_000acdec UW_A85B(0x481c)
#define DAT_000acded UW_A85B(0x481d)
#define DAT_000acdee UW_A85B(0x481e)
#define DAT_000acdef UW_A85B(0x481f)
#define DAT_000acdf0 UW_A85B(0x4820)
#define DAT_000acdf1 UW_A85B(0x4821)
#define DAT_000acdf2 UW_A85B(0x4822)
#define DAT_000acdf3 UW_A85B(0x4823)
#define DAT_000acdf4 UW_A85B(0x4824)
#define DAT_000acdf5 UW_A85B(0x4825)
#define DAT_000acdf6 UW_A85B(0x4826)
#define DAT_000acdf7 UW_A85B(0x4827)
#define DAT_000acdfc UW_A85B(0x482c)
#define DAT_000acdfd UW_A85B(0x482d)
#define DAT_000acdfe UW_A85B(0x482e)
#define DAT_000acdff UW_A85B(0x482f)
#define DAT_000ace00 UW_A85B(0x4830)
#define DAT_000ace01 UW_A85B(0x4831)
#define DAT_000ace02 UW_A85B(0x4832)
#define DAT_000ace03 UW_A85B(0x4833)
#define DAT_000ace04 UW_A85B(0x4834)
#define DAT_000ace05 UW_A85B(0x4835)
#define DAT_000ace06 UW_A85B(0x4836)
#define DAT_000ace07 UW_A85B(0x4837)
#define DAT_000ace08 UW_A85B(0x4838)
#define DAT_000ace09 UW_A85B(0x4839)
#define DAT_000ace0a UW_A85B(0x483a)
#define DAT_000ace0b UW_A85B(0x483b)
#define DAT_000ace0c UW_A85B(0x483c)
#define DAT_000ace0d UW_A85B(0x483d)
#define DAT_000ace0e UW_A85B(0x483e)
#define DAT_000ace0f UW_A85B(0x483f)
#define DAT_000ace10 UW_A85B(0x4840)
#define DAT_000ace11 UW_A85B(0x4841)
#define DAT_000ace12 UW_A85B(0x4842)
#define DAT_000ace13 UW_A85B(0x4843)
#define DAT_000ace14 UW_A85B(0x4844)
#define DAT_000ace15 UW_A85B(0x4845)
#define DAT_000ace16 UW_A85B(0x4846)
#define DAT_000ace17 UW_A85B(0x4847)
#define DAT_000ace18 UW_A85B(0x4848)
#define DAT_000ace19 UW_A85B(0x4849)
#define DAT_000ace1a UW_A85B(0x484a)
#define DAT_000ace1b UW_A85B(0x484b)
#define DAT_000ace1c UW_A85B(0x484c)
#define DAT_000ace1d UW_A85B(0x484d)
#define DAT_000ace1e UW_A85B(0x484e)
#define DAT_000ace1f UW_A85B(0x484f)
#define DAT_000ace20 UW_A85B(0x4850)
#define DAT_000ace21 UW_A85B(0x4851)
#define DAT_000ace22 UW_A85B(0x4852)
#define DAT_000ace23 UW_A85B(0x4853)
#define DAT_000ace24 UW_A85B(0x4854)
#define DAT_000ace25 UW_A85B(0x4855)
#define DAT_000ace26 UW_A85B(0x4856)
#define DAT_000ace27 UW_A85B(0x4857)
#define DAT_000ace30 UW_A85B(0x4860)
#define DAT_000ace31 UW_A85B(0x4861)
#define DAT_000ace32 UW_A85B(0x4862)
#define DAT_000ace33 UW_A85B(0x4863)
byte *DAT_000b4628;
byte *DAT_000b461c;
/* Was `int` / `undefined4` -- both hold real pointers (DAT_000b4614 +
   an offset; a color-remap table row) that got truncated to 32 bits on
   this 64-bit host, so the sprite-blit color-remap read
   (`*(byte *)(DAT_000b4610 + bVar1)` in blit_sprite_row_remapped) dereferenced a
   wild address. Surfaced by drawing the automap player marker with the
   player at certain positions (draw_sprite_by_id(0x103f,...) ->
   decompress_gr_bitmap -> blit_sprite_row_remapped). Retyped to real pointers. */
byte *DAT_000b4610;
byte *DAT_000b4624;
byte *DAT_0024af78;
byte *DAT_0024af7c;
/* Was `undefined4`, silently 0 -- a link-time-initialized pointer
   constant this decompile never writes (holds 0xb45f0 in UU.exe, i.e.
   the address of a 0x20-byte sprite-row scratch buffer). Confirmed via
   Ghidra: 3 refs, all reads, in blit_sprite_row_remapped/decompress_gr_bitmap, plus the
   `.data` word at 0x842ac literally being 0xb45f0. As NULL it made
   `Ordinal_1047(DAT_000842ac, 10, 0x20)` memset through address 0 and
   the blit write past it. Backed by a real (over-sized) buffer. */
 undefined1 DAT_000842ac_backing[4096];
#define DAT_000842ac ((void *)DAT_000842ac_backing)
char *DAT_0024fa2c;
byte *DAT_000b462c;
char *DAT_000b4614;
byte *DAT_000b5630;
byte *DAT_000b4618;
undefined *PTR_Ordinal_2005_0008403c;
undefined *PTR_Ordinal_2015_00084008;
undefined *PTR_Ordinal_2023_0008402c;
undefined *PTR_Ordinal_2051_00084028;
/* Ghidra only saw pointer-walking writes (build_shade_lut) and an indexed
   read (sVar7 clamped to 0x9f, i.e. 160 entries -- see its use below), so
   it declared this as a lone scalar instead of the real 160-entry
   distance/lighting falloff table. That undersizing let build_shade_lut's
   fill loop silently scribble past it into whatever the compiler placed
   next in .bss (confirmed via `nm`: DAT_000bbef8 landed 28 bytes later,
   exactly iteration 7 of the loop) -- invisible to ASan because a
   non-static tentative definition like `undefined4 DAT_000b5638;` gets
   common linkage, and Clang's ASan cannot redzone-instrument common
   symbols. */
 undefined4 DAT_000b5638_backing[160];
#define DAT_000b5638 DAT_000b5638_backing[0]
char DAT_000842b0;
undefined *PTR_Ordinal_2028_00084044;
undefined *PTR_Ordinal_2038_00084038;
undefined *PTR_Ordinal_2036_00084040;
undefined *PTR_Ordinal_2030_00084080;
undefined *PTR_Ordinal_2047_00084048;
char DAT_0023b830;
undefined2 DAT_000da47c;
char *DAT_0023cca0;
char s__arc_tmp_000842b4[] = "_arc.tmp";
/* Not `static` -- also used by saveload.c (open_level_archive,
   close_level_archive, write_archive_entry, read_archive_entry); see the
   extern declarations and macro aliases in uw.h. */
undefined DAT_000b78b8_backing[8192];
#define DAT_000b78b8 DAT_000b78b8_backing[0]
undefined1 DAT_000b98b8_backing[32768];
#define DAT_000b98b8 DAT_000b98b8_backing[0]
undefined1 DAT_000b98b9_backing[32768];
#define DAT_000b98b9 DAT_000b98b9_backing[0]
/* Not `static` -- also used by game.c (app_main_loop, main_menu_loop);
   see the extern declaration and DAT_0023cca8 macro alias in uw.h. */
undefined1 DAT_0023cca8_backing[32768];
undefined1 DAT_000b58b8_backing[16384];
#define DAT_000b58b8 DAT_000b58b8_backing[0]
int DAT_000bbefc;
short DAT_00201b68;
undefined2 DAT_000b99c0;
undefined4 DAT_000b99c4;
char s__SAVE0_lev_ark_000842fc[] = "\\SAVE0\\lev.ark";
 undefined1 DAT_000b99d0_backing[8192];
#define DAT_000b99d0 DAT_000b99d0_backing[0]
short DAT_000ba9d0;
undefined4 DAT_000bbef4;
/* Was a lone `undefined` scalar; draw_automap_tiles indexes it as
   `(&DAT_000842f0)[shape - 2]` (shape 2-5, the diagonal tile types)
   to pick the base wall-edge direction for a diagonal cell. Real 4
   bytes from UU.exe .data at 0x842f0. Its two neighbours DAT_000842f4
   / DAT_000842f8 (per-direction dx / dy deltas, signed) had the same
   lone-scalar bug and are fixed just below. */
 const unsigned char DAT_000842f0_real_table[4] = { 0x01, 0x02, 0x00, 0x03 };
#define DAT_000842f0 (*(undefined1 *)DAT_000842f0_real_table)
/* Was a lone 1-byte scalar, but indexed throughout this file as a
   tile-type-flags lookup table (nibble-masked indices in most call sites,
   but some -- e.g. advance_visibility_ray -- index it with an unmasked byte value
   read from another table). The prior fix widened it to 256 bytes but
   never filled it -- so it read all-zero, and in particular
   draw_automap_tiles' `DAT_000878d0[shape] & 1` was always false,
   forcing every tile (diagonals included) down the 4-way wall-edge
   path instead of the 2-way diagonal path -- walls didn't follow the
   diagonal floor shape. Real 16 bytes from UU.exe .data at 0x878d0
   (bit 0 = "is a diagonal, use the 2-way edge path"; bits 1-4 =
   per-direction wall-present flags used by LOS/pathfinding elsewhere;
   0x20 on the slope types). Entry 16 onward is a string literal, so
   there are exactly 16 real entries; kept oversized for the unmasked-
   index call sites. */
 undefined1 DAT_000878d0_backing[256] = {
  0x1e, 0x00, 0x13, 0x15, 0x0b, 0x0d, 0x20, 0x20,
  0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e,
};
#define DAT_000878d0 DAT_000878d0_backing[0]
/* Was a lone `undefined1` scalar, but draw_automap_cell indexes it as a real
   5x3x3 (45-entry) shape-pattern table:
   `(&DAT_000842c0)[((shape-1)*3+row)*3+col]`, shape=1-5, comparing each
   entry against 1 or 2 to decide whether to darken a corner pixel when
   drawing an automap wall/floor cell. Unlike DAT_00086bf0/DAT_00085668/
   etc earlier this session, this one is NOT silently zero -- a Ghidra
   reference search confirms real, varied 0/1/2 data already sitting at
   this address in UU.exe's .data (nothing writes it, it's genuinely
   read-only). The bug here is purely the lone-scalar-instead-of-a-real-
   array declaration: any index past byte 0 was reading whatever the
   compiler placed adjacent in memory on this port, not this real table.
   Real bytes recovered directly from UU.exe (45 real entries; sized
   larger for a safety margin past the last byte any index reaches). */
 const unsigned char DAT_000842c0_real_table[64] = {
  1, 1, 1, 1, 1, 1, 1, 1, 1,
  2, 1, 1, 0, 2, 1, 0, 0, 2,
  1, 1, 2, 1, 2, 0, 2, 0, 0,
  0, 0, 2, 0, 2, 1, 2, 1, 1,
  2, 0, 0, 1, 2, 0, 1, 1, 2,
};
#define DAT_000842c0 (*(undefined1 *)DAT_000842c0_real_table)
char DAT_000ba9d4;
/* Lone-scalar-used-as-4-entry-array, same as DAT_000842f0 above.
   draw_automap_door_edge indexes `(&DAT_000842f4)[dir]` / same for f8
   as signed-char dx / dy deltas per direction. Real bytes from UU.exe
   .data at 0x842f4 / 0x842f8. */
 const signed char DAT_000842f4_real_table[4] = { -1, 0, -1, 1 };
#define DAT_000842f4 (*(undefined1 *)DAT_000842f4_real_table)
 const signed char DAT_000842f8_real_table[4] = { 0, -1, -1, -1 };
#define DAT_000842f8 (*(undefined1 *)DAT_000842f8_real_table)
undefined1 DAT_00084298_backing[128];
undefined1 *DAT_00084298 = DAT_00084298_backing;
short DAT_00085a6c_backing[128];
short *DAT_00085a6c = DAT_00085a6c_backing;
undefined4 DAT_000bbef8;
short DAT_000bbef0;
char s_font5x6p_sys_0008430c[] = "font5x6p.sys";
char s_font4x5p_sys_0008431c[] = "font4x5p.sys";
undefined1 DAT_000ba9d8_backing[32768];
#define DAT_000ba9d8 DAT_000ba9d8_backing[0]
undefined1 DAT_000baa0a;
undefined1 DAT_000baa0b;
undefined1 DAT_000baa0c;
undefined1 DAT_000baa0d;
undefined2 DAT_000b99c8;
undefined *PTR_Ordinal_2008_00084060;
char s_fontbig_sys_0008432c[] = "fontbig.sys";
char s__DATA_blnkmap_byt_00084338[] = "\\DATA\\blnkmap.byt";
/* Was `char *` -- but every `g_player_object[N]` bracket-index use
   throughout this file (position/facing/type fields) matches the SAME
   ushort-array-index convention every other object-record pointer in
   this codebase uses (e.g. `param_1[N]` for a `ushort *param_1`), not a
   byte-array one: g_player_object[0xc] as ushort-index 0xc = byte
   offset 0x18, matching the real ARM disassembly's `ldrb r0,[r0,#0x18]`
   facing-byte read; g_player_object[0xb] = byte offset 0x16, matching
   set_player_tile_position's own tile-position writes; bare
   `*g_player_object & 0x1ff` (the object type/class field) needs 9
   bits, which no single byte read can supply. With the old `char *`
   type every one of those bracket-index reads was silently reading the
   wrong byte (index N instead of byte offset 2*N) -- confirmed live:
   drop_held_object_near_player's g_player_object[0xb] read (meant to
   recover the player's own tile Y position for a "throw distance"
   projection) read whatever unrelated byte sits at offset 0xb instead
   of the real position at offset 0x16, producing a wildly wrong throw
   start point. Retyped to `ushort *` to match; every *pointer-
   arithmetic* use elsewhere in this file (`g_player_object + N`,
   expecting a literal byte offset N, then cast down to byte/char for a
   sub-field read) has been updated alongside this to explicitly cast to
   `(char *)` first, preserving their existing (correct) byte-offset
   arithmetic now that the base type's own implicit scaling would
   otherwise double it. */
ushort *g_player_object;
ushort *DAT_00100674;
 undefined DAT_001007d9_backing[8192];
#define DAT_001007d9 DAT_001007d9_backing[0]
char *DAT_00086df8;
undefined4 DAT_00202c84;
undefined2 DAT_002020a0;
undefined2 DAT_002020a4;
uint *DAT_000bbf04;
undefined1 DAT_00000004;
undefined1 DAT_00000005;
undefined1 DAT_00000006;
undefined1 DAT_00000007;
/* Was `undefined4` despite being assigned a real malloc'd pointer
   (`DAT_00248410 = DAT_0023c44c;`, itself `Ordinal_1041(0x4cce)`'s
   result) -- truncating on this 64-bit host and feeding a garbage
   pointer to Ordinal_1047/Ordinal_1044. Same fix applied to its two
   sibling aliases, DAT_0023cca4 and DAT_0024ad58, assigned from the
   same source right next to this one. */
char *DAT_00248410;
char s__SAVE0_bglobals_dat_00084538[] = "\\SAVE0\\bglobals.dat";
char s__DATA_babglobs_dat_0008454c[] = "\\DATA\\babglobs.dat";
ushort DAT_001007c4;
undefined1 DAT_000bbf30;
undefined4 DAT_000bbf20;
char *DAT_000bbf18;
short DAT_000bbf7c;
/* Was `int` -- a real 64-bit heap pointer (babl_alloc, i.e. malloc)
   truncated through a 32-bit int, same bug class as DAT_000bbf70/
   DAT_000bbf00 below (see their own comment) -- widened to intptr_t so
   the existing integer arithmetic throughout build_babl_symbol_table/init_babl_variable_defaults/
   etc. keeps compiling unchanged (intptr_t participates in ordinary
   integer arithmetic; a real pointer type would need every site
   recast). */
intptr_t DAT_000bbf14;
short DAT_000bbf84;
intptr_t DAT_000bbf0c; // was `int`, same DAT_000bbf14-derived-pointer truncation
undefined2 DAT_000bbf88;
/* Was zero-initialized 8192-byte placeholders -- same "zero-init
   global missing real .data content" class as this file's many other
   string recoveries (e.g. s_sex_000851f8's own comment). Confirmed
   real content via a Ghidra headless memory dump at 0x84560/6c/74:
   "val" (registered with babl_builtin_val), "find" (babl_builtin_find), "copy"
   (babl_builtin_copy) -- 3 more babl builtin names alongside "length". */
char s_val_00084560[] = "val";
char s_length_00084564[] = "length";
char s_find_0008456c[] = "find";
char s_copy_00084574[] = "copy";
char s_append_0008457c[] = "append";
char s_contains_00084584[] = "contains";
char s_plural_00084590[] = "plural";
char s_random_00084598[] = "random";
char s_compare_000845a0[] = "compare";
int DAT_000bbf10;
char *DAT_000bbf80;
undefined2 DAT_000bbf8c;
undefined2 DAT_0024cfac;
short DAT_000bbf24;
/* Was `int` -- build_babl_symbol_table assigns it a real 64-bit heap pointer
   (`DAT_000bbf70 = babl_alloc((iVar11+1)*0x20)`) and every reader
   throughout this whole babl-symbol-table cluster (babl_register_builtin/
   babl_op_say/babl_op_respond/babl_set_variable/babl_get_variable/init_babl_variable_defaults/
   build_babl_symbol_table itself) does plain `int`-width pointer arithmetic on
   it. Truncating this on a 64-bit host is the crash one step past the
   read_archive_entry dropped-argument fix (uw.c ~10984's comment):
   with that fixed, Bragit's conversation record genuinely loads for
   the first time this whole session, and THIS truncation is what
   build_babl_symbol_table immediately crashes on building its symbol table
   (`*pcVar9 = cVar4` wild write, confirmed live via lldb -- this
   whole cluster was apparently never exercised by any prior fix or
   test, since no conversation had ever successfully loaded before).
   Widened to intptr_t rather than a real pointer type for the same
   reason as DAT_000bbf14 above -- keeps the existing int-arithmetic
   call sites compiling as-is. */
intptr_t DAT_000bbf70;
intptr_t DAT_000bbf00; // was `int` -- babl_alloc'd function-pointer-table base, same bug
undefined4 LAB_0001a120()

{
  /* Ghidra couldn't resolve this address into a proper function
     (an indirect-jump/jumptable target it gave up on). Recovered via
     Ghidra headless: the real body is a linked-list scan (walking a
     chain off *(int*)(DAT_0001a18c+0x34), stepping +0x20 per node,
     terminated by a zero short at +0x38) that unconditionally
     `return 0;` on every path -- whether or not it finds a match, it
     never returns anything else and has no side effects. Confirmed
     behaviorally equivalent to this stub, so left as-is rather than
     porting the dead search loop verbatim. */
  return 0;
}
short DAT_000bbf78;
short DAT_000bbf2c;
short DAT_000bbf74;
short DAT_000bbf1c;
short DAT_000bbf08;
/* Was a zero-initialized 8192-byte backing array -- same "real
   nonzero .data content missing from this port's build" bug class as
   several earlier-session fixes (message-scroll control codes,
   save-slot list text, etc). Confirmed via the real ARM binary
   (/Users/ccuddigan/Projects/UW1/uw-arm/UU.exe, address 0x845a8): the
   real bytes are the NUL-terminated string "say", immediately
   followed in memory by s_respond_000845ac's own "respond" (which
   this port's decompile already got right as a separate symbol at
   +4). Every one of DAT_000845a8's 3 use sites treats it purely as a
   read-only C string (babl_op_say's own symbol-name lookup, and its
   own babl_register_builtin call) -- there is no numeric/indexed use
   that would need the backing-array treatment, unlike this file's
   other DAT_..._backing arrays. Was empty, so babl_op_say could never
   match Bragit's real "say" symbol and register_builtin's own
   registration for it silently no-opped too -- this is why the NPC's
   own spoken lines never printed even after babl_menu started working
   (only the player's own numbered response list did, via a totally
   separate mechanism). */
char DAT_000845a8[] = "say";
char s_respond_000845ac[] = "respond";
undefined2 DAT_000bbfe8;
undefined2 DAT_000bbfd8;
undefined2 DAT_000bbfdc;
undefined1 DAT_000bc008;
short DAT_000bc024;
short DAT_000bc004;
undefined2 DAT_000bbfbc;
undefined2 DAT_000bbfe0;
undefined2 DAT_000bbfb8;
char *DAT_000bc020;
char *DAT_000bc000;
undefined1 DAT_000845b8;
undefined1 DAT_000845ba;
undefined1 DAT_000845d8;
undefined1 DAT_000845da;
undefined4 DAT_000bbf98;
 undefined2 DAT_000bbfa8_backing[8192];
#define DAT_000bbfa8 DAT_000bbfa8_backing[0]
 undefined2 DAT_000bbfc0_backing[8192];
#define DAT_000bbfc0 DAT_000bbfc0_backing[0]
undefined2 DAT_000bbfd0;
/* New this round -- referenced only via literal-pool constants inside
   babl_builtin_take_from_npc/take_id_from_npc (both still-unrecovered
   stubs at the time this was added). Ghidra never named either: a
   real-object scratch pointer read/written by both functions (checked
   for "is a specific target object already selected" before falling
   back to the current NPC, DAT_00100674) and what looks like a
   related small mode/count flag read alongside it. Left undescribed
   beyond that -- neither is exercised by any known conversation
   script yet, so their exact semantics haven't been confirmed live. */
intptr_t DAT_00202948; // was `int` in the raw decompile -- holds a real object pointer, same truncation bug class as every other pointer-holding global in this cluster
short DAT_002020c4;
undefined4 DAT_000bbff0;
undefined4 DAT_000bc010;
undefined4 DAT_000bc028;
undefined DAT_001007dd;
undefined DAT_001007de_backing[8192];
#define DAT_001007de DAT_001007de_backing[0]
char *g_selected_object;
undefined2 g_cursor_holding_state;
undefined *PTR_DAT_000845c8;
undefined1 DAT_000845e8_backing[65536];
#define DAT_000845e8 DAT_000845e8_backing[0]
 undefined2 DAT_000bbfc8_backing[8192];
#define DAT_000bbfc8 DAT_000bbfc8_backing[0]
 undefined2 DAT_000bbfb0_backing[8192];
#define DAT_000bbfb0 DAT_000bbfb0_backing[0]
char *DAT_0023be74;
char s_npc_attitude_000845f8[] = "npc_attitude";
// g_monster_max_stats_table was DAT_001007d4: a per-monster-class stat
// table (indexed by the low 6 bits of a monster object's own type id,
// 0x30-byte stride per class); byte 0 of each entry is that class's
// max HP, used to clamp regen (restore_stat_capped). NOT valid for the
// player object -- the player's type id (0x7f) happens to index this
// table's unused last slot, which is zeroed; see restore_stat_capped's
// own fix for why callers must special-case the player instead.
 undefined DAT_001007d4_backing[8192];
#define g_monster_max_stats_table DAT_001007d4_backing[0]
// DAT_001007da and DAT_001007e2 are further fields (offsets +6 and
// +0xe) within this same 0x30-byte-stride per-monster-class table,
// not standalone globals -- both were declared as lone bytes and
// then indexed with the table's own `[class * 0x30]` stride
// elsewhere in the file (a "flags" byte at +6, checked for bits
// 0x80/0x40/2/1 by various callers, and a "resist/save" byte at
// +0xe used by roll_skill_check). Aliased into the same backing
// array so that indexed access reads the real adjacent bytes instead
// of walking off the end of a 1-byte global.
#define DAT_001007da DAT_001007d4_backing[6]
#define DAT_001007e2 DAT_001007d4_backing[0xe]
#define DAT_001007ed DAT_001007d4_backing[0x19]
/* Widened from 32768: load_3d_object_models does
   `Ordinal_1044(&DAT_00189590,&DAT_00110ff0,0x78580);` (a 492928-byte
   memmove, confirmed by ASAN global-buffer-overflow), matching
   DAT_00189590's own size (985856, an earlier widening pass already
   caught the destination but missed this source). */
undefined DAT_00110ff0_backing[985856];
#define DAT_00110ff0 DAT_00110ff0_backing[0]
undefined DAT_00110ffc;
undefined1 DAT_00189590_backing[985856];
#define DAT_00189590 DAT_00189590_backing[0]
undefined DAT_0018959c;
undefined DAT_0018959d;
undefined DAT_0018959e;
undefined DAT_0018959f;
undefined *PTR_Ordinal_2021_00084030;
undefined *PTR_Ordinal_2027_00084094;
undefined *PTR_Ordinal_2044_00084034;
/* build_trig_tables builds these as 361-entry (0..360 degrees) sin / cos
   tables (float bit patterns); every reader indexes
   `(&DAT_000d99xx)[angle]`. Were lone `undefined4` scalars, so
   build_trig_tables's `[0..360]` writes smashed ~1.4 KB of adjacent
   globals. In UU.exe they are contiguous .bss (0xd9930 sin, 0xd9ed8
   cos). */
 undefined4 DAT_000d9930_arr[512];
#define DAT_000d9930 (DAT_000d9930_arr[0])
 undefined4 DAT_000d9ed8_arr[512];
#define DAT_000d9ed8 (DAT_000d9ed8_arr[0])
undefined4 DAT_000db438;
undefined4 DAT_000db43c;
undefined4 DAT_000db440;
int DAT_000db448;
int DAT_000db44c;
int DAT_000db450;
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
int g_billboard_angle_override_deg = -1;
/* Live-tunable door-frame anchor constants (UW_MODEL_TUNER=1) -- see the
   wall-plane fix in emit_catalog_object's own catalog_u==1 block. Three
   real regressions already came from guessing these numbers, rebuilding,
   and only then finding out live whether a guess was right; this lets
   the door panel show tunable rows so a value can be nudged and watched
   change on screen the same frame, with no rebuild. g_tune_wide_center
   is the wide/along-the-wall axis's offset from the tile's own origin;
   g_tune_edge_offset is the wall-perpendicular axis's offset from
   whichever tile edge it's nearest. Live QA confirmed both at 128.0 --
   i.e. the "wall has real thickness, the perpendicular axis sits at
   edge+16" theory (tried and initially reported as an improvement) was
   itself wrong; the real answer is simpler, exact tile center on BOTH
   axes, no wall-thickness concept needed. At edge_offset==128 the near/
   far edge-side branch in the fix below collapses to the same value
   either way (128 or 256-128), so this is equivalent to just always
   centering -- kept as two separately-tunable fields anyway in case a
   future model (not a full-tile-wide one like DFRAME.E) genuinely needs
   something else. */
double g_tune_wide_center = 128.0;
double g_tune_edge_offset = 128.0;
/* QA report: "rotation origin is in the middle of the leaf and not the
   hinge, so rotation looks off." The leaf (catalog_u==0xe/0xf, DOOR.E)
   currently shares DFRAME's own anchor exactly (DAT_0023b904/920, set
   once by the catalog_u==1 block above and simply left in place for
   the leaf's own later, separate call to reuse) -- correct for a
   symmetric, full-tile-wide, non-rotating object like the frame, but
   DOOR.E's own local mesh (POINTS span local X 0-128, not symmetric
   around 0) rotates around whatever world point its local origin
   lands on, so sharing the frame's centered anchor puts that pivot
   roughly mid-leaf instead of at the hinge edge. Not yet live-tuned to
   a confirmed-correct value (unlike wide_center/edge_offset above,
   which WERE) -- starts at 0.0 (no change from current behavior) and
   is meant to be nudged live via the object tuner panel (backtick)
   while watching a real door swing, the same successful process
   wide_center/edge_offset themselves were dialed in with, rather than
   guessed and hardcoded blind. Applied along the model's own "wide"
   axis (the same one wide_center offsets) in the leaf-specific rebake
   a few hundred lines below. */
double g_tune_leaf_hinge_offset = 0.0;
/* General object-tuner state (UW_MODEL_TUNER=1) -- was door-only (the
   panel only populated inside catalog_u==1, and only showed the two
   door-anchor fields above); generalized so ANY catalog this session's
   native mesh path draws (boulder, bridge, door, ...) gets a live panel
   whenever it's on screen, per direct request: "convert the door debug
   tool to a general object debug tool so we can try giving the object
   a rotation offset and view it from all angles." g_tune_rotation_offset
   is added directly to the model's own real final rotation angle
   (sVar13, degrees) right before build_euler_rotation_matrix runs, so
   walking around a normally-facing object and nudging this field is
   equivalent to spinning the OBJECT rather than the camera -- useful
   for exactly the kind of "does this face-order bug only show from
   certain angles" question that motivated adding it. g_tune_last_catalog
   resets the offset to 0 whenever the catalog on screen changes, so a
   leftover rotation from tuning one object (e.g. a boulder) doesn't
   silently carry over and confuse the next one (e.g. a door) -- same
   "reseed on id change" shape the original e-model-texturing tuner used
   for its own per-model fields. */
double g_tune_rotation_offset = 0.0;
int g_tune_last_catalog = -1;
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
/* Debug-panel toggle (dbgui_field_toggle) for pick_object_under_cursor's
   own UW_PICK_DIAG trace -- lets the pick stencil/object-resolution trace
   be flipped on live from the object tuner panel instead of needing a
   relaunch with the env var set. Read alongside getenv("UW_PICK_DIAG") at
   each pick call, not cached, so toggling it mid-session takes effect on
   the very next click. */
int g_uw_debug_pick_diag = 0;
/* DAT_000c8ac0-family: 12 separately-declared globals that are really the
   12 non-translation-column elements of one 4x4 (16 x undefined4, 64-byte)
   view/camera matrix -- build_view_matrix writes the whole matrix in one shot
   via `multiply_matrix4x4(...,...,&DAT_000c8ac0)`, a matrix-multiply that treats
   its output as one contiguous 64-byte buffer starting at DAT_000c8ac0
   (including the 4 never-individually-named "column 3" slots at
   +0xc/+0x1c/+0x2c/+0x3c, always 0/0/0/1 for this kind of matrix). As
   separate globals our compiler doesn't guarantee they're adjacent, so
   that write would land wherever the linker happened to place each one --
   same lone-scalar/stray-symbol-declared-instead-of-a-real-array pattern
   fixed repeatedly this session, just spread across a dozen names instead
   of one. Real backing array + aliases at each element's correct offset. */
 undefined4 DAT_000c8ac0_mtx[16];
#define DAT_000c8ac0 DAT_000c8ac0_mtx[0]
#define DAT_000c8ac4 DAT_000c8ac0_mtx[1]
#define DAT_000c8ac8 DAT_000c8ac0_mtx[2]
#define DAT_000c8ad0 DAT_000c8ac0_mtx[4]
#define DAT_000c8ad4 DAT_000c8ac0_mtx[5]
#define DAT_000c8ad8 DAT_000c8ac0_mtx[6]
#define DAT_000c8ae0 DAT_000c8ac0_mtx[8]
#define DAT_000c8ae4 DAT_000c8ac0_mtx[9]
#define DAT_000c8ae8 DAT_000c8ac0_mtx[10]
#define DAT_000c8af0 DAT_000c8ac0_mtx[12]
#define DAT_000c8af4 DAT_000c8ac0_mtx[13]
#define DAT_000c8af8 DAT_000c8ac0_mtx[14]
int DAT_000c8c98;
/* Recovered from UU.exe .data at 0x84608: the near-clip distance,
   float 5.0 (bit pattern 0x40a00000). render_visible_tile_list /
   near_clip_visible_tiles pass it straight to the softfloat compare/subtract
   ordinals as a float bit pattern. Was silently zero -> the near-plane
   clip and the 1/(z-near) perspective divide both degenerated. */
undefined4 DAT_00084608 = 0x40a00000u;
/* DAT_000bc038-family: ~40 separately-declared 1-byte globals that are
   really one 0x88(136)-byte-stride per-tile record array (its sibling
   DAT_000bc044 -- a few bytes further into the same original record --
   was already fixed as a real backing array by a prior session; these
   were missed). render_visible_tile_list's tile-visibility pass indexes them all with
   the same `local_7c*0x88 [+ byte offset]` scheme (confirmed: the byte
   offsets below, relative to DAT_000bc038, span exactly 0..0x87, one full
   record). As lone scalars this walks off into whatever memory happens to
   follow them, corrupting adjacent globals -- confirmed crashing
   (EXC_BAD_ACCESS) a few calls further down this same file. Same
   lone-scalar-used-as-array pattern fixed repeatedly this session; given
   DAT_000bc044's real size the same generous record count. */
 undefined DAT_000bc038_backing[32768];
#define DAT_000bc038 DAT_000bc038_backing[0]
#define DAT_000bc039 DAT_000bc038_backing[1]
#define DAT_000bc03a DAT_000bc038_backing[2]
#define DAT_000bc03b DAT_000bc038_backing[3]
/* 0xbc044 is 0xc bytes into the same record as 0xbc038 -- near_clip_visible_tiles
   writes each clipped vertex's Z here and render_visible_tile_list reads
   it back as piVar14[3] / piVar14[iVar17+0xc]. It was a SEPARATE 32KB
   array (0x8000 bytes away from DAT_000bc038_backing), so the Z never
   reached render -> every tile's 1/z divide hit 0 -> everything drew at
   the viewport centre. */
#define DAT_000bc044 DAT_000bc038_backing[0xc]
#define DAT_000bc07c DAT_000bc038_backing[0x44]
#define DAT_000bc07d DAT_000bc038_backing[0x45]
#define DAT_000bc07e DAT_000bc038_backing[0x46]
#define DAT_000bc07f DAT_000bc038_backing[0x47]
#define DAT_000bc0a0 DAT_000bc038_backing[0x68]
#define DAT_000bc0a1 DAT_000bc038_backing[0x69]
#define DAT_000bc0a2 DAT_000bc038_backing[0x6a]
#define DAT_000bc0a3 DAT_000bc038_backing[0x6b]
#define DAT_000bc0a4 DAT_000bc038_backing[0x6c]
#define DAT_000bc0a5 DAT_000bc038_backing[0x6d]
#define DAT_000bc0a6 DAT_000bc038_backing[0x6e]
#define DAT_000bc0a7 DAT_000bc038_backing[0x6f]
#define DAT_000bc0a8 DAT_000bc038_backing[0x70]
#define DAT_000bc0a9 DAT_000bc038_backing[0x71]
#define DAT_000bc0aa DAT_000bc038_backing[0x72]
#define DAT_000bc0ab DAT_000bc038_backing[0x73]
#define DAT_000bc0ac DAT_000bc038_backing[0x74]
#define DAT_000bc0ad DAT_000bc038_backing[0x75]
#define DAT_000bc0ae DAT_000bc038_backing[0x76]
#define DAT_000bc0af DAT_000bc038_backing[0x77]
#define DAT_000bc0b0 DAT_000bc038_backing[0x78]
#define DAT_000bc0b1 DAT_000bc038_backing[0x79]
#define DAT_000bc0b2 DAT_000bc038_backing[0x7a]
#define DAT_000bc0b3 DAT_000bc038_backing[0x7b]
#define DAT_000bc0b4 DAT_000bc038_backing[0x7c]
#define DAT_000bc0b5 DAT_000bc038_backing[0x7d]
#define DAT_000bc0b6 DAT_000bc038_backing[0x7e]
#define DAT_000bc0b7 DAT_000bc038_backing[0x7f]
#define DAT_000bc0b8 DAT_000bc038_backing[0x80]
#define DAT_000bc0b9 DAT_000bc038_backing[0x81]
#define DAT_000bc0ba DAT_000bc038_backing[0x82]
#define DAT_000bc0bb DAT_000bc038_backing[0x83]
#define DAT_000bc0bc DAT_000bc038_backing[0x84]
#define DAT_000bc0bd DAT_000bc038_backing[0x85]
#define DAT_000bc0be DAT_000bc038_backing[0x86]
#define DAT_000bc0bf DAT_000bc038_backing[0x87]
/* DAT_000c4838-family: same story, but holding real 8-byte pointers (one
   per visible-tile record, written by near_clip_visible_tiles and read back by
   render_visible_tile_list) rather than bytes -- was a lone `undefined4` (4 bytes),
   which would silently truncate every pointer stored into it on this
   64-bit port even before the out-of-bounds-array problem. Real backing
   array of genuine pointer-sized slots, same generous record count as its
   sibling arrays above. */
 void *DAT_000c4838_backing[4096];
#define DAT_000c4838 DAT_000c4838_backing[0]
/* Recovered from UU.exe .data at 0x8462c: the 3D viewport clip rect
   {x0=0x34, y0=0x13, w=0xe0, h=0x84} == {52, 19, 224, 132}, matching
   render_dungeon_view's `rect_fill(0x34,0x13,0xe0,0x83)`. render_visible_tile_
   list copies these into a local passed to raster_triangle as param_8;
   raster_triangle only calls the span rasterizer raster_textured_span inside
   `while (param_8[0] != 0 && ...)`. All zero -> that loop never ran ->
   no pixel ever drawn even with the geometry projecting into view. */
undefined4 DAT_0008462c = 0x34;
undefined4 DAT_00084634 = 0xe0;
undefined4 DAT_00084630 = 0x13;
undefined4 DAT_00084638 = 0x84;
/* Recovered from UU.exe .data at 0x84610: the perspective/screen scale,
   integer 100. render_visible_tile_list does Ordinal_2032(DAT_00084610)
   (int->float) -> 100.0, then multiplies each vertex's 1/z * eye-space
   coord by it to get the screen offset from the viewport centre. Was
   silently zero -> that offset was always 0, so every tile triangle
   projected to the single centre point (x=140, y=80). */
undefined4 DAT_00084610 = 100u;
undefined1 *DAT_000db45c;
int DAT_000db458;
// was DAT_000d91d0 -- running point count while parse_e_model_file reads
// a .E model's POINTS block (bounded at 600, see the "Too many points"
// error); indexes both the point-scratch arrays and the final per-model
// output buffer's points array.
int g_model_parse_point_count;
int DAT_000db4fc;
int *DAT_000c8b00;
// was DAT_000db430 -- running part (face) count while parse_e_model_file
// reads a .E model's PARTS block (bounded at 0x15e=350, see the "Too many
// polys" error); indexes both the part-scratch arrays and the final
// per-model output buffer's parts array.
int g_model_parse_part_count;
int DAT_00084660;
int DAT_0008465c;
int DAT_00084670;
int DAT_0008466c;
// DAT_000db480/DAT_000db470: gate the PARTS block's 'A' (auto-backside)
// handling and an INTERSECTIONS-vs-other-block branch, but neither is
// ever WRITTEN anywhere in this decompile -- always BSS-zero here, which
// makes the 'A' backside-generation code (see vec3_cross's caller,
// parse_e_model_file's "making backside of %d %d" branch) and the
// INTERSECTIONS default path unconditionally taken as if these flags are
// always off. Not renamed: unclear whether that's really how the
// original binary behaves (a hidden writer elsewhere, not yet checked
// via Ghidra the way DAT_00085668 and friends were) or a genuine
// decompile gap, so a confident name isn't warranted yet.
int DAT_000db480;
int DAT_000db470;
int DAT_000db4d4;
int DAT_000db4d8;
int DAT_000db4d0;
// DAT_000db494: gates whether parse_e_model_file resolves each PARTS
// entry's EXTENDED_COLORS index against g_model_known_ext_colors (and the
// function's own final scratch-to-scratch color-inheritance pass). Same
// "never written anywhere in this decompile" situation as DAT_000db480/
// DAT_000db470 just above -- always reads BSS-zero here, so this whole
// resolution path is presently dead code for every model regardless of
// whether the file actually has an EXTENDED_COLORS block. Not renamed
// for the same reason.
int DAT_000db494;
int DAT_000db4e0;
// was DAT_00084678 -- a fixed table of up to 32 known 24-bit RGB values
// (0x00RRGGBB-shaped ints) that parse_e_model_file's EXTENDED_COLORS
// handling linearly searches to turn each entry's literal RGB (e.g.
// "545454" in ROCKSMAL.E) into a small index, stored per-part -- a
// palette-index lookup, not a raw-color passthrough. Gated dead by
// DAT_000db494 above, so this table is currently never actually
// consulted despite being real, meaningful data.
undefined4 g_model_known_ext_colors;
char s_unexpected_EOF___no_END_statemen_000846f8[] = "unexpected_EOF_-_no_END_statemen";
char s________c_0008471c[] = "%*[^}]%c";
char s___d__00084728[] = "(%d)";
static undefined DAT_00084730_backing[8192];
#define DAT_00084730 DAT_00084730_backing[0]
char s_anim__d___d__c__d__d___00084734[] = "anim_%d_(%d,%c,%d,%d):";
char s__d__1s__d__d__1s_0008474c[] = "%d,%1s,%d,%d,%1s";
char s_ANIMATE_00084760[] = "ANIMATE";
char s_Error__extended_color_for_part___00084768[] = "Error:_extended_color_for_part_%";
/* Was "%lx%1s" -- correct as recovered from the original 32-bit binary,
   where 'long' and 'int' are both 4 bytes, matching the destination
   (parse_e_model_file's `int local_208;`). On this 64-bit host 'long' is 8
   bytes, so vfscanf wrote a full 8-byte value through Ordinal_1114 into
   that 4-byte stack slot -- a real stack-buffer-overflow (confirmed via
   ASAN), not a truncation-in-the-other-direction case like most of this
   file's other pointer/int-width bugs. Fixed by dropping the 'l' length
   modifier to match the 32-bit-correct destination width instead of
   widening the destination, since every other use of this value in
   parse_e_model_file treats it as a plain 4-byte int. */
char s__lx_1s_000847a4[] = "%x%1s";
char s_EXTENDED_COLORS_000847ac[] = "EXTENDED_COLORS";
char s_INTERSECTIONS_000847bc[] = "INTERSECTIONS";
char s__c__d__d__d__d__d___c__000847cc[] = "%c,%d,%d,%d,%d,%d_(%c)";
char s__1s__d__d__d_1s_000847e4[] = "%1s,%d,%d,%d%1s";
char s__1s__d__d__d__d__d_1s_000847f4[] = "%1s,%d,%d,%d,%d,%d%1s";
char s_branch_0008480c[] = "branch";
static undefined DAT_00084814_backing[8192];
#define DAT_00084814 DAT_00084814_backing[0]
char s_leaf_00084818[] = "leaf";
static undefined DAT_00084820_backing[8192];
#define DAT_00084820 DAT_00084820_backing[0]
char s_SUPER_NODES_00084828[] = "SUPER_NODES";
char s_NODES_00084834[] = "NODES";
char s_CLUSTERS_0008483c[] = "CLUSTERS";
char s_making_backside_of__d_____d_00084848[] = "making_backside_of_%d_->_%d";
char s_Error__Part__d_is_a_polygon_with_00084868[] = "Error:_Part_%d_is_a_polygon_with";
char s_Error__polygon__d__bitmap_must_h_00084898[] = "Error:_polygon_%d:_bitmap_must_h";
char s__d_1s_000848c8[] = "%d%1s";
char s__d__d_000848d0[] = "%d,%d";
char s_________c_000848d8[] = "%*[^;}]%c";
char s_got_sphere__d_000848e4[] = "got_sphere_%d";
static undefined DAT_000848f4_backing[8192];
#define DAT_000848f4 DAT_000848f4_backing[0]
char s_Too_many_polys_000848f8[] = "Too_many_polys";
char s_Out_of_vertex_list_space_00084908[] = "Out_of_vertex_list_space";
char s__d__d__d__d_00084924[] = "%d,%d,%d,%d";
char s_got_bitmap__d___d_00084930[] = "got_bitmap_%d:_%d";
char s__d__1s__d__x__00084944[] = "%d,%1s,%d,%x,";
char s___c_1____00084954[] = "%*c%1[}]";
char s_PARTS_00084960[] = "PARTS";
char s_Too_many_points___d__00084968[] = "Too_many_points_(%d)";
char s__d__d__d__00084980[] = "%d,%d,%d;";
char s_POINTS_0008498c[] = "POINTS";
char s__1s______1s_00084994[] = "%1s%[^\"]%1s";
char s_NAMES_000849a0[] = "NAMES";
/* Unrecoverable scanf-format string constants (Ghidra never recovered
   their content). Best-effort guesses from call shape, not confirmed
   against real file content the way DAT_000849c8 ("END") was:
   DAT_000849a8 is used identically to the confirmed "%1s"/"%100s%1s"
   format strings right next to it in this same parser (single-char
   token read into a 4-byte buffer, local_260) at most call sites, so
   "%1s". DAT_000849ac is read right after matching the "VERSION" token,
   with a real file's content being "VERSION {0}" (DATA3D/DFRAME.E) --
   guessed as " {%d}" to parse the braced integer. Some call sites pass
   more destination pointers than either guessed format has specifiers
   for (this file's argument-count-per-call-site is already established
   as unreliable throughout the decompile); harmless since vfscanf simply
   won't consume args past what the format string actually specifies. */
static char DAT_000849a8_backing[8192] = "%1s";
#define DAT_000849a8 DAT_000849a8_backing[0]
static char DAT_000849ac_backing[8192] = "%d";
#define DAT_000849ac DAT_000849ac_backing[0]
char s_VERSION_000849b0[] = "VERSION";
char s_error___s__c_000849b8[] = "error:_%s,%c";
/* Unrecoverable string constant (Ghidra never recovered its content) --
   confirmed "END" by inspecting a real .E model file (DATA3D/DFRAME.E):
   the game's text script parser (parse_e_model_file) brackets every model with
   a BEGIN...END pair (see s_BEGIN_00084a14/s_Input_file_error...), and
   this is the only unresolved string used as the closing-token
   comparison (Ordinal_1065(token,&DAT_000849c8) / Ordinal_1070 with
   length 3 for a truncated-token EOF check) right where a real file's
   content literally ends with the line "END". Leaving it empty meant
   "END" never matched, so every model's parse fell through to the
   unexpected-EOF/malformed-file exit path instead of completing.
   Kept as a backing-array + #define alias (not a plain char[]) because
   call sites take its address with '&DAT_000849c8', which only stays a
   plain char* (not a pointer-to-array) when DAT_000849c8 is itself a
   scalar macro'd to the array's first element, matching every other
   widened-global in this file. */
static char DAT_000849c8_backing[8192] = "END";
#define DAT_000849c8 DAT_000849c8_backing[0]
char s__100s_1s_000849cc[] = "%100s%1s";
char s__1s__a_z__1s_000849d8[] = "%1s%[a-z]%1s";
char s_Input_file_error__BEGIN_statemen_000849e8[] = "Input_file_error:_BEGIN_statemen";
char s_BEGIN_00084a14[] = "BEGIN";
char s__100s_00084a1c[] = "%100s";
static undefined DAT_00084a24_backing[8192];
#define DAT_00084a24 DAT_00084a24_backing[0]
/* DAT_000c4c38 (a vertex-data scratch buffer, see parse_e_model_file's ".E"
   model parser: `DAT_000c8b00 = &DAT_000c4c38;` starts a write cursor
   there and walks it forward one 4-byte slot at a time while parsing
   PARTS) was declared as a lone undefined4 scalar -- Ghidra only saw the
   first slot. Its real extent is bounded by DAT_000c8a90, which the
   parser compares the write cursor against ("Out of vertex list space"
   if exceeded) -- but DAT_000c8a90 was ALSO just a lone undefined byte,
   whose only meaning was "whatever address the original 32-bit linker
   happened to place 0x3e58 bytes after DAT_000c4c38" (whatever unrelated
   global that turned out to be). On this 64-bit recompile the two
   globals land wherever the linker wants, nowhere near 0x3e58 bytes
   apart, so the very first vertex written already tripped the
   "&DAT_000c8a90 < DAT_000c8b00" bounds check. Fixed by giving
   DAT_000c4c38 a real backing buffer sized to that same 0x3e58 byte
   span (preserving the original capacity/behavior) and defining
   DAT_000c8a90 as the address exactly one-past-its-end, restoring the
   original relationship. */
static char DAT_000c4c38_backing[0x3e58];
#define DAT_000c4c38 (*(undefined4 *)DAT_000c4c38_backing)
#define DAT_000c8a90 (*(undefined1 *)(DAT_000c4c38_backing + 0x3e58))
static undefined1 DAT_000c8b08_backing[65536];
#define DAT_000c8b08 DAT_000c8b08_backing[0]
/* Base of a growing per-cluster-connection undefined4 array in
   parse_e_model_file's CLUSTERS block (`puVar8 = &DAT_000c8ca0; ... *puVar8 =
   local_1d8; puVar8 = puVar8 + 1;`) -- same undersized-scalar bug as
   DAT_000da868/DAT_000dab90 right above, for the same block. */
static undefined1 DAT_000c8ca0_backing[65536];
#define DAT_000c8ca0 DAT_000c8ca0_backing[0]
/* DAT_000c9540..DAT_000c9555 (22 fields): another per-record byte-field
   cluster in parse_e_model_file's ".E" model parser (NODES block), same
   undersized-scalar bug as DAT_000d2ab0/DAT_000c9dd8/DAT_000c8ca0/
   DAT_000da868/DAT_000dab90 above -- found via a systematic scan of
   every `(&DAT_x)[idx]` pattern in this function after the POINTS/PARTS/
   CLUSTERS instances turned out not to be the only ones (a real model
   file's parse was still corrupting an unrelated global afterward).
   Widened the same way. */
static undefined1 DAT_000c9540_backing[65536];
#define DAT_000c9540 DAT_000c9540_backing[0]
static undefined1 DAT_000c9541_backing[65536];
#define DAT_000c9541 DAT_000c9541_backing[0]
static undefined1 DAT_000c9542_backing[65536];
#define DAT_000c9542 DAT_000c9542_backing[0]
static undefined1 DAT_000c9543_backing[65536];
#define DAT_000c9543 DAT_000c9543_backing[0]
static undefined1 DAT_000c9544_backing[65536];
#define DAT_000c9544 DAT_000c9544_backing[0]
static undefined1 DAT_000c9545_backing[65536];
#define DAT_000c9545 DAT_000c9545_backing[0]
static undefined1 DAT_000c9546_backing[65536];
#define DAT_000c9546 DAT_000c9546_backing[0]
static undefined1 DAT_000c9547_backing[65536];
#define DAT_000c9547 DAT_000c9547_backing[0]
static undefined1 DAT_000c9548_backing[65536];
#define DAT_000c9548 DAT_000c9548_backing[0]
static undefined1 DAT_000c9549_backing[65536];
#define DAT_000c9549 DAT_000c9549_backing[0]
static undefined1 DAT_000c954a_backing[65536];
#define DAT_000c954a DAT_000c954a_backing[0]
static undefined1 DAT_000c954b_backing[65536];
#define DAT_000c954b DAT_000c954b_backing[0]
static undefined1 DAT_000c954c_backing[65536];
#define DAT_000c954c DAT_000c954c_backing[0]
static undefined1 DAT_000c954d_backing[65536];
#define DAT_000c954d DAT_000c954d_backing[0]
static undefined1 DAT_000c954e_backing[65536];
#define DAT_000c954e DAT_000c954e_backing[0]
static undefined1 DAT_000c954f_backing[65536];
#define DAT_000c954f DAT_000c954f_backing[0]
static undefined1 DAT_000c9550_backing[65536];
#define DAT_000c9550 DAT_000c9550_backing[0]
static undefined1 DAT_000c9551_backing[65536];
#define DAT_000c9551 DAT_000c9551_backing[0]
static undefined1 DAT_000c9552_backing[65536];
#define DAT_000c9552 DAT_000c9552_backing[0]
static undefined1 DAT_000c9553_backing[65536];
#define DAT_000c9553 DAT_000c9553_backing[0]
static undefined1 DAT_000c9554_backing[65536];
#define DAT_000c9554 DAT_000c9554_backing[0]
static undefined1 DAT_000c9555_backing[65536];
#define DAT_000c9555 DAT_000c9555_backing[0]
/* DAT_000c9dd8 through DAT_000c9de3 (12 globals) are byte fields of a
   0x67(103)-byte-stride per-PART record in parse_e_model_file's ".E" model
   parser (`iVar5 = g_model_parse_part_count * 0x67; (&DAT_000c9ddc)[iVar5] = ...`),
   bounded by `if (0x15e < g_model_parse_part_count)` (350 parts) -- same undersized-
   scalar-instead-of-real-table bug as the DAT_000d2ab0-family POINTS
   record right above, just for PARTS. Widened the same way. */
static undefined1 DAT_000c9dd8_backing[65536];
#define DAT_000c9dd8 DAT_000c9dd8_backing[0]
static undefined1 DAT_000c9dd9_backing[65536];
#define DAT_000c9dd9 DAT_000c9dd9_backing[0]
static undefined1 DAT_000c9dda_backing[65536];
#define DAT_000c9dda DAT_000c9dda_backing[0]
static undefined1 DAT_000c9ddb_backing[65536];
#define DAT_000c9ddb DAT_000c9ddb_backing[0]
static undefined1 DAT_000c9ddc_backing[65536];
#define DAT_000c9ddc DAT_000c9ddc_backing[0]
static undefined1 DAT_000c9ddd_backing[65536];
#define DAT_000c9ddd DAT_000c9ddd_backing[0]
static undefined1 DAT_000c9dde_backing[65536];
#define DAT_000c9dde DAT_000c9dde_backing[0]
static undefined1 DAT_000c9ddf_backing[65536];
#define DAT_000c9ddf DAT_000c9ddf_backing[0]
static undefined1 DAT_000c9de0_backing[65536];
#define DAT_000c9de0 DAT_000c9de0_backing[0]
static undefined1 DAT_000c9de1_backing[65536];
#define DAT_000c9de1 DAT_000c9de1_backing[0]
static undefined1 DAT_000c9de2_backing[65536];
#define DAT_000c9de2 DAT_000c9de2_backing[0]
static undefined1 DAT_000c9de3_backing[65536];
#define DAT_000c9de3 DAT_000c9de3_backing[0]
/* DAT_000c9e0e..DAT_000c9e3e (30 fields): same bug, same parser, same
   systematic-scan discovery as DAT_000c9540 above. */
static undefined1 DAT_000c9e0e_backing[65536];
#define DAT_000c9e0e DAT_000c9e0e_backing[0]
static undefined1 DAT_000c9e0f_backing[65536];
#define DAT_000c9e0f DAT_000c9e0f_backing[0]
static undefined1 DAT_000c9e10_backing[65536];
#define DAT_000c9e10 DAT_000c9e10_backing[0]
static undefined1 DAT_000c9e11_backing[65536];
#define DAT_000c9e11 DAT_000c9e11_backing[0]
static undefined1 DAT_000c9e22_backing[65536];
#define DAT_000c9e22 DAT_000c9e22_backing[0]
static undefined1 DAT_000c9e23_backing[65536];
#define DAT_000c9e23 DAT_000c9e23_backing[0]
static undefined1 DAT_000c9e24_backing[65536];
#define DAT_000c9e24 DAT_000c9e24_backing[0]
static undefined1 DAT_000c9e25_backing[65536];
#define DAT_000c9e25 DAT_000c9e25_backing[0]
static undefined1 DAT_000c9e26_backing[65536];
#define DAT_000c9e26 DAT_000c9e26_backing[0]
static undefined1 DAT_000c9e28_backing[65536];
#define DAT_000c9e28 DAT_000c9e28_backing[0]
static undefined1 DAT_000c9e29_backing[65536];
#define DAT_000c9e29 DAT_000c9e29_backing[0]
static undefined1 DAT_000c9e2b_backing[65536];
#define DAT_000c9e2b DAT_000c9e2b_backing[0]
static undefined1 DAT_000c9e2c_backing[65536];
#define DAT_000c9e2c DAT_000c9e2c_backing[0]
static undefined1 DAT_000c9e2d_backing[65536];
#define DAT_000c9e2d DAT_000c9e2d_backing[0]
static undefined1 DAT_000c9e2e_backing[65536];
#define DAT_000c9e2e DAT_000c9e2e_backing[0]
static undefined1 DAT_000c9e2f_backing[65536];
#define DAT_000c9e2f DAT_000c9e2f_backing[0]
static undefined1 DAT_000c9e30_backing[65536];
#define DAT_000c9e30 DAT_000c9e30_backing[0]
static undefined1 DAT_000c9e31_backing[65536];
#define DAT_000c9e31 DAT_000c9e31_backing[0]
static undefined1 DAT_000c9e32_backing[65536];
#define DAT_000c9e32 DAT_000c9e32_backing[0]
static undefined1 DAT_000c9e33_backing[65536];
#define DAT_000c9e33 DAT_000c9e33_backing[0]
static undefined1 DAT_000c9e34_backing[65536];
#define DAT_000c9e34 DAT_000c9e34_backing[0]
static undefined1 DAT_000c9e35_backing[65536];
#define DAT_000c9e35 DAT_000c9e35_backing[0]
static undefined1 DAT_000c9e36_backing[65536];
#define DAT_000c9e36 DAT_000c9e36_backing[0]
static undefined1 DAT_000c9e37_backing[65536];
#define DAT_000c9e37 DAT_000c9e37_backing[0]
static undefined1 DAT_000c9e38_backing[65536];
#define DAT_000c9e38 DAT_000c9e38_backing[0]
static undefined1 DAT_000c9e39_backing[65536];
#define DAT_000c9e39 DAT_000c9e39_backing[0]
static undefined1 DAT_000c9e3a_backing[65536];
#define DAT_000c9e3a DAT_000c9e3a_backing[0]
static undefined1 DAT_000c9e3b_backing[65536];
#define DAT_000c9e3b DAT_000c9e3b_backing[0]
static undefined1 DAT_000c9e3c_backing[65536];
#define DAT_000c9e3c DAT_000c9e3c_backing[0]
static undefined1 DAT_000c9e3d_backing[65536];
#define DAT_000c9e3d DAT_000c9e3d_backing[0]
static undefined1 DAT_000c9e3e_backing[65536];
#define DAT_000c9e3e DAT_000c9e3e_backing[0]
/* DAT_000d2ab0 through DAT_000d2ad3 (28 globals) are individual byte
   fields of a 0x2c(44)-byte-stride per-POINT record in parse_e_model_file's
   ".E" model parser (`iVar6 = g_model_parse_point_count * 0x2c; (&DAT_000d2ab0)[iVar6]
   = ...;`, bounded by `if (600 < g_model_parse_point_count)`) -- up to 600 points *
   44 bytes = 26400 bytes needed per field, but each was declared as a
   lone `undefined1` scalar. A watchpoint confirmed this overflow
   corrupting an unrelated global (DAT_002029cc, ~26KB+ away) during a
   real model file's parse, which crashed much later and far from the
   actual bad write -- the same "detected at a distance" pattern as the
   STRINGS.PAK heap corruption. Widened with the usual backing-buffer
   pattern. */
static undefined1 DAT_000d2ab0_backing[32768];
#define DAT_000d2ab0 DAT_000d2ab0_backing[0]
static undefined1 DAT_000d2ab1_backing[32768];
#define DAT_000d2ab1 DAT_000d2ab1_backing[0]
static undefined1 DAT_000d2ab2_backing[32768];
#define DAT_000d2ab2 DAT_000d2ab2_backing[0]
static undefined1 DAT_000d2ab3_backing[32768];
#define DAT_000d2ab3 DAT_000d2ab3_backing[0]
static undefined1 DAT_000d2ab4_backing[32768];
#define DAT_000d2ab4 DAT_000d2ab4_backing[0]
static undefined1 DAT_000d2ab5_backing[32768];
#define DAT_000d2ab5 DAT_000d2ab5_backing[0]
static undefined1 DAT_000d2ab6_backing[32768];
#define DAT_000d2ab6 DAT_000d2ab6_backing[0]
static undefined1 DAT_000d2ab7_backing[32768];
#define DAT_000d2ab7 DAT_000d2ab7_backing[0]
static undefined1 DAT_000d2ab8_backing[32768];
#define DAT_000d2ab8 DAT_000d2ab8_backing[0]
static undefined1 DAT_000d2ab9_backing[32768];
#define DAT_000d2ab9 DAT_000d2ab9_backing[0]
static undefined1 DAT_000d2aba_backing[32768];
#define DAT_000d2aba DAT_000d2aba_backing[0]
static undefined1 DAT_000d2abb_backing[32768];
#define DAT_000d2abb DAT_000d2abb_backing[0]
static undefined1 DAT_000d2abc_backing[32768];
#define DAT_000d2abc DAT_000d2abc_backing[0]
static undefined1 DAT_000d2abd_backing[32768];
#define DAT_000d2abd DAT_000d2abd_backing[0]
static undefined1 DAT_000d2abe_backing[32768];
#define DAT_000d2abe DAT_000d2abe_backing[0]
static undefined1 DAT_000d2abf_backing[32768];
#define DAT_000d2abf DAT_000d2abf_backing[0]
static undefined1 DAT_000d2ac0_backing[32768];
#define DAT_000d2ac0 DAT_000d2ac0_backing[0]
static undefined1 DAT_000d2ac1_backing[32768];
#define DAT_000d2ac1 DAT_000d2ac1_backing[0]
static undefined1 DAT_000d2ac2_backing[32768];
#define DAT_000d2ac2 DAT_000d2ac2_backing[0]
static undefined1 DAT_000d2ac3_backing[32768];
#define DAT_000d2ac3 DAT_000d2ac3_backing[0]
static undefined1 DAT_000d2ac8_backing[32768];
#define DAT_000d2ac8 DAT_000d2ac8_backing[0]
static undefined1 DAT_000d2ac9_backing[32768];
#define DAT_000d2ac9 DAT_000d2ac9_backing[0]
static undefined1 DAT_000d2aca_backing[32768];
#define DAT_000d2aca DAT_000d2aca_backing[0]
static undefined1 DAT_000d2acb_backing[32768];
#define DAT_000d2acb DAT_000d2acb_backing[0]
static undefined1 DAT_000d2ad0_backing[32768];
#define DAT_000d2ad0 DAT_000d2ad0_backing[0]
static undefined1 DAT_000d2ad1_backing[32768];
#define DAT_000d2ad1 DAT_000d2ad1_backing[0]
static undefined1 DAT_000d2ad2_backing[32768];
#define DAT_000d2ad2 DAT_000d2ad2_backing[0]
static undefined1 DAT_000d2ad3_backing[32768];
#define DAT_000d2ad3 DAT_000d2ad3_backing[0]
undefined4 DAT_000d95d8;
/* DAT_000d9768..DAT_000d977c (21 fields): same bug, same parser, same
   systematic-scan discovery as the two clusters above. */
static undefined1 DAT_000d9768_backing[65536];
#define DAT_000d9768 DAT_000d9768_backing[0]
static undefined1 DAT_000d9769_backing[65536];
#define DAT_000d9769 DAT_000d9769_backing[0]
static undefined1 DAT_000d976a_backing[65536];
#define DAT_000d976a DAT_000d976a_backing[0]
static undefined1 DAT_000d976b_backing[65536];
#define DAT_000d976b DAT_000d976b_backing[0]
static undefined1 DAT_000d976c_backing[65536];
#define DAT_000d976c DAT_000d976c_backing[0]
static undefined1 DAT_000d976d_backing[65536];
#define DAT_000d976d DAT_000d976d_backing[0]
static undefined1 DAT_000d976e_backing[65536];
#define DAT_000d976e DAT_000d976e_backing[0]
static undefined1 DAT_000d976f_backing[65536];
#define DAT_000d976f DAT_000d976f_backing[0]
static undefined1 DAT_000d9770_backing[65536];
#define DAT_000d9770 DAT_000d9770_backing[0]
static undefined1 DAT_000d9771_backing[65536];
#define DAT_000d9771 DAT_000d9771_backing[0]
static undefined1 DAT_000d9772_backing[65536];
#define DAT_000d9772 DAT_000d9772_backing[0]
static undefined1 DAT_000d9773_backing[65536];
#define DAT_000d9773 DAT_000d9773_backing[0]
static undefined1 DAT_000d9774_backing[65536];
#define DAT_000d9774 DAT_000d9774_backing[0]
static undefined1 DAT_000d9775_backing[65536];
#define DAT_000d9775 DAT_000d9775_backing[0]
static undefined1 DAT_000d9776_backing[65536];
#define DAT_000d9776 DAT_000d9776_backing[0]
static undefined1 DAT_000d9777_backing[65536];
#define DAT_000d9777 DAT_000d9777_backing[0]
static undefined1 DAT_000d9778_backing[65536];
#define DAT_000d9778 DAT_000d9778_backing[0]
static undefined1 DAT_000d9779_backing[65536];
#define DAT_000d9779 DAT_000d9779_backing[0]
static undefined1 DAT_000d977a_backing[65536];
#define DAT_000d977a DAT_000d977a_backing[0]
static undefined1 DAT_000d977b_backing[65536];
#define DAT_000d977b DAT_000d977b_backing[0]
static undefined1 DAT_000d977c_backing[65536];
#define DAT_000d977c DAT_000d977c_backing[0]
static undefined1 DAT_000d98c8_backing[32768];
#define DAT_000d98c8 DAT_000d98c8_backing[0]
static undefined1 DAT_000da480_backing[65536];
#define DAT_000da480 DAT_000da480_backing[0]
/* Per-CLUSTER pointer/index slot in the same ".E" model parser
   (parse_e_model_file's CLUSTERS block) as DAT_000dab90 right below, same
   "declared as a lone scalar, actually a large indexed table" bug --
   `*(undefined **)(&DAT_000da868 + iVar4) = local_258;` where iVar4
   grows per cluster. Widened the same way, matching DAT_000dab90's
   size. */
static undefined1 DAT_000da868_backing[65536];
#define DAT_000da868 DAT_000da868_backing[0]
static undefined1 DAT_000dab90_backing[65536];
#define DAT_000dab90 DAT_000dab90_backing[0]
static undefined DAT_000db454_backing[8192];
#define DAT_000db454 DAT_000db454_backing[0]
undefined *PTR_Ordinal_553_000840c0;
undefined *PTR_Ordinal_173_000840c4;
static undefined DAT_000fb650_backing[8192];
#define DAT_000fb650 DAT_000fb650_backing[0]
static undefined DAT_000fb550_backing[8192];
#define DAT_000fb550 DAT_000fb550_backing[0]
char s_0123456789ABCDEF_00084a28[] = "0123456789ABCDEF";
undefined *PTR_Ordinal_2018_000840e0;
int DAT_0024af70;
undefined *PTR_GXBeginDraw_00084200;
void *DAT_0023c430;
undefined *PTR_GXEndDraw_000841fc;
undefined1 DAT_00084a40_backing[32768];
#define DAT_00084a40 DAT_00084a40_backing[0]
undefined2 DAT_00242010_backing[32768];
#define DAT_00242010 DAT_00242010_backing[0]
/* Was a lone `undefined2` scalar, but build_rgb565_palette uses it as the base of a
   20-level x 256-entry faded-palette table (`(ushort*)(&DAT_00248418 +
   iVar21) + level*0x100`, iVar21 stepping by 2 per palette entry, 20 levels
   stepped by 0x100 ushorts/level) -- a real ~10KB out-of-bounds write on
   every single palette install. Root-caused via an lldb watchpoint on
   DAT_0024cfc0 (a totally unrelated string-page counter ~26KB away) that
   showed this exact write clobbering it into a huge garbage value, which
   then produced a wild out-of-bounds array read/UAF-style crash much later
   in get_message_string's string lookup. Same lone-scalar-used-as-array pattern
   fixed repeatedly this session (DAT_002028e8, g_visibility_ray_table, etc). */
undefined2 DAT_00248418_backing[20 * 256];
#define DAT_00248418 DAT_00248418_backing[0]
short DAT_00084f10;
int g_force_flush;
/* Set by the force-3D-redraw hack in main_loop_hud_flush around its
   per-frame full_dungeon_redraw() call: tells rebuild_dungeon_view to skip
   its passive experience-point trickle (grant_experience_points), which otherwise
   fires once per redraw and -- called with a dropped arg (garbage XP
   amount) -- walks into the level-up message path and crashes. A cosmetic
   forced repaint must not touch game state anyway. */
int g_force_redraw_no_xp;
short DAT_0023c63c;
undefined4 DAT_0023c638;
undefined DAT_00084e40_backing[8192];
#define DAT_00084e40 DAT_00084e40_backing[0]
undefined DAT_00084e48_backing[8192];
#define DAT_00084e48 DAT_00084e48_backing[0]
undefined DAT_00084e50_backing[8192];
#define DAT_00084e50 DAT_00084e50_backing[0]
undefined DAT_00084e58_backing[8192];
#define DAT_00084e58 DAT_00084e58_backing[0]
char *DAT_001005c8;
/* Was `undefined4` (4 bytes), but assigned real char* pointers
   (DAT_001005c4/DAT_001005c8) throughout the character-generation/
   font-drawing subsystem and passed directly as bitmap_blit_to_framebuffer's char*
   source-bitmap param -- truncated every one of those pointers on this
   64-bit host. */
char *DAT_000fb858;
char *DAT_001005c4;
/* Not `static` -- also used by chargen.c; see the extern declaration and
   DAT_000fb860 macro alias in uw.h. */
undefined1 DAT_000fb860_backing[256];
undefined DAT_000fb863;
/* Was a lone `undefined4` scalar, but indexed as `(&DAT_000fb880)[idx]`
   (4-byte stride) with idx up to a CONCAT11 of two record byte fields
   (draw_chargen_field_value). Real populator recovered this session: LAB_000255d0
   (a callback Ghidra never resolved into a named function -- see its
   own comment near its definition) builds this as a cumulative per-
   entry byte-size table when the "chrbtns" resource loads.
   Not `static` -- chargen.c reaches it through the DAT_000fb8c4 alias
   in uw.h (case 4's body-figure offset lookup). */
undefined4 DAT_000fb880_backing[4096];
#define DAT_000fb880 DAT_000fb880_backing[0]
/* Another alias into the LAB_000255d0 offset table (like DAT_000fb884 at
   element 1 and DAT_000fb8c4 at element 17): 0xfb898 - 0xfb880 = 0x18 =
   element 6. That's the offset of chrbtns.gr entry 6 -- the 145x16
   parchment-with-border strip draw_chargen_field_value blits as the name-entry
   field's background, and wait_for_chargen_field_input's backspace handler re-blits to
   erase a deleted character. Declared as a lone uninitialised `int` it
   stayed 0, so both blits read from the buffer's start (button plates)
   and drew a garbled rectangle. */
#define DAT_000fb898 (((int *)DAT_000fb880_backing)[6])
char s_key_to_continue_00084e60[] = "key_to_continue";
char s_then_press_the_Enter_00084e70[] = "then_press_the_Enter";
char s_Enter_your_name_and_00084e88[] = "Enter_your_name_and";
/* DAT_000fb884's address (0xfb884) is exactly one 4-byte element past
   DAT_000fb880's (0xfb880) -- not a separate table at all, but an
   alias into the SAME array LAB_000255d0 populates, just viewed
   starting one element later (its own read site indexes it with
   identical 4-byte-stride byte-pointer arithmetic to DAT_000fb880's).
   Declaring it as an independent, separately-backed array (as an
   earlier fix pass did, before LAB_000255d0's role was known) split
   it apart from the real data and left it permanently zero -- the
   root cause of chrbtns button/portrait graphics reading pixel data
   from the wrong offset (garbled/sheared "pitch is off" artifacts)
   even after DAT_000fb880 itself started being populated correctly. */
#define DAT_000fb884 (((undefined1 *)DAT_000fb880_backing)[4])
short DAT_001005c0;
/* DAT_000fb8c4's address (0xfb8c4) is 0x44 bytes = 17 elements past
   DAT_000fb880's (0xfb880) -- like DAT_000fb884, not a separate table but
   an alias into the SAME cumulative per-entry offset array LAB_000255d0
   builds for chrbtns.gr, viewed starting at element 17. Elements 17..26
   are the offsets of chrbtns entries 17-26 (the ten full-body figures,
   five male + five female); character_generator_loop's case 4 reads
   `table[17 + sexbit*5 + portraitIdx]` to blit the chosen body. Declaring
   it as an independent zero array (as an earlier pass did, before
   LAB_000255d0's role was known) split it from the real data and left it
   permanently zero -- so no body was ever drawn. Aliased onto the real
   array instead. See uw.h. */
undefined1 DAT_000fb8f0_backing[1680];
int DAT_00201c98;
/* Ghidra's auto-analysis never recognized LAB_000255b4/LAB_000255d0 as
   real functions -- they're only reached indirectly (passed as callback
   pointers to load_gr_resource_entries at run_character_generator's call site below), so no
   `bl` ever pointed at them for the analyzer to follow, and they were
   left as raw undecompiled ARM code, previously stubbed here as no-ops.
   That silently made DAT_000fb858/DAT_000fb880 stay permanently
   uninitialized, which is the real root cause behind this session's
   "DAT_000fb880 is never written anywhere in this decompile" findings
   throughout draw_chargen_field_value/draw_chargen_field_options/wait_for_chargen_field_input/etc. -- their
   fallback-to-0 guards were masking a genuine missing-callback bug, not
   a genuine data-recovery gap. Recovered by disassembling this address
   range directly (via Ghidra's headless analyzer against the original
   UU.exe): both are real, small functions with real logic. */

/* r1 = &DAT_000fb858; r2 = *r1 (current cursor); r0 = r2 + param_1;
   *r1 = r0 (advance cursor by param_1 bytes); return r2 (the position
   *before* advancing) -- a bump-pointer sub-allocator carving fixed-
   size chunks out of whatever buffer DAT_000fb858 currently points to. */
char *LAB_000255b4(param_1)
int param_1;
{
  char *old = DAT_000fb858;
  DAT_000fb858 = DAT_000fb858 + param_1;
  return old;
}

/* r0 is loaded fresh from a literal (&DAT_000fb880), discarding
   whatever was passed in that register -- this callback's real
   parameters are param_2 (r1) and param_3 (r2, only its low 16 bits
   used, sign-extended, as a table index). Builds DAT_000fb880 as a
   running total: table[0] seeded to 5 the first time idx==0 is seen,
   then table[idx+1] = table[idx] + param_2 each call -- a cumulative
   per-entry byte-offset table (matches every read site indexing it by
   a record's portrait/race selector). Returns 0 when param_2==0
   (signals "empty entry"/no more data to the load_gr_resource_entries driver),
   else 1. */
undefined4 LAB_000255d0(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;
{
  int idx = (short)(param_3 & 0xffff);
  if (idx == 0) {
    DAT_000fb880_backing[0] = 5;
  }
  int old = DAT_000fb880_backing[idx];
  DAT_000fb880_backing[idx + 1] = old + param_2;
  return (param_2 == 0) ? 0 : 1;
}
char s_FONT5X6P_SYS_00084e9c[] = "FONT5X6P.SYS";
char s__DATA_CHARGEN_BYT_00084eac[] = "\\DATA\\CHARGEN.BYT";
char s_FONTCHAR_SYS_00084ec0[] = "FONTCHAR.SYS";
char s__DATA_chrgen_dat_00084ed0[] = "\\DATA\\chrgen.dat";
char s__DATA_skills_dat_00084ee4[] = "\\DATA\\skills.dat";
/* Was a zero-initialized array standing in for an unrecovered string
   constant (Ghidra had no content at this address, just a dangling
   reference -- see load_gr_resource_entries's comment). Recovered by dumping the
   real bytes at this address directly from the original UU.exe via
   Ghidra's headless analyzer: the string "chrbtns" (character-gen
   button/portrait graphics, matching its neighboring resource-name
   constants here). Leaving this as an all-zero buffer made
   load_gr_resource_entries's `param_1[0] == '\0'` empty-name check always true, so
   it always took the "nothing to load" early-return path and never
   invoked its per-item callbacks (LAB_000255b4/LAB_000255d0) at all --
   the real root cause of DAT_000fb880 staying empty despite those
   callbacks now being correctly implemented. */
char s_chrbtns_00084ef8[] = "chrbtns";
undefined1 DAT_001005cc;
undefined1 DAT_001005cd;
undefined1 DAT_001005ce;
undefined1 DAT_00088d98_backing[1536];
#define DAT_00088d98 DAT_00088d98_backing[0]

/* Side-effect-free PALS.DAT read: raw 6-bit bytes for one palette index,
   scaled to 8-bit RGB into out_rgb (768 bytes). Deliberately does NOT
   reuse load_pals_bank -- it always installs its result into g_palette_rgb565
   too, which would visibly recolor the live game just from a debug dump
   running. Returns 1 on success. */
static int uw_load_pals_dat_scaled(int pal_index, unsigned char *out_rgb) {
    unsigned char raw[768];
    undefined4 handle = open_file_for_read("\\DATA\\pals.dat");
    seek_file_handle(handle, pal_index * 0x300, 0);
    short got = (short)read_file_handle(handle, raw, 0x300);
    Ordinal_553(handle);
    if (got != 0x300) return 0;
    expand_pals_bytes(out_rgb, raw, 0);
    return 1;
}

/* Debug-only accessor for gx_stub.c's GR-entry BMP dumper, keyed by the
   .GR resource's base name (e.g. "chrbtns").

   Default path: reconstruct an 8-bit RGB palette from g_palette_rgb565 --
   the RGB565 lookup table the renderer itself actually indexes into for
   every on-screen pixel -- rather than tracking any of the raw/scaled
   staging buffers upstream of it. This matches on-screen appearance
   exactly whenever a resource's own palette is already installed by the
   time it's preloaded, which holds for most of these (dungeon resources
   load once the world's palette is already live).

   chrbtns.gr is a confirmed exception: it preloads at chargen.c:344,
   before chargen's own palette (index 3, chargen.c:421's
   load_pals_bank(3,pcVar_palbuf) call, into a scratch buffer that never
   touches g_palette_rgb565 until that line runs) is installed -- so at
   preload time g_palette_rgb565 still reflects whatever the main menu left
   behind. No amount of reading g_palette_rgb565 at THIS moment can produce
   the right answer, since the right palette genuinely isn't live yet;
   load index 3 directly instead. opbtn.GR turned out not to need this
   (its main-menu palette install already runs before OPBTN.GR loads),
   but the same "preload races the palette install" class of bug could
   apply to any future resource, so this is a small per-name table rather
   than a single hardcoded chrbtns special case. */
unsigned char *uw_get_default_palette(const char *gr_name) {
    static const struct { const char *name; int pal_index; } overrides[] = {
        {"chrbtns", 3},
    };
    static unsigned char rgb[768];

    for (size_t i = 0; i < sizeof(overrides) / sizeof(overrides[0]); i++) {
        if (strcmp(gr_name, overrides[i].name) == 0) {
            if (uw_load_pals_dat_scaled(overrides[i].pal_index, rgb)) {
                return rgb;
            }
            break; /* fall through to the live read if the load failed */
        }
    }

    unsigned short *pal565 = (unsigned short *)g_palette_rgb565_backing;
    for (int i = 0; i < 256; i++) {
        unsigned short p = pal565[i];
        unsigned char r5 = (p >> 11) & 0x1f;
        unsigned char g6 = (p >> 5) & 0x3f;
        unsigned char b5 = p & 0x1f;
        rgb[i * 3 + 0] = (r5 << 3) | (r5 >> 2);
        rgb[i * 3 + 1] = (g6 << 2) | (g6 >> 4);
        rgb[i * 3 + 2] = (b5 << 3) | (b5 >> 2);
    }
    return rgb;
}

ushort DAT_00100610;
/* Base address of a 0x1b(27)-byte-stride record table (every use is
   `offset * 0x1b + DAT_002046b8`, cast to a pointer type) -- was `int`
   despite being assigned a real malloc'd address plus an offset
   (reset_level_object_arena: `DAT_002046b8 = DAT_002029cc + 0x4000;`), truncating it
   on this 64-bit host and feeding a garbage near-zero base pointer to
   every reader, including a real crash (Ordinal_1047/memset on the
   resulting ~0x1b address) in reset_player_object_record. */
char *DAT_002046b8;
undefined2 DAT_00100600;
ushort DAT_00100604;
 undefined1 DAT_00202c3a_backing[8192];
#define DAT_00202c3a DAT_00202c3a_backing[0]
 undefined1 DAT_00202c3c_backing[65536];
#define DAT_00202c3c DAT_00202c3c_backing[0]
byte *DAT_00202c6c;
short DAT_001005f4;
short DAT_001005f8;
short DAT_0023beb4;
char DAT_001005dc;
undefined2 DAT_00100624;
ushort DAT_00100620;
/* Was a lone `undefined1` scalar, but (like DAT_00202c39/3a/3c below,
   already fixed) every real use is `(&DAT_00202c38)[i*6]` -- one field of
   a repeating 6-byte-stride per-candidate record in
   collision_height_envelope/FUN_00051dd0's up-to-256-entry collision
   candidate list. Indexing past element 0 read/wrote whatever memory
   happened to follow this single byte in the link order -- confirmed via
   a real crash (a plain, non-debugger run walking toward a critter;
   the same bug reproduced fine under lldb/ASan since they lay out
   globals differently, masking it there). */
 undefined1 DAT_00202c38_backing[8192];
#define DAT_00202c38 DAT_00202c38_backing[0]
 undefined1 DAT_00202c39_backing[8192];
#define DAT_00202c39 DAT_00202c39_backing[0]
 undefined1 DAT_00202c90_backing[65536];
#define DAT_00202c90 DAT_00202c90_backing[0]
/* Were lone `undefined1` scalars, but every use (dozens of call sites
   throughout uw.c) is `(&DAT_00202c9X)[objid*0xd]` -- fields of the
   0xd-byte comobj.dat per-object-type property record that DAT_00202c90
   (offset 0, already fixed) is itself the base of. With these as
   standalone globals, indexing past element 0 read whatever neighboring
   BSS happened to follow each one (always 0 in practice), so every
   "does this object type have property X" check silently saw "no" for
   every real object -- notably `(&DAT_00202c9b)[id] & 0x10` in
   dispatch_object_action (the right-click "look" description gate), which is
   why Look never printed "You see a <name>" for anything, the Sack
   included. Re-aliased into DAT_00202c90's own backing array at their
   real record offsets (0x1,0x3,0x5,0x7,0x8,0x9,0xa,0xb -- confirmed by
   the `*(short*)(&DAT_00202c95+...)` 2-byte read elsewhere, which needs
   offset 6 to be DAT_00202c95's second byte, not a separate slot).
   See uw_object_type_props_t (uw.h) and g_object_type_props for a
   typed view -- this offset+mask is now
   g_object_type_props[id].has_look_description, and DAT_00202c98's
   own 0x80 mask is g_object_type_props[id].is_container. */
#define DAT_00202c91 DAT_00202c90_backing[1]
#define DAT_00202c93 DAT_00202c90_backing[3]
#define DAT_00202c95 DAT_00202c90_backing[5]
#define DAT_00202c97 DAT_00202c90_backing[7]
#define DAT_00202c98 DAT_00202c90_backing[8]
#define DAT_00202c99 DAT_00202c90_backing[9]
#define DAT_00202c9a DAT_00202c90_backing[0xa]
#define DAT_00202c9b DAT_00202c90_backing[0xb]
short DAT_0010061c;
undefined1 DAT_0010060c;
short DAT_00100608;
byte DAT_00100628;
undefined4 DAT_001005d8;
undefined DAT_001007d8;
byte DAT_001005fc;
char DAT_00084f1c;
/* Was `int` despite being assigned real pointer values derived from
   DAT_002046b8 (see there) and itself assigned into g_player_object
   (`char *`) -- truncating on this 64-bit host, part of the same crash
   chain (reset_player_object_record's Ordinal_1047 call reading g_player_object). */
char *DAT_0023b82c;
 undefined1 DAT_001007d0_backing[6144];
#define DAT_001007d0 DAT_001007d0_backing[0]
undefined DAT_001007e0;
 undefined DAT_00084f20_backing[8192];
#define DAT_00084f20 DAT_00084f20_backing[0]
char s_UNNAMED_00084f24[] = "UNNAMED";
char s_Sorry__you_have_no_00084f2c[] = "Sorry,_you_have_no";
undefined DAT_002027d2_backing[8192];
#define DAT_002027d2 DAT_002027d2_backing[0]
ushort DAT_00202d54;
undefined1 DAT_002027d0_backing[256];
#define DAT_002027d0 DAT_002027d0_backing[0]
 undefined1 DAT_00202800_backing[65536];
#define DAT_00202800 DAT_00202800_backing[0]
undefined DAT_00202878;
/* Was a lone `undefined` scalar (1 byte), but tick_weapon_swing_state indexes it
   as `(&DAT_00084eff)[iVar5]` with iVar5 = the swing's own attack-type
   value (3-9, from interact_attack's screen-position-to-3x3-grid
   mapping -- this is the real "attack from top/left/right/bottom
   throws a different attack" mechanic the user reported as broken),
   and compute_player_weapon_attack_stats separately indexes it by the same attack-type value
   for a damage bonus lookup. A single byte can't hold 10 real,
   distinct per-direction values -- recovered the real content via
   Ghidra headless memory dump (0x84eff, 12 bytes -- Ghidra's own next
   symbol, DAT_00084f0b, starts exactly 12 bytes later, matching this
   project's usual "one lone scalar per real small table" pattern):
   00 02 02 02 00 00 00 01 01 01 00 00. Confirmed genuinely
   direction-sensitive data (not all-zero/all-same): indices 2-9 read
   00,02,02,02,00,00,00,01 -- real variation across the attack-type
   range, not the flat/garbage result a bare 1-byte read would produce
   once indexed past its own storage. */
unsigned char DAT_00084eff_backing[12] = {
  0x00,0x02,0x02,0x02,0x00,0x00,0x00,0x01,0x01,0x01,0x00,0x00
};
#define DAT_00084eff DAT_00084eff_backing[0]
 undefined DAT_001007d5_backing[8192];
#define DAT_001007d5 DAT_001007d5_backing[0]
/* Was `undefined2` (unsigned short) -- every real use in tick_weapon_swing_state/
   reset_weapon_swing_state/update_weapon_ready_hud_icon/cancel_weapon_swing (the attack-swing state
   machine) treats this as a signed negative countdown (assigned
   literal bit patterns like 0xfff6/-10, 0xfffb/-5, and compared with
   `< 0`, `< -4`, `< -9`, `< -10`). With an unsigned type, a stored
   0xffff (-1) reads back as +65535, so `DAT_0010062c < 1` (the guard
   that gates this function's entire body) is permanently false and
   the whole state machine can never advance past its "armed, wind-up
   under way" state -- confirmed live: a real attack starts (weapon
   raises, a real non-null swing record resolves) but then freezes at
   DAT_000870e4==3 forever, no matter how long the button is held or
   how long real time elapses afterward. */
short DAT_0010062c;
undefined4 DAT_001005ec;
short DAT_00100618;
short DAT_000870e4;
/* Was `undefined4` -- resolve_equipped_weapon_attack writes a real static-global address
   through this (via its own `int *param_1`, truncating with an
   explicit `(int)`/`(intptr_t)` cast at all 3 of its assignments), and
   tick_weapon_swing_state reads it back and dereferences it as a pointer
   (`*(byte*)(iVar5+3)` etc.) once the attack-swing state machine
   reaches its "resolve impact" phase (DAT_000870e4==3). Confirmed live:
   right-clicking to start an attack in Combat mode crashes a few ticks
   later, once the swing reaches that phase, dereferencing the
   truncated pointer. */
char *DAT_001005e4;
char DAT_001005e0_backing[128];
char *DAT_001005e0 = DAT_001005e0_backing;
short DAT_001005e8;
undefined DAT_001005f0;
byte DAT_00100614;
/* Was a lone `undefined` scalar, same bug as DAT_00084eff just above --
   tick_weapon_swing_state indexes it as `(&DAT_00084f0b)[iVar5]` with iVar5 =
   attack-type/3 (0-3), selecting which of a small set of swing
   animations (`DAT_00084f10`) to play. Recovered via Ghidra headless
   (0x84f0b, 5 bytes -- DAT_00084f10, the next real symbol, starts
   exactly 5 bytes later): 00 34 27 19 00. */
unsigned char DAT_00084f0b_backing[5] = {0x00,0x34,0x27,0x19,0x00};
#define DAT_00084f0b DAT_00084f0b_backing[0]
undefined DAT_00250658;
undefined DAT_001007e1;
undefined DAT_001007f8;
char s__DATA_cmb_dat_00084f40[] = "\\DATA\\cmb.dat";
undefined2 DAT_00100630_backing[32768];
#define DAT_00100630 DAT_00100630_backing[0]
char s_objsbecombinable_returns__d_00084f50[] = "objsbecombinable_returns_%d";
char s_combination__d_is__d_and__d__00084f70[] = "combination_%d_is_%d_and_%d.";
char s_checking_if__d_and__d_are_combin_00084f90[] = "checking_if_%d_and_%d_are_combin";
undefined1 DAT_00100634_backing[65536];
#define DAT_00100634 DAT_00100634_backing[0]
undefined2 DAT_00100632;
char *g_current_container_record;
char s__DATA_cnv_ark_00084fc8[] = "\\DATA\\cnv.ark";
 undefined2 DAT_0023add0_backing[8192];
#define DAT_0023add0 DAT_0023add0_backing[0]
char *DAT_00100784;
/* Was `undefined4`, truncating the real char* buffer pointer (DAT_00100784)
   assigned to it before every "heads"/"converse"/"genhead"/"charhead"
   resource load -- it's the bump-allocator cursor LAB_00028688 advances
   (see that function's comment). */
char *DAT_00100670;
/* Was a lone `undefined4` scalar, but LAB_000286a4 writes real pointers
   into it as an array (`DAT_00100728[idx] = allocated_buffer + 5`, one
   entry per loaded head/portrait) -- same "array Ghidra saw as a single
   scalar" bug class as DAT_000fb880. Only index 0 is read directly by
   this file's existing call sites (single-item head loads all pass a
   count of 1), but the array still needs real backing storage so
   multi-item loads (the full "heads" resource) don't write out of
   bounds past a 4-byte scalar. */
 char *DAT_00100728_backing[256];
#define DAT_00100728 DAT_00100728_backing[0]
/* HACK: these 5 were separate never-written `undefined4` scalars --
   confirmed via a fresh Ghidra decompile of the real FUN_000286cc
   (0x286cc) that every one of its 6 portrait/frame blit calls reads
   through ONE base pointer (PTR_DAT_000289cc) at consecutive 4-byte
   offsets 0xb8/0xbc/0xc0/0xc4/0xc8/0xcc -- i.e. a real 6-element
   pointer array, of which DAT_00100728 (offset 0xb8, the array's own
   comment above already got this one right) is just index 0. The
   other 5 were the same "array Ghidra split into separate globals"
   bug as DAT_00100728 itself warned about, except never actually
   fixed for these -- LAB_000286a4 (the load_gr_resource_entries
   per-item callback, idx 0-5 for this 6-item "converse" resource
   load) only ever wrote DAT_00100728_backing[idx], so idx 1-5 landed
   in the real backing array while these 5 stayed permanently zero.
   Reading a NULL DAT_0010072c as bitmap_blit_to_framebuffer's source
   pointer is exactly the Talk-mode crash in bug-critter-talk.txt
   (interact_talk_npc -> change_game_mode -> FUN_000286cc -> crash
   inside bitmap_blit_to_framebuffer on the very first read of an
   unpopulated slot, uw.c ~19077). */
#define DAT_0010072c DAT_00100728_backing[1]
#define DAT_00100730 DAT_00100728_backing[2]
#define DAT_00100734 DAT_00100728_backing[3]
#define DAT_00100738 DAT_00100728_backing[4]
#define DAT_0010073c DAT_00100728_backing[5]
undefined1 g_active_hud_panel;
/* Not part of the original binary -- a port-side addition. scroll_text_entry_prompt
   (the generic scroll-area text-entry field used by save-name entry,
   "Move how many", "Chant the mantra", etc.) is opened as an overlay on
   top of the dungeon view without ever calling set_game_mode, so
   DAT_00201b60/DAT_00201b64 (the top-level game-mode pair) never change
   while it's up -- gx_stub.c's in_dungeon_freelook() has no way to tell
   the difference between "really in the 3D view" and "a text field is
   capturing keystrokes over it", so it kept routing A/D/C/W/S/X/Z/1/2/3
   to the movement poller instead of letting them type. Set true for the
   duration of scroll_text_entry_prompt's input loop; gx_stub.c checks it (as an
   extern) alongside DAT_00201b64. */
int g_text_input_active;
undefined1 DAT_00100678;
undefined4 DAT_00085c54;
short DAT_00201c74;
char *DAT_001007c0; // was `undefined4` -- assigned a real 64-bit pointer (DAT_00100784, uw.c ~19277) and used as a real string buffer by babl_builtin_respond/echo_selected_conversation_choice/etc.; truncated on 64-bit, crashing the first time any of those functions actually ran (selecting a babl_menu response)
undefined1 DAT_0023bf0c;
undefined2 g_cursor_mode;
/* Recovered by disassembling the original UU.exe (same method as
   LAB_000255b4/LAB_000255d0 -- see their comment): load_gr_resource_entries's
   allocator callback for the "heads"/"converse"/"genhead"/"charhead"
   resource loads. Bumps DAT_00100670 (the cursor into the DAT_00100784
   buffer) by param_1 bytes and returns the pre-advance position. */
char *LAB_00028688(param_1)
int param_1;
{
  char *old = DAT_00100670;
  DAT_00100670 = DAT_00100670 + param_1;
  return old;
}

/* Recovered the same way: load_gr_resource_entries's post-process callback for the
   same resource loads. Stores the allocated buffer pointer (skipping a
   5-byte per-item header) into DAT_00100728[idx], where idx is
   param_3's low 16 bits sign-extended (the item index, matching
   load_gr_resource_entries's `(*param_5)(pvVar_buf,iVar4,iVar5)` call shape).
   Returns 0 when param_2 (item byte size) == 0, else 1. */
undefined4 LAB_000286a4(param_1,param_2,param_3)
char *param_1;
int param_2;
int param_3;
{
  int idx = (short)(param_3 & 0xffff);
  DAT_00100728_backing[idx] = param_1 + 5;
  return (param_2 == 0) ? 0 : 1;
}
char s_genhead_00084fd8[] = "genhead";
char s_charhead_00084fe0[] = "charhead";
char s_heads_00084fec[] = "heads";
char s_converse_00084ff4[] = "converse";
short DAT_001006d0;
char s_take_id_from_npc_0008519c[] = "take_id_from_npc";
char s_take_from_npc_000851b0[] = "take_from_npc";
char s_find_inv_000851c0[] = "find_inv";
char s_give_to_npc_000851cc[] = "give_to_npc";
char s_show_inv_000851d8[] = "show_inv";
char s_print_000851e4[] = "print";
char s_babl_ask_000851ec[] = "babl_ask";
/* Was a zero-initialized 8192-byte placeholder -- same "zero-init
   global missing real .data content" class as this file's many other
   string recoveries. Confirmed real content via a Ghidra headless
   memory dump at 0x851f8: "sex" (the babl builtin name registered a
   few lines below at start_npc_conversation, alongside its own
   still-a-no-op-stub implementation -- see LAB_0001840c's comment). */
char s_sex_000851f8[] = "sex";
char s_set_quest_000851fc[] = "set_quest";
char s_get_quest_00085208[] = "get_quest";
char s_babl_fmenu_00085214[] = "babl_fmenu";
char s_babl_menu_00085220[] = "babl_menu";
/* Was `undefined4`, truncating the real char* buffer babl_alloc
   returns (assigned at its only writer) -- dereferenced directly a
   few lines after its only other read. */
char *DAT_001007b8;
char DAT_001007b4;
char s_give_ptr_npc_00085000[] = "give_ptr_npc";
char s_find_barter_total_00085010[] = "find_barter_total";
char s_find_barter_00085024[] = "find_barter";
char s_x_obj_pos_00085030[] = "x_obj_pos";
char s_x_obj_stuff_0008503c[] = "x_obj_stuff";
char s_x_traps_00085048[] = "x_traps";
char s_x_skills_00085050[] = "x_skills";
char s_remove_talker_0008505c[] = "remove_talker";
char s_place_object_0008506c[] = "place_object";
char s_add_to_npc_inv_0008507c[] = "add_to_npc_inv";
char s_take_from_npc_inv_0008508c[] = "take_from_npc_inv";
char s_set_race_attitude_000850a0[] = "set_race_attitude";
char s_set_attitude_000850b4[] = "set_attitude";
char s_gronk_door_000850c4[] = "gronk_door";
char s_count_inv_000850d0[] = "count_inv";
char s_set_inv_quality_000850dc[] = "set_inv_quality";
char s_check_inv_quality_000850ec[] = "check_inv_quality";
char s_do_inv_delete_00085100[] = "do_inv_delete";
char s_do_inv_create_00085110[] = "do_inv_create";
char s_set_likes_dislikes_00085120[] = "set_likes_dislikes";
char s_pause_00085134[] = "pause";
char s_setup_to_barter_0008513c[] = "setup_to_barter";
char s_end_barter_0008514c[] = "end_barter";
char s_do_judgement_00085158[] = "do_judgement";
char s_do_decline_00085168[] = "do_decline";
char s_do_demand_00085174[] = "do_demand";
char s_do_offer_00085180[] = "do_offer";
char s_identify_inv_0008518c[] = "identify_inv";
short DAT_0010078c;
short DAT_00201c84;
int DAT_00250718;
short DAT_00100794;
/* Reused scratch global (see the DAT_000a85d0 comment above for the
   general pattern) -- most call sites treat it as a writable sprintf-
   style destination buffer via Ordinal_1063, but several others
   (draw_save_load_slot_list's save-slot list among them) pass `&s_scroll_newline_0008522c`
   straight to message_scroll_print_wrapped with no write beforehand,
   relying on it holding its real static initial content. A Ghidra
   memory dump of the original binary at 0x8522c confirmed that content
   is the two bytes `0a 00` -- the string "\n" -- not zero. Printing an
   empty string (this array's old all-zero C default) instead of a real
   "\n" silently skipped the pending-newline flag msg_scroll_draw_wrapped_span sets from
   a string's trailing '\n' (see its own comment), which is why the
   save-slot list rendered every entry run together on one line with no
   breaks. Seeded to match. */
// was DAT_0008522c
 undefined s_scroll_newline_0008522c_backing[8192] = "\n";
#define s_scroll_newline_0008522c s_scroll_newline_0008522c_backing[0]
 undefined1 DAT_00100680_backing[65536];
#define DAT_00100680 DAT_00100680_backing[0]
undefined2 DAT_00100790;
short DAT_00100788;
 undefined1 DAT_001006d8_backing[65536];
#define DAT_001006d8 DAT_001006d8_backing[0]
/* Was a lone `undefined2` scalar, but babl_menu/babl_fmenu/select_babl_menu_response
   all index it as a real array -- `(&DAT_00100770)[idx]` for idx up to
   9 (a fixed "10 visible scroll lines" loop bound) and up to whatever
   message_scroll_print_wrapped's own wrapped-line-count returns, which
   can exceed 10 for long menu text. Confirmed live via lldb: this
   silently corrupted whatever real global the compiler happened to
   place next to a single 2-byte scalar (DAT_00100794, the menu's own
   item count, got stomped from a real small count to -1/0xffff right
   after the `(&DAT_00100770)[iVar12]=0xffff` init loop), which then
   made babl_menu's own `if (1 < DAT_00100794)` print-loop check fail
   even though real menu items had just been resolved -- this is why
   Bragit's dialogue never appeared despite babl_menu itself running
   correctly. Same "array Ghidra/this port declared as a bare scalar"
   bug class as DAT_00100728 and this array's own sibling DAT_001007a0
   (already fixed with a real backing array). Sized to match. */
 short DAT_00100770_backing[32768];
#define DAT_00100770 DAT_00100770_backing[0]
 undefined1 DAT_001007a0_backing[65536];
#define DAT_001007a0 DAT_001007a0_backing[0]
/* DAT_00085230/34/38/3c are 4 tiny (<=3-char) control-code constants,
   packed 4 bytes apart in the original binary -- confirmed via a real
   Ghidra memory dump at 0x85230 rather than guessed: "\P\0" (0x5c 0x50
   0x00), "\0\n" (0x5c 0x30 0x0a 0x00), "\1\0" (0x5c 0x31 0x00) and
   "\2\0" (0x5c 0x32 0x00) respectively -- "\0"/"\1"/"\2" are all the
   SAME "reset to default draw color" code (see msg_scroll_draw_wrapped_span's
   own '0'/'1' handling), "\P" is the pause/wait code, and DAT_00085234
   uniquely also carries a trailing real newline byte. Same "zero-
   initialized global missing real .data content" bug class as the
   scroll's \6-header/color-code fixes elsewhere in this file: all 4
   were plain zero-filled backing arrays (silently printing nothing),
   confirmed live as the cause of a real, visible bug -- echo_selected_conversation_choice/
   babl_builtin_print (echoing the player's selected conversation choice
   before the NPC's reply) append DAT_00085234 as a trailing separator,
   expecting it to insert a newline after the echoed choice; with it
   empty, the echoed text ran straight into the NPC's next line with
   no break at all (e.g. "...the Abyss.Exploring, eh?..."). */
undefined1 DAT_00085230_backing[32768] = { 0x5c,0x50,0x00 };
#define DAT_00085230 DAT_00085230_backing[0]
undefined DAT_00085234_backing[8192] = { 0x5c,0x30,0x0a,0x00 };
#define DAT_00085234 DAT_00085234_backing[0]
static undefined1 DAT_00085238_backing[32768] = { 0x5c,0x31,0x00 };
#define DAT_00085238 DAT_00085238_backing[0]
undefined1 DAT_0008523c_backing[32768] = { 0x5c,0x32,0x00 };
#define DAT_0008523c DAT_0008523c_backing[0]
short DAT_001007bc;
/* DAT_00085240/44/48 are the look-text word-separator/article
   constants (" ", "a ", "an ") used by dispatch_object_action/dispatch_object_action_dup
   and build_creature_look_text to glue "a"/"an" + adjective + noun [+ "named" +
   proper name] together -- none had a writer anywhere in this decompile
   (same "orphaned data" class as DAT_00086cc0 etc.), so every look-text
   sentence silently ran its words together with no article at all, e.g.
   "You see mellowoutcastnamedBragit" instead of "You see a mellow
   outcast named Bragit" (found investigating a creature-look crash).
   The real recovered string is lost like several others this session,
   but the correct content is unambiguous from every call site's usage
   -- give them real values instead of leaving them silently empty. */
 char DAT_00085240_backing[8192] = " ";
#define DAT_00085240 DAT_00085240_backing[0]
/* Selected when the following word starts with a vowel (see the callers'
   own vowel checks) -- so this one is "an ", not "a ". */
 char DAT_00085244_backing[32768] = "an ";
#define DAT_00085244 DAT_00085244_backing[0]
 char DAT_00085248_backing[32768] = "a ";
#define DAT_00085248 DAT_00085248_backing[0]
byte *g_scratch_object_ptr;
undefined *DAT_001007c8;
char s_npc_talkedto_00085340[] = "npc_talkedto";
char s_npc_gtarg_00085350[] = "npc_gtarg";
char s_npc_goal_0008535c[] = "npc_goal";
char s_npc_power_00085368[] = "npc_power";
char s_npc_arms_00085374[] = "npc_arms";
char s_npc_hp_00085380[] = "npc_hp";
char s_npc_health_00085388[] = "npc_health";
char s_npc_hunger_00085394[] = "npc_hunger";
char s_npc_whoami_000853a0[] = "npc_whoami";
undefined DAT_001007e3;
undefined DAT_001007fd;
char s_play_name_0008524c[] = "play_name";
char s_play_drawn_00085258[] = "play_drawn";
char s_play_poison_00085264[] = "play_poison";
char s_play_sex_00085270[] = "play_sex";
char s_new_player_exp_0008527c[] = "new_player_exp";
char s_game_days_0008528c[] = "game_days";
char s_game_mins_00085298[] = "game_mins";
char s_game_time_000852a4[] = "game_time";
char s_dungeon_level_000852b0[] = "dungeon_level";
char s_play_level_000852c0[] = "play_level";
char s_play_mana_000852cc[] = "play_mana";
char s_play_power_000852d8[] = "play_power";
char s_play_arms_000852e4[] = "play_arms";
char s_play_hp_000852f0[] = "play_hp";
char s_play_health_000852f8[] = "play_health";
char s_play_hunger_00085304[] = "play_hunger";
char s_npc_name_00085310[] = "npc_name";
char s_npc_yhome_0008531c[] = "npc_yhome";
char s_npc_xhome_00085328[] = "npc_xhome";
char s_npc_level_00085334[] = "npc_level";
short DAT_00101454;
short DAT_0010144c;
ushort *DAT_0010190c;
 undefined2 DAT_002049a0_backing[8192];
#define DAT_002049a0 DAT_002049a0_backing[0]
 undefined DAT_00204920_backing[8192];
#define DAT_00204920 DAT_00204920_backing[0]
undefined2 DAT_002048cc;
undefined2 DAT_002048ce;
undefined1 DAT_002048d7;
undefined2 DAT_002048fc;
undefined2 DAT_002048fe;
undefined1 DAT_00204907;
undefined2 DAT_0020492c;
undefined2 DAT_0020492e;
undefined1 DAT_00204937;
undefined2 DAT_0020495c;
undefined2 DAT_0020495e;
undefined1 DAT_00204967;
undefined DAT_00204982;
undefined2 DAT_00204984;
undefined DAT_00204986;
 undefined1 DAT_00204980_backing[65536];
#define DAT_00204980 DAT_00204980_backing[0]
undefined *DAT_00204988;
undefined DAT_00204992;
undefined2 DAT_00204994;
undefined2 DAT_00204996;
 undefined2 DAT_00204990_backing[32768];
#define DAT_00204990 DAT_00204990_backing[0]
undefined *DAT_00204998;
undefined2 DAT_002049a2;
undefined2 DAT_002049a4;
undefined2 DAT_002049a6;
undefined1 *DAT_002049a8;
undefined2 DAT_002049b2;
undefined2 DAT_002049b4;
undefined2 DAT_002049b6;
 undefined2 DAT_002049b0_backing[32768];
#define DAT_002049b0 DAT_002049b0_backing[0]
undefined *DAT_002049b8;
// was LAB_0002bbe4 -- the "mobile object" collision-response callback
// (slot 2, DAT_002049a8), used by mobile_object_tick for generic
// mobile/projectile objects. Ghidra couldn't resolve this address from
// its own indirect-jump/jumptable call site, but a direct Ghidra
// headless lookup by address (0x2bbe4) DOES decompile it: `undefined4
// FUN_0002bbe4(void) { return 0; }` -- confirmed via disassembly that
// this genuinely IS a no-op in the real binary too (generic
// mobile/projectile objects get no special collision response), not a
// "Ghidra gave up" placeholder. Kept as-is; not a bug.
undefined4 collision_response_mobile_object()

{
  return 0;
}
short DAT_002048d0;
undefined4 DAT_00101924;
undefined4 DAT_00101734;
undefined DAT_002048c2;
/* Was a bare `undefined2` -- same split-symbol class as DAT_002048f0/
   DAT_00204950 below (see their own comment): build_object_placement_snapshot writes up to
   offset 0x28 into whichever of these three globals DAT_0010172c
   currently points at, a massive out-of-bounds write past a 2-byte
   scalar. Oversized generously like its siblings. */
 undefined2 DAT_002048c0_backing[32768];
#define DAT_002048c0 DAT_002048c0_backing[0]
ushort DAT_00101414;
undefined2 DAT_002048c8;
undefined2 DAT_002048c6;
char *DAT_00101904;
undefined4 DAT_00101560;
undefined4 DAT_001013fc;
undefined1 DAT_00101424;
undefined1 DAT_00101428_backing[8192];
#define DAT_00101428 DAT_00101428_backing[0]
undefined2 DAT_002048fa;
undefined4 DAT_0010191c;
undefined2 DAT_00204958;
undefined2 DAT_00204956;
 undefined2 DAT_0023ae40_backing[8192];
#define DAT_0023ae40 DAT_0023ae40_backing[0]
undefined4 DAT_00101440;
byte DAT_00101450;
byte DAT_00101730;
char *DAT_00101404;
undefined DAT_000853c4;
undefined DAT_000853cc;
char *DAT_00101438;
undefined1 DAT_0010142c;
 char DAT_00101740_backing[8192];
#define DAT_00101740 DAT_00101740_backing[0]
char DAT_00101741;
undefined1 DAT_00101743;
undefined2 DAT_00101744;
undefined1 DAT_00101746;
undefined1 DAT_00101747;
undefined1 DAT_00101748;
undefined1 DAT_000853b0;
undefined1 DAT_000853b1;
undefined1 DAT_00101460;
undefined1 DAT_001014e0;
undefined1 DAT_001014e1;
 undefined1 DAT_0023cf08_backing[40960];
#define DAT_0023cf08 DAT_0023cf08_backing[0]
undefined DAT_0023cf09;
undefined DAT_0023cf0a;
undefined DAT_0023cf0b;
undefined DAT_0023cf0c;
undefined1 DAT_00101739;
undefined1 DAT_0010173a;
byte DAT_00101742;
undefined DAT_00101732_backing[8192];
#define DAT_00101732 DAT_00101732_backing[0]
undefined DAT_00101733;
undefined4 DAT_00101728;
/* Was `undefined4` (4 bytes), truncating the real 64-bit pointers
   npc_ai_tick/setup_npc_ai_tick_state store here (&DAT_002048c0/002048f0/00204950,
   one of a 3-way "which per-class scratch buffer" choice) -- same class
   of bug as npc_ai_tick's own iVar5 fix and FUN_000535fc's header
   comment. Confirmed live via lldb: DAT_0010172c read 0xb6c724 instead
   of the real 0x100b6c724 (upper word dropped), so the very next
   build_object_placement_snapshot(DAT_0010190c,DAT_0010172c) call wild-derefs, crashing the
   first time an NPC's per-tick AI (npc_ai_tick) got this far -- which
   never happened before this session's other fixes let that code run
   at all. Note: a separate, unrelated function (the tile_pair_los_blocked
   ring-buffer scan a few thousand lines below) also reads raw bytes at
   `&DAT_0010172c + small offset` as part of an already-fragile,
   not-yet-fixed split-symbol-cluster spanning several adjacent globals
   (see DAT_00101732's own backing-array fix and
   [[split-symbol-clusters-to-structs]]) -- that usage's correctness
   already depended on undefined/compiler-chosen adjacent-global layout
   before this change and is no more or less well-defined after
   widening this one field from 4 to 8 bytes. */
void *DAT_0010172c;
undefined DAT_00101749;
ushort DAT_000853b8;
undefined1 DAT_0010174a;
ushort DAT_0010141c;
ushort DAT_00101910;
byte DAT_001013f8;
byte DAT_00101918;
undefined4 DAT_00101920;
int DAT_00101430;
undefined4 DAT_00101914;
 undefined DAT_00101568_backing[8192];
#define DAT_00101568 DAT_00101568_backing[0]
undefined DAT_00101569;
byte DAT_0010140c;
undefined DAT_00101444;
char DAT_00101408;
char DAT_00101410;
undefined1 DAT_00101420;
ushort DAT_00101900;
undefined DAT_00101448;
char DAT_0010143c;
char DAT_0010173c;
char *DAT_00101400;
undefined2 DAT_00101418;
undefined2 DAT_00101908;
undefined1 DAT_00101738;
byte DAT_00101458;
byte DAT_001018fc;
byte DAT_00101434;
/* Was a bare 1-byte `undefined` -- same split-symbol class as
   DAT_00204980/990/9b0's own backing-array fixes just above: build_object_placement_snapshot
   (called with this as its param_2 "object state" out-buffer, via
   DAT_0010172c) writes fields up to offset 0x28 into it, a massive
   out-of-bounds write past a 1-byte scalar. Confirmed live crashing
   (EXC_BAD_ACCESS writing param_2[0x23]) the first time an NPC actually
   got far enough through its per-tick AI (npc_ai_tick) to reach this
   call -- which never happened before g_npc_tick_enabled/npc_ai_tick's other
   fixes let that code run at all. Oversized generously like its
   siblings rather than tightly to 0x29 bytes, in case another
   not-yet-exercised caller writes further into the same real struct. */
 undefined1 DAT_002048f0_backing[65536];
#define DAT_002048f0 DAT_002048f0_backing[0]
 undefined1 DAT_00204950_backing[65536];
#define DAT_00204950 DAT_00204950_backing[0]
undefined4 DAT_00101944;
short DAT_00202a3c;
undefined DAT_000853d8;
 undefined DAT_002027d1_backing[8192];
#define DAT_002027d1 DAT_002027d1_backing[0]
short DAT_00101938;
short DAT_0010193c;
byte DAT_0010192c;
byte DAT_00101930;
undefined1 DAT_00101934;
char DAT_0010194c;
char DAT_000853d0;
int DAT_00101940;
char DAT_00101928;
char DAT_00101948;
byte *DAT_002046c0;
byte *DAT_002046c8;
undefined4 DAT_00101954;
undefined4 DAT_00101950;
byte DAT_0010195c;
ushort *DAT_00101958;
undefined2 DAT_00101960;
undefined1 DAT_0024d008;
undefined1 DAT_0024fa10;
undefined1 DAT_0024f90c;
/* was `undefined` (1 byte) -- load_voice_sample_page computes
   `(*(ushort*)(param_3+2)+4)*2 + (uint)*(ushort*)(param_3+4)` into
   this global then reads it back masked with & 0xffff and returns it
   as undefined2, so a 1-byte declaration silently truncated any
   sample-page size over 255 bytes before it was ever read back.
   Widened to match its sibling size-cache globals DAT_000853fc/
   DAT_00085400 (both ushort). */
ushort DAT_000853f8;
ushort DAT_000853fc;
ushort DAT_00085400;
undefined1 DAT_00101968_backing[8192];
undefined1 DAT_0023c698_backing[32768];
#define DAT_0023c698 DAT_0023c698_backing[0]
ushort DAT_00101a6c;
undefined4 DAT_00101a70;
/* Dispatch table of babl conversation-text render-time opcode handlers
   (distinct from the babl_builtin_* script-language builtins): a raw
   compiled dialogue-text stream can embed a byte < 0x10 that indexes
   this table, each entry a (script_arg_ptr, render_state_ptr) ->
   words-consumed handler, called from the conversation-rendering loop
   at its three known call sites. Known entries: babl_render_op_wrap_message,
   babl_render_op_say. */
undefined *PTR_FUN_00085408;
undefined1 DAT_00085448_backing[32768];
char s_FONTBIG_SYS_00085454[] = "FONTBIG.SYS";
char *DAT_002506ec;
undefined1 DAT_00085460_backing[32768];
/* Was `uint`, truncating the real pointer this holds (`DAT_002029cc +
   0x5b00`, assigned in reset_level_object_arena -- see there) on this 64-bit host.
   Most uses are pointer<->pointer comparisons or subtractions between
   two pointers sharing the same upper 32 bits, which happen to come out
   right either way -- but resolve_object_link's high-array branch and
   alloc_object_slot's high-array allocation branch both return
   `DAT_002046c4 + offset` as a real pointer, and did so through the
   truncated 32-bit value (same bug class as alloc_object_slot's own
   int-returning-a-pointer bug below). Retyped to match its sibling
   DAT_002046b8 (already a real pointer). */
char *DAT_002046c4;
char s__DATA3D_BED2_E_00085474[] = "\\DATA3D\\BED2.E";
char s__DATA3D_CHAIRSIM_E_00085484[] = "\\DATA3D\\CHAIRSIM.E";
char s__DATA3D_BARRCLOS_E_00085498[] = "\\DATA3D\\BARRCLOS.E";
char s__DATA3D_NITESTAN_E_000854ac[] = "\\DATA3D\\NITESTAN.E";
char s__DATA3D_CHEST_E_000854c0[] = "\\DATA3D\\CHEST.E";
char s__DATA3D_TABLF3_E_000854d0[] = "\\DATA3D\\TABLF3.E";
char s__DATA3D_GATE_E_000854e4[] = "\\DATA3D\\GATE.E";
char s__DATA3D_TMAP64X64_E_000854f4[] = "\\DATA3D\\TMAP64X64.E";
char s__DATA3D_TMAP32X32_E_00085508[] = "\\DATA3D\\TMAP32X32.E";
char s__DATA3D_GRAVE_E_0008551c[] = "\\DATA3D\\GRAVE.E";
char s__DATA3D_TMAP16X16_E_0008552c[] = "\\DATA3D\\TMAP16X16.E";
char s__DATA3D_DOOR_E_00085540[] = "\\DATA3D\\DOOR.E";
char s__DATA3D_NEWPORT_E_00085550[] = "\\DATA3D\\NEWPORT.E";
char s__DATA3D_SHRINE_E_00085564[] = "\\DATA3D\\SHRINE.E";
char s__DATA3D_NEWPILL_E_00085578[] = "\\DATA3D\\NEWPILL.E";
char s__DATA3D_BEAM_E_0008558c[] = "\\DATA3D\\BEAM.E";
char s__DATA3D_ARROW_E_0008559c[] = "\\DATA3D\\ARROW.E";
char s__DATA3D_ROCKBIG_E_000855ac[] = "\\DATA3D\\ROCKBIG.E";
char s__DATA3D_ROCKMED_E_000855c0[] = "\\DATA3D\\ROCKMED.E";
char s__DATA3D_ROCKSMAL_E_000855d4[] = "\\DATA3D\\ROCKSMAL.E";
char s__DATA3D_40LOTUS_E_000855e8[] = "\\DATA3D\\40LOTUS.E";
char s__DATA3D_BENCH_E_000855fc[] = "\\DATA3D\\BENCH.E";
char s__DATA3D_FBRIDGE_E_0008560c[] = "\\DATA3D\\FBRIDGE.E";
char s__DATA3D_DFRAME_E_00085620[] = "\\DATA3D\\DFRAME.E";
undefined DAT_00114c1c_backing[16384];
#define DAT_00114c1c DAT_00114c1c_backing[0]
undefined DAT_00118848_backing[16384];
#define DAT_00118848 DAT_00118848_backing[0]
undefined DAT_0011c474_backing[16384];
#define DAT_0011c474 DAT_0011c474_backing[0]
undefined DAT_001200a0_backing[16384];
#define DAT_001200a0 DAT_001200a0_backing[0]
undefined DAT_00123ccc_backing[16384];
#define DAT_00123ccc DAT_00123ccc_backing[0]
undefined DAT_001278f8_backing[16384];
#define DAT_001278f8 DAT_001278f8_backing[0]
undefined DAT_0012b524_backing[16384];
#define DAT_0012b524 DAT_0012b524_backing[0]
undefined DAT_0012f150_backing[16384];
#define DAT_0012f150 DAT_0012f150_backing[0]
undefined DAT_00132d7c_backing[16384];
#define DAT_00132d7c DAT_00132d7c_backing[0]
undefined DAT_001369a8_backing[16384];
#define DAT_001369a8 DAT_001369a8_backing[0]
undefined DAT_0013a5d4_backing[16384];
#define DAT_0013a5d4 DAT_0013a5d4_backing[0]
undefined DAT_0013e200_backing[16384];
#define DAT_0013e200 DAT_0013e200_backing[0]
undefined DAT_00141e2c_backing[16384];
#define DAT_00141e2c DAT_00141e2c_backing[0]
undefined DAT_00145a58_backing[16384];
#define DAT_00145a58 DAT_00145a58_backing[0]
undefined DAT_00149684_backing[16384];
#define DAT_00149684 DAT_00149684_backing[0]
undefined DAT_0014d2b0_backing[16384];
#define DAT_0014d2b0 DAT_0014d2b0_backing[0]
undefined DAT_00150edc_backing[16384];
#define DAT_00150edc DAT_00150edc_backing[0]
undefined DAT_00154b08_backing[16384];
#define DAT_00154b08 DAT_00154b08_backing[0]
undefined DAT_00158734_backing[16384];
#define DAT_00158734 DAT_00158734_backing[0]
undefined DAT_0015c360_backing[16384];
#define DAT_0015c360 DAT_0015c360_backing[0]
undefined DAT_0015ff8c_backing[16384];
#define DAT_0015ff8c DAT_0015ff8c_backing[0]
undefined DAT_00163bb8_backing[16384];
#define DAT_00163bb8 DAT_00163bb8_backing[0]
undefined DAT_001677e4_backing[16384];
#define DAT_001677e4 DAT_001677e4_backing[0]
undefined DAT_0016b410_backing[16384];
#define DAT_0016b410 DAT_0016b410_backing[0]
undefined DAT_0016f03c_backing[16384];
#define DAT_0016f03c DAT_0016f03c_backing[0]
undefined DAT_00172c68_backing[16384];
#define DAT_00172c68 DAT_00172c68_backing[0]
undefined DAT_00176894_backing[16384];
#define DAT_00176894 DAT_00176894_backing[0]
undefined DAT_0017a4c0_backing[16384];
#define DAT_0017a4c0 DAT_0017a4c0_backing[0]
undefined DAT_0017e0ec_backing[16384];
#define DAT_0017e0ec DAT_0017e0ec_backing[0]
/* g_anim_model_slot: real fix for tick_anim_record's own address-walk bug
   (see that function's own comment). In the ORIGINAL binary, `DAT_00110ff0`
   and these 29 model buffers are one contiguous array -- load_3d_object_models's own
   29 parse_e_model_file calls fill slots 1..29 in exactly this order, and
   tick_anim_record/emit_catalog_object read a model's data back by walking
   `base + slot*0x3c2c`. This port declares every DAT_XXXXXXXX as its OWN
   separately-allocated C global (confirmed: DAT_00114c1c_backing and
   DAT_00110ff0_backing are unrelated arrays, not adjacent slices of one
   buffer) -- so that walk lands in DAT_00110ff0's own unrelated, always-
   zero memory instead of a real model, and the whole real-mesh path in
   emit_catalog_object was silently dead. Slot 0 is deliberately NULL (no
   parse_e_model_file call ever targets it -- see load_3d_object_models's own call
   list, which starts at slot 1). Order matches that call list exactly. */
void * const g_anim_model_slot[30] = {
  0,                 /* 0: unused */
  &DAT_00114c1c,     /* 1: DFRAME.E */
  &DAT_00118848,     /* 2: FBRIDGE.E */
  &DAT_0011c474,     /* 3: BENCH.E */
  &DAT_001200a0,     /* 4: 40LOTUS.E */
  &DAT_00123ccc,     /* 5: ROCKSMAL.E */
  &DAT_001278f8,     /* 6: ROCKMED.E */
  &DAT_0012b524,     /* 7: ROCKBIG.E */
  &DAT_0012f150,     /* 8: ARROW.E */
  &DAT_00132d7c,     /* 9: BEAM.E */
  &DAT_001369a8,     /* 10: NEWPILL.E */
  &DAT_0013a5d4,     /* 11: SHRINE.E */
  &DAT_0013e200,     /* 12: NEWPORT.E (1st load) */
  &DAT_00141e2c,     /* 13: NEWPORT.E (2nd load) */
  &DAT_00145a58,     /* 14: DOOR.E (1st load) */
  &DAT_00149684,     /* 15: DOOR.E (2nd load) */
  &DAT_0014d2b0,     /* 16: TMAP16X16.E (1st load) */
  &DAT_00150edc,     /* 17: TMAP16X16.E (2nd load) */
  &DAT_00154b08,     /* 18: TMAP16X16.E (3rd load) */
  &DAT_00158734,     /* 19: GRAVE.E */
  &DAT_0015c360,     /* 20: TMAP16X16.E (4th load) */
  &DAT_0015ff8c,     /* 21: TMAP32X32.E */
  &DAT_00163bb8,     /* 22: TMAP64X64.E */
  &DAT_001677e4,     /* 23: GATE.E */
  &DAT_0016b410,     /* 24: TABLF3.E */
  &DAT_0016f03c,     /* 25: CHEST.E */
  &DAT_00172c68,     /* 26: NITESTAN.E */
  &DAT_00176894,     /* 27: BARRCLOS.E */
  &DAT_0017a4c0,     /* 28: CHAIRSIM.E */
  &DAT_0017e0ec,     /* 29: BED2.E */
};
/* Per-slot working copy for tick_anim_record's real fix -- a fresh
   16384-byte memcpy of the real model buffer, refreshed every call rather
   than reusing the original's incremental per-point "tick" (whose exact
   purpose isn't needed just to get real geometry flowing, and a full fresh
   copy is simpler and can't drift stale). Kept SEPARATE from the real
   g_anim_model_slot buffers (not aliased directly onto them) so
   emit_catalog_object's own writes into a face record's scratch tail
   can never corrupt the same buffer a future real-3D-model consumer might
   also read. */
unsigned char g_anim_model_scratch[30][16384];
undefined1 DAT_00189588;
/* Was a single `undefined2`/`undefined1` scalar, but
   init_glyph_width_table (the only function anywhere in this
   decompile that touches any of these 4 globals) indexes each one via
   `(&DAT_xxx)[i]` up to the extents below -- an out-of-bounds
   scalar-as-array access, same class of bug as DAT_001007ee earlier
   this session. Widened to real arrays; sizes match the highest index
   each is ever written to in that function (DAT_00110bc0's stride-0x10
   writes imply a wider structure this decompile doesn't otherwise use,
   sized here to its observed 32x16 shape). */
undefined2 DAT_00110a78[0xa0];
undefined2 DAT_00110bc0[0x200];
undefined1 DAT_00110fd0[0x20];
undefined1 DAT_00201b18[0x20];
undefined2 DAT_00189570;
undefined2 DAT_00189572;
undefined2 DAT_00189574;
char * DAT_00110fc8 = 0;
/* DAT_00110fc0 is a byte-cursor written through directly by other
   functions too (e.g. FUN_0005b828: `*DAT_00110fc0 = 0;
   DAT_00110fc0 = DAT_00110fc0 + 1;`), not just by init_glyph_width_table (which
   would normally seed it from DAT_00110fc8 -- see that function's
   comment on why it skips instead). Left NULL by default (same
   tentative-definition zero-init issue as DAT_00110fc8/DAT_00110fcc),
   it segfaulted on the very first such write. Given a real scratch
   buffer here instead of NULL so those direct writes land somewhere
   safe; this is a fallback, not a recovered value, so whatever
   downstream code reads this data back may not see the real original
   content. */
static char DAT_00110fc0_scratch[65536];
char *DAT_00110fc0 = DAT_00110fc0_scratch;
/* Diagnostic accessor (DAT_00110fc0_scratch is static, so demomode.c can't
   read it directly): how far the shared draw/pick-buffer write cursor has
   drifted from its scratch buffer's base, and how much headroom is left
   before it walks off the end into whatever global happens to follow --
   see draw_command_list_rewind's comment and init_gameplay_session's "stray write
   corrupts an unrelated global, never root-caused" comment. */
long uw_debug_pickbuf_drift(void) {
  return (long)(DAT_00110fc0 - DAT_00110fc0_scratch);
}
long uw_debug_pickbuf_capacity(void) {
  return (long)sizeof(DAT_00110fc0_scratch);
}
undefined1 DAT_00110fc4;
undefined4 DAT_00110bb8;
/* Was `undefined4` (4 bytes) despite init_draw_command_cursor using it to reset
   DAT_00110fc0 (`char *`) -- truncating on this 64-bit host, and
   overwriting the DAT_00110fc0_scratch fallback (see DAT_00110fc0's own
   comment) with a truncated garbage/NULL pointer right before
   FUN_0005b828 dereferences it. Retyped to a real pointer, defaulted to
   the same scratch buffer for the same "no real initializer found,
   avoid crashing" reason. */
char *DAT_00110fcc = DAT_00110fc0_scratch;
undefined2 DAT_00201b38;
undefined2 DAT_00201b10;
short DAT_00201c7c;
undefined2 DAT_00201c90;
undefined2 DAT_00201c8c;
undefined1 DAT_0023c3dc;
undefined1 DAT_0023c3d8;
/* DAT_00204880/82/84/86/88/8a/8c/8e/90/92/94/96/97/a1/a2/a3/a4/a5/a6/
   a7/a8/a9/aa were ~20 separate lone `short`/`undefined1`/`undefined2`
   scalars, but movement_collision_sweep and its siblings (movement_sweep_setup, sweep_step,
   sweep_apply_collision, sweep_writeback_position -- reached by `DAT_00204874 = &DAT_00204880`
   then dereferenced relative to that) treat this as one struct with real
   fields up to offset 0x2a (42 bytes) -- confirmed crashing
   (EXC_BAD_ACCESS) dereferencing that far out on a real run. Widened to
   a real backing buffer for that crash, but originally only 80/82/84
   were pointed at it -- every other field was left as its own
   independent global, so `apply_heading_turn`/`apply_movement_tick` and
   friends, which write these fields BY NAME (e.g. `g_jump_ascent_timer = ...`
   for heading), were updating completely different memory than what
   movement_collision_sweep's collision/movement engine reads via
   `*(short *)(DAT_00204874 + 0x14)` pointer arithmetic (real address
   0x204894) -- confirmed via lldb: g_jump_ascent_timer demonstrably changed on
   turn input, while `*(short*)(DAT_00204874+0x14)` read 0 on every
   single check all session. This -- not a dropped call anywhere -- is
   why position/heading never visibly changed despite the movement-
   command-decode and turn-application fixes earlier this session: the
   update landed in memory the movement/collision code never looks at.
   Same lone-scalars-instead-of-a-real-record pattern fixed repeatedly
   this session, just spread across two declaration sites and not
   caught the first time because the earlier fix only needed to solve
   the immediate crash. Rebuilt as a real byte-addressed backing buffer
   (byte, not short, since several fields are single bytes at odd
   offsets) with every field aliased at its real offset, generous
   margin past the furthest (0x2a) seen. */
 undefined1 DAT_00204880_backing[128];
#define DAT_00204880 (*(short *)&DAT_00204880_backing[0])
#define DAT_00204882 (*(short *)&DAT_00204880_backing[2])
#define DAT_00204884 (*(short *)&DAT_00204880_backing[4])
#define DAT_00204886 (*(short *)&DAT_00204880_backing[6])
#define DAT_00204888 (*(short *)&DAT_00204880_backing[8])
#define g_vertical_velocity (*(short *)&DAT_00204880_backing[0xa]) // was DAT_0020488a
#define DAT_0020488c (*(short *)&DAT_00204880_backing[0xc])
#define DAT_0020488e (*(short *)&DAT_00204880_backing[0xe])
// was DAT_00204890. Gravity acceleration applied to g_vertical_velocity
// each tick while nonzero (negative = falling/jumping); 0 = grounded.
#define g_fall_accel (*(short *)&DAT_00204880_backing[0x10])
#define DAT_00204892 (*(short *)&DAT_00204880_backing[0x12])
// was DAT_00204894. Set by resolve_move_vector's jump mode (6) to guard
// against re-triggering a jump before the current one lands; also read
// as a generic "airborne/mid-jump" gate elsewhere.
#define g_jump_ascent_timer (*(short *)&DAT_00204880_backing[0x14])
#define DAT_00204896 DAT_00204880_backing[0x16]
#define DAT_00204897 DAT_00204880_backing[0x17]
#define DAT_002048a1 DAT_00204880_backing[0x21]
#define DAT_002048a2 DAT_00204880_backing[0x22]
#define DAT_002048a3 DAT_00204880_backing[0x23]
#define DAT_002048a4 DAT_00204880_backing[0x24]
#define DAT_002048a5 DAT_00204880_backing[0x25]
#define DAT_002048a6 DAT_00204880_backing[0x26]
#define DAT_002048a7 DAT_00204880_backing[0x27]
#define DAT_002048a8 DAT_00204880_backing[0x28]
#define DAT_002048a9 DAT_00204880_backing[0x29]
#define DAT_002048aa DAT_00204880_backing[0x2a]
short DAT_00201c70;
undefined DAT_002035cf;
/* was a raw `iVar4 + 0x85638` absolute-address literal inside
   trigger_quest_milestone_cleanup_event (no declared global at all --
   Ghidra never recovered this one), read as a 9-entry object-type-id
   table. Its address falls in the same static-data run as the two
   named globals immediately around it here (s__DATA3D_DFRAME_E_00085620
   ends ~0x85632; this string starts at 0x85644), so it's genuinely
   static data, not a wild pointer -- but since the real byte values
   were never recovered, a zero-initialized fallback (matching this
   file's established "safe stand-in, not recovered data" pattern,
   e.g. DAT_00110fc0's own scratch buffer) replaces what would
   otherwise be an absolute-address dereference into unmapped memory
   on this 64-bit host. */
undefined1 DAT_00085638[10]; /* indices 1-9 are the ones actually read (index 0 unused) */
char s_The_book_explodes_in_your_face__00085644[] = "The_book_explodes_in_your_face!";
/* Both were single `undefined` scalars, but resolve_lock_difficulty_rating
   (the only function anywhere in this decompile that touches either)
   indexes each one via `(&DAT_xxx)[i]` up to the extents below -- the
   same out-of-bounds scalar-as-array bug class as DAT_001007ee and
   the glyph-table globals fixed earlier this session. Widened to real
   arrays, sized to the highest index each is ever read at. */
undefined DAT_002026d1[253];
undefined DAT_00202807[121];
char *DAT_002029cc;
/* Typed views onto the object/tile arenas above (see uw.h's
   uw_object_hdr_t/uw_mobile_object_t/uw_tile_t for the recovered field
   layout, cross-referenced against this file's own already-recovered
   accesses). Existing raw-offset call sites throughout this file are
   NOT converted to these -- this is additive, for incrementally
   migrating call sites one at a time without breaking the ~900
   untouched ones. `g_mobile_objects[i]`/`g_static_objects[i]` are
   struct-indexed (unlike DAT_002046b8/DAT_002046c4's own raw byte-
   offset*0x1b/*8 arithmetic); `g_level_tiles[y*0x40+x]` matches
   tilemap_lookup's own index math directly. */
#define g_mobile_objects ((uw_mobile_object_t *)DAT_002046b8)
#define g_static_objects ((uw_object_hdr_t *)DAT_002046c4)
#define g_level_tiles ((uw_tile_t *)DAT_002029cc)
/* decompress_rle_stream's own shared codec state (output/input
   cursors, byte counts, and the current/pending op-code value),
   threaded through its several sibling op-code handler functions
   (read_rle_op_code and others still unnamed below it). */
undefined1 *DAT_00201b40; // output cursor
int DAT_00201b54; // input bytes consumed so far
int DAT_00201b4c; // output bytes written so far
int DAT_00201b58; // "done" flag
ushort DAT_00201b48; // current run/length value
undefined1 *DAT_00201b50; // input cursor
short DAT_00201b44; // current fill-byte/length accumulator
int DAT_00201b3c; // current op code
char s__DATA_pres1_byt_00085790[] = "\\DATA\\pres1.byt";
undefined4 DAT_0023c540;
char s__DATA_lev_ark_00085734[] = "\\DATA\\lev.ark";
char s_Not_enough_disk_space_for_save_g_00085744[] = "Not_enough_disk_space_for_save_g";
char s__DATA_COPYRIGHT_BYT_0008576c[] = "\\DATA\\COPYRIGHT.BYT";
char s__DATA_pres2_byt_00085780[] = "\\DATA\\pres2.byt";
/* Not `static` -- also used by game.c (app_main_loop, main_menu_loop);
   see the extern declaration and DAT_000857a0 macro alias in uw.h.
   Was zero-initialized -- an "unrecoverable string constant" Ghidra never
   populated (same class of bug as the CHRBTNS/opbtn resource-name fixes),
   but unlike those it has NO writer anywhere in uw.c or game.c either, so
   it's a real compile-time constant, not a runtime-built buffer. Every
   reader concatenates it as the base of a "\SAVE0\..." path (lev.ark,
   bglobals.dat, desc) alongside already-recovered sibling constants that
   spell that prefix out in full (s__SAVE0_lev_ark, s__SAVE0_desc, etc.),
   and probe_save_slots/load_game_from_slot both search the built path for a literal
   '0' character to substitute a real slot digit (1-4) -- only "SAVE0"
   supplies one. Recovered as "\SAVE0"; kept the oversized backing array
   since nothing else relies on its exact size. */
undefined1 DAT_000857a0_backing[32768] = "\\SAVE0";
undefined2 DAT_00201b6c;
undefined2 DAT_00201b60;
/* Was `undefined2` (unsigned) -- change_game_mode/FUN_0003bd48 (see their
   own "0x80, see DAT_00085668's comment" sites) cast this to `int` and
   compare against the 32-bit sentinel `0xffffffff` to detect "dispatch
   disabled" (set via `DAT_00201b64 = 0xffff;`, uw.c ~27530/27774). An
   unsigned 16-bit 0xffff zero-extends to 0x0000ffff on that cast, never
   matching 0xffffffff -- the guard silently never fired, and the "no
   dispatch" state fell through into `&DAT_000856a4 + 0xffff * 0x80`, a
   wild out-of-bounds read (confirmed live: an ASan global-buffer-overflow
   in change_game_mode, reached via demomode_pump, in
   demo_automap_note_test.txt). Signed so the same cast sign-extends
   0xffff to -1, matching the comparison's actual intent. */
short DAT_00201b64;
/* Was a plain tentative definition (no initializer), so a truly fresh
   process starts it at C's default zero instead of the real "no
   container open" resting state. Every genuine reset in this file
   (FUN_0003bcd8, probe_save_slots's caller, journey_onward_load_slot_menu's
   own setup) explicitly sets this to 0xffff/-1, and every reader treats
   it as signed (`-1 < DAT_00202080` gates load_player_save_record's
   object_list_unlink call below) -- 0 reads as "container slot 0 is
   open", spuriously unlinking g_player_object from a wild address
   computed off a container that was never really open. Confirmed live:
   SIGBUS in object_list_unlink on the very first "new game" of a
   process that never had an earlier save to leave this at a sane value
   (this codebase's regression scripts had been silently relying on
   stale state left over from a prior interactive session to avoid ever
   hitting this fresh-process path). */
short DAT_00202080 = -1;
short DAT_00201c94;
/* Per-(redraw-mode, dirty-bit) handler dispatch table read by
   dispatch_sticky_mode_handlers/enter_dungeon_view/handle_player_death_and_menu_transition/change_game_mode (DAT_00201b64 = the
   mode: 0 is the normal in-game/dungeon view, seen so far; 1 and 2 are
   some other screen). It's link-time-initialized data in the original
   binary -- nothing in this decompile ever writes to it at runtime -- so
   unlike this file's usual "orphaned populator function" bugs (e.g.
   LAB_000255d0), there's no call to recover: the table's real content
   was recovered by reading UU.exe's .data section directly via Ghidra
   (same method already used for this file's string-constant symbols; see
   e.g. s_chrbtns_00084ef8's comment), then matching each recovered
   32-bit ARM address against this file's own FUN_ names by address.
   Left as a bare zero-filled placeholder, every handler read came back
   NULL, so the per-frame redraw dispatch (dispatch_sticky_mode_handlers) never called
   anything -- the game reached the dungeon and ran forever, but no HUD
   panel, 3D view, or tmap tile ever drew.

   3 of the 48 slots point at functions this decompile never recovered:
   they're only ever reached indirectly through this table, so Ghidra's
   original auto-analysis had no direct call site to find them from (same
   root cause as LAB_000255d0/populate_menu_button_bitmap_entry needing separate recovery).
   Disassembling them directly (Ghidra, headless) shows they're
   conversation-portrait-animation and ambient-sound-cycling handlers --
   not needed to get a player standing in a rendered dungeon, so left
   NULL (safely skipped by this table's own "if handler != NULL" guard)
   rather than ported. // Hack - Disabled

   Real entries are function-pointer-sized (8 bytes on this 64-bit host)
   -- wider than the original 4-byte ARM pointers the table's own index
   math was written for, so every read site's byte-stride constant is
   doubled (0x40 -> 0x80 per 16-entry mode row, 4 -> 8 per single entry;
   see each site's own comment). */
void (*const DAT_00085668_real_table[48])(void) = {
  /* mode 0 (in-game/dungeon view) */
  (void(*)(void))enter_dungeon_view, 0 /* Hack - Disabled: conversation portrait anim */, 0, (void(*)(void))dungeon_view_anim_tick,
  0, 0, 0, 0,
  0, (void(*)(void))refresh_equipment_display_if_visible, (void(*)(void))handle_game_victory_sequence, (void(*)(void))movement_pacing_handler,
  (void(*)(void))sync_player_stats_to_hud, (void(*)(void))hud_panel_redraw_dispatch, 0, 0 /* Hack - Disabled: mode-exit handler, unrecovered */,
  /* mode 1 */
  0, (void(*)(void))enter_automap_screen, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0 /* Hack - Disabled: ambient sound cycling */, 0, 0, (void(*)(void))exit_automap_screen,
  /* mode 2 */
  (void(*)(void))FUN_000286cc, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, (void(*)(void))exit_talk_mode,
};
/* DAT_00085668_backing/DAT_00085668/DAT_000856a4 macros now live in
   uw.h (DAT_000856a4 aliases into the same table at entry 15, byte
   offset 15*8 -- Ghidra's own decompile of the real UU.exe shows this
   used as `&DAT_000856a4 + mode*0x80`, i.e. "entry 15 of whichever
   mode", the same table dispatch_sticky_mode_handlers reads -- not a
   separate byte the way it was declared before, which left it
   permanently 0/NULL too). */
char s__DATA_main_byt_000857a8[] = "\\DATA\\main.byt";
undefined2 DAT_000868d8;
undefined4 DAT_0024cfc8;
undefined4 DAT_002028d8;
undefined2 DAT_00201c78;
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
char s_You_died_000857b8[] = "You_died";
byte DAT_00085730;
// was DAT_0023bca0 -- per-level view-distance default, loaded from
// SHADES.DAT's per-record field 3 by load_shading_level_config (see its own
// comment) and, since this session, consumed by
// extend_visibility_ray_row as the automap-reveal flood's real
// max-ring-passes limit (was a flat hardcoded 16). Also still passed
// (dropped-argument bug, unrelated, not fixed here) to
// weapon_overlay_flash_hold/weapon_overlay_flash_restore, and to the otherwise-dead
// build_visibility_light_grid.
short g_visibility_max_ring_passes;
code *DAT_00201c9c;
char s_Error_code_XXXX___000857c8[] = "Error_code_XXXX_$";
char s_Out_of_Low_Memory___000857dc[] = "Out_of_Low_Memory.$";
char s_Out_of_EMS_Memory___000857f0[] = "Out_of_EMS_Memory.$";
char s_Could_not_read_data___00085804[] = "Could_not_read_data.$";
char s_Could_not_write_data___0008581c[] = "Could_not_write_data.$";
char s_Resource_problem_or_internal_err_00085834[] = "Resource_problem_or_internal_err";
char s_Underworld_can_no_longer_run__Er_0008585c[] = "Underworld_can_no_longer_run._Er";
undefined DAT_00201b70_backing[8192];
ushort DAT_00202084;
byte DAT_0020208c;
short DAT_00085890;
short DAT_00202c68;
short DAT_00202c30;
undefined2 DAT_00203304;
undefined1 DAT_00203303;
// was DAT_0023bf1c. Requested movement mode consumed by
// resolve_move_vector -- see its header comment for the full mode list
// (0 stop, 1 analog move/turn, 6/7 jump, 8 move+face-180, 9/10
// sidestep, 0xc/0xd fly up/down).
short g_movement_mode;
short DAT_00202078;
short DAT_0023bf4c;
/* Link-time-initialized read-only data (same situation as DAT_00085668/
   DAT_00085728: nothing in this decompile ever writes it, and an
   exhaustive whole-binary Ghidra reference search confirms that's true
   of the real UU.exe too -- every one of its 4 references, in
   resolve_move_vector/apply_movement_mode_profile/apply_heading_turn, is a read). Left as a
   bare zero-initialized global, this turn-rate constant (multiplied
   into every heading-step computation in apply_heading_turn's case-1
   branch) made every turn compute to a zero step no matter how long a
   turn key was held -- confirmed via lldb holding Ctrl for 20 ticks:
   DAT_0023bf4c (decoded turn amount) read a real nonzero -72, but the
   player's heading never moved off 0. Recovered the real value by
   reading UU.exe's .data byte at 0x86e68 directly via Ghidra: 0xf. */
#define DAT_00086e68 15
 undefined2 DAT_002048b0_backing[8192];
#define DAT_002048b0 DAT_002048b0_backing[0]
undefined1 *DAT_002048b8;
undefined2 DAT_002048b2;
undefined2 DAT_0023be98;
undefined4 DAT_000858a0;
// was FUN_0003d8e4. Stored into DAT_002048b8 (a movement-state callback
// slot) right alongside the rest of the jump/fall fields' reset in
// set_player_tile_position and the game-init player setup -- always with
// param_1 = the player object. Recovered via Ghidra headless: gates on
// the object's 0x1000 flag bit, g_vertical_velocity being exactly 0 (not
// still rising/falling) and g_jump_ascent_timer being under a
// DAT_00202078-derived threshold, then clears the two landing-adjacent
// fields at struct offsets 6/8 (DAT_00204886/DAT_00204888) and reports
// success -- i.e. a "has the player settled after a jump/fall" check.
// DAT_0003d948/DAT_0003d944 were literal-pool constants (addresses of
// DAT_00204880's struct base and DAT_00202078 respectively), same
// pattern as DAT_0001842c -- resolved to the existing named fields
// rather than left as fresh globals. No call site through DAT_002048b8
// itself was found in this decompile (likely reached only via a
// jumptable Ghidra never resolved into a caller), so this is ported for
// fidelity but not independently exercised.
undefined4 check_and_reset_landing_state(param_1)
ushort *param_1;
{
  undefined4 uVar2;
  if ((((*param_1 & 0x1000) == 0) || (g_vertical_velocity != 0)) ||
     (DAT_00202078 * 3 <= g_jump_ascent_timer * 10)) {
    uVar2 = 0;
  }
  else {
    DAT_00204888 = 0;
    DAT_00204886 = 0;
    uVar2 = 1;
  }
  return uVar2;
}
/* Recovered from UU.exe .data at 0x85d20: tile-floor-height -> world Z
   table, `height_nibble * 64` for nibbles 0..13 (then 0,0,1024).
   `*(short *)(&DAT_00085d20 + nibble*2)`. Was all-zero, so the player's
   world Z (DAT_00204884, set from this table at uw.c ~26936) stayed 0
   -> the 3D camera sat at floor level + a 164-unit eye offset while the
   tile geometry's Y is `height*64` (~768 for a mid-level floor), so
   every floor projected far above the viewport. Also used by
   process_visible_tile_cell's height cull. */
 undefined1 DAT_00085d20_backing[65536] = {
  0x00,0x00, 0x40,0x00, 0x80,0x00, 0xc0,0x00, 0x00,0x01, 0x40,0x01,
  0x80,0x01, 0xc0,0x01, 0x00,0x02, 0x40,0x02, 0x80,0x02, 0xc0,0x02,
  0x00,0x03, 0x40,0x03, 0x00,0x00, 0x00,0x00, 0x00,0x04, 0x00,0x00,
};
#define DAT_00085d20 DAT_00085d20_backing[0]
short DAT_00202088;
short DAT_0023bf48;
short DAT_0020207a;
short DAT_0020207c;
short DAT_00202074;
/* DAT_0008589c/85898/85894 are link-time-initialized read-only data,
   same situation as DAT_00086e68 right above's fix (nothing in this
   decompile writes any of the three, and an exhaustive whole-binary
   Ghidra reference search confirms the real UU.exe agrees -- their
   only references, all in apply_movement_mode_profile, are reads). Sibling constants
   to DAT_00086e68 in the exact same per-facing-direction table
   (apply_movement_mode_profile multiplies each by the same `uVar5` direction-lookup
   value right next to where it uses DAT_00086e68), so almost
   certainly hit the same bug for the same reason. Recovered the real
   values by reading UU.exe's .data bytes directly via Ghidra:
   0x3ac (940), 0xeb (235), 0xbc (188) respectively. Macro defines now
   live in uw.h alongside DAT_00086e68, since apply_movement_mode_profile
   (their only reader) moved into src/input.c. */
undefined DAT_001c2000_backing[8192];
#define DAT_001c2000 DAT_001c2000_backing[0]
char s_out_of_000858dc[] = "out_of";
undefined2 DAT_0020209c;
undefined2 DAT_002020b4;
undefined2 DAT_00202090;
undefined2 DAT_002020c8;
undefined2 DAT_002020bc;
char s_init_gamedisp_goes_000858e8[] = "init_gamedisp_goes";
byte DAT_001013a4;
uint DAT_002020e4;
byte DAT_002020e8;
byte * DAT_0023b814;
int DAT_0023bc94;
/* Tilemap byte addresses (DAT_0023b814 + tile*4), not ints -- Ghidra
   typed them `int` and truncated the 64-bit pointer. Set in pick_object_under_cursor
   from the object-pick result, consumed by target_in_range / object_list_unlink. */
char *DAT_002020b0;
char *DAT_002020a8;
undefined4 DAT_002020ec;
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
static short g_pick_tile_off_backing[0x200];
static undefined1 DAT_0023b676_backing[65536];
#define DAT_0023b676 DAT_0023b676_backing[0]
short g_mouse_y;
short g_mouse_x;
short DAT_002020ac;
/* Ghidra recovered this as "You_see" (underscores, no trailing space);
   it's the "You see " prefix the look/identify code prepends to an
   object/terrain name, so the real bytes are "You see " with a trailing
   space (see describe_picked_terrain: message_scroll_print_wrapped(this) then the
   name then "."). */
char s_You_see_000858fc[] = "You see ";
static undefined1 DAT_0023ad58_backing[65536];
#define DAT_0023ad58 DAT_0023ad58_backing[0]
 undefined2 DAT_0023ae58_backing[8192];
#define DAT_0023ae58 DAT_0023ae58_backing[0]
short DAT_000858c4;
ushort *g_interact_target;
int DAT_002020e0;
char s_belonging_to_00085c90[] = "belonging to ";
short DAT_0023be88;
short DAT_0023bd80;
/* Was a lone `undefined *` -- the real thing is a small function-pointer
   dispatch table for the 3D-view right-click "interact" modes, indexed by
   handle_game_view_click as `table[uVar2]` where uVar2 = cursor mode
   (g_cursor_mode) - 1. Link-time-init data the decompile never populated,
   so every right-click on an object jumped through garbage.

   The ORDER below was wrong for a while (an earlier session's read of
   "roles from the five handler bodies" put them in {look, converse,
   default, talk_npc, attack} order) -- that produced a real,
   user-visible bug: mode 2's icon (dagger graphic, the weapon-ready HUD
   status bit it sets matches ready_weapon's own) dispatched to what was
   then called interact_converse instead of interact_attack, crashing
   there when the player actually tried to swing. Re-dumped the raw 5
   pointers directly from UU.exe at 0x858c8 (Ghidra headless, mem.getInt)
   instead of trusting the prior role-guessing pass; the real order is:
     0  interact_use       (0x3f2c4) open doors/pull chains/etc: calls
                          use_object_on_target when the target is in
                          range but line-of-sight is blocked (i.e. it's
                          something you interact with in place, not
                          something you're looking straight at)
     1  interact_attack    (0x3f368) attack (swing toward the cursor)
     2  interact_look      (0x3f14c) look / examine ("You see ..." via
                          dispatch_object_action; also a use/get fallback
                          when FUN_000576d0() says so)
     3  interact_default   (0x3ee90) get / pick up an object (its own
                          body does check_object_carry_weight +
                          attach_picked_up_object_to_cursor); falls back
                          to interact_talk_npc/interact_use itself when
                          the target under the cursor is an NPC instead
                          of an object
     4  interact_talk_npc  (0x3f128) talk to NPC (interact_talk_npc)
   i.e. mode 2 (g_cursor_mode==2) is the real numeric Attack mode, and
   mode 5 is Talk-to-NPC -- confirmed independently by ready_weapon's own
   pre-session value (`g_cursor_mode = 2`, see its own comment) and by
   cursor_mode_button_click's mode-2 special case, which sets the exact
   same weapon-ready HUD state (flags5f |= 2, set_hud_status_value(8,4))
   as ready_weapon. handle_game_view_click's real ARM (0x3f590-0x3f5a8) computes
   the dispatch index as 2 when no cursor mode is selected (not 0), so a
   bare right-click still lands on interact_look either way -- see that
   function's own comment for the matching `_dispatch` fix.

   The real in-game mode ORDER, top to bottom of the 5 mode-select icons
   (per direct user knowledge of the shipped game): Talk, Get, Look,
   Attack, Use -- i.e. Talk is drawn topmost (closest to the special
   6th "options" icon above it) down to Use at the bottom, the reverse
   of the numeric mode order above (mode 5 = Talk = topmost icon, mode
   1 = Use = bottommost of the 5), matching
   DAT_000858a8/DAT_000858b8's own position table (mode 5 has the
   smallest native Y, mode 1 the largest -- smaller Y is higher on
   screen). `interact_converse` (this table's index 0) was renamed to
   `interact_use` once its actual body -- calling
   use_object_on_target on a blocked-line-of-sight target, e.g. a door
   -- turned out to match "Use" (open doors, pull chains, etc.), not
   conversation at all; there is no separate "converse" interact
   handler in this game at all, only Talk (interact_talk_npc, mode 5). */
extern void interact_default(void);
extern void interact_talk_npc(void);
extern void interact_look(void);
extern void interact_use(void);
extern void interact_attack(void);
void (*const PTR_FUN_000858c8_table[5])(void) = {
  interact_use,        /* 0: use (mode 1, bottommost icon) */
  interact_attack,      /* 1: attack (mode 2) */
  interact_look,        /* 2: look / examine (mode 3) */
  interact_default,     /* 3: get (mode 4) */
  interact_talk_npc,    /* 4: talk (mode 5, topmost icon) */
};
#define PTR_FUN_000858c8 (PTR_FUN_000858c8_table[0])
code *DAT_002020b8;
/* Real, compile-time-baked data recovered directly from UU.exe (same
   technique/precedent as DAT_00085668 -- see memory.md's "HOW WE GOT THE
   DISPATCH TABLES POPULATED"), not something a runtime populator ever
   writes. Confirmed via Ghidra: 0x858a8 holds 8 real int16 X coordinates
   {8,8,6,6,7,8,0,0}, immediately followed at 0x858b8 by 8 real int16 Y
   coordinates {100,81,66,48,28,11,144,0}, immediately followed at 0x858c8
   by PTR_FUN_000858c8 (the very next declared symbol in this file) --
   a clean, unambiguous 8-short/8-short layout with no gap. These are the
   6 in-game HUD cursor-mode icon buttons' (Look/Use/Talk/etc, drawn by
   mode_icon_highlight_on/mode_icon_highlight_off via draw_sprite_by_id) screen positions;
   only indices 0-5 are ever read (cursor_mode_button_click bounds-checks
   at 5), the remaining 2 slots are unused padding in the original data.
   Declaring these as plain zero-filled arrays (as a prior session had
   them) meant every highlight/unhighlight icon drew at (0,0) instead of
   its real button position -- part of the "door image on mode-icon
   click" bug (see cursor_mode_button_click's own comment for the other
   half, a dropped mode_icon_highlight_off argument). */
 const unsigned short DAT_000858a8_real[8] = {8,8,6,6,7,8,0,0};
#define DAT_000858a8 (*(undefined1 *)DAT_000858a8_real)
 const unsigned short DAT_000858b8_real[8] = {100,81,66,48,28,11,144,0};
#define DAT_000858b8 (*(undefined1 *)DAT_000858b8_real)
ushort DAT_0024fa18;
char DAT_00085910;
char DAT_00085911;
char DAT_00085918;
char DAT_00085919;
undefined DAT_00085908_backing[8192];
char s__CRIT_assoc_anm_00085934[] = "\\CRIT\\assoc.anm";
undefined1 DAT_0023c460_backing[32768];
/* DAT_0023c4c0/DAT_0023c5b8/DAT_0024ac18 (a resource-slot status table,
   load_critter_association_tables) were lone-byte scalars indexed up to 0x80 (128) --
   confirmed overflowing into the unrelated DAT_00248410 (a malloc'd
   buffer pointer) via an lldb watchpoint, corrupting it and causing a
   later crash in seed_conversation_globals_for_new_game far away from this actual bad write.
   Widened with the usual backing-buffer pattern. Macro defines for all
   four backing arrays now live in uw.h, since load_critter_association_tables
   (their only reader) moved into src/ai.c. */
undefined1 DAT_0023c4c0_backing[256];
undefined1 DAT_0023c5b8_backing[256];
 undefined1 DAT_0023ce70_backing[8192];
#define DAT_0023ce70 DAT_0023ce70_backing[0]
undefined1 DAT_0024ac18_backing[256];
/* Real string, recovered via Ghidra disassembly of decode_critter_sprite_page
   (the caching "\CRIT\CR<pp>PAGE.N<nn>" per-page critter-animation
   resource loader): the decompile showed DAT_00085928/29/30/31 as four
   unrelated lone chars, and its own two-arg Ordinal_1063 (strcat) call
   right after them dropped BOTH arguments (same class of bug as
   resolve_object_link's ~30 call sites fixed earlier this session).
   The real ARM passes `Ordinal_1063(stack0xffdc3238_buf, &DAT_00085920)`
   -- concatenating this template (its "00"/"00" digit pairs already
   patched with the real page numbers by the writes at +8/+9 and
   +0x10/+0x11) onto the copied install-dir path -- then opens THAT
   buffer, not the never-populated `acStack_120` the decompile shows. */
char DAT_00085920_backing[20] = "\\CRIT\\CR00PAGE.N00";
#define DAT_00085920 DAT_00085920_backing[0]
#define DAT_00085928 DAT_00085920_backing[8]
#define DAT_00085929 DAT_00085920_backing[9]
#define DAT_00085930 DAT_00085920_backing[0x10]
#define DAT_00085931 DAT_00085920_backing[0x11]
ushort DAT_00202508;
ushort DAT_002022f8;
ushort DAT_00202300;
ushort DAT_00202304;
int DAT_002022fc;
unsigned short u_INVALID_HANDLE_VALUE_00085944[] = u"INVALID_HANDLE_VALUE";
/* Both real 0x80-element pointer-cache arrays (per free_frame_geometry_buffers's
   own comment -- "DAT_0023c7a0[0x140], DAT_002020f8[0x80]" -- and
   shutdown_game_resources's matching 0x80-iteration cleanup loop for DAT_00202308),
   same "lone undefined4 scalar indexed as an array" bug as DAT_0023c7a0
   right above (already fixed): each slot holds a real malloc'd buffer
   pointer (decode_critter_sprite_page/emit_catalog_object's per-page glyph decode),
   so a 4-byte-stride int[] truncates/corrupts every other slot's pointer
   on this 64-bit host. Sized generously past the documented 0x80 like
   this file's other such tables. */
void *DAT_002020f8_arr[256];
#define DAT_002020f8 DAT_002020f8_arr[0]
void *DAT_00202308_arr[256];
#define DAT_00202308 DAT_00202308_arr[0]
int DAT_0023b83c;
 undefined1 DAT_00202520_backing[1024];
#define DAT_00202520 DAT_00202520_backing[0]
/* Per-geometry-record decoded-sprite pixel buffers, one malloc per visible
   object, freed each frame by free_frame_geometry_buffers. Ghidra typed it
   `undefined4` (4 bytes), truncating the 64-bit Ordinal_1041 pointer -- the
   memcpy into it (Ordinal_1044) would fault. Widened to a real pointer
   array; only decode_tile_object_billboard_texture, free_frame_geometry_buffers and app_main_loop's
   startup zero-fill touch it. */
void *DAT_0023c7a0_arr[0x140];
#define DAT_0023c7a0 DAT_0023c7a0_arr[0]
undefined1 DAT_0023ce71;
/* struct-recovery-plan.md's "DAT_0024e090 pointer table" candidate:
   a large table of glyph/resource-pointer slots indexed by font/char/
   frame id (see lookup_grtile_by_id and its populators uw_register_gr_entry/
   register_grtile_entry/reregister_grtile_entry, read back by lookup_grtile_by_id/
   blit_object_sprite_by_frame/sprite_list_flush_blit_raw). Was a raw byte buffer
   (DAT_0024e090_backing[524288]) with every access site manually
   computing `&DAT_0024e090 + slot*8` and casting to a pointer type --
   correct on the original 32-bit binary where a pointer IS 4 bytes
   (the buffer was doubled from a 4-byte stride to fix that truncation
   earlier this session), but the byte-buffer-plus-manual-stride shape
   was never the real type. Retyped as what it actually is: a flat
   array of pointers, same pattern already used for DAT_0023c7a0_arr
   just above. */
void *g_grtile_registry[65536];
ushort DAT_00202738;
ushort DAT_00202730;
static undefined1 DAT_0024d090_backing[65536];
#define DAT_0024d090 DAT_0024d090_backing[0]
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
char *DAT_0023ae34;
char *DAT_0023ae30;
char *DAT_0023ae3c;
undefined4 DAT_0020250c;
char s__DATA__00085970[] = "\\DATA\\";
short DAT_00204840;
undefined4 DAT_00204844;
char s__DATA_pals_dat_00085978[] = "\\DATA\\pals.dat";
// was DAT_0008725c -- gates weapon_swing_draw_tick's blit; temporarily
// cleared during full-screen wipe/dissolve transitions (level loads,
// screen fades) so the weapon overlay doesn't glitch mid-transition,
// then restored once the transition finishes.
undefined4 g_weapon_overlay_enabled;
undefined4 DAT_00202514;
int DAT_00202720_backing[128];
int *DAT_00202720 = DAT_00202720_backing;
undefined1 DAT_00202724_backing[8192];
undefined4 DAT_00202728;
char *DAT_0020274c;
 undefined DAT_00202518_backing[8192];
#define DAT_00202518 DAT_00202518_backing[0]
ushort DAT_00202744;
void *LAB_000415b0(param_1)
unsigned int param_1;

{
  /* Ghidra couldn't resolve this address into a proper function (an
     indirect-jump/jumptable target it gave up on). Traced from its use in
     load_gr_resource_entries: called as (*param_4)(itemByteSize) and the result is
     used as the destination buffer for reading that item's data, then
     passed on to the post-process callback -- i.e. an allocator. A no-op
     stub returning 0 here made load_gr_resource_entries treat every real resource
     load as a failure (the batch-AND check in load_startup_gr_resources), even though
     the underlying file read succeeded. */
  return Ordinal_1041(param_1);
}
/* load_gr_resource_entries's post-process callback: (decoded_buffer, byte_size,
   entry_index). Ghidra lost the real body (indirect-jump target); the old
   no-op stub read every .GR file but never REGISTERED the loaded buffers,
   so lookup_grtile_by_id's g_grtile_registry[] pointer table stayed empty for every
   resource loaded through here (QUESTION/VIEWS/ANIMO/BUTTONS/CURSORS/
   3DWIN/OBJECTS/TMFLAT/TMOBJ). Only register_grtile_entry (flasks/compass/...) was
   a real registrar. Register the buffer the same way register_grtile_entry does:
   at g_grtile_registry[base + entry_index]. */
#define UW_DAT_0024E090_SLOTS (sizeof(g_grtile_registry) / sizeof(g_grtile_registry[0]))
static void uw_register_gr_entry(unsigned base, void *buf, int idx)
{
  unsigned slot = base + (unsigned)idx;
  if (slot < UW_DAT_0024E090_SLOTS) {
    g_grtile_registry[slot] = buf;
  }
}
undefined4 LAB_000415d0(void *buf, unsigned size, int idx)
{
  /* Caller load_gr_resource_group loads at the running cursor DAT_00202744 and
     advances it by the file's entry count afterwards. */
  (void)size;
  uw_register_gr_entry((unsigned)DAT_00202744, buf, idx);
  return 1;
}
undefined4 LAB_00041610(void *buf, unsigned size, int idx)
{
  /* Caller load_objects_gr (OBJECTS.GR) -- does not advance the cursor; the
     next file resets DAT_00202744 to 0x1c0, so OBJECTS.GR occupies the
     absolute [0, entry_count) range (frame N == object type N). */
  (void)size;
  uw_register_gr_entry(0, buf, idx);
  return 1;
}
undefined2 DAT_000859a8;
// was LAB_00041670
undefined4 register_tmflat_gr_entry(void *buf, unsigned size, int idx)
{
  /* Caller load_tmflat_gr (TMFLAT.GR) with a fixed id base stashed in
     DAT_000859a8 (0x170). Real ARM (0x41670): registers each entry at
     the running cursor DAT_00202744 and ADVANCES the cursor by one,
     recording DAT_0024d090[(0x170+idx)*4] = frame as the object-id ->
     frame remap. So TMFLAT occupies DAT_00202734..+0xf and TMOBJ
     starts at DAT_00202734+0x10 -- the "+0x10" in emit_catalog_object's
     per-instance frame formula. This used to register only at the id
     alias and never advance the cursor, placing TMOBJ 16 frames early
     so every "+DAT_00202734" / "+DAT_00202734+0x10" TMFLAT/TMOBJ frame
     read landed on the wrong image (lever/pull-chain/sign/bridge).
     The id alias (0x170+idx) is kept because this port resolves object
     ids to frames as the identity (resolve_sprite_id_to_frame never
     consults the remap). */
  (void)size;
  uw_register_gr_entry((unsigned)DAT_000859a8, buf, idx);
  uw_register_gr_entry((unsigned)DAT_00202744, buf, 0);
  DAT_00202744 = DAT_00202744 + 1;
  return 1;
}
void *LAB_000416e8(param_1)
unsigned int param_1;

{
  /* Allocator callback, same role as LAB_000415b0 -- see there. Used by
     load_hud_icon_gr/reload_single_grtile_entry (flasks/compass/dragons/power/chains/
     spells/scrledge and friends). */
  return Ordinal_1041(param_1);
}
/* Was `undefined4` -- truncated the real 64-bit destination pointer
   decode_gr_entry_to_buffer assigns here (see that function's own comment on why
   this global exists at all: load_gr_resource_entries always decodes
   into its OWN malloc'd buffer via the allocator callback and only
   ever hands that buffer back through the post-process callback, so
   passing a pre-allocated destination needs this indirection). */
void *DAT_00202510;
void *LAB_000416f8(param_1)
unsigned int param_1;

{
  /* Allocator callback, same role as LAB_000415b0 -- see there. Used by
     decode_gr_entry_to_buffer, which passes no post-process callback (param_5 == 0). */
  return Ordinal_1041(param_1);
}
/* Not decompiled -- decode_gr_entry_to_buffer's post-process callback. Ghidra never
   recovered a real one here (it hardcoded param_5=0, "no callback"),
   but that leaves load_gr_resource_entries's freshly-decoded buffer
   completely unreachable: it's malloc'd fresh by LAB_000416f8, never
   registered anywhere (unlike every sibling load_gr_resource_entries
   call site, which DOES pass a real post-process callback to register
   its buffer into g_grtile_registry[] -- see LAB_000415d0/LAB_00041610/
   register_tmflat_gr_entry), and then simply discarded once load_gr_resource_entries's
   loop moves on. Confirmed live: begin_hud_panel_flip's decode calls reported
   success while leaving their destination grtile buffer entirely
   zeroed (0/9462 nonzero bytes), which is exactly what "decode
   succeeds but the caller's buffer is never touched" looks like. Since
   decode_gr_entry_to_buffer stashes its REAL destination in DAT_00202510 (see that
   global's own comment) specifically to route around the missing
   callback, the callback this decode always needed is simply "copy the
   decoded bytes there" -- same leak-the-temporary-allocation posture
   as Ordinal_1018's own documented precedent (freeing a possibly-
   garbage pointer is worse than a short-lived leak). */
unsigned int uw_copy_gr_entry_to_dest(void *buf, unsigned int size, int idx)
{
  (void)idx;
  if (DAT_00202510 != 0) {
    memcpy(DAT_00202510, buf, size);
  }
  return 1;
}
undefined2 DAT_0020272c;
undefined2 DAT_0024fa1c;
undefined2 DAT_00202734;
char DAT_00085988;
char DAT_0024d000;
char DAT_0024fa28;
/* Was `static undefined DAT_000859ac_backing[8192]` -- Ghidra never
   recognized this as a string reference (no cross-reference to label
   it), but the raw bytes at this address in the real binary spell out
   "optb\0" plainly -- confirmed via direct memory dump (Ghidra
   headless, `mem.getBytes`), matching OPTB.GR in data/DATA/. This and
   its 3 siblings below were the "Unrecoverable string tables" this
   file's own comments referenced; all 4 turned out to be perfectly
   readable, just never labeled. Recovering them fixes the frame-
   counter corruption bug documented at load_gr_resource_entries's own
   "nothing to load" branch (each of these 4 was previously read as an
   empty string, silently re-adding the previous resource's frame
   count instead of contributing OPTB.GR's/etc.'s own real frames). */
char s_optb_000859ac[] = "optb";
char s_scrledge_000859b4[] = "scrledge";
char s_spells_000859c0[] = "spells";
char s_chains_000859c8[] = "chains";
/* Was `static undefined DAT_000859d0_backing[8192]` -- real bytes
   spell "eyes\0", matching EYES.GR. See s_optb_000859ac's comment. */
char s_eyes_000859d0[] = "eyes";
char s_power_000859d8[] = "power";
/* Was `static undefined DAT_000859e0_backing[8192]` -- real bytes
   spell "inv\0", matching INV.GR. See s_optb_000859ac's comment. */
char s_inv_000859e0[] = "inv";
char s_dragons_000859e4[] = "dragons";
char s_compass_000859ec[] = "compass";
char s_flasks_000859f4[] = "flasks";
/* Was `static undefined DAT_000859fc_backing[8192]` -- real bytes
   spell "lfti\0", matching LFTI.GR. See s_optb_000859ac's comment.
   This is the one loaded right after TMOBJ.GR -- the resource the
   mode-icon highlight (mode_icon_highlight_on/mode_icon_highlight_off) actually indexes
   into. */
char s_lfti_000859fc[] = "lfti";
char s_tmobj_00085a04[] = "tmobj";
char s_tmflat_00085a0c[] = "tmflat";
char s_3dwin_00085a14[] = "3dwin";
char s_cursors_00085a1c[] = "cursors";
char s_buttons_00085a24[] = "buttons";
char s_animo_00085a2c[] = "animo";
char s_objects_00085a34[] = "objects";
char s_views_00085a3c[] = "views";
char s_question_00085a44[] = "question";
char s__DATA_allpals_dat_00085a50[] = "\\DATA\\allpals.dat";
undefined2 DAT_00202748;
char s_doors_00085a64[] = "doors";
 undefined1 DAT_0023b840_backing[8192];
#define DAT_0023b840 DAT_0023b840_backing[0]
static undefined1 DAT_00202750_backing[256];
#define DAT_00202750 DAT_00202750_backing[0]
char *DAT_00202890;
char *DAT_0020289c;
/* Real-pointer side table for the keybinding records' handler field. Each
   DAT_0020289c record packs its handler as 4 raw bytes (offset 8-0xb) --
   fine on the original 32-bit target, a truncated / uncallable pointer on
   this 64-bit host. register_key_binding writes the real 64-bit handler here
   keyed by record position (== registration order, and also 0xffff minus
   the record's own id byte); dispatch_key_binding calls it from here; unregister_key_binding
   keeps it in sync when it compacts the table. Nothing ever matched a
   keybinding before (the mode gate was reading the wrong byte -- see
   set_game_mode), so the truncated call had simply never been reached. */
void (*g_keybind_handler[512])(int);
int g_keybind_handler_n;
/* Same 64-bit-truncation problem for the mouse-click-region table
   (register_click_region stored param_7 -- the handler -- in a 4-byte
   field of an 0x12-byte record, and poll_input_bindings called through
   that truncated pointer -> EXC_BAD_ACCESS the first time a click landed
   in a registered region, e.g. the 3D viewport's walk region). Keep the
   real 64-bit handler here, keyed by record position, exactly like
   g_keybind_handler; unregister_key_binding keeps it in sync. */
void (*g_click_region_handler[128])(int);
int g_click_region_handler_n;
undefined2 DAT_00202898;
undefined2 DAT_0020288c;
undefined2 DAT_00202894;
undefined2 DAT_00085a70;
/* .data 0x85c38: widget-id -> g_equipped_items slot-array-index lookup (read
   as `(&g_backpack_widget_to_slot)[widget_id]` for widget ids 0-0x16, i.e. one byte
   per record of the g_inv_hotspot_click_x1 hotspot table). Widget ids
   0-5 were previously left at 0 ("still-unimplemented torso/legs/feet/
   head armor slots, out of scope") since this table's real .data bytes
   looked unrecoverable at the time -- they're not: dumped directly from
   the shipped binary at 0x85c38 (same `mem.getBytes` technique as this
   project's other recovered constant tables) and they ARE real,
   non-zero data: widget 0->slot 1, 1->slot 3, 2->slot 0, 3->slot 1
   (shares slot 1 with widget 0), 4->slot 2, 5->slot 4. Widget ids
   6..19 already matched this real data exactly (N -> N-1: slots
   5..18) -- only the low end was wrong.

   User report: "lighting a torch does not seem to impact the visible
   pixels at all." This fix restores real, binary-verified data (widget
   0->slot1, 1->slot3, 2->slot0, 3->slot1, 4->slot2, 5->slot4), which is
   correct and worth keeping on its own, but it does NOT fix that bug --
   confirmed by rebuilding with this fix applied and re-testing live: a
   lit torch still auto-equips into widget 6 (slot 5), same as before,
   because widgets 0-5's own click hotspots in g_inventory_hotspot_table
   are still all zero/unimplemented ("worn armour overlay", see that
   table's own comment) -- nothing can actually reach these slots
   through play yet regardless of this table's data being right. The
   real bug is one level up: refresh_player_equipment_effects's ambient-light rescan only
   ever checks g_equipped_items slots 0-3 (plus the mouse cursor as a stand-
   in for a notional 5th slot) -- confirmed via a fresh Ghidra decompile
   of the pristine binary that this 0-4 range is exactly what the real
   compiled code does, not a decompilation artifact. A torch equipped
   the only way currently reachable in-game (auto-equip into the
   generic backpack list, landing in widget 6 / slot 5) is structurally
   outside that range and can never be found by the rescan, which is
   why the correct -32 ambient bias set by use_light_source always gets
   immediately stomped back to +8. g_light_source_slots ({5,6,7,8}, "already-
   equipped valid WIDGET ids for a light source" -- confirmed by
   use_light_source's own comparison against find_or_assign_object_widget's
   return value, a widget id, not a slot index) suggests widget 5 (slot
   4, inside the scanned range) is the real intended primary torch
   position -- but reaching it requires the still-missing armor-slot
   hotspots to be built out first; that's a real feature gap, not a
   one-line fix. See [[torch-ambient-light-scan-range-mismatch]] for the
   full investigation.

   CORRECTED (found re-verifying with a wide re-dump at the user's
   request, chasing the widget-20/21/22 investigation below): index 20
   was transcribed wrong here -- it's real data too (0x13 = 19), not
   part of the "no mapping" tail. Only indices 21-22 are genuinely 0
   (past any real widget). Widget 20 -> slot 19 is exactly the "open
   container indicator" slot -- see g_inventory_hotspot_table's own
   comment and DAT_00085c4c below for the full mechanism this feeds. */
 unsigned char g_backpack_widget_to_slot_backing[0x17] = {
  1,3,0,1,2,4, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19, 0,0,
};
#define g_backpack_widget_to_slot g_backpack_widget_to_slot_backing[0]
/* g_equipped_items (28 2-byte "backpack/equipment slot" object-link
   records -- see g_backpack_widget_to_slot's own comment) was a bare scalar Ghidra
   never gave real backing to. A plain standalone static array is NOT
   enough, though: every reader/writer passes `&g_equipped_items + idx*2`
   straight to resolve_object_link (or gets it back from
   encode_object_slot_index's matching encode step), and resolve_object_link
   refuses to decode through any address outside the level's own
   object-arena buffer (the [DAT_002046b8-0x4000, DAT_002046c4+0x1800)
   range it guards against wild pointers -- see its own comment). A
   separate global will never fall inside that malloc'd range, so
   every resolve came back NULL -- confirmed live: a freshly-placed
   backpack item's own slot read back a null object and segfaulted the
   very next slot redraw (redraw_inventory_widget_range). In the original 32-bit binary
   this table's fixed low address plausibly sat inside the same static
   region the "dynamic" arena pointers were themselves offset from;
   here that arena is a real runtime allocation (init_level_object_arena's
   `Ordinal_1041(0x7c08)`), so this table now lives inside that SAME
   buffer instead -- g_backpack_slot_table is pointed at its unused
   tail (offset 0x7b00, 28*2=56 bytes, well inside the buffer's real
   0x7c08 size) by reset_level_object_arena at level load, and
   resolve_object_link's own valid-range upper bound is widened by the
   same 0x38 bytes so this new tail is actually accepted (see both of
   their own comments). */
char *g_backpack_slot_table;
#define g_equipped_items g_backpack_slot_table[0]
#define DAT_00202951 g_backpack_slot_table[1]
void uw_debug_dump_inventory_state(void) {
  int occupied = 0;
  if (g_backpack_slot_table) {
    for (int i = 0; i < 28; i++)
      if (*(unsigned short *)&g_backpack_slot_table[i*2] & 0xffc0) occupied++;
  }
  fprintf(stderr, "[demo] post-screenshot state: g_cursor_holding_state(holding)=%d occupied_slots=%d g_current_container_record=%p\n",
          (int)g_cursor_holding_state, occupied, (void *)g_current_container_record);
}
/* Was a lone `undefined4` (4-byte) scalar holding a real heap pointer
   (an Ordinal_1041-allocated open-container tracking record, same class
   as g_current_container_record right above) -- every assignment to/from
   it (open_backpack_container, close_backpack_container) truncated the
   real 64-bit pointer to 32 bits. That alone was silent as long as only
   ONE container was ever open simultaneously (the only case exercised
   before this session's container fixes), since nothing ever needed to
   walk to a SECOND record through it. Widened to a real pointer; see
   also the g_current_container_record-chain "next"/"prev" link widening
   in open_backpack_container/leave_nested_container_level/
   free_open_container_chain below for the deeper version of this same
   bug, found and fixed alongside it. */
char *g_open_container_list;
/* g_backpack_widget_to_slot_plus1's address (0x85c39) is exactly one byte past
   g_backpack_widget_to_slot's (0x85c38) -- not a separate byte, an alias into the
   same backing array (same relationship as DAT_002028ec/DAT_002028e8,
   DAT_00202951/g_equipped_items elsewhere in this file). close_backpack_container (the
   close-container function) indexes it as `(&g_backpack_widget_to_slot_plus1)[0xb..0x12]`
   (11..18), which through this alias lands at
   g_backpack_widget_to_slot_backing[12..19] -- exactly the 8 backpack-grid widgets,
   restoring their default N -> N-1 slot mapping on close (see
   g_backpack_widget_to_slot's own comment). As a standalone scalar this instead
   silently corrupted 18 bytes of whatever the linker placed after it. */
#define g_backpack_widget_to_slot_plus1 g_backpack_widget_to_slot_backing[1]
/* Was a lone `undefined4` scalar, but indexed as `(&DAT_002028a0)[i]` for
   i up to 7 (free_open_container_chain's icon save/restore swap) -- classic
   "undersized global used as an array" bug (same class as
   DAT_0024bfa0/DAT_000891b0 etc.), and it happened to corrupt whatever
   real global the linker/compiler placed a few slots further along --
   confirmed via an lldb watchpoint that this exact write
   (`(&DAT_002028e8)[iVar5] = uVar1` in init_inventory_panel_hotspots, a sibling of this
   same bug one array over) was clobbering g_selected_object (a real, load-
   bearing `char *`), corrupting an equipped-item lookup and crashing
   refresh_player_equipment_effects on the very first in-game frame. Widened with a safety
   margin. */
 undefined4 DAT_002028a0_backing[64];
#define DAT_002028a0 DAT_002028a0_backing[0]
/* Same bug: indexed as `(&DAT_002028e8)[i]` for i up to 0x16 (22) in
   init_inventory_panel_hotspots/free_open_container_chain/etc. -- this is the specific array whose
   overflow was landing on and corrupting g_selected_object (see above).
   Widened with a safety margin. */
 undefined4 DAT_002028e8_backing[64];
#define DAT_002028e8 DAT_002028e8_backing[0]
/* Same "resolve_object_link needs an in-arena address" issue as
   g_equipped_items (see its own, much longer comment) -- a standalone
   backing array's address will never fall inside the level's object
   arena, so every resolve_object_link(&g_current_container_link) call (the "item
   currently in the process of being combined/used" single-object
   link) returned NULL. Routed through g_backpack_slot_table's same
   arena reservation instead, right after its 28 backpack slots (see
   reset_level_object_arena/init_level_object_arena/resolve_object_link's own updated
   comments -- all four move together). */
#define g_current_container_link (*(ushort *)&g_backpack_slot_table[56])
/* DAT_002028ec's address (0x2028ec) is exactly one element (4 bytes)
   past DAT_002028e8's (0x2028e8) -- not a separate global, an alias into
   the same array at index 1 (same relationship as the DAT_000fb880
   family elsewhere in this file). Declaring it separately, as an
   earlier pass did, split it apart from the real array. */
#define DAT_002028ec DAT_002028e8_backing[1]
undefined4 DAT_002029a0;
undefined4 DAT_0020299c;
/* Ghidra left 0x202988 and 0x2028e0 as bare literal addresses (no symbol)
   -- small per-hand "currently drawn weapon / hand state" arrays indexed
   0..5 by reset_equipment_and_container_state/reload_paperdoll_body_sprite (which zero them) and FUN_00046xxx
   (which reads+rewrites them to gate a paperdoll redraw). On the 32-bit
   binary `idx + 0x202988` was real addressing; here it hits an unmapped
   low address and segfaults level init. Give them real backing storage
   and address them as `&DAT_00202988 + idx`. */
undefined1 DAT_00202988_backing[16];
undefined1 DAT_002028e0_backing[16];
#define DAT_002028e0 DAT_002028e0_backing[0]
 undefined DAT_00202978_backing[8192];
#define DAT_00202978 DAT_00202978_backing[0]
ushort DAT_00202986;
/* .data 0x85ad0: the HUD hotspot / layout table -- 0x17 records of 0xe
   bytes: [+0..+7] short click-rect x1,y1,x2,y2 (read by hit_test_inventory_widget);
   [+8/+0xa] short draw x,y; [+0xc/+0xd] byte dirty w,h. Ghidra split it
   into lone scalars (g_inv_hotspot_click_x1/d2/d4/d6/d8/da/dd + an 8KB backing for
   dc) and never recovered its .data contents, so every field read 0 and
   the inventory paperdoll body drew at (0,0) instead of the right-hand
   panel. UU.exe's .data doesn't map cleanly to Ghidra's addresses here
   (confirmed: file offset lands on 3D-model-parser strings), so the
   record positions can't be lifted from the binary. Back it with a real
   array and seed record 0 (the body) from the panel rect the redraw path
   clears -- rect_fill_or_save_restore(0xf0,0xb,0x13b,0x76) for its DRAW
   position/size (needed as-is: redraw_inventory_widget draws the paperdoll body
   sprite from these exact fields). Its CLICK rect's bottom edge is
   narrowed to y2=0x50 (80) instead of the full 0x76 (118), so it only
   covers the paperdoll area above the backpack grid -- otherwise, since
   hit_test_inventory_widget returns the FIRST matching record and record 0's rect is
   a superset of every grid cell below it, every backpack-grid click
   would keep resolving to record 0 (widget id 0, a no-op sentinel
   throughout this file) instead of ever reaching records 6-19. Its
   CLICK rect's x-range is ALSO narrowed (to a central 0x108-0x122
   torso strip, down from the full 0xf0-0x13b body width) for the exact
   same reason, now that records 6-11 (below) cover the flanking
   shoulder/hand/finger columns the un-narrowed rect used to swallow --
   record 0 itself is still a no-op if clicked, so shrinking its
   reachable area has no other effect. Records 2..5 (worn torso/legs/
   feet/head armour overlays) stay zero for now -- armour only draws
   when equipped, out of scope for this pass.

   Records 6..11 (the worn weapon-hand/shoulder/finger paperdoll slots)
   are populated too, reconstructed the same not-lifted-from-original-
   data way as records 1/12-19 below: two mirrored columns flanking the
   body sprite (screen-left = the character's own right side, since the
   paperdoll faces the viewer), shoulder above hand above finger/ring,
   sized to roughly match the body art without overlapping the head
   (above) or the backpack grid (below, y<0x50). Widget assignment
   within each column follows handle_object_drop_target's own confirmed
   selector (`9 - lefthand_bit`, i.e. widget 9 is the active weapon hand
   when NOT left-handed): widget 9 = right hand (default-active),
   widget 8 = left hand, and shoulders/fingers grouped into the same
   column as their matching hand (7/11 with 9's column, 6/10 with 8's).
   This positioning is a first-pass reconstruction (no on-screen
   equipped-item sprite existed to measure against, unlike the
   backpack-grid icons) -- revisit if a live playtest shows it's off.

   Records 12..19 (the 8-cell backpack grid, 4 cols x 2 rows) are now
   populated too, needed to make Grab-mode drops and backpack clicks
   actually land on a specific slot instead of always falling through to
   record 0's whole-panel body rect (see handle_inventory_panel_click/hit_test_inventory_widget).
   Like record 0, the real per-cell .data can't be recovered from the
   binary, so these are reconstructed from the rendered panel's own
   on-screen grid (screenshot pixel-measured, panel-local = screen/2,
   matching record 0's own scale), not lifted from original data: an
   even 4x2 grid spanning the same x:0xf0-0x13c / y:0x50-0x76 area
   visible below the paperdoll. Draw x,y is each cell's top-left +1px
   inset; dirty w,h is 0x14x0x14 (20x20), safely covering the real 16x16
   icon sprite (confirmed via UW_DEBUG_INV) with margin -- draw_sprite_
   by_id's w/h args only feed its dirty_rect_union call, gating what
   region gets flushed to the display each frame; the actual blit
   always uses the sprite's own real .GR-header size regardless. A
   live playtest (unlike this project's screenshot-based testing, which
   forces a full-screen flush every capture and so can't catch this)
   showed incomplete redraws with the original tighter 0x11 (17x17).

   Widget ids 12..19 (not 6..13, an earlier arbitrary choice corrected
   here) were chosen to match hard evidence from close_backpack_container (the
   close-container function): it resets `(&g_backpack_widget_to_slot_plus1)[0xb..0x12]`
   (11..18) to identity, and g_backpack_widget_to_slot_plus1's address is exactly one byte
   past g_backpack_widget_to_slot's -- the same split-symbol relationship as
   DAT_00202951/g_equipped_items -- so that write really lands at
   g_backpack_widget_to_slot_backing[12..19], resetting widgets 12-19's slot mapping
   back to 11-18 (widget N -> slot N-1) after a container closes. That
   in turn implies the *normal* (no container open) mapping is also
   N -> N-1, not identity -- see g_backpack_widget_to_slot's own updated comment. */
/* .data 0x85ad0: recovered directly from the shipped binary
   (mem.getBytes, same technique as g_backpack_widget_to_slot/
   g_backpack_slot_to_widget) -- the earlier claim on this table (kept
   in git history) that "UU.exe's .data doesn't map cleanly... file
   offset lands on 3D-model-parser strings" was simply WRONG: this
   exact address dumps 322 bytes of clean, sane, non-degenerate click/
   draw rects for every one of the 23 records, immediately followed by
   g_backpack_slot_to_widget's own real data at 0x85c18 (confirmed
   byte-identical) -- the whole block from 0x85ad0 through 0x85c4f is
   one contiguous run of real inventory-UI tables. All 23 records below
   are now the genuine recovered values, replacing this project's
   earlier from-scratch reconstruction (screenshot-measured grid,
   playtest-guessed paperdoll positions) entirely.

   Record 0 really is a degenerate x1=x2/y1=y2-style sentinel in the
   original binary too (0,200,0,200 -- zero click area) -- the old
   reconstruction's guess to give it a real body-panel rect was wrong;
   hit_test_inventory_widget's own "record 0 = no-op sentinel" behavior
   was right even before this fix, just for the wrong reason.

   Records 1-5 (previously left zero as "still-unimplemented armor
   slots, out of scope") all have real, valid click rects -- reading
   top to bottom by y-range: rec2 (y9-25, topmost) = head; rec6/7
   (y13-30, flanking) = shoulders; rec3 (y26-43) = torso/chest; rec8/9
   (y35-54, flanking) = hands; rec4 (y44-56) = legs; rec10/11 (y53-70,
   flanking) = finger/ring slots; rec20 (y65-82, NEW, see below) = an
   unidentified left-column slot; rec1 (y56-72) and rec5 (y72-81) sit
   between legs and the backpack grid (y82+) -- likely feet/boots and a
   belt or similar, not fully identified yet.

   IMPORTANT: record 1's real rect is NOT the "open container" icon --
   that UI affordance was this project's own addition, invented before
   widget 20's real click rect and g_backpack_widget_to_slot[20]'s real
   data (0x13/19, not 0) were recovered. Widget 20 IS the real
   mechanism (see DAT_00085c4c's own comment) -- the hack has been
   removed entirely now that it's wired up.

   Records 21-22 are ALSO real, non-degenerate rects -- confirmed via
   handle_object_drop_target's own `iVar2==0x15`/`0x16` dispatch
   (scroll_container_grid_up/scroll_container_grid_down) to be the container-grid scroll up/down
   buttons, gated on DAT_0020299c/DAT_002029a0 ("can scroll up/down").
   Their much smaller dirty w/h (8x10, vs every other record's 16x16 or
   20x20) matches real small button art rather than an item slot. */
 unsigned char g_inventory_hotspot_table[0x17 * 0xe + 2] = {
  /* rec 0 (real, degenerate sentinel): click 0,c8,0,c8 ; draw 104,c ; dirty 24,45 */
  0x00,0x00, 0xc8,0x00, 0x00,0x00, 0xc8,0x00,  0x04,0x01, 0x0c,0x00,  0x24,0x45,
  /* rec 1 (real armor-slot rect, LEGS -- confirmed live via
     check_object_fits_in_slot/class2_variant_effect_table_lookup
     dropping id 0x23 "leather leggings" here successfully; the earlier
     "likely feet/boots" guess in this comment was wrong -- corrected
     after verifying with a real item. The "open container" icon that
     used to be hacked in here has been removed entirely now that
     widget 20 is the real mechanism): click 10d,38,11d,48 ; draw
     10c,19 ; dirty 13,32 */
  0x0d,0x01, 0x38,0x00, 0x1d,0x01, 0x48,0x00,  0x0c,0x01, 0x19,0x00,  0x13,0x32,
  /* rec 2 (head -- confirmed live, id 0x2c "a leather cap"): click
     10d,9,11e,19 ; draw b,b ; dirty 14,14 */
  0x0d,0x01, 0x09,0x00, 0x1e,0x01, 0x19,0x00,  0x0b,0x01, 0x0b,0x00,  0x14,0x14,
  /* rec 3 (torso/chest -- confirmed live, id 0x20 "a leather vest"):
     click 107,1a,123,2b ; draw 106,18 ; dirty 21,2c */
  0x07,0x01, 0x1a,0x00, 0x23,0x01, 0x2b,0x00,  0x06,0x01, 0x18,0x00,  0x21,0x2c,
  /* rec 4 (HANDS, not legs -- confirmed live, id 0x26 "leather
     gloves"; the "legs" label was an earlier unconfirmed guess,
     corrected after verifying with a real item): click 107,2c,123,38 ;
     draw 105,2b ; dirty 21,c */
  0x07,0x01, 0x2c,0x00, 0x23,0x01, 0x38,0x00,  0x05,0x01, 0x2b,0x00,  0x21,0x0c,
  /* rec 5 (real armor-slot rect, FEET, not a belt -- confirmed live,
     id 0x29 "leather boots"; the "likely a belt" guess in this
     comment was wrong -- corrected after verifying with a real item):
     click 107,48,123,51 ; draw 10a,43 ; dirty 15,d */
  0x07,0x01, 0x48,0x00, 0x23,0x01, 0x51,0x00,  0x0a,0x01, 0x43,0x00,  0x15,0x0d,

  /* rec 6 (left shoulder): click f4,d,105,1e ; draw f5,e ; dirty 10,10 */
  0xf4,0x00, 0x0d,0x00, 0x05,0x01, 0x1e,0x00,  0xf5,0x00, 0x0e,0x00,  0x10,0x10,
  /* rec 7 (right shoulder): click 125,d,136,1e ; draw 126,e ; dirty 10,10 */
  0x25,0x01, 0x0d,0x00, 0x36,0x01, 0x1e,0x00,  0x26,0x01, 0x0e,0x00,  0x10,0x10,
  /* rec 8 (left hand): click f1,23,102,36 ; draw f2,24 ; dirty 10,10 */
  0xf1,0x00, 0x23,0x00, 0x02,0x01, 0x36,0x00,  0xf2,0x00, 0x24,0x00,  0x10,0x10,
  /* rec 9 (right hand -- the default/active weapon hand per
     handle_object_drop_target's `9 - lefthand_bit` check): click
     127,23,138,36 ; draw 128,24 ; dirty 10,10 */
  0x27,0x01, 0x23,0x00, 0x38,0x01, 0x36,0x00,  0x28,0x01, 0x24,0x00,  0x10,0x10,
  /* rec 10 (left finger/ring slot): click f1,35,10c,40 ; draw ff,34 ; dirty 10,10 */
  0xf1,0x00, 0x35,0x00, 0x0c,0x01, 0x40,0x00,  0xff,0x00, 0x34,0x00,  0x10,0x10,
  /* rec 11 (right finger/ring slot): click 11e,35,138,46 ; draw 11d,34 ; dirty 10,10 */
  0x1e,0x01, 0x35,0x00, 0x38,0x01, 0x46,0x00,  0x1d,0x01, 0x34,0x00,  0x10,0x10,

  /* rec 12 (row1,col1): click f0,52,101,63 ; draw f1,53 ; dirty 10,10 */
  0xf0,0x00, 0x52,0x00, 0x01,0x01, 0x63,0x00,  0xf1,0x00, 0x53,0x00,  0x10,0x10,
  /* rec 13 (row1,col2): click 103,52,114,63 ; draw 104,53 ; dirty 10,10 */
  0x03,0x01, 0x52,0x00, 0x14,0x01, 0x63,0x00,  0x04,0x01, 0x53,0x00,  0x10,0x10,
  /* rec 14 (row1,col3): click 116,52,127,63 ; draw 117,53 ; dirty 10,10 */
  0x16,0x01, 0x52,0x00, 0x27,0x01, 0x63,0x00,  0x17,0x01, 0x53,0x00,  0x10,0x10,
  /* rec 15 (row1,col4): click 129,52,13a,63 ; draw 12a,53 ; dirty 10,10 */
  0x29,0x01, 0x52,0x00, 0x3a,0x01, 0x63,0x00,  0x2a,0x01, 0x53,0x00,  0x10,0x10,
  /* rec 16 (row2,col1): click f0,64,101,75 ; draw f1,65 ; dirty 10,10 */
  0xf0,0x00, 0x64,0x00, 0x01,0x01, 0x75,0x00,  0xf1,0x00, 0x65,0x00,  0x10,0x10,
  /* rec 17 (row2,col2): click 103,64,114,75 ; draw 104,65 ; dirty 10,10 */
  0x03,0x01, 0x64,0x00, 0x14,0x01, 0x75,0x00,  0x04,0x01, 0x65,0x00,  0x10,0x10,
  /* rec 18 (row2,col3): click 116,64,127,75 ; draw 116,65 ; dirty 10,10 */
  0x16,0x01, 0x64,0x00, 0x27,0x01, 0x75,0x00,  0x16,0x01, 0x65,0x00,  0x10,0x10,
  /* rec 19 (row2,col4): click 129,64,13a,75 ; draw 12a,65 ; dirty 10,10 */
  0x29,0x01, 0x64,0x00, 0x3a,0x01, 0x75,0x00,  0x2a,0x01, 0x65,0x00,  0x10,0x10,

  /* rec 20 (real, previously-unknown left-column slot -- see table
     comment above): click f0,41,101,52 ; draw f1,41 ; dirty 10,10 */
  0xf0,0x00, 0x41,0x00, 0x01,0x01, 0x52,0x00,  0xf1,0x00, 0x41,0x00,  0x10,0x10,
  /* rec 21 (real, small right-side button -- see table comment above):
     click 127,47,130,50 ; draw 128,47 ; dirty 8,a */
  0x27,0x01, 0x47,0x00, 0x30,0x01, 0x50,0x00,  0x28,0x01, 0x47,0x00,  0x08,0x0a,
  /* rec 22 (real, small right-side button -- see table comment above):
     click 131,47,13a,50 ; draw 132,47 ; dirty 8,a */
  0x31,0x01, 0x47,0x00, 0x3a,0x01, 0x50,0x00,  0x32,0x01, 0x47,0x00,  0x08,0x0a,
};
#define g_inv_hotspot_click_x1 g_inventory_hotspot_table[0x0]
#define g_inv_hotspot_click_y1 g_inventory_hotspot_table[0x2]
#define g_inv_hotspot_click_x2 g_inventory_hotspot_table[0x4]
#define g_inv_hotspot_click_y2 g_inventory_hotspot_table[0x6]
#define g_inv_hotspot_draw_x (*(unsigned short *)&g_inventory_hotspot_table[0x8])
#define g_inv_hotspot_draw_y (*(unsigned short *)&g_inventory_hotspot_table[0xa])
#define g_inv_hotspot_dirty_w g_inventory_hotspot_table[0xc]
#define g_inv_hotspot_dirty_h g_inventory_hotspot_table[0xd]

/* .data 0x85c18: array-slot-index -> widget-id lookup, the inverse of
   g_backpack_widget_to_slot (see its own comment) -- read as `(&g_backpack_slot_to_widget)[slot]`
   to find which widget/grid-cell to redraw after a slot's contents
   change (redraw_inventory_widget/redraw_inventory_widget_range callers throughout this file).
   Same lone-scalar split-array pattern as g_backpack_widget_to_slot, same
   unrecoverable-real-data story. Backed here with the literal inverse
   of g_backpack_widget_to_slot's N -> N-1 mapping: slots 11..18 (the backpack
   region behind the 8 grid widgets 12..19) map back to widgets 12..19,
   so a drop into slot N correctly redraws grid cell N+1 instead of
   resolving to widget id 0 (a "not a spell" message code, observed
   live: without this, placing an item successfully updated the data
   but the grid stayed visually empty and printed an unrelated
   spell-error message on refresh).

   Slots 5..10 (the worn-hand/shoulder/finger paperdoll slots, widgets
   6..11) map back to widgets 6..11 the same N -> N-1 way -- user QA
   report: "dragging and dropping into a paper doll slot does not show
   the item." Confirmed live (UW_DEBUG_INV + a direct SDLRDOWN/SDLRUP
   drag onto widget 9's own click rect): place_held_item_in_empty_slot
   correctly writes the object into slot 8 and its own
   `redraw_inventory_widget(g_backpack_slot_to_widget[8])` call DOES
   fire, but with this array's slot 5..10 entries still at their prior
   (dead) 0 value, that resolved to widget id 0 -- the deliberate
   torso no-op sentinel (see g_inventory_hotspot_table's own comment)
   -- so nothing ever got redrawn even though the placement itself
   succeeded (confirmed via the demo harness's own post-drop state
   dump: holding=0, occupied_slots=1, yet the paperdoll circles stayed
   empty in a SCREENSHOT). g_backpack_widget_to_slot's own comment
   already documents this exact N -> N-1 rule being extended to
   widgets 6..11/slots 5..10 when that feature was added -- this
   reverse array was simply never updated to match at the time. Other
   indices stay 0, matching prior (dead) behavior. Note
   open_backpack_container treats any mapped widget id >= 0xb (11) as
   "handled by a wider grid redraw elsewhere, nothing to do here" --
   with these now-correct values (12-19) that guard always takes the
   "elsewhere" branch for backpack-grid slots, which is why
   entering/leaving a container needs its own explicit whole-grid
   redraw call (see open_backpack_container/close_backpack_container's own
   comments) rather than relying on this single-widget path. The new
   6..11 entries are below that >= 0xb threshold, so they take the
   single-widget redraw path as intended, not the "elsewhere" one. */
/* CORRECTED with a full re-dump of this table's real .data (0x85c18,
   28 bytes, one mem.getBytes call covering the whole 0x1c-entry range
   at once): the previous version of this array below -- {2,3,4,1,5,
   6,7,8,9,10,11, 12,13,14,15,16,17,18,19, 0,0,0,0, 12,13,14,15,16,17,
   18,19} -- had TWO real bugs, both caught re-verifying this table at
   the user's request ("also see if we can recover the table used for
   the widget to slot mapping the same way" after the hotspot-table
   recovery above):

   1) It was simply WRONG at indices 19-22: guessed as 0,0,0,0 ("no
      mapping"), but the real data is 20,12,13,14 -- slot 19 maps to
      widget 20 (not "nothing"), and slots 20-22 continue the same
      "N -> widgets 12-19" nested-container-grid pattern as slots
      23-27, not a gap. (Widget 20 is real -- see
      g_inventory_hotspot_table's own comment on its 3 newly-recovered
      records; this is its first identified purpose: it displays
      backpack slot 19's own content, a 9th "extra" slot alongside the
      main 8-cell grid, not one of the paperdoll/armor positions.)

   2) The array literal itself had 31 values for a 28-element (0x1c)
      array -- `clang -fsyntax-only` reports `warning: excess elements
      in array initializer` on it, but build.sh's own build step pipes
      through `grep -iE "error:"` (to keep routine output quiet), which
      silently swallows every non-"error:" warning including this one,
      so it printed "built" and looked clean. Clang drops the excess
      elements off the END of the list, not the intended slots 28-30
      (which don't exist in a 28-entry array anyway) -- it silently
      corrupted indices 25-27 instead, which is what a straight
      concatenation without recomputing the real bound produces. Real,
      compiled-in values before this fix: index 25=17->actually 14,
      26=18->actually 15, 27=19->actually 16 (each 3 widgets low).
      Lesson: build.sh's error-only filter hides genuine compiler
      warnings like this one -- worth an occasional unfiltered
      `-fsyntax-only` pass when touching array literals.

   History this replaces: slots 20-27 (an OPEN container's own 8
   content slots, populated by open_backpack_container's own N -> N+8
   widget remap at uw.c ~33712, "Remap widgets 12-19 -> slots 20-27")
   were entirely missing before an earlier session extended this array
   from 0x17 (23) to 0x1c (28) entries to fix a real crash ("placing a
   container in another container and trying to open the nested one" --
   indexing past this array's old end fed a garbage widget id into
   redraw_inventory_widget). That extension is correct in shape (28
   entries, N -> N-8 slots 20-27 -> widgets 12-19); the bug was in its
   exact values, fixed here with the genuine recovered data instead of
   a guess. */
 unsigned char g_backpack_slot_to_widget_backing[0x1c] = {
  2,3,4,1,5, 6,7,8,9,10,11, 12,13,14,15,16,17,18,19,20,
  12,13,14,15,16,17,18,19,
};
#define g_backpack_slot_to_widget g_backpack_slot_to_widget_backing[0]
undefined2 DAT_00202980;
short g_player_carry_weight;
// was DAT_002028c0
undefined1 *g_save_equip_table_ptr;
// was DAT_002028c4
undefined1 *g_save_record_base_ptr;
// was DAT_002028cc
 undefined2 g_save_record_count_backing[8192];
#define g_save_record_count g_save_record_count_backing[0]
// was DAT_002028c8
char *g_save_record_buffer;
/* Was missing its leading backslash -- both call sites append this
   straight onto a directory path built with no trailing separator (e.g.
   load_player_save_record builds "<root>\SAVE0" then appends this), so the file name
   ran into the directory name with nothing between them
   ("...\SAVE0player.dat"). A leading "\\" here is harmless even for a
   caller whose own prefix already ends in one (resolve_path collapses
   repeated separators). */
char s_player_dat_00085a74[] = "\\player.dat";
int DAT_002028d0;
char s_Not_a_spell_00085a80[] = "Not_a_spell";
byte DAT_002028d4;
/* dispatch_tile_special_action/dispatch_special_action's own comment
   confirms this is really a 4-byte-stride per-tile-type table (up to
   0x35/53 entries): DAT_00087530 (byte 0, >>3 = action type),
   DAT_00087531 (bytes 1-2, a short field read elsewhere in this file),
   DAT_00087533 (byte 3, action sub-parameter). All three were lone
   scalars despite being indexed `(&DAT_X)[i*4]`/`*(short*)(&DAT_X+i*4)`
   for i up to 0x33/0x2f -- widened each to its own real backing array
   (struct-recovery-plan.md candidate: not merged into one named struct
   here, just correctly sized, since only 3 of the 4 bytes per record
   have a confirmed reader). */
undefined1 DAT_00087531_backing[210];
#define DAT_00087531 DAT_00087531_backing[0]
char DAT_0023c3e0;
undefined DAT_00087530_backing[210];
#define DAT_00087530 DAT_00087530_backing[0]
undefined DAT_00087533_backing[210];
#define DAT_00087533 DAT_00087533_backing[0]
undefined4 DAT_002046b4;
undefined DAT_00085a90;
char s_were_00085a98[] = "were";
undefined1 DAT_00085aa0_backing[32768];
char s_damaged__00085aa8[] = "damaged.";
char s_destroyed__00085ab4[] = "destroyed.";
// was DAT_0023bcf4, offset +0x4c of the "large fixed-offset record"
// based at DAT_0023bca8 (see that array's own declaration comment a few
// hundred lines up -- a "device/config-ish struct, not yet fully
// identified" that a prior session already had to widen to a real 8192-
// byte backing array after catching an unrelated overflow into it).
// g_player_carry_weight (was DAT_0023bcf2, "+0x4a", the sibling field 2
// bytes before this one) is that struct's actively-maintained "current
// carried weight" running total.
//
// Two things worth ruling out before assuming a hardcoded default is
// the right call, both checked directly rather than assumed:
// - NOT part of the player.dat save/load blob: that save path (uw.c
//   ~32660) serializes the player's OBJECT graph (walking
//   resolve_object_link), not this stats struct -- no overlap, so this
//   isn't a save/load wiring gap.
// - NOT a split-symbol/should-be-one-array bug either, despite living
//   inside that same not-fully-identified struct: a whole-binary
//   instruction-pattern scan (every "str/strh/strb ..., [reg, #0x4c]"
//   in the binary, not just literal-address xrefs, specifically to also
//   catch a write reached via the DAT_00086df8 struct-pointer indirection
//   the way init_new_character_record's already-documented overflow into this same
//   struct was) found zero halfword writes to +0x4c anywhere, by any
//   addressing pattern. Every real writer of the sibling +0x4a field
//   also resolves through a literal constant address, not the pointer
//   indirection, matching how this file already represents both fields
//   as flat globals -- so unifying them into an explicit array wouldn't
//   change reachability here the way it has for other DAT_0023bca8-
//   adjacent fields elsewhere in this file.
// - Confirmed via a real Ghidra reference search against UU.exe (not
//   just this decompile): every access to +0x4c anywhere in the shipped
//   binary is a READ (check_object_carry_weight's "can I pick this up" check, and
//   update_carry_weight_display, apparently a HUD burden/encumbrance display) -- there
//   is no write to it ANYWHERE, so it stays at its zero BSS default for
//   the life of the process. Net effect: every pickup attempt failed
//   with "too heavy" regardless of the item (confirmed live: a 30-unit
//   sack, well within any plausible real capacity, was rejected).
//
// Whatever real formula (almost certainly Strength-derived) originally
// populated this is not recoverable from this binary -- it's a genuinely
// dead computation in the shipped game, not a decompile gap. Seeding a
// generous, clearly-provisional default here so carrying items functions
// at all rather than being permanently broken -- revisit if the real
// per-character formula (or its expected value range) ever turns up.
ushort g_player_max_carry_weight = 200;
char s_bodies_00085c58[] = "bodies";
int DAT_002029a4;
short DAT_00085b64;
undefined2 DAT_00085b72;
undefined2 DAT_00202998;
undefined2 DAT_00085c50;
char s_armor_f_00085c60[] = "armor_f";
undefined1 DAT_00085b77;
byte DAT_00085b76;
short DAT_00085b74;
undefined4 DAT_00202914;
undefined1 DAT_00085b69;
byte DAT_00085b68;
short DAT_00085b66;
undefined4 DAT_00202910;
ushort DAT_00202962;
ushort DAT_00202964;
char s_Move_how_many__00085c68[] = "Move_how_many?";
/* g_light_source_slots: light-source-eligible equip slots {5,6,7,8} (see
   refresh_player_equipment_effects and FUN_0005404c's light-scan loops, and use_light_source's
   own comparison against find_or_assign_object_widget's result). Was a
   bare 1-byte scalar -- every existing `(&g_light_source_slots)[1..3]` read past
   the single declared byte into whatever the linker placed next, instead
   of the real dumped table. Dumped directly from the real binary at
   0x85ac8: `5 6 7 8 0 0 0 0 0 0 0xc8 0 0 0 0xc8 0`. */
 unsigned char DAT_00085ac8_backing[16] =
    {5,6,7,8,0,0,0,0,0,0,0xc8,0,0,0,0xc8,0};
#define g_light_source_slots DAT_00085ac8_backing[0]
char s_is_too_full__00085c78[] = "is_too_full.";
 undefined1 DAT_00085c88_backing[32768];
#define DAT_00085c88 DAT_00085c88_backing[0]
static undefined1 DAT_002029f8_backing[256];
#define g_carry_weight_limit_table DAT_002029f8_backing[0]
undefined DAT_002029f9;
/* DAT_00202938: widget 20's own saved-background grtile handle (the
   "open container indicator" -- see g_inventory_hotspot_table's own
   comment and DAT_00085c4c below), same role as (&DAT_002028a0)[i] for
   widgets 12-19 -- allocated once in open_backpack_container, see its
   own comment there. Runtime scratch state, not a .data resource, so
   it stays its own plain global rather than an alias. */
undefined4 DAT_00202938;
/* Another split-symbol case (same class as DAT_00085668 and friends,
   see their own comments): this is g_backpack_widget_to_slot's own
   real byte 20, not a separate global -- Ghidra just never connected
   the two. redraw_inventory_widget_range's widget-20 special case
   (see its own comment) reads this as the g_equipped_items slot to draw
   for the "open container indicator" -- with real data now restored
   to g_backpack_widget_to_slot_backing[20] (19, the same slot
   g_backpack_slot_to_widget's own recovery independently confirmed),
   this alias makes that special case see the real value instead of an
   always-zero dead scalar. */
#define DAT_00085c4c g_backpack_widget_to_slot_backing[20]
/* DAT_00085bf0/2/3/4/5: also split-symbol aliases, this time into
   g_inventory_hotspot_table's own real record 20 (byte offset 280,
   14 bytes/record -- see that table's own comment). redraw_inventory_
   widget_range's widget-20 branch reads these directly instead of
   going through the usual g_inv_hotspot_draw_x/y/dirty_w/dirty_h
   macros (Ghidra recovered this one spot as individual byte accesses,
   not the macro'd struct-field pattern used everywhere else) -- same
   real draw position/size (241,65, 16x16) as those macros would give
   for record 20, now that the table itself holds real recovered data
   instead of an all-zero placeholder. `_DAT_00085bf0` (leading
   underscore -- see this file's own "overlapping symbol" convention)
   is the 2-byte draw_x; the bare 1-byte DAT_00085bf0 Ghidra also
   created at the same address is never actually read anywhere. */
#define _DAT_00085bf0 (*(unsigned short *)&g_inventory_hotspot_table[288])
#define DAT_00085bf2 g_inventory_hotspot_table[290]
#define DAT_00085bf3 g_inventory_hotspot_table[291]
#define DAT_00085bf4 g_inventory_hotspot_table[292]
#define DAT_00085bf5 g_inventory_hotspot_table[293]
short DAT_0023be5c;
short DAT_0023be80;
char s_cursed_00085ca0[] = "cursed";
char s_magical_00085ca8[] = "magical";
char s_full_charge_00085cb8[] = "full_charge";
undefined DAT_00085cc8;
char s_with_00085cd0[] = "with";
undefined DAT_00085cd8_backing[8192];
undefined4 DAT_0024cfcc;
undefined1 DAT_00085ccc;
undefined1 DAT_00085ccd;
undefined1 DAT_00085cce;
undefined DAT_00085cb4_backing[8192];
undefined DAT_00085ce0_backing[8192];
#define DAT_00085ce0 DAT_00085ce0_backing[0]
char s_You_read_the_00085ce8[] = "You_read_the";
char s__DATA_grave_dat_00085cf8[] = "\\DATA\\grave.dat";
char s_an_adventurer__00085d08[] = "an_adventurer.";
/* Was "named" with no surrounding spaces -- build_creature_look_text (creature look
   text) appends it directly between the description and the proper name
   with no separator of its own, so a named creature's look text ran
   the words together: "You see an mellow outcastnamedBragit" instead of
   "You see a mellow outcast named Bragit". */
char s_named_00085d18[] = " named ";
/* Per-mode "sticky redraw bits" mask read by dispatch_sticky_mode_handlers right after it
   finishes dispatching DAT_00201c84's currently-set bits through
   DAT_00085668: `DAT_00201c84 = DAT_00085728[mode] | DAT_00201c84;` re-arms
   whichever bits this mode always wants re-triggered next idle tick, which
   is how a mode's per-frame handlers (as opposed to one-shot event
   handlers) keep firing forever instead of running once and going quiet.
   Same "link-time-initialized data, nothing in this decompile ever writes
   it" situation as DAT_00085668 (see its own comment) -- left zero-filled,
   NO mode's dispatch bits were ever re-armed after the first pass, so
   every DAT_00085668 handler (this file's HUD-panel/button-state/sound-
   timer updates, mode 0's bits 11-13) ran exactly once at mode-entry and
   then silently stopped, no matter how many frames/inputs followed.
   Recovered the same way: read UU.exe's real .data bytes at 0x85728
   directly via Ghidra (mode 0 = 0x3800 = bits 11/12/13 =
   movement_pacing_handler/sync_player_stats_to_hud/hud_panel_redraw_dispatch; mode 1 = 0x1000 = bit 12 =
   exit_automap_screen; mode 2 = 0x0000, nothing sticky). Only 3 ushorts (one per
   mode, matching DAT_00085668_real_table's 3 modes) are real data -- the
   bytes immediately after are the next struct over (a `\DATA\lev.ark`
   string literal), so this backing array is oversized like its siblings
   only to satisfy the >0-bytes-past-any-real-index habit the rest of this
   file uses for recovered fixed-size tables; only index 0-2 are ever
   read (mode is always 0-2, see DAT_00085668's comment). */
static const unsigned short DAT_00085728_real_table[3] = { 0x3800, 0x1000, 0x0000 };
#define DAT_00085728 (*(undefined1 *)DAT_00085728_real_table)
undefined4 DAT_002029d0;
char *DAT_002046a4;
char *DAT_002046a8;
char * DAT_002046bc;
char *DAT_0020469c;
/* Recovered from UU.exe .data: the renderer's sine (0x85d48) and cosine
   (0x85f50) tables, 256 int16 entries each, amplitude 32767 --
   sine[i] = round(32767 * sin(i*PI/128)); cosine[i] = sine[(i+64)&255].
   Both were silently-zero 64KB Ghidra backing arrays, so angle_to_screen_delta
   (angle -> screen delta) returned {0,0} for every angle. That zeroed
   the entry-0 direction vector seed_visibility_queue seeds the visibility
   flood-fill with, so advance_visibility_ray did no expansion,
   run_visibility_flood marked no tile visible, and the 3D tile list
   came out empty (black viewport). It also broke every other bit of
   angle math in the projection code. Four trailing pad shorts each
   (angle_to_screen_delta interpolates to table[idx+1], so idx can reach 256).
   DAT_00085d4c / DAT_00085f54 are &table + 2 == &table[1], the "next" sample:
   the angle's high byte is the coarse index 0..255 (single-step, period 256)
   and the low byte the 0..255 lerp fraction, so the next sample is +1 entry
   (+2 bytes). Was &table + 4 (== &table[2]) -- an off-by-one-entry that
   skipped every other sample and gave the wrong direction for any heading
   whose coarse index was odd, so a turned player kept walking the old way. */
const short DAT_00085d48_sine[260] = {
  0, 804, 1608, 2411, 3212, 4011, 4808, 5602, 6393, 7180, 7962, 8740,
  9512, 10279, 11039, 11793, 12540, 13279, 14010, 14733, 15447, 16151, 16846, 17531,
  18205, 18868, 19520, 20160, 20788, 21403, 22006, 22595, 23170, 23732, 24279, 24812,
  25330, 25833, 26320, 26791, 27246, 27684, 28106, 28511, 28899, 29269, 29622, 29957,
  30274, 30572, 30853, 31114, 31357, 31581, 31786, 31972, 32138, 32286, 32413, 32522,
  32610, 32679, 32729, 32758, 32767, 32758, 32729, 32679, 32610, 32522, 32413, 32286,
  32138, 31972, 31786, 31581, 31357, 31114, 30853, 30572, 30274, 29957, 29622, 29269,
  28899, 28511, 28106, 27684, 27246, 26791, 26320, 25833, 25330, 24812, 24279, 23732,
  23170, 22595, 22006, 21403, 20788, 20160, 19520, 18868, 18205, 17531, 16846, 16151,
  15447, 14733, 14010, 13279, 12540, 11793, 11039, 10279, 9512, 8740, 7962, 7180,
  6393, 5602, 4808, 4011, 3212, 2411, 1608, 804, 0, -804, -1608, -2411,
  -3212, -4011, -4808, -5602, -6393, -7180, -7962, -8740, -9512, -10279, -11039, -11793,
  -12540, -13279, -14010, -14733, -15447, -16151, -16846, -17531, -18205, -18868, -19520, -20160,
  -20788, -21403, -22006, -22595, -23170, -23732, -24279, -24812, -25330, -25833, -26320, -26791,
  -27246, -27684, -28106, -28511, -28899, -29269, -29622, -29957, -30274, -30572, -30853, -31114,
  -31357, -31581, -31786, -31972, -32138, -32286, -32413, -32522, -32610, -32679, -32729, -32758,
  -32767, -32758, -32729, -32679, -32610, -32522, -32413, -32286, -32138, -31972, -31786, -31581,
  -31357, -31114, -30853, -30572, -30274, -29957, -29622, -29269, -28899, -28511, -28106, -27684,
  -27246, -26791, -26320, -25833, -25330, -24812, -24279, -23732, -23170, -22595, -22006, -21403,
  -20788, -20160, -19520, -18868, -18205, -17531, -16846, -16151, -15447, -14733, -14010, -13279,
  -12540, -11793, -11039, -10279, -9512, -8740, -7962, -7180, -6393, -5602, -4808, -4011,
  -3212, -2411, -1608, -804, 0, 0, 0, 0,
};
const short DAT_00085f50_cosine[260] = {
  32767, 32758, 32729, 32679, 32610, 32522, 32413, 32286, 32138, 31972, 31786, 31581,
  31357, 31114, 30853, 30572, 30274, 29957, 29622, 29269, 28899, 28511, 28106, 27684,
  27246, 26791, 26320, 25833, 25330, 24812, 24279, 23732, 23170, 22595, 22006, 21403,
  20788, 20160, 19520, 18868, 18205, 17531, 16846, 16151, 15447, 14733, 14010, 13279,
  12540, 11793, 11039, 10279, 9512, 8740, 7962, 7180, 6393, 5602, 4808, 4011,
  3212, 2411, 1608, 804, 0, -804, -1608, -2411, -3212, -4011, -4808, -5602,
  -6393, -7180, -7962, -8740, -9512, -10279, -11039, -11793, -12540, -13279, -14010, -14733,
  -15447, -16151, -16846, -17531, -18205, -18868, -19520, -20160, -20788, -21403, -22006, -22595,
  -23170, -23732, -24279, -24812, -25330, -25833, -26320, -26791, -27246, -27684, -28106, -28511,
  -28899, -29269, -29622, -29957, -30274, -30572, -30853, -31114, -31357, -31581, -31786, -31972,
  -32138, -32286, -32413, -32522, -32610, -32679, -32729, -32758, -32767, -32758, -32729, -32679,
  -32610, -32522, -32413, -32286, -32138, -31972, -31786, -31581, -31357, -31114, -30853, -30572,
  -30274, -29957, -29622, -29269, -28899, -28511, -28106, -27684, -27246, -26791, -26320, -25833,
  -25330, -24812, -24279, -23732, -23170, -22595, -22006, -21403, -20788, -20160, -19520, -18868,
  -18205, -17531, -16846, -16151, -15447, -14733, -14010, -13279, -12540, -11793, -11039, -10279,
  -9512, -8740, -7962, -7180, -6393, -5602, -4808, -4011, -3212, -2411, -1608, -804,
  0, 804, 1608, 2411, 3212, 4011, 4808, 5602, 6393, 7180, 7962, 8740,
  9512, 10279, 11039, 11793, 12540, 13279, 14010, 14733, 15447, 16151, 16846, 17531,
  18205, 18868, 19520, 20160, 20788, 21403, 22006, 22595, 23170, 23732, 24279, 24812,
  25330, 25833, 26320, 26791, 27246, 27684, 28106, 28511, 28899, 29269, 29622, 29957,
  30274, 30572, 30853, 31114, 31357, 31581, 31786, 31972, 32138, 32286, 32413, 32522,
  32610, 32679, 32729, 32758, 32767, 0, 0, 0,
};
/* Were bare 1-byte scalars, but lookup_arctan_primary_range/
   lookup_arctan_reciprocal_range index them as `*(ushort *)(&DAT_00086260
   + iVar1)` with iVar1 up to (0xff * 4) == 0x3fc -- the same
   scalar-declared-but-accessed-as-array bug class fixed many times
   this session (e.g. the glyph-width-table cluster). Likely a second
   lookup table analogous to the sine/cosine ones just above (same
   "DAT_X / DAT_X+4 is the next sample" shape), but unlike those this
   data isn't flagged as recovered from UU.exe anywhere in this
   decompile -- widened to real, safely-sized backing storage (zero-
   initialized, not recovered) purely to make the access safe; the
   real table contents, if this lookup is currently silently broken
   the same way the sine/cosine tables were before their own fix, are
   not recovered here. Macro defines for all of these (and the
   sine/cosine tables above) now live in uw.h, since the functions that
   read them moved into src/math.c. */
undefined1 DAT_00086260_backing[1024];
undefined1 DAT_00086264_backing[1024];
static undefined1 DAT_002029d8_backing[256];
#define g_light_radius_table DAT_002029d8_backing[0]
// g_food_effect_table was DAT_00202a28: a per-food-type (indexed by the
// object id's low nibble) effect/quality byte table, loaded at runtime
// (read_file_handle) and read by use_food_item to decide a food item's
// flavor text and whether it's harmful.
 undefined1 DAT_00202a28_backing[256];
#define g_food_effect_table DAT_00202a28_backing[0]
short DAT_00202a40;
ushort DAT_00202a48;
short DAT_00202a38;
ushort DAT_00202a4c;
char *DAT_00202a44;
undefined2 DAT_00202a50;
undefined2 DAT_00202a54;
int DAT_00086368;
unsigned short u_WAVE_0008686c[] = u"WAVE";
undefined *PTR_Ordinal_2033_00084118;
undefined *PTR_Ordinal_2016_0008411c;
undefined *PTR_Ordinal_2048_00084120;
undefined *PTR_Ordinal_2053_00084124;
undefined *PTR_Ordinal_2046_00084128;
/* Was a bare scalar, but process_mod_tracker_row indexes it as
   `(&DAT_00086370)[iVar14]` with iVar14 clamped to [0,0x127] -- the
   same scalar-declared-but-accessed-as-array bug class fixed many
   times this session (e.g. DAT_00086260/DAT_00086264 above). Likely a
   period/frequency lookup table for the MOD-tracker engine, but this
   data isn't flagged as recovered from UU.exe anywhere in this
   decompile -- widened to real, safely-sized backing storage (zero-
   initialized, not recovered) purely to make the access safe. */
undefined4 DAT_00086370_backing[296];
undefined DAT_00086810;
static undefined1 DAT_00202a58_backing[65536];
#define DAT_00202a58 DAT_00202a58_backing[0]
/* collision_build_height_field's collision height-field: five 5-byte corner records at
   0x202bf8, laid out `(&DAT_00202bf8)[corner*5 + k]`. collision_build_height_field writes the
   fields by name (DAT_00202bfd, DAT_00202c0c, ...) while collision_sample_floor_height reads
   them by index off DAT_00202bf8. Only DAT_00202bf8 had a backing array;
   the rest were lone Ghidra scalars, so the named writes and indexed reads
   hit different memory and every corner sampled as height 8 -- solid-rock
   tiles reported the same floor height as open floor, so collision never
   stopped the player at a wall. Alias every field into the one backing
   buffer. Per-corner layout: [0]=shape/index, [1..2]=diag corner offsets,
   [3..4]=a uint16 flag word (read wide as _DAT_00202bfb / c00 / c05). */
 undefined1 DAT_00202bf8_backing[32768];
#define DAT_00202bf8 DAT_00202bf8_backing[0]
#define DAT_00202bf9  (DAT_00202bf8_backing[0x01])
#define DAT_00202bfa  (DAT_00202bf8_backing[0x02])
#define DAT_00202bfb  (DAT_00202bf8_backing[0x03])
#define DAT_00202bfc  (DAT_00202bf8_backing[0x04])
#define DAT_00202bfd  (DAT_00202bf8_backing[0x05])
#define DAT_00202bfe  (DAT_00202bf8_backing[0x06])
#define DAT_00202bff  (DAT_00202bf8_backing[0x07])
#define DAT_00202c00  (DAT_00202bf8_backing[0x08])
#define DAT_00202c02  (DAT_00202bf8_backing[0x0a])
#define DAT_00202c03  (DAT_00202bf8_backing[0x0b])
#define DAT_00202c04  (DAT_00202bf8_backing[0x0c])
#define DAT_00202c05  (DAT_00202bf8_backing[0x0d])
#define DAT_00202c07  (DAT_00202bf8_backing[0x0f])
#define DAT_00202c08  (DAT_00202bf8_backing[0x10])
#define DAT_00202c09  (DAT_00202bf8_backing[0x11])
#define DAT_00202c0a  (*(unsigned short *)(DAT_00202bf8_backing + 0x12))
#define DAT_00202c0c  (DAT_00202bf8_backing[0x14])
#define DAT_00202c0d  (DAT_00202bf8_backing[0x15])
#define DAT_00202c0e  (DAT_00202bf8_backing[0x16])
#define DAT_00202c14  (*(unsigned int *)(DAT_00202bf8_backing + 0x1c))
 undefined1 DAT_00202c70_backing[65536];
#define DAT_00202c70 DAT_00202c70_backing[0]
/* At offset 8 of the DAT_00202c70 corner-height block -- collision_build_height_field's
   `Ordinal_1047(&DAT_00202c70, 0x11, 0x12)` (memset) seeds it (and every
   corner) with the 0x1111 "recompute me" sentinel. As a separate scalar the
   memset never touched it, so it stayed 0, the `DAT_00202c78 == 0x1111`
   guard never fired, and the tile's packed height was never computed -- so
   every corner sampled as height 8 and collision couldn't tell solid rock
   from open floor. */
#define DAT_00202c78 (*(unsigned short *)(DAT_00202c70_backing + 8))
undefined DAT_00202c34;
ushort *_DAT_00202c34;
/* Wall-slide corner-classification tables, used by resolve_wall_slide_corner (called
   from sweep_slide_along_wall when a wall hit has a specific blocked-
   corner shape) to pick which of the 8 candidate headings in
   DAT_000869a8 to deflect toward. Both were declared as single-byte
   scalars -- an "orphaned data table" class bug, same as DAT_000869a8
   just fixed above -- so any index past 0 read undefined, unrelated
   adjacent globals in this port's own memory layout (not the real
   binary's), producing effectively-random results for any corner
   configuration except the very first. This is the deeper reason wall
   sliding sometimes turned the player back INTO the wall: even once
   DAT_000869a8 held real headings, resolve_wall_slide_corner was often picking the
   WRONG index into it.

   Real data recovered via Ghidra headless dump (matching these globals'
   own name-encoded addresses, 0x86884 and 0x8688c): DAT_00086884 is a
   real 4-entry SIGNED array {1,-1,-1,1} (per-corner +/-1 deltas, read as
   `(&DAT_00086884)[iVar3]` for iVar3 0-3 in resolve_wall_slide_corner's loop).
   DAT_0008688c sits 4 bytes into a real lookup table that starts at
   0x86888 (confirmed: the function's own literal pool for the "r8" table
   base is 0x86888, and 0x86888+4 = 0x8688c exactly) -- both of
   resolve_wall_slide_corner's own lookups already index relative to DAT_0008688c
   correctly (`(&DAT_0008688c)[iVar6*3+iVar7]` and
   `(&DAT_0008688c)[iVar9*-3-iVar7]`, the latter reaching back to offset
   -4, i.e. the table's real start at 0x86888); only the DECLARATION was
   wrong, not the indexing arithmetic. Backed with the real bytes from
   0x86884 through 0x868893 (32 bytes from the table's real start,
   comfortably covering every offset either lookup can produce); bytes
   past offset +7 from DAT_0008688c decode as the ASCII string
   "\DATA\comobj.dat" -- real, unrelated adjacent data in the original
   binary, kept verbatim rather than guessed at, since matching the
   original memory layout exactly is safer than inventing a boundary. */
signed char DAT_00086884_backing[4] = {1, -1, -1, 1};
#define DAT_00086884 DAT_00086884_backing[0]
static unsigned char DAT_0008688c_backing[32] = {
  5, 4, 3, 6, 9, 2, 7, 0, 1, 0, 0, 0, 92, 68, 65, 84,
  65, 92, 99, 111, 109, 111, 98, 106, 46, 100, 97, 116, 0, 0, 0, 0
};
#define DAT_0008688c DAT_0008688c_backing[4]
char DAT_00202c20;
char DAT_00202c28;
char DAT_00202c24;
char DAT_00202c2c;
char DAT_00202c18;
char DAT_00202c1c;
/* Same lone-scalar-used-as-a-stride-6-array bug as DAT_00202c38 above,
   for the remaining fields of the same collision-candidate record. */
 undefined1 DAT_00202c3b_backing[8192];
#define DAT_00202c3b DAT_00202c3b_backing[0]
 undefined1 DAT_00202c3d_backing[8192];
#define DAT_00202c3d DAT_00202c3d_backing[0]
static undefined1 DAT_00202c3e_backing[8192];
#define DAT_00202c3e DAT_00202c3e_backing[0]
static undefined1 DAT_00202c3f_backing[8192];
#define DAT_00202c3f DAT_00202c3f_backing[0]
char s__DATA_comobj_dat_00086894[] = "\\DATA\\comobj.dat";
char s__DATA_objects_dat_000868a8[] = "\\DATA\\objects.dat";
undefined4 LAB_0007913c()

{
  /* Confirmed via a direct Ghidra headless lookup by address
     (0x7913c): `undefined4 FUN_0007913c(void) { return 0; }` -- this
     genuinely IS a no-op in the real binary too, not a "Ghidra gave
     up" placeholder. Kept as-is; not a bug. */
  return 0;
}
/* class0_variant_effect_table_lookup: dispatch target index 0 of get_scanned_object_class_
   effect_ptr's 8-entry table -- reached for any object whose class is
   0 (id&0x1c0)>>6==0, which check_object_fits_in_slot treats as the
   ARMOR class (its own uVar1==0 checks gate the body-slot validation
   at uw.c ~36952). Was a no-op `return 0;` stub like
   class2_variant_effect_table_lookup used to be, and for the exact
   same reason: check_object_fits_in_slot dereferences this function's
   return value at `+3` to read the equipped piece's slot-type byte,
   so a hardcoded 0 crashed on address 3 the instant a real armor
   piece was checked. Real disassembly (0x41e84-0x41f2c) shows the
   same id-split-then-table-lookup shape as
   class2_variant_effect_table_lookup, just with 3 possible tables
   instead of one: family=(id&0x30)>>4 selects DAT_00202800 (stride 8,
   family 0), DAT_002027d0 (stride 3, family 1), or DAT_00202750
   (stride 4, families 2 and 3 -- family 3 adds 16 to the nibble index
   into the same table). All three are already real, non-orphaned
   globals loaded from objects.dat by the already-correct load_armor_variant_tables
   (called via FUN_00052674's boot-time dispatch table, same loader
   that reaches load_light_food_effect_tables) and already read
   elsewhere in this file (resolve_equipped_weapon_attack, uw.c ~17840). */
void *class0_variant_effect_table_lookup()

{
  ushort uVar1;
  int family;
  int nibble;

  uVar1 = *(ushort *)g_scratch_object_ptr;
  family = (uVar1 & 0x30) >> 4;
  nibble = uVar1 & 0xf;
  if (family == 0) {
    return &DAT_00202800 + nibble * 8;
  }
  if (family == 1) {
    return &DAT_002027d0 + nibble * 3;
  }
  if (family == 3) {
    nibble = nibble + 16;
  }
  return &DAT_00202750 + nibble * 4;
}
/* class2_variant_effect_table_lookup: was `undefined DAT_0004a070;` -- a plain data byte, not a
   function. get_scanned_object_class_effect_ptr takes its address and CALLS it (`local_24[2] =
   &DAT_0004a070; (*(code*)local_24[idx])();`) for any object whose class
   is 2 (id&0x1c0)>>6==2 -- exactly the 0x90-class light sources
   refresh_player_equipment_effects's and FUN_0005404c's light-scan loops filter for. Taking
   the address of a data byte and jumping into it crashed the instant a
   real torch was found by the (now-fixed) scan loop. Real disassembly
   (0x4a070-0x4a108) shows this reads the scanned object's id (via
   g_scratch_object_ptr, the same object pointer get_scanned_object_class_effect_ptr's other handlers
   already read), splits it into family=(id&0x30)>>4 and nibble=(id&0xf),
   then returns a pointer into one of three already-recovered runtime
   tables (g_carry_weight_limit_table/g_light_radius_table/g_food_effect_table, populated from
   objects.dat by load_light_food_effect_tables via FUN_00052674's boot-time loader --
   confirmed reachable, not orphaned) indexed by nibble at that family's
   stride (3/2/1 bytes). Family 2 (torches' actual family, id=0x9X ->
   (0x9X&0x30)>>4==1 -- so torches hit the *1*-stride table, not this
   branch, but it's included for the other 0x90-class objects that do
   route here) returns 0, matching the sibling LAB_ stub functions'
   "Ghidra couldn't resolve, no-op returns 0" convention for entries
   this table genuinely leaves unused. */
/* Return type was `undefined4` -- same 64-bit-pointer-truncation bug
   already flagged on get_scanned_object_class_effect_ptr itself: this handler hands back a
   pointer into a runtime table, and undefined4 drops its upper 32 bits
   on a 64-bit build, producing a wild address in the caller. */
void *class2_variant_effect_table_lookup()

{
  ushort uVar1;
  int family;
  int nibble;

  uVar1 = *(ushort *)g_scratch_object_ptr;
  family = (uVar1 & 0x30) >> 4;
  nibble = uVar1 & 0xf;
  if (family == 0) {
    return &g_carry_weight_limit_table + nibble * 3;
  }
  if (family == 1) {
    return &g_light_radius_table + nibble * 2;
  }
  if (family == 2) {
    return 0;
  }
  return &g_food_effect_table + nibble;
}
undefined4 LAB_0006b3d4()

{
  /* Confirmed via a direct Ghidra headless lookup by address
     (0x6b3d4): `undefined4 FUN_0006b3d4(void) { return 0; }` -- this
     genuinely IS a no-op in the real binary too, not a "Ghidra gave
     up" placeholder. Kept as-is; not a bug. */
  return 0;
}
undefined4 LAB_00073b10()

{
  /* Confirmed via a direct Ghidra headless lookup by address
     (0x73b10): `undefined4 FUN_00073b10(void) { return 0; }` -- this
     genuinely IS a no-op in the real binary too, not a "Ghidra gave
     up" placeholder. Kept as-is; not a bug. */
  return 0;
}
/* Both were `int` -- real 64-bit pointers (DAT_002046a8/DAT_0020469c,
   both `char *`) stored through a 32-bit global truncate them on this
   host. DAT_002046a0 feeds DAT_002046c0/DAT_002046c8's own bases
   (used by active_mobile_list_add's message-buffer write), confirmed live as
   the next crash in the spawn_new_object "spawn object" chain once the
   earlier truncations in that same chain were fixed. */
char *DAT_002046ac;
char *DAT_002046a0;
// was DAT_00250770: live entry count in g_scheduler_table (max 0x40) --
// see g_scheduler_table's own comment for the whole system this
// belongs to, named to match System Shock's own term for it.
undefined1 g_scheduler_count;
short DAT_002046b0;
byte DAT_002046d0;
byte DAT_002046cc;
byte DAT_002046d8;
byte DAT_002046dc;
char *DAT_00204874;
int DAT_002046e8;
undefined1 DAT_002046e0;
undefined1 DAT_002046e4;
/* The movement/collision-sweep working block. Ghidra split this one ~24-byte
   struct into 14 separate globals (DAT_002049c8 .. DAT_002049de), but
   collision_build_height_field / collision_height_envelope write its fields through `DAT_00202c6c[offset]`
   (DAT_00202c6c = &DAT_002049c8) while sweep_init_position / sweep_collision_
   flags read/write them by name -- so the indexed writes and the named reads
   landed on unrelated memory and collision flags never reflected the tile
   under the player (walked straight through walls). Back them with one buffer
   at the name-derived offsets so both views alias. */
 unsigned char DAT_002049c8_backing[64];
#define DAT_002049c8 (*(short *)(DAT_002049c8_backing + 0x00))
#define DAT_002049ca (*(short *)(DAT_002049c8_backing + 0x02))
/* Offset 4 -- the third field of the X(0)/Y(2)/?(4)/heading(6) layout, and
   never given a name because nothing in the decompile reads it by a plain
   global symbol; every access is through the indexed `DAT_00202c6c[4]`
   pointer form, which Ghidra doesn't auto-name. FUN_00051fa0's own private
   local copy of this exact struct layout names it explicitly in an
   existing comment: "the player's current sub-tile height byte" (its
   local_38 = param_5, set before use). collision_height_envelope's own
   read (player_height + this field, compared against a candidate floor
   height) matches that reading too. The X/Y sync fix in sweep_collision_
   flags (commit ed49786) stopped short of this one -- added here as its
   natural third line, mirroring the existing pattern exactly. */
#define DAT_002049cc (*(short *)(DAT_002049c8_backing + 0x04))
#define DAT_002049ce (*(undefined2 *)(DAT_002049c8_backing + 0x06))
#define DAT_002049d0 (DAT_002049c8_backing[0x08])
#define DAT_002049d1 (DAT_002049c8_backing[0x09])
#define DAT_002049d2 (*(undefined2 *)(DAT_002049c8_backing + 0x0a))
#define DAT_002049d4 (*(ushort *)(DAT_002049c8_backing + 0x0c))
#define DAT_002049d6 (*(ushort *)(DAT_002049c8_backing + 0x0e))
#define DAT_002049d8 (DAT_002049c8_backing[0x10])
#define DAT_002049d9 (DAT_002049c8_backing[0x11])
#define DAT_002049da (DAT_002049c8_backing[0x12])
#define DAT_002049dc (DAT_002049c8_backing[0x14])
#define DAT_002049dd (DAT_002049c8_backing[0x15])
#define DAT_002049de (DAT_002049c8_backing[0x16])
undefined DAT_000868c0;
int DAT_002046d4;
int DAT_002046ec;
/* The reticle/collision "picked tile" record at 0x86998..0x869a2. Ghidra
   split it into scattered byte scalars (DAT_00086998/99/9a/9b/9f/a0/a1/a2)
   plus overlapping 16-bit "_DAT_" views (_DAT_00086999 = the x/y pair,
   _DAT_0008699b = target floor height, _DAT_0008699f = ceiling clearance).
   Recompiled as separate globals the wide writes and narrow reads landed on
   different memory: reticle_object_pick's `_DAT_0008699f = 0x7f` never
   reached DAT_0008699f/DAT_000869a0, so sweep_collision_flags read the
   ceiling clearance as 0 and decided the player never fits -> "walk forward"
   stalled after 1/8 tile on every open tile. Back them with one buffer so
   the byte and word views alias. */
 unsigned char DAT_00086998_backing[16];
#define DAT_00086998  (*(signed char *)(DAT_00086998_backing + 0))
#define DAT_00086999  (DAT_00086998_backing[1])
#define DAT_0008699a  (DAT_00086998_backing[2])
#define DAT_0008699b  (DAT_00086998_backing[3])
#define DAT_0008699f  (DAT_00086998_backing[7])
#define DAT_000869a0  (DAT_00086998_backing[8])
#define DAT_000869a1  (DAT_00086998_backing[9])
#define DAT_000869a2  (DAT_00086998_backing[10])
int DAT_002046f8;
char s_optbtns_00086954[] = "optbtns";
short DAT_002046f0;
short DAT_002046f4;
/* Was zero-initialized (C default, no initializer) -- confirmed via
   Ghidra headless memory dump (0x868dc) that the real binary's own
   .data has this at 7, not 0. This is the pause-menu-panel state index
   (0-6 = a panel is open, 7 = closed/back in normal gameplay -- see
   close_ui_panel_return_to_game's own comment above, uw.c ~4400), and
   draw_idle_mouse_cursor (the idle mouse-cursor-sprite show function, reached
   whenever nothing is held: g_selected_object==0) refuses to draw the
   cursor at all unless this equals 7. Starting at the C default of 0
   instead of the real 7 meant the idle cursor -- automap browsing
   being the clearest case, since you're never holding an item there,
   but really anywhere the player hasn't yet opened and closed the
   Escape menu at least once this session -- never rendered via this
   path from the moment the game starts, matching the reported "automap
   cursor doesn't reliably show/flickers" (a session that happens to
   have already cycled the pause menu once masks this; a fresh session
   or the very first minutes of play would not). */
undefined2 DAT_000868dc = 7;
/* Was a bare 1-byte `undefined` scalar -- draw_save_load_slot_list takes its address
   and passes it straight to message_scroll_print_wrapped as the save-
   slot IV label, so it needs to be a real string, not a scalar. Real
   bytes confirmed via a Ghidra memory dump of the original binary at
   0x8705c: "IV- " (with a trailing space, matching the sibling I-/II-/
   III- labels below). Same class of bug as the other unrecovered-string
   fixes this session, just previously missed because Ghidra had typed
   this one as a scalar instead of generating a garbled placeholder
   string for it. */
// was DAT_0008705c
char s_IV__0008705c[] = "IV- ";
/* Was `"III-"` -- missing its trailing space, confirmed via the same
   memory dump (0x87064: "III- ", not "III-"). */
char s_III__00087064[] = "III- ";
/* Same fix as s_IV__0008705c above: real bytes at 0x8706c are "II- ". */
// was DAT_0008706c
char s_II__0008706c[] = "II- ";
/* Same fix as s_IV__0008705c above: real bytes at 0x87074 are "I- ". */
// was DAT_00087074
char s_I__00087074[] = "I- ";
/* Real .data value confirmed via a Ghidra memory dump of the original
   binary at 0x87990: 0x00000001, not the C zero-default this plain
   declaration gave it. This flag gates msg_scroll_draw_wrapped_span's leading-backslash
   control-code parser (`if (g_scroll_control_codes_enabled != 0 && *param_1=='\\')`);
   draw_save_load_slot_list's save-slot-list header print happens before that
   function's own explicit reset (confirmed both in the C source and via
   disassembly -- not a decompile-dropped-statement bug, the real binary
   really does read whatever this flag was last left at), so on this
   port's very first save/load screen it inherited the wrong (zero)
   default and printed its leading "\6" color code literally instead of
   interpreting it. */
// was DAT_00087990
undefined4 g_scroll_control_codes_enabled = 1;
/* Same reused-global-holding-a-real-string pattern as s_scroll_newline_0008522c
   above: a Ghidra memory dump of the original binary at 0x87038 shows
   the real bytes are `5c 30 00` -- the string "\0" (a literal
   backslash+'0' control code, not an escape byte), not the all-zero
   default this backing array's C declaration gave it. */
// was DAT_00087038
 undefined s_scroll_color_reset_00087038_backing[8192] = "\\0";
#define s_scroll_color_reset_00087038 s_scroll_color_reset_00087038_backing[0]
/* Was `"\\6_Save_Game_Descriptions"` -- underscores standing in for
   whitespace, matching Ghidra's own auto-generated symbol name for this
   string rather than its real recovered bytes (same garbled-placeholder
   class as s__not_used_yet__00087020 and the save-name prompt string
   fixed earlier this session). Real bytes confirmed via a Ghidra memory
   dump of the original binary at 0x8703c
   (`5c 36 20 20 20 20 53 61 76 65 20 47 61 6d 65 20 44 65 73 63 72 69
   70 74 69 6f 6e 73 00`): a literal backslash and '6' (not an escape
   sequence -- there's no raw 0x06 byte here, just the two printable
   characters), then four real spaces, then "Save Game Descriptions". */
char s__6_Save_Game_Descriptions_0008703c[] = "\\6    Save Game Descriptions";
int DAT_002046fc;
/* Were lone `undefined *` -- the real thing is a pair of function-pointer
   dispatch tables for the in-game pause menu, indexed by menu "state"
   (DAT_000868dc, 0..6): PTR_FUN_000868e0 is the no-arg "draw this state's
   screen" table (FUN_00056cc8 calls table[state]()); PTR_FUN_00086900 is
   the "handle a click/button-index within this state" table (FUN_00056cf8
   calls table[state](clicked_index)). Link-time-init data the decompile
   never populated -> clicking the top-left panel's "menu" button (which
   calls FUN_000564f8 -> FUN_00056cc8(6), the top-level list) jumped
   through a null pointer.

   Entries 0-3 and 6 were correctly reconstructed by an earlier session
   via call-shape analysis (cross-referencing FUN_00056b48's state-
   transition targets against each candidate function's own logic).
   Entries 4/5 (quit confirm vs. torch/detail brightness) were ALSO
   guessed that same way and came out swapped -- confirmed live: clicking
   the on-screen "DETAIL" button showed the quit-confirmation screen, and
   clicking inside it actually exited the game; clicking "QUIT GAME"
   showed the detail-brightness slider. Root-caused for real this time:
   these two tables are genuine link-time data in the original binary
   (not synthesized by Ghidra), readable directly at their own addresses
   -- a Ghidra headless memory dump of 0x868e0 and 0x86900 in the
   original .exe gives the real function pointers at every one of these
   8 slots, no inference needed. Index 4's real target is 0x5693c
   (FUN_0005693c, brightness) and index 5's is 0x56838 (FUN_00056838,
   quit confirm) in the draw table -- the reverse of what was guessed --
   and correspondingly 0x56a70 (FUN_00056a70, brightness click) / 0x56c88
   (FUN_00056c88, quit click) in the click table. Swapped both tables'
   4/5 entries to match:
     0  load-game slot list  (draw_save_load_slot_list draw, shared w/ save;
                              FUN_00056bdc click, DAT_000868dc==1 gates
                              the save-only "extra slot" bits)
     1  save-game slot list  (same pair as 0)
     2  sound on/off toggle  (FUN_00056864 draw / FUN_000569c0 click)
     3  music on/off toggle  (FUN_00056864 draw / FUN_00056a18 click)
     4  torch brightness     (FUN_0005693c draw / FUN_00056a70 click)
     5  quit-game confirm    (FUN_00056838 draw / FUN_00056c88 click)
     6  top-level menu list  (FUN_000567c0 draw / FUN_00056b48 click)
   Index 7 is never dispatched (DAT_000868dc==7 is close_ui_panel_return_to_game's
   "menu closing" sentinel, checked directly rather than redrawn) but
   both tables are sized 8 with a null-safe entry there for defense. */
extern void FUN_000567c0(void);
extern void draw_save_load_slot_list(void);
extern void FUN_00056838(void);
extern void FUN_00056864(void);
extern void FUN_0005693c(void);
extern void FUN_00056bdc(int);
extern void FUN_000569c0(int);
extern void FUN_00056a18(int);
extern void FUN_00056c88(int);
extern void FUN_00056a70(int);
extern void FUN_00056b48(int);
static void (*const PTR_FUN_000868e0_table[8])(void) = {
  draw_save_load_slot_list,  /* 0: load slot list */
  draw_save_load_slot_list,  /* 1: save slot list */
  FUN_00056864,  /* 2: sound toggle   */
  FUN_00056864,  /* 3: music toggle   */
  FUN_0005693c,  /* 4: brightness     */
  FUN_00056838,  /* 5: quit confirm   */
  FUN_000567c0,  /* 6: top-level list */
  0,
};
#define PTR_FUN_000868e0 (PTR_FUN_000868e0_table[0])
static void (*const PTR_FUN_00086900_table[8])(int) = {
  FUN_00056bdc,  /* 0: load slot list */
  FUN_00056bdc,  /* 1: save slot list */
  FUN_000569c0,  /* 2: sound toggle   */
  FUN_00056a18,  /* 3: music toggle   */
  FUN_00056a70,  /* 4: brightness     */
  FUN_00056c88,  /* 5: quit confirm   */
  FUN_00056b48,  /* 6: top-level list */
  0,
};
#define PTR_FUN_00086900 (PTR_FUN_00086900_table[0])
undefined2 DAT_00204710;
undefined2 DAT_0020470c;
undefined2 DAT_00204830;
undefined2 DAT_00204834;
short DAT_0020471c;
short DAT_00204838;
short DAT_0020483c;
short DAT_002047dc;
short DAT_002047d8;
int DAT_000889b8;
int DAT_000889bc;
undefined2 DAT_002047b0;
short DAT_002047a4;
short DAT_00204748;
short DAT_00204784;
short DAT_00204788;
undefined2 DAT_0020479c;
undefined2 DAT_002047a0;
undefined2 DAT_00204798;
undefined2 DAT_00204790;
undefined2 DAT_00204794;
int DAT_0020484c;
undefined2 DAT_0008696a;
undefined2 DAT_0008696c;
short DAT_00086968;
short DAT_00204850;
short DAT_0008696e;
ushort DAT_0023c448;
undefined4 DAT_00204868;
char DAT_0008794c_backing[128];
char *DAT_0008794c = DAT_0008794c_backing;
/* Real static lookup table (.data, read-only in practice) recovered
   byte-for-byte from UU.exe -- the stylus-tap hit grid for the chargen
   name-entry on-screen keyboard. Indexed by FUN_00057a80 as
   [row + column*20], row = (touch-Y)>>4 (16px-tall rows spanning the full
   320px portrait screen height), column = (touch-X-200)/20 (two 20px-wide
   columns in the 200..240 strip). Column 0 = digits 0-9 then 'a'-'j';
   column 1 = 'k'-'z' then backspace(8)/enter(13)/space(32)/0x14. */
static undefined1 DAT_00087650_backing[40] = {
  '0','1','2','3','4','5','6','7','8','9',
  'a','b','c','d','e','f','g','h','i','j',
  'k','l','m','n','o','p','q','r','s','t',
  'u','v','w','x','y','z',8,13,32,0x14
};
#define DAT_00087650 DAT_00087650_backing[0]
short DAT_00204854;
static undefined1 DAT_00204720_backing[65536];
#define DAT_00204720 DAT_00204720_backing[0]
undefined2 DAT_00204750;
undefined2 DAT_002047e0;
undefined2 DAT_00204808;
undefined2 DAT_00086970;
char DAT_00204858;
undefined2 DAT_00204704;
undefined2 DAT_00204714;
short DAT_002047a8;
short DAT_0020478c;
short DAT_002047ac;
short DAT_000876c4_backing[128];
short *DAT_000876c4 = DAT_000876c4_backing;
ushort DAT_000876bc_backing[128];
ushort *DAT_000876bc = DAT_000876bc_backing;
short DAT_000876c0_backing[128];
short *DAT_000876c0 = DAT_000876c0_backing;
short DAT_00086974;
short DAT_00204708;
short DAT_00204700;
int DAT_00204864;
short DAT_0020477c;
short DAT_00204778;
short DAT_00204780;
int DAT_0020485c;
char DAT_002506aa;
char DAT_002506ab;
char *DAT_002048bc;
// was DAT_00086978. The three 16-bit velocity components of the movement block
/* (&DAT_00204886/88/8a). Ghidra typed this `char *`, so movement_sweep_setup's
   `g_sweep_velocity[1]` / `[2]` read single BYTES (offsets 7,8) instead of the
   shorts at offsets 2,4 -- and every copy (`psVar11 = g_sweep_velocity`) is
   already `short *`, confirming the intent. The byte misread made `[2]`
   (meant: the Z/vertical velocity g_vertical_velocity, 0 for level movement) return
   the low byte of the forward velocity DAT_00204888, so plain forward
   movement took the "vertical movement" path (collision_build_height_field / collision_height_envelope)
   which corrupts DAT_00204880 -- one forward step overflowed the player X to
   the map edge and wedged them there.
   g_sweep_velocity[2] is *(short*)(DAT_00204874+0xa) -- the exact same
   memory as g_vertical_velocity (see its #define, uw.c:2025), just reached
   through this pointer instead; movement_sweep_setup's own accumulation
   `g_sweep_velocity[2] += speed*g_fall_accel` is the ordinary velocity +=
   accel*dt integration step, not a separate quantity (confirmed while
   investigating the jump-arc bug, see
   [[jump-physics-fix-and-open-integrator-issue]]). */
short *g_sweep_velocity;
undefined1 DAT_002049c0;
/* "Already slid this tick" cooldown, decremented once per ordinary substep
   in sweep_step (`DAT_002049bc = DAT_002049bc + -1;`) and read back in
   sweep_slide_along_wall's own first line to skip re-deflecting mid-slide.
   Verified via disassembly (0x59b84/0x5a5c0) both sites use `ldrsb` --
   SIGNED byte reads -- so 0 decrementing to -1 reads back as -1, and the
   guard (`if (0 < DAT_002049bc)`) correctly stays false. Declared here as
   `undefined1` (unsigned char), it was reset to 0 every tick
   (movement_collision_sweep) then immediately decremented on the very
   first ordinary substep before any wall was ever hit, underflowing to
   255 (unsigned) instead of -1 (signed) -- permanently latching the
   "already slid" guard true, so sweep_slide_along_wall took its early
   revert-and-end path on every single call and sweep_deflect_heading
   never ran at all. Symptom: running straight into a wall stopped the
   player dead with zero deflection/turning, forever, instead of sliding
   along it -- confirmed live via a new UW_DEBUG_WALL trace showing
   DAT_002049bc=255 on every one of 4523 calls during an 80+-tick
   straight-on wall hold. */
char DAT_002049bc;
short DAT_00086990;
short DAT_00086996;
// was DAT_0008697c_backing/DAT_0008697c -- the swept working foot position
// (coarse X/Y/Z, tile-eighths / eighth-fine units) collision math operates
// on each sub-step before sweep_writeback_position commits it back to the
// real player position.
short g_sweep_foot_pos_backing[128];
short *g_sweep_foot_pos = g_sweep_foot_pos_backing;
short DAT_00086980;
short DAT_00086982;
short DAT_00086984;
undefined4 DAT_00204878;
undefined DAT_00202c32;
ushort DAT_0008698c;
short DAT_0008698e;
ushort DAT_00086992;
short DAT_00086994;
short DAT_0008698a;
 undefined1 DAT_00086986_backing[65536];
#define DAT_00086986 DAT_00086986_backing[0]
/* The high byte of DAT_00086986[]'s int16 entries. movement_sweep_setup /
   sweep_integrate_substep write the per-axis "direction" words as
   `(&DAT_00086986)[k*2] = lo; (&DAT_00086987)[k*2] = hi;`. Ghidra emitted
   this as a lone scalar, so the high byte landed on an unrelated global and
   every entry read back as 0 -- `sweep_integrate_substep`'s
   `DAT_00086986[dominant] * iVar2 < 1` test then always took the negative
   branch, so "walk forward" moved the player BACKWARD (toward the wall
   behind the spawn). Alias it to backing[1]. */
#define DAT_00086987 DAT_00086986_backing[1]
/* Wall-slide deflection candidate-heading table (was a zero-initialized
   65536-byte placeholder with no writer anywhere in the decompile -- an
   "orphaned data table" of the same class as the TMOBJ/inventory-hotspot
   tables fixed elsewhere in this project). sweep_slide_along_wall reads
   `*(short*)(&DAT_000869a8 + index*2)` to pick which heading to deflect
   the move toward; with the real table missing, every read always came
   back 0, so every wall hit -- head-on or glancing -- tried to deflect
   toward the SAME fixed heading regardless of which way the wall
   actually faced. That deflection only succeeds when it happens to be
   close enough to the real wall's face (confirmed via a live
   UW_DEBUG_WALL trace: candidate_heading=0 on 100% of calls, and
   sweep_deflect_heading itself only returned nonzero -- i.e. actually
   redirected the move -- 3 times out of 2258 during a real diagonal
   wall hold), matching the reported symptom exactly: sliding sometimes
   turns the player further INTO the wall instead of along it, "working"
   only by coincidence when heading 0 happens to roughly line up with
   the actual wall.

   Recovered the real 8-entry table from the original binary at 0x869a8
   (Ghidra headless dump, matching this global's own name/address) --
   confirmed via disassembly of sweep_slide_along_wall (0x59b7c) that the
   pointer literal at 0x59c20 resolves to exactly this address. The 8
   real values are `-8192*i` (i.e. -45 degrees * i, wrapped to a signed
   16-bit heading) for i=0..7 -- the 8 compass octants relative to the
   hit. Confirmed the table is EXACTLY these 8 entries and no more: bytes
   immediately following decode as ASCII (an unrelated string literal),
   not further table data. */
 unsigned char DAT_000869a8_backing[16] = {
  0x00, 0x00, /*     0 */  0x00, 0xE0, /* -8192 */  0x00, 0xC0, /* -16384 */
  0x00, 0xA0, /* -24576 */ 0x00, 0x80, /* -32768 */ 0x00, 0x60, /*  24576 */
  0x00, 0x40, /* 16384 */  0x00, 0x20  /*  8192 */
};
#define DAT_000869a8 DAT_000869a8_backing[0]
int DAT_00204870;
undefined1 DAT_0024f0ca;
undefined2 DAT_0023adb0;
 undefined2 DAT_0023aeb8_backing[8192];
#define DAT_0023aeb8 DAT_0023aeb8_backing[0]
/* Was a lone `undefined2` scalar, but it is the per-level floor/ceiling
   texture-id list -- reset_texture_id_lists / load_level_texture_ids write (&DAT_0023adb8)[0..9]
   and load_texture_arena reads them to pick which F32.TR / W16.TR entries to load
   into the 10-slot arena. As a scalar only slot 0 was coherent; slots 1..9
   aliased whatever globals the linker placed next, so load_texture_arena hit a
   garbage/negative id after ~2 entries and DAT_0023aeb8 (the loaded count)
   came out 2. get_texture_page(0x39) (the ceiling = arena slot 9) then read
   far past the 2-texture arena into the W16/colour-light memory -> wrong
   ceiling texture. Sibling lists DAT_0023ae58 / DAT_0023add0 / DAT_0023b840
   already have backing arrays; this one was missed. */
 undefined2 DAT_0023adb8_backing[8192];
#define DAT_0023adb8 DAT_0023adb8_backing[0]
undefined1 DAT_0024f090;
char s_bad_tmap_ids_size_000869b7[] = "bad_tmap_ids_size";
undefined1 DAT_0023b841;
/* Recovered from UU.exe .data: the four texture-file basenames
   FUN_0005b36c appends to "\DATA\" and loads into the arena. Were
   silently-zero 32KB arrays, so every path was just the bare "\DATA\"
   directory -> load_texture_arena failed -> DAT_002049e0 stayed all zero. */
static const char DAT_000869cc_str[] = "f16.tr";
#define DAT_000869cc (DAT_000869cc_str[0])
static const char DAT_000869d4_str[] = "w16.tr";
#define DAT_000869d4 (DAT_000869d4_str[0])
static const char DAT_000869dc_str[] = "f32.tr";
#define DAT_000869dc (DAT_000869dc_str[0])
static const char DAT_000869e4_str[] = "w64.tr";
#define DAT_000869e4 (DAT_000869e4_str[0])
/* Was a lone `undefined` scalar. It is the base of the texture / shade /
   colour-light table arena: FUN_00042174 sets DAT_0023ae38 = &DAT_002049e0
   and loads several .tr/.dat files into it, then get_texture_page hands out
   `&DAT_002049e0 + page*stride` pointers. Needs real backing storage
   (1 MB is comfortably more than UW1's texture set). */
static undefined1 DAT_002049e0_backing[0x100000];
#define DAT_002049e0 DAT_002049e0_backing[0]
char s__DATA_terrain_dat_000869ec[] = "\\DATA\\terrain.dat";
// was DAT_0023b01c -- set by the 3D-viewport setup function
// (FUN_0005b758) whenever the real in-game dungeon-view mode (game
// mode bit 0, not a menu/conversation overlay) is active; gates
// weapon_overlay_and_full_redraw's weapon-overlay draw.
undefined4 g_dungeon_view_active;
undefined2 DAT_0023b020;
undefined2 DAT_0023aed4;
undefined2 DAT_0023aed8;
undefined2 *DAT_0023aed0;
undefined2 DAT_00250650;
undefined2 DAT_0023b49c;
short DAT_0023b4cc;
char s_R__lu_P__lu_S__lu_F__d__d_00086b04[] = "R:%lu_P:%lu_S:%lu_F:%d.%d";
 undefined1 DAT_0023b4a8_backing[65536];
#define DAT_0023b4a8 DAT_0023b4a8_backing[0]
int DAT_0023aec8;
ushort DAT_0023b4c8;
undefined1 DAT_0023b028;
byte DAT_0023b4a0;
/* DAT_00086a18 and DAT_00086a20 are now offsets into DAT_00086a00_region
   (real bytes recovered from UU.exe) -- see its definition further down. */
// Was a lone `int` scalar but used throughout the renderer as a pointer to a
// ~0x2e-byte "current view" record (screen-space player x/y/z/facing, written
// by update_current_view_from_subject from DAT_00204880/82/84 + DAT_00201c70, then read all over
// the tile/sprite projection code). Never populated with a real address in
// this decompile, so give it real backing storage like the other
// lone-scalar-used-as-array globals found this session (DAT_000fb880-family).
 undefined1 DAT_00086e6c_backing[64];
#define DAT_00086e6c ((intptr_t)DAT_00086e6c_backing)
char *DAT_0023aecc;
undefined *DAT_0023b02c;
short DAT_0025063c;
short DAT_002506dc;
short DAT_0025064c;
/* Lookup/gradient table in build_visibility_light_grid, indexed up to
   (16*0x21+32)*2=1120 -- confirmed overflowing into the unrelated
   DAT_00248410 via an lldb watchpoint (same symptom, second distinct
   overflow source found reaching that same global). Widened. */
 undefined1 DAT_0023b039_backing[4096];
#define DAT_0023b039 DAT_0023b039_backing[0]
undefined1 g_visibility_ring_done;
/* g_visibility_ray_table-family: ~20 separately-declared globals that are really
   one 16-entry x 0x15(21)-byte per-ray record array for the dungeon's
   geometric beam-trace visibility flood (NOT a creature-reaction/sound-cue
   queue -- that was this subsystem's original, later-disproven name; see
   extend_visibility_ray_row's and run_visibility_flood's own comments)
   (seed_visibility_queue/advance_visibility_ray/merge_adjacent_visibility_rays/run_visibility_flood index it via
   `&g_visibility_ray_table + entry*0x15`). As lone scalars, out-of-bounds record
   writes/reads walked off into whatever memory happened to follow in
   declaration order -- confirmed: g_visibility_ring_done (declared right after,
   and genuinely 0x150=336=16*21 bytes past g_visibility_ray_table in the real
   address map) was getting corrupted by exactly this, which is why the
   queue never looked empty. This subsystem also computes g_visibility_ring_depth,
   which turns out to double as the tile-visibility scan radius consumed
   by walk_visible_tiles's dungeon-geometry walk -- NOT optional creature/object
   bookkeeping as first assessed (see run_visibility_flood's since-removed
   `// Hack - Disabled`); skipping it left the 3D viewport permanently
   empty. Real backing array + aliases at each element's correct offset,
   generous margin past the 16*21=336-byte minimum. */
 undefined1 g_visibility_ray_table_backing[1024];
#define g_visibility_ray_table g_visibility_ray_table_backing[0]
/* Real-pointer side table for this record array's "back pointer" field
   (offsets 9/0xa-0xb/0xc), which the original 32-bit binary packed as raw
   bytes -- see advance_visibility_ray's comment on why that can't be reassembled
   into a real 64-bit pointer on this port. Only entry 0 (the player's own
   visibility-ray slot, the only one seed_visibility_queue ever populates in a
   monster-free dungeon) is written; other entries stay NULL, matching
   the "unpopulated" state advance_visibility_ray's own `(*param_1 & 0x80) == uVar1`
   guard already treats as "nothing to look up" for a zeroed record. */
 char *g_visibility_ray_realptr[24];
/* Second real-pointer side table, for this record's OTHER packed pointer
   field (offsets 0xd and its byte-mirrored copy at 0x11-0x14 -- see
   seed_visibility_queue's DAT_0023aeed/aeee/aef0 writes). Unlike the offset-9
   field, this one is always the SAME fixed original-binary address
   (0x0023b058, confirmed identical for entry 0's 3-field pack and
   entry 1's combined `_DAT_0023af02` write) -- a hardcoded literal
   pointer into the shared g_visibility_ring_buffer output-list buffer (0x0023b058 -
   0x0023b038 = 0x20), same "hardcoded original 32-bit address instead of
   a symbolic reference" bug class fixed elsewhere all session, just
   packed byte-by-byte instead of written as one literal. Populated once
   below (not per-entry -- every entry that sets this field wants the
   same target), read via the same per-entry lookup as the offset-9
   table for consistency with how the field is indexed. */
 char *g_visibility_ray_realptr2[24];
/* Only entries 0 and 1 (the player's own visibility-ray slot, always populated
   by seed_visibility_queue) are ever given a real pointer above -- a monster-free
   dungeon has nothing to populate the other 14 with. But this queue's
   chain-walk can still legitimately reach an unpopulated entry (its
   "next" link byte isn't reliably reset to the 0xf end-of-chain sentinel
   between frames), which would otherwise be a NULL-pointer crash. Route
   an unset (NULL) table entry to this shared zeroed scratch record
   instead of dereferencing NULL -- keeps the walk/arithmetic in this
   subsystem well-defined without having to fully model every field an
   empty slot could still be read through. */
#define DAT_0023aee1 g_visibility_ray_table_backing[1]
#define DAT_0023aee3 g_visibility_ray_table_backing[3]
#define DAT_0023aee5 g_visibility_ray_table_backing[5]
#define DAT_0023aee6 g_visibility_ray_table_backing[6]
#define DAT_0023aee7 g_visibility_ray_table_backing[7]
#define DAT_0023aee8 g_visibility_ray_table_backing[8]
#define DAT_0023aee9 g_visibility_ray_table_backing[9]
#define DAT_0023aeea (*(undefined2 *)&g_visibility_ray_table_backing[0xa])
#define DAT_0023aeec g_visibility_ray_table_backing[0xc]
#define DAT_0023aeed g_visibility_ray_table_backing[0xd]
#define DAT_0023aeee (*(undefined2 *)&g_visibility_ray_table_backing[0xe])
#define DAT_0023aef0 g_visibility_ray_table_backing[0x10]
#define DAT_0023aef1 g_visibility_ray_table_backing[0x11]
#define DAT_0023aef5 g_visibility_ray_table_backing[0x15]
#define DAT_0023aef6 (*(undefined2 *)&g_visibility_ray_table_backing[0x16])
#define DAT_0023aef8 (*(undefined2 *)&g_visibility_ray_table_backing[0x18])
#define DAT_0023aefa g_visibility_ray_table_backing[0x1a]
#define DAT_0023aefb g_visibility_ray_table_backing[0x1b]
#define DAT_0023aefc g_visibility_ray_table_backing[0x1c]
#define DAT_0023aefd g_visibility_ray_table_backing[0x1d]
#define DAT_0023aefe (*(undefined2 *)&g_visibility_ray_table_backing[0x1e])
#define DAT_0023af00 (*(undefined2 *)&g_visibility_ray_table_backing[0x20])
#define DAT_0023af02 g_visibility_ray_table_backing[0x22]
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
#define DAT_00086a00 (*(undefined1 *)(DAT_00086a00_region + 0x00))
#define DAT_00086a02 (*(undefined1 *)(DAT_00086a00_region + 0x02))
#define DAT_00086a18 (*(undefined1 *)(DAT_00086a00_region + 0x18))
#define DAT_00086a20 (*(undefined1 *)(DAT_00086a00_region + 0x20))
#define DAT_00086a60 (*(undefined1 *)(DAT_00086a00_region + 0x60))
/* {0x10, 0x00}: compute_visibility_ray_offset reads (&DAT_00086af0)[bool].
   Was a silently-zero undefined4. */
 const undefined1 DAT_00086af0_arr[4] = { 0x10, 0x00, 0x00, 0x00 };
#define DAT_00086af0 (*(undefined1 *)DAT_00086af0_arr)
/* Recovered from UU.exe .data at 0x86af8 (12 bytes = 6 int16). Was two
   separate silently-zero 64KB Ghidra arrays (DAT_00086af8, DAT_00086b00)
   plus a bare literal `0x86afc` deref in advance_visibility_ray. These
   are the per-view-orientation constants that function's visibility
   flood-fill uses to decide whether a neighbour tile occludes the view;
   with them all zero the fill's expansion tests (uw.c ~44965, ~44978,
   ~45001) never fire, so run_visibility_flood drains after ~2 entries
   and marks NO tile visible -> process_visible_tile_cell only ever takes its
   un-gated automap-reveal path and never emits 3D tile geometry (black
   viewport). Indexed [orient] with orient in {0,1}:
     +0x00  DAT_00086af8 = {2, 4}    wall-edge bitmask (AND'd with DAT_000878d0[shape])
     +0x04  DAT_00086afc = {2, 3}    expected shape id for the "aligned" case
     +0x08  DAT_00086b00 = {-1, 1}   neighbour step sign */
 const undefined1 DAT_00086af8_region[12] = {
  0x02,0x00, 0x04,0x00, 0x02,0x00, 0x03,0x00, 0xff,0xff, 0x01,0x00,
};
#define DAT_00086af8 (*(undefined1 *)(DAT_00086af8_region + 0))
#define DAT_00086afc (*(undefined1 *)(DAT_00086af8_region + 4))
#define DAT_00086b00 (*(undefined1 *)(DAT_00086af8_region + 8))
short g_visibility_ring_depth;
undefined1 g_visibility_ring_buffer_backing[32768];
#define g_visibility_ring_buffer g_visibility_ring_buffer_backing[0]
undefined DAT_00086b34;
undefined2 DAT_00189578;
short DAT_0023b810;
/* Recovered from UU.exe .data at 0x86b38: three pairs of function
   pointers, selected by an index (0 or 1, from DAT_00086b2c) in
   walk_visible_tiles, loaded into DAT_0023b4f4 / DAT_0023b80c / DAT_0023b4d4,
   and called by process_visible_tile_cell to emit a visible tile's 3D geometry
   slice (wall / floor-or-ceiling / diagonal). Were silently-zero scalars,
   so `(*DAT_0023b4f4)(...)` was a call through NULL the instant the
   (now-working) visibility fill marked any tile visible. The six entries
   are contiguous in .data: b38,b3c / b40,b44 / b48,b4c -- one array, the
   symbols index it at 0..4. NOT const: FUN_0005d664 patches entries [1]
   and [3] (b3c / b44) at runtime between FUN_0005dd84 and emit_floor_texture_select. */
 code *DAT_00086b38_fnptrs[6] = {
  (code *)FUN_0005dd84, (code *)emit_floor_texture_select,
  (code *)FUN_0005debc, (code *)FUN_0005dd84,
  (code *)FUN_0005dff4, (code *)FUN_0005e3c0,
};
#define DAT_00086b38 (DAT_00086b38_fnptrs[0])
#define DAT_00086b3c (DAT_00086b38_fnptrs[1])
#define DAT_00086b40 (DAT_00086b38_fnptrs[2])
#define DAT_00086b44 (DAT_00086b38_fnptrs[3])
#define DAT_00086b48 (DAT_00086b38_fnptrs[4])
undefined4 DAT_0023b804;
undefined2 DAT_00086b30;
undefined DAT_0023b4dc;
short DAT_00086b2c;
code *DAT_0023b80c;
code *DAT_0023b4d4;
undefined2 DAT_00189582;
ushort DAT_00189580;
/* DAT_00086b3c / DAT_00086b44 are entries [1] and [3] of
   DAT_00086b38_fnptrs (see its comment) -- #define'd there. */

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
     +0x60 (bb0) 6-entry group used by the billboard-vertex Ordinal_2032 calls
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
#define DAT_00086b50_at(off)  (*(const undefined1 *)(DAT_00086b50_region + (off)))
#define DAT_00086b50  DAT_00086b50_at(0x00)
#define DAT_00086b52  DAT_00086b50_at(0x02)
#define DAT_00086b84  DAT_00086b50_at(0x34)
#define DAT_00086b88  DAT_00086b50_at(0x38)
#define DAT_00086bb0  DAT_00086b50_at(0x60)
#define DAT_00086bb1  DAT_00086b50_at(0x61)
#define DAT_00086bb2  DAT_00086b50_at(0x62)
#define DAT_00086bb3  DAT_00086b50_at(0x63)
#define DAT_00086bb4  DAT_00086b50_at(0x64)
#define DAT_00086bb5  DAT_00086b50_at(0x65)
#define DAT_00086bc8  DAT_00086b50_at(0x78)
#define DAT_00086bc9  DAT_00086b50_at(0x79)
#define DAT_00086bca  DAT_00086b50_at(0x7a)
#define DAT_00086bcb  DAT_00086b50_at(0x7b)
#define DAT_00086bcc  DAT_00086b50_at(0x7c)
#define DAT_00086bcd  DAT_00086b50_at(0x7d)
/* numeric base for the surviving `iVar + 0x86bXX` literal derefs:
   substitute UW_B50_LIT(0x86bXX) for the literal so the arithmetic
   lands in the recovered region instead of at absolute address 0x86bXX. */
#define UW_B50_LIT(addr)  ((intptr_t)(const char *)DAT_00086b50_region + ((intptr_t)(addr) - 0x86b50))
 const undefined1 DAT_00086c00_arr[8] = { 0x00,0x01,0x02,0x00,0x00,0x00,0x00,0x00 };
#define DAT_00086c00 (*(const undefined1 *)DAT_00086c00_arr)
undefined2 DAT_0023bc8c;
undefined2 DAT_0023b8c0;
byte *DAT_0023b4ec;
/* Typed view of the tile record currently being processed (see uw.h's
   uw_tile_t and uw.c's g_level_tiles for the recovered layout). */
#define g_current_tile ((uw_tile_t *)DAT_0023b4ec)
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
#define DAT_00086bf0 (*(undefined1 *)DAT_00086bf0_real_table)
undefined1 DAT_0023b818;
char *DAT_0023b4f0;
char *DAT_0023b808;  /* was `undefined4` (4 bytes) -- would truncate the
                        real `void *` tilemap_lookup returns; currently a
                        write-only global (no reader elsewhere in this
                        file), so not a live bug, but fixed for safety */
undefined4 DAT_0023b838;
short DAT_0023b4e8;
short DAT_0023b4e4;
undefined1 *DAT_0023b820;
ushort DAT_0023b7f8;
ushort DAT_0023b828;
undefined2 DAT_0023b824;
char DAT_00087938;
short DAT_000b4620;
short DAT_00086b28;
short DAT_00086b24;
ushort DAT_0023b81c;
ushort DAT_0023b4d8;
undefined2 DAT_0023b4d0;
byte DAT_0023b4e0;
char DAT_0023b834;
/* DAT_00086b84/b88/bb0..bb5/bc8..bcd/c00 -> DAT_00086b50_region /
   DAT_00086c00_arr, #define'd above. */
short DAT_0023b8c4;
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
short DAT_00189584;
undefined2 DAT_00189586;
ushort DAT_0018957a;
/* .data 0x86c08: real billboard-catalog table, 30 records of 4 bytes
   each (byte0=flags/sub-frame-count, bytes1-3=up to 3 more per-entry
   values -- see emit_catalog_object's own use of it), recovered
   directly from UU.exe. Was 4 lone `undefined` scalars Ghidra never
   gave real backing to -- same "split/orphaned data table" class as
   g_inventory_hotspot_table before its own recovery (see
   [[inventory-hotspot-table-recovery]]) -- every reader indexes past
   byte 3 via pointer arithmetic (`(&DAT_00086c08)[catalog_idx*4]`
   etc.), so a plain 4-byte declaration silently truncated every
   catalog entry past the first to out-of-bounds reads. Cross-validated:
   this table's real end (0x86c08+0x78=0x86c80) lines up exactly with
   DAT_00086c80's own real start below, and this whole region was dumped
   in one contiguous pull starting from the already-known-good
   DAT_00086b50_region/DAT_00086c00_arr immediately before it (both
   matched their existing recovered values exactly, confirming the
   address mapping). */
unsigned char DAT_00086c08_backing[0x78] = {
  0x01,0xec,0x00,0x00, 0x21,0xeb,0x00,0x00, 0x11,0xec,0x00,0x3e, 0x01,0xe4,0x00,0x00,
  0x02,0xb6,0xb0,0x00, 0x02,0x64,0x6c,0x00, 0x02,0x64,0x6c,0x00, 0x02,0x64,0x6c,0x00,
  0x42,0xe8,0xb8,0x00, 0x01,0xe4,0x00,0x00, 0x19,0xe4,0x00,0x60, 0x03,0xa3,0xa4,0xa6,
  0x01,0x68,0x00,0x00, 0x01,0x68,0x00,0x00, 0x11,0xec,0x00,0x00, 0x21,0xec,0x00,0x00,
  0x51,0xb0,0x00,0xe4, 0x51,0xb0,0x00,0xec, 0x11,0xb0,0x00,0xf4, 0x11,0x6a,0x00,0x3c,
  0x51,0xb0,0x00,0x00, 0x11,0xb0,0x00,0x00, 0x21,0xb0,0x00,0x00, 0x83,0x00,0x02,0x04,
  0x02,0xe4,0x68,0x00, 0x02,0xe6,0x68,0x00, 0x01,0xe4,0x00,0x00, 0x02,0xe4,0x6a,0x00,
  0x03,0xe6,0x6a,0x71, 0x03,0xe2,0x62,0xc4,
};
#define DAT_00086c08 DAT_00086c08_backing[0]
#define DAT_00086c09 DAT_00086c08_backing[1]
#define DAT_00086c0a DAT_00086c08_backing[2]
#define DAT_00086c0b DAT_00086c08_backing[3]
undefined4 DAT_00086ce0;
undefined4 DAT_00086ce4;
undefined4 DAT_00086ce8;
undefined4 DAT_00086cec;
undefined4 DAT_00086cf0;
undefined4 DAT_00086cf4;
undefined4 DAT_00086cf8;
undefined4 DAT_00086cfc;
undefined1 DAT_00086d60_backing[65536];
#define DAT_00086d60 DAT_00086d60_backing[0]
short DAT_0018957e;
short DAT_0018957c;
short DAT_00189576;
undefined2 DAT_0023b908_backing[8192];
#define DAT_0023b908 DAT_0023b908_backing[0]
undefined2 DAT_0023b928_backing[8192];
#define DAT_0023b928 DAT_0023b928_backing[0]
char DAT_0023bb94;
undefined DAT_0023b90a_backing[8192];
#define DAT_0023b90a DAT_0023b90a_backing[0]
undefined1 DAT_0023b940_backing[65536];
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
 undefined2 DAT_0023b848_backing[64];
#define DAT_0023b848 DAT_0023b848_backing[0]
 undefined1 DAT_0023b8c8_backing[128];
#define DAT_0023b8c8 DAT_0023b8c8_backing[0]
#define DAT_0023b8c9 DAT_0023b8c8_backing[1]
 undefined1 DAT_0023bb98_backing[512];
#define DAT_0023bb98 DAT_0023bb98_backing[0]
#define DAT_0023bb99 DAT_0023bb98_backing[1]
#define DAT_0023bb9a DAT_0023bb98_backing[2]
/* Recovered from UU.exe .data at 0x86d68 (64 bytes = 32 int16). Per-view-
   facing corner-index remap for a rotating quad: resolve_billboard_corner_offset reads
   `(&DAT_00086d68)[idx*2]` (low byte) and `(&DAT_00086d69)[idx*2]` (high
   byte) with idx = (corner>>5) + facing*8. Were lone zero scalars. */
const undefined1 DAT_00086d68_region[64] = {
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
undefined1 g_tile_feature_records_b92e_backing[65536];
#define DAT_0023b92e g_tile_feature_records_b92e_backing[0]
undefined1 DAT_0020330c;
char DAT_00086db0;
char DAT_00086db1;
undefined1 DAT_0010060d;
undefined1 DAT_0010060e;
undefined1 DAT_0010060f;
undefined4 DAT_0023bc9c;
undefined4 DAT_0023bc98;
undefined4 DAT_002020d0;
undefined4 DAT_002020dc;
undefined4 DAT_002020d8;
undefined4 DAT_002020d4;
ushort DAT_0023adc0;
char s__DATA_f16_tr_00086dd8[] = "\\DATA\\f16.tr";
char s__DATA_f32_tr_00086de8[] = "\\DATA\\f32.tr";
char DAT_00086db4;
int DAT_00086db8;
undefined1 DAT_00086da8;
/* Was a lone `undefined` scalar, but compute_light_source_colors
   indexes it as a 16-entry (0-0xf) light-type -> base-color-index
   table (`(&DAT_00086dc8)[light_type & 0xf]`). Widened to match. */
undefined DAT_00086dc8_backing[16];
#define DAT_00086dc8 DAT_00086dc8_backing[0]
/* Was a lone `undefined` scalar, but compute_object_weight indexes it
   as a 512-entry (9-bit item-id, 0-0x1ff), 4-byte-stride table
   (`(&g_object_weight_table)[item_id * 4]`, only byte 0 of each entry
   read). Widened to match. */
undefined g_object_weight_table_backing[2048];
#define g_object_weight_table g_object_weight_table_backing[0]
/* Was a lone `undefined` scalar 6 bytes past DAT_00202800 -- but
   DAT_00202800 is the REAL family-0 armor/weapon variant-effect table
   (already recovered as a proper 65536-byte backing array, stride 8
   per nibble -- see class0_variant_effect_table_lookup's own comment,
   uw.c ~4175, "&DAT_00202800 + nibble*8"), and refresh_player_equipment_effects
   reads THIS symbol as `(&DAT_00202806)[nibble*8]` -- i.e. byte offset
   6 of that exact same per-nibble 8-byte record (matching
   request_weapon_swing_graphic's own comment: the weapon-swing
   animation category comes from "the weapon-hand item's melee-weapon-
   stats byte 6"). Being a SEPARATE 1-byte global instead of an alias
   into the real table meant every nibble except 0 (where nibble*8==0
   coincidentally lands back on this scalar's own real byte) read
   whatever unrelated global happened to follow it in this file instead
   of that weapon's real animation-category byte -- the likely cause of
   "the weapon drawn in attack mode doesn't match the actual weapon"
   for any weapon-hand item other than the first one in its family.
   Aliased into the real table at its correct offset instead. */
#define DAT_00202806 DAT_00202800_backing[6]
undefined2 DAT_0023beb8;
undefined2 DAT_0023be8c;
undefined DAT_00028bfc_backing[8192];
#define DAT_00028bfc DAT_00028bfc_backing[0]
undefined4 DAT_0023be64;
/* Base of a large fixed-offset record (reset_player_object_record: `DAT_00086df8 =
   &DAT_0023bca8;`, then init_new_character_record and others write through
   DAT_00086df8 at offsets up to at least 0xd1/209 -- a device/config-ish
   struct, not yet fully identified). Declared as a lone `undefined`
   scalar, byte 0 of that struct -- an lldb watchpoint on the unrelated
   DAT_0023be74 (which happens to sit right after this in memory) caught
   this overflowing into it one byte per loop iteration in init_new_character_record,
   corrupting it and causing a later SEGV. Widened generously since the
   struct's exact real size isn't confirmed. */
 undefined1 DAT_0023bca8_backing[8192];
#define DAT_0023bca8 DAT_0023bca8_backing[0]
undefined2 DAT_0023be6c;
undefined2 DAT_0023be68;
undefined2 DAT_0023be70;
undefined2 DAT_0023be7c;
undefined2 DAT_0023be84;
undefined2 DAT_0023be78;
undefined2 DAT_0023be60;
undefined2 DAT_0023bd7c;
char s_Lev__d____2_2u__1_1u__2_2u__1_1u_00086e08[] = "Lev_%d_@_%2.2u.%1.1u_%2.2u.%1.1u";
byte DAT_0023bd84;
undefined1 DAT_00086e05;
undefined1 DAT_00086e06;
undefined DAT_00086e00_backing[8192];
#define DAT_00086e00 DAT_00086e00_backing[0]
short DAT_0023be90;
short DAT_0023be92;
short DAT_0023be94;
short DAT_0023bf00;
undefined2 DAT_0023bf02;
int DAT_000db500;
undefined2 DAT_0023bf04;
byte DAT_0023beb0;
byte DAT_0023beac;
undefined2 DAT_0023bea0;
short DAT_0023bea4;
short DAT_0023bf08;
undefined DAT_00086e70;
undefined4 DAT_0023bf50;
char DAT_00087944_backing[128];
char *DAT_00087944 = DAT_00087944_backing;
short DAT_0024af6c;
/* Deterministic, fixed-step substitute for the real wall-clock
   (read_realtime_clock_units(), itself Ordinal_535()>>2 -- SDL_GetTicks() scaled to
   4ms-per-unit) that movement_pacing_handler() (this file, ~line 56186)
   used to read directly for ALL of its internal timing, including the
   uVar6 delta that directly scales how far the player moves/turns each
   tick. Real elapsed time made movement distance sensitive to actual
   frame-delivery jitter -- fine for one live session, but meant a
   recorded input sequence (democapture.c) with tick-for-tick-identical
   keys held for tick-for-tick-identical durations still couldn't
   reproduce the exact same on-screen distance on replay, since the two
   sessions' real per-tick timing was never bit-for-bit identical (user-
   reported: "movement via input still seems to slightly overshoot...
   if input was 1:1"). Advanced once per real game tick by gx_stub.c's
   uw_pump_events() (see its own comment) by a fixed amount matching
   1000/60 ms in this same 4ms-per-unit scale, computed drift-free from
   the running tick count (not accumulated per-call, which would drift)
   -- movement becomes a pure function of TICK COUNT, exactly what the
   recorder already captures losslessly, eliminating this class of
   replay drift entirely instead of trying to reproduce real timing
   jitter. Deliberately unconditional (not just during record/playback)
   since the game is already vsync-locked to ~60Hz (gx_stub.c's own
   frame-budget cap), so this doesn't change how normal play feels.

   Deliberately NOT folded into read_realtime_clock_units() itself, even though that
   is literally the "what time is it" function movement_pacing_handler
   used to call and would have been the more obvious single place to
   fix -- read_realtime_clock_units() has ~65 other call sites across this file, and
   at least one (move_key_directional_step's own tail, ~line 56177:
   `do { iVar2 = read_realtime_clock_units(); } while ((uint)(iVar2-iVar1) < 0x18);`)
   busy-spins on it in a tight loop with NO event pump in between
   iterations, deliberately throttling a discrete step's real-world
   pacing. This clock only advances once per real uw_pump_events() call
   -- a caller spinning on it outside that cadence, like that loop, would
   see a frozen value and hang forever. Exposed instead via its own
   accessor, uw_frame_clock_ms() below, so a caller has to deliberately
   opt in rather than being silently affected by a global redefinition. */
unsigned int g_uw_frame_clock_units;
/* Accessor for g_uw_frame_clock_units -- see its own comment. Use this,
   not the raw global, from any new gameplay-tick-paced timing code (the
   same shape as movement_pacing_handler's own use) that wants
   deterministic, tick-count-driven pacing instead of read_realtime_clock_units()'s
   real wall-clock time. */
unsigned int uw_frame_clock_ms() {
  return g_uw_frame_clock_units;
}
char DAT_00087950_backing[128];
char *DAT_00087950 = DAT_00087950_backing;
char DAT_00087948_backing[128];
char *DAT_00087948 = DAT_00087948_backing;
undefined4 DAT_0023bf54;
byte DAT_0023bf58;
int DAT_000879ac;
undefined4 DAT_0023bea8;
char DAT_0023bf18;
// was DAT_00086dfc. movement_tick's enable gate for tick_mobile_objects
// (the real per-tick NPC AI + mobile-object dispatcher) -- declared but
// never assigned anywhere in this decompile, a permanently-false gate;
// see init_gameplay_session's own comment for the fix.
int g_npc_tick_enabled;
char DAT_00086e84;
int DAT_0023bf64;
char DAT_0023bf60;
uint DAT_0023bf5c;
undefined2 DAT_0023be9e;
undefined2 DAT_0023be9c;
undefined2 DAT_0023be9a;
undefined DAT_00086e38;
undefined DAT_00086e48;
char DAT_0023bf14;
byte DAT_0023bf10;
undefined DAT_00086e58;
short DAT_0023bf30;
short DAT_0023bf34;
short DAT_0023bf38;
short DAT_0023bf3c;
short DAT_0023bf40;
/* Was a lone `undefined` scalar, but grant_experience_points indexes
   it as a per-character-level XP-threshold table
   (`(&DAT_00086e87)[level]`), with the loop's own upper bound (0x10 =
   16) confirming at least 17 entries (0-16) are live; the very first
   access (by the raw current-level byte, before any bounds check) has
   no visible cap of its own, so widened with a safety margin rather
   than the bare minimum. */
undefined DAT_00086e87_backing[64];
#define DAT_00086e87 DAT_00086e87_backing[0]
int DAT_0024af8c;
char s_font5x6i_sys_00086e98[] = "font5x6i.sys";
/* Was `int` despite holding a real stack address (main_menu_loop:
   `DAT_0023bf6c = &local_82c;`) used in pointer arithmetic throughout
   this file -- truncating on this 64-bit host. */
char *DAT_0023bf6c;
ushort DAT_0023bf74;
/* populate_menu_button_bitmap_entry (main menu button record populator) used to split each
   loaded button bitmap's real pointer into 4 bytes and pack it directly
   into DAT_0023bf6c's record array -- fine for a 32-bit pointer on the
   original binary, but silently truncates a real 64-bit pointer here
   (confirmed via ASAN: draw_menu_item_list dereferencing the reassembled
   low-32-bits-only value, SEGV). Same "route the real pointer through a
   dedicated global instead of packing it into an undersized field"
   pattern as g_chargen_textfield_buf. Index formula (shared by
   populate_menu_button_bitmap_entry/draw_menu_item_list) is (selected?1:0) + button_index*4 -- a
   stride of 4 per button, not 2, so up to 4 buttons needs slots through
   index 13 (1 + 3*4); sized generously to 16. */
char *g_menu_button_bitmaps[16];
char s__DATA_CREDIT3_BYT_00086ea8[] = "\\DATA\\CREDIT3.BYT";
char s__DATA_CREDIT2_BYT_00086ebc[] = "\\DATA\\CREDIT2.BYT";
char s__DATA_CREDIT1_BYT_00086ed0[] = "\\DATA\\CREDIT1.BYT";
char s_opbtn_00086ee4[] = "opbtn";
char s__DATA_opscr_byt_00086eec[] = "\\DATA\\opscr.byt";
/* Was `int` despite holding a real malloc'd pointer (main_menu_loop:
   `DAT_0023bf70 = iVar4;` where iVar4 = Ordinal_1041(0x10000)), used in
   pointer arithmetic (`iVar9 + DAT_0023bf70`) -- truncating on this
   64-bit host. */
char *DAT_0023bf70;
void *LAB_0006a0ac(param_1)
unsigned int param_1;

{
  /* Same allocator-callback role as LAB_000415b0/LAB_000416e8/
     LAB_000416f8 (load_gr_resource_entries's param_4, "Ghidra couldn't resolve this
     address" -- see their comments): a no-op stub returning 0 here
     failed the whole "opbtn" resource batch even though the underlying
     OPBTN.GR file loaded successfully, which was fatal
     (report_fatal_error_and_exit(0x300d)) at this specific call site. */
  return Ordinal_1041(param_1);
}
char s__DATA_OPSCR_BYT_00086efc[] = "\\DATA\\OPSCR.BYT";
/* Read as a pointer (codewheel_letter_at_index/codewheel_index_of_letter both
   dereference it as `short *`), same truncated-pointer-in-an-int bug
   class as this project's other DAT_xxx symbols, but never assigned
   anywhere in the whole decompile -- whatever real 0x24(36)-entry
   character table (a-la "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ") it once
   pointed at wasn't recovered by Ghidra as initialized data. Left as-is
   (not guessed/fabricated) since the only caller chain that reads it
   (validate_codewheel_word) has zero callers itself in this build --
   entirely dead under check_registration_key_dialog's bypass. */
int DAT_00086f0c;
unsigned short u_BuildNo_00086f5c[] = u"BuildNo";
unsigned short u_Software_ZIO_Interactive_Ultima_U_00086f6c[] = u"Software\\ZIO_Interactive_Ultima_U";
int DAT_0023c108;
unsigned short u_Invalid_Registration_Key_Code____00086fc4[] = u"Invalid_Registration_Key_Code_!!";
unsigned short u_Error_00087008[] = u"Error";
unsigned short u_UUWI_00087014[] = u"UUWI";
undefined DAT_0023bf78_backing[8192];
#define DAT_0023bf78 DAT_0023bf78_backing[0]
/* Was `"<not_used_yet>"` -- underscores standing in for the real spaces
   (same garbled-placeholder class as the save-descriptions header
   string above and the save-name prompt fixed earlier this session).
   Real bytes confirmed via a Ghidra memory dump of the original binary
   at 0x87020 (`3c 6e 6f 74 20 75 73 65 64 20 79 65 74 3e 00`): the
   angle brackets were genuinely part of the string, just with real
   spaces instead of underscores between the words, and no trailing
   newline. */
char s__not_used_yet__00087020[] = "<not used yet>";
/* Was zero-initialized -- see DAT_000857a0's comment above. probe_save_slots
   appends this to DAT_000857a0 ("\SAVE0") to build each save-slot probe
   path, then substitutes the '0' with '1'..'4'; the already-recovered
   s__SAVE0_desc_00087078 == "\SAVE0\desc" spells out exactly what that
   concatenation should produce, confirming this suffix is "\desc". */
 undefined DAT_00087030_backing[8192] = "\\desc";
#define DAT_00087030 DAT_00087030_backing[0]
char s__PLAYER_DAT_00087088[] = "\\PLAYER.DAT";
/* Was `"Please_enter_a_Save_Game_file_an"` -- a garbled placeholder that
   just echoed this string's own auto-generated symbol name (underscores
   for spaces, truncated at Ghidra's naming-length cap) instead of the
   real recovered text; this is why the pause-menu's save/load name
   prompt never showed anything in the message scroll. Real bytes
   confirmed via Ghidra headless dump of 0x87094 in the original binary
   (`20 20 50 6c ... 45 6e 74 65 72 0a 00`): two leading spaces, no
   trailing period, a trailing newline before the NUL. */
char s_Please_enter_a_Save_Game_file_an_00087094[] = "  Please enter a Save Game file and press Enter\n";
char s__SAVE0_desc_00087078[] = "\\SAVE0\\desc";
 undefined DAT_00087084_backing[8192];
#define DAT_00087084 DAT_00087084_backing[0]
/* Was zero-initialized -- see DAT_000857a0's comment above. ensure_save_directory_exists
   appends this to a directory path before scanning it with the
   Ordinal_167/181 FindFirstFile/FindNextFile-shaped ordinals, matching
   the universal Win32 "\*.*" wildcard idiom for "list everything in this
   directory". */
undefined DAT_000870c8_backing[8192] = "\\*.*";
#define DAT_000870c8 DAT_000870c8_backing[0]
static undefined DAT_000870cc_backing[8192];
#define DAT_000870cc DAT_000870cc_backing[0]
/* Was `static undefined1 DAT_000870ec_backing[65536]` (an oversized,
   never-populated byte buffer) -- real per-flask X position for
   `hud_vitals_bar_tick` (the health/mana FLASK bar update function),
   [0]=health [1]=mana. Read via byte-scaled pointer arithmetic at
   every call site (`&DAT_000870ec + iVar1` where iVar1 is already a
   pre-scaled byte offset of 0 or 2, or `&DAT_000870ec + iVar1*2` in
   hud_vitals_threshold_shake where iVar1 is a plain 0/1 element index) -- kept
   byte-typed here rather than a natural short array, matching every
   existing call site instead of needing them all rewritten.
   Recovered via direct memory dump (Ghidra headless, `mem.getShort`):
   real values 248 (health) / 284 (mana), byte-encoded little-endian
   below. */
 undefined1 DAT_000870ec_backing[4] = { 248,0, 28,1 };  /* 248, 284 */
#define DAT_000870ec DAT_000870ec_backing[0]
/* Was a lone `undefined2 DAT_000870f2;` -- real data confirms this is
   simply index [1] of DAT_000870f0's own real array (0x870f2 ==
   0x870f0+2) -- see DAT_000870f0's comment below for the full table
   and writeup. Alias into it (as a real short lvalue at that byte
   offset) instead of a separate declaration, so `(&DAT_000870f2)
   [iVar3]`'s existing natural-short-array indexing at its own call
   sites keeps working unchanged. */
#define DAT_000870f2 (*(short *)(DAT_000870f0_backing + 2))
/* Was 2 lone `undefined1` scalars -- same "split symbol" bug as
   DAT_0023c224/DAT_0023c230 etc. (see DAT_0023c224's comment for the
   full writeup). DAT_0023c118/DAT_0023c128 are `hud_vitals_bar_tick`'s
   (the real health/mana FLASK bar update function) own current/target
   fill-level counters per flask (index 0=health, 1=mana), used
   throughout as `(&DAT_0023c118)[uVar2]`/`(&DAT_0023c128)[uVar2]`.
   With these as lone scalars, index [1] on each aliased the next
   global in this build's layout -- DAT_0023c118[1] read/wrote
   DAT_0023c128[0]'s own byte, and DAT_0023c128[1] read/wrote
   DAT_0023c224's first byte -- so the mana flask's fill-level
   tracking was corrupting the health flask's, and the compass-icon
   cluster besides. Fixed the same way, real 2-element arrays.

   FOLLOW-UP (this session, chasing the chain-hotspot/stats-panel
   revival): that first fix under-sized both arrays. set_hud_status_value
   and reset_hud_panel_animation_state's own reset loop (`while (iVar1 < 9)`) both index
   `(&DAT_0023c118)[i]`/`(&DAT_0023c128)[i]` up to i=8, and disassembly
   of the real chain-hotspot handler chain (0x6cfb0-0x6cfdc) confirms
   g_target_hud_panel's real address is exactly DAT_0023c118+6 -- so widened
   to real 9-element arrays and folded g_target_hud_panel/DAT_0023c11f/
   DAT_0023c120 (indices 6/7/8 of the first array) and g_committed_hud_panel/
   DAT_0023c12f (indices 6/7 of the second) in as aliases instead of
   the separate globals they were each declared as, which -- exactly
   like the original bug here -- put them at unrelated addresses the
   `(&DAT_0023c118)[6]`-style writes elsewhere in this file could never
   actually reach. That was why toggling the stats panel (index 6)
   silently did nothing: set_hud_status_value(6, target) wrote 6 bytes
   past a 2-byte array into unrelated memory instead of the real
   g_target_hud_panel the panel-transition ticker (tick_hud_panel_transition) reads. */
 undefined1 DAT_0023c118_arr[9];
#define DAT_0023c118 DAT_0023c118_arr[0]
#define g_target_hud_panel DAT_0023c118_arr[6]
#define DAT_0023c11f DAT_0023c118_arr[7]
#define DAT_0023c120 DAT_0023c118_arr[8]
 undefined1 DAT_0023c128_arr[9];
#define DAT_0023c128 DAT_0023c128_arr[0]
#define g_committed_hud_panel DAT_0023c128_arr[6]
#define DAT_0023c12f DAT_0023c128_arr[7]
/* Was a lone `undefined2 DAT_0023c224;` -- but used as a real 2-element
   array throughout (`(&DAT_0023c224)[iVar1]`/`[uVar2]` for index 0 AND
   1, including the creation loop in redraw_hud_panels that assigns
   BOTH elements). Same "split symbol" bug class as this project's
   other reconstructed tables (see e.g. DAT_00087130's own history) --
   index [1] read/wrote whatever global happened to sit 2 bytes past
   this one in OUR build's memory layout, which is not guaranteed (or
   even likely) to match the original binary's fixed layout. Confirmed
   live via a sprite-position trace: with the lone-scalar declaration,
   `(&DAT_0023c224)[1]` resolved to slot 8 -- the COMPASS BACKGROUND
   sprite's own real slot handle (DAT_0023c228, created a few
   statements later) -- so any code exercising the second status-icon
   slot (uVar2==1 in the two functions above) stomped the compass
   background's position to whatever it happened to pass for its own
   icon (typically (0,0), before DAT_000870ec/DAT_000870f2 -- the real
   FLASK X/Y tables -- were themselves recovered, see their own
   comments above). This was the real cause of the compass background
   staying stuck at
   (0,0) despite being created with the correct position. Real fix:
   make this a genuine 2-element array. */
 short DAT_0023c224_arr[2];
#define DAT_0023c224 DAT_0023c224_arr[0]
byte DAT_0023c11a;
short DAT_0023c228;
short DAT_0023c22c;
/* Was `FIXME[hud-compass-layout]: .data 0x87130 -- ... Ghidra never
   recovered the .data contents so every entry reads 0 and the needle
   is stuck at x=0 (part of the black block in the HUD top-left)`.
   Same class of gap as the 4 "unrecoverable" resource-name strings
   (see s_lfti_000859fc's comment) -- Ghidra just never created a
   labeled cross-reference to this .data, but the real bytes are
   perfectly intact in the binary. Recovered via direct memory dump
   (Ghidra headless, `mem.getShort`): 16 real values tracing a clean
   small ellipse (112-160), confirming this is genuine per-heading
   compass-needle X data, not padding. Combined with DAT_00087150
   below, the ellipse is centered around (136,142) in native
   (320x200-ish) coordinates -- right at the bottom edge of the 3D
   viewport (registered at native (52,20)-(223,132), see
   FUN_0005b758's caller), exactly where the "pedestal" decoration
   sits in a real reference screenshot of the shipping game. Verified
   live: with these real values, the needle no longer appears at the
   top-left corner (the previous x=0/y=0 bug); it now subtly cycles
   position on the pedestal as the player turns, matching the
   reference. */
 short DAT_00087130_arr[16] = {
  136, 128, 120, 116, 112, 112, 116, 124, 136, 144, 156, 160, 160, 156, 152, 144,
};
#define DAT_00087130 DAT_00087130_arr[0]
/* Was `FIXME[hud-compass-layout]: .data 0x87150 -- ...`. See
   DAT_00087130's comment -- real Y data recovered the same way,
   16 values tracing the same ellipse (132-153). */
 short DAT_00087150_arr[16] = {
  132, 134, 135, 138, 142, 146, 148, 151, 153, 151, 148, 146, 142, 138, 135, 134,
};
#define DAT_00087150 DAT_00087150_arr[0]
/* Was two lone `short` scalars -- same split-symbol bug as
   DAT_0023c11c/DAT_0023c230 etc. elsewhere in this file.
   `hud_dragon_reaction_tick` indexes `&DAT_0023c1e8 + iVar6`
   (iVar6=0/1, left/right dragon's HEAD-animation sprite-list slot
   handle -- a separate, dynamically-allocated overlay sprite driving
   the head's reaction animation, distinct from DAT_0023c230's own
   static head sub-sprite) and `reset_hud_panel_animation_state` resets both elements
   individually (`clear_sprite_list_slot_flag((int)DAT_0023c1e8);
   clear_sprite_list_slot_flag((int)DAT_0023c1ea);`) -- confirming these are really
   one 2-element array (0x23c1e8/0x23c1ea are exactly 2 bytes apart in
   the original binary), not two independent globals. As separate C
   symbols on this host, `(&DAT_0023c1e8)[1]` read/wrote whatever the
   compiler placed next instead of the real right-dragon head-
   animation slot -- confirmed live: this produced a garbage slot
   handle for the right dragon's head-animation sprite, which happened
   to land on/repurpose an unrelated already-allocated slot (an
   inventory item's, e.g. a red key), drawing that item's sprite
   instead of the dragon's own head animation. */
 short DAT_0023c1e8_arr[2];
#define DAT_0023c1e8 DAT_0023c1e8_arr[0]
#define DAT_0023c1ea DAT_0023c1e8_arr[1]
/* Same split-symbol bug, same fix: `hud_dragon_reaction_tick` indexes
   `&DAT_0023c1e4 + iVar6` (the animation-phase state byte per dragon
   side) and `reset_hud_panel_animation_state` resets both elements individually
   (`DAT_0023c1e6 = 0; ... DAT_0023c1e4 = 0;`) -- 0x23c1e4/0x23c1e6 are
   exactly 2 bytes apart in the original binary, confirming this is
   really one 2-element array too. */
 undefined2 DAT_0023c1e4_arr[2];
#define DAT_0023c1e4 DAT_0023c1e4_arr[0]
#define DAT_0023c1e6 DAT_0023c1e4_arr[1]
undefined2 DAT_0023c220;
ushort DAT_0023c1d8;
undefined1 DAT_0023c130;
undefined1 DAT_000870e0;
int DAT_0023c23c;
short DAT_0023c21c;
/* Same fix as DAT_00248410 above -- see its comment. */
char *DAT_0023cca4;
/* The three tables below all position the two dragons.gr decorations
   that frame the compass -- index 0 = left dragon, index 1 = right
   dragon -- built once in redraw_hud_panels (54155-54198). Each
   dragon is drawn as three sprite-list sub-sprites (head, body,
   wing/tail), created at fixed Y with X taken from these tables. Was
   `FIXME[hud-dragon-layout]: Ghidra never recovered the .data so
   every X reads 0 and both dragons pile up at the screen's left edge
   as a black rectangle` -- same class of gap as the compass-needle
   tables right above (see DAT_00087130's comment) and the 4
   "unrecoverable" resource-name strings (s_lfti_000859fc's comment):
   Ghidra just never labeled a cross-reference to this .data. Real
   values recovered via direct memory dump (Ghidra headless,
   `mem.getShort`). (The color-0-key transparency issue this comment
   used to also mention, in the sprite-list compositor flush_sprite_list_compositor,
   is a separate, still-open bug -- unrelated to position.) */

/* .data 0x87170 -- X of the dragon HEAD sub-sprite, [0]=left
   [1]=right. Sprite made by sprite_list_alloc_raw_entry(2,0xd,10) into
   DAT_0023c230[side], placed at ((&DAT_00087170)[side], 0x87), size
   0xd x 10 (redraw_hud_panels:54161); animation frame set from DAT_000871d4
   (54190). */
 short DAT_00087170_arr[2] = { 36, 228};
#define DAT_00087170 DAT_00087170_arr[0]
/* .data 0x87174 -- X of the dragon BODY sub-sprite, [0]=left
   [1]=right. Sprite made by sprite_list_alloc_raw_entry(2,0x25,0x17) into
   DAT_0023c234[side], placed at ((&DAT_00087174)[side], 0x92), size
   0x25 x 0x17 (redraw_hud_panels:54166); frame from DAT_000871d8 (54191). */
 short DAT_00087174_arr[2] = { 36, 204};
#define DAT_00087174 DAT_00087174_arr[0]
/* .data 0x871b4 -- X of the dragon WING/TAIL sub-sprite, [0]=left
   [1]=right. Sprite made by sprite_list_alloc_entry(0) into DAT_0023c238[side],
   placed at ((&DAT_000871b4)[side], 0x42), size 0xc x 0x1c
   (redraw_hud_panels:54169); frame is a literal 0x207b (left) /
   0x208d (right) at 54196, NOT from a table. */
 short DAT_000871b4_arr[4] = { 40, 224};
#define DAT_000871b4 DAT_000871b4_arr[0]

/* Was `FIXME[hud-dragon-frames]: .data 0x871d4 -- ... reads 0 now`.
   Same class of gap as the position tables above -- recovered via
   direct memory dump. Real values 0x206d (left) / 0x207f (right); the
   +0x12 left/right delta matches the wing/tail sub-sprite's own
   literal 0x207b/0x208d pair exactly, confirming this is the real
   dragons.GR left/right frame convention, not a guess. Read as
   `(&DAT_000871d4)[side]` and passed to sprite_list_set_frame_id as the frame arg
   for DAT_0023c230[side] (redraw_hud_panels:54190). */
 unsigned short DAT_000871d4_arr[2] = { 0x206d, 0x207f };
#define DAT_000871d4 DAT_000871d4_arr[0]
/* Was `FIXME[hud-dragon-frames]: .data 0x871d8 -- ... reads 0 now`.
   Real values 0x206e (left) / 0x2080 (right), same +0x12 delta.
   Frame arg to sprite_list_set_frame_id for DAT_0023c234[side] (redraw_hud_panels
   :54191, also FUN_0006dbe4:54753). */
 unsigned short DAT_000871d8_arr[2] = { 0x206e, 0x2080 };
#define DAT_000871d8 DAT_000871d8_arr[0]
/* HUD-panel/tab dispatch table (13 entries), read as
   `(&g_hud_panel_handlers)[index]` at 4 call sites (g_active_hud_panel/DAT_0023c134
   select the index -- which panel/tab is active). Same class of bug as
   DAT_00085668 above: link-time-initialized data in the original binary
   that nothing in this decompile ever writes, declared here as a single
   never-populated pointer instead of the real array -- so every one of
   those 4 calls jumped through NULL/garbage. Recovered the same way
   (Ghidra, reading UU.exe's .data directly and matching addresses
   against this file's own FUN_ names); index 3 is genuinely NULL in the
   original data, not a recovery gap. Since this was already declared as
   a bare pointer rather than a byte array, no caller-side index-math
   needs to change -- `(&g_hud_panel_handlers)[i]` already scales by the
   (now-real, 8-byte-on-this-host) pointer size. */
void (*const g_hud_panel_handlers_table[13])(void) = {
  (void(*)(void))refresh_equipment_display_if_visible, (void(*)(void))redraw_rune_bag_display, (void(*)(void))draw_stats_panel_content, 0,
  (void(*)(void))hud_vitals_bar_tick, (void(*)(void))hud_vitals_bar_tick, (void(*)(void))hud_compass_needle_tick, (void(*)(void))update_hud_status_icon_frame,
  (void(*)(void))hud_dragon_reaction_tick, (void(*)(void))hud_dragon_reaction_tick, (void(*)(void))tick_hud_panel_transition, (void(*)(void))hud_panel_wipe_transition_tick,
  (void(*)(void))advance_action_animation_frame,
};
#define g_hud_panel_handlers (g_hud_panel_handlers_table[0])
char s_panels_00087260[] = "panels";
/* Was 2 lone `undefined1` scalars -- same "split symbol" bug as
   DAT_0023c224/DAT_0023c230 etc. above: both are used throughout as
   real 2-element byte arrays (`(&DAT_0023c11c)[iVar6]`/
   `(&DAT_0023c12c)[iVar6]` for index 0 AND 1, including redraw_hud_
   panels's own creation loop). Fixed the same way. */
 undefined1 DAT_0023c11c_arr[2];
#define DAT_0023c11c DAT_0023c11c_arr[0]
 undefined1 DAT_0023c12c_arr[2];
#define DAT_0023c12c DAT_0023c12c_arr[0]
/* Was 3 lone `undefined2` scalars (DAT_0023c230/234/238) -- same
   "split symbol" bug as DAT_0023c224 (see its own comment for the
   full writeup): each is used throughout as a real 2-element array
   (`(&DAT_0023c23X)[iVar3]`/`[iVar6]` for index 0 AND 1, including
   redraw_hud_panels's own creation loop, which assigns both elements
   for all three in sequence). The real per-side addresses in the
   original binary are exactly 4 bytes apart (0x230/0x234/0x238),
   confirming each one really is a 2-element short array back to back,
   not 3 independent scalars -- so as lone scalars in this build, index
   [1] on each reads/writes whatever the compiler happened to place
   next, with no guarantee of matching the original layout (exactly
   the aliasing that stomped the compass background sprite via
   DAT_0023c224). Same "left dragon head/body/wing pile-up" report
   this affects -- fixed the same way, real 2-element arrays. */
 short DAT_0023c230_arr[2];
#define DAT_0023c230 DAT_0023c230_arr[0]
 short DAT_0023c234_arr[2];
#define DAT_0023c234 DAT_0023c234_arr[0]
 short DAT_0023c238_arr[2];
#define DAT_0023c238 DAT_0023c238_arr[0]
/* Was 3 separate `undefined2` scalars (DAT_0023c200/202/204) -- same
   split-symbol bug as DAT_0023c118/DAT_0023c128 just above (see that
   comment's full writeup, found chasing the same chain-hotspot/
   stats-panel revival): begin_hud_panel_flip/advance_hud_panel_flip both index
   `(&DAT_0023c200)[i]` for i=0,1,2 (3 grtile handles backing the
   panel-switch wipe transition), but as 3 independent globals they
   don't land in contiguous memory on this recompile, so the loop that
   allocates/checks all 3 only ever really touched DAT_0023c200 --
   DAT_0023c202/DAT_0023c204 (read directly by name elsewhere in this
   same function) stayed 0/uninitialized, so resolve_flip_grtile_slot(DAT_0023c202)
   returned a garbage grtile handle and crashed
   bitmap_blit_to_framebuffer the first time this code path ever ran.
   Also widened the element type from `undefined2` to `undefined4`:
   grtile_alloc_registered's return value (now that alloc_flip_grtile_slot
   actually calls it instead of stubbing out) is a real 4-byte opaque
   registry key -- 2 bytes isn't enough to round-trip it back through
   resolve_flip_grtile_slot's registry-key comparison. Not a concern
   while both allocator/resolver were stubs (every stored value was 0
   either way), but a real requirement now that they aren't. */
undefined4 DAT_0023c200_arr[3];
#define DAT_0023c200 DAT_0023c200_arr[0]
#define DAT_0023c202 DAT_0023c200_arr[1]
#define DAT_0023c204 DAT_0023c200_arr[2]
char DAT_000870dc;
char DAT_000870d8;
ushort DAT_0023c1dc;
/* Was lone `byte DAT_0023c11d;`/`byte DAT_0023c12d;` scalars -- but
   these are exactly the RIGHT-dragon (index 1) slot of the
   DAT_0023c11c_arr/DAT_0023c12c_arr 2-element arrays declared just
   above (0x23c11d = 0x23c11c + 1, 0x23c12d = 0x23c12c + 1 in the
   original binary), read by set_hud_status_value's iVar1==4 branch as
   "is the OTHER (right) dragon already mid-animation" checks. As
   separate standalone globals they never alias the real array, so
   they read back 0 forever (nothing else in this file ever writes
   them) -- set_hud_status_value's cross-side conflict logic always
   saw the right dragon as idle. Made real aliases instead. */
#define DAT_0023c11d DAT_0023c11c_arr[1]
#define DAT_0023c12d DAT_0023c12c_arr[1]
ushort DAT_0023c1e0;
undefined1 DAT_0023c11b;
byte DAT_0023c12a;
byte DAT_0023c150;
/* Was a lone `undefined4` scalar, but hud_panel_redraw_dispatch indexes 9 entries
   from it (`(&g_hud_panel_ticker_handlers)[0..8]`) as a function-pointer dispatch
   table and calls through them -- same lone-scalar-instead-of-a-real-
   array bug as everywhere else this project, except this one turned out
   to need no new Ghidra archaeology: 0x87230 is exactly
   g_hud_panel_handlers_table[4] (0x87220 + 4*4), and hud_panel_redraw_dispatch's 9-entry
   range (0x87230..0x87250) is exactly that table's remaining entries
   4-12 -- a stray duplicate alias into an already-recovered table, same
   shape as DAT_000856a4 aliasing into DAT_00085668_backing. */
#define g_hud_panel_ticker_handlers (g_hud_panel_handlers_table[4])
 undefined1 DAT_0023c1f0_backing[65536];
#define DAT_0023c1f0 DAT_0023c1f0_backing[0]
 undefined1 DAT_0023c1f8_backing[65536];
#define DAT_0023c1f8 DAT_0023c1f8_backing[0]
/* Was `undefined2 DAT_00087254;` -- split-symbol bug: real ARM code
   (confirmed via disassembly of FUN_0006d4a4/hud_vitals_bar_tick)
   computes `&DAT_00087254 + uVar2*2` for the mana slot, so this is a
   genuine 2-element short array (0=health, 1=mana shimmer/wraparound
   state), not a lone scalar. Also not zero-init bss like it looked --
   raw memory dump (Ghidra headless) showed real .data here: 0x2019
   (health) / 0x2032 (mana), i.e. each side starts equal to its OWN
   `local_2c` shimmer-reset constant (a "settled" starting state). */
 short DAT_00087254_arr[2] = { 0x2019, 0x2032 };
#define DAT_00087254 DAT_00087254_arr[0]
/* Was `static undefined1 DAT_000870f0_backing[65536]` (oversized,
   never populated) -- real per-step Y offset for the FLASK fill-level
   animation sprite in `hud_vitals_bar_tick`/`hud_vitals_threshold_shake` (the
   health/mana flask bar update), read via explicit byte-scaled
   pointer arithmetic (`&DAT_000870f0 + N*2`) at every call site, so
   kept byte-typed here rather than converting to a natural short
   array (would need editing 5 call sites for no behavioural gain).
   Recovered via direct memory dump (Ghidra headless, `mem.getShort`):
   14 real entries forming a smooth descending curve (liquid Y rises
   as fill increases), byte-encoded little-endian below (all values
   fit in one byte, high byte always 0):
     [0]=156 [1]=152 [2]=150 [3]=148 [4]=146 [5]=144 [6]=142 [7]=141
     [8]=140 [9]=139 [10]=137 [11]=135 [12]=133 [13]=131 [14..]=0
   `DAT_000870f2` (see its own comment) is simply this same array's
   real index [1]. */
 undefined1 DAT_000870f0_backing[32] = {
  156,0, 152,0, 150,0, 148,0, 146,0, 144,0, 142,0, 141,0,
  140,0, 139,0, 137,0, 135,0, 133,0, 131,0, 0,0, 0,0,
};
#define DAT_000870f0 DAT_000870f0_backing[0]
/* Was `static undefined1 DAT_00087112_backing[65536]` (oversized,
   never populated) -- real per-step HEIGHT for the same flask
   fill-level animation sprite (paired with DAT_000870f0's Y), read
   the same byte-scaled way (`&DAT_00087112 + N*2`). Recovered the
   same way: 13 real entries, a small rise-then-fall curve (the fill
   bubble growing then settling), byte-encoded little-endian:
     [0]=4 [1]=5 [2]=6 [3]=7 [4]=7 [5]=7 [6]=7 [7]=6
     [8]=5 [9]=4 [10]=4 [11]=4 [12]=4 [13..]=0 */
 undefined1 DAT_00087112_backing[32] = {
  4,0, 5,0, 6,0, 7,0, 7,0, 7,0, 7,0, 6,0,
  5,0, 4,0, 4,0, 4,0, 4,0, 0,0, 0,0, 0,0,
};
#define DAT_00087112 DAT_00087112_backing[0]
/* Real ARM code (hud_vitals_bar_tick's decreasing branch) reads this
   table at `&DAT_00087112 + iVar3*2 + 2`, i.e. one short PAST what the
   decompiler wrote as `(&DAT_00087112)[iVar3]` -- same "+2" sibling
   pattern as DAT_000870f2 vs DAT_000870f0, just not caught until
   verified against disassembly. */
#define DAT_00087114 (*(short *)(DAT_00087112_backing + 2))
/* .bss 0x23c240..0x23c24f: four short[2] rows of sprite handles for the
   HUD flask/vitals animation (hud_vitals_bar_tick / hud_dragon_reaction_tick), indexed
   `&row + param*2` with param in {0,1}. Ghidra split the region into four
   lone 1-byte `undefined` scalars, so the param==1 (`+2`) access ran off
   the end of a 1-byte global and read/wrote a neighbouring variable --
   the resulting garbage handle crashed sprite_list_set_lifetime (`param_1 * 0x14 +
   base` with a huge negative param_1). Back it with real contiguous
   storage; the `&sym + iVar1` byte indexing is unchanged. */
 char DAT_0023c240_vitals[16];
#define DAT_0023c240 DAT_0023c240_vitals[0]
#define DAT_0023c244 DAT_0023c240_vitals[4]
#define DAT_0023c248 DAT_0023c240_vitals[8]
#define DAT_0023c24c DAT_0023c240_vitals[12]
short DAT_0023c250;
/* .data 0x87178..0x871b7: four rows (x / y / w / h) of the dragon
   HEAD-animation overlay sprite's placement table (a separate,
   dynamically-allocated sprite driving the head's reaction animation
   -- see DAT_0023c1e8's own comment), read as `*(short *)(&row +
   iVar6*6)` at three call sites in hud_dragon_reaction_tick and
   handed to sprite_list_set_rect. Ghidra split it into two lone
   `undefined` scalars plus two `undefined *` pointer slots -- and
   `&PTR_DAT_00087198` was then cast through `(int)`, truncating the
   64-bit address (wild `*(short *)` read -> crash the first time the
   head animation played). Back each row with real storage and keep
   the byte-offset indexing.

   Was left as all-zero ("worst case the [overlay] sprite draws at
   0,0 with 0 size") because at the time nothing could reach this code
   at all -- set_hud_status_value's dragon-reaction branch wrote its
   request to the wrong global (see DAT_0023c11c's own comment), so
   hud_dragon_reaction_tick's "has a reaction been requested" gate
   never fired. Now that that's fixed, this table is genuinely read
   every time the animation plays -- confirmed live: with it still
   zeroed, the head-animation overlay drew a large blank/garbage rect
   at native (0,0), the exact top-left corner the compass pedestal
   occupies, visually stomping the compass needle every time (reported
   as "scrolling the messages resets the compass animation"). Recovered
   the real values the same way as everything else in this cluster
   (Ghidra headless, `mem.getShort`): indices 0-2 are the left
   dragon's 3 head-animation sub-rects, indices 3-5 the right dragon's;
   indices 6-7 of each row are genuinely unused by this table (H's
   happen to read back 40/224 -- that's DAT_000871b4's OWN data, the
   very next real table, not padding belonging here) so are left 0. */
 char DAT_00087178_arr[16] = {40,0, 48,0, 36,0, 204,0, 204,0, 200,0, 0,0, 0,0};  /* X: L 40/48/36, R 204/204/200 */
 char DAT_00087188_arr[16] = {156,0, 146,0, 146,0, 156,0, 146,0, 146,0, 0,0, 0,0};  /* Y: L 156/146/146, R 156/146/146 */
 char PTR_DAT_00087198_arr[16] = {33,0, 24,0, 37,0, 34,0, 24,0, 38,0, 0,0, 0,0};  /* W: L 33/24/37, R 34/24/38 */
 char PTR_DAT_000871a8_arr[16] = {14,0, 16,0, 23,0, 14,0, 16,0, 23,0, 0,0, 0,0};  /* H: L 14/16/23, R 14/16/23 */
#define DAT_00087178 DAT_00087178_arr[0]
#define DAT_00087188 DAT_00087188_arr[0]
#define PTR_DAT_00087198 PTR_DAT_00087198_arr[0]
#define PTR_DAT_000871a8 PTR_DAT_000871a8_arr[0]
/* Was a 64KB never-populated scratch buffer -- same "oversized
   placeholder" pattern as most of this file's other unrecovered .data
   gaps, just missed in the earlier pass that fixed the sibling
   DAT_00087178/DAT_00087188/PTR_DAT_00087198/PTR_DAT_000871a8 rect
   table right above (they're read/write neighbors in
   hud_dragon_reaction_tick, but this one's own comment never got
   written, so it stayed zero-filled while the others got fixed).
   `hud_dragon_reaction_tick` reads this as `*(short *)(&DAT_000871b8 +
   (iVar6*7+iVar5)*2)` -- iVar6=0/1 left/right dragon, iVar5=DAT_0023c250
   cycling 0-6 -- to pick the dragon TAIL sub-sprite's (DAT_0023c238)
   frame id for each step of its whip/lash animation. With this at 0
   the id resolved through resolve_sprite_id_to_frame's `id<0x1000`
   branch as an absolute OBJECTS.GR frame instead of the intended
   LFTI.GR-relative id, drawing whatever object happens to sit at that
   low absolute frame index (confirmed live: a red-key-shaped
   inventory item sprite, reported by the user, instead of the dragon
   tail). Recovered the real values the same way as the rect table
   (Ghidra headless, mem.getShort at 0x871b8): 7 frames per side, left
   dragon ramping 0x207b->0x207e and back, right dragon 0x208d->0x2090
   and back -- matches the ramp-up/ramp-down shape DAT_0023c250's own
   0-6 cycling implies. */
 const unsigned short DAT_000871b8_arr[14] = {
  0x207b, 0x207c, 0x207d, 0x207e, 0x207d, 0x207c, 0x207b,
  0x208d, 0x208e, 0x208f, 0x2090, 0x208f, 0x208e, 0x208d,
};
#define DAT_000871b8 (*(undefined1 *)DAT_000871b8_arr)
undefined DAT_0023c124;
short DAT_0023c254;
short DAT_00087258;
short DAT_0023c258;
int DAT_0023c20c;
byte DAT_0023c25c;
/* Real per-frame storage for the currently-loaded weapon-swing sprite
   set -- found by tracing weapon_swing_draw_tick's dropped argument
   to decode_gr_entry_bitmap forward: it needs the raw (still-
   compressed) .GR entry buffer for the frame currently being drawn,
   which nothing was ever storing anywhere before this. */
#define UW_WEAPON_SWING_FRAME_COUNT 28
void *g_weapon_swing_raw_frames[UW_WEAPON_SWING_FRAME_COUNT];
char s__DATA_weapons_dat_00087268[] = "\\DATA\\weapons.dat";
char s_weapons_0008727c[] = "weapons";
// was DAT_0023c198/DAT_0023c1b8 (.data 0x87198/0x871b8) -- per-frame
// Y/X screen-offset tables (one signed byte per frame, 28 frames) for
// the weapon-swing sprite set, read straight from weapons.dat by
// load_weapon_swing_sprites and consumed by weapon_swing_draw_tick to
// position each frame relative to the 3D viewport.
 undefined1 g_weapon_swing_frame_y_offset_backing[256];
#define g_weapon_swing_frame_y_offset g_weapon_swing_frame_y_offset_backing[0]
 undefined1 g_weapon_swing_frame_x_offset_backing[256];
#define g_weapon_swing_frame_x_offset g_weapon_swing_frame_x_offset_backing[0]
// was DAT_0023c210 -- the current frame's raw .GR entry pointer (see
// g_weapon_swing_raw_frames), set by weapon_swing_draw_tick right
// before decoding it -- was computed as `DAT_0023c214 +
// (short)(&DAT_0023c158)[frame]`. `DAT_0023c158` was declared as a
// lone 2-byte scalar despite being indexed up to 27 -- the same
// "Ghidra couldn't recover this table's real .data contents" shape as
// g_inventory_hotspot_table/DAT_00085668/etc. elsewhere in this file
// -- so that part of the expression read garbage for every frame but
// the first. `DAT_0023c214` (see its own declaration, just below) is
// real, but the intended packing scheme it and the lost offset table
// together addressed isn't recoverable, so this now points directly
// at g_weapon_swing_raw_frames[frame] instead -- one real per-frame
// allocation apiece rather than packed offsets into one shared
// buffer, matching how the file's other raw-GR-entry consumer
// (blit_object_sprite_by_frame) already reads a frame's real
// width/height straight from its own header bytes (entry[1]/entry[2])
// regardless of storage scheme.
char *g_weapon_swing_current_frame;
/* was DAT_0023c214, `int`-typed in both its own uw.h extern
   declaration and here -- app_main_loop (game.c) assigns it a real
   64000-byte Ordinal_1041 allocation (the same one it hands
   g_weapon_swing_current_frame right beside it, before per-frame use
   overwrites that one), truncating the pointer on this 64-bit host
   exactly like every other pointer-in-a-narrow-global bug in this
   project. Fixed the type; the buffer itself is otherwise unused now
   that g_weapon_swing_current_frame is resolved via
   g_weapon_swing_raw_frames instead (see that comment) -- kept only
   because app_main_loop still allocates and assigns it. */
char *g_weapon_swing_startup_scratch_buffer;
short DAT_0023c1ec;
undefined2 DAT_000870e8;
int DAT_0023c260;
char s__DATA_weapons_cm_00087284[] = "\\DATA\\weapons.cm";
undefined1 DAT_00202700_backing[256];
#define DAT_00202700 DAT_00202700_backing[0]
/* Was 2 lone `undefined2` scalars (DAT_0023c268/DAT_0023c270) -- same
   split-symbol bug as DAT_0023c118/DAT_0023c200 elsewhere in this
   file (see DAT_0023c118's own comment for the full writeup): both
   are indexed as real 3-element short arrays by their respective
   owners (update_ready_rune_slot_icons/update_light_source_color_icons, the mode-icon-highlight sprite
   setup for the left/right dragon decorations), each written via a
   `(&DAT_0023c26X)[i] = ...` one-time-init loop. As bare scalars, the
   out-of-bounds writes for i=1,2 landed on whatever the compiler
   placed next on THIS host -- empirically, DAT_0023c278 (see its own
   comment), corrupting it from 0 to 13 (a leftover sprite-handle
   value) the very first time redraw_hud_panels ever ran, which in
   turn permanently defeated begin_hud_panel_flip's own `DAT_0023c278==0`
   one-time-setup guard for the entire rest of the program -- found
   while chasing why the chain-hotspot/stats-panel flip's grtile setup
   never ran even after alloc_flip_grtile_slot/resolve_flip_grtile_slot
   were implemented for real. */
short DAT_0023c268_arr[3];
#define DAT_0023c268 DAT_0023c268_arr[0]
short DAT_0023c270_arr[3];
#define DAT_0023c270 DAT_0023c270_arr[0]
/* DAT_00087210/DAT_00087218: real per-index position lookup tables --
   recovered directly from the real ARM binary's .data (raw uint16 reads
   at 0x87210/0x87218, not a function to decompile). DAT_00087210 (used
   by update_ready_rune_slot_icons to X-position the 3 "ready to cast" rune-slot icons)
   is 176,191,206 -- evenly spaced by 15, confirming it's real per-slot
   data, not a scalar with garbage padding. Previously only index 0 had
   a nonzero (but still not verified-real) value; indices 1/2 read as
   0, landing both later slots' rune icons at the left screen edge --
   confirmed live: "left-clicking a rune draws it at the wrong X
   position in the spell-slot area" for any rune beyond the first
   selected. DAT_00087218 (used by update_light_source_color_icons, gated on
   `*(short*)(DAT_00085a6c+8)==1` -- a different, rarer UI state) is
   86,69,52, decreasing by 17; recovered the same way even though no
   live report has hit it yet. */
const undefined2 DAT_00087210_arr[3] = {176, 191, 206};
#define DAT_00087210 DAT_00087210_arr[0]
const undefined2 DAT_00087218_arr[3] = {86, 69, 52};
#define DAT_00087218 DAT_00087218_arr[0]
undefined2 DAT_0023c140;
int DAT_0023c278;
undefined2 DAT_0023c148;
undefined2 DAT_0023c14c;
undefined2 DAT_0023c144;
byte g_flip_grtile_cache_ready;
short DAT_0023c134;
 undefined DAT_00087298_backing[8192];
#define DAT_00087298 DAT_00087298_backing[0]
byte DAT_0023c208;
short DAT_0023c138;
short DAT_0023c13c;
short DAT_0023c110;
/* Was `u"dgijjjigd\\G&"` -- Ghidra misidentified this as a UTF-16
   string because its low bytes happen to be printable ASCII. It's
   really a 16-entry numeric squash-percentage curve for the chain
   flip animation's stage-by-stage width (symmetric: 100 down to 0 at
   the midpoint, back up to 92), used by squash_hud_panel_flip_rows as
   `table[stage]` and `table[stage+8]`. The string literal stopped at
   the first embedded NUL (index 12), silently truncating the real
   16-element array to 13 -- so `table[stage+8]` read out of bounds
   for stage 5/6/7 (indices 13/14/15), feeding garbage into
   DAT_0023c13c's stride computation and wild-writing past the grtile
   buffer in copy_hud_panel_flip_column's pixel-copy loop (this is what was
   corrupting the heap). Recovered via a direct memory dump of the
   real binary at 0x000871e0. */
unsigned short u_dgijjjigd_G__000871e0[16] = {
  100,103,105,106,106,106,105,103,100,92,71,38,0,38,71,92
};
char s__DATA_shades_dat_000872a4[] = "\\DATA\\shades.dat";
char s__DATA_mono_dat_000872b8[] = "\\DATA\\mono.dat";
char s__DATA_light_dat_000872c8[] = "\\DATA\\light.dat";
/* "currently-loaded shading level" for load_shading_level_config's `if (DAT_000872a0
   == param_1) return;` early-out. Ghidra dropped its initialiser (same
   silently-zero link-time-init class as DAT_00086e68 &c); left at 0 the
   first dungeon entry -- load_shading_level_config(0) -- matched and returned without
   ever reading SHADES.DAT, so the texture-LOD threshold DAT_00086b24
   stayed 0 and every visible tile drew with the 16x16 low-detail
   texture. Sentinel = no level loaded yet. */
char DAT_000872a0 = -1;
char s__DATA_xfer_dat_000872d8[] = "\\DATA\\xfer.dat";
char s_cLightTabs_allocation_error_____000872e8[] = "cLightTabs_allocation_error_...";
undefined1 DAT_0024fa38_backing[3072];
#define DAT_0024fa38 DAT_0024fa38_backing[0]
undefined1 DAT_0008730c_backing[8192];
#define DAT_0008730c DAT_0008730c_backing[0]
undefined1 DAT_0008730d;
/* Was a lone scalar, but roll_skill_use_improvement indexes it
   `(&DAT_00087308)[tier]` for tier 0..2 (classify_skill_training_tier's
   full range) as a per-tier probability threshold for
   Ordinal_2005(uVar2, random). Widened to the real 3-entry array this
   needs -- as a lone scalar, indices 1/2 read into whatever the
   compiler placed next (s_and_00087310's string data on this host),
   an arbitrary/wrong probability for tiers 1 and 2. Real per-tier
   values weren't recovered (Ghidra never surfaced this as initialized
   data), so left zero-initialized rather than guessed -- still an
   improvement over reading unrelated string bytes as a probability. */
undefined DAT_00087308_arr[3];
#define DAT_00087308 DAT_00087308_arr[0]
char s_and_00087310[] = "and";
/* Used as a NUL-terminated string (&DAT_00087318) by
   print_skill_improvement_list, joining middle entries of its skill-
   name list (likely ", " between the original real data). Ghidra never
   surfaced this as initialized string data, so it currently prints as
   an empty separator -- not guessed at, same as this project's other
   unrecovered-rodata symbols (e.g. DAT_00086f0c). */
undefined DAT_00087318;
char s_Chant_the_mantra__0008731c[] = "Chant_the_mantra:";
char s_fontchar_sys_00087330[] = "fontchar.sys";
char s__DATA_win1_byt_00087350[] = "\\DATA\\win1.byt";
char DAT_0023c27c;
char s__DATA_win2_byt_00087340[] = "\\DATA\\win2.byt";
char s_At__d__d_00087360[] = "At_%d_%d";
char s_Unable_to_defuse_trap__0008736c[] = "Unable_to_defuse_trap.";
char s_Your_bumbling_attempts_have_set_o_00087384[] = "Your_bumbling_attempts_have_set_o";
char s_was_successfully_dearmed__000873b0[] = "was_successfully_dearmed.";
char s_on_the_000873cc[] = "on_the";
undefined1 DAT_00087414_backing[65536];
#define DAT_00087414 DAT_00087414_backing[0]
char s__SOUND__0008750c[] = "\\SOUND\\";
char s_uw00_mod_00087514[] = "uw00.mod";
int DAT_00087454;
int DAT_00087448;
byte DAT_0023c3a8;
undefined4 *DAT_0023c3b8;
undefined1 DAT_0023c384;
undefined4 DAT_0023c280;
undefined4 DAT_0023c330;
short DAT_0023c32c;
int DAT_00087450;
undefined4 DAT_0008744c;
undefined DAT_0023c2b0_backing[8192];
#define DAT_0023c2b0 DAT_0023c2b0_backing[0]
/* Same per-sound-effect-id table shape as DAT_0023c2b0 just above (all
   four indexed by play_positional_sound_effect's own `id*5`-stride
   iVar10) -- were lone scalars, so every id past 0 read into whatever
   the compiler placed next, corrupting the volume/pan parameters
   play_positional_sound_effect derives for any sound but the first.
   Widened to match DAT_0023c2b0_backing's own generous sizing (max
   real index is 0xff*5+4=1279, given the 8-bit id field). */
undefined DAT_0023c2b1_backing[8192];
#define DAT_0023c2b1 DAT_0023c2b1_backing[0]
undefined DAT_0023c2b2_backing[8192];
#define DAT_0023c2b2 DAT_0023c2b2_backing[0]
undefined DAT_0023c2b3_backing[8192];
#define DAT_0023c2b3 DAT_0023c2b3_backing[0]
byte DAT_0023c39c;
/* allocate_and_play_sound_channel indexed these two by raw hardcoded
   original-binary literal addresses (0x23c338/0x23c350) rather than
   real declared globals -- same "hardcoded address" bug class as
   probe_save_slots's -0x87020 and the g_inv_hotspot fix elsewhere in
   this file. No symbol was ever recovered at either address (nothing
   else in the whole decompile references them), so on this 64-bit
   recompile those writes landed on literal address 0x23c338/0x23c350
   in the process's own address space -- unmapped, so a guaranteed
   SIGSEGV the first time a sound effect played. Declared as the real
   4-entry (one per sound channel) per-channel state/group arrays this
   indexing implies and rewritten to index them properly. */
byte g_sound_channel_state[4];
ushort g_sound_channel_group[4];
undefined DAT_0023c3d4_backing[8192];
#define DAT_0023c3d4 DAT_0023c3d4_backing[0]
int DAT_0023c3bc;
int DAT_0023c378;
undefined1 DAT_000873e0_backing[65536];
#define DAT_000873e0 DAT_000873e0_backing[0]
undefined4 DAT_00087458;
undefined1 DAT_00087520_backing[32768];
#define DAT_00087520 DAT_00087520_backing[0]
undefined1 DAT_00241f08_backing[32768];
#define DAT_00241f08 DAT_00241f08_backing[0]
uint DAT_00202094;
/* Was `uint` (4 bytes), truncating the real object pointer stored here
   (confirmed by its own assignments -- `DAT_00202098 = g_player_object;`/
   `= param_1;` where param_1 is a real `ushort *` object pointer right
   next to a parallel `g_selected_object = param_1;` -- and its readers,
   e.g. `finish_object_use(DAT_00202098,...)`/`*(ushort*)(DAT_00202098+6)`,
   all treating it as a pointer). Same truncated-pointer-global bug class
   as everywhere else in this project (g_player_object itself, etc.) --
   on this 64-bit host the upper 32 bits of any stored pointer were
   silently dropped, corrupting DAT_00202098 for every later reader.
   The "held item currently being used" global driving the item-use
   dispatch chain (finish_object_use and friends). */
char *DAT_00202098;
undefined1 DAT_00087604_backing[65536];
#define DAT_00087604 DAT_00087604_backing[0]
undefined *PTR_FUN_00087614;
/* was check_scheduled_object_location_callback. Stored into the DAT_00201c9c generic no-arg
   callback slot (uw.c ~30449, `(*DAT_00201c9c)();`) rather than called
   directly. `*DAT_00072284` was a literal-pool constant resolving to
   the already-named player-stats struct pointer DAT_00086df8; reads a
   nibble from it at offset 0x5e and hands it (plus a fixed msgid 0x126)
   to the already-recovered check_scheduled_object_level_match. */
void check_scheduled_object_location_callback()
{
  check_scheduled_object_level_match(*(byte *)(DAT_00086df8 + 0x5e) & 0xf,0x126);
  return;
}
undefined DAT_0008762c_backing[8192];
#define DAT_0008762c DAT_0008762c_backing[0]
// DAT_00087630 and DAT_00087634 are further fields (offsets +4 and
// +8) in this same damage-tier table, not standalone globals -- both
// were declared as lone bytes and then indexed with the table's own
// `[tier]` stride by damage_all_objects_at_tile (dice-sides and
// damage-type-id fields alongside DAT_0008762c's dice-count field).
// Aliased into the same backing array, matching the
// DAT_001007da/DAT_001007e2/DAT_001007ed fix in an earlier pass.
#define DAT_00087630 DAT_0008762c_backing[4]
#define DAT_00087634 DAT_0008762c_backing[8]
char *DAT_0023c3e8;
/* Was `int`, truncating the real pointer assigned to it
   (`DAT_0023c3e8 + 0x500`, a genuine 64-bit heap pointer on this host) --
   every comparison against it (`DAT_0023c3ec <= someRealPointer`) then
   always came out true regardless of the real slot table's size, so
   sprite_list_alloc_entry (the HUD button-slot allocator) always believed the table
   was full and returned -1 on its very first call, crashing the first
   caller that tried to use that "slot". */
char *DAT_0023c3ec;
char *DAT_0023c40c;
/* Same "was `int`, truncating a real pointer" bug as DAT_0023c3ec right
   above -- assigned `DAT_0023c40c + 0x100` (a real 64-bit pointer) and
   then compared against/derived into real `ushort *` locals throughout
   flush_sprite_list_compositor and friends. */
ushort *DAT_0023c414;
char *DAT_0023c3e4;
/* Same truncation bug as DAT_0023c414/DAT_0023c3ec above, though this one
   is never read back anywhere in this decompile -- fixed for consistency
   regardless. Its assignment (init_sprite_list_buffers) computes it from
   DAT_0023c40c + 0x100, the same expression as DAT_0023c414, rather than
   from DAT_0023c3e4 (the buffer it's presumably meant to bound) -- looks
   like a genuine bug already present in the original, not a decompile
   artifact; left as-is since it's dead either way. */
char *DAT_0023c410;
undefined2 DAT_0023c41c;
/* Sprite-list record status-word bit flags (.data ~0x87638). Ghidra
   split these off as lone `ushort` scalars and never recovered their
   values, so they were all 0 -- which made the whole sprite-list
   compositor (flush_sprite_list_compositor & helpers: sprite_list_alloc_entry/76194 slot alloc,
   sprite_list_set_frame_id frame set, sprite_list_queue_slot_redraw bucketing) inert: the free-slot
   scan `(DAT_00087638 & status) == 0` always matched slot 0, and the
   compositor's draw gate `(status & DAT_0008763c) != 0` was never true,
   so the HUD compass + dragon.GR decorations were never drawn at all.
   Reconstructed as 5 distinct high bits (exact original values aren't
   recoverable -- UU.exe's .data doesn't map to these Ghidra addresses --
   but only their distinctness and the mask complements below matter). */
#define DAT_00087638 0x8000u   /* slot allocated / in use */
#define DAT_0008763c 0x4000u   /* slot has a frame set -> compositor draws it */
#define DAT_00087640 0x2000u   /* slot freshly created -> needs bg-restore setup */
#define DAT_00087644 0x1000u   /* slot's background captured -> restore pending */
#define DAT_00087648 0x0800u   /* alt-draw path / created while transparent-mode */
ushort DAT_0023c400;
short DAT_0023c3f4;
/* AND-mask complements of the flags above -- each used once, to clear one
   status bit (clear_sprite_list_slot_flag hide: clear "has frame"; compositor loop 1:
   clear "needs restore setup" / "restore pending"). .bss, never
   initialised in this decompile -> were 0 -> those clears wiped the
   whole status word. */
#define DAT_0023c418 ((ushort)~0x4000u)   /* ~DAT_0008763c */
#define DAT_0023c408 ((ushort)~0x2000u)   /* ~DAT_00087640 */
#define DAT_0023c3f0 ((ushort)~0x1000u)   /* ~DAT_00087644 */
char *DAT_0023c3fc;
undefined4 *DAT_0023c404;
undefined2 DAT_0023c59e;
undefined2 DAT_0023c5a0;
char *DAT_0023c44c;
char *DAT_0023cef0;
/* Same fix as DAT_00248410 above -- see its comment. */
char *DAT_0024ad58;
int DAT_000876c8;
int DAT_0024af60;
undefined4 DAT_0023c648;
unsigned short u_UltimaUW_00087678[] = u"UltimaUW";
unsigned short u_Ultima_Under_World_00087690[] = u"Ultima_Under_World";
unsigned short u_Software_Apps_ZIO_Interactive_Ul_000877a4[] = u"Software\\Apps\\ZIO_Interactive_Ul";
char s__Program_Files_ZIO_Interactive_U_00087804[] = "\\Program_Files\\ZIO_Interactive\\U";
unsigned short u_InstlDir_00087838[] = u"InstlDir";
unsigned short u_Software_Apps_ZIO_Interactive_Ul_0008784c[] = u"Software\\Apps\\ZIO_Interactive_Ul";
 undefined1 DAT_0023cdb0_backing[32768];
#define DAT_0023cdb0 DAT_0023cdb0_backing[0]
/* DAT_0023cdb8/DAT_0023cdbc/DAT_0023cdc0 are Ghidra-split field accesses
   into the SAME GXGetDisplayProperties() struct that gets memcpy'd byte-
   by-byte into DAT_0023cdb0 (cbxPitch/cbyPitch/cBPP at struct offsets
   8/0xc/0x10 -- see the copy loop in FUN_00077170ish near GXOpenDisplay).
   Originally on the 32-bit binary these were just literal offsets into
   the same global buffer; declaring them as independent globals (as an
   earlier pass did) meant the copy loop populated this buffer while
   these "separate" globals stayed permanently zero, so the present/blit
   gate `DAT_0023cdc0 == 0x10` (checking cBPP==16) never passed and the
   real framebuffer was never blitted to the screen. Aliased back onto
   the backing buffer at their real offsets to fix that. */
#define DAT_0023cdb8 (*(int *)(DAT_0023cdb0_backing + 8))
#define DAT_0023cdbc (*(int *)(DAT_0023cdb0_backing + 0xc))
#define DAT_0023cdc0 (*(int *)(DAT_0023cdb0_backing + 0x10))
undefined1 DAT_0023ce10_backing[65536];
#define DAT_0023ce10 DAT_0023ce10_backing[0]
/* DAT_0023ce1c/28/34/40/4c/58/64 are the same GXGetDefaultKeys() struct's
   remaining 7 button.vk fields (b/c/start/up/down/left/right, each 0xc
   bytes after the previous one -- see gx_stub.c's GxKeyEntry) as
   DAT_0023ce10 (the "a" button). Same bug DAT_0023cdb0's comment above
   already describes for GXGetDisplayProperties: create_main_window_and_init_display populates
   this whole 0x60-byte struct with one sequential byte-copy loop
   starting at `&DAT_0023ce10`, but every field past the first had been
   declared as its own independent global instead of an alias into that
   same backing buffer -- so the copy's bytes for b/c/start/up/down/
   left/right all landed harmlessly in DAT_0023ce10_backing's own unused
   tail (it's oversized, 65536 bytes, same as every other recovered-
   table backing array in this file) while the real separate globals
   stayed at their zero-initialized default forever. Concretely: pressing
   Enter (VK_RETURN, the real start.vk) never matched `DAT_0023ce34` (a
   permanent 0), so `handle_keyboard_message` fell through to the generic raw-vk
   fallback instead of recognizing it as the "start button" movement
   command -- silently breaking every A/B/C/Start-button-driven input
   this whole session's demo scripts (which use Enter throughout) relied
   on, though none of that was diagnosed until this fix. */
#define DAT_0023ce1c (*(ushort *)(DAT_0023ce10_backing + 0xc))
#define DAT_0023ce28 (*(ushort *)(DAT_0023ce10_backing + 0x18))
#define DAT_0023ce34 (*(ushort *)(DAT_0023ce10_backing + 0x24))
#define DAT_0023ce40 (*(ushort *)(DAT_0023ce10_backing + 0x30))
#define DAT_0023ce4c (*(ushort *)(DAT_0023ce10_backing + 0x3c))
#define DAT_0023ce58 (*(ushort *)(DAT_0023ce10_backing + 0x48))
#define DAT_0023ce64 (*(ushort *)(DAT_0023ce10_backing + 0x54))
HWND__ *DAT_0023c548;
undefined *PTR_GXOpenDisplay_000841ec;
undefined *PTR_GXOpenInput_000841f0;
undefined *PTR_GXGetDisplayProperties_000841e0;
undefined *PTR_GXGetDefaultKeys_000841f8;
unsigned short u_HP_Jornada_540_000876cc[] = u"HP,Jornada_540";
char s__Program_Files_ZIO_Interactive_U_000876ec[] = "\\Program_Files\\ZIO_Interactive\\U";
unsigned short u_Software_Apps_ZIO_Interactive_Ul_0008771c[] = u"Software\\Apps\\ZIO_Interactive_Ul";
char s__Program_Files_ZIO_Interactive_U_00087774[] = "\\Program_Files\\ZIO_Interactive\\U";
// DAT_000830b0 and UNK_000830b4 are the same {int msg_id; void
// *handler;} 8-byte-stride table (dispatch_window_message walks
// msg_id entries from &DAT_000830b0 via an `int*`, and reads the
// matching handler from UNK_000830b4 + index*8 -- exactly
// DAT_000830b0's own address + 4, i.e. the SAME struct's second
// field), not two independent globals. Both were declared as a lone
// byte / a separately-backed array, so the `int*` walk read past
// DAT_000830b0's 1-byte allocation into unrelated memory. Aliased
// into one shared backing array at their real relative offsets.
undefined1 DAT_000830b0_backing[65536];
#define DAT_000830b0 DAT_000830b0_backing[0]
#define UNK_000830b4 DAT_000830b0_backing[4]
undefined *PTR_GXCloseInput_000841e4;
undefined *PTR_GXCloseDisplay_000841e8;
undefined *PTR_GXSuspend_000841dc;
undefined *PTR_GXResume_000841f4;
byte DAT_0024af80;
undefined4 DAT_0024af88;
/* DAT_0024bfa0-family (6 arrays) were already widened once (from a
   pre-this-session pass) to 8200 bytes, but register_interned_string indexes with a
   0x804(2052)-byte stride and DAT_0024cfc0 (the record count) grows
   unboundedly as new entries are registered at runtime -- 8200 bytes
   only covers ~4 records, and ASAN caught real startup traffic already
   exceeding that. Widened further to a generous 64-record margin. */
undefined1 DAT_0024bfa0_backing[1052672];
#define DAT_0024bfa0 DAT_0024bfa0_backing[0]
undefined1 DAT_0024bfa1_backing[1052672];
#define DAT_0024bfa1 DAT_0024bfa1_backing[0]
undefined1 DAT_0024bfa2_backing[1052672];
#define DAT_0024bfa2 DAT_0024bfa2_backing[0]
undefined1 DAT_0024bfa3_backing[1052672];
#define DAT_0024bfa3 DAT_0024bfa3_backing[0]
undefined1 DAT_0024bfa4_backing[1052672];
#define DAT_0024bfa4 DAT_0024bfa4_backing[0]
undefined1 DAT_0024bfa5_backing[1052672];
#define DAT_0024bfa5 DAT_0024bfa5_backing[0]
/* The record-registration function (near FUN_00078820, "the string-
   interning cache") splits a real char* pointer byte-by-byte across
   these FOUR SEPARATE byte-plane arrays at the SAME index (byte0 in
   bfa2[i], byte1 in bfa3[i], byte2 in bfa4[i], byte3 in bfa5[i]) --
   capturing only the pointer's low 32 bits even before this port's
   64-bit truncation concerns. A side table of real pointers, indexed
   the same way (record*0x201+slot, i.e. the byte-plane index /4) is
   used instead wherever the real pointer is needed. Sized to match
   DAT_0024bfa2_backing's total addressable slot count (1052672/4). */
char *g_bfa2_real_ptrs[263168];
/* Was undersized at 8200 bytes (~4 records) while their DAT_0024bfa0-
   family siblings (same 0x804-byte-stride, same DAT_0024cfc0 record
   count, same growing-table indexing -- see that comment above) were
   already widened to 1052672 bytes. Both are indexed identically
   (`sVar5 * 0x804`, sVar5 up to DAT_0024cfc0-1) by the exact same
   string-resource-cache registration path (get_message_string), so once
   more than ~4 pages register at runtime -- already observed for the
   sibling arrays -- this pair silently read/wrote out of bounds.
   Widened to match. */
undefined1 DAT_0024c7a2_backing[1052672];
#define DAT_0024c7a2 DAT_0024c7a2_backing[0]
undefined1 DAT_0024c7a3_backing[1052672];
#define DAT_0024c7a3 DAT_0024c7a3_backing[0]
undefined4 DAT_0024bf98;
/* Declared char* despite always being allocated/read/cast as a single
   2-byte count (see open_strings_pak_file: `(short *)Ordinal_1041(2)`, a 2-byte
   read into it, then `*DAT_0024cfb8` used as the item count). That
   mismatch meant every *DAT_0024cfb8 dereference only ever read the
   *first byte* of the real 2-byte count as a signed char -- for
   STRINGS.PAK's real (large, >127) count this came out negative, and
   `(int)*DAT_0024cfb8 << 2` produced a huge garbage byte count
   (0xFFFFFB94 observed) passed straight to fread() as `unsigned int
   size`, overflowing the undersized buffer Ordinal_1041 allocated for
   the same corrupted (and clamped-to-4096-by-the-allocator's-own-sanity-
   check) size. This was corrupting the heap on nearly every run --
   almost certainly the root cause of the "free_list_checksum_botch"-style
   intermittent SIGABRT documented in the README, since a heap overflow's
   corruption is only detected whenever some later, unrelated free()
   happens to stumble on the mangled metadata. */
unsigned short *DAT_0024cfb8;
char *DAT_0024cfa8;
short DAT_0024cfc0;
char s_strings_pak_000878c0[] = "strings.pak";
short DAT_0024cfb4;
undefined2 DAT_000878bc;
/* decode_strings_pak_entry's decoded-string ring buffer: DAT_0024cfb4 cycles
   through offsets 0, 0x200, 0x400, ... wrapping back to 0 once it
   would reach 0x1000 (4096), and each slot can hold up to a 0x200-byte
   decoded string. Declared as a single scalar byte, this let every
   decode past the very first 512-byte slot write far out of bounds --
   confirmed via an lldb watchpoint that this overflow is what corrupts
   DAT_0024bf98 (the compressed-string file handle, coincidentally laid
   out 0x1000 bytes after this one in our translation) into garbage
   partway through the very first character-generation screen, which is
   the root cause of the "most chargen text doesn't render" bug: once
   DAT_0024bf98 is corrupted, every subsequent compressed-string decode
   for the rest of the process fails. */
undefined1 DAT_0024af98_backing[4096];
#define DAT_0024af98 DAT_0024af98_backing[0]
undefined2 DAT_0024cfbc_backing[8192];
#define DAT_0024cfbc DAT_0024cfbc_backing[0]
/* was `int` -- truncated pointer to a 64-bit address on assignment in
   spawn_creature_death_loot (&DAT_001007d0 + index*0x30), causing spawn_creature_treasure_drop to
   dereference a garbage address (crash in demo_critter_orbit_cardinal.txt,
   EXC_BAD_ACCESS at uw.c:70173). Sibling DAT_00101404, assigned via the
   identical pattern, is correctly `char *`. */
// was DAT_0024cfc4
char *g_despawn_creature_record;
// Was a lone `undefined1` scalar, but its only use (spawn_creature_
// treasure_drop, src/ai.c) is `(&DAT_002034b5)[cVar4 * 0xd]` -- a
// 13-byte-stride record table indexed by a derived level/tier value,
// same "lone byte indexed as an array" bug class fixed throughout
// this project. Widened generously, matching this file's other such
// tables, since indexing past element 0 previously just read
// whatever adjacent BSS happened to follow it.
undefined1 DAT_002034b5_backing[8192];
#define DAT_002034b5 DAT_002034b5_backing[0]
char s_on_what__000878e0[] = "on_what?";
undefined1 DAT_000878ec_backing[32768];
#define DAT_000878ec DAT_000878ec_backing[0]
char s_That_000878f4[] = "That";
char s_is_locked__000878fc[] = "is_locked.";
char s_is_empty__0008790c[] = "is_empty.";
/* Was a lone `undefined` scalar, but the real class6 variant-effect
   lookup (uw.c ~46760, class6_variant_effect_table_lookup) indexes it
   as `&DAT_0024cfe0 + nibble` for nibble 0..0xf, and its boot-time
   loader (load_class6_variant_effect_table) reads exactly 0x10 bytes
   into it -- same lone-scalar-treated-as-array bug class fixed
   repeatedly elsewhere in this file. */
undefined1 DAT_0024cfe0_backing[8192];
#define DAT_0024cfe0 DAT_0024cfe0_backing[0]
char *DAT_0024cff4;
/* HACK: was `undefined4` -- truncated a real 64-bit object pointer.
   Same bug class as DAT_0024cff4 right above (already a real pointer
   type) and countless other fixes throughout this file: apply_trap_or_link_effect
   stores its own real `ushort *` param_2 here, and it's read back as a
   pointer both directly (resolve_skill_gated_unlock_or_use's own param_2 at both call sites
   below) and via dereference (`*(byte*)(DAT_0024cff0+1)` further
   down). Confirmed live (bug-pull-chain-crash.txt, a saved repro):
   using a pull chain crashed with EXC_BAD_ACCESS at a wild address
   (0x4c029128, an obviously-truncated 32-bit value) dereferenced in
   dispatch_trap_type_effect -- traced back through apply_trap_or_link_effect's own matching
   param_3 truncation (fixed at its own declaration, see that
   function's comment) to this global being the same bug one hop
   earlier in the same call chain. */
ushort *DAT_0024cff0;
char s_Look__it_s_a_text_trap_00087918[] = "Look,_it's_a_text_trap";
short DAT_0024cfd0;
short DAT_0024cfd8;
undefined4 DAT_0024cff8;
undefined4 DAT_0024cfd4;
undefined DAT_0007e644_backing[8192];
#define DAT_0007e644 DAT_0007e644_backing[0]
undefined DAT_00088640_backing[8192];
#define DAT_00088640 DAT_00088640_backing[0]
short DAT_002506f0;
undefined2 DAT_002029c8;
undefined2 DAT_0024fa14;
undefined2 DAT_0024d00c;
undefined1 DAT_0024d010;
char s_very_near_00087954[] = "very_near";
undefined *DAT_00250704;
undefined2 DAT_00250714;
// was DAT_00087960
 undefined1 g_msg_scroll_panel_state_backing[65536];
#define g_msg_scroll_panel_state g_msg_scroll_panel_state_backing[0]
undefined4 DAT_00250708;
undefined4 DAT_0025071c;
/* Was a lone `undefined` (1-byte) scalar, but used throughout this
   file as the BASE POINTER of a whole message-scroll-panel-state
   struct (DAT_00250704 = &g_msg_scroll_panel_state_conv, then read/written at offsets
   up to at least 0x17 -- same "split symbol" bug class as
   g_msg_scroll_panel_state's own sibling struct a few lines above, which already
   got the same fix). Confirmed live via lldb: entering NPC conversation
   mode (select_msg_scroll_mode_conversation, DAT_00250714==1) points DAT_00250704 at this
   1-byte variable, so every field read past its own single byte --
   including the panel's own width (+6) and cursor-x (+8) -- silently
   reads whatever unrelated byte happens to sit next to it in this
   build's layout (observed: width=0, cursor-x=24576, both garbage).
   With width 0, every string "doesn't fit", so message_scroll_print_
   wrapped's -> msg_scroll_draw_wrapped_span -> msg_scroll_wrap_split_line
   word-wrap chain always takes the "no space found" fallback, which
   destructively NULs out its own working copy of the text while
   hunting for a split point that can never satisfy a 0-wide line,
   ultimately drawing nothing real -- this is why Bragit's dialogue
   never appeared in the scroll panel. Widened to match g_msg_scroll_panel_state's
   own oversized-safety convention, AND seeded with the real 28-byte
   (0x1c) struct dumped straight from the original binary at 0x87978
   (Ghidra headless, mem.getBytes) -- unlike g_msg_scroll_panel_state,
   which gets its real geometry written at runtime by msg_scroll_panel_init,
   nothing in this file ever calls that for the conversation-mode
   struct, so its ONLY source of real values is this original .data
   (confirmed real: struct ends exactly at 0x87994, the very next
   symbol, s__MORE__00087994). Kept byte-typed rather than converted to
   a real C struct, matching the health/mana flask fix's own precedent
   (see compass-hud-position-fix's memory) -- every call site already
   does its own byte-offset pointer arithmetic against this base. */
// was DAT_00087978
undefined1 g_msg_scroll_panel_state_conv_backing[65536] = {
  0x34,0x00,0x84,0x00,0x38,0x00,0xdb,0x00,0x3b,0x00,0x36,0x00,0x3b,0x00,0x36,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x2e,0x00,0x01,0x00,0x00,0x00,
};
#define g_msg_scroll_panel_state_conv g_msg_scroll_panel_state_conv_backing[0]
short DAT_00250724;
short DAT_00250728;
short DAT_00250710;
char s__MORE__00087994[] = "[MORE]";
undefined4 DAT_00250720;
short DAT_0025070c;
/* Was a bare 1-byte `undefined` scalar -- FUN_0008090c's yes/no dialog
   takes its address and passes it to message_scroll_print_wrapped, so it
   needs to be a real string. Real bytes confirmed via a Ghidra memory
   dump of the original binary at 0x8799c: "No". Same bug class as the
   save-slot label fix earlier this session (Ghidra typed it as a scalar
   instead of generating a garbled placeholder string). */
// was DAT_0008799c
char s_No_0008799c[] = "No";
/* Same fix as s_No_0008799c above: real bytes at 0x879a0 are "Yes". */
// was DAT_000879a0
char s_Yes_000879a0[] = "Yes";
/* Reused-global-holding-a-real-string pattern (see the s_scroll_newline_0008522c
   comment far above): scroll_text_entry_prompt's ESC-cancel path prints
   `&s_dash_000879a4` with no write beforehand. Real bytes at 0x879a4: "-". */
// was DAT_000879a4
undefined s_dash_000879a4_backing[8192] = "-";
#define s_dash_000879a4 s_dash_000879a4_backing[0]
/* Same pattern: scroll_text_entry_prompt defaults its prompt-before-the-input-field
   text to `&s_scroll_prompt_arrow_000879a8` whenever the caller passes a NULL label (the
   save-name-entry call site does exactly this) -- real bytes at 0x879a8
   are ">" , the leading caret shown before the text cursor. Left zero
   (empty string) by this backing array's C default, so that prompt
   character was silently missing. */
// was DAT_000879a8
undefined s_scroll_prompt_arrow_000879a8_backing[8192] = ">";
#define s_scroll_prompt_arrow_000879a8 s_scroll_prompt_arrow_000879a8_backing[0]
/* Forward declarations for the scheduler_* functions used before their
   own definitions further down this file are unnecessary here (unlike
   upstream's own copy of this file): uw.h already K&R-prototypes every
   one of them for cross-translation-unit visibility, which this file
   sees via its own #include at the top -- a second, typed forward
   declaration here would just conflict with that under this project's
   compiler. */

/* was g_queue_link_table, and every scheduler_* function below was a
   bare FUN_XXXXXXXX -- renamed to "scheduler", System Shock's own term
   for this shared timed-effects system (door swing, blood splats,
   combat highlights, ...), since this decompile never recovered a real
   name for it. See each scheduler_* function's own "was FUN_..."
   comment for which raw address it used to be.

   HACK: same "separately-allocated global that resolve_object_link's
   arena-bounds check rejects" class as g_equipped_items/g_backpack_slot_table
   -- see that global's own comment for the fully-worked precedent this
   fix follows. DAT_00250778 is the scheduler's own 64-entry (6
   bytes/entry = 0x180 total, confirmed by this exact size showing up
   in its save/load code, scheduler_load/scheduler_save) link table --
   scheduler_add_entry/scheduler_despawn_entry/scheduler_tick/scheduler_step_entry/
   scheduler_finish_entry/scheduler_advance_effect all pass `&DAT_00250778 + offset` straight
   into resolve_object_link, the same call shape as any other object
   "next" link field. A plain standalone static array was never inside
   the level object arena's malloc'd buffer the way it evidently was in
   the original's flat, fixed-address memory map, so every one of those
   resolves came back NULL -- confirmed live (UW_DEBUG_DOOR) chasing a
   door-open bug: a door's own queued open-animation entry could never
   resolve back to the door object once scheduler_tick's per-tick walk
   actually reached it. Given real backing storage inside the same
   arena buffer instead, right after g_backpack_slot_table's existing
   tail reservation -- see reset_level_object_arena's own comment for
   where it's pointed, init_level_object_arena's for the matching
   allocation-size widening, and resolve_object_link's for the matching
   bounds widening. */
char *g_scheduler_table;
#define DAT_00250778 g_scheduler_table[0]
/* HACK: DAT_00250779 through DAT_0025077d are NOT separate parallel
   arrays -- every access site in the file indexes them with the exact
   same slot*6 index already in scope for a nearby DAT_00250778 access
   in the same function, and scheduler_add_entry's own push code proves the
   byte layout directly: DAT_00250778[slot] holds the encoded object
   link's bits 0-1 (in its own top 2 bits) and DAT_00250779[slot] holds
   bits 2-9 -- read back together as one little-endian ushort
   (resolve_object_link's plain `*(ushort*)address`, decoded via
   `>> 6`), that only reconstructs the original value correctly if
   DAT_00250779[slot] sits at byte offset+1 from DAT_00250778[slot],
   i.e. they're two fields of the SAME 6-byte-per-record buffer, not
   independent storage. Same proof for DAT_0025077a/DAT_0025077b (the
   delay/countdown field's low/high bytes, also read back together via
   a single `*(short*)(&DAT_0025077a + offset)`). This is the same
   "split symbol cluster" pattern already fixed throughout this file --
   confirmed via a dedicated re-derivation of every access site (~24
   total), no exceptions. Aliased into g_scheduler_table at their
   respective record-byte offsets instead of remaining separate/bare
   globals: bytes 0-1 = link value (DAT_00250778/DAT_00250779), 2-3 =
   delay/anim-type (DAT_0025077a/DAT_0025077b), 4 = tile X
   (DAT_0025077c), 5 = tile Y (DAT_0025077d) -- matching the 0x180-byte
   (64 slots * 6 bytes) save/load size exactly. DAT_0025077c previously
   had its own real (if wrongly separate) backing array and happened
   not to crash by luck of that array's own layout; the other four were
   bare scalars, genuinely undefined behavior when indexed past byte 0. */
#define DAT_00250779 g_scheduler_table[1]
#define DAT_0025077a g_scheduler_table[2]
#define DAT_0025077b g_scheduler_table[3]
#define DAT_0025077c g_scheduler_table[4]
#define DAT_0025077d g_scheduler_table[5]
undefined1 DAT_00250730_backing[65536];
#define DAT_00250730 DAT_00250730_backing[0]
/* was FUN_0001582c: dispatch slot 7 of FUN_00052674's boot-time
   objects.dat table-loader list (siblings load_armor_variant_tables/
   load_light_food_effect_tables sit at slots 0/2, called the same way:
   `(*local_13c[i])(iVar3)` with iVar3 = the open objects.dat handle).
   Reads 0x40 bytes -- 16 nibble-indexed entries at a 4-byte stride --
   into DAT_00250730, the exact buffer class7_variant_effect_table_lookup
   indexes below. Recovered via Ghidra headless; read_file_handle is this
   file's uw_file_read wrapper. */
void load_class7_variant_effect_table(param_1)
int param_1;
{
  read_file_handle(param_1,&DAT_00250730,0x40);
  return;
}
/* was FUN_0007cd6c: dispatch slot 6, same boot-time loader list. Reads
   0x10 bytes -- 16 nibble-indexed entries at a 1-byte stride -- into
   DAT_0024cfe0, the buffer class6_variant_effect_table_lookup indexes
   below (which is also why that global needed widening from a lone
   scalar to a real 16-byte array). */
void load_class6_variant_effect_table(param_1)
int param_1;
{
  read_file_handle(param_1,&DAT_0024cfe0,0x10);
  return;
}
/* was FUN_0007cd7c: class6_variant_effect_table_lookup, dispatch slot 6
   of get_scanned_object_class_effect_ptr's per-class table (uw.c below,
   local_c -- Ghidra split the trailing 4 array slots of local_24[4] into
   separate stack variables local_14/local_10/local_c/local_8 for classes
   4-7, the same split-symbol-cluster pattern as several other stack
   arrays in this file). Same id-split-then-table-lookup shape as
   class0_variant_effect_table_lookup/class2_variant_effect_table_lookup,
   but only defined for family==2 (id&0x30==0x20): indexes DAT_0024cfe0
   (loaded above by load_class6_variant_effect_table) at 1-byte stride;
   every other family returns 0, matching this table's real, deliberately
   partial coverage. */
void *class6_variant_effect_table_lookup()

{
  ushort uVar1;

  uVar1 = *(ushort *)g_scratch_object_ptr;
  if ((uVar1 & 0x30) == 0x20) {
    return &DAT_0024cfe0 + (uVar1 & 0xf);
  }
  return 0;
}
/* was FUN_0001583c: class7_variant_effect_table_lookup, dispatch slot 7
   (local_8). Indexes DAT_00250730 (loaded above by
   load_class7_variant_effect_table) at 4-byte stride, unconditionally --
   unlike its class6 sibling, every family/nibble combination is valid
   here. */
void *class7_variant_effect_table_lookup()

{
  return &DAT_00250730 + (*(byte *)g_scratch_object_ptr & 0xf) * 4;
}
/* was FUN_0002a2d8: class1_variant_effect_table_lookup, dispatch slot 1
   of get_scanned_object_class_effect_ptr's local_24 array (the same
   4-entry array class0/class2/class3's handlers sit in). Same id-split
   as its siblings, but ALSO caches the split family/nibble into
   DAT_001013f4/DAT_001013f0 as a side effect (two freshly-declared
   globals -- not otherwise read/written by any already-named code in
   this file, so their consumer, if any, is still unrecovered) before
   indexing DAT_001007d0 at a 0x30-byte stride, family*16+nibble. */
short DAT_001013f4;
short DAT_001013f0;
void *class1_variant_effect_table_lookup()

{
  short sVar1;
  ushort uVar2;
  byte *pbVar3;

  pbVar3 = (byte *)g_scratch_object_ptr;
  sVar1 = (short)((*pbVar3 & 0x30) >> 4);
  DAT_001013f4 = sVar1;
  uVar2 = *pbVar3 & 0xf;
  DAT_001013f0 = uVar2;
  return &DAT_001007d0 + (sVar1 * 0x10 + (int)(short)uVar2) * 0x30;
}
/* HACK: same "split symbol cluster" class as DAT_00250779's own fix
   above (see its comment for the general pattern this file uses
   throughout). DAT_00250732/DAT_00250733 are NOT separate globals --
   every access site indexes them with the exact same `class*4` index
   (iVar1 in scheduler_step_entry/scheduler_add_entry) already used to read
   DAT_00250730's own per-class flags ushort a line or two earlier in
   the same function, and load_class7_variant_effect_table's own
   comment says as much directly: it reads "0x40 bytes -- 16
   nibble-indexed entries at a 4-byte stride -- into DAT_00250730". That
   4-byte stride is: bytes 0-1 = the per-class behavior-flags ushort
   already read as `*(ushort*)(&DAT_00250730+class*4)`, byte 2 =
   DAT_00250732 (this class's step target), byte 3 = DAT_00250733 (this
   class's step increment) -- i.e. DAT_00250732/733 are simply views 2
   and 3 bytes into each of DAT_00250730's own already-loaded entries,
   not independent storage Ghidra failed to widen. Confirmed live
   (UW_DEBUG_DOOR) chasing the same door-open bug the DAT_00250778
   family's fix above was for: once that fix let scheduler_step_entry's
   per-tick increment actually reach a door's real queue entry, its
   quality stayed stuck at 0 forever (200+ calls, no change) -- traced
   to this exact code reading these as separate, always-zero globals
   instead of DAT_00250730's own loaded config, so the "current(0) <
   target(0+0-1=-1)" comparison was always false and every call took
   the "snap to DAT_00250732[class]" (=0) branch instead of ever
   incrementing. */
#define DAT_00250732 DAT_00250730_backing[2]
#define DAT_00250733 DAT_00250730_backing[3]
int DAT_002508fc;
undefined *PTR_Ordinal_1018_00084108;
undefined *PTR_Ordinal_1041_00084020;
undefined *PTR_Ordinal_1044_00084024;
undefined *PTR_Ordinal_1068_0008400c;
undefined *PTR_Ordinal_1047_0008401c;
undefined *PTR_Ordinal_1407_0008404c;
undefined *PTR_Ordinal_1063_00084050;
undefined *PTR_Ordinal_172_00084054;
undefined *PTR_Ordinal_1053_00084058;
undefined *PTR_Ordinal_1091_0008405c;
undefined *PTR_Ordinal_1415_00084064;
undefined *PTR_Ordinal_1065_00084068;
undefined *PTR_Ordinal_1072_0008406c;
undefined *PTR_Ordinal_1417_00084070;
undefined *PTR_Ordinal_993_00084074;
undefined *PTR_Ordinal_1071_00084078;
undefined *PTR_Ordinal_1064_0008407c;
undefined *PTR_Ordinal_1090_00084084;
undefined *PTR_Ordinal_1061_000840c8;
undefined *PTR_Ordinal_1025_00084088;
undefined *PTR_Ordinal_1058_0008408c;
undefined *PTR_Ordinal_1004_00084090;
undefined *PTR_Ordinal_1118_00084098;
undefined *PTR_Ordinal_1070_0008409c;
undefined *PTR_Ordinal_1102_000840a0;
undefined *PTR_Ordinal_1114_000840a4;
undefined *PTR_Ordinal_1113_000840a8;
undefined *PTR_Ordinal_63_000840ac;
undefined *PTR_Ordinal_919_000840b0;
undefined *PTR_Ordinal_912_000840b4;
undefined *PTR_Ordinal_168_000840b8;
undefined *PTR_Ordinal_165_000840bc;
undefined *PTR_Ordinal_170_000840cc;
undefined *PTR_Ordinal_171_000841c4;
undefined *PTR_Ordinal_25_000840d0;
undefined *PTR_Ordinal_535_000840d4;
undefined *PTR_Ordinal_196_000840d8;
undefined *PTR_Ordinal_197_000840dc;
undefined *PTR_Ordinal_496_000840e4;
undefined *PTR_Ordinal_1346_000840e8;
undefined *PTR_Ordinal_1094_000840ec;
undefined *PTR_Ordinal_1095_000840f0;
undefined *PTR_Ordinal_533_000840f4;
undefined *PTR_Ordinal_532_000840f8;
undefined *PTR_Ordinal_164_000840fc;
undefined *PTR_Ordinal_61_00084100;
undefined *PTR_Ordinal_516_00084104;
undefined *PTR_Ordinal_858_000841c8;
undefined *PTR_Ordinal_1054_0008410c;
undefined *PTR_Ordinal_1033_00084110;
undefined *PTR_Ordinal_167_00084114;
undefined *PTR_Ordinal_399_0008412c;
undefined *PTR_Ordinal_384_00084130;
undefined *PTR_Ordinal_390_00084134;
undefined *PTR_Ordinal_386_00084138;
undefined *PTR_Ordinal_387_0008413c;
undefined *PTR_Ordinal_385_00084140;
undefined *PTR_Ordinal_859_00084144;
undefined *PTR_Ordinal_870_00084148;
undefined *PTR_Ordinal_864_0008414c;
undefined *PTR_Ordinal_719_00084150;
undefined *PTR_Ordinal_455_00084154;
undefined *PTR_Ordinal_464_00084158;
undefined *PTR_Ordinal_80_0008415c;
undefined *PTR_Ordinal_463_00084160;
undefined *PTR_Ordinal_456_00084164;
undefined *PTR_Ordinal_267_00084168;
undefined *PTR_Ordinal_690_0008416c;
undefined *PTR_Ordinal_691_00084170;
undefined *PTR_Ordinal_687_00084174;
undefined *PTR_Ordinal_184_00084178;
undefined *PTR_Ordinal_160_0008417c;
undefined *PTR_Ordinal_161_00084180;
undefined *PTR_Ordinal_181_00084184;
undefined *PTR_Ordinal_58_00084188;
undefined *PTR_Ordinal_1416_0008418c;
undefined *PTR_Ordinal_1039_00084190;
undefined *PTR_Ordinal_702_00084194;
undefined *PTR_Ordinal_286_00084198;
undefined *PTR_Ordinal_95_0008419c;
undefined *PTR_Ordinal_230_000841a0;
undefined *PTR_Ordinal_89_000841a4;
undefined *PTR_Ordinal_266_000841a8;
undefined *PTR_Ordinal_461_000841ac;
undefined *PTR_Ordinal_246_000841b0;
undefined *PTR_Ordinal_885_000841b4;
undefined *PTR_Ordinal_264_000841b8;
undefined *PTR_Ordinal_866_000841bc;
undefined *PTR_Ordinal_868_000841c0;
undefined *PTR_Ordinal_218_00084248;
undefined *PTR_Ordinal_242_00084244;
undefined *PTR_Ordinal_212_00084210;
undefined *PTR_Ordinal_2304_00084228;
undefined *PTR_Ordinal_297_00084220;
undefined *PTR_Ordinal_321_00084224;
undefined *PTR_Ordinal_177_0008420c;
undefined *PTR_Ordinal_2135_0008424c;
undefined *PTR_Ordinal_2413_00084214;
undefined *PTR_Ordinal_38_00084218;
undefined *PTR_Ordinal_2063_0008421c;
undefined *PTR_Ordinal_97_0008423c;
undefined *PTR_Ordinal_47_00084208;
undefined *PTR_Ordinal_181_00084240;
undefined *PTR_Ordinal_2142_00084230;
undefined *PTR_Ordinal_2588_00084234;
undefined *PTR_Ordinal_2582_00084238;
undefined *PTR_Ordinal_4_00084000;
undefined DAT_00084254;
undefined DAT_00084278;
undefined DAT_0008427c;
undefined DAT_00084280;
undefined SUB_f000f7f8;
undefined1 DAT_00250904;
undefined4 *DAT_0025090c;
undefined4 *DAT_00250908;
undefined DAT_00084284;
undefined DAT_00084288;
undefined DAT_0008428c;
undefined DAT_00084290;
undefined *PTR_Ordinal_34_000841d0;
undefined *PTR_Ordinal_33_000841d4;
undefined *PTR_Ordinal_35_000841cc;






















/* g_suppress_frame_timed_flush: lets main_loop_hud_flush's per-tick forced
   render_dungeon_frame_timed() call (see its own comment) skip THIS
   function's real screen flush, since main_loop_hud_flush already does its
   own explicit flush_dirty_rect_to_display(1) right after (once
   poll_input_bindings and the HUD dispatch have also run). Without this,
   every tick called GXEndDraw() twice -- once here, once from that trailing
   flush -- and each is independently vsync-throttled (see GXEndDraw's own
   comment: real GAPI hardware blocked every call until the next refresh),
   roughly doubling real per-tick time. spin_view_full_rotation's own call site (a
   rare one-shot 64-substep view-spin animation with no other per-substep
   flush) leaves the flag clear and keeps flushing every substep as before. */
int g_suppress_frame_timed_flush = 0;



void thunk_FUN_0003c310()

{
  return;
}


















// Tunable: extra units ADDED to DAT_000842b0's computed value (more
// negative there is brighter, so this darkens the view) in BOTH
// set_ambient_bias_with_light and set_ambient_bias_without_light
// below. Override via UW_AMBIENT_BIAS_REDUCTION while calibrating;
// default 32.
int g_ambient_bias_reduction = 32;












// was FUN_0001e848 -- identity-init then compose up to 3 axis rotation matrices from angle-table indices (DAT_000d9ed8 sin / DAT_000d9930 cos); used by an object/effect transform, not the tile pipeline
void build_euler_rotation_matrix(param_1,param_2,param_3,param_4)
int * param_1;
int param_2;
int param_3;
int param_4;

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  uint extraout_r3;
  uint extraout_r3_00;
  uint extraout_r3_01;
  uint extraout_r3_02;
  uint uVar8;
  int *piVar9;
  undefined4 uVar10;
  uint uVar11;
  undefined4 uVar12;
  int iVar13;
  uint uVar14;
  /* This whole local block was a run of individually-named scalars
     (local_164, local_160, ... auStack_124[5], local_a4[2], ...) instead
     of the real 4x4 (16-`undefined4`/64-byte) matrix buffers
     set_identity_matrix4x4/multiply_matrix4x4/copy_matrix4x4 actually read and write --
     same "split-symbol matrix" bug class as copy_matrix4x4's own pointer-
     truncation fix (see its comment), just on the caller's stack instead
     of a global. Every one of those calls overflowed by 20-60+ bytes
     into whatever locals or padding happened to follow, corrupting the
     stack canary -- latent for as long as build_euler_rotation_matrix's
     only real caller (emit_catalog_object's animation-rotation path)
     never had real per-object-type property data reaching it with a
     nonzero angle; became a guaranteed `__stack_chk_fail` abort the
     moment the DAT_00202c9X object-property fix above let that happen
     (confirmed via ASAN + a stack-canary abort in exactly this
     function). Restructured into four real 16-element matrix buffers
     (one per set_identity_matrix4x4 call site: the unconditional one, then one per
     param_2/3/4 branch), with each formerly-named scalar mapped to its
     real row-major slot -- confirmed against set_identity_matrix4x4's own identity
     writes (indices 0/5/10/15, the standard 4x4 diagonal): the named
     locals for each cluster line up exactly on a 4-wide row stride
     (e.g. local_164/154/144 are 0x10 apart = row 0/1/2 of column 0),
     landing the two clusters' surviving diagonal writes (auStack_124's
     local_fc, local_a4's local_7c) on index 10 as expected. param_2's
     and param_4's branches are dead in every real call (the only call
     site always passes 0 for both) so their exact rotation math wasn't
     re-derived beyond making them memory-safe. */
  undefined4 local_164_arr [16];
  undefined4 auStack_124 [16];
  undefined4 local_e4_arr [16];
  undefined4 local_a4 [16];
  undefined4 auStack_64 [16];
#define local_164 local_164_arr[0]
#define local_160 local_164_arr[1]
#define local_15c local_164_arr[2]
#define local_154 local_164_arr[4]
#define local_150 local_164_arr[5]
#define local_14c local_164_arr[6]
#define local_144 local_164_arr[8]
#define local_140 local_164_arr[9]
#define local_13c local_164_arr[10]
#define local_110 auStack_124[5]
#define local_10c auStack_124[6]
#define local_100 auStack_124[9]
#define local_fc auStack_124[10]
#define local_e4 local_e4_arr[0]
#define local_e0 local_e4_arr[1]
#define local_d4 local_e4_arr[4]
#define local_d0 local_e4_arr[5]
#define local_9c local_a4[2]
#define local_84 local_a4[8]
#define local_7c local_a4[10]

  uVar11 = 0;
  uVar14 = 0;
  if (((param_2 == 0) && (param_3 == 0)) && (param_4 == 0)) {
    return;
  }
  set_identity_matrix4x4(local_164_arr);
  uVar8 = extraout_r3;
  if (param_2 != 0) {
    set_identity_matrix4x4(auStack_124);
    uVar10 = (&DAT_000d9ed8)[param_2];
    local_10c = (&DAT_000d9930)[param_2];
    local_110 = uVar10;
    local_100 = Ordinal_2023();
    uVar8 = extraout_r3_00;
    local_fc = uVar10;
  }
  if (param_3 != 0) {
    set_identity_matrix4x4(local_a4);
    uVar10 = (&DAT_000d9ed8)[param_3];
    uVar12 = (&DAT_000d9930)[param_3];
    uVar11 = uVar14;
    local_a4[0] = uVar10;
    local_9c = Ordinal_2023(uVar12);
    uVar8 = extraout_r3_01;
    uVar14 = uVar11;
    local_84 = uVar12;
    local_7c = uVar10;
  }
  if (param_4 != 0) {
    set_identity_matrix4x4(local_e4_arr);
    uVar10 = (&DAT_000d9ed8)[param_4];
    local_e0 = (&DAT_000d9930)[param_4];
    local_e4 = uVar10;
    local_d4 = Ordinal_2023();
    uVar8 = extraout_r3_02;
    local_d0 = uVar10;
  }
  if (param_2 != 0) {
    uVar11 = 4;
    uVar14 = 4;
    uVar8 = uVar11;
  }
  if (param_3 != 0) {
    uVar11 = uVar11 | 2;
    uVar8 = uVar11;
    uVar14 = uVar11;
  }
  if (param_4 != 0) {
    uVar11 = uVar11 | 1;
    uVar8 = uVar11;
    uVar14 = uVar11;
  }
  if (uVar11 == 1) {
    puVar4 = &local_e4;
  }
  else {
    if (uVar11 != 2) {
      if (uVar11 == 3) {
        puVar4 = local_a4;
LAB_0001e9c4:
        puVar7 = &local_e4;
      }
      else {
        if (uVar11 == 4) {
          puVar4 = auStack_124;
          goto LAB_0001ea10;
        }
        if (uVar11 == 5) {
          puVar7 = &local_e4;
        }
        else {
          if (uVar11 != 6) {
            if (uVar11 != 7) goto LAB_0001ea18;
            multiply_matrix4x4(auStack_124,local_a4,auStack_64,uVar8,uVar14);
            puVar4 = auStack_64;
            goto LAB_0001e9c4;
          }
          puVar7 = local_a4;
        }
        puVar4 = auStack_124;
      }
      multiply_matrix4x4(puVar4,puVar7,&local_164);
      goto LAB_0001ea18;
    }
    puVar4 = local_a4;
  }
LAB_0001ea10:
  copy_matrix4x4(puVar4,&local_164);
LAB_0001ea18:
  iVar13 = 0;
  piVar9 = param_1;
  if (0 < *param_1) {
    do {
      iVar1 = piVar9[4];
      iVar2 = piVar9[3];
      iVar3 = piVar9[2];
      uVar10 = Ordinal_2026(iVar3,local_160);
      uVar12 = Ordinal_2026(iVar2,local_150);
      uVar10 = Ordinal_2051(uVar10,uVar12);
      uVar12 = Ordinal_2026(iVar1,local_140);
      uVar10 = Ordinal_2051(uVar10,uVar12);
      uVar12 = Ordinal_2026(iVar3,local_15c);
      uVar5 = Ordinal_2026(iVar2,local_14c);
      uVar12 = Ordinal_2051(uVar12,uVar5);
      uVar5 = Ordinal_2026(iVar1,local_13c);
      uVar12 = Ordinal_2051(uVar12,uVar5);
      uVar5 = Ordinal_2026(iVar3,local_164);
      uVar6 = Ordinal_2026(iVar2,local_154);
      uVar5 = Ordinal_2051(uVar5,uVar6);
      uVar6 = Ordinal_2026(iVar1,local_144);
      uVar5 = Ordinal_2051(uVar5,uVar6);
      *(char *)(piVar9 + 2) = (char)uVar5;
      iVar13 = iVar13 + 1;
      *(char *)(piVar9 + 3) = (char)uVar10;
      *(char *)(piVar9 + 4) = (char)uVar12;
      *(char *)((char *)piVar9 + 9) = (char)((uint)uVar5 >> 8);
      *(char *)((char *)piVar9 + 10) = (char)((uint)uVar5 >> 0x10);
      *(char *)((char *)piVar9 + 0xb) = (char)((uint)uVar5 >> 0x18);
      *(char *)((char *)piVar9 + 0xd) = (char)((uint)uVar10 >> 8);
      *(char *)((char *)piVar9 + 0xe) = (char)((uint)uVar10 >> 0x10);
      *(char *)((char *)piVar9 + 0xf) = (char)((uint)uVar10 >> 0x18);
      *(char *)((char *)piVar9 + 0x11) = (char)((uint)uVar12 >> 8);
      *(char *)((char *)piVar9 + 0x12) = (char)((uint)uVar12 >> 0x10);
      *(char *)((char *)piVar9 + 0x13) = (char)((uint)uVar12 >> 0x18);
      piVar9 = piVar9 + 3;
    } while (iVar13 < *param_1);
  }
#undef local_164
#undef local_160
#undef local_15c
#undef local_154
#undef local_150
#undef local_14c
#undef local_144
#undef local_140
#undef local_13c
#undef local_110
#undef local_10c
#undef local_100
#undef local_fc
#undef local_e4
#undef local_e0
#undef local_d4
#undef local_d0
#undef local_9c
#undef local_84
#undef local_7c
  return;
}



// was FUN_0001ecb0 -- apply a matrix built by build_euler_rotation_matrix to a point/vertex list
void transform_points_by_matrix(param_1,param_2)
int * param_1;
int * param_2;

{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  int *piVar4;
  int *piVar5;
  int *piVar6;
  int *piVar7;
  int iVar8;
  int iVar9;
  int *piVar10;
  int *piVar11;
  int local_30;
  int local_2c;
  
  iVar9 = 0;
  iVar1 = *param_1;
  local_30 = param_1[1];
  iVar8 = iVar1;
  if (0 < *param_2) {
    piVar4 = param_1 + iVar1 * 3;
    piVar3 = param_2;
    do {
      uVar2 = Ordinal_2051(piVar3[2],param_2[0x302]);
      *(char *)(piVar4 + 2) = (char)uVar2;
      *(char *)((char *)piVar4 + 9) = (char)((uint)uVar2 >> 8);
      *(char *)((char *)piVar4 + 10) = (char)((uint)uVar2 >> 0x10);
      *(char *)((char *)piVar4 + 0xb) = (char)((uint)uVar2 >> 0x18);
      uVar2 = Ordinal_2051(piVar3[3],param_2[0x303]);
      *(char *)(piVar4 + 3) = (char)uVar2;
      *(char *)((char *)piVar4 + 0xd) = (char)((uint)uVar2 >> 8);
      *(char *)((char *)piVar4 + 0xe) = (char)((uint)uVar2 >> 0x10);
      *(char *)((char *)piVar4 + 0xf) = (char)((uint)uVar2 >> 0x18);
      uVar2 = Ordinal_2051(piVar3[4],param_2[0x304]);
      *(char *)(piVar4 + 4) = (char)uVar2;
      *(char *)((char *)piVar4 + 0x11) = (char)((uint)uVar2 >> 8);
      *(char *)((char *)piVar4 + 0x12) = (char)((uint)uVar2 >> 0x10);
      *(char *)((char *)piVar4 + 0x13) = (char)((uint)uVar2 >> 0x18);
      iVar9 = iVar9 + 1;
      iVar8 = iVar8 + 1;
      piVar4 = piVar4 + 3;
      piVar3 = piVar3 + 3;
    } while (iVar9 < *param_2);
  }
  *(char *)param_1 = (char)iVar8;
  *(char *)((char *)param_1 + 1) = (char)((uint)iVar8 >> 8);
  local_2c = 0;
  *(char *)((char *)param_1 + 2) = (char)((uint)iVar8 >> 0x10);
  *(char *)((char *)param_1 + 3) = (char)((uint)iVar8 >> 0x18);
  if (0 < param_2[1]) {
    piVar4 = param_1 + local_30 * 0x18;
    piVar3 = param_2;
    do {
      iVar8 = piVar3[0x318];
      *(char *)(piVar4 + 0x1218) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4861) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4862) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4863) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x319];
      *(char *)(piVar4 + 0x1219) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4865) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4866) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4867) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x31a];
      *(char *)(piVar4 + 0x121a) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4869) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x486a) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x486b) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x31b];
      *(char *)(piVar4 + 0x121b) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x486d) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x486e) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x486f) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x31c];
      *(char *)(piVar4 + 0x121c) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4871) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4872) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4873) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x30b];
      *(char *)(piVar4 + 0x120b) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x482d) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x482e) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x482f) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x30c];
      *(char *)(piVar4 + 0x120c) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4831) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4832) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4833) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x30d];
      *(char *)(piVar4 + 0x120d) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4835) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4836) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4837) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x305];
      *(char *)(piVar4 + 0x1205) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4815) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4816) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4817) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x305];
      if (0 < iVar8) {
        piVar5 = piVar4 + 0x1206;
        piVar6 = piVar3;
        piVar7 = piVar3;
        piVar11 = piVar4;
        do {
          piVar10 = piVar7 + 0x306;
          iVar8 = iVar8 + -1;
          piVar7 = piVar7 + 1;
          iVar9 = *piVar10 + iVar1;
          *(char *)piVar5 = (char)iVar9;
          *(char *)((char *)piVar5 + 1) = (char)((uint)iVar9 >> 8);
          *(char *)((char *)piVar5 + 2) = (char)((uint)iVar9 >> 0x10);
          *(char *)((char *)piVar5 + 3) = (char)((uint)iVar9 >> 0x18);
          piVar5 = piVar5 + 1;
          iVar9 = piVar6[0x30e];
          *(char *)(piVar11 + 0x120e) = (char)iVar9;
          *(char *)((char *)piVar11 + 0x4839) = (char)((uint)iVar9 >> 8);
          *(char *)((char *)piVar11 + 0x483a) = (char)((uint)iVar9 >> 0x10);
          *(char *)((char *)piVar11 + 0x483b) = (char)((uint)iVar9 >> 0x18);
          piVar10 = piVar6 + 0x30f;
          piVar6 = piVar6 + 2;
          iVar9 = *piVar10;
          *(char *)(piVar11 + 0x120f) = (char)iVar9;
          *(char *)((char *)piVar11 + 0x483d) = (char)((uint)iVar9 >> 8);
          *(char *)((char *)piVar11 + 0x483e) = (char)((uint)iVar9 >> 0x10);
          *(char *)((char *)piVar11 + 0x483f) = (char)((uint)iVar9 >> 0x18);
          piVar11 = piVar11 + 2;
        } while (iVar8 != 0);
      }
      local_2c = local_2c + 1;
      local_30 = local_30 + 1;
      piVar4 = piVar4 + 0x18;
      piVar3 = piVar3 + 0x18;
    } while (local_2c < param_2[1]);
  }
  *(char *)(param_1 + 1) = (char)local_30;
  *(char *)((char *)param_1 + 5) = (char)((uint)local_30 >> 8);
  *(char *)((char *)param_1 + 6) = (char)((uint)local_30 >> 0x10);
  *(char *)((char *)param_1 + 7) = (char)((uint)local_30 >> 0x18);
  return;
}



// was FUN_00020a74 -- parses one DATA3D/*.E text-format 3D model script
// (param_1 = file path, param_2 = ~16KB per-model output buffer) into
// point positions and per-part (per-face) vertex-index lists. Called 29
// times from load_3d_object_models at startup, once per model file. Point count
// lives at output offset 0, part count at offset 4, points at
// `8 + i*0xc` (3 back-to-back floats), parts at `0xc14 + p*0x60` (a
// vertex count then that many vertex-index ints from offset +4) -- see
// emit_catalog_object's own use of this layout. Despite computing a real
// per-face normal (vec3_sub + vec3_cross, see vec3_cross's comment) and
// resolving per-face color (EXTENDED_COLORS against g_model_known_ext_
// colors), neither survives into this output buffer -- confirmed by
// tracing the whole function, including the real ARM disassembly at the
// normal's call site, not just this decompile. Only point positions and
// vertex-index lists persist. Full writeup: object-rendering-findings.txt
// UPDATE (7)/(8).
/* Every .E model file in data/DATA3D/ is CRLF-terminated (confirmed via
   `xxd` on ROCKBIG.E: the PARTS block's last entry ends "...8);\r\n}\r\n").
   This parser's own end-of-PARTS-block check (s___c_1____00084954,
   "%*c%1[}]" -- skip exactly one character, then test for '}') was
   written assuming the ORIGINAL DOS/CE C runtime's text-mode fopen()
   would already have collapsed that \r\n to a single \n, leaving %*c's
   one-character skip landing exactly on '}'. POSIX fopen() never does
   that translation regardless of mode string, so on this port the raw
   \r survives, %*c skips it, and %1[}] then fails to match the '\n'
   that follows -- the parser concludes there's ANOTHER part still to
   read and parses one phantom extra PARTS entry off of "}\r\n\nNODES
   {\r\n..." garbage (a degenerate 1-vertex "face" that reliably fails
   to rasterize at runtime, confirmed live via UW_DEBUG_FACE51: every
   .E model tested gets its real face count plus exactly one broken
   trailing entry). Root-caused, not guessed: bisected with UW_DEBUG_
   NEARCLIP_RANGE that the failing record's own point count is 1 before
   near-clip ever touches it, then UW_DEBUG_EPARSE showed the parser
   itself emitting a 53rd part (vertcount=1) for ROCKBIG.E's 52-entry
   PARTS block. Fixed at the real root: strip \r from the file's own
   byte stream before scanning, replicating the text-mode translation
   the recovered scanf patterns were always written to expect, rather
   than reworking every parser call site individually. */
static void *uw_e_model_strip_cr(void *raw_fh) {
  FILE *f = (FILE *)raw_fh;
  long sz;
  char *buf;
  size_t n, r, w;
  FILE *clean;
  if (!f) return NULL;
  if (fseek(f, 0, SEEK_END) != 0) return f;
  sz = ftell(f);
  fseek(f, 0, SEEK_SET);
  if (sz <= 0) return f;
  buf = (char *)malloc((size_t)sz + 1);
  if (!buf) return f;
  n = fread(buf, 1, (size_t)sz, f);
  fclose(f);
  for (r = 0, w = 0; r < n; r++) {
    if (buf[r] != '\r') buf[w++] = buf[r];
  }
  buf[w] = 0;
  /* fmemopen keeps a reference to buf, not a copy -- intentionally never
     freed (one small per-model leak at load time, ~29 models total,
     same tolerance this codebase already extends to other load-time
     scratch allocations). */
  clean = fmemopen(buf, w, "r");
  return clean ? clean : f;
}

void parse_e_model_file(param_1,param_2,flip_winding)
char *param_1;
undefined1 * param_2;
int flip_winding; /* HACK: not part of the original recovered signature --
                      see its own use site (the "HACK: flip_winding"
                      comment, right before the PARTS block's per-face
                      vertex-reversal) for the full rationale. */

{
  char stack0xffdc3228_buf [256];
  char *stack0xffdc3228_ptr;
  undefined1 uVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  int *piVar9;
  int iVar10;
  undefined4 *puVar11;
  int *piVar12;
  undefined4 extraout_r3;
  undefined1 *puVar13;
  undefined1 *puVar14;
  undefined4 extraout_r3_00;
  char *pcVar15;
  undefined *puVar16;
  int *piVar17;
  char cVar18;
  int iVar19;
  int *piVar20;
  undefined4 *****pppppuVar21;
  char local_260 [4];
  /* local_25c/pvVar_fh hold the real fopen() handle from Ordinal_1113,
     used across the whole function's Ordinal_1114 (fscanf) calls -- were
     declared int, truncating the pointer on this 64-bit host. iVar3 is
     reused throughout this function for unrelated numeric work
     interleaved with "restore the file handle" (iVar3 = local_25c;)
     idioms right before each Ordinal_1114 call, so it couldn't just be
     retyped in place -- pvVar_fh takes over only those restore/use
     sites. */
  void *local_25c;
  void *pvVar_fh;
  undefined *local_258;
  int local_254;
  undefined4 local_250;
  undefined1 auStack_24c [4];
  undefined4 local_248;
  undefined4 ***pppuStack_244;
  undefined4 ****local_240;
  int local_23c;
  undefined4 local_238;
  undefined4 local_234;
  undefined4 local_230;
  undefined4 local_22c;
  int local_228;
  int local_224;
  int local_220;
  undefined1 local_21c [4];
  undefined4 local_218;
  undefined4 ***local_214;
  int local_210;
  int local_20c;
  int local_208;
  int local_204;
  undefined4 local_200;
  int local_1fc;
  undefined4 ****local_1f8;
  int local_1f4;
  undefined4 local_1f0;
  undefined1 auStack_1ec [4];
  int local_1e8;
  int local_1e4;
  int local_1e0;
  undefined4 ***local_1dc;
  undefined4 local_1d8;
  undefined4 ***local_1d4;
  undefined4 local_1d0;
  int local_1cc;
  undefined1 auStack_1c8 [104];
  undefined1 auStack_160 [16];
  undefined1 auStack_150 [16];
  undefined1 auStack_140 [16];
  char acStack_130 [260];

  local_258 = &DAT_000da480;
  Ordinal_1047(acStack_130,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3228_ptr = acStack_130;
  do {
    cVar18 = *pcVar2;
    *stack0xffdc3228_ptr = cVar18; stack0xffdc3228_ptr = stack0xffdc3228_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar18 != '\0');
  Ordinal_1063(acStack_130,param_1);
  pvVar_fh = Ordinal_1113(acStack_130,&DAT_00084a24);
  pvVar_fh = uw_e_model_strip_cr(pvVar_fh);
  local_25c = pvVar_fh;
  /* This whole function's 11 fatal-error checks (Ordinal_1102 message +
     terminate_process, killing the entire process) originally treated any
     malformed/unparseable ".E" model script as unrecoverable. That's far
     too strict for a recompile whose parser for this text format is
     itself reconstructed best-effort (see DAT_000849a8/DAT_000849ac/
     DAT_000849c8's declaration comments -- several of this parser's own
     format strings and keywords were unrecoverable and had to be
     inferred from a real file's content), so a wrong guess anywhere in
     this parser previously took the whole game down instead of just
     this one model. Redirected to the function's own cleanup label
     (fclose + bookkeeping) instead, so a bad/partially-understood model
     is skipped rather than fatal. */
  if (pvVar_fh == 0) {
    goto LAB_0002263c;
  }
  param_2[0xc08] = 0;
  param_2[0xc09] = 0;
  param_2[0xc0a] = 0;
  param_2[0xc0b] = 0;
  param_2[0xc0c] = 0;
  param_2[0xc0d] = 0;
  param_2[0xc0e] = 0;
  param_2[0xc0f] = 0;
  param_2[0xc10] = 0;
  param_2[0xc11] = 0;
  param_2[0xc12] = 0;
  param_2[0xc13] = 0;
  Ordinal_1114(pvVar_fh,s__100s_00084a1c,auStack_1c8);
  iVar4 = Ordinal_1065(auStack_1c8,s_BEGIN_00084a14);
  if (iVar4 != 0) {
    Ordinal_1102(s_Input_file_error__BEGIN_statemen_000849e8);
    goto LAB_0002263c;
  }
  pppppuVar21 = (undefined4 *****)&pppuStack_244;
  pcVar15 = &DAT_000d98c8;
  Ordinal_1114(pvVar_fh,s__1s__a_z__1s_000849d8,auStack_24c,&DAT_000d98c8,pppppuVar21);
  pcVar2 = pcVar15;
  if (DAT_000db45c == (undefined1 *)0x0) {
    do {
      cVar18 = *pcVar15;
      pcVar15 = pcVar15 + 1;
      if (cVar18 != ' ') {
        *pcVar2 = cVar18;
        pcVar2 = pcVar2 + 1;
      }
    } while (cVar18 != '\0');
    DAT_000db45c = &DAT_000d98c8;
  }
  piVar20 = (int *)&DAT_000c9dd8;
  while( true ) {
    pvVar_fh = local_25c;
    iVar4 = Ordinal_1114(local_25c,s__100s_1s_000849cc,auStack_1c8,local_260,pppppuVar21);
    if (((iVar4 == -1) && (iVar5 = Ordinal_1070(auStack_1c8,&DAT_000849c8,3), iVar5 == 0)) ||
       ((iVar4 != 0 && (iVar5 = Ordinal_1065(auStack_1c8,&DAT_000849c8), iVar5 == 0))))
    goto LAB_0002263c;
    if (iVar4 == -1) break;
    if ((iVar4 != 2) || (local_260[0] != '{')) {
      Ordinal_1102(s_error___s__c_000849b8,auStack_1c8,(int)local_260[0]);
    }
    iVar4 = Ordinal_1065(auStack_1c8,s_VERSION_000849b0);
    if (iVar4 == 0) {
      Ordinal_1114(pvVar_fh,&DAT_000849ac,&DAT_000db454);
      pcVar2 = &DAT_000849a8;
LAB_00022604:
      iVar4 = Ordinal_1114(pvVar_fh,pcVar2,local_260);
    }
    else {
      iVar4 = Ordinal_1065(auStack_1c8,s_NAMES_000849a0);
      if (iVar4 == 0) {
        puVar16 = &DAT_000da480;
        do {
          pppppuVar21 = (undefined4 *****)&pppuStack_244;
          local_1cc = Ordinal_1114(pvVar_fh,s__1s______1s_00084994,auStack_24c,puVar16,pppppuVar21);
          uVar7 = 0;
          if (local_1cc != 0) {
            iVar4 = Ordinal_1068(puVar16);
            puVar16 = puVar16 + iVar4 + 1;
            uVar7 = extraout_r3;
          }
          iVar4 = Ordinal_1114(pvVar_fh,&DAT_000849a8,local_260,uVar7,pppppuVar21);
          DAT_000db458 = DAT_000db458 + 1;
        } while (local_260[0] == ';');
      }
      else {
        iVar4 = Ordinal_1065(auStack_1c8,s_POINTS_0008498c);
        if (iVar4 == 0) {
          iVar5 = -10000;
          iVar3 = 10000;
          g_model_parse_point_count = 0;
          iVar4 = iVar3;
          iVar10 = iVar5;
          while( true ) {
            pppppuVar21 = (undefined4 *****)&local_214;
            iVar6 = Ordinal_1114(local_25c,s__d__d__d__00084980,&local_204,&local_224,pppppuVar21);
            iVar19 = g_model_parse_point_count;
            if (iVar6 != 3) break;
            iVar6 = g_model_parse_point_count * 0x2c;
            (&DAT_000d2ab0)[iVar6] = (char)local_204;
            if (local_204 < iVar4) {
              iVar4 = local_204;
            }
            (&DAT_000d2ab1)[iVar6] = (char)((uint)local_204 >> 8);
            if (iVar10 < local_204) {
              iVar10 = local_204;
            }
            (&DAT_000d2ab2)[iVar6] = (char)((uint)local_204 >> 0x10);
            if (local_224 < iVar3) {
              iVar3 = local_224;
            }
            (&DAT_000d2ab3)[iVar6] = (char)((uint)local_204 >> 0x18);
            (&DAT_000d2ab4)[iVar6] = (char)local_224;
            if (iVar5 < local_224) {
              iVar5 = local_224;
            }
            (&DAT_000d2ab5)[iVar6] = (char)((uint)local_224 >> 8);
            (&DAT_000d2ab6)[iVar6] = (char)((uint)local_224 >> 0x10);
            (&DAT_000d2ab7)[iVar6] = (char)((uint)local_224 >> 0x18);
            (&DAT_000d2ab8)[iVar6] = (char)local_214;
            (&DAT_000d2ab9)[iVar6] = (char)((uint)local_214 >> 8);
            (&DAT_000d2aba)[iVar6] = (char)((uint)local_214 >> 0x10);
            (&DAT_000d2abb)[iVar6] = (char)((uint)local_214 >> 0x18);
            (&DAT_000d2ac8)[iVar6] = 8;
            (&DAT_000d2ac9)[iVar6] = 0;
            (&DAT_000d2aca)[iVar6] = 0;
            (&DAT_000d2acb)[iVar6] = 0;
            (&DAT_000d2abc)[iVar6] = 0;
            (&DAT_000d2abd)[iVar6] = 0;
            (&DAT_000d2abe)[iVar6] = 0;
            (&DAT_000d2abf)[iVar6] = 0;
            (&DAT_000d2ad0)[iVar6] = 0;
            (&DAT_000d2ad1)[iVar6] = 0;
            (&DAT_000d2ad2)[iVar6] = 0;
            (&DAT_000d2ad3)[iVar6] = 0;
            (&DAT_000d2ac0)[iVar6] = 0;
            (&DAT_000d2ac1)[iVar6] = 0;
            (&DAT_000d2ac2)[iVar6] = 0;
            (&DAT_000d2ac3)[iVar6] = 0;
            /* Was `Ordinal_2032()` with the argument dropped -- the two
               sibling conversions right below it (Y=local_224, Z=local_214)
               both pass their value explicitly; this one, the X coordinate,
               did not. Confirmed via a raw memory dump of the parsed
               ROCKSMAL.E buffer: every point's first float came out as a
               constant 3.0 (Ordinal_2032((float)x)'s bit pattern for x=3,
               whatever this build's calling convention happened to leave in
               the argument register) while Y/Z matched the source file
               exactly. Same "dropped argument, register-leftover idiom
               doesn't survive a literal recompile" bug class as everywhere
               else in this file. */
            uVar7 = Ordinal_2032(local_204);
            param_2[iVar19 * 0xc + 8] = (char)uVar7;
            param_2[iVar19 * 0xc + 9] = (char)((uint)uVar7 >> 8);
            param_2[iVar19 * 0xc + 10] = (char)((uint)uVar7 >> 0x10);
            param_2[iVar19 * 0xc + 0xb] = (char)((uint)uVar7 >> 0x18);
            uVar7 = Ordinal_2032(local_224);
            puVar13 = param_2 + (g_model_parse_point_count + 1) * 0xc;
            *puVar13 = (char)uVar7;
            puVar13[1] = (char)((uint)uVar7 >> 8);
            puVar13[2] = (char)((uint)uVar7 >> 0x10);
            puVar13[3] = (char)((uint)uVar7 >> 0x18);
            uVar7 = Ordinal_2032(local_214);
            iVar19 = g_model_parse_point_count;
            param_2[g_model_parse_point_count * 0xc + 0x10] = (char)uVar7;
            param_2[iVar19 * 0xc + 0x11] = (char)((uint)uVar7 >> 8);
            param_2[iVar19 * 0xc + 0x12] = (char)((uint)uVar7 >> 0x10);
            param_2[iVar19 * 0xc + 0x13] = (char)((uint)uVar7 >> 0x18);
            g_model_parse_point_count = g_model_parse_point_count + 1;
            if (600 < g_model_parse_point_count) {
              Ordinal_1102(s_Too_many_points___d__00084968);
              goto LAB_0002263c;
            }
          }
          DAT_000db4fc = g_model_parse_point_count;
          param_2[1] = (char)((uint)g_model_parse_point_count >> 8);
          *param_2 = (char)iVar19;
          param_2[2] = (char)((uint)iVar19 >> 0x10);
          param_2[3] = (char)((uint)iVar19 >> 0x18);
          uVar7 = Ordinal_2032(iVar4);
          param_2[0x3c1c] = (char)uVar7;
          param_2[0x3c1d] = (char)((uint)uVar7 >> 8);
          param_2[0x3c1e] = (char)((uint)uVar7 >> 0x10);
          param_2[0x3c1f] = (char)((uint)uVar7 >> 0x18);
          uVar7 = Ordinal_2032(iVar10 - iVar4);
          param_2[0x3c20] = (char)uVar7;
          param_2[0x3c21] = (char)((uint)uVar7 >> 8);
          param_2[0x3c22] = (char)((uint)uVar7 >> 0x10);
          param_2[0x3c23] = (char)((uint)uVar7 >> 0x18);
          uVar7 = Ordinal_2032(iVar3);
          param_2[0x3c24] = (char)uVar7;
          param_2[0x3c25] = (char)((uint)uVar7 >> 8);
          param_2[0x3c26] = (char)((uint)uVar7 >> 0x10);
          param_2[0x3c27] = (char)((uint)uVar7 >> 0x18);
          uVar7 = Ordinal_2032(iVar5 - iVar3);
          pcVar2 = &DAT_000849a8;
          param_2[0x3c28] = (char)uVar7;
          param_2[0x3c29] = (char)((uint)uVar7 >> 8);
          param_2[0x3c2a] = (char)((uint)uVar7 >> 0x10);
          param_2[0x3c2b] = (char)((uint)uVar7 >> 0x18);
          pvVar_fh = local_25c;
          goto LAB_00022604;
        }
        iVar4 = Ordinal_1065(auStack_1c8,s_PARTS_00084960);
        if (iVar4 == 0) {
          DAT_000c8b00 = &DAT_000c4c38;
          g_model_parse_part_count = 0;
          do {
            iVar5 = Ordinal_1114(pvVar_fh,s___c_1____00084954,local_260);
            iVar4 = 1;
            if (iVar5 != 1) {
              puVar13 = local_21c;
              pppppuVar21 = (undefined4 *****)&local_1dc;
              Ordinal_1114(pvVar_fh,s__d__1s__d__x__00084944,&local_23c,&local_254,pppppuVar21,puVar13)
              ;
              iVar4 = g_model_parse_part_count;
              iVar5 = g_model_parse_part_count * 0x67;
              (&DAT_000c9e2f)[iVar5] = (char)local_1dc;
              (&DAT_000c9e30)[iVar5] = (char)((uint)local_1dc >> 8);
              (&DAT_000c9e31)[iVar5] = (char)((uint)local_1dc >> 0x10);
              (&DAT_000c9e32)[iVar5] = (char)((uint)local_1dc >> 0x18);
              (&DAT_000c9e28)[iVar5] = (undefined1)local_254;
              (&DAT_000c9e0e)[iVar5] = (char)iVar4;
              (&DAT_000c9e0f)[iVar5] = (char)((uint)iVar4 >> 8);
              (&DAT_000c9e10)[iVar5] = (char)((uint)iVar4 >> 0x10);
              (&DAT_000c9e11)[iVar5] = (char)((uint)iVar4 >> 0x18);
              (&DAT_000c9e37)[iVar5] = 0xff;
              (&DAT_000c9e38)[iVar5] = 0xff;
              (&DAT_000c9e39)[iVar5] = 0xff;
              (&DAT_000c9e3a)[iVar5] = 0xff;
              (&DAT_000c9e33)[iVar5] = 0xff;
              (&DAT_000c9e34)[iVar5] = 0xff;
              (&DAT_000c9e35)[iVar5] = 0xff;
              (&DAT_000c9e36)[iVar5] = 0xff;
              param_2[iVar4 * 0x60 + 0xc6c] = 1;
              param_2[iVar4 * 0x60 + 0xc6d] = 0;
              param_2[iVar4 * 0x60 + 0xc6e] = 0;
              param_2[iVar4 * 0x60 + 0xc6f] = 0;
              puVar14 = param_2 + (g_model_parse_part_count + 0x21) * 0x60;
              *puVar14 = 0xe0;
              puVar14[1] = 0;
              puVar14[2] = 0;
              puVar14[3] = 0;
              iVar4 = g_model_parse_part_count;
              iVar5 = g_model_parse_part_count * 0x67;
              if (local_23c == 4) {
                (&DAT_000c9e2b)[iVar5] = local_21c[0];
                (&DAT_000c9e2c)[iVar5] = local_21c[1];
                (&DAT_000c9e2d)[iVar5] = local_21c[2];
                (&DAT_000c9e2e)[iVar5] = local_21c[3];
                (&DAT_000c9de0)[iVar5] = 0xff;
                (&DAT_000c9de1)[iVar5] = 0xff;
                (&DAT_000c9de2)[iVar5] = 0xff;
                (&DAT_000c9de3)[iVar5] = 0xff;
                Ordinal_1102(s_got_bitmap__d___d_00084930);
                iVar4 = g_model_parse_part_count;
              }
              else {
                (&DAT_000c9e29)[iVar5] = local_21c[1];
                (&DAT_000c9de0)[iVar5] = local_21c[0];
                (&DAT_000c9de1)[iVar5] = 0;
                (&DAT_000c9de2)[iVar5] = 0;
                (&DAT_000c9de3)[iVar5] = 0;
              }
              iVar5 = local_23c;
              puVar16 = local_258;
              iVar10 = iVar4 * 0x67;
              if ((&DAT_000c9e26)[iVar10] == '\0') {
                uVar1 = 0xff;
                if (local_254 != 0x58) {
                  uVar1 = 0;
                }
                (&DAT_000c9e26)[iVar10] = uVar1;
              }
              if (iVar4 < DAT_000db458) {
                (&DAT_000c9e22)[iVar10] = (char)local_258;
                (&DAT_000c9e23)[iVar10] = (char)((uint)local_258 >> 8);
                (&DAT_000c9e24)[iVar10] = (char)((uint)local_258 >> 0x10);
                (&DAT_000c9e25)[iVar10] = (char)((uint)local_258 >> 0x18);
                iVar4 = Ordinal_1068(local_258);
                puVar16 = puVar16 + iVar4 + 1;
                local_258 = puVar16;
              }
              else {
                (&DAT_000c9e22)[iVar10] = 0;
                (&DAT_000c9e23)[iVar10] = 0;
                (&DAT_000c9e24)[iVar10] = 0;
                puVar16 = (undefined *)0x0;
                (&DAT_000c9e25)[iVar10] = 0;
              }
              piVar17 = DAT_000c8b00;
              if (iVar5 == 0) {
LAB_000218b8:
                piVar12 = DAT_000c8b00 + 1;
                (&DAT_000c9dd8)[iVar10] = (char)piVar12;
                (&DAT_000c9dd9)[iVar10] = (char)((uint)piVar12 >> 8);
                iVar5 = 0;
                DAT_000c8b00 = piVar12;
                (&DAT_000c9dda)[iVar10] = (char)((uint)piVar12 >> 0x10);
                (&DAT_000c9ddb)[iVar10] = (char)((uint)piVar12 >> 0x18);
                iVar4 = Ordinal_1114(local_25c,&DAT_000849a8,local_260,(uint)piVar12 >> 0x18,
                                     pppppuVar21,puVar13);
                iVar3 = 0;
                do {
                  iVar19 = iVar3;
                  Ordinal_1114(local_25c,s__d_1s_000848c8,&local_210,local_260);
                  iVar3 = iVar19 + 1;
                  *DAT_000c8b00 = local_210;
                  DAT_000c8b00 = DAT_000c8b00 + 1;
                  iVar10 = g_model_parse_part_count * 0x18 + iVar5;
                  iVar5 = iVar5 + 1;
                  puVar13 = param_2 + (iVar10 + 0x306) * 4;
                  *puVar13 = (char)local_210;
                  puVar13[1] = (char)((uint)local_210 >> 8);
                  puVar13[2] = (char)((uint)local_210 >> 0x10);
                  puVar13[3] = (char)((uint)local_210 >> 0x18);
                  iVar10 = g_model_parse_part_count;
                } while (local_260[0] == ',');
                param_2[g_model_parse_part_count * 0x60 + 0xc14] = (char)iVar5;
                param_2[iVar10 * 0x60 + 0xc15] = (char)((uint)iVar5 >> 8);
                param_2[iVar10 * 0x60 + 0xc16] = (char)((uint)iVar5 >> 0x10);
                param_2[iVar10 * 0x60 + 0xc17] = (char)((uint)iVar5 >> 0x18);
                /* HACK: flip_winding (new parameter, not part of the
                   original recovered signature) -- caller-supplied,
                   per-model opt-in to reverse every face's just-read
                   vertex list. Added because several models' faces render
                   backward: raster_triangle has a real, working backface
                   cull (confirmed this session via its left/right edge-
                   assignment gate in raster_textured_span -- not a bug, a
                   legitimate cheap cull the original engine relies on),
                   so a backward-wound face silently disappears depending
                   on which side of it the camera ends up on. A real
                   per-face fix would need each face's own normal compared
                   against the mesh's shape (tried, reverted per explicit
                   instruction: too complicated for what's just a handful
                   of known-bad models, and unreliable besides -- see
                   object-rendering-findings.txt milestone 13, where that
                   approach's own centroid heuristic gave the wrong answer
                   for the boulder) -- a flat "flip everything in this
                   file" flag, opted into only for the specific models
                   confirmed backward BY EYE (not the offline heuristic --
                   see milestone 13/14), is simpler and does the same job
                   for these models specifically (see the call sites in
                   the .E load list for which ones pass 1). */
                if (flip_winding && 1 < iVar3) {
                  int _flip_lo = 0, _flip_hi = iVar3 - 1;
                  while (_flip_lo < _flip_hi) {
                    int *_flip_pa = (int *)(param_2 + (g_model_parse_part_count * 0x18 + _flip_lo + 0x306) * 4);
                    int *_flip_pb = (int *)(param_2 + (g_model_parse_part_count * 0x18 + _flip_hi + 0x306) * 4);
                    int _flip_tmp = *_flip_pa;
                    *_flip_pa = *_flip_pb;
                    *_flip_pb = _flip_tmp;
                    _flip_lo++; _flip_hi--;
                  }
                }
                if (getenv("UW_DEBUG_EPARSE"))
                  fprintf(stderr, "[eparse] %s part=%d vertcount=%d\n", param_1, g_model_parse_part_count, iVar5);
                iVar5 = *(int *)(param_2 + g_model_parse_part_count * 0x60 + 0xc18);
                iVar10 = *(int *)(param_2 + g_model_parse_part_count * 0x60 + 0xc20);
                vec3_sub(param_2 + iVar5 * 0xc + 8,
                             param_2 + *(int *)(param_2 + g_model_parse_part_count * 0x60 + 0xc1c) * 0xc + 8,
                             auStack_150);
                vec3_sub(param_2 + iVar5 * 0xc + 8,param_2 + iVar10 * 0xc + 8,auStack_160);
                vec3_cross(auStack_160,auStack_150,auStack_140);
                if ((local_23c == 4) && (iVar3 != 4)) {
                  Ordinal_1102(s_Error__polygon__d__bitmap_must_h_00084898,g_model_parse_part_count);
                }
                if (iVar3 < 3) {
                  Ordinal_1102(s_Error__Part__d_is_a_polygon_with_00084868,g_model_parse_part_count,iVar3);
                }
                iVar5 = g_model_parse_part_count * 0x67;
                (&DAT_000c9ddc)[iVar5] = (char)iVar3;
                (&DAT_000c9ddd)[iVar5] = (char)((uint)iVar3 >> 8);
                (&DAT_000c9dde)[iVar5] = (char)((uint)iVar3 >> 0x10);
                (&DAT_000c9ddf)[iVar5] = (char)((uint)iVar3 >> 0x18);
                *piVar17 = iVar3;
                if (local_254 == 0x46) {
                  iVar5 = iVar3;
                  if (iVar3 < 0) {
                    iVar5 = iVar19 + 2;
                  }
                  iVar5 = iVar5 >> 1;
                  if (iVar5 != 0) {
                    puVar11 = (undefined4 *)
                              (*(int *)(&DAT_000c9dd8 + g_model_parse_part_count * 0x67) + iVar5 * 4);
                    puVar8 = (undefined4 *)
                             (*(int *)(&DAT_000c9dd8 + g_model_parse_part_count * 0x67) + (iVar3 - iVar5) * 4);
                    do {
                      iVar5 = iVar5 + -1;
                      uVar7 = puVar11[-1];
                      puVar11 = puVar11 + -1;
                      *puVar11 = *puVar8;
                      *puVar8 = uVar7;
                      puVar8 = puVar8 + 1;
                    } while (iVar5 != 0);
                  }
                }
                g_model_parse_part_count = g_model_parse_part_count + 1;
                if (0x15e < g_model_parse_part_count) {
                  Ordinal_1102(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                }
                if (&DAT_000c8a90 < DAT_000c8b00) {
                  Ordinal_1102(s_Out_of_vertex_list_space_00084908);
                  goto LAB_0002263c;
                }
                Ordinal_1114(local_25c,&DAT_000849a8,local_260);
                pvVar_fh = local_25c;
              }
              else if (iVar5 == 1) {
                iVar4 = Ordinal_1114(pvVar_fh,s__d__d_000848d0,&local_1e0,&local_20c,pppppuVar21,
                                     puVar13);
                piVar17 = DAT_000c8b00;
                iVar5 = g_model_parse_part_count * 0x67;
                (&DAT_000c9ddc)[iVar5] = 2;
                (&DAT_000c9ddd)[iVar5] = 0;
                (&DAT_000c9dde)[iVar5] = 0;
                (&DAT_000c9ddf)[iVar5] = 0;
                *piVar17 = 2;
                iVar5 = g_model_parse_part_count * 0x67;
                piVar17 = DAT_000c8b00 + 1;
                DAT_000c8b00 = piVar17;
                (&DAT_000c9dd8)[iVar5] = (char)piVar17;
                (&DAT_000c9dd9)[iVar5] = (char)((uint)piVar17 >> 8);
                (&DAT_000c9dda)[iVar5] = (char)((uint)piVar17 >> 0x10);
                (&DAT_000c9ddb)[iVar5] = (char)((uint)piVar17 >> 0x18);
                *piVar17 = local_1e0;
                DAT_000c8b00 = DAT_000c8b00 + 1;
                iVar5 = local_20c;
LAB_00021838:
                *DAT_000c8b00 = iVar5;
                DAT_000c8b00 = DAT_000c8b00 + 1;
                if (&DAT_000c8a90 < DAT_000c8b00) {
                  Ordinal_1102(s_Out_of_vertex_list_space_00084908);
                  goto LAB_0002263c;
                }
                g_model_parse_part_count = g_model_parse_part_count + 1;
                if (0x15e < g_model_parse_part_count) {
                  Ordinal_1102(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                }
                Ordinal_1114(pvVar_fh,&DAT_000849a8,local_260);
              }
              else {
                if (1 < iVar5) {
                  if (iVar5 < 4) {
                    if (iVar5 == 2) {
                      (&DAT_000c9e3b)[iVar10] = 0;
                      (&DAT_000c9e3c)[iVar10] = 0;
                      (&DAT_000c9e3d)[iVar10] = 0;
                      puVar14 = (undefined1 *)0x0;
                      (&DAT_000c9e3e)[iVar10] = 0;
                    }
                    else {
                      Ordinal_1114(pvVar_fh,&DAT_000848f4,&local_218,puVar16,pppppuVar21,puVar13);
                      Ordinal_1102(s_got_sphere__d_000848e4,local_218);
                      iVar4 = g_model_parse_part_count * 0x67;
                      puVar14 = &DAT_000c9dd8 + iVar4;
                      (&DAT_000c9e3b)[iVar4] = (char)local_218;
                      (&DAT_000c9e3c)[iVar4] = (char)((uint)local_218 >> 8);
                      (&DAT_000c9e3d)[iVar4] = (char)((uint)local_218 >> 0x10);
                      (&DAT_000c9e3e)[iVar4] = (char)((uint)local_218 >> 0x18);
                    }
                    iVar4 = Ordinal_1114(pvVar_fh,&DAT_000849ac,&local_1f4,puVar14,pppppuVar21,puVar13)
                    ;
                    piVar17 = DAT_000c8b00;
                    iVar5 = g_model_parse_part_count * 0x67;
                    (&DAT_000c9ddc)[iVar5] = 1;
                    (&DAT_000c9ddd)[iVar5] = 0;
                    (&DAT_000c9dde)[iVar5] = 0;
                    (&DAT_000c9ddf)[iVar5] = 0;
                    *piVar17 = 1;
                    iVar5 = g_model_parse_part_count * 0x67;
                    DAT_000c8b00 = DAT_000c8b00 + 1;
                    (&DAT_000c9dd8)[iVar5] = (char)DAT_000c8b00;
                    (&DAT_000c9dd9)[iVar5] = (char)((uint)DAT_000c8b00 >> 8);
                    (&DAT_000c9dda)[iVar5] = (char)((uint)DAT_000c8b00 >> 0x10);
                    (&DAT_000c9ddb)[iVar5] = (char)((uint)DAT_000c8b00 >> 0x18);
                    iVar5 = local_1f4;
                    goto LAB_00021838;
                  }
                  if (iVar5 == 4) goto LAB_000218b8;
                  if (iVar5 == 5) {
                    piVar12 = &local_220;
                    pppppuVar21 = (undefined4 *****)&local_1d4;
                    iVar4 = Ordinal_1114(pvVar_fh,s__d__d__d__d_00084924,&local_1fc,&local_228,
                                         pppppuVar21,piVar12);
                    piVar17 = DAT_000c8b00;
                    if (DAT_00084660 < local_228) {
                      DAT_00084660 = local_228;
                    }
                    iVar3 = -local_228;
                    if (iVar3 < DAT_0008465c) {
                      DAT_0008465c = iVar3;
                    }
                    if (DAT_00084670 < local_228) {
                      DAT_00084670 = local_228;
                    }
                    if (iVar3 < DAT_0008466c) {
                      DAT_0008466c = iVar3;
                    }
                    if (DAT_00084660 < local_220) {
                      DAT_00084660 = local_220;
                    }
                    iVar3 = -local_220;
                    if (iVar3 < DAT_0008465c) {
                      DAT_0008465c = iVar3;
                    }
                    if (DAT_00084670 < local_220) {
                      DAT_00084670 = local_220;
                    }
                    if (iVar3 < DAT_0008466c) {
                      DAT_0008466c = iVar3;
                    }
                    iVar3 = g_model_parse_part_count * 0x67;
                    (&DAT_000c9ddc)[iVar3] = 2;
                    (&DAT_000c9ddd)[iVar3] = 0;
                    (&DAT_000c9dde)[iVar3] = 0;
                    (&DAT_000c9ddf)[iVar3] = 0;
                    *piVar17 = 2;
                    iVar3 = g_model_parse_part_count * 0x67;
                    piVar17 = DAT_000c8b00 + 1;
                    DAT_000c8b00 = piVar17;
                    (&DAT_000c9dd8)[iVar3] = (char)piVar17;
                    (&DAT_000c9dd9)[iVar3] = (char)((uint)piVar17 >> 8);
                    (&DAT_000c9dda)[iVar3] = (char)((uint)piVar17 >> 0x10);
                    (&DAT_000c9ddb)[iVar3] = (char)((uint)piVar17 >> 0x18);
                    *piVar17 = local_1fc;
                    DAT_000c8b00 = DAT_000c8b00 + 1;
                    *DAT_000c8b00 = (int)local_1d4;
                    iVar3 = g_model_parse_part_count;
                    piVar17 = DAT_000c8b00 + 1;
                    iVar5 = g_model_parse_part_count * 0x67;
                    DAT_000c8b00 = piVar17;
                    (&DAT_000c9e33)[iVar5] = (char)local_228;
                    (&DAT_000c9e34)[iVar5] = (char)((uint)local_228 >> 8);
                    (&DAT_000c9e35)[iVar5] = (char)((uint)local_228 >> 0x10);
                    (&DAT_000c9e36)[iVar5] = (char)((uint)local_228 >> 0x18);
                    (&DAT_000c9e37)[iVar5] = (char)local_220;
                    (&DAT_000c9e38)[iVar5] = (char)((uint)local_220 >> 8);
                    (&DAT_000c9e39)[iVar5] = (char)((uint)local_220 >> 0x10);
                    (&DAT_000c9e3a)[iVar5] = (char)((uint)local_220 >> 0x18);
                    if (&DAT_000c8a90 < piVar17) {
                      Ordinal_1102(s_Out_of_vertex_list_space_00084908);
                      goto LAB_0002263c;
                      iVar3 = g_model_parse_part_count;
                    }
                    g_model_parse_part_count = iVar3 + 1;
                    uVar7 = 0x15e;
                    if (0x15e < g_model_parse_part_count) {
                      Ordinal_1102(s_Too_many_polys_000848f8);
                      goto LAB_0002263c;
                      uVar7 = extraout_r3_00;
                    }
                    Ordinal_1114(local_25c,&DAT_000849a8,local_260,uVar7,pppppuVar21,piVar12);
                    pvVar_fh = local_25c;
                    goto LAB_00021bec;
                  }
                }
                iVar4 = Ordinal_1114(pvVar_fh,s_________c_000848d8,local_260,puVar16,pppppuVar21,
                                     puVar13);
              }
            }
LAB_00021bec:
            iVar5 = g_model_parse_part_count;
          } while (local_260[0] == ';');
          iVar10 = 0;
          param_2[5] = (char)((uint)g_model_parse_part_count >> 8);
          param_2[4] = (char)iVar5;
          param_2[6] = (char)((uint)iVar5 >> 0x10);
          param_2[7] = (char)((uint)iVar5 >> 0x18);
          iVar3 = g_model_parse_part_count;
          iVar5 = g_model_parse_part_count;
          piVar17 = piVar20;
          if (0 < g_model_parse_part_count) {
            do {
              if (((((char)piVar17[0x14] == 'A') && (DAT_000db480 == 0)) && (DAT_000db470 == 0)) &&
                 (iVar19 = piVar17[1], 2 < iVar19)) {
                Ordinal_1102(s_making_backside_of__d_____d_00084848,iVar10,iVar5);
                iVar6 = g_model_parse_part_count * 0x67;
                iVar5 = piVar17[2];
                (&DAT_000c9de0)[iVar6] = (char)iVar5;
                (&DAT_000c9de1)[iVar6] = (char)((uint)iVar5 >> 8);
                (&DAT_000c9de2)[iVar6] = (char)((uint)iVar5 >> 0x10);
                (&DAT_000c9de3)[iVar6] = (char)((uint)iVar5 >> 0x18);
                (&DAT_000c9ddc)[iVar6] = (char)iVar19;
                (&DAT_000c9ddd)[iVar6] = (char)((uint)iVar19 >> 8);
                (&DAT_000c9dde)[iVar6] = (char)((uint)iVar19 >> 0x10);
                (&DAT_000c9ddf)[iVar6] = (char)((uint)iVar19 >> 0x18);
                uVar7 = *(undefined4 *)((char *)piVar17 + 0x4a);
                (&DAT_000c9e22)[iVar6] = (char)uVar7;
                (&DAT_000c9e23)[iVar6] = (char)((uint)uVar7 >> 8);
                (&DAT_000c9e24)[iVar6] = (char)((uint)uVar7 >> 0x10);
                (&DAT_000c9e25)[iVar6] = (char)((uint)uVar7 >> 0x18);
                uVar7 = *(undefined4 *)((char *)piVar17 + 0x36);
                (&DAT_000c9e0e)[iVar6] = (char)uVar7;
                (&DAT_000c9e0f)[iVar6] = (char)((uint)uVar7 >> 8);
                (&DAT_000c9e10)[iVar6] = (char)((uint)uVar7 >> 0x10);
                (&DAT_000c9e11)[iVar6] = (char)((uint)uVar7 >> 0x18);
                (&DAT_000c9e28)[iVar6] = (char)piVar17[0x14];
                (&DAT_000c9e26)[iVar6] = 0;
                iVar5 = *piVar17;
                *DAT_000c8b00 = iVar19;
                iVar6 = g_model_parse_part_count;
                piVar12 = (int *)(iVar5 + iVar19 * 4);
                piVar9 = DAT_000c8b00 + 1;
                iVar5 = g_model_parse_part_count * 0x67;
                DAT_000c8b00 = piVar9;
                (&DAT_000c9dd8)[iVar5] = (char)piVar9;
                (&DAT_000c9dd9)[iVar5] = (char)((uint)piVar9 >> 8);
                (&DAT_000c9dda)[iVar5] = (char)((uint)piVar9 >> 0x10);
                (&DAT_000c9ddb)[iVar5] = (char)((uint)piVar9 >> 0x18);
                for (; iVar19 != 0; iVar19 = iVar19 + -1) {
                  piVar12 = piVar12 + -1;
                  *piVar9 = *piVar12;
                  piVar9 = DAT_000c8b00 + 1;
                  DAT_000c8b00 = piVar9;
                  iVar6 = g_model_parse_part_count;
                }
                g_model_parse_part_count = iVar6 + 1;
                iVar5 = g_model_parse_part_count;
                if (0x15e < g_model_parse_part_count) {
                  Ordinal_1102(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                  iVar5 = g_model_parse_part_count;
                }
              }
              iVar10 = iVar10 + 1;
              piVar17 = (int *)((char *)piVar17 + 0x67);
            } while (iVar10 < iVar3);
          }
        }
        else if (DAT_000db480 == 0) {
LAB_0002226c:
          iVar4 = Ordinal_1065(auStack_1c8,s_INTERSECTIONS_000847bc);
          if (iVar4 == 0) {
            do {
              iVar4 = Ordinal_1114(pvVar_fh,s__d_1s_000848c8,&local_1d0,local_260);
              if (iVar4 == 2) {
                *(undefined4 *)(&DAT_000c8b08 + DAT_000db4d0 * 4) = local_1d0;
                DAT_000db4d0 = DAT_000db4d0 + 1;
              }
            } while (local_260[0] == ',');
          }
          else {
            iVar4 = Ordinal_1065(auStack_1c8,s_EXTENDED_COLORS_000847ac);
            if (iVar4 == 0) {
              iVar5 = 0;
              piVar17 = piVar20;
              do {
                iVar4 = Ordinal_1114(pvVar_fh,s__lx_1s_000847a4,&local_208,local_260);
                if (DAT_000db494 != 0) {
                  piVar12 = &g_model_known_ext_colors;
                  iVar10 = 0;
                  do {
                    if (local_208 == *piVar12) {
                      *(char *)(piVar17 + 2) = (char)iVar10;
                      *(char *)((char *)piVar17 + 9) = (char)((uint)iVar10 >> 8);
                      *(char *)((char *)piVar17 + 10) = (char)((uint)iVar10 >> 0x10);
                      *(char *)((char *)piVar17 + 0xb) = (char)((uint)iVar10 >> 0x18);
                      break;
                    }
                    iVar10 = iVar10 + 1;
                    piVar12 = piVar12 + 1;
                  } while (iVar10 < 0x20);
                  if (iVar10 == 0x20) {
                    Ordinal_1102(s_Error__extended_color_for_part___00084768,iVar5);
                    goto LAB_0002263c;
                  }
                  iVar5 = iVar5 + 1;
                  piVar17 = (int *)((char *)piVar17 + 0x67);
                }
              } while (local_260[0] == ',');
            }
            else {
              iVar4 = Ordinal_1065(auStack_1c8,s_ANIMATE_00084760);
              if (iVar4 != 0) {
                pcVar2 = s________c_0008471c;
                goto LAB_00022604;
              }
              piVar17 = &DAT_000d95d8;
              do {
                puVar13 = auStack_1ec;
                pppppuVar21 = &local_1f8;
                iVar5 = 0;
                iVar4 = Ordinal_1114(pvVar_fh,s__d__1s__d__d__1s_0008474c,&local_200,local_260,
                                     pppppuVar21,&local_1f0,puVar13);
                iVar3 = DAT_000db4e0;
                if ((iVar4 != 1) || (iVar4 = 1, local_260[0] != '}')) {
                  iVar4 = DAT_000db4e0 * 0x15;
                  (&DAT_000d977c)[iVar4] = local_260[0];
                  (&DAT_000d9768)[iVar4] = (char)local_200;
                  (&DAT_000d9769)[iVar4] = (char)((uint)local_200 >> 8);
                  (&DAT_000d976a)[iVar4] = (char)((uint)local_200 >> 0x10);
                  (&DAT_000d976b)[iVar4] = (char)((uint)local_200 >> 0x18);
                  (&DAT_000d9774)[iVar4] = (char)local_1f8;
                  (&DAT_000d9775)[iVar4] = (char)((uint)local_1f8 >> 8);
                  (&DAT_000d9776)[iVar4] = (char)((uint)local_1f8 >> 0x10);
                  (&DAT_000d9777)[iVar4] = (char)((uint)local_1f8 >> 0x18);
                  (&DAT_000d9778)[iVar4] = (char)local_1f0;
                  (&DAT_000d9779)[iVar4] = (char)((uint)local_1f0 >> 8);
                  (&DAT_000d977a)[iVar4] = (char)((uint)local_1f0 >> 0x10);
                  (&DAT_000d977b)[iVar4] = (char)((uint)local_1f0 >> 0x18);
                  pppppuVar21 = (undefined4 *****)local_1f8;
                  uVar7 = local_1f0;
                  Ordinal_1102(s_anim__d___d__c__d__d___00084734,iVar3,local_200,local_260,local_1f8
                               ,local_1f0);
                  pvVar_fh = local_25c;
                  iVar4 = DAT_000db4e0 * 0x15;
                  (&DAT_000d9770)[iVar4] = (char)piVar17;
                  (&DAT_000d9771)[iVar4] = (char)((uint)piVar17 >> 8);
                  (&DAT_000d9772)[iVar4] = (char)((uint)piVar17 >> 0x10);
                  (&DAT_000d9773)[iVar4] = (char)((uint)piVar17 >> 0x18);
                  do {
                    Ordinal_1114(pvVar_fh,s__d_1s_000848c8,&local_1e8,local_260,pppppuVar21,uVar7,
                                 puVar13);
                    iVar5 = iVar5 + 1;
                    iVar10 = DAT_000db4e0 + 1;
                    *piVar17 = local_1e8;
                    iVar4 = local_1e8 * 0x2c;
                    piVar17 = piVar17 + 1;
                    (&DAT_000d2ad0)[iVar4] = (char)iVar10;
                    (&DAT_000d2ad1)[iVar4] = (char)((uint)iVar10 >> 8);
                    (&DAT_000d2ad2)[iVar4] = (char)((uint)iVar10 >> 0x10);
                    (&DAT_000d2ad3)[iVar4] = (char)((uint)iVar10 >> 0x18);
                    Ordinal_1102(&DAT_00084730);
                  } while (local_260[0] == ',');
                  iVar4 = DAT_000db4e0 * 0x15;
                  (&DAT_000d976c)[iVar4] = (char)iVar5;
                  (&DAT_000d976d)[iVar4] = (char)((uint)iVar5 >> 8);
                  (&DAT_000d976e)[iVar4] = (char)((uint)iVar5 >> 0x10);
                  (&DAT_000d976f)[iVar4] = (char)((uint)iVar5 >> 0x18);
                  Ordinal_1102(s___d__00084728,iVar5);
                  DAT_000db4e0 = DAT_000db4e0 + 1;
                  iVar4 = Ordinal_1114(pvVar_fh,&DAT_000849a8,local_260);
                  if (iVar4 != 1) break;
                }
                pvVar_fh = local_25c;
              } while (local_260[0] == ';');
            }
          }
        }
        else {
          iVar4 = Ordinal_1065(auStack_1c8,s_CLUSTERS_0008483c);
          if (iVar4 == 0) {
            puVar8 = (undefined4 *)&DAT_000c8ca0;
            do {
              cVar18 = '\0';
              iVar4 = Ordinal_1114(pvVar_fh,&DAT_000849a8,local_260);
              puVar16 = local_258;
              if ((iVar4 != 1) || (iVar4 = 1, local_260[0] != '}')) {
                iVar4 = DAT_000db4d4 * 4;
                if (DAT_000db4d4 + g_model_parse_part_count < DAT_000db458) {
                  *(undefined **)(&DAT_000da868 + iVar4) = local_258;
                  iVar5 = Ordinal_1068(local_258);
                  local_258 = puVar16 + iVar5 + 1;
                }
                else {
                  *(undefined4 *)(&DAT_000da868 + iVar4) = 0;
                }
                *(undefined4 **)(&DAT_000dab90 + iVar4) = puVar8;
                puVar8 = puVar8 + 1;
                do {
                  Ordinal_1114(pvVar_fh,s__d_1s_000848c8,&local_1d8,local_260);
                  cVar18 = cVar18 + '\x01';
                  *puVar8 = local_1d8;
                  puVar8 = puVar8 + 1;
                } while (local_260[0] == ',');
                **(char **)(&DAT_000dab90 + DAT_000db4d4 * 4) = cVar18;
                DAT_000db4d4 = DAT_000db4d4 + 1;
                iVar4 = Ordinal_1114(pvVar_fh,&DAT_000849a8,local_260);
                if (iVar4 != 1) break;
              }
            } while (local_260[0] == ';');
          }
          else {
            iVar4 = Ordinal_1065(auStack_1c8,s_NODES_00084834);
            if ((iVar4 != 0) &&
               (iVar4 = Ordinal_1065(auStack_1c8,s_SUPER_NODES_00084828), iVar4 != 0))
            goto LAB_0002226c;
            iVar4 = Ordinal_1065(auStack_1c8,s_SUPER_NODES_00084828);
            iVar5 = -1;
            if (iVar4 != 0) {
              iVar5 = 0;
            }
            do {
              iVar4 = Ordinal_1114(pvVar_fh,&DAT_00084820,&local_1e4);
              iVar10 = DAT_000db4d8;
              if (local_260[0] != '}') {
                (&DAT_000c9540)[DAT_000db4d8 * 0x16] = (char)local_1e4;
                if (local_1e4 == 0x4c) {
                  Ordinal_1102(s_leaf_00084818);
                  iVar4 = Ordinal_1114(pvVar_fh,s__d_1s_000848c8,&local_22c,local_260);
                  Ordinal_1102(&DAT_00084814,local_22c);
                  iVar10 = DAT_000db4d8 * 0x16;
                  (&DAT_000c9542)[iVar10] = (char)local_22c;
                  (&DAT_000c9543)[iVar10] = (char)((uint)local_22c >> 8);
                  (&DAT_000c9544)[iVar10] = (char)((uint)local_22c >> 0x10);
                  (&DAT_000c9545)[iVar10] = (char)((uint)local_22c >> 0x18);
                  iVar10 = DAT_000db4d8;
                }
                else if (local_1e4 == 0x42) {
                  Ordinal_1102(s_branch_0008480c);
                  if (iVar5 == 0) {
                    iVar4 = Ordinal_1114(pvVar_fh,s__1s__d__d__d_1s_000847e4,&local_234,&local_250,
                                         &local_238,&local_230,local_260);
                    local_240 = (undefined4 *****)0xffffffff;
                    local_248 = 0xffffffff;
                  }
                  else {
                    iVar4 = Ordinal_1114(pvVar_fh,s__1s__d__d__d__d__d_1s_000847f4,&local_234,
                                         &local_250,&local_248,&local_240,&local_238,&local_230,
                                         local_260);
                  }
                  pppppuVar21 = (undefined4 *****)local_240;
                  Ordinal_1102(s__c__d__d__d__d__d___c__000847cc,local_234,local_250,local_248,
                               local_240,local_238,local_230,(int)local_260[0]);
                  iVar10 = DAT_000db4d8 * 0x16;
                  (&DAT_000c9541)[iVar10] = (undefined1)local_234;
                  (&DAT_000c9542)[iVar10] = (char)local_250;
                  (&DAT_000c9543)[iVar10] = (char)((uint)local_250 >> 8);
                  (&DAT_000c9544)[iVar10] = (char)((uint)local_250 >> 0x10);
                  (&DAT_000c9545)[iVar10] = (char)((uint)local_250 >> 0x18);
                  (&DAT_000c954e)[iVar10] = (char)local_248;
                  (&DAT_000c954f)[iVar10] = (char)((uint)local_248 >> 8);
                  (&DAT_000c9550)[iVar10] = (char)((uint)local_248 >> 0x10);
                  (&DAT_000c9551)[iVar10] = (char)((uint)local_248 >> 0x18);
                  (&DAT_000c9552)[iVar10] = (char)local_240;
                  (&DAT_000c9553)[iVar10] = (char)((uint)local_240 >> 8);
                  (&DAT_000c9554)[iVar10] = (char)((uint)local_240 >> 0x10);
                  (&DAT_000c9555)[iVar10] = (char)((uint)local_240 >> 0x18);
                  (&DAT_000c9546)[iVar10] = (char)local_238;
                  (&DAT_000c9547)[iVar10] = (char)((uint)local_238 >> 8);
                  (&DAT_000c9548)[iVar10] = (char)((uint)local_238 >> 0x10);
                  (&DAT_000c9549)[iVar10] = (char)((uint)local_238 >> 0x18);
                  (&DAT_000c954a)[iVar10] = (char)local_230;
                  (&DAT_000c954b)[iVar10] = (char)((uint)local_230 >> 8);
                  (&DAT_000c954c)[iVar10] = (char)((uint)local_230 >> 0x10);
                  (&DAT_000c954d)[iVar10] = (char)((uint)local_230 >> 0x18);
                  iVar10 = DAT_000db4d8;
                }
                DAT_000db4d8 = iVar10 + 1;
              }
            } while (local_260[0] == ';');
          }
        }
      }
    }
    if ((iVar4 == 0) || (local_260[0] != '}')) {
      goto LAB_0002263c;
    }
  }
  Ordinal_1102(s_unexpected_EOF___no_END_statemen_000846f8);
LAB_0002263c:
  /* Ordinal_1118 is fclose-shaped, closing the handle Ordinal_1113 (fopen)
     opened at the top of this function -- was called with iVar3 (reused
     throughout this function for unrelated numeric work, and not
     reliably holding the handle by this point even before the
     local_25c/pvVar_fh pointer-width fix), should be the real handle. */
  Ordinal_1118(local_25c);
  iVar3 = g_model_parse_part_count;
  if ((DAT_000db494 != 0) && (iVar4 = 0, 0 < g_model_parse_part_count)) {
    do {
      if (*(int *)((char *)piVar20 + 0x36) != iVar4) {
        uVar7 = *(undefined4 *)(&DAT_000c9de0 + *(int *)((char *)piVar20 + 0x36) * 0x67);
        *(char *)(piVar20 + 2) = (char)uVar7;
        *(char *)((char *)piVar20 + 9) = (char)((uint)uVar7 >> 8);
        *(char *)((char *)piVar20 + 10) = (char)((uint)uVar7 >> 0x10);
        *(char *)((char *)piVar20 + 0xb) = (char)((uint)uVar7 >> 0x18);
      }
      iVar4 = iVar4 + 1;
      piVar20 = (int *)((char *)piVar20 + 0x67);
    } while (iVar4 < iVar3);
  }
  return;
}






/* Bounded random: rand() % param_1. The original takes the modulo from
   Ordinal_2005's (idivmod's) r1 remainder leftover -- Ghidra lost that
   into an uninitialised `extraout_r1`, so it always returned garbage
   (and with Ordinal_1053 stubbed to 0, effectively always 0). Compute
   the modulo directly. */
// was FUN_00022910
undefined4 rand_below(param_1)
int param_1;

{
  if (param_1 == 0) {
    return 0;
  }
  return (undefined4)((uint)Ordinal_1053() % (uint)param_1);
}



// was FUN_0002294c -- GetTickCount-shaped: Ordinal_535() (SDL_GetTicks(),
// real elapsed ms since startup) scaled down to 4ms-per-unit. Used
// throughout this file (fades, double-click/hold timing, the attack-swing
// state machine, movement_pacing_handler's pre-uw_frame_clock_ms reads,
// ...) as the generic "what time is it" source; some callers (e.g.
// move_key_directional_step's own tail) busy-spin on it in a tight loop
// with no event pump in between, so it must keep returning genuine
// real-time -- see uw_frame_clock_ms's own comment for why movement's
// deterministic clock is a separate function, not a change here.
uint read_realtime_clock_units()

{
  uint uVar1;

  uVar1 = Ordinal_535();
  return uVar1 >> 2;
}



undefined *FUN_0002295c(param_1)
undefined4 param_1;

{
  Ordinal_196(0,2,param_1,0xffffffff,&DAT_000fb650,0xff);
  return &DAT_000fb650;
}



undefined *FUN_00022998(param_1)
undefined4 param_1;

{
  Ordinal_197(0,0x260,param_1,0xffffffff,&DAT_000fb550,0xff,0,0);
  return &DAT_000fb550;
}

















































































// WARNING: Globals starting with '_' overlap smaller symbols at the same address




// WARNING: Type propagation algorithm not settling

// was FUN_0002bdac. Tests whether movement/sight between tile (param_1,
// param_2) and tile (param_3,param_4) -- via intermediate tile (param_5,
// param_6) -- is blocked by a wall, reading each tile's DAT_000878d0
// direction-blocking bitmask (bits 2/4/8/0x10 = which of the 4 axis
// directions that tile type blocks). Used by creature_find_path_to_tile's
// wavefront pathfinding and by the line-of-sight scanner below it -- NOT
// part of the 3D dungeon-view render chain (see memory.md's tmap-tiles
// section: this whole subsystem is creature AI, a dead end for that
// investigation, but a real, previously-unexamined one worth naming).
undefined4 tile_pair_los_blocked(param_1,param_2,param_3,param_4,param_5,param_6,param_7,param_8,param_9,param_10,param_11)
byte param_1;
byte param_2;
byte param_3;
byte param_4;
byte param_5;
byte param_6;
ushort param_7;
ushort param_8;
byte param_9;
byte * param_10;
byte * param_11;

{
  int uw_ord2005_rem_13 = 0;
  bool bVar1;
  ushort uVar2;
  byte bVar3;
  ushort uVar4;
  ushort uVar5;
  bool bVar6;
  ushort *puVar7;
  byte *pbVar8;
  ushort *puVar9;
  ushort *puVar10;
  uint extraout_r1;
  uint uVar11;
  uint uVar12;
  int iVar13;
  ushort uVar14;
  uint uVar15;
  uint uVar16;
  byte bVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  bool bVar21;
  byte local_50;
  
  DAT_00101440 = 0;
  bVar6 = false;
  bVar1 = false;
  puVar7 = (ushort *)tilemap_lookup(param_3,param_4);
  pbVar8 = (byte *)tilemap_lookup(param_1,param_2);
  uVar18 = (uint)param_5;
  puVar9 = (ushort *)tilemap_lookup(uVar18,param_6);
  /* Added NULL guards: tilemap_lookup legitimately returns NULL for an
     out-of-range tile coordinate (its own documented contract), and all
     three results here were dereferenced unconditionally. Confirmed
     live crashing (EXC_BAD_ACCESS at puVar9, param_6=0xff -- an
     off-map Y coordinate) via a recorded repro
     (bug_critter_crash.txt): creature_find_path_to_tile's BFS
     wavefront explores neighbor tiles around the search area without
     clamping to the map's 0-63 bounds first, so it can hand this
     function a genuinely off-map (param_5,param_6) intermediate tile.
     Treat an off-map tile the same as every other "no line of sight"
     case in this function: return 0 (blocked). */
  if ((puVar7 == (ushort *)0x0) || (pbVar8 == (byte *)0x0) || (puVar9 == (ushort *)0x0)) {
    return 0;
  }
  uVar19 = *puVar7 & 0xf;
  uVar11 = *puVar9 & 0xf;
  bVar3 = (byte)uVar11;
  uVar4 = (ushort)(&DAT_0023ae40)[*puVar7 >> 10 & 0xf] >> 4;
  uVar2 = (&DAT_0023ae40)[*puVar9 >> 10 & 0xf];
  uVar15 = (uint)param_1;
  if (uVar15 == 0) {
    uVar20 = (uint)param_3;
    *param_10 = param_9;
    uVar15 = (uint)(byte)((byte)*puVar9 >> 4);
    if ((uVar20 < uVar18) && (((&DAT_000878d0)[uVar11] & 2) != 0)) {
      return 0;
    }
    if ((uVar18 < uVar20) && (((&DAT_000878d0)[uVar11] & 4) != 0)) {
      return 0;
    }
    uVar16 = (uint)param_6;
    uVar12 = (uint)param_4;
    if ((uVar12 < uVar16) && (((&DAT_000878d0)[uVar11] & 8) != 0)) {
      return 0;
    }
    if ((uVar16 < uVar12) && (((&DAT_000878d0)[uVar11] & 0x10) != 0)) {
      return 0;
    }
    if ((uVar20 < uVar18) && (((&DAT_000878d0)[uVar19] & 4) != 0)) {
      return 0;
    }
    if ((uVar18 < uVar20) && (((&DAT_000878d0)[uVar19] & 2) != 0)) {
      return 0;
    }
    if ((uVar12 < uVar16) && (((&DAT_000878d0)[uVar19] & 0x10) != 0)) {
      return 0;
    }
    if ((uVar16 < uVar12) && (((&DAT_000878d0)[uVar19] & 8) != 0)) {
      return 0;
    }
    if ((param_7 & 0x1000) == 0) {
      return 1;
    }
    if (((5 < uVar11) && (uVar11 < 10)) &&
       (uVar11 != (byte)(&DAT_000853cc)
                        [(byte)(&DAT_000853c4)[((uVar18 - uVar20) * 3 - uVar12) + uVar16]])) {
      uVar15 = uVar15 + 1;
    }
    if (uVar15 <= param_9 + 1) {
      return 1;
    }
    return 0;
  }
  if (uVar18 == 0) {
    *param_10 = param_9;
    if ((param_7 & 0x1000) == 0) {
      return 1;
    }
    uVar11 = 0;
    uVar2 = puVar7[1];
    /* `resolve_object_link(puVar7 + 1)` was called unchanged on every
       iteration -- real disassembly (0x2bdac @ 0x2c068-0x2c0f8) shows
       the argument register is only ever set to puVar7+1 ONCE, before
       the loop; each iteration instead advances it by 4 bytes right
       after the call (`add r0,r0,#0x4`, i.e. `puVar9 + 2`) and the
       loop-back branch lands AFTER that advance, so the real code
       walks the object chain one link at a time. The decompiler lost
       track of that carried register and re-derived a fixed expression
       from puVar7 instead, so puVar9 -- and therefore uVar11 and uVar2
       -- was always recomputed from the SAME first object in the
       chain. Confirmed live via a recorded repro (bug-npc-freeze.txt):
       whenever that first object doesn't set uVar11 and its own "next"
       flag stays set, nothing can ever change, so the loop spins at
       100% CPU forever -- reproduced exactly (same PC, same
       resolve_object_link argument, sampled repeatedly under lldb on a
       genuinely hung process). Track the advancing link pointer in its
       own variable instead. */
    puVar10 = puVar7 + 1;
    while (((uVar2 & 0xffc0) != 0 && (uVar11 == 0))) {
      puVar9 = (ushort *)resolve_object_link(puVar10);
      iVar13 = (*puVar9 & 0x1ff) * 0xd;
      if (((&DAT_00202c93)[iVar13] & 2) != 0) {
        uVar11 = (int)(((byte)puVar9[1] & 0x7f) + (uint)(byte)(&DAT_00202c90)[iVar13]) >> 3;
      }
      puVar10 = puVar9 + 2;
      uVar2 = puVar9[2];
    }
    uVar15 = (uint)(byte)((byte)*puVar7 >> 4);
    bVar1 = uVar11 <= uVar15;
    if (bVar1) {
      uVar11 = uVar15;
    }
    if (uVar11 + 1 < (uint)(*pbVar8 >> 4)) {
      *param_10 = (byte)uVar11;
      uVar11 = ((*param_11 - uVar11) + (uint)param_9) - 1;
      *param_11 = (byte)uVar11;
      if ((uint)DAT_00101450 < (uVar11 & 0xff)) {
        return 0;
      }
    }
    if (!bVar1) {
      return 1;
    }
    uVar11 = 8 << (uVar4 & 0xff);
    if ((param_7 & uVar11) != 0) {
      return 0;
    }
    if ((uVar11 & param_8) == 0) {
      return 1;
    }
    bVar3 = *param_11;
    *param_11 = bVar3 + 2;
    if ((byte)(bVar3 + 2) <= DAT_00101450) {
      return 1;
    }
    return 0;
  }
  *param_10 = param_9;
  uVar20 = (uint)param_3;
  if (uVar20 < uVar18) {
    if (((&DAT_000878d0)[uVar11] & 2) != 0) {
      return 0;
    }
    bVar21 = ((&DAT_000878d0)[uVar19] & 4) == 0;
LAB_0002c220:
    if (!bVar21) {
      return 0;
    }
  }
  else {
    if (uVar18 < uVar20) {
      if (((&DAT_000878d0)[uVar11] & 4) != 0) {
        return 0;
      }
      bVar21 = ((&DAT_000878d0)[uVar19] & 2) == 0;
      goto LAB_0002c220;
    }
    if (param_6 >= param_4 && param_6 != param_4) {
      if (((&DAT_000878d0)[uVar11] & 8) != 0) {
        return 0;
      }
      bVar21 = ((&DAT_000878d0)[uVar19] & 0x10) == 0;
      goto LAB_0002c220;
    }
    if (param_6 < param_4) {
      if (((&DAT_000878d0)[uVar11] & 0x10) != 0) {
        return 0;
      }
      if (((&DAT_000878d0)[uVar19] & 8) != 0) {
        return 0;
      }
    }
  }
  local_50 = 0;
  uVar14 = puVar7[1];
  uVar11 = uVar15;
  /* Same bug as the earlier resolve_object_link loop above in this
     function (see that one's comment for the full disassembly-
     confirmed explanation): `resolve_object_link(puVar7 + 1)` was
     called unchanged on every iteration instead of advancing through
     the object chain, making this loop genuinely unable to terminate
     whenever the first linked object doesn't set local_50 and its own
     "next" flag stays set. Track the advancing link pointer instead. */
  ushort *puVar_link2 = puVar7 + 1;
  while (((uVar14 & 0xffc0) != 0 && (local_50 == 0))) {
    puVar10 = (ushort *)resolve_object_link(puVar_link2);
    uVar19 = (uint)*puVar10;
    iVar13 = (uVar19 & 0x1ff) * 0xd;
    if (((uVar19 & 0x1c0) != 0x140) || (((*puVar10 & 0x30) != 0 || (7 < (uVar19 & 0xf))))) {
      if (((&DAT_00202c93)[iVar13] & 2) != 0) {
        local_50 = (byte)((int)(((byte)puVar10[1] & 0x7f) + (uint)(byte)(&DAT_00202c90)[iVar13]) >>
                         3);
      }
      goto switchD_0002c458_default;
    }
    uVar14 = puVar10[1];
    uw_ord2005_rem_13 = ((int)(uVar14 >> 7 & 7)) % (4);
    uVar5 = uVar14 >> 0xd;
    uVar19 = uw_ord2005_rem_13 & 0xff;
    uVar14 = uVar14 >> 10 & 7;
    if (!bVar1) {
      if (uVar15 < uVar20) {
        if (param_4 < param_6) {
          uVar11 = 0;
        }
        else {
          if (param_4 != param_6) {
            uVar11 = 2;
          }
          if (param_4 <= param_6) {
            uVar11 = 1;
          }
        }
      }
      else if (uVar15 == uVar20) {
        if (param_2 < param_4) {
          if (uVar20 < uVar18) {
            uVar11 = 8;
          }
          else {
            if (uVar20 != uVar18) {
              uVar11 = 6;
            }
            if (uVar20 <= uVar18) {
              uVar11 = 7;
            }
          }
        }
        else if (uVar20 < uVar18) {
          uVar11 = 0xb;
        }
        else {
          uVar11 = 9;
          if (uVar20 <= uVar18) {
            uVar11 = 10;
          }
        }
      }
      else if (param_4 < param_6) {
        uVar11 = 3;
      }
      else {
        if (param_4 != param_6) {
          uVar11 = 5;
        }
        if (param_4 <= param_6) {
          uVar11 = 4;
        }
      }
      bVar1 = true;
    }
    switch(uVar11) {
    case 0:
      break;
    case 1:
      goto LAB_0002c4a0;
    case 2:
      goto LAB_0002c4c8;
    case 3:
      goto LAB_0002c4f4;
    case 4:
LAB_0002c4a0:
      bVar21 = uVar19 == 0;
LAB_0002c498:
      if (!bVar21) {
        return 0;
      }
      goto switchD_0002c458_default;
    case 5:
      goto LAB_0002c510;
    case 6:
LAB_0002c4c8:
      if ((uVar19 == 0) || (uVar14 = uVar5, uVar19 == 2)) goto LAB_0002c4e8;
LAB_0002c4d8:
      if (uVar19 == 3) {
        return 0;
      }
      goto switchD_0002c458_default;
    case 7:
      goto LAB_0002c490;
    case 8:
LAB_0002c510:
      if (uVar19 == 0) goto LAB_0002c4e8;
      if (uVar19 == 1) {
        return 0;
      }
      uVar14 = uVar5;
      if (uVar19 == 2) goto LAB_0002c52c;
      goto switchD_0002c458_default;
    case 9:
      break;
    case 10:
LAB_0002c490:
      bVar21 = uVar19 == 2;
      goto LAB_0002c498;
    case 0xb:
LAB_0002c4f4:
      if ((uVar19 != 0) && (uVar14 = uVar5, uVar19 != 2)) goto LAB_0002c4d8;
      goto LAB_0002c52c;
    default:
      goto switchD_0002c458_default;
    }
    if (uVar19 == 0) {
LAB_0002c52c:
      if (3 < uVar14) {
        return 0;
      }
    }
    else {
      if (uVar19 == 1) {
        return 0;
      }
      uVar14 = uVar5;
      if (uVar19 == 2) {
LAB_0002c4e8:
        if (uVar14 < 4) {
          return 0;
        }
      }
    }
switchD_0002c458_default:
    puVar_link2 = puVar10 + 2;
    uVar14 = puVar10[2];
  }
  uVar11 = (uint)param_7;
  if ((param_7 & 0x1000) == 0) {
    *param_10 = 0x10 - (char)((int)(DAT_00101730 + 3) >> 2);
    return 1;
  }
  uVar15 = (byte)*puVar7 & 0xf0;
  uVar19 = uVar15;
  if (uVar15 <= (*pbVar8 & 0xf0)) {
    uVar19 = *pbVar8 & 0xf0;
  }
  uVar12 = (byte)*puVar9 & 0xf0;
  if (uVar15 <= uVar12) {
    uVar15 = uVar12;
  }
  uVar15 = uVar15 >> 4;
  bVar17 = (byte)uVar15;
  uVar12 = uVar19 >> 4;
  if (uVar19 >> 4 < (uint)param_9) {
    uVar12 = (uint)param_9;
  }
  if (((5 < bVar3) && (bVar3 < 10)) &&
     (bVar3 != (&DAT_000853cc)
               [(byte)(&DAT_000853c4)[((uVar18 - uVar20) * 3 - (uint)param_4) + (uint)param_6]])) {
    uVar15 = uVar15 + 1;
  }
  uVar18 = uVar12;
  if (uVar12 <= uVar15) {
    uVar18 = uVar15;
  }
  if (0x7f < (uint)DAT_00101730 + uVar18 * 8) {
    return 0;
  }
  if (uVar15 + 1 < uVar12) {
    uVar18 = (uint)local_50;
    if (uVar18 + 1 < uVar12) {
      if (uVar18 < uVar15) {
        uVar18 = uVar15;
      }
      *param_10 = (byte)uVar18;
      bVar6 = true;
      uVar18 = ((*param_11 - uVar18) + uVar12) - 1;
      *param_11 = (byte)uVar18;
      if ((uint)DAT_00101450 < (uVar18 & 0xff)) {
        return 0;
      }
LAB_0002c778:
      bVar1 = false;
    }
    else {
      bVar1 = true;
      uVar15 = uVar18;
      bVar17 = local_50;
    }
  }
  else {
    uVar18 = (uint)local_50;
    if (((uVar18 == 0) || (uVar12 < uVar18)) || (bVar1 = true, uVar18 + 1 < uVar12))
    goto LAB_0002c778;
  }
  if (uVar12 + 1 < uVar15) {
    return 0;
  }
  if (((uVar12 <= (byte)((byte)*puVar7 >> 4) + 1) || (bVar6)) || (bVar1)) {
    if (((uVar11 & 8 << (uVar4 & 0xff)) == 0) || (bVar1)) goto LAB_0002c8cc;
    uVar15 = 8 << (uVar2 >> 4 & 0xff);
    if ((uVar11 & uVar15) != 0) {
      return 0;
    }
    if (((uVar15 & param_8) != 0) &&
       (bVar3 = *param_11, *param_11 = bVar3 + 2, DAT_00101450 < (byte)(bVar3 + 2))) {
      return 0;
    }
  }
  else {
    if ((uVar11 & 8 << (uVar4 & 0xff)) != 0) {
      return 0;
    }
    if (((8 << (uVar2 >> 4 & 0xff) & (uint)param_8) != 0) &&
       (bVar3 = *param_11, *param_11 = bVar3 + 2, DAT_00101450 <= (byte)(bVar3 + 2))) {
      return 0;
    }
    if (uVar12 <= local_50 + 1) {
LAB_0002c8cc:
      *param_10 = bVar17;
      return 1;
    }
    *param_10 = (byte)uVar12;
    if (uVar12 < uVar15) {
      return 0;
    }
  }
  if (((*(byte *)(DAT_00101404 + 10) & 0x20) != 0) &&
     (bVar3 = *param_11, *param_11 = bVar3 + 1, (byte)(bVar3 + 1) < DAT_00101450)) {
    DAT_00101440 = 1;
    return 1;
  }
  return 0;
}
























// was npc_set_walk_target -- write an NPC's goal (byte 0xf bits 0-5), goal target
// (bits 6-11) and attitude (byte 0xd bits 4-7), flagging the change in byte 0x18
void npc_set_walk_target(param_1,param_2,param_3)
byte param_1;
uint param_2;
byte param_3;

{
  ushort uVar1;
  uint uVar2;
  
  uVar1 = *(ushort *)((char *)DAT_0010190c + 0xf);
  if ((((uint)param_1 != (uVar1 & 0x3f)) || ((param_2 & 0xff) != (uVar1 & 0xfc0) >> 6)) ||
     (param_3 != *(byte *)((char *)DAT_0010190c + 0xd) >> 4)) {
    *(byte *)((char *)DAT_0010190c + 0xf) = ((byte)uVar1 ^ param_1) & 0x3f ^ (byte)uVar1;
    *(char *)((char *)DAT_0010190c + 0x10) = (char)(uVar1 >> 8);
    uVar2 = *(ushort *)((char *)DAT_0010190c + 0xf) & 0xf03f | (param_2 & 0x3f) << 6;
    *(char *)((char *)DAT_0010190c + 0xf) = (char)uVar2;
    *(char *)((char *)DAT_0010190c + 0x10) = (char)(uVar2 >> 8);
    uVar2 = *(ushort *)((char *)DAT_0010190c + 0xd) & 0xff0f;
    *(byte *)((char *)DAT_0010190c + 0xd) = (byte)uVar2 | param_3 << 4;
    *(char *)((char *)DAT_0010190c + 0xe) = (char)(uVar2 >> 8);
    *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) | 0x20;
    *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xbf;
  }
  return;
}









// was FUN_0002f124
void npc_idle_behavior_tick()

{
  int uw_ord2005_rem_23 = 0; int uw_ord2005_rem_24 = 0; int uw_ord2005_rem_25 = 0; int uw_ord2005_rem_26 = 0; int uw_ord2005_rem_27 = 0; int uw_ord2005_rem_28 = 0; int uw_ord2005_rem_29 = 0; int uw_ord2005_rem_30 = 0; int uw_ord2005_rem_31 = 0; int uw_ord2005_rem_32 = 0; int uw_ord2005_rem_33 = 0; int uw_ord2005_rem_34 = 0; int uw_ord2005_rem_35 = 0; int uw_ord2005_rem_36 = 0; int uw_ord2005_rem_37 = 0; int uw_ord2005_rem_38 = 0; int uw_ord2005_rem_39 = 0;
  if (getenv("UW_DEBUG_NPC_STATEMACHINE"))
    fprintf(stderr, "[npc-f124] ENTER obj=%p state=0x%x frame_nibble(0xc)=0x%x DAT_00101734=%d\n",
            (void *)DAT_0010190c, (unsigned)(*(byte *)((char *)DAT_0010190c + 0x15) & 0x3f),
            (unsigned)(*(byte *)((char *)DAT_0010190c + 0xc) & 0xf0) >> 4, (int)DAT_00101734);
  ushort uVar1;
  byte *pbVar2;
  undefined4 uVar3;
  char extraout_r1;
  char extraout_r1_00;
  char cVar4;
  int extraout_r1_01;
  uint extraout_r1_02;
  uint extraout_r1_03;
  int extraout_r1_04;
  uint extraout_r1_05;
  uint extraout_r1_06;
  uint extraout_r1_07;
  int extraout_r1_08;
  uint extraout_r1_09;
  uint extraout_r1_10;
  int extraout_r1_11;
  uint extraout_r1_12;
  int extraout_r1_13;
  uint extraout_r1_14;
  uint extraout_r1_15;
  byte bVar5;
  byte bVar6;
  uint uVar7;
  uint uVar8;
  char *iVar9;
  
  if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) != 0) {
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf));
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0x7f;
  }
  pbVar2 = (byte *)tilemap_lookup(DAT_00101918,DAT_001013f8);
  if (DAT_00101734 == 0) {
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xf9 | 1;
    return;
  }
  if ((*(byte *)((char *)DAT_0010190c + 0xe) & 0xc0) == 0) {
    uVar3 = Ordinal_1053();
    uw_ord2005_rem_23 = ((int)(uVar3)) % (2);
    if (uw_ord2005_rem_23 != 0) {
      npc_notice_and_idle_tick();
      return;
    }
  }
  if ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0) {
    if (DAT_0010140c < 0xf) {
      if (DAT_0010140c < (byte)((*pbVar2 >> 4) + 2)) {
        uVar3 = Ordinal_1053();
        iVar9 = DAT_0010190c;
        bVar5 = *(byte *)((char *)DAT_0010190c + 0x14);
        uw_ord2005_rem_24 = ((int)(uVar3)) % (3);
        *(byte *)(iVar9 + 0x14) = ~bVar5 & 7 ^ (char)((uw_ord2005_rem_24 & 0xff) << 3) + 0x87U;
        goto LAB_0002f314;
      }
      uVar3 = Ordinal_1053();
      uw_ord2005_rem_25 = ((int)(uVar3)) % (5);
      cVar4 = uw_ord2005_rem_25;
    }
    else {
      uVar3 = Ordinal_1053();
      uw_ord2005_rem_26 = ((int)(uVar3)) % (3);
      cVar4 = uw_ord2005_rem_26;
    }
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 7 ^ (cVar4 + '\x0e') * '\b';
  }
LAB_0002f314:
  /* HACK: whole-function fix, same ushort-vs-byte pointer-scaling bug as
     the rest of this NPC-AI cluster this session (see
     [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is
     `ushort *`, so every bare `DAT_0010190c + N` in this function (both
     the hex- and decimal-offset forms) was scaling N by 2. Verified
     against fresh disassembly of this exact state-transition gate
     (0x2f360-0x2f390): `ldrb r2,[r0,#0xb]; ldrb r3,[r0,#0xc]; orr
     r3,r2,r3,lsl#8; and r3,r3,#0xf000; cmp r3,#0x3000` -- raw bytes
     0xb/0xc combined, masked to byte 0xc's own upper nibble (our
     "frame" field), compared against 3 -- all real, unscaled offsets.
     This is npc_ai_tick's case-0xb/default target reaching this
     function's state 0x20<->0x2c toggle (idle vs whatever 0x2c really
     is): with the read scaled to byte 0x18 instead of the real frame
     byte 0xc, this gate compared against essentially unrelated data
     and could all but never see frame==3, so an object could get stuck
     never transitioning off state 0x20 -- exactly the symptom reported
     live (a peaceful NPC, Bragit, permanently showing what looks like
     an alert/hostile idle pose instead of cycling into whatever state
     0x2c's animation actually is). Cast every offset to a byte pointer
     throughout this function so none of them are scaled. */
  if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x3f) == 0x20) {
    uVar3 = Ordinal_1053();
    uw_ord2005_rem_27 = ((int)(uVar3)) % (0x10);
    if (((uw_ord2005_rem_27 & 0xff) < (*(byte *)(DAT_00101404 + 0x1f) & 0xf)) &&
       ((*(byte *)((char *)DAT_0010190c + 0xc) & 0xf0) == 0x30)) {
LAB_0002f384:
      bVar5 = *(byte *)((char *)DAT_0010190c + 0x15) & 0xec | 0x2c;
      goto LAB_0002f390;
    }
  }
  else {
    uVar3 = Ordinal_1053();
    uw_ord2005_rem_28 = ((int)(uVar3)) % (0x10);
    if (((uw_ord2005_rem_28 & 0xff) <= (*(byte *)(DAT_00101404 + 0x1f) & 0xf)) ||
       ((*(byte *)((char *)DAT_0010190c + 0xc) & 0xf0) != 0x30)) goto LAB_0002f384;
    bVar5 = *(byte *)((char *)DAT_0010190c + 0x15) & 0xe0 | 0x20;
LAB_0002f390:
    *(byte *)((char *)DAT_0010190c + 0x15) = bVar5;
  }
  if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x3f) == 0x2c) {
    if ((DAT_00101924 != 0) && (DAT_00101430 == 0)) {
      uVar3 = Ordinal_1053();
      uw_ord2005_rem_29 = ((int)(uVar3)) % (2);
      iVar9 = DAT_0010190c;
      uw_ord2005_rem_30 = ((int)((uint)*(byte *)((char *)DAT_0010190c + 9) + uw_ord2005_rem_29 * 0x80 + 0xc0)) % (0x100);
      *(byte *)(iVar9 + 9) = (byte)uw_ord2005_rem_30;
      uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uw_ord2005_rem_30 & 0xe0) << 2;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar7 >> 8);
      *(byte *)((char *)DAT_0010190c + 0x18) =
           ((byte)uw_ord2005_rem_30 ^ *(byte *)((char *)DAT_0010190c + 0x18)) & 0x1f ^
           *(byte *)((char *)DAT_0010190c + 0x18);
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      return;
    }
    uVar3 = Ordinal_1053();
    bVar5 = *(byte *)(DAT_00101404 + 0x1f);
    uw_ord2005_rem_31 = ((int)(uVar3)) % (0x40);
    if ((uw_ord2005_rem_31 & 0xff) < (bVar5 & 0xf) + 8) {
      uVar3 = Ordinal_1053();
      iVar9 = DAT_0010190c;
      bVar5 = *(byte *)((char *)DAT_0010190c + 9);
      uw_ord2005_rem_32 = ((int)(uVar3)) % (0x40);
      uw_ord2005_rem_33 = ((int)(uw_ord2005_rem_32 + (uint)bVar5 + 0xe0)) % (0x100);
      uVar7 = uw_ord2005_rem_33 & 0xff;
    }
    else {
      uVar7 = (uint)*(byte *)((char *)DAT_0010190c + 9);
      iVar9 = DAT_0010190c;
    }
    if (DAT_00101430 == 0) {
      uVar7 = adjust_heading_away_from_player(uVar7,10);
      iVar9 = DAT_0010190c;
    }
    *(byte *)(iVar9 + 9) = (byte)uVar7;
    uVar8 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar7 & 0xe0) << 2;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar8;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar8 >> 8);
    bVar5 = *(byte *)((char *)DAT_0010190c + 0x18);
    bVar6 = bVar5 ^ (byte)uVar7;
LAB_0002f6cc:
    *(byte *)((char *)DAT_0010190c + 0x18) = bVar6 & 0x1f ^ bVar5;
  }
  else {
    uVar3 = Ordinal_1053();
    uw_ord2005_rem_34 = ((int)(uVar3)) % (0x80);
    if ((uw_ord2005_rem_34 & 0xff) < (*(byte *)(DAT_00101404 + 0x1f) & 0xf)) {
      uVar3 = Ordinal_1053();
      iVar9 = DAT_0010190c;
      bVar5 = *(byte *)((char *)DAT_0010190c + 9);
      uw_ord2005_rem_35 = ((int)(uVar3)) % (0x40);
      uw_ord2005_rem_36 = ((int)(uw_ord2005_rem_35 + (uint)bVar5 + 0xe0)) % (0x100);
      *(byte *)(iVar9 + 9) = (byte)uw_ord2005_rem_36;
      uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uw_ord2005_rem_36 & 0xe0) << 2;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar7 >> 8);
      bVar5 = *(byte *)((char *)DAT_0010190c + 0x18);
      bVar6 = (byte)uw_ord2005_rem_36 ^ bVar5;
      goto LAB_0002f6cc;
    }
  }
  bVar5 = *(byte *)((char *)DAT_0010190c + 0x15);
  if ((bVar5 & 0x3f) == 0x20) {
    *(byte *)((char *)DAT_0010190c + 0x15) = bVar5 | 0x40;
    *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfe | 6;
    uVar3 = Ordinal_1053();
    uw_ord2005_rem_37 = ((int)(uVar3)) % (2);
    iVar9 = DAT_0010190c;
    if (uw_ord2005_rem_37 == 0) goto LAB_0002f810;
    uVar1 = *(ushort *)((char *)DAT_0010190c + 0xb);
    uw_ord2005_rem_38 = ((int)((uVar1 >> 0xc) + 1)) % (4);
    uVar7 = uw_ord2005_rem_38;
  }
  else {
    *(byte *)((char *)DAT_0010190c + 0x15) = bVar5 & 0xbf;
    *(byte *)((char *)DAT_0010190c + 0x13) =
         (*(byte *)((char *)DAT_0010190c + 0x13) ^ *(byte *)(DAT_00101404 + 0xb)) & 0x7f ^
         *(byte *)((char *)DAT_0010190c + 0x13);
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
    iVar9 = DAT_0010190c;
    uVar1 = *(ushort *)((char *)DAT_0010190c + 0xb);
    uw_ord2005_rem_39 = ((int)((uVar1 >> 0xc) + 1)) % (4);
    uVar7 = uw_ord2005_rem_39;
  }
  *(char *)(iVar9 + 0xb) = (char)(uVar1 & 0xfff);
  *(byte *)((char *)DAT_0010190c + 0xc) = (byte)((uVar1 & 0xfff) >> 8) | (byte)(((uVar7 & 0xf) << 0xc) >> 8)
  ;
LAB_0002f810:
  npc_react_to_nearby_player();
  return;
}



// was FUN_0002fba8 -- goal 8: if attitude neutral and goal isn't
// already 4, resets to idle via npc_set_goal(4,1); else walks toward
// the home tile (DAT_0010143c/173c) via npc_walk_toward_tile if
// farther than a threshold, otherwise idles (npc_idle_behavior_tick)
void npc_wander_return_home_tick()

{
  uint uVar1;
  int iVar2;
  int iVar3;
  ushort *puVar4;
  
  if (DAT_00101734 != 0) {
    /* HACK: same ushort-vs-byte pointer-scaling bug as the rest of this
       NPC-AI cluster this session (see [[ushort-byte-scaling-bug-npc-cluster]])
       -- bare `DAT_0010190c + 0xe`/`+ 0xb` scaled to byte 0x1c/0x16
       (the latter being this object's real tile-position field) instead
       of the real disassembly's raw bytes 0xe and 0xb (0x2fbc4-0x2fbf8:
       `ldrb r3,[r0,#0xe]; ldrb r2,[r0,#0xd]; ...; ldrb r3,[r0,#0xc];
       ldrb r2,[r0,#0xb]; ...; and r3,r3,#0xf; cmp r3,#0x4` -- both raw).
       With the wrong read, this guard was evaluating against the (now
       frozen/stable) tile-position byte instead of the real state
       nibble, so this function's real body below (the actual
       step/collision check) may never have run as intended. */
    if (((*(byte *)((char *)DAT_0010190c + 0xe) & 0xc0) == 0) &&
       ((*(byte *)((char *)DAT_0010190c + 0xb) & 0xf) != 4)) {
      npc_set_goal(4,1);
      return;
    }
    iVar2 = ((int)DAT_0010143c - (int)DAT_00101918) * 0x1000000 >> 0x18;
    iVar3 = ((int)DAT_0010173c - (int)DAT_001013f8) * 0x1000000 >> 0x18;
    uVar1 = (uint)(*(byte *)(DAT_00101404 + 0x1c) >> 4);
    if (getenv("UW_DEBUG_NPC_MOVE"))
      fprintf(stderr, "[npc-move] obj=%p target=(%d,%d) cur=(%d,%d) dx=%d dy=%d thresh=%u distsq=%d %s\n",
              (void *)DAT_0010190c, (int)DAT_0010143c, (int)DAT_0010173c,
              (int)DAT_00101918, (int)DAT_001013f8, iVar2, iVar3, uVar1,
              iVar2*iVar2+iVar3*iVar3, (int)(uVar1*uVar1) < iVar2*iVar2+iVar3*iVar3 ? "WALK" : "idle");
    if ((int)(uVar1 * uVar1) < iVar2 * iVar2 + iVar3 * iVar3) {
      puVar4 = (ushort *)tilemap_lookup(DAT_0010143c,DAT_0010173c);
      npc_walk_toward_tile(DAT_0010143c,DAT_0010173c,*puVar4 >> 4 & 0xf);
    }
    else {
      npc_idle_behavior_tick();
    }
  }
  return;
}



// was FUN_0002fcec -- goal dispatch target for goals 0/4/7 (notice the
// player when attitude is neutral, otherwise idle frame-cycle default)
void npc_notice_and_idle_tick()

{
  int uw_ord2005_rem_41 = 0; int uw_ord2005_rem_42 = 0; int uw_ord2005_rem_43 = 0; int uw_ord2005_rem_44 = 0; int uw_ord2005_rem_45 = 0;
  byte bVar1;
  char *iVar2;
  char cVar3;
  undefined4 uVar4;
  ushort uVar5;
  int extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  uint uVar6;
  undefined1 local_18;
  undefined1 local_17 [3];
  
  if (DAT_00101734 == 0) {
    return;
  }
  /* HACK: DAT_0010190c is `ushort *`, so bare `DAT_0010190c + N` pointer
     arithmetic scales N by 2 -- correct for the handful of genuine 16-bit-
     array-style fields elsewhere in this file, but WRONG here: real
     disassembly (0x2fd0c-0x2fd44) reads/writes this object's raw BYTE
     offsets 0xe (a guard byte) and 0xb/0xc (a packed 16-bit field) via
     plain `ldrb/strb r,[r0,#N]` -- i.e. N is meant as a byte offset, not a
     ushort-array index. The undecorated `DAT_0010190c + 0xb` here instead
     computed byte offset 0x16 (0xb*2) -- which happens to be this object's
     REAL current-tile-position field (confirmed via a live lldb watchpoint
     on that address during a recorded repro, demo_critter.txt: the write
     below fired and corrupted the tile Y coordinate from 7 to 1 in a
     single tick, exactly matching the QA-reported "NPC disappears on its
     first tick" symptom -- process_visible_tile_cell's rendering sweep
     no longer reaches an object 6 tiles away). This function's real
     target (byte 0xb/0xc) is unrelated to position; cast to a byte
     pointer before adding so the offset isn't scaled. */
  if (getenv("UW_DEBUG_NPC_ATTITUDE")) {
    /* uw-formats.txt (4.3.3, "Mobile object extra info"): offset 0xd is
       a 16-bit field -- bits 0-3 npc_level, bit 13 npc_talkedto, bits
       14-15 npc_attitude. Byte 0xe is that field's high byte, so its
       own bits 6-7 (mask 0xc0) ARE npc_attitude, and bit 5 (mask 0x20)
       is npc_talkedto. Offset 0xb is likewise a 16-bit field -- bits
       0-3 npc_goal, bits 4-11 npc_gtarg -- matching this function's own
       "uVar6 & 0xf"-style dispatch nibble read elsewhere in this file. */
    ushort _de = *(ushort *)((char *)DAT_0010190c + 0xd);
    fprintf(stderr, "[npc-attitude] obj=%p npc_attitude=%d npc_talkedto=%d npc_level=%d npc_goal=%d\n",
            (void *)DAT_0010190c, (_de >> 14) & 3, (_de >> 13) & 1, _de & 0xf,
            (int)(*(ushort *)((char *)DAT_0010190c + 0xb) & 0xf));
  }
  if ((*(byte *)((char *)DAT_0010190c + 0xe) & 0xc0) == 0) {
    uVar6 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xf01f;
    *(byte *)((char *)DAT_0010190c + 0xb) = (byte)uVar6 | 0x10;
    *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar6 >> 8);
    refresh_npc_target_delta();
    if ((*(byte *)((char *)DAT_0010190c + 0x19) & 1) != 0) {
LAB_0002fe88:
      npc_set_goal(5,1);
      return;
    }
    if ((*(byte *)((char *)DAT_0010190c + 0x19) & 2) != 0) {
      uVar4 = Ordinal_1053();
      bVar1 = *(byte *)(DAT_00101404 + 0x1f);
      uw_ord2005_rem_41 = ((int)(uVar4)) % (0x10);
      if ((int)(uint)(bVar1 >> 4) < uw_ord2005_rem_41) {
        *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) & 0xfd;
      }
      else {
        check_npc_target_alignment(0);
      }
    }
    uVar4 = Ordinal_1053();
    bVar1 = *(byte *)(DAT_00101404 + 0x1f);
    uw_ord2005_rem_42 = ((int)(uVar4)) % (0x10);
    if (uw_ord2005_rem_42 < (int)(uint)(bVar1 >> 4)) {
      cVar3 = detect_npc_wander_proximity(local_17,&local_18);
      if (cVar3 == '\0') {
        *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) | 1;
        npc_set_walk_target(local_17[0],local_18,DAT_00101420);
        goto LAB_0002fe88;
      }
      if ((cVar3 != '\x01') && (cVar3 == '\x02')) {
        *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) | 2;
        uVar4 = Ordinal_1053();
        uw_ord2005_rem_43 = ((int)(uVar4)) % (2);
        if (uw_ord2005_rem_43 == 0) {
          npc_walk_toward_tile(local_17[0],local_18,DAT_00101420);
          return;
        }
      }
    }
  }
  /* HACK: same ushort-vs-byte pointer-scaling bug as the two other fixes
     in this NPC-AI cluster this session (see [[ushort-byte-scaling-bug-npc-cluster]])
     -- DAT_0010190c is `ushort *`, so bare `DAT_0010190c + 0xb` scales to
     byte offset 0x16 (this object's real tile-position field, since
     confirmed stable this session) instead of the raw byte 0xb the real
     disassembly reads here (0x2fe98-0x2feb0: `ldrb r3,[r0,#0xc]; ldrb
     r2,[r0,#0xb]; orr r3,r2,r3,lsl#8; ...; ands r1,r3,#0xf` -- byte 0xb's
     own low nibble, nothing to do with tile position). Cast to a byte
     pointer first. */
  uVar5 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xf;
  if (getenv("UW_DEBUG_NPC_WANDER"))
    fprintf(stderr, "[npc-fcec-dispatch] obj=%p uVar5=%d\n", (void *)DAT_0010190c, (int)uVar5);
  if ((*(ushort *)((char *)DAT_0010190c + 0xb) & 0xf) != 0) {
    if (uVar5 == 2) {
      npc_idle_behavior_tick();
      return;
    }
    if (uVar5 != 7) {
      npc_wander_return_home_tick();
      return;
    }
  }
  *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfe | 6;
  *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
  *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xe0 | 0x20;
  uVar4 = Ordinal_1053();
  uw_ord2005_rem_44 = ((int)(uVar4)) % (2);
  iVar2 = DAT_0010190c;
  if (uw_ord2005_rem_44 != 0) {
    /* HACK: this is the real frame-cycle step (advance this idle
       critter's animation frame, wrapping 0..3 -- see uVar5>>0xc, the
       upper nibble of raw byte 0xc, matching resolve_critter_sprite_tier's
       own "frame" param computed the same way in emit_tile_objects). Same
       scaling bug as the read above: bare `DAT_0010190c + 0xb`/`+ 0xc`
       hit bytes 0x16/0x18 (corrupting tile position and an unrelated
       byte) instead of the real bytes 0xb/0xc this data lives at
       (0x2ff38-0x2ff88: `ldrb r3,[r5,#0xc]; ldrb r2,[r5,#0xb]; ...;
       strb r3,[r5,#0xb]; ...; strb r3,[r0,#0xc]` -- all raw). With this
       never actually reaching the real frame byte, it stayed pinned at
       its spawn value (1, an alert/hostile-looking pose) forever instead
       of cycling through the idle set -- confirmed live via
       UW_FORCE_CRITTER_FRAME: frame 0 is a relaxed idle stance, frame 1
       is alert/weapon-ready, frame 2 is a lunge/attack pose. */
    uVar5 = *(ushort *)((char *)DAT_0010190c + 0xb);
    uw_ord2005_rem_45 = ((int)((uVar5 >> 0xc) + 1)) % (4);
    uVar6 = uVar5 & 0xfff;
    *(char *)(iVar2 + 0xb) = (char)uVar6;
    *(byte *)((char *)DAT_0010190c + 0xc) =
         (byte)(uVar6 >> 8) | (byte)(((uw_ord2005_rem_45 & 0xf) << 0xc) >> 8);
  }
  return;
}















// was FUN_00031fa8 -- goal 0xc: same shape as npc_wander_return_home_tick
// but an exact tile-equality check instead of a distance threshold --
// walk home (npc_walk_toward_tile) if not exactly there, idle if so
void npc_wander_return_home_exact_tick()

{
  int uw_ord2005_rem_84 = 0; int uw_ord2005_rem_85 = 0;
  ushort uVar1;
  char *iVar2;
  undefined4 uVar3;
  ushort *puVar4;
  int extraout_r1;
  uint extraout_r1_00;
  uint uVar5;
  
  if (DAT_00101734 != 0) {
    if (((*(byte *)((char *)DAT_0010190c + 0xe) & 0xc0) == 0) &&
       ((*(byte *)((char *)DAT_0010190c + 0xb) & 0xf) != 4)) {
      npc_set_goal(4,1);
    }
    else if ((DAT_0010143c == DAT_00101918) && (DAT_0010173c == DAT_001013f8)) {
      *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfe | 6;
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xe0 | 0x20;
      uVar3 = Ordinal_1053();
      uw_ord2005_rem_84 = ((int)(uVar3)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_84 != 0) {
        uVar1 = *(ushort *)((char *)DAT_0010190c + 0xb);
        uw_ord2005_rem_85 = ((int)((uVar1 >> 0xc) + 1)) % (4);
        uVar5 = uVar1 & 0xfff;
        *(char *)(iVar2 + 0xb) = (char)uVar5;
        *(byte *)((char *)DAT_0010190c + 0xc) =
             (byte)(uVar5 >> 8) | (byte)(((uw_ord2005_rem_85 & 0xf) << 0xc) >> 8);
      }
    }
    else {
      puVar4 = (ushort *)tilemap_lookup(DAT_0010143c,DAT_0010173c);
      npc_walk_toward_tile(DAT_0010143c,DAT_0010173c,*puVar4 >> 4 & 0xf);
    }
  }
  return;
}



// WARNING: Removing unreachable block (ram,0x0003223c)
// WARNING: Removing unreachable block (ram,0x00032258)
// WARNING: Removing unreachable block (ram,0x00032278)













/* HACK: whole-function fix, same ushort-vs-byte pointer-scaling bug as
   the rest of this NPC-AI cluster this session (see
   [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is
   `ushort *`, so every bare `DAT_0010190c + N` throughout this
   function (both the "orient toward last-seen-player" tail already
   fixed earlier, and everything else here, which hadn't been audited)
   was scaling N by 2. This function's own goal-dispatch switch
   (`switch(*(ushort *)(DAT_0010190c + 0xb) & 0xf)`) was reading byte
   offset 0x16 (part of this object's tile-position field) instead of
   the real goal nibble at raw byte 0xb -- verified against fresh
   disassembly (0x33d38-0x33d58: `ldrb r3,[r0,#0xc]; ldrb r2,[r0,#0xb];
   orr r3,r2,r3,lsl#8; ...; and r1,r3,#0xf; addls pc,pc,r1,lsl#2`, a
   real ARM jump table on raw unscaled bytes -- also confirmed at this
   function's own entry, 0x338bc-0x338d0, same pattern). A live trace
   comparing the scaled and correctly-cast reads found 0 matches out of
   75 samples in a short demo. This is the main per-tick goal dispatch
   for every NPC (idle, wander-to-target, chase, flee, ...); with it
   reading the wrong byte, any goal other than the ones that happen to
   alias to the same idle-dispatch target (0/4/7) got misrouted into
   idle handling instead of its real handler -- matching a QA report
   that a wandering NPC's walk ANIMATION played while its tile POSITION
   never advanced, since the real movement-stepping cases (1, 5, 6, 8,
   9, 10) were never actually reached. Cast every offset to a byte
   pointer throughout this function so none of them are scaled. */












/* HACK: whole-function fix, same ushort-vs-byte pointer-scaling bug as
   the rest of this NPC-AI cluster this session (see
   [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is
   `ushort *`, so every bare `DAT_0010190c + N` here was scaling N by
   2. Verified against fresh disassembly of this function's entry
   (0x343e4-0x34478): `ldrb r11,[r2,#0xc]; ldrb r10,[r2,#0xb]; ...;
   strb r0,[r2,#0xb]; ...; strb r2,[r0,#0xc]` -- all raw, unscaled
   bytes. THIS IS THE REAL "set a new NPC goal" FUNCTION --
   `*(byte *)(DAT_0010190c + 0xb) = param_1 & 0xf | ...` writes
   param_1's low nibble as the new goal -- called throughout this
   cluster with goal values 4, 5, 6, 8, 9 (npc_ai_default_tick's tail,
   npc_wander_return_home_tick's guard, etc.). With the write scaled to byte 0x16
   instead of the real byte 0xb, every call to "pick a new goal" was
   silently corrupting the object's TILE POSITION field instead of
   ever actually changing its goal -- meaning goal could structurally
   never change away from whatever it started at. This is very likely
   the actual root cause of a wandering NPC's walk animation playing
   while its tile position never advances: not just that the dispatch
   (fixed earlier) was misrouting whatever goal existed, but that goal
   itself could never transition to a real movement goal (1/5/6/9/10)
   in the first place. npc_clear_special_goal right below (its sibling, called
   from the same call sites' alternate branch) has the identical bug,
   fixed the same way. */
// was FUN_000343d8
void npc_set_goal(param_1,param_2)
byte param_1;
uint param_2;

{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  
  if ((*(byte *)((char *)DAT_0010190c + 0xb) & 0xf) == 4) {
    uVar1 = *(undefined2 *)((char *)DAT_0010190c + 0xd);
    bVar2 = (byte)uVar1;
    *(byte *)((char *)DAT_0010190c + 0xd) = (bVar2 ^ *(byte *)((char *)DAT_0010190c + 0xb)) & 0xf ^ bVar2;
    *(char *)((char *)DAT_0010190c + 0xe) = (char)((ushort)uVar1 >> 8);
  }
  uVar3 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff0;
  *(byte *)((char *)DAT_0010190c + 0xb) = param_1 & 0xf | (byte)uVar3;
  *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar3 >> 8);
  uVar3 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xf00f | (param_2 & 0xff) << 4;
  *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar3;
  *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar3 >> 8);
  return;
}



// was FUN_000344a4 -- npc_set_goal's sibling: fallback when a
// combat-engage goal's guard fails (player not detected / no path).
// Sets goal to 2 (idle) when npc_level's low nibble is 0, else XORs
// goal with a level-derived value and sets flag 0x10
void npc_clear_special_goal()

{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  
  if ((*(byte *)((char *)DAT_0010190c + 0xd) & 0xf) == 0) {
    uVar3 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff2;
    *(byte *)((char *)DAT_0010190c + 0xb) = (byte)uVar3 | 2;
    *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar3 >> 8);
    uVar3 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xf00f;
    *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar3;
    *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar3 >> 8);
  }
  else {
    uVar1 = *(undefined2 *)((char *)DAT_0010190c + 0xb);
    bVar2 = (byte)uVar1;
    *(byte *)((char *)DAT_0010190c + 0xb) = (bVar2 ^ *(byte *)((char *)DAT_0010190c + 0xd)) & 0xf ^ bVar2;
    *(char *)((char *)DAT_0010190c + 0xc) = (char)((ushort)uVar1 >> 8);
    uVar3 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xf01f;
    *(byte *)((char *)DAT_0010190c + 0xb) = (byte)uVar3 | 0x10;
    *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar3 >> 8);
    uVar3 = *(ushort *)((char *)DAT_0010190c + 0xd) & 0xfff0;
    *(char *)((char *)DAT_0010190c + 0xd) = (char)uVar3;
    *(char *)((char *)DAT_0010190c + 0xe) = (char)(uVar3 >> 8);
  }
  return;
}









// was FUN_0003495c. Checks whether an object's own 4-bit tick-phase
// field (param_1, from the low nibble of its class-record's phase byte)
// has caught up to the current dispatch target (DAT_00101928, set once
// per tick_mobile_objects call) within a small catch-up window, vs. the
// previous tick's target (DAT_00101948). Real ARM disassembly confirms
// this genuinely ignores its second (dropped) argument. Returning
// nonzero is tick_mobile_objects' entire loop-termination signal, since
// npc_ai_tick/mobile_object_tick's own return values don't reliably
// carry that meaning (npc_ai_tick always returns 1).
undefined4 object_tick_is_due(param_1)
short param_1;

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  
  iVar1 = (int)param_1;
  iVar3 = (int)DAT_00101928;
  if (((iVar1 < iVar3) && (iVar3 <= iVar1 + 4)) ||
     ((iVar1 < iVar3 + 0x10 && ((DAT_00101948 <= iVar1 && (iVar3 < DAT_00101948)))))) {
    uVar2 = 1;
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}






























// byte-identical duplicate body of clear_ambient_sound_target (was
// FUN_0007ec1c) at a different address -- same split-symbol/naming-
// collision pattern documented elsewhere in this file (e.g.
// close_strings_pak_file vs thunk_FUN_00078e28).
void thunk_FUN_0007ec1c()

{
  DAT_0024d008 = 0xff;
  DAT_0024fa10 = 0xff;
  DAT_0024f90c = 0xff;
  return;
}



























































































































// was FUN_0003bc40
void set_game_mode(param_1)
undefined4 param_1;

{
  *(char *)(DAT_00085a6c + 8) = (char)param_1;
  *(char *)(DAT_00085a6c + 9) = (char)((uint)param_1 >> 8);
  /* The real game mode lives at BYTE offset 8 of the DAT_00085a6c struct
     (== DAT_00085a6c[4] with its `short *` typing) -- that is what the
     0x3bc40 disasm writes (`strb [buf,#8]` / `[buf,#9]`) and what the
     keybinding dispatcher dispatch_key_binding reads (`ldrb [state,#8]`). Ghidra
     typed DAT_00085a6c as `short *`, so the two `*(char *)(DAT_00085a6c +
     8/9)` writes just above actually land at byte 16/18, and every
     `*(short *)(DAT_00085a6c + 8) == N` mode check elsewhere reads byte
     16 too -- self-consistent, so mode transitions still "work", but
     dispatch_key_binding's byte-8 read then always saw 0, so NO keybinding's
     mode mask ever matched and every table-dispatched key (the W/S/X/A/D
     movement keys, ...) was dead. Mirror the mode to byte 8 as well so
     the dispatcher sees it, without disturbing the byte-16 readers. */
  DAT_00085a6c[4] = (short)param_1;
  DAT_00201b60 = (short)param_1;
  if ((short)DAT_00201b60 != 1) {
    if ((short)DAT_00201b60 == 2) {
      DAT_00201b64 = 1;
      goto LAB_0003bcb0;
    }
    if ((short)DAT_00201b60 == 4) {
      DAT_00201b64 = 2;
      goto LAB_0003bcb0;
    }
  }
  DAT_00201b64 = 0;
LAB_0003bcb0:
  reset_cursor_confine_rect();
  return;
}



// was FUN_0003bcb8
void change_game_mode(param_1)
int param_1;

{
  code *pcVar1;
  bool bVar2;
  
  pcVar1 = (code *)(int)DAT_00201b64;
  /* Was `pcVar1 != (code *)0xffffffff` -- a 32-bit-pointer-sentinel idiom
     that's broken on this 64-bit host even after fixing DAT_00201b64's
     own signedness above: `pcVar1` sign-extends from a negative `int` to
     a full 64-bit all-ones pointer, but the literal `(code*)0xffffffff`
     zero-extends from an *unsigned* 32-bit constant to a 64-bit pointer
     with only its low 32 bits set -- the two never compare equal, so
     this guard was always true and let a disabled/-1 mode dispatch
     through a wild table index anyway. Compare the real source value
     instead of a fabricated pointer sentinel. */
  bVar2 = DAT_00201b64 != -1;
  if (bVar2) {
    /* 0x80 = 16 entries/mode * 8 bytes/entry (real pointer size) -- was
       0x40 (*4-byte entries), see DAT_00085668's comment. */
    pcVar1 = *(code **)(&DAT_000856a4 + (int)pcVar1 * 0x80);
  }
  if (bVar2 && pcVar1 != (code *)0x0) {
    (*pcVar1)();
  }
  if ((short)param_1 < 0) {
    param_1 = (int)DAT_00201c94;
  }
  else {
    DAT_00201c94 = (short)DAT_00201b60;
  }
  set_game_mode(param_1);
  /* 0x80, see DAT_00085668's comment. Guarded the same way the dispatch
     a few lines up is (DAT_00201b64 == -1 is the documented "no mode"
     sentinel, uw.c ~27530/27774) -- unguarded, this indexed a wild
     negative offset off the front of DAT_00085668_real_table whenever
     this ran with dispatch still disabled (confirmed live: an ASan
     global-buffer-overflow here in demo_automap_note_test.txt, right
     after fixing the sibling site above's zero-extension bug). */
  if ((DAT_00201b64 != -1) && (*(code **)(&DAT_00085668 + DAT_00201b64 * 0x80) != (code *)0x0)) {
    (**(code **)(&DAT_00085668 + DAT_00201b64 * 0x80))();
  }
  if ((short)param_1 != 1) {
    set_pending_update_flags(0x7ffe);
  }
  return;
}









// was FUN_0003c194 -- mode-0 dirty-bit-3 handler: advance the in-progress
// step/turn view animation one tick (interpolate the player tile position
// via find_placement_via_tile_flood_fill) and redraw the dungeon view around it. Does nothing
// unless an animation is queued (0 < DAT_00201c90). DAT_00085730 bit 0
// gates the mid-animation full_dungeon_redraw, bit 1 the on-completion
// redraw + set_pending_update_flags(0x7ffe).
undefined4 dungeon_view_anim_tick()

{
  int iVar1;
  short local_20;
  short local_1e;
  
  if (0 < DAT_00201c90) {
    if ((DAT_00085730 & 1) != 0) {
      full_dungeon_redraw();
      weapon_overlay_flash_hold((int)g_visibility_max_ring_passes);
    }
    if (DAT_00201b68 != DAT_00201c7c) {
      iVar1 = transition_to_level();
      if (iVar1 == 0) {
        report_fatal_error_and_exit(0x300c);
      }
      DAT_00201b68 = DAT_00201c7c;
    }
    if (DAT_00201c9c != (code *)0x0) {
      (*DAT_00201c9c)();
    }
    iVar1 = find_placement_via_tile_flood_fill(g_player_object,(int)DAT_00201c90,(int)DAT_00201c8c,&local_20,&local_1e,0);
    if ((iVar1 == 0) &&
       (iVar1 = find_placement_via_tile_flood_fill(g_player_object,(int)DAT_00201c90,(int)DAT_00201c8c,&local_20,&local_1e,1)
       , iVar1 == 0)) {
      DAT_00201c90 = 0;
      *(undefined1 *)((char *)g_player_object + 8) = 0;
      return 0;
    }
    DAT_00201c90 = local_20;
    DAT_00201c8c = local_1e;
    set_player_tile_position((int)local_20,(int)local_1e,1);
    if ((DAT_00085730 & 2) != 0) {
      full_dungeon_redraw();
      weapon_overlay_flash_restore((int)g_visibility_max_ring_passes);
    }
    DAT_00201c90 = 0;
    if ((DAT_00085730 & 2) != 0) {
      set_pending_update_flags(0x7ffe);
    }
  }
  return 1;
}









// was FUN_0003c4dc -- set the player's swim/wade sub-pose byte
// (DAT_00086df8+0xb9) from the collision-state mask's "in liquid, how deep"
// bit (0x2): shallow (0x10) vs deep/wading (0x60, also force-leaving
// combat stance via unready_weapon -- can't hold a weapon ready while
// swimming). Returns true for the deep case. Only ever called from
// set_locomotion_state's swim branch.
bool apply_swim_wade_pose(param_1)
ushort param_1;

{
  bool bVar1;

  bVar1 = (param_1 & 2) == 0;
  if (bVar1) {
    *(undefined1 *)(DAT_00086df8 + 0xb9) = 0x10;
  }
  else {
    *(undefined1 *)(DAT_00086df8 + 0xb9) = 0x60;
    unready_weapon();
  }
  return !bVar1;
}






// was FUN_0003c7f4 -- translate a W/S/X/A/D direction arg (-2..2) into
// movement-engine target state (heading-relative goal position/heading).
undefined4 begin_directional_move(param_1)
short param_1;

{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  char *uVar4;
  int extraout_r1;
  uint uVar5;
  ushort uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  undefined8 uVar11;
  ushort local_44;
  ushort local_42;
  uint local_40;
  undefined2 local_3c;
  undefined2 local_3a;
  ushort local_38;
  byte local_34;
  undefined1 local_33;
  undefined2 local_32;
  
  if (getenv("UW_DEBUG_STEPHEIGHT"))
    fprintf(stderr, "[bdm-entry] param_1=%d g_fall_accel=%d g_jump_ascent_timer=%d DAT_00085890=%d z=%d guard=%d\n",
            (int)param_1, (int)g_fall_accel, (int)g_jump_ascent_timer, (int)DAT_00085890, (int)DAT_00204884,
            (g_fall_accel == 0) && (g_jump_ascent_timer < DAT_00085890));
  if ((g_fall_accel == 0) && (g_jump_ascent_timer < DAT_00085890)) {
    uVar10 = 0;
    if (param_1 == -2) {
      uVar4 = 0x40;
      iVar7 = (short)DAT_00201c70 + 0x8000;
LAB_0003c940:
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0xff;
      }
      local_44 = DAT_00204880;
      local_40 = (uint)((DAT_0020208c & 0x14) != 0);
      uVar5 = local_40;
      local_42 = DAT_00204882;
      project_position_by_heading((int)(short)((uint)iVar7 >> 8),uVar4,&local_44,&local_42);
      iVar7 = (int)(short)local_44;
      iVar8 = (int)(short)local_42;
      if (iVar8 < 0) {
        iVar8 = iVar8 + 0x1f;
      }
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0x1f;
      }
      iVar7 = FUN_00051fa0(0x7f,1,(int)(short)(iVar7 >> 5),(int)(short)(iVar8 >> 5),
                           *(byte *)((char *)g_player_object + 2) & 0x7f,uVar5 | uVar10,8);
      if ((iVar7 == 0) ||
         ((((uVar10 == 0 && (uVar3 = (uint)DAT_00202c68, uVar3 != 1)) && (uVar3 != DAT_00202084)) &&
          ((uVar3 != 0x10 || (uVar5 == 0)))))) goto LAB_0003cdf8;
      DAT_00204880 = local_44;
      DAT_00204882 = local_42;
      iVar9 = ((int)(short)local_42 >> 8) * 0x40 + (((int)(short)local_44 << 0x10) >> 0x18);
      iVar8 = (int)DAT_00202080;
      iVar7 = iVar9 * 0x10000 >> 0x10;
      if (iVar7 != iVar8) {
        if (iVar8 != -1) {
          object_list_unlink(DAT_002029cc + iVar8 * 4 + 2,g_player_object);
        }
        DAT_00202080 = (short)iVar9;
        object_list_insert_head(DAT_002029cc + iVar7 * 4 + 2,g_player_object);
        uVar6 = DAT_00204880 & 0x3f00;
        uVar5 = *(ushort *)((char *)g_player_object + 0x16) & 0x3ff;
        *(char *)((char *)g_player_object + 0x16) = (char)uVar5;
        *(byte *)((char *)g_player_object + 0x17) =
             (byte)(uVar5 >> 8) | (byte)((uint)(((int)(short)uVar6 >> 8) << 10) >> 8);
        uVar5 = *(ushort *)((char *)g_player_object + 0x16) & 0xfc0f |
                ((int)(short)(DAT_00204882 & 0x3f00) >> 8) << 4;
        *(char *)((char *)g_player_object + 0x16) = (char)uVar5;
        *(char *)((char *)g_player_object + 0x17) = (char)(uVar5 >> 8);
        uVar5 = local_40;
      }
      uVar6 = DAT_00204880 & 0xe0;
      uVar3 = *(ushort *)((char *)g_player_object + 2) & 0x1fff;
      *(char *)((char *)g_player_object + 2) = (char)uVar3;
      *(byte *)((char *)g_player_object + 3) =
           (byte)(uVar3 >> 8) | (byte)((uint)(((int)(short)uVar6 >> 5) << 0xd) >> 8);
      uVar6 = DAT_00204882 & 0xe0;
      uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xe3ff;
      *(char *)((char *)g_player_object + 2) = (char)uVar3;
      *(byte *)((char *)g_player_object + 3) =
           (byte)(uVar3 >> 8) | (byte)((uint)(((int)(short)uVar6 >> 5) << 10) >> 8);
      if (getenv("UW_DEBUG_STEPHEIGHT"))
        fprintf(stderr, "[stepsnap] uVar10=%u uVar5=%u cur_z=%d DAT_00202c30=%d snap=%d\n",
                uVar10, uVar5, (int)DAT_00204884, (int)DAT_00202c30,
                (((uVar10 == 0) && (uVar5 == 0)) || (((int)DAT_00204884 >> 3) + -8 <= (int)DAT_00202c30)));
      if (((uVar10 == 0) && (uVar5 == 0)) || (((int)DAT_00204884 >> 3) + -8 <= (int)DAT_00202c30)) {
        uVar1 = *(undefined2 *)((char *)g_player_object + 2);
        bVar2 = (byte)uVar1;
        *(byte *)((char *)g_player_object + 2) = (bVar2 ^ (byte)DAT_00202c30) & 0x7f ^ bVar2;
        *(char *)((char *)g_player_object + 3) = (char)((ushort)uVar1 >> 8);
        DAT_00204884 = DAT_00202c30 << 3;
      }
      else if (g_fall_accel == 0 && uVar5 == 0) {
        g_fall_accel = -4;
      }
      set_locomotion_state((int)DAT_00202c68,0);
      uVar10 = read_realtime_clock_units();
      uVar5 = *(ushort *)((char *)g_player_object + 0xb) & 0xfff;
      *(char *)((char *)g_player_object + 0xb) = (char)uVar5;
      *(byte *)((char *)g_player_object + 0xc) = (byte)(uVar5 >> 8) | (byte)(((uVar10 & 0xc0) << 6) >> 8);
      uVar4 = DAT_00202c6c;
      DAT_00202c6c = &local_3c;
      local_32 = 1;
      local_33 = DAT_00203303;
      local_34 = (byte)DAT_00203304 & 7;
      iVar7 = (int)(short)local_44;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0x1f;
      }
      local_3c = (undefined2)(iVar7 >> 5);
      iVar7 = (int)(short)local_42;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0x1f;
      }
      local_3a = (undefined2)(iVar7 >> 5);
      local_38 = *(byte *)((char *)g_player_object + 2) & 0x7f;
      collision_height_envelope(0,0);
      FUN_00051dd0();
      iVar8 = (int)*(char *)(DAT_00202c6c + 0xb);
      iVar7 = (int)(short)*(char *)(DAT_00202c6c + 0xb);
      if (iVar7 < (int)(iVar8 + (uint)*(byte *)((char *)DAT_00202c6c + 0x15))) {
        do {
          uVar11 = resolve_object_link(&DAT_00202c3a + iVar7 * 6,iVar8);
          /* Was `iVar8 = (int)((ulonglong)uVar11 >> 0x20);` -- a leftover
             from the original 32-bit ARM ABI, where resolve_object_link's
             caller apparently re-read some other value out of r1 right
             after the call (Ghidra folded it into a fake 64-bit return
             value, r0:r1). On this 64-bit recompile resolve_object_link
             returns a real, single 64-bit pointer with no second value
             riding along in its "upper half" -- (ulonglong)uVar11 >> 0x20
             was just the pointer's own high address bits, reinterpreted
             as iVar8 and clobbering this loop's own bound (iVar8 is the
             loop's own upper limit, from DAT_00202c6c+0xb/0x15) with
             garbage every single iteration after the first. That let
             iVar7 walk arbitrarily far past the real candidate range,
             feeding wild indices into resolve_object_link on later
             iterations -- confirmed via the very "negative slot"/"exceeds
             0x3ff" FUN_000535fc warnings logged just before this crash.
             Also add the missing NULL guard resolve_object_link's other
             call sites already needed: an out-of-range link now returns
             NULL, and this dereferenced it unconditionally (confirmed via
             lldb, EXC_BAD_ACCESS at address 0). */
          if (uVar11 == 0) break;
          if ((*(ushort *)uVar11 & 0x1ff) == 0x1a0) {
            resolve_skill_gated_unlock_or_use(g_player_object,0,(ushort *)uVar11,0);
            iVar8 = extraout_r1;
          }
          iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
        } while (iVar7 < (int)((uint)*(byte *)((char *)DAT_00202c6c + 0x15) +
                              (int)*(char *)(DAT_00202c6c + 0xb)));
      }
    }
    else {
      if (param_1 == 0) {
LAB_0003c920:
        uVar4 = 0x80;
        iVar7 = (int)(short)DAT_00201c70;
        goto LAB_0003c940;
      }
      if (param_1 == 2) {
        uVar10 = 1;
        goto LAB_0003c920;
      }
      if ((DAT_00201c70 & 0x1fff) == 0) {
        DAT_00201c70 = DAT_00201c70 + param_1 * 0x2000;
      }
      else {
        DAT_00201c70 = (DAT_00201c70 & 0xe000) + (ushort)(0 < param_1) * 0x2000;
      }
      uVar10 = *(ushort *)((char *)g_player_object + 2) & 0xfc7f | ((int)(short)DAT_00201c70 >> 0xd & 7U) << 7;
      *(char *)((char *)g_player_object + 2) = (char)uVar10;
      *(char *)((char *)g_player_object + 3) = (char)(uVar10 >> 8);
      *(byte *)((char *)g_player_object + 0x18) =
           ((byte)(DAT_00201c70 >> 8) ^ *(byte *)((char *)g_player_object + 0x18)) & 0x1f ^
           *(byte *)((char *)g_player_object + 0x18);
      uVar4 = DAT_00202c6c;
    }
    DAT_00202c6c = (undefined2 *)uVar4;
    uVar4 = 1;
  }
  else {
LAB_0003cdf8:
    uVar4 = 0;
  }
  if (getenv("UW_DEBUG_STEPHEIGHT"))
    fprintf(stderr, "[bdm-exit] moved=%d z=%d g_fall_accel=%d bea8=%d be98=%d\n",
            (int)uVar4, (int)DAT_00204884, (int)g_fall_accel, (int)DAT_0023bea8, (int)DAT_0023be98);
  return uVar4;
}



// was FUN_0003ce04
void apply_heading_turn(param_1)
undefined4 param_1;

{
  uint uVar1;
  uint uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  short local_18 [2];
  
  local_18[0] = 0;
  if ((g_fall_accel == 0) && (resolve_move_vector((int)g_movement_mode,param_1,local_18), g_fall_accel == 0))
  {
    iVar5 = (int)local_18[0] - (int)g_jump_ascent_timer;
    uVar1 = iVar5 * 0x10000 >> 0x10;
    uVar2 = iVar5 * 0x10000 >> 0x1f;
    if ((int)DAT_00085890 < (int)((uVar1 ^ uVar2) - uVar2)) {
      sVar4 = 1;
      if ((int)uVar1 < 1) {
        sVar4 = -1;
      }
      iVar5 = (int)sVar4 * (int)DAT_00085890;
    }
    iVar5 = g_jump_ascent_timer + iVar5;
    iVar3 = iVar5 * 0x10000 >> 0x10;
    g_jump_ascent_timer = DAT_00202078;
    if ((iVar3 <= DAT_00202078) && (g_jump_ascent_timer = (short)iVar5, iVar3 < 0)) {
      g_jump_ascent_timer = 0;
    }
  }
  if (g_fall_accel != 0) {
    iVar5 = (int)DAT_0023bf4c;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 3;
    }
    iVar5 = (iVar5 >> 2) * (int)DAT_00086e68 * (int)(short)param_1;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 3;
    }
    DAT_00201c70 = DAT_00201c70 + (short)(iVar5 >> 2);
  }
  DAT_00204892 = (short)param_1;
  DAT_00204896 = 5;
  DAT_00204897 = 0;
  if ((g_fall_accel == 0 && DAT_0020488e == 0) && DAT_0020488c == 0) {
    DAT_00204897 = 0x80;
  }
  sVar4 = DAT_00201c70;
  if (g_jump_ascent_timer != 0) {
    sVar4 = DAT_00201c78;
  }
  DAT_00201c78 = sVar4;
  DAT_002048a1 = (char)DAT_00201c78;
  DAT_002048a2 = (char)((ushort)DAT_00201c78 >> 8);
  DAT_002048b0 = 0;
  if ((DAT_0020208c & 0x14) != 0) {
    DAT_002048b0 = 0x1000;
    DAT_00204897 = 0x80;
  }
  DAT_002048a9 = 0;
  DAT_002048aa = 0;
  return;
}









void toggle_stats_panel()

{
  undefined4 uVar1;

  if (getenv("UW_DEBUG_CLICKREGION"))
    fprintf(stderr, "[stats] toggle_stats_panel (toggle stats panel) entry: g_active_hud_panel=%d\n", (int)g_active_hud_panel);
  if (g_active_hud_panel == '\0') {
    uVar1 = 2;
  }
  else {
    if (g_active_hud_panel == '\x04') {
      return;
    }
    uVar1 = 0;
  }
  if (getenv("UW_DEBUG_CLICKREGION"))
    fprintf(stderr, "[stats] toggle_stats_panel -> set_hud_status_value(6,%d)\n", (int)uVar1);
  set_hud_status_value(6,uVar1);
  return;
}






/* param_2 (the picked object, g_interact_target -- a real ushort*) and param_3
   (DAT_002020b0 -- a tilemap byte address) were both declared `int`,
   truncating the 64-bit pointers every caller passes; param_2 is then
   dereferenced at `*(ushort *)(param_2 + 2)` and param_3 differenced
   against the 64-bit tilemap base DAT_0023b814. Same pointer-truncation
   class as the rest of this session. */
// was FUN_0003e694
undefined4 target_in_range(param_1,param_2,param_3)
short param_1;
char *param_2;
char *param_3;

{
  short sVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  ushort uVar5;
  ushort uVar6;
  undefined4 uVar7;
  uint uVar8;

  sVar1 = (short)((int)(param_3 - (char *)DAT_0023b814) >> 2);
  uVar8 = (int)sVar1 & 0x3f;
  DAT_002020a0 = (undefined2)uVar8;
  iVar3 = (int)sVar1 >> 6;
  DAT_002020a4 = (undefined2)iVar3;
  if (param_1 == 0) {
    uVar7 = 1;
  }
  else {
    uVar5 = *(ushort *)((char *)g_player_object + 2);
    uVar6 = *(ushort *)(param_2 + 2);
    iVar2 = ((((uint)(uVar6 >> 0xd) + (uint)(*(ushort *)((char *)g_player_object + 0x16) >> 10) * -8) -
             (uint)(uVar5 >> 0xd)) + uVar8 * 8) * 0x10000;
    uVar8 = iVar2 >> 0x1f;
    iVar3 = (((((uVar6 & 0x1c00) >> 10) + ((*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4) * -8) -
             ((uVar5 & 0x1c00) >> 10)) + iVar3 * 8) * 0x10000;
    uVar4 = iVar3 >> 0x1f;
    iVar2 = (int)(((iVar2 >> 0x10 ^ uVar8) - uVar8) * 0x10000) >> 0x10;
    iVar3 = (int)(((iVar3 >> 0x10 ^ uVar4) - uVar4) * 0x10000) >> 0x10;
    if (((iVar2 * iVar2 + iVar3 * iVar3 <= (int)param_1) &&
        (iVar3 = (int)(((uVar5 & 0x7f) - (uVar6 & 0x7f)) * 0x10000) >> 0x10,
        iVar3 <= (DAT_0023bc94 + 1) * 0xc)) && ((-1 - DAT_0023bc94) * 0x18 <= iVar3)) {
      return 1;
    }
    uVar7 = 0;
  }
  return uVar7;
}



// was FUN_0003e83c
uint object_chain_max_barrier(param_1)
char *param_1;   /* was int -- truncated the tile-record pointer target_line_of_sight passes */

{
  ushort *puVar1;
  uint uVar2;

  uVar2 = 0xffffffff;
  puVar1 = (ushort *)(param_1 + 2);
  while (puVar1 = (ushort *)resolve_object_link(puVar1), puVar1 != (ushort *)0x0) {
    if ((*puVar1 & 0x1ff) == 0x164) {
      if ((short)uVar2 < (short)(puVar1[1] & 0x7f)) {
        uVar2 = (int)(short)puVar1[1] & 0x7f;
      }
    }
    puVar1 = puVar1 + 2;
  }
  return uVar2;
}



// was FUN_0003e8b0
undefined4 target_line_of_sight(param_1,param_2)
short param_1;
char *param_2;  /* was int -- truncated g_interact_target; deref'd at param_2+2 */

{
  bool bVar1;
  ushort uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  byte *pbVar6;
  short sVar7;
  short sVar8;
  uint uVar9;
  uint uVar10;
  short sVar11;
  uint uVar12;
  uint uVar13;
  int iVar14;
  
  if (param_1 != 0) {
    uVar2 = *(ushort *)((char *)g_player_object + 0x16) >> 10;
    uVar9 = (uint)uVar2;
    uVar10 = (*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4;
    /* tilemap_lookup returns a 64-bit tile-record pointer; `int iVar5`
       truncated it and the very next line dereferenced the result. Use
       the byte* local this function already has for the same call later. */
    pbVar6 = (byte *)tilemap_lookup(uVar9,uVar10);
    uVar13 = (uint)DAT_002020a4;
    sVar4 = (&DAT_0023ae40)[pbVar6[1] >> 2 & 0xf];
    uVar12 = (uint)DAT_002020a0;
    iVar14 = (int)DAT_002020a0;
    iVar5 = (int)(short)uVar2;
    sVar7 = (short)uVar10;
    if ((iVar14 != iVar5) || (DAT_002020a4 != sVar7)) {
      if (iVar14 < iVar5) {
        sVar11 = -1;
      }
      else {
        sVar11 = 1;
        if (iVar14 <= iVar5) {
          sVar11 = 0;
        }
      }
      if (DAT_002020a4 < sVar7) {
        sVar8 = -1;
      }
      else {
        sVar8 = 1;
        if (DAT_002020a4 <= sVar7) {
          sVar8 = 0;
        }
      }
      iVar5 = ((DAT_0023bc94 + 1) * 0x10000 >> 0x10) << 0x13;
      uVar2 = *(byte *)((char *)g_player_object + 2) & 0x7f;
      if (iVar5 >> 0x10 < (int)(short)uVar2) {
        sVar7 = uVar2 - (short)((uint)iVar5 >> 0x10);
      }
      else {
        sVar7 = 0;
      }
      iVar5 = (int)(short)(*(byte *)(param_2 + 2) & 0x7f);
      iVar3 = (int)sVar7;
      if ((iVar3 <= iVar5) &&
         (iVar5 <= iVar3 + ((((DAT_0023bc94 + 1) * 0x10000 >> 0x10) << 0x15) >> 0x10))) {
        do {
          uVar9 = uVar9 + (int)sVar11;
          if (((sVar11 < 0) && ((int)(uVar9 * 0x10000) >> 0x10 < iVar14)) ||
             ((0 < sVar11 && (iVar14 < (int)(uVar9 * 0x10000) >> 0x10)))) {
            uVar9 = uVar12;
          }
          uVar10 = uVar10 + (int)sVar8;
          if (((sVar8 < 0) && ((int)(uVar10 * 0x10000) >> 0x10 < (int)(short)uVar13)) ||
             ((0 < sVar8 && ((int)(short)uVar13 < (int)(uVar10 * 0x10000) >> 0x10)))) {
            uVar10 = uVar13;
          }
          pbVar6 = (byte *)tilemap_lookup(uVar9,uVar10);
          sVar7 = object_chain_max_barrier((char *)pbVar6);  /* arg dropped by Ghidra -- it's the tile just looked up */
          bVar1 = false;
          iVar14 = (int)sVar7;
          if ((((iVar14 < 0) || (iVar5 < iVar14)) || (bVar1 = iVar3 <= iVar14, !bVar1)) &&
             (((int)(uint)(*pbVar6 >> 4) < iVar3 >> 3 && (param_1 == 0x90)))) {
            return 1;
          }
          uVar12 = (uint)DAT_002020a0;
          uVar13 = (uint)DAT_002020a4;
          iVar14 = (int)DAT_002020a0;
          if (((short)uVar9 == iVar14) && ((short)uVar10 == DAT_002020a4)) {
            return 0;
          }
        } while ((((0x90 < param_1) || (bVar1)) ||
                 ((ushort)(&DAT_0023ae40)[pbVar6[1] >> 2 & 0xf] == 0)) ||
                ((uint)(ushort)(&DAT_0023ae40)[pbVar6[1] >> 2 & 0xf] == (int)sVar4));
      }
      return 1;
    }
  }
  return 0;
}



// was FUN_0003ec00
ushort *pick_object_under_cursor()

{
  byte bVar1;
  int iVar2;
  ushort *puVar3;
  uint uVar4;
  /* FUN_0005bac0() re-renders the HUD+3D view in "pick" mode so the
     per-pixel object/texture id buffer DAT_0023cca0 this function reads
     below is fresh for the current cursor position. It used to crash via
     process_visible_tile_cell (the DAT_0023b4f4 split-symbol -- a short[]
     pick table written inside a function pointer); with that fixed the
     re-render is safe, so it runs by default. Set UW_DISABLE_PICK_RERENDER
     to skip it (picks then read a stale buffer). */
  { static int _rr = -1;
    if (_rr < 0) _rr = (getenv("UW_DISABLE_PICK_RERENDER") == NULL);
    if (_rr) FUN_0005bac0();
  }
  iVar2 = 0;
  DAT_002020ac = 0;
  /* Guard never present in the decompile: nothing bounds-checked
     g_mouse_x/g_mouse_y against the 3D viewport's own registered rect
     (DAT_0023be5c/DAT_0023bd80 x-range, DAT_0023be80-DAT_0023be88..
     DAT_0023be80 y-range -- the same rect register_game_view_interact_zones registers for
     handle_game_view_click and hit_test_inventory_widget already reuses for its own 0x17
     special case) before indexing the pick stencil DAT_0023cca0. That
     was harmless while every right-click interact stayed inside the
     viewport, but a held drag whose release lands elsewhere (e.g. the
     inventory panel) still routes through here -- see handle_game_view_click,
     called every tick a mouse button is held regardless of the
     cursor's current position -- and reads/interprets whatever stale
     byte happens to sit at that (out-of-viewport) stencil offset as a
     real object slot, corrupting interact_default's pick and crashing
     deep in place_object_in_backpack_slot/check_object_fits_in_slot (found wiring up backpack-slot
     drops). Treat anything outside the viewport as "no object". */
  if ((g_mouse_x < DAT_0023be5c) || (DAT_0023be5c + DAT_0023bd80 <= g_mouse_x) ||
      (g_mouse_y < (short)(DAT_0023be80 - DAT_0023be88)) || (DAT_0023be80 <= g_mouse_y)) {
    return (ushort *)0x0;
  }
  bVar1 = *(byte *)(g_mouse_y * 0x140 + (int)g_mouse_x + DAT_0023cca0);
  uVar4 = (uint)bVar1;
  { const char *_f = getenv("UW_PICK_FORCE_SLOT");   /* debug: force the object branch */
    if (_f && (uint)DAT_0023b830 > 1) { uVar4 = (uint)atoi(_f); if (uVar4 == 0 || uVar4 >= (uint)DAT_0023b830) uVar4 = 1; bVar1 = (byte)uVar4; } }
  int _pick_diag = g_uw_debug_pick_diag || (getenv("UW_PICK_DIAG") != NULL);
  if (_pick_diag)
    fprintf(stderr, "[pick] mx=%d my=%d stencil=0x%02x nobj=%d\n",
            (int)g_mouse_x, (int)g_mouse_y, uVar4, (int)DAT_0023b830);
  if ((uVar4 == 0) || (DAT_0023b830 <= uVar4)) {
    if ((0xbf < uVar4) && (uVar4 < 0xfb)) {
      DAT_002020ac = bVar1 - 0xbf;
    }
  }
  else {
    iVar2 = (int)*(short *)(&DAT_0023b676 + uVar4 * 2);
    DAT_002020b0 = (char *)(DAT_0023b814 +
        *(short *)((intptr_t)g_pick_tile_off_backing + uVar4 * 2 + 2) * 4);
  }
  if ((short)iVar2 == 0) {
    puVar3 = (ushort *)0x0;
  }
  else {
    puVar3 = (ushort *)FUN_000535fc(iVar2);

    if(puVar3) {
      DEBUG(INFO, "[pick] found slot=%u -> objid=0x%03x", uVar4, (unsigned)(*puVar3 & 0x1ff));
      if (_pick_diag)
        fprintf(stderr, "[pick] found slot=%u -> objid=0x%03x ptr=%p\n", uVar4, (unsigned)(*puVar3 & 0x1ff), (void *)puVar3);
    }

    DAT_002020a8 = DAT_002020b0 + 2;
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[pick-grab] puVar3=%p type=0x%x classbit20=%d in_arena=%d off10=0x%x off13=0x%x off14=0x%x off15=0x%x off4000=%d\n",
              (void *)puVar3, (unsigned)(*puVar3 & 0x1ff),
              (int)((&DAT_00202c98)[(*puVar3 & 0x1ff) * 0xd] & 0x20),
              (int)object_ptr_in_arena((char *)puVar3),
              (unsigned)*(byte *)((char *)puVar3 + 10), (unsigned)*(byte *)((char *)puVar3 + 0x13),
              (unsigned)*(byte *)((char *)puVar3 + 0x14), (unsigned)*(byte *)((char *)puVar3 + 0x15),
              (int)((*puVar3 & 0x4000) != 0));
    if ((((&DAT_00202c98)[(*puVar3 & 0x1ff) * 0xd] & 0x20) != 0) &&
       (iVar2 = object_ptr_in_arena(puVar3), iVar2 == 0)) {
      DAT_002020ec = 1;
      return puVar3;
    }
    DAT_002020ec = 0;
  }
  return puVar3;
}



// was FUN_0003ed6c
void describe_picked_terrain(param_1,param_2)
byte param_1;
short param_2;

{
  int iVar1;
  uint uVar2;
  
  if ((param_2 < 1) || (param_1 != 2)) {
    print_scroll_message_by_id(param_1 + 0x98);
  }
  else {
    iVar1 = (param_2 + -1) * 0x10000 >> 0x10;
    if (iVar1 < 0x30) {
      uVar2 = (uint)(short)(&DAT_0023ae58)[iVar1];
    }
    else if (iVar1 < 0x3a) {
      uVar2 = 0x1fe - (int)*(short *)(&DAT_0023ad58 + iVar1 * 2);
    }
    else {
      uVar2 = 0x1ff;
    }
    message_scroll_print_wrapped(s_You_see_000858fc);
    get_message_string(uVar2 | 0x1400);
    message_scroll_print_wrapped();
    message_scroll_print_wrapped(&DAT_00084f20);
    /* Same missing-newline issue as dispatch_object_action/dispatch_object_action_dup's own
       fix -- back-to-back terrain Looks (e.g. the ceiling, wall signs)
       otherwise all land on the same visible scroll line. */
    message_scroll_print_wrapped("\n");
  }
  return;
}












// was FUN_000400a0 -- toggles combat stance on/off; the weapon-hand
// paperdoll slot's click handler (handle_object_drop_target) calls
// this.
void toggle_weapon_ready()

{
  if (getenv("UW_DEBUG_COMBAT"))
    fprintf(stderr, "[weapon-ready] toggle_weapon_ready CALLED: flags5f=0x%x\n", (unsigned)*(byte *)(DAT_00086df8 + 0x5f));
  if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) {
    ready_weapon();
  }
  else {
    unready_weapon();
  }
  if (getenv("UW_DEBUG_COMBAT"))
    fprintf(stderr, "[weapon-ready] toggle_weapon_ready DONE: flags5f=0x%x g_cursor_mode=%d\n", (unsigned)*(byte *)(DAT_00086df8 + 0x5f), (int)g_cursor_mode);
  return;
}












/* Extracted from decode_critter_sprite_page (was inlined at its top) so
   resolve_critter_sprite_tier can also load/cache a candidate tier's
   page and inspect its real (base, span) -- see that function's own
   comment for why. Behavior unchanged: same page-cache array
   (DAT_00202308), same filename-building convention, same graceful
   NULL-return-on-missing-file contract (decode_critter_sprite_page's
   caller-visible dummy_page sentinel is now applied at its own call
   site instead of inside this helper). */
byte *uw_load_critter_page_cached(int param_1, int param_2) {
  char stack0xffdc3238_buf [256];
  char *stack0xffdc3238_ptr;
  int iVar1;
  char cVar2;
  char *pcVar4;
  int iVar5;
  byte *pbVar11;

  /* Tracks (page,tier) slots already confirmed to have no file, separate
     from DAT_00202308 (0=never tried, else=a real Ordinal_1041 pointer
     that shutdown_game_resources unconditionally frees at shutdown -- stuffing a
     sentinel in there instead would make that loop free garbage).
     Needed because resolve_critter_sprite_tier now probes every tier
     0-3 looking for the one whose range covers a given direction, and
     most creatures only ever have tiers 0-1 (see that function's own
     comment); without this, tiers 2-3 would re-attempt a failing disk
     open every single call. */
  static char known_missing[256];

  iVar1 = (param_2 + param_1 * 4) * 0x10000 >> 0x10;
  if ((unsigned)iVar1 < sizeof(known_missing) && known_missing[iVar1]) {
    return (byte *)0;
  }
  pbVar11 = (byte *)(&DAT_00202308)[iVar1];
  if (pbVar11 == (byte *)0x0) {
    DAT_00085928 = (char)((short)param_1 >> 3) + '0';
    DAT_00085929 = ((byte)param_1 & 7) + 0x30;
    DAT_00085930 = (char)((short)param_2 >> 3) + '0';
    DAT_00085931 = ((byte)param_2 & 7) + 0x30;
    pcVar4 = &DAT_0023cca8;
    stack0xffdc3238_ptr = stack0xffdc3238_buf;
    do {
      cVar2 = *pcVar4;
      *stack0xffdc3238_ptr = cVar2; stack0xffdc3238_ptr = stack0xffdc3238_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar2 != '\0');
    Ordinal_1063(stack0xffdc3238_buf, &DAT_00085920);
    iVar5 = open_file_for_read(stack0xffdc3238_buf);
    if (getenv("UW_DEBUG_CRITTER"))
      fprintf(stderr, "[critter] load_critter_page_cached: cache-miss page[%d] type=%d tier=%d file=\"%s\" open=%s\n",
              iVar1, param_1, param_2, stack0xffdc3238_buf, iVar5 == -1 ? "FAIL" : "ok");
    if (iVar5 == -1) {
      DEBUG(ERR, "[glyphpage] open FAILED, skipping: %s (param_1=%d param_2=%d)\n",
            stack0xffdc3238_buf, param_1, param_2);
      if ((unsigned)iVar1 < sizeof(known_missing)) known_missing[iVar1] = 1;
      return (byte *)0;
    }
    pbVar11 = (byte *)Ordinal_1041(0x7fff);
    (&DAT_00202308)[iVar1] = pbVar11;
    read_file_handle(iVar5,pbVar11,0x7fff);
    Ordinal_553(iVar5);
  }
  if (getenv("UW_DEBUG_CRITTER_TABLESPAN")) {
    static int seen[256 * 4];
    static int seen_n = 0;
    int key = param_1 * 4 + param_2;
    int already = 0;
    for (int _i = 0; _i < seen_n; _i++) if (seen[_i] == key) { already = 1; break; }
    if (!already && seen_n < (int)(sizeof(seen)/sizeof(seen[0]))) {
      seen[seen_n++] = key;
      fprintf(stderr, "[critter-tablespan] page=%d tier=%d base=%d span=%d valid_dir=[%d,%d]\n",
              param_1, param_2, (int)*pbVar11, (int)pbVar11[1],
              (int)*pbVar11, (int)*pbVar11 + (int)pbVar11[1] - 1);
    }
  }
  return pbVar11;
}






// was FUN_00040aa8 -- the central symbolic-id -> absolute-frame
// resolver used throughout the HUD/object draw paths: id<0x1000 is
// already an absolute OBJECTS.GR frame, 0x1000<=id<0x2000 resolves
// via DAT_00202730 (BUTTONS.GR's base), id>=0x2000 resolves via
// DAT_00202738 (LFTI's base, i.e. "whatever preloaded resource comes
// right after TMOBJ.GR" -- see that global's own comment). Same
// formula this whole session's HUD work reconstructed independently
// as "resolved = base + (id - range_start)".
uint resolve_sprite_id_to_frame(param_1)
int param_1;

{
  int iVar1;
  uint uVar2;
  
  iVar1 = (int)(short)param_1;
  if (iVar1 < 0x2000) {
    if (iVar1 < 0x1000) {
      /* DAT_0024d090 (an object-type -> OBJECTS.GR frame remap) is never
         populated in this decompile. OBJECTS.GR is now registered at
         absolute frame indices (LAB_00041610), so the id IS the frame. */
      uVar2 = (uint)(ushort)param_1;
    }
    else {
      uVar2 = ((uint)DAT_00202730 + param_1) - 0x1000;
    }
  }
  else {
    uVar2 = ((uint)DAT_00202738 + param_1) - 0x2000;
  }
  return uVar2;
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






void thunk_FUN_00057118()

{
  int iVar1;
  
  iVar1 = (int)DAT_00204840;
  DAT_00204840 = (short)(iVar1 + -1);
  if ((((iVar1 + -1) * 0x10000 >> 0x10 == 0) || (DAT_000bbef4 != 0)) &&
     (iVar1 = FUN_00056fe8(), iVar1 != 0)) {
    DAT_00204844 = 0;
    set_draw_color(1);
  }
  if (DAT_00204840 < 0) {
    DAT_00204840 = DAT_00204840 + 1;
  }
  return;
}






// was load_pals_bank -- read PALS.DAT bank param_1 (768 raw bytes) into param_2 and
// install it via build_rgb565_palette
bool load_pals_bank(param_1,param_2)
undefined4 param_1;
void *param_2;

{
  char stack0xffdc2f38_buf [256];
  char *stack0xffdc2f38_ptr;
  char cVar1;
  short sVar2;
  char *pcVar3;
  undefined4 uVar4;
  char acStack_420 [264];
  undefined1 auStack_318 [768];

  DEBUG(TRACE, "[palette] load_pals_bank loading pals.dat index=%u", param_1);
  pcVar3 = &DAT_0023cca8;
    stack0xffdc2f38_ptr = acStack_420;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc2f38_ptr = cVar1; stack0xffdc2f38_ptr = stack0xffdc2f38_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_420,s__DATA_pals_dat_00085978);
  uVar4 = open_file_for_read(acStack_420);
  seek_file_handle(uVar4,(short)param_1 * 0x300,0);
  sVar2 = read_file_handle(uVar4,param_2,0x300);
  Ordinal_553(uVar4);
  if (sVar2 == 0x300) {
    expand_pals_bytes(auStack_318,param_2,0);
    build_rgb565_palette(auStack_318,param_1);
  }
  return sVar2 == 0x300;
}



// was set_palette_bank -- switch active palette to PALS.DAT bank param_1 (load into
// DAT_00088d98, install, reinstall_active_palette)
bool set_palette_bank(param_1)
undefined4 param_1;

{
  int iVar1;
  
  iVar1 = load_pals_bank(param_1,&DAT_00088d98);
  if (iVar1 != 0) {
    reinstall_active_palette(0x100,0,0);
  }
  return iVar1 != 0;
}


















// was FUN_000417b4
uint load_gr_resource_entries(param_1,param_2,param_3,param_4,param_5)
char *param_1;
int param_2;
short param_3;
codeptr * param_4;
codeval * param_5;

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int extraout_r2;
  int iVar4;
  int iVar5;
  uint uVar6;
  undefined2 local_8;
  /* param_4 is an allocator callback (returns a real buffer pointer, sized
     by the byte count in iVar4) -- Ghidra's 'iVar2' held both the item
     index (int arithmetic, above) and the allocator's return value at
     different points in the loop, which silently truncated the pointer to
     32 bits on this 64-bit host. Split the pointer use into its own
     variable. */
  void *pvVar_buf;
  
  uVar6 = 1;
  if (param_1 == 0 || param_1[0] == '\0') {
    /* A handful of resource-name string constants at this call site's
       original address were never recovered by Ghidra (no content, just
       a dangling address -- see README "Unrecoverable string tables").
       Treat "nothing to load" as success rather than failing the whole
       resource-preload batch this participates in.

       BUG (found tracing the mode-icon "door sprite" report): this
       early return never touches DAT_00202728 (the just-loaded
       resource's frame count), so it's left holding whatever the
       PREVIOUS real load set it to. load_gr_resource_group/load_hud_icon_gr's
       callers unconditionally do `DAT_00202744 += DAT_00202728`
       right after calling this regardless of success/failure -- so
       every one of these "nothing to load" resources silently
       RE-ADDS the previous resource's frame count to the running
       absolute-frame counter instead of contributing zero. Confirmed
       live via UW_DEBUG_DUMP_GR: all 4 unrecovered resource names in
       the post-TMOBJ preload chain (this project's own prior
       "Unrecoverable string tables" investigation already knew these
       fail to load, but not that the failure corrupts every
       subsequent resource's frame numbering) each duplicate the
       immediately-preceding real resource's exact frame count
       (e.g. the one right after TMOBJ.GR claims TMOBJ's own 38
       frames a second time). This is why the mode-icon highlight
       (which indexes into this same running counter, expecting the
       resource that comes right after TMOBJ) actually landed on
       TMOBJ's OWN leftover frame data (a wall-mounted decorative tile
       object) instead of whatever the missing resource's real icon
       content should have been -- a door/gate-like TMOBJ decoration,
       matching the user's report exactly. Zero the count so a missing
       resource correctly contributes no frames instead of duplicating
       the previous one. */
    DAT_00202728 = 0;
    return uVar6;
  }
  iVar1 = open_gr_resource_file(param_1,1);
  if (iVar1 == 0) {
    uVar6 = 0;
  }
  else {
    iVar1 = extraout_r2;
    if (param_3 < 0) {
      iVar1 = param_2 << 0x10;
    }
    iVar5 = 0;
    if (param_3 < 0) {
      param_3 = (short)((uint)(((int)(short)(ushort)DAT_00202728 - (iVar1 >> 0x10)) * 0x10000) >>
                       0x10);
    }
    iVar1 = param_2;
    if (0 < param_3) {
      while (uVar6 != 0) {
        iVar1 = iVar1 + (short)iVar5;
        iVar2 = iVar1 * 0x10000 >> 0x10;
        if ((int)(uint)(ushort)DAT_00202728 <= iVar2) {
          uVar6 = 0;
          break;
        }
        iVar4 = *(int *)(DAT_0020274c + iVar2 * 4 + 4) - *(int *)(DAT_0020274c + iVar2 * 4);
        pvVar_buf = (*param_4)(iVar4);
        if ((pvVar_buf == 0) || (iVar1 = read_gr_resource_record(iVar1,pvVar_buf), iVar4 != iVar1)) {
          uVar6 = 0;
        }
        else {
          /* Debug-only hook, not in the original decompile: dumps this
             entry's raw bytes to a BMP under debug/gr/ when
             UW_DEBUG_DUMP_GR is set. No-op otherwise. */
          uw_debug_dump_gr_entry(param_1,iVar5,(unsigned char *)pvVar_buf,iVar4);
          if (param_5 != (code *)0x0) {
            uVar3 = (*param_5)(pvVar_buf,iVar4,iVar5);
            uVar6 = uVar6 & uVar3;
          }
        }
        iVar5 = ((short)iVar5 + 1) * 0x10000 >> 0x10;
        if (param_3 <= iVar5) break;
        local_8 = (short)param_2;
        iVar1 = (int)local_8;
      }
    }
    close_gr_resource_file();
  }
  return uVar6;
}









void load_armor_variant_tables(param_1)
undefined4 param_1;

{
  read_file_handle(param_1,&DAT_00202800,0x80);
  read_file_handle(param_1,&DAT_002027d0,0x30);
  read_file_handle(param_1,&DAT_00202750,0x80);
  if (getenv("UW_DEBUG_ARMOR_TABLES")) {
    int _i;
    for (_i = 0; _i < 32; _i++)
      fprintf(stderr, "[armor] DAT_00202750[%d] (family%d nibble%d): %02x %02x %02x %02x\n",
              _i, _i < 16 ? 2 : 3, _i < 16 ? _i : _i - 16,
              (unsigned char)(&DAT_00202750)[_i*4], (unsigned char)(&DAT_00202750)[_i*4+1],
              (unsigned char)(&DAT_00202750)[_i*4+2], (unsigned char)(&DAT_00202750)[_i*4+3]);
  }
  return;
}



// was FUN_00041f34 -- allocate/reset the keybinding + click-region tables.
void input_bindings_init()

{
  DAT_00202890 = Ordinal_1041(0x12);
  DAT_0020289c = Ordinal_1041(0xc);
  if ((DAT_00202890 == 0) || (DAT_0020289c == 0)) {
    report_categorized_fatal_error(0x1003);
  }
  DAT_00202898 = 0;
  DAT_0020288c = 0;
  g_keybind_handler_n = 0;       /* keybind table reset -- drop the real-handler side table too */
  g_click_region_handler_n = 0;  /* likewise the click-region handler side table */
  DAT_00202894 = 1;
  DAT_00085a70 = 0xffff;
  *(undefined1 *)(DAT_00085a6c + 6) = 0;
  *(undefined1 *)(DAT_00085a6c + 7) = 0;
  return;
}



// was FUN_00041fe4 -- free the keybinding + click-region tables.
void input_bindings_free()

{
  if (DAT_00085a70 != -0x29a) {
    Ordinal_1018(DAT_00202890);
    Ordinal_1018(DAT_0020289c);
    DAT_00085a70 = -0x29a;
  }
  return;
}



// was FUN_0004202c -- append a mouse click-region record to DAT_00202890.
int register_click_region(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;
undefined2 param_5;
undefined2 param_6;
void *param_7;   /* was undefined4 -- handler fn pointer; see g_click_region_handler */

{
  short sVar1;
  int iVar2;
  char *iVar3;
  void *pvVar4;

  iVar2 = (int)DAT_00202898;
  DAT_00202898 = (short)(iVar2 + 1);
  /* real 64-bit handler, indexed by record position (iVar2 == old count) */
  if ((uint)iVar2 < 128) {
    g_click_region_handler[iVar2] = (void (*)(int))param_7;
    if (iVar2 + 1 > g_click_region_handler_n) g_click_region_handler_n = iVar2 + 1;
  }
  /* Ordinal_1054 is realloc-shaped and now returns a real pointer;
     iVar2 was reused here for that result even though it's declared
     int, truncating it (and iVar3, derived from it, and DAT_00202890,
     assigned from it) on this 64-bit host. Split into a dedicated
     pointer variable rather than retyping iVar2 (used as a plain int
     counter just above). */
  pvVar4 = Ordinal_1054(DAT_00202890,((iVar2 + 1) * 0x10000 >> 0x10) * 0x12);
  if (pvVar4 == 0) {
    report_fatal_error_and_exit(0x1005);
  }
  sVar1 = DAT_00202894;
  iVar3 = (char *)((char *)pvVar4 + DAT_00202898 * 0x12);
  DAT_00202890 = pvVar4;
  *(undefined1 *)(iVar3 + -0x12) = (char)DAT_00202894;
  *(char *)(iVar3 + -0x11) = (char)((ushort)sVar1 >> 8);
  DAT_00202894 = DAT_00202894 + 1;
  *(char *)(iVar3 + -8) = (char)param_5;
  *(char *)(iVar3 + -0xc) = (char)param_1;
  *(char *)(iVar3 + -7) = (char)((ushort)param_5 >> 8);
  *(char *)(iVar3 + -10) = (char)param_2;
  *(char *)(iVar3 + -0x10) = (char)param_3;
  *(char *)(iVar3 + -6) = (char)param_6;
  *(char *)(iVar3 + -0xe) = (char)param_4;
  *(char *)(iVar3 + -5) = (char)((ushort)param_6 >> 8);
  /* low 32 bits only (0x12-byte record has no room for a 64-bit pointer);
     kept solely so poll_input_bindings' non-null gate passes -- the real
     call goes through g_click_region_handler. */
  *(char *)(iVar3 + -4) = (char)(uintptr_t)param_7;
  *(char *)(iVar3 + -3) = (char)((uintptr_t)param_7 >> 8);
  *(char *)(iVar3 + -2) = (char)((uintptr_t)param_7 >> 0x10);
  *(char *)(iVar3 + -1) = (char)((uintptr_t)param_7 >> 0x18);
  *(char *)(iVar3 + -0xb) = (char)((uint)param_1 >> 8);
  *(char *)(iVar3 + -9) = (char)((uint)param_2 >> 8);
  *(char *)(iVar3 + -0xf) = (char)((uint)param_3 >> 8);
  *(char *)(iVar3 + -0xd) = (char)((uint)param_4 >> 8);
  return (int)CONCAT11(*(undefined1 *)(iVar3 + -0x11),*(undefined1 *)(iVar3 + -0x12));
}



// was FUN_00042758 -- look up a pressed key in the DAT_0020289c table
// (keycode + mode-mask match) and invoke its handler.
void dispatch_key_binding(param_1,param_2)
/* Was `int`, truncating the real pointer poll_input_bindings passes through
   (its own param_1, e.g. DAT_00085a6c). */
char *param_1;
short param_2;

{
  /* Was `int`; both double as a plain loop index (iVar2 only) and a real
     pointer into the DAT_0020289c keybinding table (iVar1 always, iVar2
     once more on the match path just before it returns) -- truncating
     that pointer since DAT_0020289c is a genuine malloc'd 64-bit pointer.
     Dedicated pointer variable for the record-address role. */
  char *pcVar1;
  int iVar2;

  iVar2 = 0;
  if (0 < DAT_0020288c) {
    do {
      pcVar1 = iVar2 * 0xc + DAT_0020289c;
      if (((*(short *)(pcVar1 + 2) == param_2) &&
          ((*(ushort *)(pcVar1 + 6) & *(ushort *)(param_1 + 8)) != 0)) &&
          (((uint)iVar2 < 512 && g_keybind_handler[iVar2] != 0)))
      {
        g_keybind_handler[iVar2]((int)*(short *)(pcVar1 + 4));
        return;
      }
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < DAT_0020288c);
  }
  return;
}



/* Forward declarations: both are defined later in this file (after
   this function's own call sites), and their old K&R-style bare
   `void foo()` definitions don't match the implicit `int foo()` a
   pre-definition call would otherwise get -- real prototypes here
   avoid that "conflicting types" mismatch. */
void scroll_container_grid_up(void);
void scroll_container_grid_down(void);

void handle_object_drop_target(param_1)
short param_1;

{
  ushort *puVar1;
  int iVar2;
  ushort *puVar2;
  ushort uVar3;
  bool bVar4;

  bVar4 = g_selected_object != 0;
  iVar2 = (int)param_1;
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] handle_object_drop_target entry: param_1=%d g_selected_object=%p\n", (int)param_1, (void *)g_selected_object);
  if (7 < iVar2) {
    if (iVar2 < 10) {
      if (iVar2 == 9 - (*(byte *)(DAT_00086df8 + 100) & 1)) {
        puVar1 = (ushort *)resolve_object_link(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar2] * 2);
        /* Was missing a NULL check -- resolve_object_link legitimately
           returns 0 for an empty slot (its own link word has no
           object-table bits set, see its own comment), and every fresh
           character's weapon-hand slot IS empty by default (confirmed
           live). Widgets 8/9 had no click rect at all before this round
           (see g_inventory_hotspot_table's comment), so this branch was
           never reachable, and the bug went unnoticed. Now that the
           click rect exists, clicking an empty weapon hand would
           otherwise crash here on the very first try. */
        if ((puVar1 != 0) && (uVar3 = *puVar1 & 0x1ff,
           ((((*puVar1 & 0x1f0) == 0) || (uVar3 == 0x18)) || (uVar3 == 0x19)) ||
           ((uVar3 == 0x1a || (uVar3 == 0x1f))))) {
          toggle_weapon_ready();
          goto LAB_00042a10;
        }
      }
    }
    else {
      if (iVar2 == 0x14) {
        /* Widget 20, the real "leave container" indicator -- see
           DAT_00085c4c's own comment for the display side. This used
           to be a synthetic CONTAINER_ICON_WIDGET_ID special-cased
           directly in hit_test_inventory_widget plus 3 separate
           near-identical copies of the logic below scattered across
           handle_inventory_panel_click (x2) and
           attach_picked_up_object_to_cursor -- now that widget 20 is a
           real, correctly-positioned table entry, all 3 of those
           dispatch here naturally instead, so this is the one place
           that needs it.

           Was unconditional (just leave_nested_container_level()):
           dropping a held item onto this icon (drag it out of the open
           container back to the parent) closed the container without
           ever placing the item anywhere, leaving it stuck on the
           cursor -- the user then had to click again, now on the
           parent's own backpack grid, to actually place it. This
           specific "drop here auto-places into the parent" behavior is
           this project's own addition (not constrained by the original
           binary), using the same auto_place_in_container(...,0x13)
           "find an empty slot" sentinel its other callers (and
           check_object_fits_in_slot's matching special-case) already
           establish. Matches a user report: "dragging from a container
           to the parent requires an extra click".

           Whether to ALSO auto-close the container after that drop
           (the original behavior, matching a plain click on this same
           icon with nothing held) is a deliberate opt-in via
           UW_CONTAINER_AUTOCLOSE_ON_DRAG_OUT, default OFF, per user
           request -- placing the item and leaving the container open
           lets the user drag several items out in a row without it
           snapping shut after the first one. A plain click here
           (nothing held) always closes/pops one level as before,
           unaffected by this toggle. */
        if (g_selected_object != (ushort *)0x0) {
          if (auto_place_in_container(g_selected_object, 0x13) != 0) {
            g_selected_object = (ushort *)0x0;
            g_cursor_holding_state = 0;
            FUN_00057cac(3);
          }
          refresh_player_equipment_effects();
          if (getenv("UW_CONTAINER_AUTOCLOSE_ON_DRAG_OUT")) {
            leave_nested_container_level();
          }
          else {
            redraw_inventory_widget_range(0xc,0x13);
          }
        }
        else {
          leave_nested_container_level();
        }
        /* Same "drain the still-pending click" protection the original
           3 copies of this logic each had -- see their own history:
           without it, leave_nested_container_level could fire 2-3
           times per real single click and pop more than one level. */
        wait_for_click_release(1);
        goto LAB_00042a10;
      }
      if (iVar2 == 0x15) {
        scroll_container_grid_up();
        goto LAB_00042a10;
      }
      if (iVar2 == 0x16) {
        scroll_container_grid_down();
        goto LAB_00042a10;
      }
      if (iVar2 == 0x17) {
        if ((g_selected_object != 0) && (iVar2 = drop_held_object_near_player(g_selected_object,1), iVar2 != 0)) {
          iVar2 = FUN_00053920(g_selected_object,0x126);
          if (iVar2 != 0) {
            *(byte *)(DAT_00086df8 + 0x5e) =
                 ((byte)DAT_00201b68 ^ *(byte *)(DAT_00086df8 + 0x5e)) & 0xf ^
                 *(byte *)(DAT_00086df8 + 0x5e);
          }
          g_selected_object = 0;
          refresh_player_equipment_effects();
        }
        goto LAB_00042a10;
      }
      if (iVar2 == 0x18) {
        handle_barter_player_slot_drop();
        goto LAB_00042a10;
      }
    }
  }
  /* Was reusing `iVar2` (an `int`) for resolve_object_link's real
     pointer return, truncating it to 32 bits on this 64-bit host --
     same "narrow local for a pointer" idiom already fixed at several
     call sites this session. Only reached once a click actually landed
     on an occupied backpack slot for the first time (see the arena
     storage fix a few functions up), immediately segfaulting one frame
     further in on use_object_on_target's own dereference of the same
     truncated value. */
  puVar2 = (ushort *)resolve_object_link(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar2] * 2);
  if (puVar2 != 0) {
    /* Page 4 of comobj's string data is the base object-name table,
       indexed directly by id (0x800 | id) -- same lookup the
       UW_DUMP_OBJECTS_FILE census tool already uses. */
    char *_useName = (char *)get_message_string(0x800 | (*puVar2 & 0x1ff));
    DEBUG(INFO, "[inv] use item: id=0x%03x type=0x%03x name=\"%s\"\n",
          (unsigned)(*puVar2 & 0x1ff), (unsigned)(*puVar2 & 0x1f0),
          (_useName && _useName[0]) ? _useName : "(unnamed)");
    use_object_on_target(g_player_object,puVar2,1);
  }
LAB_00042a10:
  if ((bVar4) && (g_selected_object == 0)) {
    FUN_00057cac(3);
    g_cursor_holding_state = 0;
  }
  return;
}






/* Was `int` -- g_save_record_base_ptr is a real `undefined1 *` heap pointer (the
   inventory-serialization scratch buffer allocated in write_player_save_record/
   build_player_save_record), so `g_save_record_base_ptr + g_save_record_count * 8` is real pointer
   arithmetic, but returning it as a 32-bit `int` truncated the pointer
   before the caller's `(undefined1 *)` cast sign-extended the truncated
   low 32 bits back out to 64 -- producing a wild address. Confirmed via
   lldb disassembly of this port's own compiled binary (not the original
   ARM code): serialize_inventory_link_chain's call site does exactly `mov x8, x0; sxtw
   x8, w8` on this function's return value, then dereferences it a few
   instructions later -- the crash a QA report reproduced by saving with
   an item in inventory (any inventory contents send serialize_inventory_link_chain
   through the resolve_object_link/alloc_save_record_slot loop that hits this).
   Same pointer-truncation bug class fixed many times elsewhere this
   session, just via a return type this time instead of a parameter or
   local. */
// was FUN_00044294
void *alloc_save_record_slot()

{
  g_save_record_count = g_save_record_count + 1;
  return g_save_record_base_ptr + g_save_record_count * 8;
}



/* Same truncated-pointer-return bug as alloc_save_record_slot just above, same
   fix. */
// was FUN_000442bc
void *save_record_slot_from_index(param_1)
short param_1;

{
  void *iVar1;

  if (param_1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = g_save_record_base_ptr + param_1 * 8;
  }
  return iVar1;
}
























undefined4 place_object_in_backpack_slot(param_1,param_2)
/* Was `undefined4 param_1` -- same 64-bit-pointer-truncated-through-a-
   32-bit-typedef-parameter bug as place_held_item_in_empty_slot's identical fix just
   above (and sum_container_weight's, elsewhere in this file): param_1 is
   dereferenced further down (calculate_object_weight(param_1), etc.) as a real
   object pointer. */
ushort *param_1;
short param_2;

{
  int iVar1;
  short sVar2;
  int iVar3;
  char *iVar4;
  /* Was `int iVar5;` -- truncated g_current_container_record's real
     64-bit pointer on assignment (`iVar5 = g_current_container_record;`
     just below), then dereferenced the truncated wild value at
     `*(short *)(iVar5 + 10)`. Same class as this whole session's other
     narrow-local-for-a-pointer fixes. Confirmed live: crashed
     immediately on the loop's first iteration, right after fixing this
     same function's sibling resolve_object_link(record+8) bug just
     above (both reached by the same "drag an item to a different slot
     inside an open container" user repro). The CONCAT13-based "next"
     pointer reconstruction two lines below has its own separate,
     not-fixed-here 64-bit truncation (same as free_open_container_chain's
     identical idiom) -- harmless for a single, non-nested open
     container (next is always a real zero there), still broken for
     genuine container nesting. */
  char *iVar5;
  uint uVar6;
  int iVar7;
  undefined4 uVar8;

  iVar4 = g_player_object;
  iVar1 = (int)param_2;
  uVar8 = param_1;
  if (iVar1 == -1) {
    uVar8 = 1;
  }
  sVar2 = (short)uVar8;
  uVar8 = 0;
  if (iVar1 != -1) {
    /* Dropped arguments: check_object_fits_in_slot's declared signature is
       (object, slot_index) and dereferences its first argument
       immediately -- called bare here (same idiom as the
       handle_backpack_slot_click/place_held_item_in_empty_slot chain just above it), so with a real
       slot index now actually reaching this far (see handle_backpack_slot_click's own
       fix), the leftover-register param_1 it got instead was frequently
       NULL/garbage, segfaulting on first dereference the moment a real
       backpack-slot placement was attempted. */
    sVar2 = check_object_fits_in_slot(param_1, param_2);
  }
  if (sVar2 < 1) {
    if (sVar2 == -1) {
      uVar8 = 0;
    }
  }
  else {
    iVar3 = calculate_object_weight(param_1);
    if (-1 < iVar1) {
      if (0x12 < iVar1) {
        /* Was `resolve_object_link(g_current_container_record + 8)` --
           same bug, same fix, as extract_matching_object_from_slot's
           and check_object_fits_in_slot's own identical calls (see
           their comments): g_current_container_record is a small heap
           allocation outside the object arena resolve_object_link
           bounds-checks against, so this was always NULL on this
           64-bit host. iVar4 (initialized to g_player_object at this
           function's top) is used below unconditionally
           (`object_list_append_tail(iVar4 + 6, param_1)`), so the NULL
           result crashed immediately. g_current_container_link holds
           the same identity and is normal-global arena-resolvable.
           Confirmed live: this was the very next crash after fixing
           check_object_fits_in_slot's own copy of the same bug,
           reached by the identical "drag an item to a different slot
           inside an open container" user repro. */
        iVar4 = resolve_object_link(&g_current_container_link);
        /* Was walking the ancestor chain via the legacy 4-byte "prev"
           field (CONCAT13/12/11 of bytes 4-7) -- only ever a truncated
           half of a real 64-bit pointer (see open_backpack_container's
           record-widening comment); this exact spot was already flagged
           as a known, deliberately-deferred gap by an earlier session
           ("harmless for a single, non-nested open container... still
           broken for genuine container nesting" -- see this function's
           own comment a few lines up). Real nesting exists now,
           courtesy of this session's container fixes -- walk the real,
           untruncated prev pointer at +0x14 instead. */
        for (iVar5 = g_current_container_record; iVar5 != 0;
            iVar5 = *(char **)(iVar5 + 0x14)) {
          iVar7 = *(short *)(iVar5 + 10) + iVar3;
          *(char *)(iVar5 + 10) = (char)iVar7;
          *(char *)(iVar5 + 0xb) = (char)((uint)iVar7 >> 8);
        }
      }
      uVar6 = encode_object_slot_index(param_1);
      (&g_equipped_items)[iVar1 * 2] = (&g_equipped_items)[iVar1 * 2] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
      (&DAT_00202951)[iVar1 * 2] = (char)((uVar6 << 0x16) >> 0x18);
    }
    object_list_append_tail(iVar4 + 6,param_1);
    g_player_carry_weight = g_player_carry_weight + (short)iVar3;
    uVar8 = 1;
  }
  refresh_player_equipment_effects();
  return uVar8;
}



// was FUN_000451b0 -- given an object, find which currently-displayed
// backpack-grid widget shows it (or allocate it one if it isn't shown
// yet).
/* Was declared with no parameters at all, and its body called
   encode_object_slot_index() bare -- but every one of its 4 real call
   sites passes a real object pointer, so this silently relied on ARM
   register leftover (the caller's arg still sitting in r0, unclobbered)
   to accidentally forward the right value. That's the same
   dropped-argument idiom already fixed dozens of times in this file,
   except here BOTH this function's own argument and its inner
   encode_object_slot_index() call were dropped in tandem -- confirmed
   to crash for real: try_combine_or_stow_object's "open a nested
   container" branch calls find_or_assign_object_widget(container) then
   open_backpack_container() (also bare -- see that call site's own fix),
   and whatever register leftover reached open_backpack_container's
   param_1 there was garbage in a fresh call context, producing a wild
   resolve_object_link() dereference the instant a SECOND level of
   container nesting was opened (a top-level open happened to work by
   the same lucky-leftover coincidence one level up). */
int find_or_assign_object_widget(param_1)
ushort *param_1;

{
  char cVar1;
  undefined4 uVar2;
  ushort *puVar3;
  int iVar4;
  ushort *puVar5;
  int iVar6;

  uVar2 = encode_object_slot_index((char *)param_1);
  iVar6 = 0;
  do {
    cVar1 = (&g_backpack_widget_to_slot)[iVar6];
    puVar5 = (ushort *)(&g_equipped_items + (short)cVar1 * 2);
    if ((*puVar5 & 0xffc0) != 0) {
      if ((uint)(*puVar5 >> 6) == (int)(short)uVar2) {
        return (int)cVar1;
      }
      puVar3 = (ushort *)resolve_object_link(puVar5);
      if (((((*puVar3 & 0x8000) == 0) && (g_current_container_record == 0)) ||
          (((*puVar3 & 0x8000) == 0 && (((*(ushort *)(g_current_container_record + 8) ^ *puVar5) & 0xffc0) != 0)))
          ) && (iVar4 = FUN_00053644(puVar3 + 3,1,uVar2), iVar4 != 0)) {
        return (short)cVar1 * -0x10000 >> 0x10;
      }
    }
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    if (0x13 < iVar6) {
      return -1;
    }
  } while( true );
}



ushort *FUN_000452dc(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
short param_4;
undefined2 * param_5;

{
  short sVar1;
  ushort *puVar4;
  int iVar5;
  undefined2 uVar6;
  int iVar7;
  /* Was `undefined4 local_74 [2];` -- element [0] holds a real 64-bit
     object pointer passed by address into find_object_in_link_chain (see that
     function's own fix comment); [1] is unused padding from the
     original 32-bit stack layout. */
  char *local_74 [2];
  int local_6c [19];
  ushort uVar2;
  ushort uVar3;
  
  iVar7 = 0;
  do {
    uVar6 = (undefined2)iVar7;
    puVar4 = (ushort *)resolve_object_link(&g_equipped_items + iVar7 * 2);
    local_6c[iVar7] = (int)puVar4;
    sVar1 = (short)param_1;
    uVar2 = (ushort)param_2;
    uVar3 = (ushort)param_3;
    if ((((puVar4 != (ushort *)0x0) && ((sVar1 < 0 || ((*puVar4 >> 6 & 7) == (int)sVar1)))) &&
        (((short)uVar2 < 0 || (((byte)((byte)*puVar4 >> 4) & 3) == uVar2)))) &&
       (((short)uVar3 < 0 || (((byte)*puVar4 & 0xf) == uVar3)))) goto LAB_0004552c;
    iVar5 = (iVar7 + 1) * 0x10000;
    iVar7 = iVar5 >> 0x10;
  } while (iVar7 < 0xb);
  if (param_4 != 1) {
    iVar5 = (int)(short)((uint)iVar5 >> 0x10);
    while (uVar6 = (undefined2)iVar7, iVar5 < 0x13) {
      puVar4 = (ushort *)resolve_object_link(&g_equipped_items + iVar5 * 2);
      local_6c[iVar5] = (int)puVar4;
      if (((puVar4 != (ushort *)0x0) && ((sVar1 < 0 || ((*puVar4 >> 6 & 7) == (int)sVar1)))) &&
         ((((short)uVar2 < 0 || (((byte)((byte)*puVar4 >> 4) & 3) == uVar2)) &&
          (((short)uVar3 < 0 || (((byte)*puVar4 & 0xf) == uVar3)))))) goto LAB_0004552c;
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
      iVar7 = iVar5;
    }
    if ((param_4 != 2) && (param_4 != 3)) {
      iVar7 = 0;
      do {
        uVar6 = (undefined2)iVar7;
        iVar5 = local_6c[iVar7];
        if ((iVar5 != 0) && ((*(byte *)(iVar5 + 1) & 0x80) == 0)) {
          local_74[0] = resolve_object_link(iVar5 + 6);
          puVar4 = (ushort *)find_object_in_link_chain(param_1,param_2,param_3,local_74);
          local_6c[iVar7] = (int)puVar4;
          if (puVar4 != (ushort *)0x0) {
LAB_0004552c:
            *param_5 = uVar6;
            return puVar4;
          }
        }
        iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
      } while (iVar7 < 0x13);
    }
  }
  return (ushort *)0x0;
}



// was FUN_00045538 -- recursively walks an object's contents link chain
// (descending into nested containers) looking for the first object
// matching the category/subcategory/quality filters in param_1/param_2/
// param_3 (each <0 means "any"); param_4 is an in/out cursor: on entry
// it points at the current link to examine, on a match it's zeroed (or
// updated to the next link) and the matched object pointer is returned.
char *find_object_in_link_chain(param_1,param_2,param_3,param_4)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
/* Was `int * param_4;` -- the caller-supplied slot always holds a real
   64-bit object-record pointer (see FUN_000452dc's own local_74 and
   extract_matching_object_from_slot's own local_28, both fixed alongside this one), but this
   function only ever read/wrote its low 4 bytes through an `int *` view,
   truncating the pointer on every pass. Confirmed live (regression suite,
   demo_inventory_container_torch_use_test.txt): using a torch crashed
   dereferencing a truncated object pointer at `uVar3 = (uint)*puVar1;`
   (this function's own line, EXC_BAD_ACCESS at the low 32 bits of a real
   object address). */
char **param_4;

{
  ushort *puVar1;
  char *iVar2;
  uint uVar3;
  char *local_1c;

  if (*param_4 != 0) {
    do {
      if ((short)param_1 < 0) {
LAB_00045594:
        if (-1 < (short)param_2) {
          puVar1 = (ushort *)*param_4;
          uVar3 = (uint)*puVar1;
          if ((*puVar1 >> 4 & 3) != (int)(short)param_2) goto LAB_000455f8;
        }
        if ((short)param_3 < 0) {
LAB_00045668:
          iVar2 = *param_4;
          *param_4 = 0;
          return iVar2;
        }
        puVar1 = (ushort *)*param_4;
        uVar3 = (uint)*puVar1;
        if ((uVar3 & 0xf) == (int)(short)param_3) goto LAB_00045668;
      }
      else {
        puVar1 = (ushort *)*param_4;
        uVar3 = (uint)*puVar1;
        if ((*puVar1 >> 6 & 7) == (int)(short)param_1) goto LAB_00045594;
      }
LAB_000455f8:
      if ((((uVar3 & 0x8000) == 0) && (local_1c = resolve_object_link(puVar1 + 3), local_1c != 0)) &&
         (iVar2 = find_object_in_link_chain(param_1,param_2,param_3,&local_1c), iVar2 != 0)) {
        if (local_1c == 0) {
          return iVar2;
        }
        *param_4 = local_1c;
        return iVar2;
      }
      iVar2 = resolve_object_link(*param_4 + 4);
      *param_4 = iVar2;
    } while (iVar2 != 0);
  }
  return 0;
}



ushort *FUN_00045678(param_1)
short param_1;

{
  int iVar1;
  short sVar2;
  /* Was `undefined4 uVar3;` -- truncated find_object_in_link_chain's/
     FUN_00045708's real 64-bit object pointer to 32 bits. The
     param_1!=2 branch (FUN_000459d8) still returns a narrower
     `undefined4` itself (a separate, not-yet-fixed truncation one level
     further down its own call chain via FUN_00045b20) -- cast here just
     carries that existing truncation forward unchanged rather than
     introducing a new one. */
  ushort *uVar3;

  sVar2 = hit_test_inventory_widget(*DAT_00085a6c + 0xf0,0x76 - DAT_00085a6c[1]);
  iVar1 = (int)sVar2;
  if ((iVar1 < 0) || (0x13 < iVar1)) {
    uVar3 = 0;
  }
  else if (param_1 == 2) {
    uVar3 = FUN_00045708((int)(char)(&g_backpack_widget_to_slot)[iVar1]);
  }
  else {
    uVar3 = (ushort *)FUN_000459d8(0xffffffff,0xffffffff,0xffffffff,(int)(char)(&g_backpack_widget_to_slot)[iVar1]);
  }
  return uVar3;
}



ushort *FUN_00045708(param_1)
short param_1;

{
  /* Was `resolve_object_link(&g_equipped_items + param_1 * 2); return 0;` --
     confirmed via real ARM disassembly (0x45708-0x45718: `mov r3,r0,lsl
     #0x10; ldr r0,[...]; mov r3,r3,asr #0x10; add r0,r0,r3,lsl #0x1; b
     0x53514` -- a genuine TAIL CALL straight into resolve_object_link,
     0x53514) that this always returned resolve_object_link's own result,
     not a hardcoded 0. Ghidra didn't model the tail call and decompiled
     it as "call for side effect, then return 0" instead -- the caller
     (FUN_00045678, in turn feeding g_interact_target in perform_object_search_check's
     own right-click-in-inventory "ready item" handler) always saw a
     NULL target as a result, silently no-op'ing every right-click. */
  return (ushort *)resolve_object_link(&g_equipped_items + param_1 * 2);
}



// was FUN_00045720
void deplete_object_count(param_1)
undefined4 param_1;

{
  reduce_object_count(param_1,0xffffffff);
  return;
}



// was FUN_00045728
void decrement_object_count(param_1)
/* Was `undefined4 param_1` -- a real object-record pointer (forwarded
   straight to reduce_object_count, which dereferences it via
   encode_object_slot_index/calculate_object_weight), truncated to 32 bits on this
   host -- same class as many other fixes this session. */
ushort *param_1;

{
  reduce_object_count(param_1,1);
  return;
}



// was FUN_00045730
undefined4 reduce_object_count(param_1,param_2)
/* Was `undefined4 param_1` -- same truncated-object-pointer bug as
   decrement_object_count's own fix just above it (its only caller here). */
ushort *param_1;
uint param_2;

{
  short sVar1;
  ushort uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  char *pObj;

  /* Dropped argument: calculate_object_weight dereferences its own declared
     param_1 immediately -- called bare here, same idiom as this whole
     session's other fixes. Confirmed live (UW_DEBUG_INV +
     demo_container_click_test.txt): clicking a food item (bread)
     inside an open backpack container crashed here on first use of
     this never-before-exercised "use item" dispatch path. */
  iVar3 = calculate_object_weight(param_1);
  uVar4 = encode_object_slot_index(param_1);
  iVar7 = 0;
  do {
    if ((uint)(*(ushort *)(&g_equipped_items + iVar7 * 2) >> 6) == (int)(short)uVar4) break;
    iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
  } while (iVar7 < 0x1c);
  iVar8 = (int)(short)iVar7;
  sVar1 = (short)param_2;
  if (iVar8 < 0x1c) {
    extract_and_refresh_slot_item(0xffffffff,0xffffffff,0xffffffff,iVar7,sVar1);
    if (iVar8 < 0x13) {
      redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar8]);
    }
    else {
      repopulate_container_grid_slots();
      refresh_container_view();
      /* Was `for (iVar7 = g_current_container_record; ...)` -- truncated
         g_current_container_record (a real char* global) into a 32-bit
         int, then rebuilt a bogus "next" address out of raw bytes at
         iVar7+4..+7 instead of resolving the object's real next-link via
         resolve_object_link, same idiom as FUN_00052af4's chain walk.
         Confirmed live (UW_DEBUG_INV + demo_container_click_test.txt):
         this crashed on the first-ever exercise of the food-item "use"
         path (clicking Bread inside an open container). */
      for (pObj = g_current_container_record; pObj != NULL;
          pObj = (*(ushort *)(pObj + 4) & 0xffc0) == 0 ? NULL :
                 (char *)resolve_object_link((ushort *)(pObj + 4))) {
        iVar8 = *(short *)(pObj + 10) - iVar3;
        *(char *)(pObj + 10) = (char)iVar8;
        *(char *)(pObj + 0xb) = (char)((uint)iVar8 >> 8);
      }
    }
  }
  else {
    puVar5 = (undefined1 *)FUN_00053644((char *)g_player_object + 6,1,uVar4);
    if (puVar5 == (undefined1 *)0x0) {
      return 0;
    }
    if (((0 < sVar1) && ((puVar5[1] & 0x80) != 0)) && ((*(ushort *)(puVar5 + 6) & 0x8000) == 0)) {
      uVar2 = *(ushort *)(puVar5 + 6) >> 6;
      if ((1 < uVar2) && (sVar1 < (short)uVar2)) {
        puVar6 = (undefined1 *)alloc_object_slot(0);
        *puVar6 = *puVar5;
        puVar6[1] = puVar5[1];
        puVar6[2] = puVar5[2];
        puVar6[3] = puVar5[3];
        puVar6[4] = puVar5[4];
        puVar6[5] = puVar5[5];
        puVar6[6] = puVar5[6];
        puVar6[7] = puVar5[7];
        uVar9 = (param_2 & 0xffff) * 0x3ff + (uint)uVar2;
        puVar6[6] = puVar6[6] & 0x3f ^ (char)uVar9 * '@';
        puVar6[7] = (char)((uVar9 & 0x3ffffff) >> 2);
        puVar5[6] = puVar5[6] & 0x3f | (byte)((param_2 & 0x3ff) << 6);
        puVar5[7] = (char)((param_2 << 0x16) >> 0x18);
        object_list_insert_head(puVar5 + 4,puVar6);
      }
    }
    object_list_unlink(DAT_002046b4,puVar5);
    g_player_carry_weight = g_player_carry_weight - (short)iVar3;
    /* This else-branch (reached when the object isn't found among the
       28 direct/open-container-borrowed slots at all, e.g. nested two
       containers deep) unlinked the object but, unlike this function's
       OWN sibling branch just above (the `iVar8<0x1c && iVar8>=0x13`
       case), never refreshed the open-container widget grid
       afterward. Added the same repopulate_container_grid_slots/refresh_container_view pair that
       sibling already calls (refresh_container_view's own first line is
       `redraw_inventory_widget_range(0xc,0x13)` -- exactly that grid)
       for consistency -- not independently confirmed live (this
       specific branch wasn't the one the torch-duplication repro
       exercised; see extract_and_refresh_slot_item's own comment for
       the actual confirmed root cause), but the same staleness risk
       applies on general principle. */
    repopulate_container_grid_slots();
    refresh_container_view();
    redraw_inventory_widget(0x13);
    refresh_player_equipment_effects();
  }
  return 1;
}



ushort *FUN_000459d8(param_1,param_2,param_3,param_4)
/* Was a bare K&R `()` reading an implicit `short in_r3;` for its 4th
   arg, and forwarding to FUN_00045b20 via a bare `FUN_00045b20()` call
   with no explicit arguments at all. On real ARM32 hardware, a
   register-passing K&R call like this genuinely forwards whatever's
   still sitting in r0-r3 (this function's own incoming args) straight
   through -- but a C compiler targeting this 64-bit host has no such
   guarantee for a literal `foo()` call: it passes exactly zero
   arguments, full stop. Confirmed as the actual root cause of the
   torch-duplication bug (not a mere stale-redraw issue as first
   suspected): reduce_object_count's OWN call to FUN_00045b20 passed
   real, explicit arguments correctly, but FUN_00045b20's undeclared
   body had no way to name/forward them, so its own nested
   extract_matching_object_from_slot() call ran with garbage/zeroed
   arguments and silently did nothing -- the torch was never actually
   unlinked from the sack's contents chain before use_light_source
   moved a (correctly readied) copy of it into the shoulder slot. */
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
short param_4;

{
  ushort *uVar1;
  ushort *puVar2;

  uVar1 = extract_and_refresh_slot_item(param_1,param_2,param_3,param_4,0);
  puVar2 = (ushort *)resolve_object_link(&g_equipped_items + param_4 * 2);
  if ((((puVar2 != (ushort *)0x0) && ((*puVar2 & 0x1c0) == 0x80)) && ((*puVar2 & 0x30) == 0)) &&
     (g_current_container_record != 0)) {
    repopulate_container_grid_slots();
    refresh_container_view();
    return uVar1;
  }
  redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[param_4]);
  return uVar1;
}



ushort *FUN_00045a7c(param_1,param_2,param_3,param_4)
/* Same bare-K&R-forwarding bug as FUN_000459d8 just above (identical
   body); see its own comment. */
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
short param_4;

{
  ushort *uVar1;
  ushort *puVar2;

  uVar1 = extract_and_refresh_slot_item(param_1,param_2,param_3,param_4,0);
  puVar2 = (ushort *)resolve_object_link(&g_equipped_items + param_4 * 2);
  if ((((puVar2 != (ushort *)0x0) && ((*puVar2 & 0x1c0) == 0x80)) && ((*puVar2 & 0x30) == 0)) &&
     (g_current_container_record != 0)) {
    repopulate_container_grid_slots();
    refresh_container_view();
    return uVar1;
  }
  redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[param_4]);
  return uVar1;
}



// was FUN_00045b20 -- thin wrapper: extracts the object matching
// param_1/param_2/param_3 (category/subcategory/quality, <0 = any)
// from slot param_4 via extract_matching_object_from_slot, then
// refreshes carry-weight/UI state via refresh_player_equipment_effects(). Was a bare K&R
// `()` blindly relying on ARM32 register pass-through to forward its
// own caller's args into extract_matching_object_from_slot() -- see
// FUN_000459d8's own comment on why that's unsound on this 64-bit
// host. This was THE actual root cause of the torch-duplication bug:
// reduce_object_count's real, explicit call here (with a genuine
// object-bearing slot index) silently forwarded nothing, so the torch
// was never unlinked from its container before being placed anew.
ushort *extract_and_refresh_slot_item(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
short param_4;
ushort param_5;

{
  ushort *uVar1;

  uVar1 = extract_matching_object_from_slot(param_1,param_2,param_3,param_4,param_5);
  refresh_player_equipment_effects();
  return uVar1;
}



// was FUN_00045b48 -- finds the first object matching the category/
// subcategory/quality filters (param_1/param_2/param_3, <0 = any) in
// inventory slot param_4 (searched directly, or via
// find_object_in_link_chain for nested containers); if it's a stackable
// object and param_5 asks for fewer than the full stack, splits off a
// new object for the remaining count via alloc_object_slot before
// unlinking and returning the matched (now correctly-sized) object.
ushort *extract_matching_object_from_slot(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
short param_4;
ushort param_5;

{
  ushort uVar1;
  short sVar2;
  ushort *puVar3;
  int iVar4;
  char *iVar5;
  uint uVar6;
  ushort uVar7;
  uint uVar8;
  int iVar9;
  byte *pbVar10;
  byte *pbVar11;
  char *local_28;
  
  iVar4 = (int)param_4;
  pbVar11 = &g_equipped_items + iVar4 * 2;
  pbVar10 = (byte *)0x0;
  puVar3 = (ushort *)resolve_object_link(pbVar11);
  if (puVar3 != (ushort *)0x0) {
    if (iVar4 < 0x13) {
      local_28 = g_player_object;
    }
    else {
      /* Was `resolve_object_link(g_current_container_record + 8)` --
         g_current_container_record is a small (12-byte) Ordinal_1041
         heap allocation, nowhere near the object arena buffer
         resolve_object_link's own bounds guard checks against (see its
         own comment), so this call was ALWAYS silently rejected on this
         64-bit host, returning NULL regardless of what offset+8/9 held
         (confirmed live: local_28 read back NULL even after fixing
         offset+8/9's own encoding to correctly carry the container's
         identity -- see that write's own comment a few thousand lines
         up). g_current_container_link is a normal global, already
         proven arena-resolvable throughout this whole file, and
         open_backpack_container keeps it in lockstep with the exact
         same identity value this record's own offset+8/9 encodes for
         the currently-displayed (innermost, if nested) open container
         -- which is exactly what this branch (iVar4>=0x13, a widget
         showing that container's own contents) needs. Confirmed live:
         this was the reason object_list_unlink got called with a
         bogus near-null "list" address, corrupting/dropping other
         objects still in the sack's real contents chain whenever an
         item was used out of an open container (matching a user report
         of "closing and reopening a container loses other contents
         seemingly randomly"). Other call sites of this same
         `resolve_object_link(g_current_container_record+8)` pattern
         likely share this bug too, but aren't exercised by this
         specific repro -- not fixed here. */
      local_28 = resolve_object_link(&g_current_container_link);
    }
    uVar6 = (uint)(short)param_1;
    uVar7 = (ushort)param_2;
    uVar1 = (ushort)param_3;
    if ((((((int)uVar6 < 0) && ((short)uVar7 < 0)) && ((short)uVar1 < 0)) ||
        (((((int)uVar6 < 0 || ((*puVar3 >> 6 & 7) == uVar6)) &&
          (((short)uVar7 < 0 || (((byte)((byte)*puVar3 >> 4) & 3) == uVar7)))) &&
         (((short)uVar1 < 0 || (((byte)*puVar3 & 0xf) == uVar1)))))) ||
       (puVar3 = (ushort *)find_object_in_link_chain(param_1,param_2,param_3,&local_28), puVar3 != (ushort *)0x0)
       ) {
      if (((param_5 != 0) && ((*puVar3 & 0x8000) != 0)) && ((puVar3[3] & 0x8000) == 0)) {
        uVar7 = puVar3[3] >> 6;
        if ((1 < uVar7) && ((short)param_5 < (short)uVar7)) {
          pbVar10 = (byte *)alloc_object_slot(0);
          *pbVar10 = (byte)*puVar3;
          pbVar10[1] = *(byte *)((char *)puVar3 + 1);
          pbVar10[2] = (byte)puVar3[1];
          pbVar10[3] = *(byte *)((char *)puVar3 + 3);
          pbVar10[4] = (byte)puVar3[2];
          pbVar10[5] = *(byte *)((char *)puVar3 + 5);
          pbVar10[6] = (byte)puVar3[3];
          pbVar10[7] = *(byte *)((char *)puVar3 + 7);
          uVar6 = (uint)param_5;
          uVar8 = uVar6 * 0x3ff + (uint)uVar7;
          pbVar10[6] = pbVar10[6] & 0x3f ^ (char)uVar8 * '@';
          pbVar10[7] = (byte)((uVar8 & 0x3ffffff) >> 2);
          *(byte *)(puVar3 + 3) = (byte)puVar3[3] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
          *(byte *)((char *)puVar3 + 7) = (byte)((uVar6 << 0x16) >> 0x18);
          object_list_insert_head(puVar3 + 2,pbVar10);
        }
      }
      if ((local_28 == g_player_object) || (0x13 < iVar4)) {
        if (pbVar10 == (byte *)0x0) {
          uVar7 = *pbVar11 & 0x3f;
        }
        else {
          sVar2 = encode_object_slot_index(pbVar10);
          uVar7 = *pbVar11 & 0x3f | sVar2 << 6;
        }
        *pbVar11 = (byte)uVar7;
        (&DAT_00202951)[iVar4 * 2] = (char)(uVar7 >> 8);
      }
      object_list_unlink(local_28 + 6,puVar3);
      iVar4 = calculate_object_weight(puVar3);
      g_player_carry_weight = g_player_carry_weight - (short)iVar4;
      if (g_current_container_record == 0) {
        return puVar3;
      }
      sVar2 = encode_object_slot_index(local_28);
      if ((uint)(*(ushort *)(g_current_container_record + 8) >> 6) != (int)sVar2) {
        return puVar3;
      }
      sVar2 = encode_object_slot_index(puVar3);
      iVar9 = 0x14;
      do {
        if ((uint)(*(ushort *)(&g_equipped_items + iVar9 * 2) >> 6) == (int)sVar2) {
          if (pbVar10 == (byte *)0x0) {
            uVar6 = 0;
          }
          else {
            sVar2 = encode_object_slot_index(pbVar10);
            uVar6 = (uint)sVar2;
          }
          iVar9 = (int)(short)iVar9;
          (&g_equipped_items)[iVar9 * 2] =
               (&g_equipped_items)[iVar9 * 2] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
          iVar5 = g_current_container_record;
          (&DAT_00202951)[iVar9 * 2] = (char)((uVar6 << 0x16) >> 0x18);
          /* Legacy truncated "prev" walk -- same fix as
             place_object_in_backpack_slot's sibling copy above (search
             "still broken for genuine container nesting"). */
          for (; iVar5 != 0; iVar5 = *(char **)(iVar5 + 0x14)) {
            iVar9 = *(short *)(iVar5 + 10) - iVar4;
            *(char *)(iVar5 + 10) = (char)iVar9;
            *(char *)(iVar5 + 0xb) = (char)((uint)iVar9 >> 8);
          }
          return puVar3;
        }
        iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      } while (iVar9 < 0x1c);
      return puVar3;
    }
  }
  return (ushort *)0x0;
}


















/* Was copying "armor_f" into acStack_85c88, a 547936-byte buffer
   Ghidra misattributed here (the same stack-frame-size-miscalculation
   artifact already fixed in dispatch_object_action's acStack_85978
   and check_object_fits_in_slot's acStack_84f64 -- see their own
   comments) that's never read back afterward. The REAL destination,
   acStack_28 (6 bytes) + local_22 (the dynamically-picked gender
   letter, right after it), never actually got "armor_" copied into
   it -- so reload_single_grtile_entry loaded a resource file named by 6 bytes of
   uninitialized stack instead of "armor_f"/"armor_m", explaining why
   an equipped item's paper-doll overlay renders as a solid block
   (whatever placeholder/error frame a failed .GR load falls back to)
   instead of the real worn-armor graphic. Fixed by building the real
   name into one properly-sized, NUL-terminated local instead of
   relying on two separate locals happening to land adjacently on the
   stack (true in the original 32-bit ARM build, not guaranteed by a
   modern compiler). */
undefined4 load_armor_overlay_frame(param_1,param_2)
int param_1;
undefined4 param_2;

{
  char armor_name[8];
  int i;

  for (i = 0; i < 6; i++) {
    armor_name[i] = s_armor_f_00085c60[i];
  }
  armor_name[6] = 0x6d;
  if ((*(byte *)(DAT_00086df8 + 100) & 2) == 2) {
    armor_name[6] = 0x66;
  }
  armor_name[7] = '\0';
  reload_single_grtile_entry(param_1 + 0x2091,armor_name,param_2);
  return 1;
}



void redraw_armor_overlay_widgets()

{
  byte *pbVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;

  if (g_active_hud_panel == '\0') {
    FUN_00057118();
    if (DAT_00085c54 != 0) {
      screen_backup_save();
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xf0,0xb,0x13b,0x76);
      screen_backup_restore_rect(0xf0,0xb,0x13b,0x76);
    }
    g_blit_transparent_mode = 1;
    draw_sprite_by_id(0x2091,(int)g_inv_hotspot_draw_x,(int)g_inv_hotspot_draw_y,g_inv_hotspot_dirty_h,g_inv_hotspot_dirty_w);
    iVar4 = 1;
    g_blit_transparent_mode = 1;
    do {
      if ((*(ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar4] * 2) & 0xffc0) != 0) {
        pbVar1 = (byte *)resolve_object_link((ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar4] * 2));
        uVar3 = *pbVar1 & 0x1f;
        if ((uint)(int)(short)uVar3 < 0xf) {
          uVar2 = (pbVar1[4] & 0x30) >> 4;
        }
        else {
          uVar2 = 3;
        }
        if (((int)(short)uVar3 + 1U != (int)*(char *)((char *)&DAT_00202988 + iVar4)) ||
           ((short)uVar2 + 1 != (int)*(char *)((char *)&DAT_002028e0 + iVar4))) {
          *(char *)((char *)&DAT_00202988 + iVar4) = (char)uVar3 + '\x01';
          *(char *)((char *)&DAT_002028e0 + iVar4) = (char)uVar2 + '\x01';
          load_armor_overlay_frame(iVar4,uVar2 * 0xf + uVar3);
        }
        draw_sprite_by_id(iVar4 + 0x2091,(int)(&g_inv_hotspot_draw_x)[iVar4 * 7],(int)(&g_inv_hotspot_draw_y)[iVar4 * 7],
                     (&g_inv_hotspot_dirty_h)[iVar4 * 0xe],(&g_inv_hotspot_dirty_w)[iVar4 * 0xe]);
      }
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 6);
    g_blit_transparent_mode = 0;
    capture_framebuffer_rect_to_grtile(DAT_00202914,(int)DAT_00085b72,(int)DAT_00085b74,DAT_00085b76 - 5,DAT_00085b77);
    capture_framebuffer_rect_to_grtile(DAT_00202910,DAT_00085b64 + 5,(int)DAT_00085b66,DAT_00085b68 - 5,DAT_00085b69);
    if (((DAT_00202962 & 0xffc0) != 0) || ((DAT_00202964 & 0xffc0) != 0)) {
      redraw_inventory_widget_range(10,0xb);
    }
    if (DAT_00085c54 != 0) {
      screen_backup_save();
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xf0,0xb,0x13b,0x76);
      screen_backup_restore_rect(0xf0,0xb,0x13b,0x76);
    }
    iVar4 = update_carry_weight_display(1);
    if (iVar4 != 0) {
      select_active_font(s_font5x6p_sys_0008430c);
    }
    cursor_show_idle_tick();
  }
  return;
}



void swap_cursor_and_slot_item(param_1,param_2)
undefined4 param_1;
int param_2;

{
  int iVar1;
  uint uVar2;
  bool bVar3;
  short local_20;
  
  bVar3 = g_selected_object != (ushort *)0x0;
  if (param_2 == 0) {
    uVar2 = (uint)local_20;
  }
  else {
    iVar1 = get_equipped_item_at_slot(param_1);
    resolve_object_link(iVar1 + 4);
    uVar2 = encode_object_slot_index();
  }
  g_selected_object = (ushort *)extract_matching_object_from_slot(0xffffffff,0xffffffff,0xffffffff,param_1,0);
  if (g_selected_object != (ushort *)0x0) {
    if (param_2 != 0) {
      iVar1 = (int)(short)param_1;
      if (getenv("UW_DEBUG_INV"))
        fprintf(stderr, "[inv] swap_cursor_and_slot_item writing arr_idx=%d objid=0x%03x\n", iVar1, uVar2 & 0x1ff);
      (&g_equipped_items)[iVar1 * 2] = (&g_equipped_items)[iVar1 * 2] & 0x3f | (byte)((uVar2 & 0x3ff) << 6);
      (&DAT_00202951)[iVar1 * 2] = (char)((uVar2 << 0x16) >> 0x18);
      refresh_player_equipment_effects();
    }
    FUN_00057118();
    if (bVar3) {
      FUN_00057cac(0);
    }
    /* Was `*g_selected_object & 0x1ff` -- g_selected_object is declared
       `char *` (a single signed byte, used elsewhere in this file for
       genuine byte-level access), but an object's own id is a 9-bit
       field spanning 2 bytes, needing a real `ushort` read. Reading
       just the low byte and sign-extending it (as `char` does) set bit
       8 spuriously whenever that byte's own top bit was set --
       e.g. objid 0xb6 read as signed char -74, sign-extended to
       0xffffffb6, then `&0x1ff` incorrectly produced 0x1b6 instead of
       0xb6. Confirmed live (UW_DEBUG_CURSOR): every held-item cursor
       icon with an id >= 0x80 in its low byte resolved to a
       completely different (or, for ids that pushed the corrupted
       value past this file's populated sprite range, entirely blank)
       icon -- matching a user report of several items showing the
       wrong cursor icon or none at all when picked up. Same root
       cause at every other `*g_selected_object & 0x1ff` site in this
       file (see their own copies of this comment). */
    FUN_00057c5c(*(ushort *)g_selected_object & 0x1ff);
    cursor_show_idle_tick();
    refresh_player_equipment_effects();
  }
  return;
}



undefined1 *FUN_000470fc(param_1)
undefined1 * param_1;

{
  ushort uVar1;
  short sVar2;
  int iVar3;
  undefined1 *puVar4;
  uint uVar5;
  undefined1 local_1c;
  undefined1 local_1b;
  undefined1 auStack_18 [4];
  
  puVar4 = (undefined1 *)0x0;
  uVar1 = *(ushort *)(param_1 + 6) >> 6;
  local_1c = 0x31;
  local_1b = 0;
  sVar2 = scroll_text_entry_prompt(s_Move_how_many__00085c68,&local_1c,auStack_18,0,3);
  if ((sVar2 != 0x1b) && (sVar2 != 3)) {
    if ((sVar2 == 0) || (3 < sVar2)) {
      sVar2 = Ordinal_993(auStack_18);
      uVar5 = (int)sVar2;
      if ((int)(short)uVar1 < (int)sVar2) {
        uVar5 = (uint)uVar1;
      }
    }
    else {
      uVar5 = 1;
      if ((sVar2 != 1) && (sVar2 == 2)) {
        uVar5 = (uint)uVar1;
      }
      echo_number_to_scroll(uVar5);
    }
    message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    if (((int)(short)uVar5 != 0) &&
       (puVar4 = param_1, (int)(short)uVar5 != (uint)(*(ushort *)(param_1 + 6) >> 6))) {
      puVar4 = (undefined1 *)alloc_object_slot(0);
      *puVar4 = *param_1;
      puVar4[1] = param_1[1];
      puVar4[2] = param_1[2];
      puVar4[3] = param_1[3];
      puVar4[4] = param_1[4];
      puVar4[5] = param_1[5];
      puVar4[6] = param_1[6];
      puVar4[7] = param_1[7];
      iVar3 = (*(ushort *)(puVar4 + 6) & 0xffc0) + uVar5 * -0x40;
      puVar4[6] = (byte)iVar3 ^ (byte)*(ushort *)(puVar4 + 6) & 0x3f;
      puVar4[7] = (char)((uint)iVar3 >> 8);
      param_1[6] = param_1[6] & 0x3f | (byte)((uVar5 & 0x3ff) << 6);
      param_1[7] = (char)((uVar5 << 0x16) >> 0x18);
    }
  }
  FUN_000576d0(1);
  return puVar4;
}



uint check_object_fits_in_slot(param_1,param_2)
ushort * param_1;
undefined4 param_2;

{
  char *wptr_31150;
  ushort uVar1;
  uint uVar2;
  char cVar3;
  byte bVar4;
  ushort uVar5;
  byte bVar6;
  byte bVar7;
  uint uVar8;
  short sVar9;
  undefined1 *puVar10;
  ushort *puVar11;
  char *iVar12;
  byte *pbVar13;
  char *pcVar14;
  int iVar15;
  bool bVar16;
  /* Was 544528 bytes -- same Ghidra stack-frame-size-miscalculation
     artifact already fixed in dispatch_object_action's acStack_85978
     (see its own comment): this is just a scratch copy of the short
     "UNNAMED" string (s_UNNAMED_00084f24) that's never read back
     afterward (only acStack_40 feeds the real message_scroll_print_wrapped
     calls below). Never triggered before because nothing reached this
     deep into check_object_fits_in_slot until the handle_backpack_slot_click/place_object_in_backpack_slot dropped
     arguments were forwarded correctly (see their own fixes) -- with a
     real object now reaching here, allocating the huge frame crashed on
     entry (SIGSEGV touching the stack guard page). Shrunk to a sane size. */
  char acStack_84f64 [64];
  short local_54 [2];
  int local_50;
  uint local_4c;
  undefined *local_48;
  char acStack_40 [28];
  char *_parentRec;
  undefined2 _savedLink;

  local_4c = (uint)(short)(*param_1 & 0x1ff);
  local_48 = &DAT_00202c90 + local_4c * 0xd;
  uVar1 = *param_1 >> 6 & 7;
  uVar5 = ((byte)*param_1 & 0x30) >> 4;
  bVar4 = (byte)*param_1 & 0xf;
  iVar15 = (int)(short)param_2;
  g_scratch_object_ptr = param_1;
  if (iVar15 == 0x13) {
    if (g_current_container_record == 0) {
      return 0;
    }
    /* Both `g_current_container_record + 4` reads below were the legacy
       4-byte "prev" field -- only ever a truncated half of a real
       64-bit pointer (same class as the whole Update-29 sweep --
       search "still broken for genuine container nesting"). The second
       one compounded it: it fed the truncated value + 8 straight into
       resolve_object_link as an object-pointer base, the same
       "tracking record lives outside the object arena" bug already
       fixed at several other call sites -- confirmed live: this is the
       exact crash from "dropping [a held item] in another inventory
       slot" while viewing a nested container (check_object_fits_in_slot,
       via place_object_in_backpack_slot/place_held_item_in_empty_slot/
       handle_backpack_slot_click). Walk the real +0x14 prev pointer to
       find the parent record, then resolve its own saved link through
       the established g_current_container_link global-copy workaround
       (save/restore, since this function runs while a CHILD container
       is still the "current" one). */
    _parentRec = *(char **)(g_current_container_record + 0x14);
    if (_parentRec == 0) {
      iVar15 = 0xb;
      do {
        if ((*(ushort *)(&g_equipped_items + iVar15 * 2) & 0xffc0) == 0) break;
        iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
      } while (iVar15 < 0x13);
      if ((short)iVar15 < 0x13) {
        return 1;
      }
      print_scroll_message_by_id(0x102);
      if ((short)iVar15 < 0x13) {
        return 1;
      }
      return 0;
    }
    _savedLink = g_current_container_link;
    g_current_container_link = *(undefined2 *)(_parentRec + 8);
    puVar11 = (ushort *)resolve_object_link(&g_current_container_link);
    g_current_container_link = _savedLink;
  }
  else {
    if (iVar15 < 0x14) {
      puVar10 = &g_equipped_items + iVar15 * 2;
      puVar11 = (ushort *)resolve_object_link(puVar10);
    }
    else {
      puVar11 = (ushort *)resolve_object_link(&g_equipped_items + iVar15 * 2);
      if ((puVar11 == (ushort *)0x0) || ((*puVar11 & 0x1f0) != 0x80)) {
        puVar11 = (ushort *)resolve_object_link(&g_current_container_link);
      }
    }
  }
  if (iVar15 < 5) {
    if (uVar1 != 0) {
      if (iVar15 != 0) {
        return 0;
      }
      sVar9 = use_food_item(g_player_object,param_1,0);
      if (sVar9 < 1) {
        return 0;
      }
      return 0xffffffff;
    }
    if (((byte)*param_1 & 0x30) < 0x20) {
      return 0;
    }
    iVar12 = get_scanned_object_class_effect_ptr();
    if (iVar15 == 0) {
      bVar16 = *(char *)(iVar12 + 3) == '\b';
    }
    else if (iVar15 == 1) {
      bVar16 = *(char *)(iVar12 + 3) == '\x01';
    }
    else if (iVar15 == 2) {
      bVar16 = *(char *)(iVar12 + 3) == '\x04';
    }
    else if (iVar15 == 3) {
      bVar16 = *(char *)(iVar12 + 3) == '\x03';
    }
    else {
      if (iVar15 != 4) {
        return 0;
      }
      bVar16 = *(char *)(iVar12 + 3) == '\x05';
    }
LAB_00047a68:
    if (!bVar16) {
      return 0;
    }
    return 1;
  }
  if ((iVar15 == 9) || (iVar15 == 10)) {
    if (uVar1 != 0) {
      return 0;
    }
    if (((byte)*param_1 & 0x30) < 0x20) {
      return 0;
    }
    iVar15 = get_scanned_object_class_effect_ptr();
    bVar16 = *(char *)(iVar15 + 3) == '\t';
    goto LAB_00047a68;
  }
  if ((iVar15 == 8 - (*(byte *)(DAT_00086df8 + 100) & 1)) && ((uVar1 == 0 && (uVar5 == 0)))) {
    if ((puVar11 != (ushort *)0x0) && ((*puVar11 & 0x1ff) == local_4c)) {
      return 0;
    }
    if ((((*param_1 & 0x8000) != 0) && ((param_1[3] & 0x8000) == 0)) &&
       (0x40 < (param_1[3] & 0xffc0))) {
      return 0;
    }
  }
  else {
    local_50 = (int)(short)uVar1;
    if ((local_50 == 2) && (((uVar5 == 1 && (3 < bVar4)) && (bVar4 < 8)))) {
      iVar12 = 0;
      do {
        if (iVar15 == (char)(&g_light_source_slots)[(int)iVar12]) {
          return 1;
        }
        iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
      } while (iVar12 < 4);
      uVar1 = *param_1;
      bVar6 = (byte)uVar1;
      *(byte *)param_1 = (bVar4 - 4 ^ bVar6) & 0xf ^ bVar6;
      *(byte *)((char *)param_1 + 1) = (byte)(uVar1 >> 8);
      set_ambient_bias_without_light(0);
      sVar9 = check_object_fits_in_slot(param_1,param_2);
      if (sVar9 != 0) {
        return 1;
      }
      uVar1 = *param_1;
      bVar6 = (byte)uVar1;
      *(byte *)param_1 = (bVar6 ^ bVar4) & 0xf ^ bVar6;
      *(byte *)((char *)param_1 + 1) = (byte)(uVar1 >> 8);
      return 0;
    }
  }
  local_50 = (int)(short)uVar1;
  if ((puVar11 == (ushort *)0x0) || ((*puVar11 & 0x1f0) != 0x80)) {
LAB_00047a0c:
    return (byte)local_48[3] >> 5 & 1;
  }
  bVar6 = 1;
  local_54[0] = calculate_object_weight(param_1);
  iVar12 = g_current_container_record;
  bVar7 = 1;
  if (0x13 < iVar15) {
    /* Was `iVar12 = *(int *)(iVar12 + 4)` walking the legacy 4-byte
       "prev" field (truncated half of a real 64-bit pointer, same class
       as this whole file's Update-29 sweep) -- an EARLIER pass through
       this exact loop already found and partly fixed the DIFFERENT bug
       right below (resolve_object_link(iVar12+8) always NULL for a
       tracking record, outside the object arena), but that fix only
       covered the FIRST iteration (the innermost/currently-open
       container, via the ternary onto g_current_container_link) and
       explicitly flagged deeper ancestors as "untested and likely
       still-broken" for lack of an "equivalent stand-in" at the time --
       that stand-in is the same g_current_container_link save/restore
       workaround, just needed on every iteration, not only the first,
       now that the walk pointer itself is also fixed. Confirmed live:
       still the exact same crash (check_object_fits_in_slot via
       place_object_in_backpack_slot/place_held_item_in_empty_slot/
       handle_backpack_slot_click) the moment a real 2-level-deep
       ancestor chain existed to walk into on this loop's SECOND
       iteration. */
    for (; bVar6 = bVar7, iVar12 != 0; iVar12 = *(char **)(iVar12 + 0x14)) {
      _savedLink = g_current_container_link;
      g_current_container_link = *(undefined2 *)(iVar12 + 8);
      pbVar13 = (byte *)resolve_object_link(&g_current_container_link);
      g_current_container_link = _savedLink;
      if (pbVar13 == (byte *)0x0) {
        bVar7 = 1;
      }
      else if (((short)(ushort)(byte)(&g_carry_weight_limit_table)[(*pbVar13 & 0xf) * 3] == 0) ||
         (bVar7 = 0,
         (int)*(short *)(iVar12 + 10) + (int)local_54[0] <=
         (int)(short)(ushort)(byte)(&g_carry_weight_limit_table)[(*pbVar13 & 0xf) * 3])) {
        bVar7 = 1;
      }
      bVar7 = bVar6 & bVar7;
    }
  }
  sum_container_weight(puVar11 + 3,local_54);
  uVar8 = local_4c;
  iVar15 = ((byte)*puVar11 & 0xf) * 3;
  if (((byte)(&g_carry_weight_limit_table)[iVar15] == 0) ||
     (bVar7 = 0, local_54[0] <= (short)(ushort)(byte)(&g_carry_weight_limit_table)[iVar15])) {
    bVar7 = 1;
  }
  if (!(bool)(bVar7 & bVar6)) {
    sVar9 = build_object_display_name(acStack_40,puVar11,0,0);
    if (sVar9 == 0) {
      pcVar14 = s_UNNAMED_00084f24;
    wptr_31150 = acStack_84f64;
      do {
        cVar3 = *pcVar14;
        *wptr_31150 = cVar3; wptr_31150 = wptr_31150 + 1;
        pcVar14 = pcVar14 + 1;
      } while (cVar3 != '\0');
    }
    message_scroll_print_wrapped(&DAT_00085c88);
    message_scroll_print_wrapped(acStack_40);
    message_scroll_print_wrapped(s_is_too_full__00085c78);
    return 0;
  }
  uVar2 = (uint)*(short *)(&DAT_002029f9 + iVar15);
  /* DAT_002029f9 (this container-type's "specific item id required" table,
     alongside its sibling g_carry_weight_limit_table used for the weight-capacity check
     just above) is loaded by load_light_food_effect_tables -- but that loader itself has
     no caller anywhere in the decompiled binary (confirmed via a real
     Ghidra xref search: the only reference to load_light_food_effect_tables's address is
     a DATA reference, meaning it's stored into some struct as a function
     pointer for an indirect call this project hasn't traced/wired up
     yet), so this table is permanently all-zero. The sibling capacity
     table (g_carry_weight_limit_table) already treats a zero entry as "no limit" (see
     the `(&g_carry_weight_limit_table)[iVar15] == 0` check just above); this table's
     own zero-entry case was instead falling into the "must be this
     exact item id" branch below with a real zero, incorrectly requiring
     the placed item's id to literally be 0 -- rejecting every real
     item with the "does not fit" message (print_scroll_message_by_id(0xf8)).
     Confirmed live: dragging an item to an empty slot inside an open
     container printed "That item does not fit." on every attempt.
     Treat an unpopulated (zero) entry the same permissive way its
     sibling table already does, via the same LAB_00047a0c fallback
     already used for the table's other explicit "no restriction"
     sentinel (a negative entry) -- a narrow, local fix for the
     immediate symptom; the deeper root cause (wiring up load_light_food_effect_tables's
     real call so this table, g_carry_weight_limit_table, and g_food_effect_table all
     get their real game data) is a separate, larger task. */
  if ((int)uVar2 <= 0) goto LAB_00047a0c;
  if ((int)uVar2 < 0x200) {
    if ((local_4c != uVar2) && (print_scroll_message_by_id(0xf8), uVar8 != uVar2)) {
      return 0;
    }
    return 1;
  }
  if (uVar2 == 0x200) {
    if ((local_50 != 3) || ((uVar5 != 3 && ((uVar5 != 2 || (bVar4 < 8)))))) {
      print_scroll_message_by_id(0xf7);
      return 0;
    }
  }
  else if (uVar2 == 0x201) {
    if (((local_50 != 0) || (uVar5 != 1)) || (2 < bVar4)) goto LAB_000479b4;
  }
  else if (uVar2 == 0x202) {
    if (((local_50 != 4) || (uVar5 != 3)) || (bVar4 < 8)) goto LAB_000479b4;
  }
  else if ((uVar2 != 0x203) ||
          (((local_50 != 2 || (uVar5 != 3)) &&
           ((local_4c != 0xce &&
            ((((local_4c != 0xcf && (local_4c != 0x92)) && (local_4c != 0x125)) &&
             ((local_4c != 0x11b && (local_4c != 0xd9)))))))))) {
LAB_000479b4:
    sVar9 = 0;
    print_scroll_message_by_id(0xf8);
    goto LAB_000479c0;
  }
  sVar9 = 1;
LAB_000479c0:
  return (int)sVar9;
}



void handle_backpack_slot_click(param_1)
short param_1;

{
  int iVar1;

  /* Dropped arguments: both branches call a 2-param function with only
     one arg -- place_held_item_in_empty_slot/handle_backpack_slot_interact's own declared signatures take
     (held_object, slot_index), but this wrapper only forwards
     g_selected_object (the held object) and drops its own param_1 (the slot
     index that hit_test_inventory_widget just resolved from the click). Same
     "wrapper forgot to forward its own argument" idiom as
     check_object_carry_weight/blit_object_sprite_by_frame earlier this session -- traced by hand
     while wiring up backpack-slot placement (the click hit-boxes and
     widget-to-slot mapping in g_inv_hotspot_click_x1/g_backpack_widget_to_slot were the other
     missing pieces, see their own comments). */
  if ((*(ushort *)(&g_equipped_items + param_1 * 2) & 0xffc0) == 0) {
    iVar1 = place_held_item_in_empty_slot(g_selected_object, param_1);
  }
  else {
    iVar1 = handle_backpack_slot_interact(g_selected_object, param_1);
  }
  if (iVar1 != 0) {
    g_selected_object = 0;
  }
  return;
}



undefined4 place_held_item_in_empty_slot(param_1,param_2)
/* Was `undefined4 param_1` -- a 64-bit pointer truncates to its low 32
   bits the moment a caller passes it to a function whose own signature
   declares this narrower type (matches sum_container_weight's identical fix
   elsewhere in this file). Latent until handle_backpack_slot_click's dropped argument
   was fixed and a real g_selected_object object pointer started actually
   reaching here -- then this truncated pointer segfaulted three frames
   further down in check_object_fits_in_slot's first dereference. */
ushort *param_1;
short param_2;

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar1 = (int)param_2;
  uVar3 = 0;
  if (iVar1 == 0x13) {
    uVar3 = 0;
  }
  else {
    /* Dropped argument: place_object_in_backpack_slot's own declared signature takes
       (object, slot_index) and writes the object's link into
       &g_equipped_items + slot_index*2 -- the real "place held item into
       this backpack slot" primitive -- but slot_index was never
       forwarded here, so it placed nothing at a real slot. */
    iVar2 = place_object_in_backpack_slot(param_1, param_2);
    if (iVar2 != 0) {
      if (iVar1 < 0x13) {
        redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar1]);
      }
      else {
        repopulate_container_grid_slots();
        refresh_container_view();
      }
      uVar3 = 1;
    }
  }
  return uVar3;
}






// WARNING: Removing unreachable block (ram,0x00047f40)

undefined4 handle_backpack_slot_interact(param_1,param_2)
ushort * param_1;
uint param_2;

{
  int iVar1;
  byte bVar2;
  short sVar3;
  ushort *puVar4;
  char *iVar5;
  undefined4 uVar6;
  ushort *puVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  undefined4 uVar11;
  bool bVar12;
  
  iVar1 = (int)(short)param_2;
  uVar11 = 0;
  puVar4 = (ushort *)resolve_object_link(&g_equipped_items + iVar1 * 2);
  if (((*puVar4 & 0x1c0) == 0x80) && ((*puVar4 & 0x30) == 0)) {
    uVar11 = auto_place_in_container(param_1,param_2);
    refresh_player_equipment_effects();
    return uVar11;
  }
  iVar5 = objects_can_stack(param_1,puVar4);
  if (iVar5 == 0) {
    uVar6 = objects_are_combinable(param_1,puVar4);
    if ((short)uVar6 < 0) {
      if (iVar1 < 0x13) {
        puVar4 = (ushort *)extract_and_refresh_slot_item(0xffffffff,0xffffffff,0xffffffff,param_2,0);
        iVar5 = place_held_item_in_empty_slot(param_1,param_2);
        if (iVar5 == 0) {
          place_held_item_in_empty_slot(puVar4,param_2);
          puVar4 = g_selected_object;
        }
        g_selected_object = puVar4;
        if (g_selected_object != (ushort *)0x0) {
          FUN_00057cac(0);
          /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's
             own identical fix comment. */
          FUN_00057c5c(*(ushort *)g_selected_object & 0x1ff);
        }
      }
      else {
        place_object_in_equipment_slot(param_1,param_2);
      }
    }
    else {
      /* Was a dropped argument -- spawn_combined_object's own combination
         index, matching objects_are_combinable's return value (uVar6)
         used at every other call site in this branch. */
      puVar7 = (ushort *)spawn_combined_object(uVar6);
      if (puVar7 == (ushort *)0x0) {
        return 0;
      }
      iVar5 = is_object_consumed_in_combination(param_1,uVar6);
      if (iVar5 == 1) {
        discard_misplaced_object(0,param_1,1);
        g_cursor_holding_state = 1;
        g_selected_object = puVar7;
        FUN_00057cac(3);
        /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's
           own identical fix comment. */
        FUN_00057c5c(*(ushort *)g_selected_object & 0x1ff);
      }
      iVar8 = is_object_consumed_in_combination(puVar4,uVar6);
      if (iVar8 != 0) {
        if (iVar5 == 0) {
          place_held_item_in_empty_slot(puVar7,param_2);
        }
        deplete_object_count(puVar4);
        discard_misplaced_object(0,puVar4,1);
      }
      uVar11 = 0;
    }
  }
  else {
    sVar3 = check_object_fits_in_slot(param_1,param_2);
    if (sVar3 != 1) {
      return 0;
    }
    uVar9 = (*(byte *)((char *)param_1 + 1) & 0x80) << 8;
    bVar12 = (*(byte *)((char *)param_1 + 1) & 0x80) != 0;
    if (bVar12) {
      uVar9 = (uint)param_1[3];
    }
    if (bVar12) {
      param_2 = uVar9 >> 6;
    }
    if (!bVar12) {
      param_2 = 1;
    }
    if ((*(byte *)((char *)puVar4 + 1) & 0x80) == 0) {
      *(char *)puVar4 = (char)*puVar4;
      *(byte *)((char *)puVar4 + 1) = *(byte *)((char *)puVar4 + 1) | 0x80;
      *(byte *)(puVar4 + 3) = (byte)puVar4[3] & 0x3f | 0x40;
      *(undefined1 *)((char *)puVar4 + 7) = 0;
    }
    iVar8 = (*(ushort *)(&DAT_00202c91 + (*param_1 & 0x1ff) * 0xd) >> 4) * param_2;
    iVar5 = g_current_container_record;
    /* Legacy truncated "prev" walk -- same fix as
       place_object_in_backpack_slot's sibling copy (search "still
       broken for genuine container nesting"). */
    if (0x13 < iVar1) {
      for (; iVar5 != 0; iVar5 = *(char **)(iVar5 + 0x14)) {
        iVar10 = *(short *)(iVar5 + 10) + iVar8;
        *(char *)(iVar5 + 10) = (char)iVar10;
        *(char *)(iVar5 + 0xb) = (char)((uint)iVar10 >> 8);
      }
    }
    g_player_carry_weight = g_player_carry_weight + (short)iVar8;
    refresh_player_equipment_effects();
    iVar5 = (puVar4[3] & 0xffc0) + param_2 * 0x40;
    bVar2 = (byte)puVar4[2];
    *(byte *)(puVar4 + 3) = (byte)iVar5 ^ (byte)puVar4[3] & 0x3f;
    *(char *)((char *)puVar4 + 7) = (char)((uint)iVar5 >> 8);
    *(byte *)(puVar4 + 2) =
         (bVar2 ^ (byte)((int)(((byte)param_1[2] & 0x3f) +
                              (CONCAT11(*(undefined1 *)((char *)puVar4 + 5),bVar2) & 0x3f)) >> 1)) &
         0x3f ^ bVar2;
    *(undefined1 *)((char *)puVar4 + 5) = *(undefined1 *)((char *)puVar4 + 5);
    free_object_slot(param_1);
    uVar11 = 1;
  }
  redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar1]);
  return uVar11;
}





















/* Debug view (UW_DEBUG_PICK_VIEW): paint the per-pixel object-pick buffer
   DAT_0023cca0 over the 3D viewport instead of the rendered dungeon, so
   the pick/stencil coverage is directly visible. Call *after* a pick-mode
   render pass (FUN_0005bac0) has populated the buffer. Colour key:
     0x00           empty (no geometry)      -> dark blue
     0x01..0xbe     object slot id           -> bright cycling colour
     0xc0..0xfa     wall texture (v-0xbf)    -> grey ramp
     other          -> magenta
   Plus a yellow crosshair at the cursor. Viewport rect is x[52,276)
   y[19,150) (the rect_fill the renderer clears each frame). */
void uw_debug_blit_pick_buffer(void)
{
  /* 16 distinct colours for object slot ids; deliberately excludes the
     crosshair yellow (0xFFE0) and the out-of-range magenta (0xF81F). */
  static const unsigned short obj_pal[16] = {
    0xF800, 0x07E0, 0x001F, 0x07FF, 0xFC00, 0xFD20, 0x8400, 0x0410,
    0x001A, 0x8010, 0xAFE5, 0x05FF, 0xF7B0, 0x7BEF, 0xFAE0, 0x39C7,
  };
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int x, y;
  if (fb == 0 || DAT_0023cca0 == 0) return;
  for (y = 19; y < 150; y++) {
    const unsigned char *row = (const unsigned char *)DAT_0023cca0 + y * 0x140;
    unsigned short *frow = fb + y * 0x140;
    for (x = 52; x < 276; x++) {
      unsigned int v = row[x];
      unsigned short c;
      if (v == 0)                 c = 0x0008;                 /* near-black blue */
      else if (v >= 0xc0 && v < 0xfb) {
        unsigned int g = ((v - 0xbf) * 5) & 0x3f;             /* 0..0x3f grey ramp */
        c = (unsigned short)(((g >> 1) << 11) | (g << 5) | (g >> 1));
      }
      else if (v < 0xc0)          c = obj_pal[v & 0xf];
      else                        c = 0xF81F;                 /* magenta: out of range */
      frow[x] = c;
    }
  }
  /* cursor crosshair */
  { int cx = (int)g_mouse_x, cy = (int)g_mouse_y, i;
    for (i = -4; i <= 4; i++) {
      int px = cx + i, py = cy + i;
      if (cy >= 0 && cy < 240 && cx + i >= 0 && cx + i < 320) fb[cy * 0x140 + px] = 0xFFE0;
      if (cx >= 0 && cx < 320 && cy + i >= 0 && cy + i < 240) fb[py * 0x140 + cx] = 0xFFE0;
    }
  }
}



/* Debug view (UW_DEBUG_DRAW_INV_POSITIONS): outline every real inventory
   hotspot's click rect (g_inventory_hotspot_table's 23 records) in
   bright red, directly into the framebuffer -- for visually verifying
   the recovered hotspot table lines up with the actual paperdoll/
   backpack panel art (open the inventory panel, screenshot, and check
   every box sits exactly on its icon). Record 0 is the real degenerate
   sentinel (x1=x2, y1=y2) and is skipped, same as
   hit_test_inventory_widget's own no-op treatment of it. Outline only
   (not filled) so the icon underneath stays visible. */
 void uw_debug_draw_inv_hotspot_positions(void)
{
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int i, min_x = 0x7fffffff, max_x = -1, min_y = 0x7fffffff, max_y = -1;
  if (fb == 0) return;
  for (i = 0; i < 0x17; i++) {
    int x1, y1, x2, y2, x, y;
    int off = i * 0xe;
    x1 = *(short *)(&g_inv_hotspot_click_x1 + off);
    y1 = *(short *)(&g_inv_hotspot_click_y1 + off);
    x2 = *(short *)(&g_inv_hotspot_click_x2 + off);
    y2 = *(short *)(&g_inv_hotspot_click_y2 + off);
    if (x1 == x2 && y1 == y2) continue;
    for (x = x1; x <= x2; x++) {
      if (x < 0 || x >= 320) continue;
      if (y1 >= 0 && y1 < 200) fb[y1 * 0x140 + x] = 0xF800;
      if (y2 >= 0 && y2 < 200) fb[y2 * 0x140 + x] = 0xF800;
    }
    for (y = y1; y <= y2; y++) {
      if (y < 0 || y >= 200) continue;
      if (x1 >= 0 && x1 < 320) fb[y * 0x140 + x1] = 0xF800;
      if (x2 >= 0 && x2 < 320) fb[y * 0x140 + x2] = 0xF800;
    }
    if (x1 < min_x) min_x = x1;
    if (x2 > max_x) max_x = x2;
    if (y1 < min_y) min_y = y1;
    if (y2 > max_y) max_y = y2;
  }
  if (max_x >= 0) dirty_rect_union(min_y, max_y, min_x, max_x);
}

/* Debug tool (UW_DUMP_SPRITE_FRAMES / UW_DUMP_SPRITE_IDS): dump
   individual sprites to standalone BMP files by real resource id, one
   file per id, using the game's own real render path (blit_object_
   sprite_by_frame for a raw absolute frame index, draw_sprite_by_id
   for a normal game object/sprite id that goes through
   resolve_sprite_id_to_frame first) -- not a separate from-scratch
   .GR parser, so it exercises exactly the same code this project has
   been chasing rendering bugs through (e.g. the TMOBJ sign investigation,
   see [[tmobj-sign-table-recovery]] and follow-ups).

   UW_DUMP_SPRITE_FRAMES/UW_DUMP_SPRITE_IDS are a comma-separated list
   of ids and/or inclusive ranges, e.g. "643-680,18,149". Output goes to
   UW_DUMP_SPRITE_DIR (default "debug/sprites"), as frame_<id>.bmp or
   id_<id>.bmp. Runs once, early in the first real gameplay tick. */
static void _uw_dump_sprite_to_file(int is_frame, int id, const char *dir) {
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int cw = 96, ch = 128, ox = 4, oy = 4;
  if (fb == 0) return;
  for (int y = 0; y < ch; y++) {
    for (int x = 0; x < cw; x++) {
      fb[(oy + y) * 0x140 + (ox + x)] = 0;
    }
  }
  if (is_frame) {
    blit_object_sprite_by_frame(id, ox, oy);
  } else {
    draw_sprite_by_id(id, ox, oy, cw, ch);
  }
  char path[320];
  snprintf(path, sizeof(path), "%s/%s_%d.bmp", dir, is_frame ? "frame" : "id", id);
  uw_save_rgb565_region_bmp(path, fb + oy * 0x140 + ox, cw, ch, 0x140);
}

static void _uw_dump_sprite_ids_from_env(const char *envname, int is_frame, const char *dir) {
  const char *spec = getenv(envname);
  if (!spec || !spec[0]) return;
  uw_debug_mkdir_p(dir);
  const char *p = spec;
  while (*p) {
    int lo, hi;
    char *end;
    lo = (int)strtol(p, &end, 10);
    if (end == p) break;
    p = end;
    if (*p == '-') {
      p++;
      hi = (int)strtol(p, &end, 10);
      if (end == p) hi = lo;
      p = end;
    } else {
      hi = lo;
    }
    for (int id = lo; id <= hi; id++) {
      _uw_dump_sprite_to_file(is_frame, id, dir);
    }
    if (*p == ',') p++;
    else break;
  }
}

/* Temporary test hook for verifying the armor paper-doll equip flow
   without a real "give item" mechanism: once per run, the first time
   backpack grid slot 12 holds a real object, overwrite its low 9 id
   bits with UW_DEBUG_FORCE_ITEM_ID (hex) in place -- reusing a real,
   already-linked object (e.g. a picked-up torch) the same way
   use_light_source toggles bits on an existing object, rather than
   fabricating a new arena entry. Not meant to stay long-term. */
 void uw_debug_force_item_id_once(void) {
  static int done = 0;
  if (done) return;
  const char *idstr = getenv("UW_DEBUG_FORCE_ITEM_ID");
  if (!idstr) return;
  ushort *obj = (ushort *)get_equipped_item_at_slot(12);
  if (!obj) return;
  done = 1;
  int newid = (int)strtol(idstr, NULL, 16);
  ushort old = *obj;
  *obj = (old & ~(ushort)0x1ff) | (newid & 0x1ff);
  fprintf(stderr, "[armor] forced slot12 object id 0x%03x -> 0x%03x\n", old & 0x1ff, *obj & 0x1ff);
}



 void uw_debug_dump_sprite_frames_once(void) {
  static int done = 0;
  if (done) return;
  done = 1;
  if (!getenv("UW_DUMP_SPRITE_FRAMES") && !getenv("UW_DUMP_SPRITE_IDS")) return;
  const char *dir = getenv("UW_DUMP_SPRITE_DIR");
  if (!dir || !dir[0]) dir = "debug/sprites";
  _uw_dump_sprite_ids_from_env("UW_DUMP_SPRITE_FRAMES", 1, dir);
  _uw_dump_sprite_ids_from_env("UW_DUMP_SPRITE_IDS", 0, dir);
}

/* Debug tool (UW_DUMP_CRITTER_SHEET): systematically drive
   decode_critter_sprite_page across every (tier, direction, frame)
   combination for one or more critter type indices, instead of
   passively capturing whatever poses a demo happens to render. Lets a
   bug in a creature's .GR page data (or in the glyph-selection math
   reading it) be inspected directly as a full sprite sheet, rather
   than inferred from whichever single frame the AI/camera angle
   happened to trigger live -- built to investigate a report that
   Bragit (a peaceful NPC) flashed a "facing player" idle frame, showed
   garbage data, sometimes showed death-animation frames, and never
   showed any of the other rotation angles.

   UW_DUMP_CRITTER_SHEET=<type_idx>[,<type_idx>...] -- type_idx is
   resolve_critter_sprite_tier's own param_1 (the object id's low 6
   bits, uVar27 & 0x3f in emit_tile_objects -- NOT the full 9-bit
   object id; run with UW_DEBUG_CRITTER while near the NPC in question
   to read its real type_idx off the "[critter] emit_tile_objects:
   ... type_idx=N" trace line). For each type_idx, looks up its real
   page index and frame-count-check value from the same DAT_0023ce70/
   DAT_0023ce71 assoc tables resolve_critter_sprite_tier itself reads
   (skips a type_idx with no assoc entry, the 0xff sentinel), then
   calls decode_critter_sprite_page directly for tier=0..3 (the real,
   fixed tier range) x direction=0..UW_DUMP_CRITTER_SHEET_MAXDIR
   (default 127) x frame=0..UW_DUMP_CRITTER_SHEET_MAXFRAME (default
   15). decode_critter_sprite_page's own bounds checks (glyph-index
   range, page-open failure, implausible >64px header) make
   out-of-range combos a no-op rather than a crash -- most combos in
   this sweep won't correspond to real data and simply produce no file.

   Reuses the existing uw_debug_dump_critter_sprite hook already wired
   into decode_critter_sprite_page (gx_stub.c, gated on
   UW_DEBUG_DUMP_CRIT) to do the actual BMP writing -- implicitly
   enables that hook so this tool works standalone. Output:
   debug/crit/type<page_idx>/tier<N>/dir<D>_frame<F>.bmp. Runs once,
   early in the first real gameplay tick. */
 void uw_debug_dump_critter_sheet_once(void) {
  static int done = 0;
  if (done) return;
  done = 1;
  const char *spec = getenv("UW_DUMP_CRITTER_SHEET");
  if (!spec || !spec[0]) return;
  setenv("UW_DEBUG_DUMP_CRIT", "1", 0);
  /* default maxdir kept conservative (63, not the full 0-255 clamp
     resolve_critter_sprite_tier allows): sweeping direction values past
     a creature's real per-page table found a separate, unfixed bug --
     an out-of-range direction can produce a header that still passes
     the existing "w/h > 64" plausibility check yet isn't real glyph
     data, and decompress_gr_bitmap's decompressor doesn't bound its output to
     the allocated buffer, corrupting the heap (confirmed via lldb:
     malloc's free_list_checksum_botch, non-deterministic crash
     manifesting later in unrelated code). Raise
     UW_DUMP_CRITTER_SHEET_MAXDIR deliberately if you need to probe
     further -- expect it to be crash-prone past a type's real table
     size, which is itself diagnostic (that boundary IS the type's real
     direction-table extent). */
  int maxdir = 63, maxframe = 15;
  { const char *e = getenv("UW_DUMP_CRITTER_SHEET_MAXDIR"); if (e) maxdir = atoi(e); }
  { const char *e = getenv("UW_DUMP_CRITTER_SHEET_MAXFRAME"); if (e) maxframe = atoi(e); }
  const char *p = spec;
  while (*p) {
    char *end;
    long type_idx = strtol(p, &end, 10);
    if (end == p) break;
    p = end;
    if (type_idx >= 0 && type_idx < 64) {
      int page_idx = (unsigned char)(&DAT_0023ce70)[type_idx * 2];
      int frame_count_param = (unsigned char)(&DAT_0023ce71)[type_idx * 2];
      if (page_idx == 0xff) {
        fprintf(stderr, "[crit-sheet] type_idx=%ld has no assoc-table entry (0xff sentinel), skipping\n",
                type_idx);
      } else {
        fprintf(stderr, "[crit-sheet] type_idx=%ld -> page_idx=%d frame_count_param=%d, sweeping "
                "tier=0..3 dir=0..%d frame=0..%d\n",
                type_idx, page_idx, frame_count_param, maxdir, maxframe);
        for (int tier = 0; tier < 4; tier++) {
          for (int dir = 0; dir <= maxdir; dir++) {
            for (int frame = 0; frame <= maxframe; frame++) {
              decode_critter_sprite_page(page_idx, tier, dir, frame_count_param, frame);
            }
          }
        }
      }
    }
    if (*p == ',') p++;
    else break;
  }
  fprintf(stderr, "[crit-sheet] sweep complete, see debug/crit/\n");
}



// was FUN_00049818 -- dispatches DAT_00201c84's currently-set "sticky
// redraw/per-frame" bits through the DAT_00085668 per-mode handler table
// (movement_pacing_handler is mode 0's bit 12, see DAT_00085728's own
// comment), then re-arms whichever bits DAT_00085728[current mode] always
// wants re-triggered -- this re-arm is what makes a mode's per-frame
// handlers keep firing every call instead of running once and going
// quiet. Called once per real game tick from app_main_loop's own while
// loop (game.c), gated on DAT_00201c84 != 0 (see main_loop_hud_flush's
// own call site) -- this is the actual per-tick movement dispatch, the
// anchor point uw_advance_game_tick's deterministic clock now advances
// in lockstep with (see its own comment in gx_stub.c).
void dispatch_sticky_mode_handlers()

{
  short sVar1;
  char cVar2;
  uint uVar3;
  ushort uVar4;
  bool bVar5;

  if (DAT_00201c84 != 0) {
    uVar4 = 1;
    uVar3 = 0;
    sVar1 = DAT_00201b64;
    do {
      if ((DAT_00201c84 & uVar4) != 0) {
        DAT_00201c84 = DAT_00201c84 & ~uVar4;
        /* *8 (real pointer size), see DAT_00085668's comment; *0x10 stays
           -- that's the 16-entries-per-mode count, not a byte stride. */
        if (*(code **)(&DAT_00085668 + (uVar3 + sVar1 * 0x10) * 8) != (code *)0x0) {
          (**(code **)(&DAT_00085668 + (uVar3 + sVar1 * 0x10) * 8))();
          sVar1 = DAT_00201b64;
        }
      }
      uVar4 = uVar4 << 1;
      uVar3 = uVar3 + 1 & 0xffff;
    } while (uVar3 < 0xf);
    DAT_00201c84 = *(ushort *)(&DAT_00085728 + sVar1 * 2) | DAT_00201c84;
    if (DAT_0023bf0c != '\0') {
      cVar2 = DAT_0023bf0c + -1;
      bVar5 = DAT_0023bf0c == '\x01';
      DAT_0023bf0c = cVar2;
      if (bVar5) {
        reset_cursor_confine_rect();
      }
    }
  }
  return;
}
























void load_light_food_effect_tables(param_1)
undefined4 param_1;

{
  read_file_handle(param_1,&g_carry_weight_limit_table,0x30);
  read_file_handle(param_1,&g_light_radius_table,0x20);
  read_file_handle(param_1,&g_food_effect_table,0x10);
  return;
}



// was FUN_0004a110 -- read the cursor position, derive an "arc"
// height/angle pair from it into DAT_00202a40/DAT_00202a3c (consumed by
// spawn_object_near_player when placing the new copy), and return
// whether the cursor is far enough from the player's own screen
// position to count as a deliberate throw rather than a same-spot drop.
bool compute_drop_aim_from_cursor()

{
  int iVar1;
  int iVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short local_10;
  short local_e;
  
  FUN_00057504(&local_10,&local_e);
  sVar3 = (short)(local_10 + -0x34);
  iVar1 = (local_10 + -0x34) * 0x10000 >> 0x10;
  if (0xac < iVar1) {
    sVar3 = 0xac;
  }
  sVar5 = (short)(0x85 - local_e);
  iVar2 = iVar1 + -0xac;
  if (iVar1 < 0xad) {
    iVar2 = iVar1;
  }
  if (iVar2 < 0) {
    sVar3 = 0;
  }
  iVar1 = (0x85 - local_e) * 0x10000 >> 0x10;
  if (0x71 < iVar1) {
    sVar5 = 0x71;
    iVar1 = iVar1 + -0x71;
  }
  if (iVar1 < 0) {
    sVar5 = 0;
  }
  sVar3 = Ordinal_2005(0xd,(sVar3 + -0x56) * 5);
  DAT_00202a40 = sVar3 + -1;
  sVar3 = Ordinal_2005(6,sVar5 + -0x38);
  sVar4 = Ordinal_2005(0x300,(int)DAT_0023beb4);
  DAT_00202a3c = sVar3 + sVar4;
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[dropaim] cursor(local_10,local_e)=(%d,%d) sVar5=%d result(0x24<sVar5)=%d\n",
            (int)local_10, (int)local_e, (int)sVar5, (int)(0x24 < sVar5));
  return 0x24 < sVar5;
}




































void FUN_0004e6e0(param_1)
int param_1;

{
  int uw_ord2005_rem_114 = 0;
  uint uVar1;
  int *piVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  int extraout_r1;
  int *piVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  int local_30;
  
  piVar2 = (int *)(param_1 + 0x1054c);
  iVar10 = 0;
  if (0 < *piVar2) {
    local_30 = 0;
    iVar8 = 0;
    piVar4 = piVar2;
    do {
      iVar3 = *(int *)(*(int *)(param_1 + 0x10550) + 4) + local_30;
      uVar1 = *(uint *)(iVar3 + 0xc);
      iVar7 = (int)uVar1 >> 4;
      uVar9 = uVar1 & 0xf;
      switch(*(undefined4 *)(iVar3 + 8)) {
      case 0:
        if (0 < (int)uVar1) {
          uw_ord2005_rem_114 = ((int)(*(undefined4 *)(param_1 + 0x10540))) % (3);
          if (uw_ord2005_rem_114 == 0) {
            piVar4 = *(int **)(*(int *)(param_1 + 0x10524) + iVar8 + 0xc);
          }
          else {
            if (uw_ord2005_rem_114 == 1) {
              piVar4 = (int *)(*(int *)(param_1 + 0x10524) + iVar8);
              iVar7 = *(int *)(*piVar4 * 0x30 + *(int *)(param_1 + 0x1050c) + 8) + piVar4[2] +
                      iVar7 * 8;
            }
            else {
              if (uw_ord2005_rem_114 != 2) goto LAB_0004e964;
              piVar4 = (int *)(*(int *)(param_1 + 0x10524) + iVar8);
              iVar7 = *(int *)(*piVar4 * 0x30 + *(int *)(param_1 + 0x1050c) + 8) + piVar4[2] +
                      uVar9 * 8;
            }
            piVar4 = (int *)(&DAT_00086370)[iVar7];
          }
LAB_0004e964:
          uVar5 = Ordinal_2032(piVar4);
          uVar5 = Ordinal_2047(0x4a5a7a65,uVar5);
          iVar7 = *(int *)(param_1 + 0x10524);
          goto LAB_0004eb28;
        }
        break;
      case 1:
        piVar6 = (int *)(param_1 + 0x10524);
        iVar7 = iVar8 + *piVar6;
        iVar3 = *(int *)(iVar7 + 0xc) - uVar1;
        *(char *)(iVar7 + 0xc) = (char)iVar3;
        *(char *)(iVar7 + 0xd) = (char)((uint)iVar3 >> 8);
        *(char *)(iVar7 + 0xe) = (char)((uint)iVar3 >> 0x10);
        *(char *)(iVar7 + 0xf) = (char)((uint)iVar3 >> 0x18);
        if (*(int *)(iVar8 + *piVar6 + 0xc) < 0x36) {
          iVar7 = iVar8 + *piVar6;
          *(undefined1 *)(iVar7 + 0xc) = 0x36;
          *(undefined1 *)(iVar7 + 0xd) = 0;
          *(undefined1 *)(iVar7 + 0xe) = 0;
          *(undefined1 *)(iVar7 + 0xf) = 0;
        }
        iVar7 = *piVar6;
        uVar5 = Ordinal_2032(*(undefined4 *)(iVar8 + iVar7 + 0xc));
        uVar5 = Ordinal_2047(0x4a5a7a65,uVar5);
        goto LAB_0004eb28;
      case 2:
        iVar7 = iVar8 + *(int *)(param_1 + 0x10524);
        iVar3 = *(int *)(iVar7 + 0xc) + uVar1;
        *(char *)(iVar7 + 0xc) = (char)iVar3;
        *(char *)(iVar7 + 0xd) = (char)((uint)iVar3 >> 8);
        *(char *)(iVar7 + 0xe) = (char)((uint)iVar3 >> 0x10);
        *(char *)(iVar7 + 0xf) = (char)((uint)iVar3 >> 0x18);
        iVar7 = *(int *)(param_1 + 0x10524);
        uVar5 = Ordinal_2032(*(undefined4 *)(iVar8 + iVar7 + 0xc));
        uVar5 = Ordinal_2047(0x4a5a7a65,uVar5);
LAB_0004eb28:
        iVar7 = iVar8 + iVar7;
        *(char *)(iVar7 + 0x10) = (char)uVar5;
        *(char *)(iVar7 + 0x11) = (char)((uint)uVar5 >> 8);
        *(char *)(iVar7 + 0x12) = (char)((uint)uVar5 >> 0x10);
        *(char *)(iVar7 + 0x13) = (char)((uint)uVar5 >> 0x18);
        break;
      case 3:
        FUN_0004ee60(param_1,iVar10);
        break;
      case 4:
        FUN_0004f0ac(param_1,iVar10);
        break;
      case 5:
        FUN_0004ee60(param_1,iVar10);
        goto LAB_0004eb74;
      case 6:
        FUN_0004f0ac(param_1,iVar10);
        goto LAB_0004eb74;
      case 7:
        FUN_0004f2f0(param_1,iVar10);
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
LAB_0004eb74:
        FUN_0004edf8(param_1,iVar10,iVar7 - uVar9);
        iVar7 = iVar8 + *(int *)(param_1 + 0x10524);
        uVar5 = *(undefined4 *)(iVar8 + *(int *)(param_1 + 0x10524) + 0x14);
        *(char *)(iVar7 + 0x18) = (char)uVar5;
        *(char *)(iVar7 + 0x19) = (char)((uint)uVar5 >> 8);
        *(char *)(iVar7 + 0x1a) = (char)((uint)uVar5 >> 0x10);
        *(char *)(iVar7 + 0x1b) = (char)((uint)uVar5 >> 0x18);
        break;
      case 0xb:
        break;
      case 0xc:
        break;
      case 0xd:
        break;
      case 0xe:
        if ((iVar7 == 0xc) && (*(uint *)(param_1 + 0x10540) == uVar9)) {
          iVar7 = iVar8 + *(int *)(param_1 + 0x10524);
          *(undefined1 *)(iVar7 + 0x14) = 0;
          *(undefined1 *)(iVar7 + 0x15) = 0;
          *(undefined1 *)(iVar7 + 0x16) = 0;
          *(undefined1 *)(iVar7 + 0x17) = 0;
          iVar7 = iVar8 + *(int *)(param_1 + 0x10524);
          uVar5 = *(undefined4 *)(iVar7 + 0x14);
          *(char *)(iVar7 + 0x18) = (char)uVar5;
          *(char *)(iVar7 + 0x19) = (char)((uint)uVar5 >> 8);
          *(char *)(iVar7 + 0x1a) = (char)((uint)uVar5 >> 0x10);
          *(char *)(iVar7 + 0x1b) = (char)((uint)uVar5 >> 0x18);
        }
      }
      iVar10 = iVar10 + 1;
      iVar8 = iVar8 + 0x40;
      local_30 = local_30 + 0x10;
    } while (iVar10 < *piVar2);
  }
  return;
}



void FUN_0004ecd4(param_1,param_2,param_3,param_4)
undefined4 param_1;
int param_2;
undefined4 param_3;
int param_4;

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  int *piVar4;
  
  if (param_2 == 0x3bd) {
    piVar1 = *(int **)(param_4 + 0xc);
    iVar2 = *piVar1;
    piVar4 = (int *)(iVar2 + 0x10554);
    if (*piVar4 != 0) {
      Ordinal_386(*(undefined4 *)(iVar2 + 0x1051c),param_4,0x20);
    }
    Ordinal_1094(piVar1[1]);
    Ordinal_1094(piVar1);
    if (*piVar4 != 0) {
      uVar3 = queue_mod_audio_buffer(iVar2);
      *(char *)piVar4 = (char)uVar3;
      *(char *)(iVar2 + 0x10555) = (char)((uint)uVar3 >> 8);
      *(char *)(iVar2 + 0x10556) = (char)((uint)uVar3 >> 0x10);
      *(char *)(iVar2 + 0x10557) = (char)((uint)uVar3 >> 0x18);
    }
  }
  return;
}



void FUN_0004edf8(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  int iVar1;
  int iVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  
  iVar2 = param_2 * 0x40 + *(int *)(param_1 + 0x10524);
  iVar1 = *(int *)(param_2 * 0x40 + *(int *)(param_1 + 0x10524) + 0x14);
  bVar5 = SCARRY4(iVar1,param_3);
  iVar1 = iVar1 + param_3;
  bVar3 = iVar1 < 0;
  bVar4 = iVar1 == 0;
  if (bVar3) {
    iVar1 = 0;
  }
  else {
    bVar5 = SBORROW4(iVar1,0x40);
    bVar4 = iVar1 == 0x40;
  }
  if (!bVar4 && (bVar3 || iVar1 + -0x40 < 0) == bVar5) {
    iVar1 = 0x40;
  }
  *(char *)(iVar2 + 0x14) = (char)iVar1;
  *(char *)(iVar2 + 0x15) = (char)((uint)iVar1 >> 8);
  *(char *)(iVar2 + 0x16) = (char)((uint)iVar1 >> 0x10);
  *(char *)(iVar2 + 0x17) = (char)((uint)iVar1 >> 0x18);
  return;
}



void FUN_0004ee60(param_1,param_2)
int param_1;
int param_2;

{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  int *piVar4;
  int iVar5;
  
  piVar4 = (int *)(param_1 + 0x10524);
  param_2 = param_2 * 0x40;
  iVar1 = param_2 + *piVar4;
  piVar3 = (int *)(iVar1 + 0xc);
  if (*piVar3 < *(int *)(iVar1 + 0x1c)) {
    iVar5 = *(int *)(iVar1 + 0x20) + CONCAT13(*(undefined1 *)(iVar1 + 0xf),*(undefined3 *)piVar3);
    *(char *)piVar3 = (char)iVar5;
    *(char *)(iVar1 + 0xd) = (char)((uint)iVar5 >> 8);
    *(char *)(iVar1 + 0xe) = (char)((uint)iVar5 >> 0x10);
    *(char *)(iVar1 + 0xf) = (char)((uint)iVar5 >> 0x18);
    iVar5 = *piVar4;
    iVar1 = *(int *)(param_2 + iVar5 + 0x1c);
    if (*(int *)(param_2 + iVar5 + 0xc) <= iVar1) goto LAB_0004f030;
  }
  else {
    if (*piVar3 <= *(int *)(iVar1 + 0x1c)) goto LAB_0004f030;
    iVar5 = *(int *)(iVar1 + 0xc) - *(int *)(iVar1 + 0x20);
    *(char *)(iVar1 + 0xc) = (char)iVar5;
    *(char *)(iVar1 + 0xd) = (char)((uint)iVar5 >> 8);
    *(char *)(iVar1 + 0xe) = (char)((uint)iVar5 >> 0x10);
    *(char *)(iVar1 + 0xf) = (char)((uint)iVar5 >> 0x18);
    iVar5 = *piVar4;
    iVar1 = *(int *)(param_2 + iVar5 + 0x1c);
    if (iVar1 <= *(int *)(param_2 + iVar5 + 0xc)) goto LAB_0004f030;
  }
  iVar5 = param_2 + iVar5;
  *(char *)(iVar5 + 0xc) = (char)iVar1;
  *(char *)(iVar5 + 0xd) = (char)((uint)iVar1 >> 8);
  *(char *)(iVar5 + 0xe) = (char)((uint)iVar1 >> 0x10);
  *(char *)(iVar5 + 0xf) = (char)((uint)iVar1 >> 0x18);
LAB_0004f030:
  iVar1 = *piVar4;
  uVar2 = Ordinal_2032(*(undefined4 *)(param_2 + iVar1 + 0xc));
  uVar2 = Ordinal_2047(0x4a5a7a65,uVar2);
  param_2 = param_2 + iVar1;
  *(char *)(param_2 + 0x10) = (char)uVar2;
  *(char *)(param_2 + 0x11) = (char)((uint)uVar2 >> 8);
  *(char *)(param_2 + 0x12) = (char)((uint)uVar2 >> 0x10);
  *(char *)(param_2 + 0x13) = (char)((uint)uVar2 >> 0x18);
  return;
}



void FUN_0004f0ac(param_1,param_2)
int param_1;
int param_2;

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  uint uVar5;
  int *piVar6;
  int iVar7;
  
  piVar6 = (int *)(param_1 + 0x10524);
  iVar7 = *piVar6;
  param_2 = param_2 * 0x40;
  iVar1 = param_2 + iVar7;
  iVar3 = (int)((uint)(byte)(&DAT_00086810)[*(int *)(iVar1 + 0x38)] * *(int *)(iVar1 + 0x28)) >> 7;
  if (*(int *)(iVar1 + 0x3c) == 0) {
    uVar2 = Ordinal_2032(*(int *)(iVar1 + 0xc) + iVar3);
    uVar2 = Ordinal_2047(0x4a5a7a65,uVar2);
  }
  else {
    uVar2 = Ordinal_2032(*(int *)(iVar1 + 0xc) - iVar3);
    uVar2 = Ordinal_2047(0x4a5a7a65,uVar2);
  }
  iVar7 = param_2 + iVar7;
  *(char *)(iVar7 + 0x10) = (char)uVar2;
  *(char *)(iVar7 + 0x11) = (char)((uint)uVar2 >> 8);
  *(char *)(iVar7 + 0x12) = (char)((uint)uVar2 >> 0x10);
  *(char *)(iVar7 + 0x13) = (char)((uint)uVar2 >> 0x18);
  iVar3 = param_2 + *piVar6;
  iVar1 = *(int *)(iVar3 + 0x24) + *(int *)(iVar3 + 0x38);
  *(char *)(iVar3 + 0x38) = (char)iVar1;
  *(char *)(iVar3 + 0x39) = (char)((uint)iVar1 >> 8);
  *(char *)(iVar3 + 0x3a) = (char)((uint)iVar1 >> 0x10);
  *(char *)(iVar3 + 0x3b) = (char)((uint)iVar1 >> 0x18);
  iVar3 = param_2 + *piVar6;
  piVar4 = (int *)(iVar3 + 0x38);
  if (0x1f < *piVar4) {
    iVar1 = *piVar4 + -0x20;
    *(char *)piVar4 = (char)iVar1;
    *(char *)(iVar3 + 0x39) = (char)((uint)iVar1 >> 8);
    *(char *)(iVar3 + 0x3a) = (char)((uint)iVar1 >> 0x10);
    *(char *)(iVar3 + 0x3b) = (char)((uint)iVar1 >> 0x18);
    uVar5 = ~*(uint *)(param_2 + *piVar6 + 0x3c);
    param_2 = param_2 + *piVar6;
    *(char *)(param_2 + 0x3c) = (char)uVar5;
    *(char *)(param_2 + 0x3d) = (char)(uVar5 >> 8);
    *(char *)(param_2 + 0x3e) = (char)(uVar5 >> 0x10);
    *(char *)(param_2 + 0x3f) = (char)(uVar5 >> 0x18);
  }
  return;
}



void FUN_0004f2f0(param_1,param_2)
int param_1;
int param_2;

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int *piVar5;
  uint uVar6;
  
  piVar5 = (int *)(param_1 + 0x10524);
  param_2 = param_2 * 0x40;
  iVar1 = param_2 + *piVar5;
  iVar2 = (int)((uint)(byte)(&DAT_00086810)[*(int *)(iVar1 + 0x38)] * *(int *)(iVar1 + 0x30)) >> 6;
  iVar4 = *(int *)(iVar1 + 0x14);
  if (*(int *)(iVar1 + 0x3c) == 0) {
    if (0x40 < iVar4 + iVar2) {
      iVar2 = 0x40 - iVar4;
    }
  }
  else if (iVar4 - iVar2 < 0) {
    iVar2 = iVar4;
  }
  iVar4 = iVar4 + iVar2;
  iVar2 = param_2 + *piVar5;
  *(char *)(iVar2 + 0x18) = (char)iVar4;
  *(char *)(iVar2 + 0x19) = (char)((uint)iVar4 >> 8);
  *(char *)(iVar2 + 0x1a) = (char)((uint)iVar4 >> 0x10);
  *(char *)(iVar2 + 0x1b) = (char)((uint)iVar4 >> 0x18);
  iVar2 = param_2 + *piVar5;
  iVar4 = *(int *)(iVar2 + 0x2c) + *(int *)(iVar2 + 0x38);
  *(char *)(iVar2 + 0x38) = (char)iVar4;
  *(char *)(iVar2 + 0x39) = (char)((uint)iVar4 >> 8);
  *(char *)(iVar2 + 0x3a) = (char)((uint)iVar4 >> 0x10);
  *(char *)(iVar2 + 0x3b) = (char)((uint)iVar4 >> 0x18);
  iVar2 = param_2 + *piVar5;
  piVar3 = (int *)(iVar2 + 0x38);
  if (0x1f < *piVar3) {
    iVar4 = *piVar3 + -0x20;
    *(char *)piVar3 = (char)iVar4;
    *(char *)(iVar2 + 0x39) = (char)((uint)iVar4 >> 8);
    *(char *)(iVar2 + 0x3a) = (char)((uint)iVar4 >> 0x10);
    *(char *)(iVar2 + 0x3b) = (char)((uint)iVar4 >> 0x18);
    uVar6 = ~*(uint *)(param_2 + *piVar5 + 0x3c);
    param_2 = param_2 + *piVar5;
    *(char *)(param_2 + 0x3c) = (char)uVar6;
    *(char *)(param_2 + 0x3d) = (char)(uVar6 >> 8);
    *(char *)(param_2 + 0x3e) = (char)(uVar6 >> 0x10);
    *(char *)(param_2 + 0x3f) = (char)(uVar6 >> 0x18);
  }
  return;
}



void FUN_0004f4ec(param_1,param_2)
undefined1 * param_1;
int param_2;

{
  char cVar1;
  int iVar2;
  undefined1 *puVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  iVar5 = 0;
  do {
    iVar4 = 0;
    puVar3 = param_1;
    do {
      cVar1 = (char)iVar4;
      iVar4 = iVar4 + 1;
      iVar6 = cVar1 * iVar5 * param_2;
      if (iVar6 < 0) {
        iVar6 = iVar6 + 0x3f;
      }
      iVar2 = iVar6 >> 6;
      puVar3[4] = (char)iVar2;
      puVar3[5] = (char)((uint)iVar2 >> 8);
      puVar3[6] = (char)((uint)iVar2 >> 0x10);
      puVar3[7] = (char)(iVar6 >> 0x1e);
      puVar3 = puVar3 + 4;
    } while (iVar4 < 0x100);
    iVar5 = iVar5 + 1;
    param_1 = param_1 + 0x400;
  } while (iVar5 < 0x41);
  return;
}



int FUN_0004f560(param_1,param_2,param_3)
undefined4 param_1;
int param_2;
int * param_3;

{
  byte bVar1;
  int iVar2;
  
  iVar2 = *param_3;
  *param_3 = iVar2 + 1;
  bVar1 = *(byte *)(*(int *)(param_2 + 4) + iVar2);
  *param_3 = iVar2 + 2;
  return ((uint)*(byte *)(*(int *)(param_2 + 4) + iVar2 + 1) + (uint)bVar1 * 0x100) * 2;
}



bool FUN_0004f594(param_1,param_2,param_3)
char *param_1;
int param_2;
int param_3;

{
  undefined4 uVar1;
  int iVar2;
  bool bVar3;
  
  iVar2 = param_3 * 0xd + param_1;
  if (*(char *)(iVar2 + 0x10410) != '\0') {
    FUN_0004f748(param_1,param_3);
  }
  bVar3 = *(int *)(param_2 + 0x12) != 0;
  if (bVar3) {
    *(char *)(iVar2 + 0x10410) = '\0';
    *(undefined1 *)(iVar2 + 0x10408) = 0;
    *(undefined1 *)(iVar2 + 0x10409) = 0;
    *(undefined1 *)(iVar2 + 0x1040a) = 0;
    *(undefined1 *)(iVar2 + 0x1040b) = 0;
    uVar1 = *(undefined4 *)(param_2 + 0x12);
    *(char *)(iVar2 + 0x10404) = (char)uVar1;
    *(char *)(iVar2 + 0x10405) = (char)((uint)uVar1 >> 8);
    *(char *)(iVar2 + 0x10406) = (char)((uint)uVar1 >> 0x10);
    *(char *)(iVar2 + 0x10407) = (char)((uint)uVar1 >> 0x18);
    uVar1 = *(undefined4 *)(param_2 + 0x16);
    *(char *)(iVar2 + 0x1040c) = (char)uVar1;
    *(char *)(iVar2 + 0x1040d) = (char)((uint)uVar1 >> 8);
    *(char *)(iVar2 + 0x1040e) = (char)((uint)uVar1 >> 0x10);
    *(char *)(iVar2 + 0x1040f) = (char)((uint)uVar1 >> 0x18);
  }
  return bVar3;
}



undefined4 FUN_0004f6b0(param_1,param_2)
char *param_1;
int param_2;

{
  undefined4 uVar1;
  
  param_1 = param_2 * 0xd + param_1;
  if ((*(int *)(param_1 + 0x10404) == 0) || (0xf < param_2)) {
    uVar1 = 0;
  }
  else {
    *(undefined1 *)(param_1 + 0x10408) = 0;
    *(undefined1 *)(param_1 + 0x10409) = 0;
    *(undefined1 *)(param_1 + 0x1040a) = 0;
    *(undefined1 *)(param_1 + 0x1040b) = 0;
    *(undefined1 *)(param_1 + 0x10410) = 1;
    uVar1 = 1;
  }
  return uVar1;
}



undefined4 FUN_0004f748(param_1,param_2)
char *param_1;
int param_2;

{
  undefined4 uVar1;

  param_1 = param_2 * 0xd + param_1;
  if ((*(int *)(param_1 + 0x10404) == 0) || (0xf < param_2)) {
    uVar1 = 0;
  }
  else {
    *(undefined1 *)(param_1 + 0x10410) = 0;
    *(undefined1 *)(param_1 + 0x10408) = 0;
    uVar1 = 1;
    *(undefined1 *)(param_1 + 0x10409) = 0;
    *(undefined1 *)(param_1 + 0x1040a) = 0;
    *(undefined1 *)(param_1 + 0x1040b) = 0;
  }
  return uVar1;
}



void FUN_0004f7e0()

{
  FUN_0004f7f0();
  register_default_atexit_handler(FUN_0004f828);
  return;
}



void FUN_0004f7f0()

{
  undefined *puVar1;
  int iVar2;
  
  puVar1 = &DAT_00202a58;
  iVar2 = 0x10;
  do {
    init_sound_channel_slot(puVar1);
    iVar2 = iVar2 + -1;
    puVar1 = puVar1 + 0x1a;
  } while (iVar2 != 0);
  return;
}



void FUN_0004f828()

{
  undefined1 *puVar1;
  int iVar2;
  
  iVar2 = 0x10;
  puVar1 = &DAT_00202bf8;
  do {
    puVar1 = puVar1 + -0x1a;
    release_sound_channel_slot(puVar1);
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  return;
}



undefined1 FUN_0004f858(param_1,param_2)
char *param_1;
int param_2;

{
  return *(undefined1 *)(param_2 * 0xd + param_1 + 0x10410);
}



void FUN_0004f874(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  if (param_3 != -1) {
    *(int *)(param_1 + 0x10) = param_3;
  }
  if (param_2 == 0) {
    param_2 = 0;
    if (*(int *)(param_1 + 4) != 0) {
      Ordinal_1094();
      *(undefined4 *)(param_1 + 4) = 0;
    }
  }
  else {
    if (*(int *)(param_1 + 4) != 0) {
      if (*(int *)(param_1 + 0xc) < param_2) {
        iVar2 = *(int *)(param_1 + 0x10);
        if (*(int *)(param_1 + 0x10) == 0) {
          iVar2 = *(int *)(param_1 + 8);
          if (iVar2 < 0) {
            iVar2 = iVar2 + 7;
          }
          iVar2 = iVar2 >> 3;
          bVar6 = SBORROW4(iVar2,4);
          iVar3 = iVar2 + -4;
          bVar5 = iVar2 == 4;
          if (iVar2 < 4) {
            iVar2 = 4;
            iVar4 = param_2;
          }
          else {
            iVar4 = 0x400;
            bVar6 = SBORROW4(iVar2,0x400);
            iVar3 = iVar2 + -0x400;
            bVar5 = iVar2 == 0x400;
          }
          if (!bVar5 && iVar3 < 0 == bVar6) {
            iVar2 = iVar4;
          }
        }
        iVar2 = *(int *)(param_1 + 0xc) + iVar2;
        if (iVar2 <= param_2) {
          iVar2 = param_2;
        }
        iVar3 = Ordinal_1095(iVar2 << 4);
        Ordinal_1044(iVar3,*(undefined4 *)(param_1 + 4),*(int *)(param_1 + 8) << 4);
        FUN_000504c0(iVar3 + *(int *)(param_1 + 8) * 0x10,param_2 - *(int *)(param_1 + 8));
        Ordinal_1094(*(undefined4 *)(param_1 + 4));
        *(int *)(param_1 + 4) = iVar3;
        *(int *)(param_1 + 0xc) = iVar2;
      }
      else {
        iVar2 = *(int *)(param_1 + 8);
        if (iVar2 < param_2) {
          FUN_000504c0(*(int *)(param_1 + 4) + iVar2 * 0x10,param_2 - iVar2);
        }
      }
      goto LAB_0004f994;
    }
    uVar1 = Ordinal_1095(param_2 << 4);
    *(undefined4 *)(param_1 + 4) = uVar1;
    FUN_000504c0(uVar1,param_2);
  }
  *(int *)(param_1 + 0xc) = param_2;
LAB_0004f994:
  *(int *)(param_1 + 8) = param_2;
  return;
}



void FUN_0004f9a0(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  if (param_3 != -1) {
    *(int *)(param_1 + 0x10) = param_3;
  }
  if (param_2 == 0) {
    param_2 = 0;
    if (*(int *)(param_1 + 4) != 0) {
      FUN_000504cc(*(int *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
      Ordinal_1094(*(undefined4 *)(param_1 + 4));
      *(undefined4 *)(param_1 + 4) = 0;
    }
  }
  else {
    iVar4 = *(int *)(param_1 + 4);
    if (iVar4 != 0) {
      if (*(int *)(param_1 + 0xc) < param_2) {
        iVar4 = *(int *)(param_1 + 0x10);
        if (*(int *)(param_1 + 0x10) == 0) {
          iVar4 = *(int *)(param_1 + 8);
          if (iVar4 < 0) {
            iVar4 = iVar4 + 7;
          }
          iVar4 = iVar4 >> 3;
          bVar6 = SBORROW4(iVar4,4);
          iVar2 = iVar4 + -4;
          bVar5 = iVar4 == 4;
          if (iVar4 < 4) {
            iVar4 = 4;
            iVar3 = param_2;
          }
          else {
            iVar3 = 0x400;
            bVar6 = SBORROW4(iVar4,0x400);
            iVar2 = iVar4 + -0x400;
            bVar5 = iVar4 == 0x400;
          }
          if (!bVar5 && iVar2 < 0 == bVar6) {
            iVar4 = iVar3;
          }
        }
        iVar4 = *(int *)(param_1 + 0xc) + iVar4;
        if (iVar4 <= param_2) {
          iVar4 = param_2;
        }
        iVar2 = Ordinal_1095(iVar4 * 0x14);
        Ordinal_1044(iVar2,*(undefined4 *)(param_1 + 4),*(int *)(param_1 + 8) * 0x14);
        FUN_00050604(*(int *)(param_1 + 8) * 0x14 + iVar2,param_2 - *(int *)(param_1 + 8));
        Ordinal_1094(*(undefined4 *)(param_1 + 4));
        *(int *)(param_1 + 4) = iVar2;
        *(int *)(param_1 + 0xc) = iVar4;
      }
      else {
        iVar2 = *(int *)(param_1 + 8);
        if (iVar2 < param_2) {
          FUN_00050604(iVar2 * 0x14 + iVar4,param_2 - iVar2);
        }
        else if (param_2 < iVar2) {
          FUN_000504cc(param_2 * 0x14 + iVar4,iVar2 - param_2);
        }
      }
      goto LAB_0004faec;
    }
    uVar1 = Ordinal_1095(param_2 * 0x14);
    *(undefined4 *)(param_1 + 4) = uVar1;
    FUN_00050604(uVar1,param_2);
  }
  *(int *)(param_1 + 0xc) = param_2;
LAB_0004faec:
  *(int *)(param_1 + 8) = param_2;
  return;
}



void FUN_0004faf4(param_1)
undefined1 * param_1;

{
  *param_1 = 8;
  param_1[1] = 0x30;
  *(undefined4 *)(param_1 + 4) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  param_1[2] = 8;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 8) = 0;
  param_1[3] = 0;
  return;
}



void FUN_0004fb38(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  if (param_3 != -1) {
    *(int *)(param_1 + 0x10) = param_3;
  }
  if (param_2 == 0) {
    param_2 = 0;
    if (*(int *)(param_1 + 4) != 0) {
      Ordinal_1094();
      *(undefined4 *)(param_1 + 4) = 0;
    }
  }
  else {
    if (*(int *)(param_1 + 4) != 0) {
      if (*(int *)(param_1 + 0xc) < param_2) {
        iVar2 = *(int *)(param_1 + 0x10);
        if (*(int *)(param_1 + 0x10) == 0) {
          iVar2 = *(int *)(param_1 + 8);
          if (iVar2 < 0) {
            iVar2 = iVar2 + 7;
          }
          iVar2 = iVar2 >> 3;
          bVar6 = SBORROW4(iVar2,4);
          iVar3 = iVar2 + -4;
          bVar5 = iVar2 == 4;
          if (iVar2 < 4) {
            iVar2 = 4;
            iVar4 = param_2;
          }
          else {
            iVar4 = 0x400;
            bVar6 = SBORROW4(iVar2,0x400);
            iVar3 = iVar2 + -0x400;
            bVar5 = iVar2 == 0x400;
          }
          if (!bVar5 && iVar3 < 0 == bVar6) {
            iVar2 = iVar4;
          }
        }
        iVar2 = *(int *)(param_1 + 0xc) + iVar2;
        if (iVar2 <= param_2) {
          iVar2 = param_2;
        }
        iVar3 = Ordinal_1095(iVar2 << 2);
        Ordinal_1044(iVar3,*(undefined4 *)(param_1 + 4),*(int *)(param_1 + 8) << 2);
        FUN_00050648(iVar3 + *(int *)(param_1 + 8) * 4,param_2 - *(int *)(param_1 + 8));
        Ordinal_1094(*(undefined4 *)(param_1 + 4));
        *(int *)(param_1 + 4) = iVar3;
        *(int *)(param_1 + 0xc) = iVar2;
      }
      else {
        iVar2 = *(int *)(param_1 + 8);
        if (iVar2 < param_2) {
          FUN_00050648(*(int *)(param_1 + 4) + iVar2 * 4,param_2 - iVar2);
        }
      }
      goto LAB_0004fc58;
    }
    uVar1 = Ordinal_1095(param_2 << 2);
    *(undefined4 *)(param_1 + 4) = uVar1;
    FUN_00050648(uVar1,param_2);
  }
  *(int *)(param_1 + 0xc) = param_2;
LAB_0004fc58:
  *(int *)(param_1 + 8) = param_2;
  return;
}



void FUN_0004fc64(param_1)
undefined1 * param_1;

{
  *param_1 = 8;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  if (*(int *)(param_1 + 4) != 0) {
    Ordinal_1094();
  }
  *param_1 = 0x20;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  return;
}



undefined1 *FUN_0004fcd4(param_1,param_2)
undefined1 * param_1;
uint param_2;

{
  *param_1 = 0x20;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  if ((param_2 & 1) != 0) {
    Ordinal_1094(param_1);
  }
  return param_1;
}



void FUN_0004fd18(param_1,param_2)
int param_1;
int param_2;

{
  undefined4 uVar1;
  uint uVar2;
  undefined4 unaff_lr;
  
  if ((*(uint *)(param_2 + 0x14) & 1) == 0) {
    Ordinal_2588(param_2,*(undefined4 *)(param_1 + 8));
  }
  else {
    uVar1 = Ordinal_2142(param_2);
    FUN_0004fb38(param_1,uVar1,0xffffffff);
  }
  uVar2 = *(uint *)(param_2 + 0x14) & 1;
  if (uVar2 == 0) {
    Ordinal_2582();
  }
  else {
    Ordinal_2135(param_2,*(undefined4 *)(param_1 + 4),*(int *)(param_1 + 8) << 2,uVar2,unaff_lr);
  }
  return;
}



void FUN_0004fd68(param_1)
undefined1 * param_1;

{
  *param_1 = 0x38;
  param_1[1] = 0x30;
  *(undefined4 *)(param_1 + 4) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  param_1[2] = 8;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 8) = 0;
  param_1[3] = 0;
  return;
}



void FUN_0004fda4(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  if (param_3 != -1) {
    *(int *)(param_1 + 0x10) = param_3;
  }
  if (param_2 == 0) {
    param_2 = 0;
    if (*(int *)(param_1 + 4) != 0) {
      FUN_00050678(*(int *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
      Ordinal_1094(*(undefined4 *)(param_1 + 4));
      *(undefined4 *)(param_1 + 4) = 0;
    }
  }
  else {
    iVar4 = *(int *)(param_1 + 4);
    if (iVar4 != 0) {
      if (*(int *)(param_1 + 0xc) < param_2) {
        iVar4 = *(int *)(param_1 + 0x10);
        if (*(int *)(param_1 + 0x10) == 0) {
          iVar4 = *(int *)(param_1 + 8);
          if (iVar4 < 0) {
            iVar4 = iVar4 + 7;
          }
          iVar4 = iVar4 >> 3;
          bVar6 = SBORROW4(iVar4,4);
          iVar2 = iVar4 + -4;
          bVar5 = iVar4 == 4;
          if (iVar4 < 4) {
            iVar4 = 4;
            iVar3 = param_2;
          }
          else {
            iVar3 = 0x400;
            bVar6 = SBORROW4(iVar4,0x400);
            iVar2 = iVar4 + -0x400;
            bVar5 = iVar4 == 0x400;
          }
          if (!bVar5 && iVar2 < 0 == bVar6) {
            iVar4 = iVar3;
          }
        }
        iVar4 = *(int *)(param_1 + 0xc) + iVar4;
        if (iVar4 <= param_2) {
          iVar4 = param_2;
        }
        iVar2 = Ordinal_1095(iVar4 * 0x14);
        Ordinal_1044(iVar2,*(undefined4 *)(param_1 + 4),*(int *)(param_1 + 8) * 0x14);
        FUN_000507b8(*(int *)(param_1 + 8) * 0x14 + iVar2,param_2 - *(int *)(param_1 + 8));
        Ordinal_1094(*(undefined4 *)(param_1 + 4));
        *(int *)(param_1 + 4) = iVar2;
        *(int *)(param_1 + 0xc) = iVar4;
      }
      else {
        iVar2 = *(int *)(param_1 + 8);
        if (iVar2 < param_2) {
          FUN_000507b8(iVar2 * 0x14 + iVar4,param_2 - iVar2);
        }
        else if (param_2 < iVar2) {
          FUN_00050678(param_2 * 0x14 + iVar4,iVar2 - param_2);
        }
      }
      goto LAB_0004fef0;
    }
    uVar1 = Ordinal_1095(param_2 * 0x14);
    *(undefined4 *)(param_1 + 4) = uVar1;
    FUN_000507b8(uVar1,param_2);
  }
  *(int *)(param_1 + 0xc) = param_2;
LAB_0004fef0:
  *(int *)(param_1 + 8) = param_2;
  return;
}



void FUN_0004fef8(param_1)
undefined1 * param_1;

{
  *param_1 = 0x38;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  if (*(int *)(param_1 + 4) != 0) {
    FUN_00050678(*(int *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
    Ordinal_1094(*(undefined4 *)(param_1 + 4));
  }
  *param_1 = 0x20;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  return;
}



void FUN_0004ff68(param_1,param_2)
int param_1;
int param_2;

{
  undefined4 uVar1;
  
  if ((*(uint *)(param_2 + 0x14) & 1) == 0) {
    Ordinal_2588(param_2,*(undefined4 *)(param_1 + 8));
  }
  else {
    uVar1 = Ordinal_2142(param_2);
    FUN_0004fda4(param_1,uVar1,0xffffffff);
  }
  FUN_000507fc(param_2,*(undefined4 *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
  return;
}



void FUN_0004ffb8(param_1)
undefined1 * param_1;

{
  *param_1 = 0x50;
  param_1[1] = 0x30;
  *(undefined4 *)(param_1 + 4) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  param_1[2] = 8;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 8) = 0;
  param_1[3] = 0;
  return;
}



void FUN_0004fff4(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  if (param_3 != -1) {
    *(int *)(param_1 + 0x10) = param_3;
  }
  if (param_2 == 0) {
    param_2 = 0;
    if (*(int *)(param_1 + 4) != 0) {
      FUN_00050828(*(int *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
      Ordinal_1094(*(undefined4 *)(param_1 + 4));
      *(undefined4 *)(param_1 + 4) = 0;
    }
  }
  else {
    iVar4 = *(int *)(param_1 + 4);
    if (iVar4 != 0) {
      if (*(int *)(param_1 + 0xc) < param_2) {
        iVar4 = *(int *)(param_1 + 0x10);
        if (*(int *)(param_1 + 0x10) == 0) {
          iVar4 = *(int *)(param_1 + 8);
          if (iVar4 < 0) {
            iVar4 = iVar4 + 7;
          }
          iVar4 = iVar4 >> 3;
          bVar6 = SBORROW4(iVar4,4);
          iVar2 = iVar4 + -4;
          bVar5 = iVar4 == 4;
          if (iVar4 < 4) {
            iVar4 = 4;
            iVar3 = param_2;
          }
          else {
            iVar3 = 0x400;
            bVar6 = SBORROW4(iVar4,0x400);
            iVar2 = iVar4 + -0x400;
            bVar5 = iVar4 == 0x400;
          }
          if (!bVar5 && iVar2 < 0 == bVar6) {
            iVar4 = iVar3;
          }
        }
        iVar4 = *(int *)(param_1 + 0xc) + iVar4;
        if (iVar4 <= param_2) {
          iVar4 = param_2;
        }
        iVar2 = Ordinal_1095(iVar4 * 0x30);
        Ordinal_1044(iVar2,*(undefined4 *)(param_1 + 4),*(int *)(param_1 + 8) * 0x30);
        FUN_00050860(*(int *)(param_1 + 8) * 0x30 + iVar2,param_2 - *(int *)(param_1 + 8));
        Ordinal_1094(*(undefined4 *)(param_1 + 4));
        *(int *)(param_1 + 4) = iVar2;
        *(int *)(param_1 + 0xc) = iVar4;
      }
      else {
        iVar2 = *(int *)(param_1 + 8);
        if (iVar2 < param_2) {
          FUN_00050860(iVar2 * 0x30 + iVar4,param_2 - iVar2);
        }
        else if (param_2 < iVar2) {
          FUN_00050828(param_2 * 0x30 + iVar4,iVar2 - param_2);
        }
      }
      goto LAB_00050140;
    }
    uVar1 = Ordinal_1095(param_2 * 0x30);
    *(undefined4 *)(param_1 + 4) = uVar1;
    FUN_00050860(uVar1,param_2);
  }
  *(int *)(param_1 + 0xc) = param_2;
LAB_00050140:
  *(int *)(param_1 + 8) = param_2;
  return;
}



void FUN_00050148(param_1)
undefined1 * param_1;

{
  *param_1 = 0x50;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  if (*(int *)(param_1 + 4) != 0) {
    FUN_00050828(*(int *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
    Ordinal_1094(*(undefined4 *)(param_1 + 4));
  }
  *param_1 = 0x20;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  return;
}



void FUN_000501b8(param_1,param_2)
int param_1;
int param_2;

{
  undefined4 uVar1;
  
  if ((*(uint *)(param_2 + 0x14) & 1) == 0) {
    Ordinal_2588(param_2,*(undefined4 *)(param_1 + 8));
  }
  else {
    uVar1 = Ordinal_2142(param_2);
    FUN_0004fff4(param_1,uVar1,0xffffffff);
  }
  FUN_000508b0(param_2,*(undefined4 *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
  return;
}



void FUN_00050208(param_1)
undefined1 * param_1;

{
  *param_1 = 0x68;
  param_1[1] = 0x30;
  *(undefined4 *)(param_1 + 4) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  param_1[2] = 8;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 8) = 0;
  param_1[3] = 0;
  return;
}



void FUN_00050244(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  if (param_3 != -1) {
    *(int *)(param_1 + 0x10) = param_3;
  }
  if (param_2 == 0) {
    param_2 = 0;
    if (*(int *)(param_1 + 4) != 0) {
      Ordinal_1094();
      *(undefined4 *)(param_1 + 4) = 0;
    }
  }
  else {
    if (*(int *)(param_1 + 4) != 0) {
      if (*(int *)(param_1 + 0xc) < param_2) {
        iVar2 = *(int *)(param_1 + 0x10);
        if (*(int *)(param_1 + 0x10) == 0) {
          iVar2 = *(int *)(param_1 + 8);
          if (iVar2 < 0) {
            iVar2 = iVar2 + 7;
          }
          iVar2 = iVar2 >> 3;
          bVar6 = SBORROW4(iVar2,4);
          iVar3 = iVar2 + -4;
          bVar5 = iVar2 == 4;
          if (iVar2 < 4) {
            iVar2 = 4;
            iVar4 = param_2;
          }
          else {
            iVar4 = 0x400;
            bVar6 = SBORROW4(iVar2,0x400);
            iVar3 = iVar2 + -0x400;
            bVar5 = iVar2 == 0x400;
          }
          if (!bVar5 && iVar3 < 0 == bVar6) {
            iVar2 = iVar4;
          }
        }
        iVar2 = *(int *)(param_1 + 0xc) + iVar2;
        if (iVar2 <= param_2) {
          iVar2 = param_2;
        }
        iVar3 = Ordinal_1095(iVar2 << 6);
        Ordinal_1044(iVar3,*(undefined4 *)(param_1 + 4),*(int *)(param_1 + 8) << 6);
        FUN_000508dc(iVar3 + *(int *)(param_1 + 8) * 0x40,param_2 - *(int *)(param_1 + 8));
        Ordinal_1094(*(undefined4 *)(param_1 + 4));
        *(int *)(param_1 + 4) = iVar3;
        *(int *)(param_1 + 0xc) = iVar2;
      }
      else {
        iVar2 = *(int *)(param_1 + 8);
        if (iVar2 < param_2) {
          FUN_000508dc(*(int *)(param_1 + 4) + iVar2 * 0x40,param_2 - iVar2);
        }
      }
      goto LAB_00050364;
    }
    uVar1 = Ordinal_1095(param_2 << 6);
    *(undefined4 *)(param_1 + 4) = uVar1;
    FUN_000508dc(uVar1,param_2);
  }
  *(int *)(param_1 + 0xc) = param_2;
LAB_00050364:
  *(int *)(param_1 + 8) = param_2;
  return;
}



void FUN_00050370(param_1)
undefined1 * param_1;

{
  *param_1 = 0x68;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  if (*(int *)(param_1 + 4) != 0) {
    Ordinal_1094();
  }
  *param_1 = 0x20;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  return;
}



void FUN_000503e0(param_1,param_2)
int param_1;
int param_2;

{
  undefined4 uVar1;
  uint uVar2;
  undefined4 unaff_lr;
  
  if ((*(uint *)(param_2 + 0x14) & 1) == 0) {
    Ordinal_2588(param_2,*(undefined4 *)(param_1 + 8));
  }
  else {
    uVar1 = Ordinal_2142(param_2);
    FUN_00050244(param_1,uVar1,0xffffffff);
  }
  uVar2 = *(uint *)(param_2 + 0x14) & 1;
  if (uVar2 == 0) {
    Ordinal_2582();
  }
  else {
    Ordinal_2135(param_2,*(undefined4 *)(param_1 + 4),*(int *)(param_1 + 8) << 6,uVar2,unaff_lr);
  }
  return;
}



undefined4 FUN_00050430(param_1,param_2)
undefined4 param_1;
uint param_2;

{
  FUN_0004fc64();
  if ((param_2 & 1) != 0) {
    Ordinal_1094(param_1);
  }
  return param_1;
}



undefined4 FUN_00050454(param_1,param_2)
undefined4 param_1;
uint param_2;

{
  FUN_0004fef8();
  if ((param_2 & 1) != 0) {
    Ordinal_1094(param_1);
  }
  return param_1;
}



undefined4 FUN_00050478(param_1,param_2)
undefined4 param_1;
uint param_2;

{
  FUN_00050148();
  if ((param_2 & 1) != 0) {
    Ordinal_1094(param_1);
  }
  return param_1;
}



undefined4 FUN_0005049c(param_1,param_2)
undefined4 param_1;
uint param_2;

{
  FUN_00050370();
  if ((param_2 & 1) != 0) {
    Ordinal_1094(param_1);
  }
  return param_1;
}



void FUN_000504c0(param_1,param_2)
undefined4 param_1;
int param_2;

{
  Ordinal_1047(param_1,0,param_2 << 4);
  return;
}



void FUN_000504cc(param_1,param_2)
int param_1;
int param_2;

{
  for (; param_2 != 0; param_2 = param_2 + -1) {
    FUN_000504fc(param_1);
    param_1 = param_1 + 0x14;
  }
  return;
}



void FUN_000504fc(param_1)
undefined1 * param_1;

{
  *param_1 = 0x80;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  if (*(int *)(param_1 + 4) != 0) {
    Ordinal_1094();
  }
  *param_1 = 0x20;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  return;
}



void FUN_0005056c(param_1,param_2)
int param_1;
int param_2;

{
  undefined4 uVar1;
  
  if ((*(uint *)(param_2 + 0x14) & 1) == 0) {
    Ordinal_2588(param_2,*(undefined4 *)(param_1 + 8));
  }
  else {
    uVar1 = Ordinal_2142(param_2);
    FUN_0004f874(param_1,uVar1,0xffffffff);
  }
  FUN_000505e0(param_2,*(undefined4 *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
  return;
}



undefined4 FUN_000505bc(param_1,param_2)
undefined4 param_1;
uint param_2;

{
  FUN_000504fc();
  if ((param_2 & 1) != 0) {
    Ordinal_1094(param_1);
  }
  return param_1;
}



void FUN_000505e0(param_1,param_2,param_3)
int param_1;
undefined4 param_2;
int param_3;

{
  if ((*(uint *)(param_1 + 0x14) & 1) == 0) {
    Ordinal_2582();
  }
  else {
    Ordinal_2135(param_1,param_2,param_3 << 4);
  }
  return;
}



void FUN_00050604(param_1,param_2)
int param_1;
int param_2;

{
  Ordinal_1047(param_1,0,param_2 * 0x14);
  for (; param_2 != 0; param_2 = param_2 + -1) {
    if (param_1 != 0) {
      FUN_0005090c(param_1);
    }
    param_1 = param_1 + 0x14;
  }
  return;
}



void FUN_00050648(param_1,param_2)
undefined4 param_1;
int param_2;

{
  Ordinal_1047(param_1,0,param_2 << 2);
  return;
}



void FUN_00050678(param_1,param_2)
int param_1;
int param_2;

{
  for (; param_2 != 0; param_2 = param_2 + -1) {
    FUN_000506a8(param_1);
    param_1 = param_1 + 0x14;
  }
  return;
}



void FUN_000506a8(param_1)
undefined1 * param_1;

{
  *param_1 = 0x98;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  if (*(int *)(param_1 + 4) != 0) {
    FUN_000504cc(*(int *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
    Ordinal_1094(*(undefined4 *)(param_1 + 4));
  }
  *param_1 = 0x20;
  param_1[1] = 0x30;
  param_1[2] = 8;
  param_1[3] = 0;
  return;
}



void FUN_00050718(param_1,param_2)
int param_1;
int param_2;

{
  undefined4 uVar1;
  
  if ((*(uint *)(param_2 + 0x14) & 1) == 0) {
    Ordinal_2588(param_2,*(undefined4 *)(param_1 + 8));
  }
  else {
    uVar1 = Ordinal_2142(param_2);
    FUN_0004f9a0(param_1,uVar1,0xffffffff);
  }
  FUN_0005078c(param_2,*(undefined4 *)(param_1 + 4),*(undefined4 *)(param_1 + 8));
  return;
}



undefined4 FUN_00050768(param_1,param_2)
undefined4 param_1;
uint param_2;

{
  FUN_000506a8();
  if ((param_2 & 1) != 0) {
    Ordinal_1094(param_1);
  }
  return param_1;
}



void FUN_0005078c(param_1,param_2,param_3)
int param_1;
undefined4 param_2;
int param_3;

{
  if ((*(uint *)(param_1 + 0x14) & 1) == 0) {
    Ordinal_2582();
  }
  else {
    Ordinal_2135(param_1,param_2,param_3 * 0x14);
  }
  return;
}



void FUN_000507b8(param_1,param_2)
int param_1;
int param_2;

{
  Ordinal_1047(param_1,0,param_2 * 0x14);
  for (; param_2 != 0; param_2 = param_2 + -1) {
    if (param_1 != 0) {
      FUN_00050948(param_1);
    }
    param_1 = param_1 + 0x14;
  }
  return;
}



void FUN_000507fc(param_1,param_2,param_3)
int param_1;
undefined4 param_2;
int param_3;

{
  if ((*(uint *)(param_1 + 0x14) & 1) == 0) {
    Ordinal_2582();
  }
  else {
    Ordinal_2135(param_1,param_2,param_3 * 0x14);
  }
  return;
}



void FUN_00050828(param_1,param_2)
int param_1;
int param_2;

{
  for (; param_2 != 0; param_2 = param_2 + -1) {
    Ordinal_218(param_1 + 0x1c);
    Ordinal_297(param_1);
    param_1 = param_1 + 0x30;
  }
  return;
}



void FUN_00050860(param_1,param_2)
int param_1;
int param_2;

{
  Ordinal_1047(param_1,0,param_2 * 0x30);
  for (; param_2 != 0; param_2 = param_2 + -1) {
    if (param_1 != 0) {
      Ordinal_181(param_1);
      Ordinal_47(param_1 + 0x1c);
    }
    param_1 = param_1 + 0x30;
  }
  return;
}



void FUN_000508b0(param_1,param_2,param_3)
int param_1;
undefined4 param_2;
int param_3;

{
  if ((*(uint *)(param_1 + 0x14) & 1) == 0) {
    Ordinal_2582();
  }
  else {
    Ordinal_2135(param_1,param_2,param_3 * 0x30);
  }
  return;
}



void FUN_000508dc(param_1,param_2)
undefined4 param_1;
int param_2;

{
  Ordinal_1047(param_1,0,param_2 << 6);
  return;
}



void FUN_0005090c(param_1)
undefined1 * param_1;

{
  *param_1 = 0x80;
  param_1[1] = 0x30;
  *(undefined4 *)(param_1 + 4) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  param_1[2] = 8;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 8) = 0;
  param_1[3] = 0;
  return;
}



void FUN_00050948(param_1)
undefined1 * param_1;

{
  *param_1 = 0x98;
  param_1[1] = 0x30;
  *(undefined4 *)(param_1 + 4) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  param_1[2] = 8;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 8) = 0;
  param_1[3] = 0;
  return;
}



// was FUN_00050984 -- sample the floor height at one tile corner (type 0 solid -> 0x80)
// PHYSICS: floor height source -- returns the standable height at corner param_1
// of the current tile: 0x80 (= tile top, "no floor / solid") for a rock tile,
// height*8 for flat floor, and interpolated values for slopes/diagonals.
uint collision_sample_floor_height(param_1,param_2)
uint param_1;
undefined4 * param_2;

{
  byte bVar1;
  short sVar2;
  uint uVar3;
  int iVar4;

  iVar4 = (param_1 & 0xff) * 5;
  sVar2 = *(short *)(&DAT_00202c70 + (uint)(byte)(&DAT_00202bf8)[iVar4] * 2);
  *param_2 = 0;
  // PHYSICS: floor height -- (corner height nibble) * 8; refined per shape below
  uVar3 = (int)sVar2 >> 1 & 0x78;
  switch(*(ushort *)(&DAT_00202c70 + (uint)(byte)(&DAT_00202bf8)[iVar4] * 2) & 0xf) {
  case 0:
    uVar3 = 0x80;
    break;
  case 1:
    break;
  case 2:
    if ((byte)(&DAT_00202bf9)[iVar4] <= (byte)(&DAT_00202bfa)[iVar4]) {
LAB_00050a64:
      uVar3 = 0x80;
    }
    goto LAB_00050a68;
  case 3:
    if (6 < (uint)(byte)(&DAT_00202bf9)[iVar4] + (uint)(byte)(&DAT_00202bfa)[iVar4])
    goto LAB_00050a64;
    goto LAB_00050a68;
  case 4:
    if ((uint)(byte)(&DAT_00202bf9)[iVar4] + (uint)(byte)(&DAT_00202bfa)[iVar4] < 8)
    goto LAB_00050a64;
    goto LAB_00050a68;
  case 5:
    if ((byte)(&DAT_00202bfa)[iVar4] <= (byte)(&DAT_00202bf9)[iVar4]) goto LAB_00050a64;
LAB_00050a68:
    *param_2 = 1;
    break;
  case 6:
    bVar1 = (&DAT_00202bfa)[iVar4];
    goto LAB_00050a88;
  case 7:
    bVar1 = (&DAT_00202bfa)[iVar4];
    goto LAB_00050a98;
  case 8:
    bVar1 = (&DAT_00202bf9)[iVar4];
LAB_00050a88:
    uVar3 = (bVar1 & 7) + uVar3;
    break;
  case 9:
    bVar1 = (&DAT_00202bf9)[iVar4];
LAB_00050a98:
    uVar3 = (uVar3 - (bVar1 & 7)) + 7;
  }
  return uVar3;
}



int FUN_00050aa8(param_1,param_2)
ushort param_1;
ushort param_2;

{
  ushort uVar1;
  ushort uVar2;
  int iVar3;
  
  iVar3 = 0;
  uVar2 = DAT_00202c78 & 0xf;
  uVar1 = param_2 & 0xff;
  if (uVar2 == 6) {
LAB_00050b14:
    iVar3 = (int)(short)uVar1;
  }
  else {
    if (uVar2 != 7) {
      uVar1 = param_1 & 0xff;
      if (uVar2 == 8) goto LAB_00050b14;
      if (uVar2 != 9) goto LAB_00050b18;
    }
    iVar3 = 0xff - (short)uVar1;
  }
LAB_00050b18:
  return ((int)(short)DAT_00202c78 & 0xf0U) * 4 + (int)(short)(iVar3 >> 2);
}



bool FUN_00050b30(param_1,param_2)
uint param_1;
uint param_2;

{
  char *iVar1;
  byte bVar2;
  uint uVar3;
  undefined2 uVar4;
  int iVar5;
  int local_20;
  
  bVar2 = collision_sample_floor_height(param_1,&local_20);
  iVar1 = DAT_00202c6c;
  uVar3 = (uint)bVar2;
  if (uVar3 == 0x80) {
    uVar4 = 0x200;
  }
  else if ((int)((param_2 & 0xff) + (int)*(short *)(DAT_00202c6c + 4)) < (int)uVar3) {
    uVar4 = 0x100;
  }
  else if ((int)uVar3 < (int)((int)*(short *)(DAT_00202c6c + 4) - (param_2 & 0xff))) {
    uVar4 = 0x800;
  }
  else {
    uVar4 = (undefined2)
            (8 << ((int)*(short *)(&DAT_00202c70 +
                                  (uint)(byte)(&DAT_00202bf8)[(param_1 & 0xff) * 5] * 2) >> 8 & 3U))
    ;
  }
  iVar5 = (param_1 & 0xff) * 5;
  (&DAT_00202bfb)[iVar5] = (char)uVar4;
  (&DAT_00202bfc)[iVar5] = (char)((ushort)uVar4 >> 8);
  if (*(byte *)(iVar1 + 0x11) < uVar3) {
    *(byte *)(iVar1 + 0x11) = bVar2;
  }
  return local_20 == 0;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* Recovered from UU.exe .data at 0x86878 (28 real bytes, then the
   "\DATA\comobj.dat" string literal). collision_build_height_field's four
   `*(char *)(bVarNN + 0x86878)` derefs are a bare hardcoded original-
   32-bit address -- unmapped on this port, so a keyboard forward step
   (the first thing that ever reached this animated-shade recompute for
   a moving wall) faulted here. The index bytes bVar11..bVar14 stay
   small in practice; pad to 256 with 0 so a wrapped byte reads a
   defined 0 instead of the string bytes the original would have hit. */
static const signed char DAT_00086878_arr[256] = {
  -0x41,-0x40,-0x3f,-1, 0,1,0x3f,0x40, 0x41,0,0,0, 1,-1,-1,1,
  5,4,3,6, 9,2,7,0, 1,0,0,0,
};
#define DAT_00086878_IDX(b) DAT_00086878_arr[(unsigned char)(b)]

/* collision_build_height_field looks at a NEIGHBOR tile's shade value by
   offsetting its own current tile pointer (into the tilemap, the first
   0x4000 bytes of the level arena -- see uw-formats.txt) by a signed
   per-direction step from DAT_00086878_arr. Near the map edge, that
   neighbor can legitimately fall outside the tilemap entirely -- this
   function already guards the analogous case for the CURRENT tile
   (`if (_DAT_00202c34 == NULL) return;`, a few lines up) via
   tilemap_lookup's own bounds check, but had no equivalent guard for
   these neighbor derefs. Confirmed live via ASan: a heap-buffer-overflow
   read 260 bytes before the arena's own start (ushort index -130, i.e.
   DAT_00086878_arr[0]'s -0x41 real, recovered offset) on ordinary
   forward movement near a map edge -- not a data-recovery gap in the
   table (that index's value IS real, recovered data), just a genuinely
   off-map neighbor with nothing stopping the read. Same "no object"-
   style defensive treatment as resolve_object_link's own out-of-range
   guard: skip the neighbor (leave its shade unresolved) instead of
   reading unmapped/unrelated memory. */
ushort collision_neighbor_shade_or_zero(ushort *base, byte idx) {
  ptrdiff_t off = (ptrdiff_t)DAT_00086878_IDX(idx) * 2;
  ushort *p = base + off;
  if ((char *)p < DAT_002029cc || (char *)(p + 1) > DAT_002029cc + 0x4000) {
    return 0;
  }
  return *p;
}



// was FUN_00051320 -- classify the blocked-corner shape of the current
// wall hit (from the DAT_00202bfb corner-flag table) and pick which of
// the 8 candidate octant headings in DAT_000869a8 to deflect toward,
// writing the choice into DAT_00202c6c[0x12]. Called from
// sweep_slide_along_wall.
void resolve_wall_slide_corner()

{
  int uw_ord2005_rem_115 = 0;
  char cVar1;
  byte bVar2;
  int iVar3;
  byte bVar4;
  int extraout_r1;
  short sVar5;
  char *iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  short local_28;
  char local_25;
  
  iVar3 = 0;
  sVar5 = 0;
  local_28 = 0;
  iVar7 = 0;
  iVar6 = 0;
  local_25 = '\0';
  iVar9 = 0;
  do {
    if ((*(ushort *)(&DAT_00202bfb + iVar3 * 5) & 0xf8) == 0) {
      iVar9 = ((int)(char)(&DAT_00086884)[iVar3] + (int)(char)iVar9) * 0x1000000 >> 0x18;
      local_25 = (&DAT_00086884)[iVar3 - 1U & 3] + local_25;
      local_28 = local_28 + 1;
    }
    if ((*(ushort *)(&DAT_00202bfb + iVar3 * 5) & 0x300) != 0) {
      sVar5 = sVar5 + 1;
      iVar6 = ((int)(char)(&DAT_00086884)[iVar3] + (int)(char)iVar6) * 0x1000000 >> 0x18;
      iVar7 = ((int)(char)(&DAT_00086884)[iVar3 - 1U & 3] + (int)(char)iVar7) * 0x1000000 >> 0x18;
    }
    iVar3 = (iVar3 + 1) * 0x1000000 >> 0x18;
  } while (iVar3 < 4);
  iVar3 = (int)sVar5;
  if (iVar3 == 0) {
    *(undefined1 *)(DAT_00202c6c + 0x12) = 9;
    iVar6 = DAT_00202c6c;
    goto switchD_000514e0_default;
  }
  iVar6 = Ordinal_2005(iVar3,(int)(char)iVar6);
  iVar7 = Ordinal_2005(iVar3,(int)(char)iVar7);
  *(undefined *)(DAT_00202c6c + 0x12) = (&DAT_0008688c)[(int)(iVar6) * 3 + iVar7];
  iVar6 = DAT_00202c6c;
  if (iVar3 != 1) goto switchD_000514e0_default;
  bVar2 = *(byte *)(DAT_00202c6c + 0x12);
  uVar8 = (uint)bVar2;
  uw_ord2005_rem_115 = ((int)(uVar8)) % (2);
  if ((uw_ord2005_rem_115 == 0) || (DAT_00202c14 == 0)) goto switchD_000514e0_default;
  switch((uint)(*(byte *)(iVar6 + 7) >> 5) - (1 - uVar8 & 0xff) & 7) {
  case 0:
    break;
  case 1:
    break;
  case 2:
    goto LAB_00051524;
  case 3:
LAB_00051524:
    cVar1 = '\x01';
LAB_000515d8:
    *(byte *)(iVar6 + 0x12) = bVar2 + cVar1 & 7;
    iVar6 = DAT_00202c6c;
    goto switchD_000514e0_default;
  case 4:
    goto LAB_0005152c;
  case 5:
LAB_0005152c:
    uVar8 = (int)(uVar8 - 1) >> 1 & 0xff;
    *(byte *)(iVar6 + 0x12) = bVar2 - 1;
    bVar2 = DAT_00202bf9;
    bVar4 = DAT_00202bfa;
    if (uVar8 != 0) {
      if (uVar8 == 1) {
        bVar4 = 8 - DAT_00202bff;
        bVar2 = DAT_00202bfe;
      }
      else {
        bVar2 = DAT_00202c04;
        bVar4 = DAT_00202c03;
        if (uVar8 != 2) {
          if (uVar8 == 3) {
            bVar2 = 8 - DAT_00202c08;
            bVar4 = DAT_00202c09;
          }
          else {
            bVar2 = (byte)local_28;
            bVar4 = (byte)local_28;
          }
        }
      }
    }
    if (bVar2 < bVar4) {
      *(byte *)(DAT_00202c6c + 0x12) = *(char *)(DAT_00202c6c + 0x12) + 2U & 7;
    }
    iVar6 = DAT_00202c6c;
    if (bVar2 == bVar4) {
      *(char *)(DAT_00202c6c + 0x12) = *(char *)(DAT_00202c6c + 0x12) + '\x01';
      iVar6 = DAT_00202c6c;
    }
    goto switchD_000514e0_default;
  case 6:
    goto LAB_000515d4;
  case 7:
LAB_000515d4:
    cVar1 = -1;
    goto LAB_000515d8;
  default:
    goto switchD_000514e0_default;
  }
  *(undefined1 *)(iVar6 + 0x12) = 9;
  iVar6 = DAT_00202c6c;
switchD_000514e0_default:
  iVar7 = (int)local_28;
  if (iVar7 == 1 || iVar7 == 2) {
    iVar9 = Ordinal_2005(iVar7,(int)(char)iVar9);
    iVar7 = Ordinal_2005(iVar7,(int)local_25);
    *(undefined *)(iVar6 + 0x13) = (&DAT_0008688c)[iVar9 * -3 - iVar7];
  }
  else {
    *(undefined1 *)(iVar6 + 0x13) = 9;
  }
  return;
}



void FUN_00051658(param_1,param_2,param_3,param_4,param_5)
ushort * param_1;
ushort param_2;
char param_3;
char param_4;
int param_5;

{
  undefined1 uVar1;
  ushort uVar2;
  uint uVar3;
  byte bVar4;
  char cVar5;
  undefined *puVar6;
  int iVar7;
  byte bVar8;
  char cVar9;
  char cVar10;
  char cVar11;
  char cVar12;
  int iVar13;
  char *pcVar14;
  bool bVar15;
  char local_40 [16];
  uint local_8;
  
  local_8 = (uint)param_2;
  bVar4 = *(byte *)(DAT_00202c6c + 0x14);
  if (bVar4 < 9) {
    uVar2 = *param_1;
    puVar6 = &DAT_00202c90 + (uVar2 & 0x1ff) * 0xd;
    iVar7 = 0xd;
    pcVar14 = local_40;
    do {
      iVar13 = iVar7 + -1;
      *pcVar14 = *puVar6;
      bVar15 = 0 < iVar7;
      puVar6 = puVar6 + 1;
      iVar7 = iVar13;
      pcVar14 = pcVar14 + 1;
    } while (iVar13 != 0 && bVar15);
    if ((local_40[1] & 7U) == 4) {
      cVar10 = param_3 * '\b';
      cVar9 = param_4 * '\b';
      cVar11 = cVar10 + '\a';
      cVar12 = cVar9 + '\a';
    }
    else {
      cVar10 = (*(byte *)((char *)param_1 + 3) >> 5) + param_3 * '\b';
      cVar9 = (*(byte *)((char *)param_1 + 3) >> 2 & 7) + param_4 * '\b';
      bVar8 = local_40[1] & 7;
      if ((((uVar2 & 0x1c0) == 0x40) && (bVar8 != 0)) && (param_5 != 0)) {
        bVar8 = bVar8 - 1;
      }
      cVar11 = cVar10 + bVar8;
      cVar10 = cVar10 - bVar8;
      cVar12 = cVar9 + bVar8;
      cVar9 = cVar9 - bVar8;
    }
    if (((DAT_00202c20 <= cVar11) && (cVar10 <= DAT_00202c28)) &&
       ((DAT_00202c24 <= cVar12 && (cVar9 <= DAT_00202c2c)))) {
      iVar7 = (uint)bVar4 * 6;
      *(byte *)(DAT_00202c6c + 0x14) = bVar4 + 1;
      bVar4 = (byte)param_1[1] & 0x7f;
      (&DAT_00202c39)[iVar7] = bVar4;
      bVar15 = local_40[0] == '\0';
      cVar5 = bVar4 + local_40[0];
      if (bVar15) {
        local_40[0] = cVar5 + '\x01';
      }
      (&DAT_00202c38)[iVar7] = cVar5;
      if (bVar15) {
        (&DAT_00202c38)[iVar7] = local_40[0];
      }
      uVar3 = local_8 << 6 & 0xffff;
      (&DAT_00202c3a)[iVar7] = (byte)(local_8 << 6) | 9;
      uVar1 = (undefined1)(uVar3 >> 8);
      (&DAT_00202c3b)[iVar7] = uVar1;
      if (((cVar10 <= DAT_00202c18) && (DAT_00202c18 <= cVar11)) &&
         ((cVar9 <= DAT_00202c1c && (DAT_00202c1c <= cVar12)))) {
        (&DAT_00202c3a)[iVar7] = (byte)uVar3 | 0x19;
        (&DAT_00202c3b)[iVar7] = uVar1;
      }
      iVar13 = param_4 * 0x40 + (int)param_3;
      (&DAT_00202c3c)[iVar7] = (char)iVar13;
      (&DAT_00202c3d)[iVar7] = (char)((uint)iVar13 >> 8);
    }
  }
  return;
}



void FUN_00051cf8(param_1)
uint param_1;

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  int iVar7;
  int iVar8;
  
  iVar7 = (param_1 & 0xff) * 6;
  uVar1 = (&DAT_00202c38)[iVar7];
  iVar8 = ((param_1 & 0xff) + 1) * 6;
  uVar2 = (&DAT_00202c39)[iVar7];
  uVar3 = (&DAT_00202c3a)[iVar7];
  uVar4 = (&DAT_00202c3b)[iVar7];
  uVar5 = (&DAT_00202c3c)[iVar7];
  uVar6 = (&DAT_00202c3d)[iVar7];
  (&DAT_00202c38)[iVar7] = (&DAT_00202c38)[iVar8];
  (&DAT_00202c39)[iVar7] = (&DAT_00202c39)[iVar8];
  (&DAT_00202c3a)[iVar7] = (&DAT_00202c3a)[iVar8];
  (&DAT_00202c3b)[iVar7] = (&DAT_00202c3b)[iVar8];
  (&DAT_00202c3c)[iVar7] = (&DAT_00202c3c)[iVar8];
  (&DAT_00202c3d)[iVar7] = (&DAT_00202c3d)[iVar8];
  (&DAT_00202c38)[iVar8] = uVar1;
  (&DAT_00202c39)[iVar8] = uVar2;
  (&DAT_00202c3a)[iVar8] = uVar3;
  (&DAT_00202c3b)[iVar8] = uVar4;
  (&DAT_00202c3c)[iVar8] = uVar5;
  (&DAT_00202c3d)[iVar8] = uVar6;
  return;
}



void FUN_00051dd0()

{
  char cVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  char *iVar5;
  int iVar6;
  int iVar7;
  
  iVar7 = 0;
  cVar1 = *(char *)(DAT_00202c6c + 9);
  uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x14);
  iVar5 = DAT_00202c6c;
  if (uVar2 != 0) {
    do {
      for (iVar3 = uVar2 - 2; iVar3 = iVar3 * 0x1000000 >> 0x18, iVar7 <= iVar3; iVar3 = iVar3 + -1)
      {
        if ((byte)(&DAT_00202c3e)[iVar3 * 6] < (byte)(&DAT_00202c38)[iVar3 * 6]) {
          /* Ghidra dropped the swap index argument: this is an insertion-
             sort pass over up to 255 collision candidates, swapping the
             pair at iVar3/iVar3+1 when out of order. Called with no
             argument, FUN_00051cf8's param_1 read whatever garbage was
             left in the argument register, swapping (and reading/
             writing) an arbitrary 6-byte record pair instead of the
             intended one -- the real data at iVar3 never actually got
             sorted, so the loop's own termination condition kept
             re-triggering: confirmed via `sample` showing 100% of a
             hung process's time stuck in this exact function, walking
             into an obstacle (e.g. standing next to a critter) near
             tile (17,7). Also a wild write whenever the garbage index
             landed outside the real ~255-entry table. */
          FUN_00051cf8(iVar3);
          iVar5 = DAT_00202c6c;
        }
      }
      if (*(short *)(iVar5 + 4) < (short)(ushort)(byte)(&DAT_00202c38)[iVar7 * 6]) break;
      uVar2 = (uint)*(byte *)(iVar5 + 0x14);
      iVar7 = (iVar7 + 1) * 0x1000000 >> 0x18;
    } while (iVar7 < (int)uVar2);
  }
  uVar2 = (uint)*(byte *)(iVar5 + 0x14);
  iVar3 = (int)(char)iVar7;
  iVar6 = iVar3;
  if (iVar3 < (int)uVar2) {
    do {
      for (iVar4 = uVar2 - 2; iVar4 = iVar4 * 0x1000000 >> 0x18, iVar6 <= iVar4; iVar4 = iVar4 + -1)
      {
        if ((byte)(&DAT_00202c3f)[iVar4 * 6] < (byte)(&DAT_00202c39)[iVar4 * 6]) {
          /* Same dropped-argument fix as the X-axis sort pass above --
             this is the Y-axis pass, swap index is iVar4. */
          FUN_00051cf8(iVar4);
          iVar5 = DAT_00202c6c;
        }
      }
      uVar2 = (uint)*(byte *)(iVar5 + 0x14);
      iVar6 = (iVar6 + 1) * 0x1000000 >> 0x18;
    } while (iVar6 < (int)uVar2);
  }
  *(char *)(iVar5 + 0x16) = (char)iVar7;
  *(undefined1 *)(DAT_00202c6c + 0x15) = 0;
  uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x15);
  iVar7 = uVar2 + iVar3;
  if (iVar7 < (int)(uint)*(byte *)(DAT_00202c6c + 0x14)) {
    do {
      if ((int)((uint)*(byte *)(DAT_00202c6c + 9) + (int)*(short *)(DAT_00202c6c + 4) +
               (int)(cVar1 == '\0')) <= (int)(uint)(byte)(&DAT_00202c39)[iVar7 * 6]) {
        return;
      }
      *(char *)(DAT_00202c6c + 0x15) = (char)uVar2 + '\x01';
      uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x15);
      iVar7 = uVar2 + iVar3;
    } while (iVar7 < (int)(uint)*(byte *)(DAT_00202c6c + 0x14));
  }
  return;
}



undefined4 FUN_00051fa0(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
short param_1;
short param_2;
undefined2 param_3;
undefined2 param_4;
short param_5;
int param_6;
byte param_7;

{
  byte bVar1;
  char *uVar2;
  undefined4 uVar3;
  ushort *puVar4;
  uint uVar5;
  int iVar6;
  short sVar7;
  uint uVar8;
  /* Was 6 independent locals (local_3c/3a/38/34/33/32) with
     DAT_00202c6c = &local_3c, and every DAT_00202c6c[N] access
     throughout this file (collision_build_height_field,
     collision_corner_flags, collision_height_envelope, etc.) assuming
     they're one contiguous record at their Ghidra-stack-offset-implied
     byte positions (0/2/4/8/9/0xa -- 0x3c-0x3a=2, 0x3a-0x38=2,
     0x38-0x34=4, 0x34-0x33=1, 0x33-0x32=1). That layout only held in
     the original 32-bit ARM binary's own stack frame; as independent
     C locals here, this compiler is free to place them in any order
     with any padding, so nearly every DAT_00202c6c[N] read was
     whatever adjacent stack byte happened to land there instead of the
     intended field -- confirmed via a direct struct dump: param_4 (Y,
     expected at offset 2-3) printed 24, but DAT_00202c6c[2] read back
     8, not 24. This is what fed collision_height_envelope's floor-
     height selection (DAT_00202c30) garbage, causing a discrete
     SHIFT+<dir> step to occasionally place the player's height at a
     wildly wrong value (reported as "ends up at the ceiling"). Same
     "split-symbol cluster" bug class fixed elsewhere this session for
     globals (e.g. DAT_00204880_backing); here as a real backing array
     since these are genuinely local to one call. Sized generously
     (0x20) past the highest offset (0x13) any reader/writer touches. */
  undefined1 local_pos_record[0x20];
#define local_3c (*(undefined2 *)(local_pos_record + 0))
#define local_3a (*(undefined2 *)(local_pos_record + 2))
#define local_38 (*(short *)(local_pos_record + 4))
#define local_34 (local_pos_record[8])
#define local_33 (local_pos_record[9])
#define local_32 (*(short *)(local_pos_record + 0xa))
  int iVar9;

  uVar2 = DAT_00202c6c;
  Ordinal_1047(local_pos_record, 0, sizeof(local_pos_record));
  DAT_00202c6c = local_pos_record;
  local_33 = (&DAT_00202c90)[param_1 * 0xd];
  local_34 = (&DAT_00202c91)[param_1 * 0xd] & 7;
  local_38 = param_5;
  if ((local_33 == 0x80) || ((int)((uint)local_33 + (int)param_5) < 0x80)) {
    uVar8 = (uint)param_7;
    local_3c = param_3;
    local_3a = param_4;
    local_32 = param_2;
    if (getenv("UW_DEBUG_STEPHEIGHT"))
      fprintf(stderr, "[fa0-params] p1=%d p2=%d p3=%d p4=%d p5=%u p6=%d p7=%u local33=%d local34=%d\n",
              (int)param_1, (int)param_2, (int)(short)param_3, (int)(short)param_4,
              (unsigned)param_5, (int)param_6, (unsigned)param_7, (int)local_33, (int)local_34);
    collision_build_height_field(uVar8);
    if (getenv("UW_DEBUG_STEPHEIGHT")) {
      int _i;
      fprintf(stderr, "[fa0-struct]");
      for (_i = 0; _i < 0x14; _i++) fprintf(stderr, " [%x]=%d", _i, (int)(unsigned char)DAT_00202c6c[_i]);
      fprintf(stderr, "\n");
    }
    /* HACK: every offset below this point (0xc, 0xe, 0x10, 0x14, 0x15, 0x16)
       was wrong -- DAT_00202c6c is a real `byte *` (confirmed by its own
       declaration and by collision_build_height_field's/FUN_00050b30's own,
       independently-verified-correct byte-offset arithmetic on the exact
       same pointer, e.g. `DAT_00202c6c + 0xc`/`+ 0xe` for the flags word,
       `+ 0x11` for the max-height sentinel). This block instead used a mix
       of `DAT_00202c6c[N]` bare indices and decimal-vs-hex-confused offsets
       (`+ 10` meaning decimal 10 = 0xa, not the intended 0x14) that don't
       correspond to anything collision_build_height_field actually writes --
       most read either stale zero bytes or, worse, `local_32` (offset 0xa,
       holding this call's own `param_2` -- the door/object's own encoded
       arena slot index, e.g. 1013) reinterpreted as a "how many collision
       candidates" count. Confirmed live (UW_DEBUG_DOOR, chasing "a door
       used a second time re-opens instead of closing"): with the bug, this
       function walked FUN_00051dd0's candidate-sort loop believing there
       were up to 255 real candidates (really just the slot index's own low
       byte), reading far out of bounds through DAT_00202c38/DAT_00202c39
       and returning an essentially arbitrary 0 or 1 that differed per
       door/slot -- which scheduler_advance_effect (the only caller reachable
       from a door's own close swing) uses to decide whether to prematurely
       clear the swing's direction bit. Retyped every access in this block to
       match the real disassembly's own literal byte offsets exactly (fresh
       Ghidra decompile of FUN_00051fa0 @ 0x51fa0), so the real, always-empty
       candidate count at offset 0x14 is what's actually checked -- doors now
       correctly finish their close swing instead of re-opening. */
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[fa0-check] off0xc_0xe=0x%x off0x14=%d param_2(slot)=%d\n",
              (unsigned)(*(ushort *)(DAT_00202c6c + 0xc) | *(ushort *)(DAT_00202c6c + 0xe)),
              (int)(unsigned char)DAT_00202c6c[0x14], (int)param_2);
    if (((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x300) == 0) {
      bVar1 = *(byte *)(DAT_00202c6c + 0x11);
      if ((int)(uVar8 + (int)*(short *)(DAT_00202c6c + 4)) < (int)(uint)bVar1) {
        bVar1 = *(byte *)(DAT_00202c6c + 0x10);
      }
      if (getenv("UW_DEBUG_STEPHEIGHT"))
        fprintf(stderr, "[stepheight] uVar8=%u c6c4=%d c6c10=%d c6c11=%d c6c0xc=%d -> DAT_00202c30=%d cur_z=%d\n",
                uVar8, (int)*(short *)(DAT_00202c6c + 4), (int)*(byte *)(DAT_00202c6c + 0x10),
                (int)*(byte *)(DAT_00202c6c + 0x11), (int)*(short *)(DAT_00202c6c + 0xc),
                (int)bVar1, (int)DAT_00204884);
      DAT_00202c30 = (ushort)bVar1;
      uVar5 = (uint)*(byte *)(DAT_00202c6c + 8);
      if ((uint)(int)(short)(ushort)*(byte *)(DAT_00202c6c + 8) < uVar8) {
        uVar5 = uVar8;
      }
      if ((int)((uint)*(byte *)(DAT_00202c6c + 0x10) + (int)(short)uVar5) < (int)*(short *)(DAT_00202c6c + 4)
         ) {
        DAT_00202c68 = 0x10;
      }
      else {
        DAT_00202c68 = (short)(1 << ((int)*(short *)(DAT_00202c6c + 0xc) & 3U));
      }
      if ((DAT_00202c68 == 0x10) || (uVar3 = 1, param_2 < 0x100)) {
        uVar3 = 0;
      }
      collision_height_envelope(uVar3,1);
      if (getenv("UW_DEBUG_DOOR"))
        fprintf(stderr, "[fa0-check2] after collision_height_envelope: off0x14=%d off0x15=%d off0x16=%d uVar3(envelope_arg)=%d\n",
                (int)(unsigned char)DAT_00202c6c[0x14], (int)(unsigned char)DAT_00202c6c[0x15],
                (int)(unsigned char)DAT_00202c6c[0x16], (int)uVar3);
      if (*(char *)(DAT_00202c6c + 0x14) != '\0') {
        iVar9 = -1;
        sVar7 = -1;
        FUN_00051dd0();
        if (*(char *)(DAT_00202c6c + 0x15) != '\0') {
          DAT_00202c6c = uVar2;
          return 0;
        }
        if ((*(char *)(DAT_00202c6c + 0x14) != '\0') &&
           (iVar6 = 0, '\0' < *(char *)(DAT_00202c6c + 0x16))) {
          do {
            sVar7 = (short)iVar9;
            if ((short)DAT_00202c30 < (short)(ushort)(byte)(&DAT_00202c38)[iVar6 * 6]) {
              sVar7 = (short)iVar6;
              iVar9 = iVar6;
              DAT_00202c30 = (ushort)(byte)(&DAT_00202c38)[iVar6 * 6];
            }
            iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
          } while (iVar6 < *(char *)(DAT_00202c6c + 0x16));
        }
        if (-1 < sVar7) {
          puVar4 = (ushort *)resolve_object_link(&DAT_00202c3a + sVar7 * 6);
          /* Was an unguarded `*puVar4` -- resolve_object_link legitimately
             returns NULL when the candidate slot (&DAT_00202c3a +
             sVar7*6) has no object linked there at all, same class as
             scheduler_add_entry's own already-fixed missing NULL guard
             (swinging at empty air/a wall). Confirmed live: this
             crashed 100% of the time emptying the starting-room sack's
             contents via Use mode -- empty_container_into_world's
             randomized scatter (find_object_placement) lands an item
             on a tile whose best-height candidate slot (sVar7, chosen
             just above) has no object registered, and this was the
             first path to ever dereference that NULL. No object linked
             here means there's nothing to check the "blocks passage"
             flag on, so treat it as NOT blocking (skip the `return 0`)
             rather than crash. */
          if ((puVar4 != (ushort *)0x0) &&
             (((&DAT_00202c93)[(*puVar4 & 0x1ff) * 0xd] & 2) == 0)) {
            DAT_00202c6c = uVar2;
            return 0;
          }
          DAT_00202c68 = 1;
        }
      }
      if ((param_6 != 0) ||
         (((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x800) == 0) ||
         ((int)((int)*(short *)(DAT_00202c6c + 4) - uVar8) <= (int)(short)DAT_00202c30)) {
        DAT_00202c6c = uVar2;
        return 1;
      }
      DAT_00202c6c = uVar2;
      return 0;
    }
  }
  DAT_00202c6c = uVar2;
  return 0;
}
#undef local_3c
#undef local_3a
#undef local_38
#undef local_34
#undef local_33
#undef local_32



// was FUN_000522f0
undefined4 place_object_in_world(param_1,param_2,param_3,param_4,param_5,param_6)
/* param_4 was `int` -- a real object pointer (forwarded to
   find_object_placement, which already declares its own param_1 as `ushort *`)
   truncated to 32 bits on this host. Confirmed live: spawn_new_object now
   actually returns a live pointer instead of always 0 (see its fix),
   and this truncation crashed find_object_placement the first time this
   never-before-exercised path ran with a real object. */
uint param_1;
uint param_2;
undefined4 param_3;
char *param_4;
undefined2 param_5;
int param_6;

{
  int iVar1;
  uint uVar2;
  
  iVar1 = find_object_placement(param_4,param_1,param_2,param_3,param_5);
  if (iVar1 == 0) {
    if ((param_6 == 0) && (iVar1 = roll_object_destroy_chance(10,param_4), iVar1 != 0)) {
      unlink_and_free_object(0,param_4);
      return 0;
    }
    uVar2 = *(ushort *)(param_4 + 2) & 0x3ff;
    *(char *)(param_4 + 2) = (char)uVar2;
    *(byte *)(param_4 + 3) =
         (byte)(uVar2 >> 8) | (byte)(((param_2 & 7 | (param_1 & 0x1fff) << 3) << 10) >> 8);
    /* was folded into `int iVar1` (reused above for unrelated int
       values) -- truncated tilemap_lookup's real `void *` return */
    char *_tile1 = (char *)tilemap_lookup((int)(short)param_1 >> 3,(int)(short)param_2 >> 3);
    object_list_insert_head(_tile1 + 2,param_4);
  }
  return 1;
}



// was FUN_00052450
undefined4 find_object_placement(param_1,param_2,param_3,param_4,param_5)
ushort * param_1;
uint param_2;
uint param_3;
undefined2 param_4;
short param_5;

{
  ushort uVar1;
  undefined4 uVar2;
  byte bVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  char *pTile;  /* was reuse of `iVar5` (int) -- truncated
                   tilemap_lookup's real pointer; iVar5 itself stays int
                   for its other, unrelated uses in this function */

  bVar3 = 0;
  while( true ) {
    if ((bVar3 != 0) || (uVar4 = param_2, uVar6 = param_3, DAT_00202c84 == 0)) {
      iVar5 = (int)(short)(param_5 * 2 + 1);
      /* Was `Ordinal_2005(iVar5,uVar2); ... (int)extraout_r1 ...` (twice)
         -- bare calls whose result was read back via Ghidra's
         extraout_r1 idiom, always uninitialized garbage on this host
         (there's no way to read a second register out of a normal C
         call). Ordinal_2005 is COREDLL's div/mod ordinal
         (divisor,dividend): the quotient is its real C return value,
         but this caller wants the REMAINDER -- confirmed by
         ordinal_stubs.c's own comment on Ordinal_2005 documenting
         exactly this "extraout_r1 reads want the remainder" idiom.
         Compute it directly instead of reading a nonexistent second
         return value: this crashed 100% of the time using Use mode on
         a container (find_object_placement is how try_combine_or_
         stow_object scatters emptied contents onto the ground),
         confirmed live, because uVar4/uVar6 below were built from
         garbage stack memory, sending object placement to a wild
         tile. */
      uVar2 = Ordinal_1053();
      uVar4 = (((int)uVar2 % iVar5) - (int)param_5) + param_2;
      uVar2 = Ordinal_1053();
      uVar6 = (((int)uVar2 % iVar5) - (int)param_5) + param_3;
    }
    uVar2 = encode_object_slot_index(param_1);
    iVar5 = FUN_00051fa0(*param_1 & 0x1ff,uVar2,uVar4,uVar6,param_4,1,0);
    if (iVar5 != 0) break;
    bVar3 = bVar3 + 1;
    if (0x17 < bVar3) {
      return 0;
    }
  }
  pTile = (char *)tilemap_lookup((int)uVar4 >> 3,(int)uVar6 >> 3);
  uVar1 = param_1[1];
  bVar3 = (byte)(uVar1 & 0x3ff);
  *(byte *)(param_1 + 1) = (bVar3 ^ (byte)param_4) & 0x7f ^ bVar3;
  *(byte *)((char *)param_1 + 3) =
       (byte)((uVar1 & 0x3ff) >> 8) | (byte)(((uVar6 & 7 | (uVar4 & 0x1fff) << 3) << 10) >> 8);
  object_list_append_tail(pTile + 2,param_1);
  iVar5 = object_ptr_in_arena(param_1);
  if (iVar5 == 0) {
    settle_dropped_object(param_1,(int)uVar4 >> 3,(int)uVar6 >> 3,1);
  }
  else {
    uVar4 = ((int)(short)((ushort)uVar4 & 0x1f8) >> 3) << 6 |
            (int)(((int)(short)uVar6 & 0x1f8U) << 0x10) >> 0x13;
    *(byte *)(param_1 + 0xb) = (byte)param_1[0xb] & 0xf | (byte)(uVar4 << 4);
    *(char *)((char *)param_1 + 0x17) = (char)(uVar4 >> 4);
  }
  return 1;
}



undefined4 FUN_00052674()

{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  undefined *puVar6;
  char *pcVar7;
  byte local_144 [2];
  undefined1 auStack_142 [6];
  code *local_13c [8];
  char acStack_11c [260];
  
  iVar5 = 0;
  local_13c[3] = (code *)0x0;
  local_13c[0] = load_armor_variant_tables;
  local_13c[4] = (code *)0x0;
  local_13c[1] = load_monster_combat_stats;
  local_13c[5] = (code *)0x0;
  local_13c[2] = load_light_food_effect_tables;
  local_13c[6] = (code *)&load_class6_variant_effect_table;
  local_13c[7] = (code *)&load_class7_variant_effect_table;
  Ordinal_1047(acStack_11c,0,0x104);
  pcVar7 = &DAT_0023cca8;
    stack0xffdc323c_ptr = stack0xffdc323c_buf;
  pcVar2 = pcVar7;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_11c,s__DATA_objects_dat_000868a8);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 == -1) {
    uVar4 = 0x3005;
  }
  else {
    read_file_handle(iVar3,auStack_142,2);
    do {
      if (local_13c[iVar5] != (code *)0x0) {
        (*local_13c[iVar5])(iVar3);
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 8);
    Ordinal_553(iVar3);
    Ordinal_1047(acStack_11c,0,0x104);
    do {
      cVar1 = *pcVar7;
      *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar1 != '\0');
    Ordinal_1063(acStack_11c,s__DATA_comobj_dat_00086894);
    iVar5 = open_file_for_read(acStack_11c);
    if (iVar5 == -1) {
      uVar4 = 0x3006;
    }
    else {
      read_file_handle(iVar5,auStack_142,2);
      puVar6 = &DAT_00202c90;
      iVar3 = 0x200;
      do {
        read_file_handle(iVar5,puVar6,3);
        read_file_handle(iVar5,puVar6 + 3,1);
        read_file_handle(iVar5,puVar6 + 5,2);
        read_file_handle(iVar5,puVar6 + 7,2);
        read_file_handle(iVar5,puVar6 + 9,1);
        read_file_handle(iVar5,local_144,1);
        puVar6[10] = ((puVar6[10] ^ local_144[0]) & 3 ^ puVar6[10] ^ local_144[0]) & 3 ^
                     local_144[0];
        read_file_handle(iVar5,puVar6 + 0xb,1);
        iVar3 = iVar3 + -1;
        puVar6 = puVar6 + 0xd;
      } while (iVar3 != 0);
      Ordinal_553(iVar5);
      uVar4 = 0;
    }
  }
  return uVar4;
}



/* Was `undefined4` -- same 64-bit-pointer-truncated-through-a-32-bit-
   return-type bug as get_equipped_item_at_slot's (see its own comment): this
   function returns a POINTER into one of the runtime tables class2_variant_effect_table_lookup
   and friends compute, and on a 64-bit build `undefined4` silently drops
   the pointer's upper 32 bits, handing the caller a wild address. */
void *get_scanned_object_class_effect_ptr()

{
  undefined1 *local_24 [4];
  undefined1 *local_14;
  undefined1 *local_10;
  undefined1 *local_c;
  undefined1 *local_8;
  
  local_24[0] = &class0_variant_effect_table_lookup;
  local_24[1] = &class1_variant_effect_table_lookup;
  local_24[2] = &class2_variant_effect_table_lookup;
  local_24[3] = &LAB_0007913c;
  local_14 = &LAB_00073b10;
  local_10 = &LAB_0006b3d4;
  local_c = &class6_variant_effect_table_lookup;
  local_8 = &class7_variant_effect_table_lookup;
  /* Was `(*(code *)local_24[...])(); return 0;` -- Ghidra couldn't trace
     a return value through the indirect call and fabricated a "return 0"
     placeholder. Real disassembly (0x52928-0x52938) shows no instruction
     sets r0 before the epilogue -- whatever the dispatched per-class
     handler leaves in r0 IS this function's real return value. Every
     caller relies on that (e.g. refresh_player_equipment_effects's light-scan loop:
     `iVar7 = get_scanned_object_class_effect_ptr(); bVar1 = *(byte*)(iVar7+1);` -- with the
     hardcoded 0 this dereferenced address 1 and crashed the moment a
     real light source was actually found by the scan). */
  return (*(void *(*)())local_24[(short)((*g_scratch_object_ptr & 0x1c0) >> 6)])();
}



undefined4 FUN_00052af4(param_1,param_2)
char *param_1;  /* was `int` -- truncated the real object-record pointer
                   (dereferenced throughout this function via casts, and
                   passed to resolve_object_link/itself), latent until
                   those calls started actually using their arguments */
codeval * param_2;

{
  int iVar1;
  char *pcVar2;

  /* Dropped argument (both call sites below): param_2 is a callback
     (FUN_00052bac at every call site reached so far) that declares one
     parameter -- the object/link being tested, i.e. this function's
     own param_1 -- but was invoked bare, leaving FUN_00052bac's own
     param_1 as leftover-register garbage. Same idiom as this whole
     session's other dropped-argument fixes; confirmed live
     (UW_DEBUG_INV + demo_dropback_test.txt) crashing in FUN_00052bac's
     first dereference the moment this never-before-exercised
     drop-into-world path actually ran. */
  iVar1 = (*param_2)(param_1);
  while( true ) {
    if (iVar1 != 0) {
      return 1;
    }
    if (((*(byte *)(param_1 + 1) & 0x80) == 0) && ((*(ushort *)(param_1 + 6) & 0xffc0) != 0)) {
      /* Was `undefined4 uVar2` -- truncated resolve_object_link's real
         pointer return before forwarding it into the recursive call
         just below, same class as param_1 itself above. */
      pcVar2 = (char *)resolve_object_link((ushort *)(param_1 + 6)); /* confirmed via ARM disassembly, 0x52b54 */
      iVar1 = FUN_00052af4(pcVar2,param_2);
      if (iVar1 != 0) {
        return 1;
      }
    }
    if ((*(ushort *)(param_1 + 4) & 0xffc0) == 0) break;
    param_1 = (char *)resolve_object_link((ushort *)(param_1 + 4)); /* confirmed via ARM disassembly, 0x52b84 */
    iVar1 = (*param_2)(param_1);
  }
  return 0;
}



undefined4 FUN_00052bac(param_1)
ushort * param_1;

{
  ushort uVar1;
  undefined4 uVar2;
  short sVar3;
  int iVar4;
  
  uVar1 = *param_1;
  if ((uVar1 & 0x2000) == 0) {
    if (((uVar1 & 0x8000) == 0) || ((param_1[3] & 0x8000) != 0)) {
      sVar3 = 0;
    }
    else {
      sVar3 = (param_1[3] >> 6) - 1;
    }
    iVar4 = (int)sVar3;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 1;
    }
    uVar2 = 1;
    if ((int)(((byte)(&DAT_00202c9a)[(uVar1 & 0x1ff) * 0xd] >> 2 & 0xf) + (iVar4 >> 1)) <=
        (int)DAT_002046b0) {
      uVar2 = 0;
    }
  }
  else {
    uVar2 = 1;
  }
  return uVar2;
}



undefined4 FUN_00052d24(param_1,param_2)
undefined4 param_1;
ushort * param_2;

{
  undefined4 uVar1;
  
  if ((*param_2 & 0xffc0) != 0) {
    uVar1 = resolve_object_link(param_2);
    roll_object_destroy_chance(param_1,uVar1);
  }
  return 0;
}



void FUN_00052d68(param_1,param_2)
undefined4 param_1;
short param_2;

{
  uint uVar1;
  ushort uVar2;
  ushort uVar3;
  int iVar4;
  undefined4 uVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  char *iVar9;
  int iVar10;
  ushort local_3c [2];
  int local_38;
  int local_34;
  int local_30;
  
  iVar10 = 0;
  iVar7 = 0;
  uVar2 = *(ushort *)((char *)g_player_object + 0x16);
  local_38 = (int)(short)(uVar2 >> 10);
  local_30 = 10 - (short)param_1;
  iVar9 = DAT_002029cc;
  do {
    uVar6 = (short)((uVar2 & 0x3f0) >> 4) - iVar7;
    uVar1 = (int)uVar6 >> 0x1f;
    local_34 = (int)(short)(((uVar6 ^ uVar1) - uVar1) * 0x10000 >> 0x10);
    iVar8 = 0;
    do {
      uVar1 = local_38 - iVar8 >> 0x1f;
      if (local_30 < (int)(local_34 + ((local_38 - iVar8 ^ uVar1) - uVar1))) {
        for (local_3c[0] = *(ushort *)(iVar9 + 2); (local_3c[0] & 0xffc0) != 0;
            local_3c[0] = local_3c[0] & 0x3f | uVar3 & 0xffc0) {
          iVar4 = resolve_object_link(local_3c);
          uVar3 = *(ushort *)(iVar4 + 4);
          iVar4 = FUN_00052d24(param_1,local_3c);
          if (iVar4 != 0) {
            uVar5 = FUN_000535fc(local_3c[0] >> 6);
            unlink_and_free_object((ushort *)(iVar9 + 2),uVar5);
            iVar10 = iVar10 + 1;
            if ((int)param_2 <= iVar10 * 0x10000 >> 0x10) {
              return;
            }
          }
        }
      }
      iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      iVar9 = iVar9 + 4;
    } while (iVar8 < 0x40);
    iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
  } while (iVar7 < 0x40);
  return;
}



// was FUN_00053334 -- despite the name this settled on, it's a DESTROY
// path, not a placement one: when param_3==0 it rolls
// roll_object_destroy_chance(10, param_2), which (see that function's
// own comment) returns true with ~100% probability under normal
// conditions, then unconditionally unlinks and frees param_2 via
// unlink_and_free_object. Reached by settle_dropped_object whenever an
// object lands somewhere it can't actually rest (floor too high/low,
// blocked corner, etc.) -- confirmed via disassembly this "destroy the
// misplaced object" behavior is genuine original-game logic, not a
// translation bug.
ushort *discard_misplaced_object(param_1,param_2,param_3)
/* Was `int param_1` -- a real object-record pointer (drop_held_object_
   near_player passes pDropTile+2, a resolve_object_link-style address)
   truncated to 32 bits on this 64-bit host, same class as several
   other fixes this session. */
char *param_1;
ushort * param_2;
int param_3;

{
  ushort uVar1;
  int iVar2;
  ushort local_10 [2];

  /* Dropped argument: roll_object_destroy_chance's declared signature takes
     (short, char*) and dereferences its second parameter -- but it was
     called here with only the literal 10, leaving the real argument
     (param_2, the object being placed) as leftover-register garbage.
     Confirmed live (UW_DEBUG_INV + demo_dropback_test.txt): dropping
     an item out of the backpack into the 3D view crashed several
     frames deeper (FUN_00052af4/FUN_00052bac) dereferencing that
     garbage pointer -- this whole collision/placement path had never
     been exercised by any earlier fix or test this session. */
  if ((param_3 != 0) || (iVar2 = roll_object_destroy_chance(10,(char *)param_2), iVar2 != 0)) {
    uVar1 = encode_object_slot_index(param_2);
    local_10[0] = local_10[0] & 0x3f | uVar1 << 6;
    if ((*param_2 & 0x1c0) == 0x1c0) {
      scheduler_remove_entry(uVar1 & 0x3ff);
    }
    if (param_1 == 0) {
      free_linked_object_recursive(local_10);
    }
    else {
      unlink_and_free_object(param_1,param_2);
    }
    param_2 = (ushort *)0x0;
  }
  return param_2;
}



/* The fundamental "object slot index -> record pointer" accessor (70 call
   sites): slots 0-0xff are 0x1b-byte records in the DAT_002046b8 table,
   slots >=0x100 are 8-byte records in the DAT_002046c4 table. Was `int`,
   truncating the real pointer arithmetic below on this 64-bit host --
   many callers already store the result through a pointer-typed local
   (e.g. `puVar4 = (undefined1 *)FUN_000535fc()`), so they got a
   truncated pointer back regardless of their own care. Confirmed as a
   crash source in reset_npc_path_cache (level-load object-table reset). */
void *FUN_000535fc(param_1)
short param_1;

{
  intptr_t iVar1;

  iVar1 = (int)param_1;
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else if (iVar1 < 0) {
    /* No caller has ever legitimately passed a negative slot -- a real
       UW1 level has exactly 1024 object slots (0-0x3ff), 256 static +
       768 mobile -- but nothing bounded the input, and a corrupted/
       garbage caller-side read (e.g. collision_height_envelope reading
       *(short*)(DAT_00202c6c+10) as this slot) can hand one in.
       Confirmed via lldb: this exact case crashed dereferencing the
       resulting wild pointer, reproduced by the same mapped movement
       sequence as resolve_object_link's own bounds fix (12x forward,
       turn, 3x forward, turn, 5x forward). */
    DEBUG(ERR, "[FUN_000535fc] negative slot %d, returning NULL\n", (int)param_1);
    iVar1 = 0;
  }
  else if (iVar1 < 0x100) {
    iVar1 = iVar1 * 0x1b + (intptr_t)DAT_002046b8;
  }
  else if (iVar1 < 0x400) {
    iVar1 = (intptr_t)DAT_002046c4 + (iVar1 + -0x100) * 8;
  }
  else {
    /* >= 1024: past the real 768-slot mobile-object table
       (DAT_002046c4..+0x1800) -- same corrupted/out-of-range slot class
       as the negative case above. */
    DEBUG(ERR, "[FUN_000535fc] slot %d exceeds 0x3ff, returning NULL\n", (int)param_1);
    iVar1 = 0;
  }
  return (void *)iVar1;
}



int FUN_00053644(param_1,param_2,param_3)
ushort * param_1;
undefined4 param_2;
undefined4 param_3;

{
  ushort *puVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  
  if ((*param_1 & 0xffc0) == 0) {
LAB_00053720:
    iVar4 = 0;
    puVar1 = DAT_002046b4;
  }
  else {
    DAT_002046b4 = param_1;
    iVar3 = resolve_object_link(param_1);
    while ((sVar2 = encode_object_slot_index(), iVar4 = iVar3, puVar1 = param_1, sVar2 != (short)param_3 &&
           ((((*(byte *)(iVar3 + 1) & 0x80) != 0 || ((*(ushort *)(iVar3 + 6) & 0xffc0) == 0)) ||
            (iVar4 = FUN_00053644((ushort *)(iVar3 + 6),param_2,param_3), puVar1 = DAT_002046b4,
            iVar4 == 0))))) {
      if ((*(ushort *)(iVar3 + 4) & 0xffc0) == 0) goto LAB_00053720;
      iVar3 = resolve_object_link((ushort *)(iVar3 + 4));
    }
  }
  DAT_002046b4 = puVar1;
  return iVar4;
}



// was FUN_00053728
undefined4 object_ptr_in_arena(param_1)
char *param_1;

{
  undefined4 uVar1;
  
  if ((param_1 == 0) || (uVar1 = 1, DAT_002046c4 <= param_1)) {
    uVar1 = 0;
  }
  return uVar1;
}



// was active_mobile_list_add
void active_mobile_list_add(param_1)
undefined1 param_1;

{
  *DAT_002046c8 = param_1;
  DAT_002046c8 = DAT_002046c8 + 1;
  return;
}



// was active_mobile_list_remove
void active_mobile_list_remove(param_1)
char param_1;

{
  char *pcVar1;
  
  pcVar1 = DAT_002046c0;
  while( true ) {
    if (DAT_002046c8 <= pcVar1) {
      return;
    }
    if (*pcVar1 == param_1) break;
    pcVar1 = pcVar1 + 1;
  }
  DAT_002046c8 = DAT_002046c8 + -1;
  if (DAT_002046c8 <= pcVar1) {
    return;
  }
  *pcVar1 = *DAT_002046c8;
  return;
}



/* param_1 was `undefined4 *`, so `resolve_object_link(*param_1)` and
   `*param_1 = local_28` truncated the 64-bit object-list pointer the
   callers hand in by address (crashing e.g. a right-click "look" at the
   spawn-room sack: trigger_object_trap_or_use_action -> here -> resolve_object_link(garbage)).
   It's a pointer-to-pointer -- ushort **. */
ushort *FUN_000537d0(param_1,param_2,param_3,param_4,param_5)
ushort ** param_1;
int param_2;
undefined4 param_3;
undefined4 param_4;
short param_5;

{
  ushort *puVar1;
  ushort *puVar2;
  uint uVar3;
  ushort *local_28;
  
  puVar1 = (ushort *)resolve_object_link(*param_1);
  if (puVar1 != (ushort *)0x0) {
    do {
      if ((((int)(short)param_3 == 0xffffffff) ||
          (uVar3 = (uint)*puVar1, (*puVar1 >> 6 & 7) == (int)(short)param_3)) &&
         (((int)(short)param_4 == 0xffffffff ||
          (uVar3 = (uint)*puVar1, (*puVar1 >> 4 & 3) == (int)(short)param_4)))) {
        if ((int)param_5 == 0xffffffff) {
          return puVar1;
        }
        uVar3 = (uint)*puVar1;
        if ((uVar3 & 0xf) == (int)param_5) {
          return puVar1;
        }
      }
      if ((((param_2 != 0) && ((uVar3 & 0x8000) == 0)) && ((puVar1[3] & 0xffc0) != 0)) &&
         (local_28 = puVar1 + 3,
         puVar2 = (ushort *)FUN_000537d0(&local_28,param_2,param_3,param_4,param_5),
         puVar2 != (ushort *)0x0)) {
        *param_1 = local_28;
        return puVar2;
      }
      puVar1 = (ushort *)resolve_object_link(puVar1 + 2);
    } while (puVar1 != (ushort *)0x0);
  }
  return (ushort *)0x0;
}



undefined4 FUN_00053920(param_1,param_2)
ushort * param_1;
ushort param_2;

{
  undefined4 uVar1;
  int iVar2;
  ushort *local_8;
  
  if ((*param_1 & 0x1ff) == (int)(short)param_2) {
    uVar1 = 1;
  }
  else {
    if ((*param_1 & 0x8000) == 0) {
      local_8 = param_1 + 3;
      iVar2 = FUN_000537d0(&local_8,1,(int)(short)param_2 >> 6,(short)param_2 >> 4 & 3,param_2 & 0xf
                          );
      if (iVar2 != 0) {
        return 1;
      }
    }
    uVar1 = 0;
  }
  return uVar1;
}



int FUN_000539b0(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
undefined2 param_3;
short * param_4;
short * param_5;

{
  short sVar1;
  int iVar2;
  int iVar3;
  ushort *local_24;
  
  if (0x3f < *param_4) {
    *param_4 = 0;
    *param_5 = *param_5 + 1;
  }
  iVar2 = (int)*param_5;
  iVar3 = DAT_002029cc + ((int)*param_4 + iVar2 * 0x40) * 4;
  do {
    if (0x3f < iVar2) {
      return 0;
    }
    if (*param_4 < 0x40) {
      do {
        local_24 = (ushort *)(iVar3 + 2);
        if (((*local_24 & 0xffc0) != 0) &&
           (iVar2 = FUN_000537d0(&local_24,1,param_1,param_2,param_3), iVar2 != 0)) {
          return iVar2;
        }
        sVar1 = *param_4;
        iVar3 = iVar3 + 4;
        *param_4 = (short)(sVar1 + 1);
      } while ((sVar1 + 1) * 0x10000 >> 0x10 < 0x40);
    }
    *param_4 = 0;
    sVar1 = *param_5;
    *param_5 = (short)(sVar1 + 1);
    iVar2 = (sVar1 + 1) * 0x10000 >> 0x10;
  } while( true );
}



undefined4 FUN_00053ab0(param_1)
short * param_1;

{
  short sVar1;
  ushort uVar2;
  undefined1 *puVar3;
  short sVar4;
  uint uVar5;
  int iVar6;
  
  uVar5 = (uint)*(ushort *)(DAT_00086df8 + *param_1 * 2 + 0x3e);
  if (((uVar5 & 0xf) == 1) && (((uVar5 & 0xf0) == 0x30 || ((uVar5 & 0xf0) == 0x50)))) {
    iVar6 = (uVar5 & 0xff00) + 0x21;
    puVar3 = (undefined1 *)(DAT_00086df8 + (*param_1 + 0x1f) * 2);
    *puVar3 = (char)iVar6;
    puVar3[1] = (char)((uint)iVar6 >> 8);
    sVar4 = *(byte *)(DAT_00086df8 + *param_1 * 2 + 0x3e) + 0x100;
    puVar3 = (undefined1 *)(DAT_00086df8 + (*param_1 + 0x1f) * 2);
  }
  else {
    if (((uVar5 & 0xf) == 0xb) && ((uVar5 & 0xf0) == 0x10)) {
      set_view_subject_by_command(1);
    }
    if ((*(byte *)(DAT_00086df8 + *param_1 * 2 + 0x3e) & 0xf) == 1) {
      DAT_000858a0 = 1;
    }
    uVar5 = (uint)*(ushort *)(DAT_00086df8 + 0x5f);
    uVar5 = ((uVar5 & 0xffc0) - 1 ^ uVar5) & 0x3c0 ^ uVar5;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
    sVar4 = *param_1;
    uVar2 = *(ushort *)(DAT_00086df8 + 0x5f);
    sVar1 = (short)((uint)((sVar4 + -1) * 0x10000) >> 0x10);
    *param_1 = sVar1;
    if ((int)(uVar2 >> 6 & 0xf) <= (int)sVar4) {
      return 1;
    }
    puVar3 = (undefined1 *)(DAT_00086df8 + (sVar1 + 0x20) * 2);
    sVar4 = *(short *)(DAT_00086df8 + (*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf) * 2 + 0x3e);
  }
  *puVar3 = (char)sVar4;
  puVar3[1] = (char)((ushort)sVar4 >> 8);
  return 1;
}



void FUN_00053c74()

{
  int uw_ord2005_rem_116 = 0; int uw_ord2005_rem_117 = 0;
  byte bVar1;
  char cVar2;
  ushort uVar3;
  ushort uVar4;
  short sVar5;
  uint uVar6;
  int extraout_r1;
  int extraout_r1_00;
  int iVar7;
  undefined1 *puVar8;
  int iVar9;
  char *iVar10;
  short local_20 [2];
  
  iVar7 = 0;
  iVar10 = 0;
  local_20[0] = 0;
  uVar6 = DAT_002046d0 + 1;
  DAT_002046d0 = (byte)uVar6;
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) != 0) {
    do {
      uVar3 = *(ushort *)(DAT_00086df8 + (short)iVar7 * 2 + 0x3e);
      uVar4 = uVar3 >> 8;
      if (uVar4 == 1) {
        iVar10 = FUN_00053ab0(local_20);
      }
      else {
        iVar9 = (uVar3 & 0xff) + (uVar4 + 0xff) * 0x100;
        puVar8 = (undefined1 *)(DAT_00086df8 + ((short)iVar7 + 0x1f) * 2);
        *puVar8 = (char)iVar9;
        puVar8[1] = (char)((uint)iVar9 >> 8);
      }
      iVar7 = local_20[0] + 1;
      local_20[0] = (short)iVar7;
    } while (iVar7 * 0x10000 >> 0x10 < (int)(*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf));
    uVar6 = (uint)DAT_002046d0;
  }
  iVar7 = FUN_0005404c(1,uVar6);
  puVar8 = (undefined1 *)(DAT_00086df8 + 0x62);
  if (iVar7 != 0) {
    iVar10 = 1;
  }
  bVar1 = *(byte *)(DAT_00086df8 + 0x61);
  if ((bVar1 & 0xc) != 0) {
    *(byte *)(DAT_00086df8 + 0x61) = ((bVar1 & 0xfc) - 1 ^ bVar1) & 0xc ^ bVar1;
    *(undefined1 *)(DAT_00086df8 + 0x62) = *puVar8;
    if ((*(byte *)(DAT_00086df8 + 0x61) & 0xc) == 0) {
      iVar10 = 1;
    }
  }
  if (iVar10 != 0) {
    refresh_player_equipment_effects();
    set_pending_update_flags(2);
  }
  if (DAT_002046cc != 0) {
    if ((DAT_002046cc & 1) != 0) {
      adjust_player_hp(g_player_object,0xffffffff);
    }
    if ((DAT_002046cc & 2) != 0) {
      adjust_level7_hazard_value(g_player_object,0xffffffff);
    }
  }
  if (0x50 < *(byte *)(DAT_00086df8 + 0xb9)) {
    FUN_000541d0();
  }
  iVar10 = DAT_00086df8;
  uw_ord2005_rem_116 = ((int)(DAT_002046d0)) % (3);
  if (uw_ord2005_rem_116 == 0) {
    uVar3 = *(ushort *)(iVar10 + 0x5f);
    if ((uVar3 & 0x3c) != 0) {
      bVar1 = (byte)uVar3;
      *(byte *)(iVar10 + 0x5f) = ((bVar1 & 0xfc) - 1 ^ bVar1) & 0x3c ^ bVar1;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar3 >> 8);
      apply_typed_damage_to_object(g_player_object,0,0,0,(char)((uVar3 & 0x3c) >> 2),0x10);
      iVar10 = DAT_00086df8;
    }
    sVar5 = roll_skill_check(*(undefined1 *)(iVar10 + 0x28),10);
    if (0 < sVar5) {
      adjust_level7_hazard_value(g_player_object,sVar5 * -0x1000000 >> 0x18);
    }
  }
  uw_ord2005_rem_117 = ((int)(DAT_002046d0)) % (0x18);
  if (uw_ord2005_rem_117 == 0) {
    sVar5 = Ordinal_1053();
    adjust_player_hunger(-3 - ((int)sVar5 & 3U));
    uVar6 = (uint)*(ushort *)(DAT_00086df8 + 0x61);
    if ((*(ushort *)(DAT_00086df8 + 0x61) & 0x3f0) != 0) {
      uVar6 = ((uVar6 & 0xfff0) - 1 ^ uVar6) & 0x3f0 ^ uVar6;
      *(char *)(DAT_00086df8 + 0x61) = (char)uVar6;
      *(char *)(DAT_00086df8 + 0x62) = (char)(uVar6 >> 8);
    }
    uVar6 = Ordinal_1053();
    if ((uVar6 & 3) == 0) {
      process_nearby_background_traps(1);
    }
    randomize_active_npc_flags();
    iVar10 = 0;
    local_20[0] = 0;
    do {
      iVar7 = DAT_00086df8 + (short)iVar10;
      cVar2 = *(char *)(iVar7 + 0x3a);
      if (cVar2 != -1) {
        *(char *)(iVar7 + 0x3a) = cVar2 + '\x01';
        iVar10 = (int)local_20[0];
      }
      iVar10 = iVar10 + 1;
      local_20[0] = (short)iVar10;
    } while ((int)(iVar10) * 0x10000 >> 0x10 < 3);
    sVar5 = roll_skill_check(*(undefined1 *)(DAT_0023be74 + 5),0xf);
    if (0 < sVar5) {
      adjust_player_hp(g_player_object,0xffffffff);
    }
    DAT_002046d0 = 0;
  }
  return;
}



undefined4 FUN_0005404c(param_1,param_2)
short param_1;
undefined1 param_2;

{
  char cVar1;
  ushort uVar2;
  ushort uVar3;
  byte bVar4;
  short sVar5;
  ushort *puVar6;
  int extraout_r1;
  uint uVar7;
  ushort uVar8;
  int iVar9;
  undefined4 uVar10;
  
  uVar10 = 0;
  iVar9 = 0;
  do {
    puVar6 = (ushort *)get_equipped_item_at_slot((int)(char)(&g_light_source_slots)[iVar9]);
    if (puVar6 != (ushort *)0x0) {
      uVar2 = *puVar6;
      if (((((uVar2 & 0x1f0) == 0x90) && (uVar7 = (uint)(short)(uVar2 & 0xf), 3 < uVar7)) &&
          (uVar7 < 8)) && (cVar1 = (&g_light_radius_table)[uVar7 * 2], cVar1 != '\0')) {
        Ordinal_2005(cVar1,param_2);
        uVar8 = (ushort)(extraout_r1 == 0);
        if (1 < param_1) {
          sVar5 = Ordinal_2005(cVar1);
          uVar8 = (ushort)(extraout_r1 == 0) + sVar5;
        }
        if ((short)uVar8 != 0) {
          uVar3 = puVar6[2];
          if ((int)(short)uVar8 < (int)(uVar3 & 0x3f)) {
            bVar4 = (byte)uVar3;
            *(byte *)(puVar6 + 2) = (bVar4 - (char)uVar8 ^ bVar4) & 0x3f ^ bVar4;
            *(byte *)((char *)puVar6 + 5) = (byte)(uVar3 >> 8);
          }
          else {
            uVar7 = uVar3 & 0xffc0;
            *(byte *)(puVar6 + 2) = (byte)uVar7;
            *(byte *)((char *)puVar6 + 5) = (byte)(uVar7 >> 8);
            bVar4 = (byte)uVar2;
            *(byte *)puVar6 = (bVar4 - 4 ^ bVar4) & 0xf ^ bVar4;
            *(byte *)((char *)puVar6 + 1) = (byte)(uVar2 >> 8);
            redraw_backpack_slot_widget((int)(char)(&g_light_source_slots)[iVar9]);
            uVar10 = 1;
            set_ambient_bias_without_light(0);
          }
        }
      }
    }
    iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
  } while (iVar9 < 4);
  return uVar10;
}



void FUN_000541d0()

{
  undefined1 uVar1;
  char cVar2;
  char *iVar3;
  
  iVar3 = DAT_00086df8;
  uVar1 = 0;
  if (*(short *)(DAT_00086df8 + 0x4c) != 0) {
    uVar1 = Ordinal_2005(*(short *)(DAT_00086df8 + 0x4c),(uint)*(ushort *)(DAT_00086df8 + 0x4a) << 5
                        );
  }
  iVar3 = roll_skill_check(*(undefined1 *)(iVar3 + 0x34),uVar1);
  if (((short)iVar3 < 1) && (*(byte *)(DAT_00086df8 + 0xb9) < 0x8c)) {
    cVar2 = roll_dice_sum(3 - (int)(iVar3),4);
    *(char *)(DAT_00086df8 + 0xb9) = *(char *)(DAT_00086df8 + 0xb9) + cVar2;
  }
  if (0x78 < *(byte *)(DAT_00086df8 + 0xb9)) {
    iVar3 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x34),uVar1);
    if ((-(int)iVar3 + 2) * 0x10000 >> 0x10 != 0) {
      weapon_overlay_flash_once(0xc6);
      set_pending_update_flags(2);
      uVar1 = roll_dice_sum(2,-(int)iVar3 + 4);
      apply_typed_damage_to_object(g_player_object,0,0,0,uVar1,0);
    }
  }
  return;
}



undefined4 FUN_000542f8(param_1,param_2,param_3)
uint param_1;
uint param_2;
char param_3;

{
  undefined4 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 *puVar4;
  uint uVar5;
  byte local_14;
  
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) == 0xc0) {
    uVar1 = 0;
  }
  else {
    uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf;
    iVar2 = (uint)*(byte *)(DAT_00086df8 + uVar5 * 2 + 0x3f) * 0x100 + (param_2 & 0xff) * 0x10 +
            (param_1 & 0xff);
    puVar4 = (undefined1 *)(DAT_00086df8 + (uVar5 + 0x1f) * 2);
    *puVar4 = (char)iVar2;
    puVar4[1] = (char)((uint)iVar2 >> 8);
    if (param_3 == '\0') {
      uVar5 = roll_dice_sum(2,3);
      uVar5 = uVar5 & 0xff;
    }
    else if (param_3 == '\x01') {
      uVar5 = 1;
    }
    else if (param_3 == '@') {
      uVar5 = roll_dice_sum(2,8);
      uVar5 = (uVar5 & 0xff) + 6;
    }
    else if (param_3 == -0x80) {
      uVar5 = roll_dice_sum(3,0x14);
      uVar5 = (uVar5 & 0xff) + 0x18;
    }
    else {
      uVar5 = (uint)local_14;
    }
    uVar3 = *(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf;
    iVar2 = (uint)*(byte *)(DAT_00086df8 + uVar3 * 2 + 0x3e) + (uVar5 & 0xff) * 0x100;
    puVar4 = (undefined1 *)(DAT_00086df8 + (uVar3 + 0x1f) * 2);
    *puVar4 = (char)iVar2;
    puVar4[1] = (char)((uint)iVar2 >> 8);
    uVar5 = (uint)*(ushort *)(DAT_00086df8 + 0x5f);
    uVar5 = ((uVar5 & 0xffc0) + 0x40 ^ uVar5) & 0x3c0 ^ uVar5;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
    refresh_player_equipment_effects();
    uVar1 = 1;
  }
  return uVar1;
}



undefined4 FUN_0005448c(param_1,param_2)
undefined4 param_1;
int param_2;

{
  undefined2 uVar1;
  short sVar2;
  char *iVar3;
  undefined1 auStack_48 [10];
  undefined2 local_3e;
  undefined2 local_34;
  short local_30;
  undefined1 local_27;
  undefined1 local_26;
  
  if (param_2 != 0) {
    DAT_0010144c = (ushort)DAT_002046d8;
    DAT_00101454 = (ushort)DAT_002046dc;
    build_object_placement_snapshot(param_2,auStack_48);
    iVar3 = DAT_00204874;
    if (local_30 != 0) {
      sVar2 = Ordinal_2005((int)local_30,(int)*(short *)(DAT_00204874 + 0x18) << 6);
      uVar1 = *(undefined2 *)(iVar3 + 0x21);
      if (0x80 < sVar2) {
        sVar2 = 0x80;
      }
      local_27 = (undefined1)uVar1;
      local_26 = (undefined1)((ushort)uVar1 >> 8);
      local_34 = 0xeb;
      DAT_0010144c = (ushort)DAT_002046d8;
      iVar3 = (int)*(short *)(iVar3 + 10) * (int)sVar2;
      DAT_00101454 = (ushort)DAT_002046dc;
      if (iVar3 < 0) {
        iVar3 = iVar3 + 0x3f;
      }
      local_3e = (undefined2)((int)(iVar3) >> 6);
      sync_object_tile_position(param_2,auStack_48);
    }
  }
  return 4;
}



// WARNING: Removing unreachable block (ram,0x00054668)

void FUN_000545ac(param_1,param_2)
byte * param_1;
undefined4 param_2;

{
  byte bVar1;
  undefined1 uVar2;
  short sVar4;
  int iVar5;
  uint uVar6;
  ushort uVar7;
  undefined1 uVar3;
  
  iVar5 = (*param_1 & 0xf) * 3;
  bVar1 = (&DAT_002027d0)[iVar5];
  uVar7 = (ushort)bVar1;
  if ((param_1[0x12] == 1) && ((&DAT_002027d2)[iVar5] == -0x40)) {
    uVar6 = (*(byte *)(DAT_00086df8 + 0x27) + 0x18) * 8;
    sVar4 = roll_skill_check((uint)*(byte *)(DAT_00086df8 + 0x27),10);
    if (sVar4 == -1) {
      uVar6 = uVar6 - 0x80;
    }
    else if (sVar4 == 2) {
      uVar6 = uVar6 + 0xc0;
    }
    uVar7 = (ushort)((uVar6 & 0xffff) * (uint)bVar1 >> 8);
  }
  uVar2 = DAT_002046d8;
  uVar3 = DAT_002046dc;
  if (DAT_002046e8 == 0) {
    uVar2 = DAT_002046e0;
    uVar3 = DAT_002046e4;
  }
  apply_direct_object_hit(param_1[0x12],param_1,param_2,uVar2,uVar3,uVar7,-(&DAT_002027d2)[iVar5]);
  return;
}



undefined4 FUN_000546c4(param_1,param_2)
short param_1;
undefined4 param_2;

{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  ushort *puVar4;
  ushort *puVar5;
  undefined4 uVar7;
  ushort uVar8;
  byte bVar9;
  int iVar10;
  ushort *puVar11;
  uint uVar6;
  
  puVar11 = (ushort *)&DAT_00202c38;
  iVar1 = (int)param_1;
  if (iVar1 != -1) {
    iVar10 = iVar1 * 6;
    uVar2 = *(ushort *)(&DAT_00202c3a + iVar10);
    if ((uVar2 & 0x20) != 0) {
      return 2;
    }
    (&DAT_00202c3a)[iVar10] = (byte)uVar2 | 0x20;
    (&DAT_00202c3b)[iVar10] = (char)(uVar2 >> 8);
  }
  DAT_002046e0 = (byte)(DAT_002049c8 >> 3);
  DAT_002046e4 = (byte)(DAT_002049ca >> 3);
  puVar4 = (ushort *)FUN_000535fc(param_2);
  /* HACK: FUN_000535fc legitimately returns NULL for an out-of-range/
     empty slot (its own established contract, guarded at many other
     call sites this session) and this immediately dereferenced it
     unconditionally. Newly reachable via npc_ai_tick's placement-sweep
     -> movement_collision_sweep -> sweep_collision_flags chain now that
     this session's NPC-AI-cluster byte-scaling fixes let more objects
     take that path for the first time; confirmed live crashing
     (EXC_BAD_ACCESS at `uVar2 = *puVar4`) in several regression demos.
     Match this function's own "nothing to do" early-out (return 2). */
  if (puVar4 == (ushort *)0x0) {
    return 2;
  }
  uVar2 = *puVar4;
  if (iVar1 == -1) {
    puVar11 = (ushort *)0x0;
  }
  if (iVar1 == -1) {
    uVar8 = 0xffff;
    bVar9 = 1;
    puVar5 = puVar11;
  }
  else {
    puVar5 = (ushort *)FUN_000535fc(puVar11[iVar1 * 3 + 1] >> 6);
    /* HACK: same unguarded FUN_000535fc NULL-return case as the
       puVar4 fix just above -- puVar5 is dereferenced (`*puVar5`)
       a few lines down with no check. Same early-out. */
    if (puVar5 == (ushort *)0x0) {
      return 2;
    }
    uVar6 = (uint)DAT_002046e0 + (int)(short)puVar11[iVar1 * 3 + 2] & 0x3f;
    uVar3 = (ushort)uVar6;
    DAT_002046d8 = (byte)uVar6;
    iVar10 = (int)(short)puVar11[iVar1 * 3 + 2] -
             ((int)((uVar6 - (int)(short)(ushort)DAT_002046e0) * 0x10000) >> 0x10);
    if (iVar10 < 0) {
      iVar10 = iVar10 + 0x3f;
    }
    DAT_002046dc = (char)(iVar10 >> 6) + DAT_002046e4 & 0x3f;
    uVar8 = *puVar5 & 0x1ff;
    bVar9 = (&DAT_00202c97)[(short)uVar8 * 0xd] & 1;
    if ((0xff < (short)param_2) || (0x3fff < (puVar11[iVar1 * 3 + 1] & 0xffc0))) goto LAB_000548b8;
    if (((uVar2 & 0x1c0) != 0x40) && ((*(byte *)((char *)puVar4 + 0x15) & 0x80) != 0)) {
      return 2;
    }
    *(byte *)((char *)puVar4 + 0x15) = *(byte *)((char *)puVar4 + 0x15) | 0x80;
  }
  uVar3 = (ushort)DAT_002046d8;
LAB_000548b8:
  if ((short)uVar8 != -1) {
    if (((&DAT_00202c97)[(short)uVar8 * 0xd] & 2) == 0) {
      if ((uVar8 & 0xffc0) == 0x180) {
        uVar7 = resolve_skill_gated_unlock_or_use(puVar4,0,puVar5,0);
        return uVar7;
      }
    }
    else {
      DAT_002020a4 = (ushort)DAT_002046dc;
      DAT_002046e8 = 0;
      DAT_002020a0 = uVar3;
      use_object_on_target(puVar4,puVar5,0);
    }
  }
  if (bVar9 == 0) {
    return 2;
  }
  if (((&DAT_00202c97)[(short)(uVar2 & 0x1ff) * 0xd] & 2) != 0) {
    DAT_002020a0 = (ushort)DAT_002046e0;
    DAT_002020a4 = (ushort)DAT_002046e4;
    DAT_002046e8 = 1;
    use_object_on_target(puVar5,puVar4,0);
    if ((short)DAT_002020a0 < 0) {
      return 0x10;
    }
  }
  uVar7 = FUN_0005448c(puVar4,puVar5);
  return uVar7;
}



// was FUN_00054a00. Fills param_2 (a per-class scratch buffer chosen by
// npc_ai_tick/mobile_object_tick from DAT_00204920/002048c0/002048f0/
// 00204950) with a placement/orientation snapshot derived from param_1's
// current fields -- offsets, class flags, and (for arena-mobile objects)
// speed/step data used by the following collision-sweep + tile-sync
// calls.
void build_object_placement_snapshot(param_1,param_2)
ushort * param_1;
byte * param_2;

{
  ushort uVar1;
  undefined2 uVar2;
  short sVar3;
  uint uVar4;
  int iVar5;
  byte bVar6;
  int iVar7;
  bool bVar8;
  
  bVar8 = true;
  iVar5 = (*param_1 & 0x1ff) * 0xd;
  uVar2 = encode_object_slot_index(param_1);
  param_2[0x23] = (byte)uVar2;
  param_2[0x24] = (byte)((ushort)uVar2 >> 8);
  uVar1 = *(ushort *)(&DAT_00202c91 + iVar5);
  param_2[0x18] = (byte)(uVar1 >> 4);
  param_2[0x19] = (byte)(uVar1 >> 0xc);
  param_2[0x1a] = (byte)(&DAT_00202c97)[iVar5] >> 4 & 1;
  param_2[0x1b] = 0;
  param_2[0x1c] = 0;
  param_2[0x1d] = 0;
  param_2[0x16] = (byte)(*(ushort *)(&DAT_00202c97 + iVar5) >> 5) & 0xf;
  bVar6 = (&DAT_00202c99)[iVar5];
  param_2[0x20] = 0;
  param_2[0x1f] = bVar6;
  uVar1 = param_1[1];
  param_2[0x27] = 0;
  param_2[0x21] = 0;
  param_2[0x22] = (byte)((((int)(short)uVar1 & 0xffffff80U) << 6) >> 8);
  param_2[0x25] = (&DAT_00202c91)[iVar5] & 7;
  param_2[0x26] = (&DAT_00202c90)[iVar5];
  *param_2 = *(byte *)((char *)param_1 + 3) >> 5;
  param_2[1] = 0;
  param_2[2] = (byte)((*(byte *)((char *)param_1 + 3) & 0x1c) >> 2);
  param_2[3] = 0;
  param_2[4] = (byte)param_1[1] & 0x7f;
  param_2[5] = 0;
  if (param_1 < DAT_002046c4) {
    iVar7 = (int)*(short *)param_2 + ((param_1[0xb] & 0xfc00) >> 7);
    *param_2 = (byte)iVar7;
    param_2[1] = (byte)((uint)iVar7 >> 8);
    iVar7 = (int)CONCAT11(param_2[3],param_2[2]) + ((param_1[0xb] & 0x3f0) >> 1);
    param_2[2] = (byte)iVar7;
    param_2[3] = (byte)((uint)iVar7 >> 8);
    bVar6 = *(byte *)((char *)param_1 + 9);
    param_2[0x21] = 0;
    param_2[0x22] = bVar6;
    param_2[0x28] = (byte)(1 << ((byte)((byte)param_1[5] >> 4) & 7));
    iVar7 = ((byte)((byte)param_1[10] >> 3) - 0x10) * 0x40;
    param_2[10] = (byte)iVar7;
    param_2[0xb] = (byte)((uint)iVar7 >> 8);
    iVar7 = (uint)(*(byte *)((char *)param_1 + 0x13) >> 7) * -4;
    param_2[0x10] = (byte)iVar7;
    param_2[0x11] = (byte)((uint)iVar7 >> 8);
    param_2[0x1e] = (byte)param_1[4];
    bVar8 = (*param_1 & 0x1c0) == 0x40;
    if (!bVar8) {
      uVar2 = *(undefined2 *)((char *)param_1 + 0xb);
      *param_2 = (byte)uVar2;
      param_2[1] = (byte)((ushort)uVar2 >> 8);
      uVar2 = *(undefined2 *)((char *)param_1 + 0xd);
      param_2[2] = (byte)uVar2;
      param_2[3] = (byte)((ushort)uVar2 >> 8);
      uVar2 = *(undefined2 *)((char *)param_1 + 0xf);
      param_2[4] = (byte)uVar2;
      param_2[5] = (byte)((ushort)uVar2 >> 8);
    }
    uVar4 = *(byte *)((char *)param_1 + 0x13) & 0x7f;
    param_2[0x14] = (byte)uVar4;
    param_2[0x15] = 0;
    if (getenv("UW_DEBUG_NPC_SPEED"))
      fprintf(stderr, "[npc-speed] obj=%p byte13&0x7f=%d class0x40=%d\n", (void *)param_1,
              (int)uVar4, (int)((*param_1 & 0x1c0) == 0x40));
    if ((((*param_1 & 0x1c0) == 0x40) ||
        (*(short *)(param_2 + 0x10) != 0 || *(short *)(param_2 + 10) != 0)) ||
       (((&DAT_00202c93)[iVar5] & 8) != 0)) {
      param_2[0x14] = (byte)(uVar4 * 0x2f);
      param_2[0x15] = (byte)(uVar4 * 0x2f >> 8);
      if (getenv("UW_DEBUG_NPC_SPEED"))
        fprintf(stderr, "[npc-speed] obj=%p -> final speed=%d\n", (void *)param_1, (int)(short)(uVar4 * 0x2f));
      if ((*param_1 & 0x1c0) == 0x40) {
        param_2[0x27] = 8;
      }
    }
    else {
      if ((*(int *)(param_2 + 0x1a) + 1) * 2 < (int)(short)uVar4) {
        iVar5 = (*(byte *)((char *)param_1 + 0x13) & 0x7f) *
                ((short)*(int *)(param_2 + 0x1a) * 4 + 0x29);
        param_2[0x14] = (byte)iVar5;
        bVar6 = (byte)((uint)iVar5 >> 8);
      }
      else {
        param_2[0x14] = 0;
        bVar6 = 0;
      }
      param_2[0x15] = bVar6;
    }
  }
  else {
    param_2[10] = 0;
    param_2[0xb] = 0;
    param_2[0x10] = 0;
    param_2[0x11] = 0;
    param_2[0x14] = 0;
    param_2[0x15] = 0;
    param_2[0x1e] = (byte)param_1[2] & 0x3f;
    iVar5 = (int)CONCAT11(param_2[1],*param_2) + DAT_0010144c * 8;
    *param_2 = (byte)iVar5;
    param_2[1] = (byte)((uint)iVar5 >> 8);
    iVar5 = (int)CONCAT11(param_2[3],param_2[2]) + DAT_00101454 * 8;
    param_2[2] = (byte)iVar5;
    param_2[3] = (byte)((uint)iVar5 >> 8);
  }
  if (bVar8) {
    sVar3 = Ordinal_1053();
    iVar5 = ((int)sVar3 & 0x1fU) + *(short *)param_2 * 0x20;
    *param_2 = (byte)iVar5;
    param_2[1] = (byte)((uint)iVar5 >> 8);
    sVar3 = Ordinal_1053();
    iVar5 = ((int)sVar3 & 0x1fU) + *(short *)(param_2 + 2) * 0x20;
    param_2[2] = (byte)iVar5;
    param_2[3] = (byte)((uint)iVar5 >> 8);
    sVar3 = Ordinal_1053();
    iVar5 = ((int)sVar3 & 7U) + *(short *)(param_2 + 4) * 8;
    param_2[4] = (byte)iVar5;
    param_2[5] = (byte)((uint)iVar5 >> 8);
  }
  param_2[0x29] = 0;
  param_2[0x2a] = 0;
  return;
}



// was FUN_00055610 -- the "spawn and replace" mechanism: allocate a
// fresh low-region object slot (alloc_object_slot(1), same allocator
// spawn_object_near_player uses -- the only region emit_tile_objects's
// object_ptr_in_arena gate treats as renderable), copy param_1's key
// fields into it, recompute its placement via
// compute_object_placement_fields, then unlink param_1 from its tile's
// object list, free its slot, and insert_head the new copy in its
// place. Exists to move an object that was never allocated in the
// renderable arena (e.g. a chargen-default inventory item dropped for
// the first time) into it; without this an object can be correctly
// linked into a tile's list yet still never actually render.
ushort *reallocate_object_to_arena(param_1)
ushort * param_1;

{
  char *iVar1;  /* was `int` -- truncated tilemap_lookup's real pointer */
  ushort *puVar2;

  iVar1 = (char *)tilemap_lookup((int)DAT_0010144c,(int)DAT_00101454);
  if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80) {
    ushort *pWalk;
    int n = 0;
    fprintf(stderr, "[replace] ENTER type=0x%x param_1=%p tile=(%d,%d) tilerec=%p\n",
            (unsigned)(*param_1 & 0x1ff), (void *)param_1,
            (int)DAT_0010144c, (int)DAT_00101454, (void *)iVar1);
    fprintf(stderr, "[replace] pre-unlink list @ %p:", (void *)(iVar1 + 2));
    pWalk = (ushort *)resolve_object_link(iVar1 + 2);
    while (pWalk != NULL && n < 20) {
      fprintf(stderr, " [%p type=0x%x%s]", (void *)pWalk, (unsigned)(*pWalk & 0x1ff),
              pWalk == param_1 ? "<-TARGET" : "");
      pWalk = (ushort *)resolve_object_link((ushort *)((char *)pWalk + 4));
      n++;
    }
    fprintf(stderr, " (n=%d)\n", n);
  }
  puVar2 = (ushort *)alloc_object_slot(1);
  if (puVar2 == (ushort *)0x0) {
    puVar2 = (ushort *)0x0;
  }
  else {
    *(char *)puVar2 = (char)*param_1;
    *(undefined1 *)((char *)puVar2 + 1) = *(undefined1 *)((char *)param_1 + 1);
    *(char *)(puVar2 + 1) = (char)param_1[1];
    *(undefined1 *)((char *)puVar2 + 3) = *(undefined1 *)((char *)param_1 + 3);
    *(char *)(puVar2 + 2) = (char)param_1[2];
    *(undefined1 *)((char *)puVar2 + 5) = *(undefined1 *)((char *)param_1 + 5);
    *(char *)(puVar2 + 3) = (char)param_1[3];
    *(undefined1 *)((char *)puVar2 + 7) = *(undefined1 *)((char *)param_1 + 7);
    compute_object_placement_fields(puVar2,(int)DAT_0010144c,(int)DAT_00101454);
    *(byte *)(puVar2 + 4) = (byte)param_1[2] & 0x3f;
    if (((*param_1 & 0x1c0) != 0x140) && (((&DAT_00202c9a)[(*param_1 & 0x1ff) * 0xd] & 3) != 2)) {
      *(byte *)(puVar2 + 0xd) = (byte)(param_1[1] >> 7) & 7;
    }
    if ((*puVar2 & 0x1c0) == 0x1c0) {
      scheduler_relink_entry(puVar2,param_1);
    }
    if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
      fprintf(stderr, "[replace] new copy puVar2=%p type=0x%x height(f/10)=%d in_arena=%d\n",
              (void *)puVar2, (unsigned)(*puVar2 & 0x1ff),
              (int)*(short *)((char *)puVar2 + 0xf), (int)object_ptr_in_arena((char *)puVar2));
    object_list_unlink(iVar1 + 2,param_1);
    free_object_slot(param_1);
    object_list_insert_head(iVar1 + 2,puVar2);
    if (getenv("UW_DEBUG_THROW") && (*puVar2 & 0x1ff) == 0x80) {
      ushort *pWalk;
      int n = 0;
      int found = 0;
      fprintf(stderr, "[replace] post-insert list @ %p:", (void *)(iVar1 + 2));
      pWalk = (ushort *)resolve_object_link(iVar1 + 2);
      while (pWalk != NULL && n < 20) {
        if (pWalk == puVar2) found = 1;
        fprintf(stderr, " [%p type=0x%x%s]", (void *)pWalk, (unsigned)(*pWalk & 0x1ff),
                pWalk == puVar2 ? "<-NEWCOPY" : "");
        pWalk = (ushort *)resolve_object_link((ushort *)((char *)pWalk + 4));
        n++;
      }
      fprintf(stderr, " (n=%d found_new_copy=%d)\n", n, found);
    }
  }
  return puVar2;
}



// was FUN_0005578c -- finalize an object record's placement at tile
// (param_2,param_3): recomputes its render/collision height from the
// low 7 bits of its own offset 2-3 field (the same "height_field =
// (raw&0x7f)<<3" formula emit_tile_objects and decode_tile_object_billboard_texture both use),
// caching it into offsets 0xb-0x12 alongside the tile sub-position, and
// sets a handful of per-object flag bytes (0x13/0x14/0x16-0x18). Called
// by both spawn_object_near_player and reallocate_object_to_arena
// whenever a fresh object copy needs a real position/height, not just a
// carried-over one.
void compute_object_placement_fields(param_1,param_2,param_3)
undefined1 * param_1;
uint param_2;
uint param_3;

{
  char cVar1;
  uint uVar2;
  int iVar3;
  byte bVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  
  uVar7 = (uint)*(ushort *)(param_1 + 2);
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[throw-height] raw param_1[2..3](uVar7 src)=0x%x -> height_field=(uVar7&0x7f)<<3=%d\n",
            (unsigned)uVar7, (int)((uVar7 & 0x7f) << 3));
  param_1[9] = (byte)(*(ushort *)(param_1 + 2) >> 2) & 0xe0;
  param_1[0x18] = param_1[0x18] & 0xe0;
  param_1[0x14] = param_1[0x14] & 7 | 0x80;
  uVar6 = (uint)CONCAT11(param_1[1],*param_1);
  bVar4 = (((&DAT_00202c93)[(uVar6 & 0x1ff) * 0xd] & 8) == 0) << 7;
  param_1[0x13] = bVar4 | param_1[0x13] & 0x7f;
  uVar2 = param_3 & 0x3f | (param_2 & 0x3ff) << 6;
  param_1[0x16] = param_1[0x16] & 0xf | (byte)(uVar2 << 4);
  param_1[0x17] = (char)(uVar2 >> 4);
  cVar1 = DAT_00101928;
  param_1[0x13] = bVar4;
  param_1[10] = (cVar1 + 1U ^ param_1[10]) & 0xf ^ param_1[10];
  param_1[0x14] = 0x82;
  *param_1 = (char)(uVar6 & 0xbfff);
  param_1[1] = (char)((uVar6 & 0xbfff) >> 8);
  param_1[8] = 0x3f;
  param_1[10] = param_1[10] & 0x8f;
  if ((uVar6 & 0x1c0) != 0x40) {
    iVar5 = ((uVar7 & 0x1c00) >> 5) + param_3 * 0x100 + 0xf;
    param_1[0xd] = (char)iVar5;
    param_1[0xe] = (char)((uint)iVar5 >> 8);
    iVar5 = (uVar7 & 0x7f) << 3;
    param_1[0xf] = (char)iVar5;
    iVar3 = ((uVar7 & 0xe000) >> 8) + (param_2 & 0xff) * 0x100 + 0xf;
    param_1[0xb] = (char)iVar3;
    param_1[0x10] = (char)((uint)iVar5 >> 8);
    param_1[0x12] = 0;
    param_1[0xc] = (char)((uint)iVar3 >> 8);
  }
  return;
}



void FUN_00055ef8(param_1)
int param_1;

{
  char cVar1;
  short sVar2;
  int iVar3;
  
  if (DAT_002046d4 == 0) {
    cVar1 = Ordinal_1053();
    *(byte *)(param_1 + 0x14) = (cVar1 + 1U & 3) * '/';
    *(undefined1 *)(param_1 + 0x15) = 0;
    *(undefined1 *)(param_1 + 0x10) = 0xfc;
    *(undefined1 *)(param_1 + 0x11) = 0xff;
  }
  else {
    sVar2 = Ordinal_1053();
    iVar3 = (((int)sVar2 & 0x3fffU) - 0x2000) + (int)*(short *)(param_1 + 0x21);
    *(char *)(param_1 + 0x21) = (char)iVar3;
    *(char *)(param_1 + 0x22) = (char)((uint)iVar3 >> 8);
    *(undefined1 *)(param_1 + 0x14) = 0xbc;
    *(undefined1 *)(param_1 + 0x15) = 0;
  }
  return;
}



// was FUN_00055f98 -- finalize a just-placed object's rest position at
// (param_2,param_3): validate it can actually reach this floor height,
// route genuinely-misplaced objects into discard_misplaced_object
// (which destroys them, see its own comment), or reallocate a never-
// before-placed object into the renderable arena via
// reallocate_object_to_arena before returning it.
ushort *settle_dropped_object(param_1,param_2,param_3,param_4)
ushort * param_1;
short param_2;
short param_3;
int param_4;

{
  int uw_ord2005_rem_119 = 0;
  bool bVar1;
  ushort uVar2;
  undefined2 uVar3;
  char cVar4;
  byte bVar5;
  undefined2 uVar6;
  short *psVar7;
  uint uVar8;
  ushort *puVar9;
  undefined4 uVar10;
  char extraout_r1;
  int iVar11;
  int iVar12;
  /* iVar12 is reused throughout this function as a plain int (bitfield
     math, array indices) -- real uses, left alone -- but the one use at
     LAB_000564d8 held tilemap_lookup's real 64-bit pointer return,
     truncating it on this host (same class as drop_held_object_near_
     player's own identical bug just above it in this file). New,
     properly-typed local for just that one pointer use; every other
     iVar12 use is separated from it by an early `return`, so this
     doesn't touch any of them. */
  char *pDropTile;
  undefined1 local_4c [24];

  DAT_002046d4 = 0;
  DAT_002046ec = 0;
  DAT_00202c6c = local_4c;
  bVar1 = false;
  uVar6 = encode_object_slot_index(param_1);
  DAT_00202c6c[10] = (char)uVar6;
  DAT_00202c6c[0xb] = (char)((ushort)uVar6 >> 8);
  iVar12 = (*param_1 & 0x1ff) * 0xd;
  bVar5 = (&DAT_00202c93)[iVar12];
  if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
    fprintf(stderr, "[f98] ENTER param_1=%p type=0x%x tile=(%d,%d) flags-byte=0x%x\n",
            (void *)param_1, (unsigned)(*param_1 & 0x1ff), (int)param_2, (int)param_3, (unsigned)bVar5);
  do {
    if ((bVar5 & 8) != 0) {
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: flag8 set on class table, returning param_1 unchanged\n");
      return param_1;
    }
    DAT_00202c6c[8] = (&DAT_00202c91)[iVar12] & 7;
    DAT_00202c6c[9] = (&DAT_00202c90)[iVar12];
    DAT_00202c6c[4] = (byte)param_1[1] & 0x7f;
    DAT_00202c6c[5] = 0;
    iVar12 = param_2 * 8 + (uint)(*(byte *)((char *)param_1 + 3) >> 5);
    *DAT_00202c6c = (char)iVar12;
    DAT_00202c6c[1] = (char)((uint)iVar12 >> 8);
    iVar12 = param_3 * 8 + ((*(byte *)((char *)param_1 + 3) & 0x1c) >> 2);
    DAT_00202c6c[2] = (char)iVar12;
    DAT_00202c6c[3] = (char)((uint)iVar12 >> 8);
    collision_build_height_field(DAT_00202c6c[8]);
    if (((int)((uint)(byte)DAT_00202c6c[8] + (uint)(byte)DAT_00202c6c[0x10]) <
         (int)*(short *)(DAT_00202c6c + 4)) || (iVar12 = 1, bVar1)) {
      iVar12 = 0;
    }
    collision_height_envelope(iVar12,1);
    FUN_00051dd0();
    DAT_00086998 = -1;
    if (((DAT_00202c6c[0x15] == '\0') && (iVar11 = (int)(char)DAT_00202c6c[0x16], 0 < iVar11)) &&
       (iVar11 <= (int)(uint)(byte)DAT_00202c6c[0x14])) {
      iVar11 = (iVar11 + -1) * 0x1000000 >> 0x18;
      do {
        DAT_00202c6c[0x16] = (char)iVar11;
        cVar4 = DAT_00202c6c[0x16];
        if ((cVar4 < 0) ||
           ((ushort)(byte)(&DAT_00202c38)[cVar4 * 6] != *(ushort *)(DAT_00202c6c + 4))) break;
        DAT_00086998 = cVar4;
        psVar7 = (short *)resolve_object_link(&DAT_00202c3a + cVar4 * 6);
        uVar8 = (int)*psVar7 & 0x1ff;
        DAT_00086999 = (undefined1)uVar8;
        DAT_0008699a = (undefined1)(uVar8 >> 8);
        if (((&DAT_00202c93)[(short)uVar8 * 0xd] & 2) == 2) {
          if (((&DAT_00202c3a)[DAT_00086998 * 6] & 0x10) != 0) {
            DAT_002046ec = 1;
            break;
          }
          DAT_002046d4 = 1;
        }
        iVar11 = (char)DAT_00202c6c[0x16] + -1;
      } while( true );
    }
    uVar3 = DAT_00101454;
    uVar6 = DAT_0010144c;
    uVar2 = *(ushort *)(DAT_00202c6c + 0xc);
    if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
      fprintf(stderr, "[f98] uVar2(local_4c+0xc)=0x%x local_4c+0xe=0x%x local_4c[0x15]=%d iVar12=%d\n",
              (unsigned)uVar2, (unsigned)*(ushort *)(DAT_00202c6c + 0xe),
              (int)DAT_00202c6c[0x15], iVar12);
    if ((((*(ushort *)(DAT_00202c6c + 0xe) | uVar2) & 0x300) != 0) || (DAT_00202c6c[0x15] != '\0'))
    {
      cVar4 = '\x01';
LAB_000564d0:
      if (cVar4 == '\0') {
        if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
          fprintf(stderr, "[f98] BAIL at LAB_000564d0 (cVar4==0), returning param_1 unchanged\n");
        return param_1;
      }
LAB_000564d8:
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] -> discard_misplaced_object fallback path (not reallocate_object_to_arena replace)\n");
      pDropTile = (char *)tilemap_lookup((int)param_2,(int)param_3);
      puVar9 = (ushort *)discard_misplaced_object(pDropTile + 2,param_1,0);
      return puVar9;
    }
    if ((uVar2 & 7) == 5) goto LAB_000564d8;
    if ((uVar2 & 7) == 6) {
      if (((&DAT_00202c97)[(*param_1 & 0x1ff) * 0xd] & 0xc) == 0xc) {
        if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
          fprintf(stderr, "[f98] BAIL: (uVar2&7)==6 class-table gate, returning param_1 unchanged\n");
        return param_1;
      }
      cVar4 = resolve_damage_type_resistance(param_1,1,8);
      goto LAB_000564d0;
    }
    if ((uVar2 & 8) != 0) {
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: (uVar2&8)!=0, returning param_1 unchanged\n");
      return param_1;
    }
    if (DAT_002046ec != 0) {
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: DAT_002046ec!=0, returning param_1 unchanged\n");
      return param_1;
    }
    if (iVar12 == 0) {
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] -> reallocate_object_to_arena replace path, coords=(%d,%d)\n", (int)param_2, (int)param_3);
      DAT_0010144c = param_2;
      DAT_00101454 = param_3;
      puVar9 = (ushort *)reallocate_object_to_arena(param_1);
      DAT_0010144c = uVar6;
      DAT_00101454 = uVar3;
      if (DAT_002046d4 != 0) {
        *(byte *)((char *)puVar9 + 0x13) = *(byte *)((char *)puVar9 + 0x13) & 0x83 | 3;
        uVar10 = Ordinal_1053();
        uw_ord2005_rem_119 = ((int)(uVar10)) % (9);
        *(char *)((char *)puVar9 + 9) = *(char *)((char *)puVar9 + 9) + (uw_ord2005_rem_119 + '\f') * '\x10';
      }
      if (param_4 == 0) {
        return puVar9;
      }
      bVar5 = Ordinal_1053();
      *(byte *)((char *)puVar9 + 0x13) =
           ((bVar5 & 3) + 1 ^ *(byte *)((char *)puVar9 + 0x13)) & 0x7f ^ *(byte *)((char *)puVar9 + 0x13);
      bVar5 = Ordinal_1053();
      *(byte *)(puVar9 + 10) = (byte)puVar9[10] & 7 ^ ((bVar5 & 3) + 0xe) * '\b';
      return puVar9;
    }
    DAT_00202c6c = local_4c;
    bVar1 = true;
    uVar6 = encode_object_slot_index(param_1);
    DAT_00202c6c[10] = (char)uVar6;
    DAT_00202c6c[0xb] = (char)((ushort)uVar6 >> 8);
    iVar12 = (*param_1 & 0x1ff) * 0xd;
    bVar5 = (&DAT_00202c93)[iVar12];
  } while( true );
}



void FUN_000564f8(param_1)
short param_1;

{
  short sVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  short local_c;
  short local_a;
  
  DAT_000868d8 = 1;
  if (param_1 != 0) {
    FUN_00057118();
    FUN_00056cc8(6);
    cursor_show_idle_tick();
    wait_for_click_release(0);
  }
  DAT_002046f8 = 0;
  do {
    while( true ) {
      sVar1 = next_input_event();
      if (-1 < sVar1) break;
      advance_menu_music_track();
      flush_dirty_rect_to_display(1);
    }
    if (getenv("UW_DEBUG_PAUSEMENU"))
      fprintf(stderr, "[pausemenu] loop event=0x%x\n", (int)sVar1);
    if (sVar1 < 0x8e) {
      if (sVar1 == 0x8d) {
LAB_00056638:
        uVar2 = 2;
        goto LAB_000565a4;
      }
      if (0 < sVar1) {
        if (sVar1 < 4) {
          FUN_00057504(&local_c,&local_a);
          iVar3 = (int)local_c;
          iVar4 = (int)local_a;
          local_c = (short)(iVar3 + -4);
          local_a = (short)(0x76 - iVar4);
          if (getenv("UW_DEBUG_PAUSEMENU"))
            fprintf(stderr, "[pausemenu] click event=%d raw=(%d,%d) rel=(%d,%d)\n",
                    (int)sVar1, iVar3, iVar4, (int)local_c, (int)local_a);
          iVar3 = (iVar3 + -4) * 0x10000 >> 0x10;
          if ((-1 < iVar3) && (iVar3 < 0x24)) {
            iVar3 = (0x76 - iVar4) * 0x10000 >> 0x10;
            if ((-1 < iVar3) && (iVar3 < 0x6d)) {
              /* Was called with both args dropped (same missing-argument
                 idiom as elsewhere in this file) -- FUN_00056d38 only
                 actually uses its 2nd (Y) argument, but the sibling call
                 site in cursor_mode_button_click passes (x,y) in this
                 order, so match it here with the just-computed
                 region-relative click position. */
              FUN_00056d38(local_c, local_a);
            }
          }
        }
        else {
          if (sVar1 == 0xd) {
            uVar2 = 1;
            goto LAB_000565a4;
          }
          if (sVar1 != 0x1b) {
            bVar5 = sVar1 == 0x20;
            goto LAB_0005659c;
          }
          close_ui_panel_return_to_game();
        }
      }
    }
    else {
      if (sVar1 != 0x93) {
        if (sVar1 == 0xa6) goto LAB_00056638;
        bVar5 = sVar1 == 0xab;
LAB_0005659c:
        if (!bVar5) goto LAB_000565a8;
      }
      uVar2 = 0;
LAB_000565a4:
      FUN_00056d6c(uVar2);
    }
LAB_000565a8:
    if (DAT_002046f8 != 0) {
      return;
    }
  } while( true );
}



void FUN_00056640(param_1)
undefined4 param_1;

{
  reload_single_grtile_entry(0x20eb,s_optbtns_00086954,param_1);
  draw_sprite_by_id(0x20eb,4,0xb,0x6c,0x23);
  return;
}



void FUN_00056688(param_1,param_2)
int param_1;
undefined4 param_2;

{
  reload_single_grtile_entry(0x20ec,s_optbtns_00086954,param_2);
  draw_sprite_by_id(0x20ec,5,param_1 * -0xf + 0x67,0xe,0x1f);
  return;
}



void FUN_000566dc(param_1,param_2)
undefined4 param_1;
int param_2;

{
  if (-1 < DAT_002046f0) {
    FUN_00056688((int)DAT_002046f4,DAT_002046f0 + -1);
  }
  FUN_00056688(param_1,param_2 + 1);
  DAT_002046f0 = (short)(param_2 + 1);
  DAT_002046f4 = (short)param_1;
  return;
}



// was FUN_00056724 -- closes whatever UI panel/popup is currently
// open (DAT_000868d8 = 0) and redraws the icon-bar's "options button"
// background (OPTBTNS.GR), re-establishing the mode-icon highlight if
// a mode is already selected. Called on Escape and other panel-close
// paths.
void close_ui_panel_return_to_game()

{
  FUN_00057118();
  DAT_000868d8 = 0;
  DAT_000868dc = 7;
  reload_single_grtile_entry(0x20eb,s_optbtns_00086954,0);
  draw_sprite_by_id(0x20eb,4,0xb,0x6c,0x23);
  if (0 < g_cursor_mode) {
    /* Dropped argument -- same idiom as the identical bug in
       enter_dungeon_view_hud_init right above this function's sibling call (see its
       comment); confirmed via disassembly of 0x56724 the same way:
       r0 holds g_cursor_mode, untouched from the guard's own load
       through to `blgt 0x3f99c`. */
    mode_icon_highlight_on((int)g_cursor_mode);
  }
  DAT_002046f8 = 1;
  cursor_show_idle_tick();
  return;
}



void FUN_000567c0()

{
  FUN_00056640(1);
  DAT_002046f0 = 0xffff;
  FUN_000566dc(6,6);
  return;
}



void FUN_00056838()

{
  FUN_00056640(3);
  DAT_002046f0 = 0xffff;
  FUN_000566dc(3,0x3b);
  return;
}



void FUN_00056864()

{
  short sVar1;
  int iVar2;
  char cVar3;
  undefined4 uVar4;
  
  FUN_00056640(4);
  DAT_002046f0 = 0xffff;
  if (DAT_000868dc == 2) {
    uVar4 = 0x33;
    iVar2 = is_music_playing();
    cVar3 = (iVar2 == 0) + '/';
    iVar2 = is_music_playing();
  }
  else {
    uVar4 = 0x34;
    iVar2 = is_sound_effects_enabled();
    cVar3 = (iVar2 == 0) + '1';
    iVar2 = is_sound_effects_enabled();
  }
  iVar2 = (short)(ushort)(iVar2 != 0) + 3;
  FUN_00056688(6,cVar3);
  FUN_00056688(5,uVar4);
  sVar1 = 2;
  if (iVar2 * 0x10000 >> 0x10 != 3) {
    sVar1 = 0;
  }
  FUN_000566dc(iVar2,sVar1 + 0x14);
  return;
}



void FUN_0005693c()

{
  uint uVar1;
  
  uVar1 = (uint)(*(byte *)(DAT_00086df8 + 0xb5) >> 4);
  DAT_002046f0 = 0xffff;
  FUN_00056640(5);
  reload_single_grtile_entry(0x20ed,s_optbtns_00086954,uVar1 + 0x35);
  draw_sprite_by_id(0x20ed,5,10,0x12,0x22);
  FUN_000566dc(4 - uVar1,(uVar1 + 0x13) * 2);
  return;
}



void FUN_000569c0(param_1)
short param_1;

{
  undefined4 uVar1;
  
  if (param_1 == 4) {
    uVar1 = 1;
  }
  else {
    if (param_1 != 3) goto LAB_000569ec;
    uVar1 = 0;
  }
  set_music_enabled(uVar1);
  FUN_00056864();
LAB_000569ec:
  if (DAT_002046fc == 0) {
    if (param_1 == 2) {
      FUN_00056cc8(6);
    }
  }
  else {
    close_ui_panel_return_to_game();
  }
  return;
}



void FUN_00056a18(param_1)
short param_1;

{
  undefined4 uVar1;
  
  if (param_1 == 4) {
    uVar1 = 1;
  }
  else {
    if (param_1 != 3) goto LAB_00056a44;
    uVar1 = 0;
  }
  set_sound_effects_enabled(uVar1);
  FUN_00056864();
LAB_00056a44:
  if (DAT_002046fc == 0) {
    if (param_1 == 2) {
      FUN_00056cc8(6);
    }
  }
  else {
    close_ui_panel_return_to_game();
  }
  return;
}



void FUN_00056a70(param_1)
int param_1;

{
  short sVar1;
  
  sVar1 = (short)param_1;
  if ((0 < sVar1) && (sVar1 < 5)) {
    param_1 = -param_1;
    *(byte *)(DAT_00086df8 + 0xb5) =
         (byte)(((param_1 + 4) * 0x10000 >> 0x10 & 0xfU) << 4) |
         *(byte *)(DAT_00086df8 + 0xb5) & 0xf;
    FUN_0005d2b0();
    full_dungeon_redraw();
    weapon_overlay_and_full_redraw();
    reload_single_grtile_entry(0x20ed,s_optbtns_00086954,param_1 + 0x39);
    draw_sprite_by_id(0x20ed,5,10,0x12,0x22);
    FUN_000566dc(4 - (param_1 + 4),(param_1 + 0x17) * 2);
  }
  if (sVar1 == 0) {
    if (DAT_002046fc == 0) {
      FUN_00056cc8(6);
    }
    else {
      close_ui_panel_return_to_game();
    }
  }
  return;
}



void FUN_00056b48(param_1)
short param_1;

{
  int iVar1;
  undefined4 uVar2;
  
  if (param_1 == 0) {
    uVar2 = 5;
  }
  else {
    if (param_1 == 1) {
      close_ui_panel_return_to_game();
      return;
    }
    if (param_1 == 2) {
      uVar2 = 4;
    }
    else if (param_1 == 3) {
      uVar2 = 3;
    }
    else if (param_1 == 4) {
      uVar2 = 2;
    }
    else if (param_1 == 5) {
      iVar1 = check_can_load_game();
      if (iVar1 == 0) {
        return;
      }
      uVar2 = 1;
    }
    else {
      if (param_1 != 6) {
        return;
      }
      iVar1 = check_can_save_game();
      if (iVar1 == 0) {
        return;
      }
      uVar2 = 0;
    }
  }
  FUN_00056cc8(uVar2);
  return;
}



void FUN_00056bdc(param_1)
int param_1;

{
  short sVar1;
  int iVar2;
  
  sVar1 = (short)param_1;
  iVar2 = 4;
  if ((0 < sVar1) && (sVar1 < 6)) {
    FUN_000566dc(param_1,(0x14 - param_1) * 2);
    msg_scroll_panel_reset(0);
    if (sVar1 != 1) {
      if (sVar1 != 2) {
        if (sVar1 != 3) {
          if (sVar1 != 4) {
            if (sVar1 != 5) {
              return;
            }
            iVar2 = 3;
          }
          iVar2 = iVar2 + -1;
        }
        iVar2 = iVar2 + -1;
      }
      handle_save_load_menu_action(DAT_000868dc == 1,iVar2);
      if (DAT_000868dc == 1) {
        g_cursor_mode = 0;
        unready_weapon();
      }
    }
    close_ui_panel_return_to_game();
  }
  return;
}



void FUN_00056c88(param_1)
short param_1;

{
  if (param_1 != 3) {
    if (param_1 != 4) {
      return;
    }
    FUN_000566dc(4,0x39);
    cursor_show_idle_tick();
    request_game_exit(0);
    FUN_00057118();
  }
  close_ui_panel_return_to_game();
  return;
}



void FUN_00056cc8(param_1)
short param_1;

{
  DAT_000868dc = param_1;
  if (getenv("UW_DEBUG_PAUSEMENU"))
    fprintf(stderr, "[pausemenu] FUN_00056cc8: entering state=%d\n", (int)param_1);
  if ((uint)param_1 < 8 && PTR_FUN_000868e0_table[param_1] != 0) {
    PTR_FUN_000868e0_table[param_1]();
  }
  return;
}



void FUN_00056cf8(param_1)
undefined4 param_1;

{
  FUN_00057118();
  if (getenv("UW_DEBUG_PAUSEMENU"))
    fprintf(stderr, "[pausemenu] FUN_00056cf8: state=%d clicked_index=%d\n",
            (int)DAT_000868dc, (int)param_1);
  if ((uint)DAT_000868dc < 8 && PTR_FUN_00086900_table[DAT_000868dc] != 0) {
    PTR_FUN_00086900_table[DAT_000868dc](param_1);
  }
  cursor_show_idle_tick();
  wait_for_click_release(0);
  return;
}



void FUN_00056d38(param_1,param_2)
undefined4 param_1;
short param_2;

{
  short sVar1;
  
  sVar1 = Ordinal_2005(0xf,(int)param_2);
  FUN_00056cf8((int)sVar1);
  return;
}



/* Was raw pointer arithmetic `*(char *)(DAT_000868dc * 7 + iVar2 + 0x86920)`
   -- 0x86920 is the ORIGINAL 32-bit binary's fixed load address for this
   table (immediately following the PTR_FUN_000868e0/00086900 dispatch
   tables, see their own comment -- same "orphaned link-time data" class),
   used as a literal absolute pointer instead of a symbol. On this
   recompile nothing is mapped there, so any state/highlight-index
   combination whose real value is genuinely non-zero (i.e. that state
   actually has a navigable widget in that D-pad-navigation slot) reads
   through a wild pointer and crashes -- confirmed via lldb, EXC_BAD_ACCESS
   at 0x86924. Never hit until the Enter-key WM_CHAR fix (see
   [[save-load-name-entry-crash]]'s g_keychar_deferred) let VK_RETURN's
   GXGetDefaultKeys() "start button" code (0x93) reach FUN_000564f8's own
   event loop cleanly for the first time -- that's what calls FUN_00056d6c
   with a real highlighted-item index. Real bytes recovered via a Ghidra
   headless memory dump of the original binary at 0x86920 (8 rows x 7
   columns, one row per menu state 0-7, one column per D-pad-navigable
   list position 0-6): each nonzero byte is the widget-highlight value
   FUN_000566dc's own 2nd argument expects for that slot (matches the
   literal values each state's own draw function already passes it,
   e.g. FUN_000567c0's `FUN_000566dc(6,6)`). */
static const unsigned char g_menu_nav_highlight_table[8][7] = {
  {  0,  24,  36,  34,  32,  30,   0 },
  {  0,  24,  36,  34,  32,  30,   0 },
  {  0,   0,  26,  22,  20,   0,   0 },
  {  0,   0,  26,  22,  20,   0,   0 },
  { 28,  44,  42,  40,  38,   0,   0 },
  {  0,   0,   0,  59,  57,   0,   0 },
  { 18,  16,  14,  12,  10,   8,   6 },
  {  0,   0,   0, 111, 112, 116,  98 },
};

void FUN_00056d6c(param_1)
short param_1;

{
  short sVar1;
  int iVar2;
  int iVar3;

  if (param_1 < 0x167) {
    if (param_1 == 0x166) {
      iVar2 = 3;
    }
    else {
      if (param_1 == 0) {
        sVar1 = -1;
LAB_00056ddc:
        iVar3 = (int)DAT_002046f4;
        iVar2 = (iVar3 + sVar1) * 0x10000 >> 0x10;
        if (iVar2 < 0) {
          return;
        }
        if (6 < iVar2) {
          return;
        }
        if (g_menu_nav_highlight_table[(unsigned)DAT_000868dc & 7][iVar2] == 0) {
          return;
        }
        FUN_00057118();
        FUN_000566dc(iVar3 + sVar1,(int)g_menu_nav_highlight_table[(unsigned)DAT_000868dc & 7][iVar2]);
        cursor_show_idle_tick();
        return;
      }
      if (param_1 == 1) {
        iVar2 = (int)DAT_002046f4;
      }
      else {
        if (param_1 == 2) {
          sVar1 = 1;
          goto LAB_00056ddc;
        }
        if (param_1 != 0x164) {
          return;
        }
        iVar2 = 2;
      }
    }
  }
  else if (param_1 == 0x16d) {
    iVar2 = 4;
  }
  else if (param_1 == 0x171) {
    iVar2 = 0;
  }
  else if (param_1 == 0x172) {
    iVar2 = 5;
  }
  else {
    if (param_1 != 0x173) {
      return;
    }
    iVar2 = 6;
  }
  FUN_00056cf8(iVar2);
  return;
}



void FUN_00056ebc()

{
  if (g_cursor_holding_state == 0) {
    DAT_002046fc = 1;
    DAT_000868dc = 6;
    FUN_00056d6c();
    FUN_000564f8(DAT_000868dc == 6);
    DAT_002046fc = 0;
  }
  else {
    print_scroll_message_by_id(0xa0);
  }
  return;
}



undefined4 init_cursor_subsystem()

{
  undefined4 uVar1;
  int iVar2;
  
  DAT_00204710 = 0;
  DAT_0020470c = 0;
  DAT_00204830 = 0x13f;
  DAT_00204834 = 199;
  DAT_00204838 = DAT_0020471c + 0x35;
  DAT_0020483c = DAT_0020471c + 0x16;
  DAT_002047dc = DAT_0020471c + 0xdf;
  DAT_002047d8 = DAT_0020471c + 0x83;
  FUN_00057dc0(0x106c);
  DAT_000889b8 = grtile_alloc_registered(0x28,0x28);
  if (DAT_000889b8 == 0) {
    uVar1 = 0xffffffff;
  }
  else {
    iVar2 = 0;
    DAT_000889bc = DAT_000889b8;
    do {
      (&DAT_002047b0)[iVar2] = 10000;
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 0x14);
    uVar1 = 0;
  }
  return uVar1;
}



int FUN_00056fe8()

{
  int iVar1;
  
  iVar1 = 0;
  if (getenv("UW_DEBUG_CURSORERASE")) {
    fprintf(stderr, "[cursorerase] entry DAT_00204844=%d will_erase=%d depth=%d mouse=(%d,%d)\n",
            (int)DAT_00204844, DAT_00204844 != 0, (int)DAT_00204840, (int)g_mouse_x, (int)g_mouse_y);
  }
  if (DAT_00204844 != 0) {
    set_draw_color(0x15);
    rect_fill_or_save_restore(g_mouse_x - DAT_0020471c,g_mouse_y - DAT_00204748,
                 ((int)DAT_00204784 - (int)DAT_0020471c) + (int)g_mouse_x + 1,
                 ((int)DAT_002047a4 - (int)DAT_00204748) + (int)g_mouse_y + 1);
    /* REVERTED (was: force g_force_flush around this call, matching
       draw_idle_mouse_cursor's own sibling wrapping) -- caused a visible flicker
       regression: rect_fill_or_save_restore's own dirty_rect_union call
       already records this erase's rect unconditionally, BEFORE any
       gating, and the dirty rect only resets once per FRAME (not once
       per hide/show pair, see flush_dirty_rect_to_display's own
       comment) -- so the immediately-following paired show call
       (draw_idle_mouse_cursor, called right after this from the same
       hide-move-show cycle) already sweeps up this erase's rect into
       its own forced flush. Forcing a flush HERE TOO just adds a
       second, premature flush per cycle, visibly showing the
       transient "erased, nothing redrawn yet" frame for one beat
       before the very next flush corrects it -- a flicker on every
       single cursor hide/show (i.e. constantly, since effectively
       every draw op in this file wraps itself in this hide/show pair).
       User confirmed this regression live.

       STILL OPEN -- user report not yet actually fixed: dragging an
       item onto a paperdoll spot with no slot leaves its icon
       stamped there permanently, and clicking again stamps more.
       Traced (via a temporary UW_DEBUG_CURSORERASE trace on this
       function's own entry) to a real, reproducible sequence: during
       an idle gap, an erase call here successfully clears
       DAT_00204844 to 0 (correct so far), but the PAIRED redraw
       (update_mouse_state's own `if (0 < DAT_00204840) draw_idle_mouse_cursor();`
       right after its own call to this function) does not fire,
       because DAT_00204840 (the show/hide nesting depth counter) is
       <=0 at that exact moment -- so nothing gets marked to redraw,
       and DAT_00204844 stays at 0 even though the game may still
       consider the item "held" and expect the cursor icon to keep
       following the mouse. Did NOT chase this further: WHY the depth
       counter is <=0 at that specific point (some other hide() with
       no matching show() yet pending?) is unknown, and a wrong guess
       here risks a second regression the same way the force-flush
       attempt above did. Ruled OUT as an explanation: handle_mouse_message's
       WM_LBUTTONUP handler unconditionally zeroing DAT_00204844 (see
       its own comment) -- adding an erase-before-clear there made no
       observable difference in the same trace, and this project's own
       inventory drag/drop convention uses the RIGHT mouse button
       throughout anyway (gx_stub.c's uw_inject_mouse_rdown/rup), not
       left, so that handler may not even be on the relevant path. */
    flush_dirty_rect_to_display(1);
    DAT_00204848 = 0;
    iVar1 = DAT_00204844;
  }
  return iVar1;
}



/* Gates the 4 "always show the desktop mouse cursor" deviations below
   (all originally gated shut on a real Pocket PC touchscreen, where a
   persistent cursor sprite makes no sense). Defaults OFF: drawing the
   cursor every idle frame forces a display flush every frame too (see
   draw_idle_mouse_cursor's own LAB_00058674 tail), which measurably slowed the
   game down when this was unconditionally on. Opt in with
   UW_ALWAYS_SHOW_CURSOR=1 until that flush cost is addressed. */
int uw_always_show_cursor(void)
{
  static int cached = -1;
  if (cached < 0) {
    cached = getenv("UW_ALWAYS_SHOW_CURSOR") != NULL;
  }
  return cached;
}



undefined4 cursor_show_idle_tick()

{
  int iVar1;
  
  iVar1 = (int)DAT_00204840;
  DAT_00204840 = (short)(iVar1 + 1);
  /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested, same as
     draw_idle_mouse_cursor's own deviation comment): 0x106c is the real,
     validly-loadable "default/no specific hotspot" cursor sprite (see
     FUN_00057dc0), and the real binary deliberately suppresses drawing
     THIS SPECIFIC sprite -- i.e. no persistent cursor over the plain
     3D viewport/background, only over registered UI hotspots that set
     their own distinct icon -- a touchscreen-native choice (no need to
     draw your own finger/stylus a cursor). Skips the exclusion so the
     desktop mouse cursor stays visible everywhere, including over the
     main view, only when UW_ALWAYS_SHOW_CURSOR=1 (see
     uw_always_show_cursor's own comment -- off by default, this forces
     a display flush every idle frame). */
  if ((iVar1 + 1) * 0x10000 >> 0x10 == 1) {
    if ((DAT_00204788 != 0x106c) || uw_always_show_cursor()) {
      draw_idle_mouse_cursor();
    }
  }
  if (1 < DAT_00204840) {
    DAT_00204840 = DAT_00204840 + -1;
  }
  return 0;
}



void FUN_00057118()

{
  int iVar1;
  
  iVar1 = (int)DAT_00204840;
  DAT_00204840 = (short)(iVar1 + -1);
  if ((((iVar1 + -1) * 0x10000 >> 0x10 == 0) || (DAT_000bbef4 != 0)) &&
     (iVar1 = FUN_00056fe8(), iVar1 != 0)) {
    DAT_00204844 = 0;
    set_draw_color(1);
  }
  if (DAT_00204840 < 0) {
    DAT_00204840 = DAT_00204840 + 1;
  }
  return;
}



void FUN_00057188(param_1,param_2,param_3,param_4)
undefined2 param_1;
undefined2 param_2;
undefined2 param_3;
undefined2 param_4;

{
  DAT_0020479c = param_1;
  DAT_002047a0 = param_2;
  DAT_00204798 = param_3;
  DAT_00204790 = param_4;
  return;
}



undefined4 FUN_000571c0()

{
  FUN_00057d1c((int)DAT_0020479c,(int)DAT_002047a0,
               ((int)DAT_00204798 + (int)DAT_0020479c) * 0x10000 >> 0x10,
               ((int)DAT_00204790 + (int)DAT_002047a0) * 0x10000 >> 0x10);
  return 0;
}



void FUN_0005721c()

{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  
  iVar3 = (int)DAT_0020479c;
  iVar4 = (((int)g_mouse_x - (int)DAT_00204784) + (int)DAT_0020471c) * 0x10000 >> 0x10;
  if ((iVar4 <= iVar3 + DAT_00204798) &&
     (iVar5 = (((int)g_mouse_x - (int)DAT_0020471c) + (int)DAT_00204784) * 0x10000 >> 0x10,
     iVar3 <= iVar5)) {
    iVar6 = (((int)g_mouse_y - (int)DAT_002047a4) + (int)DAT_00204748) * 0x10000 >> 0x10;
    iVar7 = (int)DAT_002047a0;
    if ((iVar6 <= iVar7 + DAT_00204790) &&
       (iVar1 = (((int)g_mouse_y - (int)DAT_00204748) + (int)DAT_002047a4) * 0x10000 >> 0x10,
       iVar7 <= iVar1)) {
      if ((((iVar3 < iVar4) && (iVar5 < iVar3 + DAT_00204798)) && (iVar7 < iVar6)) &&
         (iVar1 < iVar7 + DAT_00204790)) {
        DAT_00204794 = 2;
      }
      else {
        DAT_00204794 = 1;
        if (*(short *)(DAT_00085a6c + 8) != 1) {
          iVar4 = (int)DAT_000a85c4;
          iVar3 = (int)DAT_000a85c8;
          iVar5 = (int)DAT_000842a4;
          iVar6 = (int)DAT_000842a8;
          set_viewport_clip_rect(0,0,0x13f,199);
          FUN_00057118();
          set_viewport_clip_rect(iVar4,iVar3,iVar5,iVar6);
        }
      }
      if ((DAT_00204840 == 1) && (g_selected_object == 0)) {
        draw_idle_mouse_cursor();
        return;
      }
      if (DAT_00204840 < 2) {
        if (-1 < DAT_00204840) {
          return;
        }
        sVar2 = 1;
      }
      else {
        sVar2 = -1;
      }
      DAT_00204840 = DAT_00204840 + sVar2;
      return;
    }
  }
  DAT_00204794 = 0;
  return;
}



void FUN_00057460()

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  if ((DAT_00204794 == 1) && (*(short *)(DAT_00085a6c + 8) != 1)) {
    iVar1 = (int)DAT_000a85c4;
    iVar2 = (int)DAT_000a85c8;
    iVar3 = (int)DAT_000842a4;
    iVar4 = (int)DAT_000842a8;
    set_viewport_clip_rect(0,0,0x13f,199);
    cursor_show_idle_tick();
    set_viewport_clip_rect(iVar1,iVar2,iVar3,iVar4);
  }
  return;
}



void FUN_00057504(param_1,param_2)
undefined2 * param_1;
undefined2 * param_2;

{
  *param_1 = g_mouse_x;
  *param_2 = g_mouse_y;
  return;
}



void FUN_00057528(param_1,param_2)
undefined2 * param_1;
undefined2 * param_2;

{
  undefined2 uVar1;
  
  if (DAT_0020484c == 0) {
    *param_1 = g_mouse_x;
    uVar1 = g_mouse_y;
  }
  else {
    *param_1 = DAT_0008696a;
    uVar1 = DAT_0008696c;
  }
  *param_2 = uVar1;
  return;
}



void FUN_00057570()

{
  if (DAT_00086968 != -1) {
    DAT_00086968 = -1;
  }
  return;
}



void FUN_0005758c()

{
  return;
}



void FUN_00057590(param_1,param_2)
undefined2 param_1;
undefined2 param_2;

{
  FUN_00057118();
  FUN_00057e54();
  g_mouse_x = param_1;
  g_mouse_y = param_2;
  cursor_show_idle_tick();
  return;
}



int FUN_000575c4(param_1)
short * param_1;

{
  short sVar1;
  
  sVar1 = FUN_00058738();
  *param_1 = sVar1;
  if (sVar1 == 0) {
    DAT_00086968 = 0xffff;
  }
  DAT_00204850 = *param_1;
  return (int)*param_1;
}



int FUN_000576d0(param_1)
int param_1;

{
  uint uVar1;
  uint uVar2;
  short sVar3;
  int iVar4;
  short local_18;
  short local_16;
  short local_14;
  short local_12;
  undefined1 auStack_10 [4];
  
  iVar4 = 0;
  FUN_00057504(&local_16,&local_12);
  while( true ) {
    sVar3 = FUN_000575c4(auStack_10);
    if ((sVar3 == 0) || (iVar4 != 0)) break;
    flush_dirty_rect_to_display(1);
    if (param_1 != 0) {
      dispatch_sticky_mode_handlers();
    }
    poll_input_event(0);
    FUN_00057904(1);
    FUN_00058734();
    update_mouse_state();
    FUN_00057504(&local_18,&local_14);
    uVar1 = (int)local_18 - (int)local_16 >> 0x1f;
    uVar2 = (int)local_14 - (int)local_12 >> 0x1f;
    if (6 < (int)((((int)local_14 - (int)local_12 ^ uVar2) - uVar2) +
                 (((int)local_18 - (int)local_16 ^ uVar1) - uVar1))) {
      iVar4 = 1;
    }
  }
  return iVar4;
}



void set_cursor_confine_rect(param_1,param_2,param_3,param_4)
short param_1;
short param_2;
short param_3;
short param_4;

{
  if (getenv("UW_DEBUG_CURSORSHOW")) {
    fprintf(stderr, "[cursorbounds] set_cursor_confine_rect(%d,%d,%d,%d)\n",
            (int)param_1, (int)param_2, (int)param_3, (int)param_4);
  }
  DAT_00204838 = DAT_0020471c + param_1 + 1;
  DAT_0020470c = DAT_00204838;
  DAT_0020483c = DAT_00204748 + param_4 + 1;
  DAT_00204710 = DAT_0020483c;
  DAT_002047dc = (param_3 - DAT_0020471c) + -2;
  DAT_002047d8 = (param_2 - DAT_00204748) + 2;
  DAT_00204830 = DAT_002047dc;
  DAT_00204834 = DAT_002047d8;
  return;
}



void reset_cursor_confine_rect()

{
  DAT_0020483c = 0;
  DAT_00204838 = 0;
  DAT_00204710 = 0;
  DAT_0020470c = 0;
  DAT_002047dc = 0x13f;
  DAT_00204830 = 0x13f;
  DAT_002047d8 = 199;
  DAT_00204834 = 199;
  if (((ushort)DAT_00201b60 & 0xc9) != 0) {
    DAT_00204838 = DAT_0020471c + 0x35;
    DAT_002047dc = 0xdf - DAT_0020471c;
    DAT_0020483c = DAT_00204748 + 0x12;
    DAT_002047d8 = 0x87 - DAT_00204748;
  }
  if (getenv("UW_DEBUG_CURSORSHOW")) {
    fprintf(stderr, "[cursorbounds] reset_cursor_confine_rect() DAT_00201b60=0x%x narrowed=%d rect=(%d,%d)-(%d,%d)\n",
            (int)(ushort)DAT_00201b60, (((ushort)DAT_00201b60 & 0xc9) != 0),
            (int)DAT_00204838, (int)DAT_0020483c, (int)DAT_002047dc, (int)DAT_002047d8);
  }
  return;
}



int poll_mouse_event()

{
  short sVar1;

  if (getenv("UW_DEBUG_AUTOMAP_CURSOR")) fprintf(stderr, "[automap-cursor] poll_mouse_event ENTRY\n");
  update_mouse_state();
  if (DAT_00086968 == -1) {
    DAT_0020484c = 0;
    sVar1 = FUN_00058738();
  }
  else {
    sVar1 = FUN_00058738();
    if (sVar1 == 0) {
      DAT_0020484c = 1;
      sVar1 = DAT_00086968;
    }
    DAT_00086968 = -1;
  }
  DAT_00204850 = sVar1;
  if (sVar1 == 0) {
    sVar1 = -1;
  }
  return (int)sVar1;
}



undefined4 FUN_000578fc()

{
  return 0;
}



uint FUN_00057904(param_1)
int param_1;

{
  short sVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  
  uVar2 = (uint)DAT_0023c448;
  if (param_1 != 0) {
    uVar2 = FUN_000578fc();
  }
  uVar4 = uVar2 & 0xff;
  sVar1 = (short)uVar4;
  if (sVar1 == 0) {
    uVar4 = 0xffffffff;
  }
  else {
    DAT_00204868 = read_realtime_clock_units(uVar2);
    if ((uVar2 & 0x80) == 0) {
      if ((*DAT_0008794c != '\0') && (iVar3 = Ordinal_1417(sVar1,0x103), iVar3 != 0)) {
        if (DAT_0023c448 == 0x400) {
          sVar1 = Ordinal_1090(sVar1);
        }
        else {
          sVar1 = Ordinal_1091(sVar1);
        }
        uVar4 = (uint)sVar1;
      }
    }
    else if ((DAT_0023c448 & 0x400) != 0) {
      uVar4 = uVar4 | 0x400;
    }
    if (DAT_0023c448 == 0x200) {
      uVar4 = uVar4 | 0x200;
    }
    if (DAT_0023c448 == 0x100) {
      uVar4 = uVar4 | 0x100;
    }
    if (DAT_0023c448 == 0xd) {
      uVar4 = uVar4 | 0xd;
    }
  }
  return uVar4;
}



// was FUN_000579e4 -- pump input, then return the pending event code:
// the keyboard code latched in DAT_0023c448 (set by handle_keyboard_message),
// or a poll_mouse_event() code, or 0xffffffff if nothing is pending.
// param_1 == 0 clears DAT_0023c448 first (consume); != 0 leaves it (peek),
// which is what makes a held key repeat every frame.
uint poll_input_event(param_1)
int param_1;

{
  int iVar1;
  uint uVar2;
  undefined1 auStack_24 [28];
  
  if ((short)DAT_00201b60 == 4) {
    DAT_0023c448 = 0;
  }
  if (param_1 == 0) {
    DAT_0023c448 = 0;
  }
  iVar1 = Ordinal_864(auStack_24,0,0,0,1);
  if (getenv("UW_DEBUG_AUTOMAP_CURSOR")) fprintf(stderr, "[automap-cursor] poll_input_event: Ordinal_864=%d DAT_0023c448=0x%x\n", iVar1, (unsigned)DAT_0023c448);
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] poll_input_event(peek=%d): new_os_event(iVar1)=%d DAT_0023c448(before)=0x%x\n",
            param_1, iVar1, (unsigned)DAT_0023c448);
  if (getenv("UW_DEBUG_INPUTEVENT2")) fprintf(stderr, "[inputevent2] poll_input_event(%d): Ordinal_864=%d DAT_00201b60=%d DAT_002506ab=%d\n", param_1, iVar1, (int)(short)DAT_00201b60, (int)DAT_002506ab);
  if (iVar1 == 0) {
    uVar2 = 0xffffffff;
  }
  else {
    Ordinal_870(auStack_24);
    Ordinal_859(auStack_24);
    uVar2 = (uint)DAT_0023c448;
    if (getenv("UW_DEBUG_INPUTEVENT"))
      fprintf(stderr, "[inputevent] DAT_0023c448=0x%x\n", (unsigned int)DAT_0023c448);
    if (uVar2 == 0) {
      uVar2 = poll_mouse_event();
      if (getenv("UW_DEBUG_DOOR"))
        fprintf(stderr, "[door] poll_input_event: fell through to poll_mouse_event() = %u\n", uVar2);
    }
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] poll_input_event: resolved event code uVar2=%u (0x%x)\n", uVar2, uVar2);
  }
  return uVar2;
}



// was FUN_00057a78 -- poll_input_event(1): return the pending input event
// code without consuming it (used by the per-frame keybinding poll).
undefined4 peek_input_event()

{
  return poll_input_event(1);
}



int FUN_00057a80(param_1,param_2)
short param_1;
short param_2;

{
  int iVar1;
  short sVar2;
  
  iVar1 = (int)param_1;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 0xf;
  }
  sVar2 = (short)(iVar1 >> 4);
  iVar1 = Ordinal_2005(0x14,param_2 + -200);
  if (0 < iVar1) {
    sVar2 = (short)iVar1 * 0x14 + sVar2;
  }
  return (int)(char)(&DAT_00087650)[sVar2];
}



int FUN_00057af0(param_1,param_2,param_3,param_4,param_5)
undefined2 param_1;
undefined2 param_2;
undefined2 param_3;
undefined2 param_4;
undefined2 param_5;

{
  int iVar1;
  int iVar2;
  
  iVar2 = 0;
  do {
    if ((&DAT_002047b0)[iVar2] == 10000) break;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 0x14);
  iVar1 = (int)(short)iVar2;
  if (iVar1 == 0x14) {
    iVar2 = -1;
  }
  else {
    (&DAT_002047b0)[iVar1] = param_1;
    (&DAT_00204808)[iVar1] = param_3;
    (&DAT_002047e0)[iVar1] = param_4;
    (&DAT_00204750)[iVar1] = param_2;
    *(undefined2 *)(&DAT_00204720 + iVar1 * 2) = param_5;
    if (DAT_00204854 <= iVar1) {
      DAT_00204854 = (short)iVar2 + 1;
    }
    FUN_00057e54();
  }
  return iVar2;
}



void FUN_00057bb0(param_1)
short param_1;

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = (int)DAT_00204854;
  iVar1 = (int)DAT_00204854;
  iVar2 = (int)param_1;
  if (iVar2 < iVar1) {
    (&DAT_002047b0)[iVar2] = 10000;
    if (*(short *)(&DAT_00204720 + iVar2 * 2) == DAT_00204788) {
      DAT_00086970 = 10000;
    }
    if (iVar2 == iVar1 + -1) {
      iVar3 = iVar3 + -2;
      iVar1 = iVar3 * 0x10000 >> 0x10;
      while ((-1 < iVar1 && ((&DAT_002047b0)[iVar1] == 10000))) {
        iVar3 = (iVar1 + -1) * 0x10000 >> 0x10;
        iVar1 = iVar3;
      }
      DAT_00204854 = (short)iVar3 + 1;
    }
    FUN_00057e54();
  }
  return;
}



void FUN_00057c5c(param_1)
undefined4 param_1;

{
  int iVar1;
  
  if (DAT_00204858 != '\x03') {
    FUN_00057118();
    iVar1 = (int)DAT_00204858;
    DAT_00204858 = DAT_00204858 + '\x01';
    (&DAT_00204714)[iVar1] = DAT_00204704;
    FUN_00057dc0(param_1);
    cursor_show_idle_tick();
  }
  return;
}



void FUN_00057cac(param_1)
ushort param_1;

{
  int iVar1;
  
  if ((param_1 & 1) != 0) {
    FUN_00057118();
  }
  iVar1 = (int)DAT_00204858;
  DAT_00204858 = (char)(iVar1 + -1);
  if ((iVar1 + -1) * 0x1000000 >> 0x18 < 0) {
    DAT_00204714 = 0x106c;
    DAT_00204858 = '\0';
  }
  FUN_00057dc0((int)(short)(&DAT_00204714)[DAT_00204858]);
  FUN_00057e54();
  if ((param_1 & 2) != 0) {
    cursor_show_idle_tick();
  }
  return;
}



undefined4 FUN_00057d1c(param_1,param_2,param_3,param_4)
short param_1;
short param_2;
short param_3;
short param_4;

{
  int iVar1;
  
  iVar1 = (int)(short)(DAT_002047a4 + 1 >> 1);
  if ((iVar1 + param_2 <= (int)g_mouse_y) && ((int)g_mouse_y <= param_4 - iVar1)) {
    iVar1 = (int)(short)(DAT_00204784 + 1 >> 1);
    if ((param_1 - iVar1 <= (int)g_mouse_x) && ((int)g_mouse_x <= iVar1 + param_3)) {
      return 1;
    }
  }
  return 0;
}



// WARNING: Removing unreachable block (ram,0x00057df0)
// WARNING: Removing unreachable block (ram,0x00057e24)

void FUN_00057dc0(param_1)
undefined4 param_1;

{
  /* lookup_grtile_by_id's argument is dropped by Ghidra at this call site;
     forwarding param_1 matches the resolve_sprite_id_to_frame(param_1) call right
     above it and lookup_grtile_by_id's own g_grtile_registry-indexed-by-id shape. */
  char *iVar1;

  FUN_00056fe8();
  resolve_sprite_id_to_frame(param_1);
  /* Was unconditional `iVar1 = lookup_grtile_by_id(param_1);` -- lookup_grtile_by_id
     only covers ids below DAT_00202738 (the "still-compressed .GR
     resource entry, needs decoding" range); ids at or above it are
     already-resident raw sprites living directly in g_grtile_registry's own
     table (see blit_object_sprite_by_frame's own identical branch,
     which this function was missing). For those higher ids
     lookup_grtile_by_id's own table lookup misses (a *different* resource's
     entries live there) and falls back to its zeroed dummy glyph,
     silently handing back width=height=0 here. First found while
     chasing a user report of several items (a map, a bag, apple,
     bread) showing the wrong cursor icon or none at all when picked
     up -- the real cause of THAT turned out to be a separate bug
     (g_selected_object's own sign-extension, see
     swap_cursor_and_slot_item's fix comment) that was corrupting
     these objects' ids into the >= DAT_00202738 range in the first
     place; with that fixed these particular items no longer reach
     this branch at all. Kept anyway since it's a real, independently
     confirmed divergence from blit_object_sprite_by_frame's own
     already-correct behavior, for whatever legitimately-high-id items
     do reach here. */
  iVar1 = (int)(short)param_1 < (int)(uint)DAT_00202738 ?
          lookup_grtile_by_id(param_1) : (char *)g_grtile_registry[(int)(short)param_1];
  if (iVar1 == (char *)0x0) {
    /* Same "table slot never populated" fallback as
       blit_object_sprite_by_frame's own identical guard. */
    static char dummy_sprite[8];
    iVar1 = dummy_sprite;
  }
  DAT_00204784 = (ushort)*(byte *)(iVar1 + 1);
  DAT_002047a4 = (ushort)*(byte *)(iVar1 + 2);
  DAT_00204704 = (undefined2)param_1;
  DAT_0020471c = ((short)(ushort)*(byte *)(iVar1 + 1) >> 1) + -1;
  DAT_00204748 = (short)(ushort)*(byte *)(iVar1 + 2) >> 1;
  DAT_00204788 = DAT_00204704;
  if (DAT_00204844 != 0) {
    FUN_000584c0();
  }
  return;
}



void FUN_00057e54()

{
  int iVar1;
  int iVar2;
  
  if ((DAT_00204858 < '\x01') &&
     ((((DAT_00086970 == -1 || (g_mouse_x < DAT_00086970)) || (DAT_002047a8 < g_mouse_x)) ||
      ((DAT_0020478c < g_mouse_y || (g_mouse_y < DAT_002047ac)))))) {
    iVar2 = 0;
    if (0 < DAT_00204854) {
      iVar2 = 0;
      do {
        if ((((short)(&DAT_002047b0)[iVar2] <= g_mouse_x) &&
            (g_mouse_x <= (short)(&DAT_00204808)[iVar2])) &&
           ((g_mouse_y <= (short)(&DAT_00204750)[iVar2] &&
            ((short)(&DAT_002047e0)[iVar2] <= g_mouse_y)))) {
          iVar1 = (int)(short)iVar2;
          DAT_00086970 = (&DAT_002047b0)[iVar1];
          DAT_002047a8 = (&DAT_00204808)[iVar1];
          DAT_0020478c = (&DAT_00204750)[iVar1];
          DAT_002047ac = (&DAT_002047e0)[iVar1];
          FUN_00057dc0((int)*(short *)(&DAT_00204720 + iVar1 * 2));
          break;
        }
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < DAT_00204854);
    }
    if ((DAT_00086970 != -1) && ((short)iVar2 == DAT_00204854)) {
      DAT_00086970 = -1;
      FUN_00057dc0(0x106c);
    }
  }
  return;
}



void FUN_00058438(param_1)
short param_1;

{
  DAT_0020485c = (int)param_1;
  update_mouse_state();
  DAT_0020485c = 0;
  if (DAT_0023c63c == 0) {
    DAT_0008696e = 0;
  }
  else if (DAT_00086968 == -1) {
    DAT_00086968 = DAT_0023c63c;
    DAT_0008696a = g_mouse_x;
    DAT_0008696c = g_mouse_y;
  }
  return;
}



void FUN_000584c0()

{
  if (getenv("UW_DEBUG_CURSORSHOW")) {
    fprintf(stderr, "[cursorsave] entry DAT_00204844=%d sprite=%d mouse=(%d,%d) size=(%d,%d)\n",
            (int)DAT_00204844, (int)DAT_00204788, (int)g_mouse_x, (int)g_mouse_y,
            (int)DAT_00204784, (int)DAT_002047a4);
  }
  DAT_00204848 = 1;
  set_draw_color(0x14);
  rect_fill_or_save_restore(g_mouse_x - DAT_0020471c,g_mouse_y - DAT_00204748,
               ((int)DAT_00204784 - (int)DAT_0020471c) + (int)g_mouse_x + 1,
               ((int)DAT_002047a4 - (int)DAT_00204748) + (int)g_mouse_y + 1);
  DAT_00204844 = 1;
  return;
}



void draw_idle_mouse_cursor()

{
  int _dbg_show = getenv("UW_DEBUG_CURSORSHOW") != NULL;
  if (_dbg_show) {
    fprintf(stderr, "[cursorshow] entry selected=%p mode=%d holdstate=%d DAT_00204844=%d depth=%d mouse=(%d,%d)\n",
            (void *)g_selected_object, (int)g_cursor_mode, (int)g_cursor_holding_state,
            (int)DAT_00204844, (int)DAT_00204840, (int)g_mouse_x, (int)g_mouse_y);
  }
  if (g_selected_object == 0) {
    /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested): the real
       Pocket PC binary only shows this idle cursor sprite while
       DAT_0023c63c (the left-button-currently-held flag, see
       handle_mouse_message's own comment) is set, or DAT_000bbef4 overrides it
       (draw_automap_screen/the note editor force it to 1) -- a
       stylus/touchscreen design where there's no persistent hover
       cursor, only a transient indicator while actively touching the
       screen. On a real mouse-driven desktop port the cursor should
       always be visible while hovering, not just while a button is
       held, so this gate is skipped when UW_ALWAYS_SHOW_CURSOR=1 rather
       than ported as-is (off by default -- see uw_always_show_cursor's
       own comment on the frame-rate cost of drawing every idle frame).
       Confirmed via live tracing (UW_DEBUG_CURSORSHOW) that this WAS
       the reason plain mouse movement showed no cursor at all outside
       automap (where DAT_000bbef4 happened to already force it) --
       this is the second, deliberate half of that same investigation;
       DAT_000868dc's own missing initializer (see its own fix comment
       just below) was the other, genuine bug half. */
    if ((DAT_0023c63c == 0) && (DAT_000bbef4 == 0) && !uw_always_show_cursor()) {
      if (_dbg_show) fprintf(stderr, "[cursorshow] early-return (no button/mode)\n");
      return;
    }
    if (DAT_000868dc != 7) {
      if (_dbg_show) fprintf(stderr, "[cursorshow] early-return (DAT_000868dc=%d != 7)\n", (int)DAT_000868dc);
      return;
    }
    if ((((ushort)DAT_00201b60 & 4) != 0) && (g_cursor_mode == 3)) {
      if (_dbg_show) fprintf(stderr, "[cursorshow] early-return (bit4+mode3)\n");
      return;
    }
    if ((((ushort)DAT_00201b60 & 2) != 0) && (DAT_0023c63c != 0)) {
      if (_dbg_show) fprintf(stderr, "[cursorshow] early-return (bit2+button)\n");
      return;
    }
    /* DEVIATION FROM AUTHENTIC BEHAVIOR (4th of this round, see the matching
       comments above and in cursor_show_idle_tick/update_mouse_state's own tail):
       the original confines the drawn cursor to a specific UI-mode rectangle
       (DAT_00204838/DAT_0020483c/DAT_002047dc/DAT_002047d8, only enforced
       when DAT_00201b60's bits 0,3,6,7 are set) rather than the full screen
       -- built for a specific Pocket PC touchscreen panel's own valid-tap
       area, not a general on-screen-bounds safety check: g_mouse_x/g_mouse_y
       are already separately clamped to the real screen bounds elsewhere in
       update_mouse_state (DAT_0020470c/DAT_00204830 and DAT_00204710/
       DAT_00204834), so skipping this narrower confinement cannot draw the
       cursor off-screen. Confirmed via live tracing (UW_DEBUG_CURSORSHOW)
       that this rectangle also drifts from what reset_cursor_confine_rect last set it to
       (e.g. (52,18)-(224,135) right after chargen, silently becoming
       (52,18)-(109,109) by the first real mouse move with no traced call to
       either bound-setter in between) -- a pre-existing, unrelated wild-write
       bug elsewhere (init_cursor_subsystem's own `(&DAT_002047b0)[iVar2] = 10000` loop
       treats a lone scalar as a 20-entry array, the same "lone scalar treated
       as a real array" bug class fixed repeatedly elsewhere in this project)
       corrupts this rectangle in a way that made the cursor disappear
       entirely during plain dungeon-view mouse movement on a real desktop
       mouse. Skipped only when UW_ALWAYS_SHOW_CURSOR=1, since a
       Pocket-PC-panel-specific tap-area clamp isn't meaningful on a desktop
       port anyway; left enforced by default rather than chasing the
       separate corruption bug. */
    if ((((ushort)DAT_00201b60 & 0xc9) != 0) && !uw_always_show_cursor()) {
      if (g_mouse_x < DAT_00204838) {
        if (_dbg_show) fprintf(stderr, "[cursorshow] early-return (out of bounds x<)\n");
        return;
      }
      if (g_mouse_y < DAT_0020483c) {
        if (_dbg_show) fprintf(stderr, "[cursorshow] early-return (out of bounds y<)\n");
        return;
      }
      if (DAT_002047dc < g_mouse_x) {
        if (_dbg_show) fprintf(stderr, "[cursorshow] early-return (out of bounds x>)\n");
        return;
      }
      if (DAT_002047d8 < g_mouse_y) {
        if (_dbg_show) fprintf(stderr, "[cursorshow] early-return (out of bounds y>)\n");
        return;
      }
    }
    if (g_cursor_mode != 0) {
      if (_dbg_show) fprintf(stderr, "[cursorshow] SKIP-SAVE path (mode!=0), drawing sprite=%d without a save\n", (int)DAT_00204788);
      goto LAB_00058674;
    }
  }
  if (_dbg_show) fprintf(stderr, "[cursorshow] normal path: saving then drawing sprite=%d\n", (int)DAT_00204788);
  FUN_000584c0();
LAB_00058674:
  g_blit_transparent_mode = 1;
  g_force_flush = 1;
  draw_sprite_by_id((int)DAT_00204788,((int)g_mouse_x - (int)DAT_0020471c) * 0x10000 >> 0x10,
               ((int)g_mouse_y - (int)DAT_00204748) * 0x10000 >> 0x10,(int)DAT_002047a4,
               DAT_00204784);
  flush_dirty_rect_to_display(1);
  g_blit_transparent_mode = 0;
  g_force_flush = 0;
  set_draw_color(0);
  return;
}



void FUN_00058734()

{
  return;
}



uint FUN_00058738()

{
  uint uVar1;
  
  uVar1 = 0;
  if ((DAT_000876c4 != 0) && (uVar1 = (uint)DAT_0023c63c, DAT_0023c63c == 0)) {
    if (DAT_002506aa != '\0') {
      uVar1 = 1;
    }
    if (DAT_002506ab != '\0') {
      uVar1 = uVar1 | 2;
    }
  }
  return uVar1;
}



// was FUN_0005a630 -- map a raw sweep_collision_flags() bitmask into the
// small locomotion-state code (1/2/4/8/0x10/0x20) set_locomotion_state
// reads from the movement block's +0x28 byte to pick walk/swim/fly/fall
// animation and physics. Always called right after sweep_collision_flags()
// with its return value (both call sites had this dropped by Ghidra --
// fixed this session, see [[water-wading-and-wall-slide-findings]]).
uint collision_flags_to_locomotion_code(param_1)
short param_1;

{
  uint uVar1;
  
  uVar1 = (uint)param_1;
  if ((uVar1 & 0x1000) == 0) {
    if ((uVar1 & 4) == 0) {
      if ((uVar1 & 0x88) == 0) {
        if ((uVar1 & 0x10) == 0) {
          if ((uVar1 & 0x20) == 0) {
            uVar1 = 8;
          }
          else {
            uVar1 = 4;
          }
        }
        else {
          uVar1 = 2;
        }
      }
      else {
        uVar1 = 1;
      }
    }
    else if (((DAT_002049d2 == 1) && ((uVar1 & 3) == 1)) && ((uVar1 & 0x68) != 0)) {
      uVar1 = 0x20;
    }
    else {
      uVar1 = 1 << (uVar1 & 3) & 0xff;
    }
  }
  else {
    uVar1 = 0x10;
  }
  return uVar1;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0005a6bc -- compute blocked/step-up flags for the sweep's current sub-position
uint sweep_collision_flags()

{
  ushort uVar1;
  bool bVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  bool bVar7;
  bool bVar8;
  ushort local_3c;
  
  bVar2 = false;
  bVar7 = (DAT_002048bc[2] & 0x80) == 0;
  uVar1 = *DAT_002048bc;
  DAT_00204870 = 0;
  /* Sync the collision working block's X/Y (DAT_00202c6c[+0/+2], i.e.
     DAT_002049c8/ca) to the sweep's live sub-tile position before the tile
     lookups in collision_build_height_field / collision_height_envelope.  sweep_init_position copies the
     heading/height fields into this block but never the position, and Ghidra
     dropped whatever kept it current -- so DAT_002049c8/ca sat at (0,0) and
     every collision test hit tile (0,0), letting the player walk straight
     through solid walls and off the map.  g_sweep_foot_pos is the live position
     in the same 1/8-tile units these readers expect (>>3 -> tile).

     That original fix stopped at X/Y -- offset+4 (DAT_002049cc, see its own
     comment at the struct declaration) is the position triplet's missing
     third field, "the player's current sub-tile height." Left at 0 (its
     static-init value, never written on this global instance), it made
     collision_corner_flags's "(step_limit + current_Z) < sampled_floor_
     height" walkable/auto-stick test compare every real floor height
     against a Z of 0 -- always true, so the auto-stick branch (which sets
     the "walkable" bit 4) could never be reached on any slope, forcing
     every ramp tile through the block/fall-arm path instead of the
     snap-resolver. Confirmed live via UW_DEBUG_RAMP's [ramp-corner-flags]
     trace: off4=0 on every call throughout a ramp descent, while the real
     sampled floor height tracked the slope correctly (~95, ~94, ~93...).
     g_sweep_foot_pos[2] is footz itself (*(short*)((char*)g_sweep_foot_pos+4)),
     already in the same raw units collision_corner_flags compares against --
     no additional scaling needed, matching X/Y's own direct assignment. */
  DAT_002049c8 = g_sweep_foot_pos[0];
  DAT_002049ca = g_sweep_foot_pos[1];
  DAT_002049cc = g_sweep_foot_pos[2];
  if (tilemap_lookup((short)((int)g_sweep_foot_pos[0] >> 3),(short)((int)g_sweep_foot_pos[1] >> 3)) ==
      (void *)0x0) {
    /* stepped outside the 64x64 map -- the border is always solid; report a
       hard block so sweep_apply_collision backs the move out. (Also stops
       collision_build_height_field dereferencing a NULL tile pointer.) */
    return 0xffff8000;
  }
  if (getenv("UW_DEBUG_RAMP"))
    fprintf(stderr, "[ramp-ptr-check] DAT_00202c6c=%p &DAT_002049c8=%p match=%d\n",
            (void *)DAT_00202c6c, (void *)&DAT_002049c8, (int)(DAT_00202c6c == (byte *)&DAT_002049c8));
  collision_build_height_field(*(undefined1 *)(DAT_00204874 + 0x27));
  if (getenv("UW_DEBUG_RAMP"))
    fprintf(stderr, "[ramp-post-buildheight] d8=%d d9=%d\n", (int)DAT_002049d8, (int)DAT_002049d9);
  collision_height_envelope(0,0);
  if (getenv("UW_DEBUG_RAMP"))
    fprintf(stderr, "[ramp-post-envelope] d8=%d d9=%d\n", (int)DAT_002049d8, (int)DAT_002049d9);
  reticle_object_pick(0);
  if (getenv("UW_DEBUG_RAMP"))
    fprintf(stderr, "[ramp-post-reticle] d8=%d d9=%d\n", (int)DAT_002049d8, (int)DAT_002049d9);
  local_3c = DAT_002049d6 | DAT_002049d4;
  bVar8 = (local_3c & DAT_002048bc[2]) == 0;
  if ((DAT_002049dc != '\0') &&
     (iVar6 = (int)DAT_002049de, iVar6 < (int)((uint)DAT_002049dd + (int)DAT_002049de))) {
    do {
      uVar3 = FUN_000546c4(iVar6,(int)DAT_002049d2);
      if ((uVar3 & 4) != 0) {
        local_3c = local_3c | 0x400;
      }
      if ((uVar3 & 0x18) != 0) {
        if ((uVar3 & 0x10) == 0) {
          return (int)(short)local_3c | 0xffff8000;
        }
        return (int)(short)local_3c | 0x4000;
      }
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < (int)((uint)DAT_002049dd + (int)DAT_002049de));
  }
  // PHYSICS: floor collision -- compare the foot Z against the destination
  // tile's floor height _DAT_0008699b to decide level / step-up / step-down / fall
  iVar4 = (int)*(short *)((char *)g_sweep_foot_pos + 4);
  iVar6 = (int)_DAT_0008699b;
  iVar5 = (int)DAT_00086998;
  if (getenv("UW_DEBUG_JUMP"))
    fprintf(stderr, "[collision-flags] iVar4(footz)=%d iVar6(floorz)=%d iVar5(slot)=%d bVar7=%d bVar8=%d local_3c=0x%x DAT_00086990=%d DAT_00086996=%d\n",
            iVar4, iVar6, iVar5, (int)bVar7, (int)bVar8, (unsigned)local_3c,
            (int)DAT_00086990, (int)DAT_00086996);
  if (iVar4 == iVar6) {
    if (((iVar5 != -1) && (((&DAT_00202c93)[_DAT_00086999 * 0xd] & 2) == 2)) && (bVar7)) {
      local_3c = local_3c & 0xfffb | 0x80;
    }
  }
  else {
    if ((iVar5 == -1) && (bVar8)) {
      // PHYSICS: floor step -- if the height change is within the step limit
      // (byte 0x27), OR the tile is a walkable auto-stick floor (DAT_002049d4 & 4)
      // and no vertical motion is active, snap straight to it instead of falling.
      //
      // The `iVar4 - iVar6 <= step limit` guard on the auto-stick clause is
      // added: without it, a walk off a real ledge onto a walkable floor far
      // below still auto-sticks (foot Z snapped down in one tick). Restricting
      // the auto-stick to drops within the step-down limit lets a bigger drop
      // fall through to the "blocked" resolution below, where sweep_apply_collision
      // arms a gravity fall (+0x10 = -4) and sweep_step_vertical plays it out over
      // several ticks, ending in sweep_land_on_surface. An upward step
      // (iVar4 - iVar6 < 0) always satisfies the guard, so auto-stick up a slope
      // is unchanged.
      uVar3 = iVar4 - iVar6 >> 0x1f;
      if (getenv("UW_DEBUG_JUMP"))
        fprintf(stderr, "[jump-collision] foot_z=%d floor_z=%d diff=%d step_limit=%d fallflag(0x10)=%d vvel(0xa)=%d\n",
                iVar4, iVar6, iVar4 - iVar6, (int)(uint)*(byte *)(DAT_00204874 + 0x27),
                (int)*(short *)(DAT_00204874 + 0x10), (int)*(short *)(DAT_00204874 + 0xa));
      /* The "within step limit" clause below was unconditional -- unlike
         the auto-stick clause right next to it, which correctly requires
         g_vertical_velocity==0 (offset 0xa, "no vertical motion is
         active" per the comment above) before snapping. A jump's whole
         ascent (and the tail of its descent) passes through foot-Z
         values within a few units of the floor's while g_fall_accel
         (offset 0x10) is nonzero and g_vertical_velocity is large and
         real -- confirmed live via UW_DEBUG_JUMP: foot_z=98 floor_z=96
         diff=2 step_limit=8, comfortably "within limit", while
         g_fall_accel=-4 and g_vertical_velocity=267, i.e. clearly
         mid-jump, not standing on a small ledge. That silently snapped
         the player straight back onto the floor a few ticks into every
         jump, before it could climb high enough to look like it left
         the ground. Add the same g_fall_accel==0 gate here: no real
         gravity arc in progress (matches the comment's own claim that
         ordinary small steps involve "no gravity" at all, so this
         should never fire while a real jump/fall is live) means this is
         genuinely just an ordinary walked step, safe to snap instantly. */
      if ((*(short *)(DAT_00204874 + 0x10) == 0 &&
           (int)((iVar4 - iVar6 ^ uVar3) - uVar3) <= (int)(uint)*(byte *)(DAT_00204874 + 0x27)) ||
         (((((*(short *)(DAT_00204874 + 10) == 0 && ((DAT_002049d6 & 0x800) == 0)) &&
            ((DAT_002049d4 & 4) != 0)) &&
           (iVar4 - iVar6 <= (int)(uint)*(byte *)(DAT_00204874 + 0x27)))))) {
LAB_0005a970:
        if ((DAT_00204878 != 0) && ((uVar1 & 0x1000) == 0)) {
          bVar2 = true;
          if (CONCAT11(DAT_000869a0,DAT_0008699f) <= iVar6) {
            local_3c = local_3c & 0xfeff;
          }
          // PHYSICS: ceiling clearance -- target floor + player height (byte 0x26)
          // must fit under the ceiling clearance value; if not, treat as a wall
          iVar6 = iVar6 + (uint)*(byte *)(DAT_00204874 + 0x26);
          if (iVar6 < 0x80) {
            if ((iVar5 != -1) || (iVar6 <= CONCAT11(DAT_000869a0,DAT_0008699f))) {
              if ((((local_3c & 0x400) != 0) || (iVar5 == -1)) ||
                 ((((&DAT_00202c93)[_DAT_00086999 * 0xd] & 2) != 0 && (bVar7)))) {
                DAT_00204870 = 1;
                // PHYSICS: floor collision -- step resolved: snap the foot Z onto
                // this tile's floor in a single tick (no gravity for small steps)
                *(short *)((char *)g_sweep_foot_pos + 4) = _DAT_0008699b;
                uVar3 = (int)((int)_DAT_0008699b - (uint)DAT_002049d8) >> 0x1f;
                if ((int)(uint)*(byte *)(DAT_00204874 + 0x25) <
                    (int)(((int)_DAT_0008699b - (uint)DAT_002049d8 ^ uVar3) - uVar3)) {
                  local_3c = local_3c & 0xfffb;
                }
                else {
                  local_3c = local_3c | 4;
                }
              }
              else {
                bVar2 = false;
              }
              goto LAB_0005ab5c;
            }
            local_3c = local_3c | 0x400;
          }
          else {
            local_3c = local_3c | 0x200;
          }
          DAT_00204870 = 1;
          goto LAB_0005abe4;
        }
      }
    }
    else if ((bVar7) &&
            ((((&DAT_00202c93)[_DAT_00086999 * 0xd] & 2) == 2 &&
             (uVar3 = (int)(iVar4 - (uint)(byte)(&DAT_00202c38)[iVar5 * 6]) >> 0x1f,
             (int)((iVar4 - (uint)(byte)(&DAT_00202c38)[iVar5 * 6] ^ uVar3) - uVar3) <=
             (int)(uint)*(byte *)(DAT_00204874 + 0x27))))) {
      local_3c = local_3c | 0x80;
      goto LAB_0005a970;
    }
    bVar2 = false;
    if (iVar4 < (int)(uint)DAT_002049d9) {
      local_3c = local_3c | 0x100;
    }
  }
LAB_0005ab5c:
  if ((DAT_00204870 != 0) && (bVar2)) {
    FUN_00051dd0();
    local_3c = local_3c & 0xfbff;
    if (DAT_002049dd != 0) {
      iVar6 = 0;
      do {
        uVar3 = FUN_000546c4(iVar6,(int)DAT_002049d2);
        if ((uVar3 & 4) != 0) {
          local_3c = local_3c | 0x400;
        }
        iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
      } while (iVar6 < (int)(uint)DAT_002049dd);
    }
  }
LAB_0005abe4:
  if ((((local_3c & 0x80) != 0) && (bVar7)) &&
     ((((&DAT_00202c3a)[DAT_00086998 * 6] & 0x10) != 0 || ((DAT_002049d4 & 4) != 0)))) {
    local_3c = local_3c & 0xf7ff;
  }
  uVar1 = local_3c;
  if (getenv("UW_DEBUG_RAMP"))
    fprintf(stderr, "[ramp-pre-fallback] iVar4=%d iVar6=%d local_3c=0x%x DAT_002049d6=0x%x DAT_002049d4=0x%x DAT_002049d8=%d DAT_002049d9=%d bVar7=%d bVar8=%d DAT_00204878=%d vvel=%d fallaccel=%d\n",
            iVar4, iVar6, (unsigned)local_3c, (unsigned)DAT_002049d6, (unsigned)DAT_002049d4,
            (int)DAT_002049d8, (int)DAT_002049d9,
            (int)bVar7, (int)bVar8, (int)DAT_00204878, (int)*(short *)(DAT_00204874 + 10),
            (int)*(short *)(DAT_00204874 + 0x10));
  // PHYSICS: no-feature fallback snap -- pull the foot down onto the flat floor
  // when there is no slope/step feature. Also suppressed once a gravity fall is
  // armed (+0x10) so the fall integrator owns the descent.
  if ((((((DAT_002049d6 & 0x100) != 0) && (bVar8)) && (*(short *)(DAT_00204874 + 10) == 0)) &&
      (*(short *)(DAT_00204874 + 0x10) == 0)) &&
     ((int)(uint)DAT_002049d9 <=
      (int)((uint)*(byte *)(DAT_00204874 + 0x27) + (int)*(short *)((char *)g_sweep_foot_pos + 4)))) {
    *(ushort *)((char *)g_sweep_foot_pos + 4) = (ushort)DAT_002049d9;
    uVar1 = local_3c & 0xfeff | 4;
    if (*(ushort *)((char *)g_sweep_foot_pos + 4) != (ushort)DAT_002049d8) {
      uVar1 = local_3c & 0xfefb;
    }
  }
  local_3c = uVar1;
  // PHYSICS: wall collision -- no floor/step bit resolved this move: mark it
  // blocked (0x1000) so sweep_apply_collision stops the horizontal advance
  if ((local_3c & 0xfc) == 0) {
    local_3c = local_3c | 0x1000;
  }
  // PHYSICS: wall collision -- also blocked if the foot sits far enough above
  // this tile's floor that it is a wall face, not a step
  if (((local_3c & 0x80) == 0) &&
     ((int)(uint)DAT_002049d9 <
      (int)((int)*(short *)((char *)g_sweep_foot_pos + 4) - (uint)*(byte *)(DAT_00204874 + 0x25)))) {
    local_3c = local_3c | 0x1000;
  }
  return (int)(short)local_3c;
}



undefined4 FUN_0005aea0(param_1,param_2)
undefined1 * param_1;
byte * param_2;

{
  ushort uVar1;
  ushort *puVar2;
  uint uVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  
  iVar6 = 0;
  if (DAT_002049dd != 0) {
    do {
      puVar2 = (ushort *)resolve_object_link(&DAT_00202c3a + (iVar6 + DAT_002049de) * 6);
      uVar1 = *puVar2;
      uVar3 = (uint)(byte)(&DAT_00202c3c)[(iVar6 + DAT_002049de) * 6] +
              ((int)DAT_002049c8 >> 3 & 0xffU) & 0x3f;
      *param_1 = (char)uVar3;
      iVar5 = (int)*(short *)(&DAT_00202c3c + (iVar6 + DAT_002049de) * 6) -
              ((int)((uVar3 - (((int)DAT_002049c8 << 0x10) >> 0x13)) * 0x10000) >> 0x10);
      if (iVar5 < 0) {
        iVar5 = iVar5 + 0x3f;
      }
      *param_2 = (char)(iVar5 >> 6) + (char)(DAT_002049ca >> 3) & 0x3f;
      if (((uVar1 & 0x1f0) == 0x140) && ((uVar1 & 0xf) < 8)) {
        uVar4 = resolve_object_link(&DAT_00202c3a + ((int)DAT_002049de + (int)(short)iVar6) * 6);
        return uVar4;
      }
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < (int)(uint)DAT_002049dd);
  }
  return 0;
}



undefined4 FUN_0005b010()

{
  undefined4 uVar1;
  
  if (DAT_002049dd == '\0') {
    uVar1 = 0;
  }
  else {
    uVar1 = resolve_object_link(&DAT_00202c3a + DAT_002049de * 6);
  }
  return uVar1;
}



undefined4 FUN_0005b298(param_1,param_2)
/* .ark handle-struct pointer -- was `undefined4`, truncating it before
   write_archive_entry. */
undefined1 * param_1;
int param_2;

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 *puVar5;
  undefined2 *puVar6;
  /* Was three separate locals (local_8c[48], local_2c[10], local_18[6])
     -- a stack-slot-splitting artifact (same bug class as
     stack0xffdc2e30_buf/acStack_528 in load_game_from_slot, or
     acStack_86af8/etc in FUN_0005b36c right below this function): real
     ARM disassembly (0x5b29c: `sub sp,sp,#0x80`) allocates ONE 128-byte
     (64-undefined2) buffer, and this function's own writes to
     `local_8c[iVar2+0x30]` (indices 48-57) and `local_8c[iVar2+0x3a]`
     (indices 58-60) already prove it -- those are past a real 48-element
     array's bounds. With the split, those writes silently corrupted
     local_2c/local_18's stack space at every call; on this recompile
     (stack-protector enabled) that finally tripped `__stack_chk_fail`
     and aborted -- confirmed via lldb, never hit before because nothing
     reached this function successfully until the write-path bugs above
     it (Ordinal_1407, open_level_archive's read-only handle,
     write_archive_entry/scheduler_save's own pointer-truncation and fabricated-
     return-0 bugs) were fixed. One properly-sized buffer instead. */
  undefined2 local_8c [64];

  iVar2 = 0;
  do {
    puVar5 = &DAT_0023ae58 + iVar2;
    puVar6 = local_8c + iVar2;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    *puVar6 = *puVar5;
  } while (iVar2 < 0x30);
  iVar2 = 0;
  do {
    puVar6 = &DAT_0023adb8 + iVar2;
    iVar3 = iVar2 + 0x30;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    local_8c[iVar3] = *puVar6;
  } while (iVar2 < 10);
  iVar2 = 0;
  do {
    iVar3 = iVar2 * 2;
    iVar1 = iVar2 * 2;
    iVar4 = iVar2 + 0x3a;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    local_8c[iVar4] = CONCAT11((&DAT_0023b841)[iVar3],(&DAT_0023b840)[iVar1]);
  } while (iVar2 < 3);
  /* Was `write_archive_entry(...); return 0;` -- a fabricated `return 0`
     masking a real result, same bug class as scheduler_save right above
     this function. Real disassembly (0x5b354-0x5b35c) shows a plain
     `bl 0x15b94` with no instruction overwriting r0 before the function
     returns -- r0 (write_archive_entry's own return value) falls straight
     through as this function's return value, it's never hardcoded to 0. */
  return write_archive_entry(param_1,param_2 + 0x11,local_8c,0x7a);
}



void FUN_0005b36c()

{
  char *wptr_42257;
  char *wptr_42265;
  char *wptr_42273;
  char *wptr_42281;
  char *stack0xffdc3244_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  short local_11c [4];
  char acStack_114 [260];
  /* acStack_86af8 / _86af0 / _86ae8 / _86ae0 were four separate stack
     locals (8, 8, 8, 551364 bytes), but every use is `<base> + iVar3`
     where iVar3 is strlen(acStack_114) after the "\DATA\" prefix -- i.e.
     the code appends each texture filename at path + strlen(path). They
     are all really acStack_114 (the path buffer); Ghidra split the
     `+ iVar3` writes onto per-file base names. Same "one buffer, many
     Ghidra names" bug as build_view_matrix's matrices. With them separate,
     the filename suffix was written to a stray 8-byte local, so
     load_texture_arena opened the bare "...\DATA\" directory and the whole
     texture / shade / colour-light arena (DAT_002049e0) stayed zero --
     which is why the (now-running) 3D span rasterizer drew nothing.
     Fixed by pointing all four `+ iVar3` writes at acStack_114. */

  DAT_0023ae38 = &DAT_002049e0;
  Ordinal_1047(acStack_114,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3244_ptr = acStack_114;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_114,s__DATA__00085970);
  iVar3 = Ordinal_1068(acStack_114);
  pcVar2 = &DAT_000869e4;
    wptr_42257 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42257 = cVar1; wptr_42257 = wptr_42257 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  local_11c[0] = DAT_0023adb0;
  load_texture_arena(acStack_114,&DAT_0023ae58,local_11c,DAT_0023ae38);
  pcVar2 = &DAT_000869dc;
    wptr_42265 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42265 = cVar1; wptr_42265 = wptr_42265 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae34 = DAT_0023ae38 + DAT_0023adb0 * 0x1000;
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae34);
  pcVar2 = &DAT_000869d4;
    wptr_42273 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42273 = cVar1; wptr_42273 = wptr_42273 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae3c = DAT_0023ae34 + DAT_0023aeb8 * 0x400;
  load_texture_arena(acStack_114,&DAT_0023ae58,local_11c,DAT_0023ae3c);
  pcVar2 = &DAT_000869cc;
    wptr_42281 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42281 = cVar1; wptr_42281 = wptr_42281 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae30 = DAT_0023ae3c + local_11c[0] * 0x100;
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae30);
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] FUN_0005b36c: about to call load_door_frames (door loader), DAT_00202734=%d\n", (int)DAT_00202734);
  load_door_frames();
  return;
}



void FUN_0005b758(param_1,param_2,param_3,param_4)
undefined4 param_1;
int param_2;
undefined4 param_3;
int param_4;

{
  g_dungeon_view_active = 0;
  DAT_0023b020 = (undefined2)param_3;
  DAT_0023aed4 = (undefined2)param_4;
  /* HACK: was `FUN_000129d4(param_1);` -- dropped 2 of 3 arguments,
     the same class of bug fixed repeatedly elsewhere in this file.
     Nothing between this function's own entry and this call touches
     param_2/param_3, so on ARM's register-passthrough calling
     convention they're still sitting in r1/r2 unchanged -- this
     function's own first 3 parameters are the obviously-intended
     arguments. The callee's return value is discarded either way (see
     compute_view_y_bound's own comment on why this fix has no
     observable behavioral effect). */
  compute_view_y_bound(param_1,param_2,param_3);
  FUN_00057188(param_1,param_2,param_3,param_4);
  register_game_view_interact_zones(param_1,param_2 + param_4 + -1,param_3,param_4);
  if ((*(ushort *)(DAT_00085a6c + 8) & 8) == 0) {
    if ((*(ushort *)(DAT_00085a6c + 8) & 1) == 0) {
      DAT_0023aed8 = 0x7ed2;
    }
    else {
      g_dungeon_view_active = 1;
      DAT_0023aed8 = 25000;
    }
  }
  else {
    DAT_0023aed8 = 0x6062;
  }
  return;
}



void FUN_0005b828()

{
  reset_viewport_to_fullscreen();
  load_3d_object_models();
  if (getenv("UW_DUMP_MODEL_RAW")) {
    unsigned char *_b = (unsigned char *)&DAT_00123ccc;
    int _k;
    int _npts = *(int *)_b;
    int _nparts = *(int *)(_b + 4);
    fprintf(stderr, "[modelraw] npts=%d nparts=%d\n", _npts, _nparts);
    for (_k = 0; _k < _npts; _k++) {
      float x = *(float *)(_b + 8 + _k*0xc);
      float y = *(float *)(_b + 8 + _k*0xc + 4);
      float z = *(float *)(_b + 8 + _k*0xc + 8);
      fprintf(stderr, "[modelraw] pt[%d] = (%g,%g,%g)\n", _k, x, y, z);
    }
    for (_k = 0; _k < _nparts && _k < 40; _k++) {
      int base = 0xc14 + _k*0x60;
      int vcount = *(int *)(_b + base);
      fprintf(stderr, "[modelraw] part[%d] vcount=%d verts=", _k, vcount);
      int j;
      for (j = 0; j < vcount && j < 8; j++) {
        fprintf(stderr, "%d ", *(int *)(_b + base + 4 + j*4));
      }
      fprintf(stderr, "\n");
    }
  }
  init_glyph_width_table();
  init_draw_command_cursor();
  save_draw_command_cursor();
  DAT_0023aed0 = DAT_00110fc0;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  build_visibility_light_grid(8);
  DAT_0023b49c = DAT_00250650;
  return;
}



void FUN_0005bac0()

{
  draw_command_list_rewind();
  emit_hud_draw_commands();
  finalize_glyph_draw_command(0xa0);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  set_viewport_clip_rect(0,0,DAT_0023b020 + -1,DAT_0023aed4 + -1);
  set_viewport_clip_rect(0x34,0x13,DAT_0023b020 + 0x33,DAT_0023aed4 + 0x12);
  render_dungeon_view();
  set_viewport_clip_rect(0,0,0x13f,199);
  return;
}



void FUN_0005d2b0()

{
  uint uVar1;
  int iVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;
  
  bVar3 = false;
  DAT_00086b2c = 0;
  uVar1 = (uint)(short)(ushort)(*(byte *)(DAT_00086df8 + 0xb5) >> 4);
  bVar4 = false;
  if (uVar1 != 0) {
    bVar6 = SBORROW4(uVar1,1);
    iVar2 = uVar1 - 1;
    bVar5 = uVar1 == 1;
    bVar3 = 1 < uVar1;
    if (1 < uVar1) {
      bVar6 = SBORROW4(uVar1,2);
      iVar2 = uVar1 - 2;
      bVar5 = uVar1 == 2;
    }
    DAT_00086b2c = 1;
    if (!bVar5 && iVar2 < 0 == bVar6) {
      bVar4 = true;
    }
  }
  if (bVar4) {
    DAT_00086b44 = emit_floor_texture_select;
  }
  else {
    DAT_00086b44 = FUN_0005dd84;
  }
  if (bVar3) {
    DAT_00086b3c = emit_floor_texture_select;
  }
  else {
    DAT_00086b3c = FUN_0005dd84;
  }
  DAT_00086b30 = 1;
  return;
}



/* Compute the automap reveal byte for a just-explored tile.

   tile_rec points at this tile's 4-byte record. Bits:
     0-3  shape nibble  (tile type: 0 solid, 1 open, 2-5 diag, 6-9 slope)
     4-5  fill style, consumed by draw_automap_cell:
            0 = shaded "explored" floor
            1/2 = blue water dither
            3 = leave parchment (floor not painted at all)

   Built as DAT_0023ae40[floor_tex_index] | shape, matching the
   Pocket-PC disasm.  DAT_0023ae40 is the per-level floor-texture
   property table (loaded from the .ark): water textures read 0x10
   there (-> fill style 1 -> blue), everything else reads 0 (-> fill
   style 0 -> shaded floor).  floor-tex index is tile-record byte 1
   bits 2-5.  The simple ring-walk was instead using DAT_00086bf0[type],
   which has no floor-texture info and so couldn't tell water from
   normal floor.  (The floor being *too dark* vs the reference is a
   separate issue, fixed in draw_automap_cell by using a 25% darken
   for the fill instead of darken_pixel's 50%.) */
byte automap_reveal_byte(byte *tile_rec)
{
  if (getenv("UW_DEBUG_AUTOMAP_REVEAL")) {
    intptr_t idx = (tile_rec - (byte *)DAT_002029cc) / 4;
    ushort *pp = (ushort *)g_player_object;
    fprintf(stderr, "[automap-reveal] tile_rec=%p idx=%ld tile=(%ld,%ld) player_tile=(%u,%u) heading=0x%x\n",
            (void *)tile_rec, (long)idx, (long)(idx & 0x3f), (long)(idx >> 6),
            (unsigned)(pp[0xb] >> 10), (unsigned)((pp[0xb] & 0x3f0) >> 4),
            (unsigned)(ushort)DAT_00201c70);
  }
  return (byte)DAT_0023ae40_backing[tile_rec[1] >> 2 & 0xf] |
         (*tile_rec & 0xf);
}



void FUN_0005dd84(param_1,param_2,param_3)
byte * param_1;
uint param_2;
ushort param_3;

{
  byte *pbVar1;
  
  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((param_3 & 0xff) + 0x6a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (param_2 & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = (param_3 & 0xff) + 0xf0;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*param_1 << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
  return;
}



void FUN_0005debc(param_1,param_2,param_3)
byte * param_1;
uint param_2;
uint param_3;

{
  byte *pbVar1;
  
  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((param_3 & 0xff) + 0x6a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (param_2 & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = 0xfa;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*param_1 << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
  return;
}



void FUN_0005dff4(param_1,param_2,param_3,param_4)
byte * param_1;
uint param_2;
undefined4 param_3;
ushort param_4;

{
  byte *pbVar1;
  
  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((param_4 & 0xff) + 0x3a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (param_2 & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = (param_4 & 0xff) + 0xc0;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*param_1 << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
  return;
}



// was emit_floor_texture_select
void emit_floor_texture_select(param_1,param_2,param_3)
byte * param_1;
uint param_2;
short param_3;

{
  ushort uVar1;
  
  param_2 = param_2 & 0xff;
  if (((int)param_2 < (int)DAT_00086b28) || (param_1 == (byte *)0x0)) {
    if ((int)param_2 < (int)DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((param_2 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      DAT_0023b4d8 = 0x400;
      uVar1 = param_3 + 0x30;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
    }
    else {
      uVar1 = param_3 + 0x6a;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      DAT_0023b824 = 0x10;
    }
    *DAT_00110fc0 = 0x3e;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b81c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = uVar1 & 0xff;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b4d8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b828;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    if (param_1 != (byte *)0x0) {
      *DAT_00110fc0 = 0x36;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*param_1 << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[3];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)param_1[1] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[2];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)param_1[2] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[1];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)param_1[3] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*DAT_0023b4f0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
  }
  else {
    FUN_0005dd84();
  }
  return;
}



void FUN_0005e3c0(param_1,param_2,param_3,param_4)
byte * param_1;
uint param_2;
uint param_3;
ushort param_4;

{
  short *psVar1;
  short sVar2;
  int iVar3;
  ushort uVar4;
  bool bVar5;
  
  param_2 = param_2 & 0xff;
  if (((int)param_2 < (int)DAT_00086b28) || (param_1 == (byte *)0x0)) {
    if ((int)param_2 < (int)DAT_00086b24) {
      DAT_0023b81c = 4;
      if ((param_2 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 4;
      }
      DAT_0023b4d8 = 0x1000;
      DAT_0023b824 = 0x40;
      sVar2 = (short)((param_3 & 0xff) << 10);
    }
    else {
      psVar1 = (short *)0x0;
      bVar5 = param_2 != 0;
      DAT_0023b81c = 0;
      if (bVar5) {
        psVar1 = &DAT_00086b30;
      }
      DAT_0023b824 = 0x10;
      if (bVar5) {
        psVar1 = (short *)(int)*psVar1;
      }
      sVar2 = (short)((param_3 & 0xff) << 6);
      param_4 = param_4 + 0x3a;
      if (bVar5) {
        DAT_0023b81c = (ushort)psVar1;
      }
      DAT_0023b4d8 = 0x100;
    }
    DAT_0023b828 = sVar2 - 1;
    iVar3 = (int)DAT_0023b818;
    DAT_0023b818 = (char)((uint)((iVar3 + 1) * 0x1000000) >> 0x18);
    if (iVar3 < 1) {
      *DAT_00110fc0 = 0x3e;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = param_4 & 0xff;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b4d8;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b828;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    if (param_1 != (byte *)0x0) {
      uVar4 = 0xa2;
      if (DAT_0023b4dc == 0) {
        uVar4 = 0xa0;
      }
      *DAT_00110fc0 = uVar4;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*param_1 + (ushort)param_1[1] * 0x100;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)param_1[2] + (ushort)param_1[3] * 0x100;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
  }
  else {
    FUN_0005dff4();
  }
  return;
}



/* Forward-declared (this file otherwise never pre-declares anything,
   K&R-style throughout) because emit_tile_objects calls this before its
   own definition further down, and clang's implicit-declaration
   inference from that call site lands on a signature incompatible with
   the real K&R definition otherwise -- a hard error, not just a
   warning, once this function has a name distinct from a plain FUN_
   address. No longer needed now that emit_catalog_object has moved to
   src/models.c: uw.h's own (K&R-empty) prototype is now in scope
   before this call site, so there's nothing left for clang to
   mis-infer from. */

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
      uVar18 = Ordinal_2023((&DAT_000d9930)[_angle_idx]);
    }
    iVar32 = (int)DAT_00202508;
    uVar19 = Ordinal_2032(iVar32 * -6);
    uVar19 = Ordinal_2026(uVar19,0x3f000000);
    uVar20 = Ordinal_2023();
    uVar16 = DAT_000da47c;
    iVar28 = DAT_0023b83c * 0x60;
    (&DAT_000ace30)[iVar28] = (char)DAT_000da47c;
    iVar17 = (int)(short)DAT_0023b904;
    (&DAT_000ace31)[iVar28] = (char)(uVar16 >> 8);
    cVar2 = (char)((short)uVar16 >> 0xf);
    (&DAT_000ace32)[iVar28] = cVar2;
    (&DAT_000ace33)[iVar28] = cVar2;
    uVar21 = Ordinal_2032(iVar17);
    uVar22 = Ordinal_2026(uVar19,uVar30);
    uVar22 = Ordinal_2051(uVar22,uVar21);
    uVar22 = Ordinal_2051(uVar22,0);
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
    uVar24 = Ordinal_2032(iVar23);
    uVar19 = Ordinal_2026(uVar19,uVar18);
    uVar19 = Ordinal_2051(uVar19,uVar24);
    uVar19 = Ordinal_2051(uVar19,0);
    (&DAT_000a85e0)[iVar31] = (char)uVar19;
    uVar6 = (undefined1)((uint)uVar19 >> 8);
    (&DAT_000a85e1)[iVar31] = uVar6;
    iVar33 = (int)DAT_002022f8;
    uVar7 = (undefined1)((uint)uVar19 >> 0x10);
    (&DAT_000a85e2)[iVar31] = uVar7;
    iVar23 = (int)(short)DAT_0023b91c;
    uVar8 = (undefined1)((uint)uVar19 >> 0x18);
    (&DAT_000a85e3)[iVar31] = uVar8;
    uVar25 = Ordinal_2032(iVar33 * 6 + iVar23);
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
    uVar19 = Ordinal_2032(iVar23);
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
    uVar22 = Ordinal_2026(uVar20,uVar30);
    uVar21 = Ordinal_2051(uVar22,uVar21);
    uVar21 = Ordinal_2051(uVar21,0);
    iVar23 = iVar34 * 0xc;
    (&DAT_000a85d8)[iVar23] = (char)uVar21;
    uVar6 = (undefined1)((uint)uVar21 >> 8);
    (&DAT_000a85d9)[iVar23] = uVar6;
    uVar7 = (undefined1)((uint)uVar21 >> 0x10);
    (&DAT_000a85da)[iVar23] = uVar7;
    uVar8 = (undefined1)((uint)uVar21 >> 0x18);
    (&DAT_000a85db)[iVar23] = uVar8;
    uVar18 = Ordinal_2026(uVar20,uVar18);
    uVar18 = Ordinal_2051(uVar18,uVar24);
    uVar18 = Ordinal_2051(uVar18,0);
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
    uVar18 = Ordinal_2023((&DAT_000d9930)[DAT_000db44c]);
    iVar32 = (int)DAT_00202508;
    uVar19 = Ordinal_2032(iVar32 * -4);
    uVar19 = Ordinal_2026(uVar19,0x3f000000);
    uVar20 = Ordinal_2023();
    uVar16 = DAT_000da47c;
    iVar28 = DAT_0023b83c * 0x60;
    iVar17 = (int)(short)DAT_0023b904;
    (&DAT_000ace30)[iVar28] = (char)DAT_000da47c;
    (&DAT_000ace31)[iVar28] = (char)(uVar16 >> 8);
    cVar2 = (char)((short)uVar16 >> 0xf);
    (&DAT_000ace32)[iVar28] = cVar2;
    (&DAT_000ace33)[iVar28] = cVar2;
    uVar21 = Ordinal_2032(iVar17);
    uVar22 = Ordinal_2026(uVar19,uVar30);
    uVar22 = Ordinal_2051(uVar22,uVar21);
    uVar22 = Ordinal_2051(uVar22,0);
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
    uVar24 = Ordinal_2032(iVar23);
    uVar19 = Ordinal_2026(uVar19,uVar18);
    uVar19 = Ordinal_2051(uVar19,uVar24);
    uVar19 = Ordinal_2051(uVar19,0);
    (&DAT_000a85e0)[iVar31] = (char)uVar19;
    uVar6 = (undefined1)((uint)uVar19 >> 8);
    (&DAT_000a85e1)[iVar31] = uVar6;
    iVar33 = (int)DAT_002022f8;
    uVar7 = (undefined1)((uint)uVar19 >> 0x10);
    (&DAT_000a85e2)[iVar31] = uVar7;
    iVar23 = (int)(short)DAT_0023b91c;
    uVar8 = (undefined1)((uint)uVar19 >> 0x18);
    (&DAT_000a85e3)[iVar31] = uVar8;
    uVar25 = Ordinal_2032(iVar23 + iVar33 * 4);
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
    uVar19 = Ordinal_2032(iVar23);
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
    uVar22 = Ordinal_2026(uVar20,uVar30);
    uVar21 = Ordinal_2051(uVar22,uVar21);
    uVar21 = Ordinal_2051(uVar21,0);
    iVar34 = iVar35 * 0xc;
    (&DAT_000a85d8)[iVar34] = (char)uVar21;
    uVar6 = (undefined1)((uint)uVar21 >> 8);
    (&DAT_000a85d9)[iVar34] = uVar6;
    uVar7 = (undefined1)((uint)uVar21 >> 0x10);
    (&DAT_000a85da)[iVar34] = uVar7;
    uVar8 = (undefined1)((uint)uVar21 >> 0x18);
    (&DAT_000a85db)[iVar34] = uVar8;
    uVar18 = Ordinal_2026(uVar20,uVar18);
    uVar18 = Ordinal_2051(uVar18,uVar24);
    uVar18 = Ordinal_2051(uVar18,0);
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
      /* The anchor emit_tile_features computed just above (DAT_0023b904/
         920) is a generic per-slot floor-object position, whose sub-tile
         slot depends on how many OTHER objects share the tile and where
         the camera is standing -- not on the door itself (same root
         cause the wall-decal path already diagnosed, see LAB_emit_mesh_
         sprite_quad's own g_billboard_angle_override_deg comment). Round
         back down to the tile's own slot-quantized center the same way
         (clear the low 5 bits -- one tile is 0x20 units -- then re-add
         the +0x10 half-slot constant emit_tile_features' own formula
         ends with) to remove that camera/other-object jitter.

         QA report: "door frame looks to be offset 16 units into the
         wall... to the right or left, depending on direction" -- this
         snap alone does NOT fully fix that (confirmed still present
         after this fix landed); tried computing an exact tile-center/
         tile-edge anchor from the tile grid index and the model's real
         final rotation angle instead (see this branch's git history for
         the attempt), which made a different door disappear entirely in
         live testing -- reverted rather than ship that regression. The
         real fix needs the actual wall-edge side determined from real
         disassembly/data, not inferred from the already-approximate
         slot anchor -- still open, see object-rendering-findings.txt. */
      DAT_0023b904 = (DAT_0023b904 & ~0x1f) | 0x10;
      DAT_0023b920 = (DAT_0023b920 & ~0x1f) | 0x10;
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
  FUN_0005e3c0(0,DAT_0023b4e0,4,(byte)param_1[3] & 0x3f);
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















































































































void entry(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  run_static_initializers();
  app_main_loop(param_1,param_2,param_3,param_4);
  /* HACK: was a bare `terminate_process();` -- dropped argument, the
     same class of bug fixed repeatedly elsewhere in this file. Every
     other confirmed call site passes a real exit code (e.g.
     0xffffffff/0xffffffe8/0xffffffec from fatal-error paths); this
     call runs only after app_main_loop returns normally, so 0 (a
     clean/successful exit) is the obviously-intended value here,
     not a fatal-error code. */
  terminate_process(0);
  return;
}



// was FUN_00082328 -- entry's own pre-app_main_loop setup step.
// Originally walked linker-generated static-initializer section
// boundaries (e.g. __init_array_start/end) calling through them as
// function pointers. Those boundary symbols are meaningless once
// DAT_0008427c/DAT_00084280 etc. are ordinary recompiled globals rather
// than real section bounds, so this is a no-op here.
void run_static_initializers()

{
  return;
}



// was FUN_00082358 -- generic "call every function pointer in
// [param_1,param_2)" helper, the mechanism run_static_initializers
// and terminate_process's own (dead) atexit-walk originally used.
void call_function_pointer_range(param_1,param_2)
undefined4 * param_1;
undefined4 * param_2;

{
  for (; param_1 < param_2; param_1 = param_1 + 1) {
    if ((code *)*param_1 != (code *)0x0) {
      (*(code *)*param_1)();
    }
  }
  return;
}



// was FUN_00082388 -- entry's own post-app_main_loop teardown step,
// AND this program's real process-termination point: originally ran
// registered atexit-style handlers (dead code -- nothing ever
// registers any, see register_atexit_handler/register_default_atexit_
// handler), walked more linker-section boundaries (meaningless here,
// see run_static_initializers), and finally jumped through a fixed
// low ROM/trap address to hand control back to the OS. That jump was
// the real point: it's called both at normal shutdown from entry()
// and, critically, from fatal-error handlers like report_fatal_error_and_exit/
// report_fatal_error_message_and_exit ("Underworld can no longer run...") that rely on it to
// never return. A no-op here was wrong -- callers that hit a fatal
// error kept running with broken state and looped back into the same
// failure forever. Actually terminates the process.
void terminate_process(param_1)
undefined4 param_1;

{
  fprintf(stderr, "[exit] terminate_process: terminating (code %d)\n", (int)(intptr_t)param_1);
  exit((int)(intptr_t)param_1);
}



// was FUN_00082448 -- registers an atexit-style handler: appends
// param_1 to a dynamically-grown array (DAT_00250908/DAT_0025090c),
// reallocating via Ordinal_33/34/35 (malloc/realloc/size-query style
// WinCE ordinals) when it's full. In this port, those three ordinals
// are stubbed to always return 0 (src/ordinal_stubs.c), so the
// "grow the buffer" branch always fails and this function always
// returns 0 without ever actually registering anything -- consistent
// with the original decompile's own dead-code status here (nothing
// in this binary's real atexit chain is exercised; see
// terminate_process's own comment on why the walk-and-call step this
// would feed was never functional to begin with).
undefined4 register_atexit_handler(param_1)
undefined4 param_1;

{
  uint uVar1;
  int iVar2;

  uVar1 = Ordinal_35(DAT_0025090c);
  if (uVar1 < (uint)((int)DAT_00250908 + (4 - (int)DAT_0025090c))) {
    if (DAT_0025090c == 0) {
      iVar2 = Ordinal_33(0,0x10);
    }
    else {
      iVar2 = Ordinal_35();
      iVar2 = Ordinal_34(DAT_0025090c,iVar2 + 0x10,2);
    }
    if (iVar2 == 0) {
      return 0;
    }
    DAT_00250908 = (undefined4 *)(iVar2 + ((int)DAT_00250908 - (int)DAT_0025090c >> 2) * 4);
    DAT_0025090c = iVar2;
  }
  *DAT_00250908 = param_1;
  DAT_00250908 = DAT_00250908 + 1;
  return param_1;
}



// was FUN_000824f0 -- thin wrapper reporting whether
// register_atexit_handler succeeded (0) or failed (-1).
//
// HACK: this function's own call to register_atexit_handler was a
// bare `register_atexit_handler();` in the original decompile --
// dropped argument, the same class of bug fixed repeatedly elsewhere
// in this file. Unlike most such cases, this one has a confirmed real
// parameter: its own only call site (uw.c) passes an explicit
// function-pointer argument (`register_default_atexit_handler(FUN_0004f828)`)
// despite this K&R signature declaring no parameters -- the same
// "real ABI argument the Ghidra-recovered signature omits" pattern as
// other dropped-argument fixes in this file. Added the parameter back
// and forward it through, even though register_atexit_handler always
// fails regardless of its argument in this port (see that function's
// own comment on why) -- the plumbing is still worth restoring
// faithfully.
undefined4 register_default_atexit_handler(param_1)
undefined4 param_1;

{
  int iVar1;
  undefined4 uVar2;

  iVar1 = register_atexit_handler(param_1);
  uVar2 = 0;
  if (iVar1 == 0) {
    uVar2 = 0xffffffff;
  }
  return uVar2;
}





