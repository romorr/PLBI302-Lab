#!/bin/bash
#SBATCH --job-name=subset
#SBATCH --mem=128GB
#SBATCH --time=5-00:00
#SBATCH --partition=
#SBATCH --cpus-per-task=48


conda activate rnaseq

# Define directories and reference (reference not used in this step)
INPUT_DIR="mapped_out_database"
INPUT_BEDS="bed"
OUTPUT_DIR="mapped_out_database/subset"
REF="database_genome/Hongyang_genome_v3.0_update.fa"   # kept for potential later use

# Create output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Check that input directories exist
if [[ ! -d "${INPUT_DIR}" ]]; then
    echo "Error: INPUT_DIR '${INPUT_DIR}' does not exist."
    exit 1
fi
if [[ ! -d "${INPUT_BEDS}" ]]; then
    echo "Error: INPUT_BEDS '${INPUT_BEDS}' does not exist."
    exit 1
fi

# Find all BAM files in INPUT_DIR (recursively if needed, adjust pattern)
# This assumes BAM files have .bam extension
BAM_FILES=($(find "${INPUT_DIR}" -maxdepth 1 -type f -name "*.bam" | sort))
if [[ ${#BAM_FILES[@]} -eq 0 ]]; then
    echo "No BAM files found in ${INPUT_DIR}"
    exit 1
fi

# Find all BED files in INPUT_BEDS
BED_FILES=($(find "${INPUT_BEDS}" -maxdepth 1 -type f -name "*.bed" | sort))
if [[ ${#BED_FILES[@]} -eq 0 ]]; then
    echo "No BED files found in ${INPUT_BEDS}"
    exit 1
fi

echo "Found ${#BAM_FILES[@]} BAM file(s) and ${#BED_FILES[@]} BED file(s)."
echo "Processing all combinations..."

# Loop over each BAM file
for bam in "${BAM_FILES[@]}"; do
    # Extract base name without path and .bam extension
    bam_base=$(basename "${bam}" .bam)
    
    # Loop over each BED file
    for bed in "${BED_FILES[@]}"; do
        # Extract base name without path and .bed extension
        bed_base=$(basename "${bed}" .bed)
        
        # Define output filename: bam_base_bed_base.bam
        out_bam="${OUTPUT_DIR}/${bam_base}_${bed_base}.bam"
        
        echo "Processing: ${bam} with ${bed} -> ${out_bam}"
        
        # Run samtools view with the provided options
        samtools view -M -b -@ 16 -L "${bed}" "${bam}" -o "${out_bam}"
        
        # Check return status
        if [[ $? -eq 0 ]]; then
            echo "  Successfully created ${out_bam}"
        else
            echo "  Error processing ${bam} with ${bed}"
        fi
    done
done

echo "All subsetting completed."

