# UW1 object conversion

Reference revision: `ac72dd9155e4bd3ab76257fa5daca080f23f2bbf` of
https://github.com/hankmorgan/UWReverseEngineering.

Use the UW1 object layout in `UW-Formats/uw-formats (Underworld Adventures).txt`,
sections 4.2 and 6.2, and `File Research/Game Object Research File.xlsx`.
Do not substitute `CommonObjDat UW2.xlsx`, `Player_Dat (UW2).xls`, or UW2 tables.
The research workbook includes notes about both games: verify each adopted
field against the UW1 format and this ARM port's actual consumers.

The native COMOBJ record is **13 bytes**, even though the UW1 disk row is
11 bytes. `load_object_catalog_data` inserts a byte before monetary value
and leaves a byte after description flags. Preserve that layout. The bit at
native offset 8, bit 7, means *can have an owner*, not *is a container*.

Object slots have an eight-byte common header. Mobile slots are 27 bytes;
NPC state and projectile coordinates occupy overlapping bytes. Only use
NPC fields for NPC/player slots and projectile fields for moving items.
`object_layout` exhaustively checks extraction and writes against independent
UW1 masks, including neighbouring bytes and native COMOBJ padding.

## Semantic patches

Coccinelle/spatch 1.3.3 was used for this sweep. Generated patches are checked
in alongside their generators, so reviewers can inspect exactly what ran.

```
python3 tools/coccinelle/generate_player_rules.py
python3 tools/coccinelle/generate_property_rules.py
spatch --sp-file tools/coccinelle/player-fields.cocci --dir src --no-includes --in-place
spatch --sp-file tools/coccinelle/object-properties.cocci --dir src --no-includes --in-place
spatch --sp-file tools/coccinelle/property-fields.cocci --dir src --no-includes --in-place
```

`property-pointers.cocci` converts row-address arithmetic at proven consumers.
Run it on each file separately: spatch accepts only one positional input file.
Saved COMOBJ offsets at the matched `iVar*` and `_iv` access sites were checked
to be `item_id * 13`; the patch divides the saved value rather than evaluating
a potentially changed object ID again.

`player-storage-boundaries.cocci` is the temporary migration step that keeps
remaining byte/word arithmetic in its original units as the player global is
retyped. Those accesses are **not converted fields**. Do not count explicit
casts as completion. `object-weight.cocci` converts the weight function, and
`object-weight-callers.cocci` marks its temporary typed call boundaries. Assignments were explicitly retyped once; the retained patch is idempotent.

`object-returns.cocci` changes the eleven allocation, lookup and relocation APIs
to return `uw_object_hdr_t *`, including their declarations and test doubles.
Compiler incompatible-pointer diagnostics now identify raw-pointer receivers.
Explicit casts hide those diagnostics, and pointer arithmetic can still compile
with different units after retyping: inspect both before converting a caller.
Do not silence the migration diagnostics globally.

`audit_object_roles.py` uses `build/compile_commands.json` and Clang ASTs to
identify object pointers from catalog accesses, object lookup calls and proven
aliases. It excludes locals reused as unrelated buffers. The generated
`object-pointer-roles.json` records the evidence and exclusions; it is an
incomplete audit, not proof that all object accesses have been found.
`generate_header_field_rules.py` generates function-scoped common-header read
patches from that audit. Apply them with `apply_header_field_rules.py`; use
`--check` to verify a second application makes no changes. These read patches
retain explicit header casts until caller declarations and arithmetic migrate.

`core-object-receivers.cocci` converts the chain/world search receivers and
their common-header reads. `object-link-interfaces.cocci` types packed link
and cursor parameters; `object-chain-interfaces.cocci` distinguishes those
parameters from the object headers passed to list operations. These interface
patches also apply to declarations and test doubles. `object-chain-storage.cocci`
converts list writes and recursive deletion without changing traversal order.
`spawn-object-header.cocci` replaces creation's byte stores with equivalent
header assignments, including the original quantity/container classification.
`object-arena-boundaries.cocci` casts the original computed byte addresses to
header pointers at allocation and resolution boundaries. The arena globals
themselves still need conversion.

`header-words/` contains generated, function-scoped rules for remaining whole
header words at the audited pointer roles. They expose `type_flags`,
`position_word`, `chain_word` and `link_word`; direct signed-short aliases
are excluded because their promotions differ. Regenerate with
`generate_header_word_rules.py` and apply/check with
`apply_header_field_rules.py --patch-dir tools/coccinelle/header-words`.
These casts still require a subsequent declaration/API migration.

`container-object-interfaces.cocci` types disposal, rune insertion and stack
inspection interfaces. Container weight traversal and matching-object locals
are covered by `core-object-receivers.cocci`. The core tests also exercise
nested contents weights and stack eligibility using the actual game functions.

`object_core` runs the real creation, link-resolution, search, insertion,
append and unlink functions. It compares creation to independent packed byte
values for all 512 types and checks both arena strides, nested contents,
quantity exclusions, next-link updates and preservation of adjacent low bits.

`current-mobile-object.cocci` types the current 27-byte slot pointer and
replaces common physical byte/header accesses. `current-mobile-fields.cocci`
reads the extended NPC fields only in NPC functions; projectile coordinate
words are excluded. Signed byte views retain their original signedness.
Residual word indexing uses explicit temporary word casts so retyping cannot
change its units. `npc-context-interfaces.cocci` types the context-setting
APIs, and `npc-state-setters.cocci` converts goal and target writes.
`projectile-tick.cocci` gives the non-NPC physics tick its own projectile
pointer, lifetime, pitch flags and tile coordinates.

`npc_state` runs the actual setters and independently checks all 65,536
target words, goal/target truncation, preserved animation/status bits and
the unchanged-target path flags. It does not imply that all NPC consumers
or the other projectile APIs have been migrated.

`uw_monster_type_props_t` and `uw_monster_attack_props_t` recover the UW1
OBJECTS.DAT critter table from `File Research/objects_dat-critters.xls` and
the ARM consumers. There are 64 packed 48-byte rows; the loader copies exactly
0xc00 bytes from disk offset 0x132. The last byte keeps an unknown name.
`monster-storage.cocci` migrates the table and fixture storage; its size rules
cover both sizeof forms and repairs byte-view sizes. Comma-separated fixture
declarations were split explicitly because spatch did not migrate those.
`monster-properties.cocci` replaces audited aliases and byte indexes with
properties. `monster-template-pointer.cocci` types the current NPC template
and preserves signed char views. `monster-table-boundaries.cocci` handles
armor/attack selection, XP, trading words and guarded spell-slot selection.
Unused field aliases have been removed; the base byte-address boundary still
serves remaining raw player/despawn template pointers.

Layout tests check every documented field offset, and `npc_combat` compares
all loaded rows with the independent on-disk byte block. This is stronger
than merely checking a few creature stats.

## UW1 weapon and wearable property rows

`ranged-storage.cocci` and `ranged-properties.cocci` convert the 16 three-byte
ranged rows to `uw_ranged_type_props_t`. The UW1 research spreadsheet identifies
bytes 0/1/2 as damage, projectile speed and an ammo/damage-type selector; ARM
consumers confirm these uses. The selector remains unsigned storage, with the
original explicit signed casts preserved where required. It is not named
"durability" from the less specific DOS format description.

`melee-armor-storage.cocci` and `melee-armor-properties.cocci` convert melee
(16 rows of eight bytes) and wearable (32 rows of four bytes) storage, loaders,
fixed field accesses and row addresses. Melee charge-field interpretations are
still tentative in the reference. Raw attack-data interfaces that can select
either a melee or ranged row retain temporary byte-pointer boundaries.

Byte-index rules divide by the record stride only at audited alias accesses:
all current ranged byte indices are row multiples of three. Mixed declarations
in fixtures were explicitly split before applying storage patches. Preserve
whole-array `sizeof` expressions before creating byte views for I/O.

`npc_combat` invokes the real `load_armor_variant_tables` and compares all
304 bytes against an independent disk read, including the final file offset.
Layout tests verify each field offset. Synthetic semantic tests check coverage,
unrelated-buffer exclusion, signed casts, buffer sizes and idempotence. A repeat
sweep over both source and tests produces no further changes.

## UW1 container, light and animation rows

`container-light-animation-storage.cocci` and
`container-light-animation-properties.cocci` convert container (16 * 3),
light (16 * 2), and animation (16 * 4) tables, fixed fields and loader sizes.
The detailed UW1 container spreadsheet establishes a two-byte acceptance mask
at offset 1; retain the inventory code's signed-short interpretation.
ARM light consumers and shipped data establish decay interval at byte 0 and
brightness at byte 1, despite the general format text describing them in the
opposite order. No lighting or decay arithmetic is changed.

Animation flags occupy the first word; start frame and frame count occupy
bytes 2 and 3. Rules repair the typed row-address form as well as the original
byte-address form, so rule ordering cannot leave raw flag casts behind.
Equipment handling now has typed armor/light-property locals. The generic
class dispatcher still returns an opaque pointer because its eight branches
return different record types; completing its consumers remains in scope.

The real loaders are exercised in `npc_combat`, comparing every container,
light and animation disk byte and final file offsets. `object_layout` checks
sizes/offsets and all 65,536 signed acceptance-word values independently.
Synthetic tests exercise exclusions, signed casts, scoped receiver types,
whole-array sizes, and repeatability.

`scratch-object.cocci` types the shared current-object inspection pointer and
its saved context as common headers, replaces first-word accesses and equips
callers directly from typed return values. The monster property lookup now
uses a typed header local and a typed property row address.

The player field generator also emits full-word rules after its narrower
bitfield rules. These replace reads saved into temporaries and masked updates
at the common-header, goal, status, target and tile-word offsets. For example,
`*(ushort *)((char *)g_player_object + 0x16)` becomes
`g_player_object->tile_word`; the x/y components remain separately named fields.
Synthetic tests cover full-word reads and writes and exclude unrelated buffers.

## Full-word and partial-byte object accesses

`generate_word_access_rules.py` generates `object-word-accesses.cocci` for the
player/current-mobile globals and `header-bytes/*.cocci` for independently
audited common-header receivers. The rules cover full unsigned/signed word
views, byte-pointer/index forms, word-pointer byte views, and partial writes.
Adjacent low/high writes from the same scalar identifier become a single word
assignment. Other partial writes retain their sequencing through named low/high
union members. Signed reads retain their original promotion; signed writes
preserve their low eight bits. Byte aliases do not enlarge any packed record.

The current-mobile extended words are scoped to proven NPC contexts; projectile
coordinates overlap those bytes and must retain the projectile layout. The low
four bits of the NPC tile word are now `npc_path_slot`, confirmed by the cached
walk-path consumers. The rule sweeps use that field for path-slot extraction.

Apply the header rules with:

```
python3 tools/coccinelle/apply_header_field_rules.py \
  --patch-dir tools/coccinelle/header-bytes
```

`object_layout` independently checks every byte/signed/unsigned view against
all 65,536 word values and verifies that partial writes preserve neighboring
bytes. Semantic tests cover paired writes, distinct-source partial writes,
signed reads, index forms, NPC/projectile exclusion and repeatability. This
extends the migration coverage; remaining object roles still require auditing.

The audit also found two legacy scaling errors in
`npc_combat_position_tick` (ARM `FUN_00031214`) and
`npc_combat_disengage_tick` (ARM `FUN_00031a94`). A read-only Ghidra decompile
and instruction dump confirms byte offsets +2 (position), +9 (heading),
+0xb/+0xc (goal/frame), and +0x13..0x19 (motion/animation/path flags).
The existing ushort-pointer boundaries doubled those offsets, including writes
past the 27-byte record. Earlier compatibility sweeps preserved that mistake.

`generate_npc_combat_byte_offsets.py` generates the repair; apply it only via
`apply_npc_combat_byte_offsets.py`, which isolates these two original function
bodies and invokes spatch before reinserting them in place. It also corrects
fields produced from the doubled offsets. Do not apply that context-specific
patch globally. The runner skips already-correct contexts and is idempotent.
The `npc_state` regression exercises all 65,536 goal words, both disengagement
branches and random frame advancement, checking independent bytes plus guards
around the mobile record. A second regression covers combat positioning
across all Z values and frame nibbles, including the flight-pitch threshold,
heading changes and preserved neighboring storage. Synthetic tests verify
the repair leaves unrelated functions untouched.

## Remaining full-goal work

* Finish player packed writes, whole-word reads, local aliases and call interfaces.
* Finish class-relative COMOBJ aliases (`DAT_002034b5`, `_DAT_002035cf`) and
  diagnostic/fixture byte accesses. Preserve the current four-byte interpretation
  of `_DAT_002035cf` until ARM evidence establishes whether it should be a word.
* Type remaining common-object APIs and their callers with `uw_object_hdr_t *`.
  `calculate_object_weight` is converted and has direct branch coverage; its
  existing callers retain temporary explicit header casts.
* Convert NPC and projectile consumers separately with proven pointer roles.
* Recover and convert object movement snapshots and relevant object class records.
* Finish mixed melee/ranged attack-data interfaces and row-relative field accesses.
* Finish food and class-6 scalar property tables and class-dispatch interfaces.
* Finish the player/despawn template pointers and dynamic property accesses.
* Migrate fixtures to typed objects while retaining independent byte-layout tests.
* Remove temporary boundaries; audit all object offsets across all source files.
* Build the game and every unit suite after each sweep. Verify semantic-patch
  coverage and idempotence, not only whether the resulting code compiles.

No game function is moved to a different source file during this work.

Checkpoint validation: game build, all 52 C unit suites, and all nine conversion
tool suites pass. The latest
AddressSanitizer pass covers 16 consumers: npc_state/npc_combat/npc_ai/creatures/
combat/object_layout/object_core/movement/scheduler/spells/chargen/inventory/
lighting/sleep/teleport/babl_vm. This is a checkpoint for continuing the full
migration, not a completion claim.

## Packed-byte reassembly

`generate_packed_reassembly_rules.py` generates `packed-reassembly.cocci`.
Apply with `spatch --sp-file tools/coccinelle/packed-reassembly.cocci src/FILE.c
--no-includes --in-place`; omit `--in-place` to check for remaining conversions.
The rules collapse `CONCAT11` high/low aliases of the same named packed word,
and byte views that reconstruct an existing 16-bit pointer element. The latter
retain an unsigned-short cast, including when the original lvalue is signed.
Identifier constraints exclude receivers with calls or increments. Explicit
function-scoped rules cover audited byte-only object aliases, NPC goal words,
and the two cached-low-byte expressions in the container stacking branch.

The semantic regression compiles and executes both original and converted code
for all 65,536 word values. It checks signed low bytes, signed word promotion,
outer signed casts, member and cast receivers, and container cached bytes.
Mismatched fields/receivers, side effects, and untyped byte buffers remain
unchanged; a second application must produce identical output. Concatenations
that assemble separate values or update only part of a value remain valid.

## Named position operations

`generate_position_field_rules.py` generates `position-fields.cocci` and
`position-dead-temporaries.cocci`. Apply them in that order. Complete
read/modify/write sequences for `zpos`, `heading`, `ypos`, and `xpos` become
bitfield assignments; exact field extraction masks become named reads.
Both whole-word and matching two-byte stores are supported. Fine headings
inserted with `(value & 0xe0) << 2` become `(value >> 5) & 7` assignments.
Receiver and input identifiers exclude calls/increments. Wider insertion masks
are deliberately excluded because they may also change adjacent fields.

The conversion initially preserves the temporary's original packed result.
The cleanup patch removes its reload only where a control-flow match proves it
unused before function exit or an independent overwrite. A conservative RHS
name filter rejects overwrites that read the temporary. Explicitly documented
function/variable pairs cover manually audited goto-heavy NPC routines beyond
the generic pattern's reach. Do not generalize those exceptions to other
functions or variables without checking every path.

Regression coverage compiles and executes original and converted updates for
all 65,536 initial words and twelve input values (including out-of-range values),
checking the changed property, preserved neighboring header fields, returned
packed temporaries, conditional overwrites, wider-mask exclusion, and repeatability.

## Documented field reads and remaining-access inventory

`struct_field_catalog.py` lists the documented packed properties already
present in `uw.h`; reserved fields and the uncertain legacy `npc_hunger` label
are excluded. `generate_named_field_read_rules.py` generates
`named-field-reads.cocci` from that catalog. It covers unsigned/signed word
masks, unsigned/signed byte views, byte casts, and shifted comparisons.
A signed high-word shift is retained unless a mask bounds the result.
Comparisons use exact enumerated constants, so an out-of-field comparison
value cannot accidentally become true after truncation.

`named_struct_fields` compiles and executes original and transformed code
against the actual UW1 structs for 893 read expressions and all 65,536 input
words. It checks that candidates actually become named properties, compares
complete output checksums, preserves signed/cross-field/reserved exceptions,
and verifies repeatability. The independent `object_layout` suite checks the
binary layouts separately.

Run `python3 tools/coccinelle/audit_struct_property_usage.py --json
 tools/coccinelle/struct-property-usage.json` after each sweep. The inventory
tracks remaining named packed views and raw accesses at existing audited
object-pointer sites. It is deliberately a work list: entries are not blanket
exceptions, and it does not prove coverage of unrecorded aliases, tiles,
current-view storage, or property-row pointers that still need auditing.

Remaining work includes multi-field and XOR updates, paired byte stores,
raw aliases and interfaces, scalar-temporary field extraction, and documenting
which surviving whole-word operations are actual encoding/copy boundaries.
The goal is not complete while these remain unreviewed.

## Saved current-NPC aliases and packed writes

`audit_object_roles.py` records `current_mobile_alias` only when every
non-null assignment is the current mobile pointer or another proven saved
alias. Mixed object/accessor aliases remain common-object roles; aliases reused
for unrelated storage are excluded. `generate_current_alias_rules.py` emits
function-scoped `current-aliases/*.cocci`, respecting the original pointer's
byte/word scaling and signed views. It retains the saved pointer, because a
nested operation may change `DAT_0010190c`. NPC contexts are explicitly scoped;
projectile consumers must not inherit NPC fields at overlapping offsets.

`generate_named_field_write_rules.py` emits `named-field-writes.cocci` from
the documented catalog. Complete field insertions, clears, sets and contained
byte XOR updates become named assignments. Matching split-byte stores can be
combined. When the original calculation assigned a temporary, its final packed
value is reloaded after the field assignment so later uses retain their value.
Reserved-bit, cross-field and wider insertion masks remain unchanged. Rules
restrict receivers and insertion values to identifiers to avoid changing
side-effect evaluation. Multi-field and noncanonical sequences remain work.

`named_struct_writes` executes original and converted updates against the
actual UW1 structs for 207 update patterns, every initial word and six insertion
values, including
out-of-range values. It checks neighboring storage and live packed temporaries,
requires conversion of every candidate, and verifies exclusions and idempotence.
`current_object_aliases` uses the real Clang audit on a fixture, verifies mixed
and reused-pointer exclusions, and executes both versions after switching the
global current object to verify saved-pointer identity and word-offset scaling.

## Packed copies and declaration-aware header aliases

`generate_packed_store_rules.py` emits `packed-stores.cocci`. Adjacent low/high
stores of the same scalar become one unsigned 16-bit assignment. Identifier
receivers preserve evaluation counts, and an intervening statement or a
mismatched source prevents conversion. These whole-word operations are genuine
copies/encoding; the temporary remains unchanged. Property table casts use
`uw_object_type_props_t`, rather than the mobile object layout.

`packed_struct_stores` checks 234 combinations of receiver and cast spelling
against the actual structs for all 65,536 low words and both signs, preserving
neighboring storage. It requires coverage and idempotence and excludes mismatched
sources and intervening modifications.

The refreshed header generators consume the current Clang role audit, including
saved current-object aliases. `generate_word_access_rules.py` groups aliases by
both name and declaration type. It can therefore convert bare byte/word indexes
and dereferences without guessing their scaling. A `ushort *` offset of one is
two bytes; a `char *` offset of one is one byte. Signed char address-taking has
its own rule, before read conversion, so the result remains an addressable
lvalue. The semantic regression checks both pointer scales, signed stores,
addresses, unrelated-function exclusions and repeatability.

Named packed-write alternatives are grouped per receiver/property in the
emitter. This retains the same match cases and temporary-preservation behavior
while avoiding a separate rule for every spelling. Run the generators after
refreshing pointer roles, apply header fields before header byte views, then
apply packed stores, named reads and named writes. Review surviving snapshots,
partial-field/multi-field updates, and noncanonical byte copies separately;
these remain active migration work rather than blanket exceptions.

`generate_packed_store_rules.py` also emits `packed-field-copies.cocci`.
Adjacent low/high assignments from the same named source word become one
whole-word assignment, including narrowed whole-word and direct byte-view
sources. Apply with `--all-includes --include-headers-for-types -I . -I src`.
Receiver identifiers exclude side effects, and both writes must copy the same
member from the same source without intervening statements. Review matches
against object roles before applying: this pass assumes valid object records
that are disjoint or identical, not partially overlapping raw buffers or
volatile/device storage. The current matches copy records from object slots
into newly allocated slots in relocation, stack splitting, and traps.

`packed_field_copies` checks all 756 source/destination/cast combinations over
all 65,536 words using the real structs, including self-aliasing pointer forms,
source and neighboring bytes, mismatched-source and intervening-write
exclusions, and idempotence. Twenty paired copies across four game sources
are now whole-word assignments. Mixed-value byte updates remain for a later
property-write pass.

## NPC spawn fields

`generate_npc_spawn_rules.py` emits `npc-spawn-fields.cocci` for
`init_monster_spawn_defaults` (ARM `FUN_0002a35c`). Its caller selects a newly
spawned creature before invoking it. This establishes NPC layout for the saved
scratch pointer within this function; other scratch and projectile consumers
remain separate audits. The pass replaces byte offsets with a typed NPC
pointer, names complete property updates and heading reads, and types the
monster-table row so HP reads use `max_hp` instead of row byte 4. Apply with
`--all-includes --include-headers-for-types -I . -I src`.

The update recipes retain every original packed snapshot, including when an
OR insertion forces a bit that the original clear mask retained. Status bits
4..12 have no documented property names, so their individual clears remain
explicit operations on `status_word`. Masks in motion, animation, attack,
heading and AI control bytes retain their original operations: their complete
bytes have names, but the remaining individual flag meanings are undocumented.
These are specific exceptions, not a claim that the surrounding migration is
complete.

`npc_spawn_fields` checks offset conversions, signed reads/stores/addresses,
table HP signedness, live snapshots, exclusions and idempotence across all
65,536 input words. It extracts the actual game initializer and compares all
27 bytes plus surrounding guards with independently indexed expected bytes
for 65,536 record seeds and 50 random inputs each. Run the same regression
with `--asan` after the `spatch` argument for direct AddressSanitizer coverage.

## NPC death fields

`generate_npc_death_rules.py` emits `npc-death-fields.cocci` for
`initiate_npc_death` and `handle_monster_death` in `src/ai.c`. Their existing
ARM notes establish full-object byte offsets at 0x345bc..0x3462c and
0x34638..0x34648. The rules name HP, identity, animation flags, attack state,
and goal-byte accesses through the original local pointer. Signed reads,
stores, and addresses remain separate so signed values and lvalues survive.
Apply the named-field write rules afterward to clear `npc_animation_frame`
without obscuring the goal/target fields or changing the packed temporary.

`npc_death_fields` checks all 65,536 initial goal words against the actual
mobile-object layout, covering all byte flag values, signed identity reads,
address-taking, neighboring storage, packed temporaries, unrelated-buffer and
projectile exclusions, and idempotence. The function scopes are intentional;
they do not establish NPC layout for other consumers of mobile arena slots.

## Partial-property reads

`generate_partial_field_read_rules.py` emits `partial-field-reads.cocci` for
masked slices contained wholly within a documented property. The subset masks
come from the remaining-access inventory: class/subclass indexes within
`item_id`, reserved flag bits, owner subcodes, quantity/link bits, quality
subcodes, and position slices. A slice of `item_id` still reads `item_id`;
it does not need the surrounding `type_flags` word.

Apply this pass with `--all-includes --include-headers-for-types -I . -I src`,
so Coccinelle knows the actual typedefs without rewriting headers. Do not use
`--no-includes`: without type information it can parse a narrowing byte cast
as part of a member receiver and retain that cast around the wider field.
`python3 tools/coccinelle/apply_partial_field_read_rules.py --in-place`
selects the proven patterns present in each source and supplies those options.
Use `--check` to fail on remaining matches, or omit both flags to preview.

The rules preserve the original slice's bit position when its numeric value
is used for indexing or encoding. Zero comparisons can omit that position.
Signed word and char views are supported only where a final mask discards
sign extension. Masks spanning properties, sign-extension bits outside the
original byte/word, and genuine packed copies remain unchanged. Both pointer
and value receivers retain their original evaluation count.

`partial_field_reads` executes every generated spelling and zero comparison
over all 65,536 input words using the actual object structs. It checks
conversion coverage, identical values, exclusions and repeatability.
