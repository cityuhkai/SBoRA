# SBoRA: Low-Rank Adaptation with Regional Weight Updates

|[Paper](https://arxiv.org/abs/2407.05413)

This repo supports the paper "SBoRA: Low-Rank Adaptation with Regional Weight Updates". Developed by members from City University of Hong Kong, CityUHK-AI Group.

<h1 align="center">
    <img src="./imgs/brain_weight.png" width=900>
</h1>

[Po Lai-Man](https://www.ee.cityu.edu.hk/~lmpo/), Liu Yuyang, Wu Haoxuan, Zhang Tianqi, Yu Wing-Yin, Jiang Zeyu, Li Kun
# Overview

We introduces Standard Basis LoRA (SBoRA), a novel parameter-efficient fine-tuning approach for Large Language Models that builds upon the pioneering works of Low-Rank Adaptation (LoRA) and Orthogonal Adaptation. SBoRA further reduces the computational and memory requirements of LoRA while enhancing learning performance. By leveraging orthogonal standard basis vectors to initialize one of the low-rank matrices, either A or B, SBoRA enables regional weight updates and memory-efficient fine-tuning. This approach gives rise to two variants, SBoRA-FA and SBoRA-FB, where only one of the matrices is updated, resulting in a sparse update matrix with a majority of zero rows or columns. Consequently, the majority of the fine-tuned model's weights remain unchanged from the pre-trained weights. This characteristic of SBoRA, wherein regional weight updates occur, is reminiscent of the modular organization of the human brain, which efficiently adapts to new tasks. Our empirical results demonstrate the superiority of SBoRA-FA over LoRA in various fine-tuning tasks, including commonsense reasoning and arithmetic reasoning. Furthermore, we evaluate the effectiveness of QSBoRA on quantized LLaMA models of varying scales, highlighting its potential for efficient adaptation to new tasks.


<h6 align="center">
    <img src="./imgs/fig1_new.png" width=700>
    </br>
    Four fine-tuning strategies
</h6>
<h6 align="center">
    <img src="./imgs/fig2.png" width=700>
    </br>
    Regional weight update process of SBoRA, showcasing distinct $\mathbf{W}_{0}+\mathrm{\Delta}\mathbf{W}$ computing procedures of SBoRA-FA(upper) and SBoRA-FB(lower). The diagram employs different colors to represent frozen, trainable, and zero parameters.
</h6>

# Instruction
This repository contains three main components: **Commonsense_reasoning**; **Arithmetic_reasoning** and **QSBoRA**. Which correspond to the three experiemnts in our paper. Please visit each directory to find more details.

# Experiments results
## Commonsense reasoning task
| Model / Method| r | TP |  BoolQ  |  PIQA  |  SIQA  |  HellaSwag  |  WinoGrande  |  ARC-e  |  ARC-c  |  OBQA  |  Average  |
|----------|---|----|---------|--------|--------|-------------|--------------|---------|---------|--------|-----------|
|LLaMA-7B / LoRA  | 32 | 56.1M | 66.8 | 81.1 | 78.4 | 53.5 | 80.5 | 81.1 | 61.9 | 79.4 | **72.8** |
|LLaMA-7B / DoRA  | 32 | 57.0M | 68.8 | 82.0 | 70.6 | 57.6 | 73.2 | 79.4 | 64.2 | 78.2 | 71.7     |
|LLaMA-7B / SBoRA-FA | 32 | 28.0M | 68.0 | 79.7 | 76.2 | 54.4 | 79.1 | 79.8 | 61.3 | 75.0 | 71.7 |
|LLaMA-7B / SBoRA-FB | 32 | 28.0M | 66.1 | 64.2 | 74.8 | 57.2 | 71.5 | 80.4 | 62.4 | 75.8 | 64.9 |
|LLaMA-7B / LoRA   | 64 | 112.M | 62.1 | 81.8 | 78.2 | 62.9 | 78.6 | 79.8 | 63.7 | 81.2 | 73.5   |
|LLaMA-7B / DoRA   | 64 | 113.1M | 68.7 | 82.8 | 78.2 | 64.8 | 62.9 | 79.7 | 64.8 | 80.0 | 72.7  |
|LLaMA-7B / SBoRA-FA  | 64 | 56.1M | 68.2 | 81.3 | 77.6 | 74.7 | 81.1 | 80.8 | 62.8 | 79.4 | **75.7** |
|LLaMA-7B / SBoRA-FB  | 64 | 56.1M | 66.5 | 79.2 | 76.7 | 59.2 | 76.5 | 76.8 | 59.0 | 74.4 | 71.0 |
|LLaMA3-8B / LoRA | 32 | 56.6M | 71.9 | 86.7 | 80.4 | 94.0 | 85.6 | 87.8 | 75.9 | 83.6 | 83.2 |
|LLaMA3-8B / DoRA | 32 | 57.4M | 73.6 | 87.1 | 80.8 | 94.4 | 86.1 | 88.8 | 78.3 | 84.2 | 84.2 |
|LLaMA3-8B / SBoRA-FA | 32 | 25.2M | 73.3 | 87.8 | 79.1 | 93.9 | 85.2 | 89.9 | 80.0 | 86.0 | **84.4** |
|LLaMA3-8B / SBoRA-FB | 32 | 31.5M | 72.9 | 86.3 | 78.8 | 92.6 | 83.0 | 88.8 | 76.3 | 85.0 | 83.0 |
|LLaMA3-8B / LoRA | 64 | 113.2M | 72.5 | 87.8 | 80.3 | 94.4 | 86.4 | 88.7 | 79.3 | 85.2 | 84.3 |
|LLaMA3-8B / DoRA | 64 | 114.0M | 70.5 | 86.0 | 80.3 | 91.8 | 83.7 | 86.2 | 74.7 | 83.2 | 82.1 |
|LLaMA3-8B / SBoRA-FA | 64 | 50.3M | 74.0 | 88.3 | 80.8 | 94.3 | 86.3 | 89.9 | 78.7 | 86.6 | **84.9** |
|LLaMA3-8B / SBoRA-FB | 64 | 62.9M | 71.8 | 85.2 | 79.2 | 91.4 | 82.9 | 86.7 | 74.0 | 83.4 | 81.8 |

## Arithmetic reasoning task
| Model / Method



# Contact
Po Lai-Man: eelmpo@cityu.edu.hk; Liu Yuyang: yuyangliu5-c@my.cityu.edu.hk

