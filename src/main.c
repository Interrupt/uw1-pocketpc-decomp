#include "headers/main.h"
#include <signal.h>
#include <execinfo.h>
#include <stdlib.h>

static undefined4 *DAT_0025090c;
static undefined4 *DAT_00250908;
void entry(undefined4 instance, undefined4 prev_instance, undefined4 command_line, undefined4 show_command)
{
  run_static_initializers();
  app_main_loop(instance, prev_instance, command_line, show_command);
  /* HACK: was a bare `terminate_process();` -- dropped argument, the same class of bug fixed
     repeatedly elsewhere in this file. */
  terminate_process(0);
}
// was FUN_00082328 -- entry's own pre-app_main_loop setup step. Originally walked linker-generated
// static-initializer section boundaries (e.g. __init_array_start/end) calling through them as
// function pointers.
void run_static_initializers(void)
{
}
// was FUN_00082358 -- generic "call every function pointer in
// [param_1,param_2)" helper, the mechanism run_static_initializers
// and terminate_process's own (dead) atexit-walk originally used.
void call_function_pointer_range(undefined4 *range_start, undefined4 *range_end)
{
  for (; range_start < range_end; range_start = range_start + 1) {
    if ((code *)*range_start != (code *)0x0) {
      (*(code *)*range_start)();
    }
  }
}
// was FUN_00082388 -- entry's own post-app_main_loop teardown step, AND this program's real
// process-termination point: originally ran registered atexit-style handlers (dead code -- nothing
// ever registers any, see register_atexit_handler/register_default_atexit_ handler)...
void terminate_process(int exit_code)
{
  fprintf(stderr, "[exit] terminate_process: terminating (code %d)\n", exit_code);
  exit(exit_code);
}
// was FUN_00082448 -- registers an atexit-style handler: appends param_1 to a dynamically-grown
// array (DAT_00250908/DAT_0025090c), reallocating via LocalAlloc/34/35 (malloc/realloc/size-query
// style WinCE ordinals) when it's full.
undefined4 register_atexit_handler(undefined4 handler)
{
  uint capacity_bytes = LocalSize(DAT_0025090c);
  int new_block;

  if (capacity_bytes < (uint)((int)DAT_00250908 + (4 - (int)DAT_0025090c))) {
    if (DAT_0025090c == 0) {
      new_block = LocalAlloc(0, 0x10);
    }
    else {
      new_block = LocalSize(DAT_0025090c);
      new_block = LocalReAlloc(DAT_0025090c, new_block + 0x10, 2);
    }
    if (new_block == 0) {
      return 0;
    }
    DAT_00250908 = (undefined4 *)(new_block + ((int)DAT_00250908 - (int)DAT_0025090c >> 2) * 4);
    DAT_0025090c = new_block;
  }
  *DAT_00250908 = handler;
  DAT_00250908 = DAT_00250908 + 1;
  return handler;
}
// was FUN_000824f0 -- thin wrapper reporting whether register_atexit_handler succeeded (0) or
// failed (-1).
undefined4 register_default_atexit_handler(undefined4 handler)
{
  if (register_atexit_handler(handler) == 0) {
    return 0xffffffff;
  }
  return 0;
}

/* Debug aid: print a real backtrace on a fatal signal without needing lldb attached. */
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
    /* stderr is fully buffered (not line-buffered) once redirected to a file, which makes a live
       log look frozen even while the process is actively running -- force unbuffered so debug
       output shows up in real time. */
    setvbuf(stderr, NULL, _IONBF, 0);
    signal(SIGSEGV, crash_backtrace_handler);
    signal(SIGBUS, crash_backtrace_handler);
    signal(SIGABRT, crash_backtrace_handler);
    entry(0, 0, 0, 0);
    return 0;
}
