import csv
import os

n = 17
final = []

for i in range(1, n+1):
    file_patterns = ['s', 'f', 'm', 'i']  
    for pattern in file_patterns:
        number = f"0{i}" if i < 10 else str(i)
        file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/VH/VH{number}{pattern}/MEfinal_VH{number}{pattern}.annotated.tsv"
        print(file_path)
        if os.path.exists(file_path):
            with open(file_path) as annotation:
                for record in annotation:
                    columns = record.strip().split('\t')
                    if (columns[5] != 'SV_type') and (columns[11] in ["PASS","lc","hDP"]):
                        info_items = columns[14].split(':')
                        genotype = info_items[0]
                        coverage = info_items[2]
                        if (int(coverage) >= 20):
                            final.append([f"VH{number}{pattern}", columns[5], columns[14], genotype, columns[16], columns[0], columns[11],columns[2],columns[3],f"chr{columns[1]}",coverage])

output_file = 'VH_melt_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info", "Genotype", "Gene_name", "Location", "Filter","Start","End","Chromosome","Coverage"])
    writer.writerows(final)

print(f"Results written to {output_file}")
