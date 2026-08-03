#!/bin/bash
#SBATCH --job-name=hisat2_map
#SBATCH --mem=256GB
#SBATCH --time=5-00:00
#SBATCH --partition=
#SBATCH --cpus-per-task=48

set -euo pipefail


conda activate rnaseq

INPUT_DIR="trimmed_out"
OUTPUT_DIR="mapped_out_database"
REF="database_genome/Hongyang_genome_v3.0_update.fa"

mkdir -p ${OUTPUT_DIR}


if [[ ! -f ${REF}.1.ht2 ]]; then
    echo "Building HISAT2 index..."
    hisat2-build -p ${SLURM_CPUS_PER_TASK} \
        --bmax 50000000 \
        --dcv 1024 \
        ${REF} ${REF}
fi


for R1 in ${INPUT_DIR}/*1_trimmed.fastq.gz
do
    BASE=$(basename ${R1} 1_trimmed.fastq.gz)
    R2=${INPUT_DIR}/${BASE}2_trimmed.fastq.gz

    echo "Processing ${BASE}..."

    if [[ ! -f ${R2} ]]; then
        echo "Missing pair for ${BASE}, skipping..."
        continue
    fi


    hisat2 -p ${SLURM_CPUS_PER_TASK} \
        -x ${REF} \
        -1 ${R1} -2 ${R2} \
        --mp 2,2 \
        --dta \
        --max-intronlen 50000 \
        -S ${OUTPUT_DIR}/${BASE}.sam


    samtools view -@ ${SLURM_CPUS_PER_TASK} -bS ${OUTPUT_DIR}/${BASE}.sam | \
    samtools sort -@ ${SLURM_CPUS_PER_TASK} \
        -m 4G \
        -o ${OUTPUT_DIR}/${BASE}.bam

    samtools index ${OUTPUT_DIR}/${BASE}.bam

    rm ${OUTPUT_DIR}/${BASE}.sam
done

echo "All samples mapped"