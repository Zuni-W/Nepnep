# coding=utf-8
from base64 import b64encode
#from flag import flag,key_read
from Crypto.Util.number import *
global x,N
N=100
x=16*16
#assert len(bin(key_read)[2:])==32
#assert key_read.startwith("0x")

def lfsr(R,mask):
    output = (R << 1) & 0xffffff
    i=(R&mask)&0xffffff
    lastbit=0
    while i!=0: 
        lastbit^=(i&1)
        i=i>>1
    output^=lastbit
    return (output,lastbit)


def s_box_a():
    s=[]
    for i in range(x):
        s.append(i)
    return s

def key_padding(key):
    k=[0]*x
    for i in range(x):
        k[i]=key[(i)% len(key)]
    return k

def s_box(s,key):
    j=0
    for i in range(x):
        j=(j+s[i]+key[i])%x
        s[j],s[i]=s[i],s[j]
    return s
from base64 import *
def main():
    key1=b'0x1afea246'
    cm=128834039630569249954916947026853954267142833779669
    cm=hex(cm)[2:]
    cm=b64decode("WCbeI/BfRYydhk43yF1MIdOk4zPV")
    print(len(cm))
    print(cm)   
    mask=0b10100100000010000000100010010001
    key=[]
    for i in range(len(key1)):
        key.append(key1[i])
    key=key_padding(key)
    sbox=s_box(s_box_a(),key)
    i=j=0
    
    c=""
    print(sbox)
    print()    
    for k in range(len(cm)):
        i = (i+1)%x
        j = (j+sbox[i])%x
        sbox[i],sbox[j]=sbox[j],sbox[i]
        t=(sbox[i]+sbox[j])%(x//2)
        c+=chr(cm[k]^sbox[t])
    print(c)

if __name__=='__main__':
    main()
