#!/bin/bash

for ((i=54; i<=78; i++))
do
    if [ $i -ge 64 ] && [ $i -le 68 ]; then
        continue
    fi
    cd AY48$i
    cp Results_ALU/ALU.final_comp.vcf ALU.vcf
    cp Results_LINE1/LINE1.final_comp.vcf LINE1.vcf
    cp Results_SVA/SVA.final_comp.vcf SVA.vcf
    cat ALU.vcf LINE1.vcf SVA.vcf > MEfinal_$i.vcf
    echo "Done"
    cd ..
done

        

