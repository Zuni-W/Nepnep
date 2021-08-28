import requests
import base64
import hashlib
from binascii import unhexlify
def crypt(data,key) :
    s = [0] * x
    for i in range(256) :
        s[i] = i
    j = 0
    for i in range(256) :
        j = (j + s[i] + key[i % len(key)]) % x
        s[i], s[j] = s[j], s[i]
    i = 0
    j = 0
    res = ""
    for c in range(len(data)) :
        i = (i + 1) % 256
        j = (j + s[i]) % 256
        s[i], s[j] = s[j], s[i]
        res = res + chr(data[c] ^ s[(s[i] + s[j]) % (c//2)])
    return res

def tdecode(data ,key) :
    data = base64.b64decode(data)
    salt = data[:16]
    return crypt(data[16:] ,hashlib.sha1(bytes(key,encoding='utf8') + salt).digest())

if __name__ =='__main__':
    t=[248, 186, 106, 151, 71, 202, 232, 145, 197, 7, 110, 247, 146, 11, 57, 146, 20, 168, 175, 126, 170, 80, 69, 141, 109, 45, 182, 134, 110, 159, 134, 94, 223, 179, 30, 82, 166, 98, 106]
#    t=[int(i,16) for i in s]
    t='happyending'
    t=[ord(i) for i in t]
    key = "12345678" 			
    k=[ord(i) for i in key]	    
    m=crypt(t,k)
    print(m)
    t=(ord(i) for i in t)
    print(crypt(m,k))
