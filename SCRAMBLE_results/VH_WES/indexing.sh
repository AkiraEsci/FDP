#!/usr/bin/bash
module load SAMtools/1.12-GCCcore-8.2.0

patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")

for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do
    
        cd "${pattern}${j}"
        samtools index "${pattern}${j}.bam"
        cd ..
    done
done
