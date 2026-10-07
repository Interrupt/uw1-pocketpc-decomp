#include "headers/main.h"
#include <signal.h>
#include <execinfo.h>
#include <stdlib.h>

static undefined4 *DAT_0025090c;
static undefined4 *DAT_00250908;
void entry(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  run_static_initializers();
  app_main_loop(param_1,param_2,param_3,param_4);
  /* HACK: was a bare `terminate_process();` -- dropped argument, the same class of bug fixed
     repeatedly elsewhere in this file. */
  terminate_process(0);
  return;
}
// was FUN_00082328 -- entry's own pre-app_main_loop setup step. Originally walked linker-generated
// static-initializer section boundaries (e.g. __init_array_start/end) calling through them as
// function pointers.
void run_static_initializers()

{
  return;
}
// was FUN_00082358 -- generic "call every function pointer in
// [param_1,param_2)" helper, the mechanism run_static_initializers
// and terminate_process's own (dead) atexit-walk originally used.
void call_function_pointer_range(param_1,param_2)
undefined4 * param_1;
undefined4 * param_2;

{
  for (; param_1 < param_2; param_1 = param_1 + 1) {
    if ((code *)*param_1 != (code *)0x0) {
      (*(code *)*param_1)();
    }
  }
  return;
}
// was FUN_00082388 -- entry's own post-app_main_loop teardown step, AND this program's real
// process-termination point: originally ran registered atexit-style handlers (dead code -- nothing
// ever registers any, see register_atexit_handler/register_default_atexit_ handler)...
void terminate_process(param_1)
undefined4 param_1;

{
  fprintf(stderr, "[exit] terminate_process: terminating (code %d)\n", (int)(intptr_t)param_1);
  exit((int)(intptr_t)param_1);
}
// was FUN_00082448 -- registers an atexit-style handler: appends param_1 to a dynamically-grown
// array (DAT_00250908/DAT_0025090c), reallocating via LocalAlloc/34/35 (malloc/realloc/size-query
// style WinCE ordinals) when it's full.
undefined4 register_atexit_handler(param_1)
undefined4 param_1;

{
  uint uVar1;
  int iVar2;

  uVar1 = LocalSize(DAT_0025090c);
  if (uVar1 < (uint)((int)DAT_00250908 + (4 - (int)DAT_0025090c))) {
    if (DAT_0025090c == 0) {
      iVar2 = LocalAlloc(0,0x10);
    }
    else {
      iVar2 = LocalSize(DAT_0025090c);
      iVar2 = LocalReAlloc(DAT_0025090c,iVar2 + 0x10,2);
    }
    if (iVar2 == 0) {
      return 0;
    }
    DAT_00250908 = (undefined4 *)(iVar2 + ((int)DAT_00250908 - (int)DAT_0025090c >> 2) * 4);
    DAT_0025090c = iVar2;
  }
  *DAT_00250908 = param_1;
  DAT_00250908 = DAT_00250908 + 1;
  return param_1;
}
// was FUN_000824f0 -- thin wrapper reporting whether register_atexit_handler succeeded (0) or
// failed (-1).
undefined4 register_default_atexit_handler(param_1)
undefined4 param_1;

{
  int iVar1;
  undefined4 uVar2;

  iVar1 = register_atexit_handler(param_1);
  uVar2 = 0;
  if (iVar1 == 0) {
    uVar2 = 0xffffffff;
  }
  return uVar2;
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
