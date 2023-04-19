import sys

def mread(file):
    fi=open(file,'r',encoding='UTF8')
    li=fi.readlines()
    fi.close()
    return li




n = 50

fos=open(sys.argv[1]+'.tokclean.langid.all','w',encoding='UTF8')    
fot=open(sys.argv[2]+'.tokclean.langid.all','w',encoding='UTF8')

for i in range(1,n+1):
    ls=mread(sys.argv[1]+f'.{i}.'+sys.argv[3])
    lt=mread(sys.argv[2]+f'.{i}.'+sys.argv[3])

    for i in range(len(ls)):    
        fos.write(ls[i])
        fot.write(lt[i])

    