/* Containers: the open-container/backpack view stack (open/close,
 * nested levels, grid repopulate/scroll/refresh), auto-place/empty-
 * into-world, container weight sum, and the equipped-item slot
 * encode/decode. Split out of uw.c (the original monolithic
 * decompile) once these functions' real roles were confirmed.
 */
#include "headers/containers.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






void release_container_reference(param_1)
/* Was `int param_1` -- every call site passes g_current_container_record, a real
   64-bit pointer, which this narrower type truncates to 32 bits --
   same class as several other fixes this session (search "narrow
   local/parameter for a pointer"). */
char *param_1;

{
  ushort uVar1;
  ushort *puVar2;

  puVar2 = (ushort *)FUN_000535fc(*(ushort *)(param_1 + 8) >> 6);
  uVar1 = *puVar2;
  if (((uVar1 & 0xf) < 0xc) && ((uVar1 & 1) != 0)) {
    *(byte *)puVar2 = ((char)(uVar1 & 0xf) - 1U ^ (byte)uVar1) & 0xf ^ (byte)uVar1;
    *(byte *)((char *)puVar2 + 1) = (byte)(uVar1 >> 8);
  }
  return;
}



/* NOT YET FIXED (not on the crash path reached so far, but the same bug
   class as everywhere else in this file): the body below reads/writes
   through the literal `iVar1*4 + 0x202870`/`iVar10*4 + 0x202870` --
   a hardcoded original-binary address, same "probe_save_slots -0x87020"
   class fixed elsewhere. 0x202870 is 8 bytes before DAT_00202878 (itself
   only declared as a single `undefined` byte here, so also likely
   undersized) -- revisit both together if/when this function's icon
   save/restore path is actually exercised and crashes. */
void free_open_container_chain()

{
  char *_prev;

  if (g_current_container_record != 0) {
    /* Was reconstructing the "prev" chain link from the record's own
       byte-4..7 field (CONCAT13 of a 3-byte + 1-byte read) -- that field
       is only ever a truncated 32-bit half of a real 64-bit pointer (see
       open_backpack_container's own record-widening fix). Walk the real,
       untruncated prev pointer at +0x14 instead. Never triggered before
       because closing a container was unreachable until this session's
       earlier fixes got that far at all, and freeing a chain of TWO OR
       MORE records (this loop's actual reason to exist) needed the
       nested-container-open fix on top of that. */
    _prev = *(char **)(g_current_container_record + 0x14);
    while (_prev != 0) {
      /* Dropped argument: release_container_reference's declared signature takes the
         open-container tracking record being freed -- g_current_container_record,
         the current one, before it's overwritten by _prev below --
         same "wrapper forgot to forward its own argument" idiom as
         this whole session's other fixes. Never triggered before
         because closing a container (this whole function) was
         unreachable until this session's chain of fixes leading up to
         it -- confirmed live: leaving a container crashed here
         dereferencing the leftover-register garbage this left in
         param_1's place. */
      release_container_reference((char *)g_current_container_record);
      Ordinal_1018(g_current_container_record);
      g_current_container_record = _prev;
      _prev = *(char **)(g_current_container_record + 0x14);
    }
    g_open_container_list = 0;
    release_container_reference((char *)g_current_container_record);
    Ordinal_1018(g_current_container_record);
    g_current_container_record = 0;
  }
  return;
}




void close_backpack_container()

{
  int iVar1;
  undefined4 uVar2;
  
  if (g_current_container_record != 0) {
    free_open_container_chain();
    g_current_container_link = g_current_container_link & 0x3f;
    /* Clear the real "open container indicator" slot (widget 20, see
       DAT_00085c4c's own comment) now that nothing is open -- nothing
       else currently reads slot 19 outside that widget's own redraw,
       so this isn't load-bearing for the full-panel repaint below, but
       leaving a stale occupied reference there would be a latent trap
       for any future reader of this slot. */
    *(unsigned short *)(&g_equipped_items + DAT_00085c4c * 2) = 0;
    iVar1 = 0xb;
    do {
      (&g_backpack_widget_to_slot_plus1)[iVar1] = (char)iVar1;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    } while (iVar1 < 0x13);
    iVar1 = 0xc;
    do {
      uVar2 = (&DAT_002028e8)[iVar1];
      /* Same hardcoded-original-address bug already fixed in
         open_backpack_container (0x202870 = &DAT_002028a0 - 0xc*4) -- a second,
         separate occurrence in this sibling function. */
      (&DAT_002028e8)[iVar1] = (&DAT_002028a0)[iVar1 + -0xc];
      (&DAT_002028a0)[iVar1 + -0xc] = uVar2;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    } while (iVar1 < 0x14);
    FUN_00057118();
    if ((((short)DAT_00201b60 == 1) || ((short)DAT_00201b60 == 4)) && (g_active_hud_panel == '\0')) {
      FUN_00076e98(DAT_002028ec);
      FUN_00048110();
    }
    cursor_show_idle_tick();
    DAT_002029a0 = 0;
    DAT_0020299c = 0;
    /* Missing piece, matching open_backpack_container's own fix: nothing here
       actually redraws the panel after leaving a container -- confirmed
       live, closing left the dark background rect and the container's
       icon frozen on screen. open_backpack_container painted over the paperdoll's
       lower half and the grid's circle background (see its own
       comment); the cheapest reliable way to undo that without
       reverse-engineering a partial-restore path is to just redo the
       whole HUD/panel setup draw (background art, paperdoll body,
       compass, dragons) the same way it's drawn once at load, then
       redraw the 8 backpack-grid widgets on top so the player's own
       items reappear (the mapping above, via the g_backpack_widget_to_slot_plus1 alias,
       is already restored back to slots 11-18 by this point).

       redraw_hud_panels's own background blit (of this same DAT_0023cca4
       panel art) runs with transparency on, so it skips whatever
       palette-index-0 pixels the source art has in the leave-icon's
       specific spot (record 1, likely a genuinely transparent corner
       of the art rather than solid leather) -- leaving that one icon
       behind even after the "full" redraw below (confirmed live). Do
       one extra fully OPAQUE pass of the same blit first so every
       pixel there gets overwritten regardless. */
    g_blit_transparent_mode = 0;
    /* RESOLVED (was: body-shaped black cutout around the paperdoll after
       closing a container -- user report: "closing a container draws
       black areas under some of the paper doll section"). The real cause
       was THIS opaque pre-pass, not a missing redraw: it was added to
       paint over one small stale leftover (the "leave container" icon,
       hotspot record 1, in the SAME 0x72x0x53 native-pixel tile) before
       redraw_hud_panels's own call to the identical blit repaints it
       transparently -- but bitmap_blit_to_framebuffer's opaque mode
       writes EVERY source byte literally, including this panel-art
       tile's many genuinely-transparent-keyed pixels (byte value 0) that
       back the worn-item ring slots (shoulders/hands/fingers) and the
       rest of the panel's leather texture. Painting all of them solid
       black here, then having redraw_hud_panels's transparent pass
       correctly SKIP those same zero-valued source pixels (by design),
       permanently left them black -- the opaque pre-pass was blacking
       out the whole panel background, not just the one icon spot it was
       meant to fix. Confirmed live (screenshot diff): dropping this call
       entirely restores the ring backgrounds and shoulder/hand slots
       with no visible regression at the one spot this was meant to
       patch (redraw_hud_panels's own transparent blit, immediately
       after, is enough on its own -- whatever it leaves untouched there
       was already correct) -- EXCEPT for the container icon itself,
       see below. */
    redraw_hud_panels();
    /* User report: "opening and closing a bag leaves the container icon
       behind." This used to need a hand-added verbatim pixel restore
       here (g_container_icon_backup_grtile) because the container icon
       was this project's own hack, drawn at a guessed screen position
       nothing else ever redrew on close. Now that it's the real widget
       20 (see DAT_00085c4c's own comment), redraw_inventory_widget_range's
       own widget-20 special case handles this correctly on its own:
       it always restores DAT_00202938's saved background first, then
       only draws a sprite if slot 19 (zeroed a few lines above) is
       occupied -- so this call alone both clears the stale icon and
       leaves the spot correctly blank, no separate backup buffer
       needed. */
    redraw_inventory_widget_range(0xc,0x13);
    redraw_inventory_widget_range(0x14,0x14);
    redraw_inventory_widget(0x15);
    redraw_inventory_widget(0x16);
  }
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

void leave_nested_container_level()

{
  /* Was `int iVar1;` -- resolve_object_link returns a real 64-bit
     pointer, truncated to 32 bits by this narrower type (same class as
     dozens of other fixes this session), then immediately dereferenced
     via `*(ushort*)(iVar1+6)` below -- a wild-pointer crash. Never
     triggered before because this whole function (popping OUT of a
     container back to its parent) was unreachable until this session's
     nested-container-open fix made a parent/child chain possible to
     create in the first place. */
  char *iVar1;
  char *_old;

  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] leave_nested_container_level entry: g_open_container_list=%p g_current_container_record=%p prev=%p\n",
            (void *)g_open_container_list, (void *)g_current_container_record,
            g_current_container_record ? *(void **)(g_current_container_record + 0x14) : 0);
  if (g_open_container_list != 0) {
    /* Was `*(int *)(g_current_container_record + 4) == 0` -- the legacy
       byte-4..7 "prev" field is only ever a truncated 32-bit half of a
       real 64-bit pointer (see open_backpack_container's own record-
       widening fix); check the real, untruncated prev pointer at +0x14
       instead -- a truncated-but-nonzero value here would wrongly take
       the "pop a level" branch below instead of closing outright. */
    if (*(char **)(g_current_container_record + 0x14) == 0) {
      close_backpack_container();
    }
    else {
      /* Same dropped argument as free_open_container_chain's own fix -- forward the
         current g_current_container_record before it's overwritten below. */
      release_container_reference((char *)g_current_container_record);
      /* Was `g_current_container_record = *(undefined1 **)(g_current_container_record + 4);
         Ordinal_1018();` -- walked the same truncated legacy "prev" field
         (wild pointer the moment a real second record existed to walk
         to), then freed with NO argument at all (dropped, same idiom as
         the sibling fix above) instead of the OLD record this is meant
         to pop. Save the old pointer, walk the real +0x14 prev pointer,
         then free the right one. */
      _old = g_current_container_record;
      g_current_container_record = *(char **)(g_current_container_record + 0x14);
      Ordinal_1018(_old);
      *g_current_container_record = 0;
      g_current_container_record[1] = 0;
      g_current_container_record[2] = 0;
      g_current_container_record[3] = 0;
      /* This record is the tail again now that its child was just freed. */
      *(char **)(g_current_container_record + 0xc) = 0;
      g_current_container_link = *(undefined2 *)(g_current_container_record + 8);
      iVar1 = (char *)resolve_object_link(&g_current_container_link);
      if (getenv("UW_DEBUG_INV"))
        fprintf(stderr, "[inv] leave_nested_container_level: popped to record=%p g_current_container_link=0x%04x resolved=%p\n",
                (void *)g_current_container_record, (unsigned)g_current_container_link, (void *)iVar1);
      _DAT_00202978 = (_DAT_00202978 ^ *(ushort *)(iVar1 + 6)) & 0x3f ^ *(ushort *)(iVar1 + 6);
      /* User QA: "the container indicator does not update to show the
         current container icon" after popping back to a parent -- this
         is now the real widget 20 (see DAT_00085c4c's own comment),
         updated a few lines below by pointing slot 19 at the parent's
         link before redraw_inventory_widget_range(0x14,0x14) runs. */
      repopulate_container_grid_slots();
      refresh_container_view();
      /* The real "open container indicator" (widget 20, see
         DAT_00085c4c's own comment): point slot 19 at the SAME object
         g_current_container_link already refers to (just re-resolved
         above, now the parent we popped back to) -- same "second copy
         of the same link value, resolve_object_link doesn't care which
         address you point it at" pattern open_backpack_container's own
         g_current_container_link assignment already established. */
      *(unsigned short *)(&g_equipped_items + DAT_00085c4c * 2) = g_current_container_link;
      redraw_inventory_widget_range(0x14,0x14);
    }
  }
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

void refresh_container_view()

{
  short sVar1;
  int iVar2;
  
  FUN_00057118();
  redraw_inventory_widget_range(0xc,0x13);
  iVar2 = resolve_object_link(&g_current_container_link);
  iVar2 = iVar2 + 6;
  while ((iVar2 = resolve_object_link(iVar2), iVar2 != 0 && ((*(byte *)(iVar2 + 1) & 0x40) != 0))) {
    iVar2 = iVar2 + 4;
  }
  sVar1 = encode_object_slot_index();
  DAT_002029a0 = (uint)((uint)(_DAT_00202978 >> 6) != (int)sVar1);
  DAT_0020299c = (uint)((DAT_00202986 & 0xffc0) != 0);
  redraw_inventory_widget(0x15);
  redraw_inventory_widget(0x16);
  cursor_show_idle_tick();
  return;
}



void repopulate_container_grid_slots()

{
  undefined2 uVar1;
  byte bVar2;
  /* Was `int iVar3;`/`int iVar5;` for the parts of this function where
     they hold real resolve_object_link() pointers (truncated to 32 bits
     on this 64-bit host, same class as leave_nested_container_level's
     own sibling fix right above -- never triggered before because this
     function, called from leave_nested_container_level, was itself
     unreachable until a real parent/child container chain could exist).
     iVar5 ALSO has a second, genuine plain-int role later in this same
     function (a slot-index loop counter) -- left as `int` there and
     given its own pointer-typed local (_pMatch) for just the one
     resolve_object_link comparison that needed it. */
  char *pContents;
  char *_pMatch;
  uint uVar4;
  int iVar5;
  int iVar6;

  iVar6 = 0x14;
  do {
    if ((*(ushort *)(&g_equipped_items + iVar6 * 2) & 0xffc0) != 0) break;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 0x1c);
  pContents = (char *)resolve_object_link(&g_current_container_link);
  pContents = (char *)resolve_object_link((ushort *)(pContents + 6));
  if ((short)iVar6 < 0x1c) {
    do {
      _pMatch = (char *)resolve_object_link(&g_equipped_items + (short)iVar6 * 2);
      if (pContents == _pMatch) {
        iVar6 = 0x14;
        do {
          uVar4 = encode_object_slot_index(pContents);
          iVar5 = (short)iVar6 * 2;
          (&g_equipped_items)[iVar5] = (&g_equipped_items)[iVar5] & 0x3f | (byte)((uVar4 & 0x3ff) << 6);
          (&DAT_00202951)[iVar5] = (char)((uVar4 << 0x16) >> 0x18);
          if (pContents != 0) {
            if ((*(byte *)(pContents + 1) & 0x40) != 0) {
              iVar6 = ((short)iVar6 + -1) * 0x10000 >> 0x10;
            }
            pContents = (char *)resolve_object_link((ushort *)(pContents + 4));
          }
          iVar6 = iVar6 + 1;
        } while (iVar6 * 0x10000 >> 0x10 < 0x1c);
        return;
      }
      pContents = (char *)resolve_object_link((ushort *)(pContents + 4));
    } while (pContents != 0);
    /* User QA: "closing a nested container [is] stuck on [the child's]
       contents" -- confirmed the real bug here. This loop is searching
       for whatever's CURRENTLY sitting in slots 20-27 (stale leftover
       from whichever container was open last) inside the NEW container's
       own top-level chain, so it can resume the scroll position where
       the player left off. That's the right idea when re-opening the
       SAME container, but when popping from a child back to its parent
       (leave_nested_container_level), the stale slots hold the CHILD's
       items -- which are never direct members of the PARENT's own
       chain -- so this search always exhausts with no match, and the
       original code just returned here having populated nothing at
       all, leaving the grid stuck showing the child's last contents.
       Fall back to populating fresh from the chain's own start, exactly
       like the "nothing currently occupying these slots" case below
       already does. */
    pContents = (char *)resolve_object_link(&g_current_container_link);
    pContents = (char *)resolve_object_link((ushort *)(pContents + 6));
  }
  iVar6 = 0x14;
  do {
    uVar4 = encode_object_slot_index(pContents);
    iVar5 = (short)iVar6 * 2;
    (&g_equipped_items)[iVar5] = (&g_equipped_items)[iVar5] & 0x3f | (byte)((uVar4 & 0x3ff) << 6);
    (&DAT_00202951)[iVar5] = (char)((uVar4 << 0x16) >> 0x18);
    if (pContents != 0) {
      if ((*(byte *)(pContents + 1) & 0x40) != 0) {
        iVar6 = ((short)iVar6 + -1) * 0x10000 >> 0x10;
      }
      pContents = (char *)resolve_object_link((ushort *)(pContents + 4));
    }
    iVar6 = iVar6 + 1;
  } while (iVar6 * 0x10000 >> 0x10 < 0x1c);
  while (pContents != 0) {
    iVar6 = 0x14;
    do {
      iVar5 = iVar6 * 2;
      uVar1 = *(undefined2 *)(iVar5 + 0x202958);
      bVar2 = (byte)uVar1;
      (&g_equipped_items)[iVar5] = ((&g_equipped_items)[iVar5] ^ bVar2) & 0x3f ^ bVar2;
      (&DAT_00202951)[iVar5] = (char)((ushort)uVar1 >> 8);
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < 0x18);
    for (; iVar5 = (int)(short)iVar6, iVar5 < 0x1c; iVar6 = iVar6 + 1) {
      uVar4 = encode_object_slot_index(pContents);
      (&g_equipped_items)[iVar5 * 2] =
           (&g_equipped_items)[iVar5 * 2] & 0x3f | (byte)((uVar4 & 0x3ff) << 6);
      (&DAT_00202951)[iVar5 * 2] = (char)((uVar4 << 0x16) >> 0x18);
      if (pContents != 0) {
        if ((*(byte *)(pContents + 1) & 0x40) != 0) {
          iVar6 = (iVar5 + -1) * 0x10000 >> 0x10;
        }
        pContents = (char *)resolve_object_link((ushort *)(pContents + 4));
      }
    }
  }
  return;
}



void open_backpack_container(param_1)
short param_1;

{
  int iVar1;
  int iVar2;
  ushort uVar3;
  short sVar4;
  byte bVar5;
  undefined4 *puVar6;
  ushort *puVar7;
  undefined4 uVar8;
  undefined4 *puVar9;
  int iVar10;
  int iVar11;
  uint uVar12;
  ushort *puVar13;
  /* iVar10/iVar11 are reused elsewhere in this function as plain int
     loop counters (0xc..0x13 etc) -- real uses, left alone -- but the
     container-open sequence below also stored real 64-bit
     resolve_object_link() pointers into them, truncating to 32 bits on
     this host (same class as many other fixes this session). New,
     properly-typed locals for just that pointer use. */
  ushort *puVar14;
  ushort *puVar15;
  
  iVar1 = (int)param_1;
  puVar13 = (ushort *)(&g_equipped_items + iVar1 * 2);
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] open_backpack_container entry: param_1=%d puVar13=%p\n", (int)param_1, (void *)puVar13);
  puVar7 = (ushort *)resolve_object_link(puVar13);
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] open_backpack_container: resolve_object_link -> puVar7=%p\n", (void *)puVar7);
  uVar3 = *puVar7;
  if (((uVar3 & 0x1c0) == 0x80) && ((uVar3 & 0x30) == 0)) {
    if ((uVar3 & 0xf) == 0xf) {
      set_hud_status_value(6,1);
    }
    else {
      if (g_open_container_list == (undefined4 *)0x0) {
        FUN_00057118();
        if ((((short)DAT_00201b60 == 1) || ((short)DAT_00201b60 == 4)) && (g_active_hud_panel == '\0')) {
          draw_sprite_by_id(0x2097,0xec,0x51,0x29,0x54);
        }
        /* Was also followed by a hand-added `set_draw_color(0);
           rect_fill_or_save_restore(0xf0,0x50,0x13c,0x76);` -- a flat
           dark rectangle painted over the whole 8-cell grid area,
           standing in for the container-view background because the
           real 0x2097 sprite draw just above "drew nothing visible in
           testing, likely a never-recovered/empty .GR resource slot"
           (same class as the scroll-edge decoration gap this whole
           session's resource-corruption fixes, see
           mode-icon-and-hud-icon-flicker-fixes.md, were chasing).
           That gap is closed now: confirmed live (UW_DEBUG_INV
           instrumentation on blit_object_sprite_by_frame's
           absolute-frame-table branch) that id 0x2097 resolves to
           frame 832, a real non-null slot with genuine 41x85
           dimensions -- not the dummy/empty fallback this hack was
           written to paper over. Dropped the rectangle; the real
           sprite draw above now supplies the container-view
           background on its own, matching direct playtest
           confirmation that it renders correctly in real gameplay. */
        if (DAT_002028a0 == 0) {
          iVar10 = 0xc;
          do {
            iVar11 = iVar10 * 0xe;
            uVar8 = grtile_alloc_registered((&g_inv_hotspot_dirty_w)[iVar11],(uint)(byte)(&g_inv_hotspot_dirty_h)[iVar11] << 1);
            sVar4 = (&g_inv_hotspot_draw_y)[iVar10 * 7];
            (&DAT_002028a0)[iVar10 + -0xc] = uVar8;
            /* Was a hardcoded original-binary literal address
               (0x202870 = &DAT_002028a0 - 0xc*4 in the original 32-bit
               address space) instead of the general symbolic form the
               write just above already uses for this same array --
               same "hardcoded address" bug class as the iVar5==10/11
               case a few thousand lines up (search "probe_save_slots's
               -0x87020"). Reads back the uVar8 just written one line
               above; never triggered before because nothing reached
               this never-before-exercised container-interact path
               until this session's chain of fixes leading up to it. */
            capture_framebuffer_rect_to_grtile((&DAT_002028a0)[iVar10 + -0xc],
                         (int)(short)(&g_inv_hotspot_draw_x)[iVar10 * 7],(int)sVar4,(&g_inv_hotspot_dirty_w)[iVar11],
                         (&g_inv_hotspot_dirty_h)[iVar11]);
            iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
          } while (iVar10 < 0x14);
        }
        /* Widget 20's own background-save, same role/pattern as the
           g_container_icon_backup_grtile allocation above and the
           DAT_002028a0 loop just above that (for widgets 12-19) --
           this one's real "open container indicator" mechanism (see
           DAT_00085c4c's own comment) needs FUN_00076e98(DAT_00202938)
           to have real saved pixels to restore before its own sprite
           draw, same as every other widget's redraw. Never allocated
           before because nothing reached this branch: widget 20's own
           click rect didn't exist in the hotspot table until it was
           recovered from the real binary. */
        if (DAT_00202938 == 0) {
          DAT_00202938 = grtile_alloc_registered((&g_inv_hotspot_dirty_w)[20 * 0xe],
                       (uint)(byte)(&g_inv_hotspot_dirty_h)[20 * 0xe] << 1);
          capture_framebuffer_rect_to_grtile(DAT_00202938,
                       (int)(short)(&g_inv_hotspot_draw_x)[20 * 7],(int)(short)(&g_inv_hotspot_draw_y)[20 * 7],
                       (&g_inv_hotspot_dirty_w)[20 * 0xe],(&g_inv_hotspot_dirty_h)[20 * 0xe]);
        }
        cursor_show_idle_tick();
        /* Was a hardcoded original-binary literal address (0x85c30) --
           same bug class as this function's own 0x202870 fix just
           above -- but unlike that one, nothing anywhere else in this
           file ever reads address 0x85c30 back symbolically or
           otherwise (confirmed via a whole-file grep), so whatever
           real array this once identity-filled is both unrecoverable
           and provably dead. On this 64-bit host 0x85c30 is just an
           unmapped low address, so left as-is this writes 8 bytes
           (iVar10=0x14..0x1b) into unmapped memory and crashes --
           never triggered before since nothing reached this
           never-before-exercised path this session's earlier fixes.
           Dropped instead of guessing at backing storage nothing reads. */
        iVar10 = 0xc;
        do {
          uVar8 = (&DAT_002028e8)[iVar10];
          /* Same hardcoded-original-address bug as this function's
             other 0x202870 fix above (0x202870 = &DAT_002028a0 -
             0xc*4). */
          (&DAT_002028e8)[iVar10] = (&DAT_002028a0)[iVar10 + -0xc];
          (&DAT_002028a0)[iVar10 + -0xc] = uVar8;
          iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
        } while (iVar10 < 0x14);
      }
      else {
        puVar9 = (undefined4 *)g_open_container_list;
        do {
          if (((*(ushort *)(puVar9 + 2) ^ *puVar13) & 0xffc0) == 0) {
            close_backpack_container();
            return;
          }
          /* Was `puVar9 = (undefined4 *)*puVar9;` -- walking this chain
             "forward" via the record's own byte-0..3 "next" field, which
             open_backpack_container's own record-creation code below
             only ever wrote as a truncated 32-bit half of a real 64-bit
             pointer (same bug class as g_open_container_list itself,
             just embedded field-by-field instead of in a single global).
             Harmless as long as at most one record ever existed to walk
             through; reading it back as a full 8-byte pointer here wildly
             mis-derefs the moment a second (nested) container is open.
             Real, untruncated forward pointer now lives at the new +0xc
             field this record-creation code below also writes. */
          puVar9 = *(undefined4 **)((char *)puVar9 + 0xc);
        } while (puVar9 != (undefined4 *)0x0);
        if (iVar1 < 0xb) {
          free_open_container_chain();
        }
      }
      /* User QA (historical, now resolved by the real widget-20
         mechanism below rather than a dedicated draw call here):
         "open container indicator slot does not show the 'open'
         version of a container like it should" + "opening a nested
         container does not update to show the new container." Real
         UW1 containers in this id range come in even/odd closed/open
         pairs (confirmed via COMOBJ.DAT names: 0x080 "a_sack"/0x081
         "an_open sack", 0x082 "a_pack"/0x083 "an_open pack", 0x086
         "a_pouch"/0x087 "an_open pouch", 0x08a "a_gold coffer"/0x08b
         "an_open gold coffer", 0x088 "a_map case"/0x089 "an_open map
         case") -- the toggle to the open id a few lines below (via
         resolve_object_link(&g_current_container_link)) already keeps
         the container object's OWN id correctly showing "open" while
         it's open; since slot 19 is just a second reference to that
         same object (see DAT_00085c4c's own comment), the widget-20
         redraw naturally shows the right variant with no separate
         "OR in the open bit" step needed, and (being driven by
         g_current_container_link, re-pointed at whichever container is
         current on every open/pop) it updates for nested opens too. */
      /* Record grew from 0xc (12) to 0x1c (28) bytes: the original
         12-byte layout (0-3 next / 4-7 prev / 8-9 container-link / 10-11
         weight) only ever stored its next/prev CHAIN LINKS as 4-byte
         fields -- correct on the original 32-bit target where a pointer
         IS 4 bytes, but every one of them is a real 64-bit heap pointer
         on this host (same class as g_open_container_list just above).
         Rather than reshuffle every existing +8/+9/+10/+11 accessor
         throughout this file (release_container_reference,
         leave_nested_container_level, free_open_container_chain, the
         combine/stow paths, etc. -- dozens of sites), the legacy 0-3/4-7
         fields are left as harmless (if lossy) leftovers and two new
         real 8-byte pointer fields are appended: +0xc = next, +0x14 =
         prev. Only the chain-WALKING sites (here, and
         leave_nested_container_level / free_open_container_chain) needed
         updating to read these instead; every plain "is there a
         next/prev at all" NULL check and every +8..+11 field access
         keeps working unchanged. */
      puVar9 = (undefined4 *)Ordinal_1041(0x1c);
      if (puVar9 != (undefined4 *)0x0) {
        if (g_open_container_list == (undefined4 *)0x0) {
          g_open_container_list = (char *)puVar9;
          g_current_container_record = (char *)puVar9;
          *(undefined1 *)(puVar9 + 1) = 0;
          *(undefined1 *)((char *)puVar9 + 5) = 0;
          *(undefined1 *)((char *)puVar9 + 6) = 0;
          *(undefined1 *)((char *)puVar9 + 7) = 0;
          *(char **)((char *)puVar9 + 0xc) = 0;
          *(char **)((char *)puVar9 + 0x14) = 0;
        }
        else {
          *(char *)g_current_container_record = (char)puVar9;
          *(char *)((char *)g_current_container_record + 1) = (char)((uint)puVar9 >> 8);
          *(char *)((char *)g_current_container_record + 2) = (char)((uint)puVar9 >> 0x10);
          *(char *)((char *)g_current_container_record + 3) = (char)((uint)puVar9 >> 0x18);
          puVar6 = (undefined4 *)g_current_container_record;
          *(char *)(puVar9 + 1) = (char)g_current_container_record;
          *(char *)((char *)puVar9 + 5) = (char)((uint)puVar6 >> 8);
          *(char *)((char *)puVar9 + 6) = (char)((uint)puVar6 >> 0x10);
          *(char *)((char *)puVar9 + 7) = (char)((uint)puVar6 >> 0x18);
          /* Real (untruncated) chain links: the OLD current record's
             "next" now really points at the new one, and the new one's
             "prev" really points back at the old one. */
          *(char **)((char *)g_current_container_record + 0xc) = (char *)puVar9;
          *(char **)((char *)puVar9 + 0x14) = g_current_container_record;
          *(char **)((char *)puVar9 + 0xc) = 0;
          /* Was `g_current_container_record = (undefined4 *)*g_current_container_record;`
             -- reading back the truncated 4-byte "next" field this same
             block just wrote 4 lines above, purely to reconstruct the
             pointer it already had in `puVar9` the whole time (a lossless
             round-trip on the original 32-bit target, a wild-pointer read
             on this 64-bit host). Just use puVar9 directly -- this is the
             actual crash this whole record-widening fix was chasing
             (reported: "placing a container in another container and
             trying to open the nested one"). */
          g_current_container_record = (char *)puVar9;
        }
        *(undefined1 *)g_current_container_record = 0;
        *(undefined1 *)((char *)g_current_container_record + 1) = 0;
        *(undefined1 *)((char *)g_current_container_record + 2) = 0;
        *(undefined1 *)((char *)g_current_container_record + 3) = 0;
        *(undefined1 *)((char *)g_current_container_record + 10) = 0;
        *(undefined1 *)((char *)g_current_container_record + 0xb) = 0;
        uVar3 = *puVar13;
        bVar5 = (byte)uVar3;
        /* Was `*(byte *)(g_current_container_record + 2) = ...` -- byte
           offset 2, not 8. g_current_container_record is declared
           `char *` (retyped for 64-bit pointer safety, same class as
           this whole session's other fixes), so "+2" here means literal
           byte offset 2 -- but this expression's own "2" only makes
           sense as an `undefined4 *`-scaled offset (2*4=8 bytes),
           matching what release_container_reference's own read
           (`*(ushort*)(param_1+8)`, real byte offset 8, param_1 also
           `char *`) expects, and confirmed via real ARM disassembly
           (0x4346c ldrb/0x4348c strb, both `[r0,#0x8]`) to be the
           correct target. The retype from `undefined4 *` to `char *`
           silently changed this literal "+2"'s meaning without anyone
           rescaling it to "+8" to match -- so this write landed on byte
           offset 2 (colliding with the unrelated "next/link" field just
           zeroed above) while the real target, offset 8, was left
           permanently zero (its own explicit-zero pass, lines above,
           never covers 8 either). release_container_reference then read
           a 16-bit value assembled from an always-zero byte 8 and this
           uVar3-derived byte 9, silently losing byte 8's own bits and
           landing on the wrong object's slot when decrementing it on
           container close. Confirmed live: this corrupted an unrelated
           nearby object (matching a user report that closing and
           reopening a container "loses other contents seemingly
           randomly" after equipping an item from it). */
        *(byte *)((char *)g_current_container_record + 8) =
             (*(byte *)((char *)g_current_container_record + 8) ^ bVar5) & 0x3f ^ bVar5;
        *(char *)((char *)g_current_container_record + 9) = (char)(uVar3 >> 8);
        /* Was `g_current_container_link = (g_current_container_link ^ *(ushort*)(g_current_container_record+2))
           & 0x3f ^ *(ushort*)(g_current_container_record+2)` -- a "keep bits inside
           the mask from the left operand, take bits outside the mask
           from the right operand" idiom, matching this file's usual
           bit-assignment style elsewhere. But the right operand here
           (offset+2/+3 of the fresh tracking record) only ever holds
           bVar5 -- uVar3's own LOW BYTE -- with its own low 6 bits
           already zeroed by the line just above, so at most 2 real
           bits of uVar3 (bits 6-7) ever survive into g_current_container_link; the
           object link's real identifying bits (the whole upper byte,
           uVar3>>8, encoding which arena and slot the container lives
           in) never reach it at all. Confirmed live with real numbers
           (UW_DEBUG_INV): uVar3=0xeb80 (a real, valid high-arena
           object link, the same value puVar13 -> puVar7 already
           resolved correctly moments earlier) produced
           g_current_container_link=0x0080 -- decodes as low-arena slot 2, a
           completely different, essentially garbage object -- so every
           container this ever ran on read back an unrelated object's
           (empty) contents instead of its own. The starting-room sack
           genuinely has 6 items in the level data (confirmed via the
           new UW_DUMP_CONTAINERS_FILE tool), so the "empty contents"
           result in this whole feature's earlier testing was this bug,
           not empty source data. Fix: g_current_container_link only needs to be a
           second copy of the exact same link value puVar13 already
           held (same encoding, resolve_object_link doesn't care which
           address you point it at) -- drop the broken partial-bit
           idiom and just copy it directly. */
        g_current_container_link = uVar3;
        puVar14 = (ushort *)resolve_object_link(&g_current_container_link);
        puVar15 = (ushort *)resolve_object_link((ushort *)((char *)puVar14 + 6));
        if (getenv("UW_DEBUG_INV"))
          fprintf(stderr, "[inv] open_backpack_container open: container=%p contents_head=%p\n",
                  (void *)puVar14, (void *)puVar15);
        sum_container_weight((ushort *)((char *)puVar14 + 6),(undefined1 *)((char *)g_current_container_record + 10));
        iVar10 = 0x14;
        do {
          uVar12 = encode_object_slot_index(puVar15);
          iVar2 = (int)(short)iVar10;
          (&g_equipped_items)[iVar2 * 2] =
               (&g_equipped_items)[iVar2 * 2] & 0x3f | (byte)((uVar12 & 0x3ff) << 6);
          (&DAT_00202951)[iVar2 * 2] = (char)((uVar12 << 0x16) >> 0x18);
          if (puVar15 != NULL) {
            if ((*(byte *)((char *)puVar15 + 1) & 0x40) != 0) {
              iVar10 = (iVar2 + -1) * 0x10000 >> 0x10;
            }
            puVar15 = (ushort *)resolve_object_link((ushort *)((char *)puVar15 + 4));
          }
          iVar10 = iVar10 + 1;
        } while (iVar10 * 0x10000 >> 0x10 < 0x1c);
        /* Missing piece, not present anywhere in the decompiled body:
           the container's contents are now sitting in slots 20-27, but
           nothing ever repointed the 8 visible grid widgets (12-19) at
           them -- they still map to 11-18 (the player's own backpack,
           via g_backpack_widget_to_slot's default N -> N-1), so the panel kept
           showing the backpack, unchanged, after "opening" a container
           (confirmed live: no visual change on click). Remap widgets
           12-19 -> slots 20-27 (N -> N+8) for as long as this container
           stays open -- close_backpack_container (close) already resets this same
           table back to its default 11-18 via g_backpack_widget_to_slot_plus1 -- and
           redraw all 8 cells so the container's contents actually
           appear. */
        for (iVar10 = 0xc; iVar10 < 0x14; iVar10 = iVar10 + 1) {
          (&g_backpack_widget_to_slot)[iVar10] = (char)(iVar10 + 8);
        }
        redraw_inventory_widget_range(0xc,0x13);
        puVar7 = (ushort *)resolve_object_link(&g_current_container_link);
        uVar3 = *puVar7;
        if (((uVar3 & 0xf) < 0xc) && ((uVar3 & 1) == 0)) {
          *(byte *)puVar7 = ((char)(uVar3 & 0xf) + 1U ^ (byte)uVar3) & 0xf ^ (byte)uVar3;
          *(byte *)((char *)puVar7 + 1) = (byte)(uVar3 >> 8);
        }
        refresh_container_view();
        /* The real "open container indicator" (widget 20, see
           DAT_00085c4c's own comment): point slot 19 at the same
           object g_current_container_link was just set to a few lines
           above (this container's own link). */
        *(unsigned short *)(&g_equipped_items + DAT_00085c4c * 2) = g_current_container_link;
        redraw_inventory_widget_range(0x14,0x14);
        if ((char)(&g_backpack_slot_to_widget)[iVar1] < '\v') {
          redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar1]);
        }
      }
    }
  }
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00043614 -- container-grid scroll up, dispatched from
// handle_object_drop_target's `iVar2==0x15` case (widget 21's own
// real click rect, see g_inventory_hotspot_table's comment); its own
// redraw (widget 21's up-arrow icon) is gated on this same
// DAT_0020299c "can scroll up" flag in redraw_inventory_widget.
void scroll_container_grid_up()

{
  if ((g_open_container_list != 0) && (DAT_0020299c != 0)) {
    _DAT_00202978 = DAT_00202980;
    repopulate_container_grid_slots();
    refresh_container_view();
  }
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0004365c -- container-grid scroll down, the DAT_002029a0
// ("can scroll down") counterpart to scroll_container_grid_up, same
// dispatch/redraw pattern via widget 22.
void scroll_container_grid_down()

{
  short sVar1;
  char *iVar2;
  char *iVar3;
  char *iVar4;
  int iVar5;

  if ((g_open_container_list != 0) && (DAT_002029a0 != 0)) {
    /* Was `resolve_object_link(g_current_container_record + 8)` -- a
       tracking record lives outside the level's object arena
       resolve_object_link bounds-checks against, always NULL on this
       host (same already-established `g_current_container_link`
       workaround as elsewhere in this file). iVar2/3/4 were also plain
       `int`, truncating every resolve_object_link() pointer they held
       -- this whole function only ever uses them as pointers (a
       content-chain scroll search), so retyped outright rather than
       introducing yet more dedicated locals. */
    g_current_container_link = *(undefined2 *)(g_current_container_record + 8);
    iVar2 = (char *)resolve_object_link(&g_current_container_link);
    iVar3 = (char *)resolve_object_link((ushort *)(iVar2 + 6));
    iVar4 = (char *)resolve_object_link(&DAT_00202978);
    iVar2 = iVar3;
    if (iVar3 != iVar4) {
      do {
        iVar3 = iVar2;
        iVar5 = 0;
        iVar2 = iVar3;
        do {
          iVar2 = (char *)resolve_object_link((ushort *)(iVar2 + 4));
          if (iVar2 == 0) {
            return;
          }
          if (iVar2 == iVar4) goto LAB_00043700;
          iVar5 = iVar5 + 1;
        } while (iVar5 * 0x10000 >> 0x10 < 4);
      } while( true );
    }
LAB_00043700:
    sVar1 = encode_object_slot_index(iVar3);
    _DAT_00202978 = _DAT_00202978 & 0x3f | sVar1 << 6;
    repopulate_container_grid_slots();
    refresh_container_view();
  }
  return;
}



// WARNING: Removing unreachable block (ram,0x00043adc)

undefined4 auto_place_in_container(param_1,param_2)
ushort * param_1;
short param_2;

{
  byte bVar1;
  ushort uVar2;
  short sVar3;
  ushort *puVar4;
  undefined4 uVar5;
  ushort *puVar6;
  uint uVar7;
  int iVar8;
  char *iVar9;
  int iVar10;
  bool bVar11;
  short local_28;
  ushort _parentLink;

  bVar11 = false;
  /* Dropped arguments -- same bare call as place_object_in_backpack_slot's identical
     fix just above (search "check_object_fits_in_slot's declared signature"). */
  sVar3 = check_object_fits_in_slot(param_1, param_2);
  if (sVar3 == 0) {
LAB_000438ac:
    uVar5 = 0;
  }
  else {
    iVar10 = (int)param_2;
    /* Both `g_current_container_record + 4` reads below were the legacy
       4-byte "prev" field -- only ever a truncated half of a real
       64-bit pointer (see open_backpack_container's record-widening
       comment); walk the real +0x14 pointer instead. The second one
       also fed the truncated value straight into resolve_object_link as
       if it were an object pointer's own base -- a tracking record
       lives outside the level's object arena (same "was always NULL on
       this host" class as the several already-fixed
       `resolve_object_link(g_current_container_record + 8)` call sites
       elsewhere in this file), so even with the pointer fixed this still
       needs to go through a local copy of the record's own saved link
       (`_parentLink`), the same workaround `g_current_container_link`
       already established, not a direct resolve through the record's
       own memory. */
    if ((iVar10 == 0x13) && (*(char **)(g_current_container_record + 0x14) == 0)) {
      iVar10 = 0xb;
      do {
        if ((*(ushort *)(&g_equipped_items + iVar10 * 2) & 0xffc0) == 0) {
          bVar11 = true;
          break;
        }
        iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
      } while (iVar10 < 0x13);
      local_28 = (short)iVar10;
      puVar4 = g_player_object;
      if (0x12 < local_28) goto LAB_000438ac;
LAB_0004386c:
      iVar9 = 0;
    }
    else {
      if ((iVar10 == 0x13) &&
         (iVar9 = *(char **)(g_current_container_record + 0x14), iVar9 != 0)) {
        /* resolve_object_link rejects a pointer to an ordinary stack
           local (confirmed live: `_parentLink` as a plain local always
           resolved to NULL, crashing the very next dereference) -- it
           only accepts globals (the object arena, or this file's own
           handful of established global "scratch link" spots like
           g_current_container_link itself). Save/restore that global
           around the resolve instead of introducing a new local: this
           function is asked to place into the PARENT while
           g_current_container_link still needs to keep meaning "the
           currently open (child) container" for anything else that
           reads it before this function returns. */
        _parentLink = g_current_container_link;
        g_current_container_link = *(ushort *)(iVar9 + 8);
        puVar4 = (ushort *)resolve_object_link(&g_current_container_link);
        g_current_container_link = _parentLink;
      }
      else {
        puVar4 = (ushort *)resolve_object_link(&g_equipped_items + iVar10 * 2);
        iVar9 = g_current_container_record;
        if (iVar10 < 0x14) {
          local_28 = 0;
          goto LAB_0004386c;
        }
      }
      local_28 = 0;
    }
    if ((*puVar4 & 0x1ff) == 0x8f) {
      /* Real ARM binary calls FUN_0004479c() with 0 args here too
         (confirmed via Ghidra decompile of the real auto_place_in_container
         at 0x43734) -- same "leftover register" reliance already found
         3 times this session (blit_sprite_row_remapped,
         draw_hotspot_crosshair_marker's caller in handle_barter_slot_click,
         collision_build_height_field's neighbor lookups). FUN_0004479c's
         param_1 is the object being checked against the rune item-id
         range (0xe8-0x100) -- exactly this function's own param_1,
         untouched since entry (last read a few lines up in
         check_object_fits_in_slot's call), so that's what's actually
         sitting in the register at this point. Passed explicitly since a
         C recompile has no equivalent "whatever's left in the register"
         state: the previously-uninitialized read made FUN_0004479c
         almost always reject a genuine rune, always printing "You can
         only put runes in the runes bag" even when dragging a real rune
         into the rune bag. */
      iVar10 = FUN_0004479c(param_1);
      if (iVar10 == 0) {
        FUN_00078c80(0xf7);
        goto LAB_000438ac;
      }
    }
    else {
      iVar10 = FUN_00046260(param_1);
      g_player_carry_weight = g_player_carry_weight + (short)iVar10;
      /* Legacy truncated "prev" walk -- same fix as
         place_object_in_backpack_slot's sibling copy (search "still
         broken for genuine container nesting"). Note `iVar9` here was
         already set to either 0 or a real (untruncated, per the fix
         above) tracking-record pointer, so this walk is now consistent. */
      for (; iVar9 != 0; iVar9 = *(char **)(iVar9 + 0x14)) {
        iVar8 = *(short *)(iVar9 + 10) + iVar10;
        *(char *)(iVar9 + 10) = (char)iVar8;
        *(char *)(iVar9 + 0xb) = (char)((uint)iVar8 >> 8);
      }
      puVar6 = puVar4 + 3;
      while (puVar6 = (ushort *)resolve_object_link(puVar6), puVar6 != (ushort *)0x0) {
        iVar10 = FUN_00047b38(param_1,puVar6);
        if (iVar10 != 0) {
          uVar2 = *puVar6;
          if ((uVar2 & 0x8000) == 0) {
            *(char *)puVar6 = (char)uVar2;
            *(byte *)((char *)puVar6 + 1) = (byte)(uVar2 >> 8) | 0x80;
            *(byte *)(puVar6 + 3) = (byte)puVar6[3] & 0x3f | 0x40;
            *(undefined1 *)((char *)puVar6 + 7) = 0;
          }
          bVar1 = (byte)*param_1;
          bVar11 = (*param_1 & 0x8000) != 0;
          if (bVar11) {
            bVar1 = (byte)param_1[3];
          }
          uVar7 = (uint)bVar1;
          if (bVar11) {
            uVar7 = (uint)(ushort)(CONCAT11(*(byte *)((char *)param_1 + 7),bVar1) >> 6);
          }
          if (!bVar11) {
            uVar7 = 1;
          }
          iVar10 = (CONCAT11(*(undefined1 *)((char *)puVar6 + 7),(byte)puVar6[3]) & 0xffc0) +
                   uVar7 * 0x40;
          bVar1 = (byte)puVar6[2];
          *(byte *)(puVar6 + 3) = (byte)iVar10 ^ (byte)puVar6[3] & 0x3f;
          *(char *)((char *)puVar6 + 7) = (char)((uint)iVar10 >> 8);
          *(byte *)(puVar6 + 2) =
               (bVar1 ^ (byte)((int)(((byte)param_1[2] & 0x3f) +
                                    (CONCAT11(*(undefined1 *)((char *)puVar6 + 5),bVar1) & 0x3f)) >> 1)
               ) & 0x3f ^ bVar1;
          *(undefined1 *)((char *)puVar6 + 5) = *(undefined1 *)((char *)puVar6 + 5);
          free_object_slot(param_1);
          goto LAB_000439a0;
        }
        puVar6 = puVar6 + 2;
      }
      object_list_append_tail(puVar4 + 3,param_1);
      if (bVar11) {
        uVar7 = encode_object_slot_index(param_1);
        iVar10 = (int)local_28;
        (&g_equipped_items)[iVar10 * 2] =
             (&g_equipped_items)[iVar10 * 2] & 0x3f | (byte)((uVar7 & 0x3ff) << 6);
        (&DAT_00202951)[iVar10 * 2] = (char)((uVar7 << 0x16) >> 0x18);
      }
LAB_000439a0:
      if ((g_current_container_record == 0) ||
         (sVar3 = encode_object_slot_index(puVar4), (int)sVar3 != (uint)(*(ushort *)(g_current_container_record + 8) >> 6))) {
        iVar10 = FUN_00048514(1);
        if (iVar10 != 0) {
          select_active_font(s_font5x6p_sys_0008430c);
        }
      }
      else {
        repopulate_container_grid_slots();
        redraw_inventory_widget_range(0xc,0x13);
      }
      uVar2 = *param_1;
      if ((0x93 < (uVar2 & 0x1ff)) && ((uVar2 & 0x1ff) < 0x98)) {
        bVar1 = (byte)uVar2;
        *(byte *)param_1 = (bVar1 - 4 ^ bVar1) & 0xf ^ bVar1;
        *(byte *)((char *)param_1 + 1) = (byte)(uVar2 >> 8);
        set_ambient_bias_without_light(0);
      }
    }
    uVar5 = 1;
  }
  return uVar5;
}




void sum_container_weight(param_1,param_2)
ushort *param_1;  /* was `undefined4` -- truncated the real object-record
                     pointer (passed straight to resolve_object_link, and
                     to itself recursively as `puVar2+2`), latent until
                     that call started actually using its argument */
short * param_2;

{
  ushort uVar1;
  ushort *puVar2;
  
  puVar2 = (ushort *)resolve_object_link(param_1);
  while( true ) {
    if (puVar2 == (ushort *)0x0) {
      return;
    }
    if (((*puVar2 & 0x8000) == 0) || ((puVar2[3] & 0x8000) != 0)) {
      uVar1 = 1;
    }
    else {
      uVar1 = puVar2[3] >> 6;
    }
    *param_2 = (*(ushort *)(&DAT_00202c91 + (*puVar2 & 0x1ff) * 0xd) >> 4) * uVar1 + *param_2;
    sum_container_weight(puVar2 + 2,param_2);
    if ((*puVar2 & 0x8000) != 0) break;
    puVar2 = (ushort *)resolve_object_link(puVar2 + 3);
  }
  return;
}



/* Same pointer-truncation bug class as alloc_save_record_slot/save_record_slot_from_index just
   below (their own comment has the full writeup) -- iVar4 was `int`,
   truncating g_save_equip_table_ptr (a real `undefined1 *` heap pointer) to 32
   bits before the following `*(char *)(iVar4 + 1)` write dereferenced
   it back out as a wild 64-bit address. The sibling expression right
   above it, `*(byte *)(iVar1 + g_save_equip_table_ptr)`, computes the identical
   address inline without going through a truncating temporary, so it
   stayed correct -- the same "half right, half wrong" pattern already
   seen elsewhere this session (mixed styling from the same real,
   unambiguously 32-bit-clean ARM source). This was the second,
   previously-masked half of the QA-reported inventory-save crash: fixing
   alloc_save_record_slot let execution get past its own wild pointer and into
   this one. Confirmed via lldb: the crash backtrace attributed the
   fault to serialize_inventory_link_chain's call-site return address (this function's own
   prologue hadn't finished setting up x29/x30 yet when it faulted), not
   a bug in serialize_inventory_link_chain itself. */
// was FUN_000441d8
void encode_equipped_item_index(param_1,param_2)
ushort * param_1;
undefined2 * param_2;

{
  int iVar1;
  undefined2 uVar2;
  byte bVar3;
  char *iVar4;
  int iVar5;

  iVar5 = 0;
  do {
    iVar1 = iVar5 * 2;
    if (((*(ushort *)(&g_equipped_items + iVar1) ^ *param_1) & 0xffc0) == 0) {
      uVar2 = *param_2;
      iVar4 = iVar1 + g_save_equip_table_ptr;
      bVar3 = (byte)uVar2;
      *(byte *)(iVar1 + g_save_equip_table_ptr) = (*(byte *)(iVar1 + g_save_equip_table_ptr) ^ bVar3) & 0x3f ^ bVar3;
      *(char *)(iVar4 + 1) = (char)((ushort)uVar2 >> 8);
    }
    iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
  } while (iVar5 < 0x13);
  return;
}




// was FUN_000442dc
void decode_equipped_item_index(param_1,param_2)
undefined2 * param_1;
ushort * param_2;

{
  int iVar1;
  undefined2 uVar2;
  byte bVar3;
  char *iVar4;
  int iVar5;
  
  iVar4 = g_save_equip_table_ptr;
  iVar5 = 0;
  do {
    iVar1 = iVar5 * 2;
    if (((*(ushort *)(iVar1 + iVar4) ^ *param_2) & 0xffc0) == 0) {
      uVar2 = *param_1;
      bVar3 = (byte)uVar2;
      (&g_equipped_items)[iVar1] = ((&g_equipped_items)[iVar1] ^ bVar3) & 0x3f ^ bVar3;
      (&DAT_00202951)[iVar1] = (char)((ushort)uVar2 >> 8);
    }
    iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
  } while (iVar5 < 0x13);
  return;
}




/* Was `resolve_object_link(...); return 0;` -- computing the real object-record
   pointer and then discarding it in favor of a hardcoded 0, same
   "dropped return value" idiom already fixed for next_input_event elsewhere
   in this file. Every caller treats the return as the real result (e.g.
   `puVar6 = (ushort *)get_equipped_item_at_slot(iVar4); if (puVar6 != 0) ...`), so the
   hardcoded 0 silently turned every one of those checks into "nothing
   here" -- except the *upper* bits of the 8-byte-wide return register
   this recompile reads were left uninitialized (the old `undefined4`
   return type only ever set the low 32 bits), so callers actually read
   garbage instead of a clean NULL and crashed dereferencing it. */
void *get_equipped_item_at_slot(param_1)
short param_1;

{
  return resolve_object_link(&g_equipped_items + param_1 * 2);
}




// was FUN_00079144 -- walks a container's (param_1) contents link
// chain and places each item into the world near the container's own
// position (via place_object_in_world), clearing param_1's own
// contents-head link as it goes. param_2, when non-zero, ORs its low
// 6 bits into each placed item's own field (offset+3, matching
// DAT_00202c98's own "container" flag-table lookup) -- something
// caller-specific, not fully traced. Returns 0 if the container had
// no contents at all (nothing to empty), 1 if it emptied at least one
// item. This is the real mechanism behind "using Use mode on a
// container empties its contents onto the nearby ground" -- called
// (via try_empty_container) from try_combine_or_stow_object, itself
// reached from interact_use.
undefined4 empty_container_into_world(param_1,param_2)
ushort * param_1;
short param_2;

{
  ushort uVar1;
  ushort uVar2;
  byte bVar3;
  /* Was `int iVar4;` -- truncated resolve_object_link's real 64-bit
     pointer return, then handed straight to place_object_in_world's
     own param_4 (already `char *`, fixed in an earlier pass -- see
     its own comment) as a garbage-high-bits address. This loop walks
     a container's contents chain emptying it into the world (the
     real behavior behind "Use mode on a container empties its
     contents onto the nearby ground"); this is that chain's own
     never-before-exercised path, so the truncation was never hit
     until now. Confirmed live: 100% reproducible SIGSEGV in
     find_object_placement's first dereference of the wild pointer
     the moment this loop ran with a real, non-empty container. */
  char *iVar4;
  int iVar5;
  undefined4 uVar6;
  uint uVar7;
  uint uVar8;
  char *pNextLink;

  if ((param_1[3] & 0xffc0) == 0) {
    uVar6 = 0;
  }
  else {
    iVar4 = resolve_object_link(param_1 + 3);
    *(byte *)(param_1 + 3) = (byte)param_1[3] & 0x3f;
    *(undefined1 *)((char *)param_1 + 7) = 0;
    iVar5 = object_ptr_in_arena(param_1);
    if (iVar5 == 0) {
      uVar7 = (uint)DAT_002020a0;
      uVar8 = (uint)DAT_002020a4;
    }
    else {
      uVar7 = (uint)(param_1[0xb] >> 10);
      uVar8 = (param_1[0xb] & 0x3f0) >> 4;
    }
    uVar1 = param_1[1];
    while (iVar4 != 0) {
      pNextLink = resolve_object_link(iVar4 + 4);
      if ((param_2 != 0) && (((&DAT_00202c98)[(*param_1 & 0x1ff) * 0xd] & 0x80) != 0)) {
        uVar2 = param_1[3];
        bVar3 = (byte)uVar2;
        *(byte *)(param_1 + 3) = (bVar3 ^ (byte)param_2) & 0x3f ^ bVar3;
        *(char *)((char *)param_1 + 7) = (char)(uVar2 >> 8);
      }
      place_object_in_world((uint)(uVar1 >> 0xd) + uVar7 * 8,((uVar1 & 0x1c00) >> 10) + uVar8 * 8,
                   uVar1 & 0x7f,iVar4,6,0);
      iVar4 = pNextLink;
    }
    uVar6 = 1;
  }
  return uVar6;
}




// was FUN_0007c84c -- thin wrapper around empty_container_into_world:
// empties param_1's contents, and if it turns out param_1 had nothing
// to empty (return 0) and param_2 is non-zero (callers pass whether
// the container belongs to the player), prints the object's own name
// followed by "is empty " (s_is_empty__0008790c) via
// message_scroll_print_wrapped -- the "The sack is empty." message a
// player sees using Use mode on an already-empty container. Called
// from try_combine_or_stow_object, itself reached from interact_use.
void try_empty_container(param_1,param_2)
ushort * param_1;
int param_2;

{
  char *wptr_60040;
  char cVar1;
  int iVar2;
  char *pcVar3;
  byte bVar4;
  char acStack_85ce4 [547976];
  char acStack_5c [80];
  
  bVar4 = 0;
  if (((&DAT_00202c98)[(*param_1 & 0x1ff) * 0xd] & 0x80) != 0) {
    bVar4 = (byte)param_1[3] & 0x3f;
  }
  iVar2 = empty_container_into_world(param_1,bVar4);
  if ((iVar2 == 0) && (param_2 != 0)) {
    pcVar3 = &DAT_00085c88;
    wptr_60040 = acStack_85ce4;
    do {
      cVar1 = *pcVar3;
      *wptr_60040 = cVar1; wptr_60040 = wptr_60040 + 1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    iVar2 = Ordinal_1068(acStack_5c);
    FUN_00078b18(acStack_5c + iVar2,param_1,0,0);
    Ordinal_1063(acStack_5c,s_is_empty__0008790c);
    message_scroll_print_wrapped(acStack_5c);
  }
  FUN_00049924(2);
  return;
}

