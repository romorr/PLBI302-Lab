#!/bin/bash
#SBATCH --job-name=eggnog
#SBATCH --mem=128GB
#SBATCH --time=5-00:00
#SBATCH --partition=
#SBATCH --cpus-per-task=48



conda activate eggnog_mapper

python3 /eggnog_mapper/bin/emapper.py -m diamond -i /kiwifruit/database_genome/Hongyang_pep_v3.0.fa --itype proteins --data_dir /eggnog_mapper/bin/data/ -o eggnog_annotation --output_dir . --override

