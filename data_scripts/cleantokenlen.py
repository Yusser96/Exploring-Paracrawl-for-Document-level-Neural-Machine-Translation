import sys

def mread(file):
    fi=open(file,'r',encoding='UTF8')
    li=fi.readlines()
    fi.close()
    return li

ls=mread(sys.argv[1])    
lt=mread(sys.argv[2])
fos=open(sys.argv[1]+'.tokclean','w',encoding='UTF8')
fot=open(sys.argv[2]+'.tokclean','w',encoding='UTF8')

cnt = 0
sdoc = []
tdoc = []

for i in range(len(ls)):    
    if ls[i].strip() == '<d>' and i > 0 :
        ssdoc  = "\n".join(sdoc)
        ttdoc  = "\n".join(tdoc)
        if len(ssdoc.split()) > 30 and len(ttdoc.split()) > 30:
            fos.write('<d>'+'\n')
            fot.write('<d>'+'\n')
            for j in range(len(sdoc)):
                fos.write(sdoc[j]+'\n')
                fot.write(tdoc[j]+'\n')
            cnt +=1
        sdoc = []
        tdoc = []
    else:
        sdoc.append(ls[i].strip())
        tdoc.append(lt[i].strip())

fos.write('<d>'+'\n')
fot.write('<d>'+'\n')
for j in range(len(sdoc)):
    fos.write(sdoc[j]+'\n')
    fot.write(tdoc[j]+'\n')
cnt +=1

print(f'{cnt} document was saved!')
    