#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0

export JAR="/gpfs42/robbyfs/homes/aplic/noarch/software/mobster/0.2.4.1-GCCcore-11.3.0/resources/MobsterVCF";
patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")

for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do
        export INPUT="/homes/users/ahirata/scratch/ahirata/mobster_results/WES_ME/"${pattern}${j}"/Results/Final_"${pattern}${j}"_predictions.txt";
        export OUTPUT="/homes/users/ahirata/scratch/ahirata/mobster_results/WES_ME/"${pattern}${j}"/Results/Final_"${pattern}${j}".vcf";
        java -jar $JAR/MobsterVCF-0.0.1-SNAPSHOT.jar -file $INPUT -out $OUTPUT
    done
done
