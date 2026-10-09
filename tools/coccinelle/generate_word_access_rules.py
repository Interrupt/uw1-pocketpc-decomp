"""Generate byte/full-word rewrites only at proven object pointer sites.

Adjacent writes of the same scalar value become one word assignment.
Other byte writes retain their sequencing through named union byte views.
Never broaden a byte read to a word read: signed promotion and lvalues matter.
"""
import json
from pathlib import Path
HERE = Path(__file__).resolve().parent
HEADER = {0:'type_flags', 2:'position_word', 4:'chain_word', 6:'link_word'}
MOBILE = {11:'goal_word', 13:'status_word', 15:'target_word', 22:'tile_word'}

def generate(pointer, words, scope=None, typed=False, raw_type=None):
    rules = []
    before = f'R F(...) {{\n<...\n' if scope else ''
    after = '\n...>\n}\n' if scope else ''
    meta = f'type R;\nidentifier F =~ "{scope}";\n' if scope else ''
    byte_pointer = raw_type in ('char *', 'byte *', 'undefined1 *', 'unsigned char *')
    byte_arithmetic = byte_pointer or raw_type == 'void *'
    word_pointer = raw_type in ('ushort *', 'undefined2 *', 'unsigned short *',
                                'short *', 'const ushort *', 'const short *')
    signed_pointer = raw_type in ('short *', 'const short *')
    for offset, field in words.items():
        access = f'{pointer}->{field}' if typed else f'((uw_object_hdr_t *){pointer})->{field}'
        prefix = f'w_{offset}_{len(rules)}'
        # Match only adjacent writes whose RHS is the SAME scalar identifier.
        for lowtype in ['char','byte']:
            for hightype in ['char','byte']:
                rules.append(f'''@{prefix}_pair_{lowtype}_{hightype}@
{meta}typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
{before}- *({lowtype} *)((char *){pointer} + {hex(offset)}) = ({lowtype})V;
- *({hightype} *)((char *){pointer} + {hex(offset+1)}) = ({hightype})(V >> 8);
+ {access} = (ushort)V;
{after}''')
        for type_, suffix in [('ushort',''),('undefined2',''),('short','_signed')]:
            declarations = 'typedef ushort, undefined2, byte, uw_object_hdr_t;'
            variants = [f'*({type_} *)((char *){pointer} + {hex(offset)})',
                        f'*({type_} *)((byte *){pointer} + {hex(offset)})']
            if offset % 2 == 0:
                variants.append(f'(({type_} *){pointer})[{hex(offset//2)}]')
                variants.append(f'*({type_} *)(({type_} *){pointer} + {hex(offset//2)})')
            if byte_arithmetic:
                variants.append(f'*({type_} *)({pointer} + {hex(offset)})')
            if word_pointer:
                variants.append(f'*({type_} *)({pointer} + {hex(offset//2)})')
                if signed_pointer == (type_ == 'short'):
                    variants.append(f'{pointer}[{hex(offset//2)}]')
                    if offset == 0:
                        variants.append(f'*{pointer}')
            rules.append(f'''@{prefix}_word_{type_}@
{meta}{declarations}
@@
{before}(\n'''+ '\n|\n'.join(f'- {v}\n+ {access}{suffix}' for v in variants) + '\n)'+after+'\n')
        for index, suffix in [(offset,'_low'),(offset+1,'_high')]:
            for type_ in ['byte','undefined1','char']:
                variants = [f'*({type_} *)((char *){pointer} + {hex(index)})',
                            f'*({type_} *)((byte *){pointer} + {hex(index)})',
                            f'(({type_} *){pointer})[{hex(index)}]']
                if index % 2 == 0:
                    variants.append(f'*({type_} *)((ushort *){pointer} + {hex(index//2)})')
                    variants.append(f'({type_})((ushort *){pointer})[{hex(index//2)}]')
                if index == 0:
                    variants.append(f'*({type_} *){pointer}')
                if byte_arithmetic:
                    variants.append(f'*({type_} *)({pointer} + {hex(index)})')
                    if byte_pointer and (raw_type == 'char *') == (type_ == 'char'):
                        variants.append(f'{pointer}[{hex(index)}]')
                        if index == 0:
                            variants.append(f'*{pointer}')
                if word_pointer and index % 2 == 0:
                    variants += [f'*({type_} *)({pointer} + {hex(index//2)})',
                                 f'({type_}){pointer}[{hex(index//2)}]']
                variants = list(dict.fromkeys(variants))
                # Signed char writes must be handled before signed reads.
                if type_ == 'char':
                    rules.append(f'''@{prefix}_address_{index}@
{meta}typedef byte, ushort, uw_object_hdr_t;
@@
{before}(\n'''+ '\n|\n'.join(f'- &{v}\n+ (char *)&{access}{suffix}' for v in variants if not v.startswith('(char)'))+'\n)'+after+'\n')
                    rules.append(f'''@{prefix}_store_{index}@
{meta}typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
{before}(\n'''+ '\n|\n'.join(f'- {v} = E;\n+ {access}{suffix} = (byte)E;' for v in variants if not v.startswith('(char)'))+'\n)'+after+'\n')
                read = ('(char)' if type_ == 'char' else '')+access+suffix
                rules.append(f'''@{prefix}_byte_{index}_{type_}@
{meta}typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
{before}(\n'''+ '\n|\n'.join(f'- {v}\n+ {read}' for v in variants)+'\n)'+after+'\n')
    return '\n'.join(rules)

def main():
    # Globals have known types. The extended NPC words are deliberately scoped
    # away from the projectile physics function, whose coordinate words overlap.
    parts=[]
    for name in ['g_player_object','DAT_0010190c']:
        words={off:'hdr.'+field for off,field in HEADER.items()}
        # Distinct rule names for each global, since they share one patch.
        patch=generate(name,words,typed=True)
        parts.append(patch.replace('@w_', '@'+name+'_w_'))
        scope=r'^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$' if name=='DAT_0010190c' else None
        patch=generate(name,MOBILE,scope,typed=True)
        parts.append(patch.replace('@w_', '@'+name+'_mobile_w_'))
    parts.append("""@cached_path_slot@
@@
- DAT_0010190c->tile_word_low & 0xf
+ DAT_0010190c->npc_path_slot
""")
    (HERE/'object-word-accesses.cocci').write_text('\n'.join(parts).rstrip()+'\n')

    # Explicit byte views preserve their cast's scaling. Bare pointer arithmetic
    # and indexes require the original declaration type from the Clang role audit.
    roles=json.loads((HERE/'object-pointer-roles.json').read_text())
    out=HERE/'header-bytes'
    out.mkdir(exist_ok=True)
    for source in roles['sources']:
        groups={}
        for function in source.get('functions',[]):
            for role in function['roles']:
                if '**' not in role['type'] and role['name'] not in ['g_player_object','DAT_0010190c']:
                    groups.setdefault((role['name'], role['type']),[]).append(function['function'])
        patches=[]
        for number,((name, raw_type),functions) in enumerate(groups.items()):
            scope=r'^\(' + r'\|'.join(sorted(set(functions))) + r'\)$'
            patches.append(generate(name,HEADER,scope,raw_type=raw_type).replace('@w_',f'@receiver_{number}_w_'))
        if patches:
            (out/(Path(source['source']).stem+'.cocci')).write_text('\n'.join(patches).rstrip()+'\n')


if __name__ == "__main__":
    main()
