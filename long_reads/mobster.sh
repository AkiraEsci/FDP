#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=64G 

module load mobster/0.2.4.1-GCCcore-11.3.0

export BAM="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/81260.haplotagged.bam";
export SAMPLE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/Final";
export RESUL="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/mobster_res/81260.haplotagged.result";
java -Xmx8G -jar $EBROOTMOBSTER/MobileInsertions-0.2.4.1.jar \
            -properties /gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/Mobster.properties.hg38 \
            -in $BAM\
            -sn $SAMPLE \
            -out $RESUL

