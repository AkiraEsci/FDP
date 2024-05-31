import csv
import os

n = 79
final = []

for i in range(58, n+1):
    file_patterns = ['S', 'VH']
    for pattern in file_patterns:
        file_path = f"/homes/users/ahirata/scratch/ahirata/mobster_results/WES_ME/BQSR_{pattern}{i}/Results/Final_BQSR_{pattern}{i}.annotated.tsv"
        print(file_path)
        if os.path.exists(file_path):
            with open(file_path) as annotation:
                for record in annotation:
                    columns = record.strip().split('\t')
                    type = columns[5].strip("<>").split(":")
                    if (columns[5] != 'SV_type') and (columns[11] in ["PASS","lc","hDP"]):
                        final.append([f"S{i}" if pattern == 'S' else f"VH{i}", type[2], columns[16],columns[14],columns[11],columns[0],columns[2],columns[3],f"chr{columns[1]}"])

output_file = 'VH_WES_mobster_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info","Gene_name","Filter","Location","Start","End","Chromosome"])
    writer.writerows(final)

print(f"Results written to {output_file}")
