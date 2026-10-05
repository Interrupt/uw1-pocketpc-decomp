/* Player state: tile position/movement commit, save-record build/
 * write/restore, HUD stat sync, equipment-effect refresh, and HP
 * adjustment. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/player.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

char *DAT_0024fa2c;
char s_font5x6p_sys_0008430c[] = "font5x6p.sys";
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
char *DAT_0023be74;
short DAT_0023beb4;
/* Sizing-audit pass: investigated, NOT confidently shrunk to the
   minimum. DAT_0010060c/d/e/f are always touched in lockstep (reset
   and `+=3`'d together) and DAT_0010060c has at least one real
   indexed access (`(&DAT_0010060c)[local_1c[iVar6]]`), raising the
   same split-symbol-cluster question already fixed elsewhere this
   session (c/d/e/f's real addresses are consecutive). But that
   index's second-iteration value can come from an unbounded
   `param_4`-derived short, not a clearly-capped category id, so
   unlike the automap case there's no confirmed max index here.
   Given that ambiguity, widened conservatively instead of guessing
   either an exact bound or a merge target; down from 256 to 8. Worth
   a dedicated follow-up pass. */
undefined1 DAT_0010060c_backing[8];
#define DAT_0010060c DAT_0010060c_backing[0]
short DAT_00201c74;
undefined1 DAT_0023bf0c;
/* Reused scratch global (see the DAT_000a85d0 comment above for the
   general pattern) -- most call sites treat it as a writable sprintf-
   style destination buffer via ce_strcat, but several others
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
static undefined4 DAT_00101954;
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
short DAT_00201c70;
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
short DAT_00201c94;
undefined4 DAT_0024cfc8;
undefined4 DAT_002028d8;
undefined2 DAT_00201c78;
/* Ghidra under-recovered this: it rendered the embedded spaces as
   underscores and dropped the leading padding and trailing newline.
   Real bytes at 0x857b8 (confirmed via ARM UU.exe .data): "    You died\n". */
static char s_You_died_000857b8[] = "    You died\n";
static byte DAT_00085730;
code *DAT_00201c9c;
byte DAT_0020208c;
undefined2 DAT_00203304;
undefined1 DAT_00203303;
short DAT_00202078;
/* Sizing-audit pass: pure scalar, only ever set to 0 or 0x1000 and
   passed by address into movement_collision_sweep, which only
   dereferences its own callee-side alias (DAT_002048bc) up to offset
   +4 as a ushort -- max byte touched 5. Sized to 16 for headroom,
   matching the project's established 4-buffer-family convention;
   down from 8192 elements (16384 bytes). */
 undefined2 DAT_002048b0_backing[16];
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
   process_visible_tile_cell's height cull.
   Sizing pass: the real initializer below is only 18 shorts (36
   bytes); tmap.c's own usage adds a small direction-offset byte to
   the nibble index at one call site (`uVar1 + *pbVar35`), so sized to
   128 for headroom past the real data rather than the exact 36,
   down from 65536. */
 undefined1 DAT_00085d20_backing[128] = {
  0x00,0x00, 0x40,0x00, 0x80,0x00, 0xc0,0x00, 0x00,0x01, 0x40,0x01,
  0x80,0x01, 0xc0,0x01, 0x00,0x02, 0x40,0x02, 0x80,0x02, 0xc0,0x02,
  0x00,0x03, 0x40,0x03, 0x00,0x00, 0x00,0x00, 0x00,0x04, 0x00,0x00,
};
short DAT_00202088;
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
static byte DAT_001013a4;
static uint DAT_002020e4;
static byte DAT_002020e8;
int DAT_0023bc94;
// was DAT_002028c0
undefined1 *g_save_equip_table_ptr;
// was DAT_002028c4
undefined1 *g_save_record_base_ptr;
/* Was missing its leading backslash -- both call sites append this
   straight onto a directory path built with no trailing separator (e.g.
   load_player_save_record builds "<root>\SAVE0" then appends this), so the file name
   ran into the directory name with nothing between them
   ("...\SAVE0player.dat"). A leading "\\" here is harmless even for a
   caller whose own prefix already ends in one (resolve_path collapses
   repeated separators). */
/* Original bytes are "player.dat"; the port's save-directory prefix
   omits its trailing separator, so this suffix supplies it instead. */
char s_player_dat_00085a74[] = "\\player.dat";
/* g_light_source_slots: light-source-eligible equip slots {5,6,7,8} (see
   refresh_player_equipment_effects and decay_equipped_light_sources's light-scan loops, and use_light_source's
   own comparison against find_or_assign_object_widget's result). Was a
   bare 1-byte scalar -- every existing `(&g_light_source_slots)[1..3]` read past
   the single declared byte into whatever the linker placed next, instead
   of the real dumped table. Dumped directly from the real binary at
   0x85ac8: `5 6 7 8 0 0 0 0 0 0 0xc8 0 0 0 0xc8 0`. */
 unsigned char DAT_00085ac8_backing[16] =
    {5,6,7,8,0,0,0,0,0,0,0xc8,0,0,0,0xc8,0};
static byte DAT_002046d0;
static byte DAT_002046cc;
static undefined1 DAT_0020330c;
static char DAT_00086db0;
static char DAT_00086db1;
// These armor bonuses are consecutive bytes in the ARM bonus array.
#define DAT_0010060d DAT_0010060c_backing[1]
#define DAT_0010060e DAT_0010060c_backing[2]
#define DAT_0010060f DAT_0010060c_backing[3]
static undefined4 DAT_0023bc9c;
static undefined4 DAT_0023bc98;
undefined4 DAT_002020d0;
static undefined4 DAT_002020dc;
undefined4 DAT_002020d8;
undefined4 DAT_002020d4;
static char DAT_00086db4;
/* Sizing-audit pass: accessed as a raw byte blob at
   `(intptr_t)&DAT_00086db8 + uVar1 + 3` with uVar1 guarded to [5,9]
   -- max byte 12. Sized to 4 int elements (16 bytes) for headroom;
   down from 256. */
static int DAT_00086db8_backing[4];
#define DAT_00086db8 DAT_00086db8_backing[0]
/* Sizing-audit pass: equip-slot weight table, loop bound
   `iVar4<5` (5 equip slots). HARD. Down from 256.
   ARM equipment slot -> armor region table at 0x86da8 (real recovered
   data, not just zero-init). */
static undefined1 DAT_00086da8_backing[5] = {3, 0, 1, 2, 2};
#define DAT_00086da8 DAT_00086da8_backing[0]
/* Was a lone `undefined` scalar, but compute_light_source_colors
   indexes it as a 16-entry (0-0xf) light-type -> base-color-index
   table (`(&DAT_00086dc8)[light_type & 0xf]`). Widened to match. */
static undefined DAT_00086dc8_backing[16];
#define DAT_00086dc8 DAT_00086dc8_backing[0]
undefined2 DAT_0023beb8;
/* Player status record: character attributes, skills, mana, carry weights,
   quest flags, and world state. DAT_00086df8 points here in the game;
   write_player_status_block serializes 0xd2 bytes, and the inventory save
   path also preserves a 220-byte snapshot. Field aliases must share this
   storage so calculations, HUD reads, and save/restore see the same values.

   Sizing-audit pass: the struct's exact real size IS confirmed -- both
   save (player.c:746) and load (player.c:835) round-trip it via
   `ce_memmove(...,&DAT_0023bca8,220)`, an exact, symmetric, HARD
   bound. Sized to 256 for headroom; down from 8192. */
 undefined1 DAT_0023bca8_backing[256];
short DAT_0023be90;
short DAT_0023be92;
short DAT_0023be94;
short DAT_0023bf00;
undefined2 DAT_0023bf02;
undefined2 DAT_0023bf04;
byte DAT_0023beb0;
byte DAT_0023beac;
undefined2 DAT_0023bea0;
short DAT_0023bea4;
short DAT_0023bf08;
undefined4 DAT_0023bea8;
// ARM uses unsigned phase shifts to index the 16-entry bob waveforms.
byte DAT_0023bf18;
undefined2 DAT_0023be9e;
undefined2 DAT_0023be9c;
undefined2 DAT_0023be9a;
static char DAT_0023bf14;
static byte DAT_0023bf10;
/* Real static lookup table, same recovery/boundary evidence as
   movement.c's DAT_00086e38/DAT_00086e48 (bytes at 0x86e58..0x86e67 in
   UU.exe's .data, immediately after those two and immediately before
   the already-recovered DAT_00086e68 == 15 scalar). Independently
   cross-confirmed byte-for-byte by a second, concurrent recovery pass
   (bug-fixes-pass-2) via the same Ghidra method. trigger_view_transition
   indexes this with `(char)bVar8` and `(char)bVar8 + 2 & 0xf` (bVar8 =
   DAT_0023bf18 >> 4), so 16 real entries -- a symmetric wobble curve
   used for the jump/landing camera-bob wobble (DAT_0023be98/be9e). Was
   an all-zero 256-byte placeholder, silently zeroing that wobble. */
static const signed char DAT_00086e58_backing[16] = {
  -4, -3, -2, -1,  0,  1,  2,  3,
   4,  3,  2,  1,  0, -1, -2, -3
};
#define DAT_00086e58 DAT_00086e58_backing[0]
static short DAT_0023bf30;
static short DAT_0023bf34;
static short DAT_0023bf38;
static short DAT_0023bf3c;
static short DAT_0023bf40;
/* Was a lone `undefined` scalar, but grant_experience_points indexes
   it as a per-character-level XP-threshold table
   (`(&DAT_00086e87)[level]`), with the loop's own upper bound (0x10 =
   16) confirming at least 17 entries (0-16) are live; the very first
   access (by the raw current-level byte, before any bounds check) has
   no visible cap of its own, so widened with a safety margin rather
   than the bare minimum. */
static undefined DAT_00086e87_backing[64];
#define DAT_00086e87 DAT_00086e87_backing[0]
static int DAT_0024af8c;
static char s_font5x6i_sys_00086e98[] = "font5x6i.sys";
char s__DATA_mono_dat_000872b8[] = "\\DATA\\mono.dat";
/* "currently-loaded shading level" for load_shading_level_config's `if (DAT_000872a0
   == param_1) return;` early-out. Ghidra dropped its initialiser (same
   silently-zero link-time-init class as DAT_00086e68 &c); left at 0 the
   first dungeon entry -- load_shading_level_config(0) -- matched and returned without
   ever reading SHADES.DAT, so the texture-LOD threshold DAT_00086b24
   stayed 0 and every visible tile drew with the 16x16 low-detail
   texture. Sentinel = no level loaded yet. */
char DAT_000872a0 = -1;
/* Sizing-audit pass: BUG FIX, not just a shrink -- advance_character_
   level builds a 2-digit level-number string here (tens digit/space
   at offset 0, units digit written to the separately-declared
   DAT_0008730d at real address +1) then prints it via
   message_scroll_print_wrapped(&DAT_0008730c), which needs a real
   NUL right after. DAT_0008730d was never aliased in, so the units
   digit landed in a dead, never-read global instead of the string
   buffer -- message_scroll_print_wrapped would see DAT_0008730c_
   backing[1] (always zero, nothing else writes it) immediately after
   the tens digit/space and print a 1-character message, silently
   dropping the units digit on every level-up message (visibly wrong
   once the character reaches level 10+, reachable in normal play).
   Aliased DAT_0008730d into DAT_0008730c_backing[1] so the real
   write lands in the string, with backing[2] as the NUL terminator.
   Real initial template content confirmed via direct Ghidra memory
   export of UU.exe: " 0\n". Sized to 16 for headroom; down from
   8192. */
static undefined1 DAT_0008730c_backing[16] = " 0\n";
#define DAT_0008730c DAT_0008730c_backing[0]
/* The second digit belongs to the same scroll-message buffer. */
#define DAT_0008730d DAT_0008730c_backing[1]
/* Was a lone scalar, but roll_skill_use_improvement indexes it
   `(&DAT_00087308)[tier]` for tier 0..2 (classify_skill_training_tier's
   full range) as a per-tier probability threshold for
   ordint_divmod(uVar2, random).quot. Widened to the real 3-entry array this
   needs -- as a lone scalar, indices 1/2 read into whatever the
   compiler placed next (s_and_00087310's string data on this host),
   an arbitrary/wrong probability for tiers 1 and 2. Real per-tier
   values weren't recovered (Ghidra never surfaced this as initialized
   data), so left zero-initialized rather than guessed -- still an
   improvement over reading unrelated string bytes as a probability. */
static undefined DAT_00087308_arr[3];
#define DAT_00087308 DAT_00087308_arr[0]
/* Ghidra rendered this as "and" (dropped the real leading/trailing
   spaces). Real bytes at 0x87310 (ARM UU.exe .data, confirmed via
   tests/fixtures/static_strings.json's direct memory export):
   " and ". */
char s_and_00087310[] = " and ";
/* Used as a NUL-terminated string (&DAT_00087318) by
   print_skill_improvement_list, joining middle entries of its skill-
   name list. Ghidra never surfaced this as initialized string data;
   real bytes confirmed via the same direct memory export: ", ". */
static char DAT_00087318[] = ", ";
/* Ghidra rendered the embedded spaces as underscores and dropped
   the trailing space. Real bytes at 0x8731c (ARM UU.exe .data):
   "Chant the mantra: ". */
static char s_Chant_the_mantra__0008731c[] = "Chant the mantra: ";
static char s_fontchar_sys_00087330[] = "fontchar.sys";
static char s__DATA_win1_byt_00087350[] = "\\DATA\\win1.byt";
char DAT_0023c27c;
static char s__DATA_win2_byt_00087340[] = "\\DATA\\win2.byt";
static byte DAT_0024af80;
static undefined4 DAT_0024af88;






// was FUN_0003cff8
void set_player_tile_position(param_1,param_2)
uint param_1;
uint param_2;

{
  undefined2 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 local_3c [24];
  
  if (-1 < DAT_00202080) {
    object_list_unlink(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
  }
  DAT_002048b8 = &check_and_reset_landing_state;
  DAT_002048b2 = 0x1100;
  DAT_002048b0 = 0;
  g_jump_ascent_timer = 0;
  g_fall_accel = 0;
  DAT_0020488e = 0;
  DAT_0020488c = 0;
  g_vertical_velocity = 0;
  DAT_00204888 = 0;
  DAT_00204886 = 0;
  DAT_00204880 = (short)((uint)((int)(short)param_1 << 0x18) >> 0x10) + 0x80;
  DAT_00204882 = (short)((uint)((int)(short)param_2 << 0x18) >> 0x10) + 0x80;
  DAT_002048a7 = 8;
  DAT_002048a3 = 1;
  DAT_002048a4 = 0;
  iVar2 = param_1 + param_2 * 0x40;
  DAT_00202080 = (short)iVar2;
  iVar2 = iVar2 * 0x10000 >> 0x10;
  DAT_00204884 = *(short *)(&DAT_00085d20 + (uint)(*(byte *)(DAT_002029cc + iVar2 * 4) >> 4) * 2);
  if (((&DAT_000878d0)[*(byte *)(DAT_002029cc + iVar2 * 4) & 0xf] & 0x20) != 0) {
    DAT_00204884 = DAT_00204884 + 0x20;
  }
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xff80;
  *(byte *)((char *)g_player_object + 2) =
       (byte)uVar3 | (byte)((int)(((int)DAT_00204884 & 0x3f8U) << 0x10) >> 0x13);
  *(char *)((char *)g_player_object + 3) = (char)(uVar3 >> 8);
  uVar3 = *(ushort *)((char *)g_player_object + 0x16) & 0x3ff;
  *(char *)((char *)g_player_object + 0x16) = (char)uVar3;
  *(byte *)((char *)g_player_object + 0x17) = (byte)(uVar3 >> 8) | (byte)(((param_1 & 0x3f) << 10) >> 8);
  uVar3 = *(ushort *)((char *)g_player_object + 0x16) & 0xfc0f | (param_2 & 0x3f) << 4;
  *(char *)((char *)g_player_object + 0x16) = (char)uVar3;
  *(char *)((char *)g_player_object + 0x17) = (char)(uVar3 >> 8);
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0x1fff;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(byte *)((char *)g_player_object + 3) = (byte)(uVar3 >> 8) | 0x60;
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xefff;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(byte *)((char *)g_player_object + 3) = (byte)(uVar3 >> 8) | 0xc;
  *(byte *)((char *)g_player_object + 0x15) = *(byte *)((char *)g_player_object + 0x15) & 0xec | 0x2c;
  uVar3 = *(ushort *)((char *)g_player_object + 4) & 0xffc0;
  *(char *)((char *)g_player_object + 4) = (char)uVar3;
  *(char *)((char *)g_player_object + 5) = (char)(uVar3 >> 8);
  *(byte *)((char *)g_player_object + 4) = *(byte *)((char *)g_player_object + 4) & 0x3f;
  *(undefined1 *)((char *)g_player_object + 5) = 0;
  DAT_00202c6c = local_3c;
  uVar1 = encode_object_slot_index(g_player_object);
  DAT_00202c6c[10] = (char)uVar1;
  DAT_00202c6c[0xb] = (char)((ushort)uVar1 >> 8);
  DAT_00202c6c[8] = (byte)DAT_00203304 & 7;
  iVar2 = (((int)(short)param_1 << 0x13) >> 0x10) + 3;
  DAT_00202c6c[9] = DAT_00203303;
  *DAT_00202c6c = (char)iVar2;
  DAT_00202c6c[1] = (char)((uint)iVar2 >> 8);
  iVar2 = (((int)(short)param_2 << 0x13) >> 0x10) + 3;
  DAT_00202c6c[2] = (char)iVar2;
  DAT_00202c6c[3] = (char)((uint)iVar2 >> 8);
  iVar2 = (int)DAT_00204884;
  DAT_00202c6c[4] = (char)(iVar2 >> 3);
  DAT_00202c6c[5] = (char)((uint)(iVar2 >> 3) >> 8);
  collision_build_height_field(DAT_002048a7);
  DAT_002048a8 = collision_flags_to_locomotion_code((int)(short)(*(ushort *)(DAT_00202c6c + 0xe) |
                                          *(ushort *)(DAT_00202c6c + 0xc)));
  set_locomotion_state(DAT_002048a8,0);
  DAT_0023be98 = 0;
  trigger_view_transition();
  DAT_000858a0 = 1;
  object_list_insert_head(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
  return;
}



/* Debug-only helper (UW_DEBUG_THROW-gated): print both player-position
   representations side by side -- the fine, continuous DAT_00204880/2
   (used by the camera and by demo_set_player_pos) vs. the coarser
   tile-position bytes packed into g_player_object's own record (offset
   0x16/0x17, read elsewhere as DAT_00202a4c/DAT_00202a50 by
   drop_held_object_near_player). Added to bisect a desync between the
   two: right after chargen's set_player_tile_position(0x20,2,1) call
   they should agree (that function sets both atomically), so if they
   already disagree here, the bug is upstream of/inside that call; if
   they still agree here but disagree later (at throw time), something
   between chargen-complete and the throw resets g_player_object's own
   bytes without touching DAT_00204880/2. */
void debug_print_player_position(const char *label)
{
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[playerpos:%s] fine=(%d,%d)=world(%g,%g) obj_bytes tile=(%d,%d)\n",
            label, (int)DAT_00204880, (int)DAT_00204882,
            (double)DAT_00204880 / 256.0, (double)DAT_00204882 / 256.0,
            (int)((byte)*(byte *)((char *)g_player_object + 0x17) >> 2),
            (int)((g_player_object[0xb] & 0x3f0) >> 4));
}


// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0003d438 (previously mis-guessed as "update_3d_sound_position"
// from its trailing sound call). Per-tick commit of the freshly-integrated
// player position/facing back into the world: recompute the tile index and
// relink the player object between tile object lists on a tile change,
// pack sub-tile position / height / facing into the player object record
// (g_player_object +2/+3/+0x16/+0x17/+0x18), auto-straighten the facing
// toward the travel direction, then handle a pending landing impact
// (fall damage apply_typed_damage_to_object + thud play_sound_effect_with_pan) and refresh the
// locomotion pose. Called every tick from apply_movement_tick.
void commit_player_move()

{
  short sVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  ushort uVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  
  iVar8 = ((int)(short)DAT_00204882 >> 8) * 0x40 + (((int)(short)DAT_00204880 << 0x10) >> 0x18);
  iVar2 = (int)DAT_00202080;
  iVar7 = iVar8 * 0x10000 >> 0x10;
  if (iVar7 != iVar2) {
    if (iVar2 != -1) {
      object_list_unlink(DAT_002029cc + iVar2 * 4 + 2,g_player_object);
    }
    DAT_00202080 = (short)iVar8;
    object_list_insert_head(DAT_002029cc + iVar7 * 4 + 2,g_player_object);
    uVar5 = DAT_00204880 & 0x3f00;
    uVar3 = *(ushort *)((char *)g_player_object + 0x16) & 0x3ff;
    *(char *)((char *)g_player_object + 0x16) = (char)uVar3;
    *(byte *)((char *)g_player_object + 0x17) =
         (byte)(uVar3 >> 8) | (byte)((uint)(((int)(short)uVar5 >> 8) << 10) >> 8);
    uVar3 = *(ushort *)((char *)g_player_object + 0x16) & 0xfc0f |
            ((int)(short)(DAT_00204882 & 0x3f00) >> 8) << 4;
    *(char *)((char *)g_player_object + 0x16) = (char)uVar3;
    *(char *)((char *)g_player_object + 0x17) = (char)(uVar3 >> 8);
  }
  uVar5 = DAT_00204880 & 0xe0;
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0x1fff;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(byte *)((char *)g_player_object + 3) =
       (byte)(uVar3 >> 8) | (byte)((uint)(((int)(short)uVar5 >> 5) << 0xd) >> 8);
  uVar5 = DAT_00204882 & 0xe0;
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xe3ff;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(byte *)((char *)g_player_object + 3) =
       (byte)(uVar3 >> 8) | (byte)((uint)(((int)(short)uVar5 >> 5) << 10) >> 8);
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xff80;
  *(byte *)((char *)g_player_object + 2) =
       (byte)uVar3 | (byte)((int)(((int)DAT_00204884 & 0x3f8U) << 0x10) >> 0x13);
  *(char *)((char *)g_player_object + 3) = (char)(uVar3 >> 8);
  uVar3 = read_realtime_clock_units();
  uVar4 = *(ushort *)((char *)g_player_object + 0xb) & 0xfff;
  *(char *)((char *)g_player_object + 0xb) = (char)uVar4;
  *(byte *)((char *)g_player_object + 0xc) = (byte)(uVar4 >> 8) | (byte)(((uVar3 & 0xc0) << 6) >> 8);
  /* ARM 0x3d668..0x3d694 compares two signed 16-bit headings. */
  if ((_DAT_002048a9 != 0) && (_DAT_002048a1 == (short)DAT_00201c78)) {
    g_jump_ascent_timer = 0;
  }
  uVar5 = DAT_00201c70;
  if (_DAT_002048a1 != (short)DAT_00201c78) {
    DAT_00201c78 = _DAT_002048a1;
    uVar3 = (int)_DAT_002048a1 + DAT_00202088 * -0x4000;
    if ((((DAT_00204897 & 0x80) != 0) &&
        (uVar6 = (int)(short)DAT_00201c70 - ((int)(uVar3 * 0x10000) >> 0x10),
        uVar4 = (int)uVar6 >> 0x1f, uVar5 = (ushort)uVar3, 0x3ff < (int)((uVar6 ^ uVar4) - uVar4)))
       && (uVar5 = DAT_00201c70 - 0x400, 0x7ffe < ((uint)DAT_00201c70 - (uVar3 & 0xffff) & 0xffff)))
    {
      uVar5 = DAT_00201c70 + 0x400;
    }
  }
  DAT_00201c70 = uVar5;
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xfc7f | ((int)(short)DAT_00201c70 >> 0xd & 7U) << 7;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(char *)((char *)g_player_object + 3) = (char)(uVar3 >> 8);
  *(byte *)((char *)g_player_object + 0x18) =
       ((byte)(DAT_00201c70 >> 8) ^ *(byte *)((char *)g_player_object + 0x18)) & 0x1f ^
       *(byte *)((char *)g_player_object + 0x18);
  if (_DAT_002048a9 != 0) {
    if (DAT_00204896 != '\0') {
      uVar3 = (uint)(_DAT_002048a9 >> 8);
      iVar7 = 0;
      if (g_vertical_velocity != 0) {
        iVar7 = uVar3 << 0x10;
      }
      if (g_vertical_velocity != 0) {
        uVar3 = ((iVar7 >> 0x10) << 0x11) >> 0x10;
      }
      sVar1 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x32),((int)(short)uVar3 << 0x11) >> 0x10)
      ;
      if (0 < sVar1) {
        sVar1 = ordint_divmod(0x1e,(0x1e - (uint)*(byte *)(DAT_00086df8 + 0x32)) * (int)(short)uVar3).quot
        ;
        uVar3 = (uint)sVar1;
      }
      if (3 < (short)uVar3) {
        apply_typed_damage_to_object(g_player_object,0,0,0,(char)uVar3,0);
      }
      if ((1 < (short)uVar3) || ((DAT_002048a8 & 0x10) != 0)) {
        play_sound_effect_with_pan(0xf,0x40,((uVar3 & 0xff) + 0x31) * 4);
      }
    }
    _DAT_002048a9 = 0;
  }
  set_locomotion_state(DAT_002048a8,0);
  DAT_000858a0 = 0;
  return;
}



// New (not decompiled from the binary): a debug/testing entry point for
// demomode.c's SETPLAYERPOS command. Directly sets the fine-grained player
// position (DAT_00204880/82, format (tile<<8)|fine, 256 units/tile -- see
// commit_player_move's own tile-index derivation), persistent yaw
// (DAT_00201c70, 65536 units/360 degrees -- confirmed via the 0x2000 =
// 45-degree turn-step increments in apply_heading_turn) and pitch
// (DAT_0023beb4, signed 1/256-degree units -- see
// update_current_view_from_subject's own >>8 use of it), then reuses
// set_player_tile_position (for the integer
// tile part: object-list relink, collision height field, locomotion state)
// and commit_player_move (to pack the final fine position/yaw back into the
// player object record g_player_object) so this goes through the same object-
// sync paths real movement does, instead of duplicating them. x/y are tile
// coordinates with a fractional part (e.g. 32.5); z is the same raw height
// unit sync_camera_from_player's [playerpos] print shows (DAT_00204884,
// e.g. z=768 at spawn) -- pass back a value read from that print to land on
// an exact remembered spot; yaw/pitch are degrees.
void demo_set_player_pos(double x, double y, double z, double yaw_deg, double pitch_deg)
{
  set_player_tile_position((int)floor(x), (int)floor(y));
  if (getenv("UW_DEBUG_FLOORZ")) {
    fprintf(stderr, "[floorz] tile=(%d,%d) natural z (from set_player_tile_position) = %d, overriding to %g\n",
            (int)floor(x), (int)floor(y), (int)DAT_00204884, z);
  }
  /* Clear any in-flight smooth-turn interpolation
     (update_current_view_from_subject's DAT_0023bea8-gated add-on to
     DAT_00086e6c+0x2c): if a turn animation was still mid-flight when this
     runs, update_current_view_from_subject would add its leftover per-tick
     delta (DAT_0023be9a) on top of the DAT_00201c70 we're about to set
     below, so sync_camera_from_player's very next [playerpos] print would
     show a transient, wrong yaw for one frame
     until the animation finished on its own. Confirmed via testing: two
     back-to-back SETPLAYERPOS calls, the first (right after spawn, an
     interpolation still pending) showed the old yaw, the second (nothing
     pending any more) matched exactly. */
  DAT_0023bea8 = 0;
  /* Force the camera to track the player object right now.
     update_current_view_from_subject (the function that actually copies
     DAT_00201c70/DAT_00204880 etc. into the camera-facing DAT_00086e6c
     record sync_camera_from_player reads)
     only does that when DAT_0023b82c -- "whichever object the camera is
     currently tracking" -- equals g_player_object, the player object; normally
     true, but right after spawn/chargen it can still be unset/stale for a
     frame, so the very first SETPLAYERPOS call of a run would appear to
     not take effect (confirmed live: first call's yaw didn't show up,
     second did). Setting it here makes this reliable regardless of when
     it's called. */
  DAT_0023b82c = g_player_object;
  DAT_00204880 = (short)lround(x * 256.0);
  DAT_00204882 = (short)lround(y * 256.0);
  /* set_player_tile_position just computed a default DAT_00204884 from the
     destination tile's own floor-height table lookup; override it with the
     caller's exact value (e.g. to stand at a specific mid-air/step height,
     not just "on the floor of this tile"). */
  DAT_00204884 = (short)lround(z);
  DAT_00201c70 = (short)lround(yaw_deg * (65536.0 / 360.0));
  DAT_0023beb4 = (short)lround(pitch_deg * 256.0);
  DAT_00201c78 = DAT_00201c70;
  _DAT_002048a1 = DAT_00201c70;
  commit_player_move();
}




// was FUN_0003e4cc -- reads the player object's current HP/MP/etc.
// and pushes them into the HUD via set_hud_status_value, one call per
// status slot (0=health, 1=mana, 2=hunger-ish, 4=poison flash, ...).
// Called once per HUD refresh from enter_dungeon_view_hud_init.
void sync_player_stats_to_hud()

{
  int iVar1;
  byte bVar2;
  uint uVar3;
  
  tick_weapon_swing_state(0);
  bVar2 = *(byte *)((char *)g_player_object + 8);
  set_hud_status_value(0,bVar2);
  if (((uint)DAT_001013a4 < (uint)*(byte *)((char *)g_player_object + 0x11) * 4) ||
     ((bVar2 < 0x10 && (*(byte *)((char *)g_player_object + 0x11) != 0)))) {
    set_hud_status_value(4,3);
  }
  *(undefined1 *)((char *)g_player_object + 0x11) = 0;
  set_hud_status_value(1,*(undefined1 *)(DAT_00086df8 + 0x37));
  if (DAT_00201b68 != 9) {
    set_hud_status_value(2,(ushort)(((int)(((*(byte *)((char *)g_player_object + 0x18) & 0x1f) +
                                   ((*(ushort *)((char *)g_player_object + 2) & 0x380) >> 2)) * 0x10000) >>
                            0x10) + 8 >> 4) & 0xf);
  }
  if (*(char *)((char *)g_player_object + 8) == '\0') {
    handle_starvation_penalty();
  }
  uVar3 = read_realtime_clock_units();
  iVar1 = ((uVar3 >> 8) - DAT_002020e4) * 0x10000;
  if (iVar1 >> 0x10 != 0) {
    uVar3 = read_realtime_clock_units();
    DAT_002020e4 = uVar3 >> 8;
    DAT_002020e8 = (char)((uint)iVar1 >> 0x10) + DAT_002020e8;
    update_ingame_music_track();
    if (0x14 < DAT_002020e8) {
      DAT_002020e8 = 0;
      update_player_tick_effects();
    }
  }
  if ((DAT_00201b68 == 9) && (uVar3 = ce_rand(), (uVar3 & 0x1f) == 0)) {
    apply_level9_random_hazard_tick();
  }
  return;
}




// was FUN_00043e20
void build_player_save_record(param_1)
undefined1 * param_1;

{
  bool bVar1;
  ushort uVar2;
  short sVar3;
  undefined1 *puVar4;
  int iVar5;
  int iVar6;
  undefined1 *puVar7;
  ushort *puVar8;
  byte *pbVar9;
  ushort local_14 [2];
  
  close_backpack_container();
  puVar4 = g_player_object;
  iVar6 = 0x1b;
  puVar7 = param_1;
  do {
    iVar5 = iVar6 + -1;
    *puVar7 = *puVar4;
    bVar1 = 0 < iVar6;
    puVar4 = puVar4 + 1;
    iVar6 = iVar5;
    puVar7 = puVar7 + 1;
  } while (iVar5 != 0 && bVar1);
  param_1[4] = param_1[4] & 0x3f;
  param_1[5] = 0;
  g_save_equip_table_ptr = param_1 + 0x23;
  g_save_record_base_ptr = param_1 + 0x5b;
  g_save_record_count = 0;
  iVar6 = 0;
  do {
    puVar8 = (ushort *)(g_save_equip_table_ptr + iVar6 * 2);
    uVar2 = *puVar8;
    *(char *)puVar8 = (char)(uVar2 & 0xffc0);
    *(char *)((char *)puVar8 + 1) = (char)((uVar2 & 0xffc0) >> 8);
    pbVar9 = g_save_equip_table_ptr + iVar6 * 2;
    *pbVar9 = *pbVar9 & 0x3f;
    pbVar9[1] = 0;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 0x13);
  serialize_inventory_link_chain((char *)g_player_object + 6,param_1 + 6);
  puVar4 = g_selected_object;
  if (g_cursor_holding_state == 1) {
    param_1[0x1b] = *g_selected_object;
    param_1[0x1c] = puVar4[1];
    param_1[0x1d] = puVar4[2];
    param_1[0x1e] = puVar4[3];
    param_1[0x1f] = puVar4[4];
    param_1[0x20] = puVar4[5];
    param_1[0x21] = puVar4[6];
    param_1[0x22] = puVar4[7];
    if ((g_selected_object[1] & 0x80) == 0) {
      serialize_inventory_link_chain(g_selected_object + 6,param_1 + 0x21);
    }
    sVar3 = encode_object_slot_index(g_selected_object);
    local_14[0] = local_14[0] & 0x3f | sVar3 << 6;
    free_linked_object_recursive(local_14);
  }
  return;
}



// was FUN_00043fd8
bool write_player_save_record(param_1)
char * param_1;

{
  char cVar1;
  int iVar2;
  bool bVar3;
  char acStack_114 [260];
  
  bVar3 = true;
  g_save_record_buffer = ce_malloc(0x4000);
  if (g_save_record_buffer == 0) {
    bVar3 = false;
  }
  else {
    build_player_save_record(g_save_record_buffer);
    g_save_record_count = g_save_record_count + 1;
    /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested): the real
       binary's own write_player_save_record never serializes
       DAT_0023bca8 (the player's stats/skills/quest-flags struct,
       confirmed via Ghidra decompile of the real ARM functions at
       0x43e20/0x43fd8/0x44538 -- none reference it) -- so quest flags,
       skills, difficulty, and the live game clock never actually
       survived a real save/load, even in the shipped Pocket PC game.
       Confirmed via the real UW1 savegame format documentation
       (uw-formats.txt section 9.2.1) that this struct's layout matches
       player.dat's own documented fields byte-for-byte starting at
       offset 0x1e (Strength) -- and this project's own live code
       already reads/writes this exact struct via DAT_00086df8 at those
       same documented offsets (e.g. 0xce = game_time, 0x65 = quest
       flags 0-31), confirming it's genuinely the right data, just
       never persisted. Appended after the existing (dynamically sized)
       inventory section using THIS function's own post-increment
       g_save_record_count (matching the exact count the file-length
       calculation just below uses -- build_player_save_record's own
       internal offset math runs before this +1, so the copy can't live
       there without a mismatched offset) rather than interleaved into
       the middle of the existing fixed-offset layout, so no existing
       offset changes. 220 bytes matches the documented "first 220
       bytes" of a real player.dat (the XOR-encrypted header, ending
       just past the last documented field before the equipment-slot-
       index table, which this project's own g_save_equip_table_ptr
       logic already serializes separately -- not duplicated here). */
    ce_memmove(g_save_record_buffer + 0x5b + g_save_record_count * 8,&DAT_0023bca8,220);
    if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[quest-persist] SAVE appending quest_bits=0x%x at buffer offset %d\n", *(unsigned int *)(DAT_00086df8 + 0x65), (int)(0x5b + g_save_record_count * 8));
    if (param_1 != (char *)0x0) {
      iVar2 = -(int)param_1;
      do {
        cVar1 = *param_1;
        param_1[(int)(acStack_114 + iVar2)] = cVar1;
        param_1 = param_1 + 1;
      } while (cVar1 != '\0');
      ce_strcat(acStack_114,s_player_dat_00085a74);
      iVar2 = open_existing_file_rw(acStack_114);
      bVar3 = iVar2 != -1;
      if (bVar3) {
        /* BUG FIX: was `write_player_status_block()` with no arguments,
           relying on leftover register state -- iVar2 (the file
           handle, used the very next line) is the value that belongs
           here, matching write_player_status_block's own param_1 role
           (same dropped-argument bug class documented throughout this
           project). */
        write_player_status_block(iVar2);
        write_file_handle(iVar2,&g_save_record_count,2);
        write_file_handle(iVar2,g_save_record_buffer,g_save_record_count * 8 + 0x5b + 220);
        CloseHandle(iVar2);
      }
      if (g_save_record_buffer != 0) {
        LocalFree();
        g_save_record_buffer = 0;
      }
      set_pending_update_flags(0x200);
    }
  }
  return bVar3;
}




// was FUN_00044538
void restore_player_save_record(param_1)
undefined1 * param_1;

{
  bool bVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  int iVar4;
  int iVar5;
  
  g_save_equip_table_ptr = param_1 + 0x23;
  g_save_record_base_ptr = param_1 + 0x5b;
  puVar2 = g_player_object;
  puVar3 = param_1;
  iVar4 = 0x1b;
  do {
    iVar5 = iVar4 + -1;
    *puVar2 = *puVar3;
    bVar1 = 0 < iVar4;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
    iVar4 = iVar5;
  } while (iVar5 != 0 && bVar1);
  deserialize_inventory_link_chain((char *)g_player_object + 6,param_1 + 6);
  if (g_cursor_holding_state == 1) {
    puVar2 = (undefined1 *)alloc_object_slot(0);
    g_selected_object = puVar2;
    *puVar2 = param_1[0x1b];
    puVar2[1] = param_1[0x1c];
    puVar2[2] = param_1[0x1d];
    puVar2[3] = param_1[0x1e];
    puVar2[4] = param_1[0x1f];
    puVar2[5] = param_1[0x20];
    puVar2[6] = param_1[0x21];
    puVar2[7] = param_1[0x22];
    if ((param_1[0x1c] & 0x80) == 0) {
      deserialize_inventory_link_chain(g_selected_object + 6,param_1 + 0x21);
    }
  }
  /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested) -- see
     write_player_save_record's own matching comment: restores
     DAT_0023bca8 from the same trailing offset that function now
     appends it at. g_save_record_count is already set here (the
     caller reads it directly from the file's own 2-byte header
     before calling this function), matching the exact post-increment
     count the save side used, so this offset is consistent whether
     restore_player_save_record's own caller went through a real file
     read or is just re-applying the currently-held in-memory record
     (build_player_save_record is only ever called from
     write_player_save_record, which always fills this same trailing
     block first -- never garbage). */
  ce_memmove(&DAT_0023bca8,param_1 + 0x5b + g_save_record_count * 8,220);
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[quest-persist] LOAD restored quest_bits=0x%x from buffer offset %d\n", *(unsigned int *)(DAT_00086df8 + 0x65), (int)(0x5b + g_save_record_count * 8));
  return;
}




// was FUN_000667cc
void refresh_player_equipment_effects()

{
  byte bVar1;
  ushort uVar2;
  char cVar3;
  int iVar4;
  ushort *iVar5;
  ushort *puVar6;
  byte *iVar7; /* Was `int` -- truncated the 64-bit pointer get_scanned_object_class_effect_ptr
                  returns (see its own comment); made a real crash once
                  that return value stopped being a hardcoded 0. */
  uint uVar8;
  byte bVar9;
  ushort uVar11;
  bool bVar12;
  bool bVar13;
  undefined2 local_30;
  undefined1 local_2e [2];
  undefined1 local_2c [4];
  int local_28;
  byte bVar10;
  
  local_30 = 0;
  iVar4 = 0;
  do {
    DAT_0023be74[iVar4] = '\0';
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 4);
  iVar4 = 0;
  do {
    iVar5 = get_equipped_item_at_slot(iVar4);
    if (iVar5 != 0) {
      cVar3 = compute_object_weight(iVar5);
      DAT_0023be74[(char)(&DAT_00086da8)[iVar4]] =
           cVar3 + DAT_0023be74[(char)(&DAT_00086da8)[iVar4]];
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 5);
  puVar6 = (ushort *)get_equipped_item_at_slot((*(byte *)(DAT_00086df8 + 100) & 1) + 7);
  if ((((puVar6 != (ushort *)0x0) && (uVar11 = *puVar6, (uVar11 & 0x1c0) == 0)) &&
      ((uVar11 & 0x30) == 0x30)) && ((10 < (uVar11 & 0xf) && ((uVar11 & 0xf) < 0x10)))) {
    cVar3 = compute_object_weight(puVar6);
    *DAT_0023be74 = cVar3 + *DAT_0023be74;
    DAT_0023be74[1] = DAT_0023be74[1] + cVar3;
  }
  DAT_0023be74[0x12] = *(char *)(DAT_00086df8 + 0x22);
  g_scratch_object_ptr = (ushort *)get_equipped_item_at_slot(8 - (*(byte *)(DAT_00086df8 + 100) & 1));
  uVar11 = 2;
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[weapon-gfx] refresh_player_equipment_effects: weapon_hand_item=%p id=0x%x\n", (void *)g_scratch_object_ptr, g_scratch_object_ptr ? (unsigned)*g_scratch_object_ptr : 0xffff);
  if (g_scratch_object_ptr != (ushort *)0x0) {
    uVar2 = *g_scratch_object_ptr;
    if (((uVar2 & 0x1c0) == 0) && ((uVar2 & 0x30) < 0x20)) {
      uVar8 = uVar2 & 0xf;
      if ((uVar2 & 0x30) == 0) {
        if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[weapon-gfx] family0 nibble=%u table_byte(offset+6)=%d\n", uVar8, (int)(&DAT_00202806)[uVar8 * 8]);
        uVar11 = (ushort)(byte)(&DAT_00202806)[uVar8 * 8];
        uVar8 = (uint)(short)(ushort)(byte)(&DAT_00202806)[uVar8 * 8];
        bVar13 = SBORROW4(uVar8,3);
        iVar4 = uVar8 - 3;
        bVar12 = uVar8 == 3;
        if (uVar8 < 3) {
          uVar11 = 3;
        }
        else {
          bVar13 = SBORROW4(uVar8,5);
          iVar4 = uVar8 - 5;
          bVar12 = uVar8 == 5;
        }
        if (!bVar12 && iVar4 < 0 == bVar13) {
          uVar11 = 5;
        }
        iVar4 = (char)uVar11 + -3;
        goto LAB_000669a8;
      }
      iVar4 = -1;
      if (7 < uVar8) goto LAB_000669a8;
    }
  }
  iVar4 = 3;
LAB_000669a8:
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[weapon-gfx] refresh_player_equipment_effects: resolved category=%d\n", iVar4);
  request_weapon_swing_graphic(iVar4);
  DAT_0023be74[0x12] = DAT_0023be74[0x12] + (*(byte *)(DAT_00086df8 + (short)uVar11 + 0x21) >> 1);
  reset_player_derived_state();
  iVar5 = 0;
  bVar10 = 0;
  bVar9 = 0;
  iVar4 = 0;
  bVar12 = false;
  do {
    puVar6 = g_selected_object;
    if (!bVar12) {
      /* Was get_equipped_item_at_slot(iVar4) -- scanning raw equip slots 0-3, which
         never hold a light source. Disassembly of the real binary
         (0x669e8-0x669f4) shows an indirect table lookup was dropped:
         r8 is loaded from the literal pool with g_light_source_slots, then
         `ldrsbne r0,[r5,r8]` reads g_light_source_slots[iVar4] (the real
         light-source-eligible slots {5,6,7,8}) before calling
         get_equipped_item_at_slot. The sibling light-fuel-burn loop in decay_equipped_light_sources
         (uw.c ~45174) already uses this exact
         `get_equipped_item_at_slot((char)(&g_light_source_slots)[iVar9])` pattern for the
         identical 0x90-class/radius-nibble check, confirming this is
         the real call shape here too -- this was the actual cause of
         [[torch-ambient-light-scan-range-mismatch]]: a lit torch
         auto-equips to slot 5 (widget 6), which this loop never read. */
      puVar6 = (ushort *)get_equipped_item_at_slot((int)(char)(&g_light_source_slots)[iVar4]);
    }
    g_scratch_object_ptr = puVar6;
    if (getenv("UW_DEBUG_AMBIENT"))
      fprintf(stderr, "[ambient] light-scan slot=%d puVar6=%p id=0x%03x nibble=0x%x\n",
              (int)iVar4, (void *)puVar6, puVar6 ? (unsigned)(*puVar6 & 0x1ff) : 0u,
              puVar6 ? (unsigned)(*puVar6 & 0xf) : 0u);
    if ((((puVar6 != (ushort *)0x0) && ((*puVar6 & 0x1f0) == 0x90)) &&
        (uVar11 = *puVar6 & 0xf, 3 < uVar11)) && (uVar11 < 8)) {
      iVar7 = get_scanned_object_class_effect_ptr();
      bVar1 = iVar7[1];
      if (bVar10 < bVar1) {
        /* ARM 0x66a54 sets r0 = 0 before the call at 0x66a5c;
           Ghidra omitted the reused-register argument. */
        set_ambient_bias_with_light(0);
        iVar5 = iVar4;
        bVar9 = bVar1;
        bVar10 = bVar1;
      }
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    bVar12 = iVar4 == 4;
  } while (iVar4 < 5);
  *(byte *)(DAT_00086df8 + 99) = bVar9 * '\x10' + (char)iVar5;
  if (getenv("UW_DEBUG_AMBIENT")) {
    int _s;
    fprintf(stderr, "[ambient] light-scan result: bVar9=%d iVar5=%d -> DAT_00086df8+99=0x%02x; full slot dump:\n",
            (int)bVar9, (int)iVar5, (unsigned)*(byte *)(DAT_00086df8 + 99));
    for (_s = 0; _s < 11; _s++) {
      ushort *_o = (ushort *)get_equipped_item_at_slot(_s);
      fprintf(stderr, "  slot=%d ptr=%p id=0x%03x nibble=0x%x\n", _s, (void *)_o,
              _o ? (unsigned)(*_o & 0x1ff) : 0u, _o ? (unsigned)(*_o & 0xf) : 0u);
    }
  }
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) != 0) {
    iVar4 = 0;
    do {
      bVar9 = *(byte *)(DAT_00086df8 + iVar4 * 2 + 0x3e);
      apply_equipped_item_effect(bVar9 & 0xf,bVar9 >> 4,&local_30,0xffffffff);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < (int)(*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf));
  }
  iVar4 = 0;
  do {
    g_scratch_object_ptr = (ushort *)get_equipped_item_at_slot(iVar4);
    if ((g_scratch_object_ptr != (ushort *)0x0) &&
       (iVar5 = is_valid_equipment_slot_item(*g_scratch_object_ptr & 0x1ff,iVar4), iVar5 != 0)) {
      iVar5 = resolve_object_variant_or_special_link(g_scratch_object_ptr,local_2c,local_2e,&local_28);
      if ((iVar5 == 0) || (local_28 != 0)) {
        if ((*g_scratch_object_ptr & 0x1ff) == 0x2f) {
          DAT_0023bc98 = 1;
        }
      }
      else {
        iVar5 = apply_equipped_item_effect(local_2c[0],local_2e[0],&local_30,iVar4);
        if (iVar5 != 0) {
          clear_object_pending_special_flag(g_scratch_object_ptr);
        }
      }
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 0xb);
  apply_equipment_effect_penalties(local_30);
  if (DAT_002020d8 == 0) {
    /* Keep the tile-light grid in sync in both render modes. ARM's RGB
       bias controls drawing, but does not update the SHADES.DAT grid
       used to decide which tiles the automap can discover. */
    load_shading_level_config(*(byte *)(DAT_00086df8 + 99) >> 4);
    const char *light_mode = getenv("UW_LIGHT_MODE");
    if (!light_mode || strcmp(light_mode, "dos") != 0) {
      /* HACK: the ARM build only distinguished lit from unlit here.
         Restore per-strength brightness: start at the unlit bias (+8),
         subtract 16 for every light level, and retain the calibration
         adjustment. The low nibble identifies the source, not strength. */
      set_ambient_bias_without_light((*(byte *)(DAT_00086df8 + 99) >> 4) * 16);
    }
  }
  else {
    load_shading_level_config(6);
  }
  update_screen_flicker_effect((*(byte *)(DAT_00086df8 + 0x61) & 0xc) != 0);
  force_locomotion_state_refresh();
  apply_movement_mode_profile(0xffffffff);
  return;
}




// was FUN_00073ec0
void adjust_player_hp(param_1,param_2)
char *param_1;
char param_2;

{
  ushort uVar1;
  short sVar2;
  
  if (param_1 == g_player_object) {
    if (param_2 < '\x01') {
      sVar2 = (ushort)*(byte *)((char *)g_player_object + 8) - (short)param_2;
    }
    else {
      uVar1 = ce_rand();
      sVar2 = (ushort)*(byte *)((char *)g_player_object + 8) +
              ((short)(((uVar1 & 3) + (short)param_2) * (ushort)*(byte *)(DAT_0023be74 + 4)) >> 4) +
              1;
    }
    if ((short)(ushort)*(byte *)(DAT_0023be74 + 4) < sVar2) {
      *(byte *)((char *)g_player_object + 8) = *(byte *)(DAT_0023be74 + 4);
    }
    else {
      *(char *)((char *)g_player_object + 8) = (char)sVar2;
    }
    refresh_experience_display();
  }
  return;
}




// was FUN_00065b90 -- packs live game state (recent equip/attack
// bytes, world x/y/z/facing, locomotion state) into the 0xd2-byte
// DAT_00086df8 player-status block, then writes it to file handle
// param_1 through a length-prefixed, presumably checksummed/XOR'd
// wrapper (write_xor_scrambled_block). Called from write_player_save_record as the
// player.dat header write step.
void write_player_status_block(param_1)
undefined4 param_1;

{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  byte local_14 [4];
  
  local_14[0] = *DAT_00086df8 ^ 0xaa;
  DAT_00086df8[0x1e] = *(byte *)(DAT_0023be74 + 5);
  DAT_00086df8[0x1f] = *(byte *)(DAT_0023be74 + 6);
  DAT_00086df8[0x20] = *(byte *)(DAT_0023be74 + 7);
  DAT_00086df8[0x35] = *(byte *)((char *)g_player_object + 8);
  DAT_00086df8[0x36] = *(byte *)(DAT_0023be74 + 4);
  uVar1 = DAT_00204880;
  DAT_00086df8[0x54] = (byte)DAT_00204880;
  DAT_00086df8[0x55] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00204882;
  DAT_00086df8[0x56] = (byte)DAT_00204882;
  DAT_00086df8[0x57] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00204884;
  DAT_00086df8[0x58] = (byte)DAT_00204884;
  DAT_00086df8[0x59] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00201c70;
  DAT_00086df8[0x5a] = (byte)DAT_00201c70;
  DAT_00086df8[0x5b] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00201b68;
  DAT_00086df8[0x5c] = (byte)DAT_00201b68;
  DAT_00086df8[0x5d] = (byte)((ushort)uVar1 >> 8);
  bVar2 = is_sound_effects_enabled();
  DAT_00086df8[0xb5] = (bVar2 ^ DAT_00086df8[0xb5]) & 3 ^ DAT_00086df8[0xb5];
  bVar2 = is_music_playing();
  DAT_00086df8[0xb5] = DAT_00086df8[0xb5] & 0xf3 | (bVar2 & 3) << 2;
  uVar3 = *(ushort *)(DAT_00086df8 + 0xb6) & 0xf807 | (uint)DAT_002048a8 << 3;
  DAT_00086df8[0xb6] = (byte)uVar3;
  DAT_00086df8[0xb7] = (byte)(uVar3 >> 8);
  write_file_handle(param_1,local_14,1);
  write_xor_scrambled_block(param_1,local_14[0],DAT_00086df8,0xd2);
  return;
}



// was FUN_00065d4c -- read-side counterpart to
// write_player_status_block: reads the 0xd2-byte DAT_00086df8 player-
// status block from file handle param_1 and unpacks it back into the
// live game-state globals it was packed from.
void read_player_status_block(param_1)
undefined4 param_1;

{
  undefined1 local_10 [4];
  
  read_file_handle(param_1,local_10,1);
  read_xor_scrambled_block(param_1,local_10[0],DAT_00086df8,0xd2);
  *(undefined1 *)(DAT_0023be74 + 5) = *(undefined1 *)(DAT_00086df8 + 0x1e);
  *(undefined1 *)(DAT_0023be74 + 6) = *(undefined1 *)(DAT_00086df8 + 0x1f);
  *(undefined1 *)(DAT_0023be74 + 7) = *(undefined1 *)(DAT_00086df8 + 0x20);
  *(undefined1 *)((char *)g_player_object + 8) = *(undefined1 *)(DAT_00086df8 + 0x35);
  *(undefined1 *)(DAT_0023be74 + 4) = *(undefined1 *)(DAT_00086df8 + 0x36);
  DAT_00204880 = *(undefined2 *)(DAT_00086df8 + 0x54);
  DAT_00204882 = *(undefined2 *)(DAT_00086df8 + 0x56);
  DAT_00204884 = *(undefined2 *)(DAT_00086df8 + 0x58);
  DAT_00201c70 = *(undefined2 *)(DAT_00086df8 + 0x5a);
  DAT_00201b68 = *(undefined2 *)(DAT_00086df8 + 0x5c);
  DAT_002048a8 = (undefined1)(*(ushort *)(DAT_00086df8 + 0xb6) >> 3);
  set_sound_effects_enabled(*(byte *)(DAT_00086df8 + 0xb5) & 3);
  set_music_enabled(*(byte *)(DAT_00086df8 + 0xb5) >> 2 & 3);
  configure_texture_detail_functions();
  apply_movement_mode_profile(*(ushort *)(DAT_00086df8 + 0xb6) & 7);
  return;
}




// was FUN_00065eb4 -- recomputes the player's derived stealth/hide
// thresholds (DAT_00086db0/DAT_00086db1, die-roll-jittered from a
// player-stat byte at DAT_00086df8+0x2e) and resets a batch of
// movement/combat scratch flags and counters (including the step-
// counter default DAT_000858c4, doubled on hard difficulty). Called
// from refresh_player_equipment_effects after an equipment change.
void reset_player_derived_state()

{
  char *iVar1;
  char cVar2;

  iVar1 = DAT_00086df8;
  DAT_0020330c = 0;
  cVar2 = ordint_divmod(3,*(undefined1 *)(DAT_00086df8 + 0x2e)).quot;
  DAT_00086db0 = '\r' - cVar2;
  cVar2 = ordint_divmod(5,*(undefined1 *)(iVar1 + 0x2e)).quot;
  DAT_00086db1 = '\x0f' - cVar2;
  DAT_0020208c = 0;
  DAT_0010060c = 0;
  DAT_0010060d = 0;
  DAT_0010060e = 0;
  DAT_0010060f = 0;
  DAT_0023bc9c = 0;
  DAT_0023bc98 = 0;
  DAT_002020d0 = 0;
  DAT_002020dc = 0;
  DAT_002020d8 = 0;
  DAT_002020d4 = 0;
  DAT_000858c4 = 0x90;
  if (DAT_0023bc94 != 0) {
    DAT_000858c4 = 400;
  }
  DAT_002046cc = 0;
  return;
}




// was FUN_000660d4 -- toggles a randomized screen flicker effect
// tracked in DAT_00086db4 (-1=off, 0/1/2 = which of 3 sub-effects):
// param_1==0 cancels any active effect (restoring palette bank 0, or
// stopping toggle_light_table_flicker's effect); param_1!=0 with no effect currently
// active picks a random one (or forces sub-effect 0 if DAT_00086db8
// is set) and starts it -- sub-effect 1 randomly cycles the palette
// bank, sub-effect 2 drives toggle_light_table_flicker. Called from
// refresh_player_equipment_effects gated on bits 2-3 of the player's
// status byte (DAT_00086df8+0x61) -- likely a worn item's
// cursed/poisoned status flags, not confirmed.
void update_screen_flicker_effect(param_1)
int param_1;

{
  int uw_ord2005_rem_125 = 0;
  ushort uVar1;
  undefined4 uVar2;
  char extraout_r1;
  
  if (param_1 == 0) {
    if (-1 < DAT_00086db4) {
      if (DAT_00086db4 == '\x01') {
        set_palette_bank(0);
      }
      else if (DAT_00086db4 == '\x02') {
        toggle_light_table_flicker(0);
      }
      DAT_00086db4 = -1;
    }
  }
  else if (DAT_00086db4 < '\0') {
    if (DAT_00086db8 == 0) {
      uVar2 = ce_rand();
      uw_ord2005_rem_125 = ((int)(uVar2)) % (3);
      DAT_00086db4 = uw_ord2005_rem_125;
    }
    else {
      DAT_00086db4 = '\0';
      DAT_00086db8 = 0;
    }
    if (DAT_00086db4 == '\x01') {
      uVar1 = ce_rand();
      set_palette_bank(uVar1 & 7);
    }
    else if (DAT_00086db4 == '\x02') {
      toggle_light_table_flicker(1);
    }
  }
  return;
}




// was FUN_000661b0 -- applies one "intrinsic equipment effect" opcode
// (param_1, 0-0xd) with magnitude/argument param_2, against scratch
// state param_3 and an equipment-slot/object index param_4. Called
// from refresh_player_equipment_effects for both the fixed light-
// radius contributions packed at DAT_00086df8+0x3e and per-equipped-
// item property effects it resolves via is_valid_equipment_slot_item/resolve_object_variant_or_special_link.
// Individual opcode semantics aren't all confirmed (several, e.g. 4-8
// and 10, are no-ops in this decompile); named for the dispatcher's
// overall role, not a verified meaning of every case.
undefined4 apply_equipped_item_effect(param_1,param_2,param_3,param_4)
undefined1 param_1;
byte param_2;
ushort * param_3;
int param_4;

{
  uint uVar1;
  byte *pbVar2;
  undefined4 *puVar3;
  char *pcVar4;
  byte bVar5;
  int iVar6;
  char cVar7;
  ushort uVar8;
  short local_1c [2];
  
  switch(param_1) {
  case 0:
    if (*(byte *)(DAT_00086df8 + 99) >> 4 < param_2) {
      *(byte *)(DAT_00086df8 + 99) = param_2 << 4;
    }
    break;
  case 1:
    pbVar2 = &DAT_0020208c;
    bVar5 = (byte)(1 << (uint)(byte)(param_2 - 1)) | DAT_0020208c;
LAB_0006636c:
    *pbVar2 = bVar5;
    break;
  case 2:
    if ((ushort)param_2 <= *param_3 >> 4) {
      return 0;
    }
    uVar8 = (*param_3 & 0xf) + (ushort)param_2 * 0x10;
    goto LAB_00066290;
  case 3:
    uVar1 = (uint)param_2;
    if (uVar1 == 1) {
      DAT_0010060c = DAT_0010060c + '\x03';
      DAT_0010060d = DAT_0010060d + '\x03';
      DAT_0010060e = DAT_0010060e + '\x03';
      DAT_0010060f = DAT_0010060f + '\x03';
      return 0;
    }
    if (4 < uVar1) {
      if (9 < uVar1) {
        return 0;
      }
      DAT_0020330c = DAT_0020330c | *(byte *)((intptr_t)&DAT_00086db8 + uVar1 + 3);
      return 0;
    }
    uVar8 = *param_3 | (ushort)(1 << (uVar1 - 1 & 0xff));
LAB_00066290:
    *param_3 = uVar8;
    break;
  case 4:
    break;
  case 5:
    break;
  case 6:
    break;
  case 7:
    break;
  case 8:
    break;
  case 9:
    reduce_item_quality_on_use(g_player_object);
    break;
  case 10:
    break;
  case 0xb:
    if (param_2 == 0) {
      puVar3 = &DAT_002020d0;
    }
    else if (param_2 == 1) {
      puVar3 = &DAT_002020d8;
    }
    else {
      if (param_2 != 2) {
        if (param_2 == 3) {
          DAT_000858c4 = 0;
          return 0;
        }
        if (param_2 == 0xe) {
          pbVar2 = &DAT_002046cc;
          bVar5 = DAT_002046cc | 1;
        }
        else {
          if (param_2 != 0xf) {
            return 0;
          }
          pbVar2 = &DAT_002046cc;
          bVar5 = DAT_002046cc | 2;
        }
        goto LAB_0006636c;
      }
      puVar3 = &DAT_002020d4;
    }
    goto LAB_00066398;
  case 0xc:
    param_4 = param_4 << 0x10;
    iVar6 = param_4 >> 0x10;
    if (-1 < iVar6) {
      if (iVar6 < 5) {
        local_1c[0] = (short)(char)(&DAT_00086da8)[iVar6];
      }
      else {
        local_1c[0] = 0;
        param_4 = 1;
      }
      local_1c[1] = 0xffff;
      if (4 < iVar6) {
        local_1c[1] = (short)param_4;
      }
      if (local_1c[0] != -1) {
        iVar6 = 0;
        do {
          if (1 < iVar6) {
            return 0;
          }
          cVar7 = '\0';
          if ((param_2 & 8) == 0) {
            (&DAT_0010060c)[local_1c[iVar6]] =
                 (param_2 & 7) + (&DAT_0010060c)[local_1c[iVar6]] + '\x01';
          }
          else {
            cVar7 = (param_2 & 7) + 1;
          }
          pcVar4 = (char *)(local_1c[0] + DAT_0023be74);
          *pcVar4 = cVar7 + *pcVar4;
          iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        } while (local_1c[iVar6] != -1);
      }
    }
    break;
  case 0xd:
    if (param_2 != 4) {
      return 0;
    }
    puVar3 = &DAT_0023bc9c;
LAB_00066398:
    *puVar3 = 1;
  }
  return 0;
}




// was FUN_000664bc -- fills param_1[0..2] (default color index 0x15
// each) with per-light-source color indices derived from the ambient-
// light contributions packed at DAT_00086df8+0x3e (same bitfield
// layout apply_equipped_item_effect's light scan uses), via the
// DAT_00086dc8 type->base-color lookup table plus the light-level
// nibble. Consumed both to render a HUD light-color indicator
// (update_light_source_color_icons) and to pick a "you see a <color> light" message
// string fragment.
void compute_light_source_colors(param_1)
undefined1 * param_1;

{
  char cVar1;
  uint uVar2;

  *param_1 = 0x15;
  param_1[1] = 0x15;
  param_1[2] = 0x15;
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) != 0) {
    uVar2 = 0;
    do {
      cVar1 = (&DAT_00086dc8)[*(byte *)(DAT_00086df8 + uVar2 * 2 + 0x3e) & 0xf];
      param_1[uVar2] = cVar1;
      param_1[uVar2] = (*(byte *)(DAT_00086df8 + uVar2 * 2 + 0x3e) >> 4) + cVar1;
      uVar2 = uVar2 + 1 & 0xff;
    } while (uVar2 < (*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf));
  }
  return;
}




// was FUN_00066594 -- on level 7 only (DAT_00201b68==7), swaps the
// special floor texture between ids 0xc and 0xe via
// load_floor_texture_arenas as param_1 toggles on/off, then sets or
// clears bit 12 of the player status word at DAT_00086df8+0x61/0x62
// to record the current state. Called with a quest-flag byte
// (DAT_0023bc9c, set by apply_equipped_item_effect's opcode 0xd) and
// with a bit read back out of that same status word elsewhere -- exact
// narrative trigger (lava cooling/heating? a specific quest item?) not
// confirmed.
void update_level7_floor_hazard_state(param_1)
uint param_1;

{
  char cVar1;
  uint uVar2;
  
  if (DAT_00201b68 == 7) {
    cVar1 = -1;
    if (param_1 == 0) {
      if (DAT_0023adc0 == 0xc) {
        cVar1 = '\x0e';
      }
    }
    else if (DAT_0023adc0 != 0xc) {
      cVar1 = '\f';
    }
    if (-1 < cVar1) {
      /* BUG FIX: was `load_floor_texture_arenas()` with no arguments,
         relying on leftover register state -- cVar1 (just computed
         above, the new special-floor texture id 0xc/0xe) is the value
         that belongs here, matching load_floor_texture_arenas' own
         param_1 role (same dropped-argument bug class documented
         throughout this project). */
      load_floor_texture_arenas(cVar1);
    }
  }
  uVar2 = *(ushort *)(DAT_00086df8 + 0x61) & 0xefff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar2;
  *(byte *)(DAT_00086df8 + 0x62) = (byte)(uVar2 >> 8) | (byte)(((param_1 & 1) << 0xc) >> 8);
  return;
}




// was FUN_00066634 -- final step of refresh_player_equipment_effects:
// param_1 is the effect-flag bitmask accumulated by
// apply_equipped_item_effect's scan over equipped items (bit 0 unused,
// bits 1-3 each an independent penalty). For each set bit, reduces
// the player's stealth (DAT_00086db0, capped at 0x10/tick) or hide
// (DAT_00086db1, capped at 5 or 0x10/tick depending on which bit)
// threshold. Also adds a fixed per-slot offset into the DAT_0023be74
// scratch array (0-3, purpose not confirmed), then refreshes the
// level-7 floor hazard state and the HUD light-color indicator.
void apply_equipment_effect_penalties(param_1)
uint param_1;

{
  uint uVar1;
  uint uVar2;
  byte bVar3;
  byte bVar4;
  byte bVar5;
  undefined1 auStack_c [4];
  
  bVar4 = 0;
  bVar5 = DAT_00086db0;
  do {
    if ((param_1 & 1) != 0) {
      if (bVar4 == 1) {
        bVar3 = bVar5;
        if (0x10 < bVar5) {
          bVar3 = 0x10;
        }
        bVar5 = bVar5 - bVar3;
        DAT_00086db0 = bVar5;
      }
      else if (bVar4 == 2) {
        bVar3 = DAT_00086db1;
        if (5 < DAT_00086db1) {
          bVar3 = 5;
        }
        DAT_00086db1 = DAT_00086db1 - bVar3;
      }
      else if (bVar4 == 3) {
        bVar3 = DAT_00086db1;
        if (0x10 < DAT_00086db1) {
          bVar3 = 0x10;
        }
        DAT_00086db1 = DAT_00086db1 - bVar3;
      }
    }
    bVar4 = bVar4 + 1;
    uVar1 = param_1 & 0xffff;
    param_1 = uVar1 >> 1;
  } while (bVar4 < 4);
  uVar2 = 0;
  do {
    *(byte *)(uVar2 + DAT_0023be74) = ((byte)(uVar1 >> 5) & 0xf) + *(char *)(uVar2 + DAT_0023be74);
    uVar2 = uVar2 + 1 & 0xff;
  } while (uVar2 < 4);
  update_level7_floor_hazard_state(DAT_0023bc9c);
  compute_light_source_colors(auStack_c);
  update_light_source_color_icons(auStack_c);
  return;
}




// ARM 0x6674c calculates armor protection from OBJECTS.DAT and item quality.
// Its table starts at item 0x20; the old separate backing array never loaded
// those protection values. Keep the existing function name for its callers.

// was FUN_0006674c
int compute_object_weight(param_1)
ushort * param_1;

{
  ushort uVar1;
  int iVar2;
  
  uVar1 = *param_1;
  if (((uVar1 & 0x1c0) == 0) && ((uVar1 & 0x30) < 0x20)) {
    iVar2 = 0;
  }
  else {
    iVar2 = (((int)((uint)(byte)(&DAT_00202750)[(uVar1 & 0x1ff) * 4 - 0x80] * ((byte)param_1[2] & 0x3f)) >>
             6) + 1) * 0x10000 >> 0x10;
  }
  return iVar2;
}




// was FUN_0006907c -- starts a smooth camera transition: sets the
// "turn animation in flight" flag (DAT_0023bea8, gates
// update_current_view_from_subject's own per-tick facing interpolation),
// resets the camera-shake accumulators, forces a resync, and computes
// an eye-height bob offset from the player's landing/jump state.
// Called after teleporting the player (set_player_tile_position) or
// other position changes that should ease the view in rather than
// snap it.
void trigger_view_transition()

{
  int uw_ord2005_rem_126 = 0;
  uint uVar1;
  char cVar2;
  char cVar3;
  ushort uVar4;
  undefined4 uVar5;
  int extraout_r1;
  uint uVar6;
  char *iVar7;
  byte bVar8;
  short sVar9;
  bool bVar10;
  
  cVar3 = '\x01';
  DAT_0023bea8 = 1;
  bVar8 = 1;
  set_pending_update_flags(2);
  DAT_0023be9e = 0;
  DAT_0023be9c = 0;
  DAT_0023be9a = 0;
  if (((*(byte *)(DAT_00086df8 + 0xb8) & 0x11) != 0) &&
     (sVar9 = -(ushort)*(byte *)(DAT_00086df8 + 0xb9), DAT_0023be98 = sVar9,
     0x50 < *(byte *)(DAT_00086df8 + 0xb9))) {
    iVar7 = (int)g_jump_ascent_timer;
    cVar2 = ordint_divmod((int)DAT_00202078 >> 1,(int)(iVar7) << 2).quot;
    cVar3 = (char)(cVar2 + -3);
    if ((cVar2 + -3) * 0x1000000 >> 0x18 < 1) {
      cVar3 = '\x01';
    }
    bVar8 = DAT_0023bf18 >> 4;
    if (iVar7 == 0) {
      uVar4 = ce_rand();
      DAT_0023be9e = (uVar4 & 0x1ff) - 0x100;
      sVar9 = DAT_0023be98;
    }
    else {
      DAT_0023be9e = (short)(char)(&DAT_00086e58)[(char)bVar8] * (short)cVar3 * 0x40;
    }
    DAT_0023be98 = sVar9 + (short)(char)(&DAT_00086e58)[(int)(char)bVar8 + 2U & 0xf] * (short)cVar3
                           * 2;
    uVar4 = ce_rand();
    /* HACK: replace ARM's per-tick random water yaw with three smooth
       sine waves at 0.55, 1.1 and 1.9 Hz. The shared game clock uses
       4 ms units, so phase depends on elapsed time, not tick count.
       Weights sum to 64, retaining the original speed-scaled amplitude.
       Keep the random draw above so subsequent effects keep their RNG
       sequence. This changes only water yaw, not the player heading. */
    {
      double phase = (double)uw_frame_clock_ms() * 0.004 * 6.283185307179586;
      DAT_0023be9a = (short)((32.0 * sin(phase * 0.55) +
                             20.0 * sin(phase * 1.1) +
                             12.0 * sin(phase * 1.9)) * (short)cVar3);
    }
    uVar4 = ce_rand();
    DAT_0023be9c = ((uVar4 & 0x7f) - 0x40) * (short)cVar3;
  }
  if (((*(byte *)(DAT_00086df8 + 0xb8) & 2) != 0) && (DAT_0023bc98 == 0)) {
    uVar5 = ce_rand();
    uw_ord2005_rem_126 = ((int)(uVar5)) % (5);
    if (uw_ord2005_rem_126 == 0) {
      apply_typed_damage_to_object(g_player_object,0,0,0,1,8);
    }
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 8) != 0) {
    uVar6 = 0x10 - (DAT_0023bf18 >> 3);
    uVar1 = (int)uVar6 >> 0x1f;
    DAT_0023be98 = (short)(((uVar6 ^ uVar1) - uVar1) * 0x10000 >> 0x10) * 3;
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 0x60) != 0) {
    iVar7 = DAT_00086df8;
    if ((*(byte *)(DAT_00086df8 + 0xb8) & 0x40) != 0) {
      bVar10 = DAT_0023bf14 == '\0';
      DAT_0023bf14 = DAT_0023bf14 + -1;
      if (bVar10) {
        *(byte *)(DAT_00086df8 + 0xb8) = *(byte *)(DAT_00086df8 + 0xb8) ^ 0x40;
        set_pending_update_flags(2);
      }
      iVar7 = DAT_00086df8;
      cVar3 = ordint_divmod(10,DAT_0023bf14).quot;
      if ('\b' < cVar3) {
        cVar3 = '\b';
      }
    }
    if ((*(byte *)(iVar7 + 0xb8) & 0x20) != 0) {
      bVar10 = DAT_0023bf10 == 0;
      DAT_0023bf10 = DAT_0023bf10 - 1;
      if (bVar10) {
        *(byte *)(iVar7 + 0xb8) = *(byte *)(iVar7 + 0xb8) ^ 0x20;
        set_pending_update_flags(2);
      }
      bVar8 = DAT_0023bf10 >> 3;
      if (3 < bVar8) {
        bVar8 = 3;
      }
    }
    cVar3 = bVar8 + cVar3;
    uVar4 = ce_rand();
    DAT_0023be9a = ((uVar4 & 0xff) - 0x80) * (short)cVar3 + DAT_0023be9a;
    uVar4 = ce_rand();
    DAT_0023be9c = ((uVar4 & 0x7f) - 0x40) * (short)cVar3 + DAT_0023be9c;
    uVar4 = ce_rand();
    DAT_0023be9e = ((uVar4 & 0x1ff) - 0x100) * (short)cVar3 + DAT_0023be9e;
  }
  return;
}



// was FUN_00069424 -- sets a movement-animation sub-timer
// (DAT_0023bf10 for param_1==0x20 "landing", DAT_0023bf14 for
// param_1==0x40 "jump") to param_2 and ORs the corresponding bit into
// the player's landing-state status byte (DAT_00086df8+0xb8).
void set_movement_animation_timer(param_1,param_2)
byte param_1;
undefined1 param_2;

{
  undefined1 *puVar1;
  
  if (param_1 == 0x20) {
    puVar1 = &DAT_0023bf10;
  }
  else {
    if (param_1 != 0x40) {
      return;
    }
    puVar1 = &DAT_0023bf14;
  }
  *puVar1 = param_2;
  *(byte *)(DAT_00086df8 + 0xb8) = *(byte *)(DAT_00086df8 + 0xb8) | param_1;
  return;
}



// Writes g_current_view (world x/y/elevation/facing + camera-shake
// offsets) from whichever object DAT_0023b82c currently designates as
// the view subject -- the player object (the common case), a specific
// NPC/mobile object being looked at, or none (falls back to saved
// DAT_0023be90-family scratch values). NOT the same function as
// sync_camera_from_player below (was FUN_00069938), which goes the
// other direction: g_current_view -> the DAT_000db438-family 3D camera
// globals. Distinct names matter here since this file already had two
// functions colliding on this name before this rename.
void update_current_view_from_subject()

{
  int iVar1;
  undefined2 uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  short local_c;
  short local_a;

  if (DAT_0023b82c == g_player_object) {
    g_current_view->view_x = DAT_00204880;
    g_current_view->view_y = DAT_00204882;
    g_current_view->view_elevation = DAT_00204884 + 0xa4;
    g_current_view->view_facing = DAT_00201c70;
    g_current_view->view_shake_x = DAT_0023beb4;
    g_current_view->view_shake_y = DAT_0023beb8;
    if (DAT_0023bea8 == 0) {
      return;
    }
    if (getenv("UW_DEBUG_EYEHEIGHT"))
      fprintf(stderr, "[eyeheight] bea8=%d be98=%d base=%d -> %d\n",
              (int)DAT_0023bea8, (int)DAT_0023be98, (int)g_current_view->view_elevation,
              (int)(g_current_view->view_elevation + DAT_0023be98));
    g_current_view->view_elevation = g_current_view->view_elevation + DAT_0023be98;
    if (1000 < g_current_view->view_elevation) {
      g_current_view->view_elevation = 1000;
    }
    g_current_view->view_facing = g_current_view->view_facing + DAT_0023be9a;
    g_current_view->view_shake_x = g_current_view->view_shake_x + DAT_0023be9c;
    sVar4 = g_current_view->view_shake_y + DAT_0023be9e;
LAB_00069910:
    g_current_view->view_shake_y = sVar4;
  }
  else {
    if (DAT_0023b82c == 0) {
      g_current_view->view_x = DAT_0023be90;
      g_current_view->view_elevation = DAT_0023be94;
      g_current_view->view_y = DAT_0023be92;
      g_current_view->view_facing = DAT_0023bf00;
      g_current_view->view_shake_x = DAT_0023bf02;
      uVar2 = DAT_0023bf04;
    }
    else {
      if (DAT_002046b8 < DAT_0023b82c) {
        g_current_view->view_x =
             (short)((*(ushort *)(DAT_0023b82c + 0x16) & 0xfc00) >> 2) +
             (ushort)(*(byte *)(DAT_0023b82c + 3) & 0xe0);
        g_current_view->view_y =
             (*(byte *)(DAT_0023b82c + 3) & 0x1c) * 8 +
             (*(ushort *)(DAT_0023b82c + 0x16) & 0x3f0) * 0x10;
        g_current_view->view_elevation = ((*(byte *)(DAT_0023b82c + 2) & 0x7f) + 0x16) * 8;
        g_current_view->view_facing =
             ((*(ushort *)(DAT_0023b82c + 2) & 0xff80) +
             (short)(((*(byte *)(DAT_0023b82c + 0x18) & 0x1f) << 0x12) >> 0x10)) * 0x40;
        return;
      }
      if (DAT_0023b82c != DAT_002046b8 - 0x1b) {
        if (DAT_0023b82c != DAT_002046b8 - 0x36) {
          return;
        }
        angle_to_screen_delta(DAT_0023bea4,&local_a,&local_c);
        iVar1 = (int)((0x40 - (uint)DAT_0023bf08) * 0x10000) >> 0x10;
        iVar5 = (int)local_a;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0xff;
        }
        iVar5 = (short)((uint)iVar5 >> 8) * iVar1;
        iVar3 = (int)local_c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0x3f;
        }
        if (iVar3 < 0) {
          iVar3 = iVar3 + 0xff;
        }
        iVar1 = (short)((uint)iVar3 >> 8) * iVar1;
        if (iVar1 < 0) {
          iVar1 = iVar1 + 0x3f;
        }
        iVar5 = (int)DAT_0023bea0 * (int)(short)(iVar5 >> 6);
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        g_current_view->view_x =
             (short)(iVar5 >> 1) + (short)(((uint)DAT_0023beac << 0x18) >> 0x10) + 0x80;
        iVar1 = (int)DAT_0023bea0 * (int)(short)(iVar1 >> 6);
        if (iVar1 < 0) {
          iVar1 = iVar1 + 1;
        }
        g_current_view->view_y =
             (short)(iVar1 >> 1) + (short)(((uint)DAT_0023beb0 << 0x18) >> 0x10) + 0x80;
        g_current_view->view_elevation = DAT_00204884 + (0x52 - DAT_0023bf08) * 2;
        g_current_view->view_facing = DAT_0023bea4 + 0x7fff;
        g_current_view->view_shake_x = 0;
        sVar4 = DAT_0023bf08 << 0xb;
        goto LAB_00069910;
      }
      angle_to_screen_delta((int)DAT_00201c70,&local_c,&local_a);
      g_current_view->view_x = DAT_00204880 - (local_c >> 7);
      g_current_view->view_y = DAT_00204882 - (local_a >> 7);
      g_current_view->view_elevation = DAT_00204884 + 0x148;
      g_current_view->view_facing = DAT_00201c70;
      g_current_view->view_shake_x = DAT_0023beb4;
      uVar2 = DAT_0023beb8;
    }
    g_current_view->view_shake_y = uVar2;
  }
  return;
}



// was FUN_00069938 -- sync the 3D camera globals (DAT_000db438.. position,
// DAT_000db448 pitch / DAT_000db44c yaw) from the player object DAT_00086e6c
// (pos at +10/+0x12, view angle at +0x2c), applying the DAT_0023b4a0 screen
// -rotation quadrant. Called from build_frame_draw_list each redraw.
void sync_camera_from_player()

{
  char cVar1;
  ushort uVar2;
  ushort uVar3;
  intptr_t iVar4; // holds DAT_00086e6c (a real pointer); was `int`, truncating it
  ushort uVar5;
  int iVar6;
  ushort uVar7;
  short sVar8;
  ushort local_20;

  cVar1 = DAT_0023b4a0;
  iVar4 = DAT_00086e6c;
  sVar8 = 0;
  uVar2 = g_current_view->view_x & 0xff;
  uVar5 = g_current_view->view_y & 0xff;
  uVar3 = uVar2;
  uVar7 = uVar5;
  if (DAT_0023b4a0 != '\0') {
    if (DAT_0023b4a0 == '\x01') {
      uVar3 = 0xff - uVar5;
      uVar7 = uVar2;
    }
    else if (DAT_0023b4a0 == '\x02') {
      uVar3 = 0xff - uVar2;
      uVar7 = 0xff - uVar5;
    }
    else {
      uVar3 = local_20;
      uVar7 = local_20;
      if (DAT_0023b4a0 == '\x03') {
        uVar3 = uVar5;
        uVar7 = 0xff - uVar2;
      }
    }
  }
  DAT_000db438 = ordfloat_int_to_float2((int)DAT_0023bf30 + (int)(short)uVar3 + 0x1000);
  DAT_000db43c = ordfloat_int_to_float2((int)*(short *)(iVar4 + 0xe) + (int)DAT_0023bf34);
  DAT_000db440 = ordfloat_int_to_float2((int)DAT_0023bf38 + (int)(short)uVar7);
  iVar6 = (int)DAT_0023beb4;
  if (iVar6 == 0) {
    DAT_000db448 = 0;
  }
  else if (iVar6 < 1) {
    if (iVar6 < 0) {
      iVar6 = iVar6 + 0xff;
    }
    DAT_000db448 = (iVar6 >> 8) + (int)DAT_0023bf3c + 0x168;
  }
  else {
    if (iVar6 < 0) {
      iVar6 = iVar6 + 0xff;
    }
    DAT_000db448 = (iVar6 >> 8) + (int)DAT_0023bf3c;
  }
  /* Hack - Testing: UW_HACK_PITCH overrides the camera pitch angle
     (index into the sin/cos tables, 0..360). DAT_0023beb4 / DAT_0023bf3c
     come out 0 with nothing driving the look-up/down, so the 3D view
     looks dead level and the floor you are standing on projects entirely
     below the viewport. A downward pitch (~300-340) brings it into view
     for testing -- the real look pitch source is still unrecovered. */
  { const char *_p = getenv("UW_HACK_PITCH"); if (_p) DAT_000db448 = atoi(_p); }
  if (cVar1 == '\0') {
    sVar8 = *(short *)(iVar4 + 0x2c);
  }
  else if (cVar1 == '\x01') {
    sVar8 = *(short *)(iVar4 + 0x2c) + -0x4000;
  }
  else if (cVar1 == '\x02') {
    sVar8 = *(short *)(iVar4 + 0x2c) + -0x8000;
  }
  else if (cVar1 == '\x03') {
    sVar8 = *(short *)(iVar4 + 0x2c) + 0x4000;
  }
  if (sVar8 < 1) {
    /* Ghidra dropped the dividend: this is the 16-bit view angle sVar8
       converted to degrees, angle / 180 (0xb4). Without sVar8 passed
       the divide ran on a leftover register -> yaw came out 0/360 ->
       identity view rotation -> every tile projected behind the near
       plane. */
    iVar4 = ordint_divmod(0xb4, (int)sVar8).quot;
    DAT_000db44c = iVar4 + DAT_0023bf40 + 0x168;
  }
  else {
    iVar4 = ordint_divmod(0xb4, (int)sVar8).quot;
    DAT_000db44c = iVar4 + DAT_0023bf40;
  }
  /* Always-on (no env var) position/heading debug print, for correlating
     a live playtester's exact standing spot/facing with what the
     decompile is doing -- e.g. pinning down the wall-decal depth/
     parallax issue. First cut read the coarse per-tile position cached in
     g_player_object (the player object, +0x16, only updated on tile-boundary
     crossings) the same way demomode.c's own "player tile" TELEPORT/REVEAL
     print does -- not fine-grained enough (whole tiles only). Switched to
     DAT_00204880/82 (X/Y) and DAT_00204884 (Z), the true continuously-
     updated fine-grained player position, format (tile<<8)|fine, 256
     units/tile -- confirmed via commit_player_move's own tile-index
     derivation from these exact fields. Pitch is degrees, 0-360, an index
     into the DAT_000d9ed8/DAT_000d9930 sin/cos tables (same convention
     emit_tile_objects's decal-angle override uses).
     Yaw is NOT read from DAT_000db44c (this function's own "camera yaw"
     local a few lines up) -- confirmed live (both by a full real-turning
     sweep and by direct screenshot diffing at yaw 0/90/180/270, which
     render as 4 genuinely different views despite DAT_000db44c reporting
     near-identical values for all of them) that DAT_000db44c is only the
     small residual *within* whichever 90-degree quadrant DAT_0023b4a0
     already rotated the camera's world-space axes into a few lines above
     (cVar1's branches) -- not the true compass heading. DAT_0023bf40, the
     field that would need to add the quadrant's own 90*n back in to
     reconstruct the full angle, has no writer anywhere in this decompile
     (permanently 0), so DAT_000db44c alone folds every quarter-turn back
     on top of the others. The renderer itself works around this by also
     pre-rotating world-space positions via that same DAT_0023b4a0 (see
     this function's own uVar3/uVar7 swaps above) rather than relying on
     DAT_000db44c for the coarse direction, which is why the actual 3D
     view rotates correctly even though DAT_000db44c doesn't reflect it --
     but anything that reads DAT_000db44c directly as if it *were* the
     full yaw (this print, previously) reports nonsense above/below one
     quadrant. DAT_00201c70 (the player's own persistent yaw, 65536
     units/360 degrees -- the same field SETPLAYERPOS writes and ordinary
     turning increments by 0x2000/45 degrees) is the real, un-folded full
     compass heading; convert it directly instead. Throttled to print
     only on change. Set UW_QUIET_POSDEBUG=1 to silence it. */
  if (!getenv("UW_QUIET_POSDEBUG")) {
    static int _last_x = -1, _last_y = -1, _last_z = -1, _last_yaw = -1, _last_pitch = -1;
    int _x = (unsigned short)DAT_00204880;
    int _y = (unsigned short)DAT_00204882;
    int _z = (short)DAT_00204884;
    int _yaw = (int)lround(fmod((double)(unsigned short)DAT_00201c70 * (360.0 / 65536.0), 360.0));
    if (_x != _last_x || _y != _last_y || _z != _last_z ||
        _yaw != _last_yaw || DAT_000db448 != _last_pitch) {
      _last_x = _x; _last_y = _y; _last_z = _z;
      _last_yaw = _yaw; _last_pitch = DAT_000db448;
      fprintf(stderr, "[playerpos] tile=(%.2f,%.2f) z=%d yaw=%d pitch=%d\n",
              _x / 256.0, _y / 256.0, _z, _yaw, (int)DAT_000db448);
    }
  }
  return;
}




// was FUN_00069b68 -- the game's general skill-check roll: rolls a
// random value mod 31, offsets it by (param_1 - param_2) (typically a
// skill/stat value minus a difficulty threshold), and buckets the
// result into -1 (critical failure, <3), 0 (failure, 3-15), 1
// (success, 16-28), or 2 (critical success, >=29). Used throughout
// combat, item use, object interaction, and babl conversation scripts
// for stealth/lockpicking/attack/persuasion-style checks against a
// player skill byte.
undefined4 roll_skill_check(param_1,param_2)
int param_1;
int param_2;

{
  int uw_ord2005_rem_127 = 0;
  int iVar1;
  undefined4 uVar2;
  short extraout_r1;
  
  uVar2 = ce_rand();
  uw_ord2005_rem_127 = ((int)(uVar2)) % (0x1f);
  iVar1 = ((uw_ord2005_rem_127 - param_2) + param_1) * 0x10000 >> 0x10;
  if (iVar1 < 0x1d) {
    if (iVar1 < 0x10) {
      uVar2 = 0;
      if (iVar1 < 3) {
        uVar2 = 0xffffffff;
      }
    }
    else {
      uVar2 = 1;
    }
  }
  else {
    uVar2 = 2;
  }
  return uVar2;
}




// was FUN_00069bd0 -- add param_1 experience points to the character
// (DAT_00086df8 + 0x4e), capped per call, and run advance_character_level
// when the orduint_divmod(500) threshold is crossed.
void grant_experience_points(param_1)
short param_1;

{
  byte bVar1;
  uint uVar2;
  uint uVar3;
  short sVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  char *iVar8;
  
  iVar8 = DAT_00086df8;
  iVar7 = (int)param_1;
  if (iVar7 < 0) {
    uVar2 = *(uint *)(DAT_00086df8 + 0x4e);
    if ((uint)-iVar7 < uVar2 || -uVar2 == iVar7) {
      iVar7 = uVar2 + iVar7;
    }
    else {
      iVar7 = 0;
    }
    *(char *)(DAT_00086df8 + 0x4e) = (char)iVar7;
    *(char *)(DAT_00086df8 + 0x4f) = (char)((uint)iVar7 >> 8);
    *(char *)(DAT_00086df8 + 0x50) = (char)((uint)iVar7 >> 0x10);
    *(char *)(DAT_00086df8 + 0x51) = (char)((uint)iVar7 >> 0x18);
  }
  else if (*(uint *)(DAT_00086df8 + 0x4e) < 0x17701) {
    if ((DAT_00201b68 + 1) * 2 < (int)(uint)*(byte *)(DAT_00086df8 + 0x3d)) {
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      param_1 = (short)(iVar7 >> 1) + 1;
    }
    sVar4 = orduint_divmod(3000,*(uint *)(DAT_00086df8 + 0x4e) + (int)param_1).quot;
    if ((short)(ushort)*(byte *)(iVar8 + 0x53) < sVar4) {
      *(byte *)(iVar8 + 0x52) = ((char)sVar4 - *(byte *)(iVar8 + 0x53)) + *(char *)(iVar8 + 0x52);
      *(char *)(DAT_00086df8 + 0x53) = (char)sVar4;
      iVar8 = DAT_00086df8;
    }
    uVar2 = *(uint *)(iVar8 + 0x4e);
    iVar7 = uVar2 + (int)param_1;
    *(char *)(iVar8 + 0x4e) = (char)iVar7;
    *(char *)(DAT_00086df8 + 0x4f) = (char)((uint)iVar7 >> 8);
    *(char *)(DAT_00086df8 + 0x50) = (char)((uint)iVar7 >> 0x10);
    *(char *)(DAT_00086df8 + 0x51) = (char)((uint)iVar7 >> 0x18);
    iVar8 = DAT_00086df8;
    iVar7 = 0;
    uVar3 = *(uint *)(DAT_00086df8 + 0x4e);
    sVar4 = orduint_divmod(500).quot;
    uVar5 = (uint)*(byte *)(iVar8 + 0x3d);
    bVar1 = (&DAT_00086e87)[uVar5];
    uVar6 = uVar5;
    while (((short)(ushort)bVar1 <= sVar4 && ((int)uVar6 < 0x10))) {
      iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
      uVar6 = iVar7 + uVar5;
      bVar1 = (&DAT_00086e87)[uVar6];
    }
    if ((short)iVar7 != 0) {
      advance_character_level(iVar7);
    }
    if ((uint)(int)(short)(uVar2 >> 4) < uVar3 >> 4) {
      refresh_experience_display();
    }
  }
  return;
}



// was FUN_00069e30 -- redraws the stats panel's experience/level
// progress indicator, but only when that panel (g_active_hud_panel==2)
// is currently the active HUD view. Called from grant_experience_points
// and other stat-changing paths whenever a display-relevant XP/level
// boundary is crossed.
void refresh_experience_display()

{
  if (g_active_hud_panel == '\x02') {
    *g_draw_color_index = 0xf1;
    *DAT_00084298 = 0xf1;
    decrement_cursor_hide_depth();
    select_active_font(s_font5x6i_sys_00086e98);
    if (DAT_0024af8c != 0) {
      /* Ghidra dropped the arg here (relying on register carryover from
         the `!= 0` compare) -- same class of bug fixed throughout this
         session. DAT_0024af8c is the grtile key allocated in
         draw_stats_panel_content (uw.c), passed explicitly here. */
      restore_captured_grtile_backdrop(DAT_0024af8c);
    }
    draw_hp_stat_display();
    draw_mana_stat_display();
    draw_experience_points_display();
    select_active_font(s_font5x6p_sys_0008430c);
    cursor_show_idle_tick();
  }
  return;
}







// was FUN_00070224 -- update_screen_flicker_effect's "sub-effect 2"
// driver: param_1==0 restores the light remap table by reloading
// LIGHT.DAT/MONO.DAT (mirroring load_light_tables' own load), param_1!=0
// zeroes its first 16 entries instead, producing the visual light
// distortion the flicker effect uses.
void toggle_light_table_flicker(param_1)
int param_1;

{
  char stack0xffdc324c_buf [256];
  char *stack0xffdc324c_ptr;
  char cVar1;
  int iVar2;
  char *pcVar3;
  char acStack_10c [260];
  
  if (param_1 == 0) {
    pcVar3 = &DAT_0023cca8;
    stack0xffdc324c_ptr = stack0xffdc324c_buf;
    do {
      cVar1 = *pcVar3;
      *stack0xffdc324c_ptr = cVar1; stack0xffdc324c_ptr = stack0xffdc324c_ptr + 1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    if (DAT_000872a0 == '\x05') {
      pcVar3 = s__DATA_mono_dat_000872b8;
    }
    else {
      pcVar3 = s__DATA_light_dat_000872c8;
    }
    ce_strcat(acStack_10c,pcVar3);
    iVar2 = open_file_for_read(acStack_10c);
    if (iVar2 != -1) {
      read_file_handle(iVar2,DAT_0024fa2c,0x1000);
      CloseHandle(iVar2);
    }
  }
  else {
    iVar2 = 0;
    do {
      *(undefined1 *)(DAT_0024fa2c + iVar2 * 0x100) = 0;
      *(undefined1 *)(DAT_0024fa2c + iVar2 * 0x100 + 1) = 0;
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 0x10);
  }
  return;
}






// was FUN_000703a0 -- recalculates maximum HP (30 + level * STR / 5),
// maximum mana ((casting skill + 1) * INT / 8), and carrying capacity
// (STR * 20, in tenths of a stone). Level 7 keeps normal maximum mana
// at +0xb0 while its special state occupies +0x38. A nonzero argument
// refills current mana from +0x38 during character creation.
undefined4 recalculate_player_stats(param_1)
int param_1;

{
  undefined1 uVar1;
  char cVar2;
  char *iVar3;
  uint carry_capacity;
  
  iVar3 = DAT_0023be74;
  cVar2 = ordint_divmod(5,(uint)*(byte *)(DAT_00086df8 + 0x3d) * (uint)*(byte *)(DAT_0023be74 + 5)).quot;
  *(char *)(iVar3 + 4) = cVar2 + '\x1e';
  uVar1 = (undefined1)
          ((int)((*(byte *)(DAT_00086df8 + 0x28) + 1) * (uint)*(byte *)(DAT_0023be74 + 7)) >> 3);
  if (DAT_00201b68 == 7) {
    *(undefined1 *)(DAT_00086df8 + 0xb0) = uVar1;
  }
  else {
    *(undefined1 *)(DAT_00086df8 + 0x38) = uVar1;
  }
  carry_capacity = (uint)*(byte *)(DAT_0023be74 + 5) * 0x14;
  *(char *)(DAT_00086df8 + 0x4c) = (char)carry_capacity;
  *(char *)(DAT_00086df8 + 0x4d) = (char)(carry_capacity >> 8);
  if (param_1 != 0) {
    *(undefined1 *)(DAT_00086df8 + 0x37) = *(undefined1 *)(DAT_00086df8 + 0x38);
  }
  return 0;
}



// was FUN_00070464 -- raise the character level byte (DAT_00086df8 + 0x3d)
// by param_1, show the "attained experience level N" scroll message, and
// bump the dependent stat at +0x52.
void advance_character_level(param_1)
char param_1;

{
  int uw_ord2005_rem_138 = 0;
  char *iVar1;
  char cVar2;
  int extraout_r1;
  
  *(char *)(DAT_00086df8 + 0x3d) = *(char *)(DAT_00086df8 + 0x3d) + param_1;
  iVar1 = DAT_00086df8;
  if (*(byte *)(DAT_00086df8 + 0x3d) < 10) {
    DAT_0008730c = ' ';
  }
  else {
    cVar2 = ordint_divmod(10).quot;
    DAT_0008730c = cVar2 + '0';
  }
  uw_ord2005_rem_138 = ((int)(*(undefined1 *)(iVar1 + 0x3d))) % (10);
  DAT_0008730d = (undefined1)((uint)((uw_ord2005_rem_138 + 0x30) * 0x1000000) >> 0x18);
  print_scroll_message_by_id(0x93);
  message_scroll_print_wrapped(&DAT_0008730c);
  *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + param_1;
  recalculate_player_stats(0);
  refresh_stats_panel_if_active();
  return;
}



// was FUN_00070524 -- 3-way tier classifier: param_1<7 -> tier 0,
// param_1>9 -> tier 1, otherwise (7..9) -> tier 2. Its result indexes
// DAT_0023be74 (the player's class base-stat row) to pick a tier's
// base training value -- called by both advance_skill_training and
// roll_skill_use_improvement with their own skill-index parameter
// (advance_skill_training's call site was missing this argument, a
// dropped-argument bug fixed there once roll_skill_use_improvement's
// sibling call confirmed the correct value to pass).
undefined4 classify_skill_training_tier(param_1)
short param_1;

{
  undefined4 uVar1;
  
  if (param_1 < 7) {
    uVar1 = 0;
  }
  else {
    uVar1 = 2;
    if (9 < param_1) {
      uVar1 = 1;
    }
  }
  return uVar1;
}



// was FUN_00070548 -- advances the skill/combat-category progress byte
// at DAT_00086df8[param_1+0x21] (one of the per-skill bytes babl.c's
// own "play_arms" variable sums, see its comment) toward its 30 (0x1e)
// cap: a flat increment (larger the first time the byte is still 0),
// a class-scaled random bonus (via classify_skill_training_tier and the
// player's class stat row DAT_0023be74), and 2-3 roll_skill_check rolls.
void advance_skill_training(param_1)
short param_1;

{
  int iVar1;
  undefined1 uVar2;
  char cVar3;
  short sVar4;
  /* iVar5 doubles as a real pointer (DAT_00086df8 + iVar1) early on
     and a plain int loop counter (from sVar7) later -- mutually
     exclusive, but both squeezed into `int`, truncating the pointer. */
  char *pcVar_df8;
  int iVar5;
  undefined2 uVar6;
  short sVar7;

  iVar1 = (int)param_1;
  if (*(char *)(iVar1 + DAT_00086df8 + 0x21) == '\0') {
    cVar3 = '\x03';
    uVar6 = 9;
    sVar7 = 3;
  }
  else {
    cVar3 = '\x01';
    uVar6 = 0xd;
    sVar7 = 2;
  }
  /* BUG FIX: was `classify_skill_training_tier()` with no argument --
     dropped by Ghidra (same "ARM register-leftover doesn't survive a
     literal recompile" idiom as every other dropped-argument bug in
     this file). Confirmed via the sibling call in
     roll_skill_use_improvement (was FUN_0007067c), which performs the
     exact same DAT_0023be74[tier+5]/DAT_00086df8[param_1+0x21] dance
     and explicitly passes its own skill-index parameter:
     `classify_skill_training_tier((int)param_1)`. Without this, the
     tier classification read whatever value was left over in the
     argument register, potentially indexing DAT_0023be74 with a wrong
     tier and applying the wrong class's training rate for this skill. */
  sVar4 = classify_skill_training_tier(param_1);
  uVar2 = *(undefined1 *)(DAT_0023be74 + sVar4 + 5);
  *(char *)(iVar1 + DAT_00086df8 + 0x21) = *(char *)(iVar1 + DAT_00086df8 + 0x21) + cVar3;
  pcVar_df8 = DAT_00086df8 + iVar1;
  cVar3 = ordint_divmod(uVar6,uVar2).quot;
  *(char *)(pcVar_df8 + 0x21) = cVar3 + *(char *)(pcVar_df8 + 0x21);
  iVar5 = (int)sVar7;
  cVar3 = rand_below(iVar5);
  *(char *)(iVar1 + DAT_00086df8 + 0x21) = *(char *)(iVar1 + DAT_00086df8 + 0x21) + cVar3;
  if (iVar5 != 0) {
    do {
      cVar3 = roll_skill_check(uVar2,0x14);
      *(char *)(iVar1 + 0x21 + DAT_00086df8) = *(char *)(iVar1 + 0x21 + DAT_00086df8) + cVar3;
      iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
    } while (0 < iVar5);
  }
  if (0x1e < *(byte *)(iVar1 + DAT_00086df8 + 0x21)) {
    *(undefined1 *)(iVar1 + DAT_00086df8 + 0x21) = 0x1e;
  }
  return;
}






// WARNING: Removing unreachable block (ram,0x00070700)

// was FUN_0007067c -- the "skill improves through use" roll: on a
// successful use of skill param_1, fails outright (returns false, no
// change) if the skill's current progress (DAT_00086df8[param_1+0x21])
// already exceeds double its class/tier's base value
// (classify_skill_training_tier + DAT_0023be74[tier+5]) or has hit 0x1d
// (29); otherwise increments the progress byte by 1 (plus a second +1
// for tier!=0 skills still under half that base value, plus a further
// ordint_divmod-randomized chance +1), capping the final result at 30
// (0x1e), and returns true. param_1==8 (a specific skill index) also
// refreshes a per-level cached value at DAT_00086df8+0xc2 for the
// current level.
undefined4 roll_skill_use_improvement(param_1)
char param_1;

{
  int iVar1;
  undefined1 uVar2;
  byte bVar3;
  short sVar4;
  undefined4 uVar5;
  int extraout_r1;
  uint uVar6;
  int iVar7;
  /* Was `int`, truncating the real 64-bit pointer `iVar1 + DAT_00086df8`
     (DAT_00086df8 is `char *`) down to 32 bits before it was dereferenced
     just below -- same pointer-truncation bug class as every other
     get_message_string/DAT_00086df8-pointer fix this session (see e.g.
     handle_mantra_chant's own pcVar_typed/pcVar_name fix just above this
     function, or refresh_player_equipment_effects's iVar7 fix). Confirmed
     live: a SIGSEGV dereferencing the truncated pointer, reached only
     when this skill's current training progress is still below its
     class-tier base (data-dependent -- not every roll_skill_use_improvement
     call takes this branch, which is why this crashed "SUMM RA" but not
     every mantra/skill-use roll). Reusing `iVar7` (already doing double
     duty as the tier index earlier in this function) for a pointer was
     the actual bug; split it into its own correctly-typed local instead. */
  char *pcVar_skillrow;
  undefined4 uVar8;

  uVar8 = 1;
  sVar4 = classify_skill_training_tier((int)param_1);
  iVar7 = (int)sVar4;
  uVar2 = (&DAT_00087308)[iVar7];
  iVar1 = (int)param_1;
  uVar6 = (uint)*(byte *)(iVar7 + DAT_0023be74 + 5);
  bVar3 = *(byte *)(iVar1 + DAT_00086df8 + 0x21);
  if ((uVar6 * 2 < (uint)bVar3) || (0x1d < bVar3)) {
    uVar8 = 0;
  }
  else {
    *(byte *)(iVar1 + DAT_00086df8 + 0x21) = bVar3 + 1;
    if (iVar7 != 0) {
      bVar3 = *(byte *)(iVar1 + DAT_00086df8 + 0x21);
      if ((uint)bVar3 < (uint)((int)uVar6 >> 1)) {
        *(byte *)(iVar1 + DAT_00086df8 + 0x21) = bVar3 + 1;
      }
    }
    if (*(byte *)(iVar1 + DAT_00086df8 + 0x21) < uVar6) {
      uVar5 = ce_rand();
      pcVar_skillrow = iVar1 + DAT_00086df8;
      bVar3 = *(byte *)(pcVar_skillrow + 0x21);
      extraout_r1 = ordint_divmod(uVar2,uVar5).rem;
      if (extraout_r1 < (int)(uVar6 - bVar3)) {
        *(byte *)(pcVar_skillrow + 0x21) = bVar3 + 1;
      }
    }
    if (0x1e < *(byte *)(iVar1 + DAT_00086df8 + 0x21)) {
      *(undefined1 *)(iVar1 + DAT_00086df8 + 0x21) = 0x1e;
    }
  }
  if (iVar1 == 8) {
    clear_temp_flags_on_all_objects();
    if (DAT_00201b68 < 9) {
      *(undefined1 *)(DAT_00201b68 + DAT_00086df8 + 0xc2) = *(undefined1 *)(DAT_00086df8 + 0x29);
    }
  }
  return uVar8;
}






// was FUN_000707c8 -- prints a single skill-improvement message:
// param_2==0 shows message 0x1b ("no improvement"), otherwise message
// 0x1c followed by param_1's skill name (resolved via
// get_message_string(param_1+0x1f|0x400), the skill-name string-id range).
void print_single_skill_improvement_message(param_1,param_2)
int param_1;
int param_2;

{
  if (param_2 == 0) {
    print_scroll_message_by_id(0x1b);
  }
  else {
    print_scroll_message_by_id(0x1c);
    get_message_string(param_1 + 0x1fU | 0x400);
    message_scroll_print_wrapped();
    message_scroll_print_wrapped(&DAT_00084f20);
  }
  return;
}



// was FUN_0007080c -- prints a comma/and-joined list of improved skill
// names from param_1 (a byte array of skill ids, -1-terminated, up to
// 4 entries): message 0x1e if the list is empty (*param_1==-1), else
// message 0x1d followed by each skill name, separated by DAT_00087318
// between middle entries and s_and_00087310 ("and") before the last.
// The comma/space separator is verified against UU.exe at 0x87318.
void print_skill_improvement_list(param_1)
char * param_1;

{
  char *pcVar1;
  int iVar2;
  
  if (*param_1 == -1) {
    print_scroll_message_by_id(0x1e);
  }
  else {
    print_scroll_message_by_id(0x1d);
    if (*param_1 != -1) {
      iVar2 = 0;
      do {
        if (3 < iVar2) break;
        if (iVar2 == 3) {
LAB_00070870:
          pcVar1 = s_and_00087310;
LAB_00070874:
          message_scroll_print_wrapped(pcVar1);
        }
        else if (iVar2 != 0) {
          if (param_1[iVar2 + 1] == -1) goto LAB_00070870;
          pcVar1 = &DAT_00087318;
          goto LAB_00070874;
        }
        get_message_string((byte)param_1[iVar2] + 0x1f | 0x400);
        message_scroll_print_wrapped();
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (param_1[iVar2] != -1);
    }
    message_scroll_print_wrapped(&DAT_00084f20);
  }
  return;
}






// was FUN_000708bc -- the "Chant the mantra" feature: prompts for a
// typed mantra word (scroll_text_entry_prompt), matches it against the
// known-mantra string table (string ids 0x33..0x4c via get_message_string,
// compared with ce_strcmp) and dispatches on which one matched:
// - ids 0x33..0x46 (iVar6<0x14): single-skill mantras, spending one
//   "mantra use" (DAT_00086df8+0x52) for two roll_skill_use_improvement
//   attempts on the mantra's associated skill.
// - id 0x47 (0x14): "nothing happens" NPC-reaction-shift flavor text.
// - id 0x48 (0x15): sets a one-time flag (DAT_00086df8+0x60 bit 6).
// - id 0x49 (0x16): another flavor-text-only outcome.
// - ids 0x4a-0x4c (0x17-0x19): "class" mantras rolling multiple
//   roll_skill_use_improvement attempts across a themed range of
//   skills (base/count/spread per id), printed via
//   print_skill_improvement_list.
// - no match ('M'/0x4d): "you don't know that mantra" (message 0x19).
//
// BUG FIX (crash when using a mantra): the matching loop's two locals
// holding _strupr's and get_message_string's return values were
// `undefined4` (32-bit) -- on this 64-bit host that truncated both
// real pointers down to their low 32 bits before ce_strcmp ever saw
// them, so ce_strcmp dereferenced a bogus, zero-extended address and
// crashed with SIGSEGV. This was unconditional: it crashed on the very
// first comparison (id 0x33) regardless of what the player typed, i.e.
// every single invocation of "Chant the mantra". Fixed by giving them
// their own correctly-sized `char *` locals (pcVar_name/pcVar_typed).
void handle_mantra_chant()

{
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  char cVar11;
  uint uVar12;
  short sVar13;
  char *pcVar_typed;
  char *pcVar_name;
  undefined1 local_60 [8];
  undefined1 local_58 [52];

  local_58[0] = 0;
  scroll_text_entry_prompt(s_Chant_the_mantra__0008731c,0,local_58,1,10);
  message_scroll_print_wrapped(&s_scroll_newline_0008522c);
  iVar10 = 0x33;
  do {
    /* uVar4/uVar5 were `undefined4` (32-bit) here, truncating _strupr's
       and get_message_string's real 64-bit pointer returns -- the same
       pointer-truncation bug class already fixed at dozens of other
       get_message_string call sites in this codebase (see player.c's
       other FUN_... comments, object_actions.c, chargen.c, babl.c).
       ce_strcmp then dereferenced the zero-extended, bogus low-32-bits
       pointer and crashed. Confirmed live: this crashed every "Chant
       the mantra" invocation with a SIGSEGV inside ce_strcmp. */
    pcVar_typed = (char *)_strupr(local_58);
    pcVar_name = get_message_string((int)(char)iVar10 | 0x400);
    iVar6 = ce_strcmp(pcVar_name,pcVar_typed);
    if (getenv("UW_DEBUG_MANTRA")) fprintf(stderr, "[mantra] id=0x%02x name='%s' typed='%s' cmp=%d\n", iVar10, pcVar_name, pcVar_typed, iVar6);
    if (iVar6 == 0) break;
    iVar10 = iVar10 + 1;
  } while (iVar10 * 0x1000000 >> 0x18 < 0x4d);
  if ((char)iVar10 == 'M') {
    print_scroll_message_by_id(0x19);
    goto LAB_00070b58;
  }
  iVar10 = iVar10 + -0x33;
  iVar6 = iVar10 * 0x1000000 >> 0x18;
  if (iVar6 < 0x14) {
    if (*(char *)(DAT_00086df8 + 0x52) == '\0') {
LAB_00070980:
      print_scroll_message_by_id(0x18);
    }
    else {
      iVar6 = roll_skill_use_improvement(iVar10);
      iVar7 = roll_skill_use_improvement(iVar10);
      if ((iVar6 == 0) && (iVar7 == 0)) {
LAB_000709e0:
        uVar4 = 0;
      }
      else {
        print_scroll_message_by_id(0x1a);
        *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + -1;
        if ((iVar6 == 0) && (iVar7 == 0)) goto LAB_000709e0;
        uVar4 = 1;
      }
      print_single_skill_improvement_message(iVar10 * 0x1000000 >> 0x18,uVar4);
    }
  }
  else {
    if (iVar6 == 0x14) {
      if ((*(byte *)(DAT_00086df8 + 0x60) & 0x80) == 0) {
        uVar4 = get_message_string(0x223);
        print_message_with_proximity_qualifier(uVar4,*(ushort *)((char *)g_player_object + 0x16) >> 10,
                     (*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4,(int)DAT_00201b68,0x18,0x2d,3,4
                    );
      }
LAB_00070c78:
      busy_wait_ms(0x20);
      return;
    }
    if (iVar6 == 0x15) {
      if (((*(byte *)(DAT_00086df8 + 0x60) & 0x40) == 0) &&
         (iVar10 = begin_holding_object_on_cursor(0,0xe1), iVar10 != 0)) {
        print_scroll_message_by_id(0x1e);
        uVar2 = *(undefined2 *)(DAT_00086df8 + 0x5f);
        *(char *)(DAT_00086df8 + 0x5f) = (char)uVar2;
        *(byte *)(DAT_00086df8 + 0x60) = (byte)((ushort)uVar2 >> 8) | 0x40;
      }
      goto LAB_00070c78;
    }
    if (iVar6 == 0x16) {
      print_scroll_message_by_id(0x1f);
      goto LAB_00070c78;
    }
    if (iVar6 == 0x17) {
      sVar13 = 0;
      cVar11 = '\a';
      sVar3 = 3;
    }
    else if (iVar6 == 0x18) {
      sVar13 = 7;
      cVar11 = '\x03';
      sVar3 = 2;
    }
    else {
      if (iVar6 != 0x19) goto LAB_00070c78;
      sVar13 = 10;
      cVar11 = '\n';
      sVar3 = 4;
    }
    if (*(char *)(DAT_00086df8 + 0x52) == '\0') goto LAB_00070980;
    local_60[0] = 0xff;
    uVar12 = 0;
    local_60[1] = 0xff;
    local_60[2] = 0xff;
    local_60[3] = 0xff;
    iVar10 = (int)cVar11;
    iVar6 = (int)sVar3;
    while ((iVar6 != 0 &&
           (cVar1 = (char)iVar10, iVar10 = (cVar1 + -1) * 0x1000000 >> 0x18, cVar1 != 0))) {
      if ((sVar13 == 7) &&
         ((*(byte *)(DAT_00086df8 + 0x28) < 8 && (uVar8 = ce_rand(), (uVar8 & 2) != 0)))) {
        iVar7 = 7;
      }
      else {
        iVar7 = rand_below(cVar11);
        iVar7 = (sVar13 + iVar7) * 0x1000000 >> 0x18;
      }
      iVar9 = roll_skill_use_improvement(iVar7);
      if (iVar9 != 0) {
        local_60[uVar12] = (char)iVar7;
        uVar12 = uVar12 + 1 & 0xff;
      }
      iVar6 = (iVar6 + -1) * 0x10000 >> 0x10;
    }
    print_skill_improvement_list(local_60);
    *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + -1;
  }
  recalculate_player_stats(0);
  refresh_stats_panel_if_active();
LAB_00070b58:
  refresh_player_equipment_effects();
  busy_wait_ms(0x20);
  reset_keyboard_char_input();
  noop_post_input_reset_hook();
  return;
}






// was FUN_00070c90 -- draws the full character-sheet text overlay
// (name, class, level, elapsed game time (DAT_00086df8+0xce, this
// project's already-documented game_time field), the 6 core attributes
// in a 3-column grid, and all 20 skill values in a 3x7 grid) on top of whatever
// background the caller already blit. Its one call site is the game-
// completion/victory sequence (after blitting win1.byt/win2.byt), so
// this is effectively the final character stats screen, though the
// drawing logic itself isn't victory-specific.
void render_endgame_character_stats()

{
  int uw_ord2005_rem_139 = 0; int uw_ord2005_rem_140 = 0; int uw_ord2005_rem_141 = 0; int uw_ord2005_rem_142 = 0;
  byte bVar1;
  short sVar2;
  char cVar3;
  undefined1 uVar4;
  byte bVar5;
  short sVar6;
  /* Was `undefined4`, truncating get_message_string's real char* return on
     this 64-bit host -- same bug class as the other get_message_string
     truncation fixes this session (e.g. character_generator_loop's uVar10). Used
     consistently as a string pointer everywhere else in this function
     (draw_text_string's first arg, ce_strcat's second arg), so retyping
     is a straightforward drop-in fix. */
  char *uVar7;
  char *pcVar8;
  int iVar9;
  undefined4 uVar10;
  char extraout_r1;
  char extraout_r1_00;
  short extraout_r1_01;
  char *pcVar11;
  int extraout_r1_02;
  char *iVar12;
  int iVar13;
  char *iVar14;
  short local_70;
  undefined1 auStack_68 [16];
  char local_58 [52];

  select_active_font(s_fontchar_sys_00087330);
  *DAT_00084298 = 0x5c;
  *g_draw_color_index = 0x5c;
  uVar7 = get_message_string((int)DAT_00201c74);
  /* Was `measure_text_width()` with no argument -- see draw_text_string/
     measure_text_width's own comments above for the root "dropped argument"
     bug this matches; uVar7 (the string get_message_string just returned) is
     right here, so pass it explicitly instead of hoping it's still
     sitting in the right register. */
  sVar6 = measure_text_width(uVar7);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(uVar7,0xa0 - (short)((int)(iVar12) >> 1),0x14);
  pcVar8 = (char *)get_message_string(699);
  pcVar11 = local_58;
  do {
    cVar3 = *pcVar8;
    pcVar8 = pcVar8 + 1;
    *pcVar11 = cVar3;
    pcVar11 = pcVar11 + 1;
  } while (cVar3 != '\0');
  sVar6 = ce_strlen(local_58);
  iVar12 = DAT_00086df8;
  if (9 < *(byte *)(DAT_00086df8 + 0x3d)) {
    cVar3 = ordint_divmod(10).quot;
    local_58[sVar6] = cVar3 + '0';
    sVar6 = (short)((uint)((sVar6 + 1) * 0x10000) >> 0x10);
  }
  uw_ord2005_rem_139 = ((int)(*(undefined1 *)(iVar12 + 0x3d))) % (10);
  local_58[sVar6] = uw_ord2005_rem_139 + '0';
  iVar13 = (sVar6 + 1) * 0x10000 >> 0x10;
  local_58[iVar13] = ' ';
  local_58[(iVar13 + 1) * 0x10000 >> 0x10] = '\0';
  uVar7 = get_message_string((*(byte *)(iVar12 + 100) >> 5) + 0x17 | 0x400);
  ce_strcat(local_58,uVar7);
  iVar13 = *(short *)(DAT_000879b0 + 6) + 0x14;
  sVar6 = measure_text_width(local_58);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(local_58,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  uVar7 = get_message_string(700);
  iVar13 = *(short *)(DAT_000879b0 + 6) + iVar13;
  sVar6 = measure_text_width(uVar7);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(uVar7,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  /* First argument is NOT the address of a global despite how this
     first decompiled (`&DAT_001c2000`) -- see
     print_character_description_scroll's identical call in hud.c for
     the real-disassembly explanation (ARM's split-immediate idiom for
     the plain literal 0x1c2000, misread as a data reference). */
  sVar6 = orduint_divmod(0x1c2000,*(undefined4 *)(DAT_00086df8 + 0xce)).quot;
  sVar6 = ordint_divmod(0xc,(int)sVar6).quot;
  pcVar8 = (char *)get_message_string(0x2bd);
  pcVar11 = local_58;
  do {
    cVar3 = *pcVar8;
    pcVar8 = pcVar8 + 1;
    *pcVar11 = cVar3;
    pcVar11 = pcVar11 + 1;
  } while (cVar3 != '\0');
  uVar7 = _itoa((int)sVar6,auStack_68,10);
  ce_strcat(local_58,uVar7);
  uVar7 = get_message_string(0x2be);
  ce_strcat(local_58,uVar7);
  sVar6 = measure_text_width(local_58);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  iVar13 = CONCAT11(*(undefined1 *)(DAT_000879b0 + 7),*(undefined1 *)(DAT_000879b0 + 6)) + iVar13;
  draw_text_string(local_58,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  iVar12 = 0;
  iVar13 = *(short *)(DAT_000879b0 + 6) + iVar13;
  do {
    iVar14 = DAT_000879b0;
    iVar9 = ordint_divmod(3,iVar12).quot;
    sVar6 = 0xbe;
    if (iVar9 == 0) {
      sVar6 = 0x50;
    }
    uw_ord2005_rem_140 = ((int)(iVar12)) % (3);
    sVar2 = *(short *)(iVar14 + 6);
    uVar7 = get_message_string((int)iVar12 + 0x11U | 0x400);
    if (-1 < iVar12) {
      if (iVar12 < 3) {
        uVar4 = *(undefined1 *)((int)iVar12 + DAT_0023be74 + 5);
      }
      else if (iVar12 == 3) {
        uVar4 = *(undefined1 *)(DAT_0023be74 + 4);
      }
      else {
        if (iVar12 != 4) {
          if (iVar12 == 5) {
            uVar10 = orduint_divmod(10,*(undefined4 *)(DAT_00086df8 + 0x4e)).quot;
            _ltoa(uVar10,local_58,10);
          }
          goto LAB_00071110;
        }
        uVar4 = *(undefined1 *)(DAT_00086df8 + 0x38);
      }
      itoa_radix(uVar4,local_58,10);
    }
LAB_00071110:
    local_70 = (short)((uint)(iVar13 * 0x10000) >> 0x10);
    iVar14 = (int)uw_ord2005_rem_140 * (int)sVar2 + (int)local_70;
    draw_text_string(uVar7,(int)sVar6,iVar14);
    draw_text_string(local_58,sVar6 + 0x2d,iVar14);
    iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
    if (5 < iVar12) {
      iVar12 = 0;
      iVar13 = iVar13 + *(short *)(DAT_000879b0 + 6) * 2;
      do {
        bVar1 = *(byte *)((int)iVar12 + DAT_00086df8 + 0x21);
        uVar7 = get_message_string((int)iVar12 + 0x1fU | 0x400);
        bVar5 = bVar1;
        if (9 < bVar1) {
          bVar5 = ordint_divmod(10,bVar1).quot;
        }
        local_58[0] = bVar5 + 0x30;
        if (bVar1 < 10) {
          local_58[1] = '\0';
        }
        else {
          uw_ord2005_rem_141 = ((int)(bVar1)) % (10);
          local_58[1] = uw_ord2005_rem_141 + '0';
        }
        local_58[2] = 0;
        uw_ord2005_rem_142 = ((int)(iVar12)) % (3);
        iVar14 = uw_ord2005_rem_142;
        if (uw_ord2005_rem_142 == 0) {
          iVar14 = DAT_000879b0;
        }
        if (uw_ord2005_rem_142 == 0) {
          iVar13 = *(short *)(iVar14 + 6) + iVar13;
        }
        iVar14 = (short)uw_ord2005_rem_142 * 0x4a + 0x32;
        draw_text_string(uVar7,iVar14,iVar13);
        iVar9 = measure_text_width(local_58);
        draw_text_string(local_58,(iVar14 - iVar9) + 0x46,iVar13);
        iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
      } while (iVar12 < 0x14);
      flush_dirty_rect_to_display(1);
      return;
    }
  } while( true );
}






// was FUN_0007141c -- applies pending status effects around a rest
// action: clears any active screen-flash effect (bits 1/2 of
// DAT_00086df8+0xb8) both before and after settling movement/refreshing
// equipment effects, and if bit 3 (poison) is set and not in a gated
// game state (DAT_0020208c bits 0x16), applies a randomized damage tick
// (12-57, type 0x10) to the player via apply_typed_damage_to_object -- the "poisoned
// while you sleep" mechanic.
void apply_rest_status_effects()

{
  int uw_ord2005_rem_144 = 0;
  undefined4 uVar1;
  char extraout_r1;
  undefined1 uVar2;

  if ((*(byte *)(DAT_00086df8 + 0xb8) & 3) != 0) {
    apply_typed_damage_to_object(g_player_object,0,0,0,0xff,0);
  }
  refresh_player_equipment_effects();
  settle_movement_to_rest();
  if (((*(byte *)(DAT_00086df8 + 0xb8) & 8) != 0) && ((DAT_0020208c & 0x16) == 0)) {
    uVar1 = ce_rand();
    uVar2 = 0x10;
    uw_ord2005_rem_144 = ((int)(uVar1)) % (6);
    apply_typed_damage_to_object(g_player_object,0,0,0,uw_ord2005_rem_144 * '\n' + '\f',uVar2);
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 3) != 0) {
    apply_typed_damage_to_object(g_player_object,0,0,0,0xff,0);
  }
  return;
}






// was FUN_00071510 -- the "Rest" command handler, reached either
// directly (param_1<0) or, for param_1>=0, only after passing
// preconditions (not poisoned/etc. per DAT_00086df8+0xb8, not falling,
// not on level 9) and check_rest_area_unsafe reporting it's unsafe to rest here
// (message 0xf shown either way): advances game time
// (DAT_00086df8+0xce) by a random 2-6 "day" count, heals HP/mana based
// on hunger state (g_player_object+8) via adjust_player_hp, decays
// hunger, rolls for a random level special event
// (trigger_random_level_special_event), resets jump/fall physics state,
// and redraws. apply_rest_status_effects (including the poison tick)
// is only called for the original param_1<0 path specifically. When
// preconditions pass and resting IS safe (param_1>=0), a different,
// shorter message plays instead and none of the rest logic runs.
void handle_rest_action(param_1)
short param_1;

{
  int uw_ord2005_rem_145 = 0; int uw_ord2005_rem_146 = 0; int uw_ord2005_rem_147 = 0;
  byte bVar1;
  bool bVar2;
  short sVar3;
  int iVar4;
  undefined4 uVar5;
  short extraout_r1;
  short extraout_r1_00;
  short extraout_r1_01;
  ushort uVar6;
  uint uVar7;
  int iVar8;
  
  bVar2 = true;
  if (param_1 < 0) {
LAB_0007158c:
    full_dungeon_redraw();
    set_pending_music_track(0xd);
    update_ingame_music_track();
    weapon_overlay_flash_hold(5);
    if (-1 < param_1) {
      print_scroll_message_by_id(0x10);
    }
    tick_ambient_doors_and_scheduler(0);
    despawn_objects_outside_radius(1,0x14);
    uVar5 = ce_rand();
    uw_ord2005_rem_145 = ((int)(uVar5)) % (5);
    iVar8 = uw_ord2005_rem_145 + 2;
    iVar4 = (iVar8 * 0x10000 >> 0x10) * 0xe1000 + *(int *)(DAT_00086df8 + 0xce);
    *(char *)(DAT_00086df8 + 0xce) = (char)iVar4;
    *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar4 >> 8);
    *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar4 >> 0x10);
    *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar4 >> 0x18);
    uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfc3f;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar7;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar7 >> 8);
    uVar7 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfff3;
    *(char *)(DAT_00086df8 + 0x61) = (char)uVar7;
    *(char *)(DAT_00086df8 + 0x62) = (char)(uVar7 >> 8);
    decay_equipped_light_sources(iVar8 * 0xb4,0);
    if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c) != 0) {
      uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) >> 2 & 0xf;
      apply_typed_damage_to_object(g_player_object,0,0,0,(char)((int)((uVar7 + 1) * uVar7) >> 1),0x10);
      uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar7;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar7 >> 8);
    }
    if (param_1 < 0) {
      apply_rest_status_effects();
    }
    if (*(char *)((char *)g_player_object + 8) == '\0') {
      pick_random_pending_music_track();
    }
    else {
      iVar4 = check_rest_interrupted_by_monster();
      if (iVar4 == 0) {
        advance_mobile_objects();
        process_nearby_background_traps(0);
        uVar5 = ce_rand();
        uw_ord2005_rem_146 = ((int)(uVar5)) % (4);
        iVar4 = (uw_ord2005_rem_146 - iVar8) + 7;
        if (*(byte *)((char *)g_player_object + 8) < 10) {
          uVar5 = ce_rand();
          uw_ord2005_rem_147 = ((int)(uVar5)) % (2);
          iVar4 = iVar4 + uw_ord2005_rem_147 + 1;
        }
        iVar8 = (short)iVar4 * 0xe1000 + *(int *)(DAT_00086df8 + 0xce);
        *(char *)(DAT_00086df8 + 0xce) = (char)iVar8;
        *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar8 >> 8);
        *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar8 >> 0x10);
        *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar8 >> 0x18);
        decay_equipped_light_sources(iVar4 * 0xb4,0);
        if ((*(byte *)(DAT_00086df8 + 0x39) < 0x41) || (iVar4 = 1, param_1 < 1)) {
          iVar4 = 0;
        }
        bVar1 = *(byte *)(DAT_00086df8 + 0x3a);
        *(undefined1 *)(DAT_00086df8 + 0x3a) = 0;
        iVar8 = (bVar1 >> 1) + 2;
        sVar3 = (short)iVar8;
        if (5 < (uint)(iVar8 * 0x10000 >> 0x10)) {
          sVar3 = 5;
        }
        if (*(char *)(DAT_00086df8 + 0x39) == '\0') {
          print_scroll_message_by_id(0x11);
          apply_typed_damage_to_object(g_player_object,0,0,0,2,0);
        }
        else {
          adjust_player_hp(g_player_object,(((short)iVar4 + 1) * (int)sVar3 * 0x1000000 >> 0x18) + -1);
          adjust_level7_hazard_value(g_player_object,0xfffffffa);
          adjust_level7_hazard_value(g_player_object,((char)sVar3 + 1) * (int)(char)iVar4 + (int)(char)sVar3 + -1);
        }
        sVar3 = ce_rand();
        adjust_player_hunger(-0x18 - ((int)sVar3 & 0x1fU));
        uVar6 = *(ushort *)(DAT_00086df8 + 0x61);
        if ((uVar6 & 0x3f0) < 0x200) {
          uVar6 = uVar6 & 0xfc0f;
        }
        else {
          uVar6 = ((uVar6 & 0xfff0) - 0x1f1 ^ uVar6) & 0x3f0 ^ uVar6;
        }
        *(char *)(DAT_00086df8 + 0x61) = (char)uVar6;
        *(char *)(DAT_00086df8 + 0x62) = (char)(uVar6 >> 8);
        if (-1 < param_1) {
          iVar8 = trigger_random_level_special_event(iVar4);
          bVar2 = true;
          if (iVar8 != 0) {
            bVar2 = false;
          }
        }
        print_scroll_message_by_id(0x13 - iVar4);
      }
      else {
        if (*(byte *)(DAT_00086df8 + 0x3a) < 0x21) {
          *(undefined1 *)(DAT_00086df8 + 0x3a) = 0;
        }
        else {
          *(byte *)(DAT_00086df8 + 0x3a) = *(byte *)(DAT_00086df8 + 0x3a) - 0x20;
        }
        print_scroll_message_by_id(0x15);
        sVar3 = ce_rand();
        adjust_player_hunger(-0xc - ((int)sVar3 & 0xfU));
        uVar6 = *(ushort *)(DAT_00086df8 + 0x61);
        if ((uVar6 & 0x3f0) < 0x100) {
          uVar6 = uVar6 & 0xfc0f;
        }
        else {
          uVar6 = ((uVar6 & 0xfff0) - 0xf1 ^ uVar6) & 0x3f0 ^ uVar6;
        }
        *(char *)(DAT_00086df8 + 0x61) = (char)uVar6;
        *(char *)(DAT_00086df8 + 0x62) = (char)(uVar6 >> 8);
      }
      refresh_player_equipment_effects();
      flush_pending_critter_resource_slots();
      g_jump_ascent_timer = 0;
      g_fall_accel = 0;
      DAT_0020488e = 0;
      DAT_0020488c = 0;
      g_vertical_velocity = 0;
      DAT_00204888 = 0;
      DAT_00204886 = 0;
      refresh_stats_panel_if_active();
      full_dungeon_redraw();
      pick_random_pending_music_track();
      if (bVar2) {
        weapon_overlay_flash_restore(5);
      }
      else {
        weapon_overlay_and_full_redraw();
      }
    }
  }
  else {
    if ((((*(byte *)(DAT_00086df8 + 0xb8) & 0x1b) == 0) && (g_fall_accel == 0)) &&
       (DAT_00201b68 != 9)) {
      iVar4 = check_rest_area_unsafe();
      if (iVar4 == 0) {
        print_scroll_message_by_id(0xf);
        goto LAB_0007158c;
      }
      uVar5 = 0xe;
    }
    else {
      uVar5 = 0x14;
    }
    print_scroll_message_by_id(uVar5);
  }
  return;
}






// was FUN_00071b08 -- adjusts the player's hunger byte
// (DAT_00086df8+0x39) by param_1, clamped to 0..0xff (returns false if
// it would go >=0x100 without applying anything). If param_1>0 (the
// player just ate), also restores a capped amount of stat points from
// the accumulated rest-debt byte (+0x3b) via restore_stat_capped and
// clears it. Called by handle_rest_action with negative deltas (hunger
// decay while resting).
undefined4 adjust_player_hunger(param_1)
short param_1;

{
  int iVar1;
  int iVar2;
  byte bVar3;
  undefined4 uVar4;
  
  iVar1 = ((int)param_1 + (uint)*(byte *)(DAT_00086df8 + 0x39)) * 0x10000;
  iVar2 = iVar1 >> 0x10;
  if (iVar2 < 0x100) {
    if (iVar2 < 0) {
      *(undefined1 *)(DAT_00086df8 + 0x39) = 0;
    }
    else {
      *(char *)(DAT_00086df8 + 0x39) = (char)((uint)iVar1 >> 0x10);
    }
    if (0 < param_1) {
      bVar3 = *(byte *)(DAT_00086df8 + 0x3b) >> 3;
      if (8 < bVar3) {
        bVar3 = 8;
      }
      restore_stat_capped(g_player_object,bVar3);
      *(undefined1 *)(DAT_00086df8 + 0x3b) = 0;
    }
    uVar4 = 1;
  }
  else {
    uVar4 = 0;
  }
  return uVar4;
}



// was FUN_00071b94 -- the game-completion/victory sequence, gated on
// DAT_0023c27c (0 = the one-time "ending cutscene" stage not yet run,
// nonzero = show the victory stats screen). The cutscene stage (once
// per game, guarded by DAT_00086df8+0x6d) spawns a special object
// (catalog id 0x15a), links it into the current tile, spins the camera
// a full rotation, then unlinks/frees the object and applies an effect
// to the player (teleport_object_to_level_tile). The stats-screen stage blits
// win1.byt/win2.byt as backgrounds, draws render_endgame_character_stats
// on top, waits for input, then resets DAT_0023c27c to end the sequence.
void handle_game_victory_sequence()

{
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  char *pcVar4;
  undefined2 *puVar5;
  char *iVar6;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  char *pcVar7;
  char *local_11c;  /* was `int` -- same truncation, derived from iVar6 */
  char acStack_114 [260];
  
  if (DAT_0023c27c == '\0') {
    if (*(char *)(DAT_00086df8 + 0x6d) == '\0') {
      puVar5 = (undefined2 *)spawn_new_object(0x15a,0);
      if (puVar5 != (undefined2 *)0x0) {
        uVar2 = *puVar5;
        *(char *)puVar5 = (char)uVar2;
        *(byte *)((char *)puVar5 + 1) = (byte)((ushort)uVar2 >> 8) | 0x80;
        *(byte *)(puVar5 + 3) = *(byte *)(puVar5 + 3) & 0x3f;
        *(undefined1 *)((char *)puVar5 + 7) = 0xb0;
        iVar6 = tilemap_lookup(0x20,0x20);
        local_11c = iVar6 + 2;
        object_list_append_tail(local_11c,puVar5);
      }
      print_scroll_message_by_id(0x117);
      spin_view_full_rotation(0xffffffff);
      weapon_overlay_flash_hold(5);
      if (puVar5 != (undefined2 *)0x0) {
        object_list_unlink(local_11c,puVar5);
        free_object_slot(puVar5);
      }
      teleport_object_to_level_tile(g_player_object,0x1b,0x17,9);
      *(undefined1 *)(DAT_00086df8 + 0x6d) = 0xff;
      print_scroll_message_by_id(0x118);
      DAT_00085730 = DAT_00085730 & 0xfe;
      dungeon_view_anim_tick();
      DAT_00085730 = DAT_00085730 | 1;
    }
  }
  else {
    dirty_rect_union(0,200,0,0x140);
    *(undefined1 *)(DAT_00085a6c + 8) = 0;
    *(undefined1 *)(DAT_00085a6c + 9) = 0;
  DAT_00085a6c[4] = 0; /* mirror to the real byte-8 mode field -- see set_game_mode */
    DAT_000868d8 = 2;
    display_book_or_scroll_page(1);
    decrement_cursor_hide_depth();
    clear_screen_and_restore_cursor();
    ce_memset(acStack_114,0,0x104);
    pcVar7 = &DAT_0023cca8;
    stack0xffdc3244_ptr = stack0xffdc3244_buf;
    pcVar4 = pcVar7;
    stack0xffdc3244_ptr = acStack_114;
    do {
      cVar1 = *pcVar4;
      *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_114,s__DATA_win1_byt_00087350);
    blit_fullscreen_bitmap_file(7,acStack_114,1);
    Sleep(3000);
    dirty_rect_union(0,200,0,0x140);
    ce_memset(acStack_114,0,0x104);
    do {
      cVar1 = *pcVar7;
      *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_114,s__DATA_win2_byt_00087340);
    blit_fullscreen_bitmap_file(0xffffffff,acStack_114,1);
    dirty_rect_union(0,200,0,0x140);
    render_endgame_character_stats();
    do {
      sVar3 = next_input_event();
    } while (sVar3 < 0);
    handle_player_death_and_menu_transition(0);
    DAT_0023c27c = '\0';
  }
  return;
}






// was FUN_00072288 -- the starvation handler: its one caller invokes
// this every turn the player's hunger byte (g_player_object+8) reads 0.
// Gated on DAT_00086df8+0x6d (also set by handle_game_victory_sequence's
// ending cutscene -- its exact broader meaning here, "already suffered
// starvation once" vs something victory-specific, isn't resolved): if
// clear, this is treated as a first warning -- just reset hunger to 4,
// no penalty. If already set, apply real starvation consequences: lose
// experience (grant_experience_points with a derived negative amount),
// drop any held cursor item, spawn an object (catalog 0xc2+0..4) near
// the player and settle it into the world, and -- if DAT_00086df8+0x5e's
// upper nibble is set and not on level 9 -- re-arm the
// apply_special_object_use_effect callback and play a camera animation
// before showing a message.
void handle_starvation_penalty()

{
  int uw_ord2005_rem_148 = 0;
  byte bVar1;
  undefined1 uVar2;
  byte bVar3;
  undefined2 uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  short extraout_r1;
  char *pNewObj;

  if (*(char *)(DAT_00086df8 + 0x6d) == '\0') {
    *(undefined1 *)((char *)g_player_object + 8) = 4;
    return;
  }
  stop_current_audio_handle_dup();
  play_music_track(10,1);
  grant_experience_points((int)((uint)(*(uint3 *)(DAT_00086df8 + 0x4e) >> 3) * -0x10000) >> 0x10);
  full_dungeon_redraw();
  weapon_overlay_flash_hold(5);
  cancel_weapon_swing();
  if (g_selected_object != 0) {
    if ((g_cursor_holding_state == 1) || (g_cursor_holding_state == 0)) {
      drop_object_near_target(g_player_object,g_selected_object,6,0);
    }
    else if (g_cursor_holding_state != 2) goto LAB_00072374;
    g_cursor_holding_state = 0;
    g_selected_object = 0;
    pop_cursor_icon(3);
  }
LAB_00072374:
  uVar5 = ce_rand();
  uw_ord2005_rem_148 = ((int)(uVar5)) % (5);
  /* Was `iVar6 = spawn_new_object(...)` (plain int) -- spawn_new_object now
     really returns a fresh object pointer (see its fix) instead of
     always 0, so storing it in a 32-bit int truncates it on this 64-bit
     host. New pNewObj local rather than retyping iVar6, which is reused
     below for dungeon_view_anim_tick()'s unrelated int result. */
  pNewObj = (char *)spawn_new_object(uw_ord2005_rem_148 + 0xc2,0);
  iVar7 = place_object_in_world((int)DAT_00204880 >> 5,(int)DAT_00204882 >> 5,(int)DAT_00204884 >> 3,
                       pNewObj,0,1);
  if (iVar7 != 0) {
    uVar4 = *(undefined2 *)(pNewObj + 2);
    bVar1 = (byte)uVar4;
    *(byte *)(pNewObj + 2) = (*(byte *)((char *)g_player_object + 2) ^ bVar1) & 0x7f ^ bVar1;
    *(char *)(pNewObj + 3) = (char)((ushort)uVar4 >> 8);
    *(byte *)(pNewObj + 6) = *(byte *)(pNewObj + 6) | 0x3f;
    *(undefined1 *)(pNewObj + 7) = *(undefined1 *)(pNewObj + 7);
    uVar8 = (*(ushort *)(pNewObj + 2) ^ *(ushort *)((char *)g_player_object + 2)) & 0x1fff ^
            (uint)*(ushort *)((char *)g_player_object + 2);
    uVar2 = (undefined1)uVar8;
    *(undefined1 *)(pNewObj + 2) = uVar2;
    bVar3 = (byte)(uVar8 >> 8);
    *(byte *)(pNewObj + 3) = bVar3;
    bVar1 = *(byte *)((char *)g_player_object + 3);
    *(undefined1 *)(pNewObj + 2) = uVar2;
    *(byte *)(pNewObj + 3) = (bVar1 ^ bVar3) & 0x1c ^ bVar3;
    settle_dropped_object(pNewObj,(int)DAT_00204880 >> 8,(int)DAT_00204882 >> 8,1);
  }
  if (((*(byte *)(DAT_00086df8 + 0x5e) & 0xf0) != 0) && (DAT_00201b68 != 9)) {
    teleport_object_to_level_tile(g_player_object,0x3f,0x3f,*(byte *)(DAT_00086df8 + 0x5e) >> 4);
    DAT_00201c9c = apply_special_object_use_effect;
    DAT_00085730 = 0;
    iVar6 = dungeon_view_anim_tick();
    DAT_00085730 = 3;
    if (iVar6 != 0) {
      display_book_or_scroll_page(0x102);
      show_error_dialog_stub_thunk(0xf1);
      msg_scroll_panel_reset(1);
      return;
    }
  }
  handle_player_death_and_menu_transition(1);
  return;
}






// was FUN_00073e14 -- adjusts the level-7 hazard byte
// (DAT_00086df8+0x37, only when param_1 is the player object):
// param_2<=0 subtracts it as a delta from the current value; param_2>0
// instead adds a randomized amount (param_2 plus 0-3, scaled by the
// hazard cap DAT_00086df8+0x38) to the current value plus 1. Clamps
// to the cap and refreshes the experience/stats display.
void adjust_level7_hazard_value(param_1,param_2)
char *param_1;
char param_2;

{
  short sVar1;
  
  if (param_1 == g_player_object) {
    if (param_2 < '\x01') {
      param_2 = *(char *)(DAT_00086df8 + 0x37) - param_2;
    }
    else {
      sVar1 = ce_rand();
      param_2 = (char)((int)((((int)sVar1 & 3U) + (int)param_2) *
                             (uint)*(byte *)(DAT_00086df8 + 0x38) * 0x10000) >> 0x14) +
                *(char *)(DAT_00086df8 + 0x37) + '\x01';
    }
    *(char *)(DAT_00086df8 + 0x37) = param_2;
    if (*(byte *)(DAT_00086df8 + 0x38) < *(byte *)(DAT_00086df8 + 0x37)) {
      *(byte *)(DAT_00086df8 + 0x37) = *(byte *)(DAT_00086df8 + 0x38);
    }
    refresh_experience_display();
  }
  return;
}






// was FUN_00073f60
void restore_stat_capped(param_1,param_2)
byte * param_1;
uint param_2;

{
  uint uVar1;
  byte bVar2;

  uVar1 = (param_2 & 0xff) + (uint)param_1[8];
  /* Was an unconditional `(&g_monster_max_stats_table)[(*param_1 & 0x3f) * 0x30]` cap
     -- that table is the per-monster-class max-stat table, indexed by
     the low 6 bits of a monster object's own type id (a valid index
     for any real monster, 0x40-0x7f). But this function is also called
     with param_1 == g_player_object (see adjust_player_hunger's food-digestion
     "restore a resting bonus" call, and this function's own existing
     `if (param_1 == g_player_object)` special case just below), and the
     player's object type happens to be 0x7f, whose low 6 bits (0x3f)
     index the table's last, unused/zeroed entry. That zero cap then
     clamped the player's HP down to 0 every time -- confirmed live via
     UW_DEBUG_INV: "restore_stat_capped *param_1=0x7f class=0x3f cap=0
     uVar1=42 hp_before=34" immediately followed by the player's death
     sequence after simply eating a loaf of bread. Use the real player
     max-HP stat (DAT_0023be74+4, the same source adjust_player_hp already
     uses for player HP capping) instead of the monster table when the
     target is the player. */
  bVar2 = (param_1 == g_player_object) ? *(byte *)(DAT_0023be74 + 4) :
          (&g_monster_max_stats_table)[(*param_1 & 0x3f) * 0x30];
  if (bVar2 < uVar1) {
    param_1[8] = bVar2;
  }
  else {
    param_1[8] = (byte)uVar1;
  }
  if (param_1 == g_player_object) {
    refresh_experience_display();
  }
  return;
}



// was FUN_00073fc4 -- dispatch_special_action's "healing item" handler
// (its own case 4): only applies if the target object's quality bits
// match 0x40 (a food/potion-shaped flag), then restores HP via
// restore_stat_capped -- param_2==0xf is a full-heal sentinel (-1),
// otherwise param_2 is a dice count rolled via roll_dice_sum (d8s).
void apply_healing_item_effect(param_1,param_2)
ushort * param_1;
char param_2;

{
  char cVar1;
  int iVar2;
  
  if ((*param_1 & 0x1c0) == 0x40) {
    if (param_2 == '\x0f') {
      iVar2 = -1;
    }
    else {
      cVar1 = roll_dice_sum((int)param_2,8);
      iVar2 = (int)cVar1;
    }
    restore_stat_capped(param_1,iVar2);
  }
  return;
}





// was FUN_00077f30 -- draws the stats panel's name/title/level
// header. Called from draw_stats_panel_content. Draws the player's
// name (uppercased via _strupr, the real _strupr), then their
// title (a gender+race-derived message lookup), then their level
// number (0-3 capped, offset 0x3d) right-aligned. Already referenced
// by this name in existing comments in src/ordinal_stubs.c and
// src/saveload.c documenting two real bugs already fixed here in an
// earlier session pass (a truncated-pointer crash and a dropped-
// argument bug that left the player's title never drawn).
void draw_stats_panel_header()

{
  char cVar1;
  short sVar2;
  /* Was `undefined4` -- truncated _strupr's real 64-bit string
     pointer return (see that ordinal's own comment: it's `_strupr`,
     genuinely implemented now instead of a stub) to 32 bits on this
     host before handing it to draw_text_string. Harmless while
     _strupr was a stub always returning 0; a real
     pointer-truncation crash now that it isn't. Same class as
     everywhere else this session. */
  char *uVar3;
  int iVar4;
  undefined1 auStack_28 [30];
  undefined1 local_a;

  ce_strncpy(auStack_28,DAT_00086df8,0xf);
  local_a = 0;
  _strupr(auStack_28);
  sVar2 = measure_text_width(auStack_28);
  iVar4 = -(int)sVar2 + 0x48;
  if (iVar4 < 0) {
    iVar4 = -(int)sVar2 + 0x49;
  }
  draw_text_string(auStack_28,(short)(iVar4 >> 1) + 0xf2,0xf);
  /* Was `get_message_string(id); uVar3 = _strupr();` -- _strupr
     (real body: `_strupr`, see its own comment) needs an explicit
     string argument, but was called with none, relying on the K&R
     leftover-register idiom (this project's established "dropped
     argument" pattern) to still hold get_message_string's just-returned
     string pointer. That register doesn't reliably carry through on
     this recompile, so uVar3 came back NULL/garbage and the player's
     title was never drawn. Thread the string through explicitly. */
  uVar3 = _strupr(get_message_string((*(byte *)(DAT_00086df8 + 100) >> 5) + 0x17 | 0x400));
  draw_text_string(uVar3,0xf2,0x16);
  itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x3d),auStack_28,10);
  cVar1 = *(byte *)(DAT_00086df8 + 0x3d) - 1;
  if (3 < *(byte *)(DAT_00086df8 + 0x3d)) {
    cVar1 = '\x03';
  }
  /* Originally `cVar1 * 3 + 0x878b0`: index into a small string table at a
     fixed original-binary address Ghidra never recovered contents for
     (see open_gr_resource_file for the same pattern) -- skipped rather than
     guessed, this is cosmetic HUD text formatting. */
  iVar4 = measure_text_width(auStack_28);
  draw_text_string(auStack_28,0x138 - iVar4,0x16);
  return;
}





// was FUN_0007802c -- draws one row of the stats panel's 3-value
// attribute display: param_1 selects the row (0-2), reading byte
// DAT_0023be74+5+row (see character_generator_loop's own init of
// these 3 bytes via "roll 2d10+10", uw.c ~10097) and right-aligning
// it at y = row*7+0x1d, just below the name/title/level header.
// Called 3x in a loop from draw_stats_panel_content.
void draw_stats_panel_attribute_row(param_1)
uint param_1;

{
  int iVar1;
  undefined1 auStack_c [4];
  
  itoa_radix(*(undefined1 *)((param_1 & 0xff) + DAT_0023be74 + 5),auStack_c,10);
  iVar1 = measure_text_width(auStack_c);
  draw_text_string(auStack_c,0x138 - iVar1,(param_1 & 0xff) * 7 + 0x1d);
  return;
}



// was FUN_00078088 -- draws the player's "current/max HP" fraction
// (g_player_object offset+8, the real player HP byte) as "X/Y" text
// at y=0x32. Called from draw_stats_panel_content and
// refresh_experience_display (the latter re-running it whenever the
// player's stats change while the stats panel is the active HUD
// view).
void draw_hp_stat_display()

{
  short sVar1;
  int iVar2;
  undefined1 auStack_c [8];
  
  itoa_radix(*(undefined1 *)((char *)g_player_object + 8),auStack_c,10);
  sVar1 = ce_strlen(auStack_c);
  auStack_c[sVar1] = 0x2f;
  itoa_radix(*(undefined1 *)(DAT_0023be74 + 4),auStack_c + ((sVar1 + 1) * 0x10000 >> 0x10),10);
  iVar2 = measure_text_width(auStack_c);
  draw_text_string(auStack_c,0x138 - iVar2,0x32);
  return;
}



// was FUN_00078118 -- draws the player's "current/max mana" fraction
// (DAT_00086df8+0x37/+0x38 -- offset 0x37 confirmed as "play_mana"
// against babl.c's own read of the same offset) as "X/Y" text at
// y=0x39. Same caller pair as draw_hp_stat_display above.
void draw_mana_stat_display()

{
  short sVar1;
  int iVar2;
  undefined1 auStack_10 [8];
  
  itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x37),auStack_10,10);
  sVar1 = ce_strlen(auStack_10);
  auStack_10[sVar1] = 0x2f;
  itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x38),auStack_10 + ((sVar1 + 1) * 0x10000 >> 0x10),10)
  ;
  iVar2 = measure_text_width(auStack_10);
  draw_text_string(auStack_10,0x138 - iVar2,0x39);
  return;
}



// was FUN_000781a0 -- draws the player's total experience points
// (DAT_00086df8+0x4e, a 4-byte value) formatted via orduint_divmod/
// _ltoa at y=0x40. Same caller pair as draw_hp_stat_display
// above.
void draw_experience_points_display()

{
  undefined4 uVar1;
  int iVar2;
  undefined1 auStack_18 [12];
  
  uVar1 = orduint_divmod(10,*(undefined4 *)(DAT_00086df8 + 0x4e)).quot;
  _ltoa(uVar1,auStack_18,10);
  iVar2 = measure_text_width(auStack_18);
  draw_text_string(auStack_18,0x138 - iVar2,0x40);
  return;
}





// was FUN_0007821c -- draws one row of the stats panel's skill list:
// param_1 selects the skill index, restores the captured backdrop
// rect behind that row (blit_grtile_to_framebuffer), then draws the skill's name
// (a message lookup at DAT_0024af80+index+0x1f) and its numeric
// value (DAT_00086df8+0x21+index) side by side. Called in a loop
// from draw_stats_panel_content.
void draw_stats_panel_skill_row(param_1)
uint param_1;

{
  /* Was `undefined4` -- same _strupr pointer-truncation class as
     draw_stats_panel_header's player-title draw. */
  char *uVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  undefined1 auStack_18 [4];
  
  uVar3 = param_1 & 0xff;
  itoa_radix(*(undefined1 *)(DAT_0024af80 + uVar3 + DAT_00086df8 + 0x21),auStack_18,10);
  blit_grtile_to_framebuffer(0xf0,((int)(uVar3 * 0x70000) >> 0x10) + 0x47,DAT_0024af88,((param_1 & 0xff) + 1) * 7,
               0x4b,0,(short)(uVar3 * 0x70000 >> 0x10),1);
  /* Was `get_message_string(id); uVar1 = _strupr();` -- same dropped-
     argument bug as draw_stats_panel_header's player-title draw above; thread
     the looked-up skill-name string through explicitly instead of
     relying on leftover-register reuse. This is why no skill names
     (Sword/Swimming/Mace/etc.) ever displayed. */
  uVar1 = _strupr(get_message_string((uint)DAT_0024af80 + (int)(short)uVar3 + 0x1f | 0x400));
  iVar4 = ((int)(uVar3 * 0x70000) >> 0x10) + 0x48;
  draw_text_string(uVar1,0xf2,iVar4);
  iVar2 = measure_text_width(auStack_18);
  draw_text_string(auStack_18,0x138 - iVar2,iVar4);
  return;
}



void draw_stats_panel_content()

{
  byte bVar1;

  if (getenv("UW_DEBUG_CLICKREGION"))
    fprintf(stderr, "[stats] draw_stats_panel_content (draw stats panel) entry, DAT_0024af88=%d\n", (int)DAT_0024af88);
  if (DAT_0024af88 == 0) {
    DAT_0024af88 = grtile_alloc_registered(0x96,0x2b);
    if (DAT_0024af88 != 0) {
      capture_framebuffer_rect_to_grtile(DAT_0024af88,0xf0,0x47,0x4b,0x2b);
    }
    DAT_0024af8c = grtile_alloc_registered(0x46,0x15);
    if (DAT_0024af8c != 0) {
      capture_framebuffer_rect_to_grtile(DAT_0024af8c,0x115,0x32,0x23,0x15);
    }
    if (getenv("UW_DEBUG_CLICKREGION"))
      fprintf(stderr, "[stats] draw_stats_panel_content: allocated DAT_0024af88=%d DAT_0024af8c=%d\n", (int)DAT_0024af88, (int)DAT_0024af8c);
  }
  *g_draw_color_index = 0xf1;
  *DAT_00084298 = 0xf1;
  decrement_cursor_hide_depth();
  select_active_font(s_font5x6i_sys_00086e98);
  draw_stats_panel_header();
  bVar1 = 0;
  do {
    draw_stats_panel_attribute_row(bVar1);
    bVar1 = bVar1 + 1;
  } while (bVar1 < 3);
  draw_hp_stat_display();
  draw_mana_stat_display();
  draw_experience_points_display();
  bVar1 = 0;
  *g_draw_color_index = 0x68;
  *DAT_00084298 = 0x68;
  do {
    draw_stats_panel_skill_row(bVar1);
    bVar1 = bVar1 + 1;
  } while (bVar1 < 6);
  select_active_font(s_font5x6p_sys_0008430c);
  cursor_show_idle_tick();
  return;
}





// was FUN_00078434 -- handles a click on the stats panel's skill
// list, scrolling it up or down by one (DAT_0024af80, the skill
// scroll offset draw_stats_panel_skill_row reads) depending on click
// position relative to DAT_00085a6c. Already had an existing comment
// documenting a real dropped-argument bug already fixed here (a
// scroll-direction bug -- "scrolling jumps somewhere else instead of
// line by line"). Confirmed real caller: src/inventory.c's panel-
// click dispatch.
void handle_stats_panel_skill_scroll_click()

{
  undefined2 uVar1;
  short sVar2;
  uint uVar3;
  ushort local_c [2];
  
  select_active_font(s_font5x6i_sys_00086e98);
  *g_draw_color_index = 0x68;
  *DAT_00084298 = 0x68;
  if (DAT_00085a6c[1] < 8) {
    local_c[0] = (ushort)DAT_0024af80;
    sVar2 = -1;
    if (0x24 < *DAT_00085a6c) {
      sVar2 = 1;
    }
    uVar1 = 0xe;
    if (sVar2 != 1) {
      uVar1 = 0;
    }
    /* Was `step_value_toward_limit(local_c,uVar1,1);` -- dropped its 4th
       argument (direction, -1/+1), the SAME `sVar2` value just
       computed above from the click position but about to be
       clobbered by this very call's own return value (Ghidra reused
       the variable slot). step_value_toward_limit's own body branches on
       param_4==-1 vs anything else to pick which bound check and
       which sign to apply, so a dropped/garbage direction here could
       clamp against the wrong bound or step the wrong way --
       confirmed as the cause of "scrolling jumps somewhere else
       instead of line by line". Re-derive the direction explicitly
       instead of relying on the leftover register. */
    sVar2 = step_value_toward_limit(local_c,uVar1,1,(0x24 < *DAT_00085a6c) ? 1 : -1);
    if (sVar2 != 0) {
      DAT_0024af80 = (byte)local_c[0];
      decrement_cursor_hide_depth();
      uVar3 = 0;
      local_c[0] = 0;
      do {
        draw_stats_panel_skill_row(uVar3 & 0xff);
        uVar3 = (int)(short)local_c[0] + 1;
        local_c[0] = (ushort)uVar3;
      } while ((int)(uVar3 * 0x10000) >> 0x10 < 6);
      cursor_show_idle_tick();
    }
  }
  select_active_font(s_font5x6p_sys_0008430c);
  wait_for_click_release(1);
  return;
}



// was FUN_00078550
void refresh_stats_panel_if_active()

{
  if (g_active_hud_panel == '\x02') {
    redraw_active_hud_panel();
  }
  return;
}


// was FUN_0007ee9c -- confirmed by read_player_status_block
// (src/player.c) as the low-level "read and de-scramble" primitive
// behind the player.dat status block: reads param_4 bytes from file
// handle param_1 into param_3, 80 (0x50) bytes at a time, XOR'ing
// each chunk against a rolling key derived from param_2 (incremented
// by 3 every 80 bytes) -- a simple byte-scrambling obfuscation, not
// real encryption. Returns the total byte count actually read.
short read_xor_scrambled_block(param_1,param_2,param_3,param_4)
undefined4 param_1;
byte param_2;
char *param_3;  /* was `int` -- same DAT_00086df8-pointer truncation bug
                   as its sibling write_xor_scrambled_block (see that function's
                   comment); this one is reached from the save-slot-copy
                   path (read_player_status_block <- load_player_save_record) rather than
                   write_player_status_block's caller */
short param_4;

{
  short sVar1;
  int iVar2;
  short sVar3;
  byte local_b4 [80];
  byte local_64 [80];
  
  sVar3 = 0;
  iVar2 = 0;
  do {
    param_2 = param_2 + 3;
    local_64[iVar2] = param_2;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 0x50);
  for (; iVar2 = (int)param_4, 0 < iVar2; param_4 = param_4 + -0x50) {
    if (0x4f < iVar2) {
      iVar2 = 0x50;
    }
    sVar1 = read_file_handle(param_1,local_b4,iVar2);
    if (0 < sVar1) {
      iVar2 = 0;
      do {
        *(byte *)(iVar2 + param_3) = local_64[iVar2] ^ local_b4[iVar2];
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < sVar1);
    }
    sVar3 = sVar1 + sVar3;
    param_3 = param_3 + 0x50;
  }
  return sVar3;
}



// was FUN_0007ef78 -- write-side mirror of read_xor_scrambled_block,
// confirmed by write_player_status_block (src/player.c): XOR-
// scrambles param_4 bytes from param_3 against the same rolling
// param_2-derived key, 80 bytes at a time, writing each chunk to file
// handle param_1. Returns the total byte count actually written.
int write_xor_scrambled_block(param_1,param_2,param_3,param_4)
undefined4 param_1;
byte param_2;
char *param_3;  /* was `int` -- truncated the real DAT_00086df8 pointer
                   write_player_status_block passes in, latent until something
                   (write_player_save_record, the player.dat writer) actually called
                   write_player_status_block -- previously only reachable from the
                   Load Game path */
short param_4;

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  byte abStack_80b4 [80];
  byte abStack_8064 [32688];
  byte local_b4 [80];
  byte local_64 [80];
  
  iVar5 = 0;
  iVar1 = 0;
  do {
    param_2 = param_2 + 3;
    local_b4[iVar1] = param_2;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 0x50);
  for (; iVar1 = (int)param_4, 0 < iVar1; param_4 = param_4 + -0x50) {
    iVar2 = 0;
    while( true ) {
      iVar4 = iVar1;
      if (0x4f < iVar1) {
        iVar4 = 0x50;
      }
      iVar2 = (int)(short)iVar2;
      if (iVar4 <= iVar2) break;
      local_64[iVar2] = local_b4[iVar2] ^ *(byte *)(iVar2 + param_3);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    }
    if (0x4f < iVar1) {
      iVar1 = 0x50;
    }
    uVar3 = write_file_handle(param_1,local_64,iVar1);
    iVar5 = iVar5 + (uVar3 & 0xffff);
    param_3 = param_3 + 0x50;
  }
  return iVar5;
}





// was FUN_000352d0 -- scan_area_ahead_of_object callback: flags
// DAT_00101954 if the scanned object (param_3) isn't the player, its
// class-record quality nibble (byte 0xb) is 4, 5, or 9 (a hostile
// creature category), and its own alerted/aware flag (byte 0x19, bit
// 0) is set. Used by check_rest_area_unsafe to detect a nearby
// alerted hostile within resting range.
undefined4 detect_unsafe_rest_object_callback(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
int param_3;

{
  byte bVar1;
  short sVar2;

  sVar2 = encode_object_slot_index(param_3);
  if (((sVar2 != 1) &&
      (((bVar1 = *(byte *)(param_3 + 0xb) & 0xf, bVar1 == 5 || (bVar1 == 4)) || (bVar1 == 9)))) &&
     ((*(byte *)(param_3 + 0x19) & 1) != 0)) {
    DAT_00101954 = 1;
  }
  return 0;
}



// was FUN_00035340 -- scans a radius (0x7f) around the player for an
// alerted hostile creature (detect_unsafe_rest_object_callback) and
// returns whether one was found. handle_rest_action's non-negative
// path reads this to decide whether resting is safe here.
undefined4 check_rest_area_unsafe()

{
  DAT_00101954 = 0;
  scan_area_ahead_of_object(g_player_object,0x7f,detect_unsafe_rest_object_callback,0,0,2);
  return DAT_00101954;
}


// was FUN_0003bee4 -- confirmed by close_panels_before_level_change's
// own cross-reference as a "resurrect/reset-position" path: closes
// UI panels, refreshes equipment effects, clears the player's
// posture/heading bits, resets heading-related globals and the level
// 9 special-state byte, resets the HUD panel animation, un-readies
// the weapon, and clears cursor mode/holding state.
void reset_player_for_resurrection()

{
  uint uVar1;

  close_panels_before_level_change();
  refresh_player_equipment_effects();
  uVar1 = *(ushort *)((char *)g_player_object + 2) & 0xfc7f;
  *(char *)((char *)g_player_object + 2) = (char)uVar1;
  *(char *)((char *)g_player_object + 3) = (char)(uVar1 >> 8);
  *(byte *)((char *)g_player_object + 0x18) = *(byte *)((char *)g_player_object + 0x18) & 0xe0;
  DAT_00201c70 = 0;
  DAT_00201c78 = 0;
  DAT_00086b20 = 1;
  reset_hud_panel_animation_state();
  DAT_00201c94 = 0;
  unready_weapon();
  DAT_000868d8 = 2;
  if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
    pop_cursor_icon(3);
  }
  g_cursor_mode = 0;
  DAT_0024cfc8 = 0;
  DAT_002028d8 = 0;
  if (g_cursor_holding_state != 0) {
    if (g_cursor_holding_state < 4) {
      pop_cursor_icon(3);
      g_selected_object = 0;
      g_cursor_holding_state = 0;
    }
    else {
      g_cursor_holding_state = 0;
      set_view_subject_by_command(1);
    }
  }
  return;
}


// was FUN_0003c038 -- exits the current game mode and transitions
// through the main menu before resuming: for param_1==1 (the player
// death case), shows the "You died" message, the death illustration
// page (0x103), and a 2-second pause before continuing. Waits out any
// pending input, runs the current mode's exit callback (from the
// mode-dispatch table at DAT_000856a4), resets mode state, calls
// reset_player_for_resurrection, runs main_menu_loop(0), then restores
// and re-enters the previous mode's entry callback.
void handle_player_death_and_menu_transition(param_1)
short param_1;

{
  short sVar1;
  code *pcVar2;
  bool bVar3;
  undefined1 auStack_31c [768];

  DAT_0023bf0c = 0;
  reset_cursor_confine_rect();
  if (param_1 == 1) {
    set_hud_status_value(2,0);
    snap_compass_to_heading();
    hud_vitals_threshold_shake(0);
    message_scroll_print_wrapped(s_You_died_000857b8);
    display_book_or_scroll_page(0x103);
    Sleep(2000);
  }
  do {
    sVar1 = next_input_event();
  } while (sVar1 < 0);
  msg_scroll_panel_reset(1);
  /* 0x80, see DAT_00085668's comment. Guarded the same way
     change_game_mode guards its own identical table-callback call --
     this call site was missing the NULL/0xffffffff check entirely,
     so any mode with no registered exit callback (e.g. mode 2, the
     NPC-conversation mode) crashed here with a NULL indirect call. */
  pcVar2 = (code *)(int)DAT_00201b64;
  /* Same 64-bit pointer-sentinel fix as change_game_mode's own identical
     guard -- see its comment. */
  bVar3 = DAT_00201b64 != -1;
  if (bVar3) {
    pcVar2 = *(code **)(&DAT_000856a4 + (int)pcVar2 * 0x80);
  }
  if (bVar3 && pcVar2 != (code *)0x0) {
    (*pcVar2)();
  }
  *(undefined1 *)(DAT_00085a6c + 8) = 0;
  *(undefined1 *)(DAT_00085a6c + 9) = 0;
  DAT_00085a6c[4] = 0; /* mirror to the real byte-8 mode field -- see set_game_mode */
  sVar1 = DAT_00201b64;
  DAT_00201b60 = 0;
  DAT_00201b64 = 0xffff;
  DAT_00201c98 = 0;
  if (param_1 == 1) {
    decrement_cursor_hide_depth();
  }
  reset_player_for_resurrection();
  ce_memmove(auStack_31c,&DAT_00088d98,0x300);
  fade_active_palette_to_black(auStack_31c,2);
  main_menu_loop(0);
  DAT_00201c98 = 1;
  DAT_00201b60 = (undefined2)(1 << ((int)sVar1 & 0xffU));
  DAT_00201b64 = sVar1;
  /* 0x80, see DAT_00085668's comment. */
  (**(code **)(&DAT_00085668 + sVar1 * 0x80))();
  return;
}


// was FUN_0003c6ac -- confirmed by its only call site as a level-9
// (the final/Abyss level) exclusive random environmental hazard: only
// ever rolled 1-in-32 per tick while on that level. Plays effect
// weapon_overlay_flash_once(0xb5), then randomly reduces the player's HP (byte
// g_player_object+8) by a smaller amount at higher HP tiers (0-5 at
// full-ish health, down to a chance of just 1 near death) so it can't
// outright kill, occasionally triggers a stumble animation
// (set_movement_animation_timer), and flashes the HP HUD status.
void apply_level9_random_hazard_tick()

{
  int uw_ord2005_rem_106 = 0; int uw_ord2005_rem_107 = 0; int uw_ord2005_rem_108 = 0; int uw_ord2005_rem_109 = 0; int uw_ord2005_rem_110 = 0;
  uint uVar1;
  ushort uVar2;
  undefined4 uVar3;
  uint uVar4;
  char extraout_r1;
  char cVar5;
  char extraout_r1_00;
  char extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  byte bVar6;

  weapon_overlay_flash_once(0xb5);
  bVar6 = *(byte *)((char *)g_player_object + 8);
  uVar1 = (uint)(short)(ushort)bVar6;
  if (uVar1 < 0x65) {
    if (uVar1 < 0x33) {
      if ((uVar1 < 0x15) || (uVar4 = ce_rand(), (uVar4 & 3) != 0)) {
        if ((1 < uVar1) && (uVar4 = ce_rand(), (uVar4 & 7) == 0)) {
          bVar6 = (byte)((uVar1 - 1) * 0x10000 >> 0x10);
        }
        goto LAB_0003c780;
      }
      uVar3 = ce_rand();
      uw_ord2005_rem_106 = ((int)(uVar3)) % (3);
      cVar5 = uw_ord2005_rem_106;
    }
    else {
      uVar3 = ce_rand();
      uw_ord2005_rem_107 = ((int)(uVar3)) % (4);
      cVar5 = uw_ord2005_rem_107;
    }
  }
  else {
    uVar3 = ce_rand();
    uw_ord2005_rem_108 = ((int)(uVar3)) % (6);
    cVar5 = uw_ord2005_rem_108;
  }
  bVar6 = bVar6 - cVar5;
LAB_0003c780:
  *(byte *)((char *)g_player_object + 8) = bVar6;
  uVar3 = ce_rand();
  uw_ord2005_rem_109 = ((int)(uVar3)) % (0xc);
  if (uw_ord2005_rem_109 != 0) {
    uVar3 = ce_rand();
    uw_ord2005_rem_110 = ((int)(uVar3)) % (0x1e);
    set_movement_animation_timer(0x40,(uw_ord2005_rem_110 & 0xff) + 0xf);
  }
  uVar2 = ce_rand();
  set_hud_status_value(2,uVar2 & 0xf);
  return;
}


// was FUN_0003dba0 -- dispatch_special_action's case-1 handler for
// sub-codes 3/5 (uw.c, src/object_actions.c:896). If the target is the
// player and the player isn't already airborne (DAT_002048a8 bit 0x10,
// the locomotion-state "jumping/falling" bit), launches them upward
// (g_vertical_velocity = 0x8d) and resets fall acceleration to 0 --
// reads as "trigger a jump if grounded" (e.g. a jump-pad tile effect).
void trigger_player_jump_if_grounded(param_1)
int param_1;

{
  if (param_1 == g_player_object) {
    if ((DAT_002048a8 & 0x10) == 0) {
      g_vertical_velocity = 0x8d;
    }
    g_fall_accel = 0;
  }
  return;
}



// was FUN_0003dbd8 -- called once per player-update tick
// (src/player.c:759, right after the per-frame ambient-light/flicker
// update). Forces set_locomotion_state to recompute off the current
// DAT_002048a8 state (param_2=1, the "force" flag) and sets
// DAT_000858a0, a movement-dirty flag checked alongside g_fall_accel
// in src/movement.c's redraw/update-pending conditions.
void force_locomotion_state_refresh()

{
  set_locomotion_state(DAT_002048a8,1);
  DAT_000858a0 = 1;
  return;
}



// was FUN_0003dc04 -- one of apply_quest_vertical_effect's two
// sub-effects (bit 2). Computes a vertical launch velocity from
// param_1 (rounds toward zero before the >>2, then scales), forces
// fall acceleration into its "in flight" state (-2, unless already in
// the steeper -4 state), and halves the horizontal momentum decay
// counters DAT_00204886/DAT_00204888 (also rounding toward zero).
void apply_vertical_launch_impulse(param_1)
short param_1;

{
  int iVar1;

  if (g_fall_accel != -4) {
    g_fall_accel = -2;
  }
  iVar1 = param_1 * 0x2f;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 3;
  }
  g_vertical_velocity = (short)(iVar1 >> 2);
  iVar1 = (int)DAT_00204886;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 1;
  }
  DAT_00204886 = (short)(iVar1 >> 1);
  iVar1 = (int)DAT_00204888;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 1;
  }
  DAT_00204888 = (short)(iVar1 >> 1);
  return;
}



// was FUN_0003dc6c -- apply_quest_vertical_effect's other sub-effect
// (bit 1). Always the same fixed-duration animation-timer trigger
// (set_movement_animation_timer(0x40,0x1e)); reads as a scripted
// "stumble" animation cue. Its only call site passes an argument this
// function's own declaration doesn't accept (K&R silently discards
// it) -- unlike report_categorized_fatal_error's dropped PARAMETER
// earlier in this pass, there's only ONE call site here and the
// animation is always the same fixed timing, so this is left as a
// no-arg function rather than guessed into taking one.
void trigger_quest_stumble_animation()

{
  set_movement_animation_timer(0x40,0x1e);
  return;
}



// was FUN_0003dc78 -- dispatch_quest_event_code's handler for quest
// codes 0x3c-0x3e (src/traps.c:562, gated on the trap/link record's
// trigger context being the player), called as
// apply_quest_vertical_effect(code-0x3b, linkval&0x3f) so param_1 in {1,2,3}. Bit 0
// (codes 0x3c,0x3e) triggers the stumble animation; bit 1 (codes
// 0x3d,0x3e) applies the vertical launch impulse sized by param_2.
// Reads as a scripted "quest event moves/jolts the player" dispatcher.
void apply_quest_vertical_effect(param_1,param_2)
ushort param_1;
undefined4 param_2;

{
  if ((param_1 & 1) != 0) {
    trigger_quest_stumble_animation(param_2);
  }
  if ((param_1 & 2) != 0) {
    apply_vertical_launch_impulse(param_2);
  }
  return;
}


// was FUN_00053ab0 -- manages the player's active-light-source list
// (a small array at DAT_00086df8+0x3e, count tracked in bits 6-9 of
// the status word at +0x5f/+0x60): confirmed by handle_light_source_click's
// own comment as "cycle the active light source" on a UI click, and
// also called from the per-tick updater (update_player_tick_effects).
// For slot *param_1, a specific type/severity match (type 1,
// severity 0x30 or 0x50) escalates it into a staging slot at +0x1f+
// index instead of removing it; otherwise removes the slot from the
// active list (swap-with-last-and-shrink) and decrements the count,
// returning 1 once the list is exhausted. A type-0xb/severity-0x10
// match also forces the view via set_view_subject_by_command.
undefined4 cycle_active_light_source(param_1)
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



// was FUN_00053c74 -- periodic player-tick updater, called from
// player.c roughly every 20 realtime-clock ticks: cycles/decays every
// active light source (cycle_active_light_source) and refreshes
// equipment effects on a change, processes a second pending-effect
// mask at +0x61 bits 2-3, applies queued HP/hazard damage flagged in
// DAT_002046cc, triggers apply_drowning_hazard (not yet named) once liquid-
// submersion depth (+0xb9) exceeds a threshold, and every 3rd call
// (DAT_002046d0 % 3 == 0) applies typed damage for an active +0x5f
// bits 2-5 condition and rolls a skill check.
void update_player_tick_effects()

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
        iVar10 = cycle_active_light_source(local_20);
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
  iVar7 = decay_equipped_light_sources(1,uVar6);
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
    apply_drowning_hazard();
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
    sVar5 = ce_rand();
    adjust_player_hunger(-3 - ((int)sVar5 & 3U));
    uVar6 = (uint)*(ushort *)(DAT_00086df8 + 0x61);
    if ((*(ushort *)(DAT_00086df8 + 0x61) & 0x3f0) != 0) {
      uVar6 = ((uVar6 & 0xfff0) - 1 ^ uVar6) & 0x3f0 ^ uVar6;
      *(char *)(DAT_00086df8 + 0x61) = (char)uVar6;
      *(char *)(DAT_00086df8 + 0x62) = (char)(uVar6 >> 8);
    }
    uVar6 = ce_rand();
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


// was FUN_0005404c -- burns fuel on the player's equipped light
// sources (g_light_source_slots, 4 slots): for each equipped item
// whose type falls in the light-source category and has a valid
// radius (g_light_radius_table), rolls fuel consumption from elapsed
// time param_2 (and a second roll when param_1 > 1), decrementing the
// item's fuel field or, once exhausted, its charge count -- at zero
// charges, redraws the slot, recomputes ambient lighting
// (set_ambient_bias_without_light), and returns 1. Confirmed as "the
// light-fuel-burn loop" by an existing comment in player.c.
undefined4 decay_equipped_light_sources(param_1,param_2)
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
        /* Was two separate ordint_divmod calls on the same (cVar1,
           param_2) pair -- one bare (wanting the remainder via a
           never-populated extraout_r1), one capturing the quotient
           via a dropped-dividend second call. One real call now,
           both halves named off its divmod_result. */
        divmod_result dmr4414 = ordint_divmod(cVar1,param_2);
        extraout_r1 = dmr4414.rem;
        uVar8 = (ushort)(extraout_r1 == 0);
        if (1 < param_1) {
          sVar5 = dmr4414.quot;
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



// was FUN_000541d0 -- drowning hazard tick, called once liquid-
// submersion depth (DAT_00086df8+0xb9) exceeds a threshold: rolls a
// skill check (+0x34, swimming-like stat) against a light-encumbrance-
// derived difficulty, and on failure (while depth is still below
// 0x8c/140) increases the depth further via roll_dice_sum -- i.e.
// struggling/sinking deeper. Once depth exceeds 0x78/120, rolls again
// and on failure flashes a damage overlay and applies typed damage to
// the player -- i.e. drowning damage.
void apply_drowning_hazard()

{
  undefined1 uVar1;
  char cVar2;
  char *iVar3;
  
  iVar3 = DAT_00086df8;
  uVar1 = 0;
  if (*(short *)(DAT_00086df8 + 0x4c) != 0) {
    uVar1 = ordint_divmod(*(short *)(DAT_00086df8 + 0x4c),(uint)*(ushort *)(DAT_00086df8 + 0x4a) << 5
                        ).quot;
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
      iVar1 = transition_to_level(DAT_00201b68, DAT_00201c7c);
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
