

vecalign=paracrawl-benchmark.en-de.vecalign
docs=paracrawl-benchmark.en-de.aligned-docs

./ddd.sh ppgetonesentwww $vecalign
./ddd.sh ppgetonedocuwww $docs
./para.sh clean.sh 
./para.sh deco.sh
python ppmergeaz $docs.one. .clean.src
python ppmergeaz $docs.one. .clean.tgt
python ppmergeaz $docs.one. .clean.align

./ddd.sh ppgetonesent $vecalign
./ddd.sh ppgetonedocu $docs 
rm $vecalign.one.w
rm $docs.one.w
./para.sh clean.sh
./para.sh deco.sh
mv $docs.one..clean.src.merge $docs.one.w.clean.src
mv $docs.one..clean.tgt.merge $docs.one.w.clean.tgt
mv $docs.one..clean.align.merge $docs.one.w.clean.align
python ppmergeaz $docs.one. .clean.src
python ppmergeaz $docs.one. .clean.tgt
python ppmergeaz $docs.one. .clean.align

python ppgetonedocuothers $docs
python ppgetonesentothers $vecalign
python ppparaclean $docs.notaztwo $vecalign.notaztwo 
python ppdecobase64 $docs.notaztwo.clean $vecalign.notaztwo.clean

./add.sh src
./add.sh tgt
./add.sh align

python ppgetparasent all.src all.tgt all.align
python pponelinefmt all.src.parasent
python pponelinefmt all.tgt.parasent
python ppuniq all.src.parasent.oneline all.tgt.parasent.oneline

python pprandom all.src.parasent.oneline.uniq all.tgt.parasent.oneline.uniq

python pponelinefmtrec all.src.parasent.oneline.uniq.train
python pponelinefmtrec all.tgt.parasent.oneline.uniq.train
python pponelinefmtrec all.src.parasent.oneline.uniq.dev
python pponelinefmtrec all.tgt.parasent.oneline.uniq.dev
python pponelinefmtrec all.src.parasent.oneline.uniq.test
python pponelinefmtrec all.tgt.parasent.oneline.uniq.test

