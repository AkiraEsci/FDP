import csv


n = 78
final = []

for i in range(54, n+1):
    #file = f'/homes/users/ahirata/scratch/ahirata/BQSR/BQSR_S{i}/MEfinal_S{i}.annotated.tsv'
    if (i not in [64,65,66,67,68]):
        file = f"/homes/users/ahirata/scratch/ahirata/mobster_results/fmf_bams/AY48{i}/Results/Final_AY48{i}.annotated.tsv"
        print(file)
        with open(file) as annotation:
            for record in annotation:
                columns = record.strip().split('\t')
                type = columns[5].strip("<>").split(":")
                if (columns[5] != 'SV_type') and (columns[11] in ["PASS","lc","hDP"]):
                    final.append([f'AY48{i}',type[2],columns[11],columns[2],columns[3],columns[14],f"chr{columns[1]}"])
with open('fever_mobster_final.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type","Filter","Start","End","Gene_name","Chromosome"])
    writer.writerows(final)
