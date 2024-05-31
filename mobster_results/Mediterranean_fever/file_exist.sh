#!/usr/bin/bash
#SBATCH --partition=haswell
for ((i=54;i<=78;i++))
do
    if [ $i -ge 64 ] && [ $i -le 68 ]; then
        continue 
    fi
    if test -f "/scratch/lab_genresearch/ahirata/ahirata/mobster_results/fmf_bams/AY48"$i"/Results/Final_AY48"$i".annotated.tsv"; then
        echo "File exists."
    fi
done