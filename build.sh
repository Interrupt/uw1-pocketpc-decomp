clang -std=gnu11 -g -O0 -Wno-implicit-function-declaration -Wno-int-conversion -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast -Wno-incompatible-function-pointer-types -Wno-deprecated-non-prototype $(sdl2-config --cflags) -o build/uw_dbg uw.c graphics.c game.c chargen.c main.c gx_stub.c ordinal_stubs.c file_io.c demomode.c debug.c $(sdl2-config --libs) 2>&1 | grep -iE "error:"
echo "built"
