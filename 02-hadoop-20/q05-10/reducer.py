import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<


current_month = None
current_count = 0

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en clave y valor
    month, count = line.split('\t', 1)
    
    # Convertir el contador a entero
    count = int(count)
    
    # Si encontramos un nuevo mes, imprimimos el contador acumulado
    if current_month != month:
        if current_month is not None:
            print(f'{current_month}\t{current_count}')
        current_month = month
        current_count = count
    else:
        current_count += count

# Imprimir el último mes y su contador acumulado
if current_month is not None:
    print(f'{current_month}\t{current_count}')

