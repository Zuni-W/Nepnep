from itertools import count
from hashlib import sha256
msg = raw_input("plz input start:").encode("utf-8")
for i in count():
    hashid = bin(int(sha256(msg+str(i)).hexdigest(),16))
    if hashid.endswith('00000000000000000000'):
        print i
        break

