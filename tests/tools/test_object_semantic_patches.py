"""Check semantic-patch coverage, unrelated-buffer exclusion and repeatability."""
import pathlib
import subprocess
import sys
import tempfile

root = pathlib.Path(__file__).resolve().parents[2]
spatch = sys.argv[1]


def transform(patch, path):
    result = subprocess.run([spatch, '--sp-file', str(root / 'tools/coccinelle' / patch),
                             str(path), '--no-includes', '--in-place'],
                            text=True, capture_output=True)
    assert result.returncode == 0, result.stdout + result.stderr


with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text('''
typedef unsigned short ushort;
typedef unsigned char byte;
typedef unsigned char undefined1;
void player(ushort *tile) {
  int a = *g_player_object & 0x1ff;
  int b = g_player_object[1] >> 13;
  int c = *(ushort *)((char *)g_player_object + 0x16) >> 10;
  int d = *(byte *)((char *)g_player_object + 8);
  int e = tile[1] >> 13;
  *(char *)((char *)g_player_object + 8) = -1;
}
''')
    transform('player-fields.cocci', path)
    result = path.read_text()
    for field in ['hdr.item_id', 'hdr.xpos', 'npc_xhome', 'npc_hp']:
        assert 'g_player_object->' + field in result, result
    assert 'tile[1] >> 13' in result, result
    assert 'npc_hp = (byte)-1' in result, result
    transform('player-fields.cocci', path)
    assert path.read_text() == result, 'player field patch is not idempotent'

    path.write_text('''
typedef unsigned short ushort;
typedef unsigned char byte;
void props(int id) {
  int a = (&DAT_00202c90)[id * 0xd];
  int b = *(ushort *)(&DAT_00202c91 + id * 0xd) >> 4;
  int c = (&DAT_00202c91)[id * 0xd] & 7;
  int d = (&DAT_00202c9b)[id * 0xd] & 0xf;
  int iVar5 = id * 0xd;
  int e = (&DAT_00202c93)[iVar5];
  int f = unrelated[id * 0xd];
}
''')
    for patch in ['object-properties.cocci', 'property-fields.cocci']:
        transform(patch, path)
    result = path.read_text()
    for field in ['height', 'unit_weight', 'collision_radius', 'quality_type', 'flags']:
        assert '.' + field in result, result
    assert 'unrelated[id * 0xd]' in result, result
    assert 'DAT_00202c9' not in result, result
    for patch in ['object-properties.cocci', 'property-fields.cocci']:
        transform(patch, path)
    assert path.read_text() == result, 'property patches are not idempotent'


with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'weight.c'
    path.write_text('''
typedef unsigned int uint;
typedef unsigned short ushort;
uint calculate_object_weight(ushort *object) {
  ushort uVar1;
  uVar1 = *object;
  int id = uVar1 & 0x1ff;
  if ((uVar1 & 0x8000) == 0) {
    if ((object[3] & 0xffc0) != 0) use_link(object + 3);
  }
  if ((object[3] & 0x8000) != 0) return id;
  return object[3] >> 6;
}
''')
    transform('object-weight.cocci', path)
    result = path.read_text()
    assert 'uw_object_hdr_t *object' in result, result
    assert 'uVar1' not in result and 'object[' not in result, result
    assert 'object->item_id' in result and 'object->link_word' in result, result
    transform('object-weight.cocci', path)
    assert path.read_text() == result, 'object-weight patch is not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'returns.c'
    names = [
        'alloc_object_slot', 'resolve_object_link',
        'get_object_record_by_slot_index', 'spawn_new_object',
        'spawn_object_near_player', 'find_object_in_world',
        'find_object_in_chain', 'find_object_by_encoded_slot_in_chain',
        'reallocate_object_to_arena', 'settle_dropped_object',
        'get_equipped_item_at_slot',
    ]
    path.write_text('typedef unsigned short ushort;\n' + ''.join(
        'char *' + name + '(int slot);\n'
        'char *' + name + '(int slot) { return 0; }\n'
        for name in names
    ) + 'char *read_text(int slot) { return 0; }\n')
    transform('object-returns.cocci', path)
    result = path.read_text()
    for name in names:
        assert result.count('uw_object_hdr_t *' + name + '(') == 2, result
    assert 'char *read_text(' in result, result
    transform('object-returns.cocci', path)
    assert path.read_text() == result, 'object return patch is not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'chain.c'
    path.write_text('''
typedef unsigned short ushort;
typedef unsigned char byte;
typedef struct header uw_object_hdr_t;
uw_object_hdr_t *find_object_in_chain(void *link_cursor_ptr, int recurse) {
  ushort **link_cursor = (ushort **)link_cursor_ptr;
  ushort *puVar1;
  ushort *puVar2;
  ushort *local_28;
  puVar1 = (ushort *)resolve_object_link(*link_cursor);
  if (puVar1 != (ushort *)0x0) {
    if ((puVar1[3] & 0xffc0) != 0) local_28 = puVar1 + 3;
    puVar1 = (ushort *)resolve_object_link(puVar1 + 2);
    return puVar1;
  }
  return (ushort *)0x0;
}
void unrelated(ushort *puVar1) { use(puVar1 + 3); }
''')
    transform('core-object-receivers.cocci', path)
    transform('object-link-interfaces.cocci', path)
    result = path.read_text()
    for text in ['uw_object_hdr_t *puVar1', 'uw_object_hdr_t *puVar2',
                 'ushort **link_cursor_ptr', 'ushort *local_28',
                 'puVar1->link != 0', '&puVar1->link_word',
                 '&puVar1->chain_word', 'use(puVar1 + 3)']:
        assert text in result, result
    for patch in ['core-object-receivers.cocci', 'object-link-interfaces.cocci']:
        transform(patch, path)
    assert path.read_text() == result, 'chain receiver patches are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'packed.c'
    path.write_text('''
typedef unsigned short ushort;
typedef struct header uw_object_hdr_t;
void sum_container_weight(ushort *root, short *weight) {
  ushort *puVar2;
  puVar2 = resolve_object_link(root);
  int kind = *puVar2;
  puVar2[1] = 0x6c00;
  use(puVar2[2], puVar2[3]);
}
void unrelated(ushort *puVar2) { use(*puVar2, puVar2[3]); }
''')
    transform('header-words/containers.cocci', path)
    result = path.read_text()
    for field in ['type_flags', 'position_word', 'chain_word', 'link_word']:
        assert '->' + field in result, result
    assert 'use(*puVar2, puVar2[3])' in result, result
    transform('header-words/containers.cocci', path)
    assert path.read_text() == result, 'whole-word patches are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'mobile.c'
    path.write_text('''
typedef unsigned short ushort;
typedef unsigned char byte;
typedef unsigned char undefined1;
typedef unsigned short undefined2;
typedef struct mobile uw_mobile_object_t;
ushort *DAT_0010190c;
void npc_idle_behavior_tick(void) {
  int hp = *(byte *)((char *)DAT_0010190c + 8);
  *(byte *)((char *)DAT_0010190c + 0x15) = 3;
  int goal = *(ushort *)((char *)DAT_0010190c + 0xb) & 15;
  int tx = DAT_0010190c[11] >> 10;
  int raw = DAT_0010190c[5];
  use(DAT_0010190c + 5);
}
void mobile_object_tick(void) {
  int precise = *(ushort *)((char *)DAT_0010190c + 0xb) & 15;
}
''')
    for patch in ['current-mobile-object.cocci', 'current-mobile-fields.cocci']:
        transform(patch, path)
    result = path.read_text()
    for text in ['uw_mobile_object_t *DAT_0010190c', 'DAT_0010190c->npc_hp',
                 'DAT_0010190c->animation_flags = 3', 'DAT_0010190c->npc_goal',
                 'DAT_0010190c->npc_xhome', '((ushort *)DAT_0010190c)[5]',
                 '(ushort *)DAT_0010190c + 5']:
        assert text in result, result
    assert 'int precise = *(ushort *)((char *)DAT_0010190c + 0xb) & 15' in result, result
    for patch in ['current-mobile-object.cocci', 'current-mobile-fields.cocci']:
        transform(patch, path)
    assert path.read_text() == result, 'current-mobile patches are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'monsters.c'
    path.write_text('''
typedef unsigned char undefined1;
typedef unsigned char byte;
typedef unsigned short ushort;
typedef struct props uw_monster_type_props_t;
undefined1 DAT_001007d0_backing[3072];
char *DAT_00101404;
void stats(int id) {
  use(sizeof DAT_001007d0_backing);
  use(sizeof(DAT_001007d0_backing));
  int hp = (&g_monster_max_stats_table)[id * 48];
  int defense = (&DAT_001007e2)[id * 48];
  int xp = *(ushort *)(&DAT_001007f8 + id * 48);
  int signed_hp = *(char *)(DAT_00101404 + 4);
  int skill = *(byte *)(id * 3 + DAT_00101404 + 19);
}
''')
    patches = ['monster-storage.cocci', 'monster-properties.cocci',
               'monster-template-pointer.cocci', 'monster-table-boundaries.cocci']
    for patch in patches:
        transform(patch, path)
    result = path.read_text()
    for text in ['uw_monster_type_props_t g_monster_type_props[64]',
                 'sizeof g_monster_type_props', '.max_hp', '.defense', '.experience',
                 'uw_monster_type_props_t *DAT_00101404',
                 '*(char *)&DAT_00101404->max_hp', 'DAT_00101404->attacks[id].skill']:
        assert text in result, result
    assert 'DAT_001007d0_backing' not in result, result
    assert result.count('sizeof g_monster_type_props') == 2, result
    assert 'sizeof(' not in result, result
    for patch in patches:
        transform(patch, path)
    assert path.read_text() == result, 'monster patches are not idempotent'

print('UW1 object semantic patches: coverage and idempotence passed')

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text("""
typedef unsigned char byte;
typedef unsigned char undefined1;
typedef struct { byte damage, projectile_speed, ammo_damage_selector; } uw_ranged_type_props_t;
undefined1 DAT_002027d0_backing[48];
void example(int file, int row, int byte_index, byte *unrelated) {
    int damage = (&DAT_002027d0)[row * 3];
    int speed = (&DAT_002027d1)[row * 3];
    int selector = (char)(&DAT_002027d2)[byte_index];
    char *record = &DAT_002027d0 + row * 3;
    int other = unrelated[row * 3];
    read_file_handle(file, &DAT_002027d0, 0x30);
    memset(DAT_002027d0_backing, 0, sizeof(DAT_002027d0_backing));
    memset(DAT_002027d0_backing, 0, sizeof DAT_002027d0_backing);
}
""")
    for patch in ['ranged-properties.cocci', 'ranged-storage.cocci']:
        transform(patch, path)
    result = path.read_text()
    for field in ['damage', 'projectile_speed']:
        assert 'g_ranged_type_props[row].' + field in result, result
    assert 'ammo_damage_selector' in result and '(char)' in result, result
    assert 'unrelated[row * 3]' in result, result
    assert 'DAT_002027d0_backing' not in result, result
    assert result.count('sizeof g_ranged_type_props') == 3, result
    for patch in ['ranged-properties.cocci', 'ranged-storage.cocci']:
        transform(patch, path)
    assert result == path.read_text(), 'ranged patches are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text("""
typedef unsigned char byte;
typedef unsigned char undefined1;
typedef struct { byte fields[8]; } uw_melee_type_props_t;
typedef struct { byte fields[4]; } uw_armor_type_props_t;
undefined1 DAT_00202800_backing[256];
extern undefined1 DAT_00202750_backing[128];
void example(int file, int row, byte *unrelated) {
    int skill = (&DAT_00202806)[row * 8];
    int durability = (char)DAT_00202807[row * 8];
    int protection = (&DAT_00202750)[row * 4];
    int armor_durability = (&DAT_00202750)[row * 4 + 1];
    int unknown = (&DAT_00202750)[row * 4 + 2];
    int slot = (&DAT_00202750)[row * 4 + 3];
    char *melee = &DAT_00202800 + row * 8;
    char *armor = &DAT_00202750 + row * 4;
    int other = unrelated[row * 4];
    read_file_handle(file, &DAT_00202800, 0x80);
    read_file_handle(file, &DAT_00202750, 0x80);
    memset(DAT_00202800_backing, 0, sizeof(DAT_00202800_backing));
    memset(DAT_00202750_backing, 0, sizeof DAT_00202750_backing);
}
""")
    patches = ['melee-armor-properties.cocci', 'melee-armor-storage.cocci']
    for patch in patches:
        transform(patch, path)
    result = path.read_text()
    for field in ['skill', 'durability']:
        assert 'g_melee_type_props[row].' + field in result, result
    for field in ['protection', 'durability', '_unknown02', 'equipment_slot']:
        assert 'g_armor_type_props[row].' + field in result, result
    assert 'DAT_00202800_backing' not in result, result
    assert 'DAT_00202750_backing' not in result, result
    assert 'unrelated[row * 4]' in result, result
    assert result.count('sizeof g_melee_type_props') == 2, result
    assert result.count('sizeof g_armor_type_props') == 2, result
    for patch in patches:
        transform(patch, path)
    assert result == path.read_text(), 'melee/armor patches are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text("""
typedef unsigned char byte;
typedef unsigned char undefined1;
typedef unsigned short ushort;
typedef struct { byte capacity; ushort acceptance_mask; } uw_container_type_props_t;
typedef struct { byte decay_interval, brightness; } uw_light_type_props_t;
typedef struct { ushort flags; byte start_frame, frame_count; } uw_animation_type_props_t;
typedef struct { byte protection, durability, unknown, equipment_slot; } uw_armor_type_props_t;
undefined1 DAT_002029f8_backing[256];
undefined1 DAT_002029d8_backing[256];
undefined1 DAT_00250730_backing[128];
void example(int file, int row, int offset, byte *unrelated) {
    int capacity = (&g_carry_weight_limit_table)[row * 3];
    int accepted = (unsigned int)*(short *)(&DAT_002029f9 + offset);
    int decay = (&g_light_radius_table)[row * 2];
    int flags = *(ushort *)(&DAT_00250730 + row * 4);
    int other_flags = *(ushort *)(&DAT_00250730 + offset);
    int start = (char)(&DAT_00250732)[offset];
    int count = (&DAT_00250733)[offset];
    int other = unrelated[row * 4];
    read_file_handle(file, &g_carry_weight_limit_table, 0x30);
    read_file_handle(file, &g_light_radius_table, 0x20);
    read_file_handle(file, &DAT_00250730, 0x40);
    memset(DAT_00250730_backing, 0, sizeof(DAT_00250730_backing));
}
int check_object_fits_in_slot(void) {
    char *effect_ptr;
    effect_ptr = (char *)get_scanned_object_class_effect_ptr();
    return *(char *)(effect_ptr + 3);
}
void refresh_player_equipment_effects(void) {
    byte *iVar7;
    iVar7 = get_scanned_object_class_effect_ptr();
    int brightness = iVar7[1];
}
int unrelated_function(byte *iVar7, char *effect_ptr) {
    return iVar7[1] + *(char *)(effect_ptr + 3);
}
""")
    patches = ['container-light-animation-properties.cocci',
               'container-light-animation-storage.cocci']
    for patch in patches:
        transform(patch, path)
    result = path.read_text()
    for field in ['capacity', 'acceptance_mask']:
        assert '.' + field in result, result
    assert 'g_light_type_props[row].decay_interval' in result, result
    assert 'g_animation_type_props[row].flags' in result, result
    assert '*(ushort *)(&g_animation_type_props' not in result, result
    assert '.start_frame' in result and '.frame_count' in result, result
    assert 'uw_armor_type_props_t *effect_ptr;' in result, result
    assert 'effect_ptr->equipment_slot' in result, result
    assert 'uw_light_type_props_t *iVar7;' in result, result
    assert 'iVar7->brightness' in result, result
    assert 'return iVar7[1] + *(char *)(effect_ptr + 3);' in result, result
    assert 'unrelated[row * 4]' in result, result
    assert result.count('sizeof g_animation_type_props') == 2, result
    for patch in patches:
        transform(patch, path)
    assert result == path.read_text(), 'container/light/animation patches are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text("""
typedef unsigned short ushort;
typedef unsigned char byte;
typedef struct { ushort type_flags; unsigned item_id; } uw_object_hdr_t;
ushort *g_scratch_object_ptr;
extern ushort *g_scratch_object_ptr;
void refresh_player_equipment_effects(ushort *puVar6) {
    g_scratch_object_ptr = puVar6;
    g_scratch_object_ptr = (ushort *)get_equipped_item_at_slot(4);
    int id = *g_scratch_object_ptr & 0x1ff;
    int flags = *(ushort *)g_scratch_object_ptr;
    int first_byte = *(byte *)g_scratch_object_ptr;
    int present = g_scratch_object_ptr != (ushort *)0x0;
}
void save_context(char *pObj) {
    ushort *saved_scratch;
    saved_scratch = g_scratch_object_ptr;
    g_scratch_object_ptr = (ushort *)pObj;
    g_scratch_object_ptr = saved_scratch;
}
int unrelated(ushort *object) { return *object & 0x1ff; }
void *class1_variant_effect_table_lookup(void) {
    byte *pbVar3;
    pbVar3 = (byte *)g_scratch_object_ptr;
    int family = (*pbVar3 & 0x30) >> 4;
    int nibble = *pbVar3 & 0xf;
    return &DAT_001007d0 + (family * 16 + nibble) * 0x30;
}
""")
    transform('scratch-object.cocci', path)
    result = path.read_text()
    assert 'uw_object_hdr_t *g_scratch_object_ptr;' in result, result
    assert 'uw_object_hdr_t *saved_scratch;' in result, result
    assert 'g_scratch_object_ptr->item_id' in result, result
    assert 'g_scratch_object_ptr->type_flags' in result, result
    assert 'g_scratch_object_ptr = get_equipped_item_at_slot(4);' in result, result
    assert 'return *object & 0x1ff;' in result, result
    assert 'uw_object_hdr_t *pbVar3;' in result, result
    assert 'pbVar3->type_flags' in result, result
    assert '&g_monster_type_props[' in result, result
    transform('scratch-object.cocci', path)
    assert result == path.read_text(), 'scratch object patch is not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text("""
typedef unsigned short ushort;
typedef unsigned char byte;
void words(ushort *unrelated) {
    ushort tile = *(ushort *)((char *)g_player_object + 0x16);
    ushort position = *(ushort *)((char *)g_player_object + 2);
    ushort chain = ((ushort *)g_player_object)[2];
    ushort goal = *(ushort *)((byte *)g_player_object + 0xb);
    ushort status = *(ushort *)((char *)g_player_object + 0xd);
    ushort target = *(ushort *)((char *)g_player_object + 0xf);
    *(ushort *)((char *)g_player_object + 0x16) = tile;
    int other = *(ushort *)((char *)unrelated + 0x16);
}
""")
    transform('player-fields.cocci', path)
    result = path.read_text()
    for field in ['tile_word', 'hdr.position_word', 'hdr.chain_word',
                  'goal_word', 'status_word', 'target_word']:
        assert 'g_player_object->' + field in result, result
    assert 'g_player_object->tile_word = tile;' in result, result
    assert '*(ushort *)((char *)unrelated + 0x16)' in result, result
    transform('player-fields.cocci', path)
    assert result == path.read_text(), 'player full-word rules are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text("""
typedef unsigned short ushort;
typedef unsigned char byte;
typedef unsigned char undefined1;
void npc_walk_toward_tile(int uVar8, byte *local_40, int other) {
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar8;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar8 >> 8);
    *(byte *)((char *)DAT_0010190c + 0x16) = local_40[0] & 0xf | (byte)uVar8;
    *(char *)((char *)DAT_0010190c + 0x17) = (char)(uVar8 >> 8);
    int slot = *(byte *)((char *)DAT_0010190c + 0x16) & 0xf;
    int signed_byte = *(char *)((char *)DAT_0010190c + 2);
    *(char *)((char *)DAT_0010190c + 4) = (char)uVar8;
    *(char *)((char *)DAT_0010190c + 5) = (char)(other >> 8);
    *(short *)((char *)g_player_object + 2) = -32768;
    int signed_word = *(short *)((char *)g_player_object + 2);
    int byte_index = ((byte *)g_player_object)[3];
    int word_index = *(byte *)((ushort *)g_player_object + 1);
    int narrowed_word = (char)((ushort *)g_player_object)[1];
    int word_pointer = *(ushort *)((ushort *)g_player_object + 1);
    int scaled_index = *(ushort *)((ushort *)DAT_0010190c + 2);
}
void mobile_object_tick(void) {
    int coordinate = *(ushort *)((char *)DAT_0010190c + 0xb);
}
int unrelated(byte *buffer) { return *(byte *)((char *)buffer + 2); }
""")
    transform('object-word-accesses.cocci', path)
    result = path.read_text()
    assert 'DAT_0010190c->hdr.position_word = (ushort)uVar8;' in result, result
    assert 'DAT_0010190c->tile_word_low = local_40[0]' in result, result
    assert 'DAT_0010190c->tile_word_high' in result, result
    assert 'DAT_0010190c->npc_path_slot' in result, result
    assert '(char)DAT_0010190c->hdr.position_word_low' in result, result
    assert 'DAT_0010190c->hdr.chain_word_low' in result, result
    assert 'DAT_0010190c->hdr.chain_word_high' in result, result
    assert 'g_player_object->hdr.position_word_signed = -32768;' in result, result
    assert 'g_player_object->hdr.position_word_high' in result, result
    assert 'g_player_object->hdr.position_word_low' in result, result
    assert 'word_pointer = g_player_object->hdr.position_word;' in result, result
    assert 'scaled_index = DAT_0010190c->hdr.chain_word;' in result, result
    assert '*(ushort *)((char *)DAT_0010190c + 0xb)' in result, result
    assert '*(byte *)((char *)buffer + 2)' in result, result
    transform('object-word-accesses.cocci', path)
    assert path.read_text() == result, 'word/byte access rules are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text("""
typedef unsigned short ushort;
typedef unsigned char byte;
typedef unsigned char undefined1;
typedef struct { ushort position_word; byte position_word_low, position_word_high; } uw_object_hdr_t;
void find_object_in_world(ushort *puVar6, int value) {
    *(char *)((char *)puVar6 + 2) = (char)value;
    *(char *)((char *)puVar6 + 3) = (char)(value >> 8);
    int low = *(byte *)((char *)puVar6 + 2);
    int high = *(char *)((char *)puVar6 + 3);
}
void unrelated(ushort *puVar6, int value) {
    *(char *)((char *)puVar6 + 2) = (char)value;
}
""")
    transform('header-bytes/objects.cocci', path)
    result = path.read_text()
    assert '->position_word = (ushort)value;' in result, result
    assert '->position_word_low' in result, result
    assert '->position_word_high' in result, result
    assert result.count('*(char *)((char *)puVar6 + 2)') == 1, result
    transform('header-bytes/objects.cocci', path)
    assert path.read_text() == result, 'scoped header byte rules are not idempotent'

with tempfile.TemporaryDirectory() as tmp:
    path = pathlib.Path(tmp) / 'input.c'
    path.write_text("""
void npc_combat_position_tick(void)
{
    char *iVar7_rec;
    *(byte *)((ushort *)DAT_0010190c + 0x14) = 7;
    int position = DAT_0010190c->hdr.chain_word;
    DAT_0010190c->heading_flags = 0;
    iVar7_rec = (char *)DAT_0010190c;
    *(char *)(iVar7_rec + 0xb) = 5;
}
void npc_combat_disengage_tick(void)
{
    char *iVar2;
    *(byte *)((ushort *)DAT_0010190c + 0x14) = 6;
    int goal = DAT_0010190c->tile_word;
    iVar2 = (char *)DAT_0010190c;
    *(char *)(iVar2 + 0xb) = 9;
}
void unrelated(void) {
    DAT_0010190c->hdr.chain_word = 1;
    *(byte *)((ushort *)DAT_0010190c + 0x14) = 1;
}
""")
    command = [sys.executable, str(root / 'tools/coccinelle/apply_npc_combat_byte_offsets.py'),
               '--source', str(path), '--spatch', spatch]
    repaired = subprocess.run(command, text=True, capture_output=True)
    assert repaired.returncode == 0, repaired.stdout + repaired.stderr
    result = path.read_text()
    assert 'DAT_0010190c->attack_pitch = 7;' in result, result
    assert 'DAT_0010190c->attack_pitch = 6;' in result, result
    assert 'position = DAT_0010190c->hdr.position_word;' in result, result
    assert 'goal = DAT_0010190c->goal_word;' in result, result
    assert 'DAT_0010190c->goal_word_high = 0;' in result, result
    assert 'iVar7_rec->goal_word_low = 5;' in result, result
    assert 'iVar2->goal_word_low = 9;' in result, result
    assert 'DAT_0010190c->hdr.chain_word = 1;' in result, result
    assert result.count('((ushort *)DAT_0010190c + 0x14)') == 1, result
    checked = subprocess.run(command + ['--check'], text=True, capture_output=True)
    assert checked.returncode == 0, checked.stdout + checked.stderr
    assert path.read_text() == result, 'ARM byte-offset context repair is not idempotent'
