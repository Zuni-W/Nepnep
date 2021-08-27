from gmpy2 import *
def savelowerletter(s):
    m=''
    for i in s:
        if 'a'<=i<='z':
            m+=i
    return m
def check(string):
    n = 0
    m = 0
    alpha = {'a':0,'b':0,'c':0,'d':0,'e':0,'f':0,'g':0,'h':0,'i':0,'j':0,'k':0,'l':0,'m':0,'n':0,'o':0,'p':0,'q':0,'r':0,'s':0,'t':0,'u':0,'v':0,'w':0,'x':0,'y':0,'z':0}       
    n = len(string)
    n = float(n*(n-1))
    for i in string:
        alpha[i] += 1
    for i in alpha:
        i = alpha[i]
        m += i*(i-1)
    m = m/n
    return m
 
def find_keylength(text):
    kl = 1
    while True:
        s = 0.0
        for i in range(kl):
            s+=check(text[i::kl])
            
        s= s/kl
        if s >= 0.06 and s <= 0.07:
            break
        else:
            kl += 1
    return kl
 
def find_keyword(C,kl):
    cl = list(C)
    S = {'a':0.08167,'b':0.01492,'c':0.02782,'d':0.04253,'e':0.12702,'f':0.02228,'g':0.02015,'h':0.06094,'i':0.06966,'j':0.00153,'k':0.00772,'l':0.04025,'m':0.02406,'n':0.06749,'o':0.07507,'p':0.01929,'q':0.00095,'r':0.05987,'s':0.06327,'t':0.09056,'u':0.02758,'v':0.00978,'w':0.02360,'x':0.00150,'y':0.01974,'z':0.00074}
    while True:
        key1=[]
        key2=[]
        for i in range(kl):
            clnow = cl[i::kl]
            M = 0

            for m in range(26):
                if gcd(m,26)==1:
                    for n in range(26):
                        pcnow = 0
                        for L in set(clnow):
                            Lf = clnow.count(L) / len(clnow)
                            k = chr(invert(m,26)*(ord(L)-n)%26 +97)
                            pcnow += Lf * S[k]                            
                        if pcnow > M:

                            M = pcnow
                            k1=m
                            k2=n
            key1.append(k1)
            key2.append(k2)
                               
        break
    return key1,key2
 

def decrypt(Ciphertext,key1,key2,length):
    message=""
    flag=0
    for i in Ciphertext:
        if  'a'<=i<='z':
            message+=chr(invert(key1[flag%length],26)*(ord(i)-key2[flag%length])%26+97)
            flag+=1
        else:
            message+=i
    return message
 
           
C =open(r'test.txt','rb').read().decode().lower()
Ciphertext=savelowerletter(C)
l=find_keylength(Ciphertext)
print(l)
key1,key2=find_keyword(Ciphertext,l)
print(key1)

print(key2)

f=open(r"flag.txt","w")
f.write(decrypt(Ciphertext,key1,key2,l))
