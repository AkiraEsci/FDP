#!/bin/bash

for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        cd AY49$i
        cp Results_ALU/ALU.final_comp.vcf ALU.vcf
        cp Results_LINE1/LINE1.final_comp.vcf LINE1.vcf
        cp Results_SVA/SVA.final_comp.vcf SVA.vcf

        cat ALU.vcf LINE1.vcf SVA.vcf > MEfinal_$i.vcf
        echo "Done"
        cd ..
    fi
done

