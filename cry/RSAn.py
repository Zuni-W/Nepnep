from z3 import *
from binascii import *
from libnum import *
from gmpy2 import *
N=636585149594574746909030160182690866222909256464847291783000651837227921337237899651287943597773270944384034858925295744880727101606841413640006527614873110651410155893776548737823152943797884729130149758279127430044739254000426610922834573094957082589539445610828279428814524313491262061930512829074466232633130599104490893572093943832740301809630847541592548921200288222432789208650949937638303429456468889100192613859073752923812454212239908948930178355331390933536771065791817643978763045030833712326162883810638120029378337092938662174119747687899484603628344079493556601422498405360731958162719296160584042671057160241284852522913676264596201906163
c1=90009974341452243216986938028371257528604943208941176518717463554774967878152694586469377765296113165659498726012712288670458884373971419842750929287658640266219686646956929872115782173093979742958745121671928568709468526098715927189829600497283118051641107305128852697032053368115181216069626606165503465125725204875578701237789292966211824002761481815276666236869005129138862782476859103086726091860497614883282949955023222414333243193268564781621699870412557822404381213804026685831221430728290755597819259339616650158674713248841654338515199405532003173732520457813901170264713085107077001478083341339002069870585378257051150217511755761491021553239
c2=487443985757405173426628188375657117604235507936967522993257972108872283698305238454465723214226871414276788912058186197039821242912736742824080627680971802511206914394672159240206910735850651999316100014691067295708138639363203596244693995562780286637116394738250774129759021080197323724805414668042318806010652814405078769738548913675466181551005527065309515364950610137206393257148357659666687091662749848560225453826362271704292692847596339533229088038820532086109421158575841077601268713175097874083536249006018948789413238783922845633494023608865256071962856581229890043896939025613600564283391329331452199062858930374565991634191495137939574539546
p=797862863902421984951231350430312260517773269684958456342860983236184129602390919026048496119757187702076499551310794177917920137646835888862706126924088411570997141257159563952725882214181185531209186972351469946269508511312863779123205322378452194261217016552527754513215520329499967108196968833163329724620251096080377748737                          
q=797862863902421984951231350430312260517773269684958456342860983236184129602390919026048496119757187702076499551310794177917920137646835888862706126924088411570997141257159563952725882214181185531209186972351469946269508511312863779123205322378452194261217016552527754513215520329499967108196968833163329724620251096080377747699                           
e=0x10001
ph=(p-1)*(q-1)
d=invert(e,ph)
m1=pow(c1,d,N)
m2=pow(c2,d,N)
#s=Solver()
print(m1)
print(m2)

#f1=Int("f1")
#f2=Int("f2")
#s.add(f1 + f2 == 2732509502629189160482346120094198557857912754)

#s.add(f1**3 + f2**3 == 5514544075236012543362261483183657422998274674127032311399076783844902086865451355210243586349132992563718009577051164928513093068525554)
#if(s.check()==sat):
#    print(s.model())

t=(m1*m1-m2//m1)//3
m3=iroot((m1*m1-4*t),(2))[0]
print(m3-int(m3))
F1=(m1+m3)//2
F2=abs(m1-m3)//2
print(unhexlify(hex(F1)[2:]))
print(unhexlify(hex(F2)[2:]))
