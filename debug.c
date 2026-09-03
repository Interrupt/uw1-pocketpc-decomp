/* See debug.h. */
#include "debug.h"

#include <dlfcn.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

static DebugLevel g_min_level = TRACE;
static int g_min_level_read = 0;

static const char *level_name(DebugLevel level) {
    switch (level) {
        case TRACE: return "TRACE";
        case INFO:  return "INFO";
        case WARN:  return "WARN";
        case ERR:   return "ERR";
    }
    return "?";
}

static void read_min_level_once(void) {
    g_min_level_read = 1;
    const char *env = getenv("UW_DEBUG_LEVEL");
    if (!env) return;
    if (strcasecmp(env, "TRACE") == 0) g_min_level = TRACE;
    else if (strcasecmp(env, "INFO") == 0) g_min_level = INFO;
    else if (strcasecmp(env, "WARN") == 0) g_min_level = WARN;
    else if (strcasecmp(env, "ERR") == 0 || strcasecmp(env, "ERROR") == 0) g_min_level = ERR;
}

void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...) {
    if (!g_min_level_read) {
        read_min_level_once();
    }
    if (level < g_min_level) {
        return;
    }

    fprintf(stderr, "[%s] %s:%d ", level_name(level), file, line);

    va_list args;
    va_start(args, fmt);
    vfprintf(stderr, fmt, args);
    va_end(args);

    /* Level 0 (from DEBUG_impl's own frame) would just be whichever
       function contains the DEBUG(...) call site -- already covered by
       file:line above. Level 1 is one frame further up: whoever called
       *that* function, which is what you actually want when the
       DEBUG(...) call lives inside a shared helper (e.g.
       bitmap_blit_to_framebuffer) and several different callers hit it.
       Same dladdr-on-a-return-address idiom already used by
       FUN_00011060's UW_DIAG_TEXT trace in uw.c. Reliable at -O0 (this
       project's only build mode) since frame pointers stay intact;
       silently prints nothing extra if it can't resolve a symbol. */
    Dl_info caller_info;
    void *caller_addr = __builtin_return_address(1);
    if (caller_addr && dladdr(caller_addr, &caller_info) && caller_info.dli_sname) {
        fprintf(stderr, " (from %s)", caller_info.dli_sname);
    }

    size_t len = strlen(fmt);
    if (len == 0 || fmt[len - 1] != '\n') {
        fputc('\n', stderr);
    }
}
