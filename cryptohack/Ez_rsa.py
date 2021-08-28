from pwn import *

from gmpy2 import *
p=process('/home/zuni-w/Desktop/pyprocess.sh' )

q=process('/home/zuni-w/Desktop/pysha.sh' )

s=p.recvuntil("XXX+")
s=p.recvuntil(")")
la=s[:-1]
s=p.recvuntil("==")

s=p.recvuntil("\n")
sha=s[1:-1]
q.recvuntil("?:")
q.sendline(str(la)[2:-1])
q.recvuntil("ans:")
q.sendline(str(sha)[2:-1])

s=q.recvuntil("\n")
ans=s[:-1]
print(ans[:-1])
q.close()
p.sendline(ans)



s=p.recvuntil("\n")
e,n =eval(s[4:])


s=p.recvuntil("\n")
c=eval(s[4:])

f=True
i=-1
while f:
    i+=1
    c1=powmod(2**i,e,n)
    c2=c*c1%n
    p.recvuntil("[-]")
    p.sendline(str(c2))
    s=p.recvuntil("\n")
    f=eval(s[4:])
    

print(i)

r=2**i
l=2**(i-1)
while r>l:
    mid=(r+l+1)//2
    c1=powmod(mid,e,n)
    c2=c*c1%n
    p.recvuntil("[-]")
    p.sendline(str(c2))
    s=p.recvuntil("\n")
    f=eval(s[4:])
    if f :
        l=mid

    else :
        r=mid-1

print(mid,r==l)
t=2**1016//r
from binascii import *
print(unhexlify(hex(t)[2:]))
