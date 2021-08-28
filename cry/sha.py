from hashlib import sha256
from base64 import *
s='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
m0=input('XXX+?:')
print(m0)
a=input("ans:")
for i in range(64):
    for j in range(64):
        for k in range(64):
            for l in range(64):
                t=s[i]+s[j]+s[k]+s[l]
                m=t+m0
                p=sha256()
                p.update(m.encode("UTF-8"))
                d=p.hexdigest()
                if a in d:
                    print(t)

