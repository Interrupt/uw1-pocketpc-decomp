#ifndef DEBUG_H
#define DEBUG_H

/* Simple leveled logging, meant as a drop-in replacement for this codebase's ad-hoc
   `fprintf(stderr, "[tag] ...\n", ...)` diagnostic calls (see gx_stub.c/uw.c/demomode.c/etc.) --
   same call shape (a printf-style format string plus varargs)... */

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
