def split_vcf_by_chromosome(input_file, output_prefix):
    with open(input_file, 'r') as f:
        header_lines = []
        sv_lines_dict = {}

        for line in f:
            if line.startswith('#'):
                header_lines.append(line)
            else:
                break

        for line in f:
            if not line.startswith('#'):
                chromosome = line.split('\t')[0]
                if chromosome not in sv_lines_dict:
                    sv_lines_dict[chromosome] = []
                sv_lines_dict[chromosome].append(line)

    for chromosome, sv_lines in sv_lines_dict.items():
        with open(output_prefix + "_" + chromosome + ".vcf", 'w') as f:
            f.writelines(header_lines)
            f.writelines(sv_lines)

for i in [41,54,55]:
    input_file = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/Family/AY49{i}/Results/Final_AY49{i}.vcf"
    output_prefix = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/Family/AY49{i}/Results/output"
    split_vcf_by_chromosome(input_file, output_prefix)
    print(f'Done for file AY49{i}')