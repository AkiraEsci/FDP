import csv
import os
final = []

for i in range(1, 18):
    file_patterns = ['s', 'f', 'm', 'i']  
    for pattern in file_patterns:
        number = f"0{i}" if i < 10 else str(i)
        file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/VH{number}{pattern}/Results/Final_VH{number}{pattern}.toannot.tsv"
        print(file_path)
        if os.path.exists(file_path):
            with open(file_path) as annotation:
                for record in annotation:
                    columns = record.strip().split('\t')
                    type = columns[4].strip("<>").split(":")
                    if (columns[2] != 'ID') and (columns[6] in ["PASS","lc","hDP"]) and (columns[2] != "DEL"):
                        final.append([f"VH{number}{pattern}", type[2], columns[8],columns[11],columns[12],columns[0]])

output_file = 'VH_scramble_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info","Start", "End","Chromosome"])
    writer.writerows(final)

print(f"Results written in {output_file}")

