#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0

for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        mkdir /scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49$i/Results
        export BAM="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49"$i"/AY49"$i".bam";
        export SAMPLE="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49"$i"/Results/Sample_AY49"$i;
        export RESUL="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49"$i"/Results/Final_AY49"$i;
        java -Xmx8G -jar $EBROOTMOBSTER/MobileInsertions-0.2.4.1.jar \
            -properties $EBROOTMOBSTER/Mobster.properties \
            -in $BAM\
            -sn $SAMPLE \
            -out $RESUL
    fi
done
