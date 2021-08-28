ciphertexts=[
'280316470206017f5f163a3460100b111b2c254e103715600f13',
'091b0f471d05153811122c70340c0111053a394e0b39500f0a18',
'4638080a1e49243e55531a3e23161d411a362e4044111f374409',
'0e0d15470206017f59122935601405421d3a244e10371560140f',
'031a08080e1a540d62327f242517101d4e2b2807177f13280511',
'0a090f001e491d2c111d3024601405431a36231b083e022c1d',
'16000406080c543854077f24280144451c2a254e093a0333051a',
'02050701120a01334553393f32441d5e1b716027107f19334417',
'131f15470800192f5d167f352e0716481e2b29010a7139600c12',
'1609411e141c543c501d7f232f0812544e2b2807177f00320b1f',
'0a090c470a1c1d3c5a1f2670210a0011093a344e103715600712',
'141e04040f49153142043a22601711520d3a331d0826'
]
NUM_CIPHER = len(ciphertexts) #NUM_CIPHER=11
THRESHOLD_VALUE = 8 

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
    key = [29] * 200  
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
key_hex =''.join([hex(ord(c)).replace('0x', '')+' ' for c in key])
print("key=\n"+key)
print("key_hex=\n"+key_hex)
print(ord(key[0]))

#key="flag{it_1s_P@dd1n_@nd_p@d}"
print(key)
for t in range(len(ciphertexts)):
    f = ''.join([chr(int(d, 16)) for d in [ciphertexts[t][i:i+2] for i in range(0, len(ciphertexts[t]), 2)]])

    for letter in strxor(f,key):
             if (letter>=' ' and letter<='}'):
                 result+=letter
             else:
                 result+='0'
    print(result)
    result=''
