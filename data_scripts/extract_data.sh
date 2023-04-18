

vecalign=paracrawl-benchmark.en-de.vecalign
docs=paracrawl-benchmark.en-de.aligned-docs

vecalign_tmp=tmp/paracrawl-benchmark.en-de.vecalign
docs_tmp=tmp/paracrawl-benchmark.en-de.aligned-docs

bash extractothers.sh &
bash extractwww.sh &
bash extracthttp.sh &
wait

mv $docs_tmp.one..clean.src.merge $docs.one.w.clean.src
mv $docs_tmp.one..clean.tgt.merge $docs.one.w.clean.tgt
mv $docs_tmp.one..clean.align.merge $docs.one.w.clean.align
python ppmergeaz $docs.one. .clean.src &
python ppmergeaz $docs.one. .clean.tgt &
python ppmergeaz $docs.one. .clean.align &
wait

./add.sh src
./add.sh tgt
./add.sh align
wait

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
