#!/usr/bin/bash
module load SAMtools/1.12-GCCcore-8.2.0

for ((i=1;i<=45;i++))
do
    cd /homes/users/ahirata/scratch/ahirata/MELT_results/BQSR/BQSR_S$i
    samtools index BQSR_S$i.bam
done