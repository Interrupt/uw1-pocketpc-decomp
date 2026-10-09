"""Generate function-scoped UW1 header field rules from audited Clang roles."""
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
FIELDS = [(0,0,0x1ff,'item_id'),(0,9,7,'flags_res'),(0,12,1,'enchanted'),
          (0,13,1,'doordir'),(0,14,1,'invisible'),(0,15,1,'is_quant'),
          (2,0,0x7f,'zpos'),(2,7,7,'heading'),(2,10,7,'ypos'),(2,13,7,'xpos'),
          (4,0,0x3f,'quality'),(4,6,0x3ff,'next'),(6,0,0x3f,'owner'),(6,6,0x3ff,'link')]


def regex(names):
    # Coccinelle's default Str regex strings retain their backslashes.
    return r'^\(' + r'\|'.join(sorted(set(names))) + r'\)$'


def generate(source):
    groups = {}
    for function in source.get('functions', []):
        for role in function['roles']:
            if '**' in role['type']:
                continue
            groups.setdefault((role['name'], role['type']), []).append(function['function'])
    rules = []
    for number, ((name, rawtype), functions) in enumerate(groups.items()):
        word_pointer = rawtype in ('ushort *', 'short *', 'unsigned short *', 'const ushort *')
        byte_pointer = rawtype in ('char *', 'byte *', 'undefined *', 'undefined1 *', 'unsigned char *')
        # GNU C void-pointer arithmetic in the existing port advances bytes.
        # It supports explicit dereferences, not bare void-value indexing.
        byte_arithmetic = byte_pointer or rawtype == 'void *'
        unsigned_word = word_pointer and rawtype != 'short *'
        for offset, shift, mask, field in FIELDS:
            words = [f'*(ushort *)((char *){name} + {hex(offset)})',
                     f'((ushort *){name})[{offset//2}]']
            if offset == 0:
                words += [f'*(ushort *){name}']
            if word_pointer:
                words += [f'{name}[{offset//2}]']
                if offset == 0:
                    words += [f'*{name}']
            if byte_arithmetic:
                words += [f'*(ushort *)({name} + {hex(offset)})']
                if byte_pointer and offset == 0:
                    words += [f'CONCAT11({name}[1], *{name})', f'CONCAT11({name}[1], {name}[0])']
            patterns=[]
            for word in words:
                if shift:
                    patterns += [f'({word} >> {shift}) & {hex(mask)}',
                                 f'({word} & {hex(mask<<shift)}) >> {shift}']
                    if shift + mask.bit_length() == 16 and unsigned_word:
                        patterns += [f'{word} >> {shift}']
                else:
                    patterns += [f'{word} & {hex(mask)}']
            # Byte-field forms: never assume raw char reads are unsigned.
            if shift + mask.bit_length() <= 8:
                bytes_ = [f'*(byte *)((char *){name} + {hex(offset)})']
                if word_pointer:
                    bytes_ += [f'(byte){name}[{offset//2}]']
                if byte_pointer:
                    bytes_ += [f'{name}[{offset}]']
                if byte_arithmetic:
                    bytes_ += [f'*(byte *)({name} + {hex(offset)})']
                for byte in bytes_:
                    patterns += ([f'({byte} >> {shift}) & {hex(mask)}',
                                  f'({byte} & {hex(mask<<shift)}) >> {shift}'] if shift else [f'{byte} & {hex(mask)}'])
            if shift >= 8:
                bs=shift-8
                byte=f'*(byte *)((char *){name} + {hex(offset+1)})'
                byteforms = [byte]
                if byte_arithmetic:
                    byteforms.append(f'*(byte *)({name} + {hex(offset+1)})')
                for byte in byteforms:
                    patterns += ([f'({byte} >> {bs}) & {hex(mask)}', f'({byte} & {hex(mask<<bs)}) >> {bs}'] if bs else [f'{byte} & {hex(mask)}'])
                    if bs + mask.bit_length() == 8:
                        patterns.append(f'{byte} >> {bs}')
            # Raw index forms were checked against the original declaration,
            # not guessed from the variable's puVar/pcVar prefix.
            patterns = list(dict.fromkeys(patterns))
            rules.append(f'@field_{number}_{field} disable drop_cast, is_zero, isnt_zero@\ntype R;\nidentifier F =~ "{regex(functions)}";\ntypedef ushort, byte, uw_object_hdr_t;\n@@\nR F(...) {{\n<...\n(\n'+
                         '\n|\n'.join(f'- {p}\n+ ((uw_object_hdr_t *){name})->{field}' for p in patterns)+'\n)\n...>\n}\n')
    return '\n'.join(rules).rstrip() + '\n' if rules else ''


def main():
    output=HERE / 'header-fields'
    output.mkdir(exist_ok=True)
    audit=json.loads((HERE / 'object-pointer-roles.json').read_text())
    count=0
    for source in audit['sources']:
        text=generate(source)
        if text:
            (output / (Path(source['source']).stem+'.cocci')).write_text(text)
            count+=1
    print(f'Generated scoped patches for {count} source files')

if __name__=='__main__':main()
