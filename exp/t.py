import sys
from ctypes import *
from pwn import *
def encipher(v, k):
    y = c_uint32(v[0])
    z = c_uint32(v[1])
    s = c_uint32(0)
    delta = 0x9e3779b9
    n = 32
    w = [0,0]
    while(n>0):
        s.value += delta
        y.value += ( z.value << 4 ) + k[0] ^ z.value + s.value ^ (z.value >> 5 ) + k[1]
        z.value += ( y.value << 4 ) + k[2] ^ y.value + s.value ^ (y.value >> 5 ) + k[3]
        n-=1

    w[0]=y.value
    w[1]=z.value
    return w
def decipher(v, k):
    y = c_uint32(v[0])
    z = c_uint32(v[1])
    s = c_uint32(0xc6ef3720)
    delta = 0x9e3779b9
    n = 32
    w = [0,0]
    while(n>0):
        z.value -= ( y.value << 4 ) + k[2] ^ y.value + s.value ^ (y.value >> 5 ) + k[3]
        y.value -= ( z.value << 4 ) + k[0] ^ z.value + s.value ^ (z.value >> 5 ) + k[1]
        s.value -= delta
        n -= 1
    w[0] = y.value
    w[1] = z.value

    return w

def get_dec(v):
    key = [0x11] * 4
    s = decipher(v,key)
    res = ''
    for i in s:
        res += p32(i)[::-1].encode('hex').upper()
    return res

if __name__ == "__main__":
# v = [0x79AE1A3B,0x596080D3]
    print(get_dec([0x79AE1A3B,0x596080D3]))
    print(get_dec([0x80E03E80,0x846C8D73]))
    print(get_dec([0x21A01CF7,0xC7CACA32]))
    print(get_dec([0x45F9AC14,0xC5F5F22F]))
