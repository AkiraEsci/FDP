#!/usr/bin/bash

module load vcf2tsvpy/0.6.1-Miniconda3-4.9.2
source activate vcf2tsvpy

for ((i=54;i<=78;i++))
do  
    if [ $i -ge 64 ] && [ $i -le 68 ]; then
        continue 
    fi
        export FILE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/fmf_bams/AY48"$i"/Results/Final_AY48"$i".vcf";
        export OUTPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/fmf_bams/AY48"$i"/Results/Final_AY48"$i".tsv";
        vcf2tsvpy --input_vcf $FILE --out_tsv $OUTPUT 
done