#!/usr/bin/bash
module load SAMtools/1.12-GCCcore-8.2.0

for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        cd /homes/users/ahirata/scratch/ahirata/SCRAMble_results/Family/AY49$i
        samtools index AY49$i.bam
    fi
done