# Milestones

Screenshots documenting major visual/functional progress on the port,
kept in-repo (unlike `data/`/`debug/`) so they have permanent history
tied to commits. Named `YYYY-MM-DD-<short-description>.png`.

- `2026-09-04-hud-renders.png` — first full-HUD render with zero crashes:
  a complete demo run (chargen → confirm character → enter dungeon → 11
  more frames → screenshot → exit) completes cleanly. Paperdoll, weapon/
  hand inventory slots, compass gem, backpack grid, hanging potions, rune
  panel, and message bar all render correctly. The central 3D viewport is
  still black — tmap tile rendering is the next task.
