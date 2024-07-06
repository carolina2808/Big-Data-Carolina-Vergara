import sys

# Lista para almacenar los registros
records = []

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en valor, categoría y fecha
    parts = line.split('\t')
    value = int(parts[0])
    category = parts[1]
    date = parts[2]
    # Agregar el registro a la lista
    records.append((value, category, date))

# Ordenar los registros por valor ascendente y seleccionar los seis menores valores
sorted_records = sorted(records)[:6]

# Imprimir los resultados ordenados
for value, category, date in sorted_records:
    print(f'{category}\t{date}\t{value}')

