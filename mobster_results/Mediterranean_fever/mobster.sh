#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0

for ((i=54;i<=78;i++))
do
    if [ $i -ge 64 ] && [ $i -le 68 ]; then
        continue 
    fi
    mkdir /scratch/lab_genresearch/ahirata/ahirata/mobster_results/fmf_bams/AY48$i/Results
    export BAM="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/fmf_bams/AY48"$i"/AY48"$i".bam";
    export SAMPLE="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/fmf_bams/AY48"$i"/Results/Sample_AY48"$i;
    export RESUL="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/fmf_bams/AY48"$i"/Results/Final_AY48"$i;
    java -Xmx8G -jar $EBROOTMOBSTER/MobileInsertions-0.2.4.1.jar \
        -properties $EBROOTMOBSTER/Mobster.properties \
        -in $BAM\
        -sn $SAMPLE \
        -out $RESUL
done