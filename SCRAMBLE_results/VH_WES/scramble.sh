#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=12G 

module load scramble/1.0.2-GCC-11.2.0

export VANILLA="$EBROOTSCRAMBLE/cluster_analysis/bin/SCRAMble.R";
export DIR="$EBROOTSCRAMBLE/cluster_analysis/bin";
export MEI_REFS="$EBROOTSCRAMBLE/cluster_analysis/resources/MEI_consensus_seqs.fa";
export REFERENCE="/scratch/lab_genresearch/ahirata/ahirata/Reference/hg38.fa";


patterns=("BQSR_S" "BQSR_VH" "BQSR_VH" "BQSR_VH")
ranges=("58 59 60" "60 61 62 63" "71 72 73" "77 78 79")

for ((i=0; i<${#patterns[@]}; i++))
do
    pattern="${patterns[$i]}"
    range="${ranges[$i]}"
    
    for j in $range
    do  
        mkdir /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/WES_ME/${pattern}${j}/Results
        $EBROOTSCRAMBLE/cluster_identifier/src/build/cluster_identifier  /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/WES_ME/${pattern}${j}/${pattern}${j}.bam > /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/WES_ME/${pattern}${j}/Results/${pattern}${j}.txt
        Rscript --vanilla $VANILLA \
            --out-name /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/WES_ME/${pattern}${j}/Results/Final_${pattern}${j}   \
            --cluster-file  /scratch/lab_genresearch/ahirata/ahirata/SCRAMble_results/WES_ME/${pattern}${j}/Results/${pattern}${j}.txt \
            --install-dir $DIR \
            --mei-refs $MEI_REFS \
            --ref $REFERENCE \
            --eval-meis \
            --eval-dels
    done
done

