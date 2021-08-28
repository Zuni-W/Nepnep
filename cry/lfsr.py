import libnum
from binascii import *
def LFSR_inv(R,mask):
    str=bin(R)[2:].zfill(32)
    new=str[-1:]+str[:-1]
    new=int(new,2)                   
    i = (new & mask) & 0xffffffff
    lastbit = 0
    while i != 0:
        lastbit ^= (i & 1)
        i = i >> 1
    return R>>1 | lastbit<<31      
def lfsr(R,mask):
    output = (R << 1) & 0xffffffff
    i=(R&mask)&0xffffffff
    lastbit=0
    while i!=0: 
        lastbit^=(i&1)
        i=i>>1
    output^=lastbit
    return (output,lastbit)
mask = 0b10100100000010000000100010010001
data=open('change2').read()
data1=data[:4]
c=libnum.s2n(data1)                   
for _ in range(32):
    c=LFSR_inv(c,mask)
print(hex(c))
key1=c
c=''
for i in range(100):
    tmp=0
    for j in range(8):
        (key1,out)=lfsr(key1,mask)
        tmp=(tmp<<1)^out
    c+=chr(tmp)

print(c)
print(data)
print(c==data)
