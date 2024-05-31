#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=12G 
module load scramble/1.0.2-GCC-11.2.0

export VANILLA="$EBROOTSCRAMBLE/cluster_analysis/bin/SCRAMble.R";
export DIR="$EBROOTSCRAMBLE/cluster_analysis/bin";
export MEI_REFS="$EBROOTSCRAMBLE/cluster_analysis/resources/MEI_consensus_seqs.fa";
export REFERENCE="/scratch/lab_genresearch/ahirata/ahirata/Reference/hg19.fa";

for ((i=1;i<=45;i++))
do
    mkdir /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/BQSR/BQSR_S$i/Results
    $EBROOTSCRAMBLE/cluster_identifier/src/build/cluster_identifier /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/BQSR/BQSR_S$i/BQSR_S$i.bam > /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/BQSR/BQSR_S$i/Results/BQSR_S$i.txt
    Rscript --vanilla $VANILLA \
        --out-name /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/BQSR/BQSR_S$i/Results/Final_S$i   \
        --cluster-file /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/BQSR/BQSR_S$i/Results/BQSR_S$i.txt \
        --install-dir $DIR \
        --mei-refs $MEI_REFS \
        --ref $REFERENCE \
        --eval-meis \
        --eval-dels
done


