# Recovery of unit-testing-framework coverage

`unit-testing-framework` ended at `f054120`, with eight commits after the shared
ancestor `9dd934a`. Their source fixes were translated onto the split source tree
in later commits, but most of their tests were not carried over.

| Original commit | Existing implementation on the current branch |
| --- | --- |
| `5e0a095` introduction, cutscene resources and fades | `883a6cf` |
| `e7bde31` fades, transitions and input waits | `883a6cf`, `780421f` |
| `fbeb4d9` GX/game clock, held input and look pacing | `780421f`, `abdf918` |
| `1c1b1f6` stair placement and resurrection pointers | Current placement search; `c11b0fb` pointer fix |
| `2fd87f2` NPC perception, combat and waypoint storage | `75c273a`, `60fbe99`, `d2ea54b`, `4b2690d` |
| `e9e502b` creature/weapon aliases, loot and projectiles | `c3e5297`, `ce90599`, `c11b0fb`, `885c3b4` |
| `2c702be` thrown-object physics and bridge landings | `abdf918`, `ce90599`, current spawn/placement functions |
| `f054120` spell table, cursor throws, critter frames and lighting | `2aec300`, `e45e8db`, `3dc485d`, `d9516a4` |

The merge preserves the newer game sources and imports the missing coverage into
fixture libraries: introduction, stair_transition, npc_ai, throw, throw_cursor,
lighting, critter_palette, creatures, gx_pacing, look_pacing, inventory_drag,
transitions, and spell_runes. Source functions are extracted from their current
files; no old game implementations or monolithic uw.c/uw.h copies are imported.
Fixtures use current ordinal names, division return types and backing sizes.
Map/property loading and division use the shared test services.

Two expectations intentionally follow newer fixes: player tile placement takes
only X and Y, and ARM lighting updates SHADES.DAT's discovery grid while rendering
through RGB bias. Existing tests retain newer cursor, door, visibility, automap,
combat and conversation behavior.

Validation: all 41 suites pass in normal and AddressSanitizer builds; uw_dbg builds.
