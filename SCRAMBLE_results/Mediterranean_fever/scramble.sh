#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=12G 

module load scramble/1.0.2-GCC-11.2.0

export VANILLA="$EBROOTSCRAMBLE/cluster_analysis/bin/SCRAMble.R";
export DIR="$EBROOTSCRAMBLE/cluster_analysis/bin";
export MEI_REFS="$EBROOTSCRAMBLE/cluster_analysis/resources/MEI_consensus_seqs.fa";
export REFERENCE="/scratch/lab_genresearch/ahirata/ahirata/Reference/hs37d5.fa";
 
for ((i=54;i<=78;i++))
do  
    if [ $i -ge 64 ] && [ $i -le 68 ]; then
        continue 
    fi
    mkdir /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/fmf_bams/AY48$i/Results
    $EBROOTSCRAMBLE/cluster_identifier/src/build/cluster_identifier  /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/fmf_bams/AY48$i/AY48$i.bam > /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/fmf_bams/AY48$i/Results/AY48$i.txt
    Rscript --vanilla $VANILLA \
        --out-name /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/fmf_bams/AY48$i/Results/Final_AY48$i   \
        --cluster-file  /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/fmf_bams/AY48$i/Results/AY48$i.txt \
        --install-dir $DIR \
        --mei-refs $MEI_REFS \
        --ref $REFERENCE \
        --eval-meis \
        --eval-dels
done
