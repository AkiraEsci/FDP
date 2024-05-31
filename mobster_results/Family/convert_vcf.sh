#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0

export JAR="/gpfs42/robbyfs/homes/aplic/noarch/software/mobster/0.2.4.1-GCCcore-11.3.0/resources/MobsterVCF";
for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        export INPUT="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49"$i"/Results/Final_AY49"$i"_predictions.txt";
        export OUTPUT="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/Family/AY49"$i"/Results/Final_AY49"$i".vcf";
        java -jar $JAR/MobsterVCF-0.0.1-SNAPSHOT.jar -file $INPUT -out $OUTPUT
    fi
done