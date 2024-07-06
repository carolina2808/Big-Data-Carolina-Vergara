-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne unicamente la columna t0.c5 con sus 
-- elementos en mayuscula.
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

-- Crear una tabla temporal con la columna 5 en mayúsculas
DROP TABLE IF EXISTS uppercase_tbl0;
CREATE TABLE uppercase_tbl0 AS
SELECT
    id,
    col1,
    col2,
    col3,
    col4,
    UPPER(col4) AS col4_upper,
    col5
FROM tbl0;

-- Exportar el resultado a la carpeta output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT
    col4_upper
FROM uppercase_tbl0;

