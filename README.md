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

* download and extract Paracrawl datafiles into data_Scripts directory: 

   ** https://www.statmt.org/paracrawl-benchmarks/paracrawl-benchmark.en-de.aligned-docs.xz
   ** https://www.statmt.org/paracrawl-benchmarks/paracrawl-benchmark.en-de.vecalign.xz


* Extract Data:
```
    bash readme.sh
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


