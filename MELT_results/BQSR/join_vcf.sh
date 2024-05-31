#!/bin/bash
for ((i=1;i<=45;i++))
do
    cd BQSR_$i
    cp Results_ALU/ALU.final_comp.vcf ALU.vcf
    cp Results_LINE1/LINE1.final_comp.vcf LINE1.vcf
    cp Results_SVA/SVA.final_comp.vcf SVA.vcf

    cat ALU.vcf LINE1.vcf SVA.vcf > MEfinal_$i.vcf
    echo "Done"
    cd ..
done