import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#


for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en columnas
    columns = line.split(',')
    # Emitir la segunda columna como clave y la línea completa como valor
    if len(columns) == 2:
        print(f'{columns[1]}\t{line}')
