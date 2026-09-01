#include "uw.h"

int main(int argc, char **argv) {
    (void)argc;
    (void)argv;
    /* stderr is fully buffered (not line-buffered) once redirected to a
     * file, which makes a live log look frozen even while the process is
     * actively running -- force unbuffered so debug output shows up in
     * real time. */
    setvbuf(stderr, NULL, _IONBF, 0);
    entry(0, 0, 0, 0);
    return 0;
}
