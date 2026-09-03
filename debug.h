#ifndef DEBUG_H
#define DEBUG_H

/* Simple leveled logging, meant as a drop-in replacement for this
 * codebase's ad-hoc `fprintf(stderr, "[tag] ...\n", ...)` diagnostic
 * calls (see gx_stub.c/uw.c/demomode.c/etc.) -- same call shape (a
 * printf-style format string plus varargs), but gated by a runtime-
 * configurable minimum level instead of always firing.
 *
 * Usage:
 *   DEBUG(INFO, "[gx] window created at pos=(%d,%d)\n", wx, wy);
 *
 * A trailing newline is added automatically if the format string
 * doesn't already end with one, so it's fine to leave it off.
 *
 * Set the minimum level to actually print via the UW_DEBUG_LEVEL env
 * var (TRACE/INFO/WARN/ERR, case-insensitive); defaults to TRACE
 * (everything prints) if unset or unrecognized. */

typedef enum {
    TRACE = 0,
    INFO = 1,
    WARN = 2,
    ERR = 3
} DebugLevel;

void DEBUG(DebugLevel level, const char *fmt, ...);

#endif /* DEBUG_H */
