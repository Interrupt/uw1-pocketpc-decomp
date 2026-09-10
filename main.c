#include "uw.h"
#include <signal.h>
#include <execinfo.h>
#include <stdlib.h>

/* Debug aid: print a real backtrace on a fatal signal without needing lldb
 * attached. Some crashes in this decompile only reproduce under a plain
 * run and go away under lldb (lldb disables ASLR and/or changes timing
 * enough to dodge them), so lldb's own `bt` isn't always usable for
 * diagnosing them. */
static void crash_backtrace_handler(int sig) {
    void *frames[32];
    int n = backtrace(frames, 32);
    fprintf(stderr, "\n[crash] fatal signal %d, backtrace:\n", sig);
    backtrace_symbols_fd(frames, n, 2);
    _exit(128 + sig);
}

int main(int argc, char **argv) {
    (void)argc;
    (void)argv;
    /* stderr is fully buffered (not line-buffered) once redirected to a
     * file, which makes a live log look frozen even while the process is
     * actively running -- force unbuffered so debug output shows up in
     * real time. */
    setvbuf(stderr, NULL, _IONBF, 0);
    signal(SIGSEGV, crash_backtrace_handler);
    signal(SIGBUS, crash_backtrace_handler);
    signal(SIGABRT, crash_backtrace_handler);
    entry(0, 0, 0, 0);
    return 0;
}
