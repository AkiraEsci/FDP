#!/usr/bin/bash

module load SAMtools/1.12-GCCcore-8.2.0

patterns=("i" "s" "i" "i" "i")
numbers=("17" "11" "11" "16" "01")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    cd /gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAseq/$dir_name
    samtools index $dir_name"_sorted.bam"
done