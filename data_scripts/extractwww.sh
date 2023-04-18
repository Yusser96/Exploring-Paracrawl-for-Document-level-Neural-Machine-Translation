makedir tmp

vecalign_tmp=tmp/paracrawl-benchmark.en-de.vecalign
docs_tmp=tmp/paracrawl-benchmark.en-de.aligned-docs


./ddd.sh ppgetonesentwww $vecalign_tmp &
./ddd.sh ppgetonedocuwww $docs_tmp &
wait
./para.sh clean.sh 
wait
./para.sh deco.sh
wait
python ppmergeaz $docs_tmp.one. .clean.src &
python ppmergeaz $docs_tmp.one. .clean.tgt &
python ppmergeaz $docs_tmp.one. .clean.align &