#ifndef GX_STUB_H
#define GX_STUB_H

int GXOpenDisplay(void *hwnd, unsigned int flags);
int GXCloseDisplay(void);
void *GXBeginDraw(void);
int GXEndDraw(void);
int GXOpenInput(void);
int GXCloseInput(void);
void *GXGetDefaultKeys(void *outBuffer);
void *GXGetDisplayProperties(void);
int GXSuspend(void);
int GXResume(void);

/* Saves the current window contents (post-rotation, what's actually on
   screen) as a BMP. Returns 1 on success, 0 on failure (no window yet, or
   the write failed). Meant for demomode's SCREENSHOT command -- lets
   scripted test runs (and Claude) capture what a screen looks like
   without a human manually taking one. */
int uw_save_screenshot(const char *path);

/* Debug tool: if UW_DEBUG_DUMP_GR is set (and not "0"), dumps every
   .GR resource entry loaded through FUN_000417b4 to a BMP under
   debug/gr/<resource-name>/<entry-index>.bmp, colored with the currently
   installed game palette. No-op (cheap check) when the env var is unset.
   entry_data/entry_size are the raw bytes for one entry as loaded from
   the file (5-byte header: format, width, height, 2 unknown bytes,
   followed by width*height raw palette-index pixel bytes -- confirmed
   against CHRBTNS.GR's real file layout and bitmap_blit_to_framebuffer's
   param semantics this session). */
void uw_debug_dump_gr_entry(const char *gr_name, int entry_index,
                             const unsigned char *entry_data, int entry_size);

/* Debug tool: if UW_DEBUG_DUMP_CRIT is set (and not "0"), dumps every
   critter/NPC sprite frame decode_critter_sprite_page produces to a BMP
   under debug/crit/type<N>/tier<T>/dir<D>_frame<F>.bmp, colored with the
   currently-installed game palette (decode happens mid-level, so the
   right CRIT palette is already live the same way most .GR dumps are).
   Meant to inspect how many of a given creature's 8 relative-viewing-
   angle directions actually have distinct art in the real game data,
   the same way UW_DEBUG_DUMP_GR is used to inspect .GR sprite sheets.
   pixels is a plain type_width*type_height palette-index buffer (no
   header, unlike a .GR entry). No-op (cheap check) when the env var is
   unset.

   At native 1:1 pixel scale these sprites look heavily dithered/noisy
   up close -- confirmed (by cropping a real in-game screenshot to the
   same native scale) that this matches the actual on-screen art, not a
   dump bug; it reads as a coherent shaded creature once composited into
   a full scene. UW_DEBUG_DUMP_CRIT_ALL (any value) disables the
   dedupe-by-(type,tier,direction,frame) so every decode gets written
   instead of just the first one seen. */
void uw_debug_dump_critter_sprite(int type, int tier, int direction, int frame,
                                   const unsigned char *pixels, int width, int height);

/* Debug tool: if UW_DEBUG_DRAW is set (and not "0"), dumps the internal
   320x240 RGB565 software framebuffer (g_uw_framebuffer) to a BMP after
   every draw call that goes through graphics.c's rect_fill_or_save_restore
   or bitmap_blit_to_framebuffer, so a whole run's sequence of draws can be
   played back frame-by-frame afterward. All dumps from one run land under
   one directory named for that run's start time, debug/drawdumps/<ts>/,
   each file numbered by an increasing draw-call counter and tagged with
   which function produced it. No-op (cheap check) when the env var is
   unset. `tag` should be a short caller name, e.g. "blit" or "rect_fill".
   UW_DEBUG_DRAW_EVERY=N thins the output to every Nth call (for very
   long sequences like a full-level automap fill). */
void debug_framebuffer_dump(const char *tag);

/* Debug tool: if UW_DEBUG_DUMP_TMAP is set (and not "0"), dumps a level's
   64x64 tile map to a BMP right after it's loaded from the .ark file --
   solid tiles (tile type 0, the classic UW "rock/no floor" type) as black,
   every other tile type (open floor and its diagonal/slope variants) as
   white. One 64x64-pixel BMP per load under debug/tmap/<ts>/, named by an
   increasing counter and the level number, so a new game (and any level
   transition) each gets their own file. tile_data is the raw 4-bytes-per-
   tile array as loaded (DAT_002029cc in uw.c); only byte 0's low nibble of
   each 4-byte entry is read. No-op (cheap check) when the env var is
   unset. */
void uw_debug_dump_tmap(int level, const unsigned char *tile_data);

/* Returns 1 and clears the flag if a mouse event (move/click) was
   processed since the last call, 0 otherwise. One-shot "was there a
   pending mouse message" signal for Ordinal_864 (PeekMessage) -- see its
   comment in ordinal_stubs.c for why this is needed alongside
   DAT_0023c448. */
int uw_take_mouse_event_pending(void);

/* For scripted/unattended testing: warps the real cursor to (window_x,
   window_y) (SDL window points) and pushes genuine SDL_MOUSEBUTTONDOWN/UP
   events, so the click flows through the exact same path a real mouse
   click does (unlike demomode's CLICK command, which bypasses
   uw_pump_events entirely). Returns 1 on success, 0 if there's no window
   yet. */
int uw_inject_mouse_click(int window_x, int window_y);

/* Right-button click (interact). Down+up queued together. */
int uw_inject_mouse_rclick(int window_x, int window_y);

/* Split halves of uw_inject_mouse_click, for tests that need a real
   multi-poll gap between button-down and button-up (matching an actual
   held click's timing) rather than both queued instantaneously. */
int uw_inject_mouse_down(int window_x, int window_y);
int uw_inject_mouse_up(int window_x, int window_y);

/* Push a genuine SDL_KEYDOWN (+ SDL_TEXTINPUT for a printable key) / SDL_KEYUP
   for the given SDL_Keycode, so scripted tests exercise uw_pump_events()'s
   real keyboard path (demomode's SDLHOLD command). Returns 1, or 0 if
   there's no window yet. */
int uw_inject_key_down(int sdl_keycode);
int uw_inject_key_up(int sdl_keycode);
void uw_clear_synth_scancode(int sdl_keycode);

#endif
