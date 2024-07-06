import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<


for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en columnas
    columns = line.split()
    # Emitir el mes (extraído de la fecha) como clave y 1 como valor
    if len(columns) == 3:
        date = columns[1]
        month = date.split('-')[1]  # Extraer el mes
        print(f'{month}\t1')
