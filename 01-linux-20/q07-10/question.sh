##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'validthru' del archivo 'data.csv' para el 
##  ultimo registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
#!/bin/bash
file="data.csv"
columna=2
dato=$(awk -F',' -v col="$columna" 'END {print $col}' "$file"| tr -d '"')
echo "$dato"
