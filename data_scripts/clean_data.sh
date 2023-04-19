python splitdocdata.py all.src.parasent.oneline.uniq.train.multiline all.tgt.parasent.oneline.uniq.train.multiline
# python splitdocdata.py all.src.parasent.oneline.uniq.test.multiline all.tgt.parasent.oneline.uniq.test.multiline
# python splitdocdata.py all.src.parasent.oneline.uniq.dev.multiline all.tgt.parasent.oneline.uniq.dev.multiline

counter=1
while [ $counter -le 50 ]
do
echo $counter
python cleantokenlen.py all.src.parasent.oneline.uniq.train.multiline.$counter all.tgt.parasent.oneline.uniq.train.multiline.$counter &
# python cleantokenlen.py all.src.parasent.oneline.uniq.test.multiline.$counter all.tgt.parasent.oneline.uniq.test.multiline.$counter &
# python cleantokenlen.py all.src.parasent.oneline.uniq.dev.multiline.$counter all.tgt.parasent.oneline.uniq.dev.multiline.$counter &
((counter++))
done
python cleantokenlen.py all.src.parasent.oneline.uniq.test.multiline all.tgt.parasent.oneline.uniq.test.multiline &
python cleantokenlen.py all.src.parasent.oneline.uniq.dev.multiline all.tgt.parasent.oneline.uniq.dev.multiline &

wait

counter=1
while [ $counter -le 50 ]
do
echo $counter
python cleanwronglang.py all.src.parasent.oneline.uniq.train.multiline.$counter.tokclean all.tgt.parasent.oneline.uniq.train.multiline.$counter.tokclean en de &
# python cleanwronglang.py all.src.parasent.oneline.uniq.test.multiline.$counter.tokclean all.tgt.parasent.oneline.uniq.test.multiline.$counter.tokclean en de &
# python cleanwronglang.py all.src.parasent.oneline.uniq.dev.multiline.$counter.tokclean all.tgt.parasent.oneline.uniq.dev.multiline.$counter.tokclean en de &
((counter++))
done
python cleanwronglang.py all.src.parasent.oneline.uniq.test.multiline.tokclean all.tgt.parasent.oneline.uniq.test.multiline.tokclean en de &
python cleanwronglang.py all.src.parasent.oneline.uniq.dev.multiline.tokclean all.tgt.parasent.oneline.uniq.dev.multiline.tokclean en de &

wait

python mergesplitdoc.py all.src.parasent.oneline.uniq.train.multiline all.tgt.parasent.oneline.uniq.train.multiline .tokclean.langid
# python mergesplitdoc.py all.src.parasent.oneline.uniq.test.multiline all.tgt.parasent.oneline.uniq.test.multiline .tokclean.langid
# python mergesplitdoc.py all.src.parasent.oneline.uniq.dev.multiline all.tgt.parasent.oneline.uniq.dev.multiline .tokclean.langid
