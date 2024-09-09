# Developed by CityUHK-AI Group, Liu Yuyang

CUDA_VISIBLE_DEVICES=0 python qsbora.py \
    --model_name_or_path 'meta-llama/Meta-Llama-3-8B' \
    --lora_name SB_FA_sampleMul \
    --output_dir $1 \
    --dataset alpaca \
    --do_train True \
    --do_eval True \
    --do_mmlu_eval True \
    --source_max_len 384 \
    --target_max_len 128 \
    --per_device_train_batch_size 16 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --logging_steps 10 \
    --max_steps 10000 \
    --save_strategy steps \
    --data_seed 42 \
    --save_steps 2000 \
    --save_total_limit 40 \
    --evaluation_strategy steps \
    --eval_dataset_size 1024 \
    --max_eval_samples 1000 \
    --eval_steps 2000 \
    --optim paged_adamw_32bit \
