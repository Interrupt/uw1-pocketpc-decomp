"""Name NPC target/goal and frame updates while keeping live scalar snapshots.

Whole-field formulas match adjacent reads/stores without intervening calls.
Saved-alias frame stores are scoped to reviewed functions where the alias is
captured from the current NPC and remains equal through the update.
"""
from pathlib import Path
from generate_projectile_spawn_rules import rule

HERE = Path(__file__).resolve().parent
TARGET_SITES = ['npc_react_to_nearby_player', 'npc_notice_and_idle_tick', 'npc_clear_special_goal']
FRAME_SITES = [('npc_react_to_nearby_player', None),
               ('npc_ai_default_tick', 'npc_rec'),
               ('npc_notice_and_idle_tick', 'iVar2'),
               ('npc_wander_return_home_exact_tick', 'iVar2')]


def generate():
    parts = []
    p = 'DAT_0010190c->'
    for fn in TARGET_SITES:
        parts.append(rule(fn+'_target_player',
                          f'''V = {p}goal_word & 0xf01f;
{p}goal_word_low = (byte)V | 0x10;
{p}goal_word_high = (byte)(char)(V >> 8);''',
                          f'''V = {p}goal_word & 0xf01f;
{p}npc_gtarg = 1;''', 'identifier V;', function=fn))
    for fn, alias in FRAME_SITES:
        low = f'((uw_mobile_object_t *){alias})->' if alias else p
        parts.append(rule(fn+'_frame',
                          f'''S = {p}goal_word;
N = ((int)((S >> 0xc) + 1)) % (4);
V = S & 0xfff;
{low}goal_word_low = (byte)(char)V;
{p}goal_word_high = (byte)(V >> 8) | (byte)(((N & 0xf) << 0xc) >> 8);''',
                          f'''S = {p}goal_word;
N = ((int)({p}npc_animation_frame + 1)) % (4);
V = S & 0xfff;
{p}npc_animation_frame = N & 0xf;''',
                          'identifier S, N, V;', function=fn))
    # The idle branches capture iVar9 after their last callback and both read
    # the same current goal word. No intervening call or store reaches here.
    parts.append(rule('idle_frame',
                      f'''((uw_mobile_object_t *)iVar9)->goal_word_low = (byte)(char)(uVar1 & 0xfff);
{p}goal_word_high = (byte)((uVar1 & 0xfff) >> 8) | (byte)(((uVar7 & 0xf) << 0xc) >> 8);''',
                      f'{p}npc_animation_frame = uVar7 & 0xf;',
                      function='npc_idle_behavior_tick'))
    parts.append(rule('clear_idle_goal',
                      f'''V = {p}goal_word & 0xfff2;
{p}goal_word_low = (byte)V | 2;
{p}goal_word_high = (byte)(char)(V >> 8);''',
                      f'''V = {p}goal_word & 0xfff2;
{p}npc_goal = 2;''', 'identifier V;', function='npc_clear_special_goal'))
    parts.append(rule('clear_level_goal',
                      f'''uVar1 = {p}goal_word;
bVar2 = (byte)uVar1;
{p}goal_word_low = (bVar2 ^ {p}status_word_low) & 0xf ^ bVar2;
{p}goal_word_high = (byte)(char)((ushort)uVar1 >> 8);''',
                      f'''uVar1 = {p}goal_word;
bVar2 = (byte)uVar1;
{p}npc_goal = {p}npc_level;''', function='npc_clear_special_goal'))
    return '\n'.join(parts).replace('uw_object_hdr_t, uw_projectile_object_t;',
                                    'uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;')


if __name__ == '__main__':
    (HERE / 'npc-goal-fields.cocci').write_text(generate())
