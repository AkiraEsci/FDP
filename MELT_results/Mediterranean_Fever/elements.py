import csv


n = 78
final = []

for i in range(54, n+1):
    #file = f'/homes/users/ahirata/scratch/ahirata/BQSR/BQSR_S{i}/MEfinal_S{i}.annotated.tsv'
    if (i not in [64,65,66,67,68]):
        file = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/fmf_bams/AY48{i}/MEfinal_{i}.annotated.tsv"
        print(file)
        with open(file) as annotation:
            for record in annotation:
                columns = record.strip().split('\t')
                if (columns[5] != 'SV_type') and (columns[11] in ["PASS","lc","hDP"]):
                    info_items = columns[14].split(':')
                    genotype = info_items[0]
                    coverage = info_items[2]
                    if (int(coverage) >= 20):
                        final.append([f'AY48{i}',columns[5],columns[11],columns[2],columns[3],columns[16],f"chr{columns[1]}",coverage,genotype])
with open('fever_melt_final.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type","Filter","Start","End","Gene_Name","Chromosome","Coverage","Genotype"])
    writer.writerows(final)