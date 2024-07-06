import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<


for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en clave y valor
    key, value = line.split('\t', 1)
    # Imprimir el valor (la línea completa)
    print(value)



        
    