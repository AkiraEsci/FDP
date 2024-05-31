def split_vcf_by_line(input_file, output_prefix):
    with open(input_file, 'r') as f:
        header_lines = []
        sv_lines_dict = {}
        for line in f:
            if line.startswith('#'):
                header_lines.append(line)
            else:
                break
        line_count = 0
        for line in f:
            if not line.startswith('#'):
                line_count += 1
                output_file = f"{output_prefix}_line{line_count}.vcf"
                with open(output_file, 'w') as out_file:
                    out_file.writelines(header_lines)
                    out_file.write(line)

for i in [24, 33, 34]:
    input_file = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/BQSR/BQSR_S{i}/Results/Final_S{i}.vcf"
    output_prefix = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/BQSR/BQSR_S{i}/Results/output"
    split_vcf_by_line(input_file, output_prefix)
    print(f'Done for file BQSR{i}')