import csv
import os

n = 17
final = []

for i in range(1, n+1):
    file_patterns = ['s', 'f', 'm', 'i']  
    for pattern in file_patterns:
        number = f"0{i}" if i < 10 else str(i)
        file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/mobster_results/VH/VH{number}{pattern}/Results/Final_VH{number}{pattern}.annotated.tsv"
        print(file_path)
        if os.path.exists(file_path):
            with open(file_path) as annotation:
                for record in annotation:
                    columns = record.strip().split('\t')
                    if (columns[5] != 'SV_type') and (columns[11] in ["PASS","lc","hDP"]):
                        type = columns[5].strip("<>").split(":")
                        info_items = columns[14].split(':')
                        #genotype = info_items[0]
                        final.append([f"VH{number}{pattern}", type[2], columns[16], columns[14], columns[0], columns[11],columns[2],columns[3],f"chr{columns[1]}"])

output_file = 'VH_mobster_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info", "Gene_name", "Location", "Filter","Start","End","Chromosome"])
    writer.writerows(final)

print(f"Results written to {output_file}")

