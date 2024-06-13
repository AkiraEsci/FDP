#!/usr/bin/bash

export TYPE="LINE1"; # ALU LINE1 SVA
#The paths that are not related to the MELT module must be the ones what are shown when you use the "pwd -P" command on terminal
export GENOME="/homes/users/ahirata/scratch/ahirata/Reference/hg38.fa";
export MELT="/homes/users/ahirata/scratch/ahirata/MELTv2.2.2";
#export BED=$EBROOTMELT"/add_bed_files/1KGP_Hg19/hg19.genes.bed";
export BED=$EBROOTMELT"add_bed_files/Hg38/Hg38.genes.bed";
#export ME=$EBROOTMELT"/me_refs/1KGP_Hg19/"$TYPE"_MELT.zip";
export ME=$EBROOTMELT"me_refs/Hg38/"$TYPE"_MELT.zip";

module load MELT/v2.2.2-GCC-8.3.0 
module load Java/17.0.4
module load SAMtools/1.18-GCC-12.3.0
module load Bowtie2/2.3.4.2-foss-2018b

patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do  
        export DIRECTORY="/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/WES_ME/"${pattern}${range};
        export DIRECTORY2="/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/WES_ME/"${pattern}${range}"/Results_"$TYPE;
        java -jar $EBROOTMELT/MELT.jar Single -bamfile $DIRECTORY"/"${pattern}${range}".bam" -h $GENOME -w $DIRECTORY2 -n $BED -t $ME -exome true
    done
done
