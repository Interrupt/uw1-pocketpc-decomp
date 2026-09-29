/* Graphics resource loading: .GR bitmap decode, resource-file open,
 * the "flip grtile" screen-flip capture slots, and door-frame
 * loading. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/resources.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_000409f8 -- decodes a raw (still-compressed) .GR entry
// buffer into a real bitmap: entries whose own header byte is 4 are
// already stored raw (just skip the 5-byte header), anything else
// goes through FUN_000129f8's palette-shifted decompressor. Same
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
       this file for this identical FUN_000129f8 call shape (see
       object-rendering-findings.txt's "MILESTONE: objects render").
       Without it, FUN_000129f8 took its param_3==0 path and returned
       NULL for every weapon-swing frame, so weapon_swing_draw_tick's
       blit never actually ran despite resolving a real frame pointer
       and correct width/height. Confirmed live via UW_DEBUG_COMBAT. */
    param_1 = (char *)FUN_000129f8(param_1 + 4,&DAT_00202520 + (uint)(byte)param_1[3] * 0x10,*param_1);
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
    Ordinal_1063(local_114,s__DATA__00085970);
    Ordinal_1063(local_114,param_1);
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
      Ordinal_1063(local_114, ".GR");
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
       (((uVar1 != 3 || (iVar3 = FUN_00041260(), iVar3 != 0)) &&
        (DAT_0020274c = Ordinal_1041(((ushort)DAT_00202728 + 1) * 4), DAT_0020274c != 0)))) {
      iVar3 = read_file_handle(DAT_00202514,DAT_0020274c,((ushort)DAT_00202728 + 1) * 4);
      if (iVar3 == ((ushort)DAT_00202728 + 1) * 4) {
        return 1;
      }
      Ordinal_1018(DAT_0020274c);
      DAT_0020274c = 0;
    }
    Ordinal_553(DAT_00202514);
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
       the decoded buffer into FUN_000408fc's DAT_0024e090[] pointer
       table, so every door frame stayed permanently unresolved (0x0
       width/height, drawing nothing). LAB_000415d0 (FUN_00041910/
       QUESTION-VIEWS-etc.'s own registrar) already does exactly what's
       needed here: register at the running cursor DAT_00202744, which
       this loop already manages by hand the same way FUN_00041910's
       caller does. */
    uint _ok = load_gr_resource_entries(s_doors_00085a64,(&DAT_0023b840)[iVar3],1,&alloc_door_frame_buffer,&LAB_000415d0);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] load_door_frames: loading doors[%d] slot=%d -> DAT_00202744=%d ok=%u\n",
              iVar3, (int)(&DAT_0023b840)[iVar3], (int)DAT_00202744, _ok);
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    DAT_00202744 = DAT_00202744 + 1;
  } while (iVar3 < 6);
  DAT_00202744 = uVar1;
  DAT_00202748 = uVar2;
  FUN_0007ec1c();
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
   capture_framebuffer_rect_to_grtile/restore_captured_grtile_backdrop/FUN_00011c10) rather
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
     capture_framebuffer_rect_to_grtile/restore_captured_grtile_backdrop/FUN_00011c10:
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
     need the real, dereferenceable pointer (FUN_00041708, feeding a
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
  uVar1 = Ordinal_1041(iVar3);
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
  Ordinal_1047(uVar1,0,iVar3);
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
  /* FUN_00041708 needs a real, dereferenceable pointer (it memmoves into
     the result) rather than grtile_alloc_registered's opaque truncated handle -- see
     the comment there. Same size computation, no registration into
     grtile_alloc_registered's own DAT_0023c3fc identity-key table since nothing
     ever looks buffers from this call path up that way (see
     FUN_00041708). */
  unsigned int size;
  void *p;
  size = (param_1 & 0xffff) * (param_2 & 0xffff);
  p = Ordinal_1041(size);
  if (p != 0) {
    Ordinal_1047(p,0,size);
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
  DAT_0023c3fc = Ordinal_1041(0x1540);
  if (DAT_0023c3fc != 0) {
    Ordinal_1047(DAT_0023c3fc,0,0x1540);
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
// get_message_string's/what's documented as FUN_0007873c's own indexing) to
// an empty/sentinel state (DAT_0024bfa0/1 = 0xffff, the page-id
// short field; DAT_0024c7a2/3 and the 512-entry DAT_0024bfa2/3/4/5
// sub-arrays zeroed), then calls FUN_00078d18 (not yet named) and,
// conditionally, FUN_0003c3b4 -- likely a "load the default/startup
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
  sVar2 = FUN_00078d18();
  if (sVar2 != 0) {
    FUN_0003c3b4();
  }
  return 1;
}



void thunk_FUN_00078e28()

{
  Ordinal_553(DAT_0024bf98);
  Ordinal_1018(DAT_0024cfb8);
  Ordinal_1018(DAT_0024cfa8);
  return;
}





// was FUN_0007863c -- the core message-string lookup used throughout
// this game: param_1 packs a page number (bits 9+) and a sub-index
// within that page (low 9 bits). Searches the string-resource cache
// (DAT_0024bfa0-family) for the page; if not yet cached, decodes it
// via FUN_00078e60 (not yet named) and returns the string directly;
// if already cached, returns the pointer from the real-pointer side
// table (g_bfa2_real_ptrs). ~130 call sites throughout this codebase.
//
// Was `undefined4` return -- truncating the real char* string pointer
// FUN_00078e60 returns (and the string pointers stored in the
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
    /* Was `FUN_00078e60(uVar1)` -- called with only one explicit
       argument, relying on a register-leftover idiom for the second
       (the "dropped argument" pattern used throughout this file, e.g.
       Ordinal_1068/draw_text_string earlier this session) to still hold
       the string's sub-index within this page. That register doesn't
       reliably survive here either (confirmed: string lookups that
       should succeed -- e.g. chargen field labels -- came back as
       genuinely empty strings, because FUN_00078e60's own `iVar1 <
       local_2e` bounds check saw garbage and fell straight through to
       its "not found" empty-string return). param_1's low 9 bits are
       exactly this sub-index (uVar1 above is `param_1 >> 9`, the page
       number) -- pass it explicitly instead. */
    uVar2 = (char *)FUN_00078e60(uVar1,(uint)(param_1 & 0x1ff));
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
