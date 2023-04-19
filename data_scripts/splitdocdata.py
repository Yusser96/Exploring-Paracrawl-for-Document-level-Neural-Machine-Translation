import sys

def mread(file):
    fi=open(file,'r',encoding='UTF8')
    li=fi.readlines()
    fi.close()
    return li

ls=mread(sys.argv[1])    
lt=mread(sys.argv[2])
fosl = []
fotl = []

n = 50

for i in range(1,n+1):
    fos=open(sys.argv[1]+f'.{i}','w',encoding='UTF8')
    fot=open(sys.argv[2]+f'.{i}','w',encoding='UTF8')
    fosl.append(fos)
    fotl.append(fot)

doc_num = 0
for i in range(len(ls)):    
    if ls[i].strip() == '<d>':
        doc_num += 1

split_chunk = doc_num // n

cnt = 0


for i in range(len(ls)):    
    if ls[i].strip() == '<d>':
        cf = (cnt //split_chunk)
        print(cf , cnt)
        cnt += 1
        
    fosl[cf].write(ls[i])
    fotl[cf].write(lt[i])



print(f'{cnt} document was saved!')
    