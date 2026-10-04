/* Graphics resource loading: .GR bitmap decode, resource-file open,
 * the "flip grtile" screen-flip capture slots, and door-frame
 * loading. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/resources.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define DAT_00202724 DAT_00202724_backing[0]
static byte *DAT_000b4624;
static byte *DAT_000b462c;
static byte *DAT_000b4618;
/* Sizing-audit pass: `MultiByteToWideChar(...,&DAT_000fb650,0xff)`
   -- cchWideChar=0xff(255) counts WCHAR units, not bytes: real need
   510 bytes. Sized to 512. Down from 8192. */
static undefined DAT_000fb650_backing[512];
#define DAT_000fb650 DAT_000fb650_backing[0]
/* Sizing-audit pass: `WideCharToMultiByte(...,&DAT_000fb550,0xff,...)`
   -- cbMultiByte=0xff(255) bytes exact. Sized to 256. Down from 8192. */
static undefined DAT_000fb550_backing[256];
#define DAT_000fb550 DAT_000fb550_backing[0]
/* Real string, recovered via Ghidra disassembly of decode_critter_sprite_page
   (the caching "\CRIT\CR<pp>PAGE.N<nn>" per-page critter-animation
   resource loader): the decompile showed DAT_00085928/29/30/31 as four
   unrelated lone chars, and its own two-arg ce_strcat (strcat) call
   right after them dropped BOTH arguments (same class of bug as
   resolve_object_link's ~30 call sites fixed earlier this session).
   The real ARM passes `ce_strcat(stack0xffdc3238_buf, &DAT_00085920)`
   -- concatenating this template (its "00"/"00" digit pairs already
   patched with the real page numbers by the writes at +8/+9 and
   +0x10/+0x11) onto the copied install-dir path -- then opens THAT
   buffer, not the never-populated `acStack_120` the decompile shows. */
static char DAT_00085920_backing[20] = "\\CRIT\\CR00PAGE.N00";
#define DAT_00085920 DAT_00085920_backing[0]
#define DAT_00085928 DAT_00085920_backing[8]
#define DAT_00085929 DAT_00085920_backing[9]
#define DAT_00085930 DAT_00085920_backing[0x10]
#define DAT_00085931 DAT_00085920_backing[0x11]
char s__DATA__00085970[] = "\\DATA\\";
static char s__DATA_pals_dat_00085978[] = "\\DATA\\pals.dat";
static undefined4 DAT_00202514;
static int DAT_00202720_backing[128];
static int *DAT_00202720 = DAT_00202720_backing;
/* Sizing-audit pass: `read_file_handle(DAT_00202514,&DAT_00202724,1)`
   -- pure 1-byte scalar (`(uint)DAT_00202724<<5`), never indexed.
   Down from 8192. */
static undefined1 DAT_00202724_backing[4];
static undefined4 DAT_00202728;
static char *DAT_0020274c;
/* Sizing-audit pass: `read_file_handle(DAT_00202514,&DAT_00202518,1)`
   -- pure 1-byte scalar, never indexed. Down from 8192. */
static undefined DAT_00202518_backing[4];
#define DAT_00202518 DAT_00202518_backing[0]
ushort DAT_00202744;
static undefined2 DAT_000859a8;
/* Was `undefined4` -- truncated the real 64-bit destination pointer
   decode_gr_entry_to_buffer assigns here (see that function's own comment on why
   this global exists at all: load_gr_resource_entries always decodes
   into its OWN malloc'd buffer via the allocator callback and only
   ever hands that buffer back through the post-process callback, so
   passing a pre-allocated destination needs this indirection). */
static void *DAT_00202510;
static undefined2 DAT_00202748;
static char s_doors_00085a64[] = "doors";
/* Sizing-audit pass: door-type slot table, explicit loop bound
   `while(iVar3<6)` (load_door_frames). HARD. Down from 8192. */
 undefined1 DAT_0023b840_backing[8];
/* Sizing-audit pass: `read_file_handle(param_1,&DAT_00202750,0x80)`
   -- exactly 128 bytes, matching its own nibble*4-stride indexing.
   HARD exact. Down from 256. */
undefined1 DAT_00202750_backing[128];
static char *DAT_0023c3fc;
static undefined4 *DAT_0023c404;
/* Sizing pass: the "grows unboundedly" claim below was wrong from the
   moment it was written, not just stale -- register_interned_string
   (this family's ONLY writer) has an unconditional `if (1 < iVar2)
   return 0;` early return that hard-caps the real record/page count
   (DAT_0024cfc0) at exactly 2, and every one of the 6 real call sites
   across the whole codebase (babl.c x5, game.c x1) passes one of only
   2 distinct page constants (0x7c/0x7d) -- independently confirmed by
   get_message_string's own header comment ("capped to at most 2
   distinct pages"). That cap isn't a recent fix either: it's been
   there since this function was first extracted/named (commit
   95f878f) with no behavior change, so it predates every widening
   pass that assumed otherwise. Verified live too: instrumented every
   high-water mark (UW_DEBUG_STRING_CACHE=1) and ran the full 19-script
   regression suite -- real usage never exceeded 1 page / 1 slot.
   Per-page stride is 0x804 (2052) bytes, so page index max 1 needs
   at most byte offset 2052+1; rounded up to 4096 for headroom. (The
   byte-plane pointer arrays just below have a different, finer-
   grained real bound -- see their own comment.) */
static undefined1 DAT_0024bfa0_backing[4096];
#define DAT_0024bfa0 DAT_0024bfa0_backing[0]
static undefined1 DAT_0024bfa1_backing[4096];
#define DAT_0024bfa1 DAT_0024bfa1_backing[0]
/* Sizing pass: byte-plane index is `(page*0x201 + sub_index) * 4`,
   page capped at 1 (see DAT_0024bfa0's own comment) and sub_index
   capped at 511 by register_interned_string's own zero-init loop
   (`while (iVar4 < 0x200)`, 512 slots per page) -- max byte offset
   (1*0x201+511)*4 = 4096. Rounded up to 8192 for headroom, down from
   1052672. */
static undefined1 DAT_0024bfa2_backing[8192];
#define DAT_0024bfa2 DAT_0024bfa2_backing[0]
static undefined1 DAT_0024bfa3_backing[8192];
#define DAT_0024bfa3 DAT_0024bfa3_backing[0]
static undefined1 DAT_0024bfa4_backing[8192];
#define DAT_0024bfa4 DAT_0024bfa4_backing[0]
static undefined1 DAT_0024bfa5_backing[8192];
#define DAT_0024bfa5 DAT_0024bfa5_backing[0]
/* The record-registration function (near FUN_00078820, "the string-
   interning cache") splits a real char* pointer byte-by-byte across
   these FOUR SEPARATE byte-plane arrays at the SAME index (byte0 in
   bfa2[i], byte1 in bfa3[i], byte2 in bfa4[i], byte3 in bfa5[i]) --
   capturing only the pointer's low 32 bits even before this port's
   64-bit truncation concerns. A side table of real pointers, indexed
   the same way (record*0x201+slot, i.e. the byte-plane index /4) is
   used instead wherever the real pointer is needed.
   Sizing pass: was matched to DAT_0024bfa2_backing's own (then-
   inflated) size/4; now matches its real bound instead (max slot
   index 1*0x201+511=1024, rounded up to 2048). */
static char *g_bfa2_real_ptrs[2048];
/* Sizing pass: same real bound as DAT_0024bfa0 above (this pair is
   indexed identically, `iVar3 * 0x804`, iVar3 capped at 1 by the same
   register_interned_string cap) -- the "once more than ~4 pages
   register" premise below was never possible; see DAT_0024bfa0's own
   comment for the full trace (git history, cap, and live
   verification). */
static undefined1 DAT_0024c7a2_backing[4096];
#define DAT_0024c7a2 DAT_0024c7a2_backing[0]
static undefined1 DAT_0024c7a3_backing[4096];
#define DAT_0024c7a3 DAT_0024c7a3_backing[0]
static undefined4 DAT_0024bf98;
/* Declared char* despite always being allocated/read/cast as a single
   2-byte count (see open_strings_pak_file: `(short *)ce_malloc(2)`, a 2-byte
   read into it, then `*DAT_0024cfb8` used as the item count). That
   mismatch meant every *DAT_0024cfb8 dereference only ever read the
   *first byte* of the real 2-byte count as a signed char -- for
   STRINGS.PAK's real (large, >127) count this came out negative, and
   `(int)*DAT_0024cfb8 << 2` produced a huge garbage byte count
   (0xFFFFFB94 observed) passed straight to fread() as `unsigned int
   size`, overflowing the undersized buffer ce_malloc allocated for
   the same corrupted (and clamped-to-4096-by-the-allocator's-own-sanity-
   check) size. This was corrupting the heap on nearly every run --
   almost certainly the root cause of the "free_list_checksum_botch"-style
   intermittent SIGABRT documented in the README, since a heap overflow's
   corruption is only detected whenever some later, unrelated free()
   happens to stumble on the mangled metadata. */
static unsigned short *DAT_0024cfb8;
static char *DAT_0024cfa8;
static short DAT_0024cfc0;
static char s_strings_pak_000878c0[] = "strings.pak";
static short DAT_0024cfb4;
static undefined2 DAT_000878bc;
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
static undefined1 DAT_0024af98_backing[4096];
#define DAT_0024af98 DAT_0024af98_backing[0]
/* Sizing-audit pass: `read_file_handle(param_1,&DAT_0024cfbc,1)` --
   pure 1-byte huffman bit-register scalar (shifted/masked), never
   indexed. Down from 8192 elements. */
static undefined2 DAT_0024cfbc_backing[4];
#define DAT_0024cfbc DAT_0024cfbc_backing[0]






// was FUN_000409f8 -- decodes a raw (still-compressed) .GR entry
// buffer into a real bitmap: entries whose own header byte is 4 are
// already stored raw (just skip the 5-byte header), anything else
// goes through decompress_gr_bitmap's palette-shifted decompressor. Same
// shape as the sibling decode inlined in blit_object_sprite_by_frame
// (see its own comment) -- called by weapon_swing_draw_tick.
char *decode_gr_entry_bitmap(param_1)
char * param_1;

{
  if (*param_1 == '\x04') {
    param_1 = param_1 + 5;
  }
  else {
    /* Dropped 3rd argument (the .GR entry's own compression-mode byte,
       *param_1) -- same bug already found and fixed twice elsewhere in
       this file for this identical decompress_gr_bitmap call shape (see
       object-rendering-findings.txt's "MILESTONE: objects render").
       Without it, decompress_gr_bitmap took its param_3==0 path and returned
       NULL for every weapon-swing frame, so weapon_swing_draw_tick's
       blit never actually ran despite resolving a real frame pointer
       and correct width/height. Confirmed live via UW_DEBUG_COMBAT. */
    param_1 = (char *)decompress_gr_bitmap(param_1 + 4,&DAT_00202520 + (uint)(byte)param_1[3] * 0x10,*param_1);
  }
  return param_1;
}




// was FUN_00041304
undefined4 open_gr_resource_file(param_1,param_2)
char * param_1;
char param_2;

{
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  uint uVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  byte local_11c [8];
  char local_114 [260];
  
  iVar3 = 0;
  do {
    local_114[iVar3] = '\0';
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 0x41);
  uVar1 = (uint)param_2;
  if (uVar1 == 3) {
    iVar3 = -(int)param_1;
    do {
      cVar2 = *param_1;
      param_1[(int)(local_114 + iVar3)] = cVar2;
      param_1 = param_1 + 1;
    } while (cVar2 != '\0');
  }
  else {
    pcVar4 = &DAT_0023cca8;
    stack0xffdc3244_ptr = local_114;
    do {
      cVar2 = *pcVar4;
      *stack0xffdc3244_ptr = cVar2; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar2 != '\0');
    ce_strcat(local_114,s__DATA__00085970);
    ce_strcat(local_114,param_1);
    /* Originally `uVar1 * 4 + 0x85990`: an index into a table of string
       pointers living at a fixed address in the original binary's data
       segment. Ghidra never surfaced that table's actual contents (no
       string constant was recovered at that address), so its real values
       are unrecoverable from this decompile. Best-effort style-suffix
       guess based on nearby font filenames (FONT5X6P.SYS/FONT5X6I.SYS);
       falls back to no suffix for anything out of that guessed range. */
    {
      /* Corrected: the actual data files are QUESTION.GR, VIEWS.GR,
         OBJECTS.GR, DOORS.GR etc. (confirmed present in the real install),
         not the "P/I/B.SYS" style-suffix guessed earlier -- ".GR" is the
         real extension for all of these regardless of uVar1. */
      ce_strcat(local_114, ".GR");
    }
  }
  DAT_00202514 = open_file_for_read(local_114);
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] open_gr_resource_file: path='%s' param_2=%d open_handle=%d\n", local_114, (int)param_2, (int)DAT_00202514);
  if (DAT_00202514 != -1) {
    iVar3 = read_file_handle(DAT_00202514,local_11c,1);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] open_gr_resource_file: header_read=%d header_byte=%d expected=%d\n", iVar3, (int)local_11c[0], (int)uVar1);
    if (((((iVar3 == 1) && (local_11c[0] == uVar1)) &&
         ((uVar1 != 2 || (iVar3 = read_file_handle(DAT_00202514,&DAT_00202518,1), iVar3 == 1)))) &&
        (iVar3 = read_file_handle(DAT_00202514,&DAT_00202728,2), iVar3 == 2)) &&
       (((uVar1 != 3 || (iVar3 = load_gr_format3_extra_table(), iVar3 != 0)) &&
        (DAT_0020274c = ce_malloc(((ushort)DAT_00202728 + 1) * 4), DAT_0020274c != 0)))) {
      iVar3 = read_file_handle(DAT_00202514,DAT_0020274c,((ushort)DAT_00202728 + 1) * 4);
      if (iVar3 == ((ushort)DAT_00202728 + 1) * 4) {
        return 1;
      }
      LocalFree(DAT_0020274c);
      DAT_0020274c = 0;
    }
    CloseHandle(DAT_00202514);
  }
  return 0;
}




// was FUN_00041db0
void load_door_frames()

{
  undefined2 uVar1;
  undefined2 uVar2;
  int iVar3;
  
  uVar2 = DAT_00202748;
  uVar1 = DAT_00202744;
  iVar3 = 0;
  /* Was `DAT_00202734 + 0x30` -- confirmed via real ARM disassembly
     (0x41dcc: `add r0,r0,#0x30`) that this is genuinely what the
     original binary computes, not a decompiler artifact. With
     DAT_00202734==643 (TMOBJ's own start, see its declaration
     comment), that lands this loop's 6 scratch slots at absolute
     691-696 -- overlapping LFTI's own last 2 entries (691-692) AND
     FLASKS' first 4 (693-696), which have already been correctly
     registered by the time a door is first loaded. Since
     DAT_00202744 gets restored right after this loop, these 6 slots
     are only ever meant to be scratch space, but the original game's
     chosen offset was too small to clear the whole HUD-icon preload
     range (LFTI/FLASKS/COMPASS/DRAGONS/INV/POWER/EYES/CHAINS/SPELLS/
     SCRLEDGE/OPTB, ending at 919) -- a genuine bug in the shipped
     1994 binary, confirmed live: it silently overwrites the flask's
     own first 4 animation frames with door-sized (32x64) data,
     visible as a spurious door image under the health/mana flasks.
     Deliberately deviating from the original's exact (buggy) value
     here per user direction: picked a fixed scratch base far past
     every real resource range this project has identified, so this
     temporary borrow can never collide with anything real again.

     REAL BUG FOUND (this session): the first choice, 60000, broke a
     DIFFERENT thing than the collision this comment was written to
     avoid -- emit_catalog_object's own `frame_or_texid` parameter
     (the value emit_anim_object_frames passes straight through as
     `60000 + door_type`, see its own comment) is a signed 16-bit
     `short`, and that function uses `frame_or_texid < 0` as a real,
     deliberate sentinel check (confirmed via disassembly: original
     code, not something this project added) meaning "no specific
     frame -- use the catalog's own internal multi-frame animation
     logic instead." 60000 wraps to -5536 as a signed short, so the
     door leaf's real, correctly-decoded texture was silently
     discarded every time in favor of that internal fallback path --
     confirmed live via UW_DEBUG_DOOR ("door leaf using the wrong
     texture"). g_grtile_registry's own backing table is genuinely sized
     for the full unsigned 0..65535 range, so 60000 is a perfectly
     valid WRITE index here -- the bug is purely on the signed-short READ side deep in
     emit_catalog_object, not fixable by widening this one constant's
     own type. Lowered to stay under 32768 (comfortably clear of both
     the ~919 real-resource ceiling above and the signed-short sign
     bit here) so the exact same scratch-slot mechanism reads back
     correctly on both ends. */
  DAT_00202744 = 20000;
  do {
    /* Was passed `0` for the post-process/registration callback (param_5)
       -- with no registrar, even a successful allocate+read never stores
       the decoded buffer into lookup_grtile_by_id's DAT_0024e090[] pointer
       table, so every door frame stayed permanently unresolved (0x0
       width/height, drawing nothing). register_gr_group_entry (load_gr_resource_group/
       QUESTION-VIEWS-etc.'s own registrar) already does exactly what's
       needed here: register at the running cursor DAT_00202744, which
       this loop already manages by hand the same way load_gr_resource_group's
       caller does. */
    uint _ok = load_gr_resource_entries(s_doors_00085a64,(&DAT_0023b840)[iVar3],1,&alloc_door_frame_buffer,&register_gr_group_entry);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] load_door_frames: loading doors[%d] slot=%d -> DAT_00202744=%d ok=%u\n",
              iVar3, (int)(&DAT_0023b840)[iVar3], (int)DAT_00202744, _ok);
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    DAT_00202744 = DAT_00202744 + 1;
  } while (iVar3 < 6);
  DAT_00202744 = uVar1;
  DAT_00202748 = uVar2;
  clear_ambient_sound_target();
  return;
}




/* alloc_flip_grtile_slot/resolve_flip_grtile_slot: were real, confirmed
   `mov r0,#0; cpy pc,lr` no-ops in the pristine binary (disassembly-
   verified at both real addresses, 0x4994c and 0x49954 -- not a
   decompilation artifact). Their only caller, begin_hud_panel_flip's
   double-buffered-grtile setup for the chain-hotspot panel-switch flip
   animation, unconditionally failed as a result (uVar6 = uVar6 &
   alloc_flip_grtile_slot() forced uVar6 to 0), so g_flip_grtile_cache_ready's
   ready bit could never be set and the entire staged blit path in
   advance_hud_panel_flip was dead code -- in the shipped .exe, not just this
   decompile. See [[chain-hotspot-stats-panel]]: exhaustive real-binary
   cross-referencing found no other path to draw_stats_panel_content
   either, so this genuinely was inert in the original game.

   THE BODIES BELOW ARE NOT DECOMPILED CODE. Per explicit user request
   ("implement these stubs to revive this path"), this is a from-
   scratch reimplementation of what these two functions would need to
   do for the surrounding (real, decompiled) double-buffered-grtile
   machinery to actually work, since the original binary's own version
   is confirmed permanently inert and there is nothing to recover.
   Written to match this file's own already-established grtile
   conventions (grtile_alloc_registered's opaque-key allocation,
   and the g_grtile_real_ptrs registry-walk resolution already used by
   capture_framebuffer_rect_to_grtile/restore_captured_grtile_backdrop/blit_grtile_to_framebuffer) rather
   than invented from nothing. */
undefined4 alloc_flip_grtile_slot()

{
  /* Not decompiled (see above). Sized generously (0x100*0x80 = 32768
     bytes) rather than exactly: the real per-slot sizes the original
     binary would have used were never recovered (this whole path was
     dead, so nothing to disassemble), and begin_hud_panel_flip itself indexes
     one slot at a +0x2800 (10240) byte offset, so this needs enough
     headroom for whatever panels.GR frame-3 decode lands there on top
     of the base 0x72x0x53 panel rect every slot also needs to hold. */
  return grtile_alloc_registered(0x100,0x80);
}



void *resolve_flip_grtile_slot(param_1)
undefined4 param_1;

{
  /* Not decompiled (see above). Same registry-walk resolution as
     capture_framebuffer_rect_to_grtile/restore_captured_grtile_backdrop/blit_grtile_to_framebuffer:
     grtile_alloc_registered's return value is an opaque truncated
     identity key (see its own comment), not a real pointer -- find
     the matching record in the DAT_0023c3fc registry and return the
     real pointer g_grtile_real_ptrs tracks for it. */
  int iVar1;
  undefined4 *puVar2;

  if (param_1 == 0) {
    return 0;
  }
  iVar1 = 0;
  puVar2 = DAT_0023c3fc;
  while (param_1 != *puVar2) {
    iVar1 = iVar1 + 1;
    puVar2 = (undefined4 *)((char *)puVar2 + 0x11);
    if (0x13f < iVar1) {
      return 0;
    }
  }
  return g_grtile_real_ptrs[iVar1];
}


// was FUN_00076a2c -- allocates a param_1 x param_2 raw pixel buffer
// (real heap pointer, tracked in g_grtile_real_ptrs) and registers it
// into DAT_0023c3fc's 320-record identity-key table, returning a
// truncated 32-bit key most callers use for opaque compare/store
// (sprite_list_alloc_raw_entry, container/inventory hotspot scratch
// tiles, status-icon buffers) rather than the real pointer -- see
// capture_framebuffer_rect_to_grtile, the one caller that needs actual
// dereferenceable pixels. Sibling of uw_alloc_grtile, which does the
// same allocation without registering a lookup key.
undefined4 grtile_alloc_registered(param_1,param_2)
uint param_1;
uint param_2;

{
  /* uVar1 (the malloc'd buffer's real address) is deliberately ALSO
     packed byte-by-byte into the record below as an opaque 4-byte
     identity key, and *that* truncated key -- not the real pointer -- is
     what this function returns and what all 11 of its other callers
     store/compare/pass into restore_captured_grtile_backdrop/capture_framebuffer_rect_to_grtile ("does this key
     match a record's stored key"): self-consistent lookups that don't
     need the real address, so leave this alone. The one caller that DOES
     need the real, dereferenceable pointer (register_grtile_entry, feeding a
     memmove) gets it from uw_alloc_grtile() instead -- see there -- not
     from this function's return value. */
  void *uVar1;
  undefined4 *puVar2;
  int iVar3;

  puVar2 = DAT_0023c3fc;
  while( true ) {
    if (puVar2 == DAT_0023c404) {
      return 0;
    }
    if (*(char *)(puVar2 + 2) == '\0') break;
    puVar2 = (undefined4 *)((char *)puVar2 + 0x11);
  }
  iVar3 = (param_1 & 0xffff) * (param_2 & 0xffff);
  uVar1 = ce_malloc(iVar3);
  /* capture_framebuffer_rect_to_grtile (one of the "11 other callers" mentioned above) turns
     out to ALSO need the real pointer -- it renders glyph pixels
     directly into this buffer, not just compare-by-key -- so track the
     real address alongside the truncated key, indexed the same way
     capture_framebuffer_rect_to_grtile's own search loop does (record position / 0x11). A
     real 64-bit heap address can't be losslessly recovered from the
     low-32-bits-only identity key on this host. */
  g_grtile_real_ptrs[((char *)puVar2 - (char *)DAT_0023c3fc) / 0x11] = uVar1;
  *(char *)puVar2 = (char)(uintptr_t)uVar1;
  *(char *)((char *)puVar2 + 1) = (char)((uintptr_t)uVar1 >> 8);
  *(char *)((char *)puVar2 + 2) = (char)((uintptr_t)uVar1 >> 0x10);
  *(char *)((char *)puVar2 + 3) = (char)((uintptr_t)uVar1 >> 0x18);
  ce_memset(uVar1,0,iVar3);
  *(char *)((char *)puVar2 + 0xe) = (char)(param_1 >> 8);
  *(char *)(puVar2 + 4) = (char)(param_2 >> 8);
  *(char *)((char *)puVar2 + 5) = (char)((uint)iVar3 >> 8);
  *(char *)((char *)puVar2 + 0xd) = (char)param_1;
  *(char *)((char *)puVar2 + 0xf) = (char)param_2;
  *(char *)((char *)puVar2 + 6) = (char)((uint)iVar3 >> 0x10);
  *(char *)(puVar2 + 1) = (char)iVar3;
  *(char *)((char *)puVar2 + 7) = (char)((uint)iVar3 >> 0x18);
  *(undefined1 *)(puVar2 + 2) = 1;
  DAT_0023c404 = (undefined4 *)((char *)DAT_0023c404 + 0x11);
  return *puVar2;
}

void *uw_alloc_grtile(param_1,param_2)
uint param_1;
uint param_2;
{
  /* register_grtile_entry needs a real, dereferenceable pointer (it memmoves into
     the result) rather than grtile_alloc_registered's opaque truncated handle -- see
     the comment there. Same size computation, no registration into
     grtile_alloc_registered's own DAT_0023c3fc identity-key table since nothing
     ever looks buffers from this call path up that way (see
     register_grtile_entry). */
  unsigned int size;
  void *p;
  size = (param_1 & 0xffff) * (param_2 & 0xffff);
  p = ce_malloc(size);
  if (p != 0) {
    ce_memset(p,0,size);
  }
  return p;
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00076b8c
undefined4 capture_framebuffer_rect_to_grtile(param_1,param_2,param_3,param_4,param_5)
short * param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;
short param_5;

{
  bool bVar1;
  int iVar2;
  bool bVar3;
  short sVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  int iVar7;
  short sVar8;
  int iVar9;
  short sVar10;
  int iVar11;
  int iVar12;
  /* param_1 is grtile_alloc_registered's opaque truncated identity key (used for
     the record-table search below), not a real pointer -- but this
     function ALSO renders glyph pixels directly into the matched
     record's buffer (the `*param_1 = ...` loop further down used to
     write through the key itself, which crashes once real heap
     addresses don't fit in 32 bits). Use the real pointer tracked in
     g_grtile_real_ptrs instead once a match is found. */
  short *psVar_target;

  puVar5 = DAT_0023c3fc;
  sVar10 = (short)param_4;
  bVar3 = false;
  iVar12 = 0;
  puVar6 = DAT_0023c3fc;
  do {
    if (param_1 == (short *)*puVar6) {
      psVar_target = (short *)g_grtile_real_ptrs[iVar12];
      iVar12 = iVar12 * 0x11;
      *(char *)((char *)DAT_0023c3fc + iVar12 + 9) = (char)param_2;
      *(char *)((char *)puVar5 + iVar12 + 10) = (char)((uint)param_2 >> 8);
      puVar5 = DAT_0023c3fc;
      *(char *)((char *)DAT_0023c3fc + iVar12 + 0xb) = (char)param_3;
      *(char *)((char *)puVar5 + iVar12 + 0xc) = (char)((uint)param_3 >> 8);
      puVar5 = DAT_0023c3fc;
      sVar8 = *(short *)((char *)DAT_0023c3fc + iVar12 + 0xd);
      if (sVar10 <= sVar8) {
        *(char *)((char *)DAT_0023c3fc + iVar12 + 0xd) = (char)param_4;
        *(char *)((char *)puVar5 + iVar12 + 0xe) = (char)((uint)param_4 >> 8);
        sVar8 = sVar10;
      }
      sVar10 = sVar8;
      puVar5 = DAT_0023c3fc;
      sVar8 = *(short *)((char *)DAT_0023c3fc + iVar12 + 0xf);
      sVar4 = sVar8;
      if (param_5 <= sVar8) {
        *(char *)((char *)DAT_0023c3fc + iVar12 + 0xf) = (char)param_5;
        sVar4 = param_5;
      }
      bVar3 = true;
      bVar1 = param_5 <= sVar8;
      param_5 = sVar4;
      if (bVar1) {
        *(char *)((char *)puVar5 + iVar12 + 0x10) = (char)((ushort)sVar4 >> 8);
      }
      break;
    }
    iVar12 = iVar12 + 1;
    puVar6 = (undefined4 *)((char *)puVar6 + 0x11);
  } while (iVar12 < 0x140);
  iVar12 = (int)(short)param_2;
  if ((int)DAT_000a85c4 <= iVar12 + sVar10 + -1) {
    sVar8 = (short)param_2;
    if (iVar12 < DAT_000a85c4) {
      iVar12 = (int)DAT_000a85c4;
      sVar8 = DAT_000a85c4;
    }
    if (iVar12 <= DAT_000842a4) {
      iVar7 = (DAT_000842a4 - iVar12) + 1;
      iVar9 = (int)sVar10;
      if (iVar7 < iVar9) {
        sVar10 = DAT_000842a4 - sVar8;
      }
      sVar8 = (short)param_3;
      if (iVar7 < iVar9) {
        sVar10 = sVar10 + 1;
      }
      if ((int)DAT_000a85c8 <= (int)sVar8 + (int)param_5) {
        if ((int)sVar8 < (int)DAT_000a85c8) {
          param_5 = (DAT_000a85c8 - sVar8) + param_5;
          sVar8 = DAT_000a85c8;
        }
        iVar9 = (int)sVar8;
        if (iVar9 <= DAT_000842a8) {
          if ((DAT_000842a8 - iVar9) + 1 < (int)param_5) {
            param_5 = (DAT_000842a8 - sVar8) + 1;
          }
          if (bVar3) {
            iVar7 = (int)sVar10;
            iVar2 = (int)param_5;
            dirty_rect_union(iVar9,iVar9 + iVar2,iVar12,iVar12 + iVar7);
            iVar12 = iVar9 * 0x140 + iVar12;
            iVar9 = 0;
            if (0 < iVar2) {
              do {
                if (199 < iVar9) {
                  return 1;
                }
                iVar11 = 0;
                if (0 < iVar7) {
                  do {
                    if (0x13f < iVar11) break;
                    iVar11 = iVar11 + 1;
                    sVar10 = *(short *)((g_uw_framebuffer) + iVar12 * 2)
                    ;
                    iVar12 = iVar12 + 1;
                    if ((g_blit_transparent_mode & sVar10 == 0) == 0) {
                      *psVar_target = sVar10;
                    }
                    psVar_target = psVar_target + 1;
                  } while (iVar11 < iVar7);
                }
                iVar9 = iVar9 + 1;
                iVar12 = iVar12 + (0x140 - iVar7);
              } while (iVar9 < iVar2);
            }
            return 1;
          }
        }
      }
    }
  }
  return 0;
}






// was FUN_000769e8 -- allocates and zero-initializes the grtile
// registry's record table (DAT_0023c3fc, 0x1540 bytes / 0x11-byte
// stride = 320 records exactly, matching g_grtile_real_ptrs's own
// 320-entry size), and sets its "end" pointer (DAT_0023c404).
// Backs grtile_alloc_registered/capture_framebuffer_rect_to_grtile/
// restore_captured_grtile_backdrop/invalidate_grtile_by_key below --
// the "captured framebuffer region" system used to save/restore
// backdrop pixels behind menus, dialogs, and HUD overlays.
void init_grtile_registry()

{
  DAT_0023c3fc = ce_malloc(0x1540);
  if (DAT_0023c3fc != 0) {
    ce_memset(DAT_0023c3fc,0,0x1540);
    DAT_0023c404 = DAT_0023c3fc + 0x11;
  }
  return;
}




// was FUN_00076b24 -- searches the grtile registry (DAT_0023c3fc)
// for a record whose key matches param_1, and if found, zeroes that
// record's own key field (marking the slot free/invalid). Returns
// 0xffffffff if no match was found before reaching the table's end
// (DAT_0023c404). Fixed a dropped-argument call site in
// src/hud.c's flush_sprite_list_compositor while moving this (see
// its own comment).
undefined4 invalidate_grtile_by_key(param_1)
int param_1;

{
  int *piVar1;
  
  piVar1 = DAT_0023c3fc;
  while( true ) {
    if (piVar1 == DAT_0023c404) {
      return 0xffffffff;
    }
    if (*piVar1 == param_1) break;
    piVar1 = (int *)((char *)piVar1 + 0x11);
  }
  *(undefined1 *)(piVar1 + 2) = 0;
  return 0;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00076e98 -- looks up a grtile registry record by key
// (param_1) and blits its previously-captured backdrop pixels
// (tracked via g_grtile_real_ptrs, not the truncated key itself --
// see param_1's own comment) back into the real framebuffer at the
// record's stored rect, honoring g_blit_transparent_mode, then marks
// the affected rect dirty. Fixed a dropped-argument call site in
// src/player.c's refresh_experience_display while moving this (see
// its own comment). Widely used throughout babl.c, chargen.c,
// containers.c, and inventory.c to restore backdrops behind closed
// menus/dialogs.
undefined4 restore_captured_grtile_backdrop(param_1)
short * param_1;

{
  int iVar1;
  short sVar2;
  int iVar3;
  undefined4 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  /* param_1 is grtile_alloc_registered's opaque truncated identity key, not a
     real pointer -- same issue as capture_framebuffer_rect_to_grtile above. Read glyph
     pixels back through the real pointer tracked in
     g_grtile_real_ptrs instead of dereferencing the key directly. */
  short *psVar_target;

  iVar3 = 0;
  puVar4 = DAT_0023c3fc;
  while (param_1 != (short *)*puVar4) {
    iVar3 = iVar3 + 1;
    puVar4 = (undefined4 *)((char *)puVar4 + 0x11);
    if (0x13f < iVar3) {
      return 0xffffffff;
    }
  }
  psVar_target = (short *)g_grtile_real_ptrs[iVar3];
  iVar5 = (int)*(short *)((char *)DAT_0023c3fc + iVar3 * 0x11 + 9);
  iVar7 = (int)*(short *)((char *)DAT_0023c3fc + iVar3 * 0x11 + 0xb);
  iVar1 = (int)*(short *)((char *)DAT_0023c3fc + iVar3 * 0x11 + 0xd);
  iVar3 = (int)*(short *)((char *)DAT_0023c3fc + iVar3 * 0x11 + 0xf);
  iVar6 = iVar7 * 0x140 + iVar5;
  dirty_rect_union(iVar7,iVar3 + iVar7,iVar5,iVar1 + iVar5);
  iVar5 = 0;
  if (0 < iVar3) {
    do {
      if (199 < iVar5) {
        return 0;
      }
      iVar7 = 0;
      if (0 < iVar1) {
        do {
          if (0x13f < iVar7) break;
          sVar2 = *psVar_target;
          iVar7 = iVar7 + 1;
          psVar_target = psVar_target + 1;
          if ((g_blit_transparent_mode & sVar2 == 0) == 0) {
            *(short *)((g_uw_framebuffer) + iVar6 * 2) = sVar2;
          }
          iVar6 = iVar6 + 1;
        } while (iVar7 < iVar1);
      }
      iVar5 = iVar5 + 1;
      iVar6 = iVar6 + (0x140 - iVar1);
    } while (iVar5 < iVar3);
  }
  debug_framebuffer_dump("restore_captured_grtile_backdrop");
  return 0;
}





// was FUN_0007856c -- initializes the string-resource page cache
// (DAT_0024bfa0-family, see that global's own comment): clears the
// first 2 cache-record slots (0x804/2052-byte stride, matching
// get_message_string's and register_interned_string's own indexing) to
// an empty/sentinel state (DAT_0024bfa0/1 = 0xffff, the page-id
// short field; DAT_0024c7a2/3 and the 512-entry DAT_0024bfa2/3/4/5
// sub-arrays zeroed), then calls open_strings_pak_file and,
// conditionally, report_categorized_fatal_error -- likely a "load the default/startup
// string table" step. This cache grows unboundedly at runtime as
// more pages are registered; this only seeds its initial 2 slots.
undefined4 init_string_resource_cache()

{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  do {
    iVar3 = iVar4 * 0x804;
    (&DAT_0024bfa0)[iVar3] = 0xff;
    (&DAT_0024bfa1)[iVar3] = 0xff;
    (&DAT_0024c7a2)[iVar3] = 0;
    (&DAT_0024c7a3)[iVar3] = 0;
    iVar3 = 0;
    do {
      iVar1 = (iVar4 * 0x201 + iVar3) * 4;
      (&DAT_0024bfa2)[iVar1] = 0;
      (&DAT_0024bfa3)[iVar1] = 0;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      (&DAT_0024bfa4)[iVar1] = 0;
      (&DAT_0024bfa5)[iVar1] = 0;
    } while (iVar3 < 0x200);
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 2);
  sVar2 = open_strings_pak_file();
  if (sVar2 != 0) {
    /* Was called bare -- dropped argument. open_strings_pak_file's own
       return values (e.g. 0x1001) are already fully-formed error
       codes in report_categorized_fatal_error's expected
       category*0x1000+subcode shape, confirming sVar2 itself is the
       intended argument. */
    report_categorized_fatal_error(sVar2);
  }
  return 1;
}



// was thunk_FUN_00078e28 -- byte-identical duplicate body of
// close_strings_pak_file (was FUN_00078e28) at a different address --
// same split-symbol/naming-collision pattern collapsed elsewhere in
// this project. Collapsed to a real call to avoid the duplication.
void close_strings_pak_file_thunk()

{
  close_strings_pak_file();
  return;
}





// was FUN_0007863c -- the core message-string lookup used throughout
// this game: param_1 packs a page number (bits 9+) and a sub-index
// within that page (low 9 bits). Searches the string-resource cache
// (DAT_0024bfa0-family) for the page; if not yet cached, decodes it
// via decode_strings_pak_entry (not yet named) and returns the string directly;
// if already cached, returns the pointer from the real-pointer side
// table (g_bfa2_real_ptrs). ~130 call sites throughout this codebase.
//
// Was `undefined4` return -- truncating the real char* string pointer
// decode_strings_pak_entry returns (and the string pointers stored in the
// DAT_0024bfa0-family table read below). Most callers pass the
// result straight into a char*-typed argument so aren't affected by
// this fix, but any caller that first stores it in an
// `undefined4`/`int` local before using it as a pointer needs that
// local retyped too -- fix those as they're actually hit crashing,
// same as everywhere else this session.
char *get_message_string(param_1)
ushort param_1;

{
  uint uVar1;
  char *uVar2;
  int iVar3;
  short sVar4;

  uVar1 = (uint)(param_1 >> 9);
  iVar3 = 0;
  sVar4 = -1;
  if (0 < DAT_0024cfc0) {
    do {
      sVar4 = (short)iVar3;
      if ((int)*(short *)(&DAT_0024bfa0 + iVar3 * 0x804) == uVar1) break;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      sVar4 = -1;
    } while (iVar3 < DAT_0024cfc0);
  }
  if (sVar4 < 0) {
    if (uVar1 == 0) {
      uVar1 = (uint)DAT_0024cfac;
    }
    /* Was `decode_strings_pak_entry(uVar1)` -- called with only one explicit
       argument, relying on a register-leftover idiom for the second
       (the "dropped argument" pattern used throughout this file, e.g.
       ce_strlen/draw_text_string earlier this session) to still hold
       the string's sub-index within this page. That register doesn't
       reliably survive here either (confirmed: string lookups that
       should succeed -- e.g. chargen field labels -- came back as
       genuinely empty strings, because decode_strings_pak_entry's own `iVar1 <
       local_2e` bounds check saw garbage and fell straight through to
       its "not found" empty-string return). param_1's low 9 bits are
       exactly this sub-index (uVar1 above is `param_1 >> 9`, the page
       number) -- pass it explicitly instead. */
    uVar2 = (char *)decode_strings_pak_entry(uVar1,(uint)(param_1 & 0x1ff));
  }
  else {
    /* Was reading 4 consecutive bytes from DAT_0024bfa2 alone, but the
       register function actually splits the pointer across bfa2/3/4/5
       at the SAME (un-multiplied-by-4) index -- that read was pulling
       the real low byte plus 3 zero padding bytes, not reconstructing
       anything real, and only ever captured 32 bits regardless. Use
       the real-pointer side table instead -- see its comment. */
    uVar2 = g_bfa2_real_ptrs[sVar4 * 0x201 + (int)(short)(param_1 & 0x1ff)];
  }
  return uVar2;
}





// was FUN_0007873c -- the write-side counterpart to
// get_message_string: interns a real string pointer (param_1) into
// the string-resource cache under page param_2, creating that page
// (capped to at most 2 distinct pages via this path) if it doesn't
// exist yet. Stores the pointer in g_bfa2_real_ptrs (and its split
// byte-plane form in the DAT_0024bfa2-family arrays) at the page's
// next free sub-index, then returns a packed message id
// `(page << 9) | sub_index` -- the exact same encoding
// get_message_string's param_1 decodes.
int register_interned_string(param_1,param_2)
char *param_1;
undefined4 param_2;

{
  int iVar1;
  int iVar2;
  ushort uVar3;
  int iVar4;
  short sVar5;
  
  iVar4 = 0;
  iVar2 = (int)DAT_0024cfc0;
  sVar5 = -1;
  if (0 < iVar2) {
    do {
      sVar5 = (short)iVar4;
      if (*(short *)(&DAT_0024bfa0 + iVar4 * 0x804) == (short)param_2) break;
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      sVar5 = -1;
    } while (iVar4 < iVar2);
  }
  if (sVar5 < 0) {
    if (1 < iVar2) {
      return 0;
    }
    iVar4 = iVar2 * 0x804;
    (&DAT_0024bfa0)[iVar4] = (char)param_2;
    (&DAT_0024bfa1)[iVar4] = (char)((uint)param_2 >> 8);
    (&DAT_0024c7a2)[iVar4] = 0;
    (&DAT_0024c7a3)[iVar4] = 0;
    iVar4 = 0;
    do {
      iVar1 = (iVar2 * 0x201 + iVar4) * 4;
      (&DAT_0024bfa2)[iVar1] = 0;
      (&DAT_0024bfa3)[iVar1] = 0;
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      (&DAT_0024bfa4)[iVar1] = 0;
      (&DAT_0024bfa5)[iVar1] = 0;
    } while (iVar4 < 0x200);
    sVar5 = DAT_0024cfc0;
    DAT_0024cfc0 = (short)((uint)((iVar2 + 1) * 0x10000) >> 0x10);
    if (getenv("UW_DEBUG_STRING_CACHE")) {
      static int hwm_pages = -1;
      if (DAT_0024cfc0 > hwm_pages) {
        hwm_pages = DAT_0024cfc0;
        fprintf(stderr, "[string-cache] new high-water page count: %d\n", (int)DAT_0024cfc0);
      }
    }
  }
  iVar4 = sVar5 * 0x804;
  uVar3 = *(ushort *)(&DAT_0024c7a2 + iVar4);
  iVar2 = (sVar5 * 0x201 + (int)(short)uVar3) * 4;
  /* Real pointer tracked separately -- see g_bfa2_real_ptrs's comment.
     iVar2 is already the byte-plane index (pre-multiplied by 4); the
     side table uses the un-multiplied slot index. */
  g_bfa2_real_ptrs[iVar2 / 4] = param_1;
  (&DAT_0024bfa2)[iVar2] = (char)param_1;
  (&DAT_0024bfa3)[iVar2] = (char)((uint)param_1 >> 8);
  (&DAT_0024bfa4)[iVar2] = (char)((uint)param_1 >> 0x10);
  (&DAT_0024bfa5)[iVar2] = (char)((uint)param_1 >> 0x18);
  if (getenv("UW_DEBUG_STRING_CACHE")) {
    static int hwm_slot = -1;
    int slot = sVar5 * 0x201 + (int)(short)uVar3;
    if (slot > hwm_slot) {
      hwm_slot = slot;
      fprintf(stderr, "[string-cache] new high-water slot index: %d (page %d sub-index %u, byte-plane byte offset %d)\n",
              slot, (int)sVar5, (unsigned)uVar3, iVar2);
    }
  }
  sVar5 = *(short *)(&DAT_0024c7a2 + iVar4);
  (&DAT_0024c7a2)[iVar4] = (char)(sVar5 + 1);
  (&DAT_0024c7a3)[iVar4] = (char)((uint)(sVar5 + 1) >> 8);
  return (int)(short)((short)param_2 << 9 | uVar3);
}





// was FUN_00078918 -- overwrites an already-interned string in
// place: param_2 is an existing packed message id (page in bits 9+,
// sub-index in the low 9 bits, same encoding as get_message_string/
// register_interned_string), param_1 is the new real string pointer.
// Looks up the page and, if found, rewrites the real-pointer side
// table entry at that exact sub-index (does not allocate a new
// slot). Returns param_2 unchanged on success, or 0 if the page
// wasn't found. No callers found by grep in the remaining decompile.
uint overwrite_interned_string(param_1,param_2)
char *param_1;
uint param_2;

{
  int iVar1;
  short sVar2;
  
  iVar1 = 0;
  sVar2 = -1;
  if (0 < DAT_0024cfc0) {
    do {
      sVar2 = (short)iVar1;
      if ((int)*(short *)(&DAT_0024bfa0 + iVar1 * 0x804) == (param_2 & 0xffff) >> 9) break;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
      sVar2 = -1;
    } while (iVar1 < DAT_0024cfc0);
  }
  if (sVar2 < 0) {
    param_2 = 0;
  }
  else {
    iVar1 = (sVar2 * 0x201 + (int)(short)((ushort)param_2 & 0x1ff)) * 4;
    /* Real pointer tracked separately -- see g_bfa2_real_ptrs's comment
       and register_interned_string's identical write above. */
    g_bfa2_real_ptrs[iVar1 / 4] = param_1;
    (&DAT_0024bfa2)[iVar1] = (char)param_1;
    (&DAT_0024bfa3)[iVar1] = (char)((uint)param_1 >> 8);
    (&DAT_0024bfa4)[iVar1] = (char)((uint)param_1 >> 0x10);
    (&DAT_0024bfa5)[iVar1] = (char)((uint)param_1 >> 0x18);
  }
  return param_2;
}





// was FUN_00078a04 -- finds the string-resource cache page matching
// param_1 and, if found, clears its entire contents: resets its
// sub-index count (DAT_0024c7a2/3) and nulls out every one of its
// 512 real-pointer/byte-plane slots (g_bfa2_real_ptrs and the
// DAT_0024bfa2-family arrays). A no-op if the page isn't cached.
// Confirmed real caller: src/babl.c, called with page 0x7c.
void reset_string_resource_page(param_1)
undefined4 param_1;

{
  int iVar1;
  int iVar2;
  int iVar3;
  short sVar4;
  
  iVar3 = 0;
  sVar4 = -1;
  if (0 < DAT_0024cfc0) {
    do {
      sVar4 = (short)iVar3;
      if (*(short *)(&DAT_0024bfa0 + iVar3 * 0x804) == (short)param_1) break;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      sVar4 = -1;
    } while (iVar3 < DAT_0024cfc0);
  }
  iVar3 = (int)sVar4;
  if (-1 < iVar3) {
    iVar2 = iVar3 * 0x804;
    (&DAT_0024bfa0)[iVar2] = (char)param_1;
    (&DAT_0024bfa1)[iVar2] = (char)((uint)param_1 >> 8);
    (&DAT_0024c7a2)[iVar2] = 0;
    (&DAT_0024c7a3)[iVar2] = 0;
    iVar2 = 0;
    do {
      iVar1 = (iVar3 * 0x201 + iVar2) * 4;
      g_bfa2_real_ptrs[iVar1 / 4] = 0;
      (&DAT_0024bfa2)[iVar1] = 0;
      (&DAT_0024bfa3)[iVar1] = 0;
      (&DAT_0024bfa4)[iVar1] = 0;
      (&DAT_0024bfa5)[iVar1] = 0;
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 0x200);
  }
  return;
}





// was FUN_00078d18 -- opens STRINGS.PAK (built from the install
// dir + "\DATA\strings.pak"): reads its 2-byte item count into
// DAT_0024cfb8, allocates and reads the offset-index table into
// DAT_0024cfa8, then reopens the file (keeping the handle in
// DAT_0024bf98 for later per-string seeks/reads, see
// get_message_string's own decode path). Returns 0 on success,
// 0x1001 if the index-table allocation failed, or 0x3002 if either
// open failed. Confirmed real caller: init_string_resource_cache.
undefined4 open_strings_pak_file()

{
  /* Ghidra couldn't correlate this copy loop's destination with a real
     stack slot (see fix_stack_copy_loops.py); it's actually copying
     DAT_0023cca8 (the install dir, set up earlier) directly into
     acStack_118, which the two ce_strcat (strcat-shaped) calls right
     below then append "\DATA\" and "strings.pak" onto to build the full
     path. */
  char *stack0xffdc3240_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char acStack_118 [260];

  pcVar2 = &DAT_0023cca8;
    stack0xffdc3240_ptr = acStack_118;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3240_ptr = cVar1; stack0xffdc3240_ptr = stack0xffdc3240_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_118,s__DATA__00085970);
  ce_strcat(acStack_118,s_strings_pak_000878c0);
  iVar3 = open_file_for_read(acStack_118);
  if (iVar3 != -1) {
    DAT_0024cfb8 = (short *)ce_malloc(2);
    read_file_handle(iVar3,DAT_0024cfb8,2);
    DAT_0024cfa8 = ce_malloc((int)*DAT_0024cfb8 << 2);
    if (DAT_0024cfa8 == 0) {
      CloseHandle(iVar3);
      return 0x1001;
    }
    read_file_handle(iVar3,DAT_0024cfa8,(int)*DAT_0024cfb8 << 2);
    CloseHandle(iVar3);
    DAT_0024bf98 = open_file_for_read(acStack_118);
    if (DAT_0024bf98 != -1) {
      return 0;
    }
  }
  return 0x3002;
}



// was FUN_00078e28 -- closes STRINGS.PAK and frees its index/data
// buffers (DAT_0024cfb8/DAT_0024cfa8). Byte-identical body to
// close_strings_pak_file_thunk (was close_strings_pak_file_thunk, above) -- same
// split-symbol/naming-collision pattern as this project's other
// thunk-duplicate pairs (this is the real function at this address;
// the other is a separate thunk elsewhere that happens to share the
// exact same compiled body, now collapsed to call this one).
void close_strings_pak_file()

{
  CloseHandle(DAT_0024bf98);
  LocalFree(DAT_0024cfb8);
  LocalFree(DAT_0024cfa8);
  return;
}





// was FUN_00078e60 -- decodes one string out of STRINGS.PAK: seeks
// the page's offset-table entry for param_1, finds param_2's
// sub-offset within that page's own sub-table, then reads
// compressed bytes one at a time via walk_strings_pak_huffman_tree (not yet named)
// until a terminator (-1 or '|') or the 0x200-byte cap, writing into
// the decoded-string ring buffer (DAT_0024af98, cycling through
// DAT_0024cfb4 -- see that global's own comment). Already widely
// referenced by this exact name throughout this codebase's existing
// comments describing the string-resource system. Confirmed real
// caller: get_message_string.
undefined1 *decode_strings_pak_entry(param_1,param_2)
short param_1;
short param_2;

{
  int iVar1;
  char cVar2;
  uint uVar3;
  ushort uVar4;
  uint uVar5;
  undefined1 *puVar6;
  ushort local_30;
  ushort local_2e;
  ushort local_2c;
  ushort local_2a;
  undefined4 local_28;
  
  uVar5 = 0;
  puVar6 = &DAT_0024af98 + DAT_0024cfb4;
  seek_file_handle(DAT_0024bf98,*DAT_0024cfb8 * 4 + 2,0);
  /* If this read fails (e.g. DAT_0024bf98 holds a corrupted/invalid
     handle -- see walk_strings_pak_huffman_tree's comment for the known separate bug
     this guards against), local_30 stays uninitialized garbage and the
     search loop below would iterate up to 65535 times, one failing
     read each, instead of the fast "not found" bailout every other
     failure path in this function already takes. */
  if (read_file_handle(DAT_0024bf98,&local_30,2) == 0) {
    *puVar6 = 0;
    return puVar6;
  }
  uVar4 = 0;
  if (local_30 != 0) {
    do {
      read_file_handle(DAT_0024bf98,&local_2c,2);
      if ((uint)local_2c == (int)param_1) break;
      seek_file_handle(DAT_0024bf98,4,1);
      uVar4 = uVar4 + 1;
    } while (uVar4 < local_30);
  }
  if (uVar4 != local_30) {
    read_file_handle(DAT_0024bf98,&local_28,4);
    seek_file_handle(DAT_0024bf98,local_28,0);
    read_file_handle(DAT_0024bf98,&local_2e,2);
    iVar1 = (int)param_2;
    if (iVar1 < (int)(uint)local_2e) {
      seek_file_handle(DAT_0024bf98,iVar1 << 1,1);
      read_file_handle(DAT_0024bf98,&local_2a,2);
      seek_file_handle(DAT_0024bf98,(((uint)local_2e - iVar1) + -1) * 2 + (uint)local_2a,1);
      DAT_000878bc = 8;
      do {
        cVar2 = walk_strings_pak_huffman_tree(DAT_0024bf98,*DAT_0024cfb8 + -1);
        uVar3 = uVar5 + 1;
        puVar6[uVar5] = cVar2;
        uVar5 = uVar3 & 0xffff;
        if ((cVar2 == -1) || (cVar2 == '|')) break;
      } while ((uVar3 & 0xffff) < 0x200);
      puVar6[(uVar3 & 0xffff) - 1] = 0;
      if ((DAT_0024cfb4 + 0x200) * 0x10000 >> 0x10 < 0x1000) {
        DAT_0024cfb4 = (short)(DAT_0024cfb4 + 0x200);
        return puVar6;
      }
      DAT_0024cfb4 = 0;
      return puVar6;
    }
  }
  *puVar6 = 0;
  return puVar6;
}



// was FUN_0007907c -- walks STRINGS.PAK's per-page Huffman-style
// decode tree (stored in DAT_0024cfa8, 4 bytes/node) one bit at a
// time (read_strings_pak_bit) starting from tree-node param_2, until
// reaching a leaf (terminator byte != -1), returning the decoded
// byte. Already had an existing comment documenting a real
// corrupted-file-handle infinite-loop guard already added here
// (bails out with the '|' separator sentinel after 256 tree steps
// instead of hanging forever). Confirmed real caller:
// decode_strings_pak_entry.
undefined1 walk_strings_pak_huffman_tree(param_1,param_2)
undefined4 param_1;
ushort param_2;

{
  short sVar1;
  /* Was `int iVar2`, truncating DAT_0024cfa8 (a real char* pointer). */
  char *iVar2;
  /* Guard against a known, separate, not-yet-root-caused bug: under
     some string IDs the compressed-string file handle this receives
     (traced back to DAT_0024bf98) ends up corrupted before reaching
     here, so every underlying file read fails and this tree walk never
     reaches a leaf node -- an unbounded busy loop that hangs the whole
     game (confirmed via lldb: uw_file_read spinning forever on a
     garbage handle). No real Huffman tree used by this format is
     anywhere near this deep, so treat exceeding it as corrupt/failed
     decode and bail out with the same separator sentinel a normal
     decode already uses to signal "stop appending". */
  int iVar3 = 0;
  while (*(char *)((short)param_2 * 4 + DAT_0024cfa8 + 2) != -1) {
    if (256 < iVar3) {
      return '|';
    }
    iVar3 = iVar3 + 1;
    sVar1 = read_strings_pak_bit(param_1);
    if (sVar1 == -1) {
      return '|';
    }
    iVar2 = (short)param_2 * 4 + DAT_0024cfa8;
    if (sVar1 == 0) {
      param_2 = (ushort)*(byte *)(iVar2 + 2);
    }
    else {
      param_2 = (ushort)*(byte *)(iVar2 + 3);
    }
  }
  return *(undefined1 *)(DAT_0024cfa8 + (short)param_2 * 4);
}



// was FUN_000790e0 -- reads one bit from STRINGS.PAK's compressed
// bitstream (DAT_0024cfbc, refilled from the file one byte at a time
// via DAT_000878bc as a bit-position counter), returning -1 instead
// of a 0/0x80 bit value on a file-read failure so
// walk_strings_pak_huffman_tree's caller can bail out immediately
// rather than spinning through its iteration cap one failed read at
// a time (already had an existing comment documenting this).
int read_strings_pak_bit(param_1)
undefined4 param_1;

{
  ushort uVar1;

  if (DAT_000878bc == 8) {
    if (read_file_handle(param_1,&DAT_0024cfbc,1) == 0) {
      return -1;
    }
    DAT_000878bc = 0;
  }
  uVar1 = DAT_0024cfbc & 0x80;
  DAT_0024cfbc = DAT_0024cfbc << 1;
  DAT_000878bc = DAT_000878bc + 1;
  return uVar1;
}


// was FUN_0007ee4c -- the mirror-image "read" counterpart to
// write_buffer_to_file: opens param_1 for read and reads param_3
// bytes into param_2, returning whether the full byte count was
// read. Widely used across uw.c and src/automap.c, src/chargen.c,
// src/game.c, src/graphics.c for various fixed-size resource/palette/
// bitmap loads (several call sites pass a fixed 64000 = 320*200,
// e.g. a full-screen 8bpp image).
bool read_buffer_from_file(param_1,param_2,param_3)
char *param_1;
void *param_2;
int param_3;

{
  int iVar1;
  int iVar2;
  bool bVar3;

  iVar1 = open_file_for_read(param_1);
  if (iVar1 == -1) {
    bVar3 = false;
  }
  else {
    iVar2 = read_file_handle(iVar1,param_2,param_3);
    bVar3 = iVar2 == param_3;
    CloseHandle(iVar1);
  }
  return bVar3;
}





// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* Forward declaration: g_grtile_real_ptrs is defined much further down
   (see its own comment there), but blit_grtile_to_framebuffer here -- much earlier in
   the file -- needs it to resolve a grtile registry key to the real
   pointer the key was only ever a truncated stand-in for. */
 void *g_grtile_real_ptrs[320];

// was FUN_00011c10 -- blits a captured grtile buffer (param_3, a
// registry key resolved via g_grtile_real_ptrs the same way
// capture_framebuffer_rect_to_grtile/restore_captured_grtile_backdrop
// do) into the framebuffer at (param_2,param_1), clipped against the
// screen edges (0x140x200) and honoring g_blit_transparent_mode (a
// zero source pixel is treated as transparent and skipped in that
// mode, copied verbatim otherwise). Confirmed live caller
// (src/player.c's stats-panel skill-row draw) uses this to restore
// the captured background rect behind a row before redrawing its
// text over it -- the third member of the capture/restore/blit trio
// documented together in src/resources.c.
void blit_grtile_to_framebuffer(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
ushort param_1;
int param_2;
int param_3;
short param_4;
short param_5;
short param_6;
short param_7;

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  short *psVar9;
  short sVar10;
  short sVar11;
  short sVar12;
  int iVar13;
  short local_30;
  /* Was `int local_2c = param_3 + ...` -- param_3 is
     grtile_alloc_registered's opaque truncated identity key, not a real
     pointer (same issue already fixed in capture_framebuffer_rect_to_grtile
     and restore_captured_grtile_backdrop, see their own comments -- blit_grtile_to_framebuffer was the one
     remaining consumer still dereferencing the key directly instead of
     resolving it through g_grtile_real_ptrs first). Crashed the instant
     the stats panel -- the only caller that reaches this with a real
     grtile key -- first tried to draw. */
  intptr_t local_2c;
  char *_resolvedGrtilePtr;
  {
    int _gi = 0;
    undefined4 *_gp = DAT_0023c3fc;
    _resolvedGrtilePtr = 0;
    while (_gi <= 0x13f) {
      if (param_3 == (int)*_gp) {
        _resolvedGrtilePtr = (char *)g_grtile_real_ptrs[_gi];
        break;
      }
      _gi = _gi + 1;
      _gp = (undefined4 *)((char *)_gp + 0x11);
    }
  }

  sVar10 = 0;
  iVar8 = (int)param_6;
  local_2c = (intptr_t)_resolvedGrtilePtr + ((int)param_7 * (int)param_5 + iVar8) * 2;
  iVar3 = ((int)param_4 - (int)param_7) * 0x10000 >> 0x10;
  local_30 = 0;
  iVar13 = (uint)param_1 << 0x10;
  iVar7 = iVar13 >> 0x10;
  if (iVar7 < 0) {
    iVar13 = iVar7 * -0x10000;
  }
  sVar11 = 0;
  if (iVar7 < 0) {
    sVar11 = (short)((uint)iVar13 >> 0x10);
  }
  iVar13 = (int)(short)param_2;
  if (iVar13 < 0) {
    local_30 = (short)((uint)(iVar13 * -0x10000) >> 0x10);
  }
  iVar1 = ((int)param_5 - (int)param_6) * 0x10000 >> 0x10;
  if (0x140 < iVar7 + iVar1) {
    sVar10 = param_1 + (short)((int)param_5 - (int)param_6) + -0x140;
  }
  iVar6 = iVar3 << 0x10;
  iVar5 = iVar6 >> 0x10;
  iVar2 = iVar13 + iVar5;
  if (200 < iVar2) {
    iVar6 = param_2 + iVar3;
  }
  sVar12 = 0;
  if (200 < iVar2) {
    sVar12 = (short)iVar6 + -200;
  }
  dirty_rect_union(iVar13,iVar2,iVar7);
  iVar3 = (int)local_30;
  if (g_blit_transparent_mode == 0) {
    iVar5 = iVar5 - sVar12;
    if (iVar3 < iVar5) {
      iVar6 = (int)sVar11;
      iVar2 = iVar1 * iVar3;
      iVar7 = (iVar13 + iVar3) * 0x140 + iVar7;
      iVar5 = iVar5 - iVar3;
      do {
        if (iVar6 < iVar1 - sVar10) {
          iVar13 = (iVar7 + iVar6) * 2;
          puVar4 = (undefined2 *)(local_2c + (iVar2 + iVar6) * 2);
          iVar3 = (iVar1 - sVar10) - iVar6;
          do {
            iVar3 = iVar3 + -1;
            *(undefined2 *)(iVar13 + (g_uw_framebuffer)) = *puVar4;
            puVar4 = puVar4 + 1;
            iVar13 = iVar13 + 2;
          } while (iVar3 != 0);
        }
        iVar5 = iVar5 + -1;
        iVar7 = iVar7 + 0x140;
        iVar2 = iVar1 + iVar2;
        local_2c = local_2c + iVar8 * 2;
      } while (iVar5 != 0);
    }
  }
  else {
    iVar5 = iVar5 - sVar12;
    if (iVar3 < iVar5) {
      iVar6 = (int)sVar11;
      iVar2 = iVar1 * iVar3;
      iVar5 = iVar5 - iVar3;
      iVar7 = (iVar13 + iVar3) * 0x140 + iVar7;
      do {
        if (iVar6 < iVar1 - sVar10) {
          psVar9 = (short *)(local_2c + (iVar2 + iVar6) * 2);
          iVar13 = iVar6;
          do {
            sVar11 = *psVar9;
            psVar9 = psVar9 + 1;
            if (sVar11 != 0) {
              *(short *)((g_uw_framebuffer) + (iVar7 + iVar13) * 2) =
                   sVar11;
            }
            iVar13 = iVar13 + 1;
          } while (iVar13 < iVar1 - sVar10);
        }
        iVar5 = iVar5 + -1;
        iVar2 = iVar1 + iVar2;
        iVar7 = iVar7 + 0x140;
        local_2c = local_2c + iVar8 * 2;
      } while (iVar5 != 0);
    }
  }
  debug_framebuffer_dump("blit_grtile_to_framebuffer");
  return;
}


// was FUN_000129f8 -- confirmed by decode_gr_entry_bitmap's own
// comment ("decompress_gr_bitmap's palette-shifted decompressor") and
// extensive investigation logged in object-rendering-findings.txt as
// the core .GR resource bitmap decompressor: param_1 is the
// compressed entry data, param_2 an auxiliary nibble->8bit palette
// remap table, and param_3 the entry's own compression-mode byte
// (0 = unsupported/returns NULL, 2/4/6/8/0xa are distinct bit-packed/
// RLE decode paths, several confirmed live via real .GR data during
// that investigation -- e.g. mode 8's RLE fill through
// decode_gr_rle_stream). Two confirmed real callers (decode_gr_entry_bitmap
// and decode_tile_object_billboard_texture) each independently had this exact "dropped
// compression-mode argument" bug found and fixed in an earlier
// session (see decode_gr_entry_bitmap's own HACK comment and
// object-rendering-findings.txt's "MILESTONE: objects render" entry).
byte *decompress_gr_bitmap(param_1,param_2,param_3)
byte * param_1;
byte * param_2;
char param_3;

{
  bool bVar1;
  byte bVar2;
  byte bVar3;
  byte *pbVar4;
  byte *pbVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  undefined4 uVar9;
  int iVar10;
  uint uVar11;
  
  pbVar5 = DAT_0024af7c;
  pbVar4 = DAT_0024af78;
  ce_memset(DAT_000842ac,10,0x20);
  DAT_000b4614 = DAT_0024fa2c;
  bVar2 = param_1[1];
  DAT_000b4618 = param_1;
  DAT_000b5630 = param_2;
  if (param_3 == '\0') {
LAB_000130d0:
    DAT_000b462c = (byte *)0x0;
  }
  else {
    if (param_3 == '\x02') {
      DAT_000b462c = param_1;
      return param_1;
    }
    DAT_000b462c = param_1;
    if (param_3 == '\x04') {
      select_gr_bitmap_remap_table(bVar2,4,param_2[1],*param_1 | 0xff00);
      DAT_000b462c = pbVar4;
      DAT_000b4628 = pbVar4;
      DAT_000b461c = pbVar4;
      DAT_000b5630 = DAT_000b4618 + 1;
      uVar6 = merge_byte_into_word(bVar2,*DAT_000b4618,0);
      bVar2 = *DAT_000b5630;
      DAT_000b5630 = DAT_000b5630 + 1;
      iVar10 = 0;
      do {
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        *DAT_000b461c = *(byte *)(DAT_000b4610 + (uint)bVar3);
        DAT_000b461c = DAT_000b461c + 1;
        bVar1 = iVar10 < (int)(uVar6 & 0xff | (uint)bVar2 << 8);
        iVar10 = iVar10 + 1;
      } while (bVar1);
      return DAT_000b462c;
    }
    if (param_3 == '\x06') {
      /* blit_sprite_row_remapped's 4th arg (a shade byte; 0xff means "no
         remap, plain copy") is never set by any of this function's 3 real
         ARM call sites either (confirmed via Ghidra disassembly at
         0x12aa0/0x12bf0/0x12d34 -- r3 genuinely isn't loaded before any
         of the 3 `bl 0x13170` calls). The real binary's r3 register
         happened to still hold a leftover value from earlier, unrelated
         code at that point; a C recompile has no equivalent "whatever's
         left in the register" state, so param_4 here was reading
         uninitialized garbage -- confirmed live via ASan: a
         heap-buffer-overflow in blit_sprite_row_remapped reading up to
         64KB past the 4096-byte LIGHT.DAT remap table (DAT_0024fa2c),
         since the garbage byte routinely wasn't the 0xff sentinel and so
         took the remap-table-index path with an unclamped shade value.
         Passing 0xff explicitly forces the same safe, table-free plain-
         copy path the callee already has for exactly this situation. */
      blit_sprite_row_remapped(bVar2,6,2,0xff);
      DAT_000b462c = pbVar4;
      DAT_000b4628 = pbVar4;
      DAT_000b461c = pbVar4;
      DAT_000b5630 = DAT_000b4618 + 1;
      uVar6 = merge_byte_into_word(bVar2,*DAT_000b4618,0);
      bVar2 = *DAT_000b5630;
      DAT_000b5630 = DAT_000b5630 + 1;
      uVar8 = uVar6 & 0xff | (uint)bVar2 << 8;
      uVar6 = (uVar8 + 7 & 0xffff) >> 3;
      uVar7 = 0;
      for (uVar11 = uVar6; uVar11 != 0; uVar11 = uVar11 - 1) {
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word(uVar6,bVar2,0);
        uVar6 = (uVar7 & 0xff) >> 3;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word((uVar7 & 0xff) << 0xd | uVar6,bVar2,0);
        uVar6 = (uVar7 & 0xff | ((uVar7 & 0xffff) >> 8 & 0xffe0) << 3) >> 6;
        *DAT_000b461c = (byte)uVar6;
        uVar6 = ((uVar7 & 0x3f) << 10 | uVar6) >> 3;
        DAT_000b461c = DAT_000b461c + 1;
        uVar9 = merge_byte_into_word(uVar6 & 0xff | (uVar6 & 0xff) << 8,(uVar7 & 0x3f) >> 1,0);
        *DAT_000b461c = (byte)uVar9;
        DAT_000b461c = DAT_000b461c + 1;
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word(uVar9,bVar2,0);
        uVar6 = (uVar7 & 0xff | ((uVar7 & 0xffff) >> 8 & 0xff80) << 1) >> 4;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word((uVar7 & 0xff) << 0xc | uVar6,bVar2,0);
        uVar6 = (uVar7 & 0xff | ((uVar7 & 0xffff) >> 8 & 0xfff0) << 4) >> 7;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        uVar6 = merge_byte_into_word((uVar7 & 0xff) << 9 | uVar6,0,0);
        uVar6 = (uVar6 & 0xffff) >> 0xb | (uVar6 & 0x7ff) << 5;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar6 = merge_byte_into_word(uVar6,bVar2,0);
        *DAT_000b461c = (byte)((uVar6 & 0xff | ((uVar6 & 0xffff) >> 8 & 0xffc0) << 2) >> 5);
        uVar6 = uVar6 & 0x1f;
        DAT_000b461c = DAT_000b461c + 1;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        uVar7 = uVar6;
      }
    }
    else {
      if (param_3 != '\b') {
        if (param_3 == '\n') {
          /* Same dropped-4th-arg / uninitialized-param_4 issue as this
             function's other blit_sprite_row_remapped call site -- see
             that comment (a few dozen lines up, the param_3=='\x06' case). */
          blit_sprite_row_remapped(bVar2,10,1,0xff);
          DAT_000b462c = pbVar4;
          DAT_000b4628 = pbVar4;
          DAT_000b461c = pbVar4;
          DAT_000b5630 = DAT_000b4618 + 1;
          uVar6 = merge_byte_into_word(bVar2,*DAT_000b4618,0);
          bVar2 = *DAT_000b5630;
          DAT_000b5630 = DAT_000b5630 + 1;
          uVar6 = uVar6 & 0xff | (uint)bVar2 << 8;
          uVar7 = uVar6;
          for (; uVar6 != 0; uVar6 = uVar6 - 1) {
            bVar2 = *DAT_000b5630;
            DAT_000b5630 = DAT_000b5630 + 1;
            uVar7 = merge_byte_into_word(uVar7,bVar2,0);
            uVar7 = merge_byte_into_word(uVar7 & 0xff | (uVar7 & 0xff) << 8,uVar7 & 0xf0,0);
            uVar7 = merge_byte_into_word(uVar7,(uVar7 & 0xff) >> 4,0);
            *DAT_000b461c = *(byte *)((uVar7 & 0xff) + DAT_000b4610);
            DAT_000b461c = DAT_000b461c + 1;
            uVar7 = merge_byte_into_word(uVar7,(uVar7 & 0xffff) >> 8,0);
            uVar7 = merge_byte_into_word(uVar7,uVar7 & 0xf,0);
            *DAT_000b461c = *(byte *)((uVar7 & 0xff) + DAT_000b4610);
            DAT_000b461c = DAT_000b461c + 1;
          }
          return DAT_000b462c;
        }
        goto LAB_000130d0;
      }
      /* Same dropped-4th-arg / uninitialized-param_4 issue as this
         function's other blit_sprite_row_remapped call site -- see that
         comment (the param_3=='\x06' case, above). */
      blit_sprite_row_remapped(bVar2,8,1,0xff);
      DAT_000b462c = pbVar4;
      DAT_000b4628 = pbVar4;
      DAT_000b461c = pbVar4;
      DAT_000b5630 = DAT_000b4618 + 1;
      uVar6 = merge_byte_into_word(bVar2,*DAT_000b4618,0);
      bVar2 = *DAT_000b5630;
      DAT_000b5630 = DAT_000b5630 + 1;
      uVar8 = uVar6 & 0xff | (uint)bVar2 << 8;
      uVar7 = 0;
      for (uVar6 = (uVar8 + 1 & 0xffff) >> 1; uVar6 != 0; uVar6 = uVar6 - 1) {
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word(CONCAT11(bVar2,bVar2),bVar2 & 0xf0,0);
        uVar7 = merge_byte_into_word(uVar7,(uVar7 & 0xff) >> 4,0);
        *DAT_000b461c = (byte)uVar7;
        DAT_000b461c = DAT_000b461c + 1;
        uVar7 = merge_byte_into_word(uVar7,(uVar7 & 0xffff) >> 8,0);
        uVar7 = merge_byte_into_word(uVar7,uVar7 & 0xf,0);
        *DAT_000b461c = (byte)uVar7;
        DAT_000b461c = DAT_000b461c + 1;
      }
    }
    DAT_000b4624 = pbVar4;
    DAT_000b5630 = pbVar4;
    DAT_000b4628 = pbVar5;
    DAT_000b461c = pbVar5;
    /* blit_sprite_row_remapped above resets DAT_000b4610 to the scratch
       DAT_000842ac (memset to 0x0a) on the way out, but decode_gr_rle_stream's RLE
       fill looks its run colours up through DAT_000b4610 -- for the RLE
       formats (6/8/0xa) that table is the auxiliary palette passed in
       param_2 (nibble -> 8-bit palette index). Ghidra dropped the setup;
       point it there so the sprite decodes to real colours instead of a
       flat 0x0a. */
    DAT_000b4610 = (byte *)param_2;
    decode_gr_rle_stream(uVar7,param_3,uVar8);
    DAT_000b462c = DAT_000b4628;
  }
  return DAT_000b462c;
}





// was FUN_000130e0 -- merges param_2's own low byte into either the
// low half (param_3==0, keeping param_1's high byte) or high half
// (param_3!=0, keeping param_1's low byte) of param_1's 16-bit value.
// Confirmed heavily used by decompress_gr_bitmap's bit-packed/RLE
// decode paths as a byte-pair merge primitive.
uint merge_byte_into_word(param_1,param_2,param_3)
uint param_1;
uint param_2;
int param_3;

{
  uint uVar1;
  
  if (param_3 == 0) {
    uVar1 = param_1 & 0xff00 | param_2 & 0xff;
  }
  else {
    uVar1 = param_1 & 0xff | (param_2 & 0xff) << 8;
  }
  return uVar1;
}





// was FUN_00013108 -- decompress_gr_bitmap's own private setup
// helper (its only confirmed caller, inside that function's mode-4
// branch): computes a table-row offset from param_2 (optionally
// overridden by param_4's high byte, unless that byte is the 0xff
// "no override" sentinel) and points the shared remap-table pointer
// (DAT_000b4610/DAT_000b4624) at DAT_000b4614 plus that offset.
void select_gr_bitmap_remap_table(param_1,param_2,param_3,param_4)
undefined4 param_1;
uint param_2;
undefined4 param_3;
uint param_4;

{
  uint uVar1;
  
  uVar1 = (param_4 & 0xffff) >> 8;
  if (uVar1 != 0xff) {
    param_2 = param_2 & 0xff | uVar1 << 8;
  }
  uVar1 = merge_byte_into_word(param_2,0,0);
  DAT_000b4610 = DAT_000b4614 + (uVar1 & 0xffff);
  DAT_000b4624 = DAT_000b4610;
  return;
}


// was FUN_000132c4 -- confirmed by decompress_gr_bitmap's own
// pre-existing comment ("this function's RLE fill looks its run
// colours up through DAT_000b4610") as the RLE-stream decoder behind
// decompress_gr_bitmap's mode 6/8/0xa branches: reads a run-length/
// tag-coded byte stream from the shared cursor (DAT_000b5630) and
// writes resolved palette bytes (via DAT_000b4610, the shared
// remap-table pointer select_gr_bitmap_remap_table sets up) into the
// output cursor (DAT_000b461c), up to param_3 bytes of input.
void decode_gr_rle_stream(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
uint param_3;

{
  bool bVar1;
  undefined1 uVar2;
  byte bVar3;
  bool bVar4;
  byte *pbVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  uint uVar9;
  byte *pbVar10;
  uint uVar11;
  
  bVar4 = false;
  DAT_000b4618 = DAT_000b5630 + (param_3 & 0xffff);
  pbVar10 = DAT_000b5630;
  uVar9 = 0;
LAB_000132fc:
  do {
    if (pbVar10 < DAT_000b4618) {
      DAT_000b5630 = pbVar10 + 1;
      uVar11 = merge_byte_into_word(0,*pbVar10,0);
      uVar8 = uVar11 & 0xff;
      if (2 < uVar8) {
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar2 = *(undefined1 *)(DAT_000b4610 + (uint)bVar3);
        iVar7 = 0;
        do {
          pbVar10 = DAT_000b5630;
          if ((int)(uVar11 & 0xffff) <= iVar7) goto LAB_00013530;
          iVar7 = iVar7 + 1;
          *DAT_000b461c = uVar2;
          DAT_000b461c = DAT_000b461c + 1;
        } while( true );
      }
      if (uVar8 != 2) {
        pbVar10 = DAT_000b5630;
        if (uVar8 == 1) goto LAB_00013530;
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar11 = merge_byte_into_word(uVar11,bVar3,0);
        if ((uVar11 & 0xff) != 0) {
          uVar11 = (uVar11 & 0x7ff) << 4;
          bVar3 = *DAT_000b5630;
          DAT_000b5630 = DAT_000b5630 + 1;
          uVar8 = merge_byte_into_word(uVar11,bVar3,0);
          bVar3 = *DAT_000b5630;
          DAT_000b5630 = DAT_000b5630 + 1;
          uVar6 = merge_byte_into_word(uVar8,bVar3,0);
          uVar2 = *(undefined1 *)(DAT_000b4610 + (uVar6 & 0xffff));
          uVar11 = uVar8 & 0xffff | uVar11;
          pbVar10 = DAT_000b5630;
          do {
            DAT_000b5630 = pbVar10;
            if (uVar11 == 0) goto LAB_00013530;
            uVar11 = uVar11 - 1;
            *DAT_000b461c = uVar2;
            DAT_000b461c = DAT_000b461c + 1;
            pbVar10 = DAT_000b5630;
          } while( true );
        }
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar11 = merge_byte_into_word((uint)bVar3 << 4,(uint)bVar3 << 4 & 0xff | (uint)*DAT_000b5630,0);
        uVar11 = merge_byte_into_word((uVar11 & 0x7ff) << 4,(uint)DAT_000b5630[1] | (uVar11 & 0xf) << 4,0);
        uVar11 = merge_byte_into_word((uVar11 & 0x7ff) << 4,(uint)DAT_000b5630[2] | (uVar11 & 0xf) << 4,0);
        pbVar10 = DAT_000b5630 + 3;
        DAT_000b5630 = DAT_000b5630 + 4;
        uVar8 = merge_byte_into_word(uVar11,*pbVar10,0);
        uVar2 = *(undefined1 *)((uVar8 & 0xff) + DAT_000b4610);
        uVar11 = uVar11 & 0xffff;
        pbVar10 = DAT_000b5630;
        do {
          DAT_000b5630 = pbVar10;
          if (uVar11 == 0) goto LAB_00013530;
          uVar11 = uVar11 - 1;
          *DAT_000b461c = uVar2;
          DAT_000b461c = DAT_000b461c + 1;
          pbVar10 = DAT_000b5630;
        } while( true );
      }
      bVar4 = true;
      uVar9 = (uint)*DAT_000b5630;
      pbVar10 = DAT_000b5630 + 1;
      pbVar5 = pbVar10;
      if (uVar9 == 0) {
        bVar3 = *pbVar10;
        pbVar5 = DAT_000b5630 + 2;
        if (bVar3 == 0) {
          DAT_000b5630 = DAT_000b5630 + 3;
          uVar9 = (uint)*pbVar5 << 4;
          uVar9 = merge_byte_into_word(uVar9,uVar9 & 0xff | (uint)*DAT_000b5630,0);
          uVar9 = merge_byte_into_word((uVar9 & 0x7ff) << 4,(uint)DAT_000b5630[1] | (uVar9 & 0xf) << 4,0);
          uVar9 = merge_byte_into_word((uVar9 & 0x7ff) << 4,(uint)DAT_000b5630[2] | (uVar9 & 0xf) << 4,0);
          pbVar10 = DAT_000b5630 + 3;
          uVar9 = uVar9 & 0xffff;
          pbVar5 = pbVar10;
        }
        else {
          pbVar10 = DAT_000b5630 + 3;
          uVar9 = (uint)*pbVar5 | (uint)bVar3 << 4;
          pbVar5 = pbVar10;
        }
      }
    }
    else {
      pbVar5 = DAT_000b5630;
      if ((int)uVar9 < 1) {
        return;
      }
    }
    do {
      DAT_000b5630 = pbVar5;
      uVar11 = uVar9 - 1;
      bVar1 = 0 < (int)uVar9;
      uVar9 = uVar11;
      if (bVar1) goto LAB_000132fc;
      bVar4 = false;
LAB_00013530:
      pbVar5 = DAT_000b5630;
    } while (bVar4);
    uVar11 = (uint)*pbVar10;
    DAT_000b5630 = pbVar10 + 1;
    if (uVar11 == 0) {
      DAT_000b5630 = pbVar10 + 2;
      uVar11 = merge_byte_into_word(0,pbVar10[1],0);
      if ((uVar11 & 0xff) == 0) {
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar11 = merge_byte_into_word((uint)bVar3 << 4,(uint)bVar3 << 4 & 0xff | (uint)*DAT_000b5630,0);
        uVar11 = merge_byte_into_word((uVar11 & 0x7ff) << 4,(uint)DAT_000b5630[1] | (uVar11 & 0xf) << 4,0);
        uVar11 = merge_byte_into_word((uVar11 & 0x7ff) << 4,(uint)DAT_000b5630[2] | (uVar11 & 0xf) << 4,0);
        uVar11 = uVar11 & 0xff;
        DAT_000b5630 = DAT_000b5630 + 3;
      }
      else {
        uVar11 = (uVar11 & 0x7ff) << 4;
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar8 = merge_byte_into_word(uVar11,bVar3,0);
        uVar11 = uVar8 & 0xffff | uVar11;
      }
    }
    for (; pbVar10 = DAT_000b5630, DAT_000b5630 = pbVar10, uVar11 != 0; uVar11 = uVar11 - 1) {
      DAT_000b5630 = pbVar10 + 1;
      *DAT_000b461c = *(undefined1 *)(DAT_000b4610 + (uint)*pbVar10);
      DAT_000b461c = DAT_000b461c + 1;
    }
  } while( true );
}


// was FUN_00041260 -- called from open_gr_resource_file (src/resources.c:110)
// only for format-type-3 .GR files, right after the frame count
// (DAT_00202728) is read and before the main offset table: reads a
// separate count (DAT_00202724) and either skips past that many
// 32-byte entries (if no destination buffer DAT_00202720 was set) or
// allocates and loads them. Reads as an optional extra metadata table
// specific to format-3 resource files.
undefined4 load_gr_format3_extra_table()

{
  int iVar1;
  undefined4 uVar2;

  iVar1 = read_file_handle(DAT_00202514,&DAT_00202724,1);
  if (iVar1 == 1) {
    if (*DAT_00202720 == 0) {
      seek_file_handle(DAT_00202514,(uint)DAT_00202724 << 5,1);
    }
    else {
      iVar1 = ce_malloc((uint)DAT_00202724 << 5);
      *DAT_00202720 = iVar1;
      iVar1 = read_file_handle(DAT_00202514,*DAT_00202720,(uint)DAT_00202724 << 5);
      if (iVar1 != (uint)DAT_00202724 * 0x20) goto LAB_000412d8;
    }
    uVar2 = 1;
  }
  else {
LAB_000412d8:
    uVar2 = 0;
  }
  return uVar2;
}



// was FUN_000414c8 -- closes the .GR resource file opened by
// open_gr_resource_file and frees its offset table, mirroring that
// function's open.
void close_gr_resource_file()

{
  CloseHandle(DAT_00202514);
  if (DAT_0020274c != 0) {
    LocalFree();
  }
  return;
}



// was FUN_000414f4 -- reads one .GR resource record by index (param_1)
// into param_2, using the offset table open_gr_resource_file loaded to
// compute the record's file offset and size.
uint read_gr_resource_record(param_1,param_2)
uint param_1;
void *param_2;

{
  int *piVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  
  param_1 = param_1 & 0xffff;
  if (param_1 == (ushort)DAT_00202728 - 1) {
    iVar2 = seek_file_handle(DAT_00202514,0,2);
    iVar5 = *(int *)(DAT_0020274c + param_1 * 4);
    uVar6 = iVar2 - iVar5;
  }
  else {
    piVar1 = (int *)(DAT_0020274c + param_1 * 4);
    iVar5 = *piVar1;
    uVar6 = piVar1[1] - iVar5;
  }
  iVar5 = seek_file_handle(DAT_00202514,iVar5,0);
  if (iVar5 == -1) {
    uVar4 = 0xffffffff;
  }
  else {
    uVar6 = uVar6 & 0xffff;
    if (uVar6 == 0) {
      uVar4 = 0;
    }
    else {
      uVar3 = read_file_handle(DAT_00202514,param_2,uVar6);
      uVar4 = 0xffffffff;
      if (uVar3 == uVar6) {
        uVar4 = uVar6;
      }
    }
  }
  return uVar4;
}


// was FUN_00041708 -- load_gr_resource_entries's post-process callback
// for the flasks/compass/etc. resource group (passed as its param_5 at
// uw.c's "hud_icon_gr_bump_alloc_entry"-paired call site): allocates a fresh grtile
// buffer sized from the entry's own width/height header bytes, copies
// the decoded data in, and registers it at
// g_grtile_registry[DAT_00202744 + entry_index]. Same registration
// shape as uw_register_gr_entry, for a resource group that already had
// a real (not stubbed) registrar.
bool register_grtile_entry(param_1,param_2,param_3)
void *param_1;
undefined4 param_2;
short param_3;

{
  void *pvVar1;

  /* param_1 (a real buffer pointer, from load_gr_resource_entries's allocator
     callback) was declared int here and silently truncated to 32 bits on
     dereference -- see uw_alloc_grtile()'s comment for why this uses that
     helper instead of grtile_alloc_registered directly. g_grtile_registry is
     a flat pointer array -- see its declaration comment. */
  pvVar1 = uw_alloc_grtile(*(undefined1 *)((char *)param_1 + 1),*(byte *)((char *)param_1 + 2) + 1);
  if (pvVar1 != 0) {
    ce_memmove(pvVar1,param_1,(uint)*(byte *)((char *)param_1 + 2) * (uint)*(byte *)((char *)param_1 + 1));
    g_grtile_registry[(uint)DAT_00202744 + (int)param_3] = pvVar1;
  }
  return pvVar1 != 0;
}



// was FUN_00041770 -- register_grtile_entry's "slot may already be
// populated" sibling, used for reload paths (e.g. the save/load menu's
// level reload): always allocates a FRESH buffer sized for this write
// rather than reusing/overwriting whatever the slot already points to
// (fixed heap-buffer-overflow -- see this function's own body comment).
undefined4 reregister_grtile_entry(param_1,param_2,param_3)
void *param_1;
undefined4 param_2;
short param_3;

{
  /* See register_grtile_entry -- same param_1/g_grtile_registry truncation fix.
     This "overwrite an already-allocated slot" path blindly memcpy'd
     width*height bytes into whatever pointer g_grtile_registry's table
     already held for this slot -- fine as long as that's still the SAME
     size it was originally allocated at, but nothing guarantees that:
     confirmed via AddressSanitizer, a real heap-buffer-overflow, 100%
     reproducible opening the in-game options/pause menu and picking
     Save or Load. The existing 888-byte allocation there came from an
     unrelated resource loaded into this same slot at startup
     (app_main_loop's initial preload); the save/load menu's own level
     reload (load_player_save_record -> reload_paperdoll_body_sprite -> ... -> here) later reuses
     the slot for a bigger (2484-byte) one, overflowing it. Rather than
     assume the existing allocation is still big enough, allocate a
     fresh one sized for THIS write (same sizing register_grtile_entry uses for
     a brand new slot) and replace the table pointer -- the old
     allocation leaks, but that beats corrupting the heap. */
  void *pvVar1 = uw_alloc_grtile(*(byte *)((char *)param_1 + 1),
                                  (uint)*(byte *)((char *)param_1 + 2) + 1);
  if (pvVar1 == 0) {
    return 0;
  }
  ce_memmove(pvVar1,param_1,
               (uint)*(byte *)((char *)param_1 + 2) * (uint)*(byte *)((char *)param_1 + 1));
  g_grtile_registry[(uint)DAT_00202744 + (int)param_3] = pvVar1;
  return 1;
}


// was FUN_00041910 -- the generic .GR resource-group loader: registers
// every entry at the running absolute-frame cursor DAT_00202744 (via
// register_gr_group_entry -> uw_register_gr_entry) then advances the cursor by
// the file's own entry count. Used for most of the startup preload
// chain (QUESTION/VIEWS/ANIMO/BUTTONS/CURSORS/3DWIN/TMOBJ and friends)
// -- everything except OBJECTS.GR (load_objects_gr, which doesn't
// advance the cursor) and the flasks/compass HUD icon group
// (load_hud_icon_gr, which registers via register_grtile_entry
// instead).
undefined4 load_gr_resource_group(param_1)
char *param_1;

{
  undefined4 uVar1;
  short _dbg_before;
  _dbg_before = DAT_00202744;
  uVar1 = load_gr_resource_entries(param_1,0,0xffffffff,&gr_resource_bump_alloc_entry,&register_gr_group_entry);
  DAT_00202744 = (short)DAT_00202728 + DAT_00202744;
  if (getenv("UW_DEBUG_DUMP_GR")) {
    fprintf(stderr, "[dumpgr] load_gr_resource_group(\"%s\") frames [%d, %d) count=%d ok=%d\n",
            param_1, (int)_dbg_before, (int)DAT_00202744, (int)DAT_00202728, (int)uVar1);
  }
  return uVar1;
}



// was FUN_00041960 -- loads OBJECTS.GR specifically: registers each
// entry at absolute cursor 0 (register_objects_gr_entry) rather than the running
// DAT_00202744 cursor, and does NOT advance it -- OBJECTS.GR occupies
// the absolute [0, entry_count) frame range (frame N == object type
// N), with the running cursor reset to 0x1c0 by the next load in the
// preload chain.
undefined4 load_objects_gr(param_1)
char *param_1;

{
  return load_gr_resource_entries(param_1,0,0xffffffff,&gr_resource_bump_alloc_entry,&register_objects_gr_entry);
}



// was FUN_00041990
undefined4 load_tmflat_gr(param_1,param_2,param_3)
char *param_1;
undefined2 param_2;
undefined4 param_3;

{
  DAT_000859a8 = param_2;
  return load_gr_resource_entries(param_1,0,param_3,&gr_resource_bump_alloc_entry,&register_tmflat_gr_entry);
}



// was FUN_000419c8 -- loads a HUD icon .GR resource (flasks, compass,
// dragons, power, eyes, chains, spells, scroll-edge, etc.) by
// registering each entry via register_grtile_entry rather than
// uw_register_gr_entry, otherwise identical in shape to
// load_gr_resource_group (same running-cursor advance/debug dump).
undefined4 load_hud_icon_gr(param_1)
char *param_1;

{
  /* Ghidra dropped load_gr_resource_entries's result and always returned failure
     (see select_default_hud_font for the same pattern); propagate the real result. */
  undefined4 uVar1;
  short _dbg_before;
  _dbg_before = DAT_00202744;
  uVar1 = load_gr_resource_entries(param_1,0,0xffffffff,&hud_icon_gr_bump_alloc_entry,register_grtile_entry);
  DAT_00202744 = (short)DAT_00202728 + DAT_00202744;
  if (getenv("UW_DEBUG_DUMP_GR")) {
    fprintf(stderr, "[dumpgr] load_hud_icon_gr(\"%s\") frames [%d, %d) count=%d ok=%d\n",
            param_1, (int)_dbg_before, (int)DAT_00202744, (int)DAT_00202728, (int)uVar1);
  }
  return uVar1;
}



// was FUN_00041a18 -- reloads a SINGLE .GR entry (count=1) into its
// existing grtile slot via reregister_grtile_entry, temporarily
// repointing the running cursor DAT_00202744 at the entry's own
// absolute frame (derived from param_1, a symbolic sprite id >= 0x2000)
// for the one call, then restoring it. Used for live reloads of a
// single already-loaded sprite (e.g. a paperdoll body entry) without
// disturbing the rest of the preload chain's frame numbering.
void reload_single_grtile_entry(param_1,param_2,param_3)
short param_1;
/* Was `undefined4`, truncating the real resource-name string pointer
   callers pass (e.g. reload_paperdoll_body_sprite's s_bodies_00085c58) before it reaches
   load_gr_resource_entries's own `char *param_1`, which then crashed dereferencing
   it. Same pointer-truncation class as everywhere else this session. */
char *param_2;
undefined4 param_3;

{
  undefined2 uVar1;

  uVar1 = DAT_00202744;
  DAT_00202744 = DAT_00202738 + param_1 + -0x2000;
  load_gr_resource_entries(param_2,param_3,1,&hud_icon_gr_bump_alloc_entry,reregister_grtile_entry);
  DAT_00202744 = uVar1;
  return;
}



/* Was `load_gr_resource_entries(...); return 0;` -- a dropped return
   value (same class as FUN_00045054/get_scanned_object_class_effect_ptr
   elsewhere this session): load_gr_resource_entries has a real `uint`
   return (used directly by its other callers, e.g. FUN_00041a4c/
   FUN_00041a90's own `return load_gr_resource_entries(...)`), but this
   wrapper discarded it and always reported success. Harmless at
   redraw_hud_panels's own call site (doesn't check the return value),
   but begin_hud_panel_flip/redraw_active_hud_panel both DO check it, and with
   the hardcoded 0 they always took their "decode failed" error branch
   -- confirmed live once alloc_flip_grtile_slot/resolve_flip_grtile_slot
   stopped being stubs and this path actually ran for the first time. */
// was FUN_00041a78 -- decodes a single .GR entry directly into a
// caller-supplied destination buffer (param_3, stashed in DAT_00202510
// and consumed by uw_copy_gr_entry_to_dest) rather than registering it
// in g_grtile_registry. No registry involvement at all; purely a
// "decode this one resource entry into my own buffer" helper.
undefined4 decode_gr_entry_to_buffer(param_1,param_2,param_3)
char *param_1;
undefined4 param_2;
void *param_3;

{
  DAT_00202510 = param_3;
  /* Was a hardcoded `0` (no post-process callback) -- see
     uw_copy_gr_entry_to_dest's own comment: without a real callback
     here, load_gr_resource_entries decodes into its own throwaway
     buffer and DAT_00202510 (this function's whole reason for
     existing) is never actually consulted, so this decode always
     reported success while leaving the caller's destination buffer
     untouched. */
  return load_gr_resource_entries(param_1,param_2,1,&decode_gr_entry_bump_alloc_entry,&uw_copy_gr_entry_to_dest);
}


// was FUN_0002295c -- a Win32 LoadString-shaped resource-string
// loader: loads string resource param_1 into a fixed static buffer
// and returns its address. Confirmed as "LoadString-shaped" by an
// existing comment on win_file_exists, one of its callers.
// BUG FIX (unit-testing-framework merge): param_1 was `undefined4`
// (32-bit), but every real call site across this project (saveload.c,
// registration.c, game.c, winfile_wrappers.c) passes a real stack/path
// pointer, which got truncated to 32 bits storing into this narrower
// parameter, then zero-extended back into MultiByteToWideChar's `const char
// *source` as a garbage pointer -- confirmed live (EXC_BAD_ACCESS in
// MultiByteToWideChar's strlen, called from check_save_disk_space, crashing
// every single regression script at startup). Widened to a real
// pointer type, matching this project's other pointer-truncation fixes.
undefined *load_string_resource(param_1)
char * param_1;

{
  MultiByteToWideChar(0,2,param_1,0xffffffff,&DAT_000fb650,0xff);
  return &DAT_000fb650;
}



// was FUN_00022998 -- structurally identical to load_string_resource
// but via a different ordinal (WideCharToMultiByte, two extra trailing
// arguments) and a larger buffer (0x260 vs 0xff) -- likely a longer-
// message variant of the same LoadString-shaped resource loader.
// BUG FIX (unit-testing-framework merge): same pointer-truncation class
// as load_string_resource's own fix just above.
undefined *load_string_resource_large(param_1)
char * param_1;

{
  WideCharToMultiByte(0,0x260,param_1,0xffffffff,&DAT_000fb550,0xff,0,0);
  return &DAT_000fb550;
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
  ce_strcat(acStack_420,s__DATA_pals_dat_00085978);
  uVar4 = open_file_for_read(acStack_420);
  seek_file_handle(uVar4,(short)param_1 * 0x300,0);
  sVar2 = read_file_handle(uVar4,param_2,0x300);
  CloseHandle(uVar4);
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
     from DAT_00202308 (0=never tried, else=a real ce_malloc pointer
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
    ce_strcat(stack0xffdc3238_buf, &DAT_00085920);
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
    pbVar11 = (byte *)ce_malloc(0x7fff);
    (&DAT_00202308)[iVar1] = pbVar11;
    read_file_handle(iVar5,pbVar11,0x7fff);
    CloseHandle(iVar5);
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


void load_light_food_effect_tables(param_1)
undefined4 param_1;

{
  read_file_handle(param_1,&g_carry_weight_limit_table,0x30);
  read_file_handle(param_1,&g_light_radius_table,0x20);
  read_file_handle(param_1,&g_food_effect_table,0x10);
  return;
}


void *gr_resource_bump_alloc_entry(param_1)
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
  return ce_malloc(param_1);
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
undefined4 register_gr_group_entry(void *buf, unsigned size, int idx)
{
  /* Caller load_gr_resource_group loads at the running cursor DAT_00202744 and
     advances it by the file's entry count afterwards. */
  (void)size;
  uw_register_gr_entry((unsigned)DAT_00202744, buf, idx);
  return 1;
}
undefined4 register_objects_gr_entry(void *buf, unsigned size, int idx)
{
  /* Caller load_objects_gr (OBJECTS.GR) -- does not advance the cursor; the
     next file resets DAT_00202744 to 0x1c0, so OBJECTS.GR occupies the
     absolute [0, entry_count) range (frame N == object type N). */
  (void)size;
  uw_register_gr_entry(0, buf, idx);
  return 1;
}
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
void *hud_icon_gr_bump_alloc_entry(param_1)
unsigned int param_1;

{
  /* Allocator callback, same role as gr_resource_bump_alloc_entry -- see there. Used by
     load_hud_icon_gr/reload_single_grtile_entry (flasks/compass/dragons/power/chains/
     spells/scrledge and friends). */
  return ce_malloc(param_1);
}
void *decode_gr_entry_bump_alloc_entry(param_1)
unsigned int param_1;

{
  /* Allocator callback, same role as gr_resource_bump_alloc_entry -- see there. Used by
     decode_gr_entry_to_buffer, which passes no post-process callback (param_5 == 0). */
  return ce_malloc(param_1);
}
/* Not decompiled -- decode_gr_entry_to_buffer's post-process callback. Ghidra never
   recovered a real one here (it hardcoded param_5=0, "no callback"),
   but that leaves load_gr_resource_entries's freshly-decoded buffer
   completely unreachable: it's malloc'd fresh by decode_gr_entry_bump_alloc_entry, never
   registered anywhere (unlike every sibling load_gr_resource_entries
   call site, which DOES pass a real post-process callback to register
   its buffer into g_grtile_registry[] -- see register_gr_group_entry/register_objects_gr_entry/
   register_tmflat_gr_entry), and then simply discarded once load_gr_resource_entries's
   loop moves on. Confirmed live: begin_hud_panel_flip's decode calls reported
   success while leaving their destination grtile buffer entirely
   zeroed (0/9462 nonzero bytes), which is exactly what "decode
   succeeds but the caller's buffer is never touched" looks like. Since
   decode_gr_entry_to_buffer stashes its REAL destination in DAT_00202510 (see that
   global's own comment) specifically to route around the missing
   callback, the callback this decode always needed is simply "copy the
   decoded bytes there" -- same leak-the-temporary-allocation posture
   as LocalFree's own documented precedent (freeing a possibly-
   garbage pointer is worse than a short-lived leak). */
unsigned int uw_copy_gr_entry_to_dest(void *buf, unsigned int size, int idx)
{
  (void)idx;
  if (DAT_00202510 != 0) {
    memcpy(DAT_00202510, buf, size);
  }
  return 1;
}
