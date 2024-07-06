import sys

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en columnas
    columns = line.split()
    # Emitir la categoría como clave y el valor de la tercera columna como valor
    if len(columns) == 3:
        category = columns[0]
        value = columns[2]
        print(f'{category}\t{value}')


