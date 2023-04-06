# Paracrawl-Paragraphs Dataset

**This code is for EACL 2023 paper [Exploring Paracrawl for Document-level Neural Machine Translation](https://aclanthology.org/).**



**Python Version**: Python3.6

**Package Requirements**: torch==1.4.0 tensorboardX numpy==1.19.0

**Framework**: Our model and experiments are built upon [G-Transformer](https://github.com/baoguangsheng/g-transformer).


Before running the scripts, please install fairseq dependencies by:
```
    pip install --editable .
```
Please also follow the readmes under folder raw_data and mbart.cc25 to download raw data and pretrained model.
(Notes: Our models were trained on 4 GPUs. If you trained them on 2 GPUs, in theory you could double the number for argument --update-freq. However, we haven't tested such settings.)

## Data Extraction

we provided the final dataset we used in the paper in the raw_data folder. 

for re-extracting the data you can follow the instruction below: 

* download and extract Paracrawl datafiles into data_Scripts directory: 

   https://www.statmt.org/paracrawl-benchmarks/paracrawl-benchmark.en-de.aligned-docs.xz
   
   https://www.statmt.org/paracrawl-benchmarks/paracrawl-benchmark.en-de.vecalign.xz


* Extract the Data:

in order to run the cleaning process faster we split the data by alphabit to run the cleaning scripts in parallel. we handled afew cases when dealing with the data we will explain next:

we split the two data files by alphabet using first letter of the web domain. we handle three cases where the webdomain start with "http://" or "http://www." or other

starting with "http://www." this will run 26 processes in parallel 
```
    cd data_scripts
    
    vecalign=data/paracrawl-benchmark.en-de.vecalign
    docs=data/paracrawl-benchmark.en-de.aligned-docs

    ./ddd.sh ppgetonesentwww $vecalign
    ./ddd.sh ppgetonedocuwww $docs
```

after it finished we need to clean and decode the data files in parallel
```
    ./para.sh clean.sh 
    ./para.sh deco.sh
```

then we merge the data files and split the data by "http://"
```
    python ppmergeaz $docs2.one. .clean.src
    python ppmergeaz $docs2.one. .clean.tgt
    python ppmergeaz $docs2.one. .clean.align
```

```
    ./ddd.sh ppgetonesent $vecalign
    ./ddd.sh ppgetonedocu $docs 
```

we delete the data that start with w. because it is already included in the previous step:
```
    rm $vecalign.one.w
    rm $docs.one.w
```

now we need to clean the new extracted data in parallel 
```
    ./para.sh clean.sh 
    ./para.sh deco.sh
```
after the previous step we need to merge the data from the last two steps
```
    mv $docs2.one..clean.src.merge $docs.one.w.clean.src
    mv $docs2.one..clean.tgt.merge $docs.one.w.clean.tgt
    mv $docs2.one..clean.align.merge $docs.one.w.clean.align
    python ppmergeaz $docs.one. .clean.src
    python ppmergeaz $docs.one. .clean.tgt
    python ppmergeaz $docs.one. .clean.align
```

now we handle the case where webdomains start with other prefix than "http://" and "http://www."
```
    python ppgetonedocuothers $docs
    python ppgetonesentothers $vecalign
    python ppparaclean $docs.notaztwo $vecalign.notaztwo 
    python ppdecobase64 $docs.notaztwo.clean $vecalign.notaztwo.clean
```
after we finished splitting and cleaning the data in parallel we now merge the data and change the format using the following scripts
```
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
```


## training Settings


### G-Transformer fine-tuned on sent Transformer
* Prepare data: 
```
    mkdir exp_finetune
    bash exp_gtrans/run-all.sh prepare-finetune exp_finetune
```

* Train model:
```
    CUDA_VISIBLE_DEVICES=0,1,2,3 bash exp_gtrans/run-all.sh run-finetune train exp_finetune
```

* Evaluate model:
```
    bash exp_gtrans/run-all.sh run-finetune test exp_finetune
```


