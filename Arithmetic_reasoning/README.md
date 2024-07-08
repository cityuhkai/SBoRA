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
Download the training dataset [math_10k.json](https://github.com/AGI-Edgerunners/LLM-Adapters/blob/main/ft-training_set/math_10k.json) and the [evaluation datasets (AddSub, AQuA, gsm8k, mathqa, and SVAMP)](https://github.com/AGI-Edgerunners/LLM-Adapters/tree/main/dataset)
