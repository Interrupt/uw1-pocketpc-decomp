"""Name reviewed NPC storage in consumers with otherwise mixed record roles.

Do not apply an NPC extension map to every pointer in these functions.
The exact receiver/access pairs below are justified by their local branches.
Unknown AI bit 0 and status bit 10 keep their masks.
"""
from pathlib import Path
from generate_projectile_spawn_rules import rule

HERE = Path(__file__).resolve().parent
SITES = {'detect_npc_wander_proximity': 'ai.c',
         'npc_ai_default_tick': 'ai.c', 'apply_melee_damage': 'combat.c'}


def generate():
    parts = [rule('wander_saved_ai_byte',
                  '*(byte *)((char *)puVar7 + 0x19)',
                  '((uw_mobile_object_t *)puVar7)->npc_ai_flags',
                  function='detect_npc_wander_proximity')]
    # npc_rec also holds attacker/projectile records elsewhere. This store is
    # immediately after capturing the current NPC and its goal-word snapshot.
    parts.append(rule('npc_animation_snapshot_low',
                      '''npc_rec = (char *)DAT_0010190c;
uVar2 = DAT_0010190c->goal_word;
uw_ord2005_rem_96 = ((int)((uVar2 >> 0xc) + 1)) % (4);
uVar11 = uVar2 & 0xfff;
*(char *)(npc_rec + 0xb) = (char)uVar11;''',
                      '''npc_rec = (char *)DAT_0010190c;
uVar2 = DAT_0010190c->goal_word;
uw_ord2005_rem_96 = ((int)((uVar2 >> 0xc) + 1)) % (4);
uVar11 = uVar2 & 0xfff;
((uw_mobile_object_t *)npc_rec)->goal_word_low = (byte)(char)uVar11;''',
                      function='npc_ai_default_tick'))
    # ushort index 7 is byte 14. Mask 4 observes only the low byte of that
    # unaligned NPC status-word overlap, inside the class-0x40 armor branch.
    parts.append(rule('npc_armor_status_bit', '(puVar6[7] & 4)',
                      '(((uw_mobile_object_t *)puVar6)->status_word_high & 4)',
                      function='apply_melee_damage'))
    return '\n'.join(parts).replace('uw_object_hdr_t, uw_projectile_object_t;', 'uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;')


if __name__ == '__main__':
    (HERE / 'mobile-consumer-fields.cocci').write_text(generate())
