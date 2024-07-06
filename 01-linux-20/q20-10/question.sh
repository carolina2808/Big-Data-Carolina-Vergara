##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual el nombre  completo (fullname) del del dueño de la tarjeta 
##  3608-2596-5551-1068?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
##
#!/bin/bash

# Nombre completo que estamos buscando
#fullname='Sandy Bloodworth'

# Buscar el SSN correspondiente en el archivo person
#ssn=$(grep -i "$fullname" person | awk -F',' '{print $1}')

# Verificar si se encontró el SSN
#if [ -z "$ssn" ]; then
 # echo "No se encontró el SSN para $fullname"
 #exit 1
#fi

# Imprimir el SSN para verificar que se encontró correctamente
#echo "SSN encontrado: $ssn"

# Buscar el ID de la tarjeta correspondiente en el archivo bank.csv
#id=$(grep -i "$ssn" bank.csv | awk -F',' '{print $1}')

# Verificar si se encontró el ID de la tarjeta
#if [ -z "$id" ]; then
  #echo "No se encontró el ID de la tarjeta para el SSN $ssn"
  #exit 1
#fi

# Imprimir el ID de la tarjeta para verificar que se encontró correctamente
#echo "ID de tarjeta encontrado: $id"

# Mostrar el resultado final
#echo "$id"

#SSN encontrado: "238-51-1813"
#No se encontró el ID de la tarjeta para el SSN "238-51-1813"

#!/bin/bash

# SSN que estamos buscando
#ssn='238-51-1813'

# Buscar el fullname correspondiente en el archivo person
#fullname=$(grep -i "$ssn" person | awk -F',' '{gsub(/"/, "", $5); print $5}')

# Verificar si se encontró el fullname
#if [ -z "$fullname" ]; then
  #echo "No se encontró el fullname para $ssn"
 # exit 1
#fi

# Mostrar el resultado final
#echo "$fullname"

#!/bin/bash

# ID de la tarjeta que estamos buscando
id='3608-2596-5551-1068'

# Buscar el SSN correspondiente en el archivo bank.csv
ssn=$(grep -i "$id" bank.csv | awk -F',' '{print $2}')

# Buscar el nombre completo correspondiente en el archivo person
fullname=$(grep -i "$ssn" person | awk -F',' '{gsub(/"/, "", $5); print $5}')

# Imprimir el nombre completo
echo "$fullname"

