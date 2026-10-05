/* The HUD: dirty-rect tracking/flush, mode icons, cursor-mode button
 * clicks, the per-frame HUD draw/tick dispatch (vitals bar, dragon
 * reaction, compass needle, panel transitions), and the message
 * scroll panel (word-wrap, line-by-line scroll, draw). Split out of
 * uw.c (the original monolithic decompile) once these functions' real
 * roles were confirmed.
 */
#include "headers/hud.h"
#include "headers/debug.h"
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

#define DAT_00204720 DAT_00204720_backing[0]
static int DAT_00088954;
static int DAT_0008895c;
static int DAT_00088950;
static int DAT_00088958;
short DAT_00084f10;
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
undefined2 g_cursor_mode;
int DAT_00250718;
static char s_out_of_000858dc[] = "out_of";
static undefined2 DAT_0020209c;
static undefined2 DAT_002020b4;
static undefined2 DAT_00202090;
static undefined2 DAT_002020c8;
static undefined2 DAT_002020bc;
static char s_init_gamedisp_goes_000858e8[] = "init_gamedisp_goes";
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
static const unsigned short DAT_000858a8_real[8] = {8,8,6,6,7,8,0,0};
#define DAT_000858a8 (*(undefined1 *)DAT_000858a8_real)
static const unsigned short DAT_000858b8_real[8] = {100,81,66,48,28,11,144,0};
#define DAT_000858b8 (*(undefined1 *)DAT_000858b8_real)
/* Ghidra left 0x202988 and 0x2028e0 as bare literal addresses (no symbol)
   -- small per-hand "currently drawn weapon / hand state" arrays indexed
   0..5 by reset_equipment_and_container_state/reload_paperdoll_body_sprite (which zero them) and FUN_00046xxx
   (which reads+rewrites them to gate a paperdoll redraw). On the 32-bit
   binary `idx + 0x202988` was real addressing; here it hits an unmapped
   low address and segfaults level init. Give them real backing storage
   and address them as `&DAT_00202988 + idx`. */
/* Sizing-audit pass: reload_paperdoll_body_sprite's own loop is
   `iVar1<6` (indices 0-5). HARD. Down from 16. */
undefined1 DAT_00202988_backing[6];
short g_player_carry_weight;
static int DAT_002028d0;
static char s_Not_a_spell_00085a80[] = "Not_a_spell";
static byte DAT_002028d4;
/* Original UU.exe .data at 0x87530: 53 four-byte special-action records.
   The first 48 match readied spells; byte 0 >> 3 is the action type,
   bytes 1-2 pack three 5-bit rune indices (24 means an empty slot),
   and byte 3 is the action parameter. These fields share one table. */
undefined DAT_00087530_backing[212] = {
  0x00, 0x78, 0x21, 0x83,
  0x10, 0x12, 0x05, 0x02,
  0x29, 0x38, 0x39, 0x01,
  0x40, 0x97, 0x21, 0x01,
  0x18, 0xf8, 0x48, 0x02,
  0x08, 0xf8, 0x51, 0x01,
  0x18, 0x58, 0x02, 0x01,
  0x08, 0x6f, 0x44, 0x02,
  0x20, 0x2c, 0x20, 0x02,
  0x58, 0x98, 0x59, 0x01,
  0x38, 0x58, 0x40, 0x01,
  0x40, 0x38, 0x21, 0x03,
  0x58, 0x6f, 0x46, 0x00,
  0x18, 0x4b, 0x06, 0x03,
  0x00, 0x78, 0x41, 0x85,
  0x29, 0xd8, 0x38, 0x02,
  0x5a, 0x38, 0x49, 0x02,
  0x10, 0x58, 0x22, 0x43,
  0x08, 0xf8, 0x5d, 0x44,
  0x20, 0x98, 0x21, 0x04,
  0x08, 0xf8, 0x1d, 0x03,
  0x38, 0x98, 0x35, 0x04,
  0x18, 0xb8, 0x48, 0x46,
  0x5a, 0x38, 0x01, 0x03,
  0x29, 0xb8, 0x3c, 0x03,
  0x38, 0x4c, 0x00, 0x02,
  0x5a, 0xd7, 0x3a, 0x04,
  0x18, 0x4f, 0x1a, 0x05,
  0x5a, 0xf8, 0x12, 0x05,
  0x58, 0xb8, 0x01, 0x06,
  0x20, 0x0c, 0x55, 0x0f,
  0x30, 0xc6, 0x55, 0x42,
  0x58, 0x2f, 0x56, 0x0a,
  0x38, 0x8f, 0x00, 0x05,
  0x00, 0x0b, 0x55, 0x86,
  0x5a, 0xf7, 0x39, 0x08,
  0x08, 0xef, 0x54, 0x05,
  0x38, 0x91, 0x21, 0x03,
  0x40, 0x98, 0x29, 0x04,
  0x18, 0x4b, 0x56, 0x44,
  0x30, 0x16, 0x54, 0x03,
  0x30, 0x10, 0x38, 0x81,
  0x10, 0xb2, 0x22, 0x45,
  0x58, 0xf7, 0x55, 0x09,
  0x58, 0xf6, 0x39, 0x07,
  0x30, 0xf8, 0x14, 0x44,
  0x58, 0x78, 0x02, 0x0b,
  0x58, 0x42, 0x55, 0x0c,
  0x30, 0x18, 0x63, 0x05,
  0x28, 0x18, 0x63, 0x04,
  0x58, 0x18, 0x63, 0x0d,
  0x50, 0x18, 0x63, 0x03,
  0x50, 0x18, 0x63, 0x09,
};
#define DAT_00087531 DAT_00087530_backing[1]
char DAT_0023c3e0;
char s_bodies_00085c58[] = "bodies";
static int DAT_002029a4;
static undefined2 DAT_00202998;
undefined2 DAT_00085c50;
static int DAT_002046f8;
static char s_optbtns_00086954[] = "optbtns";
static short DAT_002046f4;
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
static short DAT_0020471c;
static short DAT_00204838;
static short DAT_0020483c;
static short DAT_002047dc;
static short DAT_002047d8;
static int DAT_000889b8;
static int DAT_000889bc;
/* DAT_002047b0: declared as a scalar but indexed as (&DAT_002047b0)[i]
   throughout (register_click_region-style helpers, up to 20 slots
   per the `iVar2 < 0x14` loop bound) -- same "scalar declared but
   accessed as array" bug class fixed several times this session.
   Widened to real, safely-sized backing storage (zero-initialized,
   not recovered) purely to make the access safe. */
static undefined2 DAT_002047b0_backing[20];
#define DAT_002047b0 DAT_002047b0_backing[0]
static short DAT_002047a4;
static short DAT_00204748;
static short DAT_00204784;
static undefined2 DAT_0020479c;
static undefined2 DAT_002047a0;
static undefined2 DAT_00204798;
static undefined2 DAT_00204790;
static undefined2 DAT_00204794;
static short DAT_00204854;
/* Sizing pass: register_cursor_hotspot's own loop bound is a fixed
   20-slot table (`while(iVar2<0x14)`), 2-byte stride -- real max
   19*2+2=40 bytes. */
static undefined1 DAT_00204720_backing[64];
/* Sizing-audit pass: siblings of DAT_00204720 right above, same
   register_cursor_hotspot 20-slot table, but indexed directly by
   element (not a byte offset) -- real max index 19, 20 elements * 2
   bytes = 40 bytes real need. Sized to 32 elements (64 bytes) to
   match DAT_00204720's own headroom; down from 256. */
static undefined2 DAT_00204750_backing[32];
#define DAT_00204750 DAT_00204750_backing[0]
static undefined2 DAT_002047e0_backing[32];
#define DAT_002047e0 DAT_002047e0_backing[0]
static undefined2 DAT_00204808_backing[32];
#define DAT_00204808 DAT_00204808_backing[0]
static undefined2 DAT_00086970;
static char DAT_00204858;
static undefined2 DAT_00204704;
/* Sizing-audit pass: push_cursor_icon/pop_cursor_icon's own cursor-
   icon stack, guarded by `if (DAT_00204858 != '\x03')` -- max depth
   3, real need 3 elements (6 bytes). Sized to 8 for headroom; down
   from 256. */
static undefined2 DAT_00204714_backing[8];
#define DAT_00204714 DAT_00204714_backing[0]
static short DAT_002047a8;
static short DAT_0020478c;
static short DAT_002047ac;
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
static undefined1 DAT_000870ec_backing[4] = { 248,0, 28,1 };  /* 248, 284 */
#define DAT_000870ec DAT_000870ec_backing[0]
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
static undefined1 DAT_0023c128_arr[9];
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
static short DAT_0023c224_arr[2];
#define DAT_0023c224 DAT_0023c224_arr[0]
static byte DAT_0023c11a;
static short DAT_0023c228;
static short DAT_0023c22c;
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
static short DAT_00087130_arr[16] = {
  136, 128, 120, 116, 112, 112, 116, 124, 136, 144, 156, 160, 160, 156, 152, 144,
};
#define DAT_00087130 DAT_00087130_arr[0]
/* Was `FIXME[hud-compass-layout]: .data 0x87150 -- ...`. See
   DAT_00087130's comment -- real Y data recovered the same way,
   16 values tracing the same ellipse (132-153). */
static short DAT_00087150_arr[16] = {
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
static short DAT_0023c1e8_arr[2];
#define DAT_0023c1e8 DAT_0023c1e8_arr[0]
#define DAT_0023c1ea DAT_0023c1e8_arr[1]
/* Same split-symbol bug, same fix: `hud_dragon_reaction_tick` indexes
   `&DAT_0023c1e4 + iVar6` (the animation-phase state byte per dragon
   side) and `reset_hud_panel_animation_state` resets both elements individually
   (`DAT_0023c1e6 = 0; ... DAT_0023c1e4 = 0;`) -- 0x23c1e4/0x23c1e6 are
   exactly 2 bytes apart in the original binary, confirming this is
   really one 2-element array too. */
static undefined2 DAT_0023c1e4_arr[2];
#define DAT_0023c1e4 DAT_0023c1e4_arr[0]
#define DAT_0023c1e6 DAT_0023c1e4_arr[1]
static undefined2 DAT_0023c220;
static ushort DAT_0023c1d8;
undefined1 DAT_0023c130;
static int DAT_0023c23c;
static short DAT_0023c21c;
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
static short DAT_00087170_arr[2] = { 36, 228};
#define DAT_00087170 DAT_00087170_arr[0]
/* .data 0x87174 -- X of the dragon BODY sub-sprite, [0]=left
   [1]=right. Sprite made by sprite_list_alloc_raw_entry(2,0x25,0x17) into
   DAT_0023c234[side], placed at ((&DAT_00087174)[side], 0x92), size
   0x25 x 0x17 (redraw_hud_panels:54166); frame from DAT_000871d8 (54191). */
static short DAT_00087174_arr[2] = { 36, 204};
#define DAT_00087174 DAT_00087174_arr[0]
/* .data 0x871b4 -- X of the dragon WING/TAIL sub-sprite, [0]=left
   [1]=right. Sprite made by sprite_list_alloc_entry(0) into DAT_0023c238[side],
   placed at ((&DAT_000871b4)[side], 0x42), size 0xc x 0x1c
   (redraw_hud_panels:54169); frame is a literal 0x207b (left) /
   0x208d (right) at 54196, NOT from a table. */
/* Sizing-audit pass: same `iVar3<2` loop as its 2-element siblings
   DAT_00087170/DAT_00087174 right above. HARD. Down from 4. */
static short DAT_000871b4_arr[2] = { 40, 224};
#define DAT_000871b4 DAT_000871b4_arr[0]
/* Was `FIXME[hud-dragon-frames]: .data 0x871d4 -- ... reads 0 now`.
   Same class of gap as the position tables above -- recovered via
   direct memory dump. Real values 0x206d (left) / 0x207f (right); the
   +0x12 left/right delta matches the wing/tail sub-sprite's own
   literal 0x207b/0x208d pair exactly, confirming this is the real
   dragons.GR left/right frame convention, not a guess. Read as
   `(&DAT_000871d4)[side]` and passed to sprite_list_set_frame_id as the frame arg
   for DAT_0023c230[side] (redraw_hud_panels:54190). */
static unsigned short DAT_000871d4_arr[2] = { 0x206d, 0x207f };
#define DAT_000871d4 DAT_000871d4_arr[0]
/* Was `FIXME[hud-dragon-frames]: .data 0x871d8 -- ... reads 0 now`.
   Real values 0x206e (left) / 0x2080 (right), same +0x12 delta.
   Frame arg to sprite_list_set_frame_id for DAT_0023c234[side] (redraw_hud_panels
   :54191, also FUN_0006dbe4:54753). */
static unsigned short DAT_000871d8_arr[2] = { 0x206e, 0x2080 };
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
static char s_panels_00087260[] = "panels";
/* Was 2 lone `undefined1` scalars -- same "split symbol" bug as
   DAT_0023c224/DAT_0023c230 etc. above: both are used throughout as
   real 2-element byte arrays (`(&DAT_0023c11c)[iVar6]`/
   `(&DAT_0023c12c)[iVar6]` for index 0 AND 1, including redraw_hud_
   panels's own creation loop). Fixed the same way. */
static undefined1 DAT_0023c11c_arr[2];
#define DAT_0023c11c DAT_0023c11c_arr[0]
static undefined1 DAT_0023c12c_arr[2];
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
static short DAT_0023c230_arr[2];
#define DAT_0023c230 DAT_0023c230_arr[0]
static short DAT_0023c234_arr[2];
#define DAT_0023c234 DAT_0023c234_arr[0]
static short DAT_0023c238_arr[2];
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
static undefined4 DAT_0023c200_arr[3];
#define DAT_0023c200 DAT_0023c200_arr[0]
#define DAT_0023c202 DAT_0023c200_arr[1]
#define DAT_0023c204 DAT_0023c200_arr[2]
char DAT_000870dc;
char DAT_000870d8;
ushort DAT_0023c1dc;
#define DAT_0023c11d DAT_0023c11c_arr[1]
#define DAT_0023c12d DAT_0023c12c_arr[1]
static ushort DAT_0023c1e0;
static undefined1 DAT_0023c11b;
static byte DAT_0023c12a;
static byte DAT_0023c150;
/* Sizing pass: both indexed only by `sVar3 & 1` (0 or 1), a 4-byte
   stride -- real max 1*4+4=8 bytes each. */
static undefined1 DAT_0023c1f0_backing[64];
#define DAT_0023c1f0 DAT_0023c1f0_backing[0]
static undefined1 DAT_0023c1f8_backing[64];
#define DAT_0023c1f8 DAT_0023c1f8_backing[0]
/* Was `undefined2 DAT_00087254;` -- split-symbol bug: real ARM code
   (confirmed via disassembly of FUN_0006d4a4/hud_vitals_bar_tick)
   computes `&DAT_00087254 + uVar2*2` for the mana slot, so this is a
   genuine 2-element short array (0=health, 1=mana shimmer/wraparound
   state), not a lone scalar. Also not zero-init bss like it looked --
   raw memory dump (Ghidra headless) showed real .data here: 0x2019
   (health) / 0x2032 (mana), i.e. each side starts equal to its OWN
   `local_2c` shimmer-reset constant (a "settled" starting state). */
static short DAT_00087254_arr[2] = { 0x2019, 0x2032 };
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
static undefined1 DAT_000870f0_backing[32] = {
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
static undefined1 DAT_00087112_backing[32] = {
  4,0, 5,0, 6,0, 7,0, 7,0, 7,0, 7,0, 6,0,
  5,0, 4,0, 4,0, 4,0, 4,0, 0,0, 0,0, 0,0,
};
#define DAT_00087112 DAT_00087112_backing[0]
#define DAT_00087114 (*(short *)(DAT_00087112_backing + 2))
/* .bss 0x23c240..0x23c24f: four short[2] rows of sprite handles for the
   HUD flask/vitals animation (hud_vitals_bar_tick / hud_dragon_reaction_tick), indexed
   `&row + param*2` with param in {0,1}. Ghidra split the region into four
   lone 1-byte `undefined` scalars, so the param==1 (`+2`) access ran off
   the end of a 1-byte global and read/wrote a neighbouring variable --
   the resulting garbage handle crashed sprite_list_set_lifetime (`param_1 * 0x14 +
   base` with a huge negative param_1). Back it with real contiguous
   storage; the `&sym + iVar1` byte indexing is unchanged. */
static char DAT_0023c240_vitals[16];
#define DAT_0023c240 DAT_0023c240_vitals[0]
#define DAT_0023c244 DAT_0023c240_vitals[4]
#define DAT_0023c248 DAT_0023c240_vitals[8]
#define DAT_0023c24c DAT_0023c240_vitals[12]
static short DAT_0023c250;
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
static char DAT_00087178_arr[16] = {40,0, 48,0, 36,0, 204,0, 204,0, 200,0, 0,0, 0,0};  /* X: L 40/48/36, R 204/204/200 */
static char DAT_00087188_arr[16] = {156,0, 146,0, 146,0, 156,0, 146,0, 146,0, 0,0, 0,0};  /* Y: L 156/146/146, R 156/146/146 */
static char PTR_DAT_00087198_arr[16] = {33,0, 24,0, 37,0, 34,0, 24,0, 38,0, 0,0, 0,0};  /* W: L 33/24/37, R 34/24/38 */
static char PTR_DAT_000871a8_arr[16] = {14,0, 16,0, 23,0, 14,0, 16,0, 23,0, 0,0, 0,0};  /* H: L 14/16/23, R 14/16/23 */
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
static const unsigned short DAT_000871b8_arr[14] = {
  0x207b, 0x207c, 0x207d, 0x207e, 0x207d, 0x207c, 0x207b,
  0x208d, 0x208e, 0x208f, 0x2090, 0x208f, 0x208e, 0x208d,
};
#define DAT_000871b8 (*(undefined1 *)DAT_000871b8_arr)
/* Sizing-audit pass: index is `iVar6*2` where iVar6 = param_1-4,
   param_1 guarded to {4,5} -- max byte 2+1=3. Sized to 4; down from
   256. */
static undefined DAT_0023c124_backing[4];
#define DAT_0023c124 DAT_0023c124_backing[0]
static short DAT_0023c254;
static short DAT_00087258;
static short DAT_0023c258;
static int DAT_0023c20c;
static byte DAT_0023c25c;
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
static short DAT_0023c268_arr[3];
#define DAT_0023c268 DAT_0023c268_arr[0]
static short DAT_0023c270_arr[3];
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
static const undefined2 DAT_00087210_arr[3] = {176, 191, 206};
#define DAT_00087210 DAT_00087210_arr[0]
static const undefined2 DAT_00087218_arr[3] = {86, 69, 52};
#define DAT_00087218 DAT_00087218_arr[0]
static undefined2 DAT_0023c140;
static int DAT_0023c278;
static undefined2 DAT_0023c148;
static undefined2 DAT_0023c14c;
static undefined2 DAT_0023c144;
byte g_flip_grtile_cache_ready;
static short DAT_0023c134;
/* Sizing-audit pass: single use, `debug_print(&DAT_00087298)`, 0
   writers -- content unrecovered. Sized to 32 for headroom; down
   from 8192. */
static undefined DAT_00087298_backing[32];
#define DAT_00087298 DAT_00087298_backing[0]
static byte DAT_0023c208;
static short DAT_0023c138;
static short DAT_0023c13c;
static short DAT_0023c110;
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
static unsigned short u_dgijjjigd_G__000871e0[16] = {
  100,103,105,106,106,106,105,103,100,92,71,38,0,38,71,92
};
/* Same "was `int`, truncating a real pointer" bug as DAT_0023c3ec right
   above -- assigned `DAT_0023c40c + 0x100` (a real 64-bit pointer) and
   then compared against/derived into real `ushort *` locals throughout
   flush_sprite_list_compositor and friends. */
static ushort *DAT_0023c414;
/* Same truncation bug as DAT_0023c414/DAT_0023c3ec above, though this one
   is never read back anywhere in this decompile -- fixed for consistency
   regardless. Its assignment (init_sprite_list_buffers) computes it from
   DAT_0023c40c + 0x100, the same expression as DAT_0023c414, rather than
   from DAT_0023c3e4 (the buffer it's presumably meant to bound) -- looks
   like a genuine bug already present in the original, not a decompile
   artifact; left as-is since it's dead either way. */
static char *DAT_0023c410;
/* Sizing pass: this is the real Microsoft GXDisplayProperties struct
   (see gx_stub.c's own "6 x 4-byte fields = 0x18" comment) -- confirmed
   by game.c's GXGetDisplayProperties population site, which copies
   exactly 0x18 (24) bytes into &DAT_0023cdb0 in a fixed-count loop.
   Was oversized at 32768 bytes for a 24-byte struct. */
undefined1 DAT_0023cdb0_backing[32];
undefined *DAT_00250704;
static undefined2 DAT_00250714;
// was DAT_00087960
static undefined1 g_msg_scroll_panel_state_backing[65536];
#define g_msg_scroll_panel_state g_msg_scroll_panel_state_backing[0]
static undefined4 DAT_00250708;
static undefined4 DAT_0025071c;
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
static undefined1 g_msg_scroll_panel_state_conv_backing[65536] = {
  0x34,0x00,0x84,0x00,0x38,0x00,0xdb,0x00,0x3b,0x00,0x36,0x00,0x3b,0x00,0x36,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x2e,0x00,0x01,0x00,0x00,0x00,
};
#define g_msg_scroll_panel_state_conv g_msg_scroll_panel_state_conv_backing[0]
static short DAT_00250724;
static short DAT_00250728;
static short DAT_00250710;
static char s__MORE__00087994[] = "[MORE]";
static undefined4 DAT_00250720;
static short DAT_0025070c;
/* Was a bare 1-byte `undefined` scalar -- FUN_0008090c's yes/no dialog
   takes its address and passes it to message_scroll_print_wrapped, so it
   needs to be a real string. Real bytes confirmed via a Ghidra memory
   dump of the original binary at 0x8799c: "No". Same bug class as the
   save-slot label fix earlier this session (Ghidra typed it as a scalar
   instead of generating a garbled placeholder string). */
// was DAT_0008799c
static char s_No_0008799c[] = "No";
/* Same fix as s_No_0008799c above: real bytes at 0x879a0 are "Yes". */
// was DAT_000879a0
static char s_Yes_000879a0[] = "Yes";
/* Reused-global-holding-a-real-string pattern (see the s_scroll_newline_0008522c
   comment far above): scroll_text_entry_prompt's ESC-cancel path prints
   `&s_dash_000879a4` with no write beforehand. Real bytes at 0x879a4: "-". */
// was DAT_000879a4
static undefined s_dash_000879a4_backing[8192] = "-";
#define s_dash_000879a4 s_dash_000879a4_backing[0]
/* Same pattern: scroll_text_entry_prompt defaults its prompt-before-the-input-field
   text to `&s_scroll_prompt_arrow_000879a8` whenever the caller passes a NULL label (the
   save-name-entry call site does exactly this) -- real bytes at 0x879a8
   are ">" , the leading caret shown before the text cursor. Left zero
   (empty string) by this backing array's C default, so that prompt
   character was silently missing. */
// was DAT_000879a8
static undefined s_scroll_prompt_arrow_000879a8_backing[8192] = ">";
#define s_scroll_prompt_arrow_000879a8 s_scroll_prompt_arrow_000879a8_backing[0]




// was FUN_00011000 -- expand the damaged-region bounds (DAT_00088950..5c) to include the given rect; sibling of dirty_rect_set
void dirty_rect_union(param_1,param_2,param_3,param_4)
int param_1;
int param_2;
int param_3;
int param_4;

{
  if (param_1 < DAT_00088954) {
    DAT_00088954 = param_1;
  }
  if (DAT_0008895c < param_2) {
    DAT_0008895c = param_2;
  }
  if (param_3 < DAT_00088950) {
    DAT_00088950 = param_3;
  }
  if (DAT_00088958 < param_4) {
    DAT_00088958 = param_4;
  }
  return;
}



// was FUN_00011040 -- dirty-rect SET (overwrite the damaged-region
// bounds to exact values; sibling of dirty_rect union dirty_rect_union)
void dirty_rect_set(param_1,param_2,param_3,param_4)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;

{
  DAT_00088954 = param_1;
  DAT_0008895c = param_2;
  DAT_00088950 = param_3;
  DAT_00088958 = param_4;
  return;
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* This is the game's dirty-rect blit: DAT_00088954/5c/50/58 (top/
   bottom/left/right) accumulate via dirty_rect_union, called from every
   draw (rect fill, text draw, sprite blit, ...) to grow the damaged
   region -- clamped here, then blitted from the software buffer
   (g_uw_framebuffer) into GXBeginDraw()'s real framebuffer and
   presented via GXEndDraw(). Investigated as a suspect for the
   chargen "text flashes then gets covered by a rectangle" bug (SS1
   shares this same Looking Glass dirty-rect heritage): the bounds are
   accumulate-only in the normal UI flow -- the only explicit reset
   (dirty_rect_set, setting them back to an empty/degenerate rect) is a
   single call site elsewhere unrelated to chargen -- so nothing here
   makes the tracked region shrink or exclude an area once drawn to.
   Didn't find a bug in this function itself; the rapid-cycling
   behavior traced back to unfiltered SDL key-repeat instead (see
   gx_stub.c's uw_pump_events), but noting this in case the covered-
   rectangle symptom persists after that fix and this needs a second
   look. */
// was FUN_00022f0c
void flush_dirty_rect_to_display()

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  undefined2 *puVar5;
  int iVar6;
  int iVar7;
  undefined2 *puVar8;
  undefined2 *puVar9;
  int iVar10;
  int iVar11;

  if (DAT_00088954 < 0) {
    DAT_00088954 = 0;
  }
  else if (200 < DAT_00088954) {
    DAT_00088954 = 200;
  }
  iVar2 = DAT_00088954;
  if (DAT_0008895c < 0) {
    DAT_0008895c = 0;
  }
  else if (200 < DAT_0008895c) {
    DAT_0008895c = 200;
  }
  iVar3 = DAT_0008895c;
  if (DAT_00088950 < 0) {
    DAT_00088950 = 0;
  }
  else if (0x140 < DAT_00088950) {
    DAT_00088950 = 0x140;
  }
  if (DAT_00088958 < 0) {
    DAT_00088958 = 0;
  }
  else if (0x140 < DAT_00088958) {
    DAT_00088958 = 0x140;
  }
  iVar10 = 0x140 - DAT_00088958;
  iVar11 = 0x140 - DAT_00088950;
  if (getenv("UW_DEBUG_FLUSHGATE")) {
    int willflush = ((0 < DAT_00084f10) ||
      (((g_selected_object == 0 || (g_force_flush != 0)) && ((DAT_0023c63c == 0 || (g_force_flush != 0))))));
    fprintf(stderr, "[flushgate] willflush=%d selected=%p force=%d rect=(%d,%d,%d,%d)\n",
            willflush, (void *)g_selected_object, (int)g_force_flush,
            (int)DAT_00088954, (int)DAT_0008895c, (int)DAT_00088950, (int)DAT_00088958);
  }
  if (((0 < DAT_00084f10) ||
      (((g_selected_object == 0 || (g_force_flush != 0)) && ((DAT_0023c63c == 0 || (g_force_flush != 0)))))
      ) && ((DAT_0023cdc0 == 0x10 && (DAT_0023c430 = GXBeginDraw(), DAT_0023c430 != (void *)0x0))))
  {
    iVar6 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar6 = DAT_0023cdb8 + 1;
    }
    iVar7 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar7 = DAT_0023cdbc + 1;
    }
    puVar5 = (undefined2 *)((char *)DAT_0023c430 + ((iVar7 >> 1) * iVar10 + (iVar6 >> 1) * iVar2) * 2);
    /* DAT_00088958 ("right") is a right-*exclusive* dirty-rect bound
       everywhere else in this function (e.g. `iVar10 = 0x140 -
       DAT_00088958` correctly treats it as a remaining-width count), but
       here it's used directly as a starting column INDEX -- when the
       dirty rect spans the full screen width (right==0x140), this reads
       one full source row past the buffer's end (ASAN heap-buffer-
       overflow). Needs the same -1 every other direct-index use of a
       right/bottom bound in this codebase gets to become the last
       *valid* column instead of one-past-it. */
    puVar4 = (undefined2 *)
             ((g_uw_framebuffer) +
             (DAT_00088954 * 0x140 + (DAT_00088958 - 1)) * 2);
    if (iVar10 < iVar11) {
      iVar11 = iVar11 - iVar10;
      do {
        if (iVar2 < iVar3) {
          iVar10 = iVar3 - iVar2;
          puVar8 = puVar5;
          puVar9 = puVar4;
          do {
            uVar1 = *puVar9;
            iVar10 = iVar10 + -1;
            puVar9 = puVar9 + 0x140;
            *puVar8 = uVar1;
            puVar8 = puVar8 + (iVar6 >> 1);
          } while (iVar10 != 0);
        }
        iVar11 = iVar11 + -1;
        puVar5 = puVar5 + (iVar7 >> 1);
        puVar4 = puVar4 + -1;
      } while (iVar11 != 0);
    }
    if (getenv("UW_DEBUG_FLUSHCALLER")) {
      void *caller = __builtin_return_address(0);
      Dl_info info;
      const char *name = (dladdr(caller, &info) && info.dli_sname) ? info.dli_sname : "?";
      static unsigned int call_count = 0;
      call_count++;
      fprintf(stderr, "[flushcaller] call=%u tick=%u caller=%s(%p)\n", call_count, g_uw_frame_clock_units, name, caller);
    }
    GXEndDraw();
  }
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0002310c -- near-identical twin of flush_dirty_rect_to_display
// above, clamped to a 240px-tall dirty rect instead of 200px; likely a
// different screen-height device variant of the same GX-hardware flush.
void flush_dirty_rect_to_display_240()

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  undefined2 *puVar5;
  int iVar6;
  int iVar7;
  undefined2 *puVar8;
  undefined2 *puVar9;
  int iVar10;
  int iVar11;
  
  if (DAT_00088954 < 0) {
    DAT_00088954 = 0;
  }
  else if (0xf0 < DAT_00088954) {
    DAT_00088954 = 0xf0;
  }
  iVar2 = DAT_00088954;
  if (DAT_0008895c < 0) {
    DAT_0008895c = 0;
  }
  else if (0xf0 < DAT_0008895c) {
    DAT_0008895c = 0xf0;
  }
  iVar3 = DAT_0008895c;
  if (DAT_00088950 < 0) {
    DAT_00088950 = 0;
  }
  else if (0x140 < DAT_00088950) {
    DAT_00088950 = 0x140;
  }
  if (DAT_00088958 < 0) {
    DAT_00088958 = 0;
  }
  else if (0x140 < DAT_00088958) {
    DAT_00088958 = 0x140;
  }
  iVar10 = 0x140 - DAT_00088958;
  iVar11 = 0x140 - DAT_00088950;
  if ((DAT_0023cdc0 == 0x10) && (DAT_0023c430 = GXBeginDraw(), DAT_0023c430 != (void *)0x0)) {
    iVar6 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar6 = DAT_0023cdb8 + 1;
    }
    iVar7 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar7 = DAT_0023cdbc + 1;
    }
    puVar5 = (undefined2 *)((char *)DAT_0023c430 + ((iVar7 >> 1) * iVar10 + (iVar6 >> 1) * iVar2) * 2);
    /* DAT_00088958 ("right") is a right-*exclusive* dirty-rect bound
       everywhere else in this function (e.g. `iVar10 = 0x140 -
       DAT_00088958` correctly treats it as a remaining-width count), but
       here it's used directly as a starting column INDEX -- when the
       dirty rect spans the full screen width (right==0x140), this reads
       one full source row past the buffer's end (ASAN heap-buffer-
       overflow). Needs the same -1 every other direct-index use of a
       right/bottom bound in this codebase gets to become the last
       *valid* column instead of one-past-it. */
    puVar4 = (undefined2 *)
             ((g_uw_framebuffer) +
             (DAT_00088954 * 0x140 + (DAT_00088958 - 1)) * 2);
    if (iVar10 < iVar11) {
      iVar11 = iVar11 - iVar10;
      do {
        if (iVar2 < iVar3) {
          iVar10 = iVar3 - iVar2;
          puVar8 = puVar5;
          puVar9 = puVar4;
          do {
            uVar1 = *puVar9;
            iVar10 = iVar10 + -1;
            puVar9 = puVar9 + 0x140;
            *puVar8 = uVar1;
            puVar8 = puVar8 + (iVar6 >> 1);
          } while (iVar10 != 0);
        }
        iVar11 = iVar11 + -1;
        puVar5 = puVar5 + (iVar7 >> 1);
        puVar4 = puVar4 + -1;
      } while (iVar11 != 0);
    }
    GXEndDraw();
  }
  return;
}




// was FUN_0003e44c -- per-frame(ish) HUD/gameplay-mode refresh, called
// from enter_dungeon_view (chargen completion, returning from a menu,
// etc.); re-establishes the mode-icon highlight if a mode is already
// selected, then calls sync_player_stats_to_hud. Its first call
// passes s_init_gamedisp_goes_000858e8 ("init_gamedisp goes..."), a
// leftover original-build debug string strongly suggesting this
// function's real name was closer to init_gamedisp.
void enter_dungeon_view_hud_init()

{
  debug_print(s_init_gamedisp_goes_000858e8);
  init_inventory_panel_hotspots();
  init_msg_scroll_panel();
  resume_music_playback();
  register_stats_panel_click_regions();
  if (DAT_000868d8 == 0) {
    if (g_cursor_mode != 0) {
      /* Dropped argument (confirmed via disassembly of 0x3e44c: r0
         holds g_cursor_mode, untouched since the guard's own load,
         right up to `bl 0x3f99c`) -- the real ARM code passes
         g_cursor_mode through via register reuse. Without it, the
         mode icon's initial highlight on entering the dungeon view
         drew with whatever id happened to be left over in r0. */
      mode_icon_highlight_on((int)g_cursor_mode);
    }
  }
  else {
    run_pause_menu_modal_loop(1);
  }
  sync_player_stats_to_hud();
  redraw_hud_panels();
  return;
}




// was FUN_0003f99c -- draws the "selected" state for mode icon
// param_1 (1-based) by blitting LFTI.GR's per-icon highlight frame
// (id (param_1-1)*-2+0x200b) at that icon's registered position
// (DAT_000858a8/DAT_000858b8). Called both from
// cursor_mode_button_click's own click handling and from
// enter_dungeon_view_hud_init/close_ui_panel_return_to_game to
// re-establish the highlight when a mode is already selected.
void mode_icon_highlight_on(param_1)
int param_1;

{
  int iVar1;
  short sVar2;
  short sVar3;
  
  iVar1 = (param_1 + -1) * 0x10000 >> 0x10;
  sVar2 = *(short *)(&DAT_000858a8 + iVar1 * 2);
  sVar3 = *(short *)(&DAT_000858b8 + iVar1 * 2);
  decrement_cursor_hide_depth();
  g_blit_transparent_mode = 1;
  /* Confirmed via real ARM disassembly (0x3f99c: `mov r0,#0x2000;
     orr r0,r0,#0xb; sub r0,r0,r4,lsl #0x1`) that `(param_1-1)*-2 +
     0x200b` is exactly what the original compiled code computes --
     NOT a decompile artifact. The "door sprite" bug is NOT here; see
     resolve_sprite_id_to_frame/the resource loader instead. */
  if (getenv("UW_DEBUG_MODEICON"))
    fprintf(stderr, "[modeicon] mode_icon_highlight_on (highlight ON) param_1=%d iVar1=%d id=0x%x x=%d y=%d\n",
            param_1, iVar1, (param_1 + -1) * -2 + 0x200b, (int)sVar2, (int)sVar3);
  draw_sprite_by_id((param_1 + -1) * -2 + 0x200b,(int)sVar2,(int)sVar3,1,1);
  g_blit_transparent_mode = 0;
  cursor_show_idle_tick();
  return;
}



// was FUN_0003fa1c -- un-highlights mode icon param_1 (1-based),
// mode_icon_highlight_on's counterpart: draws LFTI.GR's adjacent
// "unselected" frame (id (0x1005-(param_1-1))*2) at the same position.
void mode_icon_highlight_off(param_1)
int param_1;

{
  int iVar1;
  short sVar2;
  short sVar3;
  
  iVar1 = (param_1 + -1) * 0x10000 >> 0x10;
  sVar2 = *(short *)(&DAT_000858a8 + iVar1 * 2);
  sVar3 = *(short *)(&DAT_000858b8 + iVar1 * 2);
  decrement_cursor_hide_depth();
  g_blit_transparent_mode = 1;
  /* Confirmed via real ARM disassembly (0x3fa1c: `mov r0,#0x1000;
     orr r0,r0,#0x5; sub r0,r0,r4; mov r0,r0,lsl #0x1`) that
     `(0x1005-(param_1-1))*2` is exactly what the original compiled
     code computes -- NOT a decompile artifact. Reverted an earlier
     incorrect "fix" that dropped this doubling; see resolve_sprite_id_to_frame/the
     resource loader for the real "door sprite" bug instead. */
  if (getenv("UW_DEBUG_MODEICON"))
    fprintf(stderr, "[modeicon] mode_icon_highlight_off (highlight OFF) param_1=%d iVar1=%d id=0x%x x=%d y=%d\n",
            param_1, iVar1, (0x1005 - (param_1 + -1)) * 2, (int)sVar2, (int)sVar3);
  draw_sprite_by_id((0x1005 - (param_1 + -1)) * 2,(int)sVar2,(int)sVar3,1,1);
  g_blit_transparent_mode = 0;
  cursor_show_idle_tick();
  return;
}



// was FUN_0003faa0
void cursor_mode_button_click(param_1)
short param_1;

{
  int iVar1;
  undefined2 uVar2;
  byte bVar3;
  char cVar4;
  short sVar5;
  if (getenv("UW_DEBUG_MODEBTN"))
    fprintf(stderr, "[modebtn] cursor_mode_button_click in: param_1=%d rel_y=%d cursor_mode=%d\n",
            (int)param_1, (int)DAT_00085a6c[1], (int)g_cursor_mode);
  uint uVar6;
  int iVar7;
  
  if ((g_cursor_holding_state == 0) && ((short)DAT_00201b60 == 1)) {
    iVar7 = (int)param_1;
    if (iVar7 == -1) {
      if (DAT_000868d8 == 0) {
        sVar5 = ordint_divmod(0x12,DAT_00085a6c[1] + 2).quot;
        iVar7 = (int)sVar5;
        if (getenv("UW_DEBUG_MODEBTN"))
          fprintf(stderr, "[modebtn] resolved iVar7=%d\n", iVar7);
        if (5 < iVar7) {
          return;
        }
      }
      else {
        handle_pause_menu_region_click((int)*DAT_00085a6c,(int)DAT_00085a6c[1]);
      }
    }
    if (iVar7 == 5) {
      run_pause_menu_modal_loop(1);
    }
    else {
      set_hud_status_value(8,6);
      uVar6 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfffd;
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar6;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar6 >> 8);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        pop_cursor_icon(3);
      }
      iVar7 = (iVar7 + 1) * 0x10000;
      iVar1 = iVar7 >> 0x10;
      if (iVar1 == g_cursor_mode) {
        /* Dropped argument (Ghidra emitted a bare call despite
           mode_icon_highlight_off's own body using param_1 throughout) -- confirmed
           by this same function's sibling call sites elsewhere in the
           file (mode_icon_highlight_off(2), mode_icon_highlight_off(5)) using the correct
           explicit-argument convention. mode_icon_highlight_off un-highlights
           whichever mode icon is currently selected, so it needs the
           OLD g_cursor_mode value (read here, before it's overwritten
           below) -- this is the exact "door image" bug: without it, the
           call ran on register-leftover garbage, resolving to a wild,
           essentially random absolute sprite frame instead of the
           intended icon. */
        mode_icon_highlight_off(g_cursor_mode);
        g_cursor_mode = 0;
      }
      else {
        if (g_cursor_mode != 0) {
          mode_icon_highlight_off(g_cursor_mode);
        }
        g_cursor_mode = (short)((uint)iVar7 >> 0x10);
        if (getenv("UW_DEBUG_MODEBTN"))
          fprintf(stderr, "[modebtn] resulting g_cursor_mode=%d\n", (int)g_cursor_mode);
        if (iVar1 == 2) {
          if ((*(byte *)(DAT_00086df8 + 0xb8) & 1) == 0) {
            uVar2 = *(undefined2 *)(DAT_00086df8 + 0x5f);
            *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar2 | 2;
            *(char *)(DAT_00086df8 + 0x60) = (char)((ushort)uVar2 >> 8);
            set_hud_status_value(8,4);
            mode_icon_highlight_on((int)g_cursor_mode);
            bVar3 = get_current_music_track();
            if ((bVar3 < 5) || (bVar3 = get_current_music_track(), 7 < bVar3)) {
              set_pending_music_track(8);
            }
          }
          else {
            g_cursor_mode = 0;
          }
        }
        else {
          mode_icon_highlight_on(iVar1);
        }
      }
      if (((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) && (cVar4 = get_current_music_track(), cVar4 == '\b')) {
        pick_random_pending_music_track();
      }
      wait_for_click_release(1);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        push_cursor_icon(0x1077);
      }
    }
  }
  return;
}



// was FUN_0003fd14 -- registered over the same mode-icon-bar click
// rect as cursor_mode_button_click but under a different active-mask
// bit (4, not 1), so it's live in a different input context. Near-
// identical body, but only lets the click force-select mode 3 (any
// other resolved index besides toggling the current mode back off is
// ignored) -- a restricted variant of the normal click handler.
void cursor_mode_button_click_restricted(param_1)
short param_1;

{
  int iVar1;
  char cVar2;
  short sVar3;
  uint uVar4;
  int iVar5;
  
  if ((g_cursor_holding_state == 0) && ((short)DAT_00201b60 == 1)) {
    iVar5 = (int)param_1;
    if (iVar5 == -1) {
      if (DAT_000868d8 == 0) {
        sVar3 = ordint_divmod(0x12,DAT_00085a6c[1] + 2).quot;
        iVar5 = (int)sVar3;
        if (5 < iVar5) {
          return;
        }
      }
      else {
        handle_pause_menu_region_click((int)*DAT_00085a6c,(int)DAT_00085a6c[1]);
      }
    }
    if (iVar5 == 5) {
      run_pause_menu_modal_loop(1);
    }
    else {
      set_hud_status_value(8,6);
      uVar4 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfffd;
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar4;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar4 >> 8);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        pop_cursor_icon(3);
      }
      iVar5 = (iVar5 + 1) * 0x10000;
      iVar1 = iVar5 >> 0x10;
      if (iVar1 == g_cursor_mode) {
        /* Same dropped-argument bug as cursor_mode_button_click's own
           two identical sites above -- see that comment. */
        mode_icon_highlight_off(g_cursor_mode);
        g_cursor_mode = 0;
      }
      else if (iVar1 == 3) {
        if (g_cursor_mode != 0) {
          mode_icon_highlight_off(g_cursor_mode);
        }
        g_cursor_mode = (short)((uint)iVar5 >> 0x10);
        mode_icon_highlight_on(3);
      }
      if (((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) && (cVar2 = get_current_music_track(), cVar2 == '\b')) {
        pick_random_pending_music_track();
      }
      wait_for_click_release(1);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        push_cursor_icon(0x1077);
      }
    }
  }
  return;
}




// was FUN_000497cc -- runs once per in-game main-loop iteration: resets
// the dirty rect to a degenerate {100,100,100,100}, redraws the small
// HUD/cursor element, and flushes that to the display
void main_loop_hud_flush()

{
  uw_begin_present_batch();
  unsigned int _dbg_hf_t0 = 0;
  int _dbg_hf = getenv("UW_DEBUG_HUDSPLIT") != NULL;
  if (_dbg_hf) _dbg_hf_t0 = read_realtime_clock_units() * 4;
  dirty_rect_set(100,100,100,100);
  /* HACK: redraw the 3D dungeon view on every main-loop iteration.
     Normally the redraw is driven off dirty bit 3, which apply_movement_tick
     only sets while a motion flag is live -- so the dungeon view freezes the
     instant the player is idle (and never repaints for anything that changes
     in view without the player moving). */
  int _did_force_redraw = 0;
  {
    static int _force = -1;
    if (_force < 0) _force = (getenv("UW_NO_FORCE_3D_REDRAW") == NULL);
    if (getenv("UW_DEBUG_DOOR")) {
      static int _last_b64 = -1, _last_c90 = -1;
      if ((int)DAT_00201b64 != _last_b64 || (int)DAT_00201c90 != _last_c90) {
        fprintf(stderr, "[door] main_loop_hud_flush: DAT_00201b64=%d DAT_00201c90=%d\n",
                (int)DAT_00201b64, (int)DAT_00201c90);
        _last_b64 = (int)DAT_00201b64;
        _last_c90 = (int)DAT_00201c90;
      }
    }
    /* Bit 0's enter_dungeon_view handler must fade the outgoing screen
       before drawing the dungeon. Do not overwrite it with this added
       per-tick redraw before the original transition handler runs. */
    if (_force && DAT_00201b64 == 0 && DAT_00201c90 == 0 &&
        (DAT_00201c84 & 1) == 0) {
      _did_force_redraw = 1;
      /* Rebuild AND re-rasterise the 3D dungeon view every main-loop
         iteration. An earlier version called only render_dungeon_view()
         over the existing geometry -- but the camera globals it reads
         (DAT_000db438.. position / DAT_000db448.. angles) are only synced
         from the player object by build_frame_draw_list(), and the visible
         -tile geometry only by walk_visible_tiles() inside
         rebuild_dungeon_view(). Skipping both meant the view never changed
         as the player moved or turned -- the exact symptom being fixed.
         render_dungeon_frame_timed() is the real per-frame entry point
         this main-loop hack should have been calling all along (was
         full_dungeon_redraw() -- a strict subset: same rebuild+render,
         minus the conditional-rebuild-skip optimisation, the
         weapon-swing overlay draw, three more per-frame steps, and the
         adaptive-quality timing feed). Found by tracing why
         weapon_swing_draw_tick -- confirmed fully working once wired up
         -- never actually appeared on screen during ordinary play: its
         only call site turned out to be render_dungeon_frame_timed,
         which nothing in the normal per-tick path was calling.
         render_dungeon_frame_timed reaches rebuild_dungeon_view, which
         has its own passive exploration-XP trickle (grant_experience_points,
         restored once its dropped real argument was recovered from ARM
         disassembly -- see that function's own comment); no special
         handling needed for it here, since it only grants XP for tiles
         whose automap-reveal flag is flipping from unrevealed to
         revealed for the first time ever (sticky, never un-set), so
         calling this hack more often than the original cadence can't
         double-grant for the same exploration. render_dungeon_frame_timed
         does its own dirty_rect_union internally (same rect this hack
         used to set by hand), so flush_dirty_rect_to_display(1) below
         still blits it -- GX batches these flushes with the final HUD
         flush. Skipped while an animation owns the view (DAT_00201c90
         != 0). Set UW_NO_FORCE_3D_REDRAW to restore the motion-gated
         behaviour. */
      render_dungeon_frame_timed();
      /* UW_DEBUG_PICK_VIEW: run a pick-mode render pass to fill the pick
         buffer, then paint it over the viewport (see
         uw_debug_blit_pick_buffer). */
      { static int _pv = -1;
        if (_pv < 0) _pv = (getenv("UW_DEBUG_PICK_VIEW") != NULL);
        if (_pv) { render_dungeon_view_frame(); uw_debug_blit_pick_buffer(); }
      }
    }
  }
  if (DAT_00201c84 != 0) {
    /* The forced pass already serviced this redraw request. */
    if (_did_force_redraw) DAT_00201c84 &= ~2;
    dispatch_sticky_mode_handlers();
  }
  /* HACK: drive the attack-swing state machine (tick_weapon_swing_state) every
     main-loop tick. Its own body is a real, correct state machine
     (wind-up -> resolve-impact -> follow-through -> return-to-idle,
     gated on DAT_0010062c/DAT_000870e4 and a real-elapsed-time
     accumulator read via read_realtime_clock_units()), but interact_attack only
     ever calls it ONCE, with a nonzero param_1, to arm the swing
     (DAT_0010062c set to a negative wind-up countdown). Nothing else
     in the normal per-tick path calls tick_weapon_swing_state(0) to let that
     countdown actually progress -- its only two "continue" (param_1==0)
     call sites are one-shot level-load/save-load edge cases, not a
     per-frame driver. Confirmed live: a real attack arms correctly
     (weapon raises, [swing] trace shows a real wind-up countdown) but
     then sits frozen forever, since nothing ever asks it to advance
     past that point. Matches this same file's DAT_00085668 per-frame
     dispatch table being link-time data Ghidra couldn't recover (see
     its own comment) -- tick_weapon_swing_state(0) was almost certainly one of
     that table's real entries originally. Calling it here is cheap
     when idle (a couple of int compares) and exactly mirrors the
     already-fixed render_dungeon_frame_timed hack above. Set
     UW_NO_FORCE_SWING_TICK to restore the (broken) original behaviour. */
  { static int _swing_tick = -1;
    if (_swing_tick < 0) _swing_tick = (getenv("UW_NO_FORCE_SWING_TICK") == NULL);
    if (_swing_tick) tick_weapon_swing_state(0);
  }
  { unsigned int _t1 = 0, _t2 = 0;
    if (_dbg_hf) _t1 = read_realtime_clock_units() * 4;
    /* Input callbacks can run blocking prompt/menu loops. Keep their
       presentations immediate rather than annotating every such loop. */
    uw_suspend_present_batch();
    poll_input_bindings(DAT_00085a6c);
    uw_resume_present_batch();
    if (_dbg_hf) {
      _t2 = read_realtime_clock_units() * 4;
      fprintf(stderr, "[hudsplit] pre_pib_ms=%u pib_ms=%u\n", _t1 - _dbg_hf_t0, _t2 - _t1);
    }
  }
  { static int _div = -1;
    if (_div < 0) _div = (getenv("UW_DEBUG_DRAW_INV_POSITIONS") != NULL);
    if (_div) uw_debug_draw_inv_hotspot_positions();
  }
  /* HACK: re-run the per-tick mouse/cursor refresh (update_mouse_state)
     unconditionally every main-loop iteration, not just when this tick
     happens to dequeue a real OS input message.

     update_mouse_state's own cursor-draw (draw_idle_mouse_cursor) is
     reached only through poll_input_event()->poll_mouse_event(), which
     is itself gated behind PeekMessageW finding a message THIS tick
     (see poll_input_event's own body in input.c). A plain, physically
     stationary mouse generates no WM_MOUSEMOVE at all between actual
     pointer motions -- but the forced full dungeon-view redraw just
     above (this same function's earlier hack) repaints the entire 3D
     viewport every single tick regardless, painting over wherever the
     cursor sprite was last drawn. The net effect: a motionless cursor
     hovering over the 3D view gets erased by the next redraw tick and
     stays invisible until the next real mouse-move message happens to
     arrive -- "cursor not drawing always", reproducible anywhere the
     view keeps redrawing without the mouse itself moving (idle hover,
     combat, automap panning, dialogs advancing on their own).

     update_mouse_state() is already safe to call speculatively: it
     early-returns to a no-op whenever there's nothing to do (mouse
     physically idle and D-pad/joystick emulation inactive, or
     DAT_000bbef8's own suspend flag set), and its own erase-then-redraw
     protocol (erase_cursor_icon() first, save_cursor_background() again
     before the fresh draw) makes a redundant extra call in the same
     tick as a real message-driven call harmless -- same sequence the
     original code already performs every time a mouse message arrives,
     just invoked more often. Set UW_NO_FORCE_CURSOR_REDRAW to restore
     the message-reactive-only behaviour. */
  { static int _force_cursor = -1;
    if (_force_cursor < 0) _force_cursor = (getenv("UW_NO_FORCE_CURSOR_REDRAW") == NULL);
    if (_force_cursor) update_mouse_state();
  }
  /* Debug UI: must draw HERE, after the forced 3D redraw above (or it
     gets painted over) but before flush_dirty_rect_to_display(1) below
     -- that call is the actual screen present for this tick (blits the
     software framebuffer through to GXEndDraw/SDL_RenderPresent, see
     gx_stub.c). Drawing from app_main_loop after this function returns
     is one full tick too late: the present for THIS tick already
     happens inside this function, and the very next tick's forced 3D
     redraw runs and gets flushed before this function is reached
     again -- so the panel's own pixels never survive to reach an
     actually-presented frame. rect_fill_or_save_restore/draw_text_string
     already call dirty_rect_union themselves, so the panel's region is
     automatically included in the flush below once drawn here. */
  dbgui_draw();
  uw_debug_dump_sprite_frames_once();
  uw_debug_dump_critter_sheet_once();
  uw_debug_force_item_id_once();
  /* When the forced 3D redraw ran this frame, push it through even if a
     mouse button is being held in the viewport: DAT_0023c63c (the
     click-hold flag) otherwise blocks flush_dirty_rect_to_display's real
     screen flush for the whole hold, so a click-and-hold-to-walk froze
     the view. */
  if (_did_force_redraw) {
    g_force_flush = 1;
    flush_dirty_rect_to_display(1);
    g_force_flush = 0;
  } else {
    flush_dirty_rect_to_display(1);
  }
  /* REVERTED (was a hand-hacked lit-torch HUD icon flicker -- see
     mode-icon-and-hud-icon-flicker-fixes memory for the full arc).
     Unconditionally rotating palette_cycle_range(16,8,1) every 8 ticks
     from here ran regardless of dungeon-view state and touched the
     shared global palette (DAT_00088d98/g_palette_rgb565), the same
     table raster_textured_span samples fresh every frame for ALL 3D
     wall/floor/ceiling rendering -- including real lava textures this
     project confirmed use this exact fire-gradient range (F32.TR/
     F16.TR entries 24/25, W64.TR/W16.TR entry 206). If the original
     game's own (still-unfound) global fire/water palette-animation
     mechanism turns up later, this hack would already be stomping on
     the same palette range and timing, corrupting or double-animating
     it. Pulled until that original mechanism is found or ruled out for
     good; the equipped lit-torch HUD icon is back to not animating. */
  uw_end_present_batch();
  return;
}




// was FUN_0005d704 -- append the fixed HUD draw-command opcode sequence (compass, panels, sprite ids from get_catalog_sprite_width) to the draw-command list DAT_00110fc0
void emit_hud_draw_commands()

{
  short sVar1;
  undefined2 uVar2;
  bool bVar3;
  
  DAT_0023b830 = 1;
  sVar1 = g_current_view->view_shake_x;
  bVar3 = sVar1 == 0;
  if (bVar3) {
    sVar1 = g_current_view->view_shake_y;
  }
  DAT_0023b4dc = (uint)(bVar3 && sVar1 == 0);
  *DAT_00110fc0 = 0x38;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  emit_glyph_draw_command(0xa0,1);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x2200;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x400;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x1100;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x3300;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(9);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(8);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(4);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189582 = 1;
  DAT_00189580 = 1;
  DAT_00189578 = 0;
  *DAT_00110fc0 = 0xd0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (undefined2)DAT_0023b4dc;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_0023b4f4 = DAT_00086b38;
  DAT_0023b80c = DAT_00086b40;
  DAT_0023b4d4 = DAT_00086b48;
  dungeon_view_prepass_stub(2);
  DAT_0023bc8c = *(undefined2 *)(&DAT_00086b50 + DAT_0023b4a0 * 4);
  DAT_0023b8c0 = *(undefined2 *)(&DAT_00086b52 + DAT_0023b4a0 * 4);
  walk_visible_tiles();
  return;
}




// was FUN_0006ca4c -- brief "shake" animation played on a flask's
// shared decoration slot ((&DAT_0023c224)[iVar1]) when
// hud_vitals_bar_tick's health-poisoned or mana threshold check
// crosses over; param_1 selects health(0)/mana(1) and picks which of
// the 3 literal id ranges (0x200c/0x203e/0x2025) to animate through.
void hud_vitals_threshold_shake(param_1)
short param_1;

{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  byte *pbVar5;
  
  iVar1 = (int)param_1;
  if (iVar1 == 0) {
    if ((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) == 0) {
      sVar2 = 0x200c;
    }
    else {
      sVar2 = 0x203e;
    }
    iVar4 = (int)sVar2;
  }
  else {
    if (iVar1 != 1) {
      return;
    }
    iVar4 = 0x2025;
  }
  draw_sprite_by_id(0x2057,(int)*(short *)(&DAT_000870ec + iVar1 * 2),0x7e,1,1);
  iVar3 = 0;
  pbVar5 = &DAT_0023c118 + iVar1;
  if (*pbVar5 != 0) {
    do {
      sprite_list_set_position((int)(short)(&DAT_0023c224)[iVar1],(int)*(short *)(&DAT_000870ec + iVar1 * 2),
                   (int)(short)(&DAT_000870f2)[iVar3]);
      sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[iVar1],iVar3 + iVar4);
      flush_sprite_list_compositor();
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < (int)(uint)*pbVar5);
  }
  (&DAT_0023c128)[iVar1] = *pbVar5;
  return;
}




void redraw_hud_panels()

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;

  DEBUG(INFO, "[hud] Setting up hud graphics?\n");

  if (DAT_0023c23c == 0) {
    iVar3 = 0;
    do {
      uVar1 = sprite_list_alloc_entry(0);
      (&DAT_0023c224)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,0,0,0x18,4);
      uVar1 = sprite_list_alloc_raw_entry(2,0xd,10);
      (&DAT_0023c230)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087170)[iVar3],0x87,0xd,10);
      g_blit_transparent_mode = 1;
      uVar1 = sprite_list_alloc_raw_entry(2,0x25,0x17);
      (&DAT_0023c234)[iVar3] = (short)uVar1;
      g_blit_transparent_mode = 0;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087174)[iVar3],0x92,0x25,0x17);
      uVar1 = sprite_list_alloc_entry(0);
      (&DAT_0023c238)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_000871b4)[iVar3],0x42,0xc,0x1c);
      (&DAT_0023c12c)[iVar3] = 0;
      (&DAT_0023c11c)[iVar3] = 0;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < 2);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c228 = (undefined2)uVar1;
    sprite_list_set_rect(uVar1,0x70,0x84,0x38,0x20);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c22c = (undefined2)uVar1;
    if (getenv("UW_DEBUG_COMPASS")) {
      fprintf(stderr, "[compass] redraw_hud_panels init: sprite_handle=%d x=%d y=%d\n",
              (int)uVar1, (int)DAT_00087130, (int)DAT_00087150);
    }
    sprite_list_set_rect(uVar1,(int)DAT_00087130,(int)DAT_00087150,3,4);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c21c = (short)uVar1;
    sprite_list_set_rect(uVar1,0x80,5,1,1);
    DAT_0023c130 = 6;
    DAT_0023c120 = 6;
    DAT_0023c23c = 1;
  }
  iVar3 = 0;
  do {
    hud_vitals_threshold_shake(iVar3);
    sprite_list_set_frame_id((int)(short)(&DAT_0023c230)[iVar3],(&DAT_000871d4)[iVar3]);
    sprite_list_set_frame_id((int)(short)(&DAT_0023c234)[iVar3],(&DAT_000871d8)[iVar3]);
    iVar2 = 0x12;
    if (iVar3 == 0) {
      iVar2 = 0;
    }
    sprite_list_set_frame_id((int)(short)(&DAT_0023c238)[iVar3],iVar2 + 0x207b);
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 2);
  snap_compass_to_heading();
  sprite_list_set_frame_id((int)DAT_0023c21c,0x20a6);
  update_ready_rune_slot_icons(DAT_00086df8 + 0x47);
  decode_gr_entry_to_buffer(s_panels_00087260,g_active_hud_panel,DAT_0023cca4);
  /* bitmap_blit_to_framebuffer doesn't take a real "transparent mode"
     parameter -- it reads the global g_blit_transparent_mode instead (see its own
     definition in graphics.c: g_blit_transparent_mode==0 draws every source byte
     opaquely via the palette, nonzero skips byte==0 as the transparent
     key). Every OTHER caller in this file that wants transparency sets
     this global around the call (draw_sprite_by_id, mode_icon_highlight_on,
     mode_icon_highlight_off all do `g_blit_transparent_mode = 1; ...; g_blit_transparent_mode = 0;`) --
     this call's own trailing literal `1` argument clearly intended the
     same thing (it's not a real parameter bitmap_blit_to_framebuffer
     reads at all, just a leftover Ghidra also emitted at the other
     sites where it happens to coincide with the real fix), but nothing
     here ever sets the global, so this panel background blit ran
     opaque -- painting every transparent-keyed pixel in the panels.GR
     source (byte value 0) as solid black instead of leaving the
     background visible underneath. This is the inventory-area "black
     box" bug (uw.c's own DAT_0023cca4 decode is real panels.GR pixel
     data, confirmed via UW_DEBUG_DRAW framebuffer dumps -- the missing
     piece was purely this transparency-mode flag). */
  g_blit_transparent_mode = 1;
  bitmap_blit_to_framebuffer(0xec,8,DAT_0023cca4,0x72,0x53,0,0,1);
  g_blit_transparent_mode = 0;
  (*(code *)(&g_hud_panel_handlers)[g_active_hud_panel])();
  flush_sprite_list_compositor();
  return;
}




// was FUN_0006cff4 -- generic "set HUD status slot param_1 to
// param_2" dispatcher: negative param_1 writes a raw byte value
// directly, 0/1 compute a health/mana fill tier (0-12) from the
// player object via ordint_divmod (see hud_vitals_bar_tick), and other
// small param_1 values (2,3,4,6,7,8 -- seen at this session's various
// call sites) drive other HUD indicators (compass heading, action-
// animation frame, poison flash, etc.) each with their own encoding.
void set_hud_status_value(param_1,param_2)
byte param_1;
ushort param_2;

{
  int iVar1;
  char cVar2;
  byte bVar3;
  undefined1 uVar4;
  ushort uVar5;
  ushort uVar6;
  
  iVar1 = (int)(char)param_1;
  uVar4 = (undefined1)param_2;
  if (iVar1 < 0) {
LAB_0006d09c:
    DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << (uint)param_1);
    (&DAT_0023c118)[iVar1] = uVar4;
    return;
  }
  if (iVar1 < 2) {
    if (iVar1 == 1) {
      cVar2 = *(char *)(DAT_00086df8 + 0x38);
    }
    else {
      cVar2 = *(char *)(DAT_0023be74 + 4);
    }
    if (cVar2 == '\0') {
      (&DAT_0023c118)[iVar1] = 0;
    }
    else {
      uVar4 = ordint_divmod(cVar2,(short)param_2 * 0xc).quot;
      (&DAT_0023c118)[iVar1] = uVar4;
    }
    if (0xb < (byte)(&DAT_0023c118)[iVar1]) {
      (&DAT_0023c118)[iVar1] = 0xc;
    }
    goto LAB_0006d17c;
  }
  if (iVar1 == 2) {
    if (param_2 == DAT_0023c12a) {
      return;
    }
    DAT_0023c11a = uVar4;
    DAT_0023c1d8 = DAT_0023c1d8 | 4;
    return;
  }
  if (iVar1 == 3) {
    if (param_2 == 9) {
      DAT_0023c11b = uVar4;
      DAT_0023c1d8 = DAT_0023c1d8 | 8;
      return;
    }
    DAT_0023c11b = uVar4;
    DAT_0023c1e0 = DAT_0023c1e0 | 8;
    return;
  }
  if (iVar1 != 4) {
    if (iVar1 == 6) {
      if (g_active_hud_panel == '\x04') {
        return;
      }
    }
    else if (iVar1 == 8) {
      if ((DAT_000870d8 != DAT_000870dc) && (DAT_0023c120 == '\x06')) {
        return;
      }
      DAT_0023c120 = uVar4;
      DAT_0023c1dc = DAT_0023c1dc | 0x100;
      return;
    }
    goto LAB_0006d09c;
  }
  if (DAT_0023c11c == param_2) {
    return;
  }
  uVar6 = (ushort)DAT_0023c11d;
  if (uVar6 == param_2) {
    return;
  }
  if (DAT_0023c12c == param_2) {
    return;
  }
  uVar5 = (ushort)DAT_0023c12d;
  if (uVar5 == param_2) {
    return;
  }
  if (DAT_0023c12c == 0) {
joined_r0x0006d150:
    if (uVar5 == 0) {
      bVar3 = ce_rand();
      param_1 = (bVar3 & 1) + param_1;
    }
  }
  else if (uVar5 == 0) {
LAB_0006d164:
    param_1 = 5;
  }
  else {
    uVar5 = uVar6;
    if (DAT_0023c11c == 0) goto joined_r0x0006d150;
    if (uVar6 == 0) goto LAB_0006d164;
  }
  /* Was `(&DAT_0023c118)[(char)param_1] = uVar4;` -- correct for the
     iVar1<2 (health/mana) branch above, which jumps straight to
     LAB_0006d17c without reaching this line, but this specific write
     only executes for the iVar1==4 dragon-reaction branch, where
     param_1 is 4 or 5 (the resolved left/right dragon side). In the
     original 32-bit binary DAT_0023c118+4/+5 IS the same memory as
     DAT_0023c11c/DAT_0023c11d (see their own comments) -- an address
     coincidence this decompile's split, unrelated C globals don't
     preserve. hud_dragon_reaction_tick (the function this value is FOR)
     reads it back as `(&DAT_0023c11c)[iVar6]` where iVar6=param_1-4,
     never DAT_0023c118 at all -- so on this host the old line silently
     wrote a value nothing ever read, and hud_dragon_reaction_tick's own
     "has a reaction been requested" gate (`(&DAT_0023c11c)[iVar6] !=
     0`) was never satisfied, meaning the whole dragon reaction/wing-
     flap animation this function drives never started, no matter how
     many times set_hud_status_value(4,...) was called (e.g. every
     message-scroll line, msg_scroll_scroll_up_line). Write to the real
     target instead. */
  (&DAT_0023c11c)[param_1 + -4] = uVar4;
LAB_0006d17c:
  DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << (uint)param_1);
  return;
}



// was FUN_0006d284
void hud_panel_redraw_dispatch()

{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;
  uint uVar5;
  byte bVar6;
  int iVar7;
  bool bVar8;
  int iVar9;

  bVar2 = read_realtime_clock_units();
  bVar8 = false;
  if (DAT_0023c1e0 != 0) {
    iVar7 = 1;
    iVar9 = 0;
    uVar4 = DAT_0023c1e0;
    do {
      uVar1 = (ushort)iVar7;
      if ((uVar1 & uVar4) != 0) {
        (*(code *)(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
        uVar4 = DAT_0023c1e0 & ~uVar1;
        bVar8 = true;
        DAT_0023c1e0 = uVar4;
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)uVar1 << 0x11) >> 0x10;
    } while (iVar9 < 9);
  }
  bVar6 = DAT_0023c150;
  if (((DAT_0023c150 ^ bVar2) & 0xe0) != 0) {
    iVar7 = 1;
    iVar9 = 0;
    do {
      if (((ushort)iVar7 & DAT_0023c1dc) != 0) {
        (*(code *)(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
        bVar6 = DAT_0023c150;
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)(ushort)iVar7 << 0x11) >> 0x10;
    } while (iVar9 < 9);
    bVar8 = true;
  }
  if (((bVar6 ^ bVar2) & 0xc0) != 0) {
    sVar3 = ce_rand();
    if (sVar3 < 0x666) {
      uVar5 = (int)sVar3 & 1;
      if (*(int *)(&DAT_0023c1f0 + uVar5 * 4) == 0) {
        *(int *)(&DAT_0023c1f0 + uVar5 * 4) = 1;
        DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << uVar5);
      }
    }
    sVar3 = ce_rand();
    if (sVar3 < 0x666) {
      uVar5 = (int)sVar3 & 1;
      if (*(int *)(&DAT_0023c1f8 + uVar5 * 4) == 0) {
        *(int *)(&DAT_0023c1f8 + uVar5 * 4) = 1;
        DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << uVar5);
      }
    }
    iVar7 = 1;
    iVar9 = 0;
    if (getenv("UW_DEBUG_CLICKREGION") && DAT_0023c1d8 != 0)
      fprintf(stderr, "[stats] hud_panel_redraw_dispatch: DAT_0023c1d8=0x%x clock-gate open, scanning\n", (unsigned)DAT_0023c1d8);
    do {
      if (((ushort)iVar7 & DAT_0023c1d8) != 0) {
        if (getenv("UW_DEBUG_CLICKREGION"))
          fprintf(stderr, "[stats] hud_panel_redraw_dispatch: dispatching g_hud_panel_ticker_handlers[%d] (table index %d)\n", iVar9, iVar9 + 4);
        (*(code *)(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)(ushort)iVar7 << 0x11) >> 0x10;
    } while (iVar9 < 9);
    bVar8 = true;
  }
  if (bVar8) {
    flush_sprite_list_compositor();
    DAT_0023c150 = bVar2;
  }
  return;
}



// was FUN_0006d4a4
void hud_vitals_bar_tick(param_1)
short param_1;

{
  int iVar1;
  uint uVar2;
  int iVar3;
  short sVar4;
  short sVar5;
  undefined4 uVar6;
  byte *pbVar7;
  uint uVar8;
  uint uVar9;
  short *psVar10;
  short *psVar11;
  ushort local_30;
  short local_2e;
  short local_2c;
  
  uVar2 = (uint)param_1;
  if (uVar2 == 0) {
    if ((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) == 0) {
      local_30 = 0x200c;
      local_2c = 0x2019;
      local_2e = 0x2024;
      if ((0x204a < DAT_00087254) && (DAT_00087254 < 0x2057)) {
        hud_vitals_threshold_shake(0);
        DAT_00087254 = DAT_00087254 + -0x32;
      }
    }
    else {
      local_30 = 0x203e;
      local_2c = 0x204b;
      local_2e = 0x2056;
      if ((0x2018 < DAT_00087254) && (DAT_00087254 < 0x2025)) {
        hud_vitals_threshold_shake(0);
        DAT_00087254 = DAT_00087254 + 0x32;
      }
    }
  }
  else {
    if (uVar2 != 1) {
      return;
    }
    local_30 = 0x2025;
    local_2c = 0x2032;
    local_2e = 0x203d;
  }
  iVar1 = uVar2 * 2;
  psVar11 = (short *)(&DAT_0023c244 + iVar1);
  if (*psVar11 == 0) {
    uVar6 = sprite_list_alloc_entry(0);
    *psVar11 = (short)uVar6;
    sprite_list_set_rect(uVar6,(int)*(short *)(&DAT_000870ec + iVar1),0x7e,0x18,0x21);
    uVar6 = sprite_list_alloc_entry(0);
    *(short *)(&DAT_0023c240 + iVar1) = (short)uVar6;
    sprite_list_set_rect(uVar6,0,0,0x18,4);
    uVar6 = sprite_list_alloc_entry(0);
    *(short *)(&DAT_0023c248 + iVar1) = (short)uVar6;
    sprite_list_set_rect(uVar6,(int)*(short *)(&DAT_000870ec + iVar1),0x7e,0x18,4);
  }
  pbVar7 = &DAT_0023c128 + uVar2;
  uVar8 = (uint)*pbVar7;
  iVar3 = (int)(((byte)(&DAT_0023c118)[uVar2] - uVar8) * 0x10000) >> 0x10;
  if (iVar3 < 1) {
    if (iVar3 < 0) {
      uVar9 = uVar8 + 0xff;
      sVar4 = *(short *)(&DAT_000870ec + iVar1);
      uVar8 = uVar9 & 0xff;
      *pbVar7 = (byte)uVar9;
      iVar3 = (int)(short)uVar8;
      sVar5 = (&DAT_000870f2)[iVar3];
      sprite_list_set_rect((int)*psVar11,(int)sVar4,(int)sVar5,0x18,
                   (&DAT_00087114)[iVar3]);
      sprite_list_set_lifetime((int)*psVar11,sVar5 + -0x7e);
      sprite_list_set_frame_id((int)*psVar11,0x2057);
      if (iVar3 != 0) {
        sprite_list_set_position((int)(short)(&DAT_0023c224)[uVar2],(int)*(short *)(&DAT_000870ec + iVar1),
                     (int)*(short *)(&DAT_000870f0 + iVar3 * 2));
        sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
      }
    }
    else if (*(int *)(&DAT_0023c1f0 + uVar2 * 4) == 0) {
      DAT_0023c1d8 = DAT_0023c1d8 & ~(ushort)(1 << (uVar2 & 0xff));
    }
  }
  else {
    uVar9 = uVar8 + 1;
    sVar4 = *(short *)(&DAT_000870ec + iVar1);
    uVar8 = uVar9 & 0xff;
    *pbVar7 = (byte)uVar9;
    sprite_list_set_position((int)(short)(&DAT_0023c224)[uVar2],(int)sVar4,
                 (int)*(short *)(&DAT_000870f0 + (short)uVar8 * 2));
    sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
  }
  if (((*(int *)(&DAT_0023c1f0 + uVar2 * 4) == 1) && (uVar9 = (uint)(short)uVar8, uVar9 < 8)) &&
     (uVar9 != 0)) {
    psVar11 = &DAT_00087254 + uVar2;
    if (*psVar11 == local_2e) {
      *psVar11 = local_2c;
      sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
      *(int *)(&DAT_0023c1f0 + uVar2 * 4) = 0;
    }
    else {
      psVar10 = (short *)(&DAT_000870f0 + uVar9 * 2);
      sprite_list_set_position((int)*(short *)(&DAT_0023c240 + iVar1),(int)*(short *)(&DAT_000870ec + iVar1),
                   (int)*psVar10);
      sVar4 = *(short *)(&DAT_0023c240 + iVar1);
      *psVar11 = *psVar11 + 1;
      sprite_list_set_frame_id((int)sVar4,(int)*psVar11);
      psVar11 = (short *)(&DAT_0023c248 + iVar1);
      sprite_list_set_lifetime((int)*psVar11,*psVar10 + -0x7e);
      sprite_list_set_position((int)*psVar11,(int)*(short *)(&DAT_000870ec + iVar1),(int)*psVar10);
      sprite_list_set_frame_id_transparent((int)*psVar11,0x2058);
    }
  }
  return;
}



// was FUN_0006d894, briefly named hud_damage_flash_tick by an earlier
// pass. Renamed again: despite the "damage" name, its 3 real callers
// (msg_scroll_scroll_up_line on every message-scroll line,
// sync_player_stats_to_hud on an HP/poison threshold, award_monster_kill_experience on
// a trap/switch-type object trigger) are mostly unrelated to damage --
// "damage" only describes one of the three. What this function
// actually drives, dispatched via set_hud_status_value's status
// category 4/5 (param_1, left/right dragon) through
// g_hud_panel_handlers_table/g_hud_panel_ticker_handlers alongside its hud_X_tick
// siblings: a small state machine (param_1-4 -> iVar6, indexing every
// DAT_0023c11c/DAT_0023c12c-family global 0=left/1=right) that plays
// the dragon decoration's reactive TAIL whip (DAT_0023c238's frame,
// stepped through DAT_000871b8's per-side sequence) together with a
// short-lived HEAD-animation overlay sprite (DAT_0023c1e8's slot,
// distinct from DAT_0023c230's own static head sub-sprite) positioned
// via the recovered DAT_00087178/DAT_00087188/PTR_DAT_00087198/
// PTR_DAT_000871a8 rect table (see that table's own comment for the
// "drew at 0,0" bug this state machine's dormancy used to hide).
// "Dragon reacting to a HUD-worthy event" is the real generalization;
// the event doesn't have to be damage.
void hud_dragon_reaction_tick(param_1)
int param_1;

{
  int iVar1;
  uint uVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  int iVar6;
  short *psVar7;
  int iVar8;
  short *psVar9;
  int *piVar10;
  short *psVar11;
  short local_40 [8];
  short local_30 [6];
  
  local_40[0] = 0x206f;
  local_40[1] = 0x2073;
  local_40[2] = 0x2077;
  local_40[3] = 0x2081;
  local_40[4] = 0x2085;
  local_40[5] = 0x2089;
  local_30[0] = 0x2072;
  local_30[1] = 0x2076;
  local_30[2] = 0x207a;
  local_30[3] = 0x2084;
  local_30[4] = 0x2088;
  local_30[5] = 0x208c;
  uVar2 = (uint)(short)param_1;
  if ((uVar2 != 4) && (uVar2 != 5)) {
    return;
  }
  iVar6 = (param_1 + -4) * 0x10000 >> 0x10;
  iVar1 = iVar6 * 2;
  psVar11 = &DAT_0023c1e8 + iVar6;
  if (*psVar11 == 0) {
    g_blit_transparent_mode = 1;
    sVar4 = sprite_list_alloc_raw_entry(3,0x28,0x18);
    g_blit_transparent_mode = 0;
    *psVar11 = sVar4;
  }
  piVar10 = (int *)(&DAT_0023c1f8 + iVar6 * 4);
  if (*piVar10 == 1) {
    iVar5 = (int)DAT_0023c250;
    DAT_0023c250 = DAT_0023c250 + 1;
    sprite_list_set_frame_id((int)(short)(&DAT_0023c238)[iVar6],
                 *(undefined2 *)(&DAT_000871b8 + (iVar6 * 7 + iVar5) * 2));
    if (6 < DAT_0023c250) {
      DAT_0023c250 = 0;
      *piVar10 = 0;
    }
  }
  psVar7 = &DAT_0023c1e4 + iVar6;
  if (getenv("UW_DEBUG_DRAGON"))
    fprintf(stderr, "[dragon] tick param_1=%d iVar6=%d target=%d playing=%d\n", param_1, iVar6, (int)(&DAT_0023c11c)[iVar6], (int)(&DAT_0023c12c)[iVar6]);
  if ((*psVar7 == 0) && ((&DAT_0023c11c)[iVar6] != '\0')) {
    (&DAT_0023c12c)[iVar6] = (&DAT_0023c11c)[iVar6];
    *psVar7 = 1;
    if (getenv("UW_DEBUG_DRAGON"))
      fprintf(stderr, "[dragon] STARTED animation iVar6=%d playing=%d\n", iVar6, (int)(&DAT_0023c12c)[iVar6]);
  }
  cVar3 = (&DAT_0023c12c)[iVar6];
  if (cVar3 == '\0') {
    if (*piVar10 != 0) {
      return;
    }
    DAT_0023c1d8 = DAT_0023c1d8 & ~(ushort)(1 << (uVar2 & 0xff));
    return;
  }
  if (cVar3 == '\x01') {
    sVar4 = *psVar7;
    if (sVar4 == 1) {
      (&DAT_0023c11c)[iVar6] = 0;
      iVar5 = iVar6 * 6;
      sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                   (int)*(short *)(&DAT_00087188 + iVar5),
                   (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                   *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
      *(short *)(&DAT_0023c24c + iVar1) = local_40[iVar6 * 3];
      *(undefined2 *)(&DAT_0023c124 + iVar1) = 1;
      *psVar7 = 3;
LAB_0006dec8:
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      // HACK: was draw-then-check (`sprite_list_set_frame_id(...); if
      // (local_30[iVar6*3] < *psVar9) { reset-for-next-time; }`).
      // Confirmed via real ARM disassembly that this exact `<` and
      // draw-before-check order is what the original binary computes,
      // not a decompiler artifact -- but it means the call where the
      // counter first exceeds local_30[iVar6*3] (this reaction's own
      // last legitimate frame) still draws THAT out-of-range value
      // before resetting the counter for the next cycle. The frame
      // actually shown is local_40[iVar6*3+1], the START frame of a
      // completely different reaction type, briefly flashing here.
      // Confirmed live via a frame-id trace: 0x2070,0x2071,0x2072,
      // then 0x2073 (belongs to the trap/switch reaction, not this
      // scroll one) before resetting back to 0x206f. Harmless-looking
      // on the original hardware's real frame timing, clearly visible
      // on this port's -- deliberately deviating from authentic
      // behavior here (user's call) by resetting BEFORE drawing when
      // the counter overshoots, so the foreign frame is never actually
      // handed to sprite_list_set_frame_id (this cycle just redraws
      // its own start frame, local_40[iVar6*3], one call early instead).
      if (local_30[iVar6 * 3] < *psVar9) {
        *psVar9 = local_40[iVar6 * 3];
        *(short *)(&DAT_0023c124 + iVar1) = *(short *)(&DAT_0023c124 + iVar1) + -1;
      }
      sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
      if ((&DAT_0023c11c)[iVar6] == '\0') {
        sVar4 = *(short *)(&DAT_0023c124 + iVar1);
LAB_0006df34:
        if (sVar4 != 0) {
          return;
        }
      }
LAB_0006df3c:
      sVar4 = 4;
    }
    else {
      if (sVar4 == 3) goto LAB_0006dec8;
      if (sVar4 != 4) {
LAB_0006ddf0:
        if (sVar4 != 5) {
          return;
        }
        clear_sprite_list_slot_flag((int)*psVar11);
LAB_0006de00:
        (&DAT_0023c12c)[iVar6] = 0;
        *psVar7 = 0;
        return;
      }
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      // HACK: was `sprite_list_set_frame_id(...); if (*psVar9 <=
      // local_30[iVar6*3]) return;` -- i.e. draw first, THEN decide
      // whether the counter overshot. Confirmed via real ARM
      // disassembly (0x6de4c `cmp r2,r3` / 0x6de50 `ble`) that this
      // exact `<=` and draw-before-check order is what the original
      // binary computes, not a decompiler artifact. But it means the
      // draw already happened with an out-of-range value on the call
      // where the counter first exceeds local_30[iVar6*3] (the scroll
      // reaction's own last legitimate frame) -- the actual frame
      // shown is local_40[iVar6*3+1], the START frame of the NEXT
      // reaction type, briefly flashing in this reaction's overlay
      // right before it transitions away. Confirmed live via a
      // frame-id trace showing e.g. 0x2073 (belongs to a different
      // reaction entirely) drawn here. Harmless-looking on the
      // original hardware's real frame timing, clearly visible on
      // this port's -- deliberately deviating from authentic behavior
      // here (user's call) by checking BEFORE drawing instead, so the
      // out-of-range value is never actually handed to
      // sprite_list_set_frame_id.
      if (local_30[iVar6 * 3] < *psVar9) {
        goto LAB_0006de54;
      }
      sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
      return;
LAB_0006de54:
      sVar4 = 5;
    }
    *psVar7 = sVar4;
  }
  else {
    if (cVar3 == '\x02') {
      sVar4 = *psVar7;
      if (sVar4 != 1) {
        if (sVar4 == 2) goto LAB_0006dd88;
        if (sVar4 != 3) {
          if (sVar4 != 4) goto LAB_0006ddf0;
          psVar9 = (short *)(&DAT_0023c24c + iVar1);
          sVar4 = *psVar11;
          *psVar9 = *psVar9 + -1;
          sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
          if (local_40[iVar6 * 3 + 1] <= *psVar9) {
            return;
          }
          goto LAB_0006de54;
        }
        psVar9 = (short *)(&DAT_0023c24c + iVar1);
        sVar4 = *psVar11;
        *psVar9 = *psVar9 + 1;
        sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
        iVar5 = iVar6 * 3 + 1;
        if (local_30[iVar5] < *psVar9) {
          *psVar9 = local_40[iVar5] + 2;
          *(short *)(&DAT_0023c124 + iVar1) = *(short *)(&DAT_0023c124 + iVar1) + -1;
        }
        if ((&DAT_0023c11c)[iVar6] == '\0') {
          sVar4 = *(short *)(&DAT_0023c124 + iVar1);
          goto LAB_0006df34;
        }
        goto LAB_0006df3c;
      }
      (&DAT_0023c11c)[iVar6] = 0;
      iVar8 = iVar6 * 3 + 1;
      iVar5 = iVar8 * 2;
      sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                   (int)*(short *)(&DAT_00087188 + iVar5),
                   (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                   *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
      sVar4 = local_40[iVar8];
      *(undefined2 *)(&DAT_0023c124 + iVar1) = 3;
      *(short *)(&DAT_0023c24c + iVar1) = sVar4;
      *psVar7 = 2;
LAB_0006dd88:
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
      if ((int)*psVar9 <= local_40[iVar6 * 3 + 1] + 1) {
        return;
      }
    }
    else {
      if (cVar3 != '\x03') {
        return;
      }
      sVar4 = *psVar7;
      if (sVar4 == 1) {
        (&DAT_0023c11c)[iVar6] = 0;
        clear_sprite_list_slot_flag((int)(short)(&DAT_0023c234)[iVar6]);
        iVar8 = iVar6 * 3 + 2;
        iVar5 = iVar8 * 2;
        sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                     (int)*(short *)(&DAT_00087188 + iVar5),
                     (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                     *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
        *(short *)(&DAT_0023c24c + iVar1) = local_40[iVar8];
        *(undefined2 *)(&DAT_0023c124 + iVar1) = 6;
        *psVar7 = 2;
      }
      else if (sVar4 != 2) {
        if (sVar4 == 3) {
          if (((&DAT_0023c11c)[iVar6] == '\0') &&
             (iVar6 = *(short *)(&DAT_0023c124 + iVar1) + -1,
             *(short *)(&DAT_0023c124 + iVar1) = (short)iVar6, iVar6 * 0x10000 >> 0x10 != 0)) {
            return;
          }
          *psVar7 = 4;
          return;
        }
        if (sVar4 != 4) {
          if (sVar4 != 5) {
            return;
          }
          clear_sprite_list_slot_flag((int)*psVar11);
          sprite_list_set_frame_id((int)(short)(&DAT_0023c234)[iVar6],(&DAT_000871d8)[iVar6]);
          goto LAB_0006de00;
        }
        psVar9 = (short *)(&DAT_0023c24c + iVar1);
        sVar4 = *psVar11;
        *psVar9 = *psVar9 + -1;
        sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
        if (*psVar9 != local_40[iVar6 * 3 + 2]) {
          return;
        }
        goto LAB_0006de54;
      }
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
      if ((int)*psVar9 <= (int)local_30[iVar6 * 3 + 2]) {
        return;
      }
      *psVar9 = (short)((uint)((*psVar9 + -1) * 0x10000) >> 0x10);
    }
    *psVar7 = 3;
  }
  return;
}



// was FUN_0006df70 -- one of the 13 entries in g_hud_panel_handlers_table
// (the per-tick HUD panel redraw dispatch, alongside hud_vitals_bar_tick
// and hud_dragon_reaction_tick, its naming siblings). Steps the compass
// needle's displayed heading (DAT_0023c12a) one increment toward the
// player's real heading (DAT_0023c11a) each call, clearing the "needle
// dirty" bit in DAT_0023c1d8 once it catches up. Updates the needle
// sprite via sprite_list_set_frame_id (compass rose frame) and
// sprite_list_set_position (DAT_00087130/DAT_00087150, the needle's
// recovered per-heading ellipse position table -- see their own
// comments) using the two sprite-list slot handles allocated once at
// startup by redraw_hud_panels (DAT_0023c228/DAT_0023c22c).
void hud_compass_needle_tick()

{
  int iVar1;
  short sVar2;
  uint uVar3;
  uint uVar4;

  uVar4 = (uint)DAT_0023c12a;
  sVar2 = (short)(DAT_0023c11a - uVar4);
  iVar1 = (int)((DAT_0023c11a - uVar4) * 0x10000) >> 0x10;
  if (iVar1 == 0) {
    DAT_0023c1d8 = DAT_0023c1d8 & 0xfffb;
  }
  else {
    if (iVar1 < 0) {
      sVar2 = sVar2 + 0x10;
    }
    uVar3 = uVar4 + 1;
    if (8 < sVar2) {
      uVar3 = uVar4 - 1;
    }
    uVar4 = uVar3 & 0xf;
    sprite_list_set_frame_id((int)DAT_0023c228,(uVar3 & 3) + 0x2059);
    if (getenv("UW_DEBUG_COMPASS")) {
      fprintf(stderr, "[compass] heading=%u x=%d y=%d frame_id=0x%x\n", uVar4,
              (int)(short)(&DAT_00087130)[(short)uVar4], (int)(short)(&DAT_00087150)[(short)uVar4],
              (unsigned)uVar4 + 0x205d);
    }
    sprite_list_set_position((int)DAT_0023c22c,(int)(short)(&DAT_00087130)[(short)uVar4],
                 (int)(short)(&DAT_00087150)[(short)uVar4]);
    sprite_list_set_frame_id((int)DAT_0023c22c,uVar4 + 0x205d);
    DAT_0023c12a = (byte)uVar4;
  }
  return;
}




void tick_hud_panel_transition()

{
  int iVar1;

  if (getenv("UW_DEBUG_CLICKREGION"))
    fprintf(stderr, "[stats] tick_hud_panel_transition tick: current=%d target=%d in_progress=%d\n",
            (int)g_committed_hud_panel, (int)g_target_hud_panel, (int)DAT_0023c20c);
  if (g_committed_hud_panel != g_target_hud_panel) {
    if (DAT_0023c20c == 0) {
      DAT_0023c20c = 1;
      begin_hud_panel_flip(g_target_hud_panel,0xec,8,0x53,0x72);
      g_active_hud_panel = '\x04';
    }
    iVar1 = advance_hud_panel_flip();
    if (getenv("UW_DEBUG_CLICKREGION"))
      fprintf(stderr, "[stats] tick_hud_panel_transition: advance_hud_panel_flip() -> %d\n", iVar1);
    if (iVar1 == 1) {
      g_committed_hud_panel = g_target_hud_panel;
      g_active_hud_panel = g_target_hud_panel;
      DAT_0023c20c = 0;
      DAT_0023c1d8 = DAT_0023c1d8 & 0xffbf;
      if (getenv("UW_DEBUG_CLICKREGION"))
        fprintf(stderr, "[stats] tick_hud_panel_transition: transition COMPLETE, now showing panel %d\n", (int)g_active_hud_panel);
    }
  }
  return;
}




void redraw_active_hud_panel()

{
  int iVar1;
  
  iVar1 = decode_gr_entry_to_buffer(s_panels_00087260,g_active_hud_panel,DAT_0023cca4);
  if (iVar1 == 0) {
    debug_print(&DAT_00087298);
  }
  else {
    decrement_cursor_hide_depth();
    bitmap_blit_to_framebuffer(0xec,8,DAT_0023cca4,0x72,0x53,0,0,1);
    (*(code *)(&g_hud_panel_handlers)[g_active_hud_panel])();
    set_draw_color(0x1a);
    flush_dirty_rect_to_display(1);
    cursor_show_idle_tick();
  }
  return;
}




// was FUN_0007f208
undefined4 msg_scroll_draw_edges()

{
  int iVar1;
  
  draw_sprite_by_id(DAT_00250724 + 0x20d5,0xb,0xa9,0x1c,4);
  draw_sprite_by_id(DAT_00250724 + 0x20da,0x132,0xa9,0x1c,4);
  iVar1 = (int)DAT_00250724;
  DAT_00250724 = (short)(iVar1 + 1);
  if ((iVar1 + 1) * 0x10000 >> 0x10 == 5) {
    DAT_00250724 = 0;
  }
  return 0;
}




// was FUN_0007f340
void msg_scroll_scroll_up_line(param_1)
int param_1;

{
  short sVar1;
  short sVar2;
  
  sVar1 = *(short *)(DAT_00250704 + 0xe);
  sVar2 = *(short *)(DAT_00250704 + 4);
  copy_framebuffer_rect((int)sVar2,((int)*(short *)(DAT_000879b0 + 6) + (int)sVar1) * 0x10000 >> 0x10,
               ((int)*(short *)(DAT_00250704 + 6) - (int)sVar2) * 0x10000 >> 0x10,
               ((sVar1 * -0x10000 >> 0x10) - (int)*(short *)(DAT_000879b0 + 6)) + param_1,sVar2,
               sVar1);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(*(undefined2 *)(DAT_00250704 + 4),*(undefined2 *)(DAT_00250704 + 10),
               *(undefined2 *)(DAT_00250704 + 6),param_1 + 1);
  if (DAT_00250704 == &g_msg_scroll_panel_state) {
    set_hud_status_value(4,1);
    msg_scroll_draw_edges();
  }
  else {
    draw_conversation_window_decoration();
  }
  return;
}



// was FUN_0007f454
void msg_scroll_more_prompt()

{
  undefined2 *puVar1;
  undefined1 uVar2;
  short sVar3;
  
  msg_scroll_scroll_up_line(((int)*(short *)(DAT_000879b0 + 6) + (int)*(short *)(DAT_00250704 + 10)) * 0x10000 >>
               0x10);
  sVar3 = *(short *)(DAT_00250704 + 10);
  uVar2 = *g_draw_color_index;
  *g_draw_color_index = 0xd4;
  draw_text_string(s__MORE__00087994,(int)*(short *)(DAT_00250704 + 0xc),(int)sVar3);
  wait_for_click_to_continue(0,1);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(*(undefined2 *)(DAT_00250704 + 0xc),(int)sVar3,*(undefined2 *)(DAT_00250704 + 6),
               *(undefined2 *)(DAT_00250704 + 2));
  *g_draw_color_index = uVar2;
  DAT_00250710 = *(short *)(DAT_00250704 + 0x14) + -1;
  puVar1 = (undefined2 *)(DAT_00250704 + 0xc);
  *(char *)(DAT_00250704 + 8) = (char)*puVar1;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)*puVar1 >> 8);
  return;
}



// was FUN_0007f570 -- print a string to the message scroll, word-wrapped
// at ~0x31 columns (one msg_scroll_split_escape_segments call per line).
int message_scroll_print_wrapped(param_1)
char *param_1;

{
  undefined1 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 *puVar4;
  int extraout_r3;
  int extraout_r3_00;
  /* Ghidra split these into two locals (their own stack-offset names,
     0x54 and 0x23, differ by exactly 0x31 = sizeof(auStack_54)) -- same
     "adjacent stack locals are really one buffer" pattern fixed
     elsewhere this session. They ARE meant to be contiguous: when the
     word-wrap loop below finds no space within a 49-byte chunk,
     ce_strrchr returns NULL and the fallback `puVar4 = local_23`
     is meant to NUL-terminate right at auStack_54's own end (offset 49)
     -- not a separate, unrelated 3-byte buffer the C compiler is free to
     place anywhere. Without the merge, that terminator write misses
     auStack_54 entirely, so msg_scroll_split_escape_segments prints past its real content
     into whatever stack garbage follows until it happens to hit a zero
     byte -- confirmed via a real inscription message ("The writing
     reads: We attacked the entrance...") long enough to need this
     no-space-found fallback: it printed correctly up to the wrap point
     then trailed into garbage characters. */
  undefined1 auStack_54_backing [52];
  #define auStack_54 auStack_54_backing
  #define local_23 (auStack_54_backing + 49)

  iVar2 = (int)(short)DAT_00201b60;
  /* Debug: log every string handed to the message scroll.
     param_1 is NULL at the call sites that only flush a pending
     inline graphic token (get_message_string). DAT_00201b60 (1 or 4) is the
     "message scroll is the active text sink" gate -- anything else is
     dropped on the floor, so note that too. */

    DEBUG(INFO, "[scroll] add %s\"%s\" (mode=%d)\n",
            (iVar2 == 1 || iVar2 == 4) ? "" : "DROPPED ",
            (param_1 != (char *)0x0) ? param_1 : "(inline-graphic)",
            iVar2);

  if (iVar2 == 1 || iVar2 == 4) {
    check_mouse_over_msg_scroll_panel(iVar2);
    iVar2 = extraout_r3;
    if (DAT_00250708 != 0) {
      decrement_cursor_hide_depth();
      iVar2 = extraout_r3_00;
    }
    if (DAT_00250718 != 0) {
      iVar2 = (int)DAT_00250714;
    }
    if (DAT_00250718 != 0 && iVar2 != 1) {
      DAT_00250718 = 0;
      msg_scroll_panel_reset(0);
    }
    DAT_00250710 = *(undefined2 *)(DAT_00250704 + 0x14);
    DAT_0025071c = 0;
    *g_draw_color_index = *(undefined1 *)(DAT_00250704 + 0x16);
    *DAT_00084298 = 0x2a;
    uVar3 = ce_strlen(param_1);
    for (uVar3 = uVar3 & 0xffff; 0x31 < (uVar3 & 0xffff);
        uVar3 = ((short)uVar3 - iVar2) * 0x10000 >> 0x10) {
      ce_memmove(auStack_54,param_1,0x31);
      local_23[0] = 0;
      puVar4 = (undefined1 *)ce_strrchr(auStack_54,0x20);
      if (puVar4 == (undefined1 *)0x0) {
        puVar4 = local_23;
      }
      uVar1 = *puVar4;
      *puVar4 = 0;
      iVar2 = ((int)puVar4 - (int)auStack_54) * 0x10000 >> 0x10;
      msg_scroll_split_escape_segments(auStack_54,1);
      *puVar4 = uVar1;
      param_1 = iVar2 + param_1;
    }
    ce_memmove(auStack_54,param_1,(short)uVar3 + 1);
    msg_scroll_split_escape_segments(auStack_54,0);
    DAT_00250720 = read_realtime_clock_units();
    if (DAT_00250708 != 0) {
      cursor_show_idle_tick();
    }
    iVar2 = (int)*(short *)(DAT_00250704 + 0x14);
  }
  else {
    iVar2 = -1;
  }
  return iVar2;
}
#undef auStack_54
#undef local_23




// was FUN_0007f7cc
void msg_scroll_draw_wrapped_span(param_1,param_2)
char * param_1;
undefined4 param_2;

{
  undefined2 *puVar1;
  char cVar2;
  undefined2 uVar3;
  uint uVar4;
  char *iVar5;
  undefined1 uVar6;
  int iVar7;
  /* Recursion-depth safety valve for the msg_scroll_draw_wrapped_span<->msg_scroll_wrap_split_line word-
     wrap pair: msg_scroll_wrap_split_line's search-for-a-space-to-split-on has no
     fallback once the remainder is down to a single character/space that
     still doesn't fit the remaining line width (its own retry at
     LAB_0007fc64 hands the SAME unshrinkable string straight back here),
     which is a genuine stack-overflow-via-infinite-recursion for that
     input, not a symptom of any pointer/memory bug already fixed this
     session (confirmed: reached with param_1==" " on a real run after
     every other known corruption source was already fixed). Rather than
     reverse-engineer the exact original cursor-reset semantics for that
     edge case, force this call to take the normal "print it" path once
     recursion goes needlessly deep -- printing slightly past the margin
     beats crashing the whole game over HUD message text. */
  static int s_wrap_recursion_depth = 0;
  s_wrap_recursion_depth++;

  iVar5 = 0;
  if ((g_scroll_control_codes_enabled != 0) && (*param_1 == '\\')) {
    cVar2 = param_1[1];
    param_1 = param_1 + 2;
    if (cVar2 < '6') {
      if (cVar2 == '5') {
        uVar6 = 0xc4;
      }
      else if ((cVar2 == '0') || (cVar2 == '1')) {
LAB_0007f860:
        uVar6 = 0x60;
      }
      else if (cVar2 == '2') {
        uVar6 = 0xf1;
      }
      else {
        if (cVar2 == '3') goto LAB_0007f860;
        if (cVar2 != '4') goto LAB_0007f8b8;
        uVar6 = 0xb4;
      }
LAB_0007f8b0:
      *g_draw_color_index = uVar6;
    }
    else {
      if (cVar2 == '6') {
        uVar6 = 0xd4;
        goto LAB_0007f8b0;
      }
      if (cVar2 == 'P') {
LAB_0007f894:
        wait_for_click_to_continue(iVar5 + 200,1);
      }
      else if (cVar2 == 'm') {
        msg_scroll_more_prompt();
      }
      else if (cVar2 == 'p') {
        iVar5 = 400;
        goto LAB_0007f894;
      }
    }
LAB_0007f8b8:
    *(undefined1 *)(DAT_00250704 + 0x16) = *g_draw_color_index;
    *(undefined1 *)(DAT_00250704 + 0x17) = 0;
  }
  if (*(int *)(DAT_00250704 + 0x10) == 0) goto LAB_0007fa30;
  iVar5 = (int)*(short *)(DAT_00250704 + 10) + (int)*(short *)(DAT_000879b0 + 6);
  uVar3 = (undefined2)iVar5;
  iVar7 = (int)*(short *)(DAT_000879b0 + 6) + ((int)(iVar5) * 0x10000 >> 0x10);
  iVar5 = *(short *)(DAT_00250704 + 2) + 1;
  if ((int)DAT_00250710 - (int)(short)param_2 < 0) {
    if (iVar5 < iVar7) {
      msg_scroll_more_prompt();
      uVar3 = *(undefined2 *)(DAT_00250704 + 10);
    }
    else {
LAB_0007f9ac:
      iVar5 = *(short *)(DAT_00250704 + 0x14) + 1;
      *(char *)(DAT_00250704 + 0x14) = (char)iVar5;
      *(char *)(DAT_00250704 + 0x15) = (char)((uint)iVar5 >> 8);
    }
  }
  else {
    if (iVar7 <= iVar5) goto LAB_0007f9ac;
    /* Ghidra dropped msg_scroll_scroll_up_line's argument here: it's the
       bottom Y of the block to shift up -- cursor_y + line_h, i.e. uVar3
       as computed at the top of this function (msg_scroll_more_prompt's own call
       passes the identical expression). Without it the scroll ran with a
       garbage height and the last line was overwritten in place instead
       of the panel scrolling up. */
    msg_scroll_scroll_up_line((int)(short)uVar3);
    uVar3 = *(undefined2 *)(DAT_00250704 + 10);
    DAT_00250710 = DAT_00250710 + -1;
  }
  *(char *)(DAT_00250704 + 10) = (char)uVar3;
  *(char *)(DAT_00250704 + 0xb) = (char)((ushort)uVar3 >> 8);
  puVar1 = (undefined2 *)(DAT_00250704 + 0xc);
  *(char *)(DAT_00250704 + 8) = (char)*puVar1;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)*puVar1 >> 8);
  *(undefined1 *)(DAT_00250704 + 0x10) = 0;
  *(undefined1 *)(DAT_00250704 + 0x11) = 0;
  *(undefined1 *)(DAT_00250704 + 0x12) = 0;
  *(undefined1 *)(DAT_00250704 + 0x13) = 0;
LAB_0007fa30:
  iVar7 = measure_text_width(param_1);
  iVar5 = DAT_00250704;
  if (((*(short *)(DAT_00250704 + 8) + iVar7) * 0x10000 >> 0x10 < (int)*(short *)(DAT_00250704 + 6))
      || (32 < s_wrap_recursion_depth))
  {
    uVar4 = ce_strlen(param_1);
    /* Guard against param_1 being an empty string: (uVar4 & 0xffff) - 1
       underflows to 0xffff (index -1), reading/writing one byte before
       the string -- a stack-buffer-underflow confirmed live via
       AddressSanitizer (msg_scroll_split_newline_segments can hand this
       an empty trailing segment after splitting on '\n'). Nothing to
       strip from an empty span, so just skip the check. */
    if ((uVar4 != 0) && (param_1[(int)(((uVar4 & 0xffff) - 1) * 0x10000) >> 0x10] == '\n')) {
      param_1[(int)(((uVar4 & 0xffff) - 1) * 0x10000) >> 0x10] = '\0';
      *(undefined1 *)(DAT_00250704 + 0x10) = 1;
      *(undefined1 *)(DAT_00250704 + 0x11) = 0;
      *(undefined1 *)(DAT_00250704 + 0x12) = 0;
      *(undefined1 *)(DAT_00250704 + 0x13) = 0;
      iVar5 = DAT_00250704;
    }
    draw_text_string(param_1,(int)*(short *)(iVar5 + 8),(int)*(short *)(iVar5 + 10));
    iVar5 = measure_text_width(param_1);
    iVar5 = *(short *)(DAT_00250704 + 8) + iVar5;
    *(char *)(DAT_00250704 + 8) = (char)iVar5;
    *(char *)(DAT_00250704 + 9) = (char)((uint)iVar5 >> 8);
  }
  else {
    msg_scroll_wrap_split_line(param_1,param_2);
  }
  s_wrap_recursion_depth--;
  return;
}



// was FUN_0007fb2c
void msg_scroll_wrap_split_line(param_1,param_2)
char * param_1;
undefined4 param_2;

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  int iVar5;
  char cVar6;

  /* Guard against infinite msg_scroll_draw_wrapped_span<->msg_scroll_wrap_split_line recursion on an
     empty string: msg_scroll_draw_wrapped_span sends param_1 here whenever its pixel width
     doesn't fit the remaining line width, but an empty string has zero
     width and can never be split any narrower -- every one of this
     function's exits below hands param_1 straight back to msg_scroll_draw_wrapped_span
     unchanged, which (if the line is already full) sends it right back
     here forever. There's nothing to wrap for an empty string, so just
     stop. Confirmed via a real crash: reached with param_1="" once (this
     session) the actual upstream bug (a lone-scalar DAT_00248418 palette
     table smashing ~10KB of adjacent memory on every palette install,
     since fixed) had already been eliminated, so this is a genuine
     separate edge case, not just a symptom of that corruption. */
  if (ce_strlen(param_1) == 0) {
    return;
  }
  pcVar3 = (char *)ce_strrchr(param_1,0x20);
  if (pcVar3 != (char *)0x0) {
    cVar6 = ' ';
    do {
      *pcVar3 = '\0';
      sVar2 = measure_text_width(param_1);
      if ((int)*(short *)(DAT_00250704 + 8) + (int)sVar2 < (int)*(short *)(DAT_00250704 + 6))
      goto LAB_0007fc2c;
      pcVar4 = (char *)ce_strrchr(param_1,0x20);
      *pcVar3 = ' ';
      pcVar3 = pcVar4;
    } while (pcVar4 != (char *)0x0);
  }
  iVar5 = ce_strlen(param_1);
  cVar6 = param_1[iVar5 + -1];
  pcVar3 = param_1 + iVar5 + -2;
  do {
    pcVar3[1] = cVar6;
    pcVar3 = pcVar3 + -1;
    cVar6 = *pcVar3;
    *pcVar3 = '\0';
    if (pcVar3 <= param_1) {
      /* Was `&s_scroll_newline_0008522c` -- confirmed via real ARM
         disassembly (0x7fc74: `ldr r0,[0x7fc88]`, and DAT_0007fc88's own
         stored value IS 0x8522c) that the original binary passes this
         exact same shared "\n" constant's address here too, so this
         isn't a porting artifact. But msg_scroll_draw_wrapped_span
         unconditionally self-NULs byte 0 of whatever buffer it's handed
         once it decides that buffer's last real char was '\n' (see its
         own comment/disassembly, confirmed no restore anywhere in that
         function) -- fine for every OTHER caller in this file, which
         all go through message_scroll_print_wrapped's own local
         auStack_54 copy first, but this is the ONE call site that
         invokes msg_scroll_draw_wrapped_span directly on the shared,
         permanent global, so hitting this fallback even once (confirmed
         live via an lldb watchpoint during ordinary Bragit dialogue --
         not some exotic edge case) permanently zeroes the "\n" every
         other caller in the game relies on, silently collapsing every
         later multi-line message (babl_menu's numbered responses among
         them) onto one line for the rest of the process's life. Give
         this call its own disposable copy instead of the shared
         original. */
      char local_newline_copy[2];
      local_newline_copy[0] = '\n';
      local_newline_copy[1] = '\0';
      msg_scroll_draw_wrapped_span(local_newline_copy,1);
      goto LAB_0007fc64;
    }
    sVar2 = measure_text_width(param_1);
  } while ((int)*(short *)(DAT_00250704 + 6) <= (int)*(short *)(DAT_00250704 + 8) + (int)sVar2);
LAB_0007fc2c:
  *pcVar3 = cVar6;
  cVar1 = pcVar3[1];
  *pcVar3 = '\n';
  pcVar3[1] = '\0';
  msg_scroll_draw_wrapped_span(param_1,1);
  *pcVar3 = cVar6;
  pcVar3[1] = cVar1;
  param_1 = pcVar3 + (cVar6 == ' ');
LAB_0007fc64:
  msg_scroll_draw_wrapped_span(param_1,param_2);
  return;
}



// was FUN_0007fc8c
void msg_scroll_panel_init(param_1,param_2,param_3,param_4,param_5)
int param_1;
int param_2;
int param_3;
int param_4;
int param_5;

{
  char *ctx;

  if (param_5 != 0) {
    set_draw_color(0xf1);
    rect_fill_or_save_restore(param_1 + 0xe,param_2 + 1,param_3 + -0xf,param_4 + -1);
  }
  set_draw_color(0x2a);
  rect_fill_or_save_restore(param_1,param_2,param_3,param_4);

  /* Populate the message-scroll context struct (DAT_00250704 ->
     g_msg_scroll_panel_state) from the region rectangle. An earlier session's own
     comment here claimed "the decompile lost this" from msg_scroll_panel_init's
     real body -- re-checked via a fresh Ghidra disassembly of 0x7fc8c
     this session and that's NOT accurate: the real function only draws
     the (up to) two background rects and tail-calls
     rect_fill_or_save_restore once more, nothing else -- this whole
     struct-populate block has no match in the real binary at this
     address. Left in place anyway (not reverted) because it's the only
     place currently seeding these fields at all, and empirically
     produces a correct, working panel (confirmed visually: the save/
     load name prompt and the save-slot description list both render
     correctly with it). Real ARM disassembly of msg_scroll_panel_reset (see its
     own comment) independently confirmed the byte layout this block
     writes to (+2 bottom_y, +4 left_x, +6 right_x, +8/+0xa draw cursor
     x/y, +0xc/+0xe new-line-reset x/y) is at least self-consistent with
     how the rest of the widget reads it. What's still missing: +0x00
     ("top y", read by msg_scroll_panel_reset's own erase-rect on every reset) was
     never written here either -- confirmed as the cause of that erase
     covering the whole screen instead of just this panel's own strip,
     fixed below by seeding it the same as +0x0e. Wherever the REAL
     populate code for this struct actually lives is still unknown; flagged
     for future investigation rather than solved here. */
  ctx = (char *)DAT_00250704;
  if (ctx != (char *)0x0) {
    *(short *)(ctx + 0x00) = (short)param_2;   /* top y (erase rect)   */
    *(short *)(ctx + 0x02) = (short)param_4;   /* bottom y             */
    *(short *)(ctx + 0x04) = (short)param_1;   /* left x               */
    *(short *)(ctx + 0x06) = (short)param_3;   /* right x              */
    *(short *)(ctx + 0x08) = (short)param_1;   /* draw cursor x        */
    *(short *)(ctx + 0x0a) = (short)(param_2 + 4); /* draw cursor y (small top margin) */
    *(short *)(ctx + 0x0c) = (short)param_1;   /* new-line left margin */
    *(short *)(ctx + 0x0e) = (short)param_2;   /* top y (scroll blit)  */
    *(int   *)(ctx + 0x10) = 0;                /* pending-newline flag */
    *(short *)(ctx + 0x14) = 0;                /* lines printed        */
    ctx[0x16] = 0x60;                          /* default text colour  */
    ctx[0x17] = 0;
  }
  return;
}



/* Every field-offset constant below that was written as a bare
   `DAT_00250704 + N` (no cast before the addition) was wrong -- half
   what it should be. DAT_00250704 is declared `undefined *`
   (uw.h: `typedef unsigned char undefined`), a real byte pointer, but
   these specific expressions were decompiled as if it scaled by
   sizeof(undefined2)==2, so every one of them landed N/2 bytes early.
   The OTHER offsets in this same function, written with an explicit
   `(char *)DAT_00250704 + N` cast placed *before* the addition, were
   already byte-correct -- this mixed styling (both forms decompiled
   from the same real ARM code, which is unambiguously byte-addressed
   throughout) is what hid the bug: half the fields in this "reset the
   scroll panel" struct landed at the right place, half didn't.
   Confirmed via real ARM disassembly (0x7fd14-0x7fdd8): the struct's
   real byte layout is top_y@0, bottom_y@2, left_x@4, right_x@6 (used
   by the rect_fill_or_save_restore call below), base_x@0xc, base_y@0xe
   (the panel's static origin, populated once by msg_scroll_panel_init),
   cur_x@8, cur_y@0xa (the live draw-cursor these get copied into on
   every reset -- this is the actual bug: cur_y was landing at byte 5,
   splitting a partial write across the middle of top_y/bottom_y's own
   bytes instead of the real cursor field, so it read back as garbage
   or zero and every scroll message before the first real scroll-up
   drew off in the weeds instead of at the panel's visible top row),
   and three more zeroed fields at 0x10/0x12/0x14 (a 0x11/0x13/0x15
   counterpart to each was already correct). Root cause of both the
   invisible "Enter a save name" prompt and the invisible save-slot
   list text -- same struct, same reset function, same bug. */
// was FUN_0007fce8
void msg_scroll_panel_reset(param_1)
int param_1;

{
  char *pStruct;
  undefined2 uVar1;
  int iVar2;

  if ((param_1 != 0) && (check_mouse_over_msg_scroll_panel(), DAT_00250708 != 0)) {
    decrement_cursor_hide_depth();
  }
  set_draw_color(0x2a);
  pStruct = (char *)DAT_00250704;
  rect_fill_or_save_restore(*(short *)(pStruct + 4),*(short *)(pStruct + 0),
               (ushort)*(short *)(pStruct + 6) + 1,(ushort)*(short *)(pStruct + 2) + 1);
  uVar1 = *(undefined2 *)(pStruct + 0xe);
  *(char *)(pStruct + 0xa) = (char)uVar1;
  *(char *)(pStruct + 0xb) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(pStruct + 0xc);
  *(char *)(pStruct + 8) = (char)uVar1;
  *(char *)(pStruct + 9) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(pStruct + 0x10) = 0;
  *(undefined1 *)(pStruct + 0x11) = 0;
  *(undefined1 *)(pStruct + 0x12) = 0;
  *(undefined1 *)(pStruct + 0x13) = 0;
  *(undefined1 *)(pStruct + 0x14) = 0;
  *(undefined1 *)(pStruct + 0x15) = 0;
  if (DAT_00250704 == (undefined *)&g_msg_scroll_panel_state) {
    set_hud_status_value(4,1);
    iVar2 = msg_scroll_draw_edges();
  }
  else {
    iVar2 = draw_conversation_window_decoration();
  }
  if (param_1 != 0) {
    iVar2 = DAT_00250708;
  }
  if (param_1 != 0 && iVar2 != 0) {
    cursor_show_idle_tick();
  }
  return;
}







// was FUN_0006cb74 -- snaps the compass dial (DAT_0023c228) and needle
// (DAT_0023c22c) sprites straight to the player's real current heading
// (DAT_0023c11a), unlike hud_compass_needle_tick's own one-increment-
// per-call stepping toward it via DAT_0023c12a (which this function
// never touches). Used where the needle shouldn't visibly animate into
// place -- e.g. on HUD panel open/reset.
void snap_compass_to_heading()

{
  byte bVar1;
  uint uVar2;

  bVar1 = DAT_0023c11a;
  uVar2 = (uint)DAT_0023c11a;
  sprite_list_set_frame_id((int)DAT_0023c228,(uVar2 & 3) + 0x2059);
  sprite_list_set_position((int)DAT_0023c22c,(int)(short)(&DAT_00087130)[(short)(ushort)bVar1],
               (int)(short)(&DAT_00087150)[(short)(ushort)bVar1]);
  sprite_list_set_frame_id((int)DAT_0023c22c,uVar2 + 0x205d);
  flush_sprite_list_compositor();
  return;
}



// was FUN_0006cbf0 -- resets the HUD panel subsystem's transient
// animation/selection state: zeroes the two 9-entry per-panel-button
// state arrays (DAT_0023c118/DAT_0023c128), hides the two sprites
// DAT_0023c1e8/DAT_0023c1ea via clear_sprite_list_slot_flag, clears the active-panel
// selector (g_active_hud_panel) and the panel-switch animation counters
// hud_panel_wipe_transition_tick drives (DAT_0023c220 and friends), and reseeds
// DAT_0023c11f/DAT_0023c120/DAT_0023c130/DAT_000870e0/DAT_000870e4 back
// to their startup defaults (matching redraw_hud_panels's own initial
// values for the latter two).
void reset_hud_panel_animation_state()

{
  int iVar1;

  iVar1 = 0;
  do {
    (&DAT_0023c118)[iVar1] = 0;
    (&DAT_0023c128)[iVar1] = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 9);
  clear_sprite_list_slot_flag((int)DAT_0023c1e8);
  clear_sprite_list_slot_flag((int)DAT_0023c1ea);
  DAT_0023c1e6 = 0;
  g_active_hud_panel = 0;
  DAT_0023c1e4 = 0;
  DAT_0023c220 = 0;
  DAT_0023c1d8 = DAT_0023c1d8 & 0xff7f;
  DAT_0023c11f = 4;
  DAT_0023c120 = 6;
  DAT_0023c130 = 6;
  DAT_000870e0 = 6;
  DAT_000870e4 = 0;
  flush_sprite_list_compositor();
  return;
}






// was thunk_FUN_0006edb8 -- Ghidra's own name (not related to the
// unrelated, differently-addressed release_hud_panel_flip_grtiles defined later in this
// file, despite the identical-looking suffix -- this project's
// established split-symbol/naming-collision bug class, not a real
// thunk relationship). Releases the 3 grtile handles
// (DAT_0023c200/202/204, see that array's own declaration comment)
// backing the HUD panel-switch wipe transition, clearing each that's
// still set via the currently-no-op release_grtile_handle.
void release_panel_wipe_grtiles()

{
  int iVar1;

  iVar1 = 0;
  do {
    if ((&DAT_0023c200)[iVar1] != 0) {
      release_grtile_handle();
      (&DAT_0023c200)[iVar1] = 0;
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 3);
  return;
}






// was FUN_0006e038 -- updates a small HUD status-icon sprite
// (DAT_0023c254, allocated on first use) from the state code
// DAT_0023c11b (0..0xd/13; out-of-range values leave the icon alone).
// Most values just select a single static frame (0x2098 + value); the
// special value 9 instead cycles through frames 0x2098+DAT_00087258
// (wrapping 9..0xd) once per call, matching an animated variant of
// whatever this icon represents, and sets bit 3 of DAT_0023c1d8 (a
// "dirty"/"animating" flag other icons in this cluster also use, e.g.
// hud_compass_needle_tick's own bit 2). Exact icon identity not
// confirmed (no icon-name string or comment found nearby) -- named for
// its mechanism, not its meaning.
void update_hud_status_icon_frame()

{
  uint uVar1;
  char cVar2;
  undefined4 uVar3;
  int iVar4;

  cVar2 = DAT_0023c11b;
  uVar1 = (uint)DAT_0023c11b;
  if ((-1 < (int)uVar1) && ((int)uVar1 < 0xe)) {
    if (DAT_0023c254 == 0) {
      uVar3 = sprite_list_alloc_entry(0);
      DAT_0023c254 = (short)uVar3;
      sprite_list_set_rect(uVar3,4,0x8c,1,1);
    }
    if (uVar1 == 9) {
      iVar4 = (int)DAT_00087258;
      DAT_00087258 = DAT_00087258 + 1;
      sprite_list_set_frame_id((int)DAT_0023c254,iVar4 + 0x2098);
      if (0xd < DAT_00087258) {
        DAT_00087258 = 9;
      }
      DAT_0023c1d8 = DAT_0023c1d8 | 8;
    }
    else {
      if (DAT_0023c258 == 9) {
        DAT_00087258 = 9;
      }
      sprite_list_set_frame_id((int)DAT_0023c254,(uVar1 & 0xffff) + 0x2098);
      DAT_0023c1d8 = DAT_0023c1d8 & 0xfff7;
    }
    DAT_0023c258 = (short)cVar2;
  }
  return;
}






// was FUN_0006e1d4 -- per-tick driver for the small HUD panel-switch
// wipe-transition icon (sprite handle DAT_0023c21c, same one
// snap_compass_to_heading's sibling reset_hud_panel_animation_state resets
// to frame 0x20a6 ("idle") and redraw_hud_panels allocates at a 1x1
// screen position). Steps a wipe-progress counter (DAT_0023c12f)
// toward its target (DAT_0023c11f, advanced by 4 each time it's caught
// up to) via a small state machine (DAT_0023c220/DAT_0023c25c) that
// selects successive frames from the table at 0x87200, then resets
// everything back to idle once DAT_0023c220 exceeds 5.
void hud_panel_wipe_transition_tick()

{
  int iVar1;
  /* Original .data at 0x87200; ARM 0x6e27c..0x6e284 indexes halfwords. */
  static const ushort wipe_frames[6] = {0x20a7,0x20a8,0x20a9,0x20a8,0x20a7,0};

  if ((uint)DAT_0023c12f == (uint)DAT_0023c11f) {
    DAT_0023c220 = 2;
    DAT_0023c25c = 0;
  }
  else {
    if ((uint)DAT_0023c12f == DAT_0023c11f - 4) goto LAB_0006e244;
    if (DAT_0023c25c != 0) {
      DAT_0023c220 = 2;
      DAT_0023c25c = 0;
    }
    DAT_0023c12f = DAT_0023c11f;
  }
  DAT_0023c11f = DAT_0023c11f + 4;
LAB_0006e244:
  iVar1 = (int)DAT_0023c220;
  if ((iVar1 == 3) && (DAT_0023c25c < 0x10)) {
    DAT_0023c25c = DAT_0023c25c + 1;
  }
  else {
    DAT_0023c220 = DAT_0023c220 + 1;
    sprite_list_set_frame_id((int)DAT_0023c21c,
                 (uint)DAT_0023c12f * 3 + -3 + (uint)wipe_frames[iVar1]);
  }
  if (5 < DAT_0023c220) {
    DAT_0023c25c = 0;
    DAT_0023c220 = 0;
    DAT_0023c12f = 0;
    sprite_list_set_frame_id((int)DAT_0023c21c,0x20a6);
    DAT_0023c1d8 = DAT_0023c1d8 & 0xff7f;
  }
  return;
}






// was FUN_0006e96c -- the "ready to cast" rune-slot icon updater (see
// DAT_0023c268's own declaration comment): allocates 3 icon sprites on
// first use (positioned via DAT_00087210) and, for each of the 3
// selected-rune bytes at param_1[0..2], either shows the matching rune
// icon (value+0xe8) or hides the slot (value >= 0x18).
void update_ready_rune_slot_icons(param_1)
/* Was `int`, truncating the real pointer callers pass (DAT_00086df8 +
   0x47, DAT_00086df8 being a genuine `char *`). */
char *param_1;

{
  undefined4 uVar1;
  int iVar2;
  
  if (DAT_0023c268 == 0) {
    iVar2 = 0;
    g_blit_transparent_mode = 1;
    do {
      uVar1 = sprite_list_alloc_raw_entry(1,0x10,0x10);
      (&DAT_0023c268)[iVar2] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087210)[iVar2],0x8b,0x10,0x10);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
    g_blit_transparent_mode = 0;
  }
  iVar2 = 0;
  do {
    if (*(byte *)(iVar2 + param_1) < 0x18) {
      sprite_list_set_frame_id((int)(&DAT_0023c268)[iVar2],*(byte *)(iVar2 + param_1) + 0xe8);
    }
    else {
      clear_sprite_list_slot_flag((int)(&DAT_0023c268)[iVar2]);
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 3);
  flush_sprite_list_compositor();
  return;
}






// was FUN_0006ea54 -- HUD light-color indicator: shows up to 3 small
// icons (mirrored off the opposite screen edge from
// update_ready_rune_slot_icons's rune slots -- DAT_00087218's X
// positions decrease where DAT_00087210's increase, same sprite/icon
// infrastructure reused for a different purpose) representing the
// player's currently lit light sources' colors, driven by
// compute_light_source_colors's own output (see its comment, which
// names this function as its HUD consumer). Active only in the rarer
// game mode *(short*)(DAT_00085a6c+8)==1 (exact mode not identified).
void update_light_source_color_icons(param_1)
/* Same truncation bug as its sibling update_ready_rune_slot_icons above. */
char *param_1;

{
  undefined4 uVar1;
  int iVar2;
  
  if (*(short *)(DAT_00085a6c + 8) == 1) {
    if (DAT_0023c270 == 0) {
      iVar2 = 0;
      g_blit_transparent_mode = 1;
      do {
        uVar1 = sprite_list_alloc_raw_entry(1,0x10,0x12);
        (&DAT_0023c270)[iVar2] = (short)uVar1;
        sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087218)[iVar2],0x89,0x10,0x12);
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < 3);
      g_blit_transparent_mode = 0;
    }
    iVar2 = 0;
    do {
      if (*(byte *)(iVar2 + param_1) < 0x15) {
        sprite_list_set_frame_id((int)(&DAT_0023c270)[iVar2],*(byte *)(iVar2 + param_1) + 0x20c0);
      }
      else {
        clear_sprite_list_slot_flag((int)(&DAT_0023c270)[iVar2]);
      }
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
    flush_sprite_list_compositor();
  }
  return;
}






// was FUN_0006eb64 -- begins the HUD panel-switch flip transition to
// param_1 (the target panel): lazily allocates the 3 flip grtile slots
// (DAT_0023c200/202/204) on first use, cleaning up via
// release_hud_panel_flip_grtiles on failure, then captures the source
// panel's current screen content into DAT_0023c200 and draws+captures
// the target panel's content into DAT_0023c202 (restoring the source
// content to screen afterward) so advance_hud_panel_flip's first tick
// has both halves ready. Called once per transition by
// tick_hud_panel_transition, which then drives advance_hud_panel_flip
// every tick until it reports done.
void begin_hud_panel_flip(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined2 param_2;
undefined2 param_3;
undefined2 param_4;
undefined2 param_5;

{
  undefined1 uVar1;
  /* Was `ushort` -- too narrow for alloc_flip_grtile_slot's real 4-byte
     grtile key now that it's no longer a stub (harmless before, when
     it always returned 0). Still reused a few lines down as a plain
     0/1 success flag (decode_gr_entry_to_buffer's return), which fits fine in the
     wider type too. */
  undefined4 uVar2;
  ushort uVar3;
  /* Was `undefined4` -- truncated resolve_flip_grtile_slot's real
     pointer return (see its own comment) to 32 bits on this host
     before handing it to decode_gr_entry_to_buffer/bitmap_blit_to_framebuffer.
     Harmless while resolve_flip_grtile_slot was a stub always
     returning 0; a real truncated-pointer bug now that it isn't. */
  char *uVar4;
  /* Was `int` -- doubles as this loop's plain counter (0..2, fine
     either way) AND, further down, resolve_flip_grtile_slot's real
     pointer return used in pointer arithmetic (`iVar5 + 0x2800`),
     which does need the wider type now that that call isn't a stub. */
  intptr_t iVar5;
  ushort uVar6;

  uVar6 = 1;
  DAT_0023c140 = param_5;
  DAT_0023c144 = param_4;
  DAT_0023c148 = param_2;
  DAT_0023c14c = param_3;
  if (DAT_0023c278 == 0) {
    iVar5 = 0;
    do {
      if ((&DAT_0023c200)[iVar5] == 0) {
        uVar2 = alloc_flip_grtile_slot();
        /* Not decompiled -- see alloc_flip_grtile_slot's own comment.
           This slot's newly-allocated key was never actually stored
           back into the array, so this "already allocated?" check
           above would see 0 again on every subsequent call even after
           a real (non-stub) allocation succeeded -- invisible while
           the allocator was a stub (there was never a real key to
           lose), but a real bug once it does something. */
        (&DAT_0023c200)[iVar5] = uVar2;
        /* Was `uVar6 = uVar6 & uVar2;` -- a bitwise AND of the
           success accumulator against uVar2 directly made sense when
           uVar2 could only ever be the stub's constant 0, but uVar2 is
           now a real (large, effectively-arbitrary-bit-pattern) grtile
           key, so ANDing it directly could clear uVar6's low bit --
           and so the whole accumulator -- on a perfectly successful
           allocation just because that key's low bit happened to be
           0. Normalize to a real boolean success check instead. */
        uVar6 = uVar6 & (uVar2 != 0);
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 3);
    if (uVar6 == 0) {
      release_hud_panel_flip_grtiles();
    }
    else {
      g_flip_grtile_cache_ready = g_flip_grtile_cache_ready | 1;
    }
    DAT_0023c278 = 1;
  }
  if (getenv("UW_DEBUG_CLICKREGION"))
    fprintf(stderr, "[stats] begin_hud_panel_flip entry: param_1(target)=%d g_flip_grtile_cache_ready=0x%x DAT_0023c278=%d uVar6=%d\n",
            (int)param_1, (unsigned)g_flip_grtile_cache_ready, (int)DAT_0023c278, (int)uVar6);
  if ((g_flip_grtile_cache_ready & 1) != 0) {
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    uVar2 = decode_gr_entry_to_buffer(s_panels_00087260,param_1,uVar4);
    iVar5 = resolve_flip_grtile_slot(DAT_0023c200);
    uVar3 = decode_gr_entry_to_buffer(s_panels_00087260,3,iVar5 + 0x2800);
    if (getenv("UW_DEBUG_CLICKREGION"))
      fprintf(stderr, "[stats] begin_hud_panel_flip: uVar4(dst202)=%u uVar2(decode1 ok)=%u iVar5(dst200)=%d uVar3(decode2 ok)=%u\n",
              (unsigned)uVar4, (unsigned)uVar2, iVar5, (unsigned)uVar3);
    if ((uVar2 & uVar3 & uVar6) == 0) {
      if (getenv("UW_DEBUG_CLICKREGION"))
        fprintf(stderr, "[stats] begin_hud_panel_flip: DECODE FAILED, calling report_fatal_error_and_exit(0x300e)\n");
      report_fatal_error_and_exit(0x300e);
    }
    decrement_cursor_hide_depth();
    /* Not decompiled -- capture the CURRENT (source/old panel's) live
       screen content into DAT_0023c200's offset-0 region (its
       0x2800 offset already holds the decoded chain graphic from
       just above, so this doesn't collide) before the target panel's
       content gets drawn over it below. Without this, advance_hud_panel_flip's
       first tick captured "whatever's currently on screen" into
       DAT_0023c200 believing it was grabbing the front (source) face
       of the flip -- but by that point this function had already
       drawn and captured the TARGET panel here, leaving it visible on
       screen, so DAT_0023c200 ended up with the same target content
       as DAT_0023c202. Both flip halves showed the target panel
       instead of source-then-target. QA: "clicking the chain does
       flip... but shows stats for both halves, should only switch at
       the edge-on midpoint." */
    uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
    capture_framebuffer_rect_to_grtile_paletted(uVar4,0xec,8,0x53,0x72);
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    if (getenv("UW_DEBUG_CLICKREGION"))
      fprintf(stderr, "[stats] begin_hud_panel_flip: pre-draw blit source uVar4(dst202)=%u\n", (unsigned)uVar4);
    bitmap_blit_to_framebuffer(0xec,8,uVar4,0x72,0x53,0,0,1);
    uVar1 = g_active_hud_panel;
    g_active_hud_panel = (undefined1)param_1;
    DAT_00085c54 = 0;
    (*(code *)(&g_hud_panel_handlers)[(short)param_1])();
    DAT_00085c54 = 1;
    g_active_hud_panel = uVar1;
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    capture_framebuffer_rect_to_grtile_paletted(uVar4,0xec,8,0x53,0x72);
    /* Not decompiled -- put the source content (just captured above)
       back on screen now that we're done using the screen as a
       scratch surface to capture the target. Otherwise the target
       panel stays visible here, and advance_hud_panel_flip's first tick's own
       (unchanged) "capture whatever's on screen into DAT_0023c200"
       step would just re-capture the target again, undoing the fix
       above. */
    uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
    bitmap_blit_to_framebuffer(0xec,8,uVar4,0x72,0x53,0,0,1);
    cursor_show_idle_tick();
  }
  DAT_0023c134 = (short)param_1;
  return;
}



// was FUN_0006edb8 -- byte-for-byte identical body to
// release_panel_wipe_grtiles (this project's established split-symbol/
// naming-collision bug class -- see that function's own comment; not
// merged into one, kept as separately-named/addressed functions per
// this project's convention of preserving what Ghidra recovered).
// Releases the 3 flip grtile handles (DAT_0023c200/202/204), called by
// begin_hud_panel_flip on allocation failure.
void release_hud_panel_flip_grtiles()

{
  int iVar1;

  iVar1 = 0;
  do {
    if ((&DAT_0023c200)[iVar1] != 0) {
      release_grtile_handle();
      (&DAT_0023c200)[iVar1] = 0;
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 3);
  return;
}



// was FUN_0006edfc -- per-tick step of the HUD panel-switch flip
// animation begun by begin_hud_panel_flip: advances a multi-stage
// counter (DAT_0023c208, stages 1-7) drawing the squashed-panel flip
// visual at each stage via squash_hud_panel_flip_rows/rect_fill_or_save_restore/
// bitmap_blit_to_framebuffer, and finally swaps in the target panel
// (g_active_hud_panel/g_hud_panel_handlers) partway through. Returns
// true once the stage counter resets to 0 (transition complete),
// matching tick_hud_panel_transition's own use of the return value.
bool advance_hud_panel_flip()

{
  undefined1 uVar1;
  byte bVar2;
  /* Were `undefined4` -- truncated the real 64-bit pointers this
     function passes around (DAT_0023cca4 itself, and resolve_flip_grtile_slot's
     return value) to 32 bits on this host before handing them to
     bitmap_blit_to_framebuffer/squash_hud_panel_flip_rows/capture_framebuffer_rect_to_grtile_paletted, which then
     reconstructed a wild pointer from just the low half. Same
     truncated-pointer-local class as everywhere else this session --
     this is what crashed the panel-switch wipe transition the first
     time it ever actually ran. */
  char *uVar3;
  char *uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  bool bVar10;
  /* Was `iVar7 + 0x2800` (iVar7 declared `int`) -- iVar7 is reused as
     a plain int scratch everywhere else in this function, but in the
     DAT_0023c208==4 stage it briefly holds resolve_flip_grtile_slot's
     real 64-bit pointer, truncated to 32 bits before the +0x2800
     offset, producing a wild address. Same pointer-truncation class
     as uVar3/uVar4 above; needs its own real-pointer local since
     iVar7's other uses in this function are genuine int arithmetic. */
  char *pFlipSrc4;
  
  uVar3 = DAT_0023cca4;
  bVar2 = DAT_0023c208 + 1;
  if ((g_flip_grtile_cache_ready & 1) != 0) {
    DAT_0023c208 = bVar2;
    decrement_cursor_hide_depth();
    uVar3 = resolve_flip_grtile_slot(DAT_0023c204);
    if (DAT_0023c208 == 1) {
      uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
      capture_framebuffer_rect_to_grtile_paletted(uVar4,(int)(short)DAT_0023c148,(int)(short)DAT_0023c14c,(int)DAT_0023c144,
                   DAT_0023c140);
      squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
      set_draw_color(0xf1);
      iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
      iVar7 = (int)DAT_0023c144 - (int)DAT_0023c13c;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      iVar9 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      if (iVar9 < 0) {
        iVar9 = iVar9 + 1;
      }
      /* Not decompiled -- was `(iVar9 >> 1) - DAT_0023c14c`. Confirmed
         via real ARM disassembly (0006f21c-0006f24c) that the shipped
         binary genuinely computes it this way, so this is a real,
         never-fixed bug in the original game's own compiled code for
         this feature (which this whole investigation independently
         confirmed is never reachable in any shipped build -- never
         QA'd). QA (live): iVar9 (= DAT_0023c138-DAT_0023c140) stays
         small (0-7) across the whole animation -- DAT_0023c138 is a
         "should stay ~constant" height reference that actually
         wobbles up to 106% of DAT_0023c140 due to the same curve
         table's overshoot -- so the ORIGINAL buggy subtraction put
         the panel's edge-erase strips and its squashed-content blit
         ~15-16px ABOVE the panel's real top (DAT_0023c14c=8) instead
         of a few px below it ("draws 16 pixels too high"). First fix
         attempt just flipped the operand order (`DAT_0023c14c +
         delta`), which was closer but still wrong: it anchors the
         TOP edge at DAT_0023c14c and lets the panel grow downward as
         DAT_0023c138 overshoots, drifting a few extra px low each
         time the height wobbles ("shifts down a bit too much"). The
         correct fix keeps the panel's VERTICAL CENTER fixed (not its
         top) as its height wobbles -- `DAT_0023c14c -
         (iVar9 >> 1)` -- since top = center - height/2 =
         (DAT_0023c14c + DAT_0023c140/2) - DAT_0023c138/2 =
         DAT_0023c14c - (DAT_0023c138-DAT_0023c140)/2. Verified live:
         this keeps the computed center within 0.5px of the true
         center (DAT_0023c14c+DAT_0023c140/2) at every stage, vs. the
         addition version drifting up to 6px low at the most extreme
         wobble (stage 3/5, DAT_0023c138=120). */
      rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar9 >> 1 & 0xffffU),
                   (int)(short)DAT_0023c148 + (iVar7 >> 1 & 0xffffU),
                   (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
      iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
      iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      iVar9 = (int)DAT_0023c13c + (int)DAT_0023c144;
      if (iVar9 < 0) {
        iVar9 = iVar9 + 1;
      }
      /* Not decompiled -- same "16 pixels too high" fix as above. */
      rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar9 >> 1) & 0xffff,
                   (int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                   (int)DAT_0023c144 + (uint)DAT_0023c148,(uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff
                  );
      iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      /* Not decompiled -- same "16 pixels too high" fix as above,
         this time for the actual squashed-content blit position. */
      bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                   (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                   DAT_0023c13c,0,0,1);
    }
    else if (1 < DAT_0023c208) {
      if (DAT_0023c208 < 4) {
        uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
        squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
        set_draw_color(0xf1);
        iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar7 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        iVar9 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        /* Not decompiled -- "16 pixels too high" fix, see the
           identical block in the DAT_0023c208==1 branch above for the
           full explanation (disassembly-confirmed real bug, not a
           decompiler artifact). */
        rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar9 >> 1 & 0xffffU),
                     (int)(short)DAT_0023c148 + (iVar7 >> 1 & 0xffffU),
                     (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
        iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        iVar9 = (int)DAT_0023c13c + (int)DAT_0023c144;
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar9 >> 1) & 0xffff,
                     (int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                     (int)DAT_0023c144 + (uint)DAT_0023c148,
                     (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
        iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                     (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                     DAT_0023c13c,0,0,1);
      }
      else if (DAT_0023c208 == 4) {
        pFlipSrc4 = resolve_flip_grtile_slot(DAT_0023c200);
        set_draw_color(0xf1);
        iVar9 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar5 = (int)DAT_0023c144 + (int)DAT_0023c13c;
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        iVar8 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        if (iVar8 < 0) {
          iVar8 = iVar8 + 1;
        }
        iVar6 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar6 < 0) {
          iVar6 = iVar6 + 1;
        }
        /* Not decompiled -- "16 pixels too high" fix, see the
           DAT_0023c208==1 branch above for the full explanation. */
        rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar6 >> 1) & 0xffff,
                     (int)DAT_0023c14c - (iVar8 >> 1 & 0xffffU),
                     (uint)DAT_0023c148 + (iVar5 >> 1) & 0xffff,
                     (uint)DAT_0023c14c + (iVar9 >> 1) & 0xffff);
        iVar5 = -(int)DAT_0023c140 + 0x78;
        if (iVar5 < 0) {
          iVar5 = -(int)DAT_0023c140 + 0x79;
        }
        iVar9 = DAT_0023c144 + -3;
        if (iVar9 < 0) {
          iVar9 = DAT_0023c144 + -2;
        }
        bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar9 >> 1),
                     (int)(short)(iVar5 >> 1) - (int)(short)DAT_0023c14c,pFlipSrc4 + 0x2800,0x78,3,0,0,1
                    );
      }
      else if (4 < DAT_0023c208) {
        if (DAT_0023c208 < 8) {
          uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
          set_draw_color(0xf1);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          /* Was missing its 4th argument (y2) -- real disassembly
             (0006f3d8-0006f400) shows r3 genuinely computed as
             `(short)DAT_0023c14c + (short)(iVar7 >> 1)` right before
             the call, matching the same y1/y2-around-center pattern
             every other rect_fill_or_save_restore call in this
             function uses; the decompiler just dropped it from the
             call's C syntax. Previously left as the original 3-arg
             dropped-argument call because applying this fix crashed a
             few ticks later -- that turned out to be a side effect of
             capture_framebuffer_rect_to_grtile_paletted/decode_gr_entry_to_buffer being broken (this rect_fill
             finally actually running exposed their bugs, rather than
             being wrong itself); now that both are fixed, re-applying
             this fix is what it takes for the panel-flip's "erase old
             content" pass to bound itself correctly instead of wiping
             out the static flask/chain area below the panel with a
             leftover-register y2. */
          /* Not decompiled -- "16 pixels too high" fix, see the
             DAT_0023c208==1 branch above for the full explanation. */
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          iVar7 = (int)DAT_0023c138 + (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c140 + (uint)DAT_0023c14c,
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
          if (iVar5 < 0) {
            iVar5 = iVar5 + 1;
          }
          /* Not decompiled -- "16 pixels too high" fix (the
             squashed-content blit position itself this time). */
          bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                       (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                       DAT_0023c13c,0,0,1);
        }
        else if (DAT_0023c208 == 8) {
          uVar3 = resolve_flip_grtile_slot(DAT_0023c202);
          set_draw_color(0xf1);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          /* Was missing its 4th argument (y2) -- same dropped-argument
             bug as the sibling call above (real disassembly
             0006f56c-0006f594, identical instruction pattern);
             re-applied for the same reason (see that comment). Y1 also
             fixed for the same "16 pixels too high" bug as every other
             occurrence in this function (see DAT_0023c208==1 branch). */
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          iVar7 = (int)DAT_0023c138 + (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c140 + (uint)DAT_0023c14c,
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          bitmap_blit_to_framebuffer((int)(short)DAT_0023c148,(int)(short)DAT_0023c14c,uVar3,(int)DAT_0023c140,
                       DAT_0023c144,0,0,1);
          DAT_0023c208 = 0;
        }
      }
    }
    draw_sprite_by_id(DAT_0023c208 + 0x20b8,0x110,4,1,1);
    draw_sprite_by_id(DAT_0023c208 + 0x20b0,0x110,0x7a,1,1);
    cursor_show_idle_tick();
    goto LAB_0006f6c8;
  }
  if (DAT_0023c208 == '\x02') {
    DAT_0023c208 = bVar2;
    decode_gr_entry_to_buffer(s_panels_00087260,3,DAT_0023cca4);
    decrement_cursor_hide_depth();
    set_draw_color(0xf1);
    rect_fill_or_save_restore(0xec,8,0x13f,0x7a);
    draw_sprite_by_id(0x20bc,0x110,4,1,1);
    draw_sprite_by_id(0x20b4,0x110,0x7a,1,1);
    bitmap_blit_to_framebuffer(0x114,0xfffffffb,uVar3,0x78,3,0,0,1);
LAB_0006f008:
    cursor_show_idle_tick();
  }
  else {
    if (DAT_0023c208 == '\x05') {
      DAT_0023c208 = bVar2;
      decode_gr_entry_to_buffer(s_panels_00087260,(int)DAT_0023c134,DAT_0023cca4);
      decrement_cursor_hide_depth();
      set_draw_color(0xf1);
      rect_fill_or_save_restore(0x114,5,0x117,0x7d);
      uVar1 = g_active_hud_panel;
      g_active_hud_panel = (undefined1)DAT_0023c134;
      screen_backup_restore_rect(0xec,8,0x13f,0x7a);
      bitmap_blit_to_framebuffer(0xec,8,uVar3,0x72,0x53,0,0,1);
      (*(code *)(&g_hud_panel_handlers)[DAT_0023c134])();
      screen_backup_save();
      g_active_hud_panel = uVar1;
      draw_sprite_by_id(0x20b8,0x110,4,1,1);
      draw_sprite_by_id(0x20b0,0x110,0x7a,1,1);
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xec,8,0x13e,0x79);
      goto LAB_0006f008;
    }
    bVar10 = DAT_0023c208 == '\a';
    DAT_0023c208 = bVar2;
    if (bVar10) {
      DAT_0023c208 = 0;
    }
  }
  screen_backup_restore_rect(0xec,8,0x13f,0x7a);
LAB_0006f6c8:
  return DAT_0023c208 == 0;
}






// was FUN_0006f6e0 -- draws one stage of the HUD panel-flip's squashed-
// panel visual: looks up this stage's squash amount from the curve
// table u_dgijjjigd_G__000871e0 (indexed by param_3, the stage number)
// to compute DAT_0023c13c (squashed width) and DAT_0023c138 (current
// panel height) for this stage, then copies each destination column
// via copy_hud_panel_flip_column, sweeping the full source width
// (DAT_0023c144) across the narrower destination via a fixed-point
// accumulator (squashAccum/squashSrcCol) -- see the accumulator's own
// comment for why it's needed (the original per-call-site dropped-
// argument bugs made this a left-aligned crop instead of a real
// resample before being fixed).
void squash_hud_panel_flip_rows(param_1,param_2,param_3)
char *param_1;
char *param_2;
short param_3;

{
  /* Were `undefined4` -- truncated the real 64-bit source/dest pointers
     (already fixed to real pointers at advance_hud_panel_flip's call sites)
     back down to 32 bits on entry. Same pointer-truncation class as
     everywhere else this session. */
  short sVar1;
  wchar_t wVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  /* Not decompiled -- QA: "the panel should fully squish horizontally
     during the flip, ours just crops part of it". Root cause: every
     copy_hud_panel_flip_column() call site in this function (all disassembly-
     confirmed dropped-argument fixes from earlier this session)
     advances param_1 (source column) and param_2 (dest column) by
     exactly 1 EACH, every single call, with no exception anywhere in
     this function -- confirmed at the instruction level, not a
     decompiler artifact. Since the total number of calls always
     equals DAT_0023c13c (the squashed width, strictly less than
     DAT_0023c144's full 83 except at stage 0/8), that lockstep means
     param_1 only ever reaches the first DAT_0023c13c source columns
     and never reads the rest -- a left-aligned crop, not a resample.
     A real squash needs param_1 to sweep the FULL source width
     (DAT_0023c144) over the same DAT_0023c13c destination writes.
     Added a simple fixed-point accumulator (new, not decompiled) to
     do that: advance a running source-position accumulator by
     DAT_0023c144 on every destination column written, and step
     param_1 by however many whole source columns that accumulator
     just crossed -- so by the last destination column, param_1 has
     swept the entire source width, however narrow the destination
     got. param_2 keeps its original (correct) +1-per-call advance. */
  int squashAccum;
  int squashSrcCol;

  sVar6 = DAT_0023c144;
  iVar8 = (int)param_3;
  iVar11 = (int)DAT_0023c144;
  wVar2 = u_dgijjjigd_G__000871e0[iVar8 + 8];
  sVar3 = ordint_divmod(100,iVar11 * wVar2).quot;
  sVar1 = DAT_0023c140;
  iVar9 = (int)sVar3;
  iVar10 = (int)DAT_0023c140;
  DAT_0023c13c = sVar3;
  sVar4 = ordint_divmod(100,u_dgijjjigd_G__000871e0[iVar8] * iVar10).quot;
  sVar5 = ordint_divmod((int)wVar2,100).quot;
  if (sVar5 == 1) {
    sVar3 = (short)(sVar6 - iVar9);
    sVar6 = ordint_divmod(((sVar6 - iVar9) * 0x10000 >> 0x10) + 1,iVar11).quot;
    sVar6 = sVar6 + -1;
  }
  else {
    sVar6 = 1;
  }
  squashAccum = 0;
  squashSrcCol = 0;
  iVar11 = 0;
  if (iVar8 < 4) {
    iVar8 = (iVar10 - sVar4) * 0x10000 >> 0x10;
    iVar7 = iVar9 + ((iVar10 - sVar4) * 0x10000 >> 0x10);
    DAT_0023c110 = 0;
    iVar10 = iVar9 + iVar8 * 2;
    DAT_0023c138 = sVar4;
    if (0 < sVar3) {
      do {
        if (0 < sVar6) {
          iVar9 = 0;
          do {
            sVar1 = (short)iVar10;
            if (sVar1 < 1) {
              DAT_0023c110 = DAT_0023c110 + 1;
              DAT_0023c138 = DAT_0023c138 + -2;
              iVar10 = iVar7 * 2 + (int)sVar1;
            }
            else {
              iVar10 = (int)(short)(iVar8 << 1) + (int)sVar1;
            }
            /* Was `copy_hud_panel_flip_column();` -- dropped arguments. Real
               disassembly (0006f884-0006f8a4) shows param_1/param_2
               passed in as-is, then both incremented by 1 byte
               afterward -- confirmed identical at all 3 call sites
               in this function. */
            copy_hud_panel_flip_column(param_1,param_2);
            /* Not decompiled -- squash accumulator, see this
               function's own comment near its locals. */
            squashAccum = squashAccum + (int)DAT_0023c144;
            param_1 = param_1 + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
            squashSrcCol = squashAccum / (int)DAT_0023c13c;
            param_2 = param_2 + 1;
            iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
          } while (iVar9 < sVar6);
          iVar9 = (int)DAT_0023c13c;
        }
        iVar11 = iVar11 + 1;
      } while (iVar11 * 0x10000 >> 0x10 < (int)sVar3);
    }
  }
  else {
    DAT_0023c138 = sVar1 * 2 - sVar4;
    iVar8 = (sVar4 - iVar10) * 0x10000;
    iVar7 = iVar8 >> 0x10;
    DAT_0023c110 = (short)((uint)iVar8 >> 0x10);
    iVar8 = ((sVar4 - iVar10) * 0x10000 >> 0x10) - iVar9;
    iVar10 = iVar7 * 2 - iVar9;
    if (0 < sVar3) {
      do {
        if (0 < sVar6) {
          iVar9 = 0;
          do {
            sVar1 = (short)iVar10;
            if (sVar1 < 0) {
              iVar10 = (int)(short)(iVar7 << 1) + (int)sVar1;
            }
            else {
              DAT_0023c110 = DAT_0023c110 + -1;
              DAT_0023c138 = DAT_0023c138 + 2;
              iVar10 = iVar8 * 2 + (int)sVar1;
            }
            /* Was `copy_hud_panel_flip_column();` -- same dropped-argument bug as
               the sibling branch above (real disassembly
               0006f96c-0006f988). */
            copy_hud_panel_flip_column(param_1,param_2);
            /* Not decompiled -- squash accumulator, see this
               function's own comment near its locals. */
            squashAccum = squashAccum + (int)DAT_0023c144;
            param_1 = param_1 + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
            squashSrcCol = squashAccum / (int)DAT_0023c13c;
            param_2 = param_2 + 1;
            iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
          } while (iVar9 < sVar6);
          iVar9 = (int)DAT_0023c13c;
        }
        iVar11 = iVar11 + 1;
      } while (iVar11 * 0x10000 >> 0x10 < (int)sVar3);
    }
  }
  for (iVar9 = iVar9 - (int)sVar3 * (int)sVar6; iVar9 = iVar9 * 0x10000 >> 0x10, 0 < iVar9;
      iVar9 = iVar9 + -1) {
    /* Was `copy_hud_panel_flip_column();` -- same dropped-argument bug (real
       disassembly 0006f9ec-0006fa0c: leftover-rows loop). */
    copy_hud_panel_flip_column(param_1,param_2);
    /* Not decompiled -- squash accumulator, see this function's own
       comment near its locals. */
    squashAccum = squashAccum + (int)DAT_0023c144;
    param_1 = param_1 + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
    squashSrcCol = squashAccum / (int)DAT_0023c13c;
    param_2 = param_2 + 1;
  }
  DAT_0023c138 = sVar4;
  return;
}



// was FUN_0006fa28 -- copies one column of the HUD panel-flip's
// squashed panel content from a source column (param_1) into a
// destination column (param_2), stepping through rows via the current
// stage's DAT_0023c138/DAT_0023c140/DAT_0023c110/DAT_0023c13c/
// DAT_0023c144 state (set up by squash_hud_panel_flip_rows just
// before each call) to stretch, shrink, or pad the column as the
// panel's height changes across the flip animation.
void copy_hud_panel_flip_column(param_1,param_2)
undefined1 * param_1;
undefined1 * param_2;

{
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short sVar7;

  sVar7 = DAT_0023c138 - DAT_0023c140;
  if (0 < DAT_0023c110) {
    iVar3 = 0;
    do {
      *param_2 = 0;
      param_2 = param_2 + DAT_0023c13c;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < DAT_0023c110);
  }
  sVar2 = DAT_0023c140;
  iVar3 = (int)sVar7;
  if (iVar3 == 0) {
    if (0 < DAT_0023c140) {
      iVar3 = 0;
      do {
        *param_2 = *param_1;
        param_2 = param_2 + DAT_0023c13c;
        param_1 = param_1 + DAT_0023c144;
        iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      } while (iVar3 < DAT_0023c140);
    }
    sVar2 = 0;
  }
  else if (iVar3 < 1) {
    sVar2 = ordint_divmod(iVar3 + -1,(int)DAT_0023c140).quot;
    iVar6 = 0;
    if (iVar3 < 0) {
      iVar4 = (sVar2 + 1) * 0x10000 >> 0x10;
      sVar1 = DAT_0023c144;
      do {
        if (iVar4 < 0) {
          iVar5 = 0;
          do {
            *param_2 = *param_1;
            iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
            param_2 = param_2 + DAT_0023c13c;
            param_1 = param_1 + DAT_0023c144;
            sVar1 = DAT_0023c144;
          } while (iVar4 < iVar5);
        }
        iVar6 = iVar6 + -1;
        param_1 = param_1 + sVar1;
      } while (iVar3 < iVar6 * 0x10000 >> 0x10);
    }
    sVar2 = (DAT_0023c138 - sVar7 * (short)(sVar2 + 1)) + -1;
  }
  else {
    /* Was `ordint_divmod(iVar3 + 1)` -- missing its dividend argument.
       The sibling branch above (iVar3 < 1) makes the exact same call
       shape fully: `ordint_divmod(iVar3 + -1,(int)DAT_0023c140).quot`
       (divisor=iVar3+/-1, dividend=DAT_0023c140), so by direct
       symmetry this one is missing `(int)DAT_0023c140` too. Unlike
       ordint_divmod's own K&R "leftover register" idiom (safe on the
       original ARM ABI, where an unfilled argument register
       predictably still held the caller's last computed value), a
       dropped argument here is NOT safe on this x86-64 recompile --
       the reused register/stack slot holds architecture-mismatched
       garbage, not the original value. sVar1 becomes this loop's
       inner trip count, so garbage here produced an unbounded copy
       loop and a wild param_1/param_2 write -- the intermittent,
       ASLR-flaky crash/heap-corruption in this function. */
    sVar1 = ordint_divmod(iVar3 + 1,(int)DAT_0023c140).quot;
    iVar6 = 0;
    if (0 < iVar3) {
      do {
        if (0 < sVar1) {
          iVar4 = 0;
          do {
            *param_2 = *param_1;
            param_2 = param_2 + DAT_0023c13c;
            param_1 = param_1 + DAT_0023c144;
            iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
          } while (iVar4 < sVar1);
        }
        iVar6 = iVar6 + 1;
        *param_2 = *param_1;
        param_2 = param_2 + DAT_0023c13c;
        sVar2 = DAT_0023c140;
      } while (iVar6 * 0x10000 >> 0x10 < iVar3);
    }
    sVar2 = sVar2 - sVar7 * sVar1;
  }
  for (iVar3 = (int)sVar2; 0 < iVar3; iVar3 = (iVar3 + -1) * 0x10000 >> 0x10) {
    *param_2 = *param_1;
    param_2 = param_2 + DAT_0023c13c;
    param_1 = param_1 + DAT_0023c144;
  }
  if (0 < DAT_0023c110) {
    iVar3 = 0;
    do {
      *param_2 = 0;
      param_2 = param_2 + DAT_0023c13c;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < DAT_0023c110);
  }
  *param_2 = 0;
  return;
}





// was FUN_00075be0 -- allocates and zero-initializes the HUD sprite-
// list compositor's 3 backing buffers: DAT_0023c3e8 (0x514 bytes,
// 0x14-byte stride per sprite-slot record -- see
// clear_sprite_list_slot_flag/flush_sprite_list_compositor below) and
// two 0x102-byte queue/index buffers (DAT_0023c40c, DAT_0023c3e4),
// each recording its own "end" pointer (DAT_0023c3ec/0x414/0x410).
// Allocation failure for any one buffer just skips that buffer's
// end-pointer setup rather than aborting.
undefined4 init_sprite_list_buffers()

{
  DAT_0023c3e8 = ce_malloc(0x514);
  if (DAT_0023c3e8 != 0) {
    ce_memset(DAT_0023c3e8,0,0x514);
    DAT_0023c3ec = DAT_0023c3e8 + 0x500;
  }
  DAT_0023c40c = ce_malloc(0x102);
  if (DAT_0023c40c != 0) {
    ce_memset(DAT_0023c40c,0,0x102);
    DAT_0023c414 = DAT_0023c40c + 0x100;
  }
  DAT_0023c3e4 = ce_malloc(0x102);
  if (DAT_0023c3e4 != 0) {
    ce_memset(DAT_0023c3e4,0,0x102);
    DAT_0023c410 = DAT_0023c40c + 0x100;
  }
  return 0;
}



// was FUN_00076488 -- clears a HUD sprite-list slot's status-word
// flags (masked by DAT_0023c418) and queues it for redraw, but only
// if the slot's status word currently has DAT_0008763c set (a
// "valid/active" bit); a no-op otherwise, or for an out-of-range
// slot index (>= 0x40). See sprite_list_queue_slot_redraw in
// src/bitmap.c for the actual redraw-queue mechanism this calls into.
undefined4 clear_sprite_list_slot_flag(param_1)
undefined4 param_1;

{
  ushort uVar1;
  ushort *puVar2;
  
  if ((short)param_1 < 0x40) {
    puVar2 = (ushort *)((short)param_1 * 0x14 + DAT_0023c3e8);
    if ((*puVar2 & DAT_0008763c) == 0) {
      return 0;
    }
    uVar1 = DAT_0023c418 & *puVar2;
    *(char *)puVar2 = (char)uVar1;
    *(char *)((char *)puVar2 + 1) = (char)(uVar1 >> 8);
    sprite_list_queue_slot_redraw(param_1);
  }
  return 0xffffffff;
}



// was FUN_00076508 -- the HUD sprite-list compositor's per-call
// flush/draw pass, gated on DAT_0023c41c (skips entirely if not
// dirty). Two passes over the sprite-slot record array
// (DAT_0023c3e8..DAT_0023c414, 0x14-byte stride): the first captures
// framebuffer regions behind "background capture" sprites into a
// grtile (capture_framebuffer_rect_to_grtile) or forwards to
// restore_captured_grtile_backdrop/invalidate_grtile_by_key (not yet named) for other status-word
// bit combinations; the second actually draws each queued sprite via
// draw_sprite_by_id (for a plain sprite) or sprite_list_flush_blit_raw
// (for a raw-blit entry), toggling g_blit_transparent_mode around each
// draw. Supports a UW_DIAG_SPRLIST env-var diagnostic (one line per
// drawn sprite: id/x/y/w/h) already documented at its call site.
// Finishes by calling cursor_show_idle_tick and clearing the dirty
// flag. Confirmed real callers throughout src/hud.c (vitals bar,
// dragon reaction, compass needle, panel transitions) and one in
// src/babl.c.
void flush_sprite_list_compositor()

{
  ushort uVar1;
  bool bVar2;
  ushort *puVar3;
  ushort *puVar4;
  ushort uVar5;
  ushort *puVar6;
  ushort *puVar7;
  
  bVar2 = false;
  if (DAT_0023c41c != 0) {
    decrement_cursor_hide_depth();
    puVar7 = DAT_0023c414 + -0x20;
    puVar6 = DAT_0023c40c;
    if (DAT_0023c40c < puVar7) {
      do {
        puVar4 = puVar7;
        for (uVar5 = *puVar7; uVar5 != 0; uVar5 = uVar5 - 1) {
          puVar4 = puVar4 + 1;
          puVar6 = (ushort *)((uint)*puVar4 * 0x14 + DAT_0023c3e8);
          if ((*puVar6 & DAT_00087640) == 0) {
            restore_captured_grtile_backdrop(*(undefined4 *)(puVar6 + 8));
          }
          else {
            uVar1 = DAT_0023c408 & *puVar6;
            *(char *)puVar6 = (char)uVar1;
            *(char *)((char *)puVar6 + 1) = (char)(uVar1 >> 8);
          }
          if ((*puVar6 & DAT_00087644) != 0) {
            uVar1 = DAT_0023c3f0 & *puVar6;
            *(char *)puVar6 = (char)uVar1;
            *(char *)((char *)puVar6 + 1) = (char)(uVar1 >> 8);
            if (CONCAT13(*(undefined1 *)((char *)puVar6 + 0x13),
                         CONCAT12((char)puVar6[9],
                                  CONCAT11(*(undefined1 *)((char *)puVar6 + 0x11),(char)puVar6[8]))) !=
                0) {
              /* Ghidra dropped the arg here (relying on register
                 carryover from the CONCAT-reconstructed nonzero check
                 just above) -- same class of bug fixed throughout this
                 session. That CONCAT chain reconstructs, byte by byte,
                 exactly `*(undefined4 *)(puVar6 + 8)` -- the same
                 grtile key field restore_captured_grtile_backdrop reads
                 a few lines up -- so pass it explicitly instead of
                 relying on leftover register state. */
              invalidate_grtile_by_key(*(undefined4 *)(puVar6 + 8));
            }
          }
          puVar6 = DAT_0023c40c;
        }
        puVar7 = puVar7 + -0x20;
      } while (puVar6 < puVar7);
    }
    if (puVar6 < DAT_0023c414) {
      do {
        puVar7 = puVar6 + 1;
        if (bVar2) {
          puVar4 = puVar7;
          for (uVar5 = *puVar6; uVar5 != 0; uVar5 = uVar5 - 1) {
            puVar3 = (ushort *)((uint)*puVar4 * 0x14 + DAT_0023c3e8);
            if ((*puVar3 & DAT_0008763c) == 0) {
              uVar1 = *puVar3 | DAT_00087640;
              *(char *)puVar3 = (char)uVar1;
              *(char *)((char *)puVar3 + 1) = (char)(uVar1 >> 8);
            }
            else {
              capture_framebuffer_rect_to_grtile(*(undefined4 *)(puVar3 + 8),(int)(short)puVar3[1],(int)(short)puVar3[2],
                           (int)(short)puVar3[3],puVar3[4]);
            }
            puVar4 = puVar4 + 1;
          }
        }
        uVar5 = *puVar6;
        if (uVar5 != 0) {
          for (; uVar5 != 0; uVar5 = uVar5 - 1) {
            puVar4 = (ushort *)((uint)*puVar7 * 0x14 + DAT_0023c3e8);
            uVar1 = *puVar4;
            if ((uVar1 & DAT_0008763c) != 0) {
              /* UW_DIAG_SPRLIST: one line per sprite the HUD sprite-list
                 compositor draws -- id / x / y / w / h -- handy for
                 filling in the still-zero compass/dragon layout tables
                 (see the FIXME[hud-*-layout] blocks). */
              if (getenv("UW_DIAG_SPRLIST"))
                fprintf(stderr, "[sprlist] slot=%u id=0x%x x=%d y=%d w=%d h=%d path=%s\n",
                        (unsigned)*puVar7, (unsigned)(short)puVar4[7],
                        (int)(short)CONCAT11(*(undefined1 *)((char *)puVar4 + 3),(char)puVar4[1]),
                        (int)(short)CONCAT11(*(undefined1 *)((char *)puVar4 + 5),(char)puVar4[2]),
                        (int)(ushort)puVar4[3], (int)(ushort)puVar4[4],
                        puVar4[5] == 0 ? "draw_sprite_by_id" : "sprite_list_flush_blit_raw");
              if (puVar4[5] == 0) {
                g_blit_transparent_mode = 1;
                if ((uVar1 & DAT_00087648) == 0) {
                  draw_sprite_by_id((int)(short)puVar4[7],
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 3),(char)puVar4[1]),
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 5),(char)puVar4[2]),
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 9),(char)puVar4[4]),
                               puVar4[3]);
                }
                else {
                  draw_sprite_by_id((int)(short)puVar4[7],
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 3),(char)puVar4[1]),
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 5),(char)puVar4[2]),
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 9),(char)puVar4[4]),
                               puVar4[3]);
                }
              }
              else {
                g_blit_transparent_mode = 1;
                if ((uVar1 & DAT_00087648) == 0) {
                  sprite_list_flush_blit_raw((int)(short)puVar4[7],
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 3),(char)puVar4[1]),
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 5),(char)puVar4[2]),
                               (int)(short)puVar4[4],
                               CONCAT11(*(undefined1 *)((char *)puVar4 + 7),(char)puVar4[3]),puVar4[5])
                  ;
                }
                else {
                  sprite_list_flush_blit_raw((int)(short)puVar4[7],
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 3),(char)puVar4[1]),
                               (int)CONCAT11(*(undefined1 *)((char *)puVar4 + 5),(char)puVar4[2]),
                               (int)(short)puVar4[4],
                               CONCAT11(*(undefined1 *)((char *)puVar4 + 7),(char)puVar4[3]),puVar4[5])
                  ;
                }
              }
              g_blit_transparent_mode = 0;
            }
            puVar7 = puVar7 + 1;
          }
          *puVar6 = 0;
        }
        bVar2 = true;
        puVar6 = puVar6 + 0x20;
      } while (puVar6 < DAT_0023c414);
    }
    cursor_show_idle_tick();
    DAT_0023c41c = 0;
  }
  return;
}


/* was FUN_0007e998 -- Not decompiled -- confirmed a genuine dead stub
   in the real binary too (disassembly at 0x0007e998 is just
   `cpy pc,lr`, 4 bytes, no body). This is the "capture the
   framebuffer rect we just drew panel
   content into, back into the grtile buffer" step (both real call
   sites draw content live via draw_stats_panel_content/the target hud
   panel handler and then immediately call this to snapshot it for the
   flip animation to work from).

   capture_framebuffer_rect_to_grtile, the obvious existing primitive
   to delegate to, copies the live framebuffer's 16bpp RGB565 pixels
   verbatim -- but the grtile buffers here and copy_hud_panel_flip_column's whole
   squash-blit loop are 8bpp paletted (1 byte/pixel, confirmed via
   disassembly-recovered pointer stepping), same format
   decode_gr_entry_bitmap/decode_gr_entry_to_buffer already decoded into this exact
   buffer just before draw_stats_panel_content ran. A real fix needs
   an actual 16bpp->8bpp palette-matching capture, which doesn't exist
   anywhere else in this codebase -- implemented here as a per-pixel
   nearest-color search against g_palette_rgb565 (the same 256-entry
   RGB565 table every other paletted draw in this file already
   indexes into, e.g. rect_fill_or_save_restore's fill mode and
   uw_get_default_palette's own reverse-conversion precedent).

   Writes tightly-packed rows (stride = width, no padding) starting at
   the destination buffer's own base -- matching the layout
   decode_gr_entry_to_buffer's decode already established for this same buffer
   (bitmap_blit_to_framebuffer reads it back with that same width as
   its own row stride, no separate pitch).

   param_1 is the destination grtile buffer's real pointer (both call
   sites already resolve it via resolve_flip_grtile_slot before
   calling, unlike capture_framebuffer_rect_to_grtile which wants the
   raw registry key instead -- see that function's own comment on this
   same distinction). param_2/param_3 are the framebuffer capture
   rect's x/y; param_4/param_5 are width/height, in that order --
   confirmed by cross-checking both real call sites' literal argument
   values against the adjacent, already-working
   bitmap_blit_to_framebuffer call's own disassembly-verified
   (x,y,src,HEIGHT,WIDTH,...) parameter order (that function's param_4
   drives the row/Y loop, param_5 the column/X loop and source
   stride) -- capture_framebuffer_rect_to_grtile_paletted's own two call sites consistently pass
   their last two arguments in the opposite (width,height) order from
   that sibling blit call sitting right next to each of them. */
void capture_framebuffer_rect_to_grtile_paletted(param_1,param_2,param_3,param_4,param_5)
unsigned char *param_1;
int param_2;
int param_3;
int param_4;
int param_5;

{
  int row;
  int col;
  int i;
  unsigned short *pal565;
  unsigned short src_pixel;
  unsigned short pal_pixel;
  int dr;
  int dg;
  int db;
  int dist;
  int best_index;
  int best_dist;
  short *fb_row;

  pal565 = (unsigned short *)g_palette_rgb565_backing;
  for (row = 0; row < param_5; row++) {
    fb_row = (short *)((char *)g_uw_framebuffer + ((param_3 + row) * 0x140 + param_2) * 2);
    for (col = 0; col < param_4; col++) {
      src_pixel = (unsigned short)fb_row[col];
      best_index = 0;
      best_dist = 0x7fffffff;
      for (i = 0; i < 256; i++) {
        pal_pixel = pal565[i];
        dr = (int)((src_pixel >> 11) & 0x1f) - (int)((pal_pixel >> 11) & 0x1f);
        dg = (int)((src_pixel >> 5) & 0x3f) - (int)((pal_pixel >> 5) & 0x3f);
        db = (int)(src_pixel & 0x1f) - (int)(pal_pixel & 0x1f);
        dist = dr * dr + dg * dg + db * db;
        if (dist < best_dist) {
          best_dist = dist;
          best_index = i;
          if (dist == 0) break;
        }
      }
      param_1[row * param_4 + col] = (unsigned char)best_index;
    }
  }
}





// was FUN_0007f044 -- one-time message-scroll-panel setup, called
// once from src/hud.c's game init: points the shared panel-state
// pointer (DAT_00250704) at g_msg_scroll_panel_state, selects mode 0,
// and initializes+draws the panel's geometry/border.
void init_msg_scroll_panel()

{
  DAT_00250704 = &g_msg_scroll_panel_state;
  DAT_00250714 = 0;
  msg_scroll_panel_init(0xf,0xa9,0x131,200,0);
  msg_scroll_draw_edges();
  return;
}



// was FUN_0007f094 -- checks whether the mouse cursor is currently
// over the active message-scroll panel's rect (via is_position_within_rect, not
// yet named -- a point-in-rect hit test with a cursor-size margin,
// confirmed by its own body testing g_mouse_x/g_mouse_y), storing the
// hit/miss result in the shared DAT_00250708 flag other panel code
// reads (e.g. wait_for_click_release/input-wait loops below).
void check_mouse_over_msg_scroll_panel()

{
  DAT_00250708 = is_position_within_rect((int)DAT_00250704[2],(int)DAT_00250704[1],(int)DAT_00250704[3],
                              (int)*DAT_00250704);
  return;
}



// was FUN_0007f0e0 -- selects the message-scroll panel's "normal"
// mode (id 0): points the shared state pointer at
// g_msg_scroll_panel_state and sets the dirty/needs-redraw flag
// (DAT_0025071c).
void select_msg_scroll_mode_normal()

{
  DAT_00250714 = 0;
  DAT_0025071c = 1;
  DAT_00250704 = &g_msg_scroll_panel_state;
  return;
}



// was FUN_0007f110 -- selects the message-scroll panel's "NPC
// conversation" mode (id 1, confirmed by a pre-existing comment on
// g_msg_scroll_panel_state_conv's own declaration): points the shared
// state pointer at the separate conversation-mode panel struct and
// sets the dirty flag.
void select_msg_scroll_mode_conversation()

{
  DAT_00250714 = 1;
  DAT_0025071c = 1;
  DAT_00250704 = &g_msg_scroll_panel_state_conv;
  return;
}



// was FUN_0007f140 -- selects message-scroll mode id 2, reusing the
// same underlying g_msg_scroll_panel_state buffer as mode 0
// (select_msg_scroll_mode_normal) but under a distinct mode id.
// Confirmed live usage (src/babl.c) calls this immediately before
// select_msg_scroll_mode_conversation when entering a full-screen
// barter/talk window, each followed by its own msg_scroll_panel_reset
// -- reads as a transitional "reset the normal panel" step rather
// than a genuinely distinct third display mode, but its exact
// purpose beyond sharing mode 0's buffer isn't confirmed.
void select_msg_scroll_mode_2()

{
  DAT_00250714 = 2;
  DAT_0025071c = 1;
  DAT_00250704 = &g_msg_scroll_panel_state;
  return;
}





// was FUN_0007f170 -- input-pump wait loop used by the message-scroll
// panel: waits for the next distinct input event (or, if param_1 is
// nonzero, until param_1 clock units elapse), flushing the dirty
// rect and showing the idle-cursor tick each iteration when the
// mouse is already over the panel (DAT_00250708) and param_2 is set.
// Confirmed by its src/hud.c call site drawing the "--MORE--" prompt
// text immediately beforehand (param_1=0, i.e. wait indefinitely) as
// the "wait for the player to click through this page" step; after
// the wait, re-checks the mouse-over-panel state and, if param_2's
// bit matches, calls decrement_cursor_hide_depth (not yet named).
void wait_for_click_to_continue(param_1,param_2)
short param_1;
uint param_2;

{
  short sVar1;
  short sVar2;
  int iVar3;
  uint uVar4;
  
  wait_for_click_release(1);
  sVar1 = next_input_event();
  iVar3 = read_realtime_clock_units();
  if (DAT_00250708 != 0 && param_2 != 0) {
    cursor_show_idle_tick();
  }
  do {
    sVar2 = next_input_event();
    if (sVar1 != sVar2) break;
    flush_dirty_rect_to_display(1);
  } while ((param_1 == 0) || (uVar4 = read_realtime_clock_units(), uVar4 <= (uint)(param_1 + iVar3)));
  wait_for_click_release(1);
  check_mouse_over_msg_scroll_panel();
  if ((param_2 & DAT_00250708) != 0) {
    decrement_cursor_hide_depth();
  }
  return;
}





// was FUN_0007f290 -- the conversation-mode counterpart to
// msg_scroll_draw_edges (src/hud.c calls this one specifically when
// DAT_00250704 does NOT point at g_msg_scroll_panel_state, i.e. the
// panel is in conversation/mode-2, not normal mode). Draws 3 rows of
// mirrored sprite pairs (a decorative frame/border) at fixed x
// positions, animated through 6 frames via DAT_00250728 as a cycling
// counter.
undefined4 draw_conversation_window_decoration()

{
  int iVar1;
  int iVar2;

  iVar1 = 0;
  do {
    iVar2 = iVar1 * 0x1b + 0x34;
    draw_sprite_by_id(DAT_00250728 + 0x20df,0x34,iVar2,0x1b,5);
    draw_sprite_by_id(DAT_00250728 + 0x20e5,0xdc,iVar2,0x1b,5);
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 3);
  iVar1 = (int)DAT_00250728;
  DAT_00250728 = (short)(iVar1 + 1);
  if ((iVar1 + 1) * 0x10000 >> 0x10 == 6) {
    DAT_00250728 = 0;
  }
  return 0;
}





// was FUN_0007f6fc -- confirmed by message_scroll_print_wrapped's own
// pre-existing comment (src/hud.c) as its per-~49-char-chunk worker
// (one call per line in the word-wrap loop). Splits
// its chunk on embedded backslash (0x5c) bytes, treating each segment
// as one call to msg_scroll_split_newline_segments; a segment whose
// second byte is 'm' (or whose third byte is nonzero) forces the wrap
// flag to 1 regardless of param_2 -- an in-text escape/formatting
// marker whose exact purpose isn't confirmed.
void msg_scroll_split_escape_segments(param_1,param_2)
undefined1 * param_1;
undefined4 param_2;

{
  undefined1 *puVar1;
  undefined4 uVar2;
  
  while (puVar1 = (undefined1 *)ce_strchr(param_1 + 1,0x5c), puVar1 != (undefined1 *)0x0) {
    *puVar1 = 0;
    if ((puVar1[2] != '\0') || (uVar2 = param_2, puVar1[1] == 'm')) {
      uVar2 = 1;
    }
    msg_scroll_split_newline_segments(param_1,uVar2);
    *puVar1 = 0x5c;
    param_1 = puVar1;
  }
  msg_scroll_split_newline_segments(param_1,param_2);
  return;
}



// was FUN_0007f770 -- confirmed by pre-existing callers' comments
// (src/object_actions.c) as "the scroll's own line-break logic": only
// breaks its input on an embedded '\n' (ASCII 10) byte, calling
// msg_scroll_draw_wrapped_span for each resulting line.
void msg_scroll_split_newline_segments(param_1,param_2)
char * param_1;
undefined4 param_2;

{
  char cVar1;
  char *iVar2;   /* was `int` -- ce_strchr (strchr) returns a real
                    64-bit pointer; truncating it made `*(char *)(iVar2+1)`
                    a wild deref, e.g. crashing "You see nothing." on a
                    right-click. */

  while ((iVar2 = ce_strchr(param_1,10), iVar2 != 0 &&
         (cVar1 = iVar2[1], cVar1 != '\0'))) {
    iVar2[1] = 0;
    msg_scroll_draw_wrapped_span(param_1,1);
    param_1 = iVar2 + 1;
    *param_1 = cVar1;
  }
  msg_scroll_draw_wrapped_span(param_1,param_2);
  return;
}





// was FUN_0007fe20 -- prints the decimal string form of param_1 (via
// itoa_radix) to the message scroll, restoring the cursor to the saved
// column (DAT_0025070c) first. Used to echo a numeric answer back after
// a scroll-based prompt.
void echo_number_to_scroll(param_1)
short param_1;

{
  short sVar1;
  int iVar2;
  undefined1 auStack_18 [8];

  itoa_radix((int)param_1,auStack_18,10);
  iVar2 = (int)DAT_0025070c;
  sVar1 = *(short *)(DAT_00250704 + 10);
  select_msg_scroll_mode_normal();
  *g_draw_color_index = (char)*(undefined2 *)(DAT_00250704 + 0x16);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(iVar2,(int)sVar1,*(undefined2 *)(DAT_00250704 + 8),
               (uint)*(ushort *)(DAT_000879b0 + 6) + sVar1 + -1);
  sVar1 = DAT_0025070c;
  *(char *)(DAT_00250704 + 8) = (char)DAT_0025070c;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)sVar1 >> 8);
  message_scroll_print_wrapped(auStack_18);
  return;
}



// was FUN_0007fee8 -- prints "Yes" or "No" to the message scroll
// (param_1 nonzero == "Yes"), restoring the cursor to the saved
// column first, the same setup echo_number_to_scroll does. Used to
// echo a yes/no answer back after a scroll-based prompt.
void echo_yes_no_to_scroll(param_1)
int param_1;

{
  short sVar1;
  undefined *puVar2;
  int iVar3;
  
  iVar3 = (int)DAT_0025070c;
  sVar1 = *(short *)(DAT_00250704 + 10);
  select_msg_scroll_mode_normal();
  *g_draw_color_index = (char)*(undefined2 *)(DAT_00250704 + 0x16);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(iVar3,(int)sVar1,*(undefined2 *)(DAT_00250704 + 8),
               (uint)*(ushort *)(DAT_000879b0 + 6) + sVar1 + -1);
  sVar1 = DAT_0025070c;
  *(char *)(DAT_00250704 + 8) = (char)DAT_0025070c;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)sVar1 >> 8);
  if (param_1 == 0) {
    puVar2 = &s_No_0008799c;
  }
  else {
    puVar2 = &s_Yes_000879a0;
  }
  message_scroll_print_wrapped(puVar2);
  return;
}





// was FUN_0007ffa8
undefined4 scroll_text_entry_prompt(param_1,param_2,param_3,param_4,param_5)
undefined * param_1;
char * param_2;
intptr_t param_3;
int param_4;
short param_5;

{
  char cVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  char *pcVar6;
  int iVar7;
  undefined4 uVar8;
  uint uVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  uint uVar13;
  int iVar14;
  short local_a8;
  char acStack_a1 [57];
  char local_68 [52];
  
  if (0x32 < param_5) {
    param_5 = 0x32;
  }
  select_msg_scroll_mode_normal();
  *g_draw_color_index = (char)*(undefined2 *)(DAT_00250704 + 0x16);
  if (param_1 == (undefined *)0x0) {
    sVar3 = measure_text_width(&s_scroll_prompt_arrow_000879a8);
    sVar3 = -sVar3 - *(short *)(DAT_00250704 + 0xc);
    param_1 = &s_scroll_prompt_arrow_000879a8;
  }
  else {
    sVar3 = measure_text_width(param_1);
    sVar3 = -sVar3 - *(short *)(DAT_00250704 + 0xc);
  }
  sVar2 = *(short *)(DAT_00250704 + 6);
  message_scroll_print_wrapped(param_1);
  DAT_0025070c = *(short *)(DAT_00250704 + 8);
  if (param_2 == (char *)0x0) {
    uVar13 = 0;
  }
  else {
    g_scroll_control_codes_enabled = 0;
    message_scroll_print_wrapped(param_2);
    g_scroll_control_codes_enabled = 1;
    pcVar6 = param_2;
    do {
      cVar1 = *pcVar6;
      /* Preserve Ghidra's relative-copy idiom without truncating pointers. */
      pcVar6[(intptr_t)(acStack_a1 + 1) - (intptr_t)param_2] = cVar1;
      pcVar6 = pcVar6 + 1;
    } while (cVar1 != '\0');
    iVar7 = ce_strlen(param_2);
    uVar13 = iVar7 * -0x10000 >> 0x10;
  }
  sVar5 = (short)uVar13;
  uVar11 = (int)sVar5 >> 0x1f;
  acStack_a1[(((int)sVar5 ^ uVar11) - uVar11) + 1] = '\0';
  local_a8 = 3000;
  sVar4 = measure_text_width(acStack_a1 + 1);
  iVar7 = ((int)sVar4 + (int)DAT_0025070c) * 0x10000 >> 0x10;
  iVar14 = (int)*(short *)(DAT_00250704 + 10);
  decrement_cursor_hide_depth();
  wait_for_click_release(0);
  g_text_input_active = 1;
  uVar8 = next_input_event();
  sVar4 = (short)uVar8;
  do {
    iVar12 = (int)sVar4;
    if ((((iVar12 == 0xd) || (sVar5 = (short)uVar13, iVar12 == 0x1b)) || (iVar12 == 1)) ||
       ((iVar12 == 2 || (iVar12 == 3)))) {
      if (1999 < local_a8) {
        set_draw_color(0x2a);
        rect_fill_or_save_restore(iVar7,iVar14,iVar7 + 4,(uint)*(ushort *)(DAT_000879b0 + 6) + iVar14 + -1);
        uVar13 = ce_strlen(acStack_a1 + 1);
        if ((uint)(int)sVar5 < uVar13) {
          draw_text_string(acStack_a1 + 1,(int)DAT_0025070c,(int)*(short *)(DAT_00250704 + 10));
        }
      }
      cursor_show_idle_tick();
      if ((short)uVar8 == 0x1b) {
        param_3 = param_3 - (intptr_t)param_2;
        do {
          cVar1 = *param_2;
          param_2[param_3] = cVar1;
          param_2 = param_2 + 1;
        } while (cVar1 != '\0');
        set_draw_color(0x2a);
        rect_fill_or_save_restore((int)DAT_0025070c,(uint)*(ushort *)(DAT_00250704 + 10),
                     *(undefined2 *)(DAT_00250704 + 6),
                     (*(ushort *)(DAT_00250704 + 10) - 1) + (uint)*(ushort *)(DAT_000879b0 + 6));
        sVar3 = DAT_0025070c;
        *(char *)(DAT_00250704 + 8) = (char)DAT_0025070c;
        *(char *)(DAT_00250704 + 9) = (char)((ushort)sVar3 >> 8);
        message_scroll_print_wrapped(&s_dash_000879a4);
      }
      else {
        pcVar6 = acStack_a1;
        do {
          pcVar6 = pcVar6 + 1;
          cVar1 = *pcVar6;
          pcVar6[param_3 - (intptr_t)(acStack_a1 + 1)] = cVar1;
        } while (cVar1 != '\0');
        *(char *)(DAT_00250704 + 8) = (char)iVar7;
        *(char *)(DAT_00250704 + 9) = (char)((uint)iVar7 >> 8);
      }
      g_text_input_active = 0;
      return uVar8;
    }
    flush_dirty_rect_to_display(1);
    iVar7 = 0;
    do {
      cVar1 = acStack_a1[iVar7 + 1];
      local_68[iVar7] = cVar1;
      iVar7 = iVar7 + 1;
    } while (cVar1 != '\0');
    uVar11 = (uint)sVar5;
    local_68[(uVar11 ^ (int)uVar11 >> 0x1f) - ((int)uVar11 >> 0x1f)] = '\0';
    sVar5 = measure_text_width(local_68);
    iVar7 = ((int)sVar5 + (int)DAT_0025070c) * 0x10000 >> 0x10;
    if ((local_a8 < 2000) || (3999 < local_a8)) {
      if (local_a8 == 4000) {
        set_draw_color(0x2a);
        local_a8 = 0;
        rect_fill_or_save_restore(iVar7,iVar14,iVar7 + 4,(uint)*(ushort *)(DAT_000879b0 + 6) + iVar14 + -1);
        uVar9 = ce_strlen(acStack_a1 + 1);
        if (uVar11 < uVar9) {
          draw_text_string(acStack_a1 + 1,(int)DAT_0025070c,(int)*(short *)(DAT_00250704 + 10));
        }
      }
    }
    else {
      set_draw_color(*(undefined2 *)(DAT_00250704 + 0x16));
      rect_fill_or_save_restore(iVar7,iVar14,iVar7 + 4,(uint)*(ushort *)(DAT_000879b0 + 6) + iVar14 + -1);
    }
    local_a8 = local_a8 + 1;
    if (iVar12 < 0xa9) {
      if (iVar12 == 0xa8) {
LAB_00080404:
        if ((int)uVar11 < 0) {
          uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
        }
        if ((short)uVar13 < 1) goto LAB_0008062c;
        sVar5 = (short)uVar13 + -1;
LAB_000805c0:
        uVar13 = (uint)sVar5;
        goto LAB_0008062c;
      }
      if (0x91 < iVar12) {
        if (iVar12 == 0x92) goto LAB_0008061c;
        if (iVar12 != 0x96) {
          if (iVar12 != 0xa5) goto LAB_000804d0;
LAB_000803bc:
          uVar13 = 0;
          goto LAB_0008062c;
        }
LAB_0008042c:
        if ((int)uVar11 < 0) {
          uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
        }
        uVar9 = ce_strlen(acStack_a1 + 1);
        uVar11 = (uint)(short)uVar13;
        if ((uVar11 < uVar9) && (uVar9 = ce_strlen(acStack_a1 + 1), uVar11 < uVar9)) {
          do {
            acStack_a1[uVar11 + 1] = acStack_a1[uVar11 + 2];
            uVar9 = ce_strlen(acStack_a1 + 1);
            uVar11 = (uint)(short)((uVar11 + 1) * 0x10000 >> 0x10);
          } while (uVar11 < uVar9);
        }
        goto LAB_0008062c;
      }
      if (iVar12 == 0x91) goto LAB_000805f0;
      if (iVar12 != -1) {
        if (iVar12 != 8) {
          if (iVar12 == 0x8c) goto LAB_000803bc;
          if (iVar12 != 0x8f) goto LAB_000804d0;
          goto LAB_00080404;
        }
        if ((int)uVar11 < 0) {
          uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
        }
        uVar11 = (uint)(short)uVar13;
        if ((int)uVar11 < 1) goto LAB_0008062c;
        uVar9 = ce_strlen(acStack_a1 + 1);
        if (uVar11 <= uVar9) {
          do {
            acStack_a1[uVar11] = acStack_a1[uVar11 + 1];
            uVar9 = ce_strlen(acStack_a1 + 1);
            uVar11 = (uint)(short)((uVar11 + 1) * 0x10000 >> 0x10);
          } while (uVar11 <= uVar9);
        }
        sVar5 = (short)uVar13 + -1;
        goto LAB_000805c0;
      }
    }
    else {
      if (iVar12 < 0x165) {
        if (iVar12 == 0x164) goto LAB_0008042c;
        if (iVar12 != 0xa9) {
          if (iVar12 != 0xaa) {
            if (iVar12 == 0x161) goto LAB_000803bc;
            if (iVar12 != 0x162) goto LAB_000804d0;
            goto LAB_00080404;
          }
          goto LAB_0008061c;
        }
LAB_000805f0:
        if ((int)uVar11 < 0) {
          uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
        }
        uVar11 = ce_strlen(acStack_a1 + 1);
        sVar5 = (short)uVar13;
        if ((uint)(int)sVar5 < uVar11) {
LAB_000805bc:
          sVar5 = sVar5 + 1;
          goto LAB_000805c0;
        }
      }
      else if (iVar12 == 0x165) {
LAB_0008061c:
        uVar13 = ce_strlen(acStack_a1 + 1);
        uVar13 = uVar13 & 0xffff;
      }
      else {
        if (iVar12 == 0x166) goto LAB_000805f0;
        if (iVar12 == 0x16b) {
          if ((int)uVar11 < 0) {
            uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
          }
          acStack_a1[(short)uVar13 + 1] = '\0';
        }
        else {
LAB_000804d0:
          if ((int)uVar11 < 0) {
            acStack_a1[1] = 0;
            uVar13 = 0;
          }
          if (((((iVar12 != -1) && (iVar10 = _isctype(iVar12,0x157), iVar10 != 0)) &&
               (sVar5 = measure_text_width(acStack_a1 + 1), sVar5 < (short)(sVar3 + -0x14 + sVar2))) &&
              (uVar11 = ce_strlen(acStack_a1 + 1), uVar11 < (uint)(int)param_5)) &&
             ((param_4 != 0 || (iVar12 = _isctype(iVar12,4), iVar12 != 0)))) {
            sVar5 = ce_strlen(acStack_a1 + 1);
            iVar12 = (int)sVar5;
            acStack_a1[iVar12 + 2] = '\0';
            sVar5 = (short)uVar13;
            for (; sVar5 < iVar12; iVar12 = (iVar12 + -1) * 0x10000 >> 0x10) {
              acStack_a1[iVar12 + 1] = acStack_a1[iVar12];
            }
            acStack_a1[sVar5 + 1] = (char)uVar8;
            goto LAB_000805bc;
          }
        }
      }
LAB_0008062c:
      set_draw_color(0x2a);
      rect_fill_or_save_restore((int)DAT_0025070c,*(short *)(DAT_00250704 + 10),*(undefined2 *)(DAT_00250704 + 6)
                   ,*(short *)(DAT_000879b0 + 6) + *(short *)(DAT_00250704 + 10));
      *g_draw_color_index = *(undefined1 *)(DAT_00250704 + 0x16);
      draw_text_string(acStack_a1 + 1,(int)DAT_0025070c,(int)*(short *)(DAT_00250704 + 10));
    }
    sVar5 = (short)uVar13;
    uVar8 = next_input_event();
    sVar4 = (short)uVar8;
  } while( true );
}





// was FUN_00080828 -- interactive yes/no scroll prompt: prints the
// question (either param_1 directly, or print_scroll_message_by_id
// on param_2 when param_1 is 0), echoes the current default answer
// (*param_3) as "Yes"/"No", then loops on input: y/Y/n/N toggle and
// re-echo the live answer; Enter/click/1/2/3 confirm with the current
// answer written back to *param_3; Esc cancels (forces *param_3 to
// 0/"No" and returns -1). Confirmed by its own two call sites
// (echo_yes_no_to_scroll(0)/(iVar4) matching the exact "toggle and
// re-echo" pattern) as the prompt behind those echo calls.
undefined4 prompt_yes_no_scroll(param_1,param_2,param_3)
int param_1;
undefined4 param_2;
int * param_3;

{
  short sVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = *param_3;
  select_msg_scroll_mode_normal();
  *g_draw_color_index = (char)*(undefined2 *)(DAT_00250704 + 0x16);
  if (param_1 == 0) {
    print_scroll_message_by_id(param_2);
  }
  else {
    message_scroll_print_wrapped(param_1);
  }
  DAT_0025070c = *(undefined2 *)(DAT_00250704 + 8);
  if (*param_3 == 0) {
    puVar2 = &s_No_0008799c;
  }
  else {
    puVar2 = &s_Yes_000879a0;
  }
  message_scroll_print_wrapped(puVar2);
  decrement_cursor_hide_depth();
  wait_for_click_release(0);
  while( true ) {
    uVar3 = next_input_event();
    sVar1 = (short)uVar3;
    if ((((sVar1 == 0xd) || (sVar1 == 0x1b)) || (sVar1 == 1)) || ((sVar1 == 2 || (sVar1 == 3)))) {
      cursor_show_idle_tick();
      if (sVar1 == 0x1b) {
        echo_yes_no_to_scroll(0);
        *param_3 = 0;
        uVar3 = 0xffffffff;
      }
      else {
        *param_3 = iVar5;
      }
      return uVar3;
    }
    flush_dirty_rect_to_display(1);
    if (sVar1 == 0x4e) break;
    if (sVar1 == 0x59) goto LAB_0008090c;
    if (sVar1 == 0x6e) break;
    if (sVar1 == 0x79) {
LAB_0008090c:
      iVar4 = 1;
LAB_00080918:
      if (iVar4 != iVar5) {
        echo_yes_no_to_scroll(iVar4);
        iVar5 = iVar4;
      }
    }
  }
  iVar4 = 0;
  goto LAB_00080918;
}





// was FUN_0003df28 -- click handler for the stats-panel name/portrait
// click region (registered below in register_stats_panel_click_regions
// at (0x7a,0x97,0x98,0x88)). Prints a multi-part descriptive "scroll"
// paragraph about the player built from stat bytes at DAT_00086df8+0x39
// (scaled via ordint_divmod into a 0-5 clamped adjective index) and
// +0x3a, plus a percentile derived from orduint_divmod(0x1c2000, field
// +0xce) -- that first argument is NOT the address of a global despite
// how it first decompiled (`&DAT_001c2000`): real ARM disassembly at
// this call site (and render_endgame_character_stats' identical one)
// shows `mov r0,#0x1c0000` / `orr r0,r0,#0x2000`, ARM's standard two-
// instruction idiom for building a 32-bit immediate that doesn't fit
// one rotated-immediate encoding. Ghidra mistook the resulting literal
// 0x1c2000 for "the address of whatever's mapped there" purely because
// it falls inside .data; confirmed via getReferencesTo -- both of this
// constant's only two "references" are PARAM-only (used as a value),
// never a READ or WRITE, so nothing ever treats it as real storage.
// Plain divisor constant, not a global.
void print_character_description_scroll()

{
  int uw_ord2005_rem_111 = 0;
  short sVar1;
  short sVar2;
  int iVar3;
  short extraout_r1;
  
  message_scroll_print_wrapped(&s_scroll_newline_0008522c);
  sVar1 = ordint_divmod(0x1e,*(undefined1 *)(DAT_00086df8 + 0x39)).quot;
  print_scroll_message_concat(0x40,sVar1 + 0x68,0x67);
  sVar1 = ordint_divmod(0x17,*(undefined1 *)(DAT_00086df8 + 0x3a)).quot;
  iVar3 = (int)sVar1;
  if (5 < iVar3) {
    iVar3 = 5;
  }
  print_scroll_message_by_id(0x76 - iVar3);
  message_scroll_print_wrapped(&DAT_00084f20);
  print_scroll_message_concat(0x41,DAT_00201b68 + 0x19a,0x42);
  sVar1 = orduint_divmod(0x1c2000,*(undefined4 *)(DAT_00086df8 + 0xce)).quot;
  sVar2 = ordint_divmod(0xc,(int)sVar1).quot;
  uw_ord2005_rem_111 = ((int)((int)sVar1)) % (0xc);
  if (sVar2 < 0x65) {
    print_scroll_message_concat(0x43,sVar2 + 0x19b,0x44);
  }
  else {
    print_scroll_message_by_id(0x45);
  }
  print_scroll_message_concat(0x46,uw_ord2005_rem_111 + 0x47,0x53);
  wait_for_click_release(1);
  return;
}



// was FUN_0003e0b4 -- click handler for the stats-panel flask click
// region (registered below at (0xf4,0x9c,0x135,0x78); own debug label
// already says "[flask]"). Reads the click-local offset DAT_00085a6c
// (xoff/yoff within the flask widget) to decide which flask was hit and
// prints a "current/max" scroll message (HP or mana, depending on
// offset and the player record's class/stat-point bytes), or toggles
// the stats panel if the click landed below the flask.
void show_flask_value_tooltip()

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  undefined1 auStack_a4 [16];
  undefined1 auStack_94 [16];
  char local_84 [120];

  sVar2 = *DAT_00085a6c;
  if (getenv("UW_DEBUG_CLICKREGION"))
    fprintf(stderr, "[flask] show_flask_value_tooltip entry: xoff=%d yoff=%d\n", (int)sVar2, (int)DAT_00085a6c[1]);
  if ((sVar2 < 0x1a) || (0x27 < sVar2)) {
    if (DAT_00085a6c[1] < 0x1f) {
      pcVar3 = (char *)get_message_string((int)(short)(ushort)(0x1e < sVar2) + 0x59U | 0x200);
      pcVar4 = local_84;
      do {
        cVar1 = *pcVar3;
        pcVar3 = pcVar3 + 1;
        *pcVar4 = cVar1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      if (*DAT_00085a6c < 0x1e) {
        itoa_radix(*(undefined1 *)((char *)g_player_object + 8),auStack_94,10);
        itoa_radix(*(undefined1 *)(DAT_0023be74 + 4),auStack_a4,10);
        if ((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) != 0) {
          sVar2 = ordint_divmod(3,(*(byte *)(DAT_00086df8 + 0x5f) >> 2 & 0xf) - 1).quot;
          print_scroll_message_concat(0x5b,sVar2 + 0x54,0x5c);
        }
      }
      else {
        itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x37),auStack_94,10);
        itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x38),auStack_a4,10);
      }
      ce_strcat(local_84,auStack_94);
      ce_strcat(local_84,s_out_of_000858dc);
      ce_strcat(local_84,auStack_a4);
      ce_strcat(local_84,&s_scroll_newline_0008522c);
      message_scroll_print_wrapped(local_84);
      wait_for_click_release(1);
    }
  }
  else if (0xd < DAT_00085a6c[1]) {
    toggle_stats_panel(0);
  }
  return;
}



// was FUN_0003e2a4 -- registers the stats panel's click regions: the
// cursor-mode button (normal and restricted variants), the two
// still-unnamed widget handlers handle_cast_spell_click/handle_light_source_click, and this
// pass's print_character_description_scroll (name/portrait) and
// show_flask_value_tooltip (HP/mana flask).
void register_stats_panel_click_regions()

{
  DAT_000868d8 = 0;
  DAT_00202090 = register_click_region(8,0x74,0x20,0xfffffffa,0xffff,1,cursor_mode_button_click);
  DAT_00202090 = register_click_region(8,0x74,0x20,0xfffffffa,0xffff,4,cursor_mode_button_click_restricted);
  DAT_002020c8 = register_click_region(0xb0,0x9b,0xde,0x8b,0,1,handle_cast_spell_click);
  DAT_002020bc = register_click_region(0x34,0x99,0x66,0x89,0,1,handle_light_source_click);
  DAT_0020209c = register_click_region(0x7a,0x97,0x98,0x88,0,1,print_character_description_scroll);
  DAT_002020b4 = register_click_region(0xf4,0x9c,0x135,0x78,0,1,show_flask_value_tooltip);
  return;
}



// was FUN_0003e404 -- unwinds register_stats_panel_click_regions'
// four non-cursor-mode regions.
void unregister_stats_panel_click_regions()

{
  unregister_key_binding((int)DAT_002020c8);
  unregister_key_binding((int)DAT_002020bc);
  unregister_key_binding((int)DAT_002020b4);
  unregister_key_binding((int)DAT_0020209c);
  return;
}



// was FUN_0003e644 -- skips the refresh unless the compass/main view
// is active (g_active_hud_panel == 0) or the stats-panel sub-view index
// (DAT_00085a6c+8) is 4 (the equipment/paperdoll sub-view); otherwise
// redraws the armor overlay plus the two still-unnamed
// reload_paperdoll_body_sprite/redraw_container_icon_slot refreshes. Reads as "refresh the equipment
// display if it's currently visible".
void refresh_equipment_display_if_visible()

{
  if ((g_active_hud_panel != '\0') && (*(short *)(DAT_00085a6c + 8) != 4)) {
    return;
  }
  reload_paperdoll_body_sprite();
  redraw_armor_overlay_widgets();
  redraw_container_icon_slot();
  return;
}


// was FUN_00044814 -- clears the player's rune-bag bitset (the 8-byte
// field at DAT_00086df8+0x44, the same bits place_rune_in_bag sets),
// emptying the bag of every rune.
void clear_rune_bag_contents()

{
  int iVar1;

  iVar1 = 0;
  do {
    *(undefined1 *)(iVar1 + DAT_00086df8 + 0x44) = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 8);
  return;
}



// was FUN_00044848 -- draws a single rune's icon (param_1, a rune
// index 0-0x17) at its grid position in the rune-bag panel.
void draw_rune_icon(param_1)
uint param_1;

{
  int iVar1;
  int iVar2;

  decrement_cursor_hide_depth();
  iVar1 = ((int)(short)param_1 >> 2) * 0xf;
  iVar2 = (param_1 & 3) * 0x12;
  draw_sprite_by_id(param_1 + 0xe8,iVar2 + 0xf4,iVar1 + 0xd,iVar2 + 0x101,(short)iVar1 + 4);
  cursor_show_idle_tick();
  return;
}



// was FUN_000448a8 -- the rune-bag panel's redraw callback (used
// alongside refresh_equipment_display_if_visible/draw_stats_panel_content
// in the stats-panel redraw dispatch table): draws every rune
// currently set in the bag's bitset via draw_rune_icon.
void redraw_rune_bag_display()

{
  uint uVar1;

  decrement_cursor_hide_depth();
  uVar1 = 0;
  do {
    if ((*(byte *)(DAT_00086df8 + ((int)uVar1 >> 3) + 0x44) >> (7 - (uVar1 & 7) & 0xff) & 1) != 0) {
      g_blit_transparent_mode = 1;
      draw_rune_icon(uVar1);
      g_blit_transparent_mode = 0;
    }
    uVar1 = (int)((uVar1 + 1) * 0x10000) >> 0x10;
  } while ((int)uVar1 < 0x18);
  cursor_show_idle_tick();
  return;
}



// was FUN_00044920 -- clears the player's 3 "readied rune" slots
// (DAT_00086df8+0x47/+0x48/+0x49, 0x18 = "empty") and a matching flag
// field, then refreshes their icons via update_ready_rune_slot_icons.
void reset_ready_rune_slots()

{
  uint uVar1;

  *(undefined1 *)(DAT_00086df8 + 0x47) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x48) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x49) = 0x18;
  uVar1 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xf3ff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar1 >> 8);
  update_ready_rune_slot_icons(DAT_00086df8 + 0x47);
  return;
}


// was FUN_0004497c -- the rune-bag panel's click handler (dispatched
// from inventory_panel_click_region's g_active_hud_panel==1 case,
// src/inventory.c:81): maps the click position to a rune-grid cell,
// and if that rune is present in the bag, either readies it into the
// next "readied rune" slot (normal click) or dispatches a "look at
// this rune" action (the psVar3[3]&2 modifier branch), via
// dispatch_object_action_dup on a synthetic rune object.
void handle_rune_bag_click()

{
  ushort uVar1;
  byte bVar2;
  short *psVar3;
  short sVar4;
  short sVar5;
  int iVar6;
  /* Was two separately-declared locals, `ushort local_20[3]` immediately
     followed by `undefined2 local_1a` -- Ghidra's own offset naming
     (-0x20, then -0x1a, exactly 6 bytes later) confirms the real ARM
     stack frame packs them contiguously, and the real code below relies
     on that: dispatch_object_action_dup reads its param_1[3] (the
     synthetic "look" object's owner field) as the 4th ushort of what
     it's handed, but only 3 are ever declared, and local_1a (explicitly
     zeroed, the very next line) is what's meant to BE that 4th slot.
     C gives no such adjacency guarantee on this host -- confirmed live:
     local_20[3] read real stack garbage that happened to decode to a
     "headless" creature's owner-name index, so right-clicking a rune in
     this alphabet grid printed "belonging to a headless" instead of
     just the rune's name. Backing array + #define, same pattern used
     throughout this file for exactly this class of bug. */
  undefined1 local_20_backing[8];
#define local_20 ((ushort *)(local_20_backing + 0))
#define local_1a (*(undefined2 *)(local_20_backing + 6))

  psVar3 = DAT_00085a6c;
  if (g_cursor_holding_state == 0) {
    if (DAT_00085a6c[1] < 0x12) {
      reset_ready_rune_slots();
    }
    else {
      sVar4 = ordint_divmod(0xf,DAT_00085a6c[1] + -0x12).quot;
      sVar5 = ordint_divmod(0x12,*psVar3 + -3).quot;
      iVar6 = (5 - sVar4) * 4 + (int)sVar5;
      if ((*(byte *)(DAT_00086df8 + (iVar6 * 0x10000 >> 0x13) + 0x44) >>
           (7 - (iVar6 * 0x10000 >> 0x10 & 7U) & 0xff) & 1) != 0) {
        if ((psVar3[3] & 2U) == 0) {
          if (DAT_002028d0 != 0) {
            reset_ready_rune_slots();
          }
          DAT_002028d0 = 0;
          if ((*(byte *)(DAT_00086df8 + 0x60) & 0xc) == 0xc) {
            *(undefined1 *)(DAT_00086df8 + 0x47) = *(undefined1 *)(DAT_00086df8 + 0x48);
            *(undefined1 *)(DAT_00086df8 + 0x48) = *(undefined1 *)(DAT_00086df8 + 0x49);
            uVar1 = *(ushort *)(DAT_00086df8 + 0x5f);
            bVar2 = (byte)(uVar1 >> 8);
            *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
            *(byte *)(DAT_00086df8 + 0x60) =
                 ((byte)((uVar1 & 0xfc00) - 1 >> 8) ^ bVar2) & 0xc ^ bVar2;
          }
          *(char *)((*(byte *)(DAT_00086df8 + 0x60) >> 2 & 3) + DAT_00086df8 + 0x47) = (char)iVar6;
          uVar1 = *(ushort *)(DAT_00086df8 + 0x5f);
          bVar2 = (byte)(uVar1 >> 8);
          *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
          *(byte *)(DAT_00086df8 + 0x60) =
               ((byte)((uVar1 & 0xfc00) + 0x400 >> 8) ^ bVar2) & 0xc ^ bVar2;
          update_ready_rune_slot_icons(DAT_00086df8 + 0x47);
        }
        else {
          local_20[0] = ((short)iVar6 + 0xe8U ^ local_20[0]) & 0x1ff ^ local_20[0];
          local_1a = 0;
          dispatch_object_action_dup(local_20,0);
        }
      }
    }
    wait_for_click_release(1);
  }
  return;
}
#undef local_20
#undef local_1a



// was FUN_00044bcc -- prints the "Not a spell" scroll message.
void print_not_a_spell_message()

{
  message_scroll_print_wrapped(s_Not_a_spell_00085a80);
  return;
}


// was FUN_00044bd8 -- light-source icon click handler on the stats
// panel: a normal click cycles the active light source
// (cycle_active_light_source, not yet named) and refreshes equipment effects on a
// change; the DAT_00085a6c[3]&2 "look" modifier instead prints the
// light source's name followed by a fuel-remaining description
// (print_scroll_message_by_id, ranges by remaining-fuel byte
// thresholds 3/10).
void handle_light_source_click()

{
  byte bVar1;
  int iVar2;
  short local_10;
  byte abStack_e [6];

  if ((g_cursor_holding_state < 1) || (3 < g_cursor_holding_state)) {
    iVar2 = 2 - ((int)*DAT_00085a6c >> 4);
    local_10 = (short)iVar2;
    if (iVar2 * 0x10000 >> 0x10 < (int)(*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf)) {
      if ((DAT_00085a6c[3] & 2U) == 0) {
        iVar2 = cycle_active_light_source(&local_10);
        if (iVar2 != 0) {
          refresh_player_equipment_effects();
        }
      }
      else {
        compute_light_source_colors(abStack_e);
        get_message_string(abStack_e[local_10] + 0x180 | 0xc00);
        message_scroll_print_wrapped();
        bVar1 = *(byte *)(DAT_00086df8 + local_10 * 2 + 0x3f);
        if (bVar1 < 3) {
          iVar2 = 0;
        }
        else {
          iVar2 = 1;
          if (10 < bVar1) {
            iVar2 = 2;
          }
        }
        print_scroll_message_by_id(iVar2 + 0x89);
      }
      wait_for_click_release(1);
    }
  }
  return;
}



// was FUN_00044d14 -- the "cast spell" button click handler
// (registered in register_stats_panel_click_regions at (0xb0,0x9b),
// also bound as a key binding in run_game_startup_sequence): checks
// the player has enough mana for the readied rune combo's cost
// (DAT_002028d4+DAT_002028d8), plays a fizzle sound if not, otherwise
// looks the combo up in the 0x30-entry spell table (&DAT_00087531)
// and either reports "not a spell" (print_not_a_spell_message) or
// attempts the cast via cast_spell_from_rune_combo.
void handle_cast_spell_click(param_1)
short param_1;

{
  int iVar1;

  if (g_cursor_holding_state == 0) {
    if (((*(ushort *)((byte *)DAT_00085a6c + 6) & 2) == 0) || (param_1 != 0)) {
      DAT_002028d0 = 1;
      if (*(uint *)(DAT_00086df8 + 0xce) < (uint)DAT_002028d4 + DAT_002028d8) {
        play_sound_effect_with_pan(0x15,0x40,0);
      }
      else {
        wait_for_click_release(1);
        iVar1 = 0;
        do {
          if ((ushort)((ushort)*(byte *)(DAT_00086df8 + 0x49) +
                      ((ushort)*(byte *)(DAT_00086df8 + 0x48) +
                      (ushort)*(byte *)(DAT_00086df8 + 0x47) * 0x20) * 0x20) ==
              *(short *)(&DAT_00087531 + iVar1 * 4)) break;
          iVar1 = (iVar1 + 1) * 0x1000000 >> 0x18;
        } while (iVar1 < 0x30);
        if ((char)iVar1 == '0') {
          print_not_a_spell_message();
        }
        else {
          /* ARM 0x44e6c passes the matched table index in r0. */
          cast_spell_from_rune_combo(iVar1);
        }
      }
    }
    else {
      wait_for_click_release(1);
    }
  }
  return;
}



// was FUN_00044e74 -- shared spell-cast-failure reporter: plays the
// fizzle sound and prints the failure-reason scroll message (param_1,
// a reason code 0-3) from cast_spell_from_rune_combo. Always returns 0.
undefined4 report_spell_cast_failure(param_1)
int param_1;

{
  play_sound_effect_with_pan(0x16,0x40,0);
  print_scroll_message_by_id(param_1 + 0xd2);
  return 0;
}



// WARNING: Removing unreachable block (ram,0x00044ee8)

// was FUN_00044e9c -- resolves and attempts to cast the spell matched
// by handle_cast_spell_click's rune-combo lookup: checks caster-level
// requirement, mana cost, rolls a casting skill check, and on success
// dispatches the actual spell effect via dispatch_special_action,
// playing the cast sound. Reports failure (insufficient level/mana/
// skill-check, or a failed dispatch) through report_spell_cast_failure.
undefined4 cast_spell_from_rune_combo(param_1)
uint param_1;

{
  byte bVar1;
  char cVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  byte bVar6;
  byte bVar7;
  
  cVar2 = ordint_divmod(6,param_1 & 0xff).quot;
  bVar6 = cVar2 + 1;
  iVar5 = (param_1 & 0xff) * 4;
  bVar7 = (byte)(&DAT_00087530)[iVar5] >> 3;
  if ((uint)((int)(*(byte *)(DAT_00086df8 + 0x3d) + 1) >> 1) < (uint)bVar6) {
    uVar4 = 0;
  }
  else if ((uint)*(byte *)(DAT_00086df8 + 0x37) < (uint)bVar6 * 3) {
    uVar4 = 1;
  }
  else {
    sVar3 = roll_skill_check(*(byte *)(DAT_00086df8 + 0x2a) + 5,(uint)bVar6 << 1);
    if (sVar3 == 0) {
      uVar4 = 2;
    }
    else {
      if (sVar3 == -1) {
        print_scroll_message_by_id(0xd6);
        bVar7 = 9;
        bVar1 = bVar6 >> 1;
      }
      else {
        bVar1 = (&DAT_00087533)[iVar5];
      }
      DAT_002028d4 = (cVar2 + '\t') * '\b' + *(char *)(DAT_00086df8 + 0x3d) * -4;
      DAT_002028d8 = *(undefined4 *)(DAT_00086df8 + 0xce);
      DAT_0023c3e0 = bVar6 * '\x03';
      if (bVar7 != 5) {
        *(byte *)(DAT_00086df8 + 0x37) = *(char *)(DAT_00086df8 + 0x37) + bVar6 * -3;
        DAT_0023c3e0 = '\0';
      }
      iVar5 = dispatch_special_action(bVar7,bVar1,g_player_object,g_player_object);
      if (iVar5 != 0) {
        play_sound_effect_with_pan(0x10,0x40,0);
        return 1;
      }
      DAT_0023c3e0 = 0;
      uVar4 = 3;
    }
  }
  uVar4 = report_spell_cast_failure(uVar4);
  return uVar4;
}


// was FUN_0004638c -- reloads the player's paperdoll body sprite
// (BODIES.GR, the frame selected by gender/race bits at
// DAT_00086df8+100) via reload_single_grtile_entry, then clears 5
// bytes of the cached equipment-icon slot array (DAT_00202988+1..+5).
// Called whenever the player's appearance or equipped-item display
// needs a full refresh (equipment changes, panel reloads, resting).
// WARNING: Removing unreachable block (ram,0x000463bc)

void reload_paperdoll_body_sprite()

{
  int iVar1;

  reload_single_grtile_entry(0x2091,s_bodies_00085c58,
               (*(byte *)(DAT_00086df8 + 100) >> 2 & 7) +
               (int)(short)((int)((*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * 10) >> 1));
  iVar1 = 1;
  do {
    *(undefined1 *)((char *)&DAT_00202988 + iVar1) = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 6);
  return;
}


// was FUN_00046414 -- one-time inventory-panel setup (guarded by
// DAT_002029a4), called from enter_dungeon_view_hud_init alongside
// register_stats_panel_click_regions: reloads the paperdoll body
// sprite, allocates a grtile per inventory hotspot region (paperdoll
// slots, flask/compass icons) and captures the framebuffer into them
// as the initial "undecorated" backdrop for dirty-rect restoration,
// then registers the inventory panel's click region.
void init_inventory_panel_hotspots()

{
  undefined4 uVar1;
  undefined1 *puVar2;
  int iVar3;
  uint uVar4;
  int iVar5;

  if (DAT_002029a4 == 0) {
    DAT_002029a4 = 1;
    g_blit_transparent_mode = 1;
    reload_paperdoll_body_sprite();
    iVar5 = 6;
    do {
      uVar1 = grtile_alloc_registered((&g_inv_hotspot_dirty_w)[iVar5 * 0xe],
                           (uint)(byte)(&g_inv_hotspot_dirty_h)[iVar5 * 0xe] << 1);
      (&DAT_002028e8)[iVar5] = uVar1;
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 0x17);
    DAT_002028e8 = grtile_alloc_registered(0x10,0x14);
    DAT_002028ec = grtile_alloc_registered(0x54,0x52);
    iVar5 = 6;
    do {
      /* iVar5==10/11 were hardcoded original-binary literal addresses
         (0x85b5c/0x85b6a, plus the standalone DAT_00085b64/DAT_00085b72
         symbols) instead of the same &g_inv_hotspot_click_x1/&g_inv_hotspot_draw_x +
         iVar5*stride expression every other iteration already uses --
         same "hardcoded address" bug class as probe_save_slots's -0x87020.
         Confirmed identical by address arithmetic (0x85ad0 + 10*0xe =
         0x85b5c, 0x85ad8 + 10*7 shorts = 0x85b64, etc.); rewritten to the
         general form so these two icons resolve against our recompiled
         symbols instead of the original binary's fixed layout. The
         +5/-5 adjustments are the only real difference from the general
         case and are kept as-is. */
      if (iVar5 == 10) {
        puVar2 = &g_inv_hotspot_click_x1 + iVar5 * 0xe;
        iVar3 = (&g_inv_hotspot_draw_x)[iVar5 * 7] + 5;
LAB_000464c8:
        uVar4 = (byte)puVar2[0xc] - 5;
      }
      else {
        if (iVar5 == 0xb) {
          puVar2 = &g_inv_hotspot_click_x1 + iVar5 * 0xe;
          iVar3 = (&g_inv_hotspot_draw_x)[iVar5 * 7];
          goto LAB_000464c8;
        }
        puVar2 = &g_inv_hotspot_click_x1 + iVar5 * 0xe;
        iVar3 = (int)(short)(&g_inv_hotspot_draw_x)[iVar5 * 7];
        uVar4 = (uint)(byte)(&g_inv_hotspot_dirty_w)[iVar5 * 0xe];
      }
      capture_framebuffer_rect_to_grtile((&DAT_002028e8)[iVar5],iVar3,(int)*(short *)(puVar2 + 10),uVar4,puVar2[0xd]);
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 0x17);
    capture_framebuffer_rect_to_grtile(DAT_002028ec,0xec,0x51,0x54,0x29);
    capture_framebuffer_rect_to_grtile(DAT_002028e8,299,0x3b,0x10,10);
    DAT_00202998 = register_click_region(0xf0,0x76,0x13b,0xb,0,5,inventory_panel_click_region);
  }
  return;
}


// was FUN_00048110 -- redraws the bag/container icon slot on the
// compass-view HUD: restores its plain backdrop when no container is
// open, or draws the "open container" icon sprite when one is, then
// refreshes the equipment widget range. Resets the carry-weight
// display sentinel (DAT_00085c50) so update_carry_weight_display
// redraws fresh next tick.
void redraw_container_icon_slot()

{
  if (g_active_hud_panel == '\0') {
    DAT_00085c50 = 0xffff;
    if (g_current_container_record == 0) {
      restore_captured_grtile_backdrop(DAT_002028ec);
    }
    else {
      draw_sprite_by_id(0x2097,0xec,0x51,0x29,0x54);
    }
    redraw_inventory_widget_range(6,0x16);
  }
  return;
}



// was FUN_00048514 -- the HUD carry-weight/encumbrance display: only
// redraws when the weight-capacity-remaining value actually changed
// since last tick (tracked via DAT_00085c50), restoring the flask-slot
// backdrop and drawing the remaining-capacity percentage as text.
bool update_carry_weight_display(param_1)
int param_1;

{
  int iVar1;
  short sVar2;
  undefined4 uVar3;
  int iVar4;
  bool bVar5;
  undefined1 auStack_24 [8];
  
  bVar5 = false;
  iVar4 = ((int)g_player_max_carry_weight - (int)g_player_carry_weight) * 0x10000;
  iVar1 = iVar4 >> 0x10;
  if (DAT_00085c50 != iVar1) {
    restore_captured_grtile_backdrop(DAT_002028e8);
    DAT_00085c50 = (short)((uint)iVar4 >> 0x10);
    bVar5 = param_1 != 0;
    *g_draw_color_index = 0xe0;
    uVar3 = ordint_divmod(10,iVar1).quot;
    itoa_radix(uVar3,auStack_24,10);
    sVar2 = measure_text_width(auStack_24);
    iVar4 = (int)sVar2;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 1;
    }
    draw_text_string(auStack_24,0x131 - (short)(iVar4 >> 1),0x3c);
  }
  return bVar5;
}


// was FUN_0004995c -- per release_panel_wipe_grtiles's own comment,
// releases a grtile handle; this decompile's body is an empty no-op
// (lost-body case, not confirmed to genuinely do nothing in the real
// binary).
void release_grtile_handle()

{
  return;
}


// was FUN_000564f8 -- the pause-menu's modal event loop: on a fresh
// open (param_1 != 0) clears/redraws the panel and waits for click
// release; then loops reading input events, dispatching clicks within
// the button region to redraw_pause_submenu_icon's sibling
// handle_pause_menu_region_click, Escape to close_ui_panel_return_to_game, and a
// handful of other codes to handle_pause_menu_dpad_navigation (not yet named) with a
// result code (0/1/2), until DAT_002046f8 (set by
// close_ui_panel_return_to_game) signals the panel closed. Confirmed
// as the pause menu by hud.c's callers and the GXGetDefaultKeys
// "start button" comment just below.
void run_pause_menu_modal_loop(param_1)
short param_1;

{
  short sVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  short local_c;
  short local_a;

  /* This loop waits inside an input handler; show its redraws immediately
     instead of deferring them until the surrounding gameplay tick ends. */
  uw_begin_modal_present();
  DAT_000868d8 = 1;
  if (param_1 != 0) {
    decrement_cursor_hide_depth();
    enter_pause_menu_state(6);
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
          get_mouse_position(&local_c,&local_a);
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
                 idiom as elsewhere in this file) -- handle_pause_menu_region_click only
                 actually uses its 2nd (Y) argument, but the sibling call
                 site in cursor_mode_button_click passes (x,y) in this
                 order, so match it here with the just-computed
                 region-relative click position. */
              handle_pause_menu_region_click(local_c, local_a);
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
      handle_pause_menu_dpad_navigation(uVar2);
    }
LAB_000565a8:
    if (DAT_002046f8 != 0) {
      uw_end_modal_present();
      return;
    }
  } while( true );
}



// was FUN_00056640 -- redraws the pause-menu's main icon slot
// (OPTBTNS.GR tile 0x20eb) showing sub-panel/highlight variant
// param_1. Confirmed called with distinct variant indices (1,2,3,4,5)
// from each sub-panel setup function and saveload.c's save/load panel.
void redraw_pause_menu_icon(param_1)
undefined4 param_1;

{
  reload_single_grtile_entry(0x20eb,s_optbtns_00086954,param_1);
  draw_sprite_by_id(0x20eb,4,0xb,0x6c,0x23);
  return;
}



// was FUN_00056688 -- redraws one row of the pause-menu's sub-icon
// strip (OPTBTNS.GR tile 0x20ec) at a position derived from row index
// param_1, showing highlight/content variant param_2.
void redraw_pause_submenu_icon(param_1,param_2)
int param_1;
undefined4 param_2;

{
  reload_single_grtile_entry(0x20ec,s_optbtns_00086954,param_2);
  draw_sprite_by_id(0x20ec,5,param_1 * -0xf + 0x67,0xe,0x1f);
  return;
}



// was FUN_000566dc -- moves the pause-menu's sub-icon highlight: un-
// highlights the previously-highlighted row (tracked in
// DAT_002046f0/DAT_002046f4) via redraw_pause_submenu_icon, then
// highlights row param_1 with content param_2, recording the new
// state.
void update_pause_submenu_highlight(param_1,param_2)
undefined4 param_1;
int param_2;

{
  if (-1 < DAT_002046f0) {
    redraw_pause_submenu_icon((int)DAT_002046f4,DAT_002046f0 + -1);
  }
  redraw_pause_submenu_icon(param_1,param_2 + 1);
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
  decrement_cursor_hide_depth();
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


int DAT_002046fc;
/* Were lone `undefined *` -- the real thing is a pair of function-pointer
   dispatch tables for the in-game pause menu, indexed by menu "state"
   (DAT_000868dc, 0..6): PTR_FUN_000868e0 is the no-arg "draw this state's
   screen" table (enter_pause_menu_state calls table[state]()); PTR_FUN_00086900 is
   the "handle a click/button-index within this state" table (dispatch_pause_menu_click
   calls table[state](clicked_index)). Link-time-init data the decompile
   never populated -> clicking the top-left panel's "menu" button (which
   calls run_pause_menu_modal_loop -> enter_pause_menu_state(6), the top-level list) jumped
   through a null pointer.

   Entries 0-3 and 6 were correctly reconstructed by an earlier session
   via call-shape analysis (cross-referencing handle_pause_menu_main_list_click's state-
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
   (draw_detail_level_panel, detail level) and index 5's is 0x56838 (draw_quit_confirm_panel,
   quit confirm) in the draw table -- the reverse of what was guessed --
   and correspondingly 0x56a70 (handle_detail_level_click, detail level click) / 0x56c88
   (handle_quit_confirm_click, quit click) in the click table. Swapped both tables'
   4/5 entries to match:
     0  load-game slot list  (draw_save_load_slot_list draw, shared w/ save;
                              handle_save_load_slot_click click, DAT_000868dc==1 gates
                              the save-only "extra slot" bits)
     1  save-game slot list  (same pair as 0)
     2  music on/off toggle  (draw_music_or_sound_toggle_panel draw / handle_music_toggle_click click)
     3  sound on/off toggle  (draw_music_or_sound_toggle_panel draw / handle_sound_toggle_click click)
     4  texture detail level (draw_detail_level_panel draw / handle_detail_level_click click)
     5  quit-game confirm    (draw_quit_confirm_panel draw / handle_quit_confirm_click click)
     6  top-level menu list  (draw_pause_menu_main_list draw / handle_pause_menu_main_list_click click)
   Index 7 is never dispatched (DAT_000868dc==7 is close_ui_panel_return_to_game's
   "menu closing" sentinel, checked directly rather than redrawn) but
   both tables are sized 8 with a null-safe entry there for defense.
   CORRECTED (this pass): entries 2/3's prose labels above were swapped
   ("2 sound"/"3 music") even though the entries 0-3/6 note just above
   says those four were only inferred by call-shape analysis, not
   ground-truth-dump-verified like 4/5 -- directly tracing
   draw_music_or_sound_toggle_panel's own `DAT_000868dc == 2` branch (shows
   is_music_playing when true) and handle_music_toggle_click's own body
   (calls set_music_enabled, registered at index 2) confirms 2=music,
   3=sound as written now. The function POINTERS at each index were
   never changed by this correction, only these prose labels.
   ALSO CORRECTED (this pass): entry 4 was previously named/labeled as
   "brightness" -- draw_detail_level_panel/handle_detail_level_click's
   own comments explain why this is actually a texture detail-level
   setting (confirmed by configure_texture_detail_functions reading
   the exact same DAT_00086df8+0xb5 nibble to choose flat vs. textured
   floor rendering), not screen brightness/gamma. */
extern void draw_pause_menu_main_list(void);
extern void draw_save_load_slot_list(void);
extern void draw_quit_confirm_panel(void);
extern void draw_music_or_sound_toggle_panel(void);
extern void draw_detail_level_panel(void);
extern void handle_save_load_slot_click(int);
extern void handle_music_toggle_click(int);
extern void handle_sound_toggle_click(int);
extern void handle_quit_confirm_click(int);
extern void handle_detail_level_click(int);
extern void handle_pause_menu_main_list_click(int);
/* CORRECTED: a prior pass's inline comments here had states 2/3 swapped
   -- confirmed by directly tracing draw_music_or_sound_toggle_panel's own
   `DAT_000868dc == 2` branch (shows is_music_playing when true) and by
   handle_music_toggle_click (registered at index 2) calling
   set_music_enabled, vs. handle_sound_toggle_click (index 3) calling
   set_sound_effects_enabled. */
static void (*const PTR_FUN_000868e0_table[8])(void) = {
  draw_save_load_slot_list,  /* 0: load slot list */
  draw_save_load_slot_list,  /* 1: save slot list */
  draw_music_or_sound_toggle_panel,  /* 2: music toggle   */
  draw_music_or_sound_toggle_panel,  /* 3: sound toggle   */
  draw_detail_level_panel,  /* 4: texture detail level */
  draw_quit_confirm_panel,  /* 5: quit confirm   */
  draw_pause_menu_main_list,  /* 6: top-level list */
  0,
};
#define PTR_FUN_000868e0 (PTR_FUN_000868e0_table[0])
static void (*const PTR_FUN_00086900_table[8])(int) = {
  handle_save_load_slot_click,  /* 0: load slot list */
  handle_save_load_slot_click,  /* 1: save slot list */
  handle_music_toggle_click,  /* 2: music toggle   */
  handle_sound_toggle_click,  /* 3: sound toggle   */
  handle_detail_level_click,  /* 4: texture detail level */
  handle_quit_confirm_click,  /* 5: quit confirm   */
  handle_pause_menu_main_list_click,  /* 6: top-level list */
  0,
};
#define PTR_FUN_00086900 (PTR_FUN_00086900_table[0])


// was FUN_000567c0 -- draws the pause menu's top-level list (state 6
// in PTR_FUN_000868e0_table): the main icon plus the first
// highlighted list row.
void draw_pause_menu_main_list()

{
  redraw_pause_menu_icon(1);
  DAT_002046f0 = 0xffff;
  update_pause_submenu_highlight(6,6);
  return;
}



// was FUN_00056838 -- draws the "quit confirm" panel (state 5).
void draw_quit_confirm_panel()

{
  redraw_pause_menu_icon(3);
  DAT_002046f0 = 0xffff;
  update_pause_submenu_highlight(3,0x3b);
  return;
}



// was FUN_00056864 -- draws the shared music/sound toggle panel
// (states 2 and 3): shows the music on/off label and state when
// DAT_000868dc==2, else the sound-effects on/off label and state.
// Confirmed by its registration at both table indices, and by the
// matching click handlers (handle_music_toggle_click at index 2
// calling set_music_enabled, handle_sound_toggle_click at index 3
// calling set_sound_effects_enabled) -- this corrects a prior pass's
// swapped index comments on the dispatch tables themselves.
void draw_music_or_sound_toggle_panel()

{
  short sVar1;
  int iVar2;
  char cVar3;
  undefined4 uVar4;
  
  redraw_pause_menu_icon(4);
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
  redraw_pause_submenu_icon(6,cVar3);
  redraw_pause_submenu_icon(5,uVar4);
  sVar1 = 2;
  if (iVar2 * 0x10000 >> 0x10 != 3) {
    sVar1 = 0;
  }
  update_pause_submenu_highlight(iVar2,sVar1 + 0x14);
  return;
}



// was FUN_0005693c -- draws the texture detail-level panel (state
// 4): reads the current level from the high nibble of
// DAT_00086df8+0xb5 and draws the slider sprite at a position
// derived from it. CORRECTED (this pass, from an earlier "brightness/
// gamma" guess): directly confirmed as a detail-level setting by
// configure_texture_detail_functions, which reads the exact same
// field/nibble to choose between a flat-shaded or fully-textured
// floor emitter -- a classic performance "detail: low/high" option,
// not screen brightness.
void draw_detail_level_panel()

{
  uint uVar1;

  uVar1 = (uint)(*(byte *)(DAT_00086df8 + 0xb5) >> 4);
  DAT_002046f0 = 0xffff;
  redraw_pause_menu_icon(5);
  reload_single_grtile_entry(0x20ed,s_optbtns_00086954,uVar1 + 0x35);
  draw_sprite_by_id(0x20ed,5,10,0x12,0x22);
  update_pause_submenu_highlight(4 - uVar1,(uVar1 + 0x13) * 2);
  return;
}



// was FUN_000569c0 -- click handler for the music-toggle panel
// (state 2): toggles music on/off and redraws the panel.
void handle_music_toggle_click(param_1)
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
  draw_music_or_sound_toggle_panel();
LAB_000569ec:
  if (DAT_002046fc == 0) {
    if (param_1 == 2) {
      enter_pause_menu_state(6);
    }
  }
  else {
    close_ui_panel_return_to_game();
  }
  return;
}



// was FUN_00056a18 -- click handler for the sound-toggle panel
// (state 3): toggles sound effects on/off and redraws the panel.
void handle_sound_toggle_click(param_1)
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
  draw_music_or_sound_toggle_panel();
LAB_00056a44:
  if (DAT_002046fc == 0) {
    if (param_1 == 2) {
      enter_pause_menu_state(6);
    }
  }
  else {
    close_ui_panel_return_to_game();
  }
  return;
}



// was FUN_00056a70 -- click handler for the texture detail-level
// panel (state 4): adjusts the detail level in DAT_00086df8+0xb5's
// high nibble by the clicked delta, reconfigures the texture-emit
// function pointers via configure_texture_detail_functions (called
// directly right here -- the clearest possible confirmation this is
// a detail setting, not brightness/gamma; see
// draw_detail_level_panel's correction comment), forces a full
// redraw, and refreshes the slider.
void handle_detail_level_click(param_1)
int param_1;

{
  short sVar1;
  
  sVar1 = (short)param_1;
  if ((0 < sVar1) && (sVar1 < 5)) {
    param_1 = -param_1;
    *(byte *)(DAT_00086df8 + 0xb5) =
         (byte)(((param_1 + 4) * 0x10000 >> 0x10 & 0xfU) << 4) |
         *(byte *)(DAT_00086df8 + 0xb5) & 0xf;
    configure_texture_detail_functions();
    full_dungeon_redraw();
    weapon_overlay_and_full_redraw();
    reload_single_grtile_entry(0x20ed,s_optbtns_00086954,param_1 + 0x39);
    draw_sprite_by_id(0x20ed,5,10,0x12,0x22);
    update_pause_submenu_highlight(4 - (param_1 + 4),(param_1 + 0x17) * 2);
  }
  if (sVar1 == 0) {
    if (DAT_002046fc == 0) {
      enter_pause_menu_state(6);
    }
    else {
      close_ui_panel_return_to_game();
    }
  }
  return;
}



// was FUN_00056b48 -- click handler for the top-level list (state 6):
// maps the clicked row to the target pause-menu state (0=save,
// 1=load, 2-5 the toggle/brightness/quit panels) and enters it,
// gating save/load entry on check_can_save_game/check_can_load_game.
// Row 1 (Resume) closes the panel directly instead.
void handle_pause_menu_main_list_click(param_1)
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
  enter_pause_menu_state(uVar2);
  return;
}



// was FUN_00056bdc -- click handler shared by the load (state 0) and
// save (state 1) slot lists: highlights the clicked slot and
// dispatches to handle_save_load_menu_action, closing the panel
// afterward.
void handle_save_load_slot_click(param_1)
int param_1;

{
  short sVar1;
  int iVar2;
  
  sVar1 = (short)param_1;
  iVar2 = 4;
  if ((0 < sVar1) && (sVar1 < 6)) {
    update_pause_submenu_highlight(param_1,(0x14 - param_1) * 2);
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



// was FUN_00056c88 -- click handler for the quit-confirm panel
// (state 5): row 4 confirms (requests game exit), any other closes
// the panel without action.
void handle_quit_confirm_click(param_1)
short param_1;

{
  if (param_1 != 3) {
    if (param_1 != 4) {
      return;
    }
    update_pause_submenu_highlight(4,0x39);
    cursor_show_idle_tick();
    request_game_exit(0);
    decrement_cursor_hide_depth();
  }
  close_ui_panel_return_to_game();
  return;
}



// was FUN_00056cc8 -- enters pause-menu state param_1: sets
// DAT_000868dc and invokes that state's draw callback from
// PTR_FUN_000868e0_table.
void enter_pause_menu_state(param_1)
short param_1;

{
  DAT_000868dc = param_1;
  if (getenv("UW_DEBUG_PAUSEMENU"))
    fprintf(stderr, "[pausemenu] enter_pause_menu_state: entering state=%d\n", (int)param_1);
  if ((uint)param_1 < 8 && PTR_FUN_000868e0_table[param_1] != 0) {
    PTR_FUN_000868e0_table[param_1]();
  }
  return;
}



// was FUN_00056cf8 -- dispatches a click (param_1, a row/item index)
// to the current pause-menu state's click handler in
// PTR_FUN_00086900_table.
void dispatch_pause_menu_click(param_1)
undefined4 param_1;

{
  decrement_cursor_hide_depth();
  if (getenv("UW_DEBUG_PAUSEMENU"))
    fprintf(stderr, "[pausemenu] dispatch_pause_menu_click: state=%d clicked_index=%d\n",
            (int)DAT_000868dc, (int)param_1);
  if ((uint)DAT_000868dc < 8 && PTR_FUN_00086900_table[DAT_000868dc] != 0) {
    PTR_FUN_00086900_table[DAT_000868dc](param_1);
  }
  cursor_show_idle_tick();
  wait_for_click_release(0);
  return;
}



// was FUN_00056d38 -- converts a raw click Y offset (param_2) within
// the pause-menu's button region into a row index (one of 16 rows,
// param_2/15) and dispatches it via dispatch_pause_menu_click.
void handle_pause_menu_region_click(param_1,param_2)
undefined4 param_1;
short param_2;

{
  short sVar1;

  sVar1 = ordint_divmod(0xf,(int)param_2).quot;
  dispatch_pause_menu_click((int)sVar1);
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
   GXGetDefaultKeys() "start button" code (0x93) reach run_pause_menu_modal_loop's own
   event loop cleanly for the first time -- that's what calls handle_pause_menu_dpad_navigation
   with a real highlighted-item index. Real bytes recovered via a Ghidra
   headless memory dump of the original binary at 0x86920 (8 rows x 7
   columns, one row per menu state 0-7, one column per D-pad-navigable
   list position 0-6): each nonzero byte is the widget-highlight value
   update_pause_submenu_highlight's own 2nd argument expects for that slot (matches the
   literal values each state's own draw function already passes it,
   e.g. draw_pause_menu_main_list's `update_pause_submenu_highlight(6,6)`). */
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

// was FUN_00056d6c -- D-pad/hotkey navigation for the pause menu:
// param_1 0/2 move the row highlight up/down (consulting
// g_menu_nav_highlight_table for the current state), 1/0x164 select
// the current row, and the remaining magic codes (0x166/0x16d/0x171/
// 0x172/0x173) are direct hotkeys for specific rows -- all funneled
// into dispatch_pause_menu_click. NOTE: open_pause_menu_via_hotkey
// calls this with no argument at all (a possible dropped-argument
// bug of the same shape fixed elsewhere this session, but not
// confirmed/fixed here -- see its own comment).
void handle_pause_menu_dpad_navigation(param_1)
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
        decrement_cursor_hide_depth();
        update_pause_submenu_highlight(iVar3 + sVar1,(int)g_menu_nav_highlight_table[(unsigned)DAT_000868dc & 7][iVar2]);
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
  dispatch_pause_menu_click(iVar2);
  return;
}



// was FUN_00056ebc -- opens the pause menu via a bound hotkey
// (registered in game.c for several key codes): forces state 6 (top-
// level list) and runs the modal loop. NOTE: the
// `handle_pause_menu_dpad_navigation()` call just below passes no
// argument despite that function taking one -- possibly the same
// dropped-argument bug fixed several times elsewhere this session,
// but not confirmed (single call site, and DAT_000868dc is already
// forced to 6 directly above regardless of its effect) -- left
// unfixed pending stronger evidence.
void open_pause_menu_via_hotkey()

{
  if (g_cursor_holding_state == 0) {
    DAT_002046fc = 1;
    DAT_000868dc = 6;
    handle_pause_menu_dpad_navigation();
    run_pause_menu_modal_loop(DAT_000868dc == 6);
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
  set_cursor_sprite_id(0x106c);
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



// was FUN_00056fe8 -- erases the dragged-item cursor icon if one is
// currently drawn (DAT_00204844 != 0): restores the saved background
// pixels under its last-drawn rect and flushes. Returns the PRIOR value
// of DAT_00204844 but deliberately does NOT clear it itself -- every
// caller is responsible for clearing DAT_00204844 off this return value
// (see inventory.c's and item_use.c's own call-site comments for the
// stale-icon-redraw race this convention exists to avoid). Named after
// its own debug env var, UW_DEBUG_CURSORERASE.
int erase_cursor_icon()

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



/* Desktop deviation: opt in to a persistent cursor with
   UW_ALWAYS_SHOW_CURSOR=1. Keep the original touchscreen visibility
   gates by default while the desktop cursor still has known bugs. */
int uw_always_show_cursor(void)
{
  static int cached = -1;
  if (cached < 0) {
    const char *setting = getenv("UW_ALWAYS_SHOW_CURSOR");
    cached = setting != NULL && strcmp(setting, "1") == 0;
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
     set_cursor_sprite_id), and the real binary deliberately suppresses drawing
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




// was FUN_00057118 -- decrements the cursor hide/show nesting depth
// (DAT_00204840, floor-clamped at 0) one level, confirmed by an
// existing comment on clear_screen_and_restore_cursor describing this
// exact role. When the depth reaches 0 (fully visible again) or a
// force flag (DAT_000bbef4) is set, checks erase_cursor_icon (not yet
// named) and, if it signals a redraw is needed, resets DAT_00204844
// and forces the default draw color. Called from nearly every UI
// subsystem in the codebase as the "pop" half of a cursor-hide/show
// nesting pair (cursor_show_idle_tick is the sibling "idle tick"
// operation, though it has its own distinct ratcheting behavior
// rather than a plain increment).
void decrement_cursor_hide_depth()

{
  int iVar1;

  iVar1 = (int)DAT_00204840;
  DAT_00204840 = (short)(iVar1 + -1);
  if ((((iVar1 + -1) * 0x10000 >> 0x10 == 0) || (DAT_000bbef4 != 0)) &&
     (iVar1 = erase_cursor_icon(), iVar1 != 0)) {
    DAT_00204844 = 0;
    set_draw_color(1);
  }
  if (DAT_00204840 < 0) {
    DAT_00204840 = DAT_00204840 + 1;
  }
  return;
}


// was thunk_FUN_00057118 -- a Ghidra-generated "thunk" duplicate of
// decrement_cursor_hide_depth (identical body, a separate call site
// in the original binary decompiled as a second copy rather than a
// jump-thunk). Collapsed to a real call to avoid the duplication.
void decrement_cursor_hide_depth_thunk()

{
  decrement_cursor_hide_depth();
  return;
}


// was FUN_00057188 -- records the currently-tracked UI hotspot's
// rectangle (x,y,width,height) into DAT_0020479c/DAT_002047a0/
// DAT_00204798/DAT_00204790, read by is_mouse_within_tracked_hotspot
// and track_hotspot_hover_state.
void set_tracked_hotspot_rect(param_1,param_2,param_3,param_4)
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



// was FUN_000571c0 -- tests whether the mouse is within the tracked
// hotspot rect (via is_position_within_rect's cursor-margin-aware hit test).
// BUG FIX: was `is_position_within_rect(...); return 0;` -- the call's result
// was computed and discarded, then a hardcoded 0 returned instead,
// the same "Ghidra couldn't trace a return value through the call
// and fabricated a placeholder" bug already fixed once this session
// (get_scanned_object_class_effect_ptr). is_position_within_rect's own return
// type is `undefined4`, not void, and its body is a real 0/1 hit
// test -- confirmed by its only other caller treating a nonzero
// result as "fire the ranged weapon" (weapon_swing.c), a check that
// could never have fired with the old hardcoded 0.
undefined4 is_mouse_within_tracked_hotspot()

{
  undefined4 uVar1;

  uVar1 = is_position_within_rect((int)DAT_0020479c,(int)DAT_002047a0,
               ((int)DAT_00204798 + (int)DAT_0020479c) * 0x10000 >> 0x10,
               ((int)DAT_00204790 + (int)DAT_002047a0) * 0x10000 >> 0x10);
  return uVar1;
}



// was FUN_0005721c -- per-frame hover tracker for the tracked UI
// hotspot: tests the mouse against the rect's outer bounds and its
// (slightly inset) inner bounds to classify the hover state into
// DAT_00204794 (0=outside, 1=on the border, 2=inside the interior),
// redrawing the border highlight on a state change and nudging the
// cursor hide/show depth (DAT_00204840) accordingly.
void track_hotspot_hover_state()

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
          decrement_cursor_hide_depth();
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



// was FUN_00057460 -- after a frame flush, if the hover state
// (DAT_00204794) is "on the border" and not in a specific display
// mode, forces an idle cursor tick (cursor_show_idle_tick) within a
// full-viewport clip rect to refresh the border highlight.
void redraw_hotspot_border_cursor()

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



// was FUN_00057504 -- returns the current raw mouse position.
void get_mouse_position(param_1,param_2)
undefined2 * param_1;
undefined2 * param_2;

{
  *param_1 = g_mouse_x;
  *param_2 = g_mouse_y;
  return;
}



// was FUN_00057528 -- returns the effective position for a click:
// the real mouse position, unless DAT_0020484c (a demo/scripted-
// input override flag) is set, in which case a fixed recorded
// position (DAT_0008696a/DAT_0008696c) is used instead.
void get_click_position(param_1,param_2)
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


// was FUN_00057570 -- clears the pending-keyboard-char sentinel
// (DAT_00086968) back to "none pending" (-1).
void reset_keyboard_char_input()

{
  if (DAT_00086968 != -1) {
    DAT_00086968 = -1;
  }
  return;
}



// was FUN_0005758c -- confirmed genuinely empty (no body beyond
// `return;`). Always called immediately after reset_keyboard_char_input
// (player.c, end of a level-up sequence) -- possibly a vestigial
// hook point or focus-reset stub the original build never filled in.
// Named for its call-site pairing rather than any observed behavior.
void noop_post_input_reset_hook()

{
  return;
}



// was FUN_00057590 -- warps the mouse cursor to (param_1,param_2)
// directly, bracketed by a cursor-hide-depth pop/idle-tick pair.
// Confirmed used by automap.c to snap the cursor onto a map-note
// marker during note text entry.
void warp_mouse_cursor(param_1,param_2)
undefined2 param_1;
undefined2 param_2;

{
  decrement_cursor_hide_depth();
  update_hotspot_cursor_icon();
  g_mouse_x = param_1;
  g_mouse_y = param_2;
  cursor_show_idle_tick();
  return;
}



// was FUN_000575c4 -- polls for a pending keyboard character (via
// poll_mouse_button_flags, not yet named), clearing DAT_00086968's "pending"
// sentinel back to -1 (0xffff) when none is available, and recording
// the result in DAT_00204850. Confirmed as keyboard polling by an
// existing debug comment at its automap.c call site ("key-poll:
// poll_keyboard_char_input returned").
int poll_keyboard_char_input(param_1)
short * param_1;

{
  short sVar1;

  sVar1 = poll_mouse_button_flags();
  *param_1 = sVar1;
  if (sVar1 == 0) {
    DAT_00086968 = 0xffff;
  }
  DAT_00204850 = *param_1;
  return (int)*param_1;
}



// was FUN_000576d0 -- a "press any key or move the mouse" modal wait:
// loops flushing the display and polling input/mouse state
// (optionally ticking sticky-mode handlers when param_1 is set) until
// poll_keyboard_char_input reports a key or the mouse has moved more
// than ~6 pixels (Manhattan distance) from its starting position.
// NOTE: interact.c's call site passes no argument at all despite this
// function taking one parameter, while every other call site passes
// literal 1 -- possibly the same dropped-argument idiom fixed several
// times this session, but not confirmed/fixed here (lower-stakes
// effect than previously confirmed cases: param_1 only gates an
// optional tick during the wait, not a crash-causing path) -- see
// todo.md.
int wait_for_key_or_mouse_move(param_1)
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
  get_mouse_position(&local_16,&local_12);
  while( true ) {
    sVar3 = poll_keyboard_char_input(auStack_10);
    if ((sVar3 == 0) || (iVar4 != 0)) break;
    flush_dirty_rect_to_display(1);
    if (param_1 != 0) {
      dispatch_sticky_mode_handlers();
    }
    poll_input_event(0);
    process_pending_keyboard_scan_code(1);
    noop_key_handler();
    update_mouse_state();
    get_mouse_position(&local_18,&local_14);
    uVar1 = (int)local_18 - (int)local_16 >> 0x1f;
    uVar2 = (int)local_14 - (int)local_12 >> 0x1f;
    if (6 < (int)((((int)local_14 - (int)local_12 ^ uVar2) - uVar2) +
                 (((int)local_18 - (int)local_16 ^ uVar1) - uVar1))) {
      iVar4 = 1;
    }
  }
  return iVar4;
}


// was FUN_00057a80 -- looks up which on-screen-keyboard key was
// touched at (param_1,param_2), confirmed by DAT_00087650's own
// existing comment describing this exact [row+column*20] indexing
// scheme (a real static hit-grid recovered byte-for-byte from UU.exe
// for the chargen name-entry keyboard).
int lookup_onscreen_keyboard_key_hit(param_1,param_2)
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
  iVar1 = ordint_divmod(0x14,param_2 + -200).quot;
  if (0 < iVar1) {
    sVar2 = (short)iVar1 * 0x14 + sVar2;
  }
  return (int)(char)(&DAT_00087650)[sVar2];
}



// was FUN_00057af0 -- registers a cursor hotspot rectangle
// (x1=param_1, y1=param_2, x2=param_3, y2=param_4, tag id=param_5)
// into the 20-slot DAT_002047b0 parallel-array table, returning its
// slot index or -1 if full. Confirmed by input.c registering exactly
// 8 of these for the on-screen keyboard's directional/action regions.
int register_cursor_hotspot(param_1,param_2,param_3,param_4,param_5)
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
    update_hotspot_cursor_icon();
  }
  return iVar2;
}



// was FUN_00057bb0 -- unregisters cursor hotspot slot param_1
// (register_cursor_hotspot's counterpart), clearing its sentinel and
// compacting the active-slot count if it was the last one.
void unregister_cursor_hotspot(param_1)
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
    update_hotspot_cursor_icon();
  }
  return;
}



// was FUN_00057c5c -- pushes cursor sprite param_1 onto a small
// (max 3-deep) cursor-icon stack and makes it active, confirmed by
// its ubiquitous use alongside pop_cursor_icon across nearly every
// UI subsystem to show a context-specific cursor (e.g. a targeting
// reticle) temporarily.
void push_cursor_icon(param_1)
undefined4 param_1;

{
  int iVar1;
  
  if (DAT_00204858 != '\x03') {
    decrement_cursor_hide_depth();
    iVar1 = (int)DAT_00204858;
    DAT_00204858 = DAT_00204858 + '\x01';
    (&DAT_00204714)[iVar1] = DAT_00204704;
    set_cursor_sprite_id(param_1);
    cursor_show_idle_tick();
  }
  return;
}



// was FUN_00057cac -- pops the cursor-icon stack (push_cursor_icon's
// counterpart), restoring the previous sprite (or the default 0x106c
// if the stack is empty). param_1's low bits optionally gate the
// cursor-hide-depth pop/idle-tick pair around the restore.
void pop_cursor_icon(param_1)
ushort param_1;

{
  int iVar1;
  
  if ((param_1 & 1) != 0) {
    decrement_cursor_hide_depth();
  }
  iVar1 = (int)DAT_00204858;
  DAT_00204858 = (char)(iVar1 + -1);
  if ((iVar1 + -1) * 0x1000000 >> 0x18 < 0) {
    DAT_00204714 = 0x106c;
    DAT_00204858 = '\0';
  }
  set_cursor_sprite_id((int)(short)(&DAT_00204714)[DAT_00204858]);
  update_hotspot_cursor_icon();
  if ((param_1 & 2) != 0) {
    cursor_show_idle_tick();
  }
  return;
}



// was FUN_00057d1c -- tests whether the mouse is within rect
// (param_1,param_2)-(param_3,param_4), inset by half the cursor's
// own dimensions on each axis (so the cursor's hotspot, not just its
// top-left corner, must overlap). Confirmed as a generic hit test by
// its two callers: is_mouse_within_tracked_hotspot (the tracked
// hotspot rect) and a hud.c hover check against the active message-
// scroll panel's rect.
undefined4 is_position_within_rect(param_1,param_2,param_3,param_4)
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

// was FUN_00057dc0 -- sets the active cursor sprite to resource id
// param_1, resolving it to its sprite frame/dimensions (lookup_grtile_by_id
// or a direct g_grtile_registry lookup for already-resident high ids).
// Confirmed called by push_cursor_icon/pop_cursor_icon to actually
// apply the cursor change.
void set_cursor_sprite_id(param_1)
undefined4 param_1;

{
  /* Was a genuinely dropped RETURN VALUE, not just a dropped argument:
     resolve_sprite_id_to_frame(param_1) was called and its result thrown
     away, then the lookup just below re-used the raw, UNRESOLVED
     param_1 -- a previous pass here misdiagnosed this as the simpler
     "argument dropped by Ghidra" idiom and patched it by forwarding
     param_1 into lookup_grtile_by_id, which avoids a NULL-deref crash
     but keeps indexing with the wrong id.

     resolve_sprite_id_to_frame exists precisely to translate a symbolic
     UI sprite id into its real absolute g_grtile_registry frame: ids
     below 0x1000 are already absolute OBJECTS.GR frames (resolved ==
     param_1, so this fix is a no-op for those), but every cursor icon
     this project actually pushes -- 0x106c (the default idle cursor),
     0x1077-0x107a (the automap/map-note cursors), etc -- lives in the
     0x1000-0x1fff BUTTONS.GR range, which resolve_sprite_id_to_frame
     remaps to DAT_00202730+(id-0x1000) before any table lookup is
     valid. draw_sprite_by_id (the function that actually PAINTS this
     cursor) does resolve first; this function, which decides the
     cursor's save/erase RECT SIZE for the hide/show cycle, did not --
     so for every one of those ids it looked up g_grtile_registry[raw
     id] (an unrelated, unpopulated slot), silently fell back to the
     zeroed dummy sprite, and set DAT_00204784/DAT_002047a4 (this
     cursor's width/height, consumed by save_cursor_background/
     erase_cursor_icon's own rect math in rect_fill_or_save_restore) to
     0 -- while the real paint elsewhere drew the sprite at its real,
     much larger size through the correctly-resolved frame. A 0-sized
     erase can never remove what a full-sized draw just painted: a
     permanent ghost of that cursor sprite stuck on screen, never
     cleared by any later cursor move. Confirmed live via
     UW_DEBUG_CURSORSHOW/CURSORERASE tracing: entering the automap
     (draw_automap_screen's own idle-cursor draw, sprite 0x106c, fires
     before enter_automap_screen ever pushes the real map cursor) logged
     a 15x16ish real sprite blit immediately followed by an erase
     clipped to rect_fill_or_save_restore(1,0,2,1) -- a 1x1 no-op --
     leaving that default-cursor arrow permanently stamped in the
     automap's top-left corner through every subsequent mouse move
     (bug: "Automap cursor not invalidating, leaves a trail behind").
     Capturing and using the resolved frame here fixes the save/erase
     size for every cursor icon in the 0x1000+ range, not just this one
     screen -- the same shared root cause other cursor-invalidation
     reports on other screens trace back to. */
  char *iVar1;
  uint resolved_frame;

  erase_cursor_icon();
  resolved_frame = resolve_sprite_id_to_frame(param_1);
  /* Was unconditional `iVar1 = lookup_grtile_by_id(param_1);` -- lookup_grtile_by_id
     only covers ids below DAT_00202738 (the "still-compressed .GR
     resource entry, needs decoding" range); ids at or above it are
     already-resident raw sprites living directly in g_grtile_registry's own
     table (see blit_object_sprite_by_frame's own identical branch on
     this same resolved-frame value, which this function now matches). */
  iVar1 = (int)resolved_frame < (int)(uint)DAT_00202738 ?
          lookup_grtile_by_id((short)resolved_frame) : (char *)g_grtile_registry[resolved_frame];
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
    save_cursor_background();
  }
  return;
}


// was FUN_00057e54 -- per-tick cursor-icon refresh for registered
// hotspots: if the mouse has left the cached hotspot's cached bounds,
// re-scans the 20-slot table (register_cursor_hotspot) for the one
// now under the cursor, updates the cache, and applies its icon via
// set_cursor_sprite_id, or resets to the default (0x106c) if none
// match. Confirmed as "the registered-rect click hit-test" by an
// existing ordinal_stubs.c comment.
void update_hotspot_cursor_icon()

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
          set_cursor_sprite_id((int)*(short *)(&DAT_00204720 + iVar1 * 2));
          break;
        }
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < DAT_00204854);
    }
    if ((DAT_00086970 != -1) && ((short)iVar2 == DAT_00204854)) {
      DAT_00086970 = -1;
      set_cursor_sprite_id(0x106c);
    }
  }
  return;
}



// was FUN_00058438 -- handles a mouse button state change: injects
// param_1 as a temporary button-state override (DAT_0020485c) while
// polling update_mouse_state, then records a "click pending" slot
// (DAT_00086968 + its position DAT_0008696a/c, read back by
// get_click_position) if one wasn't already pending. Confirmed
// called directly by visibility.c on a button-release transition.
void handle_mouse_button_message(param_1)
short param_1;

{
  short sVar1;

  DAT_0020485c = (int)param_1;
  update_mouse_state();
  DAT_0020485c = 0;
  /* Desktop input adaptation: the original checks the touch-held flag
     DAT_0023c63c here. SDL right-button pickup instead uses DAT_002506ab;
     checking only touch marks the drag released on a dungeon redraw.
     Use the existing combined button reader for both the release check
     and the cached button code, preserving the original wait protocol. */
  sVar1 = poll_mouse_button_flags();
  if (sVar1 == 0) {
    DAT_0008696e = 0;
  }
  else if (DAT_00086968 == -1) {
    DAT_00086968 = sVar1;
    DAT_0008696a = g_mouse_x;
    DAT_0008696c = g_mouse_y;
  }
  return;
}



// was FUN_000584c0 -- saves the screen area under the cursor (via
// the color-0x14/0x15 save/restore convention rect_fill_or_save_restore
// implements, confirmed by an existing graphics.c comment naming
// this function as the one that sets DAT_00204848 for that purpose)
// before draw_idle_mouse_cursor draws the cursor sprite over it.
void save_cursor_background()

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
       separate corruption bug.

       FOLLOW-UP (bug-list: "'Use key / combine' cursor not drawing over 3d
       view"): the wild-write bug named above is already fixed --
       DAT_002047b0 is a real 20-element array (DAT_002047b0_backing[20])
       as of the code-cleanup-pass-2 merge (commit e0e419e), so
       init_cursor_subsystem's `(&DAT_002047b0)[iVar2] = 10000` loop can no
       longer bleed into this rectangle's globals. Re-verified live
       (UW_DEBUG_CURSORSHOW + UW_DEBUG_MODEBTN): selected a mode cursor
       (g_cursor_mode=3, icon 0x1077) and held/hovered at mouse x=131 --
       past the old corrupted bound's x2=109 -- and the cursor drew every
       tick with no "out of bounds" early-return, both with a held button
       (default visibility rule) and under UW_ALWAYS_SHOW_CURSOR=1. No
       reproducible bug in current code; this confine-rect enforcement can
       stay as-is. */
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
  save_cursor_background();
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



// was FUN_00058734 -- confirmed genuinely empty. Registered in
// game.c as the key-binding handler for a dozen specific key codes
// (deliberately swallowing them -- consuming the keypress without
// any action), and also called directly in a few input wait loops
// alongside the other per-tick input pollers.
void noop_key_handler()

{
  return;
}



// was FUN_00058738 -- reports the effective mouse button state as a
// bitmask (bit0=left, bit1=right), confirmed by an existing input.c
// comment ("reports the right button as bit 1 (value 2)"): uses the
// real button flag (DAT_0023c63c) when set, otherwise falls back to
// two keyboard d-pad-style flags (DAT_002506aa/ab) as touchscreen
// button substitutes, gated on DAT_000876c4.
uint poll_mouse_button_flags()

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


/* Debug view (UW_DEBUG_PICK_VIEW): paint the per-pixel object-pick buffer
   DAT_0023cca0 over the 3D viewport instead of the rendered dungeon, so
   the pick/stencil coverage is directly visible. Call *after* a pick-mode
   render pass (render_dungeon_view_frame) has populated the buffer. Colour key:
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
