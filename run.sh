#!/bin/sh
# Build and run the game against the local data/ folder.
set -e
cd "$(dirname "$0")"

clang -std=gnu11 -g -O0 \
  -Wno-implicit-function-declaration -Wno-int-conversion \
  -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast \
  -Wno-incompatible-function-pointer-types -Wno-deprecated-non-prototype \
  $(sdl2-config --cflags) \
  -o build/uw_dbg uw.c graphics.c game.c chargen.c main.c gx_stub.c ordinal_stubs.c file_io.c demomode.c \
  $(sdl2-config --libs)

UW_DATA_DIR="$(pwd)/data" ./build/uw_dbg
