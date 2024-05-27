with open("IEI.txt", "r") as file:
    contents = file.read().splitlines()
formatted_contents = ',\n'.join(['"' + element + '"' for element in contents])
with open("IEI_formated.txt", "w") as file:
    file.write(formatted_contents)