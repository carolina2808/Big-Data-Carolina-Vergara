##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual el nombre  completo (fullname) del del dueño de la tarjeta 
##  3608-2181-4994-1181?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

# ID de la tarjeta que estamos buscando
ccn='3608-2181-4994-1181'

# Buscar el SSN correspondiente en el archivo bank.csv
ssn=$(grep -i "$ccn" bank.csv | awk -F',' '{print $2}')

# Verificar si se encontró el SSN
if [ -z "$ssn" ]; then
  echo "No se encontró el SSN para $ccn"
  exit 1
fi

# Buscar el fullname correspondiente en el archivo person
fullname=$(grep -i "$ssn" person | awk -F',' '{gsub(/"/, "", $5); print $5}')

# Verificar si se encontró el fullname
if [ -z "$fullname" ]; then
  echo "No se encontró el fullname para $ssn"
  exit 1
fi

# Mostrar el resultado final
echo "$fullname"
