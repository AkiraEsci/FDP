#!/usr/bin/bash
#SBATCH --mem-per-cpu=16G 

module load AnnotSV/3.0.7-foss-2016b
module load BCFtools/1.3.1-foss-2016b
module load bedtools/2.24.0
module load zlib/1.2.13


export ANNOTDIR="/scratch/lab_genresearch/ahirata/ahirata/AnnotSV/bin/AnnotSV_annotations";
for ((i=54; i<=78; i++))
do
    export DIR="/scratch/lab_genresearch/ahirata/ahirata/MELT_results/fmf_bams/AY48"$i"/Results";
    export INPUT="/scratch/lab_genresearch/ahirata/ahirata/MELT_results/fmf_bams/AY48"$i"/Results/Final_AY48"$i".vcf";
    if [ $i -ge 64 ] && [ $i -le 68 ]; then
        continue
    fi
    AnnotSV -SVinputFile $INPUT -genomeBuild GRCh37 -annotationsDir $ANNOTDIR -outputDir $DIR
done

