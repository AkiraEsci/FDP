#!/usr/bin/bash
#SBATCH --partition=haswell
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=12G 

module load scramble/1.0.2-GCC-11.2.0

export VANILLA="$EBROOTSCRAMBLE/cluster_analysis/bin/SCRAMble.R";
export DIR="$EBROOTSCRAMBLE/cluster_analysis/bin";
export MEI_REFS="$EBROOTSCRAMBLE/cluster_analysis/resources/MEI_consensus_seqs.fa";
export REFERENCE="/gpfs42/projects/lab_genresearch/shared_data/ahirata/Reference/GRCh38_full_analysis_set_plus_decoy_hla.fa";


$EBROOTSCRAMBLE/cluster_identifier/src/build/cluster_identifier /gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/81260.haplotagged.bam > /gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/SCRAMBLE_res/results.txt
Rscript --vanilla $VANILLA \
            --out-name /gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/SCRAMBLE_res/final_res  \
            --cluster-file  /gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/SCRAMBLE_res/results.txt \
            --install-dir $DIR \
            --mei-refs $MEI_REFS \
            --ref $REFERENCE \
            --eval-meis \
            --eval-dels
