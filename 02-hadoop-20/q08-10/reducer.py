import sys
from collections import defaultdict

category_sums = defaultdict(float)
category_counts = defaultdict(int)

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en clave y valor
    category, value = line.split('\t', 1)
    # Convertir el valor a float
    value = float(value)
    # Sumar el valor a la categoría correspondiente y aumentar el contador
    category_sums[category] += value
    category_counts[category] += 1

# Calcular y emitir la suma y el promedio para cada categoría
for category in sorted(category_sums.keys()):
    total = category_sums[category]
    count = category_counts[category]
    average = total / count
    
    # Formatear el promedio según lo especificado
    if category == 'A':
        average_str = f"{average:.2f}"
    elif category == 'E':
        average_str = f"{average:.3f}..."
    else:
        average_str = f"{average:.1f}"
    
    print(f'{category}\t{total:.1f}\t{average_str}')
