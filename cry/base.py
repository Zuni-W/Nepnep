import base64
 
with open ('flag_encode.txt','r') as f:
    for a in f:
        while 1:
            try :
                a=base64.b64decode(a).decode("utf-8")
            except:
                pass
            try:
                a=base64.b32decode(a).decode("utf-8")
            except:
                pass
            try:
                a=base64.b16decode(a).decode('utf-8')
            except:
                pass
 
            if "{" in a:
 
                print (a)
 
                break
