from pwn import *
p=[3,47,97,157,1601,21851, 56277292709098311733, 842863003249682472366877119627791407784227212205826369770241241624102599233623894956515489038200231882823515796275720517565796868777565634050439841286136730958498908985484216812390745790379384069380694859486312946676748208469080046559332149394110283426861163444586148612461696703]
e=[0]*256
for i in range(2**8):
    t='0'*(8-len(bin(i)[2:]))+bin(i)[2:]
    print(t)
    s=1
    for j in range(len(t)):
        if (t[j]=='1'):
            s*=p[j]
    e[i]=s

p=10980405508174271259925333166343579553719061316941945190323939083665489902286168861229664589365210026388298173482496757264697996404794685064674668272479771
q=9473016801951797771267846445459738473973421588058140695253031511700407533935872397264731631901174665159278878658035094231228063878480145556088206641042779
m=2977586969238177688788136343510734253831840749969343604581
ed=3563225736483105767663757964850895939437686773696002911178487096580796031415653965179057012630692344510786639289764837381745729106408000203666201724099978695932368871885604099587719393152976934607128732108404042096355012051169236089620505421627586309618317607971836222910097506025923742035914623661579380093911361
from gmpy2 import *
for i in range(256):
    if(e[i]*invert(e[i],(p-1)*(q-1))!=ed):
        continue
    d=invert(e[i],(p-1)*(q-1))
    pr=remote('47.105.112.9',1123)
    pr.recvuntil('enter sign:')
    print(i)
    pr.sendline(str(powmod(m,d,q)))
    s=pr.recv()
    s=pr.recv()
    if(b'error' not in s):
        print(s)
        pr.interactive()

print('wrong')
