/* Top-level program flow: WinMain's real body (window/subsystem init and
 * the OS message pump) and the title/main menu loop. Split out of uw.c
 * (the original monolithic decompile) once these functions' real roles
 * were confirmed. */
#include "headers/game.h"
#include "headers/debug.h"
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

#define DAT_00201b70 DAT_00201b70_backing[0]
// was DAT_0024af74. Nonzero: draw_text_string colors glyph pixels via
// the palette index *g_draw_color_index; zero (the default -- nothing
// else in this decompile ever sets it) uses the flat g_text_flat_color
// instead. A reentrancy/mode flag set only around one unrelated dialog-
// box drawing routine (display_book_or_scroll_page), so callers elsewhere that want
// palette-indexed text (e.g. draw_menu_item_list's highlighted save-slot
// labels) must force it themselves for the duration of the draw.
int g_text_use_palette_color;
static int DAT_0023c5b0;
// was DAT_0008429c_backing/DAT_0008429c. Current draw-color palette
// index, written before nearly every text/UI draw call across the file
// and read back by draw_text_string (when g_text_use_palette_color is
// set) and various fill/blit routines.
static byte g_draw_color_index_backing[128];
byte *g_draw_color_index = g_draw_color_index_backing;
/* DAT_000879b0/DAT_000890a4 (the active font's 12-byte header and its
   glyph-bitmap data, both filled in by select_active_font's file reads)
   were plain uninitialized pointers -- no allocation anywhere in this
   file, and confirmed via Ghidra xref search that the real ARM binary's
   own source slots (0x40dd8/0x40ddc) are READ-ONLY across the whole
   binary too, never written by any real code -- so these were never
   runtime-malloc'd pointers at all; they're link-time-constant
   addresses of fixed static buffers that Ghidra's static analysis
   couldn't recover (same class as several other "silently zero"
   globals already fixed this session). Confirmed live: DAT_000890a4
   was NULL, and unpack_glyph_bitmap's pointer arithmetic off NULL
   landed in essentially-random process memory that happened to overlap
   a heap block libSystem/Foundation legitimately allocated-then-freed
   during app startup -- an ASan-caught heap-buffer-overflow (uw.c:7007)
   on the first automap-note text draw of any session, not a "sometimes"
   bug: font rendering was silently using this same wild pointer on
   every single draw all along, just usually landing in mapped-but-
   irrelevant memory instead of a freed block that trips ASan. Given
   real backing storage instead, sized to what select_active_font's own
   reads need (12-byte header; 0x1080 bytes of glyph data -- see that
   function's own comment on why 0x1080). */
static static char DAT_000879b0_backing[12];
char *DAT_000879b0 = DAT_000879b0_backing;
static static char DAT_000890a4_backing[0x1080];
char *DAT_000890a4 = DAT_000890a4_backing;
byte *DAT_0024af78;
byte *DAT_0024af7c;
char *DAT_0023cca0;
/* Not `static` -- also used by game.c (app_main_loop, main_menu_loop);
   see the extern declaration and DAT_0023cca8 macro alias in uw.h. */
undefined1 DAT_0023cca8_backing[32768];
static undefined1 DAT_00084298_backing[128];
undefined1 *DAT_00084298 = DAT_00084298_backing;
/* Was `undefined4` despite being assigned a real malloc'd pointer
   (`DAT_00248410 = DAT_0023c44c;`, itself `ce_malloc(0x4cce)`'s
   result) -- truncating on this 64-bit host and feeding a garbage
   pointer to ce_memset/ce_memmove. Same fix applied to its two
   sibling aliases, DAT_0023cca4 and DAT_0024ad58, assigned from the
   same source right next to this one. */
char *DAT_00248410;
int DAT_00201c98;
static char s__DATA_pres1_byt_00085790[] = "\\DATA\\pres1.byt";
undefined4 DAT_0023c540;
static char s__DATA_lev_ark_00085734[] = "\\DATA\\lev.ark";
static char s_Not_enough_disk_space_for_save_g_00085744[] = "Not_enough_disk_space_for_save_g";
static char s__DATA_COPYRIGHT_BYT_0008576c[] = "\\DATA\\COPYRIGHT.BYT";
static char s__DATA_pres2_byt_00085780[] = "\\DATA\\pres2.byt";
/* Not `static` -- also used by game.c (app_main_loop, main_menu_loop);
   see the extern declaration and DAT_000857a0 macro alias in uw.h.
   Was zero-initialized -- an "unrecoverable string constant" Ghidra never
   populated (same class of bug as the CHRBTNS/opbtn resource-name fixes),
   but unlike those it has NO writer anywhere in uw.c or game.c either, so
   it's a real compile-time constant, not a runtime-built buffer. Every
   reader concatenates it as the base of a "\SAVE0\..." path (lev.ark,
   bglobals.dat, desc) alongside already-recovered sibling constants that
   spell that prefix out in full (s__SAVE0_lev_ark, s__SAVE0_desc, etc.),
   and probe_save_slots/load_game_from_slot both search the built path for a literal
   '0' character to substitute a real slot digit (1-4) -- only "SAVE0"
   supplies one. Recovered as "\SAVE0"; kept the oversized backing array
   since nothing else relies on its exact size. */
undefined1 DAT_000857a0_backing[32768] = "\\SAVE0";
static undefined2 DAT_00201b6c;
/* Per-(redraw-mode, dirty-bit) handler dispatch table read by
   dispatch_sticky_mode_handlers/enter_dungeon_view/handle_player_death_and_menu_transition/change_game_mode (DAT_00201b64 = the
   mode: 0 is the normal in-game/dungeon view, seen so far; 1 and 2 are
   some other screen). It's link-time-initialized data in the original
   binary -- nothing in this decompile ever writes to it at runtime -- so
   unlike this file's usual "orphaned populator function" bugs (e.g.
   chrbtns_offset_table_builder), there's no call to recover: the table's real content
   was recovered by reading UU.exe's .data section directly via Ghidra
   (same method already used for this file's string-constant symbols; see
   e.g. s_chrbtns_00084ef8's comment), then matching each recovered
   32-bit ARM address against this file's own FUN_ names by address.
   Left as a bare zero-filled placeholder, every handler read came back
   NULL, so the per-frame redraw dispatch (dispatch_sticky_mode_handlers) never called
   anything -- the game reached the dungeon and ran forever, but no HUD
   panel, 3D view, or tmap tile ever drew.

   3 of the 48 slots point at functions this decompile never recovered:
   they're only ever reached indirectly through this table, so Ghidra's
   original auto-analysis had no direct call site to find them from (same
   root cause as chrbtns_offset_table_builder/populate_menu_button_bitmap_entry needing separate recovery).
   Disassembling them directly (Ghidra, headless) shows they're
   conversation-portrait-animation and ambient-sound-cycling handlers --
   not needed to get a player standing in a rendered dungeon, so left
   NULL (safely skipped by this table's own "if handler != NULL" guard)
   rather than ported. // Hack - Disabled

   Real entries are function-pointer-sized (8 bytes on this 64-bit host)
   -- wider than the original 4-byte ARM pointers the table's own index
   math was written for, so every read site's byte-stride constant is
   doubled (0x40 -> 0x80 per 16-entry mode row, 4 -> 8 per single entry;
   see each site's own comment). */
void (*const DAT_00085668_real_table[48])(void) = {
  /* mode 0 (in-game/dungeon view) */
  /* Original bit 1 is the 0x3c190 thunk to render_dungeon_frame_timed
     (0x5bbe0); picture dismissal requests this bit via FUN_00049924(2). */
  (void(*)(void))enter_dungeon_view, (void(*)(void))render_dungeon_frame_timed, 0, (void(*)(void))dungeon_view_anim_tick,
  0, 0, 0, 0,
  0, (void(*)(void))refresh_equipment_display_if_visible, (void(*)(void))handle_game_victory_sequence, (void(*)(void))movement_pacing_handler,
  (void(*)(void))sync_player_stats_to_hud, (void(*)(void))hud_panel_redraw_dispatch, 0, 0 /* Hack - Disabled: mode-exit handler, unrecovered */,
  /* mode 1 */
  0, (void(*)(void))enter_automap_screen, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0 /* Hack - Disabled: ambient sound cycling */, 0, 0, (void(*)(void))exit_automap_screen,
  /* mode 2 */
  (void(*)(void))enter_conversation_mode_screen, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, (void(*)(void))exit_talk_mode,
};
undefined2 DAT_000868d8;
static char s_Error_code_XXXX___000857c8[] = "Error_code_XXXX_$";
static char s_Out_of_Low_Memory___000857dc[] = "Out_of_Low_Memory.$";
static char s_Out_of_EMS_Memory___000857f0[] = "Out_of_EMS_Memory.$";
static char s_Could_not_read_data___00085804[] = "Could_not_read_data.$";
static char s_Could_not_write_data___0008581c[] = "Could_not_write_data.$";
static char s_Resource_problem_or_internal_err_00085834[] = "Resource_problem_or_internal_err";
static char s_Underworld_can_no_longer_run__Er_0008585c[] = "Underworld_can_no_longer_run._Er";
static undefined DAT_00201b70_backing[8192];
void *DAT_00202308_arr[256];
/* Per-geometry-record decoded-sprite pixel buffers, one malloc per visible
   object, freed each frame by free_frame_geometry_buffers. Ghidra typed it
   `undefined4` (4 bytes), truncating the 64-bit ce_malloc pointer -- the
   memcpy into it (ce_memmove) would fault. Widened to a real pointer
   array; only decode_tile_object_billboard_texture, free_frame_geometry_buffers and app_main_loop's
   startup zero-fill touch it. */
void *DAT_0023c7a0_arr[0x140];
static undefined2 DAT_0020272c;
static undefined2 DAT_0024fa1c;
static char DAT_00085988;
char DAT_0024d000;
char DAT_0024fa28;
/* Was `static undefined DAT_000859ac_backing[8192]` -- Ghidra never
   recognized this as a string reference (no cross-reference to label
   it), but the raw bytes at this address in the real binary spell out
   "optb\0" plainly -- confirmed via direct memory dump (Ghidra
   headless, `mem.getBytes`), matching OPTB.GR in data/DATA/. This and
   its 3 siblings below were the "Unrecoverable string tables" this
   file's own comments referenced; all 4 turned out to be perfectly
   readable, just never labeled. Recovering them fixes the frame-
   counter corruption bug documented at load_gr_resource_entries's own
   "nothing to load" branch (each of these 4 was previously read as an
   empty string, silently re-adding the previous resource's frame
   count instead of contributing OPTB.GR's/etc.'s own real frames). */
static char s_optb_000859ac[] = "optb";
static char s_scrledge_000859b4[] = "scrledge";
static char s_spells_000859c0[] = "spells";
static char s_chains_000859c8[] = "chains";
/* Was `static undefined DAT_000859d0_backing[8192]` -- real bytes
   spell "eyes\0", matching EYES.GR. See s_optb_000859ac's comment. */
static char s_eyes_000859d0[] = "eyes";
static char s_power_000859d8[] = "power";
/* Was `static undefined DAT_000859e0_backing[8192]` -- real bytes
   spell "inv\0", matching INV.GR. See s_optb_000859ac's comment. */
static char s_inv_000859e0[] = "inv";
static char s_dragons_000859e4[] = "dragons";
static char s_compass_000859ec[] = "compass";
static char s_flasks_000859f4[] = "flasks";
static char s_tmobj_00085a04[] = "tmobj";
static char s_tmflat_00085a0c[] = "tmflat";
static char s_3dwin_00085a14[] = "3dwin";
static char s_cursors_00085a1c[] = "cursors";
static char s_buttons_00085a24[] = "buttons";
static char s_animo_00085a2c[] = "animo";
static char s_objects_00085a34[] = "objects";
static char s_views_00085a3c[] = "views";
static char s_question_00085a44[] = "question";
static char s__DATA_allpals_dat_00085a50[] = "\\DATA\\allpals.dat";
ushort DAT_0023c448;
static ushort DAT_000876bc_backing[128];
ushort *DAT_000876bc = DAT_000876bc_backing;
static short DAT_000876c0_backing[128];
short *DAT_000876c0 = DAT_000876c0_backing;
static undefined DAT_00028bfc_backing[8192];
#define DAT_00028bfc DAT_00028bfc_backing[0]
static char s_Lev__d____2_2u__1_1u__2_2u__1_1u_00086e08[] = "Lev_%d_@_%2.2u.%1.1u_%2.2u.%1.1u";
static byte DAT_0023bd84;
static undefined1 DAT_00086e05;
static undefined1 DAT_00086e06;
static undefined DAT_00086e00_backing[8192];
#define DAT_00086e00 DAT_00086e00_backing[0]
static int DAT_000db500;
short DAT_0024af6c;
/* Was `int` despite holding a real stack address (main_menu_loop:
   `DAT_0023bf6c = &local_82c;`) used in pointer arithmetic throughout
   this file -- truncating on this 64-bit host. */
static char *DAT_0023bf6c;
static ushort DAT_0023bf74;
/* populate_menu_button_bitmap_entry (main menu button record populator) used to split each
   loaded button bitmap's real pointer into 4 bytes and pack it directly
   into DAT_0023bf6c's record array -- fine for a 32-bit pointer on the
   original binary, but silently truncates a real 64-bit pointer here
   (confirmed via ASAN: draw_menu_item_list dereferencing the reassembled
   low-32-bits-only value, SEGV). Same "route the real pointer through a
   dedicated global instead of packing it into an undersized field"
   pattern as g_chargen_textfield_buf. Index formula (shared by
   populate_menu_button_bitmap_entry/draw_menu_item_list) is (selected?1:0) + button_index*4 -- a
   stride of 4 per button, not 2, so up to 4 buttons needs slots through
   index 13 (1 + 3*4); sized generously to 16. */
static char *g_menu_button_bitmaps[16];
static char s__DATA_CREDIT3_BYT_00086ea8[] = "\\DATA\\CREDIT3.BYT";
static char s__DATA_CREDIT2_BYT_00086ebc[] = "\\DATA\\CREDIT2.BYT";
static char s__DATA_CREDIT1_BYT_00086ed0[] = "\\DATA\\CREDIT1.BYT";
static char s_opbtn_00086ee4[] = "opbtn";
static char s__DATA_opscr_byt_00086eec[] = "\\DATA\\opscr.byt";
/* Was `int` despite holding a real malloc'd pointer (main_menu_loop:
   `DAT_0023bf70 = iVar4;` where iVar4 = ce_malloc(0x10000)), used in
   pointer arithmetic (`iVar9 + DAT_0023bf70`) -- truncating on this
   64-bit host. */
static char *DAT_0023bf70;
/* Same fix as DAT_00248410 above -- see its comment. */
char *DAT_0023cca4;
// was DAT_0023c210 -- the current frame's raw .GR entry pointer (see
// g_weapon_swing_raw_frames), set by weapon_swing_draw_tick right
// before decoding it -- was computed as `DAT_0023c214 +
// (short)(&DAT_0023c158)[frame]`. `DAT_0023c158` was declared as a
// lone 2-byte scalar despite being indexed up to 27 -- the same
// "Ghidra couldn't recover this table's real .data contents" shape as
// g_inventory_hotspot_table/DAT_00085668/etc. elsewhere in this file
// -- so that part of the expression read garbage for every frame but
// the first. `DAT_0023c214` (see its own declaration, just below) is
// real, but the intended packing scheme it and the lost offset table
// together addressed isn't recoverable, so this now points directly
// at g_weapon_swing_raw_frames[frame] instead -- one real per-frame
// allocation apiece rather than packed offsets into one shared
// buffer, matching how the file's other raw-GR-entry consumer
// (blit_object_sprite_by_frame) already reads a frame's real
// width/height straight from its own header bytes (entry[1]/entry[2])
// regardless of storage scheme.
char *g_weapon_swing_current_frame;
/* was DAT_0023c214, `int`-typed in both its own uw.h extern
   declaration and here -- app_main_loop (game.c) assigns it a real
   64000-byte ce_malloc allocation (the same one it hands
   g_weapon_swing_current_frame right beside it, before per-frame use
   overwrites that one), truncating the pointer on this 64-bit host
   exactly like every other pointer-in-a-narrow-global bug in this
   project. Fixed the type; the buffer itself is otherwise unused now
   that g_weapon_swing_current_frame is resolved via
   g_weapon_swing_raw_frames instead (see that comment) -- kept only
   because app_main_loop still allocates and assigns it. */
static char *g_weapon_swing_startup_scratch_buffer;
undefined1 DAT_00241f08_backing[32768];
static undefined2 DAT_0023c59e;
static undefined2 DAT_0023c5a0;
static char *DAT_0023c44c;
static char *DAT_0023cef0;
/* Same fix as DAT_00248410 above -- see its comment. */
static char *DAT_0024ad58;
int DAT_000876c8;
int DAT_0024af60;
undefined4 DAT_0023c648;
static unsigned short u_UltimaUW_00087678[] = u"UltimaUW";
static unsigned short u_Ultima_Under_World_00087690[] = u"Ultima_Under_World";
static unsigned short u_Software_Apps_ZIO_Interactive_Ul_000877a4[] = u"Software\\Apps\\ZIO_Interactive_Ul";
static char s__Program_Files_ZIO_Interactive_U_00087804[] = "\\Program_Files\\ZIO_Interactive\\U";
static unsigned short u_InstlDir_00087838[] = u"InstlDir";
static unsigned short u_Software_Apps_ZIO_Interactive_Ul_0008784c[] = u"Software\\Apps\\ZIO_Interactive_Ul";
static unsigned short u_HP_Jornada_540_000876cc[] = u"HP,Jornada_540";
static char s__Program_Files_ZIO_Interactive_U_000876ec[] = "\\Program_Files\\ZIO_Interactive\\U";
static unsigned short u_Software_Apps_ZIO_Interactive_Ul_0008771c[] = u"Software\\Apps\\ZIO_Interactive_Ul";
static char s__Program_Files_ZIO_Interactive_U_00087774[] = "\\Program_Files\\ZIO_Interactive\\U";
// DAT_000830b0 and UNK_000830b4 are the same {int msg_id; void
// *handler;} 8-byte-stride table (dispatch_window_message walks
// msg_id entries from &DAT_000830b0 via an `int*`, and reads the
// matching handler from UNK_000830b4 + index*8 -- exactly
// DAT_000830b0's own address + 4, i.e. the SAME struct's second
// field), not two independent globals. Both were declared as a lone
// byte / a separately-backed array, so the `int*` walk read past
// DAT_000830b0's 1-byte allocation into unrelated memory. Aliased
// into one shared backing array at their real relative offsets.
static undefined1 DAT_000830b0_backing[65536];
#define DAT_000830b0 DAT_000830b0_backing[0]
#define UNK_000830b4 DAT_000830b0_backing[4]



// WinMain's real body: single-instance mutex check, window class/window creation, framebuffer + subsystem init, shows the main menu once, then runs the PeekMessage/Translate/Dispatch message pump until quit.
undefined4 app_main_loop(param_1,param_2,param_3,param_4)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;

{
  uint uVar1;
  int iVar2;
  void *uVar3;
  undefined4 *puVar4;
  undefined1 auStack_40 [4];
  int local_3c;
  undefined4 local_38;

  uVar1 = FindWindowW(u_UltimaUW_00087678,u_Ultima_Under_World_00087690);
  if (uVar1 == 0) {
    DAT_0023c59e = 0;
    DAT_0023c5a0 = 0;
    DAT_0023c540 = param_1;
    spawn_message_dispatch_thread(param_1,u_UltimaUW_00087678);
    iVar2 = create_main_window_and_init_display(param_1,param_4);
    if (iVar2 != 0) {
      uVar3 = ce_malloc(0x25800);
      /* was a CONCAT22 pair split across _DAT_0023c5ac/DAT_0023c5b0 --
         see g_uw_framebuffer's declaration comment. */
      g_uw_framebuffer = uVar3;
      uVar3 = ce_malloc(0x25800);
      load_bmp_resource_to_rgb565(param_1,0xca,uVar3);
      dirty_rect_union(0,0xf0,0,0x140);
      ce_memmove(g_uw_framebuffer,uVar3,0x25800);
      flush_dirty_rect_to_display_240();
      Sleep(2000);
      LocalFree(uVar3);
      build_rgb565_palette(0,0xffffffff);
      build_shade_lut();
      DAT_0023c44c = ce_malloc(0x4cce);
      DAT_0023cca0 = ce_malloc(64000);
      DAT_0023cef0 = ce_malloc(0x7fff);
      ce_memset(DAT_0023c44c,0,0x4cce);
      /* DAT_0023c7a0 is now a real void*[] (widened from Ghidra's
         `undefined4`); zero it as one so the whole 8-byte slots clear. */
      for (iVar2 = 0; iVar2 < 0x140; iVar2++) {
        DAT_0023c7a0_arr[iVar2] = 0;
      }
      (void)puVar4;
      ce_memset(DAT_0023cca0,0,64000);
      ce_memset(DAT_0023cef0,0,0x7fff);
      DAT_0023cca4 = DAT_0023c44c;
      DAT_0024ad58 = DAT_0023c44c;
      DAT_00248410 = DAT_0023c44c;
      DAT_0024af78 = ce_malloc(0x1800);
      ce_memset(DAT_0024af78,0,0x1800);
      DAT_0024af7c = ce_malloc(0x1800);
      ce_memset(DAT_0024af7c,0,0x1800);
      DAT_000879b0 = ce_malloc(0xc);
      DAT_000890a4 = ce_malloc(0x1080);
      g_weapon_swing_current_frame = ce_malloc(64000);
      ce_memset(g_weapon_swing_current_frame,0,64000);
      g_weapon_swing_startup_scratch_buffer = g_weapon_swing_current_frame;
      *DAT_000876bc = 0;
      *DAT_000876c0 = 0;
      compute_dimension_volume();
      run_game_startup_sequence();
      build_trig_tables();
      wait_and_show_intro_page();
      main_menu_loop(1);
      DAT_00201c98 = 1;
      while (DAT_00201b6c != 0) {
        if (DAT_000876c8 == 0) {
          if ((DAT_0024af60 == 0) || (100 < DAT_0024af6c)) {
            if (DAT_0024af6c < 0x33) {
              DAT_0024af6c = (short)((int)DAT_0024af6c << 1);
            }
          }
          else {
            DAT_0024af6c = (short)((int)DAT_0024af6c << 2);
          }
        }
        else {
          DAT_0023c648 = read_realtime_clock_units();
          DAT_0023c448 = 0;
        }
        /* One real game tick -- see uw_advance_game_tick's own comment
           for why this must be called from exactly here (this loop, once
           per iteration) rather than from inside uw_pump_events() itself,
           which PeekMessageW below triggers but which can also be
           reached from other polling loops within a single iteration of
           this one. */
        uw_advance_game_tick();
        {
          static unsigned int _dbg_t0 = 0, _dbg_t1 = 0;
          int _dbg = getenv("UW_DEBUG_ITERSPLIT") != NULL;
          if (_dbg) _dbg_t0 = read_realtime_clock_units() * 4;
          iVar2 = PeekMessageW(auStack_40,0,0,0,1);
          if (iVar2 != 0) {
            if (local_3c == 0x12) break;
            TranslateMessage(auStack_40);
            DispatchMessageW(auStack_40);
          }
          if (_dbg) _dbg_t1 = read_realtime_clock_units() * 4;
          main_loop_hud_flush();
          if (_dbg) {
            unsigned int _dbg_t2 = read_realtime_clock_units() * 4;
            fprintf(stderr, "[itersplit] ordinal864_ms=%u hudflush_ms=%u\n",
                    _dbg_t1 - _dbg_t0, _dbg_t2 - _dbg_t1);
          }
        }
      }
      uVar3 = window_message_noop_handler(param_1,local_38);
      return uVar3;
    }
  }
  else {
    SetForegroundWindow(uVar1 | 1);
  }
  return 0;
}



// Title/main menu loop: builds the menu layout, dispatches on the selected option (0=continue?, 1=new game -> character_generator_loop, 2=show CREDIT1/2/3.BYT credits screens, 3=load a saved game), looping back to the menu until a game session actually starts.
void main_menu_loop(param_1)
undefined4 param_1;

{
  /* stack0xffdc2b6c/2c74/2d7c are leftover placeholder scalars (from an
     early undeclared-identifier fix pass) that separate "copy the
     install-dir base path" loops below used as
     `pcVar5[(int)&placeholder] = cVar1;` -- the classic "broken index
     copy loop" Ghidra artifact documented in the README, missed by the
     earlier systematic fix_stack_copy_loops.py/refix_stack_copy_loops.py
     passes. Each loop is immediately followed by ce_memset(REALBUF,
     0,0x104) + ce_strcat(REALBUF,...) using the buffer this copy was
     actually meant to fill -- redirected via a real incrementing destination
     pointer instead. */
  char *pcVar_dst;
  unsigned int stack0xffdc2b6c;
  unsigned int stack0xffdc2c74;
  unsigned int stack0xffdc2d7c;
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  int iVar4;
  char *pcVar5;
  int iVar6;
  undefined4 uVar7;
  undefined2 uVar8;
  int iVar9;
  int iVar10;
  bool bVar11;
  short local_83c [2];
  int local_838;
  /* Was `int`, holds the same ce_malloc(0x10000) pointer as
     DAT_0023bf70 (see its comment), passed to LocalFree (free) --
     truncating on this 64-bit host. */
  void *local_834;
  /* iVar4 is reused throughout this function for unrelated numeric work
     (timers, loop indices, etc.) after its brief life holding that same
     ce_malloc(0x10000) pointer -- pvVar_buf10000 takes over only that
     pointer-holding span instead of retyping iVar4 itself, same pattern
     as other dual-purpose-variable fixes elsewhere in this file. */
  void *pvVar_buf10000;
  /* Declared as a lone 4-byte scalar, but `&local_82c` is handed to
     DAT_0023bf6c and then read back through draw_menu_item_list/menu_button_list_navigate
     as an array of up to 4 (param_1) 0x10-byte-stride records (plus an
     overlapping 4-byte-stride array access) -- another undersized-local
     table, confirmed via ASAN stack-buffer-overflow. Widened directly.

     Ghidra also split the buffer's own first 0x40 bytes into 22 further
     separate locals (local_828 down through local_7ee, originally named
     for their individual stack offsets -0x828..-0x7ee -- each exactly
     0x82c-that_offset bytes into local_82c) instead of recognizing them
     as writes into this same array -- the classic "separate locals
     relied on being contiguous" artifact (see the README). Their
     offsets land EXACTLY on the first 4 button records' fields (4
     records x 0x10 bytes = 0x40): each record is [4-byte bitmap-ptr
     slot for unselected, 4-byte slot for selected (both now unused --
     see g_menu_button_bitmaps), 2-byte X, 2-byte Y, 2-byte W
     (placeholder, overwritten by populate_menu_button_bitmap_entry), 2-byte H (same)].
     Confirmed: their X/Y values (e.g. (0x62,0x52), (0x51,0x69),
     (0x48,0x81), (0x55,0x9a)) are exactly the button position data
     draw_menu_item_list reads back out at pcVar_rec+8/+10 -- previously always
     zero because these locals never actually reached local_82c's
     memory, which is why every button rendered stacked at (0,0). Merged
     directly into offset-based writes into local_82c below instead of
     keeping them as separate, non-aliasing scalars. */
  char local_82c [256];
  char acStack_7ec [264];
  undefined1 auStack_4d4 [160];
  
  /* local_82c is now a real array (see its declaration) -- zero the
     whole thing rather than just its first 4 bytes, since it's read
     back as a multi-record table. Every one of the offset writes below
     must happen after this, not before -- see local_82c's declaration
     comment for why they used to be separate, unmerged locals. */
  ce_memset(local_82c,0,sizeof(local_82c));
  /* Record 0 (button 0): bitmap-ptr slots (offsets 0/4) are now unused
     -- see g_menu_button_bitmaps -- X/Y at 8/0xa, W/H placeholders
     (overwritten by populate_menu_button_bitmap_entry once the real bitmap loads) at
     0xc/0xe. */
  *(short *)(local_82c + 8) = 0x62;
  *(short *)(local_82c + 0xa) = 0x52;
  *(short *)(local_82c + 0xc) = 1;
  *(short *)(local_82c + 0xe) = 1;
  /* Record 1 (button 1), same layout at +0x10. */
  *(short *)(local_82c + 0x18) = 0x51;
  *(short *)(local_82c + 0x1a) = 0x69;
  *(short *)(local_82c + 0x1c) = 1;
  *(short *)(local_82c + 0x1e) = 1;
  /* Record 2 (button 2), same layout at +0x20. */
  *(short *)(local_82c + 0x28) = 0x48;
  *(short *)(local_82c + 0x2a) = 0x81;
  *(short *)(local_82c + 0x2c) = 1;
  *(short *)(local_82c + 0x2e) = 1;
  /* Record 3 (button 3), same layout at +0x30. */
  *(short *)(local_82c + 0x38) = 0x55;
  *(short *)(local_82c + 0x3a) = 0x9a;
  *(short *)(local_82c + 0x3c) = 1;
  *(short *)(local_82c + 0x3e) = 1;
  dirty_rect_union(0,200,0,0x140);
  DAT_0023bf6c = &local_82c;
  probe_save_slots(auStack_4d4,local_83c);
  uVar8 = 3;
  if (local_83c[0] != 0) {
    uVar8 = 4;
  }
  uVar2 = 1;
  if (local_83c[0] != 0) {
    uVar2 = 3;
  }
  update_journey_onward_availability(param_1);
  push_cursor_icon(0x106c);
  cursor_show_idle_tick();
  bVar11 = false;
  local_838 = 0;
  do {
    iVar4 = local_838;
    advance_menu_music_track();
    if ((iVar4 < 4) && (-1 < iVar4)) {
      pvVar_buf10000 = ce_malloc(0x10000);
      DAT_0023bf70 = pvVar_buf10000;
      local_834 = pvVar_buf10000;
      ce_memset(acStack_7ec,0,0x104);
      pcVar5 = &DAT_0023cca8;
      pcVar_dst = acStack_7ec;
      do {
        cVar1 = *pcVar5;
        *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      ce_strcat(acStack_7ec,s__DATA_opscr_byt_00086eec);
      DEBUG(TRACE, "blitting %s", s__DATA_opscr_byt_00086eec);
      read_buffer_from_file(acStack_7ec,pvVar_buf10000,64000);
      decrement_cursor_hide_depth();
      // HACK: deviation from the real binary -- was load_pals_bank(2, temp_buf),
      /* confirmed via ARM disassembly of the original UU.exe
         (main_menu_loop == FUN_0006a3d8, calls load_pals_bank directly at
         both its own palette-load points, never through set_palette_bank).
         That's a genuine shipped bug, not a decompile artifact:
         load_pals_bank installs g_palette_rgb565 correctly for the menu's own
         draw, but never syncs DAT_00088d98 -- the buffer
         reinstall_active_palette() (called periodically by the menu's own hover-
         loop timer, animate_title_palette_cycle) always reinstalls from. Since nothing
         else keeps DAT_00088d98 current for the menu screen, it holds
         whatever palette some other screen last loaded via
         set_palette_bank, and the timer clobbers the menu's correct
         palette back to that stale one on the very next hover/redraw
         (confirmed via UW_DEBUG_LEVEL=TRACE: g_palette_rgb565 flips from
         pals.dat index 2 to a leftover index 5). Using set_palette_bank(2)
         here instead keeps DAT_00088d98 in sync, so that clobber
         reinstalls the *same* correct palette instead of a stale one. */
      set_palette_bank(2);
      iVar10 = 0;
      do {
        iVar6 = 0;
        do {
          iVar9 = iVar10 * 0x140 + iVar6;
          *(undefined2 *)((g_uw_framebuffer) + iVar9 * 2) =
               (&g_palette_rgb565)[*(byte *)(iVar9 + DAT_0023bf70)];
          iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        } while (iVar6 < 0x140);
        iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
      } while (iVar10 < 200);
      debug_framebuffer_dump("main_menu_loop");
      cursor_show_idle_tick();
      if ((DAT_0023bf70 == 0) ||
         /* Was a literal 0 here (an earlier fix pass believed this
            mirrored sibling call sites like decode_gr_entry_to_buffer's genuine
            "no postprocessing needed" case) -- but populate_menu_button_bitmap_entry is
            exactly the postprocess_cb this resource load needs: same
            3-arg shape as chargen's chrbtns_offset_table_builder (see its comment near
            DAT_000fb880), and it writes the per-button bitmap-pointer/
            width/height fields draw_menu_item_list reads out of DAT_0023bf6c's
            record table -- which is otherwise only ever zeroed
            (local_82c's memset above), never populated. Same orphaned-
            callback bug class as chrbtns_offset_table_builder was, just already
            decompiled as a named function instead of staying raw
            undecompiled ARM. */
         (iVar10 = load_gr_resource_entries(s_opbtn_00086ee4,0,0xffffffff,&opbtn_gr_bump_alloc_entry,&populate_menu_button_bitmap_entry), iVar10 == 0)) {
        report_fatal_error_and_exit(0x300d);
      }
      if (local_838 != 3) {
        draw_menu_item_list(uVar8,DAT_0023bf6c,0,uVar2);
        // HACK: same DAT_00088d98-sync deviation as this function's other
        // palette-load point above -- see that comment.
        set_palette_bank(2);
        fade_in(0,0,g_uw_framebuffer,200);
      }
    }
    sVar3 = menu_button_list_navigate(uVar8,DAT_0023bf6c,0,uVar2);
    local_838 = (int)sVar3;
    if (getenv("UW_DEBUG_TITLEMENU")) fprintf(stderr, "[titlemenu] uVar8=%d uVar2=%d navigate->%d\n", (int)uVar8, (int)uVar2, local_838);
    if (local_838 == -1) {
      run_game_shutdown_sequence(0);
      terminate_process(1);
    }
    else if (local_838 == 0) {
      display_book_or_scroll_page(0);
    }
    else if (local_838 == 1) {
      g_text_use_palette_color = 1;
      fade_out(0,0,g_uw_framebuffer,200);
      /* Extracted (unit-testing-framework merge) into prepare_new_game,
         src/game.c -- see its own comment; this used to be the entire
         chargen->\SAVE0\lev.ark-seeding sequence inlined here. */
      bVar11 = prepare_new_game();
      g_text_use_palette_color = 0;
    }
    else if (local_838 == 2) {
      iVar4 = read_realtime_clock_units();
      do {
        ce_memset(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_7ec,s__DATA_CREDIT1_BYT_00086ed0);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      iVar4 = read_realtime_clock_units();
      do {
        ce_memset(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_7ec,s__DATA_CREDIT2_BYT_00086ebc);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      iVar4 = read_realtime_clock_units();
      do {
        ce_memset(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_7ec,s__DATA_CREDIT3_BYT_00086ea8);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      set_pending_update_flags(0x7ffe);
    }
    else if (local_838 == 3) {
      sVar3 = journey_onward_load_slot_menu();
      bVar11 = sVar3 == 1;
      if (sVar3 == -1) {
        uVar7 = get_message_string(0x2a9);
        ce_memset(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_7ec,s__DATA_opscr_byt_00086eec);
        blit_fullscreen_bitmap_file(0xffffffff,acStack_7ec,1);
        select_active_font(s_FONTBIG_SYS_00085454);
        *g_draw_color_index = 0xa2;
        *DAT_00084298 = 0xa2;
        sVar3 = measure_text_width(uVar7);
        iVar4 = (int)sVar3;
        if (iVar4 < 0) {
          iVar4 = iVar4 + 1;
        }
        draw_text_string(uVar7,0xa0 - (short)(iVar4 >> 1),0x5a);
        cursor_show_idle_tick();
        while (sVar3 = next_input_event(), sVar3 < 0) {
          animate_title_palette_cycle();
        }
        select_active_font(s_FONT5X6P_SYS_00084e9c);
      }
      else if (bVar11) {
        unready_weapon();
      }
    }
    LocalFree(local_834);
  } while (!bVar11);
  begin_gameplay();
  return;
}



// was FUN_00066c90 -- closes the backpack container UI and clears the
// player's transient inventory-view state before a level transition
// (reset_player_for_resurrection, a resurrect/reset-position path) or a fresh level
// load (load_level), so no dangling container reference survives the
// change.
void close_panels_before_level_change()

{
  close_backpack_container();
  free_player_inventory_chain((char *)g_player_object + 6);
  reset_equipment_and_container_state();
  return;
}



// was FUN_00066cb4 -- zeroes g_player_object's whole 0x1b-byte record
// then re-sets it to a fresh blank object header/mobile-record: a
// default heading/quality pattern, item-id 0x7f (the player's fixed
// item-id), and clears the container/link/status bitfields. Called
// once from init_gameplay_session at the start of every session.
void reset_player_object_record()

{
  ushort uVar1;

  ce_memset(g_player_object,0,0x1b);
  *(byte *)((char *)g_player_object + 3) = (byte)g_player_object[3] & 0x3f;
  *(undefined1 *)((char *)g_player_object + 7) = 0;
  *(undefined1 *)((char *)g_player_object + 0xd) = 0xfd;
  uVar1 = *g_player_object;
  *(char *)g_player_object = (char)(uVar1 & 0x7fff);
  *(char *)((char *)g_player_object + 1) = (char)((uVar1 & 0x7fff) >> 8);
  uVar1 = *g_player_object;
  *(char *)g_player_object = (char)uVar1;
  *(byte *)((char *)g_player_object + 1) = (byte)(uVar1 >> 8) | 0x20;
  uVar1 = *g_player_object;
  *(char *)g_player_object = (char)(uVar1 & 0xbfff);
  *(char *)((char *)g_player_object + 1) = (char)((uVar1 & 0xbfff) >> 8);
  uVar1 = g_player_object[1];
  *(char *)((char *)g_player_object + 1) = (char)(uVar1 & 0xfc7f);
  *(char *)((char *)g_player_object + 3) = (char)((uVar1 & 0xfc7f) >> 8);
  *(byte *)((char *)g_player_object + 0xc) = (byte)g_player_object[0xc] & 0xe0;
  uVar1 = g_player_object[2];
  *(char *)((char *)g_player_object + 2) = (char)(uVar1 & 0xffc0);
  *(char *)((char *)g_player_object + 5) = (char)((uVar1 & 0xffc0) >> 8);
  *(byte *)((char *)g_player_object + 2) = (byte)g_player_object[2] & 0x3f;
  *(undefined1 *)((char *)g_player_object + 5) = 0;
  uVar1 = g_player_object[3];
  *(char *)((char *)g_player_object + 3) = (char)(uVar1 & 0xffc0);
  *(char *)((char *)g_player_object + 7) = (char)((uVar1 & 0xffc0) >> 8);
  *(byte *)((char *)g_player_object + 3) = (byte)g_player_object[3] & 0x3f;
  *(undefined1 *)((char *)g_player_object + 7) = 0;
  *(undefined1 *)((char *)g_player_object + 0x11) = 0;
  uVar1 = *g_player_object;
  *(undefined1 *)g_player_object = 0x7f;
  *(byte *)((char *)g_player_object + 1) = (byte)(uVar1 >> 8) & 0xfe;
  return;
}



// was FUN_00066e90 -- one-time gameplay session setup: initializes
// player/camera/movement state (starting level 1, facing, locomotion
// mode), the player object record (reset_player_object_record),
// several link-time-initialized gameplay-enable flags this port's
// decompile otherwise leaves permanently zero (g_npc_tick_enabled,
// the scheduler-tick gate DAT_000879ac, the keyboard command-mode
// flag DAT_0024af60 -- see each flag's own inline comment for the
// bug this fixes), then registers the whole movement/UI key-binding
// and click-region table. Called once at the start of a session.
void init_gameplay_session()

{
  int iVar1;

  /* DAT_002029cc is set once, early (init_level_object_arena/reset_level_object_arena: a real
     malloc'd pointer via ce_malloc), and DAT_002046b8/DAT_002046c4
     are derived from it and never touched again. By the time this
     function runs, though, DAT_002029cc has been observed (via a
     temporary diagnostic print) to no longer hold that pointer -- some
     other write elsewhere in this file is landing on its storage
     between then and now, the same general "stray write corrupts an
     unrelated global" class of bug as DAT_0023c5ac/DAT_0023c5b0 and
     DAT_00110fc8/fc0/fcc earlier, but the actual writer wasn't pinned
     down (not caught by ASAN as an out-of-bounds write, so it's likely
     a plausible-looking but wrong destination computed elsewhere rather
     than a classic overflow). Rather than dereference a pointer derived
     from corrupted state (confirmed crashing in ce_memset by way of
     reset_player_object_record), bail out defensively if it doesn't look like a
     plausible heap pointer. */
  if ((uintptr_t)DAT_002029cc < 0x10000) {
    return;
  }
  DAT_0023b82c = (byte *)(DAT_002046b8 + 0x1b);
  DAT_00202080 = 0xffff;
  DAT_00201c78 = 0;
  DAT_00201c70 = 0;
  DAT_0023beb4 = 0;
  DAT_0023beb8 = 0;
  /* Command-input mode. When set, handle_keyboard_message folds a WM_CHAR
     letter to its uppercase code before dropping it in DAT_0023c448, so
     the movement key bindings registered just below (W/S/X/A/D = VK
     codes 0x57/0x53/0x58/0x41/0x44) actually match a keypress, and the
     main loop ramps the hold-acceleration counter faster. It is a
     link-time-initialised flag whose real setup Ghidra dropped (same
     silently-zero class as DAT_00086e68 / DAT_0008589c etc.): left at 0
     the keyboard movement keys were dead. Toggled off again by the
     Caps-Lock key (VK 0x14) in handle_keyboard_message; text-entry
     screens that need raw lowercase (chargen name entry) run before this
     function. */
  DAT_0024af60 = 1;
  DAT_00201b68 = 1;
  DAT_002048a7 = 8;
  DAT_002048a3 = 1;
  DAT_002048a4 = 0;
  DAT_002048b8 = &check_and_reset_landing_state;
  DAT_002048b2 = 0x1100;
  DAT_002048b0 = 0;
  g_player_object = DAT_0023b82c;
  load_shading_level_config(0);
  DAT_0023be8c = 0;
  DAT_00086df8 = &DAT_0023bca8;
  /* HACK, same silently-zero class as DAT_0024af60 above and DAT_00086e68 /
     DAT_0008589c elsewhere in this file: g_npc_tick_enabled is read exactly once
     in this whole file, as the enable gate for movement_tick's per-frame
     call to tick_mobile_objects (the real NPC/mobile-object AI+movement
     dispatcher -- walks the mobile object arena, drives NPC pathing via
     npc_movement_tick and other mobile objects via mobile_object_tick) -- but it is
     never written anywhere in this decompile, so the gate is permanently
     false and NPCs/mobile objects never tick. This is a link-time-
     initialised flag whose real setup Ghidra dropped, exactly like
     DAT_0024af60's movement-key command-mode flag above. Initialize it
     here, alongside this function's other one-time gameplay-enable flags. */
  g_npc_tick_enabled = 1;
  /* HACK, same silently-zero class as g_npc_tick_enabled just above:
     DAT_000879ac gates all three per-tick call sites of scheduler_tick
     (the scheduled-effects queue driver -- walks the queue
     scheduler_add_entry pushes to, ticking scheduler_step_entry's gradual per-object
     step until each entry's delay expires, then scheduler_finish_entry finalizes
     it) that fire from ordinary gameplay: move_key_directional_step's
     per-held-key-frame call, its sibling per-frame movement-pacing
     call, and the per-tile-scan idle-animation call. Declared but never
     assigned anywhere in this decompile (confirmed via a full-session
     trace, UW_DEBUG_DOOR2=1: scheduler_tick never ran once, zero hits
     across 470000+ log lines covering chargen, movement, and object
     interaction), so the entire queue -- doors' real gradual open/close
     swing among its users -- silently never advanced past whatever a
     caller pushed onto it. Root-caused chasing a door-open bug report
     ("the door should animate in six to eight small steps over a few
     seconds, it doesn't"): the door's own open trigger (FUN_0007c708)
     already queues a correct, gradual animation via schedule_door_open_animation, and
     that queue entry sat there forever, un-ticked, until an unrelated
     instant-snap fallback elsewhere silently finished the door in one
     step instead. Initialize alongside this function's other one-time
     gameplay-enable flags, matching g_npc_tick_enabled's own established
     fix immediately above. */
  DAT_000879ac = 1;
  reset_player_object_record();
  iVar1 = (*g_player_object & 0x3f) * 0x30;
  DAT_0023be74 = &DAT_001007d0 + iVar1;
  g_player_object[8] = (&g_monster_max_stats_table)[iVar1];
  if (DAT_00201c74 == 0) {
    DAT_00201c74 = register_interned_string(DAT_00086df8,0x7d);
  }
  register_key_binding(0x3f,0xe,1,move_command_dispatch);
  register_key_binding(0x8d,5,1,move_command_dispatch);
  register_key_binding(0x8f,3,1,move_command_dispatch);
  register_key_binding(0x91,4,1,move_command_dispatch);
  register_key_binding(0x3f,0xe,1,move_command_dispatch);
  register_key_binding(0x8d,5,1,move_command_dispatch);
  register_key_binding(0x8f,3,1,move_command_dispatch);
  register_key_binding(0x91,4,1,move_command_dispatch);
  /* Z / C strafe: the original registered these as raw lowercase ascii
     (0x7a 'z', 0x63 'c'), but every other letter movement key here uses
     the uppercase VK code (W=0x57 ...) and handle_keyboard_message
     upper-cases letters in command mode -- so as shipped the lowercase
     entries could never match. Use the uppercase VK codes (VK_Z 0x5a,
     VK_C 0x43) for consistency with W/S/X/A/D. */
  register_key_binding(0x5a,9,1,move_command_dispatch);
  register_key_binding(0x43,10,1,move_command_dispatch);
  /* Sidestep: the DOS "," / "." strafe keys. decode_movement_command
     already turns input codes 0x2c / 0x2e into g_movement_mode 9 / 10
     (resolve_move_vector cases 9/10 = move at heading -/+ 90 degrees, facing
     unchanged), but nothing routed those codes here -- move_command_dispatch
     with arg 9/10 just re-runs decode_movement_command and returns. The
     gx_stub Z/C keyboard poll feeds 0x2c / 0x2e. */
  register_key_binding(0x2c,9,1,move_command_dispatch);
  register_key_binding(0x2e,10,1,move_command_dispatch);
  register_key_binding(0x93,8,1,move_command_dispatch);
  register_key_binding(0x6c,0xc,0x1b,move_command_dispatch);
  register_key_binding(0x6b,0xd,0x1b,move_command_dispatch);
  register_key_binding(0x41,0xffffffff,1,move_key_directional_step);
  register_key_binding(0x44,1,1,move_key_directional_step);
  register_key_binding(0x53,0,1,move_key_directional_step);
  register_key_binding(0x58,0xfffffffe,1,move_key_directional_step);
  register_key_binding(0x57,2,1,move_key_directional_step);
  register_click_region(0x6b,0xa7,0x7b,0x99,0xffff,1,move_key_directional_step);
  register_click_region(0x82,0xa9,0x92,0x9c,0,1,move_key_directional_step);
  register_click_region(0x9b,0xa7,0xaa,0x99,1,1,move_key_directional_step);
  register_key_binding(0x33,1,0x11,&debug_adjust_view_heading);
  register_key_binding(0x31,0xffffffff,0x11,&debug_adjust_view_heading);
  register_key_binding(0x32,0,0x11,&debug_adjust_view_heading);
  register_key_binding(0x6a,7,0x1b,move_command_dispatch);
  register_key_binding(0x4a,6,0x1b,move_command_dispatch);
  register_key_binding(0x86,0,0x1b,toggle_stats_panel);
  register_key_binding(0x89,0,0x1b,&debug_force_rest_action);
  register_key_binding(0x88,2,0x1b,&print_debug_stat_message);
  register_key_binding(0x87,1,0x1b,handle_cast_spell_click);
  register_key_binding(0x173,0x173,1,open_pause_menu_via_hotkey);
  register_key_binding(0x172,0x172,1,open_pause_menu_via_hotkey);
  register_key_binding(0x16d,0x16d,1,open_pause_menu_via_hotkey);
  register_key_binding(0x166,0x166,1,open_pause_menu_via_hotkey);
  register_key_binding(0x164,0x164,1,open_pause_menu_via_hotkey);
  register_key_binding(0x171,0x171,1,open_pause_menu_via_hotkey);
  register_key_binding(0x80,5,1,cursor_mode_button_click);
  register_key_binding(0x81,4,1,cursor_mode_button_click);
  register_key_binding(0x82,3,1,cursor_mode_button_click);
  register_key_binding(0x83,2,1,cursor_mode_button_click);
  register_key_binding(0x83,2,4,cursor_mode_button_click);
  register_key_binding(0x84,1,1,cursor_mode_button_click);
  register_key_binding(0x85,0,1,cursor_mode_button_click);
  register_key_binding(0x70,9,1,tick_weapon_swing_state);
  register_key_binding(0x2e,3,1,tick_weapon_swing_state);
  register_key_binding(0x3b,6,1,tick_weapon_swing_state);
  register_key_binding(0x4a3,0x4a3,7,noop_key_handler);
  register_key_binding(9,9,7,noop_key_handler);
  register_key_binding(0x8d,0x8d,7,noop_key_handler);
  register_key_binding(0x93,0x93,7,noop_key_handler);
  register_key_binding(0x8f,0x8f,7,noop_key_handler);
  register_key_binding(0x91,0x91,7,noop_key_handler);
  register_key_binding(0x8c,0x8c,7,noop_key_handler);
  register_key_binding(0x8e,0x8e,7,noop_key_handler);
  register_key_binding(0x92,0x92,7,noop_key_handler);
  register_key_binding(0x94,0x94,7,noop_key_handler);
  register_key_binding(0x95,0x95,7,noop_key_handler);
  register_key_binding(0x96,0x96,7,noop_key_handler);
  register_key_binding(0x1b,4,4,&DAT_00028bfc);
  register_key_binding(0x31,1,4,select_babl_menu_response);
  register_key_binding(0x32,2,4,select_babl_menu_response);
  register_key_binding(0x33,3,4,select_babl_menu_response);
  register_key_binding(0x34,4,4,select_babl_menu_response);
  register_click_region(0x52,0x30,0x88,10,4,4,handle_barter_npc_panel_click);
  register_click_region(0x8b,0x30,0xc1,10,4,4,handle_barter_player_panel_click);
  register_click_region(0xf,200,0x131,0xa9,0,4,select_babl_menu_response);
  register_click_region(8,0x74,0x20,0xfffffffa,0xffff,4,cursor_mode_button_click_restricted);
  register_key_binding(0x286,0,0x1b,print_help_message);
  register_key_binding(0x30,0,0x1b,print_player_position_debug);
  return;
}




// was FUN_00067950 -- formats and prints a "Lev:d X:.. Y:.. Z:.. F:.."
// style message showing the player's current level, tile position,
// and facing. Registered as the '0' key binding in
// init_gameplay_session -- a debug/cheat "show coordinates" command.
void print_player_position_debug()

{
  int iVar1;
  undefined1 auStack_2c [40];
  
  iVar1 = (int)DAT_00201c70;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 0xff;
  }
  ce_sprintf(auStack_2c,s_Lev__d____2_2u__1_1u__2_2u__1_1u_00086e08,(int)DAT_00201b68,
              (int)DAT_00204880 >> 8,(int)DAT_00204880 >> 5 & 7,((int)DAT_00204882 << 0x10) >> 0x18,
              ((int)DAT_00204882 << 0x10) >> 0x15 & 7,((int)DAT_00204884 << 0x10) >> 0x13,
              iVar1 >> 8 & 0xffff);
  message_scroll_print_wrapped(auStack_2c);
  return;
}



// was FUN_000679f4 -- prints a help/status message (string id 0x113)
// built into the DAT_00086e00 buffer, one-time-initializing a small
// counter pair (DAT_0023bd84 bit 0 guards it) the first time it's
// shown. Registered as a special key binding in init_gameplay_session.
void print_help_message()

{
  if ((DAT_0023bd84 & 1) == 0) {
    DAT_0023bd84 = DAT_0023bd84 | 1;
    DAT_00086e05 = 10;
    DAT_00086e06 = 0;
  }
  print_scroll_message_by_id(0x113);
  message_scroll_print_wrapped(&DAT_00086e00);
  return;
}



// was FUN_00067a44 -- populates the "look at" override fields
// (DAT_0023be90/be92/be94/bf00/bf02) that
// update_current_view_from_subject's DAT_0023b82c==0 branch reads:
// param_1<2 resets to the player's own live position (param_1==1 also
// applies the eye-height offset), param_1 in [2,0xff) instead resolves
// an object by slot index and copies its position/heading. Forces a
// camera resync (set_pending_update_flags) when no object is currently the view
// subject.
void set_custom_view_target(param_1)
short param_1;

{
  int iVar1;
  short sVar2;
  bool bVar3;
  
  bVar3 = param_1 == 1;
  if (param_1 < 2) {
    DAT_0023be90 = DAT_00204880;
    sVar2 = 0x4880;
    if (bVar3) {
      sVar2 = DAT_00204884;
    }
    DAT_0023be92 = DAT_00204882;
    if (bVar3) {
      DAT_0023be94 = sVar2 + 0xa4;
    }
    DAT_0023bf00 = DAT_00201c70;
    if (!bVar3) {
      DAT_0023be94 = 0x458;
      DAT_0023bf02 = 0xfc00;
    }
  }
  else if (param_1 < 0x100) {
    iVar1 = get_object_record_by_slot_index();
    DAT_0023be90 = (*(byte *)(iVar1 + 0x17) & 0xfc) * 0x40 + (*(byte *)(iVar1 + 3) & 0xe0);
    DAT_0023be92 = (*(byte *)(iVar1 + 3) & 0x1c) * 8 + (*(ushort *)(iVar1 + 0x16) & 0x3f0) * 0x10;
    DAT_0023be94 = (*(byte *)(iVar1 + 2) & 0x7f) << 3;
    DAT_0023bf00 = (*(ushort *)(iVar1 + 2) & 0xff80) << 6;
  }
  if (DAT_0023b82c == 0) {
    set_pending_update_flags(2);
  }
  return;
}




// was FUN_00067b98 -- moves the "custom view target" position
// (DAT_0023be90/be92, set up by set_custom_view_target) based on the
// live mouse cursor position relative to the game-view rect
// (DAT_0023bd80/be88 from register_game_view_interact_zones),
// rotating the view facing (DAT_0023bf00) toward the drag direction
// and clamping the position to valid map bounds. The free-camera
// counterpart to normal player movement, driven from
// handle_game_view_click_hold when DAT_002020d8 (free-camera mode) is
// set.
void move_custom_view_target()

{
  short *psVar1;
  short sVar2;
  uint uVar3;
  int iVar4;
  undefined1 local_14;
  char cStack_13;
  undefined1 local_12;
  char cStack_11;
  
  psVar1 = DAT_00085a6c;
  sVar2 = ordint_divmod((int)DAT_0023be88,DAT_00085a6c[1] * 3).quot;
  uVar3 = ordint_divmod((int)DAT_0023bd80,*psVar1 * 3).quot;
  iVar4 = (uint)DAT_0023bf00 + ((uVar3 & 0xffff) + 0x3f) * 0x400;
  DAT_0023bf00 = (ushort)iVar4;
  if (sVar2 != 1) {
    angle_to_screen_delta(iVar4,&local_14,&local_12);
    DAT_0023be90 = (short)cStack_13 * (sVar2 + -1) + DAT_0023be90;
    DAT_0023be92 = (short)cStack_11 * (sVar2 + -1) + DAT_0023be92;
  }
  if (DAT_0023be90 < 0x180) {
    DAT_0023be90 = 0x180;
  }
  if (0x3d80 < DAT_0023be90) {
    DAT_0023be90 = 0x3d80;
  }
  if (DAT_0023be92 < 0x180) {
    DAT_0023be92 = 0x180;
  }
  if (0x3d80 < DAT_0023be92) {
    DAT_0023be92 = 0x3d80;
  }
  if (DAT_0023b82c == 0) {
    set_pending_update_flags(2);
  }
  return;
}



// was FUN_00067d10 -- sets DAT_0023b82c, the object the camera
// currently tracks (read by update_current_view_from_subject and many
// others), by opcode: -1 clears it (free-camera mode), 0 selects
// whatever object is under the cursor (gated on DAT_000db500, a
// spectate-enable flag), 1 resets to the player, 2/3 step to the
// next/previous mobile-object slot (cycling through NPCs). A
// debug/spectator-mode view-subject switcher.
void set_view_subject_by_command(param_1)
short param_1;

{
  int iVar1;
  short sVar2;
  
  if (param_1 == -1) {
    DAT_0023b82c = 0;
    return;
  }
  if (param_1 == 0) {
    if (DAT_000db500 == 0) {
      return;
    }
    sVar2 = encode_object_slot_index();
    iVar1 = (int)sVar2;
    if (iVar1 == 0) {
      return;
    }
    if (0xff < iVar1) {
      return;
    }
    if (iVar1 < 2) {
      return;
    }
    DAT_0023b82c = iVar1 * 0x1b + DAT_002046b8;
  }
  else if (param_1 == 1) {
    if (DAT_0023b82c == g_player_object) {
      return;
    }
    DAT_0023b82c = g_player_object;
  }
  else {
    if (param_1 != 2) {
      if (param_1 != 3) {
        return;
      }
      if (DAT_002046b8 - 0x1b <= DAT_0023b82c) {
        DAT_0023b82c = DAT_002046b8 - 0x36;
        set_pending_update_flags(2);
      }
    }
    if (DAT_0023b82c < DAT_002046b8) {
      return;
    }
    DAT_0023b82c = DAT_002046b8 - 0x1b;
  }
  set_pending_update_flags(2);
  return;
}



// was FUN_00067e2c -- enters free-camera mode: resets the custom view
// target to the player's own position, then clears the view subject
// (set_view_subject_by_command(-1)) so move_custom_view_target starts
// driving the camera instead of normal player movement.
//
// BUG FIX: set_custom_view_target was called with zero visible
// arguments despite taking one (same dropped-argument bug class
// documented throughout this project) -- 0 is the "reset to player
// position" case per its own switch, matching this function's own
// role, so pass it explicitly rather than relying on leftover
// register state.
void enter_free_camera_mode()

{
  set_custom_view_target(0);
  set_view_subject_by_command(0xffffffff);
  return;
}



// was FUN_00067e40 -- directly sets the custom view target's full
// state (position/facing) from an object record (param_1) with
// explicit x/y overrides (param_2/param_3), resets a couple of
// tracked deltas, forces a camera resync, briefly clears then
// restores an unrelated toggle (DAT_00086b20) around play_view_restore_transition,
// and refreshes equipment effects. Purpose consistent with restoring
// a saved/teleported viewpoint; exact caller context not traced.
void restore_view_from_object_record(param_1,param_2,param_3)
int param_1;
short param_2;
short param_3;

{
  int iVar1;
  
  DAT_0023be90 = (*(byte *)(param_1 + 3) & 0xe0) + param_2 * 0x100;
  DAT_0023be92 = (*(byte *)(param_1 + 3) & 0x1c) * 8 + param_3 * 0x100;
  DAT_0023be94 = (*(byte *)(param_1 + 2) & 0x7f) << 3;
  DAT_0023bf00 = (*(ushort *)(param_1 + 2) & 0xff80) << 6;
  DAT_0023bf02 = 0;
  DAT_0023bf04 = 0;
  load_shading_level_config(6);
  iVar1 = DAT_00086b20;
  if (DAT_00086b20 != 0) {
    DAT_00086b20 = 0;
  }
  play_view_restore_transition();
  if (iVar1 != 0) {
    DAT_00086b20 = 1;
  }
  refresh_player_equipment_effects();
  return;
}



// was spin_view_full_rotation -- spins the view through a full rotation over 64
// substeps (DAT_0023bea4, a rotation-like value, accumulates by a
// fixed 0xccb step each call), redrawing via render_dungeon_frame_timed
// every substep. Its only current call site (FUN_00067dc4-area, ~line
// 60497) is a rare one-shot scripted event, not ordinary player
// turning -- which also makes render_dungeon_frame_timed (and, in
// turn, weapon_swing_draw_tick, the only thing that actually draws the
// weapon-swing overlay) unreachable from normal per-tick gameplay:
// walking/turning redraws via dungeon_view_anim_tick -> full_dungeon_redraw,
// which never calls either. Called with an unused `0xffffffff`
// argument this K&R declaration doesn't accept -- harmless (K&R
// ignores extra args) but not yet understood; flagging rather than
// guessing.
void spin_view_full_rotation()

{
  int iVar1;
  ushort uVar2;
  short sVar3;
  short sVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  
  DAT_0023beb0 = 0x20;
  DAT_0023beac = 0x20;
  set_view_subject_by_command(3);
  iVar6 = (uint)DAT_0023beac * 0x100 - (int)DAT_00204880;
  iVar7 = (uint)DAT_0023beb0 * 0x100 - (int)DAT_00204882;
  uVar5 = integer_sqrt(iVar7 * iVar7 + iVar6 * iVar6);
  uVar5 = (uVar5 & 0xffff) >> 6;
  DAT_0023bea0 = (undefined2)uVar5;
  iVar1 = uVar5 << 6;
  sVar3 = ordint_divmod(iVar1,iVar6 * 0x8000).quot;
  sVar4 = ordint_divmod(iVar1,iVar7 * 0x8000).quot;
  DAT_0023bea4 = compute_angle_from_slope((int)sVar4,(int)sVar3);
  DAT_0023bf08 = 0;
  do {
    render_dungeon_frame_timed();
    DAT_0023bea4 = DAT_0023bea4 + 0xccb;
    sVar3 = DAT_0023bf08 + 1;
    uVar2 = DAT_0023bf08 + 1;
    DAT_0023bf08 = sVar3;
  } while (uVar2 < 0x40);
  set_view_subject_by_command(1);
  return;
}



// was FUN_00068260 -- the "3D-viewport's own click-and-hold-to-walk
// region" handler (per input.c's own comment), called from
// handle_game_view_click while a button is held: drives ordinary player
// movement (move_command_dispatch) normally, or
// move_custom_view_target when free-camera mode (DAT_002020d8) is
// active.
void handle_game_view_click_hold()

{
  if (DAT_002020d8 == 0) {
    move_command_dispatch(0xffffffff);
    if (DAT_0023bf0c == '\0') {
      set_cursor_confine_rect((int)DAT_0023be5c,(int)DAT_0023be80,(int)DAT_0023bd80 + (int)DAT_0023be5c + -1,
                   ((int)DAT_0023be80 - (int)DAT_0023be88) + 1);
    }
    DAT_0023bf0c = '\x02';
  }
  else {
    move_custom_view_target(0);
  }
  return;
}




// was FUN_0006a0c8 -- postprocess callback for the main menu's "opbtn"
// (OPBTN.GR) resource load -- populates DAT_0023bf6c's per-button
// record table (bitmap pointer via g_menu_button_bitmaps, plus
// width/height) as each button-state bitmap finishes loading.
bool populate_menu_button_bitmap_entry(param_1,param_2,param_3)
char *param_1;
int param_2;
short param_3;

{
  uint uVar1;
  int iVar3;
  int bmp_idx;

  uVar1 = (int)param_3 & 1;
  iVar3 = (int)param_3 >> 1;
  bmp_idx = uVar1 + iVar3 * 4;
  if ((uint)bmp_idx < sizeof(g_menu_button_bitmaps) / sizeof(g_menu_button_bitmaps[0])) {
    g_menu_button_bitmaps[bmp_idx] = param_1 + 5;
  }
  if ((short)uVar1 == 0) {
    char *rec = DAT_0023bf6c + iVar3 * 0x10;
    rec[0xc] = param_1[1];
    rec[0xd] = 0;
    rec[0xe] = param_1[2];
    rec[0xf] = 0;
  }
  return param_2 != 0;
}







// was FUN_0006a168 -- throttled (14ms via DAT_0023bf74 vs
// read_realtime_clock_units) palette-cycle animation for the main menu's
// title/copyright gold gradient.
void animate_title_palette_cycle()

{
  uint uVar1;
  
  uVar1 = read_realtime_clock_units();
  if (0xd < (int)((uVar1 & 0xffff) - (uint)DAT_0023bf74)) {
    palette_cycle_range(0x40,0x40,1);
    reinstall_active_palette(0x40,0x40,0);
    /* Palette-cycle animation on the menu's "Ultima Underworld" title (and
       the copyright line): palette_cycle_range rotates PALS entries
       0x40..0x7f -- the gold gradient ramp -- and reinstall_active_palette
       rebuilds g_palette_rgb565. On the original 8bpp target the hardware
       palette swap animated the screen for free; this port draws straight
       to RGB565, so the already-composited pixels have to be recoloured
       here. Re-blit exactly the pixels whose OPSCR source index is in the
       cycled range (0x40..0x7f) -- that hits the title/copyright and never
       the menu buttons (drawn on top, over non-gold stone). */
    if (DAT_0023bf70 != (char *)0x0) {
      unsigned char *_src = (unsigned char *)DAT_0023bf70;
      unsigned short *_dst = (unsigned short *)g_uw_framebuffer;
      unsigned short *_lut = &g_palette_rgb565;
      int _i;
      for (_i = 0; _i < 0x140 * 200; _i++) {
        unsigned char _ix = _src[_i];
        if ((_ix & 0xc0) == 0x40) _dst[_i] = _lut[_ix];
      }
      dirty_rect_union(0,200,0,0x140); /* recoloured pixels span the screen -- make sure the flush below carries them */
    }
    DAT_0023bf74 = read_realtime_clock_units();
  }
  flush_dirty_rect_to_display(1);
  return;
}



// was FUN_0006a1c4 -- if param_1 is set, probes the save-slot archives via
// probe_save_slots and, when no valid save slot exists, calls
// display_book_or_scroll_page(0) to disable/grey out the "Journey Onward" main-menu
// option.
void update_journey_onward_availability(param_1)
short param_1;

{
  short local_ac [4];
  undefined1 auStack_a4 [160];

  if ((param_1 != 0) && (probe_save_slots(auStack_a4,local_ac), local_ac[0] == 0)) {
    display_book_or_scroll_page(0);
  }
  return;
}






// was FUN_0006a200. Draws one frame of a menu_button_list_navigate
// list: param_3==0 blits pre-rendered bitmap buttons (the title screen's
// Introduction/Create Character/.../Journey Onward), param_3!=0 draws
// plain text items (e.g. journey_onward_load_slot_menu's save-slot
// descriptions), highlighting whichever index equals param_4.
void draw_menu_item_list(param_1,param_2,param_3,param_4)
short param_1;
char *param_2;
char param_3;
short param_4;

{
  short sVar1;
  int iVar2;
  /* pcVar_rec: dedicated pointer for the param_3=='\0' branch's 0x10-stride
     rect-record array (param_2 was `int`, truncating the pointer). */
  char *pcVar_rec;
  undefined1 uVar3;
  int iVar4;
  /* ppcVar5/pcVar_str: the param_3!=0 branch indexes param_2 as an array
     of char* string pointers. Ghidra saw this as `int *piVar5` with a
     4-byte stride (`param_2 + iVar4 * 4`) and reused the dereferenced
     value (`iVar2`/`iVar6`, both plain `int`) to hold the string pointer
     itself -- correct on the original 32-bit binary where a pointer IS
     4 bytes, but truncating here on 64-bit. Widened to a real char**
     with 8-byte stride (see local_1d0 in journey_onward_load_slot_menu, the only
     populator of this array) and a dedicated pointer variable for the
     string-pointer role; iVar2 keeps its separate int (strlen/measurement)
     role below. */
  char **ppcVar5;
  char *pcVar_str;

  if (param_3 == '\0') {
    decrement_cursor_hide_depth();
    if (0 < param_1) {
      iVar4 = 0;
      do {
        pcVar_rec = param_2 + iVar4 * 0x10;
        /* Was reading the bitmap pointer back out of param_2's packed
           4-byte record slot -- see g_menu_button_bitmaps' declaration
           comment for why that's now routed through a dedicated array
           instead (the packed slot only ever held a truncated 32-bit
           pointer fragment on this host, not a real one). */
        int bmp_idx = (uint)(iVar4 == param_4) + iVar4 * 4;
        bitmap_blit_to_framebuffer((int)*(short *)(pcVar_rec + 8),(int)*(short *)(pcVar_rec + 10),
                     (uint)bmp_idx < sizeof(g_menu_button_bitmaps) / sizeof(g_menu_button_bitmaps[0])
                       ? g_menu_button_bitmaps[bmp_idx] : 0,
                     (int)*(short *)(pcVar_rec + 0xe),*(undefined2 *)(pcVar_rec + 0xc),0,0,1);
        iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      } while (iVar4 < param_1);
    }
  }
  else {
    decrement_cursor_hide_depth();
    iVar4 = 0;
    /* draw_text_string only honours *g_draw_color_index (the palette index this
       loop sets to 0xa2/0xaa to highlight the selected item) when
       g_text_use_palette_color is nonzero; otherwise it falls back to the flat
       g_text_flat_color color, which nothing in the whole decompile ever
       writes (silently 0/black) -- fine as a default ink color for
       message-scroll text on its light parchment background, but
       invisible against this screen's dark title-art backdrop. Force
       the palette-indexed path for the duration of this draw, matching
       what setting *g_draw_color_index here clearly intends. */
    int _saved_af74 = g_text_use_palette_color;
    g_text_use_palette_color = 1;
    if (0 < param_1) {
      do {
        uVar3 = 0xa2;
        if (iVar4 != param_4) {
          uVar3 = 0xaa;
        }
        *g_draw_color_index = uVar3;
        *DAT_00084298 = uVar3;
        ppcVar5 = (char **)(param_2 + iVar4 * 8);
        pcVar_str = *ppcVar5;
        if (getenv("UW_DEBUG_TITLEMENU"))
          fprintf(stderr, "[titlemenu] draw_menu_item_list text branch: item=%d/%d ptr=%p str='%s'\n",
                  iVar4, (int)param_1, (void *)pcVar_str, pcVar_str ? pcVar_str : "(null)");
        while (sVar1 = measure_text_width(pcVar_str), 0x13e < sVar1) {
          pcVar_str = *ppcVar5;
          iVar2 = ce_strlen(pcVar_str);
          pcVar_str[iVar2 - 1] = 0;
          pcVar_str = *ppcVar5;
        }
        iVar2 = (int)sVar1;
        if (iVar2 < 0) {
          iVar2 = iVar2 + 1;
        }
        draw_text_string(*ppcVar5,0xa0 - (short)(iVar2 >> 1),iVar4 * 0x16 + 100);
        iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      } while (iVar4 < param_1);
    }
    g_text_use_palette_color = _saved_af74;
  }
  cursor_show_idle_tick();
  return;
}






// was poll_menu_pointer_selection -- pointer/touch-driven hit-test loop for a menu
// item list (param_3=='\0': bitmap buttons; param_3!=0: text items,
// e.g. the save-slot list): while pointer events remain queued, polls
// the current pointer position (get_mouse_position) and tests it against
// each item's hit rect (bitmap mode: the packed 0x10-stride rect
// record; text mode: the item's measured text extent), redrawing via
// draw_menu_item_list whenever the hovered item changes. Also drives
// the title palette cycle animation each iteration so the gold
// gradient keeps shimmering while the pointer is held down. Returns
// the last-hit item's index while the pointer is still over an item;
// once it moves off after having hit one, returns that index offset
// by param_1 instead (its caller, menu_button_list_navigate, decodes
// this by comparing against/subtracting param_1).
int poll_menu_pointer_selection(param_1,param_2,param_3)
undefined4 param_1;
char *param_2;
char param_3;

{
  int iVar1;
  bool bVar2;
  bool bVar3;
  short sVar4;
  short sVar5;
  /* iVar6 doubles as a byte-offset pointer into param_2 (0x10-stride
     rect records, param_3=='\0' branch) and a plain int scratch value
     (distance/threshold math, param_3!=0 branch) -- mutually exclusive,
     but iVar6 stayed `int` either way, truncating the pointer now that
     param_2 is a real 64-bit pointer. Given its own dedicated variable
     for the record-pointer role only. */
  char *pcVar_rec;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  short local_30;
  short local_2e;

  iVar9 = -1;
  bVar3 = true;
  bVar2 = true;
  sVar5 = (short)param_1;
  if (param_3 == '\0') {
    sVar4 = next_input_event();
    if (0 < sVar4) {
      iVar1 = (int)sVar5;
      bVar2 = bVar3;
      do {
        animate_title_palette_cycle();
        get_mouse_position(&local_30,&local_2e);
        iVar8 = 0;
        if (0 < iVar1) {
          do {
            pcVar_rec = param_2 + iVar8 * 0x10;
            if (((int)*(short *)(pcVar_rec + 8) <= (int)local_30) &&
               ((int)local_30 <= (int)*(short *)(pcVar_rec + 8) + (int)*(short *)(pcVar_rec + 0xc) + -1)) {
              if (((int)local_2e <= (int)*(short *)(pcVar_rec + 10) + (int)*(short *)(pcVar_rec + 0xe) + -1)
                 && ((int)*(short *)(pcVar_rec + 10) <= (int)local_2e)) {
                bVar2 = true;
                if ((short)iVar8 != (short)iVar9) {
                  draw_menu_item_list(param_1,param_2,0,iVar8);
                  iVar9 = iVar8;
                }
                break;
              }
            }
            iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
          } while (iVar8 < iVar1);
        }
        if (((short)iVar8 == iVar1) && (bVar2 = true, (short)iVar9 != -1)) {
          bVar2 = false;
        }
        sVar4 = next_input_event();
      } while (0 < sVar4);
    }
  }
  else {
    select_active_font(s_fontbig_sys_0008432c);
    sVar4 = next_input_event();
    bVar2 = bVar3;
    if (0 < sVar4) {
      iVar1 = (int)sVar5;
      do {
        animate_title_palette_cycle();
        get_mouse_position(&local_30,&local_2e);
        iVar8 = 0;
        if (0 < iVar1) {
          iVar8 = 0;
          do {
            sVar4 = measure_text_width(*(char **)(param_2 + iVar8 * 8));
            iVar6 = -(int)sVar4;
            iVar7 = iVar6 + 0x140;
            if (iVar7 < 0) {
              iVar7 = iVar6 + 0x141;
            }
            iVar6 = (int)(short)(iVar7 >> 1);
            if ((iVar6 <= local_30) && ((int)local_30 < iVar6 + sVar4)) {
              iVar6 = (iVar8 * 0x16 + 100) * 0x10000 >> 0x10;
              if ((iVar6 <= local_2e) && ((int)local_2e < iVar6 + *(short *)(DAT_000879b0 + 6))) {
                bVar2 = true;
                if ((short)iVar8 != (short)iVar9) {
                  draw_menu_item_list(param_1,param_2,param_3,iVar8);
                  iVar9 = iVar8;
                }
                break;
              }
            }
            iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
          } while (iVar8 < iVar1);
        }
        if (((short)iVar8 == iVar1) && (bVar2 = true, (short)iVar9 != -1)) {
          bVar2 = false;
        }
        sVar4 = next_input_event();
      } while (0 < sVar4);
    }
    select_active_font(s_FONT5X6P_SYS_00084e9c);
  }
  if (bVar2) {
    sVar5 = 0;
  }
  return iVar9 + sVar5;
}



// was FUN_0006af3c
int menu_button_list_navigate(param_1,param_2,param_3,param_4)
int param_1;
char *param_2;
undefined1 param_3;
int param_4;

{
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  bool bVar6;
  
  iVar4 = -2;
  do {
    select_active_font(s_fontbig_sys_0008432c);
    draw_menu_item_list(param_1,param_2,param_3,param_4);
    select_active_font(s_font5x6p_sys_0008430c);
    /* Was: `ushort _cyc_t = DAT_0023bf74; ... if (DAT_0023bf74 != _cyc_t)
       draw_menu_item_list(...)` -- an earlier session's own addition
       (its comment claimed it was needed for the menu-item bitmaps to
       shimmer in step with animate_title_palette_cycle's gold-gradient palette
       rotation), not real recovered code: confirmed via a fresh ARM
       disassembly of this function (0x6af3c) that the real idle-wait
       loop here is exactly `bl advance_menu_music_track; bl animate_title_palette_cycle;`, nothing
       else -- no DAT_0023bf74 comparison, no second draw_menu_item_list
       call. That fabricated redraw ran with the small font selected
       (the line right above switches to it before this loop, which IS
       real/matches disassembly) while the ORIGINAL list draw two lines
       up used the big font and is never erased first -- so every
       palette-cycle tick redrew each list label a second time, in the
       wrong small font, directly on top of the correct big-font text.
       Confirmed live: the title-screen save-slot list showed each
       description doubled, once correctly in the large font and once
       overlaid in the small one. Removed. */
    while (sVar2 = next_input_event(), sVar2 < 0) {
      advance_menu_music_track();
      animate_title_palette_cycle();
    }
    if (getenv("UW_DEBUG_TITLEMENU")) fprintf(stderr, "[titlemenu] menu_button_list_navigate: raw event=0x%x param_4=%d\n", (int)sVar2, (int)param_4);
    sVar1 = (short)param_1;
    iVar3 = param_4;
    iVar5 = iVar4;
    if (0xa7 < sVar2) {
      if (sVar2 < 0x167) {
        if (sVar2 != 0x166) {
          if (sVar2 == 0xa8) {
LAB_0006b0e4:
            iVar3 = param_4 + -1;
            iVar5 = iVar4;
            goto LAB_0006b144;
          }
          if (sVar2 != 0xa9) {
            if (sVar2 != 0xaa) {
              if (sVar2 == 0xab) goto LAB_0006b140;
              if (sVar2 != 0xac) {
                bVar6 = sVar2 == 0x162;
                goto LAB_0006b0e0;
              }
            }
            goto LAB_0006b138;
          }
        }
      }
      else if (sVar2 != 0x16e) {
        if (sVar2 == 0x170) goto LAB_0006b0e4;
        if (sVar2 != 0x23c) {
          if (sVar2 != 0x23e) {
            if (sVar2 == 0x278) {
LAB_0006b130:
              iVar5 = -1;
            }
            goto LAB_0006b144;
          }
          goto LAB_0006b138;
        }
        goto LAB_0006b000;
      }
      goto LAB_0006b140;
    }
    if (sVar2 == 0xa7) {
LAB_0006b000:
      iVar3 = 0;
      iVar5 = iVar4;
    }
    else if (sVar2 < 0x90) {
      if (sVar2 == 0x8f) goto LAB_0006b0e4;
      if (0 < sVar2) {
        if (sVar2 < 4) {
          iVar3 = poll_menu_pointer_selection(param_1,param_2,param_3);
          sVar2 = (short)iVar3;
          if ((((sVar2 < 0) || (sVar1 <= sVar2)) || (iVar5 = iVar3, sVar2 == (short)iVar4)) &&
             (iVar3 = param_4, iVar5 = iVar4, sVar1 <= sVar2)) {
            iVar3 = (int)sVar2 - (int)sVar1;
          }
        }
        else {
          iVar5 = param_4;
          if (sVar2 != 0xd) {
            if (sVar2 == 0x1b) goto LAB_0006b130;
            if (sVar2 != 0x8c) {
              if (sVar2 == 0x8d) goto LAB_0006b0e4;
              iVar5 = iVar4;
              if (sVar2 != 0x8e) goto LAB_0006b144;
            }
            goto LAB_0006b000;
          }
        }
      }
    }
    else if (sVar2 == 0x91) {
LAB_0006b140:
      iVar3 = param_4 + 1;
    }
    else {
      if (sVar2 != 0x92) {
        if (sVar2 == 0x93) goto LAB_0006b140;
        if (sVar2 != 0x94) {
          if (sVar2 != 0xa5) {
            bVar6 = sVar2 == 0xa6;
LAB_0006b0e0:
            if (!bVar6) goto LAB_0006b144;
            goto LAB_0006b0e4;
          }
          goto LAB_0006b000;
        }
      }
LAB_0006b138:
      iVar3 = param_1 + -1;
    }
LAB_0006b144:
    if ((short)iVar3 < 0) {
      iVar3 = 0;
    }
    else if (sVar1 <= (short)iVar3) {
      iVar3 = param_1 + -1;
    }
    param_4 = iVar3;
    iVar4 = iVar5;
    if (-2 < (short)iVar5) {
      return iVar5;
    }
  } while( true );
}





// was FUN_000773ac -- called from app_main_loop (src/game.c, WinMain's
// real body) right before create_main_window_and_init_display below.
// Builds a WinCE thread-creation parameter block (local_34=3, a
// creation-flags constant; local_30=dispatch_window_message, the thread's start
// routine -- a window-message-id dispatch table lookup, not yet
// named; local_24=param_1, the app instance handle, as the thread
// arg; local_18=GetStockObject(0), likely the calling thread's id;
// local_10=param_2) and passes it to RegisterClassW (likely CreateThread).
// This WinCE-era windowing/threading plumbing is very likely inert on
// this SDL-based host port, but kept faithful to the original flow.
void spawn_message_dispatch_thread(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  undefined4 local_34;
  code *local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  
  local_34 = 3;
  local_2c = 0;
  local_30 = dispatch_window_message;
  local_28 = 0;
  local_20 = 0;
  local_1c = 0;
  local_24 = param_1;
  local_18 = GetStockObject(0);
  local_14 = 0;
  local_10 = param_2;
  RegisterClassW(&local_34);
  return;
}



// was FUN_00077408 -- creates the main app window (CreateWindowExW, a
// CreateWindowEx-style call) and, if that and the registration check
// (is_product_registered) both succeed, reads 3 install-directory
// registry values (falling back to hardcoded "Program Files\ZIO
// Interactive\..." paths if the registry read fails), shows/updates
// the window, then opens the WinCE GAPI display (GXOpenDisplay) and,
// on an HP Jornada 540, copies the GX display properties and default
// key mappings into global buffers for later use. Returns 1 on full
// success (window + registration + GX display all opened), 0
// otherwise. Called from app_main_loop (src/game.c, WinMain's real
// body) right after spawn_message_dispatch_thread above.
undefined4 create_main_window_and_init_display(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  bool bVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  undefined1 *puVar5;
  undefined *puVar6;
  int iVar7;
  undefined1 *puVar8;
  char *pcVar9;
  char *pcVar10;
  undefined4 local_7d8;
  undefined4 local_7d4;
  undefined4 local_7d0;
  undefined4 local_7c8;
  undefined4 local_7c4;
  undefined4 local_7c0;
  undefined4 local_7bc;
  undefined4 local_7b8 [2];
  undefined1 auStack_7b0 [24];
  undefined1 auStack_798 [96];
  undefined1 auStack_738 [256];
  undefined1 auStack_638 [520];
  undefined1 auStack_430 [520];
  undefined1 auStack_228 [520];
  
  GetSystemMetrics(1);
  GetSystemMetrics(0);
  DAT_0023c548 = (HWND__ *)
                 CreateWindowExW(0,u_UltimaUW_00087678,u_Ultima_Under_World_00087690,0x10000000);
  if ((DAT_0023c548 != (HWND__ *)0x0) && (iVar3 = is_product_registered(DAT_0023c548,param_1), iVar3 != 0)) {
    pcVar9 = &DAT_0023cca8;
    ce_memset(&DAT_0023cca8,0,0x104);
    pcVar10 = &DAT_0023c698;
    ce_memset(&DAT_0023c698,0,0x104);
    local_7c4 = 1;
    local_7c0 = 0x208;
    ce_memset(auStack_638,0,0x208);
    iVar3 = RegOpenKeyExW(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_0008784c,0,0);
    if (iVar3 == 0) {
      RegQueryValueExW(local_7d4,u_InstlDir_00087838,0,&local_7c4);
      pcVar4 = (char *)load_string_resource_large(auStack_638);
      do {
        cVar2 = *pcVar4;
        pcVar4 = pcVar4 + 1;
        *pcVar9 = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
      RegCloseKey(local_7d4);
    }
    else {
      pcVar9 = s__Program_Files_ZIO_Interactive_U_00087804;
      do {
        cVar2 = *pcVar9;
        pcVar9[0x1b54a4] = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
    }
    local_7c8 = 1;
    local_7bc = 0x208;
    ce_memset(auStack_430,0,0x208);
    iVar3 = RegOpenKeyExW(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_000877a4,0,0);
    if (iVar3 == 0) {
      RegQueryValueExW(local_7d8,u_InstlDir_00087838,0,&local_7c8);
      pcVar9 = (char *)load_string_resource_large(auStack_430);
      do {
        cVar2 = *pcVar9;
        pcVar9 = pcVar9 + 1;
        *pcVar10 = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
      RegCloseKey(local_7d8);
    }
    else {
      pcVar10 = s__Program_Files_ZIO_Interactive_U_00087774;
      do {
        cVar2 = *pcVar10;
        pcVar10[0x1b4f24] = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
    }
    local_7b8[0] = 1;
    ce_memset(auStack_228,0,0x208);
    iVar3 = RegOpenKeyExW(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_0008771c,0,0);
    if (iVar3 == 0) {
      RegQueryValueExW(local_7d0,u_InstlDir_00087838,0,local_7b8);
      pcVar10 = (char *)load_string_resource_large(auStack_228);
      pcVar9 = &DAT_00241f08;
      do {
        cVar2 = *pcVar10;
        pcVar10 = pcVar10 + 1;
        *pcVar9 = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
      RegCloseKey(local_7d0);
    }
    else {
      pcVar10 = s__Program_Files_ZIO_Interactive_U_000876ec;
      do {
        cVar2 = *pcVar10;
        pcVar10[0x1ba81c] = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
    }
    ShowWindow(DAT_0023c548,param_2);
    UpdateWindow(DAT_0023c548);
    iVar3 = GXOpenDisplay(DAT_0023c548,1);
    if (iVar3 != 0) {
      SystemParametersInfoW(0x102,0x100,auStack_738,0);
      iVar3 = _wcsicmp(auStack_738,u_HP_Jornada_540_000876cc);
      if (iVar3 != 0) {
        GXOpenInput();
        puVar5 = (undefined1 *)GXGetDisplayProperties();
        iVar3 = 0x18;
        puVar8 = auStack_7b0;
        do {
          iVar7 = iVar3 + -1;
          *puVar8 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar5 = &DAT_0023cdb0;
        iVar3 = 0x18;
        puVar8 = auStack_7b0;
        do {
          iVar7 = iVar3 + -1;
          *puVar5 = *puVar8;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar5 = (undefined1 *)GXGetDefaultKeys(auStack_798);
        iVar3 = 0x60;
        puVar8 = auStack_798;
        do {
          iVar7 = iVar3 + -1;
          *puVar8 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar6 = &DAT_0023ce10;
        iVar3 = 0x60;
        puVar5 = auStack_798;
        do {
          iVar7 = iVar3 + -1;
          *puVar6 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar6 = puVar6 + 1;
          iVar3 = iVar7;
          puVar5 = puVar5 + 1;
        } while (iVar7 != 0 && bVar1);
      }
      return 1;
    }
  }
  return 0;
}





// was FUN_00077860 -- trivial passthrough, returns param_2 unchanged.
// Confirmed real use: app_main_loop (src/game.c) calls it at the very
// end of the message pump as a return-value wrapper around its own
// exit code, so despite the WndProc-shaped signature this specific
// call site isn't dispatching a real window message -- it's just
// reusing this identity function to pass the exit code through.
undefined4 window_message_noop_handler(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  return param_2;
}



// was FUN_00077868 -- stores &DAT_00242010 into the window's extra-
// data slot 0x94 via load_bmp_resource_to_rgb565 (a SetWindowLong-style helper --
// see its other use in create_main_window_and_init_display storing
// g_uw_framebuffer at slot 0xca). WinCE window-procedure plumbing,
// very likely inert on this SDL-based host port.
void store_window_extra_data_ptr(param_1)
undefined4 param_1;

{
  load_bmp_resource_to_rgb565(param_1,0x94,&DAT_00242010);
  return;
}



// was FUN_00077878 -- looks up window message id param_2 in a
// {msg_id, handler_ptr} table (DAT_000830b0/UNK_000830b4, 0x13
// entries, 8-byte stride) and calls the matched handler with no
// forwarded args, or falls back to DefWindowProcW (likely DefWindowProc)
// if no entry matches. This is the thread start routine
// spawn_message_dispatch_thread sets up -- WinCE window-procedure
// plumbing, very likely inert on this SDL-based host port.
void dispatch_window_message(param_1,param_2)
undefined4 param_1;
int param_2;

{
  uint uVar1;
  int *piVar2;
  
  piVar2 = (int *)&DAT_000830b0;
  uVar1 = 0;
  do {
    if (param_2 == *piVar2) {
      (**(code **)(&UNK_000830b4 + uVar1 * 8))();
      return;
    }
    uVar1 = uVar1 + 1;
    piVar2 = piVar2 + 2;
  } while (uVar1 < 0x13);
  DefWindowProcW();
  return;
}





// was FUN_00077a38 -- shutdown/cleanup routine: calls end_gx_draw_session,
// frees several conditionally-allocated resources
// (LocalFree, likely LocalFree/free) and a 0x80-entry pointer
// array (&DAT_00202308), then tears down the GAPI display/input
// (GXCloseDisplay/GXCloseInput) and calls PostQuitMessage(0) (likely
// PostQuitMessage/ExitThread). No callers found by grep -- probably
// reached only through dispatch_window_message's message-id table
// (e.g. a WM_DESTROY-style handler), which is itself unpopulated at
// runtime (see its own comment), so this is very likely dead on this
// SDL-based host port.
undefined4 shutdown_game_resources()

{
  int iVar1;
  void **piVar2;

  end_gx_draw_session();
  if (DAT_0023c44c != 0) {
    LocalFree();
  }
  if (DAT_0023cca0 != 0) {
    LocalFree();
  }
  if (DAT_000890a4 != 0) {
    LocalFree();
  }
  if (DAT_000879b0 != 0) {
    LocalFree();
  }
  if (DAT_0024af78 != 0) {
    LocalFree();
  }
  if (DAT_0024af7c != 0) {
    LocalFree();
  }
  piVar2 = &DAT_00202308;
  iVar1 = 0x80;
  do {
    if (*piVar2 != 0) {
      LocalFree();
    }
    iVar1 = iVar1 + -1;
    piVar2 = piVar2 + 1;
  } while (iVar1 != 0);
  LocalFree(&DAT_00202308);
  run_game_shutdown_sequence(0);
  GXCloseDisplay();
  GXCloseInput();
  PostQuitMessage(0);
  return 0;
}


/* was FUN_0007ea30 -- real body confirmed stripped from the shipped
   ARM code (disassembly is just `cpy pc,lr` -- an immediate return,
   ignoring whatever argument its single call site passes). Likely
   InitDebug()-equivalent from the same
   LG/SS1-heritage debug-print system debug_print belongs to; genuinely
   does nothing in this binary, so left as a no-op. */
void debug_print_init()

{
  return;
}



/* was FUN_0007ea34 -- real body confirmed stripped from the shipped
   ARM code (disassembly:
   the standard vararg prologue -- stmdb saving r0-r3 and r12/lr to the
   stack -- immediately followed by ldmia popping straight back out and
   returning, i.e. the compiler kept the calling convention but the actual
   printf-style body was compiled out, e.g. via #ifdef DEBUG). This is the
   same SS1-engine-style debug-print gateway the remaining format strings
   elsewhere in this file belong to (e.g. "checking_if_%d_and_%d_are_com-
   bin", "objsbecombinable_returns_%d", "At_%d_%d") -- there's no level
   parameter to recover since none of its ~8 call sites pass one and the
   real body never used one, so there's nothing to restore verbatim.
   Implemented here as a real vararg printer instead. Currently defaults
   to ON (UW_DEBUG_PRINT=0 to silence) while this is under active
   development, unlike the original release build which had it fully
   compiled out. */
void debug_print(char *param_1, ...)

{
  const char *diag = getenv("UW_DEBUG_PRINT");
  if ((param_1 != (char *)0x0) && (diag == (char *)0x0 || diag[0] != '0')) {
    va_list ap;
    fprintf(stderr, "[dbg] ");
    va_start(ap, param_1);
    vfprintf(stderr, param_1, ap);
    va_end(ap);
    fprintf(stderr, "\n");
  }
  return;
}





/* was FUN_0007036c. Bound to key 0x88 in mode 0x1b, arg 2 (uw.c
   ~59574, register_key_binding). DAT_00070398 and DAT_00070354 were two
   separate literal-pool constants that Ghidra headless confirms BOTH
   resolve to the exact same address (DAT_0023be64) -- so this guard is
   unconditionally true; kept as an explicit always-true branch (rather
   than silently deleting the check or writing a self-comparison that
   would trip -Wtautological-compare) since why the original had two
   loads of the same global here isn't recovered. `*DAT_0007039c` was
   another literal-pool constant (address of DAT_00086df8, the already-
   named player-stats struct pointer) -- resolved directly to that named
   global rather than left as a fresh DAT_. Prints a resolved string
   (the same "dropped register-forwarding arg" idiom already fixed ~30
   other places in this file: the bare message_scroll_print_wrapped()
   call forwards get_message_string's just-returned r0) plus a newline, except
   uVar2==0xc which instead prints a numeric stat byte from the player
   struct via cast_detect_life_spell. */
undefined4 print_debug_stat_message(param_1)
short param_1;
{
  undefined4 uVar1;
  uint uVar2;

  if (1) {
    uVar2 = ((uint)param_1 + 10) & 0xff;
    if ((uVar2 != 10) && (uVar2 != 0xb)) {
      if (uVar2 == 0xc) {
        cast_detect_life_spell(8,*(undefined1 *)(DAT_00086df8 + (int)param_1 + 0x2b));
      }
      else {
        message_scroll_print_wrapped(get_message_string((((int)(short)uVar2 + 0x1f) | 0x400)));
        message_scroll_print_wrapped(&s_scroll_newline_0008522c);
      }
    }
    uVar1 = 1;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


/* was FUN_00071ac4. Bound to key 0x89 in mode 0x1b (uw.c ~59573).
   find_equipped_item_by_category returns `ushort *`; its return was captured into a plain
   `int` in the original decompile, the same pointer-truncation bug
   class fixed ~30 other places in this file. */
void debug_force_rest_action()
{
  ushort *puVar1;
  undefined1 auStack_10 [4];

  puVar1 = find_equipped_item_by_category(4,2,1,4,(undefined2 *)auStack_10);
  handle_rest_action(puVar1 != (ushort *)0x0);
  return;
}


/* was FUN_000680d0. Bound to keys '1'/'2'/'3' (0x31/0x32/0x33) in mode
   0x11 with args -1/0/1 respectively (uw.c ~59567-59569,
   register_key_binding). Nudges a heading field by a fixed step,
   clamped to +-0x1000 (1/256-degree units), marking the view dirty
   (set_pending_update_flags(2)) whenever it actually changed. DAT_000680f4/DAT_000680f8
   were literal-pool constants resolving to DAT_0023beb4 and
   DAT_0023bf00 respectively; the original's `DAT_000680f8 + 2` was raw
   pointer arithmetic across two separately-declared globals that are
   really adjacent fields of one struct (DAT_0023bf00/DAT_0023bf02,
   already an established pair via their shared use at uw.c ~60832) --
   replaced with a direct reference to DAT_0023bf02 instead of address-
   of-plus-2 arithmetic on an unrelated global. DAT_0023bf2c (from
   DAT_000680fc) is a freshly-declared flag selecting which of the two
   fields this nudges; no other reader/writer of it exists yet in this
   file. */
short DAT_0023bf2c;
void debug_adjust_view_heading(param_1)
undefined4 param_1;
{
  short sVar1;
  short *puVar2;

  puVar2 = &DAT_0023beb4;
  if (DAT_0023bf2c != 0) {
    puVar2 = (short *)&DAT_0023bf02;
  }
  if ((short)param_1 == 0) {
    set_pending_update_flags(2);
    *puVar2 = 0;
  }
  else {
    sVar1 = 0x1000;
    if ((short)param_1 == -1) {
      sVar1 = -0x1000;
    }
    if (step_value_toward_limit(puVar2,sVar1,0x400,(short)param_1) != 0) {
      set_pending_update_flags(2);
    }
  }
  return;
}


// was FUN_000228d4 -- reads a 10-byte structure via GetSystemTime into a
// stack buffer, then multiplies 3 of its ushort fields together (each
// +1, converting a 0-based max-index into a count) and passes the
// product to ce_srand. Currently a functional no-op: both GetSystemTime
// and ce_srand are unimplemented (return-0/write-nothing) stubs in
// src/ordinal_stubs.c, so local_a/local_8/local_6 are read uninitialized
// and the computed product is discarded by its own stub callee. The
// real WinCE API these ordinals correspond to, and therefore this
// function's true purpose, is not otherwise confirmed -- named
// structurally from what the code visibly does (multiply 3
// count-like dimensions), not from a confirmed real-world meaning.
void compute_dimension_volume()

{
  undefined1 auStack_14 [10];
  ushort local_a;
  ushort local_8;
  ushort local_6;

  GetSystemTime(auStack_14);
  ce_srand((local_6 + 1) * (local_8 + 1) * (local_a + 1));
  return;
}


// was FUN_0003b820 -- the game's startup/boot sequence: starts
// ambient sound, initializes the string/level-object/input/debug
// subsystems, shows the three presentation splash screens
// (pres1.byt, pres2.byt, the copyright screen -- each with a 1.5s
// dwell), initializes the cursor subsystem, texture-id lists, and
// gameplay session, loads the collision-response profiles, a fresh
// character record, sprite-list buffers, light tables, and combat
// data, and checks available save disk space. Called once from
// src/game.c's own startup chain, right before main_menu_loop.
void run_game_startup_sequence()

{
  char stack0xffdc2d2c_buf [256];
  char *stack0xffdc2d2c_ptr;
  char stack0xffdc2e34_buf [256];
  char *stack0xffdc2e34_ptr;
  char cVar1;
  short sVar2;
  int iVar3;
  char *pcVar4;
  /* BUG FIX (unit-testing-framework merge): was `undefined4`, truncating
     load_string_resource's real pointer -- same class as that
     function's own fix. */
  char *uVar5;
  char *pcVar6;
  char acStack_62c [264];
  char acStack_524 [264];
  undefined1 auStack_41c [520];
  undefined1 auStack_214 [520];
  
  start_ambient_sound_effect(2);
  init_string_resource_cache();
  init_level_object_arena();
  input_bindings_init();
  debug_print_init();
  store_window_extra_data_ptr(DAT_0023c540);
  cache_ambient_sound_handle();
  iVar3 = select_default_hud_font();
  if (iVar3 == 0) {
    report_fatal_error_and_exit(0x3003);
  }
  DAT_0024af70 = 1;
  ce_memset(acStack_62c,0,0x104);
  pcVar6 = &DAT_0023cca8;
    stack0xffdc2e34_ptr = stack0xffdc2e34_buf;
  pcVar4 = pcVar6;
    stack0xffdc2d2c_ptr = acStack_62c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc2d2c_ptr = cVar1; stack0xffdc2d2c_ptr = stack0xffdc2d2c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_62c,s__DATA_pres1_byt_00085790);
  blit_fullscreen_bitmap_file(5,acStack_62c,1);
  Sleep(0x5dc);
  play_music_track(1,1);
  init_grtile_registry();
  ce_memset(acStack_62c,0,0x104);
  pcVar4 = pcVar6;
    stack0xffdc2d2c_ptr = acStack_62c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc2d2c_ptr = cVar1; stack0xffdc2d2c_ptr = stack0xffdc2d2c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_62c,s__DATA_pres2_byt_00085780);
  blit_fullscreen_bitmap_file(6,acStack_62c,1);
  Sleep(0x5dc);
  sVar2 = load_startup_gr_resources();
  if (sVar2 != 0) {
    report_fatal_error_and_exit();
  }
  ce_memset(acStack_62c,0,0x104);
  pcVar4 = pcVar6;
    stack0xffdc2d2c_ptr = acStack_62c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc2d2c_ptr = cVar1; stack0xffdc2d2c_ptr = stack0xffdc2d2c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_62c,s__DATA_COPYRIGHT_BYT_0008576c);
  blit_fullscreen_bitmap_file(2,acStack_62c,1);
  sVar2 = init_cursor_subsystem();
  if (sVar2 < 0) {
    report_fatal_error_and_exit(2);
  }
  sVar2 = load_object_catalog_data();
  if (sVar2 != 0) {
    report_fatal_error_and_exit();
  }
  reset_texture_id_lists();
  init_dungeon_rendering();
  init_gameplay_session();
  init_collision_response_profiles();
  init_new_character_record(0);
  init_sprite_list_buffers();
  init_main_loop_state();
  load_light_tables();
  load_combat_data_file();
  iVar3 = check_save_disk_space();
  if (iVar3 == 0) {
    report_fatal_error_message_and_exit(s_Not_enough_disk_space_for_save_g_00085744);
  }
  ce_memset(acStack_62c,0,0x104);
  pcVar4 = pcVar6;
    stack0xffdc2d2c_ptr = acStack_62c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc2d2c_ptr = cVar1; stack0xffdc2d2c_ptr = stack0xffdc2d2c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_62c,s__DATA_lev_ark_00085734);
  uVar5 = load_string_resource(acStack_62c);
  ce_wcscpy(auStack_214,uVar5);
  ce_memset(acStack_524,0,0x104);
  do {
    cVar1 = *pcVar6;
    *stack0xffdc2e34_ptr = cVar1; stack0xffdc2e34_ptr = stack0xffdc2e34_ptr + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_524,s__SAVE0_lev_ark_000842fc);
  uVar5 = load_string_resource(acStack_524);
  ce_wcscpy(auStack_41c,uVar5);
  CopyFileW(auStack_214,auStack_41c,0);
  sVar2 = seed_conversation_globals_for_new_game();
  if (sVar2 != 0) {
    report_fatal_error_and_exit();
  }
  clear_screen_and_restore_cursor();
  set_palette_bank(5);
  return;
}


// was FUN_0003baf4 -- the game's shutdown counterpart to
// run_game_startup_sequence: frees input bindings, stops ambient
// sound and other sound effects/music, releases panel-wipe grtiles,
// then builds the save directory path and ensures it exists.
void run_game_shutdown_sequence()

{
  char stack0xffdc3250_buf [256];
  char *stack0xffdc3250_ptr;
  char cVar1;
  char *pcVar2;
  char acStack_108 [260];

  decrement_cursor_hide_depth_thunk();
  input_bindings_free();
  stop_ambient_sound_effect();
  free_level_tile_arena();
  release_panel_wipe_grtiles();
  shutdown_sound_effects();
  shutdown_music_module();
  close_strings_pak_file_thunk();
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3250_ptr = acStack_108;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3250_ptr = cVar1; stack0xffdc3250_ptr = stack0xffdc3250_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_108,&DAT_000857a0);
  ensure_save_directory_exists(acStack_108);
  return;
}



// was FUN_0003bb60 -- waits for a pending input event to clear, then
// shows book/scroll page 9. Called once during startup, right after
// run_game_startup_sequence/build_trig_tables and before
// main_menu_loop -- plausibly a "press any key" instructions/title
// page shown before the main menu.
void wait_and_show_intro_page()

{
  short sVar1;

  do {
    sVar1 = next_input_event();
  } while (3 < sVar1);
  display_book_or_scroll_page(9);
  return;
}



// was FUN_0003bb84 -- initializes main-loop state: registers a key
// binding (request_game_exit) that signals the main loop to stop, sets
// the "game running" flag (DAT_00201b6c) that gates it, and resets a
// few related UI/mode fields. Called once from
// run_game_startup_sequence.
void init_main_loop_state()

{
  register_key_binding(0x278,0,0xbd,request_game_exit);
  DAT_00201b6c = 1;
  DAT_00201c84 = 0x7fff;
  DAT_00201b60 = 0;
  DAT_00201b64 = 0xffff;
  *(undefined1 *)(DAT_00085a6c + 8) = 0;
  *(undefined1 *)(DAT_00085a6c + 9) = 0;
  DAT_00085a6c[4] = 0; /* mirror to the real byte-8 mode field -- see set_game_mode */
  return;
}



// was FUN_0003bc08 -- key-binding callback (registered by
// init_main_loop_state) that clears the "game running" flag,
// signaling the main loop to exit.
void request_game_exit()

{
  DAT_00201b6c = 0;
  return;
}


// was FUN_0003c310 -- empty body (just returns), same no-op as its
// split-symbol duplicate show_error_dialog_stub_thunk. Called from both fatal
// and non-fatal error paths with and without an argument; plausibly a
// disabled error/message-dialog display stub (ce_strncpy, the real
// message-box display referenced near report_fatal_error_and_exit below, is itself
// unimplemented in this port) -- not confirmed via disassembly.
void show_error_dialog_stub()

{
  return;
}



// was FUN_0003c318 -- logs a categorized error message: the error
// code's top nibble selects one of 5 category strings (Low Memory,
// EMS Memory, read-data, write-data, resource/internal), logged via
// NKDbgPrintfW, then builds an "Error code XXXX" string (not actually
// filled in with the real code digits here). Used by
// report_categorized_fatal_error as a precursor to terminating.
void log_categorized_error_message(param_1)
short param_1;

{
  char *wptr_24610;
  char cVar1;
  ushort uVar2;
  char *pcVar3;
  char acStack_857f4 [546760];
  char acStack_2c [40];

  uVar2 = param_1 >> 0xc & 0xf;
  if (uVar2 == 1) {
    pcVar3 = s_Out_of_Low_Memory___000857dc;
  }
  else if (uVar2 == 2) {
    pcVar3 = s_Out_of_EMS_Memory___000857f0;
  }
  else if (uVar2 == 3) {
    pcVar3 = s_Could_not_read_data___00085804;
  }
  else if (uVar2 == 4) {
    pcVar3 = s_Could_not_write_data___0008581c;
  }
  else {
    pcVar3 = s_Resource_problem_or_internal_err_00085834;
  }
  NKDbgPrintfW(pcVar3);
  pcVar3 = s_Error_code_XXXX___000857c8;
    wptr_24610 = acStack_857f4;
  do {
    cVar1 = *pcVar3;
    *wptr_24610 = cVar1; wptr_24610 = wptr_24610 + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  return;
}



// was FUN_0003c3b4 -- logs a categorized fatal error
// (log_categorized_error_message) then terminates the process. Was
// missing its own `short param_1` parameter entirely (Ghidra dropped
// it from the function's own signature, not just a call site) --
// every other known caller passes an error code (e.g. 0x1002, 0x2001,
// 0x1007), confirming the real signature. Restored the parameter and
// forwarded it to log_categorized_error_message, which was also
// being called bare.
void report_categorized_fatal_error(param_1)
short param_1;

{
  log_categorized_error_message(param_1);
  terminate_process(0xffffffff);
  return;
}



// was FUN_0003c3c8 -- the general-purpose "fatal error" handler used
// throughout this decompile: formats an "Underworld can no longer
// run, Error XNNN" code string from param_1 (category letter + 3
// octal digits), shows it via ce_strncpy (unimplemented in this
// port, see the fprintf below), runs run_game_shutdown_sequence, and
// terminates the process.
void report_fatal_error_and_exit(param_1)
ushort param_1;

{
  /* ce_strncpy (the real message-box display for this error) isn't
     implemented, so this is currently the only visibility into which
     fatal error actually fired -- kept as a permanent log line, not a
     one-off diagnostic. */
  fprintf(stderr, "[fatal] report_fatal_error_and_exit: error code 0x%x\n", param_1);
  char *wptr_24645;
  char cVar1;
  undefined4 uVar2;
  char *pcVar3;
  char acStack_858b0 [546908];
  char acStack_54 [42];
  char local_2a;
  char local_29;
  char local_28;
  char local_27;
  
  pcVar3 = s_Underworld_can_no_longer_run__Er_0008585c;
    wptr_24645 = acStack_858b0;
  do {
    cVar1 = *pcVar3;
    *wptr_24645 = cVar1; wptr_24645 = wptr_24645 + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  local_2a = ((byte)((short)param_1 >> 0xc) & 0xf) + 0x41;
  param_1 = param_1 & 0xfff;
  local_29 = ((byte)((short)param_1 >> 6) & 7) + 0x30;
  local_28 = ((byte)((short)param_1 >> 3) & 7) + 0x30;
  local_27 = ((byte)param_1 & 7) + 0x30;
  uVar2 = ce_strlen(acStack_54);
  ce_strncpy(&DAT_00201b70,acStack_54,uVar2);
  run_game_shutdown_sequence(0);
  terminate_process(0xffffffe8);
  return;
}


// was FUN_0003c4a8 -- text-message sibling of
// report_fatal_error_and_exit: shows a direct message string (rather
// than a numeric error code) via ce_strncpy, then runs the same
// shutdown-and-terminate sequence.
void report_fatal_error_message_and_exit(param_1)
char *param_1;

{
  undefined4 uVar1;

  /* See report_fatal_error_and_exit's identical fprintf -- ce_strncpy (the real
     message-box display) isn't implemented, so this is the only
     visibility into which fatal message actually fired. param_1 here is
     the message text directly, not a numeric code. */
  fprintf(stderr, "[fatal] report_fatal_error_message_and_exit: %s\n", param_1 ? param_1 : "(null)");
  uVar1 = ce_strlen(param_1); // was a dropped arg -- param_1 itself, same class as babl_builtin_compare's own comment (uw.c ~10977)
  ce_strncpy(&DAT_00201b70,param_1,uVar1);
  run_game_shutdown_sequence(0);
  terminate_process(0xffffffe8);
  return;
}


// was FUN_0003f420 -- the 3D-viewport's click region handler
// (registered in src/input.c:970 alongside the sibling
// handle_game_view_click_hold), fired on click release. Reads the
// current cursor sub-mode/button-state from DAT_00085a6c, handles the
// door/inventory-panel interact-use case (sub-mode 0x10), and otherwise
// dispatches through PTR_FUN_000858c8_table by cursor mode (use/look/
// get/attack/talk) or, while holding/casting, routes to the
// drop-target/cast-completion handlers.
void handle_game_view_click()

{
  int iVar1;
  uint uVar2;
  if (getenv("UW_DEBUG_COMBAT")) {
    fprintf(stderr, "[combat] handle_game_view_click entry: mode=%d btnstate=0x%x\n",
            (int)*(short *)(DAT_00085a6c + 8), (unsigned)*(ushort *)(DAT_00085a6c + 6));
  }
  if ((*(ushort *)(DAT_00085a6c + 6) & 1) != 0) {
    handle_game_view_click_hold();
  }
  if (*(short *)(DAT_00085a6c + 8) != 1) {
    if (*(short *)(DAT_00085a6c + 8) != 0x10) {
      return;
    }
    if (*(short *)(DAT_00085a6c + 6) != 2) {
      return;
    }
    g_interact_target = pick_object_under_cursor(2);
    if (g_interact_target == 0) {
      return;
    }
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] handle_game_view_click -> interact_use\n");
    interact_use();
    return;
  }
  g_interact_target = 0;
  if (getenv("UW_DEBUG_COMBAT")) {
    fprintf(stderr, "[combat] handle_game_view_click past mode gate: DAT_00085a6c[6]=0x%x g_cursor_mode=%d g_cursor_holding_state=%d\n",
            (unsigned)*(ushort *)(DAT_00085a6c + 6), (int)g_cursor_mode, (int)g_cursor_holding_state);
  }
  if ((*(ushort *)(DAT_00085a6c + 6) & 2) == 0) {
    g_interact_target = 0;
    return;
  }
  if (g_cursor_holding_state == 0) {
    uint _dispatch;
    if (g_cursor_mode == 0) {
      uVar2 = 2;
    }
    else {
      uVar2 = ((int)g_cursor_mode & 0xffU) - 1;
    }
    if (getenv("UW_DEBUG_COMBAT")) {
      fprintf(stderr, "[combat] uVar2=%u bit1=0x%x\n", uVar2, (unsigned)(*(ushort *)(DAT_00085a6c + 6) & 1));
    }
    /* Was `(g_cursor_mode == 0) ? 0 : uVar2` -- a forced index-0 override
       for the no-mode-selected case. That matched the table's OLD, wrong
       order (where index 0 happened to be interact_look), but real ARM
       disassembly (0x3f590-0x3f5a8: `moveq r4,#0x2` when g_cursor_mode
       is 0, `subne r4,r3,#0x1` otherwise) never special-cases 0 at all --
       it's the exact same value uVar2 already computes above. With the
       dispatch table now in its real order (see its own comment),
       index 2 is interact_look, so using uVar2 directly still lands a
       bare right-click on "You see a <name>", now via the real index
       instead of a special-cased one. */
    _dispatch = uVar2;
    if ((uVar2 & 0xff) != 1) {
      if ((*(ushort *)(DAT_00085a6c + 6) & 1) != 0) {
        g_interact_target = 0;
        return;
      }
      g_interact_target = pick_object_under_cursor(2);
      /* Was `(g_interact_target == 0) && (uVar2 != 4)` -- an extra skip
         added under the OLD, wrong table order, meant to let attack
         (then assumed to be table[4]) fall through to the dispatch
         table even with no object under the cursor, matching live
         testing that showed swings need that (not every swing lands
         dead-center under the cursor). Real attack (table[1], uVar2==1)
         is already excluded from this whole block by the outer
         `uVar2 != 1` check above -- confirmed via ARM disassembly
         (0x3f5b4 `beq 0x3f5f0` branches straight to the table call for
         uVar2==1, before ever reaching this object-pick/describe code),
         so this fallthrough only runs for modes 0, 2, or 3 now (real
         table[0]/[2]/[3] = use/look/get), none of which need a
         "no object" carve-out -- real disassembly (0x3f5d4-0x3f5e4)
         unconditionally describes the terrain and returns here. Dropping
         the `uVar2 != 4` half avoids silently calling table[4]
         (interact_talk_npc) with a NULL g_interact_target when nothing
         is under the cursor. */
      if (g_interact_target == 0) {
        describe_picked_terrain(uVar2,(int)DAT_002020ac);
        goto LAB_0003f584;
      }
    }
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] handle_game_view_click: about to dispatch table[%u], btnstate=0x%x mode=%d\n",
              _dispatch & 0xff, (unsigned)*(ushort *)(DAT_00085a6c + 6), (int)*(short *)(DAT_00085a6c + 8));
    if ((_dispatch & 0xff) < 5 && PTR_FUN_000858c8_table[_dispatch & 0xff] != 0) {
      PTR_FUN_000858c8_table[_dispatch & 0xff]();
    }
  }
  else {
    if (g_cursor_holding_state == 1) {
      handle_object_drop_target(0x17);
    }
    else {
      if (g_cursor_holding_state != 2) {
        if (g_cursor_holding_state != 3) {
          g_interact_target = 0;
          return;
        }
        complete_cast_spell_on_target();
        return;
      }
      g_interact_target = pick_object_under_cursor(2);
      if (g_interact_target != 0) {
        iVar1 = target_in_range((int)DAT_000858c4,g_interact_target,DAT_002020b0);
        if ((iVar1 == 0) || (iVar1 = target_line_of_sight((int)DAT_000858c4,g_interact_target), iVar1 != 0)) {
          print_scroll_message_by_id(0x5e);
        }
        else {
          (*DAT_002020b8)(g_interact_target,1,0);
        }
      }
      if (g_selected_object != 0) {
        pop_cursor_icon(3);
        g_selected_object = 0;
        g_cursor_holding_state = 0;
      }
    }
LAB_0003f584:
    wait_for_click_release(1);
  }
  return;
}


// was FUN_00040cd4 -- called once from run_game_startup_sequence (see
// src/game.c:2132) to load/select the game's default HUD font
// (FONT5X6P.SYS).
undefined4 select_default_hud_font()

{
  /* Ghidra dropped select_active_font's return value here and always returned 0
     (failure) regardless -- the font file loads successfully, but the
     caller (run_game_startup_sequence) treats a 0 return as fatal and calls the
     "Underworld can no longer run" handler unconditionally. Propagate the
     real result. */
  return select_active_font(s_FONT5X6P_SYS_00084e9c);
}


// was FUN_00041210 -- called from restore_view_from_object_record
// (teleport/saved-viewpoint restore): switches to free-camera view,
// redraws and flashes the weapon overlay out then back in, waits for
// a click, flashes it out and in again, then restores the normal
// player view subject. Reads as the view-restore transition effect.
void play_view_restore_transition()

{
  full_dungeon_redraw();
  set_view_subject_by_command(0xffffffff);
  weapon_overlay_flash_hold(5);
  full_dungeon_redraw();
  weapon_overlay_flash_restore(5);
  wait_for_click_release(1);
  full_dungeon_redraw();
  weapon_overlay_flash_hold(5);
  set_view_subject_by_command(1);
  full_dungeon_redraw();
  weapon_overlay_flash_restore(5);
  return;
}


// was FUN_00041aac -- called once during game startup (src/game.c:2163,
// inside run_game_startup_sequence, right after the second splash
// screen); a report_fatal_error_and_exit failure here is fatal. Loads
// ALLPALS.DAT (into DAT_00202520), then runs the entire .GR
// preload chain (QUESTION/VIEWS/OBJECTS/ANIMO/BUTTONS/CURSORS/3DWIN/
// TMFLAT/TMOBJ/LFTI/the HUD icon group), snapshotting several resource
// base-frame globals (DAT_0020272c/DAT_00202730/DAT_00202734/
// DAT_00202738) along the way, and finally loads the critter
// association tables. Returns a fatal-error code (0x3004/0x3008/0x3009)
// on the first failure, 0 on success.
undefined4 load_startup_gr_resources()

{
  char stack0xffdc3230_buf [256];
  char *stack0xffdc3230_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  uint uVar22;
  uint uVar23;
  uint uVar24;
  char acStack_128 [260];
  
  ce_memset(acStack_128,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3230_ptr = acStack_128;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_128,s__DATA_allpals_dat_00085a50);
  iVar3 = open_file_for_read(acStack_128);
  if (iVar3 == -1) {
    uVar4 = 0x3008;
  }
  else {
    read_file_handle(iVar3,&DAT_00202520,0x200);
    CloseHandle(iVar3);
    uVar5 = load_gr_resource_group(s_question_00085a44);
    uVar6 = load_gr_resource_group(s_views_00085a3c);
    DAT_0020272c = DAT_00202744;
    uVar7 = load_objects_gr(s_objects_00085a34);
    DAT_0024fa1c = DAT_00202744;
    DAT_00202744 = 0x1c0;
    uVar8 = load_gr_resource_group(s_animo_00085a2c);
    DAT_00202730 = DAT_00202744;
    uVar9 = load_gr_resource_group(s_buttons_00085a24);
    uVar10 = load_gr_resource_group(s_cursors_00085a1c);
    uVar11 = load_gr_resource_group(s_3dwin_00085a14);
    DAT_00202734 = DAT_00202744;
    uVar12 = load_tmflat_gr(s_tmflat_00085a0c,0x170,0x10);
    /* DAT_00202738 is snapshotted AFTER this call, i.e. it's the base for
       whatever loads NEXT (LFTI.GR, see s_lfti_000859fc), not TMOBJ's own
       base -- confirmed by instrumenting this exact spot (DAT_00202744
       went 643 -> 681 across the load_gr_resource_group call below), so TMOBJ's
       real 38 frames are absolute indices 643-680. See
       emit_tile_objects's class-2 sign branch and decode_tile_object_billboard_texture's
       negative-param_1 comment for where this matters. */
    uVar13 = load_gr_resource_group(s_tmobj_00085a04);
    DAT_00202738 = DAT_00202744;
    uVar14 = load_hud_icon_gr(s_lfti_000859fc);
    uVar15 = load_hud_icon_gr(s_flasks_000859f4);
    uVar16 = load_hud_icon_gr(s_compass_000859ec);
    uVar17 = load_hud_icon_gr(s_dragons_000859e4);
    uVar18 = load_hud_icon_gr(s_inv_000859e0);
    uVar19 = load_hud_icon_gr(s_power_000859d8);
    uVar20 = load_hud_icon_gr(s_eyes_000859d0);
    uVar21 = load_hud_icon_gr(s_chains_000859c8);
    uVar22 = load_hud_icon_gr(s_spells_000859c0);
    uVar23 = load_hud_icon_gr(s_scrledge_000859b4);
    uVar24 = load_hud_icon_gr(s_optb_000859ac);
    if ((uVar23 & uVar24 & uVar22 & uVar21 & uVar20 & uVar19 & uVar18 & uVar17 & uVar16 & uVar15 &
         uVar14 & uVar13 & uVar12 & uVar11 & uVar10 & uVar9 & uVar8 & uVar7 & uVar6 & uVar5 & 1) ==
        0) {
      uVar4 = 0x3004;
    }
    else {
      DAT_00085988 = DAT_00085988 + '\x01';
      DAT_0024fa28 = DAT_0024d000 + '\t';
      iVar3 = load_critter_association_tables(1);
      if (iVar3 == 0) {
        uVar4 = 0x3009;
      }
      else {
        uVar4 = 0;
      }
    }
  }
  return uVar4;
}


// was FUN_00049924 -- ORs param_1's bits into the pending-update flag
// word DAT_00201c84, consumed elsewhere to decide what needs
// redrawing/reprocessing this tick. Callers pass everything from a
// single bit (2, 0x400, 10) up to near-all-bits requests
// (0x7dfe/0x7ffe) for a full redraw.
void set_pending_update_flags(param_1)
ushort param_1;

{
  DAT_00201c84 = DAT_00201c84 | param_1;
  return;
}


// was thunk_FUN_0003c310 -- a Ghidra-generated "thunk" duplicate of
// show_error_dialog_stub (identical empty body, a separate call site
// decompiled as a second copy). Collapsed to a real call to avoid
// the duplication.
void show_error_dialog_stub_thunk()

{
  show_error_dialog_stub();
  return;
}

// Extracted (unit-testing-framework merge) from the chargen "New Game"
// branch below -- the same \DATA\lev.ark -> \SAVE0\lev.ark seeding
// sequence inlined there originally, pulled into its own testable
// function. Renamed its FUN_0002295c calls to load_string_resource to
// match this branch's own naming.
bool prepare_new_game(void)
{
    char save_directory[264];
    char destination_path[264];
    undefined1 source_copy_path[520];
    undefined1 destination_copy_path[520];
    char *converted_path;
    char *source;
    char *destination;

    if (!character_generator_start()) return false;

    ce_memset(save_directory, 0, 0x104);
    source = (char *)&DAT_0023cca8;
    destination = save_directory;
    do {
        *destination++ = *source;
    } while (*source++ != '\0');
    ce_strcat(save_directory, (char *)&DAT_000857a0);
    ensure_save_directory_exists(save_directory);
    write_player_save_record(save_directory);

    ce_memset(save_directory, 0, 0x104);
    source = (char *)&DAT_0023cca8;
    destination = save_directory;
    do {
        *destination++ = *source;
    } while (*source++ != '\0');
    ce_strcat(save_directory, s__DATA_lev_ark_00085734);
    converted_path = (char *)load_string_resource(save_directory);
    ce_wcscpy(source_copy_path, converted_path);

    ce_memset(destination_path, 0, 0x104);
    source = (char *)&DAT_0023cca8;
    destination = destination_path;
    do {
        *destination++ = *source;
    } while (*source++ != '\0');
    ce_strcat(destination_path, s__SAVE0_lev_ark_000842fc);
    converted_path = (char *)load_string_resource(destination_path);
    ce_wcscpy(destination_copy_path, converted_path);
    if (!CopyFileW(source_copy_path, destination_copy_path, 0)) return false;

    if (seed_conversation_globals_for_new_game() != 0) {
        report_fatal_error_and_exit();
        return false;
    }
    if (load_level(1) < 1) return false;

    set_player_tile_position(0x20, 2, 1);
    debug_print_player_position("chargen-spawn");
    save_or_restore_level_special_state(1, 0);
    return true;
}

// Added by the unit-testing-framework merge, alongside prepare_new_game.
void begin_gameplay(void)
{
    pop_cursor_icon(3);
    cursor_show_idle_tick();
    set_game_mode(1);
    set_pending_update_flags(0x7ffe);
    DAT_000868d8 = 0;
}


// was FUN_0003bc40
void set_game_mode(param_1)
undefined4 param_1;

{
  *(char *)(DAT_00085a6c + 8) = (char)param_1;
  *(char *)(DAT_00085a6c + 9) = (char)((uint)param_1 >> 8);
  /* The real game mode lives at BYTE offset 8 of the DAT_00085a6c struct
     (== DAT_00085a6c[4] with its `short *` typing) -- that is what the
     0x3bc40 disasm writes (`strb [buf,#8]` / `[buf,#9]`) and what the
     keybinding dispatcher dispatch_key_binding reads (`ldrb [state,#8]`). Ghidra
     typed DAT_00085a6c as `short *`, so the two `*(char *)(DAT_00085a6c +
     8/9)` writes just above actually land at byte 16/18, and every
     `*(short *)(DAT_00085a6c + 8) == N` mode check elsewhere reads byte
     16 too -- self-consistent, so mode transitions still "work", but
     dispatch_key_binding's byte-8 read then always saw 0, so NO keybinding's
     mode mask ever matched and every table-dispatched key (the W/S/X/A/D
     movement keys, ...) was dead. Mirror the mode to byte 8 as well so
     the dispatcher sees it, without disturbing the byte-16 readers. */
  DAT_00085a6c[4] = (short)param_1;
  DAT_00201b60 = (short)param_1;
  if ((short)DAT_00201b60 != 1) {
    if ((short)DAT_00201b60 == 2) {
      DAT_00201b64 = 1;
      goto LAB_0003bcb0;
    }
    if ((short)DAT_00201b60 == 4) {
      DAT_00201b64 = 2;
      goto LAB_0003bcb0;
    }
  }
  DAT_00201b64 = 0;
LAB_0003bcb0:
  reset_cursor_confine_rect();
  return;
}



// was FUN_0003bcb8
void change_game_mode(param_1)
int param_1;

{
  code *pcVar1;
  bool bVar2;
  
  pcVar1 = (code *)(int)DAT_00201b64;
  /* Was `pcVar1 != (code *)0xffffffff` -- a 32-bit-pointer-sentinel idiom
     that's broken on this 64-bit host even after fixing DAT_00201b64's
     own signedness above: `pcVar1` sign-extends from a negative `int` to
     a full 64-bit all-ones pointer, but the literal `(code*)0xffffffff`
     zero-extends from an *unsigned* 32-bit constant to a 64-bit pointer
     with only its low 32 bits set -- the two never compare equal, so
     this guard was always true and let a disabled/-1 mode dispatch
     through a wild table index anyway. Compare the real source value
     instead of a fabricated pointer sentinel. */
  bVar2 = DAT_00201b64 != -1;
  if (bVar2) {
    /* 0x80 = 16 entries/mode * 8 bytes/entry (real pointer size) -- was
       0x40 (*4-byte entries), see DAT_00085668's comment. */
    pcVar1 = *(code **)(&DAT_000856a4 + (int)pcVar1 * 0x80);
  }
  if (bVar2 && pcVar1 != (code *)0x0) {
    (*pcVar1)();
  }
  if ((short)param_1 < 0) {
    param_1 = (int)DAT_00201c94;
  }
  else {
    DAT_00201c94 = (short)DAT_00201b60;
  }
  set_game_mode(param_1);
  /* 0x80, see DAT_00085668's comment. Guarded the same way the dispatch
     a few lines up is (DAT_00201b64 == -1 is the documented "no mode"
     sentinel, uw.c ~27530/27774) -- unguarded, this indexed a wild
     negative offset off the front of DAT_00085668_real_table whenever
     this ran with dispatch still disabled (confirmed live: an ASan
     global-buffer-overflow here in demo_automap_note_test.txt, right
     after fixing the sibling site above's zero-extension bug). */
  if ((DAT_00201b64 != -1) && (*(code **)(&DAT_00085668 + DAT_00201b64 * 0x80) != (code *)0x0)) {
    (**(code **)(&DAT_00085668 + DAT_00201b64 * 0x80))();
  }
  if ((short)param_1 != 1) {
    set_pending_update_flags(0x7ffe);
  }
  return;
}


void *opbtn_gr_bump_alloc_entry(param_1)
unsigned int param_1;

{
  /* Same allocator-callback role as gr_resource_bump_alloc_entry/hud_icon_gr_bump_alloc_entry/
     decode_gr_entry_bump_alloc_entry (load_gr_resource_entries's param_4, "Ghidra couldn't resolve this
     address" -- see their comments): a no-op stub returning 0 here
     failed the whole "opbtn" resource batch even though the underlying
     OPBTN.GR file loaded successfully, which was fatal
     (report_fatal_error_and_exit(0x300d)) at this specific call site. */
  return ce_malloc(param_1);
}
