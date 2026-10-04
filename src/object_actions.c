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

#define DAT_00085cd8 DAT_00085cd8_backing[0]
#define DAT_00085cb4 DAT_00085cb4_backing[0]
static undefined *DAT_001007c8;
undefined1 DAT_0023c3dc;
undefined1 DAT_0023c3d8;
/* Ghidra recovered this as "You_see" (underscores, no trailing space);
   it's the "You see " prefix the look/identify code prepends to an
   object/terrain name, so the real bytes are "You see " with a trailing
   space (see describe_picked_terrain: message_scroll_print_wrapped(this) then the
   name then "."). */
char s_You_see_000858fc[] = "You see ";
static char s_belonging_to_00085c90[] = "belonging to ";
 undefined1 DAT_0023ce70_backing[8192];
ushort DAT_00202508;
ushort DAT_002022f8;
static ushort DAT_00202300;
static ushort DAT_00202304;
int DAT_002022fc;
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
static char s_cursed_00085ca0[] = "cursed";
static char s_magical_00085ca8[] = "magical";
static char s_full_charge_00085cb8[] = "full_charge";
static undefined DAT_00085cc8;
static char s_with_00085cd0[] = "with";
static undefined DAT_00085cd8_backing[8192];
static undefined4 DAT_0024cfcc;
static undefined1 DAT_00085ccc;
static undefined1 DAT_00085ccd;
static undefined1 DAT_00085cce;
static undefined DAT_00085cb4_backing[8192];
static char s__DATA_grave_dat_00085cf8[] = "\\DATA\\grave.dat";
static char s_an_adventurer__00085d08[] = "an_adventurer.";
static uint DAT_00202094;
undefined1 DAT_00087604_backing[65536];
undefined *PTR_FUN_00087614;
static undefined DAT_0008762c_backing[8192];
#define DAT_0008762c DAT_0008762c_backing[0]
#define DAT_00087630 DAT_0008762c_backing[4]
#define DAT_00087634 DAT_0008762c_backing[8]
static char s_very_near_00087954[] = "very_near";






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
     acStack_7c and taking the fortified strcat (ce_strcat) down with
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
  if (!g_object_type_props[*param_1 & 0x1ff].has_look_description) {
    if ((*param_1 & 0x1f0) == 0x160) {
      look_at_inscribed_object(param_1,param_2);
    }
    goto LAB_00048b58;
  }
  if (((short)param_2 == 3) && (iVar5 = identify_mushroom_type(param_1,&DAT_00202c90 + iVar9), iVar5 != 0)) {
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
     NUL-terminated before its first strcat (ce_strcat) below, so
     leftover content from a PREVIOUS look call's stack frame could
     survive and get concatenated onto -- "Multiple Looks will also
     print them together like 'a sackasack'". Fix both: clear acStack_7c
     and seed it with the real "You see " prefix here instead. */
  acStack_7c[0] = '\0';
  ce_strcat(acStack_7c, s_You_see_000858fc);
  acStack_ac[0] = '\0';
  iVar5 = append_object_property_tag(param_1,param_2,acStack_ac);
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
  pcVar6 = (char *)get_message_string(((byte)(&DAT_00202c9b)[iVar9] & 0xf) * 6 + iVar5 | 0xa00);
  if (pcVar6 != (char *)0x0) {
    cVar2 = *pcVar6;
    if (cVar2 != '\0') {
      iVar5 = ce_strlen(pcVar6);
      ce_memmove(acStack_9c,pcVar6,iVar5 + 1);
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
    uVar7 = _itoa(uVar3 >> 6,auStack_b4,10);
    ce_strcat(acStack_7c,uVar7);
    puVar8 = &DAT_00085240;
LAB_000489fc:
    ce_strcat(acStack_7c,puVar8);
  }
  if (acStack_9c[0] != '\0') {
    ce_strcat(acStack_7c,acStack_9c);
    ce_strcat(acStack_7c,&DAT_00085240);
  }
  if (acStack_ac[0] != '\0') {
    ce_strcat(acStack_7c,acStack_ac);
  }
  iVar9 = ce_strlen(acStack_7c);
  build_object_display_name(acStack_7c + iVar9,param_1,cVar10 == '\0',uVar11);
  append_object_special_name(param_1,param_2,acStack_7c);
  if (((g_object_type_props[*param_1 & 0x1ff].is_container) &&
      (bVar1 = (byte)param_1[3], (bVar1 & 0x3f) != 0)) && ((bVar1 & 0x1f) < 0x1c)) {
    ce_strcat(acStack_7c,s_belonging_to_00085c90);
    /* uVar11 is `undefined4` (reused as a flag above); assigning get_message_string's
       char* to it truncated the pointer -> ce_strcat (strcat) walked a wild
       address, crashing a right-click "look" at any owned container (the
       spawn-room sack). Use the char* local. */
    pcVar6 = get_message_string((bVar1 & 0x1f) + 0x172 | 0x200);
    ce_strcat(acStack_7c,pcVar6);
  }
  ce_strcat(acStack_7c,&DAT_00084f20);
  /* No trailing newline was ever appended, so back-to-back Looks (the
     scroll's own line-break logic, msg_scroll_split_newline_segments, only breaks on an
     embedded '\n' -- ASCII 10 -- byte) all landed on the same visible
     line: confirmed live, 3 Looks at the sack rendered as one run-on
     "You see a sackYou see a sackYou see a sack" instead of 3 separate
     lines. */
  ce_strcat(acStack_7c,"\n");
  message_scroll_print_wrapped(acStack_7c);
LAB_00048b58:
  describe_special_object_property(param_1,param_2);
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
  char *uVar7; /* decompress_gr_bitmap's real return type -- was undefined4, truncating it */
  byte *pbVar8;
  int iVar9;
  int iVar10;
  byte *pbVar11;
  void **piVar12;
  /* iVar5 above is a real int (file handle) for open_file_for_read's return,
     reused later in this same function as if it held ce_malloc's
     `void *` return (the decoded glyph buffer) -- same "reused scalar"
     bug already fixed in look_at_inscribed_object this session. Separate real
     pointer local for that use. */
  void *pvVar_glyphbuf;

  pbVar11 = uw_load_critter_page_cached(param_1, param_2);
  if (pbVar11 == (byte *)0) {
    /* Missing/unopenable per-page resource file -- was an unconditional
       terminate_process(0xffffffff) hard exit (only reachable for a real
       object, class 1, that no object in the previously-tested level
       area happened to use -- confirmed via lldb backtrace: reached
       from emit_tile_objects's class-1 branch via resolve_critter_sprite_tier, one
       specific door ~17 tiles from spawn). Same "graceful skip instead
       of crash" treatment already used for other missing/unregistered
       resources this session (lookup_grtile_by_id, blit_object_sprite_by_frame) -- return the
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
       0x7fff-byte ce_malloc allocation; -3 keeps every access below
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
      /* The original decoder accepts the page's full byte-sized dimensions.
         Goblin combat frames legitimately exceed 64 pixels (e.g. direction
         3, frame 3 is 68x44). Rejecting those after updating the dimensions
         left the previous texture paired with the new size, garbling it. */
      uVar7 = decompress_gr_bitmap(pbVar11 + 5,pbVar8 + param_4 * 0x20 + 1,pbVar11[4]);
      if (getenv("UW_DEBUG_CRITTER") && uVar7) {
        fprintf(stderr, "[critter] decode_critter_sprite_page: decoded row bytes[0..15]:");
        for (int _i = 0; _i < 16; _i++) fprintf(stderr, " %02x", (unsigned char)uVar7[_i]);
        fprintf(stderr, "\n");
      }
      pvVar_glyphbuf = ce_malloc((int)(short)DAT_002022f8 * (int)(short)DAT_00202508);
      iVar10 = (int)(short)DAT_002022f8;
      iVar9 = (int)(short)DAT_00202508;
      piVar12 = &DAT_002020f8 + iVar1;
      *piVar12 = pvVar_glyphbuf;
      ce_memset(pvVar_glyphbuf,0,iVar10 * iVar9);
      ce_memmove(*piVar12,uVar7,(int)(short)DAT_002022f8 * (int)(short)DAT_00202508);
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
// recovered signature took none, so it silently called calculate_object_weight()
// bare too instead of forwarding it -- calculate_object_weight's very first line
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

  sVar1 = calculate_object_weight(param_1);
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
  if (!g_object_type_props[*param_1 & 0x1ff].has_look_description) {
    if ((*param_1 & 0x1f0) == 0x160) {
      look_at_inscribed_object(param_1,param_2);
    }
    goto LAB_00048b58;
  }
  if (((short)param_2 == 3) && (iVar5 = identify_mushroom_type(param_1,&DAT_00202c90 + iVar9), iVar5 != 0)) {
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
  iVar5 = append_object_property_tag(param_1,param_2,local_ac);
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
  pcVar6 = (char *)get_message_string(((byte)(&DAT_00202c9b)[iVar9] & 0xf) * 6 + iVar5 | 0xa00);
  if (pcVar6 != (char *)0x0) {
    cVar2 = *pcVar6;
    if (cVar2 != '\0') {
      iVar5 = ce_strlen(pcVar6);
      ce_memmove(local_9c,pcVar6,iVar5 + 1);
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
    uVar7 = _itoa(uVar3 >> 6,auStack_b4,10);
    ce_strcat(acStack_7c,uVar7);
    puVar8 = &DAT_00085240;
LAB_000489fc:
    ce_strcat(acStack_7c,puVar8);
  }
  if (local_9c[0] != '\0') {
    ce_strcat(acStack_7c,local_9c);
    ce_strcat(acStack_7c,&DAT_00085240);
  }
  if (local_ac[0] != '\0') {
    ce_strcat(acStack_7c,local_ac);
  }
  iVar9 = ce_strlen(acStack_7c);
  build_object_display_name(acStack_7c + iVar9,param_1,cVar10 == '\0',uVar11);
  append_object_special_name(param_1,param_2,acStack_7c);
  if (((g_object_type_props[*param_1 & 0x1ff].is_container) &&
      (bVar1 = (byte)param_1[3], (bVar1 & 0x3f) != 0)) && ((bVar1 & 0x1f) < 0x1c)) {
    ce_strcat(acStack_7c,s_belonging_to_00085c90);
    /* uVar11 is `undefined4` (reused as a flag above); assigning get_message_string's
       char* to it truncated the pointer -> ce_strcat (strcat) walked a wild
       address, crashing a right-click "look" at any owned container (the
       spawn-room sack). Use the char* local. */
    pcVar6 = get_message_string((bVar1 & 0x1f) + 0x172 | 0x200);
    ce_strcat(acStack_7c,pcVar6);
  }
  ce_strcat(acStack_7c,&DAT_00084f20);
  /* No trailing newline was ever appended, so back-to-back Looks (the
     scroll's own line-break logic, msg_scroll_split_newline_segments, only breaks on an
     embedded '\n' -- ASCII 10 -- byte) all landed on the same visible
     line: confirmed live, 3 Looks at the sack rendered as one run-on
     "You see a sackYou see a sackYou see a sack" instead of 3 separate
     lines. */
  ce_strcat(acStack_7c,"\n");
  message_scroll_print_wrapped(acStack_7c);
LAB_00048b58:
  describe_special_object_property(param_1,param_2);
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
  /* ARM 0x4b2d0/0x4b310: slot at byte 10, radius at byte 8.
     DAT_00202c6c is a byte pointer; Ghidra's word indices need scaling. */
  *(byte *)(DAT_00202c6c + 10) = (byte)uVar3;
  *(byte *)((char *)DAT_00202c6c + 0xb) = (byte)((ushort)uVar3 >> 8);
  iVar5 = (short)(uVar2 & 0x1ff) * 0xd;
  *(byte *)(DAT_00202c6c + 8) = (&DAT_00202c91)[iVar5] & 7;
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
    if ((byte)DAT_00202c6c[20] != 0) {
      sort_collision_candidates();
      if (*(byte *)((char *)DAT_00202c6c + 0x15) != 0) goto LAB_0004b4d4;
    }
    uVar2 = param_1[0xb];
    uVar6 = uVar2 & 0x3ff;
    /* ARM 0x4b4e4..0x4b5d0 reads full X/Y words at bytes 0/2;
       byte reads discarded X's high bits and used X's high byte as Y. */
    uVar7 = ((int)(short)(*(ushort *)DAT_00202c6c & 0x1f8) >> 3) << 10;
    *(char *)(param_1 + 0xb) = (char)uVar6;
    *(byte *)((char *)param_1 + 0x17) = (byte)(uVar6 >> 8) | (byte)(uVar7 >> 8);
    uVar7 = uVar2 & 0xf | uVar7 | ((int)(short)(*(ushort *)(DAT_00202c6c + 2) & 0x1f8) >> 3) << 4;
    *(char *)(param_1 + 0xb) = (char)uVar7;
    *(char *)((char *)param_1 + 0x17) = (char)(uVar7 >> 8);
    uVar7 = (uint)CONCAT11(*(undefined1 *)((char *)param_1 + 3),(char)param_1[1]);
    uVar6 = uVar7 & 0x1fff;
    bVar1 = (byte)((((byte)*DAT_00202c6c & 7) << 0xd) >> 8);
    *(char *)(param_1 + 1) = (char)uVar6;
    *(byte *)((char *)param_1 + 3) = (byte)(uVar6 >> 8) | bVar1;
    uVar2 = *(ushort *)(DAT_00202c6c + 2);
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
     (puVar4 = (ushort *)find_object_in_chain(&local_18,0,4,0,0xf), puVar4 == (ushort *)0x0)) {
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
      trigger_object_trap_or_use_action(param_1,param_2,6,(int)DAT_002020a0,DAT_002020a4);
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
// add_active_light_source), a "hold param_4 as cursor item" variant (4), pick-up
// (5), several object-modifying handlers (6-10), a scheduled-drop
// variant (0xb), a no-op (0xc), player status-effect toggles (0xd),
// and a generic dialog-box trigger plus scheduler tick (0xe). Full
// semantics of each numbered handler not traced individually.
undefined4 dispatch_special_action(param_1,param_2,param_3,param_4)
uint param_1;
uint param_2;
uintptr_t param_3;
intptr_t param_4;

{
  undefined2 uVar1;
  int iVar2;

  /* ARM 0x73b74 receives object addresses in r2/r3 and reads the actor's
     position at +0x16. Keep these address-sized on the native host: Ghidra's
     uint/int declarations truncated the player pointer during rune casts. */
  if ((param_3 < (uintptr_t)DAT_002046c4) || (0xb < (param_1 & 0xff))) {
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
      trigger_player_jump_if_grounded(param_3);
    }
    goto LAB_00073c90;
  case 2:
    goto LAB_00073c90;
  case 3:
LAB_00073c90:
    if ((param_3 != (uintptr_t)g_player_object) ||
       (iVar2 = add_active_light_source(param_1,param_2 & 0x3f,param_2 & 0xc0), iVar2 == 0)) {
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
    if (param_3 == (uintptr_t)g_player_object) {
      g_cursor_holding_state = 3;
      DAT_00202094 = param_2 & 0xff;
      DAT_00202098 = g_player_object;
      push_cursor_icon(0x1075);
    }
    else {
      apply_targeted_spell_effect((ushort *)param_3,param_2);
    }
    break;
  case 6:
    cast_cone_damage_spell(param_3,param_2);
    break;
  case 7:
    cast_targeted_search_effect(param_3,param_2);
    break;
  case 8:
    cast_summon_or_spawn_effect(param_3,param_2);
    break;
  case 9:
    reduce_item_quality_on_use(param_3,param_2);
    break;
  case 10:
    adjust_level7_hazard_value(param_3,param_2);
    break;
  case 0xb:
    dispatch_player_command(param_3,param_2 & 0xffffffc0,param_2 & 0x3f);
    break;
  case 0xc:
    break;
  case 0xd:
    if ((param_2 & 0xff) == 3) {
      handle_level4_maze_puzzle_button(4,0,0);
    }
    else if ((param_2 & 0xff) == 5) {
      print_scroll_message_by_id(0xe4);
      uVar1 = *(undefined2 *)(DAT_00086df8 + 0x61);
      *(byte *)(DAT_00086df8 + 0x61) = (byte)uVar1 | 0xc;
      *(char *)(DAT_00086df8 + 0x62) = (char)((ushort)uVar1 >> 8);
      refresh_player_equipment_effects();
    }
    break;
  case 0xe:
    display_book_or_scroll_page(param_2 & 0xff);
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
        weapon_overlay_flash_once(0xa8);
      }
    }
  }
  return;
}





// was FUN_000740b0 -- dispatch_special_action's case 5 ("spawn a
// targeted spell-effect object") worker: param_2 (1-4) selects one of
// four effect-object subtypes {7,5,4,6} and spawn_object_near_actor spawns that
// object near/at param_1's location (returning whether the spawn
// succeeded). If param_1 is the player and the spawn failed, prints
// a "no effect" scroll message (id 0xff) via print_scroll_message_by_id. Otherwise,
// if a mana cost was staged in DAT_0023c3e0 (set by whatever queued
// this cast), deducts it from the player's mana stat
// (DAT_00086df8+0x37, "play_mana" -- see babl.c's own read of the
// same offset). DAT_0023c3e0 is always cleared back to 0 afterward.
/* ARM passes the actor address unchanged through r0 (0x740e8 and 0x7ca1c).
   Keep it pointer-sized here: an int truncates the queued player's address
   before projectile placement on a 64-bit host. */
void apply_targeted_spell_effect(param_1,param_2)
ushort *param_1;
char param_2;

{
  int iVar1;
  undefined1 auStack_d [5];

  auStack_d[1] = 7;
  auStack_d[2] = 5;
  auStack_d[3] = 4;
  auStack_d[4] = 6;
  iVar1 = spawn_object_near_actor(param_1,auStack_d[param_2]);
  if (param_1 == g_player_object) {
    if (iVar1 == 0) {
      print_scroll_message_by_id(0xff);
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
    uVar5 = ce_rand();
    extraout_r1 = (char)ordint_divmod(0x80 - uVar1,uVar5).rem;
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
// container/link (find_object_in_chain) and, IF found, temporarily forces the
// player's pick-locks skill byte (DAT_00086df8+0x2c) to a guaranteed-
// pass value (0x2d) before invoking force_unlock_target_object's
// underlying "use item on object" resolver (resolve_skill_gated_unlock_or_use, action code
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
      ((*param_3 & 0x1c0) != 0x180)) && (iVar2 = find_object_in_chain(&local_14,0,6,2,3), iVar2 != 0)) {
    uVar1 = *(undefined1 *)(DAT_00086df8 + 0x2c);
    *(undefined1 *)(DAT_00086df8 + 0x2c) = 0x2d;
    resolve_skill_gated_unlock_or_use(g_player_object,param_3,iVar2,5);
    *(undefined1 *)(DAT_00086df8 + 0x2c) = uVar1;
    return 1;
  }
  return 0;
}



// was FUN_000742c0 -- casts a single-tile spell effect at tile
// (param_1,param_2): spawns a type-0x1c5 effect object via
// spawn_and_prime_spell_effect_object, applies its damage to just
// that one tile (damage_all_objects_at_tile with damage-tier index 2-1=1), then
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
  damage_all_objects_at_tile(param_1,param_2,2,param_5);
  uVar3 = ce_rand();
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
// spawn_and_prime_spell_effect_object, applies damage (damage_all_objects_at_tile,
// damage-tier index 1-1=0) to that tile and its four cardinal
// neighbors (a 5-tile cross/"area" pattern), then schedules the
// effect object to tick (scheduler_add_entry, type 4, delay 0). On
// schedule failure frees the object slot; otherwise links it into
// param_4's object list and calls spawn_effect_debris_burst to spawn
// a small burst of debris/particle objects around it.
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
  damage_all_objects_at_tile(param_1,param_2,1,param_5);
  damage_all_objects_at_tile(param_1 + 1,param_2,1,param_5);
  damage_all_objects_at_tile(param_1 - 1,param_2,1,param_5);
  damage_all_objects_at_tile(param_1,param_2 + 1,1,param_5);
  damage_all_objects_at_tile(param_1,param_2 + -1,1,param_5);
  uVar3 = encode_object_slot_index(uVar2);
  sVar1 = scheduler_add_entry(uVar3,4,0,param_1 & 0xff,(char)param_2);
  if (sVar1 == -1) {
    free_object_slot(uVar2);
  }
  else {
    object_list_insert_head(param_4 + 2,uVar2);
    spawn_effect_debris_burst(uVar2,param_1,param_2);
  }
  return 1;
}





// was FUN_00074474 -- gated trap/effect trigger: resolve_damage_type_resistance (not
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
// (apply_typed_damage_to_object, not yet named) to the target -- i.e. it's a trap
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
  
  cVar1 = resolve_damage_type_resistance(param_3,1,0x80);
  if (cVar1 == '\0') {
    uVar2 = get_object_record_by_slot_index(param_5);
    apply_typed_damage_to_object(param_3,uVar2,param_1,param_2,0xff,3);
  }
  return cVar1 == '\0';
}



// was FUN_000744e0 -- unconditional tile-trap damage effect at tile
// (param_1,param_2): first alters the tile's texture/decoration
// (spawn_scheduled_effect_object, group 7, subtype 4), then rolls
// 5d4 damage and applies it to the target object (param_3) via
// apply_typed_damage_to_object (damage type id 0x13), which internally still runs
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
  spawn_scheduled_effect_object(param_3,7,4,0,7,uVar4,(short)param_2);
  uVar5 = (undefined1)((ushort)uVar4 >> 8);
  uVar1 = roll_dice_sum(5,4);
  uVar2 = get_object_record_by_slot_index(param_5);
  apply_typed_damage_to_object(param_3,uVar2,param_1,param_2,CONCAT11(uVar3,uVar1),CONCAT11(uVar5,0x13));
  return 1;
}



// was FUN_0007455c -- resistance-gated object-state morph: runs a
// real resistance roll via resolve_damage_type_resistance (mask 3, i.e. the random
// partial-resist chance bits) against the target object (param_3);
// if not resisted, alters the tile's texture/decoration
// (spawn_scheduled_effect_object, group 7, subtype 4) and plays an effect on the
// target (npc_set_goal_for_object), then -- unless param_2 is -1 ("no change")
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
  
  cVar1 = resolve_damage_type_resistance(param_3,1,3);
  if (cVar1 != '\0') {
    spawn_scheduled_effect_object(param_3,7,4,0,7,param_4,param_5);
    npc_set_goal_for_object(param_3,param_1,1);
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
// (resolve_damage_type_resistance, mask 3) before acting. On success, alters the
// tile's texture/decoration (spawn_scheduled_effect_object) and, only the FIRST time
// (guarded by flag bit 0x40 at offset +0x19, which it then sets
// permanently), plays an effect on the target (npc_set_goal_for_object). Always
// sets the object's quality/link field (offset +0xd/+0xe) top 2 bits
// to 3 (0xc0), unlike morph_tile_object_state's caller-supplied
// state id -- this variant hardcodes a single fixed end state.
undefined4 trigger_permanent_object_state_effect(param_1,param_2,param_3)
undefined2 param_1;
undefined2 param_2;
int param_3;

{
  char cVar1;
  
  cVar1 = resolve_damage_type_resistance(param_3,1,3);
  if (cVar1 != '\0') {
    spawn_scheduled_effect_object(param_3,7,4,0,7,param_1,param_2);
    if ((*(byte *)(param_3 + 0x19) & 0x40) == 0) {
      npc_set_goal_for_object(param_3,2,0);
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





// was FUN_0007471c -- scans a rectangular tile area (top-left
// (param_5,param_6), size param_7 x param_8, clamped to the 0-63
// tilemap bounds) and invokes the callback param_3 ("codeval" --
// really a function pointer, matching this function's use as a babl
// script area-scan builtin, see scan_area_ahead_of_object below) on
// matching objects, up to param_1 matches before returning early.
// param_4 selects the scan mode: '@' walks each tile's floor-item
// slot directly (skipping empty ones, bit 0xf), calling the callback
// as (x,y,0,tile,param_2); anything else walks the full per-tile
// object linked list instead, filtering by param_4 (-0x80 = all
// objects, 0 = creatures only excluding a specific slot index
// param_2, -0x40 = a third mode) and calling the callback as
// (x,y,object,tile,param_2). Known caller: emit_noise_alert uses it
// as a "who can hear this sound" 15x15-tile scan around the noise
// source. See project_position_by_heading and
// scan_area_ahead_of_object for the "area in front of an object"
// variant built on top of this.
void scan_area_for_matching_objects(param_1,param_2,param_3,param_4,param_5,param_6,param_7,param_8)
char param_1;
byte param_2;
codeval * param_3;
char param_4;
char param_5;
char param_6;
char param_7;
char param_8;

{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  int iVar4;
  undefined4 uVar5;
  ushort *puVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int extraout_r1;
  int iVar10;
  char cVar11;
  int iVar12;
  ushort *puVar13;
  byte *pbVar14;
  int iVar15;
  int iVar16;
  bool bVar17;
  bool bVar18;
  short local_60;
  short local_5e;
  
  iVar1 = (int)param_5;
  local_5e = 0;
  if (((iVar1 < 0x40) && (iVar8 = iVar1 + param_7, -1 < iVar8)) &&
     (iVar10 = (int)param_6, iVar10 < 0x40)) {
    iVar12 = (int)param_8;
    iVar16 = iVar10 + param_8;
    if (-1 < iVar16) {
      if (iVar1 < 0) {
        param_7 = (char)((uint)(iVar8 * 0x1000000) >> 0x18);
        param_5 = '\0';
      }
      else if (0x3f < iVar8) {
        param_7 = '@' - param_5;
      }
      bVar17 = iVar10 < 0;
      bVar18 = iVar10 == 0;
      if (bVar17) {
        param_6 = '\0';
        iVar12 = iVar16 * 0x1000000 >> 0x18;
      }
      else {
        bVar18 = iVar16 == 0x40;
      }
      if (!bVar18 && (!bVar17 && 0x3f < iVar16)) {
        iVar12 = iVar10 << 0x18;
      }
      if (!bVar18 && (!bVar17 && 0x3f < iVar16)) {
        iVar12 = iVar12 >> 0x18;
      }
      cVar11 = (char)iVar12;
      iVar1 = (int)param_7;
      if (!bVar18 && (!bVar17 && 0x3f < iVar16)) {
        cVar11 = '@' - cVar11;
      }
      if ((0 < iVar1) && (iVar8 = (int)cVar11, 0 < iVar8)) {
        iVar12 = (int)param_6;
        iVar10 = (int)param_5;
        /* was folded into `int iVar16` (reused above for unrelated int
           values) -- truncated tilemap_lookup's real `void *` return */
        char *_tile16 = (char *)tilemap_lookup(iVar10,iVar12);
        iVar9 = iVar1 + param_5;
        do {
          local_60 = (short)iVar10;
          iVar7 = (int)local_60;
          if (iVar7 <= iVar9) {
            iVar4 = iVar8 + param_6;
            do {
              iVar15 = (int)(short)iVar12;
              if ((short)iVar12 <= iVar4) {
                do {
                  if (((-1 < iVar7) && (iVar7 < 0x40)) && ((-1 < iVar15 && (iVar15 < 0x40)))) {
                    pbVar14 = (byte *)(_tile16 + (((iVar15 - param_6) * 0x40 - (int)param_5) + iVar7)
                                                * 4);
                    if (param_4 == '@') {
                      if ((*pbVar14 & 0xf) != 0) {
                        uVar5 = ce_rand();
                        extraout_r1 = ordint_divmod(iVar8 * iVar1 + 3,uVar5).rem;
                        if (((extraout_r1 < param_1) &&
                            (iVar10 = (*param_3)((int)local_60,iVar12,0,pbVar14,param_2),
                            iVar10 != 0)) &&
                           (iVar10 = (param_1 + -1) * 0x1000000,
                           param_1 = (char)((uint)iVar10 >> 0x18), iVar10 >> 0x18 == 0)) {
                          return;
                        }
                      }
                    }
                    else {
                      puVar13 = (ushort *)(pbVar14 + 2);
                      puVar6 = (ushort *)resolve_object_link(puVar13);
                      while (puVar6 != (ushort *)0x0) {
                        uVar2 = *puVar13;
                        if (param_4 == -0x80) {
LAB_000749c4:
                          iVar10 = (*param_3)((int)local_60,iVar12,puVar6,pbVar14,param_2);
                          if ((iVar10 != 0) &&
                             (iVar10 = (int)param_1, param_1 = (char)(iVar10 + -1),
                             (iVar10 + -1) * 0x1000000 >> 0x18 < 1)) {
                            return;
                          }
                        }
                        else if (param_4 == '\0') {
                          if ((*puVar6 & 0x1c0) == 0x40) {
                            uVar3 = encode_object_slot_index(puVar6);
                            if (uVar3 != param_2) goto LAB_000749c4;
                            goto LAB_000749bc;
                          }
                        }
                        else {
LAB_000749bc:
                          if (param_4 == -0x40) goto LAB_000749c4;
                        }
                        if (*puVar13 >> 6 == uVar2 >> 6) {
                          puVar13 = puVar6 + 2;
                        }
                        puVar6 = (ushort *)resolve_object_link(puVar13);
                      }
                    }
                  }
                  iVar12 = (iVar15 + 1) * 0x10000 >> 0x10;
                  iVar15 = iVar12;
                } while (iVar12 <= iVar4);
                iVar10 = (int)(short)param_5;
                iVar12 = (int)(short)param_6;
              }
              iVar15 = (iVar7 + 1) * 0x10000;
              iVar7 = iVar15 >> 0x10;
              local_60 = (short)((uint)iVar15 >> 0x10);
            } while (iVar7 <= iVar9);
          }
        } while (((param_4 == '@') && ('\0' < param_1)) &&
                (iVar7 = (int)local_5e, local_5e = (short)((uint)((iVar7 + 1) * 0x10000) >> 0x10),
                iVar7 < 4));
      }
    }
  }
  return;
}



// was FUN_00074ad0 -- computes a position projected param_5 tiles
// ahead of object param_1's facing (project_position_by_heading,
// using its heading bits at offset+2 and location at offset+0x16),
// then calls scan_area_for_matching_objects centered on that
// position with a (2*param_6+1) square side, passing param_2 as the
// match-count limit, param_3 as the callback, and param_4 as the
// scan-mode selector. Effectively "scan a square area out in front
// of this object" -- e.g. a breath weapon or melee sweep hitbox.
void scan_area_ahead_of_object(param_1,param_2,param_3,param_4,param_5,param_6)
char *param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;
undefined1 param_5;
char param_6;

{
  char cVar1;
  ushort uVar2;
  uint uVar3;
  ushort local_1c;
  ushort local_1a;
  
  uVar2 = encode_object_slot_index();
  uVar3 = *(ushort *)(param_1 + 2) & 0x380;
  if ((short)uVar2 < 0x100) {
    uVar2 = uVar2 & 0xff;
    uVar3 = (*(byte *)(param_1 + 0x18) & 0x1f) + (uVar3 >> 2);
    local_1a = *(ushort *)(param_1 + 0x16) >> 10;
    local_1c = (ushort)((*(ushort *)(param_1 + 0x16) & 0x3f0) >> 4);
  }
  else {
    uVar3 = uVar3 >> 2;
    uVar2 = 0;
    local_1a = (ushort)DAT_0023c3dc;
    local_1c = (ushort)DAT_0023c3d8;
  }
  project_position_by_heading(uVar3,param_5,&local_1a,&local_1c);
  cVar1 = param_6 * '\x02' + '\x01';
  scan_area_for_matching_objects(param_2,uVar2,param_3,param_4,(char)local_1a - param_6,(char)local_1c - param_6,cVar1
               ,cVar1);
  return;
}





// was FUN_00074be8 -- iterates the active-object slot range
// [DAT_002046c0, DAT_002046c8), and for each object whose type-id
// byte (offset +0x1a) matches param_1, invokes callback param_4 as
// (object, param_3). If the callback returns nonzero, backs the scan
// pointer up by one slot (a swap-remove-style adjustment, matching
// how babl_builtin_set_attitude_apply's caller expects to be able to
// mutate the set while iterating). If param_2 is 0, stops after the
// first match; otherwise scans every matching object in range. See
// src/babl.c's babl_builtin_set_attitude for a confirmed real caller
// and the callback contract.
void for_each_object_of_type(param_1,param_2,param_3,param_4)
ushort param_1;
int param_2;
undefined4 param_3;
codeval * param_4;

{
  intptr_t iVar1; // was `int` -- get_object_record_by_slot_index returns a real 64-bit object pointer, truncated on this host (this loop was never exercised until babl_builtin_set_attitude's own recovery)
  undefined1 *puVar2;

  puVar2 = DAT_002046c0;
  if (DAT_002046c0 < DAT_002046c8) {
    do {
      iVar1 = (intptr_t)get_object_record_by_slot_index(*puVar2);
      if (*(byte *)(iVar1 + 0x1a) == param_1) {
        iVar1 = (*param_4)(iVar1,param_3);
        if (iVar1 != 0) {
          puVar2 = puVar2 + -1;
        }
        if (param_2 == 0) {
          return;
        }
      }
      puVar2 = puVar2 + 1;
    } while (puVar2 < DAT_002046c8);
  }
  return;
}





// was FUN_00074c64 -- dispatch_special_action's case 6 handler: rolls
// 3d4 damage, then scans a 4-deep, 2-wide area in front of the
// caster (scan_area_ahead_of_object) invoking a spell-effect callback
// selected from a function-pointer table (DAT_00087604, indexed by
// param_2's low 6 bits, 4-byte stride), passing the rolled damage as
// the match-count argument and param_2's top 2 bits as the scan mode.
//
// POSSIBLE LATENT BUG (not fixed here): DAT_00087604_backing and
// PTR_FUN_00087614 (used by cast_targeted_search_effect below) have
// no initializer anywhere in the decompile -- no assignment to either
// symbol was found by grep -- so on this host they're just
// zero-filled globals. The original binary almost certainly had a
// real static table of spell-effect handler addresses baked into its
// .data section here, which this decompile's data-recovery pipeline
// apparently didn't capture. If this code path is ever actually
// reached (dispatch_special_action case 6/7 -- an item's SPECIAL
// action id), it will currently call through a NULL function pointer
// and crash. Recovering the real table contents would need archaeology
// against the original PocketPC binary's .data section; out of scope
// for this naming/extraction pass -- flagging for a future pass.
void cast_cone_damage_spell(param_1,param_2)
undefined4 param_1;
uint param_2;

{
  char cVar1;
  
  cVar1 = roll_dice_sum(3,4);
  scan_area_ahead_of_object(param_1,(int)cVar1,*(undefined4 *)(&DAT_00087604 + (param_2 & 0x3f) * 4),
               param_2 & 0xc0,4,2);
  return;
}



// was FUN_00074cc8 -- dispatch_special_action's case 7 handler,
// player-only: same scan-ahead-of-object shape as
// cast_cone_damage_spell, but fixed to a single match and drawing
// its callback from a different function-pointer table
// (PTR_FUN_00087614, also indexed by param_2's low 6 bits).
void cast_targeted_search_effect(param_1,param_2)
int param_1;
uint param_2;

{
  if (param_1 == g_player_object) {
    scan_area_ahead_of_object(param_1,1,(&PTR_FUN_00087614)[param_2 & 0x3f],param_2 & 0xc0,4,2);
  }
  return;
}



// was FUN_00074d20 -- dispatch_special_action's case 8 handler:
// projects a position in front of the caster (project_position_by_
// heading) and branches on param_2: '\x03' places a scripted trap-type-9
// object pair at the destination tile via
// create_scripted_trap_pair_at_tile (trap type 9 cascades to
// dispatch_trap_type_effect's "alert nearby guards" case) and reports
// success/fail via a scroll message -- CORRECTION: an earlier pass's
// comment here described this as merely "probing whether the tile is
// occupied", written before create_scripted_trap_pair_at_tile's own
// body was examined; it unconditionally allocates and links two new
// trap-class object records into the tile (failing only if object-
// slot allocation itself fails), so this reads more like "place an
// alarm trap at the target tile" than an occupancy check, though the
// exact in-game spell this serves isn't confirmed; '\x01' spawns a
// random monster from a nearby ID range; '\x04' ("summon monster")
// picks a random valid, non-hostile-flagged monster from
// g_monster_max_stats_table and does a full spawn+setup (race/
// attitude sync for an NPC-cast summon, player-owned flag for a
// player-cast one) -- this is the branch whose ordint_divmod-remainder
// bug was already found and fixed in an earlier session pass (see the
// comment on uVar6/uVar10 below, which was a genuine 100%-CPU
// infinite-loop bug, not just a wrong-value one); any other param_2
// spawns a fixed object id instead. On success links the new object
// into the tile and settles it; on failure (no valid spawn point, or
// the case-3 trap-placement path) prints a "no effect"-style scroll
// message via print_scroll_message_by_id.
void cast_summon_or_spawn_effect(param_1,param_2)
int param_1;
char param_2;

{
  int uw_ord2005_rem_154 = 0; int uw_ord2005_rem_155 = 0; int uw_ord2005_rem_156 = 0;
  byte bVar1;
  ushort uVar2;
  short sVar3;
  char *uVar4;
  byte *pbVar5;
  uint uVar6;
  undefined2 uVar7;
  int extraout_r1;
  uint extraout_r1_00;
  uint extraout_r1_01;
  uint extraout_r1_02;
  int iVar8;
  int iVar9;
  uint uVar10;
  undefined4 uVar11;
  char *pObj;  /* was reuse of `iVar8` (int) -- truncated spawn_new_object's
                  real pointer; iVar8 itself stays int for its earlier,
                  unrelated uses above */
  ushort local_34;
  ushort local_32;
  short local_30;
  ushort local_2e;
  ushort local_2c;
  byte *local_28;
  
  uVar11 = 0x115;
  uVar4 = ce_rand();
  uVar2 = *(ushort *)(param_1 + 2);
  bVar1 = *(byte *)(param_1 + 0x18);
  uw_ord2005_rem_154 = ((int)(uVar4)) % (0x1b);
  uw_ord2005_rem_155 = ((int)((bVar1 & 0x1f) + (uVar2 >> 2 & 0xe0) + uw_ord2005_rem_154 + -0xd)) % (0xff);
  local_34 = (*(ushort *)(param_1 + 0x16) >> 7 & 0x1f8) + (uVar2 >> 0xd);
  local_32 = (*(ushort *)(param_1 + 0x16) >> 1 & 0x1f8) + (uVar2 >> 10 & 7);
  uVar7 = 0xc;
  if (param_2 != '\x04') {
    uVar7 = 9;
  }
  project_position_by_heading(uw_ord2005_rem_155 & 0xffff,uVar7,&local_34,&local_32);
  local_2c = (ushort)((int)(short)local_34 >> 3);
  local_2e = (ushort)((int)(short)local_32 >> 3);
  if (param_2 == '\x03') {
    sVar3 = create_scripted_trap_pair_at_tile((int)(short)local_34 >> 3,(int)(short)local_32 >> 3,9);
    if (sVar3 != 0) {
      uVar11 = 0x114;
    }
    if (param_1 != g_player_object) {
      return;
    }
  }
  else {
    pbVar5 = (byte *)tilemap_lookup();
    local_30 = (ushort)(*pbVar5 >> 4) << 3;
    local_28 = pbVar5;
    if (param_2 == '\x01') {
      uVar4 = ce_rand();
      uw_ord2005_rem_156 = ((int)(uVar4)) % (7);
      uVar10 = (uw_ord2005_rem_156 & 0xffff) + 0xb0;
    }
    else if (param_2 == '\x04') {
      if (param_1 == g_player_object) {
        uVar6 = (uint)*(byte *)(DAT_00086df8 + 0x2a);
      }
      else {
        uVar6 = (int)DAT_00201b68 << 2;
      }
      uVar6 = uVar6 & 0xff;
      if (uVar6 < 2) {
        uVar6 = 2;
      }
      /* Was `ordint_divmod(uVar6,uVar4); uVar10 = (extraout_r1_01 & 0xffff) + ...`
         -- the same fabricated-remainder bug fixed throughout this
         session (this port's ordint_divmod never populates extraout_r1),
         but this one was skipped by the earlier file-wide mechanical
         sweep because uVar6 (the divisor) is a variable, not a compile-
         time literal. Unlike every other instance of this bug found so
         far, THIS one is a genuine, deterministic infinite loop rather
         than a wrong-value/misbehavior bug: extraout_r1_01 never
         changes, so uVar10/iVar8 are identical on every iteration of
         both do-while loops below regardless of the fresh
         ce_rand() reroll each time round -- if that one fixed
         (wrong) candidate ever fails either loop's retry condition,
         nothing about the computation can ever change to let it pass,
         and the loop spins at 100% CPU forever. This is reached from
         dispatch_special_action's spell-effect dispatch (case 8, "summon
         monster"), for BOTH player- and NPC-cast spells (see the
         sibling `param_1 == g_player_object` check just above) --
         likely the real cause of the reported "game hangs in a 100%
         busy loop" QA report, since it only triggers when something
         actually casts this specific spell, not on every tick.
         Gets the remainder by name off ordint_divmod's own
         divmod_result now instead of a bypassing direct "%". */
      do {
        do {
          uVar4 = ce_rand();
          uVar10 = ((uint)ordint_divmod(uVar6,(int)(uintptr_t)uVar4).rem & 0xffff) + uVar6 + 0x40;
          iVar8 = (uVar10 & 0xfe3f) * 0x30;
        } while ((&g_monster_max_stats_table)[iVar8] == '\0');
      } while ((((((&DAT_001007da)[iVar8] & 2) != 0) || ((uVar10 & 0xffff) == 0x7b)) ||
               ((uVar10 & 0xffff) == 0x7c)) || (((&DAT_001007da)[iVar8] & 0x40) != 0));
    }
    else {
      uVar10 = (uint)local_2c;
    }
    iVar8 = check_object_placement_clearance(uVar10,0,(int)(short)local_34,(int)(short)local_32,local_30,1,8);
    if (iVar8 != 0) {
      pObj = (char *)spawn_new_object(uVar10,param_2 == '\x04');
      uVar2 = *(ushort *)(pObj + 2);
      uVar6 = uVar2 & 0x1fff;
      bVar1 = (byte)(((local_34 & 7) << 0xd) >> 8);
      *(char *)(pObj + 2) = (char)uVar6;
      *(byte *)(pObj + 3) = (byte)(uVar6 >> 8) | bVar1;
      uVar6 = uVar2 & 0x3ff;
      *(char *)(pObj + 2) = (char)uVar6;
      *(byte *)(pObj + 3) = (byte)(uVar6 >> 8) | bVar1 | (byte)(((local_32 & 7) << 10) >> 8);
      uVar4 = g_scratch_object_ptr;
      if (param_2 == '\x04') {
        g_scratch_object_ptr = (byte *)pObj;
        init_monster_spawn_defaults();
        uVar6 = local_2e & 0x3f | (local_2c & 0x3ff) << 6;
        g_scratch_object_ptr = (byte *)uVar4;
        *(byte *)(pObj + 0x16) = *(byte *)(pObj + 0x16) & 0xf | (byte)(uVar6 << 4);
        *(char *)(pObj + 0x17) = (char)(uVar6 >> 4);
        if (((&DAT_001007da)[(uVar10 & 0xfe3f) * 0x30] & 0x80) != 0) {
          iVar9 = local_30 + 0x80;
          if (iVar9 < 0) {
            iVar9 = local_30 + 0x81;
          }
          local_30 = (short)(iVar9 >> 1);
        }
        pbVar5 = local_28;
        if (param_1 == g_player_object) {
          *(byte *)(pObj + 0x19) = *(byte *)(pObj + 0x19) | 0x40;
        }
        else {
          uVar10 = *(ushort *)(pObj + 0xd) & 0x3fff;
          *(char *)(pObj + 0xd) = (char)uVar10;
          *(char *)(pObj + 0xe) = (char)(uVar10 >> 8);
          *(byte *)(pObj + 0x19) = *(byte *)(pObj + 0x19) | 1;
          uVar2 = *(ushort *)(pObj + 0xf);
          uVar10 = uVar2 & 0xffc0;
          bVar1 = *(byte *)((char *)g_player_object + 0x17) >> 2;
          *(byte *)(pObj + 0xf) = (byte)uVar10 | bVar1;
          *(char *)(pObj + 0x10) = (char)(uVar10 >> 8);
          uVar10 = uVar2 & 0xf000 | (uint)bVar1 | (*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) << 2;
          *(char *)(pObj + 0xf) = (char)uVar10;
          *(char *)(pObj + 0x10) = (char)(uVar10 >> 8);
        }
      }
      else {
        uVar7 = *(undefined2 *)(pObj + 4);
        *(byte *)(pObj + 4) = (byte)uVar7 | 0x3f;
        *(char *)(pObj + 5) = (char)((ushort)uVar7 >> 8);
      }
      uVar7 = *(undefined2 *)(pObj + 2);
      bVar1 = (byte)uVar7;
      *(byte *)(pObj + 2) = (bVar1 ^ (byte)local_30) & 0x7f ^ bVar1;
      *(char *)(pObj + 3) = (char)((ushort)uVar7 >> 8);
      object_list_insert_head(pbVar5 + 2,pObj);
      if (param_2 == '\x04') {
        return;
      }
      settle_dropped_object(pObj,(int)(short)local_2c,(int)(short)local_2e,1);
      return;
    }
    if (param_1 != g_player_object) {
      return;
    }
    uVar11 = 0x115;
  }
  print_scroll_message_by_id(uVar11);
  return;
}





// was FUN_00075248 -- spawns one of 3 object-id variants (0x154-0x156,
// chosen at random) centered in tile (param_1,param_2), sets its
// quality field to 0x6e, and places it in the world
// (place_object_in_world). On success, randomizes several of its
// data fields (offsets 9, 0x10/0x11 XORed with DAT_00101928, 0x13,
// 0x14) -- likely a sprite-variant/rotation seed for a purely
// decorative or loot-pile-style object rather than anything
// gameplay-mechanical. No callers found by grep in the remaining
// decompile.
undefined4 spawn_random_variant_object_at_tile(param_1,param_2)
int param_1;
int param_2;

{
  int uw_ord2005_rem_157 = 0; int uw_ord2005_rem_158 = 0;
  byte bVar1;
  undefined1 uVar2;
  undefined4 uVar3;
  char *iVar4;  /* was `int` -- truncated spawn_new_object's real pointer */
  int iVar5;
  char extraout_r1;
  short extraout_r1_00;
  uint uVar6;

  uVar3 = ce_rand();
  uw_ord2005_rem_157 = ((int)(uVar3)) % (3);
  iVar4 = (char *)spawn_new_object(uw_ord2005_rem_157 + 0x154,0);
  uVar6 = *(ushort *)(iVar4 + 2) & 0xffee;
  *(byte *)(iVar4 + 2) = (byte)uVar6 | 0x6e;
  *(char *)(iVar4 + 3) = (char)(uVar6 >> 8);
  iVar5 = place_object_in_world(param_1 * 8 + 3,param_2 * 8 + 3,0x6e,iVar4,0,0);
  if ((iVar5 != 0) && (iVar5 = object_ptr_in_arena(iVar4), iVar5 != 0)) {
    bVar1 = ce_rand();
    *(byte *)(iVar4 + 0x13) =
         ((bVar1 & 3) + 2 ^ *(byte *)(iVar4 + 0x13)) & 0x7f ^ *(byte *)(iVar4 + 0x13);
    uVar2 = ce_rand();
    *(undefined1 *)(iVar4 + 9) = uVar2;
    bVar1 = ce_rand();
    *(byte *)(iVar4 + 10) =
         ((bVar1 & 3) + DAT_00101928 ^ *(byte *)(iVar4 + 10)) & 0xf ^ *(byte *)(iVar4 + 10);
    uVar3 = ce_rand();
    bVar1 = *(byte *)(iVar4 + 0x14);
    uw_ord2005_rem_158 = ((int)(uVar3)) % (3);
    *(byte *)(iVar4 + 0x14) = (uw_ord2005_rem_158 + 1U ^ bVar1) & 7 ^ bVar1;
  }
  return 1;
}





// was FUN_000753a0 -- prints a "creatures detected in this direction"
// scroll message for cast_detect_life_spell below: param_1 is a 0-7
// compass-direction bucket, param_2 is how many creatures were found
// there. Picks a message tier (0/1/2, msgid 0x3b + tier) based on
// the count (<=1 / 2-4 / >4), then displays it via print_message_with_proximity_qualifier with
// a direction/compass icon index encoded as -1-param_1.
void report_detected_creatures_in_direction(param_1,param_2)
ushort param_1;
byte param_2;

{
  undefined4 uVar1;
  
  uVar1 = get_message_string((int)(short)(ushort)(4 < param_2) + (int)(short)(ushort)(1 < param_2) + 0x3bU
                       | 0x200);
  print_message_with_proximity_qualifier(uVar1,0,0,0,0,0,0,-1 - (param_1 & 0xff));
  return;
}



// was FUN_0007541c -- "Detect Life" spell: walks every active
// creature (type 0x1c0==0x40) within a square radius param_1 of the
// player, rolls a skill check (caster skill param_2 vs. a per-
// monster-class "detect resist" nibble field, DAT_001007ed, part of
// the same stride-0x30 table as g_monster_max_stats_table) for each
// one in range, and buckets successful detections into 8 compass
// directions (compute_compass_direction) relative to the player. Reports the
// direction with the most detections via
// report_detected_creatures_in_direction; on a count tie, falls back
// to a random direction with at least that many; prints a "nothing
// detected" scroll message (id 0x3e) if no creatures were found at
// all.
void cast_detect_life_spell(param_1,param_2)
short param_1;
undefined4 param_2;

{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  short sVar4;
  ushort *puVar5;
  uint uVar6;
  byte bVar7;
  int iVar8;
  uint uVar9;
  byte *pbVar10;
  uint uVar11;
  int iVar12;
  uint uVar13;
  byte local_2c [8];
  
  ce_memset(local_2c,0,8);
  uVar2 = *(ushort *)((char *)g_player_object + 0x16);
  for (pbVar10 = DAT_002046c0; pbVar10 < DAT_002046c8; pbVar10 = pbVar10 + 1) {
    puVar5 = (ushort *)((uint)*pbVar10 * 0x1b + DAT_002046b8);
    uVar13 = (uint)*puVar5;
    if ((uVar13 & 0x1c0) == 0x40) {
      uVar3 = puVar5[0xb];
      iVar8 = (uint)(uVar3 >> 10) - (uint)(uVar2 >> 10);
      iVar12 = (uVar3 >> 4 & 0x3f) - (uVar2 >> 4 & 0x3f);
      iVar1 = iVar8 * 0x1000000;
      uVar6 = iVar1 >> 0x1f;
      if ((((int)((iVar1 >> 0x18 ^ uVar6) - uVar6) < (int)param_1) &&
          (iVar1 = iVar12 * 0x1000000, uVar6 = iVar1 >> 0x1f,
          (int)((iVar1 >> 0x18 ^ uVar6) - uVar6) < (int)param_1)) &&
         (sVar4 = roll_skill_check(param_2,0xf - ((byte)(&DAT_001007ed)[(uVar13 & 0x3f) * 0x30] & 0xf)),
         0 < sVar4)) {
        sVar4 = compute_compass_direction(iVar8,iVar12);
        local_2c[sVar4] = local_2c[sVar4] + 1;
      }
    }
  }
  uVar13 = 0;
  uVar6 = 0;
  do {
    pbVar10 = local_2c + uVar6;
    uVar6 = uVar6 + 1 & 0xff;
    if (uVar13 < *pbVar10) {
      uVar13 = (uint)*pbVar10;
    }
  } while (uVar6 < 8);
  if (uVar13 == 0) {
    print_scroll_message_by_id(0x3e);
  }
  else {
    uVar6 = 3;
    if (uVar13 < 4) {
      uVar6 = uVar13;
    }
    uVar9 = 0;
    do {
      if (local_2c[uVar9] == uVar13) {
        report_detected_creatures_in_direction(uVar9,local_2c[uVar9]);
        uVar11 = uVar9;
        uVar13 = uVar6;
        break;
      }
      uVar9 = uVar9 + 1 & 0xff;
      uVar11 = uVar6;
    } while (uVar9 < 8);
    uVar6 = ce_rand();
    uVar6 = uVar6 & 7;
    bVar7 = 0;
    do {
      if (((uVar6 & 7) != uVar11) && (uVar13 < local_2c[uVar6 & 7])) {
        report_detected_creatures_in_direction(uVar6 & 7,local_2c[uVar6 & 7]);
        return;
      }
      bVar7 = bVar7 + 1;
      uVar6 = uVar6 + 1 & 0xff;
    } while (bVar7 < 8);
  }
  return;
}





// was FUN_000756c8 -- deferred target-click completion callback for
// dispatch_player_command's cases 2-5 (stored into the DAT_002020b8
// click-target callback slot, distinct from finish_object_use's own
// DAT_00202098-driven item-use flow). Branches on DAT_00202094 (the
// command id staged by dispatch_player_command): 3 rolls a lockpick
// check against param_1 as a container, then a trap-disarm check on
// success; 4 re-runs the target's duplicate right-click action list
// (dispatch_object_action_dup) and, for most object classes, sets a
// flag combination on it (offset +1/+3, bits 0x380); 5 checks whether
// the player's held item combines with param_1
// (check_object_combination) and prints a success/fail scroll
// message. All paths then reset the click-target UI state
// (pop_cursor_icon, g_cursor_holding_state=0, wait_for_click_release).
void complete_pending_player_command_target(param_1)
ushort * param_1;

{
  ushort uVar1;
  short sVar2;
  undefined4 uVar3;
  uint uVar4;
  
  if ((short)DAT_00202094 == 3) {
    sVar2 = roll_container_lockpick_check(param_1,0x2d);
    if (sVar2 != 0) {
      roll_container_trap_disarm_check(param_1,0x2d);
    }
  }
  else if ((short)DAT_00202094 == 4) {
    dispatch_object_action_dup(param_1,3);
    uVar4 = *param_1 & 0x1c0;
    if (((uVar4 != 0x140) && (uVar4 != 0x40)) &&
       (((&DAT_00202c9a)[(*param_1 & 0x1ff) * 0xd] & 3) != 2)) {
      uVar1 = param_1[1];
      *(char *)(param_1 + 1) = (char)(uVar1 | 0x380);
      *(char *)((char *)param_1 + 3) = (char)((uVar1 | 0x380) >> 8);
    }
  }
  else if ((short)DAT_00202094 == 5) {
    sVar2 = check_object_combination(g_player_object,param_1,0xffffffd3);
    if (sVar2 == 3) {
      uVar3 = 0x10e;
    }
    else {
      uVar3 = 0x10f;
    }
    print_scroll_message_by_id(uVar3);
  }
  pop_cursor_icon(3);
  g_cursor_holding_state = 0;
  wait_for_click_release(1);
  return;
}



// was FUN_00075808 -- dispatch_special_action's case 0xb handler:
// a numbered (0-0xc) player-command dispatcher, player-only. Case 1
// casts Detect Life directly; cases 2-5 arm a deferred "click a
// target" mode (g_cursor_holding_state=2, callback
// complete_pending_player_command_target, command id staged in
// DAT_00202094); case 6 clears a player status-flag pair; case 7
// re-triggers a "use"-style action on the player and resets the
// custom view target; case 9 rolls 8d3 and scans a cone in front of
// the player spawning random objects via
// spawn_random_variant_object_at_tile (matches "Create Food"'s
// shape: a cone of randomly-varied food-like objects); case 10 is
// gated on a player nibble field and, if set, arms a scheduled
// location-check callback and resets the player's tile position
// (a "recall"/"teleport home" effect); cases 0/8/0xb funnel into a
// shared add_active_light_source call with a different mode constant; case 0xc
// does a broad player-state reset (clears carry weight, refreshes
// equipment effects, redraws the HUD) -- likely a "resurrect" or
// "reset character" command.
void dispatch_player_command(param_1,param_2,param_3)
int param_1;
undefined4 param_2;
char param_3;

{
  undefined2 uVar1;
  char cVar2;
  undefined4 uVar3;
  uint uVar4;
  
  if (param_1 != g_player_object) {
    return;
  }
  switch((int)param_3) {
  case 0:
    uVar3 = 2;
    goto LAB_00075a0c;
  case 1:
    cast_detect_life_spell(10,0x2d);
    break;
  case 2:
    goto LAB_0007588c;
  case 3:
    goto LAB_0007588c;
  case 4:
    goto LAB_0007588c;
  case 5:
LAB_0007588c:
    g_cursor_holding_state = 2;
    DAT_00202098 = g_player_object;
    DAT_002020b8 = complete_pending_player_command_target;
    DAT_00202094 = (int)param_3;
    push_cursor_icon(0x1076);
    break;
  case 6:
    uVar4 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar4;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar4 >> 8);
    break;
  case 7:
    add_active_light_source(0xb,1,param_2);
    set_custom_view_target(0);
    set_view_subject_by_command(0xffffffff);
    break;
  case 8:
    uVar3 = 3;
    goto LAB_00075a0c;
  case 9:
    cVar2 = roll_dice_sum(8,3);
    scan_area_ahead_of_object(param_1,(int)cVar2,spawn_random_variant_object_at_tile,0x40,5,3);
    set_movement_animation_timer(0x40,0x28);
    play_sound_effect_at_object(0x12,param_1,0);
    break;
  case 10:
    if ((*(byte *)(DAT_00086df8 + 0x5e) & 0xf) == 0) {
      print_scroll_message_by_id(0x111);
    }
    else {
      DAT_00201c9c = &check_scheduled_object_location_callback;
      teleport_object_to_level_tile(g_player_object,0x3f,0x3f,*(byte *)(DAT_00086df8 + 0x5e) & 0xf);
      set_player_tile_position(0,0,0);
      set_pending_update_flags(0x7ffe);
    }
    break;
  case 0xb:
    uVar3 = 0;
LAB_00075a0c:
    add_active_light_source(0xb,uVar3,param_2);
    break;
  case 0xc:
    free_player_inventory_chain((char *)g_player_object + 6);
    reset_level_arena_and_invalidate(0);
    clear_rune_bag_contents();
    reset_ready_rune_slots();
    uVar1 = *(undefined2 *)(DAT_00086df8 + 0x5f);
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
    *(byte *)(DAT_00086df8 + 0x60) = (byte)((ushort)uVar1 >> 8) | 0x10;
    *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf;
    g_player_carry_weight = 0;
    refresh_player_equipment_effects();
    redraw_active_hud_panel();
  }
  return;
}





// was FUN_00075a88 -- walks every object on tile (param_1,param_2)
// (tilemap_lookup + the object linked list) and applies damage to
// each one via the general damage dispatcher (apply_typed_damage_to_object, not yet
// named): rolls dice from a damage-tier table (DAT_0008762c/
// DAT_00087630, indexed by param_3-1) and looks up a damage-type id
// from DAT_00087634 at the same index. A no-op if param_3 is 0.
// Already-confirmed caller: cast_single_tile_spell_effect and
// cast_area_spell_effect in src/object_actions.c.
void damage_all_objects_at_tile(param_1,param_2,param_3,param_4)
undefined4 param_1;
short param_2;
char param_3;
undefined1 param_4;

{
  undefined1 uVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's/resolve_object_link's
                   real `void *` returns */
  char *iVar3;  /* was `int` -- same, holds resolve_object_link's return */
  undefined4 uVar4;
  byte bVar5;

  bVar5 = param_3 - 1;
  if (param_3 != '\0') {
    iVar2 = (char *)tilemap_lookup(param_1);
    iVar2 = (char *)resolve_object_link(iVar2 + 2);
    if (iVar2 != 0) {
      do {
        iVar3 = (char *)resolve_object_link(iVar2 + 4);
        uVar1 = roll_dice_sum((&DAT_0008762c)[bVar5],(&DAT_00087630)[bVar5]);
        uVar4 = get_object_record_by_slot_index(param_4);
        apply_typed_damage_to_object(iVar2,uVar4,param_1,(int)param_2,uVar1,(&DAT_00087634)[bVar5]);
        iVar2 = iVar3;
      } while (iVar3 != 0);
    }
  }
  return;
}





// was FUN_00078b18 -- builds an object's display name into param_1's
// buffer. For a creature (type class 0x1c0==0x40) with a valid
// "whoami" id (param_2[0xd], uw_mobile_object_t's npc_whoami field),
// looks up and copies that creature's proper name string directly.
// For any other object, looks up the object-type's generic name
// message and runs it through format_object_display_name (below,
// singular/plural template substitution based on param_3, the
// quantity) before copying the formatted result out. Returns 0 if
// the name lookup failed or came back empty, 1 on success. Confirmed
// caller: dispatch_object_action's own "Look" text builder.
undefined4 build_object_display_name(param_1,param_2,param_3,param_4)
char * param_1;
ushort * param_2;
undefined4 param_3;
undefined4 param_4;

{
  char cVar1;
  uint uVar2;
  char *pcVar3;
  int iVar4;
  
  if ((((*param_2 & 0x1c0) == 0x40) && (uVar2 = (uint)(byte)param_2[0xd], uVar2 != 0)) &&
     (uVar2 < 0xf0)) {
    pcVar3 = (char *)get_message_string(uVar2 + 0x10 | 0xe00);
    if ((pcVar3 == (char *)0x0) || (*pcVar3 == '\0')) {
      return 0;
    }
    iVar4 = (int)param_1 - (int)pcVar3;
    do {
      cVar1 = *pcVar3;
      pcVar3[iVar4] = cVar1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
  }
  else {
    pcVar3 = (char *)get_message_string(*param_2 & 0x1ff | 0x800);
    if (pcVar3 == (char *)0x0) {
      return 0;
    }
    if (*pcVar3 == '\0') {
      return 0;
    }
    pcVar3 = (char *)format_object_display_name(pcVar3,param_3,param_4);
    do {
      cVar1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
      *param_1 = cVar1;
      param_1 = param_1 + 1;
    } while (cVar1 != '\0');
  }
  return 1;
}



undefined1 *format_object_display_name(param_1,param_2,param_3)
undefined1 * param_1;
int param_2;
int param_3;

{
  undefined1 *puVar1;
  int iVar2;
  
  puVar1 = (undefined1 *)ce_strchr(param_1,0x26);
  if (param_3 == 0) {
    if (puVar1 != (undefined1 *)0x0) {
      *puVar1 = 0;
    }
  }
  else if (puVar1 == (undefined1 *)0x0) {
    iVar2 = ce_strlen(param_1);
    param_1[iVar2] = 0x73;
    (param_1 + iVar2)[1] = 0;
  }
  else {
    param_1 = puVar1 + 1;
  }
  puVar1 = (undefined1 *)ce_strchr(param_1,0x5f);
  if (puVar1 != (undefined1 *)0x0) {
    if (param_2 == 0) {
      param_1 = puVar1 + 1;
    }
    else {
      *puVar1 = 0x20;
    }
  }
  return param_1;
}



// was FUN_00078c80 -- looks up message id param_1 (in the 0x200
// message-page range) and prints it to the message scroll. Already
// widely used by name throughout this codebase's comments (e.g.
// trigger_type_flagged_trap_effect, apply_targeted_spell_effect) as
// "the message-scroll-print helper".
void print_scroll_message_by_id(param_1)
uint param_1;

{
  message_scroll_print_wrapped(get_message_string(param_1 | 0x200)); // was two separate calls with message_scroll_print_wrapped()'s arg dropped; see uw.c ~7961's sibling call and its comment
  return;
}





// was FUN_00078c94 -- prints a scroll message built by concatenating
// up to 3 message ids: param_1 is always looked up and copied first,
// then param_2 and param_3 are each appended in turn if non-negative
// (a caller passing -1 skips that piece). No callers found by grep
// in the remaining decompile.
void print_scroll_message_concat(param_1,param_2,param_3)
uint param_1;
uint param_2;
uint param_3;

{
  char cVar1;
  char *pcVar2;
  char *uVar3;   /* was undefined4 -- get_message_string returns char*; truncating
                    it fed ce_strcat (strcat) a wild src pointer */
  char *pcVar4;
  char local_10c [256];
  
  pcVar4 = local_10c;
  pcVar2 = (char *)get_message_string(param_1 | 0x200);
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
    *pcVar4 = cVar1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  if (-1 < (short)param_2) {
    uVar3 = get_message_string(param_2 | 0x200);
    ce_strcat(local_10c,uVar3);
  }
  if (-1 < (short)param_3) {
    uVar3 = get_message_string(param_3 | 0x200);
    ce_strcat(local_10c,uVar3);
  }
  message_scroll_print_wrapped(local_10c);
  return;
}


// was FUN_0007ca0c -- deferred-target-click completion callback that
// finishes the "cast a spell effect on this target" flow: applies
// the staged targeted spell effect (using the same DAT_00202098/
// DAT_00202094 globals dispatch_player_command's own cases 2-5 stage
// via prompt_use_item_on_target-style setup -- see
// apply_targeted_spell_effect's own comment for that encoding), then
// resets the click-target UI state. Confirmed caller: the world-click
// target dispatcher (uw.c, g_cursor_holding_state == 3 branch), which
// fires exactly when dispatch_player_command's case 5 staged this same
// flow via g_cursor_holding_state = 3.
void complete_cast_spell_on_target()

{
  apply_targeted_spell_effect((ushort *)DAT_00202098,(int)(char)DAT_00202094);
  g_cursor_holding_state = 0;
  pop_cursor_icon(3);
  wait_for_click_release(1);
  return;
}


// was FUN_0007ca50 -- resolves an object instance's (param_1) packed
// quality/variant field into a (class, value) pair plus a flag
// distinguishing "ordinary quality variant" from "special/linked"
// items. Evidence for this split: refresh_stats_panel-family equip
// code (src/player.c) uses the (class, value) pair as an ordinary
// item-variant key into apply_equipped_item_effect only when the flag
// is clear, and treats a set flag as a distinct "special/linked item"
// case instead; trigger_object_use_babl_script (src/item_use.c) only
// fires its babl conversation script when the flag is set, describing
// it as a check "for a real link/description on the target"; and the
// combat-damage helper at compute_player_weapon_attack_stats (uw.c) only applies its bonus
// when the flag is CLEAR and the class equals 0xc. The class value 9
// is confirmed (via append_object_property_tag, uw.c) to mean "cursed" when printed
// via the "cursed"/"magical" item-description strings. Class 0xc's
// meaning beyond "combat-relevant" and the flag's exact semantics
// (identified? has-babl-link? both?) are not pinned down further here.
undefined4 resolve_object_variant_or_special_link(param_1,param_2,param_3,param_4)
ushort * param_1;
ushort * param_2;
undefined2 * param_3;
uint * param_4;

{
  byte bVar1;
  ushort uVar2;
  int iVar3;
  ushort uVar4;
  uint uVar5;
  ushort *local_20;
  
  uVar2 = *param_1;
  if ((uVar2 & 0x1c0) != 0x180) {
    if (((uVar2 & 0x8000) == 0) && (local_20 = param_1 + 3, (*local_20 & 0xffc0) != 0)) {
      param_1 = (ushort *)find_object_in_chain(&local_20,0,4,2,0);
      if (param_1 == (ushort *)0x0) {
        return 0;
      }
      if ((((param_1[2] & 0x3f) == 0) && (DAT_0024cfcc == 0)) &&
         (iVar3 = rand_below(10), iVar3 < 4)) {
        return 0;
      }
    }
    else {
      if ((uVar2 & 0x8000) == 0) {
        return 0;
      }
      if ((uVar2 & 0x1000) == 0) {
        return 0;
      }
      if ((uVar2 & 0x1c0) == 0x140) {
        return 0;
      }
    }
    if (param_1 != (ushort *)0x0) {
      uVar5 = (uint)((*param_1 & 0x800) != 0);
      *param_4 = uVar5;
      if (uVar5 == 1) {
        bVar1 = *(byte *)((char *)param_1 + 7) >> 4;
        uVar2 = bVar1 & 7;
        *param_2 = uVar2;
        uVar4 = 0xffff;
        if ((bVar1 & 7) != 0) {
          uVar4 = uVar2 + 0xc;
        }
        *param_2 = uVar4;
        uVar5 = param_1[3] & 0xfc0;
      }
      else {
        *param_2 = (ushort)((*(byte *)((char *)param_1 + 7) & 0x7c) >> 2);
        uVar5 = param_1[3] & 0x3c0;
      }
      *param_3 = (short)(uVar5 >> 6);
      return 1;
    }
  }
  return 0;
}





// was FUN_0007cc30 -- called by src/player.c's equip-effect refresh
// loop right after apply_equipped_item_effect succeeds for an
// equipped item; only acts when the item's flags word has bit 0x8000
// set (the same gating bit resolve_object_variant_or_special_link
// checks first). Under a specific class-bits condition (comparing
// bits 0x1000/0x1c0 against a 0x140 sentinel), clears bit 0x1000 from
// the item's flags word. Reads as "consume/clear a one-shot special-
// item marker once its effect has been applied this refresh", but the
// exact meaning of bit 0x1000 itself isn't pinned down further here.
void clear_object_pending_special_flag(param_1)
ushort * param_1;

{
  ushort uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  bool bVar5;
  
  uVar1 = *param_1;
  uVar3 = (uint)uVar1;
  if ((uVar1 & 0x8000) != 0) {
    uVar4 = uVar3 & 0x1000;
    bVar5 = (uVar1 & 0x1000) != 0;
    uVar2 = uVar3;
    if (bVar5) {
      uVar4 = uVar3 & 0x1c0;
      uVar2 = 0x140;
    }
    if (bVar5 && uVar4 != uVar2) {
      *(char *)param_1 = (char)(uVar3 & 0xefff);
      *(char *)((char *)param_1 + 1) = (char)((uVar3 & 0xefff) >> 8);
    }
  }
  return;
}



// was FUN_0007cc78 -- trigger_object_use_babl_script's "finalize" step
// for the interacting object (src/item_use.c's own comment already
// names this function). Looks up param_1's linked/special sub-object
// via the same find_object_in_chain quality-link resolver
// resolve_object_variant_or_special_link uses, and if that linked
// object's byte+1 bit 3 (0x8) is set, reads its quality/charge field
// (ushort at +4). When the low-6-bit charge count is already 0, rolls
// a 1-in-~2.5 chance (rand_below(10) < 4) to destroy the linked object
// outright (object_list_unlink + free_object_slot); otherwise
// decrements just the low 6 bits of the charge byte, leaving the
// upper bits untouched. Matches the "consume a discrete use/charge
// count, destroying the object once exhausted" pattern used elsewhere
// for depletable linked resources.
void consume_linked_special_object_charge(param_1)
int param_1;

{
  ushort uVar1;
  byte bVar2;
  int iVar3;
  int iVar4;
  ushort *local_c;
  
  if (((((*(byte *)(param_1 + 1) & 0x80) == 0) &&
       (local_c = (ushort *)(param_1 + 6), (*local_c & 0xffc0) != 0)) &&
      (iVar3 = find_object_in_chain(&local_c,0,4,2,0), iVar3 != 0)) && ((*(byte *)(iVar3 + 1) & 8) != 0)) {
    uVar1 = *(ushort *)(iVar3 + 4);
    if ((uVar1 & 0x3f) == 0) {
      iVar4 = rand_below(10);
      if (iVar4 < 4) {
        object_list_unlink(local_c,iVar3);
        free_object_slot(iVar3);
      }
    }
    else {
      bVar2 = (byte)uVar1;
      *(byte *)(iVar3 + 4) = (bVar2 - 1 ^ bVar2) & 0x3f ^ bVar2;
      *(char *)(iVar3 + 5) = (char)(uVar1 >> 8);
    }
  }
  return;
}





// was FUN_0007ec58 -- confirmed by its only caller's own pre-existing
// comment (cast_detect_life_spell, src/object_actions.c) as bucketing
// a relative (dx,dy) offset into one of 8 compass directions (0-7).
// Compares |param_2| against |param_1|/2 (and vice versa) to pick the
// dominant axis, then the sign of the dominant (and near-tied
// secondary) component selects the final octant code.
char compute_compass_direction(param_1,param_2)
char param_1;
char param_2;

{
  uint uVar1;
  uint uVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  uVar1 = (uint)param_1;
  iVar4 = (uVar1 ^ (int)uVar1 >> 0x1f) - ((int)uVar1 >> 0x1f);
  uVar2 = (uint)param_2;
  iVar5 = (uVar2 ^ (int)uVar2 >> 0x1f) - ((int)uVar2 >> 0x1f);
  iVar6 = iVar4;
  if (iVar4 < 0) {
    iVar6 = iVar4 + 1;
  }
  if (iVar5 < iVar6 >> 1) {
    if ((int)uVar1 < 1) {
      cVar3 = '\x06';
    }
    else {
      cVar3 = '\x02';
    }
  }
  else {
    if (iVar5 < 0) {
      iVar5 = iVar5 + 1;
    }
    if (iVar4 < iVar5 >> 1) {
      if ((int)uVar2 < 1) {
        cVar3 = '\x04';
      }
      else {
        cVar3 = '\0';
      }
    }
    else if ((int)uVar1 < 0) {
      cVar3 = (0 < (int)uVar2) * '\x02' + '\x05';
    }
    else {
      cVar3 = ((int)uVar2 < 0) * '\x02' + '\x01';
    }
  }
  return cVar3;
}





// was FUN_0007ed20 -- prints param_1 (a get_message_string result at
// every confirmed call site) via message_scroll_print_wrapped, then
// compares two (x,y) tile positions (param_2/3 vs param_5/6) against
// a max-distance threshold (param_8, matching the abs-diff-sum bit
// trick used elsewhere in this file, e.g. is_out_of_player_range) to
// decide whether the two points are "near" each other. Based on that
// proximity result and whether a facing/direction value (param_4)
// matches param_7 or is 0, optionally prints an extra qualifier
// string ("very_near" or "and"), then always prints whatever is
// currently staged in the shared scratch message buffer
// (DAT_00084f20) to finish the sentence. Reads as "announce a
// detected event, appending how close/what direction it came from",
// consistent with report_detected_creatures_in_direction's own use
// for the Detect Life spell.
void print_message_with_proximity_qualifier(param_1,param_2,param_3,param_4,param_5,param_6,param_7,param_8)
undefined4 param_1;
short param_2;
short param_3;
short param_4;
short param_5;
short param_6;
short param_7;
short param_8;

{
  uint uVar1;
  uint uVar2;
  bool bVar3;
  char *pcVar4;

  bVar3 = false;
  /* HACK: was a bare `message_scroll_print_wrapped();` -- dropped
     argument, the same class of bug fixed repeatedly elsewhere in
     this file. Every confirmed caller (report_detected_creatures_in_
     direction, and call sites in dispatch_trap_type_effect/
     src/player.c) builds param_1 via get_message_string specifically
     to have a message printed -- with every OTHER print in this same
     function passed an explicit argument (pcVar4, &DAT_00084f20) and
     none of them being param_1, this first call is the only one that
     would otherwise never use param_1 at all, making it obviously the
     intended argument here. */
  message_scroll_print_wrapped(param_1);
  if (param_8 < 0) {
LAB_0007ed8c:
    bVar3 = true;
  }
  else {
    uVar1 = (int)param_2 - (int)param_5 >> 0x1f;
    uVar2 = (int)param_3 - (int)param_6 >> 0x1f;
    if ((int)param_8 <
        (int)((((int)param_3 - (int)param_6 ^ uVar2) - uVar2) +
             (((int)param_2 - (int)param_5 ^ uVar1) - uVar1))) goto LAB_0007ed8c;
  }
  if ((param_4 == param_7) || (param_4 == 0)) {
    if ((bVar3) || (param_4 == 0)) goto LAB_0007edd8;
    pcVar4 = s_very_near_00087954;
  }
  else {
    if (!bVar3) goto LAB_0007edd8;
    pcVar4 = s_and_00087310;
  }
  message_scroll_print_wrapped(pcVar4);
LAB_0007edd8:
  message_scroll_print_wrapped(&DAT_00084f20);
  return;
}





// was FUN_00081388 -- spawns a small burst of 2-4 debris/particle
// objects at tile (param_2,param_3), each copied from the 8-byte
// template param_1, given randomized position/orientation offsets
// within the tile, linked into the tile's object list, and
// independently scheduled (scheduler_add_entry, randomized class/
// delay) so each despawns/animates on its own. Confirmed by two
// distinct callers' own comments: src/ai.c's "teleport gate" effect
// ("spawn debris around the object") and
// cast_area_spell_effect's own area-spell visual burst
// (src/object_actions.c).
void spawn_effect_debris_burst(param_1,param_2,param_3)
undefined1 * param_1;
uint param_2;
undefined4 param_3;

{
  int uw_ord2005_rem_170 = 0; int uw_ord2005_rem_171 = 0; int uw_ord2005_rem_172 = 0; int uw_ord2005_rem_173 = 0; int uw_ord2005_rem_174 = 0;
  short sVar1;
  ushort uVar2;
  byte bVar3;
  byte bVar4;
  short sVar5;
  undefined4 uVar6;
  int iVar7;
  ushort *puVar8;
  uint uVar9;
  uint uVar10;
  undefined4 uVar11;
  short extraout_r1;
  short extraout_r1_00;
  short extraout_r1_01;
  short extraout_r1_02;
  short extraout_r1_03;
  undefined1 uVar12;
  undefined1 uVar13;
  
  uVar6 = ce_rand();
  uw_ord2005_rem_170 = ((int)(uVar6)) % (3);
  iVar7 = uw_ord2005_rem_170 + 2;
  sVar1 = (short)iVar7;
  while (-1 < iVar7 * 0x10000 >> 0x10) {
    puVar8 = (ushort *)alloc_object_slot(0);
    *(undefined1 *)puVar8 = *param_1;
    *(undefined1 *)((char *)puVar8 + 1) = param_1[1];
    *(undefined1 *)(puVar8 + 1) = param_1[2];
    *(undefined1 *)((char *)puVar8 + 3) = param_1[3];
    *(undefined1 *)(puVar8 + 2) = param_1[4];
    *(undefined1 *)((char *)puVar8 + 5) = param_1[5];
    *(undefined1 *)(puVar8 + 3) = param_1[6];
    *(undefined1 *)((char *)puVar8 + 7) = param_1[7];
    uVar9 = ce_rand();
    uVar10 = (uint)*puVar8;
    uVar10 = ((uVar9 & 1) + uVar10 + 1 ^ uVar10) & 0x1ff ^ uVar10;
    *(char *)puVar8 = (char)uVar10;
    *(char *)((char *)puVar8 + 1) = (char)(uVar10 >> 8);
    bVar3 = *(byte *)((char *)puVar8 + 3) >> 5;
    do {
      do {
        uVar6 = ce_rand();
        uw_ord2005_rem_171 = ((int)(uVar6)) % (5);
        iVar7 = ((int)(((int)uw_ord2005_rem_171 - 2U) * 0x10000) >> 0x10) + (int)(short)(ushort)bVar3;
      } while (iVar7 < 0);
    } while (7 < iVar7);
    uVar9 = puVar8[1] & 0x1fff ^ (((int)uw_ord2005_rem_171 - 2U & 0xffff) + (uint)bVar3 & 0xffff) << 0xd
    ;
    *(char *)(puVar8 + 1) = (char)(puVar8[1] & 0x1fff);
    *(char *)((char *)puVar8 + 3) = (char)(uVar9 >> 8);
    uVar9 = (uVar9 & 0x1c00) >> 10;
    do {
      do {
        uVar6 = ce_rand();
        uw_ord2005_rem_172 = ((int)(uVar6)) % (5);
        iVar7 = ((int)(((int)uw_ord2005_rem_172 - 2U) * 0x10000) >> 0x10) + (int)(short)uVar9;
      } while (iVar7 < 0);
    } while (7 < iVar7);
    bVar3 = (byte)(puVar8[1] >> 8);
    *(char *)(puVar8 + 1) = (char)puVar8[1];
    *(byte *)((char *)puVar8 + 3) =
         (bVar3 ^ (byte)(((((int)uw_ord2005_rem_172 - 2U & 0xffff) + uVar9 & 0xffff) << 10) >> 8)) &
         0x1c ^ bVar3;
    bVar4 = ce_rand();
    uVar2 = puVar8[1];
    bVar3 = (byte)uVar2;
    *(byte *)(puVar8 + 1) = (((bVar4 & 0xf) + bVar3) - 8 ^ bVar3) & 0x7f ^ bVar3;
    *(char *)((char *)puVar8 + 3) = (char)(uVar2 >> 8);
    /* was folded into `int iVar7` (this function's loop counter, reused
       immediately after this for unrelated int values) -- truncated
       tilemap_lookup's real `void *` return */
    {
      char *_tile7 = (char *)tilemap_lookup(param_2,param_3);
      object_list_insert_head(_tile7 + 2,puVar8);
    }
    uVar6 = ce_rand();
    uw_ord2005_rem_173 = ((int)(uVar6)) % (3);
    uVar6 = ce_rand();
    uVar11 = encode_object_slot_index(puVar8);
    uVar12 = (undefined1)param_3;
    uVar13 = (undefined1)uw_ord2005_rem_173;
    uw_ord2005_rem_174 = ((int)(uVar6)) % (3);
    sVar5 = scheduler_add_entry(uVar11,((int)uw_ord2005_rem_174 - (int)uw_ord2005_rem_173) + 2,(int)uw_ord2005_rem_173,
                         param_2 & 0xff,uVar12,uVar13);
    if (sVar5 == -1) {
      /* was folded into `int iVar7` (this function's loop counter) --
         truncated tilemap_lookup's real `void *` return */
      char *_tile7b = (char *)tilemap_lookup(param_2,param_3);
      object_list_unlink(_tile7b + 2,puVar8);
      free_object_slot(puVar8);
      iVar7 = -1;
    }
    else {
      iVar7 = (int)sVar1;
    }
    iVar7 = iVar7 + -1;
    sVar1 = (short)iVar7;
  }
  return;
}





// was FUN_0002a35c -- initializes a newly-spawned creature's default
// stat/flag fields on g_scratch_object_ptr: clears combat/status
// bitfields (poison, paralysis, sleep, etc.), rolls a randomized field
// (byte 8) from the monster combat-stat table (&DAT_001007d0, indexed
// by class id -- the same table load_monster_combat_stats fills), and
// resets several other packed fields to their spawn defaults. Called
// from object_actions.c's own creature-spawn path (param_2=='\x04')
// right after spawn_new_object, with g_scratch_object_ptr pointed at
// the new object for the duration of the call.
undefined4 init_monster_spawn_defaults()

{
  int uw_ord2005_rem_11 = 0;
  ushort uVar1;
  undefined4 uVar2;
  int extraout_r1;
  int iVar3;
  
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0x16);
  g_scratch_object_ptr[0x16] = (byte)(uVar1 & 0x3ff);
  g_scratch_object_ptr[0x17] = (byte)((uVar1 & 0x3ff) >> 8) | 0x80;
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0x16);
  g_scratch_object_ptr[0x16] = (byte)(uVar1 & 0xfe0f);
  g_scratch_object_ptr[0x17] = (byte)((uVar1 & 0xfe0f) >> 8) | 2;
  uVar1 = *(ushort *)(g_scratch_object_ptr + 4);
  g_scratch_object_ptr[4] = (byte)(uVar1 & 0xffc0) ^ 0x20;
  g_scratch_object_ptr[5] = (byte)((uVar1 & 0xffc0) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 6);
  g_scratch_object_ptr[6] = (byte)(uVar1 & 0xffc0) ^ 0x20;
  g_scratch_object_ptr[7] = (byte)((uVar1 & 0xffc0) >> 8);
  DAT_001007c8 = &DAT_001007d0 + (*g_scratch_object_ptr & 0x3f) * 0x30;
  uVar2 = ce_rand();
  uw_ord2005_rem_11 = ((int)(uVar2)) % (0x18);
  iVar3 = (uw_ord2005_rem_11 + 0x10) * (uint)(byte)DAT_001007c8[4];
  if (iVar3 < 0) {
    iVar3 = iVar3 + 0x1f;
  }
  g_scratch_object_ptr[8] = (byte)(iVar3 >> 5);
  g_scratch_object_ptr[9] = (byte)(*(ushort *)(g_scratch_object_ptr + 2) >> 2) & 0xe0;
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xb);
  g_scratch_object_ptr[0xb] = (byte)(uVar1 & 0xfff8) | 8;
  g_scratch_object_ptr[0xc] = (byte)((uVar1 & 0xfff8) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xb);
  g_scratch_object_ptr[0xb] = (byte)(uVar1 & 0xf00f);
  g_scratch_object_ptr[0xc] = (byte)((uVar1 & 0xf00f) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0xfff0);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0xfff0) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xf);
  g_scratch_object_ptr[0xf] = (byte)(uVar1 & 0xffc0);
  g_scratch_object_ptr[0x10] = (byte)((uVar1 & 0xffc0) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xf);
  g_scratch_object_ptr[0xf] = (byte)(uVar1 & 0xf03f);
  g_scratch_object_ptr[0x10] = (byte)((uVar1 & 0xf03f) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0xff0f);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0xff0f) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0xfdff);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0xfdff) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0xfbff);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0xfbff) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0xf7ff);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0xf7ff) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0xfeff);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0xfeff) >> 8);
  g_scratch_object_ptr[0x18] = g_scratch_object_ptr[0x18] & 0xdf;
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xf);
  g_scratch_object_ptr[0xf] = (byte)(uVar1 & 0xfff);
  g_scratch_object_ptr[0x10] = (byte)((uVar1 & 0xfff) >> 8);
  g_scratch_object_ptr[10] = g_scratch_object_ptr[10] & 0xf0;
  g_scratch_object_ptr[0x14] = g_scratch_object_ptr[0x14] & 0xfc | 4;
  g_scratch_object_ptr[0x15] = g_scratch_object_ptr[0x15] & 0xe0 | 0x20;
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xb);
  g_scratch_object_ptr[0xb] = (byte)(uVar1 & 0xfff);
  g_scratch_object_ptr[0xc] = (byte)((uVar1 & 0xfff) >> 8);
  g_scratch_object_ptr[0x14] = g_scratch_object_ptr[0x14] & 7 | 0x80;
  g_scratch_object_ptr[0x13] = g_scratch_object_ptr[0x13] & 0x7f;
  g_scratch_object_ptr[0x13] = g_scratch_object_ptr[0x13] & 0x80;
  g_scratch_object_ptr[0x11] = 0;
  g_scratch_object_ptr[0x12] = 0;
  g_scratch_object_ptr[0x15] = g_scratch_object_ptr[0x15] & 0x7f;
  g_scratch_object_ptr[0x18] = g_scratch_object_ptr[0x18] & 0x7f;
  g_scratch_object_ptr[0x18] = g_scratch_object_ptr[0x18] & 0xbf;
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0x16);
  g_scratch_object_ptr[0x16] = (byte)(uVar1 & 0xfff0);
  g_scratch_object_ptr[0x17] = (byte)((uVar1 & 0xfff0) >> 8);
  g_scratch_object_ptr[0x15] = g_scratch_object_ptr[0x15] & 0xbf;
  g_scratch_object_ptr[0x1a] = 0;
  g_scratch_object_ptr[0x19] = g_scratch_object_ptr[0x19] & 0xfe;
  g_scratch_object_ptr[0x19] = g_scratch_object_ptr[0x19] & 0xfd;
  g_scratch_object_ptr[0x19] = g_scratch_object_ptr[0x19] & 0xef;
  g_scratch_object_ptr[0x19] = g_scratch_object_ptr[0x19] & 0xdf;
  g_scratch_object_ptr[0x19] = g_scratch_object_ptr[0x19] & 0xbf;
  g_scratch_object_ptr[0x19] = g_scratch_object_ptr[0x19] & 0x7f;
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0xefff);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0xefff) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0xdfff);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0xdfff) >> 8);
  uVar1 = *(ushort *)(g_scratch_object_ptr + 0xd);
  g_scratch_object_ptr[0xd] = (byte)(uVar1 & 0x3fff);
  g_scratch_object_ptr[0xe] = (byte)((uVar1 & 0x3fff) >> 8) | 0x80;
  g_scratch_object_ptr[10] = g_scratch_object_ptr[10] & 0x7f;
  g_scratch_object_ptr[0x19] = g_scratch_object_ptr[0x19] & 0xf3;
  return 1;
}


// was FUN_00048b6c -- appends a "magical"/"cursed" property tag onto
// the caller's description buffer (param_3), resolved via
// resolve_object_variant_or_special_link. param_2 selects which tag
// family to check (2 always tags "magical" when a variant/special
// link resolves at all; 3 tags "cursed" for the specific special-link
// code 9). Called early in object_actions.c's look-description
// builder, before the main "You see a/an X" text.
undefined4 append_object_property_tag(param_1,param_2,param_3)
ushort *param_1;   /* was undefined4 -- object ptr into resolve_object_variant_or_special_link */
short param_2;
char *param_3;     /* was undefined4 -- caller's stack buffer for ce_strcat */

{
  int iVar1;
  bool bVar2;
  short local_14;
  undefined1 auStack_12 [2];
  int local_10;
  
  iVar1 = resolve_object_variant_or_special_link(param_1,&local_14,auStack_12,&local_10);
  if (iVar1 != 0) {
    if (param_2 == 2) {
      ce_strcat(param_3,s_magical_00085ca8);
      return 1;
    }
    if (param_2 == 3) {
      bVar2 = local_10 == 0;
      if (bVar2) {
        local_10 = (int)local_14;
      }
      if (bVar2 && local_10 == 9) {
        ce_strcat(param_3,s_cursed_00085ca0);
      }
    }
  }
  return 0;
}



// was FUN_00048bf0 -- appends a special/unique item's proper name onto
// the caller's description buffer (param_3, called after
// build_object_display_name), for param_2==3: resolves the item's
// variant/special-link data, looks up a name-table message string
// keyed by its quality/link fields (falling back to "UNNAMED" if the
// lookup misses), and appends it prefixed by DAT_00085cd8 (": "-shaped
// separator). Also checks the object's own content chain for a
// matching link entry.
// WARNING: Type propagation algorithm not settling

undefined4 append_object_special_name(param_1,param_2,param_3)
byte * param_1;
short param_2;
char *param_3;   /* was int -- caller's stack buffer for ce_strcat/1044/1068 */

{
  int uw_ord2005_rem_113 = 0;
  char cVar1;
  int iVar2;
  uint uVar3;
  char *pcVar4;
  int iVar5;
  undefined4 uVar6;
  int extraout_r1;
  undefined2 *puVar7;
  ushort uVar8;
  bool bVar9;
  short local_28;
  undefined1 local_26 [2];
  undefined1 local_24;
  int local_20;
  byte *local_1c;
  
  DAT_0024cfcc = 1;
  local_1c = (byte *)resolve_object_variant_or_special_link(param_1,local_26,&local_28,&local_20);
  DAT_0024cfcc = 0;
  if ((local_1c == (byte *)0x0) || (param_2 != 3)) {
LAB_00048e80:
    uVar6 = 0;
  }
  else {
    if (*(short *)local_26 == 0xc) {
      *(short *)local_26 = 0x1c0;
      if ((*param_1 & 0x30) < 0x11) {
        iVar2 = (int)local_28;
      }
      else {
        iVar2 = local_28 + 0x10;
      }
      uVar3 = iVar2 + 0x1c0;
    }
    else {
      if (*(short *)local_26 == 0x9) goto LAB_00048e80;
      if ((local_20 == 0) || (0 < *(short *)local_26)) {
        uVar3 = (int)local_28 + *(short *)local_26 * 0x10;
      }
      else {
        uVar3 = (int)local_28 + 0x100;
      }
    }
    local_28 = (short)uVar3;
    pcVar4 = (char *)get_message_string(uVar3 | 0xc00);
    if ((pcVar4 == (char *)0x0) || (*pcVar4 == '\0')) {
      pcVar4 = s_UNNAMED_00084f24;
    }
    ce_strcat(param_3,&DAT_00085cd8);
    iVar2 = ce_strlen(pcVar4);
    iVar5 = ce_strlen(param_3);
    ce_memmove(param_3 + iVar5,pcVar4,iVar2 + 1);
    if ((param_1[1] & 0x80) == 0) {
      local_1c = param_1 + 6;
      uVar8 = 0xffff;
      iVar2 = find_object_in_chain(&local_1c,0,4,2,0);
      bVar9 = iVar2 == 0;
      if (!bVar9) {
        bVar9 = (*(byte *)(iVar2 + 1) & 8) == 0;
      }
      if (!bVar9) {
        uVar8 = *(byte *)(iVar2 + 4) & 0x3f;
      }
      iVar2 = (int)(short)uVar8;
      if (-1 < iVar2) {
        ce_strcat(param_3,s_with_00085cd0);
        if (iVar2 < 1) {
          puVar7 = (undefined2 *)&DAT_00085cc8;
        }
        else {
          local_26[1] = DAT_00085ccd;
          local_26[0] = DAT_00085ccc;
          local_24 = DAT_00085cce;
          uw_ord2005_rem_113 = ((int)(iVar2)) % (10);
          local_26[1] = (char)((uint)((uw_ord2005_rem_113 + 0x30) * 0x1000000) >> 0x18);
          if (iVar2 < 10) {
            puVar7 = (undefined2 *)((char *)local_26 + 1);
          }
          else {
            cVar1 = ordint_divmod(10,iVar2).quot;
            local_26[0] = cVar1 + '0';
            puVar7 = (undefined2 *)local_26;
          }
        }
        ce_strcat(param_3,puVar7);
        ce_strcat(param_3,s_full_charge_00085cb8);
        if (iVar2 != 1) {
          ce_strcat(param_3,&DAT_00085cb4);
        }
      }
    }
    uVar6 = 1;
  }
  return uVar6;
}


// was FUN_00049008 -- "look" handler for inscribed objects (class
// range 0x160, dispatched from object_actions.c's look-description
// builder): terrain-plaque text for class 4, a gravestone epitaph
// looked up by index in grave.dat for class 5, or a sign/TMOBJ
// inscription (fetched via get_message_string, word-wrapped to the
// message scroll) for class 6, triggering the matching illustration
// popup once the full text has been shown.
void look_at_inscribed_object(param_1,param_2)
ushort * param_1;
short param_2;

{
  char stack0xffdc3238_buf [256];
  char *stack0xffdc3238_ptr;
  char cVar1;
  ushort uVar2;
  byte bVar3;
  char *pcVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  uint uVar9;
  short sVar10;
  char local_128 [8];
  char acStack_120 [260];
  /* iVar5 above is a real int (file handle) for the uVar8==5/grave.dat
     branch's open_file_for_read/CloseHandle calls -- but is reused later in the
     shared tail (untouched by that branch, e.g. the sign/TMOBJ uVar8==6
     case) to hold get_message_string's real `char *` return, truncating it on
     this 64-bit host. Confirmed via lldb: right-clicking a rendered sign
     (object type 0x166) crashed in strchr with a wild pointer, called
     from format_object_display_name(iVar5,...) here. Separate real-pointer local so
     each use keeps its own type. */
  char *pcVar_str;

  DEBUG(INFO, "Look mode object interact?");
  
  local_128[0] = '\0';
  sVar10 = 0x160;
  uVar2 = *param_1;
  uVar8 = uVar2 & 0xf;
  if (uVar8 == 4) {
    uVar8 = uVar2 & 0x1e00;
    if (uVar8 < 0x400) {
      print_scroll_message_by_id(0xab);
    }
    else {
      describe_picked_terrain(2,(uVar8 >> 9) + 0x2f);
    }
  }
  else {
    if (uVar8 != 5) {
      if (uVar8 != 6) {
        if (uVar8 < 0xe) {
          return;
        }
        if (0xf < uVar8) {
          return;
        }
        if (-1 < param_2) {
          describe_picked_terrain(2,((byte)param_1[3] & 0x3f) + 1);
        }
        if (param_2 < 1) {
          return;
        }
        if (((&DAT_0023add0)[(byte)param_1[3] & 0x3f] & 0xff) != 9) {
          return;
        }
        trigger_terrain_discovery_illustration();
        return;
      }
      sVar10 = 0x170;
    }
    if ((uVar2 & 0x8000) == 0) {
      uVar9 = (byte)param_1[3] & 0x3f;
    }
    else {
      uVar9 = (CONCAT11(*(undefined1 *)((char *)param_1 + 7),(byte)param_1[3]) & 0x7fc0) >> 6;
    }
    if (uVar8 == 5) {
      ce_memset(acStack_120,0,0x104);
      pcVar4 = &DAT_0023cca8;
    stack0xffdc3238_ptr = acStack_120;
      do {
        cVar1 = *pcVar4;
        *stack0xffdc3238_ptr = cVar1; stack0xffdc3238_ptr = stack0xffdc3238_ptr + 1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      ce_strcat(acStack_120,s__DATA_grave_dat_00085cf8);
      iVar5 = open_file_for_read(acStack_120);
      iVar6 = seek_file_handle(iVar5,(short)uVar9,0);
      iVar7 = read_file_handle(iVar5,local_128,1);
      bVar3 = CloseHandle(iVar5);
      if ((iVar7 == 1 & bVar3 & (iVar5 != -1 && iVar6 != -1)) == 0) {
        return;
      }
    }
    pcVar_str = (char *)get_message_string(uVar9 | 0x1000);
    if (pcVar_str != (char *)0x0 && local_128[0] != '\0') {
      msg_scroll_panel_reset(1);
    }
    if (((*param_1 & 0xf) == 6) || (local_128[0] == '\0')) {
      /* was two separate calls with message_scroll_print_wrapped()'s arg
         dropped -- same pattern already fixed at line ~9137: get_message_string's
         return (char *) flows straight into message_scroll_print_wrapped
         as its argument. Confirmed via UW_DEBUG_OBJPOS: this is the
         sign/plaque "The writing reads: " lead-in line. */
      message_scroll_print_wrapped((char *)get_message_string((*param_1 >> 9 & 0xf) + sVar10 | 0x1000));
    }
    if (pcVar_str != (char *)0x0) {
      /* Same dropped-argument pattern: format_object_display_name's real `undefined1 *`
         return (pcVar_str word-wrapped for the message scroll) is the
         actual real sign/inscription text ("We attacked the entrance
         with all manner of tools..."), confirmed via UW_DEBUG_OBJPOS. */
      message_scroll_print_wrapped((char *)format_object_display_name(pcVar_str,1,0));
      message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    }
    if (local_128[0] != '\0') {
      trigger_inscription_illustration(local_128[0]);
    }
  }
  return;
}


// was FUN_000492bc -- describes who a key/quest item belongs to: for
// an object whose quality field names an owner (not 0, 0x28, or the
// 0x3c-0x3e range), prints a scroll message (picking the "key" vs
// generic wording by class/flag) followed by either "an adventurer."
// (sentinel owner 0x3f) or the real owner's display name, built via a
// synthetic object record offset by the owner id.
void describe_object_owner(param_1,param_2)
ushort * param_1;
short param_2;

{
  ushort uVar1;
  ushort uVar2;
  undefined4 uVar3;
  char *pcVar4;
  ushort local_54 [13];
  undefined1 local_3a;
  undefined1 auStack_34 [40];
  
  if (param_2 != 0) {
    uVar2 = param_1[3];
    uVar1 = uVar2 & 0x3f;
    if ((((uVar2 & 0x3f) != 0) && (uVar1 != 0x28)) && ((uVar1 < 0x3c || (uVar1 == 0x3f)))) {
      uVar3 = 0x16;
      if (((*param_1 & 0x1ff) == 0xc6) || (0x40 < (uVar2 & 0xffc0))) {
        uVar3 = 0x17;
      }
      print_scroll_message_by_id(uVar3);
      uVar2 = (byte)param_1[3] & 0x3f;
      if (uVar2 == 0x3f) {
        pcVar4 = s_an_adventurer__00085d08;
      }
      else {
        local_54[0] = (uVar2 + 0x40 ^ local_54[0]) & 0x1ff ^ local_54[0];
        local_3a = 0;
        build_object_display_name(auStack_34,local_54,1,0);
        message_scroll_print_wrapped(auStack_34);
        pcVar4 = &DAT_00084f20;
      }
      message_scroll_print_wrapped(pcVar4);
    }
  }
  return;
}



// was FUN_000493cc -- prints a flavor-text scroll message keyed by
// the object's own sub-quality field (offset+6 & 0x3f, message range
// 100-163), if one exists for this object.
// BUG FIX (unit-testing-framework merge): param_1 was `int`, but its
// only real caller (describe_special_object_property) passes a real
// `ushort *` object pointer, which got truncated to 32 bits storing
// into this narrower parameter -- confirmed live (EXC_BAD_ACCESS in
// test_inventory dereferencing the truncated pointer). Widened to
// `ushort *`, with the +6 byte-offset access rewritten through a
// char* cast to keep its original byte-granularity (a ushort* +6 would
// instead mean +12 bytes).
void print_object_flavor_text(param_1,param_2)
ushort * param_1;
short param_2;

{
  int iVar1;

  if ((param_2 != 0) &&
     (iVar1 = get_message_string((*(byte *)((char *)param_1 + 6) & 0x3f) + 100 | 0xa00), iVar1 != 0)) {
    message_scroll_print_wrapped();
  }
  return;
}



// was FUN_000495d0 -- dispatches a "look" sub-description by object
// class bit-fields (subcategory uVar2, sub-subcategory uVar3): keys
// in class 0xc2-0xc6 get describe_object_owner; class-4 sub-type 3
// objects get read_object_text (books/scrolls); sub-type 0 gets
// print_object_flavor_text; class-5 sub-type 0 objects (ids 0-7) with
// their own quality flag bit set print a fixed scroll message.
// BUG FIX: param_2 was missing from this function's own declaration
// -- both of its real call sites (object_actions.c:161/607) pass two
// arguments, and every sibling it dispatches to
// (describe_object_owner/print_object_flavor_text/read_object_text)
// declares a real `short param_2` that gates its entire body
// (`if (param_2 != 0)`/`if (0 < param_2)`). Without param_2 declared
// here, those bare calls forwarded whatever garbage was left in that
// register instead of the caller's real value -- same dropped-
// parameter bug class as report_categorized_fatal_error earlier this
// session. Declare it and forward explicitly.
void describe_special_object_property(param_1,param_2)
ushort * param_1;
short param_2;

{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;

  uVar1 = *param_1;
  uVar3 = uVar1 >> 4 & 3;
  uVar2 = uVar1 >> 6 & 7;
  if (uVar2 == 3) {
    if (uVar3 == 0) {
      if ((0xc1 < (uVar1 & 0x1ff)) && ((uVar1 & 0x1ff) < 199)) {
        describe_object_owner(param_1,param_2);
      }
    }
  }
  else if (uVar2 == 4) {
    if (uVar3 == 3) {
      read_object_text(param_1,param_2);
    }
    else if (uVar3 == 0) {
      print_object_flavor_text(param_1,param_2);
    }
  }
  else if (((uVar2 == 5) && (uVar3 == 0)) && ((uVar1 & 0xf) < 8)) {
    if ((param_1[3] & 1) != 0) {
      print_scroll_message_by_id(0x83);
    }
  }
  return;
}


// was FUN_000496b0 -- called from describe_picked_terrain with a tile
// record (param_2): only acts on special-mushroom-bearing tiles
// (trap-type field bits 0x1e == 0x14), mapping the picked object's id
// to one of 9 known mushroom types and printing the matching "You
// have found a <type> mushroom" scroll-message pair.
undefined4 identify_mushroom_type(param_1,param_2)
ushort * param_1;
int param_2;

{
  ushort uVar1;
  int iVar2;
  short local_c;
  
  if ((*(byte *)(param_2 + 8) & 0x1e) != 0x14) {
    return 0;
  }
  uVar1 = *param_1 & 0x1ff;
  if (uVar1 < 0x98) {
    if (uVar1 == 0x97) {
      iVar2 = 2;
      goto LAB_000497a0;
    }
    if (uVar1 == 10) {
      iVar2 = 7;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x36) {
      iVar2 = 8;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x37) {
      iVar2 = 5;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x93) {
      iVar2 = 1;
      goto LAB_000497a0;
    }
  }
  else {
    if (uVar1 == 0xae) {
      iVar2 = 6;
      goto LAB_000497a0;
    }
    if (uVar1 == 0xbf) {
      iVar2 = 3;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x11f) {
      iVar2 = 4;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x136) {
      iVar2 = 0;
      goto LAB_000497a0;
    }
  }
  iVar2 = (int)local_c;
LAB_000497a0:
  print_scroll_message_by_id(0x104);
  print_scroll_message_by_id(iVar2 + 0x105);
  return 1;
}


// was FUN_0004a588 -- the general "spawn an object near a given
// actor" helper: if the actor is the player, aims from the cursor
// (compute_drop_aim_from_cursor); otherwise uses the actor's own
// position, falling back to the current tile if the actor is outside
// the live object arena. Used both for spell-effect object spawns
// (apply_targeted_spell_effect) and ranged-attack spawns. Returns
// whether the spawn succeeded.
bool spawn_object_near_actor(param_1,param_2)
ushort *param_1;
short param_2;

{
  ushort *puVar1; /* ARM 0x4a678 tests the returned object pointer for NULL. */
  
  DAT_00202a38 = param_2 + 0x10;
  DAT_00202a48 = (ushort)(byte)(&DAT_002027d1)[param_2 * 3];
  DAT_00202a4c = (ushort)(*((byte *)param_1 + 0x17) >> 2);
  DAT_00202a50 = (ushort)((param_1[11] & 0x3f0) >> 4);
  DAT_00202a54 = 1;
  DAT_00202a44 = param_1;
  if (param_1 == g_player_object) {
    compute_drop_aim_from_cursor();
  }
  else {
    if ((uintptr_t)DAT_002046c4 <= (uintptr_t)param_1) {
      DAT_00202a4c = (ushort)DAT_0023c3dc;
      DAT_00202a50 = (ushort)DAT_0023c3d8;
      DAT_00202a3c = 0;
    }
    DAT_00202a54 = (ushort)((uintptr_t)DAT_002046c4 > (uintptr_t)param_1);
    DAT_00202a40 = 0;
  }
  puVar1 = spawn_object_near_player();
  return puVar1 != 0;
}


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
