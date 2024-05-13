input_file = f"allhg19"
output_file = f"allhg19_formated.txt"
with open(input_file, "r") as infile, open(output_file, "w") as outfile:
    header = next(infile)
    outfile.write(header)
    for line in infile:
        columns = line.strip().split("\t")
        exon_starts = [int(start) for start in columns[8].split(",") if start.strip()]
        exon_ends = [int(end) for end in columns[9].split(",") if end.strip()]
        gene_symbol = columns[11]
        for i, (start, end) in enumerate(zip(exon_starts, exon_ends), start=1):
            new_line = "\t".join(columns[:8]) + f"\t{start}\t{end}\t{gene_symbol}\texon {i}\n"
            outfile.write(new_line)

