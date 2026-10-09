"""Name launch lifetime and saved item heading without using NPC state fields.

Launch receivers are allocated mobile slots; settling copies into a static
header. Byte 26 is accessed only in the existing item-class guards, which
exclude records with other meanings.
Keep the settling word temporary: callers of the recipe may still use it.
"""
from pathlib import Path
from generate_projectile_spawn_rules import rule

HERE = Path(__file__).resolve().parent
SITES = {'drop_held_object_near_player': 'item_use.c',
         'fire_ranged_weapon': 'weapon_swing.c',
         'reallocate_object_to_arena': 'objects.c',
         'settle_mobile_to_immobile': 'ai.c'}


def generate():
    parts = []
    for function, target, source in [
            ('drop_held_object_near_player', 'puVar5', 'held_object'),
            ('fire_ranged_weapon', 'puVar6', 'puVar7')]:
        for key, before, after in [
                ('lifetime', f'*(byte *)({target} + 4) = (byte){source}[2] & 0x3f;',
                 f'((uw_projectile_object_t *){target})->lifetime = ((uw_object_hdr_t *){source})->quality;'),
                ('saved_heading', f'*(byte *)({target} + 0xd) = (byte)({source}[1] >> 7) & 7;',
                 f'((uw_projectile_object_t *){target})->original_heading = ((uw_object_hdr_t *){source})->heading;')]:
            parts.append(rule(function+'_'+key, before, after, function=function))
    parts.append(rule('reallocate_saved_heading',
                      '*(byte *)(puVar2 + 0xd) = ((uw_object_hdr_t *)object)->heading;',
                      '((uw_projectile_object_t *)puVar2)->original_heading = ((uw_object_hdr_t *)object)->heading;',
                      function='reallocate_object_to_arena'))
    parts.append(rule('settle_saved_heading',
                      '''uVar11 = ((uw_object_hdr_t *)puVar9)->position_word & 0xfc7f | ((byte)object[0xd] & 7) << 7;
((uw_object_hdr_t *)puVar9)->position_word = (ushort)uVar11;''',
                      '''((uw_object_hdr_t *)puVar9)->heading = ((uw_projectile_object_t *)object)->original_heading & 7;
uVar11 = ((uw_object_hdr_t *)puVar9)->position_word;''',
                      function='settle_mobile_to_immobile'))
    return '\n'.join(parts)


if __name__ == '__main__':
    (HERE / 'projectile-lifecycle-fields.cocci').write_text(generate())
