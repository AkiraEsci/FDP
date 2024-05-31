import os
def process_file(input_file, output_file):
    with open(input_file, "r") as infile, open(output_file, "w") as outfile:
        next(infile)
        next(infile)
        outfile.write("CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tEND\tMEINFO\tSVLEN\tSVTYPE\tSTART\tEND\n")
    
        for line in infile:
            columns = line.strip().split("\t")
            chrom = columns[0]
            pos = int(columns[1])
            id_ = columns[2]
            ref = columns[3]
            alt = columns[4]
            qual = columns[5]
            filt = columns[6]
            end = columns[7]
            meinfo = columns[8]
            svlen = columns[9]
            svtype = columns[10]
            if id_ == 'INS:ME':
                start = pos
                end = pos + 1
            else:
                start = pos
                end = int(end)
            outfile.write(f"{chrom}\t{pos}\t{id_}\t{ref}\t{alt}\t{qual}\t{filt}\t{end}\t{meinfo}\t{svlen}\t{svtype}\t{start}\t{end}\n")

for i in range(58,80):
    file_is = ['S', 'VH']
    for pattern in file_is:
        input_file = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/WES_ME/BQSR_{pattern}{i}/Results/Final_BQSR_{pattern}{i}.tsv"
        if os.path.exists(input_file):
            output_file = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/WES_ME/BQSR_{pattern}{i}/Results/Final_BQSR_{pattern}{i}.toannot.tsv"
            process_file(input_file, output_file)
            print(f"Done for BQSR_{pattern}{i}")
