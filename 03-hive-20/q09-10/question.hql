-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne la columna `tbl0.c1` y el valor 
-- correspondiente de la columna `tbl1.c4` para la columna `tbl0.c2`.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 STRING, 
    c6 STRING
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Cargar los datos en la tabla tbl0
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;

-- Crear la tabla para tbl1.csv si no existe
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';

-- Cargar los datos en la tabla tbl1
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;

-- Unir las tablas tbl0 y tbl1 basándonos en el índice de las filas
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT tbl0.c1, tbl0.c2, tbl1.c4[tbl0.c2]
FROM tbl0
JOIN tbl1 ON tbl0.c1 = tbl1.c1
ORDER BY tbl0.c1;