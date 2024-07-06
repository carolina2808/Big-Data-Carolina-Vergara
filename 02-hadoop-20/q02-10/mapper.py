import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

for row in sys.stdin:
  elementos = row.split(",")
  
  cantidad = elementos[4]
  purpose = elementos[3]
  linea = purpose + ";" + cantidad
  sys.stdout.write(linea+"\n")