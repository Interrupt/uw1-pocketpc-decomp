/* Nothing extra needed: DAT_0024af60/DAT_0023c448 (src/headers/game.h) and
 * g_text_input_active (src/headers/hud.h) all already get their extern
 * declarations for free via uw.h -- see keyboard_fixture.c for the actual
 * storage this isolated test TU needs, since game.c/hud.c themselves
 * aren't part of this build. */
