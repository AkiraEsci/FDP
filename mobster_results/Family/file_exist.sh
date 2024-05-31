#!/usr/bin/bash
#SBATCH --partition=haswell
for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        if test -f "/scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49"$i"/Results/Final_AY49"$i"_predictions.txt"; then
            echo "File exists."
        fi
    fi
done