"""UW1 48-byte critter records; audited alias indexes are byte row offsets."""
from pathlib import Path

FIELDS = {0:'armor[0]', 1:'armor[1]', 2:'armor[2]', 3:'armor[3]',
          4:'max_hp',5:'strength',6:'dexterity',7:'intelligence',
          8:'effects_flags',9:'race_flags',10:'movement_flags',11:'magic_power',
          12:'movement_speed',13:'trade_level',14:'trade_patience',15:'poison_damage',
          16:'category',17:'equipment_damage',18:'defense',
          28:'morale_flags',29:'detection_ranges',30:'awareness_ranges',31:'missile_wander_flags',
          32:'weapon_loot[0]',33:'weapon_loot[1]',38:'coin_loot',39:'food_loot',
          42:'spells[0]',43:'spells[1]',44:'spells[2]',45:'spell_flags',46:'door_skill',47:'_unknown2f'}
for attack in range(3):
    for part, name in enumerate(['skill','damage','probability']):
        FIELDS[19+attack*3+part]=f'attacks[{attack}].{name}'
ALIASES={
 'g_monster_max_stats_table':4,
 **{f'DAT_{0x1007d0+off:08x}':off for off in [5,8,9,10,13,14,16,17,18,19,29,30,45]}}
rules=[]
for alias,off in ALIASES.items():
    rules.append(f'''@alias_{alias}@
expression E;
@@
- (&{alias})[E]
+ g_monster_type_props[(E) / 0x30].{FIELDS[off]}
''')
rules.append('''@experience_word@
expression E;
typedef ushort;
@@
- *(ushort *)(&DAT_001007f8 + E)
+ g_monster_type_props[(E) / 0x30].experience
''')
for off,field in FIELDS.items():
    for form,suffix in [(f'((byte *)g_monster_type_props)[{off}]','constant'),
                         (f'((byte *)g_monster_type_props)[E * 0x30 + {off}]','row_after'),
                         (f'((byte *)g_monster_type_props)[{off} + E * 0x30]','row_before')]:
        index='0' if suffix=='constant' else 'E'
        rules.append(f'''@byte_{off}_{suffix}@
{'expression E;' if suffix!='constant' else ''}
typedef byte;
@@
- {form}
+ g_monster_type_props[{index}].{field}
''')
Path(__file__).with_name('monster-properties.cocci').write_text('\n'.join(rules))
