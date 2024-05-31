import csv

def check_gene_expression(data):
    results = []

    complete_families = set()
    for row in data:
        sample = row[9]
        family_key = sample[:4]
        if sample.endswith(('f', 'm', 'i')):
            complete_families.add(family_key)

    for family_key in complete_families:
        father_genes = set()
        mother_genes = set()
        individual_genes = set()

        for row in data:
            sample = row[9]
            gene_name = row[6]
            if sample.startswith(family_key):
                if sample.endswith('f'):
                    father_genes.add(gene_name)
                elif sample.endswith('m'):
                    mother_genes.add(gene_name)
                elif sample.endswith('i'):
                    individual_genes.add(gene_name)


        if father_genes and mother_genes and individual_genes:
            for gene_name in individual_genes:
                if (gene_name not in father_genes) and (gene_name not in mother_genes):
                    results.append((family_key, gene_name, 'De novo mutation'))

    return results

def main():
    input_file = '/home/akira-hirata/Comparisons/de_novo/exp_obs_gene_VHWES_mobster_formated.csv'
    output_file = '/home/akira-hirata/Comparisons/de_novo/de_novo_VHWES_mobster.csv'

    with open(input_file, 'r') as csvfile:
        reader = csv.reader(csvfile)
        next(reader) 
        data = list(reader)

    results = check_gene_expression(data)

    with open(output_file, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Family', 'Gene', 'Expression'])
        writer.writerows(results)

    print(f"Results written to {output_file}")

if __name__ == "__main__":
    main()
