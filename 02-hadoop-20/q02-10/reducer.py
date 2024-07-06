import sys
dict = {}
max =  0
for row in sys.stdin:
  linea = row.strip()
  linea = linea.split(";")
  if linea[0] in dict.keys():
    if int(linea[1]) > dict[linea[0]]:
      dict[linea[0]] = int(linea[1])
    else:
      continue
  else:
    dict[linea[0]] = int(linea[1])
for i in dict.keys():
   letra = i
   line =  letra + "\t" + str(dict[i]) + "\n"
   sys.stdout.write(line)