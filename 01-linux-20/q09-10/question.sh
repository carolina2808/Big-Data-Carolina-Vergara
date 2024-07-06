##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'ccn' del archivo 'data.csv' para el 
##  registro 10?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash
file="data.csv"
columna=1
dato=$(awk -F',' -v col="$columna" '{if (NR==11)  print $col}' "$file" | tr -d '"')
echo "$dato"
