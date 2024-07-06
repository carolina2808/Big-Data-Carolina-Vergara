##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantos registros hay en el archivo 'person' para city = 'New York (New York)'?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

#!/bin/bash

# Define the file and the city to search for
file="person"
city="New York (New York)"

# Use awk to filter and count the records where the city matches
count=$(awk -F',' -v city="$city" '$3 == "\""city"\"" {count++} END {print count}' "$file")

# Print the result
echo $count