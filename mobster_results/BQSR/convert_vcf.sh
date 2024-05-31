#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0

export JAR="/gpfs42/robbyfs/homes/aplic/noarch/software/mobster/0.2.4.1-GCCcore-11.3.0/resources/MobsterVCF";
for ((i=1;i<=45;i++))
do
    export INPUT="/homes/users/ahirata/scratch/ahirata/mobster_results/BQSR/BQSR_S"$i"/Results/Final_S"$i"_predictions.txt";
    export OUTPUT="/homes/users/ahirata/scratch/ahirata/mobster_results/BQSR/BQSR_S"$i"/Results/Final_S"$i".vcf";
    java -jar $JAR/MobsterVCF-0.0.1-SNAPSHOT.jar -file $INPUT -out $OUTPUT
done