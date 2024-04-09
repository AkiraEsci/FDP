import csv
import os
#Here we are working with the tsv files generated from the MELT + AnnotSV run

n = 45 #Number of samples you have or the tagged number
final = []

for i in range(1, n+1):
    file_patterns = ['S', 'VH'] #If it has different tag patterns you can store them here
    for pattern in file_patterns:
        file_path = f"/gpfs42/projects/lab_genresearch/shared_data/ahirata/MELT_results/BQSR/BQSR_{pattern}{i}/MEfinal_{pattern}{i}.annotated.tsv" #Path to files
        print(file_path) #To assure has gone through the paths
        if os.path.exists(file_path): #This is in case some of the paths don't exist, just omit it
            with open(file_path) as annotation: #Open the file
                for record in annotation:
                    columns = record.strip().split('\t') #Generate a list of list to access easier the data
                    if (columns[5] != 'SV_type') and (columns[11] in ["PASS","lc","hDP"]): #Select the column where the ME tag is and skip the header and select the filter type
                        final.append([f"{i}" if pattern == 'S' else f"VH{i}", columns[5], columns[14],columns[16],columns[0],columns[11],columns[2],columns[3]]) #Final list where we will store the elements selected in a new file

output_file = 'BQSR_extra_final.csv'
#Open a new file to store the information you want.
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Sample", "Type", "Info","Gene_name","Location","Filter", "Start", "End"])
    writer.writerows(final)

print(f"Results written in {output_file}") #Assure the file has been generated

