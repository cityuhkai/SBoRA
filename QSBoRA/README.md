# QSBoRA: Efficient Finetuning of Quantized LLMs
This directory includes the QSBoRA implementation and guidelines for reproducing the results regarding QSBoRA in our paper. It is developed following previous awesome repository: [QLoRA](https://github.com/artidoro/qlora). 

## Conda Environment setup
Following the experiemntal settings in QLoRA, the models should be loaded in 4bits with transformers and bitandbytes, so that you should install accelerate and transformers from source and make sure you have the latest version of the bitsandbytes library. After installing PyTorch (follow instructions [here](https://pytorch.org/get-started/locally/)), set up the conda environment with the following command:

```bash
conda create -n qsbora python=3.10
conda activate qsbora
pip install -U -r requirements.txt
```
