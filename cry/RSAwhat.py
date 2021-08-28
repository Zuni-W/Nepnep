from binascii import *
from gmpy2 import *
f1=open("HUB1")
f2=open("HUB2")

n=f1.readline()
n=int(f2.readline())
e1=int(f1.readline())
e2=int(f2.readline())
(s1,s2)=gcdext(e1,e2)[1:]
(c1,c2)=(f1.readline(),f2.readline())
(c1,c2)=(f1.readline(),f2.readline())
s=''
while len(c1)!=0:

    m1=unhexlify(hex(powmod(int(c1),s1,n)*powmod(int(c2),s2,n)%n)[2:])
    s+=m1
    (c1,c2)=(f1.readline(),f2.readline())

print(s)
