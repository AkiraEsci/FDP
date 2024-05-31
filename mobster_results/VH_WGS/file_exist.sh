#!/usr/bin/bash
#SBATCH --partition=haswell
patterns=("i" "f" "m" "s" "i" "f" "i" "m" "f" "i" "m" "f")
numbers=("17" "17" "17" "11" "11" "11" "16" "16" "16" "01" "01" "01")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    if test -f "/gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/VH/"$dir_name"/Results/Final_"$dir_name".annotated.tsv"; then
        echo "File exists."
    fi
done