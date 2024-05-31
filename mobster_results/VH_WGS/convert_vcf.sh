#!/usr/bin/bash
#SBATCH --partition=haswell
module load mobster/0.2.4.1-GCCcore-11.3.0

export JAR="/gpfs42/robbyfs/homes/aplic/noarch/software/mobster/0.2.4.1-GCCcore-11.3.0/resources/MobsterVCF";
patterns=("i" "f" "m" "s" "i" "f" "i" "m" "f" "i" "m" "f")
numbers=("17" "17" "17" "11" "11" "11" "16" "16" "16" "01" "01" "01")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    
    export INPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/VH/"$dir_name"/Results/Final_"$dir_name"_predictions.txt";
    export OUTPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/VH/"$dir_name"/Results/Final_"$dir_name".vcf";
    java -jar $JAR/MobsterVCF-0.0.1-SNAPSHOT.jar -file $INPUT -out $OUTPUT
done
