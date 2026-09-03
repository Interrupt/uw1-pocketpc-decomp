#ifndef HEADERS_GAME_H
#define HEADERS_GAME_H

/* Declarations for game.c: top-level program flow (WinMain's real body
 * and the title/main menu loop). Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "../uw.h"

undefined4 app_main_loop();
void main_menu_loop();

#endif
