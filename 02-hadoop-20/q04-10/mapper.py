import sys
#


for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en columnas
    columns = line.split()
    # Emitir la letra (primera columna) como clave y 1 como valor
    if len(columns) == 3:
        print(f'{columns[0]}\t1')



