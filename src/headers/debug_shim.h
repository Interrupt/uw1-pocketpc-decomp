#ifndef HEADERS_DEBUG_SHIM_H
#define HEADERS_DEBUG_SHIM_H

/* Declarations for debug_shim.c: the general debug panel's own population/inspector logic
   (populate_debug_panel and friends) plus the one-shot UW_DEBUG_ and UW_DUMP_ dump tools that used
   to live inline in hud.c. Split out so hud.c stays focused on real HUD behavior -- none of this is
   reachable from normal gameplay. Pulls in uw.h itself so this header is self-contained. */
#include "uw.h"

/* Debug object inspector (gx_stub.c's own mouse-down handling calls this for a click inside the 3D
   viewport while the debug panel is visible) -- runs the real object pick and swaps the debug panel
   into a read-only properties view of whatever was under the cursor, or back to the normal
   subsystem-toggle panel if nothing was there. */
void dbgui_object_inspector_pick(void);
/* Populates the general debug panel (subsystem toggles, or the object inspector -- see
   dbgui_object_inspector_pick above) for the current frame; call once, right before dbgui_draw(). */
void populate_debug_panel(void);

/* Debug view (UW_DEBUG_PICK_VIEW): paint the per-pixel object-pick buffer over the 3D viewport
   instead of the rendered dungeon. */
void uw_debug_blit_pick_buffer(void);
/* Debug view (UW_DEBUG_DRAW_INV_POSITIONS): outline every real inventory hotspot's click rect in
   bright red, directly into the framebuffer. */
void uw_debug_draw_inv_hotspot_positions(void);
/* Debug tool (UW_DUMP_CRITTER_SHEET): systematically drive decode_critter_sprite_page across every
   (tier, direction, frame) combination for one or more critter type indices. */
void uw_debug_dump_critter_sheet_once(void);
/* Debug tool (UW_DUMP_SPRITE_FRAMES / UW_DUMP_SPRITE_IDS): dump individual sprites to standalone
   BMP files by real resource id. */
void uw_debug_dump_sprite_frames_once(void);
/* Temporary test hook for verifying the armor paper-doll equip flow without a real "give item"
   mechanism -- see its own comment in debug_shim.c. */
void uw_debug_force_item_id_once(void);

#endif
