import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

current_category = None
max_value = -float('inf')
min_value = float('inf')

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en clave y valor
    category, value = line.split('\t', 1)
    
    # Convertir el valor a flotante para comparación
    value = float(value)
    
    # Si encontramos una nueva categoría, imprimimos los valores acumulados
    if current_category != category:
        if current_category is not None:
            print(f'{current_category}\t{max_value}\t{min_value}')
        current_category = category
        max_value = value
        min_value = value
    else:
        if value > max_value:
            max_value = value
        if value < min_value:
            min_value = value

# Imprimir la última categoría y sus valores acumulados
if current_category is not None:
    print(f'{current_category}\t{max_value}\t{min_value}')
