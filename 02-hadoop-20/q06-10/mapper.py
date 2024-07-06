import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<


for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en columnas
    columns = line.split()
    # Emitir la categoría como clave y el valor de la tercera columna como valor
    if len(columns) == 3:
        print(f'{columns[0]}\t{columns[2]}')
