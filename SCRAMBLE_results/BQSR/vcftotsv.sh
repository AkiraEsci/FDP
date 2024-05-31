#!/usr/bin/bash

module load vcf2tsvpy/0.6.1-Miniconda3-4.9.2
source activate vcf2tsvpy
for ((i=1;i<=45;i++))
do
    export FILE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/BQSR/BQSR_S"$i"/Results/Final_S"$i".vcf";
    export OUTPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/BQSR/BQSR_S"$i"/Results/Final_S"$i".tsv";
    vcf2tsvpy --input_vcf $FILE --out_tsv $OUTPUT 
done