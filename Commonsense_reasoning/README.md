# Finetuning LLaMA on Commonsense reasoning tasks using SBoRA
This directory includes the SBoRA implementation and guidelines for reproducing the results in our paper. It is developed following the previous awesome works: [DoRA](https://github.com/NVlabs/DoRA) and [LLM-Adapters](https://github.com/AGI-Edgerunners/LLM-Adapters).

## Setup
1. Install dependencies
```bash
conda create -n dora_llama python=3.10
conda activate sbora_cr
pip install -r requirements.txt
```

## Datasets
1. Download the complete commonsense datasets from [here](https://github.com/AGI-Edgerunners/LLM-Adapters/tree/main/dataset) and download the commonsense 170k finetuning dataset from [here](https://github.com/AGI-Edgerunners/LLM-Adapters/blob/main/ft-training_set/commonsense_170k.json), then organize the data as follows:
```bash
# Store the complete commonsense datasets
./Datasets/dataset
# rest of the files
./Datasets/experiment
./Datasets/peft
# Finetuning commonsense dataset
./Datasets/commonsense_170k.json
...
```
## Getting started
### Code Structure
Refer to `./peft/src/peft/tuners/sbora.py` for the implementation of SBoRA.
Refer to `./finetune.py` for finetuning LLaMA.
Refer to `./commonsense_evaluate.py` for the evaluation of the finetuned model.
### Fine-tuning and Evaluation
The bash scripts provided contain the whole process of first fine-tuning and then evaluating on eight sub-tasks. Note that to use LLaMA3-8B, it is required to apply for the [access token](https://huggingface.co/docs/hub/en/security-tokens) and replace it with [hgtoken]. Replace the [output_dir] with your own path to store the outputs.
#### LLaMA-7B: SBoRA-FA with rank 64
```
sh llama_7B_SBoRA-FA_traineval.sh 64 128 [output_dir] 0 [hgtoken]
```
#### LLaMA3-8B: SBoRA-FA with rank 32
```
sh llama_7B_SBoRA-FA_traineval.sh 32 64 [output_dir] 0 [hgtoken]
```
## Acknowledgement
This repo take reference for [LLM-Adapters](https://github.com/AGI-Edgerunners/LLM-Adapters) and [DoRA](https://github.com/NVlabs/DoRA). Thanks for their wonderful works.
