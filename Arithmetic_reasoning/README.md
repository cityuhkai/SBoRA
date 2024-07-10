# Finetuning LLaMA on Arithmetic reasoning tasks using SBoRA
This directory includes guidelines for reproducing the results regarding arithmetic reasoning in our paper. It is developed following the previous awesome repositorie: [LLM-Adapters](https://github.com/AGI-Edgerunners/LLM-Adapters). 

## Conda environment setup
1. Install dependencies
```bash
conda create -n sbora_ar python=3.10
conda activate sbora_ar
pip install -r requirements.txt
```

## Datasets
Download the training dataset [math_10k.json](https://github.com/AGI-Edgerunners/LLM-Adapters/blob/main/ft-training_set/math_10k.json) and the [evaluation datasets (AddSub, AQuA, gsm8k, mathqa, and SVAMP)](https://github.com/AGI-Edgerunners/LLM-Adapters/tree/main/dataset) and organize the data as follows:
```bash
# Strore the evaluation dataset
./Datasets/dataset
# Finetuning arithmetic dataset
./Datasets/math_10k.json
```

## Getting started
### Code Structure
Refer to `./peft/src/peft/tuners/sbora.py` for the implementation of SBoRA.
Refer to `./finetune.py` for finetuning LLaMA.
Refer to `./evaluate.py` for the evaluation of the finetuned model.
### Fine-tuning and evaluation
The bash scripts provided contain the whole process of first fine-tuning and then evaluating on six sub-tasks. Note that to use LLaMA3-8B, it is required to apply for the [access token](https://huggingface.co/docs/hub/en/security-tokens) and replace it with [hftoken]. Replace the [output_dir] with your own path to store the outputs.
#### LLaMA-7B: SBoRA-FA with rank 64
```
sh llama_sborafa_traineval.sh 64 128 [output_dir] 0 [hftoken]
```
#### LLaMA3-8B: SBoRA-FA with rank 32
```
sh llama3_sborafa_traineval.sh 32 64 [output_dir] 0 [hftoken]
```

## Acknowledgement
This repo takes reference for [LLM-Adapters](https://github.com/AGI-Edgerunners/LLM-Adapters). Thanks for their wonderful works.
