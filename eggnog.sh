#!/bin/bash
#SBATCH --job-name=eggnog
#SBATCH --mem=128GB
#SBATCH --time=5-00:00
#SBATCH --partition=aoraki
#SBATCH --cpus-per-task=48


module load miniconda3/25
source /home/grero296/.bashrc
conda activate eggnog_mapper

python3 /home/grero296/project/storage/eggnog_mapper/bin/emapper.py -m diamond -i /home/grero296/project/kiwifruit/database_genome/Hongyang_pep_v3.0.fa --itype proteins --data_dir /home/grero296/project/storage/eggnog_mapper/bin/data/ -o eggnog_annotation --output_dir . --override

