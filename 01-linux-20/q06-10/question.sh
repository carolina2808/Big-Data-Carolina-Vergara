##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'key' del archivo 'data.csv' para el 
##  ultimo registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
#!/bin/bash
file="data.csv"
fila=30
columna=1

dato=$(awk -F',' -v fila="$fila" -v col="$columna" 'NR==fila {print $col}' "$file" | tr -d '"')

echo $dato