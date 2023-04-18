vecalign=paracrawl-benchmark.en-de.vecalign
docs=paracrawl-benchmark.en-de.aligned-docs



./ddd.sh ppgetonesent $vecalign &
./ddd.sh ppgetonedocu $docs &
wait
rm $vecalign.one.w
rm $docs.one.w

./para.sh clean.sh
wait
./para.sh deco.sh

