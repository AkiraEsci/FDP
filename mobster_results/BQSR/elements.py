import csv
import os

n = 45
final = []

for i in range(1, n+1):
    file_patterns = ['S', 'VH']
    for pattern in file_patterns:
        file_path = f"/homes/users/ahirata/scratch/ahirata/mobster_results/BQSR/BQSR_{pattern}{i}/Results/Final_{pattern}{i}.annotated.tsv"
        #file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/BQSR/BQSR_{pattern}{i}/MEfinal_{pattern}{i}.annotated.tsv"
        print(file_path)
        if os.path.exists(file_path):
            with open(file_path) as annotation:
                for record in annotation:
                    columns = record.strip().split('\t')
                    type = columns[5].strip("<>").split(":")
                    if (columns[5] != 'SV_type') and (columns[11] in ["PASS","lc","hDP"]):
                        final.append([f"{i}" if pattern == 'S' else f"VH{i}", type[2], columns[16],columns[14],columns[0],columns[11],columns[2],columns[3],f"chr{columns[1]}"])

output_file = 'BQSR_mobster_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info","Gene_name","Location","Filter", "Start", "End","Chromosome"])
    writer.writerows(final)

print(f"Results written in {output_file}")