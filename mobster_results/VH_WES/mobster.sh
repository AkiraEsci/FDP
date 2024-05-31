#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0
patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")

for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do
        mkdir /scratch/lab_genresearch/ahirata/ahirata/mobster_results/WES_ME/${pattern}${j}/Results
        export BAM="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/WES_ME/"${pattern}${j}"/"${pattern}${j}".bam";
        export SAMPLE="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/WES_ME/"${pattern}${j}"/Results/Sample_"${pattern}${j};
        export RESUL="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/WES_ME/"${pattern}${j}"/Results/Final_"${pattern}${j};
        java -Xmx8G -jar $EBROOTMOBSTER/MobileInsertions-0.2.4.1.jar \
            -properties /scratch/lab_genresearch/ahirata/ahirata/mobster_results/Mobster.properties.hg38 \
            -in $BAM\
            -sn $SAMPLE \
            -out $RESUL
    done
done