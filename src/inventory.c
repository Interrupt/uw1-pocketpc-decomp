/* The inventory panel: click handling/dispatch, widget hit-testing and
 * redraw, and the inventory link-chain (de)serialization used by
 * save/load. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/inventory.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

static short DAT_00085a6c_backing[128];
short *DAT_00085a6c = DAT_00085a6c_backing;
undefined2 g_cursor_holding_state;
/* Base address of a 0x1b(27)-byte-stride record table (every use is
   `offset * 0x1b + DAT_002046b8`, cast to a pointer type) -- was `int`
   despite being assigned a real malloc'd address plus an offset
   (reset_level_object_arena: `DAT_002046b8 = DAT_002029cc + 0x4000;`), truncating it
   on this 64-bit host and feeding a garbage near-zero base pointer to
   every reader, including a real crash (ce_memset/memset on the
   resulting ~0x1b address) in reset_player_object_record. */
char *DAT_002046b8;
char *g_current_container_record;
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
ushort *g_interact_target;
short DAT_0023be88;
short DAT_0023bd80;
code *DAT_002020b8;
undefined4 DAT_00204844;
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
   `ce_malloc(0x7c08)`), so this table now lives inside that SAME
   buffer instead -- g_backpack_slot_table is pointed at its unused
   tail (offset 0x7b00, 28*2=56 bytes, well inside the buffer's real
   0x7c08 size) by reset_level_object_arena at level load, and
   resolve_object_link's own valid-range upper bound is widened by the
   same 0x38 bytes so this new tail is actually accepted (see both of
   their own comments). */
char *g_backpack_slot_table;
/* Same bug: indexed as `(&DAT_002028e8)[i]` for i up to 0x16 (22) in
   init_inventory_panel_hotspots/free_open_container_chain/etc. -- this is the specific array whose
   overflow was landing on and corrupting g_selected_object (see above).
   Widened with a safety margin. */
/* Sizing-audit pass: real index range is i up to 0x16 (22 elements),
   per the comment above -- 92 bytes real need. Sized to 32 elements
   (128 bytes) for headroom; down from 64 (256 bytes). */
 undefined4 DAT_002028e8_backing[32];
undefined4 DAT_002029a0;
undefined4 DAT_0020299c;
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
// was DAT_002028cc
 undefined2 g_save_record_count_backing[8192];
/* DAT_00202938: widget 20's own saved-background grtile handle (the
   "open container indicator" -- see g_inventory_hotspot_table's own
   comment and DAT_00085c4c below), same role as (&DAT_002028a0)[i] for
   widgets 12-19 -- allocated once in open_backpack_container, see its
   own comment there. Runtime scratch state, not a .data resource, so
   it stays its own plain global rather than an alias. */
undefined4 DAT_00202938;
short DAT_0023be5c;
short DAT_0023be80;






// was FUN_0003f7e0
void handle_inventory_panel_normal_click()

{
  short sVar1;
  undefined4 uVar2;

  g_interact_target = 0;
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] handle_inventory_panel_normal_click called: g_cursor_holding_state=%d g_selected_object=%p DAT_00085a6c[3]=%d panel_x=%d panel_y=%d\n",
            (int)g_cursor_holding_state, (void *)g_selected_object, (int)DAT_00085a6c[3],
            (int)(*DAT_00085a6c + 0xf0), (int)(0x76 - DAT_00085a6c[1]));
  if (g_cursor_holding_state == 0) {
    if ((g_selected_object == 0) && (sVar1 = DAT_00085a6c[3], sVar1 != 1)) {
      if (sVar1 == 2) {
        if ((g_cursor_mode != 1) || (DAT_00085a6c[4] == 4)) {
          uVar2 = 0xfffffffe;
          goto LAB_0003f91c;
        }
      }
      else if (sVar1 != 3) {
        g_interact_target = 0;
        return;
      }
    }
    uVar2 = 0;
  }
  else if (g_cursor_holding_state == 1) {
    uVar2 = 4;
  }
  else {
    if (g_cursor_holding_state != 2) {
      g_interact_target = 0;
      return;
    }
    sVar1 = hit_test_inventory_widget(*DAT_00085a6c + 0xf0,0x76 - DAT_00085a6c[1]);
    if ((sVar1 != 0x15) && (sVar1 != 0x16)) {
      g_interact_target = resolve_clicked_inventory_item(2);
      if (g_interact_target != 0) {
        (*DAT_002020b8)(g_interact_target,1,1);
        wait_for_click_release(1);
        return;
      }
      pop_cursor_icon(3);
      g_cursor_holding_state = 0;
      g_selected_object = 0;
      return;
    }
    uVar2 = 1;
  }
LAB_0003f91c:
  handle_inventory_panel_click(uVar2);
  return;
}



// was FUN_0003f95c
void inventory_panel_click_region()

{
  if (getenv("UW_DEBUG_INV")) fprintf(stderr, "[inv] inventory_panel_click_region ENTRY g_active_hud_panel=%d mouse=(%d,%d)\n",
      (int)g_active_hud_panel, (int)g_mouse_x, (int)g_mouse_y);
  if (g_active_hud_panel == '\0') {
    handle_inventory_panel_normal_click();
  }
  else if (g_active_hud_panel == '\x01') {
    handle_rune_bag_click();
  }
  else if (g_active_hud_panel == '\x02') {
    handle_stats_panel_skill_scroll_click();
  }
  return;
}




// was FUN_000440d0
void serialize_inventory_link_chain(param_1,param_2)
undefined1 * param_1;
byte * param_2;

{
  undefined1 *puVar1;
  undefined1 *puVar2;
  uint uVar3;

  puVar1 = (undefined1 *)resolve_object_link(param_1);
  while (puVar1 != (undefined1 *)0x0) {
    puVar2 = (undefined1 *)alloc_save_record_slot();
    *puVar2 = *puVar1;
    puVar2[1] = puVar1[1];
    puVar2[2] = puVar1[2];
    puVar2[3] = puVar1[3];
    puVar2[4] = puVar1[4];
    puVar2[5] = puVar1[5];
    puVar2[6] = puVar1[6];
    puVar2[7] = puVar1[7];
    uVar3 = (uint)g_save_record_count;
    *param_2 = *param_2 & 0x3f | (byte)((uVar3 & 0x3ff) << 6);
    param_2[1] = (byte)((uVar3 << 0x16) >> 0x18);
    encode_equipped_item_index(param_1,param_2);
    param_1 = puVar1 + 4;
    param_2 = puVar2 + 4;
    if (((puVar1[1] & 0x80) == 0) && ((*(ushort *)(puVar1 + 6) & 0xffc0) != 0)) {
      serialize_inventory_link_chain(puVar1 + 6,puVar2 + 6);
    }
    puVar1 = (undefined1 *)resolve_object_link(param_1);
  }
  return;
}




// was FUN_00044398
void deserialize_inventory_link_chain(param_1,param_2)
byte * param_1;
ushort * param_2;

{
  undefined1 *puVar1;
  uint uVar2;
  undefined1 *puVar3;
  
  while (puVar3 = (undefined1 *)save_record_slot_from_index(*param_2 >> 6), puVar3 != (undefined1 *)0x0) {
    puVar1 = (undefined1 *)alloc_object_slot(0);
    *puVar1 = *puVar3;
    puVar1[1] = puVar3[1];
    puVar1[2] = puVar3[2];
    puVar1[3] = puVar3[3];
    puVar1[4] = puVar3[4];
    puVar1[5] = puVar3[5];
    puVar1[6] = puVar3[6];
    puVar1[7] = puVar3[7];
    uVar2 = encode_object_slot_index();
    *param_1 = *param_1 & 0x3f | (byte)((uVar2 & 0x3ff) << 6);
    param_1[1] = (byte)((uVar2 << 0x16) >> 0x18);
    decode_equipped_item_index(param_1,param_2);
    param_1 = puVar1 + 4;
    param_2 = (ushort *)(puVar3 + 4);
    if (((puVar3[1] & 0x80) == 0) && ((*(ushort *)(puVar3 + 6) & 0xffc0) != 0)) {
      /* Dropped 2nd argument -- deserialize_inventory_link_chain takes (param_1, param_2) and
         every other call site (both non-recursive ones, a few lines up
         this file) passes both; this self-recursive call for a nested
         container's own contents only passed the first. Same idiom as
         serialize_inventory_link_chain's matching recursive call just above in this file
         (`serialize_inventory_link_chain(puVar1 + 6,puVar2 + 6);`), which this function
         otherwise exactly mirrors for the Load direction. Not yet known
         to have crashed in practice (would only trigger loading a save
         with a nested container in inventory), found while auditing this
         function for the same pointer-truncation bug class as its Save-
         side counterpart. */
      deserialize_inventory_link_chain(puVar1 + 6,(ushort *)(puVar3 + 6));
    }
  }
  return;
}




// was FUN_00046698
void handle_inventory_panel_click(param_1)
short param_1;

{
  short sVar1;
  char cVar2;
  ushort uVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  char *iVar6;
  ushort *puVar7;
  ushort *puVar8;
  int iVar9;
  ushort *puVar10;
  bool bVar11;
  short local_30;
  short local_2e;
  
  puVar10 = (ushort *)0x0;
  bVar11 = g_selected_object != 0;
  uVar5 = hit_test_inventory_widget(*DAT_00085a6c + 0xf0,0x76 - DAT_00085a6c[1]);
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] handle_inventory_panel_click click test: panel_x=%d panel_y=%d -> widget_id=%d\n",
            (int)(*DAT_00085a6c + 0xf0), (int)(0x76 - DAT_00085a6c[1]), (int)(short)uVar5);
  iVar9 = (int)(short)uVar5;
  /* Permanent (not env-gated) debug line: which real widget got clicked
     and which g_backpack_widget_to_slot/g_equipped_items slot it resolves
     to -- DEBUG(INFO,...) prints by default under normal play (run.sh's
     own UW_DEBUG_LEVEL=INFO), same as this file's other permanent [inv]
     lines (e.g. "use item" above), and is quieted automatically by the
     regression suite's own UW_DEBUG_LEVEL=WARN default. */
  if ((0 < iVar9) && (iVar9 < 0x17)) {
    DEBUG(INFO, "[inv] widget %d clicked -> slot %d\n", iVar9,
          (int)(char)(&g_backpack_widget_to_slot)[iVar9]);
  }
  /* The old CONTAINER_ICON_WIDGET_ID synthetic dispatch that used to
     live here (a project-added hack, drawn/hit-tested at a guessed
     screen position) is gone -- widget 20's own real table entry
     covers the "leave container" click now, and its full drop/click
     logic (auto-place a held item into the parent vs. pop one level)
     lives in handle_object_drop_target's `iVar2==0x14` case, which
     this function's own fallthrough below already reaches. See that
     branch's own comment for the history. */
  /* Was `iVar9 < 0x15` -- treated widget 20 (the real "leave container"
     button, see DAT_00085c4c's own comment) as an ordinary placeable
     backpack slot, so a plain click on it tried to pick up/drop an
     item there instead of ever reaching handle_object_drop_target's
     own `iVar2==0x14 -> leave_nested_container_level()` dispatch a
     little further down this file. Widgets 21/22 (scroll arrows) were
     already correctly excluded (21 is not < 21); only 20 needed
     excluding too. */
  if ((0 < iVar9) && (iVar9 < 0x14)) {
    cVar2 = (&g_backpack_widget_to_slot)[iVar9];
    if (g_selected_object == 0) {
      iVar9 = (int)(short)cVar2;
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[weapon-ready] click-dispatch: slot=%d equipped_raw=0x%04x weaponhand_target=%d\n", iVar9, (unsigned)*(ushort *)(&g_equipped_items + iVar9 * 2), 8 - (*(byte *)(DAT_00086df8 + 100) & 1));
      if ((*(ushort *)(&g_equipped_items + iVar9 * 2) & 0xffc0) == 0) {
        if (iVar9 == 8 - (*(byte *)(DAT_00086df8 + 100) & 1)) {
          toggle_weapon_ready();
        }
        wait_for_click_release(1);
        return;
      }
      if (((iVar9 != -1) && (iVar9 != 0x13)) && (iVar6 = wait_for_key_or_mouse_move(1), iVar6 != 0)) {
        puVar7 = (ushort *)resolve_object_link(&g_equipped_items + iVar9 * 2);
        uVar3 = *puVar7;
        if (((uVar3 & 0x8000) == 0) || ((puVar7[3] & 0x8000) != 0)) {
          if (((uVar3 & 0x1c0) == 0x80) && ((uVar3 & 0x30) == 0)) {
            puVar4 = g_open_container_list;
            if ((DAT_00085a6c[4] == 4) && ((uVar3 & 0xf) != 0xf)) {
              print_scroll_message_by_id(0xba);
              return;
            }
            for (; puVar4 != (undefined4 *)0x0; puVar4 = (undefined4 *)*puVar4) {
              puVar8 = (ushort *)resolve_object_link(puVar4 + 2);
              if (puVar8 == puVar7) {
                return;
              }
            }
          }
        }
        else if ((puVar7[3] & 0xffc0) != 0x40) {
          puVar10 = (ushort *)prompt_split_object_stack(puVar7);
          if (puVar10 == (ushort *)0x0) {
            return;
          }
          if (puVar10 != puVar7) {
            object_list_insert_head(puVar7 + 2,puVar10);
          }
        }
        bVar11 = true;
        if ((puVar10 == (ushort *)0x0) || (uVar5 = 1, puVar10 == puVar7)) {
          uVar5 = 0;
        }
        swap_cursor_and_slot_item((int)cVar2,uVar5);
        iVar6 = g_current_container_record;
        if (iVar9 < 0x14) {
          redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar9]);
        }
        else {
          /* Was walking the "prev" chain (up through every ancestor
             container, to propagate the removed item's weight all the
             way to the root) via CONCAT13/12/11 of the record's own
             byte-4..7 field -- the same legacy 4-byte "prev" that's only
             ever a truncated half of a real 64-bit pointer (see
             open_backpack_container's own record-widening comment).
             Harmless with a single open container (loop runs once,
             lands on 0); wild-pointer crash the instant a real ancestor
             existed to walk to -- confirmed live: moving an item inside
             a NESTED container's own grid ("Trying to move an item in a
             nested container causes a crash"). Walk the real,
             untruncated prev pointer at +0x14 instead, same fix as
             leave_nested_container_level/free_open_container_chain. */
          for (; iVar6 != 0; iVar6 = *(char **)(iVar6 + 0x14)) {
            iVar9 = calculate_object_weight(puVar7);
            iVar9 = *(short *)(iVar6 + 10) - iVar9;
            *(char *)(iVar6 + 10) = (char)iVar9;
            *(char *)(iVar6 + 0xb) = (char)((uint)iVar9 >> 8);
          }
          repopulate_container_grid_slots();
          refresh_container_view();
        }
        if (g_selected_object == 0) {
          return;
        }
        if (puVar10 != (ushort *)0x0) {
          g_cursor_holding_state = 1;
          return;
        }
      }
    }
    wait_for_click_release(1);
    get_mouse_position(&local_2e,&local_30);
    uVar5 = hit_test_inventory_widget((int)local_2e,(int)local_30);
  }
  wait_for_click_release(1);
  sVar1 = (short)uVar5;
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] handle_inventory_panel_click decision: g_selected_object=%p g_cursor_holding_state=%d sVar1=%d param_1=%d\n",
            (void *)g_selected_object, (int)g_cursor_holding_state, (int)sVar1, (int)param_1);
  if ((g_selected_object == 0) || (g_cursor_holding_state == 2)) {
    if (0 < sVar1) {
      if (-1 < param_1) {
        handle_object_drop_target(uVar5);
        return;
      }
      if (param_1 == -2) {
        perform_object_search_check();
      }
    }
  }
  else {
    g_cursor_holding_state = 1;
    /* Same stale-cursor-icon-erase race as attach_picked_up_object_to_cursor's
       own copy of this fix (see its own comment) -- this function's
       "release while holding" branch has the identical shape (widget
       dispatch redraws the dropped item, then later cleanup erases a
       still-pending save from the drag icon's last position, which can
       clobber that fresh redraw if the two overlap -- routine for a
       drop, since releasing ON the target slot is the point). Flush it
       here too, before any dispatch below can redraw anything --
       erase_cursor_icon() only does the actual pixel restore, it does NOT
       clear DAT_00204844 itself (every caller is responsible for that
       off its own return value, see its own comment); missing that
       clear left the flag set, so a LATER update_mouse_state cycle
       still saw "erase pending" and redundantly restored the same
       stale save a second time, clobbering the fresh redraw anyway. */
    if (erase_cursor_icon() != 0) {
      DAT_00204844 = 0;
    }
    if ((g_active_hud_panel != '\0') && (sVar1 != 0x17)) {
      g_cursor_holding_state = 1;
      return;
    }
    iVar9 = (int)sVar1;
    if (0 < iVar9) {
      /* `sVar1`/`iVar9` here is the actual RELEASE position, freshly
         hit-tested a few lines up (this function's own preceding
         widget-range block only handles the very first click of a
         drag, when nothing was held yet). Widget 20 (the real "leave
         container" indicator) falls through the `< 0x14` check below
         into handle_object_drop_target same as everywhere else now --
         see that function's own `iVar2==0x14` case for the full
         drop/click logic this used to duplicate here as a
         CONTAINER_ICON_WIDGET_ID special case. */
      /* Same `< 0x15` -> `< 0x14` fix as the top-of-function copy above
         (widget 20 needs handle_object_drop_target's real dispatch,
         not ordinary slot placement). */
      if (iVar9 < 0x14) {
        handle_backpack_slot_click((int)(char)(&g_backpack_widget_to_slot)[iVar9]);
      }
      else {
        handle_object_drop_target(uVar5);
        bVar11 = false;
      }
    }
  }
  if ((bVar11) && (g_selected_object == 0)) {
    pop_cursor_icon(3);
    g_cursor_holding_state = 0;
  }
  return;
}




// was FUN_00046eec
void redraw_inventory_widget(param_1)
undefined4 param_1;

{
  int iVar1;
  undefined4 uVar2;
  
  uVar2 = 0xffffffff;
  if (g_active_hud_panel == '\0') {
    iVar1 = (int)(short)param_1;
    if (iVar1 < 6) {
      redraw_armor_overlay_widgets();
    }
    else if (iVar1 < 0x15) {
      redraw_inventory_widget_range(param_1,param_1);
    }
    else {
      restore_captured_grtile_backdrop((&DAT_002028e8)[iVar1]);
      if (iVar1 == 0x15) {
        if (DAT_0020299c != 0) {
          uVar2 = 0x101b;
        }
      }
      else if (DAT_002029a0 != 0) {
        uVar2 = 0x101c;
      }
      if (-1 < (short)uVar2) {
        g_blit_transparent_mode = 1;
        draw_sprite_by_id(uVar2,(int)(short)(&g_inv_hotspot_draw_x)[iVar1 * 7],
                     (int)(short)(&g_inv_hotspot_draw_y)[iVar1 * 7],(&g_inv_hotspot_dirty_h)[iVar1 * 0xe],
                     (&g_inv_hotspot_dirty_w)[iVar1 * 0xe]);
        g_blit_transparent_mode = 0;
      }
    }
  }
  return;
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00048198
void redraw_inventory_widget_range(param_1,param_2)
int param_1;
short param_2;

{
  int iVar1;
  int iVar2;
  int iVar3;
  ushort uVar4;
  bool bVar5;
  int iVar6;
  ushort *puVar7;
  undefined4 uVar8;
  undefined1 auStack_60 [12];
  /* Was `ushort auStack_54 [20]` (matching the real ARM binary's own
     stack layout exactly, confirmed via Ghidra decompile of the real
     FUN_00048198 at 0x48198) -- but redraw_container_icon_slot's real call site also
     matches ours exactly: `redraw_inventory_widget_range(6,0x16)`, a
     loop upper bound of 22, writing auStack_54[21] and auStack_54[22]
     (index 20 is separately special-cased via local_2c, never touches
     the array). The real binary's original stack layout happened to
     place harmless padding/an unrelated local there, so the same
     2-element overrun was silently benign in the shipped game; this
     recompile's different stack layout makes it a real, ASan-confirmed
     stack-buffer-overflow (WRITE of size 2, uw.c:40164) on literally the
     first HUD redraw of any fresh game. Widened to fit the real max
     index (22) actually used, rather than deviating from the real
     call's range -- a defensive size fix, not a logic change. */
  ushort auStack_54 [23];
  ushort local_2c;

  bVar5 = false;
  decrement_cursor_hide_depth();
  iVar1 = (int)(short)param_1;
  iVar2 = (int)param_2;
  g_blit_transparent_mode = 1;
  iVar3 = iVar1;
  do {
    iVar6 = iVar1;
    if (iVar2 < iVar3) {
joined_r0x00048308:
      while (iVar6 <= iVar2) {
        if (iVar6 != 0x14) {
          /* Was called here with g_blit_transparent_mode==1 (set just
             above this loop, for the item-sprite draw further down
             which genuinely needs it). restore_captured_grtile_backdrop restores a saved
             framebuffer tile pixel-for-pixel -- raw RGB565 screen
             data, not palette-indexed sprite art -- and it also
             respects g_blit_transparent_mode (skipping any source
             pixel whose raw 16-bit value is exactly 0 when it's set).
             0x0000 is a perfectly ordinary color (black) in a captured
             framebuffer tile, not a "this pixel is transparent" marker,
             so restoring one under transparent mode silently drops
             every genuinely-black pixel in it, leaving whatever stale
             content (often actual black) was already in the
             framebuffer showing through instead. Real bug regardless
             of the case below: found while chasing a user report of
             "closing a container draws black areas under some of the
             paper doll section", but live-testing with
             close_backpack_container also calling this function for
             the worn-item ring widgets (6-0xb) showed no visible
             change either way, so it wasn't -- by itself -- the
             visible cause there (see close_backpack_container's own
             comment for what that black area traced back to instead).
             Kept anyway since it's a genuine correctness fix for any
             captured tile that does contain real black pixels,
             independent of that specific symptom. Force opaque for
             the restore itself; the sprite draw right after still
             runs under the loop's own transparent mode, unaffected. */
          g_blit_transparent_mode = 0;
          restore_captured_grtile_backdrop((&DAT_002028e8)[iVar6]);
          g_blit_transparent_mode = 1;
          auStack_54[iVar6] = 1;
          if (getenv("UW_DEBUG_INV"))
            fprintf(stderr, "[inv] redraw_inventory_widget_range loop iVar6=%d slot_arr_idx=%d arr_val=0x%04x\n",
                    iVar6, (char)(&g_backpack_widget_to_slot)[iVar6],
                    (unsigned)*(ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2));
          if (iVar6 < 0x15) {
            if ((*(ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2) & 0xffc0) != 0) {
              if (getenv("UW_DEBUG_INV"))
                fprintf(stderr, "[inv] resolve addr=%p table=%p lo=%p hi=%p\n",
                        (void *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2),
                        (void *)g_backpack_slot_table, (void *)(DAT_002046b8 - 0x4000),
                        (void *)(DAT_002046c4 + 0x1800 + 0x38));
              puVar7 = (ushort *)resolve_object_link((ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2));
              if (puVar7 == 0) goto skip_slot_draw_iVar6;
              if (getenv("UW_DEBUG_INV"))
                fprintf(stderr, "[inv] slot widget_id=%d slot_arr_idx=%d objid=0x%03x draw_x=%d draw_y=%d w=%d h=%d\n",
                        iVar6, (char)(&g_backpack_widget_to_slot)[iVar6], *puVar7 & 0x1ff,
                        (int)(short)(&g_inv_hotspot_draw_x)[iVar6 * 7], (int)(short)(&g_inv_hotspot_draw_y)[iVar6 * 7],
                        (int)(&g_inv_hotspot_dirty_h)[iVar6 * 0xe], (int)(&g_inv_hotspot_dirty_w)[iVar6 * 0xe]);
              draw_sprite_by_id(*puVar7 & 0x1ff,(int)(short)(&g_inv_hotspot_draw_x)[iVar6 * 7],
                           (int)(short)(&g_inv_hotspot_draw_y)[iVar6 * 7],(&g_inv_hotspot_dirty_h)[iVar6 * 0xe],
                           (&g_inv_hotspot_dirty_w)[iVar6 * 0xe]);
              if ((((*puVar7 & 0x8000) != 0) && ((puVar7[3] & 0x8000) == 0)) &&
                 (uVar4 = puVar7[3] >> 6, 1 < uVar4)) {
                auStack_54[iVar6] = uVar4;
                bVar5 = true;
              }
              skip_slot_draw_iVar6:;
            }
          }
          else {
            redraw_inventory_widget(param_1);
          }
        }
        param_1 = (iVar6 + 1) * 0x10000 >> 0x10;
        iVar6 = param_1;
      }
      g_blit_transparent_mode = 0;
      if (bVar5) {
        select_active_font(s_font4x5p_sys_0008431c);
        *g_draw_color_index = 0x60;
        for (; iVar1 <= iVar2; iVar1 = (iVar1 + 1) * 0x10000 >> 0x10) {
          if (1 < (short)auStack_54[iVar1]) {
            uVar8 = _itoa((int)(short)auStack_54[iVar1],auStack_60,10);
            draw_text_string(uVar8,(short)(&g_inv_hotspot_draw_x)[iVar1 * 7] + 3,
                         (short)(&g_inv_hotspot_draw_y)[iVar1 * 7] + 1);
          }
        }
        select_active_font(s_font5x6p_sys_0008430c);
      }
      update_carry_weight_display(0);
      cursor_show_idle_tick();
      return;
    }
    if (iVar3 == 0x14) {
      restore_captured_grtile_backdrop(DAT_00202938);
      local_2c = 1;
      if (getenv("UW_DEBUG_W20"))
        fprintf(stderr, "[w20] slot=%d raw=0x%04x occupied=%d DAT_00202938=%p x=%d y=%d w=%d h=%d\n",
                (int)(unsigned char)DAT_00085c4c,
                (unsigned)*(ushort *)(&g_equipped_items + DAT_00085c4c * 2),
                (int)((*(ushort *)(&g_equipped_items + DAT_00085c4c * 2) & 0xffc0) != 0),
                (void *)DAT_00202938, (int)_DAT_00085bf0, (int)CONCAT11(DAT_00085bf3,DAT_00085bf2),
                (int)DAT_00085bf5, (int)DAT_00085bf4);
      if ((*(ushort *)(&g_equipped_items + DAT_00085c4c * 2) & 0xffc0) != 0) {
        puVar7 = (ushort *)resolve_object_link((ushort *)(&g_equipped_items + DAT_00085c4c * 2));
        if (getenv("UW_DEBUG_W20"))
          fprintf(stderr, "[w20] resolved=%p id=0x%03x\n", (void *)puVar7, puVar7 ? (unsigned)(*puVar7 & 0x1ff) : 0u);
        draw_sprite_by_id(*puVar7 & 0x1ff,(int)_DAT_00085bf0,(int)CONCAT11(DAT_00085bf3,DAT_00085bf2),
                     DAT_00085bf5,DAT_00085bf4);
        if ((((*puVar7 & 0x8000) != 0) && ((puVar7[3] & 0x8000) == 0)) &&
           (uVar4 = puVar7[3] >> 6, 1 < uVar4)) {
          bVar5 = true;
          local_2c = uVar4;
        }
      }
      goto joined_r0x00048308;
    }
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while( true );
}




// was FUN_000485f4
int hit_test_inventory_widget(param_1,param_2)
short param_1;
short param_2;

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = (int)param_1;
  if (*(short *)(DAT_00085a6c + 8) == 4) {
    if ((((0x8b < iVar1) && (iVar1 < 0xc1)) && (param_2 < 0x30)) && (10 < param_2)) {
      return 0x18;
    }
  }
  else if ((DAT_0023be5c < iVar1) && (iVar1 < (int)DAT_0023be5c + (int)DAT_0023bd80)) {
    if (((int)param_2 < (int)DAT_0023be80) && ((int)DAT_0023be80 - (int)DAT_0023be88 < (int)param_2)
       ) {
      return 0x17;
    }
  }
  /* The "open container"/leave-container click used to be special-
     cased here at a guessed screen position (this project's own
     CONTAINER_ICON_WIDGET_ID hack, before widget 20's real hotspot
     data was recovered) -- removed now that the real table entry for
     widget 20 (scanned below, same as every other widget) covers it
     correctly, and drawing a real icon there too instead of the
     hack's slightly-offset guess. See DAT_00085c4c's own comment and
     handle_object_drop_target's `iVar2==0x14` case for the current
     mechanism. */
  iVar3 = 0;
  while (((iVar2 = iVar3 * 0xe, iVar1 < *(short *)(&g_inv_hotspot_click_x1 + iVar2) ||
          (*(short *)(&g_inv_hotspot_click_x2 + iVar2) < iVar1)) ||
         ((*(short *)(&g_inv_hotspot_click_y2 + iVar2) < param_2 ||
          (param_2 < *(short *)(&g_inv_hotspot_click_y1 + iVar2)))))) {
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    if (0x16 < iVar3) {
      return -1;
    }
  }
  return iVar3;
}



// was FUN_0003f648 -- called from handle_inventory_panel_click's
// param_1==-2 sentinel case (src/inventory.c:324, a distinct
// interaction gesture on an inventory/container slot). Runs the
// trap/use check (action code 5) on the target, then -- unless it's
// one of two exempt classes (0x140/0x180) or flagged non-searchable in
// the per-class table &DAT_00202c9a -- rolls a skill check (the skill
// id byte at DAT_00086df8+0x29, also reused for other skill checks
// elsewhere) and records the result into a 3-bit "search level" field
// in the object's quality bits (0x380), without re-rolling once that
// field already holds a value. Finishes by dispatching the object
// action and refreshing the inventory panel. Reads as a "search this
// object" (e.g. a corpse or container) interaction.
void perform_object_search_check()

{
  int iVar1;
  uint uVar2;
  uint uVar3;

  trigger_object_trap_or_use_action(g_player_object,g_interact_target,5,(int)DAT_002020a0,DAT_002020a4);
  if (g_interact_target == (ushort *)0x0) {
    g_interact_target = (ushort *)resolve_clicked_inventory_item(2);
    if (g_interact_target != (ushort *)0x0) goto LAB_0003f69c;
  }
  else {
LAB_0003f69c:
    uVar3 = *g_interact_target & 0x1c0;
    if (((uVar3 != 0x140) && (uVar3 != 0x180)) &&
       (((&DAT_00202c9a)[(*g_interact_target & 0x1ff) * 0xd] & 3) != 2)) {
      uVar3 = (g_interact_target[1] & 0x380) >> 7;
      if ((uVar3 & 4) == 0) {
        iVar1 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x29),10);
        uVar2 = iVar1 + 1;
        if ((int)(uVar2 * 0x10000) >> 0x10 == 0) {
          uVar2 = 1;
        }
        if ((short)uVar2 < (short)((ushort)uVar3 & 3)) {
          uVar2 = uVar3 & 3;
        }
        uVar3 = CONCAT11(*(undefined1 *)((char *)g_interact_target + 3),(char)g_interact_target[1]) & 0xfe7f |
                (uVar2 & 3 | 4) << 7;
        *(char *)(g_interact_target + 1) = (char)uVar3;
        *(char *)((char *)g_interact_target + 3) = (char)(uVar3 >> 8);
      }
      else {
        uVar2 = uVar3 & 3;
      }
      goto LAB_0003f7cc;
    }
  }
  uVar2 = 1;
LAB_0003f7cc:
  dispatch_object_action(g_interact_target,uVar2);
  handle_inventory_panel_click(0xffffffff);
  return;
}


// was FUN_000400a0 -- toggles combat stance on/off; the weapon-hand
// paperdoll slot's click handler (handle_object_drop_target) calls
// this.
void toggle_weapon_ready()

{
  if (getenv("UW_DEBUG_COMBAT"))
    fprintf(stderr, "[weapon-ready] toggle_weapon_ready CALLED: flags5f=0x%x\n", (unsigned)*(byte *)(DAT_00086df8 + 0x5f));
  if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) {
    ready_weapon();
  }
  else {
    unready_weapon();
  }
  if (getenv("UW_DEBUG_COMBAT"))
    fprintf(stderr, "[weapon-ready] toggle_weapon_ready DONE: flags5f=0x%x g_cursor_mode=%d\n", (unsigned)*(byte *)(DAT_00086df8 + 0x5f), (int)g_cursor_mode);
  return;
}


/* Was `int` -- g_save_record_base_ptr is a real `undefined1 *` heap pointer (the
   inventory-serialization scratch buffer allocated in write_player_save_record/
   build_player_save_record), so `g_save_record_base_ptr + g_save_record_count * 8` is real pointer
   arithmetic, but returning it as a 32-bit `int` truncated the pointer
   before the caller's `(undefined1 *)` cast sign-extended the truncated
   low 32 bits back out to 64 -- producing a wild address. Confirmed via
   lldb disassembly of this port's own compiled binary (not the original
   ARM code): serialize_inventory_link_chain's call site does exactly `mov x8, x0; sxtw
   x8, w8` on this function's return value, then dereferences it a few
   instructions later -- the crash a QA report reproduced by saving with
   an item in inventory (any inventory contents send serialize_inventory_link_chain
   through the resolve_object_link/alloc_save_record_slot loop that hits this).
   Same pointer-truncation bug class fixed many times elsewhere this
   session, just via a return type this time instead of a parameter or
   local. */
// was FUN_00044294
void *alloc_save_record_slot()

{
  g_save_record_count = g_save_record_count + 1;
  return g_save_record_base_ptr + g_save_record_count * 8;
}



/* Same truncated-pointer-return bug as alloc_save_record_slot just above, same
   fix. */
// was FUN_000442bc
void *save_record_slot_from_index(param_1)
short param_1;

{
  void *iVar1;

  if (param_1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = g_save_record_base_ptr + param_1 * 8;
  }
  return iVar1;
}
