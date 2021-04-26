from gmpy2 import *
from Crypto.Util.number import *
from binascii import *

flag = "*****************"

p = 262248800182277040650192055439906580479
q = 262854994239322828547925595487519915551

e = 65533
n = p*q


#c = pow(int(b2a_hex(flag),16),e,n)

#print c

c = 27565231154623519221597938803435789010285480123476977081867877272451638645710
pi =(p-1)*(q-1)
d=invert(e,pi)
m=hex(pow(c,d,n))[2:]

print(unhexlify(m))
