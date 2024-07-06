import sys
from collections import defaultdict

# Diccionario para almacenar los índices de cada letra
letter_indices = defaultdict(list)

for line in sys.stdin:
    # Eliminar espacios en blanco
    line = line.strip()
    # Dividir la línea en letra e índice
    letter, index = line.split('\t', 1)
    # Agregar el índice a la lista correspondiente de la letra
    letter_indices[letter].append(int(index))

# Emitir los resultados ordenados alfabéticamente por letra y por índice
for letter in sorted(letter_indices.keys()):
    sorted_indices = sorted(letter_indices[letter])
    indices = ','.join(map(str, sorted_indices))
    print(f'{letter}\t{indices}')
