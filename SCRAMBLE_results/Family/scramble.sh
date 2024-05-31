#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=12G 

module load scramble/1.0.2-GCC-11.2.0

export VANILLA="$EBROOTSCRAMBLE/cluster_analysis/bin/SCRAMble.R";
export DIR="$EBROOTSCRAMBLE/cluster_analysis/bin";
export MEI_REFS="$EBROOTSCRAMBLE/cluster_analysis/resources/MEI_consensus_seqs.fa";
export REFERENCE="/scratch/lab_genresearch/ahirata/ahirata/Reference/hs37d5.fa";

for ((i=40;i<=55;i++))
do
    if [ $i -eq 41 ] || [ $i -eq 54 ] || [ $i -eq 55 ]; then
        mkdir /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/Family/AY49$i/Results
        $EBROOTSCRAMBLE/cluster_identifier/src/build/cluster_identifier  /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/Family/AY49$i/AY49$i.bam > /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/Family/AY49$i/Results/AY49$i.txt
        Rscript --vanilla $VANILLA \
            --out-name /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/Family/AY49$i/Results/Final_AY49$i   \
            --cluster-file  /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/Family/AY49$i/Results/AY49$i.txt \
            --install-dir $DIR \
            --mei-refs $MEI_REFS \
            --ref $REFERENCE \
            --eval-meis \
            --eval-dels
    fi
done
