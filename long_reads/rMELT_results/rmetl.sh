#!/usr/bin/bash

module load rMETL/V1.0.4-Miniconda3-4.9.2

source activate rmetl

export REFERENCE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/Reference/GRCh38_full_analysis_set_plus_decoy_hla.fa";
export OUT_DIR="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/rMETL_res";
export INFILE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/81260.haplotagged.bam";
export TEMP_DIR="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/";

rMETL detection $INFILE $REFERENCE $TEMP_DIR $OUT_DIR

export FASTA="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/rMETL_res/potential_ME.fa";
export MEREF="/gpfs42/projects/lab_genresearch/shared_data/ahirata/Reference/super_TE.fa";

rMETL realignment $FASTA $MEREF $OUT_DIR

export SAM="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/rMETL_res/finalcluster.sam";

rMETL calling $SAM $REFERENCE VCF $OUT_DIR
