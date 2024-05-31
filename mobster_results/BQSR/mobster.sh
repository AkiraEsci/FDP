#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0

for ((i=1;i<=45;i++))
do
    mkdir /scratch/lab_genresearch/ahirata/ahirata/mobster_results/BQSR/BQSR_S$i/Results
    export BAM="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/BQSR/BQSR_S"$i"/BQSR_S"$i".bam";
    export SAMPLE="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/BQSR/BQSR_S"$i"/Results/Sample_S"$i;
    export RESUL="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/BQSR/BQSR_S"$i"/Results/Final_S"$i;
    java -Xmx8G -jar $EBROOTMOBSTER/MobileInsertions-0.2.4.1.jar \
        -properties $EBROOTMOBSTER/Mobster.properties \
        -in $BAM\
        -sn $SAMPLE \
        -out $RESUL
done