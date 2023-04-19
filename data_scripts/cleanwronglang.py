import langid
import sys


def mread(file):
    fi=open(file,'r',encoding='UTF8')
    li=fi.readlines()
    fi.close()
    return li

ls=mread(sys.argv[1])    
lt=mread(sys.argv[2])
fos=open(sys.argv[1]+'.langid','w',encoding='UTF8')
fot=open(sys.argv[2]+'.langid','w',encoding='UTF8')

cnt = 0
sdoc = []
tdoc = []

for i in range(len(ls)):    
    if ls[i].strip() == '<d>' and i > 0 :
        tmp = False

        tmp12 = []
        tmp22 = []
        for s1 in sdoc:
            if langid.classify(s1)[0]==sys.argv[3]:
                tmp12.append(s1)
        for s2 in tdoc:
            if langid.classify(s2)[0]==sys.argv[4]:
                tmp22.append(s2)
        if tmp12 != [] and tmp22 != []:
            if len(tmp12) == len(tmp22):
                fos.write('<d>'+'\n')
                fot.write('<d>'+'\n')
                for j in range(len(tmp12)):
                    fos.write(tmp12[j]+'\n')
                    fot.write(tmp22[j]+'\n')
                    tmp = True
        if tmp:
            cnt+=1

        sdoc = []
        tdoc = []
    else:
        sdoc.append(ls[i].strip())
        tdoc.append(lt[i].strip())

tmp = False

tmp12 = []
tmp22 = []
for s1 in sdoc:
    if langid.classify(s1)[0]==sys.argv[3]:
        tmp12.append(s1)
for s2 in tdoc:
    if langid.classify(s2)[0]==sys.argv[4]:
        tmp22.append(s2)
if tmp12 != [] and tmp22 != []:
    if len(tmp12) == len(tmp22):
        fos.write('<d>'+'\n')
        fot.write('<d>'+'\n')
        for j in range(len(tmp12)):
            fos.write(tmp12[j]+'\n')
            fot.write(tmp22[j]+'\n')
            tmp = True
if tmp:
    cnt+=1



print(f'{cnt} document was saved!')