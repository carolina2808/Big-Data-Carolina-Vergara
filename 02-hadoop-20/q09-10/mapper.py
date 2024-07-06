import sys

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en columnas
    columns = line.split()
    # Emitir el valor como clave y la categoría y la fecha como valor
    if len(columns) == 3:
        category = columns[0]
        date = columns[1]
        value = int(columns[2])
        print(f'{value}\t{category}\t{date}')

