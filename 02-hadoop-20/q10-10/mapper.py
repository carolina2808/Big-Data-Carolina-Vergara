import sys

for line in sys.stdin:
    # Obtener el índice de la línea
    index, letters = line.strip().split('\t', 1)
    # Dividir las letras por comas
    letters = letters.split(',')
    # Emitir cada letra con el índice de la línea
    for letter in letters:
        print(f'{letter}\t{index}')
