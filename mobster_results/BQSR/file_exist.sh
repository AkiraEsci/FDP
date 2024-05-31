#!/usr/bin/bash
#SBATCH --partition=haswell
for ((i=1;i<=45;i++))
do
    if test -f "/homes/users/ahirata/scratch/ahirata/mobster_results/BQSR/BQSR_S"$i"/Results/Final_S"$i".annotated.tsv"; then
        echo "File exists."
    fi
done