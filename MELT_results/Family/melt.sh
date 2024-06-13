#!/usr/bin/bash

export TYPE="LINE1"; # ALU LINE1 SVA
#The paths that are not related to the MELT module must be the ones what are shown when you use the "pwd -P" command on terminal
export GENOME="/homes/users/ahirata/scratch/ahirata/Reference/hs37d5.fa";
export MELT="/homes/users/ahirata/scratch/ahirata/MELTv2.2.2";
export BED=$EBROOTMELT"add_bed_files/1KGP_Hg19/hg19.genes.bed";
#export BED=$EBROOTMELT"add_bed_files/Hg38/Hg38.genes.bed";
export ME=$EBROOTMELT"me_refs/1KGP_Hg19/"$TYPE"_MELT.zip";
#export ME=$EBROOTMELT"me_refs/Hg38/"$TYPE"_MELT.zip";

module load MELT/v2.2.2-GCC-8.3.0 
module load Java/17.0.4
module load SAMtools/1.18-GCC-12.3.0
module load Bowtie2/2.3.4.2-foss-2018b

for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        export DIRECTORY="/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/Family/AY49"$i;
        export DIRECTORY2="/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/Family/AY49"$i"/Results_"$TYPE;
        java -jar $EBROOTMELT/MELT.jar Single -bamfile $DIRECTORY"/AY49"$i".bam" -h $GENOME -w $DIRECTORY2 -n $BED -t $ME -exome true
    fi
done

    

