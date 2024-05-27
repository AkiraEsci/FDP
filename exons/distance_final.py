import csv

#exons_file = "/gpfs42/projects/lab_genresearch/shared_data/ahirata/exons/allhg19_formated.txt" #hg19/hg37 genome
exons_file = "/gpfs42/projects/lab_genresearch/shared_data/ahirata/exons/all_formated.txt" #hg38 genome
MEs_file = "/gpfs42/projects/lab_genresearch/shared_data/ahirata/Longreads_rMETL_final.csv" #Formated file after running elements.py
output_file = "exp_obs_gene_longread_rMETL.csv" #Name of the output file you want

exons = {}
with open(exons_file) as exon_list:
    header = next(exon_list)
    for line in exon_list:
        columns = line.strip().split("\t")
        gene_id = columns[10]
        chromosome = columns[1]
        exon_start = int(columns[8])
        exon_end = int(columns[9])
        exon_number = columns[11]
        if chromosome not in exons:
            exons[chromosome] = []
        exons[chromosome].append((gene_id, exon_start, exon_end, exon_number))

def distance(start, end, point):
    if point < start:
        return start - point
    elif point > end:
        return point - end
    else:
        return 0

def near_exon(genes, ME_start, ME_end):
    nearest_distance = float('inf')
    nearest_exon = None
    for gene_id, exon_start, exon_end, exon_number in genes:
        if exon_start <= ME_start <= ME_end <= exon_end:
            return (gene_id, exon_start, exon_end, exon_number), "Inside", 0
        distance_start = distance(exon_start, exon_end, ME_start)
        distance_end = distance(exon_start, exon_end, ME_end)
        total_distance = min(abs(distance_start), abs(distance_end))
        if total_distance < nearest_distance:
            nearest_distance = total_distance
            nearest_exon = (gene_id, exon_start, exon_end, exon_number)
    return nearest_exon, "Inside" if nearest_distance == 0 else ("Close" if nearest_distance < 100 else "Near" if 100 <= nearest_distance < 1000 else "Far" if 1000 <= nearest_distance < 10000 else "Very Far"), nearest_distance

with open(output_file, 'w', newline='') as output_csv:
    writer = csv.writer(output_csv)
    writer.writerow(["Sample", "Chromosome", "ME_Start", "ME_End", "Distance_to_Exon", "Distance_Tag", "Gene", "Gene_AnnotSV", "Exon_Number","Coverage","Genotype"])

    with open(MEs_file) as ME_csv:
        reader = csv.reader(ME_csv)
        next(reader)
        for row in reader:
            sample = row[0]
            gene = row[3]
            ME_start = int(row[6])
            ME_end = int(row[7])
            chromosome = row[8]
            #coverage = row[9]
            genotype = row[9]

            if chromosome in exons:
                nearest_exon, distance_tag, nearest_distance = near_exon(exons[chromosome], ME_start, ME_end)
                if nearest_exon:
                    gene_id, exon_start, exon_end, exon_number = nearest_exon
                    writer.writerow([sample, chromosome, ME_start, ME_end, nearest_distance, distance_tag, gene_id, gene, exon_number, genotype])


