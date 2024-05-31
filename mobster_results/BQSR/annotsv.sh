#!/usr/bin/bash
module load AnnotSV/3.0.7-foss-2016b
module load bcftools/1.3.1
module load bedtools/2.24.0
module load zlib/1.2.13

export ANNOTDIR="/scratch/lab_genresearch/ahirata/ahirata/AnnotSV/bin/AnnotSV_annotations";

for ((i=1;i<=45;i++))
do
    export DIR="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/BQSR/BQSR_S"$i"/Results";
    export INPUT="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/BQSR/BQSR_S"$i"/Results/Final_S"$i".vcf";
    AnnotSV -SVinputFile $INPUT -genomeBuild GRCh37 -annotationsDir $ANNOTDIR -outputDir $DIR
done
