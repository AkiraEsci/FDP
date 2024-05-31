#!/usr/bin/bash

module load vcf2tsvpy/0.6.1-Miniconda3-4.9.2
source activate vcf2tsvpy

patterns=("i" "f" "m" "s" "i" "f" "i" "m" "f" "i" "m" "f")
numbers=("17" "17" "17" "11" "11" "11" "16" "16" "16" "01" "01" "01")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    
    export FILE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/"$dir_name"/Results/Final_"$dir_name".vcf";
    export OUTPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/"$dir_name"/Results/Final_"$dir_name".tsv";
    vcf2tsvpy --input_vcf $FILE --out_tsv $OUTPUT 
done