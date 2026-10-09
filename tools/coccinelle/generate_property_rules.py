"""UW1 COMOBJ: 11-byte disk rows expanded by the ARM loader to 13 bytes."""
from pathlib import Path
fields={0:'height',1:'size_weight',3:'flags',5:'monetary_value',7:'quality_flags',
        8:'owner_flags',9:'scale_flags',10:'class_flags',11:'description_flags'}
rules=[]
for offset,field in fields.items():
 alias=f'DAT_{0x202c90+offset:08x}'
 # A byte at offset 1 is only the low byte of the packed size/weight word.
 value=f'g_object_type_props[id].{field}'
 bytevalue=f'((byte){value})' if offset==1 else value
 rules += [f'@byte_{offset}@\nexpression id;\ntypedef byte;\n@@\n- (&{alias})[id * 0xd]\n+ {bytevalue}\n']
 if offset in (1,5):
  rules += [f'@word_{offset}@\nexpression id;\ntypedef ushort;\n@@\n- *(ushort *)(&{alias} + id * 0xd)\n+ {value}\n',
            f'@signed_word_{offset}@\nexpression id;\n@@\n- *(short *)(&{alias} + id * 0xd)\n+ (short){value}\n']
# These names were audited: each holds object_id * 13 at the access site.
# Keep the saved offset rather than reevaluating an ID whose source may change.
for offset,field in fields.items():
 alias=f'DAT_{0x202c90+offset:08x}'
 value=f'g_object_type_props[stride / 0xd].{field}'
 bytevalue=f'((byte){value})' if offset==1 else value
 rules += [f'@saved_byte_{offset}@\nidentifier stride =~ "iVar";\ntypedef byte;\n@@\n- (&{alias})[stride]\n+ {bytevalue}\n']
 if offset in (1,5):
  rules += [f'@saved_word_{offset}@\nidentifier stride =~ "iVar";\ntypedef ushort;\n@@\n- *(ushort *)(&{alias} + stride)\n+ {value}\n']
rules += ['@quality_owner_word@\nexpression stride;\ntypedef ushort;\n@@\n- *(ushort *)(&DAT_00202c97 + stride)\n+ g_object_type_props[stride / 0xd].quality_owner_flags\n']
rules += [r.replace('saved_', 'saved_render_').replace('=~ "iVar"', '=~ "_iv"') for r in rules if 'saved_' in r]
Path(__file__).with_name('object-properties.cocci').write_text('\n'.join(rules))
