##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantas personas tienen 'AA' como iniciales de su nombre?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

archivo="person"
patron="\"[Aa][A-Za-z]* [Aa][A-Za-z]*\""
contador=$(grep -E "$patron" "$archivo" | wc -l)
echo $contador