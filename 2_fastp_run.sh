#!/bin/bash
#SBATCH --job-name=fastp_kiwifruit                # define the job name
#SBATCH --mem=128GB                      # request an allocation with 128GB of ram
#SBATCH --time=5-00:00                  # wall time DD-HH:MM
#SBATCH --partition=             # partition to which job should be submitted
#SBATCH --cpus-per-task=48             # cpu-cores per task

set -e  # stop if something fails

conda activate fastqc (contains fastp version 0.23.2)

INPUT_DIR="/kiwifruit/PRJNA1413911"
OUTPUT_DIR="trimmed_out"

mkdir -p $OUTPUT_DIR

for R1 in ${INPUT_DIR}/*1.fastq.gz
do
    BASE=$(basename $R1 1.fastq.gz)
    R2=${INPUT_DIR}/${BASE}2.fastq.gz

    echo "Processing $BASE..."

    fastp \
      -i $R1 \
      -I $R2 \
      -o ${OUTPUT_DIR}/${BASE}1_trimmed.fastq.gz \
      -O ${OUTPUT_DIR}/${BASE}2_trimmed.fastq.gz \
      -h ${OUTPUT_DIR}/${BASE}_fastp.html \
      --detect_adapter_for_pe

done

echo "All samples processed."
