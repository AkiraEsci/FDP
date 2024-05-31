#!/usr/bin/bash
module load SAMtools/1.12-GCCcore-8.2.0

for ((i=54;i<=78;i++))
do  
    if [ $i -ge 64 ] && [ $i -le 68 ]; then
        continue 
    fi
    cd /homes/users/ahirata/scratch/ahirata/MELT_results/fmf_bams/AY48$i
    samtools index AY48$i.bam
done