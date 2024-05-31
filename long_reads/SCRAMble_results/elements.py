import csv
import os

final = []


file_path = f'/gpfs42/projects/lab_genresearch/shared_data/ahirata/longReads_WGS_VH27i/SCRAMBLE_res/final_res.toannot.tsv'
        #file_path = f"/homes/users/ahirata/scratch/ahirata/SCRAMble_results/BQSR/BQSR_{pattern}{i}/Results/Final_{pattern}{i}.toannot.tsv"
        #file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/BQSR/BQSR_{pattern}{i}/MEfinal_{pattern}{i}.annotated.tsv"
print(file_path)
with open(file_path) as annotation:
    for record in annotation:
        columns = record.strip().split('\t')
        type = columns[4].strip("<>").split(":")
        if (columns[2] != 'ID') and (columns[6] in ["PASS","lc","hDP"]) and (columns[2] != "DEL"):
            final.append([1, type[2], columns[8],columns[11],columns[12],columns[0]])

output_file = 'Longreads_scramble_final.csv'
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info","Start", "End","Chromosome"])
    writer.writerows(final)

print(f"Results written in {output_file}")