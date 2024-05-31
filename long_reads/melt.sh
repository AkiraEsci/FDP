#!/usr/bin/bash

module load MELT/v2.2.2-GCC-8.3.0
module load Java/17.0.4
module load SAMtools/1.18-GCC-12.3.0
module load Bowtie2/2.3.4.2-foss-2018b

export TYPE="ALU"; # ALU LINE1 SVA
export GENOME="/gpfs42/projects/lab_genresearch/shared_data/ahirata/Reference/GRCh38_full_analysis_set_plus_decoy_hla.fa";
#export GENOME="/gpfs42/projects/lab_genresearch/shared_data/ahirata/Reference/hs37d5.fa";
#export BED=$EBROOTMELT"/add_bed_files/1KGP_Hg19/hg19.genes.bed";
export BED=$EBROOTMELT"add_bed_files/Hg38/Hg38.genes.bed";
#export ME=$EBROOTMELT"/me_refs/1KGP_Hg19/"$TYPE"_MELT.zip";
export ME=$EBROOTMELT"me_refs/Hg38/"$TYPE"_MELT.zip";

export DIRECTORY="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/";
export DIRECTORY2="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/MELT_res/Results_"$TYPE;

java -jar $EBROOTMELT/MELT.jar Single -bamfile $DIRECTORY"81260.haplotagged.bam" -h $GENOME -w $DIRECTORY2 -n $BED -t $ME -mcmq 75
