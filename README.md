# SBoRA: Low-Rank Adaptation with Regional Weight Updates

|[Paper](https://arxiv.org/abs/2407.05413)

This repo supports the paper "SBoRA: Low-Rank Adaptation with Regional Weight Updates". Developed by members from City University of Hong Kong, CityUHK-AI Group.

<h1 align="center">
    <img src="./imgs/brain_weight.png" width=900>
</h1>

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

# Useful Links

# Instruction
This repository contains three main components: **Commonsense_reasoning**; **Arithmetic_reasoning** and **QSBoRA**. Which correspond to the three experiemnts in our paper. Please visit each directory to find more details.

