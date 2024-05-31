import csv

def generate_bqsr(sample):
    sample_mapping = {
        'S58': 'VH17i',
        'S59': 'VH17f',
        'S60': 'VH17m',
        'VH60': 'VH11s',
        'VH61': 'VH11i',
        'VH63': 'VH11f',
        'VH71': 'VH16i',
        'VH72': 'VH16m',
        'VH73': 'VH16f',
        'VH77': 'VH01i',
        'VH78': 'VH01m',
        'VH79': 'VH01f',
    }
    return sample_mapping.get(sample, 'Unknown')

for i in ["melt","scramble","mobster"]:
    file = f'/gpfs42/projects/lab_genresearch/shared_data/ahirata/Results/exp_obs_gene_VHWES_{i}.csv'
    output_file = f"exp_obs_gene_VHWES_{i}_formated.csv"
    with open(file, 'r') as infile, open(output_file, 'w', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)
        header = next(reader)
        header.append("WES_tag")
        writer.writerow(header)
        for row in reader:
            sample = row[0]
            bqsr = generate_bqsr(sample)
            row.append(bqsr)
            writer.writerow(row)
'''import csv

def generate_bqsr(sample):
    sample_mapping = {
        'VH17i': 'S58',
        'VH17f': 'S59',
        'VH17m': 'S60',
        'VH11s': 'VH60',
        'VH11i': 'VH61',
        'VH11f': 'VH63',
        'VH16i': 'VH71',
        'VH16m': 'VH72',
        'VH16f': 'VH73',
        'VH01i': 'VH77',
        'VH01m': 'VH78',
        'VH01f': 'VH79',
    }
    return sample_mapping.get(sample, 'Unknown') 
file = '/gpfs42/projects/lab_genresearch/shared_data/ahirata/exp_obs_gene_VHWGS.csv'
with open(file, 'r') as infile, open('output_file.csv', 'w', newline='') as outfile:
    reader = csv.reader(infile)
    writer = csv.writer(outfile)
    header = next(reader)
    header.append("WES_tag")
    writer.writerow(header)
    for row in reader:
        sample = row[0]
        bqsr = generate_bqsr(sample)
        row.append(bqsr)
        writer.writerow(row)'''
