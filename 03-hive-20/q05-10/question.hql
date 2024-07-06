-- 
-- Pregunta
-- ===========================================================================
--
-- Realice una consulta que compute la cantidad de veces que aparece cada valor 
-- de la columna `t0.c5`  por año.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    id INT,
    col1 STRING,
    col2 INT,
    col3 STRING,
    col4 STRING,
    col5 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':';

-- Cargar los datos en la tabla
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;

-- Crear una tabla temporal para explotar las letras y extraer el año de la fecha
DROP TABLE IF EXISTS exploded_tbl0;
CREATE TABLE exploded_tbl0 AS
SELECT
    id,
    col1,
    col2,
    year(col3) AS year,
    col4,
    col5,
    letter
FROM tbl0
LATERAL VIEW explode(split(col4, ':')) exploded_table AS letter;

-- Contar las apariciones de cada letra por cada año
DROP TABLE IF EXISTS letter_counts;
CREATE TABLE letter_counts AS
SELECT
    year,
    letter,
    COUNT(*) AS count
FROM exploded_tbl0
GROUP BY year, letter
ORDER BY year, letter;

-- Exportar el resultado a la carpeta output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT
    year,
    letter,
    count
FROM letter_counts;
