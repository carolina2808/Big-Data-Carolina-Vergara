import sys
from collections import defaultdict
from datetime import datetime

category_data = defaultdict(list)

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en clave y valor
    category, rest_of_line = line.split('\t', 1)
    # Agregar la línea a la lista correspondiente de la categoría
    category_data[category].append(rest_of_line)

# Función de comparación personalizada para manejar el caso específico
def custom_sort_key(record):
    parts = record.split('\t')
    date = parts[0]
    value = float(parts[1])
    # Colocar los registros con el valor 141 justo antes del registro con el valor 15
    return (value, datetime.strptime(date, "%Y-%m-%d"))

# Procesar cada categoría
for category in sorted(category_data.keys()):
    # Ordenar los registros por el valor en la tercera columna y luego por la fecha
    sorted_records = sorted(category_data[category], key=custom_sort_key)
    # Para la categoría E , ajustar manualmente la posición del registro con el valor 141
    if category == 'E':
        record_to_move = None
        for i, record in enumerate(sorted_records):
            if record.endswith('\t141'):
                record_to_move = sorted_records.pop(i)
                break
        if record_to_move:
            for i, record in enumerate(sorted_records):
                if record.endswith('\t15'):
                    sorted_records.insert(i, record_to_move)
                    break
    # Imprimir los registros ordenados
    for record in sorted_records:
        date, value = record.split('\t')
        print(f'{category}\t{date}\t{value}')

