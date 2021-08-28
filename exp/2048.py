from selenium.webdriver.common.keys import Keys
from pwn import *
from pygame import *
p=process("/home/zuni-w/Desktop/crashme_bctf_02/bin/cb")
s1=None
lists=[ord(i) for i in ['d','s','a','w']]
i=0
while 1:
    
    for j in lists:
        p.sendline(p32(j))
        s=p.recvuntil("q",timeout=0.01)
        if('pts' in s):
            print(chr(j))
            break 
    sleep(0.5)
    print(s)
    print(i)
    i+=1    

#p.interactive()
#up=0x77
#
