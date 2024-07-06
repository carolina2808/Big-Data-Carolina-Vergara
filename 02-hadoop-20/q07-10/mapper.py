import sys

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en columnas
    columns = line.split()
    # Emitir la categoría como clave y el resto de la línea como valor
    if len(columns) == 3:
        category = columns[0]
        rest_of_line = '\t'.join(columns[1:])
        print(f'{category}\t{rest_of_line}')
