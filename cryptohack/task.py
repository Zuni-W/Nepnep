from Crypto.Util.number import bytes_to_long,getPrime,inverse,GCD
from hashlib import sha256

import random
import string
import os
from uuid import uuid4

flag="flag{"+str(uuid4())+"}"
flag=bytes(flag,"utf-8")

def proof_of_work():
    random.seed(os.urandom(8))
    proof = ''.join([random.choice(string.ascii_letters+string.digits) for _ in range(20)])
    _hexdigest = sha256(proof.encode()).hexdigest()
    print(b"[+] sha256(XXXX+%s) == %s".decode() % (proof[4:],_hexdigest))
    print("[+] Plz tell me XXXX: ")
    x = input("[-] ").encode('latin1')
    if len(x) != 4 or sha256(x+proof[4:].encode()).hexdigest() != _hexdigest:
        return False
    return True

def init_key():
    p, q = getPrime(512), getPrime(512)
    n = p*q
    e = getPrime(32)
    while(GCD((p-1)*(q-1),e)!=1):
        p, q = getPrime(512), getPrime(512)
        n = p*q
        e = getPrime(32)
    d = inverse(e,(p-1)*(q-1))
    return (e,n),(d,p,q)

def main():
    m = bytes_to_long(flag)
    publickey,secretkey = init_key()
    print("[+]",publickey)
    print("[+]",pow(m,publickey[0],publickey[1]))

    for _ in range(10000):
        try:
            c = int(input("[-] "))
            m = pow(c,secretkey[0],publickey[1])
            msg = int.to_bytes(m,1024//8,'big')
            print("[+]",msg.startswith(b"\x00"))
        except:
            print("[!] ERROR!")

if __name__ == '__main__':
    if proof_of_work():
        main()
    else:
        print("[!] Wrong!")
