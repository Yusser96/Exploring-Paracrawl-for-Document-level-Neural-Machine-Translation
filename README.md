# Paracrawl-Paragraphs Dataset

**This code is for EACL 2023 paper [Exploring Paracrawl for Document-level Neural Machine Translation](http://arxiv.org/abs/2304.10216).**



**Python Version**: Python3.6

**Package Requirements**: torch==1.4.0 tensorboardX numpy==1.19.0

**Framework**: Our model and experiments are built upon [G-Transformer](https://github.com/baoguangsheng/g-transformer).


Before running the scripts, please install fairseq dependencies by:
```
    pip install --editable .
```
Please also follow the readme under folder raw_data to download raw data.


## Data Extraction

we provided the final dataset we used in the paper in the raw_data folder. 

for re-extracting the data you can follow the instruction below: 

* download and extract Paracrawl datafiles into data_Scripts directory: 

   https://www.statmt.org/paracrawl-benchmarks/paracrawl-benchmark.en-de.aligned-docs.xz
   
   https://www.statmt.org/paracrawl-benchmarks/paracrawl-benchmark.en-de.vecalign.xz


* Extract the Data:


```
    cd data_scripts
    
    bash extract_data.sh
```

* Clean the Data:


```
    cd data_scripts
    
    pip install langid
    
    bash clean_data.sh
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


