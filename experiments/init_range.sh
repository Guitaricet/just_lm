set -e

export TOKENIZERS_PARALLELISM=false
export WANDB_START_METHOD="thread"
export OUTPUT_DIR=output_dir

for init_range in 0.2 0.02; do
    echo "Running experiment with init_range=$init_range"
    python train.py \
        --output_dir $OUTPUT_DIR \
        --do_train \
        --do_eval \
        --config_name gpt2 \
        --dataset_name wikitext \
        --dataset_config_name wikitext-103-v1 \
        --block_size 256 \
        --per_device_train_batch_size 64 \
        --preprocessing_num_workers 8 \
        --learning_rate 6e-4 \
        --num_train_epochs 1 \
        --warmup_steps 200 \
        --logging_steps 50 \
        --eval_steps 500 \
        --save_steps 1000 \
        --init_range $init_range

done
