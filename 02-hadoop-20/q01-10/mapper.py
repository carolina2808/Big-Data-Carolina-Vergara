import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
## Leer líneas de la entrada estándar
# Leer líneas de la entrada estándar


import sys

class Mapper:

    def __init__(self, stream):
        self.stream = stream

    def emit(self, key, value):
        sys.stdout.write("{}\t{}\n".format(key, value))

    def status(self, message):
        sys.stderr.write('reporter:status:{}\n'.format(message))

    def counter(self, counter, amount=1, group="ApplicationCounter"):
        sys.stderr.write('reporter:counter:{},{},{}\n'.format(group, counter, amount))

    def map(self):
        word_counter = 0
        self.status('Iniciando procesamiento ')

        # Emitir la línea extra "credit_history\t1"
        self.emit("credit_history", 1)

        for i, line in enumerate(self.stream):
            if i == 0:
                continue  # Saltar el encabezado
            columns = line.strip().split(',')
            if len(columns) >= 20:  # Asegurarse de que hay suficientes columnas
                credit_history = columns[2]
                self.emit(key=credit_history, value=1)
                word_counter += 1
            else:
                self.status(f"Línea mal formateada o incompleta: {line}")

        self.counter('num_words', amount=word_counter)
        self.status('Finalizando procesamiento ')

    def __iter__(self):
        for line in self.stream:
            yield line

if __name__ == "__main__":
    mapper = Mapper(sys.stdin)
    mapper.map()
