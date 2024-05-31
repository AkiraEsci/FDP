#!/usr/bin/bash
module load SAMtools/1.12-GCCcore-8.2.0

patterns=("i" "f" "m" "s" "i" "f" "i" "m" "i" "m" "f" "f" )
numbers=("17" "17" "17" "11" "11" "11" "16" "16" "01" "01" "01" "16" )
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    cd $dir_name
    samtools index $dir_name"_sorted.bam"
    cd ..

done
