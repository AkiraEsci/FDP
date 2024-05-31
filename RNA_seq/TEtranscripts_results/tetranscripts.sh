#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=32G 

module load TEtranscripts/2.2.3-Singularity-4.1.0-GCCcore-11.2.0

patterns=("i" "s" "i" "i" "i")
numbers=("17" "11" "11" "16" "01")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    export TREAT="/gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAseq/"$dir_name"/"$dir_name"_sorted.bam";
    export GENIC="/gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAseq/hg19.refGene.gtf";
    export TRANSP="/gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAseq/hg19_rmsk_TE.gtf";
    
    mkdir /gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAseq/$dir_name/Results_sing
    singularity exec $SINGULARITY_IMAGES/tetranscripts.sif TEtranscripts -t $TREAT -c $TREAT --GTF $GENIC --TE $TRANSP --outdir /gpfs42/projects/lab_genresearch/shared_data/ahirata/RNAseq/$dir_name/Results_sing --sortByPos
done