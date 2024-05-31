#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=16G 
module load mobster/0.2.4.1-GCCcore-11.3.0

patterns=("i" "f" "m" "s" "i" "f" "i" "m" "f" "i" "m" "f")
numbers=("17" "17" "17" "11" "11" "11" "16" "16" "16" "01" "01" "01")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    
    mkdir /gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/VH/$dir_name/Results
    export BAM="/gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/VH/"$dir_name"/"$dir_name"_sorted.bam";
    export SAMPLE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/VH/"$dir_name"/Results/Sample_"$dir_name;
    export RESUL="/gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/VH/"$dir_name"/Results/Final_"$dir_name;
    java -Xmx8G -jar $EBROOTMOBSTER/MobileInsertions-0.2.4.1.jar \
        -properties $EBROOTMOBSTER/Mobster.properties \
        -in $BAM\
        -sn $SAMPLE \
        -out $RESUL
done