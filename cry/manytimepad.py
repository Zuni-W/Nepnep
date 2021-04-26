ciphertexts=[
'25030206463d3d393131555f7f1d061d4052111a19544e2e5d',
'0f020606150f203f307f5c0a7f24070747130e16545000035d',
'1203075429152a7020365c167f390f1013170b1006481e1314',
'0f4610170e1e2235787f7853372c0f065752111b15454e0e09',
'081543000e1e6f3f3a3348533a270d064a02111a1b5f4e0a18',
'0909075412132e247436425332281a1c561f04071d520f0b11',
'4116111b101e2170203011113a69001b475206011552050219',
'041006064612297020375453342c17545a01451811411a470e',
'021311114a5b0335207f7c167f22001b44520c15544801125d',
'06140611460c26243c7f5c167f3d015446010053005907145d',
'0f05110d160f263f3a7f4210372c03111313090415481d49']


NUM_CIPHER = len(ciphertexts) #NUM_CIPHER=11
THRESHOLD_VALUE = 7 

def strxor(a, b):
    if len(a) > len(b):
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a[:len(b)], b)])
    else:
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a, b[:len(a)])])

def letter_position(s):
    position = []
    for idx in range(len(s)):
        if (s[idx] >= 'A' and s[idx] <= 'Z') or (s[idx] >= 'a' and s[idx] <= 'z') or s[idx] == chr(0):
            position.append(idx)
    return position

def find_space(cipher):
    space_position = {}
    space_possible = {}
    for cipher_idx_1 in range(NUM_CIPHER):
        space_xor = []
        c = ''.join([chr(int(d, 16)) for d in [cipher[cipher_idx_1][i:i + 2] for i in range(0, len(cipher[cipher_idx_1]), 2)]])
        for cipher_idx_2 in range(NUM_CIPHER):
            e = ''.join([chr(int(d, 16)) for d in [cipher[cipher_idx_2][i:i+2] for i in range(0, len(cipher[cipher_idx_2]), 2)]])
            plain_xor = strxor(c, e)
            if cipher_idx_2 != cipher_idx_1:
                space_xor.append(letter_position(plain_xor))
        space_possible[cipher_idx_1] = space_xor  

    for cipher_idx_1 in range(NUM_CIPHER):
        spa = []
        for position in range(400):
            count = 0
            for cipher_idx_2 in range(NUM_CIPHER - 1):
                if position in space_possible[cipher_idx_1][cipher_idx_2]:
                    count += 1
            if count > THRESHOLD_VALUE:  
                spa.append(position)
        space_position[cipher_idx_1] = spa  
    return space_position


def calculate_key(cipher):
    key = [0] * 200  
    space = find_space(cipher)
    
    for cipher_idx_1 in range(NUM_CIPHER):
        for position in range(len(space[cipher_idx_1])):
            idx = space[cipher_idx_1][position] * 2 
            a = cipher[cipher_idx_1][idx] + cipher[cipher_idx_1][idx + 1]
            key[space[cipher_idx_1][position]] = int(a ,16) ^ ord(' ') 

    key_str = ""
    for k in key:
        key_str += chr(k)
    return key_str  

result = ""
key = calculate_key(ciphertexts)
key_hex = ''.join([hex(ord(c)).replace('0x', '') for c in key])
print("key=",key)
print("key_hex=",key_hex)

f = ''.join([chr(int(d, 16)) for d in [ciphertexts[10][i:i+2] for i in range(0, len(ciphertexts[10]), 2)]])
for letter in strxor(f,key):
         if (letter>=' ' and letter<='~ '):
             result+=letter
         else:
             result+='0'
print(result)

