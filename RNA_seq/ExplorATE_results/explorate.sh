#!/usr/bin/bash
#SBATCH --partition=haswell

module load ExplorATE/v1.0-GCC-11.2.0
module load Salmon/1.3.0-foss-2016b
module load OpenBLAS/0.3.18-GCC-11.2.0
module load BEDTools/2.29.2-GCC-9.3.0

patterns=("i" "s" "i" "i" "i")
numbers=("17" "11" "11" "16" "01")
export REFERENCE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/Reference/hg19.fa";
export REPEAT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAseq/hg19.fa.out";
export GENIC="/gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAseq/hg19.refGene.gtf";
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    export FILE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAs_VH_Nerea/RawFASTQ/"$dir_name;
    
    mkdir /gpfs42/projects/lab_genresearch/shared_data/ahirata/ExplorATE_results/$dir_name
    export OUT_DIR="/gpfs42/projects/lab_genresearch/shared_data/ahirata/ExplorATE_results/"$dir_name;
    bash /gpfs42/projects/lab_genresearch/shared_data/ahirata/ExplorATE/ExplorATE mo -l $FILE -g $GENIC -r $REPEAT -e pe -f $REFERENCE -o $OUT_DIR
done