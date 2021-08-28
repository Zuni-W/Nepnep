from gmpy2 import *
print('m1=m+p1')
print('m2=m+p2')
n=int(input("n(hex):")[2:],16)
c1=int(input("c1(hex):")[2:],16)
p1=int(input("p1(hex):")[2:],16)
c2=int(input("c2(hex):")[2:],16)
p2=int(input("p2(hex):")[2:],16)
print('m1=a*m2+p1-p2')
a=int(input("a(hex):")[2:],16)
b=p1-p2
m=((3*b*((a**3)*c2-b**3)*invert(c1-c2*(a**3)+2*(b**3),n)+b)*invert(a,n)-p2)%n
from binascii import *
print(unhexlify(hex(m)[2:]))
