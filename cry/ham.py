s='1100 1010 0000'.replace(' ','')
print(s)
check=0
for i in range(len(s)):
    if int(s[i]):
        check^=i

print(check)
t=[int(i) for i in s ]
t[check]^=1
t=[str(i) for i in t]
print(''.join(t))
