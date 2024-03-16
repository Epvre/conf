#!/bin/bash
!git clone --recurse-submodules https://github.com/nomic-ai/gpt4all.git

cd /content/gpt4all
!python -m pip install -r requirements.txt

cd transformers
!pip install -e .

cd ../peft
!pip install -e .

!accelerate launch --dynamo_backend=inductor --num_processes=8 --num_machines=1 --machine_rank=0 --deepspeed_multinode_launcher standard --mixed_precision=bf16  --use_deepspeed --deepspeed_config_file=configs/deepspeed/ds_config.json train.py --config configs/train/finetune.yaml

cd /content/gpt4all/chat
!wget https://the-eye.eu/public/AI/models/nomic-ai/gpt4all/gpt4all-lora-quantized.bin

!./gpt4all-lora-quantized-linux-x86
