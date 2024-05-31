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

for i in range(1, 18):
    file_patterns = ['s', 'f', 'm', 'i']  
    for pattern in file_patterns:
        number = f"0{i}" if i < 10 else str(i)
        input_file = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/VH{number}{pattern}/Results/Final_VH{number}{pattern}.tsv"
        if os.path.exists(input_file):
            output_file = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/SCRAMble_results/VH/VH{number}{pattern}/Results/Final_VH{number}{pattern}.toannot.tsv"
            process_file(input_file, output_file)
            print(f"Done for VH{number}{pattern}")
