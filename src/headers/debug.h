#ifndef DEBUG_H
#define DEBUG_H

/* Simple leveled logging, meant as a drop-in replacement for this
 * codebase's ad-hoc `fprintf(stderr, "[tag] ...\n", ...)` diagnostic
 * calls (see gx_stub.c/uw.c/demomode.c/etc.) -- same call shape (a
 * printf-style format string plus varargs), but gated by a runtime-
 * configurable minimum level instead of always firing, and always
 * prefixed with the real call site's file:line (via __FILE__/__LINE__,
 * captured by the macro below -- DEBUG_impl itself can't see those).
 *
 * Usage:
 *   DEBUG(INFO, "[gx] window created at pos=(%d,%d)\n", wx, wy);
 * prints something like:
 *   [INFO] gx_stub.c:337: [gx] window created at pos=(436,251)
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

/* Real implementation -- call DEBUG(...) below instead, which fills in
 * __FILE__/__LINE__ from the actual call site automatically. */
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...);

#define DEBUG(level, fmt, ...) DEBUG_impl(level, __FILE__, __LINE__, fmt, ##__VA_ARGS__)

#endif /* DEBUG_H */
