#!/bin/bash
#SBATCH --job-name=SRAS
#SBATCH --mem=64GB
#SBATCH --time=5-00:00
#SBATCH --partition=aoraki
#SBATCH --cpus-per-task=48


wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/044/SRR13737944/SRR13737944_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/043/SRR13737943/SRR13737943_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/049/SRR13737949/SRR13737949_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/046/SRR13737946/SRR13737946_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/041/SRR13737941/SRR13737941_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/052/SRR13737952/SRR13737952_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/050/SRR13737950/SRR13737950_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/040/SRR13737940/SRR13737940_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/042/SRR13737942/SRR13737942_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/045/SRR13737945/SRR13737945_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/046/SRR13737946/SRR13737946_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/043/SRR13737943/SRR13737943_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/041/SRR13737941/SRR13737941_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/051/SRR13737951/SRR13737951_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/047/SRR13737947/SRR13737947_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/053/SRR13737953/SRR13737953_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/042/SRR13737942/SRR13737942_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/048/SRR13737948/SRR13737948_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/044/SRR13737944/SRR13737944_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/050/SRR13737950/SRR13737950_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/052/SRR13737952/SRR13737952_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/051/SRR13737951/SRR13737951_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/040/SRR13737940/SRR13737940_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/048/SRR13737948/SRR13737948_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/047/SRR13737947/SRR13737947_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/053/SRR13737953/SRR13737953_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/045/SRR13737945/SRR13737945_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR137/049/SRR13737949/SRR13737949_2.fastq.gz
