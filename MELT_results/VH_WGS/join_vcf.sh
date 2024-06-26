#!/bin/bash

patterns=("i" "f" "m" "s" "i" "f" "i" "m" "i" "m" "f" "f" )
numbers=("17" "17" "17" "11" "11" "11" "16" "16" "01" "01" "01" "16" )
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    cd $dir_name
    cp Results_ALU/ALU.final_comp.vcf ALU.vcf
    cp Results_LINE1/LINE1.final_comp.vcf LINE1.vcf
    cp Results_SVA/SVA.final_comp.vcf SVA.vcf
    cat ALU.vcf LINE1.vcf SVA.vcf > MEfinal_$dir_name.vcf

    cd ..
done



