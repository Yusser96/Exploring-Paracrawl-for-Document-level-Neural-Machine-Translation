# G-Transformer

**This code is for ACL 2021 paper [G-Transformer for Document-level Machine Translation](https://aclanthology.org/2021.acl-long.267/).**

**Python Version**: Python3.6

**Package Requirements**: torch==1.4.0 tensorboardX numpy==1.19.0

**Framework**: Our model and experiments are built upon [fairseq](https://github.com/pytorch/fairseq). We use a [snapshot version]( https://drive.google.com/file/d/1UJmZn9LXPvOoifVKblt0RhUFsZRusOrt/view?usp=sharing ) between 0.9.0 and 1.10.0 as our initial code.


Before running the scripts, please install fairseq dependencies by:
```
    pip install --editable .
```
Please also follow the readmes under folder raw_data and mbart.cc25 to download raw data and pretrained model.
(Notes: Our models were trained on 4 GPUs. If you trained them on 2 GPUs, in theory you could double the number for argument --update-freq. However, we haven't tested such settings.)

## Non-pretraining Settings


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


