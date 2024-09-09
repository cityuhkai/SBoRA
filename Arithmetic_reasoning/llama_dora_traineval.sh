# Develop by CityUHK-AI Group, Liu Yuyang

CUDA_VISIBLE_DEVICES=$4 python finetune.py \
  --base_model 'yahma/llama-7b-hf' \
  --data_path './Datasets/math_10k.json' \
  --output_dir $3 \
  --batch_size 8 \
  --micro_batch_size 4 \
  --num_epochs 3 \
  --learning_rate 3e-4 \
  --cutoff_len 256 \
  --val_set_size 120 \
  --adapter_name dora \
  --lora_r $1 \
  --lora_alpha $2 \
  --target_modules '["q_proj", "k_proj", "v_proj", "up_proj", "down_proj"]' \
  --hftoken $5

CUDA_VISIBLE_DEVICES=$4 python evaluate.py \
    --model LLaMA-7B \
    --adapter DoRA   \
    --dataset SVAMP \
    --base_model 'yahma/llama-7b-hf' \
    --lora_weights $3|tee -a $3/SVAMP.txt \
    --hftoken $5

CUDA_VISIBLE_DEVICES=$4 python evaluate.py \
    --model LLaMA-7B \
    --adapter DoRA   \
    --dataset AddSub \
    --base_model 'yahma/llama-7b-hf' \
    --lora_weights $3|tee -a $3/AddSub.txt \
    --hftoken $5

CUDA_VISIBLE_DEVICES=$4 python evaluate.py \
    --model LLaMA-7B \
    --adapter DoRA   \
    --dataset MultiArith \
    --base_model 'yahma/llama-7b-hf' \
    --lora_weights $3|tee -a $3/MultiArith.txt \
    --hftoken $5

CUDA_VISIBLE_DEVICES=$4 python evaluate.py \
    --model LLaMA-7B \
    --adapter DoRA   \
    --dataset SingleEq \
    --base_model 'yahma/llama-7b-hf' \
    --lora_weights $3|tee -a $3/SingleEq.txt \
    --hftoken $5

CUDA_VISIBLE_DEVICES=$4 python evaluate.py \
    --model LLaMA-7B \
    --adapter DoRA   \
    --dataset gsm8k \
    --base_model 'yahma/llama-7b-hf' \
    --lora_weights $3|tee -a $3/gsm8k.txt \
    --hktoken $5

CUDA_VISIBLE_DEVICES=$4 python evaluate.py \
    --model LLaMA-7B \
    --adapter DoRA   \
    --dataset AQuA \
    --base_model 'yahma/llama-7b-hf' \
    --lora_weights $3|tee -a $3/AQuA.txt \
    --hftoken $5
