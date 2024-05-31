import csv
import os

final = []

file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/rMETL_res/result.vcfcalling.annotated.tsv"
print(file_path)
if os.path.exists(file_path):
    with open(file_path) as annotation:
        for record in annotation:
            columns = record.strip().split('\t')
            if (columns[5] == 'INS') and (columns[11] in ["PASS","lc","hDP"]):
                type = columns[9].strip("<>").split(":")
                info_items = columns[14].split(':')
                genotype = info_items[0]
                final.append([1, type[2], columns[12], columns[16], columns[0], columns[11],columns[2],columns[3],f"chr{columns[1]}",genotype])

output_file = 'Longreads_rMETL_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info", "Gene_name", "Location", "Filter","Start","End","Chromosome","Genotype"])
    writer.writerows(final)

print(f"Results written to {output_file}")