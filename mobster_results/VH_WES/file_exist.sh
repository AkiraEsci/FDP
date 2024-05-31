#!/usr/bin/bash
#SBATCH --partition=haswell
patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do
        if test -f "/homes/users/ahirata/scratch/ahirata/mobster_results/WES_ME/"${pattern}${j}"/Results/Final_"${pattern}${j}".annotated.tsv"; then
            echo "File exists."
        fi
    done
done