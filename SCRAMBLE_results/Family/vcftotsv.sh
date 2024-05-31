#!/usr/bin/bash

module load vcf2tsvpy/0.6.1-Miniconda3-4.9.2
source activate vcf2tsvpy
for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        export FILE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/Family/AY49"$i"/Results/Final_AY49"$i".vcf";
        export OUTPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/Family/AY49"$i"/Results/Final_AY49"$i".tsv";
        vcf2tsvpy --input_vcf $FILE --out_tsv $OUTPUT 
    fi
done