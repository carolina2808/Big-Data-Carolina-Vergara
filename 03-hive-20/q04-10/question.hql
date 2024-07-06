-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne los valores únicos de la columna `t0.c5` 
-- (ordenados). 
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

-- Seleccionar y explotar los valores únicos en la columna `col4`
DROP TABLE IF EXISTS exploded_tbl0;
CREATE TABLE exploded_tbl0 AS
SELECT id, col1, col2, col3, col5, letter
FROM tbl0
LATERAL VIEW explode(split(col4, ':')) exploded_table AS letter;

-- Crear una tabla con las letras únicas ordenadas
DROP TABLE IF EXISTS unique_letters;
CREATE TABLE unique_letters AS
SELECT DISTINCT letter
FROM exploded_tbl0
ORDER BY letter;

-- Exportar el resultado a la carpeta output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\n'
SELECT letter
FROM unique_letters;