vecalign=paracrawl-benchmark.en-de.vecalign
docs=paracrawl-benchmark.en-de.aligned-docs


python ppgetonedocuothers $docs &
python ppgetonesentothers $vecalign &
wait
python ppparaclean $docs.notaztwo $vecalign.notaztwo 
python ppdecobase64 $docs.notaztwo.clean $vecalign.notaztwo.clean
