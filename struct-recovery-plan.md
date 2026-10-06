# Struct recovery plan

Goal: replace this file's raw `*(TYPE*)(ptr+N)`/bracket-index offset
arithmetic against "backing array" globals with real named C structs,
the way `uw_object_hdr_t`/`uw_mobile_object_t`/`uw_tile_t` (uw.h,
commit 225333e on `struct-recovery`, branched off `npcs`) started for
the object table and level tilemap.

This is explicitly a multi-session effort — there are ~900
`_backing`-suffixed globals in `uw.c` today, only two logical record
types have real structs so far, and even those two aren't fully
converted (see "Status" below). This doc is the working catalog +
methodology so any session can pick it back up without re-deriving
context.

## Why this is worth doing (and where it stops being worth it)

Two different problems currently hide behind identical-looking
`*(ushort*)(ptr+N)` syntax:
1. **Multi-field records** — an object, a tile, a monster-stat-table
   row, a comobj.dat property row. These benefit hugely from real
   structs: `obj->hdr.heading` catches a wrong offset at compile time,
   documents the field inline, and (with bitfields) is provably
   equivalent to the shift/mask it replaces (see Methodology below).
2. **Plain flat buffers** — a pixel buffer, a glyph-width table, a
   palette. These are already correctly modeled as arrays; there is no
   struct to recover, and most of the ~900 `_backing` globals are
   actually this category (leftovers from the earlier "undersized
   global" sweep, which just needed correct *sizing*, not a record
   type).

**Don't try to structify #2.** The first job of touching any new
`_backing` global is deciding which bucket it's in — see Step 0.

## Status (updated 2026-09-29, code-cleanup-first-pass branch)

Note: uw.c is now being split into src/*.c topic files in parallel
(see the code-cleanup goal) -- `g_current_tile`/`g_level_tiles` and
the raw fields they replace may live in a different file than uw.c by
the time you read this; grep for the symbol name, not a line number.

| Record | Base(s) | Stride | State |
|---|---|---|---|
| `uw_object_hdr_t` | `DAT_002046c4` | 8B | Type defined, bit-verified. `heading` converted project-wide from an earlier pass. **`item_id` reads now converted project-wide this pass** -- every genuine `*ptr & 0x1ff`/CONCAT11-reconstructed/XOR-equality-check read against a real object pointer across the whole `src/` tree (interact.c, combat.c, ai.c, containers.c, object_actions.c, traps.c, movement.c, inventory.c, player.c, objects.c, babl.c, item_use.c, tmap.c, doors.c, hud.c, demomode.c, input.c, level.c, weapon_swing.c, scheduler.c, collision.c), via `((uw_object_hdr_t *)ptr)->item_id` cast at the read site (never retyping the underlying pointer variable, so any `ptr+N` obj_head/next-chain arithmetic on the same pointer elsewhere stays untouched). Writes to `item_id` are explicitly NOT converted (a handful of XOR bit-tricks that compute-and-store a new id) -- deferred to a dedicated writes-focused pass per the methodology's own read/write split. A `grep -rn "& 0x1ff\b" src/*.c` after this pass turns up ~40 remaining hits, every one confirmed NOT item_id: the "link" field (same 9-bit width starting at a different bit offset, e.g. `ptr[3] >> 6 & 0x1ff`), a flat ingredient-combination lookup table (not an object record at all), a resolved sprite/billboard id downstream of the real item_id, `char *`-declared pointers with no established multi-byte-read precedent elsewhere (would silently widen a 1-byte read to 2), a `ce_rand()`-derived camera-shake jitter value, a plain scalar message-id parameter, and the write-prep XOR tricks already mentioned -- see the commit history on `code-cleanup-structs` for the file-by-file reasoning. **`zpos`/`ypos`/`xpos` reads also now converted** across ai.c, collision.c, combat.c, interact.c, item_use.c, object_actions.c, objects.c, scheduler.c, tmap.c, traps.c, containers.c -- `zpos` via `PTR[1] & 0x7f` (word 0x02 low byte), `ypos` via shift=10 (`(word & 0x1c00) >> 10` / `word >> 10 & 7`), `xpos` via shift=13 (`word >> 0xd`). Each shift amount was checked against the real field's own bit position before converting -- two sites in objects.c's compute_object_placement_fields and object_actions.c's randomized-direction write use the SAME bits with DIFFERENT shift amounts (scaled/rebased derived values combining sub-tile position with a tile coordinate, not plain field reads) and were deliberately left raw. **`is_quant` reads also now converted project-wide** (both word-level `*ptr & 0x8000` and byte-level `*(byte*)(ptr+1) & 0x80` encodings, carefully distinguished from the structurally-identical-looking `PTR[1] & 0x80` bracket-index pattern on `ushort*`/`short*` pointers -- which actually lands on word 0x02's low bit, i.e. `heading`'s low bit, not `is_quant` -- and from `uw_tile_t.door_bit` reads through a confirmed tile pointer, both correctly left alone). **`quality`/`owner` reads also now converted** (word 0x04/0x06 low 6 bits) across ai.c, babl.c, containers.c, interact.c, item_use.c, models.c, object_actions.c, objects.c, player.c, scheduler.c, tmap.c, traps.c, weapon_swing.c, including cross-pointer reads (object A's quality read while writing to object B) and the read-only half of combined read-then-OR-with-new-bits write-prep expressions. Left raw: all self-masking writes of the form `*(byte*)(ptr+N) = (byte)ptr[N] & 0x3f [| ...]` (ai.c, babl.c, containers.c, game.c, interact.c, item_use.c, objects.c, traps.c -- these clear/replace bits 6-7 while preserving quality/owner in place, deferred to the writes pass), traps.c's `& 0x3e`/`& 0x2f` sites (different bit ranges, not the plain 0x3f quality/owner mask), and traps.c's cross-pointer XOR comparisons against `DAT_0024cff4` (ambiguous base pointer, not confirmed as an object record at this exact offset). **`next`/`link` are now unblocked and largely converted.** The actual blocker was never the fields themselves, it was `object_list_insert_head`/`object_list_unlink`/`object_list_append_tail`/`resolve_object_link` (objects.c) taking a raw pointer to one of three interchangeable 16-bit "6-bit-preserved-field + 10-bit-chain-index" words (`uw_object_hdr_t.next`, `uw_object_hdr_t.link`, `uw_tile_t.obj_head`) -- a bitfield member has no address to pass as a pointer, so these generic functions could never be typed as `uw_object_hdr_t *`/`uw_tile_t *`. Added `uw_chain_word_t` (uw.h) to name that shared shape without changing any call site's existing pointer arithmetic, then converted all four functions' own internal bit math to use it (`resolve_object_link`'s read; `insert_head`/`append_tail`/`unlink`'s writes, each verified bit-by-bit: the 3-term-XOR-preserves-sibling-field idiom these use is an exact ABI-level match for a plain packed-bitfield assignment). With that in place, swept the whole `src/` tree's `& 0xffc0` sites (ai.c, collision.c, babl.c, containers.c, inventory.c, demomode.c, scheduler.c, interact.c, game.c, player.c) converting every confirmed plain read/write of `next`/`link`/`obj_head` to `->next`/`->link`/`->obj_head`/`uw_chain_word_t.chain`, including several "merge two item stacks' quantities" writes (the struct's own `link` field doubles as quantity when `is_quant` is set) and several disguised quality/owner/next/link=0 clear pairs. Left raw throughout, consistently: self-contained `& 0x8000` bit-9-only tests (a narrower idiom than a full field read/write), masks that don't match 0xffc0/0x3f exactly (different bit ranges), cross-pointer comparisons against an unconfirmed base pointer, and anything identified as belonging to a genuinely different record type (e.g. `g_scheduler_table`'s own 6-word entries, which happen to share the same bit pattern by coincidence, not by being an object/tile record). `combat.c`, `object_actions.c`, `item_use.c`, `objects.c`, `tmap.c`, `traps.c`, `resources.c` still have unconverted `& 0xffc0` sites (~84 remaining across the tree) -- same methodology applies, continue file by file. All write-prep XOR-trick sites for item_id/zpos/is_quant specifically (as opposed to quality/owner/next/link, now substantially converted) remain deferred to a dedicated future writes-focused pass. |
| `uw_mobile_object_t` | `DAT_002046b8` | 27B (0x1b) | Header inherited from above. The 19-byte NPC-extra block has real field names for `npc_yhome`/`npc_xhome`/`npc_heading` only (wiki-sourced, only those 3 cross-checked against real code); `npc_hp`/`npc_goal`/`npc_gtarg`/`npc_level`/`npc_talkedto`/`npc_attitude`/`npc_height`/`npc_hunger`/`npc_whoami` are typed but **unverified against this binary** — confirm each before trusting it for a write. |
| `uw_tile_t` | `DAT_002029cc` | 4B | Type defined, bit-verified. `wall_tex`, `tile_type`, and `floor_height` previously claimed "project-wide" in src/tmap.c, but this pass found and converted 12 more raw `tile_type`/`floor_height`/`floor_tex` read sites the earlier tmap.c-focused sweep missed, outside tmap.c: `ai.c` (resolve_tile_entry_offset's 2 callers, npc_movement_tick's floor-height-via-npc_walk_toward_tile ×3), `movement.c` (can_step_between_tiles' tile_type ×2 and a floor_height-equivalent bit-trick `(x>>1)&0x78`), `collision.c` (collision_build_height_field's direct-dereference case only), `doors.c` (spawn_scheduled_door_texture_object), `item_use.c` (try_climb_wall), `traps.c` (one trap-height-adjust loop), `player.c` (set_player_tile_position -- a direct `DAT_002029cc + i*4` index that bypasses tilemap_lookup entirely, which is presumably why the earlier sweep missed it). All converted via `((uw_tile_t *)ptr)->field` at the read site rather than retyping the existing pointer variable, specifically so obj_head arithmetic on the same pointer (`ptr + 1` for word2) stays untouched -- see "Why not just retype the global" below. Verified via full unit test suite + regression suite incl. `demo_automap.txt` + 7 broader demo scripts, all clean. **`tile_pair_los_blocked` (ai.c ~4661) now converted**: its `tile_type`/`floor_tex`/`floor_height` reads on all three tilemap_lookup results (puVar7/pbVar8/puVar9) across the dense symmetric branches are now `((uw_tile_t *)ptr)->field` casts, including the byte*-declared `pbVar8` case (floor_height lands in the same low byte regardless of pointer width). Left raw: 3 sites using the `& 0xf0` masked-but-unshifted idiom for floor_height (bits 4-7 kept in place for a same-shape downstream comparison, not normalized to 0-15 like the struct field, so not a like-for-like substitution). `collision_neighbor_shade_or_zero`'s 4 call sites in `collision_build_height_field` (collision.c ~221-241) remain raw -- confirmed again this session: the helper returns a detached `ushort` scalar, not a live pointer, so converting cleanly needs either a struct-returning helper (signature change, out of this pass's scope) or punning `&local_var` to `uw_tile_t*` (risks an ASan stack-buffer-overflow if the compiler widens the 2-byte local for the 4-byte struct read) -- deliberately left as documented here rather than forced. **`door_bit` now converted** (its one genuine site, traps.c's `tick_ambient_doors_and_scheduler`) -- confirmed via a full project grep of both the byte-level and word-level encodings that no other tile-pointer `door_bit` reads exist, and that every other `& 0x8000`/`& 0x100` hit in the codebase is either on a confirmed `uw_object_hdr_t.link` high bit (already deliberately deferred) or an unrelated non-tile value. **`unk_light` has zero call sites anywhere** -- nothing to convert. `no_magic` still has its dedicated converted accessor (`tile_is_no_magic`, tmap.c) with no other call sites. `obj_head` still scoped out -- ~70 call sites all go through the generic `object_list_insert_head`/`object_list_unlink` functions, which also operate on `uw_object_hdr_t.next` (offset 6) via the same byte-offset parameter, so converting it means giving those two functions a real dual-purpose signature first, not just a mechanical find/replace. |
| `uw_current_view_t` | `DAT_00086e6c_backing` (single instance, not an array) | 0x2e (46)B of a 64B backing allocation | **Done.** `view_x`/`view_elevation`/`view_y`/`view_facing`/`view_shake_x`/`view_shake_y` (sizeof + offsetof verified against a throwaway harness) converted at all ~90 confirmed direct-dereference call sites across uw.c and 5 src/*.c files. A handful of `iVar = DAT_00086e6c;`-then-offset base-pointer-capture sites (src/tmap.c, uw.c's own update_current_view_from_subject) were deliberately left as raw offset math rather than risk misreading how the captured local is reused later in each function. Two bytes ranges (0x0c-0x0d, 0x10-0x11) and the leading/trailing spans (0x00-0x09, 0x14-0x27) have no confirmed call site and are left as honest `_unkNN` gaps. |
| `g_grtile_registry` (was `DAT_0024e090`) | n/a (flat pointer array, not a multi-field record) | 8B/slot, 65536 slots | **Done.** Retyped from a raw byte buffer with manual `&DAT_0024e090 + slot*8` pointer-cast arithmetic at every access site to a real `void *g_grtile_registry[65536]` array. All 3 writers (`uw_register_gr_entry`, the two grtile-alloc paths in what's now uw.c ~22740/22775) and all 4 readers (`FUN_000408fc`, one high-id fallback branch, and both blit paths in src/bitmap.c) converted; zero raw `DAT_0024e090` access sites remain (`grep -n "DAT_0024e090" uw.c uw.h src/*.c` returns only historical prose explaining the old name). Not really a "record" (single homogeneous pointer field, not multiple named fields) so no struct/bitfield verification step was needed -- this was a mechanical retype, closer to the earlier undersized-global sweep than the object/tile/view struct work above, but listed here since struct-recovery-plan.md's own candidate catalog named it. |
| `uw_object_type_props_t` (comobj.dat per-object-type record, was raw `DAT_00202c9X` offsets) | `DAT_00202c90` | 0xd (13)B | **Partial.** New this pass. `sizeof` verified == 13. Only 2 of the ~10 real sub-fields have real names so far (`is_container` at offset 8 bit 0x80, `has_look_description` at offset 0xb bit 0x10) -- both already had a directly-written comment elsewhere in the codebase naming that exact byte/mask before this pass, meeting the methodology's evidence bar; everything else (offsets 0, 1-2, 3, 4, 5-6, 7, 9, 0xa, 0xc, plus the unconfirmed remaining bits of offsets 8/0xb) is left as honest `_unkNN` gaps even though several are confirmed multi-bit/multi-value fields via mask reads at other call sites. All 9 known read call sites for the 2 named fields are converted to `g_object_type_props[id].field`; no writes exist for either field. Next session: pin down offset 9 (resistance/trap-flag byte, several individual bits already exercised this session -- see trigger_type_flagged_trap_effect/morph_tile_object_state in src/object_actions.c) and offset 0xa (the "!= 2" combine-class byte) next, both have enough call-site evidence already gathered to be low-effort follow-ups. |

`g_mobile_objects`/`g_static_objects`/`g_level_tiles`/`g_current_tile`
typed-view macros exist in uw.c and are safe to use for new code today.

## Step 0: survey pass (do this before picking the next record type)

`grep -n -iE "byte[- ]stride|byte record|per-object-type|per-tile record|
per-part record|per-point record|per-entry record|-byte table"  uw.c`
is the fast first pass — it already surfaced the candidates in the
table below from comments this project wrote for other reasons (mostly
the undersized-global sweep). It is **not exhaustive**: plenty of
record-shaped data has no comment using one of those phrasings. A
fuller survey should also:
- grep for repeated `* 0x` / `<< 0x` stride-multiply patterns against
  the same base pointer (`grep -n "DAT_XXXXXXXX + .* \* 0x"`) — this
  catches strided access even where no one ever wrote "N-byte record"
  in a comment.
- Cross-check anything found against `_backing` array sizes: a
  `_backing[8192]` array that's actually indexed `base[i*13]` for a
  13-byte record only has ~630 real records, which is worth confirming
  matches the domain (630 doesn't obviously correspond to anything —
  8192 was probably just a round "big enough" guess from the earlier
  sweep, not the real record count; sizing it exactly is part of doing
  the struct properly).
- Skip anything with fewer than ~5 call sites touching offsets past 0 —
  not enough payoff to justify a whole struct + verification pass; a
  couple of named `#define` accessors is enough.

### First-pass candidate catalog (unranked, from Step 0's grep today)

| Candidate | Base | Stride | Evidence | Notes |
|---|---|---|---|---|
| Visible-tile cache record | `DAT_000bc038` family | 0x88 (136)B | Strong — comment gives exact byte span 0..0x87, confirms via render_visible_tile_list's `local_7c*0x88[+off]` | Large field count likely; worth a sub-survey of which of the ~40 formerly-separate globals map to which offset before defining the struct |
| `g_monster_max_stats_table` | `DAT_001007d4` | 0x30 (48)B | Medium — only byte 0 (max HP) is named; rest undocumented | Low call-site count so far (mostly `restore_stat_capped`); confirm real field count before investing |
| ~~comobj.dat object-type property record~~ | `DAT_00202c90` | 0xd (13)B | **Started** — see `uw_object_type_props_t` in the Status table above | ~~High leverage: touches `dispatch_object_action` and other frequently-read gameplay logic~~ |
| Collision candidate record | `DAT_00202c38` | 6B | Strong — exact struct described in comment | Used by `collision_height_envelope`/`FUN_00051dd0`, a hot path — extra care on write sites |
| Model PARTS record | `parse_e_model_file`'s output, offset 0xc14+p\*0x60 | 0x67(103)B *or* stride disagreement, see below | Strong on layout, but **zero runtime consumers** (Mystery 1) | Low priority: correctness-neutral, code-clarity-only. Two comments (lines ~935 and ~7747) disagree on POINT stride (0x2c vs 0xc) — resolve that discrepancy before defining the struct, don't guess |
| Model POINTS record | same parser, offset 8+i\*0xc | 0xc (12)B (3 floats) | Strong | Same low-priority note as above |
| 16-slot 8-byte record table | ~uw.c:25751 | 8B | Needs read — comment mentions "last-update clock, a rate value" | Investigate before scoring |
| 0x12-byte record | ~uw.c:2881, 33811 | 0x12 (18)B | Needs read | Investigate before scoring |
| 0x15-byte record | ~uw.c:52363 | 0x15 (21)B | Needs read | Investigate before scoring |
| 0x42-byte-stride buffer | ~uw.c:52549 | 0x42 (66)B | Needs read | Investigate before scoring |
| 8 contiguous 0x14-byte records | ~uw.c:16893 | 0x14 (20)B | Needs read | Investigate before scoring |
| 4x 0x28-byte records | ~uw.c:60855 | 0x28 (40)B | Needs read, comment says "fixed-width" | Small, bounded (only 4 entries) — likely quick |
| 0x804-byte stride record | ~uw.c:5866 | 0x804 (2052)B | Needs read | Unusually large stride, investigate what this actually is first |
| ~~"current view" record~~ | `DAT_00086e6c` | 0x2e (46)B, single instance not an array | **Done** — see Status table above | ~~Not an array — a single-instance struct overlay, different shape of conversion~~ |

The last dozen rows need someone to actually read the surrounding code
before they're plannable — this table is Step 0's output, not a
finished backlog.

## Methodology (repeat this per record type)

This is exactly what commit 225333e did for the object header and
tile record; do the same steps for each new type.

1. **Pin the layout.** Prefer, in order: (a) an external reference doc
   if one exists and covers this record (uw-formats.txt covers
   objects/tiles; nothing else in this project has an external spec
   yet), (b) this file's own already-written "N-byte-stride record"
   comments, (c) fresh tracing of real field-access expressions. Cross-
   check (a) against (c) before trusting it — this session found the
   wiki's object/tile tables matched this binary exactly, but treat
   that as this-binary-specific luck, not a general guarantee for
   other record types or other reference docs.
2. **Write the struct in `uw.h`**, `__attribute__((packed))`, bitfields
   for sub-byte fields. Name only fields you have real evidence for;
   leave everything else as raw `unsigned char _unkNN[...]` /
   `unsigned short _padNN : W` — an honest gap beats a guessed name.
3. **Verify `sizeof` matches the known stride exactly.** A mismatch
   here means a bitfield width or a gap is wrong — don't proceed until
   this passes.
4. **Verify bit-for-bit equivalence**, not just size. Build a small
   throwaway harness (the pattern from this session's
   `/tmp/bitfield_verify.c`, not currently checked in) that sweeps the
   field's value domain and compares every named field's extraction
   against the original shift/mask expression it's replacing. Do this
   *before* converting any call site — it's the thing that actually
   catches a bitfield-order mistake, sizeof alone won't.
5. **Add a non-breaking typed-view macro** (`g_whatever`) over the
   existing raw base pointer. Never change an existing accessor
   function's return type or a global's declared type as part of this
   step — that breaks every untouched call site's pointer arithmetic
   in one shot (see "Why not just retype the global" below).
6. **Convert call sites in two passes, reads then writes.**
   - Reads first: mechanically find candidates by grepping the exact
     shift/mask expression (e.g. `grep -n ">> 7 & 7\b"` found every
     heading read this session). Hand-verify each site's pointer type
     before converting — `ushort*`, `byte*`, and `char*` base pointers
     all need different offset arithmetic, and this codebase has a
     documented history of exactly this class of bug (pointer-scaling
     truncation). Skip (flag, don't force) any site already entangled
     with a separate known bug (e.g. a pointer-truncation bug feeding
     the offset) — fix that bug in its own commit first.
   - Writes second, individually, more carefully. A read that maps to
     the wrong field just produces a wrong *value* (loud, usually
     caught by regression tests or visual inspection). A write that
     maps to the wrong field position or width can *corrupt* an
     adjacent field silently. Never batch-convert writes with a blind
     find/replace the way this session did for the (read-only)
     wall-texture sites.
7. **Test after every batch, not just at the end**: `./build.sh` clean,
   then `./run-regressions.sh` (all 6 fast scripts every batch;
   `demo_automap.txt` explicitly before calling a tile-record type
   "done", since it's the one script that walks the whole map). For
   anything render-visible, spot check with the existing debug-dump
   env vars (`UW_DEBUG_DUMP_TMAP`, `UW_DEBUG_MODEL`, `UW_DEBUG_DOOR`,
   `UW_DEBUG_OBJCLASS`, etc.) rather than trusting exit codes alone —
   the regression suite catches crashes, not "the torch renders one
   tile off."
8. **Commit per record type** (or per meaningful batch within a large
   one), documenting exactly what's converted vs. still raw, same
   style as 225333e — so the "Status" table above stays truthful and
   the next session doesn't have to re-audit what got done.
9. **"Done" for a record type** means: zero remaining raw offset
   accesses against its base pointer(s) anywhere in `uw.c` (verify with
   `grep -n "BASE_PTR *[+\[]"` returning nothing but the struct
   definition/typed-view macro itself), and the old `_backing` array +
   its `#define` alias collapsed away if nothing references it raw
   anymore.

### Why not just retype the global

The tempting shortcut — change e.g. `char *DAT_002046c4;` to
`uw_object_hdr_t *DAT_002046c4;` and let the compiler force every call
site to be fixed — doesn't work here: this codebase's own established
convention (documented at `g_player_object`'s declaration, uw.c ~386)
is that *every* existing raw-offset call site already explicitly casts
to `(char *)` first specifically so the base pointer's own declared
type doesn't matter to their arithmetic. Retyping the global doesn't
make those sites fail to compile (so the compiler won't find them for
you) — bracket-index sites (`ptr[N]`, relying on the *old* type's
implicit scaling) are the ones that would silently break, and they're
exactly the sites hardest to grep for reliably. Convert call sites
deliberately (step 6) instead of relying on a type change to surface
them.

## Suggested order for the next sessions

1. ~~**Finish `uw_tile_t`**~~ — **DONE**: `tile_type`/`floor_height`/
   `floor_tex`/`door_bit` reads converted project-wide, including
   `tile_pair_los_blocked`'s dense branches and the one genuine
   `door_bit` site; `unk_light` confirmed to have zero call sites.
   Remaining raw by design: `collision_neighbor_shade_or_zero`'s 4
   scalar-return call sites (see the Status table row for why), the
   `& 0xf0` masked-but-unshifted floor_height idiom, and `obj_head`
   (needs the chain-function signature work below).
2. ~~**Finish `uw_object_hdr_t`'s remaining fields**~~ — **DONE** for
   all cleanly-isolable reads: `item_id`, `zpos`/`ypos`/`xpos`,
   `quality`/`owner`, `is_quant` all converted project-wide across
   ~300+ call sites. Remaining raw by design: `next`/`link` (needs the
   chain-function signature work below) and all write-prep XOR-trick
   sites for every field (deferred to a dedicated writes pass).
3. ~~**Give `object_list_insert_head`/`object_list_unlink`/
   `resolve_object_link` a real dual-purpose signature**~~ — **DONE**:
   added `uw_chain_word_t` (uw.h) rather than retyping these
   functions' parameters (a bitfield has no address, so the
   byte*/ushort* parameter shape has to stay); converted all four
   functions' own internal bit math to use it. This unblocked
   `next`/`link`/`obj_head` directly, and a project-wide `& 0xffc0`
   sweep has converted most of their call sites too (ai.c,
   collision.c, babl.c, containers.c, inventory.c, demomode.c,
   scheduler.c, interact.c, game.c, player.c done; combat.c,
   object_actions.c, item_use.c, objects.c, tmap.c, traps.c,
   resources.c still have ~84 remaining raw sites — same methodology,
   continue file by file).
4. **A dedicated writes-focused pass** for `uw_object_hdr_t` — the
   remaining `*(byte*)(ptr+N) = (byte)ptr[N] & MASK [| ...]`
   self-masking write sites for `item_id`/`zpos`/`is_quant`
   specifically (quality/owner/next/link's own write sites are now
   substantially converted, see the Status table row and the
   `code-cleanup-structs` commit history for the full per-field
   list). Needs its own care because, unlike reads, getting the
   written bits wrong is a silent correctness bug instead of a
   compile error — though the merge-sum and field-clear writes
   converted so far show the same bit-level-proof technique works
   reliably for writes too, not just reads.
5. **comobj.dat property record** (0xd bytes) — next-highest leverage
   after the two now-mostly-done types: well-documented, touches
   gameplay-visible logic (`dispatch_object_action`), bounded call-site
   count.
6. **Collision candidate record** (6 bytes) — small, well-documented,
   but on a hot path (movement collision) — extra regression care
   (run the slower demo scripts too, not just the default 6).
7. **Visible-tile cache record** (0x88/136 bytes) — biggest of the
   well-documented candidates; do this once steps 3-6 have re-proven
   the methodology a few more times.
8. Everything else in the "needs read" rows of the Step 0 table —
   investigate each before scheduling, some may turn out tiny (the
   0x28-byte×4 table looks like a quick win) and some may not be real
   records at all.
7. Model PARTS/POINTS structs — deliberately last: zero runtime
   consumers means zero correctness payoff, this is pure code-clarity
   work and the stride discrepancy (0x2c vs 0xc for POINTS) needs
   resolving first regardless.

Re-run Step 0's survey periodically — new `_backing` globals appear as
other unrelated fixes land, and some of today's "needs read" rows may
turn out to already be covered once someone looks.
