# Detection of Transposable Element Insertions from NGS data

Repository containing all the codes I used during the Curricular Internship + FDP

## MELT/SCRAMble/mobster folders contents:

The first we will find on each of these folders are the folders for each dataset that we ran with the corresponding tool. If you go inside each of them you will find the following programs in common:

* `copy_file.sh` program

These files are the personalized bash scripts to copy the bam/bai files into the directory where you are. 

* `annotsv.sh` program

* `elements.py` program

* `file_exist.sh` program

* `indexing.sh` program

And the ones that are not common between them, as some differences while running them occured.

### Only in MELT:

* `melt.sh` program

* `join_vcf.sh` program

### Only in SCRAMble:

* `scramble.sh` program

* `file_format.py` program

* `vcftotsv.sh` program

* `partition.py` program

### Only in mobster:

* `scramble.sh` program

* `file_format.py` program

* `vcftotsv.sh` program

* `partition.py` program

## long_reads folder content:

The programs used in this folder are already mentioned previously. But one program is meant only the long read detection.
* `rMETL.sh` program

## RNA_seq content:


## exons contents:

* `format.py` program

* `distance.py` program

* `distance_no_annotsv.py` program

## genes contents:

It contains the genes.py program, which tell if the list of genes (AID,CVID and IEI)

## de_novo content:

* `de_novo.py` program

* `VH_format.py` program

## Data_visualization content:

* `Final_results.Rmd` program
