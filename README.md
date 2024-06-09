# Performance evaluation of bioinformatics tools for Transposable Element detection from NGS data

In this project, three Transposable Element Detection tools are compared using different sequencing datasets, such as, Whole Exome Sequencing (**WES**), Whole Genome Sequencing (**WGS**), RNA sequencing (**RNAseq**) and long-read sequencing. Transposable elements, sometimes referred to as mobile elements, are DNA sequences that have the ability to shift positions within the genome by using a retrotranscription mechanism, perhaps leading to mutations and changing the structure and function of the genome. 

![reverse transcription](./Images/reverse_transcription.jpg)

Finding these components is essential to comprehending how they affect disease, evolution, and genetic variation. Our research makes use of both long-read and short-read sequencing data, using specific algorithms for each data type to offer thorough insights into the efficacy of various TE detection methods in a range of genomic scenarios. The data, analysis scripts, and supplemental resources utilized in our investigation are all contained in this repository.

## MELT/SCRAMble/mobster folders content:

The first we will find on each of these folders are the folders for each dataset that we ran with the corresponding tool. If you go inside each of them you will find the following programs in common:

* `copy_file.sh` program

These are personalized bash scripts designed to copy BAM and BAI files to your current directory from a shared directory. This makes sure you have locally all the files you need for your genetic research project.

To run it:

```
sbatch copy_file.sh
```

* `annotsv.sh` program

These are bash scripts made with the purpose of using AnnotSV to annotate structural variations in VCF files. It loops through several VCF files and loads the required modules. The required modules are already specified, the parameters that can be modified are the annotation directory (**-annotationsDir**), if you have AnnotSV somewhere else, the output directory (**-outputDir**), if you want the output be in another directory, the input file (**-SVinputFile**) and the reference genome (**-genomeBuild**) if you are working with **GRCh38** or **GRCh37**. 


To run it:

```
sbatch annotsv.sh
```

The output looks like this (this is only an example of the header and the first line of the **.annotated.tsv**):

```
> AnnotSV_ID	SV_chrom	SV_start	SV_end	SV_length	SV_type	Samples_ID	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	BQSR_S1	Annotation_mode	Gene_name	Gene_count	Tx	Tx_start	Tx_end	Overlapped_tx_length	Overlapped_CDS_length	Overlapped_CDS_percent	Frameshift	Exon_count	Location	Location2	Dist_nearest_SS	Nearest_SS_type	Intersect_start	Intersect_end	RE_gene	P_gain_phen	P_gain_hpo	P_gain_source	P_gain_coord	P_loss_phen	P_loss_hpo	P_loss_source	P_loss_coord	P_ins_phen	P_ins_hpo	P_ins_source	P_ins_coord	P_snvindel_nb	P_snvindel_phen	B_gain_source	B_gain_coord	B_loss_source	B_loss_coord	B_ins_source	B_ins_coord	B_inv_source	B_inv_coord	TAD_coordinate	ENCODE_experiment	GC_content_left	GC_content_right	Repeat_coord_left	Repeat_type_left	Repeat_coord_right	Repeat_type_right	Gap_left	Gap_right	SegDup_left	SegDup_right	ENCODE_blacklist_left	ENCODE_blacklist_characteristics_left	ENCODE_blacklist_right	ENCODE_blacklist_characteristics_right	ACMG	HI	TS	DDD_HI_percent	ExAC_delZ	ExAC_dupZ	ExAC_cnvZ	ExAC_synZ	ExAC_misZ	OMIM_ID	OMIM_phenotype	OMIM_inheritance	OMIM_morbid	OMIM_morbid_candidate	LOEUF_bin	GnomAD_pLI	ExAC_pLI	AnnotSV_ranking_score	AnnotSV_ranking_criteria	ACMG_class
> 1_149218125_149218126_ALU_1	1	149218125	149218126	278	ALU		.	A	<INS:ME:ALU>	.	ac0;s25	TSD=null;ASSESS=2;INTERNAL=null,null;SVTYPE=ALU;SVLEN=278;MEINFO=AluY,2,280,+;DIFF=0.1:c32t,c37g,c48g,g65a,a74g,c78g,g110a;LP=1;RP=3;RA=-1.585;PRIOR=false;SR=0	GT:GL:DP:AD	./.:-0,-0,-0:1:0	full		0																														1:147929336-149801433;1:148050779-149739249;1:148867551-149768855;1:149034709-149405578;1:149036512-149244464;1:149207860-149218152	0.0187;0.0100;0.0191;0.0800;0.0300;0.0509;TS	1:147929336-149801433;1:148050779-149739249;1:148867551-149768855;1:149034709-149405578;1:149036512-149278459;1:149036524-149256691;1:149145233-149244654;1:149202745-149436842;1:149207851-149218151;1:149207860-149218152	HI;0.1472;0.0900;0.2563;0.0100;0.0900;0.0213;0.0125;0.0900;0.3041;HI							0.420	0.420	1:149217924-149218060	PRIMA4-int	1:149217924-149218060	PRIMA4-int			1:149214788-149229035;1:149214788-149229035;1:149215313-149236883;1:149216600-149226886;1:149216600-149226886;1:149216600-149235129	1:149214788-149229035;1:149214788-149229035;1:149215313-149236883;1:149216600-149226886;1:149216600-149226886;1:149216600-149235129																								NA
```


* `elements.py` program

TSV files produced by the tool and the AnnotSV run are processed by this python script. It gathers pertinent data from many sources and merges it into a single CSV file. You can change the input file and the columns depending on your needs.

```
python3 elements.py
```

The output file looks like this:

```
> Sample,Type,Info,Gene_name,Location,Filter,Start,End,Chromosome,Coverage,Genotype
>1,ALU,"0/1:-58,-14.45,-221.4:24:5",ACE,17_61565904_61565905_ALU_1,PASS,61565904,61565905,chr17,24,0/1
```

* `file_exist.sh` program

These programs are meant to check the existance of the specified files, just a way to validate if they are created correctly.

To run it:

```
sbatch file_exist.sh
```

* `indexing.sh` program

These files are intended to solve a major problem that came up during the MELT analysis procedure. For correct variant calling and efficient access, BAM files must be indexed by MELT. We index the BAM files using SAMtools in order to improve the efficiency and dependability of subsequent analyses.

To run it:

```
sbatch indexing.sh
```

And the ones that are not common between them:

### Only in MELT:

* `melt.sh` program

The script is a bash program that uses the MELT software to automatically find TEs in genomic sequencing data. Some parameters that must be specified or modified are: the type of mobile element to identify (**the options are in the script**), the path to the reference genome and the reference mobile elements, the directory holding the MELT software, and the location to the BED file defining genomic regions of interest. The script also loads necessary packages and their specific version.

To run it:

```
sbatch melt.sh
```

For each element we obtained a VCF file with the following information:

```
> CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	BQSR_S1
> chr1	149218125	.	A	<INS:ME:ALU>	.	ac0;s25	TSD=null;ASSESS=2;INTERNAL=null,null;SVTYPE=ALU;SVLEN=278;MEINFO=AluY,2,280,+;DIFF=0.1:c32t,c37g,c48g,g65a,a74g,c78g,g110a;LP=1;RP=3;RA=-1.585;PRIOR=false;SR=0	GT:GL:DP:AD	./.:-0,-0,-0:1:0
```

Some errors that we found while trying to run the MELT tool and how to solve them:

![MELT troubleshooting](./Images/melt_error.png)

* `join_vcf.sh` program

These are bash scripts that navigates to the directory for each identifier, which contains the MELT's result files. The final VCF files produced by MELT are copied into distinct files within each directory. Then it concatenates the  VCF files into a single file to afterwards perform the annotation.

To run it:

```
sbatch join_vcf.sh
```

### Only in SCRAMble:

* `scramble.sh` program

These scripts are designed to use the SCRAMble tool to analyze deletions and TEs in genomic sequencing data across a range of samples. Important  variables are defined upon loading the SCRAMble module, which include the directory containing the SCRAMble binaries, the file containing the consensus sequences of mobile element insertions, the reference genome file, and the location of the SCRAMble.R script. 
The cluster_identifier binary is run in order to create cluster files from input BAM files, a directory structure is created to hold the results, and a R script (SCRAMble.R) is called in order to assess MEIs and deletions based on the generated cluster files and reference resources. 

To run it:

```
sbatch scramble.sh
```

We obtained a VCF file with the following information:

```
> CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO
> chr16	81990619	INS:ME	A	<INS:ME:ALU>	52.9846420288086	PASS	MEINFO=chr16:81990619_ALU_Plus,81990619,81990620,+
```

Some errors that we found while trying to run the SCRAMble tool and how to solve them:

![SCRAMble troubleshooting](./Images/scramble_error.png)

Now, as we mentioned in the paper, we had some troubles annotating the results of SCRAMble so now we will explain what we used in order to overcome this problem we followed the showed pipeline:

![annotation scramble](./Images/annotation_scramble.png)

* `vcftotsv.sh` program

These bash scripts are made to convert VCF files to TSV files using the vcf2tsvpy utility. Based on the sample identifier, it specifies the directories for the intended output TSV file and the input VCF file for each iteration. 

* `file_format.py` program

The function defined by this Python script takes each input TSV file that comes from the SCRAMble results and modifies it before writing the updated version to an output TSV file that has extra annotation fields. The function parses the tab-separated columns on each line of the input file as iterates through it. This enables us to obtain the relevant data and then utilize our exons distance program without relying on AnnotSV results.

This program is our first try to overcome the problem, that's why is not included in the pipeline:

* `partition.py` program

Using the line number from the source VCF file as an identifier, this Python software divides an input VCF file into separate VCF files. Each of these files has one structural variant entry. The header lines from the input file are kept, and each output file has the matching SV item appended to it. This was an attempt to try and lower the amount of information per file so that the annotation could be performed appropriately. We also tried to do it with by chromosome number, by strand, and by mobile element type. Nevertheless, the files were still too large to use AnnotSV, hence this strategy was unsuccessful.

### Only in mobster:

* `mobster.sh` program

* `convert_vcf.sh` program

## long_reads folder content:

The programs used in this folder are already mentioned previously, but one program is meant only the long read detection.

* `rMETL.sh` program

## RNA_seq content:


## exons content:

* `format.py` program

* `distance.py` program

![exons_distance pipeline](./Images/pipeline_exons.png)

* `distance_no_annotsv.py` program

Works the same way as the one with the annotations of AnnotSV but this time it does not need them, these for the SCRAMble results. Also can be took as a reference of how to incluide or not include information in the distance program.

## genes content:

It contains the genes.py program, which tell if the list of genes (AID,CVID and IEI).

* `genes.py` program

## de_novo content:

* `de_novo.py` program

* `VH_format.py` program

## Data_visualization content:

* `Final_results.Rmd` program

Contains all the commands used in R to obtain all the graphical visualizations observed in our project.
