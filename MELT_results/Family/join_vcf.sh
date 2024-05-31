#!/bin/bash

cd BQSR_$1
cp Results_$2/$2.final_comp.vcf $2.vcf
cp Results_$3/$3.final_comp.vcf $3.vcf
cp Results_$4/$4.final_comp.vcf $4.vcf

cat $2.vcf $3.vcf $4.vcf > MEfinal_$1.vcf

cd ..

