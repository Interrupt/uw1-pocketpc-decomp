"""Name the modulo-16 scheduling phase on proven mobile-object receivers.

Do not match monster-table movement_flags: that byte has different meanings.
The NPC AI advances this phase modulo 16; tick_mobile_objects supplies it to
object_tick_is_due. The spawn initializer clears the same low nibble.
"""
from pathlib import Path
from generate_header_field_rules import regex

HERE = Path(__file__).resolve().parent
SCOPES = [('init_monster_spawn_defaults', 'npc'),
          ('npc_ai_tick', 'DAT_0010190c'),
          ('tick_mobile_objects', 'DAT_0010190c')]


def generate():
    rules = []
    for index, (function, pointer) in enumerate(SCOPES):
        for key, before, after in [
            ('clear', f'{pointer}->movement_flags = {pointer}->movement_flags & 0xf0;',
             f'{pointer}->tick_phase = 0;'),
            ('read', f'{pointer}->movement_flags & 0xf', f'{pointer}->tick_phase'),
        ]:
            rules.append(f'''@phase_{index}_{key} disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "{regex([function])}";
@@
R F(...) {{
<...
- {before}
+ {after}
...>
}}
''')
    return '\n'.join(rules)


if __name__ == '__main__':
    (HERE / 'mobile-tick-phase.cocci').write_text(generate())
