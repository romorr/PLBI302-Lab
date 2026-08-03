#!/bin/bash
#SBATCH --job-name=featurecounts
#SBATCH --mem=128GB
#SBATCH --time=5-00:00
#SBATCH --partition=aoraki
#SBATCH --cpus-per-task=48

module load r/4.5

Rscript /home/grero296/project/kiwifruit/featurecounts.R
