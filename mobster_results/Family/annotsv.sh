#!/usr/bin/bash
module load AnnotSV/3.0.7-foss-2016b
module load bcftools/1.3.1
module load bedtools/2.24.0
module load zlib/1.2.13

export ANNOTDIR="/scratch/lab_genresearch/ahirata/ahirata/AnnotSV/bin/AnnotSV_annotations";

for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        export DIR="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49"$i"/Results";
        export INPUT="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49"$i"/Results/Final_AY49"$i".vcf";
        AnnotSV -SVinputFile $INPUT -genomeBuild GRCh37 -annotationsDir $ANNOTDIR -outputDir $DIR
    fi
done
