#!/usr/bin/bash
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=32G 

module load AnnotSV/3.0.7-foss-2016b
module load BCFtools/1.3.1-foss-2016b
module load bedtools/2.24.0
module load zlib/1.2.13


export ANNOTDIR="/scratch/lab_genresearch/ahirata/ahirata/AnnotSV/bin/AnnotSV_annotations";
for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        export DIR="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/Family/AY49"$i"/Results";
        export INPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/Family/AY49"$i"/Results/Final_AY49"$i".vcf";       
        AnnotSV -SVinputFile $INPUT -genomeBuild GRCh37 -annotationsDir $ANNOTDIR -outputDir $DIR
    fi
done
