-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne la primera columna, la cantidad de 
-- elementos en la columna 2 y la cantidad de elementos en la columna 3
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<

DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (
    c1 STRING,
    c2 ARRAY<CHAR(1)>, 
    c3 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
    FIELDS TERMINATED BY '\t'
    COLLECTION ITEMS TERMINATED BY ','
    MAP KEYS TERMINATED BY '#'
    LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE t0;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED 
    FIELDS TERMINATED BY ','
SELECT c1, size(c2) AS num_elements_c2, size(c3) AS num_elements_c3
FROM t0;


