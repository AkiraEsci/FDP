#!/usr/bin/bash
module purge
module load modulepath
module load AnnotSV/3.0.7-foss-2016b
module load bcftools/1.3.1
module load bedtools/2.24.0
module load zlib/1.2.13

export ANNOTDIR="/scratch/lab_genresearch/ahirata/ahirata/AnnotSV/bin/AnnotSV_annotations";
export DIR="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/rMETL_res";
export INPUT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/rMETL_res/result.vcfcalling.vcf";
AnnotSV -SVinputFile $INPUT -genomeBuild GRCh38 -annotationsDir $ANNOTDIR -outputDir $DIR
