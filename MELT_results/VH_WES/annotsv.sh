#!/usr/bin/bash
module load AnnotSV/3.0.7-foss-2016b
module load bcftools/1.3.1
module load bedtools/2.24.0
module load zlib/1.2.13

export ANNOTDIR="/scratch/lab_genresearch/ahirata/ahirata/AnnotSV/bin/AnnotSV_annotations";

patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")

for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do
        export DIR="/scratch/lab_genresearch/ahirata/ahirata/MELT_results/WES_ME/"${pattern}${j}"/Results";
        export INPUT="/scratch/lab_genresearch/ahirata/ahirata/MELT_results/WES_ME/"${pattern}${j}"/Results/Final_"${pattern}${j}".vcf";
        AnnotSV -SVinputFile $INPUT -genomeBuild GRCh38 -annotationsDir $ANNOTDIR -outputDir $DIR
    done
done
