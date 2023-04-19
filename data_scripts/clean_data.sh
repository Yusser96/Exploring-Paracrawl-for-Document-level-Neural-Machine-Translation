python cleantokenlen.py all.src.parasent.oneline.uniq.train.multiline all.tgt.parasent.oneline.uniq.train.multiline
python cleantokenlen.py all.src.parasent.oneline.uniq.test.multiline all.tgt.parasent.oneline.uniq.test.multiline
python cleantokenlen.py all.src.parasent.oneline.uniq.dev.multiline all.tgt.parasent.oneline.uniq.dev.multiline

python cleanwronglang.py all.src.parasent.oneline.uniq.train.multiline all.tgt.parasent.oneline.uniq.train.multiline en de
python cleanwronglang.py all.src.parasent.oneline.uniq.test.multiline all.tgt.parasent.oneline.uniq.test.multiline en de
python cleanwronglang.py all.src.parasent.oneline.uniq.dev.multiline all.tgt.parasent.oneline.uniq.dev.multiline en de