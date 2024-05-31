#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=12G 
module load scramble/1.0.2-GCC-11.2.0

export VANILLA="$EBROOTSCRAMBLE/cluster_analysis/bin/SCRAMble.R";
export DIR="$EBROOTSCRAMBLE/cluster_analysis/bin";
export MEI_REFS="$EBROOTSCRAMBLE/cluster_analysis/resources/MEI_consensus_seqs.fa";
export REFERENCE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/Reference/hg19.fa";


patterns=("i" "f" "m" "s" "i" "f" "i" "m" "f" "i" "m" "f")
numbers=("17" "17" "17" "11" "11" "11" "16" "16" "16" "01" "01" "01")
for ((i=0; i<${#patterns[@]}; i++))
do
    pattern=${patterns[$i]}
    number=${numbers[$i]}
    dir_name="VH"${number}${pattern}
    
    mkdir /gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/$dir_name/Results
    $EBROOTSCRAMBLE/cluster_identifier/src/build/cluster_identifier "/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/"$dir_name"/"$dir_name"_sorted.bam" > /gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/$dir_name/Results/$dir_name.txt
    Rscript --vanilla $VANILLA \
        --out-name /gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/$dir_name/Results/Final_$dir_name  \
        --cluster-file /gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/$dir_name/Results/$dir_name.txt \
        --install-dir $DIR \
        --mei-refs $MEI_REFS \
        --ref $REFERENCE \
        --eval-meis \
        --eval-dels
done