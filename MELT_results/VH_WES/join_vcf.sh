#!/bin/bash
patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")

for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do  
        cd ${pattern}${range}
        cp Results_ALU/ALU.final_comp.vcf ALU.vcf
        cp Results_LINE1/LINE1.final_comp.vcf LINE1.vcf
        cp Results_SVA/SVA.final_comp.vcf SVA.vcf
        cat ALU.vcf LINE1.vcf SVA.vcf > MEfinal_${pattern}${range}.vcf
        echo "Done"
        cd ..
    done
done

