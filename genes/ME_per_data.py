gene_individual_map = {}
for i in ["melt", "scramble", "mobster"]:
    file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/Longreads_rMETL_final.csv"
    with open(file_path, 'r') as tsv_file:
        next(tsv_file)
        for line in tsv_file:
            columns = line.strip().split(",")
            type = columns[1]
            individual_name = str(columns[0])
            if i == "scramble":
                start = columns[3]
                end = columns[4]
            start = columns[6]
            end = columns[7]
            if type == "LINE1":
                type = "L1"
            if individual_name not in gene_individual_map:
                gene_individual_map[individual_name] = []
            gene_individual_map[individual_name].append((i, type, start, end))

with open('ME_in_VHWES.csv', 'w') as csv_file:
    csv_file.write("Individual,Tool,Type,Start,End\n")
    for individual, gene_info_list in gene_individual_map.items():
        for gene_info in gene_info_list:
            tool, type, start, end = gene_info
            csv_file.write(f"{individual},{tool},{type},{start},{end}\n")