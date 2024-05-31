#!/usr/bin/bash

module load vcf2tsvpy/0.6.1-Miniconda3-4.9.2
source activate vcf2tsvpy


export FILE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/SCRAMBLE_res/final_res.vcf";
export OUTPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/SCRAMBLE_res/final_res.tsv";
vcf2tsvpy --input_vcf $FILE --out_tsv $OUTPUT

