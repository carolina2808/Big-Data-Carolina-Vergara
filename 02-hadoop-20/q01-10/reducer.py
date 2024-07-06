import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
##
## Esta funcion reduce los elementos que
## tienen la misma clave




import sys

current_history = None
current_count = 0
history = None

for line in sys.stdin:
    parts = line.strip().split('\t')
    if len(parts) != 2:
        sys.stderr.write(f"Línea mal formateada o incompleta: {line}\n")
        continue

    history, count = parts
    count = int(count)

    if current_history == history:
        current_count += count
    else:
        if current_history:
            print(f"{current_history}\t{current_count}")
        current_history = history
        current_count = count

if current_history == history:
    print(f"{current_history}\t{current_count}")
