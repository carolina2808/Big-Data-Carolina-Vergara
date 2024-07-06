-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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
SELECT key AS llave, COUNT(1) AS count
FROM t0 
LATERAL VIEW EXPLODE(c3) exploded_table AS key, value
GROUP BY key;
