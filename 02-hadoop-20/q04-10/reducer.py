import sys



current_letter = None
current_count = 0

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en clave y valor
    letter, count = line.split('\t', 1)
    
    # Convertir el contador a entero
    count = int(count)
    
    # Si encontramos una nueva letra, imprimimos el contador acumulado
    if current_letter != letter:
        if current_letter is not None:
            print(f'{current_letter},{current_count}')
        current_letter = letter
        current_count = count
    else:
        current_count += count

# Imprimir la última letra y su contador acumulado
if current_letter is not None:
    print(f'{current_letter},{current_count}')

