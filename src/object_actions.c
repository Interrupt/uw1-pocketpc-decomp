/* Object action dispatch: the right-click action-list builder (and its
 * duplicate variant), critter sprite tier/page resolution, and
 * placement/combination checks (carry weight, drop height, item
 * combination). Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/object_actions.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






void dispatch_object_action(param_1,param_2)
ushort * param_1;
int param_2;

{
  char *wptr_26120;
  byte bVar1;
  char cVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  char *pcVar6;
  undefined4 uVar7;
  undefined *puVar8;
  int iVar9;
  char cVar10;
  undefined4 uVar11;
  char acStack_85978 [547012];
  undefined1 auStack_b4 [8];
  char acStack_ac [16];
  char acStack_9c [32];
  /* Was 80 bytes -- build_creature_look_text's creature-look text ("You see " +
     article + description + " named " + proper name + suffix + "\n")
     can run well past that for a creature with a real name, overflowing
     acStack_7c and taking the fortified strcat (Ordinal_1063) down with
     a SIGSEGV. Reproduced via a right-click "look" at a creature (real
     UW_PICK_FORCE_SLOT-driven repro, not previously exercised since no
     creature in the earlier-tested area had a real name to overflow
     into). Widened generously, matching this session's established
     "resize the too-small stack buffer" fix pattern. */
  char acStack_7c [256];

  uVar11 = 0;
  if (param_1 == (ushort *)0x0) {
    return;
  }
  iVar9 = (*param_1 & 0x1ff) * 0xd;
  if (((&DAT_00202c9b)[iVar9] & 0x10) == 0) {
    if ((*param_1 & 0x1f0) == 0x160) {
      FUN_00049008(param_1,param_2);
    }
    goto LAB_00048b58;
  }
  if (((short)param_2 == 3) && (iVar5 = FUN_000496b0(param_1,&DAT_00202c90 + iVar9), iVar5 != 0)) {
    return;
  }
  /* This copied "You see " into acStack_85978 (a wildly oversized,
     547012-byte local Ghidra apparently misattributed here -- almost
     certainly a stack-frame-size miscalculation artifact, not a real
     array in the original binary), but nothing ever reads
     acStack_85978 again: the real assembled message below builds up in
     acStack_7c instead, which never got this prefix. Confirmed by the
     user: "Look" on an ordinary item (e.g. the sack) printed just "a
     sack" instead of "You see a sack." acStack_7c was also never
     NUL-terminated before its first strcat (Ordinal_1063) below, so
     leftover content from a PREVIOUS look call's stack frame could
     survive and get concatenated onto -- "Multiple Looks will also
     print them together like 'a sackasack'". Fix both: clear acStack_7c
     and seed it with the real "You see " prefix here instead. */
  acStack_7c[0] = '\0';
  Ordinal_1063(acStack_7c, s_You_see_000858fc);
  acStack_ac[0] = '\0';
  iVar5 = FUN_00048b6c(param_1,param_2,acStack_ac);
  cVar10 = '\0';
  if (iVar5 != 0) {
    cVar10 = acStack_ac[0];
  }
  acStack_9c[0] = '\0';
  if ((*param_1 & 0x1c0) == 0x40) {
    build_creature_look_text(param_1,acStack_7c);
    return;
  }
  iVar5 = 0;
  if ((param_1[2] & 0x3f) != 0) {
    if (((&DAT_00202c97)[iVar9] & 0xc) == 0xc) {
      sVar4 = 5;
    }
    else {
      sVar4 = (param_1[2] >> 4 & 3) + 1;
    }
    iVar5 = (int)sVar4;
  }
  pcVar6 = (char *)FUN_0007863c(((byte)(&DAT_00202c9b)[iVar9] & 0xf) * 6 + iVar5 | 0xa00);
  if (pcVar6 != (char *)0x0) {
    cVar2 = *pcVar6;
    if (cVar2 != '\0') {
      iVar5 = Ordinal_1068(pcVar6);
      Ordinal_1044(acStack_9c,pcVar6,iVar5 + 1);
      cVar10 = cVar2;
    }
    param_2 = (int)(short)param_2;
  }
  if ((((*param_1 & 0x8000) == 0) || (uVar3 = param_1[3], (uVar3 & 0x8000) != 0)) ||
     ((uVar3 & 0xffc0) < 0x41)) {
    if ((cVar10 != '\0') && (((&DAT_00202c9b)[iVar9] & 0xf) != 0xd)) {
      if (((cVar10 == 'a') || ((cVar10 == 'e' || (cVar10 == 'i')))) ||
         (cVar10 == 'o' || cVar10 == 'u')) {
        puVar8 = &DAT_00085244;
      }
      else {
        puVar8 = &DAT_00085248;
      }
      goto LAB_000489fc;
    }
  }
  else {
    uVar11 = 1;
    cVar10 = 'x';
    uVar7 = Ordinal_1025(uVar3 >> 6,auStack_b4,10);
    Ordinal_1063(acStack_7c,uVar7);
    puVar8 = &DAT_00085240;
LAB_000489fc:
    Ordinal_1063(acStack_7c,puVar8);
  }
  if (acStack_9c[0] != '\0') {
    Ordinal_1063(acStack_7c,acStack_9c);
    Ordinal_1063(acStack_7c,&DAT_00085240);
  }
  if (acStack_ac[0] != '\0') {
    Ordinal_1063(acStack_7c,acStack_ac);
  }
  iVar9 = Ordinal_1068(acStack_7c);
  FUN_00078b18(acStack_7c + iVar9,param_1,cVar10 == '\0',uVar11);
  FUN_00048bf0(param_1,param_2,acStack_7c);
  if (((((&DAT_00202c98)[(*param_1 & 0x1ff) * 0xd] & 0x80) != 0) &&
      (bVar1 = (byte)param_1[3], (bVar1 & 0x3f) != 0)) && ((bVar1 & 0x1f) < 0x1c)) {
    Ordinal_1063(acStack_7c,s_belonging_to_00085c90);
    /* uVar11 is `undefined4` (reused as a flag above); assigning FUN_0007863c's
       char* to it truncated the pointer -> Ordinal_1063 (strcat) walked a wild
       address, crashing a right-click "look" at any owned container (the
       spawn-room sack). Use the char* local. */
    pcVar6 = FUN_0007863c((bVar1 & 0x1f) + 0x172 | 0x200);
    Ordinal_1063(acStack_7c,pcVar6);
  }
  Ordinal_1063(acStack_7c,&DAT_00084f20);
  /* No trailing newline was ever appended, so back-to-back Looks (the
     scroll's own line-break logic, FUN_0007f770, only breaks on an
     embedded '\n' -- ASCII 10 -- byte) all landed on the same visible
     line: confirmed live, 3 Looks at the sack rendered as one run-on
     "You see a sackYou see a sackYou see a sack" instead of 3 separate
     lines. */
  Ordinal_1063(acStack_7c,"\n");
  message_scroll_print_wrapped(acStack_7c);
LAB_00048b58:
  FUN_000495d0(param_1,param_2);
  return;
}


/* was FUN_000404a0. Loads (and page-caches) a \CRIT\CRnnPAGE.Nnn sprite
   page and decodes one frame's glyph into a fresh palette-indexed bitmap.
   Repurposes the same page-cache/glyph-index machinery as the font/glyph
   renderer (hence the "[glyphpage]" log tag) -- param_1=critter type
   index, param_2=animation tier, param_3=direction, param_4=frame count
   for this direction, param_5=frame index. Sets DAT_00202508/DAT_002022f8
   (w/h) and DAT_002022fc (bitmap pointer) on success. */
undefined4 decode_critter_sprite_page(param_1,param_2,param_3,param_4,param_5)
int param_1;
int param_2;
short param_3;
short param_4;
short param_5;

{
  ushort uVar3;
  int iVar1;
  int iVar5;
  byte *pbVar6;
  char *uVar7; /* FUN_000129f8's real return type -- was undefined4, truncating it */
  byte *pbVar8;
  int iVar9;
  int iVar10;
  byte *pbVar11;
  void **piVar12;
  /* iVar5 above is a real int (file handle) for open_file_for_read's return,
     reused later in this same function as if it held Ordinal_1041's
     `void *` return (the decoded glyph buffer) -- same "reused scalar"
     bug already fixed in FUN_00049008 this session. Separate real
     pointer local for that use. */
  void *pvVar_glyphbuf;

  pbVar11 = uw_load_critter_page_cached(param_1, param_2);
  if (pbVar11 == (byte *)0) {
    /* Missing/unopenable per-page resource file -- was an unconditional
       FUN_00082388(0xffffffff) hard exit (only reachable for a real
       object, class 1, that no object in the previously-tested level
       area happened to use -- confirmed via lldb backtrace: reached
       from emit_tile_objects's class-1 branch via resolve_critter_sprite_tier, one
       specific door ~17 tiles from spawn). Same "graceful skip instead
       of crash" treatment already used for other missing/unregistered
       resources this session (FUN_000408fc, blit_object_sprite_by_frame) -- return the
       shared dummy_glyph-shaped sentinel instead of taking the whole
       game down over one unavailable page file. */
    static undefined1 dummy_page[8];
    return dummy_page;
  }
  iVar1 = (param_2 + param_1 * 4) * 0x10000 >> 0x10;
  iVar9 = ((int)(((int)param_3 - (uint)*pbVar11) * 0x10000) >> 0x10) + 2;
  if ((unsigned int)iVar9 >= 0x7ffd) {
    /* Out-of-range glyph/character code for this page (this whole
       class-1/font-page path was unexercised before this session --
       nothing in the previously-tested level area used it -- so an
       out-of-bounds `param_3` relative to the page's own base char code
       (`*pbVar11`) was never hardened against. `pbVar11` is a real
       0x7fff-byte Ordinal_1041 allocation; -3 keeps every access below
       reading pbVar11[iVar9] and pbVar11[iVar9+1] in bounds. Skip
       drawing this glyph rather than reading wildly out of the buffer. */
    DEBUG(ERR, "[glyphpage] index %d out of range for page base %d (param_3=%d), skipping\n",
          iVar9, (int)*pbVar11, (int)param_3);
    return 0;
  }
  if (getenv("UW_DEBUG_CRITTER"))
    fprintf(stderr, "[critter] decode_critter_sprite_page: page_base=%d iVar9(glyph_idx)=%d pbVar11[iVar9]=%d(0x%x) param_4(frame_count?)=%d\n",
            (int)*pbVar11, iVar9, (int)pbVar11[iVar9], (int)pbVar11[iVar9], (int)param_4);
  if (pbVar11[iVar9] != 0xff) {
    pbVar6 = pbVar11 + (short)(ushort)pbVar11[1] + 2;
    if (getenv("UW_DEBUG_CRITTER") && param_1 == 26) {
      static int _dumped26 = 0;
      if (!_dumped26) {
        _dumped26 = 1;
        fprintf(stderr, "[critter26] pbVar11[1]=%d *pbVar6=%d pbVar6[0..79]:", (int)pbVar11[1], (int)*pbVar6);
        for (int _i = 0; _i < 80; _i++) fprintf(stderr, " %02x", pbVar6[_i]);
        fprintf(stderr, "\n");
      }
    }
    uVar3 = (ushort)pbVar6[(((int)param_5 +
                            ((int)((uint)pbVar11[iVar9] << 0x13) >> 0x10)) * 0x10000 >> 0x10)
                           + 1];
    pbVar8 = pbVar6 + (((int)(short)(ushort)*pbVar6 << 0x13) >> 0x10) + 1;
    if (pbVar6[(((int)param_5 +
                ((int)((uint)pbVar11[iVar9]
                      << 0x13) >> 0x10)) * 0x10000 >> 0x10) + 1] == 0xff) {
      uVar3 = 0;
    }
    if (getenv("UW_DEBUG_CRITTER") && param_1 == 26)
      fprintf(stderr, "[critter26] frame-check type=%d tier=%d dir=%d frame=%d tierbyte=%d uVar3(glyph_sel)=%d quality=%d *pbVar8(frame_count)=%d %s\n",
              (int)param_1, (int)param_2, (int)param_3, (int)param_5, (int)pbVar11[iVar9], (int)(short)uVar3, (int)param_4, (int)(uint)*pbVar8, (int)param_4 <= (int)(uint)*pbVar8 ? "PASS" : "FAIL(returns 0, no decode)");
    if ((int)param_4 <= (int)(uint)*pbVar8) {
      iVar9 = (uint)*pbVar8 * 0x20 + 3;
      iVar5 = ((int)(short)uVar3 << 0x11) >> 0x10;
      if (getenv("UW_DEBUG_CRITTER") && param_1 == 26)
        fprintf(stderr, "[critter26] iVar5(glyph_sel_signed)=%d iVar9(table_base)=%d final_offset_bytes=[%d,%d] -> glyph_ptr_offset=%u\n",
                iVar5, iVar9, (int)pbVar8[iVar5+iVar9], (int)pbVar8[iVar5+iVar9+1],
                (unsigned)(((uint)pbVar8[iVar5 + iVar9] + (uint)pbVar8[iVar5 + iVar9 + 1] * 0x100)));
      pbVar11 = pbVar11 + ((int)(((uint)pbVar8[iVar5 + iVar9] +
                                 (uint)pbVar8[iVar5 + iVar9 + 1] * 0x100) * 0x10000) >> 0x10);
      DAT_00202508 = (ushort)*pbVar11;
      DAT_002022f8 = (ushort)pbVar11[1];
      DAT_00202300 = (ushort)pbVar11[2];
      DAT_00202304 = (ushort)pbVar11[3];
      /* DAT_00202508 is WIDTH, DAT_002022f8 is HEIGHT -- confirmed
         against the class-0 item decoder's identical header read a few
         lines below (`bVar1 = pcVar3[1]` = the real .GR "byte1=width"
         per uw_debug_dump_gr_entry's own documented format, assigned to
         this same DAT_00202508; `bVar2 = pcVar3[2]` = "byte2=height"
         assigned to this same DAT_002022f8). Every w=/h= label and the
         uw_debug_dump_critter_sprite call below had these backwards
         until now -- harmless for the real on-screen renderer (which
         only ever uses them as a product, or correctly by role a few
         hundred lines down in emit_tile_objects's own quad-vertex math),
         but it silently fed the debug dump tool a swapped width/height,
         so every dumped BMP read each row at the wrong stride and came
         out looking like scrambled noise (reported live, spotted by the
         user as "the pixel pitch ... looks off" on the dumped images --
         not a rendering bug, a diagnostics-only one). */
      if (getenv("UW_DEBUG_CRITTER"))
        fprintf(stderr, "[critter] decode_critter_sprite_page: w=%d h=%d comp_type(pbVar11[4])=%d\n",
                (int)(short)DAT_00202508, (int)(short)DAT_002022f8, (int)pbVar11[4]);
      /* pbVar11 here has already been re-pointed via pbVar8[iVar5+iVar9]
         (a tier-byte-derived offset, no bounds check against pbVar8's
         real extent) -- for a tier-byte well outside the small range
         this offset scheme was confirmed correct for (0-7, see
         resolve_critter_sprite_tier's own tier-search table), that reads
         wild/unrelated bytes from elsewhere in the page and
         misinterprets them as a glyph header (observed: a real NPC's
         direction 129 producing a 241x16 header, an impossible sprite
         size, with pbVar11[4] landing on an unsupported
         unpack_glyph_bitmap format too). Every other creature sprite
         actually seen this session is under 64px in both dimensions;
         skip decoding rather than allocate/decode from a header that
         clearly isn't real glyph data. This is a stopgap, not a fix for
         the underlying tier-byte interpretation -- the real page-format
         semantics for tier-bytes outside 0-7 are still unknown. */
      if ((unsigned short)DAT_00202508 > 64 || (unsigned short)DAT_002022f8 > 64) {
        DEBUG(ERR, "[critter] decode_critter_sprite_page: implausible header w=%d h=%d for type=%d tier=%d dir=%d, skipping\n",
              (int)(short)DAT_00202508, (int)(short)DAT_002022f8, param_1, param_2, (int)param_3);
        return 0;
      }
      uVar7 = FUN_000129f8(pbVar11 + 5,pbVar8 + param_4 * 0x20 + 1,pbVar11[4]);
      if (getenv("UW_DEBUG_CRITTER") && uVar7) {
        fprintf(stderr, "[critter] decode_critter_sprite_page: decoded row bytes[0..15]:");
        for (int _i = 0; _i < 16; _i++) fprintf(stderr, " %02x", (unsigned char)uVar7[_i]);
        fprintf(stderr, "\n");
      }
      pvVar_glyphbuf = Ordinal_1041((int)(short)DAT_002022f8 * (int)(short)DAT_00202508);
      iVar10 = (int)(short)DAT_002022f8;
      iVar9 = (int)(short)DAT_00202508;
      piVar12 = &DAT_002020f8 + iVar1;
      *piVar12 = pvVar_glyphbuf;
      Ordinal_1047(pvVar_glyphbuf,0,iVar10 * iVar9);
      Ordinal_1044(*piVar12,uVar7,(int)(short)DAT_002022f8 * (int)(short)DAT_00202508);
      uw_debug_dump_critter_sprite(param_1,param_2,(int)param_3,(int)param_5,
                                    (unsigned char *)*piVar12,
                                    (int)(short)DAT_00202508,(int)(short)DAT_002022f8);
      if (getenv("UW_DEBUG_CRITTER")) {
        unsigned char *_gb = (unsigned char *)*piVar12;
        int _w = (int)(short)DAT_00202508, _h = (int)(short)DAT_002022f8;
        int _total = _w * _h;
        int _hist[256] = {0};
        for (int _i = 0; _i < _total; _i++) _hist[_gb[_i]]++;
        fprintf(stderr, "[critter] decode_critter_sprite_page: glyphbuf w=%d h=%d total=%d nonzero-value-histogram:", _w, _h, _total);
        for (int _i = 0; _i < 256; _i++) if (_hist[_i]) fprintf(stderr, " [%d]=%d", _i, _hist[_i]);
        fprintf(stderr, "\n");
        fprintf(stderr, "[critter] decode_critter_sprite_page: middle row (%d) bytes:", _h/2);
        for (int _i = 0; _i < _w && _i < 48; _i++) fprintf(stderr, " %02x", _gb[(_h/2)*_w + _i]);
        fprintf(stderr, "\n");
      }
      if (*piVar12 != 0) {
        DAT_002022fc = (intptr_t)*piVar12;
        /* render_visible_tile_list reads each record's texture from the
           g_tile_texptr_out[] side channel (the in-record field is 4 bytes
           and truncates on 64-bit) -- same fix already applied to the
           class-0 item billboard decoder just above resolve_critter_sprite_tier. Without
           this, a critter/door billboard's record kept whatever truncated
           32-bit pointer bits got stuffed into DAT_000acdfc, so the
           renderer sampled a wild/bogus texture and every glyph pixel
           came back near-0 (rendered as a dark silhouette instead of the
           real creature bitmap). DAT_0023b83c is this object's own record
           index, same convention as the sibling fix. */
        if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) {
          g_tile_texptr_emit[DAT_0023b83c] = *piVar12;
        }
      }
      return 1;
    }
  }
  return 0;
}




/* was FUN_0004083c. Called from emit_tile_objects's render-class-1
   (camera-facing billboard, used for both critters and doors) branch.
   param_1=critter type index (object id & 0x3f), param_2=direction index,
   param_3=frame, param_4=shade (see below). Looks up the type in the
   \CRIT\assoc.anm-derived DAT_0023ce70 table to get its real page
   index, then hands off to decode_critter_sprite_page. Returns 0
   (no-op) for a type with no assoc-table entry (0xff sentinel). */
/* Tier selection REWRITTEN this session -- the shade/DAT_0023c460-
   threshold mechanism previously here was never the real logic; that
   original code was not recovered from disassembly, and an earlier
   session's plausible-looking reconstruction (matching the class-0
   item path's genuinely distance-based LOD convention) turned out to
   be the wrong model for critters. Concrete evidence, from directly
   inspecting the real page files: EVERY creature checked (10 distinct
   types, including Bragit/page 26) has the identical shape -- tier 0
   (CRnnPAGE.N00) covers direction 0-31 (states 0x1c-0x1f), tier 1
   (.N01) covers direction 32-159 (states 0x20-0x2f), and .N02/.N03
   simply don't exist as files for any of them. These are not graduated
   LOD/quality levels of the same content -- they're two files that
   together tile ONE continuous direction-index range. Separately,
   DAT_0023bc88 (the light-level term feeding the old "shade" value) is
   hard-clamped to a max of 0xe=14 in the normal 3D-dungeon-view path
   (uw.c ~57521), so it could never reach anywhere near the per-page
   threshold data (itself often just the loader's own 0xa0-default
   fallback, uw.c ~32247, when its own metadata file fails to open) --
   tier was structurally pinned at 0 for every creature, every dungeon
   scene, regardless of state, which is exactly what caused states
   >=0x20 to read past tier 0's real 32-byte table into unrelated bytes
   (Bragit's reported "mix of attack/idle/death-looking frames").
   Replaced with the real rule: load each candidate tier's page and use
   whichever one's actual (base, base+span) range -- read straight from
   that page's own header bytes via uw_load_critter_page_cached -- truly
   contains the requested direction, instead of guessing from lighting.
   param_4 (shade) is no longer used for tier selection; kept in the
   signature since emit_tile_objects's call site genuinely does pass it
   (disassembly-confirmed) and may still have a legitimate, not yet
   identified role elsewhere in critter rendering (e.g. palette/tint) --
   not removed, just unused here now. */
undefined4 resolve_critter_sprite_tier(param_1,param_2,param_3,param_4)
short param_1;
undefined4 param_2;
short param_3;
uint param_4;

{
  undefined4 uVar2;
  uint uVar4;
  byte *page;
  int tier;
  int t;

  if (0x60 < param_3) {
    param_3 = 0;
  }
  uVar4 = (uint)(byte)(&DAT_0023ce70)[param_1 * 2];
  if (getenv("UW_DEBUG_CRITTER"))
    fprintf(stderr, "[critter] resolve_critter_sprite_tier: param_1(type_idx)=%d param_2(dir)=%d param_3(frame)=%d param_4(shade,unused-for-tier)=%d -> assoc[%d]=%u (0x%x)\n",
            (int)param_1, (int)(short)param_2, (int)param_3, (int)param_4, (int)param_1 * 2, uVar4, uVar4);
  if (0xff < (short)param_2) {
    param_2 = 0;
  }
  if (uVar4 == 0xff) {
    uVar2 = 0;
  }
  else {
    tier = 0;
    for (t = 0; t < 4; t++) {
      page = uw_load_critter_page_cached(uVar4, t);
      if (page == (byte *)0) continue;
      int base = (int)page[0];
      int span = (int)page[1];
      int match = ((int)(short)param_2 >= base) && ((int)(short)param_2 < base + span);
      if (getenv("UW_DEBUG_CRITTER"))
        fprintf(stderr, "[critter] resolve_critter_sprite_tier: probe tier=%d base=%d span=%d valid=[%d,%d] dir=%d %s\n",
                t, base, span, base, base + span - 1, (int)(short)param_2, match ? "MATCH" : "no");
      if (match) {
        tier = t;
        break;
      }
    }
    decode_critter_sprite_page(uVar4,tier,param_2,(&DAT_0023ce71)[param_1 * 2],param_3);
    uVar2 = 1;
  }
  return uVar2;
}




// Dropped argument: both real call sites (uw.c:11074 `check_object_carry_weight(iVar2)`,
// and interact_default's own `check_object_carry_weight(g_interact_target)` -- the object
// being picked up) pass an object pointer, but this function's own
// recovered signature took none, so it silently called FUN_00046260()
// bare too instead of forwarding it -- FUN_00046260's very first line
// unconditionally dereferences its parameter, so with nothing passed
// through, it dereferenced whatever ARM register-leftover garbage was
// sitting there and crashed. Confirmed live: interact_default's "grab
// the sack" call reached exactly this line and segfaulted (bt: interact_
// default -> check_object_carry_weight -> SIGSEGV). This is a "can the object being
// picked up fit in the backpack" weight/capacity check -- same "wrapper
// forgot to forward its own argument" idiom as get_equipped_item_at_slot elsewhere in
// this file, just a missing forward instead of a hardcoded return.
bool check_object_carry_weight(param_1)
ushort *param_1;

{
  short sVar1;

  sVar1 = FUN_00046260(param_1);
  if (getenv("UW_DEBUG_WEIGHT"))
    fprintf(stderr, "[weight] objid=0x%03x item_weight=%d current_load=%u max_capacity=%u fits=%d\n",
            (int)(*param_1 & 0x1ff), (int)sVar1, (unsigned)g_player_carry_weight, (unsigned)g_player_max_carry_weight,
            (int)sVar1 + (uint)g_player_carry_weight <= (uint)g_player_max_carry_weight);
  return (int)((int)sVar1 + (uint)g_player_carry_weight) <= (int)(uint)g_player_max_carry_weight;
}




void dispatch_object_action_dup(param_1,param_2)
ushort * param_1;
int param_2;

{
  char *wptr_31634;
  byte bVar1;
  char cVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  char *pcVar6;
  undefined4 uVar7;
  undefined *puVar8;
  int iVar9;
  char cVar10;
  undefined4 uVar11;
  char acStack_85978 [547012];
  undefined1 auStack_b4 [8];
  char local_ac [16];
  char local_9c [32];
  /* Same too-small stack buffer fixed in this function's duplicate,
     dispatch_object_action -- see the comment there. */
  char acStack_7c [256];
  
  uVar11 = 0;
  if (param_1 == (ushort *)0x0) {
    return;
  }
  iVar9 = (*param_1 & 0x1ff) * 0xd;
  if (((&DAT_00202c9b)[iVar9] & 0x10) == 0) {
    if ((*param_1 & 0x1f0) == 0x160) {
      FUN_00049008(param_1,param_2);
    }
    goto LAB_00048b58;
  }
  if (((short)param_2 == 3) && (iVar5 = FUN_000496b0(param_1,&DAT_00202c90 + iVar9), iVar5 != 0)) {
    return;
  }
  pcVar6 = s_You_see_000858fc;
    wptr_31634 = acStack_85978;
  do {
    cVar10 = *pcVar6;
    *wptr_31634 = cVar10; wptr_31634 = wptr_31634 + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar10 != '\0');
  local_ac[0] = '\0';
  iVar5 = FUN_00048b6c(param_1,param_2,local_ac);
  cVar10 = '\0';
  if (iVar5 != 0) {
    cVar10 = local_ac[0];
  }
  local_9c[0] = '\0';
  if ((*param_1 & 0x1c0) == 0x40) {
    build_creature_look_text(param_1,acStack_7c);
    return;
  }
  iVar5 = 0;
  if ((param_1[2] & 0x3f) != 0) {
    if (((&DAT_00202c97)[iVar9] & 0xc) == 0xc) {
      sVar4 = 5;
    }
    else {
      sVar4 = (param_1[2] >> 4 & 3) + 1;
    }
    iVar5 = (int)sVar4;
  }
  pcVar6 = (char *)FUN_0007863c(((byte)(&DAT_00202c9b)[iVar9] & 0xf) * 6 + iVar5 | 0xa00);
  if (pcVar6 != (char *)0x0) {
    cVar2 = *pcVar6;
    if (cVar2 != '\0') {
      iVar5 = Ordinal_1068(pcVar6);
      Ordinal_1044(local_9c,pcVar6,iVar5 + 1);
      cVar10 = cVar2;
    }
    param_2 = (int)(short)param_2;
  }
  if ((((*param_1 & 0x8000) == 0) || (uVar3 = param_1[3], (uVar3 & 0x8000) != 0)) ||
     ((uVar3 & 0xffc0) < 0x41)) {
    if ((cVar10 != '\0') && (((&DAT_00202c9b)[iVar9] & 0xf) != 0xd)) {
      if (((cVar10 == 'a') || ((cVar10 == 'e' || (cVar10 == 'i')))) ||
         (cVar10 == 'o' || cVar10 == 'u')) {
        puVar8 = &DAT_00085244;
      }
      else {
        puVar8 = &DAT_00085248;
      }
      goto LAB_000489fc;
    }
  }
  else {
    uVar11 = 1;
    cVar10 = 'x';
    uVar7 = Ordinal_1025(uVar3 >> 6,auStack_b4,10);
    Ordinal_1063(acStack_7c,uVar7);
    puVar8 = &DAT_00085240;
LAB_000489fc:
    Ordinal_1063(acStack_7c,puVar8);
  }
  if (local_9c[0] != '\0') {
    Ordinal_1063(acStack_7c,local_9c);
    Ordinal_1063(acStack_7c,&DAT_00085240);
  }
  if (local_ac[0] != '\0') {
    Ordinal_1063(acStack_7c,local_ac);
  }
  iVar9 = Ordinal_1068(acStack_7c);
  FUN_00078b18(acStack_7c + iVar9,param_1,cVar10 == '\0',uVar11);
  FUN_00048bf0(param_1,param_2,acStack_7c);
  if (((((&DAT_00202c98)[(*param_1 & 0x1ff) * 0xd] & 0x80) != 0) &&
      (bVar1 = (byte)param_1[3], (bVar1 & 0x3f) != 0)) && ((bVar1 & 0x1f) < 0x1c)) {
    Ordinal_1063(acStack_7c,s_belonging_to_00085c90);
    /* uVar11 is `undefined4` (reused as a flag above); assigning FUN_0007863c's
       char* to it truncated the pointer -> Ordinal_1063 (strcat) walked a wild
       address, crashing a right-click "look" at any owned container (the
       spawn-room sack). Use the char* local. */
    pcVar6 = FUN_0007863c((bVar1 & 0x1f) + 0x172 | 0x200);
    Ordinal_1063(acStack_7c,pcVar6);
  }
  Ordinal_1063(acStack_7c,&DAT_00084f20);
  /* No trailing newline was ever appended, so back-to-back Looks (the
     scroll's own line-break logic, FUN_0007f770, only breaks on an
     embedded '\n' -- ASCII 10 -- byte) all landed on the same visible
     line: confirmed live, 3 Looks at the sack rendered as one run-on
     "You see a sackYou see a sackYou see a sack" instead of 3 separate
     lines. */
  Ordinal_1063(acStack_7c,"\n");
  message_scroll_print_wrapped(acStack_7c);
LAB_00048b58:
  FUN_000495d0(param_1,param_2);
  return;
}




// was FUN_0004b288 -- validity gate for spawn_object_near_player's
// freshly-copied object (param_1) placed near param_2's position: runs
// the same collision_build_height_field/collision_height_envelope
// machinery settle_dropped_object uses, returning 0 if the copy can't
// actually rest here (caller frees it and falls back to the trajectory
// placement path instead).
undefined4 check_object_drop_height(param_1,param_2)
ushort * param_1;
ushort * param_2;

{
  byte bVar1;
  ushort uVar2;
  undefined2 uVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  /* Was three separate C locals (`ushort local_38[6]; ushort local_2c;
     ushort local_2a;`), but collision_height_envelope/collision_build_
     height_field write through DAT_00202c6c-relative offset arithmetic
     expecting ONE contiguous struct (the same "collision working block"
     layout already fixed globally as DAT_002049c8_backing, see its own
     comment) -- Ghidra's own local-variable naming here reflects the
     real ARM stack frame it disassembled (local_38/local_2c/local_2a =
     stack offsets -0x38/-0x2c/-0x2a), and the gaps between those names
     exactly match local_38's own 12-byte size then 2 more bytes, i.e.
     local_2c sits at +0xc and local_2a at +0xe relative to local_38 --
     exactly where DAT_002049d4/DAT_002049d6 (the tile property-flag
     pair collision_build_height_field writes) live in the already-fixed
     global layout. As separate, unbacked C locals here, nothing
     guaranteed they were laid out contiguously on THIS recompile's
     stack, so the indexed writes and the by-name reads of local_2c/
     local_2a could land on unrelated stack memory -- the identical bug
     class fixed once already for the global struct (commit ed49786),
     just recurring in this function's own private local instance of
     the same pattern. Confirmed live: this function computes the
     collision-refined landing tile for a thrown/dropped item, and with
     local_2c/local_2a reading garbage, the gate at the bottom of this
     function (`(local_2a|local_2c)&0x300`) and the final tile-position
     write it guards behaved unpredictably -- root cause of "the thrown
     item disappears" (it got linked into a essentially-random, usually
     off in a map corner, tile's object list instead of one near the
     player). Backed as one real buffer, sized to match
     DAT_002049c8_backing's own generous 64 bytes for the same safety
     margin. */
  unsigned char local_backing[64];
#define local_38 ((ushort *)local_backing)
#define local_2c (*(ushort *)(local_backing + 0xc))
#define local_2a (*(ushort *)(local_backing + 0xe))

  DAT_00202c6c = local_backing;
  uVar2 = *param_1;
  uVar3 = encode_object_slot_index(param_1);
  *(byte *)(DAT_00202c6c + 5) = (byte)uVar3;
  *(byte *)((char *)DAT_00202c6c + 0xb) = (byte)((ushort)uVar3 >> 8);
  iVar5 = (short)(uVar2 & 0x1ff) * 0xd;
  *(byte *)(DAT_00202c6c + 4) = (&DAT_00202c91)[iVar5] & 7;
  *(undefined *)((char *)DAT_00202c6c + 9) = (&DAT_00202c90)[iVar5];
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[throw-refine] ENTER param_1=%p param_1[0xb]=0x%x param_1+3byte=0x%x\n",
            (void *)param_1, (unsigned)param_1[0xb], (unsigned)*(byte *)((char *)param_1 + 3));
  iVar5 = ((param_1[0xb] & 0xfc00) >> 7) + (uint)(*(byte *)((char *)param_1 + 3) >> 5);
  *(byte *)DAT_00202c6c = (byte)iVar5;
  *(byte *)((char *)DAT_00202c6c + 1) = (byte)((uint)iVar5 >> 8);
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[throw-refine] X computed iVar5=%d (tile=%d)\n", iVar5, iVar5 >> 3);
  /* Was `DAT_00202c6c + 1` for Y's low byte -- disassembly-confirmed
     (0x4b288 @ 0x4b3b8: `strb r3,[r1,#0x2]`) the real write target is
     offset+2, not +1. Offset+1 is X's own high byte (just written two
     lines above); with the wrong offset, Y's low byte clobbered X's
     high byte immediately after it was set, corrupting the "near drop"
     landing-tile lookup this function computes (confirmed live: X read
     back as garbage like 6912/8=864, off the 64-tile map, sending
     collision_build_height_field's tilemap_lookup out of bounds ->
     early-return -> the collision-flags gate below reads uninitialized
     stack instead of real data -> always looks blocked -> this whole
     "place it near the player" path always silently failed and fell
     back to the far/trajectory throw path instead). */
  iVar5 = ((*(byte *)((char *)param_1 + 3) & 0x1c) >> 2) + ((param_1[0xb] & 0x3f0) >> 1);
  *(byte *)((char *)DAT_00202c6c + 2) = (byte)iVar5;
  *(byte *)((char *)DAT_00202c6c + 3) = (byte)((uint)iVar5 >> 8);
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[throw-refine] Y computed iVar5=%d (tile=%d)\n", iVar5, iVar5 >> 3);
  /* Both pointer args below were `DAT_00202c6c`/`DAT_00202c6c + 1` --
     the Y output must be `+2` to match the real Y storage (offset+2/+3,
     see the fix just above); `+1` is X's own high byte. Disassembly-
     confirmed (0x4b288 @ 0x4b458's `bl 0x69f2c` args). */
  project_position_by_heading(((byte)param_1[0xc] & 0x1f) + ((param_1[1] & 0x380) >> 2),
               ((&DAT_00202c91)[(*param_1 & 0x1ff) * 0xd] & 7) +
               ((&DAT_00202c91)[(*param_2 & 0x1ff) * 0xd] & 7) + '\x04',DAT_00202c6c,
               DAT_00202c6c + 2);
  /* Was `DAT_00202c6c + 2` -- disassembly-confirmed (0x4b288 @ 0x4b474:
     `strb r3,[r0,#0x4]`) the real target is offset+4/+5 (the same "Z"
     field this function's own later collision calls read via
     `*(short *)(DAT_00202c6c + 4)`), not offset+2 (Y's own low byte,
     just written above -- this write would otherwise immediately
     re-clobber it). */
  *(byte *)((char *)DAT_00202c6c + 4) = (byte)param_1[1] & 0x7f;
  *(byte *)((char *)DAT_00202c6c + 5) = 0;
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[throw-refine] pre-collision local_38[0..5]=%d,%d,%d,%d,%d,%d offset4(Z)=%d\n",
            (int)local_38[0], (int)local_38[1], (int)local_38[2], (int)local_38[3],
            (int)local_38[4], (int)local_38[5], (int)*(short *)((char *)DAT_00202c6c + 4));
  collision_height_envelope(0,1);
  collision_build_height_field(0);
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[throw-refine] post-collision local_2c=%d local_2a=%d DAT_00202c6c[0]=%d DAT_00202c6c[1]=%d gate=0x%x ref_height(off4)=%d sampled_floor(off0x10)=%d steplim(off8)=%d\n",
            (int)local_2c, (int)local_2a, (int)DAT_00202c6c[0], (int)DAT_00202c6c[1],
            (unsigned)((local_2a | local_2c) & 0x300),
            (int)*(short *)((char *)DAT_00202c6c + 4), (int)(byte)DAT_00202c6c[0x10],
            (int)(byte)DAT_00202c6c[8]);
  if (((local_2a | local_2c) & 0x300) == 0) {
    if ((byte)DAT_00202c6c[10] != 0) {
      FUN_00051dd0();
      if (*(byte *)((char *)DAT_00202c6c + 0x15) != 0) goto LAB_0004b4d4;
    }
    uVar2 = param_1[0xb];
    uVar6 = uVar2 & 0x3ff;
    uVar7 = ((int)(short)(*DAT_00202c6c & 0x1f8) >> 3) << 10;
    *(char *)(param_1 + 0xb) = (char)uVar6;
    *(byte *)((char *)param_1 + 0x17) = (byte)(uVar6 >> 8) | (byte)(uVar7 >> 8);
    uVar7 = uVar2 & 0xf | uVar7 | ((int)(short)(DAT_00202c6c[1] & 0x1f8) >> 3) << 4;
    *(char *)(param_1 + 0xb) = (char)uVar7;
    *(char *)((char *)param_1 + 0x17) = (char)(uVar7 >> 8);
    uVar7 = (uint)CONCAT11(*(undefined1 *)((char *)param_1 + 3),(char)param_1[1]);
    uVar6 = uVar7 & 0x1fff;
    bVar1 = (byte)((((byte)*DAT_00202c6c & 7) << 0xd) >> 8);
    *(char *)(param_1 + 1) = (char)uVar6;
    *(byte *)((char *)param_1 + 3) = (byte)(uVar6 >> 8) | bVar1;
    uVar2 = DAT_00202c6c[1];
    uVar7 = uVar7 & 0x3ff;
    *(char *)(param_1 + 1) = (char)uVar7;
    uVar4 = 1;
    *(byte *)((char *)param_1 + 3) =
         (byte)(uVar7 >> 8) | bVar1 | (byte)((((byte)uVar2 & 7) << 10) >> 8);
  }
  else {
LAB_0004b4d4:
    uVar4 = 0;
  }
#undef local_38
#undef local_2c
#undef local_2a
  return uVar4;
}




undefined4 check_object_combination(param_1,param_2,param_3)
char *param_1;
ushort * param_2;
short param_3;

{
  ushort uVar1;
  ushort uVar2;
  short sVar3;
  ushort *puVar4;
  uint uVar5;
  uint uVar6;
  ushort *local_18;
  
  if ((((*param_2 & 0x8000) != 0) || (local_18 = param_2 + 3, (*local_18 & 0xffc0) == 0)) ||
     (puVar4 = (ushort *)FUN_000537d0(&local_18,0,4,0,0xf), puVar4 == (ushort *)0x0)) {
    return 1;
  }
  uVar1 = *puVar4;
  if ((uVar1 & 0x200) == 0) {
    if (0 < param_3) {
      uVar2 = *param_2;
      if ((((uVar2 & 0x1f0) != 0x140) || ((uVar2 & 0xf) < 8)) &&
         (((uVar2 & 0x1f0) != 0x80 || ((0xb < (uVar2 & 0xf) || ((uVar2 & 1) == 0)))))) {
        if ((puVar4[3] >> 6 & 0x1ff) != (int)param_3) {
          return 0;
        }
        *(char *)puVar4 = (char)uVar1;
        *(byte *)((char *)puVar4 + 1) = (byte)(uVar1 >> 8) | 2;
        return 2;
      }
    }
    return 4;
  }
  uVar6 = (uint)param_3;
  if ((int)uVar6 < 0) {
    uVar5 = (byte)puVar4[1] & 0x7f;
    if (((uVar5 != 0xe) || (0x1e < (int)-uVar6)) &&
       ((uVar5 != 0xf &&
        (sVar3 = roll_skill_check((int)(uVar6 * -0x10000) >> 0x10,((byte)puVar4[1] & 0x7f) * 3),
        0 < sVar3)))) {
LAB_0007c130:
      FUN_0007c2ec(param_1,param_2,6,(int)DAT_002020a0,DAT_002020a4);
      if ((*puVar4 & 0x400) == 0) {
        object_list_unlink(local_18,puVar4);
        free_object_slot(puVar4);
      }
      else {
        uVar6 = *puVar4 & 0xfdff;
        *(char *)puVar4 = (char)uVar6;
        *(char *)((char *)puVar4 + 1) = (char)(uVar6 >> 8);
      }
      return 3;
    }
  }
  else if (((0 < (int)uVar6) && ((puVar4[3] & 0x7fc0) != 0)) && ((puVar4[3] >> 6 & 0x1ff) == uVar6))
  goto LAB_0007c130;
  return 0;
}







// was FUN_00073b40 -- looks up tile-type id param_1 (0..0x34) in a
// per-type 4-byte-stride table (DAT_00087530/DAT_00087533) to get a
// "special action" type/id pair, then forwards to dispatch_special_action
// with param_2/param_3 as the actor object and an extra parameter.
void dispatch_tile_special_action(param_1,param_2,param_3)
uint param_1;
undefined4 param_2;
undefined4 param_3;

{
  param_1 = param_1 & 0xff;
  if (param_1 < 0x35) {
    dispatch_special_action((byte)(&DAT_00087530)[param_1 * 4] >> 3,(&DAT_00087533)[param_1 * 4],param_2,
                 param_3);
  }
  return;
}



// was FUN_00073b74 -- the general "SPECIAL" action dispatcher (see
// the SPECIAL ILLUSTRATED BOOK/SCROLL comment elsewhere in this file
// for one example caller shape). param_1&0xff selects the action type
// (0-0xe, a case switch); param_3 is the acting object (an object
// pointer when >= DAT_002046c4/uw_object_hdr_t's own table base and
// param_1<=0xb, else treated as something else and the no-magic tile
// check uses fixed coordinates DAT_0023c3dc/DAT_0023c3d8 instead of
// the object's own position). Gates on tile_is_no_magic for most
// action types (magic-disallowed tiles suppress the action), then
// dispatches per type: teleport/message/sign display (0-3, via
// FUN_000542f8), a "hold param_4 as cursor item" variant (4), pick-up
// (5), several object-modifying handlers (6-10), a scheduled-drop
// variant (0xb), a no-op (0xc), player status-effect toggles (0xd),
// and a generic dialog-box trigger plus scheduler tick (0xe). Full
// semantics of each numbered handler not traced individually.
undefined4 dispatch_special_action(param_1,param_2,param_3,param_4)
uint param_1;
uint param_2;
uint param_3;
int param_4;

{
  undefined2 uVar1;
  int iVar2;

  if ((param_3 < DAT_002046c4) || (0xb < (param_1 & 0xff))) {
    iVar2 = tile_is_no_magic(*(ushort *)(param_3 + 0x16) >> 10,
                         (*(ushort *)(param_3 + 0x16) & 0x3f0) >> 4);
    if (iVar2 != 0) {
      return 0;
    }
    if (DAT_00201b68 == 9) {
      return 0;
    }
  }
  else {
    iVar2 = tile_is_no_magic(DAT_0023c3dc,DAT_0023c3d8);
    if (iVar2 != 0) {
      return 0;
    }
  }
  switch(param_1 & 0xff) {
  case 0:
    goto LAB_00073c90;
  case 1:
    if (((param_2 & 0x3f) == 3) || ((param_2 & 0x3f) == 5)) {
      FUN_0003dba0(param_3);
    }
    goto LAB_00073c90;
  case 2:
    goto LAB_00073c90;
  case 3:
LAB_00073c90:
    if ((param_3 != g_player_object) ||
       (iVar2 = FUN_000542f8(param_1,param_2 & 0x3f,param_2 & 0xc0), iVar2 == 0)) {
      return 0;
    }
    break;
  case 4:
    if (param_4 == 0) {
      return 0;
    }
    apply_healing_item_effect(param_4,param_2);
    return 1;
  case 5:
    if (param_3 == g_player_object) {
      g_cursor_holding_state = 3;
      DAT_00202094 = param_2 & 0xff;
      DAT_00202098 = g_player_object;
      FUN_00057c5c(0x1075);
    }
    else {
      apply_targeted_spell_effect(param_3,param_2);
    }
    break;
  case 6:
    FUN_00074c64(param_3,param_2);
    break;
  case 7:
    FUN_00074cc8(param_3,param_2);
    break;
  case 8:
    FUN_00074d20(param_3,param_2);
    break;
  case 9:
    reduce_item_quality_on_use(param_3,param_2);
    break;
  case 10:
    adjust_level7_hazard_value(param_3,param_2);
    break;
  case 0xb:
    FUN_00075808(param_3,param_2 & 0xffffffc0,param_2 & 0x3f);
    break;
  case 0xc:
    break;
  case 0xd:
    if ((param_2 & 0xff) == 3) {
      FUN_00039f04(4,0,0);
    }
    else if ((param_2 & 0xff) == 5) {
      FUN_00078c80(0xe4);
      uVar1 = *(undefined2 *)(DAT_00086df8 + 0x61);
      *(byte *)(DAT_00086df8 + 0x61) = (byte)uVar1 | 0xc;
      *(char *)(DAT_00086df8 + 0x62) = (char)((ushort)uVar1 >> 8);
      refresh_player_equipment_effects();
    }
    break;
  case 0xe:
    FUN_00037c14(param_2 & 0xff);
    scheduler_tick(4);
  }
  return 1;
}






// was FUN_00074028 -- dispatch_special_action's "reduce item
// durability" handler (its own case 9): only applies if the target
// object's quality bits match 0x40 (same food/potion-shaped flag
// apply_healing_item_effect gates on) and its quality/charge field
// (offset 4, byte) is currently above 3. Rolls param_2 d8s
// (roll_dice_sum) and subtracts the result, clamped to a floor of 3
// rather than letting it drop lower. Plays a sound if the target is
// the player object.
void reduce_item_quality_on_use(param_1,param_2)
ushort * param_1;
char param_2;

{
  byte bVar1;
  char cVar2;
  
  if ((*param_1 & 0x1c0) == 0x40) {
    cVar2 = roll_dice_sum((int)param_2,8);
    bVar1 = (byte)param_1[4];
    if (3 < bVar1) {
      if ((int)((uint)bVar1 - (int)cVar2) < 4) {
        cVar2 = '\x03';
      }
      else {
        cVar2 = bVar1 - cVar2;
      }
      *(char *)(param_1 + 4) = cVar2;
      if (param_1 == g_player_object) {
        FUN_000411e0(0xa8);
      }
    }
  }
  return;
}





// was FUN_000740b0 -- dispatch_special_action's case 5 ("spawn a
// targeted spell-effect object") worker: param_2 (1-4) selects one of
// four effect-object subtypes {7,5,4,6} and FUN_0004a588 spawns that
// object near/at param_1's location (returning whether the spawn
// succeeded). If param_1 is the player and the spawn failed, prints
// a "no effect" scroll message (id 0xff) via FUN_00078c80. Otherwise,
// if a mana cost was staged in DAT_0023c3e0 (set by whatever queued
// this cast), deducts it from the player's mana stat
// (DAT_00086df8+0x37, "play_mana" -- see babl.c's own read of the
// same offset). DAT_0023c3e0 is always cleared back to 0 afterward.
void apply_targeted_spell_effect(param_1,param_2)
int param_1;
char param_2;

{
  int iVar1;
  undefined1 auStack_d [5];

  auStack_d[1] = 7;
  auStack_d[2] = 5;
  auStack_d[3] = 4;
  auStack_d[4] = 6;
  iVar1 = FUN_0004a588(param_1,auStack_d[param_2]);
  if (param_1 == g_player_object) {
    if (iVar1 == 0) {
      FUN_00078c80(0xff);
    }
    else if (DAT_0023c3e0 != '\0') {
      *(char *)(DAT_00086df8 + 0x37) = *(char *)(DAT_00086df8 + 0x37) - DAT_0023c3e0;
    }
    DAT_0023c3e0 = '\0';
  }
  return;
}





void *spawn_and_prime_spell_effect_object(param_1,param_2)
/* Was `int spawn_and_prime_spell_effect_object(...)` -- returned spawn_new_object's real object
   pointer through a 32-bit int, truncated on this host; both callers
   (cast_single_tile_spell_effect, cast_area_spell_effect) also stored it into a 32-bit undefined4
   before dereferencing it via encode_object_slot_index/
   object_list_insert_head, same class of fix applied there too. */
undefined4 param_1;
byte * param_2;

{
  uint uVar1;
  undefined2 uVar2;
  byte bVar3;
  char *iVar4;
  undefined4 uVar5;
  char extraout_r1;
  byte bVar6;

  iVar4 = (char *)spawn_new_object(param_1,0);
  bVar6 = (*param_2 >> 4) * '\b';
  uVar1 = (int)((uint)(*param_2 >> 4) << 0x13) >> 0x10;
  if (uVar1 < 0x80) {
    uVar5 = Ordinal_1053();
    Ordinal_2005(0x80 - uVar1,uVar5);
    bVar6 = bVar6 + extraout_r1;
  }
  uVar2 = *(undefined2 *)(iVar4 + 2);
  bVar3 = (byte)uVar2;
  *(byte *)(iVar4 + 2) = (bVar3 ^ bVar6) & 0x7f ^ bVar3;
  *(char *)(iVar4 + 3) = (char)((ushort)uVar2 >> 8);
  return iVar4;
}



// was FUN_000741f0 -- forcibly unlocks a target object: bails out if
// the object already has bit 0x8000 set, if its "lock" field (offset
// +3, bits 0xffc0) is zero (nothing to unlock), or if it's a
// disallowed class (0x1c0 == 0x180). Otherwise looks up the
// container/link (FUN_000537d0) and, IF found, temporarily forces the
// player's pick-locks skill byte (DAT_00086df8+0x2c) to a guaranteed-
// pass value (0x2d) before invoking force_unlock_target_object's
// underlying "use item on object" resolver (FUN_0007cdbc, action code
// 5 == unlock) so the skill check it performs against the lock's
// difficulty always succeeds, then restores the real skill byte
// afterward. Used for scripted/guaranteed unlocks (e.g. an "unlock"
// spell) rather than a real skill-gated lockpick attempt (see
// roll_container_lockpick_check in src/interact.c for that path).
undefined4 force_unlock_target_object(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
ushort * param_3;

{
  undefined1 uVar1;
  int iVar2;
  ushort *local_14;
  
  if (((((*param_3 & 0x8000) == 0) && (local_14 = param_3 + 3, (*local_14 & 0xffc0) != 0)) &&
      ((*param_3 & 0x1c0) != 0x180)) && (iVar2 = FUN_000537d0(&local_14,0,6,2,3), iVar2 != 0)) {
    uVar1 = *(undefined1 *)(DAT_00086df8 + 0x2c);
    *(undefined1 *)(DAT_00086df8 + 0x2c) = 0x2d;
    FUN_0007cdbc(g_player_object,param_3,iVar2,5);
    *(undefined1 *)(DAT_00086df8 + 0x2c) = uVar1;
    return 1;
  }
  return 0;
}



// was FUN_000742c0 -- casts a single-tile spell effect at tile
// (param_1,param_2): spawns a type-0x1c5 effect object via
// spawn_and_prime_spell_effect_object, applies its damage to just
// that one tile (FUN_00075a88 with damage-tier index 2-1=1), then
// schedules the effect object to tick (scheduler_add_entry, type 4)
// with a pseudo-random 0-3 initial delay. On schedule failure frees
// the object slot; otherwise links it into param_4's object list.
undefined4 cast_single_tile_spell_effect(param_1,param_2,param_3,param_4,param_5)
uint param_1;
undefined4 param_2;
undefined4 param_3;
int param_4;
undefined1 param_5;

{
  int uw_ord2005_rem_153 = 0;
  short sVar1;
  char *uVar2;  /* was `undefined4` -- truncated spawn_and_prime_spell_effect_object's pointer */
  undefined4 uVar3;
  undefined4 uVar4;
  uint extraout_r1;
  undefined1 uVar5;

  uVar2 = (char *)spawn_and_prime_spell_effect_object(0x1c5,param_4);
  FUN_00075a88(param_1,param_2,2,param_5);
  uVar3 = Ordinal_1053();
  uVar4 = encode_object_slot_index(uVar2);
  uVar5 = (undefined1)param_2;
  uw_ord2005_rem_153 = ((int)(uVar3)) % (4);
  sVar1 = scheduler_add_entry(uVar4,4,uw_ord2005_rem_153 & 0xff,param_1 & 0xff,uVar5);
  if (sVar1 == -1) {
    free_object_slot(uVar2);
  }
  else {
    object_list_insert_head(param_4 + 2,uVar2);
  }
  return 1;
}



// was FUN_00074380 -- casts an area spell effect centered on tile
// (param_1,param_2): spawns a type-0x1c2 effect object via
// spawn_and_prime_spell_effect_object, applies damage (FUN_00075a88,
// damage-tier index 1-1=0) to that tile and its four cardinal
// neighbors (a 5-tile cross/"area" pattern), then schedules the
// effect object to tick (scheduler_add_entry, type 4, delay 0). On
// schedule failure frees the object slot; otherwise links it into
// param_4's object list and calls FUN_00081388 (not yet named --
// likely kicks off the effect's ongoing spread/animation).
undefined4 cast_area_spell_effect(param_1,param_2,param_3,param_4,param_5)
uint param_1;
int param_2;
undefined4 param_3;
int param_4;
undefined1 param_5;

{
  short sVar1;
  char *uVar2;  /* was `undefined4` -- truncated spawn_and_prime_spell_effect_object's pointer */
  undefined4 uVar3;

  uVar2 = (char *)spawn_and_prime_spell_effect_object(0x1c2,param_4);
  FUN_00075a88(param_1,param_2,1,param_5);
  FUN_00075a88(param_1 + 1,param_2,1,param_5);
  FUN_00075a88(param_1 - 1,param_2,1,param_5);
  FUN_00075a88(param_1,param_2 + 1,1,param_5);
  FUN_00075a88(param_1,param_2 + -1,1,param_5);
  uVar3 = encode_object_slot_index(uVar2);
  sVar1 = scheduler_add_entry(uVar3,4,0,param_1 & 0xff,(char)param_2);
  if (sVar1 == -1) {
    free_object_slot(uVar2);
  }
  else {
    object_list_insert_head(param_4 + 2,uVar2);
    FUN_00081388(uVar2,param_1,param_2);
  }
  return 1;
}





// was FUN_00074474 -- gated trap/effect trigger: FUN_000382cc (not
// yet named) is the shared per-object-type-flags helper used
// throughout this cluster -- with a real multi-bit damage-type mask
// and nonzero low bits it's a genuine resistance roll (see
// morph_tile_object_state below), but called here with a single flag
// bit (0x80) and a dummy pass-value (1) it works as a plain
// membership test: it returns 0 when the target's object-type record
// (DAT_00202c99, same 13-byte-stride per-type table used by
// dispatch_object_action) HAS bit 0x80 set, and the nonzero pass-value
// when it doesn't. This function fires ONLY on the "has the flag"
// (0) case, applying a fixed damage-type-3, magnitude-0xff effect
// (FUN_00038374, not yet named) to the target -- i.e. it's a trap
// effect that only harms objects whose type carries that particular
// flag. Returns whether the object had the flag.
bool trigger_type_flagged_trap_effect(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;
undefined1 param_5;

{
  char cVar1;
  undefined4 uVar2;
  
  cVar1 = FUN_000382cc(param_3,1,0x80);
  if (cVar1 == '\0') {
    uVar2 = FUN_000535fc(param_5);
    FUN_00038374(param_3,uVar2,param_1,param_2,0xff,3);
  }
  return cVar1 == '\0';
}



// was FUN_000744e0 -- unconditional tile-trap damage effect at tile
// (param_1,param_2): first alters the tile's texture/decoration
// (FUN_00081814, not yet named -- group 7, subtype 4), then rolls
// 5d4 damage and applies it to the target object (param_3) via
// FUN_00038374 (damage type id 0x13), which internally still runs
// the same resistance/flag check as trigger_type_flagged_trap_effect
// above -- so a target immune to type 0x13 can still take zero
// effective damage even though this function always "fires".
undefined4 trigger_tile_damage_trap_effect(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;
undefined1 param_5;

{
  undefined1 uVar1;
  undefined4 uVar2;
  undefined1 uVar3;
  undefined2 uVar4;
  undefined1 uVar5;
  
  uVar3 = 0;
  uVar4 = (undefined2)param_1;
  FUN_00081814(param_3,7,4,0,7,uVar4,(short)param_2);
  uVar5 = (undefined1)((ushort)uVar4 >> 8);
  uVar1 = roll_dice_sum(5,4);
  uVar2 = FUN_000535fc(param_5);
  FUN_00038374(param_3,uVar2,param_1,param_2,CONCAT11(uVar3,uVar1),CONCAT11(uVar5,0x13));
  return 1;
}



// was FUN_0007455c -- resistance-gated object-state morph: runs a
// real resistance roll via FUN_000382cc (mask 3, i.e. the random
// partial-resist chance bits) against the target object (param_3);
// if not resisted, alters the tile's texture/decoration
// (FUN_00081814, group 7, subtype 4) and plays an effect on the
// target (FUN_00034ac4), then -- unless param_2 is -1 ("no change")
// -- overwrites the top 2 bits of the object's quality/link field
// (offset +0xd/+0xe, a ushort) with param_2, leaving the lower 14
// bits untouched. Used by the three thin wrappers immediately below
// with different fixed state ids (2, 6, 7).
undefined4 morph_tile_object_state(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
char param_2;
int param_3;
undefined2 param_4;
undefined2 param_5;

{
  char cVar1;
  uint uVar2;
  
  cVar1 = FUN_000382cc(param_3,1,3);
  if (cVar1 != '\0') {
    FUN_00081814(param_3,7,4,0,7,param_4,param_5);
    FUN_00034ac4(param_3,param_1,1);
    if ((int)param_2 != 0xffffffff) {
      uVar2 = *(ushort *)(param_3 + 0xd) & 0x3fff;
      *(char *)(param_3 + 0xd) = (char)uVar2;
      *(byte *)(param_3 + 0xe) = (byte)(uVar2 >> 8) | (byte)((((int)param_2 & 3U) << 0xe) >> 8);
    }
  }
  return 1;
}





// was FUN_00074614 -- resistance-gated, one-time-effect object-state
// trigger: like morph_tile_object_state, runs a real resistance roll
// (FUN_000382cc, mask 3) before acting. On success, alters the
// tile's texture/decoration (FUN_00081814) and, only the FIRST time
// (guarded by flag bit 0x40 at offset +0x19, which it then sets
// permanently), plays an effect on the target (FUN_00034ac4). Always
// sets the object's quality/link field (offset +0xd/+0xe) top 2 bits
// to 3 (0xc0), unlike morph_tile_object_state's caller-supplied
// state id -- this variant hardcodes a single fixed end state.
undefined4 trigger_permanent_object_state_effect(param_1,param_2,param_3)
undefined2 param_1;
undefined2 param_2;
int param_3;

{
  char cVar1;
  
  cVar1 = FUN_000382cc(param_3,1,3);
  if (cVar1 != '\0') {
    FUN_00081814(param_3,7,4,0,7,param_1,param_2);
    if ((*(byte *)(param_3 + 0x19) & 0x40) == 0) {
      FUN_00034ac4(param_3,2,0);
    }
    *(byte *)(param_3 + 0x19) = *(byte *)(param_3 + 0x19) | 0x40;
    *(undefined1 *)(param_3 + 0xd) = *(undefined1 *)(param_3 + 0xd);
    *(byte *)(param_3 + 0xe) = *(byte *)(param_3 + 0xe) | 0xc0;
  }
  return 1;
}



// was FUN_000746b0 -- thin wrapper: morph_tile_object_state with
// texture/effect variant 2 and object-state id 1.
void apply_tile_morph_variant_2(param_1,param_2,param_3)
undefined4 param_1;
undefined2 param_2;
undefined4 param_3;

{
  morph_tile_object_state(2,1,param_3,param_1,param_2);
  return;
}



// was FUN_000746d4 -- thin wrapper: morph_tile_object_state with
// texture/effect variant 6 and object-state id -1 ("no change" --
// this variant only affects the tile's texture/decoration, not the
// target object's quality/link field).
void apply_tile_morph_variant_6(param_1,param_2,param_3)
undefined4 param_1;
undefined2 param_2;
undefined4 param_3;

{
  morph_tile_object_state(6,0xffffffff,param_3,param_1,param_2);
  return;
}



// was FUN_000746f8 -- thin wrapper: morph_tile_object_state with
// texture/effect variant 7 and object-state id 1.
void apply_tile_morph_variant_7(param_1,param_2,param_3)
undefined4 param_1;
undefined2 param_2;
undefined4 param_3;

{
  morph_tile_object_state(7,1,param_3,param_1,param_2);
  return;
}
