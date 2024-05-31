import csv
import os

n = 79
final = []

for i in range(58, n+1):
    file_patterns = ['S', 'VH']
    for pattern in file_patterns:
        file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/WES_ME/BQSR_{pattern}{i}/MEfinal_BQSR_{pattern}{i}.annotated.tsv"
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
                            final.append([f"S{i}" if pattern == 'S' else f"VH{i}", columns[5], columns[14],columns[16],columns[11],columns[0],columns[2],columns[3],f"chr{columns[1]}",coverage,genotype])

output_file = 'VHWES_melt_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info","Gene_name","Filter","Location","Start","End","Chromosome","Coverage","Genotype"])
    writer.writerows(final)

print(f"Results written to {output_file}")
