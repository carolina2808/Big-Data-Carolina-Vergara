##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'quota' del archivo 'data.csv' para el 
##  ultimo registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash
file="data.csv"
columna=5
dato=$(awk -F',' -v col="$columna" 'END {print $col}' "$file"| tr -d '"')
echo "$dato"