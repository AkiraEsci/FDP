import csv
import os
final = []

for i in range(54,79):
    if (i not in [64,65,66,67,68]):
        file_path = f'/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/fmf_bams/AY48{i}/Results/Final_AY48{i}.toannot.tsv'
            #file_path = f"/homes/users/ahirata/scratch/ahirata/SCRAMble_results/BQSR/BQSR_{pattern}{i}/Results/Final_{pattern}{i}.toannot.tsv"
            #file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/BQSR/BQSR_{pattern}{i}/MEfinal_{pattern}{i}.annotated.tsv"
        print(file_path)
        if os.path.exists(file_path):
            with open(file_path) as annotation:
                for record in annotation:
                    columns = record.strip().split('\t')
                    type = columns[4].strip("<>").split(":")
                    if (columns[2] != 'ID') and (columns[6] in ["PASS","lc","hDP"]) and (columns[2] != "DEL"):
                        final.append([f"AY48{i}", type[2], columns[8],columns[11],columns[12],f"chr{columns[0]}"])

output_file = 'fever_scramble_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info","Start", "End","Chromosome"])
    writer.writerows(final)

print(f"Results written in {output_file}")
