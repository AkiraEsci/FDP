#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0

export JAR="/gpfs42/robbyfs/homes/aplic/noarch/software/mobster/0.2.4.1-GCCcore-11.3.0/resources/MobsterVCF";
for ((i=54;i<=78;i++))
do
    if [ $i -ge 64 ] && [ $i -le 68 ]; then
        continue 
    fi
    export INPUT="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/fmf_bams/AY48"$i"/Results/Final_AY48"$i"_predictions.txt";
    export OUTPUT="/scratch/lab_genresearch/ahirata/ahirata/mobster_results/fmf_bams/AY48"$i"/Results/Final_AY48"$i".vcf";
    java -jar $JAR/MobsterVCF-0.0.1-SNAPSHOT.jar -file $INPUT -out $OUTPUT
done