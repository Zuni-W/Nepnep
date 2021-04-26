from binascii import *
from gmpy2 import *
ki=91144196586662942563895769614300232343026691029427747065707381728622849079757
c=b'\x8c-\xcd\xde\xa7\xe9\x7f.b\x8aKs\xf1\xba\xc75\xc4d\x13\x07\xac\xa4&\xd6\x91\xfe\xf3\x14\x10|\xf8p'
ki=hex(ki)[2:-1]
print(ki)
k=ki[0:len(ki)/2]
ik=ki[len(ki)/2:]
print(k)
print(ik)
k=int(k,16)
ik=int(ik,16)
i=ik^k
print(hex(i)[2:-1])
import Crypto.Util.number as num
key=num.long_to_bytes(k)
iv=num.long_to_bytes(i)
print(key,iv)
import Crypto.Cipher.AES as AES
de=AES.new(key*2,AES.MODE_CBC,iv)
print(de.decrypt(c))

