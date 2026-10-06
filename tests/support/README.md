Test executables contain Unity cases and assertions. Fixture libraries compile
setup, controlled services, and selected original game functions once, so a new
suite can reuse them without copying globals or mocks into its test file.

Register a suite in `tests/CMakeLists.txt` using an existing fixture:

```cmake
add_supported_game_unit_test(my_inventory uw_test_inventory)
```

Create `tests/test_my_inventory.c`:

```c
#include "inventory_fixture.h"

void setUp(void) { inventory_fixture_reset(); }
void tearDown(void) { inventory_fixture_dispose(); }

static void test_sack_contents_have_a_widget(void)
{
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[2]));
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_sack_contents_have_a_widget);
    return UNITY_END();
}
```

Each `uw_test_<suite>` library provides its matching `<suite>_fixture.h`.
Reset helpers reproduce the existing controlled setup; counters and fixture
storage are available for cases to select inputs and inspect effects. The
new-game fixture also provides `new_game_fixture_begin/end` to create and
remove its temporary save workspace around the suite. Link one domain fixture
per executable: fixtures provide separate, intentionally isolated game globals
and mocks, rather than a running UI/game instance.

`uw_test_movement` exposes a `movement_fixture` struct. Its reset loads level 1,
isolates actor records, creates an alive character through the real initializer,
and loads COMOBJ.DAT. Defaults represent a grounded player moving into a wall.
Set `movement_fixture.wall_flags = 4` for open floor, enable `door_fixture` for a
door candidate, or call `movement_fixture_prepare_stair(height)` for stairs.
Counters and snapshots record rollback, sliding, landing, and object contact;
read/write helpers access packed movement fields.

The common `uw_test_support` helpers in `game_fixture.h` are independent of
these domain fixtures:

- `uw_test_create_character(record, attributes, object)` binds character globals
  and calls the real initializer without class rolls or UI.
- `uw_test_load_map(arena, capacity, level)` loads a numbered UW1 block from
  LEV.ARK, validating capacity, archive block length, and the map marker.
- `uw_test_level_object(arena, capacity, slot)` resolves mobile/static slots.
- `uw_test_open_data(path)` opens a required file relative to the project data
  folder, independently of `UW_DATA_DIR` and a suite's file-service mocks.
- `uw_test_read_data(path, destination, size, offset, origin)` reads an exact
  slice; offsets can be relative to the beginning or end of the file.
- `uw_test_load_object_properties(records, capacity)` expands COMOBJ.DAT rows
  into the game's 13-byte metadata records.

Fixture map loading uses native file reads, so inventory, trap, illustration,
and new-game suites can keep their own observed or failing file-service mocks.
The new-game suite still exercises the actual `read_archive_entry` and level
loader. The character initializer and archive reader have separate compiled
libraries, avoiding dependencies on unrelated services when only one is used.
String/memory services use compiled original ordinal bodies; division and the
default RNG are separate support archive members. A suite's own service symbol
wins over the default without pulling in unrelated mocks.

`uw_test_math` compiles just the original value-stepping function and needs no
unrelated service stubs. `test_support.c` demonstrates the common helpers.

`uw_test_geometry` exercises the real near-plane clipping and polygon-list
renderer against controlled arena records. Its raster callback captures the
current triangles without opening a window. The clipped-record buffer is
extracted from `src/3d.c` itself so AddressSanitizer checks its actual size;
the fixture does not substitute a larger buffer and hide an overflow.

`uw_test_spells` runs the real rune-table lookup, casting, special-action
dispatcher, and light effect with a character from the common helper. Skill
results, dice, sound, and UI boundaries remain controlled; tests also exercise
critical failures and no-magic tiles using the full player address.

Generated function units are build artifacts. CMake regenerates them from the
source files when those files change. Game implementations remain in their
original files; no implementation copies are checked into tests.

`uw_test_babl_vm` compiles the real conversation dispatcher, all opcode handlers,
menu wait/selection, NPC variable bridge, quest access and barter rules. Use
`babl_fixture_reset`, `babl_symbol` and `babl_run` to construct short bytecode
programs against controlled VM storage. `test_babl_vm.c` covers all 42
conversation opcodes (0x00..0x29), including signed arithmetic, branch outcomes,
nested calls, stack frames, variable writes, native dispatch and text output.
Its final coverage assertion checks that every opcode actually executed.

Input selects controlled menu responses through the real wait loop. Storage,
string expansion, drawing, RNG and inventory-list services are controlled at
fixture boundaries; these tests do not run complete CNV.ARK conversations or
cover every native builtin. Additional cases exercise quest-dependent dialogue,
NPC state on reentry, accepted/rejected/declined trades, 16-bit preferences and
barter cache initialization/invalidation. A tick budget makes endless dialogue
or input waits fail instead of hanging the test process.
