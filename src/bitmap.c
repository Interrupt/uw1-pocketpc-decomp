/* Sprite blitting and the sprite-list system: raw/remapped sprite
 * blitting, sprite-by-id drawing, and the sprite list's own entry
 * allocation/positioning/lifetime management (the moving-object-
 * overlay renderer used for HUD icons, thrown/dropped items, and
 * other transient sprites). Split out of uw.c (the original
 * monolithic decompile) once these functions' real roles were
 * confirmed.
 */
#include "headers/bitmap.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

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
/* Was `undefined4`, silently 0 -- a link-time-initialized pointer
   constant this decompile never writes (holds 0xb45f0 in UU.exe, i.e.
   the address of a 0x20-byte sprite-row scratch buffer). Confirmed via
   Ghidra: 3 refs, all reads, in blit_sprite_row_remapped/decompress_gr_bitmap, plus the
   `.data` word at 0x842ac literally being 0xb45f0. As NULL it made
   `ce_memset(DAT_000842ac, 10, 0x20)` memset through address 0 and
   the blit write past it. Backed by a real (over-sized) buffer. */
 undefined1 DAT_000842ac_backing[4096];
char *DAT_000b4614;
byte *DAT_000b5630;
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
/* Was `static undefined DAT_000859fc_backing[8192]` -- real bytes
   spell "lfti\0", matching LFTI.GR. See s_optb_000859ac's comment.
   This is the one loaded right after TMOBJ.GR -- the resource the
   mode-icon highlight (mode_icon_highlight_on/mode_icon_highlight_off) actually indexes
   into. */
char s_lfti_000859fc[] = "lfti";
/* DAT_00086a18 and DAT_00086a20 are now offsets into DAT_00086a00_region
   (real bytes recovered from UU.exe) -- see its definition further down. */
// Was a lone `int` scalar but used throughout the renderer as a pointer to a
// ~0x2e-byte "current view" record (screen-space player x/y/z/facing, written
// by update_current_view_from_subject from DAT_00204880/82/84 + DAT_00201c70, then read all over
// the tile/sprite projection code). Never populated with a real address in
// this decompile, so give it real backing storage like the other
// lone-scalar-used-as-array globals found this session (DAT_000fb880-family).
 undefined1 DAT_00086e6c_backing[64];
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
char *DAT_0023c3e4;
undefined2 DAT_0023c41c;
static ushort DAT_0023c400;
static short DAT_0023c3f4;






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_000125a8 -- lowest-level raw (already-decoded, uncompressed)
// sprite blit primitive: draws a pre-decoded pixel buffer (param_3,
// the "absolute frame table" entry's payload, header already
// skipped by the caller) at (param_1,param_2) sized (param_4,param_5)
// with edge clipping against the framebuffer bounds. Used by
// blit_object_sprite_by_frame's absolute-frame-table branch and by
// sprite_list_flush_blit_raw.
void blit_raw_sprite_clipped(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
short param_1;
short param_2;
/* Source-bitmap pointer -- was `int`, truncating the real `char *` the
   caller (blit_object_sprite_by_frame) already reconstructed (iVar4 + 5). Same
   bitmap_blit_to_framebuffer-shaped sprite blit, same pointer-truncation
   class as everywhere else this session. */
char *param_3;
short param_4;
short param_5;
short param_6;
short param_7;

{
  short sVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  int iVar11;
  short sVar12;
  int iVar13;
  int iVar14;
  short local_3c;
  short local_38;
  short local_34;
  
  iVar13 = (int)param_6;
  sVar1 = (short)((uint)((param_5 - iVar13) * 0x10000) >> 0x10);
  local_38 = 0;
  sVar12 = 0;
  local_3c = 0;
  iVar14 = (int)param_1;
  if (iVar14 < 0) {
    local_38 = (short)((uint)(iVar14 * -0x10000) >> 0x10);
  }
  iVar6 = (int)param_2;
  if (iVar6 < 0) {
    local_3c = (short)((uint)(iVar6 * -0x10000) >> 0x10);
  }
  iVar2 = (int)sVar1;
  if (0x140 < iVar14 + iVar2) {
    sVar12 = param_1 + sVar1 + -0x140;
  }
  sVar1 = (short)((uint)(((int)param_4 - (int)param_7) * 0x10000) >> 0x10);
  iVar3 = (int)sVar1;
  if (iVar6 + iVar3 < 0xc9) {
    local_34 = 0;
  }
  else {
    local_34 = param_2 + sVar1 + -200;
  }
  param_3 = param_7 * iVar2 + iVar13 + param_3;
  /* Same missing-4th-argument K&R-call bug as bitmap_blit_to_framebuffer's
     own dirty_rect_union call (see graphics.c's fix comment) -- this is
     the more directly relevant instance for inventory icons specifically:
     this function draws every "already-resident raw sprite" (grid item
     icons and the container-indicator icon both resolve through here via
     blit_object_sprite_by_frame's own DAT_00202738 threshold branch, per
     that function's own comment). Missing the "right" bound left the
     accumulated dirty rect not reliably covering a freshly-drawn icon's
     actual width, so only a smaller stale sub-rect got flushed -- this is
     the direct cause of "redraw areas don't match the actual inventory
     button sizes" (confirmed live: first-time sack pickup and container-
     close icon redraws both go through this exact call). */
  if (getenv("UW_DEBUG_BLITRAW")) {
    fprintf(stderr, "[blitraw] dstX=%d dstY=%d w=%d h=%d -> dirty top=%d bottom=%d left=%d right=%d\n",
            (int)param_1, (int)param_2, (int)iVar2, (int)iVar3,
            iVar6, iVar6 + iVar3, iVar14, iVar14 + iVar2);
  }
  dirty_rect_union(iVar6,iVar6 + iVar3,iVar14,iVar14 + iVar2);
  if (g_blit_transparent_mode == 0) {
    iVar11 = (int)local_3c;
    iVar4 = iVar3 - local_34;
    if (iVar11 < iVar4) {
      iVar7 = (int)local_38;
      iVar8 = iVar2 * iVar11;
      iVar14 = (iVar6 + iVar11) * 0x140 + iVar14;
      do {
        if (iVar7 < iVar2 - sVar12) {
          iVar5 = iVar8 + iVar7;
          iVar6 = (iVar14 + iVar7) * 2;
          iVar10 = iVar7;
          do {
            *(undefined2 *)(iVar6 + (g_uw_framebuffer)) =
                 (&g_palette_rgb565)[*(byte *)(iVar5 + param_3)];
            if (iVar3 * iVar2 + -5 < iVar5) {
              return;
            }
            iVar10 = iVar10 + 1;
            iVar6 = iVar6 + 2;
            iVar5 = iVar5 + 1;
          } while (iVar10 < iVar2 - sVar12);
        }
        iVar11 = iVar11 + 1;
        iVar14 = iVar14 + 0x140;
        param_3 = iVar13 + param_3;
        iVar8 = iVar2 + iVar8;
      } while (iVar11 < iVar4);
    }
  }
  else {
    iVar4 = (int)local_3c;
    iVar11 = iVar3 - local_34;
    if (iVar4 < iVar11) {
      iVar8 = (int)local_38;
      iVar7 = iVar2 * iVar4;
      iVar14 = (iVar6 + iVar4) * 0x140 + iVar14;
      do {
        if (iVar8 < iVar2 - sVar12) {
          iVar10 = iVar7 + iVar8;
          iVar6 = iVar8;
          do {
            uVar9 = (uint)*(byte *)(iVar2 * iVar4 + param_3 + iVar6);
            if (uVar9 != 0) {
              *(undefined2 *)((g_uw_framebuffer) + (iVar14 + iVar6) * 2)
                   = (&g_palette_rgb565)[uVar9];
            }
            if (iVar3 * iVar2 + -5 < iVar10) {
              return;
            }
            iVar6 = iVar6 + 1;
            iVar10 = iVar10 + 1;
          } while (iVar6 < iVar2 - sVar12);
        }
        iVar4 = iVar4 + 1;
        iVar7 = iVar2 + iVar7;
        param_3 = iVar13 + param_3;
        iVar14 = iVar14 + 0x140;
      } while (iVar4 < iVar11);
    }
  }
  debug_framebuffer_dump("blit_raw_sprite_clipped");
  return;
}




// was FUN_00013170
void blit_sprite_row_remapped(param_1,param_2,param_3,param_4)
undefined4 param_1;
uint param_2;
uint param_3;
uint param_4;

{
  byte bVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  
  uVar3 = (param_4 & 0xffff) >> 8;
  DAT_000b461c = DAT_000842ac;
  DAT_000b4628 = DAT_000842ac;
  if (uVar3 == 0xff) {
    uVar3 = (param_3 & 0xfff) * 0x10;
    uVar2 = param_3 & 0xfff;
    while (uVar2 != 0) {
      *DAT_000b461c = *DAT_000b5630;
      DAT_000b461c = DAT_000b461c + 1;
      DAT_000b5630 = DAT_000b5630 + 1;
      uVar3 = uVar3 - 1;
      uVar2 = uVar3;
    }
  }
  else {
    uVar3 = merge_byte_into_word(param_2 & 0xff | uVar3 << 8,0,0);
    DAT_000b4610 = (byte *)(DAT_000b4614 + (uVar3 & 0xffff));
    for (param_3 = param_3 & 0xffff; param_3 != 0; param_3 = param_3 - 1) {
      iVar4 = 0x10;
      do {
        iVar4 = iVar4 + -1;
        bVar1 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        *DAT_000b461c = *(byte *)((char *)DAT_000b4610 + (uint)bVar1);
        DAT_000b461c = DAT_000b461c + 1;
      } while (iVar4 != 0);
    }
  }
  DAT_000b4610 = DAT_000842ac;
  return;
}




void blit_object_sprite_by_frame(param_1,param_2,param_3)
short param_1;
undefined4 param_2;
undefined4 param_3;

{
  char cVar1;
  char cVar2;
  char *pcVar3;
  char *iVar4;

  /* g_grtile_registry is a flat pointer array -- see its declaration
     comment; iVar4 is dereferenced as a pointer below (iVar4+5, matching
     the pcVar3+5 idiom in the branch right above it), so it's retyped
     from int to char* rather than truncated through a 4-byte read. */
  iVar4 = (char *)g_grtile_registry[param_1];
  if (getenv("UW_DEBUG_MODEICON"))
    fprintf(stderr, "[modeicon] blit_object_sprite_by_frame: resolved_frame=%d DAT_00202738=%d slot_ptr=%p branch=%s\n",
            (int)param_1, (int)(uint)DAT_00202738, (void *)iVar4,
            (int)param_1 < (int)(uint)DAT_00202738 ? "registered-resource(lookup_grtile_by_id)" : "absolute-frame-table(g_grtile_registry)");
  if (iVar4 == (char *)0x0) {
    /* Table slot never populated. This used to be caused by 4 .GR
       resource names in the preload sequence around SCRLEDGE.GR
       (LFTI/INV/EYES/OPTB, see s_lfti_000859fc's own comment) reading
       as empty strings and silently corrupting the running frame
       counter for everything loaded after each one -- now fixed (both
       the string recovery and the underlying counter-corruption bug
       in load_gr_resource_entries). Kept as a defensive fallback for
       any other still-unpopulated slot: draw nothing rather than
       dereferencing NULL and taking the game down mid-message. Same
       safe-fallback shape as lookup_grtile_by_id. */
    static char dummy_sprite[8];
    iVar4 = dummy_sprite;
  }
  if ((int)param_1 < (int)(uint)DAT_00202738) {
    /* argument dropped by Ghidra here; param_1 matches the lookup right above */
    pcVar3 = (char *)lookup_grtile_by_id(param_1);
    if (pcVar3 != (char *)0x0) {
      cVar1 = pcVar3[1];
      cVar2 = pcVar3[2];
      if (getenv("UW_DEBUG_INV"))
        fprintf(stderr, "[inv] blit_object_sprite_by_frame real sprite size: frame=%d w(cVar2)=%d h(cVar1)=%d at x=%d y=%d\n",
                (int)param_1, (int)(unsigned char)cVar2, (int)(unsigned char)cVar1,
                (int)(short)(intptr_t)param_2, (int)(short)(intptr_t)param_3);
      if (*pcVar3 == '\x04') {
        pcVar3 = pcVar3 + 5;
      }
      else {
        /* Same dropped 3rd argument (the .GR entry's compression mode,
           6/8/0xa) already root-caused and fixed in decode_tile_object_billboard_texture's
           identical call (see object-rendering-findings.txt's
           "MILESTONE: objects render" section) -- without it,
           decompress_gr_bitmap takes its param_3==0 path, which for this call
           site returns NULL instead of an all-transparent buffer
           (unlike decode_tile_object_billboard_texture's case), and the caller here has no
           NULL-guard on the result -- confirmed live: picking up the
           starting sack and calling attach_picked_up_object_to_cursor to attach it to the
           cursor crashed here with a NULL source pointer reaching
           bitmap_blit_to_framebuffer. */
        pcVar3 = (char *)decompress_gr_bitmap(pcVar3 + 4,&DAT_00202520 + (uint)(byte)pcVar3[3] * 0x10,*pcVar3);
      }
      bitmap_blit_to_framebuffer(param_2,param_3,pcVar3,cVar2,cVar1,0,0,0);
    }
  }
  else {
    blit_raw_sprite_clipped(param_2,param_3,iVar4 + 5,*(undefined1 *)(iVar4 + 2),*(undefined1 *)(iVar4 + 1),0,0
                 ,0);
  }
  return;
}




// was FUN_00040b0c
void draw_sprite_by_id(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;
short param_5;

{
  bool bVar1;
  undefined4 uVar2;
  
  dirty_rect_union((int)(short)param_3,(int)(short)param_3 + (int)(short)param_4,(int)(short)param_2,
               (int)(short)param_2 + (int)param_5);
  if (((short)param_1 < 0x101b) || (0x101e < (short)param_1)) {
    bVar1 = false;
  }
  else {
    bVar1 = true;
    g_blit_transparent_mode = 1;
  }
  uVar2 = resolve_sprite_id_to_frame(param_1);
  blit_object_sprite_by_frame(uVar2,param_2,param_3,param_4,param_5);
  if (bVar1) {
    g_blit_transparent_mode = 0;
  }
  return;
}




// was FUN_00040be0 -- the sprite-list compositor flush loop's second
// draw path ("path=FUN_00040be0" in UW_DIAG_SPRLIST output, taken for
// entries with puVar4[5]!=0), a sibling of draw_sprite_by_id: resolves
// param_1 via resolve_sprite_id_to_frame then blits straight through
// blit_raw_sprite_clipped, skipping draw_sprite_by_id's own id-range
// transparent-mode toggle.
void sprite_list_flush_blit_raw(param_1,param_2,param_3,param_4,param_5,param_6)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
short param_4;
undefined2 param_5;
short param_6;

{
  short sVar1;

  /* Dropped argument (confirmed via disassembly of 0x40be0: `bl
     0x40aa8` executes before this function's prologue ever touches
     r0, so the real ARM code passes this function's own param_1
     through to resolve_sprite_id_to_frame via register reuse -- same idiom already
     fixed for the identical pair of calls in the sibling function
     draw_hud_icon_sprite, just missed here). Without it, sVar1 came from
     whatever register was left over from an unrelated recent call,
     resolving to a stale/wrong slot in the absolute-frame table
     (g_grtile_registry) -- e.g. showing whatever sprite (a door, etc.) had
     most recently been decoded into that slot, matching this
     project's established "mode icon draws a door sprite" bug
     pattern, just via a different dropped call site. */
  sVar1 = resolve_sprite_id_to_frame(param_1);
  /* g_grtile_registry is a flat pointer array -- see its declaration
     comment; mirrors the iVar4+5 idiom in blit_object_sprite_by_frame. */
  {
    static char dummy_sprite[8];
    char *spr = (char *)g_grtile_registry[sVar1];
    if (spr == (char *)0x0) spr = dummy_sprite;  /* unregistered slot -- see blit_object_sprite_by_frame */
    blit_raw_sprite_clipped(param_2,param_3,spr + 5,
                 ((int)param_4 + (int)param_6) * 0x10000 >> 0x10,param_5,0,param_6,1);
  }
  return;
}




// was FUN_00064f10
void sprite_partition_step(param_1,param_2,param_3,param_4,param_5,param_6)
int param_1;
short * param_2;
short param_3;
short param_4;
short param_5;
short param_6;

{
  int iVar1;
  ushort uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  short local_34 [4];
  
  if (param_1 == 0) {
    local_34[2] = 1;
    local_34[1] = param_4 + -1;
    sVar4 = 0;
    local_34[3] = 0xffff;
  }
  else {
    local_34[2] = 0xffff;
    local_34[1] = 0;
    local_34[3] = 1;
    sVar4 = param_4 + -1;
  }
  local_34[0] = sVar4;
  iVar5 = 0;
  if (0 < param_4) {
    do {
      iVar1 = (int)(short)iVar5;
      if (iVar1 != param_3) {
        if (param_6 == 0) {
          char *_o = (char *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[iVar1]);
          uVar2 = *(byte *)(_o + 2) & 0x7f;   /* was `int iVar3` -- truncated the object pointer */
        }
        else {
          uVar2 = (ushort)(char)(&DAT_0023bb98)[(int)param_6 + iVar1 * 4];
        }
        sVar4 = local_34[(short)(ushort)(param_5 < (short)uVar2)];
        (&DAT_0023b8c8)[sVar4] = (char)iVar5;
        local_34[(short)(ushort)(param_5 < (short)uVar2)] =
             local_34[(short)(ushort)(param_5 < (short)uVar2) + 2] + sVar4;
        sVar4 = local_34[0];
      }
      iVar1 = (iVar1 + 1) * 0x10000;
      iVar5 = iVar1 >> 0x10;
    } while ((short)((uint)iVar1 >> 0x10) < param_4);
  }
  if ((int)sVar4 == (int)local_34[1]) {
    *param_2 = sVar4;
    (&DAT_0023b8c8)[sVar4] = (char)param_3;
  }
  return;
}



// was FUN_0006508c
void sprite_partition_tmap(param_1,param_2,param_3)
undefined4 param_1;
short *param_2;   /* was undefined4 -- sprite_partition_step writes through it (*param_2 = ...) */
undefined4 param_3;

{
  char *_o;
  byte bVar2;

  _o = (char *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[(short)param_1]);  /* was `int iVar1` */
  bVar2 = *(byte *)(_o + 2) & 0x7f;
  sprite_partition_step((*(byte *)((char *)g_player_object + 2) & 0x7f) < bVar2,param_2,param_1,param_3,bVar2,0);
  return;
}



// was FUN_00065128
void sprite_partition_by_depth(param_1,param_2,param_3)
undefined4 param_1;
short *param_2;   /* was undefined4 -- sprite_partition_step dereferences it (*param_2 = ...) */
undefined4 param_3;

{
  int iVar1;
  char cVar2;
  undefined2 uVar3;
  short sVar4;
  char *_o;   /* was `int iVar5` -- truncated the get_object_record_by_slot_index object pointer */
  undefined4 uVar6;
  short sVar7;
  undefined2 uVar8;

  _o = (char *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[(short)param_1]);
  iVar1 = (short)param_1 * 4;
  if (((*(ushort *)(_o + 2) >> 7) + DAT_0023b4a0 * -2 & 3) == 0) {
    uVar3 = 2;
    sVar4 = (short)(char)(&DAT_0023bb9a)[iVar1];
LAB_000651b0:
    sVar7 = sVar4;
    uVar8 = uVar3;
    uVar6 = 1;
  }
  else {
    uVar8 = 1;
    cVar2 = (&DAT_0023bb99)[iVar1];
    sVar7 = (short)cVar2;
    if (DAT_0023bb94 != '\x02') {
      uVar3 = 1;
      sVar4 = (short)cVar2;
      if (DAT_0023bb94 == '\x01') goto LAB_000651b0;
      uVar6 = 1;
      if (g_current_view->view_x >> 5 < (short)cVar2) goto LAB_000651ec;
    }
    uVar6 = 0;
  }
LAB_000651ec:
  sprite_partition_step(uVar6,param_2,param_1,param_3,sVar7,uVar8);
  return;
}




// was FUN_00075cb8 -- part of the sprite-list compositor family
// (alongside sprite_list_set_rect/set_position/set_frame_id* and
// sprite_list_set_lifetime, all indexing the same DAT_0023c3e8 slot-
// record array). Every one of those setters calls this once they're
// done, passing the slot index -- it walks the compositor's spatial
// dirty-region buckets, registers the slot (and any other slot whose
// bounding box overlaps it) into whichever buckets its own bounding
// box falls in, and sets DAT_0023c41c (a "compositor has dirty work"
// flag some outer flush loop checks). Already extensively documented
// at its own call sites as "queues the sprite in the compositor" --
// this definition just gives that a real name to match.
void sprite_list_queue_slot_redraw(param_1)
ushort param_1;

{
  uint uVar1;
  ushort *puVar2;
  /* Was `int`, truncating `slot*0x14 + DAT_0023c3e8` -- DAT_0023c3e8 is
     the real 64-bit sprite-list record heap block -- and every deref
     below (`*(ushort *)(iVar3 + 2)` .. `+ 0xc`) then read a bounding box
     out of a wild address, so the "which dirty-region buckets does this
     sprite overlap" test in the sprite-list compositor's helper failed
     and no dragon/compass sprite ever got queued for drawing (or, on a
     different heap layout, got queued opaque garbage -- the "black
     rectangle" over the HUD). Same pointer-truncation class as the rest
     of this compositor (sprite_list_set_rect / sprite_list_set_lifetime). */
  char *iVar3;
  uint uVar4;
  ushort *puVar5;
  ushort uVar6;
  ushort *puVar7;
  ushort *puVar8;
  short sVar9;
  uint uVar10;
  
  uVar1 = (uint)param_1;
  DAT_0023c41c = 1;
  puVar5 = (ushort *)(uVar1 * 0x14 + DAT_0023c3e8);
  puVar2 = (ushort *)(DAT_0023c40c + (uint)puVar5[6] * 0x40);
  puVar7 = puVar2;
  for (uVar6 = *puVar2; puVar7 = puVar7 + 1, uVar6 != 0; uVar6 = uVar6 - 1) {
    if (*puVar7 == uVar1) goto LAB_00075d78;
  }
  *puVar2 = *puVar2 + 1;
  *puVar7 = param_1;
LAB_00075d78:
  puVar2 = (ushort *)(DAT_0023c3e4 + (uint)puVar5[6] * 0x40);
  uVar6 = *puVar2;
  uVar10 = (uint)uVar6 << 0x10;
  puVar7 = puVar2;
  do {
    puVar8 = puVar7 + 1;
    if (uVar10 >> 0x10 == 0) {
      if ((*puVar5 & DAT_0008763c) != 0) {
        *puVar2 = uVar6 + 1;
        *puVar8 = param_1;
      }
LAB_00075e04:
      uVar10 = (puVar5[6] + 1) * 0x20;
      uVar4 = (puVar5[6] + 1 & 0x7ff) << 5;
      DAT_0023c400 = (ushort)uVar10;
      sVar9 = DAT_0023c3f4;
      do {
        if (0x7f < uVar4) {
          DAT_0023c3f4 = sVar9;
          return;
        }
        DAT_0023c3f4 = *(short *)(DAT_0023c3e4 + uVar4 * 2);
        if (DAT_0023c3f4 != 0) {
          do {
            iVar3 = (uint)*(ushort *)(DAT_0023c3e4 + uVar4 * 2 + 2) * 0x14 + DAT_0023c3e8;
            if ((*(ushort *)(iVar3 + 2) <= (ushort)(puVar5[3] + puVar5[1])) &&
               (puVar5[1] <= (ushort)(*(short *)(iVar3 + 6) + *(ushort *)(iVar3 + 2)))) {
              if ((*(ushort *)(iVar3 + 4) <= (ushort)(puVar5[4] + puVar5[2])) &&
                 (puVar5[2] <= (ushort)(*(short *)(iVar3 + 8) + *(ushort *)(iVar3 + 4)))) {
                uVar4 = (uint)*(ushort *)(iVar3 + 0xc);
                puVar2 = (ushort *)(DAT_0023c40c + uVar4 * 0x40);
                puVar7 = puVar2;
                for (uVar6 = *puVar2; puVar7 = puVar7 + 1, uVar6 != 0; uVar6 = uVar6 - 1) {
                  if (*puVar7 == uVar1) goto LAB_00076038;
                }
                *puVar2 = *puVar2 + 1;
                *puVar7 = param_1;
                uVar10 = (uint)DAT_0023c400;
              }
            }
LAB_00076038:
            sVar9 = DAT_0023c3f4 + -1;
            DAT_0023c3f4 = 0;
          } while (sVar9 == 0);
        }
        DAT_0023c3f4 = sVar9;
        uVar10 = uVar10 + 0x20;
        uVar4 = uVar10 & 0xffff;
        DAT_0023c400 = (ushort)uVar10;
        sVar9 = DAT_0023c3f4;
      } while( true );
    }
    if (*puVar8 == uVar1) {
      if ((*puVar5 & DAT_0008763c) == 0) {
        *puVar7 = puVar2[uVar6];
        if (*puVar2 != 0) {
          *puVar2 = *puVar2 - 1;
        }
      }
      goto LAB_00075e04;
    }
    uVar10 = ((uVar10 >> 0x10) + 0xffff) * 0x10000;
    puVar7 = puVar8;
  } while( true );
}



// was FUN_00076078 -- allocates a new sprite-list compositor slot
// (linear scan of DAT_0023c3e8's fixed 0x40-entry array for a free
// record, matching sprite_list_set_rect/set_position's own `param_1 <
// 0x40` bound), stores param_1 as the slot's resource/frame id, zeroes
// its remaining fields, and returns the new slot's index via
// ordint_divmod(0x14,...) (byte offset / 0x14-byte record stride ==
// slot index). Returns -1 if the pool is full. Compare
// sprite_list_alloc_raw_entry (was sprite_list_alloc_raw_entry) which does the same
// but also attaches a freshly allocated raw pixel buffer instead of
// just a resource id.
int sprite_list_alloc_entry(param_1)
undefined4 param_1;

{
  ushort uVar1;
  uint uVar2;
  short sVar3;
  ushort *puVar4;
  uint uVar5;
  bool bVar6;
  
  puVar4 = DAT_0023c3e8;
  while( true ) {
    if (DAT_0023c3ec <= puVar4) {
      return -1;
    }
    if ((DAT_00087638 & *puVar4) == 0) break;
    puVar4 = puVar4 + 10;
  }
  uVar1 = DAT_00087640 | DAT_00087638;
  *(char *)puVar4 = (char)uVar1;
  *(char *)((char *)puVar4 + 1) = (char)(uVar1 >> 8);
  bVar6 = g_blit_transparent_mode != 0;
  uVar5 = (uint)uVar1;
  uVar2 = 0;
  if (bVar6) {
    uVar5 = (uint)DAT_00087648;
    uVar2 = (uint)uVar1;
  }
  *(char *)(puVar4 + 6) = (char)param_1;
  if (bVar6) {
    *(char *)puVar4 = (char)(uVar2 | uVar5);
    *(char *)((char *)puVar4 + 1) = (char)((uVar2 | uVar5) >> 8);
  }
  *(char *)((char *)puVar4 + 0xd) = (char)((uint)param_1 >> 8);
  *(undefined1 *)(puVar4 + 8) = 0;
  *(undefined1 *)((char *)puVar4 + 0x11) = 0;
  *(undefined1 *)(puVar4 + 9) = 0;
  *(undefined1 *)((char *)puVar4 + 0x13) = 0;
  *(undefined1 *)(puVar4 + 5) = 0;
  *(undefined1 *)((char *)puVar4 + 0xb) = 0;
  sVar3 = ordint_divmod(0x14,(int)puVar4 - (int)DAT_0023c3e8).quot;
  return (int)sVar3;
}



// was FUN_00076194 -- sibling of sprite_list_alloc_entry: allocates a
// new compositor slot the same way, but also allocates a fresh raw
// pixel buffer for it (via grtile_alloc_registered, param_2 x param_3*2 bytes,
// same grtile-style scratch-buffer allocator uw_alloc_grtile shares)
// instead of just storing a resource id. Used for the dragon head/body
// decorations (redraw_hud_panels), which need their own writable
// backing buffer rather than pointing at a static .GR resource frame.
int sprite_list_alloc_raw_entry(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
int param_3;

{
  ushort uVar1;
  short sVar2;
  int iVar3;
  undefined1 uVar4;
  ushort *puVar5;
  bool bVar6;
  
  puVar5 = DAT_0023c3e8;
  while( true ) {
    if (DAT_0023c3ec <= puVar5) {
      return -1;
    }
    if ((DAT_00087638 & *puVar5) == 0) break;
    puVar5 = puVar5 + 10;
  }
  uVar1 = DAT_00087640 | DAT_00087638;
  *(char *)puVar5 = (char)uVar1;
  *(char *)((char *)puVar5 + 1) = (char)(uVar1 >> 8);
  bVar6 = g_blit_transparent_mode != 0;
  uVar4 = 0;
  if (bVar6) {
    uVar4 = (undefined1)((uVar1 | DAT_00087648) >> 8);
    *(char *)puVar5 = (char)(uVar1 | DAT_00087648);
  }
  if (bVar6) {
    *(undefined1 *)((char *)puVar5 + 1) = uVar4;
  }
  iVar3 = grtile_alloc_registered(param_2,param_3 << 1);
  if (iVar3 == 0) {
    return -1;
  }
  *(char *)(puVar5 + 8) = (char)iVar3;
  *(char *)((char *)puVar5 + 0xd) = (char)((uint)param_1 >> 8);
  *(char *)((char *)puVar5 + 0x11) = (char)((uint)iVar3 >> 8);
  *(char *)(puVar5 + 6) = (char)param_1;
  *(char *)(puVar5 + 9) = (char)((uint)iVar3 >> 0x10);
  *(char *)((char *)puVar5 + 0x13) = (char)((uint)iVar3 >> 0x18);
  *(undefined1 *)(puVar5 + 5) = 0;
  *(undefined1 *)((char *)puVar5 + 0xb) = 0;
  sVar2 = ordint_divmod(0x14,(int)puVar5 - (int)DAT_0023c3e8).quot;
  return (int)sVar2;
}



// was FUN_000762c4 -- sets a compositor slot's full geometry (x, y, w,
// h) in one call, used at creation time (redraw_hud_panels calls this
// right after allocating each dragon/compass/status-icon slot to
// establish its rect). Compare sprite_list_set_position, which only
// updates x/y for an already-sized slot during animation.
undefined4 sprite_list_set_rect(param_1,param_2,param_3,param_4,param_5)
short param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;
undefined2 param_5;

{
  undefined4 uVar1;
  /* Was `int`, truncating the real DAT_0023c3e8 slot-record pointer
     computed here (same bug as its sibling functions sprite_list_set_position and
     sprite_list_set_lifetime below, which compute the identical expression). */
  char * iVar2;

  if (param_1 < 0x40) {
    iVar2 = param_1 * 0x14 + DAT_0023c3e8;
    if (getenv("UW_DEBUG_SPRPOS")) {
      fprintf(stderr, "[sprpos] sprite_list_set_rect create: slot=%d x=%d y=%d w=%d h=%d\n",
              (int)param_1, (int)param_2, (int)param_3, (int)param_4, (int)param_5);
    }
    *(char *)(iVar2 + 6) = (char)param_4;
    *(char *)(iVar2 + 7) = (char)((uint)param_4 >> 8);
    *(char *)(iVar2 + 2) = (char)param_2;
    *(char *)(iVar2 + 8) = (char)param_5;
    *(char *)(iVar2 + 4) = (char)param_3;
    *(char *)(iVar2 + 3) = (char)((uint)param_2 >> 8);
    *(char *)(iVar2 + 5) = (char)((uint)param_3 >> 8);
    *(char *)(iVar2 + 9) = (char)((ushort)param_5 >> 8);
    sprite_list_queue_slot_redraw((ushort)param_1);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar1 = 0;
  }
  else {
    uVar1 = 0xffffffff;
  }
  return uVar1;
}



// was FUN_00076338 -- updates an already-allocated compositor slot's
// x/y position only (its width/height, set once by sprite_list_set_rect,
// are left alone). Called every tick by hud_compass_needle_tick to
// move the needle sprite through its 16-heading ellipse. Like its
// sibling setters below, only bounds-checks `param_1 < 0x40` -- a
// negative/corrupted slot handle would bypass that and compute a wild
// pointer into DAT_0023c3e8.
undefined4 sprite_list_set_position(param_1,param_2,param_3)
short param_1;
undefined4 param_2;
undefined4 param_3;

{
  undefined4 uVar1;
  char * iVar2;

  if (param_1 < 0x40) {
    iVar2 = param_1 * 0x14 + DAT_0023c3e8;
    if (getenv("UW_DEBUG_SPRPOS")) {
      fprintf(stderr, "[sprpos] sprite_list_set_position slot=%d x=%d y=%d\n", (int)param_1, (int)param_2, (int)param_3);
    }
    *(char *)(iVar2 + 2) = (char)param_2;
    *(char *)(iVar2 + 4) = (char)param_3;
    *(char *)(iVar2 + 3) = (char)((uint)param_2 >> 8);
    *(char *)(iVar2 + 5) = (char)((uint)param_3 >> 8);
    sprite_list_queue_slot_redraw((ushort)param_1);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar1 = 0;
  }
  else {
    uVar1 = 0xffffffff;
  }
  return uVar1;
}



// was FUN_00076390 -- updates an already-allocated compositor slot's
// displayed sprite/frame id (offset+7/+0xf, separate from whatever
// resource id sprite_list_alloc_entry stored at creation) and ORs
// DAT_0008763c into the slot's flags word to mark it dirty. Called
// every tick by hud_compass_needle_tick to advance the needle/compass-
// rose frame ids. Compare sprite_list_set_frame_id_transparent, the
// same operation but also forcing DAT_00087648 (a transparent-blit
// flag, matching sprite_list_alloc_entry/alloc_raw_entry's own
// g_blit_transparent_mode branch) into the flags word.
undefined4 sprite_list_set_frame_id(param_1,param_2)
short param_1;
undefined4 param_2;

{
  ushort uVar1;
  undefined4 uVar2;
  ushort *puVar3;

  if (param_1 < 0x40) {
    puVar3 = (ushort *)(param_1 * 0x14 + DAT_0023c3e8);
    *(char *)(puVar3 + 7) = (char)param_2;
    *(char *)((char *)puVar3 + 0xf) = (char)((uint)param_2 >> 8);
    uVar1 = *puVar3 | DAT_0008763c;
    *(char *)puVar3 = (char)uVar1;
    *(char *)((char *)puVar3 + 1) = (char)(uVar1 >> 8);
    sprite_list_queue_slot_redraw((ushort)param_1);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar2 = 0;
  }
  else {
    uVar2 = 0xffffffff;
  }
  return uVar2;
}



// was FUN_00076404 -- sprite_list_set_frame_id's transparent-blit
// sibling; see that function's own comment.
undefined4 sprite_list_set_frame_id_transparent(param_1,param_2)
short param_1;
undefined4 param_2;

{
  ushort uVar1;
  undefined4 uVar2;
  ushort *puVar3;

  if (param_1 < 0x40) {
    puVar3 = (ushort *)(param_1 * 0x14 + DAT_0023c3e8);
    *(char *)(puVar3 + 7) = (char)param_2;
    *(char *)((char *)puVar3 + 0xf) = (char)((uint)param_2 >> 8);
    uVar1 = *puVar3 | DAT_00087648 | DAT_0008763c;
    *(char *)puVar3 = (char)uVar1;
    *(char *)((char *)puVar3 + 1) = (char)(uVar1 >> 8);
    sprite_list_queue_slot_redraw((ushort)param_1);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar2 = 0;
  }
  else {
    uVar2 = 0xffffffff;
  }
  return uVar2;
}




// was FUN_0007699c
undefined4 sprite_list_set_lifetime(param_1,param_2)
short param_1;
undefined4 param_2;

{
  undefined4 uVar1;
  char * iVar2;
  
  if (param_1 < 0x40) {
    iVar2 = param_1 * 0x14 + DAT_0023c3e8;
    *(char *)(iVar2 + 10) = (char)param_2;
    *(char *)(iVar2 + 0xb) = (char)((uint)param_2 >> 8);
    sprite_list_queue_slot_redraw((ushort)param_1);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar1 = 0;
  }
  else {
    uVar1 = 0xffffffff;
  }
  return uVar1;
}



/* param_1 = object sprite id, param_2 = shade -- both were dropped by
   Ghidra at the emit_tile_objects call site AND on the resolve_sprite_id_to_frame /
   lookup_grtile_by_id calls below, so the sprite loader ran with a garbage id
   and lookup_grtile_by_id handed back its zeroed dummy glyph -> every object
   billboard decoded to a 0x0 texture (invisible). Forward the id, and
   resolve it through resolve_sprite_id_to_frame the way draw_sprite_by_id does. */
// was FUN_00040770
undefined4 decode_tile_object_billboard_texture(param_1,param_2)
short param_1;
uint param_2;

{
  byte bVar1;
  byte bVar2;
  char *pcVar3;
  void *buf;
  int iVar5;
  int resolved;

  (void)param_2;
  if (param_1 < 0) {
    /* Escape hatch: a negative param_1 names an ABSOLUTE frame directly
       (-param_1), bypassing resolve_sprite_id_to_frame's id-range resolution entirely.
       Needed for TMOBJ signs (emit_tile_objects's class-2 branch):
       resolve_sprite_id_to_frame's ">= 0x2000 -> DAT_00202738 + id - 0x2000" TMOBJ
       convention assumes DAT_00202738 is TMOBJ's own starting base, but
       it's actually snapshotted right AFTER TMOBJ's own
       load_gr_resource_group(s_tmobj) call finishes -- confirmed by instrumenting
       the loader directly (DAT_00202744 went 643 -> 681 across that one
       call, so TMOBJ's real 38 frames are absolute 643-680, and
       DAT_00202738=681 is the NEXT resource's base). No non-negative
       encoding through resolve_sprite_id_to_frame's existing branches can reach frames
       *before* DAT_00202738, so bypass it here instead of reworking the
       shared id convention every other caller (OBJECTS/ANIMO ids) relies
       on. */
    resolved = -(int)param_1;
  } else {
    resolved = resolve_sprite_id_to_frame(param_1);
  }
  pcVar3 = (char *)lookup_grtile_by_id(resolved);
  bVar1 = pcVar3[1];
  bVar2 = pcVar3[2];
  if (getenv("UW_DEBUG_THROW") && param_1 == 0x80)
    fprintf(stderr, "[throw-sprite] param_1(type)=0x%x resolved_frame=%d w=%d h=%d compressed_flag=%d\n",
            (unsigned)param_1, resolved, (int)bVar1, (int)bVar2, (int)*pcVar3);
  if (*pcVar3 == '\x04') {
    pcVar3 = pcVar3 + 5;
  }
  else {
    /* Ghidra dropped decompress_gr_bitmap's 3rd arg, the .GR entry's compression
       mode (*pcVar3 -- 6/8/0xa RLE variants). Without it the decoder took
       its param_3==0 path and produced an all-zero (fully transparent)
       bitmap, so every object billboard sampled nothing. */
    pcVar3 = (char *)decompress_gr_bitmap(pcVar3 + 4,&DAT_00202520 + (uint)(byte)pcVar3[3] * 0x10,
                                  *pcVar3);
  }
  iVar5 = (int)(short)(ushort)bVar2 * (int)(short)(ushort)bVar1;
  /* decode this object's sprite into a fresh per-record buffer (keep the
     full 64-bit pointer -- ce_malloc's result was truncated through the
     `undefined4` DAT_0023c7a0). */
  buf = ce_malloc(iVar5);
  (&DAT_0023c7a0)[DAT_0023b83c] = buf;
  ce_memset(buf,0,iVar5);
  ce_memmove(buf,pcVar3,iVar5);
  DAT_002022fc = (int)(intptr_t)buf;
  DAT_00202508 = (ushort)bVar1;
  DAT_002022f8 = (ushort)bVar2;
  /* render_visible_tile_list reads each record's texture from the
     g_tile_texptr_out[] side channel (the in-record field is 4 bytes and
     truncates on 64-bit). process_visible_tile_cell writes
     g_tile_texptr_emit[DAT_0023b83c] for tiles; do the same for this
     object record so its billboard gets its sprite instead of a stale
     tile texture. DAT_0023b83c here is the object's own record index. */
  if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) {
    g_tile_texptr_emit[DAT_0023b83c] = buf;
  }
  return 1;
}



// was FUN_000408fc
void *lookup_grtile_by_id(param_1)
short param_1;

{
  /* Glyph/font-resource-by-id lookup (g_grtile_registry is indexed by
     param_1). Several callers (decode_tile_object_billboard_texture, set_cursor_sprite_id, etc.) call
     this with the argument dropped by Ghidra at their call site and then
     dereference the result unconditionally, so returning a real NULL for
     the param_1==0 case -- which is otherwise correct -- crashes them.
     Fall back to a small zeroed dummy glyph buffer instead of NULL.
     Return type widened from undefined4 to void* so the pointer this
     hands back doesn't get truncated on a 64-bit host. */
  static undefined1 dummy_glyph[16];
  void *uVar1;

  if (param_1 == 0) {
    uVar1 = dummy_glyph;
  }
  else {
    /* Fixed: g_grtile_registry is a real pointer array (see its
       declaration comment); this used to be a 4-byte truncated read. */
    uVar1 = g_grtile_registry[param_1];
    if (uVar1 == 0) {
      /* Table slot never populated (the resource that would have filled
         it, e.g. a missing/failed auxiliary .SYS load) -- same safe
         fallback as param_1==0 rather than handing callers a NULL they
         don't check. */
      uVar1 = dummy_glyph;
    }
  }
  return uVar1;
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
         absolute frame indices (register_objects_gr_entry), so the id IS the frame. */
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
