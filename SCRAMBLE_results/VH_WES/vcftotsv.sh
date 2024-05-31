#!/usr/bin/bash

module load vcf2tsvpy/0.6.1-Miniconda3-4.9.2
source activate vcf2tsvpy

patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")

for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do  
        export FILE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/WES_ME/"${pattern}${j}"/Results/Final_"${pattern}${j}".vcf";
        export OUTPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/WES_ME/"${pattern}${j}"/Results/Final_"${pattern}${j}".tsv";
        vcf2tsvpy --input_vcf $FILE --out_tsv $OUTPUT
    done
done