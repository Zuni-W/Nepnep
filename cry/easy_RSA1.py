from binascii import *
from  gmpy2  import *

pn =  14057332139537395701238463644827948204030576528558543283405966933509944444681257521108769303999679955371474546213196051386802936343092965202519504111238572269823072199039812208100301939365080328518578704076769147484922508482686658959347725753762078590928561862163337382463252361958145933210306431342748775024336556028267742021320891681762543660468484018686865891073110757394154024833552558863671537491089957038648328973790692356014778420333896705595252711514117478072828880198506187667924020260600124717243067420876363980538994101929437978668709128652587073901337310278665778299513763593234951137512120572797739181693
pph =  14057332139537395701238463644827948204030576528558543283405966933509944444681257521108769303999679955371474546213196051386802936343092965202519504111238572269823072199039812208100301939365080328518578704076769147484922508482686658959347725753762078590928561862163337382463252361958145933210306431342748775024099427363967321110127562039879018616082926935567951378185280882426903064598376668106616694623540074057210432790309571018778281723710994930151635857933293394780142192586806292968028305922173313521186946635709194350912242693822450297748434301924950358561859804256788098033426537956252964976682327991427626735740
qn =  20714298338160449749545360743688018842877274054540852096459485283936802341271363766157976112525034004319938054034934880860956966585051684483662535780621673316774842614701726445870630109196016676725183412879870463432277629916669130494040403733295593655306104176367902352484367520262917943100467697540593925707162162616635533550262718808746254599456286578409187895171015796991910123804529825519519278388910483133813330902530160448972926096083990208243274548561238253002789474920730760001104048093295680593033327818821255300893423412192265814418546134015557579236219461780344469127987669565138930308525189944897421753947
qed =  100772079222298134586116156850742817855408127716962891929259868746672572602333918958075582671752493618259518286336122772703330183037221105058298653490794337885098499073583821832532798309513538383175233429533467348390389323225198805294950484802068148590902907221150968539067980432831310376368202773212266320112670699737501054831646286585142281419237572222713975646843555024731855688573834108711874406149540078253774349708158063055754932812675786123700768288048445326199880983717504538825498103789304873682191053050366806825802602658674268440844577955499368404019114913934477160428428662847012289516655310680119638600315228284298935201
c =  40855937355228438525361161524441274634175356845950884889338630813182607485910094677909779126550263304194796000904384775495000943424070396334435810126536165332565417336797036611773382728344687175253081047586602838685027428292621557914514629024324794275772522013126464926990620140406412999485728750385876868115091735425577555027394033416643032644774339644654011686716639760512353355719065795222201167219831780961308225780478482467294410828543488412258764446494815238766185728454416691898859462532083437213793104823759147317613637881419787581920745151430394526712790608442960106537539121880514269830696341737507717448946962021




def forpq(n,ph):
    paq=n+1-ph
    psq=iroot((paq)**2-4*n,2)
    if psq[1]:
        psq=psq[0]
        p=(paq+psq)//2
        q=(paq-psq)//2
        return True,p,q
    else:
        return False,1,1

e=65537
ip=forpq(pn,pph)
if(ip[0]):
    pq,pp=ip[1:]
p=abs(2021*pp+2020*pq)
import sympy
p=sympy.nextprime(p)
k=(qed-1)/qn

for i in range(4864856032000000,4864856032400000):
    if ((qed-1)%i):
        i+=1
        continue
    else:
        qph=(qed-1)//i
        ip1=forpq(qn,qph)
        if(ip1[0]):
            break

qq,qp=ip1[1:]
q=(2021*qp-2020*qq)
if q<0:
    q=(-1)*q
q=sympy.nextprime(q)
ph=(p-1)*(q-1)
e=65537
print(p)
d=invert(e,ph)
m=powmod(c,d,p*q)
print(d)
m=hex(m)[2:]
print(unhexlify(m))
