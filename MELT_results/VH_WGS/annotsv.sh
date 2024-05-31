#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=16G 

module load AnnotSV/3.0.7-foss-2016b
module load bcftools/1.3.1
module load bedtools/2.24.0
module load zlib/1.2.13

export ANNOTDIR="/homes/users/ahirata/scratch/ahirata/AnnotSV/bin/AnnotSV_annotations";

patterns=("i" "f" "m" "s" "i" "f" "i" "m" "i" "m" "f" "f" )
numbers=("17" "17" "17" "11" "11" "11" "16" "16" "01" "01" "01" "16" )
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    
    export DIR="/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/VH/"$dir_name"/Results";
    export INPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/VH/"$dir_name"/Results/Final_"$dir_name".vcf";
    $ANNOTSV/bin/AnnotSV -SVinputFile $INPUT -genomeBuild GRCh37 -annotationsDir $ANNOTDIR -outputDir $DIR
done
