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
undefined DAT_00084730_backing[8192];
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
undefined DAT_00084814_backing[8192];
#define DAT_00084814 DAT_00084814_backing[0]
char s_leaf_00084818[] = "leaf";
undefined DAT_00084820_backing[8192];
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
undefined DAT_000848f4_backing[8192];
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
char DAT_000849a8_backing[8192] = "%1s";
#define DAT_000849a8 DAT_000849a8_backing[0]
char DAT_000849ac_backing[8192] = "%d";
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
char DAT_000849c8_backing[8192] = "END";
#define DAT_000849c8 DAT_000849c8_backing[0]
char s__100s_1s_000849cc[] = "%100s%1s";
char s__1s__a_z__1s_000849d8[] = "%1s%[a-z]%1s";
char s_Input_file_error__BEGIN_statemen_000849e8[] = "Input_file_error:_BEGIN_statemen";
char s_BEGIN_00084a14[] = "BEGIN";
char s__100s_00084a1c[] = "%100s";
undefined DAT_00084a24_backing[8192];
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
char DAT_000c4c38_backing[0x3e58];
#define DAT_000c4c38 (*(undefined4 *)DAT_000c4c38_backing)
#define DAT_000c8a90 (*(undefined1 *)(DAT_000c4c38_backing + 0x3e58))
undefined1 DAT_000c8b08_backing[65536];
#define DAT_000c8b08 DAT_000c8b08_backing[0]
/* Base of a growing per-cluster-connection undefined4 array in
   parse_e_model_file's CLUSTERS block (`puVar8 = &DAT_000c8ca0; ... *puVar8 =
   local_1d8; puVar8 = puVar8 + 1;`) -- same undersized-scalar bug as
   DAT_000da868/DAT_000dab90 right above, for the same block. */
undefined1 DAT_000c8ca0_backing[65536];
#define DAT_000c8ca0 DAT_000c8ca0_backing[0]
/* DAT_000c9540..DAT_000c9555 (22 fields): another per-record byte-field
   cluster in parse_e_model_file's ".E" model parser (NODES block), same
   undersized-scalar bug as DAT_000d2ab0/DAT_000c9dd8/DAT_000c8ca0/
   DAT_000da868/DAT_000dab90 above -- found via a systematic scan of
   every `(&DAT_x)[idx]` pattern in this function after the POINTS/PARTS/
   CLUSTERS instances turned out not to be the only ones (a real model
   file's parse was still corrupting an unrelated global afterward).
   Widened the same way. */
undefined1 DAT_000c9540_backing[65536];
#define DAT_000c9540 DAT_000c9540_backing[0]
undefined1 DAT_000c9541_backing[65536];
#define DAT_000c9541 DAT_000c9541_backing[0]
undefined1 DAT_000c9542_backing[65536];
#define DAT_000c9542 DAT_000c9542_backing[0]
undefined1 DAT_000c9543_backing[65536];
#define DAT_000c9543 DAT_000c9543_backing[0]
undefined1 DAT_000c9544_backing[65536];
#define DAT_000c9544 DAT_000c9544_backing[0]
undefined1 DAT_000c9545_backing[65536];
#define DAT_000c9545 DAT_000c9545_backing[0]
undefined1 DAT_000c9546_backing[65536];
#define DAT_000c9546 DAT_000c9546_backing[0]
undefined1 DAT_000c9547_backing[65536];
#define DAT_000c9547 DAT_000c9547_backing[0]
undefined1 DAT_000c9548_backing[65536];
#define DAT_000c9548 DAT_000c9548_backing[0]
undefined1 DAT_000c9549_backing[65536];
#define DAT_000c9549 DAT_000c9549_backing[0]
undefined1 DAT_000c954a_backing[65536];
#define DAT_000c954a DAT_000c954a_backing[0]
undefined1 DAT_000c954b_backing[65536];
#define DAT_000c954b DAT_000c954b_backing[0]
undefined1 DAT_000c954c_backing[65536];
#define DAT_000c954c DAT_000c954c_backing[0]
undefined1 DAT_000c954d_backing[65536];
#define DAT_000c954d DAT_000c954d_backing[0]
undefined1 DAT_000c954e_backing[65536];
#define DAT_000c954e DAT_000c954e_backing[0]
undefined1 DAT_000c954f_backing[65536];
#define DAT_000c954f DAT_000c954f_backing[0]
undefined1 DAT_000c9550_backing[65536];
#define DAT_000c9550 DAT_000c9550_backing[0]
undefined1 DAT_000c9551_backing[65536];
#define DAT_000c9551 DAT_000c9551_backing[0]
undefined1 DAT_000c9552_backing[65536];
#define DAT_000c9552 DAT_000c9552_backing[0]
undefined1 DAT_000c9553_backing[65536];
#define DAT_000c9553 DAT_000c9553_backing[0]
undefined1 DAT_000c9554_backing[65536];
#define DAT_000c9554 DAT_000c9554_backing[0]
undefined1 DAT_000c9555_backing[65536];
#define DAT_000c9555 DAT_000c9555_backing[0]
/* DAT_000c9dd8 through DAT_000c9de3 (12 globals) are byte fields of a
   0x67(103)-byte-stride per-PART record in parse_e_model_file's ".E" model
   parser (`iVar5 = g_model_parse_part_count * 0x67; (&DAT_000c9ddc)[iVar5] = ...`),
   bounded by `if (0x15e < g_model_parse_part_count)` (350 parts) -- same undersized-
   scalar-instead-of-real-table bug as the DAT_000d2ab0-family POINTS
   record right above, just for PARTS. Widened the same way. */
undefined1 DAT_000c9dd8_backing[65536];
#define DAT_000c9dd8 DAT_000c9dd8_backing[0]
undefined1 DAT_000c9dd9_backing[65536];
#define DAT_000c9dd9 DAT_000c9dd9_backing[0]
undefined1 DAT_000c9dda_backing[65536];
#define DAT_000c9dda DAT_000c9dda_backing[0]
undefined1 DAT_000c9ddb_backing[65536];
#define DAT_000c9ddb DAT_000c9ddb_backing[0]
undefined1 DAT_000c9ddc_backing[65536];
#define DAT_000c9ddc DAT_000c9ddc_backing[0]
undefined1 DAT_000c9ddd_backing[65536];
#define DAT_000c9ddd DAT_000c9ddd_backing[0]
undefined1 DAT_000c9dde_backing[65536];
#define DAT_000c9dde DAT_000c9dde_backing[0]
undefined1 DAT_000c9ddf_backing[65536];
#define DAT_000c9ddf DAT_000c9ddf_backing[0]
undefined1 DAT_000c9de0_backing[65536];
#define DAT_000c9de0 DAT_000c9de0_backing[0]
undefined1 DAT_000c9de1_backing[65536];
#define DAT_000c9de1 DAT_000c9de1_backing[0]
undefined1 DAT_000c9de2_backing[65536];
#define DAT_000c9de2 DAT_000c9de2_backing[0]
undefined1 DAT_000c9de3_backing[65536];
#define DAT_000c9de3 DAT_000c9de3_backing[0]
/* DAT_000c9e0e..DAT_000c9e3e (30 fields): same bug, same parser, same
   systematic-scan discovery as DAT_000c9540 above. */
undefined1 DAT_000c9e0e_backing[65536];
#define DAT_000c9e0e DAT_000c9e0e_backing[0]
undefined1 DAT_000c9e0f_backing[65536];
#define DAT_000c9e0f DAT_000c9e0f_backing[0]
undefined1 DAT_000c9e10_backing[65536];
#define DAT_000c9e10 DAT_000c9e10_backing[0]
undefined1 DAT_000c9e11_backing[65536];
#define DAT_000c9e11 DAT_000c9e11_backing[0]
undefined1 DAT_000c9e22_backing[65536];
#define DAT_000c9e22 DAT_000c9e22_backing[0]
undefined1 DAT_000c9e23_backing[65536];
#define DAT_000c9e23 DAT_000c9e23_backing[0]
undefined1 DAT_000c9e24_backing[65536];
#define DAT_000c9e24 DAT_000c9e24_backing[0]
undefined1 DAT_000c9e25_backing[65536];
#define DAT_000c9e25 DAT_000c9e25_backing[0]
undefined1 DAT_000c9e26_backing[65536];
#define DAT_000c9e26 DAT_000c9e26_backing[0]
undefined1 DAT_000c9e28_backing[65536];
#define DAT_000c9e28 DAT_000c9e28_backing[0]
undefined1 DAT_000c9e29_backing[65536];
#define DAT_000c9e29 DAT_000c9e29_backing[0]
undefined1 DAT_000c9e2b_backing[65536];
#define DAT_000c9e2b DAT_000c9e2b_backing[0]
undefined1 DAT_000c9e2c_backing[65536];
#define DAT_000c9e2c DAT_000c9e2c_backing[0]
undefined1 DAT_000c9e2d_backing[65536];
#define DAT_000c9e2d DAT_000c9e2d_backing[0]
undefined1 DAT_000c9e2e_backing[65536];
#define DAT_000c9e2e DAT_000c9e2e_backing[0]
undefined1 DAT_000c9e2f_backing[65536];
#define DAT_000c9e2f DAT_000c9e2f_backing[0]
undefined1 DAT_000c9e30_backing[65536];
#define DAT_000c9e30 DAT_000c9e30_backing[0]
undefined1 DAT_000c9e31_backing[65536];
#define DAT_000c9e31 DAT_000c9e31_backing[0]
undefined1 DAT_000c9e32_backing[65536];
#define DAT_000c9e32 DAT_000c9e32_backing[0]
undefined1 DAT_000c9e33_backing[65536];
#define DAT_000c9e33 DAT_000c9e33_backing[0]
undefined1 DAT_000c9e34_backing[65536];
#define DAT_000c9e34 DAT_000c9e34_backing[0]
undefined1 DAT_000c9e35_backing[65536];
#define DAT_000c9e35 DAT_000c9e35_backing[0]
undefined1 DAT_000c9e36_backing[65536];
#define DAT_000c9e36 DAT_000c9e36_backing[0]
undefined1 DAT_000c9e37_backing[65536];
#define DAT_000c9e37 DAT_000c9e37_backing[0]
undefined1 DAT_000c9e38_backing[65536];
#define DAT_000c9e38 DAT_000c9e38_backing[0]
undefined1 DAT_000c9e39_backing[65536];
#define DAT_000c9e39 DAT_000c9e39_backing[0]
undefined1 DAT_000c9e3a_backing[65536];
#define DAT_000c9e3a DAT_000c9e3a_backing[0]
undefined1 DAT_000c9e3b_backing[65536];
#define DAT_000c9e3b DAT_000c9e3b_backing[0]
undefined1 DAT_000c9e3c_backing[65536];
#define DAT_000c9e3c DAT_000c9e3c_backing[0]
undefined1 DAT_000c9e3d_backing[65536];
#define DAT_000c9e3d DAT_000c9e3d_backing[0]
undefined1 DAT_000c9e3e_backing[65536];
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
undefined1 DAT_000d2ab0_backing[32768];
#define DAT_000d2ab0 DAT_000d2ab0_backing[0]
undefined1 DAT_000d2ab1_backing[32768];
#define DAT_000d2ab1 DAT_000d2ab1_backing[0]
undefined1 DAT_000d2ab2_backing[32768];
#define DAT_000d2ab2 DAT_000d2ab2_backing[0]
undefined1 DAT_000d2ab3_backing[32768];
#define DAT_000d2ab3 DAT_000d2ab3_backing[0]
undefined1 DAT_000d2ab4_backing[32768];
#define DAT_000d2ab4 DAT_000d2ab4_backing[0]
undefined1 DAT_000d2ab5_backing[32768];
#define DAT_000d2ab5 DAT_000d2ab5_backing[0]
undefined1 DAT_000d2ab6_backing[32768];
#define DAT_000d2ab6 DAT_000d2ab6_backing[0]
undefined1 DAT_000d2ab7_backing[32768];
#define DAT_000d2ab7 DAT_000d2ab7_backing[0]
undefined1 DAT_000d2ab8_backing[32768];
#define DAT_000d2ab8 DAT_000d2ab8_backing[0]
undefined1 DAT_000d2ab9_backing[32768];
#define DAT_000d2ab9 DAT_000d2ab9_backing[0]
undefined1 DAT_000d2aba_backing[32768];
#define DAT_000d2aba DAT_000d2aba_backing[0]
undefined1 DAT_000d2abb_backing[32768];
#define DAT_000d2abb DAT_000d2abb_backing[0]
undefined1 DAT_000d2abc_backing[32768];
#define DAT_000d2abc DAT_000d2abc_backing[0]
undefined1 DAT_000d2abd_backing[32768];
#define DAT_000d2abd DAT_000d2abd_backing[0]
undefined1 DAT_000d2abe_backing[32768];
#define DAT_000d2abe DAT_000d2abe_backing[0]
undefined1 DAT_000d2abf_backing[32768];
#define DAT_000d2abf DAT_000d2abf_backing[0]
undefined1 DAT_000d2ac0_backing[32768];
#define DAT_000d2ac0 DAT_000d2ac0_backing[0]
undefined1 DAT_000d2ac1_backing[32768];
#define DAT_000d2ac1 DAT_000d2ac1_backing[0]
undefined1 DAT_000d2ac2_backing[32768];
#define DAT_000d2ac2 DAT_000d2ac2_backing[0]
undefined1 DAT_000d2ac3_backing[32768];
#define DAT_000d2ac3 DAT_000d2ac3_backing[0]
undefined1 DAT_000d2ac8_backing[32768];
#define DAT_000d2ac8 DAT_000d2ac8_backing[0]
undefined1 DAT_000d2ac9_backing[32768];
#define DAT_000d2ac9 DAT_000d2ac9_backing[0]
undefined1 DAT_000d2aca_backing[32768];
#define DAT_000d2aca DAT_000d2aca_backing[0]
undefined1 DAT_000d2acb_backing[32768];
#define DAT_000d2acb DAT_000d2acb_backing[0]
undefined1 DAT_000d2ad0_backing[32768];
#define DAT_000d2ad0 DAT_000d2ad0_backing[0]
undefined1 DAT_000d2ad1_backing[32768];
#define DAT_000d2ad1 DAT_000d2ad1_backing[0]
undefined1 DAT_000d2ad2_backing[32768];
#define DAT_000d2ad2 DAT_000d2ad2_backing[0]
undefined1 DAT_000d2ad3_backing[32768];
#define DAT_000d2ad3 DAT_000d2ad3_backing[0]
undefined4 DAT_000d95d8;
/* DAT_000d9768..DAT_000d977c (21 fields): same bug, same parser, same
   systematic-scan discovery as the two clusters above. */
undefined1 DAT_000d9768_backing[65536];
#define DAT_000d9768 DAT_000d9768_backing[0]
undefined1 DAT_000d9769_backing[65536];
#define DAT_000d9769 DAT_000d9769_backing[0]
undefined1 DAT_000d976a_backing[65536];
#define DAT_000d976a DAT_000d976a_backing[0]
undefined1 DAT_000d976b_backing[65536];
#define DAT_000d976b DAT_000d976b_backing[0]
undefined1 DAT_000d976c_backing[65536];
#define DAT_000d976c DAT_000d976c_backing[0]
undefined1 DAT_000d976d_backing[65536];
#define DAT_000d976d DAT_000d976d_backing[0]
undefined1 DAT_000d976e_backing[65536];
#define DAT_000d976e DAT_000d976e_backing[0]
undefined1 DAT_000d976f_backing[65536];
#define DAT_000d976f DAT_000d976f_backing[0]
undefined1 DAT_000d9770_backing[65536];
#define DAT_000d9770 DAT_000d9770_backing[0]
undefined1 DAT_000d9771_backing[65536];
#define DAT_000d9771 DAT_000d9771_backing[0]
undefined1 DAT_000d9772_backing[65536];
#define DAT_000d9772 DAT_000d9772_backing[0]
undefined1 DAT_000d9773_backing[65536];
#define DAT_000d9773 DAT_000d9773_backing[0]
undefined1 DAT_000d9774_backing[65536];
#define DAT_000d9774 DAT_000d9774_backing[0]
undefined1 DAT_000d9775_backing[65536];
#define DAT_000d9775 DAT_000d9775_backing[0]
undefined1 DAT_000d9776_backing[65536];
#define DAT_000d9776 DAT_000d9776_backing[0]
undefined1 DAT_000d9777_backing[65536];
#define DAT_000d9777 DAT_000d9777_backing[0]
undefined1 DAT_000d9778_backing[65536];
#define DAT_000d9778 DAT_000d9778_backing[0]
undefined1 DAT_000d9779_backing[65536];
#define DAT_000d9779 DAT_000d9779_backing[0]
undefined1 DAT_000d977a_backing[65536];
#define DAT_000d977a DAT_000d977a_backing[0]
undefined1 DAT_000d977b_backing[65536];
#define DAT_000d977b DAT_000d977b_backing[0]
undefined1 DAT_000d977c_backing[65536];
#define DAT_000d977c DAT_000d977c_backing[0]
undefined1 DAT_000d98c8_backing[32768];
#define DAT_000d98c8 DAT_000d98c8_backing[0]
undefined1 DAT_000da480_backing[65536];
#define DAT_000da480 DAT_000da480_backing[0]
/* Per-CLUSTER pointer/index slot in the same ".E" model parser
   (parse_e_model_file's CLUSTERS block) as DAT_000dab90 right below, same
   "declared as a lone scalar, actually a large indexed table" bug --
   `*(undefined **)(&DAT_000da868 + iVar4) = local_258;` where iVar4
   grows per cluster. Widened the same way, matching DAT_000dab90's
   size. */
undefined1 DAT_000da868_backing[65536];
#define DAT_000da868 DAT_000da868_backing[0]
undefined1 DAT_000dab90_backing[65536];
#define DAT_000dab90 DAT_000dab90_backing[0]
undefined DAT_000db454_backing[8192];
#define DAT_000db454 DAT_000db454_backing[0]
undefined *PTR_Ordinal_553_000840c0;
undefined *PTR_Ordinal_173_000840c4;
undefined DAT_000fb650_backing[8192];
#define DAT_000fb650 DAT_000fb650_backing[0]
undefined DAT_000fb550_backing[8192];
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
/* DAT_000fb863 aliases the bonus-pool byte in DAT_000fb860_backing. */
/* Was a lone `undefined4` scalar, but indexed as `(&DAT_000fb880)[idx]`
   (4-byte stride) with idx up to a CONCAT11 of two record byte fields
   (draw_chargen_field_value). Real populator recovered this session: chrbtns_offset_table_builder
   (a callback Ghidra never resolved into a named function -- see its
   own comment near its definition) builds this as a cumulative per-
   entry byte-size table when the "chrbtns" resource loads.
   Not `static` -- chargen.c reaches it through the DAT_000fb8c4 alias
   in uw.h (case 4's body-figure offset lookup). */
undefined4 DAT_000fb880_backing[4096];
#define DAT_000fb880 DAT_000fb880_backing[0]
/* Another alias into the chrbtns_offset_table_builder offset table (like DAT_000fb884 at
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
   alias into the SAME array chrbtns_offset_table_builder populates, just viewed
   starting one element later (its own read site indexes it with
   identical 4-byte-stride byte-pointer arithmetic to DAT_000fb880's).
   Declaring it as an independent, separately-backed array (as an
   earlier fix pass did, before chrbtns_offset_table_builder's role was known) split
   it apart from the real data and left it permanently zero -- the
   root cause of chrbtns button/portrait graphics reading pixel data
   from the wrong offset (garbled/sheared "pitch is off" artifacts)
   even after DAT_000fb880 itself started being populated correctly. */
#define DAT_000fb884 (((undefined1 *)DAT_000fb880_backing)[4])
short DAT_001005c0;
/* DAT_000fb8c4's address (0xfb8c4) is 0x44 bytes = 17 elements past
   DAT_000fb880's (0xfb880) -- like DAT_000fb884, not a separate table but
   an alias into the SAME cumulative per-entry offset array chrbtns_offset_table_builder
   builds for chrbtns.gr, viewed starting at element 17. Elements 17..26
   are the offsets of chrbtns entries 17-26 (the ten full-body figures,
   five male + five female); character_generator_loop's case 4 reads
   `table[17 + sexbit*5 + portraitIdx]` to blit the chosen body. Declaring
   it as an independent zero array (as an earlier pass did, before
   chrbtns_offset_table_builder's role was known) split it from the real data and left it
   permanently zero -- so no body was ever drawn. Aliased onto the real
   array instead. See uw.h. */
undefined1 DAT_000fb8f0_backing[1680];
int DAT_00201c98;
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
   invoked its per-item callbacks (chrbtns_bump_alloc_entry/chrbtns_offset_table_builder) at all --
   the real root cause of DAT_000fb880 staying empty despite those
   callbacks now being correctly implemented. */
char s_chrbtns_00084ef8[] = "chrbtns";
undefined1 DAT_001005cc;
undefined1 DAT_001005cd;
undefined1 DAT_001005ce;
undefined1 DAT_00088d98_backing[1536];
#define DAT_00088d98 DAT_00088d98_backing[0]


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
   collision_height_envelope/sort_collision_candidates's up-to-256-entry collision
   candidate list (the ARM loads at +0/+1/+2/+3/+4/+5 and next-record
   sort reads at +6/+7 confirm the 6-byte stride). Indexing past element
   0 read/wrote whatever memory happened to follow this single byte in
   the link order -- confirmed via a real crash (a plain, non-debugger
   run walking toward a critter; the same bug reproduced fine under
   lldb/ASan since they lay out globals differently, masking it there).
   Keep the aliases in uw.h: independent arrays lose the link high byte. */
 undefined1 DAT_00202c38_backing[8192];
#define DAT_00202c38 DAT_00202c38_backing[0]
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
#define DAT_001007d8 DAT_001007d0_backing[8]
byte DAT_001005fc;
/* Original blood hit-zone heights at 0x84f18; the fifth entry is set at runtime. */
char DAT_00084f18_backing[5] = {5, 3, 1, 7, 0};
#define DAT_00084f18 DAT_00084f18_backing[0]
#define DAT_00084f1c DAT_00084f18_backing[4]
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
#define DAT_001007f8 DAT_001007d0_backing[0x28] /* per-class XP, 16 bits; loaded monster table */
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
   resource load -- it's the bump-allocator cursor converse_res_bump_alloc_entry advances
   (see that function's comment). */
char *DAT_00100670;
/* Was a lone `undefined4` scalar, but converse_res_slot_store_callback writes real pointers
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
   confirmed via a fresh Ghidra decompile of the real enter_conversation_mode_screen
   (0x286cc) that every one of its 6 portrait/frame blit calls reads
   through ONE base pointer (PTR_DAT_000289cc) at consecutive 4-byte
   offsets 0xb8/0xbc/0xc0/0xc4/0xc8/0xcc -- i.e. a real 6-element
   pointer array, of which DAT_00100728 (offset 0xb8, the array's own
   comment above already got this one right) is just index 0. The
   other 5 were the same "array Ghidra split into separate globals"
   bug as DAT_00100728 itself warned about, except never actually
   fixed for these -- converse_res_slot_store_callback (the load_gr_resource_entries
   per-item callback, idx 0-5 for this 6-item "converse" resource
   load) only ever wrote DAT_00100728_backing[idx], so idx 1-5 landed
   in the real backing array while these 5 stayed permanently zero.
   Reading a NULL DAT_0010072c as bitmap_blit_to_framebuffer's source
   pointer is exactly the Talk-mode crash in bug-critter-talk.txt
   (interact_talk_npc -> change_game_mode -> enter_conversation_mode_screen -> crash
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
   of bug as npc_ai_tick's own iVar5 fix and get_object_record_by_slot_index's header
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
/* Bitmap workspace supplied by cache_ambient_sound_handle; retain the full
   allocation address on 64-bit hosts. */
uintptr_t DAT_00101a70;
/* Dispatch table of babl conversation-text render-time opcode handlers
   (distinct from the babl_builtin_* script-language builtins): a raw
   compiled dialogue-text stream can embed a byte < 0x10 that indexes
   this table, each entry a (script_arg_ptr, render_state_ptr) ->
   words-consumed handler, called from the conversation-rendering loop
   at its three known call sites. Restored all 16 entries from the original
   ARM table at 0x85408, including window timing and dismissal opcodes. */
codeval *const PTR_FUN_00085408[16] = {
  babl_render_op_wrap_message,
  FUN_000362e8,
  FUN_00036300,
  FUN_00036308,
  FUN_00036394,
  FUN_000363f0,
  FUN_00036404,
  FUN_00036418,
  babl_render_op_show_code,
  FUN_000365bc,
  FUN_000365fc,
  FUN_0003663c,
  FUN_00036698,
  babl_render_op_say,
  FUN_00036344,
  babl_render_op_play_sound
};
undefined1 DAT_00085448_backing[11] = "\\CSXXX.nXX";
char s_FONTBIG_SYS_00085454[] = "FONTBIG.SYS";
char *DAT_002506ec;
undefined1 DAT_00085460_backing[11] = "\\CSXXX.N00";
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
   functions too (e.g. init_dungeon_rendering: `*DAT_00110fc0 = 0;
   DAT_00110fc0 = DAT_00110fc0 + 1;`), not just by init_glyph_width_table (which
   would normally seed it from DAT_00110fc8 -- see that function's
   comment on why it skips instead). Left NULL by default (same
   tentative-definition zero-init issue as DAT_00110fc8/DAT_00110fcc),
   it segfaulted on the very first such write. Given a real scratch
   buffer here instead of NULL so those direct writes land somewhere
   safe; this is a fallback, not a recovered value, so whatever
   downstream code reads this data back may not see the real original
   content. */
char DAT_00110fc0_scratch[65536];
char *DAT_00110fc0 = DAT_00110fc0_scratch;
undefined1 DAT_00110fc4;
undefined4 DAT_00110bb8;
/* Was `undefined4` (4 bytes) despite init_draw_command_cursor using it to reset
   DAT_00110fc0 (`char *`) -- truncating on this 64-bit host, and
   overwriting the DAT_00110fc0_scratch fallback (see DAT_00110fc0's own
   comment) with a truncated garbage/NULL pointer right before
   init_dungeon_rendering dereferences it. Retyped to a real pointer, defaulted to
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
   chrbtns_offset_table_builder), there's no call to recover: the table's real content
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
   root cause as chrbtns_offset_table_builder/populate_menu_button_bitmap_entry needing separate recovery).
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
  /* Original bit 1 is the 0x3c190 thunk to render_dungeon_frame_timed
     (0x5bbe0); picture dismissal requests this bit via FUN_00049924(2). */
  (void(*)(void))enter_dungeon_view, (void(*)(void))render_dungeon_frame_timed, 0, (void(*)(void))dungeon_view_anim_tick,
  0, 0, 0, 0,
  0, (void(*)(void))refresh_equipment_display_if_visible, (void(*)(void))handle_game_victory_sequence, (void(*)(void))movement_pacing_handler,
  (void(*)(void))sync_player_stats_to_hud, (void(*)(void))hud_panel_redraw_dispatch, 0, 0 /* Hack - Disabled: mode-exit handler, unrecovered */,
  /* mode 1 */
  0, (void(*)(void))enter_automap_screen, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0 /* Hack - Disabled: ambient sound cycling */, 0, 0, (void(*)(void))exit_automap_screen,
  /* mode 2 */
  (void(*)(void))enter_conversation_mode_screen, 0, 0, 0,
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
short g_pick_tile_off_backing[0x200];
undefined1 DAT_0023b676_backing[65536];
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
undefined1 DAT_0023ad58_backing[65536];
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
                          when wait_for_key_or_mouse_move() says so)
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
undefined2 DAT_000859a8;
/* Was `undefined4` -- truncated the real 64-bit destination pointer
   decode_gr_entry_to_buffer assigns here (see that function's own comment on why
   this global exists at all: load_gr_resource_entries always decodes
   into its OWN malloc'd buffer via the allocator callback and only
   ever hands that buffer back through the post-process callback, so
   passing a pre-allocated destination needs this indirection). */
void *DAT_00202510;
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
undefined1 DAT_00202750_backing[256];
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
ushort *DAT_002046b4;
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
   refresh_player_equipment_effects and decay_equipped_light_sources's light-scan loops, and use_light_source's
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
undefined1 DAT_002029f8_backing[256];
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
const unsigned short DAT_00085728_real_table[3] = { 0x3800, 0x1000, 0x0000 };
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
undefined1 DAT_002029d8_backing[256];
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
/* DAT_00086810: declared as a scalar but indexed as
   (&DAT_00086810)[pos] in apply_mod_vibrato_effect/apply_mod_tremolo_effect,
   where pos is a per-channel counter that wraps at 0x20 (32) -- a
   32-entry sine lookup table for the MOD tracker's vibrato/tremolo
   effects. Same "scalar declared but accessed as array" bug class
   fixed several times this session; widened to real, safely-sized
   backing storage (zero-initialized, not recovered) purely to make
   the access safe. */
undefined1 DAT_00086810_backing[32];
#define DAT_00086810 DAT_00086810_backing[0]
undefined1 DAT_00202a58_backing[65536];
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
unsigned char DAT_0008688c_backing[32] = {
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
char s__DATA_comobj_dat_00086894[] = "\\DATA\\comobj.dat";
char s__DATA_objects_dat_000868a8[] = "\\DATA\\objects.dat";
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
/* Offset 4 -- the third field of the X(0)/Y(2)/?(4)/heading(6) layout, and
   never given a name because nothing in the decompile reads it by a plain
   global symbol; every access is through the indexed `DAT_00202c6c[4]`
   pointer form, which Ghidra doesn't auto-name. check_object_placement_clearance's own private
   local copy of this exact struct layout names it explicitly in an
   existing comment: "the player's current sub-tile height byte" (its
   local_38 = param_5, set before use). collision_height_envelope's own
   read (player_height + this field, compared against a candidate floor
   height) matches that reading too. The X/Y sync fix in sweep_collision_
   flags (commit ed49786) stopped short of this one -- added here as its
   natural third line, mirroring the existing pattern exactly. */
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
/* DAT_002047b0: declared as a scalar but indexed as (&DAT_002047b0)[i]
   throughout (register_click_region-style helpers, up to 20 slots
   per the `iVar2 < 0x14` loop bound) -- same "scalar declared but
   accessed as array" bug class fixed several times this session.
   Widened to real, safely-sized backing storage (zero-initialized,
   not recovered) purely to make the access safe. */
undefined2 DAT_002047b0_backing[20];
#define DAT_002047b0 DAT_002047b0_backing[0]
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
   name-entry on-screen keyboard. Indexed by lookup_onscreen_keyboard_key_hit as
   [row + column*20], row = (touch-Y)>>4 (16px-tall rows spanning the full
   320px portrait screen height), column = (touch-X-200)/20 (two 20px-wide
   columns in the 200..240 strip). Column 0 = digits 0-9 then 'a'-'j';
   column 1 = 'k'-'z' then backspace(8)/enter(13)/space(32)/0x14. */
undefined1 DAT_00087650_backing[40] = {
  '0','1','2','3','4','5','6','7','8','9',
  'a','b','c','d','e','f','g','h','i','j',
  'k','l','m','n','o','p','q','r','s','t',
  'u','v','w','x','y','z',8,13,32,0x14
};
short DAT_00204854;
undefined1 DAT_00204720_backing[65536];
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
/* UU.exe .data at 0x8697c contains 0x2049c8: the swept XYZ and
   collision working XYZ are the same three halfwords, including rollback. */
short *g_sweep_foot_pos = (short *)DAT_002049c8_backing;
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
   load_dungeon_texture_arenas appends to "\DATA\" and loads into the arena. Were
   silently-zero 32KB arrays, so every path was just the bare "\DATA\"
   directory -> load_texture_arena failed -> DAT_002049e0 stayed all zero. */
const char DAT_000869cc_str[] = "f16.tr";
const char DAT_000869d4_str[] = "w16.tr";
const char DAT_000869dc_str[] = "f32.tr";
const char DAT_000869e4_str[] = "w64.tr";
/* Was a lone `undefined` scalar. It is the base of the texture / shade /
   colour-light table arena: load_dungeon_texture_arenas sets
   DAT_0023ae38 = &DAT_002049e0 and loads several .tr/.dat files into
   it, then get_texture_page hands out `&DAT_002049e0 + page*stride`
   pointers. Needs real backing storage (1 MB is comfortably more
   than UW1's texture set). */
undefined1 DAT_002049e0_backing[0x100000];
char s__DATA_terrain_dat_000869ec[] = "\\DATA\\terrain.dat";
// was DAT_0023b01c -- set by the 3D-viewport setup function
// (configure_dungeon_viewport) whenever the real in-game dungeon-view mode (game
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
   symbols index it at 0..4. NOT const: configure_texture_detail_functions
   (CORRECTED this pass -- was mislabeled "FUN_0005d664", an address
   that doesn't match any real function in this file) patches entries
   [1] and [3] (b3c / b44) at runtime between emit_flat_wall_texture_select
   and emit_floor_texture_select. */
code *DAT_00086b38_fnptrs[6] = {
  (code *)emit_flat_wall_texture_select, (code *)emit_floor_texture_select,
  (code *)emit_flat_floor_texture_select, (code *)emit_flat_wall_texture_select,
  (code *)emit_flat_diagonal_texture_select, (code *)emit_diagonal_wall_texture_select,
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
unsigned short DAT_00086c80_backing[32] = {
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
const unsigned char DAT_00086cc0_arr[32] = {
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
   configure_dungeon_viewport's caller), exactly where the "pedestal" decoration
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












































// Tunable: extra units ADDED to DAT_000842b0's computed value (more
// negative there is brighter, so this darkens the view) in BOTH
// set_ambient_bias_with_light and set_ambient_bias_without_light
// below. Override via UW_AMBIENT_BIAS_REDUCTION while calibrating;
// default 32.
int g_ambient_bias_reduction = 32;
























/* FUN_0002295c/FUN_00022998 were here on the unit-testing-framework side
   of this merge -- already named and extracted to src/resources.c as
   load_string_resource/load_string_resource_large on this branch (see
   that file). */

















































































// WARNING: Globals starting with '_' overlap smaller symbols at the same address




// WARNING: Type propagation algorithm not settling




















































































































































































































































































































































































































































































































































// was FUN_0005a630 -- map a raw sweep_collision_flags() bitmask into the






/* FUN_0005aea0/FUN_0005b010 were here on the unit-testing-framework
   side of this merge -- already named and extracted to src/movement.c
   as find_nearby_door_in_candidates/get_first_nearby_candidate_object
   on this branch (identical bodies, see that file). */















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
// function-pointer argument (`register_default_atexit_handler(release_all_sound_channel_slots)`)
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
