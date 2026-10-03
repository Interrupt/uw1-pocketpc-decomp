/* Dungeon-view visibility and per-frame draw-list build: texture-id
 * list loading, the visibility light grid/ray flood-fill, and the
 * top-level per-frame redraw dispatch (full/timed/rebuild). Split out
 * of uw.c (the original monolithic decompile) once these functions'
 * real roles were confirmed.
 */
#include "headers/visibility.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define _DAT_0023aee1 (*(uint*)&DAT_0023aee1)
#define _DAT_0023aee3 (*(uint*)&DAT_0023aee3)
#define _DAT_0023af02 (*(uint*)&DAT_0023af02)
/* Set by the force-3D-redraw hack in main_loop_hud_flush around its
   per-frame full_dungeon_redraw() call: tells rebuild_dungeon_view to skip
   its passive experience-point trickle (grant_experience_points), which otherwise
   fires once per redraw and -- called with a dropped arg (garbage XP
   amount) -- walks into the level-up message path and crashes. A cosmetic
   forced repaint must not touch game state anyway. */
int g_force_redraw_no_xp;
// was DAT_0023bca0 -- per-level view-distance default, loaded from
// SHADES.DAT's per-record field 3 by load_shading_level_config (see its own
// comment) and, since this session, consumed by
// extend_visibility_ray_row as the automap-reveal flood's real
// max-ring-passes limit (was a flat hardcoded 16). Also still passed
// (dropped-argument bug, unrelated, not fixed here) to
// weapon_overlay_flash_hold/weapon_overlay_flash_restore, and to the otherwise-dead
// build_visibility_light_grid.
short g_visibility_max_ring_passes;
 undefined2 DAT_0023ae58_backing[8192];
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
char *DAT_0023ae34;
char *DAT_0023ae30;
/* Parallel array to DAT_0024f090 (0x3a/58 entries) -- see that array's
   own comment. */
static undefined1 DAT_0024f0ca_backing[64];
#define DAT_0024f0ca DAT_0024f0ca_backing[0]
undefined2 DAT_0023adb0;
 undefined2 DAT_0023aeb8_backing[8192];
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
/* Really a 58 (0x3a)-entry byte array, paired with the parallel
   DAT_0024f0ca array right below -- reset_texture_id_lists's own loop
   proves the bound (`for (iVar3 = ...; iVar3 < 0x3a; ...)` zeroing both
   `(&DAT_0024f090)[iVar3]` and `(&DAT_0024f0ca)[iVar3]`). Was a lone
   scalar relying on DAT_0024f0ca happening to sit exactly 0x3a bytes
   later in memory (an earlier loop in the same function reached it via
   `puVar4[0x3a]` off a `&DAT_0024f090 + iVar3` base) -- that adjacency
   was never guaranteed and broke once this cleanup pass's global
   reorganization moved other variables in between. Given real backing
   storage here and the offset hack rewritten to address DAT_0024f0ca by
   name instead (see reset_texture_id_lists). */
static undefined1 DAT_0024f090_backing[64];
#define DAT_0024f090 DAT_0024f090_backing[0]
static char s_bad_tmap_ids_size_000869b7[] = "bad_tmap_ids_size";
/* High byte of DAT_0023b840's packed short (write pattern: `(&DAT_0023b840)[i]
   = low; (&DAT_0023b841)[i] = high;`, read back combined via CONCAT11 and
   via `*(short*)(&DAT_0023b840 + offset)` in saveload.c/resources.c) --
   needs to sit exactly 1 byte after DAT_0023b840's own real storage
   (DAT_0023b840_backing, resources.c), not its own independent array.
   An earlier widening pass (code-cleanup-pass-2) gave it one anyway,
   silently breaking that combined-read (same failure class as
   DAT_00086980/82/84's fix in movement.c). */
#define DAT_0023b841 DAT_0023b840_backing[1]
/* Was a lone `undefined` scalar. It is the base of the texture / shade /
   colour-light table arena: load_dungeon_texture_arenas sets
   DAT_0023ae38 = &DAT_002049e0 and loads several .tr/.dat files into
   it, then get_texture_page hands out `&DAT_002049e0 + page*stride`
   pointers. Needs real backing storage (1 MB is comfortably more
   than UW1's texture set). */
undefined1 DAT_002049e0_backing[0x100000];
static char s__DATA_terrain_dat_000869ec[] = "\\DATA\\terrain.dat";
// was DAT_0023b01c -- set by the 3D-viewport setup function
// (configure_dungeon_viewport) whenever the real in-game dungeon-view mode (game
// mode bit 0, not a menu/conversation overlay) is active; gates
// weapon_overlay_and_full_redraw's weapon-overlay draw.
undefined4 g_dungeon_view_active;
undefined2 DAT_0023b020;
undefined2 DAT_0023aed4;
undefined2 *DAT_0023aed0;
static short DAT_0023b4cc;
static char s_R__lu_P__lu_S__lu_F__d__d_00086b04[] = "R:%lu_P:%lu_S:%lu_F:%d.%d";
static undefined1 DAT_0023b4a8_backing[65536];
#define DAT_0023b4a8 DAT_0023b4a8_backing[0]
static int DAT_0023aec8;
static ushort DAT_0023b4c8;
static undefined1 DAT_0023b028;
static undefined *DAT_0023b02c;
/* Lookup/gradient table in build_visibility_light_grid, indexed up to
   (16*0x21+32)*2=1120 -- confirmed overflowing into the unrelated
   DAT_00248410 via an lldb watchpoint (same symptom, second distinct
   overflow source found reaching that same global). Widened. */
static undefined1 DAT_0023b039_backing[4096];
#define DAT_0023b039 DAT_0023b039_backing[0]
static undefined1 g_visibility_ring_done;
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
static undefined1 g_visibility_ray_table_backing[1024];
#define g_visibility_ray_table g_visibility_ray_table_backing[0]
/* Real-pointer side table for this record array's "back pointer" field
   (offsets 9/0xa-0xb/0xc), which the original 32-bit binary packed as raw
   bytes -- see advance_visibility_ray's comment on why that can't be reassembled
   into a real 64-bit pointer on this port. Only entry 0 (the player's own
   visibility-ray slot, the only one seed_visibility_queue ever populates in a
   monster-free dungeon) is written; other entries stay NULL, matching
   the "unpopulated" state advance_visibility_ray's own `(*param_1 & 0x80) == uVar1`
   guard already treats as "nothing to look up" for a zeroed record. */
static char *g_visibility_ray_realptr[24];
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
static char *g_visibility_ray_realptr2[24];
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
/* {0x10, 0x00}: compute_visibility_ray_offset reads (&DAT_00086af0)[bool].
   Was a silently-zero undefined4. */
static const undefined1 DAT_00086af0_arr[4] = { 0x10, 0x00, 0x00, 0x00 };
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
static const undefined1 DAT_00086af8_region[12] = {
  0x02,0x00, 0x04,0x00, 0x02,0x00, 0x03,0x00, 0xff,0xff, 0x01,0x00,
};
#define DAT_00086af8 (*(undefined1 *)(DAT_00086af8_region + 0))
#define DAT_00086afc (*(undefined1 *)(DAT_00086af8_region + 4))
#define DAT_00086b00 (*(undefined1 *)(DAT_00086af8_region + 8))
short g_visibility_ring_depth;
undefined1 g_visibility_ring_buffer_backing[32768];
static undefined DAT_00086b34;
undefined2 DAT_00189578;
undefined DAT_0023b4dc;
short DAT_00086b2c;
undefined2 DAT_00189582;
short DAT_00086b28;
ushort DAT_0023adc0;
static char s__DATA_f16_tr_00086dd8[] = "\\DATA\\f16.tr";
static char s__DATA_f32_tr_00086de8[] = "\\DATA\\f32.tr";
static char s__DATA_shades_dat_000872a4[] = "\\DATA\\shades.dat";
char s__DATA_light_dat_000872c8[] = "\\DATA\\light.dat";
static char s__DATA_xfer_dat_000872d8[] = "\\DATA\\xfer.dat";
static char s_cLightTabs_allocation_error_____000872e8[] = "cLightTabs_allocation_error_...";
static undefined1 DAT_0024fa38_backing[3072];
#define DAT_0024fa38 DAT_0024fa38_backing[0]

/* Only entries 0 and 1 (the player's own visibility-ray slot, always populated
   by seed_visibility_queue) are ever given a real pointer -- a monster-free
   dungeon has nothing to populate the other 14 with. But this queue's
   chain-walk can still legitimately reach an unpopulated entry (its
   "next" link byte isn't reliably reset to the 0xf end-of-chain sentinel
   between frames), which would otherwise be a NULL-pointer crash. Route
   an unset (NULL) table entry to this shared zeroed scratch record
   instead of dereferencing NULL -- keeps the walk/arithmetic in this
   subsystem well-defined without having to fully model every field an
   empty slot could still be read through. */
static char g_visibility_ray_fallback[64];
#define VISIBILITY_RAY_REALPTR(table, idx) \
    ((table)[(idx)] != 0 ? (table)[(idx)] : g_visibility_ray_fallback)
/* Slot 16 (past the 0..15 nibble-addressable real entries) is a scratch
   slot for merge_adjacent_visibility_rays's acStack_28 -- a stack-local COPY of
   a real entry that the un-stubbed extend_visibility_ray_row / the spreading
   branch walk in place. Its `(ptr - g_visibility_ray_table_backing) / 0x15` index
   would be a wild value, so visibility_ray_idx() folds any pointer
   outside the backing array to this slot; merge_adjacent_visibility_rays seeds
   the slot from the source entry's real pointers right before the copy. */
#define VISIBILITY_RAY_SCRATCH_IDX 16
static int visibility_ray_idx(const void *p) {
    intptr_t off = (intptr_t)p - (intptr_t)g_visibility_ray_table_backing;
    if (off < 0 || off + 0x15 > (intptr_t)sizeof(g_visibility_ray_table_backing))
        return VISIBILITY_RAY_SCRATCH_IDX;
    return (int)(off / 0x15);
}






// was FUN_0005b054 -- reset texture id lists to identity + default counts (0x30 wall, 10 floor)
undefined4 reset_texture_id_lists()

{
  int iVar1;
  int iVar2;
  int iVar3;

  iVar3 = 0;
  do {
    (&DAT_0023ae58)[iVar3] = (short)iVar3;
    (&DAT_0023add0)[iVar3] = 0;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 0x30);
  iVar3 = 0;
  do {
    (&DAT_0023adb8)[iVar3] = (short)iVar3;
    (&DAT_0023ae40)[iVar3] = 0;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 10);
  iVar3 = 0;
  do {
    (&DAT_0023b840)[iVar3] = (char)iVar3;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 6);
  DAT_0023adb0 = 0x30;
  DAT_0023aeb8 = 10;
  load_dungeon_texture_arenas();
  /* Was `puVar4 = &DAT_0024f090 + iVar3; *puVar4 = 0; puVar4[0x3a] = 0;`
     -- the `[0x3a]` reached for DAT_0024f0ca by relying on it sitting
     exactly 0x3a bytes after DAT_0024f090 in memory (see both arrays'
     own comment). Addressed by name directly instead, now that each has
     its own real backing storage. */
  iVar3 = 0;
  do {
    iVar1 = (iVar3 + 1) * 0x10000;
    iVar2 = iVar1 >> 0x10;
    if (iVar3 < 0xc) {
      (&DAT_0024f090)[iVar3] = 0;
      (&DAT_0024f0ca)[iVar3] = 0;
    }
    iVar3 = iVar2;
  } while (iVar2 < 0x30);
  for (iVar3 = (int)(short)((uint)iVar1 >> 0x10); iVar3 < 0x3a;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10) {
    (&DAT_0024f090)[iVar3] = 0;
    (&DAT_0024f0ca)[iVar3] = 0;
  }
  return 1;
}



// was FUN_0005b188 -- read the level's 0x7a-byte tmap-id block (48 wall + 10 floor + 3) from the .ark
bool load_level_texture_ids(param_1,param_2)
/* .ark handle-struct pointer -- was `undefined4`, truncating it before
   read_archive_entry. */
undefined1 * param_1;
int param_2;

{
  int iVar1;
  undefined2 uVar2;
  short sVar3;
  int iVar4;
  /* local_90[48] / local_30[10] / local_1c[6] were separate Ghidra
     locals whose names encode adjacent stack offsets (-0x90, -0x30,
     -0x1c) -- one contiguous 128-byte / 64-short region. read_archive_entry
     reads exactly 0x7a = 122 bytes into it (96 + 20 + 6), overflowing
     local_90 into the other two by design. As separate arrays with a
     stack canary between them that read smashed the canary (SIGABRT).
     Merged: local_90[i] -> [i], local_30[i] -> [48+i], local_1c[i] ->
     [58+i]. */
  undefined2 local_tmap_buf [64];

  sVar3 = read_archive_entry(param_1,param_2 + 0x11,local_tmap_buf);
  if (sVar3 != 0x7a) {
    debug_print(s_bad_tmap_ids_size_000869b7 + 1);
  }
  iVar4 = 0;
  do {
    (&DAT_0023add0)[iVar4] = 0;
    iVar1 = (iVar4 + 1) * 0x10000 >> 0x10;
    (&DAT_0023ae58)[iVar4] = local_tmap_buf[iVar4];
    iVar4 = iVar1;
  } while (iVar1 < 0x30);
  iVar4 = 0;
  do {
    (&DAT_0023ae40)[iVar4] = 0;
    iVar1 = (iVar4 + 1) * 0x10000 >> 0x10;
    (&DAT_0023adb8)[iVar4] = local_tmap_buf[48 + iVar4];
    iVar4 = iVar1;
  } while (iVar1 < 10);
  load_terrain_texture_props((char *)&DAT_0023ae58,(char *)&DAT_0023adb8);
  if (getenv("UW_DEBUG_TEXIDS")) {
    int _i;
    fprintf(stderr, "[texids] wall:");
    for (_i = 0; _i < 0x30; _i++) fprintf(stderr, " %d", (int)(&DAT_0023ae58)[_i]);
    fprintf(stderr, "\n[texids] floor:");
    for (_i = 0; _i < 10; _i++) fprintf(stderr, " %d", (int)(&DAT_0023adb8)[_i]);
    fprintf(stderr, "\n");
  }
  iVar4 = 0;
  do {
    uVar2 = local_tmap_buf[58 + iVar4];
    (&DAT_0023b840)[iVar4 * 2] = (char)uVar2;
    (&DAT_0023b841)[iVar4 * 2] = (char)((ushort)uVar2 >> 8);
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 3);
  load_dungeon_texture_arenas();
  return sVar3 == 0x7a;
}




/* param_2 (a short* remap/index table) and param_4 (the destination
   arena region) were `int`, truncating the real pointers -- fread'ing
   texture data through a chopped &DAT_002049e0 segfaulted the moment
   the .tr files actually opened. Three of the four call sites also had
   param_4 dropped by Ghidra (stale-register reuse); restored. */
// was FUN_0005b514 -- load selected entries of a .tr texture file (ids in list param_2) into an arena
void load_texture_arena(param_1,param_2,param_3,param_4)
char *param_1;
short *param_2;
short * param_3;
char *param_4;

{
  int iVar1;
  char *iVar2; /* was int -- ce_calloc() offset-table allocation */
  int iVar3;
  int iVar4;
  int iVar5;
  byte local_24 [2];
  short local_22;

  iVar1 = open_file_for_read(param_1);
  if (iVar1 == -1) {
    /* param_1 is built from "\DATA\" (s__DATA__00085970) with no filename
       ever appended -- Ghidra dropped whatever ce_strcat call(s) would
       have added the actual texture-LUT filename (same unrecoverable-
       string-reference class as the .GR extension fix in open_gr_resource_file,
       but here the reference vanished entirely rather than resolving to
       a wrong guess, and none of the candidate DATA files match the
       expected "byte 0 == 2" format header, so there's nothing to guess
       from). Skip this texture-LUT load instead of the original fatal
       error -- textures loaded through this path will be missing/blank
       rather than crashing the whole game. */
    *param_3 = 0;
    return;
  }
  read_file_handle(iVar1,local_24,1);
  if (local_24[0] != 2) {
    report_fatal_error_and_exit(0x3010);
  }
  read_file_handle(iVar1,local_24,1);
  iVar5 = (uint)local_24[0] * (uint)local_24[0];
  read_file_handle(iVar1,&local_22,2);
  iVar2 = ce_calloc(4,(int)local_22);
  if (iVar2 == 0) {
    report_fatal_error_and_exit(0x1008);
    iVar3 = (int)local_22;
  }
  else {
    read_file_handle(iVar1,iVar2,(int)local_22 << 2);
    iVar3 = 0;
    if (0 < *param_3) {
      iVar3 = 0;
      do {
        /* Ghidra kept a byte *2 scale from the original `*(short*)((char*)base
           + i*2)` but also retyped param_2 as short* -- the two compound, so
           this read every OTHER id (idlist[0], idlist[2], idlist[4]...). That
           loaded F32.TR[7,42,5,29,16,0,0,0,0,0] into the 10-slot arena instead
           of F32.TR[7,4,42,1,5,0,29,12,16,15], so floor slot 9 (= the ceiling,
           get_texture_page(0x39)) came out F32.TR[0] (cobblestone) rather than
           the level's real ceiling id 15. Read ids consecutively. */
        iVar4 = (int)param_2[iVar3];
        if (iVar4 < 0) break;
        seek_file_handle(iVar1,*(undefined4 *)(iVar2 + iVar4 * 4),0);
        iVar4 = read_file_handle(iVar1,param_4,iVar5);
        if (iVar4 != iVar5) {
          report_fatal_error_and_exit(0x3012);
        }
        iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
        param_4 = iVar5 + param_4;
      } while (iVar3 < *param_3);
    }
  }
  *param_3 = (short)iVar3;
  LocalFree(iVar2);
  CloseHandle(iVar1);
  return;
}



// was FUN_0005b660 -- load TERRAIN.DAT texture-property words -> DAT_0023add0 (wall) / DAT_0023ae40 (floor)
void load_terrain_texture_props(param_1,param_2)
/* Both are bases into the tmap-id arrays load_level_texture_ids fills
   (&DAT_0023ae58 and &DAT_0023adb8) -- Ghidra dropped both args at the
   lone call site and typed them `int`, so the reads below hit a bogus
   address and segfaulted level init. Kept as byte-addressed pointers so
   the existing `iVar4 * 2 + paramN` arithmetic stays correct. */
char *param_1;
char *param_2;

{
  char stack0xffdc3238_buf [256];
  char *stack0xffdc3238_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  char acStack_120 [260];
  
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3238_ptr = acStack_120;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3238_ptr = cVar1; stack0xffdc3238_ptr = stack0xffdc3238_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_120,s__DATA_terrain_dat_000869ec);
  iVar3 = open_file_for_read(acStack_120);
  if (iVar3 != 0) {
    iVar4 = 0;
    do {
      seek_file_handle(iVar3,(int)*(short *)(iVar4 * 2 + param_1) << 1,0);
      read_file_handle(iVar3,&DAT_0023add0 + iVar4,2);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 0x30);
    iVar4 = 0;
    do {
      seek_file_handle(iVar3,(*(short *)(iVar4 * 2 + param_2) + 0x100) * 2,0);
      read_file_handle(iVar3,&DAT_0023ae40 + iVar4,2);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 10);
    CloseHandle(iVar3);
  }
  return;
}




// was FUN_0005b890 -- reset the draw-command list write cursor DAT_00110fc0 back to its base DAT_0023aed0
void draw_command_list_rewind()

{
  DAT_00110fc0 = DAT_0023aed0;
  return;
}



// was FUN_0005b8ac -- per-frame teardown: free the scratch geometry / clip-vertex lists (DAT_0023c7a0[0x140], DAT_002020f8[0x80]) via LocalFree
void free_frame_geometry_buffers()

{
  void **piVar1;
  int iVar2;

  /* DAT_0023c7a0 is now a real void*[] (see its declaration); walk it as
     one so whole 8-byte slots clear (the old int* stride freed/zeroed only
     the low half of each pointer). Same fix applied to DAT_002020f8
     below (was still `int *piVar1`, missed when DAT_0023c7a0 got this
     treatment -- both are real void*[] now, see their declarations). */
  {
    int _i;
    for (_i = 0; _i < 0x140; _i++) {
      if (DAT_0023c7a0_arr[_i] != 0) { LocalFree(); DAT_0023c7a0_arr[_i] = 0; }
    }
  }
  piVar1 = &DAT_002020f8;
  iVar2 = 0x80;
  do {
    if (*piVar1 != 0) {
      LocalFree();
      *piVar1 = 0;
    }
    iVar2 = iVar2 + -1;
    piVar1 = piVar1 + 1;
  } while (iVar2 != 0);
  return;
}




// was FUN_0005bb5c
void full_dungeon_redraw()

{
  build_frame_draw_list();
  draw_command_list_rewind();
  rebuild_dungeon_view();
  finalize_glyph_draw_command(0xa0);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  set_viewport_clip_rect(0x34,0x13,DAT_0023b020 + 0x33,DAT_0023aed4 + 0x12);
  render_dungeon_view();
  set_viewport_clip_rect(0,0,0x13f,199);
  return;
}



// was FUN_0005bbe0 -- timed dungeon-view redraw: rebuild the draw list if needed, run render_dungeon_view, measure it (read_realtime_clock_units) and feed an adaptive-quality value
void render_dungeon_frame_timed()

{
  int uw_ord2005_rem_122 = 0;
  short sVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  short extraout_r1;
  short sVar9;
  undefined1 auStack_60 [60];
  
  DAT_0023aec8 = read_realtime_clock_units();
  iVar8 = build_frame_draw_list();
  if (iVar8 != 0) {
    draw_command_list_rewind();
    rebuild_dungeon_view();
    finalize_glyph_draw_command(0xa0);
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
  }
  set_viewport_clip_rect(0x34,0x13,DAT_0023b020 + 0x33,DAT_0023aed4 + 0x12);
  dirty_rect_union(0x13,0x84,0x34,0xe0);
  iVar8 = read_realtime_clock_units();
  iVar8 = iVar8 - DAT_0023aec8;
  iVar4 = render_dungeon_view();
  iVar5 = read_realtime_clock_units();
  if (g_dungeon_view_active != 0) {
    weapon_swing_draw_tick();
  }
  track_hotspot_hover_state();
  flush_dungeon_frame();
  redraw_hotspot_border_cursor();
  set_viewport_clip_rect(0,0,0x13f,199);
  iVar6 = read_realtime_clock_units();
  iVar7 = (iVar6 - iVar5) + iVar4 + iVar8;
  if (iVar7 == 0) {
    sVar2 = 0;
  }
  else {
    sVar2 = ordfloat_double_mul(iVar7,0xa00);
  }
  sVar1 = DAT_0023b4c8;
  iVar7 = (int)(short)DAT_0023b4c8;
  sVar9 = DAT_0023b4cc - *(short *)(&DAT_0023b4a8 + iVar7 * 2);
  sVar3 = ordint_divmod(10,(int)sVar2);
  *(short *)(&DAT_0023b4a8 + iVar7 * 2) = sVar3;
  DAT_0023b4cc = sVar9 + sVar3;
  DAT_0023b4c8 = sVar1 + 1U & 0xf;
  uw_ord2005_rem_122 = ((int)((int)sVar2)) % (10);
  ce_sprintf(auStack_60,s_R__lu_P__lu_S__lu_F__d__d_00086b04,iVar4,iVar8,iVar6 - iVar5,(int)sVar3,
              (int)uw_ord2005_rem_122);
  return;
}



// was FUN_0005bc38 -- build the per-frame HUD + world draw-command list (opcodes into DAT_00110fc0) and run the visibility pass walk_visible_tiles; returns nonzero if it rebuilt
undefined4 build_frame_draw_list()

{
  short sVar1;
  undefined2 uVar2;
  undefined1 extraout_r1;
  byte bVar3;
  
  update_current_view_from_subject();
  DAT_00101938 = (short)(char)((ushort)g_current_view->view_x >> 8);
  DAT_0010193c = (short)(char)((ushort)g_current_view->view_y >> 8);
  DAT_0023aecc = tilemap_lookup(DAT_00101938,DAT_0010193c); // was called with no args (dropped-arg bug); tile coords computed just above
  bVar3 = (byte)((short)(g_current_view->view_facing >> 0xd) + 1 >> 1) & 3;
  DAT_0023b02c = &DAT_00086a20 + (char)bVar3 * 0x10;
  /* Dropped-remainder bug, same class fixed elsewhere this session.
     Dropped-dividend too (single-arg call): the real ARM code's second
     register still held bVar3 here, so reconstructed as bVar3 % 2
     (quadrant parity) -- but DAT_0023b028 has no reader anywhere else
     in this decompile, so this is a dead store either way and the
     reconstruction is unverified against any observable behavior. */
  extraout_r1 = (char)((int)bVar3 % 2);
  DAT_0023b028 = extraout_r1;
  DAT_0023b4a0 = bVar3;
  sync_camera_from_player();
  g_current_view->view_x = g_current_view->view_x & 0xff;
  g_current_view->view_y = g_current_view->view_y & 0xff;
  if (DAT_0023b4a0 == 1) {
    uVar2 = g_current_view->view_x;
    g_current_view->view_x = 0xff - g_current_view->view_y;
    g_current_view->view_y = uVar2;
  }
  else {
    if (DAT_0023b4a0 == 2) {
      g_current_view->view_x = 0xff - g_current_view->view_x;
      sVar1 = g_current_view->view_y;
    }
    else {
      if (DAT_0023b4a0 != 3) goto LAB_0005bd98;
      sVar1 = g_current_view->view_x;
      g_current_view->view_x = g_current_view->view_y;
    }
    g_current_view->view_y = 0xff - sVar1;
  }
LAB_0005bd98:
  g_current_view->view_facing =
       g_current_view->view_facing - *(short *)(&DAT_00086a18 + (char)DAT_0023b4a0 * 2);
  return 1;
}



// was FUN_0005bdcc
void build_visibility_light_grid(param_1)
short param_1;

{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  undefined1 local_30 [16];
  
  iVar1 = (int)param_1;
  if (iVar1 < 0x10) {
    iVar4 = 0;
    do {
      if (iVar1 < iVar4) {
        local_30[iVar4] = 0xf;
      }
      else {
        sVar2 = (short)((iVar4 << 8) >> 5);
        sVar2 = integer_sqrt((int)sVar2 * (int)sVar2 * 0x20000 >> 0x10);
        iVar3 = (int)DAT_002506dc + (int)(short)((int)sVar2 * (int)DAT_0025063c >> 6);
        sVar2 = (short)iVar3;
        if (iVar3 * 0x10000 >> 0x10 < 0) {
          sVar2 = 0;
        }
        iVar3 = ((int)DAT_0025064c + (int)sVar2) * 0x10000 >> 0x10;
        if (0xe < iVar3) {
          iVar3 = 0xe;
        }
        local_30[iVar4] = (char)iVar3;
      }
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 0x10);
    iVar4 = 0;
    do {
      iVar3 = 0;
      do {
        sVar2 = integer_sqrt((0x10 - iVar3) * (0x10 - iVar3) + iVar4 * iVar4);
        if (iVar1 < sVar2) {
          (&DAT_0023b039)[(iVar4 * 0x21 + iVar3) * 2] = 0xf;
        }
        else {
          (&DAT_0023b039)[(iVar4 * 0x21 + iVar3) * 2] = local_30[sVar2];
        }
        iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      } while (iVar3 < 0x21);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 0x11);
  }
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0005bf40
void seed_visibility_queue()

{
  /* DAT_0023aecc is the player's current tile record; it is NULL when the
     player position is outside the 64x64 map. That should not happen (the
     collision sweep is meant to keep the player in bounds) but a residual
     movement bug can still push them off the edge -- skip the visibility
     seed rather than segfaulting the whole game. */
  if (DAT_0023aecc == (char *)0x0) {
    g_visibility_ring_done = 0xf;
    return;
  }
  if ((*DAT_0023aecc & 0xf) == 0) {
    g_visibility_ring_done = 0xf;
  }
  else {
    g_visibility_ring_done = 0;
    g_visibility_ray_table = 0x81;
    DAT_0023aee5 = 0;
    DAT_0023aee7 = 0;
    DAT_0023aee6 = (undefined1)g_current_view->view_x;
    DAT_0023aee8 = (undefined1)g_current_view->view_y;
    DAT_0023aeea = (undefined2)((uint)DAT_0023aecc >> 8);
    DAT_0023aeec = (undefined1)((uint)DAT_0023aecc >> 0x18);
    DAT_0023aeed = 0x58;
    DAT_0023aeee = 0x23b0;
    DAT_0023aef0 = 0;
    g_visibility_ray_realptr2[0] = (char *)&g_visibility_ring_buffer_backing[0x20]; // real-pointer side channel for the offset+0xd field -- see g_visibility_ray_realptr2's comment
    DAT_0023aef5 = 0xf;
    DAT_0023aefa = 0;
    DAT_0023aefc = 0;
    DAT_0023aefb = (undefined1)g_current_view->view_x;
    DAT_0023aefd = (undefined1)g_current_view->view_y;
    DAT_0023aefe = SUB42(DAT_0023aecc,0);
    DAT_0023af00 = (undefined2)((uint)DAT_0023aecc >> 0x10);
    _DAT_0023af02 = 0x23b058;
    g_visibility_ray_realptr2[1] = (char *)&g_visibility_ring_buffer_backing[0x20]; // same real-pointer side channel, entry 1
    DAT_0023aee9 = (char)DAT_0023aecc;
    g_visibility_ray_realptr[0] = DAT_0023aecc; // real-pointer side channel for advance_visibility_ray -- see g_visibility_ray_realptr's comment
    g_visibility_ray_realptr[1] = DAT_0023aecc; // entry 1's own copy of the same packed pointer (DAT_0023aefe/af00, same source)
    angle_to_screen_delta(g_current_view->view_facing + 0x2040,&DAT_0023aef6,&DAT_0023aef8);
    angle_to_screen_delta(g_current_view->view_facing + -0x2040,&DAT_0023aee1,&DAT_0023aee3);
    /* angle_to_screen_delta writes a 2-byte X delta at DAT_0023aee1 and a
       2-byte Y delta at DAT_0023aee3, and every downstream reader
       (advance_visibility_ray's `*(short *)(param_1 + 1)` / `+ 3`) treats
       them as separate signed shorts -- exactly like the DAT_0023aef6 /
       aef8 pair two lines down. Ghidra had `DAT_0023aee1` as a lone byte
       so an earlier fix pass widened the `>>4` to `_DAT_0023aee1`, a
       4-byte view spanning BOTH deltas (bytes 1..4): the shift then bled
       the Y delta's low nibble into the X delta's high bits and dropped
       X's low 4 bits, so the left frustum edge came out garbage
       (X ~= 31338 vs the right edge's ~1465) and the beam-trace only
       ever marked one tile visible. Shift each 16-bit delta on its own. */
    *(short *)&g_visibility_ray_table_backing[1] = (short)(*(short *)&g_visibility_ray_table_backing[1] >> 4);
    *(short *)&g_visibility_ray_table_backing[3] = (short)(*(short *)&g_visibility_ray_table_backing[3] >> 4);
    DAT_0023aef6 = DAT_0023aef6 >> 4;
    DAT_0023aef8 = DAT_0023aef8 >> 4;
  }
  return;
}



// Was FUN_0005c0c4. Same param_1-truncation + packed-pointer-arithmetic fix as its mirror-image sibling visibility_ray_step_backward.
void visibility_ray_step_forward(param_1)
intptr_t param_1;

{
  int iVar1;
  int entry_idx;

  entry_idx = visibility_ray_idx(param_1);
  g_visibility_ray_realptr[entry_idx] =
       VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, entry_idx) + *(short *)(&DAT_00086a00 + DAT_0023b4a0 * 6) * 4;
  g_visibility_ray_realptr2[entry_idx] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, entry_idx) + 2;
  *(char *)(param_1 + 5) = *(char *)(param_1 + 5) + '\x01';
  iVar1 = *(int *)(param_1 + 9) + *(short *)(&DAT_00086a00 + DAT_0023b4a0 * 6) * 4;
  *(char *)(param_1 + 9) = (char)iVar1;
  *(char *)(param_1 + 10) = (char)((uint)iVar1 >> 8);
  *(char *)(param_1 + 0xb) = (char)((uint)iVar1 >> 0x10);
  *(char *)(param_1 + 0xc) = (char)((uint)iVar1 >> 0x18);
  iVar1 = CONCAT13(*(undefined1 *)(param_1 + 0x10),
                   CONCAT12(*(undefined1 *)(param_1 + 0xf),
                            CONCAT11(*(undefined1 *)(param_1 + 0xe),*(undefined1 *)(param_1 + 0xd)))
                  ) + 2;
  *(char *)(param_1 + 0xd) = (char)iVar1;
  *(char *)(param_1 + 0xe) = (char)((uint)iVar1 >> 8);
  *(char *)(param_1 + 0xf) = (char)((uint)iVar1 >> 0x10);
  *(char *)(param_1 + 0x10) = (char)((uint)iVar1 >> 0x18);
  return;
}



/* Was FUN_0005c16c. param_1 was `int`, truncating the real record pointer (same fix as its
   siblings advance_visibility_ray/compute_visibility_ray_offset). This function does pointer
   ARITHMETIC on the two packed-pointer fields (advance-to-neighbor-tile
   at offset 9, step-back-2 at offset 0xd) by reading their packed bytes
   as a plain 32-bit value, adjusting, and writing the bytes back --
   which only ever worked because the original pointers were genuinely
   32-bit. Do the same arithmetic on the real 64-bit pointers in the two
   side tables instead; the packed-byte writes are left in place as
   harmless dead state (nothing safely reads a pointer back out of them
   any more -- see g_visibility_ray_realptr's comment). */
void visibility_ray_step_backward(param_1)
intptr_t param_1;

{
  int iVar1;
  int entry_idx;

  entry_idx = visibility_ray_idx(param_1);
  g_visibility_ray_realptr[entry_idx] =
       VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, entry_idx) + *(short *)(&DAT_00086a00 + DAT_0023b4a0 * 6) * -4;
  g_visibility_ray_realptr2[entry_idx] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, entry_idx) + -2;
  *(char *)(param_1 + 5) = *(char *)(param_1 + 5) + -1;
  iVar1 = *(int *)(param_1 + 9) + *(short *)(&DAT_00086a00 + DAT_0023b4a0 * 6) * -4;
  *(char *)(param_1 + 9) = (char)iVar1;
  *(char *)(param_1 + 10) = (char)((uint)iVar1 >> 8);
  *(char *)(param_1 + 0xb) = (char)((uint)iVar1 >> 0x10);
  *(char *)(param_1 + 0xc) = (char)((uint)iVar1 >> 0x18);
  iVar1 = CONCAT13(*(undefined1 *)(param_1 + 0x10),
                   CONCAT12(*(undefined1 *)(param_1 + 0xf),
                            CONCAT11(*(undefined1 *)(param_1 + 0xe),*(undefined1 *)(param_1 + 0xd)))
                  ) + -2;
  *(char *)(param_1 + 0xd) = (char)iVar1;
  *(char *)(param_1 + 0xe) = (char)((uint)iVar1 >> 8);
  *(char *)(param_1 + 0xf) = (char)((uint)iVar1 >> 0x10);
  *(char *)(param_1 + 0x10) = (char)((uint)iVar1 >> 0x18);
  return;
}



/* Was FUN_0005c214. param_1 was `int`, truncating the real record pointer every caller
   passes -- same fix as advance_visibility_ray. Its two packed-pointer field reads
   (offsets 0xd and 9) go through the same real-pointer side tables that
   function uses too, for the same reason (see their comments). */
undefined4 compute_visibility_ray_offset(param_1,param_2,param_3)
intptr_t param_1;
char param_2;
char param_3;

{
  byte bVar1;
  byte *pbVar2;
  byte *pbVar3;
  int iVar4;
  int iVar5;
  byte bVar6;
  byte bVar7;
  undefined1 uVar8;
  short sVar9;
  uint uVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  int entry_idx;

  entry_idx = visibility_ray_idx(param_1);
  pbVar2 = (byte *)VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, entry_idx);
  iVar12 = (int)DAT_0023b4a0;
  bVar7 = pbVar2[1] & 0xf;
  iVar5 = iVar12 * 0x10;
  pbVar3 = (byte *)VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, entry_idx);
  bVar1 = *pbVar3;
  uVar10 = (uint)*(char *)(param_1 + 5);
  if (uVar10 == 0) {
    sVar9 = 0;
  }
  else {
    iVar4 = (uVar10 ^ (int)uVar10 >> 0x1f) - ((int)uVar10 >> 0x1f);
    uVar11 = (int)*(char *)(param_1 + 7) >> 0x1f;
    iVar13 = ((int)*(char *)(param_1 + 7) ^ uVar11) - uVar11;
    sVar9 = 1;
    if (iVar4 != iVar13 && iVar13 <= iVar4) {
      sVar9 = 3;
    }
    sVar9 = (ushort)(0 < (int)uVar10) + sVar9;
    if (iVar4 == iVar13) {
      sVar9 = sVar9 + 4;
    }
  }
  uVar10 = (uint)(short)(ushort)(byte)(&DAT_00086a20)[(bVar1 & 0xf) + iVar5];
  bVar6 = (&DAT_00086a60)[uVar10 * 7 + (int)sVar9];
  if (bVar6 == 0) {
    *pbVar2 = 0;
  }
  else {
    if ((bVar6 & 0x10) != 0) {
      uVar11 = (uint)(byte)(&DAT_00086a20)
                           [(pbVar3[*(short *)(&DAT_00086a02 + iVar12 * 6) * 4] & 0xf) + iVar5];
      if (((&DAT_000878d0)[uVar11] & 8) == 0) {
        if ((uVar11 != uVar10) || (iVar4 = 1, uVar10 == 1)) {
          iVar4 = 0;
        }
        if ((int)((uint)(bVar1 >> 4) + iVar4 + (uint)(uVar10 == 6)) <
            (int)(((uint)(pbVar3[*(short *)(&DAT_00086a02 + iVar12 * 6) * 4] >> 4) -
                  (uint)(uVar11 == 6)) + (uint)(((&DAT_000878d0)[uVar11] & 0x20) == 0x20))) {
          bVar7 = bVar7 + 0x20;
        }
        else {
          bVar6 = bVar6 - 0x10;
        }
      }
    }
    if ((bVar6 & 0x20) != 0) {
      uVar11 = (uint)(byte)(&DAT_00086a20)
                           [(pbVar3[*(short *)(&DAT_00086a00 + iVar12 * 6) * 4] & 0xf) + iVar5];
      if (((&DAT_000878d0)[uVar11] & 2) == 0) {
        if ((uVar11 != uVar10) || (iVar4 = 1, uVar10 == 1)) {
          iVar4 = 0;
        }
        if ((int)((uint)(bVar1 >> 4) + iVar4 + (uint)(uVar10 == 8)) <
            (int)(((uint)(pbVar3[*(short *)(&DAT_00086a00 + iVar12 * 6) * 4] >> 4) -
                  (uint)(uVar11 == 8)) + (uint)(((&DAT_000878d0)[uVar11] & 0x20) == 0x20))) {
          bVar7 = bVar7 + 0x40;
        }
        else {
          bVar6 = bVar6 - 0x20;
        }
      }
    }
    if ((bVar6 & 8) != 0) {
      uVar11 = (uint)(byte)(&DAT_00086a20)
                           [(pbVar3[*(short *)(&DAT_00086a00 + iVar12 * 6) * -4] & 0xf) + iVar5];
      if (((&DAT_000878d0)[uVar11] & 4) == 0) {
        if ((uVar11 != uVar10) || (iVar5 = 1, uVar10 == 1)) {
          iVar5 = 0;
        }
        if ((int)((uint)(bVar1 >> 4) + iVar5 + (uint)(uVar10 == 9)) <
            (int)(((uint)(pbVar3[*(short *)(&DAT_00086a00 + iVar12 * 6) * -4] >> 4) -
                  (uint)(uVar11 == 9)) + (uint)(((&DAT_000878d0)[uVar11] & 0x20) == 0x20))) {
          bVar7 = bVar7 + 0x10;
        }
        else {
          bVar6 = bVar6 - 8;
        }
      }
    }
    *pbVar2 = bVar6;
    pbVar2[1] = bVar7; // was `*(byte *)(*(int *)(param_1 + 0xd) + 1)` -- pbVar2 already IS that pointer now
    if ((param_2 != '\0') &&
       (((uVar11 = (uint)param_3,
         ((byte)(&DAT_000878d0)
                [(byte)(&DAT_00086a20)
                       [(pbVar3[*(short *)(&DAT_00086a02 + DAT_0023b4a0 * 6) * 4] & 0xf) +
                        DAT_0023b4a0 * 0x10]] & 8) == uVar11 &&
         (((byte)(&DAT_000878d0)[uVar10] & 0x10) == (&DAT_00086af0)[uVar11 == 8])) ||
        ((((byte)(&DAT_000878d0)[uVar10] & 1) == 1 &&
         (((byte)(&DAT_000878d0)[uVar10] & 0x10) == (&DAT_00086af0)[uVar11 == 0])))))) {
      if (param_2 == '\x01') {
        visibility_ray_step_forward(param_1); // dropped arg; sibling call right below (visibility_ray_step_backward(param_1)) shows the intended shape
        uVar8 = 0;
      }
      else {
        visibility_ray_step_backward(param_1);
        uVar8 = 0xff;
      }
      *(undefined1 *)(param_1 + 6) = uVar8;
      return 1;
    }
  }
  return 0;
}



/* Was FUN_0005c70c, and was mis-named `reactions_should_merge` until the
   un-stub below showed what it does. Un-stubbed 2026-09-05: this is NOT a
   "should these merge" predicate -- it is the row-advance / cone-
   continuation step that keeps the beam-trace visibility flood alive past
   row 0. Each call bumps
   the entry's per-pass counter (offset 7), and while that stays under 16
   AND the entry's visibility-grid cursor hasn't hit an end-of-chain
   nibble, it steps the entry ONE ROW forward -- the tile-data cursor by
   DAT_00086a02[facing]*4, the visibility-grid cursor by 0x42 -- re-walks
   that row via visibility_ray_step_forward / compute_visibility_ray_offset, and
   returns 1. merge_adjacent_visibility_rays's `iVar3 != 0` branch then keeps
   the queue head off the 0xf sentinel, so run_visibility_flood makes
   another pass and g_visibility_ring_depth (== view depth) grows. Stubbing it to
   `return 0` (done in a much earlier session while the whole viewport
   was still black) is why only row 0 was ever flooded -> only 1-2 tiles
   visible. The two packed 32-bit pointer fields (offsets 9 and 0xd) are
   carried in g_visibility_ray_realptr / _realptr2 on this 64-bit port; the
   original's byte-packed writes are kept as harmless dead state. Verified
   against the 0x5c70c disasm. */
undefined4 extend_visibility_ray_row(param_1,param_2)
byte * param_1;
byte * param_2;

{
  uint uVar1;
  uint uVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  int iVar8;
  int idx1;
  int idx2;
  short row_stride;

  idx1 = visibility_ray_idx(param_1);
  idx2 = visibility_ray_idx(param_2);
  row_stride = *(short *)(&DAT_00086a02 + DAT_0023b4a0 * 6);

  iVar5 = *(char *)(param_1 + 7) + 1;
  *(char *)(param_1 + 7) = (char)iVar5;
  /* Was a hardcoded `< 0x11` (16 allowed ring-passes) -- confirmed
     against the real disassembly in an earlier round as a literal, not
     an obvious variable read, so it was left alone (see this
     function's own header comment and mysteries.md's "hard-coded
     ceiling of 16 passes" writeup). User-supplied evidence points at
     SHADES.DAT instead: its 6-field-per-record layout (field 3 is the
     per-level view-distance default) is already parsed correctly by
     load_shading_level_config into g_visibility_max_ring_passes (was DAT_0023bca0)
     -- confirmed live, and against the raw file bytes, that record 0's
     field 3 really is 3, not 16 (fields 4/5, the texture-LOD
     thresholds, both really are 16 -- easy to conflate). Whatever the
     original compiled form of this check really was, using the
     already-correctly-loaded per-level value here instead of the flat
     16 is well-motivated and makes this global (previously read only
     by two dead/tangential call sites) finally meaningful. +1 because
     this counter starts at 1 after the pre-increment above, so a
     field-3 value of N should allow N total ring-passes, not N-1. */
  if (iVar5 * 0x1000000 >> 0x18 < (int)g_visibility_max_ring_passes + 1) {
    do {
      if ((VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, idx1)[0x43] & 0xf) != 0xf) {
        cVar3 = *(char *)(param_1 + 7);
        if (('\x01' < cVar3) ||
           (uVar7 = (uint)*(byte *)(param_1 + 6) - (int)g_current_view->view_x,
           uVar1 = (int)uVar7 >> 0x1f,
           uVar6 = (uint)*(byte *)(param_1 + 8) - (int)g_current_view->view_y,
           uVar2 = (int)uVar6 >> 0x1f,
           0x10 < (int)(((uVar6 ^ uVar2) - uVar2) + ((uVar7 ^ uVar1) - uVar1)))) {
          iVar8 = (*(char *)(param_1 + 5) * 0x100 - (int)g_current_view->view_x) +
                  (uint)*(byte *)(param_1 + 6);
          iVar5 = iVar8 * 0x10000;
          uVar1 = iVar5 >> 0x1f;
          sVar4 = ordint_divmod(0x32,(iVar5 >> 0x10 ^ uVar1) - uVar1);
          iVar5 = (iVar8 - sVar4) + -2;
          *(char *)(param_1 + 1) = (char)iVar5;
          *(char *)(param_1 + 2) = (char)((uint)iVar5 >> 8);
          iVar5 = cVar3 * 0x100 - (int)g_current_view->view_y;
          *(char *)(param_1 + 3) = (char)iVar5;
          *(char *)(param_1 + 4) = (char)((uint)iVar5 >> 8);
        }
        *(undefined1 *)(param_1 + 8) = 0;
        /* one row forward: tile-data cursor += row_stride*4, grid cursor += 0x42 */
        g_visibility_ray_realptr[idx1] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, idx1) + row_stride * 4;
        g_visibility_ray_realptr2[idx1] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, idx1) + 0x42;
        *(char *)(param_2 + 7) = *(char *)(param_2 + 7) + '\x01';
        do {
          if ((VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, idx2)[0x43] & 0xf) != 0xf) {
            cVar3 = *(char *)(param_2 + 7);
            if (('\x01' < cVar3) ||
               (uVar7 = (uint)*(byte *)(param_2 + 6) - (int)g_current_view->view_x,
               uVar1 = (int)uVar7 >> 0x1f,
               uVar6 = (uint)*(byte *)(param_2 + 8) - (int)g_current_view->view_y,
               uVar2 = (int)uVar6 >> 0x1f,
               0x10 < (int)(((uVar6 ^ uVar2) - uVar2) + ((uVar7 ^ uVar1) - uVar1)))) {
              iVar8 = (*(char *)(param_2 + 5) * 0x100 - (int)g_current_view->view_x) +
                      (uint)*(byte *)(param_2 + 6);
              iVar5 = iVar8 * 0x10000;
              uVar1 = iVar5 >> 0x1f;
              sVar4 = ordint_divmod(0x32,(iVar5 >> 0x10 ^ uVar1) - uVar1);
              iVar5 = iVar8 + sVar4 + 2;
              *(char *)(param_2 + 1) = (char)iVar5;
              *(char *)(param_2 + 2) = (char)((uint)iVar5 >> 8);
              iVar5 = (cVar3 * 0x100 - (int)g_current_view->view_y) + -1;
              *(char *)(param_2 + 3) = (char)iVar5;
              *(char *)(param_2 + 4) = (char)((uint)iVar5 >> 8);
            }
            *(undefined1 *)(param_2 + 8) = 0;
            g_visibility_ray_realptr2[idx2] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, idx2) + 0x42;
            g_visibility_ray_realptr[idx2] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, idx2) + row_stride * 4;
            return 1;
          }
          visibility_ray_step_backward(param_2);
          *(undefined1 *)(param_2 + 6) = 0xff;
          compute_visibility_ray_offset((intptr_t)param_2,0,0);
        } while (*(char *)(param_1 + 5) <= *(char *)(param_2 + 5));
        return 0;
      }
      visibility_ray_step_forward((intptr_t)param_1);
      *(undefined1 *)(param_1 + 6) = 0;
      compute_visibility_ray_offset((intptr_t)param_1,0,0);
    } while (*(char *)(param_1 + 5) <= *(char *)(param_2 + 5));
  }
  return 0;
}



// Was FUN_0005cacc.
void advance_visibility_ray(param_1)
byte * param_1;

{
  uint uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  byte bVar5;
  short sVar6;
  undefined4 uVar7;
  byte *pbVar8;
  char cVar9;
  short *psVar10;
  int iVar11;
  int iVar12;
  char cVar12;
  int local_atten_step;
  ushort local_32;
  int local_30;
  
  iVar2 = (int)*(short *)(param_1 + 1);
  cVar12 = -1 < iVar2;
  iVar3 = (int)(short)(ushort)(byte)cVar12;
  local_32 = (ushort)param_1[6];
  if (iVar3 == 1) {
    local_32 = 0x100 - param_1[6];
  }
  uVar1 = iVar3 << 7;
  if ((*param_1 & 0x80) == uVar1) {
    uVar7 = *(undefined4 *)(param_1 + 0xd);
    param_1[0x11] = (byte)uVar7;
    param_1[0x12] = (byte)((uint)uVar7 >> 8);
    param_1[0x13] = (byte)((uint)uVar7 >> 0x10);
    param_1[0x14] = (byte)((uint)uVar7 >> 0x18);
  }
  local_30 = (int)*(short *)(param_1 + 3);
  if ((local_30 == 0) ||
     ((iVar2 != 0 &&
      ((short)local_32 * local_30 <
       (int)((0x100 - (uint)param_1[8]) * (int)*(short *)(&DAT_00086b00 + iVar3 * 2) * iVar2))))) {
    do {
      iVar11 = (int)DAT_0023b4a0;
      /* Was `*(byte **)(param_1 + 9)` -- reassembling a pointer from raw
         bytes the original 32-bit binary packed at this offset (see
         seed_visibility_queue's DAT_0023aee9/aeea/aeec writes), which only ever
         captured the low 32 bits even before this port's 64-bit
         truncation, and the 8-byte-wide read here also swallows 4 bytes
         of the next field. Real pointer tracked separately instead --
         see g_visibility_ray_realptr's comment. */
      pbVar8 = (byte *)VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, visibility_ray_idx(param_1));
      iVar2 = iVar11 * 0x10;
      cVar9 = (&DAT_00086a20)[(*pbVar8 & 0xf) + iVar2];
      if ((*(ushort *)(&DAT_00086af8 + iVar3 * 2) & (ushort)(byte)(&DAT_000878d0)[cVar9]) != 0) {
LAB_0005cf04:
        param_1[8] = 0xff;
        if ((((ushort)(byte)(&DAT_000878d0)[cVar9] & *(ushort *)(&DAT_00086af8 + iVar3 * 2)) ==
             *(ushort *)(&DAT_00086af8 + iVar3 * 2)) &&
           ((int)cVar9 == (int)*(short *)((char *)&DAT_00086afc + iVar3 * 2))) {
          /* Was reading the division helper's remainder back via the
             extraout_r1 register-leftover trick (see ordint_divmod's
             comment) -- computed directly instead, same fix as
             itoa_radix's identical pattern. The quotient this call
             also produced was never used (its return value was
             discarded here too), so the call itself is gone. */
          cVar12 = (char)((iVar3 + 1) % 2);
        }
        param_1[6] = -cVar12;
        goto LAB_0005ce50;
      }
      psVar10 = (short *)(&DAT_00086b00 + iVar3 * 2);
      sVar6 = *psVar10;
      /* Was `ordint_divmod(2,iVar3+1);` followed by two extraout_r1_00
         reads of its division remainder -- same register-leftover
         pattern as above, computed directly instead. */
      iVar12 = (iVar3 + 1) % 2;
      if ((*(ushort *)(&DAT_00086af8 + iVar12 * 2) &
          (ushort)(byte)(&DAT_000878d0)
                        [(byte)(&DAT_00086a20)
                               [(pbVar8[(int)*(short *)(&DAT_00086a00 + iVar11 * 6) * (int)sVar6 * 4
                                       ] & 0xf) + iVar2]]) != 0) goto LAB_0005cf04;
      /* Was `cVar9 = ordint_divmod(...); param_1[8] = cVar9 + param_1[8];`
         -- param_1[8] is a 0-255 accumulated light-attenuation counter
         (saturates the ring-walk's expansion once it hits 0xff -- see
         the `param_1[8] = 0xff` "hit a wall" sets above and the
         `(0x100 - param_1[8])` remaining-light checks below), but the
         per-step increment was routed through a SIGNED 8-bit `cVar9`.
         For a nearby/strong ray the real quotient legitimately exceeds
         127 (confirmed live via a UW_DEBUG_INV trace: divisor=134
         dividend=32512 -> true quotient 242), which wrapped to a
         NEGATIVE char (-14) instead of correctly saturating hard for
         that close-range step. Real, verified overflow bug -- but NOT
         the cause of the automap's over-reveal-at-spawn report: checked
         with lldb (breakpoint on run_visibility_flood's exit) that
         g_visibility_ring_depth (the ring-walk depth) and the dumped reveal bitmap
         are BOTH byte-for-byte identical before and after this fix for
         that repro, because the flood there terminates on real walls
         well before this accumulator ever nears saturation. Left fixed
         since it's a genuine bug (matters for any long open, wall-less
         span longer than a few tiles), but the actual over-reveal cause
         is elsewhere (doorway tiles read as plain open floor regardless
         of the door object's open/closed state -- see memory.md).
         Compute and accumulate in a wide int and clamp to the byte's
         real 0-255 range instead of truncating through a signed 8-bit
         type. */
      local_atten_step = (int)ordint_divmod((int)*(short *)(param_1 + 1) * (int)sVar6,
                                            (short)local_32 * local_30);
      local_atten_step = local_atten_step + (int)(byte)param_1[8];
      if (local_atten_step < 0) {
        local_atten_step = 0;
      }
      else if (0xff < local_atten_step) {
        local_atten_step = 0xff;
      }
      param_1[8] = (byte)local_atten_step;
      param_1[6] = -(char)iVar12;
      local_32 = 0x100;
      if ((*param_1 & 0x80) == uVar1) {
        compute_visibility_ray_offset(param_1,0,0);
      }
      if (*psVar10 == 1) {
        visibility_ray_step_forward(param_1); // dropped arg; sibling call right below shows the intended shape
      }
      else {
        visibility_ray_step_backward(param_1);
      }
      if (((VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, visibility_ray_idx(param_1))[1] & 0xf) == 0xf) ||
         (uVar4 = (int)(char)param_1[5] >> 0x1f,
         0x10 < (int)(((int)(char)param_1[5] ^ uVar4) - uVar4))) {
        /* Same extraout_r1 register-leftover division-remainder pattern
           as above, computed directly instead. */
        if (*(short *)(&DAT_00086b00 + ((iVar3 + 1) % 2) * 2) == 1) {
          visibility_ray_step_forward(param_1); // dropped arg; sibling call right below shows the intended shape
        }
        else {
          visibility_ray_step_backward(param_1);
        }
        param_1[6] = -cVar12;
        param_1[8] = 0xff;
        bVar5 = *param_1;
        goto LAB_0005ce60;
      }
      local_30 = (int)*(short *)(param_1 + 3);
    } while ((local_30 == 0) ||
            (local_30 * 0x100 <
             (int)((0x100 - (uint)param_1[8]) * (int)*(short *)(param_1 + 1) * (int)*psVar10)));
  }
  sVar6 = *(short *)(&DAT_00086b00 + iVar3 * 2);
  cVar12 = ordint_divmod((int)*(short *)(param_1 + 3),
                        (0xff - (uint)param_1[8]) * (int)*(short *)(param_1 + 1) * (int)sVar6);
  param_1[6] = cVar12 * (char)sVar6 + param_1[6];
  param_1[8] = 0xff;
LAB_0005ce50:
  bVar5 = *param_1;
LAB_0005ce60:
  if ((bVar5 & 0x80) != uVar1) {
    uVar7 = *(undefined4 *)(param_1 + 0xd);
    param_1[0x11] = (byte)uVar7;
    param_1[0x12] = (byte)((uint)uVar7 >> 8);
    param_1[0x13] = (byte)((uint)uVar7 >> 0x10);
    param_1[0x14] = (byte)((uint)uVar7 >> 0x18);
  }
  return;
}



/* Was FUN_0005cf74. param_1/param_2 were `undefined4 *`/`int *`, truncating the real
   pointers run_visibility_flood always calls this with (`&local_20`/`&local_24`,
   both real `byte*`/`undefined1*` locals) -- same fix as this record
   array's other consumers. `*param_2`'s assignment below is this same
   record's offset+0xd/0x11 packed-pointer field again, routed through
   the shared real-pointer side table. */
void merge_adjacent_visibility_rays(param_1,param_2)
byte ** param_1;
undefined1 ** param_2;

{
  bool bVar1;
  byte bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  byte *pbVar8;
  char *pcVar9;
  /* acStack_28/local_23 were separate locals sized 5+1=6 bytes, but the
     copy loop just below writes a full 0x15(21)-byte record into
     acStack_28 (`iVar3 = 0x15; ... *pcVar7 = *pcVar6; ...`) -- a genuine
     stack-buffer overflow (confirmed crashing, EXC_BAD_ACCESS with a
     corrupted pcVar9, the classic signature of a stack smash landing on
     an adjacent local) every single time this function runs, regardless
     of which branch follows. Same "locals declared as whatever fragment
     Ghidra individually named instead of the real buffer a copy/init
     needs" bug as build_view_matrix's matrices earlier this session, just for
     a stack array instead of a global one. local_23 was the record's own
     byte offset+5 (0x28-0x23=5) -- folded into the real-sized array as
     acStack_28[5], its declaration removed. */
  char acStack_28 [0x15];
  int iVar10;

  iVar10 = ((int)*(char *)*param_1 & 0xfU) * 0x15;
  pcVar9 = &g_visibility_ray_table + iVar10;
  iVar5 = ((int)*pcVar9 & 0xfU) * 0x15;
  pbVar8 = &g_visibility_ray_table + iVar5;
  *param_2 = (undefined1 *)(VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, iVar5 / 0x15) + 2);
  while( true ) {
    iVar3 = compute_visibility_ray_offset(pcVar9,1,8);
    if (iVar3 == 0) break;
    if ((int)((uint)(byte)(&DAT_0023aee6)[iVar5] + (char)(&DAT_0023aee5)[iVar5] * 0x100) <
        (int)((uint)(byte)(&DAT_0023aee6)[iVar10] + (char)(&DAT_0023aee5)[iVar10] * 0x100))
    goto LAB_0005d064;
  }
  if ((int)(char)(&DAT_0023aee5)[iVar10] < (int)(char)(&DAT_0023aee5)[iVar5]) {
    do {
      iVar3 = compute_visibility_ray_offset(pbVar8,0xffffffff,8);
    } while (iVar3 != 0);
  }
  iVar3 = 0x15;
  pcVar6 = pcVar9;
  pcVar7 = acStack_28;
  do {
    iVar4 = iVar3 + -1;
    *pcVar7 = *pcVar6;
    bVar1 = 0 < iVar3;
    iVar3 = iVar4;
    pcVar6 = pcVar6 + 1;
    pcVar7 = pcVar7 + 1;
  } while (iVar4 != 0 && bVar1);
  /* acStack_28 is a byte-copy of entry pcVar9; seed the scratch
     real-pointer slot (16) from that entry so visibility_ray_step_forward /
     compute_visibility_ray_offset on acStack_28 -- whose in-backing-array index
     would be a wild value -- resolve through visibility_ray_idx() to a
     valid grid cursor instead of indexing the side table out of bounds. */
  g_visibility_ray_realptr[VISIBILITY_RAY_SCRATCH_IDX]  =
      VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, iVar10 / 0x15);
  g_visibility_ray_realptr2[VISIBILITY_RAY_SCRATCH_IDX] =
      VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, iVar10 / 0x15);
  iVar3 = extend_visibility_ray_row(pcVar9,pbVar8);
  if (iVar3 == 0) {
LAB_0005d064:
    bVar2 = *(byte *)*param_1;
    *(byte *)*param_1 = (bVar2 ^ *pbVar8) & 0xf ^ bVar2;
    *pcVar9 = '\0';
    *pbVar8 = 0;
  }
  else {
    /* extend_visibility_ray_row returned "keep spreading". The walk below
       operates on acStack_28 (the stack copy) and marks tiles via
       compute_visibility_ray_offset; its side-table pointers live in the
       scratch slot seeded just above. */
    *param_1 = pbVar8;
    if ((&DAT_0023aee5)[iVar10] != (&DAT_0023aee5)[iVar5]) {
      do {
        visibility_ray_step_forward(acStack_28);
        do {
          if ((char)(&DAT_0023aee5)[iVar5] <= acStack_28[5]) {
            return;
          }
          do {
            iVar10 = compute_visibility_ray_offset(acStack_28,1,0);
            if (iVar10 == 0) break;
          } while (acStack_28[5] < (char)(&DAT_0023aee5)[iVar5]);
        } while ((char)(&DAT_0023aee5)[iVar5] <= acStack_28[5]);
        visibility_ray_step_forward(acStack_28);
        do {
          iVar10 = compute_visibility_ray_offset(acStack_28,1,8);
          if (iVar10 == 0) break;
        } while (acStack_28[5] < (char)(&DAT_0023aee5)[iVar5]);
      } while( true );
    }
  }
  return;
}



// Was FUN_0005d13c.
void run_visibility_flood()

{
  byte bVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  uint uVar4;
  byte *pbVar5;
  undefined1 *local_24;
  byte *local_20;
  
  puVar3 = &g_visibility_ring_buffer;
  g_visibility_ring_depth = -1;
  local_24 = &g_visibility_ring_buffer;
  do {
    local_20 = &g_visibility_ring_done;
    g_visibility_ring_depth = g_visibility_ring_depth + 1;
    puVar2 = puVar3;
    bVar1 = g_visibility_ring_done;
    while ((bVar1 & 0xf) != 0xf) {
      pbVar5 = &g_visibility_ray_table + ((int)(char)*local_20 & 0xfU) * 0x15;
      advance_visibility_ray(pbVar5);
      puVar2 = local_24;
      local_20 = pbVar5;
      bVar1 = *pbVar5;
    }
    local_20 = &g_visibility_ring_done;
    puVar3 = puVar2;
    bVar1 = g_visibility_ring_done;
    while (uVar4 = (uint)(char)bVar1, (uVar4 & 0xf) != 0xf) {
      /* Was `*(undefined1 **)(&DAT_0023aef1 + uVar4 * 0x15)` -- same
         packed-pointer-reassembly bug as advance_visibility_ray's offset+9/0xd
         fields (this is that same offset-0xd/0x11 field, just indexed
         relative to DAT_0023aef1 instead of g_visibility_ray_table+0xd), routed
         through the same real-pointer side table. */
      while (puVar3 < (undefined1 *)VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, uVar4 & 0xf)) {
        *puVar3 = 0;
        uVar4 = (uint)(char)*local_20;
        puVar3 = local_24 + 2;
        local_24 = puVar3;
      }
      merge_adjacent_visibility_rays(&local_20,&local_24);
      puVar3 = local_24;
      bVar1 = *local_20;
    }
    while (puVar3 < puVar2 + 0x42) {
      *puVar3 = 0;
      puVar3 = local_24 + 2;
      local_24 = puVar3;
    }
  } while (g_visibility_ring_done != 0xf);

  if (getenv("UW_DEBUG_AUTOMAP_REVEAL"))
    fprintf(stderr, "[visibility-flood] g_visibility_ring_depth=%d g_visibility_max_ring_passes=%d\n",
            (int)g_visibility_ring_depth, (int)g_visibility_max_ring_passes);

  /* Hack - Testing (opt-in via UW_HACK_REVEAL_DEPTH): g_visibility_ring_depth is the
     row depth of walk_visible_tiles's reveal/visibility walk -- it starts at
     row &g_visibility_ring_buffer + g_visibility_ring_depth*0x42 and sweeps back to row 0, and
     equals (visibility-flood passes made) - 1. With a small visible set it
     comes out 0, so a demomode TELEPORT+REVEAL only marks a thin strip.
     Forcing it larger widens the automap reveal fan for testing, BUT it
     also decouples the walk from run_visibility_flood's real output
     rows (which now genuinely carry visibility bits -- see the table
     recoveries this session), so it is opt-in and off by default. When
     enabled, the upper rows are zeroed first so process_visible_tile_cell reads them
     as "not visible" and takes the plain automap-reveal path rather than
     stale bytes. g_visibility_ring_buffer_backing is 32768 bytes (0x42 stride) so 8
     rows is well in bounds. */
  if (getenv("UW_HACK_REVEAL_DEPTH")) {
    if (getenv("UW_HACK_REVEAL_DEPTH_ZERO")) {
      int hack_row;
      for (hack_row = 0x42; hack_row < 0x42 * 9; hack_row = hack_row + 1) {
        g_visibility_ring_buffer_backing[hack_row] = 0;
      }
    }
    if (g_visibility_ring_depth < 8) g_visibility_ring_depth = 8;
  }
  return;
}



// WARNING: Heritage AFTER dead removal. Example location: r0x0023b4dc : 0x0005d664
// WARNING: Restarted to delay deadcode elimination for space: ram

// was FUN_0005d290
void rebuild_dungeon_view()

{
  undefined2 uVar1;
  ushort uVar2;
  short sVar3;
  int iVar4;
  bool bVar5;
  
  seed_visibility_queue();
  /* Re-enabled again: g_visibility_ring_buffer (the buffer walk_visible_tiles's ring-walk
     reads per-tile visibility/occlusion data from via process_visible_tile_cell,
     offset DAT_0023b820) is the SAME 0x42-byte-stride buffer this
     function builds its creature-reaction display list into
     (`&g_visibility_ring_buffer`, confirmed same base address, same stride) -- a
     whole-binary Ghidra reference search found NO OTHER writer of this
     memory anywhere, so an earlier attempt that hardcoded g_visibility_ring_depth
     while skipping this call was also skipping its only real populator.
     Finishing the retrofit properly instead of hardcoding around it.
     NOTE: g_visibility_ring_depth (this function's own loop counter) legitimately
     computes to 0 with no creatures present -- see memory.md's tmap-
     tiles section for why that rules out "g_visibility_ring_depth is a general
     tile-scan radius" as the explanation for the still-black viewport;
     the real renderer is still being searched for. */
  run_visibility_flood();
  handle_mouse_button_message(0);
  uVar1 = DAT_00086b30;
  DAT_0023b804 = 0;
  sVar3 = g_current_view->view_shake_x;
  bVar5 = sVar3 == 0;
  if (bVar5) {
    sVar3 = g_current_view->view_shake_y;
  }
  if (bVar5 && sVar3 == 0) {
    DAT_0023b4dc = 1;
  }
  DAT_0023b830 = 0;
  iVar4 = (int)DAT_00086b2c;
  if (!bVar5 || sVar3 != 0) {
    DAT_0023b4dc = 0;
  }
  DAT_0023b4f4 = (&DAT_00086b38)[iVar4];
  DAT_0023b80c = (&DAT_00086b40)[iVar4];
  DAT_0023b4d4 = (&DAT_00086b48)[iVar4];
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
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(8);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)(DAT_00086b2c == 0);
  DAT_00189582 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189580 = (ushort)(DAT_00086b2c == 0);
  bVar5 = DAT_00201b68 == 9;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  if (bVar5) {
    uVar2 = get_catalog_sprite_width(4);
    *DAT_00110fc0 = uVar2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00086b30 = 0;
  }
  else {
    uVar2 = get_catalog_sprite_width(4);
    *DAT_00110fc0 = uVar2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)DAT_00086b34;
  }
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189578 = (undefined2)DAT_00086b34;
  *DAT_00110fc0 = 0xd0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)DAT_0023b4dc;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  dungeon_view_prepass_stub(1);
  DAT_0023b810 = 0;
  walk_visible_tiles();
  if ((((*(byte *)(DAT_00086df8 + 0x3d) != 0) && (*(byte *)(DAT_00086df8 + 0x3d) < 0x10)) &&
      (DAT_00201b68 != 9)) &&
     (sVar3 = ordint_divmod(10,(int)DAT_0023b810 * (int)DAT_00201b68), sVar3 != 0)) {
    /* Disabled: grant_experience_points() here is called with a dropped
       argument (Ghidra lost it) AND from a nonsensical spot -- a dungeon
       -view rebuild -- so it granted a garbage XP amount on essentially
       every redraw (spam of "You have attained experience level"). No
       view rebuild should touch XP; the g_force_redraw_no_xp guard used
       to only cover the forced-redraw hack, but the game's own
       movement-driven redraw hit it too. */
    (void)sVar3;
  }
  if (DAT_00201b68 == 9) {
    DAT_00086b30 = uVar1;
  }
  return;
}



// was FUN_0005d2ac -- empty hook called before the visibility walk in build_frame_draw_list (disabled / never recovered)
void dungeon_view_prepass_stub()

{
  return;
}




// was FUN_00065ff0 -- (re)loads the f32.tr/f16.tr floor-texture arenas
// (the two floor-texture resolutions), optionally updating the active
// "special floor" texture id (DAT_0023adc0) first unless param_1 is
// the sentinel 0xff (keep current). Its one caller
// (update_level7_floor_hazard_state, level-7 lava/moonstone floor-texture swap) has a
// dropped-argument bug of its own -- see that call site's own comment.
void load_floor_texture_arenas(param_1)
byte param_1;

{
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  char acStack_114 [260];
  
  if (param_1 != 0xff) {
    DAT_0023adc0 = (ushort)param_1;
  }
  ce_memset(acStack_114,0,0x104);
  pcVar3 = &DAT_0023cca8;
    stack0xffdc3244_ptr = stack0xffdc3244_buf;
  pcVar2 = pcVar3;
    stack0xffdc3244_ptr = acStack_114;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_114,s__DATA_f32_tr_00086de8);
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae34);
  ce_memset(acStack_114,0,0x104);
  do {
    cVar1 = *pcVar3;
    *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_114,s__DATA_f16_tr_00086dd8);
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae30);
  return;
}







// was FUN_0006ff08 -- loads a shading-level configuration (early-outs
// if param_1 already matches the currently-loaded DAT_000872a0):
// swaps in LIGHT.DAT or MONO.DAT (special-cased around shading level 5)
// into DAT_0024fa2c, then seeks SHADES.DAT to param_1's 12-byte record
// and unpacks it into DAT_0025063c/DAT_0025064c/DAT_002506dc/
// g_visibility_max_ring_passes/DAT_00086b28/DAT_00086b24 (the texture-
// LOD distance threshold), rebuilding the visibility light grid
// afterward.
void load_shading_level_config(param_1)
char param_1;

{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  if (getenv("UW_DEBUG_AUTOMAP_REVEAL"))
    fprintf(stderr, "[load_shading_level_config] called param_1=%d DAT_000872a0=%d DAT_00201b68=%d\n",
            (int)param_1, (int)DAT_000872a0, (int)DAT_00201b68);
  /* Ghidra modelled the 12-byte SHADES.DAT per-level header as six
     separate `short` locals that read_file_handle(&local_12c, 0xc) reads
     into as one contiguous block -- but the C compiler is free to lay
     them out non-contiguously / reorder them, so only local_12c landed
     where the read wrote and local_12a..local_122 read stack garbage
     (observed: DAT_00086b24, the texture-LOD distance threshold, came
     out 0 instead of the file's 16 -> every visible tile fell to the
     16x16 low-detail texture, walls included). Real 6-short array. */
  short _shades_hdr[6];
#define local_12c (_shades_hdr[0])
#define local_12a (_shades_hdr[1])
#define local_128 (_shades_hdr[2])
#define local_126 (_shades_hdr[3])
#define local_124 (_shades_hdr[4])
#define local_122 (_shades_hdr[5])
  char acStack_11c [260];
  
  if (DAT_000872a0 == param_1) {
    return;
  }
  pcVar4 = &DAT_0023cca8;
    stack0xffdc323c_ptr = acStack_11c;
  if (DAT_000872a0 == '\x05') {
    ce_memset(acStack_11c,0,0x104);
    pcVar2 = pcVar4;
    stack0xffdc323c_ptr = stack0xffdc323c_buf;
    do {
      cVar1 = *pcVar2;
      *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    pcVar2 = s__DATA_light_dat_000872c8;
  }
  else {
    if (param_1 != '\x05') goto LAB_0006fff4;
    ce_memset(acStack_11c,0,0x104);
    pcVar2 = pcVar4;
    stack0xffdc323c_ptr = stack0xffdc323c_buf;
    do {
      cVar1 = *pcVar2;
      *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    pcVar2 = s__DATA_mono_dat_000872b8;
  }
  ce_strcat(acStack_11c,pcVar2);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 != -1) {
    read_file_handle(iVar3,DAT_0024fa2c,0x1000);
    CloseHandle(iVar3);
  }
LAB_0006fff4:
  DAT_000872a0 = param_1;
  ce_memset(acStack_11c,0,0x104);
  do {
    cVar1 = *pcVar4;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_shades_dat_000872a4);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 != -1) {
    seek_file_handle(iVar3,param_1 * 0xc0000 >> 0x10,0);
    read_file_handle(iVar3,_shades_hdr,0xc);
    DAT_0025063c = local_12c;
    if (local_12c < 2) {
      DAT_0025063c = 1;
    }
    DAT_0025064c = local_12a;
    DAT_002506dc = local_128;
    g_visibility_max_ring_passes = local_126;
    DAT_00086b28 = local_124;
    DAT_00086b24 = local_122;
    CloseHandle(iVar3);
    if (getenv("UW_DEBUG_AUTOMAP_REVEAL"))
      fprintf(stderr, "[load_shading_level_config] loaded SHADES.DAT record %d: DAT_0025063c=%d DAT_0025064c=%d"
              " DAT_002506dc=%d g_visibility_max_ring_passes=%d DAT_00086b28=%d DAT_00086b24=%d\n",
              (int)param_1, (int)DAT_0025063c, (int)DAT_0025064c, (int)DAT_002506dc,
              (int)g_visibility_max_ring_passes, (int)DAT_00086b28, (int)DAT_00086b24);
    build_visibility_light_grid((int)g_visibility_max_ring_passes);
    set_pending_update_flags(2);
  }
  return;
}
#undef local_12c
#undef local_12a
#undef local_128
#undef local_126
#undef local_124
#undef local_122






// was FUN_00070118
void load_light_tables()

{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  char acStack_11c [260];
  
  DAT_0024fa2c = ce_malloc(0x1000);
  if (getenv("UW_DEBUG_BAG_TRACE")) fprintf(stderr, "[bag-trace] DAT_0024fa2c allocated at %p\n", (void *)DAT_0024fa2c);
  if (DAT_0024fa2c == 0) {
    report_fatal_error_message_and_exit(s_cLightTabs_allocation_error_____000872e8);
  }
  ce_memset(acStack_11c,0,0x104);
  pcVar4 = &DAT_0023cca8;
    stack0xffdc323c_ptr = stack0xffdc323c_buf;
  pcVar2 = pcVar4;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_light_dat_000872c8);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 != -1) {
    read_file_handle(iVar3,DAT_0024fa2c,0x1000);
    CloseHandle(iVar3);
  }
  ce_memset(acStack_11c,0,0x104);
  do {
    cVar1 = *pcVar4;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_xfer_dat_000872d8);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 != -1) {
    read_file_handle(iVar3,&DAT_0024fa38,0x600);
    CloseHandle(iVar3);
  }
  return;
}
