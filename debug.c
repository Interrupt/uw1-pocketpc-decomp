/* See debug.h. */
#include "debug.h"

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

    size_t len = strlen(fmt);
    if (len == 0 || fmt[len - 1] != '\n') {
        fputc('\n', stderr);
    }
}
