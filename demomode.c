/* See demomode.h. Input file format: one command per line, case-
 * insensitive, blank lines and lines starting with '#' ignored:
 *   UP DOWN LEFT RIGHT ENTER SPACE CTRL ESC
 * Pacing is controlled by the UW_DEMO_DELAY_MS env var (default 250ms
 * between inputs). Playback stops permanently once the file runs out --
 * the game keeps running normally (or waiting for real input) after
 * that, it just stops receiving synthetic events. */
#include "demomode.h"
#include "uw.h"

#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#define VK_UP 0x26
#define VK_DOWN 0x28
#define VK_LEFT 0x25
#define VK_RIGHT 0x27
#define VK_RETURN 0x0D
#define VK_SPACE 0x20
#define VK_CONTROL 0x11
#define VK_ESCAPE 0x1B

#define DEMO_DEFAULT_DELAY_MS 250

static FILE *g_demo_file;
static Uint32 g_demo_next_tick;
static int g_demo_delay_ms = DEMO_DEFAULT_DELAY_MS;
static int g_demo_active;
static int g_demo_done;

static int demo_translate_vk(const char *name) {
    if (strcasecmp(name, "UP") == 0) return VK_UP;
    if (strcasecmp(name, "DOWN") == 0) return VK_DOWN;
    if (strcasecmp(name, "LEFT") == 0) return VK_LEFT;
    if (strcasecmp(name, "RIGHT") == 0) return VK_RIGHT;
    if (strcasecmp(name, "ENTER") == 0 || strcasecmp(name, "RETURN") == 0) return VK_RETURN;
    if (strcasecmp(name, "SPACE") == 0) return VK_SPACE;
    if (strcasecmp(name, "CTRL") == 0 || strcasecmp(name, "CONTROL") == 0) return VK_CONTROL;
    if (strcasecmp(name, "ESC") == 0 || strcasecmp(name, "ESCAPE") == 0) return VK_ESCAPE;
    return 0;
}

void demomode_init(void) {
    const char *path = getenv("UW_DEMO_FILE");
    if (!path) return;

    g_demo_file = fopen(path, "r");
    if (!g_demo_file) {
        fprintf(stderr, "[demo] failed to open UW_DEMO_FILE=%s\n", path);
        return;
    }

    const char *delay_env = getenv("UW_DEMO_DELAY_MS");
    if (delay_env) {
        int v = atoi(delay_env);
        if (v > 0) g_demo_delay_ms = v;
    }

    g_demo_active = 1;
    g_demo_next_tick = SDL_GetTicks() + (Uint32)g_demo_delay_ms;
    fprintf(stderr, "[demo] playing back input from %s (delay=%dms)\n", path, g_demo_delay_ms);
}

void demomode_pump(void) {
    if (!g_demo_active || g_demo_done) return;
    Uint32 now = SDL_GetTicks();
    if (now < g_demo_next_tick) return;

    char line[256];
    if (!fgets(line, sizeof(line), g_demo_file)) {
        fprintf(stderr, "[demo] end of input, stopping playback\n");
        g_demo_done = 1;
        fclose(g_demo_file);
        g_demo_file = NULL;
        return;
    }

    char *nl = strpbrk(line, "\r\n");
    if (nl) *nl = '\0';
    char *p = line;
    while (*p == ' ' || *p == '\t') p++;

    if (*p == '\0' || *p == '#') {
        /* Blank/comment line -- retry immediately on the next pump
         * instead of burning a full delay slot on nothing. */
        g_demo_next_tick = now;
        return;
    }

    int vk = demo_translate_vk(p);
    if (vk == 0) {
        fprintf(stderr, "[demo] unrecognized input '%s', skipping\n", p);
    } else {
        fprintf(stderr, "[demo] sending %s\n", p);
        FUN_00077b2c(0, 0x100u, (unsigned int)vk);
        FUN_00077b2c(0, 0x101u, (unsigned int)vk);
    }
    g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
}
