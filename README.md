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

![MELT troubleshooting](./Images/melt_error.png)

* `join_vcf.sh` program

### Only in SCRAMble:

* `scramble.sh` program

![SCRAMble troubleshooting](./Images/scramble_error.png)

* `file_format.py` program

* `vcftotsv.sh` program

* `partition.py` program

### Only in mobster:

* `mobster.sh` program

* `convert_vcf.sh` program

## long_reads folder content:

The programs used in this folder are already mentioned previously. But one program is meant only the long read detection.

* `rMETL.sh` program

## RNA_seq content:


## exons content:

* `format.py` program

* `distance.py` program

![exons_distance pipeline](./Images/pipeline_exons.png)

* `distance_no_annotsv.py` program

## genes content:

It contains the genes.py program, which tell if the list of genes (AID,CVID and IEI)

## de_novo content:

* `de_novo.py` program

* `VH_format.py` program

## Data_visualization content:

* `Final_results.Rmd` program
