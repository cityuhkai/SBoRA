# Developed by CityUHK-AI group, Liu Yuyang

CUDA_VISIBLE_DEVICES=$4 python finetune.py \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --data_path ./Datasets/commonsense_170k.json \
    --output_dir $3 \
    --batch_size 16  --micro_batch_size 2 --num_epochs 1 \
    --learning_rate 2e-4 --cutoff_len 256 --val_set_size 120 \
    --eval_step 80 --save_step 80  --adapter_name sbora_fb \
    --target_modules '["q_proj", "k_proj", "v_proj", "up_proj", "down_proj"]' \
    --lora_r $1 --lora_alpha $2 --use_gradient_checkpointing \
    --hgtoken $5


CUDA_VISIBLE_DEVICES=$4 python commonsense_evaluate.py \
    --model LLaMA3-8B \
    --adapter SBoRA_FB \
    --dataset boolq \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --batch_size 1 \
    --lora_weights $3|tee -a $3/boolq.txt \
    --hgtoken $5

CUDA_VISIBLE_DEVICES=$4 python commonsense_evaluate.py \
    --model LLaMA3-8B \
    --adapter SBoRA_FB \
    --dataset piqa \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --batch_size 1 \
    --lora_weights $3|tee -a $3/piqa.txt \
    --hgtoken $5

CUDA_VISIBLE_DEVICES=$4 python commonsense_evaluate.py \
    --model LLaMA3-8B \
    --adapter SBoRA_FB \
    --dataset social_i_qa \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --batch_size 1 \
    --lora_weights $3|tee -a $3/social_i_qa.txt \
    --hgtoken $5

CUDA_VISIBLE_DEVICES=$4 python commonsense_evaluate.py \
    --model LLaMA3-8B \
    --adapter SBoRA_FB \
    --dataset hellaswag \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --batch_size 1 \
    --lora_weights $3|tee -a $3/hellaswag.txt \
    --hgtoken $5

CUDA_VISIBLE_DEVICES=$4 python commonsense_evaluate.py \
    --model LLaMA3-8B \
    --adapter SBoRA_FB \
    --dataset winogrande \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --batch_size 1 \
    --lora_weights $3|tee -a $3/winogrande.txt \
    --hgtoken $5

CUDA_VISIBLE_DEVICES=$4 python commonsense_evaluate.py \
    --model LLaMA3-8B \
    --adapter SBoRA_FB \
    --dataset ARC-Challenge \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --batch_size 1 \
    --lora_weights $3|tee -a $3/ARC-Challenge.txt \
    --hgtoken $5

CUDA_VISIBLE_DEVICES=$4 python commonsense_evaluate.py \
    --model LLaMA3-8B \
    --adapter SBoRA_FB \
    --dataset ARC-Easy \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --batch_size 1 \
    --lora_weights $3|tee -a $3/ARC-Easy.txt \
    --hgtoken $5

CUDA_VISIBLE_DEVICES=$4 python commonsense_evaluate.py \
    --model LLaMA3-8B \
    --adapter SBoRA_FB \
    --dataset openbookqa \
    --base_model 'meta-llama/Meta-Llama-3-8B' \
    --batch_size 1 \
    --lora_weights $3|tee -a $3/openbookqa.txt \
    --hgtoken $5